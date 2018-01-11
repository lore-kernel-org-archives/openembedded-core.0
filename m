Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id D0E327878C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 16:30:32 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id 36so2748744wrh.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 08:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=vYqLycuq8f2f/2MQdomiWMfZkyFIkuUg0w5xf/85rNs=;
	b=kZxd9OpRVbuTJZxymVwmHNhwomEf6FIbgfxUWh44ZATd40hdmKUOSvuGTpIngLScrl
	Jqz63XYhduFQiFt5nudkzaX/fGjkhs5feQBRBryWJYPf2zeX4doEO2LCNN09zHyGjEsf
	6MetTaihdTQ/NlmBUgqgv4C/Cwzt3Czeu7nwghJkm8UWpbbXkBD1AZqWh+YVBVF/4Mo6
	W+HYmxUUNuW4+YEy4exk9soA9Up14aQynUCYNF9iIufyUhkEoY5p12ReNIVTqAs04nNs
	oP1xGnT57RNjyfm+xlfVAvj1nsaCXYrOKd1eoOrYev4oVR1zd581VgCB2CzdqecmSL7J
	Mxkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=vYqLycuq8f2f/2MQdomiWMfZkyFIkuUg0w5xf/85rNs=;
	b=putb5DtmK7E24oD8KG5vIAXaigTJt05QcXiOxcuWy431M4VnmrU/kIORSOLzBoNBYP
	lSYMOZq0+tB9V2s1ALiuH1YDWfK7bDyx+PfcY9tvv1gwFGIdn7vltWK2tWNxETZ8pogA
	VmxyhSLxVfQgbDsLgXkyG+5wH0LBKlbuWm2m0dq+37QJJ5Xdf8Vgd4TolwMvYrAzlF6f
	VApy/vMrcpTGXSWAr5T1Xz6leq3TekpKJaSOIxsNdXvXWZaEJo8EtOAz0Zq+AMIqKkAh
	k4mITrXw7jHQfGV9qaN6IW/JrKb7hvB/OI47USgldJaDPr5HmE2rgxF5kHgoycX27p1P
	9/XA==
X-Gm-Message-State: AKGB3mKMrs2+ShJkPMQj+XVQ+j+nC11ulHoo9H944b2cjAA19BRLkqHL
	H3TapOiYnZDu4y8sGn+SOaysElqa
X-Google-Smtp-Source: ACJfBovFfXL5gPQgJvxZvgTOei64eopsxO0e+W4ThQz8lgy953261aknYaK8fnO8VI+t+IFjmUrqqQ==
X-Received: by 10.223.145.41 with SMTP id j38mr19980768wrj.247.1515688233322; 
	Thu, 11 Jan 2018 08:30:33 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id o81sm804057wmo.24.2018.01.11.08.30.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Jan 2018 08:30:32 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Jan 2018 16:30:30 +0000
Message-Id: <20180111163030.24274-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] pax-utils: update SRC_URI
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
X-List-Received-Date: Thu, 11 Jan 2018 16:30:33 -0000

The gentoo.osuosl.org mirror doesn't store all versions of pax-utils, so use the
maintainers own mirror which stores them all.

This also means we can remove UPSTREAM_CHECK_URI as the defaults work now.

Thanks to Maxin John for the initial patch.

[ YOCTO #11559 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/pax-utils/pax-utils_1.2.2.bb | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/pax-utils/pax-utils_1.2.2.bb b/meta/recipes-devtools/pax-utils/pax-utils_1.2.2.bb
index c6c49e9b2d0..9635a5e7082 100644
--- a/meta/recipes-devtools/pax-utils/pax-utils_1.2.2.bb
+++ b/meta/recipes-devtools/pax-utils/pax-utils_1.2.2.bb
@@ -7,13 +7,9 @@ HOMEPAGE = "http://www.gentoo.org/proj/en/hardened/pax-utils.xml"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
 
-SRC_URI = "http://gentoo.osuosl.org/distfiles/pax-utils-${PV}.tar.xz \
-"
-
+SRC_URI = "https://dev.gentoo.org/~vapier/dist/pax-utils-${PV}.tar.xz"
 SRC_URI[md5sum] = "a580468318f0ff42edf4a8cd314cc942"
 SRC_URI[sha256sum] = "7f4a7f8db6b4743adde7582fa48992ad01776796fcde030683732f56221337d9"
-UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/p/pax-utils/"
-UPSTREAM_CHECK_REGEX = "pax-utils_(?P<pver>\d+(\.\d+)+)\.orig\.tar"
 
 RDEPENDS_${PN} += "bash"
 
-- 
2.11.0


