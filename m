Return-Path: <ola.x.nilsson@axis.com>
X-Greylist: delayed 597 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 26 Feb 2015 07:31:52 UTC
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6E75471637
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Feb 2015 07:31:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id C79F7180FF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Feb 2015 08:21:55 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id zkxvqElpCQFw
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Feb 2015 08:21:54 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id AF04B1806B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Feb 2015 08:21:54 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 8D6EB1179
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Feb 2015 08:21:54 +0100 (CET)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 7883FCEE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Feb 2015 08:21:54 +0100 (CET)
Received: from xmail4.se.axis.com (xmail4.se.axis.com [10.0.5.46])
	by seth.se.axis.com (Postfix) with ESMTP id 767653E207
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Feb 2015 08:21:54 +0100 (CET)
Received: from xmail3.se.axis.com ([10.0.5.75]) by xmail4.se.axis.com
	([fe80::2dfa:6a3a:302a:d4e8%14]) with mapi;
	Thu, 26 Feb 2015 08:21:54 +0100
From: Ola X Nilsson <ola.x.nilsson@axis.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Thu, 26 Feb 2015 08:21:50 +0100
Thread-Topic: [OE-core] [PATCH 5/5] linux-yocto: warn when a generated BSP
	description is used
Thread-Index: AdBNPHSUBGMD1wzLTDSDPU7NMJ8W0AEV5V3A
Message-ID: <4BEA3FF3CAA35E408EA55C7BE2E61D05943CBA6B1A@xmail3.se.axis.com>
References: <cover.1424456540.git.bruce.ashfield@windriver.com>
	<a9038233862667971dc193ad0e160a7b28ef252a.1424456540.git.bruce.ashfield@windriver.com>
In-Reply-To: <a9038233862667971dc193ad0e160a7b28ef252a.1424456540.git.bruce.ashfield@windriver.com>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US, sv-SE
MIME-Version: 1.0
Subject: Re: [PATCH 5/5] linux-yocto: warn when a generated BSP	description is used
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
X-List-Received-Date: Thu, 26 Feb 2015 07:31:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

We use a custom yocto-style kernel recipe to build our non-yocto-style kern=
el.

To do this we add a defconfig file to the SRC_URI variable and then a bunch=
 of scc files to the KERNEL_FEATURES variable.

I guess this makes our BSP description auto generated.  Can we have an opti=
on to turn the warning off?

--=20
Ola X Nilsson


> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> Of Bruce Ashfield
> Sent: den 20 februari 2015 19:38
> To: richard.purdie@linuxfoundation.org
> Cc: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 5/5] linux-yocto: warn when a generated BSP
> description is used
>=20
> The meta data (in tree or out of tree) that describes a BSP, its patches =
and
> configuration is not always available when a new/default or manually
> configured machine is built.
>=20
> When this happens, the tools generate a skeleton BSP and use a architectu=
re
> defconfig for the build. If this is by design, the build is typically san=
e and
> everything works fine. If an existing BSP description was expected, chanc=
es
> are that the resulting kernel will not be correct.
>=20
> To avoid surprising the user when a default/skeleton BSP is used for the =
build,
> we can make it obvious to the user by emitting a warning like the followi=
ng:
>=20
>    WARNING: [kernel]: An auto generated BSP description was used, this
> normally indicates a misconfiguration.
>             Check that your machine (myqemux86-64) has an associated kern=
el
> description.
>=20
> [YOCTO: #3383]
>=20
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  meta/classes/kernel-yocto.bbclass | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-
> yocto.bbclass
> index 0cbbb5f2d22f..a5e2b180c496 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -281,6 +281,15 @@ python do_kernel_configcheck() {
>              with open (nonhw_file, "r") as myfile:
>                  results =3D myfile.read()
>                  bb.warn( "[kernel config]: BSP specified non-hw
> configuration:\n\n%s" % results)
> +
> +    bsp_desc =3D "${S}/" + kmeta + "/" + "top_tgt"
> +    if os.path.exists(bsp_desc):
> +        with open (bsp_desc, "r") as myfile:
> +                bsp_tgt =3D myfile.read()
> +                m =3D re.match("^(.*)scratch.obj(.*)$", bsp_tgt)
> +                if not m is None:
> +                    bb.warn( "[kernel]: An auto generated BSP descriptio=
n was used,
> this normally indicates a misconfiguration.\n" +
> +                             "Check that your machine (%s) has an
> + associated kernel description." % "${MACHINE}" )
>  }
>=20
>  # Ensure that the branches (BSP and meta) are on the locations specified=
 by
> --
> 2.1.0
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

