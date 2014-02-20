Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lb0-f175.google.com (mail-lb0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id C11406EE90
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2014 07:59:30 +0000 (UTC)
Received: by mail-lb0-f175.google.com with SMTP id p9so1062203lbv.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2014 23:59:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=f7DswmvtHLbwrOB7pCA6ES+HnYIg5WAYPSMJhbOrj7k=;
	b=CcIcPFKFByXNHbPPQrbjkWsUWT5yZEJ2706CP5CuYeyOnJfYM2pOFZ2r89RoqjVwn0
	kD5ByNOdG1wo0JpIDA+XVVEomFIdRNsZuPmP9n5I3zPHTKZhhClHlIG8+sd++TOEI0Ut
	Cv/PMe0Mt+wG/DtxEf6kBjGlkjpzC1kviN4KJadbKwhdyigUsye61B1jNbUs0j4WXOEp
	OElsgoN5r3FyzmTyUweoTfnto7o9YExKX7zfIM+GTVouerd9OHxuSE+sDwX41FW6cJ04
	hCv3FGhVP8bVOldW01s8841AnWjGm1P77LmB5ua6TMnCJNUkCQ7XLS5a551tVTjGgUCE
	c5xw==
X-Gm-Message-State: ALoCoQm2Z223w4iZBDC9CbduxeUSjFDYwrpE5Rqx8tJNgMrb5YxZffGrah3ejH4iB57ZEMwkizHc
X-Received: by 10.112.142.161 with SMTP id rx1mr232214lbb.33.1392883170673;
	Wed, 19 Feb 2014 23:59:30 -0800 (PST)
Received: from localhost.localdomain (a91-152-78-194.elisa-laajakaista.fi.
	[91.152.78.194])
	by mx.google.com with ESMTPSA id bl3sm3066771lbd.7.2014.02.19.23.59.29
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 19 Feb 2014 23:59:29 -0800 (PST)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Feb 2014 09:59:21 +0200
Message-Id: <1392883161-12070-1-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH 1/1] git: update to 1.9.0 release
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
X-List-Received-Date: Thu, 20 Feb 2014 07:59:31 -0000

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 meta/recipes-devtools/git/{git_1.8.5.2.bb => git_1.9.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/git/{git_1.8.5.2.bb => git_1.9.0.bb} (67%)

diff --git a/meta/recipes-devtools/git/git_1.8.5.2.bb b/meta/recipes-devtools/git/git_1.9.0.bb
similarity index 67%
rename from meta/recipes-devtools/git/git_1.8.5.2.bb
rename to meta/recipes-devtools/git/git_1.9.0.bb
index 4777c46..4eb6c99 100644
--- a/meta/recipes-devtools/git/git_1.8.5.2.bb
+++ b/meta/recipes-devtools/git/git_1.9.0.bb
@@ -2,8 +2,8 @@ require git.inc
 
 SRC_URI = "http://git-core.googlecode.com/files/git-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "df8519044f9880f3687d863d99245282"
-SRC_URI[sha256sum] = "024694524b8be91fe29afca65bc3a9e40de1322dd5ef2b2c0babb6849c913e8a"
+SRC_URI[md5sum] = "e16c14b27c644b8e0dd72bdb5ff77450"
+SRC_URI[sha256sum] = "de3097fdc36d624ea6cf4bb853402fde781acdb860f12152c5eb879777389882"
 
 EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no ac_cv_c_c99_format=yes \
                  ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
-- 
1.8.1.2


