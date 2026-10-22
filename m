Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.32])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19473.1792663929511397773
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2026 03:12:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=BfbTLc7Y;
 spf=pass (domain: est.tech, ip: 52.101.83.32, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GZgm9pMsxiinnQbr2Xf/shYT45AFC0VfCjiNED5t8zvbMqTA3TdQSq8m5M7g7xbhAsFUefjSppPPE50K5w/8lBJKVz7cziRdA3nSB7ETKi5+KgCZG4kEJlIveQyuFTrwb21Ve81+yNlF9smTJR2o9JKbXNpILtHL/APa6j2+Kqgo6B5qc/9XrnK2sVV7JAE8rNmuaRy9LsPuRD9ZHk9fqPR0R9TNtoXDo1PPQopA9a/Tz1AF0f2rS1EbVS75I5OR0BpMyiVMRbKTIKcvvTgLPxg55rzeHcPYNG+iahCEU6GZFVJIpLgAJXyyeelLwFDaTP8oMK7QGPYUXNsxHS8Ibw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O4M18ZSSHQ3TqvHA+PUPL8boAsRDZjsYPuM/6qKmmAg=;
 b=UUlmQMOKpyC5ANEkX+15i1k3xJmkWO4Kc3MNdMoDETafcGXuCcj5wTL3dSCGZ18ZSL0/O2Iha7tl4+joQZO2BKlU+cKr6RY0FOdGbSlH8YemGcNXSBzQBflwkMMPOYxnPYSB94hCX1Z5V3E/2IW3unwaitacOmswnMTRQWvjravgp8nOM2aBc4UiU9DWyBTQVyPl61JDIjPsyA6as3PMbW8AAMzAJ42VaJSNson2TvJEpFn8JbS0NR64M4TaXBqjFpX+20OedL8hRJ8DI3lNWwcNrVza9KZRpHMOmtc86u2rlZXiypYonLevJzdlQdg1W5AOBbThDMLNAM9LepCjlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O4M18ZSSHQ3TqvHA+PUPL8boAsRDZjsYPuM/6qKmmAg=;
 b=BfbTLc7Y7/D4C2lIPm/zaoMVWDtubGn9orgToU7SFtVEocsDwwxRv3WqyRfGrMLzQKFHd0961jp6q6WyF/W4VbYxEYiSYjX9ecG3ib7s2NuG9O9+MklV6MSM9Q8SRLl6M8UfFWSU3Iu84HU9/IJlhSEraMTe5rKh9TwbZXtIVdUb+4q+VxUt22VKDbbkLVvQTqIgDs4qdFezxUGgM7EjMOto5RRo2AU5pNDSOujLvLnulWqHb23MjCK3LqbQptgcmetNJE1yTEFJJnVULljHEr8slplF/NwUmz8RVafNxgopoaUZvPXhZ77C47SG6iLl7A0WHlVGbm24Ddft+aeAEw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AS4P189MB2208.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:575::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 10:12:03 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 10:12:03 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: joaomarcos.costa@bootlin.com
Subject: [PATCH] Revert "classes/archiver: fix tarball content in "original" mode"
Date: Thu, 22 Oct 2026 12:12:02 +0200
Message-ID: <20261022101202.71105-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU2PR04CA0072.eurprd04.prod.outlook.com
 (2603:10a6:10:232::17) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AS4P189MB2208:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dcab17b-f107-420d-c06a-08df3024eb1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|261009223027099003|261021135927099003|261021133027099003|261021130227099003|261021123027099003|261021121427099003|10067099003|56012099006|6133799003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: +XZDKCjFawYa7t0jjP78Qq7Ja/7/+gKzu0i+Ju0OWn6f60MEkW3akYPJHWbEyBrhCMackRo9ArKRSu51OedA+mQo47bvvM3UcPlsuXsVKOKkPi83AATsuPknOxQOV4K50rW9os8Brq3fzFjeyDaHCPoulJeLeMl+TWkG3A4PnV/ZRBpjtoXtUUuXy5S04b0X2OFmQ9KzfK1cvN1qr2bhsO0ULfbtASihZ9iPgCj1IWcqmNYJA1Y0wDgWuKZBWWN5uF19WARko4Hcqm3hBhWDthI4c2i2rXKoN9OVmdIK8avx34uhlp3aRknWFRlvXTKao6roY0VUe9SB2tkz2OCgM/H7hCZgA8Y4xkRiWDabqKNHnGRSrZw91jpDpQA9zrtIiIAo3qbnc9c2luqLHPM9FApaRy1f58cFb+ra+hmiK1Qup9S9zVYeFMgxjiXHVXSPDmCg7ZX8dDHeYaZct1CSuxMjVLZBD2Pnhw0zF6MMdTNY414AVKtpPCqCtsbHKXbTOXU734CCinLcEUAiIUp1/pmhbRlTjCYEg34XWcF4qzg2siQTeAhOK6Hs3oaFB0hab9CMW9IpA+2qoQYCKuW5VC8brJDJV4snBpfSZbM79a8KPsAR84wBYmRh391OP2Xse6lYoDo3ip+fpQdWkCwBY2TvsaIOD/EfkZmTyBfCqn4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(261009223027099003)(261021135927099003)(261021133027099003)(261021130227099003)(261021123027099003)(261021121427099003)(10067099003)(56012099006)(6133799003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Nl/dhDfOb7jZ5OU+r2uh+m/OtBsAu00oelj4eipqFbFdpB2BSbhYZe7mxeZ4?=
 =?us-ascii?Q?+129gtGjUIVM8XmmkQBqn5pt63tZtH0FOvmUYDKct6tegnp5egPFjzuGHkI7?=
 =?us-ascii?Q?laqpQzHhhuWwm835ERxFqTLaDtYsbkHOZIgHQQifWAAozBjFmO9jzDvQSB9M?=
 =?us-ascii?Q?I0rSC3UKeyfuhwgwUFL31/wUsc7GhwS/Qk6iQvllpLRSMFEMwyUEoZy/Hr1Q?=
 =?us-ascii?Q?XtrBXwgMGuvvZorAzhD4CryijHerjsZh7qgzMZNA5Yf1NZjoSAsDbzoF7UN9?=
 =?us-ascii?Q?lYncdiCxMKg0GS5dmhSyH7K9bZJNsg+eDFGktm3xqxxIIxE+0+2dHI7t0Dbv?=
 =?us-ascii?Q?rxunIQec8RJKPkzaejDL7GGsgw02XkjM4Q9sUtkWmBOwC8DVZYXGjQ5XZ9zI?=
 =?us-ascii?Q?Fp7OSF2uALKIay+tuDR/LzIbvXBBImki9+p5jqIDsRi51xmch8NVi8XuRZZ+?=
 =?us-ascii?Q?Dddirntg79hdSV/7t6pwhsIqW9KAubt031jBgO3Fm6101Vur6EQF4BeZDSJR?=
 =?us-ascii?Q?Z/pj9Us13cTQVZa1kTGA4Ht54RDYEgrrl80NkXzeoRApNafqFIuxn+CgQedb?=
 =?us-ascii?Q?fpYglF3q1T2dR06dDzkRSC3LhzJBy36pGD2vr9JO8FeqoZoIbtTiNjQhlmY/?=
 =?us-ascii?Q?08ytaS9UnE9AFMLYRoXikfthKPn3ElZAw30sv2hW6u/qxfgCu7om6Lel0rvM?=
 =?us-ascii?Q?CFoGumCizXf65Nmb1pAh2PnIgBJ52w8ZZASqf+dK8ubzMta/UQRxbm0SnLGJ?=
 =?us-ascii?Q?eSc3mSbu6gHxwWuNK9d99+YUt+pnYnt3shenbDt0DvyYn0Mg8oO3QyJnHRBh?=
 =?us-ascii?Q?8/sc6REH6GkEmNMLHhYHX6cTcgtryXphhHmFPlifjEazJ5l5RIwpaZdH0n6f?=
 =?us-ascii?Q?LbTNPYMDQG+zFdFnwc/fQnjqft/iJ5CfVed4CfPTmjvx7ZxPlPbukEBsIxSk?=
 =?us-ascii?Q?n4e1XrdsEpQS0LNHKkljk2ZAgE56XdjmGZPvLC3ynshk9ffGDtNjp4dtkKr1?=
 =?us-ascii?Q?CCQkxAXFAiN5Snua/JQh808cDm7tESpwLyuoDzBTmMoD99AN2yETT6US5Ah+?=
 =?us-ascii?Q?TX2/qWnzcpDXF1Ove5ZQ8m3IiMqM1kziWaFg7CnhIW/cO3dp3mEWGXrxE2Jx?=
 =?us-ascii?Q?nftR3O+E4oDrZ0xrx7NV6SdDbdknKHxxkAAJcM1qffjfCRh/9NKcYTITaWkR?=
 =?us-ascii?Q?SOIrsaryULnTKUIm4K/bEJg+4EPYc7ie6bebqNajiNZEKJthpIWWoejwptiF?=
 =?us-ascii?Q?pQyj6maxinV61Yi6/liDs6Lx2OKug5x/qRvOkeHM+b8ZPtb2MjC6TUaeNNUG?=
 =?us-ascii?Q?d/Q4BUFrRwwiHW+yi6G1MyUlCe0vjnnsF+IefewhEcFQNMdJ7LVKLRUxdiGG?=
 =?us-ascii?Q?Xcltc4bZ6UBaTtm4LAYW/PBQhumxm7nRDPx40dd1gJ73ntEMSlVW3AZBxEm4?=
 =?us-ascii?Q?rAK7BZYAAXcqVclIVVthXGb6YzryA6hzOf7Tt2OCxu5al44p1EQJpW51VFjS?=
 =?us-ascii?Q?nb8GoQSPZa0iJZMahz+24TrnKUu7YQO1Lq/JLSp9gFklYkX6upftFYoIonqD?=
 =?us-ascii?Q?Nsw+zaVk7GUbOUxraCVEXSQmaAJ/WcQD5b63UZWOoIEd93joF/q82GkzGpG+?=
 =?us-ascii?Q?dalUhVrcogtZqFwqzR6oexnKrxekhs5QU97OwgRW5bXUkEyE/yYC9cv79fje?=
 =?us-ascii?Q?NONFNKBM8Ku5NqQj1xGaP9+KxCvSV2snyUyHuxX54VVNHOwdCBl0hjO0z4aT?=
 =?us-ascii?Q?a7jKYNt5ZA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dcab17b-f107-420d-c06a-08df3024eb1f
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 10:12:03.2997
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XSE/4HZYs6cjNwGdsSe2fqEKplSox/x00EbfO0Y7oCBXamuKCcGw0L8/IaXfIBJqZwWbkX3n7NkOCcUvz1MJOs65ucgQZY7xqGhEcGYD2ZI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P189MB2208
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 10:12:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248434
Content-Type: text/plain; charset="utf-8"

This reverts commit c73dbd0fa8a3becf9b90075a418325dc199e8a10.

Reason: Change is not handle original sources unpacked outside ${BP}
example with git subpath

Reproduced with sdbus-c++-tools from meta-oe:

    INHERIT +=3D "archiver"
    ARCHIVER_MODE[src] =3D "original"

    bitbake-layers add-layer <path>/meta-openembedded/meta-oe
    bitbake sdbus-c++-tools -c do_ar_original -f

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/classes/archiver.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index c824718a1d..b274c53e79 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -230,7 +230,7 @@ python do_ar_original() {
                     else:
                         bb.fatal("Cannot determine archive names for origi=
nal source because 'name=3D' URL parameter '%s' is used twice. Make it uniq=
ue in: %s %s" % (tarball_suffix[name], url))
             tarball_suffix[name] =3D url
-            create_tarball(d, os.path.join(tmpdir, d.getVar('BP'), '.'), n=
ame, ar_outdir)
+            create_tarball(d, tmpdir + '/.', name, ar_outdir)
=20
     # Emit patch series files for 'original'
     bb.note('Writing patch series files...')
