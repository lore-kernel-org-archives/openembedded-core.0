Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.79])
 by mx.groups.io with SMTP id smtpd.web09.4744.1614854253529175918
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 02:37:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=HwV08GlG;
 spf=pass (domain: kpit.com, ip: 40.107.138.79, mailfrom: saloni.jain@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ajxQypjpa7fq0Mm0L9TzNvJeb6BgnTYmL0VjafX57tR/VwKmRnTZ7lclrQz9Ejos3jIkX3hcJrR5yentZm55/VGUDtGGAJLvG/EAwhVnLWiaewrFLdv/3Z47VdFKeA5QD6HgseTaF0Tf5yZhAG/kr78SDC/p97i0t16LKprikStXNXDD7fL0+TbEVAYsVRChsD8Cf17XY10kIHn0UB/s54jFTcVuFciKD6oBqYmRew/3pe8XSJFeRwf5PpVjFdCD5aXadq3bubNzQx+qp/OwCDaA1cyyOtN7th7/lQiry+mrRrx+cPWsXzPcJG9NOoHUUQDZ48Xki5YkB+azsth+7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HTNBia87TWcyeSYziM2MI7AB2ywkhg3Tyvdh5gqFK84=;
 b=T5nmxFP7gKtMsQ9a8w3i3C/G9GVUsBTpLhlmkPQJywEGikzg52i0Vk1dhA8Sik3y3M9yZ3mrM+NBH4f6GHq9DSg9/rnZzMZzUjs1cs5UlTT3W0GdP9DhE/iCPmi/iAo4ShSLmpbOkELOd5oTIv0T4gj0eSYhSAEFJy2+iTG3wHRpakqVTwH93DDA7JXw3zZ/s1H7yjsH57mmB4AAZzCim4ZfdxY9c8IeYk5l3BuKz2RVTJP7YruNRfwJr8NlzkQ4xNeEGYDSYp6gDp3UOwP9ApXtDJQvyH0/rQSkbVLWbxXWdammBdMJiV1lZAvi58o3hNBjIatdKDBJyNHSZ0nfFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HTNBia87TWcyeSYziM2MI7AB2ywkhg3Tyvdh5gqFK84=;
 b=HwV08GlGbR3rYBwmqn9S8lQ7K07OSB5tVAa19pf9uVcxIK11p16VxQxHRBpyoKm7xTRIgUFbsjcEeBtvwpng2iH7oso1yOrJSdbJ1qLahTX068SEBA57182kKao7XAGvhNW2DnVPCZL9e5MtUjH17RPPQdvllBR5+1jAWTWKpRQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from BM1PR01MB3251.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:7a::13)
 by BM1PR01MB2131.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:47::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Thu, 4 Mar
 2021 10:37:22 +0000
Received: from BM1PR01MB3251.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::f8d6:c7c6:31a0:41f1]) by BM1PR01MB3251.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::f8d6:c7c6:31a0:41f1%7]) with mapi id 15.20.3890.031; Thu, 4 Mar 2021
 10:37:22 +0000
From: "saloni" <saloni.jain@kpit.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	"Saloni.Jain" <Saloni.Jain@kpit.com>
Subject: [poky][dunfell][PATCH] openssl: whitelisted CVE-2018-12433, CVE-2018-12437, CVE-2018-12438
Date: Thu,  4 Mar 2021 16:07:08 +0530
Message-Id: <20210304103708.21368-1-Saloni.Jain@kpit.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [2409:4043:2510:331c:5c9f:39db:d1dd:d8f1]
X-ClientProxiedBy: BM1PR0101CA0061.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:19::23) To BM1PR01MB3251.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:7a::13)
Return-Path: Saloni.Jain@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2409:4043:2510:331c:5c9f:39db:d1dd:d8f1) by BM1PR0101CA0061.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:19::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Thu, 4 Mar 2021 10:37:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: eedd2489-3a6d-46df-60cf-08d8def97e3c
X-MS-TrafficTypeDiagnostic: BM1PR01MB2131:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BM1PR01MB213169FEECC13C9671E1689587979@BM1PR01MB2131.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:843;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ETZ4rTWe9kLwV39iEGohScB4pGcIqWN0pThbXm7loqcZlX9SVSE/zM65d862but7EqU8jTV7nkbEyyiCcDGY5HuOtwWvNcSbJU2+t4GadE0SUQSp4Ua1HixDdw+hkMP2A7Z9YD1ncXCLbTr/cYjWwI1fjQ4bpRnB5eRHJPKCwZ0duDe4Bxg3udFAGiv8N0ezSNgpm0QbEdb4mUj9PsTm8h+58Q/qKUHikTFnaOzgS/NGM+A/Fq4tul1PxekGD6EvEDePJt1S8zp16x/78cWD5msXSPHzIxS2RSxXXT1faM0Wad/VcBxCuorAEzFl9xIYoeMZqkAM4mL7jvfhze45Shmcvz6ENJmnE85UU50ddKIV7k35g1tE3hPRbU6Su8CQMwsbex8YcmXqo/eL8CKpom2L9qOCHn+CWWgaMRkWs8SC2Y4cadnwHlQAT63XdQcJae6joSgRZGkgTdeRqQ8yKp/IO6pXEKbm9VPD5plDseDPXPNyOpejQuiq+XWYJDllNAbMwGmDJbumqD0NwqJj9kbKDuoz0l142/DhVqr3a7oDW/+9PsG9k3mOVihT31xt1u2cWYZAnCHkKWY5T3w6+4mWcXslz8ETugIXN4lQ2C/0bH7giCd78l8QwsgDEziiv3cmTypTvXG5OUCAJHFTQ/G2sFzhkiXP1lZF2VaGO2k=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BM1PR01MB3251.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(366004)(396003)(136003)(376002)(6512007)(52116002)(478600001)(66946007)(107886003)(16526019)(36756003)(4326008)(6506007)(966005)(86362001)(8936002)(8676002)(2616005)(316002)(83380400001)(186003)(6486002)(66476007)(5660300002)(66556008)(6666004)(1076003)(2906002)(69590400012)(66574015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?aafO2AYh6KrMb8M1ndOO9Vx7/S5OBfGPS/fR5Ea61dtvPUsnf2BRo2LfJ7NR?=
 =?us-ascii?Q?J4VcMyAFMo8FU2u1mU0XKMeAt5vRl3XQoRpKx1p0lrG4EpwgDWOs6U3L2qSb?=
 =?us-ascii?Q?Iuuut5ECTdsuZbHYdCYR0WYjYZzn/pWz0zlpjxPAtgcjgHYxfaFtQYQLjGQk?=
 =?us-ascii?Q?dOg3Wf8KpdaUzNWoT8aA+ITqCU46nwB4Dg8I2V/gpdrBlJNA0INu/y0X92Vn?=
 =?us-ascii?Q?EAYhxZAJJrTZh3kPwvvP+mwyhWDEKCzHTzG+3wD/vhqY3EBXXSVlSltizU43?=
 =?us-ascii?Q?5wv8x++aK1PsEK9MsY4wJWjpPnE41PgyBuNtLGotWCDg6S/3MMxhxK6mFbUB?=
 =?us-ascii?Q?cefGMHxXPRQfzuhm9ufbadsG3gzfY2xdzEIbO7u8G2ediJnSjvhKHwhzronz?=
 =?us-ascii?Q?8kmj2cpyPnCE3x2x2rUdHxDI7cQLoqD96M0SI8AWw5D6+qhOgtLYCwc2EHiZ?=
 =?us-ascii?Q?36jGfAt7LJRy5VMrV0MmsJCz3fB2WsNnxwa7Bj0wgxpSI3Q8ZP9KKpY0Eq88?=
 =?us-ascii?Q?7elP0EDEkz/qNNnp6pB/KRSWvq0u0Fv6M3gS9exgPNdmEBW2NB7TqkI9dMeE?=
 =?us-ascii?Q?fLTi2TLzMxkIlt9/Lfj6xGnLInj95I57crvLIt2+OvkLp5XnHt9GwXoxPjgf?=
 =?us-ascii?Q?+jmTbcDfIiDwBt/trYAbb6I21AQ7w6bJTB5Qzj/WMRKA6PTCWDPLLq0z2D1Y?=
 =?us-ascii?Q?TcbXpQvufirSCC9jKbB+mBpIhQcBi97IXikATOaG1o9XWT2aMD+3vezMObDV?=
 =?us-ascii?Q?wLPvJuezvN6ZiyCLQy6MNMXQpQwyVNEm830ACx7XvMlixLC/Ij0VkG00PW5h?=
 =?us-ascii?Q?h9Ynn7oWKcozmFS7Ixy25fvicWame13blwY4h1dFMtVr01sTNXdOad7yzJR9?=
 =?us-ascii?Q?pUM+OrtVdW1eKShgih4yRzKqoXC7P+SEtioaNoar8rjKoD0OF0/9M2Ul4TTJ?=
 =?us-ascii?Q?UcOC1n9uXLtA8yysRuZaNxJOp6cd34bvJkDRIQ4uNZuA6FeiXtm6rKke8yXZ?=
 =?us-ascii?Q?kYBJG7WkOkcCpmBaijYCVF07fegFvzqxl1LxFc6Ww3PuaNy5vSy/3yzDUz8X?=
 =?us-ascii?Q?XLvZ1JN6S0trk4tEh/VFlYT/8eEAvxemqTeQIOZDevZtNzwXZJt6THqPhdyo?=
 =?us-ascii?Q?ObTHBXAQTZNttlKNSwbrJRIZFtwQTwpO0V4KADEmCsAJanuhqaY6nPBnUCPv?=
 =?us-ascii?Q?mRyjVsdw6iNnB+bmYdXDp9kcu9Z+UzVjYzJW33lAE10k3rgtCrLuznDs+kCR?=
 =?us-ascii?Q?Sm1wbOJZ/pJGqZap3+U8F1Y7XgJKw7zoCV1JybQABo4rj3vtiJKNuGdV+unn?=
 =?us-ascii?Q?zIz1yJ2fVtCb21IW4iQUzvDcPgo0YwR9e3nfD44OJv+n1wYQEIV3/KVuHZsQ?=
 =?us-ascii?Q?aZvzP3XhOR6saM+FZmWL5YKDFoHT?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eedd2489-3a6d-46df-60cf-08d8def97e3c
X-MS-Exchange-CrossTenant-AuthSource: BM1PR01MB3251.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2021 10:37:22.1512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vG1C6cYGCWUXHh4Covi6GlA0RPCGtuhZuDuNI4WEburc3/oCaAThNYudPomV+S1x9FsKT3LVFS2HI0lUr5xHSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR01MB2131
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
