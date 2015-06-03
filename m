Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 3E372757A2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jun 2015 14:56:57 +0000 (UTC)
Received: by wiga1 with SMTP id a1so17439945wig.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jun 2015 07:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=5UNgaa1T5qblgmdFlPTIscCl11z1cOsXs0xIFmNcJ/o=;
	b=vum3LpiMUpT3+NqkK0RC6HQP0g10xMNwnBEkBq6xznM6WrlwPlM+gZNkhXOgavMd0J
	hhMqGYJ4wgABjvvBXYfKcj12LpoRhP8+I5RpKTmlNx0bRs2gWZSUSTmo+VcmnO/3cm6v
	c1NOx1qZzucnzYqpl6jh51MCy77HgogQk7w9W9Rfgfel8zFa+oTxXSDmFNAB5ZpuSQ6a
	Mpl21welojnieZ/CqLVbj6QiYbw4A3S/UFz0ihTVmluDrOycTfu8IQDu7NSlzYKyIxf5
	0IwhZw3HNKMLUDxI5EGEm+OsAnjAspL6YJgasXrrVZ2/59lwD89vFDcjX+LDI7iwXLrC
	vhGg==
X-Received: by 10.180.218.108 with SMTP id pf12mr42037816wic.93.1433343418137; 
	Wed, 03 Jun 2015 07:56:58 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id w11sm1437821wjr.48.2015.06.03.07.56.57
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Jun 2015 07:56:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 3 Jun 2015 16:57:13 +0200
To: Gary Thomas <gary@mlbassoc.com>
Message-ID: <20150603145713.GC2380@jama>
References: <1433342867-4644-1-git-send-email-gary@mlbassoc.com>
	<1433342867-4644-2-git-send-email-gary@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <1433342867-4644-2-git-send-email-gary@mlbassoc.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] gst-player: Update to latest GIT
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
X-List-Received-Date: Wed, 03 Jun 2015 14:57:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 03, 2015 at 08:47:46AM -0600, Gary Thomas wrote:
> This patch brings gst-player up to a more recent version (2015-0-21)
> Also, drop old patches which have been incorporated upstream.

2015-0-21?

>=20
> Signed-off-by: Gary Thomas <gary@mlbassoc.com>
> ---
>  .../gstreamer/gst-player/gtk2.patch                | 121 +++++++++++++++=
++++--
>  .../recipes-multimedia/gstreamer/gst-player_git.bb |   7 +-
>  2 files changed, 112 insertions(+), 16 deletions(-)
>=20
> diff --git a/meta/recipes-multimedia/gstreamer/gst-player/gtk2.patch b/me=
ta/recipes-multimedia/gstreamer/gst-player/gtk2.patch
> index 2cd18bb..6cc8946 100644
> --- a/meta/recipes-multimedia/gstreamer/gst-player/gtk2.patch
> +++ b/meta/recipes-multimedia/gstreamer/gst-player/gtk2.patch
> @@ -5,10 +5,10 @@ Upstream-Status: Inappropriate
>  Signed-off-by: Ross Burton <ross.burton@intel.com>
> =20
> =20
> -diff --git a/configure.ac b/configure.ac
> -index b8af13b..90ab74c 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> +Index: git/configure.ac
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/configure.ac
> ++++ git/configure.ac
>  @@ -60,7 +60,7 @@ AC_SUBST(GLIB_PREFIX)
>   GST_PREFIX=3D"`$PKG_CONFIG --variable=3Dprefix gstreamer-1.0`"
>   AC_SUBST(GST_PREFIX)
> @@ -18,14 +18,15 @@ index b8af13b..90ab74c 100644
>   AM_CONDITIONAL(HAVE_GTK, test "x$have_gtk" !=3D "xno")
>  =20
>   GOBJECT_INTROSPECTION_CHECK([1.31.1])
> -diff --git a/gtk/gtk-play.c b/gtk/gtk-play.c
> -index f015077..954d6fb 100644
> ---- a/gtk/gtk-play.c
> -+++ b/gtk/gtk-play.c
> -@@ -34,6 +34,46 @@ typedef struct
> -   gulong seekbar_value_changed_signal_id;
> - } GtkPlay;
> +Index: git/gtk/gtk-play.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/gtk/gtk-play.c
> ++++ git/gtk/gtk-play.c
> +@@ -98,6 +98,145 @@ enum
> + };
>  =20
> + static void display_cover_art (GtkPlay * play, GstPlayerMediaInfo * med=
ia_info);
> ++=20
>  +/* Compat stubs */
>  +GtkWidget *
>  +gtk_box_new (GtkOrientation orientation,
> @@ -66,6 +67,104 @@ index f015077..954d6fb 100644
>  +    return gtk_vscale_new_with_range (min, max, step);
>  +  }
>  +}
> ++
> ++/**
> ++ * gtk_window_close:
> ++ * @window: a #GtkWindow
> ++ *
> ++ * Requests that the window is closed, similar to what happens
> ++ * when a window manager close button is clicked.
> ++ *
> ++ * This function can be used with close buttons in custom
> ++ * titlebars.
> ++ *
> ++ * Since: 3.10
> ++ */
> ++void
> ++gtk_window_close (GtkWindow *window)
> ++{
> ++#if 0
> ++  if (!gtk_widget_get_realized (GTK_WIDGET (window)))
> ++    return;
> ++
> ++  window->priv->delete_event_handler =3D gdk_threads_add_idle (send_del=
ete_event, window);
> ++  g_source_set_name_by_id (window->priv->delete_event_handler, "[gtk+] =
send_delete_event");
> ++#endif
> ++  gtk_widget_destroy(window);
> ++}
> ++
> ++/**
> ++ * gtk_widget_is_visible:
> ++ * @widget: a #GtkWidget
> ++ *
> ++ * Determines whether the widget and all its parents are marked as
> ++ * visible.
> ++ *
> ++ * This function does not check if the widget is obscured in any way.
> ++ *
> ++ * See also gtk_widget_get_visible() and gtk_widget_set_visible()
> ++ *
> ++ * Returns: %TRUE if the widget and all its parents are visible
> ++ *
> ++ * Since: 3.8
> ++ **/
> ++gboolean
> ++gtk_widget_is_visible (GtkWidget *widget)
> ++{
> ++  g_return_val_if_fail (GTK_IS_WIDGET (widget), FALSE);
> ++
> ++  while (widget)
> ++    {
> ++      //      GtkWidgetPrivate *priv =3D widget->priv;
> ++
> ++      if (!gtk_widget_get_visible(widget))
> ++        return FALSE;
> ++
> ++      //      widget =3D priv->parent;
> ++      widget =3D widget->parent;
> ++    }
> ++
> ++  return TRUE;
> ++}
> ++
> ++/**
> ++ * gtk_widget_get_allocated_width:
> ++ * @widget: the widget to query
> ++ *
> ++ * Returns the width that has currently been allocated to @widget.
> ++ * This function is intended to be used when implementing handlers
> ++ * for the #GtkWidget::draw function.
> ++ *
> ++ * Returns: the width of the @widget
> ++ **/
> ++int
> ++gtk_widget_get_allocated_width (GtkWidget *widget)
> ++{
> ++  g_return_val_if_fail (GTK_IS_WIDGET (widget), 0);
> ++
> ++  return widget->allocation.width;
> ++}
> ++
> ++/**
> ++ * gtk_widget_get_allocated_height:
> ++ * @widget: the widget to query
> ++ *
> ++ * Returns the height that has currently been allocated to @widget.
> ++ * This function is intended to be used when implementing handlers
> ++ * for the #GtkWidget::draw function.
> ++ *
> ++ * Returns: the height of the @widget
> ++ **/
> ++int
> ++gtk_widget_get_allocated_height (GtkWidget *widget)
> ++{
> ++  g_return_val_if_fail (GTK_IS_WIDGET (widget), 0);
> ++
> ++  return widget->allocation.height;
> ++}
> ++
> ++
> ++/* end compat stubs */
>  =20
>   static void
>   set_title (GtkPlay * play, const gchar * title)
> diff --git a/meta/recipes-multimedia/gstreamer/gst-player_git.bb b/meta/r=
ecipes-multimedia/gstreamer/gst-player_git.bb
> index 54cfbbc..7a68284 100644
> --- a/meta/recipes-multimedia/gstreamer/gst-player_git.bb
> +++ b/meta/recipes-multimedia/gstreamer/gst-player_git.bb
> @@ -1,18 +1,15 @@
>  SUMMARY=3D"GStreamer playback helper library and examples"
> =20
>  LICENSE =3D "LGPL-2.0+"
> -LIC_FILES_CHKSUM =3D "file://lib/gst/player/gstplayer.c;beginline=3D1;en=
dline=3D19;md5=3D03aeca9d8295f811817909075a15ff65"
> +LIC_FILES_CHKSUM =3D "file://lib/gst/player/gstplayer.c;beginline=3D1;en=
dline=3D19;md5=3De17548b76f29cc2fe3de3b61f9ff02d6"
> =20
>  DEPENDS =3D "glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base gtk+"
> =20
>  SRC_URI =3D "git://github.com/sdroege/gst-player.git \
> -           file://filechooser.patch \
>             file://gtk2.patch \
> -           file://Fix-pause-play.patch \
> -           file://Add-error-signal-emission-for-missing-plugins.patch \

Are these .patch files used somewhere else? If not then delete them in
the same commit.

>             file://gst-player.desktop"
> =20
> -SRCREV =3D "5386c5b984d40ef5434673ed62204e69aaf52645"
> +SRCREV =3D "88e04854ffbeffb5fa37073fb6c1922a49bd16e5"
> =20
>  S =3D "${WORKDIR}/git"
> =20
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

