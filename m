Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f173.google.com (mail-ob0-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id 2DC7F73187
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 15:59:19 +0000 (UTC)
Received: by mail-ob0-f173.google.com with SMTP id no2so35419461obc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 07:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9Jkw5OA5xITCpwnXppSlbUdsrBCOlYbmar6Vo2/13es=;
	b=UGS6JWsEFdr6YWj7SNEtxlV3yaKSJTk3bKyUrTKgS0GZcKfWZAp7C2oYepqCr5Bzws
	cO2Rf3nY9/C449IarDKHAYgpE4S9hq3txcHHObG2gPdwITOW00l1gWT3kkGC/vP57en3
	asisYnszCIXv2L0ijq5B5CXFsOfJXKSUagOcvyfCCKUf3mY/tQT4V/Kgske9uJH7O0JO
	DYBnK/Oj8hpSFraosCUvSvATbIVb+gwegAXpOKAz2CZo8vgSmocRsy88abmxc3xDBiHl
	3bNi1pbeMTdaJO4nheygTCTcadDTAtyJq0KoxXf2UDMpb/A3wMidfSLXJHL0W5F/g9Au
	QgYQ==
X-Received: by 10.182.81.162 with SMTP id b2mr34944142oby.7.1450281560439;
	Wed, 16 Dec 2015 07:59:20 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	kw1sm2476980obb.28.2015.12.16.07.59.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 16 Dec 2015 07:59:19 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Dec 2015 07:59:03 -0800
Message-Id: <1450281543-9320-4-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1450281543-9320-1-git-send-email-armccurdy@gmail.com>
References: <1450281543-9320-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 3/3] gcc-configure-common.inc: add gcc-runtime ABI fixes for armv7m and armv7r
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Dec 2015 15:59:20 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-configure-common.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index cee6f4a..45b3f15 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -72,6 +72,8 @@ EXTRA_OECONF_append_mips64eln32 = " --with-abi=64 --with-arch-64=mips64 --with-t
 # features used in OE.
 EXTRA_OECONF_append_armv6 = " --with-arch=armv6"
 EXTRA_OECONF_append_armv7a = " --with-arch=armv7-a"
+EXTRA_OECONF_append_armv7m = " --with-arch=armv7-m"
+EXTRA_OECONF_append_armv7r = " --with-arch=armv7-r"
 
 EXTRA_OECONF_GCC_FLOAT ??= ""
 CPPFLAGS = ""
-- 
1.9.1


