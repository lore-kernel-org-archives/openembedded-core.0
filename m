Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7CF9C98338
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 16:46:46 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40597.1790527604479051396
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 09:46:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IL1A86Dc;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.140, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49fff6f0f87so4886965e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 09:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790527603; x=1791132403; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VqTnYyFm/XGuIA7aY/ZKkMMB0B+4LfzQ9exrv6WBcbw=;
        b=IL1A86DcBlHIYGngL47kr0VUE4I0ldP4Wqer9Zm0bLjeI68afrC5zBtTUwHqcuGs6g
         nV0fDf6OfnYQhkB5y1px82948X/NcF5jg3zPB1Pc2HGsq1eZedp0YsIdBQSn7IxhNI1E
         gYQkp1DedNMm/FlPXXZ2cdcQnC88qu3t2rClk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790527603; x=1791132403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VqTnYyFm/XGuIA7aY/ZKkMMB0B+4LfzQ9exrv6WBcbw=;
        b=hzgsXRRclInuOGxvhUT25x1XDAGeut2o/pZ8vTFLkOA39hbgaWLWHz81ht1UR5rrDC
         XpL3+PBaKQi0KzHyt1YJZrTf84jvWJJtAHFax6CjywYDgN0cl2GDbqwfJbH5GDZcdGxB
         zYe92sZAQ9EWf84h7c9siGJ8DuY6uiBsaUxNkXOAsvSJZ61rqaOuwRfPts0y1lMDp3+z
         Aq3LhzcV2iOyQUfXLPIjSciZV8jyWTv8tE8RqqzXKdJbU3+6ACRitsRvcykUy3Abs0r/
         1vzAirIQifbsMmxcbyRibUs9yZas1f8qqPa1jyLup0xcm+KaLYAHuRg60BzcLTklCZbl
         JTWA==
X-Gm-Message-State: AFuF++kMDJnajCclzSC8F73wpxbW9+Wq0bdnISxXEgyGnHqv6APYIpwy
	VLDBWYdQv0xjj8kPuU2vVUoMCxE+JOJlIJMYF+OcveRWLBYkMK0Rf+DU0jrAV2ORr8NUqgeA9Im
	l//s30eQ=
X-Gm-Gg: AYBFou2ivEZ22NZL4tH5ikigJOcoxWBdclx4fTMCpLwVMX1HrA5V9k1dt30mQw5qzmW
	YDTR70KFnnSZx1G1n5qhLHsxvEp9DYvZgJfkzxlYQmpxd1BpKeRrdCzK8Q9bFagTc842j9Kt7Wx
	tJvXlCkOy4qlBQOiNg88h099/gzIO3OqjIMak/fsjudsI20ooUp2qZhDod2FU3E0puNFPU57NYx
	03Tw+wunwklqjnCpqXliAuKpogfXOmGDcr9pKH0IIlnC/neoSNz5ILS7Z2U5oLnrFkdHzRPNjkD
	iZ+0WriamQMMUDPegpRln88HhZTkQb/9XmZFG8OdI6ZkpBixQgag9YOaO3VBIqFN0ApKxk6eAJO
	A9HNse6Me+s3mOQXYrm9Gbyu3gGE3H6JK1vG3M+ToUxay3Pmya8XaUk09m54RVXEpWg4agte9wi
	YBuB5QZs2KRfvuufGgTBGmK/uz1MN5kiJvaFXWYfuZ0gHYYJDDrBPUL3ock321/lDfVFy6kqB7E
	j0vw4AvrGBBt8b5Wme2mVi9oeDP
X-Received: by 2002:a05:600c:19d1:b0:49c:d818:8764 with SMTP id 5b1f17b1804b1-49fe7b62c5bmr195968735e9.11.1790527602656;
        Sun, 27 Sep 2026 09:46:42 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:6474:fa9a:9a9b:3f85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0029203absm54683365e9.6.2026.09.27.09.46.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 09:46:41 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/8] libuv: upgrade 1.52.1 -> 1.53.0
Date: Sun, 27 Sep 2026 17:46:29 +0100
Message-ID: <20260927164631.2484854-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927164631.2484854-1-richard.purdie@linuxfoundation.org>
References: <20260927164631.2484854-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 16:46:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246696

What's Changed

    unix: fix pedantic compiler warnings
    win: fix const correctness compiler errors
    doc: clarify handle close behavior of uv_spawn
    doc: name function crosslinks consistently
    win: fix const correctness warning
    win/tty: fix off-by-one NUL write in UTF-16 to WTF-8 conversion
    Validate nbufs in UDP send functions
    unix: improve handling of uv_async_send mistakes
    unix: NULL to handle
    test,win: fix race in test runner
    Don't drain when setting the TTY mode
    inet: prefer sizeof with parenthesis
    test: remove unused headers and use more assertion macros
    doc: Add textual images into libuv man page
    darwin: replace EV_OOBAND handling with EVFILT_EXCEPT + NOTE_OOB
    docs: add copybutton sphinx extension
    doc: fix threading bugs in progress example
    unix: support long path names in pipe.c
    win: fix some compiler warnings
    docs: fix broken and redirected links
    doc: remove random reference to libev
    process: better validation for process->pid usage
    unix: check return value of fcntl call
    test: fix -Wunused-function warning
    linux: close streams without an extra read
    unix: enforce recvmmsg buffer size requirements
    fix build on termux
    io: make libuv 64-bit safe
    win,pipe: skip IOCP for pipe handles
    win: use WSA_FLAG_NO_HANDLE_INHERIT in all WSASocketW
    unix: use posix_spawn instead of fork
    test: use correct type for uv_fileno arguments
    [misc] revise security vulnerability reporting instructions by @vtjnash in #5101
    win: fix watch loop logic by @StefanStojanovic in #5013
    win: properly initialize OSVERSIONINFOW
    misc: fix error code returned from uv_wtf8_length_as_utf16
    stream: fix server stop accepting after uv_accept() error
    unix,ibmi: abort on process_title_mutex init failure
    unix,stream: fix getsockopt error handling in connect
    unix: treat futimens() as best-effort in copyfile
    unix: free statxbuf on iouring statx fallback
    aix,ibmi: fix undeclared identifiers and ...
    unix: fix uv__udp_recvmsg crash
    win: use PROC_THREAD_ATTRIBUTE_HANDLE_LIST in uv_spawn
    unix: avoid duplicate recvmmsg terminal callback
    win: fix spawn process with no argument
    unix: handle cloexec failure in kqueue init
    unix: remove UV_HANDLE_READING flag
    src: use INET6_ADDRSTRLEN for IPv6 address buffer
    test: include pty.h for GNU Hurd
    test: skip recvmsg unreachable test when no ipv6
    win: fix race condition in uv_async_send
    unix,fs: fix potentialy copy busyloop
    process,unix: avoid off-by-one in uv__spawn_resolve_and_spawn
    test: check that sizeof is constant
    async: make seq_cst the default
    Reland "linux: eliminate a read on eventfd per wakeup (#4400)"
    win,process: skip dump silently if no valid folder can be determined
    win: handle short path mismatch with a fallback in fs events
    unix,udp: handle msg_hdr.msg_namelen=0 on recvmmsg
    build(deps): bump reactivecircus/android-emulator-runner
    build(deps): bump actions/setup-python from 6.2.0 to 6.3.0
    unix: return EINVAL for invalid tty modes
    ci: use VS 18 / 2026 in Windows Server 2025
    win: fix use of wrong constant in tcp code
    unix: fix UV_FS_O_DIRECT on more Linux architectures
    doc: add UB warning to threading documentation
    build(deps): bump reactivecircus/android-emulator-runner from 2.37.0 to 2.38.0
    sunos: use getrandom(2) for uv_random
    unix,poll: fix callback event bits on error/hangup
    Haiku: build tests with libbsd
    unix: fix static declaration in nested block for AIX and IBM i PASE
    win: fix unique named pipes to work inside Windows AppContainer
    build(deps): bump actions/setup-python from 6.3.0 to 7.0.0
    build(deps): bump actions/checkout from 6.0.3 to 7.0.0
    stream: Implement cancellation support for uv_write_t
    unix: optimize trailing empty write buffers
    stream: handle cancel after close
    build(deps): bump actions/checkout from 7.0.0 to 7.0.1
    test: don't generate io_uring variants of loopless fs tests
    test: close the loop in udp_recvmsg_unreachable_error{,6}
    linux: use scaling_max_freq in uv_cpu_info()
    fix leak if uv_loop_init fails
    solaris: fix build and test failures, add CI
    build(deps): bump vmactions/solaris-vm from 1.3.7 to 1.3.8
    build(deps): bump actions/checkout from 6.0.3 to 7.0.1
    win: fix crash when closing a pipe after a failed bind
    darwin: report physical footprint as rss
    test: close file descriptors leaked by tests
    unix: short-circuit no-op event mask changes in uv__io_stop
    unix,process: never shrink the stdio socket pair buffers
    build(deps): bump vmactions/freebsd-vm from 1.5.6 to 1.5.7
    win: treat explicit stack size as reservation

Read more

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libuv/{libuv_1.52.1.bb => libuv_1.53.0.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/libuv/{libuv_1.52.1.bb => libuv_1.53.0.bb} (94%)

diff --git a/meta/recipes-connectivity/libuv/libuv_1.52.1.bb b/meta/recipes-connectivity/libuv/libuv_1.53.0.bb
similarity index 94%
rename from meta/recipes-connectivity/libuv/libuv_1.52.1.bb
rename to meta/recipes-connectivity/libuv/libuv_1.53.0.bb
index 08f0755911f..8d2b1f8b4b1 100644
--- a/meta/recipes-connectivity/libuv/libuv_1.52.1.bb
+++ b/meta/recipes-connectivity/libuv/libuv_1.53.0.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=74b6f2f7818a4e3a80d03556f71b129b \
                     file://LICENSE-extra;md5=f9307417749e19bd1d6d68a394b49324"
 
-SRCREV = "1cfa32ff59c076ffb6ed735bbc8c18361558661f"
+SRCREV = "840404ce8ba7cc0204be52389a6cfff9f2c90fb6"
 SRC_URI = "git://github.com/libuv/libuv.git;branch=v1.x;protocol=https;tag=v${PV}"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 

