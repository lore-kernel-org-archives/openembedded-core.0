Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1686EB64DC
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 06:34:14 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.7091.1687847649759237604
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jun 2023 23:34:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=W7bvU/us;
 spf=pass (domain: mvista.com, ip: 209.85.210.171, mailfrom: sdoshi@mvista.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6686ef86110so2006359b3a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Jun 2023 23:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1687847648; x=1690439648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qlj94OAjGD0MQfeaeChXNeblRkj2zQ7w1qjlqjrl97I=;
        b=W7bvU/usOsL+QBzoGzbmY/UyWdjlhN1iGpd2yMOx4RI3ahv9jnPsMibIDZ6fmlfLmg
         QI/WR+JpiuxnxN/ec1lkpGOad8v5iFBvvE9AvR82jetRNDkqvf0TkqI1wI8sHotzlBSv
         L2yQfkLGgnsTavx1rLe00EUAA0h5DFQGhOvcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687847648; x=1690439648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qlj94OAjGD0MQfeaeChXNeblRkj2zQ7w1qjlqjrl97I=;
        b=SynC8FtfbGQej1LJWTWsGO2bKORV5I1ka+zIuYnN0go2I915JrGKAyThxiuDoKcCCq
         o3sS0HN/2qUwD34lHci3kXDt24qQ2zRs17E4Zv07ME7fwBpdUNOXunHPc7Bom28PJ01m
         PXTCy5LgcL5NdP0x0HtRTfCPbPQhnNTNSa9iki1V+UdD2ONi51XVTLASM5Zrf1ClsePE
         OKVLalkoRHjQEuIAazUOVuxVL7/ahGYlwVvQDQwR2DZVkZq+M24+wcD2Mybj7/VsKzOf
         zc3EkPJRGlkmxwD/TV1JwR7JzuI8kg0dBVb/Z/BAklKADf9iA7zdS/Ev8cqFVbGjveGL
         XWGQ==
X-Gm-Message-State: AC+VfDw25oLEYWoo/MOSxz89EDZLKU6astypj6WkrU7WUpAjtyFC5IZp
	w3D29VSobr8OH9p/XUtQ+A8m9XVtR8g3cZIigms=
X-Google-Smtp-Source: ACHHUZ5bY0xfK4aIoPIRL/Dyb06nstKtBGgo6WsFoXqFkuQavKVnhfh5UwRabib6/4KrXWw/u1IDAg==
X-Received: by 2002:a05:6a20:12d3:b0:122:8096:7012 with SMTP id v19-20020a056a2012d300b0012280967012mr16787954pzg.3.1687847648267;
        Mon, 26 Jun 2023 23:34:08 -0700 (PDT)
Received: from siddharth-latitude-3420.mvista.com ([49.34.217.132])
        by smtp.gmail.com with ESMTPSA id a6-20020a1709027d8600b001b392bf9192sm5183501plm.145.2023.06.26.23.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 23:34:07 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][master][PATCH] bind: Upgrade 9.18.15 -> 9.18.16
Date: Tue, 27 Jun 2023 12:02:00 +0530
Message-Id: <20230627063200.12025-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 06:34:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183438

From: Siddharth Doshi <sdoshi@mvista.com>

- Remove configure options no longer supported online.

Changelog:
=========
[security]	A query that prioritizes stale data over lookup
		triggers a fetch to refresh the stale data in cache.
		If the fetch is aborted for exceeding the recursion
		quota, it was possible for 'named' to enter an infinite
		callback loop and crash due to stack overflow. This has
		been fixed. (CVE-2023-2911) [GL #4089]

[security]	Improve the overmem cleaning process to prevent the
		cache going over the configured limit. (CVE-2023-2828)
		[GL #4055]

[performance]	Reduce memory consumption by allocating properly
		sized send buffers for stream-based transports.
		[GL #4038]

[bug]		Fix a 'clients-per-query' miscalculation bug. When the
		'stale-answer-enable' options was enabled and the
		'stale-answer-client-timeout' option was enabled and
		larger than 0, named was taking two places from the
		'clients-per-query' limit for each client and was
		failing to gradually auto-tune its value, as configured.
		[GL #4074]

[func]		Add "ClientQuota" statistics channel counter, which
		indicates the number of the resolver's spilled queries
		due to reaching the clients per query quota. [GL !7978]

[bug]		Fix a serve-stale bug where a delegation from cache
		could be returned to the client. [GL #3950]

[cleanup]	Remove configure checks for epoll, kqueue and
		/dev/poll. [GL #4098]

[func]		The "tkey-dhkey" option has been deprecated; a
		warning will be logged when it is used. In a future
		release, Diffie-Hellman TKEY mode will be removed.
		[GL #3905]

[bug]		The session key object could be incorrectly added
		to multiple different views' keyrings. [GL #4079]

[bug]		Fix an interfacemgr use-after-free error in
		zoneconf.c:isself(). [GL #3765]

[test]		Add support for using pytest & pytest-xdist to
		execute the system test suite. [GL #3978]

[bug]		BIND could get stuck on reconfiguration when a
		'listen' statement for HTTP is removed from the
		configuration. That has been fixed. [GL #4071]

[bug]		Properly process extra "nameserver" lines in
		resolv.conf otherwise the next line is not properly
		processed. [GL #4066]

[bug]		named could crash when deleting inline-signing zones
		with "rndc delzone". [GL #4054]

[bug]		Fix a logic error in dighost.c which could call the
		dighost_shutdown() callback twice and cause problems
		if the callback function was not idempotent. [GL #4039]

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../0001-avoid-start-failure-with-bind-user.patch             | 0
 ...0001-named-lwresd-V-and-start-log-hide-build-options.patch | 0
 ...bind-ensure-searching-for-json-headers-searches-sysr.patch | 0
 .../bind/{bind-9.18.15 => bind-9.18.16}/bind9                 | 0
 .../bind/{bind-9.18.15 => bind-9.18.16}/conf.patch            | 0
 .../bind/{bind-9.18.15 => bind-9.18.16}/generate-rndc-key.sh  | 0
 .../init.d-add-support-for-read-only-rootfs.patch             | 0
 .../make-etc-initd-bind-stop-work.patch                       | 0
 .../bind/{bind-9.18.15 => bind-9.18.16}/named.service         | 0
 .../bind/{bind_9.18.15.bb => bind_9.18.16.bb}                 | 4 ++--
 10 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/bind/{bind-9.18.15 => bind-9.18.16}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.15 => bind-9.18.16}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.15 => bind-9.18.16}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.15 => bind-9.18.16}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.15 => bind-9.18.16}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.15 => bind-9.18.16}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.15 => bind-9.18.16}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.15 => bind-9.18.16}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.15 => bind-9.18.16}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.18.15.bb => bind_9.18.16.bb} (96%)

diff --git a/meta/recipes-connectivity/bind/bind-9.18.15/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.18.16/0001-avoid-start-failure-with-bind-user.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.15/0001-avoid-start-failure-with-bind-user.patch
rename to meta/recipes-connectivity/bind/bind-9.18.16/0001-avoid-start-failure-with-bind-user.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.15/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.18.16/0001-named-lwresd-V-and-start-log-hide-build-options.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.15/0001-named-lwresd-V-and-start-log-hide-build-options.patch
rename to meta/recipes-connectivity/bind/bind-9.18.16/0001-named-lwresd-V-and-start-log-hide-build-options.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.15/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.18.16/bind-ensure-searching-for-json-headers-searches-sysr.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.15/bind-ensure-searching-for-json-headers-searches-sysr.patch
rename to meta/recipes-connectivity/bind/bind-9.18.16/bind-ensure-searching-for-json-headers-searches-sysr.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.15/bind9 b/meta/recipes-connectivity/bind/bind-9.18.16/bind9
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.15/bind9
rename to meta/recipes-connectivity/bind/bind-9.18.16/bind9
diff --git a/meta/recipes-connectivity/bind/bind-9.18.15/conf.patch b/meta/recipes-connectivity/bind/bind-9.18.16/conf.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.15/conf.patch
rename to meta/recipes-connectivity/bind/bind-9.18.16/conf.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.15/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.18.16/generate-rndc-key.sh
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.15/generate-rndc-key.sh
rename to meta/recipes-connectivity/bind/bind-9.18.16/generate-rndc-key.sh
diff --git a/meta/recipes-connectivity/bind/bind-9.18.15/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.18.16/init.d-add-support-for-read-only-rootfs.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.15/init.d-add-support-for-read-only-rootfs.patch
rename to meta/recipes-connectivity/bind/bind-9.18.16/init.d-add-support-for-read-only-rootfs.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.15/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.18.16/make-etc-initd-bind-stop-work.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.15/make-etc-initd-bind-stop-work.patch
rename to meta/recipes-connectivity/bind/bind-9.18.16/make-etc-initd-bind-stop-work.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.15/named.service b/meta/recipes-connectivity/bind/bind-9.18.16/named.service
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.15/named.service
rename to meta/recipes-connectivity/bind/bind-9.18.16/named.service
diff --git a/meta/recipes-connectivity/bind/bind_9.18.15.bb b/meta/recipes-connectivity/bind/bind_9.18.16.bb
similarity index 96%
rename from meta/recipes-connectivity/bind/bind_9.18.15.bb
rename to meta/recipes-connectivity/bind/bind_9.18.16.bb
index 80164aad87..1b1649566a 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.15.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.16.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "28ae8db14862801bc2bd4fd820db00667d3f1ff9ae9cc2d06a0ef7810fed7a4e"
+SRC_URI[sha256sum] = "c88234fe07ee75c3c8a9e59152fee64b714643de8e22cf98da3db4d0b57e0775"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
@@ -39,7 +39,7 @@ PACKAGECONFIG[readline] = "--with-readline=readline,,readline"
 PACKAGECONFIG[libedit] = "--with-readline=libedit,,libedit"
 PACKAGECONFIG[dns-over-http] = "--enable-doh,--disable-doh,nghttp2"
 
-EXTRA_OECONF = " --disable-devpoll --disable-auto-validation --enable-epoll \
+EXTRA_OECONF = " --disable-auto-validation \
                  --with-gssapi=no --with-lmdb=no --with-zlib \
                  --sysconfdir=${sysconfdir}/bind \
                  --with-openssl=${STAGING_DIR_HOST}${prefix} \
-- 
2.25.1


