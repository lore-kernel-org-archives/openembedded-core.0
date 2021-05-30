Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.51])
 by mx.groups.io with SMTP id smtpd.web09.30454.1622371054425187342
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 May 2021 03:37:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=hXP9ZTGX;
 spf=pass (domain: kpit.com, ip: 40.107.138.51, mailfrom: saloni.jain@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kwLlI8QtxFrkKpbdwBPzF5xch1zpDpLm1O6SAYug86nuJQ8p8gTtLSxu9AeLxOerZWzOB2njTzEqZCuZjiu1JABQ6ecb0LZsrq4Lqx8gekIEHN8a5kebIR2nAvyK4GZfx8is5vNGvY686AwINjflnzyAEXG/5l7m3SPEfK69NvyE1eRnt94z31UZd8vK7SE/K7clhJ1jRxSa6yVioTbzCQQ5EPx5fAIeoKTSQeFf9eTtdEvxfVuTp10JAXVBS4hS4L3NB5Am5MiXOBqsyQhZCU7aF/EovA/0Zt2F2WBBskGNmd9CHJh3pQCN5xUj7OLCjTiu0MjIPN6oS1xRsLzEzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dddn13YKqRn0iQmP/REE0awNVA+9ofDyZtFoXED3Hlk=;
 b=TQ44mjg3RAzjJ+QL/XR1B6dTzS09V9pLYzOlMXf71smSxDKo8BlZp2uhPen1i0Cp1wj2Amef52uK9PS46g1Jg9xsgRR+EQaMIau73ejUDxCSlVhgWMgfUJxFcgLZTUhTw3S/ZmZgBUrmzVFEkCu1SrB6pKGG/qsOm/2NW/02RRcIPb8jtWUHsIXRVU7IYRblGN+8b65fXsA13whoa/+AVd9JAEHq3dzTND2NT0bSAxpZfOzPmBTNYUlAr5hJ9WwfCvW5Ew1qfULRqb1BdV0Tm9RZ5AN4kAs+NpDoHApoZfVTFTZT0lfC4JTSD7QmP7Xrbc7Ag0EV1uJMPEhQMiQafQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dddn13YKqRn0iQmP/REE0awNVA+9ofDyZtFoXED3Hlk=;
 b=hXP9ZTGXw0F9uJbuHeW0pkFgpir2fHLs52BurLL8CcydE/tuIpt+4PoH3tBouXzTAxU3l1LbyON9UGDACHDnu63Z07OmlmlBneyJpivPoMxrZ09kwCEbAlgO8meJ8L+3Wr5h2iiOH12Nif8GGzaZ2tMzka9zaVADXigZzvxdEeg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from PNZPR01MB4479.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1::6) by
 PN1PR01MB0959.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:8::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.21; Sun, 30 May 2021 10:37:22 +0000
Received: from PNZPR01MB4479.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::bc2d:b0e3:b676:dbaf]) by PNZPR01MB4479.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::bc2d:b0e3:b676:dbaf%3]) with mapi id 15.20.4173.029; Sun, 30 May 2021
 10:37:22 +0000
From: "saloni" <saloni.jain@kpit.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	Saloni Jain <Saloni.Jain@kpit.com>
Subject: [meta-java][dunfell][PATCH] xerces-j: Whitelisted CVE-2018-2799
Date: Sun, 30 May 2021 06:37:04 -0400
Message-Id: <20210530103704.8081-1-Saloni.Jain@kpit.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [2402:8100:3848:879c:759a:4c42:bb06:9c1b]
X-ClientProxiedBy: MA1PR01CA0079.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00::19)
 To PNZPR01MB4479.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1::6)
Return-Path: Saloni.Jain@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2402:8100:3848:879c:759a:4c42:bb06:9c1b) by MA1PR01CA0079.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20 via Frontend Transport; Sun, 30 May 2021 10:37:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e65d3c9-4ec4-4aa6-ba17-08d92356e848
X-MS-TrafficTypeDiagnostic: PN1PR01MB0959:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PN1PR01MB095907748FCEBE8FEA5D08D687209@PN1PR01MB0959.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lnNbHAL4cNtoMEl+dZkRXR/pcK95kyZ6Vfh8+E5b/resFn2k6hTF9O+AmFaX49Ny/3/aPMa2zzB09z5M3KGmKOmzYEOsP8qOEGZ4N+hk3fpifnmwLyI8FuIerz0kVSulHHoktj4yrgKWBUuBU6uj0cJcFabYLNSdt55h264Jw2/lFYtel5GHkpBRx3eDzHXn8K1+7evTfau9CvFDx2cBdJM+5os7AI06/aLFpgAPutDFQyZOY+UtZ9iasK9ikfBYkFf8NPWttXhmgbNw228RsLnDlvKCMcuusaKlr2D+ew0Ms1AnqLF56+zRE+SIUDd0qwEJjIhdCOwAetRVE4qWp+S+QNAaTsCs6IGbhW92pMyDULHD9rlKZzlQiGMcayi1fZtvqhDmMMg7Emw/6GbcXVFsmftBvUcDBR0Ta2S6vRYGH9n8LPxsSr6YBGr7MlBY1DiNPFRwossLmA7swY0MXiij4QZD1yLJwLoba5mdzAlztT+u04gJPQq6hxNx68rXHWBnptwSuM+hLsh3IPddcZ2ZkSq/NJoo0p3OAVSK6acxo8yk5zbMysK0kygdZ86S40brtPl543c4PomYfeoFo7LMR7Ki7JICrTkrcTqmF4CTbBBJAg9no31VCH/4ltS7su5Z5dgD3YYtI/qHus0wXAHYlG/rVHW5okQP7vBrLFIcSpGxIhw9sLNdAuLu6cQmxvafALaAgVBPKqVe8dfZB2vdRs0Wf3UlAnbPYsR9606DV7sadN+jaR1iNveLxJsKquybXWJZ/2RtPHzlRpRhkQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PNZPR01MB4479.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(376002)(346002)(39850400004)(136003)(6512007)(5660300002)(1076003)(186003)(2906002)(316002)(4326008)(38100700002)(6506007)(36756003)(66574015)(107886003)(478600001)(6486002)(52116002)(16526019)(66946007)(966005)(66556008)(83380400001)(8676002)(6666004)(2616005)(8936002)(86362001)(66476007)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?PtffEVNfWaEKoVIEIfdsLtCmbLyRrSwhqJWs0hCwUcY7EthdtSaS+U3z07jf?=
 =?us-ascii?Q?ZAeMg21B8fCYsm9QMrWR1K8tBF7qA21Wl3B7QPu1AnEv5Jim15r0uLhFguB5?=
 =?us-ascii?Q?ZHFumODTtE/NOpn++7JAgdgvBnSYkxEsvBqHoV10HAc1uFeH2ldmt3WGJCwZ?=
 =?us-ascii?Q?43cmQelMG6sRIQrjLeX3/gdkoMbu67SjAgJfW8w3GUtF1+vZe0vTMUTDnsfk?=
 =?us-ascii?Q?cYzmKuCzdFC2uKvXL1pMhmlihDRlVm2EQQYMcaGbqEr9qmo9VgGiqIRY2oHo?=
 =?us-ascii?Q?6aVaqkUD9+E5+MYK7fecagFAeFJYFBERC4GKhXVHis/9gmjs9awsE/cuZwsz?=
 =?us-ascii?Q?2F8WMrYNKK5ZNUPKrHT1iY8K9jg6ATkoM2k+M0kDQ7jT3bMU8rPP+83kFBLt?=
 =?us-ascii?Q?UIB2rV1veo/INemmahE+zWzta+oVZbFITEiyO0rzpKTcGTZkQS1iJitz4Vx9?=
 =?us-ascii?Q?pbgK8UTe/uvN5IOBP/BAev9X+w6KVXOGg3gvMakR8xVuDCJVD2kM7uJbukVU?=
 =?us-ascii?Q?f4irADM5jQ4zT7+rj6S386v1JaxM7btqlPvxoOkbusop3pLeU5ze94NwtVQX?=
 =?us-ascii?Q?A118oR2D9mr2WFzi+lZVacTt3ymxWmrwm16nvDsKLb+7pWMYiBZiAHpEeV0b?=
 =?us-ascii?Q?AZpVWI8ico5bght6T11Rp2bSGGGGJF50bAQx95KZIEtM9iRkoECR2zMjjdku?=
 =?us-ascii?Q?GkwzLIgJhwOsp2B5JQHbaK1BHPfQ2sKDX0v2lcCcIDJG0bjqUz1q0W4qPaRM?=
 =?us-ascii?Q?7Bqf3zP2jWol3ojKfo2+DOVyaf1g7fYM26ztYCDF6DqPgeKIpNEJKbvjGtOw?=
 =?us-ascii?Q?oA8utclulxHpNEeIxY5BwZHfgS52cZHZ/U1cYJTO2F+u6Cx3CPaOMyXGsKFB?=
 =?us-ascii?Q?210mpl4sknwS3EfYfeoCMiEYc7B6Be/AGG7P6/pJBul3ZaHH8BtY46HRlUpO?=
 =?us-ascii?Q?1y4oK4Q4DGLQcViVGJ8JgQCRd/v3l+wobuR9N5TtkHUDmU++6kWoLtGjxbO7?=
 =?us-ascii?Q?SpTcJItJGGsMY2cI61P9jTx6KrhAjSnq3czu5U9ZE4+aZPoEZHkFw3CIkj0D?=
 =?us-ascii?Q?3wnuycDHrp2OvVbtaW6tpcaYIe4NVKaIJJrRt7i3zIi1H2bBuqxw7/uV2yMh?=
 =?us-ascii?Q?PBMVLZfR4r/EoId6yRRcst3MnK5i2Uq2tEHVNrC0Zl+TzQLlQa/7A/A7kjuq?=
 =?us-ascii?Q?557VI4PYhdPaaOoYY9IcJ1rtqxeuyT2tZyVZm2vTuMA0k3jqufI7XvnGWf0P?=
 =?us-ascii?Q?JAnTqBChe13UNjjlxnpzKafx2GMhab5uERv0jODheEEWOlwsBdowt7/RS28d?=
 =?us-ascii?Q?WDe3xR+HKJiha0Yy1NQUgTW32XRXl06aHgMOH4YW5/Po3jz/5HPeZQqrqm1A?=
 =?us-ascii?Q?B0CnK4xP1HEHgWMw8YZr+xxjK/AW?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e65d3c9-4ec4-4aa6-ba17-08d92356e848
X-MS-Exchange-CrossTenant-AuthSource: PNZPR01MB4479.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2021 10:37:22.3524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ZawsT9rln4nxJeyMzDDAAW+MBSbPrjcG4PAoRW0vmMFaAgIQ5e9I/+pacOLzkuNJMFfexD/aUBHXqPwmVt9BA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN1PR01MB0959
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

From: Saloni Jain <Saloni.Jain@kpit.com>

Whitelisted below CVE:
CVE-2018-2799:
CVE only applies to some Oracle Java SE and Red Hat
Enterprise Linux versions which is already fixed with
updates and the issue is closed.
Link: https://access.redhat.com/security/cve/CVE-2018-2799
Link: https://bugzilla.redhat.com/show_bug.cgi?id=3D1567542

Signed-off-by: Saloni <Saloni.Jain@kpit.com>
---
 recipes-core/xerces-j/xerces-j_2.11.0.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/recipes-core/xerces-j/xerces-j_2.11.0.bb b/recipes-core/xerces=
-j/xerces-j_2.11.0.bb
index 98ef32f..f2a4434 100644
--- a/recipes-core/xerces-j/xerces-j_2.11.0.bb
+++ b/recipes-core/xerces-j/xerces-j_2.11.0.bb
@@ -14,6 +14,12 @@ LIC_FILES_CHKSUM =3D " \

 SRC_URI =3D "http://archive.apache.org/dist/xerces/j/Xerces-J-src.${PV}.ta=
r.gz"

+# CVE only applies to some Oracle Java SE and Red Hat Enterprise Linux ver=
sions.
+# Already fixed with updates and closed.
+# https://access.redhat.com/security/cve/CVE-2018-2799
+# https://bugzilla.redhat.com/show_bug.cgi?id=3D1567542
+CVE_CHECK_WHITELIST +=3D "CVE-2018-2799"
+
 S =3D "${WORKDIR}/xerces-2_11_0"

 inherit java-library
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
