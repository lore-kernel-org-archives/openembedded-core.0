Return-Path: <Hugues.Kamba@arm.com>
X-Greylist: delayed 53262 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 31 Oct 2018 02:56:56 UTC
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
	(mail-eopbgr00069.outbound.protection.outlook.com [40.107.0.69])
	by mail.openembedded.org (Postfix) with ESMTP id F042172EA6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Oct 2018 02:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
	s=selector1-arm-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=SrAcQOEPaHq3iaKdfCC7i0J0UIIM1D8mOkBTnL6KEkA=;
	b=or5mTrFSY4/Dsdd2ANACkL25kMc4nfuZ0RUyePrl3tqo6f7pEuAransHrUg6YYeSuZNZ0iFwgwsfA1QaCmTVnXjQ4Cd4mTz6Vir4/H5VDEks7iIHM480lhN4WpKHbCP+QfggRQj6TlyMUfByT59xfYu1KdccMn33mIsHgaWY4Nk=
Received: from VI1PR08MB3631.eurprd08.prod.outlook.com (20.177.61.82) by
	VI1PR08MB0653.eurprd08.prod.outlook.com (10.163.169.144) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1273.25; Tue, 30 Oct 2018 17:22:50 +0000
Received: from VI1PR08MB3631.eurprd08.prod.outlook.com
	([fe80::545d:f7d:7c9e:bf11]) by VI1PR08MB3631.eurprd08.prod.outlook.com
	([fe80::545d:f7d:7c9e:bf11%2]) with mapi id 15.20.1273.025;
	Tue, 30 Oct 2018 17:22:50 +0000
From: Hugues Kamba <Hugues.Kamba@arm.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH v2] python3: Fix python3-pyvenv run-time
	dependency
Thread-Index: AQHUcDQqfCB08Ue58EaZPet6Df5zN6U39K0AgAAB0K+AAAGHgIAAEfH1
Date: Tue, 30 Oct 2018 17:22:50 +0000
Message-ID: <VI1PR08MB363149A6F54AF72EF72DE29598CC0@VI1PR08MB3631.eurprd08.prod.outlook.com>
References: <20181030093655.26251-1-hugues.kamba@arm.com>
	<CAJTo0LZsRLrwRTDyU6iFHjdm6PwajpLjRN3RbufZLuik0bCdxw@mail.gmail.com>
	<VI1PR08MB36316D19DEB81B04D36EE6C798CC0@VI1PR08MB3631.eurprd08.prod.outlook.com>,
	<CAJTo0LZeQheF0VN=cOiyu+Ju6=38uCUBjv_=oRSgJmMP+cuM4w@mail.gmail.com>
In-Reply-To: <CAJTo0LZeQheF0VN=cOiyu+Ju6=38uCUBjv_=oRSgJmMP+cuM4w@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Hugues.Kamba@arm.com; 
x-originating-ip: [40.119.148.47]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; VI1PR08MB0653;
	6:taG8h7JV2rq2s7N2CFbEchgk0YOYUAbaUqbM6clMc+7RZ/GTCvktQHaVRhQG8CKl2TQP2P9j+Tnnv3e6AsgJucSUoY/iC+nD/51U4gHjSiLmORnrLm4IWr/g90q/mpp4l2dbUhMIrYb8yN0XR+7Ni8Xs4e9oZ4Agi1fHYCTph+S4FLkGZoaV8ssDu/R5TFIAIeGsR7haq1P5/O2M+DC4i4Cq+Ad6W7RSMuH6abxMY9euqiMBNCxWjUaiCdkAcYKprPdpdy3yM7BaUJ4SODxz2397CkchELoZvQYmIXwJKoSOn47gwPX6UcxjWy8deNjVaZARGEI/n11Nj9FX9r136HanHFd/umo92A1sxtINF45mD1RR5NekrJRzG+095p/YaYG4v5c+GKwV74A9YhOPLDvUgmmC+23qpj1WW9bTZeijv9I2O7a1MKoeDQAHZrzADoI2o/bk6pEmitsnX6YBdQ==;
	5:NQn5thX9RhQYGxwH5ht8SRdjzS6sklCznksnpHWznTJ4ZkAG9P/jT3JqeeyubjCjvV02DoSTB1bbNVXYruo/pfxyoRE3J7SZntAOPro6CYGWsnzG7mzhMyEtqWSaOkIe9RKR6En+DM1ukfNZfp/0uHKOkOckaxik+Fmf77ILUW0=;
	7:hL4lIPdbmj313beqlG7h6XCspMQkA8JauEMluSllfY3zpizEr4DnrnozeArUmkIpxFbcXLU4BgPLZ8zZdDE3F7e0jsvM7ObgunV9fxXScNcekDJngr5xflJy+XSgy7ubUepxc6kSi958UOvBWYrd7w==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: f81f1fe5-651b-48b5-7aa5-08d63e8c51ba
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:VI1PR08MB0653; 
x-ms-traffictypediagnostic: VI1PR08MB0653:
x-microsoft-antispam-prvs: <VI1PR08MB0653442CA493A4999524034598CC0@VI1PR08MB0653.eurprd08.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(228905959029699)(180628864354917)(158342451672863)(265313219721884);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93001095)(10201501046)(3002001)(3231382)(944501410)(52105095)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(20161123564045)(20161123560045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
	SRVR:VI1PR08MB0653; BCL:0; PCL:0; RULEID:; SRVR:VI1PR08MB0653; 
x-forefront-prvs: 08417837C5
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(39860400002)(366004)(376002)(346002)(136003)(396003)(40434004)(189003)(199004)(606006)(72206003)(97736004)(74316002)(71190400001)(14454004)(33656002)(7736002)(66066001)(476003)(25786009)(71200400001)(446003)(256004)(14444005)(8936002)(81156014)(4326008)(81166006)(26005)(486006)(11346002)(186003)(6436002)(478600001)(5024004)(45080400002)(6506007)(105586002)(106356001)(102836004)(5250100002)(76176011)(8676002)(68736007)(86362001)(316002)(6916009)(7696005)(93886005)(54896002)(53546011)(5660300001)(55016002)(53936002)(6306002)(6116002)(6246003)(9686003)(236005)(229853002)(99286004)(2906002)(2900100001)(3846002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB0653;
	H:VI1PR08MB3631.eurprd08.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: 4F0o0CXbK4dDdmKlp8SfdLqiXtcUU2iqLbsZkxbxzB54rzu9qy9vZoS2wiKIj7gl/XnH5fouAApLRn/quaL90pihuSLxNV/E+PndIr2A7xIn9aQPiZp66JSUHrBwD4jDv/PPqjg6lzTUOJZdv6bxeDFHDU8UkRPVpMbl2tVB7/GjyqWnewDjrjbYVEDluyRatl3KoKhMSZYcprxPR8A52/BrSPURu424UPOatQzggnzaZ2TyH7ocb9oveU+3ReMIT8BeFnW5oonHNchzPtYnZ4ghZY5roa37bxBvnUf+XuoVBTxZZjH9UNYYkuWX5Z1Dl7toTWDCabHlnm1H5XN7WvQbwH7G89iocqDdLqGQPRA=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f81f1fe5-651b-48b5-7aa5-08d63e8c51ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2018 17:22:50.5616 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB0653
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] python3: Fix python3-pyvenv run-time dependency
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
X-List-Received-Date: Wed, 31 Oct 2018 02:56:57 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_VI1PR08MB363149A6F54AF72EF72DE29598CC0VI1PR08MB3631eurp_"

--_000_VI1PR08MB363149A6F54AF72EF72DE29598CC0VI1PR08MB3631eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I am still new to Yocto but my understanding of adding pyvenv to venv's RPR=
OVIDES is that python3-pyvenv is available (albeit as an alias of python3-v=
env).
I therefore have not removed the possibility for one to choose to include t=
he pyvenv package instead of the new venv package.
In fact, I tested building with python3-pyvenv included.
Which parts of the conmit message are contradicting according to you?

Hugues

Get Outlook for Android<https://aka.ms/ghei36>

________________________________
From: Burton, Ross <ross.burton@intel.com>
Sent: Tuesday, October 30, 2018 4:18:37 PM
To: Hugues Kamba
Cc: OE-core
Subject: Re: [OE-core] [PATCH v2] python3: Fix python3-pyvenv run-time depe=
ndency

On Tue, 30 Oct 2018 at 16:13, Hugues Kamba <Hugues.Kamba@arm.com> wrote:
> I am not sure where you saw the commit message say that pyvenv has been r=
emoved.

The python3-pyvenv package is literally being removed:

packages/corei7-64-poky-linux/python3: PACKAGES: removed
"python3-pyvenv", added "python3-venv"

Ross
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

--_000_VI1PR08MB363149A6F54AF72EF72DE29598CC0VI1PR08MB3631eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<div>
<div dir=3D"auto" style=3D"direction:ltr; margin:0; padding:0; font-family:=
sans-serif; font-size:11pt; color:black">
I am still new to Yocto but my understanding of adding pyvenv to venv's RPR=
OVIDES is that python3-pyvenv is available (albeit as an alias of python3-v=
env).<br>
</div>
<div dir=3D"auto" style=3D"direction:ltr; margin:0; padding:0; font-family:=
sans-serif; font-size:11pt; color:black">
I therefore have not removed the possibility for one to choose to include t=
he pyvenv package instead of the new venv package.<br>
</div>
<div dir=3D"auto" style=3D"direction:ltr; margin:0; padding:0; font-family:=
sans-serif; font-size:11pt; color:black">
In fact, I tested building with python3-pyvenv included.<br>
</div>
<div dir=3D"auto" style=3D"direction:ltr; margin:0; padding:0; font-family:=
sans-serif; font-size:11pt; color:black">
Which parts of the conmit message are contradicting according to you? <br>
<br>
</div>
<div dir=3D"auto" style=3D"direction:ltr; margin:0; padding:0; font-family:=
sans-serif; font-size:11pt; color:black">
Hugues <br>
<br>
</div>
<div dir=3D"auto" style=3D"direction:ltr; margin:0; padding:0; font-family:=
sans-serif; font-size:11pt; color:black">
<div dir=3D"auto" style=3D"direction:ltr; margin:0; padding:0; font-family:=
sans-serif; font-size:11pt; color:black">
Get <a href=3D"https://aka.ms/ghei36">Outlook for Android</a></div>
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Burton, Ross &lt;ro=
ss.burton@intel.com&gt;<br>
<b>Sent:</b> Tuesday, October 30, 2018 4:18:37 PM<br>
<b>To:</b> Hugues Kamba<br>
<b>Cc:</b> OE-core<br>
<b>Subject:</b> Re: [OE-core] [PATCH v2] python3: Fix python3-pyvenv run-ti=
me dependency</font>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:11pt;">
<div class=3D"PlainText">On Tue, 30 Oct 2018 at 16:13, Hugues Kamba &lt;Hug=
ues.Kamba@arm.com&gt; wrote:<br>
&gt; I am not sure where you saw the commit message say that pyvenv has bee=
n removed.<br>
<br>
The python3-pyvenv package is literally being removed:<br>
<br>
packages/corei7-64-poky-linux/python3: PACKAGES: removed<br>
&quot;python3-pyvenv&quot;, added &quot;python3-venv&quot;<br>
<br>
Ross<br>
</div>
</span></font>IMPORTANT NOTICE: The contents of this email and any attachme=
nts are confidential and may also be privileged. If you are not the intende=
d recipient, please notify the sender immediately and do not disclose the c=
ontents to any other person, use
 it for any purpose, or store or copy the information in any medium. Thank =
you.
</body>
</html>

--_000_VI1PR08MB363149A6F54AF72EF72DE29598CC0VI1PR08MB3631eurp_--
