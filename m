Return-Path: <alexandrux.palalau@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3C6866F796
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 12:26:26 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 12 Mar 2014 05:26:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,637,1389772800"; d="scan'208";a="498382046"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 12 Mar 2014 05:23:08 -0700
Received: from localhost.localdomain (unknown [10.237.112.121])
	by linux.intel.com (Postfix) with ESMTP id 1F4A76A4083;
	Wed, 12 Mar 2014 05:22:55 -0700 (PDT)
From: Alexandru Palalau <alexandrux.palalau@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Mar 2014 14:27:25 +0200
Message-Id: <1394627248-13097-4-git-send-email-alexandrux.palalau@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1394627248-13097-1-git-send-email-alexandrux.palalau@linux.intel.com>
References: <1394627248-13097-1-git-send-email-alexandrux.palalau@linux.intel.com>
Subject: [PATCH v2 3/6] gnome-mime-data: removed gconf and gtk-icon-cache inheritance
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
X-List-Received-Date: Wed, 12 Mar 2014 12:26:27 -0000

Should remove WARN-QA message regarding --disable-schemas-install.
gtk-icon-cache is not needed.

Signed-off-by: Alexandru Palalau <alexandrux.palalau@linux.intel.com>
---
 meta/recipes-gnome/gnome/gnome-mime-data_2.18.0.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/gnome/gnome-mime-data_2.18.0.bb b/meta/recipes-gnome/gnome/gnome-mime-data_2.18.0.bb
index 62712fa..65b79f0 100644
--- a/meta/recipes-gnome/gnome/gnome-mime-data_2.18.0.bb
+++ b/meta/recipes-gnome/gnome/gnome-mime-data_2.18.0.bb
@@ -6,8 +6,7 @@ LICENSE = "GPLv2 & GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://check-mime.pl;endline=26;md5=a95b63c92c33d4ca1af61a315888f450"
 
-inherit gnome
-inherit autotools
+inherit gnomebase mime
 PR = "r4"
 
 SRC_URI += "file://pkgconfig.patch"
-- 
1.8.3.1


