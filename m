Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web10.181.1630174377515760884
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Aug 2021 11:12:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=z4r+TQFL;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.48, mailfrom: steve@sakoman.com)
Received: by mail-io1-f48.google.com with SMTP id a15so13538641iot.2
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Aug 2021 11:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=XR1MFuJ1Gb7a8BK2nbQbD5aBRiD0qZZkh3TiBT+DZ44=;
        b=z4r+TQFLTVr17JC6zjBcIg9uz9P+ZdGprIVp+U5rsh9YH++Kt7vBxAi1LRUM7Z/WGX
         nNtbbBjMcjvX36oT/FVaLBVHlyH3pCSdkeIr8BpLGq/6xyy0I1s/r+qYwy2iy5ffu+rJ
         sWGyjPtLR2JSTFYAbbQdtYLRubd0ISkeW9SMUGp4zPX+OxxqjUbmyVcROyHkG+mbztMc
         l4aehDVNHCOcBTKdfpSgUe4UFSH9lMI0e5HL7IA86YJ2i1Z6nrQVeCEjmywIlt/9wJrE
         A7FayY75axLDarslhVOVM5jGTd2mNh1ebecjPBBkcHhUdVdJRcpsXV0tstdaYWZw8Rtb
         vJJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XR1MFuJ1Gb7a8BK2nbQbD5aBRiD0qZZkh3TiBT+DZ44=;
        b=nKFDLC7tYknCaw0AceTu4LwHLOIfmRCwt+82UCvLn92dPDB5B6XdpnPSA1228FJqRB
         WwWsZf4VTCz52mgDaJXI0IHfHk0k1P/t8zjnhMOqHCkwqaFF8ZS5K8+aUxmlfwe1lSjs
         sJ5bNmNSAnSU+0utE8EiXKgB+CyyXlsc7akzc4cdqiRfsFVwxgMTl3YtQw3sM6auTI4+
         mvGQYtNkcnvBcUKm3SQZx/4Q7qMInSPMHiMxNtirEpBuitu0gZQVF+X6kN5Q4xtM0l3P
         GfKl5TiiG1mPfvZH5E0KmVNx61iUQTQeqJyZTdGMFsaDAPz4pIbc515rm/z5nJNtAQMN
         pO1g==
X-Gm-Message-State: AOAM533DUavj0zWuOz0TwdDxpheGIirAxgX5cOlunxjA4L0AZiuXWcrp
	R6BoBufDra8COzdLQvB+nDZ/KkMyiRFS12t4
X-Google-Smtp-Source: ABdhPJzFc1ijWhc1TOghjEmQeIe7cg2iwZe15J1JU9RVrzCWJh/FN2kYWBqy3GdVFH9eUMjvdn0m3g==
X-Received: by 2002:a02:cacd:: with SMTP id f13mr7911785jap.94.1630174376089;
        Sat, 28 Aug 2021 11:12:56 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id s16sm5511664iln.5.2021.08.28.11.12.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 11:12:54 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/36] qemu: fix CVE-2021-20181
Date: Sat, 28 Aug 2021 08:11:01 -1000
Message-Id: <743fc49c98361baaa9ca9414bfe21220b63dbdca.1630174149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1630174149.git.steve@sakoman.com>
References: <cover.1630174149.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sakib Sajal <sakib.sajal@windriver.com>

Source: Poky.org
MR: 111631
Type: Security Fix
Disposition: Backport from http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/recipes-devtools/qemu?h=hardknott&id=53390d2261d2d35cdd637cf12a0fb4dc63f0f88c
ChangeID: 0c660a9ef3637d847c0880283df05d8696221308
Description:

(From OE-Core rev: a993a379bb490efbbf507f5dccda5ab358e8afea)

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c2f79065ef0684f2c0bdb92f1b03e690ab730b8c)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 53390d2261d2d35cdd637cf12a0fb4dc63f0f88c)
Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2021-20181.patch            | 81 +++++++++++++++++++
 2 files changed, 82 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-20181.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index ea654e0008..a61f69ba49 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -61,6 +61,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2020-25625.patch \
            file://CVE-2020-29443.patch \
            file://CVE-2021-20221.patch \
+           file://CVE-2021-20181.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-20181.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-20181.patch
new file mode 100644
index 0000000000..1b8c77f838
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-20181.patch
@@ -0,0 +1,81 @@
+From c2d2d14e8deece958bbc4fc649d22c3564bc4e7e Mon Sep 17 00:00:00 2001
+From: Greg Kurz <groug@kaod.org>
+Date: Thu, 14 Jan 2021 17:04:12 +0100
+Subject: [PATCH] 9pfs: Fully restart unreclaim loop (CVE-2021-20181)
+
+Depending on the client activity, the server can be asked to open a huge
+number of file descriptors and eventually hit RLIMIT_NOFILE. This is
+currently mitigated using a reclaim logic : the server closes the file
+descriptors of idle fids, based on the assumption that it will be able
+to re-open them later. This assumption doesn't hold of course if the
+client requests the file to be unlinked. In this case, we loop on the
+entire fid list and mark all related fids as unreclaimable (the reclaim
+logic will just ignore them) and, of course, we open or re-open their
+file descriptors if needed since we're about to unlink the file.
+
+This is the purpose of v9fs_mark_fids_unreclaim(). Since the actual
+opening of a file can cause the coroutine to yield, another client
+request could possibly add a new fid that we may want to mark as
+non-reclaimable as well. The loop is thus restarted if the re-open
+request was actually transmitted to the backend. This is achieved
+by keeping a reference on the first fid (head) before traversing
+the list.
+
+This is wrong in several ways:
+- a potential clunk request from the client could tear the first
+  fid down and cause the reference to be stale. This leads to a
+  use-after-free error that can be detected with ASAN, using a
+  custom 9p client
+- fids are added at the head of the list : restarting from the
+  previous head will always miss fids added by a some other
+  potential request
+
+All these problems could be avoided if fids were being added at the
+end of the list. This can be achieved with a QSIMPLEQ, but this is
+probably too much change for a bug fix. For now let's keep it
+simple and just restart the loop from the current head.
+
+Fixes: CVE-2021-20181
+Buglink: https://bugs.launchpad.net/qemu/+bug/1911666
+Reported-by: Zero Day Initiative <zdi-disclosures@trendmicro.com>
+Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
+Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
+Message-Id: <161064025265.1838153.15185571283519390907.stgit@bahia.lan>
+Signed-off-by: Greg Kurz <groug@kaod.org>
+
+Upstream-Status: Backport [89fbea8737e8f7b954745a1ffc4238d377055305]
+CVE: CVE-2021-20181
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ hw/9pfs/9p.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
+index 94df440fc..6026b51a1 100644
+--- a/hw/9pfs/9p.c
++++ b/hw/9pfs/9p.c
+@@ -502,9 +502,9 @@ static int coroutine_fn v9fs_mark_fids_unreclaim(V9fsPDU *pdu, V9fsPath *path)
+ {
+     int err;
+     V9fsState *s = pdu->s;
+-    V9fsFidState *fidp, head_fid;
++    V9fsFidState *fidp;
+ 
+-    head_fid.next = s->fid_list;
++again:
+     for (fidp = s->fid_list; fidp; fidp = fidp->next) {
+         if (fidp->path.size != path->size) {
+             continue;
+@@ -524,7 +524,7 @@ static int coroutine_fn v9fs_mark_fids_unreclaim(V9fsPDU *pdu, V9fsPath *path)
+              * switched to the worker thread
+              */
+             if (err == 0) {
+-                fidp = &head_fid;
++                goto again;
+             }
+         }
+     }
+-- 
+2.29.2
+
-- 
2.25.1

