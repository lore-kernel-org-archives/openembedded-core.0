Received: from mail-pb0-f54.google.com ([209.85.160.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UF9HJ-0002tt-R5
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 21:25:04 +0100
Received: by mail-pb0-f54.google.com with SMTP id rr4so4144120pbb.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2013 13:08:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=563WaVs8yoQVAQdE3WY/dUuieY4+C+EvpkfKtwp1m70=;
	b=AKwMEkIxd2s7loWohBg/qn2WgCLaMbru+qO326y+K2dHE5LqcwL0K+ZH4II8abyyaC
	7C8neUDn9cg4JeyHRbgPXnfo16bawDYH8wrV8VW3JW611Fuldl+Xt9HaaIw8xU9yuXBM
	VX8zMy5Qe5KjdRYZuSRIZnmAt+Y/5cBgjN6T7MIDzQJq6PzFmVwihTHBPwcy4GV9AXoC
	ORwoWgHwq+nFyM8M9aqzkEXTA/dvcS8X6P7tsIZ4tO06WM+7yHUhkASBVxoLsCYlzMef
	KQyV8xQVCJEJgzBGKY53gFqFjcM9RfgpxW1rrlG9IEYLnGHvoiVcVioB2KlrpCxtNnZ4
	6vVA==
X-Received: by 10.68.202.3 with SMTP id ke3mr31179127pbc.98.1363032502411;
	Mon, 11 Mar 2013 13:08:22 -0700 (PDT)
Received: from flashheart.burtonini.com (or-67-237-97-32.sta.embarqhsd.net.
	[67.237.97.32])
	by mx.google.com with ESMTPS id eh5sm21700910pbc.44.2013.03.11.13.08.21
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Mar 2013 13:08:21 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Mar 2013 13:07:39 -0700
Message-Id: <ba7c15ae47ace8a15d97b4c58d2aa5b2ebb4c47a.1363031776.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1363031776.git.ross.burton@intel.com>
References: <cover.1363031776.git.ross.burton@intel.com>
In-Reply-To: <cover.1363031776.git.ross.burton@intel.com>
References: <cover.1363031776.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnIggFUchiaIVxEH+jYUA5DSgBmzK2Th44ZSgJJpU5TSse0LbpPHyP0JFYvRPKe8oINEjNy
Subject: [PATCH 9/9] default-distrovars: don't add DISTRO_FEATURES_INITMAN to DISTRO_FEATURES
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
X-List-Received-Date: Mon, 11 Mar 2013 20:25:39 -0000

It will be backfilled later, so don't add it to the default DISTRO_FEATURES.

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



