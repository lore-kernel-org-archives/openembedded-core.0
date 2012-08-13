Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1T0yEN-0007nq-Ok
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Aug 2012 19:15:07 +0200
Received: by wgbdr1 with SMTP id dr1so3149452wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2012 10:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=wXIM1I7zDyubDsQvEfHV64ehLLp6rgQmY5vHWbgA2Jw=;
	b=fqApSh1d1msbTzGa+075NNuXVO1R10VD/2hs8laqoHXehc1MIfyEE5rIu3kZL+me/y
	KtlB8e5H/BjrRXsL2kbSCS25spq/XpYGp/yki3u6d6L9on2tMMxk6jSf3xIW4U9PcCWr
	ARkzNy4QHXHmpSgOI1XC0AjFae2xNN2mU298FMVY2/FTyM5+ymVyupNowi7NA1LuQxCT
	nlWdft9k+Z48mmvHcu67fA5EsO2cklV0INm/A1xP4ZgcXl5pDboMzfyMA1Ujbnl+s3fJ
	7k6qIyyqY7pBSfJWyDIQdEvbk4aoo1YVAlvVQVfwgXKaVhra+KUQ4arar/Jdtfp3zSbg
	M7WA==
Received: by 10.180.107.2 with SMTP id gy2mr20065800wib.2.1344877393982;
	Mon, 13 Aug 2012 10:03:13 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-112.unitymediagroup.de.
	[95.222.160.112])
	by mx.google.com with ESMTPS id z11sm25269035wiv.10.2012.08.13.10.03.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Aug 2012 10:03:13 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Aug 2012 19:02:39 +0200
Message-Id: <1344877359-12997-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [PATCH] wpa-supplicant: fix paths in dbus/systemd *.service files
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
X-List-Received-Date: Mon, 13 Aug 2012 17:15:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../wpa-supplicant/wpa-supplicant-1.0.inc          |    2 ++
 .../wpa-supplicant/wpa-supplicant_1.0.bb           |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0.inc b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0.inc
index 0c18b30..873e923 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0.inc
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0.inc
@@ -29,6 +29,8 @@ do_configure () {
 }
 
 export EXTRA_CFLAGS = "${CFLAGS}"
+export BINDIR = "${sbindir}"
+
 do_compile () {
 	unset CFLAGS CPPFLAGS CXXFLAGS
 	oe_runmake
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bb
index 8ede3e5..a60cd86 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bb
@@ -1,6 +1,6 @@
 require wpa-supplicant-1.0.inc
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI[md5sum] = "8650f6aa23646ef634402552d0669640"
 SRC_URI[sha256sum] = "91d41d473a5aafa2e25dd6577ebda975c4d4a3188850a53e31feaf7c04482b9c"
-- 
1.7.6.5



