Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.17621.1590940420835172887
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:53:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=t2fvHpMU;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id s19so5390610edt.12
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i88wOiG+4XO4eHQB5ir1HOy2s+rWWyy8dASmR4mjaXk=;
        b=t2fvHpMUN5YJgB29Ap/kbCtATD7X7OtnQOF3qf7qM5HpA06uOhRZRANUr0TMSzXAGd
         nnppKhoVsdeg9E6E6zPVrE6rqFlXy2YmND35vzkNoqTH5AFmXz+N8sv/SdgkY3v+BjXx
         gaB2vzarm5FQvyrDOm/eBvliNikjWyrF8rtTYuXoEscEz8M19ptLKB5uPxYlJGPCf9FB
         VwUp3QY40b/byD3BoAqz2Oj/78fOTYFX7pVWa/XfEx9b32amQ990JQLzhX1pXLZOOzub
         JdZedBapuryLdvKTQzlXbJbYq+a7p9MhPAHEy4BglLy9D+v3iL6aGg7tQEYwKgdYtisk
         xIqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i88wOiG+4XO4eHQB5ir1HOy2s+rWWyy8dASmR4mjaXk=;
        b=bQE7RO0qGaZj4VVpQs/zZkA/PCJR+U2KCssDZrkueVPkAsEaBsXKbTLReD5eL6KzxD
         N45DlM381uyTHU+ozKenmigmwQPuNDU17ysRwW/Wx58CrTQ7AK+ssjefTP98/flla3t1
         F+DZ6ZDNC0ZT8ySJXIrjgIbnfBsP61EZXccmiCHeuCpe43GW4ccSB8BSyglgrAU7ZpeC
         BkrPRxr2LPweQ6YIruN9Vjmn2YDdaKDbJEgGGr4528Yzn2k6hRYLonpWODTauQ20YtSn
         mLEstciRNWVxNkCqTjiIlQ4Qqm+TdGB1hyIRP86Xg0+lXr7D684dxjzcmvs1uUksVKjk
         KKlg==
X-Gm-Message-State: AOAM5332ie/AYSN8tcvBZhGQKeTbdfFVHhpzi9AB82aUdAKDELcoerXw
	5q1a67lwMbyFxq+c1O6geXLZAcNJ
X-Google-Smtp-Source: ABdhPJxMI8uXDt4nSwhTnrytFjpOJ+eykJEf+QSrAe+1UC/KvPAG2Cy7BM8UsREeJa62e1ccsQ+sfg==
X-Received: by 2002:aa7:c60e:: with SMTP id h14mr6464013edq.104.1590940419239;
        Sun, 31 May 2020 08:53:39 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:53:38 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 14/70] python3-subunit: upgrade 1.3.0 -> 1.4.0
Date: Sun, 31 May 2020 17:51:58 +0200
Message-Id: <20200531155254.10283-14-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/python/python-subunit.inc               | 4 ++--
 .../{python3-subunit_1.3.0.bb => python3-subunit_1.4.0.bb}    | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-subunit_1.3.0.bb => python3-subunit_1.4.0.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-subunit.inc b/meta/recipes-devtools/python/python-subunit.inc
index afaaa51fa5..fc63b38aaf 100644
--- a/meta/recipes-devtools/python/python-subunit.inc
+++ b/meta/recipes-devtools/python/python-subunit.inc
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://README.rst;beginline=1;endline=20;md5=909c08e291647fd
 
 PYPI_PACKAGE = "python-subunit"
 
-SRC_URI[md5sum] = "16d468a3aeafe6c60a0c3b2b9132d65b"
-SRC_URI[sha256sum] = "9607edbee4c1e5a30ff88549ce8d9feb0b9bcbcb5e55033a9d76e86075465cbb"
+SRC_URI[md5sum] = "30f1ab20651d94442dd9a7f8c9e8d633"
+SRC_URI[sha256sum] = "042039928120fbf392e8c983d60f3d8ae1b88f90a9f8fd7188ddd9c26cad1e48"
 
 inherit pypi
 
diff --git a/meta/recipes-devtools/python/python3-subunit_1.3.0.bb b/meta/recipes-devtools/python/python3-subunit_1.4.0.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-subunit_1.3.0.bb
rename to meta/recipes-devtools/python/python3-subunit_1.4.0.bb
-- 
2.26.2

