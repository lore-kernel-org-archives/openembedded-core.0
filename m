Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.43])
 by mx.groups.io with SMTP id smtpd.web08.3517.1608764621765620627
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 15:03:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=f6/BQNRK;
 spf=pass (domain: arm.com, ip: 40.107.22.43, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=muJyHzy4itXu9hLVBxUvjTd5PpYLFSATl32tzCy/gt4=;
 b=f6/BQNRKf++jlyeJarmWYVw250J/cbUTl4+sTurpvN7TykcwPCxhRfJZf+CpM6v+7Kd9SXbI0U4nYUkdUOHTAhohAVxZX7RL9nqse66q14VS5Aiu+ueaiA4FaKNBlwWv0VILwN3ZNoCkDhnIawjSUjbg/1g+q0QTwO02ZmKUE7Q=
Received: from AM5PR0601CA0033.eurprd06.prod.outlook.com
 (2603:10a6:203:68::19) by DBBPR08MB6172.eurprd08.prod.outlook.com
 (2603:10a6:10:1f4::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.33; Wed, 23 Dec
 2020 23:03:39 +0000
Received: from AM5EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:68:cafe::83) by AM5PR0601CA0033.outlook.office365.com
 (2603:10a6:203:68::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27 via Frontend
 Transport; Wed, 23 Dec 2020 23:03:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.openembedded.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.openembedded.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT057.mail.protection.outlook.com (10.152.17.44) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.22 via Frontend Transport; Wed, 23 Dec 2020 23:03:38 +0000
Received: ("Tessian outbound 6af064f543d4:v71"); Wed, 23 Dec 2020 23:03:38 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: dbf09f8d03173df3
X-CR-MTA-TID: 64aa7808
Received: from 604f77f3d666.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id EF2F7092-2F1C-4207-8904-F181FCB89B1C.1;
	Wed, 23 Dec 2020 23:03:22 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 604f77f3d666.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 23 Dec 2020 23:03:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YdJ8pi3TS/NCdys7dH8eZouRyuWGZQmwo1Xtn6ojSG3XUh8TjlfoMwl2rEKPQbYuTRv+lImWm8cSukKQ6XET08O0jNudnrw1ryiCVmIfFoyQTeGGRsu9bo3pH/72jnygTCWK4XpPY6eHm/+54w/iSsctmsv0h8dty0GReDnXfBrHAm7FUEzXkF3j1aKZ12pO8coE06DFmLkammt0L1RvDYipm6/W9M7OA9CjGLUWJp7k4BvySsj6AtdILr9ZvFna4eOmXYomokTTAv096x6on5p0mh45md/kjSznQGhV8iWWLLcCnUgo5Xg0iLEONeIuOQiwjIhS6ooRDa0oH4i26Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=muJyHzy4itXu9hLVBxUvjTd5PpYLFSATl32tzCy/gt4=;
 b=H2EZ7zHE0kTkuB1TQwJVDCeuccXzfXg/B4PIoRc/hOA5X73A5MwNAs2bEWSz+akeE11QLW5FTfRglSWxT3iIwlDasMB5lAclC/zKMGjDargly8nybU3aQr54mILNXfB9Jj8/hyBf5CDuEjLMt4ad8kn6HmlEDBDruADws0BEFIc2DFMDaI2uNLQB0rY+YHe6nKo8F9aJaC4Hyf75M6UZLFnYhG9rxLpWhjxsQsAEDa/i+NI166/XjyMQNgTkCVnmieT4U2QUd2Ok9TvIzDw+GtuSR92zEgICtNvfjqrR5gWhlbw1SL42cxEj72ISwXpHZ73pH4ZSPpJ0jyQewxhh1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=muJyHzy4itXu9hLVBxUvjTd5PpYLFSATl32tzCy/gt4=;
 b=f6/BQNRKf++jlyeJarmWYVw250J/cbUTl4+sTurpvN7TykcwPCxhRfJZf+CpM6v+7Kd9SXbI0U4nYUkdUOHTAhohAVxZX7RL9nqse66q14VS5Aiu+ueaiA4FaKNBlwWv0VILwN3ZNoCkDhnIawjSUjbg/1g+q0QTwO02ZmKUE7Q=
Received: from AM4PR0802MB2162.eurprd08.prod.outlook.com
 (2603:10a6:200:5c::13) by AM0PR08MB3124.eurprd08.prod.outlook.com
 (2603:10a6:208:5e::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Wed, 23 Dec
 2020 23:03:19 +0000
Received: from AM4PR0802MB2162.eurprd08.prod.outlook.com
 ([fe80::59ff:d451:a561:df37]) by AM4PR0802MB2162.eurprd08.prod.outlook.com
 ([fe80::59ff:d451:a561:df37%12]) with mapi id 15.20.3700.026; Wed, 23 Dec
 2020 23:03:19 +0000
From: "Ross Burton" <ross@burtonini.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
CC: Jon Mason <Jon.Mason@arm.com>, "Mittal, Anuj" <anuj.mittal@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/9] kernel: consolidated pull request
Thread-Topic: [PATCH 0/9] kernel: consolidated pull request
Thread-Index: AQHW2SfUwpFP8rCn8EWnNjlTptqiGKoEr0MAgACdvlg=
Date: Wed, 23 Dec 2020 23:03:19 +0000
Message-ID: 
 <AM4PR0802MB2162043FB6BB14A6F02A69E9E8DE0@AM4PR0802MB2162.eurprd08.prod.outlook.com>
References: <cover.1608646697.git.bruce.ashfield@gmail.com>
 <ef75b7d902ee23f65adf34742a71b1b8ee8c64cb.camel@linuxfoundation.org>,<CADkTA4NJEXWs3DeXKaM_215Ue5g=ZoCrR6O-7CyvSytRv3z5jg@mail.gmail.com>
In-Reply-To: 
 <CADkTA4NJEXWs3DeXKaM_215Ue5g=ZoCrR6O-7CyvSytRv3z5jg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [81.2.106.35]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9e715b58-25bc-43be-74ae-08d8a796fbeb
x-ms-traffictypediagnostic: AM0PR08MB3124:|DBBPR08MB6172:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<DBBPR08MB61724A98BA1FCF1411B6927EE8DE0@DBBPR08MB6172.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:5797;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 +bhZfgzwLJMsXxJoa+6TRSle0doPDiUG6C5OFaZrqfDPc00K0K0rpNMHO+JjLh+6Ftra7x7aU78x0uhdzLOIlgRCBoHodH7/CBVwURzmKik0YmVWQRNNc05hi4g/6RvRZ3FBjAJ0WKppQOwre2ogKabLUo06lwwr99NQUnfNQP+5IJBGHbHuASrX4X1H75IbTzjB7gviHPVhDAESVGAE6jEq+6s7nhXe4jE1L102Edgmk/ItusPKDn2Fhb0BRMtENbjz4BPeJap5k4TPf3x7QMNzLN8MYyW3iZ6f12shwc9/o7AtmPY3llycWvHrwt57mv67+zQsDd9ga72/+EZ0f0h9H79L0+MH4PRtYOUe/yAUw5Ml2PPsIWxc5EOj5HZzYFSJHt54OscatfRzy7gi2w==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM4PR0802MB2162.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(39850400004)(366004)(396003)(376002)(66556008)(66446008)(66476007)(54906003)(8676002)(76116006)(64756008)(91956017)(66946007)(33656002)(52536014)(71200400001)(186003)(7696005)(316002)(26005)(83380400001)(4326008)(110136005)(5660300002)(55016002)(6506007)(4744005)(86362001)(2906002)(8936002)(478600001)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?ne4g7cAtqPs8M/4IL97Fm5aIOQf7/Ug/3ha2tI5Er3N2N8sdIFLJWqNzl3xX?=
 =?us-ascii?Q?Wh6qZ2Ga1+ZxBvhLmvb/KgqA6FMiREaJcxXLh/3WCXKnuY0YjJqtZQMupd2D?=
 =?us-ascii?Q?mE4a7VKCkaadEfHUyAzh0h4SbogWX/XH3Fk2cbEjo+8mz5AAXaH3g0kjLZmd?=
 =?us-ascii?Q?T9ic/Q7r8bDKKlsYxPJysRubjwuSVaXBHmguTVZAl3WCEvzi8Lbw+v1lbimo?=
 =?us-ascii?Q?O/dUSyAw8tvN4L21BN1kBg1nGdZm30KO572YUPdiOfZROX6g2CGE8Z1QXcFS?=
 =?us-ascii?Q?U+APKbbKiNpc9ZjXRBdFXVMe6Vmf7/KzAEby8Y7dVRZHXpl6qn+oWU43Wc3U?=
 =?us-ascii?Q?QqlWCADBNHablkb4/q3PS70QuZ6yCC4jgCDwA4DJKioEEk4rFTVpbbqukutT?=
 =?us-ascii?Q?6yluTpBWdTKOTOtIq1JZUElbxQc5L/LesZas5haIGzJX4J48as/KamaPXddN?=
 =?us-ascii?Q?XHjbUhHEIS+6xZri/t4EJ7qMW9tjNvCPoYrb5NAX5MJROUNQAS6Qb92VDjpb?=
 =?us-ascii?Q?lxkrayBk8J2G9XpE4KCIO+1PBuZ8tYtzO3pOzDEM9XCXnoptH/VW38RymExo?=
 =?us-ascii?Q?p4KBdyAH1JT/u/TcmX+AotzeV8hEumjZMXqKsxtOK3WAleKGG1Fn2ukuH2Xv?=
 =?us-ascii?Q?pe+X5Ck5rR2eEFFWMvNb9H0fI0bT5t9PY+c0pNZBGz0BL4uPTq/XfL9zyY5V?=
 =?us-ascii?Q?bdMh7R5JDqeA/dnZEdHswdO16UOHeoUC5fimStLJpS1zg/6YF5cZJE8UBkpa?=
 =?us-ascii?Q?C++AwDlen47yajtXAc0yxuBahpOElP8AQaH2yVn0vaoy4ynAh4AZU+PmlOjR?=
 =?us-ascii?Q?xO0jKRGWXBqPW+aFZ2D4HxRcXiEJxRnssTt9qAGi1EH/BI5wn+q5MBUsWLbt?=
 =?us-ascii?Q?UM+QAbjrS8VF0Ca//3Ya1Ul053Qb/OPjBbEAL1u+iQRC1RnP6iAmjQE1zoDU?=
 =?us-ascii?Q?od7N57GuFzrCWL3ifW0GSXQ2VfJFFIBZRE2Hsf5AcaFEP5lVCCzBznNSrJmw?=
 =?us-ascii?Q?CM9u?=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3124
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
Return-Path: Ross.Burton@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4f8a296a-4ed0-44ef-83a8-08d8a796f063
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ffvj0/rcrGv/5MCJd4E4WVIqxrje0SNQJD1Ic50DAMneYNeEtFYXN0P/NleNM4JxIhEY5BlXiH1Fm0glvwrO/8/ful/UeoTK6bhKEUKB2S/ZZTTM7c3nV99jSYRa8jQaY61dFYcbdo6ny8xihGGB7YB9lREhX0+MIgViZcDvPaFrWxweMXwLITkAiezwMH33uybaTxInmQk1+wOdMp8pBFi7OrhD0zIn/fNKW+tBduh1vcSVhy6osCLfIGlZ9Mkt03Rtk8EOeWVK8hH5iN9Ahwci8d7JJymJLzkvX8ucitFpbqKSTA4UWuVkxzyB4hvR6TCFYwifwvqJqY5qjvXKDZ1i6yZ64n3Y2YoQ4HueDUF6oz1dHe49pUnW5fSrLxc3CnC/oQWwwQDAPBO+ViYxuKvtJ7afxUxrT0f4uWTkhc828HQk788jCQ+k3QXlCnGoxraV3yZW4uJfEf7GNkpllg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(39840400004)(396003)(376002)(346002)(46966006)(70206006)(55016002)(316002)(356005)(336012)(186003)(4326008)(8676002)(33656002)(83380400001)(52536014)(54906003)(9686003)(478600001)(47076005)(70586007)(86362001)(6506007)(81166007)(82310400003)(26005)(8936002)(5660300002)(110136005)(2906002)(7696005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2020 23:03:38.5750
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e715b58-25bc-43be-74ae-08d8a796fbeb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6172
Content-Language: en-GB
Content-Type: multipart/alternative;
	boundary="_000_AM4PR0802MB2162043FB6BB14A6F02A69E9E8DE0AM4PR0802MB2162_"

--_000_AM4PR0802MB2162043FB6BB14A6F02A69E9E8DE0AM4PR0802MB2162_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> I'll tweak the v5.4 meta data and send it as a separate patch.

Will that tweak the metadata sufficiently to fix the problem?  That was the=
 Juno machine failing, and that just uses defconfig.

KBUILD_DEFCONFIG_juno =3D "defconfig"
KCONFIG_MODE_juno =3D "--alldefconfig"

Cheers,
Ross
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

--_000_AM4PR0802MB2162043FB6BB14A6F02A69E9E8DE0AM4PR0802MB2162_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
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
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-GB" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<div>
<p class=3D"MsoNormal">&gt; I'll tweak the v5.4 meta data and send it as a =
separate patch.<br>
<br>
<o:p></o:p></p>
<p class=3D"MsoNormal">Will that tweak the metadata sufficiently to fix the=
 problem?&nbsp; That was the Juno machine failing, and that just uses defco=
nfig.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">KBUILD_DEFCONFIG_juno =3D &quot;defconfig&quot;<o:p>=
</o:p></p>
<p class=3D"MsoNormal">KCONFIG_MODE_juno =3D &quot;--alldefconfig&quot;<o:p=
></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Cheers,<o:p></o:p></p>
<p class=3D"MsoNormal">Ross<o:p></o:p></p>
</div>
</div>
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose,
 or store or copy the information in any medium. Thank you.
</body>
</html>

--_000_AM4PR0802MB2162043FB6BB14A6F02A69E9E8DE0AM4PR0802MB2162_--
