Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 540A970178
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Oct 2016 16:09:16 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id 190so3074717pfv.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Oct 2016 09:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=HwPeqQ77rYzuOLWmkpGbV62QRNzvUG/ADN8RL7n6Jo4=;
	b=UExA/UjnqMGUAMk+o7lWHb6a+1JQYtHNu00gvjBj75vxhYblRIFmE7ml8YHh7dZjeM
	45pDIESoRO4Xe9Foa5PTBHiPZJIqoMpJSHvF7IEdzjzCrR5XgFOynyfSk4uwn46C+i6Q
	Z/mpO46kgc/zKTpqwjajUz01+fj2N/fF+Y+fNShf/NfCzbd1BMT3fmRA/xB1SCAUN1/4
	jDX/wW1s/xcw4inHAviScJHKw801j4tTyL36StHoHl/jCClU/vWUATgJVD+o3Ks2Uf5X
	qNHhnNKqj+icngePAgq+/NLQuz37d5ne1GMgfujY0m+N5s1GvneeASc3k9eVyOYLKSSD
	ryig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=HwPeqQ77rYzuOLWmkpGbV62QRNzvUG/ADN8RL7n6Jo4=;
	b=OAjiq3gZankPp53ST3u1Jm8v+PfCWaPUmD3sAmthvl6arKsEcOgZS8lcQ0htfm7pTJ
	Rwo85Vh4yv2SwSVl4bYBLw7bFvcWFyjdmSMlV7KotwuXA5SgTCeHgKkToxBn8dfv21yR
	k5MKEPBht7myAlwPe0HGva6uHwQ+WKXBS2mhhFYaLnIsblWlVaZeCOUveqYZNX7KddW/
	mF8+6Z1eGxGDl0dM4m/Z9w97OxekzFdkzDWE7O/J+C4WuEjSEM7DDZn94qwhyFpuQOcj
	cbwrf4AaEpCRSd0qu6QkcUwmp7s4KNC4K5XuITMw+UI9SY6JMbd/Wk7/K455IUAVcLdY
	I1hQ==
X-Gm-Message-State: AA6/9Rn5X9hyPL4QOEZdBHlEnkC9wMEVP0YeoSF/c6t6A4ZISNJXwpziBokMJB9kUqN+OA==
X-Received: by 10.98.65.80 with SMTP id o77mr17412557pfa.54.1475856558421;
	Fri, 07 Oct 2016 09:09:18 -0700 (PDT)
Received: from akuster-ThinkPad-X240.hsd1.ca.comcast.net
	([2601:202:4001:9ea0:4c9c:7764:1f56:1b2d])
	by smtp.gmail.com with ESMTPSA id
	u25sm15057422pfi.92.2016.10.07.09.09.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 07 Oct 2016 09:09:18 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Fri,  7 Oct 2016 09:09:16 -0700
Message-Id: <1475856556-16602-1-git-send-email-akuster808@gmail.com>
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
X-List-Received-Date: Fri, 07 Oct 2016 16:09:17 -0000

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
index a5da936..b3c1b5b 100644
--- a/meta/recipes-devtools/mklibs/mklibs-native_0.1.41.bb
+++ b/meta/recipes-devtools/mklibs/mklibs-native_0.1.41.bb
@@ -6,7 +6,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=98d31037b13d896e33890738ef01af64"
 DEPENDS = "python-native"
 
-SRC_URI = "http://ftp.de.debian.org/debian/pool/main/m/mklibs/${BPN}_${PV}.tar.xz \
+SRC_URI = "http://snapshot.debian.org/archive/debian/20160207T221625Z/pool/main/m/${BPN}/${BPN}_${PV}.tar.xz \
 	file://ac_init_fix.patch\
 	file://fix_STT_GNU_IFUNC.patch\
 	file://sysrooted-ldso.patch \
-- 
2.7.4


