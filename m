Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
	[209.85.210.176])
	by mail.openembedded.org (Postfix) with ESMTP id 74C477CE79
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Mar 2019 14:37:27 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id s22so14304063pfh.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Mar 2019 06:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=7Bt9l77DrV8U6AmswKK1KNzTxYszkFZuL6tcyfde1rs=;
	b=DvbacLozB8ctoeaXWNGkfRZPtVr3Mu/xLH/Qfs4VN7R/sPYqxpecsUD+smSPXcOQH7
	5V0RLlu2BqPEnOnnozf0kBlBeQuPYefN5hRnazKgyc3jCM1pYY7AAsMPxZYM+PJvNtfn
	lhWxEyOrsEdTkciXs72oTpIxBbIPjpSA9T4djg17DNC/8xp/CX7SBSV6fAAzpU3Norrs
	FKqEIURffDxaEFO0pJyFy6Ib2E4kHC5o4WGktnWXkciWluge3T6eiNoMipLfD1VAC2rS
	RWBv22cOBDTBhHIAdyYQ7bs4vOWF1lCM7TAEgyFIPxJLwCHzGnGyp9W6rwafpLcWZ2No
	bPLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=7Bt9l77DrV8U6AmswKK1KNzTxYszkFZuL6tcyfde1rs=;
	b=WAEJu7lRFZXefGBqlJOFyvea0wvQrRKmkrMqMXJFwYjT6nu79IfeB6KhYcKi5IxvNV
	tGgShJNSPw1u0A9q44ILkFn4lDP4wwLDcGNv7nWJ4ziXPOw+3L0K6HRbEMmtYj+uZPZN
	RlvWJyeYdkY0RKknbymGnaGKiDngO0VEtoF5UfMVh7nwQ66evgWI4aRXZybBCl19zHeQ
	9gvbyPvOCnFmJnOChG6XgvRKNbP0eTqtfJpmMppwucfrVV8dsHqA+A1GNO5eFFEZiTEn
	cBjIyWvHd7PoAQ3RLhX71PAm89hZurE+XXBgLVmBktKonqUY26m4yxc2Sk57VoFS8qQf
	UZZg==
X-Gm-Message-State: APjAAAWrjOwG2hJlvnnn+5zGejDhFxBbBtBJ069je0Z5xzkUR4xQKlqa
	pgOil0juv6qc0AhqierdNcu49+Hv
X-Google-Smtp-Source: APXvYqytnlDl/6Zra/pVJ00A7QPsBuNQzGCce/7ujCyqRBtw/hBfy4L0FyxNy9I41ivEGecBmEJFMw==
X-Received: by 2002:a62:4815:: with SMTP id v21mr18414259pfa.167.1552055848227;
	Fri, 08 Mar 2019 06:37:28 -0800 (PST)
Received: from pahoa2.kama-aina.net (c-67-181-203-136.hsd1.ca.comcast.net.
	[67.181.203.136]) by smtp.gmail.com with ESMTPSA id
	j14sm12649777pfn.77.2019.03.08.06.37.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Mar 2019 06:37:27 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Mar 2019 06:37:26 -0800
Message-Id: <20190308143726.5252-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] python: time.tzset missing
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
X-List-Received-Date: Fri, 08 Mar 2019 14:37:27 -0000

import time
time.tzset()
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
AttributeError: module 'time' has no attribute 'tzset'

enable tzset in both python versions

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/python/python3_3.7.2.bb | 1 +
 meta/recipes-devtools/python/python_2.7.15.bb | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3_3.7.2.bb b/meta/recipes-devtools/python/python3_3.7.2.bb
index 9626ee546b..4d10986f3b 100644
--- a/meta/recipes-devtools/python/python3_3.7.2.bb
+++ b/meta/recipes-devtools/python/python3_3.7.2.bb
@@ -65,6 +65,7 @@ EXTRANATIVEPATH += "python3-native"
 CACHED_CONFIGUREVARS = " \
                 ac_cv_file__dev_ptmx=yes \
                 ac_cv_file__dev_ptc=no \
+                ac_cv_working_tzset=yes \
 "
 
 PACKAGECONFIG_class-target ??= "readline ${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'pgo', '', d)}"
diff --git a/meta/recipes-devtools/python/python_2.7.15.bb b/meta/recipes-devtools/python/python_2.7.15.bb
index 8df1dfd1ba..3e1af4baf6 100644
--- a/meta/recipes-devtools/python/python_2.7.15.bb
+++ b/meta/recipes-devtools/python/python_2.7.15.bb
@@ -42,7 +42,7 @@ inherit autotools multilib_header python-dir pythonnative ptest
 
 CONFIGUREOPTS += " --with-system-ffi "
 
-EXTRA_OECONF += "ac_cv_file__dev_ptmx=yes ac_cv_file__dev_ptc=no"
+EXTRA_OECONF += "ac_cv_file__dev_ptmx=yes ac_cv_file__dev_ptc=no ac_cv_working_tzset=yes"
 
 PACKAGECONFIG ??= "bdb"
 PACKAGECONFIG[bdb] = ",,db"
-- 
2.17.1


