Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id BCE596AB67;
	Thu, 25 Jul 2013 20:27:18 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id e53so1167532eek.40
	for <multiple recipients>; Thu, 25 Jul 2013 13:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=bE+SLvaTZe4qHk3mlT4xCoZYaVf/NXz6qccYAOp5B0M=;
	b=oM7oiqz91MOqJVCSUhg+MwahaNRdb7TTdqYf+77/IGl5QqSFBwFv3J6Mu53KQ1D0gy
	gJpOcXY5h4vKkex854KSFXUqIUZf/z20wzDwCitk+Jnb8snKkB90d+iQL5Rq6zVRU005
	X9D+iH0xaxJUFeEIIVrL8cdn1C05gYVR64tHKpEdY9WogK+Zm7XyNBd08r+H0MlDQecJ
	H+5cqKRodwt7/cUnT+aKAar5aA4AK7LeRNl/Cg6ZbA2LC7tLHazs1PBafsPOkScE0cak
	wDl+Qft8y5jsGSVm3W+m2fMfGYfd4YVSUSZVgzX0jr7cAAhcIRvAQXMVt95QUvOwtKD7
	L5TQ==
X-Received: by 10.15.24.9 with SMTP id i9mr44028790eeu.28.1374784038882;
	Thu, 25 Jul 2013 13:27:18 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n42sm76017103eeh.15.2013.07.25.13.27.17 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 25 Jul 2013 13:27:18 -0700 (PDT)
Date: Thu, 25 Jul 2013 22:27:43 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <20130725202743.GB3280@jama>
References: <51F18346.2@windriver.com>
MIME-Version: 1.0
In-Reply-To: <51F18346.2@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: koen@dominion.thruhere.net, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: Add lua to oe-core.
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
X-List-Received-Date: Thu, 25 Jul 2013 20:27:19 -0000
X-Groupsio-MsgNum: 42472
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3uo+9/B/ebqu+fSQ"
Content-Disposition: inline

--3uo+9/B/ebqu+fSQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2013 at 03:57:58PM -0400, Randy MacLeod wrote:
>=20
> I've found that many projects use the lua scripting language.
> I'd like to move it from meta-oe to oe-core:
>=20
> =20
> http://cgit.openembedded.org/cgit.cgi/meta-openembedded/tree/meta-oe/reci=
pes-devtools/lua/lua5.1_5.1.5.bb?h=3Dmaster
>=20
> http://www.lua.org/about.html
>=20
> lua-5.2.2 is current, see: http://www.lua.org/download.html
> so we'd likely uprev and send that version.
>=20
> rpm and lighttpd could (would?) optionally depend on lua.
>=20
> oe-core.git $ grep -r lua * | egrep -v 'valuat|valuable|uargp|rpm'
> meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb:
>               --without-lua \
>=20
> Any comments pro or con before we do the uprev, testing and send
> a commit?

2 recipes which would optionally depend on it doesn't make it good
"core" component IMHO.

But uprev, few PACKAGECONFIGs and more testing would be nice.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--3uo+9/B/ebqu+fSQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHxij8ACgkQN1Ujt2V2gBxCTACgmyRJXKH7GIxgHmmMj+0XnSHj
YOwAnjeQyVRvF7XQ2iCe5YXarJ0BJ1LB
=iQvR
-----END PGP SIGNATURE-----

--3uo+9/B/ebqu+fSQ--
