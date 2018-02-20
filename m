Return-Path: <maxin.john@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 20D3E786E9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 15:41:24 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Feb 2018 07:41:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,539,1511856000"; d="scan'208";a="202451717"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 20 Feb 2018 07:41:26 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 640D75802E2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 07:41:25 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Feb 2018 17:44:04 +0200
Message-Id: <1519141444-25953-4-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1519141444-25953-1-git-send-email-maxin.john@intel.com>
References: <1519141444-25953-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 4/4] librsvg: provide RECIPE_NO_UPDATE_REASON
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
X-List-Received-Date: Tue, 20 Feb 2018 15:41:25 -0000

Rustification of librsvg from version 2.41.0 onwards creates the need
for Rust compiler to build it. We need to push the upgrade of
librsvg until we have Rust support in oe-core.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-gnome/librsvg/librsvg_2.40.20.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.40.20.bb b/meta/recipes-gnome/librsvg/librsvg_2.40.20.bb
index cd44530..cf17730 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.40.20.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.40.20.bb
@@ -2,6 +2,8 @@ SUMMARY = "Library for rendering SVG files"
 HOMEPAGE = "http://ftp.gnome.org/pub/GNOME/sources/librsvg/"
 BUGTRACKER = "https://bugzilla.gnome.org/"
 
+RECIPE_NO_UPDATE_REASON = "Versions from 2.41.0 requires Rust compiler to build it"
+
 LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://rsvg.h;beginline=3;endline=24;md5=20b4113c4909bbf0d67e006778302bc6"
-- 
2.4.0


