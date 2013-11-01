Return-Path: <eric@eukrea.com>
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
	by mail.openembedded.org (Postfix) with ESMTP id CBD5E6CE3F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2013 15:36:20 +0000 (UTC)
Received: from e6520eb (unknown [90.84.144.55]) (Authenticated sender: eukrea)
	by smtp4-g21.free.fr (Postfix) with ESMTPSA id 713DB4C80EF;
	Fri,  1 Nov 2013 16:36:15 +0100 (CET)
Date: Fri, 1 Nov 2013 16:36:11 +0100
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20131101163611.37a8c084@e6520eb>
In-Reply-To: <20131028151004.34b2af21@e6520eb>
References: <1381358545.29912.50.camel@ted> <20131028151004.34b2af21@e6520eb>
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
X-List-Received-Date: Fri, 01 Nov 2013 15:36:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

Le Mon, 28 Oct 2013 15:10:04 +0100,
Eric B=E9nard <eric@eukrea.com> a =E9crit :
> I saw your patch fixing FILESPATH's and Kergoth's one fixing
> PACKAGECONFIG processing order and I think I'm also facing an order
> problem when SRC_URI is computed.
>=20
> So when building SRC_URI when two layers have bbappend which apply
> patches : the SRC_URI seems to be built using an order I fail to
> understand somewhere instead of priority or the overrides' order.
>=20
> The use case is a System on Module and its custom motherboard :
> - meta-fsl-arm :
> * linux-imx_xyz.bb :
> SRC_URI =3D "patchgeneric1 ..."
>=20
> - meta-som-support :
> * conf/machine/mysom.conf
>=20
> * linux-imx_xyz.bbappend :
> SRC_URI_append_mysom =3D "patchsom1 patchsom2 ..."
>=20
> - meta-custommotherboard (SOM + Cunstom Motherboard) :
> * conf/machine/myproduct.conf
> MACHINEOVERRIDES_prepend =3D "mysom:"
> include conf/machine/mysom.conf
>=20
> * linux-imx_xyz.bbappend :
> SRC_URI_append_myproduct =3D "patchproduct1 patchproduct2 ..."
>=20
> in the end I get :
> SRC_URI =3D "patchgeneric1 ... patchsoc1 ... patchproduct1 ...
> patchsom1 ..."
>=20
> and of course as patchproduct* are supposed to apply on top of
> patchsoc* the patch fail to apply.
>=20
> I didn't found a way to build SRC_URI in the order I would like (I
> tested : changing MACHINEOVERRIDES 's order, changing layers' priority,
> changing machine's name to see if that was an alphabetical order ...).
>=20
> In the end the only thing which worked was to add an (empty by default)
> variable in som's SRC_URI and filling this variables from the
> custommotherboard's bbappend.
>=20
> Is the behaviour I'm seeing expected or is there something wrong in my
> setup ?
>=20
do you need more details concerning this problem ?

Thanks
Eric

