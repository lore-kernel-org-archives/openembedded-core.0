Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
	[209.85.216.43])
	by mail.openembedded.org (Postfix) with ESMTP id 02BA77F89A
	for <openembedded-core@openembedded.org>;
	Thu, 16 Jan 2020 15:20:53 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id l35so1735964pje.3
	for <openembedded-core@openembedded.org>;
	Thu, 16 Jan 2020 07:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=OO2TFFWR/ZqoPXo9A+xgYdodvCCMeeC2tjf54f9yPRs=;
	b=jEtp06hcPCBEtnFVAJ813BxI9l/post8rLGU9P9JEm3W6islnr6loatrbHsXDbyPcd
	04zFsSIttQQf9GLqgiCp/uD4lf3EUH6/7QWSPpmbtZasJepss1T5Xk2YE1uVCVuEKlxM
	lLYAneJ/wCcqSVLKmyFXFomo5CLnrpT3rt5ARKCQ8IawDjOQTlFFUrOudbUjzet46DJ2
	KvHLyTtZFadEUS7lQWVDSuflQ3AiW6XfKzIzP2J+WwT/l0U1xCcd8cruGXeCNQZrZ0MM
	PSsBTV2P5TsSFIkECWR32w15qejoxUF5Ncw7xkf3BB5q+nS8KkAWAc8W3gaetPox72oK
	mJcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=OO2TFFWR/ZqoPXo9A+xgYdodvCCMeeC2tjf54f9yPRs=;
	b=InzbUDeEdZQNuRohm3FBFc3tGYYxPw1qSAPq3vZ4ZrNMAfl+s7mbsNd5lVAC471iuT
	qH+zDIMxxtSunHGB3sc/PwcMUbSLngt3tZbn0wWpO9eA/X7w1ynZNlYYg7YjfAur7L+6
	5QDpwfo2tBJVh5F9X3rAPJzCmw/ZwxsILT9N1JqC/BZ43NTzy+/ghpc5eKTxNH0ooORs
	gLgaF81RGq6Lma6cvr7jZYOdhdlsSBIqi3u1ZgQIFTAeK/EeAAgp/P5rkidalC8EdSVB
	iZ09irfj0Xga6MUR5jiTrd5054ox3XSl2qtOFGcIwsd+1ucGq5ImFGyEB3/SGJOIvUue
	Pksg==
X-Gm-Message-State: APjAAAVDVxZwDYAB+W9qHZCCk35w1/4LdqAW2RstW8AbcCm5E4c/kn8N
	zfHje9dsvIu4+qSAOJcrh6cQJ/rd
X-Google-Smtp-Source: APXvYqznbfBnZ6YVnqicaffggLbUyvk3iVLklW0cpU2I3JAda+Jg1OP8wFuqzcCvcWRg8eQDGAyEHw==
X-Received: by 2002:a17:902:6ac2:: with SMTP id
	i2mr32369129plt.221.1579188054925; 
	Thu, 16 Jan 2020 07:20:54 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e8a7:159f:54e9:3f07])
	by smtp.gmail.com with ESMTPSA id
	n26sm26282377pgd.46.2020.01.16.07.20.54
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 16 Jan 2020 07:20:54 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Thu, 16 Jan 2020 07:20:19 -0800
Message-Id: <e8ffa02f3efcf5303b8cf57eb29e498e816e63c0.1579187957.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579187957.git.akuster808@gmail.com>
References: <cover.1579187957.git.akuster808@gmail.com>
Subject: [warrior 10/32] boost: set CVE vendor to Boost
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
X-List-Received-Date: Thu, 16 Jan 2020 15:20:54 -0000

From: Ross Burton <ross.burton@intel.com>

There's a Boost module for Drupal.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-support/boost/boost.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index c2e2cbb352..f385541653 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -2,6 +2,8 @@ SUMMARY = "Free peer-reviewed portable C++ source libraries"
 SECTION = "libs"
 DEPENDS = "bjam-native zlib bzip2"
 
+CVE_PRODUCT = "boost:boost"
+
 ARM_INSTRUCTION_SET_armv4 = "arm"
 ARM_INSTRUCTION_SET_armv5 = "arm"
 
-- 
2.17.1


