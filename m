Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web08.5915.1615541521822354689
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Mar 2021 01:32:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fpaSlHOL;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id e7so6982713edu.10
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Mar 2021 01:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=afrCBDENC0mfvhpoItpNHrVlP3Wf9V8XxO25+O1GHIE=;
        b=fpaSlHOLuXUhDlTU7CRr9RNkSUbZLOtozgQ6Sc3Vd2XykX1FnIaX3+E8SYuvaN0A99
         GW+h/Qbr33HNxYhGafy23t7hyrcUZaKwJjs5vJlYOH2QiOXWZmsxTZ7uPUzFc4hv2XC3
         nHXLk7JLTHOs/rhv18E+H5qL2L43RVd+Mrax44aRDDFmLkGUpOZnO0juB1rrGcXFAjsL
         cYdYqxcWxpaLfHKCTEirU7BUXwcGcGRpu1Pb3YxhqN5kZqj6YJfejfDmA0A/V19OGjPy
         tN8yrchQib69XgTBRsusfx6jxbshgQJgfi+q2m1gBmaSzY4t21GJinpqUr0CnL59gNaM
         IWuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=afrCBDENC0mfvhpoItpNHrVlP3Wf9V8XxO25+O1GHIE=;
        b=AXk1IOalDausQ8WeTY3iSIBaGaNHy/mnd1dZHddzyuF7j7idPdE3UoylTRrHGhlrFy
         MmPnPqgEkoxxZGZ12g8pJaU5JQNqLDIbE+el9VC+Q+vhixNDCbWdTCUdX+pGwqZQpsNk
         ToSbTjYkztZ8sFk3xa7FwaGWCxqHGgcC3fT+2ZFxa5+y24UL1Z/b6pSMEHlFCL0QnvpA
         GQIPyRplcZG+1Sr7y/auosp5bh1hMGVluKBRcPKtIj14zKAkiMUDuDWxMj5wzhQciJLU
         s8fc4vq/2L3APDWh4dNpa+jz1ymiFuC+HQIn/BMb/vMKxMJczWpunKfWjJH1HazueiLW
         UeFg==
X-Gm-Message-State: AOAM532UC9EYjKu3PINLCFc54pgaU2S2Nk5ewRPEojt8c0zhiidtbHwd
	kHrwfJoQM0jSCpWUd1xl0ClwFxF2OVt7KA==
X-Google-Smtp-Source: ABdhPJyrDu8vVvlS1tQt6gOGK2M+4MfPFLJMnqnBdRrz9enqYAfyNS0bhbT9/TV48TKWn8LO6Inx2g==
X-Received: by 2002:aa7:cc03:: with SMTP id q3mr13367243edt.366.1615541520426;
        Fri, 12 Mar 2021 01:32:00 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id a9sm2635831edt.82.2021.03.12.01.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 01:32:00 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [RFC PATCH 5/7] core-image-multilib-example: base on weston, and not sato
Date: Fri, 12 Mar 2021 10:31:37 +0100
Message-Id: <20210312093139.318889-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210312093139.318889-1-alex.kanavin@gmail.com>
References: <20210312093139.318889-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../recipes-multilib/images/core-image-multilib-example.bb      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-skeleton/recipes-multilib/images/core-image-multilib-example.bb b/meta-skeleton/recipes-multilib/images/core-image-multilib-example.bb
index e7d50aefda..1290968b9d 100644
--- a/meta-skeleton/recipes-multilib/images/core-image-multilib-example.bb
+++ b/meta-skeleton/recipes-multilib/images/core-image-multilib-example.bb
@@ -6,7 +6,7 @@ SUMMARY = "An example of a multilib image"
 #
 
 # First include a base image to base things off
-require recipes-sato/images/core-image-sato.bb
+require recipes-graphics/images/core-image-weston.bb
 
 # Now add the multilib packages we want to install
 IMAGE_INSTALL += "lib32-bash"
-- 
2.29.2

