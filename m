Return-Path: <nikhil.r@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 554B2C87FCC
	for <webhook@archiver.kernel.org>; Thu, 31 Jul 2025 14:09:01 +0000 (UTC)
Received: from PNYPR01CU001.outbound.protection.outlook.com (PNYPR01CU001.outbound.protection.outlook.com [52.101.225.66])
 by mx.groups.io with SMTP id smtpd.web10.63022.1753970931499703874
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Jul 2025 07:08:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=bIeQyDBl;
 spf=pass (domain: kpit.com, ip: 52.101.225.66, mailfrom: nikhil.r@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aNs4nrpFnKv2qc5V61Hclse1PAZvESrIOFPi1K/kH2Ylvpx+848gPoT033rF/Vblu0QX3sjZZieLGSSsCjj3BY7NXbB0zxQ/CvhY+dgdbNrmvrvXix5gjTOMuPQz3doU35eez69hPb8mfD26P2wN1UAXPEzCT5yHo4Xpc5iF7cpS8QacXGGm688DQ43TmsprzGG1mIaqaUW9U6+kX1uw/taYyR3WzHzqDiDbDVKPDsxGk2zf8mxA3slgzekv93IMnuLApCiktCx3yB0Gh+5je55E4l9PfRxjKaUyqH7rysGynSBmy7g0D5SKaom0yHCK/v/T3WMb0yhZaOK+3y5ckw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TdRqR3HHdhm449TDJahPcdBHJ6mukCZ4e4CyayijVA8=;
 b=xZ2BrHCe43HaW0GeJZUgzokE/QwZca1INxF50WqUZYDmHNlwCPH6imtfY+ZhZ6lzYUnooU+pm0BoAXY4aBH/oVfZ0YNY8rGDKL8EWgSYuYSqKD/Bc3VRhkybgzInvJsOunBOBsHf01jElpxSAU3TG+pkMwLN9Mep+IItCY8snBfl1UU5UeVHn2EuYB02sk1OCxaRcu/OoC0J+665qfPBkQxTXH8oZeJwvYh/lDgmrTpuTpGHsiMBmgwKhjZGATKeK0vb9ZCNp9+Cpf1l386KRRFlsQfJacI5Od1jaibR2o4KZpjWc0UC0Mojd1H1cM5ypb2QLco7N5ajmrZZms9FMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TdRqR3HHdhm449TDJahPcdBHJ6mukCZ4e4CyayijVA8=;
 b=bIeQyDBlUkFMeQ2r4YOYujwOVlEuDxmbnqx0eSIuWSfuZD2uAPvBY/xtuxfbDU9MdQe2Ttvts9ThUmRqM4yRjHgK9aebQLK2x78mfCGz3mzolSRphO7WBojNGgAVLdTNOUoCySWJM7PTvSOJ6lZJo1+mKmQBG9RpZ/ubXo9rChQ=
Received: from MAZPR01MB8950.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:d1::12)
 by PN2PR01MB10079.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1f6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.14; Thu, 31 Jul
 2025 14:08:44 +0000
Received: from MAZPR01MB8950.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::d793:8439:6db7:9272]) by MAZPR01MB8950.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::d793:8439:6db7:9272%4]) with mapi id 15.20.8989.013; Thu, 31 Jul 2025
 14:08:42 +0000
From: Nikhil R <Nikhil.R@kpit.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: 
 =?Windows-1252?Q?[oe-core][ltp]_LTP_20250130_fails_to_run_due_to_missing_?=
 =?Windows-1252?Q?kirk_=96_should_kirk_be_packaged_separately=3F?=
Thread-Topic: 
 =?Windows-1252?Q?[oe-core][ltp]_LTP_20250130_fails_to_run_due_to_missing_?=
 =?Windows-1252?Q?kirk_=96_should_kirk_be_packaged_separately=3F?=
Thread-Index: AQHcAiPtZhslxtHV+06ypYe/0O0xEg==
Date: Thu, 31 Jul 2025 14:08:42 +0000
Message-ID: 
 <MAZPR01MB8950AA2D5C8F86D05817FDB9EE27A@MAZPR01MB8950.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MAZPR01MB8950:EE_|PN2PR01MB10079:EE_
x-ms-office365-filtering-correlation-id: aec94406-d0e2-49b5-4ac3-08ddd03bc1a0
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|31052699007|39142699007|366016|8096899003|13003099007|38070700018;
x-microsoft-antispam-message-info: 
 =?Windows-1252?Q?D3RMvYyBmiU0/RS/KX7Ch+D6EAqfDXF8Z23xyLWjtJltpnIiGF1wDhN3?=
 =?Windows-1252?Q?ywm3l4CLsLHN6e70FGCDcFinXuetg12bwf+D/TIOjtsTj17V8Q7W+843?=
 =?Windows-1252?Q?tKvJTWvakHrKDlr3qbtFXSHyHR+yBD1U/S/dCFDT6a/jJ1iX8q7+4cvw?=
 =?Windows-1252?Q?t33Ed2qo41bK3HsG8GnalN0TZYfHRTs9ltyZdMuNIDC27KtHJ5VP+gk4?=
 =?Windows-1252?Q?ir3bfACLqDZkTKE/YG1O2o5Bet4M3Xcgd66UPhw9Gt9zHjBeRi41Q/zt?=
 =?Windows-1252?Q?DPfGO8snU4cvpo1iRCEXagt2Ja7zkXcSQ1megdmvQ7ouGVdfMn0f/uww?=
 =?Windows-1252?Q?ZmMWiMs4dNKa+o6SnyB2g2m8VhRuWny1IJyl+i6tXPzTZl8YB2JR8eXo?=
 =?Windows-1252?Q?JZKruED9wUkIhsDig1ThVyswdeeCbXk+hiudhF+e3eCwwlQrOWqVUaG4?=
 =?Windows-1252?Q?SqEEnz1GSrthtrUG/28DXFU1Pyf3UFelRw3blnN5eFrQwrkHNiFDrP7n?=
 =?Windows-1252?Q?rzxaEZA8xuSiGTRWh8DcVNtHjLNPiIfSUfu8r+QRQRv+TuSKBuZtL++W?=
 =?Windows-1252?Q?3jkkY+e/rOfyCVNF07LcYJoDtQe8MilLvlJOStHhdzBuhExjt12NlbKu?=
 =?Windows-1252?Q?Xfawi+fiVD94OkgS5KTKMPQnDIYsqR3eMdKPAQ0sWftEyTgiqefR6jrh?=
 =?Windows-1252?Q?v5nJOsAK6C4q+ioDa/lR2vn6GHw/ESKvvEssSTPz11ETM9Cnbn3gEi4V?=
 =?Windows-1252?Q?9TFPbopXq2i8pfYPwSJ0EcHH+O0UvS5zU6X6R237BuLXrtSPbbSOVHkc?=
 =?Windows-1252?Q?8Rb1+tx40YaIWLE2KQRh0HEPtDH7mBymL7WdhAa7FhyCcHXNFqfFibVA?=
 =?Windows-1252?Q?KpdmiprW3HkQRjFPpvI/Gq8oqkRtCtHhWfVzbj93WHf2evoyG/ZNIyt3?=
 =?Windows-1252?Q?imGrlG414g5z8xbPn0Ifv40eneHQem8kd4NduendRYmDL3QqONHvSEZV?=
 =?Windows-1252?Q?Sj5tHPF6rvK3SIrI/9P16nHO4h39LjUTvzj7y6va2VOUdZfsRKwV4fr5?=
 =?Windows-1252?Q?EBMdRyTJcvqE1q0Of/kL2hhgBqrZRqWpLNbiJfEyx5yewJ/HSeCdEbET?=
 =?Windows-1252?Q?SQhVqZjVgvlkrM2DIKpyUaBU7ndqz9UkJXkAWorwCVkmjnj4g3QDOOcX?=
 =?Windows-1252?Q?52lPgPHe+KSVkJsPIc13rr8Um1n8iMqmdVur8nhkOMuPkfMehpu+Qkq/?=
 =?Windows-1252?Q?5mhPUMalxXeQS36H0jaT1gIEW1vo5Dw0t1TbXTda/S4YikpmeH88mN7e?=
 =?Windows-1252?Q?V28mKfdtkrqJUD0PPE/HS13+QZASMhxctTL/xaRS4s+sLwtuJOc28fmB?=
 =?Windows-1252?Q?sc7IrZg8OVRlUEU/fducb84pqPJGDTsA/+TWbYWdjYKcnAyEtfbVgFqz?=
 =?Windows-1252?Q?0lGMVVZdZlOmNzJq8i6cito1RkftLQhHPwv8MnOcjWmSg7M+/ccDftWe?=
 =?Windows-1252?Q?mWeREcCJo7HvtWR298CYSBbwnvK4oRsTKfP86eXxXAYJBpbZ2cZwK8K6?=
 =?Windows-1252?Q?h3NuoK/yyZk4JShQJEedpR75zuFyQeJtDEE6YjfB3AZwSREOowdUrWTJ?=
 =?Windows-1252?Q?HPE=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MAZPR01MB8950.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(31052699007)(39142699007)(366016)(8096899003)(13003099007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?vw7MvmyAZYfjSqabLBo2fRyES9tULehbNmFQkFp3i2k/cZV+YCVqIfPm?=
 =?Windows-1252?Q?ZLCjuw+TV9iU4GJEcZfR2YQh4+a03xEyJTHYz+TwakchUvaIgfdB6DNt?=
 =?Windows-1252?Q?lYlH4i8CFaWMN5x/EV8DObSa94UvPQHt/FBQeInvdU6fgZiC1++7gRr0?=
 =?Windows-1252?Q?Kw1DD5imxfxFRq+Udhmtq7ImRDAuaP8f5Xx9TR5K8Sa2GmP0T5T3AGql?=
 =?Windows-1252?Q?zwhIh6exW+9s9hre3Khr+VujWYc/YS67IgMvOg+fSiqq9lvDyg3Jl4D0?=
 =?Windows-1252?Q?MqJUO5Mf91Rhjw5Q1KHUGvrHUPRnIDWPm/w57SF681geMKBbqr6tXXMH?=
 =?Windows-1252?Q?XSiH4S37/2WVErrDJXICMI9dHZE1inL9bc0DfAej2tpd3la6+kZ9PhLU?=
 =?Windows-1252?Q?w4G47w7JjqYc2Wkq8mqDwZFuCQwbE9vxiDgxzmI6+HsVHTlMMXhcU2xK?=
 =?Windows-1252?Q?OtAQr29UcBbYo3jyHxrb8Tdq19Hc29AKIraOsFr10UEkpIjlYNlmAY4m?=
 =?Windows-1252?Q?WkLgPdoAN4cXeJDSGuhw4YsyQEtQpmtQoALsTwPubFEsmUqH7wwUU9cD?=
 =?Windows-1252?Q?wy5jbIt7XciJg65KESPv6+DLW3cu5yrnHyN9np6bHqfZvAq4gItVDIIq?=
 =?Windows-1252?Q?jrITx6GfQpZkK+S9+oZpVlAxwI+A082SnJiWHTyRw2S8vIUq4XDGYpJ7?=
 =?Windows-1252?Q?JP3P56Qru5Z4mzoJ6JfE60jahCjBWhgJqlb2brCWxQjAMOW25KUuBd3T?=
 =?Windows-1252?Q?pn2yorm49H7cffj+vN5EQmhFpJK8K9lwXsNh/OhR1Cgh5O2avCZXPnh7?=
 =?Windows-1252?Q?Vga71DDP0n1X5FLPMKndocNweShl0xZetvG+aBoeytxQSmYZKzngR0jE?=
 =?Windows-1252?Q?7gQ3ZAtNfFEw3h6g+PxzBFGtqTEVnKMCKaFIWHEft+jfACXNzfh9tQE+?=
 =?Windows-1252?Q?gJw0PYbWW8i2imrc2h9f/NW4tF2/D8GyIZOJ3A+AAHDbruzGi8WFydq7?=
 =?Windows-1252?Q?ePKV4Zy1iFpnjex0mlVOmsnP9gLsWxrEiDDvDDqR28tV/nsJG+mUvmg/?=
 =?Windows-1252?Q?DympHjMpDEjLVX5Y70ViRkAJ8E3lUyYk45nGJNFp90PYYFiQ9g+pqapC?=
 =?Windows-1252?Q?vuES3gTwEF6iiDfM4ApGRCksjRSGFs3nzIrAMKYyp68wWDVJW4Jqk2BG?=
 =?Windows-1252?Q?U6Z5I8XzRyBjEzzVwR9CpDK0m3MgO3VWdrZdZJO9gIrFB4Wn94nfSctK?=
 =?Windows-1252?Q?+MdtSE2By2ZW7j6e3V2VeEBkAXLAy8zfAFrB+t4d+5oLKjSKyBQseSfL?=
 =?Windows-1252?Q?kRfpMjBEUCL01GA4V/9l7DG3LejyqYlCC7RxqsYWk7sf67QSVs9kWYz/?=
 =?Windows-1252?Q?5sAOue6P341TFdLhktxchJ82gMVrSs8OfvTRbyaa7MHfOwH6CmDYivl1?=
 =?Windows-1252?Q?Q7umzJ+026L1Y2QkSJnvIa+/y1smKpzvlUKS9MSIYvJt+ia9b078ZoeD?=
 =?Windows-1252?Q?pqjX6HQlSdRP3kJO+6V215lSLihjPlQgBc5Aw5bBadVA3JB2IS5aghTb?=
 =?Windows-1252?Q?sTyycHnvx5VTpciYD84rNfU//Hk2+K8ru4t5wa5YkHP5AfbmmvhKZipA?=
 =?Windows-1252?Q?McpIhbIsxoON6DDKDdTek2xOwtI3xIF0+BZsB0Be7EU/k/MXJB2IGgLz?=
 =?Windows-1252?Q?mzGXgZrFV4c=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MAZPR01MB8950AA2D5C8F86D05817FDB9EE27AMAZPR01MB8950INDP_"
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MAZPR01MB8950.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: aec94406-d0e2-49b5-4ac3-08ddd03bc1a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2025 14:08:42.6602
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dpKzKWmK9Smq4nmKnMueUKsa8x0O92UGxsupcieZCkhnj/aQr8KVdxSUehOnVhQgHk9aBfBCF8/eMvgZGJRyDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB10079
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 14:09:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221196

--_000_MAZPR01MB8950AA2D5C8F86D05817FDB9EE27AMAZPR01MB8950INDP_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

I=92m using the LTP 20250130 recipe from Poky (meta/recipes-extended/ltp) m=
aster branch, and running into an issue where the test framework doesn=92t =
work as expected.

While run the ltp tests via 'runltp', we get the following messages:

sh-5.1# ./runltp
-------------------------------------------
INFO: runltp script is deprecated, try kirk
https://github.com/linux-test-project/kirk


./runltp: line 804: /var/data/opt/ltp/bin/ltp-pan: No such file or director=
y
INFO: ltp-pan reported some tests FAIL
LTP Version: 20250130

       ###############################################################

            Done executing testcases.
            LTP Version:  20250130
       ###############################################################

-------------------------------------------
INFO: runltp script is deprecated, try kirk
https://github.com/linux-test-project/kirk
-------------------------------------------


It appears that the 'kirk' binary is expected for running the test scenario=
s, but it is not present in the installed in current LTP package

Do we need to add a separate recipe for 'kirk' support for ltp in Yocto?
Or is there a plan to integrate kirk directly into the existing LTP recipe?

Looking forward to your guidance.

 Regards,

 Nikhil R

 KPIT Technologies Limited

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

--_000_MAZPR01MB8950AA2D5C8F86D05817FDB9EE27AMAZPR01MB8950INDP_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
I=92m using the LTP 20250130 recipe from Poky (meta/recipes-extended/ltp) m=
aster branch, and running into an issue where the test framework doesn=92t =
work as expected.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
While run the ltp tests via 'runltp', we get the following messages:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
sh-5.1# ./runltp</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
-------------------------------------------</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
INFO: runltp script is deprecated, try kirk</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
https://github.com/linux-test-project/kirk</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
./runltp: line 804: /var/data/opt/ltp/bin/ltp-pan: No such file or director=
y</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
INFO: ltp-pan reported some tests FAIL</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
LTP Version: 20250130</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp;################################################=
###############</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Done executing testcases.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; LTP Version: &nbsp;20250130</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp;################################################=
###############</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
-------------------------------------------</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
INFO: runltp script is deprecated, try kirk</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
https://github.com/linux-test-project/kirk</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
-------------------------------------------</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
It appears that the 'kirk' binary is expected for running the test scenario=
s, but it is not present in the installed in current LTP package</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Do we need to add a separate recipe for 'kirk' support for ltp in Yocto? &n=
bsp;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Or is there a plan to integrate kirk directly into the existing LTP recipe?=
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Looking forward to your guidance.</div>
<div class=3D"elementToProof" id=3D"Signature">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"direction: ltr; text-align: left; text-indent: 0px; backgroun=
d-color: white; margin: 0px; font-family: Arial, sans-serif; font-size: 10p=
t; color: rgb(0, 51, 102);" class=3D"elementToProof">
<span style=3D"background-color: white;">&nbsp;Regards,</span></div>
<div style=3D"background-color: white; margin: 0px;" class=3D"elementToProo=
f">
<p style=3D"direction: ltr; text-align: left; text-indent: 0px; margin: 0px=
; font-family: Calibri, sans-serif; font-size: 11pt;" class=3D"elementToPro=
of">
<span style=3D"font-family: Arial, sans-serif; font-size: 10pt; color: blac=
k; background-color: white;">&nbsp;Nikhil R</span></p>
<p style=3D"direction: ltr; text-align: left; text-indent: 0px; margin: 0px=
; font-family: Calibri, sans-serif; font-size: 11pt;" class=3D"elementToPro=
of">
<span style=3D"font-family: Arial, sans-serif; font-size: 10pt; color: rgb(=
0, 51, 102); background-color: white;">&nbsp;KPIT Technologies Limited</spa=
n></p>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
</div>
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

--_000_MAZPR01MB8950AA2D5C8F86D05817FDB9EE27AMAZPR01MB8950INDP_--

