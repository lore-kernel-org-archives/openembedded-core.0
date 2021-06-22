Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.7545.1624360902983329456
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jun 2021 04:21:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AUNqj7my;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id c7so22178310edn.6
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Jun 2021 04:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sfUq2bZlrh3Z6MQopcr1/UvA/ONPP/bStdEr39HphG4=;
        b=AUNqj7mybLbHkWXli8q1QdOetV7YSwa833KLyf/Xmy+kK63gsTh7GZLxfJqnvZNwyv
         bepOnLr46TRl9+cWVw1LozeQYHhqFPCvTYYdVuS3zUxWwMVPJ7Wxs3Gbc7l/UR8ClctT
         jw8baf5DzzYDuq5IwUDdJ40jt6498WSi386cxQojQMMI1f06fCZjAF60DNBwcZwu2PHs
         TIHg85irWcCXeKhLWL8yrqIlXYEbc18lazr3SRFhynPSgW1fqOF8Iof7sxFF/Ug1L8nu
         etAC58bWvyaItOSIrjaAf5SqYZ11TGYzY37kdzMghFB0kFVTkNrr48c5v08q9qeh1MGX
         qeMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sfUq2bZlrh3Z6MQopcr1/UvA/ONPP/bStdEr39HphG4=;
        b=St+Di6Q6bHJG6GoH0go1O2rohg7b+PmiyCIZ6SRJYtBm0hJBQLoFIlej4ED6icipUq
         L5acCNAqOx1gB9MXZMAxt3/YblhqSUizbi2CUQtUEkHhLtsPBzJxMttG8gPo4WNeMYQ5
         Uvu0HGSAmwNFDXXIyDJJmBOVvWG0xSQYTeI7lUQ0ORjwkEdYRcb7IW1NuVFJw8AN7xPU
         kdc5dRWa8THwnGSoS4UIWQ2neLTmJe0qtO+E6INnR11m0s15ZP7s2KRsSqQt2ZcKL0nb
         5yzAmaNigR7bPVwWRcqDxNFho4Rw7OSiPHDgio/nqibFcQ1HVvnbW+OrlnM6TMUt2aOB
         ZtDg==
X-Gm-Message-State: AOAM532IyCCd9rplf9nw/Y3mN118vpcXewx/f0dZVtGk8lHZtN3VWE8d
	JOPqr0JirTq7TjzesNHG4SEkzsMaInTgQQ==
X-Google-Smtp-Source: ABdhPJyM62cwnY0MT1TeQopGYOBEaq9JFyNtkwo4F17x8G7f1tpK1Q/sVlKkuV+0mIyKZNAaOTzQBQ==
X-Received: by 2002:aa7:d799:: with SMTP id s25mr4196368edq.161.1624360901651;
        Tue, 22 Jun 2021 04:21:41 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id n2sm11987416edi.32.2021.06.22.04.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 04:21:41 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 17/19] vte: upgrade 0.64.1 -> 0.64.2
Date: Tue, 22 Jun 2021 13:21:24 +0200
Message-Id: <20210622112126.2026646-17-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210622112126.2026646-1-alex.kanavin@gmail.com>
References: <20210622112126.2026646-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/vte/{vte_0.64.1.bb => vte_0.64.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/vte/{vte_0.64.1.bb => vte_0.64.2.bb} (95%)

diff --git a/meta/recipes-support/vte/vte_0.64.1.bb b/meta/recipes-support/vte/vte_0.64.2.bb
similarity index 95%
rename from meta/recipes-support/vte/vte_0.64.1.bb
rename to meta/recipes-support/vte/vte_0.64.2.bb
index 0401eaa049..b0baa3f422 100644
--- a/meta/recipes-support/vte/vte_0.64.1.bb
+++ b/meta/recipes-support/vte/vte_0.64.2.bb
@@ -20,7 +20,7 @@ inherit gnomebase gtk-doc features_check upstream-version-is-even gobject-intros
 
 # vapigen.m4 is required when vala is not present (but the one from vala should be used normally)
 SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch"
-SRC_URI[archive.sha256sum] = "12fb41a9ff8e03c5f1711b46560910a4b9b3102aec3e9e7609ceef4dfa98aa2a"
+SRC_URI[archive.sha256sum] = "2b3c820b65a667c1d8859ba20478be626d1519cc3159dac25f703330c6d07e18"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-- 
2.31.1

