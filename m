Return-Path: <emailaddress.ashish@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2146CAC5B0
	for <webhook@archiver.kernel.org>; Fri,  3 Oct 2025 04:58:07 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.860.1759467484992706590
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Oct 2025 21:58:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BiU0oKaR;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: emailaddress.ashish@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-77f1f29a551so2483529b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 21:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759467484; x=1760072284; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x04liVQf8lCjqu7/IX9KpgxfZCko7kcdoiyCP2CRL+g=;
        b=BiU0oKaROJ4pBBX2lnOBKk0m9yDHXnnM4Cpjo9LEN9yyLkjQOx+mJvYPFML8wjS7gb
         kwFI4k+aoJQN8btknYrs/IedQmH14sHqD11LYpk4ww+zkpSy6O3gMR7GnBrfC1+MdEWm
         bqA+8AUQYH9YoT4/Z7ThGVGOH7NgJRhqa3beGLRmMWr7dgiFf91BuEcP1eVvscjeekJP
         uw/lry3dsFpt2E2AwhxeA/6OO/kXku8R43PKE48vuvWgNEQGdI/20GcSZBJIH+BsLWEy
         RZYyarZ39aEFF5VoYTBYN5Y2DTFb2jXtCiHj8BUIrdRR1PEGwiOkx3XG4JTY31dLJDjQ
         ce2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759467484; x=1760072284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x04liVQf8lCjqu7/IX9KpgxfZCko7kcdoiyCP2CRL+g=;
        b=MYK0no8sk6/wvepKNciGRSCM6JVsvPXcx7tSNjOROClErUjI9o2bLkUnVLZ0/Vamds
         R0xtmXkHCpKR0Ys/WGyb3AtG8JJTnL1WyH1g1kIc79W1VDTIt/o/Vbtrvf1lF6IWd2r1
         YNvM1Y2B9NBh65n1dBHyA9l5dxAizm2SG1NmEU6u8un9zwZumZI7GcNL2CPHivjbWXob
         YhAxqKve6rZCO8Hr3ioLMrE/DipO0j+xQV0pnABI5ij3uL8DCXnZ9DTi8VUkj7Ai2vU6
         sO+6kKkp3F3kVVA/aBv6AILZxw8PapCmItDmZaHjNIgy74EvOnP08UZCFp7Lu6l75awt
         37Ng==
X-Gm-Message-State: AOJu0Yw3m1OYaLwo4U5tJojuxYJ7EbMwpNZrgkpW20oQ1PMScGXmGVjP
	AYdAGF/b4a6y+QfHjiTCH/wltRS/YddUTEFmhgbobAX1Mv3Pz4DTd2C70Y11+Q==
X-Gm-Gg: ASbGnctfKvp4vugWfAA0W/o0NpIjPBNOY+lUkwyP4EHWBNu+88pv3xRpHUVtQDC1iCF
	Ng3+fUBlmUECi88xAq7RwZ/0SPSJAoyLNHB8HhIkYP0oeyd1ObuM/Vk63MTpBhIXujn/DH0cakG
	nmt31fJuxOzH2WdlZ4QZBz9XepimqAPLwhZ8BwINuyGNKZLZEvcjwqYNeEMyZ71SsKptGgRsPBn
	YSvUjZbthB5H110ns5uvzMdYfZoYWnkVVEIzt4Tvmo4U3LY5/ycgmOLBCLwn8x55dgAxXPl7QJb
	3AaOevtmoEb1mpXW7kfvp9/CO2CGw1nhd2nD5qHY+P5WkYzdwV69piugo6shApffb5PkNvvRSQ+
	s7AtfDgTeJMnTipLufiya0ZW/Em+dxen+f4LtUwOaZ0xQRz4D
X-Google-Smtp-Source: AGHT+IHona1jXwiXArGVzHdZ6mNpPWyuTWZVf4wyhCqAqa/Ek2prW5Z/c5IKAEcdIjzafLEGim2RFw==
X-Received: by 2002:a05:6a20:7493:b0:262:8422:5774 with SMTP id adf61e73a8af0-32b62093e50mr2562027637.39.1759467484255;
        Thu, 02 Oct 2025 21:58:04 -0700 (PDT)
Received: from ashishkumar.. ([2401:4900:1f27:a6d9:4cd4:d55f:a1b9:36d2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6099f3bc40sm3340592a12.25.2025.10.02.21.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 21:58:03 -0700 (PDT)
From: AshishKumar Mishra <emailaddress.ashish@gmail.com>
X-Google-Original-From: AshishKumar Mishra
To: openembedded-core@lists.openembedded.org
Cc: skandigraun@gmail.com,
	AshishKumar Mishra <emailaddress.ashish@gmail.com>,
	Philip Lorenz <philip.lorenz@bmw.de>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH] 2/2] p11-kit: backport fix for handle USE_NLS from master
Date: Fri,  3 Oct 2025 10:27:40 +0530
Message-ID: <20251003045740.7695-2-emailaddress.ashish@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251003045740.7695-1-emailaddress.ashish@gmail.com>
References: <20251003045740.7695-1-emailaddress.ashish@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Oct 2025 04:58:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224386

From: AshishKumar Mishra <emailaddress.ashish@gmail.com>

Disable NLS in the build when USE_NLS is off.

(From OE-Core rev: b94798ecd535956ef4565663710ea9a701ff21ed)

This change corresponds to upstream eeb3974472429a99a724f324dc8a63e435741f68
from master .
Since the p11-kit version are different between master & kirkstone
applied the patch manually

Signed-off-by: Philip Lorenz <philip.lorenz@bmw.de>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: AshishKumar Mishra <emailaddress.ashish@gmail.com>
---
 meta/recipes-support/p11-kit/p11-kit_0.24.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb b/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb
index 72b446204a..62aca0cfee 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb
@@ -18,6 +18,7 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxslt-native"
 PACKAGECONFIG[trust-paths] = "-Dtrust_paths=/etc/ssl/certs/ca-certificates.crt,,,ca-certificates"
 
+EXTRA_OEMESON:append = " -Dnls=${@'false' if d.getVar('USE_NLS') == 'no' else 'true'}"
 GTKDOC_MESON_OPTION = 'gtk_doc'
 
 FILES:${PN} += " \
-- 
2.43.0


