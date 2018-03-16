Return-Path: <niko.mauno@vaisala.com>
Received: from den-mailgw-01.vaisala.com (den-mailgw-01.vaisala.com
	[63.233.207.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0BF3F78226
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2018 09:06:24 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2FeAACuiKtah6+ax9VeHAEBAQQBAQoBA?=
	=?us-ascii?q?YNNZ2IEMwqNbXKMOoNkk3uBNANbCh+BDoNjg1c0GAECAQEBAQEBAgECEAEBAQg?=
	=?us-ascii?q?NCQgoIwyCOCQBgQMwAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBA?=
	=?us-ascii?q?QEBAQEBAwIvBVojAQE3AYFQG4RlAxmkDwKLDAEBgxODAQEBBYQjGIEiggIICQG?=
	=?us-ascii?q?FJINohkiDfoUdjCyLfwmBc4QTcogngVyLXzCMfQGCWwICAgIJAg0BAQWBKh6CC?=
	=?us-ascii?q?zMaI4MSCYIbH4NYhWSEcHKOFwGBFwEBAQ?=
X-IPAS-Result: =?us-ascii?q?A2FeAACuiKtah6+ax9VeHAEBAQQBAQoBAYNNZ2IEMwqNbXK?=
	=?us-ascii?q?MOoNkk3uBNANbCh+BDoNjg1c0GAECAQEBAQEBAgECEAEBAQgNCQgoIwyCOCQBg?=
	=?us-ascii?q?QMwAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAwIvBVo?=
	=?us-ascii?q?jAQE3AYFQG4RlAxmkDwKLDAEBgxODAQEBBYQjGIEiggIICQGFJINohkiDfoUdj?=
	=?us-ascii?q?CyLfwmBc4QTcogngVyLXzCMfQGCWwICAgIJAg0BAQWBKh6CCzMaI4MSCYIbH4N?=
	=?us-ascii?q?YhWSEcHKOFwGBFwEBAQ?=
X-IronPort-AV: E=Sophos;i="5.48,315,1517900400"; d="scan'208";a="13371660"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=VaisalaWorks.onmicrosoft.com; s=selector1-vaisala-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=EuTI14xi+a4DbD3CDQ6YlPXK62MeP3F6thCpVnXNtCM=;
	b=fdSz6SaSy0auKrORAZLvkFbSKRbJi9KWRFDFcGKPdpIsfv92JYmTD30GfeozH9Dvj7ipiqpE1LKr680SJkbv+V9wQhheS2mc1riB489BbEOO2M2dnsCm11P95JZ2YRWFkHukw2rSrMQ0nKqk+25CPcItawHhm12FDkp+nJ83gSE=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=niko.mauno@vaisala.com; 
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2018 11:05:21 +0200
Message-Id: <20180316090521.22467-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [193.143.230.131]
X-ClientProxiedBy: DB6PR0301CA0051.eurprd03.prod.outlook.com
	(2603:10a6:4:54::19) To HE1PR0601MB2537.eurprd06.prod.outlook.com
	(2603:10a6:3:52::15)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bbbc00ac-d5aa-42d7-add4-08d58b1d2e80
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:HE1PR0601MB2537; 
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0601MB2537;
	3:W1/o75GB8TuCL3PCFhiG64/88hFup9qmScvannu0w0+KgCsxiwBM+6MsZ1lIlhIwgNOuRIt1I3ZzEGEZ5SdS1Wj5e0Do2Ke2SLv9jVLSQuz/V8lZr1YHpFSXk9KpNhlf9stGxnTjP7Djpqa39b24K1ZbdJlu5EqXnEnGOmViWyZ+tEwRcH9mRcSp9r3A2LIzcZvvbuZzBry6zfVx3LDrL0TSez7DW7E4t9/F/MDJDq8XfWDRTs8+dED9xONxJ3yI;
	25:OSUVZ+NLsYRz3rQ4lcfIu5amWl31KjXY2ycxRdHu0XfrnOdw4BOGK/uQLVnDDka6lqqV0ZPS7YDz5FCXbHdcARx+4JnAm0ARyMW4XDfsJvLojirdepzKBrJxkgIQZ+JZ8LB6sqDar/S0un2tXxpwPQjVGGy4hZo4MOBEvYoa9S2Nm6cHlVvbZIxe8jPNHS3iXyjxfiryUrc2WEBh7Y0u3ffBB6kXBXkt7kVomLgmk0QptUtQKqCebMmR7feDl1iuoNMGCljqM7fhS+robalPaIQ9vT4a4RDEAcmrTBCvTTA7Nw65A5lFC2B+TcnXtge9bWv2omXNx7DNcku88ZIrYg==;
	31:7fcyyj2JKIfUKQXAp+XeKeNTTOKLwmvbAIZU/upnikcfR5T7xLSIFFjk5pyEPuICjHFXVoIH2H2uZD1mG+8R/lNpID1cuSKcfqYkbkukZ6zReuuIg5X87cgZ8bY8SGc/hfuvJpTkf6HAVYOFo8bARmYHsy8Ku8tK+DhBqdWFJA96bsSuMMrZ2YTu+vwHviTK8zVoLRKf0oKCzqwFfDPgzUrFzg+2RzkbHRlwhMyh09U=
X-MS-TrafficTypeDiagnostic: HE1PR0601MB2537:
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0601MB2537;
	20:7hdjkIN7N+xJv+qHkpdApb+2qnAB04xnvYz10w+KmMRdYm/rNDFX60O6Yrt6n/alMoWjfpIgbwju4NBjHlKX4SzIAZPraEFooFb1itGP0dTev64waBO0siI6mFgP5XSFAV06GJ/5BD1zfgfM4kRO5L/V9MQvTZP6lf0rRdzUI9HO4Y9IvaPd2UTXvcqzoAEA+ADdEdbd2ckWh/PyJ8p9RzXHEePwvsLbZwuqgGcsOgh25oA53dpBGNcLh72LJkQn;
	4:9w5Bz3fjmuQMlmi2No/pixUZk6QM7oRShBqN/zhAOkjTYoUdwSpG2DnMi2DD6pSCK2qa4fFjtHF/OtKf/8AdqQO/K5imQwRRGF9DS7C71q8+T2htp7WTPItEU3LXXXf6N2zILjCliDdcht5QjgqsXKTD3cdg3oFM/xt7TBJl3sSK0vGvIxmhS1klC0RdjRkYLkA8mPs/uDhTo6ViJpNsps1txacFUAhPb/dr3DQWZ4q6+gr69A94dGiXi96fqUHKspENcVDz+C6dstqczNanTVjAG6F131ZYj/T0xSkPT15vPp/ZsjQInd7lGba/8cwo
X-Microsoft-Antispam-PRVS: <HE1PR0601MB25379E41647836555C3569E381D70@HE1PR0601MB2537.eurprd06.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(228905959029699);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(93006095)(93001095)(3231221)(944501244)(52105095)(3002001)(10201501046)(6041310)(20161123560045)(20161123558120)(20161123564045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:HE1PR0601MB2537; BCL:0; PCL:0; RULEID:;
	SRVR:HE1PR0601MB2537; 
X-Forefront-PRVS: 0613912E23
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(366004)(39380400002)(346002)(376002)(396003)(39850400004)(189003)(199004)(2361001)(52116002)(16586007)(305945005)(48376002)(50466002)(86362001)(575784001)(47776003)(54906003)(7736002)(7696005)(51416003)(316002)(50226002)(8936002)(36756003)(8676002)(97736004)(81166006)(6116002)(3846002)(81156014)(106356001)(1076002)(2351001)(53416004)(478600001)(25786009)(6486002)(69596002)(53936002)(16526019)(26005)(4326008)(1857600001)(68736007)(105586002)(5660300001)(2906002)(186003)(66066001)(6666003)(386003)(6916009)(59450400001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR0601MB2537;
	H:ThinkStation.vaisala.com; FPR:; SPF:None; PTR:InfoNoRecords;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; HE1PR0601MB2537;
	23:J5kuzwTP+2FcNacy3f60gXYwg63ypiFGtQsqd63?=
	=?us-ascii?Q?qaTotxCzU+MdlpZPanIGpbn7x9JmPQYskNrIlwHq5VrENt9DJ9ExySv4EdMP?=
	=?us-ascii?Q?5xl8r+oPLaUJHfd4qhJ8r+wPkEadB1x0/Oe2e/74/8nQDVQE+b3fphlPatE0?=
	=?us-ascii?Q?jDDv6JKp7FnmVqBKs30uAtJHOjJQ4dDRwKFsnOpNsPa1N4lvuLZjDh/ciY5B?=
	=?us-ascii?Q?8WcqfdQRCsYIEx4Fq8PaZb5NjxcKY4bjRZIwhWqNpKEQuJOWUnwU6xVi2Wb8?=
	=?us-ascii?Q?qfuJIwN6nTcKQUDE92fGU6lqiyviYdX3Ms3uzl32s/flfxv9s18MbhuBeUWR?=
	=?us-ascii?Q?unKW/9zQ3XFKCNYpaRMse3FhvFWh/D0D7dtJ/XDtqXawmqVoIot7or3cxjsV?=
	=?us-ascii?Q?KboUjSoZgO3AHCGLEVp+CR7Mn6KJ2i4leFi6apsUEwLYkSEwl+nkrK664F+g?=
	=?us-ascii?Q?29WFntjGPFCTKw2s07ePR9exZ4FspcCGrzyvPMxcWD4yUt5u9lHgA28lNKl/?=
	=?us-ascii?Q?5e53Hs/4PK7ey71FcbQlyqF9SenOQTpx/qwA1oPUFin5IA3+OyatO9fXnpuT?=
	=?us-ascii?Q?/vvqStIQETdPdM7bJYAUuunWhQXjI/nuUz9BgJNPTsWD/cFj9h+HlgUz/MTi?=
	=?us-ascii?Q?+DpCUe5ZgacjF7TjepbOdK/CwN7QkJ3JttpBBQPGU91ocedGJv4Y6y8McN2e?=
	=?us-ascii?Q?3IRlhpv0vPCAbAcugHLPIUYjid1OnNPDRJnbns6iFwuCmJGJmozwsF6L4HVm?=
	=?us-ascii?Q?s4nEKffLlXfl99RvXFX1TG/n3puFMujVnIs/LZEwKBIHeNiyYemmaRnKD4wL?=
	=?us-ascii?Q?CDvjj/NkVzueqcKVZ1BXQs4ogSg3NotauhEqTod2BsVWF7UTihwe45ihiIU6?=
	=?us-ascii?Q?dc21AR9sRCZOzY2eT6WBldJVvYFbsvvzre/46RBmY4LWs8lu1o5p3+PTmaVv?=
	=?us-ascii?Q?Z7Af9oZGgNHpXpf3zVwt5xFBEvrcbVMVIoefHKOC4VKN6OFMBXjW3KVyxeK+?=
	=?us-ascii?Q?nmWrYnIqUq278pYTBsDoeXdzUaCe4AvajSPLR13ggHQb8xGCAGy40Lm3loYI?=
	=?us-ascii?Q?iHX2DoJENyFsF0AN2vcjHnbINB9fBBsJJUkcyzV9WYbzMc+pFnZe+y12BArX?=
	=?us-ascii?Q?CVNPENMq4yvijwXkeTdQgg+CVvKSKO1SZ6kaKS5jR0fmNLmNLOBj2GjljooM?=
	=?us-ascii?Q?be8lCY6w6b+x2kkZJPRSbDheaMx+be3ymeMX/CV1AIQuKHTdKvdSNx4rocA?=
	=?us-ascii?Q?=3D=3D?=
X-Microsoft-Antispam-Message-Info: R/3W1r1WxrdlwVIjxqc/+rr4unWWIsW17GQ6DLkulz15DuAlMDbDpGitnsBkwj4d2cXeXifDgxUXhqeMPeOeDBMi6/cUcngp573f3gbCfCkxdWdPUBToRYEkFD56ng08o13tkRwwh1sqNrbVCevrK/uoKwlxxqrEet9FtcCVqN/Q82tGTSd3F5waxS/oThWq
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0601MB2537;
	6:uJjxZX/eibcZu5RkA7d67c2wziUt5EDBuGatEna4/KAeJ8GmfEd+l7k5CNebIuguCGjxF0lp110UV+EweLgp1tK4WJ4ZoWeVOjK7vCjcUImlyMJBUbGf4svjC7Zgf85fAVBzRXflTq2QtZ3CBIDmmSxvUT2pC5/MnSG+tzlGiWHY73KE5kFGOyAnD/mdebeYbEEpJsx6lUUk1OB1gaf1VBV3wVH2rH5FBcKXBYZudYwVFBckVgvWWpJoboGj2+WfnsG+QbLGyqlKtdwuVHJC6MPYBWvY6I+TBN47McrgMbcj6FE4YiHeFOmICe5xqnkYHfuTsvykwQyqUwUPshGyTUL8VE9BtWjgEKwvTtOiDmU=;
	5:huOAZnwetBigapdV/vvztgDOKTxI1OimuzEHnSWYskeyezd0MaW5S1aTn/MIsD98VjJV1IIQJAjPBmj7rnqi3p+Z8nj9PINghxaln4ed+QUVGQPABw/slc1rSUHQtyixaWNW5EQa7TgLupnijNPAbwzjx5MgZFNczGWmrlriaIQ=;
	24:HJ9OxBVjaYxyCHdP5PsW7o5efL9ct/ukTLRHChjHphJIbfh2VNjM3IBCJMpgqH2Crpq0YbS+I4gO0e15iW3vT4TJ6xsO/kDhopOZXkIDmXg=;
	7:O9res9QinzBO9EdmmZRzOjAj4c1iRQfoZtOtWHRND3Zp6029yYgxjRXo7kJWTIGMatd7qh2B3JgCga1qD79TS5Y9hMJLOmmS0V8G/vzYwxp1YZt+wiiDOc102OwqfIdjGRlExWQDbNOn3JZxDC4ZmUcXQsg5jZjgfxIf5SDchr86JqT/Ca50SR9E01ggg3MZR2f9CwIvgj09nbOrgxJeHMqhJsllPUgXRUlfvLQ2/xAAKGdMLFhZ60xYEY6bEfuV
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2018 09:06:18.7196 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbbc00ac-d5aa-42d7-add4-08d58b1d2e80
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0601MB2537
Subject: [rocko][PATCH] package_manager.py: Explicit complementary fail
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
X-List-Received-Date: Fri, 16 Mar 2018 09:06:25 -0000
Content-Type: text/plain

When running bitbake -c populate_sdk <image_name>, it is expected that
packages matching SDKIMAGE_INSTALL_COMPLEMENTARY name mask (unless
declared in PACKAGE_EXCLUDE_COMPLEMENTARY) are installed to resulting
SDK. Underlying mechanism issues a package manager install call for set
of complementary packages. However the mechanism doesn't seem to inform
the user all too obviously in case the package manager command behind
install_complementary() method fails -- and since it is combined with
attempt_only=True option, user might end up wondering why several *-dev,
*-dbg packages are missing from resulting SDK.

Improve associated install() method behaviour in affected OpkgPM and
DpkgPM classes so that a problematic state of affairs becomes directly
obvious for bitbake user, resulting in shell output like:

  WARNING: someimage-1.0-r0 do_populate_sdk: Unable to install packages.
  Command '...' returned 1:
  Collected errors:
   * Solver encountered 1 problem(s):
   * Problem 1/1:
   *   - package somepkg-dev-1.0-r0.x86 requires somepkg = 1.0-r0, but
         none of the providers can be installed
   *
   * Solution 1:
   *   - allow deinstallation of someotherpkg-1.1-r1.x86

   *   - do not ask to install a package providing somepkg-dev

   * Solution 2:
   *   - do not ask to install a package providing somepkg-dev

(From OE-Core rev: 2502bd591c37bf532d02dc6b37fc1e8b5224fb0a)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0d4459e7086fced5e9e0b4ad10378c9eddec56a8)
---
 meta/lib/oe/package_manager.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index db8bf2f39c..ed8fec8509 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -1089,7 +1089,7 @@ class OpkgPM(OpkgDpkgPM):
             output = subprocess.check_output(cmd.split(), stderr=subprocess.STDOUT).decode("utf-8")
             bb.note(output)
         except subprocess.CalledProcessError as e:
-            (bb.fatal, bb.note)[attempt_only]("Unable to install packages. "
+            (bb.fatal, bb.warn)[attempt_only]("Unable to install packages. "
                                               "Command '%s' returned %d:\n%s" %
                                               (cmd, e.returncode, e.output.decode("utf-8")))
 
@@ -1388,7 +1388,7 @@ class DpkgPM(OpkgDpkgPM):
             bb.note("Installing the following packages: %s" % ' '.join(pkgs))
             subprocess.check_output(cmd.split(), stderr=subprocess.STDOUT)
         except subprocess.CalledProcessError as e:
-            (bb.fatal, bb.note)[attempt_only]("Unable to install packages. "
+            (bb.fatal, bb.warn)[attempt_only]("Unable to install packages. "
                                               "Command '%s' returned %d:\n%s" %
                                               (cmd, e.returncode, e.output.decode("utf-8")))
 
-- 
2.16.1


