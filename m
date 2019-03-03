Return-Path: <trini@konsulko.com>
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
	[209.85.208.53])
	by mail.openembedded.org (Postfix) with ESMTP id 420727C5DD
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Mar 2019 22:52:03 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id b20so2709385edw.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Mar 2019 14:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=xsYfrZxmMvXvaQz2eCe0HdeltJP7GbSuvkBMczBMzKo=;
	b=Lh7SjH/jcnvHUd1WLkBOVzLDKBKmi5oGy9yKtAXDh77ox3vy9zv/BZaJzycM0MIbzv
	8SlrdGPhFf5lKnZ438+Q4nXZDMSJwWK26+lW9uYvSmD1tO/jzdHeEUG/Rzj46e9wQ0Ue
	mMb1wX7sxiLzz3mK5uwBAIYLRFpVL8WuYO9TI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=xsYfrZxmMvXvaQz2eCe0HdeltJP7GbSuvkBMczBMzKo=;
	b=GKUVzK0q7ERX+uBY8s5xOA2mutlMQiGyHdTMUITyRks8RikSX34Sas5/bVFuXQUr5U
	8BlXr0IIEHx9hdAbtxtooOOhspXZhsug3/GcPc5x88FvO0AORrGknjBUvX7sMXYgmiPd
	9VKAb46F0o9TcnCwIi0OdlZlZVzYxQVp9rbiVBm+KoeSoYPWga0pb0ltSZN6dI6BMk4w
	aRl+1HTVD9EcHXnB3sZYLRjzBlyZ73F/pEnOcmRSMBc7BQ/YLYvNaulnlvv1NC5xRImS
	xiIXi90Bch2GWwjf77+SRf891FPUAzUax+7s+VUwXEn7MHU45oVEu/ohb7ilNvNl4mxq
	emGw==
X-Gm-Message-State: APjAAAUzDDaPF7tphPLim3hdQBW4BsuZYtJcUHGj9H08QE7y7z4kxJT6
	hTwjynf+44kgbWL90qzfjWzgqg==
X-Google-Smtp-Source: APXvYqxfP1tPXkq9pRNf3j6E2gIINdQ5Qyi2IHsJJv6z4eLi3ZWJ1z3jSCwtfL3fZgqpvnZ23kvs3g==
X-Received: by 2002:a17:906:b7c2:: with SMTP id
	fy2mr10652564ejb.9.1551653524034; 
	Sun, 03 Mar 2019 14:52:04 -0800 (PST)
Received: from bill-the-cat
	(cpe-2606-A000-1401-880D-D0BF-27DA-BE9A-269E.dyn6.twc.com.
	[2606:a000:1401:880d:d0bf:27da:be9a:269e])
	by smtp.gmail.com with ESMTPSA id
	t25sm1576362eda.69.2019.03.03.14.52.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 03 Mar 2019 14:52:03 -0800 (PST)
Date: Sun, 3 Mar 2019 17:51:59 -0500
From: Tom Rini <trini@konsulko.com>
To: Joshua Watt <jpewhacker@gmail.com>
Message-ID: <20190303225159.GM5026@bill-the-cat>
References: <20190303204731.GK5026@bill-the-cat>
	<CAJdd5GYLLN4OB+wRsFGN10Cs2ybvKNcM_TP5pMHRdycf0M_Lsg@mail.gmail.com>
	<20190303212515.GL5026@bill-the-cat>
	<CAJdd5GbdpUCenci29Pk16vzhFDR=rMb_sd9CWD15pHreFPQfDw@mail.gmail.com>
	<CAJdd5GaOk=asx=r1yVOEokMbiVPsk_8bdArYq1KzrNR22_LcNQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJdd5GaOk=asx=r1yVOEokMbiVPsk_8bdArYq1KzrNR22_LcNQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: sstate hash equivalence breaks rm_work
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
X-List-Received-Date: Sun, 03 Mar 2019 22:52:04 -0000
X-Groupsio-MsgNum: 121875
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pN9MePJoZbRKbUk1"
Content-Disposition: inline

--pN9MePJoZbRKbUk1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 03, 2019 at 04:20:49PM -0600, Joshua Watt wrote:
> On Sun, Mar 3, 2019 at 4:11 PM Joshua Watt <jpewhacker@gmail.com> wrote:
> >
> > On Sun, Mar 3, 2019 at 3:25 PM Tom Rini <trini@konsulko.com> wrote:
> > >
> > > On Sun, Mar 03, 2019 at 03:21:12PM -0600, Joshua Watt wrote:
> > > > On Sun, Mar 3, 2019, 2:47 PM Tom Rini <trini@konsulko.com> wrote:
> > > >
> > > > > Hey all,
> > > > >
> > > > > As part of the packagegroup-core-base-utils series I noticed that
> > > > > with rm_work enabled like I usually have, every build was startin=
g over
> > > > > with rebuilding linux-libc-headers and going down from there.  I
> > > > > finished bisecting this now and it comes down to:
> > > >
> > > > Just for reference, are you trying to use hash equivalence? It soun=
ds like
> > > > not, but I would like to make sure.
> > >
> > > I am not.
> > >
> > > > Also, it there an AB build that uses rm_work that would have seen t=
his?
> > >
> > > OK, so I see I forgot a step that was clear to me, but, uh, not in the
> > > email.  What breaks is for example:
> > > bitbake core-image-minimal && bitbake core-image-minimal
> > > That second build, rather than see "nothing to do" (or at least, almo=
st
> > > nothing to do) says "Oh, I need to build linux-libc-headers from
> > > scratch" and possibly other stuff too, but that's the first thing I
> > > notice.
> >
> > Ok. I've started a build to test it. Would you mind opening a Bugzilla
> > for it and assigning it to me?
> >
> > For posterity, the poky commit SHA is adc37721a86c
>=20
> Hmm, FWIW I just tried this on my setup with rm_work enabled and it
> worked as expected (e.g. did not rebuild unnecessarily).... would you
> be able to share more of your setup (local.conf, layers.conf,
> site.conf)?

On oe-core/master, local.conf / layers.conf are as setup.  All of site.conf=
 is:
DL_DIR =3D "${HOME}/work/OE/downloads"
SSTATE_DIR =3D "${HOME}/work/OE/sstate-cache-${DISTRO_VERSION}${TARGET_VEND=
OR}"

# Save more space
INHERIT +=3D "rm_work"
# But keep this around for debugging
RM_WORK_EXCLUDE +=3D ""

INHERIT +=3D "buildstats"
INHERIT +=3D "buildstats-summary"

And:
$ lsb_release -a
No LSB modules are available.
Distributor ID:	Ubuntu
Description:	Ubuntu 16.04.6 LTS
Release:	16.04
Codename:	xenial

--=20
Tom

--pN9MePJoZbRKbUk1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJcfFqOAAoJEIf59jXTHXZSKSkP/1Ih5FVXmPblhwpDJcN9VTdM
0+9wHeI/K7TNRTqfrAOL4/UhncKYHZF0d5ReYb6xWjJcT1GHPmEgsS7xhf+7a+kL
Rs5untxPDtLiVVeOEEhQo3qaALgiRmobmSM5T4YxUNycHV/qn283X94uspNQhgii
NW00MceIhC5q/AvcdkfcO2Mh96Qj0KU93CGle/JycF9DQ4m80OUrXgr6vayq4fZh
Z/n/K+glU5m/DkMPcQfkdqaNJbK06xFI7RoAfX3HUHFh/vsKh4oFO0hcBoo8eMbo
KGuRCQI1tZG+1hzwSOl8ccfLDvyFKYiyqlU+MoguhUtHyxyd45pNdy0NDENH0Q6+
PCuoZhaetYH4JGx7q1GcAmxOigeNl1rUNb6Dxt6Dsgzdd/WagHow/d4f6gmPmmQH
LttaAD1peEMPsUM2NsXBVXqPD7QvtBdnvrAuJOOw8ISeme2LxXIijolbCNef4qBX
gzvT12I1Te0wHiGhMFQUWTk3BbO3gT+PE/kJwmxvrsBD4tS4apXi9jcrNV0HMHLU
RHJ5S9OIJMi9f69WRCgSklx66mpwkFeUeRWXeptFjquJrU6e5vYRSTb/VuTI0NAd
en91KldEGO3klTrrGVMH9y3eD39mOuKDJQjLoiFQSEeC4ZkhobPQwYikNGQBT23v
SQ52ied3+ptsmENEaqOo
=aZbw
-----END PGP SIGNATURE-----

--pN9MePJoZbRKbUk1--
