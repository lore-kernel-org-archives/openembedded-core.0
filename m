Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web12.3011.1596654469289484631
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2020 12:07:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JJfWwNSo;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id h7so42696316qkk.7
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2020 12:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WOm+PRwGA/8Pyiw7IHTWawXuFqtENNMDFYtlmHXb9IY=;
        b=JJfWwNSo89ZFsmjDp10M9fqS3Sc2lIwtvBf8GJcnIN+ZZO4KxrZiccflzbMpct9UIt
         vhdVWt7HZezlmmXME0LbCAXwOuR7nGXFOt7371SbbCs7mDj/G2QAPF+MUboH/l42t4Et
         oH7lS6+uHFqcgUWEBCNUlhE+cWyExwA/Pu9rQPt0nCi0rFBs6xmx1FRjUSB8d+IhvnH4
         slV5zaPqz+idgzf4aeRse3XDa0J420wUBjGsawa9V4/zUblUhB+rvbhTHwDHWS8aQ3VS
         s/GNH5FtpNoafLhYVigoQNS63nnNkDJvyTl2bN0KxJlsbkKoP7nB8ji4i/QFE5/vSCC2
         5kOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WOm+PRwGA/8Pyiw7IHTWawXuFqtENNMDFYtlmHXb9IY=;
        b=ixiFvfJ8Op47hux0YGGqpEelEUQzImIaVC2hp77/A3jYQWFaW05jxmw5Awh30iQ9mR
         7j/NVZUaYo/loOFNl3JTtmzrHYkr/0KAxNn5sCqZ5o6zNMnk584p3KpT9I15iszMaCLN
         x93D/fbaWTUv4oJSX2agQZQqwEgqj8EYKMYyfJ1WzSW0EbRCuqjvxdtfyVXPHrGt3NRb
         rso4IHfAJ1bH7BBJ11WnVxrAYtnPclfE3TIFB55viTnivGZESmlxbFccwu6lMmBiliHY
         YTZbjGLo4hVxWd30/GS1cANbRbt5a8m1ZmUHldfhl3J69LQ/DAI0BLGBjUxUQka1a900
         QnUw==
X-Gm-Message-State: AOAM532rdRJL3zc9Od6cBCDn4lFcdwelPgeAQA+fYK+RPqZpWS4bz3yu
	VEGiz4mPDmAjq2gTUeQyGKM=
X-Google-Smtp-Source: ABdhPJz+T++D6OyvZHZ/Z2mlZvuKsy4PXQfTx6h6L5BQcuNk2g+QlxGQwPt3EHsvLA0wFoVrBC1eUQ==
X-Received: by 2002:a37:9e90:: with SMTP id h138mr4913831qke.176.1596654468288;
        Wed, 05 Aug 2020 12:07:48 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id a8sm2676292qth.69.2020.08.05.12.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2020 12:07:47 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] systemtap: update to 4.3 latest
Date: Wed,  5 Aug 2020 15:07:45 -0400
Message-Id: <20200805190745.32318-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating systemtap to the latest of the 4.3 release branch. Without
this update we cannot pass on-target sanity tests with a 5.8
kernel.

Changelog is as follows:

    82b8e1a07 (HEAD -> master, origin/master, origin/HEAD) Make dtrace generated code work with LTO (take 2)
    03a6c471a Fix --enable-http build errors by always using MHD_Result
    87344e948 PR26307: rhel6 porting tweak redux
    24810e5ac PR26307: rhel6 porting tweak
    327956981 java/HelperSDT.c: correct 32-bit pointer cast warnings
    2f3580f40 PR26307: adapt to kernel module_sect_attr changes in 5.8+
    84bc64ff1 systemtap.spec: let -testsuite subrpm require elfutils-debuginfod
    27b087e7f PR26249: "%p" -> "0x%lx" pointer formatting in *conversions.stp error messages
    5e1ef9d7f PR25568 / RHBZ1857749: sdt_buildid.exp test case
    e90530877 PR25568 / RHBZ1857749: buildid/uprobes/inode rework, task_finder etc. side
    40dbe72af PR26234: stapbpf should warn about other unsupported derived_probe types
    82f358beb testsuite: shrink output
    a9a0131eb rhbz1857749: uprobes-inode regression in sdt semaphore setting
    ce0fa621e configury: make systemtap buildable with gcc -flto
    e5a63d9c0 Make dtrace generated code work with LTO
    e8070f260 Revert "Make dtrace generated code work with LTO"
    b26a86bfb systemtap.spec: comment syntax tweak
    8212024da Make dtrace generated code work with LTO
    601778117 PR26234: stapbpf should warn about unsupported utrace_derived_probes
    c7d4f550e testsuite: block listing_mode_sanity large tests on small machine
    046fa017d RHBZ1847676 cont'd: one more uprobes-inode/onthefly concurrency control
    a8351c3dc runtime: startup dmesg %p decloaking
    65d6fbd21 run-stap.in: forget about bundled elfutils build mode
    57c76ab3f PR25549: format tweak
    143974310 PR25549: statement probe visibility for openmp / lto binaries
    c6831f14e testuite: More @cast() fallout
    a4d7b3797 README: modernize
    f1a9bb064 Tapset and testsuite updates against @cast() change 00ee19ff03
    4ccdfe453 RHBZ1847676 cont'd: more uprobes-inode/onthefly concurrency controls
    487d6b6e8 tapset: *user_string* formatting directive tweaks
    b266d0bf8 PR26142: Adapt to linux/vermagic.h file hiding ... but with proper include order
    79000b42e PR26142: Adapt to linux/vermagic.h file hiding ... but not on rhel6
    37066e2c3 PR26142: adapt to linux mmap_sem api transition
    6af5df835 PR26142: Adapt to linux/vermagic.h file hiding
    403e92779 PR26181: Use explicit @cast() within get_ip_from_client()
    4bb36e7fb Exclude some __NR_compat_* defines for newer aarch64 kernels
    a948c291c Use explicit @cast() operators pointing to kernel for tapsets
    469d20e8b PR26131: garbled data might appear in staprun data channel output
    36430614d Use kernel.trace("sched:sched_process_fork") for kprocess.create when possible
    b2d18cb3a Use explicit @cast() operators for semop-watch.stp example.
    3d922919d Use explicit @cast() operators for periodic.stp
    9a2cd427a PR24758: increase stack size for BPF userspace interpreter
    3040d4e8d Use explicit @cast() operators for stapgames/pingpong.stp tapset.
    9eb37102d Use explicit @cast() operators for pfiles.stp and ioctl_handler.stp
    7a28529f6 Remove the unneeded test_support check the lwtools meta info
    717b7dddd Use explicit @cast() operators to fslatency-nd.stp and fsslower-nd.stp
    2b2b6a622 Fix sizeof.stp to explicitly use kernel debuginfo if one not specified
    db91f0291 bpf.exp: tentative fix for bigmap1.stp hang on RHEL8
    11c39a737 RHBZ1847676: uprobes-inode tweaks redux
    0a281a96d Make sizeof.stp runnable with the bpf backend.
    5b8f6c174 remove comment
    fb59e8c75 PR26123: fixed memory leaks in vma map for kernels without CONFIG_UTRACE.
    cc7b62017 Add overcommit.stp to examples that can run in bpf.
    ac8f2b7c9 configury: post-release version bump
    7a7016a12 Avoid exceeding space constraints for the BPF environment in mmfilepage.stp
    c488859d6 Avoid exceeding space constraints for BPF environment in mmwriteback.stp

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/systemtap/systemtap_git.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index 4ec0703f2b..56fa51d61e 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -1,6 +1,6 @@
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-SRCREV = "c9c23c987d819d07c6b96b54f8e03188fecd9e46"
+SRCREV = "82b8e1a07a31bf37ed05d6ebc5162b054c0be9fd"
 PV = "4.3"
 
 SRC_URI = "git://sourceware.org/git/systemtap.git \
-- 
2.19.1

