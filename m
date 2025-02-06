Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9040AC02194
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 17:44:06 +0000 (UTC)
Received: from mx07-0040c702.pphosted.com (mx07-0040c702.pphosted.com [205.220.184.135])
 by mx.groups.io with SMTP id smtpd.web11.38112.1738840020821735336
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Feb 2025 03:07:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=HVfQfJ7R;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 205.220.184.135, mailfrom: pascal.weisser.ext@karlstorz.com)
Received: from pps.filterd (m0267679.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 516AeL2c017902
	for <openembedded-core@lists.openembedded.org>; Thu, 6 Feb 2025 11:06:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	S-DKIM-20210427; bh=FMDjEoM/+SK53E2fKJVcjUVy9Mr0hBoO3lr3scWjmRs=; b=
	HVfQfJ7RkPjxv7SD8AvZ49Pd+cFH9edAivQmQQfsEjOdofUxix6F3fnvKeJKKja2
	Jfmi0/6eUaPXC6+XO4wXPAEiiLgP3RiHnAz9IfeenTloH1MjhBJQKz0UE/R7j5y9
	tpZFKyJ3Ia5MSSy4XDC3IeSOo1gvqLavS7QYMpiQtOobaziDU6IFKE+DUXcs/Juh
	mtkKIpsnPIRziWiczlFZRyB9+2lYLjhtEQb4RYulBfmBdgsiETf/CGPlNiVgkt19
	dBW8F22Uotb5l6inlwiU9IF7P6wXklCXwcR3OwluvE/jzzAQENPigZdY6Y/Y9sFI
	bY/Wo5xgfaFCdemumgdBZg==
Received: from tut-ex22-pv.kstg.corp (62-134-76-232.business.static.de.bt.net [62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 44mrus9db1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 11:06:59 +0000 (GMT)
Received: from TUT-EX20-PV.KSTG.corp (10.0.10.224) by TUT-EX22-PV.KSTG.corp
 (10.0.10.226) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 6 Feb
 2025 12:06:58 +0100
Received: from TUT-EX23-PV.KSTG.corp (10.0.10.227) by TUT-EX20-PV.KSTG.corp
 (10.0.10.224) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 6 Feb
 2025 12:06:58 +0100
Received: from tutn-bpfb5m3.kstg.corp (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.227) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Thu, 6 Feb 2025 12:06:58 +0100
From: "Weisser, Pascal.ext" <Pascal.Weisser.ext@karlstorz.com>
To: <openembedded-core@lists.openembedded.org>
CC: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
Subject: [PATCH 2/2] documentation.conf: Add description for IMAGE_ROOTFS_MAXSIZE variable
Date: Thu, 6 Feb 2025 12:06:15 +0100
Message-ID: <20250206110615.291324-3-pascal.weisser.ext@karlstorz.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250206110615.291324-1-pascal.weisser.ext@karlstorz.com>
References: <20250206110615.291324-1-pascal.weisser.ext@karlstorz.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: vKykykdcTwRppaRxKBnT5rs8yhBPkfHJ
X-Proofpoint-GUID: vKykykdcTwRppaRxKBnT5rs8yhBPkfHJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_03,2025-02-05_03,2024-11-22_01
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 17:44:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210955

Signed-off-by: Weisser, Pascal <pascal.weisser.ext@karlstorz.com>
---
 meta/conf/documentation.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 295fefb80e..2dcf85f767 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -222,6 +222,7 @@ IMAGE_PKGTYPE[doc] = "Defines the package type (DEB, RPM, IPK, or TAR) used by t
 IMAGE_POSTPROCESS_COMMAND[doc] = "Added by classes to run post processing commands once the OpenEmbedded build system has created the image."
 IMAGE_ROOTFS[doc] = "The location of the root filesystem while it is under construction (i.e. during do_rootfs)."
 IMAGE_ROOTFS_EXTRA_SPACE[doc] = "Defines additional free disk space created in the image in Kbytes. By default, this variable is set to '0'."
+IMAGE_ROOTFS_MAXSIZE[doc] = "Defines the maximum size in Kbytes for the generated image."
 IMAGE_ROOTFS_SIZE[doc] = "Defines the size in Kbytes for the generated image."
 IMAGE_TYPES[doc] = "Specifies the complete list of supported image types by default."
 INC_PR[doc] = "Helps define the recipe revision for recipes that share a common include file."
-- 
2.48.1


