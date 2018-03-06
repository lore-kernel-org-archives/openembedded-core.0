Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id B813A78A5E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Mar 2018 11:00:40 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id u5so14242829itc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Mar 2018 03:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oJvxUkLes2vJZRwgZb3O5LrVyY022lioXTMdC54Evoo=;
	b=loAJLtCIqv19T0lqjgUyIhUMAoRMcaRcUU1AoBrkuTM0IYGgQnq0jNCTy2g+hRwuWG
	I4ji2MQw9boZRiKEqipqHLaSYylBvhvw7mlgKGsRj0ZmxAPxpNHuM0fvc6g1NIxDgZBS
	NTCSIsTgs4GQ3/dii2/akZ8C/BsRQ3i3DwFh9qnIrYJ4RHaefOm4EywnBzVxqy5Q40WL
	VqNPaqEhhDXApRdmvBX7QzxkgBXCP8B+WWhA7m8SNoehtG9q6JPfqnoQG5KggS+UH96J
	T2jGHvy1cLgmHLP+arqjQdJreJwqYXCeXLC/gSmYOijzEcIpXH+HfPjOE8K2V4uom6gu
	fiKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oJvxUkLes2vJZRwgZb3O5LrVyY022lioXTMdC54Evoo=;
	b=LwW32OMZLCTl3z1O4avQ/cCm+x6CqBPuV1VXhZTy52GpNwN6y/lMY7lQ/mzvwMx8ok
	KtGf9DHpskXUkR9rwpklESda7+L5w7b1PmVfbfCGKFfURK4/GiiRpiLhJ2KC4sL7lrWV
	PXq8ORS7YimdWu1/U+K4fhiBcCMbps8vT3iOPnT8raQ/UFb9aGsv+8GckcIpSTlxNBGy
	QXxDSlGhUBSg3M8Y7qaEXPSnoDK1U23GlkOFHIT1zvPswDWJ5U7IwcRLltqsBTrXMPgF
	TuS/2ap3UuNTZZRSrUjMyVuIlRkbc3z3bAnHiNS+s4We2+5QH4AEtQaPzp6DT4BfJYzL
	bBbQ==
X-Gm-Message-State: AElRT7EBs9/+NH8uqGXTWMiao2zmI4GSDnYgrWqQFv+NmVM92jZWmvvg
	HvQ5m0fQmmUyrsktAn4bgc89L93gAqOJLD21/X4EWg==
X-Google-Smtp-Source: AG47ELsg/VlCFveQY5HHyk/A//yYoM4XOqIyGr+zscZsZnLzBIX1gENwWHO966he4rut9Mvb+bVjr2xDxsNEUOS74u0=
X-Received: by 10.36.36.144 with SMTP id f138mr16930038ita.131.1520334041857; 
	Tue, 06 Mar 2018 03:00:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Tue, 6 Mar 2018 03:00:21 -0800 (PST)
In-Reply-To: <20180306000432.254391-1-joe.slater@windriver.com>
References: <20180306000432.254391-1-joe.slater@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 6 Mar 2018 11:00:21 +0000
Message-ID: <CAJTo0LYCeT8iLNzs+zaAYPL6PMsmStiOYLvit7FdZ7wMzmf-AQ@mail.gmail.com>
To: Joe Slater <joe.slater@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] gnome-desktop3: eliminate erroneous free()
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
X-List-Received-Date: Tue, 06 Mar 2018 11:00:40 -0000
Content-Type: multipart/alternative; boundary="001a1147cd308157910566bc5a0d"

--001a1147cd308157910566bc5a0d
Content-Type: text/plain; charset="UTF-8"

Please don't patch a patch, but fix the patch.

Ross

On 6 March 2018 at 00:04, Joe Slater <joe.slater@windriver.com> wrote:

> gnome-desktop-thumbnail-don-t-convert-time_t-to-long.patch introduced
> a call to localtime() and a free() of the structure returned.  This is
> incorrect, as the structure is static.  For glibc 2.26, this will cause
> the program to abort.  Eliminate the free() and call localtime_r()
> which lets us allocate the tm structure.
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  .../gnome-desktop/fix_erroneous_free.patch         | 35
> ++++++++++++++++++++++
>  .../gnome-desktop/gnome-desktop3_3.26.2.bb         |  1 +
>  2 files changed, 36 insertions(+)
>  create mode 100644 meta/recipes-gnome/gnome-desktop/gnome-desktop/fix_
> erroneous_free.patch
>
> diff --git a/meta/recipes-gnome/gnome-desktop/gnome-desktop/fix_erroneous_free.patch
> b/meta/recipes-gnome/gnome-desktop/gnome-desktop/fix_erroneous_free.patch
> new file mode 100644
> index 0000000..c27e4d5
> --- /dev/null
> +++ b/meta/recipes-gnome/gnome-desktop/gnome-desktop/fix_
> erroneous_free.patch
> @@ -0,0 +1,35 @@
> +gnome-desktop3: eliminate erroneous free()
> +
> +Do not free() a static structure.  Use re-entrant localtime_r().
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Joe Slater <jslater@windriver.com>
> +
> +
> +--- a/libgnome-desktop/gnome-desktop-thumbnail.c
> ++++ b/libgnome-desktop/gnome-desktop-thumbnail.c
> +@@ -1200,7 +1200,7 @@ save_thumbnail (GdkPixbuf  *pixbuf,
> +   char *tmp_path = NULL;
> +   int tmp_fd;
> +   char mtime_str[21];
> +-  struct tm *tmp_mtime = NULL;
> ++  struct tm tmp_mtime;
> +   gboolean ret = FALSE;
> +   GError *error = NULL;
> +   const char *width, *height;
> +@@ -1220,11 +1220,10 @@ save_thumbnail (GdkPixbuf  *pixbuf,
> +     goto out;
> +   close (tmp_fd);
> +
> +-  tmp_mtime = localtime (&mtime);
> +-  if (!tmp_mtime)
> ++  if (!localtime_r (&mtime,&tmp_mtime))
> +     goto out;
> +-  strftime (mtime_str, 21, "%s", tmp_mtime);
> +-  free (tmp_mtime);
> ++
> ++  strftime (mtime_str, 21, "%s", &tmp_mtime);
> +   width = gdk_pixbuf_get_option (pixbuf, "tEXt::Thumb::Image::Width");
> +   height = gdk_pixbuf_get_option (pixbuf, "tEXt::Thumb::Image::Height");
> +
> diff --git a/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.26.2.bb
> b/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.26.2.bb
> index cd6c194..2cd3234 100644
> --- a/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.26.2.bb
> +++ b/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.26.2.bb
> @@ -14,6 +14,7 @@ SRC_URI += " \
>             file://gnome-desktop-thumbnail-don-t-convert-time_t-to-long.patch
> \
>             file://0001-configure.ac-Remove-gnome-common-macro-calls.patch
> \
>             file://0001-Disable-libseccomp-sycall-filtering-mechanism.patch
> \
> +           file://fix_erroneous_free.patch \
>             "
>
>  DEPENDS += "intltool-native gsettings-desktop-schemas gconf
> virtual/libx11 gtk+3 glib-2.0 startup-notification xkeyboard-config
> iso-codes udev"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1147cd308157910566bc5a0d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Please don&#39;t patch a patch, but fix the patch.<div><br=
></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div class=3D"gm=
ail_quote">On 6 March 2018 at 00:04, Joe Slater <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:joe.slater@windriver.com" target=3D"_blank">joe.slater@windriv=
er.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">gnome-deskto=
p-thumbnail-don-t-<wbr>convert-time_t-to-long.patch introduced<br>
a call to localtime() and a free() of the structure returned.=C2=A0 This is=
<br>
incorrect, as the structure is static.=C2=A0 For glibc 2.26, this will caus=
e<br>
the program to abort.=C2=A0 Eliminate the free() and call localtime_r()<br>
which lets us allocate the tm structure.<br>
<br>
Signed-off-by: Joe Slater &lt;<a href=3D"mailto:joe.slater@windriver.com">j=
oe.slater@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../gnome-desktop/fix_<wbr>erroneous_free.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 35 ++++++++++++++++++++++<br>
=C2=A0.../gnome-desktop/<a href=3D"http://gnome-desktop3_3.26.2.bb" rel=3D"=
noreferrer" target=3D"_blank">gnome-<wbr>desktop3_3.26.2.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A02 files changed, 36 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-gnome/gnome-<wbr>desktop/gnome-deskto=
p/fix_<wbr>erroneous_free.patch<br>
<br>
diff --git a/meta/recipes-gnome/gnome-<wbr>desktop/gnome-desktop/fix_<wbr>e=
rroneous_free.patch b/meta/recipes-gnome/gnome-<wbr>desktop/gnome-desktop/f=
ix_<wbr>erroneous_free.patch<br>
new file mode 100644<br>
index 0000000..c27e4d5<br>
--- /dev/null<br>
+++ b/meta/recipes-gnome/gnome-<wbr>desktop/gnome-desktop/fix_<wbr>erroneou=
s_free.patch<br>
@@ -0,0 +1,35 @@<br>
+gnome-desktop3: eliminate erroneous free()<br>
+<br>
+Do not free() a static structure.=C2=A0 Use re-entrant localtime_r().<br>
+<br>
+Upstream-Status: Pending<br>
+<br>
+Signed-off-by: Joe Slater &lt;<a href=3D"mailto:jslater@windriver.com">jsl=
ater@windriver.com</a>&gt;<br>
+<br>
+<br>
+--- a/libgnome-desktop/gnome-<wbr>desktop-thumbnail.c<br>
++++ b/libgnome-desktop/gnome-<wbr>desktop-thumbnail.c<br>
+@@ -1200,7 +1200,7 @@ save_thumbnail (GdkPixbuf=C2=A0 *pixbuf,<br>
+=C2=A0 =C2=A0char *tmp_path =3D NULL;<br>
+=C2=A0 =C2=A0int tmp_fd;<br>
+=C2=A0 =C2=A0char mtime_str[21];<br>
+-=C2=A0 struct tm *tmp_mtime =3D NULL;<br>
++=C2=A0 struct tm tmp_mtime;<br>
+=C2=A0 =C2=A0gboolean ret =3D FALSE;<br>
+=C2=A0 =C2=A0GError *error =3D NULL;<br>
+=C2=A0 =C2=A0const char *width, *height;<br>
+@@ -1220,11 +1220,10 @@ save_thumbnail (GdkPixbuf=C2=A0 *pixbuf,<br>
+=C2=A0 =C2=A0 =C2=A0goto out;<br>
+=C2=A0 =C2=A0close (tmp_fd);<br>
+<br>
+-=C2=A0 tmp_mtime =3D localtime (&amp;mtime);<br>
+-=C2=A0 if (!tmp_mtime)<br>
++=C2=A0 if (!localtime_r (&amp;mtime,&amp;tmp_mtime))<br>
+=C2=A0 =C2=A0 =C2=A0goto out;<br>
+-=C2=A0 strftime (mtime_str, 21, &quot;%s&quot;, tmp_mtime);<br>
+-=C2=A0 free (tmp_mtime);<br>
++<br>
++=C2=A0 strftime (mtime_str, 21, &quot;%s&quot;, &amp;tmp_mtime);<br>
+=C2=A0 =C2=A0width =3D gdk_pixbuf_get_option (pixbuf, &quot;tEXt::Thumb::I=
mage::Width&quot;);<br>
+=C2=A0 =C2=A0height =3D gdk_pixbuf_get_option (pixbuf, &quot;tEXt::Thumb::=
Image::Height&quot;);<br>
+<br>
diff --git a/meta/recipes-gnome/gnome-<wbr>desktop/<a href=3D"http://gnome-=
desktop3_3.26.2.bb" rel=3D"noreferrer" target=3D"_blank">gnome-desktop3_3.2=
6.2.<wbr>bb</a> b/meta/recipes-gnome/gnome-<wbr>desktop/<a href=3D"http://g=
nome-desktop3_3.26.2.bb" rel=3D"noreferrer" target=3D"_blank">gnome-desktop=
3_3.26.2.<wbr>bb</a><br>
index cd6c194..2cd3234 100644<br>
--- a/meta/recipes-gnome/gnome-<wbr>desktop/<a href=3D"http://gnome-desktop=
3_3.26.2.bb" rel=3D"noreferrer" target=3D"_blank">gnome-desktop3_3.26.2.<wb=
r>bb</a><br>
+++ b/meta/recipes-gnome/gnome-<wbr>desktop/<a href=3D"http://gnome-desktop=
3_3.26.2.bb" rel=3D"noreferrer" target=3D"_blank">gnome-desktop3_3.26.2.<wb=
r>bb</a><br>
@@ -14,6 +14,7 @@ SRC_URI +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://gnome-desktop-<wbr>thumbna=
il-don-t-convert-time_<wbr>t-to-long.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-configure.ac-<wbr>Rem=
ove-gnome-common-macro-<wbr>calls.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Disable-<wbr>libsecco=
mp-sycall-filtering-<wbr>mechanism.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://fix_erroneous_free.<wbr>pa=
tch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0DEPENDS +=3D &quot;intltool-native gsettings-desktop-schemas gconf vi=
rtual/libx11 gtk+3 glib-2.0 startup-notification xkeyboard-config iso-codes=
 udev&quot;<br>
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

--001a1147cd308157910566bc5a0d--
