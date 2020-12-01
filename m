Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.490.1606848763166310993
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Dec 2020 10:52:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=G8NrhSsn;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id s21so1684778pfu.13
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Dec 2020 10:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=JpLzRkPMT/GVOZsROAMjZIEtdrbRm1BK1rVbWFlhb4U=;
        b=G8NrhSsnbG1+SKGKVNl8+i+vmn7soK6FVbJVw9pbyT4SG3b32KIwislItKRwp/XZvl
         NhY+LPN3rMZdrekUlUZqiS48QYMjdVJ196exd63Ln3e7GmU7/AS8CwouPCH7Fktt9mJn
         XLftKjMUjqd+TE/lYZohHr2f9RqY7kUXq9IBfIj+JpoXyMgjOuEPZXVlg49CIQ4AcXxu
         J8RudjV9frA3ivar4QPwAuJQQF7lkqV61YPyDujWn1+E2YxdrMbsI+2I8buK8pOaGrEg
         nCNo1muktYyz0aR6YT7OG9xVrLvPUsBrMee/aDqfdKkU1KzKbLUpvpR39TNoNn/UjiyA
         gpJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=JpLzRkPMT/GVOZsROAMjZIEtdrbRm1BK1rVbWFlhb4U=;
        b=E56xYP1/LXrtHWjpGoF/4jNnuaRktg1p9+jcHthEyk3dzVbDs/LsglHN538eldemoj
         jJkEHfXJz8LEsj4/33XRbZPNnFZ1uEX8tc9hFI3jlzN+Tp52R7mihrBJPc8r9dtjoBMq
         JOJqrdl8XmMIpAIsbX8/qrFJfX2jketsj6V3kT8vdYMseddcJwEmQAC7Z6dhzdi95N6D
         QReIePErotkFT3PZVyMeijdtXmBPpTX6sgRVleikdGWeUJk3TbSI/EdCvbtY2LgGvRxp
         VkMJofRGk1uyHK2AFA2+76Q5htCqqSCUJRF1L1WfcIRAsprZA+7jZle+3EM4/bkEva/9
         hE1Q==
X-Gm-Message-State: AOAM532VelLkXXSlUiBEsu8mnkBTefF1AyGN8qfoVIz7VzNvi41VOZIf
	WF5pGwYVhKc4q1hA59ij3RXy9i68XFMEDMr5
X-Google-Smtp-Source: ABdhPJxjLl4leEv6hHh4+iToXXYkm/Y+9aytFS9lbuS6zd5lnsWoMLpmbuhGpBikCaC8KSmg//eZsw==
X-Received: by 2002:a65:6205:: with SMTP id d5mr3501452pgv.76.1606848762179;
        Tue, 01 Dec 2020 10:52:42 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q5sm460168pjg.4.2020.12.01.10.52.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 10:52:41 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/16] sqlite3: add CVE-2015-3717 to whitelist
Date: Tue,  1 Dec 2020 08:51:52 -1000
Message-Id: <c5bfb3e4680fb69b7ce793c57082354c12ce3f13.1606848593.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1606848593.git.steve@sakoman.com>
References: <cover.1606848593.git.steve@sakoman.com>

As per https://groups.google.com/g/sqlite-dev/c/U7OjAbZO6LA this issue
is believed to be either iOS specific, or fixed in 3.8.9.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 (cherry-picked from d11a2157befcfe40517140988dd26bf0ed7240b6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/sqlite/sqlite3_3.31.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.31.1.bb b/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
index c289affd60..877e80f5a3 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
@@ -19,3 +19,5 @@ SRC_URI[sha256sum] = "62284efebc05a76f909c580ffa5c008a7d22a1287285d68b7825a2b6b5
 
 # -19242 is only an issue in specific development branch commits
 CVE_CHECK_WHITELIST += "CVE-2019-19242"
+# This is believed to be iOS specific (https://groups.google.com/g/sqlite-dev/c/U7OjAbZO6LA)
+CVE_CHECK_WHITELIST += "CVE-2015-3717"
-- 
2.17.1

