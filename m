Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web09.29018.1606537514785664144
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2020 20:25:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cKq9iGhL;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id w16so5768054pga.9
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2020 20:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=sP9kxVuSnqYtzhScxyAaHqh7ZYenpqNPYIe74ivk25s=;
        b=cKq9iGhLGcrtZIbAeKeAiqK8qrwq6JMUQKQDUO15hhI800qFyYCTlkZJfEU83O4otN
         44wsjeYJSSxruKPHH0dQc89NPSicWHcfRQqcHCjwO768K5bUi3gZQuHZsWtxTR0MALNu
         0DS9K3rOMRppUWVKmvcQdw722Xifk1L7KFDafCncZ4LmrnLsJPUJutdhjGkbrplwQAht
         rzUGr3ZyBvzq6GMCNdTV6jo2kOs291LxgPmE8bUJurSe7iS9yUdDEwrvxhEj5Xknnzmd
         yz5RpVG5sMKEn7+oMXAdDHZdTbz+OFKeU6gzZYNhPkCaFkAwIXQxvO/s+CA5R+emYQxq
         mvkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sP9kxVuSnqYtzhScxyAaHqh7ZYenpqNPYIe74ivk25s=;
        b=YCkd9W+WByOFmJoE9HvCz5S/EQE9aZtDHzXadwkLU8ID3YY7OLWMvygKgFKC/7No22
         fQtpfohAk1iiCbvyEz/EnTycOro/DwcHY+I6yQVsHq0ADpat97DmXrPxWZnx5BhYecgZ
         CReEjmW5so9QSDBoMFMBoTopJARIYi0dFg4t/2sCipDPlvjFuBhlaykAQz2Nc+QZ3BZQ
         8UlyV8bIol2cesf4DU7zGbu4HdaJ6fW0JE/7yxW4AiJ8yRweLi0YVAKHg50/5WfXRfgj
         nHh33c3fi4AMuyw6VNZIDEQQdpc4MFH375KicMYgzo3u6TaeKbmipXQuXRe+LGyEJ5od
         Mr3g==
X-Gm-Message-State: AOAM530bXfKy1SKsKhUT5muODB7AXYzTngnS/4A8EdZRQOClLo4xn2i7
	1hZM1MOv1R4+EpkcE+51Ze7ImCY0pSurbw==
X-Google-Smtp-Source: ABdhPJxe0ZG6je7O+TqDqaM6TxoKyLNkflK0uo5MvQ2i/+88v4VzjaKLeGoaw54RxHwf6HQlbdq0Qw==
X-Received: by 2002:a17:90a:e2d4:: with SMTP id fr20mr13748226pjb.202.1606537514173;
        Fri, 27 Nov 2020 20:25:14 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.local ([2601:1c0:6000:9640:74ec:3128:f635:34a1])
        by smtp.gmail.com with ESMTPSA id b5sm12625076pjg.28.2020.11.27.20.25.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 20:25:13 -0800 (PST)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 16/18] python3-more-itertools: upgrade 8.5.0 -> 8.6.0
Date: Fri, 27 Nov 2020 20:24:29 -0800
Message-Id: <0a6850284d08317dd76f0bbd0e5842c3518f9a75.1606536874.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1606536874.git.timothy.t.orling@linux.intel.com>
References: <cover.1606536874.git.timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <timothy.t.orling@linux.intel.com>

Upstream release notes:
"
* New itertools
  - all_unique (thanks to brianmaissy)
  - nth_product and nth_permutation (thanks to N8Brooks)

* Changes to existing itertools
  - chunked and sliced now accept a strict parameter (thanks to
    shlomif and jtwool)

* Other changes
  - Python 3.5 has reached its end of life and is no longer
    supported.
  - Python 3.9 is officially supported.
  - Various documentation fixes (thanks to timgates42)

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 ...-itertools_8.5.0.bb => python3-more-itertools_8.6.0.bb} | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/python/{python3-more-itertools_8.5.0.bb => python3-more-itertools_8.6.0.bb} (77%)

diff --git a/meta/recipes-devtools/python/python3-more-itertools_8.5.0.bb b/meta/recipes-devtools/python/python3-more-itertools_8.6.0.bb
similarity index 77%
rename from meta/recipes-devtools/python/python3-more-itertools_8.5.0.bb
rename to meta/recipes-devtools/python/python3-more-itertools_8.6.0.bb
index e924b0f731f..ee5ce7ba9cc 100644
--- a/meta/recipes-devtools/python/python3-more-itertools_8.5.0.bb
+++ b/meta/recipes-devtools/python/python3-more-itertools_8.6.0.bb
@@ -3,13 +3,10 @@ HOMEPAGE = "https://github.com/erikrose/more-itertools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5"
 
-SRC_URI[md5sum] = "2588b5a7042576b99574779582be9292"
-SRC_URI[sha256sum] = "6f83822ae94818eae2612063a5101a7311e68ae8002005b5e05f03fd74a86a20"
+SRC_URI[sha256sum] = "b3a9005928e5bed54076e6e549c792b306fddfe72b2d1d22dd63d42d5d3899cf"
 
 inherit pypi setuptools3 ptest
 
-BBCLASSEXTEND = "native nativesdk"
-
 SRC_URI += " \
 	file://run-ptest \
 "
@@ -22,3 +19,5 @@ do_install_ptest() {
 	install -d ${D}${PTEST_PATH}/tests
 	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
 }
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.25.0

