Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5600.1794387806052482797
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 01:03:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=IKhRkEl8;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so1281178f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 01:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794387804; x=1794992604; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lBMzMSx8r51hkKwIjfGf3PA6N+6YQReEJk718h/Ownk=;
        b=IKhRkEl8r+fo16GpYNgqtOL+wRW1Rmus+U8QyZCKgJVffVqf0ZR8vT5129ShS1gHs9
         boAHlGP4T8q5LQ+opbrewFnIl1sjNpvayu9dIqRK0m9A+jTsCvnEU6Bn0ZKplTQJQPyP
         gbpdD4oFZBsgWPp5tu8PoQl2ay6IyxJBhsSM/L4rcnYF3nIbWC7wpAv7Nj4mDopTEyI/
         hV4t3Eg+DEqTDJ48nnSDop/8VD7HFFG76Yo+AiekVF+OUQThegktB0dJUs1eEGrKAQzW
         ystMRT6Mn5aTtkr9iHvisWStqMLfcrcH+K3ftubdhM5dNCvyGnH3/ITTpuhg2qFMjxyv
         n2Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794387804; x=1794992604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lBMzMSx8r51hkKwIjfGf3PA6N+6YQReEJk718h/Ownk=;
        b=GGBshlP3Azo2IPHW7tuY6wawrDqsHztVGTUoQSf9TO5/Y16WgFtGIG5ueLMjvIPwjk
         RDb92hGQQoszeHHDtWBAut8bYVqQX/rFUpDkCYmxjVsGbn0vWBbkyzCVORjByQJzLuC0
         KkG+Tuy/w4P4umAkZ4L8ngwmm7x7m9Bc7M9z0U8tVvj+imMSpVqI2ClmBwlUnjyA7+Wz
         5sRLjdO68YGQ/uC+PvXEKmUWx++HOSL3hX3KBl3/4K05gfpaNLDDhl/uX5/DNUv0c1zR
         fnv2XUzK09BY2EFVtXKbRomPj+nbgR1bDWEDA7E5UTQ0oLBvfrEwJzREfZFjWoLYNceg
         hmWQ==
X-Gm-Message-State: APuU4Z/fHV7dHYXiDwm9o3MF0A9CiGJ0UPCbIVn93o3TOI4UNLRiRAhV
	sli9Y6yxqEYBB7sOx7mRdCRDrN7v6a+pxO66O8RNLLd6ImuWLyeVp+ad9R/PUIZYS9XfHOCAvuZ
	n/PmdnFA=
X-Gm-Gg: AYBFou3lvC9egldpObtpqbuqK3M3E3aXoIO/2qperYL7asMaF83rfFJFNv27iK1TmX6
	5VsX956pp1JsA5fJNEm2jdAm3GneC6qCL2DLpkM774IxVY0K0WyY2ilotEJEslp6mI8AlwEPIlw
	zarzU3H7xu9Ax7ScsomWJQrZpqp+R62DvpCAT/iRwdRUUX2hsOSgxtC/L1MVa5jkkd2gQuBsjfT
	4rzDLBJtW5OiB4IjMYiptn0bHuKdcnLy9h3SVZ3yWsFppqHxWA+34eO8CGy0pvATP9OKauKlwUR
	RXoftrKEi+3VeM2XLE7ZD3jBHVYdV1nNbB5ALzcYeIY0UsLt+Ot/Jw0kj5ddtrhDitwCTvIJKSc
	hyBa1u0OSpW45NwLI1o1v5M7nco4fcxGuzMdkc4y0Lm2r6aI+RyO9RTJibSSqS6vadNUIHVv8RS
	DN7lcpRhuPgJIn8v8/6MGsEeyQxDKKP4zYDIQ48izfpn/TZgsfQdV8gIbkjZSBK/SYPXpuctBw/
	+D1L2TySt9gRFRPm8KdXuRhY8K7vlAKAT6ifxkX/iCDF3q4kdwX81Hqd5gwc28TPShKJ6xquWxd
	0Dpv414bwAl5lVbukn5xJ1KsCR4C2a3AdbInWx/mOzXM7hyEdq9rjpXHRLybuQjBMJ4gXNIto7Q
	GFD6ra/SCn2BIeezipJmrL2OKayvynXi/nhCeaxxuB4B71ILqLqo=
X-Received: by 2002:a05:600c:3baa:b0:4a2:1196:db0e with SMTP id 5b1f17b1804b1-4ba0938a445mr35624085e9.30.1794387803967;
        Wed, 11 Nov 2026 01:03:23 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe9357sm147623675e9.9.2026.11.11.01.03.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:03:23 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 07/35] spdx_common: simplify get_patched_src() implementation
Date: Wed, 11 Nov 2026 10:02:33 +0100
Message-ID: <c05b6d92741add617ff5faeb11d7a9b5d8b2facb.1794387482.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1794387482.git.yoann.congal@smile.fr>
References: <cover.1794387482.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 09:03:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249979
Content-Type: text/plain; charset="utf-8"

From: Benjamin Robin <benjamin.robin@bootlin.com>

The behavior remains unchanged:
- Instead of saving and restoring the values of various variables, use a
  copy of the data store via `d.createCopy()`. This prevents side effects
  for other tasks.
- This allows removing the `try ... finally` block.
- The function `is_work_shared_spdx()` no longer needs to be called twice.
- In the work-shared case, there is no need to modify `WORKDIR` since no
  task is executed from that branch.

Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(cherry picked from commit e0bf8e7c5be3d87376a6c2aab5aca07fd0813763)
Signed-off-by: Kazuyoshi Akiyama <kazuyoshi_akiyama@jp.honda>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oe/spdx_common.py | 81 ++++++++++++++++++--------------------
 1 file changed, 39 insertions(+), 42 deletions(-)

diff --git a/meta/lib/oe/spdx_common.py b/meta/lib/oe/spdx_common.py
index 6b1a409c40c..9d1e22629b2 100644
--- a/meta/lib/oe/spdx_common.py
+++ b/meta/lib/oe/spdx_common.py
@@ -172,50 +172,47 @@ def get_patched_src(d):
     Save patched source of the recipe in SPDX_WORKDIR.
     """
     spdx_workdir = d.getVar("SPDXWORK")
-    spdx_sysroot_native = d.getVar("STAGING_DIR_NATIVE")
 
-    workdir = d.getVar("WORKDIR")
+    # The kernel class functions require it to be on work-shared, so we don't change WORKDIR
+    if not is_work_shared_spdx(d):
+        spdx_sysroot_native = d.getVar("STAGING_DIR_NATIVE")
+        localdata = d.createCopy()
 
-    try:
-        # The kernel class functions require it to be on work-shared, so we dont change WORKDIR
-        if not is_work_shared_spdx(d):
-            # Change the WORKDIR to make do_unpack do_patch run in another dir.
-            d.setVar("WORKDIR", spdx_workdir)
-            # Restore the original path to recipe's native sysroot (it's relative to WORKDIR).
-            d.setVar("STAGING_DIR_NATIVE", spdx_sysroot_native)
-
-            # The changed 'WORKDIR' also caused 'B' changed, create dir 'B' for the
-            # possibly requiring of the following tasks (such as some recipes's
-            # do_patch required 'B' existed).
-            bb.utils.mkdirhier(d.getVar("B"))
-
-            bb.build.exec_func("do_unpack", d)
-
-            if d.getVar("SRC_URI") != "":
-                if bb.data.inherits_class("dos2unix", d):
-                    bb.build.exec_func("do_convert_crlf_to_lf", d)
-                bb.build.exec_func("do_patch", d)
-
-        # Copy source from work-share to spdx_workdir
-        if is_work_shared_spdx(d):
-            share_src = d.getVar("S")
-            d.setVar("WORKDIR", spdx_workdir)
-            d.setVar("STAGING_DIR_NATIVE", spdx_sysroot_native)
-            # Copy source to ${SPDXWORK}, same basename dir of ${S};
-            src_dir = spdx_workdir + "/" + os.path.basename(share_src)
-            # For kernel souce, rename suffix dir 'kernel-source'
-            # to ${BP} (${BPN}-${PV})
-            if bb.data.inherits_class("kernel", d):
-                src_dir = spdx_workdir + "/" + d.getVar("BP")
-
-            bb.note(f"copyhardlinktree {share_src} to {src_dir}")
-            oe.path.copyhardlinktree(share_src, src_dir)
-
-        # Some userland has no source.
-        if not os.path.exists(spdx_workdir):
-            bb.utils.mkdirhier(spdx_workdir)
-    finally:
-        d.setVar("WORKDIR", workdir)
+        # Change the WORKDIR to make do_unpack do_patch run in another dir.
+        localdata.setVar("WORKDIR", spdx_workdir)
+        # Restore the original path to recipe's native sysroot (it's relative to WORKDIR).
+        localdata.setVar("STAGING_DIR_NATIVE", spdx_sysroot_native)
+
+        # The changed 'WORKDIR' also caused 'B' changed, create dir 'B' for the
+        # possibly requiring of the following tasks (such as some recipe's
+        # do_patch required 'B' existed).
+        bb.utils.mkdirhier(localdata.getVar("B"))
+
+        bb.build.exec_func("do_unpack", localdata)
+
+        if localdata.getVar("SRC_URI") != "":
+            if bb.data.inherits_class("dos2unix", localdata):
+                bb.build.exec_func("do_convert_crlf_to_lf", localdata)
+            bb.build.exec_func("do_patch", localdata)
+
+    # Copy source from work-shared to spdx_workdir
+    else:
+        share_src = d.getVar("S")
+
+        if bb.data.inherits_class("kernel", d):
+            # For kernel source, rename suffix dir 'kernel-source' to ${BP} (${BPN}-${PV})
+            dir_name = d.getVar("BP")
+        else:
+            # Copy source to ${SPDXWORK}, same basename dir of ${S}
+            dir_name = os.path.basename(share_src)
+
+        src_dir = f"{spdx_workdir}/{dir_name}"
+        bb.note(f"copyhardlinktree {share_src} to {src_dir}")
+        oe.path.copyhardlinktree(share_src, src_dir)
+
+    # Some userland has no source.
+    if not os.path.exists(spdx_workdir):
+        bb.utils.mkdirhier(spdx_workdir)
 
 
 def has_task(d, task):
