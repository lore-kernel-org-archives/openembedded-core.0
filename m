Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SmtHc-0006FR-4d
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jul 2012 23:08:16 +0200
Received: by wibhq4 with SMTP id hq4so77918wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jul 2012 13:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=smRCO2jNBP3YkB7RK4lvleE2LkQHc393B1mh064oPzE=;
	b=Jeqeat9tzPrS84pqPWOT4TrfqU9KuXV/NRGK1MQqTxIm6BHfiUk54G0a/zgdqEp4SW
	eYeRDUrR263oCWPPkeB5PU9se3PzbvN3vMrXOG8+eTaUOzt7UUW7ZDAVUlu0QrpSbL+P
	EjUElr3SsPKVf7b1gozP2zvGreT4flzi9KkZw8Nn04DE9NzXWYcwd/vi5sajH4OVAq3n
	1LZjMMZ5S77uDVwxlYnlZGYFO1JknZJF68JMjQAezG4/PHe6zvr+Jnjoy+sCTnh4FUY7
	XLJKxhQ85vh0icJcNgy9loyiR0jsGlKO7XGk3Jv5j/kToUlHJPS8V/wGymV9TvlU3dyv
	+9Gw==
Received: by 10.180.105.130 with SMTP id gm2mr2279752wib.6.1341521831545;
	Thu, 05 Jul 2012 13:57:11 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id db7sm2000001wib.6.2012.07.05.13.57.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 Jul 2012 13:57:10 -0700 (PDT)
Date: Thu, 5 Jul 2012 22:57:09 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120705205709.GE3708@jama.jama.net>
References: <cover.1341498745.git.raj.khem@gmail.com>
	<20120705202306.GD3708@jama.jama.net>
	<CAMKF1sr7c4c3vk3DsJCM-usUD9zvSdgrZKCM0OxKfnQWLPaeZw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sr7c4c3vk3DsJCM-usUD9zvSdgrZKCM0OxKfnQWLPaeZw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 00/14] eglibc 2.16
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
X-List-Received-Date: Thu, 05 Jul 2012 21:08:16 -0000
X-Groupsio-MsgNum: 24762
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TD8GDToEDw0WLGOL"
Content-Disposition: inline

--TD8GDToEDw0WLGOL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 05, 2012 at 01:39:04PM -0700, Khem Raj wrote:
> On Thu, Jul 5, 2012 at 1:23 PM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> > On Thu, Jul 05, 2012 at 07:35:19AM -0700, Khem Raj wrote:
> >> This patch adds eglibc 2.16 recipes. I was able to build world
> >> on x86 except perf which was failing with 2.15 as well.
> >>
> >> I have also build and run core-image-sato on all qemus
> >>
> >> I did not remove 2.15 to allow some soak in time.
> >>
> >> The following changes since commit 5beb7176d361d4bfa279bbfab5a17b8fe4f=
a3b73:
> >>
> >>   netbase: update to ver. 5.0 (2012-07-05 14:18:19 +0100)
> >
> > Build and runtime tested on armv4t with bfd (om-gta02), but on armv7a
> > (where I have enabled gold) it fails in do_configure already.
> >
> > *** These critical programs are missing or too old: ld
>=20
> which package do you see this issue with ?
> glibc itself is not buildable with gold. In OE-Core we use gnu ld for
> linking eglibc and gold for rest of it.

eglibc-initial
http://norman-schleicher.de/jenkins/job/shr-core-branches-nokia900-shr-imag=
e/lastBuild/console

I was looking in meta/recipes-core/eglibc for switch forcing bfd for it,
but I haven't found it neither in 2.15 or 2.16..

Cheers,

>=20
> >
> > IIRC I've seen this with older eglibc too, but then it was working
> > again..
> >
> > BTW: gold on armv4t is still unusable right?
> >
>=20
> yes. It still is. I think one option is to try binutils/master, I was
> close to fixing it before I ran out of time
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--TD8GDToEDw0WLGOL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/1/6UACgkQN1Ujt2V2gByLJQCaA3pUg/xcow1eGfDWjLEJbXRh
8FkAnjKvWOLSWz2c616E6jRFP9ZAd3M4
=eveL
-----END PGP SIGNATURE-----

--TD8GDToEDw0WLGOL--
