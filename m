Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0E3C565D00
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 20:16:54 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id y5-v6so5359282pfn.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 13:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Miq7Roxbxwua7p4k5STstjFVZjFwfXtcZeYuj2lrt6Y=;
	b=NHSeDW7NS2TlIZse9YjV1GP1Sb03ILJWmVaMFUtYPnCMeXKdHeMcmG0On/GkYpOjhA
	w/AorgBATZKIqCE65dQkj7bfyA/qsf8Y+kmSXbE+RebAO4OMDnaQ3lBjtXGyJtUmJzLT
	REqMmWxwWlei4SBbJUyNj+czXXWgopJVSfmWC25JLCWaKrE66bnMPISjJv3/+1+PBQKq
	iMEKVS7uXG98C/0nGACiJUH9UAN8HHK5pUOgIKs1dbtuVyNsC1BqIK4oRKfq1uvKJXdx
	lsy5gZWPHQCQGBpD/bRtHRoW6Ac9SFMUPILlz4usrxpvgP4XsZ8aVRREzTMq8XTOM5sa
	UTqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Miq7Roxbxwua7p4k5STstjFVZjFwfXtcZeYuj2lrt6Y=;
	b=sHYC7U5vniBNpBmFH2XpedZrPJAIIfUN+RHzosBXO64oEALEY3K7x0BdKhkeKXKacf
	OQh9yBo9/x6uah9IN9cX+3lw3yKub0qi93FG2ard3B4CbKW2BNv+/CmjCHHequtcvvOH
	4NB90s/Cm5Yr+5nN9B7ExHn61FgrOK24vtrjG/S3EXxRQHkwZnUisSiyIJvWGJxKkyRL
	YyHMt/c4VFisU7PbJxYEBJl8puaZsvbpJ5+rFHGE6HTQBqMqZWahDFu/GS8Fi8h5WXas
	wZcsWPLumulgPGhbPZ9NyuhpmbwpbgFR9GoPW6hP8XO1xlFqewJl/0GO49tXc2XNgGkJ
	VB3g==
X-Gm-Message-State: APt69E3zOzrBOZYx64yWXB2j/ZKbk4/WruJ4SwlJ/M4bUCbQCpzKV/8P
	bupZPInjQc1nj5XtVhaS8HnlZw==
X-Google-Smtp-Source: ADUXVKJMeju6CpH7IfVJ1lTC3dvdzNEmjG1ZZbbigbMB58kJsuV6Xa95oZ5ZJZoC1p1Jce0A3bOa9w==
X-Received: by 2002:a63:b407:: with SMTP id
	s7-v6mr2956953pgf.334.1529093815869; 
	Fri, 15 Jun 2018 13:16:55 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	z82-v6sm19919269pfk.30.2018.06.15.13.16.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 15 Jun 2018 13:16:54 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jun 2018 13:16:48 -0700
Message-Id: <1529093808-10025-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
Subject: [rocko][PATCH] common-licenses: Add BSD-1-Clause
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
X-List-Received-Date: Fri, 15 Jun 2018 20:16:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

Some projects are starting to use it.
  https://spdx.org/licenses//BSD-1-Clause.html

Signed-off-by: André Draszik <andre.draszik@jci.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit 77f692ecb39d880b2cb420850a31534860eb2cc5)
Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/files/common-licenses/BSD-1-Clause | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta/files/common-licenses/BSD-1-Clause

diff --git a/meta/files/common-licenses/BSD-1-Clause b/meta/files/common-licenses/BSD-1-Clause
new file mode 100644
index 0000000..ded8897
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
1.9.1


