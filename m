Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
 by mx.groups.io with SMTP id smtpd.web12.159280.1598120434841254626
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Aug 2020 11:20:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FCIzq4KW;
 spf=pass (domain: gmail.com, ip: 209.85.214.193, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f193.google.com with SMTP id g15so2333272plj.6
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Aug 2020 11:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=I7y3obWjn67TN7HBEqShbRqBKYWSoQwNYE6e4LIj/a0=;
        b=FCIzq4KWGjsszpRTyQI/DwlR/TU3CgJLrRSqjzp6wxUfQ8mfDZmf85rOK2We9YNDvS
         DRjQUJyGABUadwukAqahBZtp5Ajiqf+BOkQOoRqpyKSQv4EviRIOzoQPbY/HLazjrGfs
         acMPZ5nffmw6BLM3b8UGt8s5E7kaBGUy4amyxhP0JgaSC2+8sGpymQkhGtz6s5Vove4K
         cYVEL1x38XM4c3rinuld7zrGJZGXM+BrETNWOKE+nT9D568womHmKPzrMVIOzyXC6ANm
         eo7Z2H4QOIrbsAUSRQlmTSb5bhPe4D3somB6xo6mtff/dg9Ypj2r92WmXxOnWbl6zoqv
         6QPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=I7y3obWjn67TN7HBEqShbRqBKYWSoQwNYE6e4LIj/a0=;
        b=BaCPtL1weJWu4XlWiKGFrUVPrkBdaIHzDrQfEA5JKztSKaNQ8TsmC+VIUtoCLPgo6P
         k1klqwRuVGx/04nParYukg8UnTYw6r5d39hYzHRTQFisOuVP5EtHQlXo51XTGjfckQgT
         EbTZ0PTV4/KdB5fyZEB1X8R1DhiYMGBlUN+1hHdfDfzAwOZYJH0y1G4A+uG10a0/J5Ny
         +Gjf2T+BsOIrCowyg69JNSeW3cw+9YPBNBCpNC8s8fzh/VZyym2aAcUqAJWbM52hHB3n
         eNqtjhrBmX6hUXqmLhN+HBP9JQZWOMtXRO8DO/kGOBtT2/Ixk74ybRCzDxNpHsyqXAyN
         f2IA==
X-Gm-Message-State: AOAM533W6AKKCPiEX3M3esMW3nF8s2BYRfuD1xWnP0iF4s3KFMkTf/F2
	x5etLIV4NWGjqvxhy0us3hsL4dx9Nv8=
X-Google-Smtp-Source: ABdhPJxh0Zf+CQpS/tejhKlL9nBJELOSqYavO65NTq43kbaWGSk0YG4Ed+R/icEGYeDbw26ZzIRfBw==
X-Received: by 2002:a17:90a:e604:: with SMTP id j4mr1536598pjy.215.1598120433865;
        Sat, 22 Aug 2020 11:20:33 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:58b5:6dc3:dbd8:c5f2])
        by smtp.gmail.com with ESMTPSA id s64sm6136815pfs.111.2020.08.22.11.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2020 11:20:33 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Armin Kuster <akuster@mvista.com>
Subject: [master][dunfell][PATCH] bind: update to 9.11.22 ESV
Date: Sat, 22 Aug 2020 11:20:32 -0700
Message-Id: <20200822182032.14416-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

From: Armin Kuster <akuster@mvista.com>

Source: isc.org
MR: 105232, 105246, 105260
Type: Security Fix
Disposition: Backport from  https://www.isc.org/bind/
ChangeID: 655cfdf1e91c4107321e63a2012302e1cc184366
Description:

Bug fix only update

Three CVE fixes
CVE-2020-8622
CVE-2020-8623
CVE-2020-8624

For more information see: https://downloads.isc.org/isc/bind9/9.11.22/RELEASE-NOTES-bind-9.11.22.pdf

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../bind/{bind_9.11.21.bb => bind_9.11.22.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind_9.11.21.bb => bind_9.11.22.bb} (98%)

diff --git a/meta/recipes-connectivity/bind/bind_9.11.21.bb b/meta/recipes-connectivity/bind/bind_9.11.22.bb
similarity index 98%
rename from meta/recipes-connectivity/bind/bind_9.11.21.bb
rename to meta/recipes-connectivity/bind/bind_9.11.22.bb
index ee546a0a2c1..7128bd3870c 100644
--- a/meta/recipes-connectivity/bind/bind_9.11.21.bb
+++ b/meta/recipes-connectivity/bind/bind_9.11.22.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "668158b005b3de4328fa0dbbbb3f524b66f28f024c67538aa9412a9e69c9dfbc"
+SRC_URI[sha256sum] = "afc6d8015006f1cabf699ff19f517bb8fd9c1811e5231f26baf51c3550262ac9"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # stay at 9.11 until 9.16, from 9.16 follow the ESV versions divisible by 4
-- 
2.17.1

