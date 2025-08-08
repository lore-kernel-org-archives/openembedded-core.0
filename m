Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA920C87FD2
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 11:44:38 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.20206.1754653473456952433
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Aug 2025 04:44:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dPwro4i2;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-af66d49daffso356897566b.1
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 04:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754653472; x=1755258272; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=HlQIbIZfTFod0zs2kb8334F2iFjDcgE+FKEcBxeIeEI=;
        b=dPwro4i214WMUFlkrdSxGE1PnHAMCb8e3Ot3GtZ2TCd9A6inHcSt7tS+TuFb/pbCFY
         Z9Lk/Tv9qnp3SPchbw5843fSHTZguEYVnO2+dTYy90cyHkg5QTOEcuJgBsF5M6VgbWEy
         VflFsPH6Q2LBH4XnoN27FlRXd6picJwmsJORh0mL12Ne0XbiuyNWIjMsD+jGNk1eocQj
         YOKDJ3hNoekRO+q2sHEdaNzYOazCW60DUp87r7RrITgYakIW7ZH1lJTitE3MKi2WJF6x
         daacClNPPJNY6Yj8SKVagC1SMUCMGvbtMAf/IpwdofuVfsOcHm97h5IncEU2TB+jGGwn
         Y23w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754653472; x=1755258272;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HlQIbIZfTFod0zs2kb8334F2iFjDcgE+FKEcBxeIeEI=;
        b=TrpM/jyb2F205yHMJ34DQFqVzLzWCYov1HCuua45M16DjQ3Sg5D+9N0QRtwh5+yxAv
         8R9A77ywVp7PF6jspvOY3Pc/p2NVRubaPzMeNLsMcm4ZX1ZwzWKZzYoNr+hmb57qBip4
         zw+gLgZ+DdyDzmqXvFcOv0SN0rTPAAs/SEzEOnzk77+8aJWyI8I0NGYid5SoH3b1LeQf
         pyYh9N4ViIO8UIP1c3jGQLkXEgFKJYye43S/UCNS8/Tzvk6KQzUtiKSEfhjtF1noCjFC
         MlSBhUia8Wmhc3WcOVhrV2h5+O48UCevr91dC+jTWg2ludW30yRC+E7Qw18xl0Z7z+Xb
         RgMw==
X-Gm-Message-State: AOJu0YxodnzpwyTmOivK6yCuevqtaSwc70MD7KPVZ4J+gAAHU1J5OSoa
	yXeNsajDYeplHsviQ2xlpkNfxgWbXtOdMe1Zwd7S7EDKFw/TonKJjHS1m47AKw==
X-Gm-Gg: ASbGncuSe0yEwzQX+lDEwKyQnQ2787dtLPtD6jv4iZbJ5DLqJLQTDtNLGR5ivPVc4mA
	kKT6BPMjHM0rH0m37jzP2ZHNASqekQozncDe18N41XCLabf9egylz8JhGU7Gtv0ySYTBVzmKV5T
	wDoGon3iaBfmZEP/pwGc3YFqh2btLju0jseipauQgvX2PUrn8H+r/R2XIEociMm/BUESDOZPHWu
	z1UrbgcEo68DF0b3YIilq6ckC9XU9qvcPzjWyDX3PQoH5ZC4eCF531aKdmpnDyYum/Fwazjj3Uz
	DwXgkWFVJiJ5p/bkUUEBKoZQZtnlhJcsiUVhxaA3ExqunM7Slzo5XOmLDM6tQUTpp+4tcXSc7oB
	ePNJJY6X+80gyrU4b3T4=
X-Google-Smtp-Source: AGHT+IHSewYRdKHDciNCOnzoBxfadq0eOTVNNnaKONRfz+9uigf6G8Pp0tDqZZAfx0EilSp0qTq3OA==
X-Received: by 2002:a17:907:3e13:b0:af9:3341:8dd with SMTP id a640c23a62f3a-af9c64f23d6mr250860866b.31.1754653470286;
        Fri, 08 Aug 2025 04:44:30 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a07659dsm1468358766b.21.2025.08.08.04.44.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 04:44:29 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gcr: upgrade 4.3.1 -> 4.4.0.1
Date: Fri,  8 Aug 2025 13:44:28 +0200
Message-ID: <20250808114428.3614375-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 11:44:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221651

Due to a version number that has 4 sections, the recipe needs to override
gnome_gverdir function from gnomebase.bbclass to construct a valid download url.

Changelog:
gcr 4.4.0.1:
- meson: Fix gck vesion

gcr 4.4.0:
- gcr: Add OID for Extended Key Usage
- gcr: Avoid g_strv_builder_unref_to_strv()
- gck: Disable parallel tests using gck-mock module
- meson: Do a stricter check on GLib version
- gcr: Support parsing ed25519 SSH public keys
- Updated translations

gcr 4.3.90.3:
- ci: Another tarball publish fix

gcr 4.3.90.2:
- meson: fix library version

gcr 4.3.90.1:
- ci: Tarball publish fix

gcr 4.3.90:
- gcr: Add new GcrCertificateExtension API
- gcr: Vala override for CertificateField.get_value
- Fix meson test failures in FIPS mode
- doap: Remove invalid maintainer entry
- tests: Replace echo -n by printf
- build: Avoid redundant libegg linking into gck tests
- build: Fix some GLib/GTK deprecation warnings
- ssh-agent: Request rsa-sha2-256 signature in tests
- Updated translations

gcr 4.3.91:
- Several updates to the CI
- gcr: Implement Certificate Policies extension
- gcr: Implement Authority Information Access (AIA) extension
- gcr: Implement Authority Key Identifier extension
- gcr: Implement CRL Distribution Points extension
- gcr: Add GcrGeneralNames helper object
- gck: Add missing finish-func annotation to gck_slot_open_session_full_async
- Migrate away from g_assert() in some unit tests
- Updated translations

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../gcr/{gcr_4.3.1.bb => gcr_4.4.0.1.bb}              | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)
 rename meta/recipes-gnome/gcr/{gcr_4.3.1.bb => gcr_4.4.0.1.bb} (80%)

diff --git a/meta/recipes-gnome/gcr/gcr_4.3.1.bb b/meta/recipes-gnome/gcr/gcr_4.4.0.1.bb
similarity index 80%
rename from meta/recipes-gnome/gcr/gcr_4.3.1.bb
rename to meta/recipes-gnome/gcr/gcr_4.4.0.1.bb
index f556376258..25c394c9d0 100644
--- a/meta/recipes-gnome/gcr/gcr_4.3.1.bb
+++ b/meta/recipes-gnome/gcr/gcr_4.4.0.1.bb
@@ -19,7 +19,7 @@ UPSTREAM_CHECK_REGEX = "gcr-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
 REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'opengl', '', d)}"
 
-SRC_URI[archive.sha256sum] = "b2f070fff1840eef70546a28be80235427c116aadc593b5b68ccc869be3aa09d"
+SRC_URI[archive.sha256sum] = "0c3c341e49f9f4f2532a4884509804190a0c2663e6120360bb298c5d174a8098"
 
 PACKAGECONFIG ??= " \
 	${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
@@ -55,3 +55,12 @@ ssh-add = '${bindir}/ssh-add'
 ssh-agent = '${bindir}/ssh-agent'
 EOF
 }
+
+# gnome_verdir is coming from gnomebase.bbclass, which seems to work
+# with gcr as long as its version has 3 sections (x.y.z).
+# This version is 4.4.0.1 - add a custom version parser, otherwise the
+# original parser constructs invalid download URL.
+# It can be removed with the next update, when/if the version has only
+# 3 sections again.
+def gnome_verdir(v):
+    return ".".join(v.split(".")[:2]) or v

