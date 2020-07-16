Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web11.16393.1594908789331473756
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2020 07:13:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XhMXd5fJ;
 spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id y2so6164741ioy.3
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2020 07:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1+dNZN+M2X0zDlwS+dzrWW3F5hCTOuEVqxMj1U5KUHk=;
        b=XhMXd5fJXXgCgh/Ro04FMosaKQM7zzqaVdM0/MkraBZA9pAN2rlA3RJC0s8BIC76T6
         jftQgUEX4clhO0KOOiSzY0q1iP7Pp2jw06GBMvVL+TwLZ8ZT8nzj9u9+LWLa32rQxv+6
         hKxmsex2Z4AeNR5nZM1kq0mU7nH4kaRK9SO+fsBX7rsc5yu8HibZFnD+Tmp4FF7zGpRC
         VHAkuU9y2O30aYJNfirFpH87FTupjwUQi6K0oOF9ZJCOJjvYDrU0diDpYpAQsNsOp2CT
         t0bEOPpSGyhDK0nUPKkfauYAzM9Cb6F2vZlN0pJePxH2FmK4wbV2eepM6dGPU4yWiWaO
         6pWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1+dNZN+M2X0zDlwS+dzrWW3F5hCTOuEVqxMj1U5KUHk=;
        b=Ok8RM4WswEt0UDKK3vef63aTgnt3rfBmOuVfiNo9XqTWSCQf4H6izPrdRmdwklG9k5
         E8d5av7PUXgpyD/UX6KNNRN9fc5zvI/y7hYULSn7EsB6pLvmaYMpFKsJyB/sfvzzFKCq
         gdBbcl6AK0fcef8X8waj2avm0vlPCdLvIKGXefTcyS0qFPj1FMJfQbFSnDW2gIjFgewk
         MVCQvYvSNc3hX5jfmPq4WNViVcJniejf1Ifg1T19QTrmucNfnmH5Pdl12dbTk0tYp3nh
         SyY8xrCIVV4e0d0TIEhQ2rvo1CQcrE8s/Cp5ZFSxbzb+9q9SH/My1bxyqS7CNqnCP1AZ
         wEiw==
X-Gm-Message-State: AOAM530na+pXvc+60n9AAWSR5fzP/Vkz3U3QwaTQdcPEjO/u2DmvUchT
	cvdfit3gp1PTbsBZGnzHJ4/dtPa/V4o=
X-Google-Smtp-Source: ABdhPJyq0wmzm9umwSVI9B4rrkWallPiLlubaJ/PnXl6jpoxQ1eDyaKV64/iXNWaRrmAdgGI7voc2w==
X-Received: by 2002:a02:b0d5:: with SMTP id w21mr5552645jah.27.1594908788286;
        Thu, 16 Jul 2020 07:13:08 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:8425:3b41:f78d:f429])
        by smtp.gmail.com with ESMTPSA id y12sm2748129ilm.38.2020.07.16.07.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 07:13:07 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] python3-pycryptodome: upgrade 3.9.7 -> 3.9.8
Date: Thu, 16 Jul 2020 09:13:05 -0500
Message-Id: <20200716141305.27771-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-devtools/python/python3-pycryptodome_3.9.7.bb | 5 -----
 meta/recipes-devtools/python/python3-pycryptodome_3.9.8.bb | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-pycryptodome_3.9.7.bb
 create mode 100644 meta/recipes-devtools/python/python3-pycryptodome_3.9.8.bb

diff --git a/meta/recipes-devtools/python/python3-pycryptodome_3.9.7.bb b/meta/recipes-devtools/python/python3-pycryptodome_3.9.7.bb
deleted file mode 100644
index 8f19984bed..0000000000
--- a/meta/recipes-devtools/python/python3-pycryptodome_3.9.7.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require python-pycryptodome.inc
-inherit setuptools3
-
-SRC_URI[sha256sum] = "f1add21b6d179179b3c177c33d18a2186a09cc0d3af41ff5ed3f377360b869f2"
-
diff --git a/meta/recipes-devtools/python/python3-pycryptodome_3.9.8.bb b/meta/recipes-devtools/python/python3-pycryptodome_3.9.8.bb
new file mode 100644
index 0000000000..46e122072e
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pycryptodome_3.9.8.bb
@@ -0,0 +1,5 @@
+require python-pycryptodome.inc
+inherit setuptools3
+
+SRC_URI[sha256sum] = "0e24171cf01021bc5dc17d6a9d4f33a048f09d62cc3f62541e95ef104588bda4"
+
-- 
2.27.0

