Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web12.13375.1619796900014329335
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Apr 2021 08:35:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=HlUX0QWD;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id y2so2545141plr.5
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Apr 2021 08:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=S0rMEBs93jvm6liGodu+mnOvcitcHN22FH3jrGjdTQE=;
        b=HlUX0QWDVk0MHZ7WVJ+Nthhct5mCLsZQ/to3RaXpO1kgnWPnj5gkYxFn0T1ggJRMCs
         eIWsEbrwgv1GkiZy1V5nIqvpwGgv6XWQVuK9CRmPSrTIhWXGnh/T9sF6eTx03+feq2O+
         DyUf3Vcs8Ba79z0NBbHtQ3n5ZKen7tKzYd3RCUOfkTneryHl31KKojlW5aGBs+NW9fUw
         dfUcmKQvrwWQATnw7AjAkHXv0m160EqB6UzpGUEuk3qd1xMQRujK5AazUwbfui/c7Nsi
         HWc+zC36JYQgxaZqD0mKyoj9HSE4ZLKNASc8M1FYpajCGyWfQdzPmoD+mYgxIE/iymyA
         EVlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S0rMEBs93jvm6liGodu+mnOvcitcHN22FH3jrGjdTQE=;
        b=ESmVHuItx3Xle1wJjUqmP3ZnpsuOH6MG80Rfigqifx/ajFhxYDmpzttF6fgGTq7jSj
         fywXAVWWejIuFl/ei4MeFtjoH5EzjDVdlbTmUsRgwgxXV6BFR0oZgqXxYfrUHNNo28Vy
         +ISz9/kRJOI80LC0Hvbb1v/GU8Nwa7RsSx5Mxy7pQD0hHawFUtY/RhFf5y2x9cPxeHtB
         JXgjXqfP4kwHFn5AWQ1zYudV8vLLKyHunoa6A5HDXqHevGqGahCNKDEQbAMNt0wHVB1K
         eGJRYLE4axPi7hlTU3MpwFQ02ZtqE15XzzDxPEBtwmzu9VgCFWw7wF3aGjOgDjNQ2q0d
         Rm6A==
X-Gm-Message-State: AOAM531OAtDT75aUy+nX2uiijPjMaGCPYRIrw110PsQQa+4dKgW96g3g
	8XrYYk6Wk1YzQ2Hd+gh2i/qhO4RfN7CMDh8m
X-Google-Smtp-Source: ABdhPJwe7gIVSPk01m213yN86qP7rfOMP1ZpiYeysBDy/vJriXJSLLKvjAgFYdxRvUq6hpshBZJwtg==
X-Received: by 2002:a17:902:8601:b029:e6:7b87:8add with SMTP id f1-20020a1709028601b02900e67b878addmr5779716plo.3.1619796899167;
        Fri, 30 Apr 2021 08:34:59 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id x9sm2900386pfq.197.2021.04.30.08.34.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 08:34:58 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/12] go: Use dl.google.com for SRC_URI
Date: Fri, 30 Apr 2021 05:33:46 -1000
Message-Id: <327b83f6460dc069f22e1ce68f09af12d25ce4bb.1619796615.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1619796615.git.steve@sakoman.com>
References: <cover.1619796615.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

golang.org/dl is resolving to this anyway

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8470e38ac1d9f9bb6d8a4ee43724af452d080057)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-common.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/go/go-common.inc b/meta/recipes-devtools/go/go-common.inc
index 39a681a712..c368b95b69 100644
--- a/meta/recipes-devtools/go/go-common.inc
+++ b/meta/recipes-devtools/go/go-common.inc
@@ -14,7 +14,7 @@ LICENSE = "BSD-3-Clause"
 
 inherit goarch
 
-SRC_URI = "https://golang.org/dl/go${PV}.src.tar.gz;name=main"
+SRC_URI = "https://dl.google.com/go/go${PV}.src.tar.gz;name=main"
 S = "${WORKDIR}/go"
 B = "${S}"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.src\.tar"
-- 
2.25.1

