Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06C81CA0EC4
	for <webhook@archiver.kernel.org>; Mon, 11 Aug 2025 19:54:49 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.57317.1754942083374796215
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Aug 2025 12:54:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KxAxs43r;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b26f7d2c1f1so5073848a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 12:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754942082; x=1755546882; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u0YPhqcgcaeae6hM/eg/5N4iijPdM+3px+fMo0aVNWI=;
        b=KxAxs43rSmLGwbKsH/zuW8JS1p4rq7/tn0EmNhVA3r595pTWjawYU4s6/X30LFFpYy
         bYHwFWAG/ZId14RO885DZ5anbbheDL7dGQDWDsNucxoMTO8eEXOS2VaZBHXDij5Ia7bB
         ghZtYun/ziR7e4yPo2I4fAi2ihYFi5ukFjZZTkgHTmWONx3FVbSNVLdgd5HgOEdKPkjA
         4O0gKym9xs0sOTtDV68tFNBPCd8qpbYTk+hXNGgovFY18wVh9nazYByjhT+5zvcZi5uF
         JCA5/E1b+w+O28q1dyYqDZc71fZr8WbBLFRXaOr7ak90w1SVUouTqv/Hd7G7eLlZp4qe
         3HpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754942082; x=1755546882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u0YPhqcgcaeae6hM/eg/5N4iijPdM+3px+fMo0aVNWI=;
        b=uWBTE6SBhnGCRB+/MSP0WxiMI9mnzn36fayP5RGu9dsJ+f/4oS1S4j55J4Gf/mENpw
         32YbOk3vd7GrGNWv0J87ubLodKxVcBYxdYvKYV3aIJfckRuVp7+Hx66aOx0oZdwBExIe
         j74tymBXpViM704KzH4Te36its2M2SKGjGBg6t6henDaNt8bkWw7y3sY6Te5Q5tV5nkM
         N5PPDycT0x8nevC50EFM+y7xdVASAYWl7jyMNppx96ceyiMJc3OfgsGR11lXfmX9TICU
         T5BX13sOSFL5YpflzNJLMul0xTeSjR0McNxDI/+2PQ2hflhhJeRCZDTVpgCX7hpRRDRX
         U3RA==
X-Gm-Message-State: AOJu0YxRcl9cfpfuiOVH0FVutCIJOhDoqhgH3cfTvZx8VAmJWcTNzRCv
	7IksIXrWeTw/dWQzA5iBcW5sVhoO3O6p3Mko6pVqAcE6evnWN3nYr8liZiJlehgLbDw=
X-Gm-Gg: ASbGncspc6UnM+qfzxE995Wxx17C0NtDLRWR9bvaGmfd8HspE57l+SYgP6GKtqMdqT2
	ewRK5qC0jz2ldep71oJ9THAebKl0BbUqRgtlsPfMFNv1XDzVtX8xjVkjU8MD59WLaID0vjL5Rw8
	49aJTowRB5G5Y6JHjfZ/903l7SsgjmscQx9voj/WfC/ZIa3y+Ek9f1JcrUK8Fs0Oxc3Kv8BIUlK
	yGdrZcBouOUIEMKMl9SWtJkU8NY+WxiFfG+y094k/zlGTSHx6BkSROX7sxmWLD74/BMXHBDQmce
	WcZS27isY3VM+KjMyijmYQ2jtXfiuy+fivD7ca5X6762K9bMhgHApbg8sbokkA3tt993X3YqyOZ
	eYRSb/mw6EEFM9Vdst2ql3A==
X-Google-Smtp-Source: AGHT+IEl9A9bnyypNrXjoeufFVeMSB+KrdN43nLmHH+/qJUKtfl6g8IanUV8ZoKG8pKz8Z4No7bH/g==
X-Received: by 2002:a17:902:e54d:b0:240:1953:f9a with SMTP id d9443c01a7336-242fc208196mr12266755ad.2.1754942082217;
        Mon, 11 Aug 2025 12:54:42 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::ee1b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b42857d1dc0sm12215457a12.61.2025.08.11.12.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 12:54:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] python3-numpy: Skip running test_validate_transcendentals ptest
Date: Mon, 11 Aug 2025 12:54:37 -0700
Message-ID: <20250811195437.602308-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 19:54:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221749

This test fails [1] with x86-64-v3, surfaces when we switch default
tune for qemux86-64 to be x86-64-v3 or newer

Test seems to compare exact floating point numbers but it might not be
precise enough and comparison may fail.

[1] https://github.com/numpy/numpy/issues/27460

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/python/python3-numpy/run-ptest | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-numpy/run-ptest b/meta/recipes-devtools/python/python3-numpy/run-ptest
index 6e76dffc59b..a1c80323d60 100644
--- a/meta/recipes-devtools/python/python3-numpy/run-ptest
+++ b/meta/recipes-devtools/python/python3-numpy/run-ptest
@@ -11,5 +11,7 @@ mkdir -p "$PYTEST_DEBUG_TEMPROOT"
 # test_mem_policy fails if there's no C compiler present, but we don't want to
 # include gcc as a ptest dependency, so skip that. test_big_arrays uses up a
 # large amount of storage, so skip that too.
-pytest --automake -m "not slow" -k "not test_mem_policy and not test_big_arrays" /usr/lib/python3.*/site-packages/numpy
+# remove test_validate_transcendentals if
+# https://github.com/numpy/numpy/issues/27460 is resolved
+pytest --automake -m "not slow" -k "not test_mem_policy and not test_big_arrays and not test_validate_transcendentals" /usr/lib/python3.*/site-packages/numpy
 rm -rf "$PYTEST_DEBUG_TEMPROOT"

