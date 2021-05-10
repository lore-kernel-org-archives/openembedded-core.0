Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web12.32687.1620657027297676505
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 07:30:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=vDXyKXLc;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.53, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f53.google.com with SMTP id 36-20020a9d0ba70000b02902e0a0a8fe36so8265502oth.8
        for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 07:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Heap1NqYZ7uSPbuYBugPC7Deo3TxEpofa64bnQfSjHE=;
        b=vDXyKXLcApcX7Zh0lgQRVp4kfNbYXeiM/rps04ye7Uo7rQSOeTyLCVDW8yQLkQWrM1
         0z4MvkTRAKKfaUR2UeMkUsTRQTEk9VKjLzY5U6oBgxTyEA21gOx6eWZtfVaTGnzokHBt
         HvCgPVyfcgpnwDmC5zciDYUmeukh5ytX9Z3oH2GjNPv1VShzI7AjmUXwuMMIHjj11UFf
         BxC2h2Eb7A8o6B/5uUp1xoyfc0fcweY/qyIZSQwfgXMG+KVK+p9VvqDW89oKTQkE49Q/
         O1Fsv9jgxYJhl9vfGtd4aoF+6pG7i5l7kt6SxF8dp+5xl1Jy/tdVFDveqeO46/Gro7lT
         nZEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Heap1NqYZ7uSPbuYBugPC7Deo3TxEpofa64bnQfSjHE=;
        b=pBY2yJ/LZ9DEhYGH0niDmrolI4JwQ4EzRkDK+NNACjnSCn7qhGYbHVEhUvyV8u1gTR
         /oUrZzx0eDMyQGzv+M4KGeJaoPGaQLXCzMi+Z8+RX7hBtI90rOvoniUZqPOk1oH8OhgB
         L0TT9ZVPfBt0HrZTh+elkkxpo9EduGnat1dkJ+hPczQOLrzW89PtENkLokZ2WlgusLTw
         t/jOp9257ZtlUnA0hhuULmBGUza9JdhqG2w9LK9OZaPnLUX40ebtDbIdIls3ykTHcDS8
         JFyMNFdh3siMA2aGYvbiR0OSplrGdDeb1JRwZjM3FcScXwZOJ/r7YRb2m/8sP6rMObev
         wrUg==
X-Gm-Message-State: AOAM532VO9w/yX+JqV2ZNFwFzil9PqY/ezeAgZwDh0cJLh2HVFFjCcR0
	hy4OtPrqdRzOzx5/RM6D4IPD/pexbv2T/SBMJAQ=
X-Google-Smtp-Source: ABdhPJz/LTKWLk1SfbocpgU5e9HZWMGkdzl+8CjGD4NWtvm/Jq4hypHHhO5ZBhm5ryVFA2aJdDG68w==
X-Received: by 2002:a05:6830:1e6e:: with SMTP id m14mr21369328otr.215.1620657026221;
        Mon, 10 May 2021 07:30:26 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id g16sm2661309oof.43.2021.05.10.07.30.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 07:30:25 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/25] kernel.bbclass: Remove do_install[prefunc] no longer needed
Date: Mon, 10 May 2021 04:28:50 -1000
Message-Id: <d2fe8c5861283ff4a4bd18239a61eb6745b7f696.1620656333.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620656333.git.steve@sakoman.com>
References: <cover.1620656333.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mark Hatle <mark.hatle@kernel.crashing.org>

Prior work has refactored the do_install task multiple times, and any
references to PKGV and PKGR (even indirect ones) have been removed.

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 36fe4db8ae827a93abe9fce6740459d215411965)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 22b1224d79..518aaef724 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -405,7 +405,6 @@ kernel_do_install() {
 	install -d ${D}${sysconfdir}/modules-load.d
 	install -d ${D}${sysconfdir}/modprobe.d
 }
-do_install[prefuncs] += "package_get_auto_pr"
 
 # Must be ran no earlier than after do_kernel_checkout or else Makefile won't be in ${S}/Makefile
 do_kernel_version_sanity_check() {
-- 
2.25.1

