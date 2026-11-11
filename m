Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5581.1794387808899216382
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 01:03:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=etQN7QrG;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4918c2d727fso1595982f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 01:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794387807; x=1794992607; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8N3IKFuIYKLq9eiYhZdyOTHWwZ0Xxc7CIWz5RZ0+/UI=;
        b=etQN7QrGNk/9tniTA2BGxu51vXiTfGzYEBHn03TuEQDxlWdZWjqBIoT7QNLgcRqtpW
         jxRMCfr/X5vARPGvUl3XgB2c6Bkeo9JpxfJ2AR9hquWYNLJnRqulnv2wqvxzxuBKDXgX
         PyG5fpXW6IK2zHs7o87Si8Hi8F+0xrtmlbT0ahzkmIKWeKALs3fTGbriYIwMsetPLmFm
         fX12o+DlXH4cZhXkrykNZLrfAEsQHDhQ2/uEksvxwl7yDkcCZYIm3bEGPyLobpp0D0ld
         Hz6WjjOgZcQW4R5BTNL0tY8Ex16yPRUbb0afhdtRwrGN8zaImnmdxbtAAqFL3jIJXWC0
         gW1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794387807; x=1794992607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8N3IKFuIYKLq9eiYhZdyOTHWwZ0Xxc7CIWz5RZ0+/UI=;
        b=DnFfbtl+h+wVMy1GARDPDfEtRRKP13Ud5luZ3h7ULqQJEGHEPuGwKlqH7TyGIUl7+v
         mBqohXFgLFwb+mFlacN1jKeqajiw/VB04JjIj2shhNbZ9e2592XzPSDtpL6E20SQxiwr
         BrO53Y3JVrl+OWV8W0mFJNLguGrChe+IJTEY1mt4VH2hi2pzYrBbUye3u7izFaM5+i6U
         d1sCeNrk1JQ68Re8goQykmpaFdfK391LfHX3lhG3qEvQOLk1EmTiJCJFrO+vV6ncDl4/
         Rcy4VJuhTcstnqWyFEF6XpWA/tY+UVIojM5THargu/idPSNkFpb973dKXWHPsTnp3MQT
         ppXw==
X-Gm-Message-State: APuU4Z+rsiQNMvPl6c+QhCBY4WHR68ibFEDUOmcY2PExTkmt7afu0wzL
	Oh557GZ2MOnNiSpfa32aWh8cvOUIgnwc7Sfbt5QsO650DI77bi84EVbtZuARak26rz32Wr4rojb
	JAZ54Z7M=
X-Gm-Gg: AYBFou2RkuyzGKwuJm8IzrP36+ukk2OIYhkZuw5VRDALqiyKmL/Bsk2/o7q0pVbtJmO
	yuOvwXwCnEu1C+4zVp+9VPNT/1Xl5zTl3AmftDBZ3XDfK0hZYwnb5DlUibTT6ZmwMbQR2tzdoX1
	j6K2as82dGR1hFV8y/L8612Evl4Q0q7yX4WRA6vniNk8YbbtEfeHiDulgAQdMx3Z0mFjxRNyGaI
	8VCNijsIGYV65s7y4mJpNNitTX0YnuEY1BfOeJ+XtVo4p3aIRwg8OxkO4tNbHOKXfHDnrtTvSWD
	BplQu9AR7MKqd77F0GQpHWJD3xiZwFnos5Q0JzeMAotFn4vjsC1Hy9SpNd9bcvZOBXr1xtupkdY
	FJlkQvickXZmzQpUQsuQgiWbliQ1akmDBnTp7MxzHb62wAALFtisuDkIvdhEQqhnkKv9SUPjqsN
	7vRCZErj9oiTHtDPtf6vrBZed63TokQZ45vFl9hdKfKe1Hkl+a7zH2LsEHeiSBZUrV2/kJbwzla
	ALlqXt5Jvj7rVaSOqVtIjG3hV+D20/wNwwsP5n7LQncDpmKbyKGBzZ/Lri8utq+okUPZKs7ekWk
	RZHS7ZTc7iATfjT8fmsTuc2WWlweYkjwt6lCnY2lJuqgkE++hEhOfmukRrqskVGehJ5Ol2fwMEm
	eXv2KOkTI4eLqLQk1gJpA4w2eEvVi
X-Received: by 2002:a05:600c:a311:b0:4ba:2bfc:c8ab with SMTP id 5b1f17b1804b1-4ba2bfcc988mr15299705e9.15.1794387806973;
        Wed, 11 Nov 2026 01:03:26 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe9357sm147623675e9.9.2026.11.11.01.03.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:03:26 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 10/35] package: no longer modify paths in save_debugsources_info()
Date: Wed, 11 Nov 2026 10:02:36 +0100
Message-ID: <c4bf5e9f240de894ed29cf9ae83b30fc0657b206.1794387482.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1794387482.git.yoann.congal@smile.fr>
References: <cover.1794387482.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 09:03:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249982
Content-Type: text/plain; charset="utf-8"

From: Benjamin Robin <benjamin.robin@bootlin.com>

The source files saved in `${PN}-debugsources.json.zstd` are now saved as
is: "/usr/src/kernel/" is no longer replaced by "${BP}/". However, the
file list is still filtered to exclude "<internal>" or "<built-in>", ...

With this modification, the content of `${PN}-debugsources.json.zstd`
is no longer specific or tied to SPDX generation.

The logic that modified the source file paths to match what SPDX
generation expects is now in `oe.spdx_common.get_compiled_sources()`.

Furthermore, previously, for all non-kernel recipes the source paths were
never "resolved", since the KERNEL_SRC_PATH variable is always defined.
So the returned source file paths always started with
`/usr/src/debug/${PN}/${PV}` (the value of TARGET_DBGSRC_DIR).

Update the source file paths to match what the SPDX generation expects:
- In `get_patched_src()`, the sources of the recipe are extracted
  (again). The unpack task runs in a modified local context with
  UNPACKDIR set to the value of `${SPDXWORK}`, so the sources end up
  extracted in a sub-directory of `${SPDXWORK}`.
- In `add_package_files()`, all files below topdir, set to `${SPDXWORK}`,
  are (recursively) listed. For each source file, if its path (relative
  to topdir) is in the list returned by `get_compiled_sources()`, the
  file is added to the SPDX SBoM.

Handle this by replacing ${TARGET_DBGSRC_DIR} with the relative path of
${S} relative to ${UNPACKDIR}. If ${S} is not relative to ${UNPACKDIR},
do nothing.

Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(cherry picked from commit b567c2f0d91fbf36886d0c3a6f6ea90c07771044)
Signed-off-by: Kazuyoshi Akiyama <kazuyoshi_akiyama@jp.honda>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oe/package.py     | 54 ++++++++++++++++++--------------------
 meta/lib/oe/spdx_common.py | 42 ++++++++++++++++++++++++-----
 2 files changed, 61 insertions(+), 35 deletions(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index c375acc1242..bef3c92a259 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -1060,37 +1060,33 @@ def copydebugsources(debugsrcdir, sources, d):
                 os.rmdir(p)
 
 @bb.parse.vardepsexclude("BB_NUMBER_THREADS")
-def save_debugsources_info(debugsrcdir, sources_raw, d):
+def save_debugsources_info(sources_raw, d):
     import json
     import bb.compress.zstd
-    if debugsrcdir and sources_raw:
-        debugsources_file = d.expand("${PKGDESTWORK}/debugsources/${PN}-debugsources.json.zstd")
-        debugsources_dir = os.path.dirname(debugsources_file)
-        if not os.path.isdir(debugsources_dir):
-            bb.utils.mkdirhier(debugsources_dir)
-        bb.utils.remove(debugsources_file)
 
-        workdir = d.getVar("WORKDIR")
-        pn = d.getVar('PN')
-
-        # Kernel sources are in a different directory and are special case
-        # we format the sources as expected by spdx by replacing /usr/src/kernel/
-        # into BP/
-        kernel_src = d.getVar('KERNEL_SRC_PATH')
-        bp = d.getVar('BP')
-        sources_dict = {}
-        for file, src_files in sources_raw:
-            file_clean = file.replace(f"{workdir}/package/","")
-            sources_clean = [
-                src.replace(f"{debugsrcdir}/{pn}/", "")
-                if not kernel_src else src.replace(f"{kernel_src}/", f"{bp}/")
-                for src in src_files
-                if not any(keyword in src for keyword in ("<internal>", "<built-in>")) and not src.endswith("/")
-            ]
-            sources_dict[file_clean] = sorted(sources_clean)
-        num_threads = int(d.getVar("BB_NUMBER_THREADS"))
-        with bb.compress.zstd.open(debugsources_file, "wt", encoding="utf-8", num_threads=num_threads) as f:
-            json.dump(sources_dict, f, sort_keys=True)
+    if not sources_raw:
+        return
+
+    debugsources_file = d.expand("${PKGDESTWORK}/debugsources/${PN}-debugsources.json.zstd")
+    debugsources_dir = os.path.dirname(debugsources_file)
+    if not os.path.isdir(debugsources_dir):
+        bb.utils.mkdirhier(debugsources_dir)
+    bb.utils.remove(debugsources_file)
+
+    workdir = d.getVar("WORKDIR")
+
+    def _filter_src_file(src):
+        if src.endswith("/"):
+            return False
+        return not any(keyword in src for keyword in ("<internal>", "<built-in>"))
+
+    sources_dict = {}
+    for file, src_files in sources_raw:
+        file_clean = file.replace(f"{workdir}/package/", "")
+        sources_dict[file_clean] = sorted(filter(_filter_src_file, src_files))
+    num_threads = int(d.getVar("BB_NUMBER_THREADS"))
+    with bb.compress.zstd.open(debugsources_file, "wt", encoding="utf-8", num_threads=num_threads) as f:
+        json.dump(sources_dict, f, sort_keys=True)
 
 @bb.parse.vardepsexclude("BB_NUMBER_THREADS")
 def read_debugsources_info(d):
@@ -1337,7 +1333,7 @@ def process_split_and_strip_files(d):
         copydebugsources(dv["srcdir"], sources, d)
 
         # Save source info to be accessible to other tasks
-        save_debugsources_info(dv["srcdir"], results, d)
+        save_debugsources_info(results, d)
     #
     # End of debug splitting
     #
diff --git a/meta/lib/oe/spdx_common.py b/meta/lib/oe/spdx_common.py
index e40cf36bba1..f885f1832ae 100644
--- a/meta/lib/oe/spdx_common.py
+++ b/meta/lib/oe/spdx_common.py
@@ -277,14 +277,44 @@ def get_compiled_sources(d):
         bb.debug(1, "Do not have debugsources.list. Skipping")
         return [], []
 
-    # Sources are not split now in SPDX, so we aggregate them
-    sources = set(itertools.chain.from_iterable(source_info.values()))
-    # Check extensions of files
+    unpackdir = d.getVar("UNPACKDIR")
+    srcdir = d.getVar("S")
+    bp = d.getVar("BP")
+    kernel_src = d.getVar("KERNEL_SRC_PATH")
+    dbgsrc_dir = d.getVar("TARGET_DBGSRC_DIR")
+
+    # Compute the relative path of source directory from ${UNPACKDIR}.
+    # The goal is to replace ${TARGET_DBGSRC_DIR} by this relative path.
+    srcdir_rel = None
+    if srcdir and unpackdir:
+        srcdir_rel = os.path.relpath(srcdir, unpackdir)
+        if srcdir_rel.startswith(".."):
+            srcdir_rel = None
+
+    sources = set()
     types = set()
-    for src in sources:
+
+    # Sources are not split now in SPDX, so we aggregate them
+    for src in set(itertools.chain.from_iterable(source_info.values())):
+        # In the common case, the sources are located in ${S}. To format them as
+        # expected by SPDX, we replace /usr/src/debug/${PN}/${PV} with the path
+        # of ${S} relative to ${UNPACKDIR}.
+        if dbgsrc_dir and srcdir_rel:
+            src = src.replace(f"{dbgsrc_dir}/", f"{srcdir_rel}/")
+
+        # Kernel sources are in a different directory and are special case
+        # we format the sources as expected by spdx by replacing /usr/src/kernel/
+        # into ${BP}/
+        if kernel_src and bp:
+            src = src.replace(f"{kernel_src}/", f"{bp}/")
+
+        sources.add(src)
+
+        # Check extensions of files
         basename = os.path.basename(src)
         ext = basename.partition(".")[2]
-        if ext not in types and ext:
+        if ext:
             types.add(ext)
-    bb.debug(1, f"Num of sources: {len(sources)} and types: {len(types)} {str(types)}")
+
+    bb.debug(1, f"Num of sources: {len(sources)} and types: {len(types)} {types!s}")
     return sources, types
