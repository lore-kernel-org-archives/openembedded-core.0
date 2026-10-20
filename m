Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4777.1792538585798795586
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 16:23:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20251104.gappssmtp.com header.s=20251104 header.b=nwoFn64M;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1df146015so765335e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 16:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20251104.gappssmtp.com; s=20251104; t=1792538584; x=1793143384; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1rUBt72Lyahg85E1nZecdNcffpsTWSU9wWe9BcqKoTo=;
        b=nwoFn64MGQcW0WFBDwyY6hDL20Z6+A+VVcoYv2Nbp8TIqR0xO+jEbJ6qpMGHzn1lYJ
         3q5YQIOGcJlAr4pr1GJZ7aynLjBlL/MzH4ma1qUsf0pAx+6YMT+R4/eUoi8Oe3eB/oee
         5p+h8h1grvJHzaExofFifhLurEFFcmo0/wxckW6UPxEh0ldMHNovp4by7vllZkrJH9Ds
         mmO6G26nmAgDubjFbn59NELX7pMx1UCF+O9al0jVvJqEeU4htpLWNUgqjQZTTZYxPFzm
         W5KPHui7VpftS6pOzszHOgp66CT6gd2goy8oUF1OD4ZncMlF20QSqpZ4A5UJbHFXTU+x
         9wzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792538584; x=1793143384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1rUBt72Lyahg85E1nZecdNcffpsTWSU9wWe9BcqKoTo=;
        b=IJ1Tpf1oqMoZoubgfJSTx2tE9nMsv16cNvOtwwV5qwZFRFWlpddscoUP0idK82nITJ
         wOVX9evOudWS1tEL8n2ATBQ7WbvM0BYbriX5FSbW0LJGKpR/p7136tq2iv2JGuIQUpLo
         1ZrGjksxV7nhyRARLOv5lWrSyMoGHdm+j181iyVkAggOkA/VeVvqjbCUOtMjgahIcTma
         XChKR01fwZSILXoI3KAiNJoiCTQKbzV66x7NDiUp7FopNx9/bE/kCnmo6gD5CI3W4Gg7
         pF2TIx5aG4LuvOvQh7ThKgzjgsfuWbkmSQy3BvTdoAqF0kL4G5aYXgOWX7UoOUKyUcrX
         bhqA==
X-Gm-Message-State: AFq9FYIdnGnAzNu5pooFCNo0qWaJPRAoWJVyvNcQqeSVEZsL5P0UDvXb
	H/Eq4TQ9yc5ue9FcRNL9qw45uTLB15qdSr4Pjbt0p9GaGAl5HMMomQA+UeBdQk+lntBrY/WBnxR
	a27th9ns=
X-Gm-Gg: AYBFou2p+s4G0/6EYyZihlBG7hK7oME6ofjZahpLgw/KiVa7i/9yMXf8dUwCGoJXigO
	QLmKkCKQpC/ZucT7wVWqN+gc99fH3PbXTxysv8+hXfUShjKyQbMgXBr/pscizyH7NSZrOXI+TRi
	q+L+2zJ4Wbp6Pf1Ad7lQpAhNdrAF/nqYalmFOfEGmqcVQNLkHcRmTEL/cf3UsbeG4OWrz8mvnLs
	5h6OH9TOaiekVuV1g9p+4SWOheaZQ0ty+C/Umh9QfkxT1kSGyTFRdIxlzYCo4ur9vhErQqW4cEd
	PFZxvY/BfnlPYGxyxtF2CNEnce6ztl1U+He8ITfWHebTo0VYfQx/H4ZwqPI91kBQuxuz++oZGq1
	32ljVXMw2fBVbmTtPDOv2dAjAQBu2NjlvbEEAOq/nHtZYBUBnqXI0y/Dx2FHv7bcyj33cl8+kae
	xo0vSPz4Bpzgy6yMKMq7akU9zTscvCHdgbZ40Nf8+rVwTa1kdDd4wX9xLs31Izf3bWMhpIzYt2B
	Nm3018yQL+E+5sA4BCS9pcPepvSHoXKETfpZQJFYlyGZDhE0j9y6gZRpz7vr/hswsLCM2dw+jbI
	A086bNXiaNj/xEqcOE3l1U3eerB/OZpfg5ddA8n55kjM+i+xLKgg0LVs
X-Received: by 2002:a05:600c:c16e:b0:4a0:25c:8af2 with SMTP id 5b1f17b1804b1-4a1fdd12dbcmr3517535e9.17.1792538584018;
        Tue, 20 Oct 2026 16:23:04 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583523asm1436615f8f.37.2026.10.20.16.23.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 16:23:03 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 22/25] lttng-ust: upgrade 2.14.0 -> 2.14.3
Date: Wed, 21 Oct 2026 01:22:32 +0200
Message-ID: <c2177f4955950db97883486f76be07ac45cebf8e.1792537664.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792537664.git.yoann.congal@smile.fr>
References: <cover.1792537664.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 23:23:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248341
Content-Type: text/plain; charset="utf-8"

From: Daniel Turull <daniel.turull@ericsson.com>

Changes 2.14.1-2.14.3 (from ChangeLog):
- Fix: stream instance id mismatch for populated packets in
  per-channel ringbuffers
- fix: shmp()/message-size/zero_file/sigevent hardening
- fix: close_range and fd-tracker memory/efficiency issues
- fix: lttng_ust_build_bug_on undefined behavior in C++ builds
- fix: ustctl sigbus handling statement with no effect

Both carried patches rebased cleanly, no changes needed.

Verified do_compile succeeds.

AI-Generated: Uses Kiro with Claude Sonnet 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../lttng/{lttng-ust_2.14.0.bb => lttng-ust_2.14.3.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{lttng-ust_2.14.0.bb => lttng-ust_2.14.3.bb} (96%)

diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb b/meta/recipes-kernel/lttng/lttng-ust_2.14.3.bb
similarity index 96%
rename from meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb
rename to meta/recipes-kernel/lttng/lttng-ust_2.14.3.bb
index 4285a445d67..b567dea1f6c 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.14.3.bb
@@ -35,7 +35,7 @@ SRC_URI = "https://lttng.org/files/lttng-ust/lttng-ust-${PV}.tar.bz2 \
            file://0001-lttng-ust-common-link-with-liburcu-explicitly.patch \
            "
 
-SRC_URI[sha256sum] = "82cdfd304bbb2b2b7d17cc951a6756b37a9f73868ec0ba7db448a0d5ca51b763"
+SRC_URI[sha256sum] = "3c232b514f33c4248ce23155f64ad272fdaae3323255f69d5e7a5c3d6812b7ea"
 
 CVE_PRODUCT = "ust"
 
