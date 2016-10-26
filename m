Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id D500471AE6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 01:50:21 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id s8so21098983pfj.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 18:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=5i6hOh4HlAWPVybcIaFbfl7qz16OCpyIwJfJmgXTws4=;
	b=LmTDTmUqgpRpDAu4qOAEy0G+l/mpAlYKgNF8Qjfn5k08QdEYFdR7gHEez4GNQmnYir
	71oCLuaFmRixY7Dce+WqDVoagNhCR5XIZgGzwMgJZH/bg/GOrnObFheGmLBoB5jp38AI
	catraz62H2n4+0/DUDik8Hy2BBVyDiB0HTka+CIEqAmg5vPZjmOi9hex7R6b8YAdkkJi
	TeC/e7h4QH+I4S2dA2yUGoWQevdhM0uzehr6Ckre0duTkLIvdmmQXOtvh36YujFl4eLg
	1N9l4+oEhnLJtf70PjbhWcYZK5lDCUnWCe1auRyVqp8QUAm6KEr7pQs0fr5OSwAkU8XR
	ws8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=5i6hOh4HlAWPVybcIaFbfl7qz16OCpyIwJfJmgXTws4=;
	b=cUjnBusQ+JulnrgGeOLML0I/MFk/Mhxc2AK/DKGeOV0FHnJFTJOs6lZszsx1fXB9Cu
	PCuaVeOsOQWjUcMpo1QSnAdH3OpFQuYx+1EVI8uWSyPVRBkPRRtwWf6WkVGboRe2VnP8
	VkW451S/bcYomv2iqA6z84Kmc53beQ5KdFqlANUVIcyLvVl2sRVG7SoRJh/Ngch1ODYI
	hpPdr+4rECcp1PX/BH3ILWHzSgevJT1XGUH/r6Tsc3FQNHZ6CUQXzutSgMcO4U51jmZN
	2v02BOsuxaPzsnH81HV11Bj7zaqbSIRW5JB7s6TqPPc788qMDyXEzQNroOofdx67mSxD
	fU8A==
X-Gm-Message-State: ABUngveX4ztqu6U+hK348lBp6JWxRzqZSPJGoV0iJg67p4F+Ry/HUlSQABODjUD6BFzdrw==
X-Received: by 10.99.117.3 with SMTP id q3mr37070861pgc.50.1477446623584;
	Tue, 25 Oct 2016 18:50:23 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	zh13sm36318522pab.4.2016.10.25.18.50.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Oct 2016 18:50:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Oct 2016 18:50:17 -0700
Message-Id: <20161026015017.13160-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.1
Subject: [PATCH] wic: Add dosfstools-native mtools-native to dependencies
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
X-List-Received-Date: Wed, 26 Oct 2016 01:50:22 -0000

these tools are needed for building wic images for some
boards e.g. overo/gumstix

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/image_types.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index a7fffbc..be7e38c 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -298,7 +298,7 @@ IMAGE_DEPENDS_elf = "virtual/kernel mkelfimage-native"
 IMAGE_DEPENDS_ubi = "mtd-utils-native"
 IMAGE_DEPENDS_ubifs = "mtd-utils-native"
 IMAGE_DEPENDS_multiubi = "mtd-utils-native"
-IMAGE_DEPENDS_wic = "parted-native"
+IMAGE_DEPENDS_wic = "parted-native dosfstools-native mtools-native"
 
 # This variable is available to request which values are suitable for IMAGE_FSTYPES
 IMAGE_TYPES = " \
-- 
2.10.1


