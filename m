Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.web12.817.1614187700065259303
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 24 Feb 2021 09:28:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=n7/XpnNz;
 spf=pass (domain: gmail.com, ip: 209.85.161.51, mailfrom: aehs29@gmail.com)
Received: by mail-oo1-f51.google.com with SMTP id x19so691680ooj.10
        for <Openembedded-core@lists.openembedded.org>; Wed, 24 Feb 2021 09:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o7pa5ovRhABFFhBKbQFXqOCN1YVVX0iSdEE2vp0sLSU=;
        b=n7/XpnNzKlEF9g2XuLihAmcjjFxt14PnunZHmAVFVGNkAfTn2foVJjtKM8ehIJfLLv
         WLDSBeeDK3J3rKezG84adB96eTASjJeu4CcmlUPSPcnUjTGCjz4FpH55um77rN7wTgQV
         /TkFliH7YvO8nUEb3/4RNtiDOipFJlf9UHUOl9eHBTyfoZCDQcyxMh59h7ZMKQMI5Ssy
         StIOB9uYmI95f217nCZuIhgkvjnqAJIAO8Yc1eYhoocKZp9G/EWw71C7bLpSpFbF+9ts
         Dja3i32GPxhIx8sbZn1+Y5hPh3Q9ny31JPrAiCu+YJEN5Yd/CTGHon2K7O8EjSW1I3sr
         DJDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o7pa5ovRhABFFhBKbQFXqOCN1YVVX0iSdEE2vp0sLSU=;
        b=flGSk4BnRNmzDTZqRu/LHGSTS6B14mFyGsFPgT943ZjNwbwegZYWGgOho6oxlxqJ6L
         tl9FBpLejDXJfrWVaMHmjqtmJWtuaLeFalFZTXsi+2URVD2C5Oi8GP/1Zr6oW1U1mXvn
         ZA/uDMAxq0NyXdBsbgLkUFg9rDCUp1lG6u6JsCNgIo1E6L891NGKTSDGSXX/vTs7JoRM
         9xwF8cBmNTgVL6kN78For6cMvrbkqQz10rw0QMoQNo/AQbUUKMnx6r23Sof+V8utShns
         Hw0a1FWiybLz3W15z7c2NZHqW5uIZ7ZiYEGIdoO55ePPDmbfGD7sJHCl1z2folyNsuCQ
         idfw==
X-Gm-Message-State: AOAM533dWW0iusUiwQ5FZ1Q8/nAisHjRDKpVHl9WtnntQn2GIJlzab03
	O7IGrtximXmjfat/JSXiaqTBcLb5Xuj98Q==
X-Google-Smtp-Source: ABdhPJxZS2nxdMDhKCZxWfvjENXnNTj/+7u5R0p348brZBGXVH0MvkssoKEsKt0rfc5MrQqBke/Hng==
X-Received: by 2002:a4a:9bdc:: with SMTP id b28mr24724522ook.48.1614187698466;
        Wed, 24 Feb 2021 09:28:18 -0800 (PST)
Return-Path: <aehs29@gmail.com>
Received: from alsamon-xub.lan (cpe-68-201-52-49.elp.res.rr.com. [68.201.52.49])
        by smtp.gmail.com with ESMTPSA id x126sm465957oix.5.2021.02.24.09.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Feb 2021 09:28:18 -0800 (PST)
From: "Alejandro Hernandez Samaniego" <alejandro@enedino.org>
X-Google-Original-From: Alejandro Enedino Hernandez Samaniego <alhe@linux.microsoft.com>
To: Openembedded-core@lists.openembedded.org
Cc: Alejandro Enedino Hernandez Samaniego <alhe@linux.microsoft.com>
Subject: [PATCH] sanity.bbclass: Add az fetcher to accepted URI protocols for mirrors sanity
Date: Wed, 24 Feb 2021 10:28:15 -0700
Message-Id: <20210224172815.2127738-1-alhe@linux.microsoft.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alhe@linux.microsoft.com>
---
 meta/classes/sanity.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 485173ab48..894f0e3107 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -895,7 +895,7 @@ def check_sanity_everybuild(status, d):
     mirror_vars = ['MIRRORS', 'PREMIRRORS', 'SSTATE_MIRRORS']
     protocols = ['http', 'ftp', 'file', 'https', \
                  'git', 'gitsm', 'hg', 'osc', 'p4', 'svn', \
-                 'bzr', 'cvs', 'npm', 'sftp', 'ssh', 's3' ]
+                 'bzr', 'cvs', 'npm', 'sftp', 'ssh', 's3', 'az' ]
     for mirror_var in mirror_vars:
         mirrors = (d.getVar(mirror_var) or '').replace('\\n', ' ').split()
 
-- 
2.25.1

