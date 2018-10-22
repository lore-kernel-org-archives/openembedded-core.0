Return-Path: <Hugues.Kamba@arm.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0074.outbound.protection.outlook.com [104.47.2.74])
	by mail.openembedded.org (Postfix) with ESMTP id 041B16FF84
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 11:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
	s=selector1-arm-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=vRLeRVK0kE9HxrsYVO+G01V31/7VRC9qXul2wrNyoX8=;
	b=nw5edqv2FEpe5jWw1DhapzP0NKpGK46Yg0SuIllMYwLNCeSqrfNIY+J/1OUhfUeq9wUEl0zTcKv11EmHzZQjhKjohUny5dDaIltobLTRW/XlQCXyfWt6jfNx3ZeEymagPe8UFNUTbKZ6nlknCl0XCC1kYpamAfEiWlSlG6JMigg=
Received: from VI1PR08MB3631.eurprd08.prod.outlook.com (20.177.61.82) by
	VI1PR08MB0719.eurprd08.prod.outlook.com (10.163.168.30) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1228.25; Mon, 22 Oct 2018 10:48:01 +0000
Received: from VI1PR08MB3631.eurprd08.prod.outlook.com
	([fe80::c4f0:a260:fc5c:1c78]) by
	VI1PR08MB3631.eurprd08.prod.outlook.com
	([fe80::c4f0:a260:fc5c:1c78%5]) with mapi id 15.20.1250.028;
	Mon, 22 Oct 2018 10:48:01 +0000
From: Hugues Kamba <Hugues.Kamba@arm.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: PATCH: Fixing python3-pyvenv and adding python3-venv
Thread-Index: AQHUaduDON+arP2etkmO5Es78l/AxA==
Date: Mon, 22 Oct 2018 10:48:01 +0000
Message-ID: <VI1PR08MB36317EE05BE84D857C630F2398F40@VI1PR08MB3631.eurprd08.prod.outlook.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Hugues.Kamba@arm.com; 
x-originating-ip: [217.140.106.49]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; VI1PR08MB0719;
	6:PFPu6QDjcYBKOt75aZ4W7rQ7A8UIwfPT9cqBRW/6wga28BokuLVVL8/dT1bvjtZeedz0YfQGpyz9D6pwxizq+vdu6wPi/A/jzmZ3DA7QBdY60SwYdOETAdY5Mxj409x6f1j38+t/+jgncsF7I8vr/JnXRBAHtNgJmR4oWue5bSnMWrC4W9mALf1ceOo+RcyTc8o83ys5zDjVLINqCiSDVksSODwEBZoqPpylMfUG1xYw5pCe3SzyQ7SilTkMwMsQv/Q44ssIKSeHgEljn2mvLVs7+luUUmaDC/D4MpU4UaRu/Pnj6+MhB8BW4ffdFDyRyYcc6Gyb2gqoK26tvHxImR+zj7ntbvvXLGDyVdf1XmWGKYf5cl0+glAKICyl6U4jn9pll5Exht+RsSnQ7lsayRflIPXWoWREV/iVTjTtZ/VuUbRCnPyLsWIZGOjpz3IT9HwtQZDseXL1ZOmxFMh1dJg1FC34mPWGe1u/6Wur1NU=;
	5:qCtyvH96+q5B1czzsathfDSsW+hyIlWH2UTFq021lurwB/FWQm9dh3wYKbgh7RgJFsHG3V9MzdaxnhjTpWV7sXmnNwdPeVehrWoBk/1fWNbjeSnFmB6J4FpAaRZlMm9+IwrNm9BcFo8IXYAsOquzVgw74DS+k3b+q7zdhLRCwf8=;
	7:IEHQFr9dGb2BTCIewXy/5itHzO0XEDshmbyC+oUg+BFJwQB4kOMcdVUi40zSSuKpcny3vR+0YCpMWQ6fGO+d3jbaLkUTNBiGygUEvdC7MSTnn5asJ+nUYlG+qldVAsWXzBUqE7fqA5cWamJtucwyx9vrKahQFr9xmLnNfJE2s2Xz/3lsrQVsXvRUj9ofhWVdy7XUdFPYLMDy0po1O/M4SGIHr0QdH2tT1UW9vY8Gky+bP9ZfC1sEOpTKqHukzydG
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-ms-office365-filtering-correlation-id: c92f318c-7ad5-4d8b-efa1-08d6380bd659
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(49563074)(7193020);
	SRVR:VI1PR08MB0719; 
x-ms-traffictypediagnostic: VI1PR08MB0719:
x-microsoft-antispam-prvs: <VI1PR08MB0719CDE644C2029F604D486B98F40@VI1PR08MB0719.eurprd08.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(163750095850);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(102415395)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3231355)(944501410)(4983020)(52105095)(3002001)(93006095)(93001095)(6055026)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123562045)(20161123564045)(20161123560045)(201708071742011)(7699051)(76991095);
	SRVR:VI1PR08MB0719; BCL:0; PCL:0; RULEID:; SRVR:VI1PR08MB0719; 
x-forefront-prvs: 08331F819E
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(979002)(346002)(396003)(39860400002)(376002)(136003)(366004)(40434004)(199004)(189003)(33656002)(14454004)(6916009)(6116002)(105586002)(71190400001)(71200400001)(9686003)(54896002)(25786009)(102836004)(53936002)(99936001)(4326008)(5640700003)(54906003)(55016002)(68736007)(7736002)(97736004)(6606003)(2501003)(106356001)(5660300001)(3846002)(316002)(256004)(14444005)(5024004)(5250100002)(74316002)(99286004)(86362001)(413944005)(6506007)(2900100001)(476003)(39060400002)(81156014)(478600001)(81166006)(72206003)(7696005)(186003)(2351001)(26005)(66066001)(486006)(8676002)(2906002)(8936002)(6436002)(19627405001)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB0719;
	H:VI1PR08MB3631.eurprd08.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: r+cyU01rBGHg6nZ/IVe+loGf57xSrdQiQMesRC34HgA++5r+jIR32MNoIhrgyyDqeFIlIK6qGAcN8+NK+RqTrplB2QrTfrUhvsAyct5F0xcWLSunDK3cxrFqo00CALfXltFFTmIWoU884XpC6QrSUFgyEQFch6s0mytX1BuzghEwdHMuGrEGXFFQHKnSCs9hsFtEcuxEViH8+yWkK+uo9Qaa7slrxEeGyJXUe3KVDPbOeIvezvEUr2s4qCALOUZAgXkkpG/vDUfgrnl1VQDi4q+Y4ts1aoHdNYUO3UFG1AGQQWhmzuLej9BJk6xnZFcL0qb+EQmFxmaHYLBfyXwlSuRj7ASOsu/L4dWrruhZWiQ=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c92f318c-7ad5-4d8b-efa1-08d6380bd659
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2018 10:48:01.0367 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB0719
Cc: Diego Russo <Diego.Russo@arm.com>, Jeremy Johnson <Jeremy.Johnson@arm.com>,
	"aehs29@gmail.com" <aehs29@gmail.com>
Subject: PATCH: Fixing python3-pyvenv and adding python3-venv
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
X-List-Received-Date: Mon, 22 Oct 2018 11:02:45 -0000
X-Groupsio-MsgNum: 117537
Content-Language: en-GB
Content-Type: multipart/mixed;
	boundary="_004_VI1PR08MB36317EE05BE84D857C630F2398F40VI1PR08MB3631eurp_"

--_004_VI1PR08MB36317EE05BE84D857C630F2398F40VI1PR08MB3631eurp_
Content-Type: multipart/alternative;
	boundary="_000_VI1PR08MB36317EE05BE84D857C630F2398F40VI1PR08MB3631eurp_"

--_000_VI1PR08MB36317EE05BE84D857C630F2398F40VI1PR08MB3631eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Dear All,


As it currently is, python3-pyvenv is broken because it is missing the venv=
 module run-time dependency.


The patch I am submitting is to add the venv module dependency to python3-p=
yvenv.

The dependency has been added using the newly added venv package (python3-v=
env).

The python3-venv package has been added for future proofing since pyvenv ha=
s been deprecated in Python 3.6 and creation of virtual environment is done=
 using the venv module directly (i.e python3 -m venv my_venv).


Regards,


Hugues Kamba

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

--_000_VI1PR08MB36317EE05BE84D857C630F2398F40VI1PR08MB3631eurp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; color=
:rgb(0,0,0); font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Apple=
 Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,NotoColorEmoji,&quot;Segoe UI=
 Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols">
<p style=3D"margin-top:0; margin-bottom:0">Dear All,</p>
<p style=3D"margin-top:0; margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0; margin-bottom:0">As it currently is, python3-pyve=
nv is broken because it is missing the venv module run-time dependency.</p>
<p style=3D"margin-top:0; margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0; margin-bottom:0">The patch I am submitting is to =
add the venv module dependency to python3-pyvenv.&nbsp;</p>
<p style=3D"margin-top:0; margin-bottom:0">The dependency has been&nbsp;<sp=
an style=3D"font-size:12pt">added&nbsp;</span><span style=3D"font-size:12pt=
">using the newly added venv package (python3-venv).</span></p>
<p style=3D"margin-top:0; margin-bottom:0"><span style=3D"font-size:12pt">T=
he python3-venv package has been added&nbsp;for future proofing since pyven=
v has been deprecated in Python 3.6 and creation of virtual environment is =
done using the venv module directly (i.e
 python3 -m venv my_venv).</span></p>
<p style=3D"margin-top:0; margin-bottom:0"><span style=3D"font-size:12pt"><=
br>
</span></p>
<p style=3D"margin-top:0; margin-bottom:0"><span style=3D"font-size:12pt">R=
egards,</span></p>
<p style=3D"margin-top:0; margin-bottom:0"><span style=3D"font-size:12pt"><=
br>
</span></p>
<p style=3D"margin-top:0; margin-bottom:0"><span style=3D"font-size:12pt">H=
ugues Kamba</span></p>
<div id=3D"Signature">
<div id=3D"divtagdefaultwrapper" dir=3D"ltr" style=3D"">
<p style=3D"color:rgb(0,0,0); font-family:Calibri,Helvetica,sans-serif,Emoj=
iFont,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,NotoColorEmo=
ji,&quot;Segoe UI Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols; font=
-size:12pt">
</p>
</div>
</div>
</div>
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose,
 or store or copy the information in any medium. Thank you.
</body>
</html>

--_000_VI1PR08MB36317EE05BE84D857C630F2398F40VI1PR08MB3631eurp_--

--_004_VI1PR08MB36317EE05BE84D857C630F2398F40VI1PR08MB3631eurp_
Content-Type: text/x-patch;
	name="fix_python3_builtin_virtual_environment_tool.patch"
Content-Description: fix_python3_builtin_virtual_environment_tool.patch
Content-Disposition: attachment;
	filename="fix_python3_builtin_virtual_environment_tool.patch"; size=2039;
	creation-date="Mon, 22 Oct 2018 10:47:55 GMT";
	modification-date="Mon, 22 Oct 2018 10:47:55 GMT"
Content-Transfer-Encoding: base64

RnJvbSBiMWU2MTYzNmEyMzI0ZTZlNGIwYmZjNmU5YThjMGZkNzhmZGJhNDBhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBIdWd1ZXMgS2FtYmEgPGh1Z3Vlcy5rYW1iYUBhcm0uY29tPgpE
YXRlOiBNb24sIDIyIE9jdCAyMDE4IDExOjQwOjU5ICswMTAwClN1YmplY3Q6IFtQQVRDSF0gQ3Jl
YXRlIHB5dGhvbjMtdmVudiBwYWNrYWdlIGZvciB2aXJ0dWFsIGVudmlyb25tZW50cyBjcmVhdGlv
bgoKKiBBZGQgdGhlIHZlbnYgbW9kdWxlIGFzIGEgc2VsZi1jb250YWluZWQgcGFja2FnZSBzaW5j
ZSBweXZlbnYgYXMgYmVlbgogIGRlcHJlY2F0ZWQgaW4gUHl0aG9uIDMuNi4KKiBGaXggdGhlIHB5
dGhvbjMtcHl2ZW52IHBhY2thZ2UgYnkgYWRkaW5nIHZlbnYgYXMgYSBydW4tdGltZSBkZXBlbmRl
bmN5LgotLS0KIC4uLi9weXRob24vcHl0aG9uMy9weXRob24zLW1hbmlmZXN0Lmpzb24gICAgICAg
ICAgIHwgMjYgKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDI2IGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMvcHl0aG9uMy1tYW5pZmVzdC5qc29uIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zL3B5dGhvbjMtbWFuaWZlc3QuanNvbgppbmRleCBmOTIyNTYxLi41Y2Y2NDEyIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMvcHl0aG9uMy1tYW5p
ZmVzdC5qc29uCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy9weXRo
b24zLW1hbmlmZXN0Lmpzb24KQEAgLTkxNSw2ICs5MTUsMTcgQEAKICAgICAgICAgICAgICIke2xp
YmRpcn0vcHl0aG9uJHtQWVRIT05fTUFKTUlOfS9fX3B5Y2FjaGVfXy9weWRvYy4qLnB5YyIKICAg
ICAgICAgXQogICAgIH0sCisgICAgInB5dmVudiI6IHsKKyAgICAgICAgInN1bW1hcnkiOiAiQWxs
b3cgeW91IHRvIGNyZWF0ZSB2aXJ0dWFsIGVudmlyb25tZW50cyBzbyB3ZSBjYW4gaXNvbGF0ZSBv
dXIgcHJvamVjdCBkZXBlbmRlbmNpZXMuIERlcHJlY2F0ZWQgaW4gUHl0aG9uIDMuNiIsCisgICAg
ICAgICJyZGVwZW5kcyI6IFsKKyAgICAgICAgICAgICJjb3JlIiwKKyAgICAgICAgICAgICJ2ZW52
IgorICAgICAgICBdLAorICAgICAgICAiZmlsZXMiOiBbCisgICAgICAgICAgICAiJHtiaW5kaXJ9
L3B5dmVudioiCisgICAgICAgIF0sCisgICAgICAgICJjYWNoZWQiOiBbXQorICAgIH0sCiAgICAg
InJlc291cmNlIjogewogICAgICAgICAic3VtbWFyeSI6ICJQeXRob24gcmVzb3VyY2UgY29udHJv
bCBpbnRlcmZhY2UiLAogICAgICAgICAicmRlcGVuZHMiOiBbCkBAIC0xMTA3LDYgKzExMTgsMjEg
QEAKICAgICAgICAgICAgICIke2xpYmRpcn0vcHl0aG9uJHtQWVRIT05fTUFKTUlOfS9fX3B5Y2Fj
aGVfXy9nZXRwYXNzLioucHljIgogICAgICAgICBdCiAgICAgfSwKKyAgICAidmVudiI6IHsKKyAg
ICAgICAgInN1bW1hcnkiOiAiUHJvdmlkZXMgc3VwcG9ydCBmb3IgY3JlYXRpbmcgbGlnaHR3ZWln
aHQgdmlydHVhbCBlbnZpcm9ubWVudHMgd2l0aCB0aGVpciBvd24gc2l0ZSBkaXJlY3Rvcmllcywg
b3B0aW9uYWxseSBpc29sYXRlZCBmcm9tIHN5c3RlbSBzaXRlIGRpcmVjdG9yaWVzIiwKKyAgICAg
ICAgInJkZXBlbmRzIjogWworICAgICAgICAgICAgImNvbXByZXNzaW9uIiwKKyAgICAgICAgICAg
ICJjb3JlIiwKKyAgICAgICAgICAgICJsb2dnaW5nIiwKKyAgICAgICAgICAgICJzaGVsbCIsCisg
ICAgICAgICAgICAic3RyaW5nb2xkIiwKKyAgICAgICAgICAgICJ1bml4YWRtaW4iCisgICAgICAg
IF0sCisgICAgICAgICJmaWxlcyI6IFsKKyAgICAgICAgICAgICIke2xpYmRpcn0vcHl0aG9uJHtQ
WVRIT05fTUFKTUlOfS92ZW52IgorICAgICAgICBdLAorICAgICAgICAiY2FjaGVkIjogW10KKyAg
ICB9LAogICAgICJ4bWwiOiB7CiAgICAgICAgICJzdW1tYXJ5IjogIlB5dGhvbiBiYXNpYyBYTUwg
c3VwcG9ydCIsCiAgICAgICAgICJyZGVwZW5kcyI6IFsKLS0gCjIuNy40Cgo=

--_004_VI1PR08MB36317EE05BE84D857C630F2398F40VI1PR08MB3631eurp_--
