Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.840.1795457342842861562
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 10:09:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Fbm1JPVD;
 spf=pass (domain: konsulko.com, ip: 209.85.210.176, mailfrom: tim.orling@konsulko.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a594d313a3so2467208b3a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 10:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795457342; x=1796062142; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wWD5nWF7/V3DbI5cO2uFbGQsPU9hrAONSDDETU7bf4M=;
        b=Fbm1JPVD+L7JwOqsZLt3uooA0OOw2O/prKT7Rpxkd8S+ONFK2vv5Ls72k2N0Y3nQ0y
         BeHZFq3CzoPY/NXabcDYNFLeXxqSTEr6UIn6wSHwWZHQYXz5tk+OAJl2PGn4nfE7une+
         TiM1koBbk4C7VcPP/MYg+cSU+/omTRLq69OuU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795457342; x=1796062142;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wWD5nWF7/V3DbI5cO2uFbGQsPU9hrAONSDDETU7bf4M=;
        b=yBlwkncqzY7/wTWtyap1gq4swisWGeVAmFhSUFVuM85re5kGIfLXrn4To73vPaE3Y4
         CCwbKkNJ4v5naGRhOz34QNURCCc1Yh6wIH1TBbeq1gEP7EOZuv29M8a0DUFQ43MVb/E2
         uBlTvPAJpPUpHXjF0hZZGdtF62lxVvvB7I9EMYoFgIONL24ZBC3FanlUpEOHq3iXL+VZ
         +0wHK//ShYaT1hBccRXZZb6KvCIE8TZdsVxGkOudiaRR7ayZ8M8o2InbNr2oaULPWOV9
         MkX3wrRypPaQ+plpza+RZ3foeEaTMDYPmIweZ3chxuzR+9gcYaPZl+Jmw43QbgOEzxCJ
         9EWg==
X-Gm-Message-State: APuU4Z+mt9783Y6wDsztTClKpMkKHu+m30u+14/jdDKG8BOH5h2p39kR
	flqLUoTmOTgauqbL2yM78z6ts9EwGbkVUnAncoXL0UxOSOnH6a7frrhRj24o9UDuYVz1mmVxv3M
	Tm4GH
X-Gm-Gg: AZFdTZfDWXw+PIq/qrJrL19noou/jhO65xxh3956KGC/OWFkykPCQ5mblN+OqFon1A/
	qPgnmpe+PD9W1vfDRiEzcC/h2YnbmAl7HDARhvXZnZJCAAsWBP8hKcyRDOcTHWLPZW0eNq8aFk7
	cWOHEJpXpndBOEMmS2YjAyGUtpu7BFR38w6StkVhLDnXCT1wy+Bd0bpeckVgnEF0iUqKy8O2A07
	wjdvSS9z+FtZS5NTa2VV0oLaLDd/cFYZkORG7CqkJpZH+NQmG1poOT2Xpr8t28qbEu9DD6UGOqS
	Fsy97tgHK8pyJXQVuLXhHWapc0SEFm6dqcKcelphB5DfGzxLvFywKZbKFEaGgvOTcHdu+LAiZzl
	3ByhmtlWoq5fCtEFOxrXUKcaKiqbjaWWbLlbI3+zKyUZn3CutF8vu8Sfa/grWvuj1gfPL+A5FyW
	eFFfa10vUxVuIiGj7TLm52R0uNTriO+PTFztuBS9xnEcq5DnI+Yfc4ogvkpxyrlOpT6ds6PjWuz
	B1qyipRkFBUzeHoj+SeWUeG0Al3oOibxEthMsLmNFf8QkGuMgNFUaLqa+vH5f9FHNzoxE67O7Au
	6V72SVKuIEFBcYVZxj8iUVzrar+WoeeNJagdu/U2XhHrSgauTO+V+oy2ZFSdk/tZ7e1iBFdgxyd
	N61K1/ogsAvsazpgaaIhI5Kco3a0=
X-Received: by 2002:a05:6a00:1d88:b0:8a0:3483:51ec with SMTP id d2e1a72fcca58-8c87daf425dmr10854128b3a.58.1795457342069;
        Mon, 23 Nov 2026 10:09:02 -0800 (PST)
Return-Path: <tim.orling@konsulko.com>
Received: from thetis.home.local ([2606:c800:6024:2000:33b6:497f:d678:ac85])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8cdfbe269b9sm470365b3a.20.2026.11.23.10.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 10:09:01 -0800 (PST)
From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] at-spi2-core: upgrade 2.62.1 -> 2.62.2
Date: Mon, 23 Nov 2026 10:08:34 -0800
Message-ID: <20261123180833.3218582-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 18:09:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250929
Content-Type: text/plain; charset="utf-8"

What's new in at-spi2-core 2.62.2:

* libatspi: Don't crash when a direct connection fails before the root
  is known.
* libatspi: Notify when an AtspiEventListener's callback is no longer
  valid.
* bus: Send SIGTERM only to the launcher when the unit stops
  (KillMode=mixed in at-spi-dbus-bus.service).
* device-x11: Report each key once while using the raw key fallback.
* device-x11: Don't crash in finalize when the display couldn't be
  opened.
* device-x11: resume keyboard input after handling a synchronous key
  grab.

Upstream release notes:
https://gitlab.gnome.org/GNOME/at-spi2-core/-/blob/2.62.2/NEWS

For a full comparison of changes, see:
https://github.com/GNOME/at-spi2-core/compare/2.62.1...2.62.2

Tested with core-image-minimal (with at-spi2-core) and core-image-sato
testimage on qemux86-64.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../atk/{at-spi2-core_2.62.1.bb => at-spi2-core_2.62.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/atk/{at-spi2-core_2.62.1.bb => at-spi2-core_2.62.2.bb} (94%)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.62.1.bb b/meta/recipes-support/atk/at-spi2-core_2.62.2.bb
similarity index 94%
rename from meta/recipes-support/atk/at-spi2-core_2.62.1.bb
rename to meta/recipes-support/atk/at-spi2-core_2.62.2.bb
index 44b0f7e7cf..bc9c8fa0c2 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.62.1.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.62.2.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 CVE_PRODUCT += "at-spi2-atk"
 
-SRC_URI[archive.sha256sum] = "cca6b6a86e4389d89b370288761ce2385ddeceb10c4412da78689bc30c88af2d"
+SRC_URI[archive.sha256sum] = "7ce81820ddf873b8d930177e0790f730f60d22d8e0acee9ba8f75d8202598de3"
 
 DEPENDS = " \
 	dbus \
-- 
2.47.3

