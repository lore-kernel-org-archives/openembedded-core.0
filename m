Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.25176.1591602501251883321
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2020 00:48:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uuJf+Vpd;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id q19so17149911eja.7
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2020 00:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OQ5yRi0L62poK3ar0CIYkQ9ddn3LFA1JRb5DYEw1/zE=;
        b=uuJf+VpdnrnyVMYWQQNjh3YCE1YqUBv6G911EUEiiTwrZw1M4z/rDFaL+RpZ1/QJqL
         YNUx/IxNvSUsLElY9jiZPfUcrk/TIGuClCk+RZjAn7nxiQzZcWRVv6GRv4qLdIhEmIVK
         EK5faJAjVA/QRUz7zapvRJlyZjxvPSf3BDF6HsKVXXTNrMDKkYwcVEKzTSqApMUKlKCs
         Ik/EHBnorbHRfum27WYgFkP/4WS0RIWYwR0CYbsmcNgblYihupbZ6ja+1XlRXdbZaMu9
         JS2J5TkRFeaCFTGSUNTWFa7OzjWkgzPoJWbQtmyZs5aZcnkz2a7o1JdwiyHPSDxSXKoO
         3naQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OQ5yRi0L62poK3ar0CIYkQ9ddn3LFA1JRb5DYEw1/zE=;
        b=PTzASUrTIDefO7vjC9S9g34NtgxLMIC7sqLhFu5RdnLkiCtDJStL97/Unct1xIpIrV
         MjtN+CES96c3Vz00wXNsGkE4nE+Ep81688EHsyDyqgB2S0GHcEU9+E9MzBnWHeHMzfL0
         t58/KO/Y81C9vlaB7CeItZCMtqmz/MzmzFfeD2d0v9x5qMMU7/E+aa37B+7/33Cg6j7+
         W0AT26ygOfITgfQlIyg4GqL9BRnpQOZFlxWDjlto9zokRL8DhKo4c3ceVosjmP4deZKd
         YrkXGJTfNKVnqUt0tALUP8UvMyQ8YB2otI7vLLFruxtphiDScQyQjQiH16sAS1c7vX0S
         zFTA==
X-Gm-Message-State: AOAM533GA984Qk12S5tgng/3uuYrvJrvvNWZ8SJd9RAk3PLBWyCF56Cl
	M0CbXMDrel/t0UB+ep8S1daITDej0zE=
X-Google-Smtp-Source: ABdhPJwZPGxzxUQrk3mzwVZFTUhE3UmvKr5yZYr1psfTOrMOWgasB097a+AaX1wPMz4kg845kBVSAQ==
X-Received: by 2002:a17:907:2072:: with SMTP id qp18mr18988974ejb.179.1591602499628;
        Mon, 08 Jun 2020 00:48:19 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.66.228])
        by smtp.gmail.com with ESMTPSA id g22sm12473466edj.63.2020.06.08.00.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 00:48:19 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 08/42] strace: upgrade 5.6 -> 5.7
Date: Mon,  8 Jun 2020 09:46:25 +0200
Message-Id: <20200608074659.7051-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200608074659.7051-1-alex.kanavin@gmail.com>
References: <20200608074659.7051-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/strace/{strace_5.6.bb => strace_5.7.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/strace/{strace_5.6.bb => strace_5.7.bb} (92%)

diff --git a/meta/recipes-devtools/strace/strace_5.6.bb b/meta/recipes-devtools/strace/strace_5.7.bb
similarity index 92%
rename from meta/recipes-devtools/strace/strace_5.6.bb
rename to meta/recipes-devtools/strace/strace_5.7.bb
index 53679cd0d2..c184d035aa 100644
--- a/meta/recipes-devtools/strace/strace_5.6.bb
+++ b/meta/recipes-devtools/strace/strace_5.7.bb
@@ -15,8 +15,7 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://uintptr_t.patch \
            file://0001-strace-fix-reproducibilty-issues.patch \
            "
-SRC_URI[md5sum] = "f8e0394d4e537b3faadf0a72f5d1d17e"
-SRC_URI[sha256sum] = "189968eeae06ed9e20166ec55a830943c84374676a457c9fe010edc7541f1b01"
+SRC_URI[sha256sum] = "b284b59f9bcd95b9728cea5bd5c0edc5ebe360af73dc76fbf6334f11c777ccd8"
 
 inherit autotools ptest
 
-- 
2.26.2

