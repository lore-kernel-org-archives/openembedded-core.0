Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web08.2113.1617064081509423863
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Mar 2021 17:28:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=VQrp0qLz;
 spf=pass (domain: linaro.org, ip: 209.85.167.178, mailfrom: anibal.limon@linaro.org)
Received: by mail-oi1-f178.google.com with SMTP id a8so14793004oic.11
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Mar 2021 17:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tlgYI3Txy7h50biCQQGXg5pu/lvJGgppEc4ipprwjdM=;
        b=VQrp0qLzutaFgTxIB2hmJi7XQfASO8ouwFC7nwm5CjQUmx5iA+fYDZMlLRUnAwb3MR
         n+hJwixF16Oi3TmHIwaIrcKqi0o+8rf+7rxHkd79m3nqFPt4qpQs9ITE+oycPV6l09UZ
         +f8k6tzjLAa5ne8EA3MB9vLQQ7rbxa9xw9RgbTjzGQ6mbwUFaP+fVGpdLEuETWdT/tYd
         HNYoBgXs6b0vKkXjo9a9Dye2FvuR4FubN8A4cUDWeED1Ksk8lxzSmj+p9WVwJQublLV4
         PU8r1EHhfY8vI9ZgmAagd+/jblR3vvQGBTrjFvqjqZg8bTeyHapm17P42v8YaD9vh7Ee
         uAlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tlgYI3Txy7h50biCQQGXg5pu/lvJGgppEc4ipprwjdM=;
        b=U4gqPHT2w27GcqJpWydj1oosUPr/x8/FukUlFQ7SeI43idbmy3yQuLriou8gnknGVv
         ysuHw4WBuHnAclDpJvCUBOBuVXyDNvnMSW/1EuFHzfOClfQGbtHEkRQgF2EDAuw5tCq1
         fCbE0nv8G2uftxJic8YYcGJIHZIaEyMYDcn9JdUAViMc8YveBIjgLWUJPwXdah0iFWvU
         3GUgfxi3wupNPNJN/+8PeRAKEbqlbJll2n3Xg5MXZtjduFE1+VwS+J+tSw3uE4EI4qDQ
         SMDz6iV+UOWn1UKNORvdIjdf/WU6ya8Mx99JkoYuanu9reGTdTFXMO5JbWoXqUrd7wbX
         z1eQ==
X-Gm-Message-State: AOAM531VcJLxF+EXh91ozW/CAjYiz/oIno+lcO9lYEzoovszGiR4DP8e
	ScCcNugroLiDaMuO9qKdvl9FCEt42JE0yw==
X-Google-Smtp-Source: ABdhPJzs1rv1iX/jwimowaScZXPHty+tbN06ZbCogSG5Qe02UZzDF6OtpVSzwYf/onXQbH18UaklIw==
X-Received: by 2002:aca:7543:: with SMTP id q64mr1267526oic.100.1617064080745;
        Mon, 29 Mar 2021 17:28:00 -0700 (PDT)
Return-Path: <anibal.limon@linaro.org>
Received: from blackbox.Home ([2806:10b7:2:5369:2c32:cfff:fe8e:de1f])
        by smtp.gmail.com with ESMTPSA id c26sm4684050otm.51.2021.03.29.17.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 17:28:00 -0700 (PDT)
From: "Anibal Limon" <anibal.limon@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: yifan.yu@windriver.com,
	Randy.MacLeod@windriver.com,
	=?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
Subject: [PATCH] meta/recipes-support: ptest-runner bump to 2.4.1
Date: Mon, 29 Mar 2021 18:27:57 -0600
Message-Id: <20210330002757.401114-1-anibal.limon@linaro.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changes,

cce0edb utils.c: wait_child reimplement timeout using alarm
acbba90 utils.c: Use a thread to read from child
cb2840a utils.c: Fix exit status of a child
77bc79e utils.c: get_available_ptests allow to specify relative directories
d27e242 README.md: Small fix mtrace call
c5d5831 tests/utils.c: Add braces in START_TEST/END_TEST now required in check 0.15.x

Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
---
 .../{ptest-runner_2.4.0.bb => ptest-runner_2.4.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/ptest-runner/{ptest-runner_2.4.0.bb => ptest-runner_2.4.1.bb} (93%)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb
similarity index 93%
rename from meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb
rename to meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb
index 8b9938f572..ba0eb03799 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/about/"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
-SRCREV = "834670317bd3f6e427e1ac461c07ada6b8936dfd"
+SRCREV = "cce0edb4282ee081d043030bfdf29f3e4052f86c"
 PV .= "+git${SRCPV}"
 
 SRC_URI = "git://git.yoctoproject.org/ptest-runner2 \
-- 
2.31.0

