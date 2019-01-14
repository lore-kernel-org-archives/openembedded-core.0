Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f171.google.com (mail-it1-f171.google.com
	[209.85.166.171])
	by mail.openembedded.org (Postfix) with ESMTP id 1467E7BD20
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 10:56:53 +0000 (UTC)
Received: by mail-it1-f171.google.com with SMTP id h193so11557418ita.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 02:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=SV4eb5hR2e6Qdsws0qYFUE6vnRQk58QiLbzvOKFquyc=;
	b=tFzKUEhxaRXJcqGtrBQo3zAa0fKzHrYnlqr4LS5R8YL9s4QkAP+5KDYY+8gq99iQAa
	wZJU+1AooLDve37bK+P0CxzO3i9M6YzaivyCLj/WZkUuxTfOock4Gljq5xkWPJztQRMW
	bOOHtZ0dHYHmljzaCYPRNMgRQD/TELfvNj6M9gz55YVLQ/dTrZReLdHtN9rUa14vX3UW
	8GwtmpvH4xDwaIsfklxGDlFeK5LmkzS6iJxxnP29D0se88ycPYhi/Dwfu5mJxmjXjUoq
	0pKhpYNyqSIAIscAlrQ/xqAsPt76Zx2dzuOcQs3PAAliOyow0ghRwYqfAPUqeZ2xgx8r
	Dtgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SV4eb5hR2e6Qdsws0qYFUE6vnRQk58QiLbzvOKFquyc=;
	b=NGHRciKD5nXDJ1mY2l88CRAwl72xNmUXae5Whkg8Ll97jjqu+lC0cVkmagpbJg5sxO
	bO1Kxhiy2r349nDSVJmqADvTvnYnP3mClZT9T3d1o08PrAxp9qjPf76JyAdj1Lf9+6cO
	R4TNHjEOZT5eF2CgFfpmxh1yxiuP7qYC8FQ2jNVnEwDINiPVOwJQ9YtzxghquWtFEiYw
	KazGZlLfBeGzUeG6jQKfdl6mR+MDMajK7wCu0jjvLnrzAM5BGfFdUajckdQvmg+VzG0t
	gTvnM/7MLecDo5l0yqOixC6haxrNyrrfWiRcqLaZw1TCjXGabRNCgFTgpK6gI5ICM0E2
	K7TQ==
X-Gm-Message-State: AJcUukfhJoNZDUeZ7RwVPQqGL/4d/p5XTTLUKhLyj21aPSqSyQ/uhsvt
	1uMg3LSoFKwl74+JXmmxIoJ21R+R7R+qtidZrf2lbA==
X-Google-Smtp-Source: ALg8bN66hib8UbJ9GySujkmi9DjvF8Bq1lZ2WOvQN0xv2qN6yVx4qd0Fll/x7JLN5nlCCoZJBDhYznYjcMISZNTcHtw=
X-Received: by 2002:a24:8e43:: with SMTP id h64mr7054413ite.26.1547463414008; 
	Mon, 14 Jan 2019 02:56:54 -0800 (PST)
MIME-Version: 1.0
References: <20190114074706.24648-1-zhe.he@windriver.com>
In-Reply-To: <20190114074706.24648-1-zhe.he@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 14 Jan 2019 10:56:41 +0000
Message-ID: <CAJTo0LZ348mu4z2JwzmG_L=jZzwBuubJEYquZfimTKt9XXZqGw@mail.gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ltp: Remove admin_tools test
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
X-List-Received-Date: Mon, 14 Jan 2019 10:56:54 -0000
Content-Type: multipart/alternative; boundary="000000000000186493057f68e71e"

--000000000000186493057f68e71e
Content-Type: text/plain; charset="UTF-8"

Missing your Signed-off-by and Upstream-Status in the patch.

Ross

On Mon, 14 Jan 2019 at 07:47, He Zhe <zhe.he@windriver.com> wrote:

> admin_tools test group has been removed from upstream. Backport to fix the
> following failures.
>
> at_deny01 1 TFAIL : ltpapicmd.c:188: At denyed user to execute test job
> at_allow01 1 TFAIL : ltpapicmd.c:188: At did not allow user to execute job
>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  .../ltp/ltp/0001-Remove-admin_tools-test.patch     | 3037
> ++++++++++++++++++++
>  meta/recipes-extended/ltp/ltp_20180926.bb          |    1 +
>  2 files changed, 3038 insertions(+)
>  create mode 100644
> meta/recipes-extended/ltp/ltp/0001-Remove-admin_tools-test.patch
>
> diff --git
> a/meta/recipes-extended/ltp/ltp/0001-Remove-admin_tools-test.patch
> b/meta/recipes-extended/ltp/ltp/0001-Remove-admin_tools-test.patch
> new file mode 100644
> index 0000000000..b740f22355
> --- /dev/null
> +++ b/meta/recipes-extended/ltp/ltp/0001-Remove-admin_tools-test.patch
> @@ -0,0 +1,3037 @@
> +From 0fc9b8624bea8acfdb408bf5ff4916b1453e3daa Mon Sep 17 00:00:00 2001
> +From: Petr Vorel <pvorel@suse.cz>
> +Date: Thu, 27 Sep 2018 16:57:20 +0200
> +Subject: [PATCH] Remove admin_tools test
> +
> +Removing cron, at, su related tests as they don't really fit into
> +"kernel testing", it'd be better to have them in some "LTP userspace"
> +project.
> +ACL are considered as "kernel tests", but it would be easier to write
> +something from scratch, thus remove them as well.
> +
> +Signed-off-by: Petr Vorel <pvorel@suse.cz>
> +Acked-by: Xiao Yang <yangx.jy@cn.fujitsu.com>
> +Acked-by: Jan Stancek <jstancek@redhat.com>
> +Acked-by: Cyril Hrubis <chrubis@suse.cz
> +---
> + runtest/admin_tools                             |   9 -
> + runtest/commands                                |   1 -
> + scenario_groups/default                         |   1 -
> + testcases/commands/.gitignore                   |   1 -
> + testcases/commands/at/Makefile                  |  31 --
> + testcases/commands/at/at_allow01                | 188 ---------
> + testcases/commands/at/at_deny01                 | 195 ----------
> + testcases/commands/cron/00_Descriptions.txt     |   4 -
> + testcases/commands/cron/Makefile                |  29 --
> + testcases/commands/cron/README.tests            |  25 --
> + testcases/commands/cron/cron02                  |  80 ----
> + testcases/commands/cron/cron03                  |  83 ----
> + testcases/commands/cron/cron_allow01            | 202 ----------
> + testcases/commands/cron/cron_deny01             | 192 ----------
> + testcases/commands/cron/cron_dirs_check.c       |  44 ---
> + testcases/commands/cron/cron_dirs_checks01      |  46 ---
> + testcases/commands/cron/cron_illegal_cron_lines |  39 --
> + testcases/commands/cron/cron_neg_tests.sh       | 141 -------
> + testcases/commands/cron/cron_pos_tests.sh       | 118 ------
> + testcases/commands/cron/cron_tests.sh           | 276 --------------
> + testcases/commands/su/Makefile                  |  31 --
> + testcases/commands/su/su01                      | 181 ---------
> + testcases/commands/su/su01_s1                   | 486
> ------------------------
> + testcases/commands/su/su_set_passwd             |  14 -
> + testcases/kernel/fs/acls/.gitignore             |   2 -
> + testcases/kernel/fs/acls/Makefile               |  40 --
> + testcases/kernel/fs/acls/acl_file_test.c        |  73 ----
> + testcases/kernel/fs/acls/acl_link_test.c        |  56 ---
> + testcases/kernel/fs/acls/acl_test01             | 186 ---------
> + 29 files changed, 2774 deletions(-)
> + delete mode 100644 runtest/admin_tools
> + delete mode 100644 testcases/commands/at/Makefile
> + delete mode 100755 testcases/commands/at/at_allow01
> + delete mode 100755 testcases/commands/at/at_deny01
> + delete mode 100644 testcases/commands/cron/00_Descriptions.txt
> + delete mode 100644 testcases/commands/cron/Makefile
> + delete mode 100644 testcases/commands/cron/README.tests
> + delete mode 100755 testcases/commands/cron/cron02
> + delete mode 100755 testcases/commands/cron/cron03
> + delete mode 100755 testcases/commands/cron/cron_allow01
> + delete mode 100755 testcases/commands/cron/cron_deny01
> + delete mode 100644 testcases/commands/cron/cron_dirs_check.c
> + delete mode 100755 testcases/commands/cron/cron_dirs_checks01
> + delete mode 100644 testcases/commands/cron/cron_illegal_cron_lines
> + delete mode 100755 testcases/commands/cron/cron_neg_tests.sh
> + delete mode 100755 testcases/commands/cron/cron_pos_tests.sh
> + delete mode 100644 testcases/commands/cron/cron_tests.sh
> + delete mode 100644 testcases/commands/su/Makefile
> + delete mode 100755 testcases/commands/su/su01
> + delete mode 100755 testcases/commands/su/su01_s1
> + delete mode 100755 testcases/commands/su/su_set_passwd
> + delete mode 100644 testcases/kernel/fs/acls/.gitignore
> + delete mode 100644 testcases/kernel/fs/acls/Makefile
> + delete mode 100644 testcases/kernel/fs/acls/acl_file_test.c
> + delete mode 100644 testcases/kernel/fs/acls/acl_link_test.c
> + delete mode 100755 testcases/kernel/fs/acls/acl_test01
> +
> +diff --git a/runtest/admin_tools b/runtest/admin_tools
> +deleted file mode 100644
> +index 0a46468c8..000000000
> +--- a/runtest/admin_tools
> ++++ /dev/null
> +@@ -1,9 +0,0 @@
> +-su01 export TCbin=$LTPROOT/testcases/bin;su01
> +-#cron01 cron01
> +-cron02 cron02
> +-cron_deny01 cron_deny01
> +-cron_allow01 cron_allow01
> +-cron_dirs_checks01 cron_dirs_checks01
> +-at_deny01 at_deny01
> +-at_allow01 at_allow01
> +-acl_test01 acl_test01
> +diff --git a/runtest/commands b/runtest/commands
> +index ee7e9f440..462633017 100644
> +--- a/runtest/commands
> ++++ b/runtest/commands
> +@@ -5,7 +5,6 @@ ldd01 ldd01
> + nm01 nm01
> + file01 file01.sh
> + tar01  tar_tests.sh
> +-cron cron_tests.sh
> + logrotate export TCdat=$LTPROOT/testcases/bin; logrotate_tests.sh
> + cpio01 cpio_tests.sh
> + unzip01 unzip01.sh
> +diff --git a/scenario_groups/default b/scenario_groups/default
> +index 5658a618b..b1739b77e 100644
> +--- a/scenario_groups/default
> ++++ b/scenario_groups/default
> +@@ -17,7 +17,6 @@ filecaps
> + cap_bounds
> + fcntl-locktests
> + connectors
> +-admin_tools
> + timers
> + power_management_tests
> + numa
> +diff --git a/testcases/commands/.gitignore b/testcases/commands/.gitignore
> +index 9aa1caf6c..0ed343881 100644
> +--- a/testcases/commands/.gitignore
> ++++ b/testcases/commands/.gitignore
> +@@ -1,5 +1,4 @@
> + /ldd/datafiles/lddfile.out
> + /ldd/datafiles/*.obj.so
> +-/cron/cron_dirs_check
> + /eject/eject_check_tray
> + /insmod/ltp_insmod01.ko
> +diff --git a/testcases/commands/at/Makefile
> b/testcases/commands/at/Makefile
> +deleted file mode 100644
> +index ca3fb04fe..000000000
> +--- a/testcases/commands/at/Makefile
> ++++ /dev/null
> +@@ -1,31 +0,0 @@
> +-#
> +-#    commands/at testcases Makefile.
> +-#
> +-#    Copyright (C) 2009, Cisco Systems Inc.
> +-#
> +-#    This program is free software; you can redistribute it and/or modify
> +-#    it under the terms of the GNU General Public License as published by
> +-#    the Free Software Foundation; either version 2 of the License, or
> +-#    (at your option) any later version.
> +-#
> +-#    This program is distributed in the hope that it will be useful,
> +-#    but WITHOUT ANY WARRANTY; without even the implied warranty of
> +-#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +-#    GNU General Public License for more details.
> +-#
> +-#    You should have received a copy of the GNU General Public License
> along
> +-#    with this program; if not, write to the Free Software Foundation,
> Inc.,
> +-#    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> +-#
> +-# Ngie Cooper, July 2009
> +-#
> +-
> +-top_srcdir            ?= ../../..
> +-
> +-include $(top_srcdir)/include/mk/env_pre.mk
> +-
> +-INSTALL_TARGETS               := at_allow01 at_deny01
> +-
> +-MAKE_TARGETS          :=
> +-
> +-include $(top_srcdir)/include/mk/generic_leaf_target.mk
> +diff --git a/testcases/commands/at/at_allow01
> b/testcases/commands/at/at_allow01
> +deleted file mode 100755
> +index c0e9335cf..000000000
> +--- a/testcases/commands/at/at_allow01
> ++++ /dev/null
> +@@ -1,188 +0,0 @@
> +-#!/bin/sh -u
> +-#
> +-#   Copyright (C) 2008 CAI Qian <caiqian@cclom.cn>
> +-#   Copyright (c) International Business Machines  Corp., 2003
> +-#
> +-#   This program is free software; you can redistribute it and/or modify
> +-#   it under the terms of the GNU General Public License as published by
> +-#   the Free Software Foundation; either version 2 of the License, or
> +-#   (at your option) any later version.
> +-#
> +-#   This program is distributed in the hope that it will be useful, but
> +-#   WITHOUT ANY WARRANTY; without even the implied warranty of
> +-#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> +-#   General Public License for more details.
> +-#
> +-#   You should have received a copy of the GNU General Public License
> +-#   along with this program; if not, write to the Free Software
> +-#   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
> +-#   USA
> +-#
> +-#   FILE: /etc/at.allow
> +-#
> +-#   PURPOSE: Test that /etc/at.allow , only allows those in the file to
> +-#   run cron jobs.
> +-#
> +-#   HISTORY:
> +-#                04/03 Jerone Young (jyoung5@us.ibm.com)
> +-#
> +-
> +-export TCID=at_allow01
> +-export TST_TOTAL=1
> +-export TST_COUNT=1
> +-TMP=${TMP:=/tmp}
> +-allow="/etc/at.allow"
> +-test_user1="test_user_1"
> +-test_user2="test_user_2"
> +-test_user1_home="/home/${test_user1}"
> +-test_user2_home="/home/${test_user2}"
> +-tmpfile="$TMP/at_allow_test"
> +-
> +-if [ "$(id -ru)" = 0 ]; then
> +-      . cmdlib.sh
> +-fi
> +-
> +-#-----------------------------------------------------------------------
> +-# FUNCTION:  do_setup
> +-#-----------------------------------------------------------------------
> +-
> +-do_setup()
> +-{
> +-      # Move any files that may get in the way.
> +-      rm "${tmpfile}" >/dev/null 2>&1
> +-      mv "${allow}" "${allow}.old" >/dev/null 2>&1
> +-
> +-      # Remove users for clean enviroment.
> +-      rm -rf "${test_user1_home}" "${test_user2_home}"
> +-      userdel -r "${test_user1}" >/dev/null 2>&1
> +-      userdel -r "${test_user2}" >/dev/null 2>&1
> +-
> +-      # Create the 1st user.
> +-      if ! useradd -g users -d "${test_user1_home}" -m "${test_user1}";
> then
> +-              echo "Could not add test user ${test_user1} to system."
> +-              exit 1
> +-      fi
> +-
> +-      # Create the 2nd user.
> +-      if ! useradd -g users -d "${test_user2_home}" -m "${test_user2}";
> then
> +-              echo "Could not add test user ${test_user2} to system."
> +-              exit 1
> +-      fi
> +-
> +-      # This is the workaround for a potential bug.
> +-      # [Bug 468337] At Refuse to Work with Non-login Shell
> +-      # https://bugzilla.redhat.com/show_bug.cgi?id=468337
> +-      # As we are running in non-login shell now, we cannot run the
> script
> +-      # by simply given it a relative path. Therefore, we copy it to test
> +-      # users' home directories, and run it from there.
> +-      cp "$0" "${test_user1_home}/." &&
> +-      cp "$0" "${test_user2_home}/." &&
> +-      echo "export LTPROOT='$LTPROOT'" >
> "${test_user1_home}/cached_ltproot" &&
> +-      echo "export LTPROOT='$LTPROOT'" >
> "${test_user2_home}/cached_ltproot"
> +-      if [ $? -ne 0 ]; then
> +-              tst_resm TBROK "Couldn't copy over req'd files for test
> users"
> +-              exit 1
> +-      fi
> +-
> +-      restart_daemon atd
> +-}
> +-
> +-#-----------------------------------------------------------------------
> +-# FUNCTION:  do_cleanup
> +-#-----------------------------------------------------------------------
> +-do_cleanup()
> +-{
> +-      # We forcefully remove those files anyway. Otherwise userdel may
> +-      # give us bad warnings.
> +-      rm -rf "${test_user1_home}" "${test_user2_home}"
> +-      userdel -r "${test_user1}" >/dev/null 2>&1
> +-      userdel -r "${test_user2}" >/dev/null 2>&1
> +-      rm "${allow}"
> +-      mv "${allow}.old" "${allow}" >/dev/null 2>&1
> +-      rm "${tmpfile}" >/dev/null 2>&1
> +-}
> +-
> +-#-----------------------------------------------------------------------
> +-# FUNCTION:  run_test
> +-#-----------------------------------------------------------------------
> +-run_test()
> +-{
> +-      if [ $(whoami) = "${test_user1}" ]; then
> +-              . "${test_user1_home}/cached_ltproot" || exit 1
> +-              export PATH="$PATH:$LTPROOT/testcases/bin"
> +-
> +-              echo "TEST: $allow should allow only those who in the file
> to run jobs."
> +-              echo "(1) TEST THAT PERSON IN ${allow} IS ABLE TO RUN JOB."
> +-              echo "echo 'TEST JOB RAN' >>\"${tmpfile}\" 2>&1" |
> +-              if ! at -m now + 1 minutes ; then
> +-                      echo "Error while adding job using at for user
> ${test_user1}."
> +-                      exit 1
> +-              fi
> +-              echo " Sleeping for 75 seconds...."
> +-              sleep 75
> +-
> +-              exit_code=1
> +-              test -e "${tmpfile}" && exit_code=0
> +-              if [ ${exit_code} -eq 1 ]; then
> +-                      tst_resm TFAIL "At did not allow user to execute
> job"
> +-              else
> +-                      tst_resm TPASS "At allowed user to execute test
> job"
> +-              fi
> +-
> +-              rm -f "${tmpfile}" >/dev/null 2>&1
> +-              exit ${exit_code}
> +-
> +-      elif [ $(whoami) = "${test_user2}" ]; then
> +-
> +-              . "${test_user2_home}/cached_ltproot" || exit 1
> +-              export PATH="$PATH:$LTPROOT/testcases/bin"
> +-
> +-              echo "(2) TEST PERSON THAT IS NOT IN ${allow} IS NOT ABLE
> TO RUN JOB."
> +-
> +-              echo "echo 'TEST JOB RAN' >>\"${tmpfile}\" 2>&1" |
> +-              if ! at -m now + 1 minutes; then
> +-                      echo "Expected error while adding job user at for
> user ${test_user2}"
> +-              fi
> +-              echo "Sleeping for 75 seconds...."
> +-              sleep 75
> +-
> +-              exit_code=1
> +-              test -e "${tmpfile}" || exit_code=0
> +-              if [ ${exit_code} -eq 1 ]; then
> +-                      tst_resm TFAIL "At allowed user to execute test
> job"
> +-              else
> +-                      tst_resm TPASS "At did not allow user to execute
> job"
> +-              fi
> +-
> +-              rm -f "${tmpfile}" >/dev/null 2>&1
> +-              exit ${exit_code}
> +-
> +-      fi
> +-}
> +-
> +-#-----------------------------------------------------------------------
> +-# FUNCTION: main
> +-#-----------------------------------------------------------------------
> +-if ! type at > /dev/null; then
> +-      tst_resm TCONF "at command not found on system"
> +-elif [ "$(id -ru)" = 0 ]; then
> +-      if do_setup; then
> +-
> +-              if ! echo "${test_user1}" >"${allow}"; then
> +-                      exit_code=1
> +-              elif ! su "${test_user1}" -lc
> "${test_user1_home}/${0##*/}"; then
> +-                      exit_code=1
> +-              elif ! su "${test_user2}" -lc
> "${test_user2_home}/${0##*/}"; then
> +-                      exit_code=1
> +-              else
> +-                      exit_code=0
> +-              fi
> +-              do_cleanup
> +-      else
> +-              exit_code=1
> +-      fi
> +-      exit ${exit_code}
> +-else
> +-      run_test
> +-      exit 0
> +-fi
> +diff --git a/testcases/commands/at/at_deny01
> b/testcases/commands/at/at_deny01
> +deleted file mode 100755
> +index 176da14f6..000000000
> +--- a/testcases/commands/at/at_deny01
> ++++ /dev/null
> +@@ -1,195 +0,0 @@
> +-#!/bin/sh -u
> +-#
> +-#   Copyright (C) 2008 CAI Qian <caiqian@cclom.cn>
> +-#   Copyright (c) International Business Machines  Corp., 2003
> +-#
> +-#   This program is free software;  you can redistribute it and/or modify
> +-#   it under the terms of the GNU General Public License as published by
> +-#   the Free Software Foundation; either version 2 of the License, or
> +-#   (at your option) any later version.
> +-#
> +-#   This program is distributed in the hope that it will be useful,
> +-#   but WITHOUT ANY WARRANTY;  without even the implied warranty of
> +-#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
> +-#   the GNU General Public License for more details.
> +-#
> +-#   You should have received a copy of the GNU General Public License
> +-#   along with this program.  If not, see <http://www.gnu.org/licenses/
> >.
> +-#
> +-#   FILE: /etc/at.deny
> +-#
> +-#   PURPOSE: Test that /etc/at.deny , does not allow those in the file
> +-#   to run cron jobs.
> +-#
> +-#   HISTORY:
> +-#             04/03 Jerone Young (jyoung5@us.ibm.com)
> +-#
> +-
> +-export TCID=at_deny01
> +-export TST_TOTAL=1
> +-export TST_COUNT=1
> +-TMP=${TMP:=/tmp}
> +-deny="/etc/at.deny"
> +-test_user1="test_user_1"
> +-test_user2="test_user_2"
> +-test_user1_home="/home/${test_user1}"
> +-test_user2_home="/home/${test_user2}"
> +-tmpfile="$TMP/at_deny_test"
> +-
> +-if [ "$(id -ru)" = 0 ]; then
> +-      . cmdlib.sh
> +-fi
> +-
> +-#-----------------------------------------------------------------------
> +-# FUNCTION:  do_setup
> +-#-----------------------------------------------------------------------
> +-
> +-do_setup()
> +-{
> +-      # Move any files that may get in the way.
> +-      rm "${tmpfile}" >/dev/null 2>&1
> +-      mv "${deny}" "${deny}.old" >/dev/null 2>&1
> +-
> +-      # if /etc/at.allow is there, /etc/at.deny will be ignored. So, we
> +-      # need to remove it first.
> +-      if [ -f "/etc/at.allow" ]; then
> +-              mv /etc/at.allow /etc/at.allow.old
> +-      fi
> +-
> +-      # Remove users for clean enviroment.
> +-      rm -rf "${test_user1_home}" "${test_user2_home}"
> +-      userdel -r "${test_user1}" >/dev/null 2>&1
> +-      userdel -r "${test_user2}" >/dev/null 2>&1
> +-
> +-      # Create the 1st user.
> +-      if ! useradd -g users -d "${test_user1_home}" -m "${test_user1}";
> then
> +-              echo "Could not add test user ${test_user1} to system."
> +-              exit 1
> +-      fi
> +-
> +-      # Create the 2nd user.
> +-      if ! useradd -g users -d "${test_user2_home}" -m "${test_user2}";
> then
> +-              echo "Could not add test user ${test_user2} to system."
> +-              exit 1
> +-      fi
> +-
> +-      # This is the workaround for a potential bug.
> +-      # [Bug 468337] At Refuse to Work with Non-login Shell
> +-      # https://bugzilla.redhat.com/show_bug.cgi?id=468337
> +-      # As we are running in non-login shell now, we cannot run the
> script
> +-      # by simply given it a relative path. Therefore, we copy it to test
> +-      # users' home directories, and run it from there.
> +-      cp "$0" "${test_user1_home}/." &&
> +-      cp "$0" "${test_user2_home}/." &&
> +-      echo "export LTPROOT='$LTPROOT'" >
> "${test_user1_home}/cached_ltproot" &&
> +-      echo "export LTPROOT='$LTPROOT'" >
> "${test_user2_home}/cached_ltproot"
> +-      if [ $? -ne 0 ]; then
> +-              tst_resm TBROK "Couldn't copy over req'd files for test
> users"
> +-              exit 1
> +-      fi
> +-
> +-      restart_daemon atd
> +-}
> +-
> +-#-----------------------------------------------------------------------
> +-# FUNCTION:  do_cleanup
> +-#-----------------------------------------------------------------------
> +-do_cleanup()
> +-{
> +-      # We forcefully remove those files anyway. Otherwise userdel may
> +-      # give us bad warnings.
> +-      rm -rf "${test_user1_home}" "${test_user2_home}"
> +-      userdel -r "${test_user1}" >/dev/null 2>&1
> +-      userdel -r "${test_user2}" >/dev/null 2>&1
> +-      rm "${deny}"
> +-      mv "${deny}.old" "${deny}" >/dev/null 2>&1
> +-      rm "${tmpfile}" >/dev/null 2>&1
> +-
> +-      if [ -f /etc/at.allow.old ]; then
> +-              mv /etc/at.allow.old /etc/at.allow
> +-      fi
> +-}
> +-
> +-#-----------------------------------------------------------------------
> +-# FUNCTION:  run_test
> +-#-----------------------------------------------------------------------
> +-run_test()
> +-{
> +-      if [ $(whoami) = "${test_user1}" ]; then
> +-              . "${test_user1_home}/cached_ltproot" || exit 1
> +-              export PATH="$PATH:$LTPROOT/testcases/bin"
> +-
> +-              echo "TEST: ${deny} should deny only those who are not in
> the file to run jobs."
> +-              echo "(1) TEST THAT PERSON NOT IN ${deny} IS ABLE TO RUN
> JOB."
> +-              echo "echo 'TEST JOB RAN' >>\"${tmpfile}\" 2>&1" |
> +-              if ! at -m now + 1 minutes; then
> +-                      echo "Error while adding job using at for user
> ${test_user1}."
> +-                      exit 1
> +-              fi
> +-              echo " Sleeping for 75 seconds...."
> +-              sleep 75
> +-
> +-              exit_code=1
> +-              test -e "${tmpfile}" && exit_code=0
> +-              if [ ${exit_code} -eq 1 ]; then
> +-                      tst_resm TFAIL "At denyed user to execute test job"
> +-              else
> +-                      tst_resm TPASS "At did not deny user to execute
> job"
> +-              fi
> +-
> +-              rm -f "${tmpfile}" >/dev/null 2>&1
> +-              exit ${exit_code}
> +-
> +-      elif [ $(whoami) = "${test_user2}" ]; then
> +-
> +-              . "${test_user2_home}/cached_ltproot" || exit 1
> +-              export PATH="$PATH:$LTPROOT/testcases/bin"
> +-
> +-              echo "(2) TEST THAT PERSON IN ${deny} IS NOT ABLE TO RUN
> JOB."
> +-
> +-              echo "echo 'TEST JOB RAN' >>\"${tmpfile}\" 2>&1" |
> +-              if ! at -m now + 1 minutes; then
> +-                      echo "Expected error while adding job user at for
> user ${test_user2}"
> +-              fi
> +-              echo "Sleeping for 75 seconds...."
> +-              sleep 75
> +-
> +-              exit_code=1
> +-              test -e "${tmpfile}" || exit_code=0
> +-              if [ ${exit_code} -eq 1 ]; then
> +-                      echo "At did not deny user to execute job, TEST
> FAILED."
> +-              else
> +-                      echo "At denyed user to execute test job, TEST
> PASSED."
> +-              fi
> +-
> +-              rm -f "${tmpfile}" >/dev/null 2>&1
> +-              exit ${exit_code}
> +-
> +-      fi
> +-}
> +-
> +-#-----------------------------------------------------------------------
> +-# FUNCTION: main
> +-#-----------------------------------------------------------------------
> +-if ! type at > /dev/null; then
> +-      tst_resm TCONF "at command not found on system"
> +-elif [ "$(id -ru)" = 0 ]; then
> +-      if do_setup ; then
> +-              if ! echo "${test_user2}" >"${deny}"; then
> +-                      exit_code=1
> +-              elif ! su "${test_user1}" -lc
> "${test_user1_home}/${0##*/}"; then
> +-                      exit_code=1
> +-              elif ! su "${test_user2}" -lc
> "${test_user2_home}/${0##*/}"; then
> +-                      exit_code=1
> +-              else
> +-                      exit_code=0
> +-              fi
> +-              do_cleanup
> +-      else
> +-              exit_code=1
> +-      fi
> +-      exit ${exit_code}
> +-else
> +-      run_test
> +-      exit 0
> +-fi
> +diff --git a/testcases/commands/cron/00_Descriptions.txt
> b/testcases/commands/cron/00_Descriptions.txt
> +deleted file mode 100644
> +index 9566e0aaa..000000000
> +--- a/testcases/commands/cron/00_Descriptions.txt
> ++++ /dev/null
> +@@ -1,4 +0,0 @@
> +-cron01
> +-      Test that crontab <filename> installs the cron-job-file and cron
> will
> +-      schedule the job correctly.
> +-
> +diff --git a/testcases/commands/cron/Makefile
> b/testcases/commands/cron/Makefile
> +deleted file mode 100644
> +index 4969ec7bb..000000000
> +--- a/testcases/commands/cron/Makefile
> ++++ /dev/null
> +@@ -1,29 +0,0 @@
> +-#
> +-#    commands/cron testcases Makefile.
> +-#
> +-#    Copyright (C) 2009, Cisco Systems Inc.
> +-#
> +-#    This program is free software; you can redistribute it and/or modify
> +-#    it under the terms of the GNU General Public License as published by
> +-#    the Free Software Foundation; either version 2 of the License, or
> +-#    (at your option) any later version.
> +-#
> +-#    This program is distributed in the hope that it will be useful,
> +-#    but WITHOUT ANY WARRANTY; without even the implied warranty of
> +-#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +-#    GNU General Public License for more details.
> +-#
> +-#    You should have received a copy of the GNU General Public License
> along
> +-#    with this program; if not, write to the Free Software Foundation,
> Inc.,
> +-#    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> +-#
> +-# Ngie Cooper, July 2009
> +-#
> +-
> +-top_srcdir            ?= ../../..
> +-
> +-include $(top_srcdir)/include/mk/env_pre.mk
> +-
> +-INSTALL_TARGETS               := cron0[23] cron_illegal_cron_lines
> cron_allow01 cron_deny01 cron_dirs_checks01 *.sh
> +-
> +-include $(top_srcdir)/include/mk/generic_leaf_target.mk
> +diff --git a/testcases/commands/cron/README.tests
> b/testcases/commands/cron/README.tests
> +deleted file mode 100644
> +index 0d5db7113..000000000
> +--- a/testcases/commands/cron/README.tests
> ++++ /dev/null
> +@@ -1,25 +0,0 @@
> +-This directory contains two scripts and one data file to test cron. Both
> +-shouldn't be run as root but they warn for themselves. If a username is
> +-given as parameter they run as this user.
> +-
> +-Both scripts save the current crontab and restore it after finishing.
> +-
> +-* Positive tests
> +-
> +-      cron_pos_tests.sh [username]
> +-
> +-      - add new job
> +-      - check correct execution of job
> +-      - delete job
> +-
> +-* Negative tests
> +-
> +-      cron_neg_tests.sh [username]
> +-
> +-      - try to edit the crontab of root
> +-      - try to set illegal or nondefined execution times
> +-        Here the script uses file illegal_cron_lines which contains two
> +-        fields per line: the cron line to be tested (without script
> name),
> +-        and the description of this test. The description is written to
> +-        stdout during execution of the test.
> +-      - try to do things you aren't allowed as non-root (cron runs as
> root)
> +diff --git a/testcases/commands/cron/cron02
> b/testcases/commands/cron/cron02
> +deleted file mode 100755
> +index 16b425de3..000000000
> +--- a/testcases/commands/cron/cron02
> ++++ /dev/null
> +@@ -1,80 +0,0 @@
> +-#!/bin/sh
> +-#*********************************************************************
> +-#   Copyright (c) International Business Machines  Corp., 2000
> +-#
> +-#   This program is free software;  you can redistribute it and/or modify
> +-#   it under the terms of the GNU General Public License as published by
> +-#   the Free Software Foundation; either version 2 of the License, or
> +-#   (at your option) any later version.
> +-#
> +-#   This program is distributed in the hope that it will be useful,
> +-#   but WITHOUT ANY WARRANTY;  without even the implied warranty of
> +-#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
> +-#   the GNU General Public License for more details.
> +-#
> +-#   You should have received a copy of the GNU General Public License
> +-#   along with this program;  if not, write to the Free Software
> +-#   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
> 02110-1301 USA
> +-#
> +-#  FILE   : cron02
> +-#
> +-#  PURPOSE: Test a postive cron job
> +-#                     - add new job
> +-#             - check correct execution of job
> +-#             - delete job
> +-#
> +-#  HISTORY:
> +-#             SUSE
> +-#
> +-
> +-TEST_USER="c01_user"
> +-TEST_USER_GROUP="users"
> +-TEST_USER_HOMEDIR="/home/$TEST_USER"
> +-
> +-#-----------------------------------------------------------------------
> +-# FUNCTION:  do_setup
> +-#-----------------------------------------------------------------------
> +-
> +-do_setup(){
> +-      #erase any data from potential defunt cron test
> +-      rm -rf /tmp/crontest > /dev/null 2>&1
> +-
> +-    #erase user if he may exist , so we can have a clean env
> +-        rm -rf /home/$TEST_USER
> +-        userdel $TEST_USER
> +-      sleep 1
> +-
> +-        useradd -m -g $TEST_USER_GROUP $TEST_USER
> +-        if [ $? != 0 ]
> +-        then {
> +-                echo "Could not add test user $TEST_USER to system
> $RHOST."
> +-                exit 1
> +-        }
> +-        fi
> +-
> +-      if [ -n "$CROND_DAEMON" ]; then
> +-              restart_daemon $CROND_DAEMON
> +-      else
> +-              tst_brkm TBROK "Couldn't find crond or cron"
> +-      fi
> +-}
> +-
> +-#-----------------------------------------------------------------------
> +-# FUNCTION:  do_cleanup
> +-#-----------------------------------------------------------------------
> +-
> +-do_cleanup(){
> +-        rm -rf /home/$TEST_USER
> +-        userdel $TEST_USER
> +-}
> +-
> +-#-----------------------------------------------------------------------
> +-# FUNCTION:  MAIN
> +-#-----------------------------------------------------------------------
> +-. cmdlib.sh
> +-
> +-do_setup
> +-cron_pos_tests.sh $TEST_USER
> +-EXIT_CODE=$?
> +-do_cleanup
> +-exit $EXIT_CODE
> +diff --git a/testcases/commands/cron/cron03
> b/testcases/commands/cron/cron03
> +deleted file mode 100755
> +index 7ba7bf40c..000000000
> +--- a/testcases/commands/cron/cron03
> ++++ /dev/null
> +@@ -1,83 +0,0 @@
> +-#!/bin/sh
> +-#*********************************************************************
> +-#   Copyright (c) International Business Machines  Corp., 2000
> +-#
> +-#   This program is free software;  you can redistribute it and/or modify
> +-#   it under the terms of the GNU General Public License as published by
> +-#   the Free Software Foundation; either version 2 of the License, or
> +-#   (at your option) any later version.
> +-#
> +-#   This program is distributed in the hope that it will be useful,
> +-#   but WITHOUT ANY WARRANTY;  without even the implied warranty of
> +-#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
> +-#   the GNU General Public License for more details.
> +-#
> +-#   You should have received a copy of the GNU General Public License
> +-#   along with this program;  if not, write to the Free Software
> +-#   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
> 02110-1301 USA
> +-#
> +-#  FILE   : cron
> +-#
> +-#  PURPOSE: Test a bad (negative) cron job
> +-#                     - try to edit the crontab of root
> +-#             - try to set illegal or nondefined execution times
> +-#                       Here the script uses file illegal_cron_lines
> which contains two
> +-#                       fields per line: the cron line to be tested
> (without script name),
> +-#                       and the description of this test. The
> description is written to
> +-#                       stdout during execution of the test.
> +-#             - try to do things you aren't allowed as non-root (cron
> runs as root)
> +-
> +-#
> +-#  HISTORY:
> +-#             SUSE
> +-#
> +-
> +-
> +-TEST_USER="c02_user"
> +-TEST_USER_GROUP="users"
> +-TEST_USER_HOMEDIR="/home/$TEST_USER"
> +-
> +-#-----------------------------------------------------------------------
> +-# FUNCTION:  do_setup
> +-#-----------------------------------------------------------------------
> +-
> +-do_setup(){
> +-
> +-    #erase user if he may exist , so we can have a clean env
> +-        rm -rf /home/$TEST_USER
> +-        userdel $TEST_USER
> +-      sleep 1
> +-
> +-        useradd -m -g $TEST_USER_GROUP $TEST_USER
> +-        if [ $? != 0 ]
> +-        then {
> +-                echo "Could not add test user $TEST_USER to system
> $RHOST."
> +-                exit 1
> +-        }
> +-        fi
> +-        # restart cron daemon
> +-      # Red Hat uses crond, SuSE/Other uses cron.
> +-      if [ -f /etc/init.d/crond ]; then
> +-              /etc/init.d/crond restart
> +-      else
> +-              /etc/init.d/cron restart
> +-      fi
> +-}
> +-
> +-#-----------------------------------------------------------------------
> +-# FUNCTION:  do_cleanup
> +-#-----------------------------------------------------------------------
> +-
> +-do_cleanup(){
> +-        rm -rf /home/$TEST_USER
> +-        userdel $TEST_USER
> +-}
> +-
> +-#-----------------------------------------------------------------------
> +-# FUNCTION:  MAIN
> +-#-----------------------------------------------------------------------
> +-do_setup
> +-cron_neg_tests.sh $TEST_USER
> +-EXIT_CODE=$?
> +-do_cleanup
> +-exit $EXIT_CODE
> +diff --git a/testcases/commands/cron/cron_allow01
> b/testcases/commands/cron/cron_allow01
> +deleted file mode 100755
> +index 9a5e4d240..000000000
> +--- a/testcases/commands/cron/cron_allow01
> ++++ /dev/null
> +@@ -1,202 +0,0 @@
> +-#!/bin/bash
> +-#
> +-#   Copyright (c) International Business Machines  Corp., 2003
> +-#
> +-#   This program is free software;  you can redistribute it and/or modify
> +-#   it under the terms of the GNU General Public License as published by
> +-#   the Free Software Foundation; either version 2 of the License, or
> +-#   (at your option) any later version.
> +-#
> +-#   This program is distributed in the hope that it will be useful,
> +-#   but WITHOUT ANY WARRANTY;  without even the implied warranty of
> +-#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
> +-#   the GNU General Public License for more details.
> +-#
> +-#   You should have received a copy of the GNU General Public License
> +-#   along with this program;  if not, write to the Free Software
> +-#   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
> 02110-1301 USA
> +-#
> +-#     FILE: /var/spool/cron/allow
> +-#
> +-#     PURPOSE: Test that /var/spool/cron/allow , only allows those in
> the file to run cron jobs.
> +-#
> +-#     HISTORY:
> +-#             04/03 Jerone Young (jyoung5@us.ibm.com)
> +-#
> +-
> +-echo "This script contains bashism that needs to be fixed!"
> +-
> +-iam=`whoami`
> +-
> +-tvar=${MACHTYPE%-*}
> +-tvar=${tvar#*-}
> +-
> +-if [ "$tvar" = "redhat" -o "$tvar" = "redhat-linux" ]
> +-then
> +-CRON_ALLOW="/etc/cron.allow"
> +-else
> +-CRON_ALLOW="/var/spool/cron/allow"
> +-fi
> +-
> +-TEST_USER1="ca_user1"
> +-TEST_USER1_HOME="/home/$TEST_USER1"
> +-TEST_USER2="ca_user2"
> +-TEST_USER2_HOME="/home/$TEST_USER2"
> +-
> +-#-----------------------------------------------------------------------
> +-# FUNCTION:  do_setup
> +-#-----------------------------------------------------------------------
> +-
> +-do_setup() {
> +-      #move any files that may get in the way
> +-      rm /tmp/cron_allow_test > /dev/null 2>&1
> +-      rm /tmp/cron_allow_test1 > /dev/null 2>&1
> +-      mv $CRON_ALLOW $CRON_ALLOW.old > /dev/null 2>&1
> +-
> +-      #remove users for clean enviroment
> +-    su $TEST_USER1 -c "crontab -r"
> +-    su $TEST_USER2 -c "crontab -r"
> +-        rm -rf /home/$TEST_USER1
> +-        rm -rf /home/$TEST_USER2
> +-      userdel $TEST_USER1
> +-      userdel $TEST_USER2
> +-      sleep 1
> +-
> +-#create 1st user
> +-      useradd -m -g users $TEST_USER1
> +-      if [ $? != 0 ]
> +-    then {
> +-        echo "Could not add test user $TEST_USER1 to system."
> +-        exit 1
> +-    }
> +-    fi
> +-
> +-#create 2nd user
> +-      useradd -m -g users $TEST_USER2
> +-    if [ $? != 0 ]
> +-    then {
> +-        echo "Could not add test user $TEST_USER2 to system."
> +-        exit 1
> +-    }
> +-    fi
> +-}
> +-
> +-#-----------------------------------------------------------------------
> +-# FUNCTION:  do_cleanup
> +-#-----------------------------------------------------------------------
> +-do_cleanup(){
> +-    su $TEST_USER1 -c "crontab -r"
> +-    su $TEST_USER2 -c "crontab -r"
> +-        rm -rf /home/$TEST_USER1
> +-        rm -rf /home/$TEST_USER2
> +-      userdel $TEST_USER1
> +-      userdel $TEST_USER2
> +-      rm $CRON_ALLOW
> +-      mv $CRON_ALLOW.old $CRON_ALLOW > /dev/null 2>&1
> +-      rm /tmp/cron_allow_test >/dev/null 2>&1
> +-}
> +-
> +-#-----------------------------------------------------------------------
> +-# FUNCTION:  run_test
> +-#-----------------------------------------------------------------------
> +-run_test() {
> +-
> +-if [ $iam = $TEST_USER1 ]
> +-then
> +-      echo "TEST: $CRON_ALLOW should only allow those in the file to
> +-run cron jobs."
> +-
> +-      echo "(1) TEST THAT PERSON IN $CRON_ALLOW IS ABLE TO RUN JOB."
> +-
> +-      echo "backup crontab...."
> +-    crontab -l | grep '^[^#]' > /tmp/crontab-cronallow-save-$iam
> +-
> +-      crontab - << EOF
> +-        `date '+%M' | awk '{ORS=""; print ($1+2)%60 " * * * * "}'` echo
> "TEST JOB RAN" >> /tmp/cron_allow_test 2>&1
> +-EOF
> +-      if [ $? != 0 ]; then
> +-      echo Error while adding crontab for user $TEST_USER1
> +-      exit 1
> +-      fi
> +-
> +-      echo "sleeping for 130 seconds...."
> +-      sleep 130
> +-
> +-      EXIT_CODE=1
> +-      test -e /tmp/cron_allow_test && EXIT_CODE=0
> +-
> +-      if [ $EXIT_CODE = 1 ]; then
> +-              echo "Cron did not allow user to execute job , TEST FAILED"
> +-      else
> +-              echo "Cron allowed user to execute test job, TEST PASSED"
> +-      fi
> +-
> +-       echo "restore old crontab..."
> +-     crontab /tmp/crontab-cronallow-save-$iam
> +-     rm -f /tmp/crontab-cronallow-save-$iam
> +-
> +-
> +-      rm -f /tmp/cron_allow_test
> +-
> +-      exit $EXIT_CODE
> +-fi
> +-
> +-if [ $iam = $TEST_USER2 ]
> +-then
> +-        echo "(2) TEST THAT PERSON NOT IN $CRON_ALLOW IS NOT ABLE TO RUN
> JOB."
> +-
> +-              echo "backup crontab...."
> +-      crontab -l | grep '^[^#]' > /tmp/crontab-cronallow-save-$iam
> +-
> +-        crontab - << EOF
> +-        `date '+%M' | awk '{ORS=""; print ($1+2)%60 " * * * * "}'` echo
> "TEST JOB RAN" >> /tmp/cron_allow_test1 2>&1
> +-EOF
> +-        if [ $? != 0 ]; then
> +-        echo Error while adding crontab for user $TEST_USER2
> +-        fi
> +-
> +-        echo "sleeping for 130 seconds...."
> +-        sleep 130
> +-
> +-        EXIT_CODE=0
> +-        test -e /tmp/cron_allow_test1 && EXIT_CODE=1
> +-
> +-        if [ $EXIT_CODE = 0 ]; then
> +-                echo "Cron did not allow user to execute job , TEST
> PASSED"
> +-        else
> +-                echo "Cron allowed user to execute test job, TEST FAILED"
> +-        fi
> +-
> +-              echo "restore old crontab..."
> +-      crontab /tmp/crontab-cronallow-save-$iam
> +-      rm -f /tmp/crontab-cronallow-save-$iam
> +-
> +-        rm -f /tmp/cron_allow_test1
> +-
> +-        exit $EXIT_CODE
> +-fi
> +-
> +-}
> +-
> +-#-----------------------------------------------------------------------
> +-# FUNCTION: main
> +-#-----------------------------------------------------------------------
> +-if [ $iam = "root" ]
> +-then
> +-      do_setup
> +-      echo $TEST_USER1 > $CRON_ALLOW
> +-      EXIT_CODE=0
> +-      su $TEST_USER1 -c "$0"
> +-      if [ $? != 0 ]
> +-      then
> +-         EXIT_CODE=1
> +-      fi
> +-      su $TEST_USER2 -c "$0"
> +-      if [ $? != 0 ]
> +-      then EXIT_CODE=1
> +-      fi
> +-      do_cleanup
> +-      exit $EXIT_CODE
> +-else
> +-      run_test
> +-fi
> +diff --git a/testcases/commands/cron/cron_deny01
> b/testcases/commands/cron/cron_deny01
> +deleted file mode 100755
> +index 9d3203925..000000000
> +--- a/testcases/commands/cron/cron_deny01
> ++++ /dev/null
> +@@ -1,192 +0,0 @@
> +-#!/bin/bash
> +-#
> +-#   Copyright (c) International Business Machines  Corp., 2003
> +-#
> +-#   This program is free software;  you can redistribute it and/or modify
> +-#   it under the terms of the GNU General Public License as published by
> +-#   the Free Software Foundation; either version 2 of the License, or
> +-#   (at your option) any later version.
> +-#
> +-#   This program is distributed in the hope that it will be useful,
> +-#   but WITHOUT ANY WARRANTY;  without even the implied warranty of
> +-#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
> +-#   the GNU General Public License for more details.
> +-#
> +-#   You should have received a copy of the GNU General Public License
> +-#   along with this program;  if not, write to the Free Software
> +-#   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
> 02110-1301 USA
> +-#
> +-#     FILE: /var/spool/cron/allow
> +-#
> +-#     PURPOSE: Test that /var/spool/cron/deny , does not allow those in
> the file to run cron jobs.
> +-#
> +-#     HISTORY:
> +-#             04/03 Jerone Young (jyoung5@us.ibm.com)
> +-#
> +-
> +-echo "This script contains bashism that needs to be fixed!"
> +-
> +-iam=`whoami`
> +-
> +-tvar=${MACHTYPE%-*}
> +-tvar=${tvar#*-}
> +-
> +-if [ "$tvar" = "redhat" -o "$tvar" = "redhat-linux" ]
> +-then
> +-CRON_DENY="/etc/cron.deny"
> +-CRON_ALLOW="/etc/cron.allow"
> +-else
> +-CRON_DENY="/var/spool/cron/deny"
> +-CRON_ALLOW="/var/spool/cron/allow"
> +-fi
> +-
> +-TEST_USER1="cd_user1"
> +-TEST_USER1_HOME="/home/$TEST_USER1"
> +-TEST_USER2="cd_user2"
> +-TEST_USER2_HOME="/home/$TEST_USER2"
> +-
> +-#-----------------------------------------------------------------------
> +-# FUNCTION:  do_setup
> +-#-----------------------------------------------------------------------
> +-
> +-do_setup() {
> +-      #move any files that may get in the way
> +-      rm /tmp/cron_deny_test > /dev/null 2>&1
> +-        rm /tmp/cron_deny_test1 > /dev/null 2>&1
> +-
> +-      mv $CRON_DENY $CRON_DENY.old > /dev/null 2>&1
> +-      mv $CRON_ALLOW $CRON_ALLOW.old > /dev/null 2>&1
> +-
> +-      #remove users for clean enviroment
> +-    su $TEST_USER1 -c "crontab -r"
> +-    su $TEST_USER2 -c "crontab -r"
> +-        rm -rf /home/$TEST_USER1
> +-        rm -rf /home/$TEST_USER2
> +-      userdel $TEST_USER1
> +-      userdel $TEST_USER2
> +-      sleep 1
> +-
> +-#create 1st user
> +-      useradd -m -g users $TEST_USER1
> +-      if [ $? != 0 ]
> +-    then {
> +-        echo "Could not add test user $TEST_USER1 to system."
> +-        exit 1
> +-    }
> +-    fi
> +-
> +-#create 2nd user
> +-      useradd -m -g users $TEST_USER2
> +-    if [ $? != 0 ]
> +-    then {
> +-        echo "Could not add test user $TEST_USER2 to system."
> +-        exit 1
> +-    }
> +-    fi
> +-}
> +-
> +-#-----------------------------------------------------------------------
> +-# FUNCTION:  do_cleanup
> +-#-----------------------------------------------------------------------
> +-do_cleanup(){
> +-    su $TEST_USER1 -c "crontab -r"
> +-    su $TEST_USER2 -c "crontab -r"
> +-        rm -rf /home/$TEST_USER1
> +-        rm -rf /home/$TEST_USER2
> +-      userdel $TEST_USER1
> +-      userdel $TEST_USER2
> +-      rm $CRON_DENY
> +-      mv $CRON_DENY.old $CRON_DENY > /dev/null 2>&1
> +-      mv $CRON_ALLOW.old $CRON_ALLOW > /dev/null 2>&1
> +-      rm /tmp/cron_allow_test >/dev/null 2>&1
> +-}
> +-
> +-#-----------------------------------------------------------------------
> +-# FUNCTION:  run_test
> +-#-----------------------------------------------------------------------
> +-run_test() {
> +-
> +-if [ $iam = $TEST_USER1 ]
> +-then
> +-      echo "TEST: $CRON_DENY should allow only allow those who are not
> in the file to
> +-run cron jobs."
> +-
> +-      echo "(1) TEST THAT PERSON NOT IN $CRON_DENY IS ABLE TO RUN JOB."
> +-
> +-      crontab - << EOF
> +-      `date '+%M' | awk '{ORS=""; print ($1+2)%60" * * * * "}'` echo
> "TEST JOB RAN" >> /tmp/cron_deny_test 2>&1
> +-EOF
> +-      if [ $? != 0 ]; then
> +-      echo Error while adding crontab for user $TEST_USER1
> +-      exit 1
> +-      fi
> +-
> +-      echo "sleeping for 130 seconds...."
> +-      sleep 130
> +-
> +-      EXIT_CODE=1
> +-      test -e /tmp/cron_deny_test && EXIT_CODE=0
> +-
> +-      if [ $EXIT_CODE = 1 ]; then
> +-              echo "Cron did not allow user to execute job , TEST FAILED"
> +-      else
> +-              echo "Cron allowed user to execute test job, TEST PASSED"
> +-      fi
> +-
> +-      rm -f /tmp/cron_deny_test
> +-
> +-      exit $EXIT_CODE
> +-fi
> +-
> +-if [ $iam = $TEST_USER2 ]
> +-then
> +-        echo "(2) TEST THAT PERSON IN $CRON_DENY IS NOT ABLE TO RUN JOB."
> +-
> +-        crontab - << EOF
> +-        `date '+%M' | awk '{ORS=""; print ($1+2)%60 " * * * * "}'` echo
> "TEST JOB RAN" >> /tmp/cron_deny_test 2>&1
> +-EOF
> +-        if [ $? != 0 ]; then
> +-        echo Error while adding crontab for user $TEST_USER2
> +-        fi
> +-
> +-        echo "sleeping for 130 seconds...."
> +-        sleep 130
> +-
> +-        EXIT_CODE=0
> +-        test -e /tmp/cron_deny_test1 && EXIT_CODE=1
> +-
> +-        if [ $EXIT_CODE = 0 ]; then
> +-                echo "Cron did not allow user to execute job , TEST
> PASSED"
> +-        else
> +-                echo "Cron allowed user to execute test job, TEST FAILED"
> +-        fi
> +-
> +-        rm -f /tmp/cron_deny_test1
> +-
> +-        exit $EXIT_CODE
> +-fi
> +-
> +-}
> +-
> +-#-----------------------------------------------------------------------
> +-# FUNCTION: main
> +-#-----------------------------------------------------------------------
> +-if [ $iam = "root" ]
> +-then
> +-      do_setup
> +-      echo $TEST_USER2 > $CRON_DENY
> +-      EXIT_CODE=0
> +-      su $TEST_USER1 -c "$0"
> +-      if [ $? != 0 ]
> +-      then
> +-         EXIT_CODE=1
> +-      fi
> +-      su $TEST_USER2 -c "$0"
> +-      if [ $? != 0 ]
> +-      then EXIT_CODE=1
> +-      fi
> +-      do_cleanup
> +-      exit $EXIT_CODE
> +-else
> +-      run_test
> +-fi
> +diff --git a/testcases/commands/cron/cron_dirs_check.c
> b/testcases/commands/cron/cron_dirs_check.c
> +deleted file mode 100644
> +index cc9e0ad25..000000000
> +--- a/testcases/commands/cron/cron_dirs_check.c
> ++++ /dev/null
> +@@ -1,44 +0,0 @@
> +-#include <sys/types.h>
> +-#include <sys/param.h>
> +-#include <sys/stat.h>
> +-#include <stdio.h>
> +-#include <unistd.h>
> +-
> +-/* Check directory Access */
> +-int check_directory_access(char *directory)
> +-{
> +-
> +-      struct stat statbuf;
> +-
> +-      printf("Checking %s\n", directory);
> +-
> +-      if (stat(directory, &statbuf) == -1) {
> +-              printf("FAIL: %s. Could not obtain directory status\n",
> +-                     directory);
> +-              return 1;
> +-      }
> +-
> +-      if (statbuf.st_uid != 0) {
> +-              printf("FAIL: %s. Invalid owner\n", directory);
> +-              return 1;
> +-      }
> +-
> +-      if ((statbuf.st_mode & S_IWGRP) || (statbuf.st_mode & S_IWOTH)) {
> +-              printf("FAIL: %s. Invalid write access\n", directory);
> +-              return 1;
> +-      }
> +-
> +-      printf("PASS: %s\n", directory);
> +-      return 0;
> +-}
> +-
> +-int main(int argc, char *argv[])
> +-{
> +-
> +-      if (argc != 2) {
> +-              printf("Please enter target directory");
> +-              return 1;
> +-      }
> +-
> +-      return check_directory_access(argv[1]);
> +-}
> +diff --git a/testcases/commands/cron/cron_dirs_checks01
> b/testcases/commands/cron/cron_dirs_checks01
> +deleted file mode 100755
> +index ea1215e8d..000000000
> +--- a/testcases/commands/cron/cron_dirs_checks01
> ++++ /dev/null
> +@@ -1,46 +0,0 @@
> +-#!/bin/sh
> +-#*********************************************************************
> +-#   Copyright (c) International Business Machines  Corp., 2000
> +-#
> +-#   This program is free software;  you can redistribute it and/or modify
> +-#   it under the terms of the GNU General Public License as published by
> +-#   the Free Software Foundation; either version 2 of the License, or
> +-#   (at your option) any later version.
> +-#
> +-#   This program is distributed in the hope that it will be useful,
> +-#   but WITHOUT ANY WARRANTY;  without even the implied warranty of
> +-#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
> +-#   the GNU General Public License for more details.
> +-#
> +-#   You should have received a copy of the GNU General Public License
> +-#   along with this program;  if not, write to the Free Software
> +-#   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
> 02110-1301 USA
> +-#
> +-#  FILE   : cron
> +-#
> +-#  PUROPOSE: Ensure that the following directories only have root write
> access
> +-#                     /etc/cron.d
> +-#                     /etc/cron.daily
> +-#                     /etc/cron.hourly
> +-#                     /etc/cron.monthly
> +-#                     /etc/cron.weekly
> +-#                     /var/spool/cron
> +-#     HISTORY:
> +-#             Jerone Young (jyoung5@us.ibm.com)
> +-#
> +-
> +-DIRS="/etc/cron.d /etc/cron.daily /etc/cron.hourly /etc/cron.monthly
> /etc/cron.weekly /var/spool/cron"
> +-
> +-EXIT_CODE=0
> +-for i in $DIRS
> +-do
> +-      cron_dirs_check $i
> +-      if [ $? != 0 ]
> +-      then
> +-              echo "$i FAILED TEST!!!!!"
> +-              EXIT_CODE=1
> +-      fi
> +-
> +-done
> +-
> +-exit $EXIT_CODE
> +diff --git a/testcases/commands/cron/cron_illegal_cron_lines
> b/testcases/commands/cron/cron_illegal_cron_lines
> +deleted file mode 100644
> +index 3b32dc844..000000000
> +--- a/testcases/commands/cron/cron_illegal_cron_lines
> ++++ /dev/null
> +@@ -1,39 +0,0 @@
> +-# Collection of illegal cron lines
> +-# Comment lines must habe its '#' as first character.
> +-# The cron conf line and its description is seperated by '|'.
> +-# cron job command 'true' is appended automatically
> +-
> +-# Illegal Minutes
> +-61 * * * * | Minute 61
> +--1 * * * * | Minute -1 (might be interpreted as range)
> +-0.5 * * * * | Minute 0.5
> +--1-10 * * * *| Minute Range -1-10
> +-0-61 * * * * | Minute Range 0-61
> +-
> +-# Illegal hours
> +-0 25 * * * | Hour 25
> +-0 -2 * * * | Hour -2
> +-0 3.5 * * *| Hour 3.5
> +-0 -4-10 * * *| Hour Range -4-10
> +-0 0-25 * * * | Hour Range 0-25
> +-
> +-# Illegal day of month
> +-0 0 32 * * | Day 32
> +-0 0 -1 * * | Day -1
> +-0 0 3.5 * *| Day 3.5
> +-0 0 -3-3 * *| Day Range -3-3
> +-0 0 0-32 * *| Day Range 0-32
> +-
> +-# Illegal month
> +-0 0 1 13 * | Month 13
> +-0 0 1 -1 * | Month -1
> +-0 0 1 2.5 * | Month 2.5
> +-0 0 1 -2-3 * | Month Range -2-3
> +-0 0 1 0-13 * | Month Range 0-13
> +-
> +-# Illegal day of week
> +-0 0 * * 8 | Day of Week 8
> +-0 0 * * -2 | Day of Week -2
> +-0 0 * * 2.5 | Day of Week 2.5
> +-0 0 * * -7-7 | Day of Week Range -7-7
> +-0 0 * * 0-8 | Day of Week Range 0-8
> +diff --git a/testcases/commands/cron/cron_neg_tests.sh
> b/testcases/commands/cron/cron_neg_tests.sh
> +deleted file mode 100755
> +index 9c3d6f6c7..000000000
> +--- a/testcases/commands/cron/cron_neg_tests.sh
> ++++ /dev/null
> +@@ -1,141 +0,0 @@
> +-#!/bin/bash
> +-########################################################
> +-#
> +-# CHANGE ACTIVITY
> +-#
> +-#    10/01/04  Kris Wilson    RHEL4 only allows super user
> +-#                               to use crontab.
> +-#                               to use crontab.
> +-#    12/03/04  Marty Ridgeway Pull RHEl4 tests out from script
> +-########################################################
> +-
> +-iam=`whoami`
> +-
> +-if [ $iam = "root" ]; then
> +-      if [ $# -lt 1 ] ; then
> +-              echo Either do not run this script as root or start it like
> +-              echo "  $0 <user>"
> +-              exit 1
> +-      fi
> +-
> +-      su $1 -c "$0 $*"
> +-      exit $?
> +-fi
> +-
> +-#
> +-# 1. root einen cronjob unterjubeln
> +-#
> +-
> +-finalrc=0
> +-
> +-
> +-crontab -u root - << EOF
> +-0 * * * * true
> +-EOF
> +-
> +-rc=$?
> +-
> +-if [ $rc = "0" ]; then
> +-      echo root has now an interesting cron job
> +-      echo "crontab has a severe security breach (FAIL)"
> +-      echo
> +-      finalrc=1
> +-else
> +-      echo "Editing a crontab of another user failed successfully (PASS)"
> +-      echo
> +-fi
> +-
> +-
> +-#
> +-# 2. write some illegal crontabs
> +-#
> +-
> +-# Save crontab
> +-
> +-#crontab -l > /dev/null 2> /dev/null
> +-#if [ $? = "0" ]; then
> +-#     echo Saving current crontab...
> +-#     echo
> +-#     crontab -l > /tmp/save-crontab-`whoami`
> +-#     savedcrontab=1
> +-#     crontab -r
> +-#fi
> +-
> +-#for line in `cat cron_illegal_cron_lines | grep '^[^#]' | sed -e 's/[
> \t][ \t]*/_/g'` ; do
> +-#     line=`echo $line | sed -e 's/_/ /g'`
> +-      # echo Line: "$line"
> +-#     cronconf=`echo "$line" | cut -f 1 -d '|'`
> +-#     desc=`echo "$line" | cut -f 2 -d '|'`
> +-
> +-#     echo "Test: $desc"
> +-#     echo "$cronconf true" | crontab -
> +-      # echo "$cronconf"
> +-#     if [ $? = "0" ]; then
> +-#             echo 'Test FAILED (or crontab returned wrong exit code)'
> +-#             echo 'crontab -l:'
> +-#             crontab -l
> +-#             finalrc=1
> +-#     fi
> +-#     echo
> +-#done
> +-
> +-
> +-# Test whether cron uses setuid correctly
> +-
> +-echo
> +-echo setuid test
> +-echo
> +-
> +-tmpscript=cron_neg01_test
> +-rm -rf $tmpscript.out >/dev/null 2>&1
> +-
> +-
> +-cat > /tmp/$tmpscript << EOF
> +-touch /root/halloichwarhier
> +-sleep 1
> +-cat /root/halloichwarhier ; echo "res:$?"
> +-rm /root/halloichwarhier
> +-EOF
> +-
> +-chmod 755 /tmp/$tmpscript
> +-
> +-#
> +-cronline=`date '+%M' | awk '{print ($1+2)%60 " * * * * "}'`
> +-(echo "$cronline /tmp/$tmpscript >> /tmp/$tmpscript.out 2>>
> /tmp/$tmpscript.out" ; \
> +- echo "$cronline /tmp/$tmpscript >> /$tmpscript.out 2>>
> /$tmpscript.out") \
> +- | crontab -
> +-
> +-echo "sleeping 130 secs..."
> +-sleep 130
> +-
> +-echo
> +-echo "Results:"
> +-if [ "1" = `cat /tmp/$tmpscript.out | grep "res:0" | wc -l` ]; then
> +-      echo "setuid test part 1 successfully failed (PASS)"
> +-else
> +-      echo "cron executed scripts have root privileges! (FAIL)"
> +-      finalrc=1
> +-fi
> +-
> +-CODE=0
> +-test -e /tmp/$tmpscript.out && CODE=1
> +-if [ $CODE = "1" ]; then
> +-      echo "setuid test part 2 successfully failed (PASS)"
> +-else
> +-      echo "cron writes script output with root privileges! (FAIL)"
> +-      finalrc=1
> +-fi
> +-echo
> +-
> +-rm /tmp/$tmpscript* >/dev/null 2>&1
> +-crontab -r
> +-
> +-# Restore crontab
> +-
> +-if [ "$savedcrontab" = "1" ]; then
> +-      echo "Restoring crontab..."
> +-      cat /tmp/save-crontab-`whoami` | grep '^[^#]' | crontab -
> +-      # rm -r /tmp/save-crontab-`whoami`
> +-fi
> +-
> +-exit $finalrc
> +diff --git a/testcases/commands/cron/cron_pos_tests.sh
> b/testcases/commands/cron/cron_pos_tests.sh
> +deleted file mode 100755
> +index ece114c84..000000000
> +--- a/testcases/commands/cron/cron_pos_tests.sh
> ++++ /dev/null
> +@@ -1,118 +0,0 @@
> +-#!/bin/bash
> +-
> +-# Positive tests for cron, that means these tests have to pass
> +-
> +-iam=`whoami`
> +-
> +-tvar=${MACHTYPE%-*}
> +-tvar=${tvar#*-}
> +-
> +-if [ "$tvar" = "redhat" -o "$tvar" = "redhat-linux" ]
> +-then
> +-      CRON_ALLOW="/etc/cron.allow"
> +-else
> +-      CRON_ALLOW="/var/spool/cron/allow"
> +-fi
> +-
> +-
> +-if [ $iam = "root" ]; then
> +-      if [ $# -lt 1 ] ; then
> +-              echo Either do not run this script as root or start it like
> +-              echo "  $0 <user>"
> +-              exit 1
> +-      fi
> +-
> +-      mv $CRON_ALLOW $CRON_ALLOW.old >/dev/null 2>&1
> +-      su $1 -c "$0 $*"
> +-        RC=$?
> +-      mv $CRON_ALLOW.old $CRON_ALLOW >/dev/null 2>&1
> +-      exit $RC
> +-fi
> +-
> +-function restorecrontab () {
> +-      test -e /tmp/crontab-save-$iam && \
> +-              crontab /tmp/crontab-save-$iam && \
> +-              rm -f /tmp/crontab-save-$iam && \
> +-              echo restored old crontab
> +-}
> +-
> +-echo Running as user $iam...
> +-
> +-# Save current users crontab
> +-
> +-test -e /tmp/crontab-save-$iam && rm -f /tmp/crontab-save-$iam
> +-
> +-if [ "0" -lt `crontab -l 2>/dev/null | wc -l` ]; then
> +-
> +-      echo 'crontab of this user exists -> creating backup'
> +-      crontab -l | grep '^[^#]' > /tmp/crontab-save-$iam
> +-fi
> +-
> +-
> +-# Do tests
> +-
> +-# 1. Add new job
> +-
> +-rm -rf /tmp/crontest >/dev/null 2>&1
> +-mkdir -p /tmp/crontest
> +-
> +-cat > /tmp/crontest/testjob_cron01 << EOF
> +-echo Testjob running
> +-date
> +-EOF
> +-
> +-chmod 755 /tmp/crontest/testjob_cron01
> +-
> +-crontab - << EOF
> +-`date '+%M' | awk '{ print ($1+2)%60 " * * * * "
> +-}'` /tmp/crontest/testjob_cron01 >> /tmp/crontest/output_cron01 2>&1
> +-EOF
> +-
> +-rc=$?
> +-
> +-if [ $rc = "1" ]; then
> +-      echo Error while adding crontab for user $iam
> +-      restorecrontab
> +-      exit 1
> +-fi
> +-
> +-echo new job added successfully
> +-
> +-# 2. Wait for execution of job
> +-
> +-echo 'sleeping for 130 seconds...'
> +-sleep 130
> +-
> +-rc=1
> +-test -e /tmp/crontest/output_cron01 && rc=0
> +-
> +-if [ $rc = "1" ]; then
> +-      echo Job has not been executed
> +-      restorecrontab
> +-      exit 1
> +-fi
> +-
> +-grep "Testjob running" /tmp/crontest/output_cron01
> +-rc=$?
> +-if [ $rc = "1" ]; then
> +-      echo Job has not produced valid output
> +-      restorecrontab
> +-fi
> +-
> +-echo 'job has been executed :-)'
> +-echo "testjob's output:"
> +-echo
> +-
> +-rm -rf /tmp/crontest
> +-
> +-# 3. Delete crontab
> +-
> +-crontab -r
> +-
> +-echo removed crontab
> +-
> +-# Restore old crontab file
> +-
> +-restorecrontab
> +-
> +-exit $rc
> +diff --git a/testcases/commands/cron/cron_tests.sh
> b/testcases/commands/cron/cron_tests.sh
> +deleted file mode 100644
> +index 47614f9e3..000000000
> +--- a/testcases/commands/cron/cron_tests.sh
> ++++ /dev/null
> +@@ -1,276 +0,0 @@
> +-#!/bin/sh
> +-
> +-# Copyright (c) International Business Machines Corp., 2001
> +-# Copyright (c) 2017 Petr Vorel <pvorel@suse.cz>
> +-#
> +-# This program is free software; you can redistribute it and/or
> +-# modify it under the terms of the GNU General Public License as
> +-# published by the Free Software Foundation; either version 2 of
> +-# the License, or (at your option) any later version.
> +-#
> +-# This program is distributed in the hope that it would be useful,
> +-# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +-# GNU General Public License for more details.
> +-#
> +-# You should have received a copy of the GNU General Public License
> +-# along with this program; if not, write the Free Software Foundation,
> +-# Inc.,  51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
> +-#
> +-# Author: Manoj Iyer <manjo@mail.utexas.edu>
> +-
> +-TST_CNT=3
> +-TST_TESTFUNC=do_test
> +-TST_NEEDS_TMPDIR=1
> +-TST_SETUP=setup
> +-TST_CLEANUP=cleanup
> +-. tst_test.sh
> +-
> +-. daemonlib.sh
> +-
> +-SYSLOG_STARTED=
> +-CROND_STARTED=
> +-LOGS=
> +-
> +-grep_logs()
> +-{
> +-      local pattern="$1"
> +-      local fail_msg="$2"
> +-      local pass_msg="${3:-}"
> +-      local n="${4:-10}"
> +-
> +-      local lines=10
> +-      local out=out.$$
> +-      local err=err.$$
> +-      local i ret
> +-
> +-      for i in $(seq 1 $n); do
> +-              if [ "$LOGS" ]; then
> +-                      tail -n $lines $LOGS | grep "$pattern" > $out 2>
> $err
> +-              else
> +-                      journalctl -n $lines | grep "$pattern" > $out 2>
> $err
> +-              fi
> +-              ret=$?
> +-              [ $ret -eq 0 ] && break
> +-              sleep 1
> +-      done
> +-
> +-      if [ $ret -ne 0 ]; then
> +-              tst_res TFAIL "$fail_msg: `cat $err`"
> +-      else
> +-              [ "$pass_msg" ] && tst_res TPASS "$pass_msg"
> +-      fi
> +-}
> +-
> +-create_crontab()
> +-{
> +-      local crontab=cronjob.cron
> +-      local script=$1
> +-      local out=out.$$
> +-
> +-      tst_res TINFO "creating crontab: $script"
> +-
> +-      cat > $crontab <<EOF
> +-* * * * * $script
> +-EOF
> +-
> +-      tst_res TINFO "installing crontab file"
> +-      crontab $crontab > $out 2>&1
> +-      if [ $? -ne 0 ]; then
> +-              tst_brk TBROK "crontab: error while installing crontab
> file: `cat $out`"
> +-              return 1
> +-      fi
> +-      return 0
> +-}
> +-
> +-remove_crontab()
> +-{
> +-      local out=out.$$
> +-      tst_res TINFO "removing crontab file"
> +-      crontab -r > $out 2>&1
> +-      if [ $? -ne 0 ]; then
> +-              tst_brk TBROK "crontab: error while removing crontab file
> `cat $out`"
> +-              return 1
> +-      fi
> +-      return 0
> +-}
> +-
> +-create_hello_script()
> +-{
> +-      local script=$1
> +-
> +-      cat > $script <<EOF
> +-#!/bin/sh
> +-echo "Hello Hell"
> +-exit 0
> +-EOF
> +-      chmod +x $script
> +-}
> +-
> +-install_cron_test()
> +-{
> +-      local script=$PWD/cronprg.sh
> +-      local cron_out=$PWD/tst1_cron.out
> +-      local err=err.log
> +-      local sleep_sec
> +-      local ts_min1 ts_min2 fail
> +-
> +-      tst_res TINFO "test install cron job"
> +-
> +-      cat > $script <<EOF
> +-#! /bin/sh
> +-DATE=\`LC_ALL=C date\`
> +-echo "Hello Hell today is \$DATE" > $cron_out 2>&1
> +-exit 0
> +-EOF
> +-      chmod +x $script
> +-
> +-      create_crontab $script 2> $err
> +-
> +-      if [ $? -ne 0 ]; then
> +-              tst_brk TBROK "crontab: error while creating cron job:
> `cat $err`"
> +-      else
> +-              tst_res TINFO "cron job installed successfully"
> +-      fi
> +-
> +-      grep_logs 'crontab.*REPLACE' \
> +-              "cron activity not recorded" \
> +-              "cron activity logged"
> +-
> +-      # Sleep 3s after next minute since the loop below sleeps for 62
> seconds, we
> +-      # should start this 5-iteration loop closely following the start
> of a
> +-      # minute.
> +-      sleep_sec=$((123-`date +%-S`))
> +-      tst_res TINFO "sleep for ${sleep_sec}s"
> +-      sleep $sleep_sec
> +-
> +-      # $script executed by the cron job will record the date and time
> into file
> +-      # $cron_out. Get the minute recorded by the program, sleep to
> allow the cron
> +-      # job to update file after 1m, and check if the value is advanced
> by 1.
> +-      for i in $(seq 1 5); do
> +-              tst_res TINFO "loop: $i: start"
> +-
> +-              if [ ! -f "$cron_out" ]; then
> +-                      tst_res TFAIL "loop $i: file $cron_out doesn't
> exist"
> +-                      fail=1
> +-                      break
> +-              fi
> +-
> +-              ts_min1=$(awk '{print $8}' $cron_out | awk -F:
> '{printf("%d", $2);}')
> +-
> +-              # wait for the cron job to update output file
> +-              sleep 62
> +-
> +-              # Check the time recorded in output file, this should be 1
> minute ahead of
> +-              # what was recored earlier.
> +-              ts_min2=$(awk '{print $8}' $cron_out | awk -F:
> '{printf("%d", $2);}')
> +-
> +-              if [ "x${ts_min1}" = "x" ] || [ "x${ts_min2}" = "x" ]; then
> +-                      tst_res TFAIL "loop $i: failed to get time:
> ts_min1: $ts_min1, ts_min2: $ts_min2"
> +-                      fail=1
> +-                      break
> +-              fi
> +-
> +-              [ $ts_min1 -eq 59 ] && ts_min1=0 || ts_min1=$(( $ts_min1+1
> ))
> +-
> +-              if [ $ts_min2 -ne $ts_min1 ]; then
> +-                      tst_res TFAIL "loop $i: failed to update every
> minute: expected: $ts_min1, received: $ts_min2"
> +-                      fail=1
> +-                      break
> +-              fi
> +-      done
> +-
> +-      if [ ! "$fail" ]; then
> +-              grep_logs "CMD ($script)" \
> +-                      "failed to install cron job installed and execute
> it" \
> +-                      "cron job installed and executed" 1
> +-      fi
> +-
> +-      remove_crontab
> +-}
> +-
> +-remove_cron_job_test()
> +-{
> +-      local script=$PWD/cronprg.sh
> +-
> +-      tst_res TINFO "test remove cron job"
> +-
> +-      create_hello_script $script
> +-      create_crontab $script
> +-
> +-      grep_logs 'crontab.*REPLACE' \
> +-              "crontab activity not recorded"
> +-
> +-      remove_crontab && grep_logs DELETE \
> +-              "crontab activity not recorded" \
> +-              "crontab removed the cron job" 1
> +-}
> +-
> +-list_cron_jobs_test()
> +-{
> +-      local script=$PWD/cronprg.sh
> +-      local out=cron.out
> +-
> +-      tst_res TINFO "test list installed cron jobs"
> +-
> +-      create_hello_script $script
> +-      create_crontab $script
> +-
> +-      tst_res TINFO "crontab: listing cron jobs"
> +-      crontab -l | grep "$script" > $out 2>&1 || \
> +-              tst_brk TBROK "crontab failed while listing installed cron
> jobs: `cat $out`"
> +-
> +-      remove_crontab
> +-
> +-      crontab -l > $out 2>&1
> +-      if [ $? -ne 0 ]; then
> +-              grep -q "no crontab for" $out
> +-              if [ $? -ne 0 ]; then
> +-                      tst_res TFAIL "crontab failed removing cron job:
> `cat $out`"
> +-              else
> +-                      tst_res TPASS "crontab did not list any cron jobs"
> +-              fi
> +-      else
> +-              tst_res TFAIL "crontab failed removing cron job: `cat
> $out`"
> +-      fi
> +-}
> +-
> +-setup()
> +-{
> +-      if [ "$SYSLOG_DAEMON" ]; then
> +-              status_daemon $SYSLOG_DAEMON
> +-              if [ $? -ne 0 ]; then
> +-                      restart_daemon $SYSLOG_DAEMON
> +-                      SYSLOG_STARTED=1
> +-              fi
> +-      fi
> +-
> +-      if [ "$CROND_DAEMON" ]; then
> +-              status_daemon $CROND_DAEMON
> +-              if [ $? -ne 0 ]; then
> +-                      restart_daemon $CROND_DAEMON
> +-                      CROND_STARTED=1
> +-              fi
> +-      fi
> +-
> +-      for f in /var/log/syslog /var/log/messages /var/log/cron
> /var/log/cron.log; do
> +-              [ -f "$f" ] && LOGS="$f $LOGS"
> +-      done
> +-}
> +-
> +-cleanup()
> +-{
> +-      [ "$SYSLOG_STARTED" = "1" ] && stop_daemon $SYSLOG_DAEMON
> +-      [ "$CROND_STARTED" = "1" ] && stop_daemon $CROND_DAEMON
> +-}
> +-
> +-do_test()
> +-{
> +-      case $1 in
> +-      1) install_cron_test;;
> +-      2) remove_cron_job_test;;
> +-      3) list_cron_jobs_test;;
> +-      esac
> +-}
> +-
> +-tst_run
> +diff --git a/testcases/commands/su/Makefile
> b/testcases/commands/su/Makefile
> +deleted file mode 100644
> +index da2ff036f..000000000
> +--- a/testcases/commands/su/Makefile
> ++++ /dev/null
> +@@ -1,31 +0,0 @@
> +-#
> +-#    commands/su testcases Makefile.
> +-#
> +-#    Copyright (C) 2009, Cisco Systems Inc.
> +-#
> +-#    This program is free software; you can redistribute it and/or modify
> +-#    it under the terms of the GNU General Public License as published by
> +-#    the Free Software Foundation; either version 2 of the License, or
> +-#    (at your option) any later version.
> +-#
> +-#    This program is distributed in the hope that it will be useful,
> +-#    but WITHOUT ANY WARRANTY; without even the implied warranty of
> +-#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +-#    GNU General Public License for more details.
> +-#
> +-#    You should have received a copy of the GNU General Public License
> along
> +-#    with this program; if not, write to the Free Software Foundation,
> Inc.,
> +-#    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> +-#
> +-# Ngie Cooper, July 2009
> +-#
> +-
> +-top_srcdir            ?= ../../..
> +-
> +-include $(top_srcdir)/include/mk/env_pre.mk
> +-
> +-INSTALL_TARGETS               := su01 su01_s1 su_set_passwd
> +-
> +-MAKE_TARGETS          :=
> +-
> +-include $(top_srcdir)/include/mk/generic_leaf_target.mk
> +diff --git a/testcases/commands/su/su01 b/testcases/commands/su/su01
> +deleted file mode 100755
> +index 34386d937..000000000
> +--- a/testcases/commands/su/su01
> ++++ /dev/null
> +@@ -1,181 +0,0 @@
> +-#!/bin/bash
> +-#*********************************************************************
> +-#   Copyright (c) International Business Machines  Corp., 2003, 2004
> +-#
> +-#   This program is free software;  you can redistribute it and/or modify
> +-#   it under the terms of the GNU General Public License as published by
> +-#   the Free Software Foundation; either version 2 of the License, or
> +-#   (at your option) any later version.
> +-#
> +-#   This program is distributed in the hope that it will be useful,
> +-#   but WITHOUT ANY WARRANTY;  without even the implied warranty of
> +-#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
> +-#   the GNU General Public License for more details.
> +-#
> +-#   You should have received a copy of the GNU General Public License
> +-#   along with this program;  if not, write to the Free Software
> +-#   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
> 02110-1301 USA
> +-#
> +-#  FILE   : su
> +-#
> +-#  PURPOSE: Tests the basic functionality of `su`.
> +-#
> +-#  SETUP: The program `/usr/bin/expect' MUST be installed.
> +-#
> +-#  HISTORY:
> +-#    03/03    Dustin Kirkland (dkirklan@us.ibm.com)
> +-#    03/03    Jerone Young    (jeroney@us.ibm.com)
> +-#    10/01/04 Kris Wilson     Port to Red Hat
> +-#
> +-#*********************************************************************
> +-
> +-echo "This script contains bashism that needs to be fixed!"
> +-
> +-if [ -z ${TCbin} ]
> +-then
> +-   export TCbin=$PWD
> +-fi
> +-
> +-export TEST_USER1="su_usr1"
> +-
> +-tvar=${MACHTYPE%-*}
> +-tvar=${tvar#*-}
> +-
> +-# need to export tvar for su01_s1
> +-export tvar
> +-printf "Machine type is: $tvar\n\n"
> +-
> +-if [ "$tvar" = "redhat" -o "$tvar" = "redhat-linux" ]
> +-# Need to also set group for TEST_USER2
> +-then
> +-export TEST_USER1_GROUP="wheel"
> +-export TEST_USER2_GROUP="wheel"
> +-else
> +-export TEST_USER1_GROUP="trusted"
> +-export TEST_USER2_GROUP="trusted"
> +-fi
> +-export TEST_USER1_PASSWD="eal"
> +-export TEST_USER1_ENCRYPTED_PASSWD="42VmxaOByKwlA"
> +-export TEST_USER1_NEW_PASSWD="a_very_good_and_long_password"
> +-export TEST_USER1_HOMEDIR="/home/$TEST_USER1"
> +-
> +-export TEST_USER2="su_usr2"
> +-# Group needs to be trusted for Red Hat.
> +-#export TEST_USER2_GROUP="trusted"
> +-export TEST_USER2_PASSWD="eal"
> +-export TEST_USER2_ENCRYPTED_PASSWD="42VmxaOByKwlA"
> +-export TEST_USER2_HOMEDIR="/home/$TEST_USER2"
> +-
> +-#This is for enviroment test
> +-export TEST_LINE="YOU_HAVE_THE_VARIABLE"
> +-export TEST_ENV_FILE="/tmp/TEST_ENV_FILE_ROOT"
> +-export TEST_ENV_FILE_USER="/tmp/TEST_ENV_FILE_USER"
> +-export TEST_ENV_FILE2="/tmp/TEST_ENV_FILE_ROOT2"
> +-#-----------------------------------------------------------------------
> +-# FUNCTION:  do_setup
> +-#-----------------------------------------------------------------------
> +-
> +-do_setup(){
> +-
> +-#REMOVE ANY TEMPOARY FILES THAT MAY STILL BE AROUND
> +-rm -f $TEST_ENV_FILE_USER > /dev/null 2>&1
> +-rm -f $TEST_ENV_FILE2 > /dev/null 2>&1
> +-rm -f $TEST_ENV_FILE > /dev/null 2>&1
> +-
> +-
> +-#Create 1st test user
> +-    #erase user if he may exist , so we can have a clean en
> +-        rm -rf /home/$TEST_USER1
> +-        getent passwd $TEST_USER1 > /dev/null 2>&1 && userdel $TEST_USER1
> +-      sleep 1
> +-
> +-        useradd -m -g users $TEST_USER1
> +-        if [ $? != 0 ]
> +-        then {
> +-                echo "Could not add test user $TEST_USER1."
> +-                exit 1
> +-        }
> +-        fi
> +-
> +-              usermod -G users,$TEST_USER1_GROUP $TEST_USER1
> +-
> +-      #create users home directory (SLES 8 does not do this, even when
> specified in adduser)
> +-# Only do this if not RH; RH creates the directory.
> +-      if [ "$tvar" != "redhat" -a "$tvar" != "redhat-linux" ]
> +-      then {
> +-          USER_UID=`id -u $TEST_USER1`
> +-          USER_GID=`id -g $TEST_USER1`
> +-          mkdir -p $TEST_USER1_HOMEDIR
> +-          chown -R $USER_UID.$USER_GID $TEST_USER1_HOMEDIR
> +-      }
> +-      fi
> +-
> +-        usermod -p $TEST_USER1_ENCRYPTED_PASSWD $TEST_USER1 > /dev/null
> 2>&1
> +-        if [ $? != 0 ]
> +-        then {
> +-                echo "Could not set password for test user $TEST_USER1"
> +-                exit 1
> +-        }
> +-        fi
> +-
> +-#Create 2nd test user
> +-      #erase user if he may exist , so we can have a clean en
> +-        rm -rf /home/$TEST_USER2
> +-        getent passwd $TEST_USER2 > /dev/null 2>&1 && userdel $TEST_USER2
> +-      sleep 1
> +-
> +-        useradd -m -g users $TEST_USER2
> +-
> +-        if [ $? != 0 ]
> +-        then {
> +-                echo "Could not add test user $TEST_USER2."
> +-                exit 1
> +-        }
> +-        fi
> +-
> +-              usermod -G users,$TEST_USER2_GROUP $TEST_USER2
> +-
> +-      #create users home diretory (SLES 8 does not do this, even when
> specified in adduser)
> +-# Only do this if not RH; RH creates the directory.
> +-        if [ "$tvar" != "redhat" -a "$tvar" != "redhat-linux" ]
> +-        then {
> +-          USER_UID=`id -u $TEST_USER2`
> +-          USER_GID=`id -g $TEST_USER2`
> +-          mkdir -p $TEST_USER2_HOMEDIR
> +-          chown -R $USER_UID.$USER_GID $TEST_USER2_HOMEDIR
> +-      }
> +-      fi
> +-
> +-        usermod -p $TEST_USER2_ENCRYPTED_PASSWD $TEST_USER2 > /dev/null
> 2>&1
> +-        if [ $? != 0 ]
> +-        then {
> +-                echo "Could not set password for test user $TEST_USER2"
> +-                exit 1
> +-        }
> +-        fi
> +-}
> +-
> +-
> +-#-----------------------------------------------------------------------
> +-# FUNCTION:  do_cleanup
> +-#-----------------------------------------------------------------------
> +-
> +-do_cleanup() {
> +-        rm -rf /home/$TEST_USER1
> +-        rm -rf /home/$TEST_USER2
> +-      userdel $TEST_USER1
> +-      userdel $TEST_USER2
> +-      #REMOVE ANY TEMPOARY FILES THAT MAY STILL BE AROUND
> +-      rm -f $TEST_ENV_FILE_USER > /dev/null 2>&1
> +-      rm -f $TEST_ENV_FILE2 > /dev/null 2>&1
> +-      rm -f $TEST_ENV_FILE > /dev/null 2>&1
> +-}
> +-
> +-#-----------------------------------------------------------------------
> +-# FUNCTION:  MAIN
> +-#-----------------------------------------------------------------------
> +-do_setup
> +-/bin/su $TEST_USER1 -c ${TCbin}/su01_s1
> +-EXIT_CODE=$?
> +-do_cleanup
> +-exit $EXIT_CODE
> +diff --git a/testcases/commands/su/su01_s1 b/testcases/commands/su/su01_s1
> +deleted file mode 100755
> +index 313207b64..000000000
> +--- a/testcases/commands/su/su01_s1
> ++++ /dev/null
> +@@ -1,486 +0,0 @@
> +-#! /usr/bin/expect -f
> +-#*********************************************************************
> +-#   Copyright (c) International Business Machines  Corp., 2003, 2004,
> 2007
> +-#
> +-#   This program is free software;  you can redistribute it and/or modify
> +-#   it under the terms of the GNU General Public License as published by
> +-#   the Free Software Foundation; either version 2 of the License, or
> +-#   (at your option) any later version.
> +-#
> +-#   This program is distributed in the hope that it will be useful,
> +-#   but WITHOUT ANY WARRANTY;  without even the implied warranty of
> +-#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
> +-#   the GNU General Public License for more details.
> +-#
> +-#   You should have received a copy of the GNU General Public License
> +-#   along with this program;  if not, write to the Free Software
> +-#   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
> 02110-1301 USA
> +-#
> +-#  FILE   : su
> +-#
> +-#  PURPOSE: Tests the basic functionality of `su`.
> +-#
> +-#  SETUP: The program `/usr/bin/expect' MUST be installed.
> +-#         The user invoking this test script must NOT be "root".
> +-#               The PASSWD variable should be set prior to execution
> +-#
> +-#  HISTORY:
> +-#     03/03     Dustin Kirkland (dkirklan@us.ibm.com)
> +-#     03/03     Jerone Young    (jeroney@us.ibm.com)
> +-#     10/01/04  Kris Wilson     Skip test 7 if RedHat; no -e option.
> +-#     05/23/07  Kris Wilson     Make test 7 work for SLES.
> +-########################################################################
> +-
> +-# The root user cannot succesfully execute su test because the root user
> +-# is able to become anyone without entering passwords
> +-set whoami [ exec whoami ]
> +-if { $whoami=="root" } {
> +-  send_user "ERROR: You must execute the 'su' tests as a non-root user\n"
> +-  exit 1
> +-}
> +-
> +-#Grab input from enviroment
> +-if [info exists env(PASSWD)] {
> +-      set PASSWD $env(PASSWD)
> +-} else {
> +-      send_user "YOU NEED TO SET ENVIROMENT VARIABLE PASSWD. \n"
> +-      exit 1
> +-}
> +-
> +-if [info exists env(TEST_USER2)] {
> +-  set USER1 $env(TEST_USER2)
> +-} else {
> +-      send_user "YOU MUST SET ENVIRONMENT VARIABLE TEST_USER2"
> +-      exit 1
> +-}
> +-
> +-# Need the release type from su01
> +-if [info exists env(tvar)] {
> +-  set distro $env(tvar)
> +-} else {
> +-        send_user "YOU MUST SET ENVIORMENT VARIABLE tvar"
> +-        exit 1
> +-}
> +-
> +-if [info exists env(TEST_USER2_PASSWD)] {
> +-  set USER1_PASSWORD $env(TEST_USER2_PASSWD)
> +-} else {
> +-  send_user "YOU MUST SET ENVIROMENT VARIABLE TEST_USER2_PASSWD"
> +-  exit 1
> +-}
> +-
> +-if [info exists env(TEST_LINE)] {
> +-  set TEST_LINE_ENV $env(TEST_LINE)
> +-} else {
> +-  send_user "YOU MUST SET ENVIROMENT VARIABLE TEST_LINE"
> +-  exit 1
> +-}
> +-
> +-
> +-if [info exists env(TEST_ENV_FILE)] {
> +-  set TEST_ENV_FILE $env(TEST_ENV_FILE)
> +-} else {
> +-  send_user "YOU MUST SET ENVIROMENT VARIABLE TEST_ENV_FILE_USER"
> +-  exit 1
> +-}
> +-
> +-if [info exists env(TEST_ENV_FILE2)] {
> +-  set TEST_ENV_FILE2 $env(TEST_ENV_FILE2)
> +-} else {
> +-  send_user "YOU MUST SET ENVIROMENT VARIABLE TEST_ENV_FILE2"
> +-  exit 1
> +-}
> +-
> +-
> +-if [info exists env(TEST_ENV_FILE_USER)] {
> +-  set TEST_ENV_FILE_USER1 $env(TEST_ENV_FILE_USER)
> +-} else {
> +-  send_user "YOU MUST SET ENVIROMENT VARIABLE TEST_ENV_FILE_USER"
> +-  exit 1
> +-}
> +-
> +-if [info exists env(TEST_USER1_NEW_PASSWD)] {
> +-  set USER1_NEW_PASSWORD $env(TEST_USER1_NEW_PASSWD)
> +-} else {
> +-  send_user "YOU MUST SET ENVIROMENT VARIABLE TEST_USER1_NEW_PASSWD"
> +-  exit 1
> +-}
> +-
> +-
> +-set script_exit_code 0
> +-set i_can_root 0
> +-
> +-send_user "Starting 'su' Testing\n"
> +-
> +-# 1) su with no parameters and correct password.
> +-#    - The su command should return a result code of 0
> +-#    - The user ID should be root
> +-#    - The user environment should be that of the invoking process
> +-#    - The command should create a new shell with a new process ID
> +-
> +-send_user "\nTEST: su with no parameters and correct password\n"
> +-
> +-set i_am_root 0
> +-# run "whoami" to test user ID inside su shell
> +-spawn /bin/su -c whoami
> +-set i_am_root 0
> +-expect {
> +-  "Password:" {
> +-      send "$PASSWD\r"
> +-    expect {
> +-      "root" { set i_am_root 1
> +-              set i_can_root 1
> +-       }
> +-    }
> +-  }
> +-}
> +-
> +-# capture result code
> +-set codes [wait]
> +-set pid [lindex $codes 0]
> +-set exit_code [lindex $codes 3]
> +-
> +-#Check that su user has same enviroment as current user
> +-set i_have_env 0
> +-set test_env_var " "
> +-if { $i_am_root==1 } {
> +-      spawn su -c "/bin/su root -c \"echo \\\$TEST_LINE >
> $TEST_ENV_FILE\""
> +-      expect {
> +-               "Password:" {
> +-                      send "$PASSWD\r"
> +-              }
> +-      }
> +-      expect eof
> +-      wait
> +-
> +-      set test_env_var [exec cat $TEST_ENV_FILE]
> +-
> +-      if  { $test_env_var==$TEST_LINE_ENV } {
> +-              set i_have_env 1
> +-      } else {
> +-              send_user "/bin/su with correct password (FAILED), the
> enviroment was not kept after su.\n"
> +-      }
> +-}
> +-
> +-
> +-#this variable is for any test, it can't run correctly if this test fails
> +-set test_one_passed 0
> +-
> +-if { ($i_am_root==1) && ($exit_code==0) && ($pid>0) && ($i_have_env==1)
> } {
> +-      send_user "/bin/su with correct password & enviroment check (
> PASSED )\n"
> +-      set test_one_passed 1
> +-} else {
> +-      send_user "/bin/su with correct password ( FAILED )\n"
> +-    set script_exit_code 1
> +-}
> +-
> +-
> +-# 2) su with no parameters and incorrect password.
> +-#       - The su command should return a result code of non-0
> +-#     - The user should be returned to the invoking shell
> +-#     - An appropriate failure message should be displayed
> +-
> +-send_user "\nTEST: su with no parameters and incorrect password \n"
> +-
> +-set displayed_error 0
> +-# run "whoami" to test user ID inside su shell
> +-spawn /bin/su -c whoami
> +-set displayed_error 0
> +-expect {
> +-  "Password:" {
> +-    send "wrong_$PASSWD\r"
> +-    expect {
> +-                              "su: incorrect password" { set
> displayed_error 1 }
> +-                              "su: Authentication failure" { set
> displayed_error 1 }
> +-    }
> +-  }
> +-}
> +-
> +-# capture result code
> +-set codes [wait]
> +-set pid [lindex $codes 0]
> +-set exit_code [lindex $codes 3]
> +-
> +-#Added for arm architecture
> +-
> +-send_user "\ndisplayed_error=$displayed_error"
> +-send_user "\nexit_code=$exit_code"
> +-send_user "\npid=$pid\n"
> +-
> +-if { ($displayed_error==1) && ($exit_code!=0) && ($pid>0) } {
> +-  send_user "/bin/su with incorrect password ( PASSED )\n"
> +-} else {
> +-  send_user "/bin/su with incorrect password ( FAILED )\n"
> +-  set script_exit_code 1
> +-}
> +-
> +-# 3) su to root using name parameter and correct password.
> +-# - The su command should return a result code of 0
> +-# - The user ID should be root
> +-# - The user environment should be that of the invoking process
> +-# - The command should create a new shell with a new process ID
> +-
> +-send_user "\nTEST: su to root using name parameter and correct password.
> \n"
> +-
> +-set i_am_root 0
> +-# run "whoami" to test user ID inside su shell
> +-spawn /bin/su -l root -c whoami
> +-expect {
> +-  "Password:" {
> +-    send "$PASSWD\r"
> +-    expect {
> +-                              "root" { set i_am_root 1 }
> +-    }
> +-  }
> +-}
> +-
> +-# capture result code
> +-set codes [wait]
> +-set pid [lindex $codes 0]
> +-set exit_code [lindex $codes 3]
> +-
> +-
> +-#Check that su user does not have the same enviroment as current user
> +-set i_have_env 0
> +-set test_env " "
> +-if { $i_am_root==1 } {
> +-      spawn /bin/sh -c "/bin/su -l root -c \"echo \"\\\$TEST_LINE >
> $TEST_ENV_FILE2\"\""
> +-        expect {
> +-                 "Password:" {
> +-                      send "$PASSWD\r"
> +-                }
> +-        }
> +-
> +-      set test_env [exec cat $TEST_ENV_FILE2]
> +-
> +-      if  { $test_env==$TEST_LINE_ENV } {
> +-              set i_have_env 1
> +-              send_user "/bin/su -l root with correct password (FAILED),
> because it did not change enviroment\n"
> +-      }
> +-}
> +-
> +-
> +-if { ($i_am_root==1) && ($exit_code==0) && ($pid>0) && ($i_have_env==0)
> } {
> +-  send_user "/bin/su -l root with correct password & enviroment check (
> PASSED )\n"
> +-} else {
> +-  send_user "/bin/su -l root with correct password ( FAILED )\n"
> +-  set script_exit_code 1
> +-}
> +-
> +-
> +-# 4) su to root with name parameter and incorrect password.
> +-#    - The su command should return a result code of non-0
> +-#    - The user should be returned to the invoking shell
> +-#    - An appropriate failure message should be displayed
> +-
> +-send_user "\nTEST: su to root with name parameter and incorrect
> password. \n"
> +-
> +-set displayed_error 0
> +-# run "whoami" to test user ID inside su shell
> +-spawn /bin/su -l root -c whoami
> +-expect {
> +-  "Password:" {
> +-    send "wrong_$PASSWD\r"
> +-    expect {
> +-                              "su: incorrect password" { set
> displayed_error 1 }
> +-                              "su: Authentication failure" { set
> displayed_error 1 }
> +-    }
> +-  }
> +-}
> +-
> +-# capture result code
> +-set codes [wait]
> +-set pid [lindex $codes 0]
> +-set exit_code [lindex $codes 3]
> +-if { ($displayed_error==1) && ($exit_code!=0) && ($pid>0) } {
> +-  send_user "/bin/su -l root with incorrect password ( PASSED )\n"
> +-} else {
> +-  send_user "/bin/su -l root with incorrect password ( FAILED )\n"
> +-  set script_exit_code 1
> +-}
> +-
> +-
> +-# 5) su to user1 with name parameter and correct password.
> +-#    - The su command should return a result code of 0
> +-#    - The user ID should be user1
> +-#    - The user environment should be that of the invoking process, in
> this case,that of user1
> +-#    - The command should create a new shell with a new process ID
> +-#    - Run "whoami" to test user ID inside su shell
> +-
> +-send_user "TEST: su to user1 with name parameter and correct password.\n"
> +-
> +-set i_am_correct 0
> +-spawn /bin/su -l $USER1 -c whoami
> +-expect {
> +-  "Password:" {
> +-    send "$USER1_PASSWORD\r"
> +-    expect {
> +-                              "$USER1\r" { set i_am_correct 1 }
> +-    }
> +-  }
> +-}
> +-
> +-# capture result code
> +-set codes [wait]
> +-set pid [lindex $codes 0]
> +-set exit_code [lindex $codes 3]
> +-
> +-set i_have_env 0
> +-set test_env_var 0
> +-#Check to see that su user does not have the same enviroment
> +-if { $i_am_correct==1 } {
> +-        spawn /bin/sh -c "/bin/su -l $USER1 -c \"echo \"\\\$TEST_LINE >
> $TEST_ENV_FILE_USER1\"\""
> +-        expect {
> +-                 "Password:" {
> +-                                send "$USER1_PASSWORD\r"
> +-                }
> +-        }
> +-
> +-}
> +-
> +-set test_env_var [exec cat $TEST_ENV_FILE_USER1]
> +-
> +-set i_have_env 0
> +-if  { $test_env_var==$TEST_LINE_ENV } {
> +-        set i_have_env 1
> +-        send_user "/bin/su -l $USER1 with correct password (FAILED),
> because it did not change enviroment\n"
> +-      set i_have_env 0
> +-      if  { $test_env_var==$TEST_LINE_ENV } {
> +-              set i_have_env 1
> +-              send_user "su -l $USER1 with correct password (FAILED),
> because it did not change enviroment\n"
> +-      }
> +-}
> +-
> +-if { ($i_am_correct==1) && ($exit_code==0) && ($pid>0) &&
> ($i_have_env==0) } {
> +-  send_user "/bin/su -l $USER1 with correct password & enviroment check
> ( PASSED )\n"
> +-} else {
> +-  send_user "/bin/su -l $USER1 with correct password ( FAILED )\n"
> +-  set script_exit_code 1
> +-}
> +-
> +-
> +-
> +-# 6)su to user1 with name parameter and incorrect password.
> +-#    - The su command should return a result code of non-0
> +-#    - The user should be returned to the invoking shell
> +-#    - An appropriate failure message should be displayed.
> +-
> +-send_user "TEST: su to user1 with name parameter and incorrect
> password.\n"
> +-spawn /bin/su -l $USER1 -c whoami
> +-set displayed_error 0
> +-expect {
> +-  "Password:" {
> +-    send "wrong_$USER1_PASSWORD\r"
> +-    expect {
> +-                              "su: incorrect password" { set
> displayed_error 1 }
> +-                              "su: Authentication failure" { set
> displayed_error 1 }
> +-    }
> +-  }
> +-}
> +-
> +-# capture result code
> +-set codes [wait]
> +-set pid [lindex $codes 0]
> +-set exit_code [lindex $codes 3]
> +-if { ($displayed_error==1) && ($exit_code!=0) && ($pid>0) } {
> +-      send_user "/bin/su -l $USER1 with incorrect password ( PASSED )\n"
> +-} else {
> +-      send_user "/bin/su -l $USER1 with incorrect password ( FAILED )\n"
> +-      set script_exit_code 1
> +-}
> +-
> +-
> +-# 7) su to user1 with the user1 password expired
> +-#    - user1 should not be allowed to log in
> +-#    - The su command should return a result code of non-0
> +-#    - The user should be returned to the invoking shell
> +-#    - An appropriate failure message should be displayed.
> +-
> +-# Become root and expire $USER1 password
> +-
> +-#  Skip this if Red Hat; -e option not supported.
> +-if { $distro != "redhat" && $distro != "redhat-linux" } {
> +-
> +-if { $test_one_passed==1} {
> +-send_user "TEST:  su to user1 with the user1 password expired.\n"
> +-
> +-spawn /bin/su -l root -c "passwd -e $USER1"
> +-expect {
> +-  "Password:" {
> +-    send "$PASSWD\r"
> +-    expect {
> +-                              "Password expiry information changed."
> +-    }
> +-  }
> +-}
> +-
> +-set i_am_correct 0
> +-spawn /bin/su -l $USER1 -c whoami
> +-expect {
> +-  "Password:" {
> +-    send "$USER1_PASSWORD\r"
> +-    expect {
> +-        -re "current.*password|Old Password" {
> +-        send "wrong_$USER1_PASSWORD\r"
> +-        expect {
> +-                -re "current.*password|Old Password" {
> +-          send "wrong_$USER1_PASSWORD\r"
> +-            expect {
> +-                                                              "su:
> incorrect password" { set i_am_correct 1 }
> +-                                                              "su:
> Authentication failure" { set i_am_correct 1 }
> +-                                                              "su:
> Authentication token manipulation error" { set i_am_correct 1 }
> +-            }
> +-          }
> +-                                      "su: incorrect password" { set
> i_am_correct 1 }
> +-                                      "su: Authentication failure" { set
> i_am_correct 1 }
> +-                                      "su: Authentication token
> manipulation error" { set i_am_correct 1 }
> +-        }
> +-      }
> +-    }
> +-  }
> +-}
> +-
> +-# capture result code
> +-set codes [wait]
> +-set pid [lindex $codes 0]
> +-set exit_code [lindex $codes 3]
> +-if { ($i_am_correct==1) && ($exit_code!=0) && ($pid>0) } {
> +-      send_user "/bin/su -l $USER1 with expired correct password (
> PASSED )\n"
> +-} else {
> +-      send_user "/bin/su -l $USER1 with expired correct password (
> FAILED )\n"
> +-      set script_exit_code 1
> +-}
> +-
> +-
> +-#Become root and set $USER1 password back to previous value
> +-spawn /bin/su -l root -c "passwd $USER1"
> +-expect {
> +-  "Password: " {
> +-    send "$PASSWD\r"
> +-    expect {
> +-     "Enter new password: " {
> +-        send "$USER1_NEW_PASSWORD\r"
> +-        expect {
> +-          "Re-type new password: " {
> +-            send "$USER1_NEW_PASSWORD\r"
> +-            expect {
> +-              "Password changed" {}
> +-            }
> +-          }
> +-        }
> +-      }
> +-    }
> +-  }
> +-}
> +-
> +-} else {
> +-
> +-      send_user "TEST:  su to user1 with the user1 password expired.
> (FAILED),see more next line.\n"
> +-      send_user "This test cannot be run because the first test to su as
> root failed\n"
> +-
> +-}
> +-# If RH let the tester know why only 6 tests were run.
> +-} else {
> +-  send_user "TEST 7 skipped if running on Red Hat; -e not supported \n"
> +-}
> +-exit  $script_exit_code
> +diff --git a/testcases/commands/su/su_set_passwd
> b/testcases/commands/su/su_set_passwd
> +deleted file mode 100755
> +index e8f0d2f50..000000000
> +--- a/testcases/commands/su/su_set_passwd
> ++++ /dev/null
> +@@ -1,14 +0,0 @@
> +-#!/bin/sh
> +-#
> +-# Set Password for a specific new user
> +-# This script should be run as 'root'
> +-#
> +-# Example:
> +-#             ./su_set_passwd USER ENCRYPTED_PASSWD
> +-#
> +-
> +-USER=$1
> +-ENCRYPTED_PASSWD=$2
> +-
> +-usermod -p $ENCRYPTED_PASSWD $USER
> +-exit $?
> +diff --git a/testcases/kernel/fs/acls/.gitignore
> b/testcases/kernel/fs/acls/.gitignore
> +deleted file mode 100644
> +index 5fa2fc654..000000000
> +--- a/testcases/kernel/fs/acls/.gitignore
> ++++ /dev/null
> +@@ -1,2 +0,0 @@
> +-/acl_file_test
> +-/acl_link_test
> +diff --git a/testcases/kernel/fs/acls/Makefile
> b/testcases/kernel/fs/acls/Makefile
> +deleted file mode 100644
> +index 4f1564377..000000000
> +--- a/testcases/kernel/fs/acls/Makefile
> ++++ /dev/null
> +@@ -1,40 +0,0 @@
> +-#
> +-#    kernel/fs/acls testcases Makefile.
> +-#
> +-#    Copyright (C) 2009, Cisco Systems Inc.
> +-#
> +-#    This program is free software; you can redistribute it and/or modify
> +-#    it under the terms of the GNU General Public License as published by
> +-#    the Free Software Foundation; either version 2 of the License, or
> +-#    (at your option) any later version.
> +-#
> +-#    This program is distributed in the hope that it will be useful,
> +-#    but WITHOUT ANY WARRANTY; without even the implied warranty of
> +-#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +-#    GNU General Public License for more details.
> +-#
> +-#    You should have received a copy of the GNU General Public License
> along
> +-#    with this program; if not, write to the Free Software Foundation,
> Inc.,
> +-#    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> +-#
> +-# Ngie Cooper, July 2009
> +-#
> +-
> +-top_srcdir            ?= ../../../..
> +-
> +-include $(top_srcdir)/include/mk/env_pre.mk
> +-
> +-check_header = $(shell \
> +-      if echo "\#include <$(1)>" | $(CC) -E - > /dev/null 2>&1 ; \
> +-      then echo yes ; \
> +-      else echo no ; fi)
> +-
> +-INSTALL_TARGETS               := acl_test01
> +-
> +-RESULT                        := $(call check_header,sys/xattr.h)
> +-
> +-ifneq ($(RESULT),yes)
> +-MAKE_TARGETS          :=
> +-endif
> +-
> +-include $(top_srcdir)/include/mk/generic_leaf_target.mk
> +diff --git a/testcases/kernel/fs/acls/acl_file_test.c
> b/testcases/kernel/fs/acls/acl_file_test.c
> +deleted file mode 100644
> +index eb30d28ef..000000000
> +--- a/testcases/kernel/fs/acls/acl_file_test.c
> ++++ /dev/null
> +@@ -1,73 +0,0 @@
> +-#include <unistd.h>
> +-#include <stdio.h>
> +-#include <sys/types.h>
> +-#include <errno.h>
> +-#include <sys/syscall.h>
> +-#include <fcntl.h>
> +-#include <sys/xattr.h>
> +-#include <string.h>
> +-
> +-int main(int argc, char *argv[])
> +-{
> +-      ssize_t s;
> +-      char *tok;
> +-      char value[1024];
> +-      char list[1024];
> +-      int rc = 0;
> +-      char *file;
> +-      int fd;
> +-
> +-      if (argc < 2) {
> +-              printf("Please enter a file name as argument.\n");
> +-              return -1;
> +-      }
> +-
> +-      file = argv[1];
> +-
> +-      fd = open(file, O_RDONLY);
> +-      if (fd < 0) {
> +-              printf("Unable to open file %s !", file);
> +-              return -1;
> +-      }
> +-
> +-      if (-1 == (s = flistxattr(fd, list, 1024))) {
> +-              perror("flistxattr");
> +-              return 1;
> +-      }
> +-      if (s == 0) {
> +-              printf("No xattrs defined for %s, further testcase
> useless\n",
> +-                     file);
> +-              return 1;
> +-      }
> +-      tok = strtok(list, "\0");
> +-      s = fgetxattr(fd, tok, (void *)value, 1024);
> +-      if (s == -1) {
> +-              perror("fgetxattr");
> +-              return 1;
> +-      }
> +-      s = fsetxattr(fd, tok, (void *)value, s, 0);
> +-
> +-      if (s == -1) {
> +-              printf
> +-                  ("User unable to change extended attributes on file %s
> !\n",
> +-                   argv[1]);
> +-              printf("errno = %i\n", errno);
> +-              rc = 1;
> +-      }
> +-      //s = syscall(237, fd,tok); //fremovexattr
> +-#ifdef __NR_fremovexattr
> +-      s = syscall(__NR_fremovexattr, fd, tok);        //fremovexattr
> +-#else
> +-      s = -1;
> +-      errno = ENOSYS;
> +-#endif
> +-      if (s == -1) {
> +-              printf("User unable to remove extended attributes file %s
> !\n",
> +-                     argv[1]);
> +-              printf("errno = %i\n", errno);
> +-              rc = 1;
> +-      }
> +-
> +-      close(fd);
> +-      return rc;
> +-}
> +diff --git a/testcases/kernel/fs/acls/acl_link_test.c
> b/testcases/kernel/fs/acls/acl_link_test.c
> +deleted file mode 100644
> +index 312f686a1..000000000
> +--- a/testcases/kernel/fs/acls/acl_link_test.c
> ++++ /dev/null
> +@@ -1,56 +0,0 @@
> +-#include <unistd.h>
> +-#include <stdio.h>
> +-#include <sys/types.h>
> +-#include <errno.h>
> +-#include <sys/syscall.h>
> +-#include <string.h>
> +-#include <sys/xattr.h>
> +-
> +-int main(int argc, char *argv[])
> +-{
> +-      ssize_t s;
> +-      char *tok;
> +-      char value[1024];
> +-      char list[1024];
> +-      int rc = 0;
> +-
> +-      if (argc < 2) {
> +-              printf("Please enter a file name as argument.\n");
> +-              return -1;
> +-      }
> +-
> +-      if (-1 == (s = listxattr(argv[1], list, 1024))) {
> +-              perror("listxattr");
> +-              return 1;
> +-      }
> +-      if (s == 0) {
> +-              printf("No xattrs defined for %s, further testcase
> useless\n",
> +-                     argv[1]);
> +-              return 1;
> +-      }
> +-      tok = strtok(list, "\0");
> +-      s = getxattr(argv[1], tok, (void *)value, 1024);
> +-      if (-1 == s) {
> +-              perror("getxattr");
> +-              return -1;
> +-      }
> +-
> +-      s = lsetxattr(argv[1], tok, (void *)value, s, 0);
> +-
> +-      if (s == -1) {
> +-              printf("User unable to change extended attributes %s !\n",
> +-                     argv[1]);
> +-              printf("errno = %i\n", errno);
> +-              rc = 1;
> +-      }
> +-
> +-      s = lremovexattr(argv[1], tok);
> +-      if (s == -1) {
> +-              printf("User unable to remove extended attributes %s !\n",
> +-                     argv[1]);
> +-              printf("errno = %i\n", errno);
> +-              rc = 1;
> +-      }
> +-
> +-      return rc;
> +-}
> +diff --git a/testcases/kernel/fs/acls/acl_test01
> b/testcases/kernel/fs/acls/acl_test01
> +deleted file mode 100755
> +index 4fbd72f75..000000000
> +--- a/testcases/kernel/fs/acls/acl_test01
> ++++ /dev/null
> +@@ -1,186 +0,0 @@
> +-#!/bin/sh
> +-#*********************************************************************
> +-#   Copyright (c) International Business Machines  Corp., 2003
> +-#
> +-#   This program is free software;  you can redistribute it and/or modify
> +-#   it under the terms of the GNU General Public License as published by
> +-#   the Free Software Foundation; either version 2 of the License, or
> +-#   (at your option) any later version.
> +-#
> +-#   This program is distributed in the hope that it will be useful,
> +-#   but WITHOUT ANY WARRANTY;  without even the implied warranty of
> +-#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
> +-#   the GNU General Public License for more details.
> +-#
> +-#   You should have received a copy of the GNU General Public License
> +-#   along with this program;  if not, write to the Free Software
> +-#   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
> 02110-1301 USA
> +-#
> +-#
> +-#
> +-#  FILE   : acls
> +-#
> +-#  PURPOSE: Tests extended acls
> +-#
> +-#  HISTORY:
> +-#    03/03 Jerone Young  (jyoung5@us.ibm.com)
> +-#    09/08 Jacky Malcles changing the setup to have this TC started by
> runltp
> +-#*********************************************************************
> +-#
> +-################################################################
> +-#
> +-# Make sure that uid=root is running this script.
> +-# Make sure that loop device is built into the kernel
> +-# Make sure that ACL(Access Control List) and Extended Attribute are
> +-#     built into the kernel
> +-#
> +-#
> +-################################################################
> +-
> +-export TCID=acltest01
> +-export TST_TOTAL=5
> +-export TST_COUNT=1
> +-
> +-. test.sh
> +-
> +-TMP=${TMP:=/tmp}
> +-
> +-TEST_USER1="acltest1"
> +-TEST_USER1_GROUP="users"
> +-TEST_USER1_PASSWD="ltp_test_pass1"
> +-TEST_USER1_HOMEDIR="$TMP/tacl/mount-ext3/$TEST_USER1"
> +-
> +-FILE_ACL="$TMP/tacl/mount-ext3/test_file"
> +-FILE_ACL_LINK="$TMP/tacl/mount-ext3/test_file_link"
> +-TCbin=`pwd`
> +-
> +-COMMAND=$(command -v "getenforce" "setenforce" |wc -l)
> +-if [ $COMMAND -eq 2 ]; then
> +-      SELINUX=$(getenforce)
> +-else
> +-      SELINUX=""
> +-fi
> +-
> +-do_setup()
> +-{
> +-      tst_require_root
> +-      tst_test_cmds setfacl
> +-
> +-      if ! ( test -d $TMP/tacl || mkdir -m 777 $TMP/tacl) ; then
> +-              tst_brkm TBROK "Failed to create $TMP/tacl directory."
> +-      fi
> +-
> +-      dd if=/dev/zero of=$TMP/tacl/blkext3 bs=1k count=10240 && chmod
> 777 $TMP/tacl/blkext3
> +-      if [ $? -ne 0 ] ; then
> +-              tst_brkm TBROK "Failed to create $TMP/tacl/blkext3"
> +-      fi
> +-
> +-      if ! LOOP_DEV=$(losetup -f) || [ "x$LOOP_DEV" = x ]; then
> +-              tst_brkm TCONF "[ losetup.1 ] Failed to find an available
> loopback device -- is the required support compiled in your kernel?"
> +-      fi
> +-
> +-      if ! losetup $LOOP_DEV $TMP/tacl/blkext3 > /dev/null 2>&1; then
> +-              echo ""
> +-              tst_brkm TCONF "[ losetup.2 ] Failed to setup the device."
> +-      fi
> +-
> +-      mount | grep ext2
> +-      if [ $? -ne 0 ]; then
> +-              mkfs -t ext3 $LOOP_DEV #> /dev/null 2>&1
> +-              mkdir  -m 777 $TMP/tacl/mount-ext3
> +-              mount -t ext3 -o defaults,acl,user_xattr $LOOP_DEV
> $TMP/tacl/mount-ext3
> +-              if [ $? -ne 0 ]; then
> +-                      tst_resm TCONF "[ mount ] Make sure that ACL
> (Access Control List)"
> +-                      tst_resm TCONF "\t and Extended Attribute are
> built into the kernel\n"
> +-                      tst_brkm TCONF "\t Can not mount ext3 file system
> with acl and user_xattr options\n"
> +-              fi
> +-      else
> +-              mkfs -t ext2 $LOOP_DEV
> +-              mkdir  -m 777 $TMP/tacl/mount-ext3
> +-              mount -t ext2 -o defaults,acl,user_xattr $LOOP_DEV
> $TMP/tacl/mount-ext3
> +-              if [ $? -ne 0 ]; then
> +-                      tst_resm TCONF "FAILED: [ mount ] Make sure that
> ACL (Access Control List)"
> +-                      tst_resm TCONF "\t and Extended Attribute are
> built into the kernel\n"
> +-                      tst_brkm TCONF "\t Can not mount ext2 file system
> with acl and user_xattr options\n"
> +-              fi
> +-      fi
> +-
> +-      # We couldn't consider whether the SElinux is Disable or
> Permissive.
> +-      # We only set it to Permissive when it it Enforcing.
> +-      if [ "$SELINUX" = "Enforcing" ]; then
> +-              echo "set the SElinux to Permissive."
> +-              setenforce 0
> +-      fi
> +-
> +-      userdel $TEST_USER1 > /dev/null 2>&1
> +-      useradd -d $TEST_USER1_HOMEDIR -m -g $TEST_USER1_GROUP $TEST_USER1
> -s /bin/sh
> +-      if [ $? -ne 0 ]; then
> +-              tst_brkm TBROK "Could not add test user $TEST_USER1."
> +-      fi
> +-}
> +-
> +-do_cleanup()
> +-{
> +-      userdel $TEST_USER1 > /dev/null 2>&1
> +-      rm -f $FILE_ACL > /dev/null 2>&1
> +-      rm -f $FILE_ACL_LINK > /dev/null 2>&1
> +-      mount | grep -q "$TMP/tacl/mount-ext3" && umount -d
> $TMP/tacl/mount-ext3
> +-      rm -rf $TMP/tacl
> +-
> +-      # We set it back to Enforcing.
> +-      if [ "$SELINUX" = "Enforcing" ]; then
> +-              echo "set the SElinux back to Enforcing."
> +-              setenforce 1
> +-      fi
> +-}
> +-
> +-do_setup
> +-TST_CLEANUP=do_cleanup
> +-
> +-tst_resm TINFO "Testing ACL for root"
> +-
> +-touch $FILE_ACL
> +-touch $FILE_ACL_LINK
> +-
> +-#setup files for extended attributes
> +-setfacl -mu:root:r $FILE_ACL_LINK
> +-setfacl -mu:root:r $FILE_ACL
> +-
> +-acl_file_test $FILE_ACL
> +-if [ $? -ne 0 ]; then
> +-      tst_resm TFAIL "Extended acls for files."
> +-else
> +-      tst_resm TPASS "Extended acls for files."
> +-fi
> +-
> +-acl_link_test $FILE_ACL_LINK
> +-if [ $? -ne 0 ]; then
> +-      tst_resm TFAIL "Extended acls for links."
> +-else
> +-      tst_resm TPASS "Extended acls for links."
> +-fi
> +-
> +-chown $TEST_USER1 $FILE_ACL
> +-chown $TEST_USER1 $FILE_ACL_LINK
> +-
> +-tst_resm TINFO "Testing ACL for $TEST_USER1"
> +-
> +-#setup files for extended attributes
> +-setfacl -m u:$TEST_USER1:r $FILE_ACL_LINK
> +-setfacl -m u:$TEST_USER1:r $FILE_ACL
> +-
> +-tst_su $TEST_USER1 "acl_file_test $FILE_ACL"
> +-if [ $? -ne 0 ]; then
> +-      tst_resm TFAIL "Extended acls for files."
> +-else
> +-      tst_resm TPASS "Extended acls for files."
> +-fi
> +-
> +-tst_su $TEST_USER1 "acl_link_test $FILE_ACL_LINK"
> +-if [ $? -ne 0 ]; then
> +-      tst_resm TFAIL "Extended acls for links."
> +-else
> +-      tst_resm TPASS "Extended acls for links."
> +-fi
> +-
> +-tst_exit
> +--
> +2.11.0
> +
> diff --git a/meta/recipes-extended/ltp/ltp_20180926.bb
> b/meta/recipes-extended/ltp/ltp_20180926.bb
> index 6cfcaa5832..36d95b23f9 100644
> --- a/meta/recipes-extended/ltp/ltp_20180926.bb
> +++ b/meta/recipes-extended/ltp/ltp_20180926.bb
> @@ -53,6 +53,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
>             file://0001-statx-fix-compile-errors.patch \
>
> file://0001-setrlimit05-Use-another-method-to-get-bad-address.patch \
>
> file://0001-getcpu01-Rename-getcpu-to-avoid-conflict-with-glibc-.patch \
> +           file://0001-Remove-admin_tools-test.patch \
>             "
>
>  S = "${WORKDIR}/git"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000186493057f68e71e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Missing your Signed-off-by and Upstream-Status in the patc=
h.<div><br></div><div>Ross</div></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr">On Mon, 14 Jan 2019 at 07:47, He Zhe &lt;<a href=3D"mailto:zhe.h=
e@windriver.com">zhe.he@windriver.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1p=
x;border-left-style:solid;border-left-color:rgb(204,204,204);padding-left:1=
ex">admin_tools test group has been removed from upstream. Backport to fix =
the<br>
following failures.<br>
<br>
at_deny01 1 TFAIL : ltpapicmd.c:188: At denyed user to execute test job<br>
at_allow01 1 TFAIL : ltpapicmd.c:188: At did not allow user to execute job<=
br>
<br>
Signed-off-by: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com" target=3D=
"_blank">zhe.he@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../ltp/ltp/0001-Remove-admin_tools-test.patch=C2=A0 =C2=A0 =C2=A0| 3=
037 ++++++++++++++++++++<br>
=C2=A0meta/recipes-extended/ltp/<a href=3D"http://ltp_20180926.bb" rel=3D"n=
oreferrer" target=3D"_blank">ltp_20180926.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
=C2=A02 files changed, 3038 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-extended/ltp/ltp/0001-Remove-admin_to=
ols-test.patch<br>
<br>
diff --git a/meta/recipes-extended/ltp/ltp/0001-Remove-admin_tools-test.pat=
ch b/meta/recipes-extended/ltp/ltp/0001-Remove-admin_tools-test.patch<br>
new file mode 100644<br>
index 0000000000..b740f22355<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/ltp/ltp/0001-Remove-admin_tools-test.patch<br>
@@ -0,0 +1,3037 @@<br>
+From 0fc9b8624bea8acfdb408bf5ff4916b1453e3daa Mon Sep 17 00:00:00 2001<br>
+From: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_blank">p=
vorel@suse.cz</a>&gt;<br>
+Date: Thu, 27 Sep 2018 16:57:20 +0200<br>
+Subject: [PATCH] Remove admin_tools test<br>
+<br>
+Removing cron, at, su related tests as they don&#39;t really fit into<br>
+&quot;kernel testing&quot;, it&#39;d be better to have them in some &quot;=
LTP userspace&quot;<br>
+project.<br>
+ACL are considered as &quot;kernel tests&quot;, but it would be easier to =
write<br>
+something from scratch, thus remove them as well.<br>
+<br>
+Signed-off-by: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"=
_blank">pvorel@suse.cz</a>&gt;<br>
+Acked-by: Xiao Yang &lt;<a href=3D"mailto:yangx.jy@cn.fujitsu.com" target=
=3D"_blank">yangx.jy@cn.fujitsu.com</a>&gt;<br>
+Acked-by: Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.com" target=3D=
"_blank">jstancek@redhat.com</a>&gt;<br>
+Acked-by: Cyril Hrubis &lt;<a href=3D"mailto:chrubis@suse.cz" target=3D"_b=
lank">chrubis@suse.cz</a><br>
+---<br>
+ runtest/admin_tools=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A09 -<br>
+ runtest/commands=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 -<b=
r>
+ scenario_groups/default=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 -<br>
+ testcases/commands/.gitignore=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 -<br>
+ testcases/commands/at/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 31 --<br>
+ testcases/commands/at/at_allow01=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 | 188 ---------<br>
+ testcases/commands/at/at_deny01=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 195 ----------<br>
+ testcases/commands/cron/00_Descriptions.txt=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A04 -<br>
+ testcases/commands/cron/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 29 --<br>
+ testcases/commands/cron/README.tests=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 25 --<br>
+ testcases/commands/cron/cron02=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 80 ----<br>
+ testcases/commands/cron/cron03=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 83 ----<br>
+ testcases/commands/cron/cron_allow01=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 202 ----------<br>
+ testcases/commands/cron/cron_deny01=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 192 ----------<br>
+ testcases/commands/cron/cron_dirs_check.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 44 ---<br>
+ testcases/commands/cron/cron_dirs_checks01=C2=A0 =C2=A0 =C2=A0 |=C2=A0 46=
 ---<br>
+ testcases/commands/cron/cron_illegal_cron_lines |=C2=A0 39 --<br>
+ testcases/commands/cron/cron_neg_tests.sh=C2=A0 =C2=A0 =C2=A0 =C2=A0| 141=
 -------<br>
+ testcases/commands/cron/cron_pos_tests.sh=C2=A0 =C2=A0 =C2=A0 =C2=A0| 118=
 ------<br>
+ testcases/commands/cron/cron_tests.sh=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 276 --------------<br>
+ testcases/commands/su/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 31 --<br>
+ testcases/commands/su/su01=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 181 ---------<br>
+ testcases/commands/su/su01_s1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 486 ------------------------<br>
+ testcases/commands/su/su_set_passwd=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 14 -<br>
+ testcases/kernel/fs/acls/.gitignore=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A02 -<br>
+ testcases/kernel/fs/acls/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 40 --<br>
+ testcases/kernel/fs/acls/acl_file_test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 73 ----<br>
+ testcases/kernel/fs/acls/acl_link_test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 56 ---<br>
+ testcases/kernel/fs/acls/acl_test01=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 186 ---------<br>
+ 29 files changed, 2774 deletions(-)<br>
+ delete mode 100644 runtest/admin_tools<br>
+ delete mode 100644 testcases/commands/at/Makefile<br>
+ delete mode 100755 testcases/commands/at/at_allow01<br>
+ delete mode 100755 testcases/commands/at/at_deny01<br>
+ delete mode 100644 testcases/commands/cron/00_Descriptions.txt<br>
+ delete mode 100644 testcases/commands/cron/Makefile<br>
+ delete mode 100644 testcases/commands/cron/README.tests<br>
+ delete mode 100755 testcases/commands/cron/cron02<br>
+ delete mode 100755 testcases/commands/cron/cron03<br>
+ delete mode 100755 testcases/commands/cron/cron_allow01<br>
+ delete mode 100755 testcases/commands/cron/cron_deny01<br>
+ delete mode 100644 testcases/commands/cron/cron_dirs_check.c<br>
+ delete mode 100755 testcases/commands/cron/cron_dirs_checks01<br>
+ delete mode 100644 testcases/commands/cron/cron_illegal_cron_lines<br>
+ delete mode 100755 testcases/commands/cron/cron_neg_tests.sh<br>
+ delete mode 100755 testcases/commands/cron/cron_pos_tests.sh<br>
+ delete mode 100644 testcases/commands/cron/cron_tests.sh<br>
+ delete mode 100644 testcases/commands/su/Makefile<br>
+ delete mode 100755 testcases/commands/su/su01<br>
+ delete mode 100755 testcases/commands/su/su01_s1<br>
+ delete mode 100755 testcases/commands/su/su_set_passwd<br>
+ delete mode 100644 testcases/kernel/fs/acls/.gitignore<br>
+ delete mode 100644 testcases/kernel/fs/acls/Makefile<br>
+ delete mode 100644 testcases/kernel/fs/acls/acl_file_test.c<br>
+ delete mode 100644 testcases/kernel/fs/acls/acl_link_test.c<br>
+ delete mode 100755 testcases/kernel/fs/acls/acl_test01<br>
+<br>
+diff --git a/runtest/admin_tools b/runtest/admin_tools<br>
+deleted file mode 100644<br>
+index 0a46468c8..000000000<br>
+--- a/runtest/admin_tools<br>
++++ /dev/null<br>
+@@ -1,9 +0,0 @@<br>
+-su01 export TCbin=3D$LTPROOT/testcases/bin;su01<br>
+-#cron01 cron01<br>
+-cron02 cron02<br>
+-cron_deny01 cron_deny01<br>
+-cron_allow01 cron_allow01<br>
+-cron_dirs_checks01 cron_dirs_checks01<br>
+-at_deny01 at_deny01<br>
+-at_allow01 at_allow01<br>
+-acl_test01 acl_test01<br>
+diff --git a/runtest/commands b/runtest/commands<br>
+index ee7e9f440..462633017 100644<br>
+--- a/runtest/commands<br>
++++ b/runtest/commands<br>
+@@ -5,7 +5,6 @@ ldd01 ldd01<br>
+ nm01 nm01<br>
+ file01 file01.sh<br>
+ tar01=C2=A0 tar_tests.sh<br>
+-cron cron_tests.sh<br>
+ logrotate export TCdat=3D$LTPROOT/testcases/bin; logrotate_tests.sh<br>
+ cpio01 cpio_tests.sh<br>
+ unzip01 unzip01.sh<br>
+diff --git a/scenario_groups/default b/scenario_groups/default<br>
+index 5658a618b..b1739b77e 100644<br>
+--- a/scenario_groups/default<br>
++++ b/scenario_groups/default<br>
+@@ -17,7 +17,6 @@ filecaps<br>
+ cap_bounds<br>
+ fcntl-locktests<br>
+ connectors<br>
+-admin_tools<br>
+ timers<br>
+ power_management_tests<br>
+ numa<br>
+diff --git a/testcases/commands/.gitignore b/testcases/commands/.gitignore=
<br>
+index 9aa1caf6c..0ed343881 100644<br>
+--- a/testcases/commands/.gitignore<br>
++++ b/testcases/commands/.gitignore<br>
+@@ -1,5 +1,4 @@<br>
+ /ldd/datafiles/lddfile.out<br>
+ /ldd/datafiles/*.obj.so<br>
+-/cron/cron_dirs_check<br>
+ /eject/eject_check_tray<br>
+ /insmod/ltp_insmod01.ko<br>
+diff --git a/testcases/commands/at/Makefile b/testcases/commands/at/Makefi=
le<br>
+deleted file mode 100644<br>
+index ca3fb04fe..000000000<br>
+--- a/testcases/commands/at/Makefile<br>
++++ /dev/null<br>
+@@ -1,31 +0,0 @@<br>
+-#<br>
+-#=C2=A0 =C2=A0 commands/at testcases Makefile.<br>
+-#<br>
+-#=C2=A0 =C2=A0 Copyright (C) 2009, Cisco Systems Inc.<br>
+-#<br>
+-#=C2=A0 =C2=A0 This program is free software; you can redistribute it and=
/or modify<br>
+-#=C2=A0 =C2=A0 it under the terms of the GNU General Public License as pu=
blished by<br>
+-#=C2=A0 =C2=A0 the Free Software Foundation; either version 2 of the Lice=
nse, or<br>
+-#=C2=A0 =C2=A0 (at your option) any later version.<br>
+-#<br>
+-#=C2=A0 =C2=A0 This program is distributed in the hope that it will be us=
eful,<br>
+-#=C2=A0 =C2=A0 but WITHOUT ANY WARRANTY; without even the implied warrant=
y of<br>
+-#=C2=A0 =C2=A0 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0=
 See the<br>
+-#=C2=A0 =C2=A0 GNU General Public License for more details.<br>
+-#<br>
+-#=C2=A0 =C2=A0 You should have received a copy of the GNU General Public =
License along<br>
+-#=C2=A0 =C2=A0 with this program; if not, write to the Free Software Foun=
dation, Inc.,<br>
+-#=C2=A0 =C2=A0 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA=
.<br>
+-#<br>
+-# Ngie Cooper, July 2009<br>
+-#<br>
+-<br>
+-top_srcdir=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ?=3D ../../..<br>
+-<br>
+-include $(top_srcdir)/include/mk/<a href=3D"http://env_pre.mk" rel=3D"nor=
eferrer" target=3D"_blank">env_pre.mk</a><br>
+-<br>
+-INSTALL_TARGETS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0:=
=3D at_allow01 at_deny01<br>
+-<br>
+-MAKE_TARGETS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 :=3D<br>
+-<br>
+-include $(top_srcdir)/include/mk/<a href=3D"http://generic_leaf_target.mk=
" rel=3D"noreferrer" target=3D"_blank">generic_leaf_target.mk</a><br>
+diff --git a/testcases/commands/at/at_allow01 b/testcases/commands/at/at_a=
llow01<br>
+deleted file mode 100755<br>
+index c0e9335cf..000000000<br>
+--- a/testcases/commands/at/at_allow01<br>
++++ /dev/null<br>
+@@ -1,188 +0,0 @@<br>
+-#!/bin/sh -u<br>
+-#<br>
+-#=C2=A0 =C2=A0Copyright (C) 2008 CAI Qian &lt;<a href=3D"mailto:caiqian@c=
clom.cn" target=3D"_blank">caiqian@cclom.cn</a>&gt;<br>
+-#=C2=A0 =C2=A0Copyright (c) International Business Machines=C2=A0 Corp., =
2003<br>
+-#<br>
+-#=C2=A0 =C2=A0This program is free software; you can redistribute it and/=
or modify<br>
+-#=C2=A0 =C2=A0it under the terms of the GNU General Public License as pub=
lished by<br>
+-#=C2=A0 =C2=A0the Free Software Foundation; either version 2 of the Licen=
se, or<br>
+-#=C2=A0 =C2=A0(at your option) any later version.<br>
+-#<br>
+-#=C2=A0 =C2=A0This program is distributed in the hope that it will be use=
ful, but<br>
+-#=C2=A0 =C2=A0WITHOUT ANY WARRANTY; without even the implied warranty of<=
br>
+-#=C2=A0 =C2=A0MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 =
See the GNU<br>
+-#=C2=A0 =C2=A0General Public License for more details.<br>
+-#<br>
+-#=C2=A0 =C2=A0You should have received a copy of the GNU General Public L=
icense<br>
+-#=C2=A0 =C2=A0along with this program; if not, write to the Free Software=
<br>
+-#=C2=A0 =C2=A0Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02=
111-1307<br>
+-#=C2=A0 =C2=A0USA<br>
+-#<br>
+-#=C2=A0 =C2=A0FILE: /etc/at.allow<br>
+-#<br>
+-#=C2=A0 =C2=A0PURPOSE: Test that /etc/at.allow , only allows those in the=
 file to<br>
+-#=C2=A0 =C2=A0run cron jobs.<br>
+-#<br>
+-#=C2=A0 =C2=A0HISTORY:<br>
+-#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 04/03 Jerone You=
ng (<a href=3D"mailto:jyoung5@us.ibm.com" target=3D"_blank">jyoung5@us.ibm.=
com</a>)<br>
+-#<br>
+-<br>
+-export TCID=3Dat_allow01<br>
+-export TST_TOTAL=3D1<br>
+-export TST_COUNT=3D1<br>
+-TMP=3D${TMP:=3D/tmp}<br>
+-allow=3D&quot;/etc/at.allow&quot;<br>
+-test_user1=3D&quot;test_user_1&quot;<br>
+-test_user2=3D&quot;test_user_2&quot;<br>
+-test_user1_home=3D&quot;/home/${test_user1}&quot;<br>
+-test_user2_home=3D&quot;/home/${test_user2}&quot;<br>
+-tmpfile=3D&quot;$TMP/at_allow_test&quot;<br>
+-<br>
+-if [ &quot;$(id -ru)&quot; =3D 0 ]; then<br>
+-=C2=A0 =C2=A0 =C2=A0 . cmdlib.sh<br>
+-fi<br>
+-<br>
+-#-----------------------------------------------------------------------<=
br>
+-# FUNCTION:=C2=A0 do_setup<br>
+-#-----------------------------------------------------------------------<=
br>
+-<br>
+-do_setup()<br>
+-{<br>
+-=C2=A0 =C2=A0 =C2=A0 # Move any files that may get in the way.<br>
+-=C2=A0 =C2=A0 =C2=A0 rm &quot;${tmpfile}&quot; &gt;/dev/null 2&gt;&amp;1<=
br>
+-=C2=A0 =C2=A0 =C2=A0 mv &quot;${allow}&quot; &quot;${allow}.old&quot; &gt=
;/dev/null 2&gt;&amp;1<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 # Remove users for clean enviroment.<br>
+-=C2=A0 =C2=A0 =C2=A0 rm -rf &quot;${test_user1_home}&quot; &quot;${test_u=
ser2_home}&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 userdel -r &quot;${test_user1}&quot; &gt;/dev/null 2=
&gt;&amp;1<br>
+-=C2=A0 =C2=A0 =C2=A0 userdel -r &quot;${test_user2}&quot; &gt;/dev/null 2=
&gt;&amp;1<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 # Create the 1st user.<br>
+-=C2=A0 =C2=A0 =C2=A0 if ! useradd -g users -d &quot;${test_user1_home}&qu=
ot; -m &quot;${test_user1}&quot;; then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Could not add=
 test user ${test_user1} to system.&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1<br>
+-=C2=A0 =C2=A0 =C2=A0 fi<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 # Create the 2nd user.<br>
+-=C2=A0 =C2=A0 =C2=A0 if ! useradd -g users -d &quot;${test_user2_home}&qu=
ot; -m &quot;${test_user2}&quot;; then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Could not add=
 test user ${test_user2} to system.&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1<br>
+-=C2=A0 =C2=A0 =C2=A0 fi<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 # This is the workaround for a potential bug.<br>
+-=C2=A0 =C2=A0 =C2=A0 # [Bug 468337] At Refuse to Work with Non-login Shel=
l<br>
+-=C2=A0 =C2=A0 =C2=A0 # <a href=3D"https://bugzilla.redhat.com/show_bug.cg=
i?id=3D468337" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.redhat=
.com/show_bug.cgi?id=3D468337</a><br>
+-=C2=A0 =C2=A0 =C2=A0 # As we are running in non-login shell now, we canno=
t run the script<br>
+-=C2=A0 =C2=A0 =C2=A0 # by simply given it a relative path. Therefore, we =
copy it to test<br>
+-=C2=A0 =C2=A0 =C2=A0 # users&#39; home directories, and run it from there=
.<br>
+-=C2=A0 =C2=A0 =C2=A0 cp &quot;$0&quot; &quot;${test_user1_home}/.&quot; &=
amp;&amp;<br>
+-=C2=A0 =C2=A0 =C2=A0 cp &quot;$0&quot; &quot;${test_user2_home}/.&quot; &=
amp;&amp;<br>
+-=C2=A0 =C2=A0 =C2=A0 echo &quot;export LTPROOT=3D&#39;$LTPROOT&#39;&quot;=
 &gt; &quot;${test_user1_home}/cached_ltproot&quot; &amp;&amp;<br>
+-=C2=A0 =C2=A0 =C2=A0 echo &quot;export LTPROOT=3D&#39;$LTPROOT&#39;&quot;=
 &gt; &quot;${test_user2_home}/cached_ltproot&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 if [ $? -ne 0 ]; then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_resm TBROK &quot;Cou=
ldn&#39;t copy over req&#39;d files for test users&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1<br>
+-=C2=A0 =C2=A0 =C2=A0 fi<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 restart_daemon atd<br>
+-}<br>
+-<br>
+-#-----------------------------------------------------------------------<=
br>
+-# FUNCTION:=C2=A0 do_cleanup<br>
+-#-----------------------------------------------------------------------<=
br>
+-do_cleanup()<br>
+-{<br>
+-=C2=A0 =C2=A0 =C2=A0 # We forcefully remove those files anyway. Otherwise=
 userdel may<br>
+-=C2=A0 =C2=A0 =C2=A0 # give us bad warnings.<br>
+-=C2=A0 =C2=A0 =C2=A0 rm -rf &quot;${test_user1_home}&quot; &quot;${test_u=
ser2_home}&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 userdel -r &quot;${test_user1}&quot; &gt;/dev/null 2=
&gt;&amp;1<br>
+-=C2=A0 =C2=A0 =C2=A0 userdel -r &quot;${test_user2}&quot; &gt;/dev/null 2=
&gt;&amp;1<br>
+-=C2=A0 =C2=A0 =C2=A0 rm &quot;${allow}&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 mv &quot;${allow}.old&quot; &quot;${allow}&quot; &gt=
;/dev/null 2&gt;&amp;1<br>
+-=C2=A0 =C2=A0 =C2=A0 rm &quot;${tmpfile}&quot; &gt;/dev/null 2&gt;&amp;1<=
br>
+-}<br>
+-<br>
+-#-----------------------------------------------------------------------<=
br>
+-# FUNCTION:=C2=A0 run_test<br>
+-#-----------------------------------------------------------------------<=
br>
+-run_test()<br>
+-{<br>
+-=C2=A0 =C2=A0 =C2=A0 if [ $(whoami) =3D &quot;${test_user1}&quot; ]; then=
<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 . &quot;${test_user1_hom=
e}/cached_ltproot&quot; || exit 1<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 export PATH=3D&quot;$PAT=
H:$LTPROOT/testcases/bin&quot;<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;TEST: $allow =
should allow only those who in the file to run jobs.&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;(1) TEST THAT=
 PERSON IN ${allow} IS ABLE TO RUN JOB.&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;echo &#39;TES=
T JOB RAN&#39; &gt;&gt;\&quot;${tmpfile}\&quot; 2&gt;&amp;1&quot; |<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ! at -m now + 1 minut=
es ; then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 echo &quot;Error while adding job using at for user ${test_user1}.&quot=
;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 exit 1<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot; Sleeping for=
 75 seconds....&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sleep 75<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit_code=3D1<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test -e &quot;${tmpfile}=
&quot; &amp;&amp; exit_code=3D0<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ ${exit_code} -eq 1 =
]; then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 tst_resm TFAIL &quot;At did not allow user to execute job&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 tst_resm TPASS &quot;At allowed user to execute test job&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f &quot;${tmpfile}&q=
uot; &gt;/dev/null 2&gt;&amp;1<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit ${exit_code}<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 elif [ $(whoami) =3D &quot;${test_user2}&quot; ]; th=
en<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 . &quot;${test_user2_hom=
e}/cached_ltproot&quot; || exit 1<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 export PATH=3D&quot;$PAT=
H:$LTPROOT/testcases/bin&quot;<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;(2) TEST PERS=
ON THAT IS NOT IN ${allow} IS NOT ABLE TO RUN JOB.&quot;<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;echo &#39;TES=
T JOB RAN&#39; &gt;&gt;\&quot;${tmpfile}\&quot; 2&gt;&amp;1&quot; |<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ! at -m now + 1 minut=
es; then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 echo &quot;Expected error while adding job user at for user ${test_user=
2}&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Sleeping for =
75 seconds....&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sleep 75<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit_code=3D1<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test -e &quot;${tmpfile}=
&quot; || exit_code=3D0<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ ${exit_code} -eq 1 =
]; then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 tst_resm TFAIL &quot;At allowed user to execute test job&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 tst_resm TPASS &quot;At did not allow user to execute job&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f &quot;${tmpfile}&q=
uot; &gt;/dev/null 2&gt;&amp;1<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit ${exit_code}<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 fi<br>
+-}<br>
+-<br>
+-#-----------------------------------------------------------------------<=
br>
+-# FUNCTION: main<br>
+-#-----------------------------------------------------------------------<=
br>
+-if ! type at &gt; /dev/null; then<br>
+-=C2=A0 =C2=A0 =C2=A0 tst_resm TCONF &quot;at command not found on system&=
quot;<br>
+-elif [ &quot;$(id -ru)&quot; =3D 0 ]; then<br>
+-=C2=A0 =C2=A0 =C2=A0 if do_setup; then<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ! echo &quot;${test_u=
ser1}&quot; &gt;&quot;${allow}&quot;; then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 exit_code=3D1<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif ! su &quot;${test_u=
ser1}&quot; -lc &quot;${test_user1_home}/${0##*/}&quot;; then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 exit_code=3D1<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif ! su &quot;${test_u=
ser2}&quot; -lc &quot;${test_user2_home}/${0##*/}&quot;; then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 exit_code=3D1<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 exit_code=3D0<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 do_cleanup<br>
+-=C2=A0 =C2=A0 =C2=A0 else<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit_code=3D1<br>
+-=C2=A0 =C2=A0 =C2=A0 fi<br>
+-=C2=A0 =C2=A0 =C2=A0 exit ${exit_code}<br>
+-else<br>
+-=C2=A0 =C2=A0 =C2=A0 run_test<br>
+-=C2=A0 =C2=A0 =C2=A0 exit 0<br>
+-fi<br>
+diff --git a/testcases/commands/at/at_deny01 b/testcases/commands/at/at_de=
ny01<br>
+deleted file mode 100755<br>
+index 176da14f6..000000000<br>
+--- a/testcases/commands/at/at_deny01<br>
++++ /dev/null<br>
+@@ -1,195 +0,0 @@<br>
+-#!/bin/sh -u<br>
+-#<br>
+-#=C2=A0 =C2=A0Copyright (C) 2008 CAI Qian &lt;<a href=3D"mailto:caiqian@c=
clom.cn" target=3D"_blank">caiqian@cclom.cn</a>&gt;<br>
+-#=C2=A0 =C2=A0Copyright (c) International Business Machines=C2=A0 Corp., =
2003<br>
+-#<br>
+-#=C2=A0 =C2=A0This program is free software;=C2=A0 you can redistribute i=
t and/or modify<br>
+-#=C2=A0 =C2=A0it under the terms of the GNU General Public License as pub=
lished by<br>
+-#=C2=A0 =C2=A0the Free Software Foundation; either version 2 of the Licen=
se, or<br>
+-#=C2=A0 =C2=A0(at your option) any later version.<br>
+-#<br>
+-#=C2=A0 =C2=A0This program is distributed in the hope that it will be use=
ful,<br>
+-#=C2=A0 =C2=A0but WITHOUT ANY WARRANTY;=C2=A0 without even the implied wa=
rranty of<br>
+-#=C2=A0 =C2=A0MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 =
See<br>
+-#=C2=A0 =C2=A0the GNU General Public License for more details.<br>
+-#<br>
+-#=C2=A0 =C2=A0You should have received a copy of the GNU General Public L=
icense<br>
+-#=C2=A0 =C2=A0along with this program.=C2=A0 If not, see &lt;<a href=3D"h=
ttp://www.gnu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">http://ww=
w.gnu.org/licenses/</a>&gt;.<br>
+-#<br>
+-#=C2=A0 =C2=A0FILE: /etc/at.deny<br>
+-#<br>
+-#=C2=A0 =C2=A0PURPOSE: Test that /etc/at.deny , does not allow those in t=
he file<br>
+-#=C2=A0 =C2=A0to run cron jobs.<br>
+-#<br>
+-#=C2=A0 =C2=A0HISTORY:<br>
+-#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A004/03 Jerone Young (<a h=
ref=3D"mailto:jyoung5@us.ibm.com" target=3D"_blank">jyoung5@us.ibm.com</a>)=
<br>
+-#<br>
+-<br>
+-export TCID=3Dat_deny01<br>
+-export TST_TOTAL=3D1<br>
+-export TST_COUNT=3D1<br>
+-TMP=3D${TMP:=3D/tmp}<br>
+-deny=3D&quot;/etc/at.deny&quot;<br>
+-test_user1=3D&quot;test_user_1&quot;<br>
+-test_user2=3D&quot;test_user_2&quot;<br>
+-test_user1_home=3D&quot;/home/${test_user1}&quot;<br>
+-test_user2_home=3D&quot;/home/${test_user2}&quot;<br>
+-tmpfile=3D&quot;$TMP/at_deny_test&quot;<br>
+-<br>
+-if [ &quot;$(id -ru)&quot; =3D 0 ]; then<br>
+-=C2=A0 =C2=A0 =C2=A0 . cmdlib.sh<br>
+-fi<br>
+-<br>
+-#-----------------------------------------------------------------------<=
br>
+-# FUNCTION:=C2=A0 do_setup<br>
+-#-----------------------------------------------------------------------<=
br>
+-<br>
+-do_setup()<br>
+-{<br>
+-=C2=A0 =C2=A0 =C2=A0 # Move any files that may get in the way.<br>
+-=C2=A0 =C2=A0 =C2=A0 rm &quot;${tmpfile}&quot; &gt;/dev/null 2&gt;&amp;1<=
br>
+-=C2=A0 =C2=A0 =C2=A0 mv &quot;${deny}&quot; &quot;${deny}.old&quot; &gt;/=
dev/null 2&gt;&amp;1<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 # if /etc/at.allow is there, /etc/at.deny will be ig=
nored. So, we<br>
+-=C2=A0 =C2=A0 =C2=A0 # need to remove it first.<br>
+-=C2=A0 =C2=A0 =C2=A0 if [ -f &quot;/etc/at.allow&quot; ]; then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mv /etc/at.allow /etc/at=
.allow.old<br>
+-=C2=A0 =C2=A0 =C2=A0 fi<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 # Remove users for clean enviroment.<br>
+-=C2=A0 =C2=A0 =C2=A0 rm -rf &quot;${test_user1_home}&quot; &quot;${test_u=
ser2_home}&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 userdel -r &quot;${test_user1}&quot; &gt;/dev/null 2=
&gt;&amp;1<br>
+-=C2=A0 =C2=A0 =C2=A0 userdel -r &quot;${test_user2}&quot; &gt;/dev/null 2=
&gt;&amp;1<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 # Create the 1st user.<br>
+-=C2=A0 =C2=A0 =C2=A0 if ! useradd -g users -d &quot;${test_user1_home}&qu=
ot; -m &quot;${test_user1}&quot;; then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Could not add=
 test user ${test_user1} to system.&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1<br>
+-=C2=A0 =C2=A0 =C2=A0 fi<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 # Create the 2nd user.<br>
+-=C2=A0 =C2=A0 =C2=A0 if ! useradd -g users -d &quot;${test_user2_home}&qu=
ot; -m &quot;${test_user2}&quot;; then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Could not add=
 test user ${test_user2} to system.&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1<br>
+-=C2=A0 =C2=A0 =C2=A0 fi<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 # This is the workaround for a potential bug.<br>
+-=C2=A0 =C2=A0 =C2=A0 # [Bug 468337] At Refuse to Work with Non-login Shel=
l<br>
+-=C2=A0 =C2=A0 =C2=A0 # <a href=3D"https://bugzilla.redhat.com/show_bug.cg=
i?id=3D468337" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.redhat=
.com/show_bug.cgi?id=3D468337</a><br>
+-=C2=A0 =C2=A0 =C2=A0 # As we are running in non-login shell now, we canno=
t run the script<br>
+-=C2=A0 =C2=A0 =C2=A0 # by simply given it a relative path. Therefore, we =
copy it to test<br>
+-=C2=A0 =C2=A0 =C2=A0 # users&#39; home directories, and run it from there=
.<br>
+-=C2=A0 =C2=A0 =C2=A0 cp &quot;$0&quot; &quot;${test_user1_home}/.&quot; &=
amp;&amp;<br>
+-=C2=A0 =C2=A0 =C2=A0 cp &quot;$0&quot; &quot;${test_user2_home}/.&quot; &=
amp;&amp;<br>
+-=C2=A0 =C2=A0 =C2=A0 echo &quot;export LTPROOT=3D&#39;$LTPROOT&#39;&quot;=
 &gt; &quot;${test_user1_home}/cached_ltproot&quot; &amp;&amp;<br>
+-=C2=A0 =C2=A0 =C2=A0 echo &quot;export LTPROOT=3D&#39;$LTPROOT&#39;&quot;=
 &gt; &quot;${test_user2_home}/cached_ltproot&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 if [ $? -ne 0 ]; then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_resm TBROK &quot;Cou=
ldn&#39;t copy over req&#39;d files for test users&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1<br>
+-=C2=A0 =C2=A0 =C2=A0 fi<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 restart_daemon atd<br>
+-}<br>
+-<br>
+-#-----------------------------------------------------------------------<=
br>
+-# FUNCTION:=C2=A0 do_cleanup<br>
+-#-----------------------------------------------------------------------<=
br>
+-do_cleanup()<br>
+-{<br>
+-=C2=A0 =C2=A0 =C2=A0 # We forcefully remove those files anyway. Otherwise=
 userdel may<br>
+-=C2=A0 =C2=A0 =C2=A0 # give us bad warnings.<br>
+-=C2=A0 =C2=A0 =C2=A0 rm -rf &quot;${test_user1_home}&quot; &quot;${test_u=
ser2_home}&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 userdel -r &quot;${test_user1}&quot; &gt;/dev/null 2=
&gt;&amp;1<br>
+-=C2=A0 =C2=A0 =C2=A0 userdel -r &quot;${test_user2}&quot; &gt;/dev/null 2=
&gt;&amp;1<br>
+-=C2=A0 =C2=A0 =C2=A0 rm &quot;${deny}&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 mv &quot;${deny}.old&quot; &quot;${deny}&quot; &gt;/=
dev/null 2&gt;&amp;1<br>
+-=C2=A0 =C2=A0 =C2=A0 rm &quot;${tmpfile}&quot; &gt;/dev/null 2&gt;&amp;1<=
br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 if [ -f /etc/at.allow.old ]; then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mv /etc/at.allow.old /et=
c/at.allow<br>
+-=C2=A0 =C2=A0 =C2=A0 fi<br>
+-}<br>
+-<br>
+-#-----------------------------------------------------------------------<=
br>
+-# FUNCTION:=C2=A0 run_test<br>
+-#-----------------------------------------------------------------------<=
br>
+-run_test()<br>
+-{<br>
+-=C2=A0 =C2=A0 =C2=A0 if [ $(whoami) =3D &quot;${test_user1}&quot; ]; then=
<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 . &quot;${test_user1_hom=
e}/cached_ltproot&quot; || exit 1<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 export PATH=3D&quot;$PAT=
H:$LTPROOT/testcases/bin&quot;<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;TEST: ${deny}=
 should deny only those who are not in the file to run jobs.&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;(1) TEST THAT=
 PERSON NOT IN ${deny} IS ABLE TO RUN JOB.&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;echo &#39;TES=
T JOB RAN&#39; &gt;&gt;\&quot;${tmpfile}\&quot; 2&gt;&amp;1&quot; |<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ! at -m now + 1 minut=
es; then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 echo &quot;Error while adding job using at for user ${test_user1}.&quot=
;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 exit 1<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot; Sleeping for=
 75 seconds....&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sleep 75<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit_code=3D1<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test -e &quot;${tmpfile}=
&quot; &amp;&amp; exit_code=3D0<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ ${exit_code} -eq 1 =
]; then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 tst_resm TFAIL &quot;At denyed user to execute test job&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 tst_resm TPASS &quot;At did not deny user to execute job&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f &quot;${tmpfile}&q=
uot; &gt;/dev/null 2&gt;&amp;1<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit ${exit_code}<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 elif [ $(whoami) =3D &quot;${test_user2}&quot; ]; th=
en<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 . &quot;${test_user2_hom=
e}/cached_ltproot&quot; || exit 1<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 export PATH=3D&quot;$PAT=
H:$LTPROOT/testcases/bin&quot;<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;(2) TEST THAT=
 PERSON IN ${deny} IS NOT ABLE TO RUN JOB.&quot;<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;echo &#39;TES=
T JOB RAN&#39; &gt;&gt;\&quot;${tmpfile}\&quot; 2&gt;&amp;1&quot; |<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ! at -m now + 1 minut=
es; then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 echo &quot;Expected error while adding job user at for user ${test_user=
2}&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Sleeping for =
75 seconds....&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sleep 75<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit_code=3D1<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test -e &quot;${tmpfile}=
&quot; || exit_code=3D0<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ ${exit_code} -eq 1 =
]; then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 echo &quot;At did not deny user to execute job, TEST FAILED.&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 echo &quot;At denyed user to execute test job, TEST PASSED.&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f &quot;${tmpfile}&q=
uot; &gt;/dev/null 2&gt;&amp;1<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit ${exit_code}<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 fi<br>
+-}<br>
+-<br>
+-#-----------------------------------------------------------------------<=
br>
+-# FUNCTION: main<br>
+-#-----------------------------------------------------------------------<=
br>
+-if ! type at &gt; /dev/null; then<br>
+-=C2=A0 =C2=A0 =C2=A0 tst_resm TCONF &quot;at command not found on system&=
quot;<br>
+-elif [ &quot;$(id -ru)&quot; =3D 0 ]; then<br>
+-=C2=A0 =C2=A0 =C2=A0 if do_setup ; then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ! echo &quot;${test_u=
ser2}&quot; &gt;&quot;${deny}&quot;; then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 exit_code=3D1<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif ! su &quot;${test_u=
ser1}&quot; -lc &quot;${test_user1_home}/${0##*/}&quot;; then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 exit_code=3D1<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif ! su &quot;${test_u=
ser2}&quot; -lc &quot;${test_user2_home}/${0##*/}&quot;; then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 exit_code=3D1<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 exit_code=3D0<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 do_cleanup<br>
+-=C2=A0 =C2=A0 =C2=A0 else<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit_code=3D1<br>
+-=C2=A0 =C2=A0 =C2=A0 fi<br>
+-=C2=A0 =C2=A0 =C2=A0 exit ${exit_code}<br>
+-else<br>
+-=C2=A0 =C2=A0 =C2=A0 run_test<br>
+-=C2=A0 =C2=A0 =C2=A0 exit 0<br>
+-fi<br>
+diff --git a/testcases/commands/cron/00_Descriptions.txt b/testcases/comma=
nds/cron/00_Descriptions.txt<br>
+deleted file mode 100644<br>
+index 9566e0aaa..000000000<br>
+--- a/testcases/commands/cron/00_Descriptions.txt<br>
++++ /dev/null<br>
+@@ -1,4 +0,0 @@<br>
+-cron01<br>
+-=C2=A0 =C2=A0 =C2=A0 Test that crontab &lt;filename&gt; installs the cron=
-job-file and cron will<br>
+-=C2=A0 =C2=A0 =C2=A0 schedule the job correctly.<br>
+-<br>
+diff --git a/testcases/commands/cron/Makefile b/testcases/commands/cron/Ma=
kefile<br>
+deleted file mode 100644<br>
+index 4969ec7bb..000000000<br>
+--- a/testcases/commands/cron/Makefile<br>
++++ /dev/null<br>
+@@ -1,29 +0,0 @@<br>
+-#<br>
+-#=C2=A0 =C2=A0 commands/cron testcases Makefile.<br>
+-#<br>
+-#=C2=A0 =C2=A0 Copyright (C) 2009, Cisco Systems Inc.<br>
+-#<br>
+-#=C2=A0 =C2=A0 This program is free software; you can redistribute it and=
/or modify<br>
+-#=C2=A0 =C2=A0 it under the terms of the GNU General Public License as pu=
blished by<br>
+-#=C2=A0 =C2=A0 the Free Software Foundation; either version 2 of the Lice=
nse, or<br>
+-#=C2=A0 =C2=A0 (at your option) any later version.<br>
+-#<br>
+-#=C2=A0 =C2=A0 This program is distributed in the hope that it will be us=
eful,<br>
+-#=C2=A0 =C2=A0 but WITHOUT ANY WARRANTY; without even the implied warrant=
y of<br>
+-#=C2=A0 =C2=A0 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0=
 See the<br>
+-#=C2=A0 =C2=A0 GNU General Public License for more details.<br>
+-#<br>
+-#=C2=A0 =C2=A0 You should have received a copy of the GNU General Public =
License along<br>
+-#=C2=A0 =C2=A0 with this program; if not, write to the Free Software Foun=
dation, Inc.,<br>
+-#=C2=A0 =C2=A0 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA=
.<br>
+-#<br>
+-# Ngie Cooper, July 2009<br>
+-#<br>
+-<br>
+-top_srcdir=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ?=3D ../../..<br>
+-<br>
+-include $(top_srcdir)/include/mk/<a href=3D"http://env_pre.mk" rel=3D"nor=
eferrer" target=3D"_blank">env_pre.mk</a><br>
+-<br>
+-INSTALL_TARGETS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0:=
=3D cron0[23] cron_illegal_cron_lines cron_allow01 cron_deny01 cron_dirs_ch=
ecks01 *.sh<br>
+-<br>
+-include $(top_srcdir)/include/mk/<a href=3D"http://generic_leaf_target.mk=
" rel=3D"noreferrer" target=3D"_blank">generic_leaf_target.mk</a><br>
+diff --git a/testcases/commands/cron/README.tests b/testcases/commands/cro=
n/README.tests<br>
+deleted file mode 100644<br>
+index 0d5db7113..000000000<br>
+--- a/testcases/commands/cron/README.tests<br>
++++ /dev/null<br>
+@@ -1,25 +0,0 @@<br>
+-This directory contains two scripts and one data file to test cron. Both<=
br>
+-shouldn&#39;t be run as root but they warn for themselves. If a username =
is<br>
+-given as parameter they run as this user.<br>
+-<br>
+-Both scripts save the current crontab and restore it after finishing.<br>
+-<br>
+-* Positive tests<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 cron_pos_tests.sh [username]<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 - add new job<br>
+-=C2=A0 =C2=A0 =C2=A0 - check correct execution of job<br>
+-=C2=A0 =C2=A0 =C2=A0 - delete job<br>
+-<br>
+-* Negative tests<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 cron_neg_tests.sh [username]<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 - try to edit the crontab of root<br>
+-=C2=A0 =C2=A0 =C2=A0 - try to set illegal or nondefined execution times<b=
r>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 Here the script uses file illegal_cron_lines =
which contains two<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fields per line: the cron line to be tested (=
without script name),<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 and the description of this test. The descrip=
tion is written to<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 stdout during execution of the test.<br>
+-=C2=A0 =C2=A0 =C2=A0 - try to do things you aren&#39;t allowed as non-roo=
t (cron runs as root)<br>
+diff --git a/testcases/commands/cron/cron02 b/testcases/commands/cron/cron=
02<br>
+deleted file mode 100755<br>
+index 16b425de3..000000000<br>
+--- a/testcases/commands/cron/cron02<br>
++++ /dev/null<br>
+@@ -1,80 +0,0 @@<br>
+-#!/bin/sh<br>
+-#*********************************************************************<br=
>
+-#=C2=A0 =C2=A0Copyright (c) International Business Machines=C2=A0 Corp., =
2000<br>
+-#<br>
+-#=C2=A0 =C2=A0This program is free software;=C2=A0 you can redistribute i=
t and/or modify<br>
+-#=C2=A0 =C2=A0it under the terms of the GNU General Public License as pub=
lished by<br>
+-#=C2=A0 =C2=A0the Free Software Foundation; either version 2 of the Licen=
se, or<br>
+-#=C2=A0 =C2=A0(at your option) any later version.<br>
+-#<br>
+-#=C2=A0 =C2=A0This program is distributed in the hope that it will be use=
ful,<br>
+-#=C2=A0 =C2=A0but WITHOUT ANY WARRANTY;=C2=A0 without even the implied wa=
rranty of<br>
+-#=C2=A0 =C2=A0MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 =
See<br>
+-#=C2=A0 =C2=A0the GNU General Public License for more details.<br>
+-#<br>
+-#=C2=A0 =C2=A0You should have received a copy of the GNU General Public L=
icense<br>
+-#=C2=A0 =C2=A0along with this program;=C2=A0 if not, write to the Free So=
ftware<br>
+-#=C2=A0 =C2=A0Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, =
MA 02110-1301 USA<br>
+-#<br>
+-#=C2=A0 FILE=C2=A0 =C2=A0: cron02<br>
+-#<br>
+-#=C2=A0 PURPOSE: Test a postive cron job<br>
+-#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0- add new job<br>
+-#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- check correct executio=
n of job<br>
+-#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- delete job<br>
+-#<br>
+-#=C2=A0 HISTORY:<br>
+-#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SUSE<br>
+-#<br>
+-<br>
+-TEST_USER=3D&quot;c01_user&quot;<br>
+-TEST_USER_GROUP=3D&quot;users&quot;<br>
+-TEST_USER_HOMEDIR=3D&quot;/home/$TEST_USER&quot;<br>
+-<br>
+-#-----------------------------------------------------------------------<=
br>
+-# FUNCTION:=C2=A0 do_setup<br>
+-#-----------------------------------------------------------------------<=
br>
+-<br>
+-do_setup(){<br>
+-=C2=A0 =C2=A0 =C2=A0 #erase any data from potential defunt cron test<br>
+-=C2=A0 =C2=A0 =C2=A0 rm -rf /tmp/crontest &gt; /dev/null 2&gt;&amp;1<br>
+-<br>
+-=C2=A0 =C2=A0 #erase user if he may exist , so we can have a clean env<br=
>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf /home/$TEST_USER<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 userdel $TEST_USER<br>
+-=C2=A0 =C2=A0 =C2=A0 sleep 1<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 useradd -m -g $TEST_USER_GROUP $TEST_USER<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ $? !=3D 0 ]<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 then {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Could =
not add test user $TEST_USER to system $RHOST.&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 if [ -n &quot;$CROND_DAEMON&quot; ]; then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 restart_daemon $CROND_DA=
EMON<br>
+-=C2=A0 =C2=A0 =C2=A0 else<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_brkm TBROK &quot;Cou=
ldn&#39;t find crond or cron&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 fi<br>
+-}<br>
+-<br>
+-#-----------------------------------------------------------------------<=
br>
+-# FUNCTION:=C2=A0 do_cleanup<br>
+-#-----------------------------------------------------------------------<=
br>
+-<br>
+-do_cleanup(){<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf /home/$TEST_USER<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 userdel $TEST_USER<br>
+-}<br>
+-<br>
+-#-----------------------------------------------------------------------<=
br>
+-# FUNCTION:=C2=A0 MAIN<br>
+-#-----------------------------------------------------------------------<=
br>
+-. cmdlib.sh<br>
+-<br>
+-do_setup<br>
+-cron_pos_tests.sh $TEST_USER<br>
+-EXIT_CODE=3D$?<br>
+-do_cleanup<br>
+-exit $EXIT_CODE<br>
+diff --git a/testcases/commands/cron/cron03 b/testcases/commands/cron/cron=
03<br>
+deleted file mode 100755<br>
+index 7ba7bf40c..000000000<br>
+--- a/testcases/commands/cron/cron03<br>
++++ /dev/null<br>
+@@ -1,83 +0,0 @@<br>
+-#!/bin/sh<br>
+-#*********************************************************************<br=
>
+-#=C2=A0 =C2=A0Copyright (c) International Business Machines=C2=A0 Corp., =
2000<br>
+-#<br>
+-#=C2=A0 =C2=A0This program is free software;=C2=A0 you can redistribute i=
t and/or modify<br>
+-#=C2=A0 =C2=A0it under the terms of the GNU General Public License as pub=
lished by<br>
+-#=C2=A0 =C2=A0the Free Software Foundation; either version 2 of the Licen=
se, or<br>
+-#=C2=A0 =C2=A0(at your option) any later version.<br>
+-#<br>
+-#=C2=A0 =C2=A0This program is distributed in the hope that it will be use=
ful,<br>
+-#=C2=A0 =C2=A0but WITHOUT ANY WARRANTY;=C2=A0 without even the implied wa=
rranty of<br>
+-#=C2=A0 =C2=A0MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 =
See<br>
+-#=C2=A0 =C2=A0the GNU General Public License for more details.<br>
+-#<br>
+-#=C2=A0 =C2=A0You should have received a copy of the GNU General Public L=
icense<br>
+-#=C2=A0 =C2=A0along with this program;=C2=A0 if not, write to the Free So=
ftware<br>
+-#=C2=A0 =C2=A0Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, =
MA 02110-1301 USA<br>
+-#<br>
+-#=C2=A0 FILE=C2=A0 =C2=A0: cron<br>
+-#<br>
+-#=C2=A0 PURPOSE: Test a bad (negative) cron job<br>
+-#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0- try to edit the crontab of root<br>
+-#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- try to set illegal or =
nondefined execution times<br>
+-#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0Here the script uses file illegal_cron_lines which contains tw=
o<br>
+-#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0fields per line: the cron line to be tested (without script na=
me),<br>
+-#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0and the description of this test. The description is written t=
o<br>
+-#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0stdout during execution of the test.<br>
+-#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- try to do things you a=
ren&#39;t allowed as non-root (cron runs as root)<br>
+-<br>
+-#<br>
+-#=C2=A0 HISTORY:<br>
+-#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SUSE<br>
+-#<br>
+-<br>
+-<br>
+-TEST_USER=3D&quot;c02_user&quot;<br>
+-TEST_USER_GROUP=3D&quot;users&quot;<br>
+-TEST_USER_HOMEDIR=3D&quot;/home/$TEST_USER&quot;<br>
+-<br>
+-#-----------------------------------------------------------------------<=
br>
+-# FUNCTION:=C2=A0 do_setup<br>
+-#-----------------------------------------------------------------------<=
br>
+-<br>
+-do_setup(){<br>
+-<br>
+-=C2=A0 =C2=A0 #erase user if he may exist , so we can have a clean env<br=
>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf /home/$TEST_USER<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 userdel $TEST_USER<br>
+-=C2=A0 =C2=A0 =C2=A0 sleep 1<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 useradd -m -g $TEST_USER_GROUP $TEST_USER<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ $? !=3D 0 ]<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 then {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Could =
not add test user $TEST_USER to system $RHOST.&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # restart cron daemon<br>
+-=C2=A0 =C2=A0 =C2=A0 # Red Hat uses crond, SuSE/Other uses cron.<br>
+-=C2=A0 =C2=A0 =C2=A0 if [ -f /etc/init.d/crond ]; then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /etc/init.d/crond restar=
t<br>
+-=C2=A0 =C2=A0 =C2=A0 else<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /etc/init.d/cron restart=
<br>
+-=C2=A0 =C2=A0 =C2=A0 fi<br>
+-}<br>
+-<br>
+-#-----------------------------------------------------------------------<=
br>
+-# FUNCTION:=C2=A0 do_cleanup<br>
+-#-----------------------------------------------------------------------<=
br>
+-<br>
+-do_cleanup(){<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf /home/$TEST_USER<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 userdel $TEST_USER<br>
+-}<br>
+-<br>
+-#-----------------------------------------------------------------------<=
br>
+-# FUNCTION:=C2=A0 MAIN<br>
+-#-----------------------------------------------------------------------<=
br>
+-do_setup<br>
+-cron_neg_tests.sh $TEST_USER<br>
+-EXIT_CODE=3D$?<br>
+-do_cleanup<br>
+-exit $EXIT_CODE<br>
+diff --git a/testcases/commands/cron/cron_allow01 b/testcases/commands/cro=
n/cron_allow01<br>
+deleted file mode 100755<br>
+index 9a5e4d240..000000000<br>
+--- a/testcases/commands/cron/cron_allow01<br>
++++ /dev/null<br>
+@@ -1,202 +0,0 @@<br>
+-#!/bin/bash<br>
+-#<br>
+-#=C2=A0 =C2=A0Copyright (c) International Business Machines=C2=A0 Corp., =
2003<br>
+-#<br>
+-#=C2=A0 =C2=A0This program is free software;=C2=A0 you can redistribute i=
t and/or modify<br>
+-#=C2=A0 =C2=A0it under the terms of the GNU General Public License as pub=
lished by<br>
+-#=C2=A0 =C2=A0the Free Software Foundation; either version 2 of the Licen=
se, or<br>
+-#=C2=A0 =C2=A0(at your option) any later version.<br>
+-#<br>
+-#=C2=A0 =C2=A0This program is distributed in the hope that it will be use=
ful,<br>
+-#=C2=A0 =C2=A0but WITHOUT ANY WARRANTY;=C2=A0 without even the implied wa=
rranty of<br>
+-#=C2=A0 =C2=A0MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 =
See<br>
+-#=C2=A0 =C2=A0the GNU General Public License for more details.<br>
+-#<br>
+-#=C2=A0 =C2=A0You should have received a copy of the GNU General Public L=
icense<br>
+-#=C2=A0 =C2=A0along with this program;=C2=A0 if not, write to the Free So=
ftware<br>
+-#=C2=A0 =C2=A0Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, =
MA 02110-1301 USA<br>
+-#<br>
+-#=C2=A0 =C2=A0 =C2=A0FILE: /var/spool/cron/allow<br>
+-#<br>
+-#=C2=A0 =C2=A0 =C2=A0PURPOSE: Test that /var/spool/cron/allow , only allo=
ws those in the file to run cron jobs.<br>
+-#<br>
+-#=C2=A0 =C2=A0 =C2=A0HISTORY:<br>
+-#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A004/03 Jerone Young (<a h=
ref=3D"mailto:jyoung5@us.ibm.com" target=3D"_blank">jyoung5@us.ibm.com</a>)=
<br>
+-#<br>
+-<br>
+-echo &quot;This script contains bashism that needs to be fixed!&quot;<br>
+-<br>
+-iam=3D`whoami`<br>
+-<br>
+-tvar=3D${MACHTYPE%-*}<br>
+-tvar=3D${tvar#*-}<br>
+-<br>
+-if [ &quot;$tvar&quot; =3D &quot;redhat&quot; -o &quot;$tvar&quot; =3D &q=
uot;redhat-linux&quot; ]<br>
+-then<br>
+-CRON_ALLOW=3D&quot;/etc/cron.allow&quot;<br>
+-else<br>
+-CRON_ALLOW=3D&quot;/var/spool/cron/allow&quot;<br>
+-fi<br>
+-<br>
+-TEST_USER1=3D&quot;ca_user1&quot;<br>
+-TEST_USER1_HOME=3D&quot;/home/$TEST_USER1&quot;<br>
+-TEST_USER2=3D&quot;ca_user2&quot;<br>
+-TEST_USER2_HOME=3D&quot;/home/$TEST_USER2&quot;<br>
+-<br>
+-#-----------------------------------------------------------------------<=
br>
+-# FUNCTION:=C2=A0 do_setup<br>
+-#-----------------------------------------------------------------------<=
br>
+-<br>
+-do_setup() {<br>
+-=C2=A0 =C2=A0 =C2=A0 #move any files that may get in the way<br>
+-=C2=A0 =C2=A0 =C2=A0 rm /tmp/cron_allow_test &gt; /dev/null 2&gt;&amp;1<b=
r>
+-=C2=A0 =C2=A0 =C2=A0 rm /tmp/cron_allow_test1 &gt; /dev/null 2&gt;&amp;1<=
br>
+-=C2=A0 =C2=A0 =C2=A0 mv $CRON_ALLOW $CRON_ALLOW.old &gt; /dev/null 2&gt;&=
amp;1<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 #remove users for clean enviroment<br>
+-=C2=A0 =C2=A0 su $TEST_USER1 -c &quot;crontab -r&quot;<br>
+-=C2=A0 =C2=A0 su $TEST_USER2 -c &quot;crontab -r&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf /home/$TEST_USER1<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf /home/$TEST_USER2<br>
+-=C2=A0 =C2=A0 =C2=A0 userdel $TEST_USER1<br>
+-=C2=A0 =C2=A0 =C2=A0 userdel $TEST_USER2<br>
+-=C2=A0 =C2=A0 =C2=A0 sleep 1<br>
+-<br>
+-#create 1st user<br>
+-=C2=A0 =C2=A0 =C2=A0 useradd -m -g users $TEST_USER1<br>
+-=C2=A0 =C2=A0 =C2=A0 if [ $? !=3D 0 ]<br>
+-=C2=A0 =C2=A0 then {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Could not add test user $TEST_USER=
1 to system.&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1<br>
+-=C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 fi<br>
+-<br>
+-#create 2nd user<br>
+-=C2=A0 =C2=A0 =C2=A0 useradd -m -g users $TEST_USER2<br>
+-=C2=A0 =C2=A0 if [ $? !=3D 0 ]<br>
+-=C2=A0 =C2=A0 then {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Could not add test user $TEST_USER=
2 to system.&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1<br>
+-=C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 fi<br>
+-}<br>
+-<br>
+-#-----------------------------------------------------------------------<=
br>
+-# FUNCTION:=C2=A0 do_cleanup<br>
+-#-----------------------------------------------------------------------<=
br>
+-do_cleanup(){<br>
+-=C2=A0 =C2=A0 su $TEST_USER1 -c &quot;crontab -r&quot;<br>
+-=C2=A0 =C2=A0 su $TEST_USER2 -c &quot;crontab -r&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf /home/$TEST_USER1<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf /home/$TEST_USER2<br>
+-=C2=A0 =C2=A0 =C2=A0 userdel $TEST_USER1<br>
+-=C2=A0 =C2=A0 =C2=A0 userdel $TEST_USER2<br>
+-=C2=A0 =C2=A0 =C2=A0 rm $CRON_ALLOW<br>
+-=C2=A0 =C2=A0 =C2=A0 mv $CRON_ALLOW.old $CRON_ALLOW &gt; /dev/null 2&gt;&=
amp;1<br>
+-=C2=A0 =C2=A0 =C2=A0 rm /tmp/cron_allow_test &gt;/dev/null 2&gt;&amp;1<br=
>
+-}<br>
+-<br>
+-#-----------------------------------------------------------------------<=
br>
+-# FUNCTION:=C2=A0 run_test<br>
+-#-----------------------------------------------------------------------<=
br>
+-run_test() {<br>
+-<br>
+-if [ $iam =3D $TEST_USER1 ]<br>
+-then<br>
+-=C2=A0 =C2=A0 =C2=A0 echo &quot;TEST: $CRON_ALLOW should only allow those=
 in the file to<br>
+-run cron jobs.&quot;<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 echo &quot;(1) TEST THAT PERSON IN $CRON_ALLOW IS AB=
LE TO RUN JOB.&quot;<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 echo &quot;backup crontab....&quot;<br>
+-=C2=A0 =C2=A0 crontab -l | grep &#39;^[^#]&#39; &gt; /tmp/crontab-cronall=
ow-save-$iam<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 crontab - &lt;&lt; EOF<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 `date &#39;+%M&#39; | awk &#39;{ORS=3D&quot;&=
quot;; print ($1+2)%60 &quot; * * * * &quot;}&#39;` echo &quot;TEST JOB RAN=
&quot; &gt;&gt; /tmp/cron_allow_test 2&gt;&amp;1<br>
+-EOF<br>
+-=C2=A0 =C2=A0 =C2=A0 if [ $? !=3D 0 ]; then<br>
+-=C2=A0 =C2=A0 =C2=A0 echo Error while adding crontab for user $TEST_USER1=
<br>
+-=C2=A0 =C2=A0 =C2=A0 exit 1<br>
+-=C2=A0 =C2=A0 =C2=A0 fi<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 echo &quot;sleeping for 130 seconds....&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 sleep 130<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 EXIT_CODE=3D1<br>
+-=C2=A0 =C2=A0 =C2=A0 test -e /tmp/cron_allow_test &amp;&amp; EXIT_CODE=3D=
0<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 if [ $EXIT_CODE =3D 1 ]; then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Cron did not =
allow user to execute job , TEST FAILED&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 else<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Cron allowed =
user to execute test job, TEST PASSED&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 fi<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;restore old crontab...&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0crontab /tmp/crontab-cronallow-save-$iam<br>
+-=C2=A0 =C2=A0 =C2=A0rm -f /tmp/crontab-cronallow-save-$iam<br>
+-<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 rm -f /tmp/cron_allow_test<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 exit $EXIT_CODE<br>
+-fi<br>
+-<br>
+-if [ $iam =3D $TEST_USER2 ]<br>
+-then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;(2) TEST THAT PERSON NOT IN $CRON_=
ALLOW IS NOT ABLE TO RUN JOB.&quot;<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;backup cronta=
b....&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 crontab -l | grep &#39;^[^#]&#39; &gt; /tmp/crontab-=
cronallow-save-$iam<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 crontab - &lt;&lt; EOF<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 `date &#39;+%M&#39; | awk &#39;{ORS=3D&quot;&=
quot;; print ($1+2)%60 &quot; * * * * &quot;}&#39;` echo &quot;TEST JOB RAN=
&quot; &gt;&gt; /tmp/cron_allow_test1 2&gt;&amp;1<br>
+-EOF<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ $? !=3D 0 ]; then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo Error while adding crontab for user $TES=
T_USER2<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;sleeping for 130 seconds....&quot;=
<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 sleep 130<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 EXIT_CODE=3D0<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 test -e /tmp/cron_allow_test1 &amp;&amp; EXIT=
_CODE=3D1<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ $EXIT_CODE =3D 0 ]; then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Cron d=
id not allow user to execute job , TEST PASSED&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Cron a=
llowed user to execute test job, TEST FAILED&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;restore old c=
rontab...&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 crontab /tmp/crontab-cronallow-save-$iam<br>
+-=C2=A0 =C2=A0 =C2=A0 rm -f /tmp/crontab-cronallow-save-$iam<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f /tmp/cron_allow_test1<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit $EXIT_CODE<br>
+-fi<br>
+-<br>
+-}<br>
+-<br>
+-#-----------------------------------------------------------------------<=
br>
+-# FUNCTION: main<br>
+-#-----------------------------------------------------------------------<=
br>
+-if [ $iam =3D &quot;root&quot; ]<br>
+-then<br>
+-=C2=A0 =C2=A0 =C2=A0 do_setup<br>
+-=C2=A0 =C2=A0 =C2=A0 echo $TEST_USER1 &gt; $CRON_ALLOW<br>
+-=C2=A0 =C2=A0 =C2=A0 EXIT_CODE=3D0<br>
+-=C2=A0 =C2=A0 =C2=A0 su $TEST_USER1 -c &quot;$0&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 if [ $? !=3D 0 ]<br>
+-=C2=A0 =C2=A0 =C2=A0 then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0EXIT_CODE=3D1<br>
+-=C2=A0 =C2=A0 =C2=A0 fi<br>
+-=C2=A0 =C2=A0 =C2=A0 su $TEST_USER2 -c &quot;$0&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 if [ $? !=3D 0 ]<br>
+-=C2=A0 =C2=A0 =C2=A0 then EXIT_CODE=3D1<br>
+-=C2=A0 =C2=A0 =C2=A0 fi<br>
+-=C2=A0 =C2=A0 =C2=A0 do_cleanup<br>
+-=C2=A0 =C2=A0 =C2=A0 exit $EXIT_CODE<br>
+-else<br>
+-=C2=A0 =C2=A0 =C2=A0 run_test<br>
+-fi<br>
+diff --git a/testcases/commands/cron/cron_deny01 b/testcases/commands/cron=
/cron_deny01<br>
+deleted file mode 100755<br>
+index 9d3203925..000000000<br>
+--- a/testcases/commands/cron/cron_deny01<br>
++++ /dev/null<br>
+@@ -1,192 +0,0 @@<br>
+-#!/bin/bash<br>
+-#<br>
+-#=C2=A0 =C2=A0Copyright (c) International Business Machines=C2=A0 Corp., =
2003<br>
+-#<br>
+-#=C2=A0 =C2=A0This program is free software;=C2=A0 you can redistribute i=
t and/or modify<br>
+-#=C2=A0 =C2=A0it under the terms of the GNU General Public License as pub=
lished by<br>
+-#=C2=A0 =C2=A0the Free Software Foundation; either version 2 of the Licen=
se, or<br>
+-#=C2=A0 =C2=A0(at your option) any later version.<br>
+-#<br>
+-#=C2=A0 =C2=A0This program is distributed in the hope that it will be use=
ful,<br>
+-#=C2=A0 =C2=A0but WITHOUT ANY WARRANTY;=C2=A0 without even the implied wa=
rranty of<br>
+-#=C2=A0 =C2=A0MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 =
See<br>
+-#=C2=A0 =C2=A0the GNU General Public License for more details.<br>
+-#<br>
+-#=C2=A0 =C2=A0You should have received a copy of the GNU General Public L=
icense<br>
+-#=C2=A0 =C2=A0along with this program;=C2=A0 if not, write to the Free So=
ftware<br>
+-#=C2=A0 =C2=A0Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, =
MA 02110-1301 USA<br>
+-#<br>
+-#=C2=A0 =C2=A0 =C2=A0FILE: /var/spool/cron/allow<br>
+-#<br>
+-#=C2=A0 =C2=A0 =C2=A0PURPOSE: Test that /var/spool/cron/deny , does not a=
llow those in the file to run cron jobs.<br>
+-#<br>
+-#=C2=A0 =C2=A0 =C2=A0HISTORY:<br>
+-#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A004/03 Jerone Young (<a h=
ref=3D"mailto:jyoung5@us.ibm.com" target=3D"_blank">jyoung5@us.ibm.com</a>)=
<br>
+-#<br>
+-<br>
+-echo &quot;This script contains bashism that needs to be fixed!&quot;<br>
+-<br>
+-iam=3D`whoami`<br>
+-<br>
+-tvar=3D${MACHTYPE%-*}<br>
+-tvar=3D${tvar#*-}<br>
+-<br>
+-if [ &quot;$tvar&quot; =3D &quot;redhat&quot; -o &quot;$tvar&quot; =3D &q=
uot;redhat-linux&quot; ]<br>
+-then<br>
+-CRON_DENY=3D&quot;/etc/cron.deny&quot;<br>
+-CRON_ALLOW=3D&quot;/etc/cron.allow&quot;<br>
+-else<br>
+-CRON_DENY=3D&quot;/var/spool/cron/deny&quot;<br>
+-CRON_ALLOW=3D&quot;/var/spool/cron/allow&quot;<br>
+-fi<br>
+-<br>
+-TEST_USER1=3D&quot;cd_user1&quot;<br>
+-TEST_USER1_HOME=3D&quot;/home/$TEST_USER1&quot;<br>
+-TEST_USER2=3D&quot;cd_user2&quot;<br>
+-TEST_USER2_HOME=3D&quot;/home/$TEST_USER2&quot;<br>
+-<br>
+-#-----------------------------------------------------------------------<=
br>
+-# FUNCTION:=C2=A0 do_setup<br>
+-#-----------------------------------------------------------------------<=
br>
+-<br>
+-do_setup() {<br>
+-=C2=A0 =C2=A0 =C2=A0 #move any files that may get in the way<br>
+-=C2=A0 =C2=A0 =C2=A0 rm /tmp/cron_deny_test &gt; /dev/null 2&gt;&amp;1<br=
>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm /tmp/cron_deny_test1 &gt; /dev/null 2&gt;&=
amp;1<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 mv $CRON_DENY $CRON_DENY.old &gt; /dev/null 2&gt;&am=
p;1<br>
+-=C2=A0 =C2=A0 =C2=A0 mv $CRON_ALLOW $CRON_ALLOW.old &gt; /dev/null 2&gt;&=
amp;1<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 #remove users for clean enviroment<br>
+-=C2=A0 =C2=A0 su $TEST_USER1 -c &quot;crontab -r&quot;<br>
+-=C2=A0 =C2=A0 su $TEST_USER2 -c &quot;crontab -r&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf /home/$TEST_USER1<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf /home/$TEST_USER2<br>
+-=C2=A0 =C2=A0 =C2=A0 userdel $TEST_USER1<br>
+-=C2=A0 =C2=A0 =C2=A0 userdel $TEST_USER2<br>
+-=C2=A0 =C2=A0 =C2=A0 sleep 1<br>
+-<br>
+-#create 1st user<br>
+-=C2=A0 =C2=A0 =C2=A0 useradd -m -g users $TEST_USER1<br>
+-=C2=A0 =C2=A0 =C2=A0 if [ $? !=3D 0 ]<br>
+-=C2=A0 =C2=A0 then {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Could not add test user $TEST_USER=
1 to system.&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1<br>
+-=C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 fi<br>
+-<br>
+-#create 2nd user<br>
+-=C2=A0 =C2=A0 =C2=A0 useradd -m -g users $TEST_USER2<br>
+-=C2=A0 =C2=A0 if [ $? !=3D 0 ]<br>
+-=C2=A0 =C2=A0 then {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Could not add test user $TEST_USER=
2 to system.&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1<br>
+-=C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 fi<br>
+-}<br>
+-<br>
+-#-----------------------------------------------------------------------<=
br>
+-# FUNCTION:=C2=A0 do_cleanup<br>
+-#-----------------------------------------------------------------------<=
br>
+-do_cleanup(){<br>
+-=C2=A0 =C2=A0 su $TEST_USER1 -c &quot;crontab -r&quot;<br>
+-=C2=A0 =C2=A0 su $TEST_USER2 -c &quot;crontab -r&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf /home/$TEST_USER1<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf /home/$TEST_USER2<br>
+-=C2=A0 =C2=A0 =C2=A0 userdel $TEST_USER1<br>
+-=C2=A0 =C2=A0 =C2=A0 userdel $TEST_USER2<br>
+-=C2=A0 =C2=A0 =C2=A0 rm $CRON_DENY<br>
+-=C2=A0 =C2=A0 =C2=A0 mv $CRON_DENY.old $CRON_DENY &gt; /dev/null 2&gt;&am=
p;1<br>
+-=C2=A0 =C2=A0 =C2=A0 mv $CRON_ALLOW.old $CRON_ALLOW &gt; /dev/null 2&gt;&=
amp;1<br>
+-=C2=A0 =C2=A0 =C2=A0 rm /tmp/cron_allow_test &gt;/dev/null 2&gt;&amp;1<br=
>
+-}<br>
+-<br>
+-#-----------------------------------------------------------------------<=
br>
+-# FUNCTION:=C2=A0 run_test<br>
+-#-----------------------------------------------------------------------<=
br>
+-run_test() {<br>
+-<br>
+-if [ $iam =3D $TEST_USER1 ]<br>
+-then<br>
+-=C2=A0 =C2=A0 =C2=A0 echo &quot;TEST: $CRON_DENY should allow only allow =
those who are not in the file to<br>
+-run cron jobs.&quot;<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 echo &quot;(1) TEST THAT PERSON NOT IN $CRON_DENY IS=
 ABLE TO RUN JOB.&quot;<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 crontab - &lt;&lt; EOF<br>
+-=C2=A0 =C2=A0 =C2=A0 `date &#39;+%M&#39; | awk &#39;{ORS=3D&quot;&quot;; =
print ($1+2)%60&quot; * * * * &quot;}&#39;` echo &quot;TEST JOB RAN&quot; &=
gt;&gt; /tmp/cron_deny_test 2&gt;&amp;1<br>
+-EOF<br>
+-=C2=A0 =C2=A0 =C2=A0 if [ $? !=3D 0 ]; then<br>
+-=C2=A0 =C2=A0 =C2=A0 echo Error while adding crontab for user $TEST_USER1=
<br>
+-=C2=A0 =C2=A0 =C2=A0 exit 1<br>
+-=C2=A0 =C2=A0 =C2=A0 fi<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 echo &quot;sleeping for 130 seconds....&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 sleep 130<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 EXIT_CODE=3D1<br>
+-=C2=A0 =C2=A0 =C2=A0 test -e /tmp/cron_deny_test &amp;&amp; EXIT_CODE=3D0=
<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 if [ $EXIT_CODE =3D 1 ]; then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Cron did not =
allow user to execute job , TEST FAILED&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 else<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Cron allowed =
user to execute test job, TEST PASSED&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 fi<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 rm -f /tmp/cron_deny_test<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 exit $EXIT_CODE<br>
+-fi<br>
+-<br>
+-if [ $iam =3D $TEST_USER2 ]<br>
+-then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;(2) TEST THAT PERSON IN $CRON_DENY=
 IS NOT ABLE TO RUN JOB.&quot;<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 crontab - &lt;&lt; EOF<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 `date &#39;+%M&#39; | awk &#39;{ORS=3D&quot;&=
quot;; print ($1+2)%60 &quot; * * * * &quot;}&#39;` echo &quot;TEST JOB RAN=
&quot; &gt;&gt; /tmp/cron_deny_test 2&gt;&amp;1<br>
+-EOF<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ $? !=3D 0 ]; then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo Error while adding crontab for user $TES=
T_USER2<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;sleeping for 130 seconds....&quot;=
<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 sleep 130<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 EXIT_CODE=3D0<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 test -e /tmp/cron_deny_test1 &amp;&amp; EXIT_=
CODE=3D1<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ $EXIT_CODE =3D 0 ]; then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Cron d=
id not allow user to execute job , TEST PASSED&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Cron a=
llowed user to execute test job, TEST FAILED&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f /tmp/cron_deny_test1<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit $EXIT_CODE<br>
+-fi<br>
+-<br>
+-}<br>
+-<br>
+-#-----------------------------------------------------------------------<=
br>
+-# FUNCTION: main<br>
+-#-----------------------------------------------------------------------<=
br>
+-if [ $iam =3D &quot;root&quot; ]<br>
+-then<br>
+-=C2=A0 =C2=A0 =C2=A0 do_setup<br>
+-=C2=A0 =C2=A0 =C2=A0 echo $TEST_USER2 &gt; $CRON_DENY<br>
+-=C2=A0 =C2=A0 =C2=A0 EXIT_CODE=3D0<br>
+-=C2=A0 =C2=A0 =C2=A0 su $TEST_USER1 -c &quot;$0&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 if [ $? !=3D 0 ]<br>
+-=C2=A0 =C2=A0 =C2=A0 then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0EXIT_CODE=3D1<br>
+-=C2=A0 =C2=A0 =C2=A0 fi<br>
+-=C2=A0 =C2=A0 =C2=A0 su $TEST_USER2 -c &quot;$0&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 if [ $? !=3D 0 ]<br>
+-=C2=A0 =C2=A0 =C2=A0 then EXIT_CODE=3D1<br>
+-=C2=A0 =C2=A0 =C2=A0 fi<br>
+-=C2=A0 =C2=A0 =C2=A0 do_cleanup<br>
+-=C2=A0 =C2=A0 =C2=A0 exit $EXIT_CODE<br>
+-else<br>
+-=C2=A0 =C2=A0 =C2=A0 run_test<br>
+-fi<br>
+diff --git a/testcases/commands/cron/cron_dirs_check.c b/testcases/command=
s/cron/cron_dirs_check.c<br>
+deleted file mode 100644<br>
+index cc9e0ad25..000000000<br>
+--- a/testcases/commands/cron/cron_dirs_check.c<br>
++++ /dev/null<br>
+@@ -1,44 +0,0 @@<br>
+-#include &lt;sys/types.h&gt;<br>
+-#include &lt;sys/param.h&gt;<br>
+-#include &lt;sys/stat.h&gt;<br>
+-#include &lt;stdio.h&gt;<br>
+-#include &lt;unistd.h&gt;<br>
+-<br>
+-/* Check directory Access */<br>
+-int check_directory_access(char *directory)<br>
+-{<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 struct stat statbuf;<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 printf(&quot;Checking %s\n&quot;, directory);<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 if (stat(directory, &amp;statbuf) =3D=3D -1) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;FAIL: %s. C=
ould not obtain directory status\n&quot;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0directory);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 if (statbuf.st_uid !=3D 0) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;FAIL: %s. I=
nvalid owner\n&quot;, directory);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 if ((statbuf.st_mode &amp; S_IWGRP) || (statbuf.st_m=
ode &amp; S_IWOTH)) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;FAIL: %s. I=
nvalid write access\n&quot;, directory);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 printf(&quot;PASS: %s\n&quot;, directory);<br>
+-=C2=A0 =C2=A0 =C2=A0 return 0;<br>
+-}<br>
+-<br>
+-int main(int argc, char *argv[])<br>
+-{<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 if (argc !=3D 2) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;Please ente=
r target directory&quot;);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 return check_directory_access(argv[1]);<br>
+-}<br>
+diff --git a/testcases/commands/cron/cron_dirs_checks01 b/testcases/comman=
ds/cron/cron_dirs_checks01<br>
+deleted file mode 100755<br>
+index ea1215e8d..000000000<br>
+--- a/testcases/commands/cron/cron_dirs_checks01<br>
++++ /dev/null<br>
+@@ -1,46 +0,0 @@<br>
+-#!/bin/sh<br>
+-#*********************************************************************<br=
>
+-#=C2=A0 =C2=A0Copyright (c) International Business Machines=C2=A0 Corp., =
2000<br>
+-#<br>
+-#=C2=A0 =C2=A0This program is free software;=C2=A0 you can redistribute i=
t and/or modify<br>
+-#=C2=A0 =C2=A0it under the terms of the GNU General Public License as pub=
lished by<br>
+-#=C2=A0 =C2=A0the Free Software Foundation; either version 2 of the Licen=
se, or<br>
+-#=C2=A0 =C2=A0(at your option) any later version.<br>
+-#<br>
+-#=C2=A0 =C2=A0This program is distributed in the hope that it will be use=
ful,<br>
+-#=C2=A0 =C2=A0but WITHOUT ANY WARRANTY;=C2=A0 without even the implied wa=
rranty of<br>
+-#=C2=A0 =C2=A0MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 =
See<br>
+-#=C2=A0 =C2=A0the GNU General Public License for more details.<br>
+-#<br>
+-#=C2=A0 =C2=A0You should have received a copy of the GNU General Public L=
icense<br>
+-#=C2=A0 =C2=A0along with this program;=C2=A0 if not, write to the Free So=
ftware<br>
+-#=C2=A0 =C2=A0Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, =
MA 02110-1301 USA<br>
+-#<br>
+-#=C2=A0 FILE=C2=A0 =C2=A0: cron<br>
+-#<br>
+-#=C2=A0 PUROPOSE: Ensure that the following directories only have root wr=
ite access<br>
+-#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0/etc/cron.d<br>
+-#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0/etc/cron.daily<br>
+-#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0/etc/cron.hourly<br>
+-#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0/etc/cron.monthly<br>
+-#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0/etc/cron.weekly<br>
+-#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0/var/spool/cron<br>
+-#=C2=A0 =C2=A0 =C2=A0HISTORY:<br>
+-#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Jerone Young (<a href=3D=
"mailto:jyoung5@us.ibm.com" target=3D"_blank">jyoung5@us.ibm.com</a>)<br>
+-#<br>
+-<br>
+-DIRS=3D&quot;/etc/cron.d /etc/cron.daily /etc/cron.hourly /etc/cron.month=
ly /etc/cron.weekly /var/spool/cron&quot;<br>
+-<br>
+-EXIT_CODE=3D0<br>
+-for i in $DIRS<br>
+-do<br>
+-=C2=A0 =C2=A0 =C2=A0 cron_dirs_check $i<br>
+-=C2=A0 =C2=A0 =C2=A0 if [ $? !=3D 0 ]<br>
+-=C2=A0 =C2=A0 =C2=A0 then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;$i FAILED TES=
T!!!!!&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 EXIT_CODE=3D1<br>
+-=C2=A0 =C2=A0 =C2=A0 fi<br>
+-<br>
+-done<br>
+-<br>
+-exit $EXIT_CODE<br>
+diff --git a/testcases/commands/cron/cron_illegal_cron_lines b/testcases/c=
ommands/cron/cron_illegal_cron_lines<br>
+deleted file mode 100644<br>
+index 3b32dc844..000000000<br>
+--- a/testcases/commands/cron/cron_illegal_cron_lines<br>
++++ /dev/null<br>
+@@ -1,39 +0,0 @@<br>
+-# Collection of illegal cron lines<br>
+-# Comment lines must habe its &#39;#&#39; as first character.<br>
+-# The cron conf line and its description is seperated by &#39;|&#39;.<br>
+-# cron job command &#39;true&#39; is appended automatically<br>
+-<br>
+-# Illegal Minutes<br>
+-61 * * * * | Minute 61<br>
+--1 * * * * | Minute -1 (might be interpreted as range)<br>
+-0.5 * * * * | Minute 0.5<br>
+--1-10 * * * *| Minute Range -1-10<br>
+-0-61 * * * * | Minute Range 0-61<br>
+-<br>
+-# Illegal hours<br>
+-0 25 * * * | Hour 25<br>
+-0 -2 * * * | Hour -2<br>
+-0 3.5 * * *| Hour 3.5<br>
+-0 -4-10 * * *| Hour Range -4-10<br>
+-0 0-25 * * * | Hour Range 0-25<br>
+-<br>
+-# Illegal day of month<br>
+-0 0 32 * * | Day 32<br>
+-0 0 -1 * * | Day -1<br>
+-0 0 3.5 * *| Day 3.5<br>
+-0 0 -3-3 * *| Day Range -3-3<br>
+-0 0 0-32 * *| Day Range 0-32<br>
+-<br>
+-# Illegal month<br>
+-0 0 1 13 * | Month 13<br>
+-0 0 1 -1 * | Month -1<br>
+-0 0 1 2.5 * | Month 2.5<br>
+-0 0 1 -2-3 * | Month Range -2-3<br>
+-0 0 1 0-13 * | Month Range 0-13<br>
+-<br>
+-# Illegal day of week<br>
+-0 0 * * 8 | Day of Week 8<br>
+-0 0 * * -2 | Day of Week -2<br>
+-0 0 * * 2.5 | Day of Week 2.5<br>
+-0 0 * * -7-7 | Day of Week Range -7-7<br>
+-0 0 * * 0-8 | Day of Week Range 0-8<br>
+diff --git a/testcases/commands/cron/cron_neg_tests.sh b/testcases/command=
s/cron/cron_neg_tests.sh<br>
+deleted file mode 100755<br>
+index 9c3d6f6c7..000000000<br>
+--- a/testcases/commands/cron/cron_neg_tests.sh<br>
++++ /dev/null<br>
+@@ -1,141 +0,0 @@<br>
+-#!/bin/bash<br>
+-########################################################<br>
+-#<br>
+-# CHANGE ACTIVITY<br>
+-#<br>
+-#=C2=A0 =C2=A0 10/01/04=C2=A0 Kris Wilson=C2=A0 =C2=A0 RHEL4 only allows =
super user<br>
+-#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0to use crontab.<br>
+-#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0to use crontab.<br>
+-#=C2=A0 =C2=A0 12/03/04=C2=A0 Marty Ridgeway Pull RHEl4 tests out from sc=
ript<br>
+-########################################################<br>
+-<br>
+-iam=3D`whoami`<br>
+-<br>
+-if [ $iam =3D &quot;root&quot; ]; then<br>
+-=C2=A0 =C2=A0 =C2=A0 if [ $# -lt 1 ] ; then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo Either do not run t=
his script as root or start it like<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;=C2=A0 $0 &lt=
;user&gt;&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1<br>
+-=C2=A0 =C2=A0 =C2=A0 fi<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 su $1 -c &quot;$0 $*&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 exit $?<br>
+-fi<br>
+-<br>
+-#<br>
+-# 1. root einen cronjob unterjubeln<br>
+-#<br>
+-<br>
+-finalrc=3D0<br>
+-<br>
+-<br>
+-crontab -u root - &lt;&lt; EOF<br>
+-0 * * * * true<br>
+-EOF<br>
+-<br>
+-rc=3D$?<br>
+-<br>
+-if [ $rc =3D &quot;0&quot; ]; then<br>
+-=C2=A0 =C2=A0 =C2=A0 echo root has now an interesting cron job<br>
+-=C2=A0 =C2=A0 =C2=A0 echo &quot;crontab has a severe security breach (FAI=
L)&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 echo<br>
+-=C2=A0 =C2=A0 =C2=A0 finalrc=3D1<br>
+-else<br>
+-=C2=A0 =C2=A0 =C2=A0 echo &quot;Editing a crontab of another user failed =
successfully (PASS)&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 echo<br>
+-fi<br>
+-<br>
+-<br>
+-#<br>
+-# 2. write some illegal crontabs<br>
+-#<br>
+-<br>
+-# Save crontab<br>
+-<br>
+-#crontab -l &gt; /dev/null 2&gt; /dev/null<br>
+-#if [ $? =3D &quot;0&quot; ]; then<br>
+-#=C2=A0 =C2=A0 =C2=A0echo Saving current crontab...<br>
+-#=C2=A0 =C2=A0 =C2=A0echo<br>
+-#=C2=A0 =C2=A0 =C2=A0crontab -l &gt; /tmp/save-crontab-`whoami`<br>
+-#=C2=A0 =C2=A0 =C2=A0savedcrontab=3D1<br>
+-#=C2=A0 =C2=A0 =C2=A0crontab -r<br>
+-#fi<br>
+-<br>
+-#for line in `cat cron_illegal_cron_lines | grep &#39;^[^#]&#39; | sed -e=
 &#39;s/[ \t][ \t]*/_/g&#39;` ; do<br>
+-#=C2=A0 =C2=A0 =C2=A0line=3D`echo $line | sed -e &#39;s/_/ /g&#39;`<br>
+-=C2=A0 =C2=A0 =C2=A0 # echo Line: &quot;$line&quot;<br>
+-#=C2=A0 =C2=A0 =C2=A0cronconf=3D`echo &quot;$line&quot; | cut -f 1 -d &#3=
9;|&#39;`<br>
+-#=C2=A0 =C2=A0 =C2=A0desc=3D`echo &quot;$line&quot; | cut -f 2 -d &#39;|&=
#39;`<br>
+-<br>
+-#=C2=A0 =C2=A0 =C2=A0echo &quot;Test: $desc&quot;<br>
+-#=C2=A0 =C2=A0 =C2=A0echo &quot;$cronconf true&quot; | crontab -<br>
+-=C2=A0 =C2=A0 =C2=A0 # echo &quot;$cronconf&quot;<br>
+-#=C2=A0 =C2=A0 =C2=A0if [ $? =3D &quot;0&quot; ]; then<br>
+-#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &#39;Test FAILED (o=
r crontab returned wrong exit code)&#39;<br>
+-#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &#39;crontab -l:&#3=
9;<br>
+-#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crontab -l<br>
+-#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0finalrc=3D1<br>
+-#=C2=A0 =C2=A0 =C2=A0fi<br>
+-#=C2=A0 =C2=A0 =C2=A0echo<br>
+-#done<br>
+-<br>
+-<br>
+-# Test whether cron uses setuid correctly<br>
+-<br>
+-echo<br>
+-echo setuid test<br>
+-echo<br>
+-<br>
+-tmpscript=3Dcron_neg01_test<br>
+-rm -rf $tmpscript.out &gt;/dev/null 2&gt;&amp;1<br>
+-<br>
+-<br>
+-cat &gt; /tmp/$tmpscript &lt;&lt; EOF<br>
+-touch /root/halloichwarhier<br>
+-sleep 1<br>
+-cat /root/halloichwarhier ; echo &quot;res:$?&quot;<br>
+-rm /root/halloichwarhier<br>
+-EOF<br>
+-<br>
+-chmod 755 /tmp/$tmpscript<br>
+-<br>
+-#<br>
+-cronline=3D`date &#39;+%M&#39; | awk &#39;{print ($1+2)%60 &quot; * * * *=
 &quot;}&#39;`<br>
+-(echo &quot;$cronline /tmp/$tmpscript &gt;&gt; /tmp/$tmpscript.out 2&gt;&=
gt; /tmp/$tmpscript.out&quot; ; \<br>
+- echo &quot;$cronline /tmp/$tmpscript &gt;&gt; /$tmpscript.out 2&gt;&gt; =
/$tmpscript.out&quot;) \<br>
+- | crontab -<br>
+-<br>
+-echo &quot;sleeping 130 secs...&quot;<br>
+-sleep 130<br>
+-<br>
+-echo<br>
+-echo &quot;Results:&quot;<br>
+-if [ &quot;1&quot; =3D `cat /tmp/$tmpscript.out | grep &quot;res:0&quot; =
| wc -l` ]; then<br>
+-=C2=A0 =C2=A0 =C2=A0 echo &quot;setuid test part 1 successfully failed (P=
ASS)&quot;<br>
+-else<br>
+-=C2=A0 =C2=A0 =C2=A0 echo &quot;cron executed scripts have root privilege=
s! (FAIL)&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 finalrc=3D1<br>
+-fi<br>
+-<br>
+-CODE=3D0<br>
+-test -e /tmp/$tmpscript.out &amp;&amp; CODE=3D1<br>
+-if [ $CODE =3D &quot;1&quot; ]; then<br>
+-=C2=A0 =C2=A0 =C2=A0 echo &quot;setuid test part 2 successfully failed (P=
ASS)&quot;<br>
+-else<br>
+-=C2=A0 =C2=A0 =C2=A0 echo &quot;cron writes script output with root privi=
leges! (FAIL)&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 finalrc=3D1<br>
+-fi<br>
+-echo<br>
+-<br>
+-rm /tmp/$tmpscript* &gt;/dev/null 2&gt;&amp;1<br>
+-crontab -r<br>
+-<br>
+-# Restore crontab<br>
+-<br>
+-if [ &quot;$savedcrontab&quot; =3D &quot;1&quot; ]; then<br>
+-=C2=A0 =C2=A0 =C2=A0 echo &quot;Restoring crontab...&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 cat /tmp/save-crontab-`whoami` | grep &#39;^[^#]&#39=
; | crontab -<br>
+-=C2=A0 =C2=A0 =C2=A0 # rm -r /tmp/save-crontab-`whoami`<br>
+-fi<br>
+-<br>
+-exit $finalrc<br>
+diff --git a/testcases/commands/cron/cron_pos_tests.sh b/testcases/command=
s/cron/cron_pos_tests.sh<br>
+deleted file mode 100755<br>
+index ece114c84..000000000<br>
+--- a/testcases/commands/cron/cron_pos_tests.sh<br>
++++ /dev/null<br>
+@@ -1,118 +0,0 @@<br>
+-#!/bin/bash<br>
+-<br>
+-# Positive tests for cron, that means these tests have to pass<br>
+-<br>
+-iam=3D`whoami`<br>
+-<br>
+-tvar=3D${MACHTYPE%-*}<br>
+-tvar=3D${tvar#*-}<br>
+-<br>
+-if [ &quot;$tvar&quot; =3D &quot;redhat&quot; -o &quot;$tvar&quot; =3D &q=
uot;redhat-linux&quot; ]<br>
+-then<br>
+-=C2=A0 =C2=A0 =C2=A0 CRON_ALLOW=3D&quot;/etc/cron.allow&quot;<br>
+-else<br>
+-=C2=A0 =C2=A0 =C2=A0 CRON_ALLOW=3D&quot;/var/spool/cron/allow&quot;<br>
+-fi<br>
+-<br>
+-<br>
+-if [ $iam =3D &quot;root&quot; ]; then<br>
+-=C2=A0 =C2=A0 =C2=A0 if [ $# -lt 1 ] ; then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo Either do not run t=
his script as root or start it like<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;=C2=A0 $0 &lt=
;user&gt;&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1<br>
+-=C2=A0 =C2=A0 =C2=A0 fi<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 mv $CRON_ALLOW $CRON_ALLOW.old &gt;/dev/null 2&gt;&a=
mp;1<br>
+-=C2=A0 =C2=A0 =C2=A0 su $1 -c &quot;$0 $*&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 RC=3D$?<br>
+-=C2=A0 =C2=A0 =C2=A0 mv $CRON_ALLOW.old $CRON_ALLOW &gt;/dev/null 2&gt;&a=
mp;1<br>
+-=C2=A0 =C2=A0 =C2=A0 exit $RC<br>
+-fi<br>
+-<br>
+-function restorecrontab () {<br>
+-=C2=A0 =C2=A0 =C2=A0 test -e /tmp/crontab-save-$iam &amp;&amp; \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 crontab /tmp/crontab-sav=
e-$iam &amp;&amp; \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f /tmp/crontab-save-=
$iam &amp;&amp; \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo restored old cronta=
b<br>
+-}<br>
+-<br>
+-echo Running as user $iam...<br>
+-<br>
+-# Save current users crontab<br>
+-<br>
+-test -e /tmp/crontab-save-$iam &amp;&amp; rm -f /tmp/crontab-save-$iam<br=
>
+-<br>
+-if [ &quot;0&quot; -lt `crontab -l 2&gt;/dev/null | wc -l` ]; then<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 echo &#39;crontab of this user exists -&gt; creating=
 backup&#39;<br>
+-=C2=A0 =C2=A0 =C2=A0 crontab -l | grep &#39;^[^#]&#39; &gt; /tmp/crontab-=
save-$iam<br>
+-fi<br>
+-<br>
+-<br>
+-# Do tests<br>
+-<br>
+-# 1. Add new job<br>
+-<br>
+-rm -rf /tmp/crontest &gt;/dev/null 2&gt;&amp;1<br>
+-mkdir -p /tmp/crontest<br>
+-<br>
+-cat &gt; /tmp/crontest/testjob_cron01 &lt;&lt; EOF<br>
+-echo Testjob running<br>
+-date<br>
+-EOF<br>
+-<br>
+-chmod 755 /tmp/crontest/testjob_cron01<br>
+-<br>
+-crontab - &lt;&lt; EOF<br>
+-`date &#39;+%M&#39; | awk &#39;{ print ($1+2)%60 &quot; * * * * &quot;<br=
>
+-}&#39;` /tmp/crontest/testjob_cron01 &gt;&gt; /tmp/crontest/output_cron01=
 2&gt;&amp;1<br>
+-EOF<br>
+-<br>
+-rc=3D$?<br>
+-<br>
+-if [ $rc =3D &quot;1&quot; ]; then<br>
+-=C2=A0 =C2=A0 =C2=A0 echo Error while adding crontab for user $iam<br>
+-=C2=A0 =C2=A0 =C2=A0 restorecrontab<br>
+-=C2=A0 =C2=A0 =C2=A0 exit 1<br>
+-fi<br>
+-<br>
+-echo new job added successfully<br>
+-<br>
+-# 2. Wait for execution of job<br>
+-<br>
+-echo &#39;sleeping for 130 seconds...&#39;<br>
+-sleep 130<br>
+-<br>
+-rc=3D1<br>
+-test -e /tmp/crontest/output_cron01 &amp;&amp; rc=3D0<br>
+-<br>
+-if [ $rc =3D &quot;1&quot; ]; then<br>
+-=C2=A0 =C2=A0 =C2=A0 echo Job has not been executed<br>
+-=C2=A0 =C2=A0 =C2=A0 restorecrontab<br>
+-=C2=A0 =C2=A0 =C2=A0 exit 1<br>
+-fi<br>
+-<br>
+-grep &quot;Testjob running&quot; /tmp/crontest/output_cron01<br>
+-rc=3D$?<br>
+-if [ $rc =3D &quot;1&quot; ]; then<br>
+-=C2=A0 =C2=A0 =C2=A0 echo Job has not produced valid output<br>
+-=C2=A0 =C2=A0 =C2=A0 restorecrontab<br>
+-fi<br>
+-<br>
+-echo &#39;job has been executed :-)&#39;<br>
+-echo &quot;testjob&#39;s output:&quot;<br>
+-echo<br>
+-<br>
+-rm -rf /tmp/crontest<br>
+-<br>
+-# 3. Delete crontab<br>
+-<br>
+-crontab -r<br>
+-<br>
+-echo removed crontab<br>
+-<br>
+-# Restore old crontab file<br>
+-<br>
+-restorecrontab<br>
+-<br>
+-exit $rc<br>
+diff --git a/testcases/commands/cron/cron_tests.sh b/testcases/commands/cr=
on/cron_tests.sh<br>
+deleted file mode 100644<br>
+index 47614f9e3..000000000<br>
+--- a/testcases/commands/cron/cron_tests.sh<br>
++++ /dev/null<br>
+@@ -1,276 +0,0 @@<br>
+-#!/bin/sh<br>
+-<br>
+-# Copyright (c) International Business Machines Corp., 2001<br>
+-# Copyright (c) 2017 Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" tar=
get=3D"_blank">pvorel@suse.cz</a>&gt;<br>
+-#<br>
+-# This program is free software; you can redistribute it and/or<br>
+-# modify it under the terms of the GNU General Public License as<br>
+-# published by the Free Software Foundation; either version 2 of<br>
+-# the License, or (at your option) any later version.<br>
+-#<br>
+-# This program is distributed in the hope that it would be useful,<br>
+-# but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
+-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the<br>
+-# GNU General Public License for more details.<br>
+-#<br>
+-# You should have received a copy of the GNU General Public License<br>
+-# along with this program; if not, write the Free Software Foundation,<br=
>
+-# Inc.,=C2=A0 51 Franklin St, Fifth Floor, Boston, MA=C2=A0 02110-1301=C2=
=A0 USA<br>
+-#<br>
+-# Author: Manoj Iyer &lt;<a href=3D"mailto:manjo@mail.utexas.edu" target=
=3D"_blank">manjo@mail.utexas.edu</a>&gt;<br>
+-<br>
+-TST_CNT=3D3<br>
+-TST_TESTFUNC=3Ddo_test<br>
+-TST_NEEDS_TMPDIR=3D1<br>
+-TST_SETUP=3Dsetup<br>
+-TST_CLEANUP=3Dcleanup<br>
+-. tst_test.sh<br>
+-<br>
+-. daemonlib.sh<br>
+-<br>
+-SYSLOG_STARTED=3D<br>
+-CROND_STARTED=3D<br>
+-LOGS=3D<br>
+-<br>
+-grep_logs()<br>
+-{<br>
+-=C2=A0 =C2=A0 =C2=A0 local pattern=3D&quot;$1&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 local fail_msg=3D&quot;$2&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 local pass_msg=3D&quot;${3:-}&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 local n=3D&quot;${4:-10}&quot;<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 local lines=3D10<br>
+-=C2=A0 =C2=A0 =C2=A0 local out=3Dout.$$<br>
+-=C2=A0 =C2=A0 =C2=A0 local err=3Derr.$$<br>
+-=C2=A0 =C2=A0 =C2=A0 local i ret<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 for i in $(seq 1 $n); do<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;$LOGS&quot; ]=
; then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 tail -n $lines $LOGS | grep &quot;$pattern&quot; &gt; $out 2&gt; $err<b=
r>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 journalctl -n $lines | grep &quot;$pattern&quot; &gt; $out 2&gt; $err<b=
r>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret=3D$?<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [ $ret -eq 0 ] &amp;&amp=
; break<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sleep 1<br>
+-=C2=A0 =C2=A0 =C2=A0 done<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 if [ $ret -ne 0 ]; then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res TFAIL &quot;$fai=
l_msg: `cat $err`&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 else<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [ &quot;$pass_msg&quot; =
] &amp;&amp; tst_res TPASS &quot;$pass_msg&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 fi<br>
+-}<br>
+-<br>
+-create_crontab()<br>
+-{<br>
+-=C2=A0 =C2=A0 =C2=A0 local crontab=3Dcronjob.cron<br>
+-=C2=A0 =C2=A0 =C2=A0 local script=3D$1<br>
+-=C2=A0 =C2=A0 =C2=A0 local out=3Dout.$$<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 tst_res TINFO &quot;creating crontab: $script&quot;<=
br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 cat &gt; $crontab &lt;&lt;EOF<br>
+-* * * * * $script<br>
+-EOF<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 tst_res TINFO &quot;installing crontab file&quot;<br=
>
+-=C2=A0 =C2=A0 =C2=A0 crontab $crontab &gt; $out 2&gt;&amp;1<br>
+-=C2=A0 =C2=A0 =C2=A0 if [ $? -ne 0 ]; then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_brk TBROK &quot;cron=
tab: error while installing crontab file: `cat $out`&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1<br>
+-=C2=A0 =C2=A0 =C2=A0 fi<br>
+-=C2=A0 =C2=A0 =C2=A0 return 0<br>
+-}<br>
+-<br>
+-remove_crontab()<br>
+-{<br>
+-=C2=A0 =C2=A0 =C2=A0 local out=3Dout.$$<br>
+-=C2=A0 =C2=A0 =C2=A0 tst_res TINFO &quot;removing crontab file&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 crontab -r &gt; $out 2&gt;&amp;1<br>
+-=C2=A0 =C2=A0 =C2=A0 if [ $? -ne 0 ]; then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_brk TBROK &quot;cron=
tab: error while removing crontab file `cat $out`&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1<br>
+-=C2=A0 =C2=A0 =C2=A0 fi<br>
+-=C2=A0 =C2=A0 =C2=A0 return 0<br>
+-}<br>
+-<br>
+-create_hello_script()<br>
+-{<br>
+-=C2=A0 =C2=A0 =C2=A0 local script=3D$1<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 cat &gt; $script &lt;&lt;EOF<br>
+-#!/bin/sh<br>
+-echo &quot;Hello Hell&quot;<br>
+-exit 0<br>
+-EOF<br>
+-=C2=A0 =C2=A0 =C2=A0 chmod +x $script<br>
+-}<br>
+-<br>
+-install_cron_test()<br>
+-{<br>
+-=C2=A0 =C2=A0 =C2=A0 local script=3D$PWD/cronprg.sh<br>
+-=C2=A0 =C2=A0 =C2=A0 local cron_out=3D$PWD/tst1_cron.out<br>
+-=C2=A0 =C2=A0 =C2=A0 local err=3Derr.log<br>
+-=C2=A0 =C2=A0 =C2=A0 local sleep_sec<br>
+-=C2=A0 =C2=A0 =C2=A0 local ts_min1 ts_min2 fail<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 tst_res TINFO &quot;test install cron job&quot;<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 cat &gt; $script &lt;&lt;EOF<br>
+-#! /bin/sh<br>
+-DATE=3D\`LC_ALL=3DC date\`<br>
+-echo &quot;Hello Hell today is \$DATE&quot; &gt; $cron_out 2&gt;&amp;1<br=
>
+-exit 0<br>
+-EOF<br>
+-=C2=A0 =C2=A0 =C2=A0 chmod +x $script<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 create_crontab $script 2&gt; $err<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 if [ $? -ne 0 ]; then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_brk TBROK &quot;cron=
tab: error while creating cron job: `cat $err`&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 else<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res TINFO &quot;cron=
 job installed successfully&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 fi<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 grep_logs &#39;crontab.*REPLACE&#39; \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;cron activity not =
recorded&quot; \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;cron activity logg=
ed&quot;<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 # Sleep 3s after next minute since the loop below sl=
eeps for 62 seconds, we<br>
+-=C2=A0 =C2=A0 =C2=A0 # should start this 5-iteration loop closely followi=
ng the start of a<br>
+-=C2=A0 =C2=A0 =C2=A0 # minute.<br>
+-=C2=A0 =C2=A0 =C2=A0 sleep_sec=3D$((123-`date +%-S`))<br>
+-=C2=A0 =C2=A0 =C2=A0 tst_res TINFO &quot;sleep for ${sleep_sec}s&quot;<br=
>
+-=C2=A0 =C2=A0 =C2=A0 sleep $sleep_sec<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 # $script executed by the cron job will record the d=
ate and time into file<br>
+-=C2=A0 =C2=A0 =C2=A0 # $cron_out. Get the minute recorded by the program,=
 sleep to allow the cron<br>
+-=C2=A0 =C2=A0 =C2=A0 # job to update file after 1m, and check if the valu=
e is advanced by 1.<br>
+-=C2=A0 =C2=A0 =C2=A0 for i in $(seq 1 5); do<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res TINFO &quot;loop=
: $i: start&quot;<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ ! -f &quot;$cron_ou=
t&quot; ]; then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 tst_res TFAIL &quot;loop $i: file $cron_out doesn&#39;t exist&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 fail=3D1<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ts_min1=3D$(awk &#39;{pr=
int $8}&#39; $cron_out | awk -F: &#39;{printf(&quot;%d&quot;, $2);}&#39;)<b=
r>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # wait for the cron job =
to update output file<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sleep 62<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Check the time recorde=
d in output file, this should be 1 minute ahead of<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # what was recored earli=
er.<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ts_min2=3D$(awk &#39;{pr=
int $8}&#39; $cron_out | awk -F: &#39;{printf(&quot;%d&quot;, $2);}&#39;)<b=
r>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;x${ts_min1}&q=
uot; =3D &quot;x&quot; ] || [ &quot;x${ts_min2}&quot; =3D &quot;x&quot; ]; =
then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 tst_res TFAIL &quot;loop $i: failed to get time: ts_min1: $ts_min1, ts_=
min2: $ts_min2&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 fail=3D1<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [ $ts_min1 -eq 59 ] &amp=
;&amp; ts_min1=3D0 || ts_min1=3D$(( $ts_min1+1 ))<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ $ts_min2 -ne $ts_mi=
n1 ]; then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 tst_res TFAIL &quot;loop $i: failed to update every minute: expected: $=
ts_min1, received: $ts_min2&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 fail=3D1<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+-=C2=A0 =C2=A0 =C2=A0 done<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 if [ ! &quot;$fail&quot; ]; then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grep_logs &quot;CMD ($sc=
ript)&quot; \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;failed to install cron job installed and execute it&quot; \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;cron job installed and executed&quot; 1<br>
+-=C2=A0 =C2=A0 =C2=A0 fi<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 remove_crontab<br>
+-}<br>
+-<br>
+-remove_cron_job_test()<br>
+-{<br>
+-=C2=A0 =C2=A0 =C2=A0 local script=3D$PWD/cronprg.sh<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 tst_res TINFO &quot;test remove cron job&quot;<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 create_hello_script $script<br>
+-=C2=A0 =C2=A0 =C2=A0 create_crontab $script<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 grep_logs &#39;crontab.*REPLACE&#39; \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;crontab activity n=
ot recorded&quot;<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 remove_crontab &amp;&amp; grep_logs DELETE \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;crontab activity n=
ot recorded&quot; \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;crontab removed th=
e cron job&quot; 1<br>
+-}<br>
+-<br>
+-list_cron_jobs_test()<br>
+-{<br>
+-=C2=A0 =C2=A0 =C2=A0 local script=3D$PWD/cronprg.sh<br>
+-=C2=A0 =C2=A0 =C2=A0 local out=3Dcron.out<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 tst_res TINFO &quot;test list installed cron jobs&qu=
ot;<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 create_hello_script $script<br>
+-=C2=A0 =C2=A0 =C2=A0 create_crontab $script<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 tst_res TINFO &quot;crontab: listing cron jobs&quot;=
<br>
+-=C2=A0 =C2=A0 =C2=A0 crontab -l | grep &quot;$script&quot; &gt; $out 2&gt=
;&amp;1 || \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_brk TBROK &quot;cron=
tab failed while listing installed cron jobs: `cat $out`&quot;<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 remove_crontab<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 crontab -l &gt; $out 2&gt;&amp;1<br>
+-=C2=A0 =C2=A0 =C2=A0 if [ $? -ne 0 ]; then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grep -q &quot;no crontab=
 for&quot; $out<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ $? -ne 0 ]; then<br=
>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 tst_res TFAIL &quot;crontab failed removing cron job: `cat $out`&quot;<=
br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 tst_res TPASS &quot;crontab did not list any cron jobs&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+-=C2=A0 =C2=A0 =C2=A0 else<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res TFAIL &quot;cron=
tab failed removing cron job: `cat $out`&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 fi<br>
+-}<br>
+-<br>
+-setup()<br>
+-{<br>
+-=C2=A0 =C2=A0 =C2=A0 if [ &quot;$SYSLOG_DAEMON&quot; ]; then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status_daemon $SYSLOG_DA=
EMON<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ $? -ne 0 ]; then<br=
>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 restart_daemon $SYSLOG_DAEMON<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 SYSLOG_STARTED=3D1<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+-=C2=A0 =C2=A0 =C2=A0 fi<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 if [ &quot;$CROND_DAEMON&quot; ]; then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status_daemon $CROND_DAE=
MON<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ $? -ne 0 ]; then<br=
>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 restart_daemon $CROND_DAEMON<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 CROND_STARTED=3D1<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+-=C2=A0 =C2=A0 =C2=A0 fi<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 for f in /var/log/syslog /var/log/messages /var/log/=
cron /var/log/cron.log; do<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [ -f &quot;$f&quot; ] &a=
mp;&amp; LOGS=3D&quot;$f $LOGS&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 done<br>
+-}<br>
+-<br>
+-cleanup()<br>
+-{<br>
+-=C2=A0 =C2=A0 =C2=A0 [ &quot;$SYSLOG_STARTED&quot; =3D &quot;1&quot; ] &a=
mp;&amp; stop_daemon $SYSLOG_DAEMON<br>
+-=C2=A0 =C2=A0 =C2=A0 [ &quot;$CROND_STARTED&quot; =3D &quot;1&quot; ] &am=
p;&amp; stop_daemon $CROND_DAEMON<br>
+-}<br>
+-<br>
+-do_test()<br>
+-{<br>
+-=C2=A0 =C2=A0 =C2=A0 case $1 in<br>
+-=C2=A0 =C2=A0 =C2=A0 1) install_cron_test;;<br>
+-=C2=A0 =C2=A0 =C2=A0 2) remove_cron_job_test;;<br>
+-=C2=A0 =C2=A0 =C2=A0 3) list_cron_jobs_test;;<br>
+-=C2=A0 =C2=A0 =C2=A0 esac<br>
+-}<br>
+-<br>
+-tst_run<br>
+diff --git a/testcases/commands/su/Makefile b/testcases/commands/su/Makefi=
le<br>
+deleted file mode 100644<br>
+index da2ff036f..000000000<br>
+--- a/testcases/commands/su/Makefile<br>
++++ /dev/null<br>
+@@ -1,31 +0,0 @@<br>
+-#<br>
+-#=C2=A0 =C2=A0 commands/su testcases Makefile.<br>
+-#<br>
+-#=C2=A0 =C2=A0 Copyright (C) 2009, Cisco Systems Inc.<br>
+-#<br>
+-#=C2=A0 =C2=A0 This program is free software; you can redistribute it and=
/or modify<br>
+-#=C2=A0 =C2=A0 it under the terms of the GNU General Public License as pu=
blished by<br>
+-#=C2=A0 =C2=A0 the Free Software Foundation; either version 2 of the Lice=
nse, or<br>
+-#=C2=A0 =C2=A0 (at your option) any later version.<br>
+-#<br>
+-#=C2=A0 =C2=A0 This program is distributed in the hope that it will be us=
eful,<br>
+-#=C2=A0 =C2=A0 but WITHOUT ANY WARRANTY; without even the implied warrant=
y of<br>
+-#=C2=A0 =C2=A0 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0=
 See the<br>
+-#=C2=A0 =C2=A0 GNU General Public License for more details.<br>
+-#<br>
+-#=C2=A0 =C2=A0 You should have received a copy of the GNU General Public =
License along<br>
+-#=C2=A0 =C2=A0 with this program; if not, write to the Free Software Foun=
dation, Inc.,<br>
+-#=C2=A0 =C2=A0 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA=
.<br>
+-#<br>
+-# Ngie Cooper, July 2009<br>
+-#<br>
+-<br>
+-top_srcdir=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ?=3D ../../..<br>
+-<br>
+-include $(top_srcdir)/include/mk/<a href=3D"http://env_pre.mk" rel=3D"nor=
eferrer" target=3D"_blank">env_pre.mk</a><br>
+-<br>
+-INSTALL_TARGETS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0:=
=3D su01 su01_s1 su_set_passwd<br>
+-<br>
+-MAKE_TARGETS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 :=3D<br>
+-<br>
+-include $(top_srcdir)/include/mk/<a href=3D"http://generic_leaf_target.mk=
" rel=3D"noreferrer" target=3D"_blank">generic_leaf_target.mk</a><br>
+diff --git a/testcases/commands/su/su01 b/testcases/commands/su/su01<br>
+deleted file mode 100755<br>
+index 34386d937..000000000<br>
+--- a/testcases/commands/su/su01<br>
++++ /dev/null<br>
+@@ -1,181 +0,0 @@<br>
+-#!/bin/bash<br>
+-#*********************************************************************<br=
>
+-#=C2=A0 =C2=A0Copyright (c) International Business Machines=C2=A0 Corp., =
2003, 2004<br>
+-#<br>
+-#=C2=A0 =C2=A0This program is free software;=C2=A0 you can redistribute i=
t and/or modify<br>
+-#=C2=A0 =C2=A0it under the terms of the GNU General Public License as pub=
lished by<br>
+-#=C2=A0 =C2=A0the Free Software Foundation; either version 2 of the Licen=
se, or<br>
+-#=C2=A0 =C2=A0(at your option) any later version.<br>
+-#<br>
+-#=C2=A0 =C2=A0This program is distributed in the hope that it will be use=
ful,<br>
+-#=C2=A0 =C2=A0but WITHOUT ANY WARRANTY;=C2=A0 without even the implied wa=
rranty of<br>
+-#=C2=A0 =C2=A0MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 =
See<br>
+-#=C2=A0 =C2=A0the GNU General Public License for more details.<br>
+-#<br>
+-#=C2=A0 =C2=A0You should have received a copy of the GNU General Public L=
icense<br>
+-#=C2=A0 =C2=A0along with this program;=C2=A0 if not, write to the Free So=
ftware<br>
+-#=C2=A0 =C2=A0Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, =
MA 02110-1301 USA<br>
+-#<br>
+-#=C2=A0 FILE=C2=A0 =C2=A0: su<br>
+-#<br>
+-#=C2=A0 PURPOSE: Tests the basic functionality of `su`.<br>
+-#<br>
+-#=C2=A0 SETUP: The program `/usr/bin/expect&#39; MUST be installed.<br>
+-#<br>
+-#=C2=A0 HISTORY:<br>
+-#=C2=A0 =C2=A0 03/03=C2=A0 =C2=A0 Dustin Kirkland (<a href=3D"mailto:dkir=
klan@us.ibm.com" target=3D"_blank">dkirklan@us.ibm.com</a>)<br>
+-#=C2=A0 =C2=A0 03/03=C2=A0 =C2=A0 Jerone Young=C2=A0 =C2=A0 (<a href=3D"m=
ailto:jeroney@us.ibm.com" target=3D"_blank">jeroney@us.ibm.com</a>)<br>
+-#=C2=A0 =C2=A0 10/01/04 Kris Wilson=C2=A0 =C2=A0 =C2=A0Port to Red Hat<br=
>
+-#<br>
+-#*********************************************************************<br=
>
+-<br>
+-echo &quot;This script contains bashism that needs to be fixed!&quot;<br>
+-<br>
+-if [ -z ${TCbin} ]<br>
+-then<br>
+-=C2=A0 =C2=A0export TCbin=3D$PWD<br>
+-fi<br>
+-<br>
+-export TEST_USER1=3D&quot;su_usr1&quot;<br>
+-<br>
+-tvar=3D${MACHTYPE%-*}<br>
+-tvar=3D${tvar#*-}<br>
+-<br>
+-# need to export tvar for su01_s1<br>
+-export tvar<br>
+-printf &quot;Machine type is: $tvar\n\n&quot;<br>
+-<br>
+-if [ &quot;$tvar&quot; =3D &quot;redhat&quot; -o &quot;$tvar&quot; =3D &q=
uot;redhat-linux&quot; ]<br>
+-# Need to also set group for TEST_USER2<br>
+-then<br>
+-export TEST_USER1_GROUP=3D&quot;wheel&quot;<br>
+-export TEST_USER2_GROUP=3D&quot;wheel&quot;<br>
+-else<br>
+-export TEST_USER1_GROUP=3D&quot;trusted&quot;<br>
+-export TEST_USER2_GROUP=3D&quot;trusted&quot;<br>
+-fi<br>
+-export TEST_USER1_PASSWD=3D&quot;eal&quot;<br>
+-export TEST_USER1_ENCRYPTED_PASSWD=3D&quot;42VmxaOByKwlA&quot;<br>
+-export TEST_USER1_NEW_PASSWD=3D&quot;a_very_good_and_long_password&quot;<=
br>
+-export TEST_USER1_HOMEDIR=3D&quot;/home/$TEST_USER1&quot;<br>
+-<br>
+-export TEST_USER2=3D&quot;su_usr2&quot;<br>
+-# Group needs to be trusted for Red Hat.<br>
+-#export TEST_USER2_GROUP=3D&quot;trusted&quot;<br>
+-export TEST_USER2_PASSWD=3D&quot;eal&quot;<br>
+-export TEST_USER2_ENCRYPTED_PASSWD=3D&quot;42VmxaOByKwlA&quot;<br>
+-export TEST_USER2_HOMEDIR=3D&quot;/home/$TEST_USER2&quot;<br>
+-<br>
+-#This is for enviroment test<br>
+-export TEST_LINE=3D&quot;YOU_HAVE_THE_VARIABLE&quot;<br>
+-export TEST_ENV_FILE=3D&quot;/tmp/TEST_ENV_FILE_ROOT&quot;<br>
+-export TEST_ENV_FILE_USER=3D&quot;/tmp/TEST_ENV_FILE_USER&quot;<br>
+-export TEST_ENV_FILE2=3D&quot;/tmp/TEST_ENV_FILE_ROOT2&quot;<br>
+-#-----------------------------------------------------------------------<=
br>
+-# FUNCTION:=C2=A0 do_setup<br>
+-#-----------------------------------------------------------------------<=
br>
+-<br>
+-do_setup(){<br>
+-<br>
+-#REMOVE ANY TEMPOARY FILES THAT MAY STILL BE AROUND<br>
+-rm -f $TEST_ENV_FILE_USER &gt; /dev/null 2&gt;&amp;1<br>
+-rm -f $TEST_ENV_FILE2 &gt; /dev/null 2&gt;&amp;1<br>
+-rm -f $TEST_ENV_FILE &gt; /dev/null 2&gt;&amp;1<br>
+-<br>
+-<br>
+-#Create 1st test user<br>
+-=C2=A0 =C2=A0 #erase user if he may exist , so we can have a clean en<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf /home/$TEST_USER1<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 getent passwd $TEST_USER1 &gt; /dev/null 2&gt=
;&amp;1 &amp;&amp; userdel $TEST_USER1<br>
+-=C2=A0 =C2=A0 =C2=A0 sleep 1<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 useradd -m -g users $TEST_USER1<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ $? !=3D 0 ]<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 then {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Could =
not add test user $TEST_USER1.&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 usermod -G users,$TEST_U=
SER1_GROUP $TEST_USER1<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 #create users home directory (SLES 8 does not do thi=
s, even when specified in adduser)<br>
+-# Only do this if not RH; RH creates the directory.<br>
+-=C2=A0 =C2=A0 =C2=A0 if [ &quot;$tvar&quot; !=3D &quot;redhat&quot; -a &q=
uot;$tvar&quot; !=3D &quot;redhat-linux&quot; ]<br>
+-=C2=A0 =C2=A0 =C2=A0 then {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 USER_UID=3D`id -u $TEST_USER1`<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 USER_GID=3D`id -g $TEST_USER1`<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p $TEST_USER1_HOMEDIR<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 chown -R $USER_UID.$USER_GID $TEST_USE=
R1_HOMEDIR<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 =C2=A0 fi<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 usermod -p $TEST_USER1_ENCRYPTED_PASSWD $TEST=
_USER1 &gt; /dev/null 2&gt;&amp;1<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ $? !=3D 0 ]<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 then {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Could =
not set password for test user $TEST_USER1&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+-<br>
+-#Create 2nd test user<br>
+-=C2=A0 =C2=A0 =C2=A0 #erase user if he may exist , so we can have a clean=
 en<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf /home/$TEST_USER2<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 getent passwd $TEST_USER2 &gt; /dev/null 2&gt=
;&amp;1 &amp;&amp; userdel $TEST_USER2<br>
+-=C2=A0 =C2=A0 =C2=A0 sleep 1<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 useradd -m -g users $TEST_USER2<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ $? !=3D 0 ]<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 then {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Could =
not add test user $TEST_USER2.&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 usermod -G users,$TEST_U=
SER2_GROUP $TEST_USER2<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 #create users home diretory (SLES 8 does not do this=
, even when specified in adduser)<br>
+-# Only do this if not RH; RH creates the directory.<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;$tvar&quot; !=3D &quot;redhat&quot=
; -a &quot;$tvar&quot; !=3D &quot;redhat-linux&quot; ]<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 then {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 USER_UID=3D`id -u $TEST_USER2`<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 USER_GID=3D`id -g $TEST_USER2`<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p $TEST_USER2_HOMEDIR<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 chown -R $USER_UID.$USER_GID $TEST_USE=
R2_HOMEDIR<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 =C2=A0 fi<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 usermod -p $TEST_USER2_ENCRYPTED_PASSWD $TEST=
_USER2 &gt; /dev/null 2&gt;&amp;1<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ $? !=3D 0 ]<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 then {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Could =
not set password for test user $TEST_USER2&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+-}<br>
+-<br>
+-<br>
+-#-----------------------------------------------------------------------<=
br>
+-# FUNCTION:=C2=A0 do_cleanup<br>
+-#-----------------------------------------------------------------------<=
br>
+-<br>
+-do_cleanup() {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf /home/$TEST_USER1<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf /home/$TEST_USER2<br>
+-=C2=A0 =C2=A0 =C2=A0 userdel $TEST_USER1<br>
+-=C2=A0 =C2=A0 =C2=A0 userdel $TEST_USER2<br>
+-=C2=A0 =C2=A0 =C2=A0 #REMOVE ANY TEMPOARY FILES THAT MAY STILL BE AROUND<=
br>
+-=C2=A0 =C2=A0 =C2=A0 rm -f $TEST_ENV_FILE_USER &gt; /dev/null 2&gt;&amp;1=
<br>
+-=C2=A0 =C2=A0 =C2=A0 rm -f $TEST_ENV_FILE2 &gt; /dev/null 2&gt;&amp;1<br>
+-=C2=A0 =C2=A0 =C2=A0 rm -f $TEST_ENV_FILE &gt; /dev/null 2&gt;&amp;1<br>
+-}<br>
+-<br>
+-#-----------------------------------------------------------------------<=
br>
+-# FUNCTION:=C2=A0 MAIN<br>
+-#-----------------------------------------------------------------------<=
br>
+-do_setup<br>
+-/bin/su $TEST_USER1 -c ${TCbin}/su01_s1<br>
+-EXIT_CODE=3D$?<br>
+-do_cleanup<br>
+-exit $EXIT_CODE<br>
+diff --git a/testcases/commands/su/su01_s1 b/testcases/commands/su/su01_s1=
<br>
+deleted file mode 100755<br>
+index 313207b64..000000000<br>
+--- a/testcases/commands/su/su01_s1<br>
++++ /dev/null<br>
+@@ -1,486 +0,0 @@<br>
+-#! /usr/bin/expect -f<br>
+-#*********************************************************************<br=
>
+-#=C2=A0 =C2=A0Copyright (c) International Business Machines=C2=A0 Corp., =
2003, 2004, 2007<br>
+-#<br>
+-#=C2=A0 =C2=A0This program is free software;=C2=A0 you can redistribute i=
t and/or modify<br>
+-#=C2=A0 =C2=A0it under the terms of the GNU General Public License as pub=
lished by<br>
+-#=C2=A0 =C2=A0the Free Software Foundation; either version 2 of the Licen=
se, or<br>
+-#=C2=A0 =C2=A0(at your option) any later version.<br>
+-#<br>
+-#=C2=A0 =C2=A0This program is distributed in the hope that it will be use=
ful,<br>
+-#=C2=A0 =C2=A0but WITHOUT ANY WARRANTY;=C2=A0 without even the implied wa=
rranty of<br>
+-#=C2=A0 =C2=A0MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 =
See<br>
+-#=C2=A0 =C2=A0the GNU General Public License for more details.<br>
+-#<br>
+-#=C2=A0 =C2=A0You should have received a copy of the GNU General Public L=
icense<br>
+-#=C2=A0 =C2=A0along with this program;=C2=A0 if not, write to the Free So=
ftware<br>
+-#=C2=A0 =C2=A0Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, =
MA 02110-1301 USA<br>
+-#<br>
+-#=C2=A0 FILE=C2=A0 =C2=A0: su<br>
+-#<br>
+-#=C2=A0 PURPOSE: Tests the basic functionality of `su`.<br>
+-#<br>
+-#=C2=A0 SETUP: The program `/usr/bin/expect&#39; MUST be installed.<br>
+-#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The user invoking this test script mus=
t NOT be &quot;root&quot;.<br>
+-#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The PASSWD variab=
le should be set prior to execution<br>
+-#<br>
+-#=C2=A0 HISTORY:<br>
+-#=C2=A0 =C2=A0 =C2=A003/03=C2=A0 =C2=A0 =C2=A0Dustin Kirkland (<a href=3D=
"mailto:dkirklan@us.ibm.com" target=3D"_blank">dkirklan@us.ibm.com</a>)<br>
+-#=C2=A0 =C2=A0 =C2=A003/03=C2=A0 =C2=A0 =C2=A0Jerone Young=C2=A0 =C2=A0 (=
<a href=3D"mailto:jeroney@us.ibm.com" target=3D"_blank">jeroney@us.ibm.com<=
/a>)<br>
+-#=C2=A0 =C2=A0 =C2=A010/01/04=C2=A0 Kris Wilson=C2=A0 =C2=A0 =C2=A0Skip t=
est 7 if RedHat; no -e option.<br>
+-#=C2=A0 =C2=A0 =C2=A005/23/07=C2=A0 Kris Wilson=C2=A0 =C2=A0 =C2=A0Make t=
est 7 work for SLES.<br>
+-########################################################################<=
br>
+-<br>
+-# The root user cannot succesfully execute su test because the root user<=
br>
+-# is able to become anyone without entering passwords<br>
+-set whoami [ exec whoami ]<br>
+-if { $whoami=3D=3D&quot;root&quot; } {<br>
+-=C2=A0 send_user &quot;ERROR: You must execute the &#39;su&#39; tests as =
a non-root user\n&quot;<br>
+-=C2=A0 exit 1<br>
+-}<br>
+-<br>
+-#Grab input from enviroment<br>
+-if [info exists env(PASSWD)] {<br>
+-=C2=A0 =C2=A0 =C2=A0 set PASSWD $env(PASSWD)<br>
+-} else {<br>
+-=C2=A0 =C2=A0 =C2=A0 send_user &quot;YOU NEED TO SET ENVIROMENT VARIABLE =
PASSWD. \n&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 exit 1<br>
+-}<br>
+-<br>
+-if [info exists env(TEST_USER2)] {<br>
+-=C2=A0 set USER1 $env(TEST_USER2)<br>
+-} else {<br>
+-=C2=A0 =C2=A0 =C2=A0 send_user &quot;YOU MUST SET ENVIRONMENT VARIABLE TE=
ST_USER2&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 exit 1<br>
+-}<br>
+-<br>
+-# Need the release type from su01<br>
+-if [info exists env(tvar)] {<br>
+-=C2=A0 set distro $env(tvar)<br>
+-} else {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 send_user &quot;YOU MUST SET ENVIORMENT VARIA=
BLE tvar&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1<br>
+-}<br>
+-<br>
+-if [info exists env(TEST_USER2_PASSWD)] {<br>
+-=C2=A0 set USER1_PASSWORD $env(TEST_USER2_PASSWD)<br>
+-} else {<br>
+-=C2=A0 send_user &quot;YOU MUST SET ENVIROMENT VARIABLE TEST_USER2_PASSWD=
&quot;<br>
+-=C2=A0 exit 1<br>
+-}<br>
+-<br>
+-if [info exists env(TEST_LINE)] {<br>
+-=C2=A0 set TEST_LINE_ENV $env(TEST_LINE)<br>
+-} else {<br>
+-=C2=A0 send_user &quot;YOU MUST SET ENVIROMENT VARIABLE TEST_LINE&quot;<b=
r>
+-=C2=A0 exit 1<br>
+-}<br>
+-<br>
+-<br>
+-if [info exists env(TEST_ENV_FILE)] {<br>
+-=C2=A0 set TEST_ENV_FILE $env(TEST_ENV_FILE)<br>
+-} else {<br>
+-=C2=A0 send_user &quot;YOU MUST SET ENVIROMENT VARIABLE TEST_ENV_FILE_USE=
R&quot;<br>
+-=C2=A0 exit 1<br>
+-}<br>
+-<br>
+-if [info exists env(TEST_ENV_FILE2)] {<br>
+-=C2=A0 set TEST_ENV_FILE2 $env(TEST_ENV_FILE2)<br>
+-} else {<br>
+-=C2=A0 send_user &quot;YOU MUST SET ENVIROMENT VARIABLE TEST_ENV_FILE2&qu=
ot;<br>
+-=C2=A0 exit 1<br>
+-}<br>
+-<br>
+-<br>
+-if [info exists env(TEST_ENV_FILE_USER)] {<br>
+-=C2=A0 set TEST_ENV_FILE_USER1 $env(TEST_ENV_FILE_USER)<br>
+-} else {<br>
+-=C2=A0 send_user &quot;YOU MUST SET ENVIROMENT VARIABLE TEST_ENV_FILE_USE=
R&quot;<br>
+-=C2=A0 exit 1<br>
+-}<br>
+-<br>
+-if [info exists env(TEST_USER1_NEW_PASSWD)] {<br>
+-=C2=A0 set USER1_NEW_PASSWORD $env(TEST_USER1_NEW_PASSWD)<br>
+-} else {<br>
+-=C2=A0 send_user &quot;YOU MUST SET ENVIROMENT VARIABLE TEST_USER1_NEW_PA=
SSWD&quot;<br>
+-=C2=A0 exit 1<br>
+-}<br>
+-<br>
+-<br>
+-set script_exit_code 0<br>
+-set i_can_root 0<br>
+-<br>
+-send_user &quot;Starting &#39;su&#39; Testing\n&quot;<br>
+-<br>
+-# 1) su with no parameters and correct password.<br>
+-#=C2=A0 =C2=A0 - The su command should return a result code of 0<br>
+-#=C2=A0 =C2=A0 - The user ID should be root<br>
+-#=C2=A0 =C2=A0 - The user environment should be that of the invoking proc=
ess<br>
+-#=C2=A0 =C2=A0 - The command should create a new shell with a new process=
 ID<br>
+-<br>
+-send_user &quot;\nTEST: su with no parameters and correct password\n&quot=
;<br>
+-<br>
+-set i_am_root 0<br>
+-# run &quot;whoami&quot; to test user ID inside su shell<br>
+-spawn /bin/su -c whoami<br>
+-set i_am_root 0<br>
+-expect {<br>
+-=C2=A0 &quot;Password:&quot; {<br>
+-=C2=A0 =C2=A0 =C2=A0 send &quot;$PASSWD\r&quot;<br>
+-=C2=A0 =C2=A0 expect {<br>
+-=C2=A0 =C2=A0 =C2=A0 &quot;root&quot; { set i_am_root 1<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set i_can_root 1<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 }<br>
+-=C2=A0 }<br>
+-}<br>
+-<br>
+-# capture result code<br>
+-set codes [wait]<br>
+-set pid [lindex $codes 0]<br>
+-set exit_code [lindex $codes 3]<br>
+-<br>
+-#Check that su user has same enviroment as current user<br>
+-set i_have_env 0<br>
+-set test_env_var &quot; &quot;<br>
+-if { $i_am_root=3D=3D1 } {<br>
+-=C2=A0 =C2=A0 =C2=A0 spawn su -c &quot;/bin/su root -c \&quot;echo \\\$TE=
ST_LINE &gt; $TEST_ENV_FILE\&quot;&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 expect {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Password:&qu=
ot; {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 send &quot;$PASSWD\r&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 =C2=A0 expect eof<br>
+-=C2=A0 =C2=A0 =C2=A0 wait<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 set test_env_var [exec cat $TEST_ENV_FILE]<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 if=C2=A0 { $test_env_var=3D=3D$TEST_LINE_ENV } {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set i_have_env 1<br>
+-=C2=A0 =C2=A0 =C2=A0 } else {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 send_user &quot;/bin/su =
with correct password (FAILED), the enviroment was not kept after su.\n&quo=
t;<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
+-}<br>
+-<br>
+-<br>
+-#this variable is for any test, it can&#39;t run correctly if this test f=
ails<br>
+-set test_one_passed 0<br>
+-<br>
+-if { ($i_am_root=3D=3D1) &amp;&amp; ($exit_code=3D=3D0) &amp;&amp; ($pid&=
gt;0) &amp;&amp; ($i_have_env=3D=3D1) } {<br>
+-=C2=A0 =C2=A0 =C2=A0 send_user &quot;/bin/su with correct password &amp; =
enviroment check ( PASSED )\n&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 set test_one_passed 1<br>
+-} else {<br>
+-=C2=A0 =C2=A0 =C2=A0 send_user &quot;/bin/su with correct password ( FAIL=
ED )\n&quot;<br>
+-=C2=A0 =C2=A0 set script_exit_code 1<br>
+-}<br>
+-<br>
+-<br>
+-# 2) su with no parameters and incorrect password.<br>
+-#=C2=A0 =C2=A0 =C2=A0 =C2=A0- The su command should return a result code =
of non-0<br>
+-#=C2=A0 =C2=A0 =C2=A0- The user should be returned to the invoking shell<=
br>
+-#=C2=A0 =C2=A0 =C2=A0- An appropriate failure message should be displayed=
<br>
+-<br>
+-send_user &quot;\nTEST: su with no parameters and incorrect password \n&q=
uot;<br>
+-<br>
+-set displayed_error 0<br>
+-# run &quot;whoami&quot; to test user ID inside su shell<br>
+-spawn /bin/su -c whoami<br>
+-set displayed_error 0<br>
+-expect {<br>
+-=C2=A0 &quot;Password:&quot; {<br>
+-=C2=A0 =C2=A0 send &quot;wrong_$PASSWD\r&quot;<br>
+-=C2=A0 =C2=A0 expect {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;su: incorrect password&quot; { set di=
splayed_error 1 }<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;su: Authentication failure&quot; { se=
t displayed_error 1 }<br>
+-=C2=A0 =C2=A0 }<br>
+-=C2=A0 }<br>
+-}<br>
+-<br>
+-# capture result code<br>
+-set codes [wait]<br>
+-set pid [lindex $codes 0]<br>
+-set exit_code [lindex $codes 3]<br>
+-<br>
+-#Added for arm architecture<br>
+-<br>
+-send_user &quot;\ndisplayed_error=3D$displayed_error&quot;<br>
+-send_user &quot;\nexit_code=3D$exit_code&quot;<br>
+-send_user &quot;\npid=3D$pid\n&quot;<br>
+-<br>
+-if { ($displayed_error=3D=3D1) &amp;&amp; ($exit_code!=3D0) &amp;&amp; ($=
pid&gt;0) } {<br>
+-=C2=A0 send_user &quot;/bin/su with incorrect password ( PASSED )\n&quot;=
<br>
+-} else {<br>
+-=C2=A0 send_user &quot;/bin/su with incorrect password ( FAILED )\n&quot;=
<br>
+-=C2=A0 set script_exit_code 1<br>
+-}<br>
+-<br>
+-# 3) su to root using name parameter and correct password.<br>
+-# - The su command should return a result code of 0<br>
+-# - The user ID should be root<br>
+-# - The user environment should be that of the invoking process<br>
+-# - The command should create a new shell with a new process ID<br>
+-<br>
+-send_user &quot;\nTEST: su to root using name parameter and correct passw=
ord. \n&quot;<br>
+-<br>
+-set i_am_root 0<br>
+-# run &quot;whoami&quot; to test user ID inside su shell<br>
+-spawn /bin/su -l root -c whoami<br>
+-expect {<br>
+-=C2=A0 &quot;Password:&quot; {<br>
+-=C2=A0 =C2=A0 send &quot;$PASSWD\r&quot;<br>
+-=C2=A0 =C2=A0 expect {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;root&quot; { set i_am_root 1 }<br>
+-=C2=A0 =C2=A0 }<br>
+-=C2=A0 }<br>
+-}<br>
+-<br>
+-# capture result code<br>
+-set codes [wait]<br>
+-set pid [lindex $codes 0]<br>
+-set exit_code [lindex $codes 3]<br>
+-<br>
+-<br>
+-#Check that su user does not have the same enviroment as current user<br>
+-set i_have_env 0<br>
+-set test_env &quot; &quot;<br>
+-if { $i_am_root=3D=3D1 } {<br>
+-=C2=A0 =C2=A0 =C2=A0 spawn /bin/sh -c &quot;/bin/su -l root -c \&quot;ech=
o \&quot;\\\$TEST_LINE &gt; $TEST_ENV_FILE2\&quot;\&quot;&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 expect {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Passw=
ord:&quot; {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 send &quot;$PASSWD\r&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 set test_env [exec cat $TEST_ENV_FILE2]<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 if=C2=A0 { $test_env=3D=3D$TEST_LINE_ENV } {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set i_have_env 1<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 send_user &quot;/bin/su =
-l root with correct password (FAILED), because it did not change enviromen=
t\n&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
+-}<br>
+-<br>
+-<br>
+-if { ($i_am_root=3D=3D1) &amp;&amp; ($exit_code=3D=3D0) &amp;&amp; ($pid&=
gt;0) &amp;&amp; ($i_have_env=3D=3D0) } {<br>
+-=C2=A0 send_user &quot;/bin/su -l root with correct password &amp; enviro=
ment check ( PASSED )\n&quot;<br>
+-} else {<br>
+-=C2=A0 send_user &quot;/bin/su -l root with correct password ( FAILED )\n=
&quot;<br>
+-=C2=A0 set script_exit_code 1<br>
+-}<br>
+-<br>
+-<br>
+-# 4) su to root with name parameter and incorrect password.<br>
+-#=C2=A0 =C2=A0 - The su command should return a result code of non-0<br>
+-#=C2=A0 =C2=A0 - The user should be returned to the invoking shell<br>
+-#=C2=A0 =C2=A0 - An appropriate failure message should be displayed<br>
+-<br>
+-send_user &quot;\nTEST: su to root with name parameter and incorrect pass=
word. \n&quot;<br>
+-<br>
+-set displayed_error 0<br>
+-# run &quot;whoami&quot; to test user ID inside su shell<br>
+-spawn /bin/su -l root -c whoami<br>
+-expect {<br>
+-=C2=A0 &quot;Password:&quot; {<br>
+-=C2=A0 =C2=A0 send &quot;wrong_$PASSWD\r&quot;<br>
+-=C2=A0 =C2=A0 expect {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;su: incorrect password&quot; { set di=
splayed_error 1 }<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;su: Authentication failure&quot; { se=
t displayed_error 1 }<br>
+-=C2=A0 =C2=A0 }<br>
+-=C2=A0 }<br>
+-}<br>
+-<br>
+-# capture result code<br>
+-set codes [wait]<br>
+-set pid [lindex $codes 0]<br>
+-set exit_code [lindex $codes 3]<br>
+-if { ($displayed_error=3D=3D1) &amp;&amp; ($exit_code!=3D0) &amp;&amp; ($=
pid&gt;0) } {<br>
+-=C2=A0 send_user &quot;/bin/su -l root with incorrect password ( PASSED )=
\n&quot;<br>
+-} else {<br>
+-=C2=A0 send_user &quot;/bin/su -l root with incorrect password ( FAILED )=
\n&quot;<br>
+-=C2=A0 set script_exit_code 1<br>
+-}<br>
+-<br>
+-<br>
+-# 5) su to user1 with name parameter and correct password.<br>
+-#=C2=A0 =C2=A0 - The su command should return a result code of 0<br>
+-#=C2=A0 =C2=A0 - The user ID should be user1<br>
+-#=C2=A0 =C2=A0 - The user environment should be that of the invoking proc=
ess, in this case,that of user1<br>
+-#=C2=A0 =C2=A0 - The command should create a new shell with a new process=
 ID<br>
+-#=C2=A0 =C2=A0 - Run &quot;whoami&quot; to test user ID inside su shell<b=
r>
+-<br>
+-send_user &quot;TEST: su to user1 with name parameter and correct passwor=
d.\n&quot;<br>
+-<br>
+-set i_am_correct 0<br>
+-spawn /bin/su -l $USER1 -c whoami<br>
+-expect {<br>
+-=C2=A0 &quot;Password:&quot; {<br>
+-=C2=A0 =C2=A0 send &quot;$USER1_PASSWORD\r&quot;<br>
+-=C2=A0 =C2=A0 expect {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;$USER1\r&quot; { set i_am_correct 1 }=
<br>
+-=C2=A0 =C2=A0 }<br>
+-=C2=A0 }<br>
+-}<br>
+-<br>
+-# capture result code<br>
+-set codes [wait]<br>
+-set pid [lindex $codes 0]<br>
+-set exit_code [lindex $codes 3]<br>
+-<br>
+-set i_have_env 0<br>
+-set test_env_var 0<br>
+-#Check to see that su user does not have the same enviroment<br>
+-if { $i_am_correct=3D=3D1 } {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 spawn /bin/sh -c &quot;/bin/su -l $USER1 -c \=
&quot;echo \&quot;\\\$TEST_LINE &gt; $TEST_ENV_FILE_USER1\&quot;\&quot;&quo=
t;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 expect {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Passw=
ord:&quot; {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 send &quot;$USER1_PASSWORD\r&quot;<b=
r>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+-<br>
+-}<br>
+-<br>
+-set test_env_var [exec cat $TEST_ENV_FILE_USER1]<br>
+-<br>
+-set i_have_env 0<br>
+-if=C2=A0 { $test_env_var=3D=3D$TEST_LINE_ENV } {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 set i_have_env 1<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 send_user &quot;/bin/su -l $USER1 with correc=
t password (FAILED), because it did not change enviroment\n&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 set i_have_env 0<br>
+-=C2=A0 =C2=A0 =C2=A0 if=C2=A0 { $test_env_var=3D=3D$TEST_LINE_ENV } {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set i_have_env 1<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 send_user &quot;su -l $U=
SER1 with correct password (FAILED), because it did not change enviroment\n=
&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
+-}<br>
+-<br>
+-if { ($i_am_correct=3D=3D1) &amp;&amp; ($exit_code=3D=3D0) &amp;&amp; ($p=
id&gt;0) &amp;&amp; ($i_have_env=3D=3D0) } {<br>
+-=C2=A0 send_user &quot;/bin/su -l $USER1 with correct password &amp; envi=
roment check ( PASSED )\n&quot;<br>
+-} else {<br>
+-=C2=A0 send_user &quot;/bin/su -l $USER1 with correct password ( FAILED )=
\n&quot;<br>
+-=C2=A0 set script_exit_code 1<br>
+-}<br>
+-<br>
+-<br>
+-<br>
+-# 6)su to user1 with name parameter and incorrect password.<br>
+-#=C2=A0 =C2=A0 - The su command should return a result code of non-0<br>
+-#=C2=A0 =C2=A0 - The user should be returned to the invoking shell<br>
+-#=C2=A0 =C2=A0 - An appropriate failure message should be displayed.<br>
+-<br>
+-send_user &quot;TEST: su to user1 with name parameter and incorrect passw=
ord.\n&quot;<br>
+-spawn /bin/su -l $USER1 -c whoami<br>
+-set displayed_error 0<br>
+-expect {<br>
+-=C2=A0 &quot;Password:&quot; {<br>
+-=C2=A0 =C2=A0 send &quot;wrong_$USER1_PASSWORD\r&quot;<br>
+-=C2=A0 =C2=A0 expect {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;su: incorrect password&quot; { set di=
splayed_error 1 }<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;su: Authentication failure&quot; { se=
t displayed_error 1 }<br>
+-=C2=A0 =C2=A0 }<br>
+-=C2=A0 }<br>
+-}<br>
+-<br>
+-# capture result code<br>
+-set codes [wait]<br>
+-set pid [lindex $codes 0]<br>
+-set exit_code [lindex $codes 3]<br>
+-if { ($displayed_error=3D=3D1) &amp;&amp; ($exit_code!=3D0) &amp;&amp; ($=
pid&gt;0) } {<br>
+-=C2=A0 =C2=A0 =C2=A0 send_user &quot;/bin/su -l $USER1 with incorrect pas=
sword ( PASSED )\n&quot;<br>
+-} else {<br>
+-=C2=A0 =C2=A0 =C2=A0 send_user &quot;/bin/su -l $USER1 with incorrect pas=
sword ( FAILED )\n&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 set script_exit_code 1<br>
+-}<br>
+-<br>
+-<br>
+-# 7) su to user1 with the user1 password expired<br>
+-#=C2=A0 =C2=A0 - user1 should not be allowed to log in<br>
+-#=C2=A0 =C2=A0 - The su command should return a result code of non-0<br>
+-#=C2=A0 =C2=A0 - The user should be returned to the invoking shell<br>
+-#=C2=A0 =C2=A0 - An appropriate failure message should be displayed.<br>
+-<br>
+-# Become root and expire $USER1 password<br>
+-<br>
+-#=C2=A0 Skip this if Red Hat; -e option not supported.<br>
+-if { $distro !=3D &quot;redhat&quot; &amp;&amp; $distro !=3D &quot;redhat=
-linux&quot; } {<br>
+-<br>
+-if { $test_one_passed=3D=3D1} {<br>
+-send_user &quot;TEST:=C2=A0 su to user1 with the user1 password expired.\=
n&quot;<br>
+-<br>
+-spawn /bin/su -l root -c &quot;passwd -e $USER1&quot;<br>
+-expect {<br>
+-=C2=A0 &quot;Password:&quot; {<br>
+-=C2=A0 =C2=A0 send &quot;$PASSWD\r&quot;<br>
+-=C2=A0 =C2=A0 expect {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Password expiry information changed.&=
quot;<br>
+-=C2=A0 =C2=A0 }<br>
+-=C2=A0 }<br>
+-}<br>
+-<br>
+-set i_am_correct 0<br>
+-spawn /bin/su -l $USER1 -c whoami<br>
+-expect {<br>
+-=C2=A0 &quot;Password:&quot; {<br>
+-=C2=A0 =C2=A0 send &quot;$USER1_PASSWORD\r&quot;<br>
+-=C2=A0 =C2=A0 expect {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -re &quot;current.*password|Old Password&quot=
; {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 send &quot;wrong_$USER1_PASSWORD\r&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 expect {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -re &quot;current=
.*password|Old Password&quot; {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 send &quot;wrong_$USER1_PASSWORD\r&quo=
t;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 expect {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot=
;su: incorrect password&quot; { set i_am_correct 1 }<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot=
;su: Authentication failure&quot; { set i_am_correct 1 }<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot=
;su: Authentication token manipulation error&quot; { set i_am_correct 1 }<b=
r>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;su: incor=
rect password&quot; { set i_am_correct 1 }<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;su: Authe=
ntication failure&quot; { set i_am_correct 1 }<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;su: Authe=
ntication token manipulation error&quot; { set i_am_correct 1 }<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 }<br>
+-=C2=A0 }<br>
+-}<br>
+-<br>
+-# capture result code<br>
+-set codes [wait]<br>
+-set pid [lindex $codes 0]<br>
+-set exit_code [lindex $codes 3]<br>
+-if { ($i_am_correct=3D=3D1) &amp;&amp; ($exit_code!=3D0) &amp;&amp; ($pid=
&gt;0) } {<br>
+-=C2=A0 =C2=A0 =C2=A0 send_user &quot;/bin/su -l $USER1 with expired corre=
ct password ( PASSED )\n&quot;<br>
+-} else {<br>
+-=C2=A0 =C2=A0 =C2=A0 send_user &quot;/bin/su -l $USER1 with expired corre=
ct password ( FAILED )\n&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 set script_exit_code 1<br>
+-}<br>
+-<br>
+-<br>
+-#Become root and set $USER1 password back to previous value<br>
+-spawn /bin/su -l root -c &quot;passwd $USER1&quot;<br>
+-expect {<br>
+-=C2=A0 &quot;Password: &quot; {<br>
+-=C2=A0 =C2=A0 send &quot;$PASSWD\r&quot;<br>
+-=C2=A0 =C2=A0 expect {<br>
+-=C2=A0 =C2=A0 =C2=A0&quot;Enter new password: &quot; {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 send &quot;$USER1_NEW_PASSWORD\r&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 expect {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Re-type new password: &quot; {<b=
r>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 send &quot;$USER1_NEW_PASSWORD\=
r&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 expect {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Password changed&q=
uot; {}<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 }<br>
+-=C2=A0 }<br>
+-}<br>
+-<br>
+-} else {<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 send_user &quot;TEST:=C2=A0 su to user1 with the use=
r1 password expired. (FAILED),see more next line.\n&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 send_user &quot;This test cannot be run because the =
first test to su as root failed\n&quot;<br>
+-<br>
+-}<br>
+-# If RH let the tester know why only 6 tests were run.<br>
+-} else {<br>
+-=C2=A0 send_user &quot;TEST 7 skipped if running on Red Hat; -e not suppo=
rted \n&quot;<br>
+-}<br>
+-exit=C2=A0 $script_exit_code<br>
+diff --git a/testcases/commands/su/su_set_passwd b/testcases/commands/su/s=
u_set_passwd<br>
+deleted file mode 100755<br>
+index e8f0d2f50..000000000<br>
+--- a/testcases/commands/su/su_set_passwd<br>
++++ /dev/null<br>
+@@ -1,14 +0,0 @@<br>
+-#!/bin/sh<br>
+-#<br>
+-# Set Password for a specific new user<br>
+-# This script should be run as &#39;root&#39;<br>
+-#<br>
+-# Example:<br>
+-#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0./su_set_passwd USER ENC=
RYPTED_PASSWD<br>
+-#<br>
+-<br>
+-USER=3D$1<br>
+-ENCRYPTED_PASSWD=3D$2<br>
+-<br>
+-usermod -p $ENCRYPTED_PASSWD $USER<br>
+-exit $?<br>
+diff --git a/testcases/kernel/fs/acls/.gitignore b/testcases/kernel/fs/acl=
s/.gitignore<br>
+deleted file mode 100644<br>
+index 5fa2fc654..000000000<br>
+--- a/testcases/kernel/fs/acls/.gitignore<br>
++++ /dev/null<br>
+@@ -1,2 +0,0 @@<br>
+-/acl_file_test<br>
+-/acl_link_test<br>
+diff --git a/testcases/kernel/fs/acls/Makefile b/testcases/kernel/fs/acls/=
Makefile<br>
+deleted file mode 100644<br>
+index 4f1564377..000000000<br>
+--- a/testcases/kernel/fs/acls/Makefile<br>
++++ /dev/null<br>
+@@ -1,40 +0,0 @@<br>
+-#<br>
+-#=C2=A0 =C2=A0 kernel/fs/acls testcases Makefile.<br>
+-#<br>
+-#=C2=A0 =C2=A0 Copyright (C) 2009, Cisco Systems Inc.<br>
+-#<br>
+-#=C2=A0 =C2=A0 This program is free software; you can redistribute it and=
/or modify<br>
+-#=C2=A0 =C2=A0 it under the terms of the GNU General Public License as pu=
blished by<br>
+-#=C2=A0 =C2=A0 the Free Software Foundation; either version 2 of the Lice=
nse, or<br>
+-#=C2=A0 =C2=A0 (at your option) any later version.<br>
+-#<br>
+-#=C2=A0 =C2=A0 This program is distributed in the hope that it will be us=
eful,<br>
+-#=C2=A0 =C2=A0 but WITHOUT ANY WARRANTY; without even the implied warrant=
y of<br>
+-#=C2=A0 =C2=A0 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0=
 See the<br>
+-#=C2=A0 =C2=A0 GNU General Public License for more details.<br>
+-#<br>
+-#=C2=A0 =C2=A0 You should have received a copy of the GNU General Public =
License along<br>
+-#=C2=A0 =C2=A0 with this program; if not, write to the Free Software Foun=
dation, Inc.,<br>
+-#=C2=A0 =C2=A0 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA=
.<br>
+-#<br>
+-# Ngie Cooper, July 2009<br>
+-#<br>
+-<br>
+-top_srcdir=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ?=3D ../../../..<br>
+-<br>
+-include $(top_srcdir)/include/mk/<a href=3D"http://env_pre.mk" rel=3D"nor=
eferrer" target=3D"_blank">env_pre.mk</a><br>
+-<br>
+-check_header =3D $(shell \<br>
+-=C2=A0 =C2=A0 =C2=A0 if echo &quot;\#include &lt;$(1)&gt;&quot; | $(CC) -=
E - &gt; /dev/null 2&gt;&amp;1 ; \<br>
+-=C2=A0 =C2=A0 =C2=A0 then echo yes ; \<br>
+-=C2=A0 =C2=A0 =C2=A0 else echo no ; fi)<br>
+-<br>
+-INSTALL_TARGETS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0:=
=3D acl_test01<br>
+-<br>
+-RESULT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 :=3D $(call check_header,sys/xattr.h)<br>
+-<br>
+-ifneq ($(RESULT),yes)<br>
+-MAKE_TARGETS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 :=3D<br>
+-endif<br>
+-<br>
+-include $(top_srcdir)/include/mk/<a href=3D"http://generic_leaf_target.mk=
" rel=3D"noreferrer" target=3D"_blank">generic_leaf_target.mk</a><br>
+diff --git a/testcases/kernel/fs/acls/acl_file_test.c b/testcases/kernel/f=
s/acls/acl_file_test.c<br>
+deleted file mode 100644<br>
+index eb30d28ef..000000000<br>
+--- a/testcases/kernel/fs/acls/acl_file_test.c<br>
++++ /dev/null<br>
+@@ -1,73 +0,0 @@<br>
+-#include &lt;unistd.h&gt;<br>
+-#include &lt;stdio.h&gt;<br>
+-#include &lt;sys/types.h&gt;<br>
+-#include &lt;errno.h&gt;<br>
+-#include &lt;sys/syscall.h&gt;<br>
+-#include &lt;fcntl.h&gt;<br>
+-#include &lt;sys/xattr.h&gt;<br>
+-#include &lt;string.h&gt;<br>
+-<br>
+-int main(int argc, char *argv[])<br>
+-{<br>
+-=C2=A0 =C2=A0 =C2=A0 ssize_t s;<br>
+-=C2=A0 =C2=A0 =C2=A0 char *tok;<br>
+-=C2=A0 =C2=A0 =C2=A0 char value[1024];<br>
+-=C2=A0 =C2=A0 =C2=A0 char list[1024];<br>
+-=C2=A0 =C2=A0 =C2=A0 int rc =3D 0;<br>
+-=C2=A0 =C2=A0 =C2=A0 char *file;<br>
+-=C2=A0 =C2=A0 =C2=A0 int fd;<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 if (argc &lt; 2) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;Please ente=
r a file name as argument.\n&quot;);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 file =3D argv[1];<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 fd =3D open(file, O_RDONLY);<br>
+-=C2=A0 =C2=A0 =C2=A0 if (fd &lt; 0) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;Unable to o=
pen file %s !&quot;, file);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 if (-1 =3D=3D (s =3D flistxattr(fd, list, 1024))) {<=
br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 perror(&quot;flistxattr&=
quot;);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 =C2=A0 if (s =3D=3D 0) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;No xattrs d=
efined for %s, further testcase useless\n&quot;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 =C2=A0 tok =3D strtok(list, &quot;\0&quot;);<br>
+-=C2=A0 =C2=A0 =C2=A0 s =3D fgetxattr(fd, tok, (void *)value, 1024);<br>
+-=C2=A0 =C2=A0 =C2=A0 if (s =3D=3D -1) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 perror(&quot;fgetxattr&q=
uot;);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 =C2=A0 s =3D fsetxattr(fd, tok, (void *)value, s, 0);<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 if (s =3D=3D -1) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;Use=
r unable to change extended attributes on file %s !\n&quot;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0argv=
[1]);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;errno =3D %=
i\n&quot;, errno);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D 1;<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 =C2=A0 //s =3D syscall(237, fd,tok); //fremovexattr<br>
+-#ifdef __NR_fremovexattr<br>
+-=C2=A0 =C2=A0 =C2=A0 s =3D syscall(__NR_fremovexattr, fd, tok);=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 //fremovexattr<br>
+-#else<br>
+-=C2=A0 =C2=A0 =C2=A0 s =3D -1;<br>
+-=C2=A0 =C2=A0 =C2=A0 errno =3D ENOSYS;<br>
+-#endif<br>
+-=C2=A0 =C2=A0 =C2=A0 if (s =3D=3D -1) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;User unable=
 to remove extended attributes file %s !\n&quot;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0argv[1]);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;errno =3D %=
i\n&quot;, errno);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D 1;<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 close(fd);<br>
+-=C2=A0 =C2=A0 =C2=A0 return rc;<br>
+-}<br>
+diff --git a/testcases/kernel/fs/acls/acl_link_test.c b/testcases/kernel/f=
s/acls/acl_link_test.c<br>
+deleted file mode 100644<br>
+index 312f686a1..000000000<br>
+--- a/testcases/kernel/fs/acls/acl_link_test.c<br>
++++ /dev/null<br>
+@@ -1,56 +0,0 @@<br>
+-#include &lt;unistd.h&gt;<br>
+-#include &lt;stdio.h&gt;<br>
+-#include &lt;sys/types.h&gt;<br>
+-#include &lt;errno.h&gt;<br>
+-#include &lt;sys/syscall.h&gt;<br>
+-#include &lt;string.h&gt;<br>
+-#include &lt;sys/xattr.h&gt;<br>
+-<br>
+-int main(int argc, char *argv[])<br>
+-{<br>
+-=C2=A0 =C2=A0 =C2=A0 ssize_t s;<br>
+-=C2=A0 =C2=A0 =C2=A0 char *tok;<br>
+-=C2=A0 =C2=A0 =C2=A0 char value[1024];<br>
+-=C2=A0 =C2=A0 =C2=A0 char list[1024];<br>
+-=C2=A0 =C2=A0 =C2=A0 int rc =3D 0;<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 if (argc &lt; 2) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;Please ente=
r a file name as argument.\n&quot;);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 if (-1 =3D=3D (s =3D listxattr(argv[1], list, 1024))=
) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 perror(&quot;listxattr&q=
uot;);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 =C2=A0 if (s =3D=3D 0) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;No xattrs d=
efined for %s, further testcase useless\n&quot;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0argv[1]);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 =C2=A0 tok =3D strtok(list, &quot;\0&quot;);<br>
+-=C2=A0 =C2=A0 =C2=A0 s =3D getxattr(argv[1], tok, (void *)value, 1024);<b=
r>
+-=C2=A0 =C2=A0 =C2=A0 if (-1 =3D=3D s) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 perror(&quot;getxattr&qu=
ot;);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 s =3D lsetxattr(argv[1], tok, (void *)value, s, 0);<=
br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 if (s =3D=3D -1) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;User unable=
 to change extended attributes %s !\n&quot;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0argv[1]);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;errno =3D %=
i\n&quot;, errno);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D 1;<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 s =3D lremovexattr(argv[1], tok);<br>
+-=C2=A0 =C2=A0 =C2=A0 if (s =3D=3D -1) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;User unable=
 to remove extended attributes %s !\n&quot;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0argv[1]);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;errno =3D %=
i\n&quot;, errno);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D 1;<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 return rc;<br>
+-}<br>
+diff --git a/testcases/kernel/fs/acls/acl_test01 b/testcases/kernel/fs/acl=
s/acl_test01<br>
+deleted file mode 100755<br>
+index 4fbd72f75..000000000<br>
+--- a/testcases/kernel/fs/acls/acl_test01<br>
++++ /dev/null<br>
+@@ -1,186 +0,0 @@<br>
+-#!/bin/sh<br>
+-#*********************************************************************<br=
>
+-#=C2=A0 =C2=A0Copyright (c) International Business Machines=C2=A0 Corp., =
2003<br>
+-#<br>
+-#=C2=A0 =C2=A0This program is free software;=C2=A0 you can redistribute i=
t and/or modify<br>
+-#=C2=A0 =C2=A0it under the terms of the GNU General Public License as pub=
lished by<br>
+-#=C2=A0 =C2=A0the Free Software Foundation; either version 2 of the Licen=
se, or<br>
+-#=C2=A0 =C2=A0(at your option) any later version.<br>
+-#<br>
+-#=C2=A0 =C2=A0This program is distributed in the hope that it will be use=
ful,<br>
+-#=C2=A0 =C2=A0but WITHOUT ANY WARRANTY;=C2=A0 without even the implied wa=
rranty of<br>
+-#=C2=A0 =C2=A0MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 =
See<br>
+-#=C2=A0 =C2=A0the GNU General Public License for more details.<br>
+-#<br>
+-#=C2=A0 =C2=A0You should have received a copy of the GNU General Public L=
icense<br>
+-#=C2=A0 =C2=A0along with this program;=C2=A0 if not, write to the Free So=
ftware<br>
+-#=C2=A0 =C2=A0Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, =
MA 02110-1301 USA<br>
+-#<br>
+-#<br>
+-#<br>
+-#=C2=A0 FILE=C2=A0 =C2=A0: acls<br>
+-#<br>
+-#=C2=A0 PURPOSE: Tests extended acls<br>
+-#<br>
+-#=C2=A0 HISTORY:<br>
+-#=C2=A0 =C2=A0 03/03 Jerone Young=C2=A0 (<a href=3D"mailto:jyoung5@us.ibm=
.com" target=3D"_blank">jyoung5@us.ibm.com</a>)<br>
+-#=C2=A0 =C2=A0 09/08 Jacky Malcles changing the setup to have this TC sta=
rted by runltp<br>
+-#*********************************************************************<br=
>
+-#<br>
+-################################################################<br>
+-#<br>
+-# Make sure that uid=3Droot is running this script.<br>
+-# Make sure that loop device is built into the kernel<br>
+-# Make sure that ACL(Access Control List) and Extended Attribute are<br>
+-#=C2=A0 =C2=A0 =C2=A0built into the kernel<br>
+-#<br>
+-#<br>
+-################################################################<br>
+-<br>
+-export TCID=3Dacltest01<br>
+-export TST_TOTAL=3D5<br>
+-export TST_COUNT=3D1<br>
+-<br>
+-. test.sh<br>
+-<br>
+-TMP=3D${TMP:=3D/tmp}<br>
+-<br>
+-TEST_USER1=3D&quot;acltest1&quot;<br>
+-TEST_USER1_GROUP=3D&quot;users&quot;<br>
+-TEST_USER1_PASSWD=3D&quot;ltp_test_pass1&quot;<br>
+-TEST_USER1_HOMEDIR=3D&quot;$TMP/tacl/mount-ext3/$TEST_USER1&quot;<br>
+-<br>
+-FILE_ACL=3D&quot;$TMP/tacl/mount-ext3/test_file&quot;<br>
+-FILE_ACL_LINK=3D&quot;$TMP/tacl/mount-ext3/test_file_link&quot;<br>
+-TCbin=3D`pwd`<br>
+-<br>
+-COMMAND=3D$(command -v &quot;getenforce&quot; &quot;setenforce&quot; |wc =
-l)<br>
+-if [ $COMMAND -eq 2 ]; then<br>
+-=C2=A0 =C2=A0 =C2=A0 SELINUX=3D$(getenforce)<br>
+-else<br>
+-=C2=A0 =C2=A0 =C2=A0 SELINUX=3D&quot;&quot;<br>
+-fi<br>
+-<br>
+-do_setup()<br>
+-{<br>
+-=C2=A0 =C2=A0 =C2=A0 tst_require_root<br>
+-=C2=A0 =C2=A0 =C2=A0 tst_test_cmds setfacl<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 if ! ( test -d $TMP/tacl || mkdir -m 777 $TMP/tacl) =
; then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_brkm TBROK &quot;Fai=
led to create $TMP/tacl directory.&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 fi<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 dd if=3D/dev/zero of=3D$TMP/tacl/blkext3 bs=3D1k cou=
nt=3D10240 &amp;&amp; chmod 777 $TMP/tacl/blkext3<br>
+-=C2=A0 =C2=A0 =C2=A0 if [ $? -ne 0 ] ; then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_brkm TBROK &quot;Fai=
led to create $TMP/tacl/blkext3&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 fi<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 if ! LOOP_DEV=3D$(losetup -f) || [ &quot;x$LOOP_DEV&=
quot; =3D x ]; then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_brkm TCONF &quot;[ l=
osetup.1 ] Failed to find an available loopback device -- is the required s=
upport compiled in your kernel?&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 fi<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 if ! losetup $LOOP_DEV $TMP/tacl/blkext3 &gt; /dev/n=
ull 2&gt;&amp;1; then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_brkm TCONF &quot;[ l=
osetup.2 ] Failed to setup the device.&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 fi<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 mount | grep ext2<br>
+-=C2=A0 =C2=A0 =C2=A0 if [ $? -ne 0 ]; then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mkfs -t ext3 $LOOP_DEV #=
&gt; /dev/null 2&gt;&amp;1<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir=C2=A0 -m 777 $TMP/=
tacl/mount-ext3<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mount -t ext3 -o default=
s,acl,user_xattr $LOOP_DEV $TMP/tacl/mount-ext3<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ $? -ne 0 ]; then<br=
>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 tst_resm TCONF &quot;[ mount ] Make sure that ACL (Access Control List)=
&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 tst_resm TCONF &quot;\t and Extended Attribute are built into the kerne=
l\n&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 tst_brkm TCONF &quot;\t Can not mount ext3 file system with acl and use=
r_xattr options\n&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+-=C2=A0 =C2=A0 =C2=A0 else<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mkfs -t ext2 $LOOP_DEV<b=
r>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir=C2=A0 -m 777 $TMP/=
tacl/mount-ext3<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mount -t ext2 -o default=
s,acl,user_xattr $LOOP_DEV $TMP/tacl/mount-ext3<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ $? -ne 0 ]; then<br=
>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 tst_resm TCONF &quot;FAILED: [ mount ] Make sure that ACL (Access Contr=
ol List)&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 tst_resm TCONF &quot;\t and Extended Attribute are built into the kerne=
l\n&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 tst_brkm TCONF &quot;\t Can not mount ext2 file system with acl and use=
r_xattr options\n&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+-=C2=A0 =C2=A0 =C2=A0 fi<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 # We couldn&#39;t consider whether the SElinux is Di=
sable or Permissive.<br>
+-=C2=A0 =C2=A0 =C2=A0 # We only set it to Permissive when it it Enforcing.=
<br>
+-=C2=A0 =C2=A0 =C2=A0 if [ &quot;$SELINUX&quot; =3D &quot;Enforcing&quot; =
]; then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;set the SElin=
ux to Permissive.&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 setenforce 0<br>
+-=C2=A0 =C2=A0 =C2=A0 fi<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 userdel $TEST_USER1 &gt; /dev/null 2&gt;&amp;1<br>
+-=C2=A0 =C2=A0 =C2=A0 useradd -d $TEST_USER1_HOMEDIR -m -g $TEST_USER1_GRO=
UP $TEST_USER1 -s /bin/sh<br>
+-=C2=A0 =C2=A0 =C2=A0 if [ $? -ne 0 ]; then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_brkm TBROK &quot;Cou=
ld not add test user $TEST_USER1.&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 fi<br>
+-}<br>
+-<br>
+-do_cleanup()<br>
+-{<br>
+-=C2=A0 =C2=A0 =C2=A0 userdel $TEST_USER1 &gt; /dev/null 2&gt;&amp;1<br>
+-=C2=A0 =C2=A0 =C2=A0 rm -f $FILE_ACL &gt; /dev/null 2&gt;&amp;1<br>
+-=C2=A0 =C2=A0 =C2=A0 rm -f $FILE_ACL_LINK &gt; /dev/null 2&gt;&amp;1<br>
+-=C2=A0 =C2=A0 =C2=A0 mount | grep -q &quot;$TMP/tacl/mount-ext3&quot; &am=
p;&amp; umount -d $TMP/tacl/mount-ext3<br>
+-=C2=A0 =C2=A0 =C2=A0 rm -rf $TMP/tacl<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 # We set it back to Enforcing.<br>
+-=C2=A0 =C2=A0 =C2=A0 if [ &quot;$SELINUX&quot; =3D &quot;Enforcing&quot; =
]; then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;set the SElin=
ux back to Enforcing.&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 setenforce 1<br>
+-=C2=A0 =C2=A0 =C2=A0 fi<br>
+-}<br>
+-<br>
+-do_setup<br>
+-TST_CLEANUP=3Ddo_cleanup<br>
+-<br>
+-tst_resm TINFO &quot;Testing ACL for root&quot;<br>
+-<br>
+-touch $FILE_ACL<br>
+-touch $FILE_ACL_LINK<br>
+-<br>
+-#setup files for extended attributes<br>
+-setfacl -mu:root:r $FILE_ACL_LINK<br>
+-setfacl -mu:root:r $FILE_ACL<br>
+-<br>
+-acl_file_test $FILE_ACL<br>
+-if [ $? -ne 0 ]; then<br>
+-=C2=A0 =C2=A0 =C2=A0 tst_resm TFAIL &quot;Extended acls for files.&quot;<=
br>
+-else<br>
+-=C2=A0 =C2=A0 =C2=A0 tst_resm TPASS &quot;Extended acls for files.&quot;<=
br>
+-fi<br>
+-<br>
+-acl_link_test $FILE_ACL_LINK<br>
+-if [ $? -ne 0 ]; then<br>
+-=C2=A0 =C2=A0 =C2=A0 tst_resm TFAIL &quot;Extended acls for links.&quot;<=
br>
+-else<br>
+-=C2=A0 =C2=A0 =C2=A0 tst_resm TPASS &quot;Extended acls for links.&quot;<=
br>
+-fi<br>
+-<br>
+-chown $TEST_USER1 $FILE_ACL<br>
+-chown $TEST_USER1 $FILE_ACL_LINK<br>
+-<br>
+-tst_resm TINFO &quot;Testing ACL for $TEST_USER1&quot;<br>
+-<br>
+-#setup files for extended attributes<br>
+-setfacl -m u:$TEST_USER1:r $FILE_ACL_LINK<br>
+-setfacl -m u:$TEST_USER1:r $FILE_ACL<br>
+-<br>
+-tst_su $TEST_USER1 &quot;acl_file_test $FILE_ACL&quot;<br>
+-if [ $? -ne 0 ]; then<br>
+-=C2=A0 =C2=A0 =C2=A0 tst_resm TFAIL &quot;Extended acls for files.&quot;<=
br>
+-else<br>
+-=C2=A0 =C2=A0 =C2=A0 tst_resm TPASS &quot;Extended acls for files.&quot;<=
br>
+-fi<br>
+-<br>
+-tst_su $TEST_USER1 &quot;acl_link_test $FILE_ACL_LINK&quot;<br>
+-if [ $? -ne 0 ]; then<br>
+-=C2=A0 =C2=A0 =C2=A0 tst_resm TFAIL &quot;Extended acls for links.&quot;<=
br>
+-else<br>
+-=C2=A0 =C2=A0 =C2=A0 tst_resm TPASS &quot;Extended acls for links.&quot;<=
br>
+-fi<br>
+-<br>
+-tst_exit<br>
+-- <br>
+2.11.0<br>
+<br>
diff --git a/meta/recipes-extended/ltp/<a href=3D"http://ltp_20180926.bb" r=
el=3D"noreferrer" target=3D"_blank">ltp_20180926.bb</a> b/meta/recipes-exte=
nded/ltp/<a href=3D"http://ltp_20180926.bb" rel=3D"noreferrer" target=3D"_b=
lank">ltp_20180926.bb</a><br>
index 6cfcaa5832..36d95b23f9 100644<br>
--- a/meta/recipes-extended/ltp/<a href=3D"http://ltp_20180926.bb" rel=3D"n=
oreferrer" target=3D"_blank">ltp_20180926.bb</a><br>
+++ b/meta/recipes-extended/ltp/<a href=3D"http://ltp_20180926.bb" rel=3D"n=
oreferrer" target=3D"_blank">ltp_20180926.bb</a><br>
@@ -53,6 +53,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/linu=
x-test-project/ltp.git" rel=3D"noreferrer" target=3D"_blank">github.com/lin=
ux-test-project/ltp.git</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-statx-fix-compile-err=
ors.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-setrlimit05-Use-anoth=
er-method-to-get-bad-address.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-getcpu01-Rename-getcp=
u-to-avoid-conflict-with-glibc-.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Remove-admin_tools-te=
st.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
-- <br>
2.11.0<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000186493057f68e71e--
