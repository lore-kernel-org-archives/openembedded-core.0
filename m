Received: from mail-we0-f180.google.com ([74.125.82.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UKXOA-000787-NG
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 18:10:23 +0100
Received: by mail-we0-f180.google.com with SMTP id r5so3833045wey.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2013 09:53:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=e8ZEWYoOZ3WlPAlXi6JhfW0JVxjWDPBxRQhxsMnlJOU=;
	b=RXbb8jRvA7BCpPj7zED655FVH12mMzFLeHy147Y0EGrOl2hitODplTC+b/xBTafemI
	9Zm5L1xFhiCDSSPzzzqswbnzQz7l/7q07osqVC3glJNfVC0PJUuJV0eeHYMv610F51mL
	gnbet0un1k12YBMvdLKC1stKzhRvsiCsSHbzemqlxKcSRVdS/MpVMDKG4O2kf27fx+WO
	SBAOZF6rQ1cp5dibKs9g/a1SQHV50b4Q/im4BdnD4wott3n0iXrakwYb8THuSV87A53g
	Hxn5wFvoC2Xr2mz01D+Q4Hod/k3VsscX6KHvLdLaqOA1M5Kl6CRwTteXsaXNCfX3XLbm
	RkOA==
X-Received: by 10.180.108.106 with SMTP id hj10mr4629947wib.0.1364316803083;
	Tue, 26 Mar 2013 09:53:23 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id bk1sm4522670wib.2.2013.03.26.09.53.21
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 26 Mar 2013 09:53:22 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Mar 2013 16:50:13 +0000
Message-Id: <83bd61d516d5596447eb04e730a187de93a27657.1364316412.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1364316411.git.ross.burton@intel.com>
References: <cover.1364316411.git.ross.burton@intel.com>
In-Reply-To: <cover.1364316411.git.ross.burton@intel.com>
References: <cover.1364316411.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmHxstLnukcpmK33lecIDsL0wPIhQcmeBGS66Z0sUjJDmbq/h4WdUFiNeMI6M/louEk4C4V
Subject: [PATCH 15/24] default-distrovars: don't add INITMAN to DISTRO_FEATURES and DISTRO_FEATURES_BACKFILL
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
X-List-Received-Date: Tue, 26 Mar 2013 17:10:29 -0000

DISTRO_FEATURES_INITMAN is going away as it's not useful in a hybrid init script
environment.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/distro/include/default-distrovars.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index f0fec2a..eafbcc2 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -18,7 +18,7 @@ DISTRO_FEATURES_LIBC_DEFAULT ?= "ipv4 ipv6 libc-backtrace libc-big-macros libc-b
 DISTRO_FEATURES_LIBC ?= "${DISTRO_FEATURES_LIBC_DEFAULT}"
 DISTRO_FEATURES_LIBC_class-nativesdk = "${DISTRO_FEATURES_LIBC_DEFAULT}"
 DISTRO_FEATURES_INITMAN ?= "sysvinit"
-DISTRO_FEATURES ?= "alsa argp bluetooth ext2 irda largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11 ${DISTRO_FEATURES_LIBC} ${DISTRO_FEATURES_INITMAN}"
+DISTRO_FEATURES ?= "alsa argp bluetooth ext2 irda largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11 ${DISTRO_FEATURES_LIBC}"
 
 IMAGE_FEATURES ?= ""
 
-- 
1.7.10.4



