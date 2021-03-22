Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.79])
 by mx.groups.io with SMTP id smtpd.web08.1363.1616429339668680298
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Mar 2021 09:09:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topicbv.onmicrosoft.com header.s=selector2-topicbv-onmicrosoft-com header.b=UqwF88n7;
 spf=pass (domain: topicproducts.com, ip: 40.107.21.79, mailfrom: mike.looijmans@topicproducts.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=topicbv.onmicrosoft.com; s=selector2-topicbv-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yV91WkwZm2VCZwlraAVZpmbqPG/XjstpCizovvsN1GY=;
 b=UqwF88n7qJhAwIdE3BT3ka5yzkyiTq6ab//VTlYLAdeTk2LMiV0b11LJJOTsVGgJsa0J2GceWOUDUra14BKC/NQhZ0BNB8wHBaLqX04U6nQAbFkUbfVR3PX/VOXVostXoX21L+ker2AZIZEMGUZN1U8HdnklFmlJDwZktEOp04s=
Received: from AM6PR08CA0048.eurprd08.prod.outlook.com (2603:10a6:20b:c0::36)
 by AM0PR04MB6948.eurprd04.prod.outlook.com (2603:10a6:208:187::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.24; Mon, 22 Mar
 2021 16:08:53 +0000
Received: from VE1EUR01FT027.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:20b:c0:cafe::d8) by AM6PR08CA0048.outlook.office365.com
 (2603:10a6:20b:c0::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Mon, 22 Mar 2021 16:08:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.68.112.65)
 smtp.mailfrom=topicproducts.com; lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topicproducts.com
 designates 40.68.112.65 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.68.112.65; helo=westeu12-emailsignatures-cloud.codetwo.com;
Received: from westeu12-emailsignatures-cloud.codetwo.com (40.68.112.65) by
 VE1EUR01FT027.mail.protection.outlook.com (10.152.2.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Mon, 22 Mar 2021 16:08:53 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (104.47.17.168) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Mon, 22 Mar 2021 16:08:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fAAFC4+6WlwE4qlnZJuR0zmHDIUtswzeODuQHJiKkWc3jjUr9GQsiL8SYnuMUvdaihzNTYZ2ZogZRZzI6VMi57oBTY/AWe1mzex5/6Bb8dlf5vgwrZ9H6eEpL6y08TKOXxxXK57dQnSRfSgM3vfz6J+COlAJnriDCtv5aNNwuGTC6WBNphoZ86Fs7cjKGPJOU608pgHgu6j9M064d/TbRVQE0BXzrYmTOhoVdMWVuHDjozQocuicaP7lCyEFxBpU/RDOY0gSAAP91VMt4t8uIi68oDs83EvalLv/JeoLjN+3fbuhwVF/l2oGSVtxPE5XMLoEjuZJQThcmjXZesStIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=45ZSBgGhMOVEVf9CCljiiQk5eb4pjdTV0BgeHb2OgxM=;
 b=KIT1TQj8qzSeMbW6rs76Np73FdT2DmoIcFELtpk1+4sjgbohZWI7bRlkDqKuAdsRblN8dS4q2VvPi1uFhWXMe2BGDQqI+LPuEYMu2mmsaOpjuQHHGENGh5iAI7+mlNVm2EFIUEBxNsAiIQUSAK5i/58H+SV7LcAQtj92Tt8k3kKL/+3lQrIokuiM90DGcVn6BUmuLqIK8YGJwaqNyyYsMF6gKt77GQ7vzc0fMDX7YZQHvcZOhsDEPCkycVJKmSszsBoHinBv4EKWogtAL7WxhdaeexQae7QIqUTYePMsCIowU8aIkDxKcyHvAPdlAlY0Nk8tGZx6sKhlVFBBFKn0sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topicproducts.com; dmarc=pass action=none header.from=topic.nl;
 dkim=pass header.d=topic.nl; arc=none
Authentication-Results-Original: lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=topic.nl;
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com (2603:10a6:10:10f::26)
 by DBBPR04MB7963.eurprd04.prod.outlook.com (2603:10a6:10:1e1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 16:08:50 +0000
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::38d2:189b:f7da:b988]) by DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::38d2:189b:f7da:b988%7]) with mapi id 15.20.3955.025; Mon, 22 Mar 2021
 16:08:50 +0000
Subject: Re: [OE-core] [poky][PATCH] package_manager: install versioned postinst scripts
To: gmouse@google.com, openembedded-core@lists.openembedded.org
References: <20210322154557.1591593-1-gmouse@google.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.f4dbd25e-5dbe-43cd-9759-142455aef0eb@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.31ab2b89-4cad-4ccb-bc6c-988623ea5223@emailsignatures365.codetwo.com>
From: "Mike Looijmans" <mike.looijmans@topic.nl>
Organization: Topic
Message-ID: <91eb3709-1738-906c-e704-c78fc75314c8@topic.nl>
Date: Mon, 22 Mar 2021 17:08:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210322154557.1591593-1-gmouse@google.com>
X-Originating-IP: [83.128.90.119]
X-ClientProxiedBy: AM3PR05CA0110.eurprd05.prod.outlook.com
 (2603:10a6:207:2::12) To DB8PR04MB6523.eurprd04.prod.outlook.com
 (2603:10a6:10:10f::26)
Return-Path: mike.looijmans@topicproducts.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.130] (83.128.90.119) by AM3PR05CA0110.eurprd05.prod.outlook.com (2603:10a6:207:2::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Mon, 22 Mar 2021 16:08:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db7e78bb-9eb6-475f-818b-08d8ed4cc9d9
X-MS-TrafficTypeDiagnostic: DBBPR04MB7963:|AM0PR04MB6948:
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB694857D7D46FA6C3BF5484D896659@AM0PR04MB6948.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 6/G4V1t3G5YMSgp5toiTdOea3D+jFnoVqH6dP6mCykY6ncI+aNSlZyXa5nMKOEOSlgQJxf2C1oqROQ5gPzWWudkvhZ7YkLXbB3tgDTFIOTpIKFVMooKVkcifL89EoLD6GA1UifWxGpJvJi41FsPVSJFAUm+1LCZBDspr3JQW54L6AOQhC05AUGcnLcCenLapaV+z6zR+IM6IsWxJj+KiNx9LszTtzaGIAV8F/3FQPHFd/8N3jtqy01X+v0aLREYE32yRUoiAxJc8vidP6sB4WEenr1i3ta1NlmcgpllNp4bBwFr+xych82pDSMTAab0BuSc+dI2Di73eYRNFP+oihNDvzRFA9f4nY/XLVIAWHNn/WJc4Wns5bCq+cXR/GikrbjiNdG8qsvPlhaztMqezRgvJ0VfnsftH90eHxfFJC0gABRsvASvOTxeqLnljSalibtWeev2V/Fkuh1zf7OqkNvuP0f93XLdYvFZSfV8C/1LI6qCOgU5x/b4teL8ouiDlmete3Br13xPS31WnGeyKbBh8eT45D0BkFRBSTb+ojx7ZssdVj7GPZa/arW/LNoT+zvOGBY0vaY0XDbAdgR4O+kVa1lWPQOwyCMLN2lcyV8gsaOtQnO3vXMWdUM8cVJtXSlLGjQTG81CFKxpJfwwm1vg6pHKkmEOc1cyZWZyHxEqsM1jsUWBevikqrpSUCbVKjLoZmEemFARIaq5nM903eksefSXg7Nr/9loFXxEmQMsrVUxjwGFyIuXfwRSkA2BwpkeNwO6+JqbnFpKMqnan63X7YzGOhBJlEHWh/1Fmn7M=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6523.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(39830400003)(376002)(396003)(346002)(66946007)(26005)(52116002)(83380400001)(16526019)(186003)(8936002)(36916002)(66476007)(36756003)(31696002)(8676002)(66556008)(2906002)(83170400001)(966005)(53546011)(44832011)(6486002)(478600001)(31686004)(16576012)(2616005)(42882007)(956004)(38100700001)(5660300002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bCtmQ3Z0dlhqQzR3K3NFbThqcUNRS09mUzVFUTV2aktsdElIZWYyb2dNb1N3?=
 =?utf-8?B?R2E2Z0RTLzc0WW8zRitFY2NOZkQ2QnA4YU8wYlhyZXJNUkIwek12UENXR00y?=
 =?utf-8?B?bjZxM1ZiVWlXeTFzMHlQNWVYTEY4SnNzcFluSGdGeVhKUzE5Z29HWG1MODdZ?=
 =?utf-8?B?a2JSdXMrcmNSQTRoNjFWc0JiTmt3L2hoNXJUVXBFMDgzdG5tMm9XYWVoT1VG?=
 =?utf-8?B?L0R1RkFaTmUwVzJod3Jsa0x4czk0YjBPVDJiTGg2dEQ2NFJhQVJKZTFWd1JY?=
 =?utf-8?B?MGNqekFUNEdHSlZnTE9iZGNCQkVqTkhCMkNibHJxSFhKVmhFdVV6MHpyZnhO?=
 =?utf-8?B?elJnOUg0bThEL3Y5Vjh3bDA0a1B2SGZURGc3SzYzczNiS0E2K044dmV6VE1C?=
 =?utf-8?B?TE5kalFkaFFFc0RMNko2YmVLUU5LdHQ3RXd0dnIrYnBWOTd3SWRENndkZ2hn?=
 =?utf-8?B?bzVtOCtJVnZpKzdyenVhR3VhUmhSaGFjWHQzRVhyMWs4ZzlOUGpidFZJUHQ2?=
 =?utf-8?B?ZFRRaVdEVDFlY00yOUIrOVRpNXkrYnUxNUJGWFpxVGo2c2dKd05UaEIyeHhn?=
 =?utf-8?B?aG9qSnFZNXRmQk9Oc1BmTHpGalkrelo5RUhpUjFrUFFuUTVBZDhGYVJQcFVv?=
 =?utf-8?B?K0x4NUd3OENXazZpT0lzbTZITXhHTkQ0S1ZYaXBJTmlpNmNWanVMR3hmZWVm?=
 =?utf-8?B?bjQ5TEc4ak16MjA1VXBLTmJBSmZKbjdZakVvQ3JlMkdtQVpvd3JJV0k3RmNJ?=
 =?utf-8?B?WGJFWTJSRmtQcmw0Q0FTYXVZMDJRVlJhcW1Vbk5YaFhxU05oeTJ6dTdZMFhR?=
 =?utf-8?B?U3ozbUlCWU5RWUlCNVBhVE1mVE5aS3YvTkJzVzlGRjBQNVNLbVI1Q3dwREx2?=
 =?utf-8?B?SS84VkxxdkRoYVJDQ2dhOURKSmd4SytQb1pQOXlLN0p5RFV4NUVINEVoRVkw?=
 =?utf-8?B?bnE5MFhIMUZ4d1J0d3NYOFlKclEwQ0EwdjJXQ3pRL0RBU2lUZDBFMStKbGl5?=
 =?utf-8?B?L0p3SWxvSXlUTE5pVHBqYnZYUFlzYkt2RmNFT2Z5cW5HWVFUallBUndDdlRa?=
 =?utf-8?B?NDJLZkNHTmRiYWw3eWpzNUFxQzFrbXhRYjBpMm5PdU44V3p2WTllNElVNkxt?=
 =?utf-8?B?VlZ0dmVmNmZwMGpBWndZYVlnVVBZc2Z3OUMxZi9jUzdIWnlSNlIraHFUMGE2?=
 =?utf-8?B?T2d5b0QwUmlwVFYyK3pDS1ErVkFXSDhzdndrMnV1ZVpXZHdUUjRIeEZBYjFs?=
 =?utf-8?B?QzVUNmZjdkQ2VGRsM2xKYjdTUHpreFY3ODVOdCsvK1NWNkVJRTgrVlh1SXlz?=
 =?utf-8?B?b1NzQ3JWWDRiZHBVY3VZZnlBeXpYSWR0dUJtNUV2K1VBSWdwQ1VzU0VtZ0RP?=
 =?utf-8?B?MGlZcHJvbEpZemZMeWpXa3JFNmZMVU9uTDBHS1d3RVlNNVlDV0NYRjB0MkxS?=
 =?utf-8?B?QmZocVJkUnYrMzVTYld3QmhRQW1ibUhxbFdZa0RDajR4eFp4ak1KZ2FaOENl?=
 =?utf-8?B?OThmbEdlYlZIN1o0aVRnemJYVmxxODloZVlua0JwRnAwNHFvMG5FdVc4V1Rk?=
 =?utf-8?B?RktkVXNtTzRyTE9ia2lhYTc5aTlMdWlhR1pWc0ovU1dhclJuM1o1M0owMUZL?=
 =?utf-8?B?YVVzZEhIT0d0RlJoMUp3d0ppU1d1bTluY0FGMHdFMzJNTU5HczNxR081V2Qv?=
 =?utf-8?B?NnNZRmkvNE9RNUUxSjJPMlVYbUo3UWd6QjFhSldQUDhwTk90d015OTB1UFpC?=
 =?utf-8?Q?Tk8+YNSYLkDdYZlLMl2iY3BkhvuzVl8JK4WZxTQ?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7963
X-CodeTwo-MessageID: 527316f4-e849-4fee-bd8f-6f95ddde0198.20210322160851@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR01FT027.eop-EUR01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	62f3a2dd-ef2b-4aff-2329-08d8ed4cc80f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	x6PozqT6AMge/2IuqC2ttqGAueafQ+++u+SnpKDKGA9HKP4gJlVjk/rSGdSygwk34fRjfRBR8UUDZpKqw2njJoORbtDiReQmKWZl3qKTVjQw9GryCEvC/LxQQ2LB8ncHJw/nkWRVwWft6aZv/LOe0aycDfzhBTJN2DY5XHSa/32hNY8yKhM4X5pDJVGqpZnVSViefTGPgmHDC3XjWy2nJIRwrHFiodAfS4v5b1YX8sbh8H7uPUWQ1NJXv5Py+xu/yFlhE/hPUjgfXu2el00t+x8pFMs02zF5mT5SnhfDF2eAdq1CusTmqpuYp9M+vQvPMtwf31w49z1TdEut7GwceHzcOHc3/B/fyqtdsaC0i7xTZYaMJQ+1VDAuWqG1ZbtFfs/gH3rpQ4y3+i4nyjHne8D7axjKsNvmypyRPpMURR2uUCp7zCiN+RDfwoFdrKdTMFVaVcX1qdrLNJg3z8BwH3eRieSkbbCEKduCTMGJgUlzdEddEL394aiEj/ST6okbG8I9Ka7ZALO6B7cJULLfhwGWfIqp4dli5l8nTV9moGINeaYrnhOoRLyUwHs0K5LwX3MYByyg+4BLPvYZEv11pKjS+WPxxNefzUPeeFXwDOdq7gyy/O8Uy5Q5XNlUnLKrs3voHLnWdR+Orykxc0MJ23JmznK9Hcwbh6Yx50nfz4HhCSnN64H/UMrfjppxSVbt4CmOs1rZAf9ULrdXG8vDtf9ayjzGh+CDshRos3wn1pwK0RAsx3+W3xve2Qs4jZD8GKnOGPNVZkl+tRluCuvlKA==
X-Forefront-Antispam-Report: 
	CIP:40.68.112.65;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(136003)(346002)(39830400003)(376002)(396003)(36840700001)(46966006)(8676002)(16526019)(186003)(15974865002)(42882007)(316002)(82310400003)(47076005)(83380400001)(336012)(31696002)(5660300002)(2616005)(36916002)(26005)(36756003)(6486002)(8936002)(7596003)(44832011)(16576012)(956004)(7636003)(70206006)(70586007)(478600001)(36860700001)(2906002)(31686004)(83170400001)(53546011)(966005)(356005)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 16:08:53.1648
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db7e78bb-9eb6-475f-818b-08d8ed4cc9d9
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[40.68.112.65];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR01FT027.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6948
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Two remarks below...


Met vriendelijke groet / kind regards,

Mike Looijmans
System Expert


TOPIC Embedded Products B.V.
Materiaalweg 4, 5681 RJ Best
The Netherlands

T: +31 (0) 499 33 69 69
E: mike.looijmans@topicproducts.com
W: www.topic.nl

Please consider the environment before printing this e-mail
On 22-03-2021 16:45, Anton Kachalov via lists.openembedded.org wrote:
> From: "Anton D. Kachalov" <gmouse@google.com>
>
> When running on read-only rootfs backed with overlayfs, the processed sc=
ripts
> are being marked as deleted on upperdir of overlayfs. When it comes to
> upgrade the main read-only image, it might contain new postinst scripts =
that
> are different from the already processed. Introduced suffix (sha256 of
> the content) allows to distinct updated scripts of the same package.

So your usecase is that you have a read-only rootfs with an overlay on=20
top, and then just replace the rootfs. And then expect things to still=20
work?

That doesn't sound valid to me - normally I'd wipe the overlay clean=20
when updating the underlying read-only part. I'd be very interested in=20
what you're actually trying to accomplish here?

And further, I don't think appending 64 characters to filenames is going=
=20
to make anyone happy.

In your case, I'd opt for a script that just resets the postinst scripts=
=20
(and maybe more?) in the overlay. Or have 3 overlays. Whenever the=20
package manager runs, activate the second layer. The "user" stuff in the=
=20
third layer is normally active. Then when you upgrade the system, wipe=20
the second layer, to get rid of obsolete packages. Or something like=20
that. Again, tell us what you're really building...


>
> Signed-off-by: Anton D. Kachalov <gmouse@google.com>
> ---
>   meta/lib/oe/package_manager/deb/rootfs.py   | 11 ++++++++++-
>   meta/lib/oe/package_manager/ipk/rootfs.py   | 11 ++++++++++-
>   meta/lib/oe/package_manager/rpm/__init__.py |  4 +++-
>   3 files changed, 23 insertions(+), 3 deletions(-)
>
> diff --git a/meta/lib/oe/package_manager/deb/rootfs.py b/meta/lib/oe/pac=
kage_manager/deb/rootfs.py
> index 8fbaca11d6..704d213626 100644
> --- a/meta/lib/oe/package_manager/deb/rootfs.py
> +++ b/meta/lib/oe/package_manager/deb/rootfs.py
> @@ -4,6 +4,7 @@
>  =20
>   import re
>   import shutil
> +from hashlib import sha256
>   from oe.rootfs import Rootfs
>   from oe.manifest import Manifest
>   from oe.utils import execute_pre_post_process
> @@ -115,8 +116,16 @@ class DpkgOpkgRootfs(Rootfs):
>               bb.utils.mkdirhier(dst_postinst_dir)
>  =20
>               if os.path.exists(os.path.join(src_postinst_dir, p + ".pos=
tinst")):
> +                csum =3D sha256()
> +                with open(src_postinst_dir, p + ".postinst", "rb") as f=
:
> +                    while True:
> +                        data =3D f.read(65536)
> +                        if not data:
> +                            break
> +                        csum.update(data)
> +
>                   shutil.copy(os.path.join(src_postinst_dir, p + ".posti=
nst"),
> -                            os.path.join(dst_postinst_dir, "%03d-%s" % =
(num, p)))
> +                            os.path.join(dst_postinst_dir, "%03d-%s.%s"=
 % (num, p, csum.hexdigest())))
>  =20
>               num +=3D 1
>  =20
> diff --git a/meta/lib/oe/package_manager/ipk/rootfs.py b/meta/lib/oe/pac=
kage_manager/ipk/rootfs.py
> index 26dbee6f6a..6ead6ddef3 100644
> --- a/meta/lib/oe/package_manager/ipk/rootfs.py
> +++ b/meta/lib/oe/package_manager/ipk/rootfs.py
> @@ -5,6 +5,7 @@
>   import re
>   import filecmp
>   import shutil
> +from hashlib import sha256
>   from oe.rootfs import Rootfs
>   from oe.manifest import Manifest
>   from oe.utils import execute_pre_post_process
> @@ -116,8 +117,16 @@ class DpkgOpkgRootfs(Rootfs):
>               bb.utils.mkdirhier(dst_postinst_dir)
>  =20
>               if os.path.exists(os.path.join(src_postinst_dir, p + ".pos=
tinst")):
> +                csum =3D sha256()
> +                with open(src_postinst_dir, p + ".postinst", "rb") as f=
:
> +                    while True:
> +                        data =3D f.read(65536)
> +                        if not data:
> +                            break
> +                        csum.update(data)
> +
>                   shutil.copy(os.path.join(src_postinst_dir, p + ".posti=
nst"),
> -                            os.path.join(dst_postinst_dir, "%03d-%s" % =
(num, p)))
> +                            os.path.join(dst_postinst_dir, "%03d-%s.%s"=
 % (num, p, csum.hexdigest())))
>  =20
>               num +=3D 1
>  =20
> diff --git a/meta/lib/oe/package_manager/rpm/__init__.py b/meta/lib/oe/p=
ackage_manager/rpm/__init__.py
> index 6df0092281..4746e96ce8 100644
> --- a/meta/lib/oe/package_manager/rpm/__init__.py
> +++ b/meta/lib/oe/package_manager/rpm/__init__.py
> @@ -4,6 +4,7 @@
>  =20
>   import shutil
>   import subprocess
> +from hashlib import sha256
>   from oe.package_manager import *
>  =20
>   class RpmIndexer(Indexer):
> @@ -359,7 +360,8 @@ class RpmPM(PackageManager):
>           target_path =3D oe.path.join(self.target_rootfs, self.d.expand=
('${sysconfdir}/rpm-postinsts/'))
>           bb.utils.mkdirhier(target_path)
>           num =3D self._script_num_prefix(target_path)
> -        saved_script_name =3D oe.path.join(target_path, "%d-%s" % (num,=
 pkg))
> +        csum =3D sha256(output.encode("utf-8")).hexdigest()
> +        saved_script_name =3D oe.path.join(target_path, "%d-%s.%s" % (n=
um, pkg, csum))
>           open(saved_script_name, 'w').write(output)
>           os.chmod(saved_script_name, 0o755)
>  =20
>
>=20
>

--=20
Mike Looijmans

