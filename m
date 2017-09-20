Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id C33C977E7F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Sep 2017 16:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 75A0918A15;
	Wed, 20 Sep 2017 18:07:11 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id UQynFsL3IsF2; Wed, 20 Sep 2017 18:07:09 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 427D918A11;
	Wed, 20 Sep 2017 18:07:09 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 326121E082;
	Wed, 20 Sep 2017 18:07:09 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 272AA1E081;
	Wed, 20 Sep 2017 18:07:09 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Wed, 20 Sep 2017 18:07:09 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by thoth.se.axis.com (Postfix) with ESMTP id 1AF8D1908;
	Wed, 20 Sep 2017 18:07:09 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Wed, 20 Sep 2017 18:07:09 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1263.000; Wed, 20 Sep 2017 18:07:09 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Armin Kuster <akuster808@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [pyro][PATCHv2] oe-pkgdata-util: package-info: Allow
	extra variables to be displayed
Thread-Index: AQHTKK9yxvClvC6ZTUytd2aq+NmHqKK+AXlw
Date: Wed, 20 Sep 2017 16:07:08 +0000
Message-ID: <d1f3c690a4cc49adb978f14fb5033ae8@XBOX02.axis.com>
References: <20170908143315.30326-1-pkj@axis.com>
In-Reply-To: <20170908143315.30326-1-pkj@axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [pyro][PATCHv2] oe-pkgdata-util: package-info: Allow	extra variables to be displayed
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
X-List-Received-Date: Wed, 20 Sep 2017 16:07:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Is there any chance of this making it into 2.3.2? It seems 2.3.2 is=20
not too far away, given that the DISTRO_VERSION has been updated to=20
2.3.2 on the pyro branch, but I do not know what the current status=20
is or when you expect to cut the release.

For the record this should be safe to take regarding any QA testing=20
done since it only affects a script that is not used as part of=20
building anything, and then only changes its behavior if a new=20
argument is specified.

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Peter Kjellerstedt
> Sent: den 8 september 2017 16:33
> To: Armin Kuster <akuster808@gmail.com>; openembedded-
> core@lists.openembedded.org
> Subject: [OE-core] [pyro][PATCHv2] oe-pkgdata-util: package-info: Allow
> extra variables to be displayed
>=20
> From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
>=20
> By specifying the -e <var> option one or multiple times, extra
> variables available in the pkgdata can be displayed, e.,g,
> `oe-pkgdata-util package-info -e SUMMARY -e LICENSE ...`. The extra
> variables displayed are quoted since some of them may contain
> whitespace.
>=20
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>=20
> This is a backport of the corresponding change (6f054fcf) on master.
> It should not change anything unless one actually uses the --extra
> option to oe-pkgdata-util.
>=20
> PATCHv2: Now without Change-Id footer.
>=20
>  scripts/oe-pkgdata-util | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>=20
> diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
> index 6255662a4b..677effeef6 100755
> --- a/scripts/oe-pkgdata-util
> +++ b/scripts/oe-pkgdata-util
> @@ -325,8 +325,15 @@ def package_info(args):
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
> +        if args.extra:
> +            for var in args.extra:
> +                val =3D mappings[pkg][var].strip()
> +                val =3D re.sub(r'\s+', ' ', val)
> +                line +=3D ' "%s"' % val
> +
> +        items.append(line)
>      print('\n'.join(items))
>=20
>  def get_recipe_pkgs(pkgdata_dir, recipe, unpackaged):
> @@ -530,6 +537,7 @@ def main():
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

//Peter

