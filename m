Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51BE0D75BB4
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 04:13:40 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web10.3534.1732162411734987114
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 20:13:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mHIjJjIg;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6d43e034ef9so4463966d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 20:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732162411; x=1732767211; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ebwHHZLeO6zxmb4Rb7EbMaMjeYJEaP64l1HEF0cJqpg=;
        b=mHIjJjIg0sj8Ve0irmxc0YdW35TK4VYJ2PV9lG1MO/qKN8bvR+5rPOUL1B1uh7RCj9
         JlZQFiBV9bMjySWCo0ekVizMcsHB66bApK0hLwDfEvKWuxLR4bi6gxVhQBTvZ3x92n+p
         29KRv0+vtRAbaky0tta685OfHggKbCMwKmLHdtmwM1lwHY9P0+rl8rP58UYgPk1msm5J
         kEdD2TuvQdXhXsjNhc1hDlwIdkm/rGrHknCqWTXEhlZYpA/80d6tNK7o5AsHJATtT7iq
         DN6nKrV+w4zLc5/t7N280hkrfRXs/KiaR9rCkcNTuUP8fzE0pIh9m+ToUgGznVvMXoP3
         ZPLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732162411; x=1732767211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ebwHHZLeO6zxmb4Rb7EbMaMjeYJEaP64l1HEF0cJqpg=;
        b=qaLg8DL+P9Svm5v3Bkr5FldfeHPzLuU+nX6hamDJeWYSHKQSJv9cxXu77SGa6cc1Ay
         wNv93TLNXTfAiEibfFiu6WraHYI+aMuFo8lS1XJwKySemdkk6HpVWgp0ZbV8xQoNhq6N
         HPUYIFBj91/C4UmflfO1b2ZO6fP4H/mOo48ursBnAQT3DHO8VH8BZWz2o84nKEuJj2W2
         aiHkNzIIXdqTezbzSB7HRQUSC3j6k15tR6EAObbpWhcmoVwg+pt+iBim4rTePBnfrr96
         vZOhjSSccJE+x84GX1zDcJYI8NO+RFvbExckWDOMpN+kucdfbpKWpDFE/kG5TZtK61kL
         HUoQ==
X-Gm-Message-State: AOJu0Ywd85hpMnbl+oHM73n88m4Akw/qIAxGFIjXsNUT3LK2i527sgES
	E79+p5q1jTCjLyjgkyop1IVbEIDB7lVM57YWgXzJiHS7mUBP4PN49AwV0NfG
X-Google-Smtp-Source: AGHT+IHNALNyRHCznXFefjljFbIJbURI67cmApRvU6zpXJDkd1pPz0r+Fi+K6FvTi6KWp6tDmboWZQ==
X-Received: by 2002:a05:6214:b6e:b0:6d4:1c9d:4f47 with SMTP id 6a1803df08f44-6d43779b9a8mr73426046d6.13.1732162410769;
        Wed, 20 Nov 2024 20:13:30 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d4380d8b06sm18238846d6.37.2024.11.20.20.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 20:13:29 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/6] linux-libc-headers: update to v6.12
Date: Wed, 20 Nov 2024 23:13:19 -0500
Message-Id: <be8aa33700a21893c5a898c947aaa39e54ef7250.1732162137.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1732162137.git.bruce.ashfield@gmail.com>
References: <cover.1732162137.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 04:13:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207507

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-libc-headers to the 6.12 LTS release, we drop
6.10 and make 6.12 the default.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc                    | 2 +-
 .../{linux-libc-headers_6.10.bb => linux-libc-headers_6.12.bb} | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_6.10.bb => linux-libc-headers_6.12.bb} (80%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index b1cc8b1285..387005b50e 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -21,7 +21,7 @@ SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.43%"
 GDBVERSION ?= "15.%"
 GLIBCVERSION ?= "2.40%"
-LINUXLIBCVERSION ?= "6.10%"
+LINUXLIBCVERSION ?= "6.12%"
 QEMUVERSION ?= "9.1%"
 GOVERSION ?= "1.22%"
 RUSTVERSION ?= "1.79%"
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb
similarity index 80%
rename from meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb
rename to meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb
index 9484083948..dd6add38de 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb
@@ -8,6 +8,5 @@ SRC_URI:append:libc-musl = "\
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
-SRC_URI[sha256sum] = "774698422ee54c5f1e704456f37c65c06b51b4e9a8b0866f34580d86fef8e226"
-
+SRC_URI[sha256sum] = "b1a2562be56e42afb3f8489d4c2a7ac472ac23098f1ef1c1e40da601f54625eb"
 
-- 
2.39.2


