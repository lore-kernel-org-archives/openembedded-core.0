Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web09.7661.1614526647115507469
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Feb 2021 07:37:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lMwUMilI;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id g3so17301386edb.11
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Feb 2021 07:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K2N77xbMHDvK0Y+q+mtt8lhXddAlaz5NMPglH4tV4qU=;
        b=lMwUMilI6KQSZ8r1N7OT6egDs+yomL4BXDvbSukx72bZACIKrL2pwE4HCtjN95y0GS
         aSqD8bu85zFrZ+/l3Zp0UiSZJef6/kQYTHO5tH6FSawqZUkNtoPGtYSbWBg4UnbJo7mj
         2cMCZaREpQyR8j56wugi16vIYGwW5n1vR52Z2Q4cKWhbtd+5khgqYEN4zoSdqVdjFs/p
         a1UXTB3Z+CJNWiHuDygeiUTf+7Op7iyfXkRnNcq+bswwJjgIPIjHtneGkS9eoz5uIqL5
         UjVa8V5VTQ9JCmzqwH9HieSk5af/D6XW9AedbQxzVjhZxzmlxZVP1k5CJWz3vTwvKnmv
         6ldA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K2N77xbMHDvK0Y+q+mtt8lhXddAlaz5NMPglH4tV4qU=;
        b=N3MSb9xJZsn7mTGAglCfQRAgu0mgFdwzgIDRpmwV+9d7TlUHusYoHtLvh2iQJ0H8w4
         J84DFJnTINOkE85NUWtlIDn43xHgSNDrLiUzqMJF0Y8GzAgvwbbke8l5KAKSYtmN77vD
         ikVTmwk3LyaMmmThBzclJQv0y48MlUreW1+ij46RZLprPTAjPpzI5MNeP9j8dsaEXfrC
         AsTnuvNMzvs/iIUh7tWLKyXRldUNAa/c4JBXNSd/bOFjzdCcBFlnTwHw8JB5bM6eXrEz
         vhxw3IXmw6tPIkb/aSkiDm8qjXrILRWwPpVAu4mwwW4RbeJqEk1JSX3/EzoFaf+KEdoX
         rdpg==
X-Gm-Message-State: AOAM531C/plC3j8Gp57eS/lUt5z+8iC/L3If/QLuc17QuNZycQVBtrZU
	QTdCx+Voq+IU9tDzXxORIdtQSW87wjdDoA==
X-Google-Smtp-Source: ABdhPJyiZM5q+O8FQWO/4lqVIw0i3rsBOVhKce3mqwkoma9ozhHeA/E/rQkDZ/ZQTK89jaGPz1Gw3g==
X-Received: by 2002:a05:6402:4311:: with SMTP id m17mr12507281edc.123.1614526645618;
        Sun, 28 Feb 2021 07:37:25 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2450:1011:512:45a5:1b3d:84d2:e7fc])
        by smtp.gmail.com with ESMTPSA id b17sm10234780ejj.9.2021.02.28.07.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Feb 2021 07:37:25 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 20/24] libbsd: udpate 0.10.0 -> 0.11.3
Date: Sun, 28 Feb 2021 16:36:58 +0100
Message-Id: <20210228153702.498275-20-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210228153702.498275-1-alex.kanavin@gmail.com>
References: <20210228153702.498275-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: copyright years, file lists

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libbsd/{libbsd_0.10.0.bb => libbsd_0.11.3.bb}          | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libbsd/{libbsd_0.10.0.bb => libbsd_0.11.3.bb} (87%)

diff --git a/meta/recipes-support/libbsd/libbsd_0.10.0.bb b/meta/recipes-support/libbsd/libbsd_0.11.3.bb
similarity index 87%
rename from meta/recipes-support/libbsd/libbsd_0.10.0.bb
rename to meta/recipes-support/libbsd/libbsd_0.11.3.bb
index 5b32b9af41..55ecae2ea5 100644
--- a/meta/recipes-support/libbsd/libbsd_0.10.0.bb
+++ b/meta/recipes-support/libbsd/libbsd_0.11.3.bb
@@ -29,14 +29,15 @@ HOMEPAGE = "https://libbsd.freedesktop.org/wiki/"
 # License: public-domain-Colin-Plumb
 LICENSE = "BSD-3-Clause & BSD-4-Clause & ISC & PD"
 LICENSE_${PN} = "BSD-3-Clause & ISC & PD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=2120be0173469a06ed185b688e0e1ae0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=adf6172075bcc5837e33a8a688eb7e22"
 SECTION = "libs"
 
 SRC_URI = "https://libbsd.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "ead96d240d02faa5b921c0aa50c812b5"
-SRC_URI[sha256sum] = "34b8adc726883d0e85b3118fa13605e179a62b31ba51f676136ecb2d0bc1a887"
+SRC_URI[sha256sum] = "ff95cf8184151dacae4247832f8d4ea8800fa127dbd15033ecfe839f285b42a1"
 
 inherit autotools pkgconfig
 
+DEPENDS += "libmd"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.29.2

