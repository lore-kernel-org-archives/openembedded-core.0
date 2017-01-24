Return-Path: <andrew.goodbody@cambrionix.com>
X-Greylist: delayed 39623 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 25 Jan 2017 05:32:02 UTC
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
	(mail-he1eur01on0120.outbound.protection.outlook.com [104.47.0.120])
	by mail.openembedded.org (Postfix) with ESMTP id 746EC71B48
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 05:32:02 +0000 (UTC)
Received: from LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM (10.166.249.144) by
	LOXP123MB0120.GBRP123.PROD.OUTLOOK.COM (10.166.249.147) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.860.13; Tue, 24 Jan 2017 15:59:46 +0000
Received: from LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM ([10.166.249.144]) by
	LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM ([10.166.249.144]) with mapi id
	15.01.0860.021; Tue, 24 Jan 2017 15:59:46 +0000
From: Andrew Goodbody <andrew.goodbody@cambrionix.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: configure error for glibc 2.25.2
Thread-Index: AdJ2St/27Lo07BMlSGusqMFehWa5EgADqQ+w
Date: Tue, 24 Jan 2017 15:59:46 +0000
Message-ID: <LOXP123MB0117B11AD747FFC1742D78C685750@LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM>
References: <LOXP123MB0117C97F4BE309CCAA9AFAF585750@LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM>
In-Reply-To: <LOXP123MB0117C97F4BE309CCAA9AFAF585750@LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=andrew.goodbody@cambrionix.com; 
x-originating-ip: [46.17.166.30]
x-ms-office365-filtering-correlation-id: f38e0a1c-b004-432e-31c4-08d4447204fc
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:(22001);SRVR:LOXP123MB0120;
x-microsoft-exchange-diagnostics: 1; LOXP123MB0120;
	7:eLFRrW5NyyS+7avEEccBVfoA6yK+0PcrukzzU9+A55EiKg6tblbdqtAP2sNU9Nt7XNDrgaDUTvKFYIhpsTzL6BoxN6ope5yymBTzl2NDOnuRIgzlP17FNqaSfcY+/Z4nSJTuFPDiIoT3sHvdFD+gI4ntV0OYeDrmm19HMgu1tdgCvUTHN3kNeHGulzcgp1U3VsCBFC8UocJ9mkm6Vtj79npxKvx90JhDl5a3l33njaKGuA6ye20xbSVJQuztiKTRtLOjL6xbQ0x9AV7SO7CPgGzb4URpdIHGH6+f064mAZyuBm4olHRGLEBxdbRibM65kswMrbN8yCP/FlPvVWZalAEXHgzksD+UP84i3sMOkGLEuyTN9ZJsfnhwuxPpjVUDfsp7sbmsjrZeq+8CDhGHQ+g2UxpVnD9ACBnVnHe6sRyqgAWiPPIQ7VZrN9Gocg5EhZHEmg2OBI6tVAds4/Vb9A==
x-microsoft-antispam-prvs: <LOXP123MB0120EA928F4FE5387E3A38DC85750@LOXP123MB0120.GBRP123.PROD.OUTLOOK.COM>
x-exchange-antispam-report-test: UriScan:(264703809997249);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040375)(2401047)(5005006)(8121501046)(3002001)(10201501046)(6041248)(20161123564025)(20161123560025)(20161123562025)(20161123555025)(2016111802025)(6072148)(6043046);
	SRVR:LOXP123MB0120; BCL:0; PCL:0; RULEID:; SRVR:LOXP123MB0120; 
x-forefront-prvs: 0197AFBD92
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(7916002)(39450400003)(39830400002)(39410400002)(199003)(189002)(13464003)(229853002)(106356001)(92566002)(101416001)(6436002)(6506006)(50986999)(2900100001)(76176999)(77096006)(54356999)(189998001)(6916009)(2950100002)(53936002)(38730400001)(105586002)(2351001)(1720100001)(5640700003)(110136003)(305945005)(74316002)(7736002)(7696004)(6116002)(5660300001)(102836003)(3846002)(66066001)(97736004)(2906002)(81166006)(81156014)(33656002)(8676002)(86362001)(6306002)(9686003)(122556002)(8936002)(55016002)(4326007)(3660700001)(3280700002)(68736007)(2501003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:LOXP123MB0120;
	H:LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: cambrionix.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: cambrionix.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2017 15:59:46.4247 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6eddda96-aa38-44c8-ab83-12529d9cab1f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOXP123MB0120
Subject: Re: configure error for glibc 2.25.2
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
X-List-Received-Date: Wed, 25 Jan 2017 05:32:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Further to this I see the following message in log.do_prepare_recipe_sysroo=
t.20511

WARNING: Manifest /home/andrew/src/camol3/camol/build/tmp-camol-glibc/sstat=
e-control/manifest-allarch-linux-libc-headers.populate_sysroot not found?

Which is quite correct as that file does not exist, however the following f=
ile does exist

/home/andrew/src/camol3/camol/build/tmp-camol-glibc/sstate-control/manifest=
-armv7at2hf-neon-linux-libc-headers.populate_sysroot

So it looks like linux-libc-headers is not being installed in the recipe sy=
sroot because it is looking for the manifest with the wrong arch.

Anyone know what could be going wrong here?

Andrew

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> I get the following configure error when trying to rebuild my tree today =
after
> doing a sync.
>=20
> Is this a core issue or something wrong in my tree?
>=20
> Thanks,
> Andrew
>=20
> | checking installed Linux kernel header files... missing or too old!
> | configure: error: GNU libc requires kernel header files from
> | Linux 3.2.0 or later to be installed before configuring.
> | The kernel header files are found usually in /usr/include/asm and
> | /usr/include/linux; make sure these directories use files from
> | Linux 3.2.0 or later.  This check uses <linux/version.h>, so
> | make sure that file was built correctly when installing the kernel head=
er
> | files.  To use kernel headers not from /usr/include/linux, use the
> | configure option --with-headers.
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_configure (log file is located at
> /home/andrew/src/camol3/camol/build/tmp-camol-glibc/work/armv7ahf-
> neon-camol-linux-gnueabi/glibc-initial/2.25-
> r0/temp/log.do_configure.30873)
> ERROR: Task (/home/andrew/src/camol3/camol/layers/openembedded-
> core/meta/recipes-core/glibc/glibc-initial_2.25.bb:do_configure) failed w=
ith
> exit code '1'
> NOTE: Tasks Summary: Attempted 779 tasks of which 0 didn't need to be
> rerun and 1 failed.
> NOTE: Writing buildhistory
>=20
> Summary: 1 task failed:
>   /home/andrew/src/camol3/camol/layers/openembedded-
> core/meta/recipes-core/glibc/glibc-initial_2.25.bb:do_configure
> Summary: There were 7 WARNING messages shown.
> Summary: There was 1 ERROR message shown, returning a non-zero exit
> code.
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

