Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-ob0-f169.google.com (mail-ob0-f169.google.com
	[209.85.214.169])
	by mail.openembedded.org (Postfix) with ESMTP id 6A468731CB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 13:07:34 +0000 (UTC)
Received: by mail-ob0-f169.google.com with SMTP id ba1so492441359obb.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 05:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=Cg0k0vUQHU5+hgyaYYxFOhvb3KhwQXD1OaFV45jwAmU=;
	b=TkuRTCfLav2+baYx745Nu/LD636EUjEB5YDSDHUVOykIuOuxmoE4cxgzsuhgBwFDjU
	LyPVjeAsJO/BNtEjnGuzqKKYqVF1RGeLvtdzuNZ0UhmDq/1R2d4bjOwsxpcqcpWovqDW
	1TN5AWCS/by6oToEdlK2Av2fNQHN4xp56S2828NxQiPZSVR4EhwAOvVCJvBI0wkE4ncW
	4M/e798dUdRHjsJp39Ui2uNa1VvtfrKImM1Wp+xbJBguuSzkJaahFF39tjJuy14Sr6mI
	P3PxY2ShUBBVLZYisSPsorj9e6nCacG19BSmJ8vVktli0+qC2jAczkF2sfzD7TpRLaDR
	HyIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=Cg0k0vUQHU5+hgyaYYxFOhvb3KhwQXD1OaFV45jwAmU=;
	b=WoyuTbaJNotRJMwMJ9VixNeXK1EfS66Q6e3NLwJ6QefZbR5CHJaEgoAAVJTrC//RtU
	ClY/kuWhi0oDptm/HiHsgmCEUGpFtpWPktcnNpUYkbjx/f1cLIEUh8GeU+YXoHiafx2I
	NLcR7wrMh662VRfQJQcci0CMKj/DoprkgVJX8fMuS45pMhckd/me7ByUd6FqdKMfvWJu
	gxyK9F3jpFFYdQ/IzRRASIwTPHLoFKWIEDd+MjKLUYzMKTGojPJuvRTX7pdSh9QI2L6s
	FbE18IVcvv8W9jIK52xV9CuYLb+GfkOqGRDpTpUlJUHLB1Mze4u1FlqY4oAPDK4Pocmv
	rhLg==
X-Gm-Message-State: ALoCoQmQTuFpaQrQKTq2BI3yKF5gP8xEg7k42F2pidHAMV9RRjynaE3xiBJrW0t128cWPTKytihsK/PpzscoUyTXeHr/3Rd8ZY9fK1Wt89q6oi3AQBK7PfE=
X-Received: by 10.182.200.162 with SMTP id jt2mr3214327obc.55.1452776854696;
	Thu, 14 Jan 2016 05:07:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.202.51.67 with HTTP; Thu, 14 Jan 2016 05:07:05 -0800 (PST)
In-Reply-To: <b23c413682080d988bd163c6df0f439cd41ae7ad.1448455166.git.jussi.kukkonen@intel.com>
References: <cover.1448455166.git.jussi.kukkonen@intel.com>
	<b23c413682080d988bd163c6df0f439cd41ae7ad.1448455166.git.jussi.kukkonen@intel.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Thu, 14 Jan 2016 15:07:05 +0200
Message-ID: <CAHiDW_HxSHvF_f4ZaHHqt6hbvKs2kj7TJm799YV8CJf8ZpZEXQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] connman-gnome: rrecommend connman, don't rdepend
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
X-List-Received-Date: Thu, 14 Jan 2016 13:07:34 -0000
Content-Type: multipart/alternative; boundary=001a11c239305cc25705294af815

--001a11c239305cc25705294af815
Content-Type: text/plain; charset=UTF-8

On 25 November 2015 at 15:05, Jussi Kukkonen <jussi.kukkonen@intel.com>
wrote:

> connman-gnome doesn't have a binary dependency on connman, and using
> RRECOMMEND is better for multilib builds (connman-gnome works fine
> with connman from a different architecture).
>

It's possible I've missed a thread during holidays but I believe this patch
never made it into master.

Jussi



> Fixes [YOCTO #8586]
>
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ---
>  meta/recipes-connectivity/connman/connman-gnome_0.7.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
> b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
> index 7b875f0..1849dbd 100644
> --- a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
> +++ b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
> @@ -22,7 +22,7 @@ S = "${WORKDIR}/git"
>  inherit autotools-brokensep gtk-icon-cache pkgconfig distro_features_check
>  ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
>
> -RDEPENDS_${PN} = "connman"
> +RRECOMMENDS_${PN} = "connman"
>
>  do_install_append() {
>      install -m 0644 ${WORKDIR}/images/*
> ${D}/usr/share/icons/hicolor/22x22/apps/
> --
> 2.1.4
>
>

--001a11c239305cc25705294af815
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 2=
5 November 2015 at 15:05, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">connman-gnome doesn=
&#39;t have a binary dependency on connman, and using<br>
RRECOMMEND is better for multilib builds (connman-gnome works fine<br>
with connman from a different architecture).<br></blockquote><div><br></div=
><div>It&#39;s possible I&#39;ve missed a thread during holidays but I beli=
eve this patch never made it into master.</div><div><br></div><div>Jussi</d=
iv><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Fixes [YOCTO #8586]<br>
<br>
Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.co=
m">jussi.kukkonen@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-connectivity/connman/<a href=3D"http://connman-gnome_0.7=
.bb" rel=3D"noreferrer" target=3D"_blank">connman-gnome_0.7.bb</a> | 2 +-<b=
r>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-connectivity/connman/<a href=3D"http://connman-gn=
ome_0.7.bb" rel=3D"noreferrer" target=3D"_blank">connman-gnome_0.7.bb</a> b=
/meta/recipes-connectivity/connman/<a href=3D"http://connman-gnome_0.7.bb" =
rel=3D"noreferrer" target=3D"_blank">connman-gnome_0.7.bb</a><br>
index 7b875f0..1849dbd 100644<br>
--- a/meta/recipes-connectivity/connman/<a href=3D"http://connman-gnome_0.7=
.bb" rel=3D"noreferrer" target=3D"_blank">connman-gnome_0.7.bb</a><br>
+++ b/meta/recipes-connectivity/connman/<a href=3D"http://connman-gnome_0.7=
.bb" rel=3D"noreferrer" target=3D"_blank">connman-gnome_0.7.bb</a><br>
@@ -22,7 +22,7 @@ S =3D &quot;${WORKDIR}/git&quot;<br>
=C2=A0inherit autotools-brokensep gtk-icon-cache pkgconfig distro_features_=
check<br>
=C2=A0ANY_OF_DISTRO_FEATURES =3D &quot;${GTK2DISTROFEATURES}&quot;<br>
<br>
-RDEPENDS_${PN} =3D &quot;connman&quot;<br>
+RRECOMMENDS_${PN} =3D &quot;connman&quot;<br>
<br>
=C2=A0do_install_append() {<br>
=C2=A0 =C2=A0 =C2=A0install -m 0644 ${WORKDIR}/images/* ${D}/usr/share/icon=
s/hicolor/22x22/apps/<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.1.4<br>
<br>
</font></span></blockquote></div><br></div></div>

--001a11c239305cc25705294af815--
