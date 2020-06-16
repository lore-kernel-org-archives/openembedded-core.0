Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web12.6930.1592300159224365587
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2020 02:35:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=UVMNkytx;
 spf=pass (domain: burtonini.com, ip: 209.85.221.65, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f65.google.com with SMTP id c3so19970340wru.12
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2020 02:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mcgIRC/HNEe7lsJz7pmd0y1EIPpQzDpH6gefT3g5c7Q=;
        b=UVMNkytxMIZ410EErfMmUFKHJcLJ4Ygs36G1XgmWRzmTBZ1R+vaOnR64WJcOWVpCgI
         LkoJfqNr6ScrMsuozQlZR3mmb4OK7+GlXSoCsd7i8ZtReEW4rcoeciavMWavCZnFuP+M
         Ni7gGvs3fiu1LWMPMduf7NezLqoO2vhd+Q3/FJ02GlnPuF7zoAqr7jDyhuDIvCzlFfm6
         WgY1r4WyPoCKeItqXU2RJeOpepAXP32XA/9NoR42BCCm08f7Vpymv8GpY+PtwoG6dLOL
         fXeQpeCOjC5bAWirR+7z/TrBZKSXeJzKxEjbkHC1Zmw8Y8pz3MxWCVH2WDfclaX/dNmX
         SA+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mcgIRC/HNEe7lsJz7pmd0y1EIPpQzDpH6gefT3g5c7Q=;
        b=SxAkzUaLpC+uRLe9u7MBOcnBQ78v+HgISXKc1bitww6W/UDaqxjKd9QhipEzqbbb9G
         FxtVE97L1t6jp/E5J+wM2loQ9V2bFaxZ/P6g2HmdOW3507/atyyzoKVRAnq5hsCOaglS
         6okCMaghEOUNz4/Q52uqUvJn7R184gQeWud1g46nEWoFsMVkhu+1Ms3viBLuO5TVKdln
         fJpMnb1tfSK+jde+aJCVUZF8GmV1HLYwkLKZlcJVCfaMxqyGFJFhRKbXtyfdpaHpLW5V
         HW4MgCMDr9RAyM7ClQI2InHMPf72TGX4oBzUZxwWemdWl55Msu+217yB/lMhLWd/XfsG
         n4Pg==
X-Gm-Message-State: AOAM531XWPWiktPSlCPbeZh+ok0WQdg99mOPDFo50GIqSx/nN1HyuFIM
	+JT4EFXmaTr3Ov6OcS9jTimlQMCYdTzPcqVq
X-Google-Smtp-Source: ABdhPJxYJADP+RENmVtfWhy/RUF6UyOA1sTS+zsKA2W4cT2xDH3DFswqnC4wMvLhwpwJ207KqhmL3Q==
X-Received: by 2002:adf:a51a:: with SMTP id i26mr2045786wrb.406.1592300157151;
        Tue, 16 Jun 2020 02:35:57 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from localhost.localdomain (35.106.2.81.in-addr.arpa. [81.2.106.35])
        by smtp.gmail.com with ESMTPSA id s8sm28086771wrm.96.2020.06.16.02.35.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Jun 2020 02:35:56 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] common-licenses: add BSD-2-Clause-Patent
Date: Tue, 16 Jun 2020 10:35:54 +0100
Message-Id: <20200616093554.20162-1-ross@burtonini.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
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
2.24.3 (Apple Git-128)

