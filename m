Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.42])
 by mx.groups.io with SMTP id smtpd.web10.3572.1612496444448538641
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Feb 2021 19:40:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=LlMF+1P1;
 spf=pass (domain: windriver.com, ip: 40.107.92.42, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f6fUUn9tEcdZJevIoQ0mUOniXcu1ANCSkv8ejqrCaxqM9Vgve3fwCs4aft1VGvLoJvTrQUrAFFC6qsFkzCdOO0B2PstJzdzIzqQwngM1QkQ7Eyexo67VYpSVj6D1n+fD09/tJGYUVBs61awuJ+toCtEmWX37lzk2lEc5PXzFcDW9zfrOsZMCw9tENntRnkn0OG0hTC7ygeQ9BwyQOnzYfRtBC6qiPj+tjvo8T5xHntaKxFaZ+xZ7RH+sU9mv+NrN4RK+8Pb2ucoHg+G9Hn9fN27VudXGr/5k3h3I6CuIW7Qnegaav9cHWKb5/ow+74gnFBlaWakVKLlThZrcPFtzww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m+q0Vo7EER6p6TqIP8oMe0Bn13pfoYNxFR2ItFz2Avg=;
 b=ZMp9FBtsFMa9f4nn0fwn1JlJ/VoF/z0sLNZ+8BE0nIktnOzrSndrR5KkJcy7S2TyShk10PTb871AtrQS6gb9H+JTupPu27HtMXwivFXxQgZ0OZkw8bOeaiUWAVkGb0WMYYwuIApKzwqFsdTqqTfpBKfCDo3FwFnVOSrPxgwwaSpekBhBPP5MhRIbE0TcisJnUlqLTeokp7IavOMS6bsuKGlEHK9ySzPLgoQWPN7xr8raLhIh9lq2PXOAAOYpOjzmkDqFIlBX1PpwODR9i4lWNwfH8NajSnmQQwJGVUlNnQmfC+PvXexSIA90KcC20nXJymPqst6TBb7km1hbQ0IFOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m+q0Vo7EER6p6TqIP8oMe0Bn13pfoYNxFR2ItFz2Avg=;
 b=LlMF+1P1WcNIfDfw/enNplE7SE/Oz+hVmCtK6wMJ4mo7PYyxIPwvRqAZi4A47gDuHqlObkFGCkJGb/fmoANkznQDtuQx+kAgDL+iH5GGszkJbHihwAExhzsSMJD/8qBJhbWsKTDZZckfdsjO8l9ujJCrFdYTpYu+eDppRhqxUtE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by SJ0PR11MB4942.namprd11.prod.outlook.com (2603:10b6:a03:2ac::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Fri, 5 Feb
 2021 03:40:43 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::d9b:3f7c:136d:e60]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::d9b:3f7c:136d:e60%7]) with mapi id 15.20.3805.028; Fri, 5 Feb 2021
 03:40:42 +0000
From: "Chen Qi" <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] systemd: change /bin/nologin to /sbin/nologin
Date: Fri,  5 Feb 2021 11:40:28 +0800
Message-Id: <20210205034028.28169-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR03CA0052.apcprd03.prod.outlook.com
 (2603:1096:202:17::22) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HK2PR03CA0052.apcprd03.prod.outlook.com (2603:1096:202:17::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.10 via Frontend Transport; Fri, 5 Feb 2021 03:40:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad57ee3e-5c01-4b36-56ac-08d8c987d04e
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4942:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB49421D30C168C0CC9FC8E1DCEDB29@SJ0PR11MB4942.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:324;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EXDiHjYofDowzy2PZa0hU6Epy2ms+jYq+3egCSpKg6WfQTotGp6YWKOJ1MTK0Dd7HiJbM9R5+IkqXOeVxfcrxyhuB3yoCcd5c9Ggs48SunCmxICkN/s1N382dIl5l74GV+syrjeV0Ywfpc3aCRWTuo1e0f/bqBj5n7ByXs7K3NWnufGzo8o0i6wjYbiRdFAKNviGF4x/mezl1FfoXx9jB0EdZV24zjRoGw+8lm6UBTk5oRZmbdSXQFXm8yyfVPkADVz896St95umMEff9uMlezh5zJ3TurwsQpsJFvRuZZi+x/FuD2Z4U/wF/NKn2xl0CPmjZSHrsNKTIStBwmWEq/A+yz2cAA8OV5QVgchx4EN1ZyxMqqeI2ZuxvxzQe7SzuGUWlkwUZ9tgspJ6WD8Lfuckuz72Gk9tz9miwwr4uj4E5mkyO9ot0JOaRlxCNFKsPQSdpZw531vJQSHDLnhzH4sDqHgUE0aRmehCmXK7L5VnVu3VqtohILsxR6lE+vr+LHpzG7doQK4B7g0/JBwsuw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(366004)(346002)(376002)(396003)(186003)(36756003)(2616005)(5660300002)(956004)(2906002)(8676002)(16526019)(26005)(6506007)(478600001)(66556008)(6916009)(316002)(6512007)(6486002)(8936002)(66946007)(66476007)(52116002)(83380400001)(1076003)(86362001)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?uF2rMbKiFDze1y1+DVvZVM6pRqXhw0+jfcQUSTaq3A3aXZnSQRCl4eemY8L0?=
 =?us-ascii?Q?z1dksqKtBOUilfrMUBRHaxje8F1U3K/J7EIzJGqpYlqJAD7Zix6EYZ3ylf6j?=
 =?us-ascii?Q?d5qrTx5m7BlAeMMZHOXHdsi2c8USprW0ngywUq3t/M/rJSlT8/9mYgpsFVGs?=
 =?us-ascii?Q?fAqJHk+wd7E1KU7vZEvZMXsSkvd7yznLe3XOp5qNGMi++c8ehhRJv8NwPQfd?=
 =?us-ascii?Q?a9Z/daIGM3d8s5QZWmYkRLM9q8jbt7CogZSJDpUMCseTfIf+zGvfdoNUaTj2?=
 =?us-ascii?Q?A/Qg8i+ltyXuOPAquwF3WuGr3DiGf5mfYMd3PntwLBEE+8b2rY4cg8NjK2fh?=
 =?us-ascii?Q?qgAoorETLEgAACC9awOsmtLz4HLESyZwNQqGbTTJSxrIODC0s7oQDst1inir?=
 =?us-ascii?Q?lMMNYi/BH+AGeCzhFk1NJI6f0GxqiEbfR82IPCNyVdwHEPCTVOZdUbqmNYsn?=
 =?us-ascii?Q?Oy7eE9w7LMEtcNHsQ/oGacfFAZO1uFy8upG0/29AqloDK2GdZwUqpa1GdWpr?=
 =?us-ascii?Q?eDkx5og7svnBiN30oqwHCR5+ec2RB4e//W+qkgEL/oaNXsJWMYpt25AikJ0h?=
 =?us-ascii?Q?J9CIxus/EzPn5zHCkuFnEJiMDECpob5Q7iGhsYEjflkmxjm9NSaqD3B3Xk8M?=
 =?us-ascii?Q?N71Ye2eWISB4MLcbIQWu2btfsDjIH8XgU4MOsMB7Yyx/OA06PQEUo87+0rSR?=
 =?us-ascii?Q?lAeSP23W98RhizmiuUCPcQYdf9+HkO7VHxsI3YuN0vHHOBjLwcZA/uuvda8M?=
 =?us-ascii?Q?Dh2Sypwxb5A9RfIByvabZRnERdr2rJ3DZRvQPTl12XJayUiYHj6kv7xZmpuw?=
 =?us-ascii?Q?PQ9h0qNwsgvEjmSPXrHQyFSEFAYlu+eaXlX59Ft7rnOSqLVXjlp8dfGAp31/?=
 =?us-ascii?Q?NhTbs9DlojgxYWP5DVusjlgRO1pQ0wj5jkq6kFFPdmAqFv7LOLAvO6qHDx4k?=
 =?us-ascii?Q?HgSeP0tllG9RixXV92R0OSQk7XhkJdbBICbkDeiIJX9Q9Cnn+YUEYuhqXgnI?=
 =?us-ascii?Q?JAI8QNmNtcD5pksWjt1EuzJdCnRiGAMX9lcV2J0zL72CU0vth12SQe+Sfo63?=
 =?us-ascii?Q?x0wH/dY3jp42+4+3WHIYnacA+F4LXgQE2tceH6e42gbTqkh8JXwUEPZcHNzd?=
 =?us-ascii?Q?8OmM20bQZPq9RPbpIDPQqOzjTep3+gIw9AnSc0mGx0ryOAY5gVF0aGG087ZV?=
 =?us-ascii?Q?EHNuzqey56jxYM+vXJ6EohRQIUeHy7Eo7Qve2RuGObfwNMRLplBb6Mj98/3x?=
 =?us-ascii?Q?Vlz+VNx0YPwiMpZSKZ0dKPXFu/hDZ61gXCXA2s37RD4vemZop4JriwRwR4Ng?=
 =?us-ascii?Q?Z2PohEUc/TJxIiNw1WJGLCSn?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad57ee3e-5c01-4b36-56ac-08d8c987d04e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 03:40:42.7836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 29XhTCNRk6MmSvZaXJWvWnBQruAoJXxKjTLn2n4JpkhlfQg7E/pQKPYnbmt5Bi1+UoGgwYL2YFpVegloPzteFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4942
Content-Type: text/plain

Our nologin path is /sbin/nologin instead of /bin/nologin.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/systemd/systemd_247.2.bb | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_247.2.bb b/meta/recipes-core/systemd/systemd_247.2.bb
index 6abb27747a..acb9e53a37 100644
--- a/meta/recipes-core/systemd/systemd_247.2.bb
+++ b/meta/recipes-core/systemd/systemd_247.2.bb
@@ -375,15 +375,15 @@ USERADD_PACKAGES = "${PN} ${PN}-extra-utils \
                     ${@bb.utils.contains('PACKAGECONFIG', 'journal-upload', '${PN}-journal-upload', '', d)} \
 "
 GROUPADD_PARAM_${PN} = "-r systemd-journal"
-USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'coredump', '--system -d / -M --shell /bin/nologin systemd-coredump;', '', d)}"
-USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'networkd', '--system -d / -M --shell /bin/nologin systemd-network;', '', d)}"
+USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'coredump', '--system -d / -M --shell /sbin/nologin systemd-coredump;', '', d)}"
+USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'networkd', '--system -d / -M --shell /sbin/nologin systemd-network;', '', d)}"
 USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'polkit', '--system --no-create-home --user-group --home-dir ${sysconfdir}/polkit-1 polkitd;', '', d)}"
-USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'resolved', '--system -d / -M --shell /bin/nologin systemd-resolve;', '', d)}"
-USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'timesyncd', '--system -d / -M --shell /bin/nologin systemd-timesync;', '', d)}"
-USERADD_PARAM_${PN}-extra-utils = "--system -d / -M --shell /bin/nologin systemd-bus-proxy"
-USERADD_PARAM_${PN}-journal-gateway = "--system -d / -M --shell /bin/nologin systemd-journal-gateway"
-USERADD_PARAM_${PN}-journal-remote = "--system -d / -M --shell /bin/nologin systemd-journal-remote"
-USERADD_PARAM_${PN}-journal-upload = "--system -d / -M --shell /bin/nologin systemd-journal-upload"
+USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'resolved', '--system -d / -M --shell /sbin/nologin systemd-resolve;', '', d)}"
+USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'timesyncd', '--system -d / -M --shell /sbin/nologin systemd-timesync;', '', d)}"
+USERADD_PARAM_${PN}-extra-utils = "--system -d / -M --shell /sbin/nologin systemd-bus-proxy"
+USERADD_PARAM_${PN}-journal-gateway = "--system -d / -M --shell /sbin/nologin systemd-journal-gateway"
+USERADD_PARAM_${PN}-journal-remote = "--system -d / -M --shell /sbin/nologin systemd-journal-remote"
+USERADD_PARAM_${PN}-journal-upload = "--system -d / -M --shell /sbin/nologin systemd-journal-upload"
 
 FILES_${PN}-analyze = "${bindir}/systemd-analyze"
 
-- 
2.17.1

