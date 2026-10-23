Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4916.1792754996519089873
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 04:29:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=uikbf9a/;
 spf=pass (domain: est.tech, ip: 40.107.162.66, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J6UuuoozCqnzIiR3yENXl6PW+GXHBmQanT00cyrRDK3GstUYsgMqVGMDT4B2CpZmX2aHcr/sqaApXCfnUBAZdWxU7Yxl7rFUN3+XScVPTHIR6jgwOf6fU+ERv2p+FeKR/dMEzeZWgQt4dpgFcPLtKjxUTVCfKdzRZvTecWpIRXnyen0R5iT4/AOa5bts30FS54S1tqJlX81LoyVXGsYIfb+GUWOTWvytlxcMq4h82mcyEP8v2MfvXJ4M9dCxZpd5Z/maCr1KpSfXPoRkmMVBYrCKYTYLyYWSMooch6qxdl0guSvksPZX2h/FLb77vSiA3KyC0oBO0oNVDO36zNicqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DPm0C0qAZ3qk0BSCFVTaqk+K1BbKMg4SfYFYSkzpJj4=;
 b=Vc0kxVKnmmmr4XhM3g4XgWnM1we0l8vK0wGxYaCO/ZPZZKgFJM5zVROYTzJm3L4VjYruW2ttFWJ8+2e/UAGSNS2tL39BUEchmHZNh09RbP8MTDx7tfaKBCmUFaZy6Jzfa1ddarbvbp/eI7p8qanO1h1GgcU3WG3mQF/p5ebtlsv2/LT7ibncMWxrkzY2kDVq1QwT9QzzcAuIT58Fd3WLa6CHkvSHuSPePO6bmaEkczXbunLE3PGqDJw9NG1ipuZO70lNS4a3i8epKeVzE7BOAcjw2GtRSATwiHAmXoDYaONPIBZ/KieNWz40LfACS22tmqPX1mlmfLLK8AtktYZ81Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DPm0C0qAZ3qk0BSCFVTaqk+K1BbKMg4SfYFYSkzpJj4=;
 b=uikbf9a/Mj26ieBfFZSF826OssyBNm72+MgWUmg1o5/isMp+5HAoCHTd1rgDQwXNHMOtMNXxrc/HdGHToD6R1btIYPZnfpBKaK41Oum/pW1JfOf0LGJjl/nxIi42uovSrTv9N45ZPku3RxntvWCEA8Qjbyn86JI6XALzLqVKAgp9lrMMVM+hrioUeiVNzkLHl2X9bDoqZTAtSEHx1ADM1Dpdf2bf8fH6yga58mP5u2EgYQZsk+/a3oosroNdAMlN/6g/l8TiN9KWK7JX9CvO/FMQVH/Ox3EqWF1YA3L6+wLjbvBfhA+MBLo5KzzEClzNEVn8wS/QD4EC9sth2opJKg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DU0P189MB2091.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:3b9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Fri, 23 Oct
 2026 11:29:53 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0546.012; Fri, 23 Oct 2026
 11:29:53 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/6] usbutils: upgrade 019 -> 020
Date: Fri, 23 Oct 2026 13:29:45 +0200
Message-ID: <20261023112949.77631-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261023112949.77631-1-jaipaul.cheernam@est.tech>
References: <20261023112949.77631-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU2PR04CA0309.eurprd04.prod.outlook.com
 (2603:10a6:10:2b5::14) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DU0P189MB2091:EE_
X-MS-Office365-Filtering-Correlation-Id: be89170a-213a-4ead-0643-08df30f8f542
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|261021121427099003|10067099003|22082099003|18002099003|261021123027099003|261009223027099003|11063799006|260925021311599003|260925022911599003|261022105027099003|260925021911599003|56012099006;
X-Microsoft-Antispam-Message-Info: 3uqSCS38upXXdJTtCZ/lHbLinu0s/j9z835idbLHhxI/AWNZID1MktMuqIO4sWXfJuK0mN0Y0NROfftFnFXxPYLhipqswDRwzPJl5tAX2o3GKTqRp+8FXztgsUsB1GTxRi45g+yqdXb3jUosD1LqVRaykSjge/9I1Eij8cENXw3d40lndOi52g89mkiKSmVoWtriGg7zNjMh8EGNjEEuT8CG3P7flBxbckkleKUHRSlrql+iNropsZc5rnfQW7v6mQh8uuwI5NzNMK1nrpvyZ640//SX2mklHO+FEgqOd7jBLWOVj9O53f+FNFkrHVcaYz6TM8WcGfJfxsKm0vA0nfE9Nx0MZw00JnZUI6Diy3CBfv5tS2ihA3exsjr6iwr4CaFs3/AlHGFFpoC0WWi/5WRhxzi3Jr+d9IysUs4QGIfAmGgFX1YHsfSwZGURbojAvnOIZ3uI6I52PFJxqPLhcSz5DU/6/In8XZGn6hD2xkd5bUKegW0qmkhLQWLSDL3GAQ504jdsZqzBocPwXYFDuX1HeWHRRm7AGmfC+eQj02fSpX5RS2BT1k6nm7OolFi4cFmjyYlDa6cLORwhjYXxwtew1eTp36axHxcVnIW8PuXeiU8JP+Sc7pxo3baAJWktsh+B1txXnD6AK72ilTVeKNmwy2eP58yaa6Or7q6lE3Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(261021121427099003)(10067099003)(22082099003)(18002099003)(261021123027099003)(261009223027099003)(11063799006)(260925021311599003)(260925022911599003)(261022105027099003)(260925021911599003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CT3Db7CHzBhayEs+r8VLhabcsAchImHq2i+qwfILv++DFFH21ayQq5gMwaBz?=
 =?us-ascii?Q?zqp/QHdKBaa22TilD4A5qc7i7hHMdUrcp5uC1PywF8xo7cX3Tt7Z5GO+eaYT?=
 =?us-ascii?Q?pD+Y787vurdqyv5c4lWGtFGA2OaxWCjWJhHYaaUQDfT58bFzmy8o5lqtRQ2P?=
 =?us-ascii?Q?jC+KVx3dpLhLnM6g9Xe3A3edSsxeBpP/4hJN0IEn0Jk9Y2qdGNgqwSW4q1Zh?=
 =?us-ascii?Q?sTD97La3kbi8i4m5mYbe0CUKAkyWvbxDRPN64prHl5Yt30QZym3AUH9doAc5?=
 =?us-ascii?Q?I9a0ypVrGkC4b0SsLLJB2CM6zCC+Z19poU4seaAv8QHBCkD+VxSgkNAqDkPq?=
 =?us-ascii?Q?FvrjmuOS2joqdaswIw0dP6TWCqoQsPuZLOGzb7JG2Sn7k3uEZJj7hMbOLgKs?=
 =?us-ascii?Q?FTusCpMtpNtFTClcIY5fT2JOPC3fF70QMmO471cH9PkcNaD7X47g0dFTFIqR?=
 =?us-ascii?Q?DV+StHbVL1L5W/a36j75NP8Zu95quZZTu6VpnPwPQJ+XbXhkhnAt0zTJvMel?=
 =?us-ascii?Q?L6v2fnTmff/KnJYzRAmqTRAxMFfosF+unpd0spAxPDiorof6Z2umCOBzkILk?=
 =?us-ascii?Q?EVBihN+AEK5gQvpNoIz1CKImfafrNzIQk6Zym76BKY0CdAAW0F75yMe6vRbp?=
 =?us-ascii?Q?OxD151F9IYWWBj+qnkVxCWYJLnpCNXqYddXsi/DbXPkrbteQwPWqRkH02uqD?=
 =?us-ascii?Q?GP9yomR6SZuqhQWEAY+ag1Nhp4ieUSVt375beRn/5klgkJdCdg3wqMg+FEVH?=
 =?us-ascii?Q?oZnq668YPKbog58LnjX17drEuFQKbtUmdIqyMtS2K77Y71bCmPdtXRDFOjqI?=
 =?us-ascii?Q?Mti7tSduBV9UKeH90wjTquzBKlDLYLKwm2eXs9MrouB87w7rAGzb8jj2+9q/?=
 =?us-ascii?Q?nYrWlc1wgbTUl6J74vzf0BIF60w8m+Ztd/kZfIJCVn8FPTcX1U4YkoP+dwjT?=
 =?us-ascii?Q?nivMnB9vAGz/iy1i6DD5HJbP/E9LPBHhRmkq7/dQaJMOuWxO2eM4Yhlmi8VP?=
 =?us-ascii?Q?TCn43DkzI6elT4p6mt1qd35q7gDJr//vXdqqTtbmFP4dRsWL15EN6jSW1Vuj?=
 =?us-ascii?Q?jSPBQRHGnm0t4OBopaKBP/c7faD2SjqdcWZQXQDTbwuWgMt+tOgJVI9BIRQY?=
 =?us-ascii?Q?tYcKD8vOcjAz3586bTQkWz+0DLWe4HcomMum+wtoI8hWX++9AG/FrgVNrDWy?=
 =?us-ascii?Q?6HFkSW6iBZ7iPEFy57ApyKUBNRdsPA+QLQd2wwXJd3gAFOGXgHc9Ac5+8uv6?=
 =?us-ascii?Q?8VRZ33EtL3RU96NmZbKp19up3f0+mDKZIwDX572jlvx/6DUUWDEUuonMd84N?=
 =?us-ascii?Q?46me0wSlYpuVPPC9CP4VlQ7Ex82EEr3oLadHNIkQjr8Yypr1ntDi3x0cDUZ5?=
 =?us-ascii?Q?UDXkeoMGT21qGdlZ9PLuMKhNkoNsTqYEHIJI0XVd4ItqU4e9ALJ+rsPnfiCP?=
 =?us-ascii?Q?FF2AUlfr1qQYWD3IZJDUNshJTHCmwBbiIn05V3ZIf0ywej4fZhZTel5ir/SD?=
 =?us-ascii?Q?nNfwQuPt4GFE15AEtIFbsGy4UfKHsOaA4hOkc1EaT6N6dnA/xqgxYJuHLo2C?=
 =?us-ascii?Q?9QwbJchIS2l7H7SAOmMyZ/HU8mcg4e7ZIAbVyir54MT6jaM28LTuYsHgdX0r?=
 =?us-ascii?Q?E3xZIyOmtXD+UlBn1NelJBCGetj1Ne22+0Y7J+l7DjTOHyKgRhTTp3YGxyFl?=
 =?us-ascii?Q?1wFxJUsdKvtXqaLPT6wLTBQ/g+SenAfpe0QJV6aJBYnFb55yKmpTXv8pOVzb?=
 =?us-ascii?Q?KO4ReDrelw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: be89170a-213a-4ead-0643-08df30f8f542
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 11:29:53.5992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IhsMDPtCHeBLfXJu33Z9mLLfBpwZhHWKip615PZJ9M5hdVXOuJ/f0UfTdnBFShNhyWvDAap+cdIiJA9BLMZBP1azeh+dKszvzxKNiLJboUI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB2091
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 11:30:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248543
Content-Type: text/plain; charset="utf-8"

NEWS: https://github.com/gregkh/usbutils/blob/v020/NEWS

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/recipes-bsp/usbutils/{usbutils_019.bb =3D> usbutils_020.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/usbutils/{usbutils_019.bb =3D> usbutils_020.bb} (9=
4%)

diff --git a/meta/recipes-bsp/usbutils/usbutils_019.bb b/meta/recipes-bsp/u=
sbutils/usbutils_020.bb
similarity index 94%
rename from meta/recipes-bsp/usbutils/usbutils_019.bb
rename to meta/recipes-bsp/usbutils/usbutils_020.bb
index 164445ac4e0..7ec808d5a2a 100644
--- a/meta/recipes-bsp/usbutils/usbutils_019.bb
+++ b/meta/recipes-bsp/usbutils/usbutils_020.bb
@@ -15,7 +15,7 @@ DEPENDS =3D "libusb1 virtual/libiconv udev"
=20
 SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/usb/usbutils/usbutils-${PV}.t=
ar.gz \
           "
-SRC_URI[sha256sum] =3D "347c52b65a6aeb22cfe3af8382192004f99725850e1dc5f705=
336e54cf6d59fc"
+SRC_URI[sha256sum] =3D "fed292b2a3dce83464ce9e96e7eaf301f58b3bf0104872b6a7=
5edac14c907ff2"
=20
 inherit meson pkgconfig update-alternatives
=20
