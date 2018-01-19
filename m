Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2D0E677FC9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jan 2018 12:36:29 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id 143so3098099wma.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jan 2018 04:36:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=PMnu/0ITEw+g08d9s075Q+VaOX7trhE3lxV7czAw91g=;
	b=QvfqInfyirHX0MV146aFOZcuv3idL9R+qpv0b7nON35BXc59Kux5OiuYl01NtkqoJn
	GYRGrobulx3PS9qxnkI+a7Pf6MBl9km4+GK/3GK7xblwEyPPbOjU4ow0DBUdgfXxL1sa
	JNXhSxsCWkH7IEGCg7YIKC7XThejdP1Cnad1wdl1wRKmqbSmNarLxwgcg7lQ5TRUPYS1
	DLRDX1KWZPeQAjZQhckVLNM4MWxzc4eIpmOqzKZUVEtuPIGkS/F58fetD9vfNAS8vQC+
	wy4Oei8SUX91IY88USDFZoewrDaU8HYEPLM20dLeBuxexbjyusgTK3ty5QLv5a3+f67/
	eJGA==
X-Gm-Message-State: AKwxytcIGPobkb68XSTtaLSqhwdOQlRK9Ase63mdlyWzlJPO+/UPOW1F
	ivfsrEClQYPQUadkB4mQvyqgIKNvM/M=
X-Google-Smtp-Source: ACJfBouIiar+j4ozL/AIcutAMs61v0evskH4Ik9FgNxXfbUTGWG38JeLwoQhBvl/l7g8oQnVpv+FTQ==
X-Received: by 10.80.146.87 with SMTP id j23mr8623060eda.53.1516365390605;
	Fri, 19 Jan 2018 04:36:30 -0800 (PST)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id c5sm2845185ede.30.2018.01.19.04.36.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 Jan 2018 04:36:29 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Jan 2018 12:36:28 +0000
Message-Id: <20180119123628.23582-1-git@andred.net>
X-Mailer: git-send-email 2.15.1
MIME-Version: 1.0
Subject: [PATCH] common-licenses: Add BSD-1-Clause
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 19 Jan 2018 12:36:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

Some projects are starting to use it.
  https://spdx.org/licenses//BSD-1-Clause.html

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta/files/common-licenses/BSD-1-Clause | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta/files/common-licenses/BSD-1-Clause

diff --git a/meta/files/common-licenses/BSD-1-Clause b/meta/files/common-licenses/BSD-1-Clause
new file mode 100644
index 0000000000..ded889768f
--- /dev/null
+++ b/meta/files/common-licenses/BSD-1-Clause
@@ -0,0 +1,9 @@
+
+Copyright (c) <YEAR>, <OWNER>
+All rights reserved.
+
+Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
+
+Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
+THIS SOFTWARE IS PROVIDED BY Berkeley Software Design, Inc. "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL Berkeley Software Design, Inc. BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+
-- 
2.15.1


