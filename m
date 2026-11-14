Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3642.1794686921674785475
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Nov 2026 12:08:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=KycDZhS8;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ae7626d14aso1128593a91.2
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Nov 2026 12:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794686921; x=1795291721; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OLHI9y96IcICVxv7DO3bSA6pkDMewLIAB98vMYmbZC0=;
        b=KycDZhS8OF1PMK0ZGOvEzdQSXIo2zpOIedARtBDfcbjJBjDaL55wiLqqrMUn/2qMSx
         e7SdVLR4ht2wTXwz0AOdPa10xyy+Km9LpZ2Wixxsw6mPH/cekBC7i0j1DCF33sMHPP/3
         0+KAt6fjOrMMjkqk6r/dxTiwYV+mSTH1PKVW0Ym+tEfA8861ElvxNmcInG37p2d1QiGw
         f8HpRQ9oUWiZOhSkZ2fA2kOaZQwV/w2LWzGvS2yqu0BEum7Qn34dXbfvD6oyQjF2LRpF
         BmS730QTFy5ANFS02jThtINhyHGqCtfcQdOD9yfOZXykZ2kLnjKEEUwvYdnT6JOyuqDG
         PNaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794686921; x=1795291721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OLHI9y96IcICVxv7DO3bSA6pkDMewLIAB98vMYmbZC0=;
        b=oBPh/p9/nqowkraNPmPKOXxsUPvhPyG20BzAygaAGYk9bSyVlkYy3jlr/kugI5vIEI
         jg15igzcYLtkP1aOn6pSbKLUKbl09RnwqgZbPpUl0baw+qtxclZtLWeAiw3Cyyd4fuTF
         D5U18spb4rab85rlZTrR3L8q78HZDKbNvAnQe1W/xl/cGccYNkZc9G2g16GIo+nXT65Z
         yg34D08d6/0GSJuo+YNLv7mZfQNpNUcqq++oZHzBzoh09omEhmqa3WG4ZRCpVMuzzi5b
         ZRQzLIWeH9gI9DEwUItW6BFCV+c3cO1RgJHhvSORJExnH5kxklNnWboVRTJYIjbXRpB1
         eSVw==
X-Gm-Message-State: APuU4Z8KVUZ20LJ077e+2shoIpjTP390a4ASZ/PI59aKLG2vm4kAU1QY
	nRpMvutLaBrjbGF/J80hu5NobPnQWE+BP8qWhpJHxSZt7HtzS+QHwUKVQdyyoFXq
X-Gm-Gg: AYBFou12ePDERJ0LR+Oki1lbsyKtEGNrmw5fSuYZMBO9KKJrkkuFhUq/xT7h26uA5+I
	m4Lwgv9czvES7bAiFzQsDZqoOQEQ94ZRBAjGLllh6R3oxNVJukQrPDkUKEa1RrL8PORZhx3Hjsx
	rjf2HgYOF4KVB+Vpwl7682fV3Z5aNu2ldHNsctTLUpa2MnZr/hWawVDQWFmQYiTAoqwJmx9+Hja
	6ttPt2x4KkPLSilbuIH1jSRT1AlFo6xaidtJEk2hETMyQQ6LOBUGYDF7EA1PLTimMqPtaTdilm0
	YpsOvIMk97HSJKzHLdv6Rvo4gDK3KBCB2X7zZ1zVUhDPDvfdDBolDBHtsqp7C8gz5PhMDwPHqXk
	ws02yZjqSXbCuLHbcjPBaAckZwXUWW3qLjQqkRXboMUXvqCN9AoI86+//2IjzSMHA9mpPMI00Gx
	GKfDvDL3MHerPFIlAJxreOdmHGOgt2lS8Fo2tvkX3cuG755e73WxLV3eABqPEIKtG0fCeeNXgMq
	25hz/MgT4Vrj1ViIWIXnv7rwvudKQqlGu//+Tcy/39ftnqQPQ652vhtm4464z76fTjYTDblks0H
	qu8WtFh0wP8h6KkCkqKn7kONaJDcLDaFbDwf6GHEjGwV8AELm2Q9DYZQQprmDkVPlGtKiVR8Loe
	kAlh+NDI=
X-Received: by 2002:a17:90b:3b8a:b0:3b0:9f53:e8a8 with SMTP id 98e67ed59e1d1-3b1b0b5f2c1mr6195872a91.52.1794686920569;
        Sat, 14 Nov 2026 12:08:40 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from localhost.localdomain ([69.9.132.159])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197b76ccesm14965358a91.0.2026.11.14.12.08.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 14 Nov 2026 12:08:38 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 2/3] lib/oe/distro_check: fetch Debian updates from stable-updates
Date: Sat, 14 Nov 2026 12:08:09 -0800
Message-ID: <20261114200810.31078-3-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114200810.31078-1-tim.orling@konsulko.com>
References: <20261114200810.31078-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 14 Nov 2026 20:08:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250210
Content-Type: text/plain; charset="utf-8"

ftp.debian.org no longer has dists/stable-proposed-updates, so the
Debian package list always failed with HTTP 404. Use stable-updates,
the equivalent of Ubuntu's -updates, which is only published as
Sources.xz, so read .xz files with lzma.

Tested against ftp.debian.org: the Debian list is fetched again, with
both main and updates packages.

[YOCTO #16503]

AI-Generated: Claude Opus 5.5
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/lib/oe/distro_check.py | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/distro_check.py b/meta/lib/oe/distro_check.py
index 56f81e630d..223bed2ec2 100644
--- a/meta/lib/oe/distro_check.py
+++ b/meta/lib/oe/distro_check.py
@@ -110,11 +110,13 @@ def find_latest_debian_release(url, d):
         return "_NotFound_"
 
 def get_debian_style_source_package_list(url, section, d):
-    "Return the list of package-names stored in the debian style Sources.gz file"
+    "Return the list of package-names stored in the debian style Sources.gz or Sources.xz file"
     import gzip
+    import lzma
 
+    opener = lzma.open if url.endswith(".xz") else gzip.open
     package_names = set()
-    for line in gzip.open(create_socket(url, d), mode="rt"):
+    for line in opener(create_socket(url, d), mode="rt"):
         if line.startswith("Package:"):
             pkg = line.split(":", 1)[1].strip()
             package_names.add(pkg + ":" + section)
@@ -125,7 +127,7 @@ def get_latest_released_debian_source_package_list(d):
     latest = find_latest_debian_release("http://ftp.debian.org/debian/dists/", d)
     url = "http://ftp.debian.org/debian/dists/stable/main/source/Sources.gz"
     package_names = get_debian_style_source_package_list(url, "main", d)
-    url = "http://ftp.debian.org/debian/dists/stable-proposed-updates/main/source/Sources.gz"
+    url = "http://ftp.debian.org/debian/dists/stable-updates/main/source/Sources.xz"
     package_names |= get_debian_style_source_package_list(url, "updates", d)
     return latest, package_names
 
-- 
2.56.1

