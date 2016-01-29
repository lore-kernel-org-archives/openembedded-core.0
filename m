Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0BC1B771BF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 20:35:36 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id 65so4245173pfd.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 12:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=1BtuU5nV7YQWSoMUg6vMNWmNiNp7k3IVWPsvDOMrO8g=;
	b=HwpbA9EGSnh5r/Ax1wICNpvE8viKjeyph+i8rJv60GJOzY7BRlU7XB6FgmCqA3pJLk
	SuebiThe+7ePAS2RFTGEGCQ148Mswd4sxUKw6YPsAizkNiTr+uum/2C/D2p9I6vzC13u
	vrVDcsvi+mmlRbHGizhT2hF6E3WaFT3noEjNMnUsGJ8WL/nuryRjLczBmkcjW1z0dT+H
	90nSIs4iM+ixap5O+xGqf6bxnrUahJnGgtB2IsJHC6+qGgFm/Lcp4MHlkiL9oF4LkBN+
	mEqv75AnJRxh3D94cuWXH+HmXkp/CmGtSqjg+0olU4PWDYkr36sL00UhmPAnlvqJjrOQ
	82Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=1BtuU5nV7YQWSoMUg6vMNWmNiNp7k3IVWPsvDOMrO8g=;
	b=IUcC6eTh1jS/UkokyfsafNoWZAlhuGbv/bcSVVW9y4wpzRWml2dGv2Gds1ocyMiJ4f
	s1ol8HLONcPEa2Yd9lgMG0s/CqyaVUoPvKPMxlOkq8l2T/Ds88TjI+9T6uHkU3GkPh7m
	j+muuZNzD2IbHGYKibUP/2xrr+xgD16kRo3qivxKuZXNGnQmDShJrZeOHsk0CuMPS4c1
	OvI5SXlaO8ke+Hc4q+OU803FVIOA4Il68zR78ZnkQ5BcYSlH4w8xJeuqUyHMlSI4HquJ
	SX3FZT8z9HxpdOHJkpbzNTFD2t42YuHkMzkr8xh/8QNd5k1uq8Xu/iCXoT+ojUHhfGsg
	4sDw==
X-Gm-Message-State: AG10YOQTAR/A3N1nVJjpOgt3WPTEVi7rqYTF5knn6Du64jgwxwWZI7JuDVXqzrjOalNXcw==
X-Received: by 10.98.87.20 with SMTP id l20mr16535163pfb.70.1454099737648;
	Fri, 29 Jan 2016 12:35:37 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by smtp.gmail.com with ESMTPSA id r80sm858016pfi.9.2016.01.29.12.35.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Jan 2016 12:35:36 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	liezhi.yang@windriver.com
Date: Fri, 29 Jan 2016 12:35:21 -0800
Message-Id: <d2afba471039f94cf251f40298a51dbd640d4e93.1454099596.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <cover.1454099596.git.akuster@mvista.com>
References: <cover.1454099596.git.akuster@mvista.com>
In-Reply-To: <cover.1454099596.git.akuster@mvista.com>
References: <cover.1454099596.git.akuster@mvista.com>
Subject: [PATCH 6/6] qemu: Security fix CVE-2015-7295
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
X-List-Received-Date: Fri, 29 Jan 2016 20:35:39 -0000

From: Armin Kuster <akuster@mvista.com>

CVE-2015-7295 Qemu: net: virtio-net possible remote DoS

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../qemu/qemu/CVE-2015-7295_1.patch                | 63 ++++++++++++++++++++++
 .../qemu/qemu/CVE-2015-7295_2.patch                | 58 ++++++++++++++++++++
 .../qemu/qemu/CVE-2015-7295_3.patch                | 52 ++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.4.0.bb           |  3 ++
 4 files changed, 176 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2015-7295_1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2015-7295_2.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2015-7295_3.patch

diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2015-7295_1.patch b/meta/recipes-devtools/qemu/qemu/CVE-2015-7295_1.patch
new file mode 100644
index 0000000..d7ae871
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2015-7295_1.patch
@@ -0,0 +1,63 @@
+From ce317461573bac12b10d67699b4ddf1f97cf066c Mon Sep 17 00:00:00 2001
+From: Jason Wang <jasowang@redhat.com>
+Date: Fri, 25 Sep 2015 13:21:28 +0800
+Subject: [PATCH] virtio: introduce virtqueue_unmap_sg()
+
+Factor out sg unmapping logic. This will be reused by the patch that
+can discard descriptor.
+
+Cc: Michael S. Tsirkin <mst@redhat.com>
+Cc: Andrew James <andrew.james@hpe.com>
+Signed-off-by: Jason Wang <jasowang@redhat.com>
+Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
+Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
+
+Upstream-Status: Backport
+
+git.qemu.org/?p=qemu.git;a=commit;h=ce317461573bac12b10d67699b4ddf1f97cf066c
+
+CVE: CVE-2015-7295 patch #1
+[Yocto # 9013]
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ hw/virtio/virtio.c | 14 ++++++++++----
+ 1 file changed, 10 insertions(+), 4 deletions(-)
+
+Index: qemu-2.4.0/hw/virtio/virtio.c
+===================================================================
+--- qemu-2.4.0.orig/hw/virtio/virtio.c
++++ qemu-2.4.0/hw/virtio/virtio.c
+@@ -243,14 +243,12 @@ int virtio_queue_empty(VirtQueue *vq)
+     return vring_avail_idx(vq) == vq->last_avail_idx;
+ }
+ 
+-void virtqueue_fill(VirtQueue *vq, const VirtQueueElement *elem,
+-                    unsigned int len, unsigned int idx)
++static void virtqueue_unmap_sg(VirtQueue *vq, const VirtQueueElement *elem,
++                               unsigned int len)
+ {
+     unsigned int offset;
+     int i;
+ 
+-    trace_virtqueue_fill(vq, elem, len, idx);
+-
+     offset = 0;
+     for (i = 0; i < elem->in_num; i++) {
+         size_t size = MIN(len - offset, elem->in_sg[i].iov_len);
+@@ -266,6 +264,14 @@ void virtqueue_fill(VirtQueue *vq, const
+         cpu_physical_memory_unmap(elem->out_sg[i].iov_base,
+                                   elem->out_sg[i].iov_len,
+                                   0, elem->out_sg[i].iov_len);
++}
++
++void virtqueue_fill(VirtQueue *vq, const VirtQueueElement *elem,
++                    unsigned int len, unsigned int idx)
++{
++    trace_virtqueue_fill(vq, elem, len, idx);
++
++    virtqueue_unmap_sg(vq, elem, len);
+ 
+     idx = (idx + vring_used_idx(vq)) % vq->vring.num;
+ 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2015-7295_2.patch b/meta/recipes-devtools/qemu/qemu/CVE-2015-7295_2.patch
new file mode 100644
index 0000000..45dfab3
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2015-7295_2.patch
@@ -0,0 +1,58 @@
+From 29b9f5efd78ae0f9cc02dd169b6e80d2c404bade Mon Sep 17 00:00:00 2001
+From: Jason Wang <jasowang@redhat.com>
+Date: Fri, 25 Sep 2015 13:21:29 +0800
+Subject: [PATCH] virtio: introduce virtqueue_discard()
+
+This patch introduces virtqueue_discard() to discard a descriptor and
+unmap the sgs. This will be used by the patch that will discard
+descriptor when packet is truncated.
+
+Cc: Michael S. Tsirkin <mst@redhat.com>
+Signed-off-by: Jason Wang <jasowang@redhat.com>
+Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
+Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
+Upstream-Status: Backport
+
+git.qemu.org/?p=qemu.git;a=commit;h=29b9f5efd78ae0f9cc02dd169b6e80d2c404bade
+ 
+CVE: CVE-2015-7295 patch #2
+[Yocto # 9013]
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ hw/virtio/virtio.c         | 7 +++++++
+ include/hw/virtio/virtio.h | 2 ++
+ 2 files changed, 9 insertions(+)
+
+Index: qemu-2.4.0/hw/virtio/virtio.c
+===================================================================
+--- qemu-2.4.0.orig/hw/virtio/virtio.c
++++ qemu-2.4.0/hw/virtio/virtio.c
+@@ -266,6 +266,13 @@ static void virtqueue_unmap_sg(VirtQueue
+                                   0, elem->out_sg[i].iov_len);
+ }
+ 
++void virtqueue_discard(VirtQueue *vq, const VirtQueueElement *elem,
++                       unsigned int len)
++{
++    vq->last_avail_idx--;
++    virtqueue_unmap_sg(vq, elem, len);
++}
++
+ void virtqueue_fill(VirtQueue *vq, const VirtQueueElement *elem,
+                     unsigned int len, unsigned int idx)
+ {
+Index: qemu-2.4.0/include/hw/virtio/virtio.h
+===================================================================
+--- qemu-2.4.0.orig/include/hw/virtio/virtio.h
++++ qemu-2.4.0/include/hw/virtio/virtio.h
+@@ -146,6 +146,8 @@ void virtio_del_queue(VirtIODevice *vdev
+ void virtqueue_push(VirtQueue *vq, const VirtQueueElement *elem,
+                     unsigned int len);
+ void virtqueue_flush(VirtQueue *vq, unsigned int count);
++void virtqueue_discard(VirtQueue *vq, const VirtQueueElement *elem,
++                       unsigned int len);
+ void virtqueue_fill(VirtQueue *vq, const VirtQueueElement *elem,
+                     unsigned int len, unsigned int idx);
+ 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2015-7295_3.patch b/meta/recipes-devtools/qemu/qemu/CVE-2015-7295_3.patch
new file mode 100644
index 0000000..74442e3
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2015-7295_3.patch
@@ -0,0 +1,52 @@
+From 0cf33fb6b49a19de32859e2cdc6021334f448fb3 Mon Sep 17 00:00:00 2001
+From: Jason Wang <jasowang@redhat.com>
+Date: Fri, 25 Sep 2015 13:21:30 +0800
+Subject: [PATCH] virtio-net: correctly drop truncated packets
+
+When packet is truncated during receiving, we drop the packets but
+neither discard the descriptor nor add and signal used
+descriptor. This will lead several issues:
+
+- sg mappings are leaked
+- rx will be stalled if a lots of packets were truncated
+
+In order to be consistent with vhost, fix by discarding the descriptor
+in this case.
+
+Cc: Michael S. Tsirkin <mst@redhat.com>
+Signed-off-by: Jason Wang <jasowang@redhat.com>
+Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
+Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
+
+Upstream-Status: Backport
+
+git.qemu.org/?p=qemu.git;a=commit;h=0cf33fb6b49a19de32859e2cdc6021334f448fb3
+
+CVE: CVE-2015-7295 patch #3
+[Yocto # 9013]
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ hw/net/virtio-net.c | 8 +-------
+ 1 file changed, 1 insertion(+), 7 deletions(-)
+
+Index: qemu-2.4.0/hw/net/virtio-net.c
+===================================================================
+--- qemu-2.4.0.orig/hw/net/virtio-net.c
++++ qemu-2.4.0/hw/net/virtio-net.c
+@@ -1086,13 +1086,7 @@ static ssize_t virtio_net_receive(NetCli
+          * must have consumed the complete packet.
+          * Otherwise, drop it. */
+         if (!n->mergeable_rx_bufs && offset < size) {
+-#if 0
+-            error_report("virtio-net truncated non-mergeable packet: "
+-                         "i %zd mergeable %d offset %zd, size %zd, "
+-                         "guest hdr len %zd, host hdr len %zd",
+-                         i, n->mergeable_rx_bufs,
+-                         offset, size, n->guest_hdr_len, n->host_hdr_len);
+-#endif
++            virtqueue_discard(q->rx_vq, &elem, total);
+             return size;
+         }
+ 
diff --git a/meta/recipes-devtools/qemu/qemu_2.4.0.bb b/meta/recipes-devtools/qemu/qemu_2.4.0.bb
index 6e6bd2b..994ddff 100644
--- a/meta/recipes-devtools/qemu/qemu_2.4.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.4.0.bb
@@ -15,6 +15,9 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://CVE-2015-7512.patch \
             file://CVE-2015-8345.patch \
             file://CVE-2016-1568.patch \
+            file://CVE-2015-7295_1.patch \
+            file://CVE-2015-7295_2.patch \
+            file://CVE-2015-7295_3.patch \
            "
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
 SRC_URI[md5sum] = "186ee8194140a484a455f8e3c74589f4"
-- 
2.3.5


