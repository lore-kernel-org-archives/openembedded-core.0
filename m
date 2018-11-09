Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id B58CC6C21C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Nov 2018 14:29:25 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id 124-v6so2235938wmw.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Nov 2018 06:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=WQXp5i0+abntsoD4z36kqfurlmPQU+uQ05e2yFu84Eg=;
	b=OnGw9DjPanGCkKBYHd/e8g2qD8gbXGMgxxoSQh7qT+UXUY6yaqF7+8NZgrANt2Hx2d
	JsjBBO37SvLy2n0vJkYbcCaZwf7Fv3WUDrNZ1/ag3WLec/39YvRNsl6LIb4Bh2AE2sT+
	92m+TEWTevjgqC73VuPtzQH0Vc/yguUQOOJAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=WQXp5i0+abntsoD4z36kqfurlmPQU+uQ05e2yFu84Eg=;
	b=U8z2gldGrjeBn0NWBdE3aw3iEsoWbvB/PN3j7HffcDncTCu8mRSJee5oKE4WvFjrdb
	Q9/qvBAPhWpmDR1MsE14PoSVOEMFfck8KLZXsyNStPa//YZi0aWn3LCrvfdn0dxNkRc2
	YLKfMON8FfQb9kKCXUs+pzaFSrocR+vk4c24e34BUU2NKMVIgoCRp+AQ0b0rRoKajjHA
	HEiqFRTp/l3ImWwV40TDHxuCMJvOQMOuDmB9rqSGyNjXurRba7Nc+UmaRhOnqiDx+Fq6
	qyofJ027mWGxoZgGOgHLaph2JE6y5T1fNX+syUAVPMZO/ZQbD6xuq+e0RlIkens3Fwa+
	J0tA==
X-Gm-Message-State: AGRZ1gJ4MiFRU9MlUSdj7T+ti1T5UJMNf8mHSyXWvDn0OWrXc5T+Sq/H
	RiHlnnGAMksGnrPr8xl3SFDC+EmgnxI=
X-Google-Smtp-Source: AJdET5cwFCg+M/8Ke/BU6TSu4P8b1izpR6IdeR3V3pNmEVeZgDP78onLNMfFOGr+RkQL84MZsIV1bw==
X-Received: by 2002:a1c:a641:: with SMTP id
	p62-v6mr5106087wme.40.1541773765958; 
	Fri, 09 Nov 2018 06:29:25 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	h16-v6sm7713764wrb.73.2018.11.09.06.29.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Nov 2018 06:29:25 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Nov 2018 14:29:11 +0000
Message-Id: <20181109142912.23102-11-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181109142912.23102-1-richard.purdie@linuxfoundation.org>
References: <20181109142912.23102-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 11/12] testimage: Further cleanup DEFAULT_TEST_SUITES
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
X-List-Received-Date: Fri, 09 Nov 2018 14:29:26 -0000

Now the test markup of the development tools tests is complete, this
can be further tweaked to auto run the correct tests.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/testimage.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index b00d47441b2..4e9494296e1 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -40,12 +40,12 @@ TEST_NEEDED_PACKAGES_DIR ?= "${WORKDIR}/testimage/packages"
 TEST_EXTRACTED_DIR ?= "${TEST_NEEDED_PACKAGES_DIR}/extracted"
 TEST_PACKAGED_DIR ?= "${TEST_NEEDED_PACKAGES_DIR}/packaged"
 
-BASICTESTSUITE = "ping date df ssh scp python perl apt opkg gi ptest dnf rpm parselogs logrotate connman systemd oe_syslog pam stap ldd xorg"
-DEVTESTSUITE = "gcc kernelmodule buildcpio buildlzip buildgalculator "
+BASICTESTSUITE = "\
+    ping date df ssh scp python perl apt opkg gi ptest dnf rpm parselogs \
+    logrotate connman systemd oe_syslog pam stap ldd xorg kernelmodule gcc \
+    buildcpio buildlzip buildgalculator"
 
 DEFAULT_TEST_SUITES = "${BASICTESTSUITE}"
-DEFAULT_TEST_SUITES_pn-core-image-sato-sdk = "${BASICTESTSUITE} ${DEVTESTSUITE}"
-DEFAULT_TEST_SUITES_pn-core-image-lsb-sdk = "${BASICTESTSUITE} ${DEVTESTSUITE}"
 
 # aarch64 has no graphics
 DEFAULT_TEST_SUITES_remove_aarch64 = "xorg"
-- 
2.17.1


