Return-Path: <seebs@seebs.net>
Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
	by mail.openembedded.org (Postfix) with ESMTP id EA4647D29B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Apr 2019 14:41:55 +0000 (UTC)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id 8D5012E895E;
	Sat, 13 Apr 2019 09:41:55 -0500 (CDT)
Date: Sat, 13 Apr 2019 09:41:53 -0500
From: Seebs <seebs@seebs.net>
To: Andreas =?UTF-8?B?TcO8bGxlcg==?= <schnitzeltony@gmail.com>
Message-ID: <20190413094153.3432092b@seebsdell>
In-Reply-To: <CALbNGRR7HZt9Jf1rEhMHd_y4tW4G=f8rUH=9hA9hbfcAY2Yayg@mail.gmail.com>
References: <20190410231254.25763-1-richard.purdie@linuxfoundation.org>
	<20190410185944.0a16ea5d@seebsdell>
	<2cf8ada8df82cb38252db3ff4c45b9f85294c63e.camel@linuxfoundation.org>
	<CALbNGRR7HZt9Jf1rEhMHd_y4tW4G=f8rUH=9hA9hbfcAY2Yayg@mail.gmail.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pseudo: Update to gain key bugfixes
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
X-List-Received-Date: Sat, 13 Apr 2019 14:41:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, 13 Apr 2019 10:03:03 +0200
Andreas M=C3=BCller <schnitzeltony@gmail.com> wrote:

> On Fri, Apr 12, 2019 at 10:18 AM <richard.purdie@linuxfoundation.org>
> wrote:
> >
> > On Wed, 2019-04-10 at 18:59 -0500, Seebs wrote:
> > > On Thu, 11 Apr 2019 00:12:54 +0100
> > > Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > > -SRCREV =3D "6294b344e5140f5467e6860f45a174440015304e"
> > > > +SRCREV =3D "6ebc7d6bc8ab973d0ba949eeb363821811ce8dc5"
> > >
> > > I would sort of recommend one of the two commits since then -- one
> > > may
> > > fix the .NET startup failures, and the other fixes warnings that
> > > this one introduced and I forgot to fix. But I'm also okay with
> > > this one.
> >
> > That is good news. I've tested and updated to the later revision,
> > thanks!
> >
> > Cheers,
> >
> > Richard
> >
> Hi,
>=20
> If you want a happy weekend - stop reading here.
>=20
> But somebody has to do widen the audience...
>=20
> Seems that this commit causes issues on meta-qt5 / qtbase [1]. To make
> it worse it seems that only some host configurations are affected...
>=20
> Cheers
>=20
> [1] https://github.com/meta-qt5/meta-qt5/issues/187
>=20
> Andreas

My guess from looking at it is that qmake is using renameat2 and isn't
falling back to something else if renameat2 fails with ENOSYS.

-s

