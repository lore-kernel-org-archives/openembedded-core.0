Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.36489.1629188252610406578
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Aug 2021 01:17:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=pn+S3rQp;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3863d9f4d8=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17H7nPYR021244
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Aug 2021 08:17:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=IGpdTNI3MowCAybV+QMxSqvXkUGZZCb5rFzAPidrxzk=;
 b=pn+S3rQpQu2STeBp0btb4DEN30J0KqB/CHSjawoFdsBDumkZIeld54rkz8W3YJGt6jRm
 LYjRf4dzO8CLXEbuIV4K1BsNNzt0Z+INuY1JRlrK27xQc49PliUtOcH9k811hFKR1LcN
 fIBJmVNCIwS1arJEtO3s2NpfuX6Zg2tNHjgoZtSBEDo9e/1FkazEXn3ivzn/02F9nOTh
 w2H8OmjkN9MoU26yKmGOYOITUrtdgs3+LyQBLwbmJmVCur/FYAvss/EqtUY2NUlPbs7n
 oDAkubexM7aAU1ovba/FHRXO4O2po3oEtwEyvA+DXdJRYHcZUBLZMULpMkA8OvAEKLRB JA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3afwwg8cav-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Aug 2021 08:17:31 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17H8HVG8004151
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Aug 2021 08:17:31 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam08lp2045.outbound.protection.outlook.com [104.47.73.45])
	by mx0a-0064b401.pphosted.com with ESMTP id 3afwwg8cat-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Aug 2021 08:17:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qwn9Bn9KGW8uLXDwK1rRTqlTkwWuEpGjZZ220R+Rzkm7WIhYK0v92j15+MNXDP2qFv/FCDxJffmT32gNEwUHCyQItEKroH1mdYaq7Gx/NrGrxQ5SfnAzwY4OgCSE4z482kzchMsWhkNeYd+xzb85a4HIPhLFAcgYJeevDa5oYCezpp3JC3Zl3qYDBegYi9OoY2DtA7TLbVSHguA6SeWqPLbrBqVmatoSlW/a+9g3/Wor74rrhBxvbHZZPYp9Dai+lw3dKa94SFBL5OmP/3FenjXK1N+GnY+/+SMgST1zsw3OuHXilomdTmbFNTx3SbXwlpg6rL4GPYLH4eUGSiq25Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IGpdTNI3MowCAybV+QMxSqvXkUGZZCb5rFzAPidrxzk=;
 b=MutN2D4lYrAt3cFeJGU/ORl1YLiya7FK2B1NIaeM229gvvssCHKE5K9TOE6UaqjIHSvqyMkI2zLrqIZIiixaHb6fRJi4FCJQ2ZWL3KxdCkL8m7J3jWJ2NcSEWkVsv9jGCM3AsDoVvlQXzTitt3azFeUQNssISag1KuRLOMQ/o49/cZ3qJVqn+LpghMLwRVJAnd2OOcVERgGN9guMCDt5PJug4hl7KJPTRHKfxW0/7zfUjQddehzUefBa1VapixDZPF62TvA9sLQMruhDOKzbBuAOPCXPquajPXV7+xX9s7cvt87wVUCs1CAl3ctdPjBM2qAUac3Kg0CtHewKWtli6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by CO1PR11MB5106.namprd11.prod.outlook.com (2603:10b6:303:93::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Tue, 17 Aug
 2021 08:17:28 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::fdca:2b03:6e20:2d99]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::fdca:2b03:6e20:2d99%2]) with mapi id 15.20.4415.024; Tue, 17 Aug 2021
 08:17:28 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com
Subject: [PATCH V2] shadow: add /etc/default/useradd
Date: Tue, 17 Aug 2021 16:17:17 +0800
Message-Id: <20210817081717.41280-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: HK2P15301CA0006.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::16) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by HK2P15301CA0006.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.1 via Frontend Transport; Tue, 17 Aug 2021 08:17:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d384c88e-a118-42ab-3085-08d961577387
X-MS-TrafficTypeDiagnostic: CO1PR11MB5106:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB5106B518FACFE031F0F51464F9FE9@CO1PR11MB5106.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:576;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pcACsL6/9yVpesPSXob1iByYKDLR/89oua5OdJ9ZvQjfeR/NY/v2JpZQwEZTxwJnzzJBkMl8IAogzAphuSdeLazUVmvywq4hwgkxVEhHarv8isW71uuq4jf3nkkEFCijXHc0fePC+pw4W/DlIH7PrF/Q507HETx/yBy4RxNWB/QbTd1RfF5S8wQ58GK5FsNdf6Ty6o81b0BO/E6a4Ah3otwCKHRD/fEG7PyaIzqM7DiDBlIhPzWZrUUAheivm+JQUXDA6Ua3TgLRbwNdQODN5Nrj1OBt9/1XXhCZmuKqqqethw+WE9/PlXaBamoVMLAm6g2jqw4/o37bJrP/6TXhiiQUDGLazyMY/6b9MWyHUU8lHWwwRRzuuSsVu5okw7dmvNRqQSdsmSK0kpWxo7Ql3TjhcnacPCRv4t3GQYY+heYdhZazVk5w/ysR6mP0FW2p+5B4Ynu24hZWCoPRGsQPYDX061LAeshLj17Bh3HZx4S2IqnTyXzJU22k31kYQT+Xf6kAoYPDa6RKk34g26oo6Wu09wCighp4sd+dlF3xLVfI07OK4e1Lb14Ivc1Og5XsuzZOyTeCSZvRDH3p1bzP3HFdHP7nr41+M2lMDMHKdSQ06/XyeASQ8R+KfJf4Z5aeFmyNa54dE+hFfCocM2WwCpEYSpFctyBAzmWHBwB10F7iEF/DhRnl6nqT+/gHpRrtTWXYidhPOaEXoA2U3kQ4EqvqDePwaA8UjSi+wsNONgfBzdGhWWE1kfyMkcs1IL8qp5tlfKJP8XZTgZ5mnh7aiuRuJXYi/zfH4fbI0EUwvOKx+F2D6gnAVcLdiLZycR+E
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(1076003)(5660300002)(508600001)(6486002)(36756003)(2616005)(956004)(83380400001)(4326008)(6512007)(316002)(38100700002)(38350700002)(44832011)(6666004)(52116002)(66946007)(966005)(66476007)(66556008)(86362001)(6916009)(8936002)(26005)(186003)(6506007)(2906002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?h0hM1LcmwiK+n4Ch3W3gzpmVEvgZTVPuAixbinfUCcWHB0Ds8yjtdbeaKA/7?=
 =?us-ascii?Q?frkhssvXfTIyob8aA/Uj4EtcD94hVrLQn0JW5wJSFelG6hXlZdE3u96oIiFv?=
 =?us-ascii?Q?BEO1KFqngvqzliltyQFb9+MpTdpS+zX7LOjvgyQMeiviFgP24/yhuzR9THxL?=
 =?us-ascii?Q?XE8AepghNiX2gwfuegbmNnEXyySCGTNj7+CpHY/aCUuzUzNXuOSUaYbkxjeo?=
 =?us-ascii?Q?0WBWrjJ/kPYcBersiZr1ScGo7DmhhXK89blq8S5QnTGHnsulsEEeshHsKqs8?=
 =?us-ascii?Q?11mnk7LBQZn34edySaBZeurhCLyyn9/+1FEDcL7VXHfNwhBcuw/60OVMUKF2?=
 =?us-ascii?Q?gF+6xxF38sIaU1xpSJA9QtJO1imfkCaPVBD13zOGgK+JZhE+IcIwaxJdT8Th?=
 =?us-ascii?Q?WSJxSIevER3TEMeV041uF4qj7ibaoB2uLGF28V6XINul2w140zeTHUGDl+/L?=
 =?us-ascii?Q?EfVLdxGn874vqQoo1g0voIORn0sfDk6SiN+j4RGO0RLMsKuN+uJL4PezvsBn?=
 =?us-ascii?Q?kFYMpMm/iVk4753a3JCuq+lfZGnf752TGwOLa1m9/VPQ/cXLFeqgWwqsR7Jp?=
 =?us-ascii?Q?W6vzAdBfjKsCDJxdEKsRVxrAYIgy69E8d+OvZCGnTYVmfGD/5lARbeccjMfe?=
 =?us-ascii?Q?k6znqVqlUGXUzNff0ijytMz8eDs2aqDtNpT2+3YgKglPkymUC0+FiYUqlKrG?=
 =?us-ascii?Q?pWCBUwrooqS18vS1vXzzVfRx7hsF/jUctEA9kv5Mvc8KF+HIq/5yWJhnIBjP?=
 =?us-ascii?Q?OTFtRUfvonK+91bY5IgwDnV4eV3/rcy7LH9seb5Qemu04tnRqcXTTYqv3CcE?=
 =?us-ascii?Q?kAqirXaNG4shYX87bkVNSF8bzvePEpISlKavzy1f0/XWp6mcSiozgFxyipY+?=
 =?us-ascii?Q?S5r2FmCSSdXUpbHs0l9kaDMnMvmkdd7KtfbJql3B2BZnYjnVKMMzNyzE9N87?=
 =?us-ascii?Q?Yho7cuEKjZFSVmbpp0oHfniLDzTKSZBFqV13fSmiz6PjRU5wn7HAd5bBZSOI?=
 =?us-ascii?Q?kX4CTP3u+Qh6GpFS4VHC1gLEomFN7cbUIdL872L69aloVbQ8yojaxCZ6bqqv?=
 =?us-ascii?Q?3itq7jjhXf/pyw6JyGcCVqUgdamzoPCMtlKjoX++MkoDnd315nQJ4R/toher?=
 =?us-ascii?Q?Arj44wrd71P0DmUFeXXSxNZR0zQyqIvouaxkHp5EhhBIOPUAVrebwSZ8lWxo?=
 =?us-ascii?Q?hQ0g31cI0gB5MciYDduTr+sfW2cXJeguIg1Pv5V/KaLsan3Omrk/RTtNA9tB?=
 =?us-ascii?Q?qjdkzBq/5UAKmORO32exgZrkKGzig1oP/g1Zs9byM0Xgq4ktm0Z0NH45ug7w?=
 =?us-ascii?Q?trp1bTUqAV56YtxhTx9EGaTq?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d384c88e-a118-42ab-3085-08d961577387
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2021 08:17:27.9059
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q+OuBGA/f9XJ3TikGcGnVBBek3OOhAEmSlJ12D2Y0ujcjPWJ2dOQ21EwZMnMx2q5f0wQRfby3tHrt7kY4bXWWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5106
X-Proofpoint-GUID: U9jgpTmg6yKWw3Q0InW5lohonftZvvE5
X-Proofpoint-ORIG-GUID: Ub7IO2VnmQU1aFRVGdWFpb-ZNtn8l5c_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-17_02,2021-08-16_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 impostorscore=0 mlxlogscore=941
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108170054
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The shadow 4.9 stops shiping /etc/default/useradd[1] and uses built-in
settings by default. Some settings are not consistent with previous
shadow 4.8.1 in oe-core. e.g. The default shell is /bin/bash rather than
/bin/sh. Per shadow 4.8.1 settings, add /etc/default/useradd back to
update useradd settings.

[1] https://github.com/shadow-maint/shadow/commit/bbf4b79bc49fd1826eb41f6629669ef0b647267b

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-extended/shadow/files/useradd | 8 ++++++++
 meta/recipes-extended/shadow/shadow.inc    | 3 +++
 2 files changed, 11 insertions(+)
 create mode 100644 meta/recipes-extended/shadow/files/useradd

diff --git a/meta/recipes-extended/shadow/files/useradd b/meta/recipes-extended/shadow/files/useradd
new file mode 100644
index 0000000000..782aeef418
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/useradd
@@ -0,0 +1,8 @@
+# useradd defaults file
+GROUP=100
+HOME=/home
+INACTIVE=-1
+EXPIRE=
+SHELL=/bin/sh
+SKEL=/etc/skel
+CREATE_MAIL_SPOOL=no
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 97ffae978a..44b9898897 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -16,6 +16,7 @@ SRC_URI = "https://github.com/shadow-maint/shadow/releases/download/v${PV}/${BP}
            file://shadow-relaxed-usernames.patch \
            file://0001-Fix-out-of-tree-builds-with-respect-to-libsubid-incl.patch \
            file://0001-libsubid-link-to-PAM-libraries.patch \
+           file://useradd \
            "
 
 SRC_URI:append:class-target = " \
@@ -115,6 +116,8 @@ do_install() {
 	# Use proper encryption for passwords
 	sed -i 's/^#ENCRYPT_METHOD.*$/ENCRYPT_METHOD SHA512/' ${D}${sysconfdir}/login.defs
 
+	install -d ${D}${sysconfdir}/default
+	install -m 0644 ${WORKDIR}/useradd ${D}${sysconfdir}/default
 }
 
 do_install:append() {
-- 
2.25.1

