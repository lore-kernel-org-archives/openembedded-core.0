Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5500EDF173
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 14:57:23 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.73609.1770994632728872633
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Feb 2026 06:57:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=W4+HYs0Z;
 spf=pass (domain: cherry.de, ip: 40.107.130.49, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VQrObhTz8e9cA9EbC4HWWgjnCRcHleAJd+Te5UpIZrb0qANFqdJ9RH5q04GxLG5D+qmhilU8iWy2Eyp31SAkQQZyE0w3sJIZg7dThsTJBaVcHyrU7//ZTju8JbGsbYjedfyP0cic+/6gz1+ZDif4uz/0XhCKWjxZ3w17lkLYYvMjXD7MuSF3U8pYXcKWaiitvwtbbAaIpV0/hf0nsscxl+HV/Qpnh5s9uhOEyqY8aZRS1pniZRm0BccITNAZ4tkHxHFUWpbKwRzG54C1CBEsK6/4gKH3H4A6kMw1Cwp5P7mO21BRc2Lsn7YUHegRFfezxT0yDyFYxyaO8V3XQrdQsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pp9Pa8IZ8u5iWelHI1m+9ohgB8C902NHUx/61wgfddE=;
 b=vdIfOqX0I9XWwRODsbjVSZuguhtnKpzzFdr99gtEjG1sBbaU7W8KQ5EYXxV9T02WKtM3wpZw74c6gHI4Pc3kPpw6eilXR7Pu2PxzpPZBUpl7p6FGfzU6ZiRzRpLgSA6AgGkE1J02UXh2ofRUb+QheBAwdFTHXEXrBHfwHWh0E/CYNDG+qwHE9tEBoAXA1/SNpIToZmTQ92MARv0gip8HcwIjCS6ptcJpdXLOcfcM8b2TOrUG2XiTlUxz7bYj2oqWP/jwiEcpOjCf4CU7TKIr8+9H3pUMlaiNAV4c/BrpQlRUAZAuk0rwOi8708kudMZeBD1/bJkXtDET+DDBpCMHYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pp9Pa8IZ8u5iWelHI1m+9ohgB8C902NHUx/61wgfddE=;
 b=W4+HYs0ZeuAMHB23zf1ELSkbx4c+0Kx23F+Aff9X66dbZQtG61y8ywdTXZ4Lr9qyFLjQ3WlBg/+0Qv6hFukzP7hf6BBMZpKhCBHLKNJj7+r6ySq8xj+BSiUKQRdKCntsy087Ljp8fuUFAB4CSc0RJ8iIm4TamBIJTwndko47LD0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AM7PR04MB7112.eurprd04.prod.outlook.com (2603:10a6:20b:113::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.12; Fri, 13 Feb
 2026 14:57:08 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9611.012; Fri, 13 Feb 2026
 14:57:07 +0000
Message-ID: <a2d20a69-b343-4170-acdb-32ee8f84a615@cherry.de>
Date: Fri, 13 Feb 2026 15:56:36 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 0/2] mesa: bump to 26.0.0
To: Martin Jansa <martin.jansa@gmail.com>, foss@0leil.net
CC: openembedded-core@lists.openembedded.org
References: <20260213-mesa-26-v1-0-9e925e474091@cherry.de>
 <CA+chaQdEyxgZE8Vqj2RbxzWq1Us949dNziW867TfrcnUKfSu2w@mail.gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <CA+chaQdEyxgZE8Vqj2RbxzWq1Us949dNziW867TfrcnUKfSu2w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR4P281CA0042.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::12) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AM7PR04MB7112:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f19354a-e513-4fef-bb5a-08de6b102850
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|10070799003|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?wacZZ4+NfYKKqeAOPNfyo5CzK6srt5NCLC5TmSVlun/EcphtEkaFmeZ767Dg?=
 =?us-ascii?Q?/LYxOsVP8SYp8Wsr13t2rH2pI5GpTUrWhzvJsM4NdfeffctMArwYzRmTbeOB?=
 =?us-ascii?Q?A0/9oDpBd3Q/EPGVnpsOKClGWP0032dEG9L2WLF8DrQ3YaQ2VSU/mWUbFMDe?=
 =?us-ascii?Q?5e8itt8/sekGCmUyK4MxkYvjXk+pGmfBIAweWM8XzkeMVMQWjQLUo6Tf3aDl?=
 =?us-ascii?Q?XBJzP8fVfhOE8cujzlv6L2ww1Z1FG/in+6YQs4ZU2+Api5fdG4jm1yDfToR/?=
 =?us-ascii?Q?vbSBro9VhHNkKjEROcCTObYG4sW0tD2+qr9RyDSfwkjTgCm1bNOqaqSoQH7K?=
 =?us-ascii?Q?Dj5hvtgFRhJv1AnvVNdKLvB9pWNSmWiMlOXuE2MgP+iONywluvkaXpaiCKCv?=
 =?us-ascii?Q?Mc0lMNSuDHsK/nxl0CvmDc8RczqBmgDXPS6dea4O5GrW6l4Lw7vV1A4pkkby?=
 =?us-ascii?Q?sAVc6DJQ5jqbMoA/OGB8Byp3/IxAvDEsFH5OGGh5S2BVIxvk4XWcZ19Gkc9H?=
 =?us-ascii?Q?GlkXTY2LxCJw5zqIOVOS+HqLFC51RNHiqq/gm8GRsnb2goxeSacyPYAsypTT?=
 =?us-ascii?Q?ST0YLJMSho4raM96BV2Qk9OujyPVgGh99XiUnhYNyVnMpS7abOKQ8VZTlGlX?=
 =?us-ascii?Q?UTZnLIlon6hvLhz5N66HpWTq+l9uBZ7hFHTuUMlLlVl/AMigX0nsW42jdHK8?=
 =?us-ascii?Q?OhOhlhQ+Y1gZbo5aLEUWFDkTeJko8jDQesR+acvCdltwHfnSLzAQYFdXsb5y?=
 =?us-ascii?Q?3dxdlv5ygOWzFeETrN1aChsjlHbv+8Gfdzd7xdmmC3BYnxJdEe05bv7di8gH?=
 =?us-ascii?Q?zTiVrz7BMtgOCqJi1Jihh3+tiYJnUVULgC0IxPez+F81pNV/91eVhxpleIKH?=
 =?us-ascii?Q?fdZzZh7WuDZ0/zkzGILBpiVcywQjjHu3BsKPGlXEDiS6nltwzP/mgIXjopa7?=
 =?us-ascii?Q?Ccv1UQDVXQ74obgzRmQbCARZZ0zF6H0KyH7VA2LLqXF0xDjRg8BMpml52goZ?=
 =?us-ascii?Q?Cwcd0AGgVwIEIkTTEyLcI9y0/mjz4A3vUPyJpLUEtgU+1QR439hFxOLMKiNl?=
 =?us-ascii?Q?Rzf3Sf0s//JHn9YoB9L307/aargJ9UEOW0tF098yqrVfJdINuLShqP6UOe3t?=
 =?us-ascii?Q?Rx1vEgd3sd+hsWeql+qN+w26l3V91D2BRbQxmqFCrFUWVQ3cVOvg3mxNfhpU?=
 =?us-ascii?Q?z8umQfAk4Ksno5yGw+8bIqJCYFQsuf0j+d9wmpYlTO4LQY3+nzo+G65113FB?=
 =?us-ascii?Q?OYBZPkDMIrk3u9tdlCYGA1QEkLBLahDiOVC4+CxcjNVKhMrIBkaWa4acT2fp?=
 =?us-ascii?Q?z9DNuPKEuMqHOeqdHWJyUbfqGiYBJ1XIowSSCvmcGdQdZq/zYaqFl8OgYvOP?=
 =?us-ascii?Q?Fo3xbnXyYETsXv6iWtO7M7SJqnZW3fUWYShtihin8TEESRvGiwk/I6iTDaM2?=
 =?us-ascii?Q?nT6FAn6K3TWVnF0Msp/vxOGsQiw5S21mYeZYq99kWLFShH5WJqYS6WNKbgNR?=
 =?us-ascii?Q?fEJ/HKVZatPs2VSQVkAGLDI8dPU64o9WEEmT?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2DyAinzd8fBfWpc4gqaFyony0x9RNvQpsDUt/j77M1Z702pPlTm7XhMfJhxO?=
 =?us-ascii?Q?l+vfMBQRHNsZo7cv+WQaxqQE5AkbbNt9j+zzG2Wn+t4yu1q+9P1LZYBBGq9p?=
 =?us-ascii?Q?AY8+E+2+Colifw/VruU7xBVZR/P1O6YI+GawmXMOr2UtIuwFxaIgj8j2Qez4?=
 =?us-ascii?Q?2kXdVnYfmyE/GF6tvjfFP3nI28/8eirPlhMF3a49G2P7EN4qP2zNbJGSJvKW?=
 =?us-ascii?Q?EmJns+ggV+zcpzz1JgoaUdujBeoTbI/dXFIq6mq+1wS4/wwXDDZHac9E1bEW?=
 =?us-ascii?Q?ZlUipmMdKNILP3T1amRwvhmPbsycGmpTCxJjn3PPyKB/mgsCW3q5SFepgCxQ?=
 =?us-ascii?Q?k68baoICF8DoVjy+A+RqDzggdsJODU5WMthP7Br8OKkPiFfeDbzG6otTI3x7?=
 =?us-ascii?Q?ZYcYysziJW0BzogFidVvCoXAKA2KSystNeBADCmIhfYxugOcB/GEF+ZyKQk1?=
 =?us-ascii?Q?+dFlTi9oBZYk9NS5eXLVuOmq85pTWLynzicWFSK40hEUMxiZY/9V8Nmyrcc9?=
 =?us-ascii?Q?zn1x1xu/LelxnjT1oPTGhjBiDRohf438e6k1iTUgirXSUJrWva0zhSdrjswy?=
 =?us-ascii?Q?tL/cO3wLHUOR7rrvP8y0uwFW0C2asyvQLlD56EXtR1fjJlj1rLeyShHn/Zei?=
 =?us-ascii?Q?RPePZ1t2wls+SOuN1Ke5PzwMzY/UEUXUxf5MVNGLIo15HdK9HMD0pgMDIOMQ?=
 =?us-ascii?Q?cpPkc/Ee8lMOrZeSZzJCiWY4Hp0NlOB8znxoe405+RS0o7yupP3VN0CW5KC6?=
 =?us-ascii?Q?EGe+hNwa4dbbkuOmTHcxM0SCIlesE9bZ7JMqqgZq8oD2SjC1zyUBtCI+LDbc?=
 =?us-ascii?Q?L0m/fdQserdHO5sPndn6Q0QF4L7ksNLh4uddvrymQ7gVL7uEA6N+yZbRaK/l?=
 =?us-ascii?Q?jzrC7NXbDPjRgqUIchRW9cGz/91AZWe7GkOF9Iar1T/Od0m71oq1N06pPVwP?=
 =?us-ascii?Q?xm25phB1Z9TqjvR3X5paP2F4+eKCQK4/W9fRSjgqCcutcrLgtTR7uMcdCDOG?=
 =?us-ascii?Q?3gMg3Qzv2s2x4aP23BtOk3uQimrY+yB7piEFrbB1hgP6vfdLH+a+GCHKpKp3?=
 =?us-ascii?Q?oZ+B/pziM1hEITQQ/YWfgmsrN7JlVJiIg3H8sQS2b+WnqelX/loRmZsSjmwd?=
 =?us-ascii?Q?VuFf2snO2NhFj5J9qaIGRPyt/tGNAhya4heKFCo8rV8S9E/Nlzfh0FNvZA4m?=
 =?us-ascii?Q?y0IH18//T3ACx7P5kB8QsUEmFDovc2RvyB2EWwZFxu+qMuwut5XcA2uYwhof?=
 =?us-ascii?Q?ha/+5nPGMq3pcel0+oeM85pHbuLCgbBFrIfm9paOJoIMVC7HL1qZsEzaKfOz?=
 =?us-ascii?Q?h/S918vMT+V6iFHoHjsG5+DBdOgRUcFjLdPF+1uGUYuEurETzbUC0RIaXBQA?=
 =?us-ascii?Q?0HhuFq8fegH+/h9WyWvopnWeS8KCnTG+0v9+0A3OT0CWW8wY+geV3Yt8ChKj?=
 =?us-ascii?Q?8gTQJ8sBiq4mIWpdyRlMFtLG8RZcqsh25vZdJ/BvP7QmEdLVYYPbP29wDoRH?=
 =?us-ascii?Q?nF61iv6KavKGhZDmXvMIofovp+CqEW/17offFlE5WJSriDt4VDOMhmEtcE+I?=
 =?us-ascii?Q?r2b/ix9Kf4/edays8J4eQv7SDdULE9bmTxUTpveOLINdZnvpQoxc88zfb0RU?=
 =?us-ascii?Q?1TdZ5gkNDxkWkFLFrx/n+5QrOUAU8zgigm2E/5B9lxRRabd1U9UuweYmTX8w?=
 =?us-ascii?Q?zsLDBgZFlUh7T2KcyalPtNzGLwTB4nC2F5vYdesAzC764KF560i8Wk607dLJ?=
 =?us-ascii?Q?oxcPoInQvI7xALhruuB1fM0aXM+3Ec5YOKPANXVKu7YZATYtcCJI?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f19354a-e513-4fef-bb5a-08de6b102850
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 14:57:07.4319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QstO47+OfQVjTZFNFxOIJR6o/TCapaY5oUznELxf5WLWOmtgrjvBeQ+zm3p7lPxYstjqehXnlZyXy4RxT5c02/g61rsSNRZs0z9KdaL/E+0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7112
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 14:57:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231123

Hi Martin,

On 2/13/26 3:26 PM, Martin Jansa wrote:
> On Fri, Feb 13, 2026 at 2:23=E2=80=AFPM Quentin Schulz via
> lists.openembedded.org <foss=3D0leil.net@lists.openembedded.org> wrote:
>>
>> This fixes a small oversight of llvm missing for compiling i915 gallium
>> driver.
>>
>> This bumps mesa to 26.0.0, the latest stable release.
>=20
> I am not against this upgrade, but mesa has this strange versioning
> that 26.0.0 is considered new development release not stable release.
>=20
> As in:
> https://docs.mesa3d.org/relnotes/26.0.0.html
> Mesa 26.0.0 is a new development release. People who are concerned
> with stability and reliability should stick with a previous release or
> wait for Mesa 26.0.1.

Yes. Ross said[1] to send this as RFC so (I assume) we can review and/or=20
make it do rounds on the autobuilder before 26.0.1. Then Alex said[2] he=20
doesn't think it carries any meaning anymore considering they now have=20
multiple rounds of release candidates. So... /me shrugs

[1] https://libera.catirclogs.org/yocto/2026-02-12#39496615;
     https://libera.catirclogs.org/yocto/2026-02-12#39496624;
[2] https://libera.catirclogs.org/yocto/2026-02-12#39498266;

So I followed whatever Alex said, but we can also have this as an RFC as=20
preparation for 26.0.1 which would come in a few weeks.

I think my interest is to make 6.0 use 26.0.x such that we don't have to=20
go through TSC to bump the mesa version in the next LTS.

I don't care much either way, at least there's something we can review=20
and comment on and people don't do the work twice (or more) :)

Cheers,
Quentin

