Return-Path: <ernst.sjostrand@verisure.com>
X-Greylist: delayed 1551 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 18 Nov 2019 15:45:58 UTC
Received: from mx08-00271601.pphosted.com (mx08-00271601.pphosted.com
	[62.209.51.218])
	by mail.openembedded.org (Postfix) with ESMTP id DD8947F893
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 15:45:58 +0000 (UTC)
Received: from pps.filterd (m0107398.ppops.net [127.0.0.1])
	by mx08-00271601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	xAIFEOP1018828; Mon, 18 Nov 2019 16:20:03 +0100
Received: from eur04-db3-obe.outbound.protection.outlook.com
	(mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50])
	by mx08-00271601.pphosted.com with ESMTP id 2wahxbpet4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 18 Nov 2019 16:20:02 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=O7C3BCLCJa90NlNZmpUNEvcTYpM/5TKLcbEucHD74coC4gWKNM91th06HmJz9ve38slkzxmWsVjlyv8uTkSSELEaSHtcsoHDAblcORNyzPIQ+VRDqb/UejpefrPyguIVHBsqL+rzRrhRoGIo2vq0WLRmF0z5Z3/decJCMflP65tGwIO30y0A/5LD9PWKx9jgnBpcINjHT3ZAs/8tJWd3TCenF2fyA7hpCa//h0B2f7vIJQjV+WATavOGPkggxJMpM3UjR8Vvf3RKsuNjfb3RrUZ8C/paZgiLoOkQyCeeOiKm09fJsi/1dPDAJFSiWD7E8N600mTwzlkP0X5TXsRSkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=ou7FQeeHYmsInVbWUNmdMG6kgbTn4oRAPpbbGeBe5Tc=;
	b=RYOvrSK7+OXFujJSG1OCrsltx6NObUX5JeQrBDcCM+SiTguw0ECtn4wuTOOKb4BvF54r03tAKOEqvGh0uhT/8aY5cJlGfyosbI+fF1bBjcb6+jiXC5R1KktlzCvrYepY2SDqi5YbV/RlnUxDN4g1+K57mRZfP6L1JjtRXJpaRg1CYogh0CcI2KrExlgHbVEvqpJa/4Mmkg9Mj3aAyNJn6HxEF2tAhSFDzP1OyIGFt27y4ThYjXvFI8OA36QMsrJTmGc8tmqHbYOTmFsnzpdhupOdxy2hJAG3NomRvrl3/iqMB4bnDOP27hfdHuNFfQBZAv/fSIu2TBLmYZWPhuO+sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=verisure.com;
	dmarc=pass action=none header.from=verisure.com; 
	dkim=pass header.d=verisure.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=verisure.onmicrosoft.com; s=selector1-verisure-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=ou7FQeeHYmsInVbWUNmdMG6kgbTn4oRAPpbbGeBe5Tc=;
	b=RpEa8zpbADOf+/crEUPxMs/nY0GmR9pPR7Z5rCzcmzHuBiE5XAyoGBiXm5kYtS/F7Ars4HIrvpWc1u97Cx/aT5CoZp+Df3SA/PW8UU3KkWNGcwscEWgB0Q2wHtZXLEk2d5HMYAAC13Q+IkLhTABKPHnmQBuK1eavvUIqN05ROUk=
Received: from AM0PR10MB2099.EURPRD10.PROD.OUTLOOK.COM (52.134.85.19) by
	AM0PR10MB3171.EURPRD10.PROD.OUTLOOK.COM (52.132.215.201) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2451.23; Mon, 18 Nov 2019 15:19:59 +0000
Received: from AM0PR10MB2099.EURPRD10.PROD.OUTLOOK.COM
	([fe80::bc11:d703:c672:3d62]) by
	AM0PR10MB2099.EURPRD10.PROD.OUTLOOK.COM
	([fe80::bc11:d703:c672:3d62%4]) with mapi id 15.20.2451.029;
	Mon, 18 Nov 2019 15:19:59 +0000
From: =?iso-8859-1?Q?Ernst_Sj=F6strand?= <ernst.sjostrand@verisure.com>
To: Ross Burton <ross.burton@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] do_image_cpio: Improve reproducibility
Thread-Index: AQHVnfQ80DT9j/UJT0iIEauew/UUoaeQ/wQAgAAKbs0=
Date: Mon, 18 Nov 2019 15:19:59 +0000
Message-ID: <AM0PR10MB20990993BB2A1B1EF84C7C8B944D0@AM0PR10MB2099.EURPRD10.PROD.OUTLOOK.COM>
References: <ea9c1aec639f2c505e8beb3faa7366ee7db4174a.camel@verisure.com>,
	<6fedce54-e7dd-71bd-dd0d-96fc542664ce@intel.com>
In-Reply-To: <6fedce54-e7dd-71bd-dd0d-96fc542664ce@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [83.254.138.119]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: af120bdb-6479-4a3e-d080-08d76c3ac68b
x-ms-traffictypediagnostic: AM0PR10MB3171:
x-microsoft-antispam-prvs: <AM0PR10MB3171E63B60F272A0C2EE75F5944D0@AM0PR10MB3171.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0225B0D5BC
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(39860400002)(396003)(136003)(376002)(366004)(346002)(189003)(199004)(6436002)(478600001)(52536014)(9686003)(236005)(6306002)(55016002)(74316002)(99286004)(54896002)(966005)(2906002)(229853002)(102836004)(53546011)(105004)(25786009)(186003)(486006)(476003)(81156014)(81166006)(26005)(446003)(6506007)(19627405001)(11346002)(8676002)(7696005)(7736002)(76176011)(6246003)(66066001)(86362001)(33656002)(8936002)(6116002)(3846002)(2501003)(71200400001)(66556008)(71190400001)(66476007)(66946007)(64756008)(14444005)(256004)(14454004)(5660300002)(110136005)(76116006)(606006)(66574012)(66446008)(316002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR10MB3171;
	H:AM0PR10MB2099.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: verisure.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: quLGyOYY1EzrkeneshQn9ntPULvAjWc3JV8xzYEbeyx3D+zfhRk/Xwdmt/sanyHD5mXiUyAqWotXbi0LPNj9BeUg/0rZj9kyuq5sEKBbqNzw0YYUBHNxtbn2iTqvR8rF2AUkTb89uJ22+ykA3XHjiISdSBmolw23Z9IVP6c/7eur/5jOutxSl7iPhHre3yDOYl+x938xWvZNhqhhO/GK5o5N9C6BPMHgKNFrCFQdKWA04qWQvcqsEREHWJ7hkwaTtE6eJ6gIOoED5dwkjxVfwDtgQmQ+3Xa1dQHnVyRa5Em0Aon886YNd/WbQyE3qAyh36LbI2Xy2qVlEl64eU/LxO+2yZ9oelHOvAYx+u3diEkF45qYiy5/FDR36Tyji+uJHFTOSIWQh/lGzRVCo3hX7xYpS06Vy1cZeMS3bc7N4JsqW6R3CDW+qJ7VHG9hyPyX
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: verisure.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af120bdb-6479-4a3e-d080-08d76c3ac68b
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2019 15:19:59.0539 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3055fa7f-a944-4927-801e-a62b63119e43
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fe4MF5E4kZxzKA+4i6k00CRdN4xRdBnKg9APmtp5i78Nvq1+XTRFjFBiKKmo416Qq3/DaqINqJGKXWElsluFOy49KcWv0fDUQw8B9CLaQ54=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3171
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
	definitions=2019-11-18_03:2019-11-15,2019-11-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	mlxscore=0 phishscore=0
	priorityscore=1501 lowpriorityscore=0 clxscore=1011 malwarescore=0
	suspectscore=0 spamscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
	impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-1910280000 definitions=main-1911180138
Subject: Re: [PATCH] do_image_cpio: Improve reproducibility
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
X-List-Received-Date: Mon, 18 Nov 2019 15:45:59 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_AM0PR10MB20990993BB2A1B1EF84C7C8B944D0AM0PR10MB2099EURP_"

--_000_AM0PR10MB20990993BB2A1B1EF84C7C8B944D0AM0PR10MB2099EURP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I see, it was created against the yocto/poky git. However I made sure it ap=
plied to openembedded-core with "git am" also.
If you use that it should work. I can create a new version if you want.

Regards
//Ernst
________________________________
From: openembedded-core-bounces@lists.openembedded.org <openembedded-core-b=
ounces@lists.openembedded.org> on behalf of Ross Burton <ross.burton@intel.=
com>
Sent: Monday, November 18, 2019 15:35
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Subject: Re: [OE-core] [PATCH] do_image_cpio: Improve reproducibility

On 18/11/2019 09:40, Ernst Sj=F6strand wrote:
> Find lists files in the order that the filesystem has registered them,
> which can vary. Adding a sort should have minimal performance impact.
> Also use the --reproducible option to cpio.

For some reason this doesn't apply:

Applying: do_image_cpio: Improve reproducibility
Using index info to reconstruct a base tree...
error: patch failed: meta/classes/image_types.bbclass:128
error: meta/classes/image_types.bbclass: patch does not apply
error: Did you hand edit your patch?
It does not apply to blobs recorded in its index.
Patch failed at 0001 do_image_cpio: Improve reproducibility

Ross
--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
https://urldefense.com/v3/__http://lists.openembedded.org/mailman/listinfo/=
openembedded-core__;!!BFCLnRDDbM3FOmw!pzTjX-9fH0eNz5xLqWdhAP0q_Ns8zaAaf7amS=
kaV7fLGmXkB-29C2Awxih5o3OdxaDAFDw$

--_000_AM0PR10MB20990993BB2A1B1EF84C7C8B944D0AM0PR10MB2099EURP_
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
<div style=3D"color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);"><=
span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">I see, =
it was created against the yocto/poky
 git. However I made sure it applied </span>to openembedded-core with &quot=
;git am&quot; also.</div>
<div style=3D"color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">I=
f you use that it should work. I can create a new version if you want.</div=
>
<div style=3D"color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);"><=
br>
</div>
<div style=3D"color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">R=
egards</div>
<div style=3D"color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">/=
/Ernst<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core-bou=
nces@lists.openembedded.org &lt;openembedded-core-bounces@lists.openembedde=
d.org&gt; on behalf of Ross Burton &lt;ross.burton@intel.com&gt;<br>
<b>Sent:</b> Monday, November 18, 2019 15:35<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH] do_image_cpio: Improve reproducibilit=
y</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On 18/11/2019 09:40, Ernst Sj=F6strand wrote:<br>
&gt; Find lists files in the order that the filesystem has registered them,=
<br>
&gt; which can vary. Adding a sort should have minimal performance impact.<=
br>
&gt; Also use the --reproducible option to cpio.<br>
<br>
For some reason this doesn't apply:<br>
<br>
Applying: do_image_cpio: Improve reproducibility<br>
Using index info to reconstruct a base tree...<br>
error: patch failed: meta/classes/image_types.bbclass:128<br>
error: meta/classes/image_types.bbclass: patch does not apply<br>
error: Did you hand edit your patch?<br>
It does not apply to blobs recorded in its index.<br>
Patch failed at 0001 do_image_cpio: Improve reproducibility<br>
<br>
Ross<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
Openembedded-core@lists.openembedded.org<br>
<a href=3D"https://urldefense.com/v3/__http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core__;!!BFCLnRDDbM3FOmw!pzTjX-9fH0eNz5xLqWdhAP0q_N=
s8zaAaf7amSkaV7fLGmXkB-29C2Awxih5o3OdxaDAFDw$">https://urldefense.com/v3/__=
http://lists.openembedded.org/mailman/listinfo/openembedded-core__;!!BFCLnR=
DDbM3FOmw!pzTjX-9fH0eNz5xLqWdhAP0q_Ns8zaAaf7amSkaV7fLGmXkB-29C2Awxih5o3Odxa=
DAFDw$</a>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_AM0PR10MB20990993BB2A1B1EF84C7C8B944D0AM0PR10MB2099EURP_--
