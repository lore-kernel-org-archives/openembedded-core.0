Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1U5NZ8-0004Si-FB; Tue, 12 Feb 2013 22:39:02 +0100
Received: by mail-da0-f47.google.com with SMTP id s35so212834dak.20
	for <multiple recipients>; Tue, 12 Feb 2013 13:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=RmWsN1C1i29OzeYzCcTu5jY1zR+KRzRwMiOec8Pc0G4=;
	b=hEezW6pc3MYobQKqm8sZqzjuwhs5nfj4SU/IHqQnlyHMQPmSXzDoyaAvtWgdlzakCN
	ZLhAoUj2yP2WUEa5Wo4v85q9d/A6ycI1Eg/ySRLwpgrI2B5oYA0oXqQgoKHFbDWr0F5/
	0+Omf2ihS8XoR6jXvO6oWqVzQry1gErZScGlFBhSVs0xuAE8LQRvaP8TNEUUtmUhaaV5
	pg4d1od7kHLVdoyZ/pOjdPQF6FGNOWUDapG87nrFcIbTlBFBPd11Y4ErxoZihfKpnsw9
	HgtrbIVLGJehQEsZeJB7CC1aUNp1UahgQYWq+aa2w0A3VnyNsviFHxRI2C+hKa1HFWXq
	/XeQ==
X-Received: by 10.66.89.226 with SMTP id br2mr56016755pab.57.1360704181469;
	Tue, 12 Feb 2013 13:23:01 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id t4sm36544277pax.0.2013.02.12.13.22.58
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 12 Feb 2013 13:23:00 -0800 (PST)
Date: Tue, 12 Feb 2013 22:22:55 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20130212212255.GF3300@jama>
References: <2760168.9kFd94gL1F@helios>
	<CAJTo0LaJNDB6XjK0M4rsS9+z7AZ6K_n0TAX8+7KH2GuAADgCZw@mail.gmail.com>
	<1906630.s5um26QAQj@helios>
	<CAP9ODKrOM9bh-MnzQvU29iVwYdRvw4m7DMYZUcMV=wKYJ5Q4bg@mail.gmail.com>
	<CAJTo0LYFcT5P=p62Nn2kBak33LCfBXQ_KFL-oF2bHFKhguk1rg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYFcT5P=p62Nn2kBak33LCfBXQ_KFL-oF2bHFKhguk1rg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] RFC: meta-oe appends and overlayed recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Feb 2013 21:39:03 -0000
X-Groupsio-MsgNum: 35396
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IvGM3kKqwtniy32b"
Content-Disposition: inline

--IvGM3kKqwtniy32b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 12, 2013 at 08:51:25PM +0000, Burton, Ross wrote:
> On 12 February 2013 16:43, Otavio Salvador <otavio@ossystems.com.br> wrot=
e:
> >> Qt Embedded as we build it is currently configured to use tslib, as is
> >> SDL. If the alternative (evdev?) is supported they could presumably be
> >> switched over though. I don't know how practical that is however.
> >
> > Yes Qt Embedded uses it; not sure evdev is an alternative here.
>=20
> I'd be surprised if QtE doesn't support evdev, but I've been surprised
> a lot recently.  Can you investigate quickly to see if QtE supports
> evdev?
>=20
> As far as X and oe-core is concerned, tslib isn't involve at all
> anymore.  There are xorg-input-tslib drivers in Debian but they've not
> been touched for years, the upstream source URL doesn't exist any
> more, and I'd actually be somewhat surprised if they worked.  Xorg is
> all about evdev + xinput for touchscreens.

Yes, xf86-input-tslib works
http://git.openembedded.org/meta-openembedded/commit/?id=3D506d5f781f5ee93e=
3c9b8ca51a7fb65f40d4a8b8

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--IvGM3kKqwtniy32b
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEasq8ACgkQN1Ujt2V2gBydTgCbB0KlUrkFJKCEotTjphAnjWr1
wqcAn2xN6PLrhcKDvChGgAf/QztGLo0W
=/aN4
-----END PGP SIGNATURE-----

--IvGM3kKqwtniy32b--
