Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QMmN8-0008O5-P7
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 21:25:30 +0200
Received: by fxm19 with SMTP id 19so1741163fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2011 12:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=BZNPZvUfT4xnU6FVR2eA3Ym+kcA66revhwj1dxnrdUo=;
	b=axM22GqciqQpGMRpOIzeIHSjfqQDEqmKlzgAoHrENXMLfpBqkdHO5ff4Qd2ZDGm9yC
	e7tItak6mUhVfmbrXy5v8NNVdkWpAQtEv0fw1A4ghyenMpw3MUmmx9UddUW99rsfSMC8
	6AfohM7KkjUG/468x4ZscXG7vumjOK5/Uhfwg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=fbgY0ypfVqHgWpGxvkYK1uHEyUrTPRJTkIIUZTqUGg/y697va8Y9VvxfUxViHptplQ
	e70OLjUT+IL8KpltJyb9aWSoR9dyg2Qob6agSDNKTzPssReGeDSxbVA/QHoz513DJ1BT
	mXFpTetWwxHfPfG14djt2mvV7owzHaivUITKc=
Received: by 10.223.78.132 with SMTP id l4mr2902212fak.44.1305746553013;
	Wed, 18 May 2011 12:22:33 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id d16sm772147faa.12.2011.05.18.12.22.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 May 2011 12:22:31 -0700 (PDT)
Date: Wed, 18 May 2011 21:22:25 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110518192224.GE11609@jama.jama.net>
References: <cover.1305665459.git.raj.khem@gmail.com>
	<cc2e6337ae338737455bf63bd43278dee302fb5c.1305665459.git.raj.khem@gmail.com>
	<1305734038.18415.108.camel@lenovo.internal.reciva.com>
	<BANLkTikiNW0UEfLM_UtKeekTcrW5UNNfUA@mail.gmail.com>
	<1305738527.18415.126.camel@lenovo.internal.reciva.com>
	<8A91C5F6-313A-4A0F-A18E-094CFC3BB337@dominion.thruhere.net>
	<BANLkTinvqEeyXsiH79UHb3Zhx+qkXZRJ5w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <BANLkTinvqEeyXsiH79UHb3Zhx+qkXZRJ5w@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH 1/1] default-distrovars.inc, task-core-boot.bb: Create distro overridable varibales
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 May 2011 19:25:30 -0000
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Bqc0IY4JZZt50bUr"
Content-Disposition: inline

--Bqc0IY4JZZt50bUr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 18, 2011 at 07:52:50PM +0200, Leon Woestenberg wrote:
> Hello,
>=20
> On Wed, May 18, 2011 at 7:29 PM, Koen Kooi <koen@dominion.thruhere.net> w=
rote:
> >
> > Op 18 mei 2011, om 19:08 heeft Phil Blundell het volgende geschreven:
> >
> >> On Wed, 2011-05-18 at 09:40 -0700, Khem Raj wrote:
> >>> Problem I have is, I dont want udev in RDEPENDS which is added by
> >>> task-core-boot
> >>> and task-core-boot is added to DISTRO_EXTRA_RDEPENDS through
> >>> default-distrovars.inc -> defaultsetup.conf -> bitbake.conf
> >>>
> >>> and my distro adds DISTRO_EXTRA_RDEPENDS to its RDEPENDS
> >>> as I think the variable is meant for distro's to define some extra
> >>> stuff if needed.
> >>>
> >>> How should I solve this problem ?
> >>
> >> Well, what I did in micro-base-image was simply to not use
> >> task-core-boot at all. =A0But in your case I was thinking that you cou=
ld
> >> overlay that recipe with from your distro's layer and make it do
> >> whatever you wanted.
> >
> > The fact that we have layers does not mean we need to follow the silo m=
entality you seem to prefer. If task-base in oe-core stops being usefull we=
 should fix it, now play around in our own little sandboxes.

FWIW: I also prefer to have "default" task-base, task-boot with sane
default settings in oe-core and every distro can reuse it as it is, or
customize with few global variables or replace with something completely
different if really needed (so I agree that it shouldn't be
unconditionaly added to DISTRO_EXTRA_RDEPENDS). Maybe we can introduce
VIRTUAL-RUNTIME_task-base ?=3D "task-base"
VIRTUAL-RUNTIME_task-boot ?=3D "task-core-boot"
and in default-distrovars.inc
DISTRO_EXTRA_RDEPENDS +=3D "${VIRTUAL-RUNTIME_task-boot}"

like we have ie for VIRTUAL-RUNTIME_apm,
VIRTUAL-RUNTIME_update-alternatives to keep variable namespace clean.

The same namespace for initscripts/login_manager/dev_manager and every=20
image recipe can use different values than what's default for distro.

But reinventing similar task-base/task-boot combo in every meta-distro
layer seems strange to me.

Regards,

> If task-base is getting less useful, removing it altogether (I found
> the  reasons mentioned by Phil convincing)  should be at least
> considered as an alternative.
>=20
> I am not sure why we should keep task-base as something generic --all
> distro's have their own specific requirements and configurations, even
> for task-base, so why not move this functionality into the distro and
> out of oe-core?
>=20
> I never quite saw what task-base gained us on a netto basis, but I
> think I am biased towards small tweaked images, so these are just my
> two cents.
>=20
> Regards,
> --=20
> Leon
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Bqc0IY4JZZt50bUr--
