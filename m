Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2453.1795462144917046427
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 11:29:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@9elements.com header.s=google header.b=WhGFL7XN;
 spf=pass (domain: 9elements.com, ip: 209.85.218.43, mailfrom: tan.siewert@9elements.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4d5b2db4bbso756546466b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 11:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1795462143; x=1796066943; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dFHixTfi79nj/CTbQjOamlXo+wvV/DQhjouhGy25ieo=;
        b=WhGFL7XNMzJCqy9sCie9eBXMlXbizAfK7UfDnL1HY607rc7MnueM4o+utufdA7fCwa
         FBRKuIKesKdnzuisgmdG5nKT3XCDiUQNT6vE2xmiMxJinXcXRZjz+t9gzvfJqn9vw7Ye
         UWf3G8RxLAcyZ6uZMjteFMInUU8n9bN+R0nAq3Zouz+a0ITMXxU5tL9ZsVZhTPkUIKly
         dR3VhOx9s7P9sJMqp6rrY9s8Iz9iErxIWTbpongswle1ec77WFzRRXGoQ7CQwI4T5tcH
         CDerA1Nj5ZRKLvP6DEXRsCu6ZvIClmoVN8c/otGu0b3HAL9UT8csQuzHkpv23N+irmkq
         7e6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462143; x=1796066943;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dFHixTfi79nj/CTbQjOamlXo+wvV/DQhjouhGy25ieo=;
        b=iTJx0dK8/EjthU1/Z+KfOOPF0rNfaA+zQnUblKK+4kYsquImI7MCI112OkZxLZ653b
         fb+EPtkSXVWGePOVMyXBu2vsYMtXrR+P+bfb9liAioJc4buJmTSCLBppC2hUFSCFHrf5
         caGId20r8kpmrFAmCDK37FrQuueIY0grCwji1i3WMw+ZxXgFPC7feOfxccxL/sq8bIdS
         qUb+L8NvfbCdA1nRNnrTmJXwCpkYVdvafMIoOX+yQ3SQU2Wpp2hKQPKONvkQaOYtXNO3
         D4fGM78v4EeUMOx49wm32IVNLr/nW4OceeFS/K5FcF5COesNCw2RvVpQNb5rpglNdvGb
         phfg==
X-Gm-Message-State: APuU4Z8WuaOkiVVi2d9mJ7bHoZYetAQ2ALzDzESUPR+Fk61XEZ9zJtde
	l2JdKsFL+hdfdhQ8qp9oRxdCzh4FPCTRk7WBMEYNq0pJ4LJImQp/WVCEk2sporqV2anZ6JVA6JG
	WWVlXkm5fMQ==
X-Gm-Gg: AZFdTZeBmVVyP9glm0Tv9iZrp0rE33oA27Mfab5Ir2XYJqwB3sIvLeuokYjaY0zlaEV
	b7cfiEOUVaVgtj04B+xlekf/IzZmK0rt2BDZaT+TO9Jyk+HSPKG3hmvzCfiEvDmPzCFN55xKHLz
	c253ICQtXrpEqLspe3qHGVoB+j0oPZ4M7RzgmpNzh9VnFhH9O/2M78u5y2x9xl/oMTwTmLgh9r/
	nVMjSjH2u21gX84bo/sa6TlhZNbVrKt4Z+thyY/ktDp2uUdi9s+a/DgoyN+CQqZiiSf2mBDlb/0
	eyusE3LQLvyuZ4muPqVFhrt97rUIw/QaQ9rPiKeujPPKheN38N4TPbnNyFWEbmY8LsH0QZpHJZS
	RCA+GRoY6O3/H7xRxI9uLXfSMRGfrQOyoJVLN2NPqEO9q2n5iHCfbWpCG3At9of997G3pQ/agTe
	PE2JOaDV36ZaN2q3ooirwnSOFTeHOz3r21H0H3UFi69ikaLu58nPDb1kvO7AxmR6OcWlrdsuVG5
	w389OoPaaT4zt/jPuGeE4FwWEA2HS9msxSMRanucIXxh19S3hh59sfvwZ6ZnCRIfKQdlDz+JKH7
	4P15m3ABi2lpqG+EPgJigQoQraxuunrG/NOxGTMCU4UBTOMnykiQFZhSXAdR5OcQgK3no/yC5lB
	9JJgSRTjZ72eC+1jCaA+BYJksOIDQTNe0
X-Received: by 2002:a05:600c:828e:b0:4a2:526b:d40f with SMTP id 5b1f17b1804b1-4bb88785898mr267750815e9.0.1795461777773;
        Mon, 23 Nov 2026 11:22:57 -0800 (PST)
Return-Path: <tan.siewert@9elements.com>
Received: from white-mocha.local (p200300e66714e500bfe47b00fa11e276.dip0.t-ipconnect.de. [2003:e6:6714:e500:bfe4:7b00:fa11:e276])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm299291305e9.2.2026.11.23.11.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:22:57 -0800 (PST)
From: Tan Siewert <tan.siewert@9elements.com>
Date: Mon, 23 Nov 2026 20:22:41 +0100
Subject: [PATCH v2 1/4] systemd: add ukify packageconfig
MIME-Version: 1.0
Message-Id: <20261123-systemd-optimisations-v2-1-0ecd5965985c@9elements.com>
References: <20261123-systemd-optimisations-v2-0-0ecd5965985c@9elements.com>
In-Reply-To: <20261123-systemd-optimisations-v2-0-0ecd5965985c@9elements.com>
To: openembedded-core@lists.openembedded.org
Cc: Sai Sireesha T <saisireesha.t@windriver.com>, 
 Tan Siewert <tan.siewert@9elements.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795461768; l=1629;
 i=tan.siewert@9elements.com; s=20260527; h=from:subject:message-id;
 bh=drmKczLZtf1Mg2Aloj3rDpHKXH67QPQKB1a/Fzhk5D8=;
 b=zAqRu0tp4xvnSCo4eRBxLlSODy/DxFQc5T/t4ZZJ1LU0ZQM8FtEpnL7lccmOKo2yV742Nz4Hx
 pvDR+Qn/mlfC6vHWYb/EKYnImcP2X01exnWVS9sDYtwt290q4l0UA0G
X-Developer-Key: i=tan.siewert@9elements.com; a=ed25519;
 pk=ORQd/zQf+LsAvJGXP1CjQwVO6t6iEOGq/eGUsmRVTG4=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 20:15:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250934

systemd gates ukify via allowed(), so it is built and installed unless
explicitly disabled.

Add a packageconfig option that is enabled by default when the efi
DISTRO_FEATURE is set. It can still be removed if wanted, which may be
useful when using meta-tpm, which may include ukify implicitly.

Signed-off-by: Tan Siewert <tan.siewert@9elements.com>
---
 meta/recipes-core/systemd/systemd_262.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_262.2.bb b/meta/recipes-core/systemd/systemd_262.2.bb
index 7223a4d192..eaa4b900e0 100644
--- a/meta/recipes-core/systemd/systemd_262.2.bb
+++ b/meta/recipes-core/systemd/systemd_262.2.bb
@@ -51,6 +51,7 @@ PACKAGECONFIG ??= " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'minidebuginfo', 'coredump elfutils', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'rfkill', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'efi', 'ukify', '', d)} \
     link-udev-shared \
     backlight \
     binfmt \
@@ -196,6 +197,7 @@ PACKAGECONFIG[set-time-epoch] = "${@build_epoch(d)},-Dtime-epoch=0"
 PACKAGECONFIG[timedated] = "-Dtimedated=true,-Dtimedated=false"
 PACKAGECONFIG[timesyncd] = "-Dtimesyncd=true,-Dtimesyncd=false"
 PACKAGECONFIG[sbinmerge] = "-Dsplit-bin=false,-Dsplit-bin=true"
+PACKAGECONFIG[ukify] = "-Dukify=enabled,-Dukify=disabled"
 PACKAGECONFIG[userdb] = "-Duserdb=true,-Duserdb=false"
 PACKAGECONFIG[utmp] = "-Dutmp=true,-Dutmp=false"
 PACKAGECONFIG[valgrind] = "-DVALGRIND=1,,valgrind"

-- 
2.56.0

