Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.25493.1588523201872706886
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 May 2020 09:26:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LKaH7/rx;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id s8so7681383wrt.9
        for <openembedded-core@lists.openembedded.org>; Sun, 03 May 2020 09:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f4c8CbBf+rmGrrSpoCtGXfWPqbSM9Vd45l+E0Zzhw04=;
        b=LKaH7/rxK6MXCAJDTgCczFLTGqgzQDITewAhw8p7HwCfeCvn21Fqgo26ih6pgwl32X
         gb1WuV3S405NGyQ4lAjnv6j/EfkOKKkKeQTUmBJa3zo3wNd/FPmap/aAOT2SIFE0oXJi
         0UdccTItoz1W5LcIR5h1m1WaOOf2bPApqlRojJDguaIKG+wfp/Dj3ansZWLfqv41YWj7
         3QKH2RQRy6cQzmeoc4Jm13ErArWE8ZJCSZ6VnG7lcO9X00KZHHBV0qhBV1zo78mhAZWo
         ddSHQp1JRwRXRW6Yzz4T0YozEWYzkE8FMk5MHX1572lwkkXNLssj58LlCSePdJetJc3v
         O9Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f4c8CbBf+rmGrrSpoCtGXfWPqbSM9Vd45l+E0Zzhw04=;
        b=a02FpjQ7hT95UZgRwGRHSISr+pxnJLEW4mjs8GTZahvWWu9nGG6ZKDwJ/McICW2cHj
         8n+EKBl8Bgj3vE8sYUSJnAUTPDEZ164ogd6NDSW9Gosf1ON9g2o+MfLxfvpoF4uaks2s
         tCAY52YAytvFX/VFvuk8CBmls09EaQo4AoJUfojLqGABNYbLTAt75xT2V1ocY+nQ5tbc
         KG3oU8SsAcVORtkfpKSmhhXfKo7ZgzdIgi+/CHw88KZxKlysVdJ1GVNuQEbAhgbGSN4Y
         LPgmSN30iarbt3/zC/KWjwR614GdrNu6IWqOTIyNxgrv4slyIdGLqzYuPMwO1h+qAnyg
         Ni6A==
X-Gm-Message-State: AGi0PuZqwXYYUekTZr2PmrN9GHbOnEZ5kVNp9f0dcDnzyzuA8OO63IkJ
	3pEj2kUwPczl4BiIGhNXnrytunHV
X-Google-Smtp-Source: APiQypJ/DFs58bgLrHYjL2NJXDKyGT21qOSVtovM5am9pUu3HaW8FEJ49NPZpZwLJcuJlRqOYNelxg==
X-Received: by 2002:a5d:5309:: with SMTP id e9mr1661318wrv.311.1588523200169;
        Sun, 03 May 2020 09:26:40 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id q18sm9079532wmj.11.2020.05.03.09.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2020 09:26:39 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 12/17] vte: update to 0.60.2
Date: Sun,  3 May 2020 18:25:54 +0200
Message-Id: <20200503162559.946-12-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200503162559.946-1-alex.kanavin@gmail.com>
References: <20200503162559.946-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/vte/{vte_0.58.3.bb => vte_0.60.2.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-support/vte/{vte_0.58.3.bb => vte_0.60.2.bb} (89%)

diff --git a/meta/recipes-support/vte/vte_0.58.3.bb b/meta/recipes-support/vte/vte_0.60.2.bb
similarity index 89%
rename from meta/recipes-support/vte/vte_0.58.3.bb
rename to meta/recipes-support/vte/vte_0.60.2.bb
index 41dc2e77c9..3891ff8165 100644
--- a/meta/recipes-support/vte/vte_0.58.3.bb
+++ b/meta/recipes-support/vte/vte_0.60.2.bb
@@ -20,8 +20,8 @@ inherit gnomebase gtk-doc features_check upstream-version-is-even gobject-intros
 SRC_URI += "file://0001-app.cc-use-old-school-asignment-to-avoid-gcc-4.8-err.patch \
             file://0002-Add-W_EXITCODE-macro-for-non-glibc-systems.patch \
            "
-SRC_URI[archive.md5sum] = "f59eb0784a361c0939c03d4566255916"
-SRC_URI[archive.sha256sum] = "22dcb54ac2ad1a56ab0a745e16ccfeb383f0b5860b5bfa1784561216f98d4975"
+SRC_URI[archive.md5sum] = "1a0b5395915d2f3c88484511b38cc584"
+SRC_URI[archive.sha256sum] = "35a0280e3f12feeb3096da05699191373c47a4a20c55cb7081e828e6015f8ca5"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
@@ -44,6 +44,7 @@ FILES_${PN}-dev += "${datadir}/vala/vapi/*"
 PACKAGECONFIG ??= "gnutls"
 PACKAGECONFIG[vala] = "-Dvapi=true,-Dvapi=false,vala-native vala"
 PACKAGECONFIG[gnutls] = "-Dgnutls=true,-Dgnutls=false,gnutls"
+PACKAGECONFIG[systemd] = "-D_systemd=true,-D_systemd=false,systemd"
 # vala requires gir
 PACKAGECONFIG_remove_class-native = "vala"
 
-- 
2.26.1

