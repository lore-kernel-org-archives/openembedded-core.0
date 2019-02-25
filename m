Return-Path: <prvs=95259e56f=Alistair.Francis@wdc.com>
X-Greylist: delayed 602 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 25 Feb 2019 21:49:48 UTC
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	by mail.openembedded.org (Postfix) with ESMTP id 510A06BF37
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 21:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1551131406; x=1582667406;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=Y61oARbka5NPAXg4/PvIsrG2okLw7qYw8qSobL83SX8=;
	b=HYWyhO9Ss30/Ue77YwLNjw6FaDzVFpM1JRHZacxKwRG/L9n+gAnNqgOa
	AGL1dGzjjeszhixRR+REWuP8biXze33JCJMO4WOMrxAgPnAM7DhIKXFFf
	w7q/SWyk9ksM+Y9LFZvorXEyIldW+UclpcEVIRrRji3UKpSFUJV16A6Wc
	+I7KCJsz+7T7OLVXEZGEJ6dTDnooCg799OCTIsyZ6kTEQx7lDQ+HPtWYg
	5A577+ktGnL0yYRspGmVRt9DSIx8X87oxqSWv1GWIzyB39/zXsDTojQdE
	56f909ctP+vEbbnrn2Xt1iaA6KnDH9/vJWwqgZvQUS145VvLhyjbpr10j A==;
X-IronPort-AV: E=Sophos;i="5.58,413,1544457600"; d="scan'208";a="200521908"
Received: from mail-cys01nam02lp2053.outbound.protection.outlook.com (HELO
	NAM02-CY1-obe.outbound.protection.outlook.com) ([104.47.37.53])
	by ob1.hgst.iphmx.com with ESMTP; 26 Feb 2019 05:39:51 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=/+six16Y6CSudtSrkLPEkKDOEq2/ssmq9juKVkjD+jk=;
	b=I7rfai2SaSJ+BalBdjw7XFUBAofx1NneurWW/V5cqfXtKZcwJbKBiFXPtSBB4G2jJME0G+B+xYsGWqDtp7c7Zf/bJCJ6hrUcHBclZMUVWIIpn35XV1meLLAax+viERcGbvHuw30GMasffZUQ/8aVyoTvfjunGbTTNpkUh44scPI=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0945.namprd04.prod.outlook.com (10.174.174.155) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1643.15; Mon, 25 Feb 2019 21:39:45 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::f55c:272b:6401:1b8c]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::f55c:272b:6401:1b8c%10]) with mapi id 15.20.1643.019;
	Mon, 25 Feb 2019 21:39:45 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] glibc: Remove ChangeLog diff from patch
Thread-Index: AQHUzVKfJ1ct1vZ430GrhFQg+E2v7Q==
Date: Mon, 25 Feb 2019 21:39:45 +0000
Message-ID: <20190225213911.20656-1-alistair.francis@wdc.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
x-clientproxiedby: BYAPR05CA0058.namprd05.prod.outlook.com
	(2603:10b6:a03:74::35) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4b36c1cb-3346-47f1-4bfc-08d69b69c224
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0945; 
x-ms-traffictypediagnostic: MWHPR04MB0945:
wdcipoutbound: EOP-TRUE
x-microsoft-exchange-diagnostics: =?iso-8859-1?Q?1; MWHPR04MB0945;
	23:3uicbRErYthwUOxqBhHpQRyVVPicKcc+8HJuKON?=
	=?iso-8859-1?Q?3VmpFOXoDbqVrobgAW61XVwz2STV1ggpVdsUE0DUMji70O0wrNkgmOFMT5?=
	=?iso-8859-1?Q?Ip4J28kLCqPl2v3eF2O7lYMGRLJ6itYNCiowf4cshdgGkttfF2Lkb6SRAc?=
	=?iso-8859-1?Q?xNIh6NUHh3K7K+3r1iVXH80D4S01xBzyN8JO24rOKISHFZZ7tSoVElV9sl?=
	=?iso-8859-1?Q?a3PKv0bYxgHwJMIGZHrfsTx7JwkS2MLhXAYWhSqvxs1AiQPb2Y79LwnYEj?=
	=?iso-8859-1?Q?wqbBH+WjQnWqwVjeJNNE7pPdeRCR7tcPFrCryAeqmXLzw+qA4ZDwbdBd4S?=
	=?iso-8859-1?Q?f3fSQ/1/yQgNyn+P1AqJ1cv3gw3aI/9+1l9bJBiDJ2GJcsjzvKikhLaqUu?=
	=?iso-8859-1?Q?cIoC3wD61eMYEegYrmfklkIcMrZ/vjvCcTjEsiA1o4onXBZGnYMQm2Z0um?=
	=?iso-8859-1?Q?alDdO3NqblYQJnPdv67IWI5ml37wfDV08eN4uTnWLQAqXvbNQLEu1Eo4ml?=
	=?iso-8859-1?Q?yXIwjpEo3z0e0efajvbxwYCrAwYZrMGDb2OdGsr2EUrqRA4kkxgB0J3mE9?=
	=?iso-8859-1?Q?/h8D9HA2yR6PHQC98Owtpwl/56kT4GWPvUHu4Hv/wzirPrmdxCWb1UWKyD?=
	=?iso-8859-1?Q?GTcV264vswQTV57luXcnME0uQLiWx7WUMKfA+yIut0VXau6mgsVBbB14BL?=
	=?iso-8859-1?Q?+Si5lYmHdYkwCSqcbyLvotPqPiI1z9+bncOH0AsdCspuHlleiGTnZjwAv3?=
	=?iso-8859-1?Q?r5r/XZfldQvFpfCyV8cNZ5ac1tuiKx4vpMU6dvChueh2CHoyPRj/z9Co52?=
	=?iso-8859-1?Q?HN/33ZSvjAms3R81vncvTaAgskktKKKq5+CIfxK6KgtTwnMI/jjtFUDgL0?=
	=?iso-8859-1?Q?8M2+tQ16URBNh1RmOcdHuP94EIyF8H9MVdtJZeQObjiWsAS5hnZkhMGcSd?=
	=?iso-8859-1?Q?KEA2FjsBuLSwdeyPVdySrVrMqNAYCvlh74pD2OworI9XoRu8mp+E2uTY/q?=
	=?iso-8859-1?Q?q3thVtppR2L97hMxoIymVqx89CZKBz+Sz/VbjupifeFlkRhicB3PHHdMgy?=
	=?iso-8859-1?Q?vITnR3IAoR3dUnE+BP9RYsWJ0LvEagw4a9VFZFhCPnwR1dJfssZd/zaIY/?=
	=?iso-8859-1?Q?1bWZMD6GLRWCX2oDBjpjqWEgup4znQ89FkmLyqU/GFO293/H7kOZhGaz8R?=
	=?iso-8859-1?Q?Zv6R4LIDdv+f/mYmIqksBB3oVNQHfTftc+rNBk5Hm1ZDdVDEzTHxPWLj/I?=
	=?iso-8859-1?Q?Z/wDUWYzqqbkCEqIBo5Z2mpYAue83eMn+PzPAtPFIeyTXCbdtRErAFEg3c?=
	=?iso-8859-1?Q?eA2KqSl+Ft7IpeARrt7aCs0Ux0PLCvvebZy5nIFg4FKwoQfHSYfgRAPDNA?=
	=?iso-8859-1?Q?L8PP0k40=3D?=
x-microsoft-antispam-prvs: <MWHPR04MB0945AF2B72C2668D04553E20907A0@MWHPR04MB0945.namprd04.prod.outlook.com>
x-forefront-prvs: 095972DF2F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(366004)(346002)(136003)(39860400002)(376002)(189003)(54534003)(199004)(256004)(50226002)(186003)(106356001)(8936002)(105586002)(26005)(316002)(8676002)(5660300002)(2501003)(53936002)(6916009)(2351001)(2906002)(6506007)(386003)(52116002)(71200400001)(71190400001)(99286004)(81166006)(81156014)(6512007)(25786009)(14454004)(68736007)(4326008)(3846002)(305945005)(486006)(66066001)(44832011)(72206003)(476003)(97736004)(2616005)(54906003)(102836004)(7736002)(478600001)(1076003)(6436002)(5640700003)(86362001)(6486002)(6116002)(36756003)(219803003)(207903002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0945;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: CMfWQnguJnlPCQlfD83er03HB7+pziCsUYc/8BctUOlHBPydMXgvoKQ2x5mILAmdzTO3mR7QswO4UtLAqgqgBU0O74HRCdAzIAuErkAqAE0xfOJAaeEFh6ghpO6tDo4pif1dDsGfvLQc6HcIlNt19F7+f9H4hAAn+U31GOThukHrwRRsehzaCM+pVVep2O+3QhB+qLC/xz6GjhrVylpWMYqu/o/ZymLUNrOudnwcpo6Ukgx9twIyH0o23I303+HEZMpfL/DiV/LgbuszqakAIoFWwWIuA6AogYmJEBp7+cIDkOST6TypsRkg2K7didO+3HwrXnieKLD3avaiyQZjmgHxdzopdAZMU53HMLX0pUmz234lKAh4XkH4RB1Kt5TVOREQgSFJjMNl57Ey5rYIqxENMmcgwSZ+HnEy4qjqp0E=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b36c1cb-3346-47f1-4bfc-08d69b69c224
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2019 21:39:44.7251 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0945
Subject: [PATCH] glibc: Remove ChangeLog diff from patch
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
X-List-Received-Date: Mon, 25 Feb 2019 21:49:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

To avoid conflicts with other forks of glibc remove the diff from the
ChangeLog.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 ...e-unsigned-Jcc-instructions-on-size-.patch | 21 +------------------
 1 file changed, 1 insertion(+), 20 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc/0001-x86-64-memcmp-Use-unsigned-=
Jcc-instructions-on-size-.patch b/meta/recipes-core/glibc/glibc/0001-x86-64=
-memcmp-Use-unsigned-Jcc-instructions-on-size-.patch
index 1c625f63c7..1a343149c0 100644
--- a/meta/recipes-core/glibc/glibc/0001-x86-64-memcmp-Use-unsigned-Jcc-ins=
tructions-on-size-.patch
+++ b/meta/recipes-core/glibc/glibc/0001-x86-64-memcmp-Use-unsigned-Jcc-ins=
tructions-on-size-.patch
@@ -21,33 +21,14 @@ Tested on x86-64 and x32, with and without --disable-mu=
lti-arch.
 CVE: CVE-2019-7309
 Upstream-Status: Backport
 Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
 ---
- ChangeLog                                | 11 ++++
  sysdeps/x86_64/memcmp.S                  | 20 +++---
  sysdeps/x86_64/x32/Makefile              |  3 +-
  sysdeps/x86_64/x32/tst-size_t-memcmp-2.c | 79 ++++++++++++++++++++++++
  5 files changed, 111 insertions(+), 10 deletions(-)
  create mode 100644 sysdeps/x86_64/x32/tst-size_t-memcmp-2.c
=20
-diff --git a/ChangeLog b/ChangeLog
-index 29bc4451ef..a0dcdac323 100644
---- a/ChangeLog
-+++ b/ChangeLog
-@@ -1,3 +1,14 @@
-+2019-02-04  H.J. Lu  <hongjiu.lu@intel.com>
-+
-+	[BZ #24155]
-+	CVE-2019-7309
-+	* NEWS: Updated for CVE-2019-7309.
-+	* sysdeps/x86_64/memcmp.S: Use RDX_LP for size.  Clear the
-+	upper 32 bits of RDX register for x32.  Use unsigned Jcc
-+	instructions, instead of signed.
-+	* sysdeps/x86_64/x32/Makefile (tests): Add tst-size_t-memcmp-2.
-+	* sysdeps/x86_64/x32/tst-size_t-memcmp-2.c: New test.
-+
- 2019-01-31  Carlos O'Donell  <carlos@redhat.com>
- 	    Torvald Riegel  <triegel@redhat.com>
- 	    Rik Prohaska  <prohaska7@gmail.com>
 diff --git a/sysdeps/x86_64/memcmp.S b/sysdeps/x86_64/memcmp.S
 index 1fc487caa5..1322bb3b92 100644
 --- a/sysdeps/x86_64/memcmp.S
--=20
2.20.1


