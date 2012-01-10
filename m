Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marc.ferland@gmail.com>) id 1RkiKZ-0002ES-Di
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 21:30:03 +0100
Received: by qcqw6 with SMTP id w6so2746764qcq.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2012 12:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=JmkD/YYwcE2O7VyzQ+XsRb4hV9O1J7tDq1mKjAinbNA=;
	b=atTsdBGta87jmSOjC7T9kgru/Nvn/2PCkFobfrkpypU6CXfTPmahSGjrxKSjwlxmQI
	kqU99Hrnkbv7HLSWGMQ1OaywM9eMHMGvr5XrYENWMnWyB0gcssnwWEPR+gE1Ro/kRvKb
	eNIW3JDr/ylPK6CBlqKYpZsRIrJOCFjAVHRNY=
Received: by 10.229.77.88 with SMTP id f24mr8226680qck.12.1326226951723;
	Tue, 10 Jan 2012 12:22:31 -0800 (PST)
Received: from ferlandm@sonatest.com
	(modemcable066.15-37-24.static.videotron.ca. [24.37.15.66])
	by mx.google.com with ESMTPS id de9sm13065351qab.9.2012.01.10.12.22.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 Jan 2012 12:22:31 -0800 (PST)
Sender: Marc Ferland <marc.ferland@gmail.com>
Received: by ferlandm@sonatest.com (sSMTP sendmail emulation);
	Tue, 10 Jan 2012 15:22:41 -0500
From: Marc Ferland <ferlandm@sonatest.com>
To: oe <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Jan 2012 15:22:38 -0500
Message-Id: <1326226959-21371-1-git-send-email-ferlandm@sonatest.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] Add grep to RDEPENDS to avoid command failures.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Jan 2012 20:30:03 -0000

Fixes [YOCTO #1887]

Signed-off-by: Marc Ferland <ferlandm@sonatest.com>
---
 meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb b/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
index a4ac230..5e09f7b 100644
--- a/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
+++ b/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
@@ -1,12 +1,13 @@
 SECTION = "base"
 SUMMARY = "Utilities and scripts for power management"
-DESCRIPTION = "Simple shell command line toos to suspect and hibernate."
+DESCRIPTION = "Simple shell command line tools to suspend and hibernate."
 HOMEPAGE = "http://pm-utils.freedesktop.org/wiki/"
 LICENSE="GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://src/pm-pmu.c;beginline=1;endline=22;md5=3c1ddbc54e735fb4a0386e14c78a3147"
 
-PR = "r0"
+PR = "r1"
+RDEPENDS = "grep"
 
 SRC_URI = "http://pm-utils.freedesktop.org/releases/pm-utils-${PV}.tar.gz"
 
-- 
1.7.5.4



