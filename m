Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5F66671A9B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 14:16:24 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id y143so14248556pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 06:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:mime-version:content-transfer-encoding;
	bh=6qGgWGQgZC9hQYmGrgrtP/c9AmbmiKwwsLo+WMPi2SI=;
	b=kuh8/+/mKxNFOYsC1if5ViOy0QZ44+ZT3zoqI4Oe0gLjuFAu+BXVzIA7JcKYAb+wGV
	OjA/CIoOVUlEZg0uc7mBqCckom+2Rp6U3gxcKJyo53yQKTq6aCkU4FZHNoErRaZp8HRF
	ZTYN4h7rFdw60P+K881fFoY0TLwz2ILLZhEkU3PEi9kmLYfJwBWYCqZ0EJ1gZLp1QHwn
	vBkUTaYpw+srP3+u8HMchzRBAgQjg4MBUuHAB494tq9KhfzO8o7ZTAh+NIfZnX/1i+wN
	ENF7zerB3JNh+vWXYJ0Nr5uEDjoKAcVaZoe84uhFvzuDJPgyVAnJ3oOkc94z9mutShxp
	Xhbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:mime-version:content-transfer-encoding;
	bh=6qGgWGQgZC9hQYmGrgrtP/c9AmbmiKwwsLo+WMPi2SI=;
	b=WZgkgxiQ6nQCkA99bTJhbSNXQJ3c8eFlOT6OAElGeiFP8OvJM6qEahJqeC71viUtkw
	HgVItupFKDsXOP3TPvP0J0HWkCMY2r0yxGO9aDZBbOf8HxbEmmSFHanadTP1ghww8wGf
	ze8WiF4OUTYp680o5OvJ8Vph9nvTNfbvu7Y1Q8G86uXyDxsgfRdrMw2B4dfZnTB8gkCn
	6kNmT8KeI3QadSJTU8I8c10LuG4U6oUW0Ms3T7CeSCTFrCMMBZ+6H0aU/z/L35AQOJ++
	OLxpKTt9/Yn3wavN1cQUUhQDENEtZtCnXZB7b3maWoKZoLhhK9GZFwik3ubh2eR/GAAG
	OUeg==
X-Gm-Message-State: AIkVDXII1nc3hfeIQVvSnRATntOsZyiK5cDvB7NUb9w08/B4iIo20H539lrRO33tiHBY9A==
X-Received: by 10.99.24.92 with SMTP id 28mr40635341pgy.100.1484576185496;
	Mon, 16 Jan 2017 06:16:25 -0800 (PST)
Received: from [127.0.1.1] (CPE-58-165-45-185.lns1.lon.bigpond.net.au.
	[58.165.45.185]) by smtp.gmail.com with ESMTPSA id
	e127sm48185759pfh.89.2017.01.16.06.16.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jan 2017 06:16:24 -0800 (PST)
Date: Tue, 17 Jan 2017 00:15:10 +1000
Message-Id: <20170116141510.3321-10-nathan@nathanrossi.com>
In-Reply-To: <20170116141510.3321-0-nathan@nathanrossi.com>
References: <20170116141510.3321-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH 10/30] libsdl_1.2.16.bb: Disable x11 for nativesdk mingw32
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
X-List-Received-Date: Mon, 16 Jan 2017 14:16:25 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Disable X11 support when building for the nativesdk mingw32.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-graphics/libsdl/libsdl_1.2.15.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
index 9c0ec541e3..e770b5f051 100644
--- a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
+++ b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
@@ -48,6 +48,7 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
 PACKAGECONFIG_class-native = "x11"
 PACKAGECONFIG_class-nativesdk = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+PACKAGECONFIG_class-nativesdk_mingw32 = ""
 
 PACKAGECONFIG[alsa] = "--enable-alsa --disable-alsatest,--disable-alsa,alsa-lib"
 PACKAGECONFIG[pulseaudio] = "--enable-pulseaudio,--disable-pulseaudio,pulseaudio"
-- 
2.11.0


