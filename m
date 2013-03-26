Received: from mail-we0-f170.google.com ([74.125.82.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UKXOD-00078C-AD
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 18:10:25 +0100
Received: by mail-we0-f170.google.com with SMTP id z2so5079390wey.29
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2013 09:53:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=5TM3cRsQb/ZWMebUIPwjqpuocbizwrBq6ffbLuppizc=;
	b=HfPFMS2qFfXubZVw6bRWneDETdQwFCLTJqy/3e9YgoFszuweJuPGWJUc56w06p8IAS
	w84UZr6StOI+R0GddPMx9yxXkxZRnNMVhgLho3AVQnRoq0+Njj1r7CRJRyWjOVt0Jk+/
	V9piqHTvm1EQcPSfSAoUWRKkv+SbA+6+J71yL6COOjU4VYp78xuEGtqE0+QGUKYLoaCe
	/4OvhX8zzNhQ9VZQM5J5elC5e6s/uGgAf9/6+oyYcT7g3tGGdDS5o2bRB9gpoh/sR8RF
	OvO++hkhPukZhkj17HCXf6dn4v1x91lnc23rXv5jlXeF2X7BQvnhWOOAyrK6aBdbg9+G
	GRZw==
X-Received: by 10.181.11.164 with SMTP id ej4mr4545798wid.29.1364316805709;
	Tue, 26 Mar 2013 09:53:25 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id bk1sm4522670wib.2.2013.03.26.09.53.24
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 26 Mar 2013 09:53:25 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Mar 2013 16:50:15 +0000
Message-Id: <c61d3f981757ebacb4654fef5635248a2aeb6ed6.1364316412.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1364316411.git.ross.burton@intel.com>
References: <cover.1364316411.git.ross.burton@intel.com>
In-Reply-To: <cover.1364316411.git.ross.burton@intel.com>
References: <cover.1364316411.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQl68ilhihJLrOoMbOp7hzSEm0ylypucCBjwKHGIGFWvVInCAx+W5KntLgwU+Hh0qenlMr/f
Subject: [PATCH 17/24] default-distrovars: remove obsolete DISTRO_FEATURES_INITMAN reference
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
X-List-Received-Date: Tue, 26 Mar 2013 17:10:35 -0000

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



