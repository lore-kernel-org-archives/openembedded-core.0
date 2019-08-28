Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
	[209.85.208.173])
	by mail.openembedded.org (Postfix) with ESMTP id 928277F295
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 20:50:27 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id f9so821926ljc.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 13:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=8wSTtUoUSDOyX0eyTwQM3N1jruBwVo1THwEUB4Y9+tk=;
	b=Rb4L/ks6pUq7XpY0TxQmpNiLPjKfYrXNMHN0mxT3a6ny17fjs95BAEIEsB9X9VaRua
	+eDZAEgVZtTTq/BRk0RcYOId2m/f3cYGhZkqgvmLGcKo/1Z9JBEs0p8CVJbGjm0+P0XY
	Txi2CfdXBpZyDP+lzO3qNV/HG9ggndCciqYxvwmBvf7jt5H4koneoTcKtLe+/EaugDOq
	rlzqWmj0HbNuESM0wW1oSgbKSxA3BWa1Pepr6JuSef1uCUzDHCNRRm0zErk1Scw5bgYA
	L0vvDecCtN5JsedimfVJATjVVY+isTs+10tLbWC2DBCJobibsHq8M1d8HnJsYXvmrcP7
	LxIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8wSTtUoUSDOyX0eyTwQM3N1jruBwVo1THwEUB4Y9+tk=;
	b=aTPfMsnRgCtYV/mDlCsVUS+RASHWiZf6vIK2CuQdi9Za91Oz9OxCRLC3kw1XilTssB
	NIGsBf3J7l4hx/Po0lawbZhznPMpWZiTQCE5VNfmwTVvODKCGQMTCJIzWYA7b1Gto+n/
	b8ip2RUrWOybj0MsGcsphg2lZwOi+NP/CaDutb9XCvT+iVglANL9oPi7W7Z3BFU451Rv
	lzzWOZFUZiIbyeGeyivrmWcVJTjV8E5OjaPm1GU+2y6pLVJMEGMlvbWs9a70eIVmQSas
	kMuOtpgvwDkVmcTJ0f7fEPvGnxpcvhoMFGec0WEYXnIDHPeZK+biSbWtXUcbvTUpMnjT
	1FQw==
X-Gm-Message-State: APjAAAWLGoSj3ilh3Ks6Nr4JNbjV/VLtI5WF1QXXTPE0sKkuAe0YiLQl
	MyJgprbT/5ASP8TMb+sPl6O0jLOn
X-Google-Smtp-Source: APXvYqyLXMxJSPYWG6Rr/VNdlfFlm8GMoUCry4iH9OuEHlTl2vv63JhCugQZrw5APWiKvltHNDOVsA==
X-Received: by 2002:a2e:3a05:: with SMTP id h5mr3251503lja.135.1567025427493; 
	Wed, 28 Aug 2019 13:50:27 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id y8sm50725ljn.65.2019.08.28.13.50.26
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 28 Aug 2019 13:50:26 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Aug 2019 22:50:16 +0200
Message-Id: <20190828205016.2551-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] ltp: move from python 2.x to python 3.x
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
X-List-Received-Date: Wed, 28 Aug 2019 20:50:28 -0000

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


