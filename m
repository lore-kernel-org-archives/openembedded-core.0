Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B7F8C54EED
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 02:22:46 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.34106.1674440559291618772
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Jan 2023 18:22:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=SvnuN3xf;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id e10so7946598pgc.9
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Jan 2023 18:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CEmjcCRNAwtCoNllquncIj/wZvxOQk+U1Si9Lhq4v7o=;
        b=SvnuN3xfdEzUIS3Vz+z4ch+BMkZtj9r0fzrbXqVfnnclVbnZIpAg0osBNH4DtMhI3n
         VLAhB2mmWvUAxZSeICBdsSn5/4Sz3YRUdhjveZfv2+Tzcu3IEGCQ+6lyvogthh//UrM5
         Gz9Id+9n0ESQwjXVnQjgu08Ib+4N/Loeh7fEcA+19aacwfFk+cfbO9qk+AUYHkj/mtgp
         BEzuI7irBodY5d98593HfU4AM6pvz5fZ8fGA01uXIDWSLRX8IA3VrLfGRRMOsuYtAqNX
         ZP4sorCwAbXQ3bliH1aZSg5Gf0Qp0GnUQ0fLnVhCdlFTD1Yqwj3m7TBmIugNAECrhw1G
         uqow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CEmjcCRNAwtCoNllquncIj/wZvxOQk+U1Si9Lhq4v7o=;
        b=PODGhlGx7L5CeUusGDnyUGWUrBf7G7XjUkIL6kIIqCq7NLQvxOOWozyAO0UiAyDOmp
         wVt85GtVGT6FIpTn3aUdyjajfAgQI+s3Qgrps2Aw3w5sdtOxsVuoZt5bj3+zWmVNn/D8
         eXxLNibf9PNqfdBlWtbm4LQWkoQ5pJOL9t1hXYQZwgO66jgWxZBmZ9qRSKKAlQos6uYC
         lfPwc7MNFYvZWuBFsV4bqkjt6FBAGZTp1TCs3N6ulPGsaCyG8YlPenMh39qAYVrc6jcz
         VW2nvxfMrMX8V4hZ+ba944bjuCGCVwVW2CF7YpJxMQUVOfkYeM+UqsWu1rVbZapZef0N
         uzTg==
X-Gm-Message-State: AFqh2krANCkuTjvamOUwFgsuCWCiJJhpn0h1/T0dV0mPb1j4Q82789Db
	+XUTxR5SL214ozVvzHdXFz+jfZr4yPhy19jHN8M=
X-Google-Smtp-Source: AMrXdXsVckN5mnxp3YjDtVasZISbSWXQSup3Hg/jIzDUaK62xLoHZBG8yHn4XspNVXUF9I2yylkhig==
X-Received: by 2002:a05:6a00:181f:b0:58b:d244:b525 with SMTP id y31-20020a056a00181f00b0058bd244b525mr35143735pfa.17.1674440558376;
        Sun, 22 Jan 2023 18:22:38 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id h11-20020a056a00000b00b0058dd9c46a8csm10384222pfk.64.2023.01.22.18.22.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 18:22:37 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 28/32] libseccomp: fix typo in DESCRIPTION
Date: Sun, 22 Jan 2023 16:21:22 -1000
Message-Id: <44f59f5d8414cbe935addb57bd1ea9ffaf734fba.1674440376.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674440376.git.steve@sakoman.com>
References: <cover.1674440376.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 02:22:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176292

From: Chen Qi <Qi.Chen@windriver.com>

Fix typo in DESCRIPTION: and -> an.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 349e63045298054f9454025d793c67284fce750b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/libseccomp/libseccomp_2.5.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb b/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb
index 4c0fb1d7b3..1f43686ade 100644
--- a/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb
+++ b/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb
@@ -1,5 +1,5 @@
 SUMMARY = "interface to seccomp filtering mechanism"
-DESCRIPTION = "The libseccomp library provides and easy to use, platform independent,interface to the Linux Kernel's syscall filtering mechanism: seccomp."
+DESCRIPTION = "The libseccomp library provides an easy to use, platform independent, interface to the Linux Kernel's syscall filtering mechanism: seccomp."
 HOMEPAGE = "https://github.com/seccomp/libseccomp"
 SECTION = "security"
 LICENSE = "LGPL-2.1-only"
-- 
2.25.1


