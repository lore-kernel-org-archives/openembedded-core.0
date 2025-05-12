Return-Path: <ines.kchelfi@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3E8CC3ABCB
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 14:46:45 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.52309.1747061198421908597
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 07:46:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=KK6mx6zk;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: ines.kchelfi@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-441ab63a415so46032425e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 07:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1747061197; x=1747665997; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5TvvsZqoSj8bJYYMb0l6QmVZQqnAKMCeX5jIFh8I5Fc=;
        b=KK6mx6zk/AwCjyJ1M6TnfXp0CMpSeXtApsWJh+/CJGtuYM6tSs50NgDmSPhxBLjt5H
         vXOnFPVPelry+JHhk6IjAwhnpyrTiOwoBFuexpHO3J8VEGAmwN3r2gRUt1e4CEqKaCRT
         M9PafjUfEifdMF1uGVj8wukjLoYBVyhOpgDVw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747061197; x=1747665997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5TvvsZqoSj8bJYYMb0l6QmVZQqnAKMCeX5jIFh8I5Fc=;
        b=gaS4BS+y86fgxCEpb3DbbYqzS9MSdKjNLDGGQarsesdzW6Akz+74AiOx0kmyyMBSIE
         werRcIl86E7CmuXwA/IKuDEyvSAMxNhEX4EFtXU42pdPcIBv43v5o94cPtz9Yf+QBneT
         6NzISMhpGJPeUYY5Yi0vfm8cMRq/hjYyBIGypPdGxILEhYyJSOjZEXQiyKXXKtw0lhLf
         jNABvyIUKth8B9XwDOh65eG5JiuJ+8rAKZx3+OsfVtRYBKIH84SgXPmsBtjyu6QcOGTL
         UOFh8cLr6DHkFK2Ihe8He5e9frBj6udErXhWoJ9yTdSQsFgZ8OIrgXDHBLVesUcWt6EQ
         JqyA==
X-Gm-Message-State: AOJu0YzPXQVjI/XgPNeITA/SJW8exXUYL5kkBh1EK6/jAQxr3fNA5BEI
	lbksRr/Oay97tchwh04SJNPo9+BhgZAorw9NfUBD02RdZU+Io4pEwfGsBlaHrN6Y3YvDMZRIdhp
	p
X-Gm-Gg: ASbGncsWHri5DxbDhHN2yKKG7IqkWgf2pHZwPDoAKCGp2NacaKNTzl4XYElM9uEh1S0
	sxHSRSnKHe6YYwrgpmkeWe7oJ7mvZbgX70OWLnkBlrmMJNAe77s9QUrJITPAonD3VDw5fCRpUEs
	OFJxqE339hCvQTdoxev6PtcCbgCrq/bHwS4ZNNVZ6GHArrHmgAKsHmSPjr0SPQTasVowW2jSPLB
	GufOesMH3ueLSH4uYHP2QO20ZX1QN5yDaB7QJvz+gUkNPEdQlL50fS58jhhULZeeftLUP3Ue12b
	Igyeq9MnTqEL+Tom3zV0o1yPl/DWatR2QRfVc5cEueFDeUf2qbi8/C7hxhutTJXrkYw4icyuwit
	OJTHXipia03q+wJnc1u8FwSxZDSR9lVvAl7AZjBe/ydIUa0WsZ7kKB5xMKjzuMOHW34NJ
X-Google-Smtp-Source: AGHT+IFX1xLvFGNOiac9xx624j0Vo/3NoIKB2T/ZzNnYXk+NfkjUDmW9oZYVZBGYqG+aNMKfo1KRuw==
X-Received: by 2002:a5d:4e87:0:b0:3a1:f6fd:63fc with SMTP id ffacd0b85a97d-3a1f6fd6430mr8780021f8f.47.1747061196834;
        Mon, 12 May 2025 07:46:36 -0700 (PDT)
Received: from FRSMI24-WIZAR.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2d30asm12615170f8f.76.2025.05.12.07.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 07:46:36 -0700 (PDT)
From: ines.kchelfi@smile.fr
To: openembedded-core@lists.openembedded.org
Cc: Ines KCHELFI <ines.kchelfi@smile.fr>
Subject: [PATCH v2 2/2] ptest-cargo: fix tests output format for testimage
Date: Mon, 12 May 2025 16:44:11 +0200
Message-ID: <20250512144409.244102-4-ines.kchelfi@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250512144409.244102-2-ines.kchelfi@smile.fr>
References: <20250512144409.244102-2-ines.kchelfi@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 14:46:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216373

From: Ines KCHELFI <ines.kchelfi@smile.fr>

In testimage, the ptest-runner output parser expects test results to follow
a specific format,with lines beginning with PASS:, FAIL:, or SKIP:. ptest-cargo,
currently, does not emit any of those lines and the parser treats the test
section as having no results, causing a test failure with :

AssertionError:
ptests which had no test results:
['<package>']

This patch ensures that the recipes using ptest-cargo class explicitly emits
PASS: or FAIL: lines, making the results compatible with the test parser and
preventing test failures.

Signed-off-by: Ines KCHELFI <ines.kchelfi@smile.fr>
---
 meta/classes-recipe/ptest-cargo.bbclass | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/ptest-cargo.bbclass b/meta/classes-recipe/ptest-cargo.bbclass
index 7b18d43c38..ece25ff1eb 100644
--- a/meta/classes-recipe/ptest-cargo.bbclass
+++ b/meta/classes-recipe/ptest-cargo.bbclass
@@ -77,6 +77,7 @@ python do_compile_ptest_cargo() {
 
 python do_install_ptest_cargo() {
     import shutil
+    import textwrap
 
     dest_dir = d.getVar("D")
     pn = d.getVar("PN")
@@ -107,7 +108,16 @@ python do_install_ptest_cargo() {
             f.write(f"\necho \"\"\n")
             f.write(f"echo \"## starting to run rust tests ##\"\n")               
         for test_path in test_paths:
-            f.write(f"if ! {test_path} {rust_test_args}; then rc=1; fi\n")
+            script = textwrap.dedent(f"""\
+                if ! {test_path} {rust_test_args}
+                then
+                    rc=1
+                    echo "FAIL: {test_path}"
+                else
+                    echo "PASS: {test_path}"
+                fi
+            """)
+            f.write(script)
         
         f.write("exit $rc\n")
 
-- 
2.43.0


