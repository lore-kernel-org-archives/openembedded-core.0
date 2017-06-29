Return-Path: <bevenson@melinkcorp.com>
X-Greylist: delayed 3620 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 29 Jun 2017 17:54:16 UTC
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0092.outbound.protection.outlook.com [104.47.38.92])
	by mail.openembedded.org (Postfix) with ESMTP id D528978200
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 29 Jun 2017 17:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=Melink.onmicrosoft.com; s=selector1-melinkcorp-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=upmh7yX/uIsKCVSwa1FwxB2gtUoAQD8A0eNPO5z+5rI=;
	b=dMmrDksA2X/L3wLwC6K9BP9NNalsDU1ah7Mpiud/DR6jj2hBvoKfW4+UeqQcunOh+FyGmZY2pfraF5st56EMtZLwI+GxKuPV4czKVe4rK+MhuG9BE3pouR93DEQD4nM96C8r1agJ6jF/lx5hSAeqeqb3Vd3gv+CZkwjhJaKXcA8=
Received: from DM5PR05MB2954.namprd05.prod.outlook.com (10.168.176.142) by
	DM5PR05MB3292.namprd05.prod.outlook.com (10.174.191.31) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1220.5; Thu, 29 Jun 2017 15:20:16 +0000
Received: from DM5PR05MB2954.namprd05.prod.outlook.com ([10.168.176.142]) by
	DM5PR05MB2954.namprd05.prod.outlook.com ([10.168.176.142]) with mapi id
	15.01.1220.014; Thu, 29 Jun 2017 15:20:16 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Thread-Topic: php: pyro: php fails to compile under pyro with empty
	PACKAGECONFIG
Thread-Index: AdLw6wW0UENFVIi3RYW4bZUPizOu0A==
Date: Thu, 29 Jun 2017 15:20:16 +0000
Message-ID: <DM5PR05MB295481F208B70161CD4A8DEEBBD20@DM5PR05MB2954.namprd05.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=melinkcorp.com;
x-originating-ip: [98.100.91.242]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM5PR05MB3292;
	7:0cKncKkFaZnS541TnlIkijXB6ffdPReTWnhXs5mT24Wvp/eyip+w6+2kFVUrtVcK0nNayO+1elivmDiCfdBksGd4/duUjSvNNTNqPoQGlPa4MTbURry3I1Vi4DR6FEdmaTZm0t2A1CFlNTZBzPl5jz/FGs0y0psLb9Tir5FzY6Y94L7EgMsa79Ta/N84+uKn/IaIL4zKEgVqVdMp5VfTbuCSbqPpzPgQbodFkA3tnDoXbe9dO0ymwi3hBjA4gW3uAfeS1VrBKU+nZWWYsAiqaTfH9Zr6NzrlsHK2epYdrxOGi9lh30YS/ivICpn/jwuFhXuBbTFG8vrFTM7HB7+BIDZHcQkHKaroQP3JNxiyqCoqb7oDAWCpGoxbhv97TBlwMjjG1nscSqsmaBgtpOel0Zf2yvgIo0GNuk0XnXHbzipY4KxeJUZHNC540hHj93meD9HcJJQfQJodD94dX5fF63eALs7pyNMcJdgdClhD5xAfU1+PEp5ggH7yWy/QxOr6WBMmfIELkWwPfC89yWu1V1aBAHZOsAkHGU008Rxuszn62pDiE3GIA3lN+O0QGDgzE49igBZwuZqBTj+UiJV1mKPD+6Jz1lU+Ix1xZrdTgmT/rUGK6BAzS1qrE+MRIx1JniR0FoRLm8p/nnD0s0s4kf7hQqiR3PpPRw6RJAExTCAKLKuZQ1j4o12z0jqKxnrz925P+da2K9flBmGF45CEbcUkkE7YHAWJrbniV76jAwh5F1hNiOPAxPlqju64Z+NYOPzEBvzJ0MpWtwCdJXqCzBkTj6lZB1swc4lnvfqqzaw=
x-ms-office365-filtering-correlation-id: 2168226e-0e34-4281-f763-08d4bf0258d8
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254075)(300000503095)(300135400095)(2017052603021)(201703131423075)(201703031133081)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:DM5PR05MB3292; 
x-ms-traffictypediagnostic: DM5PR05MB3292:
x-microsoft-antispam-prvs: <DM5PR05MB32929A945F85AD055615DD6FBBD20@DM5PR05MB3292.namprd05.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(133145235818549)(236129657087228);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(5005006)(8121501046)(3002001)(93006095)(93001095)(10201501046)(100000703101)(100105400095)(6041248)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(20161123564025)(20161123558100)(20161123560025)(20161123562025)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:DM5PR05MB3292; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:DM5PR05MB3292; 
x-forefront-prvs: 0353563E2B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(39830400002)(39410400002)(39400400002)(39450400003)(305945005)(74316002)(33656002)(53936002)(478600001)(77096006)(66066001)(189998001)(38730400002)(110136004)(86362001)(5660300001)(25786009)(7736002)(2501003)(6916009)(7696004)(2351001)(8936002)(8676002)(81166006)(6506006)(9686003)(6436002)(102836003)(50986999)(5640700003)(3280700002)(6116002)(54356999)(55016002)(99286003)(14454004)(3660700001)(2906002)(3846002)(2900100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR05MB3292;
	H:DM5PR05MB2954.namprd05.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: melinkcorp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2017 15:20:16.5817 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d06db0f9-efcc-42b5-9f8c-c934a01c9bfd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR05MB3292
Subject: php: pyro: php fails to compile under pyro with empty PACKAGECONFIG
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
X-List-Received-Date: Thu, 29 Jun 2017 17:54:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I am on poky/morty and I am doing some test builds to attempt to stay up to=
 date with the latest branches.  I am having issues building php.  For my b=
uild, I don't want any of the PACKAGECONFIG features and I add curl support=
, so I have a bbappend with the following:

DEPENDS +=3D " \
    curl \
    "

EXTRA_OECONF +=3D " \
    --with-curl=3D${STAGING_LIBDIR}/.. \
    "

PACKAGECONFIG =3D ""

This builds without error under morty, but under pyro I get the following e=
rrors:

| ERROR: oe_runmake failed
| /<...>/build/tmp/work/armv5e-poky-linux-gnueabi/php/5.6.26-r0/recipe-sysr=
oot-native/usr/bin/arm-poky-linux-gnueabi/../../libexec/arm-poky-linux-gnue=
abi/gcc/arm-poky-linux-gnueabi/6.3.0/ld: ext/sqlite3/libsqlite/sqlite3.o: u=
ndefined reference to symbol 'dlsym@@GLIBC_2.4'
| /<...>/build/tmp/work/armv5e-poky-linux-gnueabi/php/5.6.26-r0/recipe-sysr=
oot/lib/libdl.so.2: error adding symbols: DSO missing from command line
| collect2: error: ld returned 1 exit status
| make: *** [sapi/cgi/php-cgi] Error 1
| make: *** Waiting for unfinished jobs....
| /<...>/build/tmp/work/armv5e-poky-linux-gnueabi/php/5.6.26-r0/recipe-sysr=
oot-native/usr/bin/arm-poky-linux-gnueabi/../../libexec/arm-poky-linux-gnue=
abi/gcc/arm-poky-linux-gnueabi/6.3.0/ld: ext/sqlite3/libsqlite/sqlite3.o: u=
ndefined reference to symbol 'dlsym@@GLIBC_2.4'
| /<...>/build/tmp/work/armv5e-poky-linux-gnueabi/php/5.6.26-r0/recipe-sysr=
oot/lib/libdl.so.2: error adding symbols: DSO missing from command line
| collect2: error: ld returned 1 exit status
| make: *** [sapi/cli/php] Error 1
| /<...>/build/tmp/work/armv5e-poky-linux-gnueabi/php/5.6.26-r0/recipe-sysr=
oot-native/usr/bin/arm-poky-linux-gnueabi/../../libexec/arm-poky-linux-gnue=
abi/gcc/arm-poky-linux-gnueabi/6.3.0/ld: ext/sqlite3/libsqlite/sqlite3.o: u=
ndefined reference to symbol 'dlsym@@GLIBC_2.4'
| /<...>/build/tmp/work/armv5e-poky-linux-gnueabi/php/5.6.26-r0/recipe-sysr=
oot/lib/libdl.so.2: error adding symbols: DSO missing from command line
| collect2: error: ld returned 1 exit status
| make: *** [sapi/fpm/php-fpm] Error 1
| ERROR: Function failed: do_compile (log file is located at /<...>/build/t=
mp/work/armv5e-poky-linux-gnueabi/php/5.6.26-r0/temp/log.do_compile.28830)
NOTE: recipe php-5.6.26-r0: task do_compile: Failed

I get the same error regardless of whether I build version 5.6.26 or versio=
n 7.1.0.  What I find odd with this error is that it is failing when loadin=
g symbols for sqlite3, but I explicitly remove sqlite3 from PACKAGECONFIG. =
 If I use the default PACKAGECONFIG settings, then php builds without error=
.  Has anyone else seen similar errors?

Thanks,
Bryan

