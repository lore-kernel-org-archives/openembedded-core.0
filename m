Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 84F8D6FFFE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Dec 2015 10:53:19 +0000 (UTC)
Received: by wmec201 with SMTP id c201so24492043wme.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Dec 2015 02:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=d4I29XO+FeZHSLzDVZXDriYG4vncIhp16UPbXXbGIa0=;
	b=yDjs/RY1sSCZDAzjngL33R90q+reGNm32IyWeTlGSwnVd8z037lp8+vXZm0/yuLbnj
	ISZrg4uczS5zckcYBWakWmU86dmsOseykij1LUH/4eAGGiPbixUy0vQddXvmt4pqYTkX
	2MWPxjAHayUQ2ExocupWXn9stvBoUAXI3HqbUVbPLPR7RFZiFLtCrzwFUEWBzMs9Z4fn
	ANNdBbcjH3khH7KZPiuERkd04cnDMelXFyNejCIfN3KBgbj7NXPzPVex2gQg/rcQ7bsb
	kZIorfkKfYEUoZrHbulaRvrU2e06BNZ+IYxFw4MkDy4HrqCe14n0ca1uz3s4tVcZ0zBV
	13/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=d4I29XO+FeZHSLzDVZXDriYG4vncIhp16UPbXXbGIa0=;
	b=T1XFqEZGFRnospV+/nShze36ZKLLWN+taqVE6xjBRDg2Y3F3ifwoj5FzqfC2vrK72N
	K/24LUaUxEX9SqeUNlO7a5d9t5cxm06+UG1PGqYqcRGBIHZ52xPxhC51NtMO1672Dgez
	5Ec44sZkgtgAe8DIrc2hMWqYv/wbxfQBB3WJpnwgGnYZ3XucWrs/l9c9vxMU0UY09UJ5
	A7mfp5k43SJuwiQxz0n+7PibQicsQOnOAEY9gEhwKH2xuM7MK9y6+WSD93rqXTDL/mKT
	Llato3k96EFWKnK7S5O1NQV7wOCf0a9KCwZcySWZPULXE4Ri+pa2wdPaSzpyNiYWNpHe
	bLFw==
X-Gm-Message-State: ALoCoQkiCmztGZ9b0+sTwQOn8QmC+4Bg1e9rr9AfAVXGGZufmOUpPxJ9IN+TlwdGEVRdUoUGeOWvkWfaeS6nIPTKRco125PXjw==
X-Received: by 10.28.224.86 with SMTP id x83mr3994334wmg.36.1449571999816;
	Tue, 08 Dec 2015 02:53:19 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id lx4sm2444025wjb.5.2015.12.08.02.53.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Dec 2015 02:53:19 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Dec 2015 10:53:16 +0000
Message-Id: <1449571996-16060-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1449571996-16060-1-git-send-email-ross.burton@intel.com>
References: <1449571996-16060-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] sudo: remove libdir INSANE_SKIP
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
X-List-Received-Date: Tue, 08 Dec 2015 10:53:19 -0000

Now that the libdir check allows libraries in libexecdir, remove INSANE_SKIP.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/sudo/sudo.inc | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index 48ed436..a25876b 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -38,8 +38,3 @@ do_compile_prepend () {
 do_install_prepend (){
 	mkdir -p ${D}/${localstatedir}/lib
 }
-
-# Sudo insists on putting libraries into libexecdir
-INSANE_SKIP_${PN} += "libdir"
-INSANE_SKIP_${PN}-dev += "libdir"
-INSANE_SKIP_${PN}-dbg += "libdir"
-- 
2.1.4


