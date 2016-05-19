Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A2314606A8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 13:42:43 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 19 May 2016 06:42:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,334,1459839600"; d="scan'208";a="980452443"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 19 May 2016 06:42:45 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 80DD16A4006
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 07:30:15 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 May 2016 16:43:08 +0300
Message-Id: <1463665389-18822-3-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1463665389-18822-1-git-send-email-maxin.john@intel.com>
References: <1463665389-18822-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 3/4] libgudev: fix upstream check
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
X-List-Received-Date: Thu, 19 May 2016 13:42:43 -0000

Provide UPSTREAM_CHECK_URI and UPSTREAM_CHECK_REGEX to fix upstream
check.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-gnome/libgudev/libgudev_230.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-gnome/libgudev/libgudev_230.bb b/meta/recipes-gnome/libgudev/libgudev_230.bb
index 6a10502..f9e1d23 100644
--- a/meta/recipes-gnome/libgudev/libgudev_230.bb
+++ b/meta/recipes-gnome/libgudev/libgudev_230.bb
@@ -12,3 +12,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 inherit gnomebase gobject-introspection
 
+UPSTREAM_CHECK_URI = "http://ftp.gnome.org/pub/GNOME/sources/libgudev/"
+UPSTREAM_CHECK_REGEX = "(?P<pver>(\d+))"
-- 
2.4.0


