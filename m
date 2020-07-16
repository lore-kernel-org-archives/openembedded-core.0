Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.3234.1594933692034335861
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2020 14:08:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=a/JAECFM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id z15so8570916wrl.8
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2020 14:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=34zkDXE66EFyTQ2zTzfTVmHJGdz6V8k5czJQLK+Nbw0=;
        b=a/JAECFMQBHfdLbXH8Xbnlcv/32YYwu4q1tppAeHt2qICdJ77ikw33NitJC56nHkpy
         Fn0lMnF5kFn+MTsX/oDm34W7x5GcI+r0ui0C5RPfG/3P9x0Z0rbtZKdJPywe8iAEn4nT
         YoGHwOuYIPbZuh7EtCLP6g2KHu9DSDqoVP3AA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=34zkDXE66EFyTQ2zTzfTVmHJGdz6V8k5czJQLK+Nbw0=;
        b=MPbgE5yPranw2dJ3Wje7EIWDYWBkd6gR6EFlpO/iQ0Z22NG/chlmIkttYFV99oC1lK
         Q+NgfzZpwiDm09p9V5Qnw9gwDcmKb0k2/toie8wj5qpHH3tsVpeToim/IqYU36B0BoLI
         Q5q5SoeU9yCnaGW3CTR1q9JRdUhF6tgCQ6HeOau2MW6PjhAi3ZmJ4VnbWfbsJ1hg+dlr
         cJCsoLccA6MMvjD7p3F6l4Pjhy1LWW5Ks76Xk00oZ2Z3Hw+633Pag3QNo2zLmwW+z+Tj
         YqINfmHPvOHWUwV/vjy6sKDgvdr/x0ryFVljt5ACtLtEzt7OYyaFrgFySay7WCVUR9zG
         RrTQ==
X-Gm-Message-State: AOAM5316U9kZRKzTG4JDHS9L0fOED65uA0diO8jx7rqxszgpyvn8X76+
	EnpVzOdN9e4ARbqvGz6OrdHCAeqyQx6cfQ==
X-Google-Smtp-Source: ABdhPJzBhqftOWbREKiD6QA2gyjBJJzaxbqVGRuJ56b8UHnNQCUGCMi3Tl857eCDx06peYitrhmP2A==
X-Received: by 2002:a5d:69c5:: with SMTP id s5mr6753532wrw.197.1594933689961;
        Thu, 16 Jul 2020 14:08:09 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (f.2.4.2.d.8.4.b.f.c.c.1.d.5.4.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:b45d:1ccf:b48d:242f])
        by smtp.gmail.com with ESMTPSA id r10sm10952034wrm.17.2020.07.16.14.08.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 14:08:09 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/20] libuv: upgrade 1.38.0 -> 1.38.1
Date: Thu, 16 Jul 2020 22:07:49 +0100
Message-Id: <20200716210808.7438-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libuv/{libuv_1.38.0.bb => libuv_1.38.1.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/libuv/{libuv_1.38.0.bb => libuv_1.38.1.bb} (90%)

diff --git a/meta/recipes-connectivity/libuv/libuv_1.38.0.bb b/meta/recipes-connectivity/libuv/libuv_1.38.1.bb
similarity index 90%
rename from meta/recipes-connectivity/libuv/libuv_1.38.0.bb
rename to meta/recipes-connectivity/libuv/libuv_1.38.1.bb
index afc9b2f2ea8..874546373a1 100644
--- a/meta/recipes-connectivity/libuv/libuv_1.38.0.bb
+++ b/meta/recipes-connectivity/libuv/libuv_1.38.1.bb
@@ -4,7 +4,7 @@ BUGTRACKER = "https://github.com/libuv/libuv/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a68902a430e32200263d182d44924d47"
 
-SRCREV = "1ab9ea3790378f9f25c4e78e9e2b511c75f9c9ed"
+SRCREV = "e8b989ea1f7f9d4083511a2caec7791e9abd1871"
 SRC_URI = "git://github.com/libuv/libuv;branch=v1.x"
 
 S = "${WORKDIR}/git"
-- 
2.25.1

