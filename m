Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web12.253.1592347453519489779
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2020 15:44:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=et042j1m;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id j10so294898wrw.8
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2020 15:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p83DlxtNTkP6nMvxuOUAp5v99HImo3IO2ZtcMgQj948=;
        b=et042j1m0sMborlM6SKdE/SJtyjkZ94fUeXWxhUKYTcvdR9HDd09b/h8EZP5xy9iNg
         fcnYd1FXMg3qGvJNtcMN3sv3CeekPVRHEQUzB0jN+W6JUE6hswn+hA64iX4fno1NLwn9
         5Jy3HnzuqlrUqlC6FBDxorWrRQMztp5Zb4zOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p83DlxtNTkP6nMvxuOUAp5v99HImo3IO2ZtcMgQj948=;
        b=TslJ8UttWFfMD4TeX4eFzbz+meOErjJ4Lnqjrs5GDXiKLZq/jyntYOC23BDH5Nc3Rx
         gRq7cYS32zA1u1gT2U6UAdi8d9+pncUyXDtaNjGVqBBls01rkQWdIbZvsAYuUOHNAcxF
         7oi+O8+8Lc8zQcwbP+I3jzHN23zEm3uWztkJjqem1totTXiYmvqwZs6XFBDz67v1SqQj
         zr3nmS8ZCGP2VK2pEJei/ZGV2ZkSzb/Nn5HVjq7n4kA5fQ3kHw9EH2UTJNACyFnqlVnd
         wWNkDGNBGv+NxTpNIsdoVTs8IvM+0HUNF94EpiyZF9WJoxv22Nkkc54Glvhp6A0cTQm4
         h0bg==
X-Gm-Message-State: AOAM532j8OutiaUdJDnSOd9sSMVZJJVZYEqRlsstnAP7mBj8RpIazxTs
	MUqt5cUJnBK0SsbbGC1fojfs4w2ZfIW+fA==
X-Google-Smtp-Source: ABdhPJz9jDP6IuMmPEMEXhFc5ej06t1lSFQ9LwMkOvHI57/85TQxCWu13kIuldLrh22oF1hZHoknzA==
X-Received: by 2002:a5d:408e:: with SMTP id o14mr5060951wrp.84.1592347451696;
        Tue, 16 Jun 2020 15:44:11 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id c81sm5909920wmd.42.2020.06.16.15.44.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 15:44:11 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] sanity.conf: Require bitbake 1.47.0 as the minimum version
Date: Tue, 16 Jun 2020 23:44:09 +0100
Message-Id: <20200616224409.389270-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The recent siggen changes need the new version of bitbake, update the minimum
version to match (should also help the TERM environment change too).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/sanity.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/sanity.conf b/meta/conf/sanity.conf
index 8b2f6553949..8ae548941b5 100644
--- a/meta/conf/sanity.conf
+++ b/meta/conf/sanity.conf
@@ -3,7 +3,7 @@
 # See sanity.bbclass
 #
 # Expert users can confirm their sanity with "touch conf/sanity.conf"
-BB_MIN_VERSION = "1.43.2"
+BB_MIN_VERSION = "1.47.0"
 
 SANITY_ABIFILE = "${TMPDIR}/abi_version"
 
-- 
2.25.1

