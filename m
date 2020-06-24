Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.80])
 by mx.groups.io with SMTP id smtpd.web12.7160.1592974757427809691
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2020 21:59:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=NYTJoAl6;
 spf=pass (domain: windriver.com, ip: 40.107.223.80, mailfrom: david.reyna@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TvTLB0726kiyCjZMzt1Ui9i0zzSh/Coti8ykb7oTNQyyct2JrvilcD1go9LarELUa7wKLrdoSCtO7j3D2zImuJMPL/8aMKvhu3La4SDc316eY4bjP2bt4pjt42+ZY/rLjyxBasiE/SnPbrqDdJulmmYeq+Ka/wchwHC25IGc+cdPOZfEyzKCW0pJ3Zp67lsOYMDyIDs5UUHQAGv9d5hWAru47CtBV5/Spsn8BCXQsplDsVpBX30zZ9rc+zqrnT83p83K1ESjUM8+v6d2hc79afnR6R9GuS6P52m4ZKu91tvEz8vwbkZYR1qTbW8Tk8G1T9FJyTtueUV2SjfUW4/yFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9HBVDzQnR7vx3gxm561sf5FfHDvaBREDvonO71Or0M=;
 b=eaNiNCd/V0pF2Vse+sOk0gSnWpxSMtinMD24UINCBdzLM0f/PE/PXGGulZ0t22JaWgMhjcRrnStrUHUsfnxMcMQvHidEuAnGoYnWohIiCCKcq9hMlF9XMYckxaUznVPMmKH0AyXvKIgk6Inp2S1iabh+saE88607U0EQYWYyDvS6lFwguBvU5ExCERKvEkVolFZ/kbatBoY9i2kbNDDUyDdR8+Z1FGd3lcZBL0KsTM+2ADG7yPjxcZE+vEoshX8hg6SN1uAUb5FUvDIEJKV3FS+OkFuXmQ6N/VZAjDIqzExe3yEVO2shY6/cRrB9UxnKEKSWs9zjQv5okTx6rmBkew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9HBVDzQnR7vx3gxm561sf5FfHDvaBREDvonO71Or0M=;
 b=NYTJoAl6FArtOMbekE7hTS8/yzE8OifOOeGUf2z94B6koc6Lq5LHQ+ClGFlbn6QxS38s9gJOOGsMd3OFyY8eSiEhkjqzj4e28WBqfzBPtPebvWEx3yC6N8PqA+3Mq8jqd/1wXO0CLwLmvLR+g4raptRZa3l+NSBK8hxmJlJy+xM=
Received: from BY5PR11MB4167.namprd11.prod.outlook.com (2603:10b6:a03:185::28)
 by BY5PR11MB4497.namprd11.prod.outlook.com (2603:10b6:a03:1cc::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Wed, 24 Jun
 2020 04:59:15 +0000
Received: from BY5PR11MB4167.namprd11.prod.outlook.com
 ([fe80::c54b:4815:9a86:533a]) by BY5PR11MB4167.namprd11.prod.outlook.com
 ([fe80::c54b:4815:9a86:533a%3]) with mapi id 15.20.3109.027; Wed, 24 Jun 2020
 04:59:15 +0000
From: "Reyna, David" <david.reyna@windriver.com>
To: "chris.laplante@agilent.com" <chris.laplante@agilent.com>,
	"sjolley.yp.pm@gmail.com" <sjolley.yp.pm@gmail.com>, "yocto@yoctoproject.org"
	<yocto@yoctoproject.org>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Yocto Project Status WW25'20
Thread-Topic: [OE-core] Yocto Project Status WW25'20
Thread-Index: AdZJbUdP+FsSdrtKSByBV3SeDZdVTwACStUQABrs1tA=
Date: Wed, 24 Jun 2020 04:59:14 +0000
Message-ID: 
 <BY5PR11MB4167B414192233E0A5F8F241EA950@BY5PR11MB4167.namprd11.prod.outlook.com>
References: <067a01d6496d$5f46d9b0$1dd48d10$@gmail.com>
 <MW2PR12MB247418580E300A77C479C1698B940@MW2PR12MB2474.namprd12.prod.outlook.com>
In-Reply-To: 
 <MW2PR12MB247418580E300A77C479C1698B940@MW2PR12MB2474.namprd12.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: agilent.com; dkim=none (message not signed)
 header.d=none;agilent.com; dmarc=none action=none header.from=windriver.com;
x-originating-ip: [24.5.28.247]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8f15bd3e-d72c-4a85-ee3a-08d817fb57f0
x-ms-traffictypediagnostic: BY5PR11MB4497:
x-microsoft-antispam-prvs: 
 <BY5PR11MB4497322F18DE1ED6D4751A60EA950@BY5PR11MB4497.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0444EB1997
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 fxRsCZNSHUEkfV5x6sq3Ig8I+1atWzjFo+bhXzQJZcSL5TC5fK2ZR5yfjdLMgW1wiIOQORUw8jX/gClCD1+CNSATXiYpRkJ5axRWOZz3KJf4yfXw34o72l96JVQJeRxa/WDRyBYOrKuVs+kh1ERlH8fglVROEeshCB6xay/bFIvkSA6VOjbSj+iAR8V7zWZHZFGe0McqPK9XneHrhahMHJ84PaGl2urZZBx7/RwctupXb/U771weaKyK++FLDzs9fvkqjTP3q3JXClpgqOeu20mEgy+mlYq2MeqWg+/14g7eoYguBp65fcSCQDa3s1kre7uI3PEWDOWQQsz3rH7ctKGyJCSxLZuJpA6wP7wiPafriqWzzqvlGpUfn/HMp8VjgovnmCJGiwOJTC8LixuJPQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4167.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(376002)(136003)(39850400004)(396003)(366004)(33656002)(186003)(76116006)(86362001)(478600001)(966005)(316002)(6506007)(71200400001)(66446008)(52536014)(7696005)(26005)(53546011)(110136005)(8936002)(5660300002)(8676002)(66946007)(9686003)(66556008)(55016002)(64756008)(2906002)(83380400001)(66476007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 DMVLBjTst1c+WfhSlrgC/jS7yzSUgbj9YX8pvZUFfI82Pxv4qxIAt5FBp6H0oYDiPFV1ol8ZBz3u2kwLipBLUIXZ140J4TpQ0wqJ6tFi9tGASRuS0118y7jg/UBuuoBYK4pRHwoa+kQw5w5kwmlYEri6N4DftUDXsLw/TnonTTNWPyfkdlfmZGm3r+dtj7XJn74zPbikkDHGDOkaG+xtPgtF31/AgsCenEGgKxUt+Ri6LkjYRjoc0nKeLUWyYXF2+C4GyFxjtf+R93/PKMLBuC9IsG8W6TPXTZ5ebWErl0wKJiTtkEulcNTDo8hVHE3brS5zlkZ+2BAia+8Uisxblqg6gnboE8RjsY0teu2Ye6hjNY6sXLaLTagXVf/f2WbfBEj0T269xyCivAHZHCKWihlZlWCf/caVMmdbjehGYK3wl4VMV7m1hrAv5O1zbBroZprww45PLIpO/C2/ZzVfiETcyHAvvlkedTKeMvN06qM=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f15bd3e-d72c-4a85-ee3a-08d817fb57f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2020 04:59:15.0334
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JGo8wJ6J3iJawamw6m/4Wrd+UbfUfShBx4UUzkQUQ6cdDsRmLFjLS328nHB9Xudszp7Cca2JZwkDd0LHS/kHGpMXc4ebBVXglnu1Eb/lU90=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4497
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Chris,

> "Does anyone know what the intended audience is for the Developer Day pre=
sentations?"

The official description for the intended audience can be found here: https=
://www.yoctoproject.org/yocto-project-dev-day-virtual-north-america-2020/

We will be covering a lot of topics that can give you ideas on how to use O=
E/YP in perhaps new ways, for example in containers, virtualization, micro =
services, and CI/CD frameworks.=20

There will be practical instruction in such topics as image size reduction.=
=20

There will also be hands-on exercises in the kernel development tools and u=
ser space management.

There will be many ways to expand your horizons with Yocto Project at DevDa=
y, to meet and hear the community experts behind all the magic, and even br=
ing them your questions directly.

All of this plus being with people passionate about OE/YP and having fun at=
 the same time! A bargain at any price!

- David


-----Original Message-----
From: openembedded-core@lists.openembedded.org [mailto:openembedded-core@li=
sts.openembedded.org] On Behalf Of Chris Laplante via lists.openembedded.or=
g
Sent: Tuesday, June 23, 2020 8:58 AM
To: sjolley.yp.pm@gmail.com; yocto@yoctoproject.org; openembedded-core@list=
s.openembedded.org
Subject: Re: [OE-core] Yocto Project Status WW25'20

> * Next week is ELC which is taking place virtually this year and Yocto Pr=
oject
> has a presence there. There is also a virtual Yocto Project Developer Day=
:
> https://events.linuxfoundation.org/yocto-dev-day-north-america/

Does anyone know what the intended audience is for the Developer Day presen=
tations? E.g. would someone who uses bitbake day-to-day but perhaps doesn't=
 edit recipes benefit?
=20
Thanks,
Chris
