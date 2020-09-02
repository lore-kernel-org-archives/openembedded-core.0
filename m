Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.79])
 by mx.groups.io with SMTP id smtpd.web10.2863.1599035512035021241
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2020 01:31:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gigasetde.onmicrosoft.com header.s=selector2-gigasetde-onmicrosoft-com header.b=f9qG3euc;
 spf=pass (domain: gigaset.com, ip: 40.107.7.79, mailfrom: claus.groeting@gigaset.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GEKuTJS1o5gIEtgfabPzZLwaJiZT+6ngxLzM6VZqi3e9ady1dq+ubckg/eJyZRgXDyxC+vkoGR+pq8CDDWy4irWynbnLMFfgMDMIk3qw8spxU1yBliHDUUxLvpVmcLtmC3EfOWpkG547diy1pSrHMXWVFgKXBirK4eCdAS6r/RMH3cAt61I9xSfSurFNmvrIaZcK3inFTgzxfdFxVlErqTicBMzbQka2azddJ3U7lvY9j/INMGUTPDXj6ysrpfq9fIrK/kvfnRv5sU4Qhh0Yipvt9oDuQZGWqyMXpsLuGkehTv6V893XEgtH5ivUhbN+7Rrt8nQEBvsJKqdjelYC3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lZ5RruoO3APTAlSTy/99gQn8zDidrZ7ZjUHyWzOmxOM=;
 b=F85UZmOUIWvb1mHkHaYSVee4BoyzcjVFTlMuPpY61CY5bUj13+0/h0J5RHXsMSndx1QTFtuQBx7zTEERjwzDs564THd/zdAX/K1G8qhOtKapE7tcK3y+Q1ct/0v4BOjj2rXqyYKktn0F2qyPjKkwrxmVX4I4ZGJsMvBDByzqMZLxUZzPZ34iyOUQZrwFB0y10LlFyUpG5SNczJIHnW6QWmfYLX6B1QKM4E/qubmtQz4N1hk7vFWJu7oeOWP5H3Ip2TZ3G3eZcM+2MIebiO2fVzE7C6DlT04AnTJfVNHhbvBjbvGym8c8EFzzngg5h2IF66jZTA85Cfi8Ekjpstj4Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gigaset.com; dmarc=pass action=none header.from=gigaset.com;
 dkim=pass header.d=gigaset.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gigasetde.onmicrosoft.com; s=selector2-gigasetde-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lZ5RruoO3APTAlSTy/99gQn8zDidrZ7ZjUHyWzOmxOM=;
 b=f9qG3eucFrGJVZP4aVDpEBKZXDpgQJC0QEB11t8g/t5tLUN6Ak5QW6migVkHPsY2sZ7J73oh8dBn7Kd1TxxMXTkviq3FQW2hbxFGVqFGGPN272vzBZ0e/TtBID7MbDnhz/ps6pbJIC9KrgCpzcJgYYkleXqqx8LkZajvkfYTETY=
Received: from AM0PR09MB2529.eurprd09.prod.outlook.com (2603:10a6:208:dc::31)
 by AM0PR09MB3779.eurprd09.prod.outlook.com (2603:10a6:208:18b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Wed, 2 Sep
 2020 08:31:49 +0000
Received: from AM0PR09MB2529.eurprd09.prod.outlook.com
 ([fe80::31d2:adff:7f09:be8]) by AM0PR09MB2529.eurprd09.prod.outlook.com
 ([fe80::31d2:adff:7f09:be8%5]) with mapi id 15.20.3326.025; Wed, 2 Sep 2020
 08:31:49 +0000
From: claus.groeting@gigaset.com
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: BUILDNAME issue
Thread-Topic: BUILDNAME issue
Thread-Index: AQHWgQH0kjVlgk9sykaFd/dpwK7P7g==
Date: Wed, 2 Sep 2020 08:31:48 +0000
Message-ID: 
 <AM0PR09MB25294C0942836994769068BB922F0@AM0PR09MB2529.eurprd09.prod.outlook.com>
Accept-Language: de-DE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=gigaset.com;
x-originating-ip: [2003:c9:af1f:f800:a27a:a792:a0ea:d0af]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0996554d-688b-4a20-0c03-08d84f1aa2b2
x-ms-traffictypediagnostic: AM0PR09MB3779:
x-microsoft-antispam-prvs: 
 <AM0PR09MB377960678120DA05395A738F922F0@AM0PR09MB3779.eurprd09.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 erxnmy6m3oRL47Jy3CiB9LYlkBPiLKPjT+aaoVfmY2ZL8Ys/8Zb04BJAV/3IUYlgeVclRuA2gNRV0XMjg6vmt3x+5/PkifpEwZHogXs4fugmVexJNxknfaNf4V09JPoMwB3svt1inM1FyDlQmsX1mReWXxhW8TKurTUgoDNQzs7LgYmIpukhIa7q86kyVwf88ATUqVVU4kdy/NxSKXqV06OA/bBNHKvdd7RZb8DfKtWazqQpjNu5Vj+5VOKVSglqjJ2BXtObCqr8/ztHUBgfFHuD5O0qIYadr370/jpPkOMdWKLJ17Aa802d+KUA0W4xMzg8a+bbnU0wkBi6dSfx1JqYp0jZzPOo98x/A9xJBpsxDBNh7+peGRiyq2A8xXSgUuqkooE0K3PQlW4ibNcQfg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR09MB2529.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(346002)(376002)(39850400004)(136003)(366004)(8936002)(33656002)(478600001)(316002)(19627405001)(64756008)(2906002)(86362001)(66446008)(66946007)(7116003)(66476007)(76116006)(83380400001)(66556008)(7066003)(71200400001)(5660300002)(166002)(45080400002)(9686003)(3480700007)(7696005)(55016002)(52536014)(6506007)(6916009)(8676002)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 KmjyYA/PAi/mCHNe1xukYg/IqUJE92RTD67/3mEvEMYZeAKsIEFt2MWozlaG1WFOsaGulO/5xhhB8P2i9ylnh5Nv5mH60I5hNQ/9mbjx2l4nHBvjqa4hMe7ng1ZPK2cpMGBHtpfSU5/M00eXFue1FX/bTNkqUvaVakWOGncxXq3SsUqP+gtnSsUt03r3MzNAFe5OZ05i+7mzwiMY6UfteYQgOrS79Oh0ZUne/qTB3MOgisdzaL/hNSJnVuM8tb0JlREid5KYnf5/LMbhO0N1NB1y93tDWM41X4FiyDN1jgUjhYAa4eW1s3r99JGyMppoX9OKf6R8NYyUz4zrGBh9FUL5JUl97NcYhydlHFTtL1UFY3g0OcehMKOzsECNlWE0lNHB+cnJArxMftNIkL+ogVA1U2b5bpJn1R5l+mWuGJmHpmb7Pt6sxZXj7epYDYsXrNc9Df+Q+ThfniexcEz3qJeZJuFYxFBkUzcL1Oal4hpmlnF3WXKTUTSaB9Nf0eIPZsU0flUibpPY9AOeYGZVhmNEKehdQihLPkQk1t3P4HooTiDqY9lMaVh3X7RkoW1N/+dZXOdPQKwtGA4ka2QJyNhWRyN4shpV0wDjo12Kk/W/sa+FfXc/IDdxN7LLOyc7A7xn+MHABtAZNoNGo99NZM3c1UWmIdMgEsfRWWjBBKHArh+X93dyHNNCqfNmpm3jvM+P7VX4MnS95hpdzjSJWA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: gigaset.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR09MB2529.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0996554d-688b-4a20-0c03-08d84f1aa2b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2020 08:31:48.9357
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3c8c735a-a166-49b3-8d00-8c53c4c9ac9a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2yvoeIrBnQJxPTt7eeMqkVQrbbPdfR4pMGu+DopJPth2Rdse9aeYXU2nhicOToLLriSH/Nis/qYv6BQAYQ1ZeccjcMCVjwiC3p3ojTmzLC8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB3779
Content-Language: de-DE
Content-Type: multipart/alternative;
	boundary="_000_AM0PR09MB25294C0942836994769068BB922F0AM0PR09MB2529eurp_"

--_000_AM0PR09MB25294C0942836994769068BB922F0AM0PR09MB2529eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi All!

We are currently migrating towards dunfell and have an issue with our BUILD=
NAME handling. We observe that the BUILDNAME is overwritten by rootfs_repro=
ducible function which is added to the ROOTFS_POSTPROCESS_COMMAND list in t=
he rootfs-postcommands.bbclass file with the timestamp.
Why is the /etc/version file hardly coded here and why is the REPRODUCIBLE_=
TIMESTAMP_ROOTFS set from inside OE code and not configurable from outside?
We still want to make usage of the BUILDNAME variable which results in the =
/etc/version file of the rootfs. What did I miss?

Thx,
Claus


Mit freundlichen Gr=FC=DFen
Claus Gr=F6ting
Senior Software Developer


Gigaset Communications GmbH | Frankenstra=DFe 2 | 46395 Bocholt
t: +49 (0)2871 91 1901
claus.groeting@gigaset.com<mailto:guenter.frieling@gigaset.com> | www.gigas=
et.com<http://www.gigaset.com/>

Besuchen Sie uns auf Facebook<http://www.facebook.com/Gigaset> | Twitter<ht=
tp://www.twitter.com/Gigaset> | YouTube<http://www.youtube.com/Gigaset> | I=
nstagram<http://www.instagram.com/Gigaset> | Blog<http://blog.gigaset.com/>=
 | Xing<https://www.xing.com/companies/gigaset> | LinkedIn<https://www.link=
edin.com/company-beta/335563/>

Gesch=E4ftsf=FChrer: Klaus We=DFing | Aufsichtsrat: N.N. (Vorsitzender).
Sitz der Gesellschaft: Bocholt | Registergericht: Coesfeld, HRB 16595 | WEE=
E-Reg. Nr. DE 96349612.


--_000_AM0PR09MB25294C0942836994769068BB922F0AM0PR09MB2529eurp_
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
Hi All!</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
We are currently migrating towards dunfell and have an issue with our BUILD=
NAME handling. We observe that the BUILDNAME is overwritten by&nbsp;rootfs_=
reproducible function which is added to the&nbsp;ROOTFS_POSTPROCESS_COMMAND=
 list in the rootfs-postcommands.bbclass file
 with the timestamp.<br>
Why is the /etc/version file hardly coded here and why is the&nbsp;REPRODUC=
IBLE_TIMESTAMP_ROOTFS set from inside OE code and not configurable from out=
side?</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; backgrou=
nd-color: rgb(255, 255, 255); display: inline !important">We still want to =
make usage of the BUILDNAME variable which results in the /etc/version file=
 of the rootfs.&nbsp;</span>What did I
 miss?&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thx,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Claus</div>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">
<div>
<meta content=3D"text/html; charset=3DUTF-8">
<div id=3D"divtagdefaultwrapper" dir=3D"ltr" style=3D"color:rgb(0,0,0); fon=
t-family:Calibri,Arial,Helvetica,sans-serif">
<p style=3D"margin-top: 0px; margin-bottom: 0px;font-size:12pt"></p>
<p class=3D"x_MsoNormal" style=3D"margin-top: 0px; margin-bottom: 0px;font-=
size:11pt; margin:0cm 0cm 0.0001pt; font-family:Calibri,sans-serif; color:r=
gb(33,33,33)">
</p>
<p class=3D"x_MsoNormal" style=3D"margin-top: 0px; margin-bottom: 0px;font-=
size:11pt; margin:0cm 0cm 0.0001pt; font-family:Calibri,sans-serif; color:r=
gb(33,33,33)">
<span lang=3D"EN-US" style=3D"font-size:8pt; font-family:Arial,sans-serif">=
<span id=3D"docs-internal-guid-0f4d3de1-5567-d440-dd86-c526a96405db"><span =
style=3D"font-size:11pt; font-family:Arial; background-color:transparent; v=
ertical-align:baseline; white-space:pre-wrap"></span></span></span></p>
<p class=3D"x_x_MsoNormal" style=3D"margin-top: 0px; margin-bottom: 0px;fon=
t-family:Tahoma,serif,EmojiFont; font-size:13px">
<span style=3D"font-size:10pt"><span style=3D"font-family:Calibri,Helvetica=
,sans-serif,serif,EmojiFont; font-size:10pt">Mit freundlichen Gr=FC=DFen</s=
pan><br>
<span style=3D"font-size:10pt"></span><span style=3D"font-family:Calibri,He=
lvetica,sans-serif,serif,EmojiFont"></span><span style=3D"font-family:Calib=
ri,Helvetica,sans-serif,serif,EmojiFont; font-size:10pt">Claus Gr=F6ting</s=
pan><br>
<span style=3D"font-size:10pt"></span><span style=3D"font-family:Calibri,He=
lvetica,sans-serif,serif,EmojiFont"></span><span style=3D"font-family:Calib=
ri,Helvetica,sans-serif,serif,EmojiFont; font-size:10pt">Senior Software De=
veloper</span></span></p>
<span style=3D"font-family:Tahoma,serif,EmojiFont; font-size:10pt"></span><=
span style=3D"font-size:13px; font-family:Calibri,Helvetica,sans-serif,seri=
f,EmojiFont"></span><span style=3D"font-family:Tahoma,serif,EmojiFont; font=
-size:10pt"></span><span style=3D"font-family:Tahoma,serif,EmojiFont; font-=
size:13px"></span>
<p class=3D"x_x_MsoNormal" style=3D"margin-top: 0px; margin-bottom: 0px;fon=
t-family:Tahoma,serif,EmojiFont; font-size:13px">
<span style=3D"font-size:10pt; font-family:Calibri,Helvetica,sans-serif,ser=
if,EmojiFont"><br>
</span></p>
<span style=3D"font-family:Tahoma,serif,EmojiFont; font-size:10pt"></span><=
span style=3D"font-size:13px; font-family:Calibri,Helvetica,sans-serif,seri=
f,EmojiFont"></span><span style=3D"font-family:Tahoma,serif,EmojiFont; font=
-size:10pt"><span style=3D"font-family:Calibri,Helvetica,sans-serif,serif,E=
mojiFont; font-size:10pt">Gigaset
 Communications GmbH | Frankenstra=DFe 2 | 46395&nbsp;</span><span style=3D=
"font-family:Calibri,Helvetica,sans-serif,serif,EmojiFont; font-size:10pt">=
Bocholt&nbsp;</span><br>
<span style=3D"font-size:10pt"></span><span style=3D"font-family:Calibri,He=
lvetica,sans-serif,serif,EmojiFont; font-size:10pt">t: +49 (0)2871 91 1901<=
/span><br>
<span style=3D"font-size:10pt"></span><span style=3D"font-family:Calibri,He=
lvetica,sans-serif,serif,EmojiFont"></span><u><span style=3D"color:blue"><a=
 href=3D"mailto:guenter.frieling@gigaset.com" target=3D"_blank" rel=3D"noop=
ener noreferrer" id=3D"LPNoLP"><span style=3D"color:blue; font-family:Calib=
ri,Helvetica,sans-serif,serif,EmojiFont; font-size:10pt">claus.groeting@gig=
aset.com</span></a><span style=3D"font-family:Calibri,Helvetica,sans-serif,=
serif,EmojiFont; font-size:10pt">&nbsp;</span></span></u><span style=3D"col=
or:rgb(31,73,125); font-family:Calibri,Helvetica,sans-serif,serif,EmojiFont=
; font-size:10pt">|&nbsp;</span><u><span style=3D"color:blue"><a href=3D"ht=
tp://www.gigaset.com/" target=3D"_blank" rel=3D"noopener noreferrer" id=3D"=
LPNoLP"><span style=3D"color:blue; font-family:Calibri,Helvetica,sans-serif=
,serif,EmojiFont; font-size:10pt">www.gigaset.com</span></a></span></u><br>
<span style=3D"font-size:10pt"></span><span style=3D"font-family:Calibri,He=
lvetica,sans-serif,serif,EmojiFont"></span><br>
<span style=3D"font-size:10pt"></span><span style=3D"font-family:Calibri,He=
lvetica,sans-serif,serif,EmojiFont; font-size:10pt">Besuchen Sie uns auf&nb=
sp;</span><span style=3D"font-size:10pt"></span><u><span style=3D"color:blu=
e"><a href=3D"http://www.facebook.com/Gigaset" target=3D"_blank" rel=3D"noo=
pener noreferrer" id=3D"LPNoLP"><span style=3D"color:blue; font-family:Cali=
bri,Helvetica,sans-serif,serif,EmojiFont; font-size:10pt">Facebook</span></=
a></span></u><span style=3D"font-family:Calibri,Helvetica,sans-serif,serif,=
EmojiFont; font-size:10pt">&nbsp;|&nbsp;</span><u><span style=3D"color:blue=
"><a href=3D"http://www.twitter.com/Gigaset" target=3D"_blank" rel=3D"noope=
ner noreferrer" id=3D"LPNoLP"><span style=3D"color:blue; font-family:Calibr=
i,Helvetica,sans-serif,serif,EmojiFont; font-size:10pt">Twitter</span></a><=
/span></u><span style=3D"font-family:Calibri,Helvetica,sans-serif,serif,Emo=
jiFont; font-size:10pt">&nbsp;|&nbsp;</span><u><span style=3D"color:blue"><=
a href=3D"http://www.youtube.com/Gigaset" target=3D"_blank" rel=3D"noopener=
 noreferrer" id=3D"LPNoLP"><span style=3D"color:blue; font-family:Calibri,H=
elvetica,sans-serif,serif,EmojiFont; font-size:10pt">YouTube</span></a></sp=
an></u><span style=3D"font-family:Calibri,Helvetica,sans-serif,serif,EmojiF=
ont; font-size:10pt">&nbsp;|&nbsp;</span><u><span style=3D"color:blue"><a h=
ref=3D"http://www.instagram.com/Gigaset" target=3D"_blank" rel=3D"noopener =
noreferrer" id=3D"LPNoLP"><span style=3D"color:blue; font-family:Calibri,He=
lvetica,sans-serif,serif,EmojiFont; font-size:10pt">Instagram</span></a></s=
pan></u><span style=3D"font-family:Calibri,Helvetica,sans-serif,serif,Emoji=
Font; font-size:10pt">&nbsp;|&nbsp;</span><u><span style=3D"color:blue"><a =
href=3D"http://blog.gigaset.com/" target=3D"_blank" rel=3D"noopener norefer=
rer" id=3D"LPNoLP"><span style=3D"color:blue; font-family:Calibri,Helvetica=
,sans-serif,serif,EmojiFont; font-size:10pt">Blog</span></a></span></u></sp=
an><span style=3D"font-family:Calibri,Helvetica,sans-serif,serif,EmojiFont;=
 font-size:10pt">&nbsp;</span><span style=3D"font-family:Tahoma,serif,Emoji=
Font; font-size:10pt"><span style=3D"font-family:Calibri,Helvetica,sans-ser=
if,serif,EmojiFont; font-size:10pt">|&nbsp;</span><u><span style=3D"color:b=
lue"><a href=3D"https://www.xing.com/companies/gigaset" target=3D"_blank" r=
el=3D"noopener noreferrer" id=3D"LPNoLP"><span style=3D"color:blue; font-fa=
mily:Calibri,Helvetica,sans-serif,serif,EmojiFont; font-size:10pt">Xing</sp=
an></a></span></u><span style=3D"font-family:Calibri,Helvetica,sans-serif,s=
erif,EmojiFont; font-size:10pt">&nbsp;|&nbsp;</span><u><span style=3D"color=
:blue"><a href=3D"https://www.linkedin.com/company-beta/335563/" target=3D"=
_blank" rel=3D"noopener noreferrer" id=3D"LPNoLP"><span style=3D"color:blue=
; font-family:Calibri,Helvetica,sans-serif,serif,EmojiFont; font-size:10pt"=
>LinkedIn</span></a></span></u></span><span style=3D"font-family:Tahoma,ser=
if,EmojiFont; font-size:13px"><br>
<span style=3D"font-size:10pt"></span><span style=3D"font-family:Calibri,He=
lvetica,sans-serif,serif,EmojiFont"></span><br>
<span style=3D"font-size:10pt"></span><span style=3D"font-family:Calibri,He=
lvetica,sans-serif,serif,EmojiFont"></span></span><span style=3D"font-size:=
10pt; letter-spacing:0.1pt; font-family:Calibri,Helvetica,sans-serif,serif,=
EmojiFont">Gesch=E4ftsf=FChrer: Klaus We=DFing
 | Aufsichtsrat:&nbsp;</span><span style=3D"font-family:Tahoma,serif,EmojiF=
ont; font-size:8pt"><span style=3D"font-family:Calibri,Helvetica,sans-serif=
,serif,EmojiFont; font-size:10pt">N.N.</span><span style=3D"letter-spacing:=
0.1pt; font-family:Calibri,Helvetica,sans-serif,serif,EmojiFont; font-size:=
10pt">&nbsp;(Vorsitzender)</span><span style=3D"font-family:Calibri,Helveti=
ca,sans-serif,serif,EmojiFont; font-size:10pt">.</span><br>
<span style=3D"font-size:10pt"></span><span style=3D"font-family:Calibri,He=
lvetica,sans-serif,serif,EmojiFont"></span><span style=3D"letter-spacing:0.=
1pt; font-family:Calibri,Helvetica,sans-serif,serif,EmojiFont; font-size:10=
pt">Sitz der Gesellschaft: Bocholt | Registergericht:
 Coesfeld, HRB 16595 | WEEE-Reg. Nr. DE 96349612.</span></span>
<p class=3D"x_MsoNormal" style=3D"margin-top: 0px; margin-bottom: 0px;font-=
size:11pt; margin:0cm 0cm 0.0001pt; font-family:Calibri,sans-serif; color:r=
gb(33,33,33)">
<span style=3D"font-size:8pt; font-family:Arial,sans-serif"><br>
</span></p>
<p style=3D"margin-top: 0px; margin-bottom: 0px;font-size:12pt"></p>
<p style=3D"margin-top: 0px; margin-bottom: 0px;font-size:12pt"></p>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_AM0PR09MB25294C0942836994769068BB922F0AM0PR09MB2529eurp_--
