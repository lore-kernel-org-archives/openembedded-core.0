Return-Path: <frezidok1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5567AC624A5
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 08:03:03 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24998.1788163379163107521
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Aug 2026 01:02:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pFdjlOgx;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: frezidok1@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a6143cca69so4588549a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 01:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788163377; x=1788768177; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=btJknDEcTVfRvQYKYpqo+tHvSzhOLjvHGkpkizomWSw=;
        b=pFdjlOgxfNBPi+tdBxnSEgRxF8xxiCiAoCqnJ2KVLRPuEmuLHRRJNpHbIEpWOPhBx5
         c5wdfWfCScI5c3CF1uYmovsxGAU301wzKHqn9TGd/ffNpDf7ja+IRbaGqcjgURpFuomU
         AQTtRMQUxQ/IKAxQkWdjNZjh0a9xI0l2fl+47k6jeLC9V3PBnJPEgn9nj2u88eOLA+td
         rHASnAcVAgjij0KyN5Eb6TZykS/PfElNEcmoJQLcJb2CEmqHvQX6KL2Own3SUsjIoSAk
         nV8KEu616SVCKp0LuFAyowIRO8/o1TYLN4qW9vS4tfPAQlSXgRzu35m4Y7LkSPn2wGcr
         yf3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788163377; x=1788768177;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=btJknDEcTVfRvQYKYpqo+tHvSzhOLjvHGkpkizomWSw=;
        b=iwNrUC+fSqBaKDIHVE2+f+FKs6kwSEFhCzzum/WBk8Cb5R7DqpImKhTpTpZEM31qgp
         5OQEPc8L0deHsYRzZOLKHylKjlV0mPPGs/qLjPyC48TsVra1u0v1GI0PVhINDhEGdxrv
         FxC7M8zlBIMFsMUNhzd+4SZOgCRxw++oSDVFOBi/EVDIlYih5cKNHNUOdI9pqf1DYFfl
         L02YT5pmrlDKHm4RGTzQ6zcpqwpfOFn410l4ISYaJlQ3wYJxwROPg3BV9cR7d/d31xkC
         CYr6x8DtgtihU+Je5LCgpnOgNKvuubERd/n24Nv/mDj/3QwEMnVg7ohv4oi22yB0Th3n
         rtvg==
X-Gm-Message-State: AFuF++mafJpn9WuHn8iYd5mxWQjqDQNN9PDVomX8v9dS8OCPrRe/qW1U
	7x7Hnv7BUpbdhh7pTERuqyCTuJHBKFCu4e+0oip9xI4MDy68qYGhhYjkBHO4GfKP
X-Gm-Gg: AYBFou1yr91C9tb7y01thPUL8lXhldWYbKx6yRgPbi6ih7jypkIJjZIzGGFE8uX/CGU
	E1sIyP6UogT/LuCMg9ScyWuzGAqxcmE0uqAT00qluNiT3PZ8KSkZAs99S3l8y51BbqW5Xg1KJ1r
	/7kYklw2pRXj8hX1fUi9DQY5n3G8OO+FH+FE3o6j6YledLYjCFZD+PbtsaHK9fVADRk9w3cqYVd
	51vnptLhQKOlA8/d/qdlY1nkj54lGkSvYHxYfovoKZ3xfr/BjZlB2JYRkTdvlGbcFM+MN+KI5aw
	snnjW2BbJgTVq7xAFVIQXyNfpRoPBTp/UQzfJg3MlFWzX3/qgKYKN2NmyQVDzCsBknXgEKlQmBu
	yrh/1a5QyINcpgJvrVM8KAqYQpTanhMV+t0cL9kcFrFsRtQXaIOkj9M2/ZzrpHw8WQ7RI/yhKiz
	otUC2MEeguYLU02GVZlrZj/FJyFBqdPfw7Lut/9BtHPKu2nmP1pzsLihk/
X-Received: by 2002:a05:6402:2b86:b0:6a5:ed9e:b490 with SMTP id 4fb4d7f45d1cf-6a60d3c6993mr14646938a12.14.1788163376731;
        Mon, 31 Aug 2026 01:02:56 -0700 (PDT)
Received: from ubuntu1.. ([194.87.83.187])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a611b675d1sm3333366a12.9.2026.08.31.01.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:02:56 -0700 (PDT)
From: frezidok1@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: martin.jansa@gmail.com,
	Dmitry Sakhonchik <frezidok1@gmail.com>
Subject: [PATCH] io_uring-writev: open output file through io_uring
Date: Mon, 31 Aug 2026 11:02:23 +0300
Message-ID: <20260831080223.124050-1-frezidok1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 08:03:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244735

From: Dmitry Sakhonchik <frezidok1@gmail.com>

The existing test creates the output file with open(), which ends up
using openat() and is therefore intercepted by pseudo before the actual
io_uring write operation happens.

Use IORING_OP_OPENAT to create the output file through io_uring as well.
This makes the test successfully bypass pseudo

io-uring-writev.bb: wrynose doesn't support "S = ${WORKDIR}" anymore, fix it

[YOCTO #15244]

Signed-off-by: Dmitry Sakhonchik <frezidok1@gmail.com>
---
 .../recipes-test/io-uring/io-uring-writev.bb  |  2 +-
 .../io-uring-writev/io-uring-writev.c         | 98 ++++++++++++++++---
 2 files changed, 88 insertions(+), 12 deletions(-)

diff --git a/meta-selftest/recipes-test/io-uring/io-uring-writev.bb b/meta-selftest/recipes-test/io-uring/io-uring-writev.bb
index 8b2ca6005b..f5de317429 100644
--- a/meta-selftest/recipes-test/io-uring/io-uring-writev.bb
+++ b/meta-selftest/recipes-test/io-uring/io-uring-writev.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
 
 SRC_URI = "file://io-uring-writev.c"
 
-S = "${WORKDIR}"
+S = "${UNPACKDIR}"
 
 do_compile() {
 	${BUILD_CC} io-uring-writev.c -o io-uring-writev
diff --git a/meta-selftest/recipes-test/io-uring/io-uring-writev/io-uring-writev.c b/meta-selftest/recipes-test/io-uring/io-uring-writev/io-uring-writev.c
index a5e4253b7a..54f49fa481 100644
--- a/meta-selftest/recipes-test/io-uring/io-uring-writev/io-uring-writev.c
+++ b/meta-selftest/recipes-test/io-uring/io-uring-writev/io-uring-writev.c
@@ -20,10 +20,13 @@
 /* If your compilation fails because the header file below is missing,
  * your kernel is probably too old to support io_uring.
  * */
+#include <errno.h>
+#include <stdbool.h>
 #include <linux/io_uring.h>
 
 #define QUEUE_DEPTH 1
 #define BLOCK_SZ    1024
+#define OPEN_TAG    1
 
 /* This is x86 specific */
 #define read_barrier()  __asm__ __volatile__("":::"memory")
@@ -101,6 +104,79 @@ off_t get_file_size(int fd) {
     return -1;
 }
 
+int open_with_uring(const char* path, struct submitter *s) {
+    struct app_io_sq_ring *sring = &s->sq_ring;
+    struct app_io_cq_ring *cring = &s->cq_ring;
+
+    // Get position of the next SQE
+    unsigned tail = *sring->tail;
+    read_barrier();
+    unsigned index = tail & *sring->ring_mask;
+    unsigned next_tail = tail + 1;
+    struct io_uring_sqe *sqe = &s->sqes[index];
+
+    // Prepare SQE
+    memset(sqe, 0, sizeof(*sqe));
+    sqe->opcode = IORING_OP_OPENAT;
+    sqe->fd = AT_FDCWD;
+    sqe->addr = (unsigned long)path;
+    sqe->open_flags = O_WRONLY | O_CREAT;
+    sqe->len = 0666;
+    sqe->user_data = OPEN_TAG;
+
+    // Add prepared sqe to the submission queue
+    sring->array[index] = index;
+
+    // Update the tail so the kernel can see it
+    tail = next_tail;
+    if(*sring->tail != tail) {
+        write_barrier();
+        *sring->tail = tail;
+    }
+
+    //Tell the kernel to process events in SQ
+    int ret =  io_uring_enter(s->ring_fd, 1,1,
+            IORING_ENTER_GETEVENTS);
+    if(ret < 0) {
+        perror("io_uring_enter");
+        return -1;
+    }
+
+    //Now we need to read the output from kernel from the CQ
+    while (true) {
+        unsigned head = *cring->head;
+        tail = *cring->tail;
+        read_barrier();
+
+        if (head == tail) {
+            /*  It means the buffer is empty.
+             *  If we are here, then something went wrong and
+             *  kernel didn't return CQE with user_data == OPEN_TAG for some reason
+             */
+            fprintf(stderr, "open_with_uring error: kernel didn't return fd");
+            return -1;
+        }
+
+        index = head & *cring->ring_mask;
+        struct io_uring_cqe *cqe = &cring->cqes[index];
+
+        unsigned long long tag = cqe->user_data;
+        int res = cqe->res;
+
+        write_barrier();
+        *cring->head = head + 1;
+
+        if (tag == OPEN_TAG) {
+            if (res < 0) {
+                errno = -res;
+                perror("IORING_OP_OPENAT");
+                return -1;
+            }
+            return res;
+        }
+    }
+}
+
 /*
  * io_uring requires a lot of setup which looks pretty hairy, but isn't all
  * that difficult to understand. Because of all this boilerplate code,
@@ -155,7 +231,7 @@ int app_setup_uring(struct submitter *s) {
     /* Map in the submission and completion queue ring buffers.
      * Older kernels only map in the submission queue, though.
      * */
-    sq_ptr = mmap(0, sring_sz, PROT_READ | PROT_WRITE, 
+    sq_ptr = mmap(0, sring_sz, PROT_READ | PROT_WRITE,
             MAP_SHARED | MAP_POPULATE,
             s->ring_fd, IORING_OFF_SQ_RING);
     if (sq_ptr == MAP_FAILED) {
@@ -167,7 +243,7 @@ int app_setup_uring(struct submitter *s) {
         cq_ptr = sq_ptr;
     } else {
         /* Map in the completion queue ring buffer in older kernels separately */
-        cq_ptr = mmap(0, cring_sz, PROT_READ | PROT_WRITE, 
+        cq_ptr = mmap(0, cring_sz, PROT_READ | PROT_WRITE,
                 MAP_SHARED | MAP_POPULATE,
                 s->ring_fd, IORING_OFF_CQ_RING);
         if (cq_ptr == MAP_FAILED) {
@@ -266,8 +342,8 @@ void read_from_cq(struct submitter *s) {
 int submit_to_sq(char *file_path, struct submitter *s) {
     struct file_info *fi;
 
-    int file_fd = open(file_path, O_WRONLY|O_CREAT, 0666);
-    if (file_fd < 0 ) {
+    int file_fd = open_with_uring(file_path, s);
+    if (file_fd < 0) {
         perror("open");
         return 1;
     }
@@ -317,7 +393,7 @@ int submit_to_sq(char *file_path, struct submitter *s) {
     */
     fi->iovecs[current_block].iov_len = bytes_remaining;
     fi->iovecs[current_block].iov_base = bark;
-    
+
 
     /* Add our submission queue entry to the tail of the SQE ring buffer */
     next_tail = tail = *sring->tail;
@@ -336,7 +412,7 @@ int submit_to_sq(char *file_path, struct submitter *s) {
     tail = next_tail;
 
     /* Update the tail so the kernel can see it. */
-    if(*sring->tail != tail) {
+    if (*sring->tail != tail) {
         *sring->tail = tail;
         write_barrier();
     }
@@ -347,9 +423,9 @@ int submit_to_sq(char *file_path, struct submitter *s) {
      * io_uring_enter() call to wait until min_complete events (the 3rd param)
      * complete.
      * */
-    int ret =  io_uring_enter(s->ring_fd, 1,1,
-            IORING_ENTER_GETEVENTS);
-    if(ret < 0) {
+    int ret = io_uring_enter(s->ring_fd, 1, 1,
+                             IORING_ENTER_GETEVENTS);
+    if (ret < 0) {
         perror("io_uring_enter");
         return 1;
     }
@@ -372,13 +448,13 @@ int main(int argc, char *argv[]) {
     }
     memset(s, 0, sizeof(*s));
 
-    if(app_setup_uring(s)) {
+    if (app_setup_uring(s)) {
         fprintf(stderr, "Unable to setup uring!\n");
         return 1;
     }
 
     for (int i = 1; i < argc; i++) {
-        if(submit_to_sq(argv[i], s)) {
+        if (submit_to_sq(argv[i], s)) {
             fprintf(stderr, "Error writting file\n");
             return 1;
         }

