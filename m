Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web12.1629.1601402853539525526
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2020 11:07:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=E72uX97s;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: toertel@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id n22so7342598edt.4
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2020 11:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M30RbgEJEIvB7DFVvrmAv9ZWG2+Xbo/Sijptd9UsNuo=;
        b=E72uX97sh2S5vkVCHIwEQCAp7z8s0QY3018ETzceaIxNUqsvfty5bwKIbLV8tyZETG
         lGC+yrfvYkPGx0Kd9z5uaQltOtLX4t/i+S1Or0mUWHXN0IvAq3AQu/eieNExTpbhr97r
         +0zFHAqSYhypsKun7cbwx6qVoTQ2zvyD1aajg1ocXAA+NPc4VueAyS2Bwu9G03zfQKcO
         hsmAMgGg0z7NIERWnoq0eoH9RqBXN1FGeyXE/FX5zXuI17MugnD9HoPC+XFsjytSjJAF
         4xJBCxVukIg8BbKP6T0IqWx4RW116J6PWmELhwaQSJ5GzNWtczBMleeBYqZjEWVAMdlr
         6X8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M30RbgEJEIvB7DFVvrmAv9ZWG2+Xbo/Sijptd9UsNuo=;
        b=gf5GXXlob+pMEIegb0Z06XCc8gLYNP6zgnvEurkoXvh36F9WdmMFhCs8w4Y9J7hZ07
         6C5HjH3WSHz5ykz03Ag/tXX6cnlEJJbFRfxiEEePZGs9OuS6Sc6OK/d4Y+QJNLKxqZsw
         LSJeYaaoPbU1ifLe4HVtOS0TkJPnIJ+h6GYdTLU+v5AK/9Iml5sXbrtvEmqr/IL5Rh+X
         aSCokIYRjNV5acVTyCQJhZ/UtqHGGCgacAayFmY7ULezo5irbkWKB7GqyDuSLU4x05P1
         eisAyjjk9JQUHjJdGwvGy12Nr/S9EFH8899l56RTPTzxHYfAyjXwSq1KllKZXZO27pPL
         4C9A==
X-Gm-Message-State: AOAM531RGrxL/RrPtZ5yoBAhmLSTIzylicKVhcUTaQ9v7uibvJa/WlyO
	OUE4MU/S+UUCs9e7+nUS/SEx981KREA=
X-Google-Smtp-Source: ABdhPJxb5fM5R9Xf4HbWc5+r1tRWEetWjYQabJwTf5kda1VBIQyv53WNfQN5+b3gLQf8mHXXImLm4w==
X-Received: by 2002:aa7:c545:: with SMTP id s5mr4676565edr.10.1601402851728;
        Tue, 29 Sep 2020 11:07:31 -0700 (PDT)
Return-Path: <toertel@gmail.com>
Received: from gigabyte.fritz.box (p200300cfaf370e0015ade9fb9385734a.dip0.t-ipconnect.de. [2003:cf:af37:e00:15ad:e9fb:9385:734a])
        by smtp.gmail.com with ESMTPSA id o15sm5635859ejr.1.2020.09.29.11.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 11:07:31 -0700 (PDT)
From: "Mark Jonas" <toertel@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: pidge@toganlabs.com,
	Mark Jonas <toertel@gmail.com>
Subject: [PATCH 1/2] Add license text for PSF-2.0
Date: Tue, 29 Sep 2020 20:06:58 +0200
Message-Id: <20200929180659.7060-2-toertel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200929180659.7060-1-toertel@gmail.com>
References: <20200929180659.7060-1-toertel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Mark Jonas <toertel@gmail.com>
---
 meta/files/common-licenses/PSF-2.0 | 49 ++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 meta/files/common-licenses/PSF-2.0

diff --git a/meta/files/common-licenses/PSF-2.0 b/meta/files/common-licenses/PSF-2.0
new file mode 100644
index 0000000000..4e673e93fc
--- /dev/null
+++ b/meta/files/common-licenses/PSF-2.0
@@ -0,0 +1,49 @@
+
+PYTHON SOFTWARE FOUNDATION LICENSE VERSION 2
+--------------------------------------------
+
+1. This LICENSE AGREEMENT is between the Python Software Foundation
+("PSF"), and the Individual or Organization ("Licensee") accessing and
+otherwise using this software ("Python") in source or binary form and
+its associated documentation.
+
+2. Subject to the terms and conditions of this License Agreement, PSF
+hereby grants Licensee a nonexclusive, royalty-free, world-wide
+license to reproduce, analyze, test, perform and/or display publicly,
+prepare derivative works, distribute, and otherwise use Python
+alone or in any derivative version, provided, however, that PSF's
+License Agreement and PSF's notice of copyright, i.e., "Copyright (c)
+2001, 2002, 2003, 2004, 2005, 2006 Python Software Foundation; All Rights
+Reserved" are retained in Python alone or in any derivative version
+prepared by Licensee.
+
+3. In the event Licensee prepares a derivative work that is based on
+or incorporates Python or any part thereof, and wants to make
+the derivative work available to others as provided herein, then
+Licensee hereby agrees to include in any such work a brief summary of
+the changes made to Python.
+
+4. PSF is making Python available to Licensee on an "AS IS"
+basis. PSF MAKES NO REPRESENTATIONS OR WARRANTIES, EXPRESS OR
+IMPLIED. BY WAY OF EXAMPLE, BUT NOT LIMITATION, PSF MAKES NO AND
+DISCLAIMS ANY REPRESENTATION OR WARRANTY OF MERCHANTABILITY OR FITNESS
+FOR ANY PARTICULAR PURPOSE OR THAT THE USE OF PYTHON WILL NOT
+INFRINGE ANY THIRD PARTY RIGHTS.
+
+5. PSF SHALL NOT BE LIABLE TO LICENSEE OR ANY OTHER USERS OF PYTHON
+FOR ANY INCIDENTAL, SPECIAL, OR CONSEQUENTIAL DAMAGES OR LOSS AS
+A RESULT OF MODIFYING, DISTRIBUTING, OR OTHERWISE USING PYTHON,
+OR ANY DERIVATIVE THEREOF, EVEN IF ADVISED OF THE POSSIBILITY THEREOF.
+
+6. This License Agreement will automatically terminate upon a material
+breach of its terms and conditions.
+
+7. Nothing in this License Agreement shall be deemed to create any
+relationship of agency, partnership, or joint venture between PSF and
+Licensee. This License Agreement does not grant permission to use PSF
+trademarks or trade name in a trademark sense to endorse or promote
+products or services of Licensee, or any third party.
+
+8. By copying, installing or otherwise using Python, Licensee
+agrees to be bound by the terms and conditions of this License
+Agreement.
-- 
2.25.1

