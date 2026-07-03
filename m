Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60810C44502
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 08:30:09 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87929.1783067401313523358
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2026 01:30:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OzXUgKMb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so1823255e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 01:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1783067399; x=1783672199; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5/3+C+xF7zdeBlAPHGTw2aLlOEB0qr4bm4BfPxONYcM=;
        b=OzXUgKMbmM/c3r7izDuSWIn7EjGw30a1Ljxq2h5z6ix84etmtfvdmQZ2bZWxYcUKzA
         6/1nwScLjelFDfGLtpwbWetUPrYOKP016Kc32keTEoEc1TQcJo5ABOI+Ym0GYZ9kGsP9
         wSgNrdyY7jAS4T42FxhQRzUfhY4S0RWlYkbfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783067399; x=1783672199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5/3+C+xF7zdeBlAPHGTw2aLlOEB0qr4bm4BfPxONYcM=;
        b=otrjaoT90emW8HRNkONLWUtobRIMKY5OZ56EVrf2feRn/+qcTc6h5nDJTDzg+AvxCQ
         RWpxAKlUiUA8BxOhAbrLAjp2q3TBgCdLWy32frXYas+MZXYMGUs2jJH9gWuxLld2yBSY
         FXMaGi/Rht62TUCWvPR0sjmaX8yEsCynKyfcdJ0EnUU42frulaT1k+BDDPElM3zpdxd2
         sX3XJ640QXlmQUDmsIidzR/5e+Gjmfogacpglr6g/5pgoQmu1bkasOKbMnrCDQ2+aEO8
         geMSSuFqcK8FUr0bXwo9sQpC6fRfI6X38Ezg6N6ryLVK2s6evtzK9g1G4pHjKbNgLX+i
         zmsQ==
X-Gm-Message-State: AOJu0YywYw9BLPaQW/e4Yphu6SOYd0/kpTVTnHwgD3wKSSQ3lO4Uwcgk
	cbOctmuIv/UwyFyPIvwD0WO41aonZoQjOKlWesV15d0K33O5bY+lf/JJV0AXfQbzlumIPbhlN5N
	Q4YjuTKc=
X-Gm-Gg: AfdE7ckh5y/+sk1tJEO4jOC2YIjVm2ABu7MvBnEPzFR/Mv+rqzCNOG5h+W9gMu7HhIi
	26A4WkBxpwyjo9TyWMv0NOiqfzn+nneYXhvcZemzI+t7wMl1CsrLYgQE5ZU/bTtxB6DiNVcrMM+
	oE0D9Hu1uHQnNi5NJQyzbr1QuHfi6yb/5kshL27HWofIUOXti37Ge/zZIjsoHBTvqGJodPgt8D9
	izF8lKV0WHCXy8xDV+xUuP5DCo9j8xSGrUI5w4zM9yD/VSt/kOqmqDYXXE7vjPFL0UolxtcVR63
	B5c4dEtb5jWwHGbOeC0CNN4GjK81tNoFvTP7bCuJ25AGFZJSgP9w1XnrKYs4IT5rZXWL1WwPkYU
	lNHw6Y2VQSEo3R/MfAA3pPSUIGifgc25jpcGJmciluddyQND/r6x1WnyeAuIOGtieiCo3uRuxAA
	xna083LyEZ7IIFwJKF5BcioSp8TuRYCChz0xJGCD8+zA==
X-Received: by 2002:a7b:cd89:0:b0:492:4363:e7d6 with SMTP id 5b1f17b1804b1-493c2baab82mr79960945e9.37.1783067399534;
        Fri, 03 Jul 2026 01:29:59 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ad8d:cf49:9149:eae0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db3dbb79sm15684554f8f.2.2026.07.03.01.29.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:29:58 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/15] python3-typing-extensions: upgrade 4.15.0 -> 4.16.0
Date: Fri,  3 Jul 2026 09:29:43 +0100
Message-ID: <20260703082955.1585712-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703082955.1585712-1-richard.purdie@linuxfoundation.org>
References: <20260703082955.1585712-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 08:30:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240085

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...extensions_4.15.0.bb => python3-typing-extensions_4.16.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-typing-extensions_4.15.0.bb => python3-typing-extensions_4.16.0.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb b/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb
rename to meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb
index 4ff85bb2407..cede81e1289 100644
--- a/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb
+++ b/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=fcf6b249c2641540219a727f35d8d2c2"
 # The name on PyPi is slightly different.
 PYPI_PACKAGE = "typing_extensions"
 
-SRC_URI[sha256sum] = "0cea48d173cc12fa28ecabc3b837ea3cf6f38c6d1136f85cbaaf598984861466"
+SRC_URI[sha256sum] = "dc983d19a509c94dba722ee6abd33940f7c05a89e243c47e907eb4db6f1a43e5"
 
 inherit pypi python_flit_core
 

