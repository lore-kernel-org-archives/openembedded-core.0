Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id CF86678A50
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 17:21:16 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id u49so18087358wrc.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2018 09:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=/lMi3MMSFnFeJ8tF5nWRWbzpgTrOn7WZ6VgsRLvxsdA=;
	b=rNof830biut0ZGdM3vPusRylBGt1E473iCKli4t9O1Abc1oFMUIUBu8OuEfOUORdJn
	E8AGpsA6W8/0HtbMZfrqkvd3hyNvCAANxEP8YsTr0gyQd+3uC04xqxyW/429M4ZkM8Bv
	vsYqAqKbOcRdNDZ1lbQshqL+HT243ZDwctRTMG2KNOubb+vf5VGFumlJlH8BWODFB8bq
	u2svIm/z+KI8rWQSoH67rllESFRhi1izz+f1qqHJQDXHH/roEeAxyCMStavzuYGF5SD0
	1VG2PfzToglzeBckmaXiHEW7g0+ZqM1rMG/3KcB7pmojKnoCkVDgiNbJXarGeBd4qmuq
	WDoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=/lMi3MMSFnFeJ8tF5nWRWbzpgTrOn7WZ6VgsRLvxsdA=;
	b=LfB5uJNdXEhuPOo6XYMW7DKkF78GdNH1nLekr2T0g8jui8W71LLKz9G5n9mWoMpwdT
	oBX7TKaXJqpqJbHbfcFPeZVMkR01aoKpfOwPcALwGi5dde0/Fo4gm1k6GY4Lu4ksqrUI
	Pxy2pcnRpbKchqab97XY0/IMinTPikOtnhuPlAqlzWQMmFIfofDIGLO5BN/41dQXEs2Z
	zqhzjusZ4W8YxTFXi6WDLj0aGADBUjMjqrKGoHQMj4Xtjm+zAIR8GDVRTqDatPmFwnrC
	dClcJThcLu269yw7OkupWS/fVgRpyHw3fBvQoGEXTxaBUiTJGRBd9N2oAjSPzprzrAbM
	kMfA==
X-Gm-Message-State: APf1xPDHLj1oCAwAICGBg5pAPoa1ereOwlpQRafUj7g4zIXK+IbjrFPl
	dJjU0BVvHLtMZFD1hG1m3easxHXJ
X-Google-Smtp-Source: AG47ELuG1nkZr9UXUhXijBkBiYdcgh+gMAruA/hJMLY94eXWP5nseoGnLML4mK+ExcD6RVas/5NvNg==
X-Received: by 10.223.157.135 with SMTP id p7mr13163774wre.33.1520270477734;
	Mon, 05 Mar 2018 09:21:17 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	m190sm10082047wmb.6.2018.03.05.09.21.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 09:21:17 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Mar 2018 17:20:42 +0000
Message-Id: <20180305172046.21729-25-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180305172046.21729-1-ross.burton@intel.com>
References: <20180305172046.21729-1-ross.burton@intel.com>
Subject: [PATCH 25/29] libxcb: refresh patches
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
X-List-Received-Date: Mon, 05 Mar 2018 17:21:17 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../recipes-graphics/xorg-lib/libxcb/disable-check.patch | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libxcb/disable-check.patch b/meta/recipes-graphics/xorg-lib/libxcb/disable-check.patch
index 5641c0fe950..c0efbdc213c 100644
--- a/meta/recipes-graphics/xorg-lib/libxcb/disable-check.patch
+++ b/meta/recipes-graphics/xorg-lib/libxcb/disable-check.patch
@@ -9,17 +9,17 @@ Upstream-Status: Inappropriate
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
 
-diff --git a/configure.ac b/configure.ac
-index 6d7c9a5..22cceb9 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -21,7 +21,8 @@ AC_USE_SYSTEM_EXTENSIONS
- 
- AM_PATH_PYTHON([2.6])
+Index: libxcb-1.12/configure.ac
+===================================================================
+--- libxcb-1.12.orig/configure.ac
++++ libxcb-1.12/configure.ac
+@@ -36,7 +36,8 @@ if test x"$HAVE_DOT" = xno; then
+     AC_MSG_WARN([dot not found - doxygen targets will be skipped])
+ fi
  
 -PKG_CHECK_MODULES(CHECK, [check >= 0.9.4], [HAVE_CHECK=yes], [HAVE_CHECK=no])
 +dnl PKG_CHECK_MODULES(CHECK, [check >= 0.9.4], [HAVE_CHECK=yes], [HAVE_CHECK=no])
 +HAVE_CHECK=no
  AM_CONDITIONAL(HAVE_CHECK, test x$HAVE_CHECK = xyes)
  
- AC_CONFIG_HEADERS([src/config.h])
+ XSLTPROC=no
-- 
2.11.0


