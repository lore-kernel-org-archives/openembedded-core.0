Return-Path: <nathan.rossi@xilinx.com>
Received: from db8outboundpool.messaging.microsoft.com
	(mail-db8lp0184.outbound.messaging.microsoft.com [213.199.154.184])
	by mail.openembedded.org (Postfix) with ESMTP id B11E26D877
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2013 08:18:43 +0000 (UTC)
Received: from mail149-db8-R.bigfish.com (10.174.8.229) by
	DB8EHSOBE037.bigfish.com (10.174.4.100) with Microsoft SMTP Server id
	14.1.225.22; Mon, 25 Nov 2013 08:18:42 +0000
Received: from mail149-db8 (localhost [127.0.0.1])	by
	mail149-db8-R.bigfish.com (Postfix) with ESMTP id CF59F140377	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2013 08:18:42 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:149.199.60.83; KIP:(null); UIP:(null); IPV:NLI;
	H:xsj-gw1; RD:unknown-60-83.xilinx.com; EFVD:NLI
X-SpamScore: 5
X-BigFish: VPS5(zzc8kzz1f42h2148h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h1d1ah1d2ah1fc6hzz1de098h17326ah8275bh8275dh1de097h186068hz2fh95h839hd24hf0ah119dh1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h14ddh1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1b0ah224fh1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e1dh1e23h1fe8h1ff5h2218h2216h226dh906i222bi1155h)
X-Forefront-Antispam-FastScan: 1<63074397001>
Received-SPF: pass (mail149-db8: domain of xilinx.com designates 149.199.60.83
	as permitted sender) client-ip=149.199.60.83;
	envelope-from=nathan.rossi@xilinx.com; helo=xsj-gw1 ;
	helo=xsj-gw1 ; 
Received: from mail149-db8 (localhost.localdomain [127.0.0.1]) by mail149-db8
	(MessageSwitch) id 1385367521146409_23707;
	Mon, 25 Nov 2013 08:18:41 +0000 (UTC)
Received: from DB8EHSMHS028.bigfish.com (unknown [10.174.8.248])	by
	mail149-db8.bigfish.com (Postfix) with ESMTP id 1EA4EC00A5	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2013 08:18:41 +0000 (UTC)
Received: from xsj-gw1 (149.199.60.83) by DB8EHSMHS028.bigfish.com
	(10.174.4.38) with Microsoft SMTP Server id 14.16.227.3;
	Mon, 25 Nov 2013 08:18:40 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-smtp1)	by
	xsj-gw1 with esmtp (Exim 4.63)	(envelope-from
	<nathan.rossi@xilinx.com>)	id
	1VkrNP-0005Xz-Kx	for openembedded-core@lists.openembedded.org;
	Mon, 25 Nov 2013 00:18:39 -0800
From: Nathan Rossi <nathan.rossi@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Nov 2013 18:18:15 +1000
X-Mailer: git-send-email 1.7.9.5
X-RCIS-Action: ALLOW
MIME-Version: 1.0
Message-ID: <41a9a78e-e827-4551-88c6-78628b1e34da@DB8EHSMHS028.ehs.local>
X-OriginatorOrg: xilinx.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Subject: [PATCH] attr: attr_2.4.47 release tarball missing configure.ac
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
X-List-Received-Date: Mon, 25 Nov 2013 08:18:44 -0000
Content-Type: text/plain

The release tarball of attr 2.4.47 is missing the configure.ac file.
This prevents the autotools bbclass from being able to regenerate the
configure script which leads to other side affects. (e.g. using
outdated config.sub)

This patch adds the configure.ac file via a patch.
(obtained via the source repository at the v2.4.47 tag)

See the mailing list thread for additional information:
http://lists.nongnu.org/archive/html/acl-devel/2013-05/msg00024.html

Signed-off-by: Nathan Rossi <nathan.rossi@xilinx.com>
---

On an additional note, acl 2.2.52 is also affected by this issue.
However it does not affect oe-core as acl has yet to be updated to this
version and currently sits on the older 2.2.51 version.

---
 meta/recipes-support/attr/attr_2.4.47.bb           |    3 +
 .../attr/files/attr-Missing-configure.ac.patch     |   62 ++++++++++++++++++++
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-support/attr/files/attr-Missing-configure.ac.patch

diff --git a/meta/recipes-support/attr/attr_2.4.47.bb b/meta/recipes-support/attr/attr_2.4.47.bb
index a1f2e05..ad40c9b 100644
--- a/meta/recipes-support/attr/attr_2.4.47.bb
+++ b/meta/recipes-support/attr/attr_2.4.47.bb
@@ -1,5 +1,8 @@
 require attr.inc
 
+# configure.ac was missing from the release tarball. This should be fixed in
+# future releases of attr, remove this when updating the recipe.
+SRC_URI_append += "file://attr-Missing-configure.ac.patch"
 
 SRC_URI[md5sum] = "84f58dec00b60f2dc8fd1c9709291cc7"
 SRC_URI[sha256sum] = "25772f653ac5b2e3ceeb89df50e4688891e21f723c460636548971652af0a859"
diff --git a/meta/recipes-support/attr/files/attr-Missing-configure.ac.patch b/meta/recipes-support/attr/files/attr-Missing-configure.ac.patch
new file mode 100644
index 0000000..5887ed5
--- /dev/null
+++ b/meta/recipes-support/attr/files/attr-Missing-configure.ac.patch
@@ -0,0 +1,62 @@
+Subject: [PATCH] attr: Missing configure.ac
+
+Upstream-Status: Backport [Upstream released tarball missing this file]
+---
+ configure.ac |   48 ++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 48 insertions(+)
+ create mode 100644 configure.ac
+
+diff --git a/configure.ac b/configure.ac
+new file mode 100644
+index 0000000..b966d0e
+--- /dev/null
++++ b/configure.ac
+@@ -0,0 +1,48 @@
++# Copyright (C) 2009  Andreas Gruenbacher <agruen@suse.de>
++#
++# This program is free software: you can redistribute it and/or modify it
++# under the terms of the GNU General Public License as published by
++# the Free Software Foundation, either version 2 of the License, or
++# (at your option) any later version.
++#
++# This program is distributed in the hope that it will be useful,
++# but WITHOUT ANY WARRANTY; without even the implied warranty of
++# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++# GNU General Public License for more details.
++#
++# You should have received a copy of the GNU General Public License
++# along with this program.  If not, see <http://www.gnu.org/licenses/>.
++#
++AC_INIT(include/attributes.h)
++AC_CONFIG_AUX_DIR([.])
++AC_CONFIG_MACRO_DIR([m4])
++AC_CONFIG_HEADER(include/config.h)
++AC_PREFIX_DEFAULT(/usr)
++
++AC_PROG_LIBTOOL
++
++AC_ARG_ENABLE(shared,
++[ --enable-shared=[yes/no] Enable use of shared libraries [default=yes]],,
++	enable_shared=yes)
++AC_SUBST(enable_shared)
++
++AC_ARG_ENABLE(gettext,
++[ --enable-gettext=[yes/no] Enable alternate language support [default=yes]],,
++	enable_gettext=yes)
++AC_SUBST(enable_gettext)
++
++AC_ARG_ENABLE(lib64,
++[ --enable-lib64=[yes/no] Enable lib64 support [default=no]],,
++	enable_lib64=no)
++AC_SUBST(enable_lib64)
++
++AC_PACKAGE_GLOBALS(attr)
++AC_PACKAGE_UTILITIES(attr)
++AC_MANUAL_FORMAT
++AC_MULTILIB($enable_lib64)
++
++AC_C_CONST
++AC_TYPE_MODE_T
++AC_FUNC_ALLOCA
++
++AC_OUTPUT(include/builddefs)
-- 
1.7.9.5



