Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web09.10538.1628177886307001509
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Aug 2021 08:38:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=CpeQr3f+;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.182, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f182.google.com with SMTP id w6so7864960oiv.11
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Aug 2021 08:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=fFNxF0Q4zZGkUs6ZgYt1+m2LIp8zjI81AcKKfaFpA1c=;
        b=CpeQr3f+ETtzjKNHxeIVdxBnYZ2IY3JtR82kfQ4h9Kk3u5V+cn8ibXTtSsg6NYrDM6
         ZX8oP0oxV9PpjLj/Btch36J6g7cwSv3lk+A+cBPD9dOj/HM15xw5UDhu03HULA2xVKhG
         jP0/KK4iffg3TTzOQisOeY5Ngo1IXBPsFNZlTuVSHCm4csC03+vHdyKolG7RcXf5WOvH
         l4I7U+FXG7ux81u3ltBGe5CdcS2avNp8QsLIdsmLXIC2adIA6zOaeSg1jf9VvrVmJIw/
         Q5WniCvgxtBDyeX+Atlk3g50jW/K6a7z44PshgQlXPBKW9Ei2QqtcXOvETCP5tF0u3F6
         89UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fFNxF0Q4zZGkUs6ZgYt1+m2LIp8zjI81AcKKfaFpA1c=;
        b=dH0HF+7Aia4vcPA9ZBjY/Z1Kc1hkdwTqcaifNR0wIFUatsWd9gG8B/ITvB27OnjcxX
         nHQNEZ8mOWrxabFEVjVkJWaiPuYBJGsZYkjInwzdNp/Eq3VzJODn+ZldT6QT01Vi3kiC
         csSe1M7Py236OTErRaSOxOMLYdll3PvrbVkwTsvxg/BKKQfmzlgK/+2v/dp5RITxz1jW
         jerJFbcA7aUhGIxTm1G6n9zBFKqFUeQUNGOpfwJs/jnCnaBJUufgyc9BNyZ+04jKGKS0
         x9KaGDgZxiSP1JjZyGlDJHYKznSiVaqKgTH92+wf+5oytQlU23yTDfMsJ/hrvol7cZHu
         y7kg==
X-Gm-Message-State: AOAM5323YIMYOXY1ERCoP/rOGHsti3p3MwRXjqEsxA06Wl4yX3tyME3u
	iaY2axKcxG5SMLlRVKn1kXOCGeW+5kWR52Kb
X-Google-Smtp-Source: ABdhPJx1RPMqgbkPaJO+5lh6ljduNRQ7XunTFbcyL6DROrfPx2qUSzMC4c18h0nXRoROpw9wEEgPxQ==
X-Received: by 2002:a05:6808:2221:: with SMTP id bd33mr11477366oib.23.1628177885266;
        Thu, 05 Aug 2021 08:38:05 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id bf41sm1103076oib.41.2021.08.05.08.38.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 08:38:04 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 31/33] archiver.bbclass: fix do_ar_configured failure for kernel
Date: Thu,  5 Aug 2021 05:34:08 -1000
Message-Id: <224913ff067e6c26cabe0df0ecbf50fb03b85165.1628176985.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628176985.git.steve@sakoman.com>
References: <cover.1628176985.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d7776a23cbea836ddb8ac5ec77012af2449ab875)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/archiver.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 49717d4f57..9ef18ebd3c 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -281,7 +281,10 @@ python do_ar_configured() {
         # ${STAGING_DATADIR}/aclocal/libtool.m4, so we can't re-run the
         # do_configure, we archive the already configured ${S} to
         # instead of.
-        elif pn != 'libtool-native':
+        # The kernel class functions require it to be on work-shared, we
+        # don't unpack, patch, configure again, just archive the already
+        # configured ${S}
+        elif not (pn == 'libtool-native' or is_work_shared(d)):
             def runTask(task):
                 prefuncs = d.getVarFlag(task, 'prefuncs') or ''
                 for func in prefuncs.split():
-- 
2.25.1

