Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TZ344-0004SC-8U
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Nov 2012 18:17:20 +0100
Received: by mail-bk0-f47.google.com with SMTP id jk7so796924bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2012 09:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=6e46OCcJWN2iiocG6e1YQ0AVVw6rPi+HlwGow2ryoBw=;
	b=NQepgfAePqQRL0ZdxysaSLFyIQOX33FTd7yALWUcHD2sLa79KQrwjpMWFsDuFH61dg
	8D2/0vn5yU3BiV9Hhf0nYkp59wCWSuRnny/LeRFyo7PUwPM73ZboPmYoRnS1g+l6KtH3
	P1q+1nQRGGWs3zGdMIt/wtZObGssy5o3gPr6tRRDoH8jyAF0KQodRP/x5oBDk9EV3huC
	D8RGcjWXGP4ZIlod9IAnShdtisdHHw5JBrfkTn4IHLiLQP81DqA/tgtPzTBfDoUwSbf2
	Zc/TEezQvIYAkScaVl34S1owFbxj8sQTpIBUcw19MTvEuo1JQUqhMCzm7nNwCS4fccGl
	8Jxw==
Received: by 10.205.139.16 with SMTP id iu16mr721431bkc.88.1352999003311;
	Thu, 15 Nov 2012 09:03:23 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n27sm10882746bkw.0.2012.11.15.09.03.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Nov 2012 09:03:21 -0800 (PST)
Date: Thu, 15 Nov 2012 18:03:40 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20121115170340.GD17521@jama.jama.net>
References: <1351077301-7744-1-git-send-email-Martin.Jansa@gmail.com>
	<CABcZAN=W_E+Qtox5XF7nBcMY9tN4vCCA51vcy=Hx1GDVGMwVbQ@mail.gmail.com>
	<20121115161907.GC17521@jama.jama.net> <2167600.lqqak59AbM@helios>
MIME-Version: 1.0
In-Reply-To: <2167600.lqqak59AbM@helios>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Chris Larson <clarson@kergoth.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv4] scripts/sstate-sysroot-cruft.sh: add simple script to find files in sysroots not tracked by sstate
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
X-List-Received-Date: Thu, 15 Nov 2012 17:17:20 -0000
X-Groupsio-MsgNum: 31429
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iVCmgExH7+hIHJ1A"
Content-Disposition: inline

--iVCmgExH7+hIHJ1A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 15, 2012 at 04:49:01PM +0000, Paul Eggleton wrote:
> On Thursday 15 November 2012 17:19:07 Martin Jansa wrote:
> > I didn't want to use bitbake -e, so that this script can be executed
> > when some other bitbake process is running.
>=20
> You really should not be trying to touch anything under TMPDIR let alone=
=20
> sstate files while bitbake is actually running against that same director=
y. I'm=20
> not sure why you would want to though...

While running builds for 8 MACHINEs in for loop I find it usefull to
test one sysroot (from 1st MACHINE already built) while keeping
build for remaining machines running for rest of night and sometimes
following days..

At least that was my use-case when I wrote this script..

Yes I could have execute build only for 1st machine, wait till it's
finished, then run script wait till it's finished and then start for
loop for remainig 7, but that does not allow me to fall asleep while
it's still building 1st :) or I have to plan it in advance and build
with much longer one-liner.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--iVCmgExH7+hIHJ1A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlClIGwACgkQN1Ujt2V2gByj8wCfZqMoYmbQx8sF8vuodd9nCPiZ
BJgAoI3O6+pn0RF7FPHIPLvK6x8NozFI
=L2uE
-----END PGP SIGNATURE-----

--iVCmgExH7+hIHJ1A--
