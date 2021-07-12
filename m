Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.81])
 by mx.groups.io with SMTP id smtpd.web09.11060.1626096959140662265
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jul 2021 06:35:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=fWnlE6oC;
 spf=pass (domain: kpit.com, ip: 40.107.138.81, mailfrom: saloni.jain@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SZrUOyosef7A8NzqdQyXuXpEFHWjaUwzq536h7fTQXbxTKl1hyQfUVC7abrgBdNpxAi31mj91pm7yHB6NhLIRNeCl9rYdu1n5pnOaECVWLojy63Arxln9PGM4/3MMfUpgM1SljMeDyxRzHUfIpPtbbmxeUW2l21uIvAEjEhgSqX4E9TXjbKzxXaKR7q0mfHu2P5DC1uOizfZgINOrDHQ0jBqoU5F+U/jIXOt/dH2R2OFOVwV50PSCTHW9do28MylCoC7Tns4fnPWE2J28dWx+9iMTDkUe7r/Jv1SwcF/po0HOe/vHNKfE6meEKDy4i28RQ5nqMCZ6d5f+jmRdgH+Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UHNolfULihFib3tTDd6ZAE5A3spdlNgkYKhYTBMrBao=;
 b=oNjdXqlgmKnKP9pC8M8wZJIEIRPQrvd0Kz2g2DxRzs2MKpbRD1+0oN9TMJ9YX5ZPSybuxMR6GkZ2sQpfuZNxUUPRAidU3raUtQuQVUUP9gi5kZn4KPL4GnjrOxOy/h1IT411VJ6TmZQEN2UKs6q8XxZZNs+bucugQ7mQMNchiVgo5N0y8nGkzpROYnKdg37CUta6wdbYXYoW7Ol0+B9s8GK0LoRRFYhdTgpLxL/3PAl5KhXlB6/anV2//0AP8unLqb5/ylkNXObcnFsG9/RVc7GAqHCyDhJ8Gy3Je8he0Y/cxDvI76tUbDQxN7QiSv/uobiodxry7v7rmneieUHw3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UHNolfULihFib3tTDd6ZAE5A3spdlNgkYKhYTBMrBao=;
 b=fWnlE6oCZ0GYH8Kj/W5EViDmZegL44hOkwRWZxXpLVBPW0tRPO9Lx43ejw73uARQ8mN4bJNvpzcWrSPNWUwdsBeWu7BhmGFyMX7DLmL1UG2MZ6r3DJZ81LIFZ4a+eddOpNU6WdwZqF/MavneJIGH+QHyeP3uCzNggKmMV/3tDqI=
Received: from MA1PR01MB4108.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:78::11)
 by MA1PR01MB4226.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:12::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21; Mon, 12 Jul
 2021 13:35:49 +0000
Received: from MA1PR01MB4108.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::e58d:b799:ba51:4fa5]) by MA1PR01MB4108.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::e58d:b799:ba51:4fa5%7]) with mapi id 15.20.4308.026; Mon, 12 Jul 2021
 13:35:48 +0000
From: "saloni" <saloni.jain@kpit.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>
CC: Nisha Parrakat <Nisha.Parrakat@kpit.com>, Purushottam Choudhary
	<Purushottam.Choudhary@kpit.com>, Harpritkaur Bhandari
	<Harpritkaur.Bhandari@kpit.com>
Subject: Re: [meta-java][dunfell][PATCH] xerces-j: Whitelisted CVE-2018-2799
Thread-Topic: [meta-java][dunfell][PATCH] xerces-j: Whitelisted CVE-2018-2799
Thread-Index: AQHXVT/F/ELuR33cAUetFSThdJw9gqs/k+UT
Date: Mon, 12 Jul 2021 13:35:48 +0000
Message-ID: 
 <MA1PR01MB410893C1E68E55F70EA90A1687159@MA1PR01MB4108.INDPRD01.PROD.OUTLOOK.COM>
References: <20210530103704.8081-1-Saloni.Jain@kpit.com>
In-Reply-To: <20210530103704.8081-1-Saloni.Jain@kpit.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bb2f9424-ee22-49a0-c9bd-08d94539f5b4
x-ms-traffictypediagnostic: MA1PR01MB4226:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <MA1PR01MB4226892DFFE2EBA2EBA4B75287159@MA1PR01MB4226.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ZX4xK7wtnbUUWxpw4OsZDYBWySoekRnafH6Mjr1B8OQALrdF5kF3BVK3dVyZkktZyAL5Tk9pjSE9T/TTx4gVI0WjPsxRHzhRyNPARS33UUfejdNtWz1aXYjkJY3ZMjLNmGWGBAxVfxIpBHprFzzLkRaSuCUnM3qJPjMvu5j806T1p0UtL8XXGt385ucPpzaO67tZi8qj3xqVloS5Ddum44v488/QuQ4sQWVVR6BEhIMmlv8q0TysQcGDlBnJXCAcdHaFzbZYyv5SYsf9oYtwG1T/rhG4DDrGhB6f76x5lHpYc3GngkCA23G+TOjRLug0Mtayh3dmA4Rpyt6oXnVAgr6S7geoOJzuZGNZ3AL4V4gOBegpbsYrSiDCxIoNgCR1/H5T8k2Tk4is8rDqRaHl25IgCVF4lpVlj9yVz1N7B1DKoGa9bGSg4sWLL6mynCPtC1NcEXLCaVD83JYnIkvrRRzdDK5KX9Clgykf04aAoQtiK47P242Tt25wx0ujHbeZIfl2+ekEvYLyyqJNUJF+v2au6gAkbPGFgRa+w+mvTktsgS5l2yEyH5neF3G3ZePw92GbNUq3AcuUihsr7gl1KwkuDvvcRvU4WfHArLM+luPB4/ldjbdeIoYCGdN2U00wL1ltV3Tcb+222zG1kgV5vKi/2Zq4muCSrWbi32z5gzxomP6hY3iILvhVdWedKP2Ph0cG2kzfBG08K1Js9VKwPGKyatYdN6lzuCxcQ8D4rBI=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA1PR01MB4108.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(376002)(136003)(39840400004)(346002)(107886003)(4326008)(478600001)(54906003)(5660300002)(110136005)(316002)(8936002)(52536014)(26005)(166002)(38100700002)(186003)(966005)(122000001)(66946007)(66446008)(53546011)(66476007)(6506007)(55016002)(19627405001)(8676002)(66556008)(9686003)(33656002)(76116006)(71200400001)(64756008)(86362001)(66574015)(2906002)(83380400001)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?aNt9flF7jYh10TW5e16LSfm98mjAz3/9721BgnNQOoZj44Je55YTgDJiVPms?=
 =?us-ascii?Q?1Zx6yNlPTq01KaUQbm7R2s9tZthL7REL0Lk78tbzSqI22wATTK/d/1u/0Yec?=
 =?us-ascii?Q?eE81649ZxceTa2O4nqMb6G51zRqDHXd8zeYdLn9gAkiw6kPOe1Vb58fBfK4N?=
 =?us-ascii?Q?oe+nOG9iT0YXIzMzT+7AwyixHvEj2xUGos6GL8wFwLK40EXp8JlQ1ed3OaNQ?=
 =?us-ascii?Q?o4KKKepv0i7wSKa+rPeFBB3e2L+1ChGcV4Vvheyy7e2TjJ7J6sNoexY9YGXa?=
 =?us-ascii?Q?kaSQJKQMvUMDQosuyXkaSh6hTSqasjlFqr0rN8v6xJYj+GK+25tASenzJdzc?=
 =?us-ascii?Q?gznQiZs5/C9FAprypq8JGnTo700EhIZj3A5UsB73co+R4Y4/CcCaWBv8Sf4V?=
 =?us-ascii?Q?adjI1OyLRENxNTAeEpQCCIbWQgjC2jr0dzf0eQE8cUQrRbi4jaG8kpvq7T6W?=
 =?us-ascii?Q?d6G/wIYn8alIXLMJPtXWL9ptaRpq2Snqre2fkIqiS8ohl4t2r18QURZ0pXEY?=
 =?us-ascii?Q?VviYsWWQwBRRqRzDHNIxcwVfIOqyXABMG6BjfKq7tJTwJAX2PF5PQbEdR0bd?=
 =?us-ascii?Q?QrX1E+Wv/D+pIEA0bLd1IahzMvtKMRtIG1mrTNsi2dFrBldZl8xBnXFXasB9?=
 =?us-ascii?Q?fAcRIu7o0tZmgpHoen79gJeDEqmkAk8RnB2epnFY+E8X2yneuX/EpVmoLalF?=
 =?us-ascii?Q?ebpNTX2TXedDbgV2peKvXy+OBkEyhdFCEa5gJbBQIKZThghDMaOLNcNhLLfH?=
 =?us-ascii?Q?6hYlcmcbuqqhRsh+ygZF2a/ATm19Kzugmnjev9uWOywn1S0wbUcCGSWAWeZV?=
 =?us-ascii?Q?Em7gRhP04yYMeEdnYTjEJ1MxPr6Scjr00thQPF37kQyml7A+99V7kqXqmMWS?=
 =?us-ascii?Q?z37UXGXa0uignHp7u9iwfwIglNjuO9v/vz2QvBD9uJvqAdXm3dJ+QbV0emt5?=
 =?us-ascii?Q?dA6DUm+mXK76WMS77q7121w1GJBOlx9JS6ODfyGF27WFGcrXHmaCi4uA16WB?=
 =?us-ascii?Q?QvIj2dHC3KzfugKZeVVA95lP7MT76FqbMEET9t9GXbMOJ+BQQdpiJQMdZ7mE?=
 =?us-ascii?Q?jDYR+E7+19QDUf94NoSIb9XBafPbwmZB7sDONIRdWM4N9H6lteobNzG6itBZ?=
 =?us-ascii?Q?4NaMW02iCv5mmXi0fAvux8FLC0oyIYoNctAFHh7DDqUEHpXTsvvfzILXvsjk?=
 =?us-ascii?Q?LeSBVhDg0h3G1cjjlbojIPMT4ifEgsR6fbQW5OYJln43wOmj/WwIMDgYI9Ss?=
 =?us-ascii?Q?xMbkiYeGSac3gC2cbu6s91HYgJXJZGW9k/oGWVHbkowTVEmLwRJeMgs7tsy9?=
 =?us-ascii?Q?xVo=3D?=
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA1PR01MB4108.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: bb2f9424-ee22-49a0-c9bd-08d94539f5b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2021 13:35:48.5855
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2BN/eQ1NofkY6NSDlvkCfgoqE4mxhGx6oUl+8YQkoz1jPpeFQ2NVEXIGWXmZsyQ2wHHA2hdNhZ0d2vy+gnDLdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA1PR01MB4226
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MA1PR01MB410893C1E68E55F70EA90A1687159MA1PR01MB4108INDP_"

--_000_MA1PR01MB410893C1E68E55F70EA90A1687159MA1PR01MB4108INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

Please take the below changes and merge them in upstream dunfell branch.

Thanks & Regards,
Saloni
________________________________
From: Saloni Jain <Saloni.Jain@kpit.com>
Sent: Sunday, May 30, 2021 4:07 PM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>; raj.khem@gmail.com <raj.khem@gmail.com>
Cc: Nisha Parrakat <Nisha.Parrakat@kpit.com>; Saloni Jain <Saloni.Jain@kpit=
.com>
Subject: [meta-java][dunfell][PATCH] xerces-j: Whitelisted CVE-2018-2799

From: Saloni Jain <Saloni.Jain@kpit.com>

Whitelisted below CVE:
CVE-2018-2799:
CVE only applies to some Oracle Java SE and Red Hat
Enterprise Linux versions which is already fixed with
updates and the issue is closed.
Link: https://access.redhat.com/security/cve/CVE-2018-2799
Link: https://bugzilla.redhat.com/show_bug.cgi?id=3D1567542

Signed-off-by: Saloni <Saloni.Jain@kpit.com>
---
 recipes-core/xerces-j/xerces-j_2.11.0.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/recipes-core/xerces-j/xerces-j_2.11.0.bb b/recipes-core/xerces=
-j/xerces-j_2.11.0.bb
index 98ef32f..f2a4434 100644
--- a/recipes-core/xerces-j/xerces-j_2.11.0.bb
+++ b/recipes-core/xerces-j/xerces-j_2.11.0.bb
@@ -14,6 +14,12 @@ LIC_FILES_CHKSUM =3D " \

 SRC_URI =3D "http://archive.apache.org/dist/xerces/j/Xerces-J-src.${PV}.ta=
r.gz"

+# CVE only applies to some Oracle Java SE and Red Hat Enterprise Linux ver=
sions.
+# Already fixed with updates and closed.
+# https://access.redhat.com/security/cve/CVE-2018-2799
+# https://bugzilla.redhat.com/show_bug.cgi?id=3D1567542
+CVE_CHECK_WHITELIST +=3D "CVE-2018-2799"
+
 S =3D "${WORKDIR}/xerces-2_11_0"

 inherit java-library
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

--_000_MA1PR01MB410893C1E68E55F70EA90A1687159MA1PR01MB4108INDP_
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
<div>Hi,<br>
</div>
<div><br>
</div>
<div>Please take the below changes and merge them in upstream dunfell branc=
h.<br>
<div id=3D"Signature">
<div>
<div name=3D"divtagdefaultwrapper" style=3D"font-family:Calibri,Arial,Helve=
tica,sans-serif; font-size:; margin:0">
<div><br>
</div>
<div>Thanks &amp; Regards,</div>
<div>Saloni <br>
</div>
</div>
</div>
</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Saloni Jain &lt;Salon=
i.Jain@kpit.com&gt;<br>
<b>Sent:</b> Sunday, May 30, 2021 4:07 PM<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;; raj.khem@gmail.com &lt;raj.khem@gmail.com&gt;<br=
>
<b>Cc:</b> Nisha Parrakat &lt;Nisha.Parrakat@kpit.com&gt;; Saloni Jain &lt;=
Saloni.Jain@kpit.com&gt;<br>
<b>Subject:</b> [meta-java][dunfell][PATCH] xerces-j: Whitelisted CVE-2018-=
2799</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Saloni Jain &lt;Saloni.Jain@kpit.com&gt;<br>
<br>
Whitelisted below CVE:<br>
CVE-2018-2799:<br>
CVE only applies to some Oracle Java SE and Red Hat<br>
Enterprise Linux versions which is already fixed with<br>
updates and the issue is closed.<br>
Link: <a href=3D"https://access.redhat.com/security/cve/CVE-2018-2799">http=
s://access.redhat.com/security/cve/CVE-2018-2799</a><br>
Link: <a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D1567542">htt=
ps://bugzilla.redhat.com/show_bug.cgi?id=3D1567542</a><br>
<br>
Signed-off-by: Saloni &lt;Saloni.Jain@kpit.com&gt;<br>
---<br>
&nbsp;recipes-core/xerces-j/xerces-j_2.11.0.bb | 6 ++++++<br>
&nbsp;1 file changed, 6 insertions(+)<br>
<br>
diff --git a/recipes-core/xerces-j/xerces-j_2.11.0.bb b/recipes-core/xerces=
-j/xerces-j_2.11.0.bb<br>
index 98ef32f..f2a4434 100644<br>
--- a/recipes-core/xerces-j/xerces-j_2.11.0.bb<br>
+++ b/recipes-core/xerces-j/xerces-j_2.11.0.bb<br>
@@ -14,6 +14,12 @@ LIC_FILES_CHKSUM =3D &quot; \<br>
&nbsp;<br>
&nbsp;SRC_URI =3D &quot;<a href=3D"http://archive.apache.org/dist/xerces/j/=
Xerces-J-src.${PV}.tar.gz">http://archive.apache.org/dist/xerces/j/Xerces-J=
-src.${PV}.tar.gz</a>&quot;<br>
&nbsp;<br>
+# CVE only applies to some Oracle Java SE and Red Hat Enterprise Linux ver=
sions.<br>
+# Already fixed with updates and closed.<br>
+# <a href=3D"https://access.redhat.com/security/cve/CVE-2018-2799">https:/=
/access.redhat.com/security/cve/CVE-2018-2799</a><br>
+# <a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D1567542">https:=
//bugzilla.redhat.com/show_bug.cgi?id=3D1567542</a><br>
+CVE_CHECK_WHITELIST +=3D &quot;CVE-2018-2799&quot;<br>
+<br>
&nbsp;S =3D &quot;${WORKDIR}/xerces-2_11_0&quot;<br>
&nbsp;<br>
&nbsp;inherit java-library<br>
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

--_000_MA1PR01MB410893C1E68E55F70EA90A1687159MA1PR01MB4108INDP_--
