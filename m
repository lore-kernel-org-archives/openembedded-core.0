Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id 230817F43D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 12:50:09 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id g207so3218972wmg.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 05:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=8wSTtUoUSDOyX0eyTwQM3N1jruBwVo1THwEUB4Y9+tk=;
	b=kxNeU7tTswnUqMLqOoFn2Q0otFV6HipVdLQPYFOiprNmSTc6jqAsm1oimQkkzSlZZf
	+13irz9v7F3qXVF6WQebc7+iZ0KYq80AXlV89Fi0eGt9XICKOWEEwVTpYvpPvvQeWqI4
	11WK6qprp6ei1Hi520oNbDWRMjoN0HUfs8165V3ZL/2LhMyFIFjxn/Y8L1mtjxSQbqJb
	h8LNap2HjIvNIMdUkBMVFudDrVdqyr8ZFKpJef85mB3GlZvto9G7XRecLi+8bu+KAQx7
	z3opqI97IhrrnmEsqZaNaYjwlIH75rf6MiECcwaulNCAxtGcwgvY0s4hsG7HOFlIBUPi
	1quw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=8wSTtUoUSDOyX0eyTwQM3N1jruBwVo1THwEUB4Y9+tk=;
	b=gqi6NWp3Y8gpD3AFPriAP09PqPCj329EYiRAmqzdi/11TpfxkTrZrEpimSfzV1oqwN
	94MpU92u/fgwAqwa8lMcdmlo7PFj5HZMIcaUOcSL8xZvNse3HjYV3N0wI5sJKxEFah88
	dyh6rP9uS56LW64DVZAkFZq351Zyeo69z3KrtsbjeDvTKMCF8kRJbhwhBQDVpaRRbCPj
	7johGB5B5cid9ObARI7ufJ/22tRElDDXpnGQ+Kxoyt9gdFba6ApIJjn6lWP2OU5XJ+j9
	LptjgsvDNKKHwEM6rDIgUOxrnuwEvE7ZKBQSk/4RK1HiMloaHwTBjQGpI72JcxMTavTM
	pjEg==
X-Gm-Message-State: APjAAAUsoKSIW/sSh7XQnyI9DjCrJQAE2DQ8uoVNAYtOXruC8Iu27xkc
	jqqUotlrarmHcB5h9PwNIJEGRq3l
X-Google-Smtp-Source: APXvYqwLzThhjHkuc1d3bNdLKXhyUwDsGC8Ld6y/GXvLjQDJEKN41TU0l1yJRbUT3Vj0rMhcEol8Eg==
X-Received: by 2002:a1c:5451:: with SMTP id p17mr13030694wmi.103.1567169409593;
	Fri, 30 Aug 2019 05:50:09 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id d1sm6307481wrs.71.2019.08.30.05.50.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 30 Aug 2019 05:50:09 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Aug 2019 14:49:50 +0200
Message-Id: <cef865ba22ce8ae2926eda869aaca8ee10ef52b9.1567169002.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1567169002.git.alex.kanavin@gmail.com>
References: <cover.1567169002.git.alex.kanavin@gmail.com>
Subject: [PATCH 05/13] ltp: move from python 2.x to python 3.x
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
X-List-Received-Date: Fri, 30 Aug 2019 12:50:09 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...thon3-everywhere-to-run-python-scrip.patch | 161 ++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20190517.bb     |   3 +-
 2 files changed, 163 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-testcases-use-python3-everywhere-to-run-python-scrip.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-testcases-use-python3-everywhere-to-run-python-scrip.patch b/meta/recipes-extended/ltp/ltp/0001-testcases-use-python3-everywhere-to-run-python-scrip.patch
new file mode 100644
index 00000000000..f4f87f38ab7
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-testcases-use-python3-everywhere-to-run-python-scrip.patch
@@ -0,0 +1,161 @@
+From 0463d793566772a606255957915f99d166d5740c Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 28 Aug 2019 18:30:23 +0200
+Subject: [PATCH] testcases: use python3 everywhere to run python scripts
+
+The scripts themselves have #!/usr/bin/python3 in them,
+so I trust they are already py3-compatible.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ testcases/kernel/power_management/runpwtests05.sh  |  2 +-
+ .../power_management/runpwtests_exclusive01.sh     |  2 +-
+ .../power_management/runpwtests_exclusive02.sh     |  2 +-
+ .../power_management/runpwtests_exclusive03.sh     |  2 +-
+ .../power_management/runpwtests_exclusive04.sh     |  2 +-
+ .../power_management/runpwtests_exclusive05.sh     |  2 +-
+ testcases/network/nfsv4/acl/runtest                | 14 +++++++-------
+ testcases/realtime/func/pi-tests/run_auto.sh       |  6 +++---
+ 8 files changed, 16 insertions(+), 16 deletions(-)
+
+diff --git a/testcases/kernel/power_management/runpwtests05.sh b/testcases/kernel/power_management/runpwtests05.sh
+index 8a7d0f6e0..43e234d01 100755
+--- a/testcases/kernel/power_management/runpwtests05.sh
++++ b/testcases/kernel/power_management/runpwtests05.sh
+@@ -35,7 +35,7 @@ else
+ 	max_sched_smt=1
+ fi
+ 
+-tst_test_cmds python
++tst_test_cmds python3
+ 
+ if ! grep sched_debug -qw /proc/cmdline ; then
+ 	tst_brkm TCONF "Kernel cmdline parameter 'sched_debug' needed," \
+diff --git a/testcases/kernel/power_management/runpwtests_exclusive01.sh b/testcases/kernel/power_management/runpwtests_exclusive01.sh
+index ec78319e2..9fefcbf6e 100755
+--- a/testcases/kernel/power_management/runpwtests_exclusive01.sh
++++ b/testcases/kernel/power_management/runpwtests_exclusive01.sh
+@@ -35,7 +35,7 @@ else
+ 	max_sched_smt=1
+ fi
+ 
+-tst_test_cmds python
++tst_test_cmds python3
+ 
+ hyper_threaded=$(is_hyper_threaded)
+ multi_socket=$(is_multi_socket)
+diff --git a/testcases/kernel/power_management/runpwtests_exclusive02.sh b/testcases/kernel/power_management/runpwtests_exclusive02.sh
+index e107fce35..2cd0ecb05 100755
+--- a/testcases/kernel/power_management/runpwtests_exclusive02.sh
++++ b/testcases/kernel/power_management/runpwtests_exclusive02.sh
+@@ -33,7 +33,7 @@ else
+ 	max_sched_smt=1
+ fi
+ 
+-tst_test_cmds python
++tst_test_cmds python3
+ 
+ hyper_threaded=$(is_hyper_threaded)
+ multi_socket=$(is_multi_socket)
+diff --git a/testcases/kernel/power_management/runpwtests_exclusive03.sh b/testcases/kernel/power_management/runpwtests_exclusive03.sh
+index 490344bb3..ab3a5d11d 100755
+--- a/testcases/kernel/power_management/runpwtests_exclusive03.sh
++++ b/testcases/kernel/power_management/runpwtests_exclusive03.sh
+@@ -35,7 +35,7 @@ else
+ 	max_sched_smt=1
+ fi
+ 
+-tst_test_cmds python
++tst_test_cmds python3
+ 
+ hyper_threaded=$(is_hyper_threaded)
+ multi_socket=$(is_multi_socket)
+diff --git a/testcases/kernel/power_management/runpwtests_exclusive04.sh b/testcases/kernel/power_management/runpwtests_exclusive04.sh
+index 978ca02ae..438ef603f 100755
+--- a/testcases/kernel/power_management/runpwtests_exclusive04.sh
++++ b/testcases/kernel/power_management/runpwtests_exclusive04.sh
+@@ -27,7 +27,7 @@ export TST_TOTAL=2
+ # Checking test environment
+ check_kervel_arch
+ 
+-tst_test_cmds python
++tst_test_cmds python3
+ 
+ hyper_threaded=$(is_hyper_threaded)
+ multi_socket=$(is_multi_socket)
+diff --git a/testcases/kernel/power_management/runpwtests_exclusive05.sh b/testcases/kernel/power_management/runpwtests_exclusive05.sh
+index a0dad5834..3a9afdbf2 100755
+--- a/testcases/kernel/power_management/runpwtests_exclusive05.sh
++++ b/testcases/kernel/power_management/runpwtests_exclusive05.sh
+@@ -35,7 +35,7 @@ else
+ 	max_sched_smt=1
+ fi
+ 
+-tst_test_cmds python
++tst_test_cmds python3
+ 
+ hyper_threaded=$(is_hyper_threaded)
+ multi_socket=$(is_multi_socket)
+diff --git a/testcases/network/nfsv4/acl/runtest b/testcases/network/nfsv4/acl/runtest
+index d2e1b4c49..a859e85bc 100755
+--- a/testcases/network/nfsv4/acl/runtest
++++ b/testcases/network/nfsv4/acl/runtest
+@@ -22,7 +22,7 @@ do
+ done
+ 
+ #  creation of users on the remote machine (removed only at the end of the tests)
+-rsh -n $REMOTEHOST python $PWD/create_users.py -u 50 -g 50
++rsh -n $REMOTEHOST python3 $PWD/create_users.py -u 50 -g 50
+ 
+ echo "Starting ACL testing"
+ 
+@@ -51,19 +51,19 @@ echo "Basic tests finished"
+ 
+ echo "LONG ACL TEST"
+ echo "creating necessary users and groups"
+-python create_users.py -u 50 -g 50
++python3 create_users.py -u 50 -g 50
+ echo "creating necessary users and groups on the remote host"
+ mkdir $NFSMNTDIR/lacl-testdir
+-python test_long_acl.py -l $MAXLENGTH -p $NFSMNTDIR/lacl-testdir
++python3 test_long_acl.py -l $MAXLENGTH -p $NFSMNTDIR/lacl-testdir
+ rm -rf $NFSMNTDIR/lacl-testdir
+ echo "Long ACL test OK with $MAXLENGTH entries"
+ echo "ACL STRESSING TEST"
+-python setacl_stress.py -n 100 -u $USER_NB -g $GRP_NB -f $FILE_NB -p $NFSMNTDIR
++python3 setacl_stress.py -n 100 -u $USER_NB -g $GRP_NB -f $FILE_NB -p $NFSMNTDIR
+ 
+ # remove local an remote users
+-python cleanusers.py
+-python cleangroups.py
+-rsh -n $REMOTEHOST python $PWD/cleanusers.py
++python3 cleanusers.py
++python3 cleangroups.py
++rsh -n $REMOTEHOST python3 $PWD/cleanusers.py
+ 
+ echo "Test OK"
+ 
+diff --git a/testcases/realtime/func/pi-tests/run_auto.sh b/testcases/realtime/func/pi-tests/run_auto.sh
+index d13026049..277988568 100755
+--- a/testcases/realtime/func/pi-tests/run_auto.sh
++++ b/testcases/realtime/func/pi-tests/run_auto.sh
+@@ -15,15 +15,15 @@ $SCRIPTS_DIR/run_c_files.sh $profile testpi-0
+ 
+ export LOG_FILE="$LOG_DIR/$LOG_FORMAT-testpi-1.log"
+ $SCRIPTS_DIR/run_c_files.sh $profile testpi-1
+-PYTHONPATH=../../  python parse-testpi1.py $LOG_FILE 2>&1 | tee -a $LOG_FILE
++PYTHONPATH=../../  python3 parse-testpi1.py $LOG_FILE 2>&1 | tee -a $LOG_FILE
+ 
+ export LOG_FILE="$LOG_DIR/$LOG_FORMAT-testpi-2.log"
+ $SCRIPTS_DIR/run_c_files.sh $profile testpi-2
+-PYTHONPATH=../../  python parse-testpi2.py $LOG_FILE 2>&1 | tee -a $LOG_FILE
++PYTHONPATH=../../  python3 parse-testpi2.py $LOG_FILE 2>&1 | tee -a $LOG_FILE
+ 
+ export LOG_FILE="$LOG_DIR/$LOG_FORMAT-testpi-4.log"
+ $SCRIPTS_DIR/run_c_files.sh $profile testpi-4
+-PYTHONPATH=../../  python parse-testpi1.py $LOG_FILE 2>&1 | tee -a $LOG_FILE
++PYTHONPATH=../../  python3 parse-testpi1.py $LOG_FILE 2>&1 | tee -a $LOG_FILE
+ 
+ 
+ export LOG_FILE=""
diff --git a/meta/recipes-extended/ltp/ltp_20190517.bb b/meta/recipes-extended/ltp/ltp_20190517.bb
index b0e2f969c7a..3826ea8560d 100644
--- a/meta/recipes-extended/ltp/ltp_20190517.bb
+++ b/meta/recipes-extended/ltp/ltp_20190517.bb
@@ -45,6 +45,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0002-check-for-RES_USE_INET6-during-configure.patch \
            file://0001-syscalls-tgkill03-wait-for-defunct-tid-to-get-detach.patch \
            file://0001-ustat02-Fix-EFAULT-in-32bit-compatibility-mode.patch \
+           file://0001-testcases-use-python3-everywhere-to-run-python-scrip.patch \
            "
 
 S = "${WORKDIR}/git"
@@ -96,7 +97,7 @@ RDEPENDS_${PN} = "\
     libaio \
     logrotate \
     perl \
-    python-core \
+    python3-core \
     procps \
     quota \
     unzip \
-- 
2.17.1


