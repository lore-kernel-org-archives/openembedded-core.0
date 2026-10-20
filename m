Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.179.1792511571864566095
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 08:52:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GuuY6D6I;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: oo.hehir@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49d05d51553so23896565e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 08:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792511570; x=1793116370; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UmZz5SCrObHv4I3j1sTfHCU3tDP2oedzEQ71/XrgEIQ=;
        b=GuuY6D6I99+721DH0c+ZydMfX0ubT9KN07dD/5XWm9ZrvQ/XExC2ECiGltUr3hF+6d
         M39Mkr5DTJ6tWyQG8iXRIZnJyN1xAqDVQk0b3WsW7+wA6YcR01NjZCfev7c/TL3//pgq
         M+IKAzJsp0ISe4Vgz5AhoykAjfsewBU3y/U8EC5JlnQPQEtPIpMhgboKooawhEoNUglz
         QZ9JKWX+FFfKj57AM3YUY0VdlnG9XuWndowRYckR1fFeFlvac4HSFpgQqZVxnMlI3fFu
         N6CiInW3u0Bk9EBtqBYnl+GV4SEFoiV2MoNYxShDolZgUAkiOkAJ+UbHTgH6WE0zMuDe
         7dOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792511570; x=1793116370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UmZz5SCrObHv4I3j1sTfHCU3tDP2oedzEQ71/XrgEIQ=;
        b=nW0FGs6awy5hvSBqa1KZhYb9ED1iEtanZmQQrAoUNrJup6vURnQz0abZphk+bRNuvE
         chG3OpaxWnzGwV63cWbBuJv/2kA12gWTlx60r+S8Lq7wZoWqnj+70TLTA8/hkRoAzxzr
         hqEbw4TqDxZYKQlqlTex9T5n0+2vprVEhoZt3o/mSp5CgpCGjB3vbitpbmYEcrNHtY4O
         73X2KbJsg0biJd7ARS4htVPAxOL7Hq2UsKnaii/fP5qaOBm4ATyQqXs7rHXXQmY1Alpc
         y7Jo6X3xD1mnxGcrGnZKouSu4xJE9gHrSg2nGIMcCXsKh8miXeT1rtk3kYb9XbaVq+Me
         f+nw==
X-Gm-Message-State: AFq9FYLHI9i1hOzt+BI9sCqGRmGeYIFLbQvfAtQy04O39BXTzLxXiOTL
	zMYuOiQepc0lvhupFHaLdlGm6yNVduWkFiJKRIsDj02JISUmIAgX4nWj6qUxOX0mCddE7Q==
X-Gm-Gg: AYBFou05FKatf0PBkr1fOE8ZMKHwjcq2ySVRYvsDLG6QIrslSUzAU2007W1HrJQU2pC
	01kUY/GgRV1hbR+xeBALgFUq8uZkyZOC2kNuSmnIDDg8gutXHisG7BOMIEanw41nrR7mLzegHCE
	tG53HYragl93csO8UHfEfH+R7FkF4JRLo01c41f6LZedn6k87q5wUMXMHcEeZCukqhyWmD52W7J
	aUQLyLWCUOF+mIVa1355DMc0tyQ1bRjnqvL4bCJlSYwDDsm1q3NE2HeuMKKc/zR/NWgul3xWDV4
	XHxHFexLPlUZ18sNYxjrvmkOn3+IYMQnLj0J00LwaBYBP4FnSHpe6Y93PksiQEWl9Ex34rJFsk+
	6VEwGOmGuIynT0LFdHOQWZuOOwQRrO9pJ/kIYier0Qw5oTzirQzc1lVKQLWye/L+yIfGdmISmQZ
	Q2MU3LWIStrCrsf36HhF1KcB3R+OtfNj8dvTOrPSEUnULkGRKE+y1tq+9+swEk+HcC0UQJzU6Cg
	hRPHrM13ZhFr+KXKd40nwVCNn31wLqMVA==
X-Received: by 2002:a05:600c:19d2:b0:4a1:d10c:7170 with SMTP id 5b1f17b1804b1-4a1d76262e1mr236721405e9.31.1792511569854;
        Tue, 20 Oct 2026 08:52:49 -0700 (PDT)
Return-Path: <oo.hehir@gmail.com>
Received: from hp-z640.fritz.box ([51.37.195.29])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ce33ad3fsm307375725e9.5.2026.10.20.08.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:52:49 -0700 (PDT)
From: OOHehir <oo.hehir@gmail.com>
X-Google-Original-From: OOHehir <40183643+OOHehir@users.noreply.github.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	tgamblin@baylibre.com,
	mathieu.dubois-briand@bootlin.com,
	ross.burton@arm.com,
	OOHehir <oo.hehir@gmail.com>
Subject: [PATCH v3 3/3] ptest-packagelists.inc: re-enable tcl8 for riscv64
Date: Tue, 20 Oct 2026 16:52:38 +0100
Message-ID: <20261020155238.1923076-4-40183643+OOHehir@users.noreply.github.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016204547.2328847-1-oo.hehir@gmail.com>
References: <20261016204547.2328847-1-oo.hehir@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 23:08:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248318
Content-Type: text/plain; charset="utf-8"

From: OOHehir <oo.hehir@gmail.com>

The previous commit skips binary-40.3, its only failure on riscv64.
core-image-ptest-tcl8 on qemuriscv64: 152 pass, 0 fail, 607 s. On a
VisionFive 2 (JH7110), binary-40.3 was the only failure.

tcl stays parked: under TCG, unicodeNormalize.test prints nothing for more
than 450 s & ptest-runner kills it. The binary-40.3 skip still helps tcl on
hardware.

Signed-off-by: OOHehir <oo.hehir@gmail.com>
---
 meta/conf/distro/include/ptest-packagelists.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 97c6e35050..1b76023621 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -164,8 +164,8 @@ PTESTS_PROBLEMS:append:riscv32 = " lttng-tools strace"
 PTESTS_SLOW:append:libc-musl = " libc-test"
 
 # These tests don't yet pass for riscv64
-PTESTS_SLOW:remove:riscv64 = "tcl tcl8 python3-cffi lttng-tools python3-numpy perl glib-2.0 zstd libpcap"
-PTESTS_PROBLEMS:append:riscv64 = " tcl tcl8 python3-cffi lttng-tools python3-numpy perl glib-2.0 zstd libpcap"
+PTESTS_SLOW:remove:riscv64 = "tcl python3-cffi lttng-tools python3-numpy perl glib-2.0 zstd libpcap"
+PTESTS_PROBLEMS:append:riscv64 = " tcl python3-cffi lttng-tools python3-numpy perl glib-2.0 zstd libpcap"
 
 # These tests don't yet pass for musl qemuarm64
 PTESTS_SLOW:remove:libc-musl:qemuarm64 = "strace perl gnutls glib-2.0"
-- 
2.43.0

