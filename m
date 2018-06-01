Return-Path: <mkelly@xevo.com>
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0087.outbound.protection.outlook.com [104.47.32.87])
	by mail.openembedded.org (Postfix) with ESMTP id DA1E175053
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 21:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=mkWkt2kRdPgaxIlcPvFJU+KEz73/9jj4oyWPl174G0o=;
	b=KbfgTiYapl8OYJUPZezCwJfoAQrIcVHQA7iY6KhDFYaluIQujuBLHd9cFUKWvVubcjKwirY3tZCWRkffkhk63naD249+sfjnHTqqogSwf5btLh8EWG5XsdGlB2z9WcGCiC1FGIBRShi48GvYnnPIhmrctq4qSuV6f72Oh4bTrCI=
Received: from columbia.corp.xevo.com (65.122.179.226) by
	MW2PR0102MB3417.prod.exchangelabs.com (2603:10b6:302:3::10) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.820.11; Fri, 1 Jun 2018 21:03:14 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Jun 2018 14:02:35 -0700
Message-Id: <20180601210240.14969-3-mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180601210240.14969-1-mkelly@xevo.com>
References: <20180601210240.14969-1-mkelly@xevo.com>
MIME-Version: 1.0
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: MWHPR1001CA0028.namprd10.prod.outlook.com
	(2603:10b6:301:2a::41) To MW2PR0102MB3417.prod.exchangelabs.com
	(2603:10b6:302:3::10)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:MW2PR0102MB3417; 
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3417;
	3:f3ORxg5o2GkunBJ3po1W0kH5zqHi/DVVsbb8s1dgZYp3BY3W2+EH6UzLiI8xpjRk1YCiBM1UND+1aARR12s3Uch3ZVPicrS1jXwqqPOUDsF43TuVIVT+FH4woL3VXveailPS4+t2NIIiA34uHzP1S5ffkixLVdK/Ye+fYEA2glXqePgwkZR8hMCTa3FsX8WoGfZe3F0/C0Jbag5vlFbOnNV+VVs7do+2ZmyOb1saBxcrV3+7lpWq8Sv99AIGqd4H;
	25:zUploTinkfI8epYyVkf4YtdaM2dCfxa1S0y8NgCwdMoPSZOPd0/umMdQCaH470+JZYpEFuUeD5xRI8vL7ovVdaoVB2JaeIOWlMK5XvT6dbOeBVbyWDsf3lceMi6vBtvreK7r5kFI4Kode6HrB6BaVWnVSp3N/xtBaxKQ6E+hSnDGjhxcbNrAZU3y80IG3L8wAS3PQ0ZkLgQUR/Q0czdhYJoYEGiGOVfInZVj17rTxRya7YJ6qOeTeI+xY8dBOwig6ftVfPoWSYbf9ntiLcsxUV63HPNBcDzMb2bfqAcs1Efm7kFQhO5NRUrlBLOyt4B6Ip40iZgWtANlu23+fOrLKg==;
	31:AzSszEb8CosWiwtorIXix5qUjYnNjp44/KOSBwhlUu9LhnjKZMNj9I5jfQQGrH9QPQtySDRRvq0wRpEjFcXKEXiJhLE+bBUu8OwZfEl5Uqakr0ALmPEfD7648ccV+0bToQnuK8iFKV6IGOcMLbj8J59aikH4ywKegjx81Xd/dSubNGMK2K4+IQ7T0z4WK0C4oRIJiKbQZqJbD/YEVPW48SX4wDB0tZXRIIdygIMRNBw=
X-MS-TrafficTypeDiagnostic: MW2PR0102MB3417:
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3417;
	20:c6WxvYF/S5QGWjBZAlZSlxfel2MMwbAieC3ei8f/5XSLiHI1hmGlRcYE0fErEPnrkBNRipnhGVObYOaFuXCxYbLkZU9t2s0ue/NRPKut/0exmP1Rn7VMcjY1oWxr4w/cDra9O5SJ4GJ92oy3L2K2zNc/H9+RnCXic7wsB9oFQjhjUdmBm8SA7YE0NDm6bA1w606QCvsS3TdnY4G8JfFzAsRLW8nEJtRVUyp60BVYlKjLfECobMd6keKpCsvJ15mRh7pAtlv++EwvsbdOcvPmUAlLE2RLlu7MPFkgUsBFYPD4bjO8gDT8wJqV/0QsJ0nEoDtVtn1iX2iu4Do0vZP8rsTWzjxxJc7ij7aYFZsIEi5kpzh7pLhT1D0ipNj0eNAU/V3B8RCJ+mLiwpU4N3/lXIQbp57NvgPv862xu9VB/Nybq2OQMzXMNEU8H8JxjClilWBpiOrUCwFvwsG8HRlkDOuG6UFWVP5eM8WHmIHPaFNUC0cwwXyBHOSL2+s9csu1;
	4:D8Iww50/DQ7BH06oifprVi6uNn1vERo4lAVJRVDhSxsV4OL+ldauZTyUzg6VG1uwq0eG4fDMd08eUTKVau7ohIxFfCPjSsMWu9cluFgKhfAo9NLGnUhvrD7S+JcCWRXcw7+QH8lVUZ0sYjkSiPMJ3KWQpxI2EMQMkkDWRpN2zxGIN7ufyF72FBTq39hTAotrEJjka1CgLrhVrRvzq1FUADE2yWFdnnCbA86o9iQuoX4mAH6ECtFtOFkLDibRSI3KAOhACEEdKqcXwibHMatOow==
X-Microsoft-Antispam-PRVS: <MW2PR0102MB341763A103F3E6B9AD1699D3AB620@MW2PR0102MB3417.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(10201501046)(3002001)(93006095)(93001095)(3231254)(944501410)(52105095)(149027)(150027)(6041310)(20161123562045)(20161123560045)(20161123564045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699016);
	SRVR:MW2PR0102MB3417; BCL:0; PCL:0; RULEID:;
	SRVR:MW2PR0102MB3417; 
X-Forefront-PRVS: 0690E5FF22
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(346002)(39380400002)(376002)(396003)(39850400004)(366004)(199004)(189003)(186003)(68736007)(6486002)(86362001)(66066001)(106356001)(105586002)(47776003)(7696005)(51416003)(52116002)(26005)(81166006)(8676002)(16526019)(76176011)(7736002)(305945005)(50226002)(8936002)(486006)(2906002)(956004)(446003)(476003)(11346002)(2616005)(81156014)(386003)(25786009)(39060400002)(2351001)(48376002)(2361001)(4326008)(3846002)(6116002)(1076002)(53936002)(6916009)(6666003)(107886003)(5660300001)(478600001)(16586007)(316002)(54906003)(36756003)(97736004)(50466002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MW2PR0102MB3417;
	H:columbia.corp.xevo.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MW2PR0102MB3417;
	23:GcaT2QBnzNgTb3Hz2mBUTTPQIE5fPFWtII8nc+0?=
	=?us-ascii?Q?7bYmzTIPy7nXunyksnnJE7KC8WjE4hYY7nC4klAHWcv571wu43AxL0HEica0?=
	=?us-ascii?Q?6FgArgT19g1vH/a/+QqXB7Ja8AZhRtZp5ZQRLUcNQW+hiHlOQQGLlD0CJqCT?=
	=?us-ascii?Q?kPoGMQYDWhK9xDtFQBpBQPYqfwdagyPgNCCMbq2zNqT3ziRcIzNbL20xG2G6?=
	=?us-ascii?Q?7fRCXboiK19ke5DEZ59hF6+kLNRup5LLq5DQf1QISpxJjJR8quznLrd0/0x6?=
	=?us-ascii?Q?fZge6wScteCKie2w9lGikt+lZooj2vAlwYyesMS9G0vU6a+sny8ZLKfD4Zu5?=
	=?us-ascii?Q?l6wWaq44HkpEK2ak4zJXjA/4NJh46RsiI1MRBlnT7l0FOm1g70zPR775HpjQ?=
	=?us-ascii?Q?nb07YtDXAiowb44YYxIe/JEYhM869uk+85/iNGoF0ZSQEJhaBZqjKms7Jpre?=
	=?us-ascii?Q?dBvvZqSHE8tsMSZtOAFctEC6DocndYOuemKBEccMRrR1Sxc2Q8Tatta3wSmh?=
	=?us-ascii?Q?lDf3yeJZSJKCByfdi/7tsHQadhlzvx/4drv3yBq51I+RRgZHTRcRRLvNKVMz?=
	=?us-ascii?Q?8akjaqKvbbgw/uWH/Tm3DQficTbk4fo8pgW/NXvvajIDDiGPEAWUheM6yAFu?=
	=?us-ascii?Q?QVrCg4qc5RWLrmHaYFAXbvHjQmoW6ZvG0qiipMQNanGEXOrxGwvu6C8zQPHs?=
	=?us-ascii?Q?vw9vFN2A/FAVTskZpqZILsZz//mAMcpVnH+I9kqiFknxoQPsWTIdM1a9gXIR?=
	=?us-ascii?Q?ZRNzYNW9VUQ/79C4xvkX5L1khcll+I/iQ29BmsATddx+sC6KKxKvm3knYvem?=
	=?us-ascii?Q?Vog/9MjL89e+BWXtovwm8okvqrKpRhlqc9rnEsgiRo4IYcjt5JyNP47bQKdf?=
	=?us-ascii?Q?cKZJ8d+hAOdtqVAmb1qwhAwW8/Z6qV7K5AldnpXaw4Vn2AYa68tsv6JiA5rW?=
	=?us-ascii?Q?6XSfNBECZtVV5M3TTzVB/uDz8X2pS0HltP4A/3ymrcJC/5W7a6z6HnNzZUet?=
	=?us-ascii?Q?o2tNiUXO9rk8B+IU3qCr7UBcZ8GrzUFa4vYxfXoFtJrENLIleiamwEaV2WF0?=
	=?us-ascii?Q?YsJVnfhCCi+QY/BLocHEQigg6k48dBRRfMzZIz8ixpkz75KlNMEEalMn39VW?=
	=?us-ascii?Q?SYYnOMChcBVaVnVblv/7cx3JPQpA2wpaqBbzHwYd/yo52DxIfSybNOaVkrcZ?=
	=?us-ascii?Q?2QgTkQNPHJ3Kx6f7YlRKhHnCnqX69anryicHpvtbSexb/F+XHHtnZZYlkFvo?=
	=?us-ascii?Q?lO6rVFxL3K8y5szd85pNufml2FxPUj7DQx8Y6uYHMELRv9fM/foRUlSDP9oI?=
	=?us-ascii?Q?bpA=3D=3D?=
X-Microsoft-Antispam-Message-Info: TNAneImZhXGdMItYNnijeDovQTsZLGuC/iB874lQgL6qIiugjcgWNO0qUK9kSiJ5PMAYLNptORJhRFc77xSHfNmj+LUmNrUCXxxlkToVhOPnJ8oT2tDNR4EhkCh7Wz7qvINZBQZIHw1fYn+/VrHFMzAtERXLkfzVJ37CupQa9EfuVj3tu8dY3HZRR3UGaydz
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3417;
	6:r3tndzGQcS5H5uQ1P24DdkWXJQNz/IpyeMPou8BXEw0wMAzwfvPdS+Da+3Us3UJvBzTjnQKjccVlRd2jCwZQNscQNzsZmpS5Ntbv24eurvYbX/NQINc3lRmvL7kJOsqt+E9k7ib1wPEdZuAub+2HBt75AbUylKJ8cJcwENPSTYt5DlC++NQN0EaIVm3inyOZOBwSxmFaVO8goTksHEO9pSBALAFjze/OgaQI4ntK9Yi8BE2bkvnmLfRJvPofrZ3MQ/FuQV/9kn/52cQLc+rA1gX5S+kHsDKM3b07Wr5qwSVUQm8Cm9UoFtY9WSJLzVchScP5oqBKGFeXi4y5SXHOS1eOI82gAnDKXLyiYSgD7H/F9OjFliGsbizKJWCIMFiwJbGRDW/fNVAMrBc5/RLxMPeXWz6SgTY0i+ovKTSj47Bl+ih/TLJLH50XZLTn+QhVyGorVUCwM2dhp7X/mTk6LQ==;
	5:wJLShvMUW8pZCfBbQ8J+djiiiIU40BeAdv1VpgpwX4xxVptEPMJYbUNCn0VLGpO96kgtuFH0CUOVIGiD2e3PBYQ4FqWom3YcA0OZujYKlpgouyxySJz4xok3LYZyNemSiUaltji2drKLa196U9O1zfoIZMJXHdZxWBkkbBf8wRY=;
	24:hm4Gejd1R2gG9wqebiki2hlGuYpLQp3xiGjqPTuUVk1M6P6wo0wBg9yFmoOCt+33hmXRlgR/d08AHTjKE7i2EHRpnjvock+VjXPR+ccCQnI=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3417;
	7:CFHdN+mVXPLpIT2UmxhsnG3e9+VlTS960+mQyx6Qpwidv3LHNcjQVfSVOyiFtjIgwgqAMsmYzNGun33E3wZY5Ov7CL88xQC/gpkkqmYH5shHF63A3uIM9zouLqPvq/TlhuyGEprZDlnk0DZ0nlSwL3ysm/VJUq9U/NBY+6GaytK9olh7yv+ghk3a76TwG2NxP+T7BjusIqCnHl5rzvbMk2jpfwhLO5BE8DGdam0xxOvDs99rSJcEw+4EejDwxJPt
X-MS-Office365-Filtering-Correlation-Id: c4cf587f-b93a-4bd8-2fb8-08d5c8031765
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2018 21:03:14.5445 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4cf587f-b93a-4bd8-2fb8-08d5c8031765
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR0102MB3417
Subject: [PATCH v2 2/7] nativesdk-python*: suppress user site dirs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Jun 2018 21:03:15 -0000
Content-Type: text/plain

Currently, $HOME/.local is being added into sys.path in the Python SDK
causing subtle host contamination. Suppress this by exporting
PYTHONNOUSERSITE = "1" as documented in PEP 370.

This issue occurred in the past for python*-native and was fixed
similarly in OE-core commit 8fe9fb4d5a61dcbcb3fc5b9ee0234cc135af873f
("python*native.bbclass: suppress user site dirs").

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 meta/recipes-devtools/python/python-scons-native_3.0.1.bb | 2 +-
 meta/recipes-devtools/python/python3_3.5.5.bb             | 2 +-
 meta/recipes-devtools/python/python_2.7.14.bb             | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python-scons-native_3.0.1.bb b/meta/recipes-devtools/python/python-scons-native_3.0.1.bb
index dae89ab5d2..68b63c9357 100644
--- a/meta/recipes-devtools/python/python-scons-native_3.0.1.bb
+++ b/meta/recipes-devtools/python/python-scons-native_3.0.1.bb
@@ -4,5 +4,5 @@ DEPENDS = "python-native"
 RDEPENDS_${PN} = ""
 
 do_install_append() {
-    create_wrapper ${D}${bindir}/scons SCONS_LIB_DIR='${STAGING_DIR_HOST}/${PYTHON_SITEPACKAGES_DIR}'
+    create_wrapper ${D}${bindir}/scons SCONS_LIB_DIR='${STAGING_DIR_HOST}/${PYTHON_SITEPACKAGES_DIR}' PYTHONNOUSERSITE='1'
 }
diff --git a/meta/recipes-devtools/python/python3_3.5.5.bb b/meta/recipes-devtools/python/python3_3.5.5.bb
index f893b846ad..4dae4fa4c6 100644
--- a/meta/recipes-devtools/python/python3_3.5.5.bb
+++ b/meta/recipes-devtools/python/python3_3.5.5.bb
@@ -176,7 +176,7 @@ do_install() {
 }
 
 do_install_append_class-nativesdk () {
-	create_wrapper ${D}${bindir}/python${PYTHON_MAJMIN} TERMINFO_DIRS='${sysconfdir}/terminfo:/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo'
+	create_wrapper ${D}${bindir}/python${PYTHON_MAJMIN} TERMINFO_DIRS='${sysconfdir}/terminfo:/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo' PYTHONNOUSERSITE='1'
 }
 
 SSTATE_SCAN_FILES += "Makefile"
diff --git a/meta/recipes-devtools/python/python_2.7.14.bb b/meta/recipes-devtools/python/python_2.7.14.bb
index 41a8609b15..b923b9237b 100644
--- a/meta/recipes-devtools/python/python_2.7.14.bb
+++ b/meta/recipes-devtools/python/python_2.7.14.bb
@@ -130,7 +130,7 @@ do_install() {
 }
 
 do_install_append_class-nativesdk () {
-	create_wrapper ${D}${bindir}/python2.7 PYTHONHOME='${prefix}' TERMINFO_DIRS='${sysconfdir}/terminfo:/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo'
+	create_wrapper ${D}${bindir}/python2.7 PYTHONHOME='${prefix}' TERMINFO_DIRS='${sysconfdir}/terminfo:/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo' PYTHONNOUSERSITE='1'
 }
 
 SSTATE_SCAN_FILES += "Makefile"
-- 
2.11.0


