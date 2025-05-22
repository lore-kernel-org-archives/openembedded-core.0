Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 282DFC54756
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 05:17:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.16835.1747891017029424033
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 May 2025 22:16:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=72376e78f2=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M2jfKI011707
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 05:16:56 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46rwfwt5sn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 05:16:55 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 21 May 2025 22:16:36 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 21 May 2025 22:16:36 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/1] buildtools: Add a replacement for file command
Date: Thu, 22 May 2025 13:16:51 +0800
Message-ID: <20250522051651.3711352-2-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250522051651.3711352-1-changqing.li@windriver.com>
References: <20250522051651.3711352-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDA1MCBTYWx0ZWRfX4A03P/tT045V 6c6M+EOb5OfYXYtLY9mBVpFmcrAKV32WHRdy9hMAHDAYSmm/1ZHN+Sjt6S4aadfTetErA1a7Ib7 V7IyjHvEf6ttEhhrT/yumoCRbT7WqYEggEmfMpBp37eW5MbJkUh/9/cWUsNGN1qLeecSxBtIQmK
 PKpFDQytvv950wqgc86zXxQhYL8w/5Vh9FMU/bge1cYkBETi4WMDYfVd2McC3bM36xhEP7x8whn MBzXeWzbqM9bwZPT+NM2hlxMFeAQ7JHN5G8Jf/qWoI5poxjHJZf/ZzUhWNieHvfHR5AcvjwlHuH 560sDSl+/E9MEnbO+j1O61VJGjhPbGmGWK4NDWDB1x6ajzG8V5NJ+MPpbcQF63pbc4fC/QPQ6Wb
 1mZkUn1LWIcHW4koAraGXKy7KiIXTaUgre9Nfqz6Vd1Djhg48CG4qsJ2TrdGjrMyf+g0GENy
X-Proofpoint-ORIG-GUID: jh-jKXYTWny1i7TH4_eGYQogEYFtNSAE
X-Proofpoint-GUID: jh-jKXYTWny1i7TH4_eGYQogEYFtNSAE
X-Authority-Analysis: v=2.4 cv=b6Cy4sGx c=1 sm=1 tr=0 ts=682eb347 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=dt9VzEwgFbYA:10 a=GVZQ-w2tAAAA:8 a=NEAV23lmAAAA:8 a=20KFwNOVAAAA:8 a=t7CeM3EgAAAA:8 a=-D-jplrT8E_qU5RyGU4A:9
 a=nnojEesqh3hWPp0Z:21 a=FjV4NT02KiYA:10 a=RTBzCus7PTMA:10 a=aUihcDRRJRudARt69o_1:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_03,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 spamscore=0 mlxscore=0 mlxlogscore=999 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2505160000 definitions=main-2505220050
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 05:17:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217061

From: Changqing Li <changqing.li@windriver.com>

Fedora 42 has file 5.46 installed, but this version has an issue, setup
will failed with error "Setting it up...*** buffer overflow detected
***: terminated", refer [1], has fixed in [2], but not in any release,
also not cherry picked by fedora, refer [3].

This is a workaround for this issue,  use python3-magic as a
replacement, and it increases the SDK install time in an acceptable
range

With file:
real	0m5.899s
user	0m4.880s
sys	0m3.177s

With python3-magic:
real	0m11.306s
user	0m9.842s
sys	0m4.752s

[1] https://bugs.astron.com/view.php?id=638
[2] https://github.com/file/file/commit/FILE5_46-7-gb3384a1f
[3] https://bugzilla.redhat.com/show_bug.cgi?id=2354970

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/files/toolchain-shar-extract.sh         | 12 ++++++-
 meta/files/toolchain-shar-relocate.sh        |  8 ++++-
 meta/recipes-core/meta/buildtools-tarball.bb |  2 ++
 scripts/file.py                              | 34 ++++++++++++++++++++
 4 files changed, 54 insertions(+), 2 deletions(-)
 create mode 100755 scripts/file.py

diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
index 06934e5a9a..6149d6c2de 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -11,6 +11,16 @@ INIT_PYTHON=$(command -v python3 2>/dev/null )
 [ -z "$INIT_PYTHON" ] && INIT_PYTHON=$(command -v python2 2>/dev/null)
 [ -z "$INIT_PYTHON" ] && echo "Error: The SDK needs a python installed" && exit 1
 
+file_version=$(file --version | head -n 1)
+if [ "$file_version" = "file-5.46" ];then
+    if ! python3 -c "import magic" &> /dev/null; then
+        echo "Error: The SDK needs file command, but the version 5.46 on this host has an issue:"
+        echo "Error: https://bugs.astron.com/view.php?id=638, so please upgrade file to 5.46+ or"
+        echo "Error: install python3-magic as a replacement"
+        exit 1
+    fi
+fi
+
 # Remove invalid PATH elements first (maybe from a previously setup toolchain now deleted
 PATH=`$INIT_PYTHON -c 'import os; print(":".join(e for e in os.environ["PATH"].split(":") if os.path.exists(e)))'`
 
@@ -297,7 +307,7 @@ fi
 # delete the relocating script, so that user is forced to re-run the installer
 # if he/she wants another location for the sdk
 if [ $savescripts = 0 ] ; then
-	$SUDO_EXEC rm -f ${env_setup_script%/*}/relocate_sdk.py ${env_setup_script%/*}/relocate_sdk.sh
+	$SUDO_EXEC rm -f ${env_setup_script%/*}/relocate_sdk.py ${env_setup_script%/*}/relocate_sdk.sh ${env_setup_script%/*}/file.py
 fi
 
 # Execute post-relocation script
diff --git a/meta/files/toolchain-shar-relocate.sh b/meta/files/toolchain-shar-relocate.sh
index c7170349db..f4efcfc88c 100644
--- a/meta/files/toolchain-shar-relocate.sh
+++ b/meta/files/toolchain-shar-relocate.sh
@@ -57,9 +57,15 @@ fi
 
 # replace @SDKPATH@ with the new prefix in all text files: configs/scripts/etc.
 # replace the host perl with SDK perl.
+file_version=$(file --version | head -n 1)
+if [ "$file_version" = "file-5.46" ];then
+    file_cmd="$target_sdk_dir/file.py"
+else
+    file_cmd="file"
+fi
 for replace in "$target_sdk_dir -maxdepth 1" "$native_sysroot"; do
 	$SUDO_EXEC find $replace -type f
-done | xargs -d '\n' -n100 file | \
+done | xargs -d '\n' -n100 $file_cmd | \
     awk -F': ' '{if (match($2, ".*(ASCII|script|source).*text")) {printf "\"%s\"\n", $1}}' | \
     grep -Fv -e "$target_sdk_dir/environment-setup-" \
              -e "$target_sdk_dir/relocate_sdk" \
diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index 6fa6d93a3d..51a54af7e4 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -68,6 +68,8 @@ create_sdk_files:append () {
 	rm -f ${SDK_OUTPUT}/${SDKPATH}/environment-setup-*
 	rm -f ${SDK_OUTPUT}/${SDKPATH}/version-*
 
+	cp ${COREBASE}/scripts/file.py ${SDK_OUTPUT}/${SDKPATH}/
+
 	# Generate new (mini) sdk-environment-setup file
 	script=${1:-${SDK_OUTPUT}/${SDKPATH}/environment-setup-${SDK_SYS}}
 	touch $script
diff --git a/scripts/file.py b/scripts/file.py
new file mode 100755
index 0000000000..69c8cb3d6c
--- /dev/null
+++ b/scripts/file.py
@@ -0,0 +1,34 @@
+#!/usr/bin/env python3
+#
+# Copyright (c) 2025 Wind River Systems, Inc.
+#
+# SPDX-License-Identifier: MIT
+#
+# DESCRIPTION
+# This script may be called by the SDK installer script. It is a replacement
+# for file command, it has a bug in version 5.46. Refer:
+# https://bugs.astron.com/view.php?id=638
+
+from concurrent.futures import ThreadPoolExecutor
+import sys
+import magic
+
+def get_file_type(filename):
+    try:
+        with open(filename, 'rb') as f:
+            data = f.read(2048)
+            file_type = magic.from_buffer(data)
+            print(f"{filename}: {file_type}")
+    except Exception as e:
+        print(f"Error processing {filename}: {e}")
+
+def main():
+    if len(sys.argv) < 2:
+        print("Usage: file.py <file1> <file2> ...")
+        return
+
+    with ThreadPoolExecutor(max_workers=10) as executor:
+        executor.map(get_file_type, sys.argv[1:])
+
+if __name__ == "__main__":
+    main()
-- 
2.34.1


