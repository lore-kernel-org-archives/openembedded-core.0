Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f172.google.com (mail-ob0-f172.google.com
	[209.85.214.172])
	by mail.openembedded.org (Postfix) with ESMTP id 82AE473186
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 15:59:17 +0000 (UTC)
Received: by mail-ob0-f172.google.com with SMTP id sd4so36008710obb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 07:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=K0oHQsfqPM4L9McO+9/s9eQkqq74BqjNSkt9pUBBKSM=;
	b=pOoyVz5Ylp0Rxd9mQOr9Gzm8zqdoWorEfqBN6H2vbnrbD0c/5yl+ArPTe9F+JtHgnA
	l9fpBCgFuHK87lrsfp1H6w5N8GD4NHnheWXN9Zhl6FmVDX0Iz5XKhnG7n3d5BKZxMoCT
	bgOS/Owb9i3b6t2wXSK2YI7shphM6XyiGPdD0I3G7LivEqkw/jI/7O6c395qP7O5inq5
	ikRlVBT4jtWc7kYeyauAKawt6kopAHzwchPvlmkmk9KAT3mYv1rkTAwamiSVrFcoC/OY
	Huolfvl2MRskRQ5VNGKsj5N28nMqdvxVwATD9/fQL5GR0QA/hTsKGvCGeHnLqKHssyZ7
	ZkDQ==
X-Received: by 10.182.73.225 with SMTP id o1mr36290306obv.80.1450281557828;
	Wed, 16 Dec 2015 07:59:17 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	kw1sm2476980obb.28.2015.12.16.07.59.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 16 Dec 2015 07:59:16 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Dec 2015 07:59:02 -0800
Message-Id: <1450281543-9320-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1450281543-9320-1-git-send-email-armccurdy@gmail.com>
References: <1450281543-9320-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/3] tune-cortexr4.inc: provide an _armv7r over-ride via MACHINEOVERRIDES
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
X-List-Received-Date: Wed, 16 Dec 2015 15:59:17 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/machine/include/tune-cortexr4.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/machine/include/tune-cortexr4.inc b/meta/conf/machine/include/tune-cortexr4.inc
index a04573c..89a6cf6 100644
--- a/meta/conf/machine/include/tune-cortexr4.inc
+++ b/meta/conf/machine/include/tune-cortexr4.inc
@@ -7,6 +7,7 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexr4', ' -mtune=corte
 
 TUNEVALID[armv7r] = "Enable Cortex-R4 specific processor optimizations"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7r', ' -march=armv7-r', '', d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv7r', 'armv7r:', '' ,d)}"
 
 AVAILTUNES += "cortexr4"
 ARMPKGARCH_tune-cortexr4 = "armv7r"
-- 
1.9.1


