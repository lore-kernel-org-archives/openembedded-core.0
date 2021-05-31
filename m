Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web10.44008.1622467010363374550
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 May 2021 06:16:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AK96fHa2;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id h20so11118590qko.11
        for <openembedded-core@lists.openembedded.org>; Mon, 31 May 2021 06:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xKLo0VUcaQSRNr6B1RtJ4wH0n5XTRmqg3OjjVBwvt0w=;
        b=AK96fHa2lWcNApXIFcQUnzKaN9wk0DFTNkB5T3nwFxxKMCe5tLwkNy/zpuqdZag7g7
         dOybHomqbsaNGMYSI+iyOmtxc4TR9tQKpXX//rOH4vcGcl3/ikBt6foNORkeQkHgMW9V
         4gxyIAJ76uk5TJTf09CnGrj29hVFIkLFg0S1bcnLNH8Fhh2ZUl2UdBWJpANCd/zuZFsF
         YIr9uhNVDR6YLHCyZixSnWpEci3LVLCriN1FZbkt04mTEUK5npML7zgI9J3RLpf8bWQd
         vxeUA0pUW83lfT8ygU3fy4c/b4E8pIuR0PkbXvuXfoGl4ZgQ3zqnOHAfdU7Qh99FvM3s
         +mbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xKLo0VUcaQSRNr6B1RtJ4wH0n5XTRmqg3OjjVBwvt0w=;
        b=NG4BVUPZbka9uQciNB3UNzkAMFYSkn5z4kydGnUJi6xOFdYGaO0KM02ItvQ7BDYjaM
         d836/Vc6EYP6aP+NgfgK/RASqH3uS0OtWB/z3qxS+vcEaD//FA4N56YsQ43jit1mTGFN
         NsHzvsHv9aA/iUaOTm/pO7oDG2/Nqlrgi5Hn9pc/tHn/GfvqKAJxBn6Z5JLAb84fgtSd
         lWnoqPypfkggPBJJ1u1w5E9PwOHvMHg+S1aurFvZ+c3/+Xkbsu9wOVX4D7WvrhtbHbWP
         SjRs3wXwObogrK1ueBPdlPYSp/b/Rs2K08ZwVqLTxWw7XuPbg44woBkSQvnZudYWBUsL
         Locg==
X-Gm-Message-State: AOAM531xRIxtWCTRb96VgIYsXxFHNU/GySMAbbi/cGXUd+fTS7mOI1HM
	TY6z/S6nzs5/GsVK1ay3JVk=
X-Google-Smtp-Source: ABdhPJy/SbkdMdOiErR3sMxDAu3BusRnJEg6BsezdM+6JyTgjKbzzViwWgbVsl5Q19SKBNG8fLN3Yg==
X-Received: by 2002:a05:620a:1021:: with SMTP id a1mr16169504qkk.399.1622467009317;
        Mon, 31 May 2021 06:16:49 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id u11sm3008622qkk.12.2021.05.31.06.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 06:16:48 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] linux-yocto-dev: bump to v5.13+
Date: Mon, 31 May 2021 09:16:43 -0400
Message-Id: <0293f7d3287deb09450f8ebf25d93548c8700790.1622466879.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1622466879.git.bruce.ashfield@gmail.com>
References: <cover.1622466879.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index ee41d612fd..f407882316 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name
 SRCREV_machine ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 SRCREV_meta ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 
-LINUX_VERSION ?= "5.12+"
+LINUX_VERSION ?= "5.13+"
 LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.19.1

