Return-Path: <andrew.goodbody@cambrionix.com>
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
	(mail-eopbgr50104.outbound.protection.outlook.com [40.107.5.104])
	by mail.openembedded.org (Postfix) with ESMTP id B8DB760796
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Oct 2017 10:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=CambrionixLtd.onmicrosoft.com; s=selector1-cambrionix-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=AbZ1lmIhjpBQy2AKFdAQv0iit8+8S1EHz8CF6NKAZ94=;
	b=kVrwaddv4AbEgsjzqq4Ezomzvthh92iFuK5cOG6nTTZdhvF1yxnpRSqqVUvpMm2ArFc2quU4T/HxB1jkOWlbJAvyHJ/7rlQNwBc9OVBIZ4xW5WEpQ+F8CYVJEoZ7L/yee1xyE08aTGJy+d4JdeyUCTbSfZC418qTUo5n5g7c+kU=
Received: from LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM (10.166.249.144) by
	LOXP123MB0871.GBRP123.PROD.OUTLOOK.COM (10.166.250.144) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.77.7; Tue, 3 Oct 2017 10:14:35 +0000
Received: from LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM ([10.166.249.144]) by
	LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM ([10.166.249.144]) with mapi id
	15.20.0077.018; Tue, 3 Oct 2017 10:14:35 +0000
From: Andrew Goodbody <andrew.goodbody@cambrionix.com>
To: "fupan.li@windriver.com" <fupan.li@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [oe] [meta-java][PATCH] openjdk-8-common: Fix the issue of
	building	failed adlc on host with gcc < 6
Thread-Index: AQHTOZNduSwsXCuXWUa0bv5wJhSzJKLR7LUQ
Date: Tue, 3 Oct 2017 10:14:34 +0000
Message-ID: <LOXP123MB0117058358878B6D1DD5307E85720@LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM>
References: <20170930022455.137406-1-fupan.li@windriver.com>
In-Reply-To: <20170930022455.137406-1-fupan.li@windriver.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=andrew.goodbody@cambrionix.com; 
x-originating-ip: [46.17.166.30]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; LOXP123MB0871;
	6:LgGT1ivXLUWTYBbxWLyfjJ+GB57QvbBt/WZBEBI3a2RAdQBHp22RjVbXMIGtPZbeiHwoEqP/eF5LjGHonBUXn7LYUF0NPn5x+0lQXCpRt8HQUfhK+V4O0AqFcJT+rq0m9FNlio1k6u2Jzq8WbeuCH/ioARrwx+YPnT6blt72tmCrkq4kkAlbdjLiNVZANgAsZjnlUXBc/ahJrcq9m2TXQEUmtukjupJfukZ3UAVaeB7QK7mfqSLTQ4yRA0MMeXUPDBgs8h3k6AkGIdAwfGu+EAz9NI4sND4IUqU1GebEVqQ3Lz33yED2/Ln8b8dw29ZJuXh7GHYqr40ARWTZy9kAYQ==;
	5:di5IKFPQ5yfOa/bsrjv4ayJTMe5MkvDqv0h82uDwEqjIFnPVGnFwGcwX0Cx7w6tzxV4QkGLaLSL9AU/uh+OhPMEsyBt3ocWD3d3gfUYxH+1Jloel/d9Owd9xSDwH1SM+QplnP4MtM8TcsCpoESkzSw==;
	24:pqxLOLRR1ccCCJVJQ5Ualjb6Ub0otpnbeOLIbGbYiwIYTamq5q24iZY5GOZwdfN1LODr+NNYjogJih9dPI2qOphy5kL00hN0O40lvTvZB3Y=;
	7:iZTq/T0oHbnhtRNz6eb5hlbuQNhC7RRGjC/JuCLOWvdVNdV1F9aAaXsUb58fc2zb+57GAotlAKq4/xgTmXDHj/WY7mUibwX6EZ6WXxK5zoDN4D5aGEEKr9CUBm/Qs7W5BKze05nFmWTB0VvbczRMRzlffcK9OBkqmsSgNk1gZmvlH9Jc0Nl01RxlAkuToZ6i/KuL5HsUXw4MBFNJepxldimpP86gyeRq0V1/bIEBNbA=
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-correlation-id: caf9b72d-68ca-4c25-0028-08d50a478c14
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254152)(2017082002075)(2017052603199)(201703131423075)(201702281549075);
	SRVR:LOXP123MB0871; 
x-ms-traffictypediagnostic: LOXP123MB0871:
x-exchange-antispam-report-test: UriScan:;
x-microsoft-antispam-prvs: <LOXP123MB08714F646975795081C0DA2585720@LOXP123MB0871.GBRP123.PROD.OUTLOOK.COM>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(3002001)(93006095)(93001095)(100000703101)(100105400095)(10201501046)(6041248)(20161123558100)(20161123560025)(2016111802025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(20161123564025)(20161123562025)(6072148)(6043046)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:LOXP123MB0871; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:LOXP123MB0871; 
x-forefront-prvs: 044968D9E1
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(39830400002)(376002)(346002)(13464003)(199003)(189002)(8936002)(2950100002)(305945005)(6246003)(230783001)(6506006)(66066001)(7736002)(74316002)(81166006)(105586002)(2900100001)(229853002)(189998001)(7696004)(14454004)(68736007)(9686003)(3660700001)(6436002)(53936002)(2906002)(110136005)(3280700002)(102836003)(3846002)(6116002)(55016002)(77096006)(101416001)(81156014)(2501003)(33656002)(106356001)(478600001)(76176999)(25786009)(316002)(5660300001)(86362001)(97736004)(54356999)(50986999);
	DIR:OUT; SFP:1102; SCL:1; SRVR:LOXP123MB0871;
	H:LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: cambrionix.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: cambrionix.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2017 10:14:34.9526 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6eddda96-aa38-44c8-ab83-12529d9cab1f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOXP123MB0871
Subject: Re: [oe] [meta-java][PATCH] openjdk-8-common: Fix the issue of building	failed adlc on host with gcc < 6
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
X-List-Received-Date: Tue, 03 Oct 2017 10:29:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Fupan Li <fupan.li@windriver.com>
>=20
> The patch recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-adlc-
> flags.patch
> had tried to fix this issue, and it tried to filter out the
> TARGET_FLAGS/TARGET_
> CXXFLGAS, but for the flags such as "-fno-lifetime-dse" was added to
> CFLAGS/CXXFLAGS,
> directly, thus that patch failed to filter it out.
>=20
> To fix this issue, it's better to add those GCC version specific flags to
> BUILD_CFLAGS/
> BUILD_CXXFLAGS and TARGET_CFLAGS/TARGET_CXXFLAGS separatedly,
> thus that patch can work
> as expected.
>=20
> Signed-off-by: Fupan Li <fupan.li@windriver.com>
> ---
>  recipes-core/openjdk/openjdk-8-common.inc | 36
> ++++++++++++++++++++-----------
>  1 file changed, 24 insertions(+), 12 deletions(-)
>=20
> diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-
> core/openjdk/openjdk-8-common.inc
> index 83828e1..c609232 100644
> --- a/recipes-core/openjdk/openjdk-8-common.inc
> +++ b/recipes-core/openjdk/openjdk-8-common.inc
> @@ -231,27 +231,39 @@ FLAGS_GCC7 =3D "-fno-lifetime-dse -fno-delete-null-
> pointer-checks"
>  # version is and only add the flags that are appropriate for that GCC
>  # version.
>=20
> -def version_specific_cflags(d):
> +def version_specific_cflags(d, toolchain):
>      extraflags =3D None
>      version =3D None
>=20
> -    if bb.data.inherits_class('native', d):
> -        from subprocess import Popen, PIPE
> +    from subprocess import Popen, PIPE
> +    cmd =3D d.expand('%s -dumpversion' % toolchain ).split()
> +    cc =3D Popen(cmd, stdout=3DPIPE, stderr=3DPIPE)
> +    version =3D cc.communicate()[0].decode('utf-8')[0]
>=20
> -        cmd =3D d.expand('${CC} -dumpversion').split()
> -        cc =3D Popen(cmd, stdout=3DPIPE, stderr=3DPIPE)
> -        version =3D cc.communicate()[0].decode('utf-8')[0]
> +    if version.isdigit():
> +        extraflags =3D d.getVar('FLAGS_GCC%d' % int(version), True) or '=
'
> +        return extraflags
> +    return ''
> +
> +python __anonymous() {
> +    if bb.data.inherits_class('native', d):
> +        toolchain =3D d.getVar('CC', True)
> +        extraflags =3D version_specific_cflags(d, toolchain)
> +        d.appendVar("CFLAGS", ' ' + extraflags)
> +        d.appendVar("CXXFLAGS", ' ' + extraflags)
>      else:
>          # in the cross case, trust that GCCVERSION is correct. This won'=
t
>          # work if the native toolchain is Clang, but as of this writing =
that
>          # doesn't work anyway.
>          version =3D d.getVar('GCCVERSION', expand=3DTrue)[0]
> -
> -    if version.isdigit():
>          extraflags =3D d.getVar('FLAGS_GCC%d' % int(version), True) or '=
'
> -        return extraflags
> -    return ''
> +        d.appendVar("TARGET_CFLAGS", ' ' + extraflags)
> +        d.appendVar("TARGET_CXXFLAGS", ' ' + extraflags)
> +
> +        toolchain =3D d.getVar('BUILD_CC', True)
> +        extraflags =3D version_specific_cflags(d, toolchain)
> +        d.appendVar("BUILD_CFLAGS", ' ' + extraflags)
> +        d.appendVar("BUILD_CXXFLAGS", ' ' + extraflags)
> +}
>=20
> -CFLAGS_append =3D " ${@version_specific_cflags(d)}"
> -CXXFLAGS_append =3D " ${@version_specific_cflags(d)}"
>  CXX_append =3D " -std=3Dgnu++98"
> --
> 2.11.0

I get the following build failure with the above patch now, backing it out =
makes the build work OK.

ERROR: /home/andrew/src/camol3/camol/layers/meta-java/recipes-core/openjdk/=
openjre-8_102b14.bb: Error executing a python function in <code>:

The stack trace of python calls that resulted in this exception/failure was=
:
File: '<code>', lineno: 13, function: <module>
     0009:__anon_35__home_andrew_src_camol3_camol_layers_openembedded_core_=
meta_classes_devshell_bbclass(d)
     0010:__anon_101__home_andrew_src_camol3_camol_layers_openembedded_core=
_meta_classes_sstate_bbclass(d)
     0011:__anon_313__home_andrew_src_camol3_camol_layers_openembedded_core=
_meta_classes_package_ipk_bbclass(d)
     0012:__anon_154__home_andrew_src_camol3_camol_layers_openembedded_core=
_meta_classes_siteinfo_bbclass(d)
 *** 0013:__anon_267__home_andrew_src_camol3_camol_layers_meta_java_recipes=
_core_openjdk_openjdk_8_common_inc(d)
     0014:__anon_108__home_andrew_src_camol3_camol_layers_openembedded_core=
_meta_classes_update_alternatives_bbclass(d)
File: '/home/andrew/src/camol3/camol/layers/meta-java/recipes-core/openjdk/=
openjdk-8-common.inc', lineno: 260, function: __anon_267__home_andrew_src_c=
amol3_camol_layers_meta_java_recipes_core_openjdk_openjdk_8_common_inc
     0256:        # work if the native toolchain is Clang, but as of this w=
riting that
     0257:        # doesn't work anyway.
     0258:        version =3D d.getVar('GCCVERSION', expand=3DTrue)[0]
     0259:        extraflags =3D d.getVar('FLAGS_GCC%d' % int(version), Tru=
e) or ''
 *** 0260:        d.appendVar("TARGET_CFLAGS", ' ' + extraflags)
     0261:        d.appendVar("TARGET_CXXFLAGS", ' ' + extraflags)
     0262:
     0263:        toolchain =3D d.getVar('BUILD_CC', True)
     0264:        extraflags =3D version_specific_cflags(d, toolchain)
Exception: ValueError: invalid literal for int() with base 10: 'l'

ERROR: Failed to parse recipe: /home/andrew/src/camol3/camol/layers/meta-ja=
va/recipes-core/openjdk/openjre-8_102b14.bb
ERROR: /home/andrew/src/camol3/camol/layers/meta-java/recipes-core/openjdk/=
openjdk-8_102b14.bb: Error executing a python function in <code>:

The stack trace of python calls that resulted in this exception/failure was=
:
File: '<code>', lineno: 13, function: <module>
     0009:__anon_35__home_andrew_src_camol3_camol_layers_openembedded_core_=
meta_classes_devshell_bbclass(d)
     0010:__anon_101__home_andrew_src_camol3_camol_layers_openembedded_core=
_meta_classes_sstate_bbclass(d)
     0011:__anon_313__home_andrew_src_camol3_camol_layers_openembedded_core=
_meta_classes_package_ipk_bbclass(d)
     0012:__anon_154__home_andrew_src_camol3_camol_layers_openembedded_core=
_meta_classes_siteinfo_bbclass(d)
 *** 0013:__anon_267__home_andrew_src_camol3_camol_layers_meta_java_recipes=
_core_openjdk_openjdk_8_common_inc(d)
     0014:__anon_108__home_andrew_src_camol3_camol_layers_openembedded_core=
_meta_classes_update_alternatives_bbclass(d)
File: '/home/andrew/src/camol3/camol/layers/meta-java/recipes-core/openjdk/=
openjdk-8-common.inc', lineno: 260, function: __anon_267__home_andrew_src_c=
amol3_camol_layers_meta_java_recipes_core_openjdk_openjdk_8_common_inc
     0256:        # work if the native toolchain is Clang, but as of this w=
riting that
     0257:        # doesn't work anyway.
     0258:        version =3D d.getVar('GCCVERSION', expand=3DTrue)[0]
     0259:        extraflags =3D d.getVar('FLAGS_GCC%d' % int(version), Tru=
e) or ''
 *** 0260:        d.appendVar("TARGET_CFLAGS", ' ' + extraflags)
     0261:        d.appendVar("TARGET_CXXFLAGS", ' ' + extraflags)
     0262:
     0263:        toolchain =3D d.getVar('BUILD_CC', True)
     0264:        extraflags =3D version_specific_cflags(d, toolchain)
Exception: ValueError: invalid literal for int() with base 10: 'l'

Andrew

