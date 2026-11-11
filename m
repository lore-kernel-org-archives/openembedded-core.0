Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2356.1794418532521672313
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 09:35:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=YTmrpXHT;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so29921015e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 09:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794418531; x=1795023331; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E/cLW3hnva/vNJyl4AYXv50vKy7SZevZqdByanmHbzM=;
        b=YTmrpXHT1KfQaBpNWMGei159nhC6en52RK7LWm5B4lmVvuPoGpwMLjXK+Qe+YTg1pK
         ZOYoKGHhH/BbFwcu1Lc/7ysUnerC9Qrq+uBtkqMb6tVHd/MYkng9UXNtbCnN4jL9wFyS
         9d4yHwDtuLe8wjhv0JOiNVaPDHr2sx5QuhB3WsDdKkRucP+qItKZb/FWJ+lyys019LbU
         ftUmHo7GCTw1a/DHrEdttUs5TTHC1Sj+EENcNx/nMR3YGvSPtbPezuL0ApWrMIsMDZAS
         WqBkFl2+/Pc42gBNwLz0B8CE7Js0km1gEuiLSddu1p5tHXPYcw4oBkPvyodrzBxSSPVd
         VDKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794418531; x=1795023331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E/cLW3hnva/vNJyl4AYXv50vKy7SZevZqdByanmHbzM=;
        b=lmtS/29uEuEqJhTi1ofFQiGBK2J/jI0BeUoibdads/k07GA8ucZf35uzGTglSeiooa
         YEXnp4Fd7QnUiN8lqB5La6Mfb+zXynuO1NYAclG9qgFffNzDNBDv5N88XfGCZpMmnQ6r
         ZGQZBXQTfTF4uqDN1fA/PARoMGjp/fxZ37OQwHkcFmCHiSTg4zCsOLI/t2Oa/OrP6VGN
         VcCOkx7Hhstbc4MEzUivGckQEb33oREU/V+Vrcq2HDolngHdGnV0rVSCj08NN83N5F9p
         bamml4SJfPsnp0ZyCU1+GwKccFWOvF0Vv/PwU0I2Gq4x/reDqBMO/iji7jbSbQNivxcz
         yCJg==
X-Gm-Message-State: APuU4Z9Lg3qlMRGy1KXh4axaKw528UsyUktIymNIoa19SNC4fZl1R4I7
	wIhWQFdQLff1f6LKbT/TF7p4Uggs2UDkw5suHLBAbQ2hYP0g1wi53Fp0gm1e49ha
X-Gm-Gg: AYBFou1d09Y/YfULWbVF1fAkWV/CcJhF20idy03XD3Y+c86JuIcO/nEcwyRClr9JoU6
	fOuksIwINP20z9MFPUsSMkyVLJqYmoP9JKSPIAVDzs2B/FOvt9FcoIBaTCOLdQnFWlK9gWPgrlp
	Nm344s8u6K/YMgSHKo1LtzXf7jsg/hpJwvfm0j9O0RZBDecbSrN3f0DV42XMb9c9sgTZA2KdRHl
	rZYTmmxKnImM20lxTqyHRhUJBt/YLNntN7uRCwtTKcu8eD+PoP+XEm5vnKyVCotv4NqxrdzgkwD
	u7vYky45TuNwfR4UvrTzpeuFl7o0SYKLqBAgy0vAg0WbYyQatx+EKj/9i/WWFwAqcGjFIuE8EPb
	ec4L7dLaerlrwpktU6lE1ElWI8gUC6IIBRZ329R4OMUT9flAfLdA1d7N0DvvfDkMBpOE0rdpJK3
	iC6X1UVJgjr5vqpNwKxbAvzPItfUT0VGtrmDJrrE4/+vqwqsRpnDVW/6QslwXo7ti/PRB6fMTP2
	5fdZPvg5lhnRlADS+IMmlOTjjUITwjy2edTg1rEunHneohqv6UAUldxYqk8L/7vxNukmc39rBmS
	RHZHo6gNc/oodYHaIVdf7Enhj5tx9gLGV/V0IPRRT8gkeQ==
X-Received: by 2002:a05:600c:4f12:b0:4a2:191f:7cb8 with SMTP id 5b1f17b1804b1-4ba09365bc4mr61850135e9.17.1794418530452;
        Wed, 11 Nov 2026 09:35:30 -0800 (PST)
Return-Path: <stondo@gmail.com>
Received: from fedora ([165.225.94.251])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498363df7a5sm12214329f8f.37.2026.11.11.09.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:35:29 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr,
	jpewhacker@gmail.com,
	peter.marko@siemens.com,
	adrian.freihofer@siemens.com,
	patrick.wicki@siemens.com,
	stefano.tondo.ext@siemens.com
Subject: [blacksail][PATCH 0/3] spdx30: fix the source download enrichment
Date: Wed, 11 Nov 2026 18:35:23 +0100
Message-ID: <20261111173526.3653122-1-stondo@gmail.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 17:35:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250041
Content-Type: text/plain; charset="utf-8"

Hi Yoann,

This series backports two spdx30 fixes from master to blacksail, plus
their tests. The same fixes go to wrynose in a separate series.

Blacksail has 9f1825e74d ("spdx30: Add Git version and PURL to source
downloads"). It adds the commit hash as version and a purl to the Git
source downloads in the SPDX. That code has two bugs, and master fixed
both:

1. spdx30: Make source download enrichment part of the task signature
   (e57ec14f8d)

   The enrichment code is in two functions whose names start with an
   underscore. bitbake leaves such functions out of the task
   signature. So do_create_spdx did not track them, or the
   SPDX_GIT_PURL_MAPPINGS variable that they read. After a change,
   bitbake restored the old SPDX from sstate. The fix renames the two
   functions. As a side effect, the do_create_spdx signature of every
   recipe changes once.

2. spdx30: Enrich gitsm source downloads like git ones (1e5146d8f9)

   This one can look like a feature, but I think it is a fix.
   9f1825e74d enriches Git source downloads, but it checks only
   fd.type == "git". gitsm is the Git fetcher with submodule support,
   and it has the same revision. So a recipe that changes from git://
   to gitsm:// loses the version and the purl of its main repository,
   with no warning. The fix is one line.

3. oeqa/selftest: Add tests for source download enrichment
   (3ca309cbd3)

   Two selftests for patches 1 and 2, which fail without them. If you
   take only fixes, you can drop this patch. Patchwork can show it as
   accepted already, because a March commit (9a622a2062) has the same
   subject.

I tested the series with oe-selftest -r spdx.SPDX30Check on blacksail.
All 14 tests pass.

Stefano Tondo (3):
  spdx30: Make source download enrichment part of the task signature
  spdx30: Enrich gitsm source downloads like git ones
  oeqa/selftest: Add tests for source download enrichment

 meta/lib/oe/spdx30_tasks.py          | 10 +++---
 meta/lib/oeqa/selftest/cases/spdx.py | 47 ++++++++++++++++++++++++++++
 2 files changed, 52 insertions(+), 5 deletions(-)

-- 
2.56.0

