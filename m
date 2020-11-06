Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.12507.1604673399504070099
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2020 06:36:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=sYTapUn8;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id t18so747454plo.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2020 06:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=qGAVFtTemLZWXvx/VDzFqPFqiGCCAUxNRCLWDIJD8IQ=;
        b=sYTapUn8TukKabv9wC6CGs/fH12M7NePLJ3eASM9Nkf8plFRXGxRnVsIWaqCY0a7VW
         dxWF/m/lT9Mnb5PCZbW3MbPHLbTlDI0+xlJ67IOWe+FPD0j781kqgzOBx6MBguAwPh1e
         IEF0Jm9HZFeoPKIFok/J+ol+udrqf9GoQtqCsfZhcQ/b+X0S86lupMQ2UcUoGwkAtFDA
         SRLfUVjsX9t26YTKU6Ri8LTvGxuYPcBzmMbqALgoeFMj9qfMPvHOTWgrsnhZi8/ORCBc
         Ozxm6ce8NvU+533hkWzSatuL1hgH2oq7c1tKtwPqyfNYo4uDPWh4W12T+BAVsdc3lBJ7
         odhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=qGAVFtTemLZWXvx/VDzFqPFqiGCCAUxNRCLWDIJD8IQ=;
        b=DdteIZZNqum+KW4RChS9yQAax9eb7E2nskwC2raNbyndlPy2pgqIIY+20KnslzemmT
         6FyptmdI08wnYyTuUpccB2WP1lN44ovMVzUCNqzrOWWTD7BduNSVDAnEUpEJstIVa/+Z
         LnKDmiZlueFya8xNcg3oOJqP1M5KptZ58h9PHT7JFN51tYunD15lC9rA4RNfU76TcD4G
         VJnj8jAHZk56nBYTS2iPx7TBIQXmp8g9hF072qPjsnthmDE1XSpdKF1EAjz0etpfmB//
         P5auo5IEYP1WRHDCYVgDbYHimMaY+YNDwUSf0qpzhO+0FPIRy+GTwC0LQrypM5u5CaZr
         UA8A==
X-Gm-Message-State: AOAM533bjmIodV5cK1hKvrFGcPCoLo+Rsr5mF4Meey4jYVHWTN2B5bHe
	w9BsLAfAONI9D8EJ6xoBIwj4GUFOp+xaNppP
X-Google-Smtp-Source: ABdhPJw3q81BnRTehTAmfAzzV9wc43nDF/CqXtod1Q8aoAtRUPL7Bn6YMRlMe546rl8V6X2CmbgxNw==
X-Received: by 2002:a17:902:9a89:b029:d6:c37c:7c69 with SMTP id w9-20020a1709029a89b02900d6c37c7c69mr1971952plp.11.1604673398498;
        Fri, 06 Nov 2020 06:36:38 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id jy19sm2765166pjb.9.2020.11.06.06.36.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 06:36:37 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/20] common-licenses: add bzip2-1.0.4
Date: Fri,  6 Nov 2020 04:35:22 -1000
Message-Id: <d395630a026c16f47541082c8e1279492cfd95be.1604672839.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1604672838.git.steve@sakoman.com>
References: <cover.1604672838.git.steve@sakoman.com>

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

The bzip2 license changes with each version; the changes are subtle, but
that makes it a different license everytime:
  - copyright year
  - authorship identification and address
  - version of the release
  - date of the release

Although we currently only have bzip2 and pbzip2 packages, we're going
to need this license for busybox, which uses code from bzip2-1.0.4.

Add it, as copied from the upstream bzip2 git tree at tag 'bzip2-1.0.4'
(commit f10a33538e9bab6deb61779b3d8aae168824ef48).

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Khem Raj <raj.khem@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f303c31b813f371737c9a9d7a93e9f920f84e75a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/files/common-licenses/bzip2-1.0.4 | 43 ++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 meta/files/common-licenses/bzip2-1.0.4

diff --git a/meta/files/common-licenses/bzip2-1.0.4 b/meta/files/common-licenses/bzip2-1.0.4
new file mode 100644
index 0000000000..4458e35bb5
--- /dev/null
+++ b/meta/files/common-licenses/bzip2-1.0.4
@@ -0,0 +1,43 @@
+
+--------------------------------------------------------------------------
+
+This program, "bzip2", the associated library "libbzip2", and all
+documentation, are copyright (C) 1996-2006 Julian R Seward.  All
+rights reserved.
+
+Redistribution and use in source and binary forms, with or without
+modification, are permitted provided that the following conditions
+are met:
+
+1. Redistributions of source code must retain the above copyright
+   notice, this list of conditions and the following disclaimer.
+
+2. The origin of this software must not be misrepresented; you must 
+   not claim that you wrote the original software.  If you use this 
+   software in a product, an acknowledgment in the product 
+   documentation would be appreciated but is not required.
+
+3. Altered source versions must be plainly marked as such, and must
+   not be misrepresented as being the original software.
+
+4. The name of the author may not be used to endorse or promote 
+   products derived from this software without specific prior written 
+   permission.
+
+THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS
+OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
+WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
+DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
+DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
+GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
+INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
+WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
+NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
+SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+
+Julian Seward, Cambridge, UK.
+jseward@bzip.org
+bzip2/libbzip2 version 1.0.4 of 20 December 2006
+
+--------------------------------------------------------------------------
-- 
2.17.1

