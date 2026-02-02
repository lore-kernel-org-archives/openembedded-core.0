Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9821D172C6
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 04:08:34 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45550.1770005306950664463
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Feb 2026 20:08:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Js9wBQ+v;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7f89d0b37f0so2033913b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 20:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770005306; x=1770610106; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qcMjXYaujTKolTPFw6o91qxRM3yVjMPueazzorFhIUA=;
        b=Js9wBQ+v3u0D8GjhWpM7g/YTi0GN+Pn8pAJ7pGwPt9HXOiVwV31fsLfJNQnAiauuJB
         uTwF5vvvplPJF8SFpW90I1dgiIK5WBrDOySnbZyMDlRDh0Cfl3DPqmc4gJCb7+7N1RMi
         hu3e0lLjxDeoMZNmem0DBcKzJBpXooKEh0fVhPY0DgqqDgIo03qF+i9ryQGdFLNS1C6N
         nKKP7XastRAM+pglm1D0A3aIHI0obtX8Af1pa9+dx6bNTe47odUNSPR2McxlNEqNB6ey
         ZRt0v/SOWwtsOvRGQXmQRPhE0FzdUTARm5VqbcsvPrljY0fUr7NzHOqaOuh5j/FOps8V
         f3nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770005306; x=1770610106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qcMjXYaujTKolTPFw6o91qxRM3yVjMPueazzorFhIUA=;
        b=nbVHPRFCTkqKAXBpIL5ifThI8F9t7CH4UPzIf4zLx703V1kSE2Vg2+DxYqVlfiwgB4
         U8E3M4iIrUNUWxbCaJfwnPIrBOJmH0YCE7mPMBGc4fu1e/FaI/eGq/frk3LaVkcDMs2Q
         RS4huvrrzNXRUhVhaFv42rUX/Uhnv9Y3LG11xLaLsFVyNlRPF1PNBeuGs0gk8Oqs7GfV
         Xz+KXTIKXLzRh1eDNnVfEdBHmFxJZ/3UMiqrKWSdjModK7jrwDro6vGG181lSBYgjmEW
         ag+TgGwNMtFcVMrJN3pHrNWArgTwoU23QoTzyeFXs8n+K94/5bBmOsyv+Ylk/sjdppLV
         XAlw==
X-Gm-Message-State: AOJu0YxVDBCf4e/VqlGGPUWFBuS09NNVILxXXEKSQerJLf6mJyB59O9C
	WVEhrNAja9Oikyf0dD2SkR9BS474ft63vzAgdGxNu4laLsIFop/2Ocm3LGY2EQ==
X-Gm-Gg: AZuq6aKsU45nasIvhWWVGtcOqHEcuNYmU8xujSeOOvX+BUCFofO9w+MgCaQyPtxOjPe
	KuhyJIcLwepGkljTjZBKNkn89bVrs8wEpJCvHCaInz6PP6UWyNMKV8YRxZm+rR/mOEz27X4VxnE
	q6Q16lDqONiKbcexI1wYNB95NegWE540lWawNYRqzbQ3vY6X3jLlV2BqF2bEfHJ/x4bLK1/cWUK
	9Lta2LdHoe6ofNFh1vx7FVnX4oylhxRxffwEKLCzcjy2gbniF+lMjgnDuJZoyrSRcn2HAkqcWT0
	jjDFYcv0wVSFFTH7w3aYJJEwXE/89Iv1f8kG9jxAr8fJemlMyvAd9/ErMWRAono6Dv1CKzhNUrN
	TB7u5vYIV30/8eblQB/0ZpKGheGPVnUxOrq37y1XnMh8k3xpBuMStYioB8XcSRkAM+9AqzNweSU
	BtGA+k7RF287OgSJjUQUS8Fjs=
X-Received: by 2002:a05:6a20:d525:b0:2cb:519b:33fe with SMTP id adf61e73a8af0-392dfb97906mr9394533637.21.1770005306136;
        Sun, 01 Feb 2026 20:08:26 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3543babe4aasm4926588a91.0.2026.02.01.20.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 20:08:25 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][scarthgap][PATCH 3/3] vim: ignore CVE-2025-66476
Date: Mon,  2 Feb 2026 17:08:05 +1300
Message-ID: <20260202040805.596021-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260202040805.596021-1-ankur.tyagi85@gmail.com>
References: <20260202040805.596021-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 04:08:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230344

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details https://nvd.nist.gov/vuln/detail/CVE-2025-66476

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/recipes-support/vim/vim_9.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/vim/vim_9.1.bb b/meta/recipes-support/vim/vim_9.1.bb
index fee9f055e9..c492342ffb 100644
--- a/meta/recipes-support/vim/vim_9.1.bb
+++ b/meta/recipes-support/vim/vim_9.1.bb
@@ -21,3 +21,5 @@ ALTERNATIVE_LINK_NAME[xxd] = "${bindir}/xxd"
 # in many places for _FORTIFY_SOURCE=2.  Security flags become part of CC.
 #
 lcl_maybe_fortify = "${@oe.utils.conditional('DEBUG_BUILD','1','','-D_FORTIFY_SOURCE=1',d)}"
+
+CVE_STATUS[CVE-2025-66476] = "not-applicable-platform: Issue only applies on Windows"

