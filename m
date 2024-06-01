Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F091C27C4F
	for <webhook@archiver.kernel.org>; Sat,  1 Jun 2024 12:25:16 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.36113.1717244712972359851
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jun 2024 05:25:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=j7BPZ3cr;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1f47f0d8ec9so24981275ad.3
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 05:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1717244712; x=1717849512; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RUgXXMW68/7OD3TVvlheoOEmmsiu4a5F9xAsmEo047U=;
        b=j7BPZ3crI7iOdYCrAwHQg2EQmyO/l44LrhsNspTA6qbKMAD7VhvQsWMHCPh/9c7agO
         v7BF/O3Ze1MZBZsedz88/NbpMUz/qLq2RvMKxOy6dGK1POhzUxejikPqhZ+dShMjTKiB
         zNmWfWnSuQD+MFq8iFag6KYQ0eptZqF+24GH89ghwzWIp1KKyon5k4VPWmxeGl2WjDQY
         9X14iOE9huLNEyi5eOnQn7/Bb18fkNEePfLcymxwhmojf1knJD+t49ak1uUIDRExcOa2
         LSZMlK/beCHNCO0x3R4dYQZeb5kL/ladLmIhf/cSIoDJwRVfI8kgMhkAIZxQP9lATHO8
         fkhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717244712; x=1717849512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RUgXXMW68/7OD3TVvlheoOEmmsiu4a5F9xAsmEo047U=;
        b=XqNZRc3ms39MNxO+0qHVZ7Kw4JXqcCKlRxd3TmHhZfg5MBcHOfQUW8w9eTY5WEG7X+
         X2SFbnCpDMG8jYQMERB9JzpO9CU3JQJQFFZeawoYL/qOFsICW+ozmIdpzWEen8PescVz
         83ZBbqE9Q7GGr+VZEGJtoK9UG7f5HcTQpTaLJzLzAU3XHLi8osikUzbIgBCczJ4z9xSp
         BDrnEaBHGoXU4uacqP4WNPV11bF+cLOChfOqsrgZtbpUo3GQa6sRzOKVpLdxny37BRvt
         2ojmP3JJrs3KEZ8focvYnPnzsk4fclJL4Tj9kx9eoO4YdHB6MVlZB5doyWWh5tYYxHNo
         y+9A==
X-Gm-Message-State: AOJu0YwlN5SdyiIDHyLbAx1AfIPJMB/7R9KoOOVnBluFGe0QLdVTnK5x
	3BlzE8lfOK/Sw/VJmyshrdKn3gHAIvJa4fP0WFSCK/3K4b8YqBQRzJoo1w+jrIG+kMhQC+RpLbX
	c
X-Google-Smtp-Source: AGHT+IFyUPhwsBH9sNEDKZ257MSQzspZ0oZsMRMfrxXaqcFnJEh/Pbrx92rlD3MeSoWJeurfy7Fp6A==
X-Received: by 2002:a17:902:d4cd:b0:1f4:8b95:a1fe with SMTP id d9443c01a7336-1f6370191b2mr53747255ad.29.1717244712151;
        Sat, 01 Jun 2024 05:25:12 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63241d4d9sm31804165ad.296.2024.06.01.05.25.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jun 2024 05:25:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 13/21] ptest-runner: Bump to 2.4.4 (95f528c)
Date: Sat,  1 Jun 2024 05:24:39 -0700
Message-Id: <c0061e8e30c0bbd45c31f56d01ed5b688a641e9e.1717243719.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1717243719.git.steve@sakoman.com>
References: <cover.1717243719.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 12:25:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200109

From: Changqing Li <changqing.li@windriver.com>

Changes in 2.4.4:
95f528c utils.c: run_ptests improve error handling on ptests iteration
c48e5fc utils.c: run-ptests improve pseudo-terminal handling

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{ptest-runner_2.4.3.bb => ptest-runner_2.4.4.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/ptest-runner/{ptest-runner_2.4.3.bb => ptest-runner_2.4.4.bb} (95%)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb
similarity index 95%
rename from meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb
rename to meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb
index e6668da01f..2263e07280 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/about/"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
-SRCREV = "92c1b97bfdb4a94acc1cabcaf97eef52dc29144c"
+SRCREV = "95f528cff0bc52903b98c292d4a322fcffa74471"
 PV .= "+git"
 
 SRC_URI = "git://git.yoctoproject.org/ptest-runner2;branch=master;protocol=https \
-- 
2.34.1


