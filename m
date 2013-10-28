Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 10AA56D2CE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 14:33:38 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id ex4so1563144wid.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 07:33:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=pdPSaU3Zal2iH7aO5Lsi0TbH8UgOK39ws7/tjTHnicw=;
	b=ivGifwo0++0HLH1r77gQvERA9HodkIt3wNMnlOtCkvQII0EB0iQt8rAAYlhy/ubwrZ
	dOLFzl4krgib960+/I46J7jyeJ2TM66Jwi4nyvKzHxcPrx++FFWoYVudXDj2hNeJoUKA
	Uu6b6vTe1461l5DW8bF5Ou/6W7BxnRG4/YtYwFizk4BYTe89pUTpO3h5+9OyC7U9XMdj
	ScAqiDc5JB4cJ8COu52zMsBbpE9h6nXfsD/CJLuilh8ZZUaWZ7T1neN2aTOZJoN+U/A7
	Ycn8KQrIRWG1ncnbQSYY6f9wiCvBiRyFqzhyPhLHJGP/h2GVz9aqUsA5sCfZSIHD//6o
	prmA==
X-Gm-Message-State: ALoCoQng+ZnmIlzTrbyz+RAR5+mQVIaSwS+Q5ho1OQQ+v75aabWhoPefxLQuwIASf5MPmNm3fPCN
X-Received: by 10.180.39.212 with SMTP id r20mr9370533wik.13.1382970820513;
	Mon, 28 Oct 2013 07:33:40 -0700 (PDT)
Received: from flashheart.burtonini.com (188.29.164.71.threembb.co.uk.
	[188.29.164.71])
	by mx.google.com with ESMTPSA id fr4sm36349149wib.0.2013.10.28.07.33.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Oct 2013 07:33:39 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Oct 2013 14:33:16 +0000
Message-Id: <1382970798-13574-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1382970798-13574-1-git-send-email-ross.burton@intel.com>
References: <1382970798-13574-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 3/5] xorg-proto-common: set UNKNOWN_CONFIGURE_WHITELIST
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
X-List-Received-Date: Mon, 28 Oct 2013 14:33:39 -0000

This include adds configure options globally but not all X libraries support
them, so to avoid unknown-configure-option warnings add them to the whitelist.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-proto/xorg-proto-common.inc |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-proto/xorg-proto-common.inc b/meta/recipes-graphics/xorg-proto/xorg-proto-common.inc
index 856f4d8..4680d0e 100644
--- a/meta/recipes-graphics/xorg-proto/xorg-proto-common.inc
+++ b/meta/recipes-graphics/xorg-proto/xorg-proto-common.inc
@@ -14,7 +14,9 @@ S = "${WORKDIR}/${XORG_PN}-${PV}"
 DEPENDS = "util-macros"
 
 inherit autotools pkgconfig
-EXTRA_OECONF = "--with-fop=no --without-xmlto"
+EXTRA_OECONF = "--without-fop --without-xmlto"
+
+UNKNOWN_CONFIGURE_WHITELIST += "--without-fop --without-xmlto"
 
 # ${PN} is empty so we need to tweak -dev and -dbg package dependencies
 RDEPENDS_${PN}-dev = ""
-- 
1.7.10.4


