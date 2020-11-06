Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web09.12492.1604673407301947408
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2020 06:36:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Z1WS02hS;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id o129so1518044pfb.1
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2020 06:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=QIbdn08fQPHSPn1SKlyFA90qTvzcM44BDAYGLUOpu6U=;
        b=Z1WS02hSj2vH0U1g/eob8f/TuIVdU+WSuzE4knsPUd6TkOzYFtSuRZOntAsBKxP6Mw
         VTzTC57b02LwygKB6NMSKFbNuUBsggENXddhsOy17dmw5eGprUNKb8Lh4OGbKqY0mKGW
         iXqPo64xphfv1VUZkQFB7R2VMHtz+gVxx/SuzYpwGkyhu9jOd9DvxaaUB5Y/c7MBbbTA
         pr/3ne+bKnkf35OXKaXI1v1fKpSFIs8a1Oq1fujfXvbA35CPfYI4/k28/qipsItkboDd
         69O4FUF7kurZTMldf5aS8hMA/4vo7XObqWp0IwiZ4Gacyawg1gWT4A6lyP0RGCeJjMim
         gALg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=QIbdn08fQPHSPn1SKlyFA90qTvzcM44BDAYGLUOpu6U=;
        b=pzbeHhLkCOM1Wz0uiZ2G16h21h3H4rpQu00Y3wwic4oxZYV5zl25G3H5tGROtLXhJ7
         0o0aPCDPtso45T+nDxrr4Nf7lm5LbL4oHIc8aypHPSSw4rOM/mlOTb2o+CeA5lgUNiCe
         vvrAgTlZldPZsdUufHvukpxffXSzXZbtF83pi8FHmsQPPlwHbnBW4bbmYdRIe0A8UILU
         bkvtYyoq7xSUILvSFpgC92fwKDB9eLV0mKm8bpGjaPdUPBrfpWPmf3nhVrufGILfx3uq
         OFZUkZi/wNHtSg2OKXIsyOqelLtO8ACk4tBWR2BzsZHC+nR0ldKRjKSvLbVTcW+pIfOG
         1pLw==
X-Gm-Message-State: AOAM532cdHWEyXPVPYa+JSEtU8XxEsV7ENb3zdo6Wxz2IyyQu1A2zOwW
	RjiGvv982ZSkQkdvfCSpv4+UTtiHHpCrW86L
X-Google-Smtp-Source: ABdhPJzNueVIS7/XEb/badPPzHF4YjadbfAlQ0FjRiW+MgrgQnjiMqyJJ+ES9AZQo/haMmdDGjNmOg==
X-Received: by 2002:a62:b417:0:b029:18b:8c55:849f with SMTP id h23-20020a62b4170000b029018b8c55849fmr2229071pfn.27.1604673406254;
        Fri, 06 Nov 2020 06:36:46 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id jy19sm2765166pjb.9.2020.11.06.06.36.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 06:36:45 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/20] Add license text for PSF-2.0
Date: Fri,  6 Nov 2020 04:35:25 -1000
Message-Id: <9f452e54e94d574f55d40b7e028259c3283bdba8.1604672839.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1604672838.git.steve@sakoman.com>
References: <cover.1604672838.git.steve@sakoman.com>

From: Mark Jonas <toertel@gmail.com>

Signed-off-by: Mark Jonas <toertel@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 37983b3706bda0c466e7e99e1d088089854f5648)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.17.1

