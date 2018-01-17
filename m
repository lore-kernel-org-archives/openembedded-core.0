Return-Path: <mkelly@xevo.com>
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam03on0053.outbound.protection.outlook.com [104.47.40.53])
	by mail.openembedded.org (Postfix) with ESMTP id 8FF9C786D4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 19:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=z27FwthJT0JXvUxDWdaRD2ZYmliLGNyqgmqsnEY6wSc=;
	b=LVLyFcN3bWCGJ9NIYaA3O+BhQzoI/djaiOQebB+PRr/rvFw050Ziq2FfzR3pF6E+NMO7gIj+FgzYb35IE/vPpKIhEhT0+C2MZWRb+Uw+b8GS+Fi6Txhm5cwgv2SHzV0QKfLtByf6l//6JwPkrUXzOFE043tIn0C0jBURd4WE6xM=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from columbia.corp.xevo.com (65.122.179.226) by
	MWHPR0101MB2941.prod.exchangelabs.com (10.174.168.141) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.407.7; Wed, 17 Jan 2018 19:23:35 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jan 2018 11:22:55 -0800
Message-Id: <20180117192257.12472-1-mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: MWHPR19CA0005.namprd19.prod.outlook.com (10.173.246.143) To
	MWHPR0101MB2941.prod.exchangelabs.com (10.174.168.141)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc1e865a-0fab-482b-bef3-08d55ddfce18
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(2017052603307)(7153060)(7193020);
	SRVR:MWHPR0101MB2941; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2941;
	3:kBlUVq4YUXD/EQB2KnBEEYKAg32pnIlq2dxm5beyd/ppOdTMh2GA7IxowjY+6pUjkuhPg2tMVIKZ8ueUEndBzObjzsllTG0yv8QWrd6ac8Rxzbs5lYmnIs31EVtwyfxW4XKcGY9o49EKL7dXj/udE0Wvxs8hsr5/surO9LicfJzKIAPgJsEfSGJstmfuLbO6sCEFLtlaAYnlUr729dedWO6jQ+MMJ8+NrSBenTPbFTubP0WMEos0S6UGhxZAsEM+;
	25:Hh5ElA3Eil+2P00rmfxqvMrLaoZ2ZjjpGam8zI/qTjp/L0ICAqv2DTr+sxujlnGkz2iSJ/FAa34dIxT+uNcT/7sXKCQ0m1ZPsbHRqz0liArFBLLYsxuef+QvHy40/rQlfLqSnV/JNusvfFJW703KKm/C2G21StGiQ+GPh9wBTgEBoXihvVD8aVjumGDk2eCqtoEs+R4Pm7WzqTCMTkRQ7tsMXB5l8f3B1VK+6PNzfBkj6DuuF6nW+t4XYegV+Qu7xjPLHYJigfXibiNm+Jr6q9jRjnpbEk2VUMn0XpIxQtVSKeHEmFZnApSYHEt0udhM+bywH4UCGtY1EkSqz5W0EA==;
	31:yiIbtmGNiBG2bJDIPZ3aeBmU5CdzwZmKaqtSHF1ivyKyjyPymE3palD/KRJuUWjEsJ4e+mSP8SgvVpWnRG/npwNGEtPKp1Ck/y0qvvmCViagj3Ir298DmQbGkjVurnkbPZV+krInCeWYqL9VGwfxZ0miys8pptR3yH9ucmjPCfXqx1nrWexJ+/XbuVtFeAYDFnrmgQA3/Var7ODVtS6NAggLNNNynEqYz3hPZL7FHnE=
X-MS-TrafficTypeDiagnostic: MWHPR0101MB2941:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2941;
	20:bI8E29ViK0WisuRnLuJRtVwHBztlIF4g8vfwgSGKBDDwvyoVqUTPrG3ut5HypBSRXVr2R5LUQTGV+h+m3gqRsqfgQ658Qh23rU+gkiMDvZPMinhWA3C4cY47uhUMLl7qlIGnerUXoofQLyYl/gzYuy39H0x/LkFhqRwW26mGCTAU4bIIHT+iQw86BlI9Lbv5gWzWSuAzBHyWoIu38jp4B601l9mBWb+MMUMNHjRwCc+tKu54QwC3F/xWusoN13hM0TJI82TpNVSU1cSXv6SGPHSHY/oKvYiIo029QN3kC1rVomG7Zl19gIEEwjDwVS6aafqvSkizW2SqwkPIg+ofXCwyrZ39oEvNO5Qn6rII/iQsBKt3hHBbq6sXusrMoN1QGKsU9TjGm1pVh5Exc3bJ41LUBrAIH5Ofb8CWbGpiZs8=;
	4:G0s57Vu324q5ssKRsK9tnn4FSwdkF4qyvJBUmSy/uy1v+FRt/oRX2qtuuJtkzfXI45mk93ta6Px8+kjsM6hA0j4JE5KoHhXxxwavKvdemGQ6f9TXROn0VLm+vUXz0ymr22uRsgidHi17clt3BVKDsgwIkKhIFw2WmMSU9u4QEO35YYwYhJplpWymg2I2KohowigB94nDp5mmOoxUiMqOR1WL6xEu2Isv53DieDgCwgirCWmIV8QDb9uUFL+lIh+JBMuPkHv5JVz4WL4hK8sO+zVKIsEj26gS8iS4YkIQDKpFpo0PJj0fC4+JnbUy8m0iVqJB1PFBs2tWt6rMO8WtfA==
X-Microsoft-Antispam-PRVS: <MWHPR0101MB2941E0CE79198BA55C634E85ABE90@MWHPR0101MB2941.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(192374486261705)(788757137089);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3231023)(944501161)(3002001)(6041268)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123564045)(20161123560045)(20161123558120)(6072148)(201708071742011);
	SRVR:MWHPR0101MB2941; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:MWHPR0101MB2941; 
X-Forefront-PRVS: 0555EC8317
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(39850400004)(39380400002)(366004)(396003)(376002)(346002)(199004)(189003)(16586007)(305945005)(25786009)(81166006)(16526018)(86362001)(8936002)(53936002)(107886003)(4326008)(316002)(2361001)(68736007)(97736004)(386003)(2351001)(7736002)(81156014)(6916009)(6116002)(3846002)(5660300001)(478600001)(36756003)(26005)(6666003)(2906002)(6486002)(1076002)(48376002)(106356001)(54906003)(8676002)(59450400001)(50226002)(7696005)(52116002)(66066001)(47776003)(105586002)(50466002)(51416003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR0101MB2941;
	H:columbia.corp.xevo.com; FPR:; SPF:None; PTR:InfoNoRecords; A:1;
	MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR0101MB2941;
	23:648wsDzLz7JxOZDTTIj6gsP8xYmXaavxOvndAiS?=
	=?us-ascii?Q?EKqS8JsxXdvdvlsZjztDiBNxhA7ytc53RgbIeCjp4/1U6NIQLeFEwSpYgv2p?=
	=?us-ascii?Q?xB4PFdGws8yjR2S5GLwEb2ZyOrHFuqF8ulKFMgIdLAUfSHmcueJNdJtCUrD2?=
	=?us-ascii?Q?PwIM/nMdKWMe0aJSKubYQox5v0hGUBVpNqyKfmM2tiDrpBh56CMkbZQcOFEJ?=
	=?us-ascii?Q?+QYf71n/WgK+jm4ZJBzd3ohLJcVxGeVDpRGaaKdamK5m1xvfKwGItM4lvU2Z?=
	=?us-ascii?Q?GkPkazXUdPnyY6Z/H+MzyNQ0m+RoFmUjekBOBTghmKyX/A/P7dDWmYVlOoYI?=
	=?us-ascii?Q?RD7Hn8yHECbkw6fSqctcFz4MZRjAxaoKGXd9L3//D1OnbCNQZxVqfx4e/5Bx?=
	=?us-ascii?Q?XbeiXmk43DmAV5M0CDR+VeGWVPqrGIelPmu3ENJNEbMjyKIORvtooIzQ38IZ?=
	=?us-ascii?Q?/qx5/1nL94c/ssJ9YJryQLhLhYbhUHTxMmD104RTmxWn/XeNrQ9H/h0uEn9c?=
	=?us-ascii?Q?obpSNO2OWveMe7yNF0wQiSZSgYosSlluQYKXbn0GueIY6fA749UkxFABTClP?=
	=?us-ascii?Q?9Fg+nWdMsEYyyw+NRl9noK7xrQzW4yFS6ML4frPZirgzMDblxshLrMyV2T5a?=
	=?us-ascii?Q?qPqpTJ/HATDppDfn8XVlZgrvXFQuGoj0m8OVRZFf/3yyaliOIe6czs4TCL8B?=
	=?us-ascii?Q?hwl4u7j71UpTcLEEw7cAUPIdKLPgEODIy1I9kGFe7JoPV0jO7kV8XcLemnNZ?=
	=?us-ascii?Q?noVbc9s/aXq7eXbgzuRSCnVl09oLnfIA+LhHog6K9MTZbwieP5Bwv/C3kwsj?=
	=?us-ascii?Q?vHRnHIzQSUleqvxoAFjHWlWDuVjHWvHYVpRvNmsBAg5Twqx1oeVl6jTzsTJP?=
	=?us-ascii?Q?9FdmMrAaNFlJwJ8Jb1bZPaXdLydhSasx+5Q1uVztlVksSd0zD+kmr+IzqTUy?=
	=?us-ascii?Q?HxZDDTJRppoC8nhSyjqcIaiVapS3idLP2ikihMh+6swAdnkiDUbmIyeOwnYR?=
	=?us-ascii?Q?NwX9s19VlZoZ0PvheTZ5/o3e+2qCGkF15STzJjhQpWlmhZhLtdMFpkApIa95?=
	=?us-ascii?Q?yrIAh+R8FEoXvB0uELwUjuklmBgqLhF0O3Zn2FVHj1PS+S4i3/bvMxSxWnoW?=
	=?us-ascii?Q?vh6G6fCt6X7a/8LbkTgEVfpHrMvQ0bKIa?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2941;
	6:+wBJV60rHE4SLrzttzgD9/A96/GlCUFvWmlqm1vm2GiUO9Pr0Klx7BMoMkt94WxqpFsvUKPbR/A3bgtkW86Sv0+DAopCPAvMvWLZnk1jKxdbsudWy1BFtjbiJ4KuNtozpVOrndJ//YIeB7yETVy7ieimatXtvYrMWSfrG+U5ySqxxDy2b8aTXjm2YRLSMqF0Xyh1vf8DUWj2dunCU8P5T1umlkSkdkQtUjouFghz9kX6wxaFy5Tx93NXWeSJpuBxIBNfZsAcokkLRiY0Dtm7tEqIk8BN4hnX8NpbU5KP51Ecw4izHdprnW2E9VIsaAbyFJJFDgKD1g0jlsamlGAH1VX+rliruJY6+fUtBRDlzp8=;
	5:nf+NqXpfsiOMtu+nKjBtGwsucOhvkOlzgh/ibz8JKh/fTHYjOnG3lDxuy2irTrf8EEKFBNujYZfFpesD8QTwfJJdjyCkn7kdLoD0LDROIU5kwmwS9bJrKmd55SkB/VC793CMpkQ6BZXYf6loLlXmP6iJplV54PGOxF7v5+9OabA=;
	24:tY24HT1tyywi9JIYxm14ry7zjpetqO0dcRDWYBwmVthE02EIHFATQTt3hOz5HgdTew+hX4oJkqlyw4hIpDf4vC8s6AymSeeeKFCjeILzHPU=;
	7:g/LE6k+uwSTG191sRs4D1N/Km399AyhU4Wxym+sdLcTHF4q2nVnjQXOwqd1y0kaiSFqIVodR9SY0BTokdM7nZSOL14N1KDwF8FhpJHaCkuCn1c8FEPXjrPoVgv3gsTAxXF5kzOUe0zk8JZIkeGV/mYzMz0NJtwcnXuMhx44tZ79YrfWcCnGVIB4Cuwg4+gA31t5Bvbf//r5lVhDHiV4ycVu3a2gq5p+0abA0aqS4cwjJRiwHEYk+1/XaAyjtHl1t
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2018 19:23:35.9299 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc1e865a-0fab-482b-bef3-08d55ddfce18
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0101MB2941
Subject: [PATCH 1/3] meson.bbclass: compile with --buildtype plain
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
X-List-Received-Date: Wed, 17 Jan 2018 19:23:36 -0000
Content-Type: text/plain

OE manages all the compile flags, so we don't want meson to inject its
own flags. Currently, it's injecting -O0 and causing build breaks when
security flags are enabled (because _FORTIFY_SOURCE requires an
optimized build and meson defaults to a debug -O0 build).

Add --buildtype plain so meson will not add its own optimization flags.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 meta/classes/meson.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index 4a4c51f840..f9cee00c07 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -13,6 +13,7 @@ def noprefix(var, d):
     return d.getVar(var).replace(d.getVar('prefix') + '/', '', 1)

 MESONOPTS = " --prefix ${prefix} \
+              --buildtype plain \
               --bindir ${@noprefix('bindir', d)} \
               --sbindir ${@noprefix('sbindir', d)} \
               --datadir ${@noprefix('datadir', d)} \
--
2.11.0


