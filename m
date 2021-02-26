Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
 by mx.groups.io with SMTP id smtpd.web08.9884.1614349699175090590
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 06:28:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=uhaaLbTj;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.52, mailfrom: steve@sakoman.com)
Received: by mail-io1-f52.google.com with SMTP id o11so1867294iob.1
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 06:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=uCEEm+c8uV+uiLmtoWB771lx9x8ALyGCxERn9LAEj8g=;
        b=uhaaLbTjSJp21fMo3Y08jKpYm6l7K3iuX1bonWgw5sP6R0dpH+OdBSeSNwKPzEuQ8S
         iQL6OOhZiubHqUR40ZbEK5JD+/2/E8PLapci4UgtZtfOhvwm67JfDwsT00Gn8nUk+Zft
         nLwOPYux8bmhJuS+ipiKUQZAsHfeEjcy82ofqjOC6jmav6bZOSvFnvB4bI0GisuYC3ZU
         HKOfLstK3FWOtOEx9sKSwBBxqTebkOm1HiZCg7CmkjZ72DVT5q+9VaaOlbQMIcqG7sIN
         qLCVri6p+GOLEX5QEWgKRYEdQ9Nh37mdNDP5awg6EH5P6h71Ye2WoT+9xPadIVIGlSG0
         /hSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uCEEm+c8uV+uiLmtoWB771lx9x8ALyGCxERn9LAEj8g=;
        b=KPHtwAK4YT1mflsfYkCakQ1/58KvAJhKOf9mYjnKrK35iImVEZAEExvunhtX+Uwq4V
         1Fs+9XF/oG+c/i/fPzg5mzANIUxG+04vzuZKwQpf4nVDXDdi29hXOHUV2rRcguoickpu
         Hj2YftOSxtNz528K+vTji8OJbciGmeBbIkdRLovBfgMvIrRZbIJyXJouA3bZlx5zbSV3
         d3xc5yb2fTFIIpd0xDVpYzllkK7FlCVKh20PViw3IFTDcP9gLwwAFFhGRuPufZt89WtP
         tRJyyRqi+2JNz/4eUdPhyPYkZJemklYc0HQE/6hCkx7kACSad3MN8QYAnpr02ueE0wNF
         RPDg==
X-Gm-Message-State: AOAM531RlGSHHeXR01jUdRXrp9c5P1UDQHNLJMqW718veQi1jNtUBtty
	WaP/q0ZQdOmNP/MbnKEYXkX1gFZ4/gQjF8/E
X-Google-Smtp-Source: ABdhPJzBCrQ+x1auppY+3Ihn5+TO45mfuYy0stDvrBDUUcY097thL/OSae3lNYmQ8tY2YPijG8Ju7w==
X-Received: by 2002:a05:6602:1609:: with SMTP id x9mr3053377iow.202.1614349698074;
        Fri, 26 Feb 2021 06:28:18 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id i3sm5383377ioq.13.2021.02.26.06.28.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 06:28:17 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 39/40] oeqa/commands: Fix compatibility with python 3.9
Date: Fri, 26 Feb 2021 04:24:22 -1000
Message-Id: <e56ae223a30b5daffbe7b67a0d77aef82101f6c9.1614348990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1614348990.git.steve@sakoman.com>
References: <cover.1614348990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Python 3.9 dropped isAlive() so use the preferred is_alive().

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9bb06428cbb2ac0f3d98a1696f050d3393385503)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/utils/commands.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index 8b3e12038d..a71c16ab14 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -125,11 +125,11 @@ class Command(object):
 
     def stop(self):
         for thread in self.threads:
-            if thread.isAlive():
+            if thread.is_alive():
                 self.process.terminate()
             # let's give it more time to terminate gracefully before killing it
             thread.join(5)
-            if thread.isAlive():
+            if thread.is_alive():
                 self.process.kill()
                 thread.join()
 
-- 
2.25.1

