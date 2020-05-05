Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web12.7169.1588683735749442635
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2020 06:02:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oFZy+80r;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id k1so2604850wro.12
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2020 06:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qS6JAVrAdnU/h4L1TnPIf1CtJ6FDxSs7jFv8KoLmFUI=;
        b=oFZy+80r7Ca14deC1UXpGgKCJ0nLcQ4fGbFgof9PKnF7LXrFnyoko7iS2ciGgG1B8h
         OtGUjfSFJhnNaVZJHHZDAg736pij919xU4dtwp53kY26Dvw2VzEyrjKqj9VChrPOZ5L1
         igoibKZBGz9p/hCWre2wfAkt4J7nhnWICsp/LYK01NRGL1fgk2mR4+9Dlmaq6DmNhL3V
         iuj2xgt3gVKYUfl3vZ8wdyLOGaK23GjnV8zC6/6uxqrUlQcxYfmIDt5nBPmlNfcqjrWM
         sB7Lobqyn+X/XTI9aaFwRLpy3+ENEW0RCPGpUZ2EXtUXK5VJPdt2x3anAwCJ5GXe2cFq
         VA9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qS6JAVrAdnU/h4L1TnPIf1CtJ6FDxSs7jFv8KoLmFUI=;
        b=D0ne73xnvQkuYlzPDPmuDpXwE8ijXaU/+8PK46xfOJOaVKlCjB+vX/LcFj+WjK6k4R
         t/FtSqwCRZZymcuaXihcqT9eiaL+z5aGL9qZB/7pCVx8vrpOPtifZSbiXodL/gWe4+x8
         5FdQIf2v+gKUudT4ye9CJr+kYT4zEhrYxl96FmliyvC88w+qGzu/tYeccpXwB5I8FCD+
         HaNjotwIt4MRBUXHNms9Z/gia3XdC/osBuS/US2LHVLoMQ2jTq+bABHLZRskNSwwJ+mx
         SclMK5UAdnVJNUJUykw7Ks2M2eTjLeP3YzLtIzib2/UJbkHNa9DNZaHPrcIiFTqxOF3c
         WOqg==
X-Gm-Message-State: AGi0PubfFDBE4k3Oi7nuXXTX3JC+NxUH17ps0qQ1LW1FElMZxwWFodQo
	Y0oL3c8DyLRJzwCr7QCAe0OOAxJQ
X-Google-Smtp-Source: APiQypI00Ry7glAjPLX3BR6eTFrvb+TQ8E8ff4aG/Rl8aKxEliNJnf5RgKa1wYg+K99h4gwhH5+xog==
X-Received: by 2002:adf:bb4e:: with SMTP id x14mr3545466wrg.63.1588683734018;
        Tue, 05 May 2020 06:02:14 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id h16sm3388113wrw.36.2020.05.05.06.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 06:02:12 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 13/24] meson: fix upstream version check
Date: Tue,  5 May 2020 15:01:22 +0200
Message-Id: <20200505130133.24930-13-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200505130133.24930-1-alex.kanavin@gmail.com>
References: <20200505130133.24930-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/meson/meson.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
index 50fb41ac98..0a58c971ae 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -26,6 +26,7 @@ SRC_URI_append_class-native = " \
 "
 
 UPSTREAM_CHECK_URI = "https://github.com/mesonbuild/meson/releases"
+UPSTREAM_CHECK_REGEX = "meson-(?P<pver>\d+(\.\d+)+)\.tar"
 
 inherit setuptools3
 
-- 
2.26.1

