Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12032.1795238993079552940
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 21:29:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=aMs8DtnI;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=zkvOF+8J;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101a1fc951904-c738a3d0-8a74-4195-9032-da165fa07bb1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1795238992;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mk9GbGi8Ec3Srxzvy7q2IrBHpTxAqQGf67h4yuFrNHk=;
	b=aMs8DtnIDlAh86GuQf3qBRAIsLmaRGGe70U1+po/44u2WQeHD6BFdPAObylmH5aA
	AlEFiqesdPetLYsPchfuaavHACKr/Mne/0IyGHUyOB1/HzGw3/JajEmbeR8BUYRB1n1
	CUS8jFMKlbyuSAh6lZcflb7g77jOI5HLh0uLXRKo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1795238992;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mk9GbGi8Ec3Srxzvy7q2IrBHpTxAqQGf67h4yuFrNHk=;
	b=zkvOF+8J4FcbsTXISwTsiEjGEJmNVgpR49f73pPrisFLjDAyP2f4mGa0Zeolv9oF
	7h0V/uC13uWh3ZsVnn1Iryi5Zk6nHZaokaOA9zYP3wT6tpMgdSZIU5BqOI7CzHTBoe9
	Oq1mgzv35kaSPE9EPjOLhbj+xmjVnTAJh+jrGcH4=
Content-Type: multipart/mixed; boundary="===============8624794721534153820=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: =?utf-8?q?Simone_Wei=C3=9F_=3Csimone=2Ep=2Eweiss=40posteo=2Enet=3E?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libseccomp: upgrading to 2.6.2 SUCCEEDED
Message-ID: <010101a1fc951904-c738a3d0-8a74-4195-9032-da165fa07bb1-000000@us-west-2.amazonses.com>
Date: Sat, 21 Nov 2026 05:29:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.21-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 21 Nov 2026 05:29:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250836

--===============8624794721534153820==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libseccomp* to *2.6.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libseccomp-upgrade-2.6.1-2.6.2.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 4cb1f04c65488540d212378f6bf9151a62b692d9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 21 Nov 2026 05:29:45 +0000
Subject: [PATCH] libseccomp: upgrade 2.6.1 -> 2.6.2

---
 .../libseccomp/{libseccomp_2.6.1.bb => libseccomp_2.6.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libseccomp/{libseccomp_2.6.1.bb => libseccomp_2.6.2.bb} (97%)

diff --git a/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb b/meta/recipes-support/libseccomp/libseccomp_2.6.2.bb
similarity index 97%
rename from meta/recipes-support/libseccomp/libseccomp_2.6.1.bb
rename to meta/recipes-support/libseccomp/libseccomp_2.6.2.bb
index 5db0381ae9..c1758b96f9 100644
--- a/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb
+++ b/meta/recipes-support/libseccomp/libseccomp_2.6.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7c13b3376cea0ce68d2d2da0a1b3a72c"
 
 DEPENDS += "gperf-native"
 
-SRCREV = "a81cc2de8ee7a33633defc88bb8a2d986b421613"
+SRCREV = "72d90906ebcc6a2706868d58404e10a3086ed142"
 
 SRC_URI = "git://github.com/seccomp/libseccomp.git;branch=release-2.6;protocol=https;tag=v${PV} \
            file://run-ptest \
-- 
2.47.1


--===============8624794721534153820==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libseccomp/libseccomp-ptest: FILELIST: added "/usr/lib/libseccomp/ptest/tests/66-sim-acc_reload.tests /usr/lib/libseccomp/ptest/tests/67-sim-arch_syscall_load /usr/lib/libseccomp/ptest/tests/66-sim-acc_reload /usr/lib/libseccomp/ptest/tests/65-sim-db_tree_args /usr/lib/libseccomp/ptest/tests/65-sim-db_tree_args.py /usr/lib/libseccomp/ptest/tests/67-sim-arch_syscall_load.py /usr/lib/libseccomp/ptest/tests/65-sim-db_tree_args.tests /usr/lib/libseccomp/ptest/tests/67-sim-arch_syscall_load.tests"
packages/x86-64-v3-poky-linux/libseccomp/libseccomp: FILELIST: removed "/usr/lib/libseccomp.so.2.6.1", added "/usr/lib/libseccomp.so.2.6.2"
Changes to packages/x86-64-v3-poky-linux/libseccomp (sysroot):
  /usr/lib/libseccomp.so.2 changed symlink target from libseccomp.so.2.6.1 to libseccomp.so.2.6.2
  /usr/lib/libseccomp.so changed symlink target from libseccomp.so.2.6.1 to libseccomp.so.2.6.2
  /usr/lib/libseccomp.so.2.6.1 moved to /usr/lib/libseccomp.so.2.6.2

--===============8624794721534153820==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libseccomp-upgrade-2.6.1-2.6.2.patch"

RnJvbSA0Y2IxZjA0YzY1NDg4NTQwZDIxMjM3OGY2YmY5MTUxYTYyYjY5MmQ5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMjEgTm92IDIwMjYgMDU6Mjk6NDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJzZWNjb21wOiB1cGdyYWRlIDIuNi4xIC0+IDIuNi4yCgotLS0KIC4uLi9saWJzZWNjb21wL3ts
aWJzZWNjb21wXzIuNi4xLmJiID0+IGxpYnNlY2NvbXBfMi42LjIuYmJ9ICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1zdXBwb3J0L2xpYnNlY2NvbXAve2xpYnNlY2NvbXBfMi42LjEuYmIgPT4gbGlic2Vj
Y29tcF8yLjYuMi5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9s
aWJzZWNjb21wL2xpYnNlY2NvbXBfMi42LjEuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJz
ZWNjb21wL2xpYnNlY2NvbXBfMi42LjIuYmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlic2VjY29tcC9saWJzZWNjb21wXzIuNi4xLmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJzZWNjb21wL2xpYnNlY2NvbXBfMi42LjIu
YmIKaW5kZXggNWRiMDM4MWFlOS4uYzE3NThiOTZmOSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LXN1cHBvcnQvbGlic2VjY29tcC9saWJzZWNjb21wXzIuNi4xLmJiCisrKyBiL21ldGEvcmVjaXBl
cy1zdXBwb3J0L2xpYnNlY2NvbXAvbGlic2VjY29tcF8yLjYuMi5iYgpAQCAtNyw3ICs3LDcgQEAg
TElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9N2MxM2IzMzc2Y2VhMGNlNjhk
MmQyZGEwYTFiM2E3MmMiCiAKIERFUEVORFMgKz0gImdwZXJmLW5hdGl2ZSIKIAotU1JDUkVWID0g
ImE4MWNjMmRlOGVlN2EzMzYzM2RlZmM4OGJiOGEyZDk4NmI0MjE2MTMiCitTUkNSRVYgPSAiNzJk
OTA5MDZlYmNjNmEyNzA2ODY4ZDU4NDA0ZTEwYTMwODZlZDE0MiIKIAogU1JDX1VSSSA9ICJnaXQ6
Ly9naXRodWIuY29tL3NlY2NvbXAvbGlic2VjY29tcC5naXQ7YnJhbmNoPXJlbGVhc2UtMi42O3By
b3RvY29sPWh0dHBzO3RhZz12JHtQVn0gXAogICAgICAgICAgICBmaWxlOi8vcnVuLXB0ZXN0IFwK
LS0gCjIuNDcuMQoK

--===============8624794721534153820==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libseccomp: PV changed from "2.6.1" to "2.6.2"
packages/x86-64-v3-poky-linux/libseccomp: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/x86-64-v3-poky-linux/libseccomp: SRC_URI changed from "git://github.com/seccomp/libseccomp.git;branch=release-2.6;protocol=https;tag=v2.6.1 file://run-ptest" to "git://github.com/seccomp/libseccomp.git;branch=release-2.6;protocol=https;tag=v2.6.2 file://run-ptest"
packages/x86-64-v3-poky-linux/libseccomp/libseccomp-dbg: PV changed from "2.6.1" to "2.6.2"
packages/x86-64-v3-poky-linux/libseccomp/libseccomp-dbg: FILELIST: removed "/usr/lib/.debug/libseccomp.so.2.6.1", added "/usr/lib/libseccomp/ptest/tests/.debug/67-sim-arch_syscall_load /usr/lib/libseccomp/ptest/tests/.debug/66-sim-acc_reload /usr/lib/libseccomp/ptest/tests/.debug/65-sim-db_tree_args /usr/lib/.debug/libseccomp.so.2.6.2"
packages/x86-64-v3-poky-linux/libseccomp/libseccomp-dbg: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/x86-64-v3-poky-linux/libseccomp/libseccomp-dbg: PKGSIZE changed from 26604528 to 28115792 (+6%)
packages/x86-64-v3-poky-linux/libseccomp/libseccomp-dev: PV changed from "2.6.1" to "2.6.2"
packages/x86-64-v3-poky-linux/libseccomp/libseccomp-dev: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/x86-64-v3-poky-linux/libseccomp/libseccomp-doc: PV changed from "2.6.1" to "2.6.2"
packages/x86-64-v3-poky-linux/libseccomp/libseccomp-doc: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/x86-64-v3-poky-linux/libseccomp/libseccomp-locale: PV changed from "2.6.1" to "2.6.2"
packages/x86-64-v3-poky-linux/libseccomp/libseccomp-locale: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/x86-64-v3-poky-linux/libseccomp/libseccomp-ptest: PV changed from "2.6.1" to "2.6.2"
packages/x86-64-v3-poky-linux/libseccomp/libseccomp-ptest: FILELIST: added "/usr/lib/libseccomp/ptest/tests/65-sim-db_tree_args.py /usr/lib/libseccomp/ptest/tests/65-sim-db_tree_args.tests /usr/lib/libseccomp/ptest/tests/66-sim-acc_reload.tests /usr/lib/libseccomp/ptest/tests/67-sim-arch_syscall_load.tests /usr/lib/libseccomp/ptest/tests/67-sim-arch_syscall_load /usr/lib/libseccomp/ptest/tests/65-sim-db_tree_args /usr/lib/libseccomp/ptest/tests/66-sim-acc_reload /usr/lib/libseccomp/ptest/tests/67-sim-arch_syscall_load.py"
packages/x86-64-v3-poky-linux/libseccomp/libseccomp-ptest: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/x86-64-v3-poky-linux/libseccomp/libseccomp-ptest: PKGSIZE changed from 11393984 to 12012503 (+5%)
packages/x86-64-v3-poky-linux/libseccomp/libseccomp-src: PV changed from "2.6.1" to "2.6.2"
packages/x86-64-v3-poky-linux/libseccomp/libseccomp-src: FILELIST: directory renamed /usr/src/debug/libseccomp/2.6.1/include -> /usr/src/debug/libseccomp/2.6.2/include, directory renamed /usr/src/debug/libseccomp/2.6.1/tools -> /usr/src/debug/libseccomp/2.6.2/tools, directory renamed /usr/src/debug/libseccomp/2.6.1/src -> /usr/src/debug/libseccomp/2.6.2/src, removed "/usr/src/debug/libseccomp/2.6.1/tests/15-basic-resolver.c /usr/src/debug/libseccomp/2.6.1/tests/24-live-arg_allow.c /usr/src/debug/libseccomp/2.6.1/tests/05-sim-long_jumps.c /usr/src/debug/libseccomp/2.6.1/tests/util.c /usr/src/debug/libseccomp/2.6.1/tests/53-sim-binary_tree.c /usr/src/debug/libseccomp/2.6.1/tests/23-sim-arch_all_le_basic.c /usr/src/debug/libseccomp/2.6.1/tests/26-sim-arch_all_be_basic.c /usr/src/debug/libseccomp/2.6.1/tests/30-sim-socket_syscalls.c /usr/src/debug/libseccomp/2.6.1/tests/42-sim-adv_chains.c /usr/src/debug/libseccomp/2.6.1/tests/44-live-a2_order.c /usr/src/debug/libseccomp/2.6.1/tests/57-b
 asic-rawsysrc.c /usr/src/debug/libseccomp/2.6.1/tests/06-sim-actions.c /usr/src/debug/libseccomp/2.6.1/tests/55-basic-pfc_binary_tree.c /usr/src/debug/libseccomp/2.6.1/tests/58-live-tsync_notify.c /usr/src/debug/libseccomp/2.6.1/tests/util.h /usr/src/debug/libseccomp/2.6.1/tests/07-sim-db_bug_looping.c /usr/src/debug/libseccomp/2.6.1/tests/14-sim-reset.c /usr/src/debug/libseccomp/2.6.1/tests/miniseq.c /usr/src/debug/libseccomp/2.6.1/tests/02-sim-basic.c /usr/src/debug/libseccomp/2.6.1/tests/50-sim-hash_collision.c /usr/src/debug/libseccomp/2.6.1/tests/46-sim-kill_process.c /usr/src/debug/libseccomp/2.6.1/tests/12-sim-basic_masked_ops.c /usr/src/debug/libseccomp/2.6.1/tests/34-sim-basic_denylist.c /usr/src/debug/libseccomp/2.6.1/tests/54-live-binary_tree.c /usr/src/debug/libseccomp/2.6.1/tests/37-sim-ipc_syscalls_be.c /usr/src/debug/libseccomp/2.6.1/tests/40-sim-log.c /usr/src/debug/libseccomp/2.6.1/tests/27-sim-bpf_blk_state.c /usr/src/debug/libseccomp/2.6.1/tests/36-sim-ipc_syscall
 s.c /usr/src/debug/libseccomp/2.6.1/tests/41-sim-syscall_priority_arch.c /usr/src/debug/libseccomp/2.6.1/tests/60-sim-precompute.c /usr/src/debug/libseccomp/2.6.1/tests/18-sim-basic_allowlist.c /usr/src/debug/libseccomp/2.6.1/tests/59-basic-empty_binary_tree.c /usr/src/debug/libseccomp/2.6.1/tests/33-sim-socket_syscalls_be.c /usr/src/debug/libseccomp/2.6.1/tests/08-sim-subtree_checks.c /usr/src/debug/libseccomp/2.6.1/tests/28-sim-arch_x86.c /usr/src/debug/libseccomp/2.6.1/tests/51-live-user_notification.c /usr/src/debug/libseccomp/2.6.1/tests/52-basic-load.c /usr/src/debug/libseccomp/2.6.1/tests/31-basic-version_check.c /usr/src/debug/libseccomp/2.6.1/tests/47-live-kill_process.c /usr/src/debug/libseccomp/2.6.1/tests/10-sim-syscall_priority_post.c /usr/src/debug/libseccomp/2.6.1/tests/25-sim-multilevel_chains_adv.c /usr/src/debug/libseccomp/2.6.1/tests/09-sim-syscall_priority_pre.c /usr/src/debug/libseccomp/2.6.1/tests/39-basic-api_level.c /usr/src/debug/libseccomp/2.6.1/tests/13-ba
 sic-attrs.c /usr/src/debug/libseccomp/2.6.1/tests/35-sim-negative_one.c /usr/src/debug/libseccomp/2.6.1/tests/20-live-basic_die.c /usr/src/debug/libseccomp/2.6.1/tests/03-sim-basic_chains.c /usr/src/debug/libseccomp/2.6.1/tests/49-sim-64b_comparisons.c /usr/src/debug/libseccomp/2.6.1/tests/62-sim-arch_transactions.c /usr/src/debug/libseccomp/2.6.1/tests/56-basic-iterate_syscalls.c /usr/src/debug/libseccomp/2.6.1/tests/16-sim-arch_basic.c /usr/src/debug/libseccomp/2.6.1/tests/04-sim-multilevel_chains.c /usr/src/debug/libseccomp/2.6.1/tests/17-sim-arch_merge.c /usr/src/debug/libseccomp/2.6.1/tests/19-sim-missing_syscalls.c /usr/src/debug/libseccomp/2.6.1/tests/43-sim-a2_order.c /usr/src/debug/libseccomp/2.6.1/tests/45-sim-chain_code_coverage.c /usr/src/debug/libseccomp/2.6.1/tests/48-sim-32b_args.c /usr/src/debug/libseccomp/2.6.1/tests/61-sim-transactions.c /usr/src/debug/libseccomp/2.6.1/tests/01-sim-allow.c /usr/src/debug/libseccomp/2.6.1/tests/29-sim-pseudo_syscall.c /usr/src/debug
 /libseccomp/2.6.1/tests/21-live-basic_allow.c /usr/src/debug/libseccomp/2.6.1/tests/38-basic-pfc_coverage.c /usr/src/debug/libseccomp/2.6.1/tests/32-live-tsync_allow.c /usr/src/debug/libseccomp/2.6.1/tests/11-basic-basic_errors.c /usr/src/debug/libseccomp/2.6.1/tests/22-sim-basic_chains_array.c", added "/usr/src/debug/libseccomp/2.6.2/tests/15-basic-resolver.c /usr/src/debug/libseccomp/2.6.2/tests/24-live-arg_allow.c /usr/src/debug/libseccomp/2.6.2/tests/05-sim-long_jumps.c /usr/src/debug/libseccomp/2.6.2/tests/util.c /usr/src/debug/libseccomp/2.6.2/tests/53-sim-binary_tree.c /usr/src/debug/libseccomp/2.6.2/tests/65-sim-db_tree_args.c /usr/src/debug/libseccomp/2.6.2/tests/23-sim-arch_all_le_basic.c /usr/src/debug/libseccomp/2.6.2/tests/26-sim-arch_all_be_basic.c /usr/src/debug/libseccomp/2.6.2/tests/30-sim-socket_syscalls.c /usr/src/debug/libseccomp/2.6.2/tests/42-sim-adv_chains.c /usr/src/debug/libseccomp/2.6.2/tests/44-live-a2_order.c /usr/src/debug/libseccomp/2.6.2/tests/57-basic
 -rawsysrc.c /usr/src/debug/libseccomp/2.6.2/tests/06-sim-actions.c /usr/src/debug/libseccomp/2.6.2/tests/55-basic-pfc_binary_tree.c /usr/src/debug/libseccomp/2.6.2/tests/58-live-tsync_notify.c /usr/src/debug/libseccomp/2.6.2/tests/66-sim-acc_reload.c /usr/src/debug/libseccomp/2.6.2/tests/util.h /usr/src/debug/libseccomp/2.6.2/tests/07-sim-db_bug_looping.c /usr/src/debug/libseccomp/2.6.2/tests/14-sim-reset.c /usr/src/debug/libseccomp/2.6.2/tests/miniseq.c /usr/src/debug/libseccomp/2.6.2/tests/02-sim-basic.c /usr/src/debug/libseccomp/2.6.2/tests/50-sim-hash_collision.c /usr/src/debug/libseccomp/2.6.2/tests/46-sim-kill_process.c /usr/src/debug/libseccomp/2.6.2/tests/12-sim-basic_masked_ops.c /usr/src/debug/libseccomp/2.6.2/tests/34-sim-basic_denylist.c /usr/src/debug/libseccomp/2.6.2/tests/54-live-binary_tree.c /usr/src/debug/libseccomp/2.6.2/tests/37-sim-ipc_syscalls_be.c /usr/src/debug/libseccomp/2.6.2/tests/40-sim-log.c /usr/src/debug/libseccomp/2.6.2/tests/27-sim-bpf_blk_state.c /u
 sr/src/debug/libseccomp/2.6.2/tests/36-sim-ipc_syscalls.c /usr/src/debug/libseccomp/2.6.2/tests/41-sim-syscall_priority_arch.c /usr/src/debug/libseccomp/2.6.2/tests/60-sim-precompute.c /usr/src/debug/libseccomp/2.6.2/tests/18-sim-basic_allowlist.c /usr/src/debug/libseccomp/2.6.2/tests/59-basic-empty_binary_tree.c /usr/src/debug/libseccomp/2.6.2/tests/33-sim-socket_syscalls_be.c /usr/src/debug/libseccomp/2.6.2/tests/08-sim-subtree_checks.c /usr/src/debug/libseccomp/2.6.2/tests/67-sim-arch_syscall_load.c /usr/src/debug/libseccomp/2.6.2/tests/28-sim-arch_x86.c /usr/src/debug/libseccomp/2.6.2/tests/51-live-user_notification.c /usr/src/debug/libseccomp/2.6.2/tests/52-basic-load.c /usr/src/debug/libseccomp/2.6.2/tests/31-basic-version_check.c /usr/src/debug/libseccomp/2.6.2/tests/47-live-kill_process.c /usr/src/debug/libseccomp/2.6.2/tests/10-sim-syscall_priority_post.c /usr/src/debug/libseccomp/2.6.2/tests/25-sim-multilevel_chains_adv.c /usr/src/debug/libseccomp/2.6.2/tests/09-sim-syscal
 l_priority_pre.c /usr/src/debug/libseccomp/2.6.2/tests/39-basic-api_level.c /usr/src/debug/libseccomp/2.6.2/tests/13-basic-attrs.c /usr/src/debug/libseccomp/2.6.2/tests/35-sim-negative_one.c /usr/src/debug/libseccomp/2.6.2/tests/20-live-basic_die.c /usr/src/debug/libseccomp/2.6.2/tests/03-sim-basic_chains.c /usr/src/debug/libseccomp/2.6.2/tests/49-sim-64b_comparisons.c /usr/src/debug/libseccomp/2.6.2/tests/62-sim-arch_transactions.c /usr/src/debug/libseccomp/2.6.2/tests/56-basic-iterate_syscalls.c /usr/src/debug/libseccomp/2.6.2/tests/16-sim-arch_basic.c /usr/src/debug/libseccomp/2.6.2/tests/04-sim-multilevel_chains.c /usr/src/debug/libseccomp/2.6.2/tests/17-sim-arch_merge.c /usr/src/debug/libseccomp/2.6.2/tests/19-sim-missing_syscalls.c /usr/src/debug/libseccomp/2.6.2/tests/43-sim-a2_order.c /usr/src/debug/libseccomp/2.6.2/tests/45-sim-chain_code_coverage.c /usr/src/debug/libseccomp/2.6.2/tests/48-sim-32b_args.c /usr/src/debug/libseccomp/2.6.2/tests/61-sim-transactions.c /usr/src/d
 ebug/libseccomp/2.6.2/tests/01-sim-allow.c /usr/src/debug/libseccomp/2.6.2/tests/29-sim-pseudo_syscall.c /usr/src/debug/libseccomp/2.6.2/tests/21-live-basic_allow.c /usr/src/debug/libseccomp/2.6.2/tests/38-basic-pfc_coverage.c /usr/src/debug/libseccomp/2.6.2/tests/32-live-tsync_allow.c /usr/src/debug/libseccomp/2.6.2/tests/11-basic-basic_errors.c /usr/src/debug/libseccomp/2.6.2/tests/22-sim-basic_chains_array.c"
packages/x86-64-v3-poky-linux/libseccomp/libseccomp-src: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/x86-64-v3-poky-linux/libseccomp/libseccomp-src: PKGSIZE changed from 1048204 to 1060756 (+1%)
packages/x86-64-v3-poky-linux/libseccomp/libseccomp-staticdev: PV changed from "2.6.1" to "2.6.2"
packages/x86-64-v3-poky-linux/libseccomp/libseccomp-staticdev: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/x86-64-v3-poky-linux/libseccomp/libseccomp-staticdev: PKGSIZE changed from 749172 to 755700 (+1%)
packages/x86-64-v3-poky-linux/libseccomp/libseccomp: PV changed from "2.6.1" to "2.6.2"
packages/x86-64-v3-poky-linux/libseccomp/libseccomp: FILELIST: removed "/usr/lib/libseccomp.so.2.6.1", added "/usr/lib/libseccomp.so.2.6.2"
packages/x86-64-v3-poky-linux/libseccomp/libseccomp: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
Changes to packages/x86-64-v3-poky-linux/libseccomp (sysroot):
  /usr/lib/libseccomp.so.2 changed symlink target from libseccomp.so.2.6.1 to libseccomp.so.2.6.2
  /usr/lib/libseccomp.so changed symlink target from libseccomp.so.2.6.1 to libseccomp.so.2.6.2
  /usr/lib/libseccomp.so.2.6.1 moved to /usr/lib/libseccomp.so.2.6.2

--===============8624794721534153820==--
