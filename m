Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.692.1795888594499784886
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Nov 2026 09:56:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=YyNSrnBu;
 spf=pass (domain: gmail.com, ip: 74.125.82.42, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-15ea896ddc8so14905487c88.0
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Nov 2026 09:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795888594; x=1796493394; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nKWHVa1a+GpO8FTGTR9JzrE4I8r5C76a6Nk5LFGZ/0U=;
        b=YyNSrnBu1aWkqFpu3toCuDCj8yPPjNptujdhXRjYwgnB+03nT03WH7qH/pQeW9JuXu
         lW3ZocbGr0b1hMFJl10HGNTvuhkiKepXDh3S9ggPxDdPYC4LBmlUfcAT6sa95N+C226T
         O+uSrh5WjiR4JdGkl0F0zp93gdlHfxPY+E1eKoe5R4MR30vFa3dRrFbpR3guEs+FLPA7
         2Kq60kUpNjaKpMZrkJILGRUEipgRLUw3OPiy/J0FLv9Cgzf4OdNUkgRLOJtFc0M1gEps
         OuMH+8ehnkkbKrc/JqemzOA7RsLjEfJsgV+K3hUAKnRj5mMhQSiwXWLKk0s3WhPdO4Am
         RM6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795888594; x=1796493394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nKWHVa1a+GpO8FTGTR9JzrE4I8r5C76a6Nk5LFGZ/0U=;
        b=VPhKnVhxL0asw1s/ZdmlafqxWdcNjIsoFS17M8MHqwElzkAez4SiSs9fbX6LMNQWOU
         4lp/oNzJ5z5aouDlMcRUVzxErdnByiMMiyCsrLrxrEeQrAaNYi0RTOo1X7ryuxaGiLgC
         3FzHZPN9YL6IM1GbH3Gw3cvDKlJ+jKQRPOU3NCzn19fMHZoxwAxGx2q4PLPSxOA0vSol
         oRFfxk8aGrWqcUjCqqC0uGrJCLzeNfHdqdE5FlwgYE46i7plG2CAGyX2QefgB0MLVqns
         DW5v7aqMivcntrh9QEohcuyKqCESiBVzvd3nJfAS5m5qJr3+HISCWo4FF1noll/8tF1S
         zBeg==
X-Gm-Message-State: APuU4Z/SC/spBDrw6l8t2trwIRkTbUDQ15bBhoO7bmjEvS+1GrnjML7/
	JKnCN+oxx8wJSR1rpuLeteH+OoZCwWcei3APgM1M+1ZP1dRNyiMBlkYaiUV04GOB
X-Gm-Gg: AZFdTZdaWKfEoAtXmk946RwrozAn7XYN4a86/45My+VO+lYbqGJE3okaE8bMZCPPGFV
	Iwab43aOXDwjmqGz9af9qVXT6Dzm40NQfwmt33fB8PpJ2aXx0cXzVH/6gLRdb1+n/4uCLkB3sjh
	s4dErnk0euLAwXO1zTcplDXO+u50IRez8vzrOtLpGxmMGbmo3Kmji8LwbxO0+GoLsML8dafLS+s
	3f9EeFljvP6LgJiKoas1rirsjA5rMPgmGCunroy2KjeMT3SyC/VdFo6viB9hI/2FTi9LenzfBTp
	3RQsQyC9GBTtAAgLLT7b5bpgPx5SdfFSt+Hraaa8yZvIV2oyt1f97gO/ET9SNrF5mCLaIE8BUEm
	aO0NA2PANYU999hybpORiIjU0Vlyp6ZgooxlMEPYnAXat8Vi9ejPfi0U84BJJEi91/ANWk9d6BI
	axXiLll9uki+899An6K/S+T9t5l174dsYdwQJuK4qJ/nxjwsTq/NJOSJoKDKBAWYib2OsdBXcVu
	gPq/VVe5R9o5XiDo+NN3k4M7WxwWj1sfNoIchmuG9tyij0xg1ud0DeeGxyQn2Prdj8lIYRb0L4m
	pTRvlqxVC33QEMsC+WYtd4PZQgUNoRYaZ4D5SjXie19q1acVi+Lpj4g+7+HBu40KvT30aJD8WQb
	d+coBjncwljgLp7t9ufUxpOZIfx7rSgMP50f2NTPMEzy4/pLAzaIWo4Sz27kASODbFmj6x+L8Mv
	yYkzAdqDbZkhXCOodMN3qcvhCzPuVioYi5s5XwapO/5dRU+5kBuuSHSDaDZ872CgmbDpYuTbZro
	2tgBfrcmmt+aLqeemkivqJPNwZ+PHGoBYbK608FjvQVtfuhOsJ4XwNM4WdhsyBG2di9A9H555tO
	EYN7
X-Received: by 2002:a05:7022:7f01:b0:1b2:490b:6fdd with SMTP id a92af1059eb24-1b5568aeb2bmr23394847c88.24.1795888593682;
        Sat, 28 Nov 2026 09:56:33 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ff27bsm76080399c88.6.2026.11.28.09.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 09:56:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH 2/2] p11-kit: Add upstream version check
Date: Sat, 28 Nov 2026 09:56:29 -0800
Message-ID: <20261128175629.1475352-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261128175629.1475352-1-khem.raj@oss.qualcomm.com>
References: <20261128175629.1475352-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 28 Nov 2026 17:56:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251504
Content-Type: text/plain; charset="utf-8"

Only consider the X.Y[.Z] release tags.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta/recipes-support/p11-kit/p11-kit_0.26.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.26.6.bb b/meta/recipes-support/p11-kit/p11-kit_0.26.6.bb
index 18430f0a74..7a72675c20 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.26.6.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.26.6.bb
@@ -13,6 +13,8 @@ DEPENDS:append = "${@' glib-2.0' if d.getVar('GTKDOC_ENABLED') == 'True' else ''
 SRC_URI = "gitsm://github.com/p11-glue/p11-kit;branch=master;protocol=https;tag=${PV}"
 SRCREV = "f9813f90a51761dc75b5dcd8d9766466b8904f5c"
 
+UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
+
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} trust"
 PACKAGECONFIG[systemd] = "-Dsystemd=enabled,-Dsystemd=disabled,systemd"
 PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxslt-native"
