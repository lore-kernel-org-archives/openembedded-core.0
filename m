Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id E7CCD6B88A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:23:06 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id d41so180918eek.22
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=KSvVEK6YgoAc/Q8dc0yAIB9YJ+UiGyCtEpMqnLNRo0o=;
	b=zicAmoh7JJH4ACdFHwhM3DdeK4+1csXyQeunCEgwNDWDrql3R14iVKpradFl7dWeXc
	lq+vBlsmHoj5N97nx4dR5qJJRgdBOjzYKSVYdb6mrBdsiNYiBEIe2HW8wB5MnY3/mmcP
	97QZozKXQCAvPM9qN3QcTZTg2v6DpuWy4/nRYv1M/x1mqA/VocFU91fx6SULGrP7ZMbG
	eCWEMNZ2Vwne3RHzU38FWS7aygRVdJd6ExDQatUuutQUXyCwd3yR5g0XzsuJZalIVk1k
	IpcVn5/CC34UGzAhC/6T26nSv9dvzBw9Ikw7CY0pWqxk5reb3LieKGV7uVBvDoOKGHmE
	kXPw==
X-Received: by 10.14.38.196 with SMTP id a44mr249712eeb.78.1376551387401;
	Thu, 15 Aug 2013 00:23:07 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	d8sm68770794eeh.8.2013.08.15.00.23.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:23:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:23:22 +0200
Message-Id: <6e006b3219dac1e3c7feea16071d9739cd9e5f3b.1376551402.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551401.git.Martin.Jansa@gmail.com>
References: <cover.1376551401.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551401.git.Martin.Jansa@gmail.com>
References: <cover.1376551401.git.Martin.Jansa@gmail.com>
Subject: [for-dylan][PATCH 11/33] bdwgc-native: Add missing pkgconfig DEPENDS
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
X-List-Received-Date: Thu, 15 Aug 2013 07:23:07 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This fixes configure errors like:

| configure.ac:70: error: possibly undefined macro: AC_MSG_ERROR
|       If this token and others are legitimate, please use m4_pattern_allow.
|       See the Autoconf documentation.
| configure.ac:358: error: possibly undefined macro: AS_IF

Reproduced with bitbake bdwgc-native pkgconfig-native -c clean; bitbake bdwgc-native

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/bdwgc/bdwgc_7.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/bdwgc/bdwgc_7.2.bb b/meta/recipes-support/bdwgc/bdwgc_7.2.bb
index a0a5bff..f7914e4 100644
--- a/meta/recipes-support/bdwgc/bdwgc_7.2.bb
+++ b/meta/recipes-support/bdwgc/bdwgc_7.2.bb
@@ -37,5 +37,5 @@ S = "${WORKDIR}/gc-${PV}"
 
 ARM_INSTRUCTION_SET = "arm"
 
-inherit autotools
+inherit autotools pkgconfig
 BBCLASSEXTEND = "native nativesdk"
-- 
1.8.3.2


