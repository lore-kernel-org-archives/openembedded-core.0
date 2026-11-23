Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2447.1795462159169244742
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 11:29:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@9elements.com header.s=google header.b=akf/+lXh;
 spf=pass (domain: 9elements.com, ip: 209.85.218.48, mailfrom: tan.siewert@9elements.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c5188e17487so120577566b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 11:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1795462157; x=1796066957; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5SFkScKuzxE07Kh3OpuoERUjhaMd6INQXigE/SO5mNg=;
        b=akf/+lXhMo4sf41HaJ/ADhMsG+2i/Pb7TWNlhhPLmDXmtjT7spXRNhB5fbkyVAYO9+
         5+IdWImgeMMjYkS3qpprxl1Qrzh9naYMItfsTfIVMqo3MrONY2tQ9idY60220d1BuKJI
         hZgnx/RvXSIt83gvkIyAfJHk/EfN2pIv6bZT1h4ccIlWT6GeXYPGm3oJuUOXHE5MKYFa
         ZBu5+u8OCridN5Qx3B42/TURPtBvSD8sPzZqxrALXSsRRVHdeHbO3lj0agDxDL4dMIn7
         qi9RS8vUnyStJOLxH5Ya8T5BBH7tFPMpfMaIfefYkYOhz/b+z7NtLO85B8pp6Q1AFD+p
         lLjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462157; x=1796066957;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5SFkScKuzxE07Kh3OpuoERUjhaMd6INQXigE/SO5mNg=;
        b=j4TIhlzwrIqyWtieyn6BPLOzepDutTCtN95rd/VSApQAgu+HXR9H95mKglKvqqGLXG
         HQL9/tTUmLL2F7aUnfpvQWMRQXGmgabiJRy144O9vFLm0UUiVTYTFHJp08R1ttGjK02b
         M51qtUJq/SetLM3J4z2MHGSQup74r4fIPg6reFVigjmCOAWf6u34XdTSa3jAupkbX3Iy
         oo9b4b5Lw5GAtzIDGLnKW96PQ2fiVebdIUS7YUTQNkYb/cb41FUXW6YWXlhXc1YyVLsH
         RZVyf7M8ZsWxz2haWY+Qgnf2yvQ7cFAJmDC3Nd4Jr3/xZKwo8OKnnrgrBgr34f6gyaOI
         Rb+w==
X-Gm-Message-State: APuU4Z8FGM2G2k+aUhRr2lekDXIPlKRHN0vmgdYhXyFGM9gtU63YtM1n
	5wuyF/nC0uN+2lyY1IWCT3VKPHnpb1yQ/inqVCGbK73ghLPjLOIWjVG81c+fzDIulyA5Wvnh1v9
	YGANlX9UAiw==
X-Gm-Gg: AZFdTZfkoSeEkoi9oMhcOF436GHGaHxU2NrSc5/Q6XcV4Qu1y3mqK7OVYvxpzv+oYf1
	3zxsDjxdP9x9a3bnOALPR2SyucczKOSFJtnwFck9qntItUR+d+JVfl5oq2CsLzz55Vjz2xe7hzs
	+HGf62FxWr+5Ye5UEbEe8yI0LsdWBa/OGg9gMw1ZlSjSf4QkYqeEshncZ2Ti4zVFWL0uEUHVaEd
	UqNpI0ya5sHg5GXtdbQUJkfliKTnCTA9sbZMWrhfFYhZi5srLppQrQseXpHbsxgo38nLvbtN93M
	gWbIR0ga2+FCBiZyySbYXzpp0opso/HpYrJPZ5GiQ+NLKwL4c0e2RJATWRogaIoFmn9s0wS6hFc
	aX/sU719crcPZD6qiKr6YkUzQi5zLpCbY3nY4Be0exggO8ViNI0bWpi9eeLU0sAXojWw9FQyVGf
	uUAr/mUvpA9Lz/2bOs0OijWysUE3yBhbI4269nPeo6HVe5auOyWDremGnN/kZoz6JM7hDSqzOGQ
	/g20hwCO85torUJB/tsn4KB6rpVPt1GGGT+JG1cVNHAzaNMXIbsYENr/sLrsdrivtC+MUy1/N22
	v7XWOBPUjJ6H4MY66HVo/eU1KKWRS77mjTjp7kK3zWi73ECe4QrhdGmIn3z7ZBC3WccwvyzQ9fP
	lZNnX5eNxJovLzebvh5afCFqa4UQP4SS8KA==
X-Received: by 2002:a05:600c:1c1b:b0:4bb:87be:c138 with SMTP id 5b1f17b1804b1-4bb8893e021mr282836685e9.32.1795461779319;
        Mon, 23 Nov 2026 11:22:59 -0800 (PST)
Return-Path: <tan.siewert@9elements.com>
Received: from white-mocha.local (p200300e66714e500bfe47b00fa11e276.dip0.t-ipconnect.de. [2003:e6:6714:e500:bfe4:7b00:fa11:e276])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm299291305e9.2.2026.11.23.11.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:22:59 -0800 (PST)
From: Tan Siewert <tan.siewert@9elements.com>
Date: Mon, 23 Nov 2026 20:22:44 +0100
Subject: [PATCH v2 4/4] systemd: add fdisk packageconfig
MIME-Version: 1.0
Message-Id: <20261123-systemd-optimisations-v2-4-0ecd5965985c@9elements.com>
References: <20261123-systemd-optimisations-v2-0-0ecd5965985c@9elements.com>
In-Reply-To: <20261123-systemd-optimisations-v2-0-0ecd5965985c@9elements.com>
To: openembedded-core@lists.openembedded.org
Cc: Sai Sireesha T <saisireesha.t@windriver.com>, 
 Tan Siewert <tan.siewert@9elements.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795461768; l=3274;
 i=tan.siewert@9elements.com; s=20260527; h=from:subject:message-id;
 bh=lisXC++rfhUVez47Sres7imTqVd6K5esVk507swmUWA=;
 b=pqe2NMeqdbWe6hRQMCqjD/1D5a7ApI+x+v8wMxUwrjeQPBMDcLxEsoHPDOIcKC85qB4udId5J
 Rfrx6Kr4WmuCu+ptTl7/kmLxbAZvJFcwlj6D1AL8AXgjVoFTovYhibM
X-Developer-Key: i=tan.siewert@9elements.com; a=ed25519;
 pk=ORQd/zQf+LsAvJGXP1CjQwVO6t6iEOGq/eGUsmRVTG4=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 20:15:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250935

libfdisk is used only by repart, homed and sysupdate, but as a dlopen
dependency of libsystemd-shared it always adds an RRECOMMENDS entry for
util-linux-libfdisk, even when none of those features are enabled.

Add a packageconfig option and make repart and homed require it, as they
would otherwise fail. sysupdate is auto-detected and silently dropped
when fdisk is disabled.

Signed-off-by: Tan Siewert <tan.siewert@9elements.com>
---
 meta/recipes-core/systemd/systemd_262.2.bb | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_262.2.bb b/meta/recipes-core/systemd/systemd_262.2.bb
index 5841ee3322..ca7d5bf532 100644
--- a/meta/recipes-core/systemd/systemd_262.2.bb
+++ b/meta/recipes-core/systemd/systemd_262.2.bb
@@ -56,6 +56,7 @@ PACKAGECONFIG ??= " \
     backlight \
     binfmt \
     coredump \
+    fdisk \
     gshadow \
     hibernate \
     hostnamed \
@@ -130,6 +131,7 @@ PACKAGECONFIG[default-compression-xz] = "-Dxz=true -Ddefault-compression=xz,,xz"
 PACKAGECONFIG[default-compression-zstd] = "-Dzstd=true -Ddefault-compression=zstd,,zstd"
 PACKAGECONFIG[efi] = "-Defi=true -Dbootloader=enabled,-Defi=false -Dbootloader=disabled,python3-pyelftools-native"
 PACKAGECONFIG[elfutils] = "-Delfutils=enabled,-Delfutils=disabled,elfutils"
+PACKAGECONFIG[fdisk] = "-Dfdisk=enabled,-Dfdisk=disabled"
 PACKAGECONFIG[fido] = "-Dlibfido2=enabled,-Dlibfido2=disabled,libfido2-initial"
 PACKAGECONFIG[firstboot] = "-Dfirstboot=true,-Dfirstboot=false"
 PACKAGECONFIG[repart] = "-Drepart=enabled,-Drepart=disabled"
@@ -869,11 +871,11 @@ python __anonymous() {
     if bb.utils.contains('DISTRO_FEATURES', 'systemd-resolved', True, False, d) and not bb.utils.contains('PACKAGECONFIG', 'nss-resolve resolved', True, False, d):
         bb.error("DISTRO_FEATURES[systemd-resolved] requires PACKAGECONFIG[nss-resolve, resolved]")
 
-    if bb.utils.contains('PACKAGECONFIG', 'repart', True, False, d) and not bb.utils.contains('PACKAGECONFIG', 'openssl', True, False, d):
-        bb.error("PACKAGECONFIG[repart] requires PACKAGECONFIG[openssl]")
+    if bb.utils.contains('PACKAGECONFIG', 'repart', True, False, d) and not bb.utils.contains('PACKAGECONFIG', 'openssl fdisk', True, False, d):
+        bb.error("PACKAGECONFIG[repart] requires PACKAGECONFIG[openssl] and PACKAGECONFIG[fdisk]")
 
-    if bb.utils.contains('PACKAGECONFIG', 'homed', True, False, d) and not bb.utils.contains('PACKAGECONFIG', 'userdb openssl cryptsetup', True, False, d):
-        bb.error("PACKAGECONFIG[homed] requires PACKAGECONFIG[userdb], PACKAGECONFIG[openssl] and PACKAGECONFIG[cryptsetup]")
+    if bb.utils.contains('PACKAGECONFIG', 'homed', True, False, d) and not bb.utils.contains('PACKAGECONFIG', 'userdb openssl cryptsetup fdisk', True, False, d):
+        bb.error("PACKAGECONFIG[homed] requires PACKAGECONFIG[userdb], PACKAGECONFIG[openssl], PACKAGECONFIG[cryptsetup] and PACKAGECONFIG[fdisk]")
 
     if bb.utils.contains('PACKAGECONFIG', 'sysinstall', True, False, d) and not bb.utils.contains('PACKAGECONFIG', 'repart', True, False, d):
         bb.warn("PACKAGECONFIG[sysinstall] may call commands from PACKAGECONFIG[repart]. Consider adding it")

-- 
2.56.0

