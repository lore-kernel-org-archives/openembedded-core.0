Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
	[209.85.218.42])
	by mail.openembedded.org (Postfix) with ESMTP id E353E77390
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 21:03:12 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id x143so1298962oix.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 13:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=y36mfbCLqP6/cl2UdvNU+Dtc1vf5xhoFYK2clyeyqpg=;
	b=NRg+p/CTGH5cM2CDzvU00rlcW8QQy4+untzIDZJdvaGCYxiKZbmZgkf4FYo3BN6ZlC
	CJ8yb3hCIDyD1BZMfZNM0PHOFtj0n+jlmft2OjbZ9RxpMkCvrSnXuYeXhg6dyt6ITEYZ
	y0pnLGo76xgemMAEKLE1faJbkI54QgylGi98wpN7/uGEIqk3yCMFNp01A/xP3bZ5Rw6n
	GkhGd4LBWWEjksLk857AxE9c6rwVAwcp3ewmTAFfCfvGFtcL0OhDJXm2REZdbJpBKrQc
	Z1m6uJjwnntcPo5Sgc5iORfhKF/OCvICUs3DryQghk8FX2kxix2ssN73PNNdiyRKktdU
	LOUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=y36mfbCLqP6/cl2UdvNU+Dtc1vf5xhoFYK2clyeyqpg=;
	b=kZ1XX2WfHPGQLoczF6fsvmI5SMH5GRqSi/8QmXq67JTj+ShkXwicbicEdJWK8ll1Y9
	/K/5sn1aC2IWGXBYwhvCTaVjeDAShYAbggXfUGFPWRKtzaEj9fG0qftohA7Oli7btPWe
	lbjcDL+4kgEETNzDUdg+gIckmqs7/rTwJDZWQCd+3y2eCz5KoiWYUwG7lvfxq2Om5s1F
	6cpu4rviIvapNtXoVTSw5Jv/DuCyKcpiiBFSoUWRsJXgyNaft5FwkdK5Q6pepPkP/QTt
	NF5ColhWcgrN/A311iHgAl1UgXS8X2F3vl31N814jr3IDnS/K45yOwBBrkvtYDqt0b+G
	07Iw==
X-Gm-Message-State: AD7BkJIC24DOtWHrWF04aFnfQVHhlEoHA666yxaqINR9SCWY6BT2zHgigsrGy3yPQZO2mA==
X-Received: by 10.202.194.198 with SMTP id s189mr2783514oif.17.1456520593124; 
	Fri, 26 Feb 2016 13:03:13 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id d39sm9918778oic.0.2016.02.26.13.03.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Feb 2016 13:03:12 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Feb 2016 13:03:06 -0800
Message-Id: <1456520586-15765-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] gstreamer1.0-plugins-bad.inc: limit ARM_INSTRUCTION_SET over-rides to armv4/armv5
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
X-List-Received-Date: Fri, 26 Feb 2016 21:03:13 -0000

The original over-ride is historical and no obvious issues are seen
now when building in thumb2 for Cortex A15.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
index 7b0c396..64d89b0 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
@@ -135,7 +135,8 @@ EXTRA_OECONF += " \
 
 export OPENCV_PREFIX = "${STAGING_DIR_TARGET}${prefix}"
 
-ARM_INSTRUCTION_SET = "arm"
+ARM_INSTRUCTION_SET_armv4 = "arm"
+ARM_INSTRUCTION_SET_armv5 = "arm"
 
 FILES_${PN}-dev += "${libdir}/gstreamer-${LIBV}/include/gst/gl/gstglconfig.h"
 FILES_${PN}-freeverb += "${datadir}/gstreamer-${LIBV}/presets/GstFreeverb.prs"
-- 
1.9.1


