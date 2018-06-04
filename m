Return-Path: <mkelly@xevo.com>
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0075.outbound.protection.outlook.com [104.47.34.75])
	by mail.openembedded.org (Postfix) with ESMTP id 10CF07548E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jun 2018 23:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=MceP72L+BngzfEbQbyc2mck4rOn309VgT/fA8tn/V7M=;
	b=Ei4JaHhQ+4FmRzCVZwNWkONpHADr1Z6CWnkqQCUWdZpLjCrsShjjyZElcOgbQrRfbWONJMeEvXRFLpdLjSlI/sHLCMmwgM/QE/KM2QVDHmwE5uw+zTg746tkjFq0lAfmRMMbBnjC5YYcdqwC855eM8eNwZJM6+H4Iu3SOhHgq58=
Received: from columbia.corp.xevo.com (65.122.179.226) by
	DM5PR0102MB3416.prod.exchangelabs.com (2603:10b6:4:a0::17) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.820.13; Mon, 4 Jun 2018 23:06:36 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Jun 2018 16:06:02 -0700
Message-Id: <20180604230602.8461-7-mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180604230602.8461-1-mkelly@xevo.com>
References: <20180604230602.8461-1-mkelly@xevo.com>
MIME-Version: 1.0
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: MWHPR0201CA0027.namprd02.prod.outlook.com
	(2603:10b6:301:74::40) To DM5PR0102MB3416.prod.exchangelabs.com
	(2603:10b6:4:a0::17)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:DM5PR0102MB3416; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0102MB3416;
	3:DuQMGkuRifvuVgx9iN1ltoiC0ITb7dyOO5bYegWEZpGibGGIc7ET/8LH3ay1PZtVj2PwANvvSJ2umr7EI8yTuHFv7ZYq3W4qrCbpmDqYh/LQQtmFuQa3zr7gDD3cD/N03kYMaPz29dtBDVrdEWhBjWSdHx+/UpyXLhvIhlhwDXZxqVnvUErGW/hAwrWpnvKFKYXCcMbU/t0DMCFr4fyFnAdQclO4gyN0PUQZdetNj2yY6RvK3s5gh9gixHdYzU/L;
	25:cWRf3PY+yv3ls9mgE5HEoh8/5p8LdSQlw3+PAnf4oR3CoEhCiHViS+NUTq/QjYTd+j6JE7nUCxocmqXm9gS1MvBCx/yLaAiCKk/XqpUXIwwOkorTQqKx2BIkHXoS2efB4fkq7P7GtJEbzOoQGeWE85qhT6iHNlwIg/X3QIPM0T5erdNm2Eg/Uxt6FJ0VCtjgmR5rWm37WJXSPhfl+X05IGYcc3olHdp/pp0jrIgwtMHkneLGRUoacjWZGsr+UVDEZ5J2goDgnsEdIx5Tt/rsvCkhnJ2mHcao6g17UHjgmFjhgJbmShmmXN5ZC3rdesb6ql/HwIR0umZ+vgBc+DPfMQ==;
	31:AavQynC4EWWCtgqh4yFVv9w9K2SDLNcka0SFAc6T6ZXVC4AMvEFdMijgD7bF8yRVcrQJoI+2JtJPIBJlVkIym69T2Xh+VydYA+O2yqEm/OKjqCyegDSXeSX1TvNVU0QJtrK83YVXLPB4Z9xQUV0oWWQ5OUlVfXCVYgVMnL8pFA5A9j1/xhZFfD1dp59+R/Or4YHMzkM38oG2xZbeNUNgLHC2H3FbOV2UT3acvxdr98E=
X-MS-TrafficTypeDiagnostic: DM5PR0102MB3416:
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0102MB3416;
	20:hS7vDCax1LeCa9ePQUgh5V3ug8Z6WTROWoevzkNbTQNU5BBdO7rBrxby9HtDEPCX/M5835jnCFW0sJsp3zjoBHQ8O74kDIrpQmAd3gMHlLFYA2TtWQLLcqE0wRzQyhURmt6C6s3M0MqONAW7BgzZ8QuEICkRzZhIUXIS+Z02YGgUcoQSLt7tfymLcV94U6okw6xPw30812cf/vDYRjwkEs139iCZnjb1Qo0jvvCl5PjWr7cnQHPBsyMF4ue9UuuBMA3gndlV0xiTab0/OMswOewJPS0rNZ4f9c23qG/f61hMPgcjOwnAbpPIFk0IUZNKgmzSHx0xu6HH2Z18lxWn104VY0NWKQbEm1J937s2/bYpeQrtali4uUxLkR/Cr+cUJGa1XM68arpUDBzGiCCdMAoXHc7oeAT7BrWCajMQSutNlARAasYlFZOWRoGXdH8MANSH/I3S9JxV4DAuWw+X3DECSn+myT9SgMuuxuQ0F2fLvsdH8Cq/BlB9oQR+GHfO;
	4:1GhDEwZOK/GiYNrZJ0PP4epjIiSW5xvwNfW7Qof/b1x/6ZIGt7KzHB8dlVu9690F/+aMWrc6hmjKkm6A2lBJFbJWFGxRF4eGOoO9zQO1/ZHx6b0cHrkM/r12iuMZSF9dhcEwtAbaECr3UMB1L0b4JCaqMilbbtzwA/P8kvx+AOTAwnIB42BdswsEv5B4k4unsWNF/yr5+FUC39xlMaI1XVA7Sv5Xe4rx8bSUbL84NnCssQKUi0y6gcLCfTG2PfHhZv8K/oGnyU2SsqQfLCaFuU1Hg5aQG6h/JlHoygQwdQuoi5znLLqk+Tumblc0+szA
X-Microsoft-Antispam-PRVS: <DM5PR0102MB341617FD5DF5F9D6274CABF9AB670@DM5PR0102MB3416.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(3002001)(3231254)(944501410)(52105095)(10201501046)(93006095)(93001095)(149027)(150027)(6041310)(20161123564045)(20161123558120)(20161123560045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699016);
	SRVR:DM5PR0102MB3416; BCL:0; PCL:0; RULEID:;
	SRVR:DM5PR0102MB3416; 
X-Forefront-PRVS: 069373DFB6
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(366004)(39380400002)(376002)(39850400004)(346002)(396003)(189003)(199004)(43544003)(39060400002)(81166006)(81156014)(4326008)(54906003)(97736004)(446003)(8936002)(5660300001)(2361001)(6306002)(11346002)(53936002)(50226002)(2616005)(50466002)(16586007)(6486002)(2351001)(48376002)(476003)(186003)(956004)(486006)(47776003)(316002)(26005)(51416003)(76176011)(386003)(59450400001)(3846002)(6666003)(7736002)(2906002)(16526019)(36756003)(6916009)(305945005)(68736007)(1076002)(66066001)(106356001)(53386004)(107886003)(86362001)(8676002)(7696005)(25786009)(52116002)(105586002)(6116002)(478600001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR0102MB3416;
	H:columbia.corp.xevo.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR0102MB3416;
	23:Pcemel8Bbd+deU0lS3OLVx+3Oxl6G0Gu1Nyx3j7?=
	=?us-ascii?Q?8VHL8uElJj3PrlTDDKSFxpduimcs6LtlUCx0MvjSQyQdSRS1r0ZgUsudDsyN?=
	=?us-ascii?Q?ycuu7N+tepNkBDIHKUYHtHcZ9eF1o2lfaRrOYzlcM14GLZ76NPyrLTl8DjGk?=
	=?us-ascii?Q?8tTlLl2uy9OwfCC6OX0aWQwv+pfHmY6V0vPlwx4FwRJodVF09pDucWD0dWHr?=
	=?us-ascii?Q?3yibo2SxaihDzUJ5IL+ETUsAUSsmnWmIYn40gg6NX2wMCQH+j66fC1EiWw28?=
	=?us-ascii?Q?qQe6juBMH4fLydhB9IpGj/pZNC201JMzy0q2bvmjybCuvbXZqWWZVTS6wGgx?=
	=?us-ascii?Q?wJPjFgsEHGOgK8hddvEOyoWxUqE5Ytgl+4mJrk9858T0r02XjY5sGRJpF9Af?=
	=?us-ascii?Q?5Y0yudzZkUTjmxEuM5rAuq60fM68k6w+kOjxXxlKjsaeJ0jQ5dq7ZnX8uo5D?=
	=?us-ascii?Q?7demWx5TVvqOKyEtdXtYx0yVS2rD+XDoMJ6mCfJkQ3CDClvE1mK+SucWENj3?=
	=?us-ascii?Q?G7G+n1lsW1X0G4N3XQl3xTAnwtNw62k4dGRgGbDz5BtFYpPkaJ+patvl1K+P?=
	=?us-ascii?Q?mBH1UvKK6d54hs5043jQ891yURe6U43Cq8XNF542KUA7xONnpStFqDJZIlrj?=
	=?us-ascii?Q?zAJQBA4aThu9BCbGx9Q+D1y+HQ0CcoWCM7/5h4P/rskXpOd9GcZvNvaDo+54?=
	=?us-ascii?Q?+vUOACVkn3lzsP2cIMLr58k1m/gsLGJDC6aqvtTuytRDinupKssxtc5bt27i?=
	=?us-ascii?Q?A4bRaqp/PE0uHJGCaL8vtXYqKJQhfrZ/krp/VKMW5KhwJRISw/WU0rRq8UyZ?=
	=?us-ascii?Q?khgPt3kUW3J6Rfnzu+iSJgmbYi4wRKtt/enxVedEifmRgmTjy4OZ7Oy+1tBo?=
	=?us-ascii?Q?KJVq60irJCVJsJlAniaH6HLXrZavS7Wcj3zPWc0K+MtN2sbzxFfyHtqP+box?=
	=?us-ascii?Q?BGPIUqEESvN5NIxJ7Yw33ye001Quppgl2XcQPY8Ju/TXieCIVV0OatMwlu1H?=
	=?us-ascii?Q?n328oSUcJ2PvW1vv3hsbvATBs0nloYZNB6ww3cXef9E/cQBvDSBA1v9pM0PN?=
	=?us-ascii?Q?WbSPRo5gsaQa54qT84YAa0ei6v/0kfsD/cnF3rHPIVRruu13OQNnpeVKjIAB?=
	=?us-ascii?Q?6kKuGkeBH7F0pyJysXEeJXCm7PKAV0IvgCG4/L8/FHIMVeuCM7FHTho6BXad?=
	=?us-ascii?Q?2ZlyuVJAq15FasvpOx8fw0zYN3W8mPJM/fQCXycds+x9I2Dogkxxuput3WnS?=
	=?us-ascii?Q?v/WgTQ8NzWpZXUD6iwaA7bIeutIXYhUujD4JhN099+aw8XhkNb9/tSt8pH2W?=
	=?us-ascii?Q?1Eglb8/+1jAkgVbVoW+79Jovc2SmrUL0v+L4v6ZjGMGOurUS9rrKlHy4d70Q?=
	=?us-ascii?Q?PUgPKKbpvdkg+lTj5HJyilRJX0fk=3D?=
X-Microsoft-Antispam-Message-Info: wYGtT9t8Yvc5BNSF1vu/qvZ063QQ+fRLDxHwjlwZOjhIo01tcTzBtbdKZnh60wiRCxzA5xDk2nRMH0+nTiIpBaUDiflDqK4HbBkNBToYEEp0R8/er6PjENTkYv4tGiKGQYvErG4g4euCVAXY9beq1sUz7aAAgUnMWbKDz/H5cnaNGv68GA4tvL3yax1VnYyz
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0102MB3416;
	6:7F4B76IHepd7TacPa/EjHMd/5Zovo6uWvIwQCF+d8kdw0xwXiWgSKEWZvoMnPVALVYWuF5MmzSh0oIjTsud3e6Nytxir1uq6lmIMqMuc89Fu8L30dy8z60zLiuT8er/pLUyN/ATEcS5KfV1HiUJ2B0E9V7ZriMxF6+FXPc/sfQuILVMQ375VspoSZvxC9YrqUhz0GswPIBg0Pccs4001NRKe5t9kWv1CzpiiQHTcXuYR0RYp6QalwygPxHCSLOgxFxfAEiQAGchAT66gNnfw4nyyNW0lT7cMjDVgeqjpVUsETvkIUap6yyp12hesqMvTPmlSZlgvuoAjbLsP8yi1vZlHf37/N8FccaQg+bacO3XdOB4cp2ZnIve06aw7iSy55t7q/8/LJ46+Pe7DbpjRrGhWBZqU+WfwIHVIV2sD4xzrvp011h8stRDXH8PhNuk1/KoxUQiC8p3t3ShLrt629A==;
	5:kqF3EXVH6bPma99LzUyqmVAdUC9p2GP096X5VMFE6iF4iLT3iTn99dTQksK62ZzZCorBfSo//ivnTKhQE2HYefPE3FBYt0whA3U4YkDA/n1iDG7k0jm8T5wx/xK8QuHPN2XFEt40ghb+LZgoC7YNnaCMJikMecnExUt/T/PADP0=;
	24:4jozIHkD8ULF75opZx/KviyhpEG5ETaaX+2SdRO3D5VhAz5ZQ4r3gsqejP5E6hsL5Tey4190Z1ZvaN4XCJfrfuFsgpyILs0XuiLvzoz2cmE=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0102MB3416;
	7:MAjq05Gg0WI9K4+1Isn4jXsxi0IQNVlRoHkjxNUdJW2A2lplpyJ1ErxA/VHaGqNBi9GdfIyp/ks38GEKScFL625VHFTE+sS/XokHU0Ml711UNYcaeMvnwcCsEfWjPoQ4hvzrSoO/uoeSOu3O8/b6GClH0rEuFiAUYoVL0bi5TShMhaVOY6T2DuVpdYc92kg/+tb8E4QiHsMCl8y3U5o6xosKH4qYIkH8Sb+QLPFDjJTmAWxSRpJCqAGUy9RQlPaT
X-MS-Office365-Filtering-Correlation-Id: daf954b0-83c4-4d20-26af-08d5ca6fd267
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2018 23:06:36.0397 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: daf954b0-83c4-4d20-26af-08d5ca6fd267
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0102MB3416
Subject: [PATCH v3 6/6] meson: enable nativesdk
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
X-List-Received-Date: Mon, 04 Jun 2018 23:06:36 -0000
Content-Type: text/plain

Currently, we can't build meson into SDKs because we don't autogenerate
the required meson.cross file.

Enable this by using the post-relocate hooks and generating a
meson.cross file based on the SDK environment passed into the
post-relocate hook.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 meta/recipes-devtools/meson/meson.inc              | 22 +++++++
 meta/recipes-devtools/meson/meson/meson-setup.py   | 62 ++++++++++++++++++
 meta/recipes-devtools/meson/meson/meson-wrapper    | 14 ++++
 meta/recipes-devtools/meson/meson_0.46.1.bb        | 22 +------
 .../meson/nativesdk-meson_0.46.1.bb                | 74 ++++++++++++++++++++++
 5 files changed, 173 insertions(+), 21 deletions(-)
 create mode 100644 meta/recipes-devtools/meson/meson.inc
 create mode 100755 meta/recipes-devtools/meson/meson/meson-setup.py
 create mode 100755 meta/recipes-devtools/meson/meson/meson-wrapper
 create mode 100644 meta/recipes-devtools/meson/nativesdk-meson_0.46.1.bb

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
new file mode 100644
index 0000000000..4c113dcaf7
--- /dev/null
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -0,0 +1,22 @@
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
+           file://0004-Prettifying-some-output-with-pathlib.patch \
+           file://0005-Set-the-meson-command-to-use-when-we-know-what-it-is.patch \
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
index 77f6416cc2..897fa148d9 100644
--- a/meta/recipes-devtools/meson/meson_0.46.1.bb
+++ b/meta/recipes-devtools/meson/meson_0.46.1.bb
@@ -1,23 +1,3 @@
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
-           file://0004-Prettifying-some-output-with-pathlib.patch \
-           file://0005-Set-the-meson-command-to-use-when-we-know-what-it-is.patch \
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


