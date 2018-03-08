Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 85E907896D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2018 10:10:45 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id d71so6476389iog.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Mar 2018 02:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JAd2OYt9dFtE5exedtVXo347lBCxmTfuohH5v2VQfFE=;
	b=sgwfbaATvh7EngwdeGSQtBXA8ccr3SFjXPHXUK0p6sPDgrP57WARvrqAdclrzcyuIG
	+QIjoDEUbtzs0DJXdqt1kvM8FnUXjWdRrf5bxbd08X7cG1Hr5fWZj6WSEZt/3icoMbM5
	+38qQB5whHSKtEiybq9hupR1JQfkZORENlLZXDPGfjyXFrPQScl4q5ZYkS0FwTALtNbd
	ONXZdPadJ91DtWRQv7qIIQmm0gbEaAWiTh72PNjaQ/emviM4l5hhsQ8xfWf+bC08VAT7
	OBqCU5DB4c1QuImHFUhCZvYtNsz9hqAONcKHNWXo0OmjO2XpqO3pEinLUsSBZPdFEgig
	o8LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JAd2OYt9dFtE5exedtVXo347lBCxmTfuohH5v2VQfFE=;
	b=tI58tMibwz1K5L5sYWbWk1hr7RX1lYmQXvuM0LtclGjurmnIZghYoGpsb11a0BVux0
	e/caHZMlNBqU5xwHCFNgvaJ+gUytRr+zn/BfxPC8kzWRsVjBCN9IDSqqq6Xiz7Xlffxj
	c0yK4DTRwx7bFsKBn/PmEhD2jSgQYFcA3oWBcaqr+0zetDitaUv9ZH9IKVunZ81hMoHd
	po1SFBUIC7Llw11kgIbB5AZOARPLJN5eqVBtbc7AymM3iGxtptfB3XmW4SMKIidvr4O1
	GTNjylcyuB/5PvlbU6mjmDzsXhxVfbXxE7zGKjMJ7oMSe+XU9G+SXdsyTDIRcuVClp/d
	YQMA==
X-Gm-Message-State: APf1xPC8eVMEMrpZDa0q5BkI01cEhHb/ag4uTZ24fxuijA+N3eBVwgha
	0yfuux7W8ot39zBJIXDNcI5v4iCZugM67VKRbBGfZpIS
X-Google-Smtp-Source: AG47ELtI/e0XPWTh50F/4WrK53h8pfXbQBzG38EsPJGYPwekdUfqLNo7QEVX5E62gdw4A6FU+ZrVlFi/hLgvlhxAOLw=
X-Received: by 10.107.7.87 with SMTP id 84mr30738255ioh.216.1520503847424;
	Thu, 08 Mar 2018 02:10:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Thu, 8 Mar 2018 02:10:27 -0800 (PST)
In-Reply-To: <20180308013530.125242-1-joe.slater@windriver.com>
References: <20180308013530.125242-1-joe.slater@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 8 Mar 2018 10:10:27 +0000
Message-ID: <CAJTo0LafrmpRvwVsgA9Lx82o=JnFm5LhbukbZT0ZF13pLQOgdA@mail.gmail.com>
To: Joe Slater <joe.slater@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] gnome-desktop: do not free() a static buffer
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
X-List-Received-Date: Thu, 08 Mar 2018 10:10:46 -0000
Content-Type: multipart/alternative; boundary="001a113ecdf4b49e900566e3e3b6"

--001a113ecdf4b49e900566e3e3b6
Content-Type: text/plain; charset="UTF-8"

I'm not sure we need this patch anymore, it's been rebased on top of
upstream changes but one of those changes were to fix x32 builds:

https://git.gnome.org/browse/gnome-desktop/commit/libgnome-desktop/gnome-desktop-thumbnail.c?id=012cad653253ae5f5248988cda89159f22c1fb1d

I believe we can drop this patch to gnome-desktop.

Ross

On 8 March 2018 at 01:35, Joe Slater <joe.slater@windriver.com> wrote:

> Do not free() the buffer returned by localtime().  Also,
> switch to calling localtime_r() which is re-entrant.
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  ...op-thumbnail-don-t-convert-time_t-to-long.patch | 27
> +++++++++-------------
>  1 file changed, 11 insertions(+), 16 deletions(-)
>
> diff --git a/meta/recipes-gnome/gnome-desktop/gnome-desktop/gnome-
> desktop-thumbnail-don-t-convert-time_t-to-long.patch
> b/meta/recipes-gnome/gnome-desktop/gnome-desktop/gnome-
> desktop-thumbnail-don-t-convert-time_t-to-long.patch
> index c1a7d4f..be657a8 100644
> --- a/meta/recipes-gnome/gnome-desktop/gnome-desktop/gnome-
> desktop-thumbnail-don-t-convert-time_t-to-long.patch
> +++ b/meta/recipes-gnome/gnome-desktop/gnome-desktop/gnome-
> desktop-thumbnail-don-t-convert-time_t-to-long.patch
> @@ -9,12 +9,11 @@ build for X32, where long's size doesn't match that of
> time_t.
>  Upstream-Status: Pending
>  Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>
> ----
> - libgnome-desktop/gnome-desktop-thumbnail.c | 16 ++++++++++++++--
> - 1 file changed, 14 insertions(+), 2 deletions(-)
> +Modified to use localtime_r() and not free() a static structure.
> +
> +Signed-off-by: Joe Slater <jslater@windriver.com>
> +
>
> -diff --git a/libgnome-desktop/gnome-desktop-thumbnail.c
> b/libgnome-desktop/gnome-desktop-thumbnail.c
> -index e56c3d7..5d96bf3 100644
>  --- a/libgnome-desktop/gnome-desktop-thumbnail.c
>  +++ b/libgnome-desktop/gnome-desktop-thumbnail.c
>  @@ -120,6 +120,8 @@
> @@ -30,24 +29,23 @@ index e56c3d7..5d96bf3 100644
>     char *tmp_path = NULL;
>     int tmp_fd;
>     char mtime_str[21];
> -+  struct tm *tmp_mtime = NULL;
> ++  struct tm tmp_mtime;
>     gboolean ret = FALSE;
>     GError *error = NULL;
>     const char *width, *height;
> -@@ -1124,7 +1127,11 @@ save_thumbnail (GdkPixbuf  *pixbuf,
> +@@ -1124,7 +1127,10 @@ save_thumbnail (GdkPixbuf  *pixbuf,
>       goto out;
>     close (tmp_fd);
>
>  -  g_snprintf (mtime_str, 21, "%" G_GINT64_FORMAT, (gint64) mtime);
> -+  tmp_mtime = localtime (&mtime);
> -+  if (!tmp_mtime)
> ++  if (!localtime_r (&mtime,&tmp_mtime))
>  +    goto out;
> -+  strftime (mtime_str, 21, "%s", tmp_mtime);
> -+  free (tmp_mtime);
> ++
> ++  strftime (mtime_str, 21, "%s", &tmp_mtime);
>     width = gdk_pixbuf_get_option (pixbuf, "tEXt::Thumb::Image::Width");
>     height = gdk_pixbuf_get_option (pixbuf, "tEXt::Thumb::Image::Height");
>
> -@@ -1319,6 +1326,7 @@ gnome_desktop_thumbnail_is_valid (GdkPixbuf
>   *pixbuf,
> +@@ -1319,6 +1325,7 @@ gnome_desktop_thumbnail_is_valid (GdkPix
>   {
>     const char *thumb_uri, *thumb_mtime_str;
>     time_t thumb_mtime;
> @@ -55,7 +53,7 @@ index e56c3d7..5d96bf3 100644
>
>     thumb_uri = gdk_pixbuf_get_option (pixbuf, "tEXt::Thumb::URI");
>     if (g_strcmp0 (uri, thumb_uri) != 0)
> -@@ -1327,7 +1335,11 @@ gnome_desktop_thumbnail_is_valid (GdkPixbuf
>     *pixbuf,
> +@@ -1327,7 +1334,11 @@ gnome_desktop_thumbnail_is_valid (GdkPix
>     thumb_mtime_str = gdk_pixbuf_get_option (pixbuf, "tEXt::Thumb::MTime");
>     if (!thumb_mtime_str)
>       return FALSE;
> @@ -68,6 +66,3 @@ index e56c3d7..5d96bf3 100644
>     if (mtime != thumb_mtime)
>       return FALSE;
>
> ---
> -2.14.1
> -
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a113ecdf4b49e900566e3e3b6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m not sure we need this patch anymore, it&#39;s been=
 rebased on top of upstream changes but one of those changes were to fix x3=
2 builds:<div><br></div><div><a href=3D"https://git.gnome.org/browse/gnome-=
desktop/commit/libgnome-desktop/gnome-desktop-thumbnail.c?id=3D012cad653253=
ae5f5248988cda89159f22c1fb1d">https://git.gnome.org/browse/gnome-desktop/co=
mmit/libgnome-desktop/gnome-desktop-thumbnail.c?id=3D012cad653253ae5f524898=
8cda89159f22c1fb1d</a><br></div><div><br></div><div>I believe we can drop t=
his patch to gnome-desktop.</div><div><br></div><div>Ross</div></div><div c=
lass=3D"gmail_extra"><br><div class=3D"gmail_quote">On 8 March 2018 at 01:3=
5, Joe Slater <span dir=3D"ltr">&lt;<a href=3D"mailto:joe.slater@windriver.=
com" target=3D"_blank">joe.slater@windriver.com</a>&gt;</span> wrote:<br><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">Do not free() the buffer returned by localtime=
().=C2=A0 Also,<br>
switch to calling localtime_r() which is re-entrant.<br>
<br>
Signed-off-by: Joe Slater &lt;<a href=3D"mailto:joe.slater@windriver.com">j=
oe.slater@windriver.com</a>&gt;<br>
---<br>
=C2=A0...op-thumbnail-don-t-convert-<wbr>time_t-to-long.patch | 27 ++++++++=
+-------------<br>
=C2=A01 file changed, 11 insertions(+), 16 deletions(-)<br>
<br>
diff --git a/meta/recipes-gnome/gnome-<wbr>desktop/gnome-desktop/gnome-<wbr=
>desktop-thumbnail-don-t-<wbr>convert-time_t-to-long.patch b/meta/recipes-g=
nome/gnome-<wbr>desktop/gnome-desktop/gnome-<wbr>desktop-thumbnail-don-t-<w=
br>convert-time_t-to-long.patch<br>
index c1a7d4f..be657a8 100644<br>
--- a/meta/recipes-gnome/gnome-<wbr>desktop/gnome-desktop/gnome-<wbr>deskto=
p-thumbnail-don-t-<wbr>convert-time_t-to-long.patch<br>
+++ b/meta/recipes-gnome/gnome-<wbr>desktop/gnome-desktop/gnome-<wbr>deskto=
p-thumbnail-don-t-<wbr>convert-time_t-to-long.patch<br>
@@ -9,12 +9,11 @@ build for X32, where long&#39;s size doesn&#39;t match th=
at of time_t.<br>
=C2=A0Upstream-Status: Pending<br>
=C2=A0Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@=
mentor.com">chris_larson@mentor.com</a>&gt;<br>
<br>
----<br>
- libgnome-desktop/gnome-<wbr>desktop-thumbnail.c | 16 ++++++++++++++--<br>
- 1 file changed, 14 insertions(+), 2 deletions(-)<br>
+Modified to use localtime_r() and not free() a static structure.<br>
+<br>
+Signed-off-by: Joe Slater &lt;<a href=3D"mailto:jslater@windriver.com">jsl=
ater@windriver.com</a>&gt;<br>
+<br>
<br>
-diff --git a/libgnome-desktop/gnome-<wbr>desktop-thumbnail.c b/libgnome-de=
sktop/gnome-<wbr>desktop-thumbnail.c<br>
-index e56c3d7..5d96bf3 100644<br>
=C2=A0--- a/libgnome-desktop/gnome-<wbr>desktop-thumbnail.c<br>
=C2=A0+++ b/libgnome-desktop/gnome-<wbr>desktop-thumbnail.c<br>
=C2=A0@@ -120,6 +120,8 @@<br>
@@ -30,24 +29,23 @@ index e56c3d7..5d96bf3 100644<br>
=C2=A0 =C2=A0 char *tmp_path =3D NULL;<br>
=C2=A0 =C2=A0 int tmp_fd;<br>
=C2=A0 =C2=A0 char mtime_str[21];<br>
-+=C2=A0 struct tm *tmp_mtime =3D NULL;<br>
++=C2=A0 struct tm tmp_mtime;<br>
=C2=A0 =C2=A0 gboolean ret =3D FALSE;<br>
=C2=A0 =C2=A0 GError *error =3D NULL;<br>
=C2=A0 =C2=A0 const char *width, *height;<br>
-@@ -1124,7 +1127,11 @@ save_thumbnail (GdkPixbuf=C2=A0 *pixbuf,<br>
+@@ -1124,7 +1127,10 @@ save_thumbnail (GdkPixbuf=C2=A0 *pixbuf,<br>
=C2=A0 =C2=A0 =C2=A0 goto out;<br>
=C2=A0 =C2=A0 close (tmp_fd);<br>
<br>
=C2=A0-=C2=A0 g_snprintf (mtime_str, 21, &quot;%&quot; G_GINT64_FORMAT, (gi=
nt64) mtime);<br>
-+=C2=A0 tmp_mtime =3D localtime (&amp;mtime);<br>
-+=C2=A0 if (!tmp_mtime)<br>
++=C2=A0 if (!localtime_r (&amp;mtime,&amp;tmp_mtime))<br>
=C2=A0+=C2=A0 =C2=A0 goto out;<br>
-+=C2=A0 strftime (mtime_str, 21, &quot;%s&quot;, tmp_mtime);<br>
-+=C2=A0 free (tmp_mtime);<br>
++<br>
++=C2=A0 strftime (mtime_str, 21, &quot;%s&quot;, &amp;tmp_mtime);<br>
=C2=A0 =C2=A0 width =3D gdk_pixbuf_get_option (pixbuf, &quot;tEXt::Thumb::I=
mage::Width&quot;);<br>
=C2=A0 =C2=A0 height =3D gdk_pixbuf_get_option (pixbuf, &quot;tEXt::Thumb::=
Image::Height&quot;);<br>
<br>
-@@ -1319,6 +1326,7 @@ gnome_desktop_thumbnail_is_<wbr>valid (GdkPixbuf=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *pixbuf,<br>
+@@ -1319,6 +1325,7 @@ gnome_desktop_thumbnail_is_<wbr>valid (GdkPix<br>
=C2=A0 {<br>
=C2=A0 =C2=A0 const char *thumb_uri, *thumb_mtime_str;<br>
=C2=A0 =C2=A0 time_t thumb_mtime;<br>
@@ -55,7 +53,7 @@ index e56c3d7..5d96bf3 100644<br>
<br>
=C2=A0 =C2=A0 thumb_uri =3D gdk_pixbuf_get_option (pixbuf, &quot;tEXt::Thum=
b::URI&quot;);<br>
=C2=A0 =C2=A0 if (g_strcmp0 (uri, thumb_uri) !=3D 0)<br>
-@@ -1327,7 +1335,11 @@ gnome_desktop_thumbnail_is_<wbr>valid (GdkPixbuf=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *pixbuf,<br>
+@@ -1327,7 +1334,11 @@ gnome_desktop_thumbnail_is_<wbr>valid (GdkPix<br>
=C2=A0 =C2=A0 thumb_mtime_str =3D gdk_pixbuf_get_option (pixbuf, &quot;tEXt=
::Thumb::MTime&quot;);<br>
=C2=A0 =C2=A0 if (!thumb_mtime_str)<br>
=C2=A0 =C2=A0 =C2=A0 return FALSE;<br>
@@ -68,6 +66,3 @@ index e56c3d7..5d96bf3 100644<br>
=C2=A0 =C2=A0 if (mtime !=3D thumb_mtime)<br>
=C2=A0 =C2=A0 =C2=A0 return FALSE;<br>
<br>
---<br>
-2.14.1<br>
-<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--001a113ecdf4b49e900566e3e3b6--
