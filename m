Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54909FA3743
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 02:37:16 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web09.2165.1666838230037470494
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Oct 2022 19:37:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=UmeLIHj5;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d10so103979pfh.6
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Oct 2022 19:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VkKMUS6dTBudOCrrUh2k+7x/KQceSR63H1yxL4PNhl4=;
        b=UmeLIHj5kDM52IFkPIhOH1GBC7jBUORlT9hB+BQVmRuXUFYnEXi9Vh9DF3DI6MRmya
         HDoxHPcsvJj3jXK3A7uAZby1YYWE5bxoMT4lH9xTF+JdBpe2xCuKoY4Fj62Nw627NqeJ
         DSfQkqsuhX/4UQXJU6qanwPFadsRiV3G4wk00BNXu0MAHd8FEUbm7ti6hadw4Mqt3ySx
         QQ7unX9/XMb5MabHcpm5puqq8WbfsuLld/CEiF+kVqLO5GuqM9KKE7UBmff97QSFfvO7
         SHASN/+oXYajbfrBnYnhm81OVgzhW3fICeGnGVeA62qsYW6HdAKLcBjIHLk2bvc7LE5J
         B2nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VkKMUS6dTBudOCrrUh2k+7x/KQceSR63H1yxL4PNhl4=;
        b=N1xKBhdZjC6BWJ9Isk7a5t7XreJQRf8/lYj8LW7Tn05i2IvXnczcbOEdzK7Q8t0ZxN
         a/JewJJeCz+oNWxoQg8zivArVHVwPTrMq7QQgeAQRT9GDrCFpbWBsS+IO3pj6qysB+kW
         SE4FVtD2AYq/ApCZpxCg34iS1f59DxUk7Zt7Xej04WJSI5OwPEJuzofnugqF2ze2x83r
         EhcXXKRqZtzR3wNDBbd9OavSdJZbEGf7PSEHjzj+QiIpHQO9EOZIzoWzgAHz7FZm3kPJ
         8bjp55+N2fWK0KV8feW4vKIgICFt9MrvKRtNk7ORsHsKbA9ghdW0fBUk1o1bYztctwlm
         slNQ==
X-Gm-Message-State: ACrzQf0GPPhm9v/RrK434vlJb3bF5gLsZGrjXo70Yj+6G0sONptJiX28
	Z4ARyoFCzjkVwCodC0NgMuYWZ5DuKlfbYjHL
X-Google-Smtp-Source: AMsMyM43eRvBPWzwD8MRVtrKWF3Dht6DgQIbc5CLpMLAwOPC6MC78pBTpWNjTvY+ET1eNOtmUM2LTQ==
X-Received: by 2002:a05:6a00:230f:b0:53e:2c2c:5c03 with SMTP id h15-20020a056a00230f00b0053e2c2c5c03mr46977854pfh.11.1666838230791;
        Wed, 26 Oct 2022 19:37:10 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id b1-20020a62cf01000000b0056246403534sm81088pfg.88.2022.10.26.19.37.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 19:37:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 5/8] git: upgrade 2.35.4 -> 2.35.5
Date: Wed, 26 Oct 2022 16:36:38 -1000
Message-Id: <43badfadb92a1d6684801f81fa2ed9c8b5652bb6.1666825041.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1666825041.git.steve@sakoman.com>
References: <cover.1666825041.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 02:37:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172184

From: Tim Orling <ticotimo@gmail.com>

This release addresses the security issues CVE-2022-39253 and
CVE-2022-39260.

 * CVE-2022-39253:
   When relying on the `--local` clone optimization, Git dereferences
   symbolic links in the source repository before creating hardlinks
   (or copies) of the dereferenced link in the destination repository.
   This can lead to surprising behavior where arbitrary files are
   present in a repository's `$GIT_DIR` when cloning from a malicious
   repository.

   Git will no longer dereference symbolic links via the `--local`
   clone mechanism, and will instead refuse to clone repositories that
   have symbolic links present in the `$GIT_DIR/objects` directory.

   Additionally, the value of `protocol.file.allow` is changed to be
   "user" by default.

 * CVE-2022-39260:
   An overly-long command string given to `git shell` can result in
   overflow in `split_cmdline()`, leading to arbitrary heap writes and
   remote code execution when `git shell` is exposed and the directory
   `$HOME/git-shell-commands` exists.

   `git shell` is taught to refuse interactive commands that are
   longer than 4MiB in size. `split_cmdline()` is hardened to reject
   inputs larger than 2GiB.

Credit for finding CVE-2022-39253 goes to Cory Snider of Mirantis. The
fix was authored by Taylor Blau, with help from Johannes Schindelin.

Credit for finding CVE-2022-39260 goes to Kevin Backhouse of GitHub.
The fix was authored by Kevin Backhouse, Jeff King, and Taylor Blau.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/git/{git_2.35.4.bb => git_2.35.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/git/{git_2.35.4.bb => git_2.35.5.bb} (98%)

diff --git a/meta/recipes-devtools/git/git_2.35.4.bb b/meta/recipes-devtools/git/git_2.35.5.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.35.4.bb
rename to meta/recipes-devtools/git/git_2.35.5.bb
index 18f39875db..be4e3ca1d3 100644
--- a/meta/recipes-devtools/git/git_2.35.4.bb
+++ b/meta/recipes-devtools/git/git_2.35.5.bb
@@ -165,4 +165,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "4970108bdc227e2c3687899f8fc7501c54c839dcc42f4d999ac9e3e3f52df583"
+SRC_URI[tarball.sha256sum] = "2cca63fe7bebb5b4bf8efea7b46b12bb89c16ff9711b6b6d845928501d00d0a3"
-- 
2.25.1


