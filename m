Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2361.1794418542001750182
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 09:35:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=IIFv17UG;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so27905505e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 09:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794418540; x=1795023340; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RbD7WYgglXdxJtLkaySuDfJFA2qpjDxpsNFx8OuLs9c=;
        b=IIFv17UGW44AjPbx0CNX844QjtYECXRvVNsK9X2LWzjtLp7U8sjKdwoko2vPHAq508
         BzH6s7OLDEo2WtuafXFb138tJsBpji1/zHrBgIIfVahhvqfgxirEW7q5aDrmVRU42uOH
         2zzseE0FTLi14OEL78yyvvkTF3GmwQV6AL6ODfOGRSnPNnyVc58/qhhfecg1U37ifCIb
         R+KWWFlAlDtOrVrFBQRE8W9I6cAuPGiR9n5nqluodelZo+fre0IZQNYhWiYrLMoU1Ufq
         bPOcE93SkilJHFAh8mYJ9KOk4RTW2tfxdXwxEyVUCmSoaxkTXm8Jlae19VyGHnyYFwMg
         pniA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794418540; x=1795023340;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RbD7WYgglXdxJtLkaySuDfJFA2qpjDxpsNFx8OuLs9c=;
        b=OnRGBmhAUptjhD7h1uFYuNam49ifPBR7CztHJc6k92gEDH5+hIb6WtgedQ1N5ahc5p
         VKdM4SjxBPZqrRT+aF57Kx6HjMdY1agmz/k8C0EOlJKdloXHCXqwo/K3bLTsioyN/rBY
         FHbN6uKGN79JjSzhhV/+3HgBcouxhjc6EUofyvKTVCXFr23M+j8Y9mP5j7ajOsrYQ6x3
         UOcHG5/c89JXx2qCkABNr9S1of8jCzghxJaCwhPx7EfsB+8VTtQ/b+4zxUH3tKXl98oL
         WO3oTKmr5NMFyiJ02IaRmBuWnNrHiCqQ04GgiNXt3B9fl8Hxfg9of03pMhnGPq70nOz3
         Ko0Q==
X-Gm-Message-State: APuU4Z8EdbWSORQc9OGYDi1pHbFN77sfJJXo09n6DZ8Kon0mL7cDuK96
	+k0O8/D42sG88RgWfQk260kxvtL4AW7AwFWtyY0YjiaZx6Q7WN9PlPYiq85CxjXW
X-Gm-Gg: AYBFou27nH1XpMqwkYLFLV8r7JmGXX2IVdwjPcxpsSc/khZuVCxKANMqNwa2u75FbE5
	8GK17TcULAxKu51djqfljg7P44Wzq7h3co9SyqPlN4kwCbLtp2F9rzaceRgS/7oq2tqp8HJx3Kp
	jj4Q9wLwHyEtWFZmmh7upsaos7e/iPznrvXdrVHs4I0iz3//rxAFpDyVC3mqvIVu77UeACLdAaE
	yS9Y+NQc3IraBUQqEea/ya50LdNlWhnKtx89jT0WcSIhvOeb9ml3SRgNlrvnMwFFbOYAptjCrUS
	PZI+6WhyL8oQkQ/wNh8LWe6mP0yaX6m7sNFWV1gM4lQAGVlD4KD+li1SbjSwfzQDQ64JeEH2MHV
	Ddf8LOQ6+gHGY3zXJ6cix7XywLyHvxjFnZf9e9dZ16GhbiUrBqSoFiRCT3DO8qGGjWMUMcO/lst
	5hNuTQD5VYKa0AVh5Eg0VwfvR1F5rgIWBgCnE6w1NMJUfRYXWIdQaVKQ3t6hAZnCwQkDK26ayKK
	g8+6YUcWK8tv0yDtdIB3F6nbenrQ5foGeTmO0B3xDXPUTOATSsC6SfV6tJohx/8mHrgXlQY9Wap
	osBK7T6GoDmsmkNeVP6gRgLzoY304CU0juwOm9y6IwQ8QQ==
X-Received: by 2002:a05:600d:82c6:b0:4a3:59c9:a758 with SMTP id 5b1f17b1804b1-4ba0937fee9mr61337525e9.32.1794418540190;
        Wed, 11 Nov 2026 09:35:40 -0800 (PST)
Return-Path: <stondo@gmail.com>
Received: from fedora ([165.225.94.251])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0950394fsm54823785e9.2.2026.11.11.09.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:35:39 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr,
	jpewhacker@gmail.com,
	peter.marko@siemens.com,
	adrian.freihofer@siemens.com,
	patrick.wicki@siemens.com,
	stefano.tondo.ext@siemens.com
Subject: [wrynose][PATCH 0/4] spdx30: fix the source download enrichment
Date: Wed, 11 Nov 2026 18:35:33 +0100
Message-ID: <20261111173537.3653558-1-stondo@gmail.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 17:35:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250045
Content-Type: text/plain; charset="utf-8"

Hi Yoann,

This series backports three spdx30 fixes from master to wrynose, plus
their tests. Patches 2 to 4 also go to blacksail in a separate series.
Blacksail already has patch 1.

Wrynose has 9f1825e74d ("spdx30: Add Git version and PURL to source
downloads"). It adds the commit hash as version and a purl to the Git
source downloads in the SPDX. That code has three bugs, and master
fixed all of them:

1. spdx30_tasks: Fix duplicated revision in Git PURLs (e31479ddba)

   On wrynose, every Git purl has the revision twice, for example
   pkg:github/fastfloat/fast_float@<rev>@<rev>. That purl is invalid,
   so scanners cannot match it. Master reformatted the file after this
   fix, so I applied it by hand. The change is the same.

2. spdx30: Make source download enrichment part of the task signature
   (e57ec14f8d)

   The enrichment code is in two functions whose names start with an
   underscore. bitbake leaves such functions out of the task
   signature. So do_create_spdx did not track them, or the
   SPDX_GIT_PURL_MAPPINGS variable that they read. After a change,
   bitbake restored the old SPDX from sstate. The fix renames the two
   functions. As a side effect, the do_create_spdx signature of every
   recipe changes once.

3. spdx30: Enrich gitsm source downloads like git ones (1e5146d8f9)

   This one can look like a feature, but I think it is a fix.
   9f1825e74d enriches Git source downloads, but it checks only
   fd.type == "git". gitsm is the Git fetcher with submodule support,
   and it has the same revision. So a recipe that changes from git://
   to gitsm:// loses the version and the purl of its main repository,
   with no warning. The fix is one line.

4. oeqa/selftest: Add tests for source download enrichment
   (3ca309cbd3)

   Two selftests for patches 2 and 3, which fail without them. On
   wrynose, test_git_purl_mappings_rerun_create_spdx also fails
   without patch 1. That is how I found that wrynose does not have it.
   If you take only fixes, you can drop this patch. Patchwork can show
   it as accepted already, because a March commit (9a622a2062) has the
   same subject.

I tested the series with oe-selftest -r spdx.SPDX30Check on wrynose
(bitbake 2.18). All 14 tests pass.

KAZUYOSHI AKIYAMA (秋山 和慶) (1):
  spdx30_tasks: Fix duplicated revision in Git PURLs

Stefano Tondo (3):
  spdx30: Make source download enrichment part of the task signature
  spdx30: Enrich gitsm source downloads like git ones
  oeqa/selftest: Add tests for source download enrichment

 meta/lib/oe/spdx30_tasks.py          | 17 +++++-----
 meta/lib/oeqa/selftest/cases/spdx.py | 47 ++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+), 7 deletions(-)

-- 
2.56.0

