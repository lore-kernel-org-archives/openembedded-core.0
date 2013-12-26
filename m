Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id EBB8E60D72
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Dec 2013 11:57:44 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id j9so4856433wiv.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Dec 2013 03:57:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=xDdX5XIa0Herxf6S+JpYCckOmipFoNl275JOGX5d4pk=;
	b=dNlqGwxtxINc93qTEX89LAH4XpmwcYnlpcujkKiv0G24o93g6Tk0EiJ8ZgknzgRjj9
	8MDYU1XI1jzxdVnjdoiARryHveKvyMA2bRfR1ZAjiSdL0ZMqcF/VJYUCD+x4cg4V30sq
	twDCTds7PBMFTICFW3Yj//A8q0ucIjKwVoA18Vs/Y1dkl/9Exy2/ztFKiuxsW/cy27Fr
	bGU7t/etDPwBrKl9A9ZEwa7TKO9Vz9sNA9KtOXhRbI63sg9+H9ZW6J/nYlgjGCxOEZA5
	84XEt4OU+5lMxshCgNWKAeeINwZSEzX1GWSFNeHEKC6xqozpbKlLBg+LWdPRTzH95Ggc
	CdzA==
X-Gm-Message-State: ALoCoQlSK2eOxH+vst+O9XApOpTZ/hMKVR+1tEFNSF/39f6Xtcg9vovzrGjVsvli4zq5ZrGe330R
X-Received: by 10.194.123.8 with SMTP id lw8mr29639011wjb.40.1388059065329;
	Thu, 26 Dec 2013 03:57:45 -0800 (PST)
Received: from ?IPv6:2001:610:612::51f4:6495:b9d9:7bad?
	([2001:610:612:0:51f4:6495:b9d9:7bad])
	by mx.google.com with ESMTPSA id j9sm16730957wjz.13.2013.12.26.03.57.43
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 26 Dec 2013 03:57:44 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1387895862-15110-1-git-send-email-fahad_arslan@mentor.com>
Date: Thu, 26 Dec 2013 12:57:42 +0100
Message-Id: <1D989040-0255-475D-82AC-504AEC54B163@dominion.thruhere.net>
References: <1387895862-15110-1-git-send-email-fahad_arslan@mentor.com>
To: Fahad Arslan <fahad_arslan@mentor.com>
X-Mailer: Apple Mail (2.1827)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pulseaudio: rescale input being passed to float method of speex
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
X-List-Received-Date: Thu, 26 Dec 2013 11:57:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 24 dec. 2013, om 15:37 heeft Fahad Arslan <fahad_arslan@mentor.com> =
het volgende geschreven:

> From: Fahad Arslan <Fahad_Arslan@mentor.com>
>=20
> Pulseaudio uses Speex to do resampling. Default Pulseaudio resampler
> is speex-float-1. However, Speex recipe in poky configures speex in

s/poky/oe-core/

> fixed point. This scenario creates a situation in which audio streams
> that need to be resampled are not playedback since input to speex is
> zeroed out when flaot input in range of +/-1 is converted to int.
> So we are rescaling the input before invoking speex flaot method.

s/flaot/float/g

>=20
> Upstream-Status: Submitted [pulseaudio-discuss@lists.freedesktop.org]
>=20
> Signed-off-by: Fahad Arslan <Fahad_Arslan@mentor.com>
> ---
> .../pulseaudio/rescale_input_to_speex_float.patch  |   24 =
++++++++++++++++++++
> .../pulseaudio/pulseaudio_4.0.bb                   |    3 ++-
> 2 files changed, 26 insertions(+), 1 deletion(-)
> create mode 100644 =
meta/recipes-multimedia/pulseaudio/pulseaudio/rescale_input_to_speex_float=
.patch
>=20
> diff --git =
a/meta/recipes-multimedia/pulseaudio/pulseaudio/rescale_input_to_speex_flo=
at.patch =
b/meta/recipes-multimedia/pulseaudio/pulseaudio/rescale_input_to_speex_flo=
at.patch
> new file mode 100644
> index 0000000..fe5e6a7
> --- /dev/null
> +++ =
b/meta/recipes-multimedia/pulseaudio/pulseaudio/rescale_input_to_speex_flo=
at.patch
> @@ -0,0 +1,24 @@
> +diff -Naur a/src/pulsecore/resampler.c b/src/pulsecore/resampler.c
> +--- a/src/pulsecore/resampler.c	2013-12-24 18:25:08.164787401 =
+0500
> ++++ b/src/pulsecore/resampler.c	2013-12-24 18:24:43.056787026 =
+0500
> +@@ -1347,7 +1347,7 @@
> +=20
> + static void speex_resample_float(pa_resampler *r, const pa_memchunk =
*input, unsigned in_n_frames, pa_memchunk *output, unsigned =
*out_n_frames) {
> +     float *in, *out;
> +-    uint32_t inf =3D in_n_frames, outf =3D *out_n_frames;
> ++    uint32_t inf =3D in_n_frames, outf =3D *out_n_frames, i;
> +=20
> +     pa_assert(r);
> +     pa_assert(input);
> +@@ -1357,6 +1357,11 @@
> +     in =3D pa_memblock_acquire_chunk(input);
> +     out =3D pa_memblock_acquire_chunk(output);
> +=20
> ++    /* Speex float API scale range is +/-32768 instead of +/-1.
> ++       So rescale input before passing it to Speex. */
> ++    for (i =3D 0; i < inf; i++)
> ++        in[i] =3D 32768.*in[i];
> ++
> +     =
pa_assert_se(speex_resampler_process_interleaved_float(r->speex.state, =
in, &inf, out, &outf) =3D=3D 0);
> +=20
> +     pa_memblock_release(input->memblock);
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_4.0.bb =
b/meta/recipes-multimedia/pulseaudio/pulseaudio_4.0.bb
> index b419c54..5afa20b 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio_4.0.bb
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_4.0.bb
> @@ -1,7 +1,8 @@
> require pulseaudio.inc
>=20
> SRC_URI =3D =
"http://freedesktop.org/software/pulseaudio/releases/pulseaudio-${PV}.tar.=
xz \
> -           file://volatiles.04_pulse"
> +           file://volatiles.04_pulse \
> +           file://rescale_input_to_speex_float.patch"
>=20
> SRC_URI[md5sum] =3D "591f211db2790a7e4d222f2dc6858db3"
> SRC_URI[sha256sum] =3D =
"35ceb36bb1822fe54f0b5e4863b4f486769fdfb8ff2111f01fd8778928f9cdae"
> --=20
> 1.7.9.5
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20


