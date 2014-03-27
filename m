Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id DB7396F8C7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 18:13:12 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id t10so3230224eei.14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 11:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=BX/6NT6BnFCulOvRuRaHER7pEL6MZOt6/PytOU2wcLo=;
	b=DN7Ao8mP8xoo+60X/rEiAv5hwai6wta1T5zEbtqWH73fWPuv1Vtn9ZHsaz98086a2C
	aIbRPAUxbkw/VNdDagGg0ls9sdHZ3FH7jlF3SYjnXEIuELRwDR8SQ0Goq5BYUxXui+zO
	xK43YO7TuGBLw36cbrreiVm5/IJvymcoi8QpisncIFcFW+hfd5r9Ca3DgyMgkhac8ASQ
	ZXqyI9dFCSMCILmgnktjptmrNs/JnsYkvk8XsxHlYauPGkcoF3muSZekf1CfOCoC22hl
	FVUHFy3lfSDfODZvCnS6cI5+D8IL3PfvQw6+yzmFYI6FEK624XvPBp5uJwDfzyB3Nlc7
	y1fw==
X-Received: by 10.15.44.3 with SMTP id y3mr2205622eev.58.1395943993744;
	Thu, 27 Mar 2014 11:13:13 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o7sm5932256eew.25.2014.03.27.11.13.11 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Mar 2014 11:13:12 -0700 (PDT)
Date: Thu, 27 Mar 2014 19:13:13 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Chris Larson <clarson@kergoth.com>
Message-ID: <20140327181313.GS3709@jama>
References: <cover.1395717014.git.liezhi.yang@windriver.com>
	<5d70928a37ce6dbebf41d42ca1f09d99b272a728.1395717014.git.liezhi.yang@windriver.com>
	<CABcZAN=NYQCRUR-hQR+yZK6L7OSaUj+cFyQu6EbvcqK_5fwZBQ@mail.gmail.com>
	<1395942565.24890.156.camel@ted>
	<CABcZAN=K8Rs2p1fCgkweJgpGEaji+Df-38ng7ZBx5ws4C-opRg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABcZAN=K8Rs2p1fCgkweJgpGEaji+Df-38ng7ZBx5ws4C-opRg@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] base-files: do_install.sigdata: remove the depends on DATE
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
X-List-Received-Date: Thu, 27 Mar 2014 18:13:15 -0000
X-Groupsio-MsgNum: 51719
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dQ2XShfnd5GHxhN7"
Content-Disposition: inline

--dQ2XShfnd5GHxhN7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2014 at 10:53:20AM -0700, Chris Larson wrote:
> On Thu, Mar 27, 2014 at 10:49 AM, Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
>=20
> > On Thu, 2014-03-27 at 10:21 -0700, Chris Larson wrote:
> > >
> > > On Mon, Mar 24, 2014 at 8:10 PM, Robert Yang
> > > <liezhi.yang@windriver.com> wrote:
> > >         If we run "bitbake -S base-files" today, and re-run it
> > >         tomorrow with
> > >         nothing changed, we would see that the do_install.sigdata
> > >         changes
> > >         because of:
> > >
> > >         do_intall -> do_install_basefilesissue -> DISTRO_VERSION ->
> > >         DATE
> > >
> > >         We had set:
> > >         IMAGE_NAME[vardepsexclude] +=3D "DATETIME"
> > >         in meta/conf/bitbake.conf, we can set a similar line in
> > >         base-files_3.0.14.bb to fix the problem.
> > >
> > >         [YOCTO #6032]
> > >
> > >         Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> > >
> > > Wont't this mean base-files wouldn't be rebuilt when the day changes?
> > > This seems problematic to me. I think this is a legitimate case for a
> > > checksum change. If the distro version changes due to the date
> > > changing, and the base-files includes the distro version in the issue
> > > file, then we'd *want* base-files to rebuild to ensure the issue file
> > > is correct, otherwise it'd be inaccurate, no?
> > >
> > I'm torn on this. Package feed creators probably don't want a package
> > feed where the package changes daily but I can see this from both sides,
> > I have often wondered why my build was rebuilding base-files...
>=20
>=20
> Perhaps we should either not use DATE/TIME in the distro version at all, =
or
> have a variable which is the current date, and a variable which locks to
> the date of the creation of the TMPDIR but doesn't change after that, or
> something, as a more persistent build environment identifier to use for
> such cases. *shrug*

I think that the DATE specific part should be moved to separate recipe
which will clearly indicate it's just "build version".

I'm using shr-version recipe which just puts file in sysconfdir so it's
not so surprising to see shr-version recipe being rebuilt everyday and I
still know when the user last updated from feed.

It's also useful to pull such recipe into image by IMAGE_INSTALL not
through packagegroup (as otherwise the packagegroup could be rebuilt
every day as well - at least until runtime deps for packagegroups were
excluded in signature handler).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--dQ2XShfnd5GHxhN7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlM0ajkACgkQN1Ujt2V2gBxNSwCgoFysL+tuZouLjcKr1wLW8g3K
swoAn1jkoFUHaC9BAnuNeFsYqn+0Q2C0
=IZrs
-----END PGP SIGNATURE-----

--dQ2XShfnd5GHxhN7--
