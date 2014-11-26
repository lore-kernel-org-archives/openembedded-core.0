Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 1B87E72317
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Nov 2014 15:17:06 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id l15so5337716wiw.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Nov 2014 07:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=JXijKE6FBTfVvCI7Eq2tDn6ccswQh0+hTZmyinhSJHY=;
	b=FbXEGJDdh5IOfhMvrjl0TZAce1V2R06AmYA3SonljR3zVa5Qker/X6hzg7lr8q4PJl
	QTldtoT4Zb8OcSrtU+T9TeU2SD1D0Ot/5PWkLjrkmUKikdU9Jt0HoKSHKWbYExWkAGgG
	t+DTq3TwaqYFqNBiFBXcPsSq5nVx6aJu7Fnj2kySYMiid4ZKhNc6ph5zMNqYZr+wFBKP
	sQUe7qHjg6IkVYRzXenr7P4cERuiIZOzQmKr2KEBaCsS205JEsndaG6lGiOqk1tS/AgG
	FBy/z84I5VzphnaBUT+8XWJYN5Un6aQxvyrj/tgdkYUYRtpiTKrRO45INjIACJHclRMW
	KLdg==
X-Received: by 10.180.37.142 with SMTP id y14mr6458323wij.47.1417015027070;
	Wed, 26 Nov 2014 07:17:07 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id c5sm7677889wik.3.2014.11.26.07.17.05
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Nov 2014 07:17:05 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 26 Nov 2014 16:17:08 +0100
To: Paul Barker <paul@paulbarker.me.uk>
Message-ID: <20141126151708.GA2460@jama>
References: <CANyK_8eZHwtww6AL7L5f34R5Nc7mhSQALaez1NCnHvmUpHWcXw@mail.gmail.com>
	<1417004047.12520.10.camel@linuxfoundation.org>
	<CANyK_8dxvZU8wnqFQGWL=DgFxOdgdq-yaaOkOJrR60w7_M6pfg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANyK_8dxvZU8wnqFQGWL=DgFxOdgdq-yaaOkOJrR60w7_M6pfg@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: opkg, opkg-config-base and opkg-collateral
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
X-List-Received-Date: Wed, 26 Nov 2014 15:17:14 -0000
X-Groupsio-MsgNum: 59931
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cNdxnHkX5QqsyA0e"
Content-Disposition: inline

--cNdxnHkX5QqsyA0e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 26, 2014 at 01:50:38PM +0000, Paul Barker wrote:
> On 26 November 2014 at 12:14, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Tue, 2014-11-25 at 20:27 +0000, Paul Barker wrote:
> > > Hi all,
> > >
> > > Does anyone know why the configuration files for opkg are split into
> > > opkg-config-base (containing just '/etc/opkg/arch.conf') and
> > > opkg-collateral (containing just '/etc/opkg/opkg.conf')? It looks like
> > > the split dates back to openembedded classic.
> > >
> > > If there isn't a good reason for this perhaps now would be a good time
> > > to merge all this back into the 'opkg' recipe and package. I'm happy
> > > to put the patch together, just checking if it sounds like a good idea
> > > before I do the work.
> >
> > I think at least one of the above was intended to allow distro specific
> > package feeds to be preconfigured as as such belonged as a standalone
> > config file.
>=20
> That would probably be opkg-collateral as it pulls in a 'src' file
> which is empty in oe-core.
>=20
> However there's also the poky-feed-config-opkg recipe which provides
> feed configurations in /etc/opkg/base-feeds.conf. It also fills in
> /etc/opkg/arch.conf which means it would not be installable alongside
> opkg-config-base.
>=20
> I suggest the config settings are merged back into the opkg recipe,
> removing opkg-collateral completely. We can then improve
> poky-feed-config-opkg and rename it to something like opkg-feed-config
> so that it's clear it's usable by distros other than poky. This
> improved recipe would just contain /etc/opkg/feeds.conf (the 'base-'
> filename prefix is unnecessary).
>=20
> In terms of improving the feed config for opkg, by default I suggest
> we just setup feeds for 'all', ${ALL_MULTILIB_PACKAGE_ARCHS} and
> ${MACHINE_ARCH}. This should avoid creating feed entries for
> architectures which the target system supports but for which we never
> create packages (for example, qemux86 lists 'all', 'any', 'noarch',
> 'x85', 'i586' and 'qemux86' as supported architectures but we only
> ever create packages for 'all', 'i586' and 'qemux86'). By using a
> bbappend a layer should be able to add to these defaults. The URI for
> each package feed would be prefixed with ${OPKG_FEED_PREFIX} which
> must be set in the distro config or local.conf. If OPKG_FEED_PREFIX is
> not set, the recipe would create an empty base-feeds.conf file.
>=20
> It would be possible with a bit of scripting to set the hold flag on
> the opkg-feed-config package when it is installed so that even if a
> new version of the package is compiled, the feeds for a target board
> will not be automatically upgraded with 'opkg upgrade'. We could then
> create a dist-upgrade script which removes the hold flag, upgrades
> opkg-feed-config, and re-sets the hold flag. So to provide a new
> version of a distro which users could upgrade to but are not
> automatically upgraded to, you'd build a new version of
> opkg-feed-config (probably by changing OPKG_FEED_PREFIX) and run the
> dist-upgrade script on the target.
>=20
> I'll put together RFC patches to show what I mean, I think that's a
> pretty good explanation for now though.
>=20
> >
> > The architecture file is also machine specific, we wouldn't want opkg
> > itself rebuilding for every machine so that is probably why its
> > separate.
> >
>=20
> I didn't spot this but it does make sense. Perhaps opkg-config-base
> should be renamed to opkg-arch-config to avoid future confusion.
>=20
> > Three different things on the other hand seems excessive. We probably
> > could survive with some merhing with opkg and the remainder being
> > machine specific.
> >
>=20
> I'd keep three, but refactor them as I've described above:
> - opkg: Includes '/etc/opkg/opkg.conf'
> - opkg-arch-config: Includes '/etc/opkg/arch.conf', machine specific
> - opkg-feed-config: Includes '/etc/opkg/feeds.conf', distro and
> possibly machine specific

Please also check
http://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-core/met=
a/distro-feed-configs.bb

+ filtering the architectures

https://github.com/shr-distribution/meta-smartphone/blob/master/meta-shr-di=
stro/recipes-core/meta/distro-feed-configs.bbappend

+ stricter filter for individual MACHINEs based on selected DEFAULTTUNE

https://github.com/shr-distribution/meta-smartphone/blob/master/meta-shr-di=
stro/conf/distro/include/defaulttunes.inc

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--cNdxnHkX5QqsyA0e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlR17vQACgkQN1Ujt2V2gBySTQCfUUxp+qnZn0HLxgFwloSdggB0
VBIAnA0cTkNdoeVe1is7XlXAaahlF3ZZ
=25OU
-----END PGP SIGNATURE-----

--cNdxnHkX5QqsyA0e--
