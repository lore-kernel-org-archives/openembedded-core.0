Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.67755.1629366995952502607
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Aug 2021 02:56:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=sJfXX1Ym;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=38650d81cc=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17J9cOkF014099
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Aug 2021 02:56:35 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=ZgHH6mo8qxS+cqZDoi1h5Qm9i6OjUoSWV40bA0Q28z8=;
 b=sJfXX1YmavztWOLMU2F8Kcd5w82ouK/CxtiJck3sEwMv0Xswx9r8kymzrVndtD1cVrat
 cu1XzdH1WRId4EPZd4kdB8zYBOvkM9ZShTOC7c4cw+lqE0Yqlewm7FxAbmwjsyMODPpU
 t8eMUwXTOsM6RdChvEdGGcrxfWIED4Fh3D6Pld3s+T4ErmpC6cshrjj38WwiZ+7ewkAH
 JDIfVNVkmYQBCl5iKSFTaaduW/Q9KTlTvfjUUN0g7EVsqTsuBKlSLDVt6qiU37cAg60B
 FXNdG4Td4hCED6kqIXQV6i49sYcx6QXzaWd76WyNF7feYOnEABA6Fvc22Yia0GXGDV1A 8A== 
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam08lp2175.outbound.protection.outlook.com [104.47.73.175])
	by mx0a-0064b401.pphosted.com with ESMTP id 3ah20t0sq5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Aug 2021 02:56:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n698XH79s3gAFW6xzuIRjJ6aYik1LK9a+0sMW++TsCwbCTvyLnPSipw+HsWkSyOzSfoO+tvNnGkz3O6Cu1fdx3bkkXTj0W45JVY1cqVsSWDAlIB1CZNik9DkUOJAVrwu7Ke12C/tplAYbkwwds4ngtKkEFnK1CtcldE51fykRvFRm1WtTs+17F1Ounxx0VJOO737HTN7/VCDlIPV6vLx3WBFpEZuXi+KHGGNaWP5gAnPk8En6CXliyAwcZtF5+bLoNl9Yla3H//4fALiS+Xut9Oob323zzgsy5kd6qEgvyIxTSKilnQKS28wlbbdTuKxxHUgGlwjoO8FWuY32gFU8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZgHH6mo8qxS+cqZDoi1h5Qm9i6OjUoSWV40bA0Q28z8=;
 b=jdm80/DFbx/4F2SOd5iwVMvUHxzjXLkW37DO+IRHSLxYzxSCq6utKo9r/nEayC5MNd0BWnXZTMT/Ds6GnLw6mAZ/pE7Wu/tSn0O6sG3E2T8GG9XtGJ6FSeua4mmbbnba+T7FR5F1aJIQ/+7d/lo3TUxbnClr04ytk/pi0BW2sD5kWzJHWrPmn+kZZ7oN7YY8TWQMMu2RFKi2XmklrSBkrcdnPpqIZg3NVuCv4lcpEfZV1EMg9Gf6/4oUTyFhh+8m0Fu9cQzQlykn5sc8XtxNuwW/HF1QGAvSXfaRuGFmh9v1sIqTdrFpkno8Yfk81Rfza0McTn5UZjkI7NlRDEe3+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by CO1PR11MB5010.namprd11.prod.outlook.com (2603:10b6:303:93::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.18; Thu, 19 Aug
 2021 09:56:32 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::fdca:2b03:6e20:2d99]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::fdca:2b03:6e20:2d99%2]) with mapi id 15.20.4436.019; Thu, 19 Aug 2021
 09:56:32 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH V3] shadow: add /etc/default/useradd
Date: Thu, 19 Aug 2021 17:56:21 +0800
Message-Id: <20210819095621.112543-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: HK2PR04CA0083.apcprd04.prod.outlook.com
 (2603:1096:202:15::27) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by HK2PR04CA0083.apcprd04.prod.outlook.com (2603:1096:202:15::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend Transport; Thu, 19 Aug 2021 09:56:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae2d3a59-9075-4207-5c3d-08d962f79fa3
X-MS-TrafficTypeDiagnostic: CO1PR11MB5010:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB5010256FA24239B8134D0F8CF9C09@CO1PR11MB5010.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:576;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tdNN7J0ssxfc4oHzeJVPYg8GWquc6WcwkAzLxnUOMhwXdC6uttKeWCABCtsGdGzi0cAudFtjH0W+Elu/JsDQJv5mAnNokb9FaqDJLrGJult7owmVWQe7BPXtw3+JQw7UM9GnGiGnJgq71rigLTUZ4RPHmb9vEz7C0rwQDR3MY0i+vfNDPldfM1Rwn0+qg+AJTrNqyCLlsFZhAFCCMXMEwcRgdwakN3CtANRfRU/ELx9ei+NvBMTS8gmSRbmfxAYV50hKLuohNgy7m6t9IQXh6mBdWWu4Rlp0RQkMy33JRrNvFGM97yKfHXQqQHbeDAahjCdCIL6mDEhqYlheYG+eOTmGoyWMMjy3NJW0xhyMkqdMR/BMOiS7vlULvl/OjQKiVX3tRaC4y+QxZs7+PnnMzh0RLeGOud1MNi246cqtr0ZBjEFgmB44Tq6ZA67OxfuKQqwHMNIjrwrZEqP6lUrt8FfM40hGK/oejniHdwlusd6asROTD3ktiMazRsrCYywkD1a8BHy3BcJUrIG2o/3zte16j/D6m4OFD8/HxwHKD8iDuphxIDJixVA2TlNf1nZql3XFgtnUInZxp6qlUNBLsMZn7MYpDsMtiiUOyK0AQVsV3kl4cbGCdV8eVSC3DvqUZr0VdKeX84ySqTgMgjnNm2Jpt8qM5it4Pd/cG9esw9ogLg79HJoTjkadCmjB05RZZx1cidExMoCnv9o3xSXsjceSv3OFh1iJ244kjCQ0/DRIr6apcoSp0zOIEOc+8ouhyTTHtlC3ojSh03rtUu8gchz0yhm2Gw7ZLsKSgSxyncY0opIe4Q0oQn9BP9hSpnrB
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66556008)(66946007)(66476007)(2906002)(508600001)(956004)(2616005)(5660300002)(6916009)(966005)(6666004)(186003)(38350700002)(6486002)(1076003)(52116002)(6512007)(38100700002)(8676002)(6506007)(83380400001)(8936002)(36756003)(316002)(44832011)(86362001)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?p27PQImjicu052ED9j07phYss4BGrroyJR9o+DnFBmfKzCPAJCvqPED0NB1/?=
 =?us-ascii?Q?MouvFqRP/Ul8DuchhS39cFTgbdUS6ERwUGMJ3OchtGE527RUlqdV9w+itrzr?=
 =?us-ascii?Q?LW3i8YrSQIV+EVQazQ761tjoN3xLaIasDQnG3yXOgxnCw1ihzSuk+Ep01uMQ?=
 =?us-ascii?Q?/WxnaifS/Zpzczswo8mI1MfTQOC81L2mnOuuXMW3JbUmb78ssjSUf+mH5Fl2?=
 =?us-ascii?Q?2HxPtp53Po2aoJp1QWzxOWQdWFfk6dS032Mdel/kRvx3LdOlE+67gFhqMMrr?=
 =?us-ascii?Q?ao5pu8ZKdRPOhHJrjCOB8bhTQaCr3Pe3twq2ydlMyKOnhYfgtmPLcUdDnhop?=
 =?us-ascii?Q?CLrsDpmvGESbq8slARd9mvUi9qi9nGz4GwjetOQLlREYN3niVn6HnkoK28Pj?=
 =?us-ascii?Q?9QGH7QzAEo0jlUdkM4BqxK/U//jzPezQEQo68oHP7lLkr8lrSw8NhBoWsWch?=
 =?us-ascii?Q?jCpR86zkuWoWsAazM9a4ccnWwgsTkRod7Xj5ueHnKOict7BKXdmxWw8AZsa8?=
 =?us-ascii?Q?mAfGuyJpaXq0CdtlNiQhAjm6yP/guQcffemr1fCH95PIKLOLCkpVVQe6zQ5F?=
 =?us-ascii?Q?7b/QDSMBMe3i92uFz4nIICTPAixFe32R9oBfG0Q08itNloLVxwTBulGGQ9do?=
 =?us-ascii?Q?4aifdkrNJHolJzXqTLZFwujWeYyyYqM9gNw4a7TX4ObyGXoU49Cqv5T2n9wL?=
 =?us-ascii?Q?AfDkJcB/ATQUGmr3+bkQwbqE38HjyTzXeaOSlf1CMjqUL/+opxLR29XFIm81?=
 =?us-ascii?Q?Uc+XOAYCK3zORYoDNXN/Q2etQTdJSrXSDAu8RL2tT8BlAqxo3nddfXYF+qKr?=
 =?us-ascii?Q?r0VVnCocY6IQlRDLxPGREjcfQsn054CMprke/Zgn0BiCTsZhVXSaPxiuIdXz?=
 =?us-ascii?Q?RKShDjbjmwPkRyAUtBnJMLLVNstCp6Se3dBdPVAGrrWP2OC/ZT1a0ppuFTcZ?=
 =?us-ascii?Q?nQxzNSh+Z7zHYh5jkvA41ntpXCCMO1mfHmD4ycsKa83ssJ1mk+F2f+oue4TM?=
 =?us-ascii?Q?n3ZX2jX2eaidhYQSmjFhKaFMwdZZkEuGF6K2OJYB/cLXBTFwSYkd5gVBsHty?=
 =?us-ascii?Q?s2mN+VDnZGuXt/CwR2uKuWd6+8Xr+9LrJJz+RCy2Ww8GspqjCzBuzslAhj4b?=
 =?us-ascii?Q?+unCCXZiV/2G8dqI2LUPox9mYk8vkBEQ4KoPe/g0IyC1ICeUlYAc7hL/Bp1j?=
 =?us-ascii?Q?1ud8nnJuD0AcSg9TJpIQKME5Y8nYA2nqZwLCnm0eY8xsS61rsxii22qmJtcI?=
 =?us-ascii?Q?mndDOnpc3HZI2Uq1kr7stQSNPW/byHUZLLiB0MHMQZsAp5lR5PFL5l6nAfK0?=
 =?us-ascii?Q?aJ8g7vqUBJSlcTwx4tL52TTX?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae2d3a59-9075-4207-5c3d-08d962f79fa3
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2021 09:56:32.5976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HCfcJHHSp8pOM5Oly+iTs2CBAQLcmgBUAjOzt7EzGDW5A7ryLO5gd4n/AtVW308mNMDEJI6oYVyRH3sjefn6uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5010
X-Proofpoint-GUID: EUFWLUqvEBMa0ltBvIzcICTOIjK-onXj
X-Proofpoint-ORIG-GUID: EUFWLUqvEBMa0ltBvIzcICTOIjK-onXj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-19_05,2021-08-17_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=769 adultscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 spamscore=0 impostorscore=0 mlxscore=0 malwarescore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108190057
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The shadow 4.9 stops shiping /etc/default/useradd[1] and uses built-in
settings by default. Some settings are not consistent with previous
shadow 4.8.1 in oe-core. e.g. The default shell is /bin/bash rather than
/bin/sh. Per shadow 4.8.1 settings, add /etc/default/useradd back.

[1] https://github.com/shadow-maint/shadow/commit/bbf4b79bc49fd1826eb41f6629669ef0b647267b

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
V3 Change: rebase to master

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
index c1e24b4f16..c35cc8396d 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -17,6 +17,7 @@ SRC_URI = "https://github.com/shadow-maint/shadow/releases/download/v${PV}/${BP}
            file://0001-Fix-out-of-tree-builds-with-respect-to-libsubid-incl.patch \
            file://0001-libsubid-link-to-PAM-libraries.patch \
            file://0001-libmisc-fix-default-value-in-SHA_get_salt_rounds.patch \
+           file://useradd \
            "
 
 SRC_URI:append:class-target = " \
@@ -116,6 +117,8 @@ do_install() {
 	# Use proper encryption for passwords
 	sed -i 's/^#ENCRYPT_METHOD.*$/ENCRYPT_METHOD SHA512/' ${D}${sysconfdir}/login.defs
 
+	install -d ${D}${sysconfdir}/default
+	install -m 0644 ${WORKDIR}/useradd ${D}${sysconfdir}/default
 }
 
 do_install:append() {
-- 
2.25.1

