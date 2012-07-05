Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SmnKr-0005rV-JR
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jul 2012 16:47:13 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq2so12500315pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jul 2012 07:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=qmX8IvK6wmuYyIU9OlGJXIpSAQZH4RsSOOErxd/AyWU=;
	b=G83BDiYZXO1G60R+pxfjd3Dhje/FrGsYtO1puGUb8kXR/Jbo+VCsKF1kp3Gt9si4S6
	/BPkky77laIwaHTKHzAkoH6WM/HVz+3yOlifXk3SvAMwERlmpXQya4jErHpx+8ehalAI
	7YKbMgKxiIzJVEAO1H/o/3K6TevQYKp/wOkd3m3C04X8hQY0NKJLVoJlmTDRqo6Mlz/m
	ofIy/Wayj2lRKmN0Dg5xE+kLeCh94ljZF4pmm2O+wUyFU5faPOx65KmSjp2OYR76Tpmi
	XcTKbgOScYNe/g+W7wY9LQjMlHvI+Zwl26dGCtaGMeuLfiOF7C//BKBUNTBxpG01FYMg
	buHg==
Received: by 10.68.125.228 with SMTP id mt4mr28340170pbb.21.1341498971130;
	Thu, 05 Jul 2012 07:36:11 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id ru10sm9521262pbc.50.2012.07.05.07.36.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 Jul 2012 07:36:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jul 2012 07:35:29 -0700
Message-Id: <9a1de472c880dc91ae1120678bb6aafc00bbb09d.1341498745.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <48ef71f7c5eea25278a5a9c9befd01123369e2f9.1341498745.git.raj.khem@gmail.com>
References: <48ef71f7c5eea25278a5a9c9befd01123369e2f9.1341498745.git.raj.khem@gmail.com>
In-Reply-To: <cover.1341498745.git.raj.khem@gmail.com>
References: <cover.1341498745.git.raj.khem@gmail.com>
Subject: [PATCH 10/14] boost: Upgrade recipe to 1.50.0
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
X-List-Received-Date: Thu, 05 Jul 2012 14:47:13 -0000

1.49.0 is not buildable with eglibc 2.16 since
it exposes a define TIME_UTC which is also used
in boost until 1.50.0 when it was renamed to
TIME_UTC_ so instead of porting needed patches
we upgrade boost to latest release

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../boost/{boost_1.49.0.bb => boost_1.50.0.bb}     |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-support/boost/{boost_1.49.0.bb => boost_1.50.0.bb} (53%)

diff --git a/meta/recipes-support/boost/boost_1.49.0.bb b/meta/recipes-support/boost/boost_1.50.0.bb
similarity index 53%
rename from meta/recipes-support/boost/boost_1.49.0.bb
rename to meta/recipes-support/boost/boost_1.50.0.bb
index 71fdc48..78ebf1e 100644
--- a/meta/recipes-support/boost/boost_1.49.0.bb
+++ b/meta/recipes-support/boost/boost_1.50.0.bb
@@ -5,6 +5,5 @@ LIC_FILES_CHKSUM = "file://LICENSE_1_0.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 PR = "${INC_PR}.0"
 
 SRC_URI += "file://arm-intrinsics.patch"
-
-SRC_URI[md5sum] = "0d202cb811f934282dea64856a175698"
-SRC_URI[sha256sum] = "dd748a7f5507a7e7af74f452e1c52a64e651ed1f7263fce438a06641d2180d3c"
+SRC_URI[md5sum] = "52dd00be775e689f55a987baebccc462"
+SRC_URI[sha256sum] = "c9ace2b8c81fa6703d1d17c7e478de3bc51101c5adbdeb3f6cb72cf3045a8529"
-- 
1.7.9.5



