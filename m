Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id D18D36AF25
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2013 19:31:23 +0000 (UTC)
Received: by mail-ea0-f177.google.com with SMTP id j14so3165294eak.22
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Jul 2013 12:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=UshvCWxHHiqRbgPEJQSEAon8tBUkM4LndU4j1Ls+5nQ=;
	b=YiBNl4oMoFvBthrpzjKcBruFgmETs6U0+qQEYLVvvDic7aOcj/PbMGP174yz2vicVN
	DYkDU66vZQhfXV8YI2P9yiHdQNHtoC8Rb3QN3sJ6KFdnpY9eWLe5sbyYvoFyT4/hdELM
	aB32fssfJNMVZjwmMmDDLn9OYBb0i/aNcKCf/We0A6qZPiO9CkeZB1oVgpDSYQJNdamn
	FatrtmUaoAPMJk5xn7zEPfWgUNIf3LtlAuwfJUa7aPm1MLKE+q9r962d7namehtb6BpN
	P39qbEKr/PenKrtECqLV65lEW1/bVVh+M6xYo0hMA8CoVN1zCddCucuvuBhGP050c5cC
	oYpQ==
X-Received: by 10.14.148.133 with SMTP id v5mr26791656eej.81.1373311883960;
	Mon, 08 Jul 2013 12:31:23 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	b7sm44602927eef.16.2013.07.08.12.31.22 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 08 Jul 2013 12:31:23 -0700 (PDT)
Date: Mon, 8 Jul 2013 21:31:31 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Message-ID: <20130708193131.GP3288@jama>
References: <cover.1373003615.git.Qi.Chen@windriver.com>
	<341a64b50c13dec0bf01feb5c74d5b32815a7191.1373003615.git.Qi.Chen@windriver.com>
	<20130705083905.GD3259@jama> <51DAF3BC.60107@windriver.com>
	<20130708172715.GO3288@jama> <51DAFE8C.8000506@windriver.com>
MIME-Version: 1.0
In-Reply-To: <51DAFE8C.8000506@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] image.bbclass: add a method to add/delete/modify user/group settings
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
X-List-Received-Date: Mon, 08 Jul 2013 19:31:24 -0000
X-Groupsio-MsgNum: 41624
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LpcCHpaCAbC4X43d"
Content-Disposition: inline

--LpcCHpaCAbC4X43d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 08, 2013 at 01:01:48PM -0500, Mark Hatle wrote:
> On 7/8/13 12:27 PM, Martin Jansa wrote:
> > On Mon, Jul 08, 2013 at 12:15:40PM -0500, Mark Hatle wrote:
> >> On 7/5/13 3:39 AM, Martin Jansa wrote:
> >>> On Fri, Jul 05, 2013 at 02:07:28PM +0800, Qi.Chen@windriver.com wrote:
> >>>> From: Chen Qi <Qi.Chen@windriver.com>
> >>>>
> >>>> We may want to add a user or group which does not logically belong to
> >>>> any specific package. For example, we may want to add a user with the
> >>>> name 'tester' to our image. Besides, we may want to delete or modify
> >>>> user/group in our image.
> >>>>
> >>>> This patch adds a variable, USER_GROUP_SETTINGS, which is dedicated
> >>>> to these tasks. The configuration format is detailed in the local.co=
nf.
> >>>> sample.extended file.
> >>>>
> >>>> This patch also adds a function, set_user_group, which happens at
> >>>> the end of the ROOTFS_POSTPROCESS_COMMAND. It handles the settings
> >>>> in the USER_GROUP_SETTINGS variable.
> >>>
> >>> Why not use extra package just with user?
> >>>
> >>> See "[PATCH v3 0/5] Allow xuser to shutdown (cover letter only)"
> >>
> >> The issue is that the users don't want extra (empty) packages to just =
add
> >> standard users/groups.  What they want is a post image-generation
> >> "configuration" mechanism.
> >>
> >> Adding users/groups is one of the basic items that they want/need.  Th=
is really
> >> has to be considered to be an administrative activity vs a distribution
> >> activity.  (I.e. difference between creating a package and performing =
some kind
> >> of post-image action.)
> >>
> >> The other issue with a package based approach is it then mandates chan=
ges occur
> >> by having to rebuild/reinstall packages.  This is onerous in my experi=
ence, for
> >> something basic like this.  It's really outside of the package manager=
's control.
> >
> > We can have all users in one package
> > base-users (like we have base-files)
> >
> > It can allow someone to just define DEFAULT_USERS =3D "a b c" in
> > local.conf and let base-users recipe to create all 3 automatically.
> >
> > Post image-generation mechanism doesn't allow to add new required users
> > in "upgrade" or installing packages from binary feed with all required
> > users accounts.
> >
>=20
> That is exactly it..  these are not users that will -ever- be upgraded or=
 worked=20
> on via packages.
>=20
> This is equivalent to saying "I'd like users bob, tracy and alice on this=
 image=20
> I'm generating."
>=20
> It's NOT saying, all systems generated with this package feed will includ=
e bob,=20
> tracy and alice.

IMAGE_INSTALL +=3D "base-user-bob base-user-tracy base-user-alice"

> If the user wants to add john, after the initial image is generated, they=
 would=20
> do so using the adduser functionality of the system (or modifying the=20
> passwd/group files.)

And what if john-the-ripper package in the feed needs john as system
user and the same system user is also used by thc-hydra package?

Should both include addusers/addgroup postinsts (like connman,
xserver-nodm-init do without latest patchset)?

> The fundamental problem is that the package feeds and district from the i=
mage=20
> itself.  The image is nothing more then an installer that happens to be r=
unning=20
> on the build machine itself.  Things that are part of the distribution be=
long in=20
> the feed, things that are instance/image specific belong as part of the=
=20
> installation process.
>=20
> --Mark

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--LpcCHpaCAbC4X43d
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHbE5MACgkQN1Ujt2V2gBw6HgCglq/5+/+PqfbNpOY4ca8aj24b
JR4AoLjpWLAl7ycFzCTwn0M/XYGNSzcy
=gk5j
-----END PGP SIGNATURE-----

--LpcCHpaCAbC4X43d--
