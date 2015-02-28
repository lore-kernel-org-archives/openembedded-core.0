Return-Path: <mgloff@emacinc.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 149B8721E2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Feb 2015 19:49:38 +0000 (UTC)
Received: by igbhn18 with SMTP id hn18so8416147igb.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Feb 2015 11:49:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pLUSTH/bVX63A14qz1Mxst8LGWIeWpIxXl4D5Q6Azxw=;
	b=IfLdTJYUwXrsSJgJVHu8tcvDwvo71ZK0OyEoGCKHe3Uqs+NUv4BgR4DYhbflg7a8Qg
	vqtlUGH9QIhP4tu3T4Y06hHM7GSLV+PnUK48TGemB6WmYTynqQ8zGHWK4jE94wocv7TX
	3bt/M7JSsm2mSlCh+y6sraKtwttvFd5nnoTTj2DNflyqO4EKnza0Szae3GuxMNAvFPXg
	1zehOsSFtaPVRXHAaTqJcsmCTqxv2YXW88lfdxaFFhPXR84T5VnqGer8rG+FBUnXEJPD
	0SX45eRpQ62mMabxufwdH+HEJJeoTLaXmzMvSjfmYvPply+aOIiDEklasStI/9CdDPS+
	RzyA==
X-Gm-Message-State: ALoCoQkEXGfUFQ/v+hU1/ky3KJzHcTG/odK3Mev5AtKAxuapDzLdoz8H7Zi2qwKFN5Y3oMNC78p8
X-Received: by 10.42.198.14 with SMTP id em14mr23259278icb.32.1425152979876;
	Sat, 28 Feb 2015 11:49:39 -0800 (PST)
Received: from eng-20-lx.emacinc.com ([66.186.100.194])
	by mx.google.com with ESMTPSA id i93sm4847313iod.7.2015.02.28.11.49.39
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 28 Feb 2015 11:49:39 -0800 (PST)
From: Michael Gloff <mgloff@emacinc.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 28 Feb 2015 13:49:31 -0600
Message-Id: <1425152972-18918-1-git-send-email-mgloff@emacinc.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH V3 1/2] volatiles: Link /media appropriately
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
X-List-Received-Date: Sat, 28 Feb 2015 19:49:40 -0000

    Since the change of /etc/udev/scripts/mount.sh to use tmpfs, link
    /media to it

Signed-off-by: Michael Gloff <mgloff@emacinc.com>
---
 .../initscripts/initscripts-1.0/volatiles          |    2 ++
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
1.7.9.5


