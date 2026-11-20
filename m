Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6387.1795182829017688061
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 05:53:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=yhxw8JqP;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so7565855e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 05:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795182827; x=1795787627; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qoktkxkMmeEsBX5a7whK/5fe/YLv/jsg29f9FuRfLZk=;
        b=yhxw8JqPv5+rKOoVJOvk31VJloZ4q468FhtMnG/PEMc9VtDZuadKS5WtN+nwxWQ6Nw
         fYvGKh2piBPa4UWS+QHs+q4E8bvDOsBHTeIwWXpn57bNyCBghcoqeBDBkCnQqkqhzW4x
         TDklCnB35VD7K75KmvnQBw3/1KOHuuPekPozd57vxdRDOU/OclqF5Czt0mVmsdDCaxMk
         7a96FlLtydclBE+MCKshCxwp4HJTkoK+fnR1PVil5p+kq4g4OtY+GHUZSl82fmBIc/s6
         rcywaUfoMFixkQCkzeIStg2aYSJb9FFy1cRkleUsYT4lVcl0M8Y53S1r7BAobVsyM7as
         FqcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182827; x=1795787627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qoktkxkMmeEsBX5a7whK/5fe/YLv/jsg29f9FuRfLZk=;
        b=Dsig9Ua61sHrWQhvQrreWlkePEHB+50SnYIJQWMHyUPFsMEBZdmhbm1qtmrAnwZNvq
         hd8Yz/Ew1+Nxnz8TZgHJqf7XsqbwF0L7piGveX8HkoU10a07lduFpxvbhBxDSw+ynKG7
         a1gh4ZXlTsvx8/z5qh2M4koI9GNFNL5xEvqPYrBG6egbvWn2jeEYvNOM07QD2kzuvGb6
         HFm+GRBMGhTJhi0IHsHSJOSRCwy6Taa9UfMxhua6Ir/2/ic97kp/bIy3YAHWdYh1d6MM
         uJB3/BlnHSbrtnm/2vleBwvbAZGmo64IySIuB8aI9cQlqe937+d/2SWU8X5992BIuJix
         cdTA==
X-Gm-Message-State: APuU4Z+cJh2SI7Rz1wx3OfqfvOasPk1FfgZklbY2XZWzaQdIiinBNgwk
	LTQCpnlK5zRox9Yv7UIiPtT5eUj9ad0XUuvwTpGdqviR+HIZZ01XN93eyq/o/SCC
X-Gm-Gg: AYBFou1K/Z0PWVaoUoH+qsiqnln90ate4Pe0neZoWDt1g6CKTWwS8WOLELrOZbYcJda
	kI7Q3RKfwUWUwmY8YiHFiyp3URHrbAiEjKtvQXCY2T2nGd29TJ10iICEH5U0ZrOBYMC4EfZwCGG
	S+u9BRbIDLQGBG4TG5b1e+uMo0dKAS9fUe+oGbwjomNcsHC4ZUfUtBswj8oykTpMBNzRwjj7kND
	6NMdH4xULhIr7Om5Vlfcwp1WPJJ4DbTnylkSYM8P7UZaqno+7Jfoy2YpfWLTjtEhkTgW6FRaQgh
	+V72vRqlgmCQVO6CEPaLTqX8ZRE8HkQ1Jrnhs9KMxrZVLXYqbM9VsjizrCf4ennlL/GlsVbO3vb
	4YvaEkU831pwMwFEDh9I/SC/W5yJbFcuaQfxG/R7f4JIxFEIH99Jlyonn3Cxbmb8a655/CEpXRF
	Xxz2iNKDMAva23VId33zemCOML8YhY+116il7VSM16LM1Va22GRUDhRjO6zZwuOOG9X0gj6m3jA
	gqP857WyrK3egbhlM8LajzTuZcEgCPszWlr5qLmB52viTa3QNm+dVqDSWV8UZsUeD+avDLuml4a
	+/NYxenGuijJ
X-Received: by 2002:a05:600c:4515:b0:4bb:6f67:ca0b with SMTP id 5b1f17b1804b1-4bb888267f4mr72033495e9.29.1795182827160;
        Fri, 20 Nov 2026 05:53:47 -0800 (PST)
Return-Path: <stondo@gmail.com>
Received: from fedora ([165.225.94.251])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f6b6a6sm101009695e9.5.2026.11.20.05.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:53:46 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Joshua Watt <JPEWhacker@gmail.com>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
	Peter Marko <peter.marko@siemens.com>,
	stefano.tondo.ext@siemens.com
Subject: [PATCH 03/10] recipetool: create_npm: Give the package fallback licenses as strings
Date: Fri, 20 Nov 2026 14:53:34 +0100
Message-ID: <20261120135342.2628228-4-stondo@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120135342.2628228-1-stondo@gmail.com>
References: <20261120135342.2628228-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 13:53:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250796
Content-Type: text/plain; charset="utf-8"

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

The npm handler finds the licenses of a dependency in its package.json
when it has no license file. Since 727ea2769c ("license: Remove
tidy_licenses()"), split_pkg_licenses() writes such a fallback value
as it is. The npm handler gives a list, so the recipe gets lines like:

  LICENSE:${PN}-cookie-signature = "['MIT']"

Join the licenses of each package with " AND ", as before that change.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 scripts/lib/recipetool/create_npm.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create_npm.py b/scripts/lib/recipetool/create_npm.py
index 5edf647176..437cb91ad4 100644
--- a/scripts/lib/recipetool/create_npm.py
+++ b/scripts/lib/recipetool/create_npm.py
@@ -282,7 +282,8 @@ class NpmRecipeHandler(RecipeHandler):
         bb.note("Handling licences ...")
         (licfiles, packages, fallback_licenses) = self._handle_licenses(srctree, shrinkwrap_file, dev)
         licvalues = match_licenses(licfiles, srctree, d)
-        split_pkg_licenses(licvalues, packages, lines_after, fallback_licenses)
+        split_pkg_licenses(licvalues, packages, lines_after,
+                           {pkg: " AND ".join(lics) for pkg, lics in fallback_licenses.items()})
         fallback_licenses_flat = sorted(set(license for sublist in fallback_licenses.values() for license in sublist))
         extravalues["LIC_FILES_CHKSUM"] = generate_common_licenses_chksums(fallback_licenses_flat, d)
         extravalues["LICENSE"] = " AND ".join(fallback_licenses_flat)
-- 
2.56.1

