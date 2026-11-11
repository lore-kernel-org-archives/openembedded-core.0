Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5579.1794387807863171852
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 01:03:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=WwBbfo8Q;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so19843665e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 01:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794387806; x=1794992606; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gX/BR9DTbYAhDc3zvjYkoi8B/Yqsx1AOA3PcUDZSDoU=;
        b=WwBbfo8QgPhkF1x7o5Kjni+8INUdWmXgMOSWI3wtJqXleWm35DHweKoRkGxMWIKjTN
         C0f2ZJnHPIWya5Ck14aaIKeZQ8s1I+WbZAL0d9g80mCcqfMdvH9bln1D5m0J/c/IlC4e
         hWwAHsOdAVqGWie6KhmJWtBXmISvmGlPKhXzBPyn1R2PxUk07CVIzS3j1lR2VmgFHAYz
         Ost3vrtD0a5vbRN7ecblUeLUPY5stdec0Z1ikT0Zg8CVEBTfKEzNHAOkCusQmcHptMt3
         I/gx6jAjeS4WPsxjuNx74xy6TQdIBGziXrF2Xfp7S+/c6p33cX0CsvxJXvZLxHEnpLvz
         azcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794387806; x=1794992606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gX/BR9DTbYAhDc3zvjYkoi8B/Yqsx1AOA3PcUDZSDoU=;
        b=0+zup9zYh83xPNu7P1746+lk6sKjORAIs2Tn9dXnSEbaGV9frGureLsqbVhF0s0k2D
         0PZ+x6+Ud0cHM9Byms7IK3UbimxwYET/ERXUdckiWXAXiRxF7ZD/dMkUNqc31PnZbBQZ
         oWZ0kQ3n1aPUESrKibqOGpUj2RaBPoIYpeP8LatC1WduGgeRf2dHhUoZzzI0z0w8LzI0
         YdbYKroInFqeC1JX+6WmS/YdqdzPd0FoJq9LJ9JPqxWr4VoMFmfcMn2kCkkBGoaXJDNS
         3Zo5xbGH4bdBirnWqAVvs9YwqfxsiX42k2GXe92SBtvIFdy97j5B07mesG9AaVhpTaxU
         mnbA==
X-Gm-Message-State: APuU4Z8euTEFenINOge5L28rJWeW0Ho3JZTjg1pgk9AsGpzF7fqDgO7e
	VTPBOLF3qkiWer6YnOpr4I2CHY9WqyirRe0PHmC3QBy1AI/bJyjeyaCFKSjIWmbNXl/OOOcM3b7
	TNc31aPc=
X-Gm-Gg: AYBFou2LWstinsCa0gSjop4pE/DrAS2dYTQKR4q7ueCzg3XLJE3nHOYvZGWwddi5AYJ
	BITZtuBQ2z5H31QprrZxoAqkZVmJEW89XheHJC1JGndASYSq8R1PCeokF+NL0C2SZwEehW3qdE2
	u4R1IAW9g0pTTrpaQZwHjRMLSZA4xW+brcmVrGlIIAAs1IP2OilP3UY3sEEeijn2N0WCn3cP2HP
	0OZuf8BHA04/hpHzJMpZf+ETi306+j4Akqbg6JFcptGWQq/bPiwcSIkTTTnlZ+xg4P/njSthJKo
	MJv4zslhjnWW8pA3FqmxoRJyxkC8z3tTF9Ht/YOaCW52TjFLaCLAbXGSq2T/PBWL1VOkLofQLkW
	XGhA92iqU0Zmvc9C9Gn3Dr7iWeZIYUjqLBaXDKvM5j9f/iAtfy1REmeZOq7gQawBCLRjscIQzEe
	sTswcACnribXz45wIoZOZxyl5OI1oCnlsPVVrCL/0tcd+S++uf4xFqGPqSzeIeGcgz6IFmEu/al
	aNuQsJX0YY31UsjQ2VjpbtMh0LKNlu+/VUn1E93Yn6F8zAyhlEQNnMQERNGX/KfT0w7WCId3c6G
	NQUQ01308yCa1sluG8urP7OE00y6oxaqKAxKPza93tUirsefmJKkI892rGXppT6o1Hq+T3XJZDo
	Vs1BbkFLn5JLk+IohFcqXM1ot57X4
X-Received: by 2002:a05:600c:37c8:b0:4a7:6bc7:f778 with SMTP id 5b1f17b1804b1-4ba093cd0b0mr29194065e9.30.1794387805991;
        Wed, 11 Nov 2026 01:03:25 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe9357sm147623675e9.9.2026.11.11.01.03.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:03:25 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 09/35] spdx_common: In get_patched_src() ensure kernel dir name to be ${BP}
Date: Wed, 11 Nov 2026 10:02:35 +0100
Message-ID: <7402f4742d38bf20f724d459c732ee999b1baa4a.1794387482.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1794387482.git.yoann.congal@smile.fr>
References: <cover.1794387482.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 09:03:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249981
Content-Type: text/plain; charset="utf-8"

From: Benjamin Robin <benjamin.robin@bootlin.com>

If a kernel recipe is using a tar file instead of git repository, it is
necessary to override `S` to point to the unpacked tar archive.
In this case `${S}` is not going to be in work-shared. So we must handle
this case in get_patched_src() to ensure that the kernel is extracted in
the following path: `${SPDXWORK}/${BP}`.

For a full detailed analysis see [1], but in summary this change is
necessary because:
- In `save_debugsources_info()` the sources are extracted from the debug
  symbol. For the kernel Linux the source file path is modified to look
  like `${BP}/init/main.c` (`${KERNEL_SRC_PATH}` is replaced by `${BP}`).
- In `get_patched_src()` the sources of the recipe are extracted (again)
  in a sub-directory of `${SPDXWORK}`. If `${S}` is in work-shared and if
  the recipe inherits the kernel class, then the sources are extracted in
  `${SPDXWORK}/${BP}`.
- In `add_package_files()`, with topdir equal to `${SPDXWORK}`, all the
  files (recursively) found in topdir are listed. For each source file,
  if the file path (relative to topdir) is in the list of source files
  retrieved by save_debugsources_info, then the file is added to the SPDX
  SBoM.
- If we are using a tar archive, `${S}` is set for example to
  `${UNPACKDIR}/linux-${PV}`, so in `get_patched_src()` the sources are
  extracted in `${SPDXWORK}/sources/linux-${PV}` since
  `UNPACKDIR = ${WORKDIR}/sources`. `${BP}/init/main.c` is not in
  `${SPDXWORK}`, but `sources/linux-${PV}/init/main.c` is.

[1] https://github.com/bootlin/yocto-kiss/pull/26#discussion_r3626224833

Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(cherry picked from commit 9bb9763c4c857edfc64aa2ad189a78a4bfb0c897)
Signed-off-by: Kazuyoshi Akiyama <kazuyoshi_akiyama@jp.honda>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oe/spdx_common.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/lib/oe/spdx_common.py b/meta/lib/oe/spdx_common.py
index 013f23ae7c6..e40cf36bba1 100644
--- a/meta/lib/oe/spdx_common.py
+++ b/meta/lib/oe/spdx_common.py
@@ -187,6 +187,14 @@ def get_patched_src(d):
                 bb.build.exec_func("do_convert_crlf_to_lf", localdata)
             bb.build.exec_func("do_patch", localdata)
 
+        if bb.data.inherits_class("kernel", localdata):
+            # For kernel source, rename suffix dir to ${BP} (${BPN}-${PV})
+            dir_name = localdata.getVar("BP")
+            kernel_dst_path = f"{spdx_workdir}/{dir_name}"
+            kernel_src_path = localdata.getVar("S")
+            if not os.path.exists(kernel_dst_path):
+                shutil.move(kernel_src_path, kernel_dst_path)
+
     # Copy source from work-shared to spdx_workdir
     else:
         share_src = d.getVar("S")
