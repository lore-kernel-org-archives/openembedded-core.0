Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TyUGd-0000rX-2k
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 22:23:31 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa10so5752258pad.34
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2013 13:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=INXD08WaHKXYJYCgdgTQmcEQNdjUbpklOE6/WZ6ESew=;
	b=TKn08CK/nJXJg+dIJMi3tnG5BvFcVIgld2/gD/qtr8awPilXM7dI4PbgrNxoTTAvHo
	+wT/FSIdQ03NowP6megzVXNL3Ii5956Sm8xnadWCwRs/h5YSwc2bZcX+zVI7Jz667wwi
	UWwDKKGJWwN4wmOXWrhJuizX3Sf3xnBiqXCmgStVVUQNTF2zs8r3VUYDnmO8eM/l/HD4
	GXbRntwa3F8vyymWG+b9M7LKLcCDJAtrjLTxj4IaEhqEIP/45OVDx8GNPrffHvwRGEsQ
	+zhmn0ng3b7zeVzW+12zW9DZFrkrwCk/xev/UgNCO8vc0EoiwpPBp0Yn93UrvduSiB8T
	9pWw==
X-Received: by 10.69.0.199 with SMTP id ba7mr8357703pbd.165.1359061673219;
	Thu, 24 Jan 2013 13:07:53 -0800 (PST)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id vn2sm15484022pbc.31.2013.01.24.13.07.52
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 24 Jan 2013 13:07:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Jan 2013 13:07:27 -0800
Message-Id: <45571588d782a288bde39e2e6c19b8306e9e6625.1359061155.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <2ba0f6007c1a72e2ee249a47610003031f6c1079.1359061155.git.raj.khem@gmail.com>
References: <2ba0f6007c1a72e2ee249a47610003031f6c1079.1359061155.git.raj.khem@gmail.com>
In-Reply-To: <cover.1359061155.git.raj.khem@gmail.com>
References: <cover.1359061155.git.raj.khem@gmail.com>
Subject: [PATCH 06/11] icu: Fix build on uclibc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Jan 2013 21:23:32 -0000

_timezone is not implemented in uclibc therefore
bypass it.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/icu/icu.inc |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/icu/icu.inc b/meta/recipes-support/icu/icu.inc
index 1329635..64b3edf 100644
--- a/meta/recipes-support/icu/icu.inc
+++ b/meta/recipes-support/icu/icu.inc
@@ -11,6 +11,7 @@ STAGING_ICU_DIR_NATIVE = "${STAGING_DATADIR_NATIVE}/${BPN}/${PV}"
 
 PARALLEL_MAKE = ""
 FULL_OPTIMIZATION_arm = "-Os"
+CPPFLAGS_append_libc-uclibc = " -DU_TIMEZONE=0"
 
 inherit autotools pkgconfig binconfig
 
-- 
1.7.9.5



