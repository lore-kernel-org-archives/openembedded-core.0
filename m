Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web12.25212.1591602501975456750
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2020 00:48:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cPuKn1Jx;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id k11so17158263ejr.9
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2020 00:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=G8LwW/07RzxaDSf/xua6GeHAgdjJEXNlr0LZYCsrd7Q=;
        b=cPuKn1JxCpiICVGF5cUPNE1wGMSmfTEkflBDQlj3v2Dz0U866EIir5MOjTECuC19bH
         zRvVd7yPRTUxXwLlwLypvYg7nCH/VytlmyLJW8dhgbUINNZZoQZSVgFJ+n3J3ujmT/M+
         lSA/bDpcrcoIx2nXLKg/BZgDegvPxMkCf331VhJ3aoaEa6fGNxihAJi7KBvhpGvmwHS+
         Y33yRfiZJ84V7lfmQIcqh+gGRq3CQBPm8dldQMeT42KnqFXdHyydzb+njgA4w7gXyoRg
         Gy8BXiwTQheEkgi0Lknm6DDLsbypM6VfmJg0d/pJlGH7v99NJGkEpbcpCTynytjuHL1e
         fK6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G8LwW/07RzxaDSf/xua6GeHAgdjJEXNlr0LZYCsrd7Q=;
        b=f4OX8PuQ26SlbbjyIWzA2/Da+AkmwjR9eYsrNB271xLAJ7obN/y3/dQQf2xGlbSR5X
         0ig8rWURjAYcBtoB0FBGUaAbojUh/BMBCS82CATPuun7coC3pAim9hsgtjUDJyOAvTRO
         1blAR/k7PWBVw0iBh8BTAc+u9TDSx7pjunQdIHty7gOVkRq5xg9eLCX817QVpwRqWYTG
         +FlcRz4oy+oeCyHo/ofvkKP4Cc3kDzXB9QH+iP7Qk/SCBXd+e1cWY+5LSFLOlkuz90T3
         p1AUx/pE7asEEAo5ig2ndNL7anXr9q11HI+5hYux3fcnQhg18aMLFMkWenAkejUDQhmK
         NetA==
X-Gm-Message-State: AOAM533w9kk00BmB96RVyT99ZfJ4EIa/JtATYp95WZdSPVmHop9x7i/L
	sXn9TBYKaxhVS5ktaAYmfY6FDkaKxN0=
X-Google-Smtp-Source: ABdhPJzcqMXzh5l5cr2OovZli4z3EIQpKZygSYQ9KrvAfjNewiixk1yUYB97rwhxuVyZc44pynLG+A==
X-Received: by 2002:a17:906:2656:: with SMTP id i22mr18753761ejc.397.1591602500311;
        Mon, 08 Jun 2020 00:48:20 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.66.228])
        by smtp.gmail.com with ESMTPSA id g22sm12473466edj.63.2020.06.08.00.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 00:48:19 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 09/42] acpica: upgrade 20200430 -> 20200528
Date: Mon,  8 Jun 2020 09:46:26 +0200
Message-Id: <20200608074659.7051-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200608074659.7051-1-alex.kanavin@gmail.com>
References: <20200608074659.7051-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../acpica/{acpica_20200430.bb => acpica_20200528.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/acpica/{acpica_20200430.bb => acpica_20200528.bb} (94%)

diff --git a/meta/recipes-extended/acpica/acpica_20200430.bb b/meta/recipes-extended/acpica/acpica_20200528.bb
similarity index 94%
rename from meta/recipes-extended/acpica/acpica_20200430.bb
rename to meta/recipes-extended/acpica/acpica_20200528.bb
index 478be7f56e..d68afd8158 100644
--- a/meta/recipes-extended/acpica/acpica_20200430.bb
+++ b/meta/recipes-extended/acpica/acpica_20200528.bb
@@ -17,7 +17,7 @@ COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 DEPENDS = "m4-native flex-native bison-native"
 
 SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix-${PV}.tar.gz"
-SRC_URI[sha256sum] = "fb807f1dec31664f972af37d213abf72987afe33abf68c83051e298da35d297c"
+SRC_URI[sha256sum] = "e69f81c6924c8d30f9b9005bb002307f07b5a1538e13c909bea2f8a44e0d8610"
 
 UPSTREAM_CHECK_URI = "https://acpica.org/downloads"
 
-- 
2.26.2

