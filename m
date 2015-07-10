Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id C5CC573710
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 19:47:06 +0000 (UTC)
Received: by qget71 with SMTP id t71so134055945qge.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 12:47:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=BqvTFevWLw/IvCkTe+ARfKPTfRQwIB94tHv/agxYINk=;
	b=XRnfDNdinAy1MDL+IRhH3d0oztsgwQ7Felh9s/d7jHcyPy4laFZ9LQoTfCwRukDRY8
	K7hId0fxK7kwcCfx+mXydDBFhUGR9qi/TLFgfow52utq+2nDwRYHSmXY/OwYlOMHVABt
	C7RNikUwGPWOMwvexil8sBXyt0+Hv9itkTYT5pC+LSCZHUdN9CZg7Mn1dNSQ0OscesOR
	mid5Apo+mispp8swPqgBZC3AyDt9j90aHCbwaE4h5tyUz3x4ubiJNMlyNHm8XqAPBTKJ
	R6a+rflYufg9bble63vQLT0I2czxDdVls6TOe4zPFkNTVYppaRWep3gYdKU4N3bkm1uW
	+usA==
X-Gm-Message-State: ALoCoQl5HiNAG9VS2eCMOx4hjJvtesyGMnB/hnCVd3VKs12rN67/k8EHPthSFDiIIbfxlGlGhXDY
X-Received: by 10.140.89.100 with SMTP id u91mr35155552qgd.15.1436557627095;
	Fri, 10 Jul 2015 12:47:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 10 Jul 2015 12:46:47 -0700 (PDT)
In-Reply-To: <d0fa281d129a9dce1a95679071d154c23032c70c.1436515631.git.alejandro.hernandez@linux.intel.com>
References: <cover.1436515631.git.alejandro.hernandez@linux.intel.com>
	<d0fa281d129a9dce1a95679071d154c23032c70c.1436515631.git.alejandro.hernandez@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 10 Jul 2015 20:46:47 +0100
Message-ID: <CAJTo0LbRgAOKqzY91hLx7LLJ0uNf=c5tmEUUzf+3H1d5zuc5Vw@mail.gmail.com>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] If a the number of hard links decreases or increases while creating the tar files used for an ipk package, tar fails with error code 1, we use hardlinks on package/ and packages-split/ to decrease disk usage, sometimes other parts of the build can cause a change in the link count, since this happens in a controlled environment we can safely ignore the error and continue to create the ipk file, fixed some typos from old version.
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
X-List-Received-Date: Fri, 10 Jul 2015 19:47:07 -0000
Content-Type: multipart/alternative; boundary=001a11c1334e101724051a8aa37e

--001a11c1334e101724051a8aa37e
Content-Type: text/plain; charset=UTF-8

That commit message went a bit crazy, can you reformat it please? :)

Ross

On 10 July 2015 at 09:13, Alejandro Hernandez <
alejandro.hernandez@linux.intel.com> wrote:

> [YOCTO #7933]
>
> Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
> ---
>  meta/recipes-devtools/opkg-utils/opkg-utils/tar_ignore_error.patch | 2 +-
>  meta/recipes-devtools/opkg-utils/opkg-utils_git.bb                 | 4
> ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git
> a/meta/recipes-devtools/opkg-utils/opkg-utils/tar_ignore_error.patch
> b/meta/recipes-devtools/opkg-utils/opkg-utils/tar_ignore_error.patch
> index 4bcae4954..e8250b7 100644
> --- a/meta/recipes-devtools/opkg-utils/opkg-utils/tar_ignore_error.patch
> +++ b/meta/recipes-devtools/opkg-utils/opkg-utils/tar_ignore_error.patch
> @@ -12,7 +12,7 @@ We detect if the error code produced by tar is 1 and in
> this case ignore it.
>  This a similar behavior to the one on dpkg:
>
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=40731942515ec8d80c727ad561174986d4f05818
>
> -Upsteam-Status: Inappropriate
> +Upstream-Status: Inappropriate
>
>  Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
>
> diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> index 74b974d..2f66632 100644
> --- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> +++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> @@ -10,9 +10,9 @@ PROVIDES += "virtual/update-alternatives"
>  SRCREV = "53274f087565fd45d8452c5367997ba6a682a37a"
>  PV = "0.1.8+git${SRCPV}"
>
> -SRC_URI = "git://git.yoctoproject.org/opkg-utils "
> +SRC_URI = "git://git.yoctoproject.org/opkg-utils"
>
> -SRC_URI_append_class-native = "file://tar_ignore_error.patch"
> +SRC_URI_append_class-native = " file://tar_ignore_error.patch"
>
>  S = "${WORKDIR}/git"
>
> --
> 1.8.4.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11c1334e101724051a8aa37e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">That commit message went a bit crazy, can you reformat it =
please? :)<div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><b=
r><div class=3D"gmail_quote">On 10 July 2015 at 09:13, Alejandro Hernandez =
<span dir=3D"ltr">&lt;<a href=3D"mailto:alejandro.hernandez@linux.intel.com=
" target=3D"_blank">alejandro.hernandez@linux.intel.com</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">[YOCTO #7933]<br>
<br>
Signed-off-by: Alejandro Hernandez &lt;<a href=3D"mailto:alejandro.hernande=
z@linux.intel.com">alejandro.hernandez@linux.intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/opkg-utils/opkg-utils/tar_ignore_error.patch | =
2 +-<br>
=C2=A0meta/recipes-devtools/opkg-utils/<a href=3D"http://opkg-utils_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">opkg-utils_git.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
=C2=A02 files changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/tar_ignore_error.p=
atch b/meta/recipes-devtools/opkg-utils/opkg-utils/tar_ignore_error.patch<b=
r>
index 4bcae4954..e8250b7 100644<br>
--- a/meta/recipes-devtools/opkg-utils/opkg-utils/tar_ignore_error.patch<br=
>
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils/tar_ignore_error.patch<br=
>
@@ -12,7 +12,7 @@ We detect if the error code produced by tar is 1 and in t=
his case ignore it.<br>
=C2=A0This a similar behavior to the one on dpkg:<br>
=C2=A0<a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=
=3D40731942515ec8d80c727ad561174986d4f05818" rel=3D"noreferrer" target=3D"_=
blank">http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3D40731942=
515ec8d80c727ad561174986d4f05818</a><br>
<br>
-Upsteam-Status: Inappropriate<br>
+Upstream-Status: Inappropriate<br>
<br>
=C2=A0Signed-off-by: Alejandro Hernandez &lt;<a href=3D"mailto:alejandro.he=
rnandez@linux.intel.com">alejandro.hernandez@linux.intel.com</a>&gt;<br>
<br>
diff --git a/meta/recipes-devtools/opkg-utils/<a href=3D"http://opkg-utils_=
git.bb" rel=3D"noreferrer" target=3D"_blank">opkg-utils_git.bb</a> b/meta/r=
ecipes-devtools/opkg-utils/<a href=3D"http://opkg-utils_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">opkg-utils_git.bb</a><br>
index 74b974d..2f66632 100644<br>
--- a/meta/recipes-devtools/opkg-utils/<a href=3D"http://opkg-utils_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">opkg-utils_git.bb</a><br>
+++ b/meta/recipes-devtools/opkg-utils/<a href=3D"http://opkg-utils_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">opkg-utils_git.bb</a><br>
@@ -10,9 +10,9 @@ PROVIDES +=3D &quot;virtual/update-alternatives&quot;<br>
=C2=A0SRCREV =3D &quot;53274f087565fd45d8452c5367997ba6a682a37a&quot;<br>
=C2=A0PV =3D &quot;0.1.8+git${SRCPV}&quot;<br>
<br>
-SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproject.org/opkg-utils"=
 rel=3D"noreferrer" target=3D"_blank">git.yoctoproject.org/opkg-utils</a> &=
quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproject.org/opkg-utils"=
 rel=3D"noreferrer" target=3D"_blank">git.yoctoproject.org/opkg-utils</a>&q=
uot;<br>
<br>
-SRC_URI_append_class-native =3D &quot;file://tar_ignore_error.patch&quot;<=
br>
+SRC_URI_append_class-native =3D &quot; file://tar_ignore_error.patch&quot;=
<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
1.8.4.5<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br></div>

--001a11c1334e101724051a8aa37e--
