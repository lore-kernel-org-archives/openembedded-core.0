Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 89BCB73166
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 01:49:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u6F1nf1C018930
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2016 18:49:41 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.229) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 14 Jul 2016 18:49:40 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Jul 2016 09:49:36 +0800
Message-ID: <e9f27319a4aae84d9811744dd364ddc148b6d38b.1468547302.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1468547302.git.Qi.Chen@windriver.com>
References: <cover.1468547302.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] cups: upgrade to 2.1.4
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
X-List-Received-Date: Fri, 15 Jul 2016 01:49:40 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/cups/cups.inc                         | 2 +-
 meta/recipes-extended/cups/{cups_2.1.3.bb => cups_2.1.4.bb} | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/cups/{cups_2.1.3.bb => cups_2.1.4.bb} (40%)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 9a12a78..02b6358 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -3,7 +3,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv2 & LGPLv2"
 DEPENDS = "gnutls libpng jpeg dbus dbus-glib zlib libusb"
 
-SRC_URI = "https://www.cups.org/software/${PV}/${BP}-source.tar.bz2 \
+SRC_URI = "https://github.com/apple/cups/releases/download/release-${PV}/${BP}-source.tar.gz \
            file://use_echo_only_in_init.patch \
            file://0001-don-t-try-to-run-generated-binaries.patch \
            file://cups_serverbin.patch \
diff --git a/meta/recipes-extended/cups/cups_2.1.3.bb b/meta/recipes-extended/cups/cups_2.1.4.bb
similarity index 40%
rename from meta/recipes-extended/cups/cups_2.1.3.bb
rename to meta/recipes-extended/cups/cups_2.1.4.bb
index aef211d..0fab806 100644
--- a/meta/recipes-extended/cups/cups_2.1.3.bb
+++ b/meta/recipes-extended/cups/cups_2.1.4.bb
@@ -2,5 +2,5 @@ require cups.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=6c5a350596fba02754bd96eb6df3afd0"
 
-SRC_URI[md5sum] = "62b8fafd590e75f72316915790b0850a"
-SRC_URI[sha256sum] = "36a70d43584aea2617da914b9331e23341c3501a8254c4d2eae9c11ec01fd4d3"
+SRC_URI[md5sum] = "9f9bf6e3b9c20a3519b4dc409666d6e7"
+SRC_URI[sha256sum] = "4b14fd833180ac529ebebea766a09094c2568bf8426e219cb3a1715304ef728d"
-- 
1.9.1


