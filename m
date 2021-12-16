Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C53FDC433F5
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 12:27:01 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.92.74.81])
 by mx.groups.io with SMTP id smtpd.web12.9892.1639657619483842799
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 04:27:00 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com
 header.s=selector1 header.b=Yh3IX/xy;
 spf=pass (domain: outlook.com, ip: 40.92.74.81,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kUkNXv6oCt4rcWGRb5QnuvBkwQb2PSU9g446T5wui3SgSN1S1HFKzrm+4FesIIPkNuKV5j16H2zRHBmWw5804tNFZuYCAtIkH2ddJTIX+0QFWiXuspQwPkEy06hQBIWzfwXAT5LcNYADsD7ZEBWvXn2Ib/EbSxjUIIOImTS8hxHCSLcKj3Z4HXMnU9wD8qpWmtu1hxUu07GhTGqZ3x2YBYf6SVeVOfVYivOLI6hVJp2NtxkcRefaLijkvC5Vbg54uB6/m/tNRbPIE8Nv5iwmlbbfo6vDSzPgObsNgq28sJkDak63QI/I2bbtXsZf2Nm2hvpCgx5mT5QfSOv6PnHkfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ps84iOJBdkJWEcuKjjViELujm9j3sYSM1qce+2zNI6Q=;
 b=YukjXQt3vrNIVyELZfAowzYDPiCfCQU3bvEpqSUfd9A5fph+ez3ylI1ySycICNklfrrQfb+SdcRstipvbIUWeziDjaxCNGE6l5nbvDj0ysQmr2Swcd5nPqxRIYC2nhAFXdAocvjHb+WY3k6IZ5hEduXpH+zHRwjrEvAkLXfQ0GkGVSj0m9yrGZBlnsmYcWhLNmB5L7fG01mRIFZsd4QQTjE22UH6css7MKrqk1ys9HW0ZDiSCrTHqs+O5ttmLCQyXDT5dYIuGO5hMJnCtXfIuA2/oNvV7+TM+trnUVp/KFzn7HoSLmQo+YthEvdulRxv2SF5z4F8R8rYwrUtKTIylw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ps84iOJBdkJWEcuKjjViELujm9j3sYSM1qce+2zNI6Q=;
 b=Yh3IX/xyjqGK/aZfYo4GWciDQdfXZlbsLVlBvWymNeJ+IqG1T7fOlfTmvjybUOK3Lu9gR9ilmisscN0dXZ4rYYmn6qaq1nTQa2dUb06lGNxuvjWLg7JBaW20bf9soNIfDJWG1xNRHvdiHik4vdgM5PwzoYR6xOZQ43z1IcayVaF/xS6aH3gaugKozbsElxVH5jbbO5IpB6PIVpxPSzXyguvA8kOzH0oLe5wgdqQz9xecSYYAiU/9Eue+/C6DU+J8rS247Tp7DchzH/6fLnYWJ+Elz09zXzRuVgauCFBb+waQB/4n7VV/E0jXvnJyfLn1ECAQOjsoxsrFxp2ICXculw==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM0PR09MB2529.eurprd09.prod.outlook.com (2603:10a6:208:dc::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Thu, 16 Dec
 2021 12:26:57 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::782f:9964:348b:b2fa]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::782f:9964:348b:b2fa%9]) with mapi id 15.20.4801.015; Thu, 16 Dec 2021
 12:26:57 +0000
From: Konrad Weihmann <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [meta-oe][RFC PATCH v2] insane: Inappropriate patch reasoning
Date: Thu, 16 Dec 2021 13:26:36 +0100
Message-ID: 
 <AM9PR09MB464237D86A4AD9E16A0E68BCA8779@AM9PR09MB4642.eurprd09.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-TMN: [q8DqFwqEnbOcHqwCCSkv/IMPZrTMW0/2yZDhEHq+TssLmYT2YSh3RllHjSxhoQrd]
X-ClientProxiedBy: AM3PR07CA0057.eurprd07.prod.outlook.com
 (2603:10a6:207:4::15) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <20211216122636.3925368-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a13834af-876c-4ce6-de42-08d9c08f59e2
X-MS-Exchange-SLBlob-MailProps: 
	3UeWkQkuiJMapIaE3yskuNrNSV986tZKSjWuFdk+m1JAkS7seWRWPts0S8+7C7P3yFmAQH0uxxTN5D2SizBHKXRy/yx2pjovXmxOlDFKZ0G4XYive3E5KisSSFCnS/xBKqW8ufXAQt4hu7eg3gVmgY30LFoe0gp13WhWnl6a1y+NXuIM/4zQBR+kUmjd/AQNbmSAhzHD31GAdd0AWsL+eeI5nWP/+GCvVZU59fZFLvOD8oGKJsBr0yuoRFRYh098u/wmT7eBaGvvQht4fQiPhRLXQOA+TELT3dPZwR/9Abitvj/XXF31o7FCwKaMhundc4Wu+j0m0rmGUX1KcQngBuarLUFoShLnGJ2PnvvMIAHYzz58pJ1JlmAzhLEPoN3wKIE4W68ccar6yP6IzVPupKoS4r7jE+zrBlsaoLMczuiDM2tE9lPd2JJyzaZqGTOfNpfExlmz6TDQioMOwhMVHe7AQf1jn3ph+UKgV0+plbbu3xqVs/fGQNeXIAw93BwAiiuAMEDq8yL4pBd+UzQ4IhJo9MZRsMuSU/Nv19EZXxHnte+go+P+eshkA4Ao0WyAIBGNcRHHOKiM4LoeoOw0xBfa4Jgu2rjeMzsA3VcScN+Mzt/1/1P6wLxCvN5n3ozLbVkCDwK/O+vk62sQd2gW1+FxWaq8BFHF1bf8/rsuL9yXeqn6vVdRTtjnatkf9V2aghIGc82KZwBHCMhHy+CTEUoiPguGbHcPoKcEAOL8kKOYR6Ww86ckwA==
X-MS-TrafficTypeDiagnostic: AM0PR09MB2529:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mQx5xCf8anvMCOGO5HzS+qqpp7MWEKN/WyfHlo2nIyi7AhUGKy7cc7UmvzIk3c+mL34Emm8I3NnR+nGaWc8Ym0XdncttS/wliJP3teys0dQhGNBRz4o2/5mwwfptPHuV8+SQ6qIK/O9EcCAVuBGS7N4NCpZf/XctrxP7quaSNEHqvdGGRUvFRx/6d++TT5eFl15S4mTZt/XUmZpOSd7FgsiAm0m9R/C01m9QYlZOSU/qiDkS6tkarScgdSU/W/hgPV8b2/6pgL37tTgcu6dro81nCcF6ZHO/V+D97W1cGCldCRSFfJvcXFicWKRIl6wr/9lKtcN+X2oFxBST/V2mPPjg/o/NQnC+UNbv2/KQ9wke+vbg4y0JzlHfC5qgl1KhJWJB7iJ/Lsr182s4sxmoAlp8EcmgXHsjnSpKrYwvd6dejfrJbVCO9+qX9482tbN6dy+40jM9HaeFMXWGO+jJkbBBXkLp2snep2nt+ukiD8eYb5j+Cw2ViTX78G7Wjo+7HsATPDkDhC+Ty+DxEQZissN3bjOenYPR1Vrdc6b6jY8a8Cd2YLXec5PIu0leeFRvP23/f8hr9g4pvrEl+clnpw==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pw4js79pTXuyUPkbdehuyuspwPIm5jbpGAWEOiL3iCkDOa8DhniR4EySBGw3?=
 =?us-ascii?Q?C4D95mc96a9zksu8pKuBmdRuPJUPsacxIrpo77/LmewzMPWVnbAl8/ryHlby?=
 =?us-ascii?Q?T1wh2RXwsEIWI+NUL4clinupV5jzDB2B8/SWlegVxDrhF4LqSMKjjBg+H0Ln?=
 =?us-ascii?Q?zr3Az2CwyAfDULJwN86RzLzYtFK5JudCSQqznttyDK3MqOyJm3XL6qL/3N2r?=
 =?us-ascii?Q?8jfglSpFFBKL94qEgaWxwwbQFpougfJvz6xTgPeb6NWnnHnnZalUFLa+XDnv?=
 =?us-ascii?Q?ZMIt9r3cyZoQMgZV2k50Rqo+McF3pt+z8fMnlrEQBHQvzuZfsjtBSQd3c0v+?=
 =?us-ascii?Q?FJ2TNAMWuMG5Gg2Fm+Gt/uJqw7Aed+0wuCq24ApAG+FQZPofB0lQBcQoZqcs?=
 =?us-ascii?Q?4CvN9Fe+1Rjvwbj+6oMjp2Us8lR3KyxBypdg9pHXTYSG53BUcHQGHw2+HXe/?=
 =?us-ascii?Q?E0G5/uaBA9MVA+RdS0Rx+/IMozYoXdsT3SVcpDjCP8wcJvzzQMLfRbetV26q?=
 =?us-ascii?Q?JUu6/x0NEtQ6WaFAc/+c/UP5gUi4pRIeAYq04K2WqUF/sUnxA8WVCoxkNxob?=
 =?us-ascii?Q?0Sn4MBMLKXJwYJhPlyOSZVGOM4aClfpEIO+lXQlJqZHNTCLkdD1zTsDubqWn?=
 =?us-ascii?Q?B75ZsxVwVtBnVSd4PqzzfLJcHHAtGyCKVLlnYnR4yfHTIaBCF+29oX66jtWY?=
 =?us-ascii?Q?6bMaPkJJACeUMbaG0dWkMWrQ+vy7kQcIeoDGpYtmoc3aFzpZZFzYS9GNjIs3?=
 =?us-ascii?Q?Zi894/iJzxqryfMtx5fu0aPyFqwBlSGeqhNaP4bSv82iaWZNLG5ygUu5dZJ/?=
 =?us-ascii?Q?5qq26b2WXk7iawfSQL4snlWjcSW/GGj6TuZiGDpq2ZJqsGf9NbVCAatgxFzd?=
 =?us-ascii?Q?dsZL8PmpTyyucFCXOLQO4UjYhNSo4Kv8sKPAtna2pP+g7nvtoYh3qLNbl8H1?=
 =?us-ascii?Q?tFI+8oTvj3rjbtKHXxWCD+rFTVSZ1tjAdh9+r35M1HsEPu64M7NQ3J3iXHe3?=
 =?us-ascii?Q?s69F2N/VnwOxtaMQJ2AYoO6uVA=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a13834af-876c-4ce6-de42-08d9c08f59e2
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 12:26:57.3031
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB2529
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 12:27:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159784

if a patch uses Upstream-Status: Inappropriate it should provide a machine
readable reasoning in square brackets.

According to latest wiki entry that would be

not author
native
licensing
configuration
enable feature
disable feature
bugfix .*
embedded specific
no upstream
other

a detailed reasoning could be provided as part of the commit message,
but format of the metadata line is fixed.

This patch adds a check to insane.bbclass and warns if there is a
non-compliant reasoning given, or none at all.

In a follow-up this should be turned into an error, as it was done
with missing Upstream-Status

Can be skipped with newly added patch-metadata key via INSANE_SKIP

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
v2: add possibility to skip with patch-metadata in INSANE_SKIP

 meta/classes/insane.bbclass | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 240f3aad62..eae8e0e549 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -1124,6 +1124,8 @@ python do_qa_staging() {
 python do_qa_patch() {
     import subprocess
=20
+    skip =3D (d.getVar('INSANE_SKIP') or "").split()
+
     ######################################################################=
#####
     # Check patch.log for fuzz warnings
     #
@@ -1191,6 +1193,29 @@ python do_qa_patch() {
                bb.error("Malformed Upstream-Status in patch\n%s\nPlease co=
rrect according to %s :\n%s" % (fullpath, guidelines, match_kinda.group(0))=
)
            else:
                bb.error("Missing Upstream-Status in patch\n%s\nPlease add =
according to %s ." % (fullpath, guidelines))
+      =20
+       if 'patch-metadata' in skip:
+           continue
+      =20
+       inappr_message_re =3D r'Inappropriate(\s+\[(?P<reason>.*)\])*'
+       inappr_reasons =3D [
+            'not author',
+            'native',
+            'licensing',
+            'configuration',
+            'enable feature',
+            'disable feature',
+            'bugfix .*',
+            'embedded specific',
+            'no upstream',
+            'other',
+       ]
+       for match_inappr in re.finditer(inappr_message_re, content, re.IGNO=
RECASE | re.MULTILINE):
+
+           if 'reason' not in match_inappr.groupdict():
+               bb.warning("Missing Upstream-Status: Inappropriate reasonin=
g in patch\n%s\nPlease add according to %s ." % (fullpath, guidelines))
+           elif not any(re.match(x, match_inappr.groupdict().get('reason',=
 '') or '') for x in inappr_reasons):
+               bb.warning("Malformed Upstream-Status: Inappropriate in pat=
ch\n%s\nPlease correct according to %s :\n%s" % (fullpath, guidelines, matc=
h_inappr.group(0)))
 }
=20
 python do_qa_configure() {
--=20
2.25.1


