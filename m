Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.5919.1617634465721552747
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Apr 2021 07:54:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=rTh+itCQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id g35so3526928pgg.9
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Apr 2021 07:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=wckvPoSarcR/AkvEy1aIFz9vKupzps/fWZP4xZsU9KY=;
        b=rTh+itCQAltIAy3wEdIjbkNKj/bTgQGsr87/p9mZH5pe3nNKvjbXxAUB6zs+2zQ5B9
         arhGQNuZW+HGqENL3P+h9c5la+vETiEux1rbyiSSG2viB9va2mcK8gKBOv4s3g/SOuPu
         UsHc5jhWNs5wIW+nlj2twy5FHkpLOvgZYgdRlsjp0aajp/hIFlEd+VbsGeLV91sWaI9/
         DDis9MEoXZgRILAO9ADpfoZ0ALYbVr2q4qCCvDkXgdVsiZYA0rpJS8eO0l+cLEVhbZ3p
         PcLnpmbgWpu2uvTRaPImSTLZJ0Co86r7D7Q1LGfwL5lCmNJwizdJ9MUVms4uifHU2wNP
         KYZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wckvPoSarcR/AkvEy1aIFz9vKupzps/fWZP4xZsU9KY=;
        b=U3aFxZ5n2nAQrLmcfiaIUou/mBe8h1NMTgCEj/Evyxb40aGzukgspOQD3PY2m5UeHW
         63Lp2gGnxA+GcQt2zYGmACuNarxWj+0YC4Qaq2w1y1SaOcn0bGdmCQfMH5vEdSLe5G78
         dwLt40CbFZL6xYPmEiU8gcwkG2FG59AJQn7BHcnWx6n9/1nMSyYIdOcqcrcdUKARrtwr
         6tTCn//DnTeeLfCSVjeJxUIcKcxzxJkQEt8LiEwbawT+vBarzSzTzaRGGnUhRyVopAJS
         Fboh+Qa6i8dJu8oqEdLHcUs6T7NG3tWRdhxPqIa8253str5AkDW/x9a7u6JriGkFUSdw
         arpQ==
X-Gm-Message-State: AOAM533KdvtnNsyWOJSOZoLDKiI3/rMQT1626ROoOCg+VdMTQzcFrsT0
	2UaSdqfEy8A0RNPOLfKKZrT+FeYsPNkFiWpc26o=
X-Google-Smtp-Source: ABdhPJxL6MLKPJQJa2zEr23XKC+LbAcHsMkrPclzVeMB+AxZCWHgeHcCtf2rG7v7Hqf/yEleiZHNMQ==
X-Received: by 2002:a63:1c06:: with SMTP id c6mr18075899pgc.380.1617634464843;
        Mon, 05 Apr 2021 07:54:24 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id g3sm15427734pfk.186.2021.04.05.07.54.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 07:54:24 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 5/6] selftest/reproducible: Sort the unused exclusion list
Date: Mon,  5 Apr 2021 04:53:31 -1000
Message-Id: <b406720d65135a898f04a92949b05ba0108c9970.1617633691.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1617633691.git.steve@sakoman.com>
References: <cover.1617633691.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This makes comparisions between lists easier.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d2c52125d1cdc06c7e08d507ca68f3e4612a4314)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index b331c3dedf..f5e3bff5a4 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -122,7 +122,7 @@ class PackageCompareResults(object):
         return 'same=%i different=%i different_excluded=%i missing=%i total=%i\nunused_exclusions=%s' % (len(self.same), len(self.different), len(self.different_excluded), len(self.missing), len(self.total), self.unused_exclusions())
 
     def unused_exclusions(self):
-        return set(exclude_packages) - self.active_exclusions
+        return sorted(set(exclude_packages) - self.active_exclusions)
 
 def compare_file(reference, test, diffutils_sysroot):
     result = CompareResult()
-- 
2.25.1

