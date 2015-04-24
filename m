Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 21BB073D59
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Apr 2015 03:35:49 +0000 (UTC)
Received: by pdbqd1 with SMTP id qd1so36529825pdb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Apr 2015 20:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=Ix0wqAjjbhKm+v9a1m4zFa5RLop+UO7I56ot7YiTJQc=;
	b=nfSl+9jrpbU3Oukt3JIJcTaZU0kU6FogMf5F4Q7+NWO3J2m1J1lbxBgITfkw6mrSfI
	q/3JtI85MvaXR8Ave//0IcRJZi9uje9o5R+1IBOsZkrnE8gPZmPan13UOqwKxvvp3nUn
	gKGd3R2zBB626SbgW9xGYsImxuqNMMA1L3VUopoPIG9ayJKpzsF0nuqHT98rHCcFHTDZ
	4On3p+ICHm/fBTDQWxL0aTgn+GuLt4G167rkEokxp4SsYTXzTubC5UzULFidruflaHeT
	D08fRFAn9ppsJTHtZM/9NMnm9y+oVm0QstcEfP6fBpaZDHdlYVw2mffOoXkPsbwulL2V
	Wv6A==
X-Received: by 10.70.53.99 with SMTP id a3mr2179101pdp.169.1429846551348;
	Thu, 23 Apr 2015 20:35:51 -0700 (PDT)
Received: from iMac.hsd1.ca.comcast.net (c-24-130-225-169.hsd1.ca.comcast.net.
	[24.130.225.169])
	by mx.google.com with ESMTPSA id qv9sm9575507pab.27.2015.04.23.20.35.50
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Apr 2015 20:35:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Apr 2015 20:35:31 -0700
Message-Id: <822e842d4cc54ffcdfaaed0782eb7165c5d435f2.1429846256.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <aced357a8b994ceff87490e2e9faa526143bf4c4.1429846255.git.raj.khem@gmail.com>
References: <aced357a8b994ceff87490e2e9faa526143bf4c4.1429846255.git.raj.khem@gmail.com>
In-Reply-To: <cover.1429846255.git.raj.khem@gmail.com>
References: <cover.1429846255.git.raj.khem@gmail.com>
Subject: [PATCH 13/14] fontconfig: Upgrade to 2.11.93
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
X-List-Received-Date: Fri, 24 Apr 2015 03:35:50 -0000

LIC_FILES_CHKSUM change is due to shifting of
the hunk to different line numbers, checksum remains same still

Change-Id: I0ce0cc96d39c801e57394f7a839a01d11a6f3979
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../fontconfig/{fontconfig_2.11.1.bb => fontconfig_2.11.93.bb}      | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/fontconfig/{fontconfig_2.11.1.bb => fontconfig_2.11.93.bb} (86%)

diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.11.1.bb b/meta/recipes-graphics/fontconfig/fontconfig_2.11.93.bb
similarity index 86%
rename from meta/recipes-graphics/fontconfig/fontconfig_2.11.1.bb
rename to meta/recipes-graphics/fontconfig/fontconfig_2.11.93.bb
index 7c5b4b4..44cfe2b 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig_2.11.1.bb
+++ b/meta/recipes-graphics/fontconfig/fontconfig_2.11.93.bb
@@ -14,7 +14,7 @@ BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=fontconfig"
 LICENSE = "MIT-style & MIT & PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7a0449e9bc5370402a94c00204beca3d \
                     file://src/fcfreetype.c;endline=45;md5=5d9513e3196a1fbfdfa94051c09dfc84 \
-                    file://src/fccache.c;beginline=1143;endline=1158;md5=0326cfeb4a7333dd4dd25fbbc4b9f27f"
+                    file://src/fccache.c;beginline=1199;endline=1214;md5=0326cfeb4a7333dd4dd25fbbc4b9f27f"
 
 SECTION = "libs"
 
@@ -22,8 +22,8 @@ DEPENDS = "expat freetype zlib"
 
 SRC_URI = "http://fontconfig.org/release/fontconfig-${PV}.tar.gz \
            "
-SRC_URI[md5sum] = "e75e303b4f7756c2b16203a57ac87eba"
-SRC_URI[sha256sum] = "b6b066c7dce3f436fdc0dfbae9d36122b38094f4f53bd8dffd45e195b0540d8d"
+SRC_URI[md5sum] = "622f94f0f74e40775ea72d7d5f17a36d"
+SRC_URI[sha256sum] = "296b5e83189589e537992d65ff01e0cd74eba9a91eb16a6890ce942e3695c526"
 
 PACKAGES =+ "fontconfig-utils"
 FILES_${PN} =+ "${datadir}/xml/*"
-- 
2.1.4


