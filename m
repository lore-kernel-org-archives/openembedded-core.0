Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.82])
 by mx.groups.io with SMTP id smtpd.web08.32478.1615183173493472010
 for <Openembedded-core@lists.openembedded.org>;
 Sun, 07 Mar 2021 21:59:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=P2JRGdXD;
 spf=pass (domain: kpit.com, ip: 40.107.138.82, mailfrom: sana.kazi@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BqoPgAB6tzogBwVUPbzgetVMOxSsN2oylDqZzXDLcNqnRWUN2ohY45kKAhNmbe0Zlmf19riOSapm5ag9q+wRwJSkBMBdjbXVv1alTkRoJ2ig+HLz9F5H7kptc4taluje8Hr5PZv4LHPlaWVJEZ9r5SJG0h1n+3vDUUjvSpH4mJ3p8qi84Cuk8k6HrowSHOG4sImDcq9wlWANI22rmZzkoN4xoMm/LofJoqLYMHWVr/avTN9fS89XvRSNxgZm23a4u6slfvYnXM6lUxJ88eEDj9B/SnVtEZTUF7Q7zwlzCX4UzN3IxtOFvLbMXdhjUtp8H3iu3QN0aRUWz/52FJLh2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V0TfcSzrKf2O7ot70zdURv3sdAEJBxOG+qke+yAqtDY=;
 b=RLb98WMyIY+hfTTMV4riFwYySG0LiwFJK41Qu1dT3xwawec4xy+ShIC1MHKxiBkKx+W2J7B6RhJRIPF1KivmHy2Qwe2q0F25DJKuV3SYW2x3h5PMR1QWQvq78TBjQJUm5CW/v1gMhYFBptTulwbgF0qSwiwwVRfUjLvLfzrfso9RY7bf6W23IYA0nCcJsmrF6B4aWa4ERDW2uOerl8YBpABAr6dpl0FWoXRXJVceJ1ipoBc9/8wuK0YOHIf2cJw/LFQ+dQa3eOAk3MTYh6Sos1V7YMa3xeed+k2Td1RwfIXcEjIRoOHNtYwONSAJhtc1FKK4PfGb9uCAXpEWC1//ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V0TfcSzrKf2O7ot70zdURv3sdAEJBxOG+qke+yAqtDY=;
 b=P2JRGdXDnGENhcQiQHfp5mAhv/pAb/g+G9kctwjHADegwr7PJ2l7tX1F8cqVo9IjSbzrIT6p5oygNmv3W1qQ/m8IuQ0WPzt16AguRVF2FzaI9V2BWpUGat1hMZUBT33KdhnjLMpjqDArqBk9iFpb8wXZz4H5h2lx7tn03ERHhSs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:58::17)
 by BM1PR01MB3108.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:45::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Mon, 8 Mar
 2021 05:59:28 +0000
Received: from BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::6922:7ba0:39e9:85da]) by BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::6922:7ba0:39e9:85da%7]) with mapi id 15.20.3890.038; Mon, 8 Mar 2021
 05:59:27 +0000
From: "Sana Kazi" <Sana.Kazi@kpit.com>
To: Openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	Aditya.Tayade@kpit.com,
	Harpritkaur.Bhandari@kpit.com
Subject: [OE-core][meta-oe][dunfell][PATCH] mdns: Whitelisted CVE-2007-0613 for mdns
Date: Mon,  8 Mar 2021 11:28:59 +0530
Message-Id: <20210308055859.8945-1-Sana.Kazi@kpit.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [2401:4900:1b37:d4e8:5473:ab72:67ef:ca3b]
X-ClientProxiedBy: BM1PR01CA0147.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::17) To BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:58::17)
Return-Path: Sana.Kazi@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2401:4900:1b37:d4e8:5473:ab72:67ef:ca3b) by BM1PR01CA0147.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:68::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Mon, 8 Mar 2021 05:59:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ac818ed7-077a-4a12-ef93-08d8e1f754d7
X-MS-TrafficTypeDiagnostic: BM1PR01MB3108:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BM1PR01MB3108F2A0A7ACC5D640ED910F99939@BM1PR01MB3108.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FTYEWXSbkA/HiR+0BnWe8bs77jw9jtqq2s+ySWUijxZSkUfmvq6mzRsfTDdfV5zCoy5+/wcnfOoVYOTC8B5thuwbNP+05/nVzbSMxGy3eaw0pfCRmDLM3Vr4EtFZd1ElFzSU0r9YcTcyiTLHJUrZQfES67CIzcQKhnElZlDHPCMABvzW6f5lYwieR4QHFPn5/zzrociUYUz19XvQOYJG8+F9HRV/yRij22Q6MkTX5Nr80RUpT6AR2HtoZwgw96qtQ5ze+6cn4tQ/OC41GFWIy28/sbOTxzjBxS3FFrepD0X6kFrpcdr5bDSqC3cCp3k0hPbBRxRSlmmXtrARmqf9qYfgWaAVDG93Z7DOeSwR3CDA2vxmNaMW/s/yJ+xIexWDNnHGycZ2RLpL4Oj3yrEHBsyztJ79/XXAXdAoh/AjBxgCSNpWdnpR3v1CN52jMFZJyXfQstirNjCqqsnCg+heWK/M9DZ06MuV7qGuqQApHhXGzJHSCDWUjQmKQMDv5GTECchamoyC1UI03mcsU4Sc+dgYleqEvKbE24yTpxi4Y9f7rUScN4qMs2aSEZAZ9at48efGV1yfoXHY23oTk4yoxKTGAxJmXwb/1MrZsJLnrwXztUsJZEJmlHsoi/FxqKqL/sQpUd7pcLpA+DDZu3llKA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(396003)(346002)(39850400004)(2616005)(86362001)(83380400001)(2906002)(66476007)(316002)(66946007)(69590400012)(966005)(107886003)(5660300002)(4326008)(478600001)(6486002)(66556008)(6666004)(1076003)(8936002)(6512007)(8676002)(52116002)(66574015)(6506007)(186003)(16526019)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?kYQDvH0AwrqbK43sOnvRTfMCNUpx8QTUL+egNaLPZDeQZraw5YtWuKYvPcfn?=
 =?us-ascii?Q?xWgfZ/mr1GUtBqiDQZz0DU+oKg/aCw5xivsMY7lHVZzI5sjec9+RCd/GWyu1?=
 =?us-ascii?Q?bI+2kddwH5vFYsvf6VhoyK/NJWG8iagbdLIGSjcu0QhAXUAhmQDJUsDkz0TE?=
 =?us-ascii?Q?ybiWgZB7M2L/+YMPepoEpqf22zZNTWmRAWEQ9EFunQutHOFZoJ5TC753WaDs?=
 =?us-ascii?Q?PIVKxSevETsHN4HNy8Wun6sSJDrFrpyiJ8sDCBsRjvVhhhWesiim2AO6bNZ4?=
 =?us-ascii?Q?DbrZxyp2INOxk5FVA54j/9W6xnQ2wAbDw8VIFBER8l4hYuT8CRo/jS7pZTL1?=
 =?us-ascii?Q?JWLTutaa0TC5iSKLAHgrQUvoBB5Venidz6QsnReWkqAsCTstGqpKa70d1R1N?=
 =?us-ascii?Q?cWrImYT16ywpOAQwAaCjWy//5ovewykib3ojJ3rJfKqK70BtDHPWqhWfIk3A?=
 =?us-ascii?Q?o7DUlQu75HluPsEm3FcotwGEdLQJu/Ksm45GSIXNy2fZQEhqm2l6ncFAB746?=
 =?us-ascii?Q?oUmXeAs2pOX0qblSohXasPxIANkbdVXdLaQTj8NrvDQ4yj2KIbKAfUvWdiW1?=
 =?us-ascii?Q?8P+mhgHFEQUoiUhCxR2tVE2GgEB8qxFqeHbVGlbGiHKTPXTr+5Se+g3QhBp/?=
 =?us-ascii?Q?31ks0V6JF1PFtPvpsJn5K/HMnPDZoGH3t1ZVLXTR43Gu0eix5W7/KaF8++PT?=
 =?us-ascii?Q?PofjFRo5siAowPJ11o+2jDQGBIxENh58w60RfsUzeBw5HMp8TWGM4QrSQFuu?=
 =?us-ascii?Q?2xQ8P7ADIgn7yegDTuu1qVo8xmekH5wxW+tJMCyUTNWpCrQOYJ04Ccn+MGz3?=
 =?us-ascii?Q?ym+28iIsxq0b9n7PSXmHWP9DOjTX282nfqKKYUPMdf5/LoKFnIudLQPq9n0z?=
 =?us-ascii?Q?qzpvoodJ6EOr7aW39oCixNCTtMH+ytLcOs9Y+Ecpn5VValm24wa0x+e+ZN4f?=
 =?us-ascii?Q?kL56F+e06SkykJIQSHEwoAAHOzKkgh31qeQNDrix+7H7XF464PNvKIE5n1TZ?=
 =?us-ascii?Q?ROQbLCP9c/U38chYmQ1x6I+gpfro6UQvQAxGGZKeNG3j6Jp1Fx1Dr20eDkCr?=
 =?us-ascii?Q?q4LwwT0m8TXF9o7OKgST8WOXjZU5g4TVDh8YFnhB5teD6Rdb7vSf81kcRSHz?=
 =?us-ascii?Q?+j0UdcAuj6/0kJbDjw/3lZdyu3kfidth+sNKUZZ+cABgSjN3Y0lEmrNvwMK3?=
 =?us-ascii?Q?B2R1rlI2Tw2RdxmIBScThHLu1czMlJrkl8V44kbg/PR7JA5VCiPJ0FAiBiOU?=
 =?us-ascii?Q?LtFqnT19u7yZvxpUVLq/oTCoc/5xFQmsEuhk443mbSlaeczVZmNXq5H12dP9?=
 =?us-ascii?Q?1BKqlUPvvokk3gZXEQsdJ9syXugFX5HbsOcqOK2We+kT0ptb0ITIldJFmk91?=
 =?us-ascii?Q?wbN8JHZKgStu29aJctzp4Xh/m0Sb?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac818ed7-077a-4a12-ef93-08d8e1f754d7
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 05:59:27.3922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OImpM+apc9guqOnZVqBEokJmrYURaUpOdfG7gchVrpi0xY2YZWRXfGn9f2s5RZsd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR01MB3108
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

CVE-2007-0613 is not applicable as it only affects Apple products
i.e. ichat,mdnsresponder, instant message framework and MacOS.
Also, https://www.exploit-db.com/exploits/3230 shows the part of code
affected by CVE-2007-0613 which is not preset in upstream source code.
Hence, CVE-2007-0613 does not affect other Yocto implementations and
is not reported for other distros can be marked whitelisted.
Links:
https://vulmon.com/vulnerabilitydetails?qid=3DCVE-2007-0613
https://www.incibe-cert.es/en/early-warning/vulnerabilities/cve-2007-0613
https://security-tracker.debian.org/tracker/CVE-2007-0613
https://ubuntu.com/security/CVE-2007-0613
https://vulmon.com/vulnerabilitydetails?qid=3DCVE-2007-0613
---
 .../recipes-protocols/mdns/mdns_878.270.2.bb        | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta-networking/recipes-protocols/mdns/mdns_878.270.2.bb b/met=
a-networking/recipes-protocols/mdns/mdns_878.270.2.bb
index 0f8dc92df3..ce31233264 100644
--- a/meta-networking/recipes-protocols/mdns/mdns_878.270.2.bb
+++ b/meta-networking/recipes-protocols/mdns/mdns_878.270.2.bb
@@ -26,6 +26,19 @@ SRC_URI =3D "https://opensource.apple.com/tarballs/mDNSR=
esponder/mDNSResponder-${P
 SRC_URI[md5sum] =3D "4e139a8e1133349006b0436291c9e29b"
 SRC_URI[sha256sum] =3D "2cef0ee9900504c5277fb81de0a28e6c0835fe482ebecf1067=
c6864f5c4eda74"

+# CVE-2007-0613 is not applicable as it only affects Apple products
+# i.e. ichat,mdnsresponder, instant message framework and MacOS.
+# Also, https://www.exploit-db.com/exploits/3230 shows the part of code
+# affected by CVE-2007-0613 which is not preset in upstream source code.
+# Hence, CVE-2007-0613 does not affect other Yocto implementations and
+# is not reported for other distros can be marked whitelisted.
+# Links:
+# https://vulmon.com/vulnerabilitydetails?qid=3DCVE-2007-0613
+# https://www.incibe-cert.es/en/early-warning/vulnerabilities/cve-2007-061=
3
+# https://security-tracker.debian.org/tracker/CVE-2007-0613
+# https://vulmon.com/vulnerabilitydetails?qid=3DCVE-2007-0613
+CVE_CHECK_WHITELIST +=3D "CVE-2007-0613"
+
 PARALLEL_MAKE =3D ""

 S =3D "${WORKDIR}/mDNSResponder-${PV}/mDNSPosix"
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
