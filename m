Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id B7ECE78388
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 14:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id C43252E104
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 16:43:06 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id krC8Igw_wmuq
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 16:43:03 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bes.se.axis.com (Postfix) with ESMTPS id B469E2E118
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 16:43:03 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A11001E07A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 16:43:03 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 946481E079
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 16:43:03 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 16:43:03 +0200 (CEST)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by thoth.se.axis.com (Postfix) with ESMTP id 887F8125
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 16:43:03 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Thu, 15 Jun 2017 16:43:03 +0200
Received: from XBOX02.axis.com ([fe80::d00f:cb52:1b56:20d]) by XBOX02.axis.com
	([fe80::d00f:cb52:1b56:20d%21]) with mapi id 15.00.1210.000;
	Thu, 15 Jun 2017 16:43:03 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Peter Kjellerstedt <pkj@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCHv2] oe-pkgdata-util: package-info: Allow extra
	variables to be displayed
Thread-Index: AQHS2ql/gveqx4Y6jEKFXMphj+ZvuqImFU5g
Date: Thu, 15 Jun 2017 14:43:03 +0000
Message-ID: <7a86e7fc950247a9b712cb75a1ee5c35@XBOX02.axis.com>
References: <20170601073349.30295-1-pkj@axis.com>
In-Reply-To: <20170601073349.30295-1-pkj@axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCHv2] oe-pkgdata-util: package-info: Allow extra	variables to be displayed
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
X-List-Received-Date: Thu, 15 Jun 2017 14:43:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

*ping*

//Peter

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Peter Kjellerstedt
> Sent: den 1 juni 2017 09:34
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCHv2] oe-pkgdata-util: package-info: Allow extra
> variables to be displayed
>=20
> By specifying the -e <var> option one or multiple times, extra
> variables available in the pkgdata can be displayed, e.,g,
> `oe-pkgdata-util package-info -e SUMMARY -e LICENSE ...`. The extra
> variables displayed are quoted since some of them may contain
> whitespace.
>=20
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
> PATCHv2: Changed references to SRC_URI into LICENSE, since SRC_URI is
> not an available variable in the pkgdata.
>=20
>  scripts/oe-pkgdata-util | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>=20
> diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
> index 6255662a4b..87beecb9da 100755
> --- a/scripts/oe-pkgdata-util
> +++ b/scripts/oe-pkgdata-util
> @@ -325,8 +325,14 @@ def package_info(args):
>              recipe_version =3D recipe_version + "-" +
> mappings[pkg]['PR']
>          pkg_size =3D mappings[pkg]['PKGSIZE']
>=20
> -        items.append("%s %s %s %s %s" %
> -                     (pkg, pkg_version, recipe, recipe_version,
> pkg_size))
> +        line =3D "%s %s %s %s %s" % (pkg, pkg_version, recipe,
> recipe_version, pkg_size)
> +
> +        for val in args.extra:
> +            src_uri =3D mappings[pkg][val].strip()
> +            src_uri =3D re.sub(r'\s+', ' ', src_uri)
> +            line +=3D ' "%s"' % src_uri
> +
> +        items.append(line)
>      print('\n'.join(items))
>=20
>  def get_recipe_pkgs(pkgdata_dir, recipe, unpackaged):
> @@ -530,6 +536,7 @@ def main():
>                                            description=3D'Looks up the
> specified runtime package(s) and display information')
>      parser_package_info.add_argument('pkg', nargs=3D'*', help=3D'Runtime
> package name to look up')
>      parser_package_info.add_argument('-f', '--file', help=3D'Read
> package names from the specified file (one per line, first field
> only)')
> +    parser_package_info.add_argument('-e', '--extra', help=3D'Extra
> variables to display, e.g., LICENSE (can be specified multiple times)',
> action=3D'append')
>      parser_package_info.set_defaults(func=3Dpackage_info)
>=20
>      parser_find_path =3D subparsers.add_parser('find-path',
> --
> 2.12.0
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

