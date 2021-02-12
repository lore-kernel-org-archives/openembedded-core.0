Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web09.2465.1613105656971181466
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Feb 2021 20:54:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QbxQ4+rb;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: champagne.guillaume.c@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id t18so3673847qvn.8
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Feb 2021 20:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Mph7aJk/x0lsxI4ngVXvBXtHYv+TCPqHdv6AKPafCJ0=;
        b=QbxQ4+rb85i8sprkcsXfq0o9byWICaOEMcgvMQ5S5/Wgo+8SlLNobvrXsBrvR1SVhp
         RgVa0ciRTzAiFnvaIrT35MfR25gtGWmv9AH5J+HjcOpr6K26SnxD9BFYMaYBIFIdeDdN
         uBUMz8LwueT6oPUxM8jq4xzzxejIgJkC/eywHasI6cqEoe/8lXuMRgS8NNnw+MXhi1i8
         T6LlCP3rpVYvJ/MHdxEnVYMpKAkC7K68sbTXP8KoG428drwAcsqwk7y3rMXhT0yb0571
         MQjyz4ajDxUaTcmoAjhKeMJOtx/llI5ftiFc3JvY9u76Vp9AYBzTxHmuzPsZTnGMwQgU
         8FSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Mph7aJk/x0lsxI4ngVXvBXtHYv+TCPqHdv6AKPafCJ0=;
        b=KNvR0OHsdyXB2xCOAi8eQfsCl2ig5quS93zNuP7yDgps/biPTdnQ/TytpOTN6uJBbG
         FMLr3C0AltUCBAizXxskI2WBx8t415p/t4GLVV9ssvL6pp1smDm2mVA4RokZ500GUJt5
         jrs8bL+v+beewlvGiY5vrb5+2vzt/b6EZMrllYGxV5NXyc2lPjytkHDZkbH8C2TWrfJs
         YFbOEYaG0N1+Jwl03cJnwC+srohjYglWXHdsA13T+rSnT+wWdELhnfbBblRU8W5XQKr7
         ShapjHJdFw++h2lATveiMSzdEZw1MQAZZqzhJtt7uuUj1ObQ6YTleqTMqsBzsqL8gqgA
         vBQw==
X-Gm-Message-State: AOAM530XBf8zpukeLmnGtGCt42PmDq3O5FNzY7JIcxOBpY93wWDb7XzU
	Ki2s/5dw02DcQ5i/IbH1BJpJjWPBzp0=
X-Google-Smtp-Source: ABdhPJyo5igwT5egS9s11vUyFOW0Zp6yNugakSV8PTThN9MCnub4nfjaQHzNIKl7bnfGMsEPQf/Nmw==
X-Received: by 2002:a0c:fd47:: with SMTP id j7mr1015942qvs.22.1613105656074;
        Thu, 11 Feb 2021 20:54:16 -0800 (PST)
Return-Path: <champagne.guillaume.c@gmail.com>
Received: from gchdesk.Sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.googlemail.com with ESMTPSA id i6sm4992703qti.30.2021.02.11.20.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 20:54:15 -0800 (PST)
From: "Guillaume Champagne" <champagne.guillaume.c@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Guillaume Champagne <champagne.guillaume.c@gmail.com>
Subject: [RFC PATCH 2/2] baremetal-image: change comment to qemuboot.json
Date: Thu, 11 Feb 2021 23:53:35 -0500
Message-Id: <20210212045335.16612-3-champagne.guillaume.c@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210212045335.16612-1-champagne.guillaume.c@gmail.com>
References: <20210212045335.16612-1-champagne.guillaume.c@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Guillaume Champagne <champagne.guillaume.c@gmail.com>
---
 meta/classes/baremetal-image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/baremetal-image.bbclass b/meta/classes/baremetal-image.bbclass
index 90d58f2615..ecda456c39 100644
--- a/meta/classes/baremetal-image.bbclass
+++ b/meta/classes/baremetal-image.bbclass
@@ -77,7 +77,7 @@ QB_DTB ?= ""
 QB_OPT_APPEND = "-nographic"
 
 # This next part is necessary to trick the build system into thinking
-# its building an image recipe so it generates the qemuboot.conf
+# its building an image recipe so it generates the qemuboot.json
 addtask do_rootfs before do_image after do_install
 addtask do_image after do_rootfs before do_image_complete
 addtask do_image_complete after do_image before do_build
-- 
2.20.1

