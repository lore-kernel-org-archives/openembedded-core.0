Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web09.8175.1620831515165026027
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 07:58:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=0WwJX7xJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.170, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f170.google.com with SMTP id i81so22523591oif.6
        for <openembedded-core@lists.openembedded.org>; Wed, 12 May 2021 07:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=VjbsWETIjzaZyPMJ1a+DSKoDMyKx81J+WH6KF8ebOH8=;
        b=0WwJX7xJfNEUhchPM53RaknpX1TRwy03coQW43wkhTnvdMaSAwCKohOKqvlU354a12
         cyBj6E8ngIyECIleNNdcQuU7vz9aMwulxd4wGTJ8CX0askEmRWI1nStJRA+MXQDMah2k
         /9bgIhx7IcUH/STK4JSC45XjKgxOeUptU6DwtbHJCW6fnqpHEcxzIO1XFan3lc6ZUsuS
         YBR7s7UNSIfyrnOmucdsowOw8AUyFjXvylnSrxqszFZo4lP/a1S2Ho7pZXtjOlD9+rJG
         iVB0ImfpEQ0YzQAWdCTJxaELhJdz3wNOLuEkqlRFYvj+SA/YVKXRGVjRkHDuBugbhL54
         kyow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VjbsWETIjzaZyPMJ1a+DSKoDMyKx81J+WH6KF8ebOH8=;
        b=dU2OG3nZywlTij/fJH2Vo1SAvlkTt8RDf2e0lcNoHTbu+OF4RdtOXD4ko14e5EtO+K
         kxNXIzWZQEiVofaGDMlF8HqG9tzfQejQDCjTXU0iuLz29Gv53f9Pan1t3lwlECl5z6Vq
         T1JJI8Nr+iuIgaSXRddNoSXkhRa91nIKIoeohMpkM5aPf2eK59qoq5UoRwa6CTUCtU10
         Ia5jNqW0+Pf/Xw4jtLoQ7hRjW6+IS5lyxnCNTgJAL1+VNkHge4t+L4HNgaYwFuH5IPov
         4/0X1conXCiNF1j/OPOEioCmk06aYdGUyjNwzcZwZNE3pTkzxx49ViLge/RW1D7o3Qhl
         bZMw==
X-Gm-Message-State: AOAM530tXqInJ+alFn2nkXDIyXKK8ibSpBXW2Rq1un1KqC/YAP5uf1e2
	0oL5VJ5Qn6qow3MA8Ya82He6cLQRaCuKCnv0gO0=
X-Google-Smtp-Source: ABdhPJy422SYURhi2eF6H7qOWLxx4fQ5JAEmtdrl6yQOfXlhTBkzPF6olI1Nw/QL3cgDl8zgyn+wPA==
X-Received: by 2002:aca:1e0d:: with SMTP id m13mr1976760oic.51.1620831513730;
        Wed, 12 May 2021 07:58:33 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id 21sm1678otg.4.2021.05.12.07.58.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 07:58:33 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/22] qemu: Exclude CVE-2018-18438 from cve-check
Date: Wed, 12 May 2021 04:56:50 -1000
Message-Id: <14873d998284be5dd0c0feb3898650b995687f19.1620831171.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620831171.git.steve@sakoman.com>
References: <cover.1620831171.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The issues were investigated and found not to be an issue therefore
exclude from checks.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ee6ee9bd489c126b99d15c1011560df2f840a6e9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 396ff1c5eb..8f927bdf54 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -68,6 +68,10 @@ CVE_CHECK_WHITELIST += "CVE-2017-5957"
 # enable it by default.
 CVE_CHECK_WHITELIST += "CVE-2007-0998"
 
+# 'The issues identified by this CVE were determined to not constitute a vulnerability.'
+# https://bugzilla.redhat.com/show_bug.cgi?id=1609015#c11
+CVE_CHECK_WHITELIST += "CVE-2018-18438"
+
 COMPATIBLE_HOST_mipsarchn32 = "null"
 COMPATIBLE_HOST_mipsarchn64 = "null"
 
-- 
2.25.1

