Return-Path: <patrick.ohly@intel.com>
Received: from mail-wr0-f171.google.com (mail-wr0-f171.google.com
	[209.85.128.171])
	by mail.openembedded.org (Postfix) with ESMTP id 4689378704
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Dec 2017 09:37:00 +0000 (UTC)
Received: by mail-wr0-f171.google.com with SMTP id y21so3170437wrc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Dec 2017 01:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version:in-reply-to
	:references:content-transfer-encoding;
	bh=nBy9V7laPmzBzdOvxRZ9VXlfK578ZHh2VYQ9mv0bawE=;
	b=nzw7BWS+LWB6tDZIQWmM3AKqteqrXU6XswXtfwqGucr/+vebf7wJ6JzS1dXwuI4Zse
	5o8+ALmpmlmmWnmN16UQzAQ18MKoLAZJUI+rmazCl+YL6baoJ4RgFATy7ARtAFUug6mf
	f8O+NcQnj1RSfFxBMHHaiWt4k/vfVjnZqRoH+2i2ZlvWwYuRzqjeDN64TjMU9aEJRhOm
	cPvd9yS6Z0BVKp7rBhGZzBpk8gZBxb9MNH7vYRJaJ4aJB8FspzsV1QT/xGbzyfr0h66b
	L+iYkLVsAvWqlki6AIQ/C5Bh6tzfQWzG6W4rmorwPHuIBl5MH1807wB2gBKx2K29CCl9
	K2Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:in-reply-to:references:content-transfer-encoding;
	bh=nBy9V7laPmzBzdOvxRZ9VXlfK578ZHh2VYQ9mv0bawE=;
	b=RtRmppMs6q8UUWipHY176fjMYB4B3AIUCyIqxNsQ5cDrdIAzFhO44eiDgBpSEU1aGV
	M6h6Kmdgcp5Ssy0w1uWSHEquqjUq8R5UKA+h4m9SUxP5zejU3qJeJ3bwwMhQ7Arg/cZX
	7pmbUwufLkiLc38hscJdlMAh1i8OInx20uBgbYZIQ25Zal8BXZUh59XhY38t+F4N8O0X
	EplGoT6nTQtg8VETuyPo7U3KypH/xR5+DE43O2F9KTQcYxtv5epZ1hftiJuy1Sfuqetd
	/OuQKWhv+kjd1KUPYaCB0XM4kLrpVFlqp3wsMIhX4gIVB91ULw/shQ6s4302I2B7fRze
	+RQw==
X-Gm-Message-State: AJaThX7AwYRgrOPtBDXY9wrSJYzRJEDHJ6zMR0iwKpjpNAbmZMG7uWmF
	/pjk/1n45nnSm1PI0piIJcNL9Ck=
X-Google-Smtp-Source: AGs4zMbk3Ujm7TCqmrLPcFlpRmsqHMjIog+GXWU0GlMJH8UMNN33cLklPC3PUbWEynuArZcQ4pdMWw==
X-Received: by 10.223.149.6 with SMTP id 6mr18148370wrs.112.1512553019356;
	Wed, 06 Dec 2017 01:36:59 -0800 (PST)
Received: from pohly-desktop.fritz.box (p54BD5190.dip0.t-ipconnect.de.
	[84.189.81.144])
	by smtp.gmail.com with ESMTPSA id a5sm2364260wra.87.2017.12.06.01.36.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Dec 2017 01:36:58 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Dec 2017 10:36:47 +0100
Message-Id: <cd657b6f0fe9b29352de576818c17500a68daf87.1512552961.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
In-Reply-To: <cover.4ddd15858ebb94110d175c9765f74daa1d0d74a8.1512552961.git-series.patrick.ohly@intel.com>
References: <cover.4ddd15858ebb94110d175c9765f74daa1d0d74a8.1512552961.git-series.patrick.ohly@intel.com>
Subject: [PATCH 1/1] qemu: use upstream swtpm support
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
X-List-Received-Date: Wed, 06 Dec 2017 09:37:02 -0000
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

Upstream finally accepted and merged a different approach for
connecting QEMU to swtpm: instead of a custom cuse-tpm device, a
normal chardev connects to swtpm, and that chardev then is used by the
TPM device. For now we have to backport those patches, but the next
major QEMU update will have them.

However, the chardev-connect-socket-to-a-spawned-command.patch is
something that OE will have to carry permanently. It simplifies
starting and stopping swtpm when invoking QEMU through runqemu without
having to teach that script about the additional process. Upstream
rejected the patch because they want to keep the complexity of
starting additional processes out of QEMU.

A recent enough swtpm is needed. The one currently used by
meta-security fails to communicate properly with QEMU, leading to this
failure:

  qemu-system-x86_64: -tpmdev emulator,id=tpm0,chardev=chrtpm0: tpm-emulator: Failed to send CMD_SET_DATAFD: Input/output error
  qemu-system-x86_64: -tpmdev emulator,id=tpm0,chardev=chrtpm0: tpm-emulator: Could not cleanly shutdown the TPM: Invalid argument

With a recent enough swtpm, one can create a TPM device like this:

  - bitbake swtpm-native
  - create a TPM instance and initialize it with:

       $ mkdir -p my-machine/myvtpm0
       $ tmp*/work/*/swtpm-wrappers-native/*/swtpm_setup_oe.sh --tpm-state my-machine/myvtpm0 --createek
       Starting vTPM manufacturing as root:root @ Wed 06 Dec 2017 10:03:14 AM CET
       TPM is listening on TCP port 34613.
       Successfully created EK.
       Successfully authored TPM state.
       Ending vTPM manufacturing @ Wed 06 Dec 2017 10:03:14 AM CET

  - runqemu "qemuparams=-chardev 'socket,id=chrtpm0,cmd=exec
    swtpm_oe.sh socket --terminate --ctrl type=unixio,,clientfd=0
    --tpmstate dir=... --log level=10,,file=.../swtpm.log --tpm2'
    -tpmdev emulator,id=tpm0,chardev=chrtpm0 -device
    tpm-tis,tpmdev=tpm0" ...

Beware that the double commas are intentional. They are needed to
embed commas in the "cmd" value.

swtpm_oe.sh is from swtpm-wrappers-native. In the example it is
invoked without the full path for the sake of brevity. In practice,
one has to use the full
path (tmp*/work/*/swtpm-wrappers-native/*/swtpm_oe.sh).

With the TPM2-preview version of swtpm, the same works for TPM2 by
adding the --tpm2 parameter when invoking swtpm_setup_oe.sh and
swtpm_oe.sh.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/recipes-devtools/qemu/qemu/0001-Provide-support-for-the-CUSE-TPM.patch                     |  870 +-----------------------------------------------------------
 meta/recipes-devtools/qemu/qemu/0001-tpm-Clean-up-driver-registration-lookup.patch              |  154 ++++++++++-
 meta/recipes-devtools/qemu/qemu/0002-Introduce-condition-to-notify-waiters-of-completed-c.patch |   86 +------
 meta/recipes-devtools/qemu/qemu/0002-tpm-Clean-up-model-registration-lookup.patch               |  121 ++++++++-
 meta/recipes-devtools/qemu/qemu/0003-Introduce-condition-in-TPM-backend-for-notification.patch  |   79 +-----
 meta/recipes-devtools/qemu/qemu/0003-tpm-backend-Remove-unneeded-member-variable-from-bac.patch |   75 +++++-
 meta/recipes-devtools/qemu/qemu/0004-Add-support-for-VM-suspend-resume-for-TPM-TIS-v2.9.patch   |  719 +-------------------------------------------------
 meta/recipes-devtools/qemu/qemu/0004-tpm-backend-Move-thread-handling-inside-TPMBackend.patch   |  417 ++++++++++++++++++++++++++++-
 meta/recipes-devtools/qemu/qemu/0005-tpm-backend-Initialize-and-free-data-members-in-it-s.patch |  185 +++++++++++++-
 meta/recipes-devtools/qemu/qemu/0006-tpm-backend-Made-few-interface-methods-optional.patch      |  284 +++++++++++++++++++-
 meta/recipes-devtools/qemu/qemu/0007-tpm-backend-Add-new-api-to-read-backend-TpmInfo.patch      |  293 ++++++++++++++++++++-
 meta/recipes-devtools/qemu/qemu/0008-tpm-backend-Move-realloc_buffer-implementation-to-tp.patch |  140 ++++++++++-
 meta/recipes-devtools/qemu/qemu/0009-tpm-passthrough-move-reusable-code-to-utils.patch          |  182 ++++++++++++-
 meta/recipes-devtools/qemu/qemu/0010-tpm-Added-support-for-TPM-emulator.patch                   | 1059 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 meta/recipes-devtools/qemu/qemu/0011-tpm-Move-tpm_cleanup-to-right-place.patch                  |   43 +++-
 meta/recipes-devtools/qemu/qemu/0012-tpm-Use-EMSGSIZE-instead-of-EBADMSG-to-compile-on-Op.patch |   67 +++++-
 meta/recipes-devtools/qemu/qemu/chardev-connect-socket-to-a-spawned-command.patch               |  227 +++++++++++++++-
 meta/recipes-devtools/qemu/qemu_2.10.0.bb                                                       |   17 +-
 18 files changed, 3260 insertions(+), 1758 deletions(-)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-Provide-support-for-the-CUSE-TPM.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-tpm-Clean-up-driver-registration-lookup.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0002-Introduce-condition-to-notify-waiters-of-completed-c.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0002-tpm-Clean-up-model-registration-lookup.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0003-Introduce-condition-in-TPM-backend-for-notification.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0003-tpm-backend-Remove-unneeded-member-variable-from-bac.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0004-Add-support-for-VM-suspend-resume-for-TPM-TIS-v2.9.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0004-tpm-backend-Move-thread-handling-inside-TPMBackend.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0005-tpm-backend-Initialize-and-free-data-members-in-it-s.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0006-tpm-backend-Made-few-interface-methods-optional.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0007-tpm-backend-Add-new-api-to-read-backend-TpmInfo.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0008-tpm-backend-Move-realloc_buffer-implementation-to-tp.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0009-tpm-passthrough-move-reusable-code-to-utils.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0010-tpm-Added-support-for-TPM-emulator.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0011-tpm-Move-tpm_cleanup-to-right-place.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0012-tpm-Use-EMSGSIZE-instead-of-EBADMSG-to-compile-on-Op.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/chardev-connect-socket-to-a-spawned-command.patch

diff --git a/meta/recipes-devtools/qemu/qemu/0001-Provide-support-for-the-CUSE-TPM.patch b/meta/recipes-devtools/qemu/qemu/0001-Provide-support-for-the-CUSE-TPM.patch
deleted file mode 100644
index 74dc6f5..0000000
--- a/meta/recipes-devtools/qemu/qemu/0001-Provide-support-for-the-CUSE-TPM.patch
+++ /dev/null
@@ -1,870 +0,0 @@
-From 8737eef18f39ed087fd911d0a0886e8174d0468c Mon Sep 17 00:00:00 2001
-From: Stefan Berger <stefanb@linux.vnet.ibm.com>
-Date: Sat, 31 Dec 2016 11:23:32 -0500
-Subject: [PATCH 1/4] Provide support for the CUSE TPM
-
-Rather than integrating TPM functionality into QEMU directly
-using the TPM emulation of libtpms, we now integrate an external
-emulated TPM device. This device is expected to implement a Linux
-CUSE interface (CUSE = character device in userspace).
-
-QEMU talks to the CUSE TPM using much functionality of the
-passthrough driver. For example, the TPM commands and responses
-are sent to the CUSE TPM using the read()/write() interface.
-However, some out-of-band control needs to be done using the CUSE
-TPM's ioctls. The CUSE TPM currently defines and implements 15
-different ioctls for controlling certain life-cycle aspects of
-the emulated TPM. The ioctls can be regarded as a replacement for
-direct function calls to a TPM emulator if the TPM were to be
-directly integrated into QEMU.
-
-One of the ioctls allows to get a bitmask of supported capabilities.
-Each returned bit indicates which capabilities have been implemented.
-An include file defining the various ioctls is added to QEMU.
-
-The CUSE TPM and associated tools can be found here:
-
-https://github.com/stefanberger/swtpm
-
-(please use the latest version)
-
-To use the external CUSE TPM, the CUSE TPM should be started as follows:
-
-/usr/bin/swtpm_ioctl -s /dev/vtpm-test
-
-/usr/bin/swtpm_cuse -n vtpm-test
-
-QEMU can then be started using the following parameters:
-
-qemu-system-x86_64 \
-	[...] \
-        -tpmdev cuse-tpm,id=tpm0,cancel-path=/dev/null,path=/dev/vtpm-test \
-        -device tpm-tis,id=tpm0,tpmdev=tpm0 \
-	[...]
-
-Signed-off-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
-Cc: Eric Blake <eblake@redhat.com>
-
-Conflicts:
-	docs/qmp-commands.txt
-
-Patch cherry-picked from https://github.com/stefanberger/qemu-tpm, branch v2.8.0+tpm,
-commit 27d6cd856d5a14061955df7a93ee490697a7a174. Applied cleanly except for
-docs/qmp-commands.txt which did not exist yet in qemu 2.7.
-
-Upstream-Status: Pending [https://lists.nongnu.org/archive/html/qemu-devel/2016-06/msg00252.html]
-Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
----
- hmp.c                    |   6 ++
- hw/tpm/tpm_int.h         |   1 +
- hw/tpm/tpm_ioctl.h       | 215 +++++++++++++++++++++++++++++++++++++
- hw/tpm/tpm_passthrough.c | 274 +++++++++++++++++++++++++++++++++++++++++++++--
- qapi-schema.json         |  18 +++-
- qemu-options.hx          |  21 +++-
- tpm.c                    |  11 +-
- 7 files changed, 529 insertions(+), 17 deletions(-)
- create mode 100644 hw/tpm/tpm_ioctl.h
-
-diff --git a/hmp.c b/hmp.c
-index cc2056e9e2..277b45ef5a 100644
---- a/hmp.c
-+++ b/hmp.c
-@@ -883,6 +883,12 @@ void hmp_info_tpm(Monitor *mon, const QDict *qdict)
-                            tpo->has_cancel_path ? ",cancel-path=" : "",
-                            tpo->has_cancel_path ? tpo->cancel_path : "");
-             break;
-+        case TPM_TYPE_OPTIONS_KIND_CUSE_TPM:
-+            tpo = ti->options->u.passthrough.data;
-+            monitor_printf(mon, "%s%s",
-+                           tpo->has_path ? ",path=" : "",
-+                           tpo->has_path ? tpo->path : "");
-+            break;
-         case TPM_TYPE_OPTIONS_KIND__MAX:
-             break;
-         }
-diff --git a/hw/tpm/tpm_int.h b/hw/tpm/tpm_int.h
-index f2f285b3cc..6b2c9c953a 100644
---- a/hw/tpm/tpm_int.h
-+++ b/hw/tpm/tpm_int.h
-@@ -61,6 +61,7 @@ struct tpm_resp_hdr {
- #define TPM_TAG_RSP_AUTH1_COMMAND 0xc5
- #define TPM_TAG_RSP_AUTH2_COMMAND 0xc6
- 
-+#define TPM_SUCCESS               0
- #define TPM_FAIL                  9
- 
- #define TPM_ORD_ContinueSelfTest  0x53
-diff --git a/hw/tpm/tpm_ioctl.h b/hw/tpm/tpm_ioctl.h
-new file mode 100644
-index 0000000000..a341e15741
---- /dev/null
-+++ b/hw/tpm/tpm_ioctl.h
-@@ -0,0 +1,215 @@
-+/*
-+ * tpm_ioctl.h
-+ *
-+ * (c) Copyright IBM Corporation 2014, 2015.
-+ *
-+ * This file is licensed under the terms of the 3-clause BSD license
-+ */
-+#ifndef _TPM_IOCTL_H_
-+#define _TPM_IOCTL_H_
-+
-+#include <stdint.h>
-+#include <sys/uio.h>
-+#include <sys/types.h>
-+#include <sys/ioctl.h>
-+
-+/*
-+ * Every response from a command involving a TPM command execution must hold
-+ * the ptm_res as the first element.
-+ * ptm_res corresponds to the error code of a command executed by the TPM.
-+ */
-+
-+typedef uint32_t ptm_res;
-+
-+/* PTM_GET_TPMESTABLISHED: get the establishment bit */
-+struct ptm_est {
-+    union {
-+        struct {
-+            ptm_res tpm_result;
-+            unsigned char bit; /* TPM established bit */
-+        } resp; /* response */
-+    } u;
-+};
-+
-+/* PTM_RESET_TPMESTABLISHED: reset establishment bit */
-+struct ptm_reset_est {
-+    union {
-+        struct {
-+            uint8_t loc; /* locality to use */
-+        } req; /* request */
-+        struct {
-+            ptm_res tpm_result;
-+        } resp; /* response */
-+    } u;
-+};
-+
-+/* PTM_INIT */
-+struct ptm_init {
-+    union {
-+        struct {
-+            uint32_t init_flags; /* see definitions below */
-+        } req; /* request */
-+        struct {
-+            ptm_res tpm_result;
-+        } resp; /* response */
-+    } u;
-+};
-+
-+/* above init_flags */
-+#define PTM_INIT_FLAG_DELETE_VOLATILE (1 << 0)
-+    /* delete volatile state file after reading it */
-+
-+/* PTM_SET_LOCALITY */
-+struct ptm_loc {
-+    union {
-+        struct {
-+            uint8_t loc; /* locality to set */
-+        } req; /* request */
-+        struct {
-+            ptm_res tpm_result;
-+        } resp; /* response */
-+    } u;
-+};
-+
-+/* PTM_HASH_DATA: hash given data */
-+struct ptm_hdata {
-+    union {
-+        struct {
-+            uint32_t length;
-+            uint8_t data[4096];
-+        } req; /* request */
-+        struct {
-+            ptm_res tpm_result;
-+        } resp; /* response */
-+    } u;
-+};
-+
-+/*
-+ * size of the TPM state blob to transfer; x86_64 can handle 8k,
-+ * ppc64le only ~7k; keep the response below a 4k page size
-+ */
-+#define PTM_STATE_BLOB_SIZE (3 * 1024)
-+
-+/*
-+ * The following is the data structure to get state blobs from the TPM.
-+ * If the size of the state blob exceeds the PTM_STATE_BLOB_SIZE, multiple reads
-+ * with this ioctl and with adjusted offset are necessary. All bytes
-+ * must be transferred and the transfer is done once the last byte has been
-+ * returned.
-+ * It is possible to use the read() interface for reading the data; however,
-+ * the first bytes of the state blob will be part of the response to the ioctl();
-+ * a subsequent read() is only necessary if the total length (totlength) exceeds
-+ * the number of received bytes. seek() is not supported.
-+ */
-+struct ptm_getstate {
-+    union {
-+        struct {
-+            uint32_t state_flags; /* may be: PTM_STATE_FLAG_DECRYPTED */
-+            uint32_t type;        /* which blob to pull */
-+            uint32_t offset;      /* offset from where to read */
-+        } req; /* request */
-+        struct {
-+            ptm_res tpm_result;
-+            uint32_t state_flags; /* may be: PTM_STATE_FLAG_ENCRYPTED */
-+            uint32_t totlength;   /* total length that will be transferred */
-+            uint32_t length;      /* number of bytes in following buffer */
-+            uint8_t  data[PTM_STATE_BLOB_SIZE];
-+        } resp; /* response */
-+    } u;
-+};
-+
-+/* TPM state blob types */
-+#define PTM_BLOB_TYPE_PERMANENT  1
-+#define PTM_BLOB_TYPE_VOLATILE   2
-+#define PTM_BLOB_TYPE_SAVESTATE  3
-+
-+/* state_flags above : */
-+#define PTM_STATE_FLAG_DECRYPTED     1 /* on input:  get decrypted state */
-+#define PTM_STATE_FLAG_ENCRYPTED     2 /* on output: state is encrypted */
-+
-+/*
-+ * The following is the data structure to set state blobs in the TPM.
-+ * If the size of the state blob exceeds the PTM_STATE_BLOB_SIZE, multiple
-+ * 'writes' using this ioctl are necessary. The last packet is indicated
-+ * by the length being smaller than the PTM_STATE_BLOB_SIZE.
-+ * The very first packet may have a length indicator of '0' enabling
-+ * a write() with all the bytes from a buffer. If the write() interface
-+ * is used, a final ioctl with a non-full buffer must be made to indicate
-+ * that all data were transferred (a write with 0 bytes would not work).
-+ */
-+struct ptm_setstate {
-+    union {
-+        struct {
-+            uint32_t state_flags; /* may be PTM_STATE_FLAG_ENCRYPTED */
-+            uint32_t type;        /* which blob to set */
-+            uint32_t length;      /* length of the data;
-+                                     use 0 on the first packet to
-+                                     transfer using write() */
-+            uint8_t data[PTM_STATE_BLOB_SIZE];
-+        } req; /* request */
-+        struct {
-+            ptm_res tpm_result;
-+        } resp; /* response */
-+    } u;
-+};
-+
-+/*
-+ * PTM_GET_CONFIG: Data structure to get runtime configuration information
-+ * such as which keys are applied.
-+ */
-+struct ptm_getconfig {
-+    union {
-+        struct {
-+            ptm_res tpm_result;
-+            uint32_t flags;
-+        } resp; /* response */
-+    } u;
-+};
-+
-+#define PTM_CONFIG_FLAG_FILE_KEY        0x1
-+#define PTM_CONFIG_FLAG_MIGRATION_KEY   0x2
-+
-+
-+typedef uint64_t ptm_cap;
-+typedef struct ptm_est ptm_est;
-+typedef struct ptm_reset_est ptm_reset_est;
-+typedef struct ptm_loc ptm_loc;
-+typedef struct ptm_hdata ptm_hdata;
-+typedef struct ptm_init ptm_init;
-+typedef struct ptm_getstate ptm_getstate;
-+typedef struct ptm_setstate ptm_setstate;
-+typedef struct ptm_getconfig ptm_getconfig;
-+
-+/* capability flags returned by PTM_GET_CAPABILITY */
-+#define PTM_CAP_INIT               (1)
-+#define PTM_CAP_SHUTDOWN           (1<<1)
-+#define PTM_CAP_GET_TPMESTABLISHED (1<<2)
-+#define PTM_CAP_SET_LOCALITY       (1<<3)
-+#define PTM_CAP_HASHING            (1<<4)
-+#define PTM_CAP_CANCEL_TPM_CMD     (1<<5)
-+#define PTM_CAP_STORE_VOLATILE     (1<<6)
-+#define PTM_CAP_RESET_TPMESTABLISHED (1<<7)
-+#define PTM_CAP_GET_STATEBLOB      (1<<8)
-+#define PTM_CAP_SET_STATEBLOB      (1<<9)
-+#define PTM_CAP_STOP               (1<<10)
-+#define PTM_CAP_GET_CONFIG         (1<<11)
-+
-+enum {
-+    PTM_GET_CAPABILITY     = _IOR('P', 0, ptm_cap),
-+    PTM_INIT               = _IOWR('P', 1, ptm_init),
-+    PTM_SHUTDOWN           = _IOR('P', 2, ptm_res),
-+    PTM_GET_TPMESTABLISHED = _IOR('P', 3, ptm_est),
-+    PTM_SET_LOCALITY       = _IOWR('P', 4, ptm_loc),
-+    PTM_HASH_START         = _IOR('P', 5, ptm_res),
-+    PTM_HASH_DATA          = _IOWR('P', 6, ptm_hdata),
-+    PTM_HASH_END           = _IOR('P', 7, ptm_res),
-+    PTM_CANCEL_TPM_CMD     = _IOR('P', 8, ptm_res),
-+    PTM_STORE_VOLATILE     = _IOR('P', 9, ptm_res),
-+    PTM_RESET_TPMESTABLISHED = _IOWR('P', 10, ptm_reset_est),
-+    PTM_GET_STATEBLOB      = _IOWR('P', 11, ptm_getstate),
-+    PTM_SET_STATEBLOB      = _IOWR('P', 12, ptm_setstate),
-+    PTM_STOP               = _IOR('P', 13, ptm_res),
-+    PTM_GET_CONFIG         = _IOR('P', 14, ptm_getconfig),
-+};
-+
-+#endif /* _TPM_IOCTL_H */
-diff --git a/hw/tpm/tpm_passthrough.c b/hw/tpm/tpm_passthrough.c
-index e88c0d20bc..050f2ba850 100644
---- a/hw/tpm/tpm_passthrough.c
-+++ b/hw/tpm/tpm_passthrough.c
-@@ -33,6 +33,7 @@
- #include "sysemu/tpm_backend_int.h"
- #include "tpm_tis.h"
- #include "tpm_util.h"
-+#include "tpm_ioctl.h"
- 
- #define DEBUG_TPM 0
- 
-@@ -45,6 +46,7 @@
- #define TYPE_TPM_PASSTHROUGH "tpm-passthrough"
- #define TPM_PASSTHROUGH(obj) \
-     OBJECT_CHECK(TPMPassthruState, (obj), TYPE_TPM_PASSTHROUGH)
-+#define TYPE_TPM_CUSE "tpm-cuse"
- 
- static const TPMDriverOps tpm_passthrough_driver;
- 
-@@ -71,12 +73,18 @@ struct TPMPassthruState {
-     bool had_startup_error;
- 
-     TPMVersion tpm_version;
-+    ptm_cap cuse_cap; /* capabilities of the CUSE TPM */
-+    uint8_t cur_locty_number; /* last set locality */
- };
- 
- typedef struct TPMPassthruState TPMPassthruState;
- 
- #define TPM_PASSTHROUGH_DEFAULT_DEVICE "/dev/tpm0"
- 
-+#define TPM_PASSTHROUGH_USES_CUSE_TPM(tpm_pt) (tpm_pt->cuse_cap != 0)
-+
-+#define TPM_CUSE_IMPLEMENTS_ALL(S, cap) (((S)->cuse_cap & (cap)) == (cap))
-+
- /* functions */
- 
- static void tpm_passthrough_cancel_cmd(TPMBackend *tb);
-@@ -148,7 +156,28 @@ static bool tpm_passthrough_is_selftest(const uint8_t *in, uint32_t in_len)
-     return false;
- }
- 
-+static int tpm_passthrough_set_locality(TPMPassthruState *tpm_pt,
-+                                        uint8_t locty_number)
-+{
-+    ptm_loc loc;
-+
-+    if (TPM_PASSTHROUGH_USES_CUSE_TPM(tpm_pt)) {
-+        if (tpm_pt->cur_locty_number != locty_number) {
-+            loc.u.req.loc = locty_number;
-+            if (ioctl(tpm_pt->tpm_fd, PTM_SET_LOCALITY, &loc) < 0) {
-+                error_report("tpm_cuse: could not set locality on "
-+                             "CUSE TPM: %s",
-+                             strerror(errno));
-+                return -1;
-+            }
-+            tpm_pt->cur_locty_number = locty_number;
-+        }
-+    }
-+    return 0;
-+}
-+
- static int tpm_passthrough_unix_tx_bufs(TPMPassthruState *tpm_pt,
-+                                        uint8_t locality_number,
-                                         const uint8_t *in, uint32_t in_len,
-                                         uint8_t *out, uint32_t out_len,
-                                         bool *selftest_done)
-@@ -157,6 +186,11 @@ static int tpm_passthrough_unix_tx_bufs(TPMPassthruState *tpm_pt,
-     bool is_selftest;
-     const struct tpm_resp_hdr *hdr;
- 
-+    ret = tpm_passthrough_set_locality(tpm_pt, locality_number);
-+    if (ret < 0) {
-+        goto err_exit;
-+    }
-+
-     tpm_pt->tpm_op_canceled = false;
-     tpm_pt->tpm_executing = true;
-     *selftest_done = false;
-@@ -207,10 +241,12 @@ err_exit:
- }
- 
- static int tpm_passthrough_unix_transfer(TPMPassthruState *tpm_pt,
-+                                         uint8_t locality_number,
-                                          const TPMLocality *locty_data,
-                                          bool *selftest_done)
- {
-     return tpm_passthrough_unix_tx_bufs(tpm_pt,
-+                                        locality_number,
-                                         locty_data->w_buffer.buffer,
-                                         locty_data->w_offset,
-                                         locty_data->r_buffer.buffer,
-@@ -231,6 +267,7 @@ static void tpm_passthrough_worker_thread(gpointer data,
-     switch (cmd) {
-     case TPM_BACKEND_CMD_PROCESS_CMD:
-         tpm_passthrough_unix_transfer(tpm_pt,
-+                                      thr_parms->tpm_state->locty_number,
-                                       thr_parms->tpm_state->locty_data,
-                                       &selftest_done);
- 
-@@ -247,6 +284,93 @@ static void tpm_passthrough_worker_thread(gpointer data,
- }
- 
- /*
-+ * Gracefully shut down the external CUSE TPM
-+ */
-+static void tpm_passthrough_shutdown(TPMPassthruState *tpm_pt)
-+{
-+    ptm_res res;
-+
-+    if (TPM_PASSTHROUGH_USES_CUSE_TPM(tpm_pt)) {
-+        if (ioctl(tpm_pt->tpm_fd, PTM_SHUTDOWN, &res) < 0) {
-+            error_report("tpm_cuse: Could not cleanly shut down "
-+                         "the CUSE TPM: %s",
-+                         strerror(errno));
-+        }
-+    }
-+}
-+
-+/*
-+ * Probe for the CUSE TPM by sending an ioctl() requesting its
-+ * capability flags.
-+ */
-+static int tpm_passthrough_cuse_probe(TPMPassthruState *tpm_pt)
-+{
-+    int rc = 0;
-+
-+    if (ioctl(tpm_pt->tpm_fd, PTM_GET_CAPABILITY, &tpm_pt->cuse_cap) < 0) {
-+        error_report("Error: CUSE TPM was requested, but probing failed");
-+        rc = -1;
-+    }
-+
-+    return rc;
-+}
-+
-+static int tpm_passthrough_cuse_check_caps(TPMPassthruState *tpm_pt)
-+{
-+    int rc = 0;
-+    ptm_cap caps = 0;
-+    const char *tpm = NULL;
-+
-+    /* check for min. required capabilities */
-+    switch (tpm_pt->tpm_version) {
-+    case TPM_VERSION_1_2:
-+        caps = PTM_CAP_INIT | PTM_CAP_SHUTDOWN | PTM_CAP_GET_TPMESTABLISHED |
-+               PTM_CAP_SET_LOCALITY;
-+        tpm = "1.2";
-+        break;
-+    case TPM_VERSION_2_0:
-+        caps = PTM_CAP_INIT | PTM_CAP_SHUTDOWN | PTM_CAP_GET_TPMESTABLISHED |
-+               PTM_CAP_SET_LOCALITY | PTM_CAP_RESET_TPMESTABLISHED;
-+        tpm = "2";
-+        break;
-+    case TPM_VERSION_UNSPEC:
-+        error_report("tpm_cuse: %s: TPM version has not been set",
-+                     __func__);
-+        return -1;
-+    }
-+
-+    if (!TPM_CUSE_IMPLEMENTS_ALL(tpm_pt, caps)) {
-+        error_report("tpm_cuse: TPM does not implement minimum set of required "
-+                     "capabilities for TPM %s (0x%x)", tpm, (int)caps);
-+        rc = -1;
-+    }
-+
-+    return rc;
-+}
-+
-+/*
-+ * Initialize the external CUSE TPM
-+ */
-+static int tpm_passthrough_cuse_init(TPMPassthruState *tpm_pt)
-+{
-+    int rc = 0;
-+    ptm_init init = {
-+        .u.req.init_flags = PTM_INIT_FLAG_DELETE_VOLATILE,
-+    };
-+
-+    if (TPM_PASSTHROUGH_USES_CUSE_TPM(tpm_pt)) {
-+        if (ioctl(tpm_pt->tpm_fd, PTM_INIT, &init) < 0) {
-+            error_report("tpm_cuse: Detected CUSE TPM but could not "
-+                         "send INIT: %s",
-+                         strerror(errno));
-+            rc = -1;
-+        }
-+    }
-+
-+    return rc;
-+}
-+
-+/*
-  * Start the TPM (thread). If it had been started before, then terminate
-  * and start it again.
-  */
-@@ -261,6 +385,8 @@ static int tpm_passthrough_startup_tpm(TPMBackend *tb)
-                               tpm_passthrough_worker_thread,
-                               &tpm_pt->tpm_thread_params);
- 
-+    tpm_passthrough_cuse_init(tpm_pt);
-+
-     return 0;
- }
- 
-@@ -291,14 +417,43 @@ static int tpm_passthrough_init(TPMBackend *tb, TPMState *s,
- 
- static bool tpm_passthrough_get_tpm_established_flag(TPMBackend *tb)
- {
-+    TPMPassthruState *tpm_pt = TPM_PASSTHROUGH(tb);
-+    ptm_est est;
-+
-+    if (TPM_PASSTHROUGH_USES_CUSE_TPM(tpm_pt)) {
-+        if (ioctl(tpm_pt->tpm_fd, PTM_GET_TPMESTABLISHED, &est) < 0) {
-+            error_report("tpm_cuse: Could not get the TPM established "
-+                         "flag from the CUSE TPM: %s",
-+                         strerror(errno));
-+            return false;
-+        }
-+        return (est.u.resp.bit != 0);
-+    }
-     return false;
- }
- 
- static int tpm_passthrough_reset_tpm_established_flag(TPMBackend *tb,
-                                                       uint8_t locty)
- {
-+    TPMPassthruState *tpm_pt = TPM_PASSTHROUGH(tb);
-+    int rc = 0;
-+    ptm_reset_est ptmreset_est;
-+
-     /* only a TPM 2.0 will support this */
--    return 0;
-+    if (tpm_pt->tpm_version == TPM_VERSION_2_0) {
-+        if (TPM_PASSTHROUGH_USES_CUSE_TPM(tpm_pt)) {
-+            ptmreset_est.u.req.loc = tpm_pt->cur_locty_number;
-+
-+            if (ioctl(tpm_pt->tpm_fd, PTM_RESET_TPMESTABLISHED,
-+                      &ptmreset_est) < 0) {
-+                error_report("tpm_cuse: Could not reset the establishment bit "
-+                             "failed: %s",
-+                             strerror(errno));
-+                rc = -1;
-+            }
-+        }
-+    }
-+    return rc;
- }
- 
- static bool tpm_passthrough_get_startup_error(TPMBackend *tb)
-@@ -329,7 +484,8 @@ static void tpm_passthrough_deliver_request(TPMBackend *tb)
- static void tpm_passthrough_cancel_cmd(TPMBackend *tb)
- {
-     TPMPassthruState *tpm_pt = TPM_PASSTHROUGH(tb);
--    int n;
-+    ptm_res res;
-+    static bool error_printed;
- 
-     /*
-      * As of Linux 3.7 the tpm_tis driver does not properly cancel
-@@ -338,17 +494,34 @@ static void tpm_passthrough_cancel_cmd(TPMBackend *tb)
-      * command, e.g., a command executed on the host.
-      */
-     if (tpm_pt->tpm_executing) {
--        if (tpm_pt->cancel_fd >= 0) {
--            n = write(tpm_pt->cancel_fd, "-", 1);
--            if (n != 1) {
--                error_report("Canceling TPM command failed: %s",
--                             strerror(errno));
--            } else {
--                tpm_pt->tpm_op_canceled = true;
-+        if (TPM_PASSTHROUGH_USES_CUSE_TPM(tpm_pt)) {
-+            if (TPM_CUSE_IMPLEMENTS_ALL(tpm_pt, PTM_CAP_CANCEL_TPM_CMD)) {
-+                if (ioctl(tpm_pt->tpm_fd, PTM_CANCEL_TPM_CMD, &res) < 0) {
-+                    error_report("tpm_cuse: Could not cancel command on "
-+                                 "CUSE TPM: %s",
-+                                 strerror(errno));
-+                } else if (res != TPM_SUCCESS) {
-+                    if (!error_printed) {
-+                        error_report("TPM error code from command "
-+                                     "cancellation of CUSE TPM: 0x%x", res);
-+                        error_printed = true;
-+                    }
-+                } else {
-+                    tpm_pt->tpm_op_canceled = true;
-+                }
-             }
-         } else {
--            error_report("Cannot cancel TPM command due to missing "
--                         "TPM sysfs cancel entry");
-+            if (tpm_pt->cancel_fd >= 0) {
-+                if (write(tpm_pt->cancel_fd, "-", 1) != 1) {
-+                    error_report("Canceling TPM command failed: %s",
-+                                 strerror(errno));
-+                } else {
-+                    tpm_pt->tpm_op_canceled = true;
-+                }
-+            } else {
-+                error_report("Cannot cancel TPM command due to missing "
-+                             "TPM sysfs cancel entry");
-+            }
-         }
-     }
- }
-@@ -378,6 +551,11 @@ static int tpm_passthrough_open_sysfs_cancel(TPMBackend *tb)
-     char *dev;
-     char path[PATH_MAX];
- 
-+    if (TPM_PASSTHROUGH_USES_CUSE_TPM(tpm_pt)) {
-+        /* not needed, but so we have a fd */
-+        return qemu_open("/dev/null", O_WRONLY);
-+    }
-+
-     if (tb->cancel_path) {
-         fd = qemu_open(tb->cancel_path, O_WRONLY);
-         if (fd < 0) {
-@@ -412,12 +590,22 @@ static int tpm_passthrough_handle_device_opts(QemuOpts *opts, TPMBackend *tb)
- {
-     TPMPassthruState *tpm_pt = TPM_PASSTHROUGH(tb);
-     const char *value;
-+    bool have_cuse = false;
-+
-+    value = qemu_opt_get(opts, "type");
-+    if (value != NULL && !strcmp("cuse-tpm", value)) {
-+        have_cuse = true;
-+    }
- 
-     value = qemu_opt_get(opts, "cancel-path");
-     tb->cancel_path = g_strdup(value);
- 
-     value = qemu_opt_get(opts, "path");
-     if (!value) {
-+        if (have_cuse) {
-+            error_report("Missing path to access CUSE TPM");
-+            goto err_free_parameters;
-+        }
-         value = TPM_PASSTHROUGH_DEFAULT_DEVICE;
-     }
- 
-@@ -432,15 +620,36 @@ static int tpm_passthrough_handle_device_opts(QemuOpts *opts, TPMBackend *tb)
-         goto err_free_parameters;
-     }
- 
-+    tpm_pt->cur_locty_number = ~0;
-+
-+    if (have_cuse) {
-+        if (tpm_passthrough_cuse_probe(tpm_pt)) {
-+            goto err_close_tpmdev;
-+        }
-+        /* init TPM for probing */
-+        if (tpm_passthrough_cuse_init(tpm_pt)) {
-+            goto err_close_tpmdev;
-+        }
-+    }
-+
-     if (tpm_util_test_tpmdev(tpm_pt->tpm_fd, &tpm_pt->tpm_version)) {
-         error_report("'%s' is not a TPM device.",
-                      tpm_pt->tpm_dev);
-         goto err_close_tpmdev;
-     }
- 
-+    if (have_cuse) {
-+        if (tpm_passthrough_cuse_check_caps(tpm_pt)) {
-+            goto err_close_tpmdev;
-+        }
-+    }
-+
-+
-     return 0;
- 
-  err_close_tpmdev:
-+    tpm_passthrough_shutdown(tpm_pt);
-+
-     qemu_close(tpm_pt->tpm_fd);
-     tpm_pt->tpm_fd = -1;
- 
-@@ -491,6 +700,8 @@ static void tpm_passthrough_destroy(TPMBackend *tb)
- 
-     tpm_backend_thread_end(&tpm_pt->tbt);
- 
-+    tpm_passthrough_shutdown(tpm_pt);
-+
-     qemu_close(tpm_pt->tpm_fd);
-     qemu_close(tpm_pt->cancel_fd);
- 
-@@ -564,3 +775,44 @@ static void tpm_passthrough_register(void)
- }
- 
- type_init(tpm_passthrough_register)
-+
-+/* CUSE TPM */
-+static const char *tpm_passthrough_cuse_create_desc(void)
-+{
-+    return "CUSE TPM backend driver";
-+}
-+
-+static const TPMDriverOps tpm_cuse_driver = {
-+    .type                     = TPM_TYPE_CUSE_TPM,
-+    .opts                     = tpm_passthrough_cmdline_opts,
-+    .desc                     = tpm_passthrough_cuse_create_desc,
-+    .create                   = tpm_passthrough_create,
-+    .destroy                  = tpm_passthrough_destroy,
-+    .init                     = tpm_passthrough_init,
-+    .startup_tpm              = tpm_passthrough_startup_tpm,
-+    .realloc_buffer           = tpm_passthrough_realloc_buffer,
-+    .reset                    = tpm_passthrough_reset,
-+    .had_startup_error        = tpm_passthrough_get_startup_error,
-+    .deliver_request          = tpm_passthrough_deliver_request,
-+    .cancel_cmd               = tpm_passthrough_cancel_cmd,
-+    .get_tpm_established_flag = tpm_passthrough_get_tpm_established_flag,
-+    .reset_tpm_established_flag = tpm_passthrough_reset_tpm_established_flag,
-+    .get_tpm_version          = tpm_passthrough_get_tpm_version,
-+};
-+
-+static const TypeInfo tpm_cuse_info = {
-+    .name = TYPE_TPM_CUSE,
-+    .parent = TYPE_TPM_BACKEND,
-+    .instance_size = sizeof(TPMPassthruState),
-+    .class_init = tpm_passthrough_class_init,
-+    .instance_init = tpm_passthrough_inst_init,
-+    .instance_finalize = tpm_passthrough_inst_finalize,
-+};
-+
-+static void tpm_cuse_register(void)
-+{
-+    type_register_static(&tpm_cuse_info);
-+    tpm_register_driver(&tpm_cuse_driver);
-+}
-+
-+type_init(tpm_cuse_register)
-diff --git a/qapi-schema.json b/qapi-schema.json
-index 5658723b37..53120d0f63 100644
---- a/qapi-schema.json
-+++ b/qapi-schema.json
-@@ -3522,10 +3522,12 @@
- # An enumeration of TPM types
- #
- # @passthrough: TPM passthrough type
-+# @cuse-tpm: CUSE TPM type
-+#            Since: 2.6
- #
- # Since: 1.5
- ##
--{ 'enum': 'TpmType', 'data': [ 'passthrough' ] }
-+{ 'enum': 'TpmType', 'data': [ 'passthrough', 'cuse-tpm' ] }
- 
- ##
- # @query-tpm-types:
-@@ -3554,6 +3556,17 @@
-                                              '*cancel-path' : 'str'} }
- 
- ##
-+# @TPMCuseOptions:
-+#
-+# Information about the CUSE TPM type
-+#
-+# @path: string describing the path used for accessing the TPM device
-+#
-+# Since: 2.6
-+##
-+{ 'struct': 'TPMCuseOptions', 'data': { 'path' : 'str'}}
-+
-+##
- # @TpmTypeOptions:
- #
- # A union referencing different TPM backend types' configuration options
-@@ -3563,7 +3576,8 @@
- # Since: 1.5
- ##
- { 'union': 'TpmTypeOptions',
--   'data': { 'passthrough' : 'TPMPassthroughOptions' } }
-+   'data': { 'passthrough' : 'TPMPassthroughOptions',
-+             'cuse-tpm' : 'TPMCuseOptions' } }
- 
- ##
- # @TpmInfo:
-diff --git a/qemu-options.hx b/qemu-options.hx
-index a71aaf8ea8..e0f1d8e676 100644
---- a/qemu-options.hx
-+++ b/qemu-options.hx
-@@ -2763,7 +2763,10 @@ DEF("tpmdev", HAS_ARG, QEMU_OPTION_tpmdev, \
-     "-tpmdev passthrough,id=id[,path=path][,cancel-path=path]\n"
-     "                use path to provide path to a character device; default is /dev/tpm0\n"
-     "                use cancel-path to provide path to TPM's cancel sysfs entry; if\n"
--    "                not provided it will be searched for in /sys/class/misc/tpm?/device\n",
-+    "                not provided it will be searched for in /sys/class/misc/tpm?/device\n"
-+    "-tpmdev cuse-tpm,id=id,path=path\n"
-+    "                use path to provide path to a character device to talk to the\n"
-+    "                TPM emulator providing a CUSE interface\n",
-     QEMU_ARCH_ALL)
- STEXI
- 
-@@ -2772,8 +2775,8 @@ The general form of a TPM device option is:
- 
- @item -tpmdev @var{backend} ,id=@var{id} [,@var{options}]
- @findex -tpmdev
--Backend type must be:
--@option{passthrough}.
-+Backend type must be either one of the following:
-+@option{passthrough}, @option{cuse-tpm}.
- 
- The specific backend type will determine the applicable options.
- The @code{-tpmdev} option creates the TPM backend and requires a
-@@ -2823,6 +2826,18 @@ To create a passthrough TPM use the following two options:
- Note that the @code{-tpmdev} id is @code{tpm0} and is referenced by
- @code{tpmdev=tpm0} in the device option.
- 
-+@item -tpmdev cuse-tpm, id=@var{id}, path=@var{path}
-+
-+(Linux-host only) Enable access to a TPM emulator with a CUSE interface.
-+
-+@option{path} specifies the path to the CUSE TPM character device.
-+
-+To create a backend device accessing the CUSE TPM emulator using /dev/vtpm
-+use the following two options:
-+@example
-+-tpmdev cuse-tpm,id=tpm0,path=/dev/vtpm -device tpm-tis,tpmdev=tpm0
-+@end example
-+
- @end table
- 
- ETEXI
-diff --git a/tpm.c b/tpm.c
-index 9a7c7114d3..5ec2373286 100644
---- a/tpm.c
-+++ b/tpm.c
-@@ -25,7 +25,7 @@ static QLIST_HEAD(, TPMBackend) tpm_backends =
- 
- 
- #define TPM_MAX_MODELS      1
--#define TPM_MAX_DRIVERS     1
-+#define TPM_MAX_DRIVERS     2
- 
- static TPMDriverOps const *be_drivers[TPM_MAX_DRIVERS] = {
-     NULL,
-@@ -272,6 +272,15 @@ static TPMInfo *qmp_query_tpm_inst(TPMBackend *drv)
-             tpo->has_cancel_path = true;
-         }
-         break;
-+    case TPM_TYPE_CUSE_TPM:
-+        res->options->type = TPM_TYPE_OPTIONS_KIND_CUSE_TPM;
-+        tpo = g_new0(TPMPassthroughOptions, 1);
-+        res->options->u.passthrough.data = tpo;
-+        if (drv->path) {
-+            tpo->path = g_strdup(drv->path);
-+            tpo->has_path = true;
-+        }
-+        break;
-     case TPM_TYPE__MAX:
-         break;
-     }
--- 
-2.11.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/0001-tpm-Clean-up-driver-registration-lookup.patch b/meta/recipes-devtools/qemu/qemu/0001-tpm-Clean-up-driver-registration-lookup.patch
new file mode 100644
index 0000000..1a484b9
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-tpm-Clean-up-driver-registration-lookup.patch
@@ -0,0 +1,154 @@
+From a0f8d150794164f41cd7288c9ed059bbf21c95ec Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
+Date: Thu, 24 Aug 2017 10:45:58 +0200
+Subject: [PATCH 01/12] tpm: Clean up driver registration & lookup
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+We have a strict separation between enum TpmType and be_drivers[]:
+
+* TpmType may have any number of members.  It just happens to have one.
+
+* tpm_register_driver() uses the first empty slot in be_drivers[].
+
+  If you register more than tpm_models[] has space,
+  tpm_register_driver() fails.  Its caller silently ignores the
+  failure.
+
+  If you register more than one with a given TpmType,
+  tpm_display_backend_drivers() will shows all of them, but
+  tpm_driver_find_by_type() and tpm_get_backend_driver() will find
+  only the one one that registered first.
+
+Since we only ever register one driver, and be_drivers[] has space for
+just that one, this contraption even works.
+
+Turn be_drivers[] into a straight map from enum TpmType to driver.
+Much simpler, and has a decent chance to actually work should we ever
+acquire additional drivers.
+
+While there, use qapi_enum_parse() in tpm_get_backend_driver().
+
+Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
+Message-Id: <20170822132255.23945-8-marcandre.lureau@redhat.com>
+Reviewed-by: Markus Armbruster <armbru@redhat.com>
+[Rebased, superfluous initializer dropped, commit message rewritten]
+Cc: Stefan Berger <stefanb@us.ibm.com>
+Signed-off-by: Markus Armbruster <armbru@redhat.com>
+Message-Id: <1503564371-26090-4-git-send-email-armbru@redhat.com>
+
+Upstream-Status: Backport
+---
+ include/sysemu/tpm_backend.h |  2 +-
+ tpm.c                        | 45 +++++++++++++-------------------------------
+ 2 files changed, 14 insertions(+), 33 deletions(-)
+
+diff --git a/include/sysemu/tpm_backend.h b/include/sysemu/tpm_backend.h
+index b58f52d39f..1d21c6b19b 100644
+--- a/include/sysemu/tpm_backend.h
++++ b/include/sysemu/tpm_backend.h
+@@ -227,6 +227,6 @@ TPMBackend *qemu_find_tpm(const char *id);
+ 
+ const TPMDriverOps *tpm_get_backend_driver(const char *type);
+ int tpm_register_model(enum TpmModel model);
+-int tpm_register_driver(const TPMDriverOps *tdo);
++void tpm_register_driver(const TPMDriverOps *tdo);
+ 
+ #endif
+diff --git a/tpm.c b/tpm.c
+index 9a7c7114d3..bb45d0c08e 100644
+--- a/tpm.c
++++ b/tpm.c
+@@ -14,6 +14,7 @@
+ #include "qemu/osdep.h"
+ 
+ #include "qapi/qmp/qerror.h"
++#include "qapi/util.h"
+ #include "sysemu/tpm_backend.h"
+ #include "sysemu/tpm.h"
+ #include "qemu/config-file.h"
+@@ -25,11 +26,8 @@ static QLIST_HEAD(, TPMBackend) tpm_backends =
+ 
+ 
+ #define TPM_MAX_MODELS      1
+-#define TPM_MAX_DRIVERS     1
+ 
+-static TPMDriverOps const *be_drivers[TPM_MAX_DRIVERS] = {
+-    NULL,
+-};
++static TPMDriverOps const *be_drivers[TPM_TYPE__MAX];
+ 
+ static enum TpmModel tpm_models[TPM_MAX_MODELS] = {
+     TPM_MODEL__MAX,
+@@ -63,31 +61,18 @@ static bool tpm_model_is_registered(enum TpmModel model)
+ 
+ const TPMDriverOps *tpm_get_backend_driver(const char *type)
+ {
+-    int i;
+-
+-    for (i = 0; i < TPM_MAX_DRIVERS && be_drivers[i] != NULL; i++) {
+-        if (!strcmp(TpmType_lookup[be_drivers[i]->type], type)) {
+-            return be_drivers[i];
+-        }
+-    }
++    int i = qapi_enum_parse(TpmType_lookup, type, TPM_TYPE__MAX, -1, NULL);
+ 
+-    return NULL;
++    return i >= 0 ? be_drivers[i] : NULL;
+ }
+ 
+ #ifdef CONFIG_TPM
+ 
+-int tpm_register_driver(const TPMDriverOps *tdo)
++void tpm_register_driver(const TPMDriverOps *tdo)
+ {
+-    int i;
++    assert(!be_drivers[tdo->type]);
+ 
+-    for (i = 0; i < TPM_MAX_DRIVERS; i++) {
+-        if (!be_drivers[i]) {
+-            be_drivers[i] = tdo;
+-            return 0;
+-        }
+-    }
+-    error_report("Could not register TPM driver");
+-    return 1;
++    be_drivers[tdo->type] = tdo;
+ }
+ 
+ /*
+@@ -100,9 +85,12 @@ static void tpm_display_backend_drivers(void)
+ 
+     fprintf(stderr, "Supported TPM types (choose only one):\n");
+ 
+-    for (i = 0; i < TPM_MAX_DRIVERS && be_drivers[i] != NULL; i++) {
++    for (i = 0; i < TPM_TYPE__MAX; i++) {
++        if (be_drivers[i] == NULL) {
++            continue;
++        }
+         fprintf(stderr, "%12s   %s\n",
+-                TpmType_lookup[be_drivers[i]->type], be_drivers[i]->desc());
++                TpmType_lookup[i], be_drivers[i]->desc());
+     }
+     fprintf(stderr, "\n");
+ }
+@@ -239,14 +227,7 @@ int tpm_config_parse(QemuOptsList *opts_list, const char *optarg)
+ 
+ static const TPMDriverOps *tpm_driver_find_by_type(enum TpmType type)
+ {
+-    int i;
+-
+-    for (i = 0; i < TPM_MAX_DRIVERS && be_drivers[i] != NULL; i++) {
+-        if (be_drivers[i]->type == type) {
+-            return be_drivers[i];
+-        }
+-    }
+-    return NULL;
++    return be_drivers[type];
+ }
+ 
+ static TPMInfo *qmp_query_tpm_inst(TPMBackend *drv)
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/qemu/qemu/0002-Introduce-condition-to-notify-waiters-of-completed-c.patch b/meta/recipes-devtools/qemu/qemu/0002-Introduce-condition-to-notify-waiters-of-completed-c.patch
deleted file mode 100644
index c88c98e..0000000
--- a/meta/recipes-devtools/qemu/qemu/0002-Introduce-condition-to-notify-waiters-of-completed-c.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-From b5ffd3aa4e9bd4edb09cc84c46f78da72697a946 Mon Sep 17 00:00:00 2001
-From: Stefan Berger <stefanb@linux.vnet.ibm.com>
-Date: Sat, 31 Dec 2016 11:23:32 -0500
-Subject: [PATCH 2/4] Introduce condition to notify waiters of completed
- command
-
-Introduce a lock and a condition to notify anyone waiting for the completion
-of the execution of a TPM command by the backend (thread). The backend
-uses the condition to signal anyone waiting for command completion.
-We need to place the condition in two locations: one is invoked by the
-backend thread, the other by the bottom half thread.
-We will use the signalling to wait for command completion before VM
-suspend.
-
-Signed-off-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
-
-Upstream-Status: Pending [https://lists.nongnu.org/archive/html/qemu-devel/2016-06/msg00252.html]
-Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
----
- hw/tpm/tpm_int.h |  3 +++
- hw/tpm/tpm_tis.c | 14 ++++++++++++++
- 2 files changed, 17 insertions(+)
-
-diff --git a/hw/tpm/tpm_int.h b/hw/tpm/tpm_int.h
-index 6b2c9c953a..70be1ad8d9 100644
---- a/hw/tpm/tpm_int.h
-+++ b/hw/tpm/tpm_int.h
-@@ -30,6 +30,9 @@ struct TPMState {
-     char *backend;
-     TPMBackend *be_driver;
-     TPMVersion be_tpm_version;
-+
-+    QemuMutex state_lock;
-+    QemuCond cmd_complete;
- };
- 
- #define TPM(obj) OBJECT_CHECK(TPMState, (obj), TYPE_TPM_TIS)
-diff --git a/hw/tpm/tpm_tis.c b/hw/tpm/tpm_tis.c
-index 381e7266ea..14d9e83ea2 100644
---- a/hw/tpm/tpm_tis.c
-+++ b/hw/tpm/tpm_tis.c
-@@ -368,6 +368,8 @@ static void tpm_tis_receive_bh(void *opaque)
-     TPMTISEmuState *tis = &s->s.tis;
-     uint8_t locty = s->locty_number;
- 
-+    qemu_mutex_lock(&s->state_lock);
-+
-     tpm_tis_sts_set(&tis->loc[locty],
-                     TPM_TIS_STS_VALID | TPM_TIS_STS_DATA_AVAILABLE);
-     tis->loc[locty].state = TPM_TIS_STATE_COMPLETION;
-@@ -384,6 +386,10 @@ static void tpm_tis_receive_bh(void *opaque)
-     tpm_tis_raise_irq(s, locty,
-                       TPM_TIS_INT_DATA_AVAILABLE | TPM_TIS_INT_STS_VALID);
- #endif
-+
-+    /* notify of completed command */
-+    qemu_cond_signal(&s->cmd_complete);
-+    qemu_mutex_unlock(&s->state_lock);
- }
- 
- /*
-@@ -403,6 +409,11 @@ static void tpm_tis_receive_cb(TPMState *s, uint8_t locty,
-         }
-     }
- 
-+    qemu_mutex_lock(&s->state_lock);
-+    /* notify of completed command */
-+    qemu_cond_signal(&s->cmd_complete);
-+    qemu_mutex_unlock(&s->state_lock);
-+
-     qemu_bh_schedule(tis->bh);
- }
- 
-@@ -1072,6 +1083,9 @@ static void tpm_tis_initfn(Object *obj)
-     memory_region_init_io(&s->mmio, OBJECT(s), &tpm_tis_memory_ops,
-                           s, "tpm-tis-mmio",
-                           TPM_TIS_NUM_LOCALITIES << TPM_TIS_LOCALITY_SHIFT);
-+
-+    qemu_mutex_init(&s->state_lock);
-+    qemu_cond_init(&s->cmd_complete);
- }
- 
- static void tpm_tis_class_init(ObjectClass *klass, void *data)
--- 
-2.11.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/0002-tpm-Clean-up-model-registration-lookup.patch b/meta/recipes-devtools/qemu/qemu/0002-tpm-Clean-up-model-registration-lookup.patch
new file mode 100644
index 0000000..c223ba8
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0002-tpm-Clean-up-model-registration-lookup.patch
@@ -0,0 +1,121 @@
+From 89430c64784484214b3c99562520cdffe79cd801 Mon Sep 17 00:00:00 2001
+From: Markus Armbruster <armbru@redhat.com>
+Date: Thu, 24 Aug 2017 10:45:59 +0200
+Subject: [PATCH 02/12] tpm: Clean up model registration & lookup
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+We have a strict separation between enum TpmModel and tpm_models[]:
+
+* TpmModel may have any number of members.  It just happens to have one.
+
+* tpm_register_model() uses the first empty slot in tpm_models[].
+
+  If you register more than tpm_models[] has space,
+  tpn_register_model() fails.  Its caller silently ignores the
+  failure.
+
+  Register the same TpmModel more than once has no effect other than
+  wasting tpm_models[] slots: tpm_model_is_registered() is happy with
+  the first one it finds.
+
+Since we only ever register one model, and tpm_models[] has space for
+just that one, this contraption even works.
+
+Turn tpm_models[] into a straight map from enum TpmType to bool.  Much
+simpler.
+
+Cc: Stefan Berger <stefanb@us.ibm.com>
+Signed-off-by: Markus Armbruster <armbru@redhat.com>
+Message-Id: <1503564371-26090-5-git-send-email-armbru@redhat.com>
+Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
+[Commit message typo fixed]
+
+Upstream-Status: Backport
+---
+ include/sysemu/tpm_backend.h |  2 +-
+ tpm.c                        | 37 +++++--------------------------------
+ 2 files changed, 6 insertions(+), 33 deletions(-)
+
+diff --git a/include/sysemu/tpm_backend.h b/include/sysemu/tpm_backend.h
+index 1d21c6b19b..b0a9731aee 100644
+--- a/include/sysemu/tpm_backend.h
++++ b/include/sysemu/tpm_backend.h
+@@ -226,7 +226,7 @@ TPMVersion tpm_backend_get_tpm_version(TPMBackend *s);
+ TPMBackend *qemu_find_tpm(const char *id);
+ 
+ const TPMDriverOps *tpm_get_backend_driver(const char *type);
+-int tpm_register_model(enum TpmModel model);
++void tpm_register_model(enum TpmModel model);
+ void tpm_register_driver(const TPMDriverOps *tdo);
+ 
+ #endif
+diff --git a/tpm.c b/tpm.c
+index bb45d0c08e..2dbea70645 100644
+--- a/tpm.c
++++ b/tpm.c
+@@ -24,39 +24,12 @@
+ static QLIST_HEAD(, TPMBackend) tpm_backends =
+     QLIST_HEAD_INITIALIZER(tpm_backends);
+ 
+-
+-#define TPM_MAX_MODELS      1
+-
+ static TPMDriverOps const *be_drivers[TPM_TYPE__MAX];
++static bool tpm_models[TPM_MODEL__MAX];
+ 
+-static enum TpmModel tpm_models[TPM_MAX_MODELS] = {
+-    TPM_MODEL__MAX,
+-};
+-
+-int tpm_register_model(enum TpmModel model)
+-{
+-    int i;
+-
+-    for (i = 0; i < TPM_MAX_MODELS; i++) {
+-        if (tpm_models[i] == TPM_MODEL__MAX) {
+-            tpm_models[i] = model;
+-            return 0;
+-        }
+-    }
+-    error_report("Could not register TPM model");
+-    return 1;
+-}
+-
+-static bool tpm_model_is_registered(enum TpmModel model)
++void tpm_register_model(enum TpmModel model)
+ {
+-    int i;
+-
+-    for (i = 0; i < TPM_MAX_MODELS; i++) {
+-        if (tpm_models[i] == model) {
+-            return true;
+-        }
+-    }
+-    return false;
++    tpm_models[model] = true;
+ }
+ 
+ const TPMDriverOps *tpm_get_backend_driver(const char *type)
+@@ -270,7 +243,7 @@ TPMInfoList *qmp_query_tpm(Error **errp)
+     TPMInfoList *info, *head = NULL, *cur_item = NULL;
+ 
+     QLIST_FOREACH(drv, &tpm_backends, list) {
+-        if (!tpm_model_is_registered(drv->fe_model)) {
++        if (!tpm_models[drv->fe_model]) {
+             continue;
+         }
+         info = g_new0(TPMInfoList, 1);
+@@ -317,7 +290,7 @@ TpmModelList *qmp_query_tpm_models(Error **errp)
+     TpmModelList *head = NULL, *prev = NULL, *cur_item;
+ 
+     for (i = 0; i < TPM_MODEL__MAX; i++) {
+-        if (!tpm_model_is_registered(i)) {
++        if (!tpm_models[i]) {
+             continue;
+         }
+         cur_item = g_new0(TpmModelList, 1);
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/qemu/qemu/0003-Introduce-condition-in-TPM-backend-for-notification.patch b/meta/recipes-devtools/qemu/qemu/0003-Introduce-condition-in-TPM-backend-for-notification.patch
deleted file mode 100644
index e58f019..0000000
--- a/meta/recipes-devtools/qemu/qemu/0003-Introduce-condition-in-TPM-backend-for-notification.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From 732a8e046948fd62b32cd1dd76a6798eb1caf4d6 Mon Sep 17 00:00:00 2001
-From: Stefan Berger <stefanb@linux.vnet.ibm.com>
-Date: Sat, 31 Dec 2016 11:23:32 -0500
-Subject: [PATCH 3/4] Introduce condition in TPM backend for notification
-
-TPM backends will suspend independently of the frontends. Also
-here we need to be able to wait for the TPM command to have been
-completely processed.
-
-Signed-off-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
-
-Upstream-Status: Pending [https://lists.nongnu.org/archive/html/qemu-devel/2016-06/msg00252.html]
-Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
----
- hw/tpm/tpm_passthrough.c | 20 ++++++++++++++++++++
- 1 file changed, 20 insertions(+)
-
-diff --git a/hw/tpm/tpm_passthrough.c b/hw/tpm/tpm_passthrough.c
-index 050f2ba850..44739ebad2 100644
---- a/hw/tpm/tpm_passthrough.c
-+++ b/hw/tpm/tpm_passthrough.c
-@@ -75,6 +75,10 @@ struct TPMPassthruState {
-     TPMVersion tpm_version;
-     ptm_cap cuse_cap; /* capabilities of the CUSE TPM */
-     uint8_t cur_locty_number; /* last set locality */
-+
-+    QemuMutex state_lock;
-+    QemuCond cmd_complete;  /* singnaled once tpm_busy is false */
-+    bool tpm_busy;
- };
- 
- typedef struct TPMPassthruState TPMPassthruState;
-@@ -274,6 +278,11 @@ static void tpm_passthrough_worker_thread(gpointer data,
-         thr_parms->recv_data_callback(thr_parms->tpm_state,
-                                       thr_parms->tpm_state->locty_number,
-                                       selftest_done);
-+        /* result delivered */
-+        qemu_mutex_lock(&tpm_pt->state_lock);
-+        tpm_pt->tpm_busy = false;
-+        qemu_cond_signal(&tpm_pt->cmd_complete);
-+        qemu_mutex_unlock(&tpm_pt->state_lock);
-         break;
-     case TPM_BACKEND_CMD_INIT:
-     case TPM_BACKEND_CMD_END:
-@@ -401,6 +410,7 @@ static void tpm_passthrough_reset(TPMBackend *tb)
-     tpm_backend_thread_end(&tpm_pt->tbt);
- 
-     tpm_pt->had_startup_error = false;
-+    tpm_pt->tpm_busy = false;
- }
- 
- static int tpm_passthrough_init(TPMBackend *tb, TPMState *s,
-@@ -478,6 +488,11 @@ static void tpm_passthrough_deliver_request(TPMBackend *tb)
- {
-     TPMPassthruState *tpm_pt = TPM_PASSTHROUGH(tb);
- 
-+    /* TPM considered busy once TPM Request scheduled for processing */
-+    qemu_mutex_lock(&tpm_pt->state_lock);
-+    tpm_pt->tpm_busy = true;
-+    qemu_mutex_unlock(&tpm_pt->state_lock);
-+
-     tpm_backend_thread_deliver_request(&tpm_pt->tbt);
- }
- 
-@@ -746,6 +761,11 @@ static const TPMDriverOps tpm_passthrough_driver = {
- 
- static void tpm_passthrough_inst_init(Object *obj)
- {
-+    TPMBackend *tb = TPM_BACKEND(obj);
-+    TPMPassthruState *tpm_pt = TPM_PASSTHROUGH(tb);
-+
-+    qemu_mutex_init(&tpm_pt->state_lock);
-+    qemu_cond_init(&tpm_pt->cmd_complete);
- }
- 
- static void tpm_passthrough_inst_finalize(Object *obj)
--- 
-2.11.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/0003-tpm-backend-Remove-unneeded-member-variable-from-bac.patch b/meta/recipes-devtools/qemu/qemu/0003-tpm-backend-Remove-unneeded-member-variable-from-bac.patch
new file mode 100644
index 0000000..6b94eba
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0003-tpm-backend-Remove-unneeded-member-variable-from-bac.patch
@@ -0,0 +1,75 @@
+From cac845f55b8f27e5c90e0f2e3dcbeea7013df67c Mon Sep 17 00:00:00 2001
+From: Amarnath Valluri <amarnath.valluri@intel.com>
+Date: Thu, 30 Mar 2017 15:55:17 +0300
+Subject: [PATCH 03/12] tpm-backend: Remove unneeded member variable from
+ backend class
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+TPMDriverOps inside TPMBackend is not required, as it is supposed to be a class
+member. The only possible reason for keeping in TPMBackend was, to get the
+backend type in tpm.c where dedicated backend api, tpm_backend_get_type() is
+present.
+
+Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
+Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
+Reviewed-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
+
+Upstream-Status: Backport [fb4b0c6765471dad2363875989e7661ca5f9a608]
+---
+ hw/tpm/tpm_passthrough.c     | 4 ----
+ include/sysemu/tpm_backend.h | 1 -
+ tpm.c                        | 2 +-
+ 3 files changed, 1 insertion(+), 6 deletions(-)
+
+diff --git a/hw/tpm/tpm_passthrough.c b/hw/tpm/tpm_passthrough.c
+index 9234eb3459..a0baf5f080 100644
+--- a/hw/tpm/tpm_passthrough.c
++++ b/hw/tpm/tpm_passthrough.c
+@@ -46,8 +46,6 @@
+ #define TPM_PASSTHROUGH(obj) \
+     OBJECT_CHECK(TPMPassthruState, (obj), TYPE_TPM_PASSTHROUGH)
+ 
+-static const TPMDriverOps tpm_passthrough_driver;
+-
+ /* data structures */
+ typedef struct TPMPassthruThreadParams {
+     TPMState *tpm_state;
+@@ -462,8 +460,6 @@ static TPMBackend *tpm_passthrough_create(QemuOpts *opts, const char *id)
+     /* let frontend set the fe_model to proper value */
+     tb->fe_model = -1;
+ 
+-    tb->ops = &tpm_passthrough_driver;
+-
+     if (tpm_passthrough_handle_device_opts(opts, tb)) {
+         goto err_exit;
+     }
+diff --git a/include/sysemu/tpm_backend.h b/include/sysemu/tpm_backend.h
+index b0a9731aee..3708413035 100644
+--- a/include/sysemu/tpm_backend.h
++++ b/include/sysemu/tpm_backend.h
+@@ -50,7 +50,6 @@ struct TPMBackend {
+     enum TpmModel fe_model;
+     char *path;
+     char *cancel_path;
+-    const TPMDriverOps *ops;
+ 
+     QLIST_ENTRY(TPMBackend) list;
+ };
+diff --git a/tpm.c b/tpm.c
+index 2dbea70645..b7166ca200 100644
+--- a/tpm.c
++++ b/tpm.c
+@@ -212,7 +212,7 @@ static TPMInfo *qmp_query_tpm_inst(TPMBackend *drv)
+     res->model = drv->fe_model;
+     res->options = g_new0(TpmTypeOptions, 1);
+ 
+-    switch (drv->ops->type) {
++    switch (tpm_backend_get_type(drv)) {
+     case TPM_TYPE_PASSTHROUGH:
+         res->options->type = TPM_TYPE_OPTIONS_KIND_PASSTHROUGH;
+         tpo = g_new0(TPMPassthroughOptions, 1);
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/qemu/qemu/0004-Add-support-for-VM-suspend-resume-for-TPM-TIS-v2.9.patch b/meta/recipes-devtools/qemu/qemu/0004-Add-support-for-VM-suspend-resume-for-TPM-TIS-v2.9.patch
deleted file mode 100644
index f1dbaff..0000000
--- a/meta/recipes-devtools/qemu/qemu/0004-Add-support-for-VM-suspend-resume-for-TPM-TIS-v2.9.patch
+++ /dev/null
@@ -1,719 +0,0 @@
-From 5e9dd9063f514447ea4f54046793f4f01c297ed4 Mon Sep 17 00:00:00 2001
-From: Stefan Berger <stefanb@linux.vnet.ibm.com>
-Date: Sat, 31 Dec 2016 11:23:32 -0500
-Subject: [PATCH 4/4] Add support for VM suspend/resume for TPM TIS
-
-Extend the TPM TIS code to support suspend/resume. In case a command
-is being processed by the external TPM when suspending, wait for the command
-to complete to catch the result. In case the bottom half did not run,
-run the one function the bottom half is supposed to run. This then
-makes the resume operation work.
-
-The passthrough backend does not support suspend/resume operation
-and is therefore blocked from suspend/resume and migration.
-
-The CUSE TPM's supported capabilities are tested and if sufficient
-capabilities are implemented, suspend/resume, snapshotting and
-migration are supported by the CUSE TPM.
-
-Signed-off-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
-
-Upstream-Status: Pending [https://lists.nongnu.org/archive/html/qemu-devel/2016-06/msg00252.html]
-Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
----
- hw/tpm/tpm_passthrough.c     | 130 +++++++++++++++++++++++--
- hw/tpm/tpm_tis.c             | 137 +++++++++++++++++++++++++-
- hw/tpm/tpm_tis.h             |   2 +
- hw/tpm/tpm_util.c            | 223 +++++++++++++++++++++++++++++++++++++++++++
- hw/tpm/tpm_util.h            |   7 ++
- include/sysemu/tpm_backend.h |  12 +++
- 6 files changed, 503 insertions(+), 8 deletions(-)
-
-diff --git a/hw/tpm/tpm_passthrough.c b/hw/tpm/tpm_passthrough.c
-index 44739ebad2..bc8072d0bc 100644
---- a/hw/tpm/tpm_passthrough.c
-+++ b/hw/tpm/tpm_passthrough.c
-@@ -34,6 +34,8 @@
- #include "tpm_tis.h"
- #include "tpm_util.h"
- #include "tpm_ioctl.h"
-+#include "migration/migration.h"
-+#include "qapi/error.h"
- 
- #define DEBUG_TPM 0
- 
-@@ -49,6 +51,7 @@
- #define TYPE_TPM_CUSE "tpm-cuse"
- 
- static const TPMDriverOps tpm_passthrough_driver;
-+static const VMStateDescription vmstate_tpm_cuse;
- 
- /* data structures */
- typedef struct TPMPassthruThreadParams {
-@@ -79,6 +82,10 @@ struct TPMPassthruState {
-     QemuMutex state_lock;
-     QemuCond cmd_complete;  /* singnaled once tpm_busy is false */
-     bool tpm_busy;
-+
-+    Error *migration_blocker;
-+
-+    TPMBlobBuffers tpm_blobs;
- };
- 
- typedef struct TPMPassthruState TPMPassthruState;
-@@ -306,6 +313,10 @@ static void tpm_passthrough_shutdown(TPMPassthruState *tpm_pt)
-                          strerror(errno));
-         }
-     }
-+    if (tpm_pt->migration_blocker) {
-+        migrate_del_blocker(tpm_pt->migration_blocker);
-+        error_free(tpm_pt->migration_blocker);
-+    }
- }
- 
- /*
-@@ -360,12 +371,14 @@ static int tpm_passthrough_cuse_check_caps(TPMPassthruState *tpm_pt)
- /*
-  * Initialize the external CUSE TPM
-  */
--static int tpm_passthrough_cuse_init(TPMPassthruState *tpm_pt)
-+static int tpm_passthrough_cuse_init(TPMPassthruState *tpm_pt,
-+                                     bool is_resume)
- {
-     int rc = 0;
--    ptm_init init = {
--        .u.req.init_flags = PTM_INIT_FLAG_DELETE_VOLATILE,
--    };
-+    ptm_init init;
-+    if (is_resume) {
-+        init.u.req.init_flags = PTM_INIT_FLAG_DELETE_VOLATILE;
-+    }
- 
-     if (TPM_PASSTHROUGH_USES_CUSE_TPM(tpm_pt)) {
-         if (ioctl(tpm_pt->tpm_fd, PTM_INIT, &init) < 0) {
-@@ -394,7 +407,7 @@ static int tpm_passthrough_startup_tpm(TPMBackend *tb)
-                               tpm_passthrough_worker_thread,
-                               &tpm_pt->tpm_thread_params);
- 
--    tpm_passthrough_cuse_init(tpm_pt);
-+    tpm_passthrough_cuse_init(tpm_pt, false);
- 
-     return 0;
- }
-@@ -466,6 +479,32 @@ static int tpm_passthrough_reset_tpm_established_flag(TPMBackend *tb,
-     return rc;
- }
- 
-+static int tpm_cuse_get_state_blobs(TPMBackend *tb,
-+                                    bool decrypted_blobs,
-+                                    TPMBlobBuffers *tpm_blobs)
-+{
-+    TPMPassthruState *tpm_pt = TPM_PASSTHROUGH(tb);
-+
-+    assert(TPM_PASSTHROUGH_USES_CUSE_TPM(tpm_pt));
-+
-+    return tpm_util_cuse_get_state_blobs(tpm_pt->tpm_fd, decrypted_blobs,
-+                                         tpm_blobs);
-+}
-+
-+static int tpm_cuse_set_state_blobs(TPMBackend *tb,
-+                                    TPMBlobBuffers *tpm_blobs)
-+{
-+    TPMPassthruState *tpm_pt = TPM_PASSTHROUGH(tb);
-+
-+    assert(TPM_PASSTHROUGH_USES_CUSE_TPM(tpm_pt));
-+
-+    if (tpm_util_cuse_set_state_blobs(tpm_pt->tpm_fd, tpm_blobs)) {
-+        return 1;
-+    }
-+
-+    return tpm_passthrough_cuse_init(tpm_pt, true);
-+}
-+
- static bool tpm_passthrough_get_startup_error(TPMBackend *tb)
- {
-     TPMPassthruState *tpm_pt = TPM_PASSTHROUGH(tb);
-@@ -488,7 +527,7 @@ static void tpm_passthrough_deliver_request(TPMBackend *tb)
- {
-     TPMPassthruState *tpm_pt = TPM_PASSTHROUGH(tb);
- 
--    /* TPM considered busy once TPM Request scheduled for processing */
-+    /* TPM considered busy once TPM request scheduled for processing */
-     qemu_mutex_lock(&tpm_pt->state_lock);
-     tpm_pt->tpm_busy = true;
-     qemu_mutex_unlock(&tpm_pt->state_lock);
-@@ -601,6 +640,25 @@ static int tpm_passthrough_open_sysfs_cancel(TPMBackend *tb)
-     return fd;
- }
- 
-+static void tpm_passthrough_block_migration(TPMPassthruState *tpm_pt)
-+{
-+    ptm_cap caps;
-+
-+    if (TPM_PASSTHROUGH_USES_CUSE_TPM(tpm_pt)) {
-+        caps = PTM_CAP_GET_STATEBLOB | PTM_CAP_SET_STATEBLOB |
-+               PTM_CAP_STOP;
-+        if (!TPM_CUSE_IMPLEMENTS_ALL(tpm_pt, caps)) {
-+            error_setg(&tpm_pt->migration_blocker,
-+                       "Migration disabled: CUSE TPM lacks necessary capabilities");
-+            migrate_add_blocker(tpm_pt->migration_blocker);
-+        }
-+    } else {
-+        error_setg(&tpm_pt->migration_blocker,
-+                   "Migration disabled: Passthrough TPM does not support migration");
-+        migrate_add_blocker(tpm_pt->migration_blocker);
-+    }
-+}
-+
- static int tpm_passthrough_handle_device_opts(QemuOpts *opts, TPMBackend *tb)
- {
-     TPMPassthruState *tpm_pt = TPM_PASSTHROUGH(tb);
-@@ -642,7 +700,7 @@ static int tpm_passthrough_handle_device_opts(QemuOpts *opts, TPMBackend *tb)
-             goto err_close_tpmdev;
-         }
-         /* init TPM for probing */
--        if (tpm_passthrough_cuse_init(tpm_pt)) {
-+        if (tpm_passthrough_cuse_init(tpm_pt, false)) {
-             goto err_close_tpmdev;
-         }
-     }
-@@ -659,6 +717,7 @@ static int tpm_passthrough_handle_device_opts(QemuOpts *opts, TPMBackend *tb)
-         }
-     }
- 
-+    tpm_passthrough_block_migration(tpm_pt);
- 
-     return 0;
- 
-@@ -766,10 +825,13 @@ static void tpm_passthrough_inst_init(Object *obj)
- 
-     qemu_mutex_init(&tpm_pt->state_lock);
-     qemu_cond_init(&tpm_pt->cmd_complete);
-+
-+    vmstate_register(NULL, -1, &vmstate_tpm_cuse, obj);
- }
- 
- static void tpm_passthrough_inst_finalize(Object *obj)
- {
-+    vmstate_unregister(NULL, &vmstate_tpm_cuse, obj);
- }
- 
- static void tpm_passthrough_class_init(ObjectClass *klass, void *data)
-@@ -802,6 +864,60 @@ static const char *tpm_passthrough_cuse_create_desc(void)
-     return "CUSE TPM backend driver";
- }
- 
-+static void tpm_cuse_pre_save(void *opaque)
-+{
-+    TPMPassthruState *tpm_pt = opaque;
-+    TPMBackend *tb = &tpm_pt->parent;
-+
-+     qemu_mutex_lock(&tpm_pt->state_lock);
-+     /* wait for TPM to finish processing */
-+     if (tpm_pt->tpm_busy) {
-+        qemu_cond_wait(&tpm_pt->cmd_complete, &tpm_pt->state_lock);
-+     }
-+     qemu_mutex_unlock(&tpm_pt->state_lock);
-+
-+    /* get the decrypted state blobs from the TPM */
-+    tpm_cuse_get_state_blobs(tb, TRUE, &tpm_pt->tpm_blobs);
-+}
-+
-+static int tpm_cuse_post_load(void *opaque,
-+                              int version_id __attribute__((unused)))
-+{
-+    TPMPassthruState *tpm_pt = opaque;
-+    TPMBackend *tb = &tpm_pt->parent;
-+
-+    return tpm_cuse_set_state_blobs(tb, &tpm_pt->tpm_blobs);
-+}
-+
-+static const VMStateDescription vmstate_tpm_cuse = {
-+    .name = "cuse-tpm",
-+    .version_id = 1,
-+    .minimum_version_id = 0,
-+    .minimum_version_id_old = 0,
-+    .pre_save  = tpm_cuse_pre_save,
-+    .post_load = tpm_cuse_post_load,
-+    .fields = (VMStateField[]) {
-+        VMSTATE_UINT32(tpm_blobs.permanent_flags, TPMPassthruState),
-+        VMSTATE_UINT32(tpm_blobs.permanent.size, TPMPassthruState),
-+        VMSTATE_VBUFFER_ALLOC_UINT32(tpm_blobs.permanent.buffer,
-+                                     TPMPassthruState, 1, NULL,
-+                                     tpm_blobs.permanent.size),
-+
-+        VMSTATE_UINT32(tpm_blobs.volatil_flags, TPMPassthruState),
-+        VMSTATE_UINT32(tpm_blobs.volatil.size, TPMPassthruState),
-+        VMSTATE_VBUFFER_ALLOC_UINT32(tpm_blobs.volatil.buffer,
-+                                     TPMPassthruState, 1, NULL,
-+                                     tpm_blobs.volatil.size),
-+
-+        VMSTATE_UINT32(tpm_blobs.savestate_flags, TPMPassthruState),
-+        VMSTATE_UINT32(tpm_blobs.savestate.size, TPMPassthruState),
-+        VMSTATE_VBUFFER_ALLOC_UINT32(tpm_blobs.savestate.buffer,
-+                                     TPMPassthruState, 1, NULL,
-+                                     tpm_blobs.savestate.size),
-+        VMSTATE_END_OF_LIST()
-+    }
-+};
-+
- static const TPMDriverOps tpm_cuse_driver = {
-     .type                     = TPM_TYPE_CUSE_TPM,
-     .opts                     = tpm_passthrough_cmdline_opts,
-diff --git a/hw/tpm/tpm_tis.c b/hw/tpm/tpm_tis.c
-index 14d9e83ea2..9b660cf737 100644
---- a/hw/tpm/tpm_tis.c
-+++ b/hw/tpm/tpm_tis.c
-@@ -368,6 +368,8 @@ static void tpm_tis_receive_bh(void *opaque)
-     TPMTISEmuState *tis = &s->s.tis;
-     uint8_t locty = s->locty_number;
- 
-+    tis->bh_scheduled = false;
-+
-     qemu_mutex_lock(&s->state_lock);
- 
-     tpm_tis_sts_set(&tis->loc[locty],
-@@ -415,6 +417,8 @@ static void tpm_tis_receive_cb(TPMState *s, uint8_t locty,
-     qemu_mutex_unlock(&s->state_lock);
- 
-     qemu_bh_schedule(tis->bh);
-+
-+    tis->bh_scheduled = true;
- }
- 
- /*
-@@ -1030,9 +1034,140 @@ static void tpm_tis_reset(DeviceState *dev)
-     tpm_tis_do_startup_tpm(s);
- }
- 
-+
-+/* persistent state handling */
-+
-+static void tpm_tis_pre_save(void *opaque)
-+{
-+    TPMState *s = opaque;
-+    TPMTISEmuState *tis = &s->s.tis;
-+    uint8_t locty = tis->active_locty;
-+
-+    DPRINTF("tpm_tis: suspend: locty = %d : r_offset = %d, w_offset = %d\n",
-+            locty, tis->loc[0].r_offset, tis->loc[0].w_offset);
-+#ifdef DEBUG_TIS
-+    tpm_tis_dump_state(opaque, 0);
-+#endif
-+
-+    qemu_mutex_lock(&s->state_lock);
-+
-+    /* wait for outstanding request to complete */
-+    if (TPM_TIS_IS_VALID_LOCTY(locty) &&
-+        tis->loc[locty].state == TPM_TIS_STATE_EXECUTION) {
-+        /*
-+         * If we get here when the bh is scheduled but did not run,
-+         * we won't get notified...
-+         */
-+        if (!tis->bh_scheduled) {
-+            /* backend thread to notify us */
-+            qemu_cond_wait(&s->cmd_complete, &s->state_lock);
-+        }
-+        if (tis->loc[locty].state == TPM_TIS_STATE_EXECUTION) {
-+            /* bottom half did not run - run its function */
-+            qemu_mutex_unlock(&s->state_lock);
-+            tpm_tis_receive_bh(opaque);
-+            qemu_mutex_lock(&s->state_lock);
-+        }
-+    }
-+
-+    qemu_mutex_unlock(&s->state_lock);
-+
-+    /* copy current active read or write buffer into the buffer
-+       written to disk */
-+    if (TPM_TIS_IS_VALID_LOCTY(locty)) {
-+        switch (tis->loc[locty].state) {
-+        case TPM_TIS_STATE_RECEPTION:
-+            memcpy(tis->buf,
-+                   tis->loc[locty].w_buffer.buffer,
-+                   MIN(sizeof(tis->buf),
-+                       tis->loc[locty].w_buffer.size));
-+            tis->offset = tis->loc[locty].w_offset;
-+        break;
-+        case TPM_TIS_STATE_COMPLETION:
-+            memcpy(tis->buf,
-+                   tis->loc[locty].r_buffer.buffer,
-+                   MIN(sizeof(tis->buf),
-+                       tis->loc[locty].r_buffer.size));
-+            tis->offset = tis->loc[locty].r_offset;
-+        break;
-+        default:
-+            /* leak nothing */
-+            memset(tis->buf, 0x0, sizeof(tis->buf));
-+        break;
-+        }
-+    }
-+}
-+
-+static int tpm_tis_post_load(void *opaque,
-+                             int version_id __attribute__((unused)))
-+{
-+    TPMState *s = opaque;
-+    TPMTISEmuState *tis = &s->s.tis;
-+
-+    uint8_t locty = tis->active_locty;
-+
-+    if (TPM_TIS_IS_VALID_LOCTY(locty)) {
-+        switch (tis->loc[locty].state) {
-+        case TPM_TIS_STATE_RECEPTION:
-+            memcpy(tis->loc[locty].w_buffer.buffer,
-+                   tis->buf,
-+                   MIN(sizeof(tis->buf),
-+                       tis->loc[locty].w_buffer.size));
-+            tis->loc[locty].w_offset = tis->offset;
-+        break;
-+        case TPM_TIS_STATE_COMPLETION:
-+            memcpy(tis->loc[locty].r_buffer.buffer,
-+                   tis->buf,
-+                   MIN(sizeof(tis->buf),
-+                       tis->loc[locty].r_buffer.size));
-+            tis->loc[locty].r_offset = tis->offset;
-+        break;
-+        default:
-+        break;
-+        }
-+    }
-+
-+    DPRINTF("tpm_tis: resume : locty = %d : r_offset = %d, w_offset = %d\n",
-+            locty, tis->loc[0].r_offset, tis->loc[0].w_offset);
-+
-+    return 0;
-+}
-+
-+static const VMStateDescription vmstate_locty = {
-+    .name = "loc",
-+    .version_id = 1,
-+    .minimum_version_id = 0,
-+    .minimum_version_id_old = 0,
-+    .fields      = (VMStateField[]) {
-+        VMSTATE_UINT32(state, TPMLocality),
-+        VMSTATE_UINT32(inte, TPMLocality),
-+        VMSTATE_UINT32(ints, TPMLocality),
-+        VMSTATE_UINT8(access, TPMLocality),
-+        VMSTATE_UINT32(sts, TPMLocality),
-+        VMSTATE_UINT32(iface_id, TPMLocality),
-+        VMSTATE_END_OF_LIST(),
-+    }
-+};
-+
- static const VMStateDescription vmstate_tpm_tis = {
-     .name = "tpm",
--    .unmigratable = 1,
-+    .version_id = 1,
-+    .minimum_version_id = 0,
-+    .minimum_version_id_old = 0,
-+    .pre_save  = tpm_tis_pre_save,
-+    .post_load = tpm_tis_post_load,
-+    .fields = (VMStateField[]) {
-+        VMSTATE_UINT32(s.tis.offset, TPMState),
-+        VMSTATE_BUFFER(s.tis.buf, TPMState),
-+        VMSTATE_UINT8(s.tis.active_locty, TPMState),
-+        VMSTATE_UINT8(s.tis.aborting_locty, TPMState),
-+        VMSTATE_UINT8(s.tis.next_locty, TPMState),
-+
-+        VMSTATE_STRUCT_ARRAY(s.tis.loc, TPMState, TPM_TIS_NUM_LOCALITIES, 1,
-+                             vmstate_locty, TPMLocality),
-+
-+        VMSTATE_END_OF_LIST()
-+    }
- };
- 
- static Property tpm_tis_properties[] = {
-diff --git a/hw/tpm/tpm_tis.h b/hw/tpm/tpm_tis.h
-index a1df41fa21..b7fc0ea1a9 100644
---- a/hw/tpm/tpm_tis.h
-+++ b/hw/tpm/tpm_tis.h
-@@ -54,6 +54,8 @@ typedef struct TPMLocality {
- 
- typedef struct TPMTISEmuState {
-     QEMUBH *bh;
-+    bool bh_scheduled; /* bh scheduled but did not run yet */
-+
-     uint32_t offset;
-     uint8_t buf[TPM_TIS_BUFFER_MAX];
- 
-diff --git a/hw/tpm/tpm_util.c b/hw/tpm/tpm_util.c
-index 7b35429725..b6ff74d946 100644
---- a/hw/tpm/tpm_util.c
-+++ b/hw/tpm/tpm_util.c
-@@ -22,6 +22,17 @@
- #include "qemu/osdep.h"
- #include "tpm_util.h"
- #include "tpm_int.h"
-+#include "tpm_ioctl.h"
-+#include "qemu/error-report.h"
-+
-+#define DEBUG_TPM 0
-+
-+#define DPRINTF(fmt, ...) do { \
-+    if (DEBUG_TPM) { \
-+        fprintf(stderr, fmt, ## __VA_ARGS__); \
-+    } \
-+} while (0)
-+
- 
- /*
-  * A basic test of a TPM device. We expect a well formatted response header
-@@ -125,3 +136,215 @@ int tpm_util_test_tpmdev(int tpm_fd, TPMVersion *tpm_version)
- 
-     return 1;
- }
-+
-+static void tpm_sized_buffer_reset(TPMSizedBuffer *tsb)
-+{
-+    g_free(tsb->buffer);
-+    tsb->buffer = NULL;
-+    tsb->size = 0;
-+}
-+
-+/*
-+ * Transfer a TPM state blob from the TPM into a provided buffer.
-+ *
-+ * @fd: file descriptor to talk to the CUSE TPM
-+ * @type: the type of blob to transfer
-+ * @decrypted_blob: whether we request to receive decrypted blobs
-+ * @tsb: the TPMSizeBuffer to fill with the blob
-+ * @flags: the flags to return to the caller
-+ */
-+static int tpm_util_cuse_get_state_blob(int fd,
-+                                        uint8_t type,
-+                                        bool decrypted_blob,
-+                                        TPMSizedBuffer *tsb,
-+                                        uint32_t *flags)
-+{
-+    ptm_getstate pgs;
-+    uint16_t offset = 0;
-+    ptm_res res;
-+    ssize_t n;
-+    size_t to_read;
-+
-+    tpm_sized_buffer_reset(tsb);
-+
-+    pgs.u.req.state_flags = (decrypted_blob) ? PTM_STATE_FLAG_DECRYPTED : 0;
-+    pgs.u.req.type = type;
-+    pgs.u.req.offset = offset;
-+
-+    if (ioctl(fd, PTM_GET_STATEBLOB, &pgs) < 0) {
-+        error_report("CUSE TPM PTM_GET_STATEBLOB ioctl failed: %s",
-+                     strerror(errno));
-+        goto err_exit;
-+    }
-+    res = pgs.u.resp.tpm_result;
-+    if (res != 0 && (res & 0x800) == 0) {
-+        error_report("Getting the stateblob (type %d) failed with a TPM "
-+                     "error 0x%x", type, res);
-+        goto err_exit;
-+    }
-+
-+    *flags = pgs.u.resp.state_flags;
-+
-+    tsb->buffer = g_malloc(pgs.u.resp.totlength);
-+    memcpy(tsb->buffer, pgs.u.resp.data, pgs.u.resp.length);
-+    tsb->size = pgs.u.resp.length;
-+
-+    /* if there are bytes left to get use read() interface */
-+    while (tsb->size < pgs.u.resp.totlength) {
-+        to_read = pgs.u.resp.totlength - tsb->size;
-+        if (unlikely(to_read > SSIZE_MAX)) {
-+            to_read = SSIZE_MAX;
-+        }
-+
-+        n = read(fd, &tsb->buffer[tsb->size], to_read);
-+        if (n != to_read) {
-+            error_report("Could not read stateblob (type %d) : %s",
-+                         type, strerror(errno));
-+            goto err_exit;
-+        }
-+        tsb->size += to_read;
-+    }
-+
-+    DPRINTF("tpm_util: got state blob type %d, %d bytes, flags 0x%08x, "
-+            "decrypted=%d\n", type, tsb->size, *flags, decrypted_blob);
-+
-+    return 0;
-+
-+err_exit:
-+    return 1;
-+}
-+
-+int tpm_util_cuse_get_state_blobs(int tpm_fd,
-+                                  bool decrypted_blobs,
-+                                  TPMBlobBuffers *tpm_blobs)
-+{
-+    if (tpm_util_cuse_get_state_blob(tpm_fd, PTM_BLOB_TYPE_PERMANENT,
-+                                     decrypted_blobs,
-+                                     &tpm_blobs->permanent,
-+                                     &tpm_blobs->permanent_flags) ||
-+       tpm_util_cuse_get_state_blob(tpm_fd, PTM_BLOB_TYPE_VOLATILE,
-+                                     decrypted_blobs,
-+                                     &tpm_blobs->volatil,
-+                                     &tpm_blobs->volatil_flags) ||
-+       tpm_util_cuse_get_state_blob(tpm_fd, PTM_BLOB_TYPE_SAVESTATE,
-+                                     decrypted_blobs,
-+                                     &tpm_blobs->savestate,
-+                                     &tpm_blobs->savestate_flags)) {
-+        goto err_exit;
-+    }
-+
-+    return 0;
-+
-+ err_exit:
-+    tpm_sized_buffer_reset(&tpm_blobs->volatil);
-+    tpm_sized_buffer_reset(&tpm_blobs->permanent);
-+    tpm_sized_buffer_reset(&tpm_blobs->savestate);
-+
-+    return 1;
-+}
-+
-+static int tpm_util_cuse_do_set_stateblob_ioctl(int fd,
-+                                                uint32_t flags,
-+                                                uint32_t type,
-+                                                uint32_t length)
-+{
-+    ptm_setstate pss;
-+
-+    pss.u.req.state_flags = flags;
-+    pss.u.req.type = type;
-+    pss.u.req.length = length;
-+
-+    if (ioctl(fd, PTM_SET_STATEBLOB, &pss) < 0) {
-+        error_report("CUSE TPM PTM_SET_STATEBLOB ioctl failed: %s",
-+                     strerror(errno));
-+        return 1;
-+    }
-+
-+    if (pss.u.resp.tpm_result != 0) {
-+        error_report("Setting the stateblob (type %d) failed with a TPM "
-+                     "error 0x%x", type, pss.u.resp.tpm_result);
-+        return 1;
-+    }
-+
-+    return 0;
-+}
-+
-+
-+/*
-+ * Transfer a TPM state blob to the CUSE TPM.
-+ *
-+ * @fd: file descriptor to talk to the CUSE TPM
-+ * @type: the type of TPM state blob to transfer
-+ * @tsb: TPMSizeBuffer containing the TPM state blob
-+ * @flags: Flags describing the (encryption) state of the TPM state blob
-+ */
-+static int tpm_util_cuse_set_state_blob(int fd,
-+                                        uint32_t type,
-+                                        TPMSizedBuffer *tsb,
-+                                        uint32_t flags)
-+{
-+    uint32_t offset = 0;
-+    ssize_t n;
-+    size_t to_write;
-+
-+    /* initiate the transfer to the CUSE TPM */
-+    if (tpm_util_cuse_do_set_stateblob_ioctl(fd, flags, type, 0)) {
-+        return 1;
-+    }
-+
-+    /* use the write() interface for transferring the state blob */
-+    while (offset < tsb->size) {
-+        to_write = tsb->size - offset;
-+        if (unlikely(to_write > SSIZE_MAX)) {
-+            to_write = SSIZE_MAX;
-+        }
-+
-+        n = write(fd, &tsb->buffer[offset], to_write);
-+        if (n != to_write) {
-+            error_report("Writing the stateblob (type %d) failed: %s",
-+                         type, strerror(errno));
-+            goto err_exit;
-+        }
-+        offset += to_write;
-+    }
-+
-+    /* inidicate that the transfer is finished */
-+    if (tpm_util_cuse_do_set_stateblob_ioctl(fd, flags, type, 0)) {
-+        goto err_exit;
-+    }
-+
-+    DPRINTF("tpm_util: set the state blob type %d, %d bytes, flags 0x%08x\n",
-+            type, tsb->size, flags);
-+
-+    return 0;
-+
-+err_exit:
-+    return 1;
-+}
-+
-+int tpm_util_cuse_set_state_blobs(int tpm_fd,
-+                                  TPMBlobBuffers *tpm_blobs)
-+{
-+    ptm_res res;
-+
-+    if (ioctl(tpm_fd, PTM_STOP, &res) < 0) {
-+        error_report("tpm_passthrough: Could not stop "
-+                     "the CUSE TPM: %s (%i)",
-+                     strerror(errno), errno);
-+        return 1;
-+    }
-+
-+    if (tpm_util_cuse_set_state_blob(tpm_fd, PTM_BLOB_TYPE_PERMANENT,
-+                                     &tpm_blobs->permanent,
-+                                     tpm_blobs->permanent_flags) ||
-+        tpm_util_cuse_set_state_blob(tpm_fd, PTM_BLOB_TYPE_VOLATILE,
-+                                     &tpm_blobs->volatil,
-+                                     tpm_blobs->volatil_flags) ||
-+        tpm_util_cuse_set_state_blob(tpm_fd, PTM_BLOB_TYPE_SAVESTATE,
-+                                     &tpm_blobs->savestate,
-+                                     tpm_blobs->savestate_flags)) {
-+        return 1;
-+    }
-+
-+    return 0;
-+}
-diff --git a/hw/tpm/tpm_util.h b/hw/tpm/tpm_util.h
-index df76245e6e..c24071d812 100644
---- a/hw/tpm/tpm_util.h
-+++ b/hw/tpm/tpm_util.h
-@@ -26,4 +26,11 @@
- 
- int tpm_util_test_tpmdev(int tpm_fd, TPMVersion *tpm_version);
- 
-+int tpm_util_cuse_get_state_blobs(int tpm_fd,
-+                                  bool decrypted_blobs,
-+                                  TPMBlobBuffers *tpm_blobs);
-+
-+int tpm_util_cuse_set_state_blobs(int tpm_fd,
-+                                  TPMBlobBuffers *tpm_blobs);
-+
- #endif /* TPM_TPM_UTIL_H */
-diff --git a/include/sysemu/tpm_backend.h b/include/sysemu/tpm_backend.h
-index b58f52d39f..3403821b9d 100644
---- a/include/sysemu/tpm_backend.h
-+++ b/include/sysemu/tpm_backend.h
-@@ -62,6 +62,18 @@ typedef struct TPMSizedBuffer {
-     uint8_t  *buffer;
- } TPMSizedBuffer;
- 
-+/* blobs from the TPM; part of VM state when migrating */
-+typedef struct TPMBlobBuffers {
-+    uint32_t permanent_flags;
-+    TPMSizedBuffer permanent;
-+
-+    uint32_t volatil_flags;
-+    TPMSizedBuffer volatil;
-+
-+    uint32_t savestate_flags;
-+    TPMSizedBuffer savestate;
-+} TPMBlobBuffers;
-+
- struct TPMDriverOps {
-     enum TpmType type;
-     const QemuOptDesc *opts;
--- 
-2.11.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/0004-tpm-backend-Move-thread-handling-inside-TPMBackend.patch b/meta/recipes-devtools/qemu/qemu/0004-tpm-backend-Move-thread-handling-inside-TPMBackend.patch
new file mode 100644
index 0000000..64e88b6
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0004-tpm-backend-Move-thread-handling-inside-TPMBackend.patch
@@ -0,0 +1,417 @@
+From 5767322022d54ceb5a2ed6c650f667a4d24aa150 Mon Sep 17 00:00:00 2001
+From: Amarnath Valluri <amarnath.valluri@intel.com>
+Date: Thu, 30 Mar 2017 16:20:25 +0300
+Subject: [PATCH 04/12] tpm-backend: Move thread handling inside TPMBackend
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Move thread handling inside TPMBackend, this way backend implementations need
+not to maintain their own thread life cycle, instead they needs to implement
+'handle_request()' class method that always been called from a thread.
+
+This change made tpm_backend_int.h kind of useless, hence removed it.
+
+Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
+Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
+Reviewed-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
+
+Upstream-Status: Backport [b19a5eea5a26e9bd83a48c742172d2a6aa8c4180]
+---
+ backends/tpm.c                   | 62 +++++++++++++++++++++++++---------------
+ hw/tpm/tpm_passthrough.c         | 58 ++++++-------------------------------
+ include/sysemu/tpm_backend.h     | 32 +++++++++++++--------
+ include/sysemu/tpm_backend_int.h | 41 --------------------------
+ 4 files changed, 67 insertions(+), 126 deletions(-)
+ delete mode 100644 include/sysemu/tpm_backend_int.h
+
+diff --git a/backends/tpm.c b/backends/tpm.c
+index 536f262bb7..ce56c3b74d 100644
+--- a/backends/tpm.c
++++ b/backends/tpm.c
+@@ -18,7 +18,24 @@
+ #include "qapi/qmp/qerror.h"
+ #include "sysemu/tpm.h"
+ #include "qemu/thread.h"
+-#include "sysemu/tpm_backend_int.h"
++
++static void tpm_backend_worker_thread(gpointer data, gpointer user_data)
++{
++    TPMBackend *s = TPM_BACKEND(user_data);
++    TPMBackendClass *k  = TPM_BACKEND_GET_CLASS(s);
++
++    assert(k->handle_request != NULL);
++    k->handle_request(s, (TPMBackendCmd)data);
++}
++
++static void tpm_backend_thread_end(TPMBackend *s)
++{
++    if (s->thread_pool) {
++        g_thread_pool_push(s->thread_pool, (gpointer)TPM_BACKEND_CMD_END, NULL);
++        g_thread_pool_free(s->thread_pool, FALSE, TRUE);
++        s->thread_pool = NULL;
++    }
++}
+ 
+ enum TpmType tpm_backend_get_type(TPMBackend *s)
+ {
+@@ -39,6 +56,8 @@ void tpm_backend_destroy(TPMBackend *s)
+     TPMBackendClass *k = TPM_BACKEND_GET_CLASS(s);
+ 
+     k->ops->destroy(s);
++
++    tpm_backend_thread_end(s);
+ }
+ 
+ int tpm_backend_init(TPMBackend *s, TPMState *state,
+@@ -46,13 +65,23 @@ int tpm_backend_init(TPMBackend *s, TPMState *state,
+ {
+     TPMBackendClass *k = TPM_BACKEND_GET_CLASS(s);
+ 
+-    return k->ops->init(s, state, datacb);
++    s->tpm_state = state;
++    s->recv_data_callback = datacb;
++
++    return k->ops->init(s);
+ }
+ 
+ int tpm_backend_startup_tpm(TPMBackend *s)
+ {
+     TPMBackendClass *k = TPM_BACKEND_GET_CLASS(s);
+ 
++    /* terminate a running TPM */
++    tpm_backend_thread_end(s);
++
++    s->thread_pool = g_thread_pool_new(tpm_backend_worker_thread, s, 1, TRUE,
++                                       NULL);
++    g_thread_pool_push(s->thread_pool, (gpointer)TPM_BACKEND_CMD_INIT, NULL);
++
+     return k->ops->startup_tpm(s);
+ }
+ 
+@@ -72,9 +101,8 @@ size_t tpm_backend_realloc_buffer(TPMBackend *s, TPMSizedBuffer *sb)
+ 
+ void tpm_backend_deliver_request(TPMBackend *s)
+ {
+-    TPMBackendClass *k = TPM_BACKEND_GET_CLASS(s);
+-
+-    k->ops->deliver_request(s);
++    g_thread_pool_push(s->thread_pool, (gpointer)TPM_BACKEND_CMD_PROCESS_CMD,
++                       NULL);
+ }
+ 
+ void tpm_backend_reset(TPMBackend *s)
+@@ -82,6 +110,8 @@ void tpm_backend_reset(TPMBackend *s)
+     TPMBackendClass *k = TPM_BACKEND_GET_CLASS(s);
+ 
+     k->ops->reset(s);
++
++    tpm_backend_thread_end(s);
+ }
+ 
+ void tpm_backend_cancel_cmd(TPMBackend *s)
+@@ -156,29 +186,14 @@ static void tpm_backend_instance_init(Object *obj)
+                              tpm_backend_prop_get_opened,
+                              tpm_backend_prop_set_opened,
+                              NULL);
+-}
+ 
+-void tpm_backend_thread_deliver_request(TPMBackendThread *tbt)
+-{
+-   g_thread_pool_push(tbt->pool, (gpointer)TPM_BACKEND_CMD_PROCESS_CMD, NULL);
+ }
+ 
+-void tpm_backend_thread_create(TPMBackendThread *tbt,
+-                               GFunc func, gpointer user_data)
++static void tpm_backend_instance_finalize(Object *obj)
+ {
+-    if (!tbt->pool) {
+-        tbt->pool = g_thread_pool_new(func, user_data, 1, TRUE, NULL);
+-        g_thread_pool_push(tbt->pool, (gpointer)TPM_BACKEND_CMD_INIT, NULL);
+-    }
+-}
++    TPMBackend *s = TPM_BACKEND(obj);
+ 
+-void tpm_backend_thread_end(TPMBackendThread *tbt)
+-{
+-    if (tbt->pool) {
+-        g_thread_pool_push(tbt->pool, (gpointer)TPM_BACKEND_CMD_END, NULL);
+-        g_thread_pool_free(tbt->pool, FALSE, TRUE);
+-        tbt->pool = NULL;
+-    }
++    tpm_backend_thread_end(s);
+ }
+ 
+ static const TypeInfo tpm_backend_info = {
+@@ -186,6 +201,7 @@ static const TypeInfo tpm_backend_info = {
+     .parent = TYPE_OBJECT,
+     .instance_size = sizeof(TPMBackend),
+     .instance_init = tpm_backend_instance_init,
++    .instance_finalize = tpm_backend_instance_finalize,
+     .class_size = sizeof(TPMBackendClass),
+     .abstract = true,
+ };
+diff --git a/hw/tpm/tpm_passthrough.c b/hw/tpm/tpm_passthrough.c
+index a0baf5f080..f50d9cffd7 100644
+--- a/hw/tpm/tpm_passthrough.c
++++ b/hw/tpm/tpm_passthrough.c
+@@ -30,7 +30,6 @@
+ #include "tpm_int.h"
+ #include "hw/hw.h"
+ #include "hw/i386/pc.h"
+-#include "sysemu/tpm_backend_int.h"
+ #include "tpm_tis.h"
+ #include "tpm_util.h"
+ 
+@@ -47,20 +46,9 @@
+     OBJECT_CHECK(TPMPassthruState, (obj), TYPE_TPM_PASSTHROUGH)
+ 
+ /* data structures */
+-typedef struct TPMPassthruThreadParams {
+-    TPMState *tpm_state;
+-
+-    TPMRecvDataCB *recv_data_callback;
+-    TPMBackend *tb;
+-} TPMPassthruThreadParams;
+-
+ struct TPMPassthruState {
+     TPMBackend parent;
+ 
+-    TPMBackendThread tbt;
+-
+-    TPMPassthruThreadParams tpm_thread_params;
+-
+     char *tpm_dev;
+     int tpm_fd;
+     bool tpm_executing;
+@@ -214,12 +202,9 @@ static int tpm_passthrough_unix_transfer(TPMPassthruState *tpm_pt,
+                                         selftest_done);
+ }
+ 
+-static void tpm_passthrough_worker_thread(gpointer data,
+-                                          gpointer user_data)
++static void tpm_passthrough_handle_request(TPMBackend *tb, TPMBackendCmd cmd)
+ {
+-    TPMPassthruThreadParams *thr_parms = user_data;
+-    TPMPassthruState *tpm_pt = TPM_PASSTHROUGH(thr_parms->tb);
+-    TPMBackendCmd cmd = (TPMBackendCmd)data;
++    TPMPassthruState *tpm_pt = TPM_PASSTHROUGH(tb);
+     bool selftest_done = false;
+ 
+     DPRINTF("tpm_passthrough: processing command type %d\n", cmd);
+@@ -227,12 +212,12 @@ static void tpm_passthrough_worker_thread(gpointer data,
+     switch (cmd) {
+     case TPM_BACKEND_CMD_PROCESS_CMD:
+         tpm_passthrough_unix_transfer(tpm_pt,
+-                                      thr_parms->tpm_state->locty_data,
++                                      tb->tpm_state->locty_data,
+                                       &selftest_done);
+ 
+-        thr_parms->recv_data_callback(thr_parms->tpm_state,
+-                                      thr_parms->tpm_state->locty_number,
+-                                      selftest_done);
++        tb->recv_data_callback(tb->tpm_state,
++                               tb->tpm_state->locty_number,
++                               selftest_done);
+         break;
+     case TPM_BACKEND_CMD_INIT:
+     case TPM_BACKEND_CMD_END:
+@@ -248,15 +233,6 @@ static void tpm_passthrough_worker_thread(gpointer data,
+  */
+ static int tpm_passthrough_startup_tpm(TPMBackend *tb)
+ {
+-    TPMPassthruState *tpm_pt = TPM_PASSTHROUGH(tb);
+-
+-    /* terminate a running TPM */
+-    tpm_backend_thread_end(&tpm_pt->tbt);
+-
+-    tpm_backend_thread_create(&tpm_pt->tbt,
+-                              tpm_passthrough_worker_thread,
+-                              &tpm_pt->tpm_thread_params);
+-
+     return 0;
+ }
+ 
+@@ -268,20 +244,11 @@ static void tpm_passthrough_reset(TPMBackend *tb)
+ 
+     tpm_passthrough_cancel_cmd(tb);
+ 
+-    tpm_backend_thread_end(&tpm_pt->tbt);
+-
+     tpm_pt->had_startup_error = false;
+ }
+ 
+-static int tpm_passthrough_init(TPMBackend *tb, TPMState *s,
+-                                TPMRecvDataCB *recv_data_cb)
++static int tpm_passthrough_init(TPMBackend *tb)
+ {
+-    TPMPassthruState *tpm_pt = TPM_PASSTHROUGH(tb);
+-
+-    tpm_pt->tpm_thread_params.tpm_state = s;
+-    tpm_pt->tpm_thread_params.recv_data_callback = recv_data_cb;
+-    tpm_pt->tpm_thread_params.tb = tb;
+-
+     return 0;
+ }
+ 
+@@ -315,13 +282,6 @@ static size_t tpm_passthrough_realloc_buffer(TPMSizedBuffer *sb)
+     return sb->size;
+ }
+ 
+-static void tpm_passthrough_deliver_request(TPMBackend *tb)
+-{
+-    TPMPassthruState *tpm_pt = TPM_PASSTHROUGH(tb);
+-
+-    tpm_backend_thread_deliver_request(&tpm_pt->tbt);
+-}
+-
+ static void tpm_passthrough_cancel_cmd(TPMBackend *tb)
+ {
+     TPMPassthruState *tpm_pt = TPM_PASSTHROUGH(tb);
+@@ -483,8 +443,6 @@ static void tpm_passthrough_destroy(TPMBackend *tb)
+ 
+     tpm_passthrough_cancel_cmd(tb);
+ 
+-    tpm_backend_thread_end(&tpm_pt->tbt);
+-
+     qemu_close(tpm_pt->tpm_fd);
+     qemu_close(tpm_pt->cancel_fd);
+ 
+@@ -520,7 +478,6 @@ static const TPMDriverOps tpm_passthrough_driver = {
+     .realloc_buffer           = tpm_passthrough_realloc_buffer,
+     .reset                    = tpm_passthrough_reset,
+     .had_startup_error        = tpm_passthrough_get_startup_error,
+-    .deliver_request          = tpm_passthrough_deliver_request,
+     .cancel_cmd               = tpm_passthrough_cancel_cmd,
+     .get_tpm_established_flag = tpm_passthrough_get_tpm_established_flag,
+     .reset_tpm_established_flag = tpm_passthrough_reset_tpm_established_flag,
+@@ -540,6 +497,7 @@ static void tpm_passthrough_class_init(ObjectClass *klass, void *data)
+     TPMBackendClass *tbc = TPM_BACKEND_CLASS(klass);
+ 
+     tbc->ops = &tpm_passthrough_driver;
++    tbc->handle_request = tpm_passthrough_handle_request;
+ }
+ 
+ static const TypeInfo tpm_passthrough_info = {
+diff --git a/include/sysemu/tpm_backend.h b/include/sysemu/tpm_backend.h
+index 3708413035..58308b3687 100644
+--- a/include/sysemu/tpm_backend.h
++++ b/include/sysemu/tpm_backend.h
+@@ -29,22 +29,24 @@
+ 
+ typedef struct TPMBackendClass TPMBackendClass;
+ typedef struct TPMBackend TPMBackend;
+-
+ typedef struct TPMDriverOps TPMDriverOps;
++typedef void (TPMRecvDataCB)(TPMState *, uint8_t locty, bool selftest_done);
+ 
+-struct TPMBackendClass {
+-    ObjectClass parent_class;
+-
+-    const TPMDriverOps *ops;
+-
+-    void (*opened)(TPMBackend *s, Error **errp);
+-};
++typedef enum TPMBackendCmd {
++    TPM_BACKEND_CMD_INIT = 1,
++    TPM_BACKEND_CMD_PROCESS_CMD,
++    TPM_BACKEND_CMD_END,
++    TPM_BACKEND_CMD_TPM_RESET,
++} TPMBackendCmd;
+ 
+ struct TPMBackend {
+     Object parent;
+ 
+     /*< protected >*/
+     bool opened;
++    TPMState *tpm_state;
++    GThreadPool *thread_pool;
++    TPMRecvDataCB *recv_data_callback;
+ 
+     char *id;
+     enum TpmModel fe_model;
+@@ -54,7 +56,15 @@ struct TPMBackend {
+     QLIST_ENTRY(TPMBackend) list;
+ };
+ 
+-typedef void (TPMRecvDataCB)(TPMState *, uint8_t locty, bool selftest_done);
++struct TPMBackendClass {
++    ObjectClass parent_class;
++
++    const TPMDriverOps *ops;
++
++    void (*opened)(TPMBackend *s, Error **errp);
++
++    void (*handle_request)(TPMBackend *s, TPMBackendCmd cmd);
++};
+ 
+ typedef struct TPMSizedBuffer {
+     uint32_t size;
+@@ -71,7 +81,7 @@ struct TPMDriverOps {
+     void (*destroy)(TPMBackend *t);
+ 
+     /* initialize the backend */
+-    int (*init)(TPMBackend *t, TPMState *s, TPMRecvDataCB *datacb);
++    int (*init)(TPMBackend *t);
+     /* start up the TPM on the backend */
+     int (*startup_tpm)(TPMBackend *t);
+     /* returns true if nothing will ever answer TPM requests */
+@@ -79,8 +89,6 @@ struct TPMDriverOps {
+ 
+     size_t (*realloc_buffer)(TPMSizedBuffer *sb);
+ 
+-    void (*deliver_request)(TPMBackend *t);
+-
+     void (*reset)(TPMBackend *t);
+ 
+     void (*cancel_cmd)(TPMBackend *t);
+diff --git a/include/sysemu/tpm_backend_int.h b/include/sysemu/tpm_backend_int.h
+deleted file mode 100644
+index 00639dd7de..0000000000
+--- a/include/sysemu/tpm_backend_int.h
++++ /dev/null
+@@ -1,41 +0,0 @@
+-/*
+- *  common TPM backend driver functions
+- *
+- *  Copyright (c) 2012-2013 IBM Corporation
+- *  Authors:
+- *    Stefan Berger <stefanb@us.ibm.com>
+- *
+- * This library is free software; you can redistribute it and/or
+- * modify it under the terms of the GNU Lesser General Public
+- * License as published by the Free Software Foundation; either
+- * version 2 of the License, or (at your option) any later version.
+- *
+- * This library is distributed in the hope that it will be useful,
+- * but WITHOUT ANY WARRANTY; without even the implied warranty of
+- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+- * Lesser General Public License for more details.
+- *
+- * You should have received a copy of the GNU Lesser General Public
+- * License along with this library; if not, see <http://www.gnu.org/licenses/>
+- */
+-
+-#ifndef TPM_BACKEND_INT_H
+-#define TPM_BACKEND_INT_H
+-
+-typedef struct TPMBackendThread {
+-    GThreadPool *pool;
+-} TPMBackendThread;
+-
+-void tpm_backend_thread_deliver_request(TPMBackendThread *tbt);
+-void tpm_backend_thread_create(TPMBackendThread *tbt,
+-                               GFunc func, gpointer user_data);
+-void tpm_backend_thread_end(TPMBackendThread *tbt);
+-
+-typedef enum TPMBackendCmd {
+-    TPM_BACKEND_CMD_INIT = 1,
+-    TPM_BACKEND_CMD_PROCESS_CMD,
+-    TPM_BACKEND_CMD_END,
+-    TPM_BACKEND_CMD_TPM_RESET,
+-} TPMBackendCmd;
+-
+-#endif /* TPM_BACKEND_INT_H */
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/qemu/qemu/0005-tpm-backend-Initialize-and-free-data-members-in-it-s.patch b/meta/recipes-devtools/qemu/qemu/0005-tpm-backend-Initialize-and-free-data-members-in-it-s.patch
new file mode 100644
index 0000000..91dd542
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0005-tpm-backend-Initialize-and-free-data-members-in-it-s.patch
@@ -0,0 +1,185 @@
+From 83ef052c60de271a97abb7eb9b5a8aeee52659e6 Mon Sep 17 00:00:00 2001
+From: Amarnath Valluri <amarnath.valluri@intel.com>
+Date: Fri, 31 Mar 2017 10:58:11 +0300
+Subject: [PATCH 05/12] tpm-backend: Initialize and free data members in it's
+ own methods
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Initialize and free TPMBackend data members in it's own instance_init() and
+instance_finalize methods.
+
+Took the opportunity to remove unneeded destroy() method from TpmDriverOps
+interface as TPMBackend is a Qemu Object, we can use object_unref() inplace of
+tpm_backend_destroy() to free the backend object, hence removed destroy() from
+TPMDriverOps interface.
+
+Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
+Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
+Reviewed-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
+
+Upstream-Status: Backport [f35fe5cb97bbdaa6a6967f2fefc3fc1f79680601]
+---
+ backends/tpm.c               | 16 ++++++----------
+ hw/tpm/tpm_passthrough.c     | 31 ++++++++++++-------------------
+ include/sysemu/tpm_backend.h |  7 -------
+ tpm.c                        |  2 +-
+ 4 files changed, 19 insertions(+), 37 deletions(-)
+
+diff --git a/backends/tpm.c b/backends/tpm.c
+index ce56c3b74d..cf5abf1582 100644
+--- a/backends/tpm.c
++++ b/backends/tpm.c
+@@ -51,15 +51,6 @@ const char *tpm_backend_get_desc(TPMBackend *s)
+     return k->ops->desc();
+ }
+ 
+-void tpm_backend_destroy(TPMBackend *s)
+-{
+-    TPMBackendClass *k = TPM_BACKEND_GET_CLASS(s);
+-
+-    k->ops->destroy(s);
+-
+-    tpm_backend_thread_end(s);
+-}
+-
+ int tpm_backend_init(TPMBackend *s, TPMState *state,
+                      TPMRecvDataCB *datacb)
+ {
+@@ -182,17 +173,22 @@ static void tpm_backend_prop_set_opened(Object *obj, bool value, Error **errp)
+ 
+ static void tpm_backend_instance_init(Object *obj)
+ {
++    TPMBackend *s = TPM_BACKEND(obj);
++
+     object_property_add_bool(obj, "opened",
+                              tpm_backend_prop_get_opened,
+                              tpm_backend_prop_set_opened,
+                              NULL);
+-
++    s->fe_model = -1;
+ }
+ 
+ static void tpm_backend_instance_finalize(Object *obj)
+ {
+     TPMBackend *s = TPM_BACKEND(obj);
+ 
++    g_free(s->id);
++    g_free(s->path);
++    g_free(s->cancel_path);
+     tpm_backend_thread_end(s);
+ }
+ 
+diff --git a/hw/tpm/tpm_passthrough.c b/hw/tpm/tpm_passthrough.c
+index f50d9cffd7..815a72ef9a 100644
+--- a/hw/tpm/tpm_passthrough.c
++++ b/hw/tpm/tpm_passthrough.c
+@@ -417,8 +417,6 @@ static TPMBackend *tpm_passthrough_create(QemuOpts *opts, const char *id)
+     TPMPassthruState *tpm_pt = TPM_PASSTHROUGH(tb);
+ 
+     tb->id = g_strdup(id);
+-    /* let frontend set the fe_model to proper value */
+-    tb->fe_model = -1;
+ 
+     if (tpm_passthrough_handle_device_opts(opts, tb)) {
+         goto err_exit;
+@@ -432,26 +430,11 @@ static TPMBackend *tpm_passthrough_create(QemuOpts *opts, const char *id)
+     return tb;
+ 
+ err_exit:
+-    g_free(tb->id);
++    object_unref(obj);
+ 
+     return NULL;
+ }
+ 
+-static void tpm_passthrough_destroy(TPMBackend *tb)
+-{
+-    TPMPassthruState *tpm_pt = TPM_PASSTHROUGH(tb);
+-
+-    tpm_passthrough_cancel_cmd(tb);
+-
+-    qemu_close(tpm_pt->tpm_fd);
+-    qemu_close(tpm_pt->cancel_fd);
+-
+-    g_free(tb->id);
+-    g_free(tb->path);
+-    g_free(tb->cancel_path);
+-    g_free(tpm_pt->tpm_dev);
+-}
+-
+ static const QemuOptDesc tpm_passthrough_cmdline_opts[] = {
+     TPM_STANDARD_CMDLINE_OPTS,
+     {
+@@ -472,7 +455,6 @@ static const TPMDriverOps tpm_passthrough_driver = {
+     .opts                     = tpm_passthrough_cmdline_opts,
+     .desc                     = tpm_passthrough_create_desc,
+     .create                   = tpm_passthrough_create,
+-    .destroy                  = tpm_passthrough_destroy,
+     .init                     = tpm_passthrough_init,
+     .startup_tpm              = tpm_passthrough_startup_tpm,
+     .realloc_buffer           = tpm_passthrough_realloc_buffer,
+@@ -486,10 +468,21 @@ static const TPMDriverOps tpm_passthrough_driver = {
+ 
+ static void tpm_passthrough_inst_init(Object *obj)
+ {
++    TPMPassthruState *tpm_pt = TPM_PASSTHROUGH(obj);
++
++    tpm_pt->tpm_fd = -1;
++    tpm_pt->cancel_fd = -1;
+ }
+ 
+ static void tpm_passthrough_inst_finalize(Object *obj)
+ {
++    TPMPassthruState *tpm_pt = TPM_PASSTHROUGH(obj);
++
++    tpm_passthrough_cancel_cmd(TPM_BACKEND(obj));
++
++    qemu_close(tpm_pt->tpm_fd);
++    qemu_close(tpm_pt->cancel_fd);
++    g_free(tpm_pt->tpm_dev);
+ }
+ 
+ static void tpm_passthrough_class_init(ObjectClass *klass, void *data)
+diff --git a/include/sysemu/tpm_backend.h b/include/sysemu/tpm_backend.h
+index 58308b3687..202ec8d5a2 100644
+--- a/include/sysemu/tpm_backend.h
++++ b/include/sysemu/tpm_backend.h
+@@ -78,7 +78,6 @@ struct TPMDriverOps {
+     const char *(*desc)(void);
+ 
+     TPMBackend *(*create)(QemuOpts *opts, const char *id);
+-    void (*destroy)(TPMBackend *t);
+ 
+     /* initialize the backend */
+     int (*init)(TPMBackend *t);
+@@ -118,12 +117,6 @@ enum TpmType tpm_backend_get_type(TPMBackend *s);
+ const char *tpm_backend_get_desc(TPMBackend *s);
+ 
+ /**
+- * tpm_backend_destroy:
+- * @s: the backend to destroy
+- */
+-void tpm_backend_destroy(TPMBackend *s);
+-
+-/**
+  * tpm_backend_init:
+  * @s: the backend to initialized
+  * @state: TPMState
+diff --git a/tpm.c b/tpm.c
+index b7166ca200..7feb3b43c9 100644
+--- a/tpm.c
++++ b/tpm.c
+@@ -158,7 +158,7 @@ void tpm_cleanup(void)
+ 
+     QLIST_FOREACH_SAFE(drv, &tpm_backends, list, next) {
+         QLIST_REMOVE(drv, list);
+-        tpm_backend_destroy(drv);
++        object_unref(OBJECT(drv));
+     }
+ }
+ 
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/qemu/qemu/0006-tpm-backend-Made-few-interface-methods-optional.patch b/meta/recipes-devtools/qemu/qemu/0006-tpm-backend-Made-few-interface-methods-optional.patch
new file mode 100644
index 0000000..eb456f0
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0006-tpm-backend-Made-few-interface-methods-optional.patch
@@ -0,0 +1,284 @@
+From 47e6ef6586401e82e652f3c013a349bba3a0479b Mon Sep 17 00:00:00 2001
+From: Amarnath Valluri <amarnath.valluri@intel.com>
+Date: Thu, 30 Mar 2017 18:04:16 +0300
+Subject: [PATCH 06/12] tpm-backend: Made few interface methods optional
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This allows backend implementations left optional interface methods.
+For mandatory methods assertion checks added.
+
+Took the opportunity to remove unused methods:
+ - tpm_backend_get_desc()
+ - TPMDriverOps->handle_startup_error
+
+Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
+Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
+Reviewed-by: Stefan Berger<stefanb@linux.vnet.ibm.com>
+
+Upstream-Status: Backport [93330cf542b920b6ea5fea8120a08b76bb353113]
+---
+ backends/tpm.c               | 39 ++++++++++++++++++++++++---------------
+ hw/tpm/tpm_passthrough.c     | 36 +-----------------------------------
+ include/sysemu/tpm_backend.h | 13 ++-----------
+ tpm.c                        |  2 +-
+ 4 files changed, 28 insertions(+), 62 deletions(-)
+
+diff --git a/backends/tpm.c b/backends/tpm.c
+index cf5abf1582..8911597fab 100644
+--- a/backends/tpm.c
++++ b/backends/tpm.c
+@@ -44,13 +44,6 @@ enum TpmType tpm_backend_get_type(TPMBackend *s)
+     return k->ops->type;
+ }
+ 
+-const char *tpm_backend_get_desc(TPMBackend *s)
+-{
+-    TPMBackendClass *k = TPM_BACKEND_GET_CLASS(s);
+-
+-    return k->ops->desc();
+-}
+-
+ int tpm_backend_init(TPMBackend *s, TPMState *state,
+                      TPMRecvDataCB *datacb)
+ {
+@@ -58,12 +51,14 @@ int tpm_backend_init(TPMBackend *s, TPMState *state,
+ 
+     s->tpm_state = state;
+     s->recv_data_callback = datacb;
++    s->had_startup_error = false;
+ 
+-    return k->ops->init(s);
++    return k->ops->init ? k->ops->init(s) : 0;
+ }
+ 
+ int tpm_backend_startup_tpm(TPMBackend *s)
+ {
++    int res = 0;
+     TPMBackendClass *k = TPM_BACKEND_GET_CLASS(s);
+ 
+     /* terminate a running TPM */
+@@ -73,20 +68,24 @@ int tpm_backend_startup_tpm(TPMBackend *s)
+                                        NULL);
+     g_thread_pool_push(s->thread_pool, (gpointer)TPM_BACKEND_CMD_INIT, NULL);
+ 
+-    return k->ops->startup_tpm(s);
++    res = k->ops->startup_tpm ? k->ops->startup_tpm(s) : 0;
++
++    s->had_startup_error = (res != 0);
++
++    return res;
+ }
+ 
+ bool tpm_backend_had_startup_error(TPMBackend *s)
+ {
+-    TPMBackendClass *k = TPM_BACKEND_GET_CLASS(s);
+-
+-    return k->ops->had_startup_error(s);
++    return s->had_startup_error;
+ }
+ 
+ size_t tpm_backend_realloc_buffer(TPMBackend *s, TPMSizedBuffer *sb)
+ {
+     TPMBackendClass *k = TPM_BACKEND_GET_CLASS(s);
+ 
++    assert(k->ops->realloc_buffer);
++
+     return k->ops->realloc_buffer(sb);
+ }
+ 
+@@ -100,15 +99,21 @@ void tpm_backend_reset(TPMBackend *s)
+ {
+     TPMBackendClass *k = TPM_BACKEND_GET_CLASS(s);
+ 
+-    k->ops->reset(s);
++    if (k->ops->reset) {
++        k->ops->reset(s);
++    }
+ 
+     tpm_backend_thread_end(s);
++
++    s->had_startup_error = false;
+ }
+ 
+ void tpm_backend_cancel_cmd(TPMBackend *s)
+ {
+     TPMBackendClass *k = TPM_BACKEND_GET_CLASS(s);
+ 
++    assert(k->ops->cancel_cmd);
++
+     k->ops->cancel_cmd(s);
+ }
+ 
+@@ -116,20 +121,24 @@ bool tpm_backend_get_tpm_established_flag(TPMBackend *s)
+ {
+     TPMBackendClass *k = TPM_BACKEND_GET_CLASS(s);
+ 
+-    return k->ops->get_tpm_established_flag(s);
++    return k->ops->get_tpm_established_flag ?
++           k->ops->get_tpm_established_flag(s) : false;
+ }
+ 
+ int tpm_backend_reset_tpm_established_flag(TPMBackend *s, uint8_t locty)
+ {
+     TPMBackendClass *k = TPM_BACKEND_GET_CLASS(s);
+ 
+-    return k->ops->reset_tpm_established_flag(s, locty);
++    return k->ops->reset_tpm_established_flag ?
++           k->ops->reset_tpm_established_flag(s, locty) : 0;
+ }
+ 
+ TPMVersion tpm_backend_get_tpm_version(TPMBackend *s)
+ {
+     TPMBackendClass *k = TPM_BACKEND_GET_CLASS(s);
+ 
++    assert(k->ops->get_tpm_version);
++
+     return k->ops->get_tpm_version(s);
+ }
+ 
+diff --git a/hw/tpm/tpm_passthrough.c b/hw/tpm/tpm_passthrough.c
+index 815a72ef9a..4c21e52b7c 100644
+--- a/hw/tpm/tpm_passthrough.c
++++ b/hw/tpm/tpm_passthrough.c
+@@ -54,7 +54,6 @@ struct TPMPassthruState {
+     bool tpm_executing;
+     bool tpm_op_canceled;
+     int cancel_fd;
+-    bool had_startup_error;
+ 
+     TPMVersion tpm_version;
+ };
+@@ -227,29 +226,11 @@ static void tpm_passthrough_handle_request(TPMBackend *tb, TPMBackendCmd cmd)
+     }
+ }
+ 
+-/*
+- * Start the TPM (thread). If it had been started before, then terminate
+- * and start it again.
+- */
+-static int tpm_passthrough_startup_tpm(TPMBackend *tb)
+-{
+-    return 0;
+-}
+-
+ static void tpm_passthrough_reset(TPMBackend *tb)
+ {
+-    TPMPassthruState *tpm_pt = TPM_PASSTHROUGH(tb);
+-
+     DPRINTF("tpm_passthrough: CALL TO TPM_RESET!\n");
+ 
+     tpm_passthrough_cancel_cmd(tb);
+-
+-    tpm_pt->had_startup_error = false;
+-}
+-
+-static int tpm_passthrough_init(TPMBackend *tb)
+-{
+-    return 0;
+ }
+ 
+ static bool tpm_passthrough_get_tpm_established_flag(TPMBackend *tb)
+@@ -264,13 +245,6 @@ static int tpm_passthrough_reset_tpm_established_flag(TPMBackend *tb,
+     return 0;
+ }
+ 
+-static bool tpm_passthrough_get_startup_error(TPMBackend *tb)
+-{
+-    TPMPassthruState *tpm_pt = TPM_PASSTHROUGH(tb);
+-
+-    return tpm_pt->had_startup_error;
+-}
+-
+ static size_t tpm_passthrough_realloc_buffer(TPMSizedBuffer *sb)
+ {
+     size_t wanted_size = 4096; /* Linux tpm.c buffer size */
+@@ -309,11 +283,6 @@ static void tpm_passthrough_cancel_cmd(TPMBackend *tb)
+     }
+ }
+ 
+-static const char *tpm_passthrough_create_desc(void)
+-{
+-    return "Passthrough TPM backend driver";
+-}
+-
+ static TPMVersion tpm_passthrough_get_tpm_version(TPMBackend *tb)
+ {
+     TPMPassthruState *tpm_pt = TPM_PASSTHROUGH(tb);
+@@ -453,13 +422,10 @@ static const QemuOptDesc tpm_passthrough_cmdline_opts[] = {
+ static const TPMDriverOps tpm_passthrough_driver = {
+     .type                     = TPM_TYPE_PASSTHROUGH,
+     .opts                     = tpm_passthrough_cmdline_opts,
+-    .desc                     = tpm_passthrough_create_desc,
++    .desc                     = "Passthrough TPM backend driver",
+     .create                   = tpm_passthrough_create,
+-    .init                     = tpm_passthrough_init,
+-    .startup_tpm              = tpm_passthrough_startup_tpm,
+     .realloc_buffer           = tpm_passthrough_realloc_buffer,
+     .reset                    = tpm_passthrough_reset,
+-    .had_startup_error        = tpm_passthrough_get_startup_error,
+     .cancel_cmd               = tpm_passthrough_cancel_cmd,
+     .get_tpm_established_flag = tpm_passthrough_get_tpm_established_flag,
+     .reset_tpm_established_flag = tpm_passthrough_reset_tpm_established_flag,
+diff --git a/include/sysemu/tpm_backend.h b/include/sysemu/tpm_backend.h
+index 202ec8d5a2..9ea707253a 100644
+--- a/include/sysemu/tpm_backend.h
++++ b/include/sysemu/tpm_backend.h
+@@ -47,6 +47,7 @@ struct TPMBackend {
+     TPMState *tpm_state;
+     GThreadPool *thread_pool;
+     TPMRecvDataCB *recv_data_callback;
++    bool had_startup_error;
+ 
+     char *id;
+     enum TpmModel fe_model;
+@@ -75,7 +76,7 @@ struct TPMDriverOps {
+     enum TpmType type;
+     const QemuOptDesc *opts;
+     /* get a descriptive text of the backend to display to the user */
+-    const char *(*desc)(void);
++    const char *desc;
+ 
+     TPMBackend *(*create)(QemuOpts *opts, const char *id);
+ 
+@@ -83,8 +84,6 @@ struct TPMDriverOps {
+     int (*init)(TPMBackend *t);
+     /* start up the TPM on the backend */
+     int (*startup_tpm)(TPMBackend *t);
+-    /* returns true if nothing will ever answer TPM requests */
+-    bool (*had_startup_error)(TPMBackend *t);
+ 
+     size_t (*realloc_buffer)(TPMSizedBuffer *sb);
+ 
+@@ -109,14 +108,6 @@ struct TPMDriverOps {
+ enum TpmType tpm_backend_get_type(TPMBackend *s);
+ 
+ /**
+- * tpm_backend_get_desc:
+- * @s: the backend
+- *
+- * Returns a human readable description of the backend.
+- */
+-const char *tpm_backend_get_desc(TPMBackend *s);
+-
+-/**
+  * tpm_backend_init:
+  * @s: the backend to initialized
+  * @state: TPMState
+diff --git a/tpm.c b/tpm.c
+index 7feb3b43c9..9f4f37da50 100644
+--- a/tpm.c
++++ b/tpm.c
+@@ -63,7 +63,7 @@ static void tpm_display_backend_drivers(void)
+             continue;
+         }
+         fprintf(stderr, "%12s   %s\n",
+-                TpmType_lookup[i], be_drivers[i]->desc());
++                TpmType_lookup[i], be_drivers[i]->desc);
+     }
+     fprintf(stderr, "\n");
+ }
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/qemu/qemu/0007-tpm-backend-Add-new-api-to-read-backend-TpmInfo.patch b/meta/recipes-devtools/qemu/qemu/0007-tpm-backend-Add-new-api-to-read-backend-TpmInfo.patch
new file mode 100644
index 0000000..6d79ac4
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0007-tpm-backend-Add-new-api-to-read-backend-TpmInfo.patch
@@ -0,0 +1,293 @@
+From 5f698395b5de1ab2826f5aad99d757ce31d7c95f Mon Sep 17 00:00:00 2001
+From: Amarnath Valluri <amarnath.valluri@intel.com>
+Date: Mon, 6 Mar 2017 00:10:10 +0200
+Subject: [PATCH 07/12] tpm backend: Add new api to read backend TpmInfo
+
+TPM configuration options are backend implementation details and shall not be
+part of base TPMBackend object, and these shall not be accessed directly outside
+of the class, hence added a new interface method, get_tpm_options() to
+TPMDriverOps., which shall be implemented by the derived classes to return
+configured tpm options.
+
+A new tpm backend api - tpm_backend_query_tpm() which uses _get_tpm_options() to
+prepare TpmInfo.
+
+Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
+Reviewed-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
+
+Upstream-Status: Backport[f59864ba3aedd26aef7c84545cc1e565caccebf7]
+---
+ backends/tpm.c               | 15 +++++++++++--
+ hw/tpm/tpm_passthrough.c     | 51 +++++++++++++++++++++++++++-----------------
+ include/sysemu/tpm_backend.h | 15 +++++++++++--
+ tpm.c                        | 32 +--------------------------
+ 4 files changed, 59 insertions(+), 54 deletions(-)
+
+diff --git a/backends/tpm.c b/backends/tpm.c
+index 8911597fab..de313c9d5a 100644
+--- a/backends/tpm.c
++++ b/backends/tpm.c
+@@ -142,6 +142,19 @@ TPMVersion tpm_backend_get_tpm_version(TPMBackend *s)
+     return k->ops->get_tpm_version(s);
+ }
+ 
++TPMInfo *tpm_backend_query_tpm(TPMBackend *s)
++{
++    TPMInfo *info = g_new0(TPMInfo, 1);
++    TPMBackendClass *k = TPM_BACKEND_GET_CLASS(s);
++
++    info->id = g_strdup(s->id);
++    info->model = s->fe_model;
++    info->options = k->ops->get_tpm_options ?
++                    k->ops->get_tpm_options(s) : NULL;
++
++    return info;
++}
++
+ static bool tpm_backend_prop_get_opened(Object *obj, Error **errp)
+ {
+     TPMBackend *s = TPM_BACKEND(obj);
+@@ -196,8 +209,6 @@ static void tpm_backend_instance_finalize(Object *obj)
+     TPMBackend *s = TPM_BACKEND(obj);
+ 
+     g_free(s->id);
+-    g_free(s->path);
+-    g_free(s->cancel_path);
+     tpm_backend_thread_end(s);
+ }
+ 
+diff --git a/hw/tpm/tpm_passthrough.c b/hw/tpm/tpm_passthrough.c
+index 4c21e52b7c..84fc49a4d3 100644
+--- a/hw/tpm/tpm_passthrough.c
++++ b/hw/tpm/tpm_passthrough.c
+@@ -30,6 +30,7 @@
+ #include "tpm_int.h"
+ #include "hw/hw.h"
+ #include "hw/i386/pc.h"
++#include "qapi/clone-visitor.h"
+ #include "tpm_tis.h"
+ #include "tpm_util.h"
+ 
+@@ -49,7 +50,8 @@
+ struct TPMPassthruState {
+     TPMBackend parent;
+ 
+-    char *tpm_dev;
++    TPMPassthroughOptions *options;
++    const char *tpm_dev;
+     int tpm_fd;
+     bool tpm_executing;
+     bool tpm_op_canceled;
+@@ -296,15 +298,14 @@ static TPMVersion tpm_passthrough_get_tpm_version(TPMBackend *tb)
+  * in Documentation/ABI/stable/sysfs-class-tpm.
+  * From /dev/tpm0 create /sys/class/misc/tpm0/device/cancel
+  */
+-static int tpm_passthrough_open_sysfs_cancel(TPMBackend *tb)
++static int tpm_passthrough_open_sysfs_cancel(TPMPassthruState *tpm_pt)
+ {
+-    TPMPassthruState *tpm_pt = TPM_PASSTHROUGH(tb);
+     int fd = -1;
+     char *dev;
+     char path[PATH_MAX];
+ 
+-    if (tb->cancel_path) {
+-        fd = qemu_open(tb->cancel_path, O_WRONLY);
++    if (tpm_pt->options->cancel_path) {
++        fd = qemu_open(tpm_pt->options->cancel_path, O_WRONLY);
+         if (fd < 0) {
+             error_report("Could not open TPM cancel path : %s",
+                          strerror(errno));
+@@ -319,7 +320,7 @@ static int tpm_passthrough_open_sysfs_cancel(TPMBackend *tb)
+                      dev) < sizeof(path)) {
+             fd = qemu_open(path, O_WRONLY);
+             if (fd >= 0) {
+-                tb->cancel_path = g_strdup(path);
++                tpm_pt->options->cancel_path = g_strdup(path);
+             } else {
+                 error_report("tpm_passthrough: Could not open TPM cancel "
+                              "path %s : %s", path, strerror(errno));
+@@ -339,17 +340,18 @@ static int tpm_passthrough_handle_device_opts(QemuOpts *opts, TPMBackend *tb)
+     const char *value;
+ 
+     value = qemu_opt_get(opts, "cancel-path");
+-    tb->cancel_path = g_strdup(value);
++    if (value) {
++        tpm_pt->options->cancel_path = g_strdup(value);
++        tpm_pt->options->has_cancel_path = true;
++    }
+ 
+     value = qemu_opt_get(opts, "path");
+-    if (!value) {
+-        value = TPM_PASSTHROUGH_DEFAULT_DEVICE;
++    if (value) {
++        tpm_pt->options->has_path = true;
++        tpm_pt->options->path = g_strdup(value);
+     }
+ 
+-    tpm_pt->tpm_dev = g_strdup(value);
+-
+-    tb->path = g_strdup(tpm_pt->tpm_dev);
+-
++    tpm_pt->tpm_dev = value ? value : TPM_PASSTHROUGH_DEFAULT_DEVICE;
+     tpm_pt->tpm_fd = qemu_open(tpm_pt->tpm_dev, O_RDWR);
+     if (tpm_pt->tpm_fd < 0) {
+         error_report("Cannot access TPM device using '%s': %s",
+@@ -370,10 +372,8 @@ static int tpm_passthrough_handle_device_opts(QemuOpts *opts, TPMBackend *tb)
+     tpm_pt->tpm_fd = -1;
+ 
+  err_free_parameters:
+-    g_free(tb->path);
+-    tb->path = NULL;
+-
+-    g_free(tpm_pt->tpm_dev);
++    qapi_free_TPMPassthroughOptions(tpm_pt->options);
++    tpm_pt->options = NULL;
+     tpm_pt->tpm_dev = NULL;
+ 
+     return 1;
+@@ -391,7 +391,7 @@ static TPMBackend *tpm_passthrough_create(QemuOpts *opts, const char *id)
+         goto err_exit;
+     }
+ 
+-    tpm_pt->cancel_fd = tpm_passthrough_open_sysfs_cancel(tb);
++    tpm_pt->cancel_fd = tpm_passthrough_open_sysfs_cancel(tpm_pt);
+     if (tpm_pt->cancel_fd < 0) {
+         goto err_exit;
+     }
+@@ -404,6 +404,17 @@ err_exit:
+     return NULL;
+ }
+ 
++static TpmTypeOptions *tpm_passthrough_get_tpm_options(TPMBackend *tb)
++{
++    TpmTypeOptions *options = g_new0(TpmTypeOptions, 1);
++
++    options->type = TPM_TYPE_OPTIONS_KIND_PASSTHROUGH;
++    options->u.passthrough.data = QAPI_CLONE(TPMPassthroughOptions,
++                                             TPM_PASSTHROUGH(tb)->options);
++
++    return options;
++}
++
+ static const QemuOptDesc tpm_passthrough_cmdline_opts[] = {
+     TPM_STANDARD_CMDLINE_OPTS,
+     {
+@@ -430,12 +441,14 @@ static const TPMDriverOps tpm_passthrough_driver = {
+     .get_tpm_established_flag = tpm_passthrough_get_tpm_established_flag,
+     .reset_tpm_established_flag = tpm_passthrough_reset_tpm_established_flag,
+     .get_tpm_version          = tpm_passthrough_get_tpm_version,
++    .get_tpm_options          = tpm_passthrough_get_tpm_options,
+ };
+ 
+ static void tpm_passthrough_inst_init(Object *obj)
+ {
+     TPMPassthruState *tpm_pt = TPM_PASSTHROUGH(obj);
+ 
++    tpm_pt->options = g_new0(TPMPassthroughOptions, 1);
+     tpm_pt->tpm_fd = -1;
+     tpm_pt->cancel_fd = -1;
+ }
+@@ -448,7 +461,7 @@ static void tpm_passthrough_inst_finalize(Object *obj)
+ 
+     qemu_close(tpm_pt->tpm_fd);
+     qemu_close(tpm_pt->cancel_fd);
+-    g_free(tpm_pt->tpm_dev);
++    qapi_free_TPMPassthroughOptions(tpm_pt->options);
+ }
+ 
+ static void tpm_passthrough_class_init(ObjectClass *klass, void *data)
+diff --git a/include/sysemu/tpm_backend.h b/include/sysemu/tpm_backend.h
+index 9ea707253a..e96c1918cc 100644
+--- a/include/sysemu/tpm_backend.h
++++ b/include/sysemu/tpm_backend.h
+@@ -49,10 +49,9 @@ struct TPMBackend {
+     TPMRecvDataCB *recv_data_callback;
+     bool had_startup_error;
+ 
++    /* <public> */
+     char *id;
+     enum TpmModel fe_model;
+-    char *path;
+-    char *cancel_path;
+ 
+     QLIST_ENTRY(TPMBackend) list;
+ };
+@@ -96,6 +95,8 @@ struct TPMDriverOps {
+     int (*reset_tpm_established_flag)(TPMBackend *t, uint8_t locty);
+ 
+     TPMVersion (*get_tpm_version)(TPMBackend *t);
++
++    TpmTypeOptions *(*get_tpm_options)(TPMBackend *t);
+ };
+ 
+ 
+@@ -214,6 +215,16 @@ void tpm_backend_open(TPMBackend *s, Error **errp);
+  */
+ TPMVersion tpm_backend_get_tpm_version(TPMBackend *s);
+ 
++/**
++ * tpm_backend_query_tpm:
++ * @s: the backend
++ *
++ * Query backend tpm info
++ *
++ * Returns newly allocated TPMInfo
++ */
++TPMInfo *tpm_backend_query_tpm(TPMBackend *s);
++
+ TPMBackend *qemu_find_tpm(const char *id);
+ 
+ const TPMDriverOps *tpm_get_backend_driver(const char *type);
+diff --git a/tpm.c b/tpm.c
+index 9f4f37da50..cac400ef3e 100644
+--- a/tpm.c
++++ b/tpm.c
+@@ -203,36 +203,6 @@ static const TPMDriverOps *tpm_driver_find_by_type(enum TpmType type)
+     return be_drivers[type];
+ }
+ 
+-static TPMInfo *qmp_query_tpm_inst(TPMBackend *drv)
+-{
+-    TPMInfo *res = g_new0(TPMInfo, 1);
+-    TPMPassthroughOptions *tpo;
+-
+-    res->id = g_strdup(drv->id);
+-    res->model = drv->fe_model;
+-    res->options = g_new0(TpmTypeOptions, 1);
+-
+-    switch (tpm_backend_get_type(drv)) {
+-    case TPM_TYPE_PASSTHROUGH:
+-        res->options->type = TPM_TYPE_OPTIONS_KIND_PASSTHROUGH;
+-        tpo = g_new0(TPMPassthroughOptions, 1);
+-        res->options->u.passthrough.data = tpo;
+-        if (drv->path) {
+-            tpo->path = g_strdup(drv->path);
+-            tpo->has_path = true;
+-        }
+-        if (drv->cancel_path) {
+-            tpo->cancel_path = g_strdup(drv->cancel_path);
+-            tpo->has_cancel_path = true;
+-        }
+-        break;
+-    case TPM_TYPE__MAX:
+-        break;
+-    }
+-
+-    return res;
+-}
+-
+ /*
+  * Walk the list of active TPM backends and collect information about them
+  * following the schema description in qapi-schema.json.
+@@ -247,7 +217,7 @@ TPMInfoList *qmp_query_tpm(Error **errp)
+             continue;
+         }
+         info = g_new0(TPMInfoList, 1);
+-        info->value = qmp_query_tpm_inst(drv);
++        info->value = tpm_backend_query_tpm(drv);
+ 
+         if (!cur_item) {
+             head = cur_item = info;
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/qemu/qemu/0008-tpm-backend-Move-realloc_buffer-implementation-to-tp.patch b/meta/recipes-devtools/qemu/qemu/0008-tpm-backend-Move-realloc_buffer-implementation-to-tp.patch
new file mode 100644
index 0000000..94cc6c5
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0008-tpm-backend-Move-realloc_buffer-implementation-to-tp.patch
@@ -0,0 +1,140 @@
+From 02189909fdc5e73b3ca54362084c16f0b67a3fdf Mon Sep 17 00:00:00 2001
+From: Amarnath Valluri <amarnath.valluri@intel.com>
+Date: Fri, 7 Apr 2017 10:57:28 +0300
+Subject: [PATCH 08/12] tpm-backend: Move realloc_buffer() implementation to
+ tpm-tis model
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+buffer reallocation is very unlikely to be backend specific. Hence move inside
+the tis.
+
+Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
+Reviewed-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
+Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
+
+Upstream-Status: Backport [d0c519bdffa303d141727369e55b157c45b03147]
+---
+ backends/tpm.c               |  9 ---------
+ hw/tpm/tpm_passthrough.c     | 12 ------------
+ hw/tpm/tpm_tis.c             | 14 ++++++++++++--
+ include/sysemu/tpm_backend.h | 12 ------------
+ 4 files changed, 12 insertions(+), 35 deletions(-)
+
+diff --git a/backends/tpm.c b/backends/tpm.c
+index de313c9d5a..37c84b7c66 100644
+--- a/backends/tpm.c
++++ b/backends/tpm.c
+@@ -80,15 +80,6 @@ bool tpm_backend_had_startup_error(TPMBackend *s)
+     return s->had_startup_error;
+ }
+ 
+-size_t tpm_backend_realloc_buffer(TPMBackend *s, TPMSizedBuffer *sb)
+-{
+-    TPMBackendClass *k = TPM_BACKEND_GET_CLASS(s);
+-
+-    assert(k->ops->realloc_buffer);
+-
+-    return k->ops->realloc_buffer(sb);
+-}
+-
+ void tpm_backend_deliver_request(TPMBackend *s)
+ {
+     g_thread_pool_push(s->thread_pool, (gpointer)TPM_BACKEND_CMD_PROCESS_CMD,
+diff --git a/hw/tpm/tpm_passthrough.c b/hw/tpm/tpm_passthrough.c
+index 84fc49a4d3..22d3460550 100644
+--- a/hw/tpm/tpm_passthrough.c
++++ b/hw/tpm/tpm_passthrough.c
+@@ -247,17 +247,6 @@ static int tpm_passthrough_reset_tpm_established_flag(TPMBackend *tb,
+     return 0;
+ }
+ 
+-static size_t tpm_passthrough_realloc_buffer(TPMSizedBuffer *sb)
+-{
+-    size_t wanted_size = 4096; /* Linux tpm.c buffer size */
+-
+-    if (sb->size != wanted_size) {
+-        sb->buffer = g_realloc(sb->buffer, wanted_size);
+-        sb->size = wanted_size;
+-    }
+-    return sb->size;
+-}
+-
+ static void tpm_passthrough_cancel_cmd(TPMBackend *tb)
+ {
+     TPMPassthruState *tpm_pt = TPM_PASSTHROUGH(tb);
+@@ -435,7 +424,6 @@ static const TPMDriverOps tpm_passthrough_driver = {
+     .opts                     = tpm_passthrough_cmdline_opts,
+     .desc                     = "Passthrough TPM backend driver",
+     .create                   = tpm_passthrough_create,
+-    .realloc_buffer           = tpm_passthrough_realloc_buffer,
+     .reset                    = tpm_passthrough_reset,
+     .cancel_cmd               = tpm_passthrough_cancel_cmd,
+     .get_tpm_established_flag = tpm_passthrough_get_tpm_established_flag,
+diff --git a/hw/tpm/tpm_tis.c b/hw/tpm/tpm_tis.c
+index a6440fef91..d5118e7f60 100644
+--- a/hw/tpm/tpm_tis.c
++++ b/hw/tpm/tpm_tis.c
+@@ -963,6 +963,16 @@ static int tpm_tis_do_startup_tpm(TPMState *s)
+     return tpm_backend_startup_tpm(s->be_driver);
+ }
+ 
++static void tpm_tis_realloc_buffer(TPMSizedBuffer *sb)
++{
++    size_t wanted_size = 4096; /* Linux tpm.c buffer size */
++
++    if (sb->size != wanted_size) {
++        sb->buffer = g_realloc(sb->buffer, wanted_size);
++        sb->size = wanted_size;
++    }
++}
++
+ /*
+  * Get the TPMVersion of the backend device being used
+  */
+@@ -1010,9 +1020,9 @@ static void tpm_tis_reset(DeviceState *dev)
+         tis->loc[c].state = TPM_TIS_STATE_IDLE;
+ 
+         tis->loc[c].w_offset = 0;
+-        tpm_backend_realloc_buffer(s->be_driver, &tis->loc[c].w_buffer);
++        tpm_tis_realloc_buffer(&tis->loc[c].w_buffer);
+         tis->loc[c].r_offset = 0;
+-        tpm_backend_realloc_buffer(s->be_driver, &tis->loc[c].r_buffer);
++        tpm_tis_realloc_buffer(&tis->loc[c].r_buffer);
+     }
+ 
+     tpm_tis_do_startup_tpm(s);
+diff --git a/include/sysemu/tpm_backend.h b/include/sysemu/tpm_backend.h
+index e96c1918cc..2c798a1eb4 100644
+--- a/include/sysemu/tpm_backend.h
++++ b/include/sysemu/tpm_backend.h
+@@ -84,8 +84,6 @@ struct TPMDriverOps {
+     /* start up the TPM on the backend */
+     int (*startup_tpm)(TPMBackend *t);
+ 
+-    size_t (*realloc_buffer)(TPMSizedBuffer *sb);
+-
+     void (*reset)(TPMBackend *t);
+ 
+     void (*cancel_cmd)(TPMBackend *t);
+@@ -140,16 +138,6 @@ int tpm_backend_startup_tpm(TPMBackend *s);
+ bool tpm_backend_had_startup_error(TPMBackend *s);
+ 
+ /**
+- * tpm_backend_realloc_buffer:
+- * @s: the backend
+- * @sb: the TPMSizedBuffer to re-allocated to the size suitable for the
+- *      backend.
+- *
+- * This function returns the size of the allocated buffer
+- */
+-size_t tpm_backend_realloc_buffer(TPMBackend *s, TPMSizedBuffer *sb);
+-
+-/**
+  * tpm_backend_deliver_request:
+  * @s: the backend to send the request to
+  *
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/qemu/qemu/0009-tpm-passthrough-move-reusable-code-to-utils.patch b/meta/recipes-devtools/qemu/qemu/0009-tpm-passthrough-move-reusable-code-to-utils.patch
new file mode 100644
index 0000000..8670b8a
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0009-tpm-passthrough-move-reusable-code-to-utils.patch
@@ -0,0 +1,182 @@
+From b8322aaa2f31995e1b7b776e7efae68416573bc3 Mon Sep 17 00:00:00 2001
+From: Amarnath Valluri <amarnath.valluri@intel.com>
+Date: Wed, 29 Mar 2017 15:36:47 +0300
+Subject: [PATCH 09/12] tpm-passthrough: move reusable code to utils
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
+Reviewed-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
+Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
+
+Upstream-Status: Backport [4a3d80980ebf71d8faf9d0ce2e2e23bdda5728df]
+---
+ hw/tpm/tpm_passthrough.c | 64 ++++--------------------------------------------
+ hw/tpm/tpm_util.c        | 25 +++++++++++++++++++
+ hw/tpm/tpm_util.h        |  4 +++
+ 3 files changed, 34 insertions(+), 59 deletions(-)
+
+diff --git a/hw/tpm/tpm_passthrough.c b/hw/tpm/tpm_passthrough.c
+index 22d3460550..e6ace28b04 100644
+--- a/hw/tpm/tpm_passthrough.c
++++ b/hw/tpm/tpm_passthrough.c
+@@ -68,27 +68,6 @@ typedef struct TPMPassthruState TPMPassthruState;
+ 
+ static void tpm_passthrough_cancel_cmd(TPMBackend *tb);
+ 
+-static int tpm_passthrough_unix_write(int fd, const uint8_t *buf, uint32_t len)
+-{
+-    int ret, remain;
+-
+-    remain = len;
+-    while (remain > 0) {
+-        ret = write(fd, buf, remain);
+-        if (ret < 0) {
+-            if (errno != EINTR && errno != EAGAIN) {
+-                return -1;
+-            }
+-        } else if (ret == 0) {
+-            break;
+-        } else {
+-            buf += ret;
+-            remain -= ret;
+-        }
+-    }
+-    return len - remain;
+-}
+-
+ static int tpm_passthrough_unix_read(int fd, uint8_t *buf, uint32_t len)
+ {
+     int ret;
+@@ -102,45 +81,12 @@ static int tpm_passthrough_unix_read(int fd, uint8_t *buf, uint32_t len)
+     }
+     return ret;
+ }
+-
+-static uint32_t tpm_passthrough_get_size_from_buffer(const uint8_t *buf)
+-{
+-    struct tpm_resp_hdr *resp = (struct tpm_resp_hdr *)buf;
+-
+-    return be32_to_cpu(resp->len);
+-}
+-
+-/*
+- * Write an error message in the given output buffer.
+- */
+-static void tpm_write_fatal_error_response(uint8_t *out, uint32_t out_len)
+-{
+-    if (out_len >= sizeof(struct tpm_resp_hdr)) {
+-        struct tpm_resp_hdr *resp = (struct tpm_resp_hdr *)out;
+-
+-        resp->tag = cpu_to_be16(TPM_TAG_RSP_COMMAND);
+-        resp->len = cpu_to_be32(sizeof(struct tpm_resp_hdr));
+-        resp->errcode = cpu_to_be32(TPM_FAIL);
+-    }
+-}
+-
+-static bool tpm_passthrough_is_selftest(const uint8_t *in, uint32_t in_len)
+-{
+-    struct tpm_req_hdr *hdr = (struct tpm_req_hdr *)in;
+-
+-    if (in_len >= sizeof(*hdr)) {
+-        return (be32_to_cpu(hdr->ordinal) == TPM_ORD_ContinueSelfTest);
+-    }
+-
+-    return false;
+-}
+-
+ static int tpm_passthrough_unix_tx_bufs(TPMPassthruState *tpm_pt,
+                                         const uint8_t *in, uint32_t in_len,
+                                         uint8_t *out, uint32_t out_len,
+                                         bool *selftest_done)
+ {
+-    int ret;
++    ssize_t ret;
+     bool is_selftest;
+     const struct tpm_resp_hdr *hdr;
+ 
+@@ -148,9 +94,9 @@ static int tpm_passthrough_unix_tx_bufs(TPMPassthruState *tpm_pt,
+     tpm_pt->tpm_executing = true;
+     *selftest_done = false;
+ 
+-    is_selftest = tpm_passthrough_is_selftest(in, in_len);
++    is_selftest = tpm_util_is_selftest(in, in_len);
+ 
+-    ret = tpm_passthrough_unix_write(tpm_pt->tpm_fd, in, in_len);
++    ret = qemu_write_full(tpm_pt->tpm_fd, (const void *)in, (size_t)in_len);
+     if (ret != in_len) {
+         if (!tpm_pt->tpm_op_canceled || errno != ECANCELED) {
+             error_report("tpm_passthrough: error while transmitting data "
+@@ -170,7 +116,7 @@ static int tpm_passthrough_unix_tx_bufs(TPMPassthruState *tpm_pt,
+                          strerror(errno), errno);
+         }
+     } else if (ret < sizeof(struct tpm_resp_hdr) ||
+-               tpm_passthrough_get_size_from_buffer(out) != ret) {
++               be32_to_cpu(((struct tpm_resp_hdr *)out)->len) != ret) {
+         ret = -1;
+         error_report("tpm_passthrough: received invalid response "
+                      "packet from TPM");
+@@ -183,7 +129,7 @@ static int tpm_passthrough_unix_tx_bufs(TPMPassthruState *tpm_pt,
+ 
+ err_exit:
+     if (ret < 0) {
+-        tpm_write_fatal_error_response(out, out_len);
++        tpm_util_write_fatal_error_response(out, out_len);
+     }
+ 
+     tpm_pt->tpm_executing = false;
+diff --git a/hw/tpm/tpm_util.c b/hw/tpm/tpm_util.c
+index 7b35429725..fb929f6e92 100644
+--- a/hw/tpm/tpm_util.c
++++ b/hw/tpm/tpm_util.c
+@@ -24,6 +24,31 @@
+ #include "tpm_int.h"
+ 
+ /*
++ * Write an error message in the given output buffer.
++ */
++void tpm_util_write_fatal_error_response(uint8_t *out, uint32_t out_len)
++{
++    if (out_len >= sizeof(struct tpm_resp_hdr)) {
++        struct tpm_resp_hdr *resp = (struct tpm_resp_hdr *)out;
++
++        resp->tag = cpu_to_be16(TPM_TAG_RSP_COMMAND);
++        resp->len = cpu_to_be32(sizeof(struct tpm_resp_hdr));
++        resp->errcode = cpu_to_be32(TPM_FAIL);
++    }
++}
++
++bool tpm_util_is_selftest(const uint8_t *in, uint32_t in_len)
++{
++    struct tpm_req_hdr *hdr = (struct tpm_req_hdr *)in;
++
++    if (in_len >= sizeof(*hdr)) {
++        return (be32_to_cpu(hdr->ordinal) == TPM_ORD_ContinueSelfTest);
++    }
++
++    return false;
++}
++
++/*
+  * A basic test of a TPM device. We expect a well formatted response header
+  * (error response is fine) within one second.
+  */
+diff --git a/hw/tpm/tpm_util.h b/hw/tpm/tpm_util.h
+index df76245e6e..2f7c96146d 100644
+--- a/hw/tpm/tpm_util.h
++++ b/hw/tpm/tpm_util.h
+@@ -24,6 +24,10 @@
+ 
+ #include "sysemu/tpm_backend.h"
+ 
++void tpm_util_write_fatal_error_response(uint8_t *out, uint32_t out_len);
++
++bool tpm_util_is_selftest(const uint8_t *in, uint32_t in_len);
++
+ int tpm_util_test_tpmdev(int tpm_fd, TPMVersion *tpm_version);
+ 
+ #endif /* TPM_TPM_UTIL_H */
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/qemu/qemu/0010-tpm-Added-support-for-TPM-emulator.patch b/meta/recipes-devtools/qemu/qemu/0010-tpm-Added-support-for-TPM-emulator.patch
new file mode 100644
index 0000000..968e12e
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0010-tpm-Added-support-for-TPM-emulator.patch
@@ -0,0 +1,1059 @@
+From 70e73b7c6c7cf982d645db9c81c74588e6b10a2b Mon Sep 17 00:00:00 2001
+From: Amarnath Valluri <amarnath.valluri@intel.com>
+Date: Wed, 29 Mar 2017 15:39:41 +0300
+Subject: [PATCH 10/12] tpm: Added support for TPM emulator
+
+This change introduces a new TPM backend driver that can communicate with
+swtpm(software TPM emulator) using unix domain socket interface. QEMU talks to
+TPM emulator using QEMU's socket-based chardev backend device.
+
+Swtpm uses two Unix sockets for communications, one for plain TPM commands and
+responses, and one for out-of-band control messages. QEMU passes data socket to
+be used over the control channel.
+
+The swtpm and associated tools can be found here:
+    https://github.com/stefanberger/swtpm
+
+The swtpm's control channel protocol specification can be found here:
+    https://github.com/stefanberger/swtpm/wiki/Control-Channel-Specification
+
+Usage:
+    # setup TPM state directory
+    mkdir /tmp/mytpm
+    chown -R tss:root /tmp/mytpm
+    /usr/bin/swtpm_setup --tpm-state /tmp/mytpm --createek
+
+    # Ask qemu to use TPM emulator with given tpm state directory
+    qemu-system-x86_64 \
+        [...] \
+        -chardev socket,id=chrtpm,path=/tmp/swtpm-sock \
+        -tpmdev emulator,id=tpm0,chardev=chrtpm \
+        -device tpm-tis,tpmdev=tpm0 \
+        [...]
+
+Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
+
+Upstream-Status: Backport [f4ede81eed29e6140374177d1f2808248c5b5650]
+---
+ configure             |  13 +-
+ hmp.c                 |   5 +
+ hw/tpm/Makefile.objs  |   1 +
+ hw/tpm/tpm_emulator.c | 583 ++++++++++++++++++++++++++++++++++++++++++++++++++
+ hw/tpm/tpm_ioctl.h    | 246 +++++++++++++++++++++
+ qapi-schema.json      |  18 +-
+ qemu-options.hx       |  22 +-
+ 7 files changed, 882 insertions(+), 6 deletions(-)
+ create mode 100644 hw/tpm/tpm_emulator.c
+ create mode 100644 hw/tpm/tpm_ioctl.h
+
+diff --git a/configure b/configure
+index dd73cce62f..9a25537096 100755
+--- a/configure
++++ b/configure
+@@ -3503,6 +3503,12 @@ else
+   tpm_passthrough=no
+ fi
+ 
++# TPM emulator is for all posix systems
++if test "$mingw32" != "yes"; then
++  tpm_emulator=$tpm
++else
++  tpm_emulator=no
++fi
+ ##########################################
+ # attr probe
+ 
+@@ -5396,6 +5402,7 @@ echo "gcov enabled      $gcov"
+ echo "TPM support       $tpm"
+ echo "libssh2 support   $libssh2"
+ echo "TPM passthrough   $tpm_passthrough"
++echo "TPM emulator      $tpm_emulator"
+ echo "QOM debugging     $qom_cast_debug"
+ echo "Live block migration $live_block_migration"
+ echo "lzo support       $lzo"
+@@ -5983,12 +5990,16 @@ else
+   echo "HOST_USB=stub" >> $config_host_mak
+ fi
+ 
+-# TPM passthrough support?
+ if test "$tpm" = "yes"; then
+   echo 'CONFIG_TPM=$(CONFIG_SOFTMMU)' >> $config_host_mak
++  # TPM passthrough support?
+   if test "$tpm_passthrough" = "yes"; then
+     echo "CONFIG_TPM_PASSTHROUGH=y" >> $config_host_mak
+   fi
++  # TPM emulator support?
++  if test "$tpm_emulator" = "yes"; then
++    echo "CONFIG_TPM_EMULATOR=y" >> $config_host_mak
++  fi
+ fi
+ 
+ echo "TRACE_BACKENDS=$trace_backends" >> $config_host_mak
+diff --git a/hmp.c b/hmp.c
+index fd80dce758..820aa8f002 100644
+--- a/hmp.c
++++ b/hmp.c
+@@ -995,6 +995,7 @@ void hmp_info_tpm(Monitor *mon, const QDict *qdict)
+     Error *err = NULL;
+     unsigned int c = 0;
+     TPMPassthroughOptions *tpo;
++    TPMEmulatorOptions *teo;
+ 
+     info_list = qmp_query_tpm(&err);
+     if (err) {
+@@ -1024,6 +1025,10 @@ void hmp_info_tpm(Monitor *mon, const QDict *qdict)
+                            tpo->has_cancel_path ? ",cancel-path=" : "",
+                            tpo->has_cancel_path ? tpo->cancel_path : "");
+             break;
++        case TPM_TYPE_OPTIONS_KIND_EMULATOR:
++            teo = ti->options->u.emulator.data;
++            monitor_printf(mon, ",chardev=%s", teo->chardev);
++            break;
+         case TPM_TYPE_OPTIONS_KIND__MAX:
+             break;
+         }
+diff --git a/hw/tpm/Makefile.objs b/hw/tpm/Makefile.objs
+index 64cecc3b67..41f0b7a590 100644
+--- a/hw/tpm/Makefile.objs
++++ b/hw/tpm/Makefile.objs
+@@ -1,2 +1,3 @@
+ common-obj-$(CONFIG_TPM_TIS) += tpm_tis.o
+ common-obj-$(CONFIG_TPM_PASSTHROUGH) += tpm_passthrough.o tpm_util.o
++common-obj-$(CONFIG_TPM_EMULATOR) += tpm_emulator.o tpm_util.o
+diff --git a/hw/tpm/tpm_emulator.c b/hw/tpm/tpm_emulator.c
+new file mode 100644
+index 0000000000..433bc4fa8a
+--- /dev/null
++++ b/hw/tpm/tpm_emulator.c
+@@ -0,0 +1,583 @@
++/*
++ *  Emulator TPM driver
++ *
++ *  Copyright (c) 2017 Intel Corporation
++ *  Author: Amarnath Valluri <amarnath.valluri@intel.com>
++ *
++ *  Copyright (c) 2010 - 2013 IBM Corporation
++ *  Authors:
++ *    Stefan Berger <stefanb@us.ibm.com>
++ *
++ *  Copyright (C) 2011 IAIK, Graz University of Technology
++ *    Author: Andreas Niederl
++ *
++ * This library is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU Lesser General Public
++ * License as published by the Free Software Foundation; either
++ * version 2 of the License, or (at your option) any later version.
++ *
++ * This library is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++ * Lesser General Public License for more details.
++ *
++ * You should have received a copy of the GNU Lesser General Public
++ * License along with this library; if not, see <http://www.gnu.org/licenses/>
++ *
++ */
++
++#include "qemu/osdep.h"
++#include "qemu/error-report.h"
++#include "qemu/sockets.h"
++#include "io/channel-socket.h"
++#include "sysemu/tpm_backend.h"
++#include "tpm_int.h"
++#include "hw/hw.h"
++#include "hw/i386/pc.h"
++#include "tpm_util.h"
++#include "tpm_ioctl.h"
++#include "migration/blocker.h"
++#include "qapi/error.h"
++#include "qapi/clone-visitor.h"
++#include "chardev/char-fe.h"
++
++#include <fcntl.h>
++#include <sys/types.h>
++#include <sys/stat.h>
++#include <stdio.h>
++
++#define DEBUG_TPM 0
++
++#define DPRINTF(fmt, ...) do { \
++    if (DEBUG_TPM) { \
++        fprintf(stderr, "tpm-emulator:"fmt"\n", ## __VA_ARGS__); \
++    } \
++} while (0)
++
++#define TYPE_TPM_EMULATOR "tpm-emulator"
++#define TPM_EMULATOR(obj) \
++    OBJECT_CHECK(TPMEmulator, (obj), TYPE_TPM_EMULATOR)
++
++#define TPM_EMULATOR_IMPLEMENTS_ALL_CAPS(S, cap) (((S)->caps & (cap)) == (cap))
++
++static const TPMDriverOps tpm_emulator_driver;
++
++/* data structures */
++typedef struct TPMEmulator {
++    TPMBackend parent;
++
++    TPMEmulatorOptions *options;
++    CharBackend ctrl_chr;
++    QIOChannel *data_ioc;
++    TPMVersion tpm_version;
++    ptm_cap caps; /* capabilities of the TPM */
++    uint8_t cur_locty_number; /* last set locality */
++    Error *migration_blocker;
++} TPMEmulator;
++
++
++static int tpm_emulator_ctrlcmd(CharBackend *dev, unsigned long cmd, void *msg,
++                                size_t msg_len_in, size_t msg_len_out)
++{
++    uint32_t cmd_no = cpu_to_be32(cmd);
++    ssize_t n = sizeof(uint32_t) + msg_len_in;
++    uint8_t *buf = NULL;
++
++    buf = g_alloca(n);
++    memcpy(buf, &cmd_no, sizeof(cmd_no));
++    memcpy(buf + sizeof(cmd_no), msg, msg_len_in);
++
++    n = qemu_chr_fe_write_all(dev, buf, n);
++    if (n <= 0) {
++        return -1;
++    }
++
++    if (msg_len_out != 0) {
++        n = qemu_chr_fe_read_all(dev, msg, msg_len_out);
++        if (n <= 0) {
++            return -1;
++        }
++    }
++
++    return 0;
++}
++
++static int tpm_emulator_unix_tx_bufs(TPMEmulator *tpm_emu,
++                                     const uint8_t *in, uint32_t in_len,
++                                     uint8_t *out, uint32_t out_len,
++                                     bool *selftest_done,
++                                     Error **err)
++{
++    ssize_t ret;
++    bool is_selftest = false;
++    const struct tpm_resp_hdr *hdr = NULL;
++
++    if (selftest_done) {
++        *selftest_done = false;
++        is_selftest = tpm_util_is_selftest(in, in_len);
++    }
++
++    ret = qio_channel_write(tpm_emu->data_ioc, (char *)in, in_len, err);
++    if (ret != in_len) {
++        return -1;
++    }
++
++    ret = qio_channel_read(tpm_emu->data_ioc, (char *)out, out_len, err);
++    if (ret <= 0 || ret < sizeof(*hdr)) {
++        return -1;
++    }
++
++    hdr = (struct tpm_resp_hdr *)out;
++    if (be32_to_cpu(hdr->len) != ret) {
++        return -1;
++    }
++
++    if (is_selftest) {
++        *selftest_done = (be32_to_cpu(hdr->errcode) == 0);
++    }
++
++    return 0;
++}
++
++static int tpm_emulator_set_locality(TPMEmulator *tpm_emu, uint8_t locty_number)
++{
++    ptm_loc loc;
++
++    DPRINTF("%s : locality: 0x%x", __func__, locty_number);
++
++    if (tpm_emu->cur_locty_number == locty_number) {
++        return 0;
++    }
++
++    DPRINTF("setting locality : 0x%x", locty_number);
++    loc.u.req.loc = locty_number;
++    if (tpm_emulator_ctrlcmd(&tpm_emu->ctrl_chr, CMD_SET_LOCALITY, &loc,
++                             sizeof(loc), sizeof(loc)) < 0) {
++        error_report("tpm-emulator: could not set locality : %s",
++                     strerror(errno));
++        return -1;
++    }
++
++    loc.u.resp.tpm_result = be32_to_cpu(loc.u.resp.tpm_result);
++    if (loc.u.resp.tpm_result != 0) {
++        error_report("tpm-emulator: TPM result for set locality : 0x%x",
++                     loc.u.resp.tpm_result);
++        return -1;
++    }
++
++    tpm_emu->cur_locty_number = locty_number;
++
++    return 0;
++}
++
++static void tpm_emulator_handle_request(TPMBackend *tb, TPMBackendCmd cmd)
++{
++    TPMEmulator *tpm_emu = TPM_EMULATOR(tb);
++    TPMLocality *locty = NULL;
++    bool selftest_done = false;
++    Error *err = NULL;
++
++    DPRINTF("processing command type %d", cmd);
++
++    switch (cmd) {
++    case TPM_BACKEND_CMD_PROCESS_CMD:
++        locty = tb->tpm_state->locty_data;
++        if (tpm_emulator_set_locality(tpm_emu,
++                                      tb->tpm_state->locty_number) < 0 ||
++            tpm_emulator_unix_tx_bufs(tpm_emu, locty->w_buffer.buffer,
++                                      locty->w_offset, locty->r_buffer.buffer,
++                                      locty->r_buffer.size, &selftest_done,
++                                      &err) < 0) {
++            tpm_util_write_fatal_error_response(locty->r_buffer.buffer,
++                                                locty->r_buffer.size);
++            error_report_err(err);
++        }
++
++        tb->recv_data_callback(tb->tpm_state, tb->tpm_state->locty_number,
++                               selftest_done);
++
++        break;
++    case TPM_BACKEND_CMD_INIT:
++    case TPM_BACKEND_CMD_END:
++    case TPM_BACKEND_CMD_TPM_RESET:
++        /* nothing to do */
++        break;
++    }
++}
++
++static int tpm_emulator_probe_caps(TPMEmulator *tpm_emu)
++{
++    DPRINTF("%s", __func__);
++    if (tpm_emulator_ctrlcmd(&tpm_emu->ctrl_chr, CMD_GET_CAPABILITY,
++                         &tpm_emu->caps, 0, sizeof(tpm_emu->caps)) < 0) {
++        error_report("tpm-emulator: probing failed : %s", strerror(errno));
++        return -1;
++    }
++
++    tpm_emu->caps = be64_to_cpu(tpm_emu->caps);
++
++    DPRINTF("capbilities : 0x%lx", tpm_emu->caps);
++
++    return 0;
++}
++
++static int tpm_emulator_check_caps(TPMEmulator *tpm_emu)
++{
++    ptm_cap caps = 0;
++    const char *tpm = NULL;
++
++    /* check for min. required capabilities */
++    switch (tpm_emu->tpm_version) {
++    case TPM_VERSION_1_2:
++        caps = PTM_CAP_INIT | PTM_CAP_SHUTDOWN | PTM_CAP_GET_TPMESTABLISHED |
++               PTM_CAP_SET_LOCALITY | PTM_CAP_SET_DATAFD;
++        tpm = "1.2";
++        break;
++    case TPM_VERSION_2_0:
++        caps = PTM_CAP_INIT | PTM_CAP_SHUTDOWN | PTM_CAP_GET_TPMESTABLISHED |
++               PTM_CAP_SET_LOCALITY | PTM_CAP_RESET_TPMESTABLISHED |
++               PTM_CAP_SET_DATAFD;
++        tpm = "2";
++        break;
++    case TPM_VERSION_UNSPEC:
++        error_report("tpm-emulator: TPM version has not been set");
++        return -1;
++    }
++
++    if (!TPM_EMULATOR_IMPLEMENTS_ALL_CAPS(tpm_emu, caps)) {
++        error_report("tpm-emulator: TPM does not implement minimum set of "
++                     "required capabilities for TPM %s (0x%x)", tpm, (int)caps);
++        return -1;
++    }
++
++    return 0;
++}
++
++static int tpm_emulator_startup_tpm(TPMBackend *tb)
++{
++    TPMEmulator *tpm_emu = TPM_EMULATOR(tb);
++    ptm_init init;
++    ptm_res res;
++
++    DPRINTF("%s", __func__);
++    if (tpm_emulator_ctrlcmd(&tpm_emu->ctrl_chr, CMD_INIT, &init, sizeof(init),
++                         sizeof(init)) < 0) {
++        error_report("tpm-emulator: could not send INIT: %s",
++                     strerror(errno));
++        goto err_exit;
++    }
++
++    res = be32_to_cpu(init.u.resp.tpm_result);
++    if (res) {
++        error_report("tpm-emulator: TPM result for CMD_INIT: 0x%x", res);
++        goto err_exit;
++    }
++    return 0;
++
++err_exit:
++    return -1;
++}
++
++static bool tpm_emulator_get_tpm_established_flag(TPMBackend *tb)
++{
++    TPMEmulator *tpm_emu = TPM_EMULATOR(tb);
++    ptm_est est;
++
++    DPRINTF("%s", __func__);
++    if (tpm_emulator_ctrlcmd(&tpm_emu->ctrl_chr, CMD_GET_TPMESTABLISHED, &est,
++                             0, sizeof(est)) < 0) {
++        error_report("tpm-emulator: Could not get the TPM established flag: %s",
++                     strerror(errno));
++        return false;
++    }
++    DPRINTF("established flag: %0x", est.u.resp.bit);
++
++    return (est.u.resp.bit != 0);
++}
++
++static int tpm_emulator_reset_tpm_established_flag(TPMBackend *tb,
++                                                   uint8_t locty)
++{
++    TPMEmulator *tpm_emu = TPM_EMULATOR(tb);
++    ptm_reset_est reset_est;
++    ptm_res res;
++
++    /* only a TPM 2.0 will support this */
++    if (tpm_emu->tpm_version != TPM_VERSION_2_0) {
++        return 0;
++    }
++
++    reset_est.u.req.loc = tpm_emu->cur_locty_number;
++    if (tpm_emulator_ctrlcmd(&tpm_emu->ctrl_chr, CMD_RESET_TPMESTABLISHED,
++                             &reset_est, sizeof(reset_est),
++                             sizeof(reset_est)) < 0) {
++        error_report("tpm-emulator: Could not reset the establishment bit: %s",
++                     strerror(errno));
++        return -1;
++    }
++
++    res = be32_to_cpu(reset_est.u.resp.tpm_result);
++    if (res) {
++        error_report("tpm-emulator: TPM result for rest establixhed flag: 0x%x",
++                     res);
++        return -1;
++    }
++
++    return 0;
++}
++
++static void tpm_emulator_cancel_cmd(TPMBackend *tb)
++{
++    TPMEmulator *tpm_emu = TPM_EMULATOR(tb);
++    ptm_res res;
++
++    if (!TPM_EMULATOR_IMPLEMENTS_ALL_CAPS(tpm_emu, PTM_CAP_CANCEL_TPM_CMD)) {
++        DPRINTF("Backend does not support CANCEL_TPM_CMD");
++        return;
++    }
++
++    if (tpm_emulator_ctrlcmd(&tpm_emu->ctrl_chr, CMD_CANCEL_TPM_CMD, &res, 0,
++                             sizeof(res)) < 0) {
++        error_report("tpm-emulator: Could not cancel command: %s",
++                     strerror(errno));
++    } else if (res != 0) {
++        error_report("tpm-emulator: Failed to cancel TPM: 0x%x",
++                     be32_to_cpu(res));
++    }
++}
++
++static TPMVersion tpm_emulator_get_tpm_version(TPMBackend *tb)
++{
++    TPMEmulator *tpm_emu = TPM_EMULATOR(tb);
++
++    return tpm_emu->tpm_version;
++}
++
++static int tpm_emulator_block_migration(TPMEmulator *tpm_emu)
++{
++    Error *err = NULL;
++
++    error_setg(&tpm_emu->migration_blocker,
++               "Migration disabled: TPM emulator not yet migratable");
++    migrate_add_blocker(tpm_emu->migration_blocker, &err);
++    if (err) {
++        error_report_err(err);
++        error_free(tpm_emu->migration_blocker);
++        tpm_emu->migration_blocker = NULL;
++    
++        return -1;
++    }
++
++    return 0;
++}
++
++static int tpm_emulator_prepare_data_fd(TPMEmulator *tpm_emu)
++{
++    ptm_res res;
++    Error *err = NULL;
++    int fds[2] = { -1, -1 };
++
++    if (socketpair(AF_UNIX, SOCK_STREAM, 0, fds) < 0) {
++        error_report("tpm-emulator: Failed to create socketpair");
++        return -1;
++    }
++
++    qemu_chr_fe_set_msgfds(&tpm_emu->ctrl_chr, fds + 1, 1);
++
++    if (tpm_emulator_ctrlcmd(&tpm_emu->ctrl_chr, CMD_SET_DATAFD, &res, 0,
++                    sizeof(res)) || res != 0) {
++        error_report("tpm-emulator: Failed to send CMD_SET_DATAFD: %s",
++                     strerror(errno));
++        goto err_exit;
++    }
++
++    tpm_emu->data_ioc = QIO_CHANNEL(qio_channel_socket_new_fd(fds[0], &err));
++    if (err) {
++        error_prepend(&err, "tpm-emulator: Failed to create io channel: ");
++        error_report_err(err);
++        goto err_exit;
++    }
++
++    closesocket(fds[1]);
++
++    return 0;
++
++err_exit:
++    closesocket(fds[0]);
++    closesocket(fds[1]);
++    return -1;
++}
++
++static int tpm_emulator_handle_device_opts(TPMEmulator *tpm_emu, QemuOpts *opts)
++{
++    const char *value;
++
++    value = qemu_opt_get(opts, "chardev");
++    if (value) {
++        Error *err = NULL;
++        Chardev *dev = qemu_chr_find(value);
++
++        if (!dev) {
++            error_report("tpm-emulator: tpm chardev '%s' not found.", value);
++            goto err;
++        }
++
++        if (!qemu_chr_fe_init(&tpm_emu->ctrl_chr, dev, &err)) {
++            error_prepend(&err, "tpm-emulator: No valid chardev found at '%s':",
++                          value);
++            error_report_err(err);
++            goto err;
++        }
++
++        tpm_emu->options->chardev = g_strdup(value);
++    }
++
++    if (tpm_emulator_prepare_data_fd(tpm_emu) < 0) {
++        goto err;
++    }
++
++    /* FIXME: tpm_util_test_tpmdev() accepts only on socket fd, as it also used
++     * by passthrough driver, which not yet using GIOChannel.
++     */
++    if (tpm_util_test_tpmdev(QIO_CHANNEL_SOCKET(tpm_emu->data_ioc)->fd,
++                             &tpm_emu->tpm_version)) {
++        error_report("'%s' is not emulating TPM device. Error: %s",
++                      tpm_emu->options->chardev, strerror(errno));
++        goto err;
++    }
++
++    DPRINTF("TPM Version %s", tpm_emu->tpm_version == TPM_VERSION_1_2 ? "1.2" :
++            (tpm_emu->tpm_version == TPM_VERSION_2_0 ?  "2.0" : "Unspecified"));
++
++    if (tpm_emulator_probe_caps(tpm_emu) ||
++        tpm_emulator_check_caps(tpm_emu)) {
++        goto err;
++    }
++
++    return tpm_emulator_block_migration(tpm_emu);
++
++err:
++    DPRINTF("Startup error");
++    return -1;
++}
++
++static TPMBackend *tpm_emulator_create(QemuOpts *opts, const char *id)
++{
++    TPMBackend *tb = TPM_BACKEND(object_new(TYPE_TPM_EMULATOR));
++
++    tb->id = g_strdup(id);
++
++    if (tpm_emulator_handle_device_opts(TPM_EMULATOR(tb), opts)) {
++        goto err_exit;
++    }
++
++    return tb;
++
++err_exit:
++    object_unref(OBJECT(tb));
++
++    return NULL;
++}
++
++static TpmTypeOptions *tpm_emulator_get_tpm_options(TPMBackend *tb)
++{
++    TPMEmulator *tpm_emu = TPM_EMULATOR(tb);
++    TpmTypeOptions *options = g_new0(TpmTypeOptions, 1);
++
++    options->type = TPM_TYPE_OPTIONS_KIND_EMULATOR;
++    options->u.emulator.data = QAPI_CLONE(TPMEmulatorOptions, tpm_emu->options);
++
++    return options;
++}
++
++static const QemuOptDesc tpm_emulator_cmdline_opts[] = {
++    TPM_STANDARD_CMDLINE_OPTS,
++    {
++        .name = "chardev",
++        .type = QEMU_OPT_STRING,
++        .help = "Character device to use for out-of-band control messages",
++    },
++    { /* end of list */ },
++};
++
++static const TPMDriverOps tpm_emulator_driver = {
++    .type                     = TPM_TYPE_EMULATOR,
++    .opts                     = tpm_emulator_cmdline_opts,
++    .desc                     = "TPM emulator backend driver",
++
++    .create                   = tpm_emulator_create,
++    .startup_tpm              = tpm_emulator_startup_tpm,
++    .cancel_cmd               = tpm_emulator_cancel_cmd,
++    .get_tpm_established_flag = tpm_emulator_get_tpm_established_flag,
++    .reset_tpm_established_flag = tpm_emulator_reset_tpm_established_flag,
++    .get_tpm_version          = tpm_emulator_get_tpm_version,
++    .get_tpm_options          = tpm_emulator_get_tpm_options,
++};
++
++static void tpm_emulator_inst_init(Object *obj)
++{
++    TPMEmulator *tpm_emu = TPM_EMULATOR(obj);
++
++    DPRINTF("%s", __func__);
++    tpm_emu->options = g_new0(TPMEmulatorOptions, 1);
++    tpm_emu->cur_locty_number = ~0;
++}
++
++/*
++ * Gracefully shut down the external TPM
++ */
++static void tpm_emulator_shutdown(TPMEmulator *tpm_emu)
++{
++    ptm_res res;
++
++    if (tpm_emulator_ctrlcmd(&tpm_emu->ctrl_chr, CMD_SHUTDOWN, &res, 0,
++                             sizeof(res)) < 0) {
++        error_report("tpm-emulator: Could not cleanly shutdown the TPM: %s",
++                     strerror(errno));
++    } else if (res != 0) {
++        error_report("tpm-emulator: TPM result for sutdown: 0x%x",
++                     be32_to_cpu(res));
++    }
++}
++
++static void tpm_emulator_inst_finalize(Object *obj)
++{
++    TPMEmulator *tpm_emu = TPM_EMULATOR(obj);
++
++    tpm_emulator_shutdown(tpm_emu);
++
++    object_unref(OBJECT(tpm_emu->data_ioc));
++
++    qemu_chr_fe_deinit(&tpm_emu->ctrl_chr, false);
++
++    qapi_free_TPMEmulatorOptions(tpm_emu->options);
++
++    if (tpm_emu->migration_blocker) {
++        migrate_del_blocker(tpm_emu->migration_blocker);
++        error_free(tpm_emu->migration_blocker);
++    }
++}
++
++static void tpm_emulator_class_init(ObjectClass *klass, void *data)
++{
++    TPMBackendClass *tbc = TPM_BACKEND_CLASS(klass);
++    tbc->ops = &tpm_emulator_driver;
++    tbc->handle_request = tpm_emulator_handle_request;
++}
++
++static const TypeInfo tpm_emulator_info = {
++    .name = TYPE_TPM_EMULATOR,
++    .parent = TYPE_TPM_BACKEND,
++    .instance_size = sizeof(TPMEmulator),
++    .class_init = tpm_emulator_class_init,
++    .instance_init = tpm_emulator_inst_init,
++    .instance_finalize = tpm_emulator_inst_finalize,
++};
++
++static void tpm_emulator_register(void)
++{
++    type_register_static(&tpm_emulator_info);
++    tpm_register_driver(&tpm_emulator_driver);
++}
++
++type_init(tpm_emulator_register)
+diff --git a/hw/tpm/tpm_ioctl.h b/hw/tpm/tpm_ioctl.h
+new file mode 100644
+index 0000000000..33564b11de
+--- /dev/null
++++ b/hw/tpm/tpm_ioctl.h
+@@ -0,0 +1,246 @@
++/*
++ * tpm_ioctl.h
++ *
++ * (c) Copyright IBM Corporation 2014, 2015.
++ *
++ * This file is licensed under the terms of the 3-clause BSD license
++ */
++#ifndef _TPM_IOCTL_H_
++#define _TPM_IOCTL_H_
++
++#include <stdint.h>
++#include <sys/uio.h>
++#include <sys/types.h>
++#include <sys/ioctl.h>
++
++/*
++ * Every response from a command involving a TPM command execution must hold
++ * the ptm_res as the first element.
++ * ptm_res corresponds to the error code of a command executed by the TPM.
++ */
++
++typedef uint32_t ptm_res;
++
++/* PTM_GET_TPMESTABLISHED: get the establishment bit */
++struct ptm_est {
++    union {
++        struct {
++            ptm_res tpm_result;
++            unsigned char bit; /* TPM established bit */
++        } resp; /* response */
++    } u;
++};
++
++/* PTM_RESET_TPMESTABLISHED: reset establishment bit */
++struct ptm_reset_est {
++    union {
++        struct {
++            uint8_t loc; /* locality to use */
++        } req; /* request */
++        struct {
++            ptm_res tpm_result;
++        } resp; /* response */
++    } u;
++};
++
++/* PTM_INIT */
++struct ptm_init {
++    union {
++        struct {
++            uint32_t init_flags; /* see definitions below */
++        } req; /* request */
++        struct {
++            ptm_res tpm_result;
++        } resp; /* response */
++    } u;
++};
++
++/* above init_flags */
++#define PTM_INIT_FLAG_DELETE_VOLATILE (1 << 0)
++    /* delete volatile state file after reading it */
++
++/* PTM_SET_LOCALITY */
++struct ptm_loc {
++    union {
++        struct {
++            uint8_t loc; /* locality to set */
++        } req; /* request */
++        struct {
++            ptm_res tpm_result;
++        } resp; /* response */
++    } u;
++};
++
++/* PTM_HASH_DATA: hash given data */
++struct ptm_hdata {
++    union {
++        struct {
++            uint32_t length;
++            uint8_t data[4096];
++        } req; /* request */
++        struct {
++            ptm_res tpm_result;
++        } resp; /* response */
++    } u;
++};
++
++/*
++ * size of the TPM state blob to transfer; x86_64 can handle 8k,
++ * ppc64le only ~7k; keep the response below a 4k page size
++ */
++#define PTM_STATE_BLOB_SIZE (3 * 1024)
++
++/*
++ * The following is the data structure to get state blobs from the TPM.
++ * If the size of the state blob exceeds the PTM_STATE_BLOB_SIZE, multiple reads
++ * with this ioctl and with adjusted offset are necessary. All bytes
++ * must be transferred and the transfer is done once the last byte has been
++ * returned.
++ * It is possible to use the read() interface for reading the data; however, the
++ * first bytes of the state blob will be part of the response to the ioctl(); a
++ * subsequent read() is only necessary if the total length (totlength) exceeds
++ * the number of received bytes. seek() is not supported.
++ */
++struct ptm_getstate {
++    union {
++        struct {
++            uint32_t state_flags; /* may be: PTM_STATE_FLAG_DECRYPTED */
++            uint32_t type;        /* which blob to pull */
++            uint32_t offset;      /* offset from where to read */
++        } req; /* request */
++        struct {
++            ptm_res tpm_result;
++            uint32_t state_flags; /* may be: PTM_STATE_FLAG_ENCRYPTED */
++            uint32_t totlength;   /* total length that will be transferred */
++            uint32_t length;      /* number of bytes in following buffer */
++            uint8_t  data[PTM_STATE_BLOB_SIZE];
++        } resp; /* response */
++    } u;
++};
++
++/* TPM state blob types */
++#define PTM_BLOB_TYPE_PERMANENT  1
++#define PTM_BLOB_TYPE_VOLATILE   2
++#define PTM_BLOB_TYPE_SAVESTATE  3
++
++/* state_flags above : */
++#define PTM_STATE_FLAG_DECRYPTED     1 /* on input:  get decrypted state */
++#define PTM_STATE_FLAG_ENCRYPTED     2 /* on output: state is encrypted */
++
++/*
++ * The following is the data structure to set state blobs in the TPM.
++ * If the size of the state blob exceeds the PTM_STATE_BLOB_SIZE, multiple
++ * 'writes' using this ioctl are necessary. The last packet is indicated
++ * by the length being smaller than the PTM_STATE_BLOB_SIZE.
++ * The very first packet may have a length indicator of '0' enabling
++ * a write() with all the bytes from a buffer. If the write() interface
++ * is used, a final ioctl with a non-full buffer must be made to indicate
++ * that all data were transferred (a write with 0 bytes would not work).
++ */
++struct ptm_setstate {
++    union {
++        struct {
++            uint32_t state_flags; /* may be PTM_STATE_FLAG_ENCRYPTED */
++            uint32_t type;        /* which blob to set */
++            uint32_t length;      /* length of the data;
++                                     use 0 on the first packet to
++                                     transfer using write() */
++            uint8_t data[PTM_STATE_BLOB_SIZE];
++        } req; /* request */
++        struct {
++            ptm_res tpm_result;
++        } resp; /* response */
++    } u;
++};
++
++/*
++ * PTM_GET_CONFIG: Data structure to get runtime configuration information
++ * such as which keys are applied.
++ */
++struct ptm_getconfig {
++    union {
++        struct {
++            ptm_res tpm_result;
++            uint32_t flags;
++        } resp; /* response */
++    } u;
++};
++
++#define PTM_CONFIG_FLAG_FILE_KEY        0x1
++#define PTM_CONFIG_FLAG_MIGRATION_KEY   0x2
++
++
++typedef uint64_t ptm_cap;
++typedef struct ptm_est ptm_est;
++typedef struct ptm_reset_est ptm_reset_est;
++typedef struct ptm_loc ptm_loc;
++typedef struct ptm_hdata ptm_hdata;
++typedef struct ptm_init ptm_init;
++typedef struct ptm_getstate ptm_getstate;
++typedef struct ptm_setstate ptm_setstate;
++typedef struct ptm_getconfig ptm_getconfig;
++
++/* capability flags returned by PTM_GET_CAPABILITY */
++#define PTM_CAP_INIT               (1)
++#define PTM_CAP_SHUTDOWN           (1 << 1)
++#define PTM_CAP_GET_TPMESTABLISHED (1 << 2)
++#define PTM_CAP_SET_LOCALITY       (1 << 3)
++#define PTM_CAP_HASHING            (1 << 4)
++#define PTM_CAP_CANCEL_TPM_CMD     (1 << 5)
++#define PTM_CAP_STORE_VOLATILE     (1 << 6)
++#define PTM_CAP_RESET_TPMESTABLISHED (1 << 7)
++#define PTM_CAP_GET_STATEBLOB      (1 << 8)
++#define PTM_CAP_SET_STATEBLOB      (1 << 9)
++#define PTM_CAP_STOP               (1 << 10)
++#define PTM_CAP_GET_CONFIG         (1 << 11)
++#define PTM_CAP_SET_DATAFD         (1 << 12)
++
++enum {
++    PTM_GET_CAPABILITY     = _IOR('P', 0, ptm_cap),
++    PTM_INIT               = _IOWR('P', 1, ptm_init),
++    PTM_SHUTDOWN           = _IOR('P', 2, ptm_res),
++    PTM_GET_TPMESTABLISHED = _IOR('P', 3, ptm_est),
++    PTM_SET_LOCALITY       = _IOWR('P', 4, ptm_loc),
++    PTM_HASH_START         = _IOR('P', 5, ptm_res),
++    PTM_HASH_DATA          = _IOWR('P', 6, ptm_hdata),
++    PTM_HASH_END           = _IOR('P', 7, ptm_res),
++    PTM_CANCEL_TPM_CMD     = _IOR('P', 8, ptm_res),
++    PTM_STORE_VOLATILE     = _IOR('P', 9, ptm_res),
++    PTM_RESET_TPMESTABLISHED = _IOWR('P', 10, ptm_reset_est),
++    PTM_GET_STATEBLOB      = _IOWR('P', 11, ptm_getstate),
++    PTM_SET_STATEBLOB      = _IOWR('P', 12, ptm_setstate),
++    PTM_STOP               = _IOR('P', 13, ptm_res),
++    PTM_GET_CONFIG         = _IOR('P', 14, ptm_getconfig),
++    PTM_SET_DATAFD         = _IOR('P', 15, ptm_res),
++};
++
++/*
++ * Commands used by the non-CUSE TPMs
++ *
++ * All messages container big-endian data.
++ *
++ * The return messages only contain the 'resp' part of the unions
++ * in the data structures above. Besides that the limits in the
++ * buffers above (ptm_hdata:u.req.data and ptm_get_state:u.resp.data
++ * and ptm_set_state:u.req.data) are 0xffffffff.
++ */
++enum {
++    CMD_GET_CAPABILITY = 1,
++    CMD_INIT,
++    CMD_SHUTDOWN,
++    CMD_GET_TPMESTABLISHED,
++    CMD_SET_LOCALITY,
++    CMD_HASH_START,
++    CMD_HASH_DATA,
++    CMD_HASH_END,
++    CMD_CANCEL_TPM_CMD,
++    CMD_STORE_VOLATILE,
++    CMD_RESET_TPMESTABLISHED,
++    CMD_GET_STATEBLOB,
++    CMD_SET_STATEBLOB,
++    CMD_STOP,
++    CMD_GET_CONFIG,
++    CMD_SET_DATAFD
++};
++
++#endif /* _TPM_IOCTL_H */
+diff --git a/qapi-schema.json b/qapi-schema.json
+index 802ea53d00..78a00bc868 100644
+--- a/qapi-schema.json
++++ b/qapi-schema.json
+@@ -5314,10 +5314,12 @@
+ # An enumeration of TPM types
+ #
+ # @passthrough: TPM passthrough type
++# @emulator: Software Emulator TPM type
++#            Since: 2.11
+ #
+ # Since: 1.5
+ ##
+-{ 'enum': 'TpmType', 'data': [ 'passthrough' ] }
++{ 'enum': 'TpmType', 'data': [ 'passthrough', 'emulator' ] }
+ 
+ ##
+ # @query-tpm-types:
+@@ -5352,6 +5354,17 @@
+                                              '*cancel-path' : 'str'} }
+ 
+ ##
++# @TPMEmulatorOptions:
++#
++# Information about the TPM emulator type
++#
++# @chardev: Name of a unix socket chardev
++#
++# Since: 2.11
++##
++{ 'struct': 'TPMEmulatorOptions', 'data': { 'chardev' : 'str' } }
++
++##
+ # @TpmTypeOptions:
+ #
+ # A union referencing different TPM backend types' configuration options
+@@ -5361,7 +5374,8 @@
+ # Since: 1.5
+ ##
+ { 'union': 'TpmTypeOptions',
+-   'data': { 'passthrough' : 'TPMPassthroughOptions' } }
++   'data': { 'passthrough' : 'TPMPassthroughOptions',
++             'emulator': 'TPMEmulatorOptions'} }
+ 
+ ##
+ # @TPMInfo:
+diff --git a/qemu-options.hx b/qemu-options.hx
+index 9f6e2adfff..60eb193c23 100644
+--- a/qemu-options.hx
++++ b/qemu-options.hx
+@@ -3121,7 +3121,9 @@ DEF("tpmdev", HAS_ARG, QEMU_OPTION_tpmdev, \
+     "-tpmdev passthrough,id=id[,path=path][,cancel-path=path]\n"
+     "                use path to provide path to a character device; default is /dev/tpm0\n"
+     "                use cancel-path to provide path to TPM's cancel sysfs entry; if\n"
+-    "                not provided it will be searched for in /sys/class/misc/tpm?/device\n",
++    "                not provided it will be searched for in /sys/class/misc/tpm?/device\n"
++    "-tpmdev emulator,id=id,chardev=dev\n"
++    "                configure the TPM device using chardev backend\n",
+     QEMU_ARCH_ALL)
+ STEXI
+ 
+@@ -3130,8 +3132,8 @@ The general form of a TPM device option is:
+ 
+ @item -tpmdev @var{backend} ,id=@var{id} [,@var{options}]
+ @findex -tpmdev
+-Backend type must be:
+-@option{passthrough}.
++Backend type must be either one of the following:
++@option{passthrough}, @option{emulator}.
+ 
+ The specific backend type will determine the applicable options.
+ The @code{-tpmdev} option creates the TPM backend and requires a
+@@ -3181,6 +3183,20 @@ To create a passthrough TPM use the following two options:
+ Note that the @code{-tpmdev} id is @code{tpm0} and is referenced by
+ @code{tpmdev=tpm0} in the device option.
+ 
++@item -tpmdev emulator, id=@var{id}, chardev=@var{dev}
++
++(Linux-host only) Enable access to a TPM emulator using Unix domain socket based
++chardev backend.
++
++@option{chardev} specifies the unique ID of a character device backend that provides connection to the software TPM server.
++
++To create a TPM emulator backend device with chardev socket backend:
++@example
++
++-chardev socket,id=chrtpm,path=/tmp/swtpm-sock -tpmdev emulator,id=tpm0,chardev=chrtpm -device tpm-tis,tpmdev=tpm0
++
++@end example
++
+ @end table
+ 
+ ETEXI
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/qemu/qemu/0011-tpm-Move-tpm_cleanup-to-right-place.patch b/meta/recipes-devtools/qemu/qemu/0011-tpm-Move-tpm_cleanup-to-right-place.patch
new file mode 100644
index 0000000..f4998e1
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0011-tpm-Move-tpm_cleanup-to-right-place.patch
@@ -0,0 +1,43 @@
+From 22429d175911af2e57617a30e0ac097af74f2791 Mon Sep 17 00:00:00 2001
+From: Amarnath Valluri <amarnath.valluri@intel.com>
+Date: Fri, 29 Sep 2017 12:57:33 +0300
+Subject: [PATCH 11/12] tpm: Move tpm_cleanup() to right place
+
+As Emulator TPM backend uses chardev, tpm cleanup should happen before chardev
+similar to other vhost-users.
+
+Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
+
+Upstream-Status: Backport [c37cacabf2285b0731b44c1f667781fdd4f2b658]
+---
+ tpm.c | 1 -
+ vl.c  | 1 +
+ 2 files changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tpm.c b/tpm.c
+index cac400ef3e..4a9d3d739e 100644
+--- a/tpm.c
++++ b/tpm.c
+@@ -173,7 +173,6 @@ int tpm_init(void)
+         return -1;
+     }
+ 
+-    atexit(tpm_cleanup);
+     return 0;
+ }
+ 
+diff --git a/vl.c b/vl.c
+index 8e247cc2a2..5df0b7f205 100644
+--- a/vl.c
++++ b/vl.c
+@@ -4797,6 +4797,7 @@ int main(int argc, char **argv, char **envp)
+     res_free();
+ 
+     /* vhost-user must be cleaned up before chardevs.  */
++    tpm_cleanup();
+     net_cleanup();
+     audio_cleanup();
+     monitor_cleanup();
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/qemu/qemu/0012-tpm-Use-EMSGSIZE-instead-of-EBADMSG-to-compile-on-Op.patch b/meta/recipes-devtools/qemu/qemu/0012-tpm-Use-EMSGSIZE-instead-of-EBADMSG-to-compile-on-Op.patch
new file mode 100644
index 0000000..430fe1b
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0012-tpm-Use-EMSGSIZE-instead-of-EBADMSG-to-compile-on-Op.patch
@@ -0,0 +1,67 @@
+From c559d599c6880caf7aa0f0a60c6c023584e1b8ad Mon Sep 17 00:00:00 2001
+From: Stefan Berger <stefanb@linux.vnet.ibm.com>
+Date: Wed, 11 Oct 2017 08:52:43 -0400
+Subject: [PATCH 12/12] tpm: Use EMSGSIZE instead of EBADMSG to compile on
+ OpenBSD
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+EBADMSG was only added to OpenBSD very recently. To make QEMU compilable
+on older OpenBSD versions use EMSGSIZE instead when a mismatch between
+number of received bytes and message size indicated in the header was
+found.
+
+Return -EMSGSIZE and convert all other errnos in the same functions to
+return the negative errno.
+
+Signed-off-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
+Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
+
+Upstream-Status: Backport [98979cdca44ba0e21055ee7736694aa5ebb54347]
+---
+ hw/tpm/tpm_util.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/hw/tpm/tpm_util.c b/hw/tpm/tpm_util.c
+index fb929f6e92..73d77965fd 100644
+--- a/hw/tpm/tpm_util.c
++++ b/hw/tpm/tpm_util.c
+@@ -68,10 +68,10 @@ static int tpm_util_test(int fd,
+ 
+     n = write(fd, request, requestlen);
+     if (n < 0) {
+-        return errno;
++        return -errno;
+     }
+     if (n != requestlen) {
+-        return EFAULT;
++        return -EFAULT;
+     }
+ 
+     FD_ZERO(&readfds);
+@@ -80,18 +80,18 @@ static int tpm_util_test(int fd,
+     /* wait for a second */
+     n = select(fd + 1, &readfds, NULL, NULL, &tv);
+     if (n != 1) {
+-        return errno;
++        return -errno;
+     }
+ 
+     n = read(fd, &buf, sizeof(buf));
+     if (n < sizeof(struct tpm_resp_hdr)) {
+-        return EFAULT;
++        return -EFAULT;
+     }
+ 
+     resp = (struct tpm_resp_hdr *)buf;
+     /* check the header */
+     if (be32_to_cpu(resp->len) != n) {
+-        return EBADMSG;
++        return -EMSGSIZE;
+     }
+ 
+     *return_tag = be16_to_cpu(resp->tag);
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/qemu/qemu/chardev-connect-socket-to-a-spawned-command.patch b/meta/recipes-devtools/qemu/qemu/chardev-connect-socket-to-a-spawned-command.patch
new file mode 100644
index 0000000..49d4af2
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/chardev-connect-socket-to-a-spawned-command.patch
@@ -0,0 +1,227 @@
+From aa3aef4cf5f4dd98f9133df085e825ff5da7dcbd Mon Sep 17 00:00:00 2001
+From: Patrick Ohly <patrick.ohly@intel.com>
+Date: Fri, 27 Oct 2017 15:23:35 +0200
+Subject: [PATCH] chardev: connect socket to a spawned command
+
+The command is started in a shell (sh -c) with stdin connect to QEMU
+via a Unix domain stream socket. QEMU then exchanges data via its own
+end of the socket, just like it normally does.
+
+"-chardev socket" supports some ways of connecting via protocols like
+telnet, but that is only a subset of the functionality supported by
+tools socat. To use socat instead, for example to connect via a socks
+proxy, use:
+
+  -chardev 'socket,id=socat,cmd=exec socat FD:0 SOCKS4A:socks-proxy.localdomain:example.com:9999,,socksuser=nobody' \
+  -device usb-serial,chardev=socat
+
+Beware that commas in the command must be escaped as double commas.
+
+Or interactively in the console:
+   (qemu) chardev-add socket,id=cat,cmd=cat
+   (qemu) device_add usb-serial,chardev=cat
+   ^ac
+   # cat >/dev/ttyUSB0
+   hello
+   hello
+
+Another usage is starting swtpm from inside QEMU. swtpm will
+automatically shut down once it looses the connection to the parent
+QEMU, so there is no risk of lingering processes:
+
+  -chardev 'socket,id=chrtpm0,cmd=exec swtpm socket --terminate --ctrl type=unixio,,clientfd=0 --tpmstate dir=... --log file=swtpm.log' \
+  -tpmdev emulator,id=tpm0,chardev=chrtpm0 \
+  -device tpm-tis,tpmdev=tpm0
+
+The patch was discussed upstream, but QEMU developers believe that the
+code calling QEMU should be responsible for managing additional
+processes. In OE-core, that would imply enhancing runqemu and
+oeqa. This patch is a simpler solution.
+
+Because it is not going upstream, the patch was written so that it is
+as simple as possible.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
+
+---
+ chardev/char-socket.c | 86 ++++++++++++++++++++++++++++++++++++++++++++++++---
+ chardev/char.c        |  3 ++
+ qapi-schema.json      |  5 +++
+ 3 files changed, 90 insertions(+), 4 deletions(-)
+
+diff --git a/chardev/char-socket.c b/chardev/char-socket.c
+index 1ae730a4..c366a02a 100644
+--- a/chardev/char-socket.c
++++ b/chardev/char-socket.c
+@@ -854,6 +854,66 @@ static gboolean socket_reconnect_timeout(gpointer opaque)
+     return false;
+ }
+ 
++static void chardev_open_socket_cmd(Chardev *chr,
++                                    const char *cmd,
++                                    Error **errp)
++{
++    int fds[2] = { -1, -1 };
++    QIOChannelSocket *sioc = NULL;
++    pid_t pid = -1;
++    const char *argv[] = { "/bin/sh", "-c", cmd, NULL };
++
++    /*
++     * We need a Unix domain socket for commands like swtpm and a single
++     * connection, therefore we cannot use qio_channel_command_new_spawn()
++     * without patching it first. Duplicating the functionality is easier.
++     */
++    if (socketpair(AF_UNIX, SOCK_STREAM|SOCK_CLOEXEC, 0, fds)) {
++        error_setg_errno(errp, errno, "Error creating socketpair(AF_UNIX, SOCK_STREAM|SOCK_CLOEXEC)");
++        goto error;
++    }
++
++    pid = qemu_fork(errp);
++    if (pid < 0) {
++        goto error;
++    }
++
++    if (!pid) {
++        /* child */
++        dup2(fds[1], STDIN_FILENO);
++        execv(argv[0], (char * const *)argv);
++        _exit(1);
++    }
++
++    /*
++     * Hand over our end of the socket pair to the qio channel.
++     *
++     * We don't reap the child because it is expected to keep
++     * running. We also don't support the "reconnect" option for the
++     * same reason.
++     */
++    sioc = qio_channel_socket_new_fd(fds[0], errp);
++    if (!sioc) {
++        goto error;
++    }
++    fds[0] = -1;
++
++    g_free(chr->filename);
++    chr->filename = g_strdup_printf("cmd:%s", cmd);
++    tcp_chr_new_client(chr, sioc);
++
++ error:
++    if (fds[0] >= 0) {
++        close(fds[0]);
++    }
++    if (fds[1] >= 0) {
++        close(fds[1]);
++    }
++    if (sioc) {
++        object_unref(OBJECT(sioc));
++    }
++}
++
+ static void qmp_chardev_open_socket(Chardev *chr,
+                                     ChardevBackend *backend,
+                                     bool *be_opened,
+@@ -861,6 +921,7 @@ static void qmp_chardev_open_socket(Chardev *chr,
+ {
+     SocketChardev *s = SOCKET_CHARDEV(chr);
+     ChardevSocket *sock = backend->u.socket.data;
++    const char *cmd     = sock->cmd;
+     bool do_nodelay     = sock->has_nodelay ? sock->nodelay : false;
+     bool is_listen      = sock->has_server  ? sock->server  : true;
+     bool is_telnet      = sock->has_telnet  ? sock->telnet  : false;
+@@ -928,7 +989,12 @@ static void qmp_chardev_open_socket(Chardev *chr,
+         s->reconnect_time = reconnect;
+     }
+ 
+-    if (s->reconnect_time) {
++    if (cmd) {
++        chardev_open_socket_cmd(chr, cmd, errp);
++
++        /* everything ready (or failed permanently) before we return */
++        *be_opened = true;
++    } else if (s->reconnect_time) {
+         sioc = qio_channel_socket_new();
+         tcp_chr_set_client_ioc_name(chr, sioc);
+         qio_channel_socket_connect_async(sioc, s->addr,
+@@ -987,11 +1053,22 @@ static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend *backend,
+     const char *host = qemu_opt_get(opts, "host");
+     const char *port = qemu_opt_get(opts, "port");
+     const char *tls_creds = qemu_opt_get(opts, "tls-creds");
++    const char *cmd = qemu_opt_get(opts, "cmd");
+     SocketAddressLegacy *addr;
+     ChardevSocket *sock;
+ 
+     backend->type = CHARDEV_BACKEND_KIND_SOCKET;
+-    if (!path) {
++    if (cmd) {
++        /*
++         * Here we have to ensure that no options are set which are incompatible with
++         * spawning a command, otherwise unmodified code that doesn't know about
++         * command spawning (like socket_reconnect_timeout()) might get called.
++         */
++        if (path || is_listen || is_telnet || is_tn3270 || reconnect || host || port || tls_creds) {
++            error_setg(errp, "chardev: socket: cmd does not support any additional options");
++            return;
++        }
++    } else if (!path) {
+         if (!host) {
+             error_setg(errp, "chardev: socket: no host given");
+             return;
+@@ -1023,13 +1100,14 @@ static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend *backend,
+     sock->has_reconnect = true;
+     sock->reconnect = reconnect;
+     sock->tls_creds = g_strdup(tls_creds);
++    sock->cmd = g_strdup(cmd);
+ 
+     addr = g_new0(SocketAddressLegacy, 1);
+-    if (path) {
++    if (path || cmd) {
+         UnixSocketAddress *q_unix;
+         addr->type = SOCKET_ADDRESS_LEGACY_KIND_UNIX;
+         q_unix = addr->u.q_unix.data = g_new0(UnixSocketAddress, 1);
+-        q_unix->path = g_strdup(path);
++        q_unix->path = cmd ? g_strdup_printf("cmd:%s", cmd) : g_strdup(path);
+     } else {
+         addr->type = SOCKET_ADDRESS_LEGACY_KIND_INET;
+         addr->u.inet.data = g_new(InetSocketAddress, 1);
+diff --git a/chardev/char.c b/chardev/char.c
+index 5d283b90..ccb329d4 100644
+--- a/chardev/char.c
++++ b/chardev/char.c
+@@ -782,6 +782,9 @@ QemuOptsList qemu_chardev_opts = {
+             .name = "path",
+             .type = QEMU_OPT_STRING,
+         },{
++            .name = "cmd",
++            .type = QEMU_OPT_STRING,
++        },{
+             .name = "host",
+             .type = QEMU_OPT_STRING,
+         },{
+diff --git a/qapi-schema.json b/qapi-schema.json
+index 78a00bc8..790b026d 100644
+--- a/qapi-schema.json
++++ b/qapi-schema.json
+@@ -5004,6 +5004,10 @@
+ #
+ # @addr: socket address to listen on (server=true)
+ #        or connect to (server=false)
++# @cmd: command to run via "sh -c" with stdin as one end of
++#       a AF_UNIX SOCK_DSTREAM socket pair. The other end
++#       is used by the chardev. Either an addr or a cmd can
++#       be specified, but not both.
+ # @tls-creds: the ID of the TLS credentials object (since 2.6)
+ # @server: create server socket (default: true)
+ # @wait: wait for incoming connection on server
+@@ -5021,6 +5025,7 @@
+ # Since: 1.4
+ ##
+ { 'struct': 'ChardevSocket', 'data': { 'addr'       : 'SocketAddressLegacy',
++                                     '*cmd'       : 'str',
+                                      '*tls-creds'  : 'str',
+                                      '*server'    : 'bool',
+                                      '*wait'      : 'bool',
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/qemu/qemu_2.10.0.bb b/meta/recipes-devtools/qemu/qemu_2.10.0.bb
index 75e2a25..c8c2f51 100644
--- a/meta/recipes-devtools/qemu/qemu_2.10.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.10.0.bb
@@ -19,10 +19,19 @@ SRC_URI = "http://wiki.qemu-project.org/download/${BP}.tar.bz2 \
            file://pathlimit.patch \
            file://qemu-2.5.0-cflags.patch \
            file://glibc-2.25.patch \
-           file://0001-Provide-support-for-the-CUSE-TPM.patch \
-           file://0002-Introduce-condition-to-notify-waiters-of-completed-c.patch \
-           file://0003-Introduce-condition-in-TPM-backend-for-notification.patch \
-           file://0004-Add-support-for-VM-suspend-resume-for-TPM-TIS-v2.9.patch \
+           file://0001-tpm-Clean-up-driver-registration-lookup.patch \
+           file://0002-tpm-Clean-up-model-registration-lookup.patch \
+           file://0003-tpm-backend-Remove-unneeded-member-variable-from-bac.patch \
+           file://0004-tpm-backend-Move-thread-handling-inside-TPMBackend.patch \
+           file://0005-tpm-backend-Initialize-and-free-data-members-in-it-s.patch \
+           file://0006-tpm-backend-Made-few-interface-methods-optional.patch \
+           file://0007-tpm-backend-Add-new-api-to-read-backend-TpmInfo.patch \
+           file://0008-tpm-backend-Move-realloc_buffer-implementation-to-tp.patch \
+           file://0009-tpm-passthrough-move-reusable-code-to-utils.patch \
+           file://0010-tpm-Added-support-for-TPM-emulator.patch \
+           file://0011-tpm-Move-tpm_cleanup-to-right-place.patch \
+           file://0012-tpm-Use-EMSGSIZE-instead-of-EBADMSG-to-compile-on-Op.patch \
+           file://chardev-connect-socket-to-a-spawned-command.patch \
            file://apic-fixup-fallthrough-to-PIC.patch \
            file://CVE-2017-13711.patch \
            file://CVE-2017-13673.patch \
-- 
git-series 0.9.1

