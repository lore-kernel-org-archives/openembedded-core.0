Received: from mail-wi0-f176.google.com ([209.85.212.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UAK4s-0006XZ-8c
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 13:56:27 +0100
Received: by mail-wi0-f176.google.com with SMTP id hm14so4780143wib.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2013 04:39:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=OZsh/cRe/t/b4s0eY8JqLzo3AhNCoyrZ7mObmHFS/lE=;
	b=T7hL5bpTh4xpmCBOKkTdlUuTdeNymbTaOS1ciLLu/LpCgVlfzjCosc/g7iYq1Csh3A
	DPKNDjuYQmaMoXEUDIIT+tiSH1/Jc/1vofubn81+rOcMNgN56zxVvUVd1zEEqQZZzeOn
	YCxD+WkGZ9cDZIq9rxyTvyl9qp5jbmkdHri07JH32+EA9TxcjMHcaU8CP48EbmTNqgJk
	a6BPQbZDglS+G5XcuyNqumgHR9C5NT4cz3h9GxbQxQmvTDDc5QoAgUiOPb/ID5vo59j3
	WvCIJM6NzAvnwUBOWW09zCrZ89tEcfql6I6FhB8jydfqvykBBMEtOpgYw+xessKui4Km
	nCXg==
X-Received: by 10.180.72.148 with SMTP id d20mr18898646wiv.31.1361882395378;
	Tue, 26 Feb 2013 04:39:55 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id ay10sm20864220wib.3.2013.02.26.04.39.54
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 26 Feb 2013 04:39:54 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Feb 2013 12:37:30 +0000
Message-Id: <1361882250-8266-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1361882250-8266-1-git-send-email-ross.burton@intel.com>
References: <1361882250-8266-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkF5kNwRk9eRKLZUNWBnJXbMOOwoM58eWC29yYRaEGjWcbcf3jciX/hwtg3slzrBTm7/PW6
Subject: [PATCH 2/2] weston: recommend some reasonable fonts so the terminal works
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
X-List-Received-Date: Tue, 26 Feb 2013 12:56:32 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/wayland/weston_1.0.3.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/wayland/weston_1.0.3.bb b/meta/recipes-graphics/wayland/weston_1.0.3.bb
index c7b02d4..ca8675c 100644
--- a/meta/recipes-graphics/wayland/weston_1.0.3.bb
+++ b/meta/recipes-graphics/wayland/weston_1.0.3.bb
@@ -52,6 +52,7 @@ do_install_append() {
 FILES_${PN} += "${datadir}/applications ${datadir}/icons"
 
 RDEPENDS_${PN} += "xkeyboard-config"
+RRECOMMENDS_${PN} = "liberation-fonts"
 
 # Add a group for weston-launch, a setuid helper
 USERADD_PACKAGES = "${PN}"
-- 
1.7.10.4



