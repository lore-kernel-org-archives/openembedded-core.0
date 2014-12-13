Return-Path: <mgloff@emacinc.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id A807F724A8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Dec 2014 19:57:40 +0000 (UTC)
Received: by mail-ig0-f169.google.com with SMTP id hl2so4154913igb.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Dec 2014 11:57:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=8LgKSsEQWuxVpFdFMLAeeZ5VAQb5ZpBkMocomX1NBzQ=;
	b=XXwbhpOsTcSOVpWgs4anqa4bF26fVNGFdlblZOYcvMx5y/bE5+zjDeXUgwp8nc8Y1T
	F2gl0P2D0bRWip6xnqtOAaSHeywZ26KeiBgsO15PxCSI/Yav5EYoiiBR+QDG3MP27b54
	X/YB8PXcyq7J4OadqWibmLIe+eF40WFh8MBxgCkQmDZLITRtnDz2CS+fMqHoiWr8p32V
	3L5s9otw11ByYy/b8aTjc+wZ0BrpQtC6I9/2kaShcUtRns1ybmIwnI/Nz/TMz1rd4ZFT
	PRTfIticYTDFbnt+5r9yxEW9JHQAT526d3wsrAeBC0xbWVvk4/PWzIB7JVQ6p5g+ta+/
	8C7Q==
X-Gm-Message-State: ALoCoQnIQGyn2qvOjP+N6aJ4yYCX1D72P0w7bvZA+QOqVVx6fsu1cZ7hnsAtTzPyQB5QQfFYeZle
X-Received: by 10.42.14.8 with SMTP id f8mr22193505ica.53.1418500661051;
	Sat, 13 Dec 2014 11:57:41 -0800 (PST)
Received: from eng-20-lx.emacinc.com ([66.186.100.194])
	by mx.google.com with ESMTPSA id v83sm2385446iov.30.2014.12.13.11.57.40
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 13 Dec 2014 11:57:40 -0800 (PST)
From: Michael Gloff <mgloff@emacinc.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 13 Dec 2014 13:57:30 -0600
Message-Id: <1418500650-2156-2-git-send-email-mgloff@emacinc.com>
X-Mailer: git-send-email 2.1.2.374.g63a4513
In-Reply-To: <1418500650-2156-1-git-send-email-mgloff@emacinc.com>
References: <1418500650-2156-1-git-send-email-mgloff@emacinc.com>
Subject: [PATCH V2 2/2] volatiles: Create /var/run/resolv.conf before linking to it
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

Signed-off-by: Michael Gloff <mgloff@emacinc.com>
---
 meta/recipes-core/initscripts/initscripts-1.0/volatiles | 2 +-
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
2.1.2.374.g63a4513


