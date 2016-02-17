Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C2AFA731A4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 10:07:42 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 17 Feb 2016 02:07:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,459,1449561600"; d="scan'208";a="916712407"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 17 Feb 2016 02:07:44 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 2DBE96A4002
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 02:55:32 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Feb 2016 12:11:07 +0200
Message-Id: <1455703867-9581-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] busybox: Add musl config for _git recipe
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
X-List-Received-Date: Wed, 17 Feb 2016 10:07:42 -0000

busybox_git recipe also requires musl specific configuration

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-core/busybox/busybox_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/busybox/busybox_git.bb b/meta/recipes-core/busybox/busybox_git.bb
index 220977a..e590543 100644
--- a/meta/recipes-core/busybox/busybox_git.bb
+++ b/meta/recipes-core/busybox/busybox_git.bb
@@ -44,5 +44,6 @@ SRC_URI = "git://busybox.net/busybox.git \
            file://getopts.cfg \
            file://resize.cfg \
 "
+SRC_URI_append_libc-musl = " file://musl.cfg "
 
 DEFAULT_PREFERENCE = "-1"
-- 
2.4.0


