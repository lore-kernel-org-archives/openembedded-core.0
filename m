Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web12.20284.1607112484777243085
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Dec 2020 12:08:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=U91u1m7i;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id bo9so10381043ejb.13
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Dec 2020 12:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hsnr8jo7mxS0v0WFAEYh6sxp9yJL1jydoe8sLFu8Bo4=;
        b=U91u1m7ipMv/kVP6yhxPdMmndIzqVaq02pH4ATnjBt6E+ZY9THz25NNM+ybwuBnJP4
         IR1VX0FOMgTeXxboogiM26g1BFWcimoNl8JI4YQyVNsv+L/NxNcePh/4eSYCOdTnJQfW
         3eFTpwuEfKfA21hYfSukOl5qYCGPQHB8MXEe0tvaMy5grHDY9oXHbamgCLAYliAreXL+
         EbtftqpJODpIbJ+R7mREg6Xwfk5v8mgiBAdiBeSglC2vyZYrRj7vfZyDycFkD+V6xbeW
         cyh+a1ewBs0syWZGD0QwyZ9JXSG+petPyS9OWgca0+N53EU8kXitIljZXbnVRJroRy+/
         c3Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hsnr8jo7mxS0v0WFAEYh6sxp9yJL1jydoe8sLFu8Bo4=;
        b=rxzVVl20U44BS+HRSubJVkhqRdKlLLH3LNYvfaWTaGVgKJvbzLqO75pr0/pzJLheDo
         uFlPhHhHcucrVvQBhIdz7fBFniI9k6FidVI/jJ0fDutbIuGaLSvEmdOOZk2oWL30TafZ
         ujF3BjDTBPQONid5ghXKcJAtxdTcTVA0xB361gx024JSjlUf04ktWK8UHrHe8CwLoU4n
         S9I1rItORnSeEazNnAq9DXMDqXLM5xUgij4sZBkWsNRHcExJjoF/P7O5niSOQd5y26zl
         rL2kTthvZ3SEffKen9+Q9hEXx3WXgQ7HjOaQ1bDVLUS3vqpVEuoJOaQ/sJnWaO4SC1g4
         N6dg==
X-Gm-Message-State: AOAM532kc+3eUz1JV8cGcZQJXA2twi4jdP2TXG+lTZZo2YPYHhvR18O8
	rXqd5CBFrc+ZNeSrhCGbynJshCvyq+jSiw==
X-Google-Smtp-Source: ABdhPJwlit2KgtZDg8p27HqQJHdhk7oUOC+L01CQErgVpdUrPjBRdifMWwySACm7QUW+hJ0oIlfGbQ==
X-Received: by 2002:a17:906:b118:: with SMTP id u24mr8510081ejy.500.1607112483177;
        Fri, 04 Dec 2020 12:08:03 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id d6sm3601660ejy.114.2020.12.04.12.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 12:08:02 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 20/23] bison: upgrade 3.7.3 -> 3.7.4
Date: Fri,  4 Dec 2020 21:07:33 +0100
Message-Id: <20201204200737.7072-20-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201204200737.7072-1-alex.kanavin@gmail.com>
References: <20201204200737.7072-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/bison/{bison_3.7.3.bb => bison_3.7.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/bison/{bison_3.7.3.bb => bison_3.7.4.bb} (93%)

diff --git a/meta/recipes-devtools/bison/bison_3.7.3.bb b/meta/recipes-devtools/bison/bison_3.7.4.bb
similarity index 93%
rename from meta/recipes-devtools/bison/bison_3.7.3.bb
rename to meta/recipes-devtools/bison/bison_3.7.4.bb
index 74532caec3..abccaf9958 100644
--- a/meta/recipes-devtools/bison/bison_3.7.3.bb
+++ b/meta/recipes-devtools/bison/bison_3.7.4.bb
@@ -12,7 +12,7 @@ DEPENDS = "bison-native flex-native"
 SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.xz \
            file://add-with-bisonlocaledir.patch \
            "
-SRC_URI[sha256sum] = "88d9e36856b004c0887a12ba00ea3c47db388519629483dd8c3fce9694d4da6f"
+SRC_URI[sha256sum] = "a3b5813f48a11e540ef26f46e4d288c0c25c7907d9879ae50e430ec49f63c010"
 
 # No point in hardcoding path to m4, just use PATH
 EXTRA_OECONF += "M4=m4"
-- 
2.29.2

