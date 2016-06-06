Return-Path: <humberto.ibarra.lopez@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 01FA27707F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jun 2016 17:34:14 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP; 06 Jun 2016 10:34:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,428,1459839600"; d="scan'208";a="116990690"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
	by fmsmga004.fm.intel.com with ESMTP; 06 Jun 2016 10:34:15 -0700
Received: from fmsmsx121.amr.corp.intel.com (10.18.125.36) by
	FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Mon, 6 Jun 2016 10:34:15 -0700
Received: from fmsmsx106.amr.corp.intel.com ([169.254.5.53]) by
	fmsmsx121.amr.corp.intel.com ([169.254.6.23]) with mapi id
	14.03.0248.002; Mon, 6 Jun 2016 10:34:15 -0700
From: "Ibarra Lopez, Humberto" <humberto.ibarra.lopez@intel.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 12/16] engine: python3: replace iteritems()
	->	items()
Thread-Index: AQHRvLea0s+57FAGpESHpCL2Ce92Cp/cuZsw
Date: Mon, 6 Jun 2016 17:34:14 +0000
Message-ID: <F187383F84EB304A88D055C3049588791BBED7A8@FMSMSX106.amr.corp.intel.com>
References: <cover.1464861910.git.ed.bartosh@linux.intel.com>
	<453e3bcc22a0f73d252a1c2175c35b1a78ebaf74.1464861910.git.ed.bartosh@linux.intel.com>
In-Reply-To: <453e3bcc22a0f73d252a1c2175c35b1a78ebaf74.1464861910.git.ed.bartosh@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_IC
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNzZmZjc4MWMtY2IzNC00NzE2LTg0NTctNGJkYmE0MzZkOTgyIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX0lDIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE1LjkuNi42IiwiVHJ1c3RlZExhYmVsSGFzaCI6IjM2eWFBKzRwRUJSVm9HeWNEcVpHN1JoeXo2ZkpNZmRWKys2a2ZRbmNFd3c9In0=
x-originating-ip: [10.1.200.107]
MIME-Version: 1.0
Subject: Re: [PATCH 12/16] engine: python3: replace iteritems() ->	items()
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
X-List-Received-Date: Mon, 06 Jun 2016 17:34:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This patch introduced a syntax error. Sent a patch to fix it http://lists.o=
penembedded.org/pipermail/openembedded-core/2016-June/122522.html

Humberto

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> Of Ed Bartosh
> Sent: Thursday, June 2, 2016 5:13 AM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 12/16] engine: python3: replace iteritems() ->
> items()
>=20
> Used items() as iteritems() doesn't exist in python 3.
>=20
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> ---
>  scripts/lib/bsp/engine.py | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/scripts/lib/bsp/engine.py b/scripts/lib/bsp/engine.py index
> 2b87d33..3ed90fa 100644
> --- a/scripts/lib/bsp/engine.py
> +++ b/scripts/lib/bsp/engine.py
> @@ -1385,7 +1385,7 @@ def gen_supplied_property_vals(properties,
> program_lines):
>      Generate user-specified entries for input values instead of
>      generating input prompts.
>      """
> -    for name, val in properties.iteritems():
> +    for name, val in properties.items():
>          program_line =3D name + " =3D \"" + val + "\""
>          program_lines.append(program_line)
>=20
> @@ -1621,7 +1621,7 @@ def print_dict(items, indent =3D 0):
>      """
>      Print the values in a possibly nested dictionary.
>      """
> -    for key, val in items.iteritems():
> +    for key, val in items.items():
>          print("    "*indent + "\"%s\" :" % key)
>          if type(val) =3D=3D dict:
>              print("{")
> @@ -1654,7 +1654,7 @@ def get_properties(input_lines):
>          props =3D line.props
>          item =3D {}
>          name =3D props["name"]
> -        for key, val in props.items():
> +        for key, val props.items():
>              if not key =3D=3D "name":
>                  item[key] =3D val
>          properties[name] =3D item
> --
> 2.1.4
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

