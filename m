Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web11.1202.1604335768206461110
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:49:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bz+Le0lb;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id o18so15055695edq.4
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jPgDxdDC7dKeiM5sdc7DsOPFXCvmEadksryfGgU5UZk=;
        b=bz+Le0lbyFKs+JpKS+vC0wcagjuBv8Sk6uIT5qQvZS+T4qlfj+1NYm1ME8JpJADlKJ
         DifzgMuYf17Bgkka/kB93Ppq590Ok7q5blObak6lsthp5okNO+LVm8vZz+TRy8m53Js+
         IxW186EkxxZM7LaDM+xKRI/lFdBs2MJQuasnAfY5kHMJBwDIi5CEwNv/pa6wu23tcxEq
         irY+uavWSthIwEe1fpHhGegoZ5w7/3372Lvalk3P+Yw04W7V3ARZPoQNDOa7bZfWgclp
         lxy/BtoMjv8askuiMyygrYsqugbEw/vsPVzFZLJmNfC+qacokLrhALPhPtvn/c5QbjyL
         3SPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jPgDxdDC7dKeiM5sdc7DsOPFXCvmEadksryfGgU5UZk=;
        b=rJ5j/LyaHcQBWReLsAVAmhqbQksOt2HJ5+ndLUV+VcCLtMJbyOINYiBljhwE9eNhms
         n4jBjEXE1rYS4RaVc9aIW9Vbr1KGJ1nIv+nyg4AN70KiSAIauRZ5XHDs7CwjF8kbap3O
         YnL0DNCoHvgkl6+deggW4n5Ora0Ikx9CzCFp8sf347bnqb3AO0dIlBy2owXVnL60vUv6
         f05sX9QZ+vZLzGO2U89bfS9ArjzuNkJcFJaiB8AoYIzSgyo5SEOZzj+Vrsc/eEyr1i4e
         0ZF3MWbm0y3/QqfD5pUXrhF7JgrZzCveRK9Rw8hikl0wxrizaFLgLNXEQIJp4Yh5JH/6
         jn/w==
X-Gm-Message-State: AOAM530wmXyF3bCa/H7HeZMFHZCrmCHgi0Gm1BaZ0WEJieoOr2+ghv2N
	/szTy2Ig0iG/jSTH0Zrp+SIInK62kLOC6w==
X-Google-Smtp-Source: ABdhPJxYiUjDEPmdvaMnkFwPKGlYML6KXyy6IxgR7JqQDu0GN6P1BG4Jh5NtLGr+fX3rTg0OUUp/0Q==
X-Received: by 2002:a05:6402:b3b:: with SMTP id bo27mr3249504edb.376.1604335766536;
        Mon, 02 Nov 2020 08:49:26 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:49:26 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 10/80] acpica: upgrade 20200717 -> 20200925
Date: Mon,  2 Nov 2020 17:47:57 +0100
Message-Id: <20201102164907.27572-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../acpica/{acpica_20200717.bb => acpica_20200925.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/acpica/{acpica_20200717.bb => acpica_20200925.bb} (94%)

diff --git a/meta/recipes-extended/acpica/acpica_20200717.bb b/meta/recipes-extended/acpica/acpica_20200925.bb
similarity index 94%
rename from meta/recipes-extended/acpica/acpica_20200717.bb
rename to meta/recipes-extended/acpica/acpica_20200925.bb
index d1d06c0c24..a6d8d67270 100644
--- a/meta/recipes-extended/acpica/acpica_20200717.bb
+++ b/meta/recipes-extended/acpica/acpica_20200925.bb
@@ -17,7 +17,7 @@ COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 DEPENDS = "m4-native flex-native bison-native"
 
 SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix-${PV}.tar.gz"
-SRC_URI[sha256sum] = "cb99903ef240732f395af40c23b9b19c7899033f48840743544eebb6da72a828"
+SRC_URI[sha256sum] = "d44388e21e3d2e47c6d39e9c897935d3f775f04fec76271dcba072c74f834589"
 
 UPSTREAM_CHECK_URI = "https://acpica.org/downloads"
 
-- 
2.29.0

