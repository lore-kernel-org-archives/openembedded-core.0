Return-Path: <andrew.goodbody@cambrionix.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0094.outbound.protection.outlook.com [104.47.2.94])
	by mail.openembedded.org (Postfix) with ESMTP id 90E2674197
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 16:00:12 +0000 (UTC)
Received: from LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM (10.166.249.144) by
	LOXP123MB0120.GBRP123.PROD.OUTLOOK.COM (10.166.249.147) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.860.13; Mon, 30 Jan 2017 15:44:17 +0000
Received: from LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM ([10.166.249.144]) by
	LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM ([10.166.249.144]) with mapi id
	15.01.0860.026; Mon, 30 Jan 2017 15:44:17 +0000
From: Andrew Goodbody <andrew.goodbody@cambrionix.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Thread-Topic: rootfs build failure
Thread-Index: AdJ3EskJ7+AXHmtST6e8g3Q1SUo4JQD/MBGA
Date: Mon, 30 Jan 2017 15:44:16 +0000
Message-ID: <LOXP123MB0117BE12F7F114C165F1AFF5854B0@LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM>
References: <LOXP123MB0117481CD1D9200877961EE985740@LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM>
In-Reply-To: <LOXP123MB0117481CD1D9200877961EE985740@LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=andrew.goodbody@cambrionix.com; 
x-originating-ip: [46.17.166.30]
x-ms-office365-filtering-correlation-id: be042acb-9b4b-4966-9e3a-08d44926d978
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:(22001);SRVR:LOXP123MB0120;
x-microsoft-exchange-diagnostics: 1; LOXP123MB0120;
	7:h8DBcsE5eyjM9Z8JPw7vAg6yrv3duUU6kjexgUvm7h+l9lLm+hxtRxCTIzzDaLqGrb2UD0lzqq63urhnHK4G6W1MYG4zloIlU6TE31NO6l40NmTcR48Rad/Q2Cn22qNaJw8+DTlSKzq+SA+LIvvPq8lsMRUU9B0FGPe/m93BhRMsfttsMitmJCT4IvdS1MsLLVwgidOxmHMGat40KvkIxSK2ri/f6YiI/BCWxkEhqaf3fU9gPzj/jHngIG+3ADFTAcujut6OwBTyocXChzI2RbIgi0hYYqZ/dbOnFAlbvBdmBxV8B6Ot+UDVCOQh3nPueyAtOOaa2torghp/etqu9dsNogUoZ8YDoJlrMgvyqymrYFWqfshY0bwxqzoW/nOGjFW/oYcu6UUnUDAxyEoAQJWvpPYSvvZ3MIJ5E+NAh/WogPhmOWkP5i9BQfoKk5p1fZ3QUp1D+DNWb8k0H9llFA==
x-microsoft-antispam-prvs: <LOXP123MB01203F305E22B2F4DF9C7B54854B0@LOXP123MB0120.GBRP123.PROD.OUTLOOK.COM>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040375)(2401047)(8121501046)(5005006)(3002001)(10201501046)(6041248)(20161123564025)(20161123562025)(20161123555025)(20161123560025)(2016111802025)(6072148)(6043046);
	SRVR:LOXP123MB0120; BCL:0; PCL:0; RULEID:; SRVR:LOXP123MB0120; 
x-forefront-prvs: 0203C93D51
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(7916002)(39410400002)(39450400003)(39830400002)(189002)(199003)(13464003)(105586002)(106356001)(3280700002)(2501003)(97736004)(3660700001)(8936002)(66066001)(122556002)(2906002)(33656002)(86362001)(5001770100001)(189998001)(305945005)(81166006)(8676002)(81156014)(3480700004)(92566002)(107886002)(6116002)(229853002)(7736002)(7116003)(74316002)(3846002)(102836003)(7696004)(50986999)(2900100001)(68736007)(2950100002)(53936002)(54356999)(101416001)(76176999)(55016002)(38730400001)(77096006)(9686003)(6436002)(6506006)(5660300001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:LOXP123MB0120;
	H:LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: cambrionix.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: cambrionix.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2017 15:44:16.9736 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6eddda96-aa38-44c8-ab83-12529d9cab1f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOXP123MB0120
Subject: Re: rootfs build failure
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
X-List-Received-Date: Mon, 30 Jan 2017 16:00:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Anyone know what the deal is here?

Andrew

> -----Original Message-----
> I now get the following build failure from do_rootfs
>=20
> The stack trace of python calls that resulted in this exception/failure w=
as:
> File: 'exec_python_func() autogenerated', lineno: 2, function: <module>
>      0001:
>  *** 0002:license_create_manifest(d)
>      0003:
> File: '/home/andrew/src/camol3/camol/layers/openembedded-
> core/meta/classes/license.bbclass', lineno: 48, function:
> license_create_manifest
>      0044:    pkg_dic =3D {}
>      0045:    for pkg in sorted(image_list_installed_packages(d)):
>      0046:        pkg_info =3D os.path.join(d.getVar('PKGDATA_DIR'),
>      0047:                                'runtime-reverse', pkg)
>  *** 0048:        pkg_name =3D os.path.basename(os.readlink(pkg_info))
>      0049:
>      0050:        pkg_dic[pkg_name] =3D
> oe.packagedata.read_pkgdatafile(pkg_info)
>      0051:        if not "LICENSE" in pkg_dic[pkg_name].keys():
>      0052:            pkg_lic_name =3D "LICENSE_" + pkg_name
> Exception: FileNotFoundError: [Errno 2] No such file or directory:
> '/home/andrew/src/camol3/camol/build/tmp-camol-
> glibc/pkgdata/whippet/runtime-reverse/kernel-module-configfs'
>=20
> ERROR: whippet-internal-image-1.0-r0 do_rootfs: Function failed:
> license_create_manifest
>=20
> /home/andrew/src/camol3/camol/build/tmp-camol-
> glibc/pkgdata/whippet/runtime-reverse/kernel-module-configfs indeed
> does not exist but
> /home/andrew/src/camol3/camol/build/tmp-camol-
> glibc/pkgdata/whippet/runtime-reverse/kernel-module-configfs-4.5.1 does
> exist.
>=20
> Andrew


