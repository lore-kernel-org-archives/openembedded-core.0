Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3FEEC38A2D
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 19:02:04 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web12.135.1666638117307968854
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Oct 2022 12:01:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=I/zU3RDx;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id s196so9451104pgs.3
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 12:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tdm6yFQkURZTopyyxLkTjfPGOuDJhYp938Ej6YJ/XZ4=;
        b=I/zU3RDxdXFcjT8wgbLi3CFur9qFkPEckLX2bLd1OaaasvA0K4XcSjiWzhaU1/lwQa
         2tBwS28wSt4x5Lhldjb9OaztRAlEqpWAfiYy86uJTFogiLqd8xn48xO5BeAGaxuz6zvs
         lNstV/og4kwwofa5HKU723QTCsfJAg3hL0dXnBIAPrtLscjr4MVhwQGSBtBQgL3VlQah
         7HH96mIHBTtkxBoNMar+IkBNklVYYqi7KOepGknkFyWnhG+j0uCuxIAvJ78S/j1j5jK0
         s23EBQRFMFS2Ts6mYgr2rzX7KiREne1xZnvtvNA3y0YazwgKlQpB7ebpPpGYpnEY3uqz
         k/cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tdm6yFQkURZTopyyxLkTjfPGOuDJhYp938Ej6YJ/XZ4=;
        b=pXYzGKwZqr9lKW3pSepYwrNdNPUy9xwOkZz3NCIlKm3memtNe5iSPOPJ+zCZhY9Uvl
         v5Os71uRaNj4WmWWECneknpI/W2ec88ZLO4TqZhb7DTebbhe/FYJ3r0PGUQ4jQ404eI6
         tDJ1f37g20eJd+/7zMHZW6fbPgDwTIRv55S0bxsYAPlTG2x598m5HIl/2sClZPo2xDXc
         4IiXMIAAfPUJXzR8FyG1dpyzWpIf3kWw8RgPgh5COXufEFl0Q+5WuEpPTLHX9RBzHQMt
         iSicQGmsQn7TkGDX111fG+SWo3uEP3xBIKCSzf/FDYdHNcpyVfIuxL2SR3hHJNXbIWng
         pJDg==
X-Gm-Message-State: ACrzQf09gVki86XCzJ7lYk26f2/Ykx5JbEqoPzIXqPQo721lUftShHtR
	MvWAyyh+i7dA1UCJu+QcR3F5ojXSDkvhVw==
X-Google-Smtp-Source: AMsMyM42xIibqKrg15bh1gtZ9AZlkCPNxNnLTbke73OSyLFMzapUIVtrn/Oznups/QEYL42id1kxJg==
X-Received: by 2002:a62:ee17:0:b0:55b:b0d:bc9f with SMTP id e23-20020a62ee17000000b0055b0b0dbc9fmr34769841pfi.39.1666638116046;
        Mon, 24 Oct 2022 12:01:56 -0700 (PDT)
Received: from nereus.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:94d6:2e34:1254:77d8])
        by smtp.gmail.com with ESMTPSA id y5-20020a17090a134500b002005fcd2cb4sm4338485pjf.2.2022.10.24.12.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 12:01:55 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [kirkstone][PATCH] git: upgrade 2.35.4 -> 2.35.5
Date: Mon, 24 Oct 2022 12:01:42 -0700
Message-Id: <20221024190142.1143018-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 19:02:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172114

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
---
 meta/recipes-devtools/git/{git_2.35.4.bb => git_2.35.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/git/{git_2.35.4.bb => git_2.35.5.bb} (98%)

diff --git a/meta/recipes-devtools/git/git_2.35.4.bb b/meta/recipes-devtools/git/git_2.35.5.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.35.4.bb
rename to meta/recipes-devtools/git/git_2.35.5.bb
index 18f39875dbf..be4e3ca1d3b 100644
--- a/meta/recipes-devtools/git/git_2.35.4.bb
+++ b/meta/recipes-devtools/git/git_2.35.5.bb
@@ -165,4 +165,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "4970108bdc227e2c3687899f8fc7501c54c839dcc42f4d999ac9e3e3f52df583"
+SRC_URI[tarball.sha256sum] = "2cca63fe7bebb5b4bf8efea7b46b12bb89c16ff9711b6b6d845928501d00d0a3"
-- 
2.30.2


