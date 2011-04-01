Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5W2E-0005BA-Ek
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Apr 2011 06:32:34 +0200
Received: by mail-iw0-f175.google.com with SMTP id 10so3432253iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2011 21:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=2HBUN/uQAy/QJlT4zbO5E5guxNh45TsmoexwnAyPXuU=;
	b=FtHiFPSafNLU6hp48ftQxQxg/trOMt/VprHAjPTaBn0EawcjVT5b7wvbcJumxtBjlN
	UdnMAZe149t+ip0gloJcwq4E1NBMAoCWEBn/Mi+TyOISCYEc/TrCZVJFut+cqlD7t+1k
	gFFcByBcgRezYdUiIi2KcU/UF3405xr1lnypA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=OeKwLWQGPh/ynXsjP3paT1kMF96ipYDNYMiXYKVEYzLfZeMOF607i9Th2jdDbeM8gO
	MiP7PkAChuxpFv1hje3jQUEx3Kuonrn4tyKV5WcN1oSwaxvMEW+wLjDfeii91EahOjTN
	DGFhGfN94IxXSugG1FTvNhSbcQGHJDx0hjq0c=
Received: by 10.42.163.138 with SMTP id c10mr4760007icy.269.1301632235763;
	Thu, 31 Mar 2011 21:30:35 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id uk4sm1037148icb.21.2011.03.31.21.30.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 21:30:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Mar 2011 21:30:27 -0700
Message-Id: <37c35e1a824410556606e6c632b8914fc2d7d3b6.1301631488.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301631488.git.raj.khem@gmail.com>
References: <cover.1301631488.git.raj.khem@gmail.com>
Subject: [PATCH 41/46] util-macros_1.11.0.bb: inherit gettext class instead of adding gettext to DEPENDS directly
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Apr 2011 04:32:34 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../xorg-util/util-macros_1.11.0.bb                |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/xorg-util/util-macros_1.11.0.bb b/meta/recipes-graphics/xorg-util/util-macros_1.11.0.bb
index e2c558c..765a577 100644
--- a/meta/recipes-graphics/xorg-util/util-macros_1.11.0.bb
+++ b/meta/recipes-graphics/xorg-util/util-macros_1.11.0.bb
@@ -11,7 +11,7 @@ PE = "1"
 PR = "r0"
 
 # ${PN} is empty so we need to tweak -dev and -dbg package dependencies
-DEPENDS = "gettext libgpg-error"
+DEPENDS = "libgpg-error"
 DEPENDS_virtclass-native = "gettext"
 DEPENDS_virtclass-nativesdk = "gettext"
 
-- 
1.7.4.1



