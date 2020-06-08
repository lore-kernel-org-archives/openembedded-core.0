Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web10.25167.1591602517211972001
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2020 00:48:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SkWxKYNO;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id l12so13373081ejn.10
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2020 00:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LwhYup6Bnk/6jAJqBCIy3x8ofFrlumHukl4JP+ouqbA=;
        b=SkWxKYNOCxRc7vOAYu2ApKHgE1t5d8C4amUtEXW1Hmh6t2a9x5ehtQhoS/+k51CWGp
         GpTfaIc5VnxGFYeZ+Mxly7gG0T7DD17B9EJasHJikPoRYJnp/l88QLgytd7mT2pw/e7R
         JIvJbvBc8nmvXE6+aNjqnfmyjyS9BS4yd5XBePzk8XtSHWhfXV1N4pv5DwX6A1MaKV2G
         +ga3Ndgrh8hP9YL97kbSX2rCrqY28ioN+FczgHNlqBUJhxSMMfxZQKsD6yxmER+qB4L9
         l95gdah8xaJJUTGYMRIIGF4Z2TOeSQnk6SqD3N7KtsgTGehTiEdEaqexinANIolUdmWl
         oVTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LwhYup6Bnk/6jAJqBCIy3x8ofFrlumHukl4JP+ouqbA=;
        b=fNnYJPEZpNS8BHmbV3Do0zbft89j3O6PWFDqYZr6dHw5tq6fUXtQ463RlhVi5mtGgv
         fh7WoaDcMaWhAk2zPPPmQcSUUsiqjJ14qU76TnmCyycXDC3TUSyWlhj5hf5UXygItnC4
         bZloH29KZBMzSnaGJAqe7fqCnZRjr3rJsXflTNioe/qU1IruQaDOnatdmI41grIf+Qm/
         QfCHeMDuT2LkdoSDwflp98f74W/gL6KszNaJ2Fb9yTBfMk6v1SXntVBzhU6NNYGp0K4m
         ODmno8PdsDVo/PaIm3C4KXDR1Obl4IixoQ9Wi8m/J2n2p4dxG/+MbttcowHHsMDMTykv
         luRg==
X-Gm-Message-State: AOAM533FQgSLiv65F19Bgp6NqxhNqIIZ6WYdsrch2L+grItyzVUQqdPG
	XRwiJ7jLdbd5hTYCLJa8KdwON5zm9QE=
X-Google-Smtp-Source: ABdhPJxDAmDgLiJXIjFJ9eg3pn82/bozRANsVbnQKt1AiN5SC1nyq9SkWbY6QcItNG09EzbGIfYlrA==
X-Received: by 2002:a17:906:940d:: with SMTP id q13mr19956851ejx.534.1591602515518;
        Mon, 08 Jun 2020 00:48:35 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.66.228])
        by smtp.gmail.com with ESMTPSA id g22sm12473466edj.63.2020.06.08.00.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 00:48:34 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 25/42] libcap: upgrade 2.34 -> 2.36
Date: Mon,  8 Jun 2020 09:46:42 +0200
Message-Id: <20200608074659.7051-25-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200608074659.7051-1-alex.kanavin@gmail.com>
References: <20200608074659.7051-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/libcap/{libcap_2.34.bb => libcap_2.36.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-support/libcap/{libcap_2.34.bb => libcap_2.36.bb} (93%)

diff --git a/meta/recipes-support/libcap/libcap_2.34.bb b/meta/recipes-support/libcap/libcap_2.36.bb
similarity index 93%
rename from meta/recipes-support/libcap/libcap_2.34.bb
rename to meta/recipes-support/libcap/libcap_2.36.bb
index a3bd969d2b..2c98db6eeb 100644
--- a/meta/recipes-support/libcap/libcap_2.34.bb
+++ b/meta/recipes-support/libcap/libcap_2.36.bb
@@ -12,8 +12,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${
            file://0002-tests-do-not-run-target-executables.patch \
            file://0001-tests-do-not-statically-link-a-test.patch \
            "
-SRC_URI[md5sum] = "66028a8080a0891c54b202bb5e749035"
-SRC_URI[sha256sum] = "aecdd42015955068d3d94b7caa9590fcb2de5df53ce53c61a21b912bfc0b1611"
+SRC_URI[sha256sum] = "5048c849bdbbe24d2ca59463142cb279abec5edf3ab6731ab35a596bcf538a49"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/linux/libs/security/linux-privs/${BPN}2/"
 
-- 
2.26.2

