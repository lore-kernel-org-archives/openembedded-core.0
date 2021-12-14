Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB1A1C433F5
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 17:53:55 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.92.91.95])
 by mx.groups.io with SMTP id smtpd.web09.29178.1639504433730976572
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Dec 2021 09:53:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com
 header.s=selector1 header.b=HKJH3Gvq;
 spf=pass (domain: outlook.com, ip: 40.92.91.95,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LgSqsAWq4zpKllsbR926++xu3Pee5F9BTelrEXQsSoz88PAchxrsalNPrp1ZiD1fWN7X7FPvJZQ6daj1VHQOF4wdiiI4xJ5Cf9O/mP3YHi8H5nMbptq1Wus1FbzkeMlK3oBqm9Nbpvs5VcFM2cHDmQ0QHd6D5eRDV40icO+uuqZS0XSfPyuknNuL/YOtdp9k7vQOanHitDUL/YRAF9MNYNvg5o+rA8H8dzJ+7fKquH+af1YBj/geCqRg3Y+BGSUmOEGP3s2AjWgCMo7dGh6vMi7XwWgICYlb/LxzOYHq9VOldTvULlUZkQMC9oZ/siXckQsBHle+zL8nVFANenv6ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iBWS21HIXgMtBCBezYmon4qjSV5W96OJjkFkY/uNrK0=;
 b=OGLAe5fBkRMXUNDZYzShPKHFpyZKTFD+6N1f7KflXw96oAOA2tqWvYsC/cpuDr8S/sTbskIsnlyIr9psl9luNITkXZ5hkiSxsmVTzKHMcqOxDTG8WLqqV52ZQdTQJFY4qrbgcnOcpNpJxhYuXbc9zZFLYN+mwR76AjKIIoA/zWnh6gPYRyZwv/+3WysbnddC0TZl7Cxg0fbeB7TxSDTJNdwVvtf4ig0MVGCnfRBLviAqIiY9mKhb4lqTCYv5ta0QP9E8gu4dbkB9J8OZ31TJlHDm5r92jaybbweSmHgrB4IKdMdVwNLS4AFNEYezyMgITLbpBPrhXGlYJq4Nam50qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iBWS21HIXgMtBCBezYmon4qjSV5W96OJjkFkY/uNrK0=;
 b=HKJH3GvqIuzxLUv3VlkMmdrKD5neYYwUbSZ0fLJusxrREgcipOfTPM9OM0E8IGX8RjyPJZj3czU20yFJ+tH/LXdN8iSySpBzm74ZMDxGcIgObXDHPpKSM0dZ2QR8ulQCiJRlmaEr80+s9vr3MeFa5GoOO1Du4c+RasH6LMya6F1PAw0deLbxvsn7N80LlyYignfNtgX2yp1ESTmQB8w4dwkuwLlKaO4Z6F5Hqpc7eh2AT/VbedamPXba7z9n3RNp1oh10Kg8M7a761mJoZ4PlVaiEnyk6U/IQWKdOsBSsBryJVRpjndUxLu7Wlr0kE5U/s9Pu0NQPt4pdR1wi7+GNg==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM0PR09MB3411.eurprd09.prod.outlook.com (2603:10a6:208:173::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Tue, 14 Dec
 2021 17:53:51 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::782f:9964:348b:b2fa]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::782f:9964:348b:b2fa%9]) with mapi id 15.20.4801.014; Tue, 14 Dec 2021
 17:53:51 +0000
From: Konrad Weihmann <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [meta-oe][RFC PATCH] insane: Inappropriate patch reasoning
Date: Tue, 14 Dec 2021 18:53:32 +0100
Message-ID: 
 <AM9PR09MB4642752B0C687EE091EEC380A8759@AM9PR09MB4642.eurprd09.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-TMN: [WOlt22hv/dFfy/c8nUHb1tFjn6fOKqxnn0ixIrulQa77ht3rM4HxsyaxgqUmKT9W]
X-ClientProxiedBy: FRYP281CA0007.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::17)
 To AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <20211214175332.2594432-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9d7f96d-a9e5-4ec1-fe49-08d9bf2ab005
X-MS-Exchange-SLBlob-MailProps: 
	3UeWkQkuiJMapIaE3yskuNrNSV986tZKrkUZMWbw4fW1Ux7uhw1x1Df3nQhOm37w6rRt63G22ecNyEBkVSniTH4X5dXS5TMDaPkz6P5hXxD+2w3NpZ94q2aU8eky0XG77L0jtzZ2+06uo8pmpobgPYNuPJq2yIeuHLTfULOWLrwrOq6XAMVy71/HysU//ww2/mT7SmeQ5lwAFVwcEs8auWPi43gjKvqam1lOLqvKRqtdQhP+NmO2GrHtSV2pfTy0Qne1B506WEQeUQgkP1fxrizr8sH3fg2fyZ0W5KHLD97sTuL/GX3hrsEQZIwW2MvQlYd3M96tpBlviHkugq0SkS3Hn8Y3WLfYFVQQhHgmna3FJOhtNt+rphPSDrNNSq37KFgtiT2/sV9xsV0ceQbB6j4T74JSJpQT4k/kZbrIG7jx1ifghlBYzaBcQbN58GaBr1Dkld2l+VmtXaP//V9HAHIFnvL/AGj++37NV2PZt+wuXL5NdSvNRBYOqmi5gxCdjA1ROxCuCIypm8Bem72F+adFE+KzfW8tLVrtsyfwXVRmzIdA5GVrkKZS7L970YwO4Wd363L1V+sgOHggG8uacf3jaXnlnTu8zqomHDorS8OHZr5Yy2Xsvxg86eVY2oYpIwKfAtuLVvj0k0qNMtiGl3qrfijAujGtrD3f+iig8GFEHoPtD+rO74CnE0YYUTZFDTMTai3KuhURNQ/ribjYKLL7a0pn7qxFKXXJqCkksAsd5Qu1bJ8nOQ==
X-MS-TrafficTypeDiagnostic: AM0PR09MB3411:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/aO62DMEnqMh+n/1FkEeQ5S/GgLJG8yjJrg1nZxw5JO8xd+/A7MoKdKAvYrMEr94SDyzhJ69xrLJJggvYdy1T5R4/qY2tJA3nvmgIpR5TD4bfPIU6wjXXjkT8YyWoXLnGr8CFBMBFP8uasEd5zptkty08xJ2EQDWuVDh1Z6ztCHnc1PXlnqV5lGD7dkQDBlCYufmcwEt3rukA6ad2SsnDxL4275dXXDxmnCYFVZZEMBKiKdpSOYKVjGXo46DTf4VJNJdoC1lb0RglfzCUOMvgzqAznXkv3LwCJ7jHaf99El9qEb4t7lXG3ZBOuFE9Ga6odaOYzyjL9qLwC+ETQsBosx5yjzSKWcRUldMkwKLkdoNY52uRTVRSHZwEOHIhm9HjTOeLTfZzRH7rzPnTn1NlB2alyZ4n1odV+/tw+Hrx2kQs++kP92JO38ABDj+31t+WxxF2um4X3r2F87q3rQoS//OiWMJ4YEwP+Hcl54rabSHiMYuU9jiG2y6XbDmN7XavVP6wsH2h/RuX9IWaoaPwgddep0PPJYR5CH7yg6NLoyoKazK+b7z1vI55+AqB0w20LNPGD//EbjbRJlkkvffng==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?drXPjqHIiXEGMZoI3URqRDijSYPWqrdF3MX/1BNk+xoE09KJs+BSqDQ9aaVy?=
 =?us-ascii?Q?5Zqkt60h5LroWkHHgjqGT6f1OY7UYb5bZNcFpoLtshMRmm/P7jmW6tzwIh7K?=
 =?us-ascii?Q?ay6aYe2ikovUgokNuuc6+FyutJ3JJ2NY+d4u39+gc87E2bUoG4G9p5FteG3r?=
 =?us-ascii?Q?1le76LbztEFbVhaLAZlDfKb8SDk3rPHJsabXNZzm0Rhq1HT637qDuIuW5biI?=
 =?us-ascii?Q?vgnEwiQN6ZJ4hI6z20fwDLA4bC60DRIc+Pc5AaqXIVnCynJ77633wG+TPYcH?=
 =?us-ascii?Q?7I6xRuAgc4yiFl8q/4+wUZiAk9dCClUMXyEF0ENZ8sgF5qQgcMU3F9tw0ZE1?=
 =?us-ascii?Q?qPw9vGMFfFiLGgRLpCdbXGPUmGkadsJR3qeZpe2q0+Ai6kEF33f7Gf6bO2yG?=
 =?us-ascii?Q?3l1qfl+B/ufGwjPvvgUsVVTW4Cq4GWeB7/GACE5Lhbjq+1blQYr1V+48mhTL?=
 =?us-ascii?Q?GyTf5G36OISwqOcgCHiAfd/Zgvbdsf2JqjHzJFd3TwPxbw+Y/b1eR4ZEQ0w1?=
 =?us-ascii?Q?4R3eSqH1YVZJcnp7AXHh8nNUKPTgSechGjOXGqjRkApYOCZLDOnpJJlbPrB5?=
 =?us-ascii?Q?f7u16edDG8US+cRuugfZMjr6oozrOR+mBHDElaiPnQF4qhD7iiqg6TA73bTs?=
 =?us-ascii?Q?P+dDUPktk8E4+LHPrGHiRbMwHq4mXDrgng6HkoeFAtoyepRolhbZyHbTkHuX?=
 =?us-ascii?Q?dyOu/gIquAiayntuL51EbstkMlWZFoJFBgYYlMurNyJF+mtTMg4n5OM6CS4L?=
 =?us-ascii?Q?pQolPSzd8EbvP7PR58s9V+tr9H2Og/PQT4VM+eCN3+/N/f2FwDhXErSgACb6?=
 =?us-ascii?Q?NMDC/6nlUMYiypfTkxukSDE+TWKOQFpdkEX6NlEr1n2+b0gsC4I+O1tBBP/+?=
 =?us-ascii?Q?NfmQ9su2QEBbVNR2YoiTNOl/mYw9gsX07meqTuKQqCoYefaD81bsnaWoTyBz?=
 =?us-ascii?Q?vWS2NZGZtdTJSO4kRvCmXv8hAr1i84x96anOFOa6d4VDHoJoSYWVLfc9zuwM?=
 =?us-ascii?Q?R27c9kRg/K8I4Cxkaxt3pF0tig=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e9d7f96d-a9e5-4ec1-fe49-08d9bf2ab005
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 17:53:51.4693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB3411
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Dec 2021 17:53:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159701

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

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/classes/insane.bbclass | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 240f3aad62..da26f4662c 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -1191,6 +1191,26 @@ python do_qa_patch() {
                bb.error("Malformed Upstream-Status in patch\n%s\nPlease co=
rrect according to %s :\n%s" % (fullpath, guidelines, match_kinda.group(0))=
)
            else:
                bb.error("Missing Upstream-Status in patch\n%s\nPlease add =
according to %s ." % (fullpath, guidelines))
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


