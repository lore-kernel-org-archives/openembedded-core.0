Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sot8F-0002Ur-4G
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jul 2012 11:22:51 +0200
Received: by bkcik5 with SMTP id ik5so628984bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 02:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=yOfAy/xUXkz3klCAA+pmh5K+JU/muoQ7YRXLpRbGk5k=;
	b=qA09wIjVPKnd4qe35F7J1Jp5mJVSUa4tkyVUL7jlYIb+YjFuU+fb2+3Vh5BEbFIbE8
	YM8DC6c8lGrXusjji0WNE9lopMBhKDRmc6nUO42xK+q5wlzWLoNvdgI8qd+lygD51fsA
	SvLyEuLSjjhszyM/RoTqw6Nhu2m68PNp9eiJrOXzNm7Q8njWz2ovdgOwQoo+v0eQSpWu
	K21WrZ33DNGvj5+7zbCZeROBPuk6kEP697cMrZiLCG8rkOlmtbr3y/FODmY4oegBRZ1D
	P1ZLTvyFq+lFn3qddS5NHjaD+wkvthym0wUBmbtzRHh482d6SnfzuD9ecjnBUt60E9Dv
	ykbg==
Received: by 10.205.132.12 with SMTP id hs12mr15855815bkc.47.1341997899473;
	Wed, 11 Jul 2012 02:11:39 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id hs2sm595861bkc.1.2012.07.11.02.11.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 Jul 2012 02:11:38 -0700 (PDT)
Date: Wed, 11 Jul 2012 11:11:37 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120711091137.GA4190@jama.jama.net>
References: <9403579097d0430a5ce2cd3bb23925fe25917a0b.1341932186.git.andrei@gherzan.ro>
	<d7e0c2813e4002b9dfd8e2d681b93da9ddc5870f.1341932186.git.andrei@gherzan.ro>
	<1341936154.1294.3.camel@ted>
	<CAK18fxFDoHEpzDnVwJLdPHKL48Qo7ZuwnJsQDE78U6fbcULjKw@mail.gmail.com>
	<CAK18fxH2w_0hSQscbm6sad-a+=kk2eyQkOtJLMnsZRe8jaf8KA@mail.gmail.com>
	<1341960238.2786.103.camel@x121e.pbcl.net>
MIME-Version: 1.0
In-Reply-To: <1341960238.2786.103.camel@x121e.pbcl.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 5/5] busybox.inc: Install hwclock init script only if rtc is present in MACHINE_FEATURES
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
X-List-Received-Date: Wed, 11 Jul 2012 09:22:51 -0000
X-Groupsio-MsgNum: 25163
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="liOOAslEiF7prFVr"
Content-Disposition: inline

--liOOAslEiF7prFVr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 10, 2012 at 11:43:58PM +0100, Phil Blundell wrote:
> On Wed, 2012-07-11 at 01:15 +0300, Andrei Gherzan wrote:
> > And to move a little further, busybox should be configured with
> > CONFIG_HWCLOCK=3Dy only if it makes sense for that MACHINE. In my
> > opinion this is machine specific.=20
>=20
> That's a DISTRO decision.  I suspect most that have binary feeds would
> prefer to have a single busybox binary per architecture, and accept the
> few wasted bytes on machines without RTC, than to make it MACHINE
> specific and end up building it multiple times.

Agreed.

It would be better to package initscript + hwclock to separate packages
and then pull it to image only for machines with RTC.. but not making
whole busybox machine specific.

Another advantage of this would be option to use busybox-hwclock as utility
and hwclock-systemd instead of busybox-hwclock-init for images which are
using systemd.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--liOOAslEiF7prFVr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/9Q0kACgkQN1Ujt2V2gBzNdACfRLXPg7jEtVZ6RUaAICqAVmYj
nuQAn1dzrF4HJZwgL167cY52HaOcuhAU
=W3l9
-----END PGP SIGNATURE-----

--liOOAslEiF7prFVr--
