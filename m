Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58DC2C43217
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 18:25:07 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web09.1135.1652811894148876385
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 11:24:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=fChvVLIU;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id n8so18094610plh.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 11:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=6rakrNGE+2XsOHMToicahJ2jEsDe9O1YDp8kuziPPvM=;
        b=fChvVLIUDY+PXAO4RvDrVKliDqdh6sBfFHmeZeXO3y1Ttw1GJCzXkTRAHIIKWtskcQ
         lvzQpp9dAkmCOWFpTFRmsUTbkrE1cS4Xy0e9YF/ujR//x2P3FHNgKK6fgYpu7GAN+3ah
         DOZ+2t56Zr+fmiVwCQDNGLSoGwM/YOrkBH6GRIngI9CP91e4gW690qSPzm2y/bc5D6Ht
         87Cb/C2X74SSXnQzpPhGrRhC+QgH1ZDFY4xZfcHohCgcAIznwfZFr4ZYQJBeqAuSbS0t
         uiJsS5tc/OExme9JSWx0FAw5klze4wp2iZ4cTJ+9tJ3eZp/6EEfgzdApgPSPlvOozbxq
         olSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6rakrNGE+2XsOHMToicahJ2jEsDe9O1YDp8kuziPPvM=;
        b=X/Vr/lN06o33g3QxdVj7uDbi5Yt/JdqVf4/CDLhohaQYBOd9sP4yfBVdEs9bOE6TqJ
         dacemwyxb7+N1E1Gmpuc6lO6NnBMg19HdNiTox8BqnxfvrtZFK0x07Tn8VE/66dMWjjy
         OxhICIrVzdwF+/FzSGBd27iY9hs3zETVoRh8F1rADnZCUO/xmDErI6auEYHxGofrYzmZ
         t8q4e9roHbwfuuyeBJAmc9klsqEHQdaL6ytqotQJKLcgyYc6eEWkPHTUD+NpJJ+ndI/T
         c9TQnmcL838NnCj7l1tnGuLYoGu+gJJFS2GHWCnk1So/vU0olHIOhEGBiOWGv3ERWg1b
         2l2w==
X-Gm-Message-State: AOAM533xzfN+kbBAVZRq1SxSsREiKs3ZhN7A/aSFm23DjFnxH7APc5gD
	X+xny3qY+8EFggRSWtOREFphoaycLAd1ACFn
X-Google-Smtp-Source: 
 ABdhPJwVvGNuIGS1rvpLd2gjFsCy9KzHtNkZLjffU4Pw4WvMCuNL4mOy5yQPhgTfkL21dm79b5m5+Q==
X-Received: by 2002:a17:90b:4c51:b0:1dc:a734:db94 with SMTP id
 np17-20020a17090b4c5100b001dca734db94mr37525754pjb.24.1652811895530;
        Tue, 17 May 2022 11:24:55 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f9-20020a170902684900b0015e8d4eb1d1sm9408188pln.27.2022.05.17.11.24.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 11:24:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/31] bind: upgrade 9.18.1 -> 9.18.2
Date: Tue, 17 May 2022 08:23:55 -1000
Message-Id: 
 <297215735613b1c9512780580da2f84cf013a603.1652811454.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652811454.git.steve@sakoman.com>
References: <cover.1652811454.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 May 2022 18:25:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165754

From: Alexander Kanavin <alex.kanavin@gmail.com>

Update to latest stable branch release

Bug Fixes

- Previously, zone maintenance DNS queries retried forever if the destination
  server was unreachable. These queries included outgoing NOTIFY messages,
  refresh SOA queries, parental DS checks, and stub zone NS queries. For example,
  if a zone had any nameservers with IPv6 addresses and a secondary server without
  IPv6 connectivity, that server would keep trying to send a growing amount of
  NOTIFY traffic over IPv6. This futile traffic was not logged. This excessive
  retry behavior has been fixed. [GL #3242]

- A number of crashes and hangs which could be triggered in dig were identified and
  addressed. [GL #3020] [GL #3128] [GL #3145] [GL #3184] [GL #3205] [GL #3244] [GL #3248]

- Invalid dnssec-policy definitions, where the defined keys did not cover both KSK
  and ZSK roles for a given algorithm, were being accepted. These are now checked,
  and the dnssec-policy is rejected if both roles are not present for all algorithms
  in use. [GL #3142]

- Handling of TCP write timeouts has been improved to track the timeout for each TCP
  write separately, leading to a faster connection teardown in case the other party
  is not reading the data. [GL #3200]

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5398263c8e070110a045a5f8999712ba4be628de)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0001-avoid-start-failure-with-bind-user.patch               | 0
 .../0001-named-lwresd-V-and-start-log-hide-build-options.patch  | 0
 .../bind-ensure-searching-for-json-headers-searches-sysr.patch  | 0
 .../bind/{bind-9.18.1 => bind-9.18.2}/bind9                     | 0
 .../bind/{bind-9.18.1 => bind-9.18.2}/conf.patch                | 0
 .../bind/{bind-9.18.1 => bind-9.18.2}/generate-rndc-key.sh      | 0
 .../init.d-add-support-for-read-only-rootfs.patch               | 0
 .../make-etc-initd-bind-stop-work.patch                         | 0
 .../bind/{bind-9.18.1 => bind-9.18.2}/named.service             | 0
 .../bind/{bind_9.18.1.bb => bind_9.18.2.bb}                     | 2 +-
 10 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind-9.18.1 => bind-9.18.2}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.1 => bind-9.18.2}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.1 => bind-9.18.2}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.1 => bind-9.18.2}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.1 => bind-9.18.2}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.1 => bind-9.18.2}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.1 => bind-9.18.2}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.1 => bind-9.18.2}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.1 => bind-9.18.2}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.18.1.bb => bind_9.18.2.bb} (98%)

diff --git a/meta/recipes-connectivity/bind/bind-9.18.1/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.18.2/0001-avoid-start-failure-with-bind-user.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.1/0001-avoid-start-failure-with-bind-user.patch
rename to meta/recipes-connectivity/bind/bind-9.18.2/0001-avoid-start-failure-with-bind-user.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.1/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.18.2/0001-named-lwresd-V-and-start-log-hide-build-options.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.1/0001-named-lwresd-V-and-start-log-hide-build-options.patch
rename to meta/recipes-connectivity/bind/bind-9.18.2/0001-named-lwresd-V-and-start-log-hide-build-options.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.1/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.18.2/bind-ensure-searching-for-json-headers-searches-sysr.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.1/bind-ensure-searching-for-json-headers-searches-sysr.patch
rename to meta/recipes-connectivity/bind/bind-9.18.2/bind-ensure-searching-for-json-headers-searches-sysr.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.1/bind9 b/meta/recipes-connectivity/bind/bind-9.18.2/bind9
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.1/bind9
rename to meta/recipes-connectivity/bind/bind-9.18.2/bind9
diff --git a/meta/recipes-connectivity/bind/bind-9.18.1/conf.patch b/meta/recipes-connectivity/bind/bind-9.18.2/conf.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.1/conf.patch
rename to meta/recipes-connectivity/bind/bind-9.18.2/conf.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.1/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.18.2/generate-rndc-key.sh
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.1/generate-rndc-key.sh
rename to meta/recipes-connectivity/bind/bind-9.18.2/generate-rndc-key.sh
diff --git a/meta/recipes-connectivity/bind/bind-9.18.1/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.18.2/init.d-add-support-for-read-only-rootfs.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.1/init.d-add-support-for-read-only-rootfs.patch
rename to meta/recipes-connectivity/bind/bind-9.18.2/init.d-add-support-for-read-only-rootfs.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.1/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.18.2/make-etc-initd-bind-stop-work.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.1/make-etc-initd-bind-stop-work.patch
rename to meta/recipes-connectivity/bind/bind-9.18.2/make-etc-initd-bind-stop-work.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.1/named.service b/meta/recipes-connectivity/bind/bind-9.18.2/named.service
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.1/named.service
rename to meta/recipes-connectivity/bind/bind-9.18.2/named.service
diff --git a/meta/recipes-connectivity/bind/bind_9.18.1.bb b/meta/recipes-connectivity/bind/bind_9.18.2.bb
similarity index 98%
rename from meta/recipes-connectivity/bind/bind_9.18.1.bb
rename to meta/recipes-connectivity/bind/bind_9.18.2.bb
index 6aa832f8f5..1c77aceb9f 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.1.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.2.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "57c7afd871694d615cb4defb1c1bd6ed023350943d7458414db8d493ef560427"
+SRC_URI[sha256sum] = "2e4b38779bba0a23ee634fdf7c525fd9794c41d692bfd83cda25823a2a3ed969"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.25.1


