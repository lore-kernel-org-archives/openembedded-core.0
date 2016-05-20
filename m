Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 657D5731A4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2016 14:03:39 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id y7so11442017pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2016 07:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=g0U0CArZuFsc9mS4najRvNfy26IUInA7Ycm00IwqlqQ=;
	b=b7CIgM3gGhIgZICXzZl4saQPHPrvfJ9yZplahQlGRudquktBwyfGqTq8tqvLSNSAEQ
	PRvv/9v8FZKIm9UA0Xefv//xLDFXV8A3Fg6JPQVnHkFb4F4ECxcgQK8X9mUE5hToozxq
	FWKk6tM6Cq5cCcK5s46DeJWmL6u2yxljIYkpOK2JUy/h7AJRDusm9jh9bf4zO/EuOgwS
	5ZdWeBQArxjiDkLVCGrwVmVn/d5eflzU9sYBps6t8XYP4QynBDSBneVijjFttrdF3/5x
	Wp2RxNyNMOO2RbgvSjOHneWO8ic/fzNw/h6dJaNeIMl0XYKE+pFKzr3rCYHymJR6Mp6k
	0zsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=g0U0CArZuFsc9mS4najRvNfy26IUInA7Ycm00IwqlqQ=;
	b=SLNtXD8Cg2MSdoC3G5/9IUQ+EL/Np3kcIIccZDItN8+yOruX+H0wrSyDRwYL41W2id
	JoFHPj93axtZ+Jzwv8hhizcOZS+SPoSCngVr4pH3H1rThPLorG5KjzoIN9dhRLTuGBb1
	Abf2fPhduNRjW17TrzjN7glv3dfJn+gEBwRW3aq/1jKvYd7moet2DbF+f9dvykvh+E1p
	nW+Vh+dN8k9Q2QhWSeSgtdLdNr/8soL2rkmzK/Bbrxw2/FC1TKlCDGtl634Rpe+sCde/
	2+Bo72Mog4J9QFJF9cbVsruztee0AQQpVX6Ul1FlEMWpCIWWcGBXIyCWLLojGuB5DbWZ
	z81w==
X-Gm-Message-State: AOPr4FW7hLLdKAHNXGW21v8bTu3xR4ukIY1rPcwr0mM+rzVzQx9BPKA0CW3a4Pxgz0yUTQ==
X-Received: by 10.98.90.7 with SMTP id o7mr5104804pfb.110.1463753019273;
	Fri, 20 May 2016 07:03:39 -0700 (PDT)
Received: from haswell.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	w125sm27642542pfb.53.2016.05.20.07.03.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 20 May 2016 07:03:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 May 2016 07:03:29 -0700
Message-Id: <1463753010-32035-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.8.2
Cc: Marek Vasut <marex@denx.de>
Subject: [PATCH 1/4] qemu: Upgrade to 2.6.0
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
X-List-Received-Date: Fri, 20 May 2016 14:03:40 -0000

From: Marek Vasut <marex@denx.de>

Signed-off-by: Marek Vasut <marex@denx.de>
---
 .../recipes-devtools/qemu/qemu/CVE-2016-2198.patch |  45 -----
 .../recipes-devtools/qemu/qemu/CVE-2016-2858.patch | 183 ---------------------
 .../recipes-devtools/qemu/qemu/disable-grabs.patch |   4 +-
 .../fix-libcap-header-issue-on-some-distro.patch   |   6 +-
 ...ng_move_request_from_RngEgd_to_RngBackend.patch | 138 ----------------
 ...t_queue_cleanup_from_RngEgd_to_RngBackend.patch | 150 -----------------
 ...move_the_unused_request_cancellation_code.patch | 101 ------------
 .../qemu/{qemu_2.5.1.1.bb => qemu_2.6.0.bb}        |   9 +-
 8 files changed, 7 insertions(+), 629 deletions(-)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-2198.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-2858.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/rng_move_request_from_RngEgd_to_RngBackend.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/rng_move_request_queue_cleanup_from_RngEgd_to_RngBackend.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/rng_remove_the_unused_request_cancellation_code.patch
 rename meta/recipes-devtools/qemu/{qemu_2.5.1.1.bb => qemu_2.6.0.bb} (62%)

diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2016-2198.patch b/meta/recipes-devtools/qemu/qemu/CVE-2016-2198.patch
deleted file mode 100644
index f1201f0..0000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2016-2198.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From: Prasad J Pandit <address@hidden>
-
-USB Ehci emulation supports host controller capability registers.
-But its mmio '.write' function was missing, which lead to a null
-pointer dereference issue. Add a do nothing 'ehci_caps_write'
-definition to avoid it; Do nothing because capability registers
-are Read Only(RO).
-
-Reported-by: Zuozhi Fzz <address@hidden>
-Signed-off-by: Prasad J Pandit <address@hidden>
-
-Upstream-Status: Backport
-https://lists.gnu.org/archive/html/qemu-devel/2016-01/msg05899.html
-
-CVE: CVE-2016-2198
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
----
- hw/usb/hcd-ehci.c | 6 ++++++
-  1 file changed, 6 insertions(+)
-
-Index: qemu-2.5.0/hw/usb/hcd-ehci.c
-===================================================================
---- qemu-2.5.0.orig/hw/usb/hcd-ehci.c
-+++ qemu-2.5.0/hw/usb/hcd-ehci.c
-@@ -893,6 +893,11 @@ static uint64_t ehci_caps_read(void *ptr
-     return s->caps[addr];
- }
- 
-+static void ehci_caps_write(void *ptr, hwaddr addr,
-+                             uint64_t val, unsigned size)
-+{
-+}
-+
- static uint64_t ehci_opreg_read(void *ptr, hwaddr addr,
-                                 unsigned size)
- {
-@@ -2310,6 +2315,7 @@ static void ehci_frame_timer(void *opaqu
- 
- static const MemoryRegionOps ehci_mmio_caps_ops = {
-     .read = ehci_caps_read,
-+    .write = ehci_caps_write,
-     .valid.min_access_size = 1,
-     .valid.max_access_size = 4,
-     .impl.min_access_size = 1,
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2016-2858.patch b/meta/recipes-devtools/qemu/qemu/CVE-2016-2858.patch
deleted file mode 100644
index d5395e6..0000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2016-2858.patch
+++ /dev/null
@@ -1,183 +0,0 @@
-From 60253ed1e6ec6d8e5ef2efe7bf755f475dce9956 Mon Sep 17 00:00:00 2001
-From: Ladi Prosek <lprosek@redhat.com>
-Date: Thu, 3 Mar 2016 09:37:18 +0100
-Subject: [PATCH] rng: add request queue support to rng-random
-
-Requests are now created in the RngBackend parent class and the
-code path is shared by both rng-egd and rng-random.
-
-This commit fixes the rng-random implementation which processed
-only one request at a time and simply discarded all but the most
-recent one. In the guest this manifested as delayed completion
-of reads from virtio-rng, i.e. a read was completed only after
-another read was issued.
-
-By switching rng-random to use the same request queue as rng-egd,
-the unsafe stack-based allocation of the entropy buffer is
-eliminated and replaced with g_malloc.
-
-Signed-off-by: Ladi Prosek <lprosek@redhat.com>
-Reviewed-by: Amit Shah <amit.shah@redhat.com>
-Message-Id: <1456994238-9585-5-git-send-email-lprosek@redhat.com>
-Signed-off-by: Amit Shah <amit.shah@redhat.com>
-
-Upstream-Status: Backport
-CVE: CVE-2016-2858
-
-http://git.qemu.org/?p=qemu.git;a=commit;h=60253ed1e6ec6d8e5ef2efe7bf755f475
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
----
- backends/rng-egd.c    | 16 ++--------------
- backends/rng-random.c | 43 +++++++++++++++++++------------------------
- backends/rng.c        | 13 ++++++++++++-
- include/sysemu/rng.h  |  3 +--
- 4 files changed, 34 insertions(+), 41 deletions(-)
-
-Index: qemu-2.5.0/backends/rng-egd.c
-===================================================================
---- qemu-2.5.0.orig/backends/rng-egd.c
-+++ qemu-2.5.0/backends/rng-egd.c
-@@ -26,20 +26,10 @@ typedef struct RngEgd
-     char *chr_name;
- } RngEgd;
- 
--static void rng_egd_request_entropy(RngBackend *b, size_t size,
--                                    EntropyReceiveFunc *receive_entropy,
--                                    void *opaque)
-+static void rng_egd_request_entropy(RngBackend *b, RngRequest *req)
- {
-     RngEgd *s = RNG_EGD(b);
--    RngRequest *req;
--
--    req = g_malloc(sizeof(*req));
--
--    req->offset = 0;
--    req->size = size;
--    req->receive_entropy = receive_entropy;
--    req->opaque = opaque;
--    req->data = g_malloc(req->size);
-+    size_t size = req->size;
- 
-     while (size > 0) {
-         uint8_t header[2];
-@@ -53,8 +43,6 @@ static void rng_egd_request_entropy(RngB
- 
-         size -= len;
-     }
--
--    s->parent.requests = g_slist_append(s->parent.requests, req);
- }
- 
- static int rng_egd_chr_can_read(void *opaque)
-Index: qemu-2.5.0/backends/rng-random.c
-===================================================================
---- qemu-2.5.0.orig/backends/rng-random.c
-+++ qemu-2.5.0/backends/rng-random.c
-@@ -21,10 +21,6 @@ struct RndRandom
- 
-     int fd;
-     char *filename;
--
--    EntropyReceiveFunc *receive_func;
--    void *opaque;
--    size_t size;
- };
- 
- /**
-@@ -37,36 +33,35 @@ struct RndRandom
- static void entropy_available(void *opaque)
- {
-     RndRandom *s = RNG_RANDOM(opaque);
--    uint8_t buffer[s->size];
--    ssize_t len;
- 
--    len = read(s->fd, buffer, s->size);
--    if (len < 0 && errno == EAGAIN) {
--        return;
--    }
--    g_assert(len != -1);
-+    while (s->parent.requests != NULL) {
-+        RngRequest *req = s->parent.requests->data;
-+        ssize_t len;
-+
-+        len = read(s->fd, req->data, req->size);
-+        if (len < 0 && errno == EAGAIN) {
-+            return;
-+        }
-+        g_assert(len != -1);
-+
-+        req->receive_entropy(req->opaque, req->data, len);
- 
--    s->receive_func(s->opaque, buffer, len);
--    s->receive_func = NULL;
-+        rng_backend_finalize_request(&s->parent, req);
-+    }
- 
-+    /* We've drained all requests, the fd handler can be reset. */
-     qemu_set_fd_handler(s->fd, NULL, NULL, NULL);
- }
- 
--static void rng_random_request_entropy(RngBackend *b, size_t size,
--                                        EntropyReceiveFunc *receive_entropy,
--                                        void *opaque)
-+static void rng_random_request_entropy(RngBackend *b, RngRequest *req)
- {
-     RndRandom *s = RNG_RANDOM(b);
- 
--    if (s->receive_func) {
--        s->receive_func(s->opaque, NULL, 0);
-+    if (s->parent.requests == NULL) {
-+        /* If there are no pending requests yet, we need to
-+         * install our fd handler. */
-+        qemu_set_fd_handler(s->fd, entropy_available, NULL, s);
-     }
--
--    s->receive_func = receive_entropy;
--    s->opaque = opaque;
--    s->size = size;
--
--    qemu_set_fd_handler(s->fd, entropy_available, NULL, s);
- }
- 
- static void rng_random_opened(RngBackend *b, Error **errp)
-Index: qemu-2.5.0/backends/rng.c
-===================================================================
---- qemu-2.5.0.orig/backends/rng.c
-+++ qemu-2.5.0/backends/rng.c
-@@ -19,9 +19,20 @@ void rng_backend_request_entropy(RngBack
-                                  void *opaque)
- {
-     RngBackendClass *k = RNG_BACKEND_GET_CLASS(s);
-+    RngRequest *req;
- 
-     if (k->request_entropy) {
--        k->request_entropy(s, size, receive_entropy, opaque);
-+        req = g_malloc(sizeof(*req));
-+
-+        req->offset = 0;
-+        req->size = size;
-+        req->receive_entropy = receive_entropy;
-+        req->opaque = opaque;
-+        req->data = g_malloc(req->size);
-+
-+        k->request_entropy(s, req);
-+
-+        s->requests = g_slist_append(s->requests, req);
-     }
- }
- 
-Index: qemu-2.5.0/include/sysemu/rng.h
-===================================================================
---- qemu-2.5.0.orig/include/sysemu/rng.h
-+++ qemu-2.5.0/include/sysemu/rng.h
-@@ -46,8 +46,7 @@ struct RngBackendClass
- {
-     ObjectClass parent_class;
- 
--    void (*request_entropy)(RngBackend *s, size_t size,
--                            EntropyReceiveFunc *receive_entropy, void *opaque);
-+    void (*request_entropy)(RngBackend *s, RngRequest *req);
- 
-     void (*opened)(RngBackend *s, Error **errp);
- };
diff --git a/meta/recipes-devtools/qemu/qemu/disable-grabs.patch b/meta/recipes-devtools/qemu/qemu/disable-grabs.patch
index 41726b1..123833f 100644
--- a/meta/recipes-devtools/qemu/qemu/disable-grabs.patch
+++ b/meta/recipes-devtools/qemu/qemu/disable-grabs.patch
@@ -29,9 +29,9 @@ index 39a42d6..9b8abe5 100644
 --- a/ui/sdl.c
 +++ b/ui/sdl.c
 @@ -59,6 +59,10 @@ static SDL_Cursor *guest_sprite = NULL;
- static SDL_PixelFormat host_format;
  static int scaling_active = 0;
  static Notifier mouse_mode_notifier;
+ static int idle_counter;
 +#ifndef True
 +#define True 1
 +#endif
@@ -40,7 +40,7 @@ index 39a42d6..9b8abe5 100644
  static void sdl_update(DisplayChangeListener *dcl,
                         int x, int y, int w, int h)
 @@ -384,14 +388,16 @@ static void sdl_grab_start(void)
-             SDL_WarpMouse(guest_x, guest_y);
+             }
      } else
          sdl_hide_cursor();
 -    SDL_WM_GrabInput(SDL_GRAB_ON);
diff --git a/meta/recipes-devtools/qemu/qemu/fix-libcap-header-issue-on-some-distro.patch b/meta/recipes-devtools/qemu/qemu/fix-libcap-header-issue-on-some-distro.patch
index 13a6ea2..cee6a67 100644
--- a/meta/recipes-devtools/qemu/qemu/fix-libcap-header-issue-on-some-distro.patch
+++ b/meta/recipes-devtools/qemu/qemu/fix-libcap-header-issue-on-some-distro.patch
@@ -67,9 +67,9 @@ diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
  #include <sys/vfs.h>
  #include <sys/ioctl.h>
 @@ -26,7 +25,11 @@
- #include "virtio-9p-marshal.h"
- #include "hw/9pfs/virtio-9p-proxy.h"
- #include "fsdev/virtio-9p-marshal.h"
+ #include "9p-iov-marshal.h"
+ #include "hw/9pfs/9p-proxy.h"
+ #include "fsdev/9p-iov-marshal.h"
 -
 +/*
 + * Include this one last due to some versions of it being buggy:
diff --git a/meta/recipes-devtools/qemu/qemu/rng_move_request_from_RngEgd_to_RngBackend.patch b/meta/recipes-devtools/qemu/qemu/rng_move_request_from_RngEgd_to_RngBackend.patch
deleted file mode 100644
index 01928f9..0000000
--- a/meta/recipes-devtools/qemu/qemu/rng_move_request_from_RngEgd_to_RngBackend.patch
+++ /dev/null
@@ -1,138 +0,0 @@
-From 74074e8a7c60592cf1cc6469dbc2550d24aeded3 Mon Sep 17 00:00:00 2001
-From: Ladi Prosek <lprosek@redhat.com>
-Date: Thu, 3 Mar 2016 09:37:16 +0100
-Subject: [PATCH] rng: move request queue from RngEgd to RngBackend
-
-The 'requests' field now lives in the RngBackend parent class.
-There are no functional changes in this commit.
-
-Signed-off-by: Ladi Prosek <lprosek@redhat.com>
-Reviewed-by: Amit Shah <amit.shah@redhat.com>
-Message-Id: <1456994238-9585-3-git-send-email-lprosek@redhat.com>
-Signed-off-by: Amit Shah <amit.shah@redhat.com>
-
-Upstream-Status: Backport
-in support of CVE-2016-2858
-
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
----
- backends/rng-egd.c   | 28 +++++++++-------------------
- include/sysemu/rng.h | 11 +++++++++++
- 2 files changed, 20 insertions(+), 19 deletions(-)
-
-Index: qemu-2.5.0/backends/rng-egd.c
-===================================================================
---- qemu-2.5.0.orig/backends/rng-egd.c
-+++ qemu-2.5.0/backends/rng-egd.c
-@@ -24,19 +24,8 @@ typedef struct RngEgd
- 
-     CharDriverState *chr;
-     char *chr_name;
--
--    GSList *requests;
- } RngEgd;
- 
--typedef struct RngRequest
--{
--    EntropyReceiveFunc *receive_entropy;
--    uint8_t *data;
--    void *opaque;
--    size_t offset;
--    size_t size;
--} RngRequest;
--
- static void rng_egd_request_entropy(RngBackend *b, size_t size,
-                                     EntropyReceiveFunc *receive_entropy,
-                                     void *opaque)
-@@ -65,7 +54,7 @@ static void rng_egd_request_entropy(RngB
-         size -= len;
-     }
- 
--    s->requests = g_slist_append(s->requests, req);
-+    s->parent.requests = g_slist_append(s->parent.requests, req);
- }
- 
- static void rng_egd_free_request(RngRequest *req)
-@@ -80,7 +69,7 @@ static int rng_egd_chr_can_read(void *op
-     GSList *i;
-     int size = 0;
- 
--    for (i = s->requests; i; i = i->next) {
-+    for (i = s->parent.requests; i; i = i->next) {
-         RngRequest *req = i->data;
-         size += req->size - req->offset;
-     }
-@@ -93,8 +82,8 @@ static void rng_egd_chr_read(void *opaqu
-     RngEgd *s = RNG_EGD(opaque);
-     size_t buf_offset = 0;
- 
--    while (size > 0 && s->requests) {
--        RngRequest *req = s->requests->data;
-+    while (size > 0 && s->parent.requests) {
-+        RngRequest *req = s->parent.requests->data;
-         int len = MIN(size, req->size - req->offset);
- 
-         memcpy(req->data + req->offset, buf + buf_offset, len);
-@@ -103,7 +92,8 @@ static void rng_egd_chr_read(void *opaqu
-         size -= len;
- 
-         if (req->offset == req->size) {
--            s->requests = g_slist_remove_link(s->requests, s->requests);
-+            s->parent.requests = g_slist_remove_link(s->parent.requests,
-+                                                     s->parent.requests);
- 
-             req->receive_entropy(req->opaque, req->data, req->size);
- 
-@@ -116,12 +106,12 @@ static void rng_egd_free_requests(RngEgd
- {
-     GSList *i;
- 
--    for (i = s->requests; i; i = i->next) {
-+    for (i = s->parent.requests; i; i = i->next) {
-         rng_egd_free_request(i->data);
-     }
- 
--    g_slist_free(s->requests);
--    s->requests = NULL;
-+    g_slist_free(s->parent.requests);
-+    s->parent.requests = NULL;
- }
- 
- static void rng_egd_cancel_requests(RngBackend *b)
-Index: qemu-2.5.0/include/sysemu/rng.h
-===================================================================
---- qemu-2.5.0.orig/include/sysemu/rng.h
-+++ qemu-2.5.0/include/sysemu/rng.h
-@@ -25,6 +25,7 @@
- #define RNG_BACKEND_CLASS(klass) \
-     OBJECT_CLASS_CHECK(RngBackendClass, (klass), TYPE_RNG_BACKEND)
- 
-+typedef struct RngRequest RngRequest;
- typedef struct RngBackendClass RngBackendClass;
- typedef struct RngBackend RngBackend;
- 
-@@ -32,6 +33,15 @@ typedef void (EntropyReceiveFunc)(void *
-                                   const void *data,
-                                   size_t size);
- 
-+struct RngRequest
-+{
-+    EntropyReceiveFunc *receive_entropy;
-+    uint8_t *data;
-+    void *opaque;
-+    size_t offset;
-+    size_t size;
-+};
-+
- struct RngBackendClass
- {
-     ObjectClass parent_class;
-@@ -49,6 +59,7 @@ struct RngBackend
- 
-     /*< protected >*/
-     bool opened;
-+    GSList *requests;
- };
- 
- /**
diff --git a/meta/recipes-devtools/qemu/qemu/rng_move_request_queue_cleanup_from_RngEgd_to_RngBackend.patch b/meta/recipes-devtools/qemu/qemu/rng_move_request_queue_cleanup_from_RngEgd_to_RngBackend.patch
deleted file mode 100644
index afe8bf6..0000000
--- a/meta/recipes-devtools/qemu/qemu/rng_move_request_queue_cleanup_from_RngEgd_to_RngBackend.patch
+++ /dev/null
@@ -1,150 +0,0 @@
-From 9f14b0add1dcdbfa2ee61051d068211fb0a1fcc9 Mon Sep 17 00:00:00 2001
-From: Ladi Prosek <lprosek@redhat.com>
-Date: Thu, 3 Mar 2016 09:37:17 +0100
-Subject: [PATCH] rng: move request queue cleanup from RngEgd to RngBackend
-
-RngBackend is now in charge of cleaning up the linked list on
-instance finalization. It also exposes a function to finalize
-individual RngRequest instances, called by its child classes.
-
-Signed-off-by: Ladi Prosek <lprosek@redhat.com>
-Reviewed-by: Amit Shah <amit.shah@redhat.com>
-Message-Id: <1456994238-9585-4-git-send-email-lprosek@redhat.com>
-Signed-off-by: Amit Shah <amit.shah@redhat.com>
-
-Upstream-Status: Backport
-in support of CVE-2016-2858
-
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
----
- backends/rng-egd.c   | 25 +------------------------
- backends/rng.c       | 32 ++++++++++++++++++++++++++++++++
- include/sysemu/rng.h | 12 ++++++++++++
- 3 files changed, 45 insertions(+), 24 deletions(-)
-
-Index: qemu-2.5.0/backends/rng-egd.c
-===================================================================
---- qemu-2.5.0.orig/backends/rng-egd.c
-+++ qemu-2.5.0/backends/rng-egd.c
-@@ -57,12 +57,6 @@ static void rng_egd_request_entropy(RngB
-     s->parent.requests = g_slist_append(s->parent.requests, req);
- }
- 
--static void rng_egd_free_request(RngRequest *req)
--{
--    g_free(req->data);
--    g_free(req);
--}
--
- static int rng_egd_chr_can_read(void *opaque)
- {
-     RngEgd *s = RNG_EGD(opaque);
-@@ -92,28 +86,13 @@ static void rng_egd_chr_read(void *opaqu
-         size -= len;
- 
-         if (req->offset == req->size) {
--            s->parent.requests = g_slist_remove_link(s->parent.requests,
--                                                     s->parent.requests);
- 
-             req->receive_entropy(req->opaque, req->data, req->size);
--
--            rng_egd_free_request(req);
-+            rng_backend_finalize_request(&s->parent, req);
-         }
-     }
- }
- 
--static void rng_egd_free_requests(RngEgd *s)
--{
--    GSList *i;
--
--    for (i = s->parent.requests; i; i = i->next) {
--        rng_egd_free_request(i->data);
--    }
--
--    g_slist_free(s->parent.requests);
--    s->parent.requests = NULL;
--}
--
- static void rng_egd_opened(RngBackend *b, Error **errp)
- {
-     RngEgd *s = RNG_EGD(b);
-@@ -182,8 +161,6 @@ static void rng_egd_finalize(Object *obj
-     }
- 
-     g_free(s->chr_name);
--
--    rng_egd_free_requests(s);
- }
- 
- static void rng_egd_class_init(ObjectClass *klass, void *data)
-Index: qemu-2.5.0/backends/rng.c
-===================================================================
---- qemu-2.5.0.orig/backends/rng.c
-+++ qemu-2.5.0/backends/rng.c
-@@ -63,6 +63,30 @@ static void rng_backend_prop_set_opened(
-     s->opened = true;
- }
- 
-+static void rng_backend_free_request(RngRequest *req)
-+{
-+    g_free(req->data);
-+    g_free(req);
-+}
-+
-+static void rng_backend_free_requests(RngBackend *s)
-+{
-+    GSList *i;
-+
-+    for (i = s->requests; i; i = i->next) {
-+        rng_backend_free_request(i->data);
-+    }
-+
-+    g_slist_free(s->requests);
-+    s->requests = NULL;
-+}
-+
-+void rng_backend_finalize_request(RngBackend *s, RngRequest *req)
-+{
-+    s->requests = g_slist_remove(s->requests, req);
-+    rng_backend_free_request(req);
-+}
-+
- static void rng_backend_init(Object *obj)
- {
-     object_property_add_bool(obj, "opened",
-@@ -71,6 +95,13 @@ static void rng_backend_init(Object *obj
-                              NULL);
- }
- 
-+static void rng_backend_finalize(Object *obj)
-+{
-+    RngBackend *s = RNG_BACKEND(obj);
-+
-+    rng_backend_free_requests(s);
-+}
-+
- static void rng_backend_class_init(ObjectClass *oc, void *data)
- {
-     UserCreatableClass *ucc = USER_CREATABLE_CLASS(oc);
-@@ -83,6 +114,7 @@ static const TypeInfo rng_backend_info =
-     .parent = TYPE_OBJECT,
-     .instance_size = sizeof(RngBackend),
-     .instance_init = rng_backend_init,
-+    .instance_finalize = rng_backend_finalize,
-     .class_size = sizeof(RngBackendClass),
-     .class_init = rng_backend_class_init,
-     .abstract = true,
-Index: qemu-2.5.0/include/sysemu/rng.h
-===================================================================
---- qemu-2.5.0.orig/include/sysemu/rng.h
-+++ qemu-2.5.0/include/sysemu/rng.h
-@@ -61,6 +61,7 @@ struct RngBackend
-     GSList *requests;
- };
- 
-+
- /**
-  * rng_backend_request_entropy:
-  * @s: the backend to request entropy from
diff --git a/meta/recipes-devtools/qemu/qemu/rng_remove_the_unused_request_cancellation_code.patch b/meta/recipes-devtools/qemu/qemu/rng_remove_the_unused_request_cancellation_code.patch
deleted file mode 100644
index 51296bc..0000000
--- a/meta/recipes-devtools/qemu/qemu/rng_remove_the_unused_request_cancellation_code.patch
+++ /dev/null
@@ -1,101 +0,0 @@
-From 3c52ddcdc548e7fbe65112d8a7bdc9cd105b4750 Mon Sep 17 00:00:00 2001
-From: Ladi Prosek <lprosek@redhat.com>
-Date: Thu, 3 Mar 2016 09:37:15 +0100
-Subject: [PATCH] rng: remove the unused request cancellation code
-
-rng_backend_cancel_requests had no callers and none of the code
-deleted in this commit ever ran.
-
-Signed-off-by: Ladi Prosek <lprosek@redhat.com>
-Reviewed-by: Amit Shah <amit.shah@redhat.com>
-Message-Id: <1456994238-9585-2-git-send-email-lprosek@redhat.com>
-Signed-off-by: Amit Shah <amit.shah@redhat.com>
-
-Upstream-Status: Backport
-in support of CVE-2016-2858
-
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
----
- backends/rng-egd.c   | 12 ------------
- backends/rng.c       |  9 ---------
- include/sysemu/rng.h | 11 -----------
- 3 files changed, 32 deletions(-)
-
-Index: qemu-2.5.0/backends/rng-egd.c
-===================================================================
---- qemu-2.5.0.orig/backends/rng-egd.c
-+++ qemu-2.5.0/backends/rng-egd.c
-@@ -114,17 +114,6 @@ static void rng_egd_free_requests(RngEgd
-     s->parent.requests = NULL;
- }
- 
--static void rng_egd_cancel_requests(RngBackend *b)
--{
--    RngEgd *s = RNG_EGD(b);
--
--    /* We simply delete the list of pending requests.  If there is data in the 
--     * queue waiting to be read, this is okay, because there will always be
--     * more data than we requested originally
--     */
--    rng_egd_free_requests(s);
--}
--
- static void rng_egd_opened(RngBackend *b, Error **errp)
- {
-     RngEgd *s = RNG_EGD(b);
-@@ -202,7 +191,6 @@ static void rng_egd_class_init(ObjectCla
-     RngBackendClass *rbc = RNG_BACKEND_CLASS(klass);
- 
-     rbc->request_entropy = rng_egd_request_entropy;
--    rbc->cancel_requests = rng_egd_cancel_requests;
-     rbc->opened = rng_egd_opened;
- }
- 
-Index: qemu-2.5.0/backends/rng.c
-===================================================================
---- qemu-2.5.0.orig/backends/rng.c
-+++ qemu-2.5.0/backends/rng.c
-@@ -25,15 +25,6 @@ void rng_backend_request_entropy(RngBack
-     }
- }
- 
--void rng_backend_cancel_requests(RngBackend *s)
--{
--    RngBackendClass *k = RNG_BACKEND_GET_CLASS(s);
--
--    if (k->cancel_requests) {
--        k->cancel_requests(s);
--    }
--}
--
- static bool rng_backend_prop_get_opened(Object *obj, Error **errp)
- {
-     RngBackend *s = RNG_BACKEND(obj);
-Index: qemu-2.5.0/include/sysemu/rng.h
-===================================================================
---- qemu-2.5.0.orig/include/sysemu/rng.h
-+++ qemu-2.5.0/include/sysemu/rng.h
-@@ -48,7 +48,6 @@ struct RngBackendClass
- 
-     void (*request_entropy)(RngBackend *s, size_t size,
-                             EntropyReceiveFunc *receive_entropy, void *opaque);
--    void (*cancel_requests)(RngBackend *s);
- 
-     void (*opened)(RngBackend *s, Error **errp);
- };
-@@ -80,14 +79,4 @@ struct RngBackend
- void rng_backend_request_entropy(RngBackend *s, size_t size,
-                                  EntropyReceiveFunc *receive_entropy,
-                                  void *opaque);
--
--/**
-- * rng_backend_cancel_requests:
-- * @s: the backend to cancel all pending requests in
-- *
-- * Cancels all pending requests submitted by @rng_backend_request_entropy.  This
-- * should be used by a device during reset or in preparation for live migration
-- * to stop tracking any request.
-- */
--void rng_backend_cancel_requests(RngBackend *s);
- #endif
diff --git a/meta/recipes-devtools/qemu/qemu_2.5.1.1.bb b/meta/recipes-devtools/qemu/qemu_2.6.0.bb
similarity index 62%
rename from meta/recipes-devtools/qemu/qemu_2.5.1.1.bb
rename to meta/recipes-devtools/qemu/qemu_2.6.0.bb
index ba2dfc6..e391326 100644
--- a/meta/recipes-devtools/qemu/qemu_2.5.1.1.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.6.0.bb
@@ -7,16 +7,11 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://qemu-enlarge-env-entry-size.patch \
             file://Qemu-Arm-versatilepb-Add-memory-size-checking.patch \
             file://no-valgrind.patch \
-            file://CVE-2016-2198.patch \
             file://pathlimit.patch \
-            file://rng_move_request_from_RngEgd_to_RngBackend.patch \
-            file://rng_remove_the_unused_request_cancellation_code.patch \
-            file://rng_move_request_queue_cleanup_from_RngEgd_to_RngBackend.patch \
-            file://CVE-2016-2858.patch \
            "
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
-SRC_URI[md5sum] = "f5ff0e71398b9e428b4f177001ba4285"
-SRC_URI[sha256sum] = "28d9946e43765a44ccccca3cba5f4f9034f2759ec1f2ce16594ddb6776c8efe6"
+SRC_URI[md5sum] = "ca3f70b43f093e33e9e014f144067f13"
+SRC_URI[sha256sum] = "c9ac4a651b273233d21b8bec32e30507cb9cce7900841febc330956a1a8434ec"
 
 COMPATIBLE_HOST_class-target_mips64 = "null"
 
-- 
2.8.2


