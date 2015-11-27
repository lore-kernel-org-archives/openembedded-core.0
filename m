Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id C240F6012A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 15:39:55 +0000 (UTC)
Received: by wmec201 with SMTP id c201so62742761wme.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 07:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=PGmu3xyZA0jVcU5pvkof4vpTqwz9wjkQVYVHP5Haofw=;
	b=xsN7GWl/fOtA0dRZO7dXfZkesbdWKUJD4VZ0ktzj2aUSuDzzoMDzigKSKg0Pb3VYoC
	HYGITqjolP2HDpn6AntkfWOulEvTRyFkfzS/LeeHbgIH+JAuSXGytFMurNwau0QamT5K
	R4fSBavXkywF7JCbTdO3xcrqHMk3bpPhSEezp5YFF2ZHicFhvFK0G01+XVeYY3nRMuQi
	YVzoZFBNj15CNyJp+VY2nr+OrFCs+P9+CGYnzrCJ1z2SSjrXS0TA5qW8wkImqklyVmAh
	oOnWXSp0S31D6TMhtHO8+HZDMclQ9pHUJO56RWt2lf5K4ZHsWaQVz86Xd4bGeSTI0uw/
	rwtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=PGmu3xyZA0jVcU5pvkof4vpTqwz9wjkQVYVHP5Haofw=;
	b=ejbRfKi/KIYYJBCx1d/H+3Yjr5qGo0CFIhoCysd5DW5M3t3NzHbP7LGIIYhqLSpzdr
	imXkEnA6sxJ8jZm/UEJFWR5t01EhLf16yiOa+3GqprWTPYWueEjXXaDYG0vdH1rred83
	aO+KFuCcAheSPkyBPKrudRh/34WavLNfdjZMjt7StkAwmPgdmxrEKM2OCeYoh29njC0R
	AOGUkLbZXi9cRgAgF+9RyB+3rid6quSqC80JC2KtQrrNQmzpWibLGNCuUQqfXFT2WaIV
	kSsMuirTrreMHQIVcZkT6MJdwHMFNMKy/uEmxLsBqccGmIbG0Fj/01pqkG2p2C1g3j7i
	2U5w==
X-Gm-Message-State: ALoCoQkww2du3RmloIFqv58xT4t9ZI8gBUUBFoqreTRXkHrLcpI90kCZf0aCvQ6okzmFOjfUAmN0
X-Received: by 10.194.93.164 with SMTP id cv4mr55739272wjb.43.1448638795504;
	Fri, 27 Nov 2015 07:39:55 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id 186sm8026231wmv.9.2015.11.27.07.39.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 Nov 2015 07:39:55 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Nov 2015 15:31:07 +0000
Message-Id: <1448638267-2739-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] qemu: add PACKAGECONFIG stanza for bzip2
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
X-List-Received-Date: Fri, 27 Nov 2015 15:39:57 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index abbace8..c856abe 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -123,6 +123,7 @@ PACKAGECONFIG[glx] = "--enable-opengl,--disable-opengl,mesa"
 PACKAGECONFIG[lzo] = "--enable-lzo,--disable-lzo,lzo"
 PACKAGECONFIG[numa] = "--enable-numa,--disable-numa,numactl"
 PACKAGECONFIG[gnutls] = "--enable-gnutls,--disable-gnutls,gnutls"
+PACKAGECONFIG[bzip2] = "--enable-bzip2,--disable-bzip2,bzip2"
 
 EXTRA_OECONF += "${@bb.utils.contains('PACKAGECONFIG', 'alsa', '--audio-drv-list=oss,alsa', '', d)}"
 
-- 
2.1.4


