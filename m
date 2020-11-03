Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web10.4203.1604410958432346057
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2020 05:42:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KRiwyyka;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id c18so12801148wme.2
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2020 05:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e39qAXFnFBuK6p8LFsUAlBiHq9iMxEh/QdcRxNbRFrc=;
        b=KRiwyykacw9yKctCijqo15xtys8Aqds7UpwvJXCLGJb+JQrl83nW6cpeAIlutL2r8s
         KGmo0zXZSFzICKo7ocSH66yvXr109q5/Si4xEeMlkTGMqG6DM/2UfX9wDm7cGb6duNo3
         /jau0i0sTdsPkfeXYLGnpZsPo/CeFrICMaf1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e39qAXFnFBuK6p8LFsUAlBiHq9iMxEh/QdcRxNbRFrc=;
        b=lJChmW2x9e9Zl+rSvKRuv4nuP0iw4Aj5CAfXPrAoUEg0SWwIoOmTAkVl50G6RbqjVL
         dtVm0jgX6DL83xnMennmYcTAJ1jw1Be7dfaTz5ZdntU0hLE5jWJKl1bVrKv0xZQ9s+bt
         yxS5VSwoG9L3AHE05BOGNwjM7CuvjnOGKL0jcrRJOdANrFT3UPW7RxJ/3T7jRqHkvQr+
         Dp2FlSh/M+jnXggxETzEs4hjSVANBmxdx7Ow+tPddvkHQJU3CSA1fSuL1DVFK/xoYC6p
         /en9pj37n4QILU+ryhaMHB12GLJlMIaCMDHfLqarz47lJEO97xUmjfHpE3VPnvXDEuC8
         gS1Q==
X-Gm-Message-State: AOAM532s4uoHulWXtwGXUINqB4z3sn6pLDEKDHUz6VdlgXsy8vVonf89
	Dc8KnaYtJt+oiiEGdDcGi+Z6P6VG5I5RcQ==
X-Google-Smtp-Source: ABdhPJyTH+y0h75slKEviU+2gzh1TxANwh52vlCZycCbPfCTB5gR3+2KanophA4DwOu2EyUSt7VASQ==
X-Received: by 2002:a7b:c0d7:: with SMTP id s23mr3945811wmh.54.1604410956685;
        Tue, 03 Nov 2020 05:42:36 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (d.3.f.c.c.4.3.5.e.4.0.8.b.a.1.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:11ab:804e:534c:cf3d])
        by smtp.gmail.com with ESMTPSA id e3sm26426089wrn.32.2020.11.03.05.42.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 05:42:36 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] ptest-runner: Fix license as it contains 'or later' clause
Date: Tue,  3 Nov 2020 13:42:33 +0000
Message-Id: <20201103134235.423940-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The license headers are clear that the code is "or later", fix LICENSE
to match.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb
index 10b4c5b6a40..8b9938f572b 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb
@@ -4,7 +4,7 @@ program which loops through all installed ptest test suites and \
 runs them in sequence."
 HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/about/"
 
-LICENSE = "GPLv2"
+LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
 SRCREV = "834670317bd3f6e427e1ac461c07ada6b8936dfd"
-- 
2.25.1

