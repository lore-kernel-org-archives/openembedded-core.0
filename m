Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f173.google.com (mail-ea0-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id C6B496E307
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 02:36:58 +0000 (UTC)
Received: by mail-ea0-f173.google.com with SMTP id o10so591468eaj.32
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2013 18:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=goKsgevK6z0S4qOfZhcmKJ3HTe3Uy5DARmGngOUOke8=;
	b=bmkkxUBBfhsEPystOidV/vVfVxq5DORkJSS2SyWuP6jr1cL6YQSl26sdZyOPWVjNDx
	C93YVs3v9KJp2f/YB8G4wuyvdpF+bQN/rKUtGdAPkw8rREm2zd/QdGGleuL+qPBq8f1y
	BsyDg11PHMloV2wMtz+HT3AqKv284bp+w2X13pMF46bbtfmDCsgswzuytGk+bDQ4u2P9
	EjGZzBWkGy/rW1FW1t/DJEQfd/qgX38XCL845E026mOEO1hZ1ynxlW9hQiwoCbUBDGIV
	qpXqDJQmLKumtPOjYrAHyQRA8JEwgKr1WVMEqlXtMg6zxx/oVwMqvW2rCYLyuPGlVAvR
	5Erw==
X-Received: by 10.14.2.73 with SMTP id 49mr95876eee.15.1386902217762;
	Thu, 12 Dec 2013 18:36:57 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id v7sm1435567eel.2.2013.12.12.18.36.56
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Dec 2013 18:36:57 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Dec 2013 03:37:18 +0100
Message-Id: <1386902238-4354-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
In-Reply-To: <52A73622.4030608@linux.intel.com>
References: <52A73622.4030608@linux.intel.com>
Subject: [PATCH] ltp: Use patch generated without -M
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
X-List-Received-Date: Fri, 13 Dec 2013 02:37:00 -0000

* in my builds both versions worked, but Saul reported that it fails to
  apply with:
  Applying patch
  0001-Rename-runtests_noltp.sh-script-so-have-unique-name.patch
  patch: **** Only garbage was found in the patch input.

  Now I've see the same issue on different builder (with Ubuntu 12.04).

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...tests_noltp.sh-script-so-have-unique-name.patch | 190 +++++++++++++++++++--
 1 file changed, 177 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-extended/ltp/ltp/0001-Rename-runtests_noltp.sh-script-so-have-unique-name.patch b/meta/recipes-extended/ltp/ltp/0001-Rename-runtests_noltp.sh-script-so-have-unique-name.patch
index 74abe56..1b4d232 100644
--- a/meta/recipes-extended/ltp/ltp/0001-Rename-runtests_noltp.sh-script-so-have-unique-name.patch
+++ b/meta/recipes-extended/ltp/ltp/0001-Rename-runtests_noltp.sh-script-so-have-unique-name.patch
@@ -19,20 +19,184 @@ Upstream-Status: Pending
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
- .../kernel/containers/sysvipc/{runtests_noltp.sh => runipctests_noltp.sh} | 0
- .../kernel/containers/utsname/{runtests_noltp.sh => runutstests_noltp.sh} | 0
- 2 files changed, 0 insertions(+), 0 deletions(-)
- rename testcases/kernel/containers/sysvipc/{runtests_noltp.sh => runipctests_noltp.sh} (100%)
- rename testcases/kernel/containers/utsname/{runtests_noltp.sh => runutstests_noltp.sh} (100%)
+ .../kernel/containers/sysvipc/runipctests_noltp.sh | 31 ++++++++++++++++
+ .../kernel/containers/sysvipc/runtests_noltp.sh    | 31 ----------------
+ .../kernel/containers/utsname/runtests_noltp.sh    | 41 ----------------------
+ .../kernel/containers/utsname/runutstests_noltp.sh | 41 ++++++++++++++++++++++
+ 4 files changed, 72 insertions(+), 72 deletions(-)
+ create mode 100644 testcases/kernel/containers/sysvipc/runipctests_noltp.sh
+ delete mode 100644 testcases/kernel/containers/sysvipc/runtests_noltp.sh
+ delete mode 100755 testcases/kernel/containers/utsname/runtests_noltp.sh
+ create mode 100755 testcases/kernel/containers/utsname/runutstests_noltp.sh
 
-diff --git a/testcases/kernel/containers/sysvipc/runtests_noltp.sh b/testcases/kernel/containers/sysvipc/runipctests_noltp.sh
-similarity index 100%
-rename from testcases/kernel/containers/sysvipc/runtests_noltp.sh
-rename to testcases/kernel/containers/sysvipc/runipctests_noltp.sh
-diff --git a/testcases/kernel/containers/utsname/runtests_noltp.sh b/testcases/kernel/containers/utsname/runutstests_noltp.sh
-similarity index 100%
-rename from testcases/kernel/containers/utsname/runtests_noltp.sh
-rename to testcases/kernel/containers/utsname/runutstests_noltp.sh
+diff --git a/testcases/kernel/containers/sysvipc/runipctests_noltp.sh b/testcases/kernel/containers/sysvipc/runipctests_noltp.sh
+new file mode 100644
+index 0000000..84f398f
+--- /dev/null
++++ b/testcases/kernel/containers/sysvipc/runipctests_noltp.sh
+@@ -0,0 +1,31 @@
++#!/bin/sh
++################################################################################
++##                                                                            ##
++## Copyright (c) International Business Machines  Corp., 2007                 ##
++##                                                                            ##
++## This program is free software;  you can redistribute it and#or modify      ##
++## it under the terms of the GNU General Public License as published by       ##
++## the Free Software Foundation; either version 2 of the License, or          ##
++## (at your option) any later version.                                        ##
++##                                                                            ##
++## This program is distributed in the hope that it will be useful, but        ##
++## WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY ##
++## or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License   ##
++## for more details.                                                          ##
++##                                                                            ##
++## You should have received a copy of the GNU General Public License          ##
++## along with this program;  if not, write to the Free Software               ##
++## Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA    ##
++##                                                                            ##
++################################################################################
++
++exit_code=0
++echo "sysvipc tests"
++for type in none clone unshare; do
++      echo "**sysvipc $type"
++      ./shmnstest_noltp $type
++      if [ $? -ne 0 ]; then
++              exit_code=$?
++      fi
++done
++exit $exit_code
+diff --git a/testcases/kernel/containers/sysvipc/runtests_noltp.sh b/testcases/kernel/containers/sysvipc/runtests_noltp.sh
+deleted file mode 100644
+index 84f398f..0000000
+--- a/testcases/kernel/containers/sysvipc/runtests_noltp.sh
++++ /dev/null
+@@ -1,31 +0,0 @@
+-#!/bin/sh
+-################################################################################
+-##                                                                            ##
+-## Copyright (c) International Business Machines  Corp., 2007                 ##
+-##                                                                            ##
+-## This program is free software;  you can redistribute it and#or modify      ##
+-## it under the terms of the GNU General Public License as published by       ##
+-## the Free Software Foundation; either version 2 of the License, or          ##
+-## (at your option) any later version.                                        ##
+-##                                                                            ##
+-## This program is distributed in the hope that it will be useful, but        ##
+-## WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY ##
+-## or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License   ##
+-## for more details.                                                          ##
+-##                                                                            ##
+-## You should have received a copy of the GNU General Public License          ##
+-## along with this program;  if not, write to the Free Software               ##
+-## Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA    ##
+-##                                                                            ##
+-################################################################################
+-
+-exit_code=0
+-echo "sysvipc tests"
+-for type in none clone unshare; do
+-      echo "**sysvipc $type"
+-      ./shmnstest_noltp $type
+-      if [ $? -ne 0 ]; then
+-              exit_code=$?
+-      fi
+-done
+-exit $exit_code
+diff --git a/testcases/kernel/containers/utsname/runtests_noltp.sh b/testcases/kernel/containers/utsname/runtests_noltp.sh
+deleted file mode 100755
+index 43cb7e2..0000000
+--- a/testcases/kernel/containers/utsname/runtests_noltp.sh
++++ /dev/null
+@@ -1,41 +0,0 @@
+-#!/bin/sh
+-################################################################################
+-##                                                                            ##
+-## Copyright (c) International Business Machines  Corp., 2007                 ##
+-##                                                                            ##
+-## This program is free software;  you can redistribute it and#or modify      ##
+-## it under the terms of the GNU General Public License as published by       ##
+-## the Free Software Foundation; either version 2 of the License, or          ##
+-## (at your option) any later version.                                        ##
+-##                                                                            ##
+-## This program is distributed in the hope that it will be useful, but        ##
+-## WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY ##
+-## or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License   ##
+-## for more details.                                                          ##
+-##                                                                            ##
+-## You should have received a copy of the GNU General Public License          ##
+-## along with this program;  if not, write to the Free Software               ##
+-## Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA    ##
+-##                                                                            ##
+-################################################################################
+-
+-oldhostname=`hostname`
+-exit_code=0
+-echo "unshare tests"
+-for i in `seq 1 5`; do
+-	echo "test $i (unshare)"
+-	./utstest_noltp unshare $i
+-	if [ $? -ne 0 ]; then
+-		exit_code=$?
+-	fi
+-done
+-echo "clone tests"
+-for i in `seq 1 5`; do
+-	echo "test $i (clone)"
+-	./utstest_noltp clone $i
+-	if [ $? -ne 0 ]; then
+-		exit_code=$?
+-	fi
+-done
+-hostname "$oldhostname"
+-exit $exit_code
+diff --git a/testcases/kernel/containers/utsname/runutstests_noltp.sh b/testcases/kernel/containers/utsname/runutstests_noltp.sh
+new file mode 100755
+index 0000000..43cb7e2
+--- /dev/null
++++ b/testcases/kernel/containers/utsname/runutstests_noltp.sh
+@@ -0,0 +1,41 @@
++#!/bin/sh
++################################################################################
++##                                                                            ##
++## Copyright (c) International Business Machines  Corp., 2007                 ##
++##                                                                            ##
++## This program is free software;  you can redistribute it and#or modify      ##
++## it under the terms of the GNU General Public License as published by       ##
++## the Free Software Foundation; either version 2 of the License, or          ##
++## (at your option) any later version.                                        ##
++##                                                                            ##
++## This program is distributed in the hope that it will be useful, but        ##
++## WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY ##
++## or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License   ##
++## for more details.                                                          ##
++##                                                                            ##
++## You should have received a copy of the GNU General Public License          ##
++## along with this program;  if not, write to the Free Software               ##
++## Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA    ##
++##                                                                            ##
++################################################################################
++
++oldhostname=`hostname`
++exit_code=0
++echo "unshare tests"
++for i in `seq 1 5`; do
++	echo "test $i (unshare)"
++	./utstest_noltp unshare $i
++	if [ $? -ne 0 ]; then
++		exit_code=$?
++	fi
++done
++echo "clone tests"
++for i in `seq 1 5`; do
++	echo "test $i (clone)"
++	./utstest_noltp clone $i
++	if [ $? -ne 0 ]; then
++		exit_code=$?
++	fi
++done
++hostname "$oldhostname"
++exit $exit_code
 -- 
 1.8.4.3
 
-- 
1.8.4.3


