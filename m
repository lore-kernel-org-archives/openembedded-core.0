Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.61])
 by mx.groups.io with SMTP id smtpd.web08.6055.1630492240348501591
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 03:30:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=mglI3o2P;
 spf=pass (domain: weidmueller.com, ip: 40.107.21.61, mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hM1t3I7aMrCsxaM9o8BkFE3tYLtB8hdB6MmRcDHau6tcyKkSr4KEJQ9SRstehyKAGAdfJRvRpdme4AhpmZqaOpbv4W3GbXeEbh+YRc8wqoLSOh91W05aCMY/9hOA2XLpexn60A7GIDRRLgQiNcYCyHFDPTj+TGeUHVgQv0SoQ1xFcMhU+B6FnJL3aYcaiLsZTAOES9BWf86/c9evuDAyVkkEUyhq/RiQkncujqEWVQklvw1MUQG1Aaz/tAmihXQg+lq3UCGMFAjpqPMd+Op401cw+UWDCewkOWSF8wx0b9ooRtFCLnUNsZPx79dNs2DEnfq/N/q+ZiZJvQHPLWggGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=HAAowJHIhHUVEIEpHrdrFHKvTNv4Bh68z5XoLV0CkTo=;
 b=h60zzYNvv+I/6yD0Ee1cWbJBpd+oRtYbJAq1d+NPEwSL5PIw8Rfsl7bpwpPyqznpjqBOssNM567e2uVZ/ddkDQ34kKrEaXJ2JIXum0zP10Kqp51f+xCRsaeIbSVXyP3ebEsJps1WdztTvos1lz5a/F1RVv+IRQtAxf3FhEd136TF1sDnmkI+JxFwvebe9v6eNJL9JzW2htapJC+/ej5eWP/j5GivyjH5P7uDBqRlMJo3St8wk3pJHyWWVKWc4owN9wBQRTJ7tod9m/NM+v7z+mDPxYhRFG4vvpGjWxaJVQuvE7+we0ap/6z7p6CgudikgS+le43PVKHiYHGdniomkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HAAowJHIhHUVEIEpHrdrFHKvTNv4Bh68z5XoLV0CkTo=;
 b=mglI3o2P34hQ1YwvDvGEuiPQJLq1b5ZutR69/oAOyk2l2dz6X7Optn2ltRnvb2+OjkbCg3znqCh6OXl/8OPVvdV7KPJk6QDXxZNjMl6F/Rw8KpAKY+bbEfXFG1O4dfgiY9xZj56On7sHeS47UBYyCx8MJzhgRDLcH27RX19+w0Y=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=weidmueller.com;
Received: from PAXPR08MB6735.eurprd08.prod.outlook.com (2603:10a6:102:138::12)
 by PA4PR08MB6207.eurprd08.prod.outlook.com (2603:10a6:102:f2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Wed, 1 Sep
 2021 10:30:41 +0000
Received: from PAXPR08MB6735.eurprd08.prod.outlook.com
 ([fe80::41d1:d9c4:c030:ec33]) by PAXPR08MB6735.eurprd08.prod.outlook.com
 ([fe80::41d1:d9c4:c030:ec33%9]) with mapi id 15.20.4478.019; Wed, 1 Sep 2021
 10:30:41 +0000
From: "Stefan Herbrechtsmeier" <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH 2/4] u-boot: Remove misplaced configuration type variable
Date: Wed,  1 Sep 2021 12:29:52 +0200
Message-ID: <20210901102954.4629-2-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210901102954.4629-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: <20210901102954.4629-1-stefan.herbrechtsmeier-oss@weidmueller.com>
X-ClientProxiedBy: PR3P251CA0006.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:102:b5::24) To PAXPR08MB6735.eurprd08.prod.outlook.com
 (2603:10a6:102:138::12)
Return-Path: stefan.herbrechtsmeier-oss@weidmueller.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from DE10512.weidmueller.com (89.247.126.241) by PR3P251CA0006.EURP251.PROD.OUTLOOK.COM (2603:10a6:102:b5::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend Transport; Wed, 1 Sep 2021 10:30:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f146339-5c85-4b14-7625-08d96d338c5a
X-MS-TrafficTypeDiagnostic: PA4PR08MB6207:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PA4PR08MB6207E8DDD592325F1BE4C9A7D7CD9@PA4PR08MB6207.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:288;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4Ga/CHkOMM7ZexkZMawLEI5Tcr5rkspNb0I3olexRXefQkKm446+gheLwpERm7ITu6lb1arVzCPXx8fOfB/oNilux1owFB8KPfQfDJXweEJbB2h+GwIsH98sq1NCTBC/qFkdobUICER3oL8BRZ0U4TGws4zPuYuwDVD2WjxcqrOuRgLD8o88Qq/AS+TlDm1lX4qt/iKOh8Q6WA0mS7fMwCyW6adm/z2PiUAJpVm6wZd1lj3Epedq9gn4sSIsmKAPmlxy6IIFKoZhmT7xu3vVBLV6wSFs6m9DPJBXr/jET4EdBGQlEF3hBSitRJCUhw+GRg+OKrkXxVbUMb3sk/OavHUaJ54cg8KZEkEV61VWT1/qBBlDyZ0ASbr9TzeHdrJxhAdhgS+yFM4mjHuUqJvnQu7Z8E1GWwIPD5y7mEM86mWPvpn7o1vr+G5R5gNg9sm99kvL0IAtvcvjBrcmtoMReCRnqfwBzHhHSV18D4NZDTBaqiyuXMSCXuyER6qDEedd5UoiroZy1X7YOpRwzofOHnojwzaJXxK4Zn8dYwQ29ujtIaDzWBIm05oe5hs9yNzEmdELdVK60zkod90PXcYiD/pmS5ovLEBQrvW3rL7XslqJWsWw0s636x4hjlUQ9ztReZMbCz9MhUsB2jTJzZKW+FGGH04jbUi9aYqY/VG/210gzvzkSCTYPdPz3F0uodrR+fDPuNeuimKdbZjvefZk0Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6735.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(366004)(346002)(396003)(2906002)(478600001)(83380400001)(4326008)(86362001)(107886003)(36756003)(38350700002)(38100700002)(52116002)(186003)(7696005)(26005)(4744005)(316002)(1076003)(2616005)(956004)(6666004)(8676002)(66946007)(8936002)(6486002)(5660300002)(6916009)(66476007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rNxeI/4SRwpVmF5XAJDCbWoKNH80JcliWNLABE5w3dSFJ5BLXomALROup0r3?=
 =?us-ascii?Q?dBjTLhpN14ZSErbXaoRn3ZlxEeC2X0hexoqVQZXiLu6Q4CkzFdTonnwCZG/2?=
 =?us-ascii?Q?FofrBAJh84jLFjED5pOBBmCwsPqSjbAtP+tXEf6/5Vw6qZx0MBANLXVGIcIp?=
 =?us-ascii?Q?yjfUI8F8bPjmUcJmpbqV0jmoW8ZRnETr0P7vknKuGk/m4WyPLO4BMhU+6FTv?=
 =?us-ascii?Q?8sZj6byM+/4BKP1SAGmr/9dtxKdADdAmeUm7hMl5cUhV9+9O+UG1Nvuui51I?=
 =?us-ascii?Q?3GB8yjntdlOhCSW9J+tSoJvt2gIuiGzn6ASMWqWD9r4HmzeZEfUlI2Pz5CCv?=
 =?us-ascii?Q?gKfzemm8+LbpclBYonvyZXnLsSOget/v4s0A141rRtlHYaTMvAmI3H3wG1y9?=
 =?us-ascii?Q?PtWyNHQOTU4IlPN3xZ2JAi3yCLBFnCJqMMxEVKuzJ09CF2AMMgt0D8nEtcNe?=
 =?us-ascii?Q?BzZRcKFiJ4bEYmbXi7IM/DFm3BVRsNAuo9H/nv43OktgAbKDWsIVLokmOdFH?=
 =?us-ascii?Q?YNm6XaW1Cj4lqpu7oZtQGm35wKkiMqXCGyYrrLhX9QIRLHn2sUIjDhoSEAat?=
 =?us-ascii?Q?79DJ17Vva4D/oGxf2lSxo1YHW/+s9kpwvCLsI7V0PtF4WhPGIBnv8E29f/Bf?=
 =?us-ascii?Q?Mn8/MwdG8t4Npc5cX6iR2kFFI0dvxDeivT4e6dc/tMUpRuGWnpHy2qxO2laI?=
 =?us-ascii?Q?HQ4jYJGzA1dsyyAUzLT2xg82k22fH7tm54TS/Ie9JiXFu0CDb3/n0h+HAI0R?=
 =?us-ascii?Q?jc+D7yMB/+QcYH6OMvAQS1/RoxyAc+Jmq3zZBoYWnnT69ANAQEp6jJTIFgHB?=
 =?us-ascii?Q?Z0rO+ZZ9iWPMooizBMRgfqIuLIPeTiz/gowJXsKe6jPCz7pVnvNDFlpjZ9RC?=
 =?us-ascii?Q?Y28N7ogpJ+CIX1LAs/M7igI3oDPO64w9aF5gv3Ai0ZjYTq/M1WQmYXWf8vyb?=
 =?us-ascii?Q?QLYQkxTZZ+f9cOz1u6fDya1N9KvFCg6REpD0y/r+BAaPA6IuDDinFD25MU8P?=
 =?us-ascii?Q?TR56ZJGGE5LxfkMcCuyZOf96bqx0T9GqtrN6+gueyFpuBd/IY/1Msry4LKmO?=
 =?us-ascii?Q?WXMtNige+Z1GvZdhaEfYi27uEfS+g4YjF0EVC2I9pD1Maxyzxy6fU8FR+fDp?=
 =?us-ascii?Q?AiMXTkpE0lVCZWfVNCL2Sw0vbAPnRCbXGOzlsobrFOlMWyIKMS86OAsiXCKx?=
 =?us-ascii?Q?AbmC/J6jwWLiYhCCiLC2K/wI28vRn7FRkGL76sEdlVLkW5dsSUyG9JjYz6si?=
 =?us-ascii?Q?GeBzJyjRB+GzqlWTHpI2xfroAYSJ0HfJGKqBNGtthOYfJ1hREv8Z8expMHso?=
 =?us-ascii?Q?DFE7iNGaYA3uKcRqLFQm0JLo?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f146339-5c85-4b14-7625-08d96d338c5a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6735.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 10:30:41.6169
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YwR/0EoLBXhRuge64X9Ts+bN1ld3giwUhHWEUr/WAxy+6QKUBHh0mqTi1qOb9CbVWEDjDpl28euQPyrRiLa1hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6207
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 meta/recipes-bsp/u-boot/u-boot.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u=
-boot.inc
index 71febb6f43..a8ebcc9ea0 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -316,7 +316,7 @@ do_deploy () {
                     if [ $j -eq $i ]
                     then
                         install -m 644 ${B}/${config}/${SPL_BINARY} ${DEPL=
OYDIR}/${SPL_BINARYNAME}-${type}-${PV}-${PR}
-                        rm -f ${DEPLOYDIR}/${SPL_BINARYNAME} ${DEPLOYDIR}/=
${SPL_SYMLINK}-${type}
+                        rm -f ${DEPLOYDIR}/${SPL_BINARYNAME} ${DEPLOYDIR}/=
${SPL_SYMLINK}
                         ln -sf ${SPL_BINARYNAME}-${type}-${PV}-${PR} ${DEP=
LOYDIR}/${SPL_BINARYNAME}-${type}
                         ln -sf ${SPL_BINARYNAME}-${type}-${PV}-${PR} ${DEP=
LOYDIR}/${SPL_BINARYNAME}
                         ln -sf ${SPL_BINARYNAME}-${type}-${PV}-${PR} ${DEP=
LOYDIR}/${SPL_SYMLINK}-${type}
--=20
2.20.1

