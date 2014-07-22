Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f174.google.com (mail-we0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id 540E770793
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 18:38:31 +0000 (UTC)
Received: by mail-we0-f174.google.com with SMTP id x48so53576wes.33
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 11:38:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=1pAaftp7I4q5P3vhEv+X1NReDtmW7aI8qhmpzhZfg74=;
	b=eMztlK4KUwCIPUbwP4SgNjQaSX2UN9tqvfPTC7riWhk1QrWeviTxkR1h55bZVTpyWg
	rJbaUZTGeAarYwLBlc9aFPy/gf+a02Df6m8Z/yHfGJ9kRpd46+oYj4iH/GACxqFN3ktG
	Bu2XLX4PBDeu00f7u+EeXOjfJR7xDB8O0oJrxkzY4l3MWZsCIX/4A+4ZGMo5No/E4ZEK
	Pn9i4DM/jbca89EKhHOPa4Gnh1mYFmBtGlL9dysdpLQvt/qNke0FLZihoB8AYmtp6vZN
	rxeyFmMX9UZhPiNR1ocjtrYob4GpMBOJ4gNItoWbwxYcUZiFOekdY+2HZh6Ig0ffijzh
	b/SA==
X-Gm-Message-State: ALoCoQn1UsciBQA94L0WPwL3rMsr8ZRJUR0I0f+fdGrLVh09FhllrM10ack76EaDhzaQ4j2lhRSA
X-Received: by 10.180.82.166 with SMTP id j6mr17219454wiy.71.1406054312485;
	Tue, 22 Jul 2014 11:38:32 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id jy8sm2847638wjc.7.2014.07.22.11.38.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Jul 2014 11:38:31 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Jul 2014 19:38:13 +0100
Message-Id: <1406054301-9027-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1406054301-9027-1-git-send-email-ross.burton@intel.com>
References: <1406054301-9027-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 03/11] inputproto: upgrade to 2.3.1
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
X-List-Received-Date: Tue, 22 Jul 2014 18:38:34 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../xorg-proto/{inputproto_2.3.bb => inputproto_2.3.1.bb}         |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-proto/{inputproto_2.3.bb => inputproto_2.3.1.bb} (77%)

diff --git a/meta/recipes-graphics/xorg-proto/inputproto_2.3.bb b/meta/recipes-graphics/xorg-proto/inputproto_2.3.1.bb
similarity index 77%
rename from meta/recipes-graphics/xorg-proto/inputproto_2.3.bb
rename to meta/recipes-graphics/xorg-proto/inputproto_2.3.1.bb
index a39ce49..7e8e0c1 100644
--- a/meta/recipes-graphics/xorg-proto/inputproto_2.3.bb
+++ b/meta/recipes-graphics/xorg-proto/inputproto_2.3.1.bb
@@ -16,6 +16,5 @@ inherit gettext
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "94db391e60044e140c9854203d080654"
-SRC_URI[sha256sum] = "7d26b193f6699f8e9c1e28bf026844b7ecea33dd644402523471be109152c32f"
-
+SRC_URI[md5sum] = "6caebead4b779ba031727f66a7ffa358"
+SRC_URI[sha256sum] = "5a47ee62053a6acef3a83f506312494be1461068d0b9269d818839703b95c1d1"
-- 
1.7.10.4


