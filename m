Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id 6A6816B5E0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jun 2014 15:48:06 +0000 (UTC)
Received: by mail-we0-f175.google.com with SMTP id p10so3084036wes.34
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jun 2014 08:48:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ePrMDsk4uSNyqW2jCQXx+Lk0hhow937n+ebBL48a5nU=;
	b=kcZ7beUj6mXgTVqofO5lo41x1vegb1A+9Y3i5PNeRzF+/AhNKdvX3vvlx0Ps2SvTmf
	jznlOTPichyZ5wCCC769OXz5b2a5tnnIvSJvajEeQuHAQ39JpmnIf3MqshGT9xKEoGG0
	1B5dcH8CNWN2gVsdBMO0di+cZlRe2b/FiYB0wJVPYA5oFpp4Zjb76PZwlIkJa1so4T1p
	biVU8YpSxZ0o0dD+JaqcwEZvmcWwpE0CJl7SRxyKBRsq8OeOPouPZhz8flXsqaE7Vrd1
	+UdTb9L06M8tUyGrM56YMFVlicqudAqTWn4GpOXv848OfCBDL0qfir708kOU5UVHCb4+
	2q9A==
X-Gm-Message-State: ALoCoQmxcWjho081+JHg55yd82cVC99TY6UvBrTQ8bGNT+avzfLunZx1V7jA+wOMSD/Fxxy9tFlx
X-Received: by 10.194.71.107 with SMTP id t11mr8306055wju.44.1402069686682;
	Fri, 06 Jun 2014 08:48:06 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	kp5sm12790897wjb.30.2014.06.06.08.48.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Jun 2014 08:48:06 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Jun 2014 16:48:00 +0100
Message-Id: <1402069681-17929-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/2] gawk: fix module paths
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
X-List-Received-Date: Fri, 06 Jun 2014 15:48:18 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/gawk/gawk_4.1.1.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/gawk/gawk_4.1.1.bb b/meta/recipes-extended/gawk/gawk_4.1.1.bb
index 69a2bcc..b990ce9 100644
--- a/meta/recipes-extended/gawk/gawk_4.1.1.bb
+++ b/meta/recipes-extended/gawk/gawk_4.1.1.bb
@@ -28,9 +28,9 @@ inherit autotools gettext texinfo update-alternatives
 PACKAGES += "gawk-common pgawk dgawk"
 
 FILES_${PN} = "${bindir}/gawk* ${bindir}/igawk"
-FILES_gawk-common += "${datadir}/awk/* ${libexecdir}/awk/* ${libexecdir}/*.so"
+FILES_gawk-common += "${datadir}/awk/* ${libexecdir}/awk/* ${libdir}/${BPN}/*.so"
 FILES_pgawk = "${bindir}/pgawk*"
-FILES_${PN}-dev += "${libexecdir}/*.la"
+FILES_${PN}-dev += "${libdir}/${BPN}/*.la"
 FILES_${PN}-dbg += "${libexecdir}/awk/.debug"
 FILES_dgawk = "${bindir}/dgawk*"
 
-- 
1.7.10.4


