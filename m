Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web09.394.1632496222490703732
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Sep 2021 08:10:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=R4IUP1SV;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id e16so7119796qts.4
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Sep 2021 08:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lxiSqWDGxy0FBtl3XoaLFu1+BBhVvNUmnhTQF1qPn0A=;
        b=R4IUP1SVhmYL9yD+rn8gg6u0/tWy2L5wX1oYqoJEZPcx5xuZ7GTudmzScrYCZMHo6F
         CYIv0SHPW47a1virukMVSTY9bRGAYBT/pmRKwiDU0khdoBhqlyNaepvnbut56fYY98Ah
         gkwzsIDSxLvqDbC7gWFq2cPRj2OwA4D2klkMuMC6MgzbSEzl1Y0AuQB0OqKFvJzZa/Oo
         Kd5FTnS0UNW8PknnCZYApYQF9TkjBemuR92LvHfWfnLzr9VavGMEgm5sWe+OGZdQ/uN4
         9V9u4GbDGrAUDyINrVXKgg0+wmdQumBOqd1fYYpOWeu0/DzolyI46vbPALrNxWHt+xFa
         C0OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lxiSqWDGxy0FBtl3XoaLFu1+BBhVvNUmnhTQF1qPn0A=;
        b=CAI/vdmkfALysflGAyiDFBX+I7zV4Jrmxx9uxsBkQ5lgNZUDcay+a0Mmlf90Hzkr73
         sPi0pACebN1mRv8RYcQOvEQwik4kvCtkUWeI22chIuB8Jh5pQdixwIRWBoUCdiQrYXOr
         +hWptiXqjyTyTkjBfos/AazkBK146cNN64Jp5J5MUjwVasacbpqmOo11DVNP6siVdF7w
         Falil7wEwuLVTaXoRreTZ0PsctVYQP0CWUAo9ovSTQaacgLnm5Cmjv6PlAv62n4J2l2h
         JvPppAq1NYFT2lI2U7MPuyC9wJX0v0uJgRc+vWooMMuJiD5e9Q6ZdRc7B3zYFgxkEuU4
         Q1Ow==
X-Gm-Message-State: AOAM533lvcMJhYVpMro5IVRo0IDexBSQohd/7cQbAeWEutFNc8BXf/XC
	zHjEhtl8oJc8/fCZGNjPaGG5pOeR3jvdqA==
X-Google-Smtp-Source: ABdhPJzRpTebQblL9TK3AlauahC5nTegeP4tD9wcxhSX+3IpcTC5h3itvfpvl/tFlyytQXpPGrAn9Q==
X-Received: by 2002:ac8:7590:: with SMTP id s16mr4775887qtq.73.1632496221651;
        Fri, 24 Sep 2021 08:10:21 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id k203sm6439797qke.124.2021.09.24.08.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 08:10:21 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] lttng-modules/dev-upstream: update to 2.13-latest
Date: Fri, 24 Sep 2021 11:10:14 -0400
Message-Id: <c49659500b1c392ddbb35d8bbfa7932fb7a5c60c.1632495931.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1632495931.git.bruce.ashfield@gmail.com>
References: <cover.1632495931.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

To ensure we can build against 5.15, and to keep in sync with the
versioned recipe, we bump to the latest commit on the 2.13 release
branch.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/lttng/lttng-modules_2.13.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.0.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.0.bb
index 82bdd38d36..6dfde8dcad 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.0.bb
@@ -41,7 +41,7 @@ LIC_FILES_CHKSUM:class-devupstream = "file://LICENSE;md5=0464cff101a009c403cd2ed
 DEFAULT_PREFERENCE:class-devupstream = "-1"
 SRC_URI:class-devupstream = "git://git.lttng.org/lttng-modules;branch=stable-2.13"
 
-SRCREV:class-devupstream = "f982b51a98a29cb4aaf607cb9bbf2b509d8e6933"
-PV:class-devupstream = "2.13.0-rc2+git${SRCPV}"
+SRCREV:class-devupstream = "c570be0da77e963d77bac099d468bc0cd5f1bd63"
+PV:class-devupstream = "2.13.0+git${SRCPV}"
 S:class-devupstream = "${WORKDIR}/git"
 SRCREV_FORMAT ?= "lttng_git"
-- 
2.19.1

