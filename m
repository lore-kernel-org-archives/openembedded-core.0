Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.5916.1617634455336114981
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Apr 2021 07:54:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=l2Tl0lXh;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id kk2-20020a17090b4a02b02900c777aa746fso5973216pjb.3
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Apr 2021 07:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=SnN/zqwSEbLg4XjBZsHShF3cRto22q6oUExaU4oCjEc=;
        b=l2Tl0lXhCb/v2fdw2Y+nd6yFgxR7Xs+/lQzZeLJqpnPdPHfyPk+v2Fgi034ZA57jS6
         a9Ph9wEI+sV5JDw3QK+y0kTsylRrzOt9wGwecaap9J4rsMpcC1TN+GhJ9l3JJ4IVtDlB
         /cS9R9f1I0xgqyFkaudS8b53930gccGlu2v0eR6XmfkOYNpv03PBr+H7yUC7oCEsGoSE
         lN9AwZW9G82sYYoGK/FHm5IcAGyW9+3uajV1O6KDgiymEMwBnV/6xWX87xJ0Lvi7fTSJ
         FQsPzHknetLCAxctr7kNEhIT8mEEg2YIYR07ylFIi/GTVE7nGDh3aeAQ+mH5gL171adP
         yPsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SnN/zqwSEbLg4XjBZsHShF3cRto22q6oUExaU4oCjEc=;
        b=Ghn7FF/0bdhcS0lT1KevDC5MRc8c34J8MGYpshQIFzCWzxv3MyODtEPcfVImkADor3
         E3O1jbop+j36w7qedFI8uA35/hVTp6x7yf2EgG/+gQoN8RUjGTyJ1JlmYk+PPr3PD0X4
         8rRfPpi1178CFQ9ZDPUQ+VUgc5SSxLRm8EA3hQit1Ke52vbNnz+ZYFa/mEKLOkZ0Eugd
         GXzcVc7H/D0MxEGKrxF/ZhQyT1kjv5PWh0ManHsqAGFaEgeRI1OdE1MtPM3GQfwq/Ilu
         j3aLf4+N+WWqtcgw6i4yoBTr3R0VNN8/dfYdAv3D68mdjPlraCVgcX/IH1sYUND5pZg1
         jJ5w==
X-Gm-Message-State: AOAM532vCP+hp4r36khOkepcju3H+Y9OCW8Je0lLSFmbVg2u9kN3DrHn
	0ei9b9WUqrhEZT/ysY7+Cyyh9gehvD/WGMujqVc=
X-Google-Smtp-Source: ABdhPJwDJhgWIfotOI+WajPqdm+X+0CUif+QmGexRNPLW8ullT4Aa57mmRm+HrgL/8Sqj9VHEV4MCQ==
X-Received: by 2002:a17:90a:66c5:: with SMTP id z5mr10968496pjl.172.1617634454415;
        Mon, 05 Apr 2021 07:54:14 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id g3sm15427734pfk.186.2021.04.05.07.54.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 07:54:14 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 3/6] selftest/reproducible: adjust exclusion list for dunfell
Date: Mon,  5 Apr 2021 04:53:29 -1000
Message-Id: <988869f45c9e67a3bf0665d2870a4626bb28e6f6.1617633691.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1617633691.git.steve@sakoman.com>
References: <cover.1617633691.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-be: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 32 ++++++--------------
 1 file changed, 10 insertions(+), 22 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index cf0375c8a1..c023c92d5d 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -27,11 +27,8 @@ import datetime
 exclude_packages = [
 	'acpica-src',
 	'babeltrace2-ptest',
+	'bind',
 	'bootchart2-doc',
-	'cups',
-	'cwautomacros',
-	'dtc',
-	'efivar',
 	'epiphany',
 	'gcr',
 	'git',
@@ -40,40 +37,31 @@ exclude_packages = [
 	'go-helloworld',
 	'go-runtime',
 	'go_',
-	'groff',
-	'gst-devtools',
 	'gstreamer1.0-python',
-	'gtk-doc',
-	'igt-gpu-tools',
+	'hwlatdetect',
         'kernel-devsrc',
 	'libaprutil',
 	'libcap-ng',
-	'libhandy-1-src',
-	'libid3tag',
+	'libjson',
 	'libproxy',
-	'libsecret-dev',
-	'libsecret-src',
+	'lsb-release',
 	'lttng-tools-dbg',
 	'lttng-tools-ptest',
 	'ltp',
-	'meson',
 	'ovmf-shell-efi',
 	'parted-ptest',
 	'perf',
-	'python3-cython',
+	'piglit',
+	'pybootchartgui',
 	'qemu',
-	'quilt-ptest',
+	"rpm",
 	'rsync',
 	'ruby',
-	'spirv-tools-dev',
-	'swig',
-	'syslinux-misc',
+	'stress-ng',
 	'systemd-bootchart',
-	'valgrind-ptest',
+	'systemtap',
 	'vim',
-	'watchdog',
-	'xmlto',
-	'xorg-minimal-fonts'
+	'webkitgtk',
 	]
 
 def is_excluded(package):
-- 
2.25.1

