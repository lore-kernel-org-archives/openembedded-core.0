Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web12.9435.1602926856570312800
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Oct 2020 02:27:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Is9ocwhl;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id c22so6977105ejx.0
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2020 02:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9qI1SQp8VwldvykKcRdDO46DVC9gPLfnuKZtMvS+IZ4=;
        b=Is9ocwhleFRu01UPYfyNaBa4O+choaS1eAqXvXbnhROUKbibGOBnxnyyedTZhHfbsM
         hlOOh11+Tt4IcoqYIZ/nlSB4pJkG5U89ROpdKvrLLVNYqyP8fdIlNFQe7sRFe9u4dewP
         JNryAiyGwOSDarcmk4GrPt6FLVjJ9aaSLDoTi/yWBRncEprTHqPd3/2E1zDkqlptVUUA
         p4nsVk8hEyIKOMs+uqoXwgPFBHlvVlfYvJMxWMrfiDTJSC6rflg+KdctsBNg16uHaI9T
         eHF2hPQvIt+1r7mmnYgl563QHm/QtCqTc9fGk/h1/l8WqD6Vvh2Lj4+81yRjZVdQ+Zkf
         GvUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9qI1SQp8VwldvykKcRdDO46DVC9gPLfnuKZtMvS+IZ4=;
        b=M995khE0H9Ui/Nv7g4DTzO0w/jPib3dgf+xOr2jVAl1vZC9lVw0/VJrzsa4MKIM9BH
         uJjmjigCsJJ4x8qVXcWAFNUDuSO8tQK/vDj7C8ny4726+XROMlDlgGgMtx174R3UjW3l
         BCeBpfDzMDmE53hiN+YQk0a3v2xFZItAOR9cC76+k/QWVUcdazr+VqEyOzEUut3UuWnf
         gZxLs57gA/C79DWFc2c/w7PCzrwYJWslwq9Hi11Ue7MBngLR6ziQyCyRGXWV7ulACrEj
         4lCnAk5LloH7bwtmiTsSnAWrFKi42du7D5MHtMYkelAMeHkRWJu0XrgRmyfXUQKWSRid
         aW4w==
X-Gm-Message-State: AOAM531n9IO1hO4aVNUL4UPVf+wczQBmjX8UUa4V8SUn40dOz/ra5Q+/
	a85GnK/yqnsts5K9TmzFGmtinSRdV1w=
X-Google-Smtp-Source: ABdhPJyhcnLXJyTLdKgD0pZB7yojr54maC0sTgpGLr57dUzJNfUHcxmC71Fmhoqs4ZLip3CKaYHTuQ==
X-Received: by 2002:a17:906:cb82:: with SMTP id mf2mr7723506ejb.435.1602926854900;
        Sat, 17 Oct 2020 02:27:34 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id bw25sm4695489ejb.119.2020.10.17.02.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2020 02:27:34 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [RFC][PATCH 3/3] siteinfo: Recognize bigendian sh3be and sh4be
Date: Sat, 17 Oct 2020 11:27:12 +0200
Message-Id: <20201017092712.2343122-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201017092712.2343122-1-Martin.Jansa@gmail.com>
References: <20201017092712.2343122-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
2.25.1

