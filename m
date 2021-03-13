Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web09.2586.1615661579435255995
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Mar 2021 10:52:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=zd67cOSy;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.44, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f44.google.com with SMTP id n23so5184756otq.1
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Mar 2021 10:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=xyuNhnXDJ5gesL5YdCmXtlv7nmZ/S75DW0V06M1j97w=;
        b=zd67cOSyi/CaYfHO6j2Gw5j75mHzVRfgumECbnrdyyNy1W9UZ7Mt4uaj/H56xoPsgL
         N+Nu/E/LZ5pKYRLSOfZDd72zBSTarwCCLF5OGyKdYKTaEfavWZ6p4EfLJJWYPN9D453p
         u77t4DpMuxfdrFmtWGEjBTiaTO9K9fT99X04BwP+LpwoPifriw67NRQvIodO44lRwr9X
         MOK7NiskCREU4aY2yNrZTGyVfsEZ/si0/peDU7LdXLs5ZunH06cz2eYy8cZYUUXGUIEa
         q+9ZQz+bFPf/DYdkF6h1rE956pQlvlA0SOkT54TgMO4qD8MOHeEbX22b6kxrBfTrh8VU
         UOTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xyuNhnXDJ5gesL5YdCmXtlv7nmZ/S75DW0V06M1j97w=;
        b=t4v21tJIc2admnrYNnQLsTUvVMt988dlbX6NMJHWLxapDWSwKSoS/SSpfeNHjjzPjQ
         zCydesTYhKJOMa431AACXUBDzxV9VuQ3Z8n6EhaT8PGAbq+o6d16P5G2JzEtjOY/YrOz
         /Gm3lQAuEQ48vI4zlUN5Of+QXdC5crctZawL2L0Xj0Qw7F8bCaiE/0Lr6z/dDkgecvtU
         TUL/VxcXLloL28DXqVsX5fvj8qM/MOf7Vcr0qijl7ounEEKDOT4183PfSEeB18qIb+rH
         l08AJyz69B2nFmUmSLFgnGNBk/z3YPXYliQmt1O+9NgSyGdofZqjuck1ntm/Q/Dfj9MB
         eLxg==
X-Gm-Message-State: AOAM533nbHLYruEQRpyr+1vQc7FlhZ0MSBKln8HekbW7F16yNLxYR1sa
	uvNWlByFyTsEE8UTnKFhNNHGCkoPmy1bnG3F
X-Google-Smtp-Source: ABdhPJzlrWQm84sjl6oLNxqboEQ1cbDJKFDMBzV9mQZCm6oXyql26wrJaZknMjhThmA8pLB6PLHmIQ==
X-Received: by 2002:a9d:20c6:: with SMTP id x64mr7937334ota.262.1615661578291;
        Sat, 13 Mar 2021 10:52:58 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id d1sm3765385oth.13.2021.03.13.10.52.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Mar 2021 10:52:57 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 38/38] cups: use /run instead /var/run in systemd's unit file
Date: Sat, 13 Mar 2021 08:49:27 -1000
Message-Id: <7c88d52eaca62237afcda606a3078ec483992213.1615661221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1615661221.git.steve@sakoman.com>
References: <cover.1615661221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen Qi <Qi.Chen@windriver.com>

/var/run has been deprecated by systemd, so use /run instead,
as suggested by systemd.

[Yocto #14152]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6c3f56020da7a26c2daea73e39c2f324f1f597db)
Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/cups/cups.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 12780cf702..acad3c98c1 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -54,6 +54,7 @@ EXTRA_OECONF = " \
                --enable-libusb \
                --with-system-groups=lpadmin \
                --with-cups-group=lp \
+               --with-domainsocket=/run/cups/cups.sock \
                DSOFLAGS='${LDFLAGS}' \
                "
 
-- 
2.25.1

