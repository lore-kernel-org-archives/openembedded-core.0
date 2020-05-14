Received: from mail-il1-f194.google.com (mail-il1-f194.google.com [209.85.166.194])
 by mx.groups.io with SMTP id smtpd.web11.1058.1589490315272956428
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2020 14:05:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jtcYlTC8;
 spf=pass (domain: gmail.com, ip: 209.85.166.194, mailfrom: jpewhacker@gmail.com)
Received: by mail-il1-f194.google.com with SMTP id q10so298784ile.0
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2020 14:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=SIBtFqazQJKnIOneyzQiL669jxY7fw7K6KmkULzPwYI=;
        b=jtcYlTC8AyAWWLIJmjpakaDRNdru4dnMoRUmvywFA9tR0CH0gY5WvoosV38YTNcK3W
         jrl986Q8Cobqi6yKucRvsW5IULdAeifhJv2HpIYvnh1kee9Va68XhGP5V5dBedEaZX62
         DqkMfOUbwgjr+h3yy56XagG7Ra27tqaE09R2rUoKxITTWfn4RuS04UGd7vjhfrjF3YOV
         BuGIAArfNE1hi8Jxaeli2u1W+tAQ1n2bYebWpYPLrYiQW8qNqyP4yh4H2qfXSZUoFzzh
         fn214vG11WdLn+0jz9xWXcfiqosp8IeQalmAF9pjmONngFMOKVGGRIdT2QbNtPAhz7Ud
         LkNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=SIBtFqazQJKnIOneyzQiL669jxY7fw7K6KmkULzPwYI=;
        b=CSuWJyUvX0QyitZTjAoVDV/rnzBGEGt76VHnSAUvAyzwXkTBDamXQK9x6rWERI3zcR
         DfRHo62wfRK9YTXif6MCNS4AqqPhwWEgtUr6Ue6W9Bhhnw0J+hi+HD6htd6EjAOhCqEj
         GV+rnwTDjScmihyTfsef5LZM+q9BTTFVjJ7u3HgH20WSwydaoJfolK8uHbuXCWAKtJ6m
         hJW0VbEMZCB4aFQNLEsp6OndakFJrJEB3u7HRL9AOLxVP6AsdFAk5cxWeMNL16tD4k1n
         xZA6ciaWB0FNgXJeEz4pcZnWVASmXaxYh71pUbRIUWd6iyVRUhnVZ1OV1pCuf63f0+K2
         ZIdQ==
X-Gm-Message-State: AOAM533Wsvtbc2xM7rdpZKzZAHNYiQ/8nozW2k2C2gaIYbGKPVl3piK4
	7bLcBc0YkR4SfdSCTyZyx9M0GMjv65U=
X-Google-Smtp-Source: ABdhPJxbt5FZfqNgzstBar2mjq+aNMhWmz28AsLPK9RVB7wbckePisYD0BO8C0GetAXoFlqyM63mZw==
X-Received: by 2002:a92:8415:: with SMTP id l21mr102630ild.214.1589490314483;
        Thu, 14 May 2020 14:05:14 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from OLA-8C37N23.garmin.com ([2605:a601:ac3d:c100:1041:f567:5747:59e9])
        by smtp.gmail.com with ESMTPSA id t20sm52356iob.27.2020.05.14.14.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 14:05:13 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: jdmason@kudzu.us,
	denis@denix.org,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 2/4] pyelftools: Import from meta-python
Date: Thu, 14 May 2020 16:04:56 -0500
Message-Id: <20200514210458.33543-3-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200514210458.33543-1-JPEWhacker@gmail.com>
References: <20200514210458.33543-1-JPEWhacker@gmail.com>

Imports the pyelftools recipes from meta-python, as of 7c02c7d41
("gnome-themes-extra: correct the recipe name").

This recipe is commonly used by other layers, so moving it into
OE-core helps to cut down on layer dependencies.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/conf/distro/include/maintainers.inc           |  1 +
 .../python/python3-pyelftools_0.25.bb              | 14 ++++++++++++++
 2 files changed, 15 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pyelftools_0.25.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index b87790e0e9..51e6da669c 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -593,6 +593,7 @@ RECIPE_MAINTAINER_pn-python3-numpy = "Oleksandr Kravchuk <open.source@oleksandr-
 RECIPE_MAINTAINER_pn-python3-pbr = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-pip = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-pycairo = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-pyelftools = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER_pn-python3-pygments = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-pygobject = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-pyparsing = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
diff --git a/meta/recipes-devtools/python/python3-pyelftools_0.25.bb b/meta/recipes-devtools/python/python3-pyelftools_0.25.bb
new file mode 100644
index 0000000000..03d96db3c2
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pyelftools_0.25.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "pyelftools is a pure-Python library for parsing and analyzing ELF files and DWARF debugging information"
+HOMEPAGE = "https://github.com/eliben/pyelftools"
+SECTION = "devel/python"
+LICENSE = "PD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5ce2a2b07fca326bc7c146d10105ccfc"
+
+SRC_URI[md5sum] = "c5629b9a5d19c82107a946cce52eeec2"
+SRC_URI[sha256sum] = "89c6da6f56280c37a5ff33468591ba9a124e17d71fe42de971818cbff46c1b24"
+
+PYPI_PACKAGE = "pyelftools"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND = "native"
-- 
2.17.1

