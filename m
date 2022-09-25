Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23E08C6FA82
	for <webhook@archiver.kernel.org>; Sun, 25 Sep 2022 19:18:42 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.20279.1664133520240652452
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 12:18:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=K2dFBCa5;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id
 s14-20020a17090a6e4e00b0020057c70943so10523224pjm.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 12:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=7PkWI7C33xEce2QnPyJGxxMiA/mvKp0m2o0Mhmk68g4=;
        b=K2dFBCa5mwxoMTHtNtZLZv+Fa8XUc8AWne4xvdAtCrq+YtKKU3MH3+XUXlQoVFWfPG
         +k9l+q1wGryCKFf/l9tbo46+qQSS8kPNJlxEzr38WfFAi0GXEUdB4lg33DBuo55+I07v
         BlHj7btJ7M72iOh8LPlfgP3gx7mOb/T6E5y0MHsZEj3qb8ycBnZOBacxpV0zqKREc6eo
         c4NOaggR+0unNSkd7lHl9gVdLVEssahlT8lmBCaK2ZEtrHklSLOQc6uXqpnbhIGa6POv
         F+v2fjHA38Nfzct/1AL6rk0J1uuVpN3GR4ss9JwEOsIuf61BaD2gA1M8b9R5e/v9bd10
         fisg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=7PkWI7C33xEce2QnPyJGxxMiA/mvKp0m2o0Mhmk68g4=;
        b=m3AaV+RxTe/1rPh9u1Bs1eQb3XzhYEy9WSeAxFza/GH3io7WD0/1svXW7M+uPfLoiU
         HPeA3HLUbz+iYhevddA7P+g3DJZA8/Bh8spBte1cQu7iwx1bATfJZhJOP7jAxDIq+YBj
         mnQI1ow70n7ebC0nsNZmrmhonzQaRKPQYdFY8xdhVWmTzKsC5EtQ9/SquWOqdvMxS0rn
         CfuLEGCtxtUpAmsFgfjhNzd66ETYpsnx+pZ5Hv04VpxiK9HWc9Xlg5pEdFjDsixB7AMz
         uummF40QYl+SbUM2WKkSnlcocOgZJHeMlXofyl3ext2SF67e6Sm+pKQ4598wBeAqivhw
         jt9A==
X-Gm-Message-State: ACrzQf36a4nmB9d8wETIJfngC93AmFgc4gu4NwcmqC4OrbOkaSINkinB
	hRgIPnkwCPvIdQmy3E3lMhNXhKqdP1tnfNoq
X-Google-Smtp-Source: 
 AMsMyM5wkXnOTM4stIYM1wBv2mAb0JMdBE2cfmhENvfd5gbVKlXQP3fNYZMqORH1Q0jQ3npNLLmF+Q==
X-Received: by 2002:a17:902:aa81:b0:173:3f68:e768 with SMTP id
 d1-20020a170902aa8100b001733f68e768mr18524805plr.80.1664133519313;
        Sun, 25 Sep 2022 12:18:39 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f126-20020a625184000000b0053651308a1csm10311257pfb.195.2022.09.25.12.18.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 12:18:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 21/33] tzdata: Update from 2022b to 2022c
Date: Sun, 25 Sep 2022 09:17:32 -1000
Message-Id: 
 <45540e1b5ef1e590ecfecefa513094b81585a934.1664133309.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1664133308.git.steve@sakoman.com>
References: <cover.1664133308.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Sep 2022 19:18:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171035

From: Robert Joslyn <robert.joslyn@redrectangle.org>

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ecf88d151f265e5efb8e1dde5aba3ee2a8b76d8d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 2b956cf7c0..d032fed356 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2022b"
+PV = "2022c"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata \
@@ -14,6 +14,6 @@ SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "bab20d943e59a3218435f48d868a4e552f18d6d7f3dd128660c5660c80b8a05f"
-SRC_URI[tzdata.sha256sum] = "f590eaf04a395245426c2be4fae71c143aea5cebc11088b7a0a5704461df397d"
+SRC_URI[tzcode.sha256sum] = "3e7ce1f3620cc0481907c7e074d69910793285bffe0ca331ef1a6d1ae3ea90cc"
+SRC_URI[tzdata.sha256sum] = "6974f4e348bf2323274b56dff9e7500247e3159eaa4b485dfa0cd66e75c14bfe"
 
-- 
2.25.1


