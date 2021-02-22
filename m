Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web08.1653.1614033835442220347
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 14:43:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=n9aD/t4I;
 spf=pass (domain: gmail.com, ip: 209.85.210.54, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f54.google.com with SMTP id s3so10512631otg.5
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Feb 2021 14:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UYwLQ2rKkM+edKgsTDstTEYmAFtH4/ymDNR7U1w5zX4=;
        b=n9aD/t4IzKbmuDQvEicf+ojD/8y2xBUV4ppwB/BxXSWrWOUYW+q3bfQpM7708kQnts
         uCs2k6bG35NiTf4BHHI6R/kBDZWOdlzdElAKbLWlzzn3QnV3KiuH+H9s5413bgmJBE+o
         UwSxtzwoAKruLskEmXKDcQ07PXuEZhDU7XNj2GuJfE3nisgbR3IkweojxmiIbtqf0Ryk
         sUMAR7kKPyTAXTdKUGXIJRf1zr7DcLE1Cahrw0QrjhaPYtdnHAKrXwW0zLZgJ3GfXjpo
         ExO01wDhTF4WnoKPZzIBmJHCmQ4i7FQZs+r+Di/KuuT1DqCblTG/8TuNgNKOjkk8Mopx
         ohFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UYwLQ2rKkM+edKgsTDstTEYmAFtH4/ymDNR7U1w5zX4=;
        b=Y07nu9G6EEu6UokZ+JQn5KGIJ/22GrfoXPgbzn1rA8BXUvDDMT2afkLmr+NsFcKHsY
         iFTybXubcxvrayApIg9ycQFckwP76RodoHvUW4AswSv1iF2z3n0TPNYN5QeWZWaf/+rZ
         EWnMUqrfMYnrHjZkBzD37a/gPOLCmrM1+sDCPNOcxQz1wCCRQUgCYsARImHb2SlScaVR
         UtQCGyqU8qzLksKvC/Ch5kAtBXJwn/dUyTYiLJoyQc1tQiIST/P5DDXpumkgf9UyAGF4
         9i8rbjSmlpiViYocL/6fshXX6Ydtfj1VBjEN6jglrvo3mapdxdR9J6c8anNBmfaTjTcB
         cO/A==
X-Gm-Message-State: AOAM531jO7+DC4SQOdmgEfKX0ZwInAQR+/EV1V94sYCjAm8KHzAFCNef
	K1oLjjuBePMI8hSo04R0FsTzdADdsKU=
X-Google-Smtp-Source: ABdhPJzjbsCpMtba6eTDxYJ7LqaSw6od43jI30rm4klrllOAsHqJ/GKd/gowxQ5/dbb9s3jpM+nHXg==
X-Received: by 2002:a9d:674e:: with SMTP id w14mr16211496otm.264.1614033834509;
        Mon, 22 Feb 2021 14:43:54 -0800 (PST)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id l4sm3662578ooq.33.2021.02.22.14.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 14:43:54 -0800 (PST)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: jsmoeller@linuxfoundation.org,
	richard.purdie@linuxfoundation.org,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] diffoscope: Add python3-rpm as dependency
Date: Mon, 22 Feb 2021 16:43:47 -0600
Message-Id: <20210222224347.26729-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The python3-rpm package is required for diffoscope to diff RPM packages

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-support/diffoscope/diffoscope_166.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/diffoscope/diffoscope_166.bb b/meta/recipes-support/diffoscope/diffoscope_166.bb
index 14c95fe5af..888694f066 100644
--- a/meta/recipes-support/diffoscope/diffoscope_166.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_166.bb
@@ -9,7 +9,7 @@ inherit pypi setuptools3
 
 SRC_URI[sha256sum] = "20d0b4091ae535dc7d094bf5f366e0687e0b4337a268254b11925b8e7c9ea9c4"
 
-RDEPENDS_${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic"
+RDEPENDS_${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic python3-rpm"
 
 # Dependencies don't build for musl
 COMPATIBLE_HOST_libc-musl = 'null'
-- 
2.30.0

