Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21542.1792671577008029335
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2026 05:19:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=jV45nVvx;
 spf=pass (domain: axis.com, ip: 52.101.84.21, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vOLolpjAlgX26SK7Jb924bkeuZ18WgHJyXf1lnVyp5hN8YR03tVBRXmFF2KPNgErUzNJO5uH53H+CjanzDI1dV8zQ++c1Z6UWJmmH7VrE/7J/TYBXef3GwfR1sUElJNi3cEFG9NueWrctpley2tUVTH61IGv6NbkuEsJO36YZ09cpPicyRgAtoXhgdEkxD0MpKc+15/5ZfWJjD6N3cHS20nP+J0WF82DDG+7kUFIWBWT3jG1frZ8fZVsCDxsSUslRYOVtZL0KlGYRwim8pFXHLOiVnKkQ5zBRYGgjLhM9YgIqaqyx0XF46eRrYvk5IXm6WD04IbX+BaoRwrt1HyLCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y68Cm8OQOUB0aPluoiLTwS4A3QK4Xl5V3iGtCGk3TZ8=;
 b=b8V8vSD7ENlBEFl3sqPIibsCrDbwaW+rTijlP9O+PaZ6CBFvg6kEZkF6k+owmhQkvqEYK48w+2YbfCV/meYGcs29hJEH+kf19RHL4mdAunxQM3NNoTDvQRi2hF09VVOuSHUo/TscnM++THQ6zCT7msAjxCrWt80faX2luDZ3Y490WmIYaXZ8UONC5rpFADyMbYSiWjskYTZulj3YLh+8JsROqC40SrWJUfFGIuG69FV9xsbrsFrcA+Ozi+JkVcuLOVLeBh0akpJcV0kzBSWBu3LzNrve0vmRcTVZEKtyMFQGmMT4w3UonkkybZTPLpuu8zUFivNHR7Un/GbiQZl16w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y68Cm8OQOUB0aPluoiLTwS4A3QK4Xl5V3iGtCGk3TZ8=;
 b=jV45nVvxGT0ncsiIEC/+vbjLqhDhmnU1Z2kA4o3L7L4TSJX8TsIlurUCWXp87yMM39j6tbl/EMvUMkkEtnVwPxNSJZOO+ygsq2Xg0wxtfjrs3FDsy68cWPWzieCfelNXn1Y0Bu0QDUcexGWRX9rC0e8ElTCPq26qOjwoW0/vNNc=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DU0PR02MB9100.eurprd02.prod.outlook.com (2603:10a6:10:464::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 12:19:32 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd%6]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 12:19:31 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "roshs@qti.qualcomm.com" <roshs@qti.qualcomm.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Sumanth Gavini <sumanth.gavini@windriver.com>
Subject: RE: [OE-core][PATCH] rpm: disable the RPM 6 script interpreter
 dependency generator
Thread-Topic: [OE-core][PATCH] rpm: disable the RPM 6 script interpreter
 dependency generator
Thread-Index: AQHdYg3pJli/jOkiPE27C6gnbLkqULcJeaGw
Date: Thu, 22 Oct 2026 12:19:30 +0000
Message-ID: <DB5PR02MB102132000280F19DBB82F92ECEF652@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20261022084635.3702905-1-roshs@qti.qualcomm.com>
In-Reply-To: <20261022084635.3702905-1-roshs@qti.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DU0PR02MB9100:EE_
x-ms-office365-filtering-correlation-id: 46b3ac16-8dc6-4431-98d2-08df3036b996
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|6133799003|10067099003|18002099003|22082099003|261021121427099003|3023799007|261021123027099003|38070700021|11063799006|5023799004|261009221227099003|261009223027099003|56012099006|260925021911599003|260925022911599003|260925021311599003;
x-microsoft-antispam-message-info: NHsm0lylCsv+gP2X7A9gf1D87+4+WVoHOu2GN4UKGkD3sCxlhAdmpKXzNq8rqKIz/9yuRvdAuXQRlrscryw1deNMankBi7q5dG58ikIyrLLMs8Bh67qJxeQv02Sb2ypNE0fuoVCSSnXmLCDmRVG2a9PL0arOES3s1rTZ+bUQRIEZZwTiLnTiL+2Er2FhrHymCZ+LEuS1XsI51SNAZm+LSllMxcImnGVZOiQu41v5EGUmz3qQxCdEIKQXXGM7AvDmNALCMtWOSFBwugkod6ojVy0z/2Jjuj85H8VBmHeuuqLODQxXWaCpZOmI6NbvrTZ5A3b4SvMSWtC08dV2jyxtmFHFy0TxHomTUWtu4xKuRhbKSvn5rV+4tKVvMl9PYnvjojSsQ68xYt8y8O6dZGRuyan01j0SUDnwmwSzKtQsZD0JlyY+3JphDwYh6xmTU/HZI7RJXSB4I3T0Y68WtZ74ntIOPsWld3NFgIhPKogNDLa+wpZ09D9ZyRE/1TZItgjJ7WnHaiMziGJ8lbxAzThEJj4HKgZIV6Nz4FdyUORQ+b0cCs96tvYaGFfwEoHComp3J9h8BX6TKO0ehSPC8rNk8qI90xiik5FqhCESt8j0gY01RL1VrHGD71YcEIFjpl2iDsXywibwhGzNqyF2TWCPetNrrhvQckK/uw/lL56Ceyp9NrvheEW20+/jMrLCt35w2KXrqSfdTtNIAGDks9F/FCgJcFAg/BLPWgrJ3qDqB9k=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(10067099003)(18002099003)(22082099003)(261021121427099003)(3023799007)(261021123027099003)(38070700021)(11063799006)(5023799004)(261009221227099003)(261009223027099003)(56012099006)(260925021911599003)(260925022911599003)(260925021311599003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?31aRiLWx6LuL2KLbo/tbL2Gtl2jRSsT+X8USBLtWlXpXjB+NC5fGRUo6xRcI?=
 =?us-ascii?Q?+sEKc/J1WGXaa0qUFmJeqfEZwFNpAqnJ0b2ssarIP9m0++kILCeiGaMYy7VE?=
 =?us-ascii?Q?ljlrCN+R200Yi5w758ZjJczYqiubLU9hoK61daAci224zYIl62NmSMsYf0dv?=
 =?us-ascii?Q?5hfFVZQxF171of0KJZc6X+jNuGaBoeTtaeyHF4ou1lwiSkLFBVubCq+6tQ4X?=
 =?us-ascii?Q?IwdxC5QGrlLpvl6TbwXrvSTRGsWnEkkcpIqNQStHbogu9tMOku40qFZ5PEGP?=
 =?us-ascii?Q?62qiWhxJtVtCnR+poVCVUXqCujVhIi0RyaEItZibL+Kp3b2wBKLhm3+IIQja?=
 =?us-ascii?Q?o+OOXeTP4kAm7hBB8zi8J1S8F5zIg8IClBW5Gwv+5I9VM6RVDZ6Xch6QbClV?=
 =?us-ascii?Q?HmQui/StKXXiXoarysCBJmtXu/QP8Ej7EztTJCnRaEF+JhUhpa0KaeFIGi+e?=
 =?us-ascii?Q?+Dt1z+eVnMg/b/2XqtwMqOmA2pFTRRi0FN+53px3cic67kbVkw/+147855bn?=
 =?us-ascii?Q?keU54j5TM6NBbmYOw0NrWto/vtY0FYjWaPo4OqFciHWxY/vtROsuWdGek14I?=
 =?us-ascii?Q?Xs59dKMXCsZXgTpE5JhzKY8aPe1xer4dbUoobPDJ2Yi3MoJrrck6NRQT+OKE?=
 =?us-ascii?Q?H6+IHR6rlpAf9z+tzXjcQZZ6WdtKPXLRpYbZRqB90SUjUWRxXkHTEPy/ii+Y?=
 =?us-ascii?Q?nJS8jMcfqKUEeRe6bOzXIb5Ud/tbjDcs9V6OLJgWwWVO6MX2MAsY1YD/7TNm?=
 =?us-ascii?Q?0w+kOCcLF0FwSSUX/dvGlZjUmhbVsX7a0EOmJgn2ISX+jdhoQ+IXwObLsr/e?=
 =?us-ascii?Q?I6yCYGF8rt4koldveGi4xql4d9d3gUhrgZZhxVJ7fmr2bDouKM0PHEq3AK0J?=
 =?us-ascii?Q?uGbR7vm+085HuzdII395BUYLAn23lwFazJrSWVyFvV9nH9I9oDx3YLB29Sw3?=
 =?us-ascii?Q?Wk/0tMF55e8wlEgPJYHvwOHPsyVRs+SvxwoZkV6DJV7uUd0xIFl0y0xNMyz4?=
 =?us-ascii?Q?GVQCI2iTN2wQQLUdEtnrEK0gHqmaKmlrD6nLMMsTF0s/uKH1E61Xl0gIhhwg?=
 =?us-ascii?Q?VnZ8WDbDLLv8acv4kQVvJSN4ImnP0YHONGST4G8c5zGIoX1GVpd0ExFVuNxw?=
 =?us-ascii?Q?trZs9cXCwZXRhlBOK7LZjpp1cyvthBIq+80IwzZdvupyYbkfSE/LZ9uq3m5J?=
 =?us-ascii?Q?btM49ENt1dEui3UTYriMF0Ql59kVwK8sL5SHwqXEbye46/0jGyS3F7oCoheD?=
 =?us-ascii?Q?22o8nxrglKKIQ0dDuqrGubMCoHQP0BjosptoAQmXSCtM+N08z23ap27wlcAy?=
 =?us-ascii?Q?f0AKWlpwPFqXGUmvOTWjMM7IXEOG+TF2WaOadtSL7C6n5bL5/4nx9s3QnsYj?=
 =?us-ascii?Q?dLVWt4Nm9bum3pMz9x7FTQWBQMESOuSRhON+l9dDWxc8OAp7nYLdRqKS3fs9?=
 =?us-ascii?Q?RoBWpAjlUntpHshSeEem2Gn07cehV+0od9ZTpHUtoWIus+g5YGUR86+Mnm5Q?=
 =?us-ascii?Q?7hHv7Vrfk24mUCknBxnwS36HYWH9SlApjYvY8u0IIAHm2W0Z8gWJT1GCTia/?=
 =?us-ascii?Q?LLobWBf6G+iRklOJ1vnoTqHGMyeVWA+Q64TGvOJDLYfy599b0FbaKeDQVBV7?=
 =?us-ascii?Q?hOyr2ADsvbz7ifVhbwjgwLxtf7lZpmvTSn51+xUjCbM1fdBeXfFqiJprRMBV?=
 =?us-ascii?Q?JAEq4muw1MYPJf66UgWS+b67ig4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46b3ac16-8dc6-4431-98d2-08df3036b996
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2026 12:19:30.9587
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TPouhtSbGmFPhhN8h/ETHhvONYDxEZ0IHgxRMK8Utlv/8GdiUBdSJDXazwQBSLiz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB9100
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 12:19:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248441

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Roshan Sivakumar via lists.openembedded.org
> Sent: den 22 oktober 2026 10:47
> To: openembedded-core@lists.openembedded.org
> Cc: Sumanth Gavini <sumanth.gavini@windriver.com>; Roshan Sivakumar <rosh=
s@qti.qualcomm.com>
> Subject: [OE-core][PATCH] rpm: disable the RPM 6 script interpreter depen=
dency generator
>=20
> RPM 4 generated dependencies with the external __find_requires /
> __find_provides generator, which OE disabled entirely via
> _use_internal_dependency_generator 0. RPM 6 removed that mechanism; for
> v6-format packages only the internal fileattr generators run.
>=20
> rpm's script.attr generator therefore runs for the first time in OE
> builds. For every packaged executable whose first line is a #! shebang
> it emits an interpreter dependency. kernel-devsrc ships
> scripts/mksysmap (#!/bin/sed -f) as an executable, so its package gains:
>=20
>   Requires: /bin/sed
>=20
> OE manages build and runtime dependencies explicitly through
> DEPENDS / RDEPENDS and does not want these. They break real use cases:

I am not sure about the explicitly part. AFAIK, installed scripts with a=20
#!/bin/bash shebang leads to an automatic dependency on bash. Whether it=20
is RPM and/or bitbake doing that, I don't know.

>=20
> - The interpreter path is taken verbatim from the shebang. A #!/bin/sed
>   script requires /bin/sed, but under usrmerge the only provider
>   (busybox) offers /usr/bin/sed. The literal paths never match and the
>   package becomes uninstallable.
> - In the SDK the sole interpreter providers (busybox, coreutils, bash,
>   perl) are deliberately banned by target-sdk-provides-dummy, so these
>   auto-generated requires make -dev/-src packages uninstallable during
>   do_populate_sdk ("nothing provides /bin/sed needed by kernel-devsrc").
> - The requires are non-reproducible: they are only emitted when the
>   interpreter is scanned from the shebang during packaging, so the same
>   recipe can produce different packages between the reproducible A and
>   B builds.
>=20
> This is the same class of regression already handled for the pkgconfig
> generator; see "rpm: disable the RPM 6 pkgconfig dependency generator".
>=20
> Suppressing the generator from the rpmbuild command line
> (__requires_exclude / __script_requires set to %{nil}) is not reliable:
> rpm reloads the fileattr macros during dependency generation and
> clobbers the --define. Remove script.attr and its helper script.req
> from rpm's install lists via a source patch. This changes
> do_unpack/do_patch, so the whole rpm recipe and everything downstream
> re-hash and no stale rpm-native is reused.
>=20
> Signed-off-by: Roshan Sivakumar <roshs@qti.qualcomm.com>
> ---
>  ...he-script-interpreter-dependency-gen.patch | 72 +++++++++++++++++++
>  meta/recipes-devtools/rpm/rpm_6.0.2.bb        |  1 +
>  2 files changed, 73 insertions(+)
>  create mode 100644 meta/recipes-devtools/rpm/files/0004-Do-not-install-t=
he-script-interpreter-dependency-gen.patch
>=20
> diff --git a/meta/recipes-devtools/rpm/files/0004-Do-not-install-the-scri=
pt-interpreter-dependency-gen.patch b/meta/recipes-devtools/rpm/files/0004-=
Do-not-install-the-script-interpreter-dependency-gen.patch
> new file mode 100644
> index 0000000000..8c3d1769c8
> --- /dev/null
> +++ b/meta/recipes-devtools/rpm/files/0004-Do-not-install-the-script-
> interpreter-dependency-gen.patch
> @@ -0,0 +1,72 @@
> +From: Roshan Sivakumar <roshs@qti.qualcomm.com>
> +Date: Thu, 16 Oct 2026 00:00:00 +0000
> +Subject: [PATCH] Do not install the script interpreter dependency genera=
tor
> +
> +RPM 4 generated dependencies with the external __find_requires /
> +__find_provides generator, which OE disabled entirely via
> +_use_internal_dependency_generator 0. RPM 6 removed that mechanism; for
> +v6-format packages only the internal fileattr generators run.
> +
> +rpm's script.attr generator therefore runs for the first time in OE
> +builds. For every packaged executable whose first line is a #! shebang
> +it adds an interpreter dependency, e.g. a kernel-devsrc package shipping
> +scripts/mksysmap (#!/bin/sed -f) gains:
> +
> +  Requires: /bin/sed
> +
> +OpenEmbedded manages build and runtime dependencies explicitly via
> +DEPENDS/RDEPENDS and does not want these. They break real use cases:
> +
> +- The literal interpreter path is taken verbatim from the shebang, so a
> +  #!/bin/sed script requires /bin/sed while the only provider (busybox)
> +  offers /usr/bin/sed under usrmerge. The paths never match and the
> +  package is uninstallable.
> +- In the SDK the sole interpreter providers (busybox, coreutils, bash,
> +  perl) are deliberately banned by target-sdk-provides-dummy, so these
> +  auto-generated requires make -dev/-src packages uninstallable during
> +  do_populate_sdk ("nothing provides /bin/sed").
> +- The requires are non-reproducible: they are only emitted when the
> +  interpreter happens to be scanned from the shebang in the build
> +  sysroot, so the same recipe can produce different packages.
> +
> +This is the same class of problem fixed for pkgconfig.attr; see
> +"rpm: disable the RPM 6 pkgconfig dependency generator".
> +
> +Suppressing the generator from the rpmbuild command line is not
> +reliable: rpm reloads the fileattr macros during dependency generation
> +and clobbers any --define. Remove script.attr and its helper script.req
> +from rpm's install lists via a source patch. This changes
> +do_unpack/do_patch, so the whole rpm recipe and everything downstream
> +re-hash and no stale rpm-native is reused.
> +
> +Upstream-Status: Inappropriate [OE policy: dependencies are managed by
> the build system, not generated by rpmbuild]
> +
> +Signed-off-by: Roshan Sivakumar <roshs@qti.qualcomm.com>
> +---
> + fileattrs/CMakeLists.txt | 2 +-
> + scripts/CMakeLists.txt   | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/fileattrs/CMakeLists.txt b/fileattrs/CMakeLists.txt
> +--- a/fileattrs/CMakeLists.txt
> ++++ b/fileattrs/CMakeLists.txt
> +@@ -1,6 +1,6 @@
> + install(FILES
> +       debuginfo.attr desktop.attr elf.attr font.attr metainfo.attr
> +       ocaml.attr
> +-      rpm_macro.attr rpm_lua.attr script.attr sysusers.attr usergroup.a=
ttr
> ++      rpm_macro.attr rpm_lua.attr sysusers.attr usergroup.attr
> +       DESTINATION ${RPM_CONFIGDIR}/fileattrs
> + )
> +diff --git a/scripts/CMakeLists.txt b/scripts/CMakeLists.txt
> +--- a/scripts/CMakeLists.txt
> ++++ b/scripts/CMakeLists.txt
> +@@ -6,7 +6,7 @@ install(PROGRAMS
> +       check-buildroot check-rpaths check-rpaths-worker
> +       find-lang.sh find-requires find-provides
> +       ocamldeps.sh
> +-      fontconfig.prov script.req
> ++      fontconfig.prov
> +       rpm_macros_provides.sh
> +       rpmdb_dump rpmdb_load
> +       rpm2cpio.sh tgpg
> diff --git a/meta/recipes-devtools/rpm/rpm_6.0.2.bb b/meta/recipes-devtoo=
ls/rpm/rpm_6.0.2.bb
> index c27f58a0e8..6c80c839ca 100644
> --- a/meta/recipes-devtools/rpm/rpm_6.0.2.bb
> +++ b/meta/recipes-devtools/rpm/rpm_6.0.2.bb
> @@ -40,6 +40,7 @@ SRC_URI =3D "git://github.com/rpm-software-management/r=
pm;protocol=3Dhttps;branch=3Drp
>             file://0001-tools-elfdeps.cc-Remove-format-module.patch \
>             file://0001-macros.in-Set-_pkgverify_level-to-digest-as-RCPM-=
4.2.patch \
>             file://0003-Do-not-install-the-pkgconfig-dependency-generator=
.patch \
> +           file://0004-Do-not-install-the-script-interpreter-dependency-=
gen.patch \
>             "
>=20
>  PE =3D "1"
> --
> 2.34.1

//Peter

