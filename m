Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 by mx.groups.io with SMTP id smtpd.web12.4414.1593164460228542925
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2020 02:41:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cetitec.com, ip: 212.227.126.131, mailfrom: johannes.beisswenger@cetitec.com)
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N5VTm-1inMOG1dUY-016z9g for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2020 11:40:58 +0200
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
	by mail.cetitecgmbh.com (Postfix) with ESMTP id 28AF765046B
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2020 09:40:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
	by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8btHYT2_Urzl
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jun 2020 11:40:57 +0200 (CEST)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
	by mail.cetitecgmbh.com (Postfix) with ESMTPS id B277B650250
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2020 11:40:57 +0200 (CEST)
Received: from p53jbe.corp.cetitec.com (10.10.5.239) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 26 Jun 2020 11:40:57 +0200
From: "Johannes Beisswenger" <johannes.beisswenger@cetitec.com>
To: <openembedded-core@lists.openembedded.org>
CC: Johannes Beisswenger <johannes.beisswenger@cetitec.com>
Subject: [pseudo][PATCH 2/2] test: Added ACL tests
Date: Fri, 26 Jun 2020 11:40:59 +0200
Message-ID: <20200626094059.10027-1-johannes.beisswenger@cetitec.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Originating-IP: [10.10.5.239]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536B6C756B
X-Provags-ID: V03:K1:LPmxAc4IithNJmCF+nrveMaZRMWDMi+dKlRGZRLeJZapkertiUC
 BL600ZPlCt0aGe2vFdr8lFOHxzMORDn7yVOzuAV3wp0TkZhJD5xPnwMdx4KvsJma5x/ZoIc
 iYhXqJ/YvIuJmMhadNcepKgjo/Z4k2jaVFpEtIwC/dJrAYbVqjudOGN6D2hGoD4A6Ag+kVw
 mt59w3Z4KB3ikE0Pn9dzw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:cIJ/vjLNrac=:BqJEA4pvPMoPpmM7aSlg9O
 ve/SVGJmE54dZ6UNpCa8jNgbOiUV6uM0pxhOVvmBcqK67VmvCXEf7jWJwqMKP2yKaIDgG9khO
 gm5wgd2Wsw9qzPitCGV0c7/14SuN9rPU344W0MKYTB7xaCNx7/I6UygBKVIL34+vLJAKglXfx
 jUA1rWek1l+eaQUkY2USqHYobgugalrlwgQXEkDAdVM656sBwxMdCzgY+babiygmkuGfAMxbw
 KXAHW8N1V+rnZewAxEdQKMiXD8EqC+v4jbXc9MzHLgx2vjCn3T0zg2OPPHqSqMx6ByJxwXhWW
 ZHBI9aNmV4my5RBp0sH23HesTQqLl4uWHhMWCIgu2x3H5tCYxmEh/Z9e+5w4p05030h08r8bd
 xOMGD9ua/Od0tu94AG2OlSRzpL9hEwe2JyvVfMFyActpBHRyuw5TTwxASe0nTaSV7ELsznvma
 T32gJ0ZZLxsePOHk9lTeyr+XQ8YxrduUq6XEACW64E3nnUt0yiDRV0H/lVrSoq1NU1gqNHMa5
 XoEIGOkfgHSJWpcZCggDEGnG+3lPfnwHS8yBK/bna2QYLBZmHII/8cjonwZbownP6L2Ys54fI
 8jSLpTbXrXwH7M9UD4qerJbaeV4bFuQnxt2NKq/lTQzwdPknv3H9LOS0EgF01AuKvtRM1z/zt
 xINE2SJaXK0sO1BNjNOdglmaUwE5x1dmR+tw/ntAZDIMuJbCJM5o8ls3fKORneKNsdu7/hhKz
 1sSB0u7c+uIhr3pp35gj3HyxkBa4N70mpmX4/uQGuMdqOlBnQ1UDxTRhLrEJejlK9WBun1LG/
 ggjlFCZnEUFmp/3G5p6WhbdaDJtfaUabWi4AgH4JGyOhnAZwFej7Msw5BMhHTTa9t9VSVAA
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Johannes Beisswenger <johannes.beisswenger@cetitec.com>
---
 test/test-acl.sh | 188 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 188 insertions(+)
 create mode 100755 test/test-acl.sh

diff --git a/test/test-acl.sh b/test/test-acl.sh
new file mode 100755
index 0000000..fb7d5ec
--- /dev/null
+++ b/test/test-acl.sh
@@ -0,0 +1,188 @@
+#!/bin/bash
+#
+# SPDX-License-Identifier: LGPL-2.1-only
+#
+
+# Return vals: 2 - Unable to run ACL commands, assertion failure
+#              1 - Invalid return value
+#              0 - Pass
+
+# NOTE: these test exclusively test setfacl -m
+
+set -u
+
+check_owner () {
+    local file="$1"
+    local expected="$2"
+    local msg="$3"
+    local actual=$(stat -c "%U" "$file")
+    if [ "$actual" != "$expected" ]
+    then
+        echo "$msg" "Fail, '$file' unexpected owner '$actual'"
+        exit 2
+    fi
+}
+
+check_group () {
+    local file="$1"
+    local expected="$2"
+    local msg="$3"
+    local actual=$(stat -c "%G" "$file")
+    if [ "$actual" != "$expected" ]
+    then
+        echo "$msg" "Fail, '$file' unexpected group '$actual'"
+        exit 2
+    fi
+}
+
+check_acl_contains () {
+    local file="$1"
+    local acl="$2"
+    local msg="$3"
+    IFS=',' read -ra acls <<< "$acl"
+    for pattern in "${acls[@]}"; do
+        result=$(getfacl -c "$file" | grep -o "^$pattern")
+        if [ "$result" != "$pattern" ]
+        then
+            echo "$msg" "Fail, did not find desired acl '$pattern' in '$file'"
+            exit 2
+        fi
+    done
+}
+
+check_acl_minimal () {
+    local file="$1"
+    local msg="${2:-''}"
+    local acls
+    acls=$(getfacl -c "${file}" | grep -v "::")
+    if [ -n "$acls" ]
+    then
+        echo "$msg" "Fail, '$file' unexpected getfacl result '$acls'"
+        exit 1
+    fi
+}
+
+test_modify_once () {
+    local file="$1"
+    local acl="$2"
+    local msg="${3:-''}"
+    # ensure that file is pristine
+    check_acl_minimal "$file" "$msg precondition:"
+    check_owner "$file" root "$msg precondition:"
+    check_group "$file" root "$msg precondition:"
+    if ! setfacl -m "$acl" "$file"
+    then
+        echo "$msg"  "Fail, unable to call setfacl"
+        exit 2
+    fi
+    check_acl_contains "$file" "$acl" "$msg: acl not set:"
+    check_owner "$file" root "$msg owner corrupted:"
+    check_group "$file" root "$msg group corrupted:"
+}
+
+
+trap "rm -rf testdir" EXIT
+mkdir testdir || exit 1
+
+
+# user
+touch testdir/f1 || exit 1
+mkdir testdir/d1 || exit 1
+# regular file
+test_modify_once testdir/f1 "user:root:r" "$LINENO:"
+# directory
+test_modify_once testdir/d1 "user:root:r" "$LINENO:"
+rm -rf testdir/f1 testdir/d1
+
+#group
+rm -rf testdir/f1 testdir/d1
+touch testdir/f1 || exit 1
+mkdir testdir/d1 || exit 1
+# regular file
+test_modify_once testdir/f1 "group:root:r" "$LINENO:"
+# directory
+test_modify_once testdir/d1 "group:root:r" "$LINENO:"
+rm -rf testdir/f1 testdir/d1
+
+# multiple users
+touch testdir/f1 || exit 1
+mkdir testdir/d1 || exit 1
+# regular file
+test_modify_once testdir/f1 "user:root:r,group:root:r,user:bin:rw" "$LINENO:"
+# directory
+test_modify_once testdir/d1 "user:root:r,group:root:r,user:bin:rw" "$LINENO:"
+rm -rf testdir/f1 testdir/d1
+
+
+# setfacl default acls
+mkdir testdir/d1 || exit 1
+test_modify_once testdir/d1 "default:user:root:r,user:root:r" "$LINENO:"
+rm -rf testdir/d1
+
+
+# multiple calls to setfacl -m on same file
+touch testdir/f1 || exit 1
+mkdir testdir/d1 || exit 1
+check_owner testdir/f1 root "$LINENO: precondition:"
+check_group testdir/f1 root "$LINENO: precondition:"
+check_acl_minimal testdir/f1 "$LINENO: precondition:"
+
+acl1="user:root:r"
+acl2="user:bin:rw"
+
+if ! setfacl -m "$acl1" testdir/f1 # first setfacl
+then
+    echo "$LINENO:"  "Fail, unable to call setfacl"
+    exit 2
+fi
+check_acl_contains testdir/f1 "$acl1" "$LINENO: acl1 not set:"
+check_owner testdir/f1 root "$LINENO: owner corrupted:"
+check_group testdir/f1 root "$LINENO: group corrupted:"
+
+if ! setfacl -m "$acl2" testdir/f1 # second setfacl
+then
+    echo "$LINENO:"  "Fail, unable to call setfacl"
+    exit 2
+fi
+
+check_acl_contains testdir/f1 "$acl1" "$LINENO: acl1 not set:"
+check_acl_contains testdir/f1 "$acl2" "$LINENO: acl2 not set:"
+check_owner testdir/f1 root "$LINENO: owner corrupted:"
+check_group testdir/f1 root "$LINENO: group corrupted:"
+rm -rf testdir/f1 testdir/d1
+
+# setfacl recursive
+test_modify_recursive () {
+    local root_dir="$1"
+    local acl="$2"
+    local msg="${3:-''}"
+
+    find "$root_dir" | while read -r file; do
+        check_owner "$file" root "$msg precondition:"
+        check_group "$file" root "$msg precondition:"
+        check_acl_minimal "$file" "$msg precondition:"
+    done
+    if ! setfacl -R -m "$acl" "$root_dir"
+    then
+        echo "$msg"  "Fail, unable to call setfacl"
+        exit 2
+    fi
+    find "$root_dir" | while read -r file; do
+        check_owner "$file" root "$msg owner corrupted:"
+        check_group "$file" root "$msg group corrupted:"
+        check_acl_contains "$file" "$acl" "$msg acl not set:"
+    done
+}
+
+mkdir -p testdir/d1/d2 || exit 1
+touch testdir/d1/d2/f1 || exit 1
+test_modify_recursive testdir/d1 "user:root:r,group:root:r,user:bin:rw" "$LINENO:"
+rm -rf testdir/d1
+
+mkdir -p testdir/d1/d2 || exit 1
+mkdir -p testdir/d1/d3 || exit 1
+test_modify_recursive testdir/d1 "default:user:root:rwx,user:root:r,group:root:r,user:bin:rw" "$LINENO:"
+rm -rf testdir/d1
+
+#echo "Passed."
+exit 0
-- 
2.27.0

