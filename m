Return-Path: <kergoth@gmail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id 05C187876E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 15:55:29 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id l25so10843775uag.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 07:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=B1i7MC+nsGrF75r7POVynSmYAOBSMJszwpijnAeU4QU=;
	b=Ee8iE1xnO9P8q6YF65yB/If9IZMGQU5yeBREPeKVDvBwzvZGHq5CSj/k9OpB6rD1Np
	UOAv4MRBdLG62CyClI5XtEcRiLEmwVDI6zMboOa2qmtFXtbygyBZ8c1GjvSGZqHRZDzF
	8YJwXHgmdXHtIUQeTSsQI3qorGjk/Y3O0ck7uZXJ+gHyqZ15c8FQibsWl9P+9ZOQRf+E
	iHMnfXehalJraFC0qvaSc0czQ57jC8IN5mxOapiImXB6Pgk7AOQmSa2LSQEMebW1uI/O
	dOKQxL+0tL9e2z+PazCAZwomzFSLpZTNVFijK+Aqcd4b8Qsbytt2aPMomCxgtipv/umm
	cnWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=B1i7MC+nsGrF75r7POVynSmYAOBSMJszwpijnAeU4QU=;
	b=YpiKZs4Bh+gfnplOqhBlN9gdsHWTEY972hb2y9rQziw22J9BEeQW9GLhjLu12sZ4U7
	1qaDWTjGSZhMwCf2Fr7Go/CC/A0743L2/NqVVzHQK66KOlhTN6BG+BcjnGznznS089lU
	gy5Wh62UbfUcxG1sYnfYFlxvWuMyoAdzqyzMAOKhulYtH544os5DLKO+0dEbnuUsdokP
	60hmrgPrOGdGoembzqVt2TjG1bmukPGQxAbBPbxS1Kd1+BjGXNGD6J27oiNCjs8b/ufW
	FdPPmVjGzfc0+ZZSWQJMiVZ5C52PLfe2WzNjP2Po/LaAaDO78Ii4cIFIFUsI8KWy7XHX
	S4iw==
X-Gm-Message-State: AJaThX5DTL/Gkw1jYPsGPr3Wc6dzYh6AfmcUrDGVOK0HELWHrx3lqDxW
	T0EoKXLvPw85J3oqkkZrQEg1vjsTq03v7Kx8ovM=
X-Google-Smtp-Source: AGs4zMZvPdizS5fOIXdhqio72wgqio802sBr+AdgzLFiM8Rkue8h47HigTHBohXg/g0DIEeXpRIFDgj+0vSi/d2qzX0=
X-Received: by 10.176.87.217 with SMTP id u25mr1785525uac.4.1510847730553;
	Thu, 16 Nov 2017 07:55:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.19.130 with HTTP; Thu, 16 Nov 2017 07:55:10 -0800 (PST)
In-Reply-To: <1510847249-15722-1-git-send-email-vlsireddy@gmail.com>
References: <1510847249-15722-1-git-send-email-vlsireddy@gmail.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Thu, 16 Nov 2017 08:55:10 -0700
Message-ID: <CABcZANkN28FE_RLtwbzshWr2TYeZdcoqX_6SWheC4S_wAVOZ9A@mail.gmail.com>
To: RC Reddy <vlsireddy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH]ethool updated to 4.13] ethtool bb: upgraded the .bb to pick latest ethtool-4.13.tar.xz
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
X-List-Received-Date: Thu, 16 Nov 2017 15:55:30 -0000
Content-Type: multipart/alternative; boundary="f403045f7eee4a1969055e1ba6af"

--f403045f7eee4a1969055e1ba6af
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 16, 2017 at 8:47 AM, RC Reddy <vlsireddy@gmail.com> wrote:

> Tests : - Compiled and tested the ethtool 4.13 package from
> https://www.kernel.org/pub/software/network/ethtool/ethtool-4.13.tar.xz
> using AARCH64 compiler [compilation succeed and also the binary works]
>
> Signed-off-by: RC Reddy <vlsireddy@gmail.com>
> ---
>  meta/recipes-extended/ethtool/{ethtool_4.11.bb =3D> ethtool_4.13.bb} | 4
> ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-extended/ethtool/{ethtool_4.11.bb =3D> ethtool_4.13.=
bb}
> (88%)
>
> diff --git a/meta/recipes-extended/ethtool/ethtool_4.11.bb
> b/meta/recipes-extended/ethtool/ethtool_4.13.bb
> similarity index 88%
> rename from meta/recipes-extended/ethtool/ethtool_4.11.bb
> rename to meta/recipes-extended/ethtool/ethtool_4.13.bb
> index befe9b9..c862a57 100644
> --- a/meta/recipes-extended/ethtool/ethtool_4.11.bb
> +++ b/meta/recipes-extended/ethtool/ethtool_4.13.bb
> @@ -11,8 +11,8 @@ SRC_URI =3D "${KERNELORG_MIRROR}/software/
> network/ethtool/ethtool-${PV}.tar.gz \
>             file://avoid_parallel_tests.patch \
>             "
>
> -SRC_URI[md5sum] =3D "8f1072679888c9335e49b17efb798b4c"
> -SRC_URI[sha256sum] =3D "af2fd9692f3159d3ab1e41e6f9b7d8
> db2a4693f1cb22348c88ba89f70f0e6503"
> +SRC_URI[md5sum] =3D "2ba44eb0ca96752392e9bf8dc83ba302"
> +SRC_URI[sha256sum] =3D "d311c4b557c44c5248ac5436b9e19c
> 391a60d8e4830b6a7f41be16d89c0556de"
>
>
If you=E2=80=99re going to update a checksum for a tarball that was replace=
d
in-place upstream, we need to know why it changed, and what changed,
otherwise it could well have been compromised. Also, the subject line has a
typo: ethool.
--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--f403045f7eee4a1969055e1ba6af
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Nov 16, 2017 at 8:47 AM, RC Reddy <span dir=3D"ltr">&lt;<a href=
=3D"mailto:vlsireddy@gmail.com" target=3D"_blank">vlsireddy@gmail.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">Tests : - Compiled and t=
ested the ethtool 4.13 package from<br>
<a href=3D"https://www.kernel.org/pub/software/network/ethtool/ethtool-4.13=
.tar.xz" rel=3D"noreferrer" target=3D"_blank">https://www.kernel.org/pub/<w=
br>software/network/ethtool/<wbr>ethtool-4.13.tar.xz</a><br>
using AARCH64 compiler [compilation succeed and also the binary works]<br>
<br>
Signed-off-by: RC Reddy &lt;<a href=3D"mailto:vlsireddy@gmail.com">vlsiredd=
y@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-extended/ethtool/<wbr>{<a href=3D"http://ethtool_4.11.bb=
" rel=3D"noreferrer" target=3D"_blank">ethtool_4.11.bb</a> =3D&gt; <a href=
=3D"http://ethtool_4.13.bb" rel=3D"noreferrer" target=3D"_blank">ethtool_4.=
13.bb</a>} | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta/recipes-extended/ethtool/<wbr>{<a href=3D"http://ethtool_=
4.11.bb" rel=3D"noreferrer" target=3D"_blank">ethtool_4.11.bb</a> =3D&gt; <=
a href=3D"http://ethtool_4.13.bb" rel=3D"noreferrer" target=3D"_blank">etht=
ool_4.13.bb</a>} (88%)<br>
<br>
diff --git a/meta/recipes-extended/<wbr>ethtool/<a href=3D"http://ethtool_4=
.11.bb" rel=3D"noreferrer" target=3D"_blank">ethtool_4.11.bb</a> b/meta/rec=
ipes-extended/<wbr>ethtool/<a href=3D"http://ethtool_4.13.bb" rel=3D"norefe=
rrer" target=3D"_blank">ethtool_4.13.bb</a><br>
similarity index 88%<br>
rename from meta/recipes-extended/ethtool/<a href=3D"http://ethtool_4.11.bb=
" rel=3D"noreferrer" target=3D"_blank"><wbr>ethtool_4.11.bb</a><br>
rename to meta/recipes-extended/ethtool/<a href=3D"http://ethtool_4.13.bb" =
rel=3D"noreferrer" target=3D"_blank"><wbr>ethtool_4.13.bb</a><br>
index befe9b9..c862a57 100644<br>
--- a/meta/recipes-extended/<wbr>ethtool/<a href=3D"http://ethtool_4.11.bb"=
 rel=3D"noreferrer" target=3D"_blank">ethtool_4.11.bb</a><br>
+++ b/meta/recipes-extended/<wbr>ethtool/<a href=3D"http://ethtool_4.13.bb"=
 rel=3D"noreferrer" target=3D"_blank">ethtool_4.13.bb</a><br>
@@ -11,8 +11,8 @@ SRC_URI =3D &quot;${KERNELORG_MIRROR}/software/<wbr>netwo=
rk/ethtool/ethtool-${PV}.<wbr>tar.gz \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://avoid_parallel_tests.<wbr>=
patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;<wbr>8f1072679888c9335e49b17efb798b<wbr>4c&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>af2fd9692f3159d3ab1e41e6f9b7d8<wbr>db2a4=
693f1cb22348c88ba89f70f0e<wbr>6503&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>2ba44eb0ca96752392e9bf8dc83ba3<wbr>02&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>d311c4b557c44c5248ac5436b9e19c<wbr>391a6=
0d8e4830b6a7f41be16d89c05<wbr>56de&quot;<br><br></blockquote><div><br></div=
><div>If you=E2=80=99re going to update a checksum for a tarball that was r=
eplaced in-place upstream, we need to know why it changed, and what changed=
, otherwise it could well have been compromised. Also, the subject line has=
 a typo: ethool.</div></div>-- <br><div class=3D"gmail_signature" data-smar=
tmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">Christophe=
r Larson<br>kergoth at gmail dot com<br>Founder - BitBake, OpenEmbedded, Op=
enZaurus<br>Senior Software Engineer, Mentor Graphics</div></div></div></di=
v>
</div></div>

--f403045f7eee4a1969055e1ba6af--
