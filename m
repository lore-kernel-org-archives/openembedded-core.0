Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C117BC44513
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 19:04:31 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1664.1784055862866967835
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jul 2026 12:04:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=X9hqFEDm;
 spf=pass (domain: gmail.com, ip: 209.85.161.50, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6a183eb9689so822263eaf.1
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 12:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784055862; x=1784660662; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vjgyLZIA8lf/bX+xEX80JEpvEnOMu8IGrydqQvfvDSg=;
        b=X9hqFEDmoeVDkvYP2ipb0Ln6pKiQJbTK++KaY4kbWT4unY5LZRRkGpS7lWXfMZ0Lnj
         DxWGgbehJqs10uKzhN5t6CIj28GZRQd14jnOlOsrbytJfhGPsw9PzxfxYtVp0iXkDA5m
         oWoOeiCfg0J4GjUzD6s+4ivcCHZDFfcokRr8GDrybkL5CmxQsavp4TZsdKaialReRMRO
         x+SoFd6eBmcbrl19Mj1pxpHtDAffyFhFLZoqFjxemF0Ps19ii2ziTuoQIfDoJ9KDkPTD
         Gt9uFz1l7SGuqojtdSCRTz798hIkMmixsWcd/V9Q7baPzgu1DN9UYm9J06P8Ip7FpgIY
         YfjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784055862; x=1784660662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vjgyLZIA8lf/bX+xEX80JEpvEnOMu8IGrydqQvfvDSg=;
        b=dQW8vL3tkBVgLwjkktiCItUU+kMeuZl55eI84mTtqu4CJ+mOOONPxzh+RsC2uS9uhd
         ztfmFetawC5edpDbxwylNTUYHMTnObMLiM9bE+ZZvIVnyMHng7vVRjFw7ajnv7FkmsU9
         A7CKlciy5p1iFLPAmxHYZ8DwFAyOIFzSUA1+0N6rLzjecP2afr4zeUp0Z/O2YvFWVuxT
         +/bmPGhDVKQT8I5gUk/HSyRy3BcypbkCVZjL1ODaOemEzJgWq60Xfl4tLPeNlv9GTYmt
         MOZeEr1RIkkWYZ+ZrV3Db18lOFeUQMqutP9B4uexT/G9BL09W7BpbmEEPqjOS0FLlG4J
         SJFA==
X-Gm-Message-State: AOJu0Yy0mHutYFh9lhKpEsHUdP4imyWAZp6GhtzOkfkwW/t3R7ubrw+c
	U+O15CLnTxKrtuw84ty71iwh/+VRs3F1841xHdGerYjDNIW39omGJIW0HtK4uA==
X-Gm-Gg: AfdE7clDZF3iWfRXGvSU5smhtTjKg4cyRkClBaVTC1RW0QIpN0VABvpJvQKIZewdkZk
	rbMwLi9vVUUjZ2zsisF5LvjgsLN+pHnuKh77rLC2mRm/ItuJ0cgdowv/GDD6RMgOdHx+nolz6fL
	n9rY7QWd4wM4bJR+lRRJJB59Qgd6LumB+s69CR7AG4k4omMiWW+gPiROnVgbfXR7yYfxRAq8FwO
	VaWnbP0j5Jh5sfy+c7EcyXhjdQQbIRe6djWBJvk76Vw5fEALU0PD4YUQcgLhZhc5FR1n7N8C3hY
	xXf9hXWPljA6Ht5PhNcEWOHWfv3bpYfsOTpYy/B3YpDnMzbE98XLhZugE9yxwA3uRw+rg9YBHTH
	rtDjNumME2z++Amx1p9XOirb5YwfZyayi8yYZxlIm2EUqDo6At/l9GHbE2gFJzXxaFHw4rwJlZq
	sTsvH5vOswZOtjfNXAjnMP
X-Received: by 2002:a05:6820:2007:b0:6a1:1d7e:438a with SMTP id 006d021491bc7-6a39a854b1amr8879566eaf.45.1784055862019;
        Tue, 14 Jul 2026 12:04:22 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::7b52])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-451916f31d4sm17695629fac.16.2026.07.14.12.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:04:21 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 18/22] classes/go-mod-update-modules: Switch to SPDX license
Date: Tue, 14 Jul 2026 12:31:28 -0600
Message-ID: <20260714190405.3328796-19-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260714190405.3328796-1-JPEWhacker@gmail.com>
References: <20260714190405.3328796-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 19:04:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240926

Changes the license generation to use SPDX "AND" instead of "&"

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes-recipe/go-mod-update-modules.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/go-mod-update-modules.bbclass b/meta/classes-recipe/go-mod-update-modules.bbclass
index 0083588a25..0dda716c65 100644
--- a/meta/classes-recipe/go-mod-update-modules.bbclass
+++ b/meta/classes-recipe/go-mod-update-modules.bbclass
@@ -92,7 +92,7 @@ python do_update_modules() {
         licenses_filename = os.path.join(thisdir, f"{bpn}-licenses.inc")
         with open(licenses_filename, "w") as f:
             f.write(notice)
-            f.write(f'LICENSE += "& {" & ".join(tidy_licenses(licenses))}"\n\n')
+            f.write(f'LICENSE += "AND {" AND ".join(tidy_licenses(licenses))}"\n\n')
             f.write('LIC_FILES_CHKSUM += "\\\n')
             for lic in sorted(lic_files_chksum, key=fold_uri):
                 f.write('    ' + lic + ' \\\n')
-- 
2.54.0


