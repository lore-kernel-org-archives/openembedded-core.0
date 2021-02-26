Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web09.10003.1614349678539372499
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 06:27:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=aYN5ajuj;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.172, mailfrom: steve@sakoman.com)
Received: by mail-il1-f172.google.com with SMTP id f10so7591894ilq.5
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 06:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=yx+TiC08bUGYR5tpFsDu7b3jnFAptXgE0NcmJxOden4=;
        b=aYN5ajujpo4iBifpKKAp47ZCLd/XOd8DXhpatNqp54Be6KR8wWx2UXfQSGkN+m+bdY
         hC2C6PXkd2p5nYLXEXZq2p69kNlLOrUf10ZfaZsWil8VwFAnJ9LfnYucIHt96d+XpxDU
         jHvkkskc4QTjcGNRFYRPAMGKc/g1U1rxI9TTfOzfynFwiIKVOwtQGdM1V2AhT9B0VPvf
         ZvDyKrvnkqnbKRbd7VHGE0kFZstSmRhvKzdm5cVhVxT9Cq9MksFV5GnfTY87Eh3LKnmC
         LlOzZAl0Y0g/LYYwFDstHeahaeGmPyjSkSkAhTizm/de/WfUlFggN+836KOL/CrU2IhW
         dMBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yx+TiC08bUGYR5tpFsDu7b3jnFAptXgE0NcmJxOden4=;
        b=Ox3eIGE1G/SXfgpqGsCean7wgN/4ObuClqGHoLfcwjYiFhpDWJ3LBeIquA7UqcGnDS
         Lj8uyZpuWd7lk9QugD3wfLIixNHB7RVanv6V4FlPOJ7KzwEvsn2ZQLEnn6sM6k+TFPA0
         +zoyEc3xn6v/GYEfH0BWwFjp4wz2nJezCGkiBJ3W1MLfuIQ0v5IZNQ2l6vwNeVWg4wgN
         fAb4NMi98Gc6S1yGaPH3tTt3Y6E5LDec0JTXojx55flbLO+02jiXepNp0CrAoaUrqWos
         3ZyEr2b+Z/V/PAmR6chPEMTjESL9j/ZtZk9/e7j0WdDNe8RnQXEGQxAVhXqSN+cQHrhS
         Fpqw==
X-Gm-Message-State: AOAM533ceOHENFscL5gFyogHKTD0/yZUW2wGpnFvKnU0+YOXoTCpU2IO
	x9rfVGaYrNFXuIP01mPW4bJEpmPKnv3rBVJI
X-Google-Smtp-Source: ABdhPJxa3MBWpYp2wfhjUqui/8MIUfQe1HEQ4gFkwyHCZI+M6nJLBhT0DcXdvbpKzCEiHVJrR0zAbQ==
X-Received: by 2002:a92:6b11:: with SMTP id g17mr2613703ilc.163.1614349677468;
        Fri, 26 Feb 2021 06:27:57 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id i3sm5383377ioq.13.2021.02.26.06.27.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 06:27:57 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 35/40] package_rpm: Enable use_source_date_epoch_as_buildtime in package_rpm class
Date: Fri, 26 Feb 2021 04:24:18 -1000
Message-Id: <eae81a669e3ca2deb86f792dcf886d215f229a6b.1614348990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1614348990.git.steve@sakoman.com>
References: <cover.1614348990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jan-Simon Möller <jsmoeller@linuxfoundation.org>

Adding --define 'use_source_date_epoch_as_buildtime 1' to rpmbuild
ensure that the rpm header does have a consistent BUILDTIME tag.

This allows the rpms to be built reproducibly.

Signed-off-by: Jan-Simon Möller <jsmoeller@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f16721df6b3d0d3e681d9a1b3393417bd62b6275)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/package_rpm.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 9145717f98..95731c7d8d 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -681,6 +681,7 @@ python do_package_rpm () {
     cmd = cmd + " --define '_binary_payload w6T.xzdio'"
     cmd = cmd + " --define '_source_payload w6T.xzdio'"
     cmd = cmd + " --define 'clamp_mtime_to_source_date_epoch 1'"
+    cmd = cmd + " --define 'use_source_date_epoch_as_buildtime 1'"
     cmd = cmd + " --define '_buildhost reproducible'"
     if perfiledeps:
         cmd = cmd + " --define '__find_requires " + outdepends + "'"
-- 
2.25.1

