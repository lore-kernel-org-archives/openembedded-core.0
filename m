Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web11.13615.1591370978484321003
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2020 08:29:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uRTuENf0;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id g1so7784396edv.6
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2020 08:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=3HjRZPIIDJK+z1h7yTaFYEw328Ua3/fID5XFl9WZUJI=;
        b=uRTuENf0WppFhReD104EK7WohLkt5kgxXhVknMN+P5krjrKGxWX6lM1t8vRXFCbtZA
         9Lb7FN2L8u84t/u2dvYQ5N6cIw0abqV/vzCosR9cY28cDB/rKUdBYgz0hwjyxmcUONRl
         jPNlBBwjUdRJjXZk7M+fpGSOKPTaWQ3FYSq1uo2oO0JadS4OSOrIbe3edruUd9i4AwGh
         e7IzOFX6Gi9JulBB6C1ycsJ7fz/K6fNRxgI3eD78rwq6AOcytN2UYa8rCheQRX7cwE6T
         NS9Vt9NG1p/02NifulmJeCGgEbKzZHMr+gQCdb8W/TO6f4ZcNDA9wT5Lye3Ko7qdxiWx
         UF6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3HjRZPIIDJK+z1h7yTaFYEw328Ua3/fID5XFl9WZUJI=;
        b=Dus++y91jMtZy2qekHq1WOk6xygKbZhWMkcs3gfqzhSUVu6xVcIFuYDkZ16hykPZCK
         goKRPqaa2kYHpPqt36170nhk3jBr6TrmFs0VgTqIHtquPpste7ZhcWWqZYHcJwgRJXeT
         QkhAzAhyr4abV1bLjWa80eJ1LR4+y6Hxw+vkO5I7gTzU59nX7V5w95DBZe3yNnV+0En2
         6ahTI9AXEs6Uy6ZcDUlrUdXmfWpjrIymMtdlO7AohdQuFS30Ez4Fp/N61V9osTnSw6ru
         qzBIhMJBCTRxbVMHofFzosBirbtK35zw4sjMfWn5Vd8GYbgSTrMByWsxvqLZwn37RBAs
         uSig==
X-Gm-Message-State: AOAM531iVFZw21BhxpZdiEjZ6o22F9jUSuPZ6J8UmwDw6Oa4IpT32vLH
	9rlfGpydAa3DAk+o+H9kUPNL5+EFBPg=
X-Google-Smtp-Source: ABdhPJw5rMcMlPjOLpZdqtrRLxLFSUsR/Kd/aU19Ig8E/c8k7UXCcBlHRrJGc7O+ZpTaTzsPiXYcLg==
X-Received: by 2002:aa7:c403:: with SMTP id j3mr9920238edq.294.1591370976830;
        Fri, 05 Jun 2020 08:29:36 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f0816493dd1634773746530.dip0.t-ipconnect.de. [2003:f0:7f08:1649:3dd1:6347:7374:6530])
        by smtp.gmail.com with ESMTPSA id o12sm5189609edq.7.2020.06.05.08.29.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2020 08:29:36 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] vte: upgrade 0.60.2 -> 0.60.3
Date: Fri,  5 Jun 2020 17:29:25 +0200
Message-Id: <20200605152927.3428858-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200605152927.3428858-1-schnitzeltony@gmail.com>
References: <20200605152927.3428858-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/recipes-support/vte/{vte_0.60.2.bb => vte_0.60.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/vte/{vte_0.60.2.bb => vte_0.60.3.bb} (92%)

diff --git a/meta/recipes-support/vte/vte_0.60.2.bb b/meta/recipes-support/vte/vte_0.60.3.bb
similarity index 92%
rename from meta/recipes-support/vte/vte_0.60.2.bb
rename to meta/recipes-support/vte/vte_0.60.3.bb
index 571fdeba9e..02a886bce0 100644
--- a/meta/recipes-support/vte/vte_0.60.2.bb
+++ b/meta/recipes-support/vte/vte_0.60.3.bb
@@ -18,8 +18,8 @@ inherit gnomebase gtk-doc features_check upstream-version-is-even gobject-intros
 
 # vapigen.m4 is required when vala is not present (but the one from vala should be used normally)
 SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch"
-SRC_URI[archive.md5sum] = "1a0b5395915d2f3c88484511b38cc584"
-SRC_URI[archive.sha256sum] = "35a0280e3f12feeb3096da05699191373c47a4a20c55cb7081e828e6015f8ca5"
+SRC_URI[archive.md5sum] = "4214712ecab2d50e2a3a07897c3ada49"
+SRC_URI[archive.sha256sum] = "feb76e1181a357d86112d447a08d127e2081438df76ece83243b18609dd9822a"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-- 
2.26.2

