Return-Path: <Rob.Walton@arm.com>
X-Greylist: delayed 21693 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 30 May 2019 00:25:08 UTC
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
	(mail-eopbgr70079.outbound.protection.outlook.com [40.107.7.79])
	by mail.openembedded.org (Postfix) with ESMTP id 61BE27DE87
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 00:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
	s=selector2-armh-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=U3zTdI5QnY25rsT5vfj8mgJB6IUclDJW8JOs5u1Giks=;
	b=bu6dFPbEAMfOjT/99l4rHur5Z9rpAgNKKlBV38VP60QgUICyO7RylsImHgrG5mv6e4U0x5v4C/AEL1NFF25O4YGdg8aoNNNPJ6vvybWCPe9DBjW65P89mOuFMCxD7mZDgSf9NGOJU8CUGN6+Y+XAT3qDjsL0kjF7HwWJ8dpMJTI=
Received: from AM6PR08MB3685.eurprd08.prod.outlook.com (20.177.199.158) by
	AM6PR08MB5238.eurprd08.prod.outlook.com (10.255.122.218) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1922.20; Wed, 29 May 2019 10:50:14 +0000
Received: from AM6PR08MB3685.eurprd08.prod.outlook.com
	([fe80::380e:bc71:e3ba:95f]) by AM6PR08MB3685.eurprd08.prod.outlook.com
	([fe80::380e:bc71:e3ba:95f%6]) with mapi id 15.20.1943.016;
	Wed, 29 May 2019 10:50:14 +0000
From: Rob Walton <Rob.Walton@arm.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH 2/2] package.bbclass: Emit HOMEPAGE pkgdata.
Thread-Index: AQHVEJwdeDxIADRRKEmYI513wzcNy6aB91U5
Date: Wed, 29 May 2019 10:50:14 +0000
Message-ID: <AM6PR08MB3685497EB2D7701DD823AD32951F0@AM6PR08MB3685.eurprd08.prod.outlook.com>
References: <1558529060-79451-1-git-send-email-rob.walton@arm.com>,
	<1558529060-79451-2-git-send-email-rob.walton@arm.com>
In-Reply-To: <1558529060-79451-2-git-send-email-rob.walton@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Rob.Walton@arm.com; 
x-originating-ip: [217.140.106.50]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9e7f0824-47f8-4624-9bb5-08d6e4236e29
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
	SRVR:AM6PR08MB5238; 
x-ms-traffictypediagnostic: AM6PR08MB5238:
x-microsoft-antispam-prvs: <AM6PR08MB5238859F732C79E5F8D1F759951F0@AM6PR08MB5238.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0052308DC6
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(136003)(39860400002)(366004)(396003)(346002)(376002)(189003)(199004)(40434004)(86362001)(73956011)(6606003)(66946007)(7696005)(5660300002)(2351001)(72206003)(91956017)(76116006)(66476007)(66556008)(64756008)(66446008)(74316002)(229853002)(2906002)(76176011)(478600001)(99286004)(53936002)(446003)(6436002)(316002)(5640700003)(14454004)(11346002)(66066001)(53546011)(9686003)(6246003)(3846002)(256004)(55016002)(486006)(2501003)(102836004)(54896002)(25786009)(68736007)(186003)(8676002)(19627405001)(33656002)(8936002)(6916009)(71190400001)(6506007)(26005)(5024004)(7736002)(81156014)(6116002)(14444005)(52536014)(71200400001)(476003)(81166006);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB5238;
	H:AM6PR08MB3685.eurprd08.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Y8Gthif6YB7jR9xQt1frzGm56GXtItIfiDtK+KwCxxOub6D9KW5TJ2dYy1LKu/AvVB5zlQ+yMCZJF1EBsRpr0pwhbkA+Iajtcq8t9Fjgy3PJSwZ+qpHlBhYy07qPV/bbOMdHxIafKuQmqaossywIaDceMvZAk1z+T+8ZY9hqQ8FG/jV0TaZt62tb0zV63Xx8O2zkV2pmk1KspFWGPZyhNHPv+ttAuBAtNcCop0ZWcHnqSELDrKRGKgueSWvVubvQQncSTeAZNRFP3ZpmWfn1lUSYiFmvS4Liyxmj3UKL9RPwlzeJ2RyD+1W89MtILFdJTynDrqIN1v2EtOdrLtcyvCkiLXZmdrORHCxC35uIQ3XNZqY4t6ZDX4dSEwmwvkMHjWQzliJhE52PKfV1yKz87NllMKVCiyTtBvuBWAjYu9Y=
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e7f0824-47f8-4624-9bb5-08d6e4236e29
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2019 10:50:14.1333 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rob.Walton@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5238
Subject: Re: [PATCH 2/2] package.bbclass: Emit HOMEPAGE pkgdata.
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
X-List-Received-Date: Thu, 30 May 2019 00:25:08 -0000
Content-Language: en-GB
Content-Type: multipart/alternative;
	boundary="_000_AM6PR08MB3685497EB2D7701DD823AD32951F0AM6PR08MB3685eurp_"

--_000_AM6PR08MB3685497EB2D7701DD823AD32951F0AM6PR08MB3685eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Requesting review. Thanks.

________________________________
From: Rob Walton
Sent: 22 May 2019 13:44:37
To: openembedded-core@lists.openembedded.org
Cc: Rob Walton
Subject: [PATCH 2/2] package.bbclass: Emit HOMEPAGE pkgdata.

Emit the contents of HOMEPAGE in the extra pkgdata. This is useful
information to have when creating license manifests.

Signed-off-by: Rob Walton <rob.walton@arm.com>
---
 meta/classes/package.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 4c0a859..a08aefe 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1458,6 +1458,7 @@ fi
         write_if_exists(sf, pkg, 'PKGR')
         write_if_exists(sf, pkg, 'LICENSE')
         write_if_exists(sf, pkg, 'DESCRIPTION')
+        write_if_exists(sf, pkg, 'HOMEPAGE')
         write_if_exists(sf, pkg, 'SUMMARY')
         write_if_exists(sf, pkg, 'RDEPENDS')
         rprov =3D write_if_exists(sf, pkg, 'RPROVIDES')
--
2.7.4

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

--_000_AM6PR08MB3685497EB2D7701DD823AD32951F0AM6PR08MB3685eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<p style=3D"margin-top:0;margin-bottom:0">Requesting review. Thanks.<br>
</p>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Rob Walton<br>
<b>Sent:</b> 22 May 2019 13:44:37<br>
<b>To:</b> openembedded-core@lists.openembedded.org<br>
<b>Cc:</b> Rob Walton<br>
<b>Subject:</b> [PATCH 2/2] package.bbclass: Emit HOMEPAGE pkgdata.</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Emit the contents of HOMEPAGE in the extra pkgdata=
. This is useful<br>
information to have when creating license manifests.<br>
<br>
Signed-off-by: Rob Walton &lt;rob.walton@arm.com&gt;<br>
---<br>
&nbsp;meta/classes/package.bbclass | 1 &#43;<br>
&nbsp;1 file changed, 1 insertion(&#43;)<br>
<br>
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass<br=
>
index 4c0a859..a08aefe 100644<br>
--- a/meta/classes/package.bbclass<br>
&#43;&#43;&#43; b/meta/classes/package.bbclass<br>
@@ -1458,6 &#43;1458,7 @@ fi<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; write_if_exists(sf, pkg, '=
PKGR')<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; write_if_exists(sf, pkg, '=
LICENSE')<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; write_if_exists(sf, pkg, '=
DESCRIPTION')<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; write_if_exists(sf, pkg, 'H=
OMEPAGE')<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; write_if_exists(sf, pkg, '=
SUMMARY')<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; write_if_exists(sf, pkg, '=
RDEPENDS')<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rprov =3D write_if_exists(=
sf, pkg, 'RPROVIDES')<br>
-- <br>
2.7.4<br>
<br>
</div>
</span></font></div>
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose,
 or store or copy the information in any medium. Thank you.
</body>
</html>

--_000_AM6PR08MB3685497EB2D7701DD823AD32951F0AM6PR08MB3685eurp_--
