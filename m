Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.33587.1612781987082644363
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 02:59:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Zm/ahXTo;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id bl23so23887799ejb.5
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Feb 2021 02:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/kPTOLseDD2C4BzkJtdJLOuucIcy6boXnSs2sXxWY3A=;
        b=Zm/ahXToBn1PVyCInVIvhCSMU6fUGhWTgS1rAIUhJ1+M0OsJ25sV2ziBH86Ohv0kOX
         p8IjQZTKmU10uWEbp4XwwCUUuKQL1nqEYWcGcwAITkB/M5/hrt4P7z32kSoGnz4Gw4Uy
         Iu0sFVPsdxR6FU17mNzsTOXBW9fM5AQUBizjx+nZRz8IPu0ZdcdOxxvZFXGDDtvdwxM/
         v0jSUw/J6DOa/VJEzxf2usk58tpY/ZuR1iB6CvnSqeqSZDOf9Et+KobCRVRy9HjEwN/T
         SHB5O/hRNgTRFIH40+pGdQTu3GT8cD427m1r+gL2zv1XnF6FnAIElpjwdVGz/PCGD8Nb
         o6bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/kPTOLseDD2C4BzkJtdJLOuucIcy6boXnSs2sXxWY3A=;
        b=ZXxeO5vqXxZUAQ2nxDsE+IocsmEryeyiKpTE05QfDrNqL7xDGUKeVOUl6Ex4ULKK0g
         lssQ47173Vm49zXg3aVxS5Eh6aeVx2f9G29E7Vom35sVVkc4/5PUchdDKOr0kMs/vI1Z
         VKAYX+KH9UQpv+BU7J7dNX8GNLgVi7EemESzlmymsXjJY+eEmK+qFEUvMMw/HDtgqqdk
         79lHhkI1J0/NiDWya8LFmxbqPDvdMZbg8IUWjEpUqfAjoQlzs1fi7y8vMzTfrTMc9wWf
         WMSRAg9NDi6bELxz3rwCCEwYS3iMI4A1HfwHLt7XE7Mm5MlPm8NSkGQ3SsiOG5eHRt1H
         R+cg==
X-Gm-Message-State: AOAM531FFCKaxCCQlMmo6t8K+QtrVxhSqPvFSFlVloStGsAOMBuLzuof
	5U0NjZNojp83SXcM3zYCTYJjv7JNeNNgvg==
X-Google-Smtp-Source: ABdhPJzXgej/aBrK7cinhJTDtInQCQpzd4vAfNCZ/PbzfWRYoZWx8JOdO1HKI3pGl1Z1RGw8yqtMnA==
X-Received: by 2002:a17:906:b09a:: with SMTP id x26mr16570967ejy.199.1612781985702;
        Mon, 08 Feb 2021 02:59:45 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2450:1011:512:45a5:1b3d:84d2:e7fc])
        by smtp.gmail.com with ESMTPSA id t19sm8382226ejc.62.2021.02.08.02.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 02:59:45 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 10/12] at: correct upstream version check
Date: Mon,  8 Feb 2021 11:59:30 +0100
Message-Id: <20210208105932.347925-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208105932.347925-1-alex.kanavin@gmail.com>
References: <20210208105932.347925-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-extended/at/at_3.2.1.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-extended/at/at_3.2.1.bb b/meta/recipes-extended/at/at_3.2.1.bb
index 9574b27792..ae15df8662 100644
--- a/meta/recipes-extended/at/at_3.2.1.bb
+++ b/meta/recipes-extended/at/at_3.2.1.bb
@@ -39,8 +39,6 @@ PAM_SRC_URI = "file://pam.conf.patch \
 
 SRC_URI[sha256sum] = "aabe6e5cb6dd19fe9fb25c2747492f2db38762b95ea41b86f949609c39fb55c4"
 
-UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/a/at/"
-
 EXTRA_OECONF += "ac_cv_path_SENDMAIL=/bin/true \
                  --with-daemon_username=root \
                  --with-daemon_groupname=root \
-- 
2.29.2

