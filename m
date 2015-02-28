Return-Path: <mgloff@emacinc.com>
Received: from mail-ie0-f170.google.com (mail-ie0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 7A2D5737B4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Feb 2015 19:49:41 +0000 (UTC)
Received: by iecvy18 with SMTP id vy18so38792738iec.13
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Feb 2015 11:49:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Bx2oO340ESowf0J2DscW49kQFkGaj41y6FtHZxG6Uks=;
	b=WjWd3CJwT7Ne85Q5CNMh+b5cet1xL5QU7YQd+bbni5dXq46aPHm4qM17ot0CQwr2aG
	B1IZmfWdJ6TPVV4s3TAqOySspWht24sJKt2ajDSsHP0L20IcrhYja8tCphMoonOiAfkl
	Zvv5px/8gK7ziNs7PQToeF9Gu+gZcWtk6a/wvC6qtCXZ8T/IXyLC0OuFIbg6n4rt8lcn
	0ZzeNFfoIRKZzS4jEknp8dnkKcwUKWe6nGRY18fV24bmb1fSWfvUbgLS+xrk+Pr4btzT
	6UcIDo1tP07FAEkimTzClmwYU01jT8h34etmlaNPSFAsharCVVXJaKUA0S/XW6u/iGAe
	0VaA==
X-Gm-Message-State: ALoCoQkvZpwTwHLsTR6iX9+ulS95aGkyUruklTiEOcR9yoOTOOIsuyPJMQGDhKBO80VNFRPsajA7
X-Received: by 10.50.142.38 with SMTP id rt6mr12581140igb.39.1425152982494;
	Sat, 28 Feb 2015 11:49:42 -0800 (PST)
Received: from eng-20-lx.emacinc.com ([66.186.100.194])
	by mx.google.com with ESMTPSA id i93sm4847313iod.7.2015.02.28.11.49.42
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 28 Feb 2015 11:49:42 -0800 (PST)
From: Michael Gloff <mgloff@emacinc.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 28 Feb 2015 13:49:32 -0600
Message-Id: <1425152972-18918-2-git-send-email-mgloff@emacinc.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1425152972-18918-1-git-send-email-mgloff@emacinc.com>
References: <1425152972-18918-1-git-send-email-mgloff@emacinc.com>
Subject: [PATCH V3 2/2] volatiles: Change linking ordering of resolv.conf
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
X-List-Received-Date: Sat, 28 Feb 2015 19:49:43 -0000

    Fixes error on boot on readonly rootfs
        rm: can't remove '/etc/resolv.conf': Read-only file system
        ln: /etc/resolv.conf: File exists

Signed-off-by: Michael Gloff <mgloff@emacinc.com>
---
 .../initscripts/initscripts-1.0/volatiles          |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/volatiles b/meta/recipes-core/initscripts/initscripts-1.0/volatiles
index 1fc5816..e6f0695 100644
--- a/meta/recipes-core/initscripts/initscripts-1.0/volatiles
+++ b/meta/recipes-core/initscripts/initscripts-1.0/volatiles
@@ -32,7 +32,7 @@ l root root 1777 /tmp /var/tmp
 d root root 0755 /var/lock/subsys none
 f root root 0664 /var/log/wtmp none
 f root root 0664 /var/run/utmp none
-l root root 0644 /etc/resolv.conf /var/run/resolv.conf
 f root root 0644 /var/run/resolv.conf none
+l root root 0644 /etc/resolv.conf /var/run/resolv.conf
 d root root 1777 /run/media none
 l root root 1777 /media /run/media
-- 
1.7.9.5


