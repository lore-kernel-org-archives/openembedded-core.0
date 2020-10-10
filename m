Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web12.4708.1602329061933417922
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Oct 2020 04:24:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bDxzTH53;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: idadelm@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id k18so12199340wmj.5
        for <openembedded-core@lists.openembedded.org>; Sat, 10 Oct 2020 04:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=OQSqUqmhjM/Kl6spVK1zS+vIMVK0iz2ZDxXHZSMFa74=;
        b=bDxzTH53vHgjckGhzNSXDb89Yj3Yl0cdmgEBx0BN1eHKtdgcF+tqL73A2KN4pm6SrE
         F80btREKJut3osJOKJNslMCJW1VdRg7sKvqban33IibIGXTr9JsH2KXpg03qjMBKVjVK
         Jwu1gGfjzvIEdUq9maiIylHJij2adtV8glkfzfYAWgBd4w24POQ+8xnzckBMhUDOwvtk
         emRXR+tH+PYAEy9URRyQFQYxeXkL/UUd4UrdeJH0Rsrd4YzvLneQtBDkGTqlYmy4ynZA
         rYvat1jPdOF3HJNR7BLVPGq5WiOaq/0OX+QNlGwwv8hQV8K+WLKUe+3uu/VwReDIPf6z
         i4DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=OQSqUqmhjM/Kl6spVK1zS+vIMVK0iz2ZDxXHZSMFa74=;
        b=KjHfbQEzhaY8njIgLZxQ9y3naN+3NAUxkI/5GKPbXcg1AV6aJm9uEd8w3NaNmvZ0ui
         mHfbdZnk4oxY67IOa5LX/h9M8t9JH12+TMCe7x9KFOTXz0n9q9DT2mUsiP8hK7oWLfFJ
         XBS3WNOoA9L4YsEcDEXoG4jVu+IDTYkHgHE4TXHFslW7eCOI5Yc5UsuJWU5W8uAuCVqq
         C+LdtoLagraPUGGPzQXH2I2ZOIq1LnsebvnkctYOKwMMAi7g2HaQ6Ab+Q3olueL5HoRU
         gxnYdeEFdqOY1WUlgU+oc97gngI+1zcC+Owcpyb2SayZXwPKbBwk7SszDS/FBP+eNBDU
         bSyA==
X-Gm-Message-State: AOAM5336cBjIRXhdvSmalxUIUbcyrYgLwMzEaIh+SJcZ/XcejNwIN5RQ
	WmB53pY6n6Jg3cBudLCTGnY0MOLM/GJmK0ar
X-Google-Smtp-Source: ABdhPJz8PnGflSokJ/sf8t5YGdGyw3bGYDtRs85UuprGnVdyArl5Tq5R/32/oDOGEBkPO4W45IGGhw==
X-Received: by 2002:a1c:4909:: with SMTP id w9mr2521989wma.133.1602329060130;
        Sat, 10 Oct 2020 04:24:20 -0700 (PDT)
Return-Path: <idadelm@gmail.com>
Received: from localhost.localdomain ([154.72.153.129])
        by smtp.gmail.com with ESMTPSA id m3sm18020876wme.3.2020.10.10.04.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2020 04:24:19 -0700 (PDT)
From: "Meh Mbeh Ida Delphine" <idadelm@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Meh Mbeh Ida Delphine <idadelm@gmail.com>
Subject: [poky][PATCH] Update license files to match current SPDX names and license contents
Date: Sat, 10 Oct 2020 12:23:51 +0100
Message-Id: <20201010112351.8130-1-idadelm@gmail.com>
X-Mailer: git-send-email 2.17.1

Updated mappings of license fields of meta/conf/licenses.conf to match latest SPDX naming.

Fixes: [YOCTO #13320]

Signed-off-by: Meh Mbeh Ida Delphine <idadelm@gmail.com>
---
 meta/conf/licenses.conf | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/meta/conf/licenses.conf b/meta/conf/licenses.conf
index 5b309eb385..9b4d0e7c7b 100644
--- a/meta/conf/licenses.conf
+++ b/meta/conf/licenses.conf
@@ -10,27 +10,27 @@
 # Any mapping to MPL/LGPL/GPL should be fixed
 
 # AGPL variations
-SPDXLICENSEMAP[AGPL-3] = "AGPL-3.0"
-SPDXLICENSEMAP[AGPLv3] = "AGPL-3.0"
-SPDXLICENSEMAP[AGPLv3.0] = "AGPL-3.0"
+SPDXLICENSEMAP[AGPL-3] = "AGPL-3.0-only"
+SPDXLICENSEMAP[AGPLv3] = "AGPL-3.0-only"
+SPDXLICENSEMAP[AGPLv3.0] = "AGPL-3.0-only"
 
 # GPL variations
-SPDXLICENSEMAP[GPL-1] = "GPL-1.0"
-SPDXLICENSEMAP[GPLv1] = "GPL-1.0"
-SPDXLICENSEMAP[GPLv1.0] = "GPL-1.0"
-SPDXLICENSEMAP[GPL-2] = "GPL-2.0"
-SPDXLICENSEMAP[GPLv2] = "GPL-2.0"
-SPDXLICENSEMAP[GPLv2.0] = "GPL-2.0"
-SPDXLICENSEMAP[GPL-3] = "GPL-3.0"
-SPDXLICENSEMAP[GPLv3] = "GPL-3.0"
-SPDXLICENSEMAP[GPLv3.0] = "GPL-3.0"
+SPDXLICENSEMAP[GPL-1] = "GPL-1.0-only"
+SPDXLICENSEMAP[GPLv1] = "GPL-1.0-only"
+SPDXLICENSEMAP[GPLv1.0] = "GPL-1.0-only"
+SPDXLICENSEMAP[GPL-2] = "GPL-2.0-only"
+SPDXLICENSEMAP[GPLv2] = "GPL-2.0-only"
+SPDXLICENSEMAP[GPLv2.0] = "GPL-2.0-only"
+SPDXLICENSEMAP[GPL-3] = "GPL-3.0-only"
+SPDXLICENSEMAP[GPLv3] = "GPL-3.0-only"
+SPDXLICENSEMAP[GPLv3.0] = "GPL-3.0-only"
 
 #LGPL variations
-SPDXLICENSEMAP[LGPLv2] = "LGPL-2.0"
-SPDXLICENSEMAP[LGPLv2.0] = "LGPL-2.0"
-SPDXLICENSEMAP[LGPL2.1] = "LGPL-2.1"
-SPDXLICENSEMAP[LGPLv2.1] = "LGPL-2.1"
-SPDXLICENSEMAP[LGPLv3] = "LGPL-3.0"
+SPDXLICENSEMAP[LGPLv2] = "LGPL-2.0-only"
+SPDXLICENSEMAP[LGPLv2.0] = "LGPL-2.0-only"
+SPDXLICENSEMAP[LGPL2.1] = "LGPL-2.1-only"
+SPDXLICENSEMAP[LGPLv2.1] = "LGPL-2.1-only"
+SPDXLICENSEMAP[LGPLv3] = "LGPL-3.0-only"
 
 #MPL variations
 SPDXLICENSEMAP[MPL-1] = "MPL-1.0"
-- 
2.17.1

