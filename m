Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 52B1074F9F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 May 2018 07:11:50 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id h5-v6so11216529wrm.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 May 2018 00:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=d/7fJHipSrHAWqe0hleN8aMm6gTpPWcDSwyLCCM24cc=;
	b=DKHoTVOz856eMCTM96ArUU3zAXjF8bpGDxI2iYEu8i9uoISmiRk8SHXfGW1XKFS3+L
	8u85FhH/kquijgpIlauppXBA7paFZqRS5WiShCQt2LMwwCMYJGvq3BZJRUir367/pmfZ
	IHMx6Jb+NauYf4wzg0FFQF1sAqrFHJYDiCqVoy6qYfkEqSUNYNrBfP/t9tjnbqR9efVB
	GDUrsY2BiQVoYrHHwYk9AxVZurG6E5agQQZtm7KEOUE1ms6w5BXtfjw9yIQu4NvQcHkU
	WHfm5x0tzNGv+nVU7hc9512v8hDTi8sPA+G20Aym7YEcz/A0Lege2Wcp1NSevT/cFG+I
	RxFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=d/7fJHipSrHAWqe0hleN8aMm6gTpPWcDSwyLCCM24cc=;
	b=pEbZZAPAFT3EsZr8S72AJvwszIEd/ECQL3TC/iHVWOkhea/lDrdkkfkzJTKA8HHoXG
	nbp7oN54I/RX3fAZVvsqqzgkUc5WvBnqX8nMfOFKLcZ2If6jvDJ7cw50zy5c8KtgIrWs
	0afgqDzrDBN8nYNGi15Q0a2sA6rtoq2mfFprz7vQ8lNAz40P+kYhpoK2Qo90Vvl7wCBL
	eNOTW7vK5asDmcPUwJmZfzGGWTsajPeaFHTbaN4ReNOTDcZfhmjsC042YVEksxjNXNv3
	tK9NRAkrwigQdZDAU1EkrnoAfhKN60gXvZhSUspZjwEya1lSTMf5KCWAasv+lmaXn7to
	I5LQ==
X-Gm-Message-State: ALKqPwdg/lY8cyxWUNy7BLt/rqkghyMzkfbPrIBp8EfC0UWf8qXI+8Ns
	eip1QCxG4pYCSo1yNZ5vwsQ=
X-Google-Smtp-Source: AB8JxZpE82DqThrf0tVOatAG+GKaUYwf59UAZgXq8fTM6Fx3sSrLIi02STq5Bdueiyf1bcpWfxmuXg==
X-Received: by 2002:adf:a075:: with SMTP id
	l50-v6mr10745353wrl.227.1526713911649; 
	Sat, 19 May 2018 00:11:51 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	x17-v6sm24602166wmd.46.2018.05.19.00.11.50
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 19 May 2018 00:11:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 19 May 2018 09:11:54 +0200
To: Andre McCurdy <armccurdy@gmail.com>
Message-ID: <20180519071154.GA1395@jama>
References: <1526683840-20390-1-git-send-email-armccurdy@gmail.com>
	<CAMKF1so7fh4Vc9-KkeQpjArm+Wzj4g=OOzsD3qChiWnV_q0Wuw@mail.gmail.com>
	<CA+chaQcfHGsQH62shk9uzu5kx1ArCs05Bq8dODsr30LVD67j+Q@mail.gmail.com>
	<CAJ86T=WG426=cyvtG811fWViqp+Sx7u0k9sUxo88SOJzVMQ2hA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ86T=WG426=cyvtG811fWViqp+Sx7u0k9sUxo88SOJzVMQ2hA@mail.gmail.com>
User-Agent: Mutt/1.9.5 (2018-04-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] arch-armv7a.inc: default to Thumb2 instruction set for armv7a and above
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
X-List-Received-Date: Sat, 19 May 2018 07:11:51 -0000
X-Groupsio-MsgNum: 111534
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="J2SCkAp4GZ/dPZZf"
Content-Disposition: inline

--J2SCkAp4GZ/dPZZf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 18, 2018 at 11:48:45PM -0700, Andre McCurdy wrote:
> On Fri, May 18, 2018 at 10:42 PM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
> > This variable was always meant to be used from DISTRO config
>=20
> I'm not sure if that's true. Do you have a reference?

http://git.openembedded.org/openembedded-core/commit/?id=3D951200673af27538=
beaef647a33308b4f15d1fb0
"in case we have MACHINE without "thumb" in TUNE_FEATURES and distro settin=
g ARM_INSTRUCTION_SET to "thumb""

https://github.com/Angstrom-distribution/meta-angstrom/blob/master/conf/dis=
tro/include/angstrom.inc#L39
https://github.com/shr-distribution/meta-smartphone/blob/fido/meta-shr-dist=
ro/conf/distro/shr.conf#L150
=2E..

> >, why not add it
> > to:
> > oe-core/meta/conf/distro/include/default-distrovars.inc
> > or
> > oe-core/meta/conf/distro/include/tcmode-default.inc
> >
> > ?
>=20
> Because then it would either apply to all ARM machines, including
> those which only support Thumb1, which isn't ideal. Keeping it as part
> of the machine config makes it easy to apply selectively to armv7a and
> above where we know it's safe and desirable. Distros can of course
> still over-ride (ie the machine only sets a weak default).

You can still enable it with weak assignment only for some architectures
like Angstrom does. But I don't see any reason why not enable it for all
architectures? Yes Thumb1 isn't as good as Thumb2 but still many people
are using it, why shouldn't oe-core be tested with thumb enabled (with
armv5te qemuarm?), see:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D9213
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D7717
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D1709

> Is there a specific problem you see with the current patch?

DISTROs doing multi machine builds already need to select the right
DEFAULTTUNEs to find good compromise with common denominator of the
MACHINEs they want to support (or groups of MACHINEs they want to
support). Supporting or not supporting thumb at all is part of that
question so DISTRO should decide that, tune files already have the thumb
knob in TUNE_FEATURES to say which MACHINE is capable of supporting it.

Regards,

>=20
> > On Sat, May 19, 2018 at 1:40 AM Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >>
> >> On Fri, May 18, 2018 at 3:50 PM Andre McCurdy <armccurdy@gmail.com> wr=
ote:
> >>>
> >>> Although there may still be specific cases which can benefit from the
> >>> ARM instruction set, the Thumb2 instruction set is generally a better
> >>> default for armv7a class CPUs. Distros such as Debian and Fedora have
> >>> been targeting Thumb2 by default for some time.
> >>>
> >>> Note that setting ARM_INSTRUCTION_SET has no effect unless
> >>> TUNE_FEATURES contains "thumb" (which is controlled by the "t" suffix
> >>> in DEFAULTTUNE, e.g. armv7vehf-neon -vs- armv7vethf-neon, etc) so out
> >>> of tree machine configs may need to update their DEFAULTTUNE to take
> >>> advantage of this change.
> >>
> >>
> >>
> >> I think this is a good change and we shoudl take it in thumb2 is defau=
lt
> >> ISA
> >> for other major distros as well
> >>
> >> Oe based distros who ship feeds might be affected
> >>>
> >>>
> >>>
> >>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> >>> ---
> >>>  meta/conf/machine/include/arm/arch-armv7a.inc | 1 +
> >>>  1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc
> >>> b/meta/conf/machine/include/arm/arch-armv7a.inc
> >>> index bad1c27..a2663d8 100644
> >>> --- a/meta/conf/machine/include/arm/arch-armv7a.inc
> >>> +++ b/meta/conf/machine/include/arm/arch-armv7a.inc
> >>> @@ -1,4 +1,5 @@
> >>>  DEFAULTTUNE ?=3D "armv7athf"
> >>> +ARM_INSTRUCTION_SET ?=3D "thumb"
> >>>
> >>>  TUNEVALID[armv7a] =3D "Enable instructions for ARMv7-a"
> >>>  TUNECONFLICTS[armv7a] =3D "armv4 armv5 armv6 armv7"
> >>> --
> >>> 1.9.1
> >>>
> >>> --
> >>> _______________________________________________
> >>> Openembedded-core mailing list
> >>> Openembedded-core@lists.openembedded.org
> >>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--J2SCkAp4GZ/dPZZf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWv/OOQAKCRA3VSO3ZXaA
HOQKAJ0Uv2gEAnCbkUXseFiEsZDQXGh0agCfccnwhc9ERbdkB6BhtS7wcwJ19TY=
=S5q6
-----END PGP SIGNATURE-----

--J2SCkAp4GZ/dPZZf--
