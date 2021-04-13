Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web08.9859.1618323768584157568
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Apr 2021 07:22:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mNEeXt9e;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id lr1-20020a17090b4b81b02900ea0a3f38c1so1402869pjb.0
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Apr 2021 07:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=lx8Y8LzZICZKvyKj5pr2O8QUvdrOqXD/VT1QpLRxr00=;
        b=mNEeXt9e0qv79AGdHK+gxHcsJcVHyqAoBnR3ei9XjpJZAHMyJYhSdFYYD54/EkAozu
         GE9iYhMNfjaMXvITlBBybz8P/+eocC2sYpiU5iq6lPM55VPdFQ1av7zTAIzEIc9sPHbs
         wLJ16nkz9XrYUXuYTyy1H6fEkgbcRfPjmbbHJHfKbRFJkjU9nF1Fr1sUThPZ+jRTjJ2p
         cds++0jify9FaoK/D3JUh6Bmg+IfV/sGSMVj74D90TknVdm7Qpq8/kt7vAkQngwojKoV
         U2RBzLoST+CRvJ+7HeZ+Dv6JPkKC7rDlxErEX3RncMbDPLRx/jqutLApKCKpzuVWSNxg
         70jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=lx8Y8LzZICZKvyKj5pr2O8QUvdrOqXD/VT1QpLRxr00=;
        b=WRSpqjG1YJiLaAy1c2LFG17gtCi5rgCWjwBqwqttrgW9GA2+SxxeyZMNasx+D7i6sx
         oLmEvDq9LmvnewUZipXOcswqZlWSMi3VDcQ0AYt57RctRybemKL8rrI58oIvBGXJxjd3
         1g3DVmwzA3FIJrDWMHut4K+nIQ8bQulI+koUtg0DDROHy24z8ypFmaZfc5KlGqf0Stn4
         5gzVoTh90IxriLCIJVeCR4NMWnMgapjyNxWphMrNnRCII7KPvZgvUJXOmyuMDw9Sm62l
         xGHGQpnuPpChgAdUmPvNlqPjYBsQDL8otzTWozf2rsfKbgX3f4j6m+vhnuJsbijO4n5K
         No5g==
X-Gm-Message-State: AOAM5311LxgBxhq9GIRt6riSkw0aAlTSao3jemA0cipI9CDcLvz3Z2gF
	K5sMwiCNpavBaCHpYTEWV4s86lRSlFVXOw==
X-Google-Smtp-Source: ABdhPJx2uXgbRwxd1tVskKvQ/I3rzbsrxq4syVqou1c2F/3nOg87tjBB7OM5N8Ogqpnio6DElhbwew==
X-Received: by 2002:a17:90a:a103:: with SMTP id s3mr294038pjp.158.1618323767801;
        Tue, 13 Apr 2021 07:22:47 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:9da9:b759:ab96:7b28])
        by smtp.gmail.com with ESMTPSA id m3sm2582962pjl.14.2021.04.13.07.22.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 07:22:47 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [v2][PATCH] binutils: rename BRANCH var
Date: Tue, 13 Apr 2021 07:22:45 -0700
Message-Id: <20210413142245.11630-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

If BRANCH is defined in local.conf then that name is used to d/l sources
for binutils. You will get this error:

Fetcher failure for URL: 'git://sourceware.org/git/binutils-gdb.git;branch=hardknott;protocol=git'. Unable to fetch URL from any source.

Rename to SRCBRANCH like glibc has to avoid the more common variable name BRANCH.

Signed-off-by: Armin Kuster <akuster808@gmail.com>

--
V2]
Remove commented out BINUPV and function
---
 meta/recipes-devtools/binutils/binutils-2.36.inc | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.36.inc b/meta/recipes-devtools/binutils/binutils-2.36.inc
index 2968291889..d2ededb728 100644
--- a/meta/recipes-devtools/binutils/binutils-2.36.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.36.inc
@@ -10,22 +10,16 @@ LIC_FILES_CHKSUM="\
     file://bfd/COPYING;md5=d32239bcb673463ab874e80d47fae504\
     "
 
-def binutils_branch_version(d):
-    pvsplit = d.getVar('PV').split('.')
-    return pvsplit[0] + "_" + pvsplit[1]
-
 # When upgrading to 2.37, please make sure there is no trailing .0, so
 # that upstream version check can work correctly.
 PV = "2.36.1"
 CVE_VERSION = "2.36.1"
-BINUPV = "${@binutils_branch_version(d)}"
-#BRANCH = "binutils-${BINUPV}-branch"
-BRANCH ?= "binutils-2_36-branch"
+SRCBRANCH ?= "binutils-2_36-branch"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
 SRCREV ?= "7651a4871c225925ffdfda0a8c91a6ed370cd9a1"
-BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${BRANCH};protocol=git"
+BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=git"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
      file://0004-configure-widen-the-regexp-for-SH-architectures.patch \
-- 
2.17.1

