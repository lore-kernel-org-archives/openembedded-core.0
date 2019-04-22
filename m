Return-Path: <akuster808@gmail.com>
Received: from mail-it1-f180.google.com (mail-it1-f180.google.com
	[209.85.166.180])
	by mail.openembedded.org (Postfix) with ESMTP id 2D56F7997D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 12:42:10 +0000 (UTC)
Received: by mail-it1-f180.google.com with SMTP id q14so10032801itk.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 05:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=eiMmG0PUbFHenB9RVpUkOteiwcXYY0h3T66Kxsa1P6k=;
	b=qTIhV5H30F4NxwRpClFG3q/q+JzAc0Gr9M93I3+kaVCj4EbEzOR2MRJb2tgj5aOhi9
	MF9+c27JQIOIJognYpXp4TtdxnhKejOPF514ihh6qREWvBdHJrl4WtzaRtNQ/yvuyvcw
	8zhw40x9trw5hk8uKL6xaHhTPaWgh84qhLQRZaSDzwEafONqM+owWJb8KCtMf1HuzXdw
	0qDcjEP+9ZyfrknBbUZlMbd8CSbcDcHgIAUAF49UwNzTFvrvvdqhGDRYRueg8Kvzat2q
	SVqudo3WQzcxWOzjSagcEm9z8ApluoerNpnVt08sfqxiMSS4ZNJV4FftKnJdAIXwMkgH
	YwNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=eiMmG0PUbFHenB9RVpUkOteiwcXYY0h3T66Kxsa1P6k=;
	b=MGvRw8YY5Tdhb4+AkTKjRwYRZPgn5505ouYTcuxF+/aen3fze1gGPSsVtsX4wb3QHK
	O3qjHSM4/V/r8jEpgtT+10HCk4dwU9LKaRbmBYK+RdW0jTU4K4hwgPdjNhAMokrTeir/
	XHhxShvlegOt/r6deipSgsnfLeAheBh/tRBUPm0EsL5jQC6Ss14XuJv6WvMXoKnoZIVo
	NTZq72awAvLVL539qHp32qKlCvqBy0gHf1IZ6cqovPz9vaKO8Hgh1Fy6U/5mF0Qq/89r
	QuUvAEYjU1No7p7RN6U0jK9Apils3nMGtJKmzo7qPrNIdpw3tuQMDKp/uok2Jr9XrkCB
	katw==
X-Gm-Message-State: APjAAAWsFxwTmQEGndYXcfTS3tuNx16Ywjl5VIIP2XNlrsIuOJdVK4Me
	83vDWy6Q2ZduMUcoLJLrlN3ItmJp
X-Google-Smtp-Source: APXvYqz2zPPs5oZKcktjwuFdicCuRmqzAXgZhrwh2o5Z5WXcbEX4h4pnNmr95nwybEaCeY5/jbfu0g==
X-Received: by 2002:a24:b60b:: with SMTP id g11mr13370704itf.114.1555936930997;
	Mon, 22 Apr 2019 05:42:10 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	(75-163-235-80.clsp.qwest.net. [75.163.235.80])
	by smtp.gmail.com with ESMTPSA id
	h133sm6173634itb.34.2019.04.22.05.42.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Apr 2019 05:42:10 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Apr 2019 06:41:54 -0600
Message-Id: <1555936919-19078-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1555936919-19078-1-git-send-email-akuster808@gmail.com>
References: <1555936919-19078-1-git-send-email-akuster808@gmail.com>
Subject: [QA][PATCH 2/7] manual qa/oe-core: remove packageconfig flag tests
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
X-List-Received-Date: Mon, 22 Apr 2019 12:42:10 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/manual/oe-core.json | 36 +-----------------------------------
 1 file changed, 1 insertion(+), 35 deletions(-)

diff --git a/meta/lib/oeqa/manual/oe-core.json b/meta/lib/oeqa/manual/oe-core.json
index d893d84..b3644af 100644
--- a/meta/lib/oeqa/manual/oe-core.json
+++ b/meta/lib/oeqa/manual/oe-core.json
@@ -69,40 +69,6 @@
   },
   {
     "test": {
-      "@alias": "oe-core.scripts.List_all_the_PACKAGECONFIG's_flags",
-      "author": [
-        {
-          "email": "yi.zhao@windriver.com",
-          "name": "yi.zhao@windriver.com"
-        }
-      ],
-      "execution": {
-        "1": {
-          "action": " Download the poky source and setup the environment. ",
-          "expected_results": ""
-        },
-        "2": {
-          "action": "Run \"../scripts/contrib/list-packageconfig-flags.py\" ",
-          "expected_results": "In step 2, will list available pkgs which have PACKAGECONFIG flags:  \nPACKAGE NAME (or RECIPE NAME)           PACKAGECONFIG FLAGS  \n==============================================================  \nalsa-tools-1.0.26.1                                         defaultval gtk+  \navahi-ui-0.6.31                                                defaultval python  \nbluez4-4.101                                                alsa defaultval pie  \n"
-        },
-        "3": {
-          "action": "Run \"../scripts/contrib/list-packageconfig-flags.py -f\" ",
-          "expected_results": "In step 3, will list available PACKAGECONFIG flags and all affected pkgs  \nPACKAGECONFIG FLAG       PACKAGE NAMES (or RECIPE NAMES)  \n====================================  \n3g                             connman-1.16  \n        \navahi                        cups-1.6.3  pulseaudio-4.0  \nbeecrypt                   rpm-5.4.9  rpm-native-5.4.9  \n"
-        },
-        "4": {
-          "action": "Run \"../scripts/contrib/list-packageconfig-flags.py -a\" ",
-          "expected_results": "In step 4, will list all pkgs and PACKAGECONFIG information:  \n==================================================  \ngtk+-2.24.18  \n/home/jiahongxu/yocto/poky/meta/recipes-gnome/gtk+/gtk+_2.24.18.bb  \nPACKAGECONFIG x11  \nPACKAGECONFIG[x11] --with-x=yes --with-gdktarget=x11,--with-x=no,${X11DEPENDS}  \nxf86-video-intel-2.21.9  \n/home/jiahongxu/yocto/poky/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.9.bb  \nPACKAGECONFIG None  \nPACKAGECONFIG[xvmc] --enable-xvmc,--disable-xvmc,libxvmc  \nPACKAGECONFIG[sna] --enable-sna,--disable-sna  \n"
-        },
-        "5": {
-          "action": "Run \"../scripts/contrib/list-packageconfig-flags.py -p\"   ",
-          "expected_results": "In step 5, will list pkgs with preferred version:  \nPACKAGE NAME (or RECIPE NAME)              PACKAGECONFIG FLAGS  \n===================================================  \nalsa-tools-1.0.26.1                                           defaultval gtk+  \navahi-ui-0.6.31                                                   defaultval python  \nbluez4-4.101                                                       alsa defaultval pie  \nbluez5-5.7                                                            alsa defaultval obex-profiles  \n\n\n\n "
-        }
-      },
-      "summary": "List_all_the_PACKAGECONFIG's_flags"
-    }
-  },
-  {
-    "test": {
       "@alias": "oe-core.bitbake.Test_bitbake_menuconfig",
       "author": [
         {
@@ -257,4 +223,4 @@
       "summary": "test_bitbake_sane_error_for_invalid_layer"
     }
   }
-]
\ No newline at end of file
+]
-- 
2.7.4


