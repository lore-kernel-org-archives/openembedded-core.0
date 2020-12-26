Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.19483.1608974867940774515
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Dec 2020 01:27:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hk2yM8ZG;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id n26so8303673eju.6
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Dec 2020 01:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8ZH5sOuTcc2DbvXVueZ08LfRANOpRx50lJH6xD8jAec=;
        b=hk2yM8ZGFx19qhUd6zENRiCmW+4QWvOeXVN75PlY3N0K87gv9ZLQB/8or0YNu9S4ZQ
         87ToPFSsUoy8/9RElowzZv7SHcTYzy7yRZ5g9XkZCxHE49LWxAEJxbtFIqppG3T6duxi
         BG9gCrav6yHhecwySko1nslpR6Ehhb1Dh2NYUb6AajsC3pD7zqLk0oo23lGmrquIooGi
         ITNF0P9gb/q4fNvVk9JM5UDKkp1Y7+GBY7eXwkQw9Kp9fQX0wlvanp2WNY4hMI7GYz3J
         rB70SpsufnRMIOQuqyDNYLsoFw4YuzhGcT/h2HYbDC29uWFdUXbaxKRsueQHjp3rsaEv
         lfdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8ZH5sOuTcc2DbvXVueZ08LfRANOpRx50lJH6xD8jAec=;
        b=KoeSbwwbjEEKicpnwANZd8wRJpCdr6PBPqgBdxW42ldlT9AP4YkSwAjltvP5lR8pFF
         caCUP1f+uObHS54WN1qQwumIIBpLUSQgpvsPMpFQhy/UEQTefV5moloky84sICnxHWWS
         jz3fuzHfFcAPR30QTqSd88ta9CeY2sZz9QWb6j0x9/H+Aja/Bonq9UhS1ZiNQm2uLaBI
         8qH5nCqee+O+fJZnazulazxMv3enV8tT9M8uVjvSfsInIzaRQQNWdd3AZr2GQJm5Muq0
         UYDEdYFO428/cughDZ4632fWo4sjjq0FUwMOY3IwzFWR0nMJDhvZn5rgDNK07jz4Isrv
         V1EQ==
X-Gm-Message-State: AOAM5301JMcwRddF6eaLfQKmZTNsiErbWa4ejvyVoY1nr59Q2VYWEVRB
	rKoxOp7woGqD2Px4lXjlSjI4mrcaQz0=
X-Google-Smtp-Source: ABdhPJxUebs+xgmUNHIGrDXabCEoLiM7YvwBtyM4yu55qs7h78zWyOsZoxeEkPRrZtdK+4lqRvHr6A==
X-Received: by 2002:a17:906:ae14:: with SMTP id le20mr35133820ejb.451.1608974866567;
        Sat, 26 Dec 2020 01:27:46 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id u2sm14828406ejb.65.2020.12.26.01.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Dec 2020 01:27:46 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 05/48] dnf: upgrade 4.4.0 -> 4.5.2
Date: Sat, 26 Dec 2020 10:26:49 +0100
Message-Id: <20201226092732.52323-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201226092732.52323-1-alex.kanavin@gmail.com>
References: <20201226092732.52323-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/dnf/{dnf_4.4.0.bb => dnf_4.5.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/dnf/{dnf_4.4.0.bb => dnf_4.5.2.bb} (98%)

diff --git a/meta/recipes-devtools/dnf/dnf_4.4.0.bb b/meta/recipes-devtools/dnf/dnf_4.5.2.bb
similarity index 98%
rename from meta/recipes-devtools/dnf/dnf_4.4.0.bb
rename to meta/recipes-devtools/dnf/dnf_4.5.2.bb
index dff6fe6c25..e1b0e1a132 100644
--- a/meta/recipes-devtools/dnf/dnf_4.4.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.5.2.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git \
            file://0001-dnf-write-the-log-lock-to-root.patch \
            "
 
-SRCREV = "b9b7623892f551da201bffd03187d703242b00e9"
+SRCREV = "36a3ffaee4db76a7efe7d40f4e42ce679b6a6920"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.29.2

