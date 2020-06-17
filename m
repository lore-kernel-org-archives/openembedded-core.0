Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web12.9054.1592404516847384405
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2020 07:35:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=xItCo/M9;
 spf=pass (domain: burtonini.com, ip: 209.85.221.53, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f53.google.com with SMTP id q11so2609036wrp.3
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2020 07:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9PBMkVRrJ6KIiSvPgFR3O9OeZJcD3ds10rIRUCDM3bw=;
        b=xItCo/M9HWon43F8UAJfLoJC7i5WPYEQFC2TYCpG0nf4RlDX3fSACC34sGSPwHx9WK
         A3QvZBfHx0qcvTIxpw1b8vrN3P1MFXDXFHOMlFIC/VAdC6dPSoblp2AgSpRalC/LIw+Q
         MeDafywBQGwxsS6RNSLe2+m2c508hOPLhl1k+g2ACPpFFj2dbaJ0t/EXHsoYJDkTBs1R
         9+v0XnP+vKqfDoilYw0bhzjsG/LKHb+Fw3qcYs+mdugisjX93+LWXNMq/3RlUdUOnLLt
         Y/ct3CBNXDulEEr7ql3jb6sZbsXu8dHbQ/ABliBxSwK1yBBv4ypG11bC2yClwfb26KwF
         hlhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9PBMkVRrJ6KIiSvPgFR3O9OeZJcD3ds10rIRUCDM3bw=;
        b=SVA88F+MZBTqdI06J3OK12W6XY2Kw8hoYLCoV4VyV5s5HOmSbTovJRHiTb8ssBiIDd
         ZMgejptE2pV3lE5hV/sfeq6RjicpBR6bwHGTB4Sjo/67kDM7MI9bF80owolJyO8XTqf0
         H6Yab6CUVbWQBWe13AxTEnP0LG55yYCxa4wxSi3bTjRBPXeZXqbjY7FPqunZRdpULWkp
         X7ECffW2bzpUr65ejBeoypm4khZdUe1j+bfFeVH82BRZQEaF67NqUXTSpluO7gvDzRnX
         ahtC5LZCAhjicO0GiDhu87AGqDtBCKdrrFFOtZ9RghitZVrZTEHaJDccog7RdZAk7Ula
         W3GQ==
X-Gm-Message-State: AOAM530gSQIRsQ2Uimsu2zMjGATTJW+3TeZkNIB4y+D+JqONhDsb4YEl
	3d30px4clw7Wwh6wILzcc5dMUENA5WwOig==
X-Google-Smtp-Source: ABdhPJx6sT3A9/GXyQLaxVwbbD65k60qKYOgmckp06enoAfrZIBw3N/C9Qy4V84flssR2w6wYH7P6w==
X-Received: by 2002:adf:f450:: with SMTP id f16mr8808866wrp.307.1592404514857;
        Wed, 17 Jun 2020 07:35:14 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from rossb-vm.manchester.arm.com ([213.86.15.71])
        by smtp.gmail.com with ESMTPSA id p1sm32801209wrx.44.2020.06.17.07.35.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 07:35:12 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][dunfell] common-licenses: add BSD-2-Clause-Patent
Date: Wed, 17 Jun 2020 15:35:07 +0100
Message-Id: <20200617143507.1050989-1-ross@burtonini.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../common-licenses/BSD-2-Clause-Patent.txt   | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 meta/files/common-licenses/BSD-2-Clause-Patent.txt

diff --git a/meta/files/common-licenses/BSD-2-Clause-Patent.txt b/meta/files/common-licenses/BSD-2-Clause-Patent.txt
new file mode 100644
index 0000000000..1184c02957
--- /dev/null
+++ b/meta/files/common-licenses/BSD-2-Clause-Patent.txt
@@ -0,0 +1,47 @@
+Copyright (c) <YEAR> <COPYRIGHT HOLDERS>
+
+Redistribution and use in source and binary forms, with or without modification,
+are permitted provided that the following conditions are met:
+
+1. Redistributions of source code must retain the above copyright notice,
+this list of conditions and the following disclaimer.
+
+2. Redistributions in binary form must reproduce the above copyright notice,
+this list of conditions and the following disclaimer in the documentation
+and/or other materials provided with the distribution.
+
+Subject to the terms and conditions of this license, each copyright holder
+and contributor hereby grants to those receiving rights under this license
+a perpetual, worldwide, non-exclusive, no-charge, royalty-free, irrevocable
+(except for failure to satisfy the conditions of this license) patent license
+to make, have made, use, offer to sell, sell, import, and otherwise transfer
+this software, where such license applies only to those patent claims, already
+acquired or hereafter acquired, licensable by such copyright holder or contributor
+that are necessarily infringed by:
+
+(a) their Contribution(s) (the licensed copyrights of copyright holders and
+non-copyrightable additions of contributors, in source or binary form) alone;
+or
+
+(b) combination of their Contribution(s) with the work of authorship to which
+such Contribution(s) was added by such copyright holder or contributor, if,
+at the time the Contribution is added, such addition causes such combination
+to be necessarily infringed. The patent license shall not apply to any other
+combinations which include the Contribution.
+
+Except as expressly stated above, no rights or licenses from any copyright
+holder or contributor is granted under this license, whether expressly, by
+implication, estoppel or otherwise.
+
+DISCLAIMER
+
+THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
+AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE
+LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
+DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
+SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
+CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
+OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
+USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-- 
2.26.2

