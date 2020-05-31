Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web11.17518.1590940443970137150
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:54:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SGMpgAmW;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id e2so6838481eje.13
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n2RoQjJcS/M+v0gTI21V5mTfZqxmPy5QBv1ohNp1OW4=;
        b=SGMpgAmWJS3zDuOLlvDnB8EppcynvfvmogkO4/vCxPazD6X2axaJTODDjtKjvYVswi
         7TSZFnCH4eaBdQeSvpyMZ3XmQV5GCY+L7nEDCLUciRJJgu3FEBtyCBv5MgmU+Jl4LVPX
         Wb5yBUG3kuzwwQkdGCVfE2e47wfhrYY78UnK5lqT/11WqYID5srtzdgPaYGrAGySRqR9
         yqCsr+C/pJ/KG55nApJuUj+sSQeUGcrVQMJ4cMqSXS7KrIsPvMW1S4lAhHIEa7ycQ65/
         GUkknaghGysHjH3XIWb2/OJtcIQxbP1GmIneDkLSVZcbB/ucCCFOiskDzr/GIeWbOoJ8
         iLsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n2RoQjJcS/M+v0gTI21V5mTfZqxmPy5QBv1ohNp1OW4=;
        b=cKQBftWQpe/30LKPy7P2L9c3Y/VzPT7tvY2cxf29uB31dP+AscDWTb5dNW9uYJDmAp
         3GOt9FSadXZcIfEfHEmJHWQC/wHaFJ5ReXiK7hxEwQS0apUTkWj7K0i68WGiSB+1ufRY
         TJY4+B8kcVYExgFliCHXgTEnzf6+APJAu3/KBjuSit6kUGtI1zP1JqWArBvIBfwXECQt
         aN1daiZ7bl7RUJ5vj1q+xwjT5Edr4t0TXjJFSijrAK/iR4kLHWgr7FsDhJExMtA8y6EI
         Wv41tzTtSMAQlD9WvkS7yVbk+pXtBKTZJhes53amq0s5kCvWxE4YAxWmoj4hBAJIEAmV
         hNfg==
X-Gm-Message-State: AOAM530/de2tdSuVXjMBAK8+GU+NjTRWrr/pzYUSVrRMu1RS0Uv5RVk5
	cQLbYQsNBydMUq/OjMYoSJU91kJx
X-Google-Smtp-Source: ABdhPJwWDvcj/xARIK4PQFXXvyzFZYOTmXRv1tS7fhsBf2OCRQCLlNtvDHKKZUQkGX2yq0zN2aHrRA==
X-Received: by 2002:a17:906:4716:: with SMTP id y22mr34207ejq.125.1590940442317;
        Sun, 31 May 2020 08:54:02 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:54:01 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 40/70] alsa-topology/ucm-conf: update to 1.2.2
Date: Sun, 31 May 2020 17:52:24 +0200
Message-Id: <20200531155254.10283-40-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tarballs have a proper subdirectory now, so subdir option
isn't needed anymore.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-topology-conf_1.2.1.bb => alsa-topology-conf_1.2.2.bb} | 7 ++-----
 .../{alsa-ucm-conf_1.2.1.2.bb => alsa-ucm-conf_1.2.2.bb}   | 7 ++-----
 2 files changed, 4 insertions(+), 10 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-topology-conf_1.2.1.bb => alsa-topology-conf_1.2.2.bb} (61%)
 rename meta/recipes-multimedia/alsa/{alsa-ucm-conf_1.2.1.2.bb => alsa-ucm-conf_1.2.2.bb} (63%)

diff --git a/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.1.bb b/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.2.bb
similarity index 61%
rename from meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.1.bb
rename to meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.2.bb
index add1f309ec..2901794cb9 100644
--- a/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.2.bb
@@ -4,11 +4,8 @@ BUGTRACKER = "https://alsa-project.org/wiki/Bug_Tracking"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=20d74d74db9741697903372ad001d3b4"
 
-# The tarball doesn't have any toplevel directory. The subdir option tells
-# Bitbake to unpack the archive to the correct place.
-SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2;subdir=${BP}"
-SRC_URI[md5sum] = "7fdf5fff3f1e0603456e719f6033e922"
-SRC_URI[sha256sum] = "354a43f4031c98bef1349ac722d83b2603ef439f81a1ab1eba8814c28243a9b2"
+SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
+SRC_URI[sha256sum] = "b472d6b567c78173bd69543d9cffc9e379c80eb763c3afc8d5b24d5610d19425"
 
 inherit allarch
 
diff --git a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.1.2.bb b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.2.bb
similarity index 63%
rename from meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.1.2.bb
rename to meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.2.bb
index 469d1f7a95..1a524d49b2 100644
--- a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.1.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.2.bb
@@ -4,11 +4,8 @@ BUGTRACKER = "https://alsa-project.org/wiki/Bug_Tracking"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=20d74d74db9741697903372ad001d3b4"
 
-# The tarball doesn't have any toplevel directory. The subdir option tells
-# Bitbake to unpack the archive to the correct place.
-SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2;subdir=${BP}"
-SRC_URI[md5sum] = "b7fa43cfd79df978184a6333766d2a50"
-SRC_URI[sha256sum] = "ea8a86875f4cf430d49a662a04a6d6c606c5c9d67e54cb944c4d77b24554062f"
+SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
+SRC_URI[sha256sum] = "7ebfd929bc85a51f16fa3c8c4db13faa2ea6ff2b2266fc36d6198bdafe73c40c"
 
 inherit allarch
 
-- 
2.26.2

