Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA1A0CCA478
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 16:52:23 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web09.1516.1654188740346702782
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 09:52:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=IvxKkB1C;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id e11so5220085pfj.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 09:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=nlNnEJDPJeQ4+5kxOXAkyprb6MSAAEWdZfk4l6FOxLw=;
        b=IvxKkB1ChDYc73chhn1SvmQ8S4aXQItp5ar1e/a0g13z+y98XsM00MZQ/q3OjP/PFf
         ZzMUTnwCLwxlxXp9yR/0bc/0puzrqEkw0FCZgU5850B2BvusVWsQuihi3AWSiJNmeT1H
         gy/C0jgnVJ53Oa+c21IW+aXwpDd7yBQPjjJ41jugCJ0nP+z+F+X5tVi+UO0EqUbfJWd/
         EXA4R4hnlckKjQaiTKA3DVI4g7NKMKhYmC/3C1OOpeXkjq0PRUHpN/XxwItWNyuPjKIV
         4oZUr5UMdMJCewAUFAfFLVSGxzR0c+4Qx1W9T/eA7qZyB7psJC5lEEoH4fxSCa+OQOcW
         xrtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nlNnEJDPJeQ4+5kxOXAkyprb6MSAAEWdZfk4l6FOxLw=;
        b=T/JQDj3VVkUXCx4W3xAXpvDJx0H6MwSVYeovbLD2CxJ5W0I80Vr9C/mDetIifq6Gla
         /P3c9dXaEW0KMGOWcWCtQc0duMG36rgJERl/USV067a/o3GEW0mwnpY7s7W2rwCpiCdo
         fMscuHfIA9V1P1RwVnynoJ6uREffHdIaYur7K/UCFmFQb+aOOvTBKuH30E8dcG8aIIZI
         kPA8hpWPwr+xnB+9QrRjBkWmwnpjvXxsKc9M0XI0bQTwEj8+F3AguFrdOmTgtPIo9p9u
         Cj1ySqP4FVU4gw5XQ+y4EhdkT1j4cAvuxpC9QkV7g353XnRr1FHdMoHA5bJN1ogN1N7K
         98jw==
X-Gm-Message-State: AOAM532M3rE34J4G8Bgr3mv3eGJ9tVyI06+EFPU9MbSErnadncBKHCe3
	iu0PcUlVE3777msPYosCOIq7YJjz+sypZN1L
X-Google-Smtp-Source: 
 ABdhPJw+ta4P0jjHRXypi9lQe1mX2GY5apqsEUH3ecIRv06CgHE4wXlYIy7kMFvG8jWLvUpCJ0nW5w==
X-Received: by 2002:a63:1950:0:b0:3fc:652b:f8c9 with SMTP id
 16-20020a631950000000b003fc652bf8c9mr5010486pgz.339.1654188739149;
        Thu, 02 Jun 2022 09:52:19 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i188-20020a626dc5000000b0050dc762815asm3782233pfc.52.2022.06.02.09.52.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 09:52:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/26] libxslt: Mark CVE-2022-29824 as not
 applying
Date: Thu,  2 Jun 2022 06:51:35 -1000
Message-Id: 
 <82f4186ec0b16d4c1d9a8612fc3b6c6701fee8ea.1654188574.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654188574.git.steve@sakoman.com>
References: <cover.1654188574.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jun 2022 16:52:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166480

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We have libxml2 2.9.14 and we don't link statically against libxml2 anyway
so the CVE doesn't apply to libxslt.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c6315d8a2a1429a0fb7563b1d6352ceee7bc222c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/libxslt/libxslt_1.1.35.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-support/libxslt/libxslt_1.1.35.bb b/meta/recipes-support/libxslt/libxslt_1.1.35.bb
index 51cfb2e281..2fd777766c 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.35.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.35.bb
@@ -19,6 +19,10 @@ SRC_URI[sha256sum] = "8247f33e9a872c6ac859aa45018bc4c4d00b97e2feac9eebc10c93ce1f
 
 UPSTREAM_CHECK_REGEX = "libxslt-(?P<pver>\d+(\.\d+)+)\.tar"
 
+# We have libxml2 2.9.14 and we don't link statically with it anyway
+# so this isn't an issue.
+CVE_CHECK_IGNORE += "CVE-2022-29824"
+
 S = "${WORKDIR}/libxslt-${PV}"
 
 BINCONFIG = "${bindir}/xslt-config"
-- 
2.25.1


