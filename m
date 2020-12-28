Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web08.4075.1609193796297021690
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Dec 2020 14:16:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=vocoGerv;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id b5so393986pjl.0
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Dec 2020 14:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=rAjn/O2mM1wMsmBfhgyqmJCxeSvVawsTAYGo1ff4fV0=;
        b=vocoGervkuiCjEAOPxPRLIu4LV3nlJwwiQD4y/fi/JoXyn/PzUwhEj+b4zbJewsv/J
         NH2hL6Y+Q2vW48akhQjRG0tAaUoGgo5ow8FHEEahWnIZO1XiqkM+tWQW0z5EOlnn23b/
         y3c/dUS2vWmQqMcH7ISS42H7lzECm6WpKd5+IgaF3F5YzSc3pziVTSD52aB5A9VjoRgk
         t3EvwIDsJxfc/kuzWHgEGgDNZOkL3xvnG5CpqCJ4C1Pmg92L114Hjg6oQNxRPn/dZt1l
         cJ9ZzykvKYfyDriFTV2wC9ujRqdzkXPgAUeneKQx7aUwdR16ggGe9dUIN73RH+6K5k6F
         XA8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=rAjn/O2mM1wMsmBfhgyqmJCxeSvVawsTAYGo1ff4fV0=;
        b=U+Po1p3CL6JW7X5PIcdGlTcVjgeJxnn4M0/fwBYe0f1aXY3NHgYOGIQLpRLjaXv93N
         YrK3MqC6D58zVfHchCVJIRlw8t/0W/xbJQFKoOQVZW4VnCtDLdk1//dxk+q67cZj0sIy
         8+rd+BcaUOFIJ8FyTAuZ4Xffh5Xb21KuOAlkJfTqKHWF7Zs+8r9PPeImdWNPvTOVAD9s
         u1xHG0r7/n4UZuUuaLS2oOHe2R+0He7w5Nf7cuGF2j0H4DRx9E78ZQgsNqf1cNek1naj
         KRiou9uVmv/du0vYjXA7wwRi6YGvuVIQ3AMpM68fLuOtaCDBu6qwBA3IujSQrFrvtIDJ
         IMLQ==
X-Gm-Message-State: AOAM5303uHmzwpHSa4jjR36ePsMIZ4HuOSibMlLXy543w/Z026P2JYFn
	dplRyjhlALoBmcdflxW5n8JgQV7Ao0ONDqSLyvs=
X-Google-Smtp-Source: ABdhPJwfx54g61ZJwDdwfjzmppr6BAuO6QvnR67ovLIbPhQeFXxfK5F5zmbNmkSf3P4lFX5HOeeL8g==
X-Received: by 2002:a17:90b:3110:: with SMTP id gc16mr939158pjb.83.1609193795382;
        Mon, 28 Dec 2020 14:16:35 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id o32sm41425455pgm.10.2020.12.28.14.16.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Dec 2020 14:16:34 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/17] oeqa/selftest/cases/devtool.py: fix typo in ignore_patterns call
Date: Mon, 28 Dec 2020 12:15:49 -1000
Message-Id: <81d6723a803ce976265a1e840e31b86a9a6dec5b.1609193554.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1609193554.git.steve@sakoman.com>
References: <cover.1609193554.git.steve@sakoman.com>

Causes intermittent autobuilder errors:

2020-12-21 19:34:23,035 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/lib/oeqa/selftest/cases/devtool.py", line 68, in setUpModule
    bb.utils.edit_bblayers_conf(bblayers_conf, None, None, bblayers_edit_cb)
  File "/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/bitbake/lib/bb/utils.py", line 1460, in edit_bblayers_conf
    (updated, newlines) = edit_metadata(newlines, ['BBLAYERS'], handle_bblayers)
  File "/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/bitbake/lib/bb/utils.py", line 1290, in edit_metadata
    if handle_var_end():
  File "/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/bitbake/lib/bb/utils.py", line 1215, in handle_var_end
    (newvalue, newop, indent, minbreak) = varfunc(in_var, full_value, op, newlines)
  File "/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/bitbake/lib/bb/utils.py", line 1425, in handle_bblayers
    res = edit_cb(layer, canonicalise_path(layer))
  File "/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/lib/oeqa/selftest/cases/devtool.py", line 60, in bblayers_edit_cb
    shutil.copytree(pth, destdir, ignore=ignore_patterns('*.pyc', '__pycache__'))
NameError: name 'ignore_patterns' is not defined

Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c2d9612279fce9cbcb738913b2042949f692c4a5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 5f59d14402..ddf46547de 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -57,7 +57,7 @@ def setUpModule():
                         if relpth.endswith('/'):
                             destdir = os.path.join(corecopydir, relpth)
                             # avoid race condition by not copying .pyc files YPBZ#13421,13803
-                            shutil.copytree(pth, destdir, ignore=ignore_patterns('*.pyc', '__pycache__'))
+                            shutil.copytree(pth, destdir, ignore=shutil.ignore_patterns('*.pyc', '__pycache__'))
                         else:
                             destdir = os.path.join(corecopydir, os.path.dirname(relpth))
                             bb.utils.mkdirhier(destdir)
-- 
2.17.1

