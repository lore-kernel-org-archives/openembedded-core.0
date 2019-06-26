Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
	[209.85.210.173])
	by mail.openembedded.org (Postfix) with ESMTP id C9F037E555
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 16:53:34 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id r1so1647701pfq.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 09:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version:in-reply-to:references
	:content-transfer-encoding;
	bh=9NMocb97CY06MipGUoBJLGjJCN4z2W7JmDOk73ueCPI=;
	b=s66pSGI6nKwYZZvKseh93kK2VZzUD+6QTOVcG67q/hNFBpbTEe9wnYqrZ7RDo3rVQx
	QZHaprBHQx0D7RRx+lYimi9Xrw5kzbragus7nso7zOwhbBpXGVmEmhaL36hL6xdWiAr9
	Z3HW8aTf3kzsGmZfq2UIl7MkDnJKoOOsSREseKmm7DVPpuDkOnQnP+DL2DNc9MJYGQjy
	/053Lr47wtT+V0z1d0bSFEWGMVOx/wgGS7Fllb9rux+Rr31Gfc2J8TLThxVDrPGBq5x/
	ZBHKZ3JHU/M5/15m1hzSv8aUJ3BazS/L3vDZ/Skcc7S2j8kTSzsPOFwdAGvGAPAP9BLs
	8a5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:in-reply-to:references:content-transfer-encoding;
	bh=9NMocb97CY06MipGUoBJLGjJCN4z2W7JmDOk73ueCPI=;
	b=fGu/JwIdxfeONlX5GQDWvCPfItUJ610ZHwJODLUcZ3afI0UycHa2wPhoxqdpxdwMTr
	8IFc0hxGBpo+9lF/zXD5f+iF7S9phleKcbq6Hyy27B06ptaoq3rtLGKmiqrsDM+swDG7
	4YrTaEQ+Xd+7UK80yG/ELNzWXbiZIIh6GFLN4QS7V0FWTp360gkt16W+XbUV7MfbF2gA
	fDTqPVrTExGAyZp9qu6IFU0xjX/A49l5a/5mZ12fQpe1Sf9VZiq2sBi8wkO1Ichs9HxD
	iZbTdwiGTGlKOxwLgi0raX3Cgini8rba7U8LKi9UhkiFHi7fxm2gNRcXhKugRGAWbOo1
	DsqA==
X-Gm-Message-State: APjAAAUeP3irul5tBpd3c13VpIIKVAn61JYduboV3A3TaRVxHDIYpAe4
	H+UmrYrlN28ogko3vrI+3PKJRm5nl9w=
X-Google-Smtp-Source: APXvYqzZkixS7CAQp/ezrLa+zQXMSjRYLeAKHaJob0ykgJq4n6WZT22lxAssOlPeM64eo1zzoLYc5g==
X-Received: by 2002:a17:90a:9905:: with SMTP id b5mr64831pjp.70.1561568015357; 
	Wed, 26 Jun 2019 09:53:35 -0700 (PDT)
Received: from localhost.localdomain ([45.19.219.178])
	by smtp.gmail.com with ESMTPSA id
	t11sm15339687pgp.1.2019.06.26.09.53.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 26 Jun 2019 09:53:34 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Jun 2019 09:53:04 -0700
Message-Id: <e3dfe53a334cd952cc2194fd3baad6d082659b7e.1561566521.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
In-Reply-To: <cover.1561566521.git.akuster808@gmail.com>
References: <cover.1561566521.git.akuster808@gmail.com>
Subject: [thud][ 03/25] qemu: Several CVE fixes
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
X-List-Received-Date: Wed, 26 Jun 2019 16:53:35 -0000
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster@mvista.com>

Source: qemu.org
MR: 97258, 97342, 97438, 97443
Type: Security Fix
Disposition: Backport from git.qemu.org/qemu.git
ChangeID: a5e9fd03ca5bebc880dcc3c4567e10a9ae47dba5
Description:

These issues affect qemu < 3.1.0

Fixes:
CVE-2018-16867
CVE-2018-16872
CVE-2018-18849
CVE-2018-19364

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../qemu/qemu/CVE-2018-16867.patch                 |  49 +++++++++
 .../qemu/qemu/CVE-2018-16872.patch                 |  89 ++++++++++++++++
 .../qemu/qemu/CVE-2018-18849.patch                 |  86 +++++++++++++++
 .../qemu/qemu/CVE-2018-19364_p1.patch              |  51 +++++++++
 .../qemu/qemu/CVE-2018-19364_p2.patch              | 115 +++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_3.0.0.bb           |   5 +
 6 files changed, 395 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2018-16867.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2018-16872.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2018-18849.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2018-19364_p1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2018-19364_p2.patch

diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2018-16867.patch b/meta/recipes-devtools/qemu/qemu/CVE-2018-16867.patch
new file mode 100644
index 0000000..644459e
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2018-16867.patch
@@ -0,0 +1,49 @@
+From 61f87388af0af72ad61dee00ddd267b8047049f2 Mon Sep 17 00:00:00 2001
+From: Gerd Hoffmann <kraxel@redhat.com>
+Date: Mon, 3 Dec 2018 11:10:45 +0100
+Subject: [PATCH] usb-mtp: outlaw slashes in filenames
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Slash is unix directory separator, so they are not allowed in filenames.
+Note this also stops the classic escape via "../".
+
+Fixes: CVE-2018-16867
+Reported-by: Michael Hanselmann <public@hansmi.ch>
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
+Message-id: 20181203101045.27976-3-kraxel@redhat.com
+(cherry picked from commit c52d46e041b42bb1ee6f692e00a0abe37a9659f6)
+Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
+
+Upstream-Status: Backport
+CVE: CVE-2018-16867
+Affects: < 3.1.0
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ hw/usb/dev-mtp.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/hw/usb/dev-mtp.c b/hw/usb/dev-mtp.c
+index 1ded7ac..899c8a3 100644
+--- a/hw/usb/dev-mtp.c
++++ b/hw/usb/dev-mtp.c
+@@ -1667,6 +1667,12 @@ static void usb_mtp_write_metadata(MTPState *s)
+ 
+     utf16_to_str(dataset->length, dataset->filename, filename);
+ 
++    if (strchr(filename, '/')) {
++        usb_mtp_queue_result(s, RES_PARAMETER_NOT_SUPPORTED, d->trans,
++                             0, 0, 0, 0);
++        return;
++    }
++
+     o = usb_mtp_object_lookup_name(p, filename, dataset->length);
+     if (o != NULL) {
+         next_handle = o->handle;
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2018-16872.patch b/meta/recipes-devtools/qemu/qemu/CVE-2018-16872.patch
new file mode 100644
index 0000000..9f2c5d3
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2018-16872.patch
@@ -0,0 +1,89 @@
+From 7347a04da35ec6284ce83e8bcd72dc4177d17b10 Mon Sep 17 00:00:00 2001
+From: Gerd Hoffmann <kraxel@redhat.com>
+Date: Thu, 13 Dec 2018 13:25:11 +0100
+Subject: [PATCH] usb-mtp: use O_NOFOLLOW and O_CLOEXEC.
+
+Open files and directories with O_NOFOLLOW to avoid symlinks attacks.
+While being at it also add O_CLOEXEC.
+
+usb-mtp only handles regular files and directories and ignores
+everything else, so users should not see a difference.
+
+Because qemu ignores symlinks, carrying out a successful symlink attack
+requires swapping an existing file or directory below rootdir for a
+symlink and winning the race against the inotify notification to qemu.
+
+Fixes: CVE-2018-16872
+Cc: Prasad J Pandit <ppandit@redhat.com>
+Cc: Bandan Das <bsd@redhat.com>
+Reported-by: Michael Hanselmann <public@hansmi.ch>
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+Reviewed-by: Michael Hanselmann <public@hansmi.ch>
+Message-id: 20181213122511.13853-1-kraxel@redhat.com
+(cherry picked from commit bab9df35ce73d1c8e19a37e2737717ea1c984dc1)
+Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
+
+Upstream-Status: Backport
+CVE: CVE-2018-16872
+Affects: < 3.1.0
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ hw/usb/dev-mtp.c | 13 +++++++++----
+ 1 file changed, 9 insertions(+), 4 deletions(-)
+
+diff --git a/hw/usb/dev-mtp.c b/hw/usb/dev-mtp.c
+index 899c8a3..f4223fb 100644
+--- a/hw/usb/dev-mtp.c
++++ b/hw/usb/dev-mtp.c
+@@ -649,13 +649,18 @@ static void usb_mtp_object_readdir(MTPState *s, MTPObject *o)
+ {
+     struct dirent *entry;
+     DIR *dir;
++    int fd;
+ 
+     if (o->have_children) {
+         return;
+     }
+     o->have_children = true;
+ 
+-    dir = opendir(o->path);
++    fd = open(o->path, O_DIRECTORY | O_CLOEXEC | O_NOFOLLOW);
++    if (fd < 0) {
++        return;
++    }
++    dir = fdopendir(fd);
+     if (!dir) {
+         return;
+     }
+@@ -1003,7 +1008,7 @@ static MTPData *usb_mtp_get_object(MTPState *s, MTPControl *c,
+ 
+     trace_usb_mtp_op_get_object(s->dev.addr, o->handle, o->path);
+ 
+-    d->fd = open(o->path, O_RDONLY);
++    d->fd = open(o->path, O_RDONLY | O_CLOEXEC | O_NOFOLLOW);
+     if (d->fd == -1) {
+         usb_mtp_data_free(d);
+         return NULL;
+@@ -1027,7 +1032,7 @@ static MTPData *usb_mtp_get_partial_object(MTPState *s, MTPControl *c,
+                                         c->argv[1], c->argv[2]);
+ 
+     d = usb_mtp_data_alloc(c);
+-    d->fd = open(o->path, O_RDONLY);
++    d->fd = open(o->path, O_RDONLY | O_CLOEXEC | O_NOFOLLOW);
+     if (d->fd == -1) {
+         usb_mtp_data_free(d);
+         return NULL;
+@@ -1608,7 +1613,7 @@ static void usb_mtp_write_data(MTPState *s)
+                                  0, 0, 0, 0);
+             goto done;
+         }
+-        d->fd = open(path, O_CREAT | O_WRONLY, mask);
++        d->fd = open(path, O_CREAT | O_WRONLY | O_CLOEXEC | O_NOFOLLOW, mask);
+         if (d->fd == -1) {
+             usb_mtp_queue_result(s, RES_STORE_FULL, d->trans,
+                                  0, 0, 0, 0);
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2018-18849.patch b/meta/recipes-devtools/qemu/qemu/CVE-2018-18849.patch
new file mode 100644
index 0000000..b632512
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2018-18849.patch
@@ -0,0 +1,86 @@
+From bd6dd4eaa6f7fe0c4d797d4e59803d295313b7a7 Mon Sep 17 00:00:00 2001
+From: Prasad J Pandit <pjp@fedoraproject.org>
+Date: Sat, 27 Oct 2018 01:13:14 +0530
+Subject: [PATCH] lsi53c895a: check message length value is valid
+
+While writing a message in 'lsi_do_msgin', message length value
+in 'msg_len' could be invalid due to an invalid migration stream.
+Add an assertion to avoid an out of bounds access, and reject
+the incoming migration data if it contains an invalid message
+length.
+
+Discovered by Deja vu Security. Reported by Oracle.
+
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Message-Id: <20181026194314.18663-1-ppandit@redhat.com>
+Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
+(cherry picked from commit e58ccf039650065a9442de43c9816f81e88f27f6)
+*CVE-2018-18849
+*avoid context dep. on c921370b22c
+Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
+
+Upstream-Status: Backport
+Affects: < 3.1.0
+CVE: CVE-2018-18849
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ hw/scsi/lsi53c895a.c | 19 +++++++++++++++++--
+ 1 file changed, 17 insertions(+), 2 deletions(-)
+
+diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
+index 160657f..3758635 100644
+--- a/hw/scsi/lsi53c895a.c
++++ b/hw/scsi/lsi53c895a.c
+@@ -865,10 +865,11 @@ static void lsi_do_status(LSIState *s)
+ 
+ static void lsi_do_msgin(LSIState *s)
+ {
+-    int len;
++    uint8_t len;
+     DPRINTF("Message in len=%d/%d\n", s->dbc, s->msg_len);
+     s->sfbr = s->msg[0];
+     len = s->msg_len;
++    assert(len > 0 && len <= LSI_MAX_MSGIN_LEN);
+     if (len > s->dbc)
+         len = s->dbc;
+     pci_dma_write(PCI_DEVICE(s), s->dnad, s->msg, len);
+@@ -1703,8 +1704,10 @@ static uint8_t lsi_reg_readb(LSIState *s, int offset)
+         break;
+     case 0x58: /* SBDL */
+         /* Some drivers peek at the data bus during the MSG IN phase.  */
+-        if ((s->sstat1 & PHASE_MASK) == PHASE_MI)
++        if ((s->sstat1 & PHASE_MASK) == PHASE_MI) {
++            assert(s->msg_len > 0);
+             return s->msg[0];
++        }
+         ret = 0;
+         break;
+     case 0x59: /* SBDL high */
+@@ -2096,11 +2099,23 @@ static int lsi_pre_save(void *opaque)
+     return 0;
+ }
+ 
++static int lsi_post_load(void *opaque, int version_id)
++{
++    LSIState *s = opaque;
++
++    if (s->msg_len < 0 || s->msg_len > LSI_MAX_MSGIN_LEN) {
++        return -EINVAL;
++    }
++
++    return 0;
++}
++
+ static const VMStateDescription vmstate_lsi_scsi = {
+     .name = "lsiscsi",
+     .version_id = 0,
+     .minimum_version_id = 0,
+     .pre_save = lsi_pre_save,
++    .post_load = lsi_post_load,
+     .fields = (VMStateField[]) {
+         VMSTATE_PCI_DEVICE(parent_obj, LSIState),
+ 
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2018-19364_p1.patch b/meta/recipes-devtools/qemu/qemu/CVE-2018-19364_p1.patch
new file mode 100644
index 0000000..1d77af4
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2018-19364_p1.patch
@@ -0,0 +1,51 @@
+From 5b76ef50f62079a2389ba28cacaf6cce68b1a0ed Mon Sep 17 00:00:00 2001
+From: Greg Kurz <groug@kaod.org>
+Date: Wed, 7 Nov 2018 01:00:04 +0100
+Subject: [PATCH] 9p: write lock path in v9fs_co_open2()
+
+The assumption that the fid cannot be used by any other operation is
+wrong. At least, nothing prevents a misbehaving client to create a
+file with a given fid, and to pass this fid to some other operation
+at the same time (ie, without waiting for the response to the creation
+request). The call to v9fs_path_copy() performed by the worker thread
+after the file was created can race with any access to the fid path
+performed by some other thread. This causes use-after-free issues that
+can be detected by ASAN with a custom 9p client.
+
+Unlike other operations that only read the fid path, v9fs_co_open2()
+does modify it. It should hence take the write lock.
+
+Cc: P J P <ppandit@redhat.com>
+Reported-by: zhibin hu <noirfate@gmail.com>
+Signed-off-by: Greg Kurz <groug@kaod.org>
+
+Upstream-status: Backport
+Affects: < 3.1.0
+CVE:  CVE-2018-19364 patch #1
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ hw/9pfs/cofile.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/hw/9pfs/cofile.c b/hw/9pfs/cofile.c
+index 88791bc..9c22837 100644
+--- a/hw/9pfs/cofile.c
++++ b/hw/9pfs/cofile.c
+@@ -140,10 +140,10 @@ int coroutine_fn v9fs_co_open2(V9fsPDU *pdu, V9fsFidState *fidp,
+     cred.fc_gid = gid;
+     /*
+      * Hold the directory fid lock so that directory path name
+-     * don't change. Read lock is fine because this fid cannot
+-     * be used by any other operation.
++     * don't change. Take the write lock to be sure this fid
++     * cannot be used by another operation.
+      */
+-    v9fs_path_read_lock(s);
++    v9fs_path_write_lock(s);
+     v9fs_co_run_in_worker(
+         {
+             err = s->ops->open2(&s->ctx, &fidp->path,
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2018-19364_p2.patch b/meta/recipes-devtools/qemu/qemu/CVE-2018-19364_p2.patch
new file mode 100644
index 0000000..b8d094c
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2018-19364_p2.patch
@@ -0,0 +1,115 @@
+From 5b3c77aa581ebb215125c84b0742119483571e55 Mon Sep 17 00:00:00 2001
+From: Greg Kurz <groug@kaod.org>
+Date: Tue, 20 Nov 2018 13:00:35 +0100
+Subject: [PATCH] 9p: take write lock on fid path updates (CVE-2018-19364)
+
+Recent commit 5b76ef50f62079a fixed a race where v9fs_co_open2() could
+possibly overwrite a fid path with v9fs_path_copy() while it is being
+accessed by some other thread, ie, use-after-free that can be detected
+by ASAN with a custom 9p client.
+
+It turns out that the same can happen at several locations where
+v9fs_path_copy() is used to set the fid path. The fix is again to
+take the write lock.
+
+Fixes CVE-2018-19364.
+
+Cc: P J P <ppandit@redhat.com>
+Reported-by: zhibin hu <noirfate@gmail.com>
+Reviewed-by: Prasad J Pandit <pjp@fedoraproject.org>
+Signed-off-by: Greg Kurz <groug@kaod.org>
+
+Upstream-status: Backport
+Affects: < 3.1.0
+CVE:  CVE-2018-19364 patch #2
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ hw/9pfs/9p.c | 15 +++++++++++++++
+ 1 file changed, 15 insertions(+)
+
+diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
+index eef289e..267a255 100644
+--- a/hw/9pfs/9p.c
++++ b/hw/9pfs/9p.c
+@@ -1391,7 +1391,9 @@ static void coroutine_fn v9fs_walk(void *opaque)
+             err = -EINVAL;
+             goto out;
+         }
++        v9fs_path_write_lock(s);
+         v9fs_path_copy(&fidp->path, &path);
++        v9fs_path_unlock(s);
+     } else {
+         newfidp = alloc_fid(s, newfid);
+         if (newfidp == NULL) {
+@@ -2160,6 +2162,7 @@ static void coroutine_fn v9fs_create(void *opaque)
+     V9fsString extension;
+     int iounit;
+     V9fsPDU *pdu = opaque;
++    V9fsState *s = pdu->s;
+ 
+     v9fs_path_init(&path);
+     v9fs_string_init(&name);
+@@ -2200,7 +2203,9 @@ static void coroutine_fn v9fs_create(void *opaque)
+         if (err < 0) {
+             goto out;
+         }
++        v9fs_path_write_lock(s);
+         v9fs_path_copy(&fidp->path, &path);
++        v9fs_path_unlock(s);
+         err = v9fs_co_opendir(pdu, fidp);
+         if (err < 0) {
+             goto out;
+@@ -2216,7 +2221,9 @@ static void coroutine_fn v9fs_create(void *opaque)
+         if (err < 0) {
+             goto out;
+         }
++        v9fs_path_write_lock(s);
+         v9fs_path_copy(&fidp->path, &path);
++        v9fs_path_unlock(s);
+     } else if (perm & P9_STAT_MODE_LINK) {
+         int32_t ofid = atoi(extension.data);
+         V9fsFidState *ofidp = get_fid(pdu, ofid);
+@@ -2234,7 +2241,9 @@ static void coroutine_fn v9fs_create(void *opaque)
+             fidp->fid_type = P9_FID_NONE;
+             goto out;
+         }
++        v9fs_path_write_lock(s);
+         v9fs_path_copy(&fidp->path, &path);
++        v9fs_path_unlock(s);
+         err = v9fs_co_lstat(pdu, &fidp->path, &stbuf);
+         if (err < 0) {
+             fidp->fid_type = P9_FID_NONE;
+@@ -2272,7 +2281,9 @@ static void coroutine_fn v9fs_create(void *opaque)
+         if (err < 0) {
+             goto out;
+         }
++        v9fs_path_write_lock(s);
+         v9fs_path_copy(&fidp->path, &path);
++        v9fs_path_unlock(s);
+     } else if (perm & P9_STAT_MODE_NAMED_PIPE) {
+         err = v9fs_co_mknod(pdu, fidp, &name, fidp->uid, -1,
+                             0, S_IFIFO | (perm & 0777), &stbuf);
+@@ -2283,7 +2294,9 @@ static void coroutine_fn v9fs_create(void *opaque)
+         if (err < 0) {
+             goto out;
+         }
++        v9fs_path_write_lock(s);
+         v9fs_path_copy(&fidp->path, &path);
++        v9fs_path_unlock(s);
+     } else if (perm & P9_STAT_MODE_SOCKET) {
+         err = v9fs_co_mknod(pdu, fidp, &name, fidp->uid, -1,
+                             0, S_IFSOCK | (perm & 0777), &stbuf);
+@@ -2294,7 +2307,9 @@ static void coroutine_fn v9fs_create(void *opaque)
+         if (err < 0) {
+             goto out;
+         }
++        v9fs_path_write_lock(s);
+         v9fs_path_copy(&fidp->path, &path);
++        v9fs_path_unlock(s);
+     } else {
+         err = v9fs_co_open2(pdu, fidp, &name, -1,
+                             omode_to_uflags(mode)|O_CREAT, perm, &stbuf);
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/qemu/qemu_3.0.0.bb b/meta/recipes-devtools/qemu/qemu_3.0.0.bb
index 776548b..59cfc38 100644
--- a/meta/recipes-devtools/qemu/qemu_3.0.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_3.0.0.bb
@@ -25,6 +25,11 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2018-17958.patch \
            file://CVE-2018-17962.patch \
            file://CVE-2018-17963.patch \
+           file://CVE-2018-16867.patch \
+           file://CVE-2018-16872.patch \
+           file://CVE-2018-18849.patch \
+           file://CVE-2018-19364_p1.patch \
+           file://CVE-2018-19364_p2.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.7.4


