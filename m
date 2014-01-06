Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id C835460DFD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2014 10:21:08 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id c41so7716791eek.37
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Jan 2014 02:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=OggVjOCLHJqpuZPLOmi0Ncb7PLvzc/9P92eWsghmmGU=;
	b=n6huNOnEu6wj3Jmm/b4WeUWu2ho0MSjCR9kagCTtQL/rPzW1qY1s8plEiHU/uBrmZG
	HYC3GM/3A6OnGiaNX7QrLWQfCLwp1hAuRmuIH2Mlr1/p45eMBGuFjD/ZBHp4Jrpqg/Wv
	RVqtgA4+m9UsbGE9/kU4uXIx5FzrRayKacEDmrNR7pQeVLREi5xz9KXYHImMrcftoBAV
	k5PtRUwf/edhTJctG2IWFLIw50rsVPRZvG6VCyGSaNlVOHl5KJr0wte5SDXOnWe7ZGuS
	w3wPaTrG02vqnDBYTy7GW0EM7wG9z7Tm4d1IgHGwbAhpmiauutesc4fiSJiaDnBeK7ww
	xx+Q==
X-Received: by 10.15.23.206 with SMTP id h54mr87850759eeu.17.1389003669505;
	Mon, 06 Jan 2014 02:21:09 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	o1sm169611007eea.10.2014.01.06.02.21.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Jan 2014 02:21:09 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jan 2014 11:21:13 +0100
Message-Id: <f0f10522e7dbd46b4f602560fb0a0b40ef3bdda8.1389003637.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.2
In-Reply-To: <cover.1389003637.git.Martin.Jansa@gmail.com>
References: <cover.1389003637.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1389003637.git.Martin.Jansa@gmail.com>
References: <cover.1389003637.git.Martin.Jansa@gmail.com>
Subject: [dora][PATCH 2/2] eglibc-initial.inc: Drop duplicate include
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
X-List-Received-Date: Mon, 06 Jan 2014 10:21:09 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

There is little point in including the file twice so lets not. The
main recipe already included it.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/eglibc/eglibc-initial.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc-initial.inc b/meta/recipes-core/eglibc/eglibc-initial.inc
index 83b1d2c..0f0e1cd 100644
--- a/meta/recipes-core/eglibc/eglibc-initial.inc
+++ b/meta/recipes-core/eglibc/eglibc-initial.inc
@@ -1,5 +1,3 @@
-require eglibc-common.inc
-
 DEPENDS = "linux-libc-headers virtual/${TARGET_PREFIX}gcc-initial"
 PROVIDES = "virtual/${TARGET_PREFIX}libc-initial"
 
-- 
1.8.5.2


