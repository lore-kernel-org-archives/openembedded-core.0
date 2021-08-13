Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.37399.1628865128480904316
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Aug 2021 07:32:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=kKA6UN24;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id qe12-20020a17090b4f8c00b00179321cbae7so5668799pjb.2
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Aug 2021 07:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=9w5Kpa388hgw/X5nLMI5cPysiBydQ45BtyrniIQoAgs=;
        b=kKA6UN24yjPesHe7KKlLdvsxkvUGI3zRlgBLTaGB/s+xn3y9RJPp8dlHSO/pTcvx8N
         P6Kch30GiAtC8VCycjd30PrZCSiQIkvvAr6kcoFbTnHVv8O6m0PV7DdMq0FycVdewAMC
         z6vWlYHCx9B9R6JKOtwlUM5C6Ejo17AjOi2m8W/KEU9/2kPV0HYegYxrIJNHsqNFD7Di
         6WylQLt2ddxO1syOiNsFYBAZDT8aVsALP2thxzBQFIsLwXBbvQ8/ejvaP9Ef+Mj4Oyn8
         BKlQD3QqSl9qVvoVS8z9YijzyCPr5rgMkwyc7JOug8OVQmFAlTm+6lixhCYmClnmYNNW
         /VpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9w5Kpa388hgw/X5nLMI5cPysiBydQ45BtyrniIQoAgs=;
        b=Z1vzr3/szOEfldYsa72QmjmTVT6wPmUSKHH4u3vXdlNb3/K2c12aM9NjkaA1MZ8E+K
         zXcEZn+pBrjKhfS4CofaIXgYXSziM3sguSvASGR7N7adStlLqjDmzdMwfVeOf6PpRfdR
         N/ABln1v0yxyL+lpukSQAr+K1xZL7YRVKLhIJm7E4m6ME0S5tqqczWxCjkJ5iymfJBnL
         VrmDqH92V7C63AsJuGgpRNbCZuPCpklGQGP09HZkFFQEon98/bfv5Gb5b4c02fQy3fVA
         TZBnnM8LO14GYT72F3Rz3yU9Fk7fvzVuFOJ7OfWga3K9G3Tf/Q5/y5SE3ZmruSlkCpkI
         Md8w==
X-Gm-Message-State: AOAM531owE3D5J09hjqfEulQZL+EC6Po8qQ1ZB2ih6LzJxlbHv39c/Lw
	Tem7JI3I2WS7wtCNFzulwmCzY38zAWnUj5TM
X-Google-Smtp-Source: ABdhPJwde40kNTxDbSE8A7AEuzqDluk8HzxWH+zCam6TeuOGn47l8dqc8he9o6G8jSI4+a+TQeuNJQ==
X-Received: by 2002:a17:90a:8905:: with SMTP id u5mr2777182pjn.95.1628865127686;
        Fri, 13 Aug 2021 07:32:07 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id nl9sm2113182pjb.33.2021.08.13.07.32.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 07:32:07 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/17] runqemu: Fix typo in error message
Date: Fri, 13 Aug 2021 04:29:51 -1000
Message-Id: <17003c76dc059a312d95b2ec690f43b9104ad30b.1628863869.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628863869.git.steve@sakoman.com>
References: <cover.1628863869.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Matthias Klein <matthias@extraklein.de>

Signed-off-by: Matthias Klein <matthias@extraklein.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5cc0051d50974e198313f9513b24fd7ae9a96dd4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/runqemu | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 63e533a934..10880ba6bb 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -764,7 +764,7 @@ class BaseConfig(object):
                 raise RunQemuError('BIOS not found: %s' % bios_match_name)
 
         if not os.path.exists(self.bios):
-            raise RunQemuError("KERNEL %s not found" % self.bios)
+            raise RunQemuError("BIOS %s not found" % self.bios)
 
 
     def check_mem(self):
-- 
2.25.1

