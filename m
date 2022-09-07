Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D7E4C54EE9
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 14:21:05 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.8212.1662560455837837317
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 07:20:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=oUW3urW/;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id 9so11491379plj.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 07:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=PqYsW/GXJ/AEKSFn8jeg2PcWmgNQdksiZ8YxGIv1ABo=;
        b=oUW3urW/ZFvuNLHPvIV73I/oWXsHwnyfcI0EXKQMXpVDKHCm1gA2lLy2WlOPkkcSeI
         ycssWyzDexIctGh2MscaV1RG+mfvEmDpGNbgPZls53lbt3oWfD1NI4f3oixezEn+47he
         jBP3LZ5X81t0fMwRiJHXvn/i12t6NillJvCRdsJ8fEA7kyn2LSGnp45HjkS3t2kSOXrP
         CTYo1cYt4nFcLEcHUM26nyM+8gi9cSU/WyE2sVCWmV3jPmWtLRQbeVXqJsY6QmrhDx5W
         EfnKkGpwbhhz9VSiN736KTPFX0P3Ql1aaFXO910rFDgju3rRq7ujGQXK9J9oS9Diz/DH
         tGsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=PqYsW/GXJ/AEKSFn8jeg2PcWmgNQdksiZ8YxGIv1ABo=;
        b=CJNuC4ycjb4Izyf5nnHau6afymjdk+5JWLrbU+eDJfnvMjmGR15ZoUYCRYy5eU3wnJ
         YpjXuX+dckrzDijoAGCOijT2Iq6KyqizNOVoysOrFQwDfHSzJhRwmsWlP3BOH2son3Dp
         PaK4SL7EvzCM35NHbTp0/C24/W4hSRdlci76p5B9Xi+VWloN8wWF6pbW645RHO6oHnwY
         vyNWAsuaFNMIhdTJRMYqwowTigqZbLPHPg8Ep/69OsgOJMMMHVe2m2h9ul9XaxFH+cYy
         7Bl494cSuoVCr8MQlhiF3hJXMM7Tn4D9336ePi3a361R2Jjw/GhmjModRz5OXKcS9NVV
         AagQ==
X-Gm-Message-State: ACgBeo0CSCagNdFrVQY4EvuXeyhv6yBAX0vt1gijh6hyLUqmeW/xcc8S
	y+a2b2f6vUZO49Pa6uTJs6jprjmeMDBIwfyG
X-Google-Smtp-Source: 
 AA6agR63etROVKVn3slpQSEZJkfSQAiAzr+MIljiBOD+TeChLSyCa4G6ZYL82YGeX77TbT4bLdMGZw==
X-Received: by 2002:a17:90b:4c11:b0:1fb:66d3:79f with SMTP id
 na17-20020a17090b4c1100b001fb66d3079fmr4458178pjb.44.1662560454898;
        Wed, 07 Sep 2022 07:20:54 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x13-20020a17090a1f8d00b001f510175984sm14776198pja.41.2022.09.07.07.20.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 07:20:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/24] liburcu: upgrade 0.13.1 -> 0.13.2
Date: Wed,  7 Sep 2022 04:20:09 -1000
Message-Id: 
 <2852ebcba6c718640b306adfd33907411ac02d21.1662559557.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662559557.git.steve@sakoman.com>
References: <cover.1662559557.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Sep 2022 14:21:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170403

From: wangmy <wangmy@fujitsu.com>

2022-08-18 Userspace RCU 0.13.2
	* Revert "Fix: remove type constness in URCU_FORCE_CAST's C++ version"
	* Fix: futex.h: include headers outside extern C
	* Fix: add missing unused attribute to _rcu_dereference
	* Fix: change method used by _rcu_dereference to strip type constness
	* Fix: remove type constness in URCU_FORCE_CAST's C++ version
	* Move extern "C" down in include/urcu/urcu-bp.h
	* fix: ifdef linux specific cpu count compat
	* Set git-review branch to stable-0.13
	* fix: sysconf(_SC_NPROCESSORS_CONF) can be less than max cpu id
	* Fix: revise obsolete command in README.md
	* Fix: workqueue: remove unused variable "ret"
	* Fix: urcu-qsbr: futex wait: handle spurious futex wakeups
	* Fix: urcu: futex wait: handle spurious futex wakeups
	* Fix: urcu-wait: futex wait: handle spurious futex wakeups
	* Fix: defer_rcu: futex wait: handle spurious futex wakeups
	* Fix: call_rcu: futex wait: handle spurious futex wakeups
	* Fix: workqueue: futex wait: handle spurious futex wakeups
	* Fix: Use %lu rather than %ld to print count

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit b9ce9d9ab53baab7ba84187d17b34e48ff9eb16e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../liburcu/{liburcu_0.13.1.bb => liburcu_0.13.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/liburcu/{liburcu_0.13.1.bb => liburcu_0.13.2.bb} (91%)

diff --git a/meta/recipes-support/liburcu/liburcu_0.13.1.bb b/meta/recipes-support/liburcu/liburcu_0.13.2.bb
similarity index 91%
rename from meta/recipes-support/liburcu/liburcu_0.13.1.bb
rename to meta/recipes-support/liburcu/liburcu_0.13.2.bb
index 66763349d2..6ecf2e21c0 100644
--- a/meta/recipes-support/liburcu/liburcu_0.13.1.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.13.2.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e548d28737289d75a8f1e01ba2fd7825 \
 
 SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2"
 
-SRC_URI[sha256sum] = "3213f33d2b8f710eb920eb1abb279ec04bf8ae6361f44f2513c28c20d3363083"
+SRC_URI[sha256sum] = "1213fd9f1b0b74da7de2bb74335b76098db9738fec5d3cdc07c0c524f34fc032"
 
 S = "${WORKDIR}/userspace-rcu-${PV}"
 inherit autotools multilib_header
-- 
2.25.1


