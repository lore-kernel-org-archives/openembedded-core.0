Return-Path: <adam.blank.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD67ACC6B06
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 14:55:15 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17665.1775141708445016438
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2026 07:55:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=J9RD0pSS;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: adam.blank.g@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48702d51cd0so12422455e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 07:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775141707; x=1775746507; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e7o3SESJKaQF9ds83RmDprOKEcXM2fC6J7duiuApZUI=;
        b=J9RD0pSSv0Iib23s5gD3zhkqmc5uyJwR5wUW755LhHsW3E1m9BPG7XI97cI5yENZka
         bXoCAovk2yOdSG/abK7sgo6G758K9GQZHwIjn6SdYVhckCUXQG3+WhwxHFRAMCA7xTUM
         r9z2IqrkvTJgJCsdlvMKnE84epEfck9HkFM6ekXGJ1QJH151g4cgsI/5xqA3SPySoFh+
         KFMKhfLSCI26vC9Bbv+gqbZddxYCEn1F9IPfBlKen7m0VuCPOUgHxa/X3x/g+XQUxx89
         4ndC90Z598LrBxtwsTiJ33aIAduu5111oF/go7jqx2hLeqoWinoq+8gRvsG3ZZfAZkEV
         U3bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775141707; x=1775746507;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e7o3SESJKaQF9ds83RmDprOKEcXM2fC6J7duiuApZUI=;
        b=iY+ZuZVSRa3HOgKX/lc1CMSIy1LCthV/teAH7eN60TqdsUPK9CLwfgtB/k4CMj0S7u
         uXSytUf0Nkk+ewnk8WjBMWKm6tjopVXScb6H39mYrtymafsBGtPcUrj951nZdFSFYdmA
         0pLdHQ5h+dbBXnOdH7LBE4R81U5HACDBwoKKQ9lEYYTbt2ULUq4E5uCHXoxMRTgdQosl
         4Kbu5A39nSAG4CIgpprsI/U6KbOuvQdS30nFo1KamlI1o7h0HPE+W1vDPsBwo4+6s4O3
         /qGD/2BlMom5shY/mFEvecDs+v6EIeC0wEv2DxW5gPODurS03Ubc2GUTj/y1zOVgDD4S
         1iAw==
X-Gm-Message-State: AOJu0YzTNQHv8fdiXUi1TTE86tzlTcIG5+oJzwpJENdUWXbfsBQHtJGA
	FLBFNlP8RBuerVS59zFicMkstvisERE1Dbzxl4Bn5di521u3tEQC8lqS
X-Gm-Gg: ATEYQzyeF1UUEZDkgZH2SSef2EQb3Gq2J1Kdya195ZmlIIGAwl8S792v9JNy0ll6HCh
	fVU12me6MZ9KB3elnmcT4YuiNaT+oX/OzrMvJiDoyMXiXZtx2w29d69OQ9MCshgb+kL8boLrO9K
	viOIR8aJ56kmW8F1nIV/gwHurHPNpb4bjRvkjzhCWdPwonIAMiLc2V8Q20B1SoFwnSaWv6RN8wH
	RhgBRHR8fv+D84FT1oKn1TUFyE2ZlgQ6SNx7QEUHLQ1Gh82V7IjWIXesF1YUYojkS/HnPi+sDiV
	y52ySlYHqluVHhAuB7cHPIZIUzf2MHmX6KJsgMIti/gcRRRhSwyNaU84CM1c40L480Z+GnbiD9e
	S4SW3kbcnxVcbpD7dps791FXj23PNDsQyvMVpS+DpCQwDVl8HCDmF47CXYFMBPOIrTYqD37ww1G
	YPtm4yr45JbnkPif3yAgzElo7PfXRTae7zrR0VaEd+
X-Received: by 2002:a05:600c:8b55:b0:485:4526:ee06 with SMTP id 5b1f17b1804b1-4888356755amr146387785e9.11.1775141706792;
        Thu, 02 Apr 2026 07:55:06 -0700 (PDT)
Received: from [127.0.1.1] ([2a02:a312:c8a8:7a00:5efb:8aef:32b2:ddfa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4888a7162cesm98841235e9.13.2026.04.02.07.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 07:55:06 -0700 (PDT)
From: Adam Blank <adam.blank.g@gmail.com>
Date: Thu, 02 Apr 2026 16:54:59 +0200
Subject: [PATCH 2/4] package_pkgdata: fix typo to stop calling undefined
 function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-dead_code_and_unification-v1-2-5a3906b6340d@gmail.com>
References: <20260402-dead_code_and_unification-v1-0-5a3906b6340d@gmail.com>
In-Reply-To: <20260402-dead_code_and_unification-v1-0-5a3906b6340d@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Blank <adam.blank.g@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775141702; l=990;
 i=adam.blank.g@gmail.com; s=20251027; h=from:subject:message-id;
 bh=IOYO7ZmGf8Yaq8vbWWWYF20A+i1G8sJETRfG1HHOGCo=;
 b=p+/F84fqyMqHTL7B2YUqbAqHKCwVdWewURi0bBIFvGljbGRrQ8zpWvXJeP6l590Oehcf6WCoI
 yjN5HT7CNPdBrf6dqhX9Ud+qOQe4yXhAWXZsuUSxdNI/Ge3C7oo0jik
X-Developer-Key: i=adam.blank.g@gmail.com; a=ed25519;
 pk=5t8u8IPKPL1CUykIX2JYa+1iHdXRdN5MqI7ik/fbvEM=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 14:55:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234534

Signed-off-by: Adam Blank <adam.blank.g@gmail.com>
---
 meta/classes-global/package_pkgdata.bbclass | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/classes-global/package_pkgdata.bbclass b/meta/classes-global/package_pkgdata.bbclass
index f653bd9240..5312ca873c 100644
--- a/meta/classes-global/package_pkgdata.bbclass
+++ b/meta/classes-global/package_pkgdata.bbclass
@@ -47,7 +47,7 @@ python package_prepare_pkgdata() {
     # Detect bitbake -b usage
     nodeps = d.getVar("BB_LIMITEDDEPS") or False
     if nodeps:
-        staging_package_populate_pkgdata_dir(pkgdatadir, d)
+        package_populate_pkgdata_dir(pkgdatadir, d)
         return
 
     start = None
@@ -169,5 +169,3 @@ python package_prepare_pkgdata() {
 }
 package_prepare_pkgdata[cleandirs] = "${WORKDIR_PKGDATA}"
 package_prepare_pkgdata[vardepsexclude] += "MACHINE_ARCH PACKAGE_EXTRA_ARCHS SDK_ARCH BUILD_ARCH SDK_OS BB_TASKDEPDATA SSTATETASKS"
-
-

-- 
2.43.0


