Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id B518971C14
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 11:30:46 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id b84so79547613wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 04:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=xe5lwHBVWfklvEgg29cE37F+5wPdzeMRazy3FTZz92w=;
	b=tDXVb7lYSUFCoFWfTve62l0kJv0xeF3X4iGcC7+qbNcXlkJoEAVLJ44kQe+42RSFDL
	vZJ6dmUuFq/jU68MWw8xXGxI2rGPWQpm8/xspa3ULMGHAx4L8cB9wqUZLuxUeOYGnZkd
	Og/5z6EWcX6D/yzxZ0pXMwwl/sKOb9Zv3qxWcqH60FFOQ99bKKHaiIeXKnhtAdJdDKfI
	Kc6v9zXj033GLTkBFDtVjX2DH0r3+1ORwkafmszyKnFXjWc21HMTurMev2dE/4J6yLg3
	R+vHhfJ3ecSgfKNrLA+6rMAoRbmjbrTJOT3i3mq3IPujVwH/WGxuUZ5FhZTaVcCswsjf
	Niww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=xe5lwHBVWfklvEgg29cE37F+5wPdzeMRazy3FTZz92w=;
	b=ZDMYsmr9ZSrCwjetvoFxZhh/oV2DlwEXKcHUwQOyd7csI0gRgcs3dLvt4jkr6XvI7k
	2glBRTAw//R/wR/rrQG5AoRWeOxb63IadtbycrlgGxtpynWTfD+N+7u1JNG4wz22wVrY
	DueV34cyC8xthyIw3a013qJbzzmnn94+9ZtiQsXivfyyK6zSrZK+TIYLdOA6A0KUyCTD
	dho9GFEH3FargOfiwRIQmsG6Jzk+7spC0NcAxixz8kiiIsfMRnC2sF429glfFCtsVrk3
	+Zi0FtBAIPHYoHhjftn6j7b8qum54UsAjuE8KiOl0a/UdoZUyWqqT9OcGx+G8a1YF9Bu
	Ki6g==
X-Gm-Message-State: AODbwcBrE30ntfKUv/Est/9vxfGAefn90Ko87ufAUa69gSfUqkBy+M+r
	sX90uhHN7vUMbFFuiJA=
X-Received: by 10.28.103.3 with SMTP id b3mr3272746wmc.5.1494847847303;
	Mon, 15 May 2017 04:30:47 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	e125sm14198231wmd.33.2017.05.15.04.30.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 15 May 2017 04:30:46 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 May 2017 12:30:43 +0100
Message-Id: <1494847843-25125-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] oeqa/selftest: relax whitespace matches in search regex
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
X-List-Received-Date: Mon, 15 May 2017 11:30:54 -0000

Latest DNF has changed the amount of whitespace it outputs so use matches
instead of hardcoding the exact number of spaces.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/selftest/buildoptions.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/buildoptions.py b/meta/lib/oeqa/selftest/buildoptions.py
index a6e0203..ce37ea4 100644
--- a/meta/lib/oeqa/selftest/buildoptions.py
+++ b/meta/lib/oeqa/selftest/buildoptions.py
@@ -22,12 +22,12 @@ class ImageOptionsTests(oeSelfTest):
         bitbake("core-image-minimal")
         log_data_file = os.path.join(get_bb_var("WORKDIR", "core-image-minimal"), "temp/log.do_rootfs")
         log_data_created = ftools.read_file(log_data_file)
-        incremental_created = re.search("Installing  : packagegroup-core-ssh-openssh", log_data_created)
+        incremental_created = re.search(r"Installing\s*:\s*packagegroup-core-ssh-openssh", log_data_created)
         self.remove_config('IMAGE_FEATURES += "ssh-server-openssh"')
         self.assertTrue(incremental_created, msg = "Match failed in:\n%s" % log_data_created)
         bitbake("core-image-minimal")
         log_data_removed = ftools.read_file(log_data_file)
-        incremental_removed = re.search("Erasing     : packagegroup-core-ssh-openssh", log_data_removed)
+        incremental_removed = re.search(r"Erasing\s*:\s*packagegroup-core-ssh-openssh", log_data_removed)
         self.assertTrue(incremental_removed, msg = "Match failed in:\n%s" % log_data_removed)
 
     @testcase(286)
-- 
2.8.1


