Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 238C3605FE
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 May 2018 07:41:45 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id w194-v6so17446602wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 May 2018 00:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=jphKmeGu5OFWf7jwtfmnqvAwzNsDNOPTQMmsxGNke8c=;
	b=VUTpdtAIz2vP6kKn2mSpZlL8eVxrvfP+CYB6UyNORZzgkDDOk3yYf1cuoJTbDIHGO1
	8LAbDMtAdIBpqZrqy3rIHakVWgGSG+wt2PBDCBLt4JjiqyALhozSXRqyPheAIiOIK4It
	hQvvjeOR8PV4QdX6hGImGk8AylsFRFNThHaDa2PIutT7NOLDGvinov8kKgep7Oe5nQI3
	Oq8dugLJlZnCsDBtVTNZcSte3WKE8mKOiy/bj/NjQVk/k0XjS1PSSDQHcXc2DL4BttJ3
	DC7CQF0a01dmQYlHtJFkhfPsD0711Sk1WXEt8TzHuRO7AN+JeaqcCcJRbCrSbD/M1LEe
	9blw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=jphKmeGu5OFWf7jwtfmnqvAwzNsDNOPTQMmsxGNke8c=;
	b=mRPAFSHs3n1BtHdHZ5l473uo7BqXnWxEkCb6KhYq76WA0QQWruDiI3elx5/Sjui6Bl
	9l8bxtdtBFng46VoZmKbH2E9NSYPnLcH9Nnoeh4qeFCMyVrRQyhUsV7TtotVAUlxmHGY
	r08maIZAGw3WEWP0gU/MxiSWiB0ihSqkoS39MHpRe/l3kHM1elBarsLixIx195h7TIR3
	yGFFZwf7haJ4KFmDBBjxOL/ZNC2zu0xCKSTYPxAJ2rUH4U0C555Tvbekj/OYem6br4Ub
	dYplkbxUBOb1SPBHZnfNQROK5B9qyerGLSaooWXJuDnmtDhXQl/705VW3kS1cs0dmcDX
	vklQ==
X-Gm-Message-State: ALKqPweFUGrOEtZ2GtH3D+4ZWSm5/PQwoO9tx/GzFm9o4L0B0UBs6Vnq
	GDVkojO1ckJ/m1k2lAhcMvk=
X-Google-Smtp-Source: AB8JxZoRPs0EMZSOo9zUDz8IC152bwJDeNxVG7ujWPzO2Hz67Jgg9Inub0CpMV+7iTHmB4LQ3zSYhw==
X-Received: by 2002:a1c:8d90:: with SMTP id
	p138-v6mr6593812wmd.153.1526715706722; 
	Sat, 19 May 2018 00:41:46 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	p35-v6sm14836768wrb.12.2018.05.19.00.41.45
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 19 May 2018 00:41:45 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 19 May 2018 09:41:49 +0200
To: Andre McCurdy <armccurdy@gmail.com>
Message-ID: <20180519074149.GB1395@jama>
References: <1526683840-20390-1-git-send-email-armccurdy@gmail.com>
	<CAMKF1so7fh4Vc9-KkeQpjArm+Wzj4g=OOzsD3qChiWnV_q0Wuw@mail.gmail.com>
	<CA+chaQcfHGsQH62shk9uzu5kx1ArCs05Bq8dODsr30LVD67j+Q@mail.gmail.com>
	<CAJ86T=WG426=cyvtG811fWViqp+Sx7u0k9sUxo88SOJzVMQ2hA@mail.gmail.com>
	<20180519071154.GA1395@jama>
	<CAJ86T=Ux8rM19VEdrG+cT1B08PmMQPB4TbeLj57P8zqfBw+cpw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ86T=Ux8rM19VEdrG+cT1B08PmMQPB4TbeLj57P8zqfBw+cpw@mail.gmail.com>
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
X-List-Received-Date: Sat, 19 May 2018 07:41:46 -0000
X-Groupsio-MsgNum: 111536
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/WwmFnJnmDyWGHa4"
Content-Disposition: inline

--/WwmFnJnmDyWGHa4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 19, 2018 at 12:31:51AM -0700, Andre McCurdy wrote:
> On Sat, May 19, 2018 at 12:11 AM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
> > On Fri, May 18, 2018 at 11:48:45PM -0700, Andre McCurdy wrote:
> >> On Fri, May 18, 2018 at 10:42 PM, Martin Jansa <martin.jansa@gmail.com=
> wrote:
> >> > This variable was always meant to be used from DISTRO config
> >>
> >> I'm not sure if that's true. Do you have a reference?
> >
> > http://git.openembedded.org/openembedded-core/commit/?id=3D951200673af2=
7538beaef647a33308b4f15d1fb0
> > "in case we have MACHINE without "thumb" in TUNE_FEATURES and distro se=
tting ARM_INSTRUCTION_SET to "thumb""
> >
> > https://github.com/Angstrom-distribution/meta-angstrom/blob/master/conf=
/distro/include/angstrom.inc#L39
> > https://github.com/shr-distribution/meta-smartphone/blob/fido/meta-shr-=
distro/conf/distro/shr.conf#L150
>=20
> Certainly there are distros which force ARM_INSTRUCTION_SET. I'm not
> sure if that's evidence that machines shouldn't set a default though?

It's still more evidence then what you've shown that it should be in
machine config.

> >> >, why not add it
> >> > to:
> >> > oe-core/meta/conf/distro/include/default-distrovars.inc
> >> > or
> >> > oe-core/meta/conf/distro/include/tcmode-default.inc
> >> >
> >> > ?
> >>
> >> Because then it would either apply to all ARM machines, including
> >> those which only support Thumb1, which isn't ideal. Keeping it as part
> >> of the machine config makes it easy to apply selectively to armv7a and
> >> above where we know it's safe and desirable. Distros can of course
> >> still over-ride (ie the machine only sets a weak default).
> >
> > You can still enable it with weak assignment only for some architectures
> > like Angstrom does. But I don't see any reason why not enable it for all
> > architectures? Yes Thumb1 isn't as good as Thumb2 but still many people
> > are using it
>=20
> I'm not sure if there are "many people" still trying to persevere with
> Thumb1. Maybe there are a few masochists left, but I guess they
> probably have their own distros and don't rely on the oe-core
> defaults.
>=20
> My approach is to try to make small, safe, incremental improvements
> and doing anything which might change the default instruction set to
> Thumb for CPUs which can only support Thumb1 doesn't fit that
> approach.

You can still apply it only for some architectures as mentioned before.

> >, why shouldn't oe-core be tested with thumb enabled (with
> > armv5te qemuarm?), see:
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D9213
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D7717
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D1709
> >
> >> Is there a specific problem you see with the current patch?
> >
> > DISTROs doing multi machine builds already need to select the right
> > DEFAULTTUNEs to find good compromise with common denominator of the
> > MACHINEs they want to support (or groups of MACHINEs they want to
> > support). Supporting or not supporting thumb at all is part of that
> > question so DISTRO should decide that, tune files already have the thumb
> > knob in TUNE_FEATURES to say which MACHINE is capable of supporting it.
>=20
> Setting a weak default for armv7a and above from the machine config
> doesn't change any of that. Distros still have full control.

If it's in distros control, then it should be in distros default config.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/WwmFnJnmDyWGHa4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWv/VPAAKCRA3VSO3ZXaA
HPxpAKCmWBSDhdQgafWgLRAPmR4jcncEwQCePgV5+LMgRRiEMhcmaNZ+UDPW8FA=
=2Jpu
-----END PGP SIGNATURE-----

--/WwmFnJnmDyWGHa4--
