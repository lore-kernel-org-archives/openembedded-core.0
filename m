Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-yw0-f173.google.com (mail-yw0-f173.google.com
	[209.85.161.173])
	by mail.openembedded.org (Postfix) with ESMTP id 2BEAB71A6B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Feb 2017 08:11:36 +0000 (UTC)
Received: by mail-yw0-f173.google.com with SMTP id v200so62597339ywc.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Feb 2017 00:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FZ++ePlAD7LwPDg2Zs2kMn1pYWPH0P7ltjDiP1dPoAw=;
	b=HQK+mvaV/RGcR5knbaUKLFPifaohZ0AVthqHnZq5qsSa/jfX49Iz+xRM+fQgiV9Kzk
	GdI8qdPcVxWKqNcF1X21z4PHAvSknlzIcRTrES59YyoldS7+eM7e6cGPd8TZJBFspbH4
	//zhyqV7SbBc+xeAO/vLPmuX14h2c4HX8e+qcmDrvBOuuRNtW+EJeEknThM6Hs0BG9Rt
	Skp4moHU15moUzqLLrnGRaRcq1PrZr3k80OPUiO+m0HJKIjhargPagQzb6GwkDGMbVlo
	HVjvlIadvf8Jz0+yYQrHyRG75WGAR9I6gOi3aJBCRhhf6UsHW5DvncSNAb0jLg3zrsF7
	eY3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FZ++ePlAD7LwPDg2Zs2kMn1pYWPH0P7ltjDiP1dPoAw=;
	b=rO0YdiNvAbTuMBMT0ISAcy5aptqmvYhMiCitFae3e+zL4zKyCFyIwajqoVd0LcSeI5
	jYKXhpKCkHSiYRIbFBuIwguRzK5j2qUDuZh5AuD+G6P50+ixWk/CaiFwwOsJtWH2QkkT
	ZJJX72GqOkbs/6TIWSORk0WXro8JL0JWhqufSSfE3j50uq5Vxu+bBUHPNfVVDSjK4y/s
	/mrOAPZkwuisfP+epYXP4T0woMJhI/i+8UCQnDLaHX2cBzD3LFR7mbkMNE5jDt13RNZg
	kRgaU5GuvtGxW2+hcj+BcCq7+doxnuFI1JyDOgJ8Fido3DdY9f9YTE/7NTEHDx0V1YG3
	Nqew==
X-Gm-Message-State: AIkVDXIVPFa0WfTvJbiXjOWAJCfm7OWRo9h4Xe4nZYrD5hU2lZZmfJakmkdHCUm90tcie8yAig7yvG3e3xxZFW1V
X-Received: by 10.129.116.136 with SMTP id p130mr10898291ywc.151.1486455096972;
	Tue, 07 Feb 2017 00:11:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.13.234.11 with HTTP; Tue, 7 Feb 2017 00:11:06 -0800 (PST)
In-Reply-To: <20170206204616.26245-1-raj.khem@gmail.com>
References: <20170206204616.26245-1-raj.khem@gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Tue, 7 Feb 2017 10:11:06 +0200
Message-ID: <CAHiDW_F_Hwa-cTVqpchB6s0O9U3vvO7gx0WMe0ntnV-cV5FGLA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] qemu: Inherit pkgconfig
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
X-List-Received-Date: Tue, 07 Feb 2017 08:11:37 -0000
Content-Type: multipart/alternative; boundary=001a1147edaa07dd280547ec4c13

--001a1147edaa07dd280547ec4c13
Content-Type: text/plain; charset=UTF-8

For whoever merges: Patches 1, 2 and 5 of this patchset seem to be the same
as my "Add some missing pkgconfig inherits" set, feel free to use these
instead.

Jussi

On 6 February 2017 at 22:46, Khem Raj <raj.khem@gmail.com> wrote:
>
> Fixes
>
> | ERROR: pkg-config binary 'pkg-config' not found
> |
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc
b/meta/recipes-devtools/qemu/qemu.inc
> index e3af5c21c0..ef5d75c450 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -6,7 +6,7 @@ RDEPENDS_${PN}_class-target += "bash"
>  RDEPENDS_${PN}-ptest = "bash make"
>
>  require qemu-targets.inc
> -inherit autotools ptest
> +inherit autotools pkgconfig ptest
>  BBCLASSEXTEND = "native nativesdk"
>
>  # QEMU_TARGETS is overridable variable
> --
> 2.11.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--001a1147edaa07dd280547ec4c13
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br>For whoever merges: Patches 1, 2 and 5 of this patchse=
t seem to be the same as my &quot;Add some missing pkgconfig inherits&quot;=
 set, feel free to use these instead.<br><br>Jussi<br><br>On 6 February 201=
7 at 22:46, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gma=
il.com</a>&gt; wrote:<br>&gt;<br>&gt; Fixes<br>&gt;<br>&gt; | ERROR: pkg-co=
nfig binary &#39;pkg-config&#39; not found<br>&gt; |<br>&gt;<br>&gt; Signed=
-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.=
com</a>&gt;<br>&gt; ---<br>&gt; =C2=A0meta/recipes-devtools/qemu/qemu.inc |=
 2 +-<br>&gt; =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>&gt;<b=
r>&gt; diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devt=
ools/qemu/qemu.inc<br>&gt; index e3af5c21c0..ef5d75c450 100644<br>&gt; --- =
a/meta/recipes-devtools/qemu/qemu.inc<br>&gt; +++ b/meta/recipes-devtools/q=
emu/qemu.inc<br>&gt; @@ -6,7 +6,7 @@ RDEPENDS_${PN}_class-target +=3D &quot=
;bash&quot;<br>&gt; =C2=A0RDEPENDS_${PN}-ptest =3D &quot;bash make&quot;<br=
>&gt;<br>&gt; =C2=A0require qemu-targets.inc<br>&gt; -inherit autotools pte=
st<br>&gt; +inherit autotools pkgconfig ptest<br>&gt; =C2=A0BBCLASSEXTEND =
=3D &quot;native nativesdk&quot;<br>&gt;<br>&gt; =C2=A0# QEMU_TARGETS is ov=
erridable variable<br>&gt; --<br>&gt; 2.11.1<br>&gt;<br>&gt; --<br>&gt; ___=
____________________________________________<br>&gt; Openembedded-core mail=
ing list<br>&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org=
">Openembedded-core@lists.openembedded.org</a><br>&gt; <a href=3D"http://li=
sts.openembedded.org/mailman/listinfo/openembedded-core">http://lists.opene=
mbedded.org/mailman/listinfo/openembedded-core</a></div>

--001a1147edaa07dd280547ec4c13--
