Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14958.1793633092278637746
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2026 07:24:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=FLxS6KVz;
 spf=pass (domain: gmail.com, ip: 74.125.82.51, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1438d9363fbso2411029c88.0
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 07:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793633091; x=1794237891; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=14AmkCgi4mmt5W5fo/fntc4010guDt2zhyM9t6e7JuI=;
        b=FLxS6KVzp5JsNWRwOmP8nAzL2LPoQdoJlSUV5/yjwsKcAEm+h9LobhdxoQCcw4ERPp
         Yv+gdj7tH7ZhexY47RVAaaiMQ/zNEPhFczztgdynzjnl/nWxKj+AND58RsV318EU5Ah5
         6qGyX/buBNU9pqAn8OfwIvGARQBEuisschpFtqE0/gCAczIuyAST5GXvvRnY1BrT4xBz
         wgHvmZMoU4BXvyVP3+Ytoe67OHoaYKUT6dLPKqfrUyy918RGzxi2yCJ4fdR2zTRuaN+z
         /dQpTKgKFb1DfxprCUgGYaKKBByYp8g/sTBn5ozb7KhVblAfh0GzdChLxrCWvY3niGAV
         mnfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793633091; x=1794237891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=14AmkCgi4mmt5W5fo/fntc4010guDt2zhyM9t6e7JuI=;
        b=nIfGcZMJOrWQF2uUneG/LSpoAaOtSoZJCbjBtLkqLskm6NO/MtV8RskymBEJvjY8GC
         MEHEIrAxtszViszbhQsc8ZsqNb3QpiOdRMdFNLEmwn4Geo7/7j4aj94Jw1+2gKzI1u7c
         CYMkT9GJsGXgrQQvAZH8VbEkVMnlLIbytxZ83BG7RezJhn7rQpaIH62C9rYEl8/N5ERJ
         Wf33xkDBoGFHYcZbvpETbAtmXliUNNBSjuAEGw3D0jXNEX7TuP0s+O5pSWik17Em9KL2
         YSaWQwglwl/t8bCD5OaVBjQcKqqm0Shd6iysTJmHdGplsbmo5MtfBuYy9XY8IlDu5u6S
         BxsA==
X-Gm-Message-State: AFq9FYJq5Uq+Y3T8jEGtjyc0VAyA80SGuIwg8ebd+PSeRqSXxFlhM30M
	HWyi+9cZ/c72UwYSh5nTHOdNDNG8GOvps/wMZxgUi/Ndu8ZZwbfLfqLKrLxROJj3AsQ=
X-Gm-Gg: AYBFou04SOISJKQ/C7mwVJMDmwhMG65EuW1Bvjv57idsohTtJ5m6Z7bimRJcTk5xYB3
	l//taVzvqwuqIog04lX82+aHuE1/I49jlg87kjDl8jkwciFF16WtC6mpq1PT832RAYnPLPLzZpI
	pWtQgP/Z6t2lCMhlTYBQBHfoHdLGGxc3n/7d05oAMdCPuFuUUKT2rEDuUkPyRegB3R6eh0Z96xp
	HB7RbkMRD94fWXtyOA6iuTATZRjtAOhLEUswiC1IH+ScuAhghBeT834uf8HKfgcw0pmYN9u4GIQ
	g8x96Q4FmheoXPQhvEWnQagi4qQIGv50VcGh4Ato5KXgOzrMxK2jLVlTw2HeXxjfq99fakFYArh
	B/HJrTjKTpdZoLGNG2Oe94hOcLTk0U06YEqbHf6UsiBXD3XmHswQxUCYk9IHGzQss/xS5E66Vje
	Erc7bxdAzdy9iy5kxqvHcWiDkbjTAoTPy1O7J3p2522hWcOZ0qIhqLUSLipF1sHZ3KZpTu7koB0
	r4NwK/nDdkyLSefs0Pq7+JiZuflrWPOFbFxCZp6eCOUjiP6+laATDohkrE6z9zMpHZIEeV9cwss
	WO9exXnxonbe0Y1QLF7l2yKI5HmpCME5aI1bnq9c4Be5HpGTGjW/q3XZ0nhrb5nz6fiGm8jJb/f
	i7WwArb81LYT40zJ7E/ON2RH7YssXLaZPU3GTQ34yVS8t9JsTIevM2dzXdIeYrqCtDp9u3rYwiB
	LzoSPbWuI7Bykr7Wr5/MMiclJzydHm7AMbeFitMdrLxBRCvTCJBi0JIxAo8/QLqTG3LB8vMBjLy
	zX22akdP3ji12bwnW5L1HkDlLHvYm9D4xOGMUJT98uDn2QgmSMcZp9yPouiJuVHO1ahJBvDlfSL
	ga34
X-Received: by 2002:a05:7022:7f0b:b0:1ad:1574:aa9d with SMTP id a92af1059eb24-1ad1574aab4mr13186762c88.0.1793633091416;
        Mon, 02 Nov 2026 07:24:51 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac18458e07sm33294963c88.8.2026.11.02.07.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:24:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] glib-2.0: RDEPEND on dbus-daemon for ptests
Date: Mon,  2 Nov 2026 07:24:47 -0800
Message-ID: <20261102152447.3237361-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 15:24:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249217
Content-Type: text/plain; charset="utf-8"

gdbus-tool.py and the memory-monitor/power-profile-monitor tests start
private buses with dbus-daemon (via GTestDBus and python-dbusmock). They
do not need the system bus provider, so depending on
VIRTUAL-RUNTIME_dbus is wrong.
with dbus-broker as the provider there is no dbus-daemon in the image
and these tests fail with

  Error spawning dbus-daemon: Failed to spawn child process "dbus-daemon" (No such file or directory)

Depend on the dbus-daemon package instead, which can be installed
alongside dbus-broker.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index c87104451a..5ac6386494 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -168,7 +168,7 @@ RDEPENDS:${PN}-dev += "${PN}-utils"
 RDEPENDS:${PN}-ptest += "\
             coreutils \
             libgcc \
-            ${VIRTUAL-RUNTIME_dbus} \
+            dbus-daemon \
             desktop-file-utils \
             gnome-desktop-testing \
             tzdata \
