Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.14])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15192.1795097632484852770
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 06:13:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=SoC9Hspb;
 spf=pass (domain: est.tech, ip: 52.101.66.14, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kASV8kf5yGmpM3vA/XdpZ6NWlhg+GT5AGoD52Q4VO8q5MH14u4nbLDhG0XlWmY0cyt1hecCLwG0ia6TWPEmziHFxAvy1Du5ZM5Ivdh7xzdQjxtGI75ILphvaBrtJJOYIVXIrvGPEfK/hQ4Mt17jZ8aV5BVLY51G2dBL3Gx37n2XlV8rZv3f2LmDL9761JCOVm0wdY6SeW3diiIbY59HkeatqnHSshVtWZbLS1IvGT89VaejUG9zMpSYBarDhr0PzJkv2gT6HADw4ETv9Pr8n24Z2t+fy5pZineAANfxObl2AWOyBCqT4vIv8NLaAyyvxPiEZ5qvNmMfAsAlmMlTHsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LelJRJ8xMFiCII5/nfTDevlJB+tORZKDUaq13LGtgFE=;
 b=xRmNHvQmpBRpnmX+sKepo0j28ShY6UTKMSiNyrN6hm0HRUkQWzY1ZiamEVjUPJKEAmq6vq1yI/4HFYzXTfQ+cE/f3WGdNsif/85P3V3XmOQow/8SKGgKn3QlFvpFpx9w6ImW64sUzP8P0Rm3J/F2py4Q4Yqb0E8NRvbJyVNUxWlfM10uhCVfRS6Wz5KpM250hNXMIJ3HOrs+pfLGCjJDjNYbypTeW8s4302CpdGHHnuv9wCOsMGDeA/ORdglOSZVm0iP46YF8djw9rsa9dbYr0R+mP2rqah6Dlnvvo5yT71UYWZnxXwu++NgNut3KAkfwoCG9ZKMAUZNKrAmaKTN/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LelJRJ8xMFiCII5/nfTDevlJB+tORZKDUaq13LGtgFE=;
 b=SoC9Hspbt3GZed163VbN6VQ1mdrFcUkdY6e4DPtad7IzY/FSndQGMXrL8/c0ZplLRc4K58wDuCFVN+pL6b+81nbto8KH8XxZjrA7HsLM0JZU+9dDB5MEV0D8LMPczRQyzrP2sn2RwcL4/M8jcB2SbAvZfOb3BO6BwmGe1a31an8rycdtXAh4hCO3paCq3ykdDjA6E8EiQ5e0ic05WUI25EKFD6CQnyhbVFApsGQ8MywBxbqucC3LvDCcR5hkNQpHp1148NbivIonYszDHM8v7gayyBx4mdbhdT3zQrQOqUVQDo9un/rlmuvmK++bp4fV8D9CBKsM5+SWv5XE6rHKuw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by GV1P189MB2785.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:1ee::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 14:13:46 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 14:13:46 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/7] dnf: Do not hardcode /etc bash completion directory
Date: Thu, 19 Nov 2026 15:13:33 +0100
Message-ID: <20261119141333.34492-8-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261119141333.34492-1-jaipaul.cheernam@est.tech>
References: <20261119141333.34492-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P265CA0089.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::6) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|GV1P189MB2785:EE_
X-MS-Office365-Filtering-Correlation-Id: 3664eda0-9569-4c15-707e-08df46475380
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|6133799003|261009223027099003|11063799006|56012099006|261102123227099003|261026121527099003|261026140227099003|261021121427099003|261022105027099003|261028144727099003|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info: YwLxYExNrdAUjyfoWSzO7UkXsNLRkMHjqXNA5J6cJHjTiFxgSaMK3borJJ12qHcRqkDrvtupLVm2Js6ftCQzhszvaXg3q1a4B9vwlZd1PePRZZr7N2MBuNLuLpG3diaLOSx26RtmzPCqgF7qrNCi5NIkD3PaJkKx4lr+EuJEq+LR3IaFDxz7Yjn6//KlsEeE487kmslA00vqFRrkftay1AMCIl92ZfN5c2H0BN2UR43PHW7mNYz8g4IT5GRFEWlY7KSnbbfVBcuYvHBmQ/SB6ww3EDNpHsKXX1bkTYN7x4PmvoWZXLF91H6B5ddkaKstTM770WNy+kYzv5+WfySQ5XCJ4laqI51u5190dncmGH7PbLDj8TY5uT6LJ7GlQIrmGQSzeIUbu8vdrAWldFA2cLsfomWZHA+lenXtudhSRwg1RnyE7zFcAK/MSXPose2uWmo3FGDzncHQCdg0tIkWDsuoiH9MrDXUVS2m1uv5GB6Q7dI8+BxA4fUPY20wwlZn6ku5mmrwXkhgRyz5H3jREpaXgct6zvjcOPQEk5V8+GU4oKSekl/uH+8i6D34+SPix4FBMR1UWsCJYT+jb+AFNKhDWpPzCFv0Fv9OxafH9ro1RrGqiSIWANYZkyePzqM5faH/wCitXsfi9pM0n9J2bqhQ4Y20dq+ARfbf9f62wPk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(6133799003)(261009223027099003)(11063799006)(56012099006)(261102123227099003)(261026121527099003)(261026140227099003)(261021121427099003)(261022105027099003)(261028144727099003)(261021123027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r+qEb1e7m2LeSuIHM9isay9N6dgnwJNST99pi6gK1WX9tr03Yhf9KIKC9cCm?=
 =?us-ascii?Q?9QTLOQ3EXgOFOXrQKZm0W7HyqO+7ZqMbk7l8xucg+a3x6tD/z7Iouo5GviHu?=
 =?us-ascii?Q?g4Prxv1guyUezptSEuOQR5D4J9tBmqPXAVSttKQIzLhnH/2KotUjWQYo8ziE?=
 =?us-ascii?Q?Fhhk8em3hnfKeGFA0UAYRDcDChA1y2erqyNdx9gu842vB82uvCBm6BLuuBC3?=
 =?us-ascii?Q?GbozT04AS0KabI/fhkXhVRkvLb0EKfm8g4bHWfZI56kZp8bMqUyiSDPL3t+p?=
 =?us-ascii?Q?3dYsqrkBAzZYTQjq/3ytsfHMysmjmJFSUnSvLI2zgdRNkB5CRpjbqeI0uRnF?=
 =?us-ascii?Q?HiiAP5Z2jWl69HxlcyOrouDvHSrvO+S5c/qggtTQ758hs+2aDZ+P0ifWu0tp?=
 =?us-ascii?Q?t7BZvXR+c7SUIxehb5BtQLlgzEZcws0aUBOG+uvWVBfnx8MWuj2td5gG++My?=
 =?us-ascii?Q?WBpSvetQDzEwlJzEAHhR/AHfa3Yk+WBiIOwz/4Y1A+sgUyU2ioTsLVctHwOB?=
 =?us-ascii?Q?21HDi9R+7uSd9mD0fCtkG/N/C8qF+UJ1XqV1mB4mc4a6iBleWnhJCTmHiT+R?=
 =?us-ascii?Q?Cizhmq+DPOl9K+hRr9Ofvw44UYeGCGQ+6XzaKziwJnQTaEO5qLVcPFr7Qgvf?=
 =?us-ascii?Q?iR4RUa2g5+tQ/hRqp0L9ssDIn2W2Z5jfWG95/df/Oz8OSo01hRL61jH90pak?=
 =?us-ascii?Q?nu+AX3lpNQeg+f5M5O3o+qhLrcRfXLRurn2pSTzlQx1bO/xFDtSE0jrCPBGH?=
 =?us-ascii?Q?NvnJ5SY9oWjpkA+Pr/r/2NQSsIpEgY5unT6EWr0xQ9WolGL0JqnZxj5ZADKk?=
 =?us-ascii?Q?YFQDSHqes7Yc48OWIy/IuSxqzZ5tta2KhU0Y8JlLEJIJ0tgnI41Uq6PFgO9e?=
 =?us-ascii?Q?oIPQedsJZq58js7doA28sXMnAE5GfSo0bKaS1+jKzXWKVUaa9xw9HfgImkgj?=
 =?us-ascii?Q?5mkPU47DtEN6H7hJ9lK9eLsZxD6+UtpUn8uPvHIbj1H8bD2Sol6+Q9257qMQ?=
 =?us-ascii?Q?gLIo0Ooa9Em95VYZTLe7D/Dmd53GEfFplYMYCXO0qvqch4NtiSfVb2/4hX8b?=
 =?us-ascii?Q?IhdVgYhqHbUHYyDimYtU56EL8m0oo2OBv8wkPPuCxLi7XTGWGsmloJufZdUa?=
 =?us-ascii?Q?UmMrvtcrkG9g6sJtxT+KTG9c+t7TjQIliBoKvrYTuzydbh4wUbCHIs1halmU?=
 =?us-ascii?Q?lxgEOfROFW+xPd4oO5GvJ9++WDmpWFmq7xReNpwGhhAzgK79drX0xJWJPvu8?=
 =?us-ascii?Q?6TU95JxeUbo5wroKjsWpeND4ekMAB5JAHx/HsrvngcCy8d76IZTL4Q00K1YP?=
 =?us-ascii?Q?d/r+iMHgFNXjr5onpGmOWmuBNaHUAz5Nix2XFn9KIlo2q6OzQ7njE4EbiCV+?=
 =?us-ascii?Q?ZyLbI3I183wsnWmwn+WEPAtvpr5YFYZyxV1VDlrNMEXLM6sXO/Hp4J3sLY7x?=
 =?us-ascii?Q?4/CMRYJmnDwUlMoFhpj/dmOgGnYHz1mtyIkyg2GlYMDDlz8G+YtL3z6NsAmL?=
 =?us-ascii?Q?W4kTj0xxJzIkrdKrpWqqeULnILulsx17U/XgSPIVcsuepoP5v/UcwWTKspl1?=
 =?us-ascii?Q?f+Ob0h833Q9pIfzXRTTpHxUzDwUsqEo0hwLKjhanvWuDD9BmXK6Kkqop2fXJ?=
 =?us-ascii?Q?2H/Ff5+q3oYINzvDTbihU5EG2bw1xJf0atlU0MrKqF1BMKlWc6XC+QpHLcLs?=
 =?us-ascii?Q?f1CAoRGd3AVZsu2vLUDTdm4QKxbJnDMdX+yvJbyrswUhCPGFuPdU8KvKaEnM?=
 =?us-ascii?Q?3xJCEe5gAw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 3664eda0-9569-4c15-707e-08df46475380
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 14:13:46.8924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vLXCw/Nc/VoQKAOzRoeWO07uIeMznz95o1HBzZ1uLJbiWf/xlLTPrwU5dnRRxwjx6ql0CS/OSf/qWHqy/CgRTvpo6SgQWn0p9GTEyJScoIA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB2785
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 14:13:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250679
Content-Type: text/plain; charset="utf-8"

This issue occurs when building nativesdk-dnf.

ERROR: nativesdk-dnf-5.4.8.0-r0 do_package: QA Issue: nativesdk-dnf: Files/=
directories were installed but not shipped in any package:
  /etc
  /etc/bash_completion.d
  /etc/bash_completion.d/dnf5
Please set FILES such that these items are packaged. Alternatively if they =
are unneeded, avoid installing them or delete them within do_install.
nativesdk-dnf: 3 installed and not shipped files. [installed-vs-shipped]

Fix same as dnf4's 0001-Do-not-hardcode-etc-and-systemd-unit-directories.pa=
tch

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...rdcode-etc-bash-completion-directory.patch | 27 +++++++++++++++++++
 meta/recipes-devtools/dnf/dnf_5.4.8.0.bb      |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-=
bash-completion-directory.patch

diff --git a/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-bash-co=
mpletion-directory.patch b/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardco=
de-etc-bash-completion-directory.patch
new file mode 100644
index 00000000000..51c8d412e3c
--- /dev/null
+++ b/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-bash-completio=
n-directory.patch
@@ -0,0 +1,27 @@
+From d5083de53bb01834eaac134a62b836d5cc7843e9 Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Thu, 19 Nov 2026 13:07:24 +0000
+Subject: [PATCH] Do not hardcode /etc bash completion directory
+
+Same as dnf4's 0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch=
,
+dropped in the dnf5 upgrade.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ dnf5/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/dnf5/CMakeLists.txt b/dnf5/CMakeLists.txt
+index 8fcf59cf..4b79938b 100644
+--- a/dnf5/CMakeLists.txt
++++ b/dnf5/CMakeLists.txt
+@@ -60,7 +60,7 @@ find_package(bash-completion)
+ if(BASH_COMPLETION_FOUND)
+   message(STATUS "Using bash completion dir ${BASH_COMPLETION_COMPLETIONS=
DIR}")
+ else()
+-  set (BASH_COMPLETION_COMPLETIONSDIR "/etc/bash_completion.d")
++  set (BASH_COMPLETION_COMPLETIONSDIR "${CMAKE_INSTALL_FULL_SYSCONFDIR}/b=
ash_completion.d")
+   message (STATUS "Using fallback bash completion dir ${BASH_COMPLETION_C=
OMPLETIONSDIR}")
+ endif()
+=20
diff --git a/meta/recipes-devtools/dnf/dnf_5.4.8.0.bb b/meta/recipes-devtoo=
ls/dnf/dnf_5.4.8.0.bb
index 2373114cd3f..f2107016e4e 100644
--- a/meta/recipes-devtools/dnf/dnf_5.4.8.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_5.4.8.0.bb
@@ -37,6 +37,7 @@ SRC_URI =3D "\
     file://0003-Do-not-hardcode-system_cachedir.patch \
     file://0004-add-support-for-gcc-12-and-below.patch \
     file://0005-libdnf-fix-arm-arch-mapping-issues-for-qemuarmv5.patch \
+    file://0001-Do-not-hardcode-etc-bash-completion-directory.patch \
 "
 SRC_URI:append:class-native =3D " file://0001-Do-not-hardcode-the-systemd-=
unit-directory.patch"
 SRCREV =3D "01329a46d840894d9fac207f06ed5bc37e752612"
