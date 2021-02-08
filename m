Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web12.33495.1612781983939068780
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 02:59:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pZ1f43Am;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id i8so23848889ejc.7
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Feb 2021 02:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=X1dv2jYCWQjmiajsGdsp7tQEl8ETojqwEDGQfz+tiPI=;
        b=pZ1f43AmWIWJlhUEaGs8sJTf+zpyMKWytxPJ7HkefuYvsxuEcbG2E/O8YO39xHfNNG
         dRAdWcS+Pa9GK7qAlVORp94mROF58BftSSlD5YIe1/3BDROhdkLFcYwwusk2WPhBZ61O
         iGB2ApE4QPaZVomCWEi7GXAJlHl6e50g4ZzmSs5eWpgR8uAzrd7BPvOGz+yGH+6ER9J0
         bY3vCLDQbY3jCK9MQ+EaAh8mqUoKMVW7C4qbMLwzFLPPci8EgVYTBHCh5ljJuTCD/9KH
         ypR3gO3q7M4JEn53wJbELPtIZUVNSsmirjSjF6gKpmTFiPejhWJdqxjmif2JaTQgT+WK
         Ju6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X1dv2jYCWQjmiajsGdsp7tQEl8ETojqwEDGQfz+tiPI=;
        b=OL3uLfSGLxcPjZp1pm64yOVgnUinnU0URR0q1quqMl1MI4GtrjYVRJOPqKM0WWlNDg
         eymX+IVNyUUgqOz/3Lt82EtUQ+S3gr1j1zPP4g46Ni6URUm9CoWA/+MNa07iY/jgyPIx
         5Lt/DYCot6kJmIwdLT5S8QqvPccCGrKJg9gDRiu4cA6UI6NEffJugpEreqXMotjVSMif
         ZuPc3H2uuSv1+7zvI402ZdDh1aIgg3g8Vq9lkJOMzEtNtRPlOvcmlCj7hs2mJv78LjCy
         frk8sffzvbocpiMTnWJ0EahzHrS87luppJt/Sf4AyFAOtLv4sAMtT8hggJ1GSIPon27y
         yEeg==
X-Gm-Message-State: AOAM533R/IdQQlXILCJ4VOAyJ1XU6+e6BfmZ8r3MqZ10P8jxr3z1whFc
	lTwXEPNdnCxBfkUeGojBREiDlTYhpetBbQ==
X-Google-Smtp-Source: ABdhPJw8mtrVCWa8xFMKM4lx3QhgTAdXycYjhzL7SGEMdLFZuSKFgehq4S7QpWOtZf/p1Fg0oD7s6Q==
X-Received: by 2002:a17:906:c08e:: with SMTP id f14mr17016785ejz.388.1612781982548;
        Mon, 08 Feb 2021 02:59:42 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2450:1011:512:45a5:1b3d:84d2:e7fc])
        by smtp.gmail.com with ESMTPSA id t19sm8382226ejc.62.2021.02.08.02.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 02:59:42 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 06/12] u-boot: upgrade 2020.10 -> 2021.01
Date: Mon,  8 Feb 2021 11:59:26 +0100
Message-Id: <20210208105932.347925-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208105932.347925-1-alex.kanavin@gmail.com>
References: <20210208105932.347925-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tools/binman/binman needs python3-setuptools now.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-bsp/u-boot/u-boot-common.inc                    | 2 +-
 .../{u-boot-tools_2020.10.bb => u-boot-tools_2021.01.bb}     | 0
 meta/recipes-bsp/u-boot/u-boot_2020.10.bb                    | 5 -----
 meta/recipes-bsp/u-boot/u-boot_2021.01.bb                    | 4 ++++
 4 files changed, 5 insertions(+), 6 deletions(-)
 rename meta/recipes-bsp/u-boot/{u-boot-tools_2020.10.bb => u-boot-tools_2021.01.bb} (100%)
 delete mode 100644 meta/recipes-bsp/u-boot/u-boot_2020.10.bb
 create mode 100644 meta/recipes-bsp/u-boot/u-boot_2021.01.bb

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index cbce408a28..5a8035f432 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -12,7 +12,7 @@ PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "050acee119b3757fee3bd128f55d720fdd9bb890"
+SRCREV = "c4fddedc48f336eabc4ce3f74940e6aa372de18c"
 
 SRC_URI = "git://git.denx.de/u-boot.git \
           "
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2020.10.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2021.01.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-tools_2020.10.bb
rename to meta/recipes-bsp/u-boot/u-boot-tools_2021.01.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot_2020.10.bb b/meta/recipes-bsp/u-boot/u-boot_2020.10.bb
deleted file mode 100644
index 4f5b3e5dfd..0000000000
--- a/meta/recipes-bsp/u-boot/u-boot_2020.10.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require u-boot-common.inc
-require u-boot.inc
-
-DEPENDS += "bc-native dtc-native"
-
diff --git a/meta/recipes-bsp/u-boot/u-boot_2021.01.bb b/meta/recipes-bsp/u-boot/u-boot_2021.01.bb
new file mode 100644
index 0000000000..2eef1e900e
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/u-boot_2021.01.bb
@@ -0,0 +1,4 @@
+require u-boot-common.inc
+require u-boot.inc
+
+DEPENDS += "bc-native dtc-native python3-setuptools-native"
-- 
2.29.2

