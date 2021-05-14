Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.49])
 by mx.groups.io with SMTP id smtpd.web08.8836.1620999531160937009
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 May 2021 06:38:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=KTOypKZ/;
 spf=pass (domain: windriver.com, ip: 40.107.236.49, mailfrom: tony.tascioglu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JRLnT1HI5za/aH5y+eHSfKshskfwazVmd5RRu8ZX+ncCHWlj772x2iITBvHbClAsPLyxcw1hQbErK+h5VZBeeXbbdd7dpXhyIFg2qx3kcMg8uis5aC7SFsqqLan4gmdiXzaGlA45EmjKS581Vj3nqGcMBekQvB3HLYiQjbSfU6cnt92saSklTGlPAw/+bF86D6xsIoeLqkin2Dg0drO3evZlIKHV4LiK+qDVRoVNETyEspahaKNR0zYdb0zBRwXnv2nogeRbHnpcbO10Dl25Zeqt1MC0nV2zb3BFoApPp99VMUr88F9q1HSC+btPfaVScxeMdeCJEKhHylCXVXIQ0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2wnuI2IFQZ4fruFYaB37ePNaVvkoC8v1QyUOiohoQ04=;
 b=H+9+X3QxgpxwdPJwmXgeKRE2zvBHTujAZfc89r1K9ayAXZd0owFrhwTxDpRV4C0qdyAc23wv97Gdqr/wcjTIpZRs5FlRDVnQj9jmyow9h17q31vXo05iPsVoO5TY4PfcrH43tu7zOyPcNLjZvR0GXg1ExiwLNoGv6I+Sq++pteFv7XUkEog1pfp4z5MiNBR582Q/AqLWEMD3LAFet9vlU5l8gLPJWBnIZywj0pzfiSAlmXaz5I9INvZNGWSxyoNU4VSIk6ucnHjCdrDbE6o/RqQyMd6gSipqUYzuXTGm+D4AacdwqwosgOMXgyWf9sQeonmUSxMz9GLaQzKQpRJ3ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2wnuI2IFQZ4fruFYaB37ePNaVvkoC8v1QyUOiohoQ04=;
 b=KTOypKZ/GN7BLW2nCmegV/K3lQFcYXCNDGnATm1IfrB2dzJuueg6nL2fCjgAEZWMA/1n+/72ZgN1lpL/iBvob5jOlqtZgBkxEl6d6S0z7FtKNfthvpCFcaetUP/C6Gpq0zhN7yRcm7Ind2u/MdK+1q0RRb7g0xndMK/MBhd4mMQ=
Received: from CY4PR11MB1272.namprd11.prod.outlook.com (2603:10b6:903:29::9)
 by CY4PR11MB1799.namprd11.prod.outlook.com (2603:10b6:903:125::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Fri, 14 May
 2021 13:38:49 +0000
Received: from CY4PR11MB1272.namprd11.prod.outlook.com
 ([fe80::7d75:2b21:18a7:256a]) by CY4PR11MB1272.namprd11.prod.outlook.com
 ([fe80::7d75:2b21:18a7:256a%9]) with mapi id 15.20.4129.028; Fri, 14 May 2021
 13:38:49 +0000
From: "Tony Tascioglu" <tony.tascioglu@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [hardknott][PATCH 1/3] libxml2: fix CVE-2021-3517
Thread-Topic: [OE-core] [hardknott][PATCH 1/3] libxml2: fix CVE-2021-3517
Thread-Index: AQHXSMMxw5E/7OEwKEK6nrb+wWOds6ri+wEQ
Date: Fri, 14 May 2021 13:38:49 +0000
Message-ID: 
 <CY4PR11MB1272E5788B8DCF54B6F36DBE84509@CY4PR11MB1272.namprd11.prod.outlook.com>
References: <167EF1314E1FDFB2.26402@lists.openembedded.org>
In-Reply-To: <167EF1314E1FDFB2.26402@lists.openembedded.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
x-originating-ip: [142.113.139.40]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ec0734d9-26cf-439a-9567-08d916dd9b11
x-ms-traffictypediagnostic: CY4PR11MB1799:
x-microsoft-antispam-prvs: 
 <CY4PR11MB17991A4811A804A8195D964284509@CY4PR11MB1799.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:651;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 eeuhacHRmDQudE/Qzo/M5WsUQjCEXg77HZUXCOov+255A1H4w72awYEnYOeG0sBDEn7xY8bYEaZZE8jVJcBcr8PMH0WHGTZJHs9ZLYe6C9bwtwQPjd9p18hgL9gNG+QaREU2bYhEwDORc8bEEDGoBHvgkeFkdoGu+9rjEoitgn1biLpImXsVc+tAmQ7rwPnxMCL0Ff907/j6Q0vxpfDASurjzjtxm1NYZzBfrSyI4Xcp0zx/bRLw3qQwiEwEDQXwru0u2he7ikOaNdwnih1r336kytpxIcqzfA1n4bHShi1FQsyEd6bPLsz5rauqWAyJzLgN4SQUPr5V32KwTaSsD71GQMGidX+jizyOQuzwmawNNkaoBoFfMVe6go1SFxW0Ogboz3uThNI63zkkXBHGF5O2Icrsa5JkkE2fw+pVvgBYU0gPuY+HUYUpnapJlE0RB+GXCcqngaMFRW6kZ+6tbtd1TnIUBNXPL1CCZCYyTGZMusDa+BwPWBFiQoc0xvGIhNUwhjUHu1CicJ8NQ6I5oWxxCU/zpUwoEb4555Kp8mUqjlQGhsF03uLC6APCiTXcPzG+3H3o1mz2o3obOeL+4GfK8UrLs9PaCz1wIDrJcOL2TOC+mB3y1whAjv0ZlIXw/t5pCj2umgKwh7h8qOp69kQSlLIJMfSN1RcrMyAJvVWCXEQzM+bAq1iUJOyrwAW32XwJh5T5YyEijgbZnWBcsw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR11MB1272.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39840400004)(136003)(366004)(396003)(346002)(8936002)(86362001)(8676002)(186003)(7696005)(38100700002)(53546011)(6506007)(33656002)(83380400001)(9686003)(55016002)(26005)(66446008)(76116006)(66946007)(66556008)(66476007)(64756008)(52536014)(316002)(478600001)(122000001)(71200400001)(5660300002)(6916009)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?OKvPupZPHOKiS3et3pAN5aEzx4B/mdis89q+nGtnMUSi51IpvrCPEUvlRAm5?=
 =?us-ascii?Q?nc//6bMfQRKYRp+DVI7woC4h3osdI//vP+OUWWpExzmZieNRAPMf6jp+ioo5?=
 =?us-ascii?Q?C/SssRM27gEL9HCpyQgwW3U9Ko8ZIZ+J431geox2s6YQA9ix89E/GRbsiD3z?=
 =?us-ascii?Q?wHNR2fPM1Oy8eSBVmJYayHwq2zwoC59WubOAzvclIVEcZd/I02C0j45RnnX0?=
 =?us-ascii?Q?Cf6elSZH/IPtNz16afaUpQIq/kxFgzxxCkyVzxfsAnSc/xZhp2Oh1fRSfsbK?=
 =?us-ascii?Q?kodayKT11VA9miapXQwBkepNetls6ugvtwj0AMCF7Xf8/N/QFugCacK9wi2/?=
 =?us-ascii?Q?OMicBc9YCp6atyva6Y+6gyoKI2rnuPzIqFr2sFKTxYMaabWyMxCKbh8mMK8e?=
 =?us-ascii?Q?9G5Je2c6uLSHl3aRtp0TSgRw9v4a+DvxYgp5xlNsvL/4DLMB7Q373Hwg9d3b?=
 =?us-ascii?Q?N5y9aaWgw20iqVqYs7L/J2SuYSnLwWKDtpcEFx4hNYvewm91EP3vjorTbTaL?=
 =?us-ascii?Q?Oqc6Yi/lGpaTXneCCgQ7s41uFJ6qve+1g8zrEv/ukFfbFtuIqVQcsnywfTUA?=
 =?us-ascii?Q?h9poLot6KSG6tsHbkkJyC2Yi48+v3yMHkEFk8YXhhWMF0MT66nHluKbQ2wFy?=
 =?us-ascii?Q?P6KIynsijarJmzsGBQ1muiFWA0j8S12Ir5+LCisAsXiMG467lsRjM2g1jEjz?=
 =?us-ascii?Q?nYzA6YBTTwmFFUd1duUL7PwFmKFblkfnyW0ABJogC5IrN8cYmZ+z7IkOkfRX?=
 =?us-ascii?Q?5MCosy0QcteEi1V/be+6dRh2YsQNOQl6y7n5a1Mn5R108biB9tM20fieo9F9?=
 =?us-ascii?Q?P2ICU1Q/Hqk7Aj7wb6Qvxx0Xv0ePq2Xh1WfntUvpbgu/LsdlJFvfvRaQthtA?=
 =?us-ascii?Q?fmS1SvHYgT4vTDzhlfdN7UIQ7oBkdebLbNROZOmIChjCCFarSmUrV/V00rTK?=
 =?us-ascii?Q?NGYAPlaJLDVTXAzagvsXk/DEBnIq2AVLs0mXrPtiKrfQpV0gGuanlMtqXuwI?=
 =?us-ascii?Q?odMkaU27tCU6NViUH2XZz7KPQ7S2jKU17rRQEvdqDmwIPWV2Va6LQP22Eq3P?=
 =?us-ascii?Q?E2++UNwtz28yveX5I1KFM5zybTVNGAnRnpiMUjdHMYIeyO92Hh8SHGFDjNKu?=
 =?us-ascii?Q?ErIlwxztoWU1C+iqSmrAeEJ3EhKVcVoges4Ugg2CCBObdrfGBHUWf5u/jSW+?=
 =?us-ascii?Q?44LhE5wygfQQ/k6+8IBqjOhJPZ/7vaymzBWJHl4zfKAmgSG9lnpcCWalIEC9?=
 =?us-ascii?Q?u5p1RGybxMWmT1jKKmKylmhFbDixgk5bL2hqrBHdLvVoELBSgIDfX0aXyUYH?=
 =?us-ascii?Q?SeI=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB1272.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec0734d9-26cf-439a-9567-08d916dd9b11
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2021 13:38:49.1851
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RV6XM03KNubG9iZ+Y+egrKf4BIBmdxi6LO8pxR6Vk34eGGgtZU9jaTGpm+jQ2kRn7RTp1W8jTwrwHKoepQp6VaM43K28W3ZMGz/ACL93eBg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1799
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

These patches are only going to hardknott, and upstream released a new vers=
ion yesterday that we can use for the master branch. The CVE fixes are pres=
ent in the new version, and these patches backport those fixes for libxml v=
ersion 2.9.10 in hardknott.
I am working on the uprev to 2.9.12, and will send it to master once tested=
.

Thanks,
Tony

-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Tony Tascioglu
Sent: Friday, May 14, 2021 9:15 AM
To: openembedded-core@lists.openembedded.org
Cc: MacLeod, Randy <Randy.MacLeod@windriver.com>; Tascioglu, Tony <Tony.Tas=
cioglu@windriver.com>
Subject: [OE-core] [hardknott][PATCH 1/3] libxml2: fix CVE-2021-3517

Fixes heap-based buffer overflow in xmlEncodeEntitiesInternal() in entities=
.c

CVE: CVE-2021-3517
Upstream-status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/=
bf22713507fe1fc3a2c4b525cf0a88c2dc87a3a2]

Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
---
 .../libxml/libxml2/CVE-2021-3517.patch        | 54 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.10.bb    |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2021-3517.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2021-3517.patch b/meta/re=
cipes-core/libxml/libxml2/CVE-2021-3517.patch
new file mode 100644
index 0000000000..b6204f655a
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2021-3517.patch
@@ -0,0 +1,54 @@
+From df3de1376585f7a273d70023f92a530395957324 Mon Sep 17 00:00:00 2001
+From: Joel Hockey <joel.hockey@gmail.com>
+Date: Sun, 16 Aug 2020 17:19:35 -0700
+Subject: [PATCH 1/3] Validate UTF8 in xmlEncodeEntities
+
+Code is currently assuming UTF-8 without validating. Truncated UTF-8=20
+input can cause out-of-bounds array access.
+
+Adds further checks to partial fix in 50f06b3e.
+
+Fixes #178
+
+CVE: CVE-2021-3517
+Upstream-Status: Backport=20
+[https://gitlab.gnome.org/GNOME/libxml2/-/commit/bf22713507fe1fc3a2c4b5
+25cf0a88c2dc87a3a2]
+
+Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
+---
+ entities.c | 16 +++++++++++++++-
+ 1 file changed, 15 insertions(+), 1 deletion(-)
+
+diff --git a/entities.c b/entities.c
+index d575e9d1..7cdbc4de 100644
+--- a/entities.c
++++ b/entities.c
+@@ -666,11 +666,25 @@ xmlEncodeEntitiesInternal(xmlDocPtr doc, const xmlCh=
ar *input, int attr) {
+ 	    } else {
+ 		/*
+ 		 * We assume we have UTF-8 input.
++		 * It must match either:
++		 *   110xxxxx 10xxxxxx
++		 *   1110xxxx 10xxxxxx 10xxxxxx
++		 *   11110xxx 10xxxxxx 10xxxxxx 10xxxxxx
++		 * That is:
++		 *   cur[0] is 11xxxxxx
++		 *   cur[1] is 10xxxxxx
++		 *   cur[2] is 10xxxxxx if cur[0] is 111xxxxx
++		 *   cur[3] is 10xxxxxx if cur[0] is 1111xxxx
++		 *   cur[0] is not 11111xxx
+ 		 */
+ 		char buf[11], *ptr;
+ 		int val =3D 0, l =3D 1;
+=20
+-		if (*cur < 0xC0) {
++		if (((cur[0] & 0xC0) !=3D 0xC0) ||
++		    ((cur[1] & 0xC0) !=3D 0x80) ||
++		    (((cur[0] & 0xE0) =3D=3D 0xE0) && ((cur[2] & 0xC0) !=3D 0x80)) ||
++		    (((cur[0] & 0xF0) =3D=3D 0xF0) && ((cur[3] & 0xC0) !=3D 0x80)) ||
++		    (((cur[0] & 0xF8) =3D=3D 0xF8))) {
+ 		    xmlEntitiesErr(XML_CHECK_NOT_UTF8,
+ 			    "xmlEncodeEntities: input not UTF-8");
+ 		    if (doc !=3D NULL)
+--
+2.25.1
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.10.bb b/meta/recipes-core=
/libxml/libxml2_2.9.10.bb
index 07ae68610c..ad612379b3 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.10.bb
@@ -24,6 +24,7 @@ SRC_URI =3D "http://www.xmlsoft.org/sources/libxml2-${PV}=
.tar.gz;name=3Dlibtar \
            file://CVE-2019-20388.patch \
            file://CVE-2020-24977.patch \
            file://fix-python39.patch \
+           file://CVE-2021-3517.patch \
            "
=20
 SRC_URI[libtar.md5sum] =3D "10942a1dc23137a8aa07f0639cbfece5"
--
2.29.2

