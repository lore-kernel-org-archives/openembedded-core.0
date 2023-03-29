Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2480FC761A6
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 00:26:02 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.12915.1680049557632471055
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Mar 2023 17:25:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=djr9FESx;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id fy10-20020a17090b020a00b0023b4bcf0727so14491431pjb.0
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 17:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680049557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dmS4dO2yKOCBRd5K+X0mEPbnUHXeuWnpwXJC433p0u0=;
        b=djr9FESxZ35rsr3dUNOdgqb6GbmT/JrQDCg9ears/fntbSPVBT7JjeabOautXziEoL
         yldYRBi394PFDP9EdP3Vg7DluT+iB6dbW0HGz1KswyKYo/rbBWawX9ZFePthd9fA4lXa
         B/etL0CZ3YQCUwCdqQOgZu5k8uav2qc5iyXSq2rG0EkCUy1x9TcG+Im9DAgpb6YYV7S9
         xQNkw/DYqBx4Y28XUYxFW129FHev09kpkKdtmB+KsCWLCYfUyZlti5wXz0WHW0YqiFaB
         ZoPlreqzGhEv1yhnIsJtHeZNXi8vuuVDDpMGg26KezcvKhpJft57GiD2Wl19kC0TpXYe
         cJDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680049557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dmS4dO2yKOCBRd5K+X0mEPbnUHXeuWnpwXJC433p0u0=;
        b=VKez88Q6ci0zPv9HXnehSh6ePsTvHUvgBRQ4MtD5nbApEak0mBSlU462tsxdbUGsMc
         jhwCSAT/3ZBX+5UvxrvVqxXwvtwX1TlXw2/9BYQ/FE6e4eEtrFObsJyzM+IGYZo3wHIZ
         +jAAC2L5dLL698Mf0VQQ2pYmEuDglAeosNoqAdZuT1RqaTQPexsjZrLEwQcOPtrxfRCA
         s9BdvLAY93Ta0t72oKCJ/VBWZVUL47hPGRBPr78ei1g+6EGVEAQQVxjCmeZh0xVcE8gH
         6TvbCaeFEzm3EzzmlT0dEogBrjqTUCeKjiRS1apibAQRMu/cLaSQ6hMPAtmZJylr8hR4
         NAuw==
X-Gm-Message-State: AAQBX9ftUCkLbiZohOTE/4SocBRuWzGWEPdwklZB2LonoQRFQ+IK5w9h
	oBlG8TVS5ryvTgeOxqYg8eUnQm/N2iULFw==
X-Google-Smtp-Source: AKy350aLx7kFCuYbaRCdbEEFgqUNi98FEATqvGZyJzZXPMqD7ito7i3/QX+vr5nvGN/tURJ5vH1O0w==
X-Received: by 2002:a05:6a20:3b8f:b0:df:83fe:fb55 with SMTP id b15-20020a056a203b8f00b000df83fefb55mr9059830pzh.35.1680049556581;
        Tue, 28 Mar 2023 17:25:56 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::bed3])
        by smtp.gmail.com with ESMTPSA id q20-20020a62e114000000b0058d92d6e4ddsm21646841pfh.5.2023.03.28.17.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 17:25:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 3/3] maintainers.inc: Add maintainer for libstemmer and appstream-glib
Date: Tue, 28 Mar 2023 17:25:52 -0700
Message-Id: <20230329002552.2260584-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230329002552.2260584-1-raj.khem@gmail.com>
References: <20230329002552.2260584-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 00:26:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179256

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: No change
v3: No change

 meta/conf/distro/include/maintainers.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index e4c233b5ce..342d6913be 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -39,6 +39,7 @@ RECIPE_MAINTAINER:pn-alsa-topology-conf = "Michael Opdenacker <michael.opdenacke
 RECIPE_MAINTAINER:pn-alsa-ucm-conf = "Michael Opdenacker <michael.opdenacker@bootlin.com>"
 RECIPE_MAINTAINER:pn-alsa-utils = "Michael Opdenacker <michael.opdenacker@bootlin.com>"
 RECIPE_MAINTAINER:pn-apmd = "Anuj Mittal <anuj.mittal@intel.com>"
+RECIPE_MAINTAINER:pn-appstream-glib = "Markus Volk <f_l_k@t-online.de>"
 RECIPE_MAINTAINER:pn-apr = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-apr-util = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-apt = "Aníbal Limón <limon.anibal@gmail.com>"
@@ -394,6 +395,7 @@ RECIPE_MAINTAINER:pn-libsoup = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libsoup-2.4 = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libssh2 = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libssp-nonshared = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-libstemmer = "Markus Volk <f_l_k@t-online.de>"
 RECIPE_MAINTAINER:pn-libtasn1 = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libtest-fatal-perl = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-libtest-needs-perl = "Tim Orling <tim.orling@konsulko.com>"
-- 
2.40.0


