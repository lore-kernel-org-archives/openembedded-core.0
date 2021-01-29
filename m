Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.81])
 by mx.groups.io with SMTP id smtpd.web08.11911.1611936356694741824
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jan 2021 08:05:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nxp.com header.s=selector2 header.b=egM5YQyj;
 spf=pass (domain: nxp.com, ip: 40.107.21.81, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dVFfIFHvjZ6XpzhBTdZMP7oaKBQz+hwbkGEbEkYm/HKnkeoG93P8i8NPdjlOu0SXrU3egO8Yn9UjW8rMva1fg3aYBKukAj0zsMHThtaSRvHNMPS90xdfjtd1wPbOk4Q9jP7nSunWcwm9KI+JcyF4dEQIjON79+9epndy4OXgObx86MAjC1wGcHE129NGKlajf7W1QElRwIa6nOmNl/47hYb4ZqXyu6mAhEzjBHTOOo9P7KFYeNj4pqJbIgj/BG0M+SlZXXFb/MnH+XJ1kHs0/LggXOnB760TkoCVX+r7xP1Oclpdb+e+ICIHy92YGsYW7xD8Qp3QwtVMSwiX5/C+cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uKAh2yEoySAImajxgBzSDbW5rPZHRvlkhXVpKV64Agg=;
 b=SY+qGIH4z1V78x3lLqmAbdQ9PGoP1FMkOYlVfhy2rZgZ/NYjOTr1qJGzKKsmnGg2GQu22rYNnLDDWZYuhR9YUkrR5gbuFSDQAy1zgsdbI8ukHw6WojyxZ3DeyZtlWKVHdvidR//R2/QPHZhTUxDixOv80J+BgkPdSOLD12ErV/sY4HoAdNZQPtMgQy1iVTGq9PoorV+2YwhVNqF85nI1Tih9YOZ9CrHsU+DlWA8KCdOqO/fXJX7D3BxK7K02kwYGax0pOhnsmOm5i2yyJLbv/UG/NCJXbddmISlz6X3C5+PFRhms8MeBgp5I421MCzoW8NYq4DUvDPwU/o7WJDJIhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uKAh2yEoySAImajxgBzSDbW5rPZHRvlkhXVpKV64Agg=;
 b=egM5YQyj/Gd/BevJ6/o3W5TyzD02bKvNZt6yurszl5+hT2yjnGbNPBLYAeAY501wsapyZSjuY1+amclyhQL5e1dSkAIvbw8ZEkw9M+YUZHdvQq4RqzF/7fBISxX99bEqi7wp7YHtEE0L/M8HF1eoKyS//eo3oE88BC5M1HwhL8k=
Received: from DBBPR04MB7753.eurprd04.prod.outlook.com (2603:10a6:10:1e1::5)
 by DB8PR04MB6890.eurprd04.prod.outlook.com (2603:10a6:10:117::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Fri, 29 Jan
 2021 16:05:54 +0000
Received: from DBBPR04MB7753.eurprd04.prod.outlook.com
 ([fe80::6d05:3fa3:ad9:abdb]) by DBBPR04MB7753.eurprd04.prod.outlook.com
 ([fe80::6d05:3fa3:ad9:abdb%7]) with mapi id 15.20.3763.014; Fri, 29 Jan 2021
 16:05:54 +0000
From: "Tom Hochstein" <tom.hochstein@nxp.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [meta-oe][PATCH] glm: Fix packaging for header-only recipe
Thread-Topic: [OE-core] [meta-oe][PATCH] glm: Fix packaging for header-only
 recipe
Thread-Index: AQHW9eA0JtnFwi/KfUCabGkPDLFRqao+CrIAgACec8A=
Date: Fri, 29 Jan 2021 16:05:54 +0000
Message-ID: 
 <DBBPR04MB77537EC087756F1D28A99D13E2B99@DBBPR04MB7753.eurprd04.prod.outlook.com>
References: <20210129014259.7985-1-tom.hochstein@nxp.com>
 <CAMKF1srvbmYWe1EwDK-mLhgN0vDhKe7AfL1zznAy8CSTxv3G6Q@mail.gmail.com>
In-Reply-To: 
 <CAMKF1srvbmYWe1EwDK-mLhgN0vDhKe7AfL1zznAy8CSTxv3G6Q@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [24.28.93.33]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d1ca552e-23a7-4185-322c-08d8c46fc1c9
x-ms-traffictypediagnostic: DB8PR04MB6890:
x-microsoft-antispam-prvs: 
 <DB8PR04MB6890C41A3905D18C02AA64CFE2B99@DB8PR04MB6890.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 dbYp1rZbmkWpLy/ho/mcg+F6G+gQU5JIOWN6PXo4jNCAfxyWiavM7cOpVLwnzE9FMEpYVyZpHGZnItcV4Ut5yJbnU3+tnSRbS352ojiMHuPmIM4XxbSGhz3AoDjEaA556VqiqPZqPpQpIJsl4j1JjH1doJE1R6ghvKEE/+D+TtFvbmU+z2lER3L0aeZKPNF0nOsFs4rOgpnlytTAcmm1/b6s6V+sf02LkaupmL172mO7sCoLtdEAS5Hv2RjVIAIdirwPbK+CqstKV44sgZrlqHRq/wL/TnngWXPSNvsWMsUwXGBjvpR0jToc3CJeEJeEWgtOgYo3vyhLfR4Ow5wVdJSNZZYPcwdZrt1gATNOFb57pv+RO2cKuAwATTknEf2iyGpN+Wx71oO/HFyVEbGlM7P6aCCnNy4NEr3GYQdtlAN9XNkKU7Cv1ZK3pxXrk65N8JO6Llm4SBWfZyCCS5QN/N9Wd/JjX3BI6LKGdZ2HkmrLhO4oGJT1PJBaZ1o76m+Nz3psg0W6kkjWpa152q2TJQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7753.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(376002)(366004)(39860400002)(8936002)(8676002)(86362001)(26005)(186003)(4326008)(9686003)(7696005)(6506007)(66946007)(76116006)(66556008)(66446008)(66476007)(316002)(64756008)(52536014)(55016002)(6916009)(4744005)(44832011)(71200400001)(5660300002)(33656002)(478600001)(53546011)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?0v9xUsnwlFk2eY9LJkObTBf2HTAGID0c7rMoq4KNn6oxDKhdayXOVgb8AEaZ?=
 =?us-ascii?Q?oiEBjc3YrDuKmnEVPz4lYOcJzFQnyCrOR4D7fKPFp4erGNqFoFDDK3zAx63/?=
 =?us-ascii?Q?BxepT/9WgQmKdxnOHtW6HG2QziCBguYaW0Rh+AcWsipIjjdTdbxJlgkkbKPf?=
 =?us-ascii?Q?5X0Mfa3sEmrmHugcB6i7h0ppZfkKr00ZVz7lG5d+4BBuJ2Fu+fvq9mcxKyN4?=
 =?us-ascii?Q?2sQakTahE+HqbT8+E9ul8CJ7LbdqNdkcQz9u6KmNSNxiTKxQhK4waOQz9x2z?=
 =?us-ascii?Q?m2g1WtoUZOzewJF4qQQzSDV4z91oTJICNGINAJDqJgi38W3ienPO1V23k6Qm?=
 =?us-ascii?Q?9C2naDyx9sgo06L9vnFwZx7pAU0yWzIVNK2m2L9elHLFMf26bnFKIAJKHPAU?=
 =?us-ascii?Q?vXVk2ESozCeB3zRGXFEEkHuReHSdrcQua+UgUpa6CTP2TLbiuQZ3KwCFNcjs?=
 =?us-ascii?Q?sYSkgIjpHu5NKAnay0SOHEDeklXa8n5yXQrtjObZ3EsLPE50tUaizwhEqcCX?=
 =?us-ascii?Q?YjbDpXEQcX87puD966f57Kiq3uHxnolm194DB22E1R91x+nkMCBuVTR4HnMb?=
 =?us-ascii?Q?uXtYK7JsNWM1Th/lWOtTWEmTtLK35wXW5Qtk3k0bRq4BBhYlVRYqVF84vBaY?=
 =?us-ascii?Q?6B8S2KCJWR43+H4b4xo66Bz5+w2n/THUsym/b8IwGflOkG9gXdMJbQxCmIBp?=
 =?us-ascii?Q?BmrhsqpEh/G4EWdE6hzh1ni4UcdA/SJj914+oj9qr9/VmNfk1QLUG8LJaYYn?=
 =?us-ascii?Q?bIUxGtJWcmS4WCVLPHySz11APUn2lyLqIVTwNrvmtmz1cC5PsMXhPlNug/uU?=
 =?us-ascii?Q?SUHfs4DOo6q8If4Dh2cM4SC3LLYvXvVmUAaplIP3Y2WfzELNBFsTY/lgN7vv?=
 =?us-ascii?Q?sWBrT2z8r+wU4dx1OgRk9crdb1co71EY4p8qwDph3hB28NJjCWgNehvLeRNk?=
 =?us-ascii?Q?vTppsL5HJDcHurhcQnwqjFiRGelPoVQdGI5AHD5TWYvn+68TMoO+z13buhgz?=
 =?us-ascii?Q?H6DMZJV/FhVANTBPYLHwknTaaCyQ3je2n+Pm/8KIpREUy4Q=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7753.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1ca552e-23a7-4185-322c-08d8c46fc1c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2021 16:05:54.3342
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vaSH/q9adwDWWr7DIG9omdslbDEbK7nJDs40jKf4Y7MUatpswSl9icMouGjfN30p5HcDUYbRgri8Ty3L7DPduQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6890
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


On Thu, Jan 28, 2021 at 10:57 PM Khem Raj <mailto:raj.khem@gmail.com> wrote=
:
>=20
> On Thu, Jan 28, 2021 at 5:44 PM Tom Hochstein <mailto:tom.hochstein@nxp.c=
om> wrote:
> > Set ALLOW_EMPTY for the main package to "1" for this header-only recipe=
. This
> > allows the SDK to be created properly when there is an RDEPENDS on glm.
>=20
> Runtime dependency on a header only package seems a bit iffy it's perhaps=
 better to depend on glm-dev perhaps ?

Well, it's all iffy in my mind since these are just different workarounds f=
or the root problem that header-only packages are not included in the SDK. =
If you think including the headers in the image is the better workaround, t=
hen I will switch to that.

Tom
