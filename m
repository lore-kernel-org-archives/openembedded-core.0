Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 07D7F6FF7F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Dec 2015 09:44:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tB19inrs023208
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Dec 2015 01:44:49 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 1 Dec 2015 01:44:49 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 1 Dec 2015 01:44:42 -0800
Message-ID: <aa64e9c836635310fe915b54cbcc3148d5ac4f61.1448962573.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1448962573.git.liezhi.yang@windriver.com>
References: <cover.1448962573.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/8] libarchive: rename patch to reflect CVE
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
X-List-Received-Date: Tue, 01 Dec 2015 09:44:49 -0000
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


