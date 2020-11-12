Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.74])
 by mx.groups.io with SMTP id smtpd.web09.7891.1605202134388551268
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2020 09:28:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=OedhOeb3;
 spf=pass (domain: kpit.com, ip: 40.107.139.74, mailfrom: purushottam.choudhary@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pm/NjEoi/xsvNTh3+b90GD7JZLpx7MQ73CkkvizWiYJl7sLhrpqOP8KBK7YOY1rLpSV6KwWk26ulFeMoy/nzpxTWkKhYSHqdM3wC2GDLlURvOcJUsutlCpvYSy/PWx+/e9zfd9+pOhZS+T7n7iCqB6WWbftKdG8S6Qi9D9wduuO+YncmcIGZlZjw0lwgxkZq6S5NLqHe5EyrLkcc7+uNbOZSWxcuATjq0xjXrblrjwodUqyYEdgCj/rfCGHBDv11tE4TRztIxj+Lz7C7raShRBAQohbiLp4ChIiMwNc58u23IrWvioMtiar8QhA+rbER3udpaUGTkWwEiwenKYlm+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rkfdGeg5uF0dqbRsWJLl23LQIGaXfbUIGt75p94BYXc=;
 b=SfUHG10dqFOGZx1Y8fYgHhFxd+zDoUORWGKS19tvGEoP66CP1yA+l9DB6eKvmJv0Zz3CfOAGdGJ8sPcWm9Ru4g3kdD39MN9nk5hZD2pVwhkhp6//spXanbduAr+i4GUtsS0JuDeL2VN/VoRneJ98sNFecYRXmUI7d345NOnjSRZTB8KF6CDBZCZXR2H9qlUVCgptd9cRdUn2aFzi3Nu2lQ1WmppkrSjsGON+t/S5H3Q6+GNLCx0BtAQfjNnAoqPkRlSX9faSStZvK6OkZOLnP83NVTqnrg2x3hMa+IDtCvpXrKomc4E9TB8T30UTx+QdNkIURykmC5bu1VYAywEFNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rkfdGeg5uF0dqbRsWJLl23LQIGaXfbUIGt75p94BYXc=;
 b=OedhOeb3uI9B6mR2aIUNsNH6t94lboMaZ3QT7RJm1K+G2DVbdB5mhoTqB7NmPDXMQ2A5i4tEXMwrBhxD7uEMGGaMHiR9Q1oyTyOM9apJhjz+x19mGGiassDkxse8iHRlRwhgCjj16XOZZqr/QFCHkf/msdJvoZId2e7ccnbYBfo=
Received: from PNZPR01MB4224.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1c::9)
 by PN2PR01MB4300.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:14::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Thu, 12 Nov
 2020 17:28:46 +0000
Received: from PNZPR01MB4224.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::801c:f051:cabd:84e5]) by PNZPR01MB4224.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::801c:f051:cabd:84e5%5]) with mapi id 15.20.3541.025; Thu, 12 Nov 2020
 17:28:46 +0000
From: "Purushottam choudhary" <purushottam.choudhary@kpit.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
CC: Nisha Parrakat <Nisha.Parrakat@kpit.com>, Anuj Chougule
	<Anuj.Chougule@kpit.com>, Aditya Tayade <Aditya.Tayade@kpit.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [poky][master][PATCH] systemd: selinux hook handling to enumerate nexthop
Thread-Topic: [OE-core] [poky][master][PATCH] systemd: selinux hook handling
 to enumerate nexthop
Thread-Index: AQHWspYLFulx/cSO6k6ndoF5cbD6AKnER8NngAA5fQCAAEuZJQ==
Date: Thu, 12 Nov 2020 17:28:45 +0000
Message-ID: 
 <PNZPR01MB42246345F264B3321570C53E90E70@PNZPR01MB4224.INDPRD01.PROD.OUTLOOK.COM>
References: <1604486040-26986-1-git-send-email-purushottam.choudhary@kpit.com>
	 <PNZPR01MB4224736DEB01CC746747D6D390E70@PNZPR01MB4224.INDPRD01.PROD.OUTLOOK.COM>,<dc807a64da8af13163c15acaf346d5f1298fc3fe.camel@linuxfoundation.org>
In-Reply-To: 
 <dc807a64da8af13163c15acaf346d5f1298fc3fe.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=kpit.com;
x-originating-ip: [103.51.148.13]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 51626b1d-a199-41fd-716c-08d8873068df
x-ms-traffictypediagnostic: PN2PR01MB4300:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <PN2PR01MB43002C9844AB22AE4069FB6190E70@PN2PR01MB4300.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 9d2iiDHE3hHrLTKvRJzH+1VKkgppEAMTu99K1VYk0ms7L73f1rz2AIRx37DwchbFhDlFsJBc3UY63rCKqWMR5YI8TwrfLX+JbIbhEb8WWIdt9LCW5OS1zL2kFgdjUVS2V/guJ7e5SRLDN99lvdIBa8gIeRVzywEehEzCo6uUiHZFcwxO0r+kpMEhwdT6XpTEIyIMDKlCIWCLDIcUNxOkP5j/xbb6DZxI7IPsJXhEUGff8LQVkUNmqJemSaWZfuarvGIJDKz6vcAiXh1W0pTB0XhUoygMtebScfZTgxyxXsXqd5rbyV2UPF3AOcYGIQMgXC/GPHYI3awxK9Q4t0AGAqcdnn1SBkCF1fm7ep887gbCe5n1S3+KCX/0SBUhzFBkdthYR4OYB8RN0Lz4qm5+XA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PNZPR01MB4224.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(366004)(39860400002)(346002)(7696005)(4001150100001)(55016002)(966005)(54906003)(186003)(33656002)(64756008)(26005)(66446008)(86362001)(45080400002)(66556008)(66574015)(66476007)(478600001)(6506007)(66946007)(91956017)(76116006)(166002)(316002)(9686003)(19627405001)(8676002)(6916009)(4326008)(52536014)(5660300002)(8936002)(83380400001)(71200400001)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 2RITedRl1vFEM3v6ZYADpbNi4K1x/QerP3vTkq1qyPsqB/CPXy+Xdf1s9L4qQCE50HuHN90XqnqS4yQeDsv+xJcL127LjuCGZdEfiBRpV64lW+yrhBRkkYYRpRWhco9PYjXJTBdBFrtjQk2fNYmCth43kJ1Pt3v4/zR4uPnhpauKxeXMYRgw5X9JURBM99pUnh15MmNGZcKg0mlylaodfpFhLKea3kWUpu7ESbhO2lrJd/r4d3+iwzlKO9EBFPY26jJCTDnbITj53gR6N6aQsMd9jPAMdgXPPytgJvqqNCeasfyLGemS7PvBoFeqkx2AN0qIWssrCWACBFuhlGfigAnSuz4mATP8WV6rYdhkb5uhG9ccMoUT1/5VP6YnsPfzzPqJ27pNsUG4QooSC606RBt0A46LcEcqb6LfMymgR1gWXVT20KgLmRNoReZWc8ZukTCGtq6W31RPatuiC20NA5trdjcED3ZsDDTH7oG6k+O/1wbl5hsCW3bMZwmvYP0KRTel0PnjllgurgG8ZH89TZPGyXCql9PpNb14FXP5HzoYAjj1rZYBUkanJCTiKDyVbeP9GXt+UkatUgI4Dg9OxTDGB57CQAzs81s5U6Fl6gkX71zqzS7pA1Wfct+7CNJ0PnNEt8khkOJthYB0QZQ/NQ==
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PNZPR01MB4224.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 51626b1d-a199-41fd-716c-08d8873068df
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2020 17:28:45.0682
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DwcZbP9+l37D62l2SgX7SgbTcpr0hqrMmlCSNJ1SoBzElzWJ2YiLtUNyhWzYV3X8XYz9cDppqCExdP/W9j/5RQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB4300
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_PNZPR01MB42246345F264B3321570C53E90E70PNZPR01MB4224INDP_"

--_000_PNZPR01MB42246345F264B3321570C53E90E70PNZPR01MB4224INDP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

Thanks for the confirmation.

Thanks & Regards,
Purushottam

________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Richard Purdie via lists.openembedded.org <rich=
ard.purdie=3Dlinuxfoundation.org@lists.openembedded.org>
Sent: Thursday, November 12, 2020 6:26 PM
To: Purushottam Choudhary <Purushottam.Choudhary@kpit.com>; openembedded-co=
re@lists.openembedded.org <openembedded-core@lists.openembedded.org>; raj.k=
hem@gmail.com <raj.khem@gmail.com>
Cc: Nisha Parrakat <Nisha.Parrakat@kpit.com>; Anuj Chougule <Anuj.Chougule@=
kpit.com>; Aditya Tayade <Aditya.Tayade@kpit.com>
Subject: Re: [OE-core] [poky][master][PATCH] systemd: selinux hook handling=
 to enumerate nexthop

On Thu, 2020-11-12 at 09:33 +0000, Purushottam choudhary wrote:
> Hi Openembedded/Khem,
>
> Is there any update on this patch?
>
> Could you please let me know?

Its merged in master?

https://apc01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fgit.yoct=
oproject.org%2Fcgit.cgi%2Fpoky%2Fcommit%2F%3Fid%3Dec37a2be661bbaa494455a541=
7db148495920039&amp;data=3D04%7C01%7Cpurushottam.choudhary%40kpit.com%7Cdb5=
0284ca0484f529a0008d8870a60ff%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C=
637407825958213035%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2lu=
MzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DLburxF64bQEONDaryJB35=
DBr4bRLas6wg8GWudVOID0%3D&amp;reserved=3D0

Cheers,

Richard

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

--_000_PNZPR01MB42246345F264B3321570C53E90E70PNZPR01MB4224INDP_
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
Hi Richard,<br>
<br>
Thanks for the confirmation.<br>
</div>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">
<div>
<div name=3D"divtagdefaultwrapper" style=3D"font-family:Calibri,Arial,Helve=
tica,sans-serif; font-size:; margin:0">
<div>Thanks &amp; Regards,</div>
<div>Purushottam<br>
</div>
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
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size:11pt" face=
=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> openembedded-core@l=
ists.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on b=
ehalf of Richard Purdie via lists.openembedded.org
 &lt;richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org&gt;<br>
<b>Sent:</b> Thursday, November 12, 2020 6:26 PM<br>
<b>To:</b> Purushottam Choudhary &lt;Purushottam.Choudhary@kpit.com&gt;; op=
enembedded-core@lists.openembedded.org &lt;openembedded-core@lists.openembe=
dded.org&gt;; raj.khem@gmail.com &lt;raj.khem@gmail.com&gt;<br>
<b>Cc:</b> Nisha Parrakat &lt;Nisha.Parrakat@kpit.com&gt;; Anuj Chougule &l=
t;Anuj.Chougule@kpit.com&gt;; Aditya Tayade &lt;Aditya.Tayade@kpit.com&gt;<=
br>
<b>Subject:</b> Re: [OE-core] [poky][master][PATCH] systemd: selinux hook h=
andling to enumerate nexthop</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">On Thu, 2020-11-12 at 09:33 +0000, Purushottam cho=
udhary wrote:<br>
&gt; Hi Openembedded/Khem,<br>
&gt; <br>
&gt; Is there any update on this patch?<br>
&gt; <br>
&gt; Could you please let me know?<br>
<br>
Its merged in master?<br>
<br>
<a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F=
%2Fgit.yoctoproject.org%2Fcgit.cgi%2Fpoky%2Fcommit%2F%3Fid%3Dec37a2be661bba=
a494455a5417db148495920039&amp;amp;data=3D04%7C01%7Cpurushottam.choudhary%4=
0kpit.com%7Cdb50284ca0484f529a0008d8870a60ff%7C3539451eb46e4a26a242ff615028=
55c7%7C0%7C0%7C637407825958213035%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DLb=
urxF64bQEONDaryJB35DBr4bRLas6wg8GWudVOID0%3D&amp;amp;reserved=3D0">https://=
apc01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fgit.yoctoproject=
.org%2Fcgit.cgi%2Fpoky%2Fcommit%2F%3Fid%3Dec37a2be661bbaa494455a5417db14849=
5920039&amp;amp;data=3D04%7C01%7Cpurushottam.choudhary%40kpit.com%7Cdb50284=
ca0484f529a0008d8870a60ff%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6374=
07825958213035%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIi=
LCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DLburxF64bQEONDaryJB35=
DBr4bRLas6wg8GWudVOID0%3D&amp;amp;reserved=3D0</a><br>
<br>
Cheers,<br>
<br>
Richard<br>
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

--_000_PNZPR01MB42246345F264B3321570C53E90E70PNZPR01MB4224INDP_--
