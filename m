Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7E76D71BEB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 23:45:29 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id qn10so9688670pac.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 16:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=aOcC4q1D6HMN2H+AlcvHNrjegMnOGtmnAF4MkJVRhkc=;
	b=xEky1OiQnFSx1+NF4jVaeX0Np+KbRz2CWjYmBBOTus53xON9A76Z0RsHs1adFUqMye
	Paks2N3x5Do3bFXK6DR+RObqXOAqDktPmfhW447gcOeSQhIezN9pKI5MEAq4Ru4iNnJB
	odE3z3Ey1FbUMQZ+teu1pHq7f6C9wkzRDh5nMFr1t6QKWpdM3cADVvuR+YEwVvXV+ZUv
	FCn48CCGpwIO4ceP2I6O2Ef29RWZFI//YjKxC/Je8SBbaN2AfP8k90cF0QvCplcuA0qt
	gb0iJ77u/wapCUBjN0nxnroRsdVC0Yid0ex4/3Ckc3ddi0ShrgIv1C9edLblzbhsuiqv
	tbDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=aOcC4q1D6HMN2H+AlcvHNrjegMnOGtmnAF4MkJVRhkc=;
	b=Ci9kCHZKCKChDT9QyvOAwAq3TqRCxq9lXhK2zBt2A7RdA5dFTn/KvmIhjHgvltuZLk
	HjDjd5beqdkYBEQW9Hdt/j9zDRU+7SH2gvzgLEztBUU3Iq8+DF/WvIHsiemxG6p3t9sW
	QPd14M+s7pImL87y6ueZDAfTqfx+o6e8/4+wRwm6rinZNML4I37dAbgHzDxCR3EoDwVp
	LGdRwfmFKPa2kX4onttHTALwF3IzLGI9vZDsvgmApcTJoA/SaBsjire46JfIkYNJD8q2
	qgahTCD9DnuQnisqbT7OUNcnQ1rYOqZ0CkgLtngoq7PZUm+EQWfjDeSegtrIKoLhDL/+
	Ew/A==
X-Gm-Message-State: AA6/9RmN0VkKsdVkN9y9h3WTfGXK9b0gUMpbTSRU7fkyE98I0CaaNT7M29Aea2XapBq96Q==
X-Received: by 10.66.4.231 with SMTP id n7mr95310pan.96.1476747930711;
	Mon, 17 Oct 2016 16:45:30 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:ec00:906:f8cb:31c1?
	([2601:646:8882:b8c:ec00:906:f8cb:31c1])
	by smtp.gmail.com with ESMTPSA id
	e74sm49721909pfk.13.2016.10.17.16.45.29
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 17 Oct 2016 16:45:29 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1476182952-15222-5-git-send-email-carol.zhu@nxp.com>
Date: Mon, 17 Oct 2016 16:45:28 -0700
Message-Id: <101BB525-C749-406D-96D9-27BED2620D4E@gmail.com>
References: <1476182952-15222-1-git-send-email-carol.zhu@nxp.com>
	<1476182952-15222-5-git-send-email-carol.zhu@nxp.com>
To: Yuqing Zhu <carol.zhu@nxp.com>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [poky][PATCH 4/4] gstreamer1.0-plugins-bad: Fix glimagesink cannot show frame when connect to qmlglsrc
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
X-List-Received-Date: Mon, 17 Oct 2016 23:45:29 -0000
X-Groupsio-MsgNum: 88297
Content-Type: multipart/signed;
	boundary="Apple-Mail=_50B5D759-573A-4815-A605-5452ABBBC5AA";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_50B5D759-573A-4815-A605-5452ABBBC5AA
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

this series looks ok to me

> On Oct 11, 2016, at 3:49 AM, Yuqing Zhu <carol.zhu@nxp.com> wrote:
>=20
> 1.When connect to qmlglsrc, x11 event loop will be replace by qt event =
loop
>  which will cause the window cannot receive event from xserver, such =
as resize.
>=20
> 2.Also advertise support for the affine transformation meta in the =
allocation
>  query.
>=20
> Signed-off-by: Yuqing Zhu <carol.zhu@nxp.com>
> ---
> ...x-glimagesink-cannot-show-frame-when-conn.patch | 71 =
++++++++++++++++++++++
> .../gstreamer/gstreamer1.0-plugins-bad_1.8.3.bb    |  1 +
> 2 files changed, 72 insertions(+)
> create mode 100755 =
meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0013-glwindow-F=
ix-glimagesink-cannot-show-frame-when-conn.patch
>=20
> diff --git =
a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0013-glwindow=
-Fix-glimagesink-cannot-show-frame-when-conn.patch =
b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0013-glwindow=
-Fix-glimagesink-cannot-show-frame-when-conn.patch
> new file mode 100755
> index 0000000..eb79c5a
> --- /dev/null
> +++ =
b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0013-glwindow=
-Fix-glimagesink-cannot-show-frame-when-conn.patch
> @@ -0,0 +1,71 @@
> +=46rom 139e50acd70b8ce0e220d7d7433ccfe43a6b1fd8 Mon Sep 17 00:00:00 =
2001
> +From: Haihua Hu <jared.hu@nxp.com>
> +Date: Wed, 27 Jul 2016 10:55:01 +0800
> +Subject: [PATCH 5/6] glwindow: Fix glimagesink cannot show frame when =
connect
> + to qmlglsrc
> +
> +1.When connect to qmlglsrc, x11 event loop will be replace by qt =
event loop
> +  which will cause the window cannot receive event from xserver, such =
as resize
> +2.Also advertise support for the affine transformation meta in the =
allocation
> +  query.
> +
> +Upstream-Status: Backport [1.9.2]
> +
> +https://bugzilla.gnome.org/show_bug.cgi?id=3D768160
> +
> +Signed-off-by: Haihua Hu <jared.hu@nxp.com>
> +---
> + ext/gl/gstglimagesink.c               |  2 ++
> + gst-libs/gst/gl/x11/gstglwindow_x11.c | 14 +++++++++-----
> + 2 files changed, 11 insertions(+), 5 deletions(-)
> +
> +diff --git a/ext/gl/gstglimagesink.c b/ext/gl/gstglimagesink.c
> +index cd3147d..d81fcfb 100644
> +--- a/ext/gl/gstglimagesink.c
> ++++ b/ext/gl/gstglimagesink.c
> +@@ -1957,6 +1957,8 @@ gst_glimage_sink_propose_allocation =
(GstBaseSink * bsink, GstQuery * query)
> +
> +   gst_query_add_allocation_meta (query,
> +       GST_VIDEO_OVERLAY_COMPOSITION_META_API_TYPE, allocation_meta);
> ++  gst_query_add_allocation_meta (query,
> ++      GST_VIDEO_AFFINE_TRANSFORMATION_META_API_TYPE, 0);
> +
> +   if (allocation_meta)
> +     gst_structure_free (allocation_meta);
> +diff --git a/gst-libs/gst/gl/x11/gstglwindow_x11.c =
b/gst-libs/gst/gl/x11/gstglwindow_x11.c
> +index 67160f6..bc7b9c0 100644
> +--- a/gst-libs/gst/gl/x11/gstglwindow_x11.c
> ++++ b/gst-libs/gst/gl/x11/gstglwindow_x11.c
> +@@ -399,6 +399,7 @@ draw_cb (gpointer data)
> +   GstGLWindow *window =3D GST_GL_WINDOW (window_x11);
> +
> +   if (gst_gl_window_is_running (window)) {
> ++    guint width, height;
> +     XWindowAttributes attr;
> +
> +     XGetWindowAttributes (window_x11->device, =
window_x11->internal_win_id,
> +@@ -422,13 +423,16 @@ draw_cb (gpointer data)
> +       }
> +     }
> +
> +-    if (window_x11->allow_extra_expose_events) {
> +-      if (window->queue_resize) {
> +-        guint width, height;
> ++    gst_gl_window_get_surface_dimensions (window, &width, &height);
> ++    if (attr.width !=3D width || attr.height !=3D height) {
> ++      width =3D attr.width;
> ++      height =3D attr.height;
> ++      gst_gl_window_queue_resize (window);
> ++    }
> +
> +-        gst_gl_window_get_surface_dimensions (window, &width, =
&height);
> ++    if (window_x11->allow_extra_expose_events) {
> ++      if (window->queue_resize)
> +         gst_gl_window_resize (window, width, height);
> +-      }
> +
> +       if (window->draw) {
> +         GstGLContext *context =3D gst_gl_window_get_context =
(window);
> +--
> +1.9.1
> +
> diff --git =
a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.3.bb =
b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.3.bb
> index 2bde0a6..55ffce9 100644
> --- =
a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.3.bb
> +++ =
b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.3.bb
> @@ -22,6 +22,7 @@ SRC_URI =3D " \
>     file://0010-glplugin-glimagesink-support-video-rotat.patch \
>     =
file://0011-EGL_DMA_Buf-Wrong-attribute-list-type-for-EGL-1.5.patch \
>     =
file://0012-glimagesink-Fix-horizontal-vertical-flip-matrizes.patch \
> +    =
file://0013-glwindow-Fix-glimagesink-cannot-show-frame-when-conn.patch \
> "
> SRC_URI[md5sum] =3D "955281a43e98c5464563fa049e0a0911"
> SRC_URI[sha256sum] =3D =
"7899fcb18e6a1af2888b19c90213af018a57d741c6e72ec56b133bc73ec8509b"
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_50B5D759-573A-4815-A605-5452ABBBC5AA
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgFYpgACgkQuwUzVZGdMxTzlQCeJM571tBKdsn8r1C9MGyOdy+o
csUAniapwonOzz0wljQ5CK/p/GETsfxo
=frTq
-----END PGP SIGNATURE-----

--Apple-Mail=_50B5D759-573A-4815-A605-5452ABBBC5AA--
