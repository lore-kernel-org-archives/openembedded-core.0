Received: from mail-we0-f170.google.com ([74.125.82.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U6LKN-0003Cv-Ea
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Feb 2013 14:27:47 +0100
Received: by mail-we0-f170.google.com with SMTP id z53so2937905wey.29
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2013 05:11:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=H0QPl670qXJFcF2gAzq3tbr5TsOkB6Aq54TrRakwhyE=;
	b=MzDpJVqPjcT73BPVeaUDXGdRsbu53H357TkL54L5vlRzJ7FIY2bc0ajpeui9oaG2Al
	ekbfYaTY4glcVTnSTYVZH3+1Dndz1d9PuZixj4abfZUQxoE2hh+P3jjK3RbQ77AIvEa4
	AvVvltKXZ5lXOy2b+qYyAvbim75dmB2eQYQgy8ayaISzYLB6R/dXYP6JHQwh977iqaDx
	3EftOjLEQJpdLzcVxAgscSDD+fr1QQv6WS0VIsAql45gzhRuYX/PLOJt1+ZGcKlHldEc
	rMkuyEf62F+d13CF16yjbi1W/Ptd68CheRxYOq60BKNL3FSlZKKtu8L+eL5nNJvKK2h0
	vBzA==
X-Received: by 10.194.83.105 with SMTP id p9mr4010611wjy.56.1360933903240;
	Fri, 15 Feb 2013 05:11:43 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id j4sm2923857wiz.10.2013.02.15.05.11.41
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 15 Feb 2013 05:11:42 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Feb 2013 13:09:21 +0000
Message-Id: <2ea6a8883fe2adfccd845bd94b10c5bf0b03bfe0.1360933659.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1360933659.git.ross.burton@intel.com>
References: <cover.1360933659.git.ross.burton@intel.com>
In-Reply-To: <cover.1360933659.git.ross.burton@intel.com>
References: <cover.1360933659.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmf0NXnxn6y61xqoaqpbpoQ67WAsgdpm9+uOSKJQsEk+LyRez552EEszKQxeHDnAuramLsK
Subject: [PATCH 4/4] xserver-xf86-config: empty generic xorg.conf
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
X-List-Received-Date: Fri, 15 Feb 2013 13:27:50 -0000

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



