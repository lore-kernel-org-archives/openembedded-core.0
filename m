Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16002.1794916293062564636
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 03:51:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=NZm2/elt;
 spf=pass (domain: est.tech, ip: 52.101.84.4, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zMb3ccswsQOlUlggIgZc65cyJksM1op3UdKmGv1PVpm4ZXWV1UYexaPodtTnj8TC0EC1E4g4C8ifHyp/XeQXHmDln5KXfASqTSe0sMBgH4oMg3Gp+VEGh5Dr+rcIeLvx0UEFbUIO4E/bbMIOn+LNTjkt0KtnKHp/I5FWXmUM52mf2o1vFzSgkGnOUMd83sp1d5vFykeKv7KJf9W67aDn16NF+WPbq673PIOEtp9vRfvhXA+Wp3KDqZUNllR4IQ/H9COorCy+Ojts37C8ONmQv8zf/DLZQ4jY0x5Dw4hF1y6EPxJaMj2E8PRwoZ9tvwEterD8Nnuzb2gHtO2HAuSNzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c/cN5n6GEOUWcCGiwVrVLbAe87ydrY/rIP/l5QnGukU=;
 b=VCB8xNgWicz/XkCOm2n5oEhOzXAyNqvi7oH1lAIyU8a1OlLKzhFDGWAE7e/JEkG7RWtRuM/VhMzS4RWFkaMcvPh3RCfBMBU68nQtXCWfHlsmBBCnWody3AvxPv8PkKZTJmlyXdq4AZDgzqHWOOXBIcatKu9Nd6VXgGu1d8S6E1Q1r07IxfxEm2pkZhOmmRsshzZvXTBp4JC/JKxG44rJB97WhLoPDB4ntIzH50knJ/bQA4hAZTWxQyX2s4ouzOhlntKwKLV97Qf/dD7w7Stx+0qkDBatEYkAvjn9OF1ALeTmJwjiMsgOd2bKvdT2OE+cukgHeHpaqdumNEmP77IhdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c/cN5n6GEOUWcCGiwVrVLbAe87ydrY/rIP/l5QnGukU=;
 b=NZm2/eltMaj6wpqxCdI8YjqAmwx9z5qz59Bv8fxkg1SOxVxju9ltkQWZeR/tuCphuhEOCkGfqDzOTHNyIk3hA1OHJBbH9NVYnfn57pSgfuYOtB8Eug8rgODp6kbSx9/cCT78kirbjC3UGwM7OkMuTJGfxVoGiLPtIqjtEomkmILCKlac1JzWNYCfLdGiTwDbFXx3GFYp9KyZpWN10ZGoOCVPpnm78JPGnvP0mElmYDVlVzOvERBMMfC+uXFHRWuC9R5+VXtdcYdV6v7b0y0luo+ymnwpNLZvw0VwFS8nlUuhwfWVyPFwjjj4Ccf1fhQy9fpyzhZExjUVuiKNU75+Rg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DB8P189MB0853.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:162::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 11:51:28 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 11:51:28 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH v3 0/8] Systemd 259.10 upgrade
Date: Tue, 17 Nov 2026 12:51:18 +0100
Message-ID: <20261117115126.14374-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P302CA0024.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::10) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DB8P189MB0853:EE_
X-MS-Office365-Filtering-Correlation-Id: c73bb243-1098-4810-595c-08df44a11d5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|18002099003|261009221727099003|261009221227099003|261009223027099003|261009223327099003|261009220027099003|11063799006|56012099006|261028144727099003|261102123227099003|261021123027099003|261022105027099003|261026140227099003|261022075727099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info: O6dcGzDl7S/52etTd8td7lCKnqgJsalEI0NYLgvV4wPJiPYcXBdjMm69GAPtRak/aLvqXyshnpVPdQCTEdEpT0ZSQZVcO1pQ3OvYirHsAlSxMjqETawGaF2cYTwAy5xsF93Dbpn7JiM+QoPv99eIAQEfO54Wj26N5QcUq6LNUFX9lA8sb3EJl3lYc5Cr89+jTo9ow0fZAclqiWlGyKjAg5FseFGViXmj9cVAp2taB/rAWNwpIQGtGc2D1RfQe2BQYkhfaE7KY4hAEhKOXZ8b78PHoyElf0gvneJhPTwq2s5zV/stCrBUO5mCgq4bEPwCvouu0GKyzYWIBjFpw4NTKJR8oo9j8oDZy2j5oOaeAZZSvYfbE8OVvvck7uLotyd1E/Xxrw/beckBHLcW0dUB8ThIgjy1ZGEcJ4P2wfsrx3Ax6LLZBD5+IczTeGH7imGRTqoEc3b7a7SNCr7PXvEhiPH7R6uBsNWjbr5kMiVCuSrSOI6Kdh8X1irbjPuuSc1ZU54zK+rS3SrNztZx629ZhD4uVpZFS8qvLJMvYluYca0hQ08gO9G4j/PzLTeaSR8v08F8wmfT8nC2Jwia9k9FuQgSQxHGdyXTBQZdck6bNHJqk7Sas+iLWCCKnBBJkojCdSQnWsgMrpQuPV9IOtCecjWhy7dJBmrFaxbGI9fFiaI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(18002099003)(261009221727099003)(261009221227099003)(261009223027099003)(261009223327099003)(261009220027099003)(11063799006)(56012099006)(261028144727099003)(261102123227099003)(261021123027099003)(261022105027099003)(261026140227099003)(261022075727099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?scJqzRmSqvi/7m4SNO+HHHhQkbTyTHCMpv9YXZphfohLYwCoN1K88PBtDZ09?=
 =?us-ascii?Q?1HCSqqnPsB/SEP5YL20p/CxioZ70q5gx+NDzLKn3IWxd6j2IfB9ZfX+zsfsX?=
 =?us-ascii?Q?HzSUbiBOjTRPn1KLovFwHXJ75y8GD3Fz3d8q2mZpUQ4LU3K9BtTSNiIjlvua?=
 =?us-ascii?Q?Y3U7iwraQixWxOpJv3SJ7revN4LspFtg5a68P82T9HS/PK0dVtOFakSp6oBf?=
 =?us-ascii?Q?sFe9S7uRjtJVRy4zM2Hv4oHQGOTq+0pswXbJ7mwNzJK2ET6SEjznYJv1ywQx?=
 =?us-ascii?Q?gcCs8cbfvA2+bwaUSJTviUMS4ILbAWnynRB1UMM49gZOUbdQDxWBghN59U/d?=
 =?us-ascii?Q?EvoqLM1T56qX9KudElWMSGAN78+NjosOpMBghNQVVww6Qe4no9bz+uTf2T5T?=
 =?us-ascii?Q?/9nEGXAXX5+NIsveFzF7BxQ/79RMOh0glLQw+7LqKWvK9T9o5LrGi28LS+ep?=
 =?us-ascii?Q?inTnAC4cPJykFfmpeT0Y2TgJiu2UQW+YunS8pApPHV/uDBKXZRFHXyzB9vVR?=
 =?us-ascii?Q?zSagbT6AILPU6FmxTm8Pi/os8KwzgY8xgNUKj/zS+qn3vf6vaVh93uw4mRG7?=
 =?us-ascii?Q?UEurmb3mrdVh3HN44pydPYLC7DxO13p/k2yvphAEih+fPjIIJqKuxUnP7cOb?=
 =?us-ascii?Q?j5wpmrV3ZocwTpf9//N0GmlECB7Pgo/Wy8Cn07W+Gb4e1vLxnFMP22/KU1Kl?=
 =?us-ascii?Q?xtV3ZIH36I7ddpfJBfkULNKA7UtNtDrK9h4SwAPIU/zr8YTjALtQ7Q7aGDRl?=
 =?us-ascii?Q?o3W+BCJfh9J/8XTaEStTgxVqweryk3lI2ELIzEu3nudbL5RPA1Mus64CxK8l?=
 =?us-ascii?Q?s/O0Ge3wf0xtbeffgCy0281+EmRyBs1FnhtS3WuL69HZyhLNMtqj+HOLhJ+Y?=
 =?us-ascii?Q?sW4QW1WQsKcBZKonb4fC7pOaFYeg2x5dABRaHWsPvWS0prR4qkOJbCdm38Gf?=
 =?us-ascii?Q?XLpJHvYPXJrbd8/iTk+3aK75zvLM6D6y7B8f/0X2sm55/dCOc7JC1UELfcmc?=
 =?us-ascii?Q?cQAL+iDHIflnDlIiDlISQQrt3RPIvXJcCTHMcxOUJoZzs8xPLrN9xCLWw3yj?=
 =?us-ascii?Q?Fzi/WAijLxEBShTJoTOsAABbxTPboMQyCS7TE3Umf8LR3QQipsLCxyqZ8l3e?=
 =?us-ascii?Q?ep7G6mBQNkqUqMa8VVcgDEO4yEH7utXs44BVfgJEyeA65EIQ0QjxuLz3dKYW?=
 =?us-ascii?Q?8JRRYcoiXITk+gWc3vKjwKz0EG+Jlk8XZyvsmvqR+QlEXk2py9T6ndbmsbG8?=
 =?us-ascii?Q?LcQED6ZODEiVpjF0sgxQtL29fcwJPb8ZONY89t1RxJ5oTV8tapNyLLj30vqy?=
 =?us-ascii?Q?IJz/7TldSCnAUkB8dxc6oeU/54cnajU/6d5PS7eb//vV8nTfJNtMWlaO5tYl?=
 =?us-ascii?Q?/XvAAuuIcFUNPOCnj3DM3hCTmuI8fOsVq+RGm5s96sJE1uwQgdsMMO7SBwDg?=
 =?us-ascii?Q?x2amjKrhJA9by0aSbb3DEStJQpL+3mOeE5LetfNYaoj/MQLsSGzU7XzY2Pok?=
 =?us-ascii?Q?F7d6HvlzM8lx7i4p2WBcznC86EF+jTT1RQMsO+F99R59xS+FwEM0nfd1hbdZ?=
 =?us-ascii?Q?FEWsrnj9d0Fy3XIsPscU8w4MHog00MTKwjtoUBvPBOsyHQQwgpoXltqultJE?=
 =?us-ascii?Q?vziHUOt+37YWkGgt2aaora3O9U4aDntSdvJllGxzoMbDPEtyf4WSo0+zdg+D?=
 =?us-ascii?Q?HEHV6047F/w2ByAfHNQ0WK4Q2snCGIWtlzu+AWaE1BDaJv39W4P6HZqczIb3?=
 =?us-ascii?Q?BPtZhwKALA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: c73bb243-1098-4810-595c-08df44a11d5f
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 11:51:28.4455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2joSUT6sCR9FMC9z5pge2/EZmr9eyqKA59GVFXqVFEhP0M+iXe7Gv2r3n1NA5yGmi0p9GLvgRXiAx3GPcR5/81OcSzm1TVYXtXMTk0qwHSg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0853
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 11:51:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250424
Content-Type: text/plain; charset="utf-8"

- Drop systemd-systemctl-native rename patches from v1


Jaipaul Cheernam (1):
  systemd: Upgrade 259.5 -> 259.10

Ross Burton (7):
  keymaps: remove obsolete systemd masking
  initscripts: remove obsolete systemd masking
  modutils-initscripts: remove obsolete systemd masking
  systemd: move systemd-systemctl-native PACKAGE_WRITE_DEPS to
    systemd.bb
  classes/systemd: remove obsolete DEPENDS
  systemd-systemctl-native: add systemd-hwdb
  systemd: no need to use qemu for hwdb update

 meta/classes-recipe/systemd.bbclass           |  2 -
 meta/recipes-bsp/keymaps/keymaps_1.0.bb       | 17 -----
 .../initscripts/initscripts_1.0.bb            | 26 --------
 ...259.5.bb =3D> systemd-boot-native_259.10.bb} |  0
 ...d-boot_259.5.bb =3D> systemd-boot_259.10.bb} |  0
 .../systemd-systemctl-native_259.10.bb        | 39 ++++++++++++
 .../systemd/systemd-systemctl-native_259.5.bb | 29 ---------
 meta/recipes-core/systemd/systemd.inc         |  2 +-
 ...use-traffic-from-the-local-host-only.patch | 61 ------------------
 ...il-fix-PCR-bank-guessing-without-EFI.patch | 62 -------------------
 .../{systemd_259.5.bb =3D> systemd_259.10.bb}   | 12 ++--
 .../modutils-initscripts.bb                   | 10 ---
 scripts/postinst-intercepts/update_udev_hwdb  | 18 +++---
 13 files changed, 55 insertions(+), 223 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot-native_259.5.bb =3D> system=
d-boot-native_259.10.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-boot_259.5.bb =3D> systemd-boot_=
259.10.bb} (100%)
 create mode 100644 meta/recipes-core/systemd/systemd-systemctl-native_259.=
10.bb
 delete mode 100644 meta/recipes-core/systemd/systemd-systemctl-native_259.=
5.bb
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-Revert-resolve-r=
efuse-traffic-from-the-local-host-only.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0004-tpm2-util-fix-PC=
R-bank-guessing-without-EFI.patch
 rename meta/recipes-core/systemd/{systemd_259.5.bb =3D> systemd_259.10.bb}=
 (99%)

