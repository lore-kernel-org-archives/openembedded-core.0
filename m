Return-Path: <Pascal.Weisser.ext@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 181A3C02194
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 12:50:35 +0000 (UTC)
Received: from mx08-0040c702.pphosted.com (mx08-0040c702.pphosted.com [185.183.31.154])
 by mx.groups.io with SMTP id smtpd.web10.39826.1738846224665991922
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Feb 2025 04:50:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=MqyX+/XU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 185.183.31.154, mailfrom: pascal.weisser.ext@karlstorz.com)
Received: from pps.filterd (m0267678.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 516BK3MS012230
	for <openembedded-core@lists.openembedded.org>; Thu, 6 Feb 2025 12:50:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	S-DKIM-20210427; bh=FMDjEoM/+SK53E2fKJVcjUVy9Mr0hBoO3lr3scWjmRs=; b=
	MqyX+/XUL7IZt4DvBwQqxC8H+Xz5ncp+ePK9iJR+LZv1WMlHk2uez3jTFdDC+H35
	dAxiqFMfKdj6YrRaGx6vzInusmEckoae7YOSZ5Xlmc4pd0GJCCdjbn1D5tAABqR+
	Tr+LS0b2HykCZ5ySlxxiaX4VIV3hq96xtcrWTZsuF2dDBflGcnCVSH269QG4vjm/
	6MyuU2E+yrwwoV0/CHP5eXH7QInxuZrCIzwcWkj+GjiVaEusGbRfZE6UW3MCNKFG
	V9H0hpKXuD53eiwgA006iFINzI5IrvUfDZwXduWv/1uY+fPQxz+L+Pjao5Kqi0Le
	zXI3Ce23Sb4lsDOLroZM9g==
Received: from tut-ex22-pv.kstg.corp (62-134-76-232.business.static.de.bt.net [62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 44mttkh9m9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 12:50:23 +0000 (GMT)
Received: from TUT-EX22-PV.KSTG.corp (10.0.10.226) by TUT-EX22-PV.KSTG.corp
 (10.0.10.226) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 6 Feb
 2025 13:50:22 +0100
Received: from tutn-bpfb5m3.kstg.corp (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.226) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Thu, 6 Feb 2025 13:50:22 +0100
From: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
To: <openembedded-core@lists.openembedded.org>
CC: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
Subject: [PATCH 2/2] documentation.conf: Add description for IMAGE_ROOTFS_MAXSIZE variable
Date: Thu, 6 Feb 2025 13:49:41 +0100
Message-ID: <20250206124941.342980-3-pascal.weisser.ext@karlstorz.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250206124941.342980-1-pascal.weisser.ext@karlstorz.com>
References: <20250206124941.342980-1-pascal.weisser.ext@karlstorz.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: TjoJMa48rDq3uTvz4kXubdy9Nd1EFom9
X-Proofpoint-GUID: TjoJMa48rDq3uTvz4kXubdy9Nd1EFom9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_03,2025-02-05_03,2024-11-22_01
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 12:50:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210932

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


