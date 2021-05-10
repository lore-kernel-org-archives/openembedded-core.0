Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web08.32547.1620657077167998129
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 07:31:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=IpauRHgM;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.49, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f49.google.com with SMTP id i23-20020a9d68d70000b02902dc19ed4c15so10593916oto.0
        for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 07:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=XxD9BpGnSk8eJvWK85PerkLSrYmmTvbBuBYj/7B2GT0=;
        b=IpauRHgMpU/JqjJXlSWg5Qs2Z56+PDNYH5LquzI4oYr+0jWdMIfdcbBG7tg4EgfYNN
         uaP9tsXnlcPwSFfVqZ/cR4uJLU2jiI8zuP5ekZiIxiJL4kIrKzNJdrcIiJh/kJRlJhbp
         2PWBYqPYarXNRbjYtzFxsXaJDJzATnTRVmbL+tf/GppuZfrB/3gI7R5yeRMdJNdhzH70
         /KsaS0B4h8cNNkcp9m6E+4dN578+K33p3SesSXHd16yqCYrYIe0bA843nDwuvjullmg6
         lp/Qym/Qqmx7PKI3J2DW+t5rvz2C4aF6APcvYRCA5uLrgja3xF9kSxUM+pOycqd/6NDn
         oxCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XxD9BpGnSk8eJvWK85PerkLSrYmmTvbBuBYj/7B2GT0=;
        b=Sp3fXLLgKtEiZopeIU6ZiRjXOyxwyE/k69igeBhNxuP3qa/AhQ7GS1BZLbm5vLGR4E
         JsxWqFQXqPKcPgMMn3XJFH8DhQkBKAH9EN0c5gUpi95ArpSMUGdg3YBYodY5UhKA0jJD
         49fKGtSpCWKelumAwJ4o1/1QvR/l9oWKATP/UZG7xlzzAuPxYHTB4OFO+wRxG6p9+PqE
         PbczeKNhQQegUnBkMuutHD5jbGMhV7vZiVhyzE/XTY3aLrfSIiaJslnf0cT+Ebmx6GGO
         vBT39UfaiU1tSHZn2gMH0wzL3wyAjiTrnO2AaaGg5ZgnHBBDpX9RIZkcOu8ScpDhArT4
         +cag==
X-Gm-Message-State: AOAM531aV1o0jyVCF8wT8jy0DNHz7UjL792FyDSF33f58vkuIqpaSouJ
	XafLRHGUq045I+n1iidmx523RGJsSvYyd0jp0es=
X-Google-Smtp-Source: ABdhPJwEtwl8/XHggFSi57Lclc9+dQg553me7vry2vubPEymmxvyxgVslBBfhTnr7pzCgqd8tLiYWw==
X-Received: by 2002:a05:6830:1510:: with SMTP id k16mr7980644otp.290.1620657076002;
        Mon, 10 May 2021 07:31:16 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id g16sm2661309oof.43.2021.05.10.07.31.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 07:31:15 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 18/25] sanity.bbclass: mention CONNECTIVITY_CHECK_URIS in network failure message
Date: Mon, 10 May 2021 04:29:00 -1000
Message-Id: <690e368ae06a461fb21b4eee1b78fb637279bbfe.1620656333.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620656333.git.steve@sakoman.com>
References: <cover.1620656333.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

This expands the error message when a network failure is detected.
It happens that some ISPs or networks block the default example.com
domain. Therefore, instead of disabling network access, it
lets the user know how to modify the test URL.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 62c94bb925543c1e1c5af3c751913d9f06d9597d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/sanity.bbclass | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 83bced2db3..2325ee2747 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -392,9 +392,12 @@ def check_connectivity(d):
             msg = data.getVar('CONNECTIVITY_CHECK_MSG') or ""
             if len(msg) == 0:
                 msg = "%s.\n" % err
-                msg += "    Please ensure your host's network is configured correctly,\n"
-                msg += "    or set BB_NO_NETWORK = \"1\" to disable network access if\n"
-                msg += "    all required sources are on local disk.\n"
+                msg += "    Please ensure your host's network is configured correctly.\n"
+                msg += "    If your ISP or network is blocking the above URL,\n"
+                msg += "    try with another domain name, for example by setting:\n"
+                msg += "    CONNECTIVITY_CHECK_URIS = \"https://www.yoctoproject.org/\""
+                msg += "    You could also set BB_NO_NETWORK = \"1\" to disable network\n"
+                msg += "    access if all required sources are on local disk.\n"
             retval = msg
 
     return retval
-- 
2.25.1

