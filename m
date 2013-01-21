Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TxM5S-0004JZ-OE
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Jan 2013 19:27:16 +0100
Received: from mail-bk0-f71.google.com ([209.85.214.71])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 21 Jan 2013 10:11:29 -0800
Received: by mail-bk0-f71.google.com with SMTP id jm19so6949375bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2013 10:11:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references:x-gm-message-state;
	bh=woCAIaVHLst6ZoDIZlMmPgMX5t6XIcy9NL83U+YWJAc=;
	b=Xkf8z3mn3qw716lrPL7/im0dCCZm5h4hZeVmoxO77h6saeRmKL3b8tkSGSz93QgsTB
	6AO+CJ3Odhge+or4WGPeGqZuMY8zFHMZhiPCujJ5TxnciDhPDNtACbr6JWzgk66eOa8A
	EPTF/OSdMF7Y8H8sa9lknhtjQIwJtKk+2hJwUq5UN03SEBehu5w9MGijyUcyh8L71w5t
	8/mtbD13m/s5cp37TIbZ8OfJkjxbmf4AFPYjBE04TtzQBli+6uSQFeJ0yaDmMHJ9LKV9
	nZJIN+8osah1s+70kafdMCN4qNb+WJb1WV3LztQe7/fwvK24H8qgijJXJzYumkaxkAfL
	KaNg==
X-Received: by 10.180.77.35 with SMTP id p3mr16932064wiw.18.1358791887299;
	Mon, 21 Jan 2013 10:11:27 -0800 (PST)
X-Received: by 10.180.77.35 with SMTP id p3mr16932052wiw.18.1358791887140;
	Mon, 21 Jan 2013 10:11:27 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id t17sm19814796wiv.6.2013.01.21.10.11.25
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 21 Jan 2013 10:11:26 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Jan 2013 18:09:21 +0000
Message-Id: <0d1c6df01c4757e227008fc1dee37f225354ebf0.1358791697.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <f386eed9181846f0e51aff0f128fc52291106b35.1358791697.git.ross.burton@intel.com>
References: <f386eed9181846f0e51aff0f128fc52291106b35.1358791697.git.ross.burton@intel.com>
In-Reply-To: <cover.1358791697.git.ross.burton@intel.com>
References: <cover.1358791697.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnfAM4h4V3IptUIcsP0A2WqkOoxs0zUsAQ/0XpUI5Qbdjra9VqvypWB3ySlxGsk5qup8tFlqg1KWG+cTHUrUyyJZ8uCyXjRzZQmucwPlDhQTGAsYZ1Jx7urd7WidIitIjKQMiSyQSzxV1/cLrYE2310+PrqFKY723rA/fe03w8vZ3/Eo3V+y+I/S4beKUrdLSHWJvw2
Subject: [PATCH 4/4] systemd: remove unused SERIAL_CONSOLE variable
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
X-List-Received-Date: Mon, 21 Jan 2013 18:27:18 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd_196.bb |    2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_196.bb b/meta/recipes-core/systemd/systemd_196.bb
index 5242b5a..a78a8a6 100644
--- a/meta/recipes-core/systemd/systemd_196.bb
+++ b/meta/recipes-core/systemd/systemd_196.bb
@@ -11,8 +11,6 @@ PROVIDES = "udev"
 DEPENDS = "xz kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup tcp-wrappers usbutils glib-2.0 libgcrypt"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
-SERIAL_CONSOLE ?= "115200 /dev/ttyS0"
-
 SECTION = "base/shell"
 
 inherit gtk-doc useradd pkgconfig autotools perlnative
-- 
1.7.10.4



