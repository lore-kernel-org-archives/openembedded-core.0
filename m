Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.57])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31805.1793876983817942877
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 03:09:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=mgeNeVy0;
 spf=pass (domain: est.tech, ip: 52.101.66.57, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u3KJSpCJuxWuLGjaoPF1lNPZOkShVd46eYXPb3iXwq4wPXA5gbecYpAwc1OfAkaoThhh6OLD0GI03EsfbBjyoSZKcMHWzm7YARBV9J2etCjMxuU35/+kD8xLNy0dPk8c+bk4W/hmDnkjUeKtRJND/vi1ILGCykBd/ICTy5P/mqOk6PdGczSPqLpbXMD2nrTvtYiM0GNxMyrMu3J9ZbQ4lpKyDRXq5t5hlAsMEA8pDlyUSXonzUOfGa1v1carIslkkpa1pgzswitzPHclj9tJ8h33yFhwfn9ibGSedKNa47oYMH3nm+uM/873OzUIVCBjoD4P1VKjX5CNdBIeF9w5/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tNZqvv60Oh1VCXUurJP3a5D/sv50ktuByWwMgHFX54k=;
 b=qu1GEtdOV48uSPi5vkCW42vWSOxzRIKjPuHUCHbIXsBPHKZbwxyw66rpIepoWDcrDNMDSddNujLEiuXget6L1bfqdEve1q9msfQfRnNjvmLyMhTJWuRGG+EjHHgq+IrlfzeN6rhMUGYMR6d3IR7maPgbmmH3X/AH4/2uxvz/gsNOabW/SgvKAEYcT43L8TVgWR6tLH4cXG8seDJO3Wqwyxs57plHOrZ+8yqHxiq04unGFiZ4yxj+Ues9dLigrDJ5RF0j2qTTEwvOLulMer/RJDjbAE97/53SvIdSQ/s9KcF/L8SzypUTaah10RoiS7VS4CCRqdYx08j7s96pWdVrpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tNZqvv60Oh1VCXUurJP3a5D/sv50ktuByWwMgHFX54k=;
 b=mgeNeVy07pOUk0NvwvYrpQtixPsfbw9ULA0wUhoCGtZX78UFSqCtVw5BWeLPhwLqf5CSyen5uQr+FrM8zGsBGI7iEOMWJ3Uz2L8z64Craj9AupKGruQ4dhzA3u5DTtMUV+PpPBXWsYPs+RiR4BzrIvIHkL3bilssW0Z/DfKr5jAxZ/lkfgg+4phCMuG0nLNil30iWxsLNzm0FE3pox2n+roSfE1YMlRISx59ElANgGHgwoIQKmdgV4r/tqL3Cp6CKh49OLzkrkpgjDSRccgE2DZpxIZv/MeZqwuGYeToklK9aocScf/1qae2ijT+C+kDM1JM9CZidFfH7NC567k4Iw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by VI0P189MB3462.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2d2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 11:09:41 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 11:09:41 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH v2 05/10] classes/systemd: remove obsolete DEPENDS
Date: Thu,  5 Nov 2026 12:09:25 +0100
Message-ID: <20261105110930.52643-6-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261105110930.52643-1-jaipaul.cheernam@est.tech>
References: <20261027110126.9383-1-jaipaul.cheernam@est.tech>
 <20261105110930.52643-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU7P195CA0004.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:54d::34) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|VI0P189MB3462:EE_
X-MS-Office365-Filtering-Correlation-Id: 64bedabf-18c1-4002-27aa-08df3b2d4a31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|56012099006|11063799006|4143699003|261021121427099003|261026121527099003|261022105027099003|261009220027099003|261009221727099003|261022075727099003|261009221227099003|261009223027099003|261022115727099003|261102123227099003|261009223327099003|261021123027099003|261028144727099003|261026140227099003|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: /GJ1ksOxTuS3oyraXy+Yk6Lpcmtn9yl+ivqxypIK5g8BdhLmzCSB7TRL7fFInaFQ+eypF0/y/MHdPlIxMKbIrh8FXM6jXpXEHrw/Q2qAlRy1qR/rP38ucVFhMMH+5HFDRP1yIHVw/lc9cRCB5N8G+Odxg3aY0nb9k+pRtRSKfoEpEQzdPXE2zIxooH6bXOREUoX0TiolPiXbsr0z+jANJE6gEKIdMUz6CBAhFWjRBspuE8xDBVQH0DvLfO+pgHXTnII0R4sZN875sVY6/jfh/cVk0HdeWxN94R9eaQRtn4pYpz4vtiPnZKlWgfc3XP8JZoeP3P0ErFAeg7Dp6BUrZ8d+AOnhTVhICk+QFtX/4SZhgIElQD0ItypKGNWjojmoepDCznj35QjXkU17vTV0vJNr1UmG+3AEpIokGlMHnCrwaX8YeF7OIosRC4rb2fbbhZBTZyXudGlXrueMu/tmQ8JpTKz8ZQrJ8IapPkQgOc+1/EqRT+DJao2mzda5j/ox29kc0zpSaZYKv6wb7YoYUN2wmSGxGqRlGoHCyPt7nrxSxGsqsAesR1x21L6ftnUJXvNsluW9sqMaaQ1MRWlyFNe1BSchsrW8+BHECrYicoOgkpLegfuXCxcuOUn1/tXZ8B9ghCy7qAv7iBiwGA6uV2Q5zQT8eEhkk7OAkKDIDjc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(11063799006)(4143699003)(261021121427099003)(261026121527099003)(261022105027099003)(261009220027099003)(261009221727099003)(261022075727099003)(261009221227099003)(261009223027099003)(261022115727099003)(261102123227099003)(261009223327099003)(261021123027099003)(261028144727099003)(261026140227099003)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fNMaFBDH5wvSnLZ4+RsSJTk+SziGnASGLaXg8cERRcWYsgUK12gna1VRfN41?=
 =?us-ascii?Q?0DWlQ+KyEnJcTXLT2z0a+hh1aYtsu8kM8WKNemGDy2XD8B5t5OWpKh1BIcjP?=
 =?us-ascii?Q?ygPhSL46I/fC74mJr3CprG7tKC6E7Zyp0FTW2r/UYWT6jSWxpAlDMkg/j/fU?=
 =?us-ascii?Q?/zIbNn1sNh5T1HPMMqBr2WA5xrqbx6VAroMTgFtLym67aYvLfeBqy/KlTOd+?=
 =?us-ascii?Q?iPV0rAaRyOEsNBRW5ScrJlZq5CezsV+9HjViMhXwuYxn+JKtUcVNgiDyKDoM?=
 =?us-ascii?Q?sEuIFqPkTvcDFH80TNcYNRCuMOQvr6PRfoGfwNYCxP0r4mAr/WUOIVIHTIwi?=
 =?us-ascii?Q?fNtQ24kHfORUsbP+RWB90vx4siZTYlyJNvur4qZ17ogvqlRIP4D1XugCRiVc?=
 =?us-ascii?Q?wq3fWFexPnD7dhS1/0QeCTbpcItWt0V54aHt2Sgh4LLlrlcRMS4K8Ng7xrx1?=
 =?us-ascii?Q?iLny26EQDgHRQCDtY/2YtteZQ8in5LCUnOstNgtWWa4jdMu1/kXV3B2tb0Xi?=
 =?us-ascii?Q?Idoq2U4r+t0sS7fgaKl2XwwSsqU8mXEf2dO9NYZLnxxGgfym9XNiAxZzA/oh?=
 =?us-ascii?Q?XWSrZ+6XTM+x8Q/pwJ0exbPb7XB4KUyIrXKuW9YIshR9iSAwUvWHLmZ7FVWj?=
 =?us-ascii?Q?f76NoCndlAyHkGU4pgoTvB1z5jDbFYRN6y2fXxawPDbaM9vL8OTvkVdH+Y1+?=
 =?us-ascii?Q?46GJzV7ByjcmhEvmxP/tEk0vtOST5z5AZ7yKMJ/9rBsmUDjYrPYQN06XIbLl?=
 =?us-ascii?Q?wsJFcgmPOA2uww5FRyPSQ0ZZvKMe6dkGXhOsNXfinZbLUvGHX3BxGgwI+mW0?=
 =?us-ascii?Q?IFFYb/uALjyxZZAstw+6dlb3R4sm7fnpfXJ3sn0UFB5Abl6P37vavy0A741p?=
 =?us-ascii?Q?CAu7uBS5lR15wjOsWuwcM7eg3NkDAeNkKxhTZPSD7ZMjwLYhTDhJSjKPGz0N?=
 =?us-ascii?Q?1qJWEDAoKdBRB/Tk9zdqMkcHORef/yC/a8gX19kq8qlHvW6Ew6HjkGCqPnVj?=
 =?us-ascii?Q?EwugAaL/l8t3/qbtSnn98Uzqr8273z5k+Hx4a4snliFPmDtMT2QoYuhhrN1r?=
 =?us-ascii?Q?7s3Bz9vAS917rkeTl6unEFIaXDXdWMZ7fXBsRupkkAH4IR4TD9K5AWHDe70D?=
 =?us-ascii?Q?iihpm9RnTxjDCut1gJBEULaYViswWyYmddxHBf97OuvNjENGDJ3c8Xmui3vF?=
 =?us-ascii?Q?mdCFJL2pVFDDoAYkRsKxSzfNqe1rNb282u3ZNFXxYkeiODOdQmpEq/ci/U3j?=
 =?us-ascii?Q?Sq3cJoUXPbJKNvoscjhmFo67CI8nLTRWHL4YW5jAHMOXMofAqmhtgJFYZ1YI?=
 =?us-ascii?Q?4njunJ+gnKLoxBeeBB+l7imZts6zalfuK3yfVbZc7acsfrh+14OPSYrMUkRy?=
 =?us-ascii?Q?tKj3svwe4Ubiql405RdMPIs8S4zjJlVDFD4ez7YvW8V8+WK0StTiCQkA+PPX?=
 =?us-ascii?Q?DAEC0nZiALA3O2b/RCTkRLo3wLlgYZoL/bHlY5mKm1JryuEmdAt+Tx/J2DW4?=
 =?us-ascii?Q?SPvh5SI/sqF6o+WDoJrb46LXxX0OdB4cGr3q6emKq1NrxtFejTWqiZvc03HQ?=
 =?us-ascii?Q?5sXxbaGyFRYVI8cM3BQuRrmKuhK53vaPEmBS6TiuZ/Mq9Vm1LLUezem+mhwD?=
 =?us-ascii?Q?WUoT6LTlwg38ifepoxsItQERz0yBDesI+sAM6G8mxEcKw2an+SGHkwIBx6pW?=
 =?us-ascii?Q?GeYsS/QCgj50mfOl8ajjA4aU4urnKsqSnfYGiLNKtZ52tn1K30suKFLLJ/mT?=
 =?us-ascii?Q?Owc530gJ3Q=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 64bedabf-18c1-4002-27aa-08df3b2d4a31
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 11:09:41.5154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QbEKSUBUu+FX1WovOVzxUv1nonbsSr1u5suYyzCnHZTqQb6TDp8d1E/YiEf3OaLGXeTX4l/Se331Ldei5Io2pF9suXVrlZZ+bq10xuTtG1E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB3462
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 11:09:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249532
Content-Type: text/plain; charset="utf-8"

From: Ross Burton <ross.burton@arm.com>

Recipes that use systemd don't need systemctl at build time, so this
dependency can be removed.

It was added in [1] but no rationale was given or is obvious.

[1] oe-core e9444649f4 ("systemd: Restore mask and preset targets, fix inst=
ance creation")

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4e91abb261257abfc23acbb87f3d08ae5dbfbb5a)
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/classes-recipe/systemd.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-recipe/syst=
emd.bbclass
index 5d8e6086b2..df464baddd 100644
--- a/meta/classes-recipe/systemd.bbclass
+++ b/meta/classes-recipe/systemd.bbclass
@@ -21,7 +21,6 @@ python __anonymous() {
     # Inhibit update-rcd from doing any work so that systemd images don't =
have
     # redundant init files.
     if bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d):
-        d.appendVar("DEPENDS", " systemd-systemctl-native")
         d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
 }
=20
