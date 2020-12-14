Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web12.32846.1607941986894839265
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 02:33:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CLW0CcLw;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: outbackdingo@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id t6so8423955plq.1
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 02:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oNGpbc+CMwt7iSDBqnaCpv6Dco8R0ThtMLHpGcZePwQ=;
        b=CLW0CcLwkEDW9gFt+dPiQNISZ17pWEfJEX58SUAvIg0TiqyWLtxmmtBOrfcFw+kySX
         8vOCmhThe4W8wELNRSHipYcIa41eMlgxbLoGCZYYj1mKSqP3TgabONyA7zq7vgu/xYI0
         LjSiQP2LM+gg8ErobQot5rVHjGWhQy6P9G3+PwF0ckofiCi1Iga+QdYs3JQp40yJ76YZ
         ++qnPnQoa80hq16asFfDe5d+SGT0FvFmWLtdOWtmbpgKb41LWN2No1PqZxgwSUgLmkJa
         kcCUv04o1ClFkFdLMjAWAd6gm/6XDOtoI85DIRkqAH7rs01uTbcD00uYYpVjoPcJdfv2
         ucMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oNGpbc+CMwt7iSDBqnaCpv6Dco8R0ThtMLHpGcZePwQ=;
        b=Z68NF2lW4WHtCQI+r8SwsYhO6t0t626z8y22a/VlFy8HF6GIaXJz6ruHybW2a5Ulxl
         0WPxitblYbQXOrKsLcDvBanzuiunXAyCDgj1lAjQxCM+SP1tQgJIPZNRSiHvFsEBKz1s
         VOkPNJtwmTyNBXWLorkZHaBH3Je3OyJjCj4npjUR8sVyKOv+qK/nM1YKkJDIQufmcIrW
         TIlmQr1jkaxW1+29Ld5GncPJRJxt9qnG61CLzXWqo5zIhzU/HBNqpexvUzgaePT2RUpx
         oUXyiDvUozOpGM0D9c5t+eumsaX2Ffq/aqKQrK+UsGOmZMV2PAm+mD8McYT+VDPT1UUH
         fqqA==
X-Gm-Message-State: AOAM533Sl9RhmkRFZ1y5hMCBKsR/DnRhgkOrZNu8nRErnj30O8noB2ws
	BQg6uWAfloLksW6ZpyLaC/8o80h0/IE=
X-Google-Smtp-Source: ABdhPJyVe1YC0zTEmeXpmcWqmLVxRknlMgP7rEhZ9KRBDE6JaCObH2nav04lCxcJtxhW8gJgQ7o26A==
X-Received: by 2002:a17:90b:3110:: with SMTP id gc16mr24849379pjb.83.1607941985878;
        Mon, 14 Dec 2020 02:33:05 -0800 (PST)
Return-Path: <outbackdingo@gmail.com>
Received: from debian.optimcloud.com ([1.52.111.43])
        by smtp.gmail.com with ESMTPSA id v17sm19975171pga.58.2020.12.14.02.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 02:33:05 -0800 (PST)
From: "Outback Dingo" <outbackdingo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: OutBackDingo <outbackdingo@gmail.com>
Subject: [PATCH] file /etc/ethertypes conflicts between netbase-1:6.2-r0.corei7_64 and ebtables-2.0.10+4-r4.corei7_64
Date: Mon, 14 Dec 2020 05:32:48 -0500
Message-Id: <20201214103248.2227-1-outbackdingo@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
 meta/recipes-core/netbase/netbase_6.2.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/netbase/netbase_6.2.bb b/meta/recipes-core/netbase/netbase_6.2.bb
index a54d2e7764..262b2cf1bc 100644
--- a/meta/recipes-core/netbase/netbase_6.2.bb
+++ b/meta/recipes-core/netbase/netbase_6.2.bb
@@ -19,5 +19,4 @@ do_install () {
 	install -m 0644 ${S}/etc/rpc ${D}${sysconfdir}/rpc
 	install -m 0644 ${S}/etc/protocols ${D}${sysconfdir}/protocols
 	install -m 0644 ${S}/etc/services ${D}${sysconfdir}/services
-	install -m 0644 ${S}/etc/ethertypes ${D}${sysconfdir}/ethertypes
 }
-- 
2.20.1

