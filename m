Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B0D22782F7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 14:30:21 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Jun 2017 07:30:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,338,1493708400"; d="scan'208";a="1181889925"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 13 Jun 2017 07:30:21 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id CE0E358010F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 07:30:20 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Jun 2017 17:29:53 +0300
Message-Id: <1497364193-519-8-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1497364193-519-1-git-send-email-maxin.john@intel.com>
References: <1497364193-519-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 7/7] grub: switch from ftp to https
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
X-List-Received-Date: Tue, 13 Jun 2017 14:30:21 -0000

For the same reasons as Debian:
https://www.debian.org/News/2017/20170425

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-bsp/grub/grub2.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index bb6ebdd..da6aad2 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -11,7 +11,7 @@ SECTION = "bootloaders"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
+SRC_URI = "https://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
            file://0001-Disable-mfpmath-sse-as-well-when-SSE-is-disabled.patch \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
            file://autogen.sh-exclude-pc.patch \
-- 
2.4.0


