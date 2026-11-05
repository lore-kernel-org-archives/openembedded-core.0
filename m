Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29826.1793868242844035804
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 00:44:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=L7V8Cndw;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so12208265e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 00:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793868241; x=1794473041; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oOeqjJQPGmemdjjw25gIlNaEChUpyMTvNgzmpwrS110=;
        b=L7V8CndwZdF4pIVDIPrVW62ww78KATJ0xcpVESFfheYoG/VoUhZZLimMeCu+sYkoFV
         SYjebqrUryK1pchqyRTI1c8oVqJlCOnegBxswOpV6/wcJNuc9YKsgs/qpEUa5CR5zCH/
         yTRTUoBmT+NadVjpmr7rGc34aFD/dK3lYX7CT6o189mIQ3uUjLlK0FhWsjYZuNy+U6IE
         YDkBs1lhvf07aDSN0oKYqQQVPkc285hoooHzITr4BjLIe3dqz/IfBYp1lB12lmLSnQ9/
         +v8PfOHsltidwlhKtkDD+JmpciOUyZMDZXhmrmz20VzySN1wyJGqZCm4svd3cOgzAiCa
         zM3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868241; x=1794473041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=oOeqjJQPGmemdjjw25gIlNaEChUpyMTvNgzmpwrS110=;
        b=Mn6PIiCaD8yyvfIGWoFU3Wp0or9kISRhLqQ68kUEt6aTI1xws02+Flcrqq1GwHYgB4
         W4zJzKlDlPLpQnGGl4L05h8fv7e695HHkScBjQwmHvpiS0jKIGIxgvvE3dSnsTN6KEMd
         4EwNmp03bnX+DiXCzcUg03l0UvhXTuKv0+FwXXRpI8uQizMnpDBJDMuq8EEbt60FrzGD
         EMurJndJdebxOKasAdkBOHicTqjQHCCNzPIm4Ha/P2lGhgRDdytEMXM+c4POSoEPyED8
         o+dxaA7aBAyHWp3FpY594+qLyk+3tlm3ZtBgGxo+ji106UDnxH/taPyrS3urTX3Ifdv3
         8phw==
X-Gm-Message-State: APuU4Z+NWYQb470H4bMG0xl2+Pm9MNrIjKfDAxnoB8TFQahSArjwWnhk
	l7DidEDyrKh88BGckghIiULTaNE5DJVVYmGLlfIIwJ/isKdZNcN0C6avCgfVbkSpgLlAueJEnk6
	bURNQ81A=
X-Gm-Gg: AYBFou3iuwjVr/DNyh2CzbTC+8zFQyE5dVSlMdjQAnVUrXNrpSMEyNV2p2+gIYfg1Mx
	Jeqa0szpvQqxUYioaVvr4qICg3KJ4hDGDIFvjhfmfzDUe5NZPLo1LcIxz2xE8lfnNOBnjVfsKX9
	6OsknZ/KJOfSM1HHatY+AZqLVJ9o5edDM8RVUTQkEO56CyTDhdNpFGk9XULOVdiYlZ+WBEdTGCQ
	PjkvRm4SLeDfrJxPiqkx2SekOw/2vpKv35b5LXcQ8HVm5+BiQszuN0WSH/7PQ9MC+Ep9qeiw7G0
	HJXnH2Bzsqg2OhFAViwPv8CnMOwuElSZ2mA+GggSdn/z8Diuba+mDaLAa/bVhZkPTnkD6SIph6h
	kbZSodGRvw6TGbmZLmR67d/0HIE3mzCSAQSxw53kds6WXVS9q4H0d27PQguD3gXzq3AnoZjtEmD
	8EYiOqmVPUOYL6dXe6uKLW1SigLebW8Q81UqQL4NuwLAcRgIsOmAsK0r6WkbOhpLpIQTmgfyMnu
	diS/JzW62r2R2i88C+N4ihsf/ZwoVllU2Xy/GsfGWHuvAAYa4k/ejeOufFjektD4ieAM68YDQp2
	TpKuhUDbA1YSZI483DMs3XMJlODjkT22EdhOvjzdAOdHmDwr2azu+7u7Zn/nTaen/OH0+W38gsQ
	4Qg0Yb9icIAIpKO/QH/8hUZvpjqVVS3z1paijbYRl9s04wUGTBw==
X-Received: by 2002:a05:600c:a00d:b0:4a5:e6fd:65e5 with SMTP id 5b1f17b1804b1-4ac19705d57mr401416355e9.31.1793868241005;
        Thu, 05 Nov 2026 00:44:01 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm9200620f8f.19.2026.11.05.00.44.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:44:00 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 42/60] spdx_common: fix source inclusion with externalsrc
Date: Thu,  5 Nov 2026 09:43:01 +0100
Message-ID: <1e598f31163871824902004ca2f860d8e3eca7e4.1793867929.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793867929.git.yoann.congal@smile.fr>
References: <cover.1793867929.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 08:44:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249501
Content-Type: text/plain; charset="utf-8"

From: Francesco Valla <francesco@valla.it>

The source inclusion logic activated by SPDX_INCLUDE_SOURCES creates a
dedicated source directory and fills it either:

 - calling do_unpack and do_patch into that directory, or
 - copying sources from the work-shared directory for recipes that use
   one.

This mechanism however does not work properly when coupled with the
externalsrc class, which deletes the do_unpack and do_patch tasks as
part of its logic; one notable use case is the devtool development flow.
In this case, the following issues are observed:

  - the tools required by the removed tasks (e.g.: quilt for do_patch)
    are not included in the recipe sysroot, leading to a failure when
    the task is forcibly executed as part of the spdx source collection;
  - for a recipe inheriting kernel.bbclass, the directory hosting the
    external source is deleted (because is moved to spdx_workdir and
    then wiped) and the kernel-source symlink pointing to it is
    replaced with an empty directory.

As a solution, treat the external source directory case just like the
work-shared case, copying the source code from the externalsrc location
to the SPDX dedicated directory instead of re-unpacking it there.

It should be noted that if an in-tree build is performed while using
externalsrc (i.e., if EXTERNALSRC_BUILD is equal or under EXTERNALSRC),
build artifacts will be treated as source files and added to the
generated SPDX files.

Signed-off-by: Francesco Valla <francesco@valla.it>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e2118f2158e8678c9f822d44574e6c06f97eec9f)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oe/spdx_common.py | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/spdx_common.py b/meta/lib/oe/spdx_common.py
index ad2bc0ffda3..07bf9650e21 100644
--- a/meta/lib/oe/spdx_common.py
+++ b/meta/lib/oe/spdx_common.py
@@ -42,6 +42,10 @@ def is_work_shared_spdx(d):
     return "/work-shared/" in d.getVar("S")
 
 
+def is_external_src_spdx(d):
+    return bb.data.inherits_class("externalsrc", d) and bool(d.getVar("EXTERNALSRC"))
+
+
 def load_spdx_license_data(d):
     with open(d.getVar("SPDX_LICENSES"), "r") as f:
         data = json.load(f)
@@ -174,8 +178,9 @@ def get_patched_src(d):
     """
     spdx_workdir = d.getVar("SPDXWORK")
 
-    # Do not unpack the sources again for the recipe using work-shared
-    if not is_work_shared_spdx(d):
+    # Do not unpack the sources again for the recipe using work-shared or an
+    # external source directory
+    if not is_work_shared_spdx(d) and not is_external_src_spdx(d):
         localdata = d.createCopy()
 
         # Change the UNPACKDIR to make do_unpack do_patch run in another dir.
@@ -196,7 +201,7 @@ def get_patched_src(d):
             if not os.path.exists(kernel_dst_path):
                 shutil.move(kernel_src_path, kernel_dst_path)
 
-    # Copy source from work-shared to spdx_workdir
+    # Copy source from work-shared or external source directory to spdx_workdir
     else:
         share_src = d.getVar("S")
 
