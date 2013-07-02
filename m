Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id 59D3E62062
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2013 11:44:27 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id c1so2659569eek.32
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Jul 2013 04:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ZfbsgeXO4mM3VffAnq3K9cTDMlZv5EMwARxwX6kO/mI=;
	b=Ie7J//JJLvOFDTggk2uPEC0s6kCQ7MYenvialE1+kRICUfk3mNhyOHnwyDQ1H6mE/e
	+OX2AeAHN50g5XsgJnS73zMrJYsP4cqJcKkWC8VVemllEooXiip7U4OR86cj1aU6Sj+P
	G6YXa1Y6uJh3C6LanZMtMJAPRmprGQMYAVDwAu9lObfyrdo8PWduF2NiBh1+Vby/ujgp
	jyE6oUf4JSevzOV3DlMbuC0C7J3kp3AndUfppU7o+LV78zJg6RejXqpxy3g3qU/4lQN2
	3IO+jhHcxkd2wx55PX5rKZyG3NkfPCzO2Ez7HJu+reIy09foPrTPi/BKdK5CCR+p/C+P
	2A5w==
X-Received: by 10.14.2.137 with SMTP id 9mr25536948eef.64.1372765467240;
	Tue, 02 Jul 2013 04:44:27 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n5sm36030145eed.9.2013.07.02.04.44.25 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 02 Jul 2013 04:44:26 -0700 (PDT)
Date: Tue, 2 Jul 2013 13:44:27 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20130702114403.GA3285@jama>
References: <cover.1372707180.git.Martin.Jansa@gmail.com>
	<5fe62449a23d73dcdae54d7e8f37f2a178ad0751.1372707180.git.Martin.Jansa@gmail.com>
	<CAJTo0Lah0em7+be56wFOAHP+eCZy7NJqN=BY+T1SN47bXdKbwQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lah0em7+be56wFOAHP+eCZy7NJqN=BY+T1SN47bXdKbwQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] mesa: bump SRCREV in git recipe, refresh patches
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
X-List-Received-Date: Tue, 02 Jul 2013 11:44:27 -0000
X-Groupsio-MsgNum: 41286
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NDin8bjvE/0mNLFQ"
Content-Disposition: inline

--NDin8bjvE/0mNLFQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 02, 2013 at 11:39:24AM +0100, Burton, Ross wrote:
> On 1 July 2013 20:36, Martin Jansa <martin.jansa@gmail.com> wrote:
> > * 0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch
> >   needs to be rebased so move old version for 9.1.3 to
> >   mesa-9.1.3/ and update the version in meta/
>=20
> Typo "meta/".

Updated in branch.

>=20
> > -# 9.1.3 commit
> > -SRCREV =3D "f32ec82a8cfcabc5b7596796f36afe7986651f02"
> > +SRCREV =3D "5a925cc5504575c22dbb7d29842d7fc5babcb5c7"
> >  PV =3D "9.1.3+git${SRCPV}"
>=20
> git describe doesn't call this a descendent of 9.1.x so I presume this
> is a master commit.  Can you change PV to reflect that somehow?
>=20
> That said I've discovered that our rpm doesn't support ~, so calling
> it "9.2.0~git" isn't going to work.

yes it's from master and I think that we always used this syntax
${OLD_RELEASED_VERSION}+git${SRCPV}

IIRC "9.2.0~git" isn't supported in opkg too.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--NDin8bjvE/0mNLFQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHSvRsACgkQN1Ujt2V2gByX1QCfR8OMdh22fINnOtzvwAoVSz4Z
QwoAnRWpc8n/e9K4phOh4076Djot6Y4u
=Zzle
-----END PGP SIGNATURE-----

--NDin8bjvE/0mNLFQ--
