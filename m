Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web09.7551.1624360902338366291
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jun 2021 04:21:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DqhybcK2;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id m14so6434904edp.9
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Jun 2021 04:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=U2U+7mACfVme9QAIt5KuZIZXcMayGWsonFaW+7/hEfg=;
        b=DqhybcK2MNo0gEaHPZxsZmJjCKJsOD8XxrBoa6qUOBxd5H+pyzcvOzbJiNTd+6Tl5o
         27SqVuaKz1qSg3zDsIAmK/Wna5DSYWjfVogYNskB3E52ezOBDVVOv1ZW2Zh5pR/fndPA
         8XJT3wPKbPRu42YqtJVyPk93aIGtdpW4oEF9C1R5xtGI/PVZEurDB1pcNlkPeVxI8zPx
         Zs1BY7wWbtK5CzWFA5vV1kstFiT1WI+prYXlhcDlCWEFB9j7J4s1AQ6aX3Ehb+tiBS/E
         AvLN35Vfb6wcoJxytDEtkg+fQftTxsJCQX8f1ZUgH9CI7/9KKNjM2w9uI0fNFkgO9q4D
         Kd1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U2U+7mACfVme9QAIt5KuZIZXcMayGWsonFaW+7/hEfg=;
        b=n138hsF2eZDLOYKv7nC2hFo406paNGTHgZKaTuNPNDDDZcYm4/Vu6OKkHAPyIcTxqo
         xFdDmp1Aslj8IFbfxIYZe8K9n5ZolFRj5B39owM/1rZQA0+Ic0SRQ4XNEY6dCELu2djE
         KJnDPQ3pw4I+BvVayj0JDzjcp38Ak/Ak7KNWRLoyR0uRrMZdLHW1vWeNua7XtpghwCdS
         M6+CX7x7yjL2yjaAQ/1PE+6McXJGqApwQcYAqfP0KMP0ZM7/fob45N6OkGUqhJ7qKSrD
         Cto+JsRwWAfq9TrDN4tS6GqNOAH+U38h+ySdWRuC6ymbLU9Ft8QVq4Nnlg5PzGIIKSBg
         KNhQ==
X-Gm-Message-State: AOAM533FQ3gcZLYXvk5CN+wp5Wlr6ULyFaYweRR6GCIMNzlFB4OlyXc2
	PhiIPYrTQQKNF4XUbuRn1+vE1KDAWOJqDw==
X-Google-Smtp-Source: ABdhPJzUx/HLcWIRkfjr0xkuIRxtJTsaMm9SBZh7Zn+Jm6basJDbLk4di0/QshEXvEr39+axwN+AqA==
X-Received: by 2002:a05:6402:d66:: with SMTP id ec38mr4293075edb.212.1624360900969;
        Tue, 22 Jun 2021 04:21:40 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id n2sm11987416edi.32.2021.06.22.04.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 04:21:40 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 16/19] sqlite3: upgrade 3.35.5 -> 3.36.0
Date: Tue, 22 Jun 2021 13:21:23 +0200
Message-Id: <20210622112126.2026646-16-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210622112126.2026646-1-alex.kanavin@gmail.com>
References: <20210622112126.2026646-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../sqlite/{sqlite3_3.35.5.bb => sqlite3_3.36.0.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.35.5.bb => sqlite3_3.36.0.bb} (83%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.35.5.bb b/meta/recipes-support/sqlite/sqlite3_3.36.0.bb
similarity index 83%
rename from meta/recipes-support/sqlite/sqlite3_3.35.5.bb
rename to meta/recipes-support/sqlite/sqlite3_3.36.0.bb
index d74a6210d5..f5d75e8e4c 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.35.5.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.36.0.bb
@@ -4,7 +4,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2021/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "f52b72a5c319c3e516ed7a92e123139a6e87af08a2dc43d7757724f6132e6db0"
+SRC_URI[sha256sum] = "bd90c3eb96bee996206b83be7065c9ce19aef38c3f4fb53073ada0d0b69bbce3"
 
 # -19242 is only an issue in specific development branch commits
 CVE_CHECK_WHITELIST += "CVE-2019-19242"
-- 
2.31.1

