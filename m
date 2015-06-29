Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 1589960670
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 11:23:02 +0000 (UTC)
Received: by wguu7 with SMTP id u7so138552911wgu.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 04:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=IQ5S7x5c+r/vik+ZzUzWE/sTnidUfV0+B42aBzIFvjI=;
	b=dRJb8Io8bew/jXIqZ69i8cVeODsK6dxio84tmxH0QspfkGKdfUuIaDcm0NLykYgB3r
	8usMuaBmIuyvuYejNS6ywPWHShTs72ZyjC1BWiWUe8cs5xcig/PHoUFySa99OAtsC8Su
	KiDs7axlCeVOUoVBg3p/Pw353xCzJAAoW93xIESMUNfvGTsIJuVePLjjgPJmqf5i08uA
	BRsc47uIU4yLsMbiiYwaREndLwda0d7B3F/gaJSB+f+GPGTz1AUobjTfzrCM7sIitGTy
	tjZQrVVuLds3NPWIkET6z2BsnbrnkIjF2TqcVvFARh/tIeZJo714Zmw6aLaSjUGyvy0D
	zY9g==
X-Received: by 10.194.81.169 with SMTP id b9mr26482744wjy.126.1435576983064;
	Mon, 29 Jun 2015 04:23:03 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id ev8sm47277910wjb.8.2015.06.29.04.23.02
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Jun 2015 04:23:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 29 Jun 2015 13:23:08 +0200
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20150629112308.GC2393@jama>
References: <cover.1433349512.git.raj.khem@gmail.com>
	<0d3de82d935f6408e5c04ff980a2b3fd4a9e4ac3.1433349512.git.raj.khem@gmail.com>
	<CAHiDW_GjW0PSnNRGekiYkg+qdhg=xbbmiVhWY95cv6GxQPJ1Bw@mail.gmail.com>
	<5E0378F8-62E0-4A7F-AB07-0209CD229BF3@gmail.com>
	<CAJTo0Lb0S_b4Wnb0dWmVae9Ezmn=dB0G2=DFyEjD2nivoa6Jfw@mail.gmail.com>
	<AB12494C-E7B7-4FD0-B3E2-72E5E91F3714@gmail.com>
MIME-Version: 1.0
In-Reply-To: <AB12494C-E7B7-4FD0-B3E2-72E5E91F3714@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] wayland/weston/libinput: Upgrade to 1.6.0 -> 1.8.0
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
X-List-Received-Date: Mon, 29 Jun 2015 11:23:03 -0000
X-Groupsio-MsgNum: 67275
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2JFBq9zoW8cOFH7v"
Content-Disposition: inline

--2JFBq9zoW8cOFH7v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2015 at 08:19:58AM -0700, Khem Raj wrote:
>=20
> > On Jun 26, 2015, at 7:47 AM, Burton, Ross <ross.burton@intel.com> wrote:
> >=20
> >=20
> > On 3 June 2015 at 22:21, Khem Raj <raj.khem@gmail.com <mailto:raj.khem@=
gmail.com>> wrote:
> > > Can you explain why? The revision looks like 0.16.0 release.
> >=20
> > its easy to develop libinput and prepare/test upstream patches since al=
l upstreams want the patches against their latest master and its easy to sw=
itch to AUTOREV locally and do it.
> >=20
> > That's not a great reason and I'm against using git fetches when there'=
s perfectly good tarballs available.
> >=20
>=20
> From a system integrators point of view, I agree with your sentiments. Fr=
om a developers point of view not so much. We already have many recipes alr=
eady fetching from git and more and more switching to use it see qt5 lately=
, there are perfectly fine tarballs released for QT5 too, just because its =
simpler to developer and integrate packages.

I partially agree, but qt5 example is a bit different, because we have
many local patches for qt5 (qtbase, qtdeclarative) even more in various
deployment layers and we had 2 sets of recipes and patches (for tarballs
and for git recipes) - from that I choose less evil option of git
recipes to make the maintenance/testing a bit easier.

So for simple projects with only a few or no patches in metadata I don't
mind using git fetches, but also don't see huge benefit of using them.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--2JFBq9zoW8cOFH7v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlWRKpsACgkQN1Ujt2V2gBwvuACglJEWdsBRg1ZGVqdFcx8QdW8I
4EEAoKmQCE8y33W0Ptsl7BPsDK2c31MU
=gtuQ
-----END PGP SIGNATURE-----

--2JFBq9zoW8cOFH7v--
