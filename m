Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web11.25179.1591602504450180727
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2020 00:48:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DeEcPD7e;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id e2so17114415eje.13
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2020 00:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1EKcl1pL2He/STQDXbIXAk14mG3dqCbz4VczO3fsnS4=;
        b=DeEcPD7eTCNeqduhz6tsFyfp0TFSCuAZ4CZTKIL3Grc1f7mj1hl5NxnDJcryikWJS9
         U4TG4JzdujVHmZw0WGTGfWo6aIbuoFIE3XN92vc2ZaCNbdDy1e9E84wRV/L5GCnZ6RBz
         p+zFKKjGPusqHyNlfZWRE9RQbfhhsQ8MfOK3edCV6icfN1KTAZU67Hc1oz9yUquFOWC+
         SwRdQW7A5t8OJz74BZUSTcEeMb4DY6v2m02a7mgWUbihoGdiz1+5kdT2wUcGbBoc5VzW
         Gimo2EZFzZPvpAUaWqOOlZeObhynoQWQ62LzahBhFkgxvfRysLYPGRH2TcL4GqVXLH40
         sBNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1EKcl1pL2He/STQDXbIXAk14mG3dqCbz4VczO3fsnS4=;
        b=FXOWlkt8eoMI8BIQQSXRye6lO9py31wDM9rNGBM9SzbDCuA8wz1JFEQFYED95bvOV1
         GN8b5JZxNU2IZ4avebHMwdjRtktju7q9ADD+FC/+btMlxh6lauzqzUlKnJnSTaKc9iwY
         vM5p0iTDhR/94GcMvnZxkeIZmfcWPZGt/I/VITn/tQzX40irRQ2zptWhIg/DUw6SaKpl
         uLqab4SLPC4ZMuu0UrvOE+ZnFsv31rC7fpa0kOmNrkzpzhCuLRBt0KGvgpZLS8emlqc2
         lPaq6WWy2XBAVirRPh4BQz6SVG1rb5zXj6Ehfw1lRkm6PiXROdpqiW9rOqoIPOBcAPN3
         Pbtg==
X-Gm-Message-State: AOAM533k5qlj9tSVOqTvMnVQS6x/eY8WyIOKbsX+/VdIbweo4BFXppXi
	j55v8obAPGFEn0bFhzFeiAK+CMOcwdQ=
X-Google-Smtp-Source: ABdhPJxwF5/CrwPsdzmHytB3y3wYMdh1tSVqkDsw5MK+78WPaYgYAAmNtTBxWniFsfuxw+4A0x0vCQ==
X-Received: by 2002:a17:906:e115:: with SMTP id gj21mr19007257ejb.528.1591602502827;
        Mon, 08 Jun 2020 00:48:22 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.66.228])
        by smtp.gmail.com with ESMTPSA id g22sm12473466edj.63.2020.06.08.00.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 00:48:21 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 11/42] libarchive: upgrade 3.4.2 -> 3.4.3
Date: Mon,  8 Jun 2020 09:46:28 +0200
Message-Id: <20200608074659.7051-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200608074659.7051-1-alex.kanavin@gmail.com>
References: <20200608074659.7051-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libarchive/{libarchive_3.4.2.bb => libarchive_3.4.3.bb}    | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-extended/libarchive/{libarchive_3.4.2.bb => libarchive_3.4.3.bb} (94%)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.4.2.bb b/meta/recipes-extended/libarchive/libarchive_3.4.3.bb
similarity index 94%
rename from meta/recipes-extended/libarchive/libarchive_3.4.2.bb
rename to meta/recipes-extended/libarchive/libarchive_3.4.3.bb
index 0ab40fc096..dbfc067b93 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.4.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.4.3.bb
@@ -34,8 +34,7 @@ EXTRA_OECONF += "--enable-largefile"
 
 SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "d953ed6b47694dadf0e6042f8f9ff451"
-SRC_URI[sha256sum] = "b60d58d12632ecf1e8fad7316dc82c6b9738a35625746b47ecdcaf4aed176176"
+SRC_URI[sha256sum] = "ee1e749213c108cb60d53147f18c31a73d6717d7e3d2481c157e1b34c881ea39"
 
 inherit autotools update-alternatives pkgconfig
 
-- 
2.26.2

