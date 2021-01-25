Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.362.1611586404149014727
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 06:53:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Leg/VMgc;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d13so1989062plg.0
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 06:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ZybtsxAb13vGH6sGv8RSSy6yLNsGj+tp62aV5u57oHc=;
        b=Leg/VMgcxnmtrwkmqvazeYZMH4aiLiGvl6T4M9WWGrwzrt7DXZVorByudQ99YDLSfM
         jznUlHdvlu7kIjgcUR7Md7v14CkQ6zOrnrD8EkOogPt5K/n4xFKUcsImKQZVQztPyQ5b
         qrS+cQIO8DiztoF1PX4bEKKQSQrnesj8ljokq0yxmseer5BNSUQNeveYD+ajkGPiS5MX
         KpBSth+WZKfwV6l6CtD1j758QeVoocXgFDukp0xutfIyGqTJih7C5dx4aEHuTZ1A4hw+
         0VsjJZgU5woLkocDdepyYoLEc4BvW7VQn54A8MY75z4hfnSdp2jsctQpoBFVjzY4x6XA
         a0bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZybtsxAb13vGH6sGv8RSSy6yLNsGj+tp62aV5u57oHc=;
        b=MZCKb/P7dZ6EoE8bGj80vyA3siSLZdwXsfpVpeHEHcJXLKWJ28uiLRvP0ykEp5OdHe
         ZMMhxsD5O6Ta+kw8SNfQGwJs9fQtAKZz03/11mhAmwQhU1tEdhFZgrKQDzTgtfoQPU7j
         Wdfu6W+jozSCB1vZ3sI0Vqb00Qrn4njJfb7qlk1/i5sCKZDTssRbyRkdaEiK7SmIfMiL
         evBfgRoToEprP4iaf1oKoER2m49CWKM3Agor94UboeFLtVgBp3ZpoNb3mFzMtZaTdzOu
         Xe7DIHfrhrftfCWe6auLtyTuXbQxclfUQEjqsrrYft9FJfjPWTKvwDGDbiOX9S8L2xGy
         dyDQ==
X-Gm-Message-State: AOAM533+g0kK8tjaLxTnj/dqCldUJZEEpr+tmQRBA8gDYDMdOBxlRbkq
	78vwVaFT4DmOcmEihn4cEDi7uXPcEwgLKDRzXbU=
X-Google-Smtp-Source: ABdhPJzrjs323IvGfMGgbtnONGMQcgo0HDRv0EACACBwmniKIWkWBh/qRdt9TZUfnM7i2p6u89sczw==
X-Received: by 2002:a17:90a:de10:: with SMTP id m16mr612432pjv.6.1611586403151;
        Mon, 25 Jan 2021 06:53:23 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id x8sm17574354pfn.27.2021.01.25.06.53.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 06:53:22 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 36/47] license.bbclass: Add COMMON_LICENSE_DIR and LICENSE_PATH dirs to PSEUDO_IGNORE_PATHS
Date: Mon, 25 Jan 2021 04:51:08 -1000
Message-Id: <220168bfc7437cff355a5dba66847739e987e336.1611585425.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611585425.git.steve@sakoman.com>
References: <cover.1611585425.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Martin Jansa <Martin.Jansa@gmail.com>

* now without ${COREBASE}/meta in PSEUDO_IGNORE_PATHS after:
  73d538f207 bitbake.conf: Prevent pyc file generation in pseudo context
  the do_package tasks are failing when LICENSE_CREATE_PACKAGE is enabled
  pseudo.log shows that it's because of license texts copied from
  ${COREBASE}/meta:
  path mismatch [46 links]: ino 96733640 db '/OE/build/tmp-glibc/work/all-oe-linux/foo/1.0/image/usr/share/licenses/foo/generic_Apache-2.0' req '/OE/build/openembedded-core/meta/files/common-licenses/Apache-2.0'.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 39423a33595e7ade82fc88f55823660f8532cb84)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/license.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index f90176d6c0..dc91118340 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -31,6 +31,7 @@ python do_populate_lic() {
             f.write("%s: %s\n" % (key, info[key]))
 }
 
+PSEUDO_IGNORE_PATHS .= ",${@','.join(((d.getVar('COMMON_LICENSE_DIR') or '') + ' ' + (d.getVar('LICENSE_PATH') or '')).split())}"
 # it would be better to copy them in do_install_append, but find_license_filesa is python
 python perform_packagecopy_prepend () {
     enabled = oe.data.typed_value('LICENSE_CREATE_PACKAGE', d)
-- 
2.25.1

