Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.89])
 by mx.groups.io with SMTP id smtpd.web09.9217.1616396365688801823
 for <Openembedded-core@lists.openembedded.org>;
 Sun, 21 Mar 2021 23:59:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=AW6TcT3J;
 spf=pass (domain: kpit.com, ip: 40.107.138.89, mailfrom: sana.kazi@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wktiu88MSX/K+c2eApyaD+20iyVVu8Qp3sQttbZQF/TmEmkS4XeTgkWZOwfmR2K06ube1YP8uB9NK4edcRgmkGxhvZrlDsI9huZn2X/3255LrZYtyRqgyKkKxcnTHLT4s7y04mxj8EV7qc3FaN3N4rgL/rH/zNwm0CkZaIkIzRSmGFndNtpIWdP37GNIrDbjj1RLhJ7zHra3FEC051w0vkSFoXsJ32KBrvo7V1bO81umVMracqeu3ekMPcnu2E62Mc4vRdDuK6NzfD4UOYGhffONgW3DNuD9jOEsGbATMj0NW3m2NaUjcebTnDFrl3X682WqJFedNbwy1Xuaw7bXoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XGGuynfSSuBplDUYromZPJoXkOOhq6M01TqPbSgscFk=;
 b=O0q6ohSNU0MI3ZbT1ZbOy5LDB/egdFjkhLxWUkDck98+F8aXgYBJCIbu6/lnLttLpNO0hkGbMggJ2Ii7N8DPaHNAZKErHuHAuGaqbtMz4NNTqiceEC29OLeRwHhEqszt7HI086pWgaPQJ7mejRhOChQaAl55QVfVxmF0RsHbzn4Bd0qwWzt6EHP3QXY3+XOAxwADW8I3gMWIKlIeAB2Wnqc0oeXPar9tdxpiDMBuzHDgHIbyc8D3sH437ItVcw7KPqi9kle6RqLaMMhXL6YHlq6Fq6sOtdbHqaI6BsP16j5upg03keZOO52X0IoMz0HZ3jU4yvLfR4wNJjTXp/uepQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XGGuynfSSuBplDUYromZPJoXkOOhq6M01TqPbSgscFk=;
 b=AW6TcT3JJySnY4AmzMDVaF3Mt/ueLl3eCPCZa6v7WQRl5hPNm86Vg9E11j5hyCs6Q0Y3L65juLLJIxPHrYNZVhJUa3TP+MUfRsWop62SgQHoQ8fHbNWuy7hWrto1/eNG0vILubA6rq8CZPMSxUxKpdboudr1wXDYt04siuTnWWs=
Received: from BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:58::17)
 by BM1PR01MB3841.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:73::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 06:59:12 +0000
Received: from BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::6922:7ba0:39e9:85da]) by BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::6922:7ba0:39e9:85da%7]) with mapi id 15.20.3955.027; Mon, 22 Mar 2021
 06:59:12 +0000
From: "Sana Kazi" <Sana.Kazi@kpit.com>
To: Sana Kazi <Sana.Kazi@kpit.com>, "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>
CC: Nisha Parrakat <Nisha.Parrakat@kpit.com>, Harpritkaur Bhandari
	<Harpritkaur.Bhandari@kpit.com>
Subject: Re: [poky][zeus][PATCH] curl: Security fixes for CVE-2020-{8169/8177}
Thread-Topic: [poky][zeus][PATCH] curl: Security fixes for
 CVE-2020-{8169/8177}
Thread-Index: AQHW5OwjBwYnktd8eUm5W9wRZkFnGqqQB79K
Date: Mon, 22 Mar 2021 06:59:11 +0000
Message-ID: 
 <BMXPR01MB32212A55B0F923C7A7478D9799659@BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM>
References: <20210107115546.30737-1-sanak@kpit.com>
In-Reply-To: <20210107115546.30737-1-sanak@kpit.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kpit.com; dkim=none (message not signed)
 header.d=none;kpit.com; dmarc=none action=none header.from=kpit.com;
x-originating-ip: [2401:4900:5021:cea0:808d:e144:aea7:8434]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2413acf9-62c8-47ec-ce3c-08d8ecffffb9
x-ms-traffictypediagnostic: BM1PR01MB3841:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <BM1PR01MB38411697B4124943B002343F99659@BM1PR01MB3841.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:486;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 TJoDfSLuls9z8dx/f5MdiDEYHlioc8lKimZm1P+Q94asG4O5PUiZgD+2zghOiqec4xAUbGJLeTWDIE1thaCGnNubvsvaTEWW62/0i8sX8MBPZKZPt8Nm5INPsRShdNsYHoXx0lh1v5CGJ6r/VSdMBJ8zSe1vCRNqdOCn8UUHw+fceUuAHt02MTRQUMXbSk/71LGkeS67SFj35wi78BKl4/toh8M0f0xu7ircXFurY8C8Simu1xVeb0egXz5OvRzLHtg1ut5Vxe9JOxEUk7r5SOv6B75wZFz2vbcxbuB2pvulEK7cqeRscG5WK02vtlARJQfWyGXr70A9tUxs4eX9J+ohPdIykgHxqsiX8S9X6n0VP6n5kJadlI87TC6mhSRTnmTw+h++kZaSFTYOU/adjdw9l70JvV8LY7BOTplo0RBfwQyDbhLLXfZKMbBvhAFeMmzl4ILkmKa0cW79ftfR/pygQ1516p5mzwgTk/hiu0QRyEJjnuZ/OAaTF1FJAfEmOto0+e3R0T0KYcuyQIGtVxZr4bKAlzv269oO5BZIxNTOtS3VkyZaEBo7NvIuJL80iqNfBEW+eQZv1LEmI9mld+QdDLn0TC7R1+HB5ndZqp65/vllYzALXkUYh8VSFNDoJ6BeCgUvVMdV33mAH7l2aYoSI13dNxR+CggO2YGjJo5ylD6IPM/dNsEqiVxjBIugTtlkPzARPGiHHLJO3np+NmghISuvq790zPhZqxJHSz11t2HfCu4lBeA1E7emnE/Ru6CqbQYYXGnNX7dILAIavKJ8pM7+h/PU5D0duu2fksoumLiqGn4lFqaE0DCLk5FPwtJBB1cRabM7UnJJnZsGQg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(366004)(376002)(396003)(39850400004)(21615005)(316002)(52536014)(107886003)(186003)(2906002)(66446008)(4326008)(66556008)(64756008)(86362001)(5660300002)(66946007)(66476007)(8936002)(53546011)(8676002)(76116006)(966005)(33656002)(54906003)(9686003)(18265965003)(110136005)(15650500001)(7696005)(478600001)(55016002)(6506007)(66574015)(38100700001)(83380400001)(71200400001)(19627405001)(166002)(11965001)(134885004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?ZgGq7p3C2bxCb2+kiaUqoMpgK9rCsgSkjocXCJFTFFxcHBv5rinNBL4Pc2i9?=
 =?us-ascii?Q?KTa/04eVuLx7YK9rpRxzMNlXzC8+RRHz88gCjpd/0LnPD54514HGOUVobV+7?=
 =?us-ascii?Q?OxMi40d3sKFVOTi0hH2Nr4l+xXkZfzbn/kQVGk5AJpmAMLWDSkNlYhz13n1a?=
 =?us-ascii?Q?D+WLBhx8qzKThg1nCMY2jn4SCsQQtxJNNw0Tq+OUOB5RfTJffVlMzJsKTCgj?=
 =?us-ascii?Q?1VWTJlMIInQRvvXDMB77/snhCvkGEOeM63ESUzFGHp5QhsQ376CaVRn+ruJw?=
 =?us-ascii?Q?BlSOChnCwMAabfHs1wb0fuEUU8Ds9T3XmstHikpYJPidsEXtMVGzGqFChsp5?=
 =?us-ascii?Q?k0m/ezTTuRb2SheYwJ/2BhGTD9+r9ps78MC304bUVWYa5gDE7jyZCbePlVLM?=
 =?us-ascii?Q?vq4T8+xTpxeg08eYUYpHKOFR38A25I+j0tPcIdVxrUTeLAQ4QvKvlCBOgZNj?=
 =?us-ascii?Q?ikJxaUSyl6HYrwhbW/jjsz5LC+O8LHVjxYeWelUzgc8Y8yalr+qFdun3n9/1?=
 =?us-ascii?Q?hO3V8GjIauxvHdyL5axPcxNd7in3ZeRCgxNPJrXebyFF5BgZvdg+pj74eNgI?=
 =?us-ascii?Q?575Wh/99dokMiX652CZpWUAOBiDia6a6vGsrsEGCy4Peo+rrD5SiK3Y12aJb?=
 =?us-ascii?Q?uUkzHnEkvSG45fcfLQQqZFYIXB1OY9s3X5AtmxqQVVOR52nh5KODKSUDCILg?=
 =?us-ascii?Q?2FDyDtYGO/B4XRcZa05MziiBRrFp1Qf/ZhwdxZQL4W6328a8Nlf/chDEX7CQ?=
 =?us-ascii?Q?/oUvEGfAw4qANdvob0TywJmTRxRTxnmt68dAt47yEi36y+mD3yYfQyfdEx8V?=
 =?us-ascii?Q?QgNnL5iF/DrOVC0GXJs5CKsq9LieUIoBnSwu1jQFYz5A8vIPbA4E7jcnM9om?=
 =?us-ascii?Q?rCCHFASZ+NhhA1i0L9po9VC12fWt2AGOM/KLk80G2NVHHC4DyYSfdlYQNM6f?=
 =?us-ascii?Q?WLYHR/ST98cukfIGxoWvLOBNDlwPSbLw4kXfvp7F99x+Twn2m0IPxn0ourMH?=
 =?us-ascii?Q?wOLyFzCsrrvy8qOyBuR0UjJGSRLELvawFVEeIQ3LPbXqS8f26dpbPmXn8Iib?=
 =?us-ascii?Q?GXvq0a/WEXh7+smgglUNGeUfqcWOBHDgFE5/9vEEhfDTPl39VLpDe/Y9bkNa?=
 =?us-ascii?Q?zfFTC0S8A6U//UiaI8bsK+f2/LtEnKVDMFLdbGPQ7K9tT55FBe1dbDcEvcZu?=
 =?us-ascii?Q?h+5VWuQr6e5xAkRmyO8P2UyQYVyqO4ubegHd+5JYVkVIEA++Kld+TbnlFr8w?=
 =?us-ascii?Q?qUYnqQdpzZoLErPsciDhEGrb7Uo61t+sXwN9TkQjqpDFy6tUq+pNN2ogin0I?=
 =?us-ascii?Q?HAn6TdKYO1Am4BHwDt7Zru0tjno8NUCX8CcjEgzZM/tKNaq4Y/eqBK6b5Nua?=
 =?us-ascii?Q?d8s1KdhcbJROzyb+dgjNOHK7dbmD?=
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2413acf9-62c8-47ec-ce3c-08d8ecffffb9
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2021 06:59:11.4653
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YvZKQNruk251UHRSk+dnAOwNV9MI7pp17fo3MxtYG6LQt9quV8GLyoc8haHHtOkP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR01MB3841
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BMXPR01MB32212A55B0F923C7A7478D9799659BMXPR01MB3221INDP_"

--_000_BMXPR01MB32212A55B0F923C7A7478D9799659BMXPR01MB3221INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

Could you please review below patch for curl to be upstreamed


 Thanks & Regards,

 Sana Kazi
 KPIT Technologies Limited

________________________________
From: Sana Kazi <sanak@kpit.com>
Sent: Thursday, January 7, 2021 5:26 PM
To: Openembedded-core@lists.openembedded.org <Openembedded-core@lists.opene=
mbedded.org>; raj.khem@gmail.com <raj.khem@gmail.com>
Cc: Nisha Parrakat <Nisha.Parrakat@kpit.com>; Aditya Tayade <Aditya.Tayade@=
kpit.com>; Harpritkaur Bhandari <Harpritkaur.Bhandari@kpit.com>; Sana Kazi =
<Sana.Kazi@kpit.com>
Subject: [poky][zeus][PATCH] curl: Security fixes for CVE-2020-{8169/8177}

From: Armin Kuster <akuster@mvista.com>

Source: https://curl.haxx.se/
MR: 104472, 104458
Type: Security Fix
Disposition: Backport from https://github.com/curl/curl/commit/{600a8cded44=
7cd/8236aba58542c5f}
ChangeID: 1300924f7a64b22375b4326daeef0b686481e30c
Description:

- Affected versions: curl 7.20.0 to and including 7.70.0
- Not affected versions: curl < 7.20.0 and curl >=3D 7.71.0

Fixes both CVE-2020-8169 and CVE-2020-8177

(From OE-Core rev: f42702baee57ab3d1b7ab7833e72c7d56ad4ee94)

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Sana Kazi <sanak@kpit.com>
---
 .../curl/curl/CVE-2020-8169.patch             | 141 ++++++++++++++++++
 .../curl/curl/CVE-2020-8177.patch             |  67 +++++++++
 meta/recipes-support/curl/curl_7.66.0.bb      |   2 +
 3 files changed, 210 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2020-8169.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2020-8177.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2020-8169.patch b/meta/reci=
pes-support/curl/curl/CVE-2020-8169.patch
new file mode 100644
index 0000000000..774567c017
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2020-8169.patch
@@ -0,0 +1,141 @@
+From 600a8cded447cd7118ed50142c576567c0cf5158 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Thu, 14 May 2020 14:37:12 +0200
+Subject: [PATCH] url: make the updated credentials URL-encoded in the URL
+
+Found-by: Gregory Jefferis
+Reported-by: Jeroen Ooms
+Added test 1168 to verify. Bug spotted when doing a redirect.
+Bug: https://github.com/jeroen/curl/issues/224
+Closes #5400
+
+Upstream-Status: Backport
+https://github.com/curl/curl/commit/600a8cded447cd
+
+CVE: CVE-2020-8169
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ lib/url.c               |  6 ++--
+ tests/data/Makefile.inc |  1 +
+ tests/data/test1168     | 78 +++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 83 insertions(+), 2 deletions(-)
+ create mode 100644 tests/data/test1168
+
+Index: curl-7.69.1/lib/url.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- curl-7.69.1.orig/lib/url.c
++++ curl-7.69.1/lib/url.c
+@@ -2776,12 +2776,14 @@ static CURLcode override_login(struct Cu
+
+   /* for updated strings, we update them in the URL */
+   if(user_changed) {
+-    uc =3D curl_url_set(data->state.uh, CURLUPART_USER, *userp, 0);
++    uc =3D curl_url_set(data->state.uh, CURLUPART_USER, *userp,
++                      CURLU_URLENCODE);
+     if(uc)
+       return Curl_uc_to_curlcode(uc);
+   }
+   if(passwd_changed) {
+-    uc =3D curl_url_set(data->state.uh, CURLUPART_PASSWORD, *passwdp, 0);
++    uc =3D curl_url_set(data->state.uh, CURLUPART_PASSWORD, *passwdp,
++                      CURLU_URLENCODE);
+     if(uc)
+       return Curl_uc_to_curlcode(uc);
+   }
+Index: curl-7.69.1/tests/data/Makefile.inc
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- curl-7.69.1.orig/tests/data/Makefile.inc
++++ curl-7.69.1/tests/data/Makefile.inc
+@@ -129,7 +129,7 @@
+ test1136 test1137 test1138 test1139 test1140 test1141 test1142 test1143 \
+ test1144 test1145 test1146 test1147 test1148 test1149 test1150 test1151 \
+ test1152 test1153 test1154 test1155 test1156 test1157 test1158 test1159 \
+-test1160 test1161 test1162 test1163 test1164 test1165 \
++test1160 test1161 test1162 test1163 test1164 test1165 test1168 \
+ test1170 test1171 test1172 test1173 test1174 \
+ \
+ test1200 test1201 test1202 test1203 test1204 test1205 test1206 test1207 \
+Index: curl-7.69.1/tests/data/test1168
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- /dev/null
++++ curl-7.69.1/tests/data/test1168
+@@ -0,0 +1,78 @@
++<testcase>
++<info>
++<keywords>
++HTTP
++HTTP GET
++followlocation
++</keywords>
++</info>
++# Server-side
++<reply>
++<data>
++HTTP/1.1 301 This is a weirdo text message swsclose
++Date: Thu, 09 Nov 2010 14:49:00 GMT
++Server: test-server/fake
++Location: /data/11680002.txt
++Connection: close
++
++This server reply is for testing a simple Location: following
++
++</data>
++<data2>
++HTTP/1.1 200 Followed here fine swsclose
++Date: Thu, 09 Nov 2010 14:49:00 GMT
++Server: test-server/fake
++Content-Length: 52
++
++If this is received, the location following worked
++
++</data2>
++<datacheck>
++HTTP/1.1 301 This is a weirdo text message swsclose
++Date: Thu, 09 Nov 2010 14:49:00 GMT
++Server: test-server/fake
++Location: /data/11680002.txt
++Connection: close
++
++HTTP/1.1 200 Followed here fine swsclose
++Date: Thu, 09 Nov 2010 14:49:00 GMT
++Server: test-server/fake
++Content-Length: 52
++
++If this is received, the location following worked
++
++</datacheck>
++</reply>
++
++# Client-side
++<client>
++<server>
++http
++</server>
++ <name>
++HTTP redirect with credentials using # in user and password
++ </name>
++ <command>
++http://%HOSTIP:%HTTPPORT/want/1168 -L -u "catmai#d:#DZaRJYrixKE*gFY"
++</command>
++</client>
++
++# Verify data after the test has been "shot"
++<verify>
++<strip>
++^User-Agent:.*
++</strip>
++<protocol>
++GET /want/1168 HTTP/1.1
++Host: %HOSTIP:%HTTPPORT
++Authorization: Basic Y2F0bWFpI2Q6I0RaYVJKWXJpeEtFKmdGWQ=3D=3D
++Accept: */*
++
++GET /data/11680002.txt HTTP/1.1
++Host: %HOSTIP:%HTTPPORT
++Authorization: Basic Y2F0bWFpI2Q6I0RaYVJKWXJpeEtFKmdGWQ=3D=3D
++Accept: */*
++
++</protocol>
++</verify>
++</testcase>
diff --git a/meta/recipes-support/curl/curl/CVE-2020-8177.patch b/meta/reci=
pes-support/curl/curl/CVE-2020-8177.patch
new file mode 100644
index 0000000000..46dc13938b
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2020-8177.patch
@@ -0,0 +1,67 @@
+From 8236aba58542c5f89f1d41ca09d84579efb05e22 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Sun, 31 May 2020 23:09:59 +0200
+Subject: [PATCH] tool_getparam: -i is not OK if -J is used
+
+Reported-by: sn on hackerone
+Bug: https://curl.haxx.se/docs/CVE-2020-8177.html
+
+Upstream-Status: Backport
+CVE:CVE-2020-8177
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ src/tool_cb_hdr.c   | 22 ++++------------------
+ src/tool_getparam.c |  5 +++++
+ 2 files changed, 9 insertions(+), 18 deletions(-)
+
+Index: curl-7.69.1/src/tool_cb_hdr.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- curl-7.69.1.orig/src/tool_cb_hdr.c
++++ curl-7.69.1/src/tool_cb_hdr.c
+@@ -134,25 +134,11 @@
+       filename =3D parse_filename(p, len);
+       if(filename) {
+         if(outs->stream) {
+-          int rc;
+-          /* already opened and possibly written to */
+-          if(outs->fopened)
+-            fclose(outs->stream);
+-          outs->stream =3D NULL;
++          /* indication of problem, get out! */
++          free(filename);
++          return failure;
++      }
+
+-          /* rename the initial file name to the new file name */
+-          rc =3D rename(outs->filename, filename);
+-          if(rc !=3D 0) {
+-            warnf(outs->config->global, "Failed to rename %s -> %s: %s\n"=
,
+-                  outs->filename, filename, strerror(errno));
+-          }
+-          if(outs->alloc_filename)
+-            Curl_safefree(outs->filename);
+-          if(rc !=3D 0) {
+-            free(filename);
+-            return failure;
+-          }
+-        }
+         outs->is_cd_filename =3D TRUE;
+         outs->s_isreg =3D TRUE;
+         outs->fopened =3D FALSE;
+Index: curl-7.69.1/src/tool_getparam.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- curl-7.69.1.orig/src/tool_getparam.c
++++ curl-7.69.1/src/tool_getparam.c
+@@ -1807,6 +1807,11 @@ ParameterError getparameter(const char *
+       }
+       break;
+     case 'i':
++      if(config->content_disposition) {
++        warnf(global,
++              "--include and --remote-header-name cannot be combined.\n")=
;
++        return PARAM_BAD_USE;
++      }
+       config->show_headers =3D toggle; /* show the headers as well in the
+                                         general output stream */
+       break;
diff --git a/meta/recipes-support/curl/curl_7.66.0.bb b/meta/recipes-suppor=
t/curl/curl_7.66.0.bb
index a54e0536e9..506ae0eade 100644
--- a/meta/recipes-support/curl/curl_7.66.0.bb
+++ b/meta/recipes-support/curl/curl_7.66.0.bb
@@ -8,6 +8,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbe5d9e1419c4363f=
4b32037a2d3b7ffa"
 SRC_URI =3D "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
            file://CVE-2019-15601.patch \
+           file://CVE-2020-8169.patch \
+           file://CVE-2020-8177.patch \
 "

 SRC_URI[md5sum] =3D "c238aa394e3aa47ca4fcb0491774149f"
--
2.17.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

--_000_BMXPR01MB32212A55B0F923C7A7478D9799659BMXPR01MB3221INDP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Could you please review below patch for curl to be upstreamed</div>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">
<div>
<div></div>
<div name=3D"divtagdefaultwrapper" style=3D"font-family:Calibri,Arial,Helve=
tica,sans-serif; font-size:; margin:0">
<div><br>
<span style=3D"color:rgb(81,167,249)"></span></div>
<div></div>
<div style=3D"text-align:start; background-color:rgb(255,255,255); font-siz=
e:11pt; font-family:Calibri,sans-serif; margin:0px">
<span lang=3D"en-IN" style=3D"margin:0px; font-size:9pt; font-family:Arial,=
sans-serif; color:rgb(81,167,249); background-color:white"></span><span sty=
le=3D"margin:0px; font-size:10pt; font-family:Arial,sans-serif; background-=
color:white"><span style=3D"color:black; margin:0px; font-size:10pt; backgr=
ound-color:white">&nbsp;</span><span style=3D"margin:0px; font-size:10pt; b=
ackground-color:white"><font color=3D"#003366">Thanks
 &amp; Regards,</font></span></span><span style=3D"margin:0px; font-size:12=
pt; font-family:Arial,sans-serif; color:black; background-color:white"></sp=
an></div>
<div style=3D"margin:0px; font-size:15px; text-align:start; background-colo=
r:rgb(255,255,255)">
<p style=3D"font-size:11pt; font-family:Calibri,sans-serif; margin:0px"><sp=
an style=3D"margin:0px; font-size:10pt; font-family:Arial,sans-serif; color=
:black; background-color:white">&nbsp;</span><span style=3D"margin:0px; fon=
t-size:10pt; font-family:Arial,sans-serif; color:rgb(0,51,102); background-=
color:white">Sana
 Kazi<br>
<span style=3D"color:rgb(0,51,102); font-family:Arial,sans-serif; font-size=
:10pt">&nbsp;KPIT Technologies Limited</span><br>
</span></p>
</div>
<div><br>
</div>
</div>
</div>
</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Sana Kazi &lt;sanak@k=
pit.com&gt;<br>
<b>Sent:</b> Thursday, January 7, 2021 5:26 PM<br>
<b>To:</b> Openembedded-core@lists.openembedded.org &lt;Openembedded-core@l=
ists.openembedded.org&gt;; raj.khem@gmail.com &lt;raj.khem@gmail.com&gt;<br=
>
<b>Cc:</b> Nisha Parrakat &lt;Nisha.Parrakat@kpit.com&gt;; Aditya Tayade &l=
t;Aditya.Tayade@kpit.com&gt;; Harpritkaur Bhandari &lt;Harpritkaur.Bhandari=
@kpit.com&gt;; Sana Kazi &lt;Sana.Kazi@kpit.com&gt;<br>
<b>Subject:</b> [poky][zeus][PATCH] curl: Security fixes for CVE-2020-{8169=
/8177}</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Armin Kuster &lt;akuster@mvista.com&gt;<br>
<br>
Source: <a href=3D"https://curl.haxx.se/">https://curl.haxx.se/</a><br>
MR: 104472, 104458<br>
Type: Security Fix<br>
Disposition: Backport from <a href=3D"https://github.com/curl/curl/commit/{=
600a8cded447cd/8236aba58542c5f}">
https://github.com/curl/curl/commit/{600a8cded447cd/8236aba58542c5f}</a><br=
>
ChangeID: 1300924f7a64b22375b4326daeef0b686481e30c<br>
Description:<br>
<br>
- Affected versions: curl 7.20.0 to and including 7.70.0<br>
- Not affected versions: curl &lt; 7.20.0 and curl &gt;=3D 7.71.0<br>
<br>
Fixes both CVE-2020-8169 and CVE-2020-8177<br>
<br>
(From OE-Core rev: f42702baee57ab3d1b7ab7833e72c7d56ad4ee94)<br>
<br>
Signed-off-by: Armin Kuster &lt;akuster@mvista.com&gt;<br>
Signed-off-by: Steve Sakoman &lt;steve@sakoman.com&gt;<br>
Signed-off-by: Richard Purdie &lt;richard.purdie@linuxfoundation.org&gt;<br=
>
Signed-off-by: Sana Kazi &lt;sanak@kpit.com&gt;<br>
---<br>
&nbsp;.../curl/curl/CVE-2020-8169.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 141 ++++++++++++++++++<br>
&nbsp;.../curl/curl/CVE-2020-8177.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 67 +++++++++<br>
&nbsp;meta/recipes-support/curl/curl_7.66.0.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; |&nbsp;&nbsp; 2 +<br>
&nbsp;3 files changed, 210 insertions(+)<br>
&nbsp;create mode 100644 meta/recipes-support/curl/curl/CVE-2020-8169.patch=
<br>
&nbsp;create mode 100644 meta/recipes-support/curl/curl/CVE-2020-8177.patch=
<br>
<br>
diff --git a/meta/recipes-support/curl/curl/CVE-2020-8169.patch b/meta/reci=
pes-support/curl/curl/CVE-2020-8169.patch<br>
new file mode 100644<br>
index 0000000000..774567c017<br>
--- /dev/null<br>
+++ b/meta/recipes-support/curl/curl/CVE-2020-8169.patch<br>
@@ -0,0 +1,141 @@<br>
+From 600a8cded447cd7118ed50142c576567c0cf5158 Mon Sep 17 00:00:00 2001<br>
+From: Daniel Stenberg &lt;daniel@haxx.se&gt;<br>
+Date: Thu, 14 May 2020 14:37:12 +0200<br>
+Subject: [PATCH] url: make the updated credentials URL-encoded in the URL<=
br>
+<br>
+Found-by: Gregory Jefferis<br>
+Reported-by: Jeroen Ooms<br>
+Added test 1168 to verify. Bug spotted when doing a redirect.<br>
+Bug: <a href=3D"https://github.com/jeroen/curl/issues/224">https://github.=
com/jeroen/curl/issues/224</a><br>
+Closes #5400<br>
+<br>
+Upstream-Status: Backport<br>
+https://github.com/curl/curl/commit/600a8cded447cd<br>
+<br>
+CVE: CVE-2020-8169<br>
+Signed-off-by: Armin Kuster &lt;akuster@mvista.com&gt;<br>
+<br>
+---<br>
+ lib/url.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; |&nbsp; 6 ++--<br>
+ tests/data/Makefile.inc |&nbsp; 1 +<br>
+ tests/data/test1168&nbsp;&nbsp;&nbsp;&nbsp; | 78 ++++++++++++++++++++++++=
+++++++++++++++++<br>
+ 3 files changed, 83 insertions(+), 2 deletions(-)<br>
+ create mode 100644 tests/data/test1168<br>
+<br>
+Index: curl-7.69.1/lib/url.c<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- curl-7.69.1.orig/lib/url.c<br>
++++ curl-7.69.1/lib/url.c<br>
+@@ -2776,12 +2776,14 @@ static CURLcode override_login(struct Cu<br>
+ <br>
+&nbsp;&nbsp; /* for updated strings, we update them in the URL */<br>
+&nbsp;&nbsp; if(user_changed) {<br>
+-&nbsp;&nbsp;&nbsp; uc =3D curl_url_set(data-&gt;state.uh, CURLUPART_USER,=
 *userp, 0);<br>
++&nbsp;&nbsp;&nbsp; uc =3D curl_url_set(data-&gt;state.uh, CURLUPART_USER,=
 *userp,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CURLU_URLENCODE);<br>
+&nbsp;&nbsp;&nbsp;&nbsp; if(uc)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return Curl_uc_to_curlcode(uc);<br>
+&nbsp;&nbsp; }<br>
+&nbsp;&nbsp; if(passwd_changed) {<br>
+-&nbsp;&nbsp;&nbsp; uc =3D curl_url_set(data-&gt;state.uh, CURLUPART_PASSW=
ORD, *passwdp, 0);<br>
++&nbsp;&nbsp;&nbsp; uc =3D curl_url_set(data-&gt;state.uh, CURLUPART_PASSW=
ORD, *passwdp,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CURLU_URLENCODE);<br>
+&nbsp;&nbsp;&nbsp;&nbsp; if(uc)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return Curl_uc_to_curlcode(uc);<br>
+&nbsp;&nbsp; }<br>
+Index: curl-7.69.1/tests/data/Makefile.inc<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- curl-7.69.1.orig/tests/data/Makefile.inc<br>
++++ curl-7.69.1/tests/data/Makefile.inc<br>
+@@ -129,7 +129,7 @@<br>
+ test1136 test1137 test1138 test1139 test1140 test1141 test1142 test1143 \=
<br>
+ test1144 test1145 test1146 test1147 test1148 test1149 test1150 test1151 \=
<br>
+ test1152 test1153 test1154 test1155 test1156 test1157 test1158 test1159 \=
<br>
+-test1160 test1161 test1162 test1163 test1164 test1165 \<br>
++test1160 test1161 test1162 test1163 test1164 test1165 test1168 \<br>
+ test1170 test1171 test1172 test1173 test1174 \<br>
+ \<br>
+ test1200 test1201 test1202 test1203 test1204 test1205 test1206 test1207 \=
<br>
+Index: curl-7.69.1/tests/data/test1168<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- /dev/null<br>
++++ curl-7.69.1/tests/data/test1168<br>
+@@ -0,0 +1,78 @@<br>
++&lt;testcase&gt;<br>
++&lt;info&gt;<br>
++&lt;keywords&gt;<br>
++HTTP<br>
++HTTP GET<br>
++followlocation<br>
++&lt;/keywords&gt;<br>
++&lt;/info&gt;<br>
++# Server-side<br>
++&lt;reply&gt;<br>
++&lt;data&gt;<br>
++HTTP/1.1 301 This is a weirdo text message swsclose<br>
++Date: Thu, 09 Nov 2010 14:49:00 GMT<br>
++Server: test-server/fake<br>
++Location: /data/11680002.txt<br>
++Connection: close<br>
++<br>
++This server reply is for testing a simple Location: following<br>
++<br>
++&lt;/data&gt;<br>
++&lt;data2&gt;<br>
++HTTP/1.1 200 Followed here fine swsclose<br>
++Date: Thu, 09 Nov 2010 14:49:00 GMT<br>
++Server: test-server/fake<br>
++Content-Length: 52<br>
++<br>
++If this is received, the location following worked<br>
++<br>
++&lt;/data2&gt;<br>
++&lt;datacheck&gt;<br>
++HTTP/1.1 301 This is a weirdo text message swsclose<br>
++Date: Thu, 09 Nov 2010 14:49:00 GMT<br>
++Server: test-server/fake<br>
++Location: /data/11680002.txt<br>
++Connection: close<br>
++<br>
++HTTP/1.1 200 Followed here fine swsclose<br>
++Date: Thu, 09 Nov 2010 14:49:00 GMT<br>
++Server: test-server/fake<br>
++Content-Length: 52<br>
++<br>
++If this is received, the location following worked<br>
++<br>
++&lt;/datacheck&gt;<br>
++&lt;/reply&gt;<br>
++<br>
++# Client-side<br>
++&lt;client&gt;<br>
++&lt;server&gt;<br>
++http<br>
++&lt;/server&gt;<br>
++ &lt;name&gt;<br>
++HTTP redirect with credentials using # in user and password<br>
++ &lt;/name&gt;<br>
++ &lt;command&gt;<br>
++http://%HOSTIP:%HTTPPORT/want/1168 -L -u &quot;catmai#d:#DZaRJYrixKE*gFY&=
quot;<br>
++&lt;/command&gt;<br>
++&lt;/client&gt;<br>
++<br>
++# Verify data after the test has been &quot;shot&quot;<br>
++&lt;verify&gt;<br>
++&lt;strip&gt;<br>
++^User-Agent:.*<br>
++&lt;/strip&gt;<br>
++&lt;protocol&gt;<br>
++GET /want/1168 HTTP/1.1<br>
++Host: %HOSTIP:%HTTPPORT<br>
++Authorization: Basic Y2F0bWFpI2Q6I0RaYVJKWXJpeEtFKmdGWQ=3D=3D<br>
++Accept: */*<br>
++<br>
++GET /data/11680002.txt HTTP/1.1<br>
++Host: %HOSTIP:%HTTPPORT<br>
++Authorization: Basic Y2F0bWFpI2Q6I0RaYVJKWXJpeEtFKmdGWQ=3D=3D<br>
++Accept: */*<br>
++<br>
++&lt;/protocol&gt;<br>
++&lt;/verify&gt;<br>
++&lt;/testcase&gt;<br>
diff --git a/meta/recipes-support/curl/curl/CVE-2020-8177.patch b/meta/reci=
pes-support/curl/curl/CVE-2020-8177.patch<br>
new file mode 100644<br>
index 0000000000..46dc13938b<br>
--- /dev/null<br>
+++ b/meta/recipes-support/curl/curl/CVE-2020-8177.patch<br>
@@ -0,0 +1,67 @@<br>
+From 8236aba58542c5f89f1d41ca09d84579efb05e22 Mon Sep 17 00:00:00 2001<br>
+From: Daniel Stenberg &lt;daniel@haxx.se&gt;<br>
+Date: Sun, 31 May 2020 23:09:59 +0200<br>
+Subject: [PATCH] tool_getparam: -i is not OK if -J is used<br>
+<br>
+Reported-by: sn on hackerone<br>
+Bug: <a href=3D"https://curl.haxx.se/docs/CVE-2020-8177.html">https://curl=
.haxx.se/docs/CVE-2020-8177.html</a><br>
+<br>
+Upstream-Status: Backport<br>
+CVE:CVE-2020-8177<br>
+Signed-off-by: Armin Kuster &lt;akuster@mvista.com&gt;<br>
+<br>
+---<br>
+ src/tool_cb_hdr.c&nbsp;&nbsp; | 22 ++++------------------<br>
+ src/tool_getparam.c |&nbsp; 5 +++++<br>
+ 2 files changed, 9 insertions(+), 18 deletions(-)<br>
+<br>
+Index: curl-7.69.1/src/tool_cb_hdr.c<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- curl-7.69.1.orig/src/tool_cb_hdr.c<br>
++++ curl-7.69.1/src/tool_cb_hdr.c<br>
+@@ -134,25 +134,11 @@<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; filename =3D parse_filename(p, len);<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(filename) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(outs-&gt;stream) {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int rc;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* already opened =
and possibly written to */<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(outs-&gt;fopene=
d)<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fclose=
(outs-&gt;stream);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; outs-&gt;stream =
=3D NULL;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* indication of p=
roblem, get out! */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free(filename);<br=
>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return failure;<br=
>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+ <br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* rename the init=
ial file name to the new file name */<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rc =3D rename(outs=
-&gt;filename, filename);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(rc !=3D 0) {<br=
>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; warnf(=
outs-&gt;config-&gt;global, &quot;Failed to rename %s -&gt; %s: %s\n&quot;,=
<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; outs-&gt;filename, filename, strerror(errno))=
;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(outs-&gt;alloc_=
filename)<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Curl_s=
afefree(outs-&gt;filename);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(rc !=3D 0) {<br=
>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free(f=
ilename);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return=
 failure;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; outs-&gt;is_cd_filename =
=3D TRUE;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; outs-&gt;s_isreg =3D TRUE=
;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; outs-&gt;fopened =3D FALS=
E;<br>
+Index: curl-7.69.1/src/tool_getparam.c<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- curl-7.69.1.orig/src/tool_getparam.c<br>
++++ curl-7.69.1/src/tool_getparam.c<br>
+@@ -1807,6 +1807,11 @@ ParameterError getparameter(const char *<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; case 'i':<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(config-&gt;content_disposition) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; warnf(global,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; &quot;--include and --remote-header-name cannot be combined.\n&quot;)=
;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return PARAM_BAD_USE;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; config-&gt;show_headers =3D toggle; /=
* show the headers as well in the<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; general output stream */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
diff --git a/meta/recipes-support/curl/curl_7.66.0.bb b/meta/recipes-suppor=
t/curl/curl_7.66.0.bb<br>
index a54e0536e9..506ae0eade 100644<br>
--- a/meta/recipes-support/curl/curl_7.66.0.bb<br>
+++ b/meta/recipes-support/curl/curl_7.66.0.bb<br>
@@ -8,6 +8,8 @@ LIC_FILES_CHKSUM =3D &quot;<a href=3D"file://COPYING;md5=3D=
be5d9e1419c4363f4b32037a2d3b7ffa">file://COPYING;md5=3Dbe5d9e1419c4363f4b32=
037a2d3b7ffa</a>&quot;<br>
&nbsp;SRC_URI =3D &quot;<a href=3D""></a>http://curl.haxx.se/download/curl-=
${PV}.tar.bz2 \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-replace-krb5-config-with-pkg-config.patch">file://0001-repl=
ace-krb5-config-with-pkg-config.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2019-15601.patch">file://CVE-2019-15601.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2020-8169.patch">file://CVE-2020-8169.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2020-8177.patch">file://CVE-2020-8177.patch</a> \<br>
&nbsp;&quot;<br>
&nbsp;<br>
&nbsp;SRC_URI[md5sum] =3D &quot;c238aa394e3aa47ca4fcb0491774149f&quot;<br>
-- <br>
2.17.1<br>
<br>
</div>
</span></font></div>
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part ther=
eof. If you receive this message in error, please notify the sender immedia=
tely and delete all copies of this message. KPIT Technologies Ltd. does not=
 accept any liability for virus
 infected mails.
</body>
</html>

--_000_BMXPR01MB32212A55B0F923C7A7478D9799659BMXPR01MB3221INDP_--
