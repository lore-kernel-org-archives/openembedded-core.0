Return-Path: <niko.mauno@vaisala.com>
Received: from den-mailgw-01.vaisala.com (den-mailgw-01.vaisala.com
	[63.233.207.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6A60B788CC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 16:20:27 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2GMAAB61pZah7Cax9VdHAEBAQQBAQoBA?=
	=?us-ascii?q?YNNaWEEMwqNbHSMMoNjlCuBNwNbCh+BD4QCgywYAQIBAQEBAQECAQIQAQEBCA0?=
	=?us-ascii?q?JCCgvgjgigQQwAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBA?=
	=?us-ascii?q?QEBAwIvBVojAQE3AYFQG4RpAxmfLAKLDQEBgxSDAQEBBYFqgkUYgSWCFioICQG?=
	=?us-ascii?q?FGYN+hm6EEoUjjXeMYAmCC4RFfIkbgXONDgEwjgkBgmwCAgICCQIRAQEHgS4eg?=
	=?us-ascii?q?gszGiODEgmCKx+CCXWLJQGBFgEBAQ?=
X-IPAS-Result: =?us-ascii?q?A2GMAAB61pZah7Cax9VdHAEBAQQBAQoBAYNNaWEEMwqNbHS?=
	=?us-ascii?q?MMoNjlCuBNwNbCh+BD4QCgywYAQIBAQEBAQECAQIQAQEBCA0JCCgvgjgigQQwA?=
	=?us-ascii?q?QEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAwIvBVojAQE?=
	=?us-ascii?q?3AYFQG4RpAxmfLAKLDQEBgxSDAQEBBYFqgkUYgSWCFioICQGFGYN+hm6EEoUjj?=
	=?us-ascii?q?XeMYAmCC4RFfIkbgXONDgEwjgkBgmwCAgICCQIRAQEHgS4eggszGiODEgmCKx+?=
	=?us-ascii?q?CCXWLJQGBFgEBAQ?=
X-IronPort-AV: E=Sophos;i="5.47,406,1515481200"; d="scan'208";a="13211749"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=VaisalaWorks.onmicrosoft.com; s=selector1-vaisala-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=FAqya1c/TUvPVmCjvy64149Zw8LWuGm65QFLk/n06eQ=;
	b=UquA3U74Jzpv8Z/AxgXY/kX/xOopn2KZKVR9KLbn8qNXxBdwO9llxJHcsuMA45taFIcA7l/yeUIZf6ZR4eqdN9WkLFxec/aIWCkSQn1AH3byxvdJ2zRklcf4oQhjtxkSWY2Tzd2Il9GjHf6GVOMtv8idN5YTr7F/d+3wblO8868=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=niko.mauno@vaisala.com; 
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Feb 2018 18:20:08 +0200
Message-Id: <20180228162008.14197-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [193.143.230.131]
X-ClientProxiedBy: VI1PR08CA0213.eurprd08.prod.outlook.com
	(2603:10a6:802:15::22) To AM5PR0601MB2531.eurprd06.prod.outlook.com
	(2603:10a6:203:42::17)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac0df978-b2ec-4ea4-ef25-08d57ec72b7f
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(7021125)(4534165)(7022125)(4603075)(4627221)(201702281549075)(7048125)(7024125)(7027125)(7028125)(7023125)(5600026)(4604075)(2017052603307)(7153060)(7193020);
	SRVR:AM5PR0601MB2531; 
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0601MB2531;
	3:x8MPrKGsYjoyk+tmYaCBKNCLga1rEsVNUKSI6+1OnPHZVu/s1RHuRNZWa+9vddfltuHbG50L1JgPbyDZ4NNIi0OaMczCt0jy2l4B1xLeh+hP3UA2n6Qabyc6VtCizXiTif7IvfSevpTnpj8VTdZg7Js98TMPrRdS3bNCyZW4rju2BEsnFiI+6Y9y6+XlKq4jeU8LwQcHZgZ5Ga7AywldR44k0EfU2WgTBJqfCeltVTpAtht/ZgsXWeqObL1Wdt9q;
	25:55ha6XTqWCVNY/Jun/XpvNeIV9hrH7LMmOSEL8F+03FN65KC/s0B5hpzVczFPxJBdgwM2so2JBfLM2zjoNbFwXSsFT6msY6R/qoHAAsVncaBBNz70g3Fk2DRkKknpWBro6dhZY5rYJPdUmiCmCOpmP88E8byHFgOIWuqUsxK8ZTcV/hXrRjmnmH2W/2vLZNzYg/dW+bApIJSfB22SaIbDkeO7R5ZE/Wnwo5e93ZxVnAcNGao7t+N58iKA5vF6qFm+a2SWG8FxSQk3P6kPjXX2UUBx8MSGUyV6G630sIylntBbtpqBMAko01USAdZrEc4znxPUzkhXVLqF/QaA5IyxQ==;
	31:mlOXRn2Rbxp0VFTdAdYMN2w4HG2YvngcQ8E2jvLC5eZ/FnWnk7B+dCuJ57Df3lZuiE3viypL2HyhVx2bh3I9Z3eEIuctREJmHapVVmVVlCO+ylZcVDjkmP5MB9KoLbEA3Pq44espK5Zw0ZpBDtoiL+e1D3GbP0M5vtICn+1gYef1j8/xEABO++elnnN7guqm7MbEIO63h+FIBZcxrteg5wh2QcUIe10Oo4nRfejWsQ8=
X-MS-TrafficTypeDiagnostic: AM5PR0601MB2531:
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0601MB2531;
	20:itZ2DhfN1gDVoHBRE3jx2441GopfNV+z7TZvpaFDKzA5RPggOZWGtG8iKCQPHrHEuj9lCosmNIYeUyNJYm/5iDpyXcNYY8ZbgcFJ6Brtt/eqRV4lAstcmWlXWz+qFp16PeenxZlugMN0y+dI/deiR35ip6i8OJZGKkFGlicmF1Y=;
	4:Sngio5aFPqM6DaXvn3sRLYaG+2kgVaQPXCRC6uHHaFHvmRFj91oWsPU19JcRlFIbXefIJR4xBAW9toTr4vC/X49bU3JKobkD4e24rzKLPtBTikQkiKneqWVza7FHi4uo9r5Xj/y+jfDzIlVsUk6w7CGZn3Ac4UicPiOUmFpsOrwNdESEzfducUJLugD8eUC/j8bv0QMy54dQb3fu3OXL6bXetrXnOG6H8F+cZYKCYoZQwr/jVEG0r9fCLnR/DrgghgX5CXGJSQYRs5s+IQ/WHA==
X-Microsoft-Antispam-PRVS: <AM5PR0601MB2531D7A2CAADA49FCFBB074881C70@AM5PR0601MB2531.eurprd06.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(5005006)(8121501046)(10201501046)(3231220)(944501161)(93006095)(93001095)(3002001)(6041288)(2016111802025)(20161123562045)(20161123564045)(20161123560045)(20161123558120)(6072148)(6043046)(201708071742011);
	SRVR:AM5PR0601MB2531; BCL:0; PCL:0; RULEID:;
	SRVR:AM5PR0601MB2531; 
X-Forefront-PRVS: 0597911EE1
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(39380400002)(396003)(39850400004)(366004)(346002)(376002)(199004)(189003)(6486002)(3846002)(6116002)(50226002)(53936002)(107886003)(97736004)(105586002)(106356001)(26005)(386003)(59450400001)(68736007)(5660300001)(48376002)(2361001)(8936002)(2351001)(2906002)(81166006)(66066001)(53416004)(8676002)(47776003)(81156014)(50466002)(7696005)(4326008)(316002)(478600001)(6916009)(1076002)(7736002)(305945005)(52116002)(36756003)(16586007)(86362001)(51416003)(1857600001)(25786009)(186003)(6666003)(69596002)(16526019);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0601MB2531;
	H:ThinkStation.vaisala.com; FPR:; SPF:None; PTR:InfoNoRecords;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; AM5PR0601MB2531;
	23:2nWiqlZatUOWcMoRUOF07badoyLWnaIDinPgOmo?=
	=?us-ascii?Q?oQC3z5p6Es/GBv/ZRDTsTjnrQ/B2nWd0ENN55prq3QATlp4A8sxk8rVMYIEY?=
	=?us-ascii?Q?3ZnJzqwtry4vVF5mVU0yASeEO9FXDDyqYrztgi2AsT1eM3hh6iPBS774+MKA?=
	=?us-ascii?Q?+oRBcMfRaLgCESPK8PLoNvoFQ+opkw3ycHwG1FgSjXhxB5speByYEhv4sMy8?=
	=?us-ascii?Q?FdZOR70gy5EQSWDF+6jMe7XPZPZRGxx87OpmUfpATJxqDRSbt32HLzJnpof+?=
	=?us-ascii?Q?38EXTyqEjMMhWTLmWuOMYEvJdkeY7uZLlMPoUT8nmF9YsFvLLoP5Fu2IhWfj?=
	=?us-ascii?Q?ZtozAJwHgpCyH59Y5QTpHukwQvX7zN/miZeairXOJTfPuY4qRAIxD0jE0dGZ?=
	=?us-ascii?Q?zd52ehVWBQB0eGkPuzrzXEfd6o9iQKLcrO4it5nLusTn+MA63EzO6S1RiHKP?=
	=?us-ascii?Q?Y7iXsXLndLuukO/UiwE40isvUiwlntJCHopgHY2l8yvV3qYOi6+PvNZSwyWT?=
	=?us-ascii?Q?/uL4073WHNY61lAY6UdbIuyZfFHG/Ul/H8lyJp/y3w/NwIXhkSEDoVbcuAGI?=
	=?us-ascii?Q?SUCDZbc0VHq5EgItDR8zV8k4b9+IvGnveBKWQUgHrzIregG37w2QRVZWFnpu?=
	=?us-ascii?Q?cb+G3PESR7Wk8LN1N+KJl16HFGZjz0Mk88xiWx3tuz/Bdx8eH+p80uYOVHfE?=
	=?us-ascii?Q?wXin3OCfRUM4Df/WKX5jg7z10tlFsAeEVHzM27rpML4KuJjoLSVCMLwR2Ubf?=
	=?us-ascii?Q?rrRttmrq9e69B9fiOJRKVNwqw8Q34foaXH/rv9KdU3DCcmFFH+imHurXhDLw?=
	=?us-ascii?Q?SKIF1mj/dP+94UwyqNDCyUrTiI0c5ZkzvWW+sIAAvWgEDCD68Bv/nK6E769A?=
	=?us-ascii?Q?H5YSqPwfA7tzQIoIKon3bau2x4UPedIAGAjklrDwRmOWnOAyqjCsH66XrYkX?=
	=?us-ascii?Q?CLLIumAx2XUINdouwNsTpPsPbBM07mSO+5sduHWUl7vTXbGqXaUWX8uBpUti?=
	=?us-ascii?Q?tiRz6yCdUai8Ut4ZQL7hti1jlVXcL5ltnTW03up1juQPdOtqF25QFLNbISlB?=
	=?us-ascii?Q?18IcoOJcmV2TcL2KEy5s+QAai5UGmWESFAzx+uqwqWChw11+Rb9UQ5G/94uS?=
	=?us-ascii?Q?P/GiFtYimsf9pqReYcMk/ttWlikyJ1fBzsTJhto6+Z9AuivR3uj0yOyZVssy?=
	=?us-ascii?Q?ECFCV4gAgZAHCIKB5mPpqFZNkjd2XoioOApcW?=
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0601MB2531;
	6:QjpOhVDXeUo+Lkz9OlnJqAyMAe6zjjjOWqr+oPm5YIEWQWXNcu7SER5TT/etNVqjeJS96hr0VmgzdWETGkpiJuUOSGy6KxfMBrlnn1KFlkak2hlSuBcEuhh8u8WuUrqoctafeelR6r3ZgzLA+IQ8G7dtrclBmZGP+go3vTb+7cKbBXAF+nLnLgKoxgi10O9T1SrNZ/rXPTF71n/fyd5tzgjjXJeOfOdzPusw3zmSZRlNILRUGhlmr2abbBDT8BlBFQsKfiDAIWNd5fqq9mKlh5rt/OS48tNrUOWUEhBsE8d+ssrPhxCae+f/MQkrQTcVIu9RWsJnmGMLxww/S6jD9b8hezowCDJbHmrscMepfFQ=;
	5:TkakLhZyNPCKF21k96fFKsZbOQL/wwGKCnXcnAjTX7LYEWaKsU7+a5wMTBLOs0AX0rGp7WE+PJKgZvMhGrx/M5HmFji+v3FBDgb583cK4QzF8LrViyUBDvKvow5KWUuTDpbE7dVzIBByth8toD7E8e09GQY88YH24SF4ZUT9YCY=;
	24:5EFU7B4wwLw5n2t7sFBAITZ/BqxnYuuA7jqaeKXWtuiwBYcpLTAQpZZBz592X8Rrl+ZSsTBqWXtAnJ1Kyky/t8dpTUER0aHpxiJcXI+7TuU=;
	7:8efvQDIAE4/qXBqzx1/JX+fG8ObRVFDZoZKKcY7yML7JjDSA/+hv7Z7te4lHwQ1SxN6TxJUR4SQiKW5aO0TVjQ4X0PIWhA7tLa/+kZicG0liwSQibnnXeBMnGOaBgAUUgcBU3V9VYC+aOmZIshr6lQcBE7Mb9G4pplT3AyGObb6c8JAg+em+NIvagPDy9OS5QlFA7OxXNSDQw/CMrhlIHDwfSC/r2fO2uZPsv120heicpBaxW1nVdvz7gNCKmkbk
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2018 16:20:23.3533 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac0df978-b2ec-4ea4-ef25-08d57ec72b7f
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0601MB2531
Subject: [PATCH] package_manager.py: Explicit complementary fail
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
X-List-Received-Date: Wed, 28 Feb 2018 16:20:28 -0000
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

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/lib/oe/package_manager.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index f7e013437c..4d15d71736 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -1069,7 +1069,7 @@ class OpkgPM(OpkgDpkgPM):
             output = subprocess.check_output(cmd.split(), stderr=subprocess.STDOUT).decode("utf-8")
             bb.note(output)
         except subprocess.CalledProcessError as e:
-            (bb.fatal, bb.note)[attempt_only]("Unable to install packages. "
+            (bb.fatal, bb.warn)[attempt_only]("Unable to install packages. "
                                               "Command '%s' returned %d:\n%s" %
                                               (cmd, e.returncode, e.output.decode("utf-8")))
 
@@ -1368,7 +1368,7 @@ class DpkgPM(OpkgDpkgPM):
             bb.note("Installing the following packages: %s" % ' '.join(pkgs))
             subprocess.check_output(cmd.split(), stderr=subprocess.STDOUT)
         except subprocess.CalledProcessError as e:
-            (bb.fatal, bb.note)[attempt_only]("Unable to install packages. "
+            (bb.fatal, bb.warn)[attempt_only]("Unable to install packages. "
                                               "Command '%s' returned %d:\n%s" %
                                               (cmd, e.returncode, e.output.decode("utf-8")))
 
-- 
2.11.0


