Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TIixj-00044j-Ep
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Oct 2012 18:35:21 +0200
Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 01 Oct 2012 09:22:07 -0700
Received: by mail-wi0-f171.google.com with SMTP id hj13so2417703wib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Oct 2012 09:22:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=yFYVc5Beg2iDe45KE8kygXXk+flpoGvn0gmIevyKfQ0=;
	b=cYXLO43LvVKx3eJJxLgQPit4aEFAKEn62vjgF8VQ2cfjxW4/UFAy2qpvqN6ZYMK/cF
	XqBI6dU6vfG7YM8GC0DfLLfx3BQmu3mL1Etcbhd3k6xhD5xiPe3cpqOsailoA6SJNask
	wmmYnEQ0WtsOR3akKIGIEFY3vSY6yQ3im7MODXIxC8QvIhfAoYbcZ+D68CCCcO2cAS16
	X+VT3eV8iZ8b0rMInLg75nvzsji3b9gmZnC4GieOlLBfPACiKKYBcvSB0V0O+7MX8WMO
	oJhauQf5ZnqNuIg9P2/CEbqpQUixzHBYnBvWEEsqxSgM9iIZYkhXMFkkDUwC58JgrtMB
	OMdw==
Received: by 10.180.84.202 with SMTP id b10mr15755608wiz.13.1349108522312;
	Mon, 01 Oct 2012 09:22:02 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id ga2sm19364994wib.2.2012.10.01.09.22.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 01 Oct 2012 09:22:01 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Oct 2012 17:20:59 +0100
Message-Id: <1349108459-16408-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQlbI4okiu7Y53SxrokTKhau35qwrKxzPshBdPDmJOc3oRMFhDP6+H0mI7r17xV0O+hfSi4C
Subject: [PATCH] libpcap: add dependency on libnl
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
X-List-Received-Date: Mon, 01 Oct 2012 16:35:22 -0000

libpcap uses libnl on Linux to support sniffing mac80211 devices, which could be
useful.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/libpcap/libpcap.inc |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/libpcap/libpcap.inc b/meta/recipes-connectivity/libpcap/libpcap.inc
index 7d4e841..5381ef0 100644
--- a/meta/recipes-connectivity/libpcap/libpcap.inc
+++ b/meta/recipes-connectivity/libpcap/libpcap.inc
@@ -8,12 +8,12 @@ SECTION = "libs/network"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1d4b0366557951c84a94fabe3529f867 \
                     file://pcap.h;beginline=1;endline=34;md5=8d6cf7e17d5745010d633e30bc529ea9"
-DEPENDS = "flex-native bison-native"
+DEPENDS = "flex-native bison-native libnl"
 
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'bluetooth', 'bluetooth', '', d)}"
 PACKAGECONFIG[bluetooth] = "--enable-bluetooth,--disable-bluetooth,bluez4"
 
-INC_PR = "r2"
+INC_PR = "r3"
 
 SRC_URI = "http://www.tcpdump.org/release/libpcap-${PV}.tar.gz"
 
-- 
1.7.10



