Return-Path: <eric@eukrea.com>
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by mail.openembedded.org (Postfix) with ESMTP id 495B36A4E3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2013 08:03:53 +0000 (UTC)
Received: from e6520eb (pac33-2-82-240-38-71.fbx.proxad.net [82.240.38.71])
	(Authenticated sender: eukrea)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id 451BB4B0178;
	Thu, 27 Jun 2013 10:03:48 +0200 (CEST)
Date: Thu, 27 Jun 2013 10:03:46 +0200
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: Steve Sakoman <sakoman@gmail.com>
Message-ID: <20130627100346.35932ab8@e6520eb>
In-Reply-To: <CAGDS+nmpNmSwSV9qW3aQ22BBkss1PhCVtg7A-JzSx+bL-ngqCQ@mail.gmail.com>
References: <CAGDS+nmpNmSwSV9qW3aQ22BBkss1PhCVtg7A-JzSx+bL-ngqCQ@mail.gmail.com>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.9.1 (GTK+ 2.24.18; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Qt embedded, touchscreens, and cursors
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
X-List-Received-Date: Thu, 27 Jun 2013 08:03:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Steve,

Le Tue, 25 Jun 2013 09:34:05 -0700,
Steve Sakoman <sakoman@gmail.com> a =C3=A9crit :

> I'm new to the Qt world, so perhaps this is a stupid question . . .
>=20
> I'm helping a client create a custom layer for their touchscreen based
> hardware and Qt applications.
>=20
> They've decided to use Qt4e and we are including the stock danny qt4e
> binaries in the image.
>=20
> All works as desired with one exception:  the Qt cursor appears at app
> launch time with a green 16x16 background, converts to the app
> background shortly thereafter, and then stays on the screen until the
> first time you touch the screen, then disappears and stays gone.
>=20
> Some quick googling indicates this is a common problem with touchsceen
> Qt implementations and that there are no satisfactory runtime
> solutions.  The most often recommended solution is to disable the
> cursor at build time with -no-feature-CURSOR added to the Qt config
> options.  This option is also claimed to give a significant
> performance boost.
>=20
> I tried adding a bbappend to add this option, but as some of the above
> mentioned sources indicated the Qt build will fail unless you disable
> demos, examples, and a couple of other build features.  I started
> going down this path but I suspect it will require changes to the base
> Qte recipe.
>=20
> Have others run into this issue?  I suspect that most target hardware
> for Yocto builds are touchscreen based, so this will likely come up
> over and over again.
>=20
> Any suggestions?

IIRC you can hack this in=20
qwscursor_qws.cpp
around "// default cursor"
you change ArrowCursor to BlankCursor
(sorry no clean patch for that ATM).

Eric

