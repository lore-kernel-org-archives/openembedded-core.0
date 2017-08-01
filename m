Return-Path: <drew.moseley@northern.tech>
Received: from mail-yw0-f173.google.com (mail-yw0-f173.google.com
	[209.85.161.173])
	by mail.openembedded.org (Postfix) with ESMTP id 9F78778376
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Aug 2017 12:07:46 +0000 (UTC)
Received: by mail-yw0-f173.google.com with SMTP id u207so8387399ywc.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Aug 2017 05:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=northern.tech; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=1Kq4OY1d6G6eAyyIAd+M9dlNpxthzl0IM7WoDCYDrOk=;
	b=brAMzKRL+TqQbStZWpUULVjVvQc7I8Oeh9QShSoW+ezOuaHwvULUCbojgoV7oSml7c
	gCKzOFjYh3ZPrafSuonwmqpW/awaUzWqjP5lCDNzxJa+eZ7gDq5e0SfGXKMfn+gs22x/
	9EcXnC0GkkSIQ2mKeLdrp7TWy9XJV1JErstMhlkGgAFqnrQzpPig8tew/bNEHlsWAqFk
	YIAabEe8jlzKIGCXgGDtjm6rez1zu93J5eUGt/6jsX+jultxDUi+D1v6WeVkKWwI9gS5
	2X9DkPuQnU0cz8z2vUaAuYAiNInLLwXnZNhYxzuTCDk/o+es76PXtIl2HWB1SirORtmC
	XvfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1Kq4OY1d6G6eAyyIAd+M9dlNpxthzl0IM7WoDCYDrOk=;
	b=tfBKRHTyI0ASg1SfKS0EKyOyI+SgV/vGlGU5ZfxddZcoByzTIB+EdmxCsiVsCVSXpn
	IMRh8OWIaqsQomAGxrivQLEihlYksjs29hZxbeMU69FMTM4btlF8UaAVJ4tByy0UczHb
	CmRb18oFktJHpl+TJ0Sc0XIyOwCeqXXJ5sRAEP2mlmc+uMO0LFMYi6k6b+qj8XLjecS6
	tOvQl8JVIbwyEryyRo1bbUjDU6t75amc6Z6cru1ThaNz+6q91APO/gOgJyhAc8dV4eKO
	EF/uitnV84XARPPZl+3QPPTaEOut8Mj9N+ZwmS1XSbV4mr+L66F0ammQS6GK1GeYWb4P
	ZvYA==
X-Gm-Message-State: AIVw111Gnu/kTKgGNZv1qdaOmtgof9A7+RJgoc02z2XwT7l0ixNDBX5V
	/XSx24cDG6YdLkQTNwXobQ==
X-Received: by 10.37.77.130 with SMTP id a124mr16871967ybb.131.1501589267236; 
	Tue, 01 Aug 2017 05:07:47 -0700 (PDT)
Received: from tobago.home.moseleynet.net (653240hfc152.tampabay.res.rr.com.
	[65.32.40.152]) by smtp.googlemail.com with ESMTPSA id
	o81sm7061315ywb.77.2017.08.01.05.07.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Aug 2017 05:07:46 -0700 (PDT)
From: drew.moseley@northern.tech
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Aug 2017 08:07:46 -0400
Message-Id: <1501589266-8236-1-git-send-email-drew.moseley@northern.tech>
X-Mailer: git-send-email 2.7.4
Cc: trini@konsulko.com
Subject: [PATCH V2] local.conf.sample.extended: remove references to image_types_uboot
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
X-List-Received-Date: Tue, 01 Aug 2017 12:07:46 -0000

From: Drew Moseley <drew.moseley@northern.tech>

This class was removed with commit:
    OE-Core rev: 65f27122950a35a67ce39ae4cfe93d0dca6b0dab

Signed-off-by: Drew Moseley <drew.moseley@northern.tech>
---
 meta-poky/conf/local.conf.sample.extended | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-poky/conf/local.conf.sample.extended b/meta-poky/conf/local.conf.sample.extended
index 0560de8..331fdd1 100644
--- a/meta-poky/conf/local.conf.sample.extended
+++ b/meta-poky/conf/local.conf.sample.extended
@@ -168,9 +168,6 @@
 
 # Additional image generation features
 #
-# The following is a list of classes to import to use in the generation of images
-# currently an example class is image_types_uboot
-# IMAGE_CLASSES = " image_types_uboot"
 
 # The following options will build a companion 'debug filesystem' in addition
 # to the normal deployable filesystem.  This companion system allows a
-- 
2.7.4


