Received: from mail-pa0-f44.google.com ([209.85.220.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U4dJ8-0003Xk-2O
	for openembedded-core@lists.openembedded.org;
	Sun, 10 Feb 2013 21:15:26 +0100
Received: by mail-pa0-f44.google.com with SMTP id kp1so2787857pab.31
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Feb 2013 11:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=XIwpy7UJVvZAAIgLdwYBcubbb5k4KTDmRc6Lsd8XA7I=;
	b=b9yXv7i/2nuClCsotVj3vGADph7sRNfuMihiutOTVHM6rA0+yV/ALVYQCunw0I/37N
	XHMGkHii1kpvPrubsVnwvhG95B5+ok1FMW7N8lI0XT584Rx3a4mQD4Fvvv1xxWHtWudS
	2pjp2kjg2zE60ShUGn7EA7Dcye1tFm4kEujGgXq077Aq41PLY615h6tfAYUWah1hbjAi
	hymjKNbIVK+zLgZjd+J7urBgL1wXStjmol+QP8hWidczJpP1bJL3vAWqzljkajFckhI+
	7hWK3Iowa6URSO6s+5VnuVnwAcW5K9oezIVfDcf4zSLHI5T1XHkd8suRFOMU6pGrWCWX
	bWyw==
X-Received: by 10.68.196.198 with SMTP id io6mr13050203pbc.65.1360526368187;
	Sun, 10 Feb 2013 11:59:28 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id o5sm64461654pay.5.2013.02.10.11.59.25
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 10 Feb 2013 11:59:26 -0800 (PST)
Date: Sun, 10 Feb 2013 20:59:19 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Message-ID: <20130210195919.GA3300@jama>
References: <51079663.60504@topic.nl>
	<20130129094059.GI16904@jama.palm1.palmone.com>
	<5107A295.2060307@topic.nl>
	<CAJTo0LYJ8aza9P0V2X_UszE2yWJjGGacWUstPYeoxF0KcwDYxg@mail.gmail.com>
	<510B73EB.8060907@topic.nl>
	<CAJTo0LbkOMXqZkHd-JAcNKxiOmXTy+TXPEEJ-CkPc1Jx3Ujekg@mail.gmail.com>
	<510BBC3D.1030207@topic.nl> <5116A5DA.90500@topic.nl>
	<CA+chaQfz1S1H4240eArHGYEc8Dh=ghzyLYVm1Eu8JyBWbgWMvA@mail.gmail.com>
	<A551BDF323A45B48ACE6A404AA16A1C4127A434C@TOP-EX01.TOPIC.LOCAL>
MIME-Version: 1.0
In-Reply-To: <A551BDF323A45B48ACE6A404AA16A1C4127A434C@TOP-EX01.TOPIC.LOCAL>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Multiple MACHINE building is broken in OE-core?
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
X-List-Received-Date: Sun, 10 Feb 2013 20:15:26 -0000
X-Groupsio-MsgNum: 35277
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IJpNTDwzlM2Ie8A6"
Content-Disposition: inline

--IJpNTDwzlM2Ie8A6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 10, 2013 at 07:02:10PM +0000, Mike Looijmans wrote:
> This is as far as I get with that:
>=20
> milo@phenom:/media/work/pliqt/openpli-oe-core/build/tmp/sstate-diff/13605=
21554$ bitbake-diffsigs */mips32el-oe-linux/*/*.do_build.sigdata.*Dependenc=
y on task aio-grab.bb.do_package_write was added with hash f5d90bf1c666db00=
3dd2d94ee76336f9
> milo@phenom:/media/work/pliqt/openpli-oe-core/build/tmp/sstate-diff/13605=
21554$ bitbake-diffsigs */mips32el-oe-linux/gcc-runtime/4.7.2-r17.do_build.=
sigdata.*
> milo@phenom:/media/work/pliqt/openpli-oe-core/build/tmp/sstate-diff/13605=
21554$
>=20
> Any tips on interpreting this further?

comparing do_build is not so useful, compare those do_package

> ________________________________
> Van: Martin Jansa [martin.jansa@gmail.com]
> Verzonden: zondag 10 februari 2013 15:55
> Aan: Mike Looijmans
>=20
> use sstate-diff-machines.sh
>=20
> On Sat, Feb 9, 2013 at 8:39 PM, Mike Looijmans <mike.looijmans@topic.nl<m=
ailto:mike.looijmans@topic.nl>> wrote:
> On 02/01/2013 01:59 PM, Mike Looijmans wrote:
> On 02/01/2013 11:29 AM, Burton, Ross wrote:
> On 1 February 2013 07:51, Mike Looijmans <mike.looijmans@topic.nl<mailto:=
mike.looijmans@topic.nl>> wrote:
> A concrete example might help.
>=20
> Would be glad to comply, if you care to explain what you need. What
> should I
> do, which logging to collect (and maybe how)?
>=20
> To start with just the two machines you are changing between and the
> packages/tasks that are re-ran.
>=20
> Well, here's an example of me switching from "vusolo2" to "et9x00" in the=
 current state of OE. I'm migrating this from a year-old or so state of OE-=
core to the present.
>=20
> On the "old" system (not "classic" openembedded, just a much older oe-cor=
e!) switching would result in just immediately building rootfs, and nothing=
 more.
>=20
> Now when I change MACHINE from one to the other, after just having built,=
 it runs hundreds of tasks, and it takes a few minutes to do all that.
>=20
> $ export MACHINE=3Det9x00
> $ bitbake my-image
> $ export MACHINE=3Dvusolo2
> $ bitbake my-image > /tmp/bitbake.log
> $ export MACHINE=3Det9x00
> $ bitbake my-image > /tmp/bitbake.log
>=20
> I've attached the two log files.
>=20
> WHY is it doing all that? None of these packages are machine specific!
> --
> Mike Looijmans - Topic Automation
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org<mailto:Openembedded-core@lists.o=
penembedded.org>
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20
>=20



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--IJpNTDwzlM2Ie8A6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEX/BcACgkQN1Ujt2V2gByEOwCffT3704EZAlRsregh1Ulp+1ns
9L8AniMFMwTKZxcUXNBjvis99IHuuXtD
=mFDK
-----END PGP SIGNATURE-----

--IJpNTDwzlM2Ie8A6--
