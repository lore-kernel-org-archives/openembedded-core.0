Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 889E5C433EF
	for <webhook@archiver.kernel.org>; Thu, 13 Jan 2022 14:37:54 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web08.9624.1642084673932389002
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 06:37:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=pgVfMoHN;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id a5so39659pfo.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 06:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ghFLEjoxXIaM6xsUmpag/f+fkPOPH4+x5c4gHQLCq3s=;
        b=pgVfMoHNXnC5rs8JwdovqYZfpfje7Pw3iXBLgRGlSxQsiE5P05/6wZ4rSnnemkAYGQ
         ZMty0hVCnL3SMPkJ0fs/CBtdTWS0lpwMocGwVsV70PvQWVX6rhzDMm+MoET9XtKwvBNd
         uHzT5MLi9cc7veKNlpSO6P2bSSWsImJjkcUok+oN4mu1wcnji8p6k2cdffHyjmK7XTtn
         e1aaa0Qesr7oIx/7z95VDmmyLnp7BSWl04ooN1CZktdk7L1yxzBH77B94K4DZEjrktJH
         oSfCfxBNrOEOmfOL46k8r8EE0pjzYYbv7fO18hWp54wMIhJ8pe4wsqKpatEW66MVwf4/
         /x5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ghFLEjoxXIaM6xsUmpag/f+fkPOPH4+x5c4gHQLCq3s=;
        b=qGWvdWzGiAqk0iJvUbn/iTU6xqyShCGd43dLxZXRJUSGH41LgncK7UV+3gAWTHgled
         6Dj4pCjjBvQju1jnyqkDJFjrFEPZDj9fiJzaxorvbHa9BupCAG+zG0VDZzLwhpkuFwYL
         w/qyOoKTg4uibnqYV0nI2gtbSLPUNCGFoCo3UFrDgZfsQ0tKmMCvEUlXI3FPQEC8iRyB
         U3EPWvRjInWxxAJEYaQgUM+0hWlYR2lU9BJOjCGEATP6TZSSyCJlVbGdmYjJMq4Czdhm
         FQEOt2YNhphNtuDLD/UT3ukZ3iCs5+R5w89IUG8VTPvKFihJ4s85U3ZQSt0cOCsZqh0Y
         Mhzg==
X-Gm-Message-State: AOAM533o1oN3+klGzFiWtDBhazWVJDgA8dkpFtRgSG0GwZZaQdiVTug3
	e4BsykOD0//EwzGgTvI9Q6JXiYg1BHHBa8hAIAM=
X-Google-Smtp-Source: 
 ABdhPJyZgJctG/b/3CRVu6F2Q43oup/BN2zp6Ku8Mq74WwqjmALgnntXFtihLmWQkJzv9hUn3SsQGw==
X-Received: by 2002:a63:3d8a:: with SMTP id
 k132mr4150045pga.577.1642084672736;
        Thu, 13 Jan 2022 06:37:52 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 g11sm2541544pgn.26.2022.01.13.06.37.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jan 2022 06:37:51 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/11] expat: Update HOMEPAGE to current url
Date: Thu, 13 Jan 2022 04:37:12 -1000
Message-Id: 
 <022750aaa128189f23063b741bf8396a527713d7.1642083419.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1642083419.git.steve@sakoman.com>
References: <cover.1642083419.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jan 2022 14:37:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160519

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Upstream pointed out we were using an old url for HOMEPAGE. Update it to the
current url.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f3a7e2ba247efe72154c263d1d680aaf3da5b609)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/expat/expat_2.2.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/expat/expat_2.2.9.bb b/meta/recipes-core/expat/expat_2.2.9.bb
index a2df7ac492..4b63ec89db 100644
--- a/meta/recipes-core/expat/expat_2.2.9.bb
+++ b/meta/recipes-core/expat/expat_2.2.9.bb
@@ -1,6 +1,6 @@
 SUMMARY = "A stream-oriented XML parser library"
 DESCRIPTION = "Expat is an XML parser library written in C. It is a stream-oriented parser in which an application registers handlers for things the parser might find in the XML document (like start tags)"
-HOMEPAGE = "http://expat.sourceforge.net/"
+HOMEPAGE = "https://github.com/libexpat/libexpat"
 SECTION = "libs"
 LICENSE = "MIT"
 
-- 
2.25.1


