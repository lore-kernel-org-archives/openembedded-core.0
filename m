Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UJ6Me-0000K6-3Q
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Mar 2013 19:07:02 +0100
Received: by mail-wi0-f177.google.com with SMTP id hm14so4668738wib.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Mar 2013 10:49:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=e8ZEWYoOZ3WlPAlXi6JhfW0JVxjWDPBxRQhxsMnlJOU=;
	b=dRC1UmF9f3xPP5sM23CXoD705E9tnnqclJ4J6O5wHow5NElV0U2sBCJk5TPL8mry9v
	3w9YkQbSfIFkZZE2xvMd6rQe9WyK/naN5DglUsCyxvidvH9yhePiGouaTQjjdr+ATxdV
	EwpBUPJ5QGLAht+JT09TtVCKcL70GiQqTmLVHAqjYNBBA+AFW7c5GShVbLZjkp72hP+Z
	k9BWneuF8vcwmnlpin0vaX+60+NuLI0R7qDNc8/ODIjS2vzBkNDURfI/kUtqbG+I1+MT
	eUJr6+QQ9Ghy5+/6PwpbSAI7GJ0keTST6+e4ARZzd6S1VioQ0tGgEw81UHz2TqhiinkB
	df/w==
X-Received: by 10.195.12.133 with SMTP id eq5mr4663822wjd.52.1363974110362;
	Fri, 22 Mar 2013 10:41:50 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id dm9sm12260880wib.3.2013.03.22.10.41.49
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 22 Mar 2013 10:41:49 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Mar 2013 17:38:35 +0000
Message-Id: <e6ef80ed83d8d6464ef59144c0e8f38b743c16d1.1363973088.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1363973088.git.ross.burton@intel.com>
References: <cover.1363973088.git.ross.burton@intel.com>
In-Reply-To: <cover.1363973088.git.ross.burton@intel.com>
References: <cover.1363973088.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkPB+9eL6+Nq4NyYLHIc5iipLx5gSWDqTOeJAELyGFw5gzkGJLxpaP3y2vMBbyP/sAjMC3z
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 15/22] default-distrovars: don't add INITMAN to DISTRO_FEATURES and DISTRO_FEATURES_BACKFILL
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
X-List-Received-Date: Fri, 22 Mar 2013 18:07:23 -0000

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



