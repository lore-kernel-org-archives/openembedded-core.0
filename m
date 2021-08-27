Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.89.1630101487906519525
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Aug 2021 14:58:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=kvZCdXv8;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3873cf6686=saul.wold@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17RLgjWv018077
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Aug 2021 14:58:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=4lJLVDLX78rTv6dCd/3EmamckHCZbbXgvKy7n5FMKMg=;
 b=kvZCdXv89GNl/iWxafEb7yl7RprBzVaj7vrMepK1Cxeti29YIXn4MF9xLTLw6kb6yheT
 wSgijkNPdHG48Il7nS6tLy0/FAn0ojs8wVyGiyDSL2L1nWwkTYKbUUAVOHz+/FQcm21U
 WOW404pVac3oXitQLmFoYcwfhqKOh5OtbI0vb51KYU/S9+PEHRnLWFU+KUEFYsYu9qFS
 0xlufB0PJRF/jnRn8/HavMn8L20rnDBYP8Im8s+ZAX4ZGEYHW4U+YQ1fAhF+5bBuD5ss
 LoOIu/HbwlhidjodW1K8J4AFwKzHicDDIz0v4ecQIMRanPYkuJBO55DTKvsPwWjskjeh hw== 
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam08lp2041.outbound.protection.outlook.com [104.47.74.41])
	by mx0a-0064b401.pphosted.com with ESMTP id 3apmv38r23-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Aug 2021 14:58:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fiejPa8RO3fqUuS3AYZdyVZiG/K6X/G0lsjVNaAMRwgfxL2e5LCydJnW5KPCByO7p3dAFSDO/eRf5LPNW588/CcI4xT/aD9UbgISHcJ7BDRE34x9+hGNZW9ygy9f8eg+me3gk25qZ1qz4k+o3M6/kcuEmVG4nrI0T9Y+OqgUs68CwKdgWWlVsFq+wR+RJaviQDdq85I/8tGP3mcM9b64fwik6Hoa17ZWmDoXxoulRqdhbub15Zi2q4+zQ3oUXpws64PReXPczIbr45IVSzrhQ7gvV3FsBy1s75RDNJWPRLj3UjT1P5Fs+sHVPnFuSMFKTCFgOwkJa5D7geY5qu5CYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4lJLVDLX78rTv6dCd/3EmamckHCZbbXgvKy7n5FMKMg=;
 b=Zc2FoC+S90z/7gW8hymzRTGmYjvOQA60a5oYfpNHuIIZizrEHP0Uc3CpOFK8J+l5E3d0d2sfo5KW0GnPpcDgH3kwmQDCsTb5ejN5nmK4J7+ttBgRVihuwfq2eBrUUzIHKPGEiibWW1nWNrD4yXmQva8rQxRBiHzZvrQd6DNPmJXCIpkzcD49BXCduRM/D6gXrbhSNW2GDW9PErm6D2U6e/Q2TBotjOmI035tFunByYOSnnHfe4iPvEfDkXFE9NpIefGmnD9vVc5KJ1A0xM8F9MwgeMiPE2lfInboVZ6AH4QXuqXNNjzcIU9XEo4GhAXcuGPR9qAgVGYYFhORyXR2SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MW3PR11MB4683.namprd11.prod.outlook.com (2603:10b6:303:5c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Fri, 27 Aug
 2021 21:58:05 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::fde2:338b:6ec:71ea]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::fde2:338b:6ec:71ea%5]) with mapi id 15.20.4457.017; Fri, 27 Aug 2021
 21:58:04 +0000
From: "Saul Wold" <Saul.Wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] quilt: Only package guard for the target
Date: Fri, 27 Aug 2021 14:57:43 -0700
Message-Id: <20210827215743.2027466-2-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210827215743.2027466-1-saul.wold@windriver.com>
References: <20210827215743.2027466-1-saul.wold@windriver.com>
X-ClientProxiedBy: MW4PR04CA0271.namprd04.prod.outlook.com
 (2603:10b6:303:89::6) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yocto-hs.bigsur.com.bigsur.com (71.238.119.71) by MW4PR04CA0271.namprd04.prod.outlook.com (2603:10b6:303:89::6) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend Transport; Fri, 27 Aug 2021 21:58:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ddc6a5b6-cbb7-4541-ebeb-08d969a5befa
X-MS-TrafficTypeDiagnostic: MW3PR11MB4683:
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB4683FB03540B0D2F49AB4A09EEC89@MW3PR11MB4683.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XSw1Z2RPirOHvKyoP2tf/WOQZEhiRPOYMFgnZoPHyN9k0cU4Au8ZbNsHNngfVbS11C9TwfnINr9eBbQyen858F84tz+h0rqBbuQKFS8blCi3cQWyUqxPnTG/YBOxjeBPzkRBFyPV52hIZoVu40NsqdS5T1tzOoS7xGfISSt7lGOqrRdJ0+8a0kk1+j9krmI4MesRzouEY17hRjZSIoQwjLTMBjH/azQuo+LhdFVAWk1ogkNmnSbvvD2VWWCbgVllaVP8JJTe0xpMstaURu47dp1dvO0/1f6UYfyOQQd3Jy3g3m7PJFR/sRbv9e2IMypo+J3sOTVOrlHNh79yBoepS+HTO1NY9Y/9gy2xR9Y4Ul058coKztHAXkptLbbpMuIzkYnptt7GBuDGr3Fe2xHED/EA0E6nyNDZTnOhj1gu3ILqRVC9fNxozSoMGAZr0wMYViyG2/ufVNkuuRxWC9tOfVFdl32wrz2Q/ChEbUzYZIPI3nL3FyZa02p7/IrHzoL07MPFhIjRSKvLwRzCSPk7CaAgVNhwAXrzOX0cnEeJHCko9DL5rCmKSSB7ww1kzOG2PhU/qOpwE7GoxX/ZcRjF8RqvLS56EdGopEAFzc5mYcOMnRralBUFeiwPSkk66umf7sqd9Bftbb9DwgbixZVJLCZJi22TxICI2Th4hKQuqRTGo91NYmdd0BoQoUpeq2v7TbTF2S23m6YAwWWUicKoWw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(39850400004)(396003)(346002)(316002)(52116002)(83380400001)(6512007)(38350700002)(6486002)(186003)(2616005)(1076003)(44832011)(956004)(6506007)(5660300002)(6666004)(8936002)(478600001)(6916009)(8676002)(66476007)(86362001)(38100700002)(4744005)(66946007)(66556008)(36756003)(26005)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6D075hkfTug0t6/mvxYbw5h8g6bVHcayjEeA1Hd1rzUfGACjqGfbSWlTXAdq?=
 =?us-ascii?Q?+C7Z7bXBuTOVJTdy1KyDvvmyRZ7aS2KtjNnlD6hrWKa/votc+X6t5rAIxdd4?=
 =?us-ascii?Q?7GGywg6UZzVSm9ivPLfIrn8GxIy3n7ZgIrggCLMj3tO7vpsxXhQjdKwc9w+w?=
 =?us-ascii?Q?uP4gJ0q1xeFVH7JxzyLVtiPvy61wWtjBdSq+WIfpigyOSt8b0SBixNmvlVB1?=
 =?us-ascii?Q?QSY+ndAC/OhCQRg4aQZUXQvAT3SjldGEoaoNY9rX9zY6AkxxeybeQKOdgdVf?=
 =?us-ascii?Q?TfO0V8VPN0TpBh29prTFAR+pWcl8Nu9RnuJXJMRFqoStJNqM4jkeg9zbM7RS?=
 =?us-ascii?Q?9CbKK5ldOlfukbb5FPXg1svnYKA+YW4dZW/dc+de3rXjOanP7LC7ix6BW8Ej?=
 =?us-ascii?Q?t4ksjwLOE8NpbZT7AVW1jdKTFTLgwQDMgei0AJ2t/95SJip7Q0GldjLPLRvF?=
 =?us-ascii?Q?zU6Qhwv9LpbCk4Td3KQ0PwyPNx5PKZFSh4HY94udAC9ZLIp8gpiUShQWZkLT?=
 =?us-ascii?Q?SWSD+qNF+R870eW4iPR7mQHytz3MI+L2OfEjoBjtmCeDYDleYGP7UAEgmOhj?=
 =?us-ascii?Q?JFiozSVnkQQifP4JnoH45yJRigIqf0HeBijKIQ2JWeJiFIRuBYSLqLAbm+6J?=
 =?us-ascii?Q?q+5l3A/9niA7OoFArCi9ZxyDBIr5DdQ0Ri3DcB5JiEiT/KTGTaVpjJNUMu5n?=
 =?us-ascii?Q?VQBjbLzw4OQjdfA4qtAtNAxcZYz6zk7lBO/km4a8n/EqojpXdkCGwv8PKGfa?=
 =?us-ascii?Q?Am40mf1GnYgVPYK6b69ckhWzxLyJd5yJBjpGD0t7LnNDhVRQ2iSbJ6WP8hnM?=
 =?us-ascii?Q?ekqB3R8ks/5tIzPgD5kapLFFIQwWCFDRsBn6Ut1Uy+fzZnrcXjo0n2sgI980?=
 =?us-ascii?Q?V1HXw604Aa6Cu2WGZTFK0EZKEdHCGvkKXny5MA2LU064eMH77x6t6NSp7kFz?=
 =?us-ascii?Q?OU/eQMh3zVLUkp9M6e643jDbB4p/LmSGiE16gHsHdzuRiD+5qQulnVMzJDDu?=
 =?us-ascii?Q?YHsnRklgxHQB8JMbKXgPwOe9Mi7d3+aBhgEgWa0ELVTWNjZ6ZOjGmYO0i6gb?=
 =?us-ascii?Q?TnEOWXL14on7qHhJFjfdHKgHbZ2r/JPXT6fWR8rTmrLIORJ6NaF/SxqXaptp?=
 =?us-ascii?Q?XeaR1B9py0SgQvH7v4R4o9+dPjjCEhN/36cOTDVPXPPMYZECNaoHSvq6LXPl?=
 =?us-ascii?Q?+cbjua0DSwGw8vri1UYR8Plq1lMkJ+LAoedskhHSnyF1RK0M1Dcm0w6lQIja?=
 =?us-ascii?Q?10v8vCLXg745TbRY9P8LdPD6T5fHgze6/SgQz/G6OCf0vUQIHmLBMB5Yx6iY?=
 =?us-ascii?Q?OWpGQ5T0iRZm9dSwYp5DKiWR?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddc6a5b6-cbb7-4541-ebeb-08d969a5befa
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 21:58:04.7188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fkzaDIv3YW2NRwZauOWsA2eHCXmLVaR2s1RpzPDFoKuQyV18WfzQ/suG0u7w3k0c0PnzmlVsWYcfAPX9QylMzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4683
X-Proofpoint-GUID: Fh4p4b3pWstoFYNzhN1SI3yQpwiHLvUu
X-Proofpoint-ORIG-GUID: Fh4p4b3pWstoFYNzhN1SI3yQpwiHLvUu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-27_07,2021-08-27_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 spamscore=0
 priorityscore=1501 mlxlogscore=604 malwarescore=0 bulkscore=0 adultscore=0
 mlxscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108270130
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The guard binary and documentaiton should only be be packaged for the
target class.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/recipes-devtools/quilt/quilt.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/quilt/quilt.inc b/meta/recipes-devtools/quilt/quilt.inc
index f85de384d2..41d30e89aa 100644
--- a/meta/recipes-devtools/quilt/quilt.inc
+++ b/meta/recipes-devtools/quilt/quilt.inc
@@ -73,7 +73,7 @@ do_install_ptest() {
 	cp ${WORKDIR}/test.sh ${D}${PTEST_PATH}
 }
 
-PACKAGES += "guards guards-doc"
+PACKAGES:append:class-target += "guards guards-doc"
 
 FILES:${PN} = "${sysconfdir} ${datadir}/quilt \
                ${bindir}/quilt ${libdir}/quilt"
-- 
2.25.1

