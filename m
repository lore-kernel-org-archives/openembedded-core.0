Return-Path: <bhstalel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00266F99C6F
	for <webhook@archiver.kernel.org>; Fri, 17 Apr 2026 23:54:34 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.58246.1776470067364638957
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Apr 2026 16:54:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hQmT4Yqd;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: bhstalel@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4836fc075d2so828955e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Apr 2026 16:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776470065; x=1777074865; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fQdmM6Yx06qghe6P11oBjx7lbVnIG8lA2zVi1eet1IM=;
        b=hQmT4YqdW7CEkxSDkzP+UZsiwCPE6OhyBi5CuKwoYCTyadfetUBAck4mM90pGnV1Ac
         Uf5wCvrsr0b9H6tvMjtUUr+smxEIBLenYuk2P0G+hETSozouKTokP9WMy6J6UmIh6aF3
         xm8eXOoDQogIw5emrkdtCyalXJn+YqTU5Yl/6xSf1z3br73TUw7p6udFBN5KzrmzfI/r
         LdOfgXOxLPGYeG5O9uvXVZMtdABAZi7Esbtcwiu69IYtHPcDfU7RRey5n2l1QwdKz0sC
         VXDg2t+yIkylL6Tl0Y5xnVxxYbRgFH9rwlsvSn5rxphQzxiGUUgRdWXznu8a1Vxc22dw
         DZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776470065; x=1777074865;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fQdmM6Yx06qghe6P11oBjx7lbVnIG8lA2zVi1eet1IM=;
        b=qbp596BehvFv4H7uB4w6QYsNydBkwQruYksK8uQJE3l+aDyDiUN6BGVqPuJ/EJ98Wj
         HNnfymfl3crDzayYba1/bVjzc4iToXtV/GoQQJzbL31PKlyG70OzGPIlNw0bOX9CuWmV
         TpF7Z6rz9KAyXKN8U7nt+xZcow6UCdLmfloGEmC+nif8TeExd/87hzlrgwj5b7a1LQ+j
         fUv+9GwN6wVIdj4ZLPSHPESmww7zwIcH9Rd3zsGZmxIkTvyfBLZK5oNvOYiLG0SKvKfG
         4rjW4m2+QjhzsiLSHX9bnJqNjew2+aFMHCwAzyuTUOiSUKEmB1ErQv/WPI9VsjaKYdFy
         Ir+w==
X-Gm-Message-State: AOJu0YxGnZmXczPYSqVpTEyklqU+QrRt0y6Zw7WPHrmAW6Mk5JR5dr9I
	xdMDna1U9Q1REd9WZ6pHN5/gwxKLa3QhLsL4DBaRBCMSg01GR5T6zyuWIwZNkWcq
X-Gm-Gg: AeBDievAmYSeKuuKiNTQhdh07BaZVxftKLEGsqmsdwcVL/I1oo0iPOyEg2ThijBcsgV
	MXSPg/Fn8xYoFl4HLUsn3fSu3H22n71lVv7VQ8ECH8OcTl3Cd6olZSMathE7hSwNTRtZLC3vjiH
	L2fVn3etBos8O3SAAJeeUzGMEAbUh6rlGCLCP3U/xpzRN+ZH0jUvATo1wVjLQSOhQnYe8ftXAZp
	jr40kuAxh4Zi8wJypYuXzD6U3A5es2MuuPaGNWcQxh/s1IOewZ3AFLys1x//uc8DDasp+NQ0rVQ
	T3xfnAZiLFstoG29GUUjGv6C6EO95RB5FHywsANGxsXeq+S8uONhSvyTa0xxoVSmyJPPRvnqWNp
	+Jj44F5OicxTLM5eQp/wcPeZ62oQPgiGiXEvb+KI6nwfqEr17ND+Q4D3ngzOXNdLH4GmFefPjIs
	yKAYShHOHWLHG63JWbeZVjlhYfhoQLr0CEz0aB1pX5ZwmL6obN2LfZZv+eLajM/If4CFSaMFJS
X-Received: by 2002:a05:6000:2991:20b0:43e:a651:91e8 with SMTP id ffacd0b85a97d-43fe3dc859dmr2506125f8f.2.1776470065394;
        Fri, 17 Apr 2026 16:54:25 -0700 (PDT)
Received: from techleefstation.. ([196.178.215.105])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4dc26a3sm8943108f8f.15.2026.04.17.16.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 16:54:25 -0700 (PDT)
From: Talel BELHAJ SALEM <bhstalel@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Talel BELHAJ SALEM <bhstalel@gmail.com>
Subject: [PATCH] image_types: catch exception if no CONVERSION_CMD is defined
Date: Sat, 18 Apr 2026 00:54:22 +0100
Message-ID: <20260417235422.838481-1-bhstalel@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Apr 2026 23:54:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235513

When new conversion type is defined, BitBake assumes
that CONVERSION_CMD: is defined for the type, so it gets
the variable which returns NoneType if it is not defined.

That generates the following exception which may not be clear
for some:

--
ERROR: /../techleef-image.bb: Error executing a python function in <code>:

The stack trace of python calls that resulted in this exception/failure was:
File: '<code>', lineno: 16, function: <module>
     0012:__anon_117__.._recipe_populate_sdk_base_bbclass(d)
     0013:__anon_427__.._recipe_populate_sdk_base_bbclass(d)
     0014:__anon_131__.._recipe_image_bbclass(d)
     0015:__anon_187__.._recipe_image_bbclass(d)
 *** 0016:__anon_535__.._recipe_image_bbclass(d)
     0017:__anon_44__.._recipe_rootfs_ipk_bbclass(d)
     0018:__anon_191__.._recipe_siteinfo_bbclass(d)
     0019:__anon_17__.._recipe_license_image_bbclass(d)
     0020:__anon_206__.._recipe_image_types_wic_bbclass(d)
File: '/../image.bbclass', lineno: 501, function: __anon_535__.._recipe_image_bbclass
     0497:                    if original_type not in alltypes:
     0498:                        rm_tmp_images.add(localdata.expand("${IMAGE_NAME}.${type}"))
     0499:
     0500:        for bt in basetypes[t]:
 *** 0501:            gen_conversion_cmds(bt)
     0502:
     0503:        localdata.setVar('type', realt)
     0504:        if t not in alltypes:
     0505:            rm_tmp_images.add(localdata.expand("${IMAGE_NAME}.${type}"))
File: '/../image.bbclass', lineno: 490, function: gen_conversion_cmds
     0486:                        type = type[8:]
     0487:                    # Create input image first.
     0488:                    gen_conversion_cmds(type)
     0489:                    localdata.setVar('type', type)
 *** 0490:                    cmd = "\t" + localdata.getVar("CONVERSION_CMD:" + ctype)
     0491:                    if cmd not in cmds:
     0492:                        cmds.append(cmd)
     0493:                    vardeps.add('CONVERSION_CMD:' + ctype)
     0494:                    subimage = type + "." + ctype
Exception: TypeError: can only concatenate str (not "NoneType") to str

ERROR: Parsing halted due to errors, see error messages above
--

Fail with human readable error if no CONVERSION_CMD is defined for
any defined subtype.

Signed-off-by: Talel BELHAJ SALEM <bhstalel@gmail.com>
---
 meta/classes-recipe/image_types.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/image_types.bbclass
index e6ef0ce11e..326602d960 100644
--- a/meta/classes-recipe/image_types.bbclass
+++ b/meta/classes-recipe/image_types.bbclass
@@ -44,6 +44,10 @@ def imagetypes_getdepends(d):
                 deprecated.add(var)
 
         for ctype in resttypes:
+            ctype_cmd = d.getVar('CONVERSION_CMD:' + ctype)
+            if not ctype_cmd:
+                bb.fatal('No CONVERSION_CMD defined for subtype "%s"'
+                         ' - possibly invalid conversion type name or missing support class' % ctype)
             adddep(d.getVar("CONVERSION_DEPENDS_%s" % ctype), deps)
             adddep(d.getVar("COMPRESS_DEPENDS_%s" % ctype), deps)
 
-- 
2.43.0


