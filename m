Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.7529.1622125749407220233
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 May 2021 07:29:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=XGFhKGoi;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=07815bc566=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14RET50T010544
	for <openembedded-core@lists.openembedded.org>; Thu, 27 May 2021 07:29:09 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
	by mx0a-0064b401.pphosted.com with ESMTP id 38syn5rj43-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 May 2021 07:29:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lX2BqRmQoC8Wybg0JyK6fyGB/ImTB821+h3ngZtqy4+lxXGuNqZIuJw1ziQzkAa9RI9h7EJ0vf0WP4IMa3R+mhB9UZfx2kXZKvDNNX0IXJQ82A7dgsmZJs1N3CjbTvjuAMkClLK7rdWMBceV1AntoRz37TxqTmaYQyIS/+pBdPG15+RewhamUA/7EO6xz1Qocvk2/OJnBdK6rhJ3yL7BY+UXKQTZJ1AfJsbys+dXkzKuYvElR5v+FVhSOg//DQg+XoRAFQqnASYcKuSTsVgUqkqx35vXwAvRIJucN53z/gH01omrCMOCmHKERBSTfcJS7rtspjv23W+DzGAuJWbBqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/RCMUhWfKVyaar469BR1aKxLZi5rKiF4Xi332u2xYHg=;
 b=jkZyurpRchtq2YjH2MejprcOdeaGjBLu8911Q0S9InypMTcPwCiwP/ZZ9Os8yWD7IdIZhPY/LIzo+wum9sR+AAnGZysOsGWhrHiZiRqANrnHv37zrhIPcPo0BGWFZbTFnQZgi/c4zxaMP0Sj5ZStrSGdI34qEp5a3+JEUF4TgbWfItKfwotm88n11zEbZUUkgR0sTNsIg62mHpetUili601PEOG3fBIPmO04diLdHSXEseIyYb/vWEL+b6yi/l9/NS4nwIPLFknFTR54E0eUMOiVDt3I9QFCzlqg6pHqFjiqlzO46uwjqXUr83cX/hv61AEkyvh+XKeE78QfwUTcVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/RCMUhWfKVyaar469BR1aKxLZi5rKiF4Xi332u2xYHg=;
 b=XGFhKGoilOiT3/W/aAkHSOBJg8DVcqpFzFolXcdCOelUn+R1X7ILj22ugu1o4xRzonjfqJMcK7+f7e4TKLicQLTLTTJzXIVjjb/a0U5NETLB2LBXei9Xaf85Yv9PlF38vG2irJwiQ7VbERuhIob0IU/cjl2qr/5rx/69Jf3AaDg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB5008.namprd11.prod.outlook.com (2603:10b6:a03:2d5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Thu, 27 May
 2021 14:29:05 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::b5ac:be57:85a9:f240]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::b5ac:be57:85a9:f240%3]) with mapi id 15.20.4173.022; Thu, 27 May 2021
 14:29:04 +0000
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] bind: upgrade 9.16.15 -> 9.16.16
Date: Thu, 27 May 2021 10:28:55 -0400
Message-Id: <20210527142855.819510-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.31.1
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: SJ0PR13CA0110.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::25) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-tgamblin-fedora2.wrs.com (128.224.252.2) by SJ0PR13CA0110.namprd13.prod.outlook.com (2603:10b6:a03:2c5::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.9 via Frontend Transport; Thu, 27 May 2021 14:29:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ecdb817d-c092-4804-5ee3-08d9211bc780
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5008:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB50088BE0F0A9CC07EB421BFE9F239@SJ0PR11MB5008.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4MrJycgqOJ7yH3SxpUhyMi8l2kPaQlX53MWeO+iyM60anO2A8yJnmNO7xK8mRdg0aUuG5HQhDUWXHl+No4h9lEClPUiFjvToN0r+ngmEGgKsAQx1CJEr4CY0Inyjwi7OJ9pciBvhF6REiCi8h7Tm5nlTpRKf4F6eoGs7f9tLBKrwkPn3GrAiA+CZO7d16kUUHVBENGLUXEYY57nFtCzDt9BbcWJif+Fcjb/G3B91lb0H5PY3RoLKJ5narWeEX/hFcPCfRvvoqrmU6J4o797sMDKG6gsPrX1xdzhtU6OoESh+KmBUO46GGlgY14Pd664+GMM7k2p2MBGqfPwIS5lwrnYX9au6DRZxqhdnlkXyMh49Bwef/Ze5Ktlop0wJdePrEuuNwM0KRty/0g+cVr9OERUL9rjD7XNH5geCV1pk139MBCDffz1cnVMVoEQeXTLpJcPoSo562drDZu1HMxIgyBo9mSnwdEQDvFvBA4QR+eQ+n2lYn1KdrMHuU3b2j29S69ONpJ6agKvxiOUrg0mPHMMmkj98+4YC2rcIf8/3PZoucguvYAtpkIl7ooh4/Qp3tJ7JOqvSzceTiyj3w/z//IKNaMrxyFylLA6U+VWLzXpfrSEq/TwWwIJEQk/PdDXYh7RXLvFQ0iLzi9tbDofCxyaDirT2nN8oEy2KQJ4Y7m0cb9WjTrDciUkNAptANHH344hfWjg8GMmk4pdnslaYE+4Hm6ila00kFn8WNO+zyMA8qldg1AODO/6UTlML5DALCuOKPG7OLSkA/WuIEjwJKA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(39840400004)(366004)(346002)(396003)(44832011)(2616005)(6666004)(8676002)(1076003)(956004)(66476007)(66556008)(83380400001)(66946007)(8936002)(86362001)(38100700002)(478600001)(38350700002)(5660300002)(36756003)(6512007)(186003)(16526019)(26005)(2906002)(6506007)(6916009)(6486002)(52116002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?78FBtRHe9bHGhfzywTrI1e+bQl9+V38lkd/5Sk6Gh6PQmdD2Y2qj+rOOPNyY?=
 =?us-ascii?Q?DdeVQYRnzizhqEbZKxmEwdPl1+9V64JS/qaQKEjaSVJoaHxhm5ZRiqB/P9ca?=
 =?us-ascii?Q?HCoO0eGpFy0fY3kExPrs4hWuY7Hz+jScmw9v0uNndNEYotib2jxKpCjO3yIz?=
 =?us-ascii?Q?RqCWVihx51PMN88hCqel2DPaXEvsJzP3UeRQkbDQ7w138r8fBZdZ+k4eeIVB?=
 =?us-ascii?Q?TdGo1meZDA1u4VTXQ3TokVnzg8iFuZEDCGvGOzqCblsUkBBhVhc2fmpw/aio?=
 =?us-ascii?Q?Kv5+gBfjjlGuC7fCrIltalJBz84lzXdL6YCTxM2nxjA/b83vhgJwWxOy6Vfw?=
 =?us-ascii?Q?SmOAhmnYrRqEt//Nomg3SPQR3xDIfdnyCo8gjdRXwDuFzjOLlvNk81L26GB+?=
 =?us-ascii?Q?I531pUMWud8R0bOT5Nt5ulRnMBX5vmLevBVYoUXrdLfXt5bJqpZSjUWbEPMp?=
 =?us-ascii?Q?3GCzk2YeqqqpRgaDtN4wPW3FRGKIPGkmUFKW4BQ5Re8xX8LAgh0Mye7+FV54?=
 =?us-ascii?Q?Wkq0nRzflfxJbZVWxS52IHoRwjHbKr4s4gaBKMjp/aNUedB33UNSwT/F9lni?=
 =?us-ascii?Q?0ierN7i5AA2TcX2TdeFEtXa6/3qsuOdpzFOhle4EjCLTLCLPr2wOUzjOh3LE?=
 =?us-ascii?Q?1ytKLCpK45j9N+fVHW87HxJm5dUjxAZ0IZTWyXEaYJ399yPruk2keUpPiL8x?=
 =?us-ascii?Q?7dGkQ1mCqZqaZDYxFBE4qd+hMCTUXHvqI0WewK1mkM52ehrh/ClSjW7MvlOo?=
 =?us-ascii?Q?ZSRK8KxZdFpfNvrVkzsdNXTm1ssi8ARLttUmWJAzct20r/W8aqecEQwJQfeV?=
 =?us-ascii?Q?OLhNdRU/2E7/V9hG3lqk4rIU3vKmNOzfz5QTSSDqdzFWvfYDRHQwl1i2ALcW?=
 =?us-ascii?Q?y8eTawrbGV8h17MlOP4Fq6K7Ylv9WiWsWT+HX0MvL6bj7V78how3Yj8WQkGv?=
 =?us-ascii?Q?oaiJVU5SWZuIdzBmxBqbfM8zaEIniRTZVEq7g+HlQQ96XsEX9G8kl6bQWeTQ?=
 =?us-ascii?Q?QhEPXVl7TgMWqavWx58Usp+mbqghlTIKMZK9dHudG+QAzCzPeEULdlP0nRsE?=
 =?us-ascii?Q?iOqZmRiK50vCYWbfAUxCBjwRFgGhbVVyQu6oQzEZXr9LKSUWaZKAehypA0fi?=
 =?us-ascii?Q?zK0jXhn/2Z1jdSfPGGKaO2sHKTa5xWdYuLAmise9VErYwIZVjyK2X0OYug8U?=
 =?us-ascii?Q?/K6nrIiBhGGrrtmwtq/9jiJIg7ycuBIVZZqU1A/kQthdisvREdFLIJnKH8fd?=
 =?us-ascii?Q?7nGkG4pKjCnHDm3mznmvcwM7NgN1TWDkWwsq1WZgZHqm2VAcQXCVjwspNNkN?=
 =?us-ascii?Q?KJgna9tplpPSq+qxTTLL6nsI?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecdb817d-c092-4804-5ee3-08d9211bc780
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2021 14:29:04.7846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dj9wSNiGabe1gshE45suGv6l0R7ftllI/O9P2Pi5bCvuBWoepLhKLPlF6W+JHE+mYO+VyEJYZ2tKWK4rjXTekNAHGX9nti2CeLehGpe3yjY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5008
X-Proofpoint-ORIG-GUID: TO2YjeeBjqlHNVVMx771u5xLw1p9LcUQ
X-Proofpoint-GUID: TO2YjeeBjqlHNVVMx771u5xLw1p9LcUQ
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-27_07:2021-05-27,2021-05-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 clxscore=1011 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 mlxscore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105270094
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../0001-avoid-start-failure-with-bind-user.patch               | 0
 .../0001-named-lwresd-V-and-start-log-hide-build-options.patch  | 0
 .../bind-ensure-searching-for-json-headers-searches-sysr.patch  | 0
 .../bind/{bind-9.16.15 => bind-9.16.16}/bind9                   | 0
 .../bind/{bind-9.16.15 => bind-9.16.16}/conf.patch              | 0
 .../bind/{bind-9.16.15 => bind-9.16.16}/generate-rndc-key.sh    | 0
 .../init.d-add-support-for-read-only-rootfs.patch               | 0
 .../make-etc-initd-bind-stop-work.patch                         | 0
 .../bind/{bind-9.16.15 => bind-9.16.16}/named.service           | 0
 .../bind/{bind_9.16.15.bb => bind_9.16.16.bb}                   | 2 +-
 10 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind-9.16.15 => bind-9.16.16}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.15 => bind-9.16.16}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.15 => bind-9.16.16}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.15 => bind-9.16.16}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.15 => bind-9.16.16}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.15 => bind-9.16.16}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.15 => bind-9.16.16}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.15 => bind-9.16.16}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.15 => bind-9.16.16}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.16.15.bb => bind_9.16.16.bb} (98%)

diff --git a/meta/recipes-connectivity/bind/bind-9.16.15/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.16.16/0001-avoid-start-failure-with-bind-user.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.15/0001-avoid-start-failure-with-bind-user.patch
rename to meta/recipes-connectivity/bind/bind-9.16.16/0001-avoid-start-failure-with-bind-user.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.15/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.16.16/0001-named-lwresd-V-and-start-log-hide-build-options.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.15/0001-named-lwresd-V-and-start-log-hide-build-options.patch
rename to meta/recipes-connectivity/bind/bind-9.16.16/0001-named-lwresd-V-and-start-log-hide-build-options.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.15/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.16.16/bind-ensure-searching-for-json-headers-searches-sysr.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.15/bind-ensure-searching-for-json-headers-searches-sysr.patch
rename to meta/recipes-connectivity/bind/bind-9.16.16/bind-ensure-searching-for-json-headers-searches-sysr.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.15/bind9 b/meta/recipes-connectivity/bind/bind-9.16.16/bind9
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.15/bind9
rename to meta/recipes-connectivity/bind/bind-9.16.16/bind9
diff --git a/meta/recipes-connectivity/bind/bind-9.16.15/conf.patch b/meta/recipes-connectivity/bind/bind-9.16.16/conf.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.15/conf.patch
rename to meta/recipes-connectivity/bind/bind-9.16.16/conf.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.15/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.16.16/generate-rndc-key.sh
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.15/generate-rndc-key.sh
rename to meta/recipes-connectivity/bind/bind-9.16.16/generate-rndc-key.sh
diff --git a/meta/recipes-connectivity/bind/bind-9.16.15/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.16.16/init.d-add-support-for-read-only-rootfs.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.15/init.d-add-support-for-read-only-rootfs.patch
rename to meta/recipes-connectivity/bind/bind-9.16.16/init.d-add-support-for-read-only-rootfs.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.15/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.16.16/make-etc-initd-bind-stop-work.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.15/make-etc-initd-bind-stop-work.patch
rename to meta/recipes-connectivity/bind/bind-9.16.16/make-etc-initd-bind-stop-work.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.15/named.service b/meta/recipes-connectivity/bind/bind-9.16.16/named.service
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.15/named.service
rename to meta/recipes-connectivity/bind/bind-9.16.16/named.service
diff --git a/meta/recipes-connectivity/bind/bind_9.16.15.bb b/meta/recipes-connectivity/bind/bind_9.16.16.bb
similarity index 98%
rename from meta/recipes-connectivity/bind/bind_9.16.15.bb
rename to meta/recipes-connectivity/bind/bind_9.16.16.bb
index 25c4f2524a..b152598402 100644
--- a/meta/recipes-connectivity/bind/bind_9.16.15.bb
+++ b/meta/recipes-connectivity/bind/bind_9.16.16.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "98b6f432d878a7bf8f57eb7b3c28be27278cf6b9989154bfe6c81104b38e7839"
+SRC_URI[sha256sum] = "6c913902adf878e7dc5e229cea94faefc9d40f44775a30213edd08860f761d7b"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # stay at 9.16 follow the ESV versions divisible by 4
-- 
2.31.1

