Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.92.74.107])
 by mx.groups.io with SMTP id smtpd.web10.23500.1594148546877552496
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2020 12:02:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=t0sBqn8S;
 spf=pass (domain: outlook.com, ip: 40.92.74.107, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LNheFvunFfsAFfk3a91XPuTSbutdPJCKs4fa8roXZJ1JKxXjO2swRkVdpV574vckt8sGLzRKuOV19X8MKTVZ7/sElr5HFTcyqdx5iwhenKDos61yahnRgy1BPL0A1bz7VgivohWQ3iGVY2yna2pl/IC8yQS73eVFUBHVopg6snfCmJOF/+hOjVmx43wm21wJFkjFgDuE4PGuRkzszVWQm3Rhkhb4mGuwsfVM1VjvnAJq+269mLI2fmFsSiek3YxyBTBpljM5iarT/AnsFk4fZafFq4pj/slmuFMH8j/2cVWcOnFJX+CX1ih++LcJttpI6YVOHN9S6PR6gdrXyE3yuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zwQN0NaTNmHef+LRyqT1ThZOlWWqogqa3W1+24H2yX0=;
 b=M+WsLL3RI97QLn68SvDlOSEOrjIVBQvhcGDHSvGovnHYUBF2h0XjtNQ85N28LXyO66Kkz4TAxTtzdSknVVP4FujsOF0yCkNz/COCQ7XL27bZ2SaYEZYq90piXn/9u7dIQqhIBARepwLkSo7SJ5rwjCma4ucgafLK8zMuuN9Mc/HJWFSKM3gWkO5Te5A44esrcK1ozNqZpyD4MMHoW3+NmPjFOVPYnRWvc//JC17IWWqCfUirr5cZm3sAZg9VdJBzmQBB6KPRMHi34z3H/WCA8bpS+q72+3WCtGw1e2ZDlppC5E/lMXZiPT2E9XONMAAoIhDxtsc9odPdrbZEkUfNOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zwQN0NaTNmHef+LRyqT1ThZOlWWqogqa3W1+24H2yX0=;
 b=t0sBqn8Sd/jF6TQGBi4Ymd1AzvnCQ32W1VZmftNsxZQggBB0YvySfoCj3bRWMlw5xx8j3AyDwJsX/Pp0jwDNFOy69KAPIrRMaxce4Wq2wUzcheCLoZYfkbBNVh15sBeBjW9dYNt4GxBeA5tb+Q+CnprVcSf1CBYAyU95TOuPfLfwI1bDXyeMy8+tvsfXyl8lIMR/OK4mEYS7Db0MNbW3u31o6FaKdTSa/y38ctTaqE6UB2AIFTjIc1eUE8DN3IurzGY7GROR90z/4hP8x+jb8K7gAoC2HZhwj6nvlsFE7YEhxAOLzdlz0jfvhNeRBky15FT0A+yVPD9NipusYB52tA==
Received: from HE1EUR04FT062.eop-eur04.prod.protection.outlook.com
 (2a01:111:e400:7e0d::52) by
 HE1EUR04HT025.eop-eur04.prod.protection.outlook.com (2a01:111:e400:7e0d::71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.24; Tue, 7 Jul
 2020 19:02:25 +0000
Received: from PR3PR05MB6890.eurprd05.prod.outlook.com
 (2a01:111:e400:7e0d::44) by HE1EUR04FT062.mail.protection.outlook.com
 (2a01:111:e400:7e0d::307) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.24 via Frontend
 Transport; Tue, 7 Jul 2020 19:02:25 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:F46AC625706190CA8288B2FB4D8ADCF9F48CB5177178DA6C1DA9F4FBBDD2C077;UpperCasedChecksum:311E95B8D672761C9C261231283F75A30F6E4DBA8C67BFD20F451F5B85FF6F5A;SizeAsReceived:7406;Count:47
Received: from PR3PR05MB6890.eurprd05.prod.outlook.com
 ([fe80::10f6:a534:e0b1:6136]) by PR3PR05MB6890.eurprd05.prod.outlook.com
 ([fe80::10f6:a534:e0b1:6136%6]) with mapi id 15.20.3153.029; Tue, 7 Jul 2020
 19:02:25 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [RFC][PATCH] distutils: put tests to a separate package
Date: Tue,  7 Jul 2020 21:01:59 +0200
Message-ID: <PR3PR05MB6890710E8729FAD4ED19D5F4A8660@PR3PR05MB6890.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
X-ClientProxiedBy: AM6P192CA0047.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:82::24) To PR3PR05MB6890.eurprd05.prod.outlook.com
 (2603:10a6:102:63::10)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200707190159.4963-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (79.215.7.122) by AM6P192CA0047.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:82::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20 via Frontend Transport; Tue, 7 Jul 2020 19:02:24 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200707190159.4963-1-kweihmann@outlook.com>
X-TMN: [WQSpd6U2FK2oP+v8PSIdhvPY8b6i62IG]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 78daea7f-6de0-482d-a19c-08d822a848e6
X-MS-Exchange-SLBlob-MailProps: 
	7MJMDUNTCtxJ70E3U4E9wdYVd4b5dHmIykCb3QM/DUxVn0ENNK1OOAQysfppJABRvTLBS0o6xTK8YGHarhk964qeV1C5BFluFoA+NvEZxq/QbYynq0KgakHBfmobUZAy1LBfcuEPLwtnoJTVVaXBcB9lozSFeoclyYdWvd6wFXRzqczS0FIX8NPraQOl9wAMVd92kJkof3ObzlOaMuhW9On/P2M3tRsjkqIrE/X+eEa9DSF5CFfimHUeUsQ5CaWinPV4KCPEjumMy7ymxUqfqaisrn9STq7FpzqiPbZKwspTGoTPlaIxHo8YfDuJcEHnZPhSTfrPqucudUZbnKUxiTmBOp+heNRkFrfJK9CacpG65B8EVTYU/rq/mI5CwN4y1sWD6eS/K8T2uDwA2ggckixAfkTtm5Rlvk1cerif2+w3beT8Zg9pQOjiqO/ia/W+ssxovWVcvsIc09DR6pAWhm/kjNqhbJWxFdRu9m/P0PTy73hOx+steIPayEXgNrFrwn9qzgc7ItV4HGxs0yqRIr/aifCPggU+4YejtcEQoBXtLVsyJcZDJzbhlGDdh5xzkW4+TYGYAdmCOVIDasxQePwCb9oYlJLbCjnOckEsRXIgcNg0+uB73/xTwbrYL2z5D/lOB1IqZTfzfkDBA7WGugs9VCNVF2K+6yWD6WnA6KkOSwUYoY9yPF4+QNwnQ3zWGyqebf+B0VFtzkd1O97NCN9X0wQVWgbmjfpZwb62MKbrIRL9RPSE/Q==
X-MS-TrafficTypeDiagnostic: HE1EUR04HT025:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lvlEiU51k7o10IHH2E6dgqoZEuF/9+0D0grtdqGUIXShftFH971gPAuLmq4diUqWbYhYtB8vR/yUYeLQpOB81X8E2qk4DBdMiK4pYVX+Wvf52tVInFbUqllq8uMgxOFUTDsSMqlo2Xuc7F6MgF1E9WSpeLUwJKQ+GaDx5XT4NnTwtVmm++6n84CpTT+Xi2Gjta/jiJQhcljX0N6jCCdPuw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR05MB6890.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	EdLMjPLOA+1Pthx4K8gx358nH+vSr/o1vWdLo02AbXSjyFoaacLOo3lfWeIZ8mpoCFVWqS5xib7uWGD/EinjQNMFcoFO6RR01SDP2Tnww+v/gjXgkRid3nXn4EJYeK2SgzGTGqhY1/cSB1rK+nsbYg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78daea7f-6de0-482d-a19c-08d822a848e6
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2020 19:02:25.0548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	HE1EUR04FT062.eop-eur04.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1EUR04HT025
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Put files from installed tests into a separate package to avoid having
them in an image unwanted and to avoid having more runtime
dependencies than necessary.

Background:
As setuptools is pretty much unregulated in terms what is installed
by some module, even tests are installed into base package, which then
go right into production, although completely unnecessary.
When now trying to determine the needed runtime dependencies, more
than actually needed will slip into the image.
To give a really bad example GitPython ships its tests into production
leading to the effect that theoretically besides the known RDEPENDS
python3-asyncio, python3-distutils, python3-idle, python3-misc,
python3-pickle, python3-shell, python3-ddt and python3-nose would be
required.
That's why I came up with the idea to package tests (if existing) into
a separate package, which is NOT installed by default.
Please let me know if you see any issues with that patch

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/classes/distutils-common-base.bbclass | 5 +++++
 meta/classes/distutils3-base.bbclass       | 1 +
 2 files changed, 6 insertions(+)

diff --git a/meta/classes/distutils-common-base.bbclass b/meta/classes/dist=
utils-common-base.bbclass
index 94b5fd426d..50dca7550b 100644
--- a/meta/classes/distutils-common-base.bbclass
+++ b/meta/classes/distutils-common-base.bbclass
@@ -13,8 +13,13 @@ export CCSHARED  =3D "-fPIC -DPIC"
 # the python executable
 export LINKFORSHARED =3D "{SECURITY_CFLAGS} -Xlinker -export-dynamic"
=20
+PACKAGES =3D+ "${@oe.utils.ifelse(bb.data.inherits_class('image', d), '', =
'${PN}-tests')}"
+
 FILES_${PN} +=3D "${libdir}/* ${libdir}/${PYTHON_DIR}/*"
=20
+FILES_${PN}-tests +=3D "${PYTHON_SITEPACKAGES_DIR}/**/test/*"
+ALLOW_EMPTY_${PN}-tests =3D "1"
+
 FILES_${PN}-staticdev +=3D "\
   ${PYTHON_SITEPACKAGES_DIR}/*.a \
 "
diff --git a/meta/classes/distutils3-base.bbclass b/meta/classes/distutils3=
-base.bbclass
index 7dbf07ac4b..54bb963a57 100644
--- a/meta/classes/distutils3-base.bbclass
+++ b/meta/classes/distutils3-base.bbclass
@@ -1,5 +1,6 @@
 DEPENDS  +=3D "${@["${PYTHON_PN}-native ${PYTHON_PN}", ""][(d.getVar('PACK=
AGES') =3D=3D '')]}"
 RDEPENDS_${PN} +=3D "${@['', '${PYTHON_PN}-core']['${CLASSOVERRIDE}' =3D=
=3D 'class-target']}"
+RDEPENDS_${PN}-tests +=3D "${PN}"
=20
 inherit distutils-common-base python3native
=20
--=20
2.20.1

