Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.7499.1608284584640973731
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Dec 2020 01:43:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=F+i6rgBX;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id i9so1435906wrc.4
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Dec 2020 01:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=pQhsZmXK5qSKG2dIjrAzZHtcvfzldxd6/gfcqTsISVo=;
        b=F+i6rgBX0X1BVrZM2ftk7p0Tsj0m749dgPlrl74w2tOB5/ygD/SCnb0T7iN1Jg4LEM
         YizYllrbmuRPpWNM21NnJ4C2gJPqKW5YNEXPZ4STVa0Hz66ipkptsZfCyeYnQ/ML4zMR
         7ABVququ32qT0XQlnyOaZ9OYuJeXqfV74L3uH/tSvoCrJQMVMca5oSyQTUvWrmEzf98n
         1O60jaw7No5v2gwoND8LZ3/OoUGLvrw/yg0X54RAMRswrRkH1m3BsHBjAF2tFchkSBg5
         XT2XPEXihZAbh1L4LfMFL4ua1Npso8lSz2QpaDR9AoF58m8TdcFCOEx7QFXjC+29mtgD
         WJ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pQhsZmXK5qSKG2dIjrAzZHtcvfzldxd6/gfcqTsISVo=;
        b=FINUBte/WRL8dAr12gxHVhHHWIZ/w+6Qzh7UIpmqpEX2jvdjrf9dmBpPreQ3b0qsyU
         +GZyPD0BH3+kR6zFhb64/1fNRMq90ZsUbwpu4s7C2pxWsON6k7odB+AKArVF92Ybntf1
         w5tRPceMR5YigdGl6agLGL2NiVuSxxiKw6NfUEsbytgieoR/tmgm/Sx1MnQs43YF/XtA
         uLuns8iRcOhmIIdDxaJ2w7Sya1tFjgpEILSmpCyPkNAfT2CBcf4uM2MHNswgMM71ZnzG
         oxmJkRttcgiM6oGdnM8GOCHy0StGP9gNh7shnOMjytPthvM1mXFjLvCTyejeszrzL7Sk
         S+3A==
X-Gm-Message-State: AOAM531ieU4ZnoZpDTV4bnL7heaXvK9+nQHkDL9cNNzifLZXB3JCczw2
	Jd3qIxbfMhObkbBMJuzHqtcw0lSZl2b1iw==
X-Google-Smtp-Source: ABdhPJy9x6e3mfEY+RMGp1fDhD+7uamtLE/bbKISKkN16j05mzm6TJXkWCzHzLA6unIQTAySM408LA==
X-Received: by 2002:a5d:464b:: with SMTP id j11mr3381627wrs.227.1608284582914;
        Fri, 18 Dec 2020 01:43:02 -0800 (PST)
Return-Path: <luca.boccassi@gmail.com>
Received: from localhost ([88.98.246.218])
        by smtp.gmail.com with ESMTPSA id o124sm8016521wmb.5.2020.12.18.01.43.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Dec 2020 01:43:02 -0800 (PST)
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 4/5] systemd: set -Dmode=release as recommended by NEWS
Date: Fri, 18 Dec 2020 09:42:55 +0000
Message-Id: <20201218094256.3796401-4-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201218094256.3796401-1-luca.boccassi@gmail.com>
References: <20201210125312.3302065-1-luca.boccassi@gmail.com>
 <20201218094256.3796401-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
 meta/recipes-core/systemd/systemd_247.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_247.2.bb b/meta/recipes-core/systemd/systemd_247.2.bb
index 05dd4f3b7f..7055cc9fca 100644
--- a/meta/recipes-core/systemd/systemd_247.2.bb
+++ b/meta/recipes-core/systemd/systemd_247.2.bb
@@ -209,6 +209,7 @@ EXTRA_OEMESON += "-Dnobody-user=nobody \
                   -Drootlibdir=${rootlibdir} \
                   -Drootprefix=${rootprefix} \
                   -Ddefault-locale=C \
+                  -Dmode=release \
                   "
 
 # Hardcode target binary paths to avoid using paths from sysroot
-- 
2.29.2

