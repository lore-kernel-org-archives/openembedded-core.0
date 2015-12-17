Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 9F34D60116
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 20:57:12 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id p187so38604406wmp.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 12:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=ByHoIxzOd7DU4Dyype/97p3fpPLOwHnARlZKDrI9sTQ=;
	b=KM7pRzUePFJpg1yzF3/7DmsTyH9IGVnKxGp7CM4ta+IDJUNXtt6Y3upPjb2cxdEXPn
	uCgqKMsIAZ+SlA2+ekEbCKHOxnYZnQQr24gnX+/PMi56oDSNqN5xOatkw1upx7sm2q1e
	V6yMaCH7aeARwoUDm+hLiYsdupdbmbQnmNTOcB9wZZ5lNJI/LVaQXjwlMPSwVw38dYgw
	vMNpUkIg710TWhMWmrYxjooV19W7vS9aVpWWPlYLGwoHCkNvXnjPyGBETGV8gO3wltz+
	BKiQtdmFSjlkTYjCKsJYvTawL5Fy9plFABsrAhjbTwRdYt2hF7xqoHj/zH92TBumn3Ry
	FWNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ByHoIxzOd7DU4Dyype/97p3fpPLOwHnARlZKDrI9sTQ=;
	b=Yis+6GTXZwDq+67t8SYiLgfmOhwlFDeBmUBfJMFJohhwKMsqereOtzNUhtJygxtbV8
	eSf50qXs7a7fEOYEycVe8PhtlSCf4fnWr18CuQdukjaoohFRRCNmxmFGuW45fKA7Vki0
	ewVqcAs01v5V71iZjZ61zG3TjZmito523SrvYIJBIAl5A9toIDlTARGQ57EIdVpUNYs3
	Pa1md58WoelqcbK3bdwCE12OrquMBa1ZlVGh5pYnbfaKbz3ziks49JiSLinb/lE0o4jI
	1HPLyDTMEQEgA/fLgu8sQx1/fYA/jMgC6LkvNsPPqzyJmy43wdRPKhKbVKRfi4CEuC65
	wbIw==
X-Gm-Message-State: ALoCoQlVL7a/HGiDhB5kgHAM4lmweDqq1pdIcp13JyDiALVIIaX8Ng5o8Kxw8zCQ5SQNcW+s9qiWIXitvHRw8vsjSATkDmbZbA==
X-Received: by 10.194.192.99 with SMTP id hf3mr11303536wjc.30.1450385833008;
	Thu, 17 Dec 2015 12:57:13 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id 186sm3875959wmv.9.2015.12.17.12.57.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 17 Dec 2015 12:57:12 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Dec 2015 20:57:08 +0000
Message-Id: <1450385828-5510-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.6.4
Subject: [PATCH] systemd: remove merge conflicts accidently left in
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
X-List-Received-Date: Thu, 17 Dec 2015 20:57:12 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../0016-Revert-udev-remove-userspace-firmware-loading-suppor.patch  | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd/0016-Revert-udev-remove-userspace-firmware-loading-suppor.patch b/meta/recipes-core/systemd/systemd/0016-Revert-udev-remove-userspace-firmware-loading-suppor.patch
index 03ab0d4..6e5a8fb 100644
--- a/meta/recipes-core/systemd/systemd/0016-Revert-udev-remove-userspace-firmware-loading-suppor.patch
+++ b/meta/recipes-core/systemd/systemd/0016-Revert-udev-remove-userspace-firmware-loading-suppor.patch
@@ -110,16 +110,13 @@ index a3e639d..00736f5 100644
  have_manpages=no
  AC_ARG_ENABLE(manpages, AS_HELP_STRING([--disable-manpages], [disable manpages]))
  AS_IF([test "x$enable_manpages" != xno], [
-@@ -1616,6 +1635,12 @@ AC_MSG_RESULT([
+@@ -1616,6 +1635,9 @@ AC_MSG_RESULT([
          SysV init scripts:       ${SYSTEM_SYSVINIT_PATH}
          SysV rc?.d directories:  ${SYSTEM_SYSVRCND_PATH}
          Build Python:            ${PYTHON}
-+<<<<<<< HEAD
-+=======
 +        Installation Python:     ${PYTHON_BINARY}
 +        sphinx binary:           ${SPHINX_BUILD}
 +        firmware path:           ${FIRMWARE_PATH}
-+>>>>>>> parent of be2ea72... udev: remove userspace firmware loading support
          PAM modules dir:         ${with_pamlibdir}
          PAM configuration dir:   ${with_pamconfdir}
          D-Bus policy dir:        ${with_dbuspolicydir}
-- 
2.6.4


