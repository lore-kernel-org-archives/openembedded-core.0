Return-Path: <B54851@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0131.outbound.protection.outlook.com [157.56.110.131])
	by mail.openembedded.org (Postfix) with ESMTP id D203D73174
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 09:50:59 +0000 (UTC)
Received: from BN3PR0301CA0067.namprd03.prod.outlook.com (10.160.152.163) by
	BY1PR0301MB1175.namprd03.prod.outlook.com (10.160.195.146) with
	Microsoft
	SMTP Server (TLS) id 15.1.365.19; Mon, 18 Jan 2016 09:36:01 +0000
Received: from BN1AFFO11FD052.protection.gbl (2a01:111:f400:7c10::111) by
	BN3PR0301CA0067.outlook.office365.com (2a01:111:e400:401e::35) with
	Microsoft SMTP Server (TLS) id 15.1.365.19 via Frontend Transport;
	Mon, 18 Jan 2016 09:36:01 +0000
Authentication-Results: spf=permerror (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none; freescale.mail.onmicrosoft.com;
	dmarc=none action=none header.from=freescale.com;
Received-SPF: PermError (protection.outlook.com: domain of freescale.com used
	an invalid SPF mechanism)
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1AFFO11FD052.mail.protection.outlook.com (10.58.53.67) with Microsoft
	SMTP Server (TLS) id 15.1.355.15 via Frontend Transport;
	Mon, 18 Jan 2016 09:36:01 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	u0I9ZROi015522; Mon, 18 Jan 2016 02:35:59 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Jan 2016 17:33:02 +0800
Message-ID: <1453109582-25485-14-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453109582-25485-1-git-send-email-b54851@freescale.com>
References: <1453109582-25485-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11FD052;
	1:8MpwkwJ5cO/I9LnrCT3NQ+vJdOcOTBnP0zM/kq4DOER1ov32sS74oqwyzfNkK1NtAru16yA6R6jSLc8SWKQu/CaT5j4W1iEY/g77+YCSqKHgth8IaRmrUQi4ru5EMtPbU6HXIZHZ66u1RDPq0EefhHsuf2ZX/lPdV8ufqvn5Aps3pxdt3WpMqTklPMQLszmzkFEQOfN5pZQPnF7qQ0E64thE8a/Fl0zcdM4wKl1YocXpSdisy5XK61Wl3pQSxdIOUhAbOJQmH30fvVA2FQFpBO2kvAHSpA2KWjcuQ5SE+spOOfUPbwsfUxukwtBgfrGwx46xim+7lOlwa1+xP6D470wSSK4ia2hwR8qYvdGN4B6NxMnqOl1+ABLeg2GwAVegeRu/xNBN5qoipspz9DzYGWPMpTJkhkf43MZ87rRNWr0=
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(448002)(199003)(189002)(50226001)(1220700001)(97736004)(50466002)(48376002)(1096002)(230783001)(50986999)(81156007)(76176999)(19580395003)(104016004)(6806005)(36756003)(575784001)(19580405001)(86362001)(189998001)(586003)(87936001)(2950100001)(5001960100002)(107886002)(15975445007)(450100001)(106466001)(85326001)(92566002)(47776003)(229853001)(4001430100002)(5008740100001)(5003940100001)(11100500001)(4326007)(2351001)(77096005)(33646002)(110136002)(2906002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY1PR0301MB1175;
	H:tx30smr01.am.freescale.net; FPR:; SPF:PermError;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: afbed171-c667-4c13-0a3d-08d31feac738
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1175;
	2:FLKK+NPi3NV0kYWKlQPYeydYFO2W9I11xV9GYydibuegKNZ82bRAO7qyvG7jX3dwiIrZxIcJrBCcCKhQhSOxScgjnk9ai9B0Eh2l8UDLG3PCc6bFs6Jpsfln5yj2MFzom51sf5Pf6gvTbB+RxDVL1OdioRvKBeYQK8HYE3VCWZkKxvbEEY097qCXRdlcP8yW;
	3:yjJcoNl1FDKOm8Nlhl+eFyLl+ioUvm6V79mlJsC820JSqrFhvVsfuTdP9toMhLlrcSF3J4mXOQCDa9X3rfyixd3Ps2XlKWFSAoKa2z+w1D/wfK3vBKAL2kdMh85ZEsuVndvX9lKVmGgcqqJrEX0L0q33BhVJR0/60PjhX/KnIGDZd0DiR6sFTu12v88/5yxzIGXaMe/GnBggI/eHasoUA5LaijSXvBEPb5LdBYrRJ7c=;
	25:npReGgXb9t9qja2smNIVPkAcJ1VkacP/56T+3pgGM1eJVjKAgpeds8DF+fPsmhB9Q4/pyXc7H5RcPlKhUBbfq4xemPf4pi565xvutybDdPdPfdmU7eke+u1B3LIpbOAa81EWDZNlR3b1gjSgKcE8n2qN1UsDRw3UtAXAbFcJnVlADWFt2XlQVcxS6MEA/XMrSo7uskU5380UQ8vBc5z5cb/DeX38dWHvaSNSx1KIl6eaZ4pd62EMXYGIxXmAEv14
X-Exchange-Antispam-Report-Test: UriScan:; BCL:0; PCL:0; RULEID:;
	SRVR:BY1PR0301MB1175; UriScan:(101931422205132); 
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1175;
	20:033hgVs6XTdnW8MaMuFA3ZshcOAr0RM2V3CMwy15oxaUv1Px/G4QKnF+nXh1hZ7Ob/lVmFEpqQA/oMousWCYMI+lS+IzSDIV/8I8FdoEz/PXy01FruGZABR+dvZLe/rTomyUP8HBCHDjFZec7Wq+bBjOnb08j1mLj7IEDERoMQc4NgD2GvVGT5QMglF8WK2ARdL96r3IOFPaz30dRon33sVLHJMecQN+CPmAwaQJftD2EbHn3EMv2vlw9FeW8a68Rg4Gg7hWrpVIS8zhldodC/yVSsPeYeibQoxmvT3m0M1RWIQC6TDGJY8+OyVDzm2ODV+BLgDdaEzcDE4JKPbnFlLjPOw3lSPg0o2Z6PhgIm9rSvKomIvZ+NBufFWf0/xx00eXf06bsGcncXtfEp0sKBj6z7c51gqnqHURrn9Tt5OXVzagsnWn1okfF8iGNpXS;
	4:GfwY9aAPJSAiua3jcIuRDffBDrNWyuZ5rqhpDmTTsk2Fkp1UO6c6HwN6Vs7y7tmiHl8mejTuEQya6AitHxqN9uSyaOGvJRVK7/B7/9VkMU7bu/GfHmY/TUmOCAlwbDj74hinkkTjCqZQkDAIaVHjTtt76XGYPyERDFFLHbiLUcvPB7a1Zd2/jxhjhMsBMkw81BbTxEf714Wh9jH2vWK8RdP/9ze2A7ckc3qIjM9oqJrk5+prs6ufJIUPAlBz6hhlyNvBKWoNu8bYxoxyzOaylDVingylLrEsjIzQPzrKOqGzFOlVmPWccBBmMNLlkqcJ1OlGd0SHK6EIUvtxllSXtyq9/86NzIFfXl4tW+YqetoTUjS1fIVn7uhX5heB+aRuM1Nh2VZfe5P8LCclzpYxHW9x0J1RhP5P5TuU2MSIhSJbI7BbccPNDbOPNzEBlrfd9ZwPsMbXg+3Bz0ZhP8CuThFuWxMB4KJByhQ9jjbUz9JYNKwWjILqZFM/jlxCvgdC
X-Microsoft-Antispam-PRVS: <BY1PR0301MB11759ECA019A04ED6B7ED06186C00@BY1PR0301MB1175.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(13018025)(13023023)(8121501046)(13015025)(520078)(13017025)(10201501046)(3002001);
	SRVR:BY1PR0301MB1175; BCL:0; PCL:0; RULEID:;
	SRVR:BY1PR0301MB1175; 
X-Forefront-PRVS: 08252193F3
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY1PR0301MB1175;
	23:a7hAO6Rx04qyfvGpE4pVqHpK5O9cy2tVllQjnBQ?=
	=?us-ascii?Q?LHdkefY71a47UKPWcLO8IBpCWY+eCivRtkradRHnoRsqgNmxnyQnBac8UnMc?=
	=?us-ascii?Q?lLVISQzJcbTyOLTyw6OvdMY+VvpKpxUFHV8poZorSPdKVUGXHEtbs29wL6zC?=
	=?us-ascii?Q?LfH76fdJ1nMMIWP3nuUrtLS4pWpfsJbIS6yFQqdOaJ3kMx06B3p+MxzUXAwl?=
	=?us-ascii?Q?ODrecWjXF+iD039nlytiLujTu7/HucBk0B2i5zZdpIS9og00qS+e0GAuaR1L?=
	=?us-ascii?Q?jiFNEfE3F7VYkqs1E8heIcUrjtAnEnwdyONiMohhnI5WsKvGzrQ4rUL99we3?=
	=?us-ascii?Q?v4Qhh6us8n3eqxcReKyOZMBSgrLodUY/EfDC9mvkYjuXba/71H4DSRYi/HQP?=
	=?us-ascii?Q?ru68fySZGXxCFVoIy0gyCOB3YCnOKpYUxxGr9kwk84kqiUt6TRD984fjMrAx?=
	=?us-ascii?Q?GEERTbZ2WLmfgxe4HQANVTeeTOyjYk/CpbBf4/sh78LmRUc/rCg6N7l0ADRK?=
	=?us-ascii?Q?VJ4vMAh7WeXR/vAFw0Nm/c2BZV12DtIqWeXqSXtb39SOuZ/qsDoa7YnDVuij?=
	=?us-ascii?Q?lkuLLt6OItsXzcFAEWg9fFON03K5XTGV5vbwaJoPN1pjzhQvlESZmw5n69gK?=
	=?us-ascii?Q?NpgXd33qo6oph6+/IrlQiVI/lEt1plqAmSVlOTG4YhVyfNhzGmrigOkTeUrt?=
	=?us-ascii?Q?x+7dDF6jiAXBh1IXAsVmAfeU0sml8FheLN3WY6t0ctFBRIewOvKYvL4A4dDd?=
	=?us-ascii?Q?/G7l2YwrkbzvvAxIGrSWkJo+xgdiQViH2kZD2pFImDOrDRzoVMSdB3twTJe1?=
	=?us-ascii?Q?DKYcYJvHPxgNgjZZfvFQe4G22z1za49FDxcFZ0UjMK5leX5S2y8QaCkO5PjB?=
	=?us-ascii?Q?/vw7Gir/tNQLiVeNN6TvBu9ZvzoHxuT12PvX1zSU6Y8wYCje/cu0JRi221mV?=
	=?us-ascii?Q?driotao5DGdsLuXFjzzgO+4GjeanQ+ZeXltyj6vNrQXrXCKtXuxIBGkp4IBn?=
	=?us-ascii?Q?v8YT96/OnE2X8h3B3DAe+OeywIEHPPj7zeCle4qQ4UXUXk+xeoLe9VO9EHTW?=
	=?us-ascii?Q?q3kFPiLmlNlsZO80jbPdi3yI3stuYUIYInJLG/9BzbNOoHQtfrIQ0Tb1MooL?=
	=?us-ascii?Q?A/wGh00mZ/sfGQjsCLDvCaGAvNNbOgCVeCm8n3yxKBlZCWv8qUav7WLIWoXU?=
	=?us-ascii?Q?+nitMYWqLnS6pqd4=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1175;
	5:iLaN4FIbxKJFJetkbx6r4J3cTwXytNuQDq2zYd8Xe/ZlWRLO8TEMxYCCZpvfbjTPLgmx9lxf1nnDhPcSa0FbB9fwKvtLwdSqGP1opst+1Ciw6MEmCMHLwBrTohGE5W2a1PjUF/HTBQhoyMCGscNghw==;
	24:AeAcbNMjCd5CVj4JO2gW+agMTJJHU9GpLsUSa3rtxRcErL/vIjVa24BeN9DEJ66QzMzILsJuvNQCFw+pRfZLXihATjYlUrQJr1sFouSLQwY=
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2016 09:36:01.2802 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR0301MB1175
Subject: [poky][PATCH 13/13] gstreamer1.0-plugins-bad: Fix loop test hang in glimagesink
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
X-List-Received-Date: Mon, 18 Jan 2016 09:51:00 -0000
Content-Type: text/plain

Root cause:
In glimagesink, gl thread will dispatch event queue and window_show()
is called from streaming thread. Gl thread will empty event queue and
potentially cause gst_gl_wl_display_roundtrip_queue() blocking the
streaming thread to wait for an event occur. Actually, no event can occur
becaue the swap_buffer event is queued by streaming thread but it is blocked.

Solution:
Use two event queue, One for surface and another for gl thread.

Signed-off-by: Yuqing Zhu <b54851@freescale.com>
---
 ...-wayland-fix-loop-test-hang-in-glimagesin.patch | 142 +++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb    |   1 +
 2 files changed, 143 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0008-glplugin-gl-wayland-fix-loop-test-hang-in-glimagesin.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0008-glplugin-gl-wayland-fix-loop-test-hang-in-glimagesin.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0008-glplugin-gl-wayland-fix-loop-test-hang-in-glimagesin.patch
new file mode 100755
index 0000000..59f47de
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0008-glplugin-gl-wayland-fix-loop-test-hang-in-glimagesin.patch
@@ -0,0 +1,142 @@
+From 196799920b36b47e2f99fa55732abda6574e247c Mon Sep 17 00:00:00 2001
+From: Haihua Hu <b55597@freescale.com>
+Date: Sun, 6 Dec 2015 14:25:44 +0800
+Subject: [PATCH 3/5] [glplugin] gl/wayland: fix loop test hang in glimagesink
+
+Root cause: In glimagesink, gl thread will dispatch event queue and window_show()
+is called from streaming thread. Gl thread will empty event queue and
+potentially cause gst_gl_wl_display_roundtrip_queue() blocking the
+streaming thread to wait for an event occur. Actually, no event can occur
+becaue the swap_buffer event is queued by streaming thread but it is blocked.
+
+Solution: Use two event queue, One for surface and another for gl thread
+
+Upstream-Status: Pending
+
+bugzilla URL: https://bugzilla.gnome.org/show_bug.cgi?id=758984
+
+Signed-off-by: Haihua Hu <b55597@freescale.com>
+---
+ gst-libs/gst/gl/wayland/gstglwindow_wayland_egl.c |   33 ++++++++++++++-------
+ gst-libs/gst/gl/wayland/gstglwindow_wayland_egl.h |    2 +-
+ 2 files changed, 23 insertions(+), 12 deletions(-)
+
+diff --git a/gst-libs/gst/gl/wayland/gstglwindow_wayland_egl.c b/gst-libs/gst/gl/wayland/gstglwindow_wayland_egl.c
+index b557daa..8ec9e7a 100644
+--- a/gst-libs/gst/gl/wayland/gstglwindow_wayland_egl.c
++++ b/gst-libs/gst/gl/wayland/gstglwindow_wayland_egl.c
+@@ -245,6 +245,10 @@ destroy_surfaces (GstGLWindowWaylandEGL * window_egl)
+     wl_egl_window_destroy (window_egl->window.native);
+     window_egl->window.native = NULL;
+   }
++  if(window_egl->window.surface_queue) {
++    wl_event_queue_destroy (window_egl->window.surface_queue);
++    window_egl->window.surface_queue = NULL;
++  }
+ }
+ 
+ static void
+@@ -253,13 +257,15 @@ create_surfaces (GstGLWindowWaylandEGL * window_egl)
+   GstGLDisplayWayland *display =
+       GST_GL_DISPLAY_WAYLAND (GST_GL_WINDOW (window_egl)->display);
+   gint width, height;
++  if (!window_egl->window.surface_queue)
++    window_egl->window.surface_queue = wl_display_create_queue (display->display);
+ 
+   if (!window_egl->window.surface) {
+     window_egl->window.surface =
+         wl_compositor_create_surface (display->compositor);
+-    if (window_egl->window.queue)
++    if (window_egl->window.surface_queue)
+       wl_proxy_set_queue ((struct wl_proxy *) window_egl->window.surface,
+-          window_egl->window.queue);
++          window_egl->window.surface_queue);
+   }
+ 
+   if (window_egl->window.foreign_surface) {
+@@ -275,9 +281,9 @@ create_surfaces (GstGLWindowWaylandEGL * window_egl)
+       window_egl->window.subsurface =
+           wl_subcompositor_get_subsurface (display->subcompositor,
+           window_egl->window.surface, window_egl->window.foreign_surface);
+-      if (window_egl->window.queue)
++      if (window_egl->window.surface_queue)
+         wl_proxy_set_queue ((struct wl_proxy *) window_egl->window.subsurface,
+-            window_egl->window.queue);
++            window_egl->window.surface_queue);
+ 
+       wl_subsurface_set_position (window_egl->window.subsurface,
+           window_egl->window.window_x, window_egl->window.window_y);
+@@ -289,9 +295,9 @@ create_surfaces (GstGLWindowWaylandEGL * window_egl)
+       window_egl->window.shell_surface =
+           wl_shell_get_shell_surface (display->shell,
+           window_egl->window.surface);
+-      if (window_egl->window.queue)
++      if (window_egl->window.surface_queue)
+         wl_proxy_set_queue ((struct wl_proxy *) window_egl->window.
+-            shell_surface, window_egl->window.queue);
++            shell_surface, window_egl->window.surface_queue);
+ 
+       wl_shell_surface_add_listener (window_egl->window.shell_surface,
+           &shell_surface_listener, window_egl);
+@@ -319,9 +325,9 @@ create_surfaces (GstGLWindowWaylandEGL * window_egl)
+ 
+     window_egl->window.native =
+         wl_egl_window_create (window_egl->window.surface, width, height);
+-    if (window_egl->window.queue)
++    if (window_egl->window.surface_queue)
+       wl_proxy_set_queue ((struct wl_proxy *) window_egl->window.native,
+-          window_egl->window.queue);
++          window_egl->window.surface_queue);
+   }
+ }
+ 
+@@ -374,6 +380,11 @@ gst_gl_window_wayland_egl_close (GstGLWindow * window)
+ 
+   destroy_surfaces (window_egl);
+ 
++  if(window_egl->window.wl_queue) {
++    wl_event_queue_destroy (window_egl->window.wl_queue);
++    window_egl->window.wl_queue = NULL;
++  }
++
+   g_source_destroy (window_egl->wl_source);
+   g_source_unref (window_egl->wl_source);
+   window_egl->wl_source = NULL;
+@@ -402,10 +413,10 @@ gst_gl_window_wayland_egl_open (GstGLWindow * window, GError ** error)
+     return FALSE;
+   }
+ 
+-  window_egl->window.queue = wl_display_create_queue (display->display);
++  window_egl->window.wl_queue = wl_display_create_queue (display->display);
+ 
+   window_egl->wl_source = wayland_event_source_new (display->display,
+-      window_egl->window.queue);
++      window_egl->window.wl_queue);
+ 
+   if (!GST_GL_WINDOW_CLASS (parent_class)->open (window, error))
+     return FALSE;
+@@ -454,7 +465,7 @@ gst_gl_window_wayland_egl_show (GstGLWindow * window)
+   create_surfaces (window_egl);
+ 
+   if (gst_gl_wl_display_roundtrip_queue (display_wayland->display,
+-          window_egl->window.queue) < 0)
++          window_egl->window.surface_queue) < 0)
+     GST_WARNING_OBJECT (window, "failed a roundtrip");
+ }
+ 
+diff --git a/gst-libs/gst/gl/wayland/gstglwindow_wayland_egl.h b/gst-libs/gst/gl/wayland/gstglwindow_wayland_egl.h
+index f76b5b0..2e9bfad 100644
+--- a/gst-libs/gst/gl/wayland/gstglwindow_wayland_egl.h
++++ b/gst-libs/gst/gl/wayland/gstglwindow_wayland_egl.h
+@@ -63,7 +63,7 @@ struct display {
+ struct window {
+   struct display *display;
+ 
+-  struct wl_event_queue     *queue;
++  struct wl_event_queue     *wl_queue, *surface_queue;
+   struct wl_surface         *surface;
+   struct wl_shell_surface   *shell_surface;
+   struct wl_egl_window      *native;
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb
index 280ec26..33cf1e5 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb
@@ -12,6 +12,7 @@ SRC_URI += "file://0001-glimagesink-Downrank-to-marginal.patch \
             file://0005-glfilter-Lost-frame-rate-info-when-fixate-caps.patch \
             file://0006-opencv-Add-video-stitching-support-based-on-Open-CV.patch \
             file://0007-glplugin-glwindow-fix-memory-leak-of-navigation-thre.patch \
+            file://0008-glplugin-gl-wayland-fix-loop-test-hang-in-glimagesin.patch \
 "
 
 SRC_URI[md5sum] = "7c73bec1d389f0e184ebbbbb9e9f883d"
-- 
1.9.1


