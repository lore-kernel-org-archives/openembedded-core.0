Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web08.6405.1623744776174464503
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jun 2021 01:12:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZL1AGpdy;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id he7so20854532ejc.13
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jun 2021 01:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JJKzpIBYJ3W0nDsg9hOvNStKNW0zUfhTmifwIHCGtho=;
        b=ZL1AGpdyEv2nWOWF2Qglccs/4hKTtN54mWMZizpHI8NHuRLzCrMLQk3fkmhTAclWrd
         I8DYZ/6LeS7XgbCR5JEYeyhHylap9u9bUIxexxsJOOFtB7MhTk0bkDDjVLiZyknmyyAf
         Rl/79c/96mynV/DGlCwbbZJnCYAOz8F9B3VjVLxc3IEOOI9i/Cy8heakKHgzuvK0jkRG
         1ZdVS9EsM78Nv9inMaHAEExJdK9EbxS+ZuOVSZyEIll9N6BGAMVdXZfUypKAB4UMXdji
         zbEI0Iz7Nwl1hHuu10o+8MNbyvK0JfD1LUfQtIJnLbSkHzNXfJdJ506MTUJ06XhM7cBW
         XjiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JJKzpIBYJ3W0nDsg9hOvNStKNW0zUfhTmifwIHCGtho=;
        b=ifHX0aPHVv4GRPNb3QiH9UT3uxcxQQ8bbkqNTE25mbelK83iZBFcM5nA4mPFHweY3C
         fSrixyUup89hQu1lxEc/ZmjiEpAwPlq7j2NXqkSwmyY/R5CfFEaD54sALrCT1opHdga+
         3fWJWK1v4H37U6thq4OquP4YhkvICxJ220ci/iN0oOG2E17CBBzhAzQ8hEQahODUjTN6
         IkwT3SoSjysA/4bakMc3rpxZcUPung+hrLizUD/OJanJHfpPuVH7vAXL7gW1x4zmRDnI
         UgbrpPOmAC8Ey0j70qAMpqOhaO+EyjIYCLvsiTwS1FEewK6qMtW5nogIEXQqBSOBwunX
         kgPA==
X-Gm-Message-State: AOAM532+Bd2MoBm2r1e+UEDGyp/vq2CqA9duPS9JS4L4i+zeAdIOO7xV
	/TARgs5ouAvz6+CQ4zIROFYuKxdXHKjncg==
X-Google-Smtp-Source: ABdhPJyRF4XqqU/ntzhWRNfII+IJJVdXgrQm14AzWU8VdzQY/vOR4Rz40qS1gfKILiJACkPyjH6nRQ==
X-Received: by 2002:a17:906:e10d:: with SMTP id gj13mr19386519ejb.150.1623744774724;
        Tue, 15 Jun 2021 01:12:54 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id d2sm9118602ejo.13.2021.06.15.01.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 01:12:54 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 14/31] ell: upgrade 0.40 -> 0.41
Date: Tue, 15 Jun 2021 10:12:23 +0200
Message-Id: <20210615081240.1734087-14-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615081240.1734087-1-alex.kanavin@gmail.com>
References: <20210615081240.1734087-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-core/ell/{ell_0.40.bb => ell_0.41.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.40.bb => ell_0.41.bb} (90%)

diff --git a/meta/recipes-core/ell/ell_0.40.bb b/meta/recipes-core/ell/ell_0.41.bb
similarity index 90%
rename from meta/recipes-core/ell/ell_0.40.bb
rename to meta/recipes-core/ell/ell_0.41.bb
index d088676221..5fd3077bc3 100644
--- a/meta/recipes-core/ell/ell_0.40.bb
+++ b/meta/recipes-core/ell/ell_0.41.bb
@@ -17,7 +17,7 @@ inherit autotools pkgconfig
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz \
            file://0001-pem.c-do-not-use-rawmemchr.patch \
            "
-SRC_URI[sha256sum] = "b9bf5c14f2963591ea1372049c05646919a9ed46fcee5cd11ede1022c99ffbbd"
+SRC_URI[sha256sum] = "4e8dba6c53cf152dbd0fd1dc3d4c7b04abf79e20a948895f85943e586870505c"
 
 do_configure_prepend () {
     mkdir -p ${S}/build-aux
-- 
2.31.1

