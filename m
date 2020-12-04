Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web12.20282.1607112480042503273
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Dec 2020 12:08:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=A061wy4J;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id bo9so10380747ejb.13
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Dec 2020 12:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5WwjV8GxwuEV2FO1sMd1VvNL4AnlYcJ/WqF97oWOO2A=;
        b=A061wy4Jr2gt1ljrhjVMJET+6P42JBtOZr8LDEt1IOYnM7IlVhOnblwtsoiw0YU9HI
         xhrHWKkyp+Acjc0mw84A8T5JRVzF+5HO3FqiED7JqXk4lV/U9r6JHeZNgeTgX+FIsU/i
         JeN1Cb83yqmZC+k6+Pm1E+j5ACgxfp1VZiFa76vfVyglj+kAcq+ER+2ZzORfE+yXcIqH
         vDMapyJbZI5yG5+/hMTG1eF02tpSmpiUu5zEPRiFXZtANp5XHR6cNTh9se7TSsYgOxIP
         QLAOtFiygP5HA8hHo5lNS5Dg5FlymZ0XsrKNva644MyodgK878etz1pjlZ29HxLbFHyR
         zdKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5WwjV8GxwuEV2FO1sMd1VvNL4AnlYcJ/WqF97oWOO2A=;
        b=k3iQx4TWjfRsIANZ3KDj2u7R92UgFdoC5CriiKVJBwo/EY4xfUdp1w6H7ltGe6vKYV
         OH71V4fgwq1EMk5tKLud7u3eFw0PjUzwIg49bcg5r4JnZcg60WKWmAag9CZrGxEXr/R6
         bo9NkjBsb9soIVR6PRBBDWkejtC7/25I1bKABGIF6hkGaq2ckyzGQHbJyXK3J7lPWaf2
         fb78Ema+epfc+RQNrQGD9gmu1/2WRt0Yx3fFqiFZyOLoYsT426KoQJP1Dg1TrsS8yjJ1
         SyUUYgZBp8wbT2jFOAVXqL6vCHHJKoh6n4XsXHT4SmbOHnc2miKBpOL3bkmcrrjbqXg7
         zJxQ==
X-Gm-Message-State: AOAM530fqojxq8q00LrigJAc819Dlvaoehn/havMuGGhrRJri8+2q6K5
	fvRXBcSHMUYh87n6Tq/8QyXKaBQSfVy9zA==
X-Google-Smtp-Source: ABdhPJwnceCNJvW51vRQh5DJxEASt5qyKbKo8i/sZ+jDFSBDOJMhb4ac+BkNJm/TW0zJtDGUqdCdgg==
X-Received: by 2002:a17:906:6010:: with SMTP id o16mr8683433ejj.55.1607112478383;
        Fri, 04 Dec 2020 12:07:58 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id d6sm3601660ejy.114.2020.12.04.12.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 12:07:57 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 15/23] stress-ng: upgrade 0.11.23 -> 0.11.24
Date: Fri,  4 Dec 2020 21:07:28 +0100
Message-Id: <20201204200737.7072-15-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201204200737.7072-1-alex.kanavin@gmail.com>
References: <20201204200737.7072-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../stress-ng/{stress-ng_0.11.23.bb => stress-ng_0.11.24.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.11.23.bb => stress-ng_0.11.24.bb} (90%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.11.23.bb b/meta/recipes-extended/stress-ng/stress-ng_0.11.24.bb
similarity index 90%
rename from meta/recipes-extended/stress-ng/stress-ng_0.11.23.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.11.24.bb
index f09bb24737..3516c15451 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.11.23.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.11.24.bb
@@ -9,7 +9,7 @@ SRC_URI = "https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
            file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
            file://no_daddr_t.patch \
            "
-SRC_URI[sha256sum] = "c0a76147a02f4c31af1fb4b9b7e0b90ac8bbd8590ccb54264d5cbe046c769cd2"
+SRC_URI[sha256sum] = "5b3a724a85eed48743dedf37eab851b617ecf921b7fff427c6d0bbf405534671"
 
 DEPENDS = "coreutils-native"
 
-- 
2.29.2

