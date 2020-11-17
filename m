Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web11.10265.1605629674605038729
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 08:14:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nyDOjNin;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id w188so23124195oib.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2020 08:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5wdjQ0wdUWzKATwCzgt31GT7OcHsOVnHFx9lmiR83Hw=;
        b=nyDOjNinBmHNTvH4midSfa5F1QShVkArp8Xdc7YR2kAGJ8OdIav3BytPxXLNtFQZ3u
         QadtVnjWJaOZs4istsEgeqe8Hje5aQIjK+fKus57Q+VW+4oF2IRZpZ4FzpnzzFLHH0Nb
         7H6VtQJwCGYVrX7ZWJ4Cfzp8UCPnffEVv+Xo/anqFBLHIc6Qp+quEpOrEue2YCW1nL/6
         fht3h1Rk4q84d+Hwe5h00gZC1f8MhlaOdTLnRGMF7w9+tlhDVDN3sz3RAw5RuokujhQ+
         LZNVQGflkH8CCMEhou0lpD2rEAaiJZkonUF7X2f2qg+2qfFI5gLQoRB0DXJYqNI1PZeQ
         7M3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5wdjQ0wdUWzKATwCzgt31GT7OcHsOVnHFx9lmiR83Hw=;
        b=Jf7ZZzNMzltKS+Lmm6HCE6xeODgcf6B5WA+44dqJst/7oxS1OjyYxA3vmvKpnpuyF9
         xXm13LPgOkHVEF3ccByggyPf0Cdht8KtpTeHMBQvA41wsQmzuNaBb1O8SCrrNskPj3oA
         kOcJySpillfEQytgu7TiAzRIm1u+9qz9WS4AUYsXqx3Q1v1HcR2EMnbvvlviVMw7A00j
         sUKfuR7Erne6+o+Wc7RPjzW/7B5VfGa9Xkc4KTNZGFKOKZ10sOLu23QgU8VOMA/3QcMt
         keWKYFg7SK1FHXXD+tx4qMNIdWFqpR6pWCfP+b9U6yXexctoVZB1H/lsD0/5DyyTGzL0
         wPfg==
X-Gm-Message-State: AOAM53158thm+rFG1qNyrZ2n6oa2dyDeGuhnSYyxwTFYDfqVDhki//NT
	J+29LN2Mosdo9mEA7VBrGxjvbhBg5jqOug==
X-Google-Smtp-Source: ABdhPJxhlxuygkH9nLIVb0+nzJ/YYnQrGyUo9Ljvubxvy8acWSqTX8XBCuYeUnL177eJ9OuEXG9kJw==
X-Received: by 2002:aca:bdc4:: with SMTP id n187mr2653268oif.154.1605629673567;
        Tue, 17 Nov 2020 08:14:33 -0800 (PST)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id m29sm6102970otj.42.2020.11.17.08.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 08:14:32 -0800 (PST)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] python3-pycryptodome: upgrade 3.9.8 -> 3.9.9
Date: Tue, 17 Nov 2020 10:14:28 -0600
Message-Id: <20201117161428.30796-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-devtools/python/python3-pycryptodome_3.9.8.bb | 5 -----
 meta/recipes-devtools/python/python3-pycryptodome_3.9.9.bb | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-pycryptodome_3.9.8.bb
 create mode 100644 meta/recipes-devtools/python/python3-pycryptodome_3.9.9.bb

diff --git a/meta/recipes-devtools/python/python3-pycryptodome_3.9.8.bb b/meta/recipes-devtools/python/python3-pycryptodome_3.9.8.bb
deleted file mode 100644
index 46e122072e..0000000000
--- a/meta/recipes-devtools/python/python3-pycryptodome_3.9.8.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require python-pycryptodome.inc
-inherit setuptools3
-
-SRC_URI[sha256sum] = "0e24171cf01021bc5dc17d6a9d4f33a048f09d62cc3f62541e95ef104588bda4"
-
diff --git a/meta/recipes-devtools/python/python3-pycryptodome_3.9.9.bb b/meta/recipes-devtools/python/python3-pycryptodome_3.9.9.bb
new file mode 100644
index 0000000000..1e84ce4df7
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pycryptodome_3.9.9.bb
@@ -0,0 +1,5 @@
+require python-pycryptodome.inc
+inherit setuptools3
+
+SRC_URI[sha256sum] = "910e202a557e1131b1c1b3f17a63914d57aac55cf9fb9b51644962841c3995c4"
+
-- 
2.29.2

