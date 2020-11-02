Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web12.1187.1604335809270193930
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:50:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uHzDqyz3;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id e18so3872047edy.6
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HifhT8MY8HEFZ2HtoCIJJ33AEJ4UyyKIz0QBYZXsrG8=;
        b=uHzDqyz3wWjakx/Bp8GjXONW8m4Xe2UWGae/tKTOgbW/pn2iOaUfbW0OTAjRK9qx74
         m9xbMdioAssHyc94tACwEHwLcXtcFUPueKbl5JIWrAnXRc/ps2ZCiE3/Dq7D232jeWtG
         7aYes7FBiiieF8LU4L2tPT0DLX9L03YaDv39AlTvPC4plxREmXy4n3QHKDDMjqfoxp5H
         qvDkDv3Fl45APaE0UgJX4P1pEFj6OKUejdXr3RSFyO1UUoam9jB6NqaS7SsIluuD5XHQ
         vP7jyINt0fMInw5FueV9tzccTpFhW2oNonYnW3XNOYFEBHvgbpsVEhkmRzK56RLtf4LI
         3llQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HifhT8MY8HEFZ2HtoCIJJ33AEJ4UyyKIz0QBYZXsrG8=;
        b=uExKkfmVqaBTaBIk0j/AoaLUgtMOUzEK0A3nA2NHhvujQjnw/9NrZRGLHgdr5mOjNY
         31F9R0hSldYbC/fCkS14+0Lo3VnMuCQ7SSb5YTioCw7lRmXzWsM+OcfNwhI81TLKds4t
         rFDWpj82dNm+TSiCW+cEDylRibFm8RP9D2gWa3iaOp4pMDrkF4saOyc/f6+GtPNpf7Z6
         XKC7snw/RWjn8EubEcFCfvJYdSx/noxKCKWt2U0VxqxmQJ6gBnCWVxhR0KU6zU3jzVZv
         QIthFzLXq8fGlmvgCYoo23GUFSEqgJHlI0VbKn9CWJtg/XzMz1q+zhK3x2Ah5lHdz71T
         47rA==
X-Gm-Message-State: AOAM532NWmBDnpUvBE7jUUPLlt/0RvBykearbf6x57ckGxCS5ylvgGSd
	2sQa55+lznZXjf8RC6s07IK+MPnyLX77CQ==
X-Google-Smtp-Source: ABdhPJySpuqne3QOYTv5J01YNjGXImoBR99tRJIB6NJq0t6G/2/QhsExVfcQCtMFw5KcG46pSAOXow==
X-Received: by 2002:a05:6402:6d8:: with SMTP id n24mr17561176edy.168.1604335807655;
        Mon, 02 Nov 2020 08:50:07 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:50:07 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 56/80] python3-git: upgrade 3.1.7 -> 3.1.11
Date: Mon,  2 Nov 2020 17:48:43 +0100
Message-Id: <20201102164907.27572-56-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../python/{python3-git_3.1.7.bb => python3-git_3.1.11.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-git_3.1.7.bb => python3-git_3.1.11.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-git_3.1.7.bb b/meta/recipes-devtools/python/python3-git_3.1.11.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-git_3.1.7.bb
rename to meta/recipes-devtools/python/python3-git_3.1.11.bb
index 6d1fc4b653..7c636572f3 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.7.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.11.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "GitPython"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "2db287d71a284e22e5c2846042d0602465c7434d910406990d5b74df4afb0858"
+SRC_URI[sha256sum] = "befa4d101f91bad1b632df4308ec64555db684c360bd7d2130b4807d49ce86b8"
 
 DEPENDS += " ${PYTHON_PN}-gitdb"
 
-- 
2.29.0

