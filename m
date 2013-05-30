Return-Path: <eric@eukrea.com>
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by mail.openembedded.org (Postfix) with ESMTP id B400A608CA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 19:14:50 +0000 (UTC)
Received: from e6520eb (tal33-3-82-233-81-124.fbx.proxad.net [82.233.81.124])
	(Authenticated sender: eukrea)
	by smtp3-g21.free.fr (Postfix) with ESMTPSA id 5AA3BA6241;
	Thu, 30 May 2013 21:14:44 +0200 (CEST)
Date: Thu, 30 May 2013 21:14:36 +0200
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20130530211441.35590da9@e6520eb>
In-Reply-To: <CAJTo0LY=Fs9bFv-jSdmSrqx=Gna4obgN92XvRK2NcbhEOFywPg@mail.gmail.com>
References: <1369899843-3318-1-git-send-email-eric@eukrea.com>
	<CA+chaQeCTAq3dtUao2+oAmETHe5s7gkTjtd86fS2NBcyR=bmdQ@mail.gmail.com>
	<CAJTo0LYDRHqO2kveMW4ftq3g4BNjLE_sJJ6mej2cNbaC3TKh6g@mail.gmail.com>
	<20130530123230.78dab18a@e6520eb> <1369910940.14887.295.camel@ted>
	<20130530131142.4050a9c7@e6520eb>
	<CAJTo0LY=Fs9bFv-jSdmSrqx=Gna4obgN92XvRK2NcbhEOFywPg@mail.gmail.com>
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
X-List-Received-Date: Thu, 30 May 2013 19:14:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Le Thu, 30 May 2013 19:26:03 +0100,
"Burton, Ross" <ross.burton@intel.com> a =C3=A9crit :

> On 30 May 2013 12:11, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> > inherit gnomebase and remove DEPENDS=3D""
> > seems to work fine (the postinst and postrm scripts are removed).
> > removing DEPENDS=3D"" is not a big issue as it only brings native
> > packages :
> > DEPENDS =3D autoconf-native automake-native gnome-common-native
> > gnu-config-native libtool-native pkgconfig-native
>=20
> Will you send a patch for this?
>=20
yes it's coming ;-)

Eric


