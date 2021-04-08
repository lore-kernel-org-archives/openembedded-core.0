Received: from NAM04-SN1-obe.outbound.protection.outlook.com (NAM04-SN1-obe.outbound.protection.outlook.com [40.107.70.79])
 by mx.groups.io with SMTP id smtpd.web09.1021.1617907366777651222
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Apr 2021 11:42:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=G7Tf3ORq;
 spf=pass (domain: windriver.com, ip: 40.107.70.79, mailfrom: yifan.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O5dnGAO8IhqGMAhU2r8bKOKLMu1CaptHWvAGUgi/PSjceWFK5FHdGO2lyh/ggnpnIBUl7JqFjWC1cZrHrDS9g2mq0kJETqRySg5krFdZcwkUSHM6usZFCcdYUihMytcBvGIW2TvikUVGkPVTBDwxfZ7CAIkIvj97E4cJKpZ1dw24xUIQzNUtHfAEr8Cw8WwG4rC4XF00BO4XQMTrtYJ+QCNQOlixQnYIUwaNZHDaSqz4WcqAZvbvDDeEJ48RSKKJz8k5nbLJVcB3fAshy4n1wnn/QoW0SiqjDbuBgGjT5BoaejZV2hJXAqA9JH8UfoiWv+fP17G8rCu/FqbmThEidQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OEg2GRavCo46cWNLFyev8gZCl1lfropLBDK8Swqg9AA=;
 b=IrAJr2i8Qv5arrKUUF/SV07HkY3GEzu4LAkEPegVxSFvLo+tdajNmq2l/FQ84vs0l+OqgkTSmxG80eSqFGf9a+vZaIwZGa2qQgC/JS1wLBsxdLAa9oTUnbxArWBTIRVohYlsMMoxt6iE3oXYRRaJkehEQd3BEG0G1pHu2r8FfU4DiUr+SaHmdyaNcXn8SQYBipOAOm6MTgVExbWFclLENP61Al2KM9xEOqZe8491rLpfGJiTaHr/QcaW4KYiwMM/keLW1LBNs62Tt9/fFJzgXknT/YQfhP5U7o7GwgX/epLes4ZiRMuafqE07UxZIjdwSbvaYpQw0PpQrORikcBY8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OEg2GRavCo46cWNLFyev8gZCl1lfropLBDK8Swqg9AA=;
 b=G7Tf3ORqdvk/9OZsDU8/YwSTMM3ulkUkiGgr5z5mLqZd+PzSYSS0cgjpOlx30V7sLjrNcQHjPyqZ25FuPh3mDJa7hX6mHVWHy2W9/tDQ6VbUsaK2KWA4gA0fEdmPEbxmt9JcXluzrtj1dBpvx6RM6S/OscTt7nRz56flLgU4blk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 by SA0PR11MB4734.namprd11.prod.outlook.com (2603:10b6:806:99::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28; Thu, 8 Apr
 2021 18:42:44 +0000
Received: from SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f]) by SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f%8]) with mapi id 15.20.4020.017; Thu, 8 Apr 2021
 18:42:44 +0000
From: "Yi Fan Yu" <yifan.yu@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] Revert "glib-2.0: add workaround to fix codegen.py.test failing"
Date: Thu,  8 Apr 2021 14:42:26 -0400
Message-ID: <20210408184226.13258-1-yifan.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: BL1PR13CA0089.namprd13.prod.outlook.com
 (2603:10b6:208:2b8::34) To SA0PR11MB4719.namprd11.prod.outlook.com
 (2603:10b6:806:95::17)
Return-Path: yifan.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-lpggp3.wrs.com (128.224.252.2) by BL1PR13CA0089.namprd13.prod.outlook.com (2603:10b6:208:2b8::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.8 via Frontend Transport; Thu, 8 Apr 2021 18:42:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc35f662-106b-45db-c074-08d8fabe18ec
X-MS-TrafficTypeDiagnostic: SA0PR11MB4734:
X-Microsoft-Antispam-PRVS: 
	<SA0PR11MB47341A9D218859D60C7B02B480749@SA0PR11MB4734.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1122;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GnhyiHapeq9rPJF+RX1y0mgQUQlyH3zS9Gsln/A0EhxQcBTKumqYlxUeShg+h0ZXqTT5iJQtWFeg7wff6bZD5LSUWyPWCbaoNglLmpJNcl7I+5hC97oT2luMPmqiO9VjzmW2LRjtKmd7PJXyaYFjV5LqeUeRdLnGQJ/Jl/pjF6bdi98E9alfDmLu40H0ltAwde8ZZPAqWhxcAkGjooetZ4Q9q0uUUpq5Bp7DD6d+APR9pnJpI9Jpg0BT+/hJoi5GXx7SiMbPeM40hkwLLucJOrPxMcXhx/2MiaAAYgDIQfN/c39bF3ntaOSyZOdvAZhJNszrZaeKOttaQZP3mlk/2zMD/3aiDt2FpkQNFj1gRL/2hW87ZGTDQssAu756JwBK4RqsQGkbsB8dkoJn+QfoVe1rcUXmyD2zlT/73z0/3/4+fd3zDXFgMRrtwF4wB5iUuDo1Xg00N+kJHgzmcLlTa0YFBJdx7w48C1aq8VRADGofvMGbKnpKgjmMTakoKQUBCp/wIUExEGbntL0ewaNqC6hxupI6IM+MFmxuUj013VxJBWEnqQ77e1PosXQ6y4Mgk+STy1KvvNGJUq4xSpmwWpYwprCwekFf5Wx62nVkQITkukOeI/SBj/brEfQhfFO6f9iXYvZ9hBfHIYOqn/tkUiCmH02+BA62CXUV4flgvnIRSgSE5D47GJD4yzQ9qYZX
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4719.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(39850400004)(346002)(136003)(83380400001)(6506007)(316002)(956004)(16526019)(8676002)(186003)(6512007)(26005)(38100700001)(6916009)(36756003)(6486002)(478600001)(52116002)(5660300002)(2616005)(66476007)(66556008)(8936002)(86362001)(66946007)(2906002)(1076003)(6666004)(38350700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?wrhFLDAwXAjBpSCpQ9kTS6gwXt05kg/q5zYBn0/Uz6MA/kQnqPVkYprwHAi1?=
 =?us-ascii?Q?gBMNwlm9HBxe2/FNbUjPb7ehqkbnx4Y2kq26hhDcMzwlgyZVte1uU6WrTeEx?=
 =?us-ascii?Q?cL4wPXIgXo1fytZKQw2Fk/NUoUWRuPtALquXeN6ldYZxF7g54pHSTuou+whr?=
 =?us-ascii?Q?MGS/m+X4sdHS6nfwDWo7MhmIWI1ZNaeFHjpxYOB9Bpt+ZLi2sR2NFeypCgaD?=
 =?us-ascii?Q?jyWixRXAkHplnv4o8uXPqvOuSXa4biSguxJgH7L9fS1X6wmmWdE9CTdakm7C?=
 =?us-ascii?Q?jJA/Mn6OH4x7fTenqOqriRPgPYjuHW/ie11f+osxwjP/N7aPlUFwjIW3n6g3?=
 =?us-ascii?Q?iegafe52tb7ocZCx0JP8VemrgxdKTjFFXEhT56taNJvoREDlsDNvnzhHpStE?=
 =?us-ascii?Q?ad2ZUoZ58YJJrL+JDWHMoapVRQKxrQoa0YaulVSf7oqUMLwnxgN9xVvNNXLW?=
 =?us-ascii?Q?ElH7ggNHCBFMBn/rvxLirgchwR7QkRhNGOsD5fXPZ0qHvCUSFyFXfmUyuJP5?=
 =?us-ascii?Q?7j8UM5JmOmVeOsuRd6WcPqV+Dt2cG32z6UKUdktnvmU9jMSMwb/M0UMXglNd?=
 =?us-ascii?Q?EYS7q/iWjWckWau0p6OUTi1m13+UaGdru8paNqyN6r9lBcwbuDDefTt/3B04?=
 =?us-ascii?Q?07tPrNU62OFB5nT2YVSZcSJbBZmJTxRnlgcW8myRFsaoDRE88gB/gc8ofNNO?=
 =?us-ascii?Q?jsUlfyzebKJOL/q6TOw0DfVL4OXZwEfDQft3bfjyfOnEpdTiUZE2qG4ZkFYS?=
 =?us-ascii?Q?P2OzZApuXdZiMVMWwpSW26JdDPU++hYmyzgRaJ7s5kFkAeY8Cw8n6ZiHfwWO?=
 =?us-ascii?Q?buRKiEOviosyjkRchWta1rlScUzosCgJ5JPusyeANSFlJKLZNX4gOHuWN+i4?=
 =?us-ascii?Q?1vXm1B/iY5vbXgkdlJXipbEIURErSwhz/7ooF4dQDRJw8lEdCUWai9UBRMOp?=
 =?us-ascii?Q?g/nqISQTHw0iDenT2kz88z7H5o2T4sPC0D25kKz9zqrQmyMRKoLxxobVKRa8?=
 =?us-ascii?Q?K9N5UPPJcH3coF0nl1NTq7a7OAZD0DP0Rg1cX5N9/B1vJXYDd9XXZvOW3Rgv?=
 =?us-ascii?Q?2gDDwMEIiUg62AEXLHhDcz8/Ub8r7QciQjjz5qCs2h9avVzkDvzeWlg1EmDg?=
 =?us-ascii?Q?6bXQPXW4LxGVytLqjMJP009ZUjGQ+rxCOkxgJB7390ZcyGyQkXCAcxzpSvrv?=
 =?us-ascii?Q?rKKDB+gsip8pDrjo+PXam1fjGXve3N3NAmIpn1VkX7NFkfUNo7tXbDPwA03R?=
 =?us-ascii?Q?Ht/4+Knr/vj+QJuAp+hknum3l4jlxz4co25ImAUV+J+Dx61+7yY6jT8Np4dJ?=
 =?us-ascii?Q?l2hh1jQUMQ3ZQZ27xgZT3KB3?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc35f662-106b-45db-c074-08d8fabe18ec
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 18:42:44.3646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K22kntVY13gJYPy1rb1thwqPsfk+gXTe9kTxmJ39q2f086dqD0xb9MUkuzaDF2gp6tuA9fZOOzEi23C6uKsuyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4734
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

This reverts commit afc9ba7d546f3f2e60fb6f46f740dc925542df16.

Ptest-runner was upgraded in e3fd8f17dfb41173dbe037c25087a69f90b1346f,
which means we no longer need to limit glib-2.0 ptest output.

[YOCTO #14170]

Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
---
 ...-removing-unecessary-print-statement.patch | 36 -------------------
 meta/recipes-core/glib-2.0/glib-2.0_2.68.0.bb |  1 -
 2 files changed, 37 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-tests-codegen.=
py-removing-unecessary-print-statement.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-tests-codegen.py-remo=
ving-unecessary-print-statement.patch b/meta/recipes-core/glib-2.0/glib-2.0=
/0001-tests-codegen.py-removing-unecessary-print-statement.patch
deleted file mode 100644
index 1f19afc0cf..0000000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-tests-codegen.py-removing-un=
ecessary-print-statement.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 6178df5658045a6253ef806e018fe80d99a8f5fb Mon Sep 17 00:00:00 2001
-From: Yi Fan Yu <yifan.yu@windriver.com>
-Date: Mon, 1 Feb 2021 16:10:28 -0500
-Subject: [PATCH] tests/codegen.py: removing unecessary print statement
-
-A huge amount of output(boiler-plate code) is
-printed to the console screen.
-This is not critical to the test results.
-
-This causes intermittent test failure when another process
-has to parse its output.
-
-Root cause is in ptest-runner, This is a workaround
-
-Uptream-Status: Inappropriate [other]
-
-Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
----
- gio/tests/codegen.py | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/gio/tests/codegen.py b/gio/tests/codegen.py
-index 0317765..f66b806 100644
---- a/gio/tests/codegen.py
-+++ b/gio/tests/codegen.py
-@@ -257,7 +257,6 @@ class TestCodegen(unittest.TestCase):
-=20
-         result =3D Result(info, out, err, subs)
-=20
--        print("Output:", result.out)
-         return result
-=20
-     def runCodegenWithInterface(self, interface_contents, *args):
---=20
-2.25.1
-
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.68.0.bb b/meta/recipes-c=
ore/glib-2.0/glib-2.0_2.68.0.bb
index 3a90be8bc9..94d24318c3 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.68.0.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.68.0.bb
@@ -17,7 +17,6 @@ SRC_URI =3D "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.=
tar.xz \
            file://0001-meson-Run-atomics-test-on-clang-as-well.patch \
            file://0001-gio-tests-resources.c-comment-out-a-build-host-only=
-.patch \
            file://0001-gio-tests-codegen.py-bump-timeout-to-100-seconds.pa=
tch \
-           file://0001-tests-codegen.py-removing-unecessary-print-statemen=
t.patch \
            "
 SRC_URI_append_class-native =3D " file://relocate-modules.patch"
=20
--=20
2.29.2

