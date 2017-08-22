Return-Path: <liu.ming50@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 606E178262
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 01:27:42 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id z91so20420561wrc.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 18:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=GJmMH/4yM2RRCk69QQrOOKPIkLDtChcpMwnIxQN5LM4=;
	b=spRGONt4LTzyiR5fFrS7Au6gIoCCvCVeUb91pJxvhuqabjWQmpE0YfK6GW80BbPEUU
	HOJz6smxCpcfh4CYLnGY+6EEQwm0HPKAYM+2xejATU02vccKKBaW5eRJmgSw1z20n3uF
	1vBD0+J2ewJmxEGqDeAT+FT2C2NRBgYmJHUW47H4m3ZbUDhqXqpvTeIgra2wwJSiPn3Z
	xAg3c2EW1ETky/WuDWpZv84uZeh5kSIbKDKQNl09JGtDxmg9hOHvfyBYKc0y4RZzhPWk
	eAdn+xu9k3wQihHtr383ugKw3J3vdGiEAiAKhAn4vccTEySL1PETgn5lqnrjzp1E3eCa
	i99Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=GJmMH/4yM2RRCk69QQrOOKPIkLDtChcpMwnIxQN5LM4=;
	b=Mq39zpeadrSqmXQ/t1Yv2YDvde6GA3yUQuEJjABaFWVdthpqwJCvhbYuHAKgqTFXgh
	87619oGOkwfMtX+7LzWFc66rZSzax8oTzLw9o8kob4QK/ylba/dPf3NuWB0VHQE9khkZ
	H1nXX50WmmoCYjU+hkCOM/3sbhcFWkk4511uwKaGglkNK6HHaPV/FRoIJyPB3WzTWOFT
	7uVjFzMKQrCefh2vftCuP4JqFyjscezCUa8Jn3/i4D6P3AVQdD3tTUFu0XWIVtfvGNPq
	aMljG17EzbRHkPViQjUJFbJjJxrZ6YQU2FWYg7bYuuFAu+JZx7J7zxXWebvI6B3kmFYh
	mswA==
X-Gm-Message-State: AHYfb5gLYcPD/sxq8c9ssQRIFLSUrADDnw/c4szJ/7XcJ8j+ke0126iU
	EFTtM7PT3UYHkH+l
X-Received: by 10.80.222.194 with SMTP id d2mr13357046edl.262.1503365263683;
	Mon, 21 Aug 2017 18:27:43 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([27.191.201.88]) by smtp.gmail.com with ESMTPSA id
	o30sm6980761edi.90.2017.08.21.18.27.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 21 Aug 2017 18:27:43 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Aug 2017 03:27:36 +0200
Message-Id: <1503365256-31934-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [Poky] [PATCH] conf-notes.txt: add shell environment header
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
X-List-Received-Date: Tue, 22 Aug 2017 01:27:43 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

The header text has been moved to meta/conf/conf-notes.txt by:
[ meta: move some text from oe-setup-builddir to conf-notes.txt ]

Need do the same to meta-poky/conf/conf-notes.txt.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta-poky/conf/conf-notes.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-poky/conf/conf-notes.txt b/meta-poky/conf/conf-notes.txt
index 2f2932b..f1a4f4d 100644
--- a/meta-poky/conf/conf-notes.txt
+++ b/meta-poky/conf/conf-notes.txt
@@ -1,3 +1,8 @@
+
+### Shell environment set up for builds. ###
+
+You can now run 'bitbake <target>'
+
 Common targets are:
     core-image-minimal
     core-image-sato
-- 
2.7.4


