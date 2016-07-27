Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A4297731D3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 13:04:09 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 27 Jul 2016 06:03:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,429,1464678000"; d="scan'208";a="854515631"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 27 Jul 2016 06:03:41 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id C5B196A4080
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 06:03:29 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2016 16:02:51 +0300
Message-Id: <1469624577-24972-4-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1469624577-24972-1-git-send-email-maxin.john@intel.com>
References: <1469624577-24972-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 3/9] libtasn1: upgrade to 4.9
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
X-List-Received-Date: Wed, 27 Jul 2016 13:04:10 -0000

4.8 -> 4.9

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-support/gnutls/{libtasn1_4.8.bb => libtasn1_4.9.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/gnutls/{libtasn1_4.8.bb => libtasn1_4.9.bb} (81%)

diff --git a/meta/recipes-support/gnutls/libtasn1_4.8.bb b/meta/recipes-support/gnutls/libtasn1_4.9.bb
similarity index 81%
rename from meta/recipes-support/gnutls/libtasn1_4.8.bb
rename to meta/recipes-support/gnutls/libtasn1_4.9.bb
index 360d529..5ce06d8 100644
--- a/meta/recipes-support/gnutls/libtasn1_4.8.bb
+++ b/meta/recipes-support/gnutls/libtasn1_4.9.bb
@@ -12,8 +12,8 @@ SRC_URI = "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz \
            file://dont-depend-on-help2man.patch \
            "
 
-SRC_URI[md5sum] = "9a6767705725544f2b86670dcfb34107"
-SRC_URI[sha256sum] = "fa802fc94d79baa00e7397cedf29eb6827d4bd8b4dd77b577373577c93a8c513"
+SRC_URI[md5sum] = "3018d0f466a32b66dde41bb122e6cab6"
+SRC_URI[sha256sum] = "4f6f7a8fd691ac2b8307c8ca365bad711db607d4ad5966f6938a9d2ecd65c920"
 
 inherit autotools texinfo binconfig lib_package
 
-- 
2.4.0


