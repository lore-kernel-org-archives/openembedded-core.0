Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.1247.1604335808558582005
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:50:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Gs19SRJe;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id b9so4827968edu.10
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5920qCZ6H7E+fmb0bVkZ6VOlzLH9z123lHwat/TIWq0=;
        b=Gs19SRJeYNNbXxIp0I6vCvD2ECpuEgiNc3bIHdZzuhtK3P+m83t8cHt6li0YdLNmYU
         0BsTqj4fshDQaKMq1PPVXP31exvvVVVErrLGu4jiKnvkQSkguuXB2LRuxfe6KsrTzn/8
         +aPff0uL/gJRzVLHc/EOLVcCzvRHRrIxLrNKUDmM6GOJwO1fVGUYJ7LbnNAxCpMbYzFf
         wBYriOYnRKcJ8RTLYqayEqAe+IJd76AVXZy2+GxR4JVIt1IFOFGIv2V0CFQfpmYu8Djs
         bPljzJxml5DDveFF5oKuXjffJyzMfAJxN7mcVMdqBJ46EOR7CNQ06XZWIxldjz6Jt+eo
         clyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5920qCZ6H7E+fmb0bVkZ6VOlzLH9z123lHwat/TIWq0=;
        b=ge/OIiQe/L3+roZ9GvBqf6Lktjm7Kp+FDxlQVOOXzjDm8FtcXM04j3T09GTFBLNK77
         TYXaHyhENQrtpJgUXqabF4Fr28Nqik1B2pIu8YmLuZBL6ABS2ddQChW2Z84o5P1mGGWp
         ezIurHJ/5s007H8uL2tfofmtJzKHF9kI36dRkjDBH01keiFNvFucseYOpKSMKxyhOgIb
         JJ3bvW2Vq1aVwJncxXwDE1tzPADxnbiamrKr8geqpwGEbHgxzVDepHVrs310HqhaJ1vK
         Jpat6zZG1+VJHCjDvAgAhSb8JubHP90LyC+CfgIIId0GSBP4qz/jfHMgoMkTrRo5jDuX
         OxdQ==
X-Gm-Message-State: AOAM530l7nrEO9crOp8Fzm4zQCiSw1Bx4ac8m5Lo5uXAlXeTMOhVhvS0
	IPVExknq0tfTlaI8H/I9dmYBCHJJfFKNkw==
X-Google-Smtp-Source: ABdhPJyd0BbK6iVfkiYj8H23EszRJPpHEFyDTjhYGEC5ya0nsqamQ1XmTyiJhhHLvC8QXEbIMc+Gvg==
X-Received: by 2002:aa7:c955:: with SMTP id h21mr17782626edt.315.1604335806897;
        Mon, 02 Nov 2020 08:50:06 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:50:06 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 55/80] python3-numpy: upgrade 1.19.1 -> 1.19.3
Date: Mon,  2 Nov 2020 17:48:42 +0100
Message-Id: <20201102164907.27572-55-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: reformatting
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/python-numpy/python-numpy.inc           | 4 ++--
 .../{python3-numpy_1.19.1.bb => python3-numpy_1.19.3.bb}      | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python-numpy/{python3-numpy_1.19.1.bb => python3-numpy_1.19.3.bb} (100%)

diff --git a/meta/recipes-devtools/python-numpy/python-numpy.inc b/meta/recipes-devtools/python-numpy/python-numpy.inc
index 0113f4098d..b1058b26c8 100644
--- a/meta/recipes-devtools/python-numpy/python-numpy.inc
+++ b/meta/recipes-devtools/python-numpy/python-numpy.inc
@@ -1,14 +1,14 @@
 SUMMARY = "A sophisticated Numeric Processing Package for Python"
 SECTION = "devel/python"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & PSF & Apache-2.0 & BSD & MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=643d4e90100b7abe468c4db88127b895"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e527e2a94c4584cd192d03ffb1f4a744"
 
 SRCNAME = "numpy"
 
 SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch \
            "
-SRC_URI[sha256sum] = "1396e6c3d20cbfc119195303b0272e749610b7042cc498be4134f013e9a3215c"
+SRC_URI[sha256sum] = "9179d259a9bc53ed7b153d31fc3156d1ca560d61079f53191cf177c3efc4a498"
 
 UPSTREAM_CHECK_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.19.1.bb b/meta/recipes-devtools/python-numpy/python3-numpy_1.19.3.bb
similarity index 100%
rename from meta/recipes-devtools/python-numpy/python3-numpy_1.19.1.bb
rename to meta/recipes-devtools/python-numpy/python3-numpy_1.19.3.bb
-- 
2.29.0

