Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.194.1616596817090470685
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Mar 2021 07:40:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=FRR06vU3;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id x26so17458133pfn.0
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Mar 2021 07:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=VdsVQcwSC6J9EC94OPdGvhlGyFeoWsPE0KfcZPEyunM=;
        b=FRR06vU3Qof8rrY+2EhGvDqcSLjoT4biOkLeJ+t3f55nzWlKsi/hasvlsyWq1zdjHV
         wfV+t3/VySWhPZ5mnGeo7Rp5WwK7qJKhvfuR//kkclL9ov4rXOCcPnIyBspmobLt7RPp
         02OiRSQsiVobczNQgbIedsdMw5rYfrrxtQnagfHkmOoz99QAg0Dz2LnpWpV9tt8j4ReJ
         AI4YlZ9Ctm6ocOwN30YZzIncs2J6XweePoNKdVF+ZEKL+Tnukr13jNXfRcIyobZj7eyD
         71nPXLoScWVKD4/hR2Us7KDstpfItjLmNRTMVNO1oDkdVIa7gg4h0dNQHHJRNuO40xwI
         Menw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VdsVQcwSC6J9EC94OPdGvhlGyFeoWsPE0KfcZPEyunM=;
        b=Rt2NXtPZbCEARLEjx2xmxows0DZNuPQToYdNxVyYLSiWBE3ql2Xkdr50IRxGdTTX6X
         eYa5cNP4oWNHUKdWC+d+2KrMx7tA/4NX+hkUv8uJ8dPXDD7tydDBiy6FADIwbhoKcoua
         dSK6mIVCQpeTjRLyIBlkoyQEy6YAvH/3KVt2zkcJFqTfT0fYpUQVs3QmS9tODmhQ1fL/
         kUvQ5hAUiwLoMqOek8SSh3EkRmTZito/+qhr/6mQqUslQR6Olf/2KyLPyu2rYcYGBwPC
         /wxSqWS/sLe+tyqR4S35QnenYeLIpyM5M1f9eNSZ0tWURwInHopZwD29B5nRFYhFpP4S
         GalA==
X-Gm-Message-State: AOAM531fMlWI/jTz0/xT6RudtUZ7pxUHELHLW7NnbnPVuMgKSjB0QYDs
	uZ8aEBmnxN4S/2x/jYrBCS4+JAMKpEK5nGag
X-Google-Smtp-Source: ABdhPJwLrRo6lM0ykjiYANdoK9I+wmJUG3zZ7rOsUVFu0YFTJXyIRatEljDhViUENJFe08M2rr0LRA==
X-Received: by 2002:aa7:96bc:0:b029:1f6:9937:fe43 with SMTP id g28-20020aa796bc0000b02901f69937fe43mr3316396pfk.68.1616596816069;
        Wed, 24 Mar 2021 07:40:16 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id w17sm2705806pgg.41.2021.03.24.07.40.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 07:40:15 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 18/21] devshell.bbclass: Exceptions displayed within devpyshell
Date: Wed, 24 Mar 2021 04:39:13 -1000
Message-Id: <92b2da5824c11063d0bb8e39bc221530137e29b4.1616596544.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1616596544.git.steve@sakoman.com>
References: <cover.1616596544.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dorinda Bassey <dorindabassey@gmail.com>

If you type something into devpyshell, an exception should be triggered,
but that exception isn't printed out because it is not being flushed out
of the buffer. This patch fixes that issue.

[YOCTO #12156]

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9f95e82a3b27bfd5177a855326dcad8a5bdf5b2d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/devshell.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/devshell.bbclass b/meta/classes/devshell.bbclass
index fdf7dc100f..76dd0b42ee 100644
--- a/meta/classes/devshell.bbclass
+++ b/meta/classes/devshell.bbclass
@@ -128,6 +128,7 @@ def devpyshell(d):
                     more = i.runsource(source, "<pyshell>")
                     if not more:
                         buf = []
+                    sys.stderr.flush()
                     prompt(more)
             except KeyboardInterrupt:
                 i.write("\nKeyboardInterrupt\n")
-- 
2.25.1

