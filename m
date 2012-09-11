Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TBWBW-0001jA-Mz
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 21:31:47 +0200
Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 11 Sep 2012 12:19:16 -0700
Received: by mail-wg0-f43.google.com with SMTP id dr1so617826wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 12:19:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=IOozdJUs8c5v1YmcoI6by0OoVIfWe8ufuBrWEha29CE=;
	b=IzCj4EscASYFU/sOlDuTaX+7PItNMpnLzu2ZAmIh/+jGqJso1pKdZ5xUj5CSbJjBsV
	kQZEoYr8kZYt0xPzJK1grMF1+Fq36FPr8Cf3a49nBtojPkEEbW8jEz0mrUowfuD0cPU6
	K0dKB2WW8yNduTGonbVtpXIRmsO79cWjmf/E0DohoRrNYq+/HYsRkpk6nyKnRkaBqto5
	VRo01Cvvs+A8G795YbyTT5TpYk5cqcV8k1p+FJ8eMQJAskfEBLNVyTGy7UYqrqsKSpLW
	zbDT7VdLPQLOw3GVsFeC1n6qpZ6DwSmyoNIfXaUOMxeYz+e544X5amZM8jGeR4/Ja9V1
	ZilQ==
Received: by 10.216.139.15 with SMTP id b15mr10899007wej.169.1347391156834;
	Tue, 11 Sep 2012 12:19:16 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id t7sm5953150wix.6.2012.09.11.12.19.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Sep 2012 12:19:16 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Sep 2012 20:18:03 +0100
Message-Id: <1347391088-30390-13-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1347391088-30390-1-git-send-email-ross.burton@intel.com>
References: <1347391088-30390-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnX40Oplji7xShDzAlFq5CzCZoPT0ZgIVV48l5Pz3TEJkfonGRW3MTdVVmN9lEgmPlyrfgy
Subject: [RFC 13/18] libx11-trim: remove, it's the same as libx11 now
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
X-List-Received-Date: Tue, 11 Sep 2012 19:31:47 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-lib/libx11-trim_1.5.0.bb |   15 ---------------
 1 file changed, 15 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-trim_1.5.0.bb

diff --git a/meta/recipes-graphics/xorg-lib/libx11-trim_1.5.0.bb b/meta/recipes-graphics/xorg-lib/libx11-trim_1.5.0.bb
deleted file mode 100644
index 6619946..0000000
--- a/meta/recipes-graphics/xorg-lib/libx11-trim_1.5.0.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-require libx11.inc
-
-DESCRIPTION += " Support for XCMS is disabled in this version."
-
-PR = "${INC_PR}.0"
-
-SRC_URI += "file://x11_disable_makekeys.patch \
-            file://keysymdef_include.patch \
-            file://makekeys_crosscompile.patch"
-
-RPROVIDES_${PN}-dev = "libx11-dev"
-RPROVIDES_${PN}-locale = "libx11-locale"
-
-SRC_URI[md5sum] = "78b4b3bab4acbdf0abcfca30a8c70cc6"
-SRC_URI[sha256sum] = "c382efd7e92bfc3cef39a4b7f1ecf2744ba4414a705e3bc1e697f75502bd4d86"
-- 
1.7.10



