Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3563.1794686916689630989
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Nov 2026 12:08:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=OlarRG4u;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so3335735a91.3
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Nov 2026 12:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794686916; x=1795291716; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JYn6BSHe7BJtJSEPGbMy8ChAdIVTICc83M5zQfExSCY=;
        b=OlarRG4uYFK6eCZVZJtpFDEuLw9JmPTkQOZE76H4Uv0jg01fSiQiS0f8TawVSXBOf4
         dtJ22DwVsip5l6QTMEXgHsLhd8ixBMTBQsieCIXI2y82B5NABQQqgocqCfJ7Z5enaVCn
         x2z5tSMtR4ZbH+iF8dC3+AsxVZZeNinOr2sQi3EA0TbSB+x8xXay/p2T/EeNAXh2otrk
         AAMp6BiOoFhGa+uxCE9KAJgO9cItTYZX5bQXCqG+jslYGYshPXtMw7az6JtCScsoHEG0
         U2sXZMznqd0rlb42wts3RPbhG82wK0XPq+NzWggoTUtCrjTGwgWVEnUeQTT4QxCmbI4u
         wzQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794686916; x=1795291716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JYn6BSHe7BJtJSEPGbMy8ChAdIVTICc83M5zQfExSCY=;
        b=HOcqK5H4mw0AJ11/vqMdOX/7pOJrZy4An9XGrMI8dWL85HONDs5byfHelk6lkwWYTM
         /vacWfB69afU5pQ3goR8TB/A5IiKm/AUXwWZaZqDGDq6BqwqsU2rzHiG+lzEu6mCQ6dn
         IMs472hH7dG5mUU5pdT1550bnmHGmlGGpsV9ElneNbLgxyEP0vipNb6q64vDNjUT7J1x
         pJdV9+zXY9jiY2iqWyymfVqRKoxWaZrxd17jA/ouoICcoFzLtKdtlD1jYrcm8xOZKdxZ
         hwXsiDKDaQxGaV4zwWdG3e45rPiimJRXRZ3UX8A29smAQelIvvr7JVASBw85Usl3ZD6G
         eNRA==
X-Gm-Message-State: APuU4Z+dvWp5bG13cCThMmP8Zicc5qxj5wV33J2m9CIsTp+wVYf7Hmmy
	Ii6/NZFBx3+TISyiotA//YbsyiBRbCyZlTqVA56DsFRLDUzbSbGXsvfosqUx35Uj
X-Gm-Gg: AYBFou21iRWdeINZIJE6pD71+A3A1VyuO0jzWxZle2l5nsv4wj0HLc9BgO5bYhREQVm
	Cj598t8ccpgbAX9/pCyJADDwWRQc7z7aSNd6xUgKsyerd3NWP6pafiPj3Fzc4Jw4N0xfBSGWcK4
	pQbVfdDPxuK0m+EEvgd5mpwIHy9KCxU1jWv356vF6oUnZDSuPa1iFmQs15AW1CdROsCr03J6/98
	o4owt8+lT8ooo0xA0Bj79Z4Vdh4rcaEDP3/bPr0Ld1vXUVpzKPnfncl2XBf7WSlUt038ftMesxB
	wLIOEC1DS4CFqD8GRonOztbQgO8iCVgwY2ipGmglDzEnccUlD9wvOhfBKAJ4OPACiyASrn0oPgG
	M2Neqq4lcTsfw0Cfdw1prIdYu4JgU/aMCWGUzszG2HLcc5AeOupVLBSaAkJsNWzhT25u3Mtp2jV
	5xt8hpQcyqtHql5xnLTrErG/X+8q3Y+PPGD+DbAcPlV2a+kVjbM99NH0o2eM7uZHgJ0CZvnztQq
	Q58B+omc05/zz9py0lvRfaImUN99GCjGV2bWUZmM9OTuvBnCGVl31fU2Y7P59R2jBiVprlBE7AR
	HY6+grDwjv5Jj7ZoQQCa9ZI983KFztqwXDJyAOFtwk9vhYryI8HrkkyG4E3U6Q==
X-Received: by 2002:a17:90b:1fc4:b0:3ab:188b:c5bf with SMTP id 98e67ed59e1d1-3b1b0b57dc8mr6194333a91.18.1794686915960;
        Sat, 14 Nov 2026 12:08:35 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from localhost.localdomain ([69.9.132.159])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197b76ccesm14965358a91.0.2026.11.14.12.08.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 14 Nov 2026 12:08:34 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 1/3] lib/oe/distro_check: skip a distro whose package list can't be fetched
Date: Sat, 14 Nov 2026 12:08:08 -0800
Message-ID: <20261114200810.31078-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114200810.31078-1-tim.orling@konsulko.com>
References: <20261114200810.31078-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 14 Nov 2026 20:08:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250209
Content-Type: text/plain; charset="utf-8"

When a fetcher raised, create_distro_packages_list() only warned and
then used release and package_list anyway, failing with
UnboundLocalError on the first distro, so no package lists were
written at all. Move on to the next distro instead.

Tested by making the Debian fetcher raise: the other four package
lists are written.

[YOCTO #16503]

AI-Generated: Claude Opus 5.5
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/lib/oe/distro_check.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oe/distro_check.py b/meta/lib/oe/distro_check.py
index 1d78348ff3..56f81e630d 100644
--- a/meta/lib/oe/distro_check.py
+++ b/meta/lib/oe/distro_check.py
@@ -170,6 +170,7 @@ def create_distro_packages_list(distro_check_dir, d):
             release, package_list = fetcher_func(d)
         except Exception as e:
             bb.warn("Cannot fetch packages for %s: %s" % (name, e))
+            continue
         bb.note("Distro: %s, Latest Release: %s, # src packages: %d" % (name, release, len(package_list)))
         if len(package_list) == 0:
             bb.error("Didn't fetch any packages for %s %s" % (name, release))
-- 
2.56.1

