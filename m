Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SkL9J-00044f-Ee
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jun 2012 22:17:09 +0200
Received: by wibhq4 with SMTP id hq4so413509wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2012 13:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ORell1+HvmqYCbT4bZOXuzBVbENFpF3RC/87sa9fT/I=;
	b=sm3524Yn/w7uwG+avyJgJ3bQkNU8baGNHyIT+uKLCj6yOuuHycPeKwaHSyeXNooZUh
	4Pi8IgMiw3OFpCZnXG8fDx14Ykz92Vtm8r1TKmE6lQDWGLCs1nD1URU4d1ypBp2ePCAM
	ycKqFBXOs+fcY64kaAZSidHujXNtZx7623czpRUAYXZkkJJWCDWVoigsBDZm3gYSqlDh
	te42s3Vke2TqlhgkfqfUp+WsFEyaOdG3VN2WllhAmqNhTbw1+iK2iIop7PXthwjBsW2s
	PZkqm7PpQCU0COMQDQ5zhLovkuM9Gz/ZFcEY9nxToG9Oqx2AI2slI5ecQNogqsPiyr10
	q/nw==
Received: by 10.180.97.201 with SMTP id ec9mr2673267wib.12.1340913974098;
	Thu, 28 Jun 2012 13:06:14 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id dg2sm1125096wib.4.2012.06.28.13.06.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Jun 2012 13:06:13 -0700 (PDT)
Date: Thu, 28 Jun 2012 22:06:07 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120628200607.GA3961@jama.jama.net>
References: <20120530110534.15D7110219@opal>
	<20120628191246.GA5532@localhost.jama.net>
	<4FECB3E0.1080503@windriver.com>
MIME-Version: 1.0
In-Reply-To: <4FECB3E0.1080503@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [oe-commits] Mark Hatle : util-linux: use new update-alternatives
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
X-List-Received-Date: Thu, 28 Jun 2012 20:17:09 -0000
X-Groupsio-MsgNum: 24263
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9amGYk9869ThD9tj"
Content-Disposition: inline

--9amGYk9869ThD9tj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 28, 2012 at 02:43:28PM -0500, Mark Hatle wrote:
> On 6/28/12 2:12 PM, Martin Jansa wrote:
> > On Wed, May 30, 2012 at 11:05:32AM +0000, git@git.openembedded.org wrot=
e:
> >> Module: openembedded-core.git
> >> Branch: master
> >> Commit: 55c01de28a28a4cfe16d36663c190a874ef2e85d
> >> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcom=
mit;h=3D55c01de28a28a4cfe16d36663c190a874ef2e85d
> >>
> >> Author: Mark Hatle <mark.hatle@windriver.com>
> >> Date:   Mon May 21 12:42:34 2012 -0500
> >>
> >> util-linux: use new update-alternatives
> >>
> >> In addition to switching to the new update-alternatives, it was discov=
ered
> >> that the sln, shutdown, halt, reboot and related commands were never g=
enerated.
> >> Remove these from the list.  (These appear to have been removed from u=
til-linux
> >> some time ago.)
> >>
> >> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> >
> > This seems to break u-a for reset while upgrading from older image:
> >
> > update-alternatives: Error: cannot register alternative reset to
> > /bin/reset since it is already registered to /usr/bin/reset
>=20
> Can you figure out what registered it as /usr/bin/reset?  As far as I'm a=
ware=20
> the reset command should be in /bin...  (Sounds like this may simply be a=
n=20
> ordering thing.)

seems like busybox did..

SHR root@Nokia-N900 / $ cat /var/lib/opkg/alternatives/reset=20
/usr/bin/reset
=2E./../bin/busybox 50

Cheers,

>=20
> --Mark
>=20
> > anyone seen it too?
> >
> > Cheers,
> >
> >>
> >> ---
> >>
> >>   meta/recipes-core/util-linux/util-linux.inc       |  212 +++++------=
----------
> >>   meta/recipes-core/util-linux/util-linux_2.21.1.bb |    2 +-
> >>   2 files changed, 45 insertions(+), 169 deletions(-)
> >>
> >> Diff:   http://git.openembedded.org/?p=3Dopenembedded-core.git/?a=3Dco=
mmitdiff;h=3D55c01de28a28a4cfe16d36663c190a874ef2e85d
> >>
> >> _______________________________________________
> >> Openembedded-commits mailing list
> >> Openembedded-commits@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commi=
ts
> >
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--9amGYk9869ThD9tj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/suS8ACgkQN1Ujt2V2gBw5RwCeLl7i7c6ZtEV4Mp7D0Wr/6Kb1
A78AnAutO0zPS/je30lJ/9CjNdrYODxg
=GfP6
-----END PGP SIGNATURE-----

--9amGYk9869ThD9tj--
