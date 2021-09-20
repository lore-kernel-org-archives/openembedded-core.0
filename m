Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web09.135.1632167501520679407
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Sep 2021 12:51:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=iRSll+mZ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.43, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f43.google.com with SMTP id a14so4183916qvb.6
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Sep 2021 12:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IYKwxFsIt3aLEqhfEqBG+PcEZOqE7uw1B68JP2r533A=;
        b=iRSll+mZj9YuuT/jLoAwFn/Hj9lbg2tRF9kjXIOV1kbZ9z5mEhsGSe45UWmX1lrB+c
         9SbXNSMdEUdpbTRnGd3kF/aZCh1yhJUSQUuBfrUz8r2aLI6iy3wZZDgTphHI1cvTfuVf
         TfCsrpumWg/49vmC9OOHyGxEd8m9kzpSdo8iteSghTF5mgFXppQ6NK01JCAIZv9e1GLn
         omAWhcQMwfDkavzXOrAJ6LC+c4jN3HcBVyKpImJK0vIsCipgJaTgg5fpzzAiQqlFPyAt
         deuwnBoR5Jfha8N6UQdce9g1U3tF/8BlyMN4vmXBYKSek9Kv18wGto2SaYDAJMjG63zb
         YqDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IYKwxFsIt3aLEqhfEqBG+PcEZOqE7uw1B68JP2r533A=;
        b=023PBoRxHIuHdWgdqhBEeKvHwJWiSq4ejvVDnCiZRa7qtjg9tdK4b9LTrtfmGiaq+2
         A0IACk6Ebfxac2G33p7RqP1QFYXV05woGcQp0OWzYM1r6plA3e0QxAulQYHH48LuMc+5
         AxiIZodfCGIacMcVRLDjKDxflZHY98N7rf4SDVeRZzQ99q+qulN9uID0H8KeL6SjoTBu
         IdukU5Yc+ZDenW31akH2b028O17hzA1Y/+T7KmecXQeaoHIdp/9wVG4FTqbqP1kk3AOU
         ZsQhLxXu08yAvWUYebKJ4LltXNBugDc1am52eSrJ2sfv8I/4HxfUCe2Y8bL4btDUnVqo
         JwFg==
X-Gm-Message-State: AOAM531E1Y/dz6LoNAIc1pp5n7nnFu8unUIim6YLjoeZlk5DENyj43ML
	sBzCaMxxZ/zFjPC8a9aj9Hw/eRVzYa+lqA==
X-Google-Smtp-Source: ABdhPJzSRokFyynUDDh6FhgMVKlQPqSXPRaiB0ro+7poiiDxA++qpEuGFgmNee3ZYGHc4pfqQqmebw==
X-Received: by 2002:a0c:db0a:: with SMTP id d10mr27423982qvk.28.1632167500415;
        Mon, 20 Sep 2021 12:51:40 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([2605:a601:a650:b700:9547:ed01:b100:dc8c])
        by smtp.gmail.com with ESMTPSA id w20sm9823280qtj.72.2021.09.20.12.51.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 12:51:40 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] documentation: update sources mirror URL
Date: Mon, 20 Sep 2021 15:51:39 -0400
Message-Id: <20210920195139.26235-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The URL for the sources mirror no longer works.  Update to the new
location.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 .../bitbake-user-manual-ref-variables.rst         |  8 ++++----
 documentation/ref-manual/faq.rst                  | 15 ++++++++-------
 documentation/ref-manual/variables.rst            |  8 ++++----
 3 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/bitbake/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst b/bitbake/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst
index 8862e16b83cb..11f8fdcde003 100644
--- a/bitbake/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst
+++ b/bitbake/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst
@@ -1123,10 +1123,10 @@ overview of their function and contents.
       your configuration::
 
          PREMIRRORS:prepend = "\
-         git://.*/.* http://www.yoctoproject.org/sources/ \n \
-         ftp://.*/.* http://www.yoctoproject.org/sources/ \n \
-         http://.*/.* http://www.yoctoproject.org/sources/ \n \
-         https://.*/.* http://www.yoctoproject.org/sources/ \n"
+         git://.*/.* http://downloads.yoctoproject.org/mirror/sources/ \n \
+         ftp://.*/.* http://downloads.yoctoproject.org/mirror/sources/ \n \
+         http://.*/.* http://downloads.yoctoproject.org/mirror/sources/ \n \
+         https://.*/.* http://downloads.yoctoproject.org/mirror/sources/ \n"
 
       These changes cause the build system to intercept Git, FTP, HTTP, and
       HTTPS requests and direct them to the ``http://`` sources mirror. You can
diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
index d3a603d4a438..f06abc84ee6f 100644
--- a/documentation/ref-manual/faq.rst
+++ b/documentation/ref-manual/faq.rst
@@ -302,10 +302,10 @@ attempt before any others by adding something like the following to the
 ``local.conf`` configuration file::
 
    PREMIRRORS:prepend = "\
-       git://.*/.* http://www.yoctoproject.org/sources/ \n \
-       ftp://.*/.* http://www.yoctoproject.org/sources/ \n \
-       http://.*/.* http://www.yoctoproject.org/sources/ \n \
-       https://.*/.* http://www.yoctoproject.org/sources/ \n"
+       git://.*/.* http://downloads.yoctoproject.org/mirror/sources/ \n \
+       ftp://.*/.* http://downloads.yoctoproject.org/mirror/sources/ \n \
+       http://.*/.* http://downloads.yoctoproject.org/mirror/sources/ \n \
+       https://.*/.* http://downloads.yoctoproject.org/mirror/sources/ \n"
 
 These changes cause the build system to intercept Git, FTP, HTTP, and
 HTTPS requests and direct them to the ``http://`` sources mirror. You
@@ -342,9 +342,10 @@ You could make the following changes to the ``local.conf`` configuration
 file as long as the :term:`PREMIRRORS` server is current::
 
    PREMIRRORS:prepend = "\
-       ftp://.*/.* http://www.yoctoproject.org/sources/ \n \
-       http://.*/.* http://www.yoctoproject.org/sources/ \n \
-       https://.*/.* http://www.yoctoproject.org/sources/ \n"
+       git://.*/.* http://downloads.yoctoproject.org/mirror/sources/ \n \
+       ftp://.*/.* http://downloads.yoctoproject.org/mirror/sources/ \n \
+       http://.*/.* http://downloads.yoctoproject.org/mirror/sources/ \n \
+       https://.*/.* http://downloads.yoctoproject.org/mirror/sources/ \n"
    BB_FETCH_PREMIRRORONLY = "1"
 
 These changes would cause the build system to successfully fetch source
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index dbe02ab27a08..57bf90e5172b 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5821,10 +5821,10 @@ system and gives an overview of their function and contents.
       :term:`Build Directory`::
 
          PREMIRRORS:prepend = "\
-             git://.*/.* http://www.yoctoproject.org/sources/ \n \
-             ftp://.*/.* http://www.yoctoproject.org/sources/ \n \
-             http://.*/.* http://www.yoctoproject.org/sources/ \n \
-             https://.*/.* http://www.yoctoproject.org/sources/ \n"
+             git://.*/.* http://downloads.yoctoproject.org/mirror/sources/ \n \
+             ftp://.*/.* http://downloads.yoctoproject.org/mirror/sources/ \n \
+             http://.*/.* http://downloads.yoctoproject.org/mirror/sources/ \n \
+             https://.*/.* http://downloads.yoctoproject.org/mirror/sources/ \n"
 
       These changes cause the
       build system to intercept Git, FTP, HTTP, and HTTPS requests and
-- 
2.20.1

