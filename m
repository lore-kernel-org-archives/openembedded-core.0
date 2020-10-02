Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.69])
 by mx.groups.io with SMTP id smtpd.web11.9657.1601626906424906823
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2020 01:21:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=khwkJ4Ul;
 spf=pass (domain: arm.com, ip: 40.107.20.69, mailfrom: brett.warren@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rx9JGiR4mCoTqjKccnJLUvZR7DjKMsDDTiXybn9NYmA=;
 b=khwkJ4UlcGH4EdzzGQjEDbU7O3E84XzWB9NK6fnaRriZ4q/K7pq1LdSZZVSoYWesR+ZscotptEcxfCcoRP/I6lok+xniiWrp8QrhxW6d0JDLubKM5Fy00X5Z+iZBdsWirDN9EMM6GGRxSCMdaAn7nPLzM4buN9s488ZPqPT+S9M=
Received: from DB6PR07CA0113.eurprd07.prod.outlook.com (2603:10a6:6:2c::27) by
 VI1PR08MB3582.eurprd08.prod.outlook.com (2603:10a6:803:89::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.36; Fri, 2 Oct 2020 08:21:44 +0000
Received: from DB5EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2c:cafe::b9) by DB6PR07CA0113.outlook.office365.com
 (2603:10a6:6:2c::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.13 via Frontend
 Transport; Fri, 2 Oct 2020 08:21:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.openembedded.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.openembedded.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT012.mail.protection.outlook.com (10.152.20.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Fri, 2 Oct 2020 08:21:43 +0000
Received: ("Tessian outbound 7a6fb63c1e64:v64"); Fri, 02 Oct 2020 08:21:43 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 630a623846f9d4ec
X-CR-MTA-TID: 64aa7808
Received: from f94ed9573715.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 214AC67D-1205-49C1-A26C-5598A3731149.1;
	Fri, 02 Oct 2020 08:21:21 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f94ed9573715.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 02 Oct 2020 08:21:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nkj6zpgiMY4dS0isgBtQ7Sgme65BZZgEIJL0Avtflgz7BWEVmvh5i3DGp66cSRXPoT8ZGN+wBPVwRJCET3gD3++9tH3aeJumB3/dOzjgdtRxnkWVYdc4VeQOPlm4eiW0WbfO5jCcIu9I/lsFJdAileNafdXEU/d2vHnizsszfZXbwYzfenQQOaLXhaoW5DIJv7CcY686l3QJ9Sjg62Zj6y+U38PmsqK5k3W1wANbyqop5Ux85vEdKn4y0j7mv+P/GLYZMaKyA5KUZMjQp5hYZTfuGGFoQTQvCaAIgVQIvOCKDb9fjFgjduXklgcami7XlHcbelGdFTMgQeAygYkdRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rx9JGiR4mCoTqjKccnJLUvZR7DjKMsDDTiXybn9NYmA=;
 b=UZ1JUmWXG9tSp1loM3MjRrFFyuwVTogK5BQxxJejyCbLIpOCpO8hIb2TmakJZmKbdBAbPwEOG3yICjVaYmws+e0IiinMT5MY/tyuIVe1IO4L7dAtOQzRCi1tMNNqKRQ0gKCjk5j2DcvMptcO6w7Nh5xU0tAhSxkpkrNqt8BOhL8CTDGlXWDWBRnQNdcBmJ1iUwKPqC3fFfqvgMB/Z8PvoDnHMoaWtFz6rV4oXPTlO5PLfcm3Z1LUNMPcDNoPKvAdOVVNTFtF1WISQQCmcBue9OSnlRbPLYNg0EOelwNHD/8tM1dCeSlbkyYgD7xa8T/Gw3ydRsxEUpBWZSCu9hCOog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rx9JGiR4mCoTqjKccnJLUvZR7DjKMsDDTiXybn9NYmA=;
 b=khwkJ4UlcGH4EdzzGQjEDbU7O3E84XzWB9NK6fnaRriZ4q/K7pq1LdSZZVSoYWesR+ZscotptEcxfCcoRP/I6lok+xniiWrp8QrhxW6d0JDLubKM5Fy00X5Z+iZBdsWirDN9EMM6GGRxSCMdaAn7nPLzM4buN9s488ZPqPT+S9M=
Received: from DB6PR0801MB2038.eurprd08.prod.outlook.com (2603:10a6:4:76::19)
 by DB8PR08MB5035.eurprd08.prod.outlook.com (2603:10a6:10:eb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.37; Fri, 2 Oct
 2020 08:21:21 +0000
Received: from DB6PR0801MB2038.eurprd08.prod.outlook.com
 ([fe80::3c91:20d4:3d:f1de]) by DB6PR0801MB2038.eurprd08.prod.outlook.com
 ([fe80::3c91:20d4:3d:f1de%11]) with mapi id 15.20.3412.032; Fri, 2 Oct 2020
 08:21:20 +0000
From: brett.warren@arm.com
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] qemuboot: move QB_MEM to default in qemuboot
Thread-Topic: [OE-core] [PATCH] qemuboot: move QB_MEM to default in qemuboot
Thread-Index: AQHWl/EC7b+Hm9uk8EmxfapFWlcXDqmCsvqAgAAW9YCAAS8v7g==
Date: Fri, 2 Oct 2020 08:21:20 +0000
Message-ID: 
 <DB6PR0801MB2038E7D9B6B0B43283598EDF8D310@DB6PR0801MB2038.eurprd08.prod.outlook.com>
References: <Po14.1601556389979380134.H3Ii@lists.openembedded.org>
	 <CANNYZj9BAUa_JHrUMci_kMOje1_7hsH7pBENW+9TG8u_xVRWtg@mail.gmail.com>,<2e70af274150b6f2749ead2c567af02c807c42c1.camel@linuxfoundation.org>
In-Reply-To: 
 <2e70af274150b6f2749ead2c567af02c807c42c1.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [2a01:4b00:e031:2600:1439:6410:a63e:8ff4]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3c55f9d0-bbc9-4165-8d36-08d866ac3264
x-ms-traffictypediagnostic: DB8PR08MB5035:|VI1PR08MB3582:
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB3582F97CDE3F3359E01C19ED8D310@VI1PR08MB3582.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 b1rAJ5lpAApp8v2FzRdFxEfftXXOISVbo7o+qbkkEXvZ6S8QOCNAesQ0+k/rmXMnUPe1DwwkeSwQH7SxDUsEZnDeJBiiYC7xcHHDhNuP3hNsIpcNbO2hES+FmiTG40/SGXkKGHcC99Y95RASYRi/8OebXCHxuGJatfJPhcm0GuIC18tQ7cqYbb0KhkJzupsNB+pj7/3aR/4RNCCd2IJCz0NPm2iIUZrfZ+xbZ09A3BjpJF3rOrW5kylFMdaFhsMPc75bmvpTfK4ArbJC/IY1QdszYyGKawrrK0H3MGrIRp29lfJ3crBsLv40p4WE0rVge0O9TVX8XQogCMKaBrzAXw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2038.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(136003)(39860400002)(346002)(6506007)(66476007)(66556008)(64756008)(91956017)(33656002)(83380400001)(478600001)(86362001)(9686003)(2906002)(66946007)(8936002)(8676002)(186003)(76116006)(4326008)(55016002)(5660300002)(19627405001)(7696005)(110136005)(66446008)(71200400001)(316002)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 lLgrieUUx56Rk6rh102CJs65e9rXpcATwrdoqHh40qhSihgPPYv3VuqqaSQB4rsfbNIDSe/NHripzDYqcM+R7jRXIcHKYCwt6+TdN7zXvIbYVmuppgwHrzGiETrTnITv1xGEBEPFH4Di20daxAo/oqLhKwXOBgmLG1YdIqo6bqz/ZdvphlNY1Fi2oCLATXoZmIWYwQTICkpyZWALB36KazBovfJxaz/iHVuNVnh+yoxKppGivMtXZWZSUVHpEHIsCYTO5PA9e4kA0oZhN3dZKmVOz58jhgWBICVP4WvEWT9dCOqa0ukXpsg/EVJ0n6mX0cgg4jgJ1gwFuw17NzCFct/0yFVp1kl+coR2k+D+81hljJ/9/toG8cAwxbCUq5DiB9/ZTuanSg9IcEdTZZDomUbvDe6OPv7InKVPfN/zbVR0VrN6u68sdcn93me0HhDaMB+gG9SOLMrSMMNcrwQp/yyLGHgy8AmeB6n7goqpJS5QPqwqTVN9QYbGW6XaPbpdquvn0tJl+ibCh1htCMK6pIMf5uk1Qay0DNp1zR9cScdpmyEFWCkSGYzpgzsFuKc+aZ0OPe7NMxegFx+i09EflRFkzQO/CtVHkeRAXp2XgFFBxYgTI1thnl6ckmbGqQ3eqO1glo10oZJZ25zKHmmnuMNqzVW+DM2xLlD7JqUcNPVARW801Xn9h9bS18vBKDF0urwbQThpS7gURJuXJ8kuXw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5035
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
Return-Path: Brett.Warren@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a04d2a17-4ed4-4a31-8ecd-08d866ac24bb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CVuVrQk+I44ZPF8nEve2EUj3a1QHyWBpuqfm/QL/wuU5rWkLoK3M3jvf3ywPsf0ji/3snE/3Ps2ouKPSvSWq54psbMCyk31rAn0Gq059Wu7VVOfqNP4anXea58vS1vaswboFpDietIh/gSUBJqScYMhJ088daL5BIHVJP3PLHuDLhCYzrzUrOYkXN14YuL5cpqnGVMFNuoctsIgVuVnfh4FsrWlh0OxkiggTbqcYQLeQ21UsOVrFHUQ8IYnyAC0TDM+chA3n3IiJhxvrFC8wAZAjPPDJ/ShyzpLA7P71Rc0L1OmAuY8ALbpGsc76Bg1cQjouQ/7i2TJ9cOSfi7K0jx6QqxAQBla4yk/jgWAE6KooYxY1uqYErMsP0hghTym47X9mpH1WgO/qMLhT7aGi+w==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(396003)(39860400002)(346002)(136003)(46966005)(9686003)(4326008)(356005)(82310400003)(8676002)(82740400003)(83380400001)(47076004)(5660300002)(81166007)(52536014)(316002)(8936002)(336012)(55016002)(186003)(6506007)(7696005)(478600001)(19627405001)(26005)(2906002)(110136005)(33656002)(70586007)(70206006)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2020 08:21:43.8703
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c55f9d0-bbc9-4165-8d36-08d866ac3264
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3582
Content-Language: en-GB
Content-Type: multipart/alternative;
	boundary="_000_DB6PR0801MB2038E7D9B6B0B43283598EDF8D310DB6PR0801MB2038_"

--_000_DB6PR0801MB2038E7D9B6B0B43283598EDF8D310DB6PR0801MB2038_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-10-01 at 14:50 +0200, Alexander Kanavin wrote:
> I believe something similar was previously rejected on the grounds
> that the need for 512M of RAM is not about opengl in general, it's
> about Xorg failing to start when using glamor unless there's at least
> 512M...
> Therefore it is image specific.

In that case I'll move the line back to core-image-sato, with the small mod=
ification that it'll no longer override machine configurations.

Cheers,
Brett
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Richard Purdie via lists.openembedded.org <rich=
ard.purdie=3Dlinuxfoundation.org@lists.openembedded.org>
Sent: 01 October 2020 15:12
To: Alexander Kanavin <alex.kanavin@gmail.com>; Brett Warren <Brett.Warren@=
arm.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] qemuboot: move QB_MEM to default in qemuboot

On Thu, 2020-10-01 at 14:50 +0200, Alexander Kanavin wrote:
> I believe something similar was previously rejected on the grounds
> that the need for 512M of RAM is not about opengl in general, it's
> about Xorg failing to start when using glamor unless there's at least
> 512M. Otherwise, we should continue to verify images with just 256M.
>
> Therefore it is image specific.

Right, it makes no sense for example to need/want 512MB for core-image-
minimal.

Cheers,

Richard

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

--_000_DB6PR0801MB2038E7D9B6B0B43283598EDF8D310DB6PR0801MB2038_
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
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">On Thu, 2020-10-01 at 14:50=
 +0200, Alexander Kanavin wrote:<br>
&gt; I believe something similar was previously rejected on the grounds<br>
&gt; that the need for 512M of RAM is not about opengl in general, it's<br>
&gt; about Xorg failing to start when using glamor unless there's at least<=
br>
&gt; 512M...</span></font></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">&gt; Therefore it is image =
specific.</span></font><br>
<font size=3D"2"><span style=3D"font-size:11pt"></span></font></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
<font size=3D"2"><span style=3D"font-size:11pt"></span></font></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">In that case I'll move the =
line back to core-image-sato, with the small modification that it'll no lon=
ger override machine configurations.</span></font></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt"><br>
</span></font></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">Cheers,<br>
</span></font></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">Brett</span></font><br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of Richard Purdie via lists.openembedded.org
 &lt;richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org&gt;<br>
<b>Sent:</b> 01 October 2020 15:12<br>
<b>To:</b> Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;; Brett Warren &=
lt;Brett.Warren@arm.com&gt;<br>
<b>Cc:</b> OE-core &lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH] qemuboot: move QB_MEM to default in q=
emuboot</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Thu, 2020-10-01 at 14:50 +0200, Alexander Kanav=
in wrote:<br>
&gt; I believe something similar was previously rejected on the grounds<br>
&gt; that the need for 512M of RAM is not about opengl in general, it's<br>
&gt; about Xorg failing to start when using glamor unless there's at least<=
br>
&gt; 512M. Otherwise, we should continue to verify images with just 256M.<b=
r>
&gt; <br>
&gt; Therefore it is image specific.<br>
<br>
Right, it makes no sense for example to need/want 512MB for core-image-<br>
minimal.<br>
<br>
Cheers,<br>
<br>
Richard<br>
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

--_000_DB6PR0801MB2038E7D9B6B0B43283598EDF8D310DB6PR0801MB2038_--
