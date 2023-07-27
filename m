Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88434C04FE2
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 14:36:40 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.8981.1690468595632452000
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 07:36:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=lChpGPjF;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5221e2e69bdso1304906a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 07:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690468594; x=1691073394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wRgOkBokCBTcyZyyKIxKd8wsMMd0ZvX/RBv/S/kiWII=;
        b=lChpGPjFc3xB0skJcbQoJ4HVIvzrRFyhyA+f1lghI67LLPtCVBBb5cqAEQbF0fhy67
         GWGxW5Tgvm5y8hSfNW8fNvVDl3M3A64iUteIDPCu5HlC+V5QcTo49UAU9dVqP03XqZpa
         15wnRIIyLJ3PZ1KGdzkScAVMe0qbq8pyI/ldqbeKJ6iX9d96zBNJRQOoq+pzSsSxM0WL
         8GfQcyn9qjs9E6/FkvdVDuF8u4ulq4n7MDYHg2enLU/llyUYeM1c3mVrw31z6yp9cU9B
         Dw26zvpaeInTV+6gEw+OdKLMtq/G6fTDxcwaGUTGc/Mma2rBCl25CJBP4DBPgMYpOUR4
         NJ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690468594; x=1691073394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wRgOkBokCBTcyZyyKIxKd8wsMMd0ZvX/RBv/S/kiWII=;
        b=HE0xRhatNvvfrAvgR2kGeRZqe3Fw06IZVzjCfLu+thKdPcv32xPExxigIApS1QovUb
         7cAOh+dIm7dPG2IzfJj9CNdkdlQg8XkQopj/X+lfBNPQyue57xTCpZNXkI2z6g3EFhba
         V3BGW+Vy6og+nsMf0J0RylcJrkJsL689kHRAmlxBAdbbUWmdAjcTFyV6LqRCD42gcHkp
         jj4UMGE8APXsehHHovnJDfZSjKVoHnD0UCHqimm6+51zQ9SoQvJ1yWe315CTO0hdlA5A
         6m1MY9PySZEu9+3pW2A7A/cOFqWjhz3bSEm5etgwQPQJ5lheOP7FJYPkFDuVqXWEYYgE
         qTuQ==
X-Gm-Message-State: ABy/qLaFBQey1zLOis+vWgyJFOF2RySpgXqncm2AepsmK1kmfppCPOms
	2qXdt8+Oe7B+VhPeGotbZcKNWeiuxm4=
X-Google-Smtp-Source: APBJJlGuoudd1goEl5XgkqcwxPvZF5vsnKKX6hLaSJsvBQKgPGqsZz6NSEy6yFir42e/dUksVqJvrA==
X-Received: by 2002:a17:907:a057:b0:997:decf:11e7 with SMTP id gz23-20020a170907a05700b00997decf11e7mr2184515ejc.12.1690468593572;
        Thu, 27 Jul 2023 07:36:33 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m10-20020a17090607ca00b0099bcf9c2ec6sm846725ejc.75.2023.07.27.07.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 07:36:33 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 07/21] acpica: tarball and homepage relocated to intel.com
Date: Thu, 27 Jul 2023 16:36:13 +0200
Message-Id: <20230727143627.3718496-7-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230727143627.3718496-1-alex@linutronix.de>
References: <20230727143627.3718496-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 14:36:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184947

Sadly the tarball link is hidden behind html button trickery: while
the link seems stable, determining what it is is too much for
our upstream version checker, and so new versions will
have to be checked by hand every sometimes.

Switching to git won't help either: the tags are in MMDDYY format,
and so won't sort:
https://github.com/acpica/acpica/tags
https://github.com/acpica/acpica/issues/886

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-extended/acpica/acpica_20230628.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/acpica/acpica_20230628.bb b/meta/recipes-extended/acpica/acpica_20230628.bb
index 06db99cef5b..3b939ad6652 100644
--- a/meta/recipes-extended/acpica/acpica_20230628.bb
+++ b/meta/recipes-extended/acpica/acpica_20230628.bb
@@ -6,7 +6,7 @@ ACPI meant to be directly integrated into the host OS as a kernel-resident \
 subsystem, and a small set of tools to assist in developing and debugging \
 ACPI tables."
 
-HOMEPAGE = "http://www.acpica.org/"
+HOMEPAGE = "https://www.intel.com/content/www/us/en/developer/topic-technology/open/acpica/overview.html"
 SECTION = "console/tools"
 
 LICENSE = "Intel | BSD-3-Clause | GPL-2.0-only"
@@ -16,10 +16,11 @@ COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 
 DEPENDS = "m4-native flex-native bison-native"
 
-SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix-${PV}.tar.gz"
+SRC_URI = "https://downloadmirror.intel.com/783534/acpica-unix-${PV}.tar.gz"
 SRC_URI[sha256sum] = "86876a745e3d224dcfd222ed3de465b47559e85811df2db9820ef09a9dff5cce"
 
-UPSTREAM_CHECK_URI = "https://acpica.org/downloads"
+UPSTREAM_CHECK_URI = "https://www.intel.com/content/www/us/en/download/776303/acpi-component-architecture-downloads-unix-format-source-code-and-build-environment-with-an-intel-license.html"
+UPSTREAM_VERSION_UNKNOWN = "1"
 
 S = "${WORKDIR}/acpica-unix-${PV}"
 
-- 
2.30.2


