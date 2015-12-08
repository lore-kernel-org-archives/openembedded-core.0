Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6D3BE605BB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Dec 2015 09:56:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tB89ulco017883
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Dec 2015 01:56:47 -0800
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 8 Dec 2015 01:56:47 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 8 Dec 2015 01:56:31 -0800
Message-ID: <2cc8c8066193f851ea0ed3912dee287c2d1c5257.1449568553.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1449568553.git.liezhi.yang@windriver.com>
References: <cover.1449568553.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 03/15] libarchive: rename patch to reflect CVE
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
X-List-Received-Date: Tue, 08 Dec 2015 09:56:47 -0000
Content-Type: text/plain

From: Ross Burton <ross.burton@intel.com>

This patch is a CVE fix, so rename it to help CVE detection tools identify it as
such.

(From OE-Core master rev: 3fd05ce1f709cbbd8fdeb1dbfdffbd39922eca6e)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...option.patch => libarchive-CVE-2015-2304.patch} |    0
 .../libarchive/libarchive_3.1.2.bb                 |    2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libarchive/libarchive/{0001-Add-ARCHIVE_EXTRACT_SECURE_NOABSOLUTEPATHS-option.patch => libarchive-CVE-2015-2304.patch} (100%)

diff --git a/meta/recipes-extended/libarchive/libarchive/0001-Add-ARCHIVE_EXTRACT_SECURE_NOABSOLUTEPATHS-option.patch b/meta/recipes-extended/libarchive/libarchive/libarchive-CVE-2015-2304.patch
similarity index 100%
rename from meta/recipes-extended/libarchive/libarchive/0001-Add-ARCHIVE_EXTRACT_SECURE_NOABSOLUTEPATHS-option.patch
rename to meta/recipes-extended/libarchive/libarchive/libarchive-CVE-2015-2304.patch
diff --git a/meta/recipes-extended/libarchive/libarchive_3.1.2.bb b/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
index aaa3255..716db9a 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
@@ -32,7 +32,7 @@ PACKAGECONFIG[nettle] = "--with-nettle,--without-nettle,nettle,"
 SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://libarchive-CVE-2013-0211.patch \
            file://pkgconfig.patch \
-           file://0001-Add-ARCHIVE_EXTRACT_SECURE_NOABSOLUTEPATHS-option.patch \
+           file://libarchive-CVE-2015-2304.patch \
            file://mkdir.patch \
            "
 
-- 
1.7.9.5


