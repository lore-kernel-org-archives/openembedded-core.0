Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.48])
 by mx.groups.io with SMTP id smtpd.web10.5070.1614768671468378803
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 03 Mar 2021 02:51:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=jef33/hI;
 spf=pass (domain: kpit.com, ip: 40.107.138.48, mailfrom: sana.kazi@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QO6NRswXnI16L0y+Tq9MKZLDXVPRihBsZwl1NmGu/AjfYnA0ReO9dwEls+4TkVnV2UMO0mBMtwvFYYD/uOD8i1ZRbxlXkR0JLScqYRuGStlBljeKDW1Z+tgfzyanp1Wm8OGPkvNrcli08vAZgglTYq5lAZKzXrtr9WptbNw7yB82hcMXFMI+tWcux7jeaEtVWWzVI8xkm/bBYFOD1ZPEqpx8qtKvb79cqZjCTy1LPo2dmzt5u7esL2w0srRyGwmMxul/U6kdKeh7grDyWbaHwhSdabBdGoE0aVTRuvgXQJfUsawZWTZCFqsR7btepMws+ddqCsHrEzfgr41s7WadXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4F4nFaRaNoi5aFWLd+gPXr6tp4Jaopi8fT+6X5Tv6Tg=;
 b=TtGoVCevPhGTXIIt6I2ouj7LCZ1mdiciYHOzZUpgDFdbgVtzY4/RjL/J6CAH+RYFpxh2pW4pB43DMq4cwfUTIgixNhVGmYWyqXq53OUfpe67TiusiSas6FI8u8KKLvUJwktuie+QxVY8BHZ0snmT6xFI8LgY82H04ZcGMK30c/+7Jo1DYJpOgjkTvEUgZ/uJvOjPbMCZGkrRgA9/uBHm1h2z45gMg/bH1WKSpUAfY+aC/avVduo1Uk55ijXSxx2KnAZbIdtok9mVSboM2fE8ozs+ehIp9e5v7x+sk1wM86/SX1k0UBzYrOkG+hKqxWSjc8SAYa1cBP3UVauXKH3Oew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4F4nFaRaNoi5aFWLd+gPXr6tp4Jaopi8fT+6X5Tv6Tg=;
 b=jef33/hIcf/DRLV/j3ek/gx9g9Ojlo+QZIFn2xX4vtBx/UuWzwyOGzyA54BiEUz2qamB8MAZNnAJMzutCGyFrSrYMC6DdB4F5jIj1vCpYJtIXxfzcNzuSANEYllBUZovGrF7VZcCMy9FmtGosO355q6EkUl7A9ZBf1uercXuye0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:58::17)
 by BM1PR01MB2369.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:4c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Wed, 3 Mar
 2021 10:51:04 +0000
Received: from BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::6922:7ba0:39e9:85da]) by BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::6922:7ba0:39e9:85da%7]) with mapi id 15.20.3890.028; Wed, 3 Mar 2021
 10:51:04 +0000
From: "Sana Kazi" <Sana.Kazi@kpit.com>
To: Openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	Aditya.Tayade@kpit.com,
	Harpritkaur.Bhandari@kpit.com,
	Purushottam Choudhary <Purushottam.Choudhary@kpit.com>
Subject: [poky][gatesgarth][master][dunfell][PATCH] shadow: whitelist CVE-2013-4235
Date: Wed,  3 Mar 2021 16:20:38 +0530
Message-Id: <20210303105038.13823-1-Sana.Kazi@kpit.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [2401:4900:5194:1bff:c41:1abf:6e34:da83]
X-ClientProxiedBy: PN2PR01CA0017.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::22) To BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:58::17)
Return-Path: Sana.Kazi@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2401:4900:5194:1bff:c41:1abf:6e34:da83) by PN2PR01CA0017.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:25::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Wed, 3 Mar 2021 10:51:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 704de50c-a634-46d8-dd2b-08d8de323d32
X-MS-TrafficTypeDiagnostic: BM1PR01MB2369:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BM1PR01MB23699F73B521612D483B145199989@BM1PR01MB2369.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DghMOCR5nRWFuaUg9MnUaTFh4IzmuaSnL4Qz7c7Z6Pn8FIUKc6pKXtMqSj4JlywglL57KjSuVA4RNXfmINxNf4T1zJ5EXCw3etSmYo/ru6hwzBW85QZFLr/8TRpJIPXIbB+GfU8cqJotbCkcJkrwLkx19eMwK2ixzOawrG89i3jXPlvOxRhjb1TvL68oirHSC6CTAwDUZCn8T/WsphvjrBp3vslyWWbVuN3w2xlTj8LV5yA3675qncRRqp3zizPGIU1+ftP0/FrPIXFCqhKQeSu+uFOkjcKaMDRj6kBE4xV0bL4SOxtM6KS8vXQ77hBmdAhrD+VUUir3m5ty/lVeZ2UIMXo7c0cZh3w4LiKKVETrKzGRlZ70v8m38BHGpSERCOFJlSZdMw/OzsbWxUXj4e9NGHAnZfVYq9CKNUquz8/KgquCn0miX4OnM/fk12YtwZSCR5lP942btYts8E5g1qVvooTAlsdcv6TKuuUH44v/xMyYAgiPcYOVl7SyJ5t8m4jxKA+6vfOVRpaOOGFFUTBk5Zk2qX6q3cJED9aF7yYXMtiIsHLmnfhceBSL7L2NNdbzD/2oz3XXLYsuwswWRYXhfih2fxNdG5fzJv0lvGDtmGSl7spB5f44h/1Ric96PsYKF3uRZstTL8ynwfG3hA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(366004)(376002)(396003)(346002)(2616005)(966005)(66556008)(83380400001)(478600001)(1076003)(66946007)(6512007)(66476007)(6666004)(2906002)(66574015)(316002)(186003)(52116002)(69590400012)(107886003)(8936002)(6506007)(4326008)(5660300002)(6486002)(16526019)(36756003)(8676002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?kB8QTv2DT/VVuGhenFJrv7K2QnFLfCUeUxkWQ0q5+Krb7Px8O8wJHBmshK2u?=
 =?us-ascii?Q?LY0VdDjs8DLL/td0ZcLHWOSBws+drFvZXVqk03unWCXcn+wvOGuaa7qFvgj9?=
 =?us-ascii?Q?y3EWwkMeQC8JOM0wc/SoJoX14gcUFObzE32+WgF0OWN15+QCSxTFudlLPbJ3?=
 =?us-ascii?Q?VtBE6xoLzSwsHFMj92OrEG8IlGCSJHJpzZZjbf9QMtUr4kaFlx4CPJ5K6ax8?=
 =?us-ascii?Q?33gHgUSveEwblvTwHbPvBWsCBZozeJouYKKTHMxJNiRG4IMOKt5z3fAHSsbH?=
 =?us-ascii?Q?pz4tlNKUAEORQopiyeuUpGeHCA71/7PLVbY1Hei/cwalYmzLYZqzJef/KjAp?=
 =?us-ascii?Q?BypUBCRlUJEm2WxH2sCmxHiGcRb74yPlbTXSCW7q4lQRC5FP8i1bJPcg3WmG?=
 =?us-ascii?Q?eaPiN+iApCR5zmYkC0U4+dSoxL8nbHh/2rSbrORJM4rcrKfG/zWmfiz1IrcV?=
 =?us-ascii?Q?WSQuf0rcWwbepmYPT4nt/UQxzRbPjFGYMCd6/5Kj0Ni3wX5Lokcyv4d/GAmc?=
 =?us-ascii?Q?SLiHguSyE0xBLaf1c07HAW+lFL8BYdtUQY/APwxqMj5rde9kqr3nDf2OV0I3?=
 =?us-ascii?Q?JZ38Vxp7fd8ZTBBRPUp/AyCbuwQUvOcEuvZAKKCUjlbLywrTPXzeW6Xe1oPw?=
 =?us-ascii?Q?EcC3SKbNiP5l3bfpF4vQTRXm1dFC1tkG4PE5zpYGlaFo3tIcQaVkdgCqhojH?=
 =?us-ascii?Q?xq6j7rac6yDg2LiUvdtOsk8gYEQz5qi5CYW5L+CnzqxhRnVvuZwMcJs9xf18?=
 =?us-ascii?Q?vh44wJthLgZBhFkXwo7xfKpREBMsc1oodgC+8mtka826mkUw36v2Z9M2wR7d?=
 =?us-ascii?Q?nUGr2DT2vLL6lIRbFR6J5dM3KTI+TuOLxtH6SK73UtP8sQtoxkJ7qKmHdy87?=
 =?us-ascii?Q?aSdQCj1fb/PxH19qJOynnQnrF8FmU8L1TpeeSTUJNL7A8KikF7Llr1vhQ5Wo?=
 =?us-ascii?Q?SlYueHtgK+PW/D9yiC8QLu7a5Ip3M1f2nei+Wa23In86XmKKXTqX+luYptN/?=
 =?us-ascii?Q?uIfAf/HJmwNCYB6tHfpxFYg10ZNxs3O+UE4uUwgcdoh2NlYSR/ypG6hz76Lg?=
 =?us-ascii?Q?CXG7hkJBqQRw2WjBC1twew2hhktJKzpR5hkWz+lXrWiCMQp/AD5p+0y1/+tE?=
 =?us-ascii?Q?z6bsnAYSA7gqT4HN5tZfLYIOZ5W/fE5ryfRZiCAmkyz9Kiq4Vi+deZAHW197?=
 =?us-ascii?Q?iW3hsupCAdhejIgJPAPkOiH2Bs2Ln0I/tdVbUDSVuJwd94s7S/zOuDGyoYZj?=
 =?us-ascii?Q?okxjDOoB1r0E2eDi/Un42IL0oZWWErnE1g5V7o2htpXtnBZM+L9ZFFIGy0+H?=
 =?us-ascii?Q?/Ztb5HnIdkzlexMuS3h+kkN4ItypisqsPIiiY2Aqmao/MOyZLWK4p7FFRBHO?=
 =?us-ascii?Q?vTvGwePSd+xhIBf5O64LZRTUOIoV?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 704de50c-a634-46d8-dd2b-08d8de323d32
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2021 10:51:03.7015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3E0r5UzAyp6J4frd2y1Q4ITTuXcCP1WyXwmZMUAICsQO12u2u3IOiPhl7Kr9jK0e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR01MB2369
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

From: Purushottam Choudhary <Purushottam.Choudhary@kpit.com>

This CVE is about TOCTOU (time-of-check time-of-use)
race condition when copying and removing directory trees
which had very low severity problem and marked as closed
and won't fix. Therefore whitelisted CVE-2013-4235.
Master, gatesgarth and dunfell all have shadow version 4.81.
Hence, this is applicable for master, gatesgarth and dunfell.
Link: https://bugzilla.redhat.com/show_bug.cgi?id=3D884658

Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
---
 meta/recipes-extended/shadow/shadow_4.8.1.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/shadow/shadow_4.8.1.bb b/meta/recipes-ex=
tended/shadow/shadow_4.8.1.bb
index c975395ff8..ff4aad926f 100644
--- a/meta/recipes-extended/shadow/shadow_4.8.1.bb
+++ b/meta/recipes-extended/shadow/shadow_4.8.1.bb
@@ -6,5 +6,6 @@ BUILD_LDFLAGS_append_class-target =3D " ${@bb.utils.contain=
s('DISTRO_FEATURES', 'p

 BBCLASSEXTEND =3D "native nativesdk"

-
-
+# Severity is low and marked as closed and won't fix.
+# https://bugzilla.redhat.com/show_bug.cgi?id=3D884658
+CVE_CHECK_WHITELIST +=3D "CVE-2013-4235"
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
