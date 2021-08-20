Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.5467.1629503726157253986
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Aug 2021 16:55:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=l8+V0VWL;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id j2so2440998pll.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Aug 2021 16:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bfT5a05QjnQVpa0Lb3FCEWrQ0O7eHFVeqxBk3aHjniA=;
        b=l8+V0VWLpEhz+Ic4zauyjND5DEDf5k5KaFMqdhfsB1gLc3NerrxhONAfdG1EuCCPTU
         qXMUXvlCgWfCPTg5wZYiH6TJmcAooNAIRTQHApoVw/fjY1n3fTux0h15LNqhY1wNc1AG
         lVFC3eP7F3wNYA2yr1Kdnt1a/Qm8VhlHpY53SIEZDY1ciO9o6N1Z3cp/g3ewAXCTw0QQ
         O0ZKA1jaJ0uFji3fUTa8b9FSIyr4v2dJ4X7/yJOZj3ZDuunuZLS9QPlmuorWoEvBvodg
         9cmWsNYuuU/EOQiIYcBCoMH8mw7HndzyFdxq2DY4fkN4JIkXkQC98tuDv9tGMUnYoSm7
         CVIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bfT5a05QjnQVpa0Lb3FCEWrQ0O7eHFVeqxBk3aHjniA=;
        b=hJd0KZauSgMd/NnPB1g4KEA/FbCX5YbP86xbkVqlMGOOvoHE2KTebOb14ao0S+gjBv
         n/jnz5goeRkjYqT/JqnDAdLHk6MWg8bDyyeQtUiSRPVV/97htMStEwTqRuvbbMdjehx6
         MCStJmW+yFi3y7PNYbL1cfgcrpqqedFETfnhXV2Ytb0/WjoUYEOx7yV6vzn2H6qBnegG
         HQdLDKHcDTu1knuAA0jhkN3mM4NdDmZhX6HIRsOqsuanDpOUN9xn6YGSeIAuzm639BAI
         paRLYRmJCt8YxUCn24wW4oNELi2IVTfN3FTg1DiMLSE+IBDgLBeiiYteidr112QNSUOZ
         H2Sw==
X-Gm-Message-State: AOAM532b0Z12X9cw9vaQ3wEucn/4sk5/VDURzJdXHNFQK9Mv8Pf6fWyg
	TFFn2nnbK7rvuCnDotuVBSJEqU+43yI=
X-Google-Smtp-Source: ABdhPJzBjtRVnokqb8oU4W4+sV5PyEKdL2DPwaxBQ1AJf/jDM0rqIPgjSbQwA7SCdHheVknfmqzYMQ==
X-Received: by 2002:a17:90b:350e:: with SMTP id ls14mr7178353pjb.28.1629503725469;
        Fri, 20 Aug 2021 16:55:25 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:43c0:2d24:85b:da13])
        by smtp.gmail.com with ESMTPSA id i11sm9634705pgo.25.2021.08.20.16.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Aug 2021 16:55:25 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Sakib Sajal <sakib.sajal@windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Anuj Mittal <anuj.mittal@intel.com>,
	Armin Kuster <akuster@mvista.com>
Subject: [Dunfell][PATCH 6/7] qemu: fix CVE-2021-20181
Date: Fri, 20 Aug 2021 16:55:18 -0700
Message-Id: <20210820235519.593218-6-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210820235519.593218-1-akuster808@gmail.com>
References: <20210820235519.593218-1-akuster808@gmail.com>
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

