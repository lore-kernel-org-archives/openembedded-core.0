Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UJ6Lc-0000E9-U3
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Mar 2013 19:06:16 +0100
Received: by mail-we0-f175.google.com with SMTP id t11so1397681wey.34
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Mar 2013 10:48:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=5TM3cRsQb/ZWMebUIPwjqpuocbizwrBq6ffbLuppizc=;
	b=EGBcKR/2pmCTFPhk8/USra3g9WL3d10JZz0VjBqN0E5qei1ovbH5vpsW/GF+3QOCdq
	ZB/8VsmxtPkuOck9jqJ5dxdNADMeygu0EuyI2WtKW5AV45MRu2Kn/lgksqMdaUugjF6a
	IiTLAVPGujK14gfIV1RM9Bc2ONg71ZgMqijH9kR5m+t889C56enG56Jdg0evCqOyykZ5
	pTuHG0Ed2Z3LnV05OoCegcp0raWebYWzBXezuYtlRwGgp0kfNoWIz7I/Tj01fDOX+iXH
	VLPGiGJKluiByVL5rLoeTief4bvB0rv/gkQo0RsyGiAP/9C5wcNZifygahrDZS/U2K89
	zBAw==
X-Received: by 10.180.13.34 with SMTP id e2mr12982927wic.29.1363974114161;
	Fri, 22 Mar 2013 10:41:54 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id dm9sm12260880wib.3.2013.03.22.10.41.52
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 22 Mar 2013 10:41:53 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Mar 2013 17:38:38 +0000
Message-Id: <a7a7fc34777c0b8cfe62b6ac337418edec5bcbe9.1363973088.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1363973088.git.ross.burton@intel.com>
References: <cover.1363973088.git.ross.burton@intel.com>
In-Reply-To: <cover.1363973088.git.ross.burton@intel.com>
References: <cover.1363973088.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlvF+5WO+StZJ/7fkMHH9lfddBiwwIbRh7XufFiQSh1m7aK0sbVJkFma6++rOMen+zqQ4A7
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 18/22] default-distrovars: remove obsolete DISTRO_FEATURES_INITMAN reference
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
X-List-Received-Date: Fri, 22 Mar 2013 18:06:20 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/distro/include/default-distrovars.inc |    1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index eafbcc2..b0586d6 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -17,7 +17,6 @@ DISTRO_FEATURES_LIBC_DEFAULT ?= "ipv4 ipv6 libc-backtrace libc-big-macros libc-b
 					libc-posix-wchar-io"
 DISTRO_FEATURES_LIBC ?= "${DISTRO_FEATURES_LIBC_DEFAULT}"
 DISTRO_FEATURES_LIBC_class-nativesdk = "${DISTRO_FEATURES_LIBC_DEFAULT}"
-DISTRO_FEATURES_INITMAN ?= "sysvinit"
 DISTRO_FEATURES ?= "alsa argp bluetooth ext2 irda largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11 ${DISTRO_FEATURES_LIBC}"
 
 IMAGE_FEATURES ?= ""
-- 
1.7.10.4



