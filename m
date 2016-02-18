Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 27FEA75C51
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Feb 2016 05:28:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u1I5SdqO013555
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 21:28:39 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 17 Feb 2016 21:28:38 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 18 Feb 2016 13:29:04 +0800
Message-ID: <2771d0bb9cb36f31c9b7737bf83bcf919cb31e9d.1455772181.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1455772181.git.Qi.Chen@windriver.com>
References: <cover.1455772181.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] cups: upgrade to 2.1.3
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
X-List-Received-Date: Thu, 18 Feb 2016 05:28:38 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/cups/cups.inc                         | 2 +-
 meta/recipes-extended/cups/{cups_2.0.4.bb => cups_2.1.3.bb} | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/cups/{cups_2.0.4.bb => cups_2.1.3.bb} (40%)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 3f81e2c..4b2d214 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -3,7 +3,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv2 & LGPLv2"
 DEPENDS = "gnutls libpng jpeg dbus dbus-glib zlib libusb"
 
-SRC_URI = "http://www.cups.org/software/${PV}/${BP}-source.tar.bz2 \
+SRC_URI = "https://www.cups.org/software/${PV}/${BP}-source.tar.bz2 \
            file://use_echo_only_in_init.patch \
            file://0001-don-t-try-to-run-generated-binaries.patch \
            file://cups_serverbin.patch \
diff --git a/meta/recipes-extended/cups/cups_2.0.4.bb b/meta/recipes-extended/cups/cups_2.1.3.bb
similarity index 40%
rename from meta/recipes-extended/cups/cups_2.0.4.bb
rename to meta/recipes-extended/cups/cups_2.1.3.bb
index bad73b3..aef211d 100644
--- a/meta/recipes-extended/cups/cups_2.0.4.bb
+++ b/meta/recipes-extended/cups/cups_2.1.3.bb
@@ -2,5 +2,5 @@ require cups.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=6c5a350596fba02754bd96eb6df3afd0"
 
-SRC_URI[md5sum] = "f5c847d9a4fac6c4c66fb0526a7afaae"
-SRC_URI[sha256sum] = "e1d5e68d9f24faca317aeaebc164c34102813bc0f1d69c00b3a59b49c49f4abd"
+SRC_URI[md5sum] = "62b8fafd590e75f72316915790b0850a"
+SRC_URI[sha256sum] = "36a70d43584aea2617da914b9331e23341c3501a8254c4d2eae9c11ec01fd4d3"
-- 
1.9.1


