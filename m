Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web09.12800.1614955673077280709
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Mar 2021 06:47:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=dtb6vssd;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id t9so1986646pjl.5
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Mar 2021 06:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Rpx1YSDsgjIKmiVcpj8YJd0hK+m5oafEOiNvFj2FxRE=;
        b=dtb6vssdbbRAj1eVDvBzbv4aMKEW1Gjy8TULWORgFyq5c+3Y/6Cov4hx8nj7FzJLNb
         2Ml2pQeYVltESNsgx1EYKHnrWvEoTDzhMstgXGNiH+OLSWB7t3mY6ZbApc32isQYwg1X
         /u3Zg8ZsSKB3TBK6TAh1MzGXwGsjF+LVYvKxsoswbMy6hcH6AAj9ewfscJfHZD5V8M45
         c9KB978OXa2eHda/M7YujVJHjNCxokxQbUXnz1ieA7m2xdH+y8EtHTTPQ6PTXAEbi9GW
         +CHnxQma8xi/M0R22WhGVIIiPyUl+jgtxbT0aIVFdqtb3dL7u3sRLFNAjZZ6rjNC0jr1
         Wxrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Rpx1YSDsgjIKmiVcpj8YJd0hK+m5oafEOiNvFj2FxRE=;
        b=AqwU8CTifDD0hO9iqWWedkO8HvqPVuRO0u+RTCrZ9EZKoy70Di1Bz2crf69ORRi6ik
         ewocCXjbYc8ZttoM6CCIMlGMVJjDQHhLVMlYbRtwlV3gyRQqilBj5kXVEuAQQNc1rXl0
         KWj4dOvmHOYWZ/eFK0Q74UPVP4MAGFoUY5C5bpNPxsiofFP9o+7k67qRI/iuiEijT/lm
         uBohkOLVFOh3ftFOnIC1F5rZkv+CPHZFRo89R9uM5O7fPuhniBN6xYF+uj6aRavXRObR
         9GB7YaAou6eqofrHJlUhArUwXqnVdACl5dB7Sr2EgEkCKcTkBXpWN+Z/2dUxn8AHRM6x
         Rfbg==
X-Gm-Message-State: AOAM530tZ/9mh0gB+NHINg696NP0uVvHa34oLPL6qDPyQDV+cPyipihg
	mteNq0rBgXr5Moc5HSo3iVlsF8IhBXB4RDNH
X-Google-Smtp-Source: ABdhPJw+zPtWkfPcZmUG2/bKGT3gCpUnBoCs3tl070mhRI2muh+jPffh+YlLo8rWAUZdZnjVEmDDIg==
X-Received: by 2002:a17:90a:a384:: with SMTP id x4mr10749724pjp.84.1614955672095;
        Fri, 05 Mar 2021 06:47:52 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id c72sm2659261pfb.165.2021.03.05.06.47.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 06:47:51 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/27] image: Add directories to PSEUDO_IGNORE_PATHS
Date: Fri,  5 Mar 2021 04:46:19 -1000
Message-Id: <b04d7a7aed5b05e8561029c5e570206ac9b9fa4e.1614955420.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1614955420.git.steve@sakoman.com>
References: <cover.1614955420.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Some paths used in image construction shouldn't be tracked under pseudo
so list these.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9463be2292b942a1072eea88881b9644e55aadb9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/image.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 459d872b4a..244f5bb8ff 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -180,6 +180,8 @@ LINGUAS_INSTALL ?= "${@" ".join(map(lambda s: "locale-base-%s" % s, d.getVar('IM
 # aren't yet available.
 PSEUDO_PASSWD = "${IMAGE_ROOTFS}:${STAGING_DIR_NATIVE}"
 
+PSEUDO_IGNORE_PATHS .= ",${WORKDIR}/intercept_scripts,${WORKDIR}/oe-rootfs-repo"
+
 PACKAGE_EXCLUDE ??= ""
 PACKAGE_EXCLUDE[type] = "list"
 
-- 
2.25.1

