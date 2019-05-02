Return-Path: <liu.ming50@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 481797D731
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 May 2019 19:43:36 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id f23so3334165ljc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 May 2019 12:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=m+YgBcinbjK/hPLQhddKLW8diOHW8WNVSRGz0eTWYU8=;
	b=FSoRUdC2rRohW/3m0Tugbyhj3cso7ODbjA0nj1Nyd+hZZX+OFEutNFdEwJpqWPjU3g
	31v4/bUsb4rZ8uy2tOW0PFfYVrPTa6q8iwhW79DbOK+sbO+BaC1WACyPdtfgfOZ/ptNJ
	nCPetYLT8xbSzjOGSdQzYED7gxvvlohId0MC/MMQP+Tg2yL9g2CfRH6wW4Vsw2AoQWqI
	2iSoFTyCtfdLOijqxf5B+gB2zTKE9tneZzvdq+A3n5hsFlr43ED5kT+Xiw4WzzdCgZg5
	onNHsIlS32AWvdJlzTO6v69D5DAxR5XekSNUmZx8E1jVevmbkZq8hdDIi7k3RRE6l+7q
	+ScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=m+YgBcinbjK/hPLQhddKLW8diOHW8WNVSRGz0eTWYU8=;
	b=eX4SLBA/HGOLaRxSq1EFxlC/icjMhXHqoUXfseVqvAUx0qSRUTNDyJUxeJwTXvM/Xc
	/hrCnYVDTm1j1z56jzPxSaIPEDIkmhr7+T3t+HfPLtP9Zut1uYpYS/3gCtu7S4hngYS/
	xX9ELsSq8KIlYlq+XfFzqCGNiOgTTNdgWnFoeYt9llpMb9uYmb+IldKC/GP8+APu3hDq
	cajzvZt8mvXv8DojBc2gndVVvAWPuKy2+ZZ5RV+sJPCSC6XoHEb01oExm8dGWCs91hIl
	ESX2vlcX7Jg8SvEvDMiWYFfYjHR++BSDDVF+f8ZyN91E5gjHXoM7utbN7RMlOnzYFsaa
	e1Xw==
X-Gm-Message-State: APjAAAX6bXOj8uYCBbG7x1NRLF/kw9anis7545Y6xVZi3vgTAenxH4Cs
	X54131n+bgKp83QS+bdPRuPWB/jpxG0=
X-Google-Smtp-Source: APXvYqwtzImtDKIwGDz0EwmW97UIxGoi9i5+MsxhoHF5u5VDkvYrvyruMqSYMxZZVhhxkKlrCC/G2A==
X-Received: by 2002:a2e:88cc:: with SMTP id a12mr3185827ljk.55.1556826217518; 
	Thu, 02 May 2019 12:43:37 -0700 (PDT)
Received: from peterliu-Precision-M4800.lan
	(c-b09ee253.022-417-73746f13.bbcust.telenor.se. [83.226.158.176])
	by smtp.gmail.com with ESMTPSA id
	s26sm8968996ljj.52.2019.05.02.12.43.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 02 May 2019 12:43:36 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 May 2019 21:40:55 +0200
Message-Id: <1556826055-7896-3-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1556826055-7896-1-git-send-email-liu.ming50@gmail.com>
References: <1556826055-7896-1-git-send-email-liu.ming50@gmail.com>
Cc: gerard.salvatella@toradex.com, luka.pivk@toradex.com,
	stefan.agner@toradex.com, Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH 2/2] libxkbcommon: RDEPENDS on libx11-locale
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
X-List-Received-Date: Thu, 02 May 2019 19:43:37 -0000

From: Ming Liu <liu.ming50@gmail.com>

This fixes a following runtime issue observed when a qtwayland client
running on weston compositor:
| xkbcommon: ERROR: couldn't find a Compose file for locale "C"

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/recipes-graphics/xorg-lib/libxkbcommon_0.8.4.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.8.4.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_0.8.4.bb
index 8fcae12..4d31638 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.8.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_0.8.4.bb
@@ -7,6 +7,10 @@ LICENSE = "MIT & MIT-style"
 
 DEPENDS = "util-macros flex-native bison-native"
 
+# Fix a following runtime error:
+# xkbcommon: ERROR: couldn't find a Compose file for locale "C"
+RDEPENDS_${PN} = "libx11-locale"
+
 SRC_URI = "http://xkbcommon.org/download/${BPN}-${PV}.tar.xz"
 
 SRC_URI[md5sum] = "3c4409058dfd203f641a563358e0187d"
-- 
2.7.4


