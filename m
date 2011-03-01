Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1PuVhG-0007xK-GQ
	for openembedded-core@lists.openembedded.org;
	Tue, 01 Mar 2011 20:57:26 +0100
Received: by wyb38 with SMTP id 38so4981198wyb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Mar 2011 11:56:00 -0800 (PST)
Received: by 10.227.9.197 with SMTP id m5mr6507654wbm.100.1299009360072;
	Tue, 01 Mar 2011 11:56:00 -0800 (PST)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id x1sm4495438wbh.14.2011.03.01.11.55.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 Mar 2011 11:55:59 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1082)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1298920867-4961-1-git-send-email-koen@dominion.thruhere.net>
Date: Tue, 1 Mar 2011 20:55:57 +0100
Message-Id: <A632FFDE-18DE-439E-B247-80DE29746320@dominion.thruhere.net>
References: <1298920867-4961-1-git-send-email-koen@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1082)
Subject: Re: [PATCH] base.bbclass: add support for SOC_FAMILY in COMPATIBLE_MACHINES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Mar 2011 19:57:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

ping

Op 28 feb 2011, om 20:21 heeft Koen Kooi het volgende geschreven:

> * Add support for using SOC_FAMILY in the COMPATIBLE_MACHINES
>  setting for a recipe.
> * This will allow recipes to work for entire families of
>  devices without having to maintain/update the compatible
>  devices as new devices are added into a family
>=20
> Based on 07076390358f211bd96779bec2d6eb5eaa0ad699 by Chase Maupin =
<chase.maupin@ti.com>
>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
> meta/classes/base.bbclass |    4 +++-
> 1 files changed, 3 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index a674f52..aaf99da 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -342,7 +342,9 @@ python () {
>             import re
>             this_machine =3D bb.data.getVar('MACHINE', d, 1)
>             if this_machine and not re.match(need_machine, =
this_machine):
> -                raise bb.parse.SkipPackage("incompatible with machine =
%s" % this_machine)
> +                this_soc_family =3D bb.data.getVar('SOC_FAMILY', d, =
1)
> +                if (this_soc_family and not re.match(need_machine, =
this_soc_family)) or not this_soc_family:
> +                    raise bb.parse.SkipPackage("incompatible with =
machine %s" % this_machine)
>=20
>=20
>         dont_want_license =3D bb.data.getVar('INCOMPATIBLE_LICENSE', =
d, 1)
> --=20
> 1.6.6.1
>=20



