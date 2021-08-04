Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web08.304.1628110661143507452
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Aug 2021 13:57:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SqgxEY+O;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id l19so4895181pjz.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Aug 2021 13:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nqGwdSdzl12ljFHzDr7h8SgRJPsNlRtWMXMlNQXGgZs=;
        b=SqgxEY+O408wowVW9qGNu/XQaV2BPC4m5fJ3+S9qHub2jEUiAiXxaxtH3iw2c2bwMp
         0J7+9lsjrOOTMSzz3Yo4h7T3K1CbtVS//fYshyg7TNCBmSSl3vxP6QC3k2u8w4t1e6gW
         XNz5mUGnf9uCBGVTdsIiXCxEH8/ltVZ1nJ8bsZ0QKfzSzXQXMMTx8NkkT92Usy2ONm0S
         9iSUvl4U8zuiY8hfB8x/KDe5ya0O2m74XQAdOk1G6CIN2yOhZhqgdz9IaMOGcxcNHM0p
         ahgBxXS2cDFVq0v09YO/bCui6xUy/+5DnXSmxStYOUyWQlIvzv4zfl3OSU7+BXhIgMI4
         /sgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nqGwdSdzl12ljFHzDr7h8SgRJPsNlRtWMXMlNQXGgZs=;
        b=CbiEfmIehtlxe1xEvB0ESa9Ze1Efc7Uroym+Z8A6UPjpkU7FUC20q8hru2eErUyZTB
         BrHc6fZHMGoRvZJkP3gkads1Ylt+MoX4+ymCpVq/mBWiCwAAxx5kO6JEWJZvnuDSTNiD
         vPCYMeP7/SUKBy22rh7s/N9TeEmwPjsceq+u6CmQE5vGjbZX643YGWFwFpg/iHyi7VLa
         yw1R1JdzS8DJGTGUMYvUgfIlXobwWZcW3eGW1dWCBwMn1sjrmiJYjjnQmHgtftT9SByg
         5RDijYmMpjjMRESJaFwNpTZ2otwCpVZIe2MNj8hdlVwXA7ryyQzuzqcP+gbJn31oYYwg
         duDg==
X-Gm-Message-State: AOAM533GI0kjm//deD5jPAvSPPNXGWiaivSxwKA9QPDb+5cJ5ujeQCSx
	TCCKQCz3say7Yhf7XbBzT0fJtJGIR7g60A==
X-Google-Smtp-Source: ABdhPJy92Hc00AqlnGOPOcYQ4eg1E0UuW6+SBDzZwLaD8mWoLG89VMdksLCFsty9Xk2tpAQkYGRlIQ==
X-Received: by 2002:a65:450d:: with SMTP id n13mr242527pgq.13.1628110660323;
        Wed, 04 Aug 2021 13:57:40 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.hsd1.or.comcast.net ([2601:1c0:6000:1830::6173])
        by smtp.gmail.com with ESMTPSA id v7sm3338761pjk.37.2021.08.04.13.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 13:57:39 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Subject: [PATCH 1/2] python3-hypothesis: upgrade 6.14.3 -> 6.14.5
Date: Wed,  4 Aug 2021 20:57:21 +0000
Message-Id: <20210804205722.1206598-1-timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

6.14.5 - 2021-07-27
This patch fixes hypothesis.strategies._internal.types.is_a_new_type. It
was failing on Python 3.10.0b4, where NewType is a function.

6.14.4 - 2021-07-26
This patch fixes from_type() and register_type_strategy() for
typing.NewType on Python 3.10, which changed the underlying
implementation (see bpo-44353 for details).

References:
https://bugs.python.org/issue44353

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 ...ython3-hypothesis_6.14.3.bb => python3-hypothesis_6.14.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.14.3.bb => python3-hypothesis_6.14.5.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.14.3.bb b/meta/recipes-devtools/python/python3-hypothesis_6.14.5.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-hypothesis_6.14.3.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.14.5.bb
index 63101aad69..0460a43198 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.14.3.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.14.5.bb
@@ -7,7 +7,7 @@ PYPI_PACKAGE = "hypothesis"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "1c8776d9fc8c598cf1b93b99bd87976f9d9b589fc58843d85a30090700f14a8a"
+SRC_URI[sha256sum] = "0563b9711fd9bf478cb591580a575c369d2c396f283efa85d0f9a75b26db65b5"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.30.2

