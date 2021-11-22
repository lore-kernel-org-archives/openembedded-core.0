Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDB89C4321E
	for <webhook@archiver.kernel.org>; Mon, 22 Nov 2021 15:00:12 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.115])
 by mx.groups.io with SMTP id smtpd.web08.7503.1637593211169578359
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 07:00:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=j+aHLB+J;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.115,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1637593209; i=@fujitsu.com;
	bh=Fr67ioXHpflOxHLV2T4jrCPZG3wgCS3Aedbe1yNbkZk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=j+aHLB+JMnTEaz/NdJNr7uhct8wBYppfAg4gVt2YyhjTzOOMTojEFI6obr2Dc4+km
	 UmD/wc93Z9aIgRiqOHWHbbJnwzBT86wBROuHou+rfifzkIsJVrH2Kl7I2CsuER7Ufs
	 pxHWleWLHm3l1CH7KwZxDjJWVILfliglcky9rFcEEwl8wQvczpYh3PaAJWvWFPVf8x
	 DoDNVSvXF4p7B0IKrTnipf6XI86dLT4M1rmqBzSPjLrZwnBodq3FNc4hLgthVdH1uT
	 eTDxjZkgHMvuVM95GtIjSYEX5urhf5X8guSqa2mb5gG3qPktMW9Q42o0sDs1xBXyJP
	 5d+TadtRvzAaw==
Received: from [100.113.7.250] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-central-1.aws.symcld.net id 0A/E3-09058-970BB916;
 Mon, 22 Nov 2021 15:00:09 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJIsWRWlGSWpSXmKPExsViZ8MxSbdyw+x
  Eg0t5Fnd+vmN3YPQ4t3EFYwBjFGtmXlJ+RQJrRl/XBuaCiwoV7/oeszYwzpPuYuTiEBJ4zCjx
  49VUFgjnPJPEthffWCGcE4wSny+eYupi5ORgE1CTmH7rBlCCg0NEQE/i6j9RkDCzgIrEi9897
  CBhYQELiU8nVUHCLAKqEvtPTAHr5BVwkjh29QsbiC0hoCAx5eF7ZhCbU8BZYtvH62BxIaCamY
  vfsEPUC0qcnPmEBWK8hMTBFy+YIXoVJWZfbmaBsCskZs1qY4Kw1SSuntvEPIFRcBaS9llI2hc
  wMq1itEwqykzPKMlNzMzRNTQw0DU0NNY11TUyMdRLrNJN0kst1U1OzSspSgTK6iWWF+sVV+Ym
  56To5aWWbGIEhm9KIevHHYyHXn/QO8QoycGkJMprNHt2ohBfUn5KZUZicUZ8UWlOavEhRhkOD
  iUJ3sfrgHKCRanpqRVpmTnAWIJJS3DwKInwOoCkeYsLEnOLM9MhUqcYjTmaJy3fzszxuuXnDm
  Yhlrz8vFQpcd7m9UClAiClGaV5cINgMX6JUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjBvFcg
  Unsy8Erh9r4BOYQI65fTx6SCnlCQipKQamPJSbrrWegQtURZ4Ot3m+dH7Rsqpn/LnyfcJxMZP
  XrBosZXM24OiPtvqVGPUw2J/1p5pfMwz0eRLVKhmyMHU35ImfYsZJjpGrjnc+XHR4dd3a3cdY
  GFdb6Zzv1R1wSOtfpcFPH4W245INAT6bjPdtjnaUUBGvfBm8LTCrrN16aGfpsZLxrL+Dfew3r
  vg30O95PMsSw6Hrj9jf/jk2jzHmGqJsPmW+pOq77x8WRLOntZ9pa9yzQPDMGevDsaQx///zsl
  a+c74t4Bxaj7733MWuwtOtL69by/ZXqa3VjyKW+p6cTcrd0nnvFflj3Oi/Oq3PZAQcM+cuvv8
  tMnmyt+Z1ueofD5QcsN5/u0SiafTlFiKMxINtZiLihMBUlAloWwDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-245.messagelabs.com!1637593208!428008!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7911 invoked from network); 22 Nov 2021 15:00:08 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-13.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Nov 2021 15:00:08 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 6FE9C10045E
	for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 15:00:08 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 56AE2100450
	for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 15:00:08 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 22 Nov 2021 14:59:46 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] systemtap: upgrade 4.5 -> 4.6
Date: Mon, 22 Nov 2021 22:59:33 +0800
Message-ID: <1637593174-99263-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1637593174-99263-1-git-send-email-wangmy@fujitsu.com>
References: <1637593174-99263-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Nov 2021 15:00:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158577

support for 64-bit RISC-V architecture, liveness analysis for guru-mode write operations,
bpf syscall_any and abort() tapsets, bpf foreach iteration of multi-key arrays,
return of inter-cpu output ordering

Changelog is as follows:
= SystemTap frontend (stap) changes
- stap-prep now tries to download the main kernel debuginfo file from
  a debuginfod server, if configured.

= SystemTap backend changes
- SystemTap has added support for the 64-bit RISC-V architecture.
- SystemTap now uses DynInst to perform a liveness analysis on
  target variables and warn when a guru-mode modification to a variable
  will have no effect. The liveness analysis is currently done on
  x86_64, PowerPC, and AArch64.
- The kernel-user relayfs transport again sorts messages into a total
  time order across CPUs.  High output-volume scripts may need a
  larger "-s BUF" parameter to reliably transfer.  "-b" bulk mode
  is also available again as an alternative.
- The bpf backend now supports foreach iteration in multi-key associative arrays.

= SystemTap tapset changes
- Updated syscall_any tapset mapping to include newer syscalls.
- syscall_any tapset can be used by the bpf backend.
- abort() tapset can be used by the bpf backend.

= Known issues with this release
- There are known issues on kernel 5.10+ after adapting to set_fs()
  removal, with some memory accesses that previously returned valid data
  instead returning -EFAULT (see PR26811).
- An sdt probe cannot parse a parameter that uses a segment register.
  (PR13429)
- The presence of a line such as
      *CFLAGS += $(call cc-option, -fno-var-tracking-assignments)
  in older linux kernel Makefile unnecessarily reduces debuginfo quality,
  consider removing that line if you build kernels.  Linux 5.10+ fixes this.

= Bugs fixed for this release <https://sourceware.org/PR#####>
6562     $SYSTEMTAP_DEBUGINFO_PATH does not work
15724     stapdyn looking for libdyninstAPI_RT.a
26839     Systemtap build failures with clang
27820     abort() tapset not implemented in the bpf mode
27829     support for floating point values passed through sdt.h markers
27864     loc2stap.cxx assertion failure on loc_unavailable type location, rawhide
27881     failed to extend vma mapped entry when the address is adjacent
27903     handle f33 glibc $$parms
27932     List Python as a prerequisite in README
27933     Use of unitialized functioncall synthetic field in
27934     failure to attach statement
27940     The /* pc=0x... */ is no longer printed by "stap -v -L 'kernel.function("*")'
27942     testsuite/systemtap.base/perf.sh drop bashism
27984     stap skipping partially-inlined instance, but it is not inline function actually
28070     extend vma end address to the different module
28079     adapt to kernel 5.14 task_struct.__state change
28084     autoconf-x86-uniregs.c compile failled with -Werror cause STAPCONF_X86_UNIREGS missing
28140     kernel panic on tracepoint activation in stap module
28184     task_fd_lookup failed on linux 5.11
28244     linux objtool imposes symbol length limits on generated function names
28384     finish nfs_proc tapset port 4.3 string server_ip
28443     Provide syscall_any tapset for bpf
28449     loss of cross-cpu output ordering
28544     procfs_bpf.exp regression due to string handling error
28557     module kprobe insertion on modern kernels

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-kernel/systemtap/systemtap_git.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index 25546f7cb2..22b07f1516 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -1,7 +1,7 @@
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-SRCREV = "7f6992539fb22c93c21ac30c94508bf655d496a7"
-PV = "4.5"
+SRCREV = "2e9f2f6967e44ce2bf8f34932b5bdd738ece2161"
+PV = "4.6"
 
 SRC_URI = "git://sourceware.org/git/systemtap.git;branch=master \
            file://0001-Do-not-let-configure-write-a-python-location-into-th.patch \
-- 
2.25.1


