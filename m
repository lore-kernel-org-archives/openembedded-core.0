Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.17612.1590940410556203975
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:53:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=d1Opu5B0;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id h21so6883047ejq.5
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VqNDJBRAnrEZ5Olx2gc1mbmK962gQTMqeAswQJd4w4A=;
        b=d1Opu5B0Sa5eknjnEv07Zxl/jb3jw8+RaO7D3GD/BYQZK2j6EyNv+iC8hjBwOtye0W
         fLpaqj+RIk66OlJ3/Y4G/TqY1shbdvPioxjFdwNMDUVYzkR+2o0PH8CdcCX9HkRVuYQQ
         ZfNuUnVuGY774NzO9ZieMBI1JAkEdL5rs1+excvHFzSQ9B733kjXh4nNZVOJWSVb3APh
         ynyuzPFe6Riud6+wyKKd5NlsYsq/CHFHA15nnsZlEg5ysl3ScmUGDPp/+uV/uvLZXpPL
         /xE3FTutftzwwPP+k8Di87mXNE8f9Re7EK3kNsQesr/ffU4HKph8jGo45hOn0uS1nW/i
         ecdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VqNDJBRAnrEZ5Olx2gc1mbmK962gQTMqeAswQJd4w4A=;
        b=N2ct5LV+2gYSs3+1VVTszr8mRbyUIiRYsPsJxxo3p7kyoAho9UvimnkCzB7uvNCC5L
         zxZtQvQ+4E34a+tkOW59inq6mnX4Bx9rczEPsnvp/n8eDvIGLUoHlVxHXGRn03unD67Q
         v8dJO+cNt5ioxMp/Ct4n5qyQfID48/B0l8htDAgqaD24WVz0dsS3O1gR1Mcm+sKn1+bQ
         peo80RJZlXgkwXZac+Fx9DHyOrDwFmfCCgsgoOPJpN8NylJ6y4tNumEaKnLpzN/kUfWa
         hs5AqrXhh6AMHJH7rB1UAsNnvhZgkH9JfRcLC8Vuxd09hx771H2nnzuq4ml9Q71TaIRu
         ao2w==
X-Gm-Message-State: AOAM531duff1qNrmLZYuIy9ma6vV4kW5IW5+Lda8zlLPay4nHGowrw1V
	PAVNqnfEr++TZOqJ2/Cx4jKqKUiP
X-Google-Smtp-Source: ABdhPJzpHMtoMwFlX1ml9XaAauO7glw0T5v4JJSupOmH9VP5R/SVryIZnMPqabhU6lgV2KCnTu2t4Q==
X-Received: by 2002:a17:906:9404:: with SMTP id q4mr15728840ejx.138.1590940408707;
        Sun, 31 May 2020 08:53:28 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:53:28 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 01/70] btrfs-tools: upgrade 5.4.1 -> 5.6.1
Date: Sun, 31 May 2020 17:51:45 +0200
Message-Id: <20200531155254.10283-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../btrfs-tools/{btrfs-tools_5.4.1.bb => btrfs-tools_5.6.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_5.4.1.bb => btrfs-tools_5.6.1.bb} (97%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.4.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.6.1.bb
similarity index 97%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_5.4.1.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_5.6.1.bb
index cdc971cf5d..885d79dcdc 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.4.1.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.6.1.bb
@@ -14,7 +14,7 @@ DEPENDS = "util-linux attr e2fsprogs lzo acl"
 DEPENDS_append_class-target = " udev"
 RDEPENDS_${PN} = "libgcc"
 
-SRCREV = "3fc2326d3474a5e4df2449f5e3043f7298501334"
+SRCREV = "2a74d408f4b65d603e42f6e7b6b905ac81825fc9"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-- 
2.26.2

