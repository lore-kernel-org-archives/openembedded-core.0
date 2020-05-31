Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.17626.1590940423754220409
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:53:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=l9vHnDAg;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id z5so6893381ejb.3
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e+I6HbfppdHqTnuwEHsy2V3N+XY+w9YLYgCKbvAe3Nk=;
        b=l9vHnDAgUVD5pULbRsxUul3Q1bPl7RHyykt1ji4ywZdlIQmKeX3zMdYO/xXHiMOMMW
         EMjEDjpKYuFTAHn9KmQE0145vf8mY5lQcTSi0tz+tKMaSamNmprmcXvKA+ocaoD9ijYz
         p6Jm0itoE7PJ/xEM8EWUe3zm15+FQSlTTkwcJUAGEMIZac9zCwrIC6ispA3KQMJal09/
         hsg+gijhlzQ4xGS5GKVF0GKaZ4JxcjdKq933iqVMB+6EapRva/AitkK0pvkr05/q43p5
         fNqjOp8EV3iCA2041sz7qRLv+dogbxznnToYNr6IEUvXR08ZnAx5/fLp+zCBuW5NS/cq
         HBcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e+I6HbfppdHqTnuwEHsy2V3N+XY+w9YLYgCKbvAe3Nk=;
        b=f8xxZZ/8v8UYKAJhRf5QOLaP3kdKbd86ghXZq307ymQdJKj1Lw0MY2E/XfJav+DTlp
         pKYT75IQUFghoj/d66R2ReUUN6L2sBG1BsXyKNl1QfOboM3rqQBDj7ZgfyIdJEzds1k0
         6o5w1B24K/m/v9kPpBZzBNPlgnNQX3FVOGn30An18Rzbm6o6Ck6bgzP9MbpQaD+6acwl
         yB4+fKaFAry6cdwgY0vgnynUqDtXzRqVaoWJTfLBss53kr4ni38Ty7EEj6C6Cv4+l65O
         xqBmaDl5EMOOcfvaI0c0GAZLYJK9wkIY9D6RulydBBo1XVJ0Kj0sD5oT0GZgH5MSKyHU
         ZK9Q==
X-Gm-Message-State: AOAM533MwcaIyXYkMRCwVubUF1q1tJAYxm1WGrBsLGQRC8J1Qqwq0fMG
	FInFMLTnZtUXowWnL/JzKyE5DhhM
X-Google-Smtp-Source: ABdhPJyKpyFcNnp4lqVSloXD5pOALC3ssFDemOe/0sI2zc4QOp82hsYFJp+iOyyGsnZwtfNX352urA==
X-Received: by 2002:a17:906:c943:: with SMTP id fw3mr15498909ejb.288.1590940422142;
        Sun, 31 May 2020 08:53:42 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:53:41 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 18/70] vala: upgrade 0.46.6 -> 0.48.6
Date: Sun, 31 May 2020 17:52:02 +0200
Message-Id: <20200531155254.10283-18-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/vala/{vala_0.46.6.bb => vala_0.48.6.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/vala/{vala_0.46.6.bb => vala_0.48.6.bb} (57%)

diff --git a/meta/recipes-devtools/vala/vala_0.46.6.bb b/meta/recipes-devtools/vala/vala_0.48.6.bb
similarity index 57%
rename from meta/recipes-devtools/vala/vala_0.46.6.bb
rename to meta/recipes-devtools/vala/vala_0.48.6.bb
index 66f620384c..9dace1348c 100644
--- a/meta/recipes-devtools/vala/vala_0.46.6.bb
+++ b/meta/recipes-devtools/vala/vala_0.48.6.bb
@@ -4,5 +4,4 @@ SRC_URI += "file://0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.pat
            file://0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch \
            "
 
-SRC_URI[md5sum] = "d9af125648505503b139ebc2d2c9eee5"
-SRC_URI[sha256sum] = "ef31649932872f094971d46453b21c60a41661670f98afa334062425b4aec47a"
+SRC_URI[sha256sum] = "d18d08ed030ce0e0f044f4c15c9df3c25b15beaf8700e45e43b736a6debf9707"
-- 
2.26.2

