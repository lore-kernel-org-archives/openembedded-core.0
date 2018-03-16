Return-Path: <niko.mauno@vaisala.com>
Received: from hel-mailgw-01.vaisala.com (hel-mailgw-01.vaisala.com
	[193.143.230.17])
	by mail.openembedded.org (Postfix) with ESMTP id F1BC078226
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2018 09:02:36 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2H+AADahqtah9aax9VeHAEBAQQBAQoBA?=
	=?us-ascii?q?YNNZ2IEMwqNbXKMOoNkk3iBNANbCh+BDoNjg1c0GAECAQEBAQEBAgECEAEBAQg?=
	=?us-ascii?q?NCQgoIwyCOCQBgQMwAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBA?=
	=?us-ascii?q?QEBAQEBAwIvBVojAQE3AYFQG4RlAxmkEAKLDAEBgxODAQEBBYQjGIEiggIICQG?=
	=?us-ascii?q?FJINohkiDfoUdjCqLfwmBc4QTcYgngVuLXzCMegGCWwICAgIJAg0BAQWBKh6CC?=
	=?us-ascii?q?zMaI4MSCYIbH4NYhWSEcHKOEgGBFwEBAQ?=
X-IPAS-Result: =?us-ascii?q?A2H+AADahqtah9aax9VeHAEBAQQBAQoBAYNNZ2IEMwqNbXK?=
	=?us-ascii?q?MOoNkk3iBNANbCh+BDoNjg1c0GAECAQEBAQEBAgECEAEBAQgNCQgoIwyCOCQBg?=
	=?us-ascii?q?QMwAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAwIvBVo?=
	=?us-ascii?q?jAQE3AYFQG4RlAxmkEAKLDAEBgxODAQEBBYQjGIEiggIICQGFJINohkiDfoUdj?=
	=?us-ascii?q?CqLfwmBc4QTcYgngVuLXzCMegGCWwICAgIJAg0BAQWBKh6CCzMaI4MSCYIbH4N?=
	=?us-ascii?q?YhWSEcHKOEgGBFwEBAQ?=
X-IronPort-AV: E=Sophos;i="5.48,315,1517868000"; d="scan'208";a="101702924"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=VaisalaWorks.onmicrosoft.com; s=selector1-vaisala-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=eedRJ4aIdR2lcwUSHNZfUqxPkc+n29k9X6t1skJqo7Y=;
	b=RMzi/HuksQjc0UaAGccr2srVgPVvckwtvaF12mBUVGMtjclTSLjRTpQ5aPmx38BAFe+lThmRivGYJFpGXHGhhvrDPeFdmZXdHestT9DqKhSdl6uY/g/3g50EBxw5IjvoVjmYMYZ70OXJs9S5Qnci8f2/XU8UFs50CDVqWF4KSCE=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=niko.mauno@vaisala.com; 
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2018 11:01:53 +0200
Message-Id: <20180316090153.22226-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [193.143.230.131]
X-ClientProxiedBy: DB6PR0301CA0051.eurprd03.prod.outlook.com
	(2603:10a6:4:54::19) To DB6PR0601MB2535.eurprd06.prod.outlook.com
	(2603:10a6:4:6c::17)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c1c93b88-2a2a-409d-b749-08d58b1ca8ac
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:DB6PR0601MB2535; 
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0601MB2535;
	3:iS4kc9GXLYHmZ+iB7kCRtXWxo26FWDv4HnODL7MckoF4ax0388A3UaSoKqLb6iiKhabT6v15pIlzjKdrbpfZARvJ3zzrhcyvy7v2Cd6LVJnJQepQmdHZkTmAc8FmxUVw2ygTsVENUJvChQunh9tUjvaCDTjbhcvrMy5bIvwLYWDP7wKtQp9iRZ/PtHMRVufIsjAaeYACcuM2xK+xR/NS10inaQXZdYXsYbXj5rLnmID0B6FM9QqIH/JTNVQwnP8W;
	25:KvaFhoNeAFIrlLYHmj8LBhXT+5/vTa2X66kAT6n5lYSYtNtfafsOt1c4Rt2yVVLoA1q3zjfJZ+QnZ9OJnWbF3PhKoHi4Gev2LyJJtEUXGzkdjM9GISTiCn7o4Kt+G3EYBteFAovo8KX3VmhhPi/pzSphyF0egbykvnI4aDlL5U9tb1Utgi57gQUPibn0x+RVafDwOLEUZafGHuQkbAPEIRFqRPIhaJ3wPOb4/OrxvQ9r1mBSTQK95akQIaKCvpYgXnQ3YdJFZ+UYzjK8YWCcEgx+q4QISOeQwHjPFuKXlYwkTaNOFsKuih3Ng8qeCGG9zVSD2PMkwC6G/9jTE6YYZw==;
	31:XwCxFV3gxjKidMh/R8eprBdyizIeQrDNwgNAkxMGDCt1521DGtvOKA66KtDiqu88nuRsbqzTWoD57NIUfJUFjwou6Wm+bHPTq++TDZNow4GQ5EBl81Mf+y6IG5NhFmiueriWdiHj7jWWt0DnIVRpUHbTX7Snb3Cit6PSYBD3tv9APX8JO37SaL3BV8Rr9KdpaKBCDSYQ/lqZkkHlU06SPTkA2USbYr7++pGIpToUZ6s=
X-MS-TrafficTypeDiagnostic: DB6PR0601MB2535:
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0601MB2535;
	20:xrVv/hXDRcxmgNVOlBcKOf3Xds/OqR/BK1x1afKFxgFV2c45WMxh6yfKdNLJuv1et2fGGMTvC7JhtCLp0tXE7pwFvfb3Em4cNh1lU8WV8yfzMXmAgA/F2JQ/KPZIagmNsA3HAWbgzAjNF0Pnmon1yJOO4MB4tjvK4XO+3+aI+FY1e3gU199XSZ8yTQJUgYbC4VNWPj+e85zvcymGnzX0enLklddsNjTTsfnR4wcYdWsrE/OsOzvQP/vxCon6wOPB;
	4:UW1fcEAuxmc0YTvzFB4BiKWuSatlDOX9387OWd+lf9N0ORL2saQI1A5WSBfo8S67mj+nnvxrhNBmu+qFy+pyhH3t5GEREAYz4WMKpIKNcIBDe0UnZqczZHeX89UfL7AkDkUnwzhSqRN4/8AKk+gdK0U9aQ/RXxhA//DM1BsTdgq+Q+C9A+aesnrrHNwiYvLc40bmG/wzTWJKtLlq5270419YThgiN7CzTM6c6mpYxg4N/WRrZPrAZIFiywRxex3QqKTGPfbeS+0jQBxdrPCRqhEAUcfHSwr61BOOGHrIkmrNxxF45QkiKiAeAAQ1vY6X
X-Microsoft-Antispam-PRVS: <DB6PR0601MB2535E1E1549BFED3EF03D67581D70@DB6PR0601MB2535.eurprd06.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(228905959029699);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(10201501046)(93006095)(93001095)(3002001)(3231221)(944501244)(52105095)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123560045)(20161123564045)(20161123558120)(6072148)(201708071742011);
	SRVR:DB6PR0601MB2535; BCL:0; PCL:0; RULEID:;
	SRVR:DB6PR0601MB2535; 
X-Forefront-PRVS: 0613912E23
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(39380400002)(366004)(39850400004)(346002)(396003)(376002)(189003)(199004)(50466002)(59450400001)(2906002)(8676002)(4326008)(47776003)(68736007)(186003)(478600001)(66066001)(16526019)(54906003)(6116002)(2361001)(26005)(575784001)(1076002)(53936002)(86362001)(16586007)(106356001)(8936002)(7736002)(36756003)(3846002)(386003)(1857600001)(52116002)(316002)(53416004)(6666003)(25786009)(105586002)(305945005)(81166006)(97736004)(51416003)(48376002)(81156014)(6916009)(7696005)(2351001)(69596002)(50226002)(5660300001)(6486002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0601MB2535;
	H:ThinkStation.vaisala.com; FPR:; SPF:None; PTR:InfoNoRecords;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DB6PR0601MB2535;
	23:CFF8x7VIhg8mR4CeirpBEnCy8xx+0yHKryzwevG?=
	=?us-ascii?Q?yAGV3CIajajBZVme+AzTJVrbBaEsxPJFEAGeqghtk50Dg29Q+5j9cAV9AvFq?=
	=?us-ascii?Q?nQJOeXhsiJKieFmrOvY2ClYJ4di0KZMN7K1hsU040ktUz92Ex95SeiaNK2I0?=
	=?us-ascii?Q?06OOQ2KN5UulJnLZLGW1RlAJ/14+putPdHCPdh+nhHzkkURwOdT5GzezUGUq?=
	=?us-ascii?Q?Fwkm8iHmiQOAwRkIx/1jGLocViP++eyxqdhaJ4TJcAjaTy3NUgkpTxm2cols?=
	=?us-ascii?Q?Xrd8MRWQkWeweEZVGblHCIq6O6YZk6RnCdXT97jvkVCMEWru/Y7bfkra0c61?=
	=?us-ascii?Q?FmkJbYtsDR12mDFqtWow4dfpdO3h8rAQXfal56WtijEpP+QmrtTp1ON395pq?=
	=?us-ascii?Q?fR7YctrxCJ5s7Jso6++NnKCRDFQpo1tMdH6HRPn3uKZGXkb2sfwkrnATKbFD?=
	=?us-ascii?Q?Ujp0I4zKJVjCLr6+gUa/jGPNjHMfRO1HAqM2zFTdXyb6WZRQxX0Xj9xNACrx?=
	=?us-ascii?Q?xqAHm0t4J85p3QsK7jSYRrOf3U3ngHoeVCGE+/XWiuT1T5oj+ulWpl8uPU5M?=
	=?us-ascii?Q?RwV7nYVVlUAB+HOaRZQjtNHujdDcLHtlIrEQ0yUG2teAOoAd1KWZcbmoOYUM?=
	=?us-ascii?Q?zG1oM4qs5afb5hZpNW6qxhljJaQwua+uoNqCO+XwxjZRxlIq/6KpHgcbR3dA?=
	=?us-ascii?Q?JhEtEyZl0joGJR7Viabi7nIgTcyt3bowEOZHmkUynulIl3V72aVc4XdLr7lt?=
	=?us-ascii?Q?oSRR0WB3InRYrV4J3LjLh7ACA8JiAOy4fKwmyMZEzCywxYFYFhnz2dlXMb8B?=
	=?us-ascii?Q?4Ij0ZmxqXL0Fdn3niYY87w/bhNzrO8aKPs43+vrpvHbJM/5tRIFkTQO9cPpo?=
	=?us-ascii?Q?gs8LrM2C249+WBQGRwCX29ABP9n+DjFsBmhRFNV8wmmHF6uBAWBFcqiQZXpx?=
	=?us-ascii?Q?ZL/b5pGrUdnO3bkqAWxunXe+S+j0fEjKFhvcSU2hU1VrtaLEh4Wn1Pp2E9cP?=
	=?us-ascii?Q?rfCNBai2WjhcTUSy464Zkbu2Q9NIwEzibtHhZ3MYkG7ehSABHgtFRh6xmjH1?=
	=?us-ascii?Q?AG2/FV5QzwsFSM3AZac4iiZllkssxJtTdLVHln9kQhmypHpqq4zbE3kR7Xyj?=
	=?us-ascii?Q?g1HDi5I1WqZGl4ehijP0YEUYj4iaOdpQZtZfCKxDTc5HVEfnkVSrkWmACxG+?=
	=?us-ascii?Q?yOmWm/r3Gmar0VqLU4jd/otD7hZIz8T6iNzqYuDKFo+8zBhfdXMDu4SeWjg?=
	=?us-ascii?Q?=3D=3D?=
X-Microsoft-Antispam-Message-Info: yJ9u4x63Z90YkrmOxtTzoF6Tehi+9r3fogzDcpXbFSh/1lKZIk2vYucwQiYb/7xi11Ypzfm+NqJSXvXT0obNsn8Z35x4ZGVibfF6O5BNi3cvziT51id98yTiYv8v+EvmaSsUr0BNV+M5XnrCbSgPcoPaqsoM+JN9jwtu6ZZwucsx+OvCZ9ezeOrvrAHKsfQ/
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0601MB2535;
	6:Z4KO2B2K3TKuTNb4uIPU9nt/YqZ5NMUWZ9dXsz9lWcBPxG69Qca8fX9q/E7r67LsPKIPFLFIN1Tb/0XnOFmPQzInygo7y7EHIMQTtTW6+3+YPQnDxZKdDhh5S8OQDdcnP6ub82onJmg31I52osAznVpXtE+DC4jx3RcQVSfC0qjfipPZu7yxBTxPEmEfewzjHTMBXaRf01RaB3stDJH7P3yAC0HIX3Bw5fo7tXUPEwpmf6P0b3JdhjRLFvMWHP7EKvVb7R2V++kkhlIYqP9zsTAsh5qdvyC4UxxunwW84IdpKBkvCWD2YUy249WKOcHVC3NVEg0haLhklYlfEOgJgrlTwYHakZ5hA+B9Dn0sTa4=;
	5:2JbIYoyfJnXdvZeHDXBiFKvwrDD1TnyJ+2PFELkALJBw+1mTAnBmVY4k6jIzuMLrhFWAIiHc3ecMNzEYZ9w1dBe0miXIW4Zvt8v32fJKPzl6YDRVqLXEWV+4ZBLyVNNQv6NLX6fhl1uV75k3teIBW2AAj8TEjajqLUl7bEnNy9c=;
	24:8EwAIGd2sWnxRwkaS0N0NCXSvc8kKlaSW6ShxkBs03EzPdWK2vRmMyfmi/VCedBXjb3XBzoWElehm3ZQ3tI1hMh7wDYCB2RxUSpdtTaVGxc=;
	7:9VFlYoKrHlqfv88OuvMUFRuU70HAdekeiUQiNeYzweQS4QwlIKsWOkw6mHBwcQKWUBaQPNJ4FCFDVBZXJSH1jo9QXqr/sNBqRvmQyGijAwjJmo0g5cQAUKkgQ7eBNTRrWip981hxK6KoTRCnIH3WAh8kk4eAmKQOlX9qst6gn4U7NwJh/AhePKgIrVSaeULlnGV6ADSyOgS+kIchAI5causeJ/ilQOwimrMGEU8lEEah+WGuWeukrCJUIZCzuWb7
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2018 09:02:34.4904 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1c93b88-2a2a-409d-b749-08d58b1ca8ac
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0601MB2535
Subject: [pyro][PATCH] package_manager.py: Explicit complementary fail
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
X-List-Received-Date: Fri, 16 Mar 2018 09:02:37 -0000
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
index a907d6c7b9..1a2914fedc 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -1078,7 +1078,7 @@ class OpkgPM(OpkgDpkgPM):
             output = subprocess.check_output(cmd.split(), stderr=subprocess.STDOUT).decode("utf-8")
             bb.note(output)
         except subprocess.CalledProcessError as e:
-            (bb.fatal, bb.note)[attempt_only]("Unable to install packages. "
+            (bb.fatal, bb.warn)[attempt_only]("Unable to install packages. "
                                               "Command '%s' returned %d:\n%s" %
                                               (cmd, e.returncode, e.output.decode("utf-8")))
 
@@ -1377,7 +1377,7 @@ class DpkgPM(OpkgDpkgPM):
             bb.note("Installing the following packages: %s" % ' '.join(pkgs))
             subprocess.check_output(cmd.split(), stderr=subprocess.STDOUT)
         except subprocess.CalledProcessError as e:
-            (bb.fatal, bb.note)[attempt_only]("Unable to install packages. "
+            (bb.fatal, bb.warn)[attempt_only]("Unable to install packages. "
                                               "Command '%s' returned %d:\n%s" %
                                               (cmd, e.returncode, e.output.decode("utf-8")))
 
-- 
2.16.1


