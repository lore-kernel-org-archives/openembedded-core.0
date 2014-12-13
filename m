Return-Path: <mgloff@emacinc.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 6ADB8723FE
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Dec 2014 19:57:38 +0000 (UTC)
Received: by mail-ig0-f170.google.com with SMTP id r2so4156936igi.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Dec 2014 11:57:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=3MOeamTD94x1gHo3otZg+V5VX9GLxZ7uNf/jKt0RlQ4=;
	b=e745SL30HMolbswfT2ViC8UoAZiKGvXKeQ4vzRjFOl7j73XAGHBVhq/MiN3T1ib6Is
	TPeh1z51X5U8oF2j7MMZAkw2AqyJdSVNy80SAy7EqG3mmobGuYJMuWG8T4teKdxsmwB7
	qMtehEU+wQ9dJ1tj40Zx9iRWlQCyf/tE90nmdMkfs+3YOdeBhxFp+sxnw0UdkVClEAq0
	yzGP8x3FpGehgTOV/a9teQo7YtY92rGcyDorveyThjY4Bxo3N1O3+rx3KF1eb7NVNtf5
	IrMa2Gj9PQUeyOqKeglx8/3OLZ1r/8PVj6EX2euVvNZjt7y4oNeCldc/EavG9Ty9Tlpz
	BDAw==
X-Gm-Message-State: ALoCoQnF9bzs96hzTWf59uXduLPqfO8di3UGj0ULeEmSfF64kwEY9goXdJ+XHMnXipMFZVsg6+Xp
X-Received: by 10.42.155.71 with SMTP id t7mr289910icw.96.1418500659009;
	Sat, 13 Dec 2014 11:57:39 -0800 (PST)
Received: from eng-20-lx.emacinc.com ([66.186.100.194])
	by mx.google.com with ESMTPSA id v83sm2385446iov.30.2014.12.13.11.57.38
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 13 Dec 2014 11:57:38 -0800 (PST)
From: Michael Gloff <mgloff@emacinc.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 13 Dec 2014 13:57:29 -0600
Message-Id: <1418500650-2156-1-git-send-email-mgloff@emacinc.com>
X-Mailer: git-send-email 2.1.2.374.g63a4513
Subject: [PATCH V2 1/2] Link /media to /run/media
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
X-List-Received-Date: Sat, 13 Dec 2014 19:57:45 -0000

Since the change in automout.sh to mount devices to /run/media,
we create the /run/media directory on startup and link /media to it.

Signed-off-by: Michael Gloff <mgloff@emacinc.com>
---
 meta/recipes-core/initscripts/initscripts-1.0/volatiles | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/volatiles b/meta/recipes-core/initscripts/initscripts-1.0/volatiles
index 297245d..1fc5816 100644
--- a/meta/recipes-core/initscripts/initscripts-1.0/volatiles
+++ b/meta/recipes-core/initscripts/initscripts-1.0/volatiles
@@ -34,3 +34,5 @@ f root root 0664 /var/log/wtmp none
 f root root 0664 /var/run/utmp none
 l root root 0644 /etc/resolv.conf /var/run/resolv.conf
 f root root 0644 /var/run/resolv.conf none
+d root root 1777 /run/media none
+l root root 1777 /media /run/media
-- 
2.1.2.374.g63a4513


