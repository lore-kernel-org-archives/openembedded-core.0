Return-Path: <alexandrux.palalau@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 97B0560C02
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 08:32:30 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 12 Mar 2014 01:32:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,636,1389772800"; d="scan'208";a="496798343"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 12 Mar 2014 01:32:02 -0700
Received: from localhost.localdomain (unknown [10.237.112.121])
	by linux.intel.com (Postfix) with ESMTP id 9A5086A4087;
	Wed, 12 Mar 2014 01:31:49 -0700 (PDT)
From: Alexandru Palalau <alexandrux.palalau@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Mar 2014 10:36:18 +0200
Message-Id: <1394613382-28992-3-git-send-email-alexandrux.palalau@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1394613382-28992-1-git-send-email-alexandrux.palalau@linux.intel.com>
References: <1394613382-28992-1-git-send-email-alexandrux.palalau@linux.intel.com>
Subject: [PATCH 2/6] gst-plugins-gl: removed gconf inheritance
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
X-List-Received-Date: Wed, 12 Mar 2014 08:32:31 -0000

Signed-off-by: Alexandru Palalau <alexandrux.palalau@linux.intel.com>
---
 meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb
index 60de7c0..90efbcc 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb
@@ -12,7 +12,7 @@ DEPENDS += "gst-plugins-base virtual/libgles2 virtual/egl jpeg libpng glew"
 
 PR = "r4"
 
-inherit gettext gconf
+inherit gettext
 
 # This package doesn't have a configure switch for EGL or GL, so forcibly tell
 # configure that it can't find gl.h so it always uses EGL.  If/when we have some
-- 
1.8.3.1


