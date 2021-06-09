Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com [148.163.156.75])
 by mx.groups.io with SMTP id smtpd.web11.1449.1623273104120616609
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Jun 2021 14:11:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=I5HzqrMJ;
 spf=pass (domain: ni.com, ip: 148.163.156.75, mailfrom: prvs=1794ea71e9=alex.stewart@ni.com)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 159L8iYU011354
	for <openembedded-core@lists.openembedded.org>; Wed, 9 Jun 2021 16:11:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : content-type : mime-version; s=PPS11062020;
 bh=iG6Jd77gT9Z+SchvvDwLwghS6Rj/mjKkE/Xnz35qdTE=;
 b=I5HzqrMJhj8I61rv438gs1FeLlWM1KIun28zjkKBm+2sejQdzCH7s8xYbtNjIjGvARyk
 4SxbpbndZSG2fZjSct+EYAAqmB2Ye/eEr788fqqMuokk+BqEH0P1Pr9kTO9RwpT7nFao
 opgSd4FCt3sy3ZOAZLe4uEIs1PBfl0/BcKGFVJxePH//ityv1YgBw+3kLzJhsKHSGjkr
 GZvn7okpbxpdE1fpBviNDRY96aCehRUKHFxo6U/8wE7yvTupasYVE6fyya6IT38W3FLe
 4rxQIdLrzYQN9ABWrh9xwdI7f1oe8vN2AbVLfY19DJhg3cj4sszXw8csnaBO48Zq9WJh /A== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
	by mx0a-00010702.pphosted.com with ESMTP id 392snxsgvu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 09 Jun 2021 16:11:43 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BW1XVvheRYwx+OgaR/Ly1mnIe6KbePW1SDmTG0bAzlFeAgQwXzdyCTwhiYsrRTeKjjRvsf1L6mmcmmeH65s9WZDpQF1TP7OcHiI7pIg9dyzkv8I+ckiPh36hwdbvrz42vq3UtxQe90YEt7um3hkpJKRsFf+Ypg0GH6eUtXqcefVojzgC4nQfTxRoWSKRbQle3irK2OqB8UvXZucyj9/HWI2MwqBzuEpr6OEUlSc5egxk/MmGEN6no4ivxv2dYFNNPCXlOTy4a14gy1+Kq7hMvOUmIk+ZrHHGu6kuyo2Hyfxtt2iCfR1hjX8GyYYRE3USuicWdp/vdo+x/3E/KHAf1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iG6Jd77gT9Z+SchvvDwLwghS6Rj/mjKkE/Xnz35qdTE=;
 b=aTvNhVtnq77kKsSUlmEAQ7Aw9MqBbSDScBS5pG5PfFbJYv2XId6+l0atlx0Q27hfIjERa5pHiy5oyQKC0XArcPrKjX1YW+TFuadzPnZ3xMnbtrUeXosfzx/qmgZPOz3JY+zWYiIiMRk7DZF4GVnvzQaNJeqk+++4oMhMDbUJCZ742I55JFk4IFjLPVZTnQZumra1DBl5vTsQg7gRnXKm3BXdQXJ71EKWa1+mWbAVTGiHtaqDYDCKyQnuSipzMlw0BT5hibDVhO7YsIcncc+/gcykNh+ymbkb3NddRBlhoQL7PRN1GQb1BrFN8gzQ5cbceEOr7Ly1T4MwOlchVXVwmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iG6Jd77gT9Z+SchvvDwLwghS6Rj/mjKkE/Xnz35qdTE=;
 b=AJ6uWNlrY04abrs+yzdztiy8IXa4rzLxeME2hwRKWIsYCnKTRVWcE6R9y8yINesf6ERSRaVSI6o6xmB0saVGaTFB+UsrR1D16U/BH7OlEB9fflt0TLA8pz40IQ8Le70zFy2FAjB5SqHOnRtTtheBODuLmeyoMhBNXmIAN3WRGgQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=ni.com;
Received: from SN6PR04MB5151.namprd04.prod.outlook.com (2603:10b6:805:90::25)
 by SA2PR04MB7674.namprd04.prod.outlook.com (2603:10b6:806:14b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Wed, 9 Jun
 2021 21:11:41 +0000
Received: from SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::ed94:4e4c:ab8d:f185]) by SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::ed94:4e4c:ab8d:f185%7]) with mapi id 15.20.4219.022; Wed, 9 Jun 2021
 21:11:41 +0000
From: "Alex Stewart" <alex.stewart@ni.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Stewart <alex.stewart@ni.com>
Subject: [OE-core] [PATCH 3/3] opkg: add QA check for openssl feed verification
Date: Wed,  9 Jun 2021 16:10:44 -0500
Message-Id: <20210609211044.853609-3-alex.stewart@ni.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210609211044.853609-1-alex.stewart@ni.com>
References: <20210609211044.853609-1-alex.stewart@ni.com>
X-Originating-IP: [37.19.213.129]
X-ClientProxiedBy: CH2PR18CA0003.namprd18.prod.outlook.com
 (2603:10b6:610:4f::13) To SN6PR04MB5151.namprd04.prod.outlook.com
 (2603:10b6:805:90::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 41d17.amer.corp.natinst.com (37.19.213.129) by CH2PR18CA0003.namprd18.prod.outlook.com (2603:10b6:610:4f::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20 via Frontend Transport; Wed, 9 Jun 2021 21:11:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 844ba6ac-8f86-464c-4a17-08d92b8b2d7f
X-MS-TrafficTypeDiagnostic: SA2PR04MB7674:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<SA2PR04MB767493D54CDF8604D1AFBB48FE369@SA2PR04MB7674.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CTC7JhU//UMqE7dDlOzUZSbI8kV6wcTujCFENWb00AznAqm4DoF/ujSD2/+0TI1ypurTWu124o+XMc8eroz/kj6StTpTHj3hJfVln/USk1kfNQCWafzPPfPLA8tYonsm0CTjwPyLUD1arZ2xqsxrANfBQUUwuScCX2ypdFej9fZj7MkYhO/PUkvCZTg0RQuh45PWxjJMsP98dvaw74ElaKzx7/bbnpttKJLaE3ZRCC0BCOthbnedrf/Al4av6//jRPNY2svPBrqwmOVklUgLGZR0+AcrEH/KMaAqUyBHXGxi3Bhb++ckiPjpzH7yMAdLruS1+4xjwy97cdYWdSa1UtMX86NkBDCaeCw/Ydk8VEnU4w7Cnmsam1s+dyMq7oa8O7upFhWsAAW8h4vHwPIiFEnwLHeI/n1wXBMjdvAhaQK1TE2qC0q6C8grvbD2H8uw06/IPALPv3ZDfjZOfSWnMTaIitNrO5Jm1jMLk19R54RWvHhdp25lMsNibiGqF6M2p+cgq5o0izpMqRUD7YQehig7Y+4gk3Q//mfG6Zyjn+3Vy5IhiWMmz7yPEN+ELFtOCebupgKEuwa1QvZRgKOguqXdCPaonzxIWhqCYVjwDa1zLBFZUoNL/CNz8u9rvCm9YwN6sQHNXszg4oAG45vcUNQMyNJ5aPwQMfu2mZbOQ2JooFUgVkiLpuyFpvtx0V19P6XgXjVGPcCIkmTXDPUKP6Xje48eXbK2Rr6JclmoQz2wXrA4AreclUN5HM6ANbGAPzOiYbFfZDkKOXEvRKcxqg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB5151.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(66946007)(4326008)(186003)(16526019)(956004)(36756003)(66556008)(6506007)(66476007)(2616005)(5660300002)(1076003)(44832011)(52116002)(15650500001)(38350700002)(38100700002)(8936002)(498600001)(86362001)(966005)(6512007)(8676002)(83380400001)(2906002)(6916009)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?p3tDpBF11evLYssUJlL06Z4ZU/XVexirC8Btd6YClLpcBGo4O2vsOyLR2b2K?=
 =?us-ascii?Q?NIi2MKfMQs7L/fmb2HldEwwkcvXhIDEHhVsQ2gDZ3NUWX+TbT2cVwuR791QB?=
 =?us-ascii?Q?zd+vKkffAVTJTYfmtx/lu1uPZ8YtrmH3edCU5M9LQhkQP+JelCO/wJHrQjPO?=
 =?us-ascii?Q?MbvZN5mVQ3Q7LtxtqsxxX51/15nb4UtBWzIs/xmXaxYzmIKvgnP0I5J8wRGS?=
 =?us-ascii?Q?/GPKQHB3djU9AZyI8LsfKgFibNPbXjqBzN/e6LFHE7VockqwozFM6N5/lev1?=
 =?us-ascii?Q?2mk8T+kloqG87zhUvtvMSzrP2LqUuwpw4zc/4pLygeTN0bej1a5QphbNwjnJ?=
 =?us-ascii?Q?wRSpjsuKX3E6cEn6LJqokrDJjuYSUZzx+OId2l9UBnICtcaV8NiHL2NpEvpO?=
 =?us-ascii?Q?R1uAQnJARcV8fXZpk65RPjrqeZ3PHxWUPtQ6ijhfn5M7VlSKT7xveH7T7PcE?=
 =?us-ascii?Q?EB0msuVzTel2TyIzoKep3vvWRYScWcaHYAWml7CchVkEksel1ZzVbKOO7jw3?=
 =?us-ascii?Q?/BXT6RZZ9YwiD2nnSMLenRzMZBnJPfbpW+Bnmft6Ou+jbDhr+aqjTbdw+5Ye?=
 =?us-ascii?Q?LDkF2l9wQqu8oOWP0LPvDFe05bvN2orXyXx1tTFMPK5TNHSlHAMLcmFboNsG?=
 =?us-ascii?Q?R5/Dz+1Sbf6+pj5C1JNwVtPXpFbcQbhDMt+wM+BrOdZhS5wkztpfEDgJNLQi?=
 =?us-ascii?Q?cHqoSQbP5kjnuFF15LJhrNgpSJHLn1xQoDzhKjdVE4SZjIZaizuJj8RFQAXJ?=
 =?us-ascii?Q?fqTBiefQUKZ2AmM8ndqZ/8cdc6DxT6vMFVVFvMLrVkmiVEKnHv1FvlWISuSE?=
 =?us-ascii?Q?h8v93q4V0Eb1+iZtCeSMCDLlcX0CzNz70iVPw8qKAzktvCKc9iyfWkpvFaXS?=
 =?us-ascii?Q?7M0ui4ON8VQwRN75ia+A5AxHcCTec30T9t4Qw7K8/aBCqek8e734qP38IgeQ?=
 =?us-ascii?Q?nCFZzN7fW5tJhOPZRCBDK9DfMzAwFSMHpLSwLNOznJ6QqO1ghIbkib8R6fpV?=
 =?us-ascii?Q?a3cFroTs4jRclGPNscpppoUiiITFMilONcR/839V+68SjfPmVIWJveihCZRj?=
 =?us-ascii?Q?eaOUoPqzfVrFK1QkvkPBw2t+xefrgbe7bgXVySn23WZdTXJVoYeFZ3ohjpbJ?=
 =?us-ascii?Q?mjHhxcq5uuLX4XbgxebZR4NhEFGTKQn1vmQvnudxAANydfH1P5NKHP6SgzYA?=
 =?us-ascii?Q?VjYeX3FkcJ9zUjUI3YduxaJBneyzKFjgxQRksIAqz1T5pKyN68LbdN4uZzrG?=
 =?us-ascii?Q?hY4KEBbP52SPBkbud5YY+DGxkEpommj+m8UQf8FAw7VnYmaTXCOj1mXzgars?=
 =?us-ascii?Q?o+woe4v8IVU3I+P4Df3fC9nH?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 844ba6ac-8f86-464c-4a17-08d92b8b2d7f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB5151.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 21:11:41.6019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1nRNQRERkgarsCxxJFidSR6bKlLKs6JJ77MKv74moRaeK2FNes1fAJWsYBTo2NXZNeoJKdH9cfiwK5dyB016wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR04MB7674
X-Proofpoint-ORIG-GUID: _s8_Gk8a6SEtul4kFwO4oMJAIEdyQDRF
X-Proofpoint-GUID: _s8_Gk8a6SEtul4kFwO4oMJAIEdyQDRF
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-06-09_07:2021-06-04,2021-06-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy score=30 spamscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 bulkscore=0 mlxlogscore=999 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 classifier=spam adjust=30 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2106090111
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Feed signature checking with OpenSSL will be deprecated in the next
release of opkg.

Upstream ML Announcement:
https://groups.google.com/g/opkg-devel/c/drqw5_HuXuU

The opkg-0.4.5 configure.ac already throws a warning when
`--enable-openssl` is requested.

Add a temporary QA check to the opkg recipe, which will throw a warning
to the builder when they have `openssl` enabled in their opkg
PACKAGECONFIG. This will give builders some time to either change their
feed verification mechanism, or raise their use-case with upstream.

Signed-off-by: Alex Stewart <alex.stewart@ni.com>
---
 meta/recipes-devtools/opkg/opkg_0.4.5.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/recipes-devtools/opkg/opkg_0.4.5.bb b/meta/recipes-devtools/opkg/opkg_0.4.5.bb
index bc948647c804f3f24800275289ef3fd7dee9335f..56d6211aeeee8a8112b4ae1afcd8987f950fcbcb 100644
--- a/meta/recipes-devtools/opkg/opkg_0.4.5.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.4.5.bb
@@ -60,6 +60,19 @@ do_install_ptest () {
 	sed -i -e '/@PYTHONPATH=. $(PYTHON) $^/a\\t@if [ "$$?" != "0" ];then echo "FAIL:"$^;else echo "PASS:"$^;fi' ${D}${PTEST_PATH}/tests/Makefile
 }
 
+WARN_QA_append += "openssl-deprecation"
+QAPKGTEST[openssl-deprecation] = "package_qa_check_openssl_deprecation"
+def package_qa_check_openssl_deprecation (package, d, messages):
+    sane = True
+
+    pkgconfig = (d.getVar("PACKAGECONFIG") or "").split()
+    if pkgconfig and 'openssl' in pkgconfig:
+        package_qa_add_message(messages, 'openssl-deprecation', '"openssl" in opkg.bb PACKAGECONFIG. Feed signature checking with OpenSSL will be deprecated in the next opkg release. Consider using GPG checking instead.')
+        sane = False
+
+    return sane
+
+
 RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives} opkg-arch-config libarchive"
 RDEPENDS_${PN}_class-native = ""
 RDEPENDS_${PN}_class-nativesdk = ""
-- 
2.32.0

