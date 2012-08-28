Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T6Fgr-0006Ki-50
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Aug 2012 08:54:21 +0200
Received: by eekb57 with SMTP id b57so1416465eek.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2012 23:42:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=L3sHUFvC/LAUMYOR/hXCaBoKpm8LaigbJPUePFpsn9w=;
	b=HKc2aDd3YdNNvYKjrPeVO0bjgCgimxsVLGswefZwerrLhFTUvL1AI+LzfJ43pb7Lnj
	W6PjN7oiLNloRgzVGbRWReXUOomoTRj8O0Kd6tBhPpqB9m9J6aZZJcD8yjOqQthZ4luf
	d+TQZxc44scbMpHSyWirtmfmmldelAfoZi7FlVkLuirwy6DQo00s+MSHO3IDVB5Atotb
	RCTBs/jc16ZyPWneQvTVtDUb9uBWVwaTfiYbOGy5ojCSWavp3/sFBPGiFS3SjT/xbl/4
	Ltpc1UrAxepBUy+zmogM5drRy6X7wrAgd3qqPxURMf25mujZvZkRV/Om/OS7YbbGPb3M
	8mpw==
Received: by 10.14.204.72 with SMTP id g48mr20724208eeo.45.1346136128932;
	Mon, 27 Aug 2012 23:42:08 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id k41sm58207183eep.13.2012.08.27.23.42.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 27 Aug 2012 23:42:07 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Aug 2012 08:41:38 +0200
Message-Id: <1346136108-13062-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQlPmEAMB/d5621HMhLjTiUaPXD6hJz1oQMqx3+dCyKTRkGDgpzLY3N6ygyO+qNoQ+QtQFqS
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: [for-denzil][meta-oe][PATCH 01/11] xz: updated to version 5.1.1alpha
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
X-List-Received-Date: Tue, 28 Aug 2012 06:54:21 -0000

From: Valentin Popa <valentin.popa@intel.com>

The licenses are the same, only some white spaces added/removed.

Signed-off-by: Valentin Popa <valentin.popa@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../xz/{xz_5.0.3.bb => xz_5.1.1alpha.bb}           |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-extended/xz/{xz_5.0.3.bb => xz_5.1.1alpha.bb} (72%)

diff --git a/meta/recipes-extended/xz/xz_5.0.3.bb b/meta/recipes-extended/xz/xz_5.1.1alpha.bb
similarity index 72%
rename from meta/recipes-extended/xz/xz_5.0.3.bb
rename to meta/recipes-extended/xz/xz_5.1.1alpha.bb
index e8f96b6..7fa7177 100644
--- a/meta/recipes-extended/xz/xz_5.0.3.bb
+++ b/meta/recipes-extended/xz/xz_5.1.1alpha.bb
@@ -4,17 +4,17 @@ SECTION = "base"
 
 LICENSE = "GPLv2+ & GPLv3+ & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c475b6c7dca236740ace4bba553e8e1c \
-                    file://COPYING.GPLv2;md5=751419260aa954499f7abaabaa882bbe \
+                    file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://COPYING.LGPLv2.1;md5=fbc093901857fcd118f065f900982c24 \
+                    file://COPYING.LGPLv2.1;md5=4fbd65380cdd255951079008b364516c \
                     file://lib/getopt.c;endline=23;md5=2069b0ee710572c03bb3114e4532cd84 "
 
 SRC_URI = "http://tukaani.org/xz/xz-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "fefe52f9ecd521de2a8ce38c21a27574"
-SRC_URI[sha256sum] = "10eb4df72dffb2fb14c3d2d82b450e72282ffcb9ee3908a8e5b392b8f09681bf"
+SRC_URI[md5sum] = "bb24436fa12780808e1c142980484104"
+SRC_URI[sha256sum] = "54e59a83690a4a0ec88a7d7c3bdef90c6b196c892a93463863c71c24fe87951a"
 
-PR = "r1"
+PR = "r0"
 
 inherit autotools gettext
 
-- 
1.7.7.6



