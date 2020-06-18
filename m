Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web10.10540.1592494910574867359
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2020 08:41:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=qi/NruCw;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.48, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f48.google.com with SMTP id m2so4845012otr.12
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2020 08:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=z2nFWq1b/rXN+QYy7ysqo5Qmf4SMFSjDP9Z3nweGylg=;
        b=qi/NruCwKvPBI38A5SLKtKwmbSVzYT2FB9EwMS9eszAxgISHLVR4M+/Y4FRiJuycEI
         WQCC1TlynMdarzznrZ4sF74xsUM/K9LOSukfMmQtfADkSUrt5LkHPbRUEIulMJSmJTpM
         w/Gt+ckUCwxoxWGdwMsUUB6iq3dcT9yDYZdV+5WG5RSKEjtUNliy6LEPtQifVqSrUAyb
         POvr0JMQe17yFgLEJHLCjfJ3bfoXqVToyLqcKi7PDXGm5tGznvlIAdomyTS2GqeQM/+F
         IJFI0Q5yHeWQ8bw5SzH1mL2XfO6OI90Nbgdusuy6G3oitr1NkKPPWO3zuM4HbDCX063V
         6dUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=z2nFWq1b/rXN+QYy7ysqo5Qmf4SMFSjDP9Z3nweGylg=;
        b=CR6QqudMOWWYIHP7iECEBt10HwEehQe5g5cvidThIyreOJU2r+vmU6IMCQ/aQxJsOf
         ebd6fh3u6Si9FoJOaXmVnRjfFE4WwydrF7CjTZ3EjPRa1TLT/iZyP0gYN1ZM/W+JVXib
         J9YrUp2T+hmHXkuC99xr5jsQhFiecxcy6w6ty7bE+7jGSSlNTYyYb/tAMamjhOzbM1Sm
         /4PBNSFnOkFrsJLSNTgZNXJErMQrFD1SxFNmlMcQkCw/877iv7ZzbdwQqD7EYvEgk6ez
         YmsvVVeiCASz0cStC8gft/Pq+TZT8YCE8VzeOloeuQVNzD++KuhVpwxX7Iwaxl1/nvbY
         DcNA==
X-Gm-Message-State: AOAM530SDFDfNn1JOjM1VwhFwp2NiqEvEjob7PtnPHn0YGGTqU34PiNH
	2MMpaKtb4dMLktiLeq7iW1sWnnjG0r88yQ==
X-Google-Smtp-Source: ABdhPJxsWYSd+/CqYe8v7bYUFs2fW/4uO0SFCeCp/CejsBkvhUj08FejlLg4s/oXl5I8j4N1wscnWg==
X-Received: by 2002:a9d:f43:: with SMTP id 61mr3846260ott.57.1592494909459;
        Thu, 18 Jun 2020 08:41:49 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id r7sm768843oor.9.2020.06.18.08.41.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 08:41:48 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/21] dtc: update to 1.6.0
Date: Thu, 18 Jun 2020 05:40:34 -1000
Message-Id: <8dd95a6b937508079ae9ae4800dc7c8fe675376b.1592492076.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592492076.git.steve@sakoman.com>
References: <cover.1592492076.git.steve@sakoman.com>

From: Richard Leitner <richard.leitner@skidata.com>

This also fixes issues with gcc 10's default change to "-fno-common".

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3acc1e5d5bce4e229801c9d66391e007390fb373)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/dtc/{dtc_1.5.1.bb => dtc_1.6.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/dtc/{dtc_1.5.1.bb => dtc_1.6.0.bb} (81%)

diff --git a/meta/recipes-kernel/dtc/dtc_1.5.1.bb b/meta/recipes-kernel/dtc/dtc_1.6.0.bb
similarity index 81%
rename from meta/recipes-kernel/dtc/dtc_1.5.1.bb
rename to meta/recipes-kernel/dtc/dtc_1.6.0.bb
index 9df8a06d47..92df70d9fc 100644
--- a/meta/recipes-kernel/dtc/dtc_1.5.1.bb
+++ b/meta/recipes-kernel/dtc/dtc_1.6.0.bb
@@ -3,7 +3,7 @@ require dtc.inc
 LIC_FILES_CHKSUM = "file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 		    file://libfdt/libfdt.h;beginline=4;endline=7;md5=05bb357cfb75cae7d2b01d2ee8d76407"
 
-SRCREV = "60e0db3d65a1218b0d5a29474e769f28a18e3ca6"
+SRCREV = "2525da3dba9beceb96651dc2986581871dbeca30"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1

