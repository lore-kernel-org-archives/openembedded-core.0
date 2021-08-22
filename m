Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web12.9611.1629636685158901196
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Aug 2021 05:51:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AddwQ+76;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id o15so8771855wmr.3
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 05:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TD7mCD1tqKkP6D4tPC8fHoAT+jaDqIbQEcSSiK6/TH4=;
        b=AddwQ+764V+Adlkgv6YjxDuCRrKuWDA5Ty7MdvQZOe2hvOZoqjmNbUZFkglUXq3zVL
         MTw7DUp1CMQ47RiJuZkkIvK7fYwv8uUkt+FfW5agEtmo/Kdm5+yNCCrdqeu/GnyQC5JV
         zrhpdz/LCs2YIr9qqEkNbFmF7ueAU1YhLFXH1h6piJbCW907p7bq5Q93Hn63o8cOVHGK
         2OuqsYMHgcZO1hvzFNIOvy6JCNF57dGaxEs/5bshu8hKTrQFCsm+5FP/MPcPhiOWJaga
         6WObcOk+V7V74HgeDAQQ6r7hUd6Gm4GT6F2zbRAmMQNqPV6nRWx1KcvtKKUv8XG340Uz
         C7uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TD7mCD1tqKkP6D4tPC8fHoAT+jaDqIbQEcSSiK6/TH4=;
        b=kAhHIWXb4BSI09xO1uRR1KjPbywY5H+x25gldN9vmnd0Fq7HjPJDvlb8ibnGHO8MIC
         a0fhPsUoSCJys/qwqMAquiKdG7bs6SJIUtkuObiNptaurahlhzm26glXoEHfxo24U6uN
         GQ3R0AzpE0NwpYhHllUpg9R6BqEZ07tyCFPQmo+V+PzwrI1C6LAeMk0VdZnCZfWPJ5zJ
         t/4pfTSkEKJeL/HG5Ts+od788dQk8K8NhURpQ5yLhvlBEkHV+bewQRkvsKOI7dPWSo6R
         ard/3foCczLEPBqBtFlDQrvrdL+YO0SzPeRBghVBtH7XPMsDXawSnODpLqdStPpl5O6U
         FIbg==
X-Gm-Message-State: AOAM530//DBOXrCtzdUPHMC3nokGDeEuRL1kiM9fNps48V7RWla0oGph
	ruKrDsl4msivJuOfN1oABU0Mn1ekmX6piw==
X-Google-Smtp-Source: ABdhPJzcJcywFMkWbw8D/Ol5BezRy41lI+wlSAfakJ92KMFDW2LnUSYCkpVO+74qE8Go63I8xJr7JQ==
X-Received: by 2002:a05:600c:298:: with SMTP id 24mr2584640wmk.172.1629636683788;
        Sun, 22 Aug 2021 05:51:23 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id c8sm11915882wrx.53.2021.08.22.05.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 05:51:23 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 19/55] glib-networking: upgrade 2.68.1 -> 2.68.2
Date: Sun, 22 Aug 2021 14:50:27 +0200
Message-Id: <20210822125103.310416-19-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210822125103.310416-1-alex.kanavin@gmail.com>
References: <20210822125103.310416-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{glib-networking_2.68.1.bb => glib-networking_2.68.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/glib-networking/{glib-networking_2.68.1.bb => glib-networking_2.68.2.bb} (93%)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb b/meta/recipes-core/glib-networking/glib-networking_2.68.2.bb
similarity index 93%
rename from meta/recipes-core/glib-networking/glib-networking_2.68.1.bb
rename to meta/recipes-core/glib-networking/glib-networking_2.68.2.bb
index 9a8ff38dbd..acea26e080 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.68.2.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 SECTION = "libs"
 DEPENDS = "glib-2.0"
 
-SRC_URI[archive.sha256sum] = "d05d8bd124a9f53fc2b93b18f2386d512e4f48bc5a80470a7967224f3bf53b30"
+SRC_URI[archive.sha256sum] = "535ebc054ef697db56a4fffed91bc0e11c8ee1c9acb48aad28c8e1d5c3d5994f"
 
 PACKAGECONFIG ??= "openssl ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 
-- 
2.31.1

