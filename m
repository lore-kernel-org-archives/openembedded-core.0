Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31622.1793876978210880068
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 03:09:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=acgTT9+S;
 spf=pass (domain: est.tech, ip: 52.101.66.21, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WHL3Z9RoaDi1z0ETdbIBXmKm2kFEZtveLyliF1d6RdculLY/2udyiW9VcbmkOwFn4puR2KN0jalu+qwRULgNa1wF9UAyNmnrx8NMeEhAgpXFlQ0rDsUYHDlPhwOtBrM8Fm1wywa67wKXknSCPObqROqatBj6TOoDwgzsseKgWAUNn4AHtSYXARFQP6HPvGrVsiifmZtGgsDPCtYFEYDtgp4vzKeLp2CCY1tk8om28Lz1KR316RU10qsU/gfhYnBkcw+DQefN/vnbY7MNBBni+SUNqlix4lLyjgasIHOuLQPOpqmXJH0prKhA5GDgP23RKx20AbhxmnoTxor0EeKi2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pWoQsdFqvwMFFSLwaT7reTuGapD3ebSZEcINzoEaKwE=;
 b=BAoYIrjcIodru54P5qTpC/ALcHVGHs3Jfig1e6zKeKbJWZV67qL4ipBOlMihAsjhojcpIFKVGDZ9rEKRAFofqFwawAgyq8NfT8L4idrzwTEM8Tk60MWY1nMl7U5a8Pobievnw8NfXgoq69UAf/ERyDDVqwApqX0fWMZZd39DPp47gm9+xRNEJS8iwECDt+x7dIyX/6+iLKvbWObZf7Co7F1YuEjMB1Sged2n5U4ox3G8BU+LYapkQlVNIo1vLuZ/EG9fV6L7RvTjJhvXBtrQAtHOdey3rKQC5udqWMmKkNjWk+zPZObFNBlMzVjaxd4U11leVA5yRYGqT0Zm9Nr0cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pWoQsdFqvwMFFSLwaT7reTuGapD3ebSZEcINzoEaKwE=;
 b=acgTT9+S2nFWzGbfLEdvUwHP+LlGTE9gZpnmI9SwuWW3mxPsrmwroOr64wdhoCv70pJ4hbx9fcVW1DdF99PbWft6Q/7yF8eYR0FyqyWT/Ir4g5VaovKOpOqc185uRUzbaedkoDpjgHHHg+NyXUJnHcnz2/NWMIU78ttAwlhmgtmIiaHXBG09KsNUDwwipZXwExPJCpkhu8Dt8yfAEhe5b+JbUluxmLx3KUUrQHkAT58w+17aMdXnZ5Y7QVk4icccOQgbVN5THPJ7dM1Zwz2OQSsDbgTL7s+bf/qpLa9lHC8Gxeo4xa1CvoB7qFtUyuDb1LsSjdEzgyVm5COfJ+Nkug==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by VI0P189MB3462.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2d2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 11:09:33 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 11:09:33 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH v2 00/10] systemd: Upgrade 259.5 -> 259.10
Date: Thu,  5 Nov 2026 12:09:20 +0100
Message-ID: <20261105110930.52643-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261027110126.9383-1-jaipaul.cheernam@est.tech>
References: <20261027110126.9383-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DB9PR06CA0014.eurprd06.prod.outlook.com
 (2603:10a6:10:1db::19) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|VI0P189MB3462:EE_
X-MS-Office365-Filtering-Correlation-Id: e6d04e01-3e5a-4000-ae00-08df3b2d4512
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|56012099006|11063799006|261021121427099003|261026121527099003|261022105027099003|261009220027099003|261009221727099003|261022075727099003|261009221227099003|261009223027099003|261022115727099003|261102123227099003|261009223327099003|261021123027099003|261028144727099003|261026140227099003|22082099003|6133799003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: NLMYc8SThCsLnPjPuNIcmHhsQyKcQgu8IVHtK82N+2pq26JrKen6QisFN11NE5GgKie8ZgL4NAxsJrXmidMdnxyMKVTh98bcVNNnCGwfPTFh0uMw62UHSXH+A8orUuZQ0W/FBbdAFiCQ5Dgw8U+M0UvwpVZJjkPlbGJ8Gjgc/Y2wtpie7N8kGvbYK1h5sLiVCgerGS2sLfnptZ8katly5z0lYCNkkjHnvc1ZYDtI5/7lDGsDpJcQwtD3awC8+K8Od8GYfqiSONqw5E84MOnjc7z6KL/x5Q8Liw5kD+9WJ+kSsg76UkGKGbx3JtpNTz2Ti+5TP4ErvqjMBq4fxwyvlvMUPH//ZNuwjui+oQfBGbKxMfd3EP1o6gxf8yoKpYfmJbDkbDXGC2zH54DlpagtJmgkZKA/EDl4IhK4zMUOdi0m1t+AuECy+qLhc6OMiI33TjgklDKdLpkOE5DDz33gP4e0fqu7OONYZnZKa5v6K55MiZD1R8dGpihOv/5daqCzo7KFM3GbYrFcSHpGx5weNEW6mNet6D3/xzHEST5twNNB0jSfw9+weKCJixRpFWzNw1bV/iuEx/fyqPHLZENQ4yrgL32QR6pJui4/RBWK7P7FcJqVlEuYfatUETOp+jPzF/SgkeUnkAR2NvlpTKULjYJ0/yZeyI2hyI93uxUwKfE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(11063799006)(261021121427099003)(261026121527099003)(261022105027099003)(261009220027099003)(261009221727099003)(261022075727099003)(261009221227099003)(261009223027099003)(261022115727099003)(261102123227099003)(261009223327099003)(261021123027099003)(261028144727099003)(261026140227099003)(22082099003)(6133799003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HlGRX/easYFaGmhXNRFKvDNM31Ya/zOC2f/8RqEr7DcxRJA2tHvaj5iTx43Z?=
 =?us-ascii?Q?4PdXVAnao5hGVENMdwF070l2yC34y+bNMnILiI1sESBWWAGT5Ni6dZduT2lF?=
 =?us-ascii?Q?SrhRMKGY3Bo0fpJNyooataOSP32gbKAPDKwG1JF8PRoejwo4otutSjziQRjR?=
 =?us-ascii?Q?gpvBh23+0Q5iKhOtkVqqjfYzmjgTzrgZZQSEJ7VDEazt5RCjQj7+3K+9OLDa?=
 =?us-ascii?Q?5P99qPiK/mxewAyOMAmqXGwbSHFJzp1GPVVSFR+ydsT4nm86QO55ry18Gq1p?=
 =?us-ascii?Q?qm1E55JYI6tbtgqZ2Bc9VWE2A7UVZOoIgsMxyQm3P5Wg0YS+leMw1mZvLTLN?=
 =?us-ascii?Q?FdBwMO8tcy7Tsf62A0jWlFhu72KDIrgxFRF2ZnoMK00p4JEZYnYJcUwyAXyX?=
 =?us-ascii?Q?muORQU+7gT5Z4iS5sPl4IIlK0PyyvLO7rZJCgUtstFeg08y7a6Ife4MLB+6H?=
 =?us-ascii?Q?g/D72fjZTNZMbt1bUrJPM5L1Foubj3JD1/AHcV7UwLyqkKstRbmSr2+Od/qm?=
 =?us-ascii?Q?MUjbD0jKv9LcUR/O88GOJbEs2P/YIFrhM9LOBQWAE190v19Lw1vWPD0bfTzI?=
 =?us-ascii?Q?5NxMvq+3MYrBokqQ/ScQ5rd5FnRxtQYhBE7eEOATTXVc4+BrpuLjiw6raMWA?=
 =?us-ascii?Q?ZTJm70Ji6duAp3uPqu2fLewJxvgUqYarWXdIM/hmqRcM7WCSXZqogs7rVG1x?=
 =?us-ascii?Q?3lf6C+IilvsKToRrgySTf7swdzsFhhDhlYtKTt+V2mu3Ja31Ho2FeQAgzFNl?=
 =?us-ascii?Q?Z3zeJHNDr/w0D9oAggfoOp/Ui+4oVXUweiOL2a5y/7833jTWoweZcqPev6XS?=
 =?us-ascii?Q?hrYUszW5iRNprwWtpGoQSML65P5A27e/rJPA+Rpt+d+5fEyb08IkYHIMrJTu?=
 =?us-ascii?Q?4eEV/ypDFQqzcnJiYJ57mSiEEDO75MjKHXYsc0wb3KrPGkT+fZjy/t0lWWBn?=
 =?us-ascii?Q?2Dy7jg2Uj0eaLXZDkXxY2PNq5uBEzLe7+/FWApz7j1vnE8hCvQvLmxzw8CzA?=
 =?us-ascii?Q?SOurw9DsYlP1pdQtyBdIWZlnrJF/LENbM8xlfNPeiRJvBLibehwCUH5BUp8d?=
 =?us-ascii?Q?pg4vA47AMySGpyyGAgKyMy8FIzS9A5UH3G6wSk/W7KlO8emrT5iQc81wHl33?=
 =?us-ascii?Q?vIQZeqbCCQPXq4pb64jZsWpSGyQ6EX0+3wP3QeaUAht5Zjy4QC5v6Ge9y4e3?=
 =?us-ascii?Q?9srtUUVz7/bYU+SFHRFYxeK10LNUj5zY0svLKlTcNwQzQXavGuMY6Vv6rsAG?=
 =?us-ascii?Q?522qIYcoTB26/JMijmaJzC+fbQ2UjF2o5I4s0kZI+KfdGq2vI4MpMTZPjO/B?=
 =?us-ascii?Q?bNfCZgAQ7hhDxNxR0vRgzcCX8VR51acFvypwNuXWYf8zFVM1Yx7Bl14NHDCm?=
 =?us-ascii?Q?cxNIMhUaZsXSxvm9GZRQPNlShTjIfML4RONbgebt4MQvjwLb9RLg1IfAzrOz?=
 =?us-ascii?Q?ZfXtXc27vianY+hN3lRwQC3CyMEMyx6b3QCXMMpZfvQ/GFak1g8LsmSkdnJm?=
 =?us-ascii?Q?NIRf9yMNyM2h7MSk+YSZK63WOdSrNzCfVwVVTDk1rcsD0CYJ2LzG8RfbBOKr?=
 =?us-ascii?Q?whenZAlHj/H6Ev6Mpp9ea/QOEOSyX3lzOhgdoNXVG1HC/bbJmahrzs7eipCo?=
 =?us-ascii?Q?DX6bKpGIDm87ZSCy0PNxCFpVKIW/NwpFkgRNKcD1lK0prLt1BMVLgXD1dY12?=
 =?us-ascii?Q?oiFbYPOcghfGQrMVdNBGwtjJnaEmtcSf05tV2H46OZ+hsYzJRKWCky5Btc3R?=
 =?us-ascii?Q?2QZMSn/HfQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: e6d04e01-3e5a-4000-ae00-08df3b2d4512
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 11:09:32.9838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vw4hU8ElDHaz1R9vrBPKQr4U/icwOjYRXPY9Dg1PrffBmV6AszMZDYnRBH63WtUahBP+iUZh8sjwjUeofjzZhcURASshCwRf2GJNt2AL1cU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB3462
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 11:09:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249527
Content-Type: text/plain; charset="utf-8"

  This series upgrades systemd on the v259 stable branch from 259.5 to
  259.10, and backports the upstream oe-core change that generates
  hwdb.bin natively at rootfs time instead of via qemu-user.
 =20
  Without the native-hwdb change, the 259.10 uplift breaks image
  do_rootfs: the update_udev_hwdb postinstall intercept runs the target
  'udevadm hwdb' under qemu-user, and on systemd 259.9+ its statx() use
  fails there with:
 =20
      Failed to write database /usr/lib/udev/hwdb.bin: Bad address
 =20
  Confirmed by A/B build: 259.5 builds the rootfs fine, 259.10 fails
  deterministically at the update_udev_hwdb intercept.
 =20
  To keep the series bisectable and regression-free, the nine upstream
  oe-core commits that introduce and depend on the native systemd-hwdb
  are applied first, and the version uplift is the final commit. This
  ordering means every commit builds and boots on its own: at no point
  is the tree on 259.10 without the native-hwdb fix already in place.
 =20
  The nine fix commits are cherry-picked from oe-core. Seven apply
  cleanly; two (patches 7 and 8) carry small, documented adaptations to
  our local systemd-tools-native recipe, recorded as Note: lines in the
  commit messages:
 =20
    - MESON_TARGET keeps the "<name>:executable" qualifier. Our meson
      (1.10.2) reports a bare "systemctl"/"systemd-hwdb" as an ambiguous
      target name because systemd also ships a bash-completion custom
      target named "systemctl". This can be reverted once meson is
      upgraded (oe-core master uses bare names with meson 1.12.x).
    - The local "-Dpam=3Ddisabled" option and the systemd-sysv-install
      do_install:append are preserved.
 =20
  Backport note for 259.10:
    - The upstream "hwdb: strip the root from filenames" source fix is
      already part of systemd v259.8+ (upstream a9397de9d2). The
      corresponding 0001-hwdb-strip-the-root-...patch is therefore carried
      only while the tree still builds 259.5 (patch 8) and dropped again
      in the version uplift (patch 10), where it is redundant.
 =20
  The version uplift (patch 10) also drops two patches now included
  upstream in 259.10:
    - 0001-Revert-resolve-refuse-traffic-from-the-local-host-only.patch
    - 0004-tpm2-util-fix-PCR-bank-guessing-without-EFI.patch
 =20
  Testing (qemux86-64, INIT_MANAGER =3D "systemd"):
    - Every commit builds and 'bitbake core-image-minimal' do_rootfs
      succeeds; the intercept log shows "Updating HWDB with native
      systemd-hwdb..." instead of the previous qemu-user failure.
    - oeqa systemd runtime suite (testimage) at every commit:
      10 passed, 2 skipped (minidebuginfo coredump and the
      read-only-rootfs disable/enable variant), 0 failures, 0 errors.

Jaipaul Cheernam (1):
  systemd: Upgrade 259.5 -> 259.10

Ross Burton (9):
  keymaps: remove obsolete systemd masking
  initscripts: remove obsolete systemd masking
  modutils-initscripts: remove obsolete systemd masking
  systemd: move systemd-systemctl-native PACKAGE_WRITE_DEPS to
    systemd.bb
  classes/systemd: remove obsolete DEPENDS
  systemd-systemctl-native: rename to systemd-tools-native
  systemd-tools-native: reduce dependencies, add comments
  systemd-tools-native: add systemd-hwdb
  systemd: no need to use qemu for hwdb update

 meta/classes-recipe/systemd.bbclass           |  2 -
 meta/conf/distro/include/maintainers.inc      |  2 +-
 meta/recipes-bsp/keymaps/keymaps_1.0.bb       | 17 -----
 .../initscripts/initscripts_1.0.bb            | 26 --------
 ...259.5.bb =3D> systemd-boot-native_259.10.bb} |  0
 ...d-boot_259.5.bb =3D> systemd-boot_259.10.bb} |  0
 .../systemd/systemd-systemctl-native_259.5.bb | 29 ---------
 .../systemd/systemd-tools-native_259.10.bb    | 45 ++++++++++++++
 meta/recipes-core/systemd/systemd.inc         |  2 +-
 ...use-traffic-from-the-local-host-only.patch | 61 ------------------
 ...il-fix-PCR-bank-guessing-without-EFI.patch | 62 -------------------
 .../{systemd_259.5.bb =3D> systemd_259.10.bb}   | 12 ++--
 .../modutils-initscripts.bb                   | 10 ---
 scripts/postinst-intercepts/update_udev_hwdb  | 18 +++---
 14 files changed, 62 insertions(+), 224 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot-native_259.5.bb =3D> system=
d-boot-native_259.10.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-boot_259.5.bb =3D> systemd-boot_=
259.10.bb} (100%)
 delete mode 100644 meta/recipes-core/systemd/systemd-systemctl-native_259.=
5.bb
 create mode 100644 meta/recipes-core/systemd/systemd-tools-native_259.10.b=
b
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-Revert-resolve-r=
efuse-traffic-from-the-local-host-only.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0004-tpm2-util-fix-PC=
R-bank-guessing-without-EFI.patch
 rename meta/recipes-core/systemd/{systemd_259.5.bb =3D> systemd_259.10.bb}=
 (99%)

