Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F25F7C10F31
	for <webhook@archiver.kernel.org>; Tue, 13 Dec 2022 11:11:46 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.70918.1670929888100924406
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Dec 2022 03:11:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QTmCIIYL;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id o5so15237654wrm.1
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 03:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eK4WjCbJy51oOUhakYCmqHdEcyZ1szGEdTbAdbf4UTk=;
        b=QTmCIIYLfUFMd6RcXu6OgD83IJP3ffJlBGPKzabt75zBJPJ1Woe+SKVC8T4SLcyLYg
         md3S0/TCYc9y7y+01TJBFHCi+yEDfzxEYeHjT6Xl/PI6hI/qJjboes5cIUN33OO/zf8P
         vhNvGTr2h20cbSCvOsXXjXEP/ibnTrS8Egcxi8Q0806FhiD99uF9mbnG/Oc6/wJEQnoh
         WKEjdSCfR2vtvwZmc0e5rbBNKLOPLYFkXM9kp1tMojBZr7jwK2Bm760KwgZcLEWEr8De
         zMYjFCZZdG8CpuIlmG8KnfIclyKxnGwBZgG3J+KgtJ6GIU5vrNGGezdVQnFvdcXIbHWS
         quhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eK4WjCbJy51oOUhakYCmqHdEcyZ1szGEdTbAdbf4UTk=;
        b=hEAkaa667lhXmpRzUDGKeg4aR5ZoHwnnXdZxvA0TMLYqKYJaTvyQxR/f4cd4h8OOwq
         WpvzoC06K/S6cG7hU1r1nKCxiANgZKISG8XeQFNqF1Lr4jiGOU4Jw5TvL1tJZaSgsXy+
         sOHSNjLzswHKF91orzLE0o7g5rHicNbHwhNS++Tjj0ln4Ks3zXSA+zrp8eBYl++MzKbB
         LQMPGwXg4YYRISCp07lvm4z5xsZZQgj0r/WRl0BUfxPUUgM4Q9U78s3FHmAKRKZxhjlP
         50S6nUNGIj5IxLZWFMr1P2l2E+YS6bJjw1JEELVvWaFzAcSXRW5+5gp+DwcmDmL8i9Kn
         zVFQ==
X-Gm-Message-State: ANoB5pnM9/YWy/wTDdQkqfz9IWMsT9FaYKTr5Byi26+iebqH97YMB6WV
	rY56P7J6jdTjk7ZvY63aVxnJJTggS9c=
X-Google-Smtp-Source: AA0mqf5oItBFqr0l1bo+hsKk3CKD4M4hG1aCS+JA2VNCtCxkq3c1hcO4EkQFZtDYqM6gSLY3TmuAfQ==
X-Received: by 2002:a5d:484e:0:b0:242:154e:5f14 with SMTP id n14-20020a5d484e000000b00242154e5f14mr12745471wrs.17.1670929899520;
        Tue, 13 Dec 2022 03:11:39 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m8-20020a056000008800b002366c3eefccsm11362665wrx.109.2022.12.13.03.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 03:11:39 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 22/24] tzdata: update 2022d -> 2022g
Date: Tue, 13 Dec 2022 12:11:16 +0100
Message-Id: <20221213111118.149697-22-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221213111118.149697-1-alex@linutronix.de>
References: <20221213111118.149697-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 11:11:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174532

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-extended/timezone/timezone.inc | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index d3c78e9157..1834665a1e 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2022d"
+PV = "2022g"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata \
@@ -14,6 +14,5 @@ SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "d644ba0f938899374ea8cb554e35fb4afa0f7bd7b716c61777cd00500b8759e0"
-SRC_URI[tzdata.sha256sum] = "6ecdbee27fa43dcfa49f3d4fd8bb1dfef54c90da1abcd82c9abcf2dc4f321de0"
-
+SRC_URI[tzcode.sha256sum] = "9610bb0b9656ff404c361a41f3286da53064b5469d84f00c9cb2314c8614da74"
+SRC_URI[tzdata.sha256sum] = "4491db8281ae94a84d939e427bdd83dc389f26764d27d9a5c52d782c16764478"
-- 
2.30.2


