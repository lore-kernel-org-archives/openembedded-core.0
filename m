Return-Path: <mgloff@emacinc.com>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 50E8772392
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Dec 2014 19:37:55 +0000 (UTC)
Received: by mail-ie0-f174.google.com with SMTP id rl12so8462512iec.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Dec 2014 11:37:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=3MOeamTD94x1gHo3otZg+V5VX9GLxZ7uNf/jKt0RlQ4=;
	b=Sw5aZZbr9FPtA+1lD++ak/v3wvyzSp4tuFXqYVUYYa/KZKFh2Ea+ee/HfLXBpoGjMp
	UDT1NQ2pfsFtQIDfDZFWnPrApC6Vf5aBouRMhBXKw+fJtUjbhp1nWnG1BJkd8/P0g9mA
	fldXbQO1hx+8wou6L3UdTp36CVyk9ke7n0vbauPNJJsz48cmGKjvawuB7aORou07DPH3
	XWWpp5ZA2JdVcMAVyTPaXPWOvlYUrT+8YfWXhOvCwq61CrL4W63WU7lMnhf9DkksDio+
	H2BXYWMrrFOduHrGWNobPJCXEJ4BwEgQ1aRqOd5rSv+p02maFVGPyTKPuJeHoXHLDZPd
	v9ow==
X-Gm-Message-State: ALoCoQksVgMG5lUqcfClFvAMwXSKQRtoAWFywJM2/snxSGT3goexlswwr5NMzfR26TdLn1GLsqJn
X-Received: by 10.107.130.197 with SMTP id m66mr22025492ioi.10.1418499475802; 
	Sat, 13 Dec 2014 11:37:55 -0800 (PST)
Received: from eng-20-lx.emacinc.com ([66.186.100.194])
	by mx.google.com with ESMTPSA id q7sm2508842igx.9.2014.12.13.11.37.55
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 13 Dec 2014 11:37:55 -0800 (PST)
From: Michael Gloff <mgloff@emacinc.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 13 Dec 2014 13:37:44 -0600
Message-Id: <1418499465-1801-1-git-send-email-mgloff@emacinc.com>
X-Mailer: git-send-email 2.1.2.374.g63a4513
Subject: [PATCH 1/2] Link /media to /run/media
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
X-List-Received-Date: Sat, 13 Dec 2014 19:37:58 -0000

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


