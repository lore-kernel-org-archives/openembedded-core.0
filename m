Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web12.47180.1598851217724469933
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2020 22:20:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vLlS4UJQ;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 5so5086pgl.4
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2020 22:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4+E++Wwnmd8aX2P04+isl18OnSp0tti4EFcp/Pnu3xY=;
        b=vLlS4UJQHr4YzYpYjZzqWJkvjpijymUFAPtR9wTcIYUpCYK5BaJwwxGav5EGwHEh+t
         pd66N1V814fdXbJN9MLmchcwMrL1co32WXOYY8Jnlsa794V2kG2N+qEcaVJDnt9Ub+6F
         8QiJKvB496oJgpV7YetZFwWnJbleaZ/qJ1E1rYKaismrygdEdQTEvG1ufKbbDSsF7hft
         hZQ68C2vCPgZut5Ei+VdaXIjFTws79KhhqG9uiOiWpjRI3D/K2Kznhg+8Eo80GgsGrX6
         iJ2Pq6FSqimHw6SKX7I6Voi84q/nSXA6cFrI1xmjeQV5NqkfOgBY8d8Gj49F0hGM5xDE
         tOUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4+E++Wwnmd8aX2P04+isl18OnSp0tti4EFcp/Pnu3xY=;
        b=r9EXmrSwEBmfipLkzS23HX2IA9QsxGaM48tJGb48pH07/0Z8CkzXtezpDJ3bFqJ0tj
         PeVC7Gh4X5TynaWqqqasVPJ9fePMclp5qnaAR2psCDTXo8uPVjid+EfCgpQJ4WKxTnlu
         a1QVW2PDuie/MdKQC5KI4gm2l9OU4vkDZkKtxQ/4WalQwvnUI4pLR96G0W4fUPplqP9Q
         Gbx4ueS+7fyQhaBYv1SahwZSFHodMGyToHIpmYbdr7KHOu3F2Kl9b6kY05+rJHOOTE3E
         nXKZnfwxDftNBfCpXRXufUMrdC87OrOe7GlRWYi1WBR3HBz695iiTBGEH32WWFxb6xQf
         mhjw==
X-Gm-Message-State: AOAM533MD9xIkqZmYjjwyd1LRPutcguRT3v+FDNS3Vaf5XaAeXiOD2wP
	Lp6Q0J06c+XEpzMKaZ6cDa3uhO2VStJa3A==
X-Google-Smtp-Source: ABdhPJzJjJcY2Lw+EBrn7yKOg4AkkZkeI6/Z/4/tqDsUyM3oZb9D4vkkTM3JqIK97gxXB2IXLpCJZQ==
X-Received: by 2002:a63:490f:: with SMTP id w15mr3839061pga.323.1598851216993;
        Sun, 30 Aug 2020 22:20:16 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e89d])
        by smtp.gmail.com with ESMTPSA id r123sm2779674pfc.187.2020.08.30.22.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 22:20:16 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/3] util-linux: Allow update alternatives for mcookie
Date: Sun, 30 Aug 2020 22:20:11 -0700
Message-Id: <20200831052011.955722-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200831052011.955722-1-raj.khem@gmail.com>
References: <20200831052011.955722-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mcookie is also provided by toybox

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/util-linux/util-linux_2.36.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/util-linux/util-linux_2.36.bb b/meta/recipes-core/util-linux/util-linux_2.36.bb
index 2fac9793a2..7a88285fbf 100644
--- a/meta/recipes-core/util-linux/util-linux_2.36.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.36.bb
@@ -263,6 +263,7 @@ ALTERNATIVE_LINK_NAME[logger] = "${bindir}/logger"
 ALTERNATIVE_LINK_NAME[losetup] = "${base_sbindir}/losetup"
 ALTERNATIVE_LINK_NAME[mesg] = "${bindir}/mesg"
 ALTERNATIVE_LINK_NAME[mkswap] = "${base_sbindir}/mkswap"
+ALTERNATIVE_LINK_NAME[mcookie] = "${bindir}/mcookie"
 ALTERNATIVE_LINK_NAME[more] = "${base_bindir}/more"
 ALTERNATIVE_LINK_NAME[mount] = "${base_bindir}/mount"
 ALTERNATIVE_LINK_NAME[mountpoint] = "${base_bindir}/mountpoint"
-- 
2.28.0

