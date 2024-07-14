Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 840DFC3DA42
	for <webhook@archiver.kernel.org>; Sun, 14 Jul 2024 12:03:28 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.14999.1720958604063710187
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jul 2024 05:03:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=heUJ6N3Y;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52ea3e499b1so3894553e87.3
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 05:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720958602; x=1721563402; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=f9o7x7gLl3UtZQNKkUUecZlPJliqwptUS9gWP7gIMdc=;
        b=heUJ6N3Yu8G8od6ZcSfJVoMN9TehQLbfdsifdIMKKNIu7sqkZLj19LohF5g0irRgfR
         Nwul/Exi+D7rOgHU54p1xN8xSRNiuXNVr7mGJhzbwTorwDNfETfKIfU9qGolsSX82EVS
         XJvPCkevAN4L59zUqRmVpk+oewuWQHclr3ITY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720958602; x=1721563402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f9o7x7gLl3UtZQNKkUUecZlPJliqwptUS9gWP7gIMdc=;
        b=k6SCArz5CTT9kZA4Uj8BpZv4syBhch+NrDOKGKOBBnH8IqNTeDmhMfkihpntTN+JfU
         jG5Uo5J+f60OIeHnq2skTUElM4Kps7d1YQMG0oTR7epkDwtPwtxrrHT4sIg0lt8/ErAt
         h9HA+SK+yhmefO+Ij3IimV7LQJZv0fT5XcXLs83/DepZfiQSgfg1gaIgmps25jc6naeV
         RUnhxbspjWJ14sl+yqgerOhD0mqac5vnBMsRxIrzwEwH1JBArWxtojl1CnSDlx3ih5qz
         ofTImCDDU2OCCn/eVdOK1BV5q63ImnUks1VrNbnYQLY0TmIzTdffM0/HytJCdwU7yfT6
         XNMw==
X-Gm-Message-State: AOJu0YzYjb7dOpPy/r5+knP3YORb3/budGAb1787Vsq2uEv/gRfG0cfm
	IQuOQZNSj4X68EOmSyJSfmZkcV4513VZnmvZzwvjozoI7sUiFdlolGee41V5hjxmReBQsWdDz3J
	G
X-Google-Smtp-Source: AGHT+IEj6bskXpjsuFwKYESRdg2AAoEbVAztnBbpUqNVNpo469+iPdXIThqh26w7lAgGmsB2TsEWfw==
X-Received: by 2002:a05:6512:2205:b0:52c:e5ac:ecd2 with SMTP id 2adb3069b0e04-52eb99d2146mr10497568e87.51.1720958601673;
        Sun, 14 Jul 2024 05:03:21 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ac74:33a8:48d1:ad5c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5edb530sm49196615e9.29.2024.07.14.05.03.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jul 2024 05:03:21 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] icu/perf: Drop SPDX_S variable
Date: Sun, 14 Jul 2024 13:03:20 +0100
Message-ID: <20240714120320.2268786-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 12:03:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201857

These were used by external layers and were needed before we had better
unpack instrumenation and the recent unpack directory changes. Drop
them as obsolete.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-kernel/perf/perf.bb     | 1 -
 meta/recipes-support/icu/icu_75-1.bb | 1 -
 2 files changed, 2 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index ab2dc5ae62c..f3f350aa98c 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -66,7 +66,6 @@ include ${@bb.utils.contains('PACKAGECONFIG', 'perl', 'perf-perl.inc', '', d)}
 inherit kernelsrc
 
 S = "${WORKDIR}/${BP}"
-SPDX_S = "${S}/tools/perf"
 
 # The LDFLAGS is required or some old kernels fails due missing
 # symbols and this is preferred than requiring patches to every old
diff --git a/meta/recipes-support/icu/icu_75-1.bb b/meta/recipes-support/icu/icu_75-1.bb
index 57c9fc03612..88103e4eca7 100644
--- a/meta/recipes-support/icu/icu_75-1.bb
+++ b/meta/recipes-support/icu/icu_75-1.bb
@@ -11,7 +11,6 @@ DEPENDS = "icu-native autoconf-archive-native"
 CVE_PRODUCT = "international_components_for_unicode"
 
 S = "${WORKDIR}/icu/source"
-SPDX_S = "${WORKDIR}/icu"
 STAGING_ICU_DIR_NATIVE = "${STAGING_DATADIR_NATIVE}/${BPN}/${PV}"
 
 ICU_MAJOR_VER = "${@d.getVar('PV').split('-')[0]}"

