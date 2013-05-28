Return-Path: <eric@eukrea.com>
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by mail.openembedded.org (Postfix) with ESMTP id 278C16A4E6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2013 15:21:42 +0000 (UTC)
Received: from e6520eb (pac33-2-82-240-38-71.fbx.proxad.net [82.240.38.71])
	(Authenticated sender: eukrea)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id 994A34B0261;
	Tue, 28 May 2013 17:21:36 +0200 (CEST)
Date: Tue, 28 May 2013 17:21:35 +0200
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-ID: <20130528172135.187001c7@e6520eb>
In-Reply-To: <CAP9ODKqkoXrrYSyQJzRxmDfBKnQWYMUoCV8dhRvHGm2Y-sXp7g@mail.gmail.com>
References: <1369753475-22573-1-git-send-email-otavio@ossystems.com.br>
	<1369753938.8846.8.camel@phil-desktop.brightsign>
	<CAP9ODKqkoXrrYSyQJzRxmDfBKnQWYMUoCV8dhRvHGm2Y-sXp7g@mail.gmail.com>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.16; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base.bbclass: Add COMPATIBLE_DISTRO_FEATURES support
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
X-List-Received-Date: Tue, 28 May 2013 15:21:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Otavio,

Le Tue, 28 May 2013 12:18:21 -0300,
Otavio Salvador <otavio@ossystems.com.br> a =C3=A9crit :

> On Tue, May 28, 2013 at 12:12 PM, Phil Blundell <pb@pbcl.net> wrote:
> > Also also, we've managed without this functionality in oe-core for some
> > time which makes me wonder how widely useful it would actually be.  If
> > it's only going to be used by a few recipes then it could go in a class,
> > or in in the recipes themselves, rather than adding parse time and
> > memory footprint to every recipe.
> >
>=20
> Right; let's first agree in the code so we can discuss where to put it:
>=20
> +        need_distro_features =3D d.getVar('REQUIRED_DISTRO_FEATURES', Tr=
ue)
> +        if need_distro_features:
> +            need_distro_features =3D need_distro_features.split()
> +            distro_features =3D (d.getVar('DISTRO_FEATURES', True) or
> "").split()
> +            for f in need_distro_features:
> +                if f in distro_features:
> +                    break
> +            else:
> +                raise bb.parse.SkipPackage("missing required distro
> feature %s (not in DISTRO_FEATURES)" % need_distro_features)
>=20
>=20
If I follow you want that to avoid this line in a recipe :
COMPATIBLE_MACHINE =3D "{@base_contains('DISTRO_FEATURES', 'x11', (mx5),
'', d)}"
maybe there is a more clean way to exclude this recipe when x11
is not present without impacting the whole build system ?

Eric

