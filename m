Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SzUgM-0003Lt-TD
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Aug 2012 17:29:54 +0200
Received: by bkcik5 with SMTP id ik5so194905bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Aug 2012 08:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=F0zIKgjUOurmnoYBGYmqaYSeXoZ4wsc/F5a8lTOnQn4=;
	b=XDOE9Fx8QKo1P14ZNRbX7ixBDbmc3IdlTVpYiYXE8sdRofHeI7oARb3faaITiH+1or
	zMbRoPcIKM9tOHqe1FJZKwaiFW5IdIs4UaENx4qeUqyS/8hFEz3rX4hn4PkKZS3epkD8
	8oVL4KZcnXJxg/YqwYK1+d/0bSFbtQeSf9p9PWjIK3Pvdnq3Uybq5jiNepjlI6k1MOwm
	dDkZCq5d4a/vp0jLalCvVPSAlHOkdlzliF9TfAwZ6LhYPMc+/fzBy+fDbPQ03iM9s1aq
	riOmQUUP56n9abjs2bcfDEC3MnF/h5fC+ZIio0zLIo2UokZD9aYJJ63w5jLahXMo5XOn
	psdg==
Received: by 10.204.129.27 with SMTP id m27mr9436116bks.115.1344525486526;
	Thu, 09 Aug 2012 08:18:06 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 14sm830386bkw.15.2012.08.09.08.18.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 09 Aug 2012 08:18:05 -0700 (PDT)
Date: Thu, 9 Aug 2012 17:18:05 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120809151805.GE3273@jama.jama.net>
References: <CAJTo0LZn3md_x3a9-+LV67FYopkXaPgFv8-+U4JEj7UzwSYd9Q@mail.gmail.com>
	<5995DE95-9135-4B8E-82BA-F0938B2D755F@dominion.thruhere.net>
	<1344428588.9756.333.camel@ted>
	<20120808123637.GA2854@jama.jama.net>
	<1344430098.9756.342.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1344430098.9756.342.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Replacing Web in Sato with Midori
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
X-List-Received-Date: Thu, 09 Aug 2012 15:29:55 -0000
X-Groupsio-MsgNum: 27244
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LTeJQqWS0MN7I/qa"
Content-Disposition: inline

--LTeJQqWS0MN7I/qa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 08, 2012 at 01:48:18PM +0100, Richard Purdie wrote:
> On Wed, 2012-08-08 at 14:36 +0200, Martin Jansa wrote:
> > On Wed, Aug 08, 2012 at 01:23:08PM +0100, Richard Purdie wrote:
> > > On Wed, 2012-08-08 at 12:01 +0200, Koen Kooi wrote:
> > > > Op 8 aug. 2012, om 10:41 heeft "Burton, Ross" <ross.burton@intel.co=
m> het volgende geschreven:
> > > >=20
> > > > > Hi,
> > > > >=20
> > > > > As everyone who's used it can attest, Web (the optional browser in
> > > > > Sato) is pretty rough.  Part of my plans about replacing Sato wit=
h a
> > > > > leaner environment involves replacing it with Midori, and if there
> > > > > isn't any disagreements I'll work on a submission to merge Midori=
 into
> > > > > Sato now for everyone who expects the Sato web browser to be usef=
ul.
> > > > >=20
> > > > > This will involve pulling a few projects from meta-oe to oe-core:
> > > > > ca-certificates, python-docutils and vala specifically (although =
its
> > > > > possible that we can drop the vala dependency).
> > > >=20
> > > > Adding more stuff to oe-core is a bad idea. You should take this
> > > > opportunity to split all the sato stuff into its own layer.
> > >=20
> > > I feel very strongly that having a core layer with no way of
> > > demonstrating and testing it is a very bad idea. I haven't changed my
> > > mind about this and am very unlikely to. "How do you know it works?" =
is
> > > the question you ask about package upgrades for example.
> >=20
> > And does it need to be in the same layer?
> >=20
> > Why not test webkit-gtk from oe-core with midori from meta-oe layer?=20
> > Or meta-browser layer if meta-oe is too big for testing webkit-gtk.
>=20
> It needs to be in the same layer. The logistics of including sections of
> meta-oe or meta-browser on the autobuilder whilst trying to test things
> like "bitbake world" is not somewhere I want to go. The Yocto Project
> does not have the manpower at this point in time to increase test
> coverage to include meta-browser or meta-oe. If someone gives me access
> to a large team of engineers...

at least with webkit-efl/eve I usually see more issues in runtime then
build, so testing that "bitbake world" still builds something is very
far from "test coverage" for end users.

And to build only midori with meta-oe in another workspace with meta-oe
included (where you don't need to run "bitbake world") doesn't demand so
much more manpower. And someone should start midori probably in
some qemu* machine and try at least one http:// and https:// page to say=20
that webkit-gtk is test covered.

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--LTeJQqWS0MN7I/qa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAj1K0ACgkQN1Ujt2V2gByOmQCeOuSxYLJyRYQx2BykKnJjRHaP
eeoAoImz1awb17b6MI80xr9OExtd8eFc
=+HBG
-----END PGP SIGNATURE-----

--LTeJQqWS0MN7I/qa--
