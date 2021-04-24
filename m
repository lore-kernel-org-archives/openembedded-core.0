Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web08.336.1619279804629635445
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Apr 2021 08:56:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vK4ieprP;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id t13so554391pji.4
        for <openembedded-core@lists.openembedded.org>; Sat, 24 Apr 2021 08:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=UaYjHoLNSTSrEu4rWkE67ll9pVffyvAYPJv3qsOcZqY=;
        b=vK4ieprPkIRVbHCW+mteYJ/YH6gbrsGvFthFhNZ7xQkinc0mZnF+bLoFCZF2gtFXbi
         eM6yTPPeAi9/XIRAxBhmshzzdEiKNiN0MnQmn5gZViggcipIGs+Ynb+cpvi7MmjNUX7m
         aJNcwFaJde6TzPAkgRvQlQbEr56Cs+Yi8cXXMSE/jJOpFI//Ar1MO5FkqORPsjSXvtdg
         X7l5h4DVlZnY8IWV+Fa8eDemM10krlwR8vqSmNrOPu1guB7TRsTuQNAeK/tzt2BhViMc
         XH2YPXtMuzbu6034hZAwKquVebMbZAziltmjBpH6VS9cERMixCWqKcw2u61/Qory50xs
         WaRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UaYjHoLNSTSrEu4rWkE67ll9pVffyvAYPJv3qsOcZqY=;
        b=ZJAQKibgxk9vVjAdKWqsvAkPnOhBFqb48vPG+noX78JOOZDRL3aApQv8nXFiHLhoNG
         /fdUrqkvzex7vBzocProeZEs4zqTHSH/uUhwHWz8tVJaxVDcBgTmrnnxlT3B7hlLaZ6h
         jxamKvkKMsLMlEOiBUhQ8hytxF3bxV5BoTOSS5aR9W4tPNUyPpjD/VgWqP0o3xu/NnRI
         7osPq4Ud7rXQeBz8WhNfWam3kQTvGh9vQj6izBSGpcQlsPzHFL31BaLoYW1R9dpPqlgY
         yLjXGXq82genku5Y7av18fA+FSjmOw81YDPWlALlThwnO0VM5Kb7pAegqkAD2RFSvWzZ
         VlTQ==
X-Gm-Message-State: AOAM531WmpVpv3QYA1JPA3rB59kY6mJxxa3d0rVXXZ4gtLdVD0h5RZxM
	nYHwtuDqwrDLg4RNS6uqHzJP+bSN6vVP+w==
X-Google-Smtp-Source: ABdhPJywRbKAmJBSukUeCDs65UOzYm9xBK/Xh7TQKrrf0ozpnihC8R2xlCuQitxCANZdApGh67Qyyg==
X-Received: by 2002:a17:902:9886:b029:e6:2bc6:b74 with SMTP id s6-20020a1709029886b02900e62bc60b74mr9239678plp.13.1619279804080;
        Sat, 24 Apr 2021 08:56:44 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from hilo.hsdl.ca.comcast.net (c-67-181-203-136.hsd1.ca.comcast.net. [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id a20sm7198299pfi.138.2021.04.24.08.56.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 08:56:43 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/6] gnutls: Enable seccomp if FEATURE is set
Date: Sat, 24 Apr 2021 15:56:36 +0000
Message-Id: <20210424155639.1131482-4-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210424155639.1131482-1-akuster808@gmail.com>
References: <20210424155639.1131482-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-support/gnutls/gnutls_3.7.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/gnutls/gnutls_3.7.1.bb b/meta/recipes-support/gnutls/gnutls_3.7.1.bb
index 51d472c8285..3e1958c9695 100644
--- a/meta/recipes-support/gnutls/gnutls_3.7.1.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.7.1.bb
@@ -27,7 +27,7 @@ SRC_URI[sha256sum] = "3777d7963eca5e06eb315686163b7b3f5045e2baac5e54e038ace9835e
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc
 
-PACKAGECONFIG ??= "libidn"
+PACKAGECONFIG ??= "libidn  ${@bb.utils.filter('DISTRO_FEATURES', 'seccomp', d)}"
 
 # You must also have CONFIG_SECCOMP enabled in the kernel for
 # seccomp to work.
-- 
2.25.1

