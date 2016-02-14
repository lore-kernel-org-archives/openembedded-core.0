Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 425A062136
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Feb 2016 11:48:33 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id c200so11040080wme.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Feb 2016 03:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=rM1vEuTEuZH7iQvgJwrEITCDuSLBw7darUl9a5WVXGI=;
	b=UnUnnXT4ioWCwSzOfptxKX7rfQUN9JLy8/lSpCRxb1SlbcITOkJxSAXxO5CIG2js8o
	U/cploh1+qrukLIPQP6H8vhvUPoLhVBMCYHDxDnMKyzSAK8VbQ1ZRXChcu+w7DIXmXlE
	6G+xmfeAnurdwvxAbfMjOqxGsisnMKXW/zENVRTV4IwLLkGjdJh62WG9U1Mj3iBKghk+
	L+r6TOlMMfyFdYgaHPPDlFALo8o9JvXMoZnspZKaAko0hqANcPQQwStVtm8wFpqLE5Rl
	iaGnGkJxYMjy9atZfl9LfB6ZMm0FYa9OWsl2tTgXwxEDndEWYg/3Du9utBqLOVucBK0X
	etoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=rM1vEuTEuZH7iQvgJwrEITCDuSLBw7darUl9a5WVXGI=;
	b=jaO9qTmkLcReKV9KD9ZbFx1axjyDHvb7g9qPegasB0Z6pyrhFlPax4OGxXM0gagnPB
	/d4DNW6AFP++ImuUoywPTcVTVvcHd+0vGAOeR+P9iGsWYirLbTrndmUwXs66uOAR9q1b
	Num0UEZTGDUHhEdn/n4lq21N355UX5PKJkat46PJ1loMNQaXxaE2DlyBiftvEPY5Ipif
	Iqbzx/7QkVRZiW5vHIa33FnCyGkHVeWKk9bDtxpZuObNoNOm1E6BB/upEZevxPwgMc0A
	4VnKMt/TqjG7KqKo/btqUgSJjmvQRNesCxK5xFzW6mlimT+DH6ZNjPIJJsHZY+FabmoO
	GR6g==
X-Gm-Message-State: AG10YORkEd4JoeiwmuhoaaIcK0S0epokWmHF/w755hC8Gq8qo5h73jnV9DQZMc7ZN+sjKw==
X-Received: by 10.194.103.198 with SMTP id fy6mr12738770wjb.48.1455450513623; 
	Sun, 14 Feb 2016 03:48:33 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	w136sm10700843wmw.0.2016.02.14.03.48.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 14 Feb 2016 03:48:32 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 14 Feb 2016 12:52:45 +0100
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20160214115245.GC3028@jama>
References: <1454943548-21889-1-git-send-email-nicolas.dechesne@linaro.org>
	<CAJTo0LZm-Q-f8im1Ssfcp6z8T2nj51ToV=s9NMYF2EP0z-Yt4Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZm-Q-f8im1Ssfcp6z8T2nj51ToV=s9NMYF2EP0z-Yt4Q@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] mesa: upgrade 10.6.3 -> 11.1.1
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
X-List-Received-Date: Sun, 14 Feb 2016 11:48:36 -0000
X-Groupsio-MsgNum: 78129
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+nBD6E3TurpgldQp"
Content-Disposition: inline

--+nBD6E3TurpgldQp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 09, 2016 at 10:26:43PM +0000, Burton, Ross wrote:
> On 8 February 2016 at 14:59, Nicolas Dechesne <nicolas.dechesne@linaro.or=
g>
> wrote:
>=20
> > * update SRC_URI and checksum.
> > * add PACKAGECONFIG to offer choice of crypto implementation (for sha1
> > functions)
> > * use libcrypto by default. In upstream commit a24bdce4, support for
> >   SHA-1 was copied from xserver repo, so let's use the same default for
> >   --with-sha1 option that we use in xserver recipe in OE core.
> >
>=20
> Forgot to ask - what real hardware was this tested on, and was anything
> like Piglit used to verify it is working properly?

It looks like non-x11 builds gained X11 dependency and mesa fails to
build in DISTROs without x11 in DISTRO_FEATURES:

mesa-11.1.1/src/loader/loader_dri3_helper.c:28:27: fatal error:
X11/xshmfence.h: No such file or directory


>=20
> Ross

> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+nBD6E3TurpgldQp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbAaowACgkQN1Ujt2V2gBzebACgt971YsAWllFMX2QkPz/SbJDu
yD8An38rDAW6y6H+OFWmOCsTCc0VsMji
=VwqS
-----END PGP SIGNATURE-----

--+nBD6E3TurpgldQp--
