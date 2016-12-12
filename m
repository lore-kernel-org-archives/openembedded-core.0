Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4955865D00
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 19:58:38 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id x23so1933904pgx.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 11:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=hW3vkMM/jMWYANlA+viIEG0yppbXxrHRGbnmqzSNfq4=;
	b=rBbdxBGjh90rUy1gI5k0CEfxdhCO5B8yyvEyzez/TE7DvDiL4dgkSas9vXDWTSMRWo
	KS9M0M9USoj5b16NpLWOgv6j4MS5ejhAXcKXQqcZXUjYviDErsVG1mLKD93RjG2Q+euv
	VFqa5B254nzAIs2cew+j8/t9PDcSExs32vAdIGl2CQNIxX3h82SLijR5AKHfaXVTHGpJ
	oaSBUBSRYmgpIerO1LUvScEE/QQSlD8Fcpq8MzcK4nAiLpIQi+p7c7zwQn2rdnfjZ79B
	FWwCRxLgr/ijODktEYdk73DBZAPgOyFsF+LXIGrATwTMg1n/27CuBVqGP4Q80192kntU
	P4lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=hW3vkMM/jMWYANlA+viIEG0yppbXxrHRGbnmqzSNfq4=;
	b=CDYdPaJmG/VmDxVbFaie3PZkROakGEppCTiVSYqAtudQ0/DaepSwu3rKj++Rfnx3pO
	mGz+UNITReuJtVHqzhcmSdeHbZAI5493toR6odZPpWwcGQolg8iMHlGdBqQ1gIKNx1e6
	tHmTX1uqX5qaoPfxbUrNJVoFcOgi3bx3JSsnAbAw+t+6Dcnzl9LFm/rCVDSYzzEgTVSy
	C2/M+cHvnlGY641J9nyizkDTDXZJcpu9/ujI39hacdJme3c5mNAJs0znF0SkVceR6ZF+
	h6s4krAmYqGk4tHfer8zp1vaASjacTivV3D2kUsxqDPtspEArOQT9VIjWDUbAtBgTwdq
	K0UQ==
X-Gm-Message-State: AKaTC03zYwSS+1Hx8ncCbg+hzE0FH0MNwrkv2wGLnC8hV2hKtuMy5L5l+QyN+OGMcxns/A==
X-Received: by 10.84.216.80 with SMTP id f16mr191013353plj.25.1481572720484;
	Mon, 12 Dec 2016 11:58:40 -0800 (PST)
Received: from ?IPv6:2601:646:8882:b8c:c5da:5e91:a866:bc94?
	([2601:646:8882:b8c:c5da:5e91:a866:bc94])
	by smtp.gmail.com with ESMTPSA id
	g82sm77410837pfb.43.2016.12.12.11.58.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Dec 2016 11:58:40 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 10.1 \(3251\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1481571408-19983-1-git-send-email-mark.asselstine@windriver.com>
Date: Mon, 12 Dec 2016 11:59:04 -0800
Message-Id: <FE42CCA4-D2B8-4AE1-83E5-5CBE94FA160C@gmail.com>
References: <1481571408-19983-1-git-send-email-mark.asselstine@windriver.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
X-Mailer: Apple Mail (2.3251)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: disable 'libdir' QA check
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
X-List-Received-Date: Mon, 12 Dec 2016 19:58:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Dec 12, 2016, at 11:36 AM, Mark Asselstine =
<mark.asselstine@windriver.com> wrote:
>=20
> When building systemd with multilib support enabled in your build you
> will get the following QA warnings (if the 'libdir' QA check is
> enabled.)
>=20
> WARNING: systemd-1_232-r0 do_package_qa: QA Issue: systemd-dbg: found =
\
> library in wrong location: =
/lib/systemd/.debug/libsystemd-shared-232.so
> systemd: found library in wrong location: =
/lib/systemd/libsystemd-shared.so
> systemd: found library in wrong location: =
/lib/systemd/libsystemd-shared-232.so [libdir]

Can we check if systemd can be a bit more flexible and accept it to go =
into multilib libdir ?
this patch can be then applied if its not acceptable to systemd =
community.

>=20
> Since systemd 231 upstream has included an 'internal' library which
> they explicitly place in the application specific /lib/systemd
> directory. You can see some of the discussion about this placement
> here https://github.com/systemd/systemd/issues/3810
>=20
> This placement is being picked up by the QA checker since when
> multilibs are enabled it expects all libraries to be in lib32 or
> lib64. Since the systemd and systemd-dbg packages don't contain any
> other libraries we can respect the upstream placement and skip this QA
> check for these packages. Unfortunately the QA mechanism doesn't allow
> us to specify individual files so this approach is the best we can do.
>=20
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
> meta/recipes-core/systemd/systemd_232.bb | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/systemd/systemd_232.bb =
b/meta/recipes-core/systemd/systemd_232.bb
> index baee02e..c86badb 100644
> --- a/meta/recipes-core/systemd/systemd_232.bb
> +++ b/meta/recipes-core/systemd/systemd_232.bb
> @@ -485,7 +485,8 @@ RRECOMMENDS_${PN} +=3D =
"${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-genera
>                       os-release \
> "
>=20
> -INSANE_SKIP_${PN} +=3D "dev-so"
> +INSANE_SKIP_${PN} +=3D "dev-so libdir"
> +INSANE_SKIP_${PN}-dbg +=3D "libdir"
> INSANE_SKIP_${PN}-doc +=3D " libdir"
>=20
> PACKAGES =3D+ "udev udev-hwdb"
> --=20
> 2.7.4
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


