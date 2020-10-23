Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web08.1052.1603478632309477488
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2020 11:43:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DGwfIClg;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id w23so1615715wmi.4
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2020 11:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=psFuTQpH02RysqPQ/Sj11BTGNGEiX23LU2qpLOMrc1c=;
        b=DGwfIClgEufslADn0O/Eg98k0guHxVMtQ8vJk30zDW+RzULPG4PtG/9mm4wPOW2ak/
         5a7PjNFxdUGb12QSvMabS/SwQXA/x8jZzURolI5CFt6iYdXWuxltRhtbCfPJ7Tpe+yI4
         NcZZR1EJXIdQa+WAHzP1e6LCJ/a56nlW94FP+yNFgGr1hkIKyDy7qlIH5VxaJ8QizYa7
         3tr+CBO5dEul4kFhUSytiRdq+JVSsSWoHIEJpJaWutCwrFKxFPLGvKCkdcAdPLV7n2zV
         Gcy0Xdv5E94yq6oanAQrt69YfFayNopdkOhSnAbGGjWMPmt00dUdNRxWT6jBF+sqpXAh
         Uv7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=psFuTQpH02RysqPQ/Sj11BTGNGEiX23LU2qpLOMrc1c=;
        b=h9UhzFHwGbcirbqv6XgmyqYgGbAJTxGvhyUvK3WN1jhzfFL8mMu8FmaHCkcTYu6eGx
         5Ed18EMsmbBih6t4PgPRNWRaCIQEtdVoIo8fmiyz+Bol/dRIaj+1ChGmI/LCtz9rFiIU
         FWDji+oGfPcWlW7EHfZX8Z00zvEs9lXAbO98wZ1SnaMSe89sbGKJagL9US8MmfdCyhjv
         h7kEfx6xUwBTmBLMXHnJ6Z6rgkeL57MJNxmCu62VWI+l/wWSXVaXXUlD1YHubKoFNIWo
         s9kR1YMj7vYr1eVwTy2qDI4nVWGf8jNiZR9i0Fn7XM6efITYKaW8YnwmOZzo7t2u2T+b
         8k0Q==
X-Gm-Message-State: AOAM532XRnx2oEWGK5dawjeddgqFNhyncIrtwz5XiKh5p9cpX0muscsM
	v/ieemt5ZebM1tcyNuCaHKn89v3bGzSLBA==
X-Google-Smtp-Source: ABdhPJxJkDk9KXrZTn717SINVat2Wpw0jfBycUfyBUYbx8o37MWFsyilViQKQvez9o1ZvlOrdw4+nQ==
X-Received: by 2002:a7b:c015:: with SMTP id c21mr3591186wmb.22.1603478630754;
        Fri, 23 Oct 2020 11:43:50 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id b7sm4999302wrp.16.2020.10.23.11.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 11:43:50 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v4 09/21] gstreamer1.0-plugins-bad: disable new meson options
Date: Fri, 23 Oct 2020 19:41:20 +0100
Message-Id: <20201023184132.3208737-10-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201023184132.3208737-1-quaresma.jose@gmail.com>
References: <20201023184132.3208737-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.18.0.bb          | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.0.bb
index d209107805..903ca920f2 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.0.bb
@@ -100,9 +100,11 @@ EXTRA_OEMESON += " \
     -Daom=disabled \
     -Dandroidmedia=disabled \
     -Dapplemedia=disabled \
+    -Davtp=disabled \
     -Dbs2b=disabled \
     -Dchromaprint=disabled \
     -Dd3dvideosink=disabled \
+    -Dd3d11=disabled \
     -Ddirectsound=disabled \
     -Ddts=disabled \
     -Dfdkaac=disabled \
@@ -113,6 +115,9 @@ EXTRA_OEMESON += " \
     -Dkate=disabled \
     -Dladspa=disabled \
     -Dlv2=disabled \
+    -Dmagicleap=disabled \
+    -Dmediafoundation=disabled \
+    -Dmicrodns=disabled \
     -Dmpeg2enc=disabled \
     -Dmplex=disabled \
     -Dmusepack=disabled \
@@ -124,13 +129,16 @@ EXTRA_OEMESON += " \
     -Dsoundtouch=disabled \
     -Dspandsp=disabled \
     -Dsrt=disabled \
+    -Dsvthevcenc=disabled \
     -Dteletext=disabled \
     -Dwasapi=disabled \
+    -Dwasapi2=disabled \
     -Dwildmidi=disabled \
     -Dwinks=disabled \
     -Dwinscreencap=disabled \
     -Dwpe=disabled \
     -Dx265=disabled \
+    -Dzxing=disabled \
 "
 
 export OPENCV_PREFIX = "${STAGING_DIR_TARGET}${prefix}"
-- 
2.29.0

