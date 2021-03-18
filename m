Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web12.794.1616093513501653593
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Mar 2021 11:51:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=msjbhq3y;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: petr.vorel@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id v11so6640306wro.7
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Mar 2021 11:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q/RTeS8CLlpGqLsytYv+a6si3av2aUsAvSletBQHFU0=;
        b=msjbhq3yxs3nEZZBm5D+kuGJJGW2Ei5y8N5H0aQO24F1bvsGkWsa8rUyx94UYPxuxJ
         nmXXMob73krZdjDBukN+/S1vuzoAhRBN8gi3jnb44+X1Sof28Xi3AXqLVnjLB48aSJVE
         iFoJd8f06El/YlZEIgJ3akGcMvq/R0NFn0OGiytQ/FOBftYATJxjKbl/X+31V/98YzOx
         ychfDzNi5o6y1VxmAVSDa0J5lZX3hFtpo2LfBi2iRh02sAC1qF5GvowG7WyR8YZBza3j
         xP8cJBaA+XDrX7eqsEoR5DmLbMkABBFEmlsEM/sAUAKO7aKy9QAoH6QUy7uT7eeZ/737
         l9aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q/RTeS8CLlpGqLsytYv+a6si3av2aUsAvSletBQHFU0=;
        b=nGlIv8TNMyJJ++KqM1vADdXWcD/DI2nX6DmoK7qcIpwYlXQLXsr8JA7SRo++Je6d3T
         oc5zaSt6gtRiy6G16bTgHTpyyE0RcSwod3xJmndidrs6a3p28TAR+fqdYtvh6YqTcTiC
         pL/3tPp5cJSaBINx3qo9heTwEzvEkx+j1aAK1kPnI0uOgJkMsmmGnnGNDvo7vx3YbNZX
         bQefC90WyFpfHKf8U26UesIL0sgqH3JeLt8LY4T4RP+S87Z+1TwbQ/VUmqTYck4gv+2n
         gIoCtY0aItBvZdWmniW+0K1onOslX6Ezykhbpc9vpw063IF6rr7wIQqyUgey+vjE/00O
         AujQ==
X-Gm-Message-State: AOAM5316lZXSBFMxR7ZzwH09d1wXKatzFne3rNnIEjjbXm3yPbjurxGG
	FCSI7dXzxGBJVCDQsP+zATT2LxAegihJNw==
X-Google-Smtp-Source: ABdhPJyS2uF2JqS1H1y1FEu6SBIyUb6DH/Gimaxgy0hXbmMxu0a5xqDux4Nj6dkvBbeToFE84lAw5w==
X-Received: by 2002:adf:f351:: with SMTP id e17mr683209wrp.416.1616093511820;
        Thu, 18 Mar 2021 11:51:51 -0700 (PDT)
Return-Path: <petr.vorel@gmail.com>
Received: from dell5510.suse.de ([62.201.25.198])
        by smtp.gmail.com with ESMTPSA id z2sm4706449wrm.0.2021.03.18.11.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Mar 2021 11:51:51 -0700 (PDT)
From: "Petr Vorel" <petr.vorel@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Petr Vorel <petr.vorel@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ross Burton <ross.burton@intel.com>,
	Patrick Ohly <patrick.ohly@intel.com>
Subject: [PATCH 1/1] verify-bashisms: Update checkbashisms.pl URL
Date: Thu, 18 Mar 2021 19:51:44 +0100
Message-Id: <20210318185144.14459-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

anonscm.debian.org is not used any more.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
NOTE: salsa.debian.org temporarily returns error 503.

Kind regards,
Petr

 scripts/verify-bashisms | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/verify-bashisms b/scripts/verify-bashisms
index fb0cc719ea..14d8c298e9 100755
--- a/scripts/verify-bashisms
+++ b/scripts/verify-bashisms
@@ -100,7 +100,7 @@ if __name__=='__main__':
     args = parser.parse_args()
 
     if shutil.which("checkbashisms.pl") is None:
-        print("Cannot find checkbashisms.pl on $PATH, get it from https://anonscm.debian.org/cgit/collab-maint/devscripts.git/plain/scripts/checkbashisms.pl")
+        print("Cannot find checkbashisms.pl on $PATH, get it from https://salsa.debian.org/debian/devscripts/raw/master/scripts/checkbashisms.pl")
         sys.exit(1)
 
     # The order of defining the worker function,
-- 
2.30.2

