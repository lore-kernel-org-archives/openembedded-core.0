Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.1055.1585689198267295004
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2020 14:13:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Drukv+iF;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id t8so793537wmi.2
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2020 14:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xDHa+rB52a+ZItnuQGog1l6HqJ1r8xejMTTwa2Lv0Dk=;
        b=Drukv+iFbLXBJOrgYZThsiTVMc476oJ6Kv3bh9sbdrNgtXyYfwQ2zOFhPqJthHXVWG
         ZuRfnGPJe6KKECYxQ0223IA06t/NXAiLeG9RwNrV35QzY8dzqz35Vq4ksJj6yxW65kOH
         q54jtXGb+UD1/s2gCW5zJ0OvDGeyn94qhEI62tDLJLaMTxTAXKEt/hRiCW/hHJ0LHg7e
         NGO2v63mvGhRIIKdkMJXGOa3kUd4cPlfdvUF7tISbbgmw69/tELisemKxCxbb0sBrWvk
         EKOimPzmsytCV7p/PpAFZHsTue42YljSwFA/SXd7ak+iAx6GzTEyLEZvfcl12Nbg/hyU
         Dp9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xDHa+rB52a+ZItnuQGog1l6HqJ1r8xejMTTwa2Lv0Dk=;
        b=cVSAJdqLL2OqeGnVn3TJw4mRXn/vgOZScifjur+vhH7c61EmcH09CKI6oTsAR/LlEn
         aLI8fjeyBm2Hy/gH2hHZFqtYJsYcuzWdFdDOwMhR2lz7JzzAcJVC1kFNzIgb/CSv9NPO
         +tkz6IXOulAJgHM+62SOMBsBcfW9lWtW92gy8bTsCT7KFTVXHDfo2cEB8KxI+z44Nm7L
         KKj4BAlX+Er8/g6doWGO9gMEYyj3JUg82TyN+cd4YWAdTkxrsCdSkBzPWeXpFs5ktA5w
         gCkNNwWCeYDV6QZSkYbCnj33RICISYhOw6RGLeWDk8z6IlhnNid9VhKrwFM6DKHKokGf
         wL7g==
X-Gm-Message-State: AGi0PuaYUc4KzmCAoYFZJ7Ps07pCo6TX3ocMORFPImKGg1o2EXCKyHY8
	3Rx++0mn0PnAt2kVk/WkUvbpYabGhtM=
X-Google-Smtp-Source: APiQypLhKoSDVcoHYDhdI36tVV6ih2oqgzJtCWCcKggu7c41XnhN5Zkz6YgzJicIEipPnWoD0wE+fQ==
X-Received: by 2002:a1c:4c19:: with SMTP id z25mr770208wmf.53.1585689196581;
        Tue, 31 Mar 2020 14:13:16 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id s66sm3418424wme.40.2020.03.31.14.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 14:13:16 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH] openssl: update to 1.1.1f
Date: Tue, 31 Mar 2020 23:12:48 +0200
Message-Id: <20200331211248.4401-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This also un-breaks python3 ptest which got broken
with 1.1.1e update.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../openssl/{openssl_1.1.1e.bb => openssl_1.1.1f.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1e.bb => openssl_1.1.1f.bb} (98%)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1e.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1f.bb
similarity index 98%
rename from meta/recipes-connectivity/openssl/openssl_1.1.1e.bb
rename to meta/recipes-connectivity/openssl/openssl_1.1.1f.bb
index 8f0702b535..3fa2b41fb9 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1e.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1f.bb
@@ -23,7 +23,7 @@ SRC_URI_append_class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "694f61ac11cb51c9bf73f54e771ff6022b0327a43bbdfa1b2f19de1662a6dcbe"
+SRC_URI[sha256sum] = "186c6bfe6ecfba7a5b48c47f8a1673d0f3b0e5ba2e25602dd23b629975da3f35"
 
 inherit lib_package multilib_header multilib_script ptest
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.25.1

