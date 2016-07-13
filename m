Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id F00496067C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 12:45:55 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id f65so27370294wmi.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 05:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=95xHRhkx2zfVpKsyHrPVhNvxp4r16/mBBOchBsDnEvg=;
	b=DoKk7RT7V0XPeIK0rZ7ns42/5bM8t4YiO964AMB9LfkUPHnJraPa4+eMQfvGQ6SC+Q
	AE8jK55eWBTnkZaObVsZgriQDr3Z8vDii1f6IsTbR9k7mm7X8Ua0I7IzD5CbmHiOLoLX
	WrABkKEcL54eAwf58PtrrvR1gD22ChIKhnyTWwzB1Xp9475GzKz/QmaFWfYIpu090H/T
	f58N/rqI3JuvoEAyKu+JzCWZsiE6DCxEeuQVaurS5eII4AfpGCwUtoZ9rfs0qbbeLRVp
	y/vDGO3xvUJCeLcQZ9tbUH5/Obr+DAx/Wrg10fO+d9pVKzSFu2aFOG/L5FwVD+4HDruX
	y/Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=95xHRhkx2zfVpKsyHrPVhNvxp4r16/mBBOchBsDnEvg=;
	b=Z0ph2ag5MEzegzQz0clg4ogupQxZNjjH07/60wlzsCOdckBha+nX/zxT/ikEIX6UUx
	BVvy3F+XcKfw7gfBFHgh59bpLQfrcQtQKgBx7Yh2ydBNyVkoyYlvJIx3LtzJV0O0+xWP
	mhRpEb8hFNhb/PlQY6T8vp/3/s9bSa1duGARmP3jtPpeveefWr4JHGlZkpl6sNFW8pMY
	t29emGt8AopxhAVnXV7U+YtQcVyJkvJRFbwjQ8oi+z1e60FQ7yEiTelvbvHVO2DmINtR
	p7J67tYQYDdEFAxOLal7JiN0nJQRT7eJXyYLFLAGhuTCv11sqJamKliPztZ1UDf086Vn
	Mx5g==
X-Gm-Message-State: ALyK8tIuP/5iYEESUq0B9Rja01Dezf0FgQKMwpfff+9Au9X8jQ7I2LRR3cfBw860InBxQhdR
X-Received: by 10.28.69.210 with SMTP id l79mr9736886wmi.31.1468413955359;
	Wed, 13 Jul 2016 05:45:55 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id o7sm750229wjw.27.2016.07.13.05.45.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Jul 2016 05:45:54 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jul 2016 13:45:52 +0100
Message-Id: <1468413952-16084-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] bitbake.conf: use ${prefix} to define exec_prefix
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
X-List-Received-Date: Wed, 13 Jul 2016 12:45:57 -0000

This was simply changing prefix will relocate everything which is generally the
intention, whilst still allowing the variables to be set independently.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 613fc4c..af3b181 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -15,7 +15,7 @@ BASELIB_powerpc64 = "lib64"
 # Path prefixes
 export base_prefix = ""
 export prefix = "/usr"
-export exec_prefix = "/usr"
+export exec_prefix = "${prefix}"
 
 # Base paths
 export base_bindir = "${base_prefix}/bin"
-- 
2.8.1


