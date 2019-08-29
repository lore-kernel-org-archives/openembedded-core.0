Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8A1207F31A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 08:08:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x7T88xl9017959
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 29 Aug 2019 01:08:59 -0700 (PDT)
Received: from [128.224.162.195] (128.224.162.195) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Thu, 29 Aug 2019 01:08:58 -0700
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	<openembedded-core@lists.openembedded.org>
References: <20190828205016.2551-1-alex.kanavin@gmail.com>
From: Yi Zhao <yi.zhao@windriver.com>
Message-ID: <421232e8-39e7-7256-59c5-4a49b5307795@windriver.com>
Date: Thu, 29 Aug 2019 16:08:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190828205016.2551-1-alex.kanavin@gmail.com>
X-Originating-IP: [128.224.162.195]
Subject: Re: [PATCH] ltp: move from python 2.x to python 3.x
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
X-List-Received-Date: Thu, 29 Aug 2019 08:08:59 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Alexander,


On 8/29/19 4:50 AM, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>   ...thon3-everywhere-to-run-python-scrip.patch | 161 ++++++++++++++++++
>   meta/recipes-extended/ltp/ltp_20190517.bb     |   3 +-
>   2 files changed, 163 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-extended/ltp/ltp/0001-testcases-use-python3-everywhere-to-run-python-scrip.patch
>
> diff --git a/meta/recipes-extended/ltp/ltp/0001-testcases-use-python3-everywhere-to-run-python-scrip.patch b/meta/recipes-extended/ltp/ltp/0001-testcases-use-python3-everywhere-to-run-python-scrip.patch
> new file mode 100644
> index 00000000000..f4f87f38ab7
> --- /dev/null
> +++ b/meta/recipes-extended/ltp/ltp/0001-testcases-use-python3-everywhere-to-run-python-scrip.patch
> @@ -0,0 +1,161 @@
> +From 0463d793566772a606255957915f99d166d5740c Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Wed, 28 Aug 2019 18:30:23 +0200
> +Subject: [PATCH] testcases: use python3 everywhere to run python scripts
> +
> +The scripts themselves have #!/usr/bin/python3 in them,
> +so I trust they are already py3-compatible.
> +
> +Upstream-Status: Pending


I had sent a similar patch to upstream and it had been merged. You could 
backport it.

https://github.com/linux-test-project/ltp/commit/fc606bf2a9fdd356c593cc7b37217cae18100ffc


//Yi


> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + testcases/kernel/power_management/runpwtests05.sh  |  2 +-
> + .../power_management/runpwtests_exclusive01.sh     |  2 +-
> + .../power_management/runpwtests_exclusive02.sh     |  2 +-
> + .../power_management/runpwtests_exclusive03.sh     |  2 +-
> + .../power_management/runpwtests_exclusive04.sh     |  2 +-
> + .../power_management/runpwtests_exclusive05.sh     |  2 +-
> + testcases/network/nfsv4/acl/runtest                | 14 +++++++-------
> + testcases/realtime/func/pi-tests/run_auto.sh       |  6 +++---
> + 8 files changed, 16 insertions(+), 16 deletions(-)
> +
> +diff --git a/testcases/kernel/power_management/runpwtests05.sh b/testcases/kernel/power_management/runpwtests05.sh
> +index 8a7d0f6e0..43e234d01 100755
> +--- a/testcases/kernel/power_management/runpwtests05.sh
> ++++ b/testcases/kernel/power_management/runpwtests05.sh
> +@@ -35,7 +35,7 @@ else
> + 	max_sched_smt=1
> + fi
> +
> +-tst_test_cmds python
> ++tst_test_cmds python3
> +
> + if ! grep sched_debug -qw /proc/cmdline ; then
> + 	tst_brkm TCONF "Kernel cmdline parameter 'sched_debug' needed," \
> +diff --git a/testcases/kernel/power_management/runpwtests_exclusive01.sh b/testcases/kernel/power_management/runpwtests_exclusive01.sh
> +index ec78319e2..9fefcbf6e 100755
> +--- a/testcases/kernel/power_management/runpwtests_exclusive01.sh
> ++++ b/testcases/kernel/power_management/runpwtests_exclusive01.sh
> +@@ -35,7 +35,7 @@ else
> + 	max_sched_smt=1
> + fi
> +
> +-tst_test_cmds python
> ++tst_test_cmds python3
> +
> + hyper_threaded=$(is_hyper_threaded)
> + multi_socket=$(is_multi_socket)
> +diff --git a/testcases/kernel/power_management/runpwtests_exclusive02.sh b/testcases/kernel/power_management/runpwtests_exclusive02.sh
> +index e107fce35..2cd0ecb05 100755
> +--- a/testcases/kernel/power_management/runpwtests_exclusive02.sh
> ++++ b/testcases/kernel/power_management/runpwtests_exclusive02.sh
> +@@ -33,7 +33,7 @@ else
> + 	max_sched_smt=1
> + fi
> +
> +-tst_test_cmds python
> ++tst_test_cmds python3
> +
> + hyper_threaded=$(is_hyper_threaded)
> + multi_socket=$(is_multi_socket)
> +diff --git a/testcases/kernel/power_management/runpwtests_exclusive03.sh b/testcases/kernel/power_management/runpwtests_exclusive03.sh
> +index 490344bb3..ab3a5d11d 100755
> +--- a/testcases/kernel/power_management/runpwtests_exclusive03.sh
> ++++ b/testcases/kernel/power_management/runpwtests_exclusive03.sh
> +@@ -35,7 +35,7 @@ else
> + 	max_sched_smt=1
> + fi
> +
> +-tst_test_cmds python
> ++tst_test_cmds python3
> +
> + hyper_threaded=$(is_hyper_threaded)
> + multi_socket=$(is_multi_socket)
> +diff --git a/testcases/kernel/power_management/runpwtests_exclusive04.sh b/testcases/kernel/power_management/runpwtests_exclusive04.sh
> +index 978ca02ae..438ef603f 100755
> +--- a/testcases/kernel/power_management/runpwtests_exclusive04.sh
> ++++ b/testcases/kernel/power_management/runpwtests_exclusive04.sh
> +@@ -27,7 +27,7 @@ export TST_TOTAL=2
> + # Checking test environment
> + check_kervel_arch
> +
> +-tst_test_cmds python
> ++tst_test_cmds python3
> +
> + hyper_threaded=$(is_hyper_threaded)
> + multi_socket=$(is_multi_socket)
> +diff --git a/testcases/kernel/power_management/runpwtests_exclusive05.sh b/testcases/kernel/power_management/runpwtests_exclusive05.sh
> +index a0dad5834..3a9afdbf2 100755
> +--- a/testcases/kernel/power_management/runpwtests_exclusive05.sh
> ++++ b/testcases/kernel/power_management/runpwtests_exclusive05.sh
> +@@ -35,7 +35,7 @@ else
> + 	max_sched_smt=1
> + fi
> +
> +-tst_test_cmds python
> ++tst_test_cmds python3
> +
> + hyper_threaded=$(is_hyper_threaded)
> + multi_socket=$(is_multi_socket)
> +diff --git a/testcases/network/nfsv4/acl/runtest b/testcases/network/nfsv4/acl/runtest
> +index d2e1b4c49..a859e85bc 100755
> +--- a/testcases/network/nfsv4/acl/runtest
> ++++ b/testcases/network/nfsv4/acl/runtest
> +@@ -22,7 +22,7 @@ do
> + done
> +
> + #  creation of users on the remote machine (removed only at the end of the tests)
> +-rsh -n $REMOTEHOST python $PWD/create_users.py -u 50 -g 50
> ++rsh -n $REMOTEHOST python3 $PWD/create_users.py -u 50 -g 50
> +
> + echo "Starting ACL testing"
> +
> +@@ -51,19 +51,19 @@ echo "Basic tests finished"
> +
> + echo "LONG ACL TEST"
> + echo "creating necessary users and groups"
> +-python create_users.py -u 50 -g 50
> ++python3 create_users.py -u 50 -g 50
> + echo "creating necessary users and groups on the remote host"
> + mkdir $NFSMNTDIR/lacl-testdir
> +-python test_long_acl.py -l $MAXLENGTH -p $NFSMNTDIR/lacl-testdir
> ++python3 test_long_acl.py -l $MAXLENGTH -p $NFSMNTDIR/lacl-testdir
> + rm -rf $NFSMNTDIR/lacl-testdir
> + echo "Long ACL test OK with $MAXLENGTH entries"
> + echo "ACL STRESSING TEST"
> +-python setacl_stress.py -n 100 -u $USER_NB -g $GRP_NB -f $FILE_NB -p $NFSMNTDIR
> ++python3 setacl_stress.py -n 100 -u $USER_NB -g $GRP_NB -f $FILE_NB -p $NFSMNTDIR
> +
> + # remove local an remote users
> +-python cleanusers.py
> +-python cleangroups.py
> +-rsh -n $REMOTEHOST python $PWD/cleanusers.py
> ++python3 cleanusers.py
> ++python3 cleangroups.py
> ++rsh -n $REMOTEHOST python3 $PWD/cleanusers.py
> +
> + echo "Test OK"
> +
> +diff --git a/testcases/realtime/func/pi-tests/run_auto.sh b/testcases/realtime/func/pi-tests/run_auto.sh
> +index d13026049..277988568 100755
> +--- a/testcases/realtime/func/pi-tests/run_auto.sh
> ++++ b/testcases/realtime/func/pi-tests/run_auto.sh
> +@@ -15,15 +15,15 @@ $SCRIPTS_DIR/run_c_files.sh $profile testpi-0
> +
> + export LOG_FILE="$LOG_DIR/$LOG_FORMAT-testpi-1.log"
> + $SCRIPTS_DIR/run_c_files.sh $profile testpi-1
> +-PYTHONPATH=../../  python parse-testpi1.py $LOG_FILE 2>&1 | tee -a $LOG_FILE
> ++PYTHONPATH=../../  python3 parse-testpi1.py $LOG_FILE 2>&1 | tee -a $LOG_FILE
> +
> + export LOG_FILE="$LOG_DIR/$LOG_FORMAT-testpi-2.log"
> + $SCRIPTS_DIR/run_c_files.sh $profile testpi-2
> +-PYTHONPATH=../../  python parse-testpi2.py $LOG_FILE 2>&1 | tee -a $LOG_FILE
> ++PYTHONPATH=../../  python3 parse-testpi2.py $LOG_FILE 2>&1 | tee -a $LOG_FILE
> +
> + export LOG_FILE="$LOG_DIR/$LOG_FORMAT-testpi-4.log"
> + $SCRIPTS_DIR/run_c_files.sh $profile testpi-4
> +-PYTHONPATH=../../  python parse-testpi1.py $LOG_FILE 2>&1 | tee -a $LOG_FILE
> ++PYTHONPATH=../../  python3 parse-testpi1.py $LOG_FILE 2>&1 | tee -a $LOG_FILE
> +
> +
> + export LOG_FILE=""
> diff --git a/meta/recipes-extended/ltp/ltp_20190517.bb b/meta/recipes-extended/ltp/ltp_20190517.bb
> index b0e2f969c7a..3826ea8560d 100644
> --- a/meta/recipes-extended/ltp/ltp_20190517.bb
> +++ b/meta/recipes-extended/ltp/ltp_20190517.bb
> @@ -45,6 +45,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
>              file://0002-check-for-RES_USE_INET6-during-configure.patch \
>              file://0001-syscalls-tgkill03-wait-for-defunct-tid-to-get-detach.patch \
>              file://0001-ustat02-Fix-EFAULT-in-32bit-compatibility-mode.patch \
> +           file://0001-testcases-use-python3-everywhere-to-run-python-scrip.patch \
>              "
>   
>   S = "${WORKDIR}/git"
> @@ -96,7 +97,7 @@ RDEPENDS_${PN} = "\
>       libaio \
>       logrotate \
>       perl \
> -    python-core \
> +    python3-core \
>       procps \
>       quota \
>       unzip \

