Return-Path: <mkelly@xevo.com>
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0087.outbound.protection.outlook.com [104.47.32.87])
	by mail.openembedded.org (Postfix) with ESMTP id 7835975069
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 21:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=6ZtL3n6tnowfyXrR/vtpIbdVzDRhBeFafTzAR76nZaY=;
	b=iVEKo3/xttKu5hJYu++xSKkcg6yQlK1an7/HC6xzxYM4ZIjTZIz9wA73kA4OJ+/we/u6foZFV3WMEtk4UYNrZ9ZBQdq0oyY/tL/WNQcorxOu1DpW4jYetVZXfXE5mcVZanm2KbH2wm6evt9NS05YhvhKwpenrpBHODTCY5tO+gM=
Received: from columbia.corp.xevo.com (65.122.179.226) by
	MW2PR0102MB3417.prod.exchangelabs.com (2603:10b6:302:3::10) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.820.11; Fri, 1 Jun 2018 21:03:15 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Jun 2018 14:02:37 -0700
Message-Id: <20180601210240.14969-5-mkelly@xevo.com>
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
	3:sEH4W7+yfCYXc8HRfZoJpk80cOtf4p0+s9aY7JDf0cppgwq2cGXmlYhym0LH7ZFUwNJdT0Fh+HeYPXLWu7h/ev+MxkDNa37wE4QjDpIRoNJ7GADqE3j6OVvl1JbB9auLONUwM6ah9Y/iglL43yd69qNOLL+5/LU+ifObN3HsuxjOTER6CDDKYeGleBnPMaugKFUpMEfKgBMcoZHImcqRyTYvOFNGgaz2jguonuV2qX6OnxLWEotQarRmWIMfLMNS;
	25:hehc1uB1QDB9/WlJqLBFHs+KI6N27Qr/o71i6tcbft9D/ZC/+8y9YJ5F1hGCvxi93LZv3NwciSckrHT41dEAWfxFBdf97HsRDpG1vk7/AGpWhdZ2oGPaR+9gv5s7Phik9zmx9PvefAwkeFe0hILSAsLCe8A/qA2dIXiaeIBJlwgOuV0E2bQ8yrvfrieFLgjYNPpdYJIReuXkHqYgcm2stS9jSHurs9q3uK/meluRvE9rXb0F7rdI2L1/TpHan4s8r+KKqlpSD4RGeb7Y6KYHtDQMO5PLtrJ/mLRWbiDLHCxnD5viK0GVd1XFRKfOfb1elxqXqkueGjlIGhR/EscqZw==;
	31:HPg5J5ZY+koglw6R8TRuS8v0yfXpSU5MhxTuagRnGAsI3CmM1lrFodeuOl/KyVKanltN1QYMdVqOkCjHIP8K2Li6L9gPiXJd+087Gzbq9YtNbcB5bRLvLYtuZcA3Tz/tnrJWhCChJBPB6YgtN7Ebb0Qdh0/4NlzF2veQaeaIxn/So+gD9SBZeDC9xI6VDs//91SxzBsczM8SjX4Zh3mf53o0XLWm3UzQ9aFtfwwzf00=
X-MS-TrafficTypeDiagnostic: MW2PR0102MB3417:
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3417;
	20:OlAqVDo20bam33LdANuxnMbP/dq65z6xFtM+Q3EBETdriuRfBtAdhgRr35g1AIYn6JGxL+CFEpl5k0itQ/Fy96o/hMncRP3DIKONi+u9wg5WeLi5I/ykdMjQizSA/yZFDRhIpL4njCMCwGQ2mFVoR8aOu87kBQywz1dTkJJidDEFbqobb1p/ZzqiDl7Pw1kt/AXUwELW+bX7/Qfef0J+ao1pHruZn9rRIAx57j3v5Je1zIj3XzF9vwWgESayfRV1fBYJw4uFdUFXEnqbpfzDgkpLmUC9czFImKLZrBb3tEIg1oWBN7WBlaXDprwlwlAy0Po5p+HvbPGwDkQ1GhhI1WgzaUgc5OkAAVGLdfyAmcGhUgEbubGU1axpmSIjWK6i0+a8ziXleuSx2PY/Ex6zD/J0Q3YX0QSNsmkZR8s9Bid9LuWPpBfJwLNd/pNhhxzTyPLlz0uMwdXthzkA28brwZLhnHKSTsemMHAbJOODsf7ZGFcHnk0CWib10VpBCN2H;
	4:OtoRj3rHohrrEY5PopoKM07uIp5Wepi4U2buOrC9mRHcGrYhZ+JTWKgmDYWRsGPymPIvzsz4La8ZQW5gBoTu4h7mMqc/IIYlQLeSA+i9rnG5G+4s01tyK6lJi7Yi8Psm6YQmkZYJwbINP4sNUqWytmUGzy2VZg4B/dI8znCy5XhKSA4O7ZBdEVkGdULpLpDWiukTru33mLKC/qS6jaadgdDBO/Nn6RMZv1Es1LdIKohSQtT1NhmDEX4zmsfdB9wIrquM2RBvgvBhGhHE0T8c7w==
X-Microsoft-Antispam-PRVS: <MW2PR0102MB341774D5F3D7200DC154C8B1AB620@MW2PR0102MB3417.prod.exchangelabs.com>
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
	23:mu2+SOh5Rt6c/ADGl/kBQnqH9Vk1qX4wBtmQHsa?=
	=?us-ascii?Q?Oa74x7Uolb4+tcyquJkUIjYURA/wCRSCnFGUDA4KURb1afgg/DxgW2hEokd6?=
	=?us-ascii?Q?mTu06tiGe4Ptm6srtQjcG06zaqjy+IaamjQppf16vqM3siSoBTZoUXxN3y1B?=
	=?us-ascii?Q?dq/GY45zKa8Fz5pbKvaOvr8M5L+VIfoEuW70FngDKV5V0p03AguQQwNSns/M?=
	=?us-ascii?Q?whXxAjf9tkarCnAC3lUt72W+IXbdjn3/4j7xknz0/IDMrQ2OKnmN3pR7xT7a?=
	=?us-ascii?Q?P2yHIuw89h7yBHmBsCcriQpvUcLyxyLRPXsMNYUVzuU+WMwa/s3MwQW8A/Eb?=
	=?us-ascii?Q?wGxwsAEolm/l7LmlvxGHWZ1Jf3LCdUpv4FCPkAPBAU+AaxlW49+MBpt1DF1G?=
	=?us-ascii?Q?+owf4IjXk/Yjxw3PV6SHWNCaa3RoxHA2vDhw9H3hQqSA9mMvcMJHeYDNhxax?=
	=?us-ascii?Q?D6+JRW2ACL8Bsd6DC1qsZJ8Dl+K5gu+k80fh6jvbGDVFN4DUdZSnxAs12lDw?=
	=?us-ascii?Q?C4isglPusxcCvDU7AVTkkCPpwjQgFcAAraHfP0FJ0Ov51TIQ4CVhq9vxxeCL?=
	=?us-ascii?Q?p5CD5jewJmM9H63VFFE1SjMzHr3noj7PRdm1Ivma0ayLc3garSbs90BdZSc3?=
	=?us-ascii?Q?gRdtv9Bep9uTkXDtFzJryamW/57kdPx+qgtjbjO8M3vYv6P3N3n62AuFk2+T?=
	=?us-ascii?Q?a4lQsFTE7j/7CYmQEAPW65NFV5rVMoLphnAZf7XJLN1JyECCM8ZgReCLGlm8?=
	=?us-ascii?Q?QUF0Z2diaYp53KShAYO8HSjK6o0J+pX69tpGlBIvF8t9odxe2YJSW8bHaegS?=
	=?us-ascii?Q?Pl8Z0mQb9wF+V2zGNu6HT1PQLWO0UeaFOzUgXRKmhzrCrSPKz77so8Whz5mW?=
	=?us-ascii?Q?3wcecQQJU1+eYeT2K3Rvl4ix0nl0d1GDLKE2rLD52CnpWWlrQ07bhr/HSHvm?=
	=?us-ascii?Q?GUnQSsm8h7n3qHxO3MMukMu6wecSGxOofc/zDX+2XmyZ3ccJjSYFkRRh7yIb?=
	=?us-ascii?Q?Tb9nx5GmyqeFX8JqTmvzhwRu51uDhwtUGBZSCSvAdo9ABcC+RLLqevGCB3Qr?=
	=?us-ascii?Q?yJ6J/D+5NsYE98TDsuQUTjk4bKQNe/EAVGuJnLJLYHY8iIoIbm5O+ghG1TrP?=
	=?us-ascii?Q?LBHsH2SuPCcSDSqCDnCoAJeghf7DBLm7rAGGc51q83o5SSrONl3CmGnPeDpg?=
	=?us-ascii?Q?JS0Cr3AR61OlzncnIoqijDGrAx1QjIIy3vZ9FgcF9xFlexsBXXfrw5Aj/ilI?=
	=?us-ascii?Q?TkozW7CNsFjftJw42nE7PZTmBzHdpjQMGBDZENteN223E69P4LoexzK7z8hI?=
	=?us-ascii?Q?t8g=3D=3D?=
X-Microsoft-Antispam-Message-Info: mCO/xF7phHMIkXeYqtp6eL0JZwNz+It8IDj7poLjTr7IPEQT4hpgF6q3bQs26OAI4wrkLa1OTqSUVC/4VlzOB/N5+zWhaNf8EmIHtnieRnqibqmIer72TURHZC27gB7oP9qcOQDKd9goEKxpjd8yD7x/5kDGdGMzYvaFq0ixMqZapXBuaSsYoXYMLBxhkcJE
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3417;
	6:UOYJQCVM7+P4jZFwsf8Kor75IEJ9u6zQBL82WWISyBWE926jB/3WMGnQkbA+unty4pD+cZCkCTZUKPoC4NB5Emw9nBeXiiWPRXMcaZhsRsl/PXSY7/n79qTrXovpZPixLsiYIwHnF6AYG4Awhi16o06EqQHkeHmqr6EqM2g0/G6EZq4KvFgGQk9iiNcVjUqEkQ2xxRx/CXj/jTXYjq7nBgaZVDOVzEteGLynVpEZNqp646RnjgXZ/TpDFOZhPcEDH8OIjRRAcEkVPcpGGjlpFCSsCpimdFtnDeO7UhDaclesvG+UF8o/ru5AZIAXCdam9jcRQjXFP8ntpgyFybZkwdWWcGxLS3jUu1t0YkVTRttNkLioIPoyLhKPbXJaACCg4ssJK5aPn98h38gzpdpxOcatOW4iNNeiHNvL2pX78eAb+FQimB7Z/RabJe6AGmJbkoiHU9544oVjIIk5mB1rRw==;
	5:OJrA0SHWc5Key+ttKa9TqqBQ/zWOtTtxR+Nlhsgk4wie8dzAGesskAAyRxpkmBnHQ1mLkDI1HyxF5V729a5Q7wf26r9xOdsOhPUw1sNRb0e6JGHqYqIO364OizJMVmCUfYtQ7Zlvl1IQADZcjgwtO534haEgvd99a//R7zkJUos=;
	24:IOKUHb3wLfWltWH5g5SXSXyy6FTxEVPjYRuG+n3aocah6uBJPMS2ov1xNK/+Qn0XZYPGOuCbbNYKlFDxTAUXbp4/iAdJHZOoyTh8rDTZcaY=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3417;
	7:taD1PSQ9a4inXKq6vnhfLn5Af4syNAWTZkIxyP/2KY5+QI41mL+OZXxdAOM5gQLZoS3B9r12prfX2TDZh5d5qHT+Zi8pcTrGmvoOIHz2EwxASQF6Zo/hbrcYrmpBo7sscMJqHPFixNxmMdMpQCVtb7PhJYCaa7jZ20YUCkcqGknJE6yvrNfuCM4BIaUIaSPzxswsbw/JynDcUhuWpcRPFKFwOwuG7gwBgiab0B2NkMF3aShl0D22oGPOonYxww0b
X-MS-Office365-Filtering-Correlation-Id: c89f9201-687b-4294-3ead-08d5c80317d5
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2018 21:03:15.2632 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c89f9201-687b-4294-3ead-08d5c80317d5
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR0102MB3417
Subject: [PATCH v2 4/7] toolchain-shar-extract: print post-relocate error
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

Currently, if a post-relocate script fails, it fails silently. We should
be louder about this, as it likely indicates a broken SDK.

Print a message if a post-relocate script fails.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 meta/classes/toolchain-scripts.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index cbba07838a..ae7bbef034 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -126,6 +126,11 @@ toolchain_create_post_relocate_script() {
 if [ -d "${SDKPATHNATIVE}/post-relocate-setup.d/" ]; then
     for s in ${SDKPATHNATIVE}/post-relocate-setup.d/*; do
         \$s "\$1"
+        status=\$?
+        if [ \$status != 0 ]; then
+            echo "post-relocate command \"\$s \$1\" failed with status \$status" >&2
+            exit \$status
+        fi
     done
     rm -rf "${SDKPATHNATIVE}/post-relocate-setup.d"
 fi
-- 
2.11.0


