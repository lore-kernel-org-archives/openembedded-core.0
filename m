Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.75])
 by mx.groups.io with SMTP id smtpd.web11.466.1616175459326672996
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 19 Mar 2021 10:37:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=FyEbijQG;
 spf=pass (domain: kpit.com, ip: 40.107.138.75, mailfrom: sana.kazi@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VmPbaJe8C7lxn3Hyqf2t1leD/r9mwiInN8OQBI/xJUoqDaz++dF1xsoSrAJfbbYvJw98yxToVD9bHILyk6cTdZFFyvqvIxHRw4twdZAZKlGKT7VmNENIa4b/IL5Jzc2tE6O8Tuc2pTga96n1PfxT+Mr0ng4OcKgzkIEVR1its2P9ulFfKbfSh1ZlREDJVgHCnBbQe9HE2vEewvX2feb8MzB0pYny68q/3h0/nieGlZ7Ae78QmE28ftiU82oxmMPkBL9K/PD/zp3gZDt6uU/4zOUp6ff1jYD3A4YMDImQiniF6m1sbkKqJjnDMSKiE2YHaiayxEkdCbIlzIbxDUjjWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g5CMvE2maAKfN6w0+Torsh8/lZIkHVy6NY+xz11/iTI=;
 b=JwfcjiDncsPzq4m4mPKpzfQ/D2hkNElNNJoMST93T/HTqJyM39QSBfvHlZ2Oh8xRQsFu+j/z/aLCC7fIBNqr3LyzNWMLFj5oWDNzDhrlYgbTZ7E/LlUTAoYdPwdQMn5v/Tw2Rav9OUi4Labr5hrYREUHLn8vmZUCjtmj/hNUDlCfC+my2Q2YoRZ9zxIEP6UvQqI3m9Jsvg12zYszgxhXxCI7qchABTyYjrVnrYulrUMwY5BbAwPjJBScqFZ7IPuWmszobF/F+1VHbPkHtTWozsj14pI/a4chUHHhwFN5V3XT3gOoASv6/dRVVd7LRXX/nzdjcjmnMjQET5TQdfKL+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g5CMvE2maAKfN6w0+Torsh8/lZIkHVy6NY+xz11/iTI=;
 b=FyEbijQGSAqOLrwJ/1V8focnKknFp8Q4DMMbND09oQ39ErEbHOAXj5N1CC5BSd6CooH8tVum5MWhWhK9oCpPBZRhQE04RmRewgmci3aAU/rlG4BgpVLgvVbRH7gq/s96c04wUxRUrB/M5n709jC6sufSB9sJoRNlhDIuFBHvg60=
Received: from MA1PR01MB3228.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:79::22)
 by MA1PR01MB0732.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 19 Mar
 2021 17:37:29 +0000
Received: from MA1PR01MB3228.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::b8ba:3e53:7225:61cb]) by MA1PR01MB3228.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::b8ba:3e53:7225:61cb%6]) with mapi id 15.20.3955.023; Fri, 19 Mar 2021
 17:37:28 +0000
From: "Sana Kazi" <Sana.Kazi@kpit.com>
To: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>
CC: Harpritkaur Bhandari <Harpritkaur.Bhandari@kpit.com>
Subject: Re: [poky][gatesgarth][master][dunfell][PATCH] shadow: whitelist CVE-2013-4235
Thread-Topic: [poky][gatesgarth][master][dunfell][PATCH] shadow: whitelist
 CVE-2013-4235
Thread-Index: AQHXEBsakyrbaDIMKE62PYoB6CqgYKqLq2CZ
Date: Fri, 19 Mar 2021 17:37:27 +0000
Message-ID: 
 <MA1PR01MB32283CD788DEBEFE746E57AB99689@MA1PR01MB3228.INDPRD01.PROD.OUTLOOK.COM>
References: <20210303105038.13823-1-Sana.Kazi@kpit.com>
In-Reply-To: <20210303105038.13823-1-Sana.Kazi@kpit.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
x-originating-ip: [2401:4900:52b6:10e2:808d:e144:aea7:8434]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 35d36198-a430-4523-9b43-08d8eafdab08
x-ms-traffictypediagnostic: MA1PR01MB0732:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <MA1PR01MB073297222ED3F31DB6A42E1899689@MA1PR01MB0732.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 jmkscjMXBxqlRWuT3QU/uoVYwuxB10ZrKr8H8tqrDwHoM3WGAPkXEFMJ2WP2B05q0DyTH06KeAQI3GlpXjDluO7lvS4o8oIzWuggW0u1adL2pnY/3aFqVivfHAbx90Drni9TbmAaFpZ1/Ze4IC66CwoCzyxmMLYlBV0BhosEiyOaDQcTjJfSM/qbz/NOHRsyxoERyVkDfaexkIqYYCjMZMRqe56FU2u5GEfVleBxDxnj7btCLKQOF0wR+6fWnYyNo56l5Ob5EIUDV8LV77C5MZnYjbqtnP5kD2kZDg4/+uQ2CeU1wTIOyjc/bJM/AozmWt4YpkrBQfgdEn+TfiZKPPuLIFvJMFH1rCGaHRzG8uOz1xKOC+Y2MkulfT4GaJGkZfqL454hJIypo0xmfwezQ+VERerVGkylp9PJ25hxaLHJ3NHb26oK3jaE0dVUEx1Ip502r5cw9QFhhAx9yOhJCPIP4WEUvDSd5D30SnSxkmDEXavKekejnSpPBtaw4ULRzFaBOPwDE1lz2+C2xws3Ocpey8P1FEBN2v5PC/K5fVo800JDKFP5kcOKrTww6ytHIywoHBcUE2T9OIoalYj+JqyeNqUiZXUimGMKqBtTwIpI1EB0f5rLfDSjlsXtIL/mbkGIwmGmSZYQ2QJC55gMTxMMcvYZeheIslFzr1hP+sPF1FfhPYIWf/dqdWjgF4CKjxy37sQluUrc3m9ExvAuwd0V2jebtY7ys+A+GW5cnVAsHwKJPXvAnjHLPt+6KJ1D
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA1PR01MB3228.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(366004)(136003)(396003)(376002)(166002)(316002)(66946007)(53546011)(5660300002)(66556008)(71200400001)(38100700001)(110136005)(86362001)(478600001)(66574015)(7696005)(186003)(8936002)(966005)(64756008)(55016002)(66446008)(33656002)(8676002)(107886003)(76116006)(2906002)(4326008)(52536014)(9686003)(19627405001)(83380400001)(91956017)(66476007)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?iso-8859-1?Q?bFuShb4C4eYcifzvWLLDI+LCjn51Eur9biazChNbWSoIWbe3V4nuz6Zn4I?=
 =?iso-8859-1?Q?FjR0Ydj3chEKOW74UOThNnSpbO1o6LSuE0E/SliTwjXQ5OdCQLO5b7BgM3?=
 =?iso-8859-1?Q?gyjh5NRvrXbqA1xaBP+mXSSuwFmFRfHHU4PUtvNCIAaMVZ/3kCZ5J2UzkN?=
 =?iso-8859-1?Q?J/LbD186jCnWE+kM2w5SgD7RVpJCUo3hNbwVydmR1Ov2R/amGU/oTlykR2?=
 =?iso-8859-1?Q?myZ2SjjnzKLplwunWgPcmUMbt3mJoEpE0k99qbpTbu/7m2FPoIBEtcj+zX?=
 =?iso-8859-1?Q?q3NmVVWQpA8PGrvDcbrdukZlBKughikc1m5EWdzMjR0R9jTPvvnRnQ+cvv?=
 =?iso-8859-1?Q?TyBS9l8U+bjWaE2hwqyreKh3wEc2YnmG0kn2338Sro6R0UbzhNgiYfvRVl?=
 =?iso-8859-1?Q?NQ0h7532FaQj50sMvKz+a8v+QQqhHUIZHamq29PRe+1LMb9/8wdtX8iH6i?=
 =?iso-8859-1?Q?+BtbFWoXo0CzxyCbHNbCsOYrdRD04JQmX7w06HdEv2XUGkCwkRaF6s5MXF?=
 =?iso-8859-1?Q?K6Z4JGtFOBlucQV88T81dwWQLq5O41JrSA8zRtP7uYuRsoV39Q4jxaGF38?=
 =?iso-8859-1?Q?wqtibdSUhLXA9SMNvbk76preFscoygGp7QHX2fDj2J57COGMKZt+lx+m/9?=
 =?iso-8859-1?Q?L9xvNJ3qY+tlb+YNbCsQlEbeWLHwXc0jaA4YZZE48EOtsgsbkrOt5zBdQc?=
 =?iso-8859-1?Q?G9WgBRBlX+5WCT8E04ikVhZd2O6U/6CAYVCuz/D5a/oIjPX3dVhrdOD5Nq?=
 =?iso-8859-1?Q?8i9nRTv56X9Nyc/QfRucNu/vewXhJYdN9getn71bNO7CK3RQQUpV0oMXik?=
 =?iso-8859-1?Q?crXfUz5X3ys6+Hjav7BO5KAfN25di0xbdSBTW4yJz8kVkifxC0pldOo0td?=
 =?iso-8859-1?Q?sB9v1p+oUBQ0DXCB4HcvPZr8p+di4C6B2LIAMOVhwkMvzHJL64fEeWC4f2?=
 =?iso-8859-1?Q?Cr+gLYSTHVkfdneNTcGrBUKAMlSxduVOgIsKHahSqhBc5As1ngXFz8Vrcx?=
 =?iso-8859-1?Q?L5EmbpfrngiBkLzIH93fGDF8d7EieLD15303Qt7G3hy24GFL7e7T+hGufA?=
 =?iso-8859-1?Q?eCoyrFEJGDO9cvG9fhPsrHScAwAkFHx9gI1pM4bjqu6DcvMZj1Ou6BmheD?=
 =?iso-8859-1?Q?O5f9eHKQW3QqFNPUXJb+RUmWRYClJqtWCq3/Q2CLLAKvWWv/oMshhiWTL4?=
 =?iso-8859-1?Q?w9wvSUy88GBDm5agNCgebNNCVa6a/pPpW1dmoMbjp/HlZowQ37vL1giras?=
 =?iso-8859-1?Q?lAYqdeg2XpjlKE+GMcuLZCNgSewiicQyRuV2vkRl4bTwq/K33+8fWiQF13?=
 =?iso-8859-1?Q?omrmesTBNSDBFDUPUtHimRP+AEe/U0HGFZWNaeKniBmm4jSstd7FckQ9Lz?=
 =?iso-8859-1?Q?8GfaCk1yEDuC/vHsHTFiPieQOg4Js9JcTcX8iFOZdz+pLS7WULorkRMnEI?=
 =?iso-8859-1?Q?OD8cDPlVWyzH/Yce?=
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA1PR01MB3228.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 35d36198-a430-4523-9b43-08d8eafdab08
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2021 17:37:27.9894
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iz4iFi+Fz9jI1G2daSI7RlpwGfU2yF/ROenVWcP4npclnnCpg1UjMyAVHUlyh7OH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA1PR01MB0732
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MA1PR01MB32283CD788DEBEFE746E57AB99689MA1PR01MB3228INDP_"

--_000_MA1PR01MB32283CD788DEBEFE746E57AB99689MA1PR01MB3228INDP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

This patch is merged for master and dunfell. Could you please review it for=
 gatesgarth.

 Thanks & Regards,

 Sana Kazi
 KPIT Technologies Limited



________________________________
From: Sana Kazi <Sana.Kazi@kpit.com>
Sent: Wednesday, March 3, 2021 4:21 PM
To: Openembedded-core@lists.openembedded.org <Openembedded-core@lists.opene=
mbedded.org>; raj.khem@gmail.com <raj.khem@gmail.com>
Cc: Nisha Parrakat <Nisha.Parrakat@kpit.com>; Aditya Tayade <Aditya.Tayade@=
kpit.com>; Harpritkaur Bhandari <Harpritkaur.Bhandari@kpit.com>; Purushotta=
m Choudhary <Purushottam.Choudhary@kpit.com>
Subject: [poky][gatesgarth][master][dunfell][PATCH] shadow: whitelist CVE-2=
013-4235

From: Purushottam Choudhary <Purushottam.Choudhary@kpit.com>

This CVE is about TOCTOU (time-of-check time-of-use)
race condition when copying and removing directory trees
which had very low severity problem and marked as closed
and won't fix. Therefore whitelisted CVE-2013-4235.
Master, gatesgarth and dunfell all have shadow version 4.81.
Hence, this is applicable for master, gatesgarth and dunfell.
Link: https://bugzilla.redhat.com/show_bug.cgi?id=3D884658

Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
---
 meta/recipes-extended/shadow/shadow_4.8.1.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/shadow/shadow_4.8.1.bb b/meta/recipes-ex=
tended/shadow/shadow_4.8.1.bb
index c975395ff8..ff4aad926f 100644
--- a/meta/recipes-extended/shadow/shadow_4.8.1.bb
+++ b/meta/recipes-extended/shadow/shadow_4.8.1.bb
@@ -6,5 +6,6 @@ BUILD_LDFLAGS_append_class-target =3D " ${@bb.utils.contain=
s('DISTRO_FEATURES', 'p

 BBCLASSEXTEND =3D "native nativesdk"

-
-
+# Severity is low and marked as closed and won't fix.
+# https://bugzilla.redhat.com/show_bug.cgi?id=3D884658
+CVE_CHECK_WHITELIST +=3D "CVE-2013-4235"
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

--_000_MA1PR01MB32283CD788DEBEFE746E57AB99689MA1PR01MB3228INDP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
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
This patch is merged for master and dunfell. Could you please review it for=
 gatesgarth.</div>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">
<div></div>
<div name=3D"divtagdefaultwrapper" style=3D"font-family:Calibri,Arial,Helve=
tica,sans-serif; font-size:; margin:0">
<div><span style=3D"font-family: Arial, sans-serif; font-size: 10pt; color:=
 black;">&nbsp;</span><span style=3D"font-family: Arial, sans-serif; font-s=
ize: 10pt;"><font color=3D"#003366">Thanks &amp; Regards,</font></span><br>
</div>
<div style=3D"text-align:start; background-color:rgb(255,255,255); font-siz=
e:11pt; font-family:Calibri,sans-serif; margin:0px">
<span style=3D"margin:0px; font-size:12pt; font-family:Arial,sans-serif; co=
lor:black; background-color:white"></span></div>
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
<br>
</div>
</div>
</div>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Sana Kazi &lt;Sana.Ka=
zi@kpit.com&gt;<br>
<b>Sent:</b> Wednesday, March 3, 2021 4:21 PM<br>
<b>To:</b> Openembedded-core@lists.openembedded.org &lt;Openembedded-core@l=
ists.openembedded.org&gt;; raj.khem@gmail.com &lt;raj.khem@gmail.com&gt;<br=
>
<b>Cc:</b> Nisha Parrakat &lt;Nisha.Parrakat@kpit.com&gt;; Aditya Tayade &l=
t;Aditya.Tayade@kpit.com&gt;; Harpritkaur Bhandari &lt;Harpritkaur.Bhandari=
@kpit.com&gt;; Purushottam Choudhary &lt;Purushottam.Choudhary@kpit.com&gt;=
<br>
<b>Subject:</b> [poky][gatesgarth][master][dunfell][PATCH] shadow: whitelis=
t CVE-2013-4235</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">From: Purushottam Choudhary &lt;Purushottam.Choudh=
ary@kpit.com&gt;<br>
<br>
This CVE is about TOCTOU (time-of-check time-of-use)<br>
race condition when copying and removing directory trees<br>
which had very low severity problem and marked as closed<br>
and won't fix. Therefore whitelisted CVE-2013-4235.<br>
Master, gatesgarth and dunfell all have shadow version 4.81.<br>
Hence, this is applicable for master, gatesgarth and dunfell.<br>
Link: <a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D884658">http=
s://bugzilla.redhat.com/show_bug.cgi?id=3D884658</a><br>
<br>
Signed-off-by: Sana Kazi &lt;Sana.Kazi@kpit.com&gt;<br>
---<br>
&nbsp;meta/recipes-extended/shadow/shadow_4.8.1.bb | 5 +++--<br>
&nbsp;1 file changed, 3 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-extended/shadow/shadow_4.8.1.bb b/meta/recipes-ex=
tended/shadow/shadow_4.8.1.bb<br>
index c975395ff8..ff4aad926f 100644<br>
--- a/meta/recipes-extended/shadow/shadow_4.8.1.bb<br>
+++ b/meta/recipes-extended/shadow/shadow_4.8.1.bb<br>
@@ -6,5 +6,6 @@ BUILD_LDFLAGS_append_class-target =3D &quot; ${@bb.utils.co=
ntains('DISTRO_FEATURES', 'p<br>
&nbsp;<br>
&nbsp;BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&nbsp;<br>
-<br>
-<br>
+# Severity is low and marked as closed and won't fix.<br>
+# <a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D884658">https:/=
/bugzilla.redhat.com/show_bug.cgi?id=3D884658</a><br>
+CVE_CHECK_WHITELIST +=3D &quot;CVE-2013-4235&quot;<br>
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

--_000_MA1PR01MB32283CD788DEBEFE746E57AB99689MA1PR01MB3228INDP_--
