Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED302C4167B
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 17:38:35 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.15986.1672594679357675460
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 09:38:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=eDHJvgMW;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id v3so17145978pgh.4
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 09:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0wZUUPDUWwjYB2N26ZiIdWErgkZrc0rOF65snY+qPLo=;
        b=eDHJvgMWN4FtIZRI3jJlejYmhWOMkVtIXaIgHgn6VeSFPFBHuku3KZ+dY9TWkXBVE1
         UvFxrZzzRNRZRcviUmGYPZ0ICFBCo8PeQGQAeZSY5exS3dImAaLmrpruD6Ks76brfQdc
         TmQIRpkZ/KeDnmMIMa6p0Iwl0JPr9LVTt4sF8PdZ1U0mq44l1Bo6eyaHVyNEi1nvxgkP
         3srv+/Y1XCfPZ22k6Miq6LviIqk0CiJbnRUFPrYPFODsNw/TPHJ8xi176c+xA0Fmbd05
         kDA2p668R17cK6MPjBS+RyxVjnVYBGMvMzkt+1xslCkd9xF6gJ9eikNYIup7WA1c5EAi
         7FZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0wZUUPDUWwjYB2N26ZiIdWErgkZrc0rOF65snY+qPLo=;
        b=3oxuLuEOGYWOymU9Sl5OJouWbtmSbhszr2htNjwvdSaS09+kjJDZ+g7AnEh9mg4viD
         2XaCKHc639eWBLfT1gIQ18fquieg31gvwcIh7nTYoCe6LMSOsutOjGW3/UsIbayZG1DO
         hholnbE5unvRZZ/umPJ8GyJuaIpkOmIdyCAy5dK3xEPzJNPCSwFfcycNpr9ZZJOBntdH
         Qf+GQN8+WaRAdVL3I1rT0+FzYH1c6O1IVkASNRQHS5mrV7sD+3S86kcJM7bks4juSttn
         LmQ7ctFFrsWfxkGaHK5dG7bBjW8Ds55GKKxkhPgltGyf/9cDkjtZysgCNSBd1128C6t2
         E8kA==
X-Gm-Message-State: AFqh2kqcg9lPgxDmDUCcwpKvgmWaQBvPuO8b0aQ9XUUUQAUqk7tjK5gh
	hDEcymTHEqjNEuWAcz1pCDAu84viAqCkYs6h1fc=
X-Google-Smtp-Source: AMrXdXsHkjmo2VHzjedkUNI4zHx2CjPqaXpg0AHfrQYH7i/ejjTiDHiW5Sf+vZnrSW5euUMjmlNJTg==
X-Received: by 2002:a62:e711:0:b0:57a:84dd:a70c with SMTP id s17-20020a62e711000000b0057a84dda70cmr42729399pfh.15.1672594711001;
        Sun, 01 Jan 2023 09:38:31 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id v63-20020a626142000000b005828071bf7asm102299pfb.22.2023.01.01.09.38.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 09:38:30 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 17/29] tzdata: update 2022d -> 2022g
Date: Sun,  1 Jan 2023 07:37:39 -1000
Message-Id: <d65667bdc7c9e421b87441efe2582335c0f0df2a.1672594521.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1672594521.git.steve@sakoman.com>
References: <cover.1672594521.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 17:38:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175205

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 2394a481db1b41ad4581e22ba901ac76fa7b3dcd)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


