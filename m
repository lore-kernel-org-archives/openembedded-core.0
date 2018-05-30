Return-Path: <mkelly@xevo.com>
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam03on0073.outbound.protection.outlook.com [104.47.42.73])
	by mail.openembedded.org (Postfix) with ESMTP id 4911072EA1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2018 23:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=AsdEg0XK5V+Q6cSh3y0L9C/EAISrX3sSfBdK8y6X6Ng=;
	b=c+YUsxQ6GLjnJky9rMWoQVOxcESL+6xxlMAft2jTDsaGy0ogtyS2VV7w1Qc2AfGA+t7tGBpraGJll0CCQcg59Da6a8E8j5h67y1Uiezn4E6cjBBLzf8AljxwU1hfxUPJsJaTCJXEEff+gXK2ej3p+//+DaDVOOMaRoOgJXtPZE0=
Received: from columbia.corp.xevo.com (65.122.179.226) by
	MW2PR0102MB3419.prod.exchangelabs.com (2603:10b6:302:3::12) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.797.11;
	Wed, 30 May 2018 23:14:45 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 May 2018 16:14:07 -0700
Message-Id: <20180530231407.19759-8-mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180530231407.19759-1-mkelly@xevo.com>
References: <20180530231407.19759-1-mkelly@xevo.com>
MIME-Version: 1.0
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: MWHPR15CA0072.namprd15.prod.outlook.com
	(2603:10b6:301:4c::34) To MW2PR0102MB3419.prod.exchangelabs.com
	(2603:10b6:302:3::12)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:MW2PR0102MB3419; 
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3419;
	3:iIrD03MqPHuBwI0sVatgqrItCSKsHU2/D+YjRtPLW/vaHymo0CrWjvVDGSVQQtlSFtCnVWN4+0fUDP+LjFB+UrWTnRnQihlN+lr1+OtlFFbEzwUmgyjowwHkKOG0f7DctTPZ9/ryGzgFAmzcIez23JP/eMvmeAVwcrb/w4cOBQauyRcde9BOuwQfAqInSp8Ssa+mLEttl4SjFpN84pyx5VqIhljviJa/BZ3y2evUfJ811sOS3FJNXuoMqtrhkTKt;
	25:uLoldE6Jzh7Bljtsh+RgVOyiLBT941+9WKRFDlYWgM+q8SrxLCT28JnreY3m/CcHQqJ9Csy/Pie2ZE99htNshesBe9x5g7TxTen8ROsn4SYupEnybAzqlI1NXjE0qeZVxQaxDmWHaBAcBFwAlesCx+w4bSPCDxEqksUqXSJJuHlut5s/Akc71h75+R9gUmJ7ysgVXKHVksP2WU9n6fmAhUSmWeqbPUbmLCFYmR08IdcWNk47pCKThTtp+zt3WK3gYyhc7x3naxB44G/7FNp+GmcwWg1U10cDp0X+CCsrOETnKi4JpZinR9p70Ww2p+z57m6UUIyN+0OZw0pH9dIc2w==;
	31:elvFs3jBZDqtW/8rvZWVT8x3ayEFoP34LrahaVUh5cvy1vN7fYOyiaFvR44rFFNIeRASQTg2OpjEUyLrqcM5Az0bvsp1edv3n0u2RtGo3eTB3UQ0ydLiAC7C0fXe1ETrK0Ew59gdG4MEyDXAh+8meiMii25/FdmgZwpXfuXQgVQCxGb8/g6EoREyH4NOQUsfegnjIO2jszlzM4lySsPVUuw28j33o+oB6Ij+zHQ+j6s=
X-MS-TrafficTypeDiagnostic: MW2PR0102MB3419:
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3419;
	20:pOab0fFAlijVzbvvl9sAKi+3SpqFGlk1zrkcdsEZo+cRx7NbOZqutD+VO0P12YakInniH1LmRUFLmjp/xpeMBw2G+PIk2DmH+nC2NVSmpvWKJrgWHjhs0XZNdt/xwp3S/5EpwpAnVhMh9LYpvTyqJn2I+HshfJyeCw3C5DQPkWz7JDtN5456j8mJbrY7LaZwvhPz/v1bpuoaB8fo9KGTCqjcYajBw8H7ndfweFiSD+StPHHNy3cVLd4d7rkxc3mIvhm/FRnaQpvRO/C2b5tx+Z26tLlIen7V8FhjUCZxTNxuu6FN5qRp57OMQ5bulx/sNsdM0/Z04+49kS0WJ5MqsZXxTJtxI77VuwKlHiBsNXRr0O/GZ/XRPrUHcqas1KwFijld0dZJj5czoZpegWq33rA1JzzaLoE5cuFQ3LCSDcYqpUOUGzQFPeQS2uOZBVGzdj8bAS9XYbNV1LYE82cFoO7cAlFA8aZNUw/EhlHvSvxJblnb4v/+mm5m+6bXWJlX;
	4:NwPE76exPnlnqPmDW+uQDd3BusbiEMgihDjXfdEp+8v9PGP6x8RP6LjIZ1Z9M/Nvod5IMqIzuM0EDC+tN/I1AZDHjxyVew6Wud15N2YZZaxA/LdNMlRqIfVLFuhFRN2UYaSC1gtfuTpHzHimPX1bDL8UGq2qUuBxTjrH2YZGK/XYSDFEkxdGXzkmUjX5yrevMwVj7F0ThOvYtsuw8cQI24dcj3vqA0K4IKwlkYhyDxC7N3gtSzoRsKN9WCLsBUlaRkvnPwWlbv6O/1QFLlEeHxj3XAFyREGL8vuUkwJXWe72ZLIZKza7CK4Pyahg5fuN
X-Microsoft-Antispam-PRVS: <MW2PR0102MB34190FDCD014F2A7F14115BFAB6C0@MW2PR0102MB3419.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(3231254)(944501410)(52105095)(3002001)(10201501046)(93006095)(93001095)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123564045)(20161123562045)(20161123560045)(6072148)(201708071742011)(7699016);
	SRVR:MW2PR0102MB3419; BCL:0; PCL:0; RULEID:;
	SRVR:MW2PR0102MB3419; 
X-Forefront-PRVS: 0688BF9B46
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(39850400004)(396003)(39380400002)(366004)(376002)(346002)(43544003)(199004)(189003)(59450400001)(11346002)(1076002)(486006)(36756003)(16526019)(6916009)(186003)(47776003)(2616005)(956004)(50226002)(3846002)(476003)(6116002)(7696005)(305945005)(86362001)(4326008)(39060400002)(386003)(53936002)(52116002)(51416003)(478600001)(7736002)(26005)(53386004)(6666003)(107886003)(76176011)(6486002)(48376002)(68736007)(81166006)(54906003)(81156014)(50466002)(8936002)(25786009)(6306002)(16586007)(8676002)(66066001)(316002)(5660300001)(2906002)(446003)(106356001)(105586002)(97736004)(2351001)(2361001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MW2PR0102MB3419;
	H:columbia.corp.xevo.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MW2PR0102MB3419;
	23:u44jiUTANAJZaga+QQVCRA/PVjAkS3nlVWphF2c?=
	=?us-ascii?Q?Co8yQT/7Nz/Jkg+Ah0FSE+72MlhXLQBD7INnO04IV3q45PTDXGNdkzaQhq3u?=
	=?us-ascii?Q?0wvei+Op1NoGykmMC70YEOq/SbW/avfuWZLoTAf1QDu1hNtw8pw6bftX4Ugn?=
	=?us-ascii?Q?rhm7HT112ZkL1I509hBkxghiwz3o2WeqoPTgQ7NJjE8hjjHJ72zA/3EEwsN1?=
	=?us-ascii?Q?KXg3xaxOkt6xTBAfO38SRFBnqM/YEiiiirz3i7fps6NDFuZF3p0+jERfhRY7?=
	=?us-ascii?Q?sRo/YvnSIM8DCMJHqLF9z/VPmMuzhCIj/yu8sXTflQuuOeMIVcSQiGmBagf9?=
	=?us-ascii?Q?VwFtyp80rxNOKRZJq3D2lesU7p6uSDiH8s3eqQS0fw5WTJcXuIWuAz4yQVcc?=
	=?us-ascii?Q?HJWzm+x5cgN8XC2n70SWVWNyUtEJ8xeOayK/Vdvqa5QDZtRUqz89bf347umm?=
	=?us-ascii?Q?r3w70t1MhpqR7OMfXJhvKYrpoMUM5sCFUYzzaFCVLAWGLVdwcCX5rpn7g4wU?=
	=?us-ascii?Q?+sNhETUT7Xt671hVuTcDGCunqJ3jUgeW05wuFxZjWICKrj67jQsO1/2w0ZVE?=
	=?us-ascii?Q?qH70olxuL9ACiKvrwPkxJnCQ5ICAC41LLpuRGWSAWAUJRRmg7SObX2GGPB9H?=
	=?us-ascii?Q?KCVKQ1LpdaYjuiGvPKD+FmJ8IeZBf+zz/W5ysJjckgl/E/uoUKYOf2rzU/rA?=
	=?us-ascii?Q?T9DaRRRhpU5LK1tVTnW0rlp8TwaGybp7aZ/cePUAt2reda4rnTnEPcVwsvvQ?=
	=?us-ascii?Q?bLWrdCNR9+q7pjh/9W65d3ykw9yWnnCH62eC2myK2l0PCiOsr1/W4l777fS5?=
	=?us-ascii?Q?QlScNEJbFZMx7N66reGlbguBimF0voGl8ZTdYaeHmTgYfgO2Q1mqPZXVk+xw?=
	=?us-ascii?Q?4zDLD78T2aPqST82CAP+Ll+luwktJN3TKCY3OAM4f/5ri57WBWqUVgfHvp6D?=
	=?us-ascii?Q?cb4VaswXosHO+53CjikbPxrZduxJHqThsSdwpApHzQSxmqjHrDpQf4TSFmWR?=
	=?us-ascii?Q?4GHnQtGVnMrbLQZa5bm7stlKC8qTvqmlIVhPXR4N/snf+1fJTBNgqy/9bgAW?=
	=?us-ascii?Q?jNDRiDH4hbpdD0m+Mu8eyn14P/2Tv8kuj+P64ITJXUXT8VBRffK9+ttRtlXI?=
	=?us-ascii?Q?XyBx5U3yM7eip2iWSKFpAXPQOv9LTo8Ll17WUOSc1P+W260O3WdXG4QqdjTt?=
	=?us-ascii?Q?Go6PNyCgavQCYZDO85LKcRX3W5iSuOOtpfOpM4kCOOva5tIAc8s2oTgfVoUX?=
	=?us-ascii?Q?Ar3gDBg3G3hebw1E12nbbfdNBQkRwco/4JZHInyra5ll64/m1LW+f5rM7Fe4?=
	=?us-ascii?Q?2SZWHg6yWuo/p9jjWENHVxdAPgnL0j5Bk4OEHr+Q8F88V80CFM0ZtbcmF6dk?=
	=?us-ascii?Q?1k3fMN1ysI5Zfljh26s8/tedx2FU=3D?=
X-Microsoft-Antispam-Message-Info: vqeUh5PMzReQJsozJUCNewy7PR1DN88ftYD8ADJPawnTExOxkhMoMp+cSFZlycx1ihcxooGYrHC8eLxsjpwOM5sM4DhWHz4evhhFtWGxJukSzefn94hGRAMATym3U6kUGroC08xIgHgItU/XoRL5dcOrd6Wa8KtrQQ9SLJLJCIQR4aqzBtnc73/FH3wqaeoH
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3419;
	6:xAfDj7huxqc8MecY5nb5zAg6KNPNHkodNPSqaqY5yUh5VbMqlHEANMWZVArYtVOatWv5NQsBf6ssJfjBwWEZU16n95ypVuxSwcjzrTPCLbMZ4IMYQyJD0WT3TgC7VJj/9fDdN/BkaNiRfIb8Zx7KIGVzNxejrSWVki7a70Ub/oV7HdGsfyMJ9br9sdM7HnlV3ZAM7thmRwq/GzsxzCHOKHKXrOgX4umgFObnuhC7ck5Mbw8yJ3BDJb580sYtRch7HEB8IDHtvmOx0JclHVOqIIQ/a1JOeTwHpGk0QvPa+ZtW3Va17P9k3D23qErBZ1L7forpod8Vt8/fXQgUidHIXgRLpzDqPQVmm+oDlaeomNswtWLO0Af7gWg+M4D3pNgBWkYpAgwp0vdYiIGJbDamh36qDkHBocE6LrH77FXN4T2oXd43zd47HTOfH1hcV0ijHxj0vpBFVi/O+75x7kihJg==;
	5:euD04QATFBuaPNH3Yiks+Hlylf2LpaChtxDMa1lpXarqFfpYxm5bU752fv8+g4XGo5lulGbxGzTdeM0nEIWbhEsP+wP7ZHChHBOdojZHev0KBLMTHIZoqTaY7AQXlKLkRmsOFv3A6HXq4hVrsiG1pOeDSqoYM5xLTifcA4dYC20=;
	24:poiQW0YjTohiTvpF/Th+dFRmI6rn5ZzXMnjt5iimLyZXdlfe1EuGzMew0Vad06CTL9U8BDCK8z5Raf8v4L0wGmgVFQgk9qwTF7sbihXza7g=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3419;
	7:pSz2sEnPsLwRqdqr/cDJRkyD7B638GRF5GpDXytZCzXxuRQAP/H3zkEjfyGezFqVJbBacKITZ23ATlju5cmlOpyNXA5AyOdQRn4YSS+qxO0VHeFkVDZJh1edS/KdT0JBgaQCXRiomr1pF9R4vDdQ4zgDqiMa/zDkojzytAjvmlLQ04UsrVSzTeSWXv17NzdlLx46izWtOnN6iKSZKvwT3BkHn/g7rVDMh4o8hmFqu1cDKYCnRBjwPvb+R9t6IXJt
X-MS-Office365-Filtering-Correlation-Id: 6a71960d-e400-447f-8bd3-08d5c6832207
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2018 23:14:45.6416 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a71960d-e400-447f-8bd3-08d5c6832207
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR0102MB3419
Subject: [PATCH 7/7] meson: enable nativesdk
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
X-List-Received-Date: Wed, 30 May 2018 23:28:50 -0000
Content-Type: text/plain

Currently, we can't build meson into SDKs because we don't autogenerate
the required meson.cross file.

Enable this by using the post-relocate hooks and generating a
meson.cross file based on the SDK environment passed into the
post-relocate hook.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 meta/recipes-devtools/meson/meson.inc              | 23 +++++++
 meta/recipes-devtools/meson/meson/meson-setup.py   | 62 ++++++++++++++++++
 meta/recipes-devtools/meson/meson/meson-wrapper    | 14 ++++
 meta/recipes-devtools/meson/meson_0.46.1.bb        | 23 +------
 .../meson/nativesdk-meson_0.46.1.bb                | 74 ++++++++++++++++++++++
 5 files changed, 174 insertions(+), 22 deletions(-)
 create mode 100644 meta/recipes-devtools/meson/meson.inc
 create mode 100755 meta/recipes-devtools/meson/meson/meson-setup.py
 create mode 100755 meta/recipes-devtools/meson/meson/meson-wrapper
 create mode 100644 meta/recipes-devtools/meson/nativesdk-meson_0.46.1.bb

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
new file mode 100644
index 0000000000..cf5af430e6
--- /dev/null
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -0,0 +1,23 @@
+HOMEPAGE = "http://mesonbuild.com"
+SUMMARY = "A high performance build system"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${PV}.tar.gz \
+           file://0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch \
+           file://0002-gobject-introspection-determine-g-ir-scanner-and-g-i.patch \
+           file://0001-Linker-rules-move-cross_args-in-front-of-output_args.patch \
+           file://0003-native_bindir.patch \
+           file://0004-make-ExternalProgram-get_path-a-bit-smarter.patch \
+           file://0005-commandrunner-make-run-handle-python-options.patch \
+           file://0006-mesonlib-handle-meson-exe-wrappers.patch \
+           "
+
+SRC_URI[md5sum] = "1698f6526574839de5dcdc45e3f7d582"
+SRC_URI[sha256sum] = "19497a03e7e5b303d8d11f98789a79aba59b5ad4a81bd00f4d099be0212cee78"
+UPSTREAM_CHECK_URI = "https://github.com/mesonbuild/meson/releases"
+
+inherit setuptools3
+
+RDEPENDS_${PN} = "ninja python3-core python3-modules"
diff --git a/meta/recipes-devtools/meson/meson/meson-setup.py b/meta/recipes-devtools/meson/meson/meson-setup.py
new file mode 100755
index 0000000000..a9749eae9d
--- /dev/null
+++ b/meta/recipes-devtools/meson/meson/meson-setup.py
@@ -0,0 +1,62 @@
+#!/usr/bin/env python3
+
+import os
+import sys
+
+def bail(msg):
+    print(msg, file=sys.stderr)
+    sys.exit(1)
+
+_MARKER = '@@'
+def transform_line(line):
+    # Substitute any special markers of this form:
+    # @@ENV@@
+    # with the value of ENV, split into meson array syntax.
+    start = line.find(_MARKER)
+    if start == -1:
+        return line
+
+    end = line.rfind(_MARKER)
+    if end == start:
+        return line
+
+    # Lookup value of the env var.
+    var = line[start+len(_MARKER):end]
+    try:
+        val = os.environ[var]
+    except KeyError:
+        bail('cannot generate meson.cross; env var %s not set' % var)
+
+    # Transform into meson array.
+    val = ["'%s'" % x for x in val.split()]
+    val = ', '.join(val)
+    val = '[%s]' % val
+
+    before = line[:start]
+    after = line[end+len(_MARKER):]
+
+    return '%s%s%s' % (before, val, after)
+
+# Make sure this is really an SDK extraction environment.
+try:
+    sysroot = os.environ['OECORE_NATIVE_SYSROOT']
+except KeyError:
+    bail('OECORE_NATIVE_SYSROOT env var must be set')
+
+cross_file = os.path.join(sysroot, 'usr/share/meson/meson.cross')
+tmp_cross_file = '%s.tmp' % cross_file
+
+# Read through and transform the current meson.cross.
+lines = []
+with open(cross_file, 'r') as f:
+    for line in f:
+        lines.append(transform_line(line))
+
+# Write the transformed result to a tmp file and atomically rename it. In case
+# we crash during the file write, we don't want an invalid meson.cross file.
+with open(tmp_cross_file, 'w') as f:
+    for line in lines:
+        f.write(line)
+    f.flush()
+    os.fdatasync(f.fileno())
+os.rename(tmp_cross_file, cross_file)
diff --git a/meta/recipes-devtools/meson/meson/meson-wrapper b/meta/recipes-devtools/meson/meson/meson-wrapper
new file mode 100755
index 0000000000..b2e00da513
--- /dev/null
+++ b/meta/recipes-devtools/meson/meson/meson-wrapper
@@ -0,0 +1,14 @@
+#!/bin/sh
+
+if [ -z "$OECORE_NATIVE_SYSROOT" ]; then
+    echo "OECORE_NATIVE_SYSROOT not set; are you in a Yocto SDK environment?" >&2
+fi
+
+# If these are set to a cross-compile path, meson will get confused and try to
+# use them as native tools. Unset them to prevent this, as all the cross-compile
+# config is already in meson.cross.
+unset CC CXX CPP LD AR NM STRIP
+
+exec "$OECORE_NATIVE_SYSROOT/usr/bin/meson.real" \
+     --cross-file "$OECORE_NATIVE_SYSROOT/usr/share/meson/meson.cross" \
+     "$@"
diff --git a/meta/recipes-devtools/meson/meson_0.46.1.bb b/meta/recipes-devtools/meson/meson_0.46.1.bb
index a1c9035e85..897fa148d9 100644
--- a/meta/recipes-devtools/meson/meson_0.46.1.bb
+++ b/meta/recipes-devtools/meson/meson_0.46.1.bb
@@ -1,24 +1,3 @@
-HOMEPAGE = "http://mesonbuild.com"
-SUMMARY = "A high performance build system"
-
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
-
-SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/${BP}.tar.gz \
-           file://0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch \
-           file://0002-gobject-introspection-determine-g-ir-scanner-and-g-i.patch \
-           file://0001-Linker-rules-move-cross_args-in-front-of-output_args.patch \
-           file://0003-native_bindir.patch \
-           file://0004-make-ExternalProgram-get_path-a-bit-smarter.patch \
-           file://0005-commandrunner-make-run-handle-python-options.patch \
-           file://0006-mesonlib-handle-meson-exe-wrappers.patch \
-           "
-SRC_URI[md5sum] = "1698f6526574839de5dcdc45e3f7d582"
-SRC_URI[sha256sum] = "19497a03e7e5b303d8d11f98789a79aba59b5ad4a81bd00f4d099be0212cee78"
-UPSTREAM_CHECK_URI = "https://github.com/mesonbuild/meson/releases"
-
-inherit setuptools3
-
-RDEPENDS_${PN} = "ninja python3-core python3-modules"
+include meson.inc
 
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.46.1.bb b/meta/recipes-devtools/meson/nativesdk-meson_0.46.1.bb
new file mode 100644
index 0000000000..53503aa998
--- /dev/null
+++ b/meta/recipes-devtools/meson/nativesdk-meson_0.46.1.bb
@@ -0,0 +1,74 @@
+include meson.inc
+
+inherit nativesdk
+
+SRC_URI += "file://meson-setup.py \
+            file://meson-wrapper"
+
+def meson_array(var, d):
+    return "', '".join(d.getVar(var).split()).join(("'", "'"))
+
+# both are required but not used by meson
+MESON_SDK_ENDIAN = "bogus-endian"
+MESON_TARGET_ENDIAN = "bogus-endian"
+
+MESON_TOOLCHAIN_ARGS = "${BUILDSDK_CC_ARCH}${TOOLCHAIN_OPTIONS}"
+MESON_C_ARGS = "${MESON_TOOLCHAIN_ARGS} ${BUILDSDK_CFLAGS}"
+MESON_CPP_ARGS = "${MESON_TOOLCHAIN_ARGS} ${BUILDSDK_CXXFLAGS}"
+MESON_LINK_ARGS = "${MESON_TOOLCHAIN_ARGS} ${BUILDSDK_LDFLAGS}"
+
+# This logic is similar but not identical to that in meson.bbclass, since it's
+# generating for an SDK rather than a cross-compile. Important differences are:
+# - We can't set vars like CC, CXX, etc. yet because they will be filled in with
+#   real paths by meson-setup.sh when the SDK is extracted.
+# - Some overrides aren't needed, since the SDK injects paths that take care of
+#   them.
+addtask write_config before do_install
+do_write_config[vardeps] += "MESON_C_ARGS MESON_CPP_ARGS MESON_LINK_ARGS CC CXX LD AR NM STRIP READELF"
+do_write_config() {
+    # This needs to be Py to split the args into single-element lists
+    cat >${WORKDIR}/meson.cross <<EOF
+[binaries]
+c = @@CC@@
+cpp = @@CXX@@
+ar = @@AR@@
+nm = @@NM@@
+ld = @@LD@@
+strip = @@STRIP@@
+pkgconfig = 'pkg-config'
+
+[properties]
+needs_exe_wrapper = true
+c_args = @@CFLAGS@@
+c_link_args = @@LDFLAGS@@
+cpp_args = @@CPPFLAGS@@
+cpp_link_args = @@LDFLAGS@@
+
+[host_machine]
+system = '${SDK_OS}'
+cpu_family = '${SDK_ARCH}'
+cpu = '${SDK_ARCH}'
+endian = '${MESON_SDK_ENDIAN}'
+EOF
+}
+
+do_install_append() {
+    install -d ${D}${datadir}/meson
+    install -m 0644 ${WORKDIR}/meson.cross ${D}${datadir}/meson/
+
+    install -d ${D}${SDKPATHNATIVE}/post-relocate-setup.d
+    install -m 0755 ${WORKDIR}/meson-setup.py ${D}${SDKPATHNATIVE}/post-relocate-setup.d/
+
+    # We need to wrap the real meson with a thin env setup wrapper.
+    mv ${D}${bindir}/meson ${D}${bindir}/meson.real
+    install -m 0755 ${WORKDIR}/meson-wrapper ${D}${bindir}/meson
+}
+
+RDEPENDS_${PN} += "\
+    nativesdk-ninja \
+    nativesdk-python3-core \
+    nativesdk-python3-misc \
+    nativesdk-python3-modules \
+    "
+
+FILES_${PN} += "${datadir}/meson ${SDKPATHNATIVE}"
-- 
2.11.0


