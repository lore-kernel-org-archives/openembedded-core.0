Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.75])
 by mx.groups.io with SMTP id smtpd.web11.25015.1615140947906498315
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Mar 2021 10:15:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=QHepY+Cj;
 spf=pass (domain: kpit.com, ip: 40.107.139.75, mailfrom: saloni.jain@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XFmP7tABeEvPQFwI10H46v9UeXEabDxfBh/vV2KGYpIdSKXbyrjAImUOhbY30UNxnPh4XMJ+DPEJDpgGZs6qYq9aS0SOk+khOQicKukcyn1Py/u6YtBZJj0QBI79PdMDHBWvOwTaHZAN5Fy9AjQFDIIEiOaM42IPMBYNgVk3UZJlV0V10QX1F/HRTk23ft7yNpa596sZc3R5x7j9p4B+fE7/b2EQqGfGeNEP+ydcsNL1mLjir4LRjGp2DNy1I8+IfbQzNC20jGSAe/XAsk4Jc0x2O/Jdg4LrnAygC0nq1pezUV2hxoNyhawnOEicTYOTgEPQRntLzDcFXgcy+z1OQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HTNBia87TWcyeSYziM2MI7AB2ywkhg3Tyvdh5gqFK84=;
 b=gsbY1UY2tRem3XYrlu3D1tQTw/8UTyI0XwRMJugsCjQ6FQibICbrTFmXzxB6TwQ7HJmnTp/6OJ7w6mzIRbSpx8FRMDjVyRmO7PyemADBhsQnFRU0dJ8tBop9mLsX+esuDdArLGgbBWMmjJQwcxEs3VUU0U/QnzP1Ngciu34Rg1RtnFeyRb2Qih081orkCukmHOQGSKTBbh8OOTwL2fftuWH+em8G+xGbyU/7HP/AXQYfuSZuyxNPhz69BR63phcOXl0bIjPqw2MHMX1K4d4QGw9oPMS1vAjHnOln1K6hf3cyWXBSC3nIGX55q4Ibg36ueSXw0i9osNoqKeILGHO5QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HTNBia87TWcyeSYziM2MI7AB2ywkhg3Tyvdh5gqFK84=;
 b=QHepY+CjoT57UqUQ2o7xXcWnIG4Qzb/W+t6wEe79h6YAMFKoFD4dZZo5GR1XrWDdEscbwhI6Df8FGYQ886+YT0vl4wQEjvcw86oRHWoKPwjZRu7FZrsL8TwSfggGmyidq1wDkp08B+Qui4sbBbtGJXsLW0v+85tdGE17uqs0D0Y=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from MA1PR01MB3257.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:72::14)
 by MA1PR01MB2761.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:47::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23; Sun, 7 Mar
 2021 18:15:38 +0000
Received: from MA1PR01MB3257.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::e080:2e6b:8611:6d10]) by MA1PR01MB3257.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::e080:2e6b:8611:6d10%5]) with mapi id 15.20.3890.037; Sun, 7 Mar 2021
 18:15:38 +0000
From: "saloni" <saloni.jain@kpit.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	"Saloni.Jain" <Saloni.Jain@kpit.com>
Subject: [poky][master][PATCH] openssl: whitelisted CVE-2018-12433, CVE-2018-12437, CVE-2018-12438
Date: Sun,  7 Mar 2021 23:45:22 +0530
Message-Id: <20210307181522.27214-1-Saloni.Jain@kpit.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [2409:4043:487:b7f3:58e9:35c:63bb:98bd]
X-ClientProxiedBy: PN2PR01CA0006.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::11) To MA1PR01MB3257.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:72::14)
Return-Path: Saloni.Jain@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2409:4043:487:b7f3:58e9:35c:63bb:98bd) by PN2PR01CA0006.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:25::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Sun, 7 Mar 2021 18:15:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 61baf1da-ea63-41ea-57dc-08d8e1950234
X-MS-TrafficTypeDiagnostic: MA1PR01MB2761:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MA1PR01MB27611392E9E421F5F0A4EB1587949@MA1PR01MB2761.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:843;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Pe8wHL+0YBFlJ9reMImKuRS5pOXpbUPZ535MTlH0XZkrFx8S7ZiqoHKG4ecKZfIjf5yrMFdsilXqtTKIeXmzWfhiYxYEgJHvPnEDLWnFjTvBE10CKxgPK8kaPhsVozuhD/pUTxAf7JlesDsvCoJy65CTKGFO76RbiVnVZ6YVWoGUYCJLK1/gI4LDedIBbyWzd90YZ+5cn1X0KaOhxxEJ4pqlN2b6lZdlI4IGM8EvcRKVEyh2cu0wOs0eLHF6zd2VC9G037WzvuyGbSlNCAYsK2GjhCS8A4Bj4gqiJPrA0Rby5tlMWw6xjCPhjVkXZbEy9EOFmftcNAC1llY8sN5cGZ9j4tEW4Fw2YI04kpO2JCvvr4pl4MaZ+JhVokldP6jvlRd2H7U7XxZ+4aScqUV/uaOBivxwT/HC6sJCIacWcxL1ZhLiHgY47+d4MVzwsfLTPwc/VlL2iBZXY0L/XYs0/HfrafzEBZrTZiFT1FIqCaMLkc34QhMTiSwaolGuIDdJLuUDyyw5ZOfm860T3gL7nxI06AzH+WaWMBzTRM/vgB/MLg2f+aVOjWu8kT0ewAHwr2U8T8NZXrThBcCpMD3SpfdxwpOYm0UM0bjcANkt1tjaNLJThP87wQH2k98xisBcy2XIuo2rZm0FrMLc8zZGfdbnwiXt31xPHhWfZP6MELI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA1PR01MB3257.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(39850400004)(396003)(366004)(136003)(6506007)(83380400001)(6512007)(6486002)(66574015)(69590400012)(8676002)(86362001)(316002)(8936002)(478600001)(2616005)(52116002)(36756003)(4326008)(966005)(66476007)(66556008)(66946007)(1076003)(2906002)(6666004)(107886003)(16526019)(186003)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?p0+smea2MqDP2ksQHDMTB+2jhwmZxL2kSU4RbrN5EzlKYyRfRkV2UBJ3le9m?=
 =?us-ascii?Q?YjDe3s8sH83l5+ZUEUO093Kv7jyFVZFqRSfbRL3m/mulnMMf5Y8lRwm2Xijv?=
 =?us-ascii?Q?Cwl00RfY3oeIXWqI7ooUoUXu8AB1EGrCw3x8QMzfYZJ9CVLZq3UG6O7fwiVV?=
 =?us-ascii?Q?RQYf/87mPRFV2NiUNtHp2pE4vZby4JRucZGgEGc8ZAmzL1YHU8Q0ufT2wsYv?=
 =?us-ascii?Q?daxOm5OhZgGfQRnvGHr067eVd0WWJjahyj8ynViPf8MW7mdX6AGZZn7pjc9R?=
 =?us-ascii?Q?8UtR1tn+7Y8mkHCC7sy73T83apfkQjg5URNKXatVag/J7u1HghVNCypfh69x?=
 =?us-ascii?Q?k6Gpi+rhex2EzNdFtyCipxp7t0zb5jqJj35m8UJjvIAs+53LZN3DTZQgbUkt?=
 =?us-ascii?Q?N1gRCmPOIAarO16JZ4rkgeXkytelfNtIrcFQ/rrIDzqBqFkHhu9udQZ2swYi?=
 =?us-ascii?Q?gczHoOA/QfKytrqCy3o/iTCz2+tKNCVMwevIyHDjXV39VZdZg4Opr2APatHm?=
 =?us-ascii?Q?grgPSIQVws5/QxkkYAh19AhgJ70Jhn97YhLTutcJe7f5s842oacnera0THIA?=
 =?us-ascii?Q?7auGLChcvELu1I45id2Q0ZhWvJEjCxymhqz8oYnsDcv3J2ZPlFqfj34vVDk4?=
 =?us-ascii?Q?9ACe+8qpKf9IDFtWHDgEVbacmB6GZgvVR9KR7/1gq+IgvTDtb4DO/uyK0cop?=
 =?us-ascii?Q?at3yEYV2ENjorB7gDYJOqzfuTKw6YYTfV1HmcJEIBW7EzwXEPqTsel/jm48i?=
 =?us-ascii?Q?7fiKworJRy3/90jf+DE6Ni9VsWJvd3tMbqkXid/yx40U9i1x1Ea9UkE7LHqa?=
 =?us-ascii?Q?01PvJOXpVgS4Iiw6LHZKDl9V3nM9sOovx+yS1YNcTtJlTJK/2SQJ/hwJGp4k?=
 =?us-ascii?Q?6aiMHSY/SWc1i0PupsOeVRoLe4UtxcsSxwssBzOj6Rvk0XLUmWJT7lapGQl+?=
 =?us-ascii?Q?MfeCMx3Nb6QBJlaHfDypoW5Q6jQtjjOZC4j7IJ1hj6cGbYbuUUREb3cbjx5Z?=
 =?us-ascii?Q?U5lWT3EeQj8HSMLVOwfY4rDJCM352gJ3Q+5rmYtOC8OiZpBL4UEd/+iXYFPS?=
 =?us-ascii?Q?XJma5bOmfC2yzU6irEBDSMl19TGm6DNNJD/9tSOJL9xFIT1/KNafGey48Aai?=
 =?us-ascii?Q?RrrI7T09tVj1SNELALoIPZwO4f76Mdvdp8zJ8uTYC0GuWR5BQC0bSoPMXpQ4?=
 =?us-ascii?Q?D68V8it1thBLwLLWKbPUhBMSSC9jGRs7e6G7NMQPgocdZQukXDmoEw7iCfx8?=
 =?us-ascii?Q?PEj3zyJa/0LMBcNskJyTL4oy2esRUO76ryHWXO22RhXE6qsmSD5njAy/x1DJ?=
 =?us-ascii?Q?nJ9I5YiicLVd0hNOxgNnuYzQeuk94OubhyCTcORyeF1slPDryQY0p1KRChkP?=
 =?us-ascii?Q?t6SgikJ5t5FJgv4tzfyPxlBgm4qs?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61baf1da-ea63-41ea-57dc-08d8e1950234
X-MS-Exchange-CrossTenant-AuthSource: MA1PR01MB3257.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2021 18:15:37.9464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fyR5UidncospoFgRb6oiX0vgLrkj1YdfmMiHQSq3zDF8em7Gkoho3tZaryFQFbfF0pIRJxfta3Q9TW3dR4OTXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA1PR01MB2761
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

From: "Saloni.Jain" <Saloni.Jain@kpit.com>

Whitelisted below CVEs:
1. CVE-2018-12433 is disputed and reported for
crypt libraries.
Link: https://security-tracker.debian.org/tracker/CVE-2018-12433
Link: https://cve.mitre.org/cgi-bin/cvename.cgi?name=3DCVE-2018-12433

2. CVE-2018-12437 is reported for libtomcrypt and
is duplicate of CVE-2018-0495.
Link: https://security-tracker.debian.org/tracker/CVE-2018-12437
Link: https://github.com/libtom/libtomcrypt/pull/408
Link: https://access.redhat.com/security/cve/CVE-2018-12437

3. CVE-2018-12438 is also reported for crypt libraries and
no details are available for which versions are affected.
Link: https://security-tracker.debian.org/tracker/CVE-2018-12438
Link: https://ubuntu.com/security/CVE-2018-12438

Signed-off-by: Saloni Jain <Saloni.Jain@kpit.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.1j.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1j.bb b/meta/rec=
ipes-connectivity/openssl/openssl_1.1.1j.bb
index 181790e6ab..3d96533580 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1j.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1j.bb
@@ -241,3 +241,13 @@ CVE_VERSION_SUFFIX =3D "alphabetical"
 # Only affects OpenSSL >=3D 1.1.1 in combination with Apache < 2.4.37
 # Apache in meta-webserver is already recent enough
 CVE_CHECK_WHITELIST +=3D "CVE-2019-0190"
+
+# CVE-2018-12433 is disputed and reported for crypt libraries
+CVE_CHECK_WHITELIST +=3D "CVE-2018-12433"
+
+# CVE-2018-12437 is reported for libtomcrypt and is duplicate of CVE-2018-=
0495
+CVE_CHECK_WHITELIST +=3D "CVE-2018-12437"
+
+# CVE-2018-12438 is also reported for crypt libraries and no details are
+# available for which versions are affected.
+CVE_CHECK_WHITELIST +=3D "CVE-2018-12438"
--
2.17.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.
