Received: from mail-wi0-f174.google.com ([209.85.212.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U63H7-0005QS-94
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Feb 2013 19:12:25 +0100
Received: by mail-wi0-f174.google.com with SMTP id hi8so204845wib.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2013 09:55:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=H0QPl670qXJFcF2gAzq3tbr5TsOkB6Aq54TrRakwhyE=;
	b=Fiz7/zvEkKGqmwCBjggVEN0h2iUGb4fGCdMazwzf57dW9GtLxoxeykFftw/7KSbLDa
	jgn4Rwe9FFfOq7qVTlt31eHnGI5KClcBTz43DCwm97Ux8CV746CIlyRlNdqUWv+Elu1+
	hVEOL86s+S7qhUsLv9P4EEDWDRNTL48N/4VIsHsqhCVb8NDqxiy1dGCbOsX/vIV6+z7r
	HFaPwL8oLv08QIVSgA+gCmDe2c8y5mext0xh5dsnCr15yUq80KgDazrjdBfG0KYEypOb
	xIDbi5HyQwxDmtZMDmsLrd8sStbVJ1Lo4KSo3VgbLxHbOh7DiuaAD/mZ5rSoLLDeWvHW
	WO4A==
X-Received: by 10.194.76.37 with SMTP id h5mr40723777wjw.21.1360864510864;
	Thu, 14 Feb 2013 09:55:10 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id o8sm636905wix.7.2013.02.14.09.55.09
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 14 Feb 2013 09:55:10 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Feb 2013 17:52:52 +0000
Message-Id: <d6c444561597e8546a7ae39aaa14da578456ab7d.1360864224.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1360864224.git.ross.burton@intel.com>
References: <cover.1360864224.git.ross.burton@intel.com>
In-Reply-To: <cover.1360864224.git.ross.burton@intel.com>
References: <cover.1360864224.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQl+rkBg2umUXQtwcNpLJl+LsbKjQ1sIKOOFLMIzwj1570owOzFZR6GnMy85fWMlKmqiEN3K
Subject: [PATCH 3/3] xserver-xf86-config: empty generic xorg.conf
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
X-List-Received-Date: Thu, 14 Feb 2013 18:13:48 -0000

The idea of a generic xorg.conf is meaningless, especially when they specify the
"intel" driver.  Empty this file so that unless the BSP specifies it's own
xorg.conf, no xorg.conf file is installed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../xorg-xserver/xserver-xf86-config/xorg.conf     |   26 --------------------
 1 file changed, 26 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/xorg.conf b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/xorg.conf
index 9c3d490..e69de29 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/xorg.conf
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/xorg.conf
@@ -1,26 +0,0 @@
-
-Section "Device"
-    Identifier    "Intel Graphics Driver"
-    Driver        "intel"
-EndSection
-
-Section "Monitor"
-    Identifier    "Generic Monitor"
-    Option        "DPMS"
-EndSection
-
-Section "Screen"
-    Identifier    "Default Screen"
-    Device        "Intel Graphics Driver"
-    Monitor        "Generic Monitor"
-    DefaultDepth    24
-EndSection
-
-Section "ServerLayout"
-    Identifier    "Default Layout"
-    Screen        "Default Screen"
-EndSection
-
-Section "ServerFlags"
-    Option        "DontZap"  "0"
-EndSection
-- 
1.7.10.4



