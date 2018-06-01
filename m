Return-Path: <mkelly@xevo.com>
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0088.outbound.protection.outlook.com [104.47.32.88])
	by mail.openembedded.org (Postfix) with ESMTP id 27F0375063
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 21:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=MceP72L+BngzfEbQbyc2mck4rOn309VgT/fA8tn/V7M=;
	b=tDEEi/NBhsS9rfdKWLxYrSxtSV0IOsydVlaVJq/7BJc5YgGidMZ8uyo6qlCNJABVQXMIJYj3bcUUltAsvJRvsTcOFNn5oWYLuDlaQcC7hSi0fao7U3rIxvXsEHnyOUIMt7+8SrUzD9Lk2nv5d0dPzmxwqLLJJUPJbUoneJkDAs8=
Received: from columbia.corp.xevo.com (65.122.179.226) by
	MW2PR0102MB3417.prod.exchangelabs.com (2603:10b6:302:3::10) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.820.11; Fri, 1 Jun 2018 21:03:16 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Jun 2018 14:02:40 -0700
Message-Id: <20180601210240.14969-8-mkelly@xevo.com>
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
	3:VqqN7cSI2lXlk18trOK4ccaGQV0XfaywavHWbC1Yf+uWoj/a9U5EGtoLkt8cshM6lEH4v8Icv1OICLryAEOfdcMhOTNcIzjDJ6OT59H7PFnoPVGjwThIdg3rWbweraRy4ijsyG2NW0xdnNAEcrU2kouX41YF8u003GSYtHEQO/LT0bdo+dWGbpoXNUOnIbxG4QA2eHvnzenLgU3KlpLdZxC8LMdNr4H+ELiOYXgDunL7VbCDK5yzKgq1Fe+1peQt;
	25:GGS0fI0W4PJtcgU1H3NjVHvcEBeyyRZO0KSmZNF7scdwUv/0pqtl9yEhIObo7rwuT1xf6vIB7+HHxf/qL4ojHBUVSSlPPGNeVYDsee9yu9P1dlxPA6nHF2Rcd/FOqH9GOrNcu8QxQEb+5yIvmbTRop5Dsib11izwcGiqb3vCEtozoYpLsykCx6QzADaI7dvHETxovgtGO8RS1bFjXno+NQir25PIYBuc4EzgKhaaoHxDOh21vv3m5U/pd900OOh5VcBljSIz36W8iGGFrxdXrP/4RopmYPGLSkMaxMXlNLS/3tZxb8P95F5q5HQXb2MgYPVwC7DYMxD3N+dd0vuTwA==;
	31:eqlLLcos1ftcwrju3hBF7j0c/zrhUnZn5A9XPOCeY0F3KxF53lNaJecv+YbcSrOfplFvdZRBa+BZh0lFZNY3eeEkTa1zghqrEWsDuGwmWCk0IMo97wT0WnmffJiHT0lrq1XufVj9LYXPgM/YNU3VsEPzuxL07tBdWQK8dvELQAOl/jpgq0z4qU8O+SwcBDiPiuBI7Do90FLDxE5gsSWJnYzTvDuxh5wMQhAPCX+Zkcs=
X-MS-TrafficTypeDiagnostic: MW2PR0102MB3417:
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3417;
	20:AkC2Hoc4ZTPu7PwWyxexOOmNNwLDD7TdVq7ZPYCfsVfouRp4B7HPAZxHM/3BGKOKcG5BqDSeat5Rd6+onDFZIOULlj2F79fY1fWGKOcb34GklPlvMrSzEy6lYzJ8DBWxAUOH6XNZdxlFjt4gxnkibkWOwHGCEIMDJEwTVcjbmBdPRXgMTwwA7uAPErRL8BL9o55bEUDPYXvvO4kSOR+QsqVJ+h5iXJlo/tpOUxtv/4tvcnTju/NTOAhnA4tUX3Dk8gd01vvOmt4cOldjFehT/hSfV9jka3yntkgGalN+0e/z2cAb8cQLCF89zwaOL5UYLdBRBAqPktUrZ2/t9QCmKX0j2rZ6EIDFA4RgT+t8EzOxuxdPJ8YzvV4qjgv3RXedq/J5J/c1QdU2odr4aS6Tj/RcrCRWgdXXpALeHbz9yjgNq8350ddjxdsG9bh3KWh8yGMUv7/vGuRUsFtkQHkYiCQcEIC+Vfu1C82EQ4mvXPzwwUKy02KeNq95S3jdXsW8;
	4:W7ebufyF1/u/gvHKgez8kswVJx3geacmaC9p/uP/sBgnhq/wz6ymGRwbYfgiMJ+Fi8gjkLN6IyRJnG/0cMzOx5WTeZkMkiUbATvs877LcU1xnM3F4Ez3oY/eU6BVH0X4LoVlLW+GI0J749nVb44n2nWivTGrnIJsUZD/Lqe5wc4iMXFzCvZug6b4nvNhUf8mAffulkN+qgYPBNiqYjjfueuzUvJiCuPESdGHlQ16vGDvVdfQnHOEELG5BVlPgdvzLh+veJBG7sDu7wBPFFcAKYf3btEnZFnfUWTMfqaShjdnAPxWKWpZgz0xFspsXQvn
X-Microsoft-Antispam-PRVS: <MW2PR0102MB3417CAFCD7E578EABD803CE8AB620@MW2PR0102MB3417.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(10201501046)(3002001)(93006095)(93001095)(3231254)(944501410)(52105095)(149027)(150027)(6041310)(20161123562045)(20161123560045)(20161123564045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699016);
	SRVR:MW2PR0102MB3417; BCL:0; PCL:0; RULEID:;
	SRVR:MW2PR0102MB3417; 
X-Forefront-PRVS: 0690E5FF22
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(346002)(39380400002)(376002)(396003)(39850400004)(366004)(199004)(189003)(43544003)(186003)(68736007)(6486002)(86362001)(66066001)(106356001)(105586002)(47776003)(7696005)(51416003)(52116002)(26005)(81166006)(8676002)(16526019)(76176011)(7736002)(305945005)(50226002)(8936002)(486006)(2906002)(59450400001)(956004)(446003)(476003)(11346002)(2616005)(81156014)(386003)(25786009)(39060400002)(2351001)(48376002)(2361001)(4326008)(3846002)(6116002)(1076002)(53936002)(6916009)(6666003)(107886003)(5660300001)(53386004)(6306002)(478600001)(16586007)(316002)(54906003)(36756003)(97736004)(50466002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MW2PR0102MB3417;
	H:columbia.corp.xevo.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MW2PR0102MB3417;
	23:Uxf5xZoo4+SK/8O8yTafIvXOd+pUb0hYsKQIhfM?=
	=?us-ascii?Q?d4r8FaABJO6GSyJwqRnkfScFTg40TqvAR1Ofr3vpbAB1j1pz21P9MUQ/BhE/?=
	=?us-ascii?Q?yNYC4H/yaF7F/pcNbfxU7pqvx2QODJcOez5QjiIaKSyCRfvvgsWvWmO5fD6c?=
	=?us-ascii?Q?ys+8h6H53maAjwwr0LPkc4/ojklsWByeW8167ahC9JIS332o3xaAPl26OA3R?=
	=?us-ascii?Q?ZpCyNl4XII5Mkr1yu2IveN8PQShshr6HF5Ew0dgT2v2jMq+PVb4mDgYHfYrp?=
	=?us-ascii?Q?VVj8tiwGywspteIDOtPhsDrMsl2NsZYCGq/Fr0nwgMwAJJMfWxo+VvP1SEw+?=
	=?us-ascii?Q?Md+UgtQEla9f16eo0DIIdzoslFk3ZWTJVtzKqWb0kZqwBUiUpBrrqcJkL4q5?=
	=?us-ascii?Q?ZUlkRlInxG3hz+TdcUqmz4A6UyIyNuia3izA5QoFt+KTsyc0DWbO97D8aryl?=
	=?us-ascii?Q?Pc+O3uPXYs6JO/gkEXAN7kK+UowRQ9VDeA6kzsgVasKa13btA50sKTWvdRc6?=
	=?us-ascii?Q?O/gNykWrctbt+8OkxT79gcg74J3t+H13Z4VuzJYZTZDoJK80pAdKT2xEJDGq?=
	=?us-ascii?Q?mI5aHiRPBETpP8Euc8InZ2mgPbs4NS8/N+r6acwrUffWZeAx0oKnoeK+/mmt?=
	=?us-ascii?Q?UOnAoYbWkbxb/AutReKaU6XiR3PcWimNiHviwotJcMCMYuEDqtk9/jmhEipf?=
	=?us-ascii?Q?wyFbYED9ZalHUhfqiOpMkeGlU7QylGmOsv/5InFAi5XMXhQa8bvjHhCPvBri?=
	=?us-ascii?Q?1lQlXkQFVKX62L4wH4qUO2giq9FcuULAsRS80hlovTbKz9+d+4Q83CX/IyFs?=
	=?us-ascii?Q?8GjsWuXjt1a47NdRLmnVPAUtYuLKGA/ac3d4Q/Q711dl5DgtiKrhMIu0RfZn?=
	=?us-ascii?Q?fbWyE7J0KS5410Jzl7Yu1CamHY+GlASggtZgDJn+7GQOS7mjxDB5calpEFDv?=
	=?us-ascii?Q?skj+lbDG72iUfAlODOf/qazeB1/1ZTix2wBNrtFjQi2YYn8ROkrATiM97VTq?=
	=?us-ascii?Q?nvV6362sEWSlbO3DnPTYCEZYc/4hUaCltKh7rnEXNFU05j5JdAdoAhxjl9rT?=
	=?us-ascii?Q?uhnCSD7rkpY5kDHoFoBJCpmOh1ZzBMm1QDVZked6w5hJcjvAFQLV0uOta2kw?=
	=?us-ascii?Q?DSLkxg+FIPi0HZvDtl0tS8tcOT8ghauZLzMwzcaZCf6inDx+Z3B92NiPkg9S?=
	=?us-ascii?Q?zECzkpKfc1IhWNqA6vg+7Yctwv5vt4yATnd7QzfovE2irHSH+m7+9tMhx0P6?=
	=?us-ascii?Q?52LspqdfyYhZsVAd+s2Tq8yFdKewdP82BHRdwoN3jyn9+L8N4oSXGRgtzhEk?=
	=?us-ascii?Q?/Rmfym9muUieNjq7IZ9y03B+4YWBoliyLZxFpKTRtWpP4lSTYUN0Klet9Tv5?=
	=?us-ascii?Q?Lwf2yAcOesUQoQbfw7UqXvLuJk7g=3D?=
X-Microsoft-Antispam-Message-Info: VZrpE/Fdi/dIU4tX6lAU1HrlkBsXTSSjqf46uath4kONiRZBFM3SV+dCp4lvezo7oHiLgf/MvWAJfgnVtM+ymnfQtGsUhpdtflsrV1lXRjFBOavueYrmzJuAf04cs5E5iOyYiJIKw/R/6D9crkVO+Toh4rGOsx9XS3w3hX7CfAnYruHgrt7XlB/zGfZ8PnA6
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3417;
	6:Momcas3vLBiadwDKUbLcy95op6q1A65SJLcQFOFBHict5AjQzW4DfjrI85++NRf/tLD5OXq/KhLsJL+P+NGPFwK7FQQ8brbs16brl+D58WwIhF9FS1UmB5AMn7hLqfIMHQaI0BX5w5cY6fl98bI9ZZE+RFyvLoCI8koN59ZRx6ZRkP6zsHz5V/bopotd8cPXOsysPZIoz1VqT0m43tbiW2wNS1i3V4gNVeFDvm2ghiCnfaUD+R1IJU3bSN7dsLxVkV2Wpa8i4eCS62rrOfxi2seGBu/vZMyBJIRNlggBCPAjTcxjowy5StaGX/SNj6TrOgSokN3HVbhUrXMzQNr5laIhBM7CjPfz1h2HX8hhDBWLuzMXqzn7e8U4BOe1aSvMa2bIdjvBEc69wP4bsmOlFu0EVJyq21HR0NuXoakr2pIJk1X7wo3IGC6PfRrzCOyo9Cgzwt7hjf6SLUqKEmAwLA==;
	5:cJqeAPpJ7rKxFD3hsr5snrjnwDKPtvjwIPa91FQoAkT1qpo8oaZ97VODpx1X/Tq/hQ3z5+2RnLb2Zv4jFVMGfNX8295P90TV8CQJR2tx+YvHYqZaxRHLSrBu9imLqV8FyOHeecxAhZU+tkkuSIFx7GpmVvmkJDi9BLs4CzhUKsE=;
	24:XholADdywXHZrIZNxE2jJWaX2rJRwkMgouzEyHJAkgqLVkTIqQWpFB7znt4VZyrqryLDPNskmEJpFK9WNZ799nCr0q7jz4n5ly2CT0rH8kQ=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3417;
	7:ricDdqyjYkdEPH2NCJHmZ4JTBxhbvstZxoGEESUYZgLNHztqQ9f9+Ik0wFMiHNRdx0nXVFDZh5SY3KbKuvyIAfO0F7Qtw8sACxJkuYRICI6xfsZ9CTsYm+ITl5AEm5faxA7Tefql06+ys3wQybxKBcaRgMTSa3m8kZTDNgjSaydUZMQJIXaw1UhUpfnmx7tPommkuQexMYrfMwwEStmvILuzfyE4/BRC4mdihXYLBP/k//+GpiOG7s0JAwKunDOn
X-MS-Office365-Filtering-Correlation-Id: b57b6d34-4005-4681-e86a-08d5c8031880
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2018 21:03:16.4039 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b57b6d34-4005-4681-e86a-08d5c8031880
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR0102MB3417
Subject: [PATCH v2 7/7] meson: enable nativesdk
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
X-List-Received-Date: Fri, 01 Jun 2018 21:03:17 -0000
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


