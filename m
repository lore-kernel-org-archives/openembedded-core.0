Return-Path: <eric@eukrea.com>
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by mail.openembedded.org (Postfix) with ESMTP id C04D761844
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2013 11:51:57 +0000 (UTC)
Received: from e6520eb (unknown [88.170.243.169])
	(Authenticated sender: eukrea)
	by smtp3-g21.free.fr (Postfix) with ESMTPSA id 82F26A6242;
	Mon,  7 Oct 2013 13:51:51 +0200 (CEST)
Date: Mon, 7 Oct 2013 13:51:50 +0200
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20131007135150.52adab6b@e6520eb>
In-Reply-To: <CAJTo0LbSycGjd3WGX5bpvv538=hfe1g05FY5dy4vj-P5mfxxnw@mail.gmail.com>
References: <1380967879-2902-1-git-send-email-eric@eukrea.com>
	<CAJTo0LbSycGjd3WGX5bpvv538=hfe1g05FY5dy4vj-P5mfxxnw@mail.gmail.com>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.9.2 (GTK+ 2.24.19; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu: fix nativesdk build without x11
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
X-List-Received-Date: Mon, 07 Oct 2013 11:51:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Le Mon, 7 Oct 2013 12:34:02 +0100,
"Burton, Ross" <ross.burton@intel.com> a =E9crit :

> On 5 October 2013 11:11, Eric B=E9nard <eric@eukrea.com> wrote:
> > when x11 is not defined in DISTRO_FEATURES, there are no x11 headers
> > so True is not defined leading to :
> > | ui/sdl.c:62:8: warning: type defaults to 'int' in declaration of 'doi=
ng_grabs' [-Wimplicit-int]
> > |  static doing_grabs =3D True;
> > |         ^
> > | ui/sdl.c:62:22: error: 'True' undeclared here (not in a function)
> > |  static doing_grabs =3D True;
> > |                       ^
>=20
> Does qemu on SDL on framebuffer actually work?  I'd assumed that
> people using qemu without x11 were using it without SDL, so maybe this
> is a bug in the build configuration for nativesdk.
>=20
I'm not using qemu in the present case, I was simply building a sdk.

> A better fix would be to use 1/0 instead of True/False, I was assuming
> that SDL meant X was being used.
>=20
that would also fix the problem.

Eric

