Return-Path: <nikhilar2410@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 045E0C25B5C
	for <webhook@archiver.kernel.org>; Mon,  6 May 2024 11:09:04 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.17997.1714993734358763228
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 May 2024 04:08:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C3vzVCfl;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: nikhilar2410@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ab1ddfded1so1635770a91.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 May 2024 04:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714993733; x=1715598533; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iCApSTzBdCs/oap4XpmZJHYKMb2TuLSxrJSX5qv054c=;
        b=C3vzVCfl8J/HgerWwI8OheJ6fLN+ROu/eXE8EF8qnHd9MA67XHXazyy7hs9+wz7+GR
         FP0OrtlMVYISSF4Dq/1pDiGH4R52KmiJHMbzY66ihbbXkl2r4ATlbPi4n7H0qKFibhKq
         OUD1uKIn74Nej6k02c2qQVF6kuFORKaWWuwCeOSwfi41vFMPuWR9I6PxiqPw7ZrJghuU
         E367np0PS4N5Dx99e4M7YETT/hzrpvH9oBC63erFgIOXc/6RpacpmFQijKhZp+YWT4wH
         4jSBb3cIgikAiXgbxFKjRcr9n73Jun1jtZLYGDHXerlj939ADh1I0rxZj5E4wcLKfMKg
         iLCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714993733; x=1715598533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iCApSTzBdCs/oap4XpmZJHYKMb2TuLSxrJSX5qv054c=;
        b=oqECUvsh1uKiyf6AqmI92ggUzGAveuPLjlnkyy+kVXRxLKW0bh10XH73lI6t5R/iAm
         TyzpVDM5PbPzQGRLWYEvxMw0IzPtCkpgOWsDJYffoVj6W1Qu6ctT+xmKzR2AtAQCaJ8y
         6d2LdKt5Md8ckZIJe7ZO8fGR0duFxbQEtla0BobaEBOke2CWwqYWnpCRkFuTioDIqpLH
         +Dz6Dm3jJQ5NXX+uzddNsm5/HuyEPKaXT+27gFrXNhnFGKE0epNbN6jEu/uHXwcwjp5w
         9/4YPpHcGiDHY/VXyHWUf530c87lVqkuObLBTXX+iGbKN9jWZ2B5aoaRwZHFBFqPb4nt
         B1jg==
X-Gm-Message-State: AOJu0YyBat3UzKL9qnOn6Ah8FtMOhc6GWtv4fWJ+iENVv/X0W1EhPdO2
	J0jGIzh7Nwa6WbDgSCQkfeQnFRM9APPpBFs0aH6c1jCkYpfq6s7bcfxrwJY/0g==
X-Google-Smtp-Source: AGHT+IE68BFW647Q9QVJdOPErnH4gtAvko5X9D5J8ZbMVrkAXzpM0JqQBERi/rAK5a6+us/mzXEjDw==
X-Received: by 2002:a17:90b:23c6:b0:2b2:7986:229b with SMTP id md6-20020a17090b23c600b002b27986229bmr8468946pjb.37.1714993732606;
        Mon, 06 May 2024 04:08:52 -0700 (PDT)
Received: from L-17494.kpit.com ([103.189.135.144])
        by smtp.gmail.com with ESMTPSA id nw10-20020a17090b254a00b002b0e8d4c426sm9842702pjb.11.2024.05.06.04.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 04:08:52 -0700 (PDT)
From: Nikhil R <nikhilar2410@gmail.com>
X-Google-Original-From: Nikhil R <nikhil.r@kpit.com>
To: openembedded-core@lists.openembedded.org,
	bhabu.bindu@kpit.com
Cc: Nikhil R <nikhil.r@kpit.com>,
	Bhabu Bindu <bindudaniel1996@gmail.com>
Subject: [OE-core][kirkstone][PATCH] xz: Update LICENSE variable for xz packages
Date: Mon,  6 May 2024 16:38:46 +0530
Message-Id: <20240506110846.125652-1-nikhil.r@kpit.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 May 2024 11:09:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199040

Update LICENSE defined for xz packages to match the license
information provided in the xz COPYING file.

The License information from PACKAGERS file of xz mentions
packages with lzma files are in public domain.They ask to
use GPLv2+, if only it's not possible to mention "PD and GPLv2+".

Include PD license with GPLv2 to packages with lzma content:
xz-dev package contains lzma header
xz-doc package contains lzma man pages
xz packages contains lzma binaries

Links: https://github.com/tukaani-project/xz/blob/v5.2.6/COPYING
       https://github.com/tukaani-project/xz/blob/v5.4.1/PACKAGERS

Signed-off-by: Bhabu Bindu <bindudaniel1996@gmail.com>
---
 meta/recipes-extended/xz/xz_5.2.6.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/xz/xz_5.2.6.bb b/meta/recipes-extended/xz/xz_5.2.6.bb
index 3482622471..33496748bc 100644
--- a/meta/recipes-extended/xz/xz_5.2.6.bb
+++ b/meta/recipes-extended/xz/xz_5.2.6.bb
@@ -9,10 +9,10 @@ SECTION = "base"
 # libgnu, which appears to be used for DOS builds. So we're left with
 # GPL-2.0-or-later and PD.
 LICENSE = "GPL-2.0-or-later & GPL-3.0-with-autoconf-exception & LGPL-2.1-or-later & PD"
-LICENSE:${PN} = "GPL-2.0-or-later"
-LICENSE:${PN}-dev = "GPL-2.0-or-later"
+LICENSE:${PN} = "PD & GPL-2.0-or-later"
+LICENSE:${PN}-dev = "PD & GPL-2.0-or-later"
 LICENSE:${PN}-staticdev = "GPL-2.0-or-later"
-LICENSE:${PN}-doc = "GPL-2.0-or-later"
+LICENSE:${PN}-doc = "PD & GPL-2.0-or-later"
 LICENSE:${PN}-dbg = "GPL-2.0-or-later"
 LICENSE:${PN}-locale = "GPL-2.0-or-later"
 LICENSE:liblzma = "PD"
-- 
2.25.1


