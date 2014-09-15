Return-Path: <iwamatsu@nigauri.org>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 5DACF60167
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 23:54:20 +0000 (UTC)
Received: by mail-pd0-f169.google.com with SMTP id fp1so7321945pdb.28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 16:54:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=VQDFUTGtGN9By82myl1v0Q1xuyxRr975Qxc9J/TQbQ8=;
	b=Qbw+nSqpm3Hd0L1m2JTwvREgX0Laj17JA77mIk5ol4CEySHd6xdLAzhWlCzi2Sn20D
	EVY8tlb9mWFzKIi99zpdjiPPylI0KSOGqMCkcEgaR72s1lLsHPtnkz4fI/1VAFkb49hn
	C8Hd/BwfaTaY/wNqPo16Xozx78xz0PP262+yoMf1FJtdUKVaq0lCkz4oIOZ0ZmDoC8kv
	kHOnuADIserjq1F3Fa/Llt53TrzU3YPVyUlGZ2H5o+4kpDqSlbpfqrFSLC5NP+amlpP8
	IelEgbJ0f8UMakNP00A6SFR8MA8VApmCq7Yhgt4QiPRE6tuFYsSSspcqUv+8+y7loDIg
	XqUw==
X-Gm-Message-State: ALoCoQkCDtIQNQeZVn6ovzLPRP11QPTYdvT/kJ27OqK4/XwIkDt5QajiB5zGkHYdbG6CyjaJSLzO
X-Received: by 10.66.178.231 with SMTP id db7mr26183998pac.63.1410825261800;
	Mon, 15 Sep 2014 16:54:21 -0700 (PDT)
Received: from xps-iwamatsu.renesas.com (49.14.32.202.bf.2iij.net.
	[202.32.14.49]) by mx.google.com with ESMTPSA id
	ry9sm12872205pab.37.2014.09.15.16.54.19 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 15 Sep 2014 16:54:20 -0700 (PDT)
Sender: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
From: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Sep 2014 08:54:10 +0900
Message-Id: <1410825250-3067-1-git-send-email-nobuhiro.iwamatsu.yj@renesas.com>
X-Mailer: git-send-email 2.0.0
Cc: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
Subject: [PATCH] packagegroup-core-standalone-sdk-target: Add libgcov-dev to target sysroot
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
X-List-Received-Date: Mon, 15 Sep 2014 23:54:28 -0000

When a user takes coverage in gcc of SDK, it becomes the link error in SDK
because there is not libgcov.

----
ld: cannot find -lgcov
collect2: error: ld returned 1 exit status
----

This adds libgcov-dev to target sysroot.

Signed-off-by: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
---
 .../packagegroup-core-standalone-sdk-target.bb     |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb b/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
index 5d1ce97..154a55c 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
@@ -7,6 +7,7 @@ inherit packagegroup
 RDEPENDS_${PN} = "\
     libgcc \
     libgcc-dev \
+    libgcov-dev \
     libstdc++ \
     libstdc++-dev \
     ${LIBC_DEPENDENCIES} \
-- 
1.7.9.5


