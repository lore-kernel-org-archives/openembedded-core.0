Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id E2B5F762A2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 20:18:55 +0000 (UTC)
Received: by wicmv11 with SMTP id mv11so233093979wic.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 13:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=M9Ev/oHaNEonDLAV4c4+1ZCW+wWzBjhr5BV1qZ8JRPE=;
	b=UTTfQKyPUzFALU0mJJoVSuC2H+5fmpoRuvbPpxdDc/PRMaEcwVhL1o4SHpqdq6Glsz
	oBLugUZx6AdjvGvm7r/u/njPJz7TtQj7kqoYXm2/D+GToykMl7IwVDFrX/pJmnBuRAKl
	Xt6xYYuocamaNxNfSfTtbR6yWINptz1zV2zYHv1lvAEHBRqu57KWmQSDUCzgNTsu+H25
	ixG6IsQcphu0PeiSk5dv4ZAoqgOI57R/bKoBinKZEnwP20mjIZU/yj9Ljr6IDtufHKeU
	lmJ0kflPZ/XvTwWIx0ROPJxBItu55AJCj08gyxHRkDXvntODBYorhdt9DJuSKoTDQSq2
	7udQ==
X-Received: by 10.194.95.71 with SMTP id di7mr82999398wjb.125.1438201135081;
	Wed, 29 Jul 2015 13:18:55 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	lu5sm40272917wjb.9.2015.07.29.13.18.53
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Jul 2015 13:18:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 29 Jul 2015 22:19:04 +0200
To: Christopher Larson <chris_larson@mentor.com>
Message-ID: <20150729201904.GE12478@jama>
References: <1438103507-63604-1-git-send-email-abdur_rehman@mentor.com>
	<CAJTo0LZiEWScYqCJBfzrMQ=02vkb9jd5a-6+VvSZBqePZgr7yg@mail.gmail.com>
	<8663FA6B07BCC94795FAD21C9CC5ACF73783C098@EU-MBX-01.mgc.mentorg.com>
	<CAJTo0LZ8qasC_Out4=1KHyskj5KovxDL6+BPGoKTS8=FquBYcA@mail.gmail.com>
	<CABcZAN=W1_aW1YXAkR25TO0DM=iHoCzPrrBCNGhpw+pq3aJauA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABcZAN=W1_aW1YXAkR25TO0DM=iHoCzPrrBCNGhpw+pq3aJauA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] watchdog: kill update-rc.d when not using sysvinit
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
X-List-Received-Date: Wed, 29 Jul 2015 20:18:57 -0000
X-Groupsio-MsgNum: 68619
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ryJZkp9/svQ58syV"
Content-Disposition: inline

--ryJZkp9/svQ58syV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2015 at 12:27:15PM -0700, Christopher Larson wrote:
> On Wed, Jul 29, 2015 at 11:35 AM, Burton, Ross <ross.burton@intel.com>
> wrote:
>=20
> > On 29 July 2015 at 19:05, Rehman, Abdur <Abdur_Rehman@mentor.com> wrote:
> >
> >> watchdog_5.14.bb does not inherit systemd, and so
> >> INHIBIT_UPDATERCD_BBCLASS does
> >> not get set.
> >>
> >> While trying to build watchdog with systemd in DISTRO_FEATURES but not
> >> sysvinit,
> >> following warning is observed:
> >>     WARNING: QA Issue: watchdog rdepends on initscripts-functions, but
> >> it isn't
> >>     a build dependency? [build-deps]
> >>
> >> Since sysvinit is not in DISTRO_FEATURES and INHIBIT_UPDATERCD_BBCLASS=
 is
> >> not
> >> set, the logic in update-rc.d.bbclass goes on to add an rdep for watch=
dog
> >> on
> >> initscripts-functions, inside update_rcd_package(). And this results in
> >> the
> >> QA warning.
> >>
> >
> > When a class inherits update-rcd but not systemd, and the distro is
> > systemd only, update-rcd still runs (and has still run) as otherwise you
> > don't get any init scripts.  Setting inhibit will remove the init scrip=
ts,
> > and the watchdog daemon won't start.  I'm pretty sure this isn't what y=
ou
> > intended.
> >
> > Are you overriding VIRTUAL-RUNTIME_initscripts in your distro?  update-=
rcd
> > adds a dependency on that when it is inherited, which by default is
> > initscripts, so you get your build dependency there.  I suspect your di=
stro
> > is overriding that variable when perhaps it shouldn't be.
> >
>=20
> I don=E2=80=99t think we really want initscripts installed in a systemd-o=
nly
> distro, particularly if systemd is built with sysvcompat enabled, as we
> don=E2=80=99t want to run the sysvinit scripts for services which are alr=
eady
> covered by systemd proper, unless I=E2=80=99m missing something?

I agree and as work-around for this and similar issues I'm setting empty
VIRTUAL-RUNTIME_initscripts in systemd-only distros.

> --=20
> Christopher Larson
> kergoth at gmail dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics

> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ryJZkp9/svQ58syV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlW5NTcACgkQN1Ujt2V2gBwgWACfYcjyRqxzRelvIJyZxicm+E7e
QBEAn0CYrmEVW1SFJB2a7H8SO/2HFJ1U
=Hh8V
-----END PGP SIGNATURE-----

--ryJZkp9/svQ58syV--
