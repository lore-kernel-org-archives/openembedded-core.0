Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f194.google.com (mail-ig0-f194.google.com
	[209.85.213.194])
	by mail.openembedded.org (Postfix) with ESMTP id A88D67652D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 20:56:57 +0000 (UTC)
Received: by igbpg9 with SMTP id pg9so502262igb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 13:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9kgl9wutBtdbtdMDlg2tq3mJL5z+r/pXzpzqDUsBqiY=;
	b=W6MJutlUfTMEprLuUMQV0+nxd/rcYFTbr3GhESJFZMbscNeO7t2muvm/iXR+kohNZ8
	tmC6zTM03n3I6CErKIrvBFJJ8rZU7WmET2Q7aAolgJppo8coy5UZgtAD39AuswwedWWl
	kzD0MPmoXK8EdJTZrDrT1Wj/WEIaYhymrl04Q8PqrKqWYjOFd7K+s54nTI/MOjLEdJLa
	pLWqZq1d3HNBtiR2a4gppLAglS8x4jU0KWCQQ/b6vyhgMxN7vg7XxaLVFy6YeNtra6WJ
	9MNeSLLFYe+2sPm8PxMZHcJ/pcPiHDDYwfWW/b6+Pr6uFBFS3ILaxuIIfJdazinEfqzt
	VFKQ==
X-Received: by 10.50.1.43 with SMTP id 11mr43185igj.76.1438289818175;
	Thu, 30 Jul 2015 13:56:58 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id a6sm1530978ioj.1.2015.07.30.13.56.57
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 30 Jul 2015 13:56:57 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jul 2015 13:56:25 -0700
Message-Id: <1438289788-23120-5-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438289788-23120-1-git-send-email-armccurdy@gmail.com>
References: <1438289788-23120-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 4/7] busybox: disable sha3sum in defconfig
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
X-List-Received-Date: Thu, 30 Jul 2015 20:57:00 -0000

The sha1sum, sha256sum and sha512sum applets have not historically
been enabled by default, so don't enable sha3sum either.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/busybox/busybox/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
index 357011c..0274123 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -271,7 +271,7 @@ CONFIG_SEQ=y
 # CONFIG_SHA1SUM is not set
 # CONFIG_SHA256SUM is not set
 # CONFIG_SHA512SUM is not set
-CONFIG_SHA3SUM=y
+# CONFIG_SHA3SUM is not set
 CONFIG_SLEEP=y
 CONFIG_FEATURE_FANCY_SLEEP=y
 # CONFIG_FEATURE_FLOAT_SLEEP is not set
-- 
1.9.1


