Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QMDnE-00036d-OE
	for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 08:30:08 +0200
Received: by fxm19 with SMTP id 19so320914fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2011 23:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=U5rcMRnGcBJXxLsiyMzmSJcgRRm5bQTkVs8kwOjljdw=;
	b=luH2ce+WpXhadFk1X6rzYEvC+1CLJlGzWtpN3+Mobh7nEYjknpk4csbbrmqCIUOfKu
	dKj+QAQqihA3tA42v0gUwI0M3J4hchh8UdT6C+lmeyxceHMK/ZifQr9TyAz6+jToU4l4
	6WxNF7bCLuR2x3KaQ2NfMVfY2gB5EnF0Pr39s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Y114M5eFCMbnu3Q+3RoWBAbq1sRjX/5tuQomArhJScprlRGxJBoxD/7Dz7gLfhXMvF
	S9Me1U6yF23fGiouS4oYDIyaSzivNMYN3fTRIZy3bB48eJpPtgjEMx2L6OFvo6QNv60s
	h/uYhbctiXEjjr0MIlgdUoo2nrJtjoAkL3LgU=
Received: by 10.223.53.85 with SMTP id l21mr332383fag.26.1305613635840;
	Mon, 16 May 2011 23:27:15 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id 18sm67153fan.1.2011.05.16.23.27.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 May 2011 23:27:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 May 2011 08:27:13 +0200
Message-Id: <a43700fbb276794c31e8d1948e3420d3b3173ca4.1305613256.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
In-Reply-To: <cover.1305613256.git.Martin.Jansa@gmail.com>
References: <cover.1305613256.git.Martin.Jansa@gmail.com>
Subject: [PATCH 1/1] bitbake.conf: set TARGET_VENDOR to '-oe' and remove it from defaultsetup.conf
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
X-List-Received-Date: Tue, 17 May 2011 06:30:08 -0000

* -oecore was changed to -oe to be more consistent with SDK_VENDOR as we had -oesdk as SDK_VENDOR and not -oecoresdk

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/bitbake.conf             |    2 +-
 meta/conf/distro/defaultsetup.conf |    2 --
 2 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 8b6236e..c292759 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -78,7 +78,7 @@ HOST_EXEEXT = ""
 
 TARGET_ARCH = "INVALID"
 TARGET_OS = "INVALID"
-TARGET_VENDOR = "${BUILD_VENDOR}"
+TARGET_VENDOR = "-oe"
 TARGET_SYS = "${TARGET_ARCH}${TARGET_VENDOR}${@['-' + bb.data.getVar('TARGET_OS', d, 1), ''][bb.data.getVar('TARGET_OS', d, 1) == ('' or 'custom')]}"
 TARGET_PREFIX = "${TARGET_SYS}-"
 TARGET_CC_ARCH = ""
diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/defaultsetup.conf
index 8da6c0a..9f12f4d 100644
--- a/meta/conf/distro/defaultsetup.conf
+++ b/meta/conf/distro/defaultsetup.conf
@@ -3,8 +3,6 @@ include conf/distro/include/default-versions.inc
 include conf/distro/include/default-distrovars.inc
 include conf/distro/include/world-broken.inc
 
-TARGET_VENDOR ?= "-oecore"
-
 TARGET_FPU_arm ?= "soft"
 TARGET_FPU_armeb ?= "soft"
 
-- 
1.7.5.rc3



