Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 33F047D717
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 15:11:19 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id x127so8845183pfb.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2019 08:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=KIypmHm8Z54QEM2fpfii5FzVMtjCWIOvJGaoicL6sH4=;
	b=K8qMHjUc7uVQm2C3Ai+9STghYMrj0ZQIpLFYaNid9Ar7j7Fa8WKDsVpP17FDaY228M
	vnucmTragi9QftiB1+xTR8hSazC4iTImS2XvwhDR44Vx/BwzhmRNZCt39IKellOJ9oXa
	SIZ/2W+DHp+9gBpihpoboEvGvZOLhrUEw16FmlHqlDFvHb4GRiWLZ+jTYtvqe/BUD6Xq
	fD2YRBsqU6CrO4sXkkjWXd039nv1GstIBca3t0mXTVF0YfYBF9KAgJm0SWEe0HH55MuJ
	3IHkErRKpou9ZGdifh74GY0fMlwc0Phr4bpNmOSea0jmJfCtxOSEjA/DUDV6YZ/+UJdA
	xiuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=KIypmHm8Z54QEM2fpfii5FzVMtjCWIOvJGaoicL6sH4=;
	b=T03JnxC/GbQreqoQuEO6FMZR454sSkLzfwt5cwfLfKA+GW5jHQZiTQEZotXCGdaz8X
	3X2DK8Mf1ahZcSuc/QIeaJ6nVnZWgdRBvbeffGfqSEjDriSSBIZ5HRirfOe8cd4VwQ8B
	1dvEHmuCYE+YEppl7F8znrhg77WvZVcBw4O0NRIXubnwdb959FRCR8AsZoVoduorZSq+
	oG1dNdtWJPsUE72Pyp1qS2YOqWdOOQyDAW9DhvefVNtg8vAk2tvAfTt/tLz+tNUbpnrm
	FHXA4em2uee20yq1XQg3mzb9cjzeTvOmndDEMYvq6CIFvWl6XdHmhkXLEjDW+5epbZHN
	2S2Q==
X-Gm-Message-State: APjAAAUHj8f1m61vFjJKNuvqxcxYP1EM7/08nutlgRjKDF90asAcENhq
	tYcbw7ZwnBJJh2gYGJbaSRKEQvPRn68=
X-Google-Smtp-Source: APXvYqxqMu2gKPThgZno2CjkGAK9DSQ78+ZXJrPlOykGr+mqTCYd43VdC+48ShmxOfztL3RVZDutWA==
X-Received: by 2002:a17:90a:e38f:: with SMTP id
	b15mr33240124pjz.140.1570461080086; 
	Mon, 07 Oct 2019 08:11:20 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:65e8:7322:d189:1d85])
	by smtp.gmail.com with ESMTPSA id
	m102sm12786928pje.5.2019.10.07.08.11.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 07 Oct 2019 08:11:19 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Oct 2019 08:10:50 -0700
Message-Id: <b24447b40e4988e337bdd4b5cf194df0827f9887.1570460789.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1570460789.git.akuster808@gmail.com>
References: <cover.1570460789.git.akuster808@gmail.com>
Subject: [thud 13/26] bind: upgrade 9.11.5 -> 9.11.5-P4
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
X-List-Received-Date: Mon, 07 Oct 2019 15:11:19 -0000

From: Adrian Bunk <bunk@stusta.de>

Source: OE.org
MR: 99751, 99752, 99753
Type: Security Fix
Disposition: Backport from https://git.openembedded.org/openembedded-core/commit/meta/recipes-connectivity/bind?h=warrior&id=5d286da0fbe1a7ded2f84eec990e49d221bdeab4
ChangeID: ce3719ea11bd03af3baeca51a22115badf84be01
Description:

Bugfix-only compared to 9.11.5, mostly CVE fixes.

COPYRIGHT checksum changed due to 2018 -> 2019.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
[Included cves:
CVE-2018-5744
CVE-2018-5745
CVE-2019-6465
]
Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../recipes-connectivity/bind/{bind_9.11.5.bb => bind_9.11.5-P4.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.11.5.bb => bind_9.11.5-P4.bb} (96%)

diff --git a/meta/recipes-connectivity/bind/bind_9.11.5.bb b/meta/recipes-connectivity/bind/bind_9.11.5-P4.bb
similarity index 96%
rename from meta/recipes-connectivity/bind/bind_9.11.5.bb
rename to meta/recipes-connectivity/bind/bind_9.11.5-P4.bb
index 21e979f..432bad0 100644
--- a/meta/recipes-connectivity/bind/bind_9.11.5.bb
+++ b/meta/recipes-connectivity/bind/bind_9.11.5-P4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.isc.org/sw/bind/"
 SECTION = "console/network"
 
 LICENSE = "ISC & BSD"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=6ba7c9fe0c888a943c79c93e6de744fb"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=8f17f64e47e83b60cd920a1e4b54419e"
 
 DEPENDS = "openssl libcap zlib"
 
@@ -22,8 +22,8 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://0001-avoid-start-failure-with-bind-user.patch \
 "
 
-SRC_URI[md5sum] = "17a0d02102117c9a221e857cf2cc8157"
-SRC_URI[sha256sum] = "a4cae11dad954bdd4eb592178f875bfec09fcc7e29fe0f6b7a4e5b5c6bc61322"
+SRC_URI[md5sum] = "8ddab4b61fa4516fe404679c74e37960"
+SRC_URI[sha256sum] = "7e8c08192bcbaeb6e9f2391a70e67583b027b90e8c4bc1605da6eb126edde434"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>9(\.\d+)+(-P\d+)*)/"
-- 
2.7.4


