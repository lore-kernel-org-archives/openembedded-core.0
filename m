Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 12AA9760A3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 12:24:23 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id b205so65330477wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 04:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=paJEh6wStQZWZlxt+jrm5cZBoZPXsrY21GgV4W8tuyk=;
	b=yfwHN7I9iS188bTdLW5cjSvB/T8SmthYnRiBNatBMCzcQq/gGzJ4aCiehRvCpnfeo2
	6gR9qd9cVxy0DC+JPNuGMqFzuV98OIo1/UPiT7R21oRiFiGGBygdUWibPnHnLhJZxFp2
	VpPJnccYs+OrMw3jRIXFFyb+ZBhnCbWeCO/oA6S5rh6dHDVbBczXfWlQTvmRxQfiEwHm
	+3zOrYnorikqeaVHafvDcmkl3L/qXOunXfpbv3AC9syIbDUV3sY/Rw/OfVp1Cvd50LOi
	KQw1eolH0a2MHAq7u0rI5pFZ33Os7XnWQuyo8IqbIL4XDZWXk2V6MMEiv3XWqqKNmuIs
	zNJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=paJEh6wStQZWZlxt+jrm5cZBoZPXsrY21GgV4W8tuyk=;
	b=NWBjMdVitmGLzzIVIDKo1IP48yaiBdsUlVutDbwSJNK2r94L5kAW1pCjBClKd9fYDA
	+n6F7j9sNHl7Q8HoMCNbwVRuIGZedF3/MK4GqPi7HNAqQkEgMgu3SJ2DU6AdBpUeexEA
	dH/9XobVrg0/QNXGXo/qcQhM90o0deQl7NASFZ4UajLBsVu3S7EOAyvO/SHocUaXj35d
	orH+NQs+u5M1EbbupSg0+LkwZ7nWYCIqDYQiK7CyvbcwCi31OLyg22iR4Iqd2nUajkrJ
	coKPDhlWEKQWDSHTzmiP4wTHPoUAD9GV42W/iB/tAdETZRepBlOwgqez6rvMseKmoAKH
	1i8g==
X-Gm-Message-State: AG10YORR/nzGgndG2L4QNc0h2yXTjcqEYjmeG5zofraAA9w1MHoBmhq5epB64+P06MFJP5v3
X-Received: by 10.28.30.132 with SMTP id e126mr13233252wme.42.1455539064152;
	Mon, 15 Feb 2016 04:24:24 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	jc7sm25198553wjb.33.2016.02.15.04.24.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 15 Feb 2016 04:24:23 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Feb 2016 12:24:20 +0000
Message-Id: <1455539060-15714-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1455539060-15714-1-git-send-email-ross.burton@intel.com>
References: <1455539060-15714-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] dbus: update large file patch
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
X-List-Received-Date: Mon, 15 Feb 2016 12:24:24 -0000

Upstream has accepted this patch, so update the header and revise the patch to
reflect the form that was merged.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../dbus/dbus/0001-configure.ac-support-large-file-for-stat64.patch   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus/0001-configure.ac-support-large-file-for-stat64.patch b/meta/recipes-core/dbus/dbus/0001-configure.ac-support-large-file-for-stat64.patch
index bb73288..c6eac2b 100644
--- a/meta/recipes-core/dbus/dbus/0001-configure.ac-support-large-file-for-stat64.patch
+++ b/meta/recipes-core/dbus/dbus/0001-configure.ac-support-large-file-for-stat64.patch
@@ -27,7 +27,7 @@ In this situation, we should support large-file for stat64. Add marco
 AC_SYS_LARGEFILE to do the detection at configure time. It can be disabled
 by configuring with the `--disable-largefile' option.
 
-Upstream-Status: Submitted
+Upstream-Status: Backport
 
 Bug: https://bugs.freedesktop.org/show_bug.cgi?id=93545
 https://bugs.freedesktop.org/attachment.cgi?id=120747
@@ -44,8 +44,8 @@ index 82806ba..cb5a60b 100644
  AC_PROG_CC
  AM_PROG_CC_C_O
  AC_PROG_CXX
-+AC_SYS_LARGEFILE
  AC_USE_SYSTEM_EXTENSIONS
++AC_SYS_LARGEFILE
  AC_ISC_POSIX
  AC_HEADER_STDC
 -- 
-- 
2.7.0


