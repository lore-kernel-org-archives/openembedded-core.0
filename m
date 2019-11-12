Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id C84D57FBDD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2019 04:33:56 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id q26so12391168pfn.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 20:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=RPn1uTk2zIp08z6VfPh7HaAIPpXvo5Av2Nok6MuKXKs=;
	b=GrqH9OF0I35mhnJqzrl7LIpi8F6CwNVgFrAmyaHOBCok1+sZD+Bkq76YBQ9XW/TyCW
	hQ/DAqYVnLcCKZpMIJV7mOkq9PSIyayuvYZKC+A48hVQUsxONcGq/eUvBAwb2pwgiJic
	OwdbCCpb5UjBuJDwvufdNM+Eoan6R8dMSBnNZgNFXym/c5qknzh3L1z9TLurDBwT7U0x
	IQM1pawIF6ZPfjpQMRBL7ft9qnDLI/4Qu4aBwh66cv72gAd2kFDYT4gx3T+Pc8ZKr9iX
	Pe43NiwTIGaD2NxgCeiiORookUcwyz/FYTVndrRTJ2r77KPB+j3AFbhqpKckIO9PQ8H4
	uisg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=RPn1uTk2zIp08z6VfPh7HaAIPpXvo5Av2Nok6MuKXKs=;
	b=VdEuyu8UnAMCvQjA8rS689ihfZ8DuAkL4oKcBOEgsLrX3/KQ9VlcSKYDQHZ03M5aZz
	mZ/N0py2DJoT5JprwvUqTrGyqSCut8ENegKT7fyAeRcSZ0DmgygZribNsAPN4eCHKZiU
	IGA+HwfFNaLqqJgcO2BhPB2Gt38zxamDTn5AOKupX7cmJsTM1GE6gIDWCKEtoNL/y2rl
	O74Zzxjf38CC9sG+YuqFJ9fVgs6Ctfcfw5aKJB+qH4NnFee8x8elnVSxviSOrqlflKtu
	f8mMbK97/78KTFfh6brHRwkFRkbBVcUb6KHxPn1wIvIigR3VYCcwVWz55RHzInXlx/sA
	SB+g==
X-Gm-Message-State: APjAAAUBojRPiEPDCWw1ZmruIqXxJS6iynmLKnzpQNrNAsOBoxroN7TN
	yQx6sBDOac+9zXxTbbqQfhrMGgWn
X-Google-Smtp-Source: APXvYqwIda/kk5eRATQt9TqvgwcPDvBJGKB8nQ1OTDG2pMm/Iwej1hhwh0hMlCzNWc6PSyJdERYD6g==
X-Received: by 2002:a62:ae09:: with SMTP id q9mr34058541pff.157.1573533237944; 
	Mon, 11 Nov 2019 20:33:57 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id
	q12sm5212109pgl.23.2019.11.11.20.33.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Nov 2019 20:33:57 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2019 20:33:37 -0800
Message-Id: <57e95177f001044bee32bfebe8fa42c865215a4a.1573532188.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573532188.git.akuster808@gmail.com>
References: <cover.1573532188.git.akuster808@gmail.com>
Subject: [PATCH 18/20] OEQA: remove manual PACKAGECONFIG_FLAGS tests
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
X-List-Received-Date: Tue, 12 Nov 2019 04:33:58 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/manual/oe-core.json | 36 +-----------------------------------
 1 file changed, 1 insertion(+), 35 deletions(-)

diff --git a/meta/lib/oeqa/manual/oe-core.json b/meta/lib/oeqa/manual/oe-core.json
index 3ee0aa9..6191d4f 100644
--- a/meta/lib/oeqa/manual/oe-core.json
+++ b/meta/lib/oeqa/manual/oe-core.json
@@ -43,40 +43,6 @@
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
@@ -231,4 +197,4 @@
       "summary": "test_bitbake_sane_error_for_invalid_layer"
     }
   }
-]
\ No newline at end of file
+]
-- 
2.7.4


