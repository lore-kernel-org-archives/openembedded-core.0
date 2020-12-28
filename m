Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web12.2454.1609185884958993312
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Dec 2020 12:04:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rnQqCOpj;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id h16so10748817edt.7
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Dec 2020 12:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PPJA6Qu9gnNIclqbZXx2pqZNL2aQORGegEZRfYVarr8=;
        b=rnQqCOpjrvi1I0DguOsPY9UoguE7gAPjzgKBKEq6EU78y4+4PELGZuTKbSuRgeXJc1
         Wu7WhR129yMd3mw7l+5j3KsK6tumgU3WOn/JQkWUt0NtoCk8ehuZFfcSw9dTDxXTOJBl
         DA2r1dGKso/SdwAGEzaIFXTn/8r9BjokVuWqwhNm1knXxJpgK31i7q26bNuMDc0AEWYY
         5KlZ3Et1Wna6aJTor4Ox6pjhsNLz5PhSe+KGvjTm9IsRxuT2UF+N7HzWOE9o0ZPE25cq
         jAsAHmjRFb439TXbozD3Y8HK7tnzU/eahSWwP3FOp0V9RaH/5A5DkWSMavam54hEMAUj
         fO4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PPJA6Qu9gnNIclqbZXx2pqZNL2aQORGegEZRfYVarr8=;
        b=pW2XJ+UzkTG9BdBjwQVtXGJYPuL3e54xC7zPUIQtRpi25rhAqGS1Fw3VzuRHkujl9p
         /stI5ib62AYormntWSqG7XmjlwdDndlcxGihk06NZ7+EjFgK3QRyELBT+SjPkub3tUAN
         kmhmGE28akPlKtAEa7mNNiztWHZ97ynZiKpoRuDe+eYLUaLjR9LuQ9spgNv1R529wA3j
         C2UPNXpRp8wEnJtSKBf1BcZQXgIrI4K+DYzgXXkYiSzRdVV8chaYO/xXA9GWIgDtmUTT
         R82QORgWmBC8r1mgjVL4wBeCxxZSclKuvzsPdQkfNEqyQAb4jY3nTMcf7Wk5mfbNgkxW
         oHpw==
X-Gm-Message-State: AOAM530VQRKs1TWcSn4Da7WwJuccfrwkzXEUv/IN87Dt8tgwi1gtDyDD
	vFWuJL5xi8xv8y/yi1f0Q5dx6VcCewY=
X-Google-Smtp-Source: ABdhPJxfJHT1MeXYDCY+tV5n58iivQa2kc/T68xS3TYO0lV0Iqq682oZbpN+V4yfdahLbwzYelEKRQ==
X-Received: by 2002:a05:6402:229c:: with SMTP id cw28mr43514989edb.285.1609185883642;
        Mon, 28 Dec 2020 12:04:43 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id a10sm17447476ejk.92.2020.12.28.12.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Dec 2020 12:04:43 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 02/22] ovmf: upgrade 202008 -> 202011
Date: Mon, 28 Dec 2020 21:04:16 +0100
Message-Id: <20201228200436.78130-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201228200436.78130-1-alex.kanavin@gmail.com>
References: <20201228200436.78130-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index 04c4449ec2..d785ff6700 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -17,10 +17,10 @@ SRC_URI = "gitsm://github.com/tianocore/edk2.git;branch=master;protocol=https \
            file://0002-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch \
            file://0003-ovmf-enable-long-path-file.patch \
            file://0004-ovmf-Update-to-latest.patch \
-        "
+           "
 
-PV = "edk2-stable202008"
-SRCREV = "06dc822d045c2bb42e497487935485302486e151"
+PV = "edk2-stable202011"
+SRCREV = "872f953262d68a11da7bc2fb3ded16df234b8700"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>edk2-stable.*)"
 
 inherit deploy
-- 
2.29.2

