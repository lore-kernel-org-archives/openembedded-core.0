Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web11.25189.1591602520523618211
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2020 00:48:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=N3L8kbwc;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id f7so17153407ejq.6
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2020 00:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/Lmfg/UV/Y/SYoD4dQLNQDhOHP4PA8tJNfjFA9bpftI=;
        b=N3L8kbwcLSEaDPjgL/s+cF9sN2XQhEzUOqpVeb91H4p3eDlLCLqT4DtWQd8tLrXdkP
         Eh1Fu41jzhRzgkBfNJXZZmsS6JGTrIj3TramjgC+CzIReiLSxxQTsHSnz9E2C/CZvD4q
         uPd859Al1QXtv/d2RWwJJbc2w3q5Zck6CNGTdfUi6agO3cfbqUDY9a45x/v7f9entuXW
         +Fzdb9qrx+Zah0m/bES4RA/GTqiDgzmrt/Dcgfby1X1U24GUWNTfe7X5DJMkkipAydk/
         sMnz+V/9zQyDQ8hVHr2oISTVEUkLW6mXSLD3mfvs3CSOB53yGNNXqvWdFemiO1N0pM9/
         Ud6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/Lmfg/UV/Y/SYoD4dQLNQDhOHP4PA8tJNfjFA9bpftI=;
        b=G4tGy0q/nO+lOcrVrzKjQbYilq6O/BNH7N8msWBXs5Vh79+lvy/wXAnUxIjrKoq4N0
         L1R4Ok8aa+7BD5ZAA/nevjnLnnpG+TUeQsKJRdIILMNH25HZYU9bh5NA97p1X1Qu8nit
         WNwwGgrAn02ZakA67owMlWZqLr+2ooHxTBc2Q4cTY6dLu75GNfgfxFpPEhxQiN7UzWsF
         LBRUw6KZJnEG0Ui6qxB/XF3HT2qJ+63Nd9xfpSP29aMMOm7E/Z1MC3ZU6ZUTzAMsW7mT
         JHowAmXOEeKtAqzTDviwr0F+XmWgnMlRGZtbapWONC7BD38HLliAQsFBJTwtxqHnnPOz
         S/8g==
X-Gm-Message-State: AOAM530rW4V367womJ+ZDS+Qh10wF/po39OFrZWon1RsBKubp3hW+rPD
	t0DoMMydCGli9sMTAfjZNvLI7Jo/k6M=
X-Google-Smtp-Source: ABdhPJyEscHPcq53+f2t4I1GPRf+51k0wGa5HAfoAKnCWNFhfLp4ucmYwdtOTixpiGrR0uBOgBX1ag==
X-Received: by 2002:a17:906:7253:: with SMTP id n19mr9541653ejk.31.1591602518832;
        Mon, 08 Jun 2020 00:48:38 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.66.228])
        by smtp.gmail.com with ESMTPSA id g22sm12473466edj.63.2020.06.08.00.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 00:48:38 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 29/42] debianutils: 4.9.1 -> 4.11
Date: Mon,  8 Jun 2020 09:46:46 +0200
Message-Id: <20200608074659.7051-29-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200608074659.7051-1-alex.kanavin@gmail.com>
References: <20200608074659.7051-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: changed license file path on Debian systems
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{debianutils_4.9.1.bb => debianutils_4.11.bb}          | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-support/debianutils/{debianutils_4.9.1.bb => debianutils_4.11.bb} (83%)

diff --git a/meta/recipes-support/debianutils/debianutils_4.9.1.bb b/meta/recipes-support/debianutils/debianutils_4.11.bb
similarity index 83%
rename from meta/recipes-support/debianutils/debianutils_4.9.1.bb
rename to meta/recipes-support/debianutils/debianutils_4.11.bb
index 768f28906f..ac3d5b0267 100644
--- a/meta/recipes-support/debianutils/debianutils_4.9.1.bb
+++ b/meta/recipes-support/debianutils/debianutils_4.11.bb
@@ -1,15 +1,14 @@
 SUMMARY = "Miscellaneous utilities specific to Debian"
 SECTION = "base"
 LICENSE = "GPLv2 & SMAIL_GPL"
-LIC_FILES_CHKSUM = "file://debian/copyright;md5=f01a5203d50512fc4830b4332b696a9f"
+LIC_FILES_CHKSUM = "file://debian/copyright;md5=9b912cd0cc654134c0ef3424a0705b94"
 
-SRC_URI = "http://snapshot.debian.org/archive/debian/20191212T145612Z/pool/main/d/${BPN}/${BPN}_${PV}.tar.xz"
+SRC_URI = "${DEBIAN_MIRROR}/main/d/${BPN}/${BPN}_${PV}.tar.xz"
 # the package is taken from snapshots.debian.org; that source is static and goes stale
 # so we check the latest upstream from a directory that does get updated
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/d/${BPN}/"
 
-SRC_URI[md5sum] = "95633416680bfd249b7cb07d94137048"
-SRC_URI[sha256sum] = "af826685d9c56abfa873e84cd392539cd363cb0ba04a09d21187377e1b764091"
+SRC_URI[sha256sum] = "bb5ce6290696b0d623377521ed217f484aa98f7346c5f7c48f9ae3e1acfb7151"
 
 inherit autotools update-alternatives
 
-- 
2.26.2

