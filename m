Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.9588.1629636694277957421
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Aug 2021 05:51:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OxuvW4zX;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id x12so21741117wrr.11
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 05:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lRRRoU7VwYkUY3GceDGFpMGnH1oXo00sj3uYjtqqCtE=;
        b=OxuvW4zX7hqRqVtmN7MU1el49x2V9EoXDoJDAm+YW7CdQmyRdpn9xXzpWqgqaQ1ADc
         Pq1c9B2hsx9fBOyiRoUHBZfiB2f8U8EfZn+66as0DfvaPzZ+Zz5Rvagc9BIx6tCtw42i
         a98NwzayYQjN4HCiw1Ms57YyTqk5rZ5YRAwyZSBKYmABrf1HDU2rOZ1OY86rrzwwvUcV
         46FECvjpzddWI5uIaeo7NR7DsdvIk8uOeGMwDPpWiOLhB31MrksXjiFg64C9npExs/nT
         WysQEv6V7XFQ+cqdPrtxhczX57NKtiVxdlwYKJ4hSYX0QvgNkiX2IEyr4Jdgc9mugk8Z
         zHhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lRRRoU7VwYkUY3GceDGFpMGnH1oXo00sj3uYjtqqCtE=;
        b=dh7vYuShmyHUGktMPhqjevTC1IJkG4Q8MwiY0U/4w+RDryQyIENZJ8DQXqjhCoZ4W3
         BN7yc7Vlptkv+ZHkAntWh0DIDSP4/6a6QnSKPysM2KR17vUl+duchb6gsMQd4DRwHXgi
         RE+Yt1WV7Lb4GlI8FTDEuYBWoyMU2V6ZeaNm45KWEhUSwUWCUVnKTn0SF5aMHXMAYxNh
         S2UDOn9nZKVojeloCHklnzGlFgsW95s8OKZkoaTh+RapfZndYFFIu8RG3Vn8c/wIbpuv
         +HtdoX6GdC1LDlUZbI2U0lzgRnhfXkukVkezXxLUuDlBk84Bnnp4fxmC+aMCXzlVT0z0
         bHTg==
X-Gm-Message-State: AOAM5322AuEOigmQQZNT83XvlLYbGMkMwMT4kSRFrNUfSNLveuXs/5bV
	Z6DqZtl1jZ4i7MEHnQ863ti72r1h0cDTDw==
X-Google-Smtp-Source: ABdhPJyx1ASlNhrOzcV/Ksb+fLmhiJsX5J2srsRG+aJtgFCDHe8TXx9pLuRWAmGzvTK7z5/oZZyueQ==
X-Received: by 2002:a5d:6485:: with SMTP id o5mr8534820wri.91.1629636692941;
        Sun, 22 Aug 2021 05:51:32 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id c8sm11915882wrx.53.2021.08.22.05.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 05:51:32 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 32/55] acpica: upgrade 20210331 -> 20210730
Date: Sun, 22 Aug 2021 14:50:40 +0200
Message-Id: <20210822125103.310416-32-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210822125103.310416-1-alex.kanavin@gmail.com>
References: <20210822125103.310416-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../acpica/{acpica_20210331.bb => acpica_20210730.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/acpica/{acpica_20210331.bb => acpica_20210730.bb} (94%)

diff --git a/meta/recipes-extended/acpica/acpica_20210331.bb b/meta/recipes-extended/acpica/acpica_20210730.bb
similarity index 94%
rename from meta/recipes-extended/acpica/acpica_20210331.bb
rename to meta/recipes-extended/acpica/acpica_20210730.bb
index 35f8ecd85c..490e812434 100644
--- a/meta/recipes-extended/acpica/acpica_20210331.bb
+++ b/meta/recipes-extended/acpica/acpica_20210730.bb
@@ -17,7 +17,7 @@ COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 DEPENDS = "m4-native flex-native bison-native"
 
 SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix-${PV}.tar.gz"
-SRC_URI[sha256sum] = "b49237a2c3df58b57310612ec3a6ebee69e1a525b5efeec7152faf32a03b7068"
+SRC_URI[sha256sum] = "4a0c14d5148666612aa0555c5179eaa86230602394fd1bc3d16b506fcf49b5de"
 
 UPSTREAM_CHECK_URI = "https://acpica.org/downloads"
 
-- 
2.31.1

