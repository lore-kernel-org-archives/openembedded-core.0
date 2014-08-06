Return-Path: <sujith.h@gmail.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id A1D7460EFA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Aug 2014 10:11:21 +0000 (UTC)
Received: by mail-qg0-f47.google.com with SMTP id i50so2408094qgf.34
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Aug 2014 03:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=s6CP3UMU9GwFBlJstC5F8lGH2K8HCkDjNDwTu9NRZvw=;
	b=r9m+1wQxbElQGORUKSGt7p/PDQYhrHf+eSa5lp/kfqgWCM4R/nhgq6C8FH3TGN9VjC
	jwAREokAbasSMKfeFYAsSs53NWpNf0hTJWuQf9XAqM7q30xQWh+fMxlZX2cTsjp86mgx
	hbxM9erRZD8uZmltvAhvQqYjpdfQJ5udPyw6vR7YxlaBBKOHC7vBC3TcssFtpQWpeeJ9
	6nlC1RJNBcNoQDCNqlVULgArx1c1FFWREnNneTBJ4D0e5EPi+fuOQRFIkgxZnhE8Q0aj
	HEhhS19qwo+VNqI6F8PfZTAG2XoVD+RFFbrtAlcs5n/TWbWrEOiDieoEA876UeCP2u6q
	8cSA==
X-Received: by 10.140.51.37 with SMTP id t34mr1698732qga.50.1407319882119;
	Wed, 06 Aug 2014 03:11:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.148 with HTTP; Wed, 6 Aug 2014 03:11:01 -0700 (PDT)
In-Reply-To: <1407319466-5066-1-git-send-email-sujith.h@gmail.com>
References: <1407319466-5066-1-git-send-email-sujith.h@gmail.com>
From: sujith h <sujith.h@gmail.com>
Date: Wed, 6 Aug 2014 15:41:01 +0530
Message-ID: <CADyYWLncO5BOFM612xzMCmsz1AKPhbk7YUQaLSROuUre_fNbBg@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Sujith H <Sujith_Haridasan@mentor.com>
Subject: Re: [PATCH] systemd: Adding RRECOMMENDS for os-release
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
X-List-Received-Date: Wed, 06 Aug 2014 10:11:26 -0000
Content-Type: multipart/alternative; boundary=001a11351a5aa8e34404fff3314c

--001a11351a5aa8e34404fff3314c
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

This patch is in addition to the os-release patch I had posted earlier.
Because systemd wants os-release file and uses it.



On Wed, Aug 6, 2014 at 3:34 PM, Sujith H <sujith.h@gmail.com> wrote:

> From: Sujith H <Sujith_Haridasan@mentor.com>
>
> Systemd depends on the os-release hence adding
> RRECOMMENDS for the systemd package.
>
> Signed-off-by: Christopher Larson <kergoth@gmail.com>
> Signed-off-by: Sujith H <Sujith_Haridasan@mentor.com>
> ---
>  meta/recipes-core/systemd/systemd_213.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/systemd/systemd_213.bb
> b/meta/recipes-core/systemd/systemd_213.bb
> index 4fb7ffc..b5ac1c3 100644
> --- a/meta/recipes-core/systemd/systemd_213.bb
> +++ b/meta/recipes-core/systemd/systemd_213.bb
> @@ -248,7 +248,7 @@ RDEPENDS_${PN} +=3D "volatile-binds"
>  RRECOMMENDS_${PN} +=3D "systemd-serialgetty systemd-compat-units udev-hw=
db\
>                        util-linux-agetty \
>                        util-linux-fsck e2fsprogs-e2fsck \
> -                      kernel-module-autofs4 kernel-module-unix
> kernel-module-ipv6 \
> +                      kernel-module-autofs4 kernel-module-unix
> kernel-module-ipv6 os-release \
>  "
>
>  PACKAGES =3D+ "udev-dbg udev udev-hwdb"
> --
> 1.8.4
>
>
Thanks,
Sujith H

--=20
=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=
=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D
Bangalore
<Project>Contributor to KDE project
http://fci.wikia.com/wiki/Anti-DRM-Campaign
<Blog> http://sujithh.info

--001a11351a5aa8e34404fff3314c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hi,<br><br></div>This patch is in addition to th=
e os-release patch I had posted earlier. Because systemd wants os-release f=
ile and uses it.<br><br></div><div><div><div><div class=3D"gmail_extra"><br=
>

<br><div class=3D"gmail_quote">On Wed, Aug 6, 2014 at 3:34 PM, Sujith H <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:sujith.h@gmail.com" target=3D"_blank">=
sujith.h@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">

From: Sujith H &lt;<a href=3D"mailto:Sujith_Haridasan@mentor.com">Sujith_Ha=
ridasan@mentor.com</a>&gt;<br>
<br>
Systemd depends on the os-release hence adding<br>
RRECOMMENDS for the systemd package.<br>
<br>
Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:kergoth@gmail.com">=
kergoth@gmail.com</a>&gt;<br>
Signed-off-by: Sujith H &lt;<a href=3D"mailto:Sujith_Haridasan@mentor.com">=
Sujith_Haridasan@mentor.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd_213.bb" target=3D=
"_blank">systemd_213.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_213.bb" ta=
rget=3D"_blank">systemd_213.bb</a> b/meta/recipes-core/systemd/<a href=3D"h=
ttp://systemd_213.bb" target=3D"_blank">systemd_213.bb</a><br>
index 4fb7ffc..b5ac1c3 100644<br>
--- a/meta/recipes-core/systemd/<a href=3D"http://systemd_213.bb" target=3D=
"_blank">systemd_213.bb</a><br>
+++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_213.bb" target=3D=
"_blank">systemd_213.bb</a><br>
@@ -248,7 +248,7 @@ RDEPENDS_${PN} +=3D &quot;volatile-binds&quot;<br>
=C2=A0RRECOMMENDS_${PN} +=3D &quot;systemd-serialgetty systemd-compat-units=
 udev-hwdb\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0util-linux-agetty \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0util-linux-fsck e2fsprogs-e2fsck \<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0kernel-module-autofs4 kernel-module-unix kernel-module-ipv6 \<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0kernel-module-autofs4 kernel-module-unix kernel-module-ipv6 os-release \=
<br>
=C2=A0&quot;<br>
<br>
=C2=A0PACKAGES =3D+ &quot;udev-dbg udev udev-hwdb&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.8.4<br>
<br>
</font></span></blockquote></div><br></div><div class=3D"gmail_extra">Thank=
s,<br>Sujith H<br clear=3D"all"></div><div class=3D"gmail_extra"><br>-- <br=
>=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=
=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D<br>Bangalore<br>&lt;=
Project&gt;Contributor to KDE project<br>

<a href=3D"http://fci.wikia.com/wiki/Anti-DRM-Campaign" target=3D"_blank">h=
ttp://fci.wikia.com/wiki/Anti-DRM-Campaign</a><br>&lt;Blog&gt; <a href=3D"h=
ttp://sujithh.info" target=3D"_blank">http://sujithh.info</a><br>
</div></div></div></div></div>

--001a11351a5aa8e34404fff3314c--
