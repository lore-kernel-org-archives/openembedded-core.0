Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 34D8D72F5A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Apr 2017 23:12:39 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id u18so7339754wrc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Apr 2017 16:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ua270qKKjUeiQRuMTpMyk700ceJXc6netxq60jQEvoM=;
	b=utk5dFgbvj21WnMEF6uDCVku0kYwYinAALcqbIv+a3KFzEhsZg3OXDBAD/vjh7Yn1b
	6DoZreKQ88oBf2yGRPkeUcxOnrH1AgMCnlvxOmjT/jM8Xn6ArXyQJ/lV8tA7SoXHDUBk
	fePgaSUkmmuvMXtYoTf5475ODwTtrooiHEb0UyIIRka86DUIAApDfRjo64ey/Dg/+KcC
	b1ydfEzDbWjZH9QJAyUEcV4/vMS5q8JMOk3Hs5hwE/8KgrOGqKR8V0GlQ/logzcQ9cLG
	UcC/i3k7ZFDerDcj2N39Kta/Rigo88RhFpeFc3gquOsHz/xdLd0SO0QCZp62w6Q53CwD
	JJ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ua270qKKjUeiQRuMTpMyk700ceJXc6netxq60jQEvoM=;
	b=rn7IoERZNnTyzNGqjevyRdLCoJXvPoCF6Zce8qSSgku37tMr0IsRyzIG0jyUA7rQS6
	9k8LwhOQrAd5Ky+s+lHWAZ02J+4QBkyItm1r87M9jQASG9qpobfy7H98BOa1j2BDYmyP
	a41GhbSRYLadPF+Itwc9ja4YxPEj5UWGqDE4FN29kSaKXGtkCgcZaf/9v40JmOgUZmY8
	MdXfruEb8RN7OQVMLwhh/ZU9ujJIavD5QN79KkStrLQUNKCxoG5rCQ6g/TnZgUFDs/0Y
	G681kzACQX46ef96xi4jLHKJ51LWxSLX0fqWy+u+pOeSZtHpcNT//BPA0lY3MtbAM7ca
	1R6Q==
X-Gm-Message-State: AFeK/H2kpcvfEF7nXpVPO6lj8HH0PaHwgrs6LiZMAlMeY4FIn3LK0cJwas8GU5Xi/hoLg+CPrYJ7XQ7FApaSgw==
X-Received: by 10.223.136.66 with SMTP id e2mr8934602wre.14.1491520360881;
	Thu, 06 Apr 2017 16:12:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.145.24 with HTTP; Thu, 6 Apr 2017 16:12:40 -0700 (PDT)
In-Reply-To: <1491519518-111619-1-git-send-email-jianxun.zhang@linux.intel.com>
References: <1491519518-111619-1-git-send-email-jianxun.zhang@linux.intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 7 Apr 2017 01:12:40 +0200
Message-ID: <CA+chaQcosNHWFWFGQUfuF8FS=v_PZWJZizZpMTaVjNebqGN7fA@mail.gmail.com>
To: Jianxun Zhang <jianxun.zhang@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ethtool: fix 4.8 checksums
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
X-List-Received-Date: Thu, 06 Apr 2017 23:12:40 -0000
Content-Type: multipart/alternative; boundary=001a1147be9649244e054c87a524

--001a1147be9649244e054c87a524
Content-Type: text/plain; charset=UTF-8

See other ethtool change on ML from this week.

On Fri, Apr 7, 2017 at 12:58 AM, Jianxun Zhang <
jianxun.zhang@linux.intel.com> wrote:

> The mismatched checksums cause fatching failed in my setup.
>
> Signed-off-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
> ---
> I am not sure why I got this issue today, but it seems the upstream
> package has different checksums.
>
> Maintainer could help to check if this is a false patch.
>
>  meta/recipes-extended/ethtool/ethtool_4.8.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-extended/ethtool/ethtool_4.8.bb
> b/meta/recipes-extended/ethtool/ethtool_4.8.bb
> index afaf2e2..ce3eaf3 100644
> --- a/meta/recipes-extended/ethtool/ethtool_4.8.bb
> +++ b/meta/recipes-extended/ethtool/ethtool_4.8.bb
> @@ -11,8 +11,8 @@ SRC_URI = "https://downloads.yoctoproject.org/mirror/
> sources/ethtool-${PV}.tar.g
>             file://avoid_parallel_tests.patch \
>             "
>
> -SRC_URI[md5sum] = "28c4a4d85c33f573c49ff6d81ec094fd"
> -SRC_URI[sha256sum] = "1bd82ebe3d41de1b7b0d8f4fb18a8e
> 8466fba934c952bc5c5002836ffa8bb606"
> +SRC_URI[md5sum] = "992eab97607c64b7848edfd37f23da22"
> +SRC_URI[sha256sum] = "c8ea20b8d85898377ec130066008f9
> 241ebcdd95ac85dbcc2d50b32fe2e2f934"
>
>  inherit autotools ptest
>  RDEPENDS_${PN}-ptest += "make"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1147be9649244e054c87a524
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">See other ethtool change on ML from this week.</div><div c=
lass=3D"gmail_extra"><br><div class=3D"gmail_quote">On Fri, Apr 7, 2017 at =
12:58 AM, Jianxun Zhang <span dir=3D"ltr">&lt;<a href=3D"mailto:jianxun.zha=
ng@linux.intel.com" target=3D"_blank">jianxun.zhang@linux.intel.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">The mismatched checksums c=
ause fatching failed in my setup.<br>
<br>
Signed-off-by: Jianxun Zhang &lt;<a href=3D"mailto:jianxun.zhang@linux.inte=
l.com">jianxun.zhang@linux.intel.com</a><wbr>&gt;<br>
---<br>
I am not sure why I got this issue today, but it seems the upstream package=
 has different checksums.<br>
<br>
Maintainer could help to check if this is a false patch.<br>
<br>
=C2=A0meta/recipes-extended/ethtool/<a href=3D"http://ethtool_4.8.bb" rel=
=3D"noreferrer" target=3D"_blank"><wbr>ethtool_4.8.bb</a> | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-extended/<wbr>ethtool/<a href=3D"http://ethtool_4=
.8.bb" rel=3D"noreferrer" target=3D"_blank">ethtool_4.8.bb</a> b/meta/recip=
es-extended/<wbr>ethtool/<a href=3D"http://ethtool_4.8.bb" rel=3D"noreferre=
r" target=3D"_blank">ethtool_4.8.bb</a><br>
index afaf2e2..ce3eaf3 100644<br>
--- a/meta/recipes-extended/<wbr>ethtool/<a href=3D"http://ethtool_4.8.bb" =
rel=3D"noreferrer" target=3D"_blank">ethtool_4.8.bb</a><br>
+++ b/meta/recipes-extended/<wbr>ethtool/<a href=3D"http://ethtool_4.8.bb" =
rel=3D"noreferrer" target=3D"_blank">ethtool_4.8.bb</a><br>
@@ -11,8 +11,8 @@ SRC_URI =3D &quot;<a href=3D"https://downloads.yoctoproje=
ct.org/mirror/sources/ethtool-${PV}.tar.g" rel=3D"noreferrer" target=3D"_bl=
ank">https://downloads.<wbr>yoctoproject.org/mirror/<wbr>sources/ethtool-${=
PV}.tar.g</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://avoid_parallel_tests.<wbr>=
patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;<wbr>28c4a4d85c33f573c49ff6d81ec094<wbr>fd&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>1bd82ebe3d41de1b7b0d8f4fb18a8e<wbr>8466f=
ba934c952bc5c5002836ffa8b<wbr>b606&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>992eab97607c64b7848edfd37f23da<wbr>22&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>c8ea20b8d85898377ec130066008f9<wbr>241eb=
cdd95ac85dbcc2d50b32fe2e2<wbr>f934&quot;<br>
<br>
=C2=A0inherit autotools ptest<br>
=C2=A0RDEPENDS_${PN}-ptest +=3D &quot;make&quot;<br>
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

--001a1147be9649244e054c87a524--
