Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web12.12112.1628096420256997629
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Aug 2021 10:00:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Q7QUP/Dz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id z4so2999063wrv.11
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Aug 2021 10:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4+woO9D89kQKi1Q53R8xPtQydr6ijN9H68rSWKLzfZM=;
        b=Q7QUP/Dz2wFiS/1xrxLSYoHNgIhqQ88KGqvrG1/llVk6w2VBkcV/l91t5CC0DI9HFs
         SNlUKvAQK0Zwr5jtqkbsR3nn+iDKnezhMppTZ6Xc5y3zhCNkCIC0mXjUfAZlHY+Zcxaf
         YmhOJai5H58ReiD3t79p9nGM4WFn3yMiots7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4+woO9D89kQKi1Q53R8xPtQydr6ijN9H68rSWKLzfZM=;
        b=br8RGJAEZb5RgO4dQtEV6GNcNrf9af9I2FN/1ZW1j+xe1MtwheMeaNyPBWFpyWe0BH
         ldUnxAi5mksKREWwQ7FDCloImEeWrtrT70e7zo5ELSgGL93CB4t9CoPBs8TKu/ETQJLt
         z56a5Ex4upqad0z2pt98dFyssfYGRljjM+W+zH3YfSUweX4RhEn4Kez0BQ01xR93Rusm
         KuyWSP6xffU4lAVsQBscxwQ5IB1DnlsN1nN9HTVnKzU9KOSQSfc4f1A3iv1ZmApdkzDy
         +sAUfp7W3LLbOKzelULJQhU312S4AqsNOURKniIonPLfz9Yvf6FkNIubPcpqAxrMr4k7
         BLtw==
X-Gm-Message-State: AOAM5329m0UrkohLDNxkEOjioAc0fwVRmjjuvlxEGfYhXVYYNtFE8kA6
	2e8HJlQiRQCpsCaPaX5+VQbjmRZ3B6UQMQ==
X-Google-Smtp-Source: ABdhPJySMw2+IwBWsdiZiKtkvDcEh2RyijvpLOMbdV6egTxZBPxijOWJetT2HapiBO1eSHsUbcwGPQ==
X-Received: by 2002:a5d:5905:: with SMTP id v5mr328092wrd.205.1628096418680;
        Wed, 04 Aug 2021 10:00:18 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:895b:15d0:6c2e:72fa])
        by smtp.gmail.com with ESMTPSA id s1sm6444221wmj.8.2021.08.04.10.00.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 10:00:18 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] diffoscope: Upgrade 178 -> 179
Date: Wed,  4 Aug 2021 18:00:16 +0100
Message-Id: <20210804170017.3532883-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../diffoscope/{diffoscope_178.bb => diffoscope_179.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_178.bb => diffoscope_179.bb} (92%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_178.bb b/meta/recipes-support/diffoscope/diffoscope_179.bb
similarity index 92%
rename from meta/recipes-support/diffoscope/diffoscope_178.bb
rename to meta/recipes-support/diffoscope/diffoscope_179.bb
index 7d685210b7c..dcd2698ee51 100644
--- a/meta/recipes-support/diffoscope/diffoscope_178.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_179.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "7454cf417725ef81ffad16e8cc2f62753282f5171b1c651732b99c0b3c19e137"
+SRC_URI[sha256sum] = "17790d463b757b6d05e0734db06ba5e79ac63fb64bf9b834dc7440477582a38a"
 
 RDEPENDS:${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic python3-rpm"
 
-- 
2.30.2

