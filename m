Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web11.6620.1604421047101264307
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2020 08:30:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DsckKG0x;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: toertel@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id i19so14040315ejx.9
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2020 08:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kMu1f04iWinBBXIMp4KO6I3QtGdtYwkLnFpogwEtBQU=;
        b=DsckKG0xXkMhSXHanWdeLavB88eMYF/tzCD10ANxSffHi9O8dcYPMrSg0I4AjATZbW
         P0H/yEAFD5ijqljT7ND9hDPZCx4lkTkeGirw0FF3iMToTnJsVMyZW7d0iWfMym6zuS/5
         aMrLug+bAxoKVPT9nUejewT35QedKbKK1G5DHz7dGK9DnDKU/IKkS+wmrAWJEAtIHYCr
         udNqnmGcDMmp7PiVPl0iwLwY8XR8V3kyxkhAyKu/bzBuoTyTsnMt1aY/B/9yCJbXi78B
         1wKd+GKckMrGc8kW3R5d9AKCEuzY48TtNkrDs4UWRf6CQsdCaTATLu/Y/tJjTzFyr0CL
         HEdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kMu1f04iWinBBXIMp4KO6I3QtGdtYwkLnFpogwEtBQU=;
        b=TMTKUaRw821URwvsKTDf8bU8UzDzZnNQCfC+nn7aPLJlpJSIAOcZB/ukkDrczar6Nb
         UfdEnPlBrwYxpDVDw0QI7Na5qXj5M13ugIOTn5bmtoL+b8lLuLhdX8MBHiFmwCvzz6vs
         PuhntyBJxODqQq3tXtCGiCl93X22ks1iOeK6AUHmh5SZsproZznHY4FgniKsRuPCs5BA
         quux4cGAcKv2DHQ3fpgVWPWlY2b5d4Ze8oapziBDESJsRllsV7rGZu1mwsKHW3b2IycW
         p1kX4rxKsOX9klxgF1FAmEKmsbhCOBSjW2r7kLXE8H0POTT6EZ8NXChQ906BB8wLqCgY
         Ayzg==
X-Gm-Message-State: AOAM532hc/3ajVSrstyod46kFGZHj7qqboinRJAcqUg+E/i+l1xMb4wS
	EnVkW6BWnwjuK6PlFB/vfhgZsiI+Uns2ew==
X-Google-Smtp-Source: ABdhPJyAH5Q0Ce3AHdByUcQIG+zOgF0mvhFF5PdFjGzAGqqswWhlU7lPzYEEdSOG14paMmx+1bJ67A==
X-Received: by 2002:a17:906:1d50:: with SMTP id o16mr16438420ejh.145.1604421045134;
        Tue, 03 Nov 2020 08:30:45 -0800 (PST)
Return-Path: <toertel@gmail.com>
Received: from gigabyte.fritz.box (p200300cfaf1974008871fa142a03af31.dip0.t-ipconnect.de. [2003:cf:af19:7400:8871:fa14:2a03:af31])
        by smtp.gmail.com with ESMTPSA id b24sm10662599eja.30.2020.11.03.08.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 08:30:44 -0800 (PST)
From: "Mark Jonas" <toertel@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Mark Jonas <toertel@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][PATCH 1/2] Add license text for PSF-2.0
Date: Tue,  3 Nov 2020 17:30:26 +0100
Message-Id: <20201103163027.442585-1-toertel@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Mark Jonas <toertel@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
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

