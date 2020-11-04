Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.12376.1604495786037154214
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2020 05:16:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nathanrossi.com header.s=google header.b=YvKxbekC;
 spf=pass (domain: nathanrossi.com, ip: 209.85.210.171, mailfrom: nathan@nathanrossi.com)
Received: by mail-pf1-f171.google.com with SMTP id 72so10556746pfv.7
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2020 05:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nathanrossi.com; s=google;
        h=date:message-id:from:to:cc:subject:content-transfer-encoding
         :mime-version;
        bh=3qFupfOH+QFxQbDwORKVnqpb1DAWTJE/+F0bVjRDAj4=;
        b=YvKxbekCwFjDCajOZyUIpWknhzycE7/kqWlUOU4FfHUtWMGoII7C1YtB3UjfVFGvLF
         7O2Lpktn3Ni0MssSs8CwISTGYu93qDeBoXrqp07OGLyMQW6gkP7BwbeusohwpvUXlC1f
         PyB7w/1ip5OUBQHk/ThM0qalU3m1APExH99LH6RaoBtWab+TvaS8BHSGPw8NL12RLrJf
         s2PU4ZIENpPqDITI2d3H5im6ZPd3tVZslmX4NYPPGibOk74rCPqwRJI9mzM3spAW5mgU
         4DVk2tsLdEoLcD4GqLFgK4DjsG6hy7YQ1dAqD9DUHweV7GB7Z+o4r5dHnx8w+LgVUVMW
         kDig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:from:to:cc:subject
         :content-transfer-encoding:mime-version;
        bh=3qFupfOH+QFxQbDwORKVnqpb1DAWTJE/+F0bVjRDAj4=;
        b=tTcdmVkQeZHHx12YdVOYSxJS7F/XmU3zxjacfrSRcjv32hJ8TT/SDeeoUqKF82TWgK
         GkfJGnklNaw8HR+1HDaaId+vtc6FayzY9DDcLR7wZGinykDSFdKIlXHvH+rPTcKg3S9g
         px+fhu8yu0oLZJqAoMb0JY/Dyja1X0Gq5/VdXOFsySukTxyJCtrFD60oegOYLQJxFRyG
         Twuy8QDawQ93dE4hKQQNAjSHBQ76qYTT2jshsYjSSStXQ9EeKEPtbYpoE0C5/D6KpUBR
         OY49Lv+5gPbL9zZsGNR+U59d4Az8QGLAsQT449Kw/NIo6mTV8vAFT3HrTWtbpJmVShSO
         RDrg==
X-Gm-Message-State: AOAM530fn1+RbE38Ydry3TOfWJ6vql1MNZindsk6PIzszWUhEhfb5YR+
	+qqpF6vCDcVV7sxuco84OMRWrg==
X-Google-Smtp-Source: ABdhPJyS0hN11J76ipM1oyJTltJAorhEKPUnfzgKtJp9fCM9C8aRU3Ycb/AkFMijn2KKzotXgjteSw==
X-Received: by 2002:a17:90a:f211:: with SMTP id bs17mr4331588pjb.153.1604495785581;
        Wed, 04 Nov 2020 05:16:25 -0800 (PST)
Return-Path: <nathan@nathanrossi.com>
Received: from [127.0.1.1] (117-20-70-209.751446.bne.nbn.aussiebb.net. [117.20.70.209])
        by smtp.gmail.com with UTF8SMTPSA id 12sm2460590pfh.88.2020.11.04.05.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 05:16:24 -0800 (PST)
Date: Wed, 04 Nov 2020 13:16:19 +0000
Message-Id: <20201104131619.397588-1-nathan@nathanrossi.com>
From: "Nathan Rossi" <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
Cc: Nathan Rossi <nathan@nathanrossi.com>
Subject: [PATCH] rsync: add nativesdk to BBCLASSEXTEND
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-devtools/rsync/rsync_3.2.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rsync/rsync_3.2.3.bb b/meta/recipes-devtools/rsync/rsync_3.2.3.bb
index 375efa0dea..b7205e5bde 100644
--- a/meta/recipes-devtools/rsync/rsync_3.2.3.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.2.3.bb
@@ -55,4 +55,4 @@ do_install_append() {
 	install -m 0644 ${WORKDIR}/rsyncd.conf ${D}${sysconfdir}
 }
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
---
2.28.0
