Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19722.1792664578592803182
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2026 03:22:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QTjD2yxX;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-91ba702cceaso21017226d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 03:22:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792664577; cv=none;
        d=google.com; s=arc-20260327;
        b=P9sSJx7/qkh022ufbgsx2D3w3odZfVtPEodE4ojRzYHL7pHkUhBtHS2vm/8YSjae/Y
         UjRjNPc2TfkeUwo2vpC38O191e+ZE1NvxcblXjEyk3VpFUlkCxYG5O/rO3D1dRfvj3//
         9WWJ1g14V1Kz/uL6vnceH4+2a9e0jjG0uoF9NItUx4BDC555R2nFrn3h3n5DxwpTOKe9
         DzeZUYCn20VrnGxbmgcYdTgptNHAPm/HzGhxQOpJe7P0ldBsJ1oE+v3acBX6K0dz5vwI
         KyCLrusOXnL0gpkOf7JT19t3arF675PRN33eEn+jNycoySH2S7S9CgkuD6SoJoJY4HSD
         dQGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rwYo6pugjYzzwkm883iPFJCoV9FWf6+nlCqejkNscQ4=;
        fh=9ThXHYL0rVHl//NEHpfUmYvFzWJ0hGicdHP121LlQTA=;
        b=llEYCJ5NNmk3eSq8/y1U3j9tY41hdDf4EMrWtf/0YxeNa6NFYN2jNc6DFfV8Q6oob7
         KZf/RGvsHNs7MD+XT267csv3ATdtoSZKJdD5IfFbUu5UnbcHC6/HJ+CxJPwajbpsX4dE
         Te7bW+wx0hHuNb4QXaRXMEOupbaHkCY78yQOw7l01BzdNZn40bIxAc8vIfqR2NoxKo2P
         AcMMz1LBNCTg5BktGM0F8s9FlypxN0Xy3oJV9efhiVGTOv/hKqhiwKh9YUybubTV+0Lb
         XZA6+bIy+4uBkA+INXkrWNREu/AHPYptordI86omXhk5l3K/jGqf5GeQce+GmdmiSrNd
         c7Sw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792664577; x=1793269377; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rwYo6pugjYzzwkm883iPFJCoV9FWf6+nlCqejkNscQ4=;
        b=QTjD2yxXz9iynY4MS47CBb6Yd0i4TIdLyPkemVXNOzG7i975WV/vTOOEOzZ+R7Q/rE
         mtvsFkvvQ5mvtYOjYR7TQePjCF4MHnUIYHO2LXqhecgTkHmPHyDpnI7pDzV8HXPlJmAt
         dPQT/7eeGF+4j4ibp67SXBcDfrl9LslPQO3JMmkR/0Qs/EBwqD+XxKCr3Pla65pxfNA4
         /IXCm8jh1cbL54vQM/H9DuICHrBdnjcRACFMCmf6rjdM6vwgPNgSSekwI4J6NhdNOohV
         WdJqk1ofE1Zrw7PpYwj8HN2rJntDB2oBUNSarzwBo450YlIfX+qUX8GMdHFcNOjMjmPl
         2/sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792664577; x=1793269377;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rwYo6pugjYzzwkm883iPFJCoV9FWf6+nlCqejkNscQ4=;
        b=nkVgRDCbQD7+kYWE6n0NxJ27kEErGsv9WBJLYwDJeLGBsGS8YgnhrtmsJFB7kHj5NC
         iNsMPTFO2Dmta/BcEiFtcXIsdb16HfFa6GETXmv8giDUL/1oVubAgQVpFni9pa1iBWqf
         r6JX5V+8T5WKzqp9tyFpUmZOSksgbF/BmhylxsUao/dxOWcdKorVf0atCX3KY2ScG96G
         CI0yRrrxrcKykAXYyMTB+NiBYkdOOTUWSsD3OOjx/x5XX3p3mCl1mB/qoh5JjptBbl2M
         OoMnzYyNm06quXosUjZ8SWhfSrtp/mJ26VjeYDCKJ4B02x68Uk+mw8Ozih3Rr+f4x+qs
         iuaw==
X-Gm-Message-State: AFq9FYLQxF8pUafEiX9Fd6580+AcyNFVyyI32/PPusIKNpGIm2Fn5SUI
	GkP6+bfEn2OGgQMhgiRXY3rkvNMO60M8jKYCSSR2KkRsy3JvN67aGGYpr1q3WNHomQUdkT3+vQw
	DRq+YY4rryWo21APkM7h6wl/mZwT2yuQ=
X-Gm-Gg: AYBFou1OHRvI/5ik2KAU6EsZEaFP6mVQD4sGyn2j6Fd1wCu49k8r45o9xw2JHpgkQFg
	fKJkGomKKdFs7K4uscxXq7O13fjMxfBHNRW8zysOqrXVoXdyRLlPbNAqwyJwMFVw1r8LulZJZDL
	qjv4MPnt3UhOrpeDhlnC7g30NtDLDRDLApGJuvxBVbqw75B5qoha4cSS66Yv5F/aB4zdaVbLQB8
	qnmI8MSFmtSsohLDOFtWl9Td1PTX+RwNyJHzexBz53bvsoBcR+F8LhSWKH/q6IAEykglYXDvz1S
	EnSojX+xOvck2AEnhMDbSfeNcLDGnL1ukditKSkWIWBdJ4hAdYvxlyHueR77spCTAHv7/tutkUN
	me77/pv0r50wOw34VN/Va3nitTUWuPG1ecrZljSFKWCuEuYkTnOQs5cAngbuOVCZcx0h2G34=
X-Received: by 2002:ad4:5746:0:b0:917:a253:4f8f with SMTP id
 6a1803df08f44-91c12ef04camr83140336d6.40.1792664577512; Thu, 22 Oct 2026
 03:22:57 -0700 (PDT)
MIME-Version: 1.0
References: <20261019111629.144576-1-UpStream_IP-DR@bmwtechworks.in>
In-Reply-To: <20261019111629.144576-1-UpStream_IP-DR@bmwtechworks.in>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 22 Oct 2026 12:22:46 +0200
X-Gm-Features: AclHuK9OR4coPywcywX8JCCMnPj01TB_qlc58w-whP48oiTAc0QomCwbHs_u7Mo
Message-ID: <CANNYZj9+_napBc7-1e7irmgM6Dh17vgyf9Wjg6ScG+9Bttdrfg@mail.gmail.com>
Subject: Re: [OE-core][PATCH] boost: add lzma and zstd PACKAGECONFIG options
To: UpStream_IP-DR@bmwtechworks.in
Cc: openembedded-core@lists.openembedded.org, 
	Divyanshu Rathore <divyanshu.rathore@bmwtechworks.in>
Content-Type: multipart/alternative; boundary="0000000000005818e3065e6b3f15"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 10:23:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248438

--0000000000005818e3065e6b3f15
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 Oct 2026 at 14:25, Divyanshu Rathore via lists.openembedded.org
<UpStream_IP-DR=bmwtechworks.in@lists.openembedded.org> wrote:

> --- a/meta/recipes-support/boost/boost.inc
> +++ b/meta/recipes-support/boost/boost.inc
> @@ -56,6 +56,8 @@ PACKAGECONFIG[graph_parallel] = ",,,boost-mpi mpich"
>  PACKAGECONFIG[mpi] = ",,mpich"
>  PACKAGECONFIG[numpy] = ",,python3-numpy"
>  PACKAGECONFIG[python] = ",,python3"
> +PACKAGECONFIG[lzma] = ",,xz"
> +PACKAGECONFIG[zstd] = ",,zstd"
>

How do these new options work though? Other PACKAGECONFIG options are
handled elsewhere in the boost recipe with custom code.

Are the newly ones relying on boost quietly detecting the compressors in
sysroot and then enabling them in its own build? This is unreliable: these
components can be placed in sysroot by transitive dependencies, and then
they will be enabled by boost even when they're not enabled in the build
configuration. You need to make it deterministic by figuring out what
upstream does, and enforcing both enable and disable from the recipe, e.g.
via build options or writing out a build config file.

Alex

--0000000000005818e3065e6b3f15
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, 19 Oct 2026 at 14:25, Divyanshu R=
athore via <a href=3D"http://lists.openembedded.org">lists.openembedded.org=
</a> &lt;UpStream_IP-DR=3D<a href=3D"mailto:bmwtechworks.in@lists.openembed=
ded.org">bmwtechworks.in@lists.openembedded.org</a>&gt; wrote:</div><div cl=
ass=3D"gmail_quote gmail_quote_container"><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">--- a/meta/recipes-support/boost/boost.inc<br>
+++ b/meta/recipes-support/boost/boost.inc<br>
@@ -56,6 +56,8 @@ PACKAGECONFIG[graph_parallel] =3D &quot;,,,boost-mpi mpic=
h&quot;<br>
=C2=A0PACKAGECONFIG[mpi] =3D &quot;,,mpich&quot;<br>
=C2=A0PACKAGECONFIG[numpy] =3D &quot;,,python3-numpy&quot;<br>
=C2=A0PACKAGECONFIG[python] =3D &quot;,,python3&quot;<br>
+PACKAGECONFIG[lzma] =3D &quot;,,xz&quot;<br>
+PACKAGECONFIG[zstd] =3D &quot;,,zstd&quot;<br></blockquote></div><div clas=
s=3D"gmail_quote gmail_quote_container"><br></div><div class=3D"gmail_quote=
 gmail_quote_container">How do these new options work though? Other PACKAGE=
CONFIG options are handled elsewhere in the boost recipe with custom code.=
=C2=A0</div><div class=3D"gmail_quote gmail_quote_container"><br></div><div=
 class=3D"gmail_quote gmail_quote_container">Are the newly ones relying on =
boost quietly detecting the compressors in sysroot and then enabling them i=
n its own build? This is unreliable: these components can be placed in sysr=
oot by transitive dependencies, and then they will be enabled by boost even=
 when they&#39;re not enabled in the build configuration. You need to make =
it deterministic by figuring out what upstream does, and enforcing both ena=
ble and disable from the recipe, e.g. via build options or writing out a bu=
ild config file.</div><div class=3D"gmail_quote gmail_quote_container"><br>=
</div><div class=3D"gmail_quote gmail_quote_container">Alex</div></div>

--0000000000005818e3065e6b3f15--
