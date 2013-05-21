Return-Path: <martin.jansa@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 594D060655;
	Tue, 21 May 2013 21:45:43 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id fb10so1136135pad.9
	for <multiple recipients>; Tue, 21 May 2013 14:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=kQHI92+sphrqCxffe6Rabq1czmeAgkE/uhn8dJRBoro=;
	b=ed0uNaOn+lLY62Wr8371B8CJ+0/wiMepRdJ2B3/jwx0CzmsqwZoTMPybMjfByFD9/i
	LFXBWOqle4Im7H0z/5dOsXR0JXJDeIs4Fcg5/hEtmiCRpTMNXvSVafd2lffhhhs4ipk5
	jYqrf0waonWtYPDDRmBUbUkpOYPUZCJwob/VNcfwaZD1MecT7PqarG2bWfpezz+Ywa0X
	CirVkS4D1eeYOAlqOELJWoWoCVBJLVE1dw1txNG7Pg3+SwTGF0vj8IezJcxwu0slhjCN
	MdNCNc297/BD18gQRN6ZAv2X6ihcVmDuNvNRAWJfrBmY2RLc8p0za78hUwkIUloWd/mc
	q8/A==
X-Received: by 10.68.90.197 with SMTP id by5mr4596876pbb.196.1369172744770;
	Tue, 21 May 2013 14:45:44 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	tq8sm4176552pbc.30.2013.05.21.14.45.42 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 21 May 2013 14:45:44 -0700 (PDT)
Date: Tue, 21 May 2013 23:45:39 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Message-ID: <20130521214539.GF32431@jama>
References: <CA+YB3rYf0Tt181v+zAqCwjKk74uP88Zoaht_+FMuS7ee2tJRfQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+YB3rYf0Tt181v+zAqCwjKk74uP88Zoaht_+FMuS7ee2tJRfQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: OE TSC Minutes 7 May 2013
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
X-List-Received-Date: Tue, 21 May 2013 21:45:43 -0000
X-Groupsio-MsgNum: 39554
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fwqqG+mf3f7vyBCB"
Content-Disposition: inline

--fwqqG+mf3f7vyBCB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 21, 2013 at 12:36:54PM -0700, Jeff Osier-Mixon wrote:
> TSC could chair it but make it a public IRC thing
> -> proposal: monthly IRC meeting to replace one of the bi-weekly TSC
> meetings, open to all
>  timezone will be an issue
> =3D> think about for next meeting

I really like this idea, I think it will improve situation with:
status updates - people can watch it immediately on IRC, instead=20
  of waiting for minutes
lack of community input - easier for people to comment on issues or add
  to agenda when they see discussion about related topic
community involvement - seeing some AR discussed a month ago is too late
  to volunteer

> f. python 3
> hard to support both py2 and 3
> two issues: python3 on target, using p3 for bitbake
> don't think we can reasonably support both
> make the switch in the 1.5 timeframe?
> need to start informing people of it -now-..

p3-only looks good to me, I would be happy to help testing this and then
drop p2 from my minimalistic chroot. There are also some external tools
like opkg-utils (IIRC this one is 99% p3 compatible now, I can take care
of remaining).

> (9:32:11 AM) RP: For 3a, I'd agreed to provide status updates. I've
> now provided two of these
> (9:32:24 AM) Jefro: wiki page is not yet done
> (9:32:27 AM) RP: I'm trying to turn it into a habit
> (9:32:50 AM) RP: Did people like/dislike them?

I like them.

> (9:36:03 AM) bluelightning: it's worth noting I'm aware that some
> people have migrated recipes and then kept them in their own layers
> (9:36:35 AM) bluelightning: which is not hugely bad but it would be
> nice if they could send them somewhere more appropriate
> (9:36:59 AM) RP: bluelightning: any idea why they're doing that?
> Simply don't know any different?

For many recipes I've used meta-shr as "staging" area to test it on more
builders and probably by more people before moving them to meta-oe.

But it's also easy to forget them in "staging" area, when they just
work for me (as I have meta-shr always included) and nobody shows any=20
interest in them.

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--fwqqG+mf3f7vyBCB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGb6wIACgkQN1Ujt2V2gBy0RwCgqbF2yoV9+VA8c+CZYBP6+smz
V7UAn3D933Hcw7EVzwA6zhbOnJZAoR9k
=ejGf
-----END PGP SIGNATURE-----

--fwqqG+mf3f7vyBCB--
