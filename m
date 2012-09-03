Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T8YBb-0007Zj-2F
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Sep 2012 17:03:35 +0200
Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 03 Sep 2012 07:51:12 -0700
Received: by wibhm2 with SMTP id hm2so3097562wib.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Sep 2012 07:51:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=pkTzb4TwWgbs6RZxUpT0HTGfFWgvbEMotzZC13Luh20=;
	b=nqttfPe6rGds0SzhnYb3Qru1EixnUhI4zVJ+hKROMsijuxwVvObvQZGeuGYfReMg9U
	QBOTH+fqkSXO08i4XCpchGRcpxeqGcZxVYFRfPqIdn1jJ/YQxYBqIhnLRIdaNQweo+Tk
	dLGOhVqga7+qEbz2A02YomPwQDIRURPUikA6WhOFF6bH0v+8grYQOB/ClF5jiD3dm52u
	UdIho5L4uPufgtGOrPh9QJrfnVs5lSVp9kI8BY1feZMD9JFQJFW2msmXaevc233tV9Zi
	pJxqBYOaaKxUHWRH6d2gEh/XfRMOFfSDXSTxSuqe+zPX5Q0H4XVzwTI5GgayqugLcm27
	o9LA==
Received: by 10.217.3.7 with SMTP id q7mr10634680wes.47.1346683870932;
	Mon, 03 Sep 2012 07:51:10 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id q4sm19322865wix.9.2012.09.03.07.51.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Sep 2012 07:51:09 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Sep 2012 15:50:26 +0100
Message-Id: <1346683826-32079-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQmiOfi761AnaMOPtOWdfyx510JuHUl/3YSd/YtC2xUoJfcT8kWkOzTUUNq3twrP6HpLE5oZ
Subject: [PATCH] xserver-xorg: remove HAL option, nothing uses HAL anymore
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Sep 2012 15:03:35 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc |    1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
index 738ccb3..404c488 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
@@ -120,7 +120,6 @@ EXTRA_OECONF += "--with-fop=no \
 "
 
 PACKAGECONFIG ??= "udev"
-PACKAGECONFIG[hal] = "--enable-config-hal,--disable-config-hal,,hal"
 PACKAGECONFIG[udev] = "--enable-config-udev,--disable-config-udev,udev"
 
 do_install_append () {
-- 
1.7.10



