Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web12.767.1603381980814438898
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2020 08:53:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=VwQ5wwSl;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id o1so1265129pjt.2
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2020 08:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=MfGpIr88zlDt44j6mCFPqL5hBr7mUqKFriYbt718jiU=;
        b=VwQ5wwSlmMBfVJ/wG0+WraG1lTC3pywegQllSldeYdLWzf4oDH1Dkubdka+1rUE1XN
         cfYp7TI4FyWaewzeaUsx1bFU8JY6T4ylrGmDKclMIrenvvuJsYcWZ9jCvBXK/9Jk+BVg
         mOBVQ4bG12IX3gkGzBbQn0Xu1Ib6q3/pXff2UckP1LBCf6zTFGDcLJY80q+LwfVreAqL
         YiVpsn6rG5dshpPVKEWXBDsTefeFrnXQTYceSSvyZkmPKNbH++finRt76ZDMIkgDmzig
         kMAnMcP8pz3/uoXKFqjtd3y1UA0VAfYMGA+CWmW/uKg54yyZ12i12yfj6yfSEkGICLhl
         Af+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=MfGpIr88zlDt44j6mCFPqL5hBr7mUqKFriYbt718jiU=;
        b=HLGoAw6ooHBa0j3HkIDvW95+Z5q7hvE0LdEZhPfxAcQKH6E96Ylna/2WmuWs2DnUiG
         wqQawc9O8PoIr5d8JeN8Kausz+CO+TwOWeJn86W46mmEdEx+Jo45fWh3N4H026ifCvL0
         dA90wOswsYXRdBcfC4LUXlKEXCaJ1mArXXCBEidUkXCqtFsGc87VUfDS/YlmHDmjnt/q
         FSs/gT6/4p2pOxrgkaSUdD3TUX5Z3XxcY0Yw5BTWNVi+FRJNPbFltQSkkcgWelGQx2Kg
         YtARUwZQQMti1NHHwGXk1wYJLM/n3vZKqZe3gBRxP6isDlZprLurPG1y4m3fUTcm6pQG
         x/UA==
X-Gm-Message-State: AOAM530pR+HMQXiD5I2imYn9CQBYoT0itN85XLiM6NjD2PiDoVSm2JYg
	aDM10Tz9lafyjc8wTOYCDD9tzrMRIZR9h/Ji
X-Google-Smtp-Source: ABdhPJzdVqcS6CwdtGLVC5NxQANGAe3QTJXi1rAYrMK6VbCNx74Q8/BKgkG2Hot1Aa1WLPwcnhDYNA==
X-Received: by 2002:a17:90a:4b45:: with SMTP id o5mr397297pjl.223.1603381978992;
        Thu, 22 Oct 2020 08:52:58 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id kc21sm2423558pjb.36.2020.10.22.08.52.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 08:52:58 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/14] siteinfo: Recognize bigendian sh3be and sh4be
Date: Thu, 22 Oct 2020 05:51:41 -1000
Message-Id: <197b405dd098f6b214837d224f40d33b018b7c16.1603381705.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1603381704.git.steve@sakoman.com>
References: <cover.1603381704.git.steve@sakoman.com>

From: Martin Jansa <Martin.Jansa@gmail.com>

* seems to be broken for many years, does someone still use sh3/sh4?

  scripts/tune/log.fake-sh3.sh3eb:
  Parsing recipes...
  ERROR: /OE/build/oe-core/openembedded-core/meta/recipes-devtools/vala/vala_0.48.9.bb: Unable to determine endianness for architecture 'sh3eb'
  ERROR: /OE/build/oe-core/openembedded-core/meta/recipes-devtools/vala/vala_0.48.9.bb: Please add your architecture to siteinfo.bbclass

  scripts/tune/log.fake-sh4.sh4aeb
  scripts/tune/log.fake-sh4.sh4eb:
  Parsing recipes...
  ERROR: /OE/build/oe-core/openembedded-core/meta/recipes-support/vim/vim-tiny_8.2.bb: Unable to determine endianness for architecture 'sh4eb'
  ERROR: /OE/build/oe-core/openembedded-core/meta/recipes-support/vim/vim-tiny_8.2.bb: Please add your architecture to siteinfo.bbclass

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1f26495884b8f567aecadc5936651846dfeed3f5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/siteinfo.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass
index 1fe5eea717..0bd1f36805 100644
--- a/meta/classes/siteinfo.bbclass
+++ b/meta/classes/siteinfo.bbclass
@@ -55,7 +55,9 @@ def siteinfo_data_for_machine(arch, os, d):
         "riscv32": "endian-little bit-32 riscv-common",
         "riscv64": "endian-little bit-64 riscv-common",
         "sh3": "endian-little bit-32 sh-common",
+        "sh3eb": "endian-big bit-32 sh-common",
         "sh4": "endian-little bit-32 sh-common",
+        "sh4eb": "endian-big bit-32 sh-common",
         "sparc": "endian-big bit-32",
         "viac3": "endian-little bit-32 ix86-common",
         "x86_64": "endian-little", # bitinfo specified in targetinfo
-- 
2.17.1

