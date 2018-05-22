Return-Path: <tanuk@iki.fi>
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
	[66.111.4.224])
	by mail.openembedded.org (Postfix) with ESMTP id E3609745D1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2018 15:30:33 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailnew.nyi.internal (Postfix) with ESMTP id 2C7B7182B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2018 11:30:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
	by compute5.internal (MEProxy); Tue, 22 May 2018 11:30:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; bh=hRksqeuLdM1dZ6JF9jkSvipcVNLQjLTArPWPZ15rA3g=; b=UBBASm71
	14vzAvgk3kUL7JmL+3CZBfN1JtJcoMMrBpVbKXCqJbBc2H7jTuFM3u6keeEmkxBg
	4la0JF18JVnmso+tX+Ow+Pn5TL3zSUbYnUZ92tb3Bdpuir+U5dm6iw3bpUN/S9DB
	KT9sqcWCDrTjmV6+f4bWzI38yoGXoJs2drczYPZFK3bUNqdSHtbDxrY9C2Q2FNbm
	MSvAcBy8JGkLCRRX4el9EG9x1FKRIIpToTs7h5owpX8mjDbJYkPiMvmoR+dnUed8
	o9g/3IOefS201uvs9jQY0DLthnZNRIA7sir85CndubIunK1d/whbB1hkHFKFUyGp
	kdQX+Xe7XGS0iw==
X-ME-Proxy: <xmx:mzcEW9it4Ll_2hsWf0CBSOqcrttUsnuMpbg96plzH1q_G4s-3oZvfw>
X-ME-Proxy: <xmx:mzcEW1DLmA7bZHkLKsohw-V_BkplM28vflorv5ppIovli5QHF6wJ_Q>
X-ME-Proxy: <xmx:mzcEW4tzfCcNeWZryD9luu7wCZPZrNYyZ34A0EbQwp_9YswelRXazw>
X-ME-Proxy: <xmx:mzcEWw-ft_BNM6q9ELBmPymq16yMVt08ZhWcyDLr_4BDKr8JuvHyxw>
X-ME-Proxy: <xmx:mzcEW42CDH6HnZyBPHf8NK_D2g8oRip2GfFi3cI4UAuAZrkA3QVk9w>
X-ME-Proxy: <xmx:mzcEW47pQQw_KCFFNPUGwGS0Sd5eG6W0dQTjyqQskNnjRPyr8nkREw>
X-ME-Sender: <xms:mzcEWwVDNN0EMpVjCVqwGAWhSzNBL-fHiD_b-UXJvadvAgqJZzRUFg>
Received: from localhost.localdomain (unknown [192.40.95.27])
	by mail.messagingengine.com (Postfix) with ESMTPA id 95FB410262
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2018 11:30:34 -0400 (EDT)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 May 2018 18:30:10 +0300
Message-Id: <20180522153011.18761-3-tanuk@iki.fi>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180522153011.18761-1-tanuk@iki.fi>
References: <20180522153011.18761-1-tanuk@iki.fi>
Subject: [PATCH 2/3] alsa-plugins: 1.1.5 -> 1.1.6
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
X-List-Received-Date: Tue, 22 May 2018 15:30:34 -0000

License-Update: FSF address updated

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---
 .../alsa/{alsa-plugins_1.1.5.bb => alsa-plugins_1.1.6.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-plugins_1.1.5.bb => alsa-plugins_1.1.6.bb} (94%)

diff --git a/meta/recipes-multimedia/alsa/alsa-plugins_1.1.5.bb b/meta/recipes-multimedia/alsa/alsa-plugins_1.1.6.bb
similarity index 94%
rename from meta/recipes-multimedia/alsa/alsa-plugins_1.1.5.bb
rename to meta/recipes-multimedia/alsa/alsa-plugins_1.1.6.bb
index 4bd0acc54f..17c1879f95 100644
--- a/meta/recipes-multimedia/alsa/alsa-plugins_1.1.5.bb
+++ b/meta/recipes-multimedia/alsa/alsa-plugins_1.1.6.bb
@@ -14,15 +14,15 @@ SECTION = "multimedia"
 # of LGPLv2.1 like the rest of the plugins.
 LICENSE = "LGPLv2.1 & GPLv2+"
 LIC_FILES_CHKSUM = "\
-        file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34 \
-        file://COPYING.GPL;md5=94d55d512a9ba36caa9b7df079bae19f \
+        file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
+        file://COPYING.GPL;md5=59530bdf33659b29e73d4adb9f9f6552 \
         file://m4/attributes.m4;endline=33;md5=b25958da44c02231e3641f1bccef53eb \
         file://rate/rate_samplerate.c;endline=35;md5=fd77bce85f4a338c0e8ab18430b69fae \
 "
 
 SRC_URI = "ftp://ftp.alsa-project.org/pub/plugins/${BP}.tar.bz2"
-SRC_URI[md5sum] = "f898b0e6e8acf3f6f82bc2a0f0c84a97"
-SRC_URI[sha256sum] = "797da5f8f53379fbea28817bc466de16affd2c07849e84f1af8d5e22f7bb7f1c"
+SRC_URI[md5sum] = "8387279e99feeb2ecffaac5f293223d7"
+SRC_URI[sha256sum] = "6f1d31ebe3b1fa1cc8dade60b7bed1cb2583ac998167002d350dc0a5e3e40c13"
 
 DEPENDS += "alsa-lib"
 
-- 
2.17.0


