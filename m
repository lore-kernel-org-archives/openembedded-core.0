Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.34080.1607949315675691191
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 04:35:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZXAO4FGw;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id a3so15051424wmb.5
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 04:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=gKsyFr2fMmDT2ZcirkKBWNG2SCNC5sGzNTkktZfPS6w=;
        b=ZXAO4FGwhAUX/lbBQaYx2m2H3h5mVUs0bWoDGeEINnUNAbGUKGmquatP00VfhlrLz2
         WbwJBZnHngM5Y5H5myCu3GA/AY48VuUJ4j6CrqBjvll+GZUraV4jvG1T0VScjQOpjCTk
         2FRgCZkAIqfy0SY7tOWXG/0jzJa/lWlSM/RS9FHS5GiJ05FvTG2C/9UVfChmWzGkNI7U
         SXyXjUi9/Ooq7bBXHdz27mkTGplghAW67rL/jCNOXHLF0K+lGHic1G4Omdnt0ec/Yneg
         7NqKATVYkYlK12l89JYogSGWtKUyxcddsMLegPf4MH/7ECfnzVnrC0bfPTeAOgIjjS7p
         DxdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gKsyFr2fMmDT2ZcirkKBWNG2SCNC5sGzNTkktZfPS6w=;
        b=CwhIRI8pwcqXvBjn3z65BHD803G57+6ZjPgOwcfWzwMO5gnq+AUWDsm33zdGjk8DOI
         A3A3Q/pIolRKi/3zaOH3wzL2oYVZEytpITZiF2aOAbElPqyBWv/iiwcxLZjZmIe1wf/H
         j8Kh2EjpwCpcgnT+fzxP3BCZ1CzyDbX2BjcxA6imuQyxvpv7qELYDgGQfK5GbXoM1shz
         k0EHIGNR0WYArx5p+0NELkttXivoiREyTFrfhBAo9JV0oDoI6YjVuGZs0UZNFz6cVtdt
         fBS/N6C2pupXxKyhxl7CaEyR2bZ3L52ogUDxnPX08QYCZackIPckklIFXAYhXAOtYVwN
         E2jQ==
X-Gm-Message-State: AOAM532014NjmVtSO5/E58dBsHKkK1UAdgWWJmiUL4/EejGbOEDLvxx7
	uw9dyf0cO7XBjV3MCxA9RiDbQmk+CB/G/w==
X-Google-Smtp-Source: ABdhPJwyjOc8fMlc9HeDPW81uGtcoxheCKLZzGJoxsuVI2MhDR4YV9i5uShQTlgorpUjTERkJbov3g==
X-Received: by 2002:a05:600c:21c7:: with SMTP id x7mr26796540wmj.75.1607949310126;
        Mon, 14 Dec 2020 04:35:10 -0800 (PST)
Return-Path: <luca.boccassi@gmail.com>
Received: from localhost ([88.98.246.218])
        by smtp.gmail.com with ESMTPSA id i16sm29243678wrx.89.2020.12.14.04.35.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 04:35:09 -0800 (PST)
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 3/5] systemd: ship new systemd-dissect in -extra-utils
Date: Mon, 14 Dec 2020 12:34:55 +0000
Message-Id: <20201214123457.122655-3-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201214123457.122655-1-luca.boccassi@gmail.com>
References: <20201210125312.3302065-1-luca.boccassi@gmail.com>
 <20201214123457.122655-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
 meta/recipes-core/systemd/systemd_247.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_247.1.bb b/meta/recipes-core/systemd/systemd_247.1.bb
index f20c2cffb7..09dce2e07d 100644
--- a/meta/recipes-core/systemd/systemd_247.1.bb
+++ b/meta/recipes-core/systemd/systemd_247.1.bb
@@ -471,6 +471,7 @@ FILES_${PN}-extra-utils = "\
                         ${base_bindir}/systemd-escape \
                         ${base_bindir}/systemd-inhibit \
                         ${bindir}/systemd-detect-virt \
+                        ${bindir}/systemd-dissect \
                         ${bindir}/systemd-path \
                         ${bindir}/systemd-run \
                         ${bindir}/systemd-cat \
-- 
2.29.2

