Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.60])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7219.1793698101544969562
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 01:28:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=wJO77/mt;
 spf=pass (domain: est.tech, ip: 52.101.72.60, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VBFtAyuPkKatmPAIeII4DcvUXF2KkdHAVi9zpJm4lepBuPcJ3g2TsV1YiVNCaAY0Jmtq6VAebcsJ6bvZKwJeotmOlOVqp/YGEyOODp9r8KperzP0+qErC+HzzWOR+uNcIQ9p6QzfBp7L397XAG0EIawEdxDS+qRAtOt8b9mJkU3AsBVFiUblhw+72tIVAfFqkn4jkW8Ji29RJCGqqNM6NQSFklATjXC6lgfOv4TjeeTCkhy/ly/tTfyEA2ZB0AQZpscVGnWxPEk9fRBvraIqngA+4Ptu8M9QM1xN+VetHknzyBP3X3xEW7Ik6XIcvMjwLtFn//mjMjZrM8OPqUUmKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w8DQZfYs/tNao9nP4J5o7y/0X3pdkKULzcq2Gce3+zM=;
 b=FX2XmS3foY4GOUlmyo09I6FJ8DDVgOwS7oSylM0S2SdLhaV8QGfoAGJpBLZDjI6jWKispznaGQcNSSg3UJFAEl8quobuLFgMSHuQ+aq0sPbSmaTqBksTMaiSy8vQAac/ZWYrWBHqjMGofM1d5iZs7klpKrco8HewTnqUsWQNMnoYsKlnrO85Ml068s2o89HnsTMh1YrYvosM2D9QVfp0dIXEZqzUPzfAMNauQDZEBdE4dpiqVCfh/ZZnXl5c/8SzDiHI4FzkjCGwaEzTZtj5Rt27nk78h136wBW4H1+E/vKnBJEGawvs1wBt0ybNIF96vYufycnUdq5sBu+uC94xng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w8DQZfYs/tNao9nP4J5o7y/0X3pdkKULzcq2Gce3+zM=;
 b=wJO77/mtzF1mDZLAvgYMh0ptFQoEyR5GB3QhazWodc01pbQ6IbnuDJY2nzuyUB9tozgUx5wJ0ugFcXqzDC5GW4q70cyTNyjAIxBKN1LpbSM+StT8oMu3LyQwo3UQhHuKqPes2ZQyXoK9+JVHOBEjQoeZVlrkbXYYgNPtmeb5hcRUvGpd8dZKNOpn1wGixKa/gTgY/mFfFG8SLSHhqdZ3chkf2XoAkzd+qCdREL/FYnJaco5qyddG+fftWYKfN4d6oTQYRzdS80Clc+Cb31+aeOvYksoxlP5I3DpZxWJ8TP0WF1cnwhHceMzXYxFPETM/Y9CC4LJz1G51txrQghkerA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PAXP189MB1951.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:277::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 09:28:16 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 09:28:16 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/12] mesa-demos: upgrade to latest revision
Date: Tue,  3 Nov 2026 10:27:57 +0100
Message-ID: <20261103092800.39286-10-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261103092800.39286-1-jaipaul.cheernam@est.tech>
References: <20261103092800.39286-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO0P123CA0012.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::20) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PAXP189MB1951:EE_
X-MS-Office365-Filtering-Correlation-Id: b38e8d7e-3b6d-4fd5-5d6b-08df398cca52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|261102123227099003|11063799006|56012099006|261028144727099003|261021121427099003|261021123027099003|261022105027099003|261009223027099003|261026121527099003|261026140227099003|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: ETWaSljLPVEy1qohT/tYJtvXuPvq4tluSlsaUaF4Q7hhLBbtcjQTwO+CAko0klQCDOuwK9vSWOLwJrN/5/F297oeU3jRVfTmWfrBeTWIma4NSWsmaazkkFIwZhggGp1SNHo9IJGUcyLe0ALqZxr7eifT1i2uiPj7omj113UcUamt4Oc+EI5uEH5lK/BaiPkWgFcrihGibNVQch9Xstz7lcTj6lt2HkBDOONunZteO6fWmarY9611kuDof7ehAcoF6I7CpyDzIbLMJHAgFs+0Nh02y10rSvSWxK86VxTv5W4LlM41IH8S1Y21bYc/OBrIL9aYE+GnCq/X7Z51hr+fRwrYXAEn5vWREkNCn5ATqLTe+iz+nAlouY9Eb1r29s8quhTm3mS0+ct3qhG07S6SeVyKl+3y6n4LZMlAO7Zd6oQD6QXC0lTLMxaOj5kbz+8GwjayBSsPUe8jDhHSzuerda1WbZQUtOzH0purbut8t/yib5+ba6sDuwwBxY4hwlUzii9BnpLDVW9U8goipydzMePDEpvU/M66QTe1WrcfIJfPW0SKMi+xVolA0W8aPAfLOpkh9FvuuPAbcNSGEiPqOiUgXextAK8JhyZIsGABG+K+Wj+30IBGqgOK/PfnCb0m1XDK8sSLATPkaKD5JqIMj6odLLCUujbRyqAGl1gtQGg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(261102123227099003)(11063799006)(56012099006)(261028144727099003)(261021121427099003)(261021123027099003)(261022105027099003)(261009223027099003)(261026121527099003)(261026140227099003)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Kez0xK/P0BnAc49wZ2cKG6oSdmGStVmC20YYKLTe5w/q8ew56i5zR6m7VtSl?=
 =?us-ascii?Q?ob3IU0kkwD392fQLEUD00kc+qiPouKwh3bKTbvSrHi0KxfU3sI9Xrukf2WGA?=
 =?us-ascii?Q?N4Kd4554sT20NxDLUsdZPRwR/d+4ZkAEQgVO9cPh0m/Odjb2Qjb24kD+PoYV?=
 =?us-ascii?Q?NRARruvscxHif4eNqsZxqjPN6cRM6Yjsyjy82M9beITPbUJGckO6+jxv20I5?=
 =?us-ascii?Q?WLKLUfQOXdc8cyS+qoNjclPmCIecHI2BO4KrdRBYKspc6i+kt2CHCw5Jn52l?=
 =?us-ascii?Q?C0Zj1z0eLACiaUYfT0YIVj7rt/GPyo0+8l/wlDBCUQLGywOfO6iU5RdTsywA?=
 =?us-ascii?Q?gpwgHCIM49K3tbyhmKYOEwCNmJhwJFNZrkqIJtJME0qi4Vg++nwUWKWje+JV?=
 =?us-ascii?Q?4/wjMiQq2RaYWOhhRpcDK8pC2RxnK8dqaN7rrdw0XOV66DygJCJKq7JpCRoX?=
 =?us-ascii?Q?BLxbmt8Ek5ksy3PYIVV7ezSJz4d107o7PuE9aM2db3OtuN5FU/TJ8nZ2fn8g?=
 =?us-ascii?Q?uGh6H6aKYpzaKOh2ZsJbcYLlOQ51qfZZ66qK40yu1HXn3U3UWIbfANQgbxYR?=
 =?us-ascii?Q?qgyE5rXwKiVEOE7FTf0SwbM1YRofVV5sYlIfLWW7qZcF7U2i52q/MGBe1icW?=
 =?us-ascii?Q?2Rjb177d85h+8z0o/EtR6Xeu7ofRPtirVBJ0wsoVm7qPuO0YAHfO9elYU0rT?=
 =?us-ascii?Q?nOhR91s/e68QoMwgd/can+NKRh3LTN1AjY9j/mrUU/5w/3BLEX0iAJC64uW6?=
 =?us-ascii?Q?HIhthu3mR3EO33R63FCBgbbAsUp+bPQYPspGDTem2Rk1QHEPA0buQYtaHyf8?=
 =?us-ascii?Q?bbzJSHIDJRfSFoP0+aYqcOkoykD8VAGq73dXBdaOv42QaITuUiU7wTFKGb2q?=
 =?us-ascii?Q?K2uk8n3EQDul5NeP0jx8UduwIyxKRadrDaITymEtscaL0iVh7MoJBDRe4G6M?=
 =?us-ascii?Q?4j0iLmUQzHrvEtiyzjOoD7qL7XzuNqTNcSNYYeP03g0Fj90ZCvo1JUDXQ3HM?=
 =?us-ascii?Q?iOy/ITqQRc15XAKW65HvBt+Us5SrVm6duC15i82omy5Jwh3/U/XWQMsRHYg6?=
 =?us-ascii?Q?Jnb1AS3dIuYRY8vXkmllfiCKP/KdUgnpoh1u1oUTW+iyXenIUr5sByxMLaKr?=
 =?us-ascii?Q?fBpCTiVguV4z2j7YgotZfT6YuipMXYWPT3KBISvMU/8Ql9GxmnCfx6/Jnf8k?=
 =?us-ascii?Q?+adXrNHsRrHIGWykv7QCTcj0ESTG4Ie+53Zxqu641IEeS/0Cw63cbJzque1H?=
 =?us-ascii?Q?HiPfUYLR66ClHH8mcvYFURtCYAG8U1xr0dQaNtu2I7atIvOqat53o8O5mlTc?=
 =?us-ascii?Q?TNc21cYHO9Ah5Ge0UTQ26KtJIUpzFJm05zLNmXr37u0N1FNR4I45Gio4zOP7?=
 =?us-ascii?Q?2knEBolsVmM2BPTwdshYnCGl1HFmFhpGvXoikf9AVqlfE5IrQRgImGLEiBYH?=
 =?us-ascii?Q?StLA3PIKMCg5Oe7oAffpuwYnxKDmEuKYPuVeMUxWYOHo2TBgUN7IbTmddX2B?=
 =?us-ascii?Q?dX5KjQlu6VxVDuvf2scTRWSLfODorvkGLf46u1Rv0tTO0AMDxdTyOR/k1L/i?=
 =?us-ascii?Q?Twf7K7KFIztCiJ8CC9dE6qE4O7FpVtDd5giIeo+lItdiTSN481fh+8t5NYNu?=
 =?us-ascii?Q?m/EBadQypylsBp4HAKomgtH6/XF7yPMMtK9kMiNT7qTj3dNCVIP/zfzSt7Tq?=
 =?us-ascii?Q?zKPqXMzCM4/1rWygqbypiWs0tR/oQkq8zosBBBBOs2tyzC2yxAIUQeFtNGj4?=
 =?us-ascii?Q?PcioVE8bXA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: b38e8d7e-3b6d-4fd5-5d6b-08df398cca52
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 09:28:16.3456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OwLb1qBitIxehF61WCEYdKb0yTHUt3IieG7VA2kF1m0+ETp0NmfIshWlu/mA2gYGnLyhEfQ+0sEglF0s4CsIV/tQfKBhu8nCAdzMbNld/IE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP189MB1951
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 09:28:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249262
Content-Type: text/plain; charset="utf-8"

meson: list GLU before GL in demo dependencies

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb b/meta/recipes-=
graphics/mesa/mesa-demos_9.0.0.bb
index e945538c48..6c5b83f4a1 100644
--- a/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
+++ b/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://src/xdemos/glxgears.c;beginl=
ine=3D1;endline=3D5;md5=3D2c456
=20
 SRC_URI =3D "git://gitlab.freedesktop.org/mesa/demos.git;protocol=3Dhttps;=
branch=3Dmain"
=20
-SRCREV =3D "71b184c379625c91195f5d69186d4de5a1f642ac"
+SRCREV =3D "649baedafcb90313ade69909fdef1ee156ab5f8d"
=20
 # This recipe doesn't plan to make more releases, so track upstream git co=
mmits
 PV .=3D "+git"
