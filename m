Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 86D8C605B3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Oct 2016 03:52:56 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id r9so2048192paz.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Oct 2016 20:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=POagjFZzg1drmxx82j19Va7FylPNbYpwRXS/8BFl0as=;
	b=ZdVy0padUji/WOjgwoxqmvqH26ZqzGEek9IsUwZA2lQRsAkVFvTziFs3cUzhC1cv8A
	qzy5z6eBU+Ak5B4auT+UHgG37UiZR+X/zq3bcU859IoRFyR5ycxWr3TSJXoT8nxhItQ8
	n371R4dpLiEH4tV30UL3tlYPa02BEi5oB2WXMwdWXb83JykaNqBIlDxU33jI5KV8MGyK
	BcGzBQ6fUkQCsOtG3f72GdYreGVYXuVWk/V6Bx9oYqVMkR53I/vKlysjfhu3EZ14wr4L
	mz2L6944/k13SmdG70kdGgF8Gjs2C8ZBaRjNTj6G+TTCJhVeaY6yuo0Z3oxyyhZRNsJ4
	9Waw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=POagjFZzg1drmxx82j19Va7FylPNbYpwRXS/8BFl0as=;
	b=BjVYOISZE3T+MW6YDcy/EeCynNboapmhVjEf5YBzlruGU/Acf3D4Zttsrd7ipQrUwV
	ov1hZtehLTPVQdggOvEvZKSPvi3mHT/hTppdn02VWGifu4JW+7d8V7dB74oAwmJu1yuG
	exUY8oG87sAOcTet63hKZWjNoZZDFHcCZLloQDGvh5Pn6vjvcLFI0VsDu7AJwcyGjGKA
	bvd0xELekcmVvNHuyszVs5GY8FlSgyauFmtNwz8udY71xHddRG+uPWeCT0Pni/uC5TqA
	HBaWPJXR4rDHVfG+v4mY+DASVEl1XGE6mC1KfQaA1yBzagup8uUyewysC822RjnX+z0w
	5PGA==
X-Gm-Message-State: AA6/9Rm3mNow/vdgqHSEwLo4nACly04ZH7uO7vvGemCrtdnWvHmBCZR17X0UzRX2kufxFw==
X-Received: by 10.66.135.140 with SMTP id ps12mr27162840pab.14.1475812378230; 
	Thu, 06 Oct 2016 20:52:58 -0700 (PDT)
Received: from akuster-ThinkPad-X240.mvista.com
	([2601:202:4001:9ea0:2889:3f0b:1a74:f67a])
	by smtp.gmail.com with ESMTPSA id p5sm9331366pfp.7.2016.10.06.20.52.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Oct 2016 20:52:57 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Thu,  6 Oct 2016 20:52:56 -0700
Message-Id: <1475812376-20184-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] mklibs-native: update broken SRC_URI
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
X-List-Received-Date: Fri, 07 Oct 2016 03:52:57 -0000

From: Armin Kuster <akuster@mvista.com>

fixes checkuri AB failure.

ERROR: mklibs-native-0.1.41-r0 do_checkuri: Fetcher failure for URL: 'http://ftp.de.debian.org/debian/pool/main/m/mklibs/mklibs_0.1.41.tar.xz'. URL http://ftp.de.debian.org/debian/pool/main/m/mklibs/mklibs_0.1.41.tar.xz doesn't work
ERROR: mklibs-native-0.1.41-r0 do_checkuri: Function failed: do_checkuri

[ Yocto #10391]

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/mklibs/mklibs-native_0.1.41.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/mklibs/mklibs-native_0.1.41.bb b/meta/recipes-devtools/mklibs/mklibs-native_0.1.41.bb
index a5da936..09ea88a 100644
--- a/meta/recipes-devtools/mklibs/mklibs-native_0.1.41.bb
+++ b/meta/recipes-devtools/mklibs/mklibs-native_0.1.41.bb
@@ -6,7 +6,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=98d31037b13d896e33890738ef01af64"
 DEPENDS = "python-native"
 
-SRC_URI = "http://ftp.de.debian.org/debian/pool/main/m/mklibs/${BPN}_${PV}.tar.xz \
+SRC_URI = "http://archive.ubuntu.com/ubuntu/pool/main/m/mklibs/${BPN}_${PV}.tar.xz \
 	file://ac_init_fix.patch\
 	file://fix_STT_GNU_IFUNC.patch\
 	file://sysrooted-ldso.patch \
-- 
2.7.4


