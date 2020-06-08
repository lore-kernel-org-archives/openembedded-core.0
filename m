Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.25175.1591602500269187085
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2020 00:48:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=o2dSgAOB;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id n21so2716863ejg.3
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2020 00:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DuL2rkX8J9wghFhg2qzhAC32ii6CKumBcKMdalosm7U=;
        b=o2dSgAOBOZbz84QEtztkXzxWsXScQ4DCFNVlI6fRamjngG0jVJUNbgyDqA+jMKrwP2
         M1Y0VtLdtotd6cveDVYfngK0CD22+6pxkrkqT+SvVnEcQyA+waKDCMLUfeg43Te0IGBx
         lNAMD9AlBVM0IEZzFfE5UGNkMHHxAT0tug025R2Ay7yLwtq1hw7FJRd4kBh3nTNsgopS
         Nw+6tCn57WURJR450WBhpwpc+EG3j/DDS7B8l93F8GGBsWectkETO7Dy14e765MVgBIH
         MVib3HraJaduEoYnMc/xZDfY9vI8RFFI4Y79o3XB+AuzZ1EUXXYHmYrOs67JjDFrFz1f
         XNDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DuL2rkX8J9wghFhg2qzhAC32ii6CKumBcKMdalosm7U=;
        b=TISpqqJTPZ4OJczMokLX+iY+7ax7+ix6QJOqAqqVvVKO+m59YI/7Z/w0OM3GpmNQVk
         HY1qjxMHLfIO+SKdhGMGaTzzV90F2sHE2hd+hOnMJzxmay1MefoRojokz+vafoSSin46
         VTVIbHkHTd/8mJ7FJpIYz+ulb/X2LWrI/+Yh3P+r+WfWbi9r+V6F5U8D7p7WWsC/ahb7
         RtrCIyk+7mNQ16TJ1A0P486ZBdn0PCi4rssQakpCko1MtiAycZRnrhBhE3EG1G+X4yul
         ftINmUzR9JqlgcVc42iunjLkp7wBfU898peZjyPxbt8a0T0QKnBEVafF8eOvzJNA2lG1
         to/Q==
X-Gm-Message-State: AOAM533yIFuBIiWRvbo7M4dvHfRZxuVtTYO/cfu0kABW3g0coNtuAhQr
	txDufMGAFqw9mxw6FSrrFTWoibAey1M=
X-Google-Smtp-Source: ABdhPJyHJlvQY9mTbF+h9ywmsV+g5pQEBwVB4HX3+gksmViCCkYe8gaDszciemBIn765YbWrtALgaw==
X-Received: by 2002:a17:906:7c5a:: with SMTP id g26mr19900208ejp.200.1591602498566;
        Mon, 08 Jun 2020 00:48:18 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.66.228])
        by smtp.gmail.com with ESMTPSA id g22sm12473466edj.63.2020.06.08.00.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 00:48:18 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 07/42] python3-git: upgrade 3.1.2 -> 3.1.3
Date: Mon,  8 Jun 2020 09:46:24 +0200
Message-Id: <20200608074659.7051-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200608074659.7051-1-alex.kanavin@gmail.com>
References: <20200608074659.7051-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../python/{python3-git_3.1.2.bb => python3-git_3.1.3.bb}      | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-git_3.1.2.bb => python3-git_3.1.3.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-git_3.1.2.bb b/meta/recipes-devtools/python/python3-git_3.1.3.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-git_3.1.2.bb
rename to meta/recipes-devtools/python/python3-git_3.1.3.bb
index 72280ec30d..064868d858 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.2.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.3.bb
@@ -12,8 +12,7 @@ PYPI_PACKAGE = "GitPython"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "2397bea2d7c36ef9f874ab6355abae59"
-SRC_URI[sha256sum] = "864a47472548f3ba716ca202e034c1900f197c0fb3a08f641c20c3cafd15ed94"
+SRC_URI[sha256sum] = "e107af4d873daed64648b4f4beb89f89f0cfbe3ef558fc7821ed2331c2f8da1a"
 
 DEPENDS += " ${PYTHON_PN}-gitdb"
 
-- 
2.26.2

