Return-Path: <eric@eukrea.com>
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by mail.openembedded.org (Postfix) with ESMTP id 5E01660959
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 10:32:37 +0000 (UTC)
Received: from e6520eb (pac33-2-82-240-38-71.fbx.proxad.net [82.240.38.71])
	(Authenticated sender: eukrea)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id DEA9B4B018B;
	Thu, 30 May 2013 12:32:31 +0200 (CEST)
Date: Thu, 30 May 2013 12:32:30 +0200
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20130530123230.78dab18a@e6520eb>
In-Reply-To: <CAJTo0LYDRHqO2kveMW4ftq3g4BNjLE_sJJ6mej2cNbaC3TKh6g@mail.gmail.com>
References: <1369899843-3318-1-git-send-email-eric@eukrea.com>
	<CA+chaQeCTAq3dtUao2+oAmETHe5s7gkTjtd86fS2NBcyR=bmdQ@mail.gmail.com>
	<CAJTo0LYDRHqO2kveMW4ftq3g4BNjLE_sJJ6mej2cNbaC3TKh6g@mail.gmail.com>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.18; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] hicolor-icon-theme: keep inherited dependencies
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
X-List-Received-Date: Thu, 30 May 2013 10:32:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Le Thu, 30 May 2013 09:32:38 +0100,
"Burton, Ross" <ross.burton@intel.com> a =C3=A9crit :

> On 30 May 2013 09:09, Martin Jansa <martin.jansa@gmail.com> wrote:
> > Doesn't it depend now on something which isn't allarch? IIRC gnome.bbcl=
ass
> > brings gconf.
>=20
> gnome.bbclass is an abomination and should be gutted.  Yes, this will
> mean the build dependencies are massive, and I can't see why this
> recipe needs gnome.bbclass.  Then again it doesn't need gtk-icon-cache
> either as it doesn't actually have any icons in.  I'd be interested in
> seeing a buildhistory-diff between the current recipe and one with
> both inherit gnome and DEPENDS=3D"" removed.
>=20
when  removing gnome I get the following error at install :
DEBUG: Executing shell function do_install
install: cannot create regular file
`/scratch/setup-scripts/build/tmp-defaultsetup-eglibc-eglibc/work/all-oe-li\
nux/hicolor-icon-theme/0.12-r1/image//usr/share/icons/hicolor': No such
file or directory

Eric

