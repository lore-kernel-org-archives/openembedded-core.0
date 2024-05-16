Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF3C7C25B7B
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 11:27:07 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.11101.1715858820151833089
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 May 2024 04:27:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cOhZ2MXC;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a59a352bbd9so409228866b.1
        for <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 04:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715858818; x=1716463618; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YslvNR2STXCadUbzQBAYysMidrTMxODnCd7XFdp6ZRw=;
        b=cOhZ2MXCKAGpcQ8bZjZA+fcrEwM5Vd4Cvul78qn/h5QgJ8ARI5xgwNdyb4uCX/wqNh
         +aLl7RgbKISApiyg4q4DllIuuMR9j9VVHHVtTkcLRSU//8A/WcU49rZcMm8Rg0Rj2JDM
         7ZmYgp2HT+Vvq9Ho+RSdh1NEATUSdDHMysVtdSLPIzYRDGapWGssSAv5KLB1X463ETN3
         OtRBTSlChICWDt0G4eKe62ywSQvF5cwItUDXBqNKxbBeBmRJt28crVLgcoCen/uMbS4s
         T5iFnjalHD2qoQ5KVGsGVnbkCTMYoJ3Sfc6v1Ogho7GI1bDqeiJ3VVj18xgFmLhubbEl
         OEow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715858818; x=1716463618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YslvNR2STXCadUbzQBAYysMidrTMxODnCd7XFdp6ZRw=;
        b=uWM3h+fub/NxSsAoW7WgeJPNo+AzzPjbMKnSdEUhV7sAof/xbZYSp5kTGQuyLDw6Va
         aVz/pQlIl8C67s6mpFZxdy6xPYQA5jVWGco9BXpR93vP26ko9CB1oAHL57qF7l/yxPbt
         9RjkscUJK51RflIE8Hk29tQms4xcTIgAkt6CWYOchjsQ8agw2VHCEyLkiA+VULgtyiSG
         S9r1kcIab0/zvEtVgOjiaPIsqSKNdQgeewp0kbN3ctnOrxGEs7uAhuNDShBNZ/r+Cas5
         ThwnA+yPrDIZf4h3978rRn88UZVOHTkCivB+7mi7q/m9TogcjMgieYWMEUNGRq4iNOYN
         nDUQ==
X-Gm-Message-State: AOJu0YwN/hi7CdPse6oqeyrLlNNld10Ku/dimRcGJZBRlEVbDIHzvzX+
	8hBztDs/oSc8q4Vto62drl3FrdiZNw6UEwgHbk0rW33i5mreVxatTN58hw==
X-Google-Smtp-Source: AGHT+IFyTWtUY72GfPgWBYuyHYoQRzz6fzTEvVS7oENdfDaxw9eI6VstPj0xINNDm11XyebM85QWmQ==
X-Received: by 2002:a17:906:55cc:b0:a59:a431:a8d6 with SMTP id a640c23a62f3a-a5a2d317577mr1428642166b.38.1715858818511;
        Thu, 16 May 2024 04:26:58 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b18110sm973898366b.225.2024.05.16.04.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 04:26:58 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 10/13] iptables: remove unneeded 0002-iptables-xshared.h-add-missing-sys.types.h-include.patch
Date: Thu, 16 May 2024 13:26:37 +0200
Message-Id: <20240516112640.2145789-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240516112640.2145789-1-alex.kanavin@gmail.com>
References: <20240516112640.2145789-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 11:27:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199477

From: Alexander Kanavin <alex@linutronix.de>

Somewhere on the way it ceased to be necessary.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ed.h-add-missing-sys.types.h-include.patch | 31 -------------------
 .../iptables/iptables_1.8.10.bb               |  1 -
 2 files changed, 32 deletions(-)
 delete mode 100644 meta/recipes-extended/iptables/iptables/0002-iptables-xshared.h-add-missing-sys.types.h-include.patch

diff --git a/meta/recipes-extended/iptables/iptables/0002-iptables-xshared.h-add-missing-sys.types.h-include.patch b/meta/recipes-extended/iptables/iptables/0002-iptables-xshared.h-add-missing-sys.types.h-include.patch
deleted file mode 100644
index a190c7e8ae2..00000000000
--- a/meta/recipes-extended/iptables/iptables/0002-iptables-xshared.h-add-missing-sys.types.h-include.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 465e3ef77f1763d225adc76220e43ee9bd73b178 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Tue, 17 May 2022 10:56:59 +0200
-Subject: [PATCH] iptables/xshared.h: add missing sys.types.h include
-
-This resolves the build error under musl:
-
-| ../../../../../../../workspace/sources/iptables/iptables/xshared.h:83:56: error: unknown type name 'u_int16_t'; did you mean 'uint16_t'?
-|    83 | set_option(unsigned int *options, unsigned int option, u_int16_t *invflg,
-|       |                                                        ^~~~~~~~~
-|       |                                                        uint16_t
-
-Upstream-Status: Submitted [via email to phil@nwl.cc]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-
----
- iptables/xshared.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/iptables/xshared.h b/iptables/xshared.h
-index a200e0d..f543dbf 100644
---- a/iptables/xshared.h
-+++ b/iptables/xshared.h
-@@ -6,6 +6,7 @@
- #include <stdint.h>
- #include <netinet/in.h>
- #include <net/if.h>
-+#include <sys/types.h>
- #include <linux/netfilter_arp/arp_tables.h>
- #include <linux/netfilter_ipv4/ip_tables.h>
- #include <linux/netfilter_ipv6/ip6_tables.h>
diff --git a/meta/recipes-extended/iptables/iptables_1.8.10.bb b/meta/recipes-extended/iptables/iptables_1.8.10.bb
index 5a878977425..cbd727b75df 100644
--- a/meta/recipes-extended/iptables/iptables_1.8.10.bb
+++ b/meta/recipes-extended/iptables/iptables_1.8.10.bb
@@ -14,7 +14,6 @@ SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.xz \
            file://ip6tables.service \
            file://ip6tables.rules \
            file://0001-configure-Add-option-to-enable-disable-libnfnetlink.patch \
-           file://0002-iptables-xshared.h-add-missing-sys.types.h-include.patch \
            file://0004-configure.ac-only-check-conntrack-when-libnfnetlink-.patch \
            "
 SRC_URI[sha256sum] = "5cc255c189356e317d070755ce9371eb63a1b783c34498fb8c30264f3cc59c9c"
-- 
2.39.2


