Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 5CBE565CAF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Dec 2014 11:27:19 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id h11so8268161wiw.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Dec 2014 03:27:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=0mG1hxW1BFksIP5vRybrBpWF8eyJV+3bDCtDuroKQD8=;
	b=ZI3ve3j9g0xgMK7d+IMF6Hu666bkFY3QlXVNbMwX6prjjia9HvjsE5tgU/wET+i8yX
	krbFnFM6QBBWbEn8vBwRJqB+241VJIvdfn9bdIwzl5tpjrgg0+wKoIj+bkTp+5clm81x
	Yq7qu1xv7FmnMsghExjJ4TXvCAYPw4PUuT4SFuvBB9c+2r2YBRwPi4GhLn0tRtv9FNfs
	+B2I6e6/YZNeZOLffdkFFgyZOp/OpCX7iEJZYD1/iNTyPJva2pMpY0FowxX8w0eO3V3b
	lM9Ibf+o38iytBl/jNXaHbKiSH+Mau4QxiwYag51J0TCAyEGwyCtpTF9M3GxwBdsMNYx
	jQ3w==
X-Gm-Message-State: ALoCoQlV5/zqurgGoGhuioU2Ou0+A/Q41UeaQKXRR0NFLMtYH83RQxRdX/OSbUAN9GRe44gSY1Pc
X-Received: by 10.180.85.198 with SMTP id j6mr14637013wiz.23.1418297239873;
	Thu, 11 Dec 2014 03:27:19 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id jr4sm1308557wjc.20.2014.12.11.03.27.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Dec 2014 03:27:19 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Dec 2014 11:26:37 +0000
Message-Id: <1418297198-12636-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/2] gst-plugins: remove spurious whitespace
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
X-List-Received-Date: Thu, 11 Dec 2014 11:27:20 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/gstreamer/gst-plugins.inc |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins.inc b/meta/recipes-multimedia/gstreamer/gst-plugins.inc
index 2697609..c852c53 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins.inc
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins.inc
@@ -19,10 +19,10 @@ require gst-plugins-package.inc
 PACKAGES_DYNAMIC += "^${PN}-.*"
 
 # apply gstreamer hack after Makefile.in.in in source is replaced by our version from
-# ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in, but before configure is executed 
+# ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in, but before configure is executed
 # http://lists.linuxtogo.org/pipermail/openembedded-core/2012-November/032233.html
-oe_runconf_prepend() {                                                                                                                                      
+oe_runconf_prepend() {
 	if [ -e ${S}/po/Makefile.in.in ]; then
 		sed -i -e "1a\\" -e 'GETTEXT_PACKAGE = @GETTEXT_PACKAGE@' ${S}/po/Makefile.in.in
 	fi
-}                                                                                                                                                           
+}
-- 
1.7.10.4


