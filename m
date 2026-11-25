Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.37])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40743.1795609604067667644
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 04:26:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=XiB9TibD;
 spf=pass (domain: est.tech, ip: 40.107.162.37, mailfrom: anders.heimer@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RS+Nz2s8h9RNDH3pDIh2QbFvOwypxLuPFiPLHGCvKJ9arZs4buntWKb6g4zigamW6IMGUCbgf+pYtbw4mMRXUgChSGWHK1vC+vD+xRlSWK5ZDLItY7vOoj1WA8zTE0Bp32zyd7KV+RJzdNKLfGhL8TpYSt15jgooHAh79+zh+bOG10FFt8Dwew9rB6GylHs2ITNEHf/Ybt3733BzDI+2UkeAXWVXTqlJumU0NNhrYZOSy6iAdipfeBwyZYng7nOoFysxDGmRUiLjjjC1I1o/riOYFmpjpKhfzviXD0aSoLKr/XArahPeLRkLe8cR2yaZKqHccQUQuO5iDJetd3Il/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ii3C3swoANXLC0Sfri5zuVN72unkk0RuiktLqkysPo=;
 b=X0j2Zz8gJbTy4Mn+TuQgUi9MMLq84Vdr9dANkCYt605G+ij8PQktfJ9SxxCuGtYp3gg1uIhYAJ3tWrA3kXO3Tf6q6ux9AkbNBgA7Bx8SfEHQEzblxNgMFteBOgpKfgsEpLFGJTJxtLLt/j6phpHby4v8OjAtRNlzgN1T6bzZTpSPgqKRu5a/EbXbJnENh5Ym/2J6JltQsNz5DtSgShX2AgdayYfz1ZuZEFaFnrpBjclx2HFF5gSdMEHgEwExgKTyaGT4ZL94YA2w9fphsGjHqNnxQUcGxAt9p/qO0zJVOoSR9NHbWMitTzRx5UJyyZ4o95o0dI7IRDKFpU1IEB/hRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ii3C3swoANXLC0Sfri5zuVN72unkk0RuiktLqkysPo=;
 b=XiB9TibDhUKtFlk0cBYu9LDW3Aqtz2Uzm1Nz+EYGwT0G4iPFGTHrDwrF0SBCMZ4B1G+XpAYQENBCOqmWnfxgerFpXIPdThdqrT+U14NJa+eEq+ulRzFHwSPDqlKSomzgBJeJADFhlEDPGzGy1/tF3vpEL1jNtuWPVD0FqECw1YFT9n8mr1Z3p3keYnFefLYJXSDGa7TWY2N35LDyaTKpaH+hm6zdzDL8AeDfdTMUOWNeL6w/cc5BEAL7QSK/OqhnvCrDKOHeIzA3fi8GqBer1YCMVEp0roI8/ZSX6dcndI9Ac1oUZKEG27Y5uWL4EjWHwTKLRAr+2G0a6Uz5dAi7vA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PAXP189MB1776.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:138::10)
 by DB9P189MB3598.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:5fc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Wed, 25 Nov
 2026 12:26:38 +0000
Received: from PAXP189MB1776.EURP189.PROD.OUTLOOK.COM
 ([fe80::53aa:751:3d59:b6b7]) by PAXP189MB1776.EURP189.PROD.OUTLOOK.COM
 ([fe80::53aa:751:3d59:b6b7%6]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 12:26:38 +0000
From: Anders Heimer <anders.heimer@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Anders Heimer <anders.heimer@est.tech>,
	Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH] ca-certificates: upgrade 20260816 -> 20261123
Date: Wed, 25 Nov 2026 13:26:34 +0100
Message-ID: <20261125122634.573631-1-anders.heimer@est.tech>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: GV2PEPF00048121.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::1f3) To PAXP189MB1776.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:138::10)
Return-Path: anders.heimer@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXP189MB1776:EE_|DB9P189MB3598:EE_
X-MS-Office365-Filtering-Correlation-Id: a1093721-8d27-4f28-7ff5-08df4aef5a8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|6133799003|18002099003|56012099006|11063799006|260925022911599003|260925021911599003|260925021311599003|261022105027099003|261028144727099003|261026121527099003|261026140227099003|261021123027099003|261021121427099003|261009223027099003|261102123227099003|10067099003;
X-Microsoft-Antispam-Message-Info: gbAIigdxCQ/UmUX/i5hQLGPwABapM0o2yLGrbCOWlZ2ajIdaGZ7F1ucUGhrc98GVqwJb3cuIM3zpwJCwwwfeangqZk2Ei3HGAxf1X1KGsxu0JID/FokSCAa4WCcRXe+1wLlqfWxf3g7kNZUKiMQObs7fpms2l3KAXp5qqpGTaeS90C8qqIj8/BnWCQ/Soq7slUZCGE+rz6r3YJI97DpqZ70C94mVsozwZbXAMM453/5wyc0UXZ1N5bcG6GkAuKcrsAFhtz0vJOgtIL4jtaUfO/+6R1rB9IPDK0exGSVZfOrEKPfrI/HRFApd5P6A7x6RB0/F+ESoylUi/dt80l1gj5zRqpBbeCC5u/VnfCarRdZuYBDiDS3TKrd6Kvv+k4biaxxYbQ6WSRTOfS4gZTvCKc2TaZ/x2fjz0l4kWe1eMvL85tzSBpd50g29JNhqjP+HXJyr4MX/ABVbArHZ98mMQ0XHFQgEEePd/HlEHlB3C31Fx5KHlweh9ZP3cwrCtZEsdA8+H+2BHmp250au2xdVglC/8tKoiYx0F7PxipcAS/XoCjUiCIuaUCPTKSHgn/k6l+v8AZGbzVR7dqEwx/xJBo+NztFRGvSNowUzVtUQUms=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXP189MB1776.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(6133799003)(18002099003)(56012099006)(11063799006)(260925022911599003)(260925021911599003)(260925021311599003)(261022105027099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aWkzELd/anEPVVQQ10Mq0GvQfJO3ReGozbnVY+RGD/CUMzTy6mvnLBw01AMp?=
 =?us-ascii?Q?wDNZeU1m9sdWIa+X8tKGtEuU8Ws3PGNUvzf11ao7xFbmVnPk86D7qPv+09dE?=
 =?us-ascii?Q?AmEprNiVTgkU3c7Qy3nfCA0wAEFNMb2YUtYfX0hlT/f6ZRzpgzQA5opSO4d2?=
 =?us-ascii?Q?x0bXfsCKZc7FvK14C2cBTYpMM5mQOF4n5HXoEBrNGBJRCzxUjGSUr9lh1z7f?=
 =?us-ascii?Q?KNRnZ1tKm5Z/n4HpJxSWFFCoVsIDurpRv3Ky3Z60+WP/y3Ng28+t2Ab0C9B4?=
 =?us-ascii?Q?Gj2zVuxI/BkQPb6SDWKnYVLitdBvzDAy5kpac9RESoFTs3W5/OR7E7aJ+fJp?=
 =?us-ascii?Q?caIU1Jtv0AbbAq5MUszerva1gjDj7dxuHVlxo5OCKP6ndMy1pOw3sls5WFy1?=
 =?us-ascii?Q?Z+pp4w8YDpKjHj+Ynfv7JVLEfj2GqEswRsXIlDTQ7HN5T/e+MOZZI07WhHOz?=
 =?us-ascii?Q?LJ8l1dKHG0yV/PrbHXOK4meeHOfM/m+xy9we9BaLP1HdpBHTvIH58eHZkXbt?=
 =?us-ascii?Q?CIoAuOZ6ZWMilbyx2u1va6b0Z2fY5Ob4XwAR+LctB33FArZhEVsTSGjZuXP2?=
 =?us-ascii?Q?HjHQYKm01MODW85dFW9uUBYw/NmHl/XgPTLpgA2KHGBdgebUi2Jqm/Y0e8Z9?=
 =?us-ascii?Q?N7J/xI8oLjfcVG2jUA5WyeoCnOe21JyadFdXlW8mMCR8KTXy3dKsw5gYns1Z?=
 =?us-ascii?Q?uphds9cvl8vBPeknK+zGrjIfANLc3ngtdV8b1jMEHUotN1izAy9tU8jl7GZ2?=
 =?us-ascii?Q?lZyyc0FCaNWckaDKyOb8EJIC+r3DUE5zfOTfK822iLwewlYpiC9fhOALRPcW?=
 =?us-ascii?Q?o6YUo1w0dTkovcn2qpwnfObPH6xzstr0jfW/UtBkVSggpQVgFoaACekR04cl?=
 =?us-ascii?Q?56jl20LV+RvvvK839TkCclJZGiRsRFSP0ws+6nRi9sukC4FPK8usQpe0Uivc?=
 =?us-ascii?Q?4CFEb1fOLIM0xIpaNaPE/Gy4f7viZqaK1atpucMHADP1oRMYVYO/a+U5BptI?=
 =?us-ascii?Q?Lnw3TPkGBrl8/QFDydQY0ecifSjI83StjCopwuD6dI9KvMZgB6ETP7vxqHc1?=
 =?us-ascii?Q?EQBChEq0lE5nWAwNNBct1kB9OJJJsL5yRvzMHbFYJCXrk6o4FS8sQrlXHNs3?=
 =?us-ascii?Q?6pXFbagke1W6wReUwULV8i/mN7ux/TXyxfo0KimzpT4c/841iI7i3og2/9bo?=
 =?us-ascii?Q?HcuWW+Xcpl2Z/dJJdobFe58NT8yq3hpeHLMGbvhAqGEXxUJmL30NtVNLRyBQ?=
 =?us-ascii?Q?Nv2U+89J10Hp9JqR3PjpEbNm12zQ7EfPOjwUjLhA8jrZ8v1R8Qk+ecf60XUe?=
 =?us-ascii?Q?sKnI1tJuL7hhg6ZsFhsGSZgcA/leLGKogVoJEyx8PxDtV+B/MTgg/0UvGlJx?=
 =?us-ascii?Q?4d+lcwrtnloD3nKQ5lKhotY+Ln2jfJv3PfNn6Ib4VqRurNx9V3q5tuUdBJY7?=
 =?us-ascii?Q?ExTLnwMsIxvKAY0z+d34A2JHZHydLbf1omQP5M9WgjdKOjkXFfufwU1A5+uB?=
 =?us-ascii?Q?yfeGwi5jC2BodPEyLXbe1eu0MehTLbKtpJrxqDHt3qF4jiSTiHwU9G+vnTBS?=
 =?us-ascii?Q?2G8336tsoaBHYJWHFuXjIGR2lBTItazexr5zeqgOuEAODdmQEGmygwcCAgre?=
 =?us-ascii?Q?TskDBsF9Npf6oLbItlmvVExwnEepkx4A293JBR2YhP6NoAvf2W/8jkm+fecZ?=
 =?us-ascii?Q?NpSkg1rb1+wpPR6Je85jopVqingghm7CILeyQkMs4C06ins96hEviqx5Jxxp?=
 =?us-ascii?Q?ww88VOr4aA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: a1093721-8d27-4f28-7ff5-08df4aef5a8a
X-MS-Exchange-CrossTenant-AuthSource: PAXP189MB1776.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 12:26:38.7767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s1gYM+scA+i4Q8gz+ZXa/qeY/9FZeoOWcKUI97FjQWRhsv97+N3m0fwcS5TxfW1Wi1mgj9+M5nmH8Ob8SCWVNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P189MB3598
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 12:26:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251181
Content-Type: text/plain; charset="utf-8"

Source: debian/changelog
https://metadata.ftp-master.debian.org/changelogs/main/c/ca-certificates/ca=
-certificates_20261123_changelog

ca-certificates (20261123) unstable; urgency=3Dmedium

* Update Mozilla certificate authority bundle to version 2.92
  The following certificate authorities were removed (-):
  - "emSign Root CA - C1"
  - "emSign ECC Root CA - C3"
  - "emSign ECC Root CA - G3"
* Remove "emSign ECC Root CA - G3" and "Comodo AAA Services root" from
  the blacklist, they're no longer part of the Mozilla bundle.

Drop the eMudhra blacklist backport. Mozilla removed emSign ECC Root CA - G=
3
and Comodo AAA was removed in 20260223.

Compared the package contents with the patched 20260816 build. The only cha=
nges
were the removal of the emSign C1 and C3 certificate files and their entrie=
s in
/etc/ca-certificates.conf.

Reviewed-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Anders Heimer <anders.heimer@est.tech>
---
 ...-ECC-Root-CA-G3-and-Comodo-AAA-Servi.patch | 35 -------------------
 ...ertdata2pem.py-print-a-warning-for-e.patch |  6 ++--
 ...icates-don-t-use-Debianisms-in-run-p.patch |  2 +-
 ...icates-use-relative-symlinks-from-ET.patch |  2 +-
 ...0260816.bb =3D> ca-certificates_20261123.bb} |  3 +-
 5 files changed, 6 insertions(+), 42 deletions(-)
 delete mode 100644 meta/recipes-support/ca-certificates/ca-certificates/00=
01-Blacklist-emSign-ECC-Root-CA-G3-and-Comodo-AAA-Servi.patch
 rename meta/recipes-support/ca-certificates/{ca-certificates_20260816.bb =
=3D> ca-certificates_20261123.bb} (94%)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates/0001-Blac=
klist-emSign-ECC-Root-CA-G3-and-Comodo-AAA-Servi.patch b/meta/recipes-suppo=
rt/ca-certificates/ca-certificates/0001-Blacklist-emSign-ECC-Root-CA-G3-and=
-Comodo-AAA-Servi.patch
deleted file mode 100644
index 9a0258919a..0000000000
--- a/meta/recipes-support/ca-certificates/ca-certificates/0001-Blacklist-e=
mSign-ECC-Root-CA-G3-and-Comodo-AAA-Servi.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From d5e08f63b1ca6746a51e62cda4df5483c0d3e2ec Mon Sep 17 00:00:00 2001
-From: Paul Barker <paul@pbarker.dev>
-Date: Wed, 21 Oct 2026 07:16:23 +0100
-Subject: [PATCH] Blacklist "emSign ECC Root CA - G3" and "Comodo AAA Servi=
ces
- root"
-
-[PB: Backported to address the eMudhra Intermediate CA Compromise
-     disclosed at https://emudhra.we-have-a-problem.com. As this is a
-     certificate authority compromise rather than a software flaw it
-     doesn't have a CVE number, but this should be treated like a CVE
-     fix.]
-
-Upstream-Status: Backport [https://salsa.debian.org/debian/ca-certificates=
/-/commit/4a0203e5ce4ce1a064b97387f52ca6a00c97185c]
-Signed-off-by: Paul Barker <paul@pbarker.dev>
----
- mozilla/blacklist.txt | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/mozilla/blacklist.txt b/mozilla/blacklist.txt
-index d84ceb919906..ba3635f7af87 100644
---- a/mozilla/blacklist.txt
-+++ b/mozilla/blacklist.txt
-@@ -3,4 +3,9 @@
- # Blacklist explicitly distrusted certificates to explicitly ignore them =
and prevent build errors
- "Explicitly Distrust DigiNotar Root CA"
-=20
-+# Blacklist "emSign ECC Root CA - G3" (cf. #1151413)
-+"emSign ECC Root CA - G3"
-+# Blacklist "Comodo AAA Services root" (cf. #1151413)
-+"Comodo AAA Services root"
-+
- # Expired CAs
---=20
-2.43.0
-
diff --git a/meta/recipes-support/ca-certificates/ca-certificates/0001-Reve=
rt-mozilla-certdata2pem.py-print-a-warning-for-e.patch b/meta/recipes-suppo=
rt/ca-certificates/ca-certificates/0001-Revert-mozilla-certdata2pem.py-prin=
t-a-warning-for-e.patch
index 001b468624..d57ee31638 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates/0001-Revert-mozi=
lla-certdata2pem.py-print-a-warning-for-e.patch
+++ b/meta/recipes-support/ca-certificates/ca-certificates/0001-Revert-mozi=
lla-certdata2pem.py-print-a-warning-for-e.patch
@@ -1,4 +1,4 @@
-From 8ea56b7d5eadb04309dc3cf1e6b0d94d1d053d80 Mon Sep 17 00:00:00 2001
+From 302f1ac1dae928b29cda3821d333c38972c32ee6 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Mon, 18 Oct 2021 12:05:49 +0200
 Subject: [PATCH] Revert "mozilla/certdata2pem.py: print a warning for expi=
red
@@ -16,10 +16,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  3 files changed, 1 insertion(+), 13 deletions(-)
=20
 diff --git a/debian/changelog b/debian/changelog
-index 7ad495f..058ef5e 100644
+index 8a2a6c6..7ae60fb 100644
 --- a/debian/changelog
 +++ b/debian/changelog
-@@ -234,7 +234,6 @@ ca-certificates (20211004) unstable; urgency=3Dlow
+@@ -254,7 +254,6 @@ ca-certificates (20211004) unstable; urgency=3Dlow
      - "Trustis FPS Root CA"
      - "Staat der Nederlanden Root CA - G3"
    * Blacklist expired root certificate "DST Root CA X3" (closes: #995432)
diff --git a/meta/recipes-support/ca-certificates/ca-certificates/0001-upda=
te-ca-certificates-don-t-use-Debianisms-in-run-p.patch b/meta/recipes-suppo=
rt/ca-certificates/ca-certificates/0001-update-ca-certificates-don-t-use-De=
bianisms-in-run-p.patch
index dcfa355411..23335fbf59 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-c=
ertificates-don-t-use-Debianisms-in-run-p.patch
+++ b/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-c=
ertificates-don-t-use-Debianisms-in-run-p.patch
@@ -1,4 +1,4 @@
-From bab2e13b69af12c1864cccf371ebc4ef57a6fec2 Mon Sep 17 00:00:00 2001
+From c8d73c5ebc095a9f5d06d841461dc1701d0cf4c5 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Mon, 6 Jul 2015 15:19:41 +0100
 Subject: [PATCH] ca-certificates: remove Debianism in run-parts invocation
diff --git a/meta/recipes-support/ca-certificates/ca-certificates/0003-upda=
te-ca-certificates-use-relative-symlinks-from-ET.patch b/meta/recipes-suppo=
rt/ca-certificates/ca-certificates/0003-update-ca-certificates-use-relative=
-symlinks-from-ET.patch
index 4d97c81b0d..63b4799408 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates/0003-update-ca-c=
ertificates-use-relative-symlinks-from-ET.patch
+++ b/meta/recipes-support/ca-certificates/ca-certificates/0003-update-ca-c=
ertificates-use-relative-symlinks-from-ET.patch
@@ -1,4 +1,4 @@
-From 8a5b4e2dd1479de0338db7a7234d037ef0f71c2f Mon Sep 17 00:00:00 2001
+From 33d2d57bf0a7087ae014f99f53b930cbdcee3cd0 Mon Sep 17 00:00:00 2001
 From: =3D?UTF-8?q?Andr=3DC3=3DA9=3D20Draszik?=3D <andre.draszik@jci.com>
 Date: Wed, 28 Mar 2018 16:45:05 +0100
 Subject: [PATCH] update-ca-certificates: use relative symlinks from
diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20260816.=
bb b/meta/recipes-support/ca-certificates/ca-certificates_20261123.bb
similarity index 94%
rename from meta/recipes-support/ca-certificates/ca-certificates_20260816.b=
b
rename to meta/recipes-support/ca-certificates/ca-certificates_20261123.bb
index be1ffeae4f..fbbc504274 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20260816.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20261123.bb
@@ -14,12 +14,11 @@ DEPENDS:class-nativesdk =3D "openssl-native"
 # Need rehash from openssl and run-parts from debianutils
 PACKAGE_WRITE_DEPS +=3D "openssl-native debianutils-native"
=20
-SRC_URI[sha256sum] =3D "d939bcdd0cb058712cf4175bac76997676eb8b68fe9473765e=
1b40fb3d5b186a"
+SRC_URI[sha256sum] =3D "ca7c16b757f342d34248874edf40e15a85d6dcf221b7e2ef2f=
e026e4fa4c6a51"
 SRC_URI =3D "${DEBIAN_MIRROR}/main/c/ca-certificates/${BPN}_${PV}.tar.xz \
            file://0001-update-ca-certificates-don-t-use-Debianisms-in-run-=
p.patch \
            file://0003-update-ca-certificates-use-relative-symlinks-from-E=
T.patch \
            file://0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-=
e.patch \
-           file://0001-Blacklist-emSign-ECC-Root-CA-G3-and-Comodo-AAA-Serv=
i.patch \
            "
 S =3D "${UNPACKDIR}/ca-certificates"
 inherit allarch
