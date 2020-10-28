Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.10970.1603900079366893223
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2020 08:47:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZSZuyrtx;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: yann.morin.1998@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id k18so9508wmj.5
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2020 08:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K9BQ3sz/w0YktOeP1ZDXrTy8YbjDlfA3PJYLkQiaKtU=;
        b=ZSZuyrtxfrHe2gKJn91XJcUXEnDNwYc3yFdjTWdlCyiUGtseOPLsV6/AG2ipHbsxba
         9KceeMHnYidpQmVrsUYiquJlfjFbV6IkqY2dIM2phX9K581MZft0XcnBeiQtcfZ2STNh
         OQsdrWB8B9qxgw34PdYlTIxGE8bEI4HSRh/yeGQN5/9E3CebR8K6p5wnIJULik5F72HQ
         LD8gZh2nntJkp4pxm9xuYVIDdMRncRCm4/mD5mA0OAlhwkmYyE1F3g681zCn9Mj7a58c
         4N2FjD5fGv7x2XuI7kleujD2VqwhKwmkLg+Ll6TGPKHdlRnTi0o6Bs2g/qTVRsm4XYNJ
         3oeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=K9BQ3sz/w0YktOeP1ZDXrTy8YbjDlfA3PJYLkQiaKtU=;
        b=aJo3pjmYJpUvmZBZGrS4UjfWUhKQnQ0nxQ721Ku3HF8Hcz+8f/qlqtCPDrVf0Fm5dU
         sOzDfUqy3ggh/IenaPqJegLvYfdrK5k6A1WMhS3lgZQdR3UHgBChANJsOBC0KVfUwsTU
         L6Q1mBGYEYOuMGce1rfVK3Iki6459b1JBpQpmgBHx1zxpwFM5GsEY7WCDxKnuTD6gpZZ
         J/CCzWLyIN24+owKA/gazNc1WiGwK0j4xe+/guaVMppFd3TTQdr3CGNiEltPdQiRuerl
         XxQv37SXmCWppLLfZMvUXjAHIqwofotNtPtzNukbq+nwdGQ3Mx1hggxETtIn9DcWtYtW
         lkxQ==
X-Gm-Message-State: AOAM530T/382YPoqcMtCWkqszhfILYK9RV4Sd/irZSXXmsslWZSw22Zf
	47S1rPMQLG0RGA+05r6CqmRzHaci/Xk=
X-Google-Smtp-Source: ABdhPJw0zLPD6uY6cB6+UsgP+cCmmi6lIHcWK85YAVFyq09KtNk40reOg7au1l9GBDAqIRiOZn+/vw==
X-Received: by 2002:a1c:bc55:: with SMTP id m82mr8736215wmf.159.1603900077754;
        Wed, 28 Oct 2020 08:47:57 -0700 (PDT)
Return-Path: <yann.morin.1998@gmail.com>
Received: from localhost.localdomain ([2a01:cb19:8b51:cb00:d91a:f1f4:94c3:a2ef])
        by smtp.gmail.com with ESMTPSA id k18sm7270848wrx.96.2020.10.28.08.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 08:47:57 -0700 (PDT)
Sender: "Yann E. MORIN" <yann.morin.1998@gmail.com>
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: openembedded-core@lists.openembedded.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
	Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 1/2 v2] common-licenses: add bzip2-1.0.4
Date: Wed, 28 Oct 2020 16:47:55 +0100
Message-Id: <c5636229c58912094413e4dd8667bc2bb7e8352c.1603900066.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1603900066.git.yann.morin.1998@free.fr>
References: <cover.1603900066.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
2.25.1

