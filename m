Return-Path: <eric@eukrea.com>
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by mail.openembedded.org (Postfix) with ESMTP id 469076CEF1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2013 08:34:07 +0000 (UTC)
Received: from e6520eb (unknown [88.170.243.169])
	(Authenticated sender: eukrea)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id BF9874B01DC;
	Mon,  4 Nov 2013 09:34:00 +0100 (CET)
Date: Mon, 4 Nov 2013 09:33:59 +0100
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: Andrea Adami <andrea.adami@gmail.com>
Message-ID: <20131104093359.4d958b8b@e6520eb>
In-Reply-To: <CAAQYJAvvqEByKQRPKRZviqPJmSrDqYt1PvnYPxeJuOSuKO-HaA@mail.gmail.com>
References: <1381358545.29912.50.camel@ted> <20131028151004.34b2af21@e6520eb>
	<CAMKF1so3GUQZMvLADSCr=Exavo5OVgh==do7aHhe_wUQk9mFHQ@mail.gmail.com>
	<20131029082852.4399ee5e@e6520eb> <1383146112.25877.34.camel@ted>
	<20131102094725.14fb6902@e6520eb>
	<CAAQYJAvvqEByKQRPKRZviqPJmSrDqYt1PvnYPxeJuOSuKO-HaA@mail.gmail.com>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.9.2 (GTK+ 2.24.22; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: SRC_URI computing order
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
X-List-Received-Date: Mon, 04 Nov 2013 08:34:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Andrea,

Le Sun, 3 Nov 2013 23:16:09 +0100,
Andrea Adami <andrea.adami@gmail.com> a =E9crit :
> I have to report an undesiderate behavior:
>=20
> the formfactor files in our .bbappend are not considered :/
> DEBUG: Searching for machconfig in paths:....
>   /oe/oe-core/meta/recipes-bsp/formfactor/formfactor-0.0/
>   /oe/oe-core/meta/recipes-bsp/formfactor/formfactor/
>   /oe/oe-core/meta/recipes-bsp/formfactor/files/
>   /oe/meta-handheld/recipes-bsp/formfactor/files/poodle
>=20
> so we end up with the empty machconfig of
> /oe/oe-core/meta/recipes-bsp/formfactor/files/
>=20
> Surely this didn't happen when we tested the recipe.
>=20
isn't that problem fixed by cherry-picking commit
92cbf7eeea553bfa24c7081473fa8bc4ebc1f552 in oe-core ?

Eric

