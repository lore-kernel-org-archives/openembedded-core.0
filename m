Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 936CEC44516
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 16:48:00 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12404.1784134075826487053
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 09:47:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AP+cP102;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-44856d185bcso2069504fac.3
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 09:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784134075; x=1784738875; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vjgyLZIA8lf/bX+xEX80JEpvEnOMu8IGrydqQvfvDSg=;
        b=AP+cP102CE2jRyNvcRYMmILudodbFKXyUY12kxIJixjgW3QEFkyzPAMsK7vlHAhURt
         ss3Kp/nzuXehpUgmg/bR+f+uKU/DnYiSoNlz8FuBeM+Lo3hMriVjiD9FGo20ySu2eDAu
         TKXx1FV97PH5dQVltWKga23KiMVgKgAl9cFfMwBqPPEChGiMD2IoAjcuiIXNexUoUFgT
         7QeQzrYsSGUOhDBFef7jDj+Ox2SrrC6I6hPB8i89Bz2GcVdKNTwSfgu9m5QWkQf67Ybp
         gVSbcIlkhcFiZHmCwx5XU92ppI04R3zBXRY+tOuTtSUdCALpsrR2nBELSw3wbVdopPts
         8aww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784134075; x=1784738875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vjgyLZIA8lf/bX+xEX80JEpvEnOMu8IGrydqQvfvDSg=;
        b=p60Ey9ngYdof95a2vso8hYE0b9YxLDv2OWiMNvnfwAm3KsVz6p4+itCKixh+c9Fif4
         G8rXaCmyVZBLlokG+dEfqs3pfMcHXiku5bRZOGmalli+8jGHMFbEmxrPF9kWtAjgs74l
         hCb8Tg9UyDt3cMV4klosxri1blVPtfIFP5ZXdyktW0NIqLxcyJj6UCusMzGZLQvuTAIY
         NqyOWzeiV0OeAqFbjMnwF5YwtV7GWVwK4qGTgxu5VrDe5CEQrepzEwOmwFG9kq8s++X5
         gnQ3CNS5ksbhoweUTFoXdG2pRoNPAsn2scysOaM8MqWu3ApXArLpBykRO9LFOXG8bXjg
         Ymtg==
X-Gm-Message-State: AOJu0YzjiaBoJ+RaR72ht+zXeytFFX6SI51BFJVJmFuc/ZkFJeXoF7r0
	n66rM1Zc/yin9ofhd49bxDEIgS7SrMht4UBOseUjYf0+CVqhEDDshZ0vXhTUug==
X-Gm-Gg: AfdE7ckeAWIdts6CIx75bOXBEDSasY9exXc8DXRYPq/XK60lKvSX7MCHMCoMZAEepO8
	6t9+R+8grYOUyLhVaQVxlMBlSRPemY3N1JNGSfDoFnY2vgQTxJGwFsDx+adygiiqfUBtBDm0Fip
	5d5Km3UGJ6jknCLR+EJwRKPZunu2lb0Tcm0pE1K72hvm9hrWOkbEZB9DTBONElkrsbk+kVvfzCX
	BvG3l62bK9N33Myj4PAazJnJMZgKy/BZa6Eal/2vgL05VDEr327Atdtamm2fRHnjvjPjEdEdtCH
	pSaGshRB235iaAAiVJAtwpOE3bEH16ziSc7nLC9rxZ836lHwhqWgCPSlcKXE4/2wQXxhH6qn08K
	n4GGuJb2DgCpJQJ5YnW7Z4pWWgMaFvU0PGMAo/nyjDlu8zRN348RVkjclrc+DgSiRYazwgEd/Jc
	bNdtt4i5UPFaihYDm3aAE=
X-Received: by 2002:a05:6870:c104:b0:447:4e49:37e2 with SMTP id 586e51a60fabf-451f10e6e1fmr10808378fac.13.1784134074992;
        Wed, 15 Jul 2026 09:47:54 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::eb5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-451b64192adsm17354179fac.18.2026.07.15.09.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 09:47:54 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v2 18/25] classes/go-mod-update-modules: Switch to SPDX license
Date: Wed, 15 Jul 2026 10:45:14 -0600
Message-ID: <20260715164739.364323-19-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260715164739.364323-1-JPEWhacker@gmail.com>
References: <20260714190405.3328796-1-JPEWhacker@gmail.com>
 <20260715164739.364323-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 16:48:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241011

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


