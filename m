Return-Path: <s.mueller-klieser@phytec.de>
Received: from root.phytec.de (mail.phycard.co.uk [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id 3A7D276B7C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Aug 2016 13:35:24 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id 8A69BA0040B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Aug 2016 15:27:58 +0200 (CEST)
Received: from lws-mklieser.phytec.de ([172.16.10.21])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP5 HF413)
	with ESMTP id 2016080415275721-19326 ;
	Thu, 4 Aug 2016 15:27:57 +0200 
From: =?UTF-8?q?Stefan=20M=C3=BCller-Klieser?= <s.mueller-klieser@phytec.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 4 Aug 2016 15:27:48 +0200
Message-Id: <1470317274-27771-2-git-send-email-s.mueller-klieser@phytec.de>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1470317274-27771-1-git-send-email-s.mueller-klieser@phytec.de>
References: <1470317274-27771-1-git-send-email-s.mueller-klieser@phytec.de>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP5
	HF413|March 21, 2016) at 04.08.2016 15:27:57,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP5 HF413|March 21,
	2016) at 04.08.2016 15:27:57
X-TNEFEvaluated: 1
Subject: [PATCH 1/7] gstreamer1.0-plugins-bad: remove two dangling patches
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
X-List-Received-Date: Thu, 04 Aug 2016 13:35:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.de>
---
 .../0001-glimagesink-Downrank-to-marginal.patch    | 32 ------------------=
--
 ...window-fix-memory-leak-of-navigation-thre.patch | 35 ------------------=
----
 2 files changed, 67 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-=
bad/0001-glimagesink-Downrank-to-marginal.patch
 delete mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-=
bad/0002-glplugin-glwindow-fix-memory-leak-of-navigation-thre.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/000=
1-glimagesink-Downrank-to-marginal.patch b/meta/recipes-multimedia/gstreame=
r/gstreamer1.0-plugins-bad/0001-glimagesink-Downrank-to-marginal.patch
deleted file mode 100644
index 1085e95..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-glima=
gesink-Downrank-to-marginal.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From c6b37a80806f9128de47f1ccc3f2354f8d436bb6 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Thu, 24 Sep 2015 19:47:32 +0300
-Subject: [PATCH] glimagesink: Downrank to marginal
-
-On desktop, where there is good OpenGL, xvimagesink will come up first,
-on other platforms, OpenGL can't be trusted because it's either software (=
like
-in a VM) or broken (like on embedded)., so let ximagesink come above.
-
-Upstream-Status: Submitted [https://bugzilla.gnome.org/show=5Fbug.cgi?id=
=3D751684]
-
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- ext/gl/gstopengl.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/ext/gl/gstopengl.c b/ext/gl/gstopengl.c
-index a4b2540..0ccaacd 100644
---- a/ext/gl/gstopengl.c
-+++ b/ext/gl/gstopengl.c
-@@ -101,7 +101,7 @@ plugin=5Finit (GstPlugin * plugin)
- #endif
-=20
-   if (!gst=5Felement=5Fregister (plugin, "glimagesink",
--          GST=5FRANK=5FSECONDARY, gst=5Fgl=5Fimage=5Fsink=5Fbin=5Fget=5Ft=
ype ())) {
-+          GST=5FRANK=5FMARGINAL, gst=5Fgl=5Fimage=5Fsink=5Fbin=5Fget=5Fty=
pe ())) {
-     return FALSE;
-   }
-=20
---=20
-2.1.4
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/000=
2-glplugin-glwindow-fix-memory-leak-of-navigation-thre.patch b/meta/recipes=
-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-glplugin-glwindow-fix-m=
emory-leak-of-navigation-thre.patch
deleted file mode 100755
index 3491a15..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-glplu=
gin-glwindow-fix-memory-leak-of-navigation-thre.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 95cda7fbcf1a81289d9315c801c8e2b3d896f4cb Mon Sep 17 00:00:00 2001
-From: Haihua Hu <b55597@freescale.com>
-Date: Mon, 30 Nov 2015 09:36:09 +0800
-Subject: [PATCH 2/5] [glplugin] glwindow: fix memory leak of navigation
- thread
-
-When exit navigation thread, call g=5Fthread=5Fjoin() to release
-the resource hold by it.
-
-Upstream-Status: Backport [1.7.1]
-
-bugzilla URL: https://bugzilla.gnome.org/show=5Fbug.cgi?id=3D758820
-
-Signed-off-by: Haihua Hu <b55597@freescale.com>
----
- gst-libs/gst/gl/gstglwindow.c |    3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/gst-libs/gst/gl/gstglwindow.c b/gst-libs/gst/gl/gstglwindow.c
-index 44b74ca..42ef296 100644
---- a/gst-libs/gst/gl/gstglwindow.c
-+++ b/gst-libs/gst/gl/gstglwindow.c
-@@ -343,6 +343,9 @@ gst=5Fgl=5Fwindow=5Ffinalize (GObject * object)
-     while (window->nav=5Falive) {
-       g=5Fcond=5Fwait (&window->nav=5Fdestroy=5Fcond, &window->nav=5Flock=
);
-     }
-+    /* release resource hold by navigation thread */
-+    g=5Fthread=5Fjoin(window->priv->navigation=5Fthread);
-+    window->priv->navigation=5Fthread =3D NULL;
-     g=5Fmutex=5Funlock (&window->nav=5Flock);
-   }
-=20
---=20
-1.7.9.5
-
--=20
1.9.1


