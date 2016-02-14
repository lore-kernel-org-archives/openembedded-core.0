Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 4F83F7002B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Feb 2016 20:52:58 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id s5so49516399qkd.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Feb 2016 12:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=vYcnibeu1VlJhs7ft3Kb+luUv38W6MmqzI8TlyUKT10=;
	b=Zwoo2HJWYzDzaCNu7pFac9DGe0YOMo2Bf1yo75D4adODGfGuxqTc3UJ+tpS24Cd8rA
	kuFoyU/BEfusRSVvtO6HBIL73k5W891CBh/0mCXT32jWprbhQeDUU/q5F8kwR41eUFSo
	yd9schaRElx2CkGuhMtLe6xUaekNFu6Sndukw9xcYutqCW9tlCXDQV3stLOhS/5PxQhC
	8BzTgvJtWyWgLU3b/GGEDdHXlKfSsFK0vejyJUdyEvx8xmXfhwV9gj983yNZ43uwwPnr
	W0w9L4E0XZn3GOmPRZI+S/+E0+wVIaOuBpwswyM+XbyuWmyXe85gyllBPQI7YbQ6uIYM
	MyGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vYcnibeu1VlJhs7ft3Kb+luUv38W6MmqzI8TlyUKT10=;
	b=Ub9iV2N6xzSGvFWbDyZfJYr6a+nr5Chyn+RsuXyboB7s3bSIfvFE/3VNsaC3Dj5Kk4
	cJV79MRl5PDDEiuXwqAcRIzFH2lUqPhUPMffTFoSRcjiN1zq19BD6AyByKN3kw3tz15V
	YmxtMoPhQaKuyksY5DJ0Z7VqoiqPrAqTeKX3zddPFK8GNNQNThX65yDfwudSyqb/2xVf
	q1rFKtreIH8cMgxPy9YpuGKe/JhbcOnwDeAMXGrezgkJnjQUUTO0a9vCPLj1n9kuoE0v
	OI5q/LG6qgYDmX3ayv7uJYT0bFOJWMBacPufCGBNXGAYO1I0zhl/IorBnXLiZZnc4VQ1
	Efsw==
X-Gm-Message-State: AG10YOS99i/r5Gw6JYRX57e5LgYq/Y+vL+vhYbFxk6y3oqizJNRYgQScSMFnfHyn/RAFbg==
X-Received: by 10.55.72.70 with SMTP id v67mr16218220qka.47.1455483179143;
	Sun, 14 Feb 2016 12:52:59 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	q22sm9893272qkl.19.2016.02.14.12.52.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 14 Feb 2016 12:52:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 14 Feb 2016 20:52:47 +0000
Message-Id: <1455483171-66851-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.1
Subject: [PATCH 1/5] musl: Upgrade to tip of tree
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
X-List-Received-Date: Sun, 14 Feb 2016 20:53:00 -0000

From: Andre McCurdy <armccurdy@gmail.com>

Includes misc minor bugs fixes:

  0ed932f do not define static_assert macro for pre-C11 compilers
  692b16d add declarations for utmpname/utmpxname to appropriate headers
  500c688 fix return value for fread/fwrite when size argument is 0
  416d1c7 fix line-buffered flush omission for odd usage of putc-family functions
  5a6e8d0 fix failed write reporting by fwrite in line-buffered mode
  869a9df remove workaround for broken mips assemblers

The addition of utmpname/utmpxname prototypes fixes a change
introduced in the previous git snapshot version which broke lxc.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index d4413f5..8c54db8 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -3,7 +3,7 @@
 
 require musl.inc
 
-SRCREV = "756c8af8589265e99e454fe3adcda1d0bc5e1963"
+SRCREV = "0ed932f34f11663e6b3ddfa866b1798a5938a3dc"
 
 PV = "1.1.12+git${SRCPV}"
 
-- 
2.7.1


