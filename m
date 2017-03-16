Return-Path: <jussi.kukkonen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 2857877587
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 09:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1489655756; x=1521191756;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=jdF7wiPipnEBu4OF5Iv7wKeJfMKr1SP3A41oe4Xs6PM=;
	b=ZPF0QD/f3dRsk49kwQ+K6vdCPzFqAJLKskVoRVpVcwHyputiiaG+2YqU
	s94K188H5kjwNKWx64dcAhp0YIxtIA==;
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Mar 2017 02:15:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,170,1486454400"; d="scan'208";a="1109062733"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 16 Mar 2017 02:15:55 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 247C92C8001;
	Thu, 16 Mar 2017 02:15:49 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Mar 2017 11:15:37 +0200
Message-Id: <f0249f0987f1067e5841464a2a3a9281f807cbe3.1489655518.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1489655518.git.jussi.kukkonen@intel.com>
References: <cover.1489655518.git.jussi.kukkonen@intel.com>
Subject: [PATCH 09/11] gstreamer1.0-omx: Remove unused patch
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
X-List-Received-Date: Thu, 16 Mar 2017 09:15:55 -0000

The patch was only used in the ancient and recently removed git recipe.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../0001-omx-fixed-type-error-in-printf-call.patch | 30 ----------------------
 1 file changed, 30 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-omx/0001-omx-fixed-type-error-in-printf-call.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx/0001-omx-fixed-type-error-in-printf-call.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx/0001-omx-fixed-type-error-in-printf-call.patch
deleted file mode 100644
index a428ac9..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx/0001-omx-fixed-type-error-in-printf-call.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From f629e041e9f678fcd86ad764a15117dff63c271c Mon Sep 17 00:00:00 2001
-From: Carlos Rafael Giani <dv@pseudoterminal.org>
-Date: Sat, 27 Apr 2013 02:50:25 +0200
-Subject: [PATCH] omx: fixed type error in printf call
-
-%zu expects size_t
-
-Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=699008]
-
-Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
----
- omx/gstomx.c |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/omx/gstomx.c b/omx/gstomx.c
-index a2945ed..1eca7cc 100644
---- a/omx/gstomx.c
-+++ b/omx/gstomx.c
-@@ -1630,7 +1630,7 @@ gst_omx_port_allocate_buffers_unlocked (GstOMXPort * port,
- 
-   GST_INFO_OBJECT (comp->parent,
-       "Allocating %d buffers of size %zu for %s port %u", n,
--      port->port_def.nBufferSize, comp->name, (guint) port->index);
-+      (size_t) (port->port_def.nBufferSize), comp->name, (guint) port->index);
- 
-   if (!port->buffers)
-     port->buffers = g_ptr_array_sized_new (n);
--- 
-1.7.9.5
-
-- 
2.1.4


