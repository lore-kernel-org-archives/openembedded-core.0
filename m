Return-Path: <sona.sarmadi@enea.com>
X-Greylist: delayed 4684 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 18 May 2018 13:37:49 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0096.outbound.protection.outlook.com [104.47.2.96])
	by mail.openembedded.org (Postfix) with ESMTP id C837474D6E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2018 13:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Enea.onmicrosoft.com; 
	s=selector1-enea-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=1NPpA74BtOeqVdb47vNNPaotvvt+GJj4mqCodrzk5hE=;
	b=DKKgRc3cyUp5uwAyXXKJ2ptQBLEPaWlVlPJANzDxv56RXCY9oHLzXzHTX0cNvpyk5nDtOe0M90WMfizc3XF02U+yX4lGqzUb7FyNBsRAqJ8vDXLA90GeSbL9rR1Y4Kk42wPEzUILtLUNUgf9tdici+GjII8arPsfpahHAnIXXog=
Received: from AM5PR0701MB3043.eurprd07.prod.outlook.com (10.168.157.12) by
	AM5PR0701MB1732.eurprd07.prod.outlook.com (10.167.215.139) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.797.5; Fri, 18 May 2018 12:05:05 +0000
Received: from AM5PR0701MB3043.eurprd07.prod.outlook.com
	([fe80::4925:966f:7ad8:e8b2]) by
	AM5PR0701MB3043.eurprd07.prod.outlook.com
	([fe80::4925:966f:7ad8:e8b2%2]) with mapi id 15.20.0776.010;
	Fri, 18 May 2018 12:05:05 +0000
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: add mets-security to Extensible SDK
Thread-Index: AdPuoGBXLPAtn//yQmynQ0vAXkaS0g==
Date: Fri, 18 May 2018 12:05:04 +0000
Message-ID: <AM5PR0701MB3043212515D3165ABE7C95AFE6900@AM5PR0701MB3043.eurprd07.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=sona.sarmadi@enea.com; 
x-originating-ip: [192.36.1.252]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM5PR0701MB1732;
	7:wmNnbEGkLy9DMdqXm+t792nOcbWoYisgKoQwtlG17pciBN7hmu9qOO/ilMv2/JLZzYwwwhQErzAjH9Or4ZHf0l4HSHOT2tXnAdCaZX+bnAQ2obLaLkjekGz8xyYRV8mYwZySD+R0hZj2Lr4pfpRZzPKRFFFNxexmcshTP2ziafhGtYk3quU9HBPtqUKoqpaP9GEESr/Q6FYjeetQDsluIrj2ToGV/voJ5RYWALkvGkxWaVHQ5IAzFsZXu/c9NOmb;
	20:qx5uyP3w1N0of1hCS8Vt66OFpLXNjyYmiIulpHPXH/Kc/T99qS+7Dl+VkeBilEz1wP+IiKFk6hHGiZoyV8LsC8QU0UQOB6EFjUdBVupVnkd6DEBG8oyf+YR8iED9RU7nH5obG4Azf+G9qrASJ2gj+WCrNtFrMHxTtYh9tIgh7Wk=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:AM5PR0701MB1732; 
x-ms-traffictypediagnostic: AM5PR0701MB1732:
x-microsoft-antispam-prvs: <AM5PR0701MB17327C4539BCDAAD48081DDCE6900@AM5PR0701MB1732.eurprd07.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(28532068793085)(21748063052155);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(3231254)(944501410)(52105095)(3002001)(93006095)(93001095)(10201501046)(149027)(150027)(6041310)(20161123564045)(20161123558120)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(6072148)(201708071742011)(7699016);
	SRVR:AM5PR0701MB1732; BCL:0; PCL:0; RULEID:;
	SRVR:AM5PR0701MB1732; 
x-forefront-prvs: 0676F530A9
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(366004)(376002)(39850400004)(346002)(39380400002)(189003)(199004)(25786009)(790700001)(2900100001)(106356001)(6506007)(6436002)(74316002)(5640700003)(6116002)(15650500001)(33656002)(7696005)(53936002)(105586002)(3846002)(7736002)(86362001)(2420400007)(236005)(99286004)(9686003)(6306002)(54896002)(55016002)(3280700002)(6916009)(5660300001)(102836004)(3660700001)(8676002)(476003)(606006)(81166006)(81156014)(486006)(44832011)(8936002)(2906002)(10710500007)(316002)(66066001)(2501003)(2351001)(5890100001)(26005)(478600001)(5250100002)(186003)(9326002)(68736007)(59450400001)(7110500001)(14454004)(97736004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM5PR0701MB1732;
	H:AM5PR0701MB3043.eurprd07.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: enea.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: pIXt5pLnV+0or+tsxNcq9ZYBzxRpgYfaL+iYYsDIJwJmgjR002yTe8Zc5B8+YAVq4ZNTZSWwE43C3jxzHQalo8X3mQvoK2K7GP9/mgo4erp58o9RBcLZAXjAoap75dF6oInhlQOyEB5oPVwHgrZOZ0M04bzB6IVBbMIZTpfYUMgZaCRBl90ib6L/qWDSbs4l
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 3f70e209-5a5e-495b-8c87-08d5bcb7978f
X-OriginatorOrg: enea.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f70e209-5a5e-495b-8c87-08d5bcb7978f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2018 12:05:05.0128 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8cdaed89-c47e-40b8-90b5-f28ad2c3fdca
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0701MB1732
Subject: add mets-security to Extensible SDK
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
X-List-Received-Date: Fri, 18 May 2018 13:37:50 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_AM5PR0701MB3043212515D3165ABE7C95AFE6900AM5PR0701MB3043_"

--_000_AM5PR0701MB3043212515D3165ABE7C95AFE6900AM5PR0701MB3043_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,
Does anyone know how can I add meta-security layer (https://git.yoctoprojec=
t.org/cgit/cgit.cgi/meta-security/) to my Extensible SDK using devtool and =
build e.g.  nmap?

Thanks
//Sona

This message, including attachments, is CONFIDENTIAL. It may also be privil=
eged or otherwise protected by law. If you received this email by mistake p=
lease let us know by reply and then delete it from your system; you should =
not copy it or disclose its contents to anyone. All messages sent to and fr=
om Enea may be monitored to ensure compliance with internal policies and to=
 protect our business. Emails are not secure and cannot be guaranteed to be=
 error free as they can be intercepted, a mended, lost or destroyed, or con=
tain viruses. The sender therefore does not accept liability for any errors=
 or omissions in the contents of this message, which arise as a result of e=
mail transmission. Anyone who communicates with us by email accepts these r=
isks.

--_000_AM5PR0701MB3043212515D3165ABE7C95AFE6900AM5PR0701MB3043_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:70.85pt 70.85pt 70.85pt 70.85pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"SV">Hi,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"SV">Does anyone know how can I add met=
a-security layer (<a href=3D"https://git.yoctoproject.org/cgit/cgit.cgi/met=
a-security/">https://git.yoctoproject.org/cgit/cgit.cgi/meta-security/</a>)=
 to my Extensible SDK using devtool and
 build e.g. &nbsp;nmap?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"SV"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"SV">Thanks<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"SV">//Sona<o:p></o:p></span></p>
</div>
<span style=3D"font-size:7.0pt;font-family:&quot;Segoe UI&quot;;color:#7671=
71;background:white"><br>
This message, including attachments, is CONFIDENTIAL. It may also be privil=
eged or otherwise protected by law. If you received this&nbsp;email by mist=
ake please let us know by reply and then delete it from your system; you sh=
ould not copy it or disclose its contents
 to anyone. All messages sent to and from Enea may be monitored to ensure c=
ompliance with internal policies and to protect our business. Emails are no=
t secure and cannot be guaranteed to be error free as they can be intercept=
ed, a mended, lost or destroyed,
 or contain viruses. The sender therefore does not accept liability for any=
 errors or omissions in the contents of this message, which arise as a resu=
lt of email transmission. Anyone who communicates with us by email accepts =
these risks.</span>
</body>
</html>

--_000_AM5PR0701MB3043212515D3165ABE7C95AFE6900AM5PR0701MB3043_--
