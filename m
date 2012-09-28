Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1THf66-0008Gm-0P
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 20:15:34 +0200
Received: by wibhj13 with SMTP id hj13so111989wib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2012 11:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=QHDOSpVFS30gK9n1HygA+tX49w1qLIrsGj7C1eUfQ2g=;
	b=TZZtde5w5qq9oPAyTbfo9J8w0Tx8OeYt0lSaszDK/MHoA9cPm1Sw9lRY1dT41luosu
	G9zWR/xPt3j612EG2zHU9hEqfzRiAaWe6oHSPaZPSmDIVZVR3m00uj/jTBVIe+LPRybu
	9bK/5hVA9eufiQLYz+B0KUdOGeW907a6LjySPpeAbWi2x7uGfCSD+j5BYTj7PC+7Lisy
	orFJH+m9LXTn/Y0SgqnU77zOLsN0ND/BG/e9uch+AyTtaFP3Rsj4amcmWDyF2uX6zrrb
	7x1X8t54Hp8K2f65NtPPMsp0Dtq4UNdVqZ0nuFeJZggjC60zLKtHmoUT93xyffyK+LHP
	no8g==
Received: by 10.180.75.67 with SMTP id a3mr5352579wiw.1.1348855360665;
	Fri, 28 Sep 2012 11:02:40 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id cw4sm629429wib.4.2012.09.28.11.02.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 28 Sep 2012 11:02:39 -0700 (PDT)
Date: Fri, 28 Sep 2012 20:02:51 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20120928180251.GB3049@jama.jama.net>
References: <1348782166.15753.28.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1348782166.15753.28.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: OE-Core Release Status
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
X-List-Received-Date: Fri, 28 Sep 2012 18:15:34 -0000
X-Groupsio-MsgNum: 30118
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gatW/ieO32f1wygP"
Content-Disposition: inline

--gatW/ieO32f1wygP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 27, 2012 at 10:42:46PM +0100, Richard Purdie wrote:
> We're now at -rc2 for the October release of OE-Core. I've noticed a
> sudden surge of patches on the list, several of which are things like
> version increments which are no longer really appropriate at this point
> in the release cycle.
>=20
> Why haven't we branched?
>=20
> The plus side of branching now would be continued patches into master.
> The downside is that QA and autobuilder resources are concentrating on
> release and hence not on ensuring regressions are being added. I also
> really need my energy focused on the release rather than reviewing other
> code. I'm out of bandwidth so I'm putting off branching.
>=20
> There is also the risk that if we branch, people will continue with
> master development and ignore the release branch and I'd like to apply a
> little pressure against this.
>=20
> So if patches are getting ignored its likely they've been deemed not
> suited to the state of the tree right now. I may start to queue things
> on master-next but no guarantees and I would ask people to try and help
> make the release a good one.
>=20
> If there are patches being ignored you think do qualify for -rcX, please
> ping me as it is hard to keep track of everything.

I don't know what to do with tune* and qt patchset.

This one is not important, but if you like the idea then it would be
better to get it in this release already:
[PATCH] kernel.bbclass: include PE in KERNEL_IMAGE_BASE_NAME

And I have 2 patches to remove time dependent variables from images
which I haven't sent to ML yet, because still testing if it has some bad
sideeffect and if it's enough to resolve the issue I was seeing.
I'll send them as RFC.

commit 9c65f68dc380be34f06c4677d6867bbb874a75d1
Author: Martin Jansa <Martin.Jansa@gmail.com>
Date:   Wed Sep 26 15:56:05 2012 +0200

    bitbake.conf: exclude DATETIME var dependency from IMAGE_NAME
   =20
    * resolves ERROR shown when bitbake -S is used for image:
      ERROR: Bitbake's cached basehash does not match the one we just gener=
ated
      (/OE/oe-core/openembedded-core/meta/recipes-core/images/core-image-mi=
nimal.bb.do_rootfs)!
      ERROR: The mismatched hashes were 8c35cdf8a5d09c03941f081dd9f6d8dc an=
d b5d6e2e5952770557c48c5779ddb73fc
   =20
    Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

commit 7173532f91a755911e4822a103c98e7b81b18cb6
Author: Martin Jansa <Martin.Jansa@gmail.com>
Date:   Wed Sep 26 00:57:21 2012 +0200

    rootfs_*.bbclass: exclude BUILDNAME var dependency from do_rootfs
   =20
    * I have kernel recipe which depends on other recipe to build tiny init=
ramfs
      image, without this change it rebuilds not only that initramfs image
      but also whole kernel when DATE or TIME is changed and OEBasicHash en=
abled
    * also resolves ERROR shown when bitbake -S is used for image:
      ERROR: Bitbake's cached basehash does not match the one we just gener=
ated
      (/OE/oe-core/openembedded-core/meta/recipes-core/images/core-image-mi=
nimal.bb.do_rootfs)!
      ERROR: The mismatched hashes were 8c35cdf8a5d09c03941f081dd9f6d8dc an=
d b5d6e2e5952770557c48c5779ddb73fc
   =20
    Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--gatW/ieO32f1wygP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBl5ksACgkQN1Ujt2V2gBw1dgCgk17Lw4YYWFuqdSoqbAiW+Vl+
rqsAoIOY6nPfyih02HLYVurJgfqS+Sw+
=Y8TM
-----END PGP SIGNATURE-----

--gatW/ieO32f1wygP--
