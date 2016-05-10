Return-Path: <neenareddy.busireddy@nxp.com>
X-Greylist: delayed 946 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 10 May 2016 18:28:21 UTC
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0070.outbound.protection.outlook.com [157.55.234.70])
	by mail.openembedded.org (Postfix) with ESMTP id 240A46072C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 18:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
	s=selector1-nxp-com;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=IZNAJl1YRFkUS3nkOcYYT8eH0wlfQIi+O2uQYwx78Ss=;
	b=wZ+r/4jEwZqTNoGJ3SCzfGYVouzb3eQB9/xfvLcLXi535Pq3VIcT/sCu+4OAalo60lbrBns+DJm3hgv2I7J0F64R7xuUE+AmBtQWHGBOnAsaNwzMB5iy57C6LfA3hK3KdllBtfAozkR/vsNHBjcGHEEKr3cGbGvK7gi7t+rxbmI=
Received: from VI1PR04MB1583.eurprd04.prod.outlook.com (10.164.84.141) by
	VI1PR04MB1583.eurprd04.prod.outlook.com (10.164.84.141) with Microsoft
	SMTP Server (TLS) id 15.1.492.11; Tue, 10 May 2016 18:12:34 +0000
Received: from VI1PR04MB1583.eurprd04.prod.outlook.com ([10.164.84.141]) by
	VI1PR04MB1583.eurprd04.prod.outlook.com ([10.164.84.141]) with mapi id
	15.01.0492.016; Tue, 10 May 2016 18:12:34 +0000
From: Neena Busireddy <neenareddy.busireddy@nxp.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] proposal: replace GLUT with FreeGLUT
Thread-Index: AdGq54YcQBQPfsyrS+qvQPveYmH1oA==
Date: Tue, 10 May 2016 18:12:34 +0000
Message-ID: <VI1PR04MB1583BDC40DA6D580FE8F6C3591710@VI1PR04MB1583.eurprd04.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=nxp.com;
x-originating-ip: [192.88.168.49]
x-ms-office365-filtering-correlation-id: cd3be866-1287-4e66-a271-08d378fea96b
x-microsoft-exchange-diagnostics: 1; VI1PR04MB1583;
	5:TMtGpRTJzSNrhYFJXiFhsZirlOy/iuczQFcKHoW5l4e9GK8AhXzvwsKLRuibV/BNEW4Qcx5FDUuO09zZ8W/2NY3k30mlGXhFziuDma6ROLBb3fAfXK8pPa1JavE7z2dBKbhJ2D0eCcIwjTE45hHtMg==;
	24:9fNE4ENLVSZBNRnoavSG17R4Q0vLdDSie7wTTsGm82iP9v1ODqtPX2AB1xmxhM0Fs1n+2pCofHQGGp3D+hSjKL6/y/8QV2E7WsTVHS5qa7k=;
	7:72tBZauybme2nYkHfOf2qkPM6aWEws4vGtaS3xesSAn1hmTn1l9ohvwDp/+S/5IWgJhiTatVBNoLWyreQk4YlykzVFLspHLwtbxKVM1S3cc8ogfkDhI+iR6CF3reLmHDHETEp8gkeG72Gc1B9q4FAjeuD0hR6aB0xSSqYzydow/AD/UOtwlW4zLlY0csx/tR
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:VI1PR04MB1583;
x-microsoft-antispam-prvs: <VI1PR04MB1583BC7E4A9D534F1ED59DBE91710@VI1PR04MB1583.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046)(6055026);
	SRVR:VI1PR04MB1583; BCL:0; PCL:0; RULEID:; SRVR:VI1PR04MB1583; 
x-forefront-prvs: 0938781D02
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(5002640100001)(19625215002)(33656002)(586003)(6116002)(18717965001)(102836003)(790700001)(16236675004)(3846002)(1220700001)(11100500001)(3660700001)(9326002)(9686002)(2900100001)(8936002)(3280700002)(76576001)(2501003)(122556002)(5003600100002)(19300405004)(4326007)(5008740100001)(19580395003)(50986999)(92566002)(2906002)(19609705001)(54356999)(19617315012)(86362001)(5004730100002)(10400500002)(66066001)(77096005)(15975445007)(2351001)(229853001)(189998001)(110136002)(81166006);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB1583;
	H:VI1PR04MB1583.eurprd04.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2016 18:12:34.6926 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB1583
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>
Subject: proposal: replace GLUT with FreeGLUT
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
X-List-Received-Date: Tue, 10 May 2016 18:28:22 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_VI1PR04MB1583BDC40DA6D580FE8F6C3591710VI1PR04MB1583eurp_"

--_000_VI1PR04MB1583BDC40DA6D580FE8F6C3591710VI1PR04MB1583eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

GLUT is dead upstream for almost three years now ( https://cgit.freedesktop=
.org/mesa/glut/  ) and it makes sense to replace GLUT with FreeGLUT .
Some of the reasons to replace with FreeGLUT are listed here :
http://freeglut.sourceforge.net/

Also, current mesa-glut recipe does not generate GLUT library. I tested thi=
s when I enabled GLUT in mesa-demos.

I discussed this issue with Otavio and he suggested to replace GLUT with Fr=
eeGLUT and upgrade mesa-demos to 8.3.

Any suggestions or thoughts?


Thanks,
Neena





--_000_VI1PR04MB1583BDC40DA6D580FE8F6C3591710VI1PR04MB1583eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 12 (filtered medium)">
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
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">GLUT is dead upstream for almost three years now ( <=
a href=3D"https://cgit.freedesktop.org/mesa/glut/">
https://cgit.freedesktop.org/mesa/glut/</a>&nbsp; ) and it makes sense to r=
eplace GLUT with FreeGLUT .<o:p></o:p></p>
<p class=3D"MsoNormal">Some of the reasons to replace with FreeGLUT are lis=
ted here :<o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"http://freeglut.sourceforge.net/">http://=
freeglut.sourceforge.net/</a>
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Also, current mesa-glut recipe does not generate GLU=
T library. I tested this when I enabled GLUT in mesa-demos.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I discussed this issue with Otavio and he suggested =
to replace GLUT with FreeGLUT and upgrade mesa-demos to 8.3.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Any suggestions or thoughts?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Neena<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_VI1PR04MB1583BDC40DA6D580FE8F6C3591710VI1PR04MB1583eurp_--
