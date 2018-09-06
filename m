Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4C9857964D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 11:17:08 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id e1-v6so1891746wrt.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 04:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=Liw2daMZskwR/1000NW0ZTY+9eJco+8FIVZz5Pq1LMY=;
	b=JGgYzkdxwfpWWEzVLQgkzlDgA5FI1I8eQdNcJGvg3C4B9KIuNeTs27E6W7gt8rhoBB
	qKEoRLPU95r6rLqrJYDe66sGjdeJEyK85FCJfdQlBIasqjo+W9wpXmXuVZNDVHshXRKb
	zmLMjMGHlYXUiWBjJPbWG9vN5aqO490JDDDAP8lVGPs6oKjwF6f2vR/17aPoXjFwyM9U
	/cWet7norZ7cRWkJ9o953NIkKwlMEGfdGAhaqthpDiLWWda8Itw84cE21kDcI/6F6osT
	UqOmHZSWGp/ARAS0KqJRoqyfX4G7w+H3x4bPrb7Hih9uk0bBtWQkqXyJefD25xPYbhVf
	MNvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Liw2daMZskwR/1000NW0ZTY+9eJco+8FIVZz5Pq1LMY=;
	b=jLFLIbH6lWI5e9IM8ngGA5r6UdJOX9VHKssbHf3ybSIQj4fRJJFposE11ElfbaeAmw
	Zy3+YY7FWXXsqpa5ZD5nCybwgE2IMq52s+OczZkU9N+ZLPYirhqQHsFOr22t41KhbWY1
	k8B+DSkdFCQ8h43nFtLVF4804fLZEUPESyHQs1ivO4ByKMfeNUR09zapHrMA3iMqWnFX
	BRV1c42efKgRNHT1j3qxNp75WzqX2Dayfj8YNAH6j4HGxT8mEhCMSXsMveuRCHXfWC0/
	VdGALosFrzo9W7G7BV25zLQ6V1EFZF5KpuSH5Og+cfp1+SN822z5QdvgavOJc1asyWtV
	LQwg==
X-Gm-Message-State: APzg51D2QyQvW9w/eibSfLhEvDGk1Tf4PiP1T+cSyZ8MyTnXL+EFBKFo
	CKws1aOD5LalnTL4tv7uKJBmHVCQa/E=
X-Google-Smtp-Source: ANB0VdYKid1s924hkkbZyZBij3tOwSntYI00ha1Vidy2R7+vprGXKY4C1ctJ6uhA5wXcj+W3Avax5w==
X-Received: by 2002:adf:f648:: with SMTP id
	x8-v6mr2011530wrp.144.1536232628729; 
	Thu, 06 Sep 2018 04:17:08 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	z69-v6sm5262906wmz.18.2018.09.06.04.17.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Sep 2018 04:17:08 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2018 12:17:06 +0100
Message-Id: <20180906111706.23053-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] mobile-broadband-provider-info: update patch status
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
X-List-Received-Date: Thu, 06 Sep 2018 11:17:08 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../mobile-broadband-provider-info/multilibfix.patch                   | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info/multilibfix.patch b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info/multilibfix.patch
index 9e75b7bdc5e..7e97e8ec356 100644
--- a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info/multilibfix.patch
+++ b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info/multilibfix.patch
@@ -2,8 +2,9 @@ The mobile-broadband-provider-info.pc file is installed into a non-arch director
 yet contains libdir which can vary depending on which multilib is configured.
 The .pc file does not require libdir so remove this to fix multilib builds.
 
-Upstream-Status: Pending
+Upstream-Status: Backport [8109fcd3c7299fae859fb891ff416927581a9955]
 Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+
 Index: git/mobile-broadband-provider-info.pc.in
 ===================================================================
 --- git.orig/mobile-broadband-provider-info.pc.in	2018-08-07 13:09:31.811364063 +0800
-- 
2.11.0


