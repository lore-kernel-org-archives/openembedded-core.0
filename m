Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2D0BC38A2D
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 17:07:58 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web08.771.1666631269621915007
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Oct 2022 10:07:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HgnvNsct;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id f9so4783174pgj.2
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 10:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c+7JjrUlVF3xxrq0KbNoLpmeREiHarTNr/FV2dZsOoM=;
        b=HgnvNsctjO2Boqb1o6c/emtbvuxR5ZdhC6ShRpV8pb8aESjXPi2v9vSA9KkSFEyaLc
         VPbCKvteY5EHT4WtK+A0Yt8CPcEJVijkEs7tJ2lJI9wvqH/cEwXmk6Luyj6wjxV2W7MA
         ZdkDgsGoCC8lzvGMrNrg8yrHZXc2BEh0XYcXd3kEZR8KBG0BF8n1FpflMQ/gKvyaSVkJ
         pcZzPDHnPUQRcTtsGnEfKZgg0vzqAHYNcH+QzqavPJ8vI8fd3Pht8ib4D/+MPWAhYb2F
         Ke/NKBaEj6obfxx+GwaJH2pw+nuDNrE/EvveNAE3mVIA0R3BUJdmZ0XdxI3r1FpMFSWn
         iiYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c+7JjrUlVF3xxrq0KbNoLpmeREiHarTNr/FV2dZsOoM=;
        b=FDpMWMt/DPYZL1Qg0bnm527JYxlTt21zEYR7asoDklrDLe5fo28Pz7VeYXM4bYTxCU
         gyNzFWcawcO4zcEul4OyjUAsS3suLFzwFizY/SKSxzIJjlf9XqVoueDowEzRvJed+ayY
         e3vt8iNolX/CUKeutWpgs/tRiXqDLeNOUTVk6DYHnONOkVaOBf6s/9Pb86UpdEz+u+Qe
         blmUA2D896uZwP/Qv+RLpGdF4OIhZX24TAx1fUkqk/APitZiCWXOkyqfuvcnkd+L3HfZ
         gCzKdNh2P7gOSFkay6dA0VRVTeG7oZH2jB6HF/dV/oYjIx7WUOTXJJHkFl5kol57FXZC
         8/Gg==
X-Gm-Message-State: ACrzQf24ku0GgwwvXwZe9CLqLeYvcE0aPHHbE2g+y0NDE+0lczZW8510
	+otT77wWPFa3c2Ww+wNetqcTIuAGK3P96A==
X-Google-Smtp-Source: AMsMyM5eHXMEgRWjywGN7FIaU1lPQrfgJtAMwg9d30runzgSagH5ynE597ojHE2dUUUubVUMKgS9eQ==
X-Received: by 2002:a63:9144:0:b0:45f:c9f5:1bb with SMTP id l65-20020a639144000000b0045fc9f501bbmr28112370pge.165.1666631268357;
        Mon, 24 Oct 2022 10:07:48 -0700 (PDT)
Received: from nereus.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:94d6:2e34:1254:77d8])
        by smtp.gmail.com with ESMTPSA id d17-20020a170902ced100b00186ae540083sm7861plg.91.2022.10.24.10.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 10:07:47 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] git: upgrade 2.37.3 -> 2.38.1
Date: Mon, 24 Oct 2022 10:07:20 -0700
Message-Id: <20221024170719.2656644-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 17:07:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172112

Fixes CVE-2022-39260

Git v2.38.1 Release Notes
=========================

This release merges the security fix that appears in v2.30.6; see
the release notes for that version for details.

Excerpt from 2.30.6 release notes:

 * CVE-2022-39260:
   An overly-long command string given to `git shell` can result in
   overflow in `split_cmdline()`, leading to arbitrary heap writes and
   remote code execution when `git shell` is exposed and the directory
   `$HOME/git-shell-commands` exists.

   `git shell` is taught to refuse interactive commands that are
   longer than 4MiB in size. `split_cmdline()` is hardened to reject
   inputs larger than 2GiB.

Credit for finding CVE-2022-39260 goes to Kevin Backhouse of GitHub.
The fix was authored by Kevin Backhouse, Jeff King, and Taylor Blau.

For 2.38.0 changes, see:
https://github.com/git/git/blob/master/Documentation/RelNotes/2.38.0.txt

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/git/{git_2.37.3.bb => git_2.38.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/git/{git_2.37.3.bb => git_2.38.1.bb} (98%)

diff --git a/meta/recipes-devtools/git/git_2.37.3.bb b/meta/recipes-devtools/git/git_2.38.1.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.37.3.bb
rename to meta/recipes-devtools/git/git_2.38.1.bb
index 2eed85e807f..033e36ae16f 100644
--- a/meta/recipes-devtools/git/git_2.37.3.bb
+++ b/meta/recipes-devtools/git/git_2.38.1.bb
@@ -165,4 +165,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "181f65587155ea48c682f63135678ec53055adf1532428752912d356e46b64a8"
+SRC_URI[tarball.sha256sum] = "620ed3df572a34e782a2be4c7d958d443469b2665eac4ae33f27da554d88b270"
-- 
2.30.2


