Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4EA1C369D3
	for <webhook@archiver.kernel.org>; Sat, 26 Apr 2025 02:35:27 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.2766.1745634926054018231
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 19:35:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GvrQA0BC;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2255003f4c6so32855535ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 19:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745634925; x=1746239725; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9wc/JZpb9I01WkScxZifDGeny+GfXjxdfvFxjNwbPxo=;
        b=GvrQA0BCOap8xIYs1AlcIZHvQ9qH74UXtzIX2j6As9QIRg87ieAX40Hy6++yMXaBnk
         4M0DCHg5yY5eejsiK6kODSyzi+y0HMJluYiSMsDC44Q/U9C8n6MwoQIHu9UEoUFIAIvt
         8z5gyloUKaibFPPRKOFfqk7FQ+kC9CmGOY/fiQLAl9qgcVmGUidMNYuj32vgTUUjvdJt
         oGOsbemHOOTgMV4sQUHieaQ+D8MUIeJWhGGAAAeY5pOh1D4pMsKUxEDHZmO3LraAk49B
         +uMc6alFHqL2zRPZsTOKNp6NN3KY3A0jeS9SAKpeFCU2FNQjN5w/pU2YMhnLAk974eBg
         8PxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745634925; x=1746239725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9wc/JZpb9I01WkScxZifDGeny+GfXjxdfvFxjNwbPxo=;
        b=aMi/smJKfcDghQLDXD/TnBeEUWaYyFW53T+V4PzckL3j/wiB/9Kcr4GkOj2O1wy4jv
         ACRa6o0u6eTyiXZskxQWXRMfBLvcmm2cXs/ZJuD0znWkNpLPvXDnPJ0Fm5REovy1hGfv
         g5fp+dv0861dK0U7s8y1bZ4FZpFk7/JY1tXGfAZfXQKJ5NaA1jviRLqjVq5KoQLJ9AuZ
         sgcpeJZ7qV6SZ3/VOj2ptKpP7ce62XErg6TrkdGYtZQvunv0kNo5l0LMmviIsu+qQCXw
         rgUiAjb8OCKbuyf+By76phrGYccOAqlHeTespVdeK6oWrmdYUMDcK0nrfZYzflzBi12a
         sJyw==
X-Gm-Message-State: AOJu0Yzu+eoIfqUQMKJCI1zKmzpJTI39jZjjkQ02R5oeONZmWW2bHuwz
	mMEJvImQk6Dcr5ZAMo12GS5MUITiVtVkKWiAuzEjJdvLjwaITtCR2AZFZL9G
X-Gm-Gg: ASbGncsQ1aNS7igLLW0ElT15h0CHMd/Nsaz3JLUZKLtbtwcLNbP8W7s+9X1HhqQ/g0a
	vct5ZC0rgMJmARh7xc3U5fkmFLzT1tRL5aYtNs2zNb/9bYrZYM+gZxLtG7L7LldogK+UuT+s1LP
	bs8aJxee0r40MEOnHi1HTvWjWQzaWuFMfvtU66FcugAwILplREHtnGnD2PqfrNOChVft68cJoRx
	nTXIhg/nGt1dbrA0ySHH+2An0XiBXBsbjJRoryUgVK5LcUOzcw9nI/OAJFBzA15O92D7o5cgGJA
	c4U+wPZjgfRbHWVRJW58NLp66MhXuZ+A
X-Google-Smtp-Source: AGHT+IFHQWYJkKIyerxy9Q7ifjeUkUwdNDdVEVJXpMBlgQ2+gKqRfoCeChgo1yyYwToHsjDk+eU6mg==
X-Received: by 2002:a17:902:ce8f:b0:224:b60:3cd3 with SMTP id d9443c01a7336-22dbf5f080dmr69944305ad.19.1745634925210;
        Fri, 25 Apr 2025 19:35:25 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ed40])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4db97b3sm40057475ad.55.2025.04.25.19.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 19:35:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 25 Apr 2025 19:35:05 -0700
Subject: [PATCH v3 03/10] sstatesig: Handle special case of
 llvm-project-source shared-workdir
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-clang-merge-v3-3-feea6f07d130@gmail.com>
References: <20250425-clang-merge-v3-0-feea6f07d130@gmail.com>
In-Reply-To: <20250425-clang-merge-v3-0-feea6f07d130@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Apr 2025 02:35:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215502

bitbake-dumpsig or bitbake-diffsig tools do not work on any of tasks
exposed by llvm-project-source recipe. This is due to it being a
shared-workdir recipe.

Fixes

bitbake-diffsigs -t llvm-project-source-20.1.2 do_preconfigure
NOTE: Starting bitbake server...
ERROR: No sigdata files found matching llvm-project-source-20.1.2 do_preconfigure

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/lib/oe/sstatesig.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 1f976067631f80d637ba803f49813323d17e7c70..826549948e24571ef57acbe6bc5a2442d6c49f13 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -418,6 +418,9 @@ def find_siginfo(pn, taskname, taskhashlist, d):
     if pn.startswith("gcc-source"):
         # gcc-source shared workdir is a special case :(
         stamp = localdata.expand("${STAMPS_DIR}/work-shared/gcc-${PV}-${PR}")
+    elif pn.startswith("llvm-project-source"):
+        # llvm-project-source shared workdir is also a special case :*(
+        stamp = localdata.expand("${STAMPS_DIR}/work-shared/llvm-project-source-${PV}-${PR}")
 
     filespec = '%s.%s.sigdata.*' % (stamp, taskname)
     foundall = False

-- 
2.49.0


