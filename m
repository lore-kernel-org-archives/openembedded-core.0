Return-Path: <sebmennetrier@gmail.com>
Received: from mail-ie0-f170.google.com (mail-ie0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 5645660E07
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Mar 2014 08:18:26 +0000 (UTC)
Received: by mail-ie0-f170.google.com with SMTP id rd18so5432783iec.29
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Mar 2014 00:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=pzXyNHeeG7Jz4NfnJYnXw02ibAXfRefpamlog9MoNUk=;
	b=Bdw5QAwLvgkAecZkigBS3bbPDxHeG7CxH+u+uKSUCMK/YSuSlpwYqYCSoVzaN7G9q1
	YuRHjfGPiQbKlEjUqm9bqOFfHxO49BXMVX1X3tdKeuJLFqh5M8OcN5uS93t60JvHsu7g
	VCqBt5jEryd/9KvIhDNNQjuiRPlXdLgQbwAcb45S4FMf8zpLSc0uWmuWEOkmXDx9cXyD
	4APTc6DXoyAxGpCCe7E+oennv+PZGonZ8mhQ4riA2Ws6xJe0OIMfqS97LuW7R3dV035q
	uhXPaO1USp23G9oxqRmmpQOyJBG953itFyyWCtBH8i7h4WwMD64Kef3lIcfVD/arMIso
	/NSA==
MIME-Version: 1.0
X-Received: by 10.50.43.135 with SMTP id w7mr27284455igl.12.1393921106982;
	Tue, 04 Mar 2014 00:18:26 -0800 (PST)
Sender: sebmennetrier@gmail.com
Received: by 10.42.198.139 with HTTP; Tue, 4 Mar 2014 00:18:26 -0800 (PST)
In-Reply-To: <1393584230-6405-1-git-send-email-s.mennetrier@innotis.org>
References: <1393584230-6405-1-git-send-email-s.mennetrier@innotis.org>
Date: Tue, 4 Mar 2014 09:18:26 +0100
X-Google-Sender-Auth: qK-YPJXwt2ViQjZX7AvSluTR67Q
Message-ID: <CABgO3_M8pJCRN1HDccUx0OwDZQ3gTGhS50zwu7R_+KYieT6sYg@mail.gmail.com>
From: Sebastien MENNETRIER <s.mennetrier@innotis.org>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2] libomxil: Fix link issue for gst-omx
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
X-List-Received-Date: Tue, 04 Mar 2014 08:18:30 -0000
Content-Type: multipart/alternative; boundary=089e012281146d3d4204f3c38c73

--089e012281146d3d4204f3c38c73
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Ping


2014-02-28 11:43 GMT+01:00 S=E9bastien Mennetrier <s.mennetrier@innotis.org=
>:

> gst-omx element can not load due to a missing symbol.
> Missing symbol RM_Deinit.
>
> Signed-off-by: S=E9bastien Mennetrier <s.mennetrier@innotis.org>
> ---
>  .../libomxil-0.9.3/dynamicloader-linking.patch       | 20
> ++++++++++++++++++++
>  meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb   |  3 ++-
>  2 files changed, 22 insertions(+), 1 deletion(-)
>  create mode 100644
> meta/recipes-multimedia/libomxil/libomxil-0.9.3/dynamicloader-linking.pat=
ch
>
> diff --git
> a/meta/recipes-multimedia/libomxil/libomxil-0.9.3/dynamicloader-linking.p=
atch
> b/meta/recipes-multimedia/libomxil/libomxil-0.9.3/dynamicloader-linking.p=
atch
> new file mode 100644
> index 0000000..787953a
> --- /dev/null
> +++
> b/meta/recipes-multimedia/libomxil/libomxil-0.9.3/dynamicloader-linking.p=
atch
> @@ -0,0 +1,20 @@
> +This patch fixes link issue when libomxdynamicloader.so is loaded :
> +Missing symbol RM_Deinit.
> +
> +This patch comes from "
> http://pkgs.fedoraproject.org/cgit/libomxil-bellagio.git/commit/?h=3Df17&=
id=3D4996a95828943d345e51ded6876c3103653eecf8
> "
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: S=E9bastien Mennetrier <s.mennetrier@innotis.org>
> +
> +--- a/src/dynamic_loader/Makefile.am   2014-02-25 15:29:10.128549636 +01=
00
> ++++ b/src/dynamic_loader/Makefile.am   2014-02-25 15:30:15.756548808+010=
0
> +@@ -3,7 +3,7 @@
> + omxdynamicloader_LTLIBRARIES =3D libomxdynamicloader.la
> + libomxdynamicloader_la_SOURCES =3D ste_dynamic_component_loader.c
> ste_dynamic_component_loader.h
> +
> +-libomxdynamicloader_la_LDFLAGS =3D
> ++libomxdynamicloader_la_LDFLAGS =3D -lomxil-bellagio
> -L$(top_builddir)/src/.libs
> + libomxdynamicloader_la_CFLAGS =3D -I$(top_srcdir)/include \
> +                       -I$(top_srcdir)/src \
> +                       -I$(top_srcdir)/src/base \
> diff --git a/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bbb/meta/rec=
ipes-multimedia/libomxil/
> libomxil_0.9.3.bb
> index f6c6a16..4a7633d 100644
> --- a/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
> +++ b/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
> @@ -9,7 +9,8 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Dae6f0f4dbc7ac193b50f323a6ae191cb \
>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/omxil/libomxil-bellagio-${PV}.tar.gz =
\
>             file://configure-fix.patch \
>             file://parallel-make.patch \
> -           file://makefile-docdir-fix.patch"
> +           file://makefile-docdir-fix.patch \
> +           file://dynamicloader-linking.patch"
>
>  SRC_URI[md5sum] =3D "a1de827fdb75c02c84e55f740ca27cb8"
>  SRC_URI[sha256sum] =3D
> "593c0729c8ef8c1467b3bfefcf355ec19a46dd92e31bfc280e17d96b0934d74c"
> --
> 1.8.1.2
>
>


--=20

Regards,
S=E9bastien

--089e012281146d3d4204f3c38c73
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ping<br></div><div class=3D"gmail_extra"><br><br><div clas=
s=3D"gmail_quote">2014-02-28 11:43 GMT+01:00 S=E9bastien Mennetrier <span d=
ir=3D"ltr">&lt;<a href=3D"mailto:s.mennetrier@innotis.org" target=3D"_blank=
">s.mennetrier@innotis.org</a>&gt;</span>:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">gst-omx element can not load due to a missin=
g symbol.<br>
Missing symbol RM_Deinit.<br>
<br>
Signed-off-by: S=E9bastien Mennetrier &lt;<a href=3D"mailto:s.mennetrier@in=
notis.org">s.mennetrier@innotis.org</a>&gt;<br>
---<br>
=A0.../libomxil-0.9.3/dynamicloader-linking.patch =A0 =A0 =A0 | 20 ++++++++=
++++++++++++<br>
=A0meta/recipes-multimedia/libomxil/<a href=3D"http://libomxil_0.9.3.bb" ta=
rget=3D"_blank">libomxil_0.9.3.bb</a> =A0 | =A03 ++-<br>
=A02 files changed, 22 insertions(+), 1 deletion(-)<br>
=A0create mode 100644 meta/recipes-multimedia/libomxil/libomxil-0.9.3/dynam=
icloader-linking.patch<br>
<br>
diff --git a/meta/recipes-multimedia/libomxil/libomxil-0.9.3/dynamicloader-=
linking.patch b/meta/recipes-multimedia/libomxil/libomxil-0.9.3/dynamicload=
er-linking.patch<br>
new file mode 100644<br>
index 0000000..787953a<br>
--- /dev/null<br>
+++ b/meta/recipes-multimedia/libomxil/libomxil-0.9.3/dynamicloader-linking=
.patch<br>
@@ -0,0 +1,20 @@<br>
+This patch fixes link issue when libomxdynamicloader.so is loaded :<br>
+Missing symbol RM_Deinit.<br>
+<br>
+This patch comes from &quot;<a href=3D"http://pkgs.fedoraproject.org/cgit/=
libomxil-bellagio.git/commit/?h=3Df17&amp;id=3D4996a95828943d345e51ded6876c=
3103653eecf8" target=3D"_blank">http://pkgs.fedoraproject.org/cgit/libomxil=
-bellagio.git/commit/?h=3Df17&amp;id=3D4996a95828943d345e51ded6876c3103653e=
ecf8</a>&quot;<br>

+<br>
+Upstream-Status: Pending<br>
+<br>
+Signed-off-by: S=E9bastien Mennetrier &lt;<a href=3D"mailto:s.mennetrier@i=
nnotis.org">s.mennetrier@innotis.org</a>&gt;<br>
+<br>
+--- a/src/dynamic_loader/Makefile.am =A0 2014-02-25 15:29:10.128549636 +01=
00<br>
++++ b/src/dynamic_loader/Makefile.am =A0 2014-02-25 15:30:<a href=3D"tel:1=
5.756548808" value=3D"+15756548808">15.756548808</a> +0100<br>
+@@ -3,7 +3,7 @@<br>
+ omxdynamicloader_LTLIBRARIES =3D <a href=3D"http://libomxdynamicloader.la=
" target=3D"_blank">libomxdynamicloader.la</a><br>
+ libomxdynamicloader_la_SOURCES =3D ste_dynamic_component_loader.c ste_dyn=
amic_component_loader.h<br>
+<br>
+-libomxdynamicloader_la_LDFLAGS =3D<br>
++libomxdynamicloader_la_LDFLAGS =3D -lomxil-bellagio -L$(top_builddir)/src=
/.libs<br>
+ libomxdynamicloader_la_CFLAGS =3D -I$(top_srcdir)/include \<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -I$(top_srcdir)/src \<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -I$(top_srcdir)/src/base \<br=
>
diff --git a/meta/recipes-multimedia/libomxil/<a href=3D"http://libomxil_0.=
9.3.bb" target=3D"_blank">libomxil_0.9.3.bb</a> b/meta/recipes-multimedia/l=
ibomxil/<a href=3D"http://libomxil_0.9.3.bb" target=3D"_blank">libomxil_0.9=
.3.bb</a><br>

index f6c6a16..4a7633d 100644<br>
--- a/meta/recipes-multimedia/libomxil/<a href=3D"http://libomxil_0.9.3.bb"=
 target=3D"_blank">libomxil_0.9.3.bb</a><br>
+++ b/meta/recipes-multimedia/libomxil/<a href=3D"http://libomxil_0.9.3.bb"=
 target=3D"_blank">libomxil_0.9.3.bb</a><br>
@@ -9,7 +9,8 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dae6f0f4dbc7=
ac193b50f323a6ae191cb \<br>
=A0SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/omxil/libomxil-bellagio-${PV}.ta=
r.gz \<br>
=A0 =A0 =A0 =A0 =A0 =A0 file://configure-fix.patch \<br>
=A0 =A0 =A0 =A0 =A0 =A0 file://parallel-make.patch \<br>
- =A0 =A0 =A0 =A0 =A0 file://makefile-docdir-fix.patch&quot;<br>
+ =A0 =A0 =A0 =A0 =A0 file://makefile-docdir-fix.patch \<br>
+ =A0 =A0 =A0 =A0 =A0 file://dynamicloader-linking.patch&quot;<br>
<br>
=A0SRC_URI[md5sum] =3D &quot;a1de827fdb75c02c84e55f740ca27cb8&quot;<br>
=A0SRC_URI[sha256sum] =3D &quot;593c0729c8ef8c1467b3bfefcf355ec19a46dd92e31=
bfc280e17d96b0934d74c&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.8.1.2<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div dir=
=3D"ltr"><div><br>Regards,<br></div>S=E9bastien<br></div>
</div>

--089e012281146d3d4204f3c38c73--
