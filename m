Return-Path: <danismostlikely@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id A35F9770D8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2016 15:38:29 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id ez1so1645577pab.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2016 08:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=Bq3IC7/ZLgAPNpV0hxURppnLQrvCpNCDqKCPcyBkaWQ=;
	b=NUeLJ5LkBxejITN2otmmuzFr0SBkbMzMQ8jdVnWloE9vncJObXTOj04dNvrwbg8PPz
	fh3PZH4KOIqFn9GFYRvwiUfsZS2O57/Z6AD3Yy2pQ/0LiFNE/zB4RiESAamrheFYC8ss
	Od3SzSt/LU431dyIpx3cXZCQtxjI7vv+HU3zF/6Tf6/KgCA1/RGPHdsQG1mIOl0V5D4i
	ysd3QR0BgzcQ+JGTnlzeTyht14/u0WGO+8aRtH39gE2vezB/LP2brzqr9piwhHAcAwvP
	aQTkEFj6z9E0lr2rdLI+y6kUdFXFOA5T5VYiuliynmM2YyRn130LJz3USRaKAWDhOI5w
	5IMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Bq3IC7/ZLgAPNpV0hxURppnLQrvCpNCDqKCPcyBkaWQ=;
	b=NK91QouDES4TX1DTkgZ4BkRCX5zwHIxZw7YKgf1m3PmfuUaE+PJz5vipBVLGY/baY0
	r6+yGIMi7BKNtNpSvHQhBsUhYR5F4CEfZHI4G7lifkpkiG4jVF6Q5rvESqJJY7HBUom0
	8cEdDcIytZomld6YPUo79oEVVQYwDZ4KUXczZRXx2wO3NoweXkpzewv+XPAb/FLCfQlv
	XqUGSBHfM2tMXT2t5G0dDf5sR2Anh/46hz6gS0why8wtyDVhhfdruWdXboGCzY09/tJv
	VmwC6eZFgBr1BLX2O2R8JFb0j+HSMawQVKBP3lpiAzJJPCQGSzWGhZlx5Le0xSEknUkr
	fdfw==
X-Gm-Message-State: AEkooutjADgYUle5ZJkqFpT48SXr9YGwp4ZsBDVtn2CL20LH4IC4/d/054YCkKwopCl3TA==
X-Received: by 10.66.161.132 with SMTP id xs4mr27984964pab.140.1471016309362; 
	Fri, 12 Aug 2016 08:38:29 -0700 (PDT)
Received: from mediabox.local (71-17-245-40.sktn.hsdb.sasknet.sk.ca.
	[71.17.245.40]) by smtp.gmail.com with ESMTPSA id
	x184sm13971082pfd.70.2016.08.12.08.38.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 Aug 2016 08:38:28 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Aug 2016 09:38:25 -0600
Message-Id: <20160812153825.17209-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.9.2.124.g00f27fe
Subject: [PATCH] systemd: use common-session
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
X-List-Received-Date: Fri, 12 Aug 2016 15:38:29 -0000

From: Daniel McGregor <daniel.mcgregor@vecima.com>

During the upgrade to v230 the systemd user session pam configuration
file was changed to include the common-account configuration for sessions.
That broke user sessions. Revert it to common-session.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
---
 .../systemd/systemd/0015-systemd-user-avoid-using-system-auth.patch     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd/0015-systemd-user-avoid-using-system-auth.patch b/meta/recipes-core/systemd/systemd/0015-systemd-user-avoid-using-system-auth.patch
index f7a5b19..6e6f344 100644
--- a/meta/recipes-core/systemd/systemd/0015-systemd-user-avoid-using-system-auth.patch
+++ b/meta/recipes-core/systemd/systemd/0015-systemd-user-avoid-using-system-auth.patch
@@ -29,7 +29,7 @@ index f188a8e..862d8d7 100644
  )m4_dnl
  session  required pam_loginuid.so
 -session  include system-auth
-+session  include common-account
++session  include common-session
 -- 
 2.8.3
 
-- 
2.9.2.124.g00f27fe


