Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBF41C433FE
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 11:22:49 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web10.9662.1647343368150862462
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 04:22:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com
 header.s=170520fj header.b=A6qypl8G;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1647343366; i=@fujitsu.com;
	bh=6Xk6c94+l+ArDFUTNC586752mZ2s4xNJeWFGVd8vQFQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=A6qypl8G3qxYl0ZUTHHhMAh+Q6reNQmkgU06fucvV6yfqeeUSwZ2sMx1hEa9+h7RZ
	 6rvtpB6CyV5kjFeJIUXQ5Jtj9jRZNYnqHUs0JKsfFxQ43T2uctGGNgQV8QuRStUW5A
	 5pxPVdRC07Kx69+81XwApJMEy1PIROTJOw4xQtYC0IOIyKDRx5Z17TdHA13vEuxMNq
	 vJbB41M11/iNW8v1ZWuV29ewPubWa4Ng4IyT1E3ytCUApLNvlsamNNhvZCL1pj0oo7
	 E43SOB1QbTvOoTNBnwrnbMdn9lal4tZ5uYhSlfxuvs4B4766zILzovFG8HSFIgYinI
	 R5lKUPOIr7P9w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrAIsWRWlGSWpSXmKPExsViZ8MxSZe13CD
  JYO42K4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPjk7ksBR3yFS/2xDQwfpDqYuTkEBJ4zCix
  aJd+FyMXkH2eSeL326lsEM4JRonlR46wg1SxCahJTL91g7WLkYNDREBP4uo/UZAws4CKxIvfP
  WAlwgJWEpuO9rCA2CwCqhLdX9+zgdi8Ak4SM4/0M4LYEgIKElMevmcGsTkFnCUu33nICnGEk8
  SNlnWsEPWCEidnPmGBmA8058hTJghbXqJ562xmiDmKErMvN7NA2BUSs2a1MUHYahJXz21insA
  oNAvJqFlIRs1CMmoBI/MqRqukosz0jJLcxMwcXUMDA11DQ1NdA10jE2O9xCrdRL3UUt3y1OIS
  XUO9xPJivdTiYr3iytzknBS9vNSSTYzAgE8pZvi8g3FB30+9Q4ySHExKorwsIgZJQnxJ+SmVG
  YnFGfFFpTmpxYcYZTg4lCR4Y0uBcoJFqempFWmZOcDog0lLcPAoifC+BEnzFhck5hZnpkOkTj
  EqSonzvgdJCIAkMkrz4NpgEX+JUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjCvWBnQFJ7MvBK
  46a+AFjMBLZ4nrQeyuCQRISXVwJQ48cn1v9lSJnPv8fLbrClcE37mc5rWF1lTziWTdY6H3v/V
  ue85ey7nxMUcnr3fLpktyIi+Gr2OT3uugFsyx1zONWsZlx7e/r9+68Hf1f1H5/w9p9eQqJmqr
  zS1fHFGi5RZqWF0qfTf7pJN787t3HlM8Zaux9LSd50qjonWlxdYXc3UmS5xwPp67ce5vN4e65
  iEGKYWsbD2yk99aPEy7KZ7kOzH4g/uUZkGhqmrbY/3ik4/8P+AutyO509qZ/0IeTqj3bjW8aj
  mpkk7bs8LnmN5tcj1dOcpJvPAn8XP2o6s9ljn8mtlZ+4aPx2prM3eSzTF3WXsHE9Z690VD5yV
  +WbPLfOT75Y++WFbv59BLlSJpTgj0VCLuag4EQCqsSgNcwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-591.messagelabs.com!1647343365!10016!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21157 invoked from network); 15 Mar 2022 11:22:45 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-7.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Mar 2022 11:22:45 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 3F44710034F
	for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 11:22:45 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 13F98100452
	for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 11:22:45 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 15 Mar 2022 11:22:41 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libuv: upgrade 1.43.0 -> 1.44.1
Date: Tue, 15 Mar 2022 19:22:19 +0800
Message-ID: <1647343339-78926-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1647343339-78926-1-git-send-email-wangmy@fujitsu.com>
References: <1647343339-78926-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 11:22:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163235

License-Update:
the following message removed from LICENSE:
android-ifaddrs.h, android-ifaddrs.c, copyright Berkeley Software Design
Inc, Kenneth MacKay and Emergya (Cloud4all, FP7/2007-2013, grant agreement
n=C2=B0 289016). Three clause BSD license.

Changes since version 1.43.0:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
* process: simplify uv__write_int calls
* macos: don't use thread-unsafe strtok()
* process: fix hang after NOTE_EXIT
* darwin: remove EPROTOTYPE error workaround
* doc: fix v1.43.0 changelog entries
* win: replace CRITICAL_SECTION+Semaphore with SRWLock
* darwin: translate EPROTOTYPE to ECONNRESET
* android: use libc getifaddrs()
* unix: fix STATIC_ASSERT to check what it means to check
* unix: ensure struct msghdr is zeroed in recvmmsg
* test: test with maximum recvmmsg buffer
* unix: don't allow too small thread stack size
* bsd: ensure mutex is initialized
* doc: add gengjiawen as maintainer
* process: monitor for exit with kqueue on BSDs
* test: fix flaky uv_fs_lutime test
* build: fix cmake install locations
* thread,win: fix C90 style nit
* build: rename CFLAGS to AM_CFLAGS
* doc/guide: update content and sample code
* process,bsd: handle kevent NOTE_EXIT failure
* test: remove flaky test ipc_closed_handle
* darwin: bump minimum supported version to 10.15
* win: return fractional seconds in uv_uptime()
* build: export uv_a for cmake
* loop: add pending work to loop-alive check
* win: use GetTickCount64 for uptime again
* win: restrict system DLL load paths
* win,errors: remap ERROR_ACCESS_DENIED to UV_EACCES
* bench: add 'uv_queue_work' ping-pong measurement
* build: fix error C4146 on MSVC
* test: fix benchmark-ping-udp
* win,fs: consider broken pipe error a normal EOF
* document the values of enum uv_stdio_flags
* win,loop: add missing uv_update_time
* win,fs: avoid closing an invalid handle
* fix oopsie from
* doc: clarify android api level
* win: fix style nits [NFC]
* test: fix flaky udp_mmsg test
* test: fix ipc_send_recv_pipe flakiness
* doc: checkout -> check out
* core: change uv_get_password uid/gid to unsigned
* hurd: unbreak build on GNU/Hurd
* freebsd: use copy_file_range() in uv_fs_sendfile()
* test: use closefd in runner-unix.c
* Reland "macos: use posix_spawn instead of fork"
* android: fix build error when no ifaddrs.h
* unix,win: add uv_available_parallelism()
* process: remove OpenBSD from kevent list
* zos: fix build breakage
* process: only use F_DUPFD_CLOEXEC if it is defined
* win,poll: add the MSAFD GUID for AF_UNIX
* unix: simplify uv__cloexec_fcntl()
* doc: add secondary GPG ID for vtjnash
* unix: remove uv__cloexec_ioctl()

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libuv/{libuv_1.43.0.bb =3D> libuv_1.44.1.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/libuv/{libuv_1.43.0.bb =3D> libuv_1.44.1.bb} (84%)

diff --git a/meta/recipes-connectivity/libuv/libuv_1.43.0.bb b/meta/recipes-connectivity/libuv/libuv_1.44.1.bb
similarity index 84%
rename from meta/recipes-connectivity/libuv/libuv_1.43.0.bb
rename to meta/recipes-connectivity/libuv/libuv_1.44.1.bb
index 4ae4262fb9..4c96d80a65 100644
--- a/meta/recipes-connectivity/libuv/libuv_1.43.0.bb
+++ b/meta/recipes-connectivity/libuv/libuv_1.44.1.bb
@@ -3,9 +3,9 @@ HOMEPAGE =3D "https://github.com/libuv/libuv"
 DESCRIPTION =3D "libuv is a multi-platform support library with a focus on asynchronous I/O. It was primarily developed for use by Node.js, but it's also used by Luvit, Julia, pyuv, and others."
 BUGTRACKER =3D "https://github.com/libuv/libuv/issues"
 LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da68902a430e32200263d182d44924d47"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dad93ca1fffe931537fcf64f6fcce084d"
 
-SRCREV =3D "988f2bfc4defb9a85a536a3e645834c161143ee0"
+SRCREV =3D "e8b7eb6908a847ffbe6ab2eec7428e43a0aa53a2"
 SRC_URI =3D "git://github.com/libuv/libuv;branch=3Dv1.x;protocol=3Dhttps"
 UPSTREAM_CHECK_GITTAGREGEX =3D "v(=3FP<pver>\d+(\.\d+)+)"
 
-- 
2.25.1


