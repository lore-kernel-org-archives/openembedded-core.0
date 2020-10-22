Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.797.1603382002668807769
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2020 08:53:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=jkRFW6UC;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id bh6so1181827plb.5
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2020 08:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=MPK9J3jhe2rzYImpnsMnXs/V//sV+kkXCYiHksFGqRQ=;
        b=jkRFW6UCdf8alqXcTD5C7K4SQeW57nOAJy0eYqtbhCJcUCedLJeiuR8cV9y7fK6WMl
         XmhIq0wLrqTheX7hj8/4098+sGT2rWqbrJycIfbP+YNlpCV1umwlNublsG/jt0UEK0NP
         Oq+YMXwOPKOvhQbOH/42A8tTG6gwPwY6esZbfRI8nsQcTgGpduJeM7FMnc9sH771wPtg
         9bulEvXmSdIwLVKMT5LlZZw7mU/tdHhpKZx1f38oeZnn0GGzIuQLpJ2JTQ+Ibp36h7fs
         khnH3gg+emhJTwbGqe9NOxaAmwHFPQ80euQxJxR6dUTuCm4SXa20Jnh/oZIYje7TCi+4
         71pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=MPK9J3jhe2rzYImpnsMnXs/V//sV+kkXCYiHksFGqRQ=;
        b=CjprF8MC2T5cYHeYq02Off/9bB10VQ+90ZBNDO9CZ6uQTEVXtTzSAHh2XiIwdHL+cN
         mIVJppn24tBunkxCCTIUZLawiDxKH8QJpjsngUisRsjUxf+6OOE/wSada7PBvoWEaIut
         CJBQyYr0qb4RJzmHHYe7rld9MesbIajCAxrF4UXTsTZnBHUrc4GZo6Bq3S9XH9XLLZOR
         LXp6I7iRu4/5Zf1kYGXaNPzhCSHD3zEJI8FW3DZrmq/S+1fQyZ61qGcPqvB8pm11x2NV
         bWycRgR9bmKiZwwlPQ6z1MH3Vr8mKcetPLmbkQTPCYGXSgcURJhjwDvoWLmpumbFc/Lj
         M9MA==
X-Gm-Message-State: AOAM531YeB+M/tEUxeSnn17YtpxBTPQ3exNExN6thDU8ZWhfiqH1PufY
	b2T4ypCQVSR4fsopQ2XtvuZDvZ/AjsBUmZiY
X-Google-Smtp-Source: ABdhPJx+LJ43MmG6Jp6SNOSm/uKB99YxzVtvZka0j6V8OlRS3OOdgiwYhzdDTsA+pZMQVzmMcTj16Q==
X-Received: by 2002:a17:902:9b89:b029:d2:42a6:88f with SMTP id y9-20020a1709029b89b02900d242a6088fmr3268863plp.71.1603382001723;
        Thu, 22 Oct 2020 08:53:21 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id kc21sm2423558pjb.36.2020.10.22.08.53.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 08:53:21 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/14] selftest/virgl: drop the custom 30 sec timeout
Date: Thu, 22 Oct 2020 05:51:45 -1000
Message-Id: <4f77fe468f2ad225e2a89b5e3a4c84f0b93dab2a.1603381705.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1603381704.git.steve@sakoman.com>
References: <cover.1603381704.git.steve@sakoman.com>

From: Alexander Kanavin <alex.kanavin@gmail.com>

This is occasionally reached on the AB; I am not sure if it is due to
host overload, or guest malfunction, but let's use the default 300 sec and
see if it helps.

[YOCTO #14097]

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 93a0352e2e8539d109f6d3ddc0ed02b3b9256e86)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta-selftest/lib/oeqa/runtime/cases/virgl.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-selftest/lib/oeqa/runtime/cases/virgl.py b/meta-selftest/lib/oeqa/runtime/cases/virgl.py
index c0abfd1b16..cef1dcc396 100644
--- a/meta-selftest/lib/oeqa/runtime/cases/virgl.py
+++ b/meta-selftest/lib/oeqa/runtime/cases/virgl.py
@@ -13,6 +13,6 @@ class VirglTest(OERuntimeTestCase):
 
     @OETestDepends(['virgl.VirglTest.test_kernel_driver'])
     def test_kmscube(self):
-        status, output = self.target.run('kmscube', timeout=30)
+        status, output = self.target.run('kmscube')
         self.assertEqual(status, 0, "kmscube exited with non-zero status %d and output:\n%s" %(status, output))
         self.assertIn('renderer: "virgl"', output, "kmscube does not seem to use virgl:\n%s" %(output))
-- 
2.17.1

