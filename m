Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com [209.85.167.193])
 by mx.groups.io with SMTP id smtpd.web10.2130.1587412829265365876
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2020 13:00:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gaZmwiqg;
 spf=pass (domain: gmail.com, ip: 209.85.167.193, mailfrom: geissonator@gmail.com)
Received: by mail-oi1-f193.google.com with SMTP id r66so9972459oie.5
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2020 13:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qPH0+hqnn6jZbzSx9i7hH3ZRmF3/WCHDJr/EpVHYdeA=;
        b=gaZmwiqgyDZ8SDlcFGB5njg6lWz6yna3WZkhUbwiRT1dKs8HVulDuJu/B4m4GQnK4P
         zAI/BUZr3yQi6hyBv6XfrQYTE6Doxl+vCw5NCT/+yPVWBiQJxLv7TXNXtdOOr8fbqI+A
         KAV9n7hZjbT3f+FNcSDNyjp0OURqL4+viU7NXuq8CKwPzYEyUC7XhfuRjJ+i9yzivJ0e
         A2XubcVFi8EYe3B9WQijDFYHqG3zduSvy8mU3/9y0En3O2l5nrdjK6NDLv0DNW76A3Ua
         /WuL3sHtuWo+KL6miyZXn3l+HTJT/NXr5M34d5KBLusrDtEMLXqunVXjLHXRTFPMhvRZ
         p8Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qPH0+hqnn6jZbzSx9i7hH3ZRmF3/WCHDJr/EpVHYdeA=;
        b=ccUc0LPRJ9FwkBukUQiVZSLZa9HZhC3hllhbBaZ4CMEJp7pIPeH802J2oN3y7UYR5H
         WfkrDzjXHVs4lmmXXw1jsRO622fCO7hpvBScVlGm/DPQGyjmmelaFlZ3mrC2em5AiDz9
         Q+ErJW+N6r3FLfqm0pCK0bX2pk/4tkCrY8BW5B8agki9z6E9lhYK42yw8gaZS18Khen2
         FlAjSFxBdVxrksCyJo/FdY/QK7hpAbZAre5d+zC14YC8HNinc7sSccgbQEWDgHyOWQPx
         kkajJ8D7nUY5GKvBE/Fzc5YVEUZL5TPixSPE8K70FdSDeC3JPClXMRmsqR9HNB/QKVdk
         9Qvw==
X-Gm-Message-State: AGi0PuYUAM8x/h/KdI8MzUu2Shlnzl96gh58tTqbzaZLPw3mzRlAU+Co
	iqaYMSxNIaiDGgrzspT/UgkRI+uTN6I=
X-Google-Smtp-Source: APiQypLE8SGH0KUaKLMRdW1ohcmU9AkSJ+bT2gos8ypzE+UruPYaeSAviP0EnjSE3KJW5nnaC8TXCg==
X-Received: by 2002:aca:a90e:: with SMTP id s14mr846095oie.80.1587412827907;
        Mon, 20 Apr 2020 13:00:27 -0700 (PDT)
Return-Path: <geissonator@gmail.com>
Received: from Andrews-MBP-2.attlocal.net (45-18-127-186.lightspeed.austtx.sbcglobal.net. [45.18.127.186])
        by smtp.gmail.com with ESMTPSA id t17sm100797oof.43.2020.04.20.13.00.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Apr 2020 13:00:27 -0700 (PDT)
From: "Andrew Geissler" <geissonator@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Andrew Geissler <geissonator@gmail.com>
Subject: [PATCH 1/2] boost: switch over to sourceforge
Date: Mon, 20 Apr 2020 15:00:15 -0500
Message-Id: <20200420200016.49947-1-geissonator@gmail.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dl.binary has a monthly download limit. The issue is documented in
https://github.com/boostorg/boost/issues/299

Yocto has backup/caching for issues like this but it's best to not
contribute to that download limit if the same file is hosted over
at sourceforge.

Signed-off-by: Andrew Geissler <geissonator@gmail.com>
---
 meta/recipes-support/boost/boost-1.72.0.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/boost/boost-1.72.0.inc b/meta/recipes-support/boost/boost-1.72.0.inc
index 55a095bf1c..3a7ea2c06e 100644
--- a/meta/recipes-support/boost/boost-1.72.0.inc
+++ b/meta/recipes-support/boost/boost-1.72.0.inc
@@ -11,7 +11,7 @@ BOOST_VER = "${@"_".join(d.getVar("PV").split("."))}"
 BOOST_MAJ = "${@"_".join(d.getVar("PV").split(".")[0:2])}"
 BOOST_P = "boost_${BOOST_VER}"
 
-SRC_URI = "https://dl.bintray.com/boostorg/release/${PV}/source/${BOOST_P}.tar.bz2"
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/boost/boost/${PV}/${BOOST_P}.tar.bz2"
 SRC_URI[md5sum] = "cb40943d2a2cb8ce08d42bc48b0f84f0"
 SRC_URI[sha256sum] = "59c9b274bc451cf91a9ba1dd2c7fdcaf5d60b1b3aa83f2c9fa143417cc660722"
 
-- 
2.21.0 (Apple Git-122)

