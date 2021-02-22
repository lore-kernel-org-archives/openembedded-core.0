Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web11.826.1614030377237864414
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 13:46:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ZNOwmmvG;
 spf=pass (domain: linaro.org, ip: 209.85.210.51, mailfrom: anibal.limon@linaro.org)
Received: by mail-ot1-f51.google.com with SMTP id 105so7134433otd.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Feb 2021 13:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ni1Y9ZjK93VPQp4YvxhA2ypQPe0HNTd1tKD5eHdYuZI=;
        b=ZNOwmmvGuONTI1jwAOmpG1tK90aKJhIlMmnJ/5h/r1I/nWezLuM77ua9rVZJusOmGh
         ZKzUp8/hgFvEPu8Y8WytlbyY0t4Wiyq+fcGvrpR0BQXH97hp7Zlzy4I6nuunjB8Jpg0q
         pIIuYG8cEBx/vhDebDZ2gokneMx69DRzjRw798KrNq2x1M+8lmUoTP7g8FpWqHksD+sb
         iZrMtra0q1n7jpwKRHckD0s7pAAYZtQD8vnrnHo6ROco7XRdKQt7Ia9YVnzsj+/DhXYG
         ujlkkias2FYlIgXcFrF6DrGxGYDXFqpY2Aq2WgoKeA5EpicliGfSHc25Rqwg/pdfEX9c
         mDlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ni1Y9ZjK93VPQp4YvxhA2ypQPe0HNTd1tKD5eHdYuZI=;
        b=rgDF21Y24y6jZ663wfceJKe9J0Fc/ywjz+M9V6q9Yq4EHw6/tnJSSP1m9c1E5f0jXi
         fGLpLJ8GxH7aQhbh4o322p498V3UQdeLfbgiEayMUwhlDERLkTyYL4GyqWvS1T0Bz65J
         Mps9vKRTR3B1JZgn2TEWzGZ5/rg6qqyXjBdrP9G5k65YQYCtbQSi6t/9SwiUTJ4fhYz+
         aoH7F7XvoIfi8vHA6+Rm09sw3z00BmeESkrnuoWoWn7+8zvJZKmOzgtzIbTQdLR1PzwH
         XWmV+RLJD0AkuN0AXLwZX2A8GFRcXkcBaURI0V83jaEwr/WY++ZK5FhGHQGdX6Neez4m
         fvRA==
X-Gm-Message-State: AOAM532JpTi7ncPzltDqil5UFNyfc3ED0+6PkeD4kUmrUcdECAA/TBIx
	R/501vKA4Tmfn6IzxbpMNBqMvnwwPJ3OPg==
X-Google-Smtp-Source: ABdhPJwLC9nbtCcnLERKhYrSMK/rUHw6HILduShHrektfvHC9e6mVgwpzXkkx6KVxp8O/ND+KWog7w==
X-Received: by 2002:a9d:2c2:: with SMTP id 60mr17716207otl.357.1614030376516;
        Mon, 22 Feb 2021 13:46:16 -0800 (PST)
Return-Path: <anibal.limon@linaro.org>
Received: from blackbox.Home ([2806:10b7:2:8299::1])
        by smtp.gmail.com with ESMTPSA id a23sm1206987otf.20.2021.02.22.13.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 13:46:16 -0800 (PST)
From: "Anibal Limon" <anibal.limon@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	ilias.apalodimas@linaro.org,
	=?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
Subject: [dunfell][PATCH] pseudo: Bump to rev 60e25a3
Date: Mon, 22 Feb 2021 15:45:08 -0600
Message-Id: <20210222214508.119351-1-anibal.limon@linaro.org>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changes,

60e25a3 (HEAD -> oe-core, origin/oe-core) makewrappers: Fix glibc 2.33 fstatat usage issues
77d2898 ports/linux: Add wrapper for fstatat/fstatat64 in glibc 2.33
d03de55 ports/rename/renameat: Avoid race when renaming files
c838d8c ports/unix: Add faccessat and faccessat2
7720723 ports/access.c: Use EACCES, not EPERM
f332f56 linux/portdefs.h: Fix pseudo to work with glibc 2.33

Fixes,

...
Exception: subprocess.CalledProcessError: Command 'tar -cf - -C /home/builds/oe-rpb-dunfell/build-410c/tmp-rpb-glibc/work/all-linaro-linux/os-release/1.0-r0/image -p -S . | tar -xf - -C /home/builds/oe-rpb-dunfell/build-410c/tmp-rpb-glibc/work/all-linaro-linux/os-release/1.0-r0/package' returned non-zero exit status 134.

Subprocess output:
abort()ing pseudo client by server request. See https://wiki.yoctoproject.org/wiki/Pseudo_Abort for more details on this.
Check logfile: /home/builds/oe-rpb-dunfell/build-410c/tmp-rpb-glibc/work/all-linaro-linux/os-release/1.0-r0/pseudo//pseudo.log
Aborted
...

Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 0ba7b50355..17bd02c27c 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -6,7 +6,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://fallback-group \
            "
 
-SRCREV = "8317c0ab172db47dabcef909bae02cd77b1f1010"
+SRCREV = "60e25a36558f1f07dcce1a044fe976b475bec42b"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.30.1

