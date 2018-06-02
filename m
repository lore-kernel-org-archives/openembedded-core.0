Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 08A7274A2C
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Jun 2018 19:48:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 420761814A
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Jun 2018 21:48:02 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id dI9I_9otIATh
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Jun 2018 21:48:01 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 7880E18133
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Jun 2018 21:48:01 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 62B7A1E057
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Jun 2018 21:48:01 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5741E1E056
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Jun 2018 21:48:01 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Jun 2018 21:48:01 +0200 (CEST)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by seth.se.axis.com (Postfix) with ESMTP id 497122351
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Jun 2018 21:48:01 +0200 (CEST)
Received: from xbox11.axis.com (10.0.5.25) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Sat, 2 Jun 2018 21:48:01 +0200
Received: from XBOX02.axis.com (10.0.5.16) by xbox11.axis.com (10.0.5.25) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Sat, 2 Jun 2018 21:48:00 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1365.000; Sat, 2 Jun 2018 21:48:00 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Cherry-pick to Sumo (was: [OE-core] [PATCHv2 1/2]
	oe-pkgdata-util: Make parse_pkgdatafile() support package suffixed
	vars)
Thread-Index: AdP6qpsejTIPW+cURQaAXayn7qxTRQ==
Date: Sat, 2 Jun 2018 19:48:00 +0000
Message-ID: <058532a438814db98ab5389758a226fd@XBOX02.axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Cherry-pick to Sumo (was: [PATCHv2 1/2] oe-pkgdata-util: Make parse_pkgdatafile() support package suffixed vars)
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
X-List-Received-Date: Sat, 02 Jun 2018 19:48:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

These two patches, in addition to "oe-pkgdata-util: lookup-recipe,=20
package-info: Don't finish prematurely" (commit 32c2a2dd) that is already=20
on master, need to be cherry-picked to the sumo branch as well. Without=20
them, `oe-pkgdata-util package-info ...` is more or less broken.

//Peter

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Peter Kjellerstedt
> Sent: den 2 juni 2018 21:31
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCHv2 1/2] oe-pkgdata-util: Make
> parse_pkgdatafile() support package suffixed vars
>=20
> Support for variables suffixed with package names, e.g., PKGV_foo, was
> removed in commit 3d2c87c4, which broke support for recipes that set
> other versions on their packages than what is in ${PV}.
>=20
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  scripts/oe-pkgdata-util | 46 ++++++++++++++++++-----------------------
> -----
>  1 file changed, 18 insertions(+), 28 deletions(-)
>=20
> diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
> index aea8a57516..965f473725 100755
> --- a/scripts/oe-pkgdata-util
> +++ b/scripts/oe-pkgdata-util
> @@ -286,36 +286,26 @@ def lookup_recipe(args):
>=20
>  def package_info(args):
>      def parse_pkgdatafile(pkgdatafile):
> +        vars =3D ['PKGV', 'PKGE', 'PKGR', 'PN', 'PV', 'PE', 'PR',
> 'PKGSIZE']
>          with open(pkgdatafile, 'r') as f:
> -            pkge =3D ''
> -            pkgr =3D ''
> -            pe =3D ''
> -            pr =3D ''
> +            vals =3D dict()
>              for line in f:
> -                if line.startswith('PKGV:'):
> -                    pkg_version =3D line.split(':', 1)[1].strip()
> -                elif line.startswith('PKGE:'):
> -                    pkge =3D line.split(':', 1)[1].strip()
> -                elif line.startswith('PKGR:'):
> -                    pkgr =3D line.split(':', 1)[1].strip()
> -                elif line.startswith('PN:'):
> -                    recipe =3D line.split(':', 1)[1].strip()
> -                elif line.startswith('PV:'):
> -                    recipe_version =3D line.split(':', 1)[1].strip()
> -                elif line.startswith('PE:'):
> -                    pe =3D line.split(':', 1)[1].strip()
> -                elif line.startswith('PR:'):
> -                    pr =3D line.split(':', 1)[1].strip()
> -                elif line.startswith('PKGSIZE'):
> -                    pkg_size =3D line.split(':', 1)[1].strip()
> -            if pkge:
> -                pkg_version =3D pkge + ":" + pkg_version
> -            if pkgr:
> -                pkg_version =3D pkg_version + "-" + pkgr
> -            if pe:
> -                recipe_version =3D pe + ":" + recipe_version
> -            if pr:
> -                recipe_version =3D recipe_version + "-" + pr
> +                for var in vars:
> +                    m =3D re.match(var + '(?:_\S+)?:\s*(.+?)\s*$', line)
> +                    if m:
> +                        vals[var] =3D m.group(1)
> +            pkg_version =3D vals['PKGV'] or ''
> +            recipe =3D vals['PN'] or ''
> +            recipe_version =3D vals['PV'] or ''
> +            pkg_size =3D vals['PKGSIZE'] or ''
> +            if 'PKGE' in vals:
> +                pkg_version =3D vals['PKGE'] + ":" + pkg_version
> +            if 'PKGR' in vals:
> +                pkg_version =3D pkg_version + "-" + vals['PKGR']
> +            if 'PE' in vals:
> +                recipe_version =3D vals['PE'] + ":" + recipe_version
> +            if 'PR' in vals:
> +                recipe_version =3D recipe_version + "-" + vals['PR']
>              print("%s %s %s %s %s" % (pkg, pkg_version, recipe,
> recipe_version, pkg_size))
>=20
>      # Handle both multiple arguments and multiple values within an arg
> (old syntax)
> --
> 2.12.0
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

