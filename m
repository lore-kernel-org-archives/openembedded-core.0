Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id 8FC997C894
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 00:08:53 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id n2so8079949wrw.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 16:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=CXkB6duETOgyDb3MYUNhvTya69bEIB7mqdo//qooRqs=;
	b=SWLQc1CFUfgAiznal1yNP9JB/Csz1K2ozpbocfTzNH8ozxxjDbCw+7PrSMaRJks2r5
	VesxwexLKMLscSN5A9VZsUcVAyakxEsbZoYR5tMXljfx3AADKDNAJIk4I6EI9Ia4u9MI
	/g3LG8eFOsQS7gZ4DNwoMbhUgE0ztf89a3Gc0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=CXkB6duETOgyDb3MYUNhvTya69bEIB7mqdo//qooRqs=;
	b=TH2F5im7oOO+02dTR0W9ZUMdPaeqr0OT5RNJCVZrZjwZPxoGzfYodKVQW9kcqhKEzy
	NBiKFaY7JlkIyfoBzuT0UJP9b2nuRHvZEYweU32k6bRGv06y0fSa0w02IoO1c5UA7ZYP
	GU29mjHD8fyctxOU2Y9D3Stql2vlBLyRi8b5hILhrB7YpxohfwUpevm/bjCvlc1r+ZQB
	aELCV0CVvzGgx+E0Ua6d6x1edxv7uU2EXGM4GGJOAUpHFzZ3bPZxLJ+5iZVAXj6YbseC
	NtJPhAnRN6MsfeY4/gCWp2YBAHLqvdg9l8hkE8JUUAW+PTMpQLzzl2s1L4YHlPdXWb8k
	1rwQ==
X-Gm-Message-State: AHQUAuYv7Y5UjBgwtdWo9DHDw1cadE41xtidZqpGXRXaJ6qcbgI+E9kz
	xDG9WxQ9AELDTboz4nLhNzcapEuxn+0=
X-Google-Smtp-Source: AHgI3IZ4EbQZKr6eByxj2YtjEl/3FE8SOQwHF05DHt4cFGK5xa1ChcZBMaKDmr5x8Rj9WVWuJi8Bgg==
X-Received: by 2002:a5d:548f:: with SMTP id h15mr18045459wrv.238.1550534933994;
	Mon, 18 Feb 2019 16:08:53 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t18sm1626860wmt.8.2019.02.18.16.08.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Feb 2019 16:08:53 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Feb 2019 00:08:48 +0000
Message-Id: <20190219000849.6177-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190219000849.6177-1-richard.purdie@linuxfoundation.org>
References: <20190219000849.6177-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 4/5] libinput: upgrade 1.12.3 -> 1.12.6
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
X-List-Received-Date: Tue, 19 Feb 2019 00:08:53 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../wayland/{libinput_1.12.3.bb => libinput_1.12.6.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{libinput_1.12.3.bb => libinput_1.12.6.bb} (86%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.12.3.bb b/meta/recipes-graphics/wayland/libinput_1.12.6.bb
similarity index 86%
rename from meta/recipes-graphics/wayland/libinput_1.12.3.bb
rename to meta/recipes-graphics/wayland/libinput_1.12.6.bb
index 3d1ab59309e..46366b75113 100644
--- a/meta/recipes-graphics/wayland/libinput_1.12.3.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.12.6.bb
@@ -9,8 +9,8 @@ DEPENDS = "libevdev udev mtdev"
 
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
            "
-SRC_URI[md5sum] = "083d6bf311d5e1e3a62440dc634bb8f0"
-SRC_URI[sha256sum] = "f266ff861a2e7a97e1402c4345e3547b900efde68adbd40e56403e2617fee255"
+SRC_URI[md5sum] = "8cf10cc0fdfab865b105dd28283fa0fd"
+SRC_URI[sha256sum] = "12b4023a3fc683d3d8127db573bdf925a2ef366615042f69c87e57c32a50f45d"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 inherit meson pkgconfig lib_package
-- 
2.20.1


