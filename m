Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 5D2466CC79
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2013 12:56:08 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id hq4so9763913wib.14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Dec 2013 04:56:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=2m1AgaZ8kbjN1hlEUr5iB4KBFl8pofDqVI7RvKU3nN0=;
	b=bYwlZfbtQnluhayKU4g3EPXwRAUHSUSkSO1V3AjTmelVnSFDUN/fC1w72YMGQuxMWE
	YZ9JKU8FNMkbYYhefP4r9YLLiJibGmggJeVfsI2o5zaZS1B92AgiUT3GY3obVqEH+hjV
	+YVb18Ph2yutKiQWHD72mRMsA81HJHVzB9oY+zWFp5Tns5nbnARZqCM0EQ9IyiRkyBpO
	akn+CMPyBK6a5zpVhP6JkXHNib9DS2/tlGldXjPuXkCZ9MH9fD61YvLPrEBVRD8ihUzK
	yN5Bgr+dVhcHOOkO59bfpjutVrQ6Zbs0Pp5DuLMUV5fulHC6sPKI85jCOJaco2Fe9WcU
	42ew==
X-Gm-Message-State: ALoCoQmta+oGrcT64CdASWvOiqa/DqFPt1Ugo2lAC5H6cOhhKnf8kkkVGAvJ2bFay9YTJfn43bgz
X-Received: by 10.181.11.169 with SMTP id ej9mr12035619wid.13.1386248166892;
	Thu, 05 Dec 2013 04:56:06 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id b7sm6059113wiz.8.2013.12.05.04.56.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Dec 2013 04:56:06 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Dec 2013 12:55:59 +0000
Message-Id: <1386248161-7086-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/3] documentation.conf: remove unused IMAGETEST variable
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
X-List-Received-Date: Thu, 05 Dec 2013 12:56:08 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/documentation.conf |    1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 6666648..db3701b 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -118,7 +118,6 @@ IMAGE_LINGUAS[doc] = "Specifies the list of locales to install into the image du
 IMAGE_OVERHEAD_FACTOR[doc] = "Defines a multiplier that the build system applies to the initial image size for cases when the multiplier times the returned disk usage value for the image is greater than the sum of IMAGE_ROOTFS_SIZE and IMAGE_ROOTFS_EXTRA_SPACE."
 IMAGE_ROOTFS_EXTRA_SPACE[doc] = "Defines additional free disk space created in the image in Kbytes. By default, this variable is set to '0'."
 IMAGE_ROOTFS_SIZE[doc] = "Defines the size in Kbytes for the generated image."
-IMAGETEST[doc] = "Enable test booting of virtual machine images under the qemu emulator after any root filesystems are created and run tests against those images."
 INC_PR[doc] = "Helps define the recipe revision for recipes that share a common include file."
 INHIBIT_PACKAGE_STRIP[doc] = "If set to "1", causes the build to not strip binaries in resulting packages."
 INHERIT[doc] = "Causes the named class to be inherited at this point during parsing. The variable is only valid in configuration files."
-- 
1.7.10.4


