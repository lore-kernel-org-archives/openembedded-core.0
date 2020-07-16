Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.3238.1594933694360272944
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2020 14:08:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RUwXmeTc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id z15so8571018wrl.8
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2020 14:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=6z7cxRJ89wFw4I+Hgt4swP7R7Uez6fag7fA/xwjC/f8=;
        b=RUwXmeTczAOHtmqkiGlpQcxx0SBj76FB7ZNp9LE+f5cfurODVdxgmzKbblPtEAyNda
         Qzm8xfmrr8zLrY0lrlxwrk6/fORZHVhQjig0ixoMuQDYsNeUbm5B3gLsIx3io78rXwIs
         prbBzSUhduwkBNIrtcdIJIBKzF0pr1IT4hDfQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6z7cxRJ89wFw4I+Hgt4swP7R7Uez6fag7fA/xwjC/f8=;
        b=sCyQuoSepLrC9Ui+tHFEaCF85V1DS4RP/dRa6woSbvU+VXQxWM2HY3bc07xwctB9ih
         YUVKcgLWrafjk8JBYUYZ8W9Ng2E0ivlpQ+V4MRyVVqsUkFSpdrIMrtppAINHH6lBXZ7c
         z+QQbtjxQ16Wr6eY0jaTELzSbiGuQMVftzpMEs8MvJMKqPOfhbn8C+P+ZeFXl+D4BWY6
         pyiITkwZNRF9Xr28BdU1a5LJcXf8QZrUsWMvA3rNpWXc4tVW9K+z2WgSvH3W2tmj7+8r
         H7c5cy0jSkOuwNiDf6+1AZfHczlaH3XgZH9STnhz3We6r2mbKFllCBDeungzzpYiFrN0
         yXyg==
X-Gm-Message-State: AOAM532KCybvzDnDA/GL9VH5uZNQDPuBzPiptN+xaPuLvJsN9REtfiS1
	ctwzaqX0pOBnpB76aYbgg4MN5SV3SR7Csg==
X-Google-Smtp-Source: ABdhPJxZ1Rqeu6clpXFuDfYzwA0JZ5nAnmtb5EFXK10HGGqKopH9NeySJB5LpUI44TEqyF3T6UK0Hg==
X-Received: by 2002:a5d:6990:: with SMTP id g16mr6651243wru.131.1594933692617;
        Thu, 16 Jul 2020 14:08:12 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (f.2.4.2.d.8.4.b.f.c.c.1.d.5.4.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:b45d:1ccf:b48d:242f])
        by smtp.gmail.com with ESMTPSA id r10sm10952034wrm.17.2020.07.16.14.08.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 14:08:12 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/20] createrepo-c: upgrade 0.15.11 -> 0.16.0
Date: Thu, 16 Jul 2020 22:07:52 +0100
Message-Id: <20200716210808.7438-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200716210808.7438-1-richard.purdie@linuxfoundation.org>
References: <20200716210808.7438-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{createrepo-c_0.15.11.bb => createrepo-c_0.16.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_0.15.11.bb => createrepo-c_0.16.0.bb} (95%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_0.15.11.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.0.bb
similarity index 95%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_0.15.11.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_0.16.0.bb
index 969894e4486..c6d89630720 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_0.15.11.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.0.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://github.com/rpm-software-management/createrepo_c \
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
-SRCREV = "ea3bcf302c1a071040e1a8b6ad77861c12a2ae99"
+SRCREV = "bac48ace91c51abe37792415e75452bbabd44d93"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

