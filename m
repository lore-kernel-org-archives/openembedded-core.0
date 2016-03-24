Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id AAF2F731CC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 21:43:05 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id l68so3088701wml.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 14:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=3FMybxdx2ncpLTCzPLovKPTfYtTOQNikksi7BuVxBos=;
	b=FssHoQIwQtILKsGkb5vyXPw8aM0LzeaXx0qKZmVPDTkY7IYFJIhNp1nSUb+dyKIKo/
	rP9E3RM5I0rOXBczkg8DoGFgz5T81Gd2qdsznI09Nk6JMYhgL/WrEYe0vCGev7nS9QEP
	qdOZ53AyCOH0/pFfJ73PPo2LoP51VPH2GqRXawIJg0g0GLCzl8KnBfh8RqQy2dlQth1W
	FPzR4Mr5qhESDf7E+grG6f9ccFxFVR0yvj6XgbRpwFVGrjieOPXNSNDgWywIDdOOqcZ7
	OCttJbIckk5882votw1qJiQnWfmT+RGZKIbPU96+QTM36mUPW0besjoXjHwj161xFnY2
	H6qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=3FMybxdx2ncpLTCzPLovKPTfYtTOQNikksi7BuVxBos=;
	b=T8idG7WeSrfHvCnsD4JH5exuT8WqY+iKhAw6t6GToE27Z3tNlm3c5p7nVEvqEJT9Nz
	BwLgu0+lv+5KBqpQNq3u1Jg87aXdKYjjdkn6bK8DEu2grW2d541s5o3USd5+FRZp6JBn
	SQhrk9UP/d5OT3vuQ/xNFox+EEEmIPRcNNpoCjxBT6A+kEVJ/rnkim5JuACeNbvuKwbO
	U9enIB6tKmYmNmoiPrHEHIm2uUlavJJnlu6//4705gjJJi6KaM1ehQZPX+2er2dT9EKy
	MSTBQtDo9zYPlPTdRzx+KeCEr3pmjemHRK90nTNZvkXtCbJxl9Y2eoIcGCh4ppzyd497
	8J9g==
X-Gm-Message-State: AD7BkJK8MtnQ2viKd94Dg8gTvhD7zL6U9U5Ihio/iDrpmM4ifTZiT1MOIaDKAEVM+54usQHO
X-Received: by 10.194.90.229 with SMTP id bz5mr12994817wjb.143.1458855785700; 
	Thu, 24 Mar 2016 14:43:05 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id d2sm9153664wjf.28.2016.03.24.14.43.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 Mar 2016 14:43:05 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Mar 2016 21:43:02 +0000
Message-Id: <1458855782-10519-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH][jethro] cdrtools: update SRC_URI
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
X-List-Received-Date: Thu, 24 Mar 2016 21:43:05 -0000

Upstream released their 3.01 so the alpha releases we were downloading have
moved.  Update the SRC_URI so it continues to download.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/cdrtools/cdrtools-native_3.01a31.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01a31.bb b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01a31.bb
index d0f36e2..50e284c 100644
--- a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01a31.bb
+++ b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01a31.bb
@@ -7,7 +7,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv2 & CDDL-1.0 & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=32f68170be424c2cd64804337726b312"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/cdrtools/alpha/cdrtools-${PV}.tar.bz2"
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/cdrtools/alpha/OLD/3.01aX/cdrtools-${PV}.tar.bz2"
 
 SRC_URI[md5sum] = "78172557894f469b4584d008e93ec469"
 SRC_URI[sha256sum] = "183b5c12777779e78d8b69461aae52401f863768e7e7391d60730006f8cadc5a"
-- 
2.7.0


