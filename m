Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4791.1793755559286837180
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 17:25:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=xml/ixUw;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3adc4590de4so196122a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 17:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793755559; x=1794360359; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zD4O7JKSj+vu4F/7zJ+7LkhYYAmtoEq5m6t05c+Np6Y=;
        b=xml/ixUwhW8Pn+X4ornx/BcoYZP5xE5v5w1f4cVjyIZFjOSSyzd/PQ+YdE1Akj3V3/
         sUuWUp+aYAfA5bo8KHMX5RoMhsWvhzkHMM2XenKW4wijesAUqFzRyJAkJ0Xm9ytp9i+6
         j1/XOPEjanBRKg6Qf2qTAT9/1RALH/QeXgJykzxBmWykwfF4k/zUdOWR1TuGH/4NUdZX
         MsfaUrP6WYOHQkHdMxxnccDJVnLjDjLS51LQfvjkrCSPtr+IRx1z8xQ/bTdmVwUEkMFa
         sEQmwQ9g6PstvzWQNJA6EfEGnDLlNGW9f7v9at7Qk8FVAlD99nHo5nuZ2SqR2poG5z85
         iUwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793755559; x=1794360359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zD4O7JKSj+vu4F/7zJ+7LkhYYAmtoEq5m6t05c+Np6Y=;
        b=P8L0LmtukmVMy86+4aujbtpEpchwkzLQ0goRj0/kw5VKVbrykCv0xNGn224hwFX5mZ
         WUHNVEpzCj1Z84bpgwDpAyL6FHKuBI+F359ojIhGHcgR09bsu96S0lQFHYnJ9oIQF0pq
         Z3eIhCgdzNSA2kluPJU/0orKznOQX8rDcWjRYdXz40O7cRaQyvgugfvwpLUbezeIWSas
         cQQh7OjXwdYiWtFs1E9OcMg9t7gfQghneuqsGjwtZ6IsQp7a4CmEHOivtvAQOjmVXTJh
         Jm2fN71wXzc9FxZA2Ck8QCiolf/UoGYyTChsfknc8riCQaJKSleV8tTEO3bzWDxst6f8
         w1RA==
X-Gm-Message-State: APuU4Z+wWGp/IZMhER5ujn9mNj5FLClIYhykAXwGcoZ62gltxP9tc9l0
	x99Rj+K3zQm5NGC2K0pPsyB5tp8x4hjPlJlvbtEUxuCLW2/gHNET4Lr3mcFV1w==
X-Gm-Gg: AYBFou0eRO5xYrLNwA6Lv0y1wiQ34GdEBafXu5932yqmr6MrkEz1CdWqfSY65RbCHh2
	rGmSW0Fo7OLwxbmLhD45aTqHZFcFov5BaKmF1zpSao5Q/izCgGIisyUBpOnsnmMzlPnSYUJ80bu
	3YDuN++41ssA5InC73e03C9eTjlOV3OAk72sAqupefKf6pHiX73eEEfdCKMTh0vmWy7PJFWPF8J
	bD3OMftERmA3jXBqpQtS0au2IPMo/UrYQNtVGA3pLmXiwdu8zPd9Qg2b/XiIJl6DzfR6tVqnJer
	imiigXj0nWnKuZaVrPOAz/gFDFmVUc4zCzSuZG0Cb49iFxQ8ageD1J6SK59oMp3fE2j8AfUuqLw
	I2dHQrjtgUTuT/uoB63q1VCLmy6ILz7dYMszcLK99t7WWneS60ZRKXWlyhzJnFTntlknisZeO1b
	vQt/VH4R40p16vjxccVXB99LaOO5CvV3wYZFFNE4in0weLPH/ICMA1DiBkqDP6B7/9aF/dxuh+/
	08KRYn2PBWLkxZXwtZ+oA2zMx0MuC7oNg6C/GHWfBM+/WJFEddTPlHLa814pMX242OqtVsCW8nD
	LA0vKy8Of5YHAfVrlxDF+eMStl/M6MsFH3GQAsw6LDBaddATiZiYilpDUr233ubct7sHxhZLGfE
	LGhYpEQU=
X-Received: by 2002:a17:90b:35c4:b0:3ac:3e42:60a2 with SMTP id 98e67ed59e1d1-3ae8982a538mr11652114a91.33.1793755558539;
        Tue, 03 Nov 2026 17:25:58 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b096b52911sm388556a91.3.2026.11.03.17.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 17:25:58 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][blacksail][PATCH 3/3] python3-pytz: upgrade 2026.4 -> 2026.6
Date: Wed,  4 Nov 2026 14:25:41 +1300
Message-ID: <20261104012541.1429500-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104012541.1429500-1-ankur.tyagi85@gmail.com>
References: <20261104012541.1429500-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 01:26:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249317
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python/{python3-pytz_2026.4.bb => python3-pytz_2026.6.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytz_2026.4.bb => python3-pytz_2026.6.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-pytz_2026.4.bb b/meta/recipes-devtools/python/python3-pytz_2026.6.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-pytz_2026.4.bb
rename to meta/recipes-devtools/python/python3-pytz_2026.6.bb
index 4a2eda07a6..69cfa530ca 100644
--- a/meta/recipes-devtools/python/python3-pytz_2026.4.bb
+++ b/meta/recipes-devtools/python/python3-pytz_2026.6.bb
@@ -7,7 +7,7 @@ inherit pypi setuptools3 ptest-python-pytest
 
 PTEST_PYTEST_DIR = "pytz/tests"
 
-SRC_URI[sha256sum] = "464303645bafafd72418898368b2429458f709cf1eb6a15372fbcc396b64da63"
+SRC_URI[sha256sum] = "3b0fc2727707663d6e517936f444fd8a8b240f1fc32f4bf7ee03274245945284"
 
 RDEPENDS:${PN}:class-target += "\
     python3-datetime \
