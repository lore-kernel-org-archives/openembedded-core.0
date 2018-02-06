Return-Path: <mkelly@xevo.com>
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0044.outbound.protection.outlook.com [104.47.38.44])
	by mail.openembedded.org (Postfix) with ESMTP id 23CB278461
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Feb 2018 19:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=IORGoERzTqu+7YHiS23iZLufitXrRL9YDAo3cmRqxns=;
	b=Az+O/h6zZReUcr0OgqwqxJ8zLc7QFFaFE5pV6CDm5z2Zc4a2FxEWIGGKVgHnoErjJPWNEguNqYmeQoqfkh7MPF6h8r7vU6wqOkcvKXhLRpuzE6sP24Prhv0MnIYqQ+PP0tfXi0y6LzS9anno99XqBx/RoW01VPTnn3shXFcljzA=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from columbia.corp.xevo.com (65.122.179.226) by
	MWHPR0101MB2943.prod.exchangelabs.com (10.174.170.14) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.464.11; Tue, 6 Feb 2018 19:48:54 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Feb 2018 11:48:22 -0800
Message-Id: <20180206194822.25248-1-mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: BN6PR06CA0017.namprd06.prod.outlook.com (10.175.123.155) To
	MWHPR0101MB2943.prod.exchangelabs.com (10.174.170.14)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a6d0137-21bb-4524-a267-08d56d9aa844
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603307)(7153060)(7193020);
	SRVR:MWHPR0101MB2943; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2943;
	3:Oy8b4rNMBZuMZOSskJvG0ewQnW/oO4GSdXvt/zAhNAfsArqrkK+MrNBwebV2vsRC5YK6oKnrWqeIsV9AScx1fDG7UYZ3JKyaqVls37BQ+5eu3yS61+dpJJNIZG+eXU0pNxWz4iqtLW/JJrjCJyn6LjoqYfutA5tXF2jO9i4HMojfmfwXra1LR5qxkKY8Ah5X6g7HYqB62US5XECKVN8zfUsGdEaH7U7at2/2klHN9XA6z4kb8FahvPMMj532XyO+;
	25:8yHcOfTZDgEZ+r0d02GRZYkNCkTmsBDsDdEAV6dpGDeSQcU5ctrGAam2rCdswGUmS0nsOVFAEiLTiNmfCxSiOM7Lfs4i99eU/QXGEx5mqwa9DKLVD4xZYyXHPR/MO1LZkISe7ndE+He49rOEkK76Yb8TA2a5Ok++5pPhhf7YDu3X+FVRoqDVZbjnkF1kQ32l55e7k5spuO+vomufeDam1sUfxXJfXytbeq0OTJbGEbapcn0ED7MVs8SEKm2Ub/t9aghCaA5OAxiPD69NoyCl4PS0ZErM8w3azHk0MQOiEOykzzYLpbKVDTKkyliKsgQixDuaaF0EgoQRWykN0IzfvQ==;
	31:iiMC300O27ie6CGs904qa3TmTjAdx9a7Y8aGHPQ6CShHaYqRkv3L1aq8NXsli3k1ISlLaobvUyTCGdIrT8yvcG1LEH6kToNoNfujeQmRoKcT/NHNbRorMK+1hdP+moPFl4PmCb2T6hvwGyewogtNgR9/gCLoRJ0Wz5680ugIvuuUWfexHOlhhr7ZZt5t0vT5YXk6V1aU+bl5nciV+vsbHU4pl+stt0svS3LsXqLEAQU=
X-MS-TrafficTypeDiagnostic: MWHPR0101MB2943:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2943;
	20:m/M+Mp34UKM0MCZVqxBHYZpvl1rx+y256MmkSbmFleAF+k7MhiUjRXB0PJluSNyfWGuNl+VSwPTgBXjnMbbsAJ2cD7PNWNpgGhLzOZXfkybkLhHMLCQnI41J8TpYgTvQjMfaabpn5CkYu6YUTrAKWn8DbtBMIW8MSvJSsTfVyBHepMNSSQcuIs/i05DjS2d4WBED3cKPaS1BmWFXs2Ra7/ZlR04gHdAliMtQg20qzf/pSYM+/x5Fx3O/9DfewsAFzneles5GooijnbCzCnGlmZpYNwHkPkhJPzxFX5H7M3bSbLrIaIThqXBJXzFdqTatysbdD4ivXSC3ZMFIuoDVg5+vXq/8Xy6DBEm8w6y5fRUSJlgeO8fbArHLz34nI+BhbTda2ZxeW4ecBQqAyDadw7O7N0gEiM+toum/HQpCxT0=;
	4:g8sjT0KHBT4ehMm7u7Ii0nPul8FzzZ9fcVCUEpWCi4de3B91s+cDWM1qxkkv4UGaF6jnSfl9wKuqPFRfxjFvzzOTWKgUaHrIUZMqgfzcjeVu/zFBcR37NudOqQzCsS3dkobxr9Cv8ufA/uhODFw4C1cDYo4adz329gy9dTpUpUg1M7T0HVe1qBSW3VsgOKtRe+ZzoIaTK31wa4eJXHmbmkRp0CeCf4PNJU3V7mKlp/iCcFEX02UbcaaLML20adOiWbECzDuzR00qUA8/50PhpfqKaEwrbLID41LZQjK0+bgPSkCiYOlFbm3bXYnDBaKL0QjyiENMHP3t+GlAsdWMuBlhsYGCoNUovLx3QgeH3ag=
X-Microsoft-Antispam-PRVS: <MWHPR0101MB29431BA942C78577F33F8869ABFD0@MWHPR0101MB2943.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(31051911155226)(228905959029699);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(8121501046)(5005006)(3002001)(10201501046)(3231101)(2400082)(944501161)(93006095)(93001095)(6041288)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123564045)(20161123562045)(20161123560045)(6072148)(201708071742011);
	SRVR:MWHPR0101MB2943; BCL:0; PCL:0; RULEID:;
	SRVR:MWHPR0101MB2943; 
X-Forefront-PRVS: 0575F81B58
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(366004)(39840400004)(376002)(39380400002)(396003)(346002)(189003)(199004)(6306002)(50226002)(1857600001)(7696005)(97736004)(36756003)(25786009)(51416003)(26005)(4326008)(6486002)(5660300001)(6916009)(7736002)(53936002)(305945005)(86362001)(81156014)(6666003)(52116002)(966005)(8676002)(81166006)(478600001)(8936002)(47776003)(54906003)(107886003)(16586007)(105586002)(316002)(66066001)(186003)(2361001)(16526019)(50466002)(6116002)(1076002)(68736007)(2906002)(2351001)(386003)(48376002)(106356001)(3846002)(228453006);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR0101MB2943;
	H:columbia.corp.xevo.com; FPR:; SPF:None; PTR:InfoNoRecords;
	MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR0101MB2943;
	23:uf4y9M7bE43sFhcN31a55qvQTJcIhR9mkgpSWCV?=
	=?us-ascii?Q?DjFbyRjfGLDOdsEALylf4mXC6jb3CklZXdFdwI7E16cjeBRn2WC5JOhnuOrW?=
	=?us-ascii?Q?yD1z4iq42ZX04ypSbUo1SjzpkKO5f6FNskKwDvWsDvbQb5v44PrWWrWWos2E?=
	=?us-ascii?Q?e2cslnUr35pJ6ZliNaxxduvx4LgLLw/viKR8tlJ+Izbew6S8nrHw6pc08vjl?=
	=?us-ascii?Q?bsozKQaSuMETyDtKjhXJEnZQZIU9R2eUa8ZuPnwMEdnPTfe+Yf2orSs8SApy?=
	=?us-ascii?Q?BGYajNaYpGTGnbZDPvyL81pHdNW5lci49Cn4BM0oRGUNIRFtWuEWyd/JRsOf?=
	=?us-ascii?Q?9UWtIT0iyOdN3XxeuIw7ArWOGVJIfvKDZb8FRBBy6rP5LqaOTi4+Xzw0hiGV?=
	=?us-ascii?Q?I7Nsk+r3CwbhyPPle+WriKc9zQoFGKfwOVHPDS8t+tHrmglmQ/IYk4zNHcZg?=
	=?us-ascii?Q?C8iAYVvI/F8DHxcPVeDgNrPBEtftVP0AOEmeKTnGcGqIpO9g/tS0LFTDrrq7?=
	=?us-ascii?Q?7TpOY3+y0xaC/9fdl3ZLGuLF2xc00ifI8P43V8qFz85Ew0bYGWogri8ujVQ7?=
	=?us-ascii?Q?lUzpvCvgeDDcBU7ddWtzrVoIljqKD1z/0dYvGprbwOjSVLAPqTQZ7RmFMW8y?=
	=?us-ascii?Q?H/0p0yPMAdv32HHFnqswlkmkq+5QwEJYbfpDFpyrueGMF53LdVAl5OT+D+XW?=
	=?us-ascii?Q?6s32Z7hL8iXGpuVf72wC3n9b26x33LwbRomuqu5BtvfK9y4B+Mes/ygD4YAG?=
	=?us-ascii?Q?u39RQPzS6UwbDi7h4pEj7xxlL2rXpZv3o53OWcpnhFwlRiY8wi0OeEZyPPJX?=
	=?us-ascii?Q?kWnK8yOKNIkJyJWoYyRw7c0ALN4vTQMww1ldZI9qOFRtr5y6YeaUI2h3zQmD?=
	=?us-ascii?Q?6vxohQazMcR92gqA60xljMkQhPcf9b8PcJgfiXNh+VVv95hzz8+Hv8a5pAmy?=
	=?us-ascii?Q?RXLorag/2Ly7dE9EKq2x+YrqyyqWiQgnv7GjgYtaQotcNKlp1CBtOUhlKdkU?=
	=?us-ascii?Q?XQP/9G2r3JFmd1/jL4U7BY9cdYfwIwiaKN+i9syAxGuGFIgefgr/XhX/Dxc8?=
	=?us-ascii?Q?qgeH4Efypl1Q9aYdlMQFCpMGksMDo5GsieNgxrSI9/GoM1pnYg+BXg58ygPE?=
	=?us-ascii?Q?BFIPE4U0vvIr9UGbVPP3XJpAanvQEele7/gFilXOFrx1s3vTndRGy2t72Ml1?=
	=?us-ascii?Q?nYDt/iPXmBAPT5QCqEMY1fwDeJRQjdU+jbot9?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2943;
	6:OIy9FbkRj/vmcY12j9luDqK80HpoHT0/0nGCB2r+zQa0hNKciwmnRzXzkukQHm/lMN+ZrKOU4RlSVGblDPYZsNnvvspwMSqOt9aYMRtWgxj+Znend9VpEM9BazQNTKDZBiU0xqDMUBe1Ihkv0ExDehzCNoM5YhJ7XP9VP+v8QyfEywlR9Gncnq8ptW5zjutH3m7iCZ6F3jlaaltry6HOr1jknM9i2pVPsfW82r7C5umwcaYiMafZ9Z7D7h+2q7Piw9R11e//vZkmWtZEEcHN1zn9ODBvSGfj3rYSUuVxUMmRsB4h2EpL4rIxeMe5MY4YsfRHzr394Wa53m2tBzH2QCicj7BgKPxDIxE0hC9t18g=;
	5:hmrIeFZgWZXMX9OfMmYFm332lyIdgqyFxnnji76COr05sgNwbkq4AaMo2J+UmFWqOp4E/7H9G+626jwXZ19kwNCAeCRdWG/S0OoofgIJNKUJwPoiYTHBGuO5MjJKGnYR/GynKScIIP9STxtt3zX9MLU6Mb+D5Prlf6gokv5dh4s=;
	24:IH9d59qHNJy4pL3J8VkhDX15sLHsCxYdLT9h30L++s1XMZcyi9cgSNA7aY2Rnuo/p01t6dI7V9hMtVAZEw3Bu0XQ5sbTuEbwLIHRY7d0Lmg=;
	7:h/6oGY3taRYqlUArJarzSFcs9GREjDl7rsxuMNTwOOmEtCdOYbSrUDDDXi242boDbIlSen536jJk66t5dDgb55sO8WzqrIDjIbmbowdE0A8mLwkRoATDAQ8bShnQjnCSritdJ6ciDyZJnMYzZMKwme2Wv00pbggvKIZOmLrBiHxQIVFXp6BA8YWobjBa0HHhJdyRRszaxCYjvdLFZdaPbJiuQ3eB4Aqf8Muuy8MUHeA1WGSUNfaBMcNOL2TeKuc8
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2018 19:48:54.9348 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a6d0137-21bb-4524-a267-08d56d9aa844
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0101MB2943
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [pyro][PATCH] python3-nose: rename ${bindir}/nosetests into ${bindir}/nosetests3
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
X-List-Received-Date: Tue, 06 Feb 2018 19:48:56 -0000
Content-Type: text/plain

From: Denys Dmytriyenko <denys@ti.com>

This resolves a conflict when both python-nose and python3-nose are pulled
into an image and try to install ${bindir}/nosetests binary.

This matches with how other distros are solving this problem, e.g. Debian:
https://packages.debian.org/jessie/all/python3-nose/filelist

Also, other packages like python3-setuptools are already doing the same with
their binaries.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 meta/recipes-devtools/python/python3-nose_1.3.7.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-nose_1.3.7.bb b/meta/recipes-devtools/python/python3-nose_1.3.7.bb
index 99bba4403f..1e2ff74f57 100644
--- a/meta/recipes-devtools/python/python3-nose_1.3.7.bb
+++ b/meta/recipes-devtools/python/python3-nose_1.3.7.bb
@@ -17,6 +17,10 @@ S = "${WORKDIR}/nose-${PV}"
 
 inherit setuptools3
 
+do_install_append() {
+    mv ${D}${bindir}/nosetests ${D}${bindir}/nosetests3
+}
+
 RDEPENDS_${PN}_class-target = "\
   python3-unittest \
   "
-- 
2.11.0


