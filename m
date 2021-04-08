Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web09.168.1617899525183132616
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:32:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=BSYS080A;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.43, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f43.google.com with SMTP id k14-20020a9d7dce0000b02901b866632f29so2900303otn.1
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Apr 2021 09:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=wckvPoSarcR/AkvEy1aIFz9vKupzps/fWZP4xZsU9KY=;
        b=BSYS080ACAJ3XeDSTEHf9hP2awCPIgjW6vNHkWCbnPqT2sOvT1pWvI5yz7ey6MrJgA
         Z2pxqgHOPb2PTzylJWrUATAVTHJRrsVN5IXEf8KliWuigLGAjuA7UEgP/w7GEEXztOgx
         PwpsjG2Rn7/Feth5Eg0w155DbeFSzP/O2E/0/u8C4fzwmT1yb4DMB/ZzlFE54S1gtGoM
         YkLp1F0oeN6aw8ZxR0/z/DWcPemmAuTraMnlfV7zSMEqdJ3UVpZSRM3iXJ+AwYA9QoTm
         K9FebT0oGxWJOsF/5kDd6Foj/rgUFYNmWWCesLv9Aikcelmtp6TokbzdoRQaY8D2Yw6O
         3P6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wckvPoSarcR/AkvEy1aIFz9vKupzps/fWZP4xZsU9KY=;
        b=ozoMrUMLlC7+7lY5fKUKaTpmsHn/YFpwCeQ9t533zerKUWcnuN7oVECnF/nAYBorNe
         rPonHMBnsiQInGiZDxCtiQv+k9YV6uAQXGNuTqiIBu6sgdsymfZkRDm47QKgr31LyPma
         y9sHCaqf40zzicgHQfs+a+V0ZtWO0N4Cc03OL1qIGuAgryQMi34a3aQ8nPDitZWE+EAb
         DmahVOyuJv1wfxtadcvc1cAKj7pul72Vc6cJVPrspo61RV8TVxyrB64INzjrxJ5HAiCy
         I4wu+TbmHeeeqK8A2JD1Ys6RWKF+HUa+YOrHqnM1a6RI20/aslTXQ6FFXETUT2KfnIc1
         gVYw==
X-Gm-Message-State: AOAM53164LLnJgwgbsKBX/+ug17ewf5H2isT0tCfonEGJPHjR3cfGFZr
	yPTafWPPuR9WINNjDZAnqTN86sp+/xXu/Xcacyk=
X-Google-Smtp-Source: ABdhPJxuGzpef4Taz///KB5+oyJzh0Jcgsm3f9jPYggMDdRysgZCE3J6yA+ztQbyIJ0gDvUyAkeN6w==
X-Received: by 2002:a9d:5614:: with SMTP id e20mr8212301oti.304.1617899523855;
        Thu, 08 Apr 2021 09:32:03 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id j10sm5546705oos.27.2021.04.08.09.32.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:32:03 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/11] selftest/reproducible: Sort the unused exclusion list
Date: Thu,  8 Apr 2021 06:31:05 -1000
Message-Id: <b406720d65135a898f04a92949b05ba0108c9970.1617899121.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1617899121.git.steve@sakoman.com>
References: <cover.1617899121.git.steve@sakoman.com>
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

