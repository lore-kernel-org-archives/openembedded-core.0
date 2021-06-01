Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web12.58265.1622557124921382437
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jun 2021 07:18:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=MHjZIkAo;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id jz2-20020a17090b14c2b0290162cf0b5a35so1487210pjb.5
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jun 2021 07:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=48cPkGWYqHpmR+ahwLXcTSOEWjjFQ6q79fpYkYEicpk=;
        b=MHjZIkAokYVhJPwb9ybVPsxRLwBiebWWsmybCpDCsq7XsFde0+m1BHeuYmLFVG1Yuk
         MoVPdit5b4LEQecrZlebBm8esTg41J++XRk07I3t217FILVF2KsLFF0cPo+Ky42eqfWT
         jUWM1xr6+Kz78apmYybUCCBkN7pk9l6alWqxd915nwz3m6jrJhtAgeUiNePEYSUn1WEk
         fSLUKm270bqYfISdc/NGs4edH8uWk2oiaAXvnZWJEb8AmTZnOK+5CbykhWg1rXuPiGxE
         7A1PuUiSqJxlkmjPuaTCvANohHJhqqQoZEj/s+rpZxpW7rL7syPEQW7r1AT+ejBJ5jKH
         0WNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=48cPkGWYqHpmR+ahwLXcTSOEWjjFQ6q79fpYkYEicpk=;
        b=b6y+7v/KXuuAAn4sR5d+KJGGyZy+dsjcDQEU0SV8tzuUuYx61BmpL9J7zqusVTObEO
         98w6meogRA0V6ZPgErnHn+SgLVMbzRoSXo7RAxkUfBqv9MNXFlbuEjBRIn9tnoetlaVf
         KkoVTOxUAftJxU6sXtMJDrKdUCuRM4X5zVxSepXx0hFPV3HyEetkxte57KcVIepbIR7I
         g+hPFbWAXjlQRPUX2b/cuzM5/7UJW78I9As99r/RzoazWInZEjaXaZVq/AgO2EJBsgp6
         30BTSia/gyCyX+UGD2+yCkkX85se11dP+b9horLgFv7jPeZAi5NnMmCy/8+mXcXyx+hg
         wdMw==
X-Gm-Message-State: AOAM530klM1BE7swkoXcUgBsu9L2x0JMFrfxpXGnZrhHMAnnkxKHAJLf
	ipL/41gHko2+plC/eMW+9Dd7WmhcTay6I0kLv6E=
X-Google-Smtp-Source: ABdhPJxMSxWmdM5ZH9PdWXNakDJk5Y5OFYNqGTSxnXgFWnW8zxxBpNGYxlvXieFcAu65JgP+RVwf2Q==
X-Received: by 2002:a17:902:db01:b029:f6:4a13:1764 with SMTP id m1-20020a170902db01b02900f64a131764mr26306204plx.25.1622557123996;
        Tue, 01 Jun 2021 07:18:43 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id bb18sm2307875pjb.44.2021.06.01.07.18.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 07:18:43 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/26] cve-extra-exclusions: Fix typos
Date: Tue,  1 Jun 2021 04:17:54 -1000
Message-Id: <43d8d7001402aebc78979f3c86493f0aa15140a4.1622556919.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1622556919.git.steve@sakoman.com>
References: <cover.1622556919.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d4d4644e7c127e8b88b180635124e8afc905c69e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/cve-extra-exclusions.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/conf/distro/include/cve-extra-exclusions.inc
index 565c8e04cc..b2816c3dd5 100644
--- a/meta/conf/distro/include/cve-extra-exclusions.inc
+++ b/meta/conf/distro/include/cve-extra-exclusions.inc
@@ -1,17 +1,17 @@
 # This file contains a list of CVE's where resolution has proven to be impractical
-# or there is no reasonable action the Yocto Project can take to resovle the issue.
+# or there is no reasonable action the Yocto Project can take to resolve the issue.
 # It contains all the information we are aware of about an issue and analysis about
 # why we believe it can't be fixed/handled. Additional information is welcome through
 # patches to the file.
 #
 # Include this file in your local.conf or distro.conf to exclude these CVE's
 # from the cve-check results or add to the bitbake command with:
-#     -R meta/conf/distro/include/cve-extra-exclusions.inc
+#     -R conf/distro/include/cve-extra-exclusions.inc
 #
 # The file is not included by default since users should review this data to ensure
-# it matches their expectations and ussage of the project.
+# it matches their expectations and usage of the project.
 #
-# Wemay also include "in-flight" information about current/ongoing CVE work with
+# We may also include "in-flight" information about current/ongoing CVE work with
 # the aim of sharing that work and ensuring we don't duplicate it.
 #
 
-- 
2.25.1

