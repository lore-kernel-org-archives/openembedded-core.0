Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web09.1453.1626403788589895937
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jul 2021 19:49:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eGFwciSj;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id 21so7638276pfp.3
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jul 2021 19:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=79V4liGDUzBQ1c55FyFNuC+AQEHE5nxQ40VHepA3J0Q=;
        b=eGFwciSj7HH5P3Oyi0sgQodKvshMHtIkmHzm91M+Xz3z5XAdj5IeqjXp6exFHftSf8
         ZDT5+hOwtdroCHP0qgv0mdne36tEvjhpOWPf2JnLTdCNFClvGLdSZHs1iJXlw+Vqgk9V
         xQmvxjxPNxsLOn0gicpYBQJw6pp5Bo1dhoJFCexpDAJSzo6hDHAD3XqknfpL8pID6Kz8
         XSXgTD84yQ2HhdHYP3wvNOWpkpcPLtHGiuvFcFtJmVCWlvjGXLzT/seyB8RFQ7YZhH0V
         2tP7kqfe8fyRBk/ZvLF4XWQH2bUGYuHpe8npsxYcEDYS0a+sPHgZVZfCxD4LEmMlABBs
         7qMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=79V4liGDUzBQ1c55FyFNuC+AQEHE5nxQ40VHepA3J0Q=;
        b=IJxlNQeZItjf41h30ZtrqtpH2dmmyxzbw6ocXz79MwvcutLb2j+Pi5OAnhdC8ktH9S
         N+20gf/izj1MPY8hkrFQy0rj0cpcBzA0lFbY8r+N02AX5MC1/6MknVz+fQ2yBWknd3xX
         Vz/sDNOM7fD9/iJN0CvRZpmc7kYVfm7iL9T8CP0V/ENx+vB4oYhwj1uaQk6yEMekZ8YZ
         2sGU75bZkVlxlnMbYuUS6Oj9JBuFOyu1JcM2ORS29H8IKgKpbb8kj3nRK/NjfRrYuysl
         4yDLJMYviQQHrcLyET7VnDYIYuzojjtGuobwepj+DC2m5NYY0CnVnZxrGJvkYgwTZk0X
         rLGg==
X-Gm-Message-State: AOAM530KEN2bXPMZOvGIMATKAMYn7GXRwZen/4FkmfN78YBNrCtznBh9
	wuVnXOqRWFxSe8G4VojCxjquMlt45oXziA==
X-Google-Smtp-Source: ABdhPJxjUFZbgMG9x5qZLqOEsVTPw/895zcg6QXOfmxqDTBl0i5hSGWy1txX+8GCyma8Z3HHKFz83w==
X-Received: by 2002:a63:1f0e:: with SMTP id f14mr3281347pgf.65.1626403787673;
        Thu, 15 Jul 2021 19:49:47 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::5593])
        by smtp.gmail.com with ESMTPSA id j12sm7675961pfj.208.2021.07.15.19.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 19:49:47 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] stress-ng: Upgrade to 0.12.12 release
Date: Thu, 15 Jul 2021 19:49:45 -0700
Message-Id: <20210716024945.2095082-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Here is detail of changes [1]

[1] https://github.com/ColinIanKing/stress-ng/commit/9d8069c2dc6060c8629ae8f9abbf6fd61c76bf7f

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../stress-ng/{stress-ng_0.12.11.bb => stress-ng_0.12.12.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.12.11.bb => stress-ng_0.12.12.bb} (90%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.12.11.bb b/meta/recipes-extended/stress-ng/stress-ng_0.12.12.bb
similarity index 90%
rename from meta/recipes-extended/stress-ng/stress-ng_0.12.11.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.12.12.bb
index d0cf45f42d..97eaa75d18 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.12.11.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.12.12.bb
@@ -9,7 +9,7 @@ SRC_URI = "https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
            file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
            file://no_daddr_t.patch \
            "
-SRC_URI[sha256sum] = "971393075321c24c3d5769acfabb705911d1f411ced5937b7cfea58528c1b4e6"
+SRC_URI[sha256sum] = "f27af50f6f2308e707fef927674bdd209a046b116734281b792aeca35a4e4499"
 
 DEPENDS = "coreutils-native"
 
-- 
2.32.0

