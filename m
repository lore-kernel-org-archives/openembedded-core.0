Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.6610.1601504144661284886
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2020 15:15:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=FGTLIFwC;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id 34so2101574pgo.13
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2020 15:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=6N83+1Jh/59IfghIYCZEYCAy20BE+KW9m2YOpUHpW8U=;
        b=FGTLIFwC4B/XamlGwAVg0iNEdP+wzMsrU+0SDSC3yViH2B3vrKKSphl7JEo0oqD/m1
         y/rxSDMVjbt2lE4MVDZnoVPZ+0r9mobApwDD07hpfq53vR2Xp7o+gCl2cIPxTVU1gpGV
         HhBEL5ZJ/AdBNsDJFUWOWR14mjutsgCi2oMZnX684BEkOaLDoUr5F0e6stsHpET1CWW0
         HylIAp2NNhnYASTH5rvRqVoojqZ8KDz0KLL8TiRckiG+Eix3/pxBiWSyfyYg3wkTZgAb
         RzWwUHxoQOxf5A2nPcaFqZVeNmaoS1uUC6cmEVyRWclYteBgm/N/KkpGUoZ4m3Q7saCi
         yQ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=6N83+1Jh/59IfghIYCZEYCAy20BE+KW9m2YOpUHpW8U=;
        b=P+SouVsfBum9kyPWYFZvchjc6WPc7l5Fltt3RzSMtTEdBdikyAXnov/GyQCTbuMXkt
         o57EauP/SZZYimW7/ce6PzDqDjUKfSM1sEoYajzX71OY8u8cvA3e/Tr2Xse/qS95ErvD
         KdKLC304FHH06HwYKcWc5FyXPtO1oDDDG05eRUsOt1TRb/hKH/MHymt44bVMfIkxSq6u
         v2DeweD95YHkmw1CWLAYdpGuymaWE5vAS6FQMrzBP620/+XQJHvL96gri2/cge5Bvt+E
         zx0sfcstruKES7gVoVV20aaB36LowAhNNHuVlqI/Ai/6TnpMUn29HinfC42tieCWPoDi
         P4ZQ==
X-Gm-Message-State: AOAM533MG8pVHUWqaBRzMCSWTxXiV3Hmw6XbGeIxcVavnV+POfgy4Fyv
	MMUYKBhtX2BYXlhhvjp4ZqER19oL8QHVr/p44ko=
X-Google-Smtp-Source: ABdhPJy5GCHfUnvg1VjH4ivYQf1aTSVr6RkXk11oREt8CBGSLAYRpHa3dzqI5Y7MWycqzpgSUrhYCA==
X-Received: by 2002:a17:902:a512:b029:d2:22a3:31ce with SMTP id s18-20020a170902a512b02900d222a331cemr4301459plq.77.1601504143853;
        Wed, 30 Sep 2020 15:15:43 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id k6sm3488799pfh.92.2020.09.30.15.15.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 15:15:43 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 40/41] wic: Fix error message when reporting invalid offset
Date: Wed, 30 Sep 2020 12:11:42 -1000
Message-Id: <0ff25797126772f40e357a2f3cf81eccf659adaf.1601502610.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1601502610.git.steve@sakoman.com>
References: <cover.1601502610.git.steve@sakoman.com>

From: Joshua Watt <JPEWhacker@gmail.com>

The error message was reporting the calculated offset instead of the
current offset, which made it confusing.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2be775cfe1b49ce3889b5dc326e2b67a9667f18a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/wic/plugins/imager/direct.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 1f65a7afe5..2f01999405 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -436,7 +436,7 @@ class PartitionedImage():
 
                 delta = offset - self.offset
                 if delta < 0:
-                    raise WicError("Could not place %s%s at offset %dK: next free sector is %d (delta: %d)" % (part.disk, self.numpart, part.offset, offset, delta))
+                    raise WicError("Could not place %s%s at offset %dK: next free sector is %d (delta: %d)" % (part.disk, self.numpart, part.offset, self.offset, delta))
 
                 logger.debug("Skipping %d sectors to place %s%s at offset %dK",
                              delta, part.disk, self.numpart, part.offset)
-- 
2.17.1

