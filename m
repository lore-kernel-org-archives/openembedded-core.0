Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web09.993.1607474147528317573
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Dec 2020 16:35:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pAErsG2F;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id x15so28877pll.2
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Dec 2020 16:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+Vrk6VsUsld24uhwdWmZ1WjdVDSACFQe3DQy8TGwuK8=;
        b=pAErsG2FNjiQOqurKjJs1OrOLSmiqIVTjXiwfZzMSxQrTp9PNNwJbKiwITFwOvQ7O7
         DUaVJZdoYmWXJy+mUCtZ3Lz5vtknLZrXocYrpa7/i/ReWhYw9wYfa1wX0YZbr6MMj+BA
         5gTveIaKHE2+FpW8xleR49tdwEvRVoJCjshpd7B42kmaZhn+1wdVi/X2AUHfI6h990vo
         HGJr7ZnYlreoDJ+FGDRXGK+HiJxzwdqYqa/U7nQ5q6l90lA0zw9WClneZ3GU2mklikF3
         aiWsaELkgJ6xABvTJ92Kae1YqLWpyXnDp+HBKxQlmC065Qphwz+IkQgCOqsfi2JkTjVp
         5zyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+Vrk6VsUsld24uhwdWmZ1WjdVDSACFQe3DQy8TGwuK8=;
        b=IMjloGvQOscBn8ap79MCK4vQ7PdDegSUyXNbld1n660t9n6PbV+xK+lY6mAvRe+3XR
         0kbNbnSGAW/6WDQ9UXoU412D5fESVShqY/XhHgPEKoEiG/P30IPnFMXzfKsl61xbuivY
         Ux7d3vFz6M0G6grH1KpGMuFnQoc6hR5XZ5XRAIQEiFD3wOVGFT1eqTe6oPDv/SV8Z9tS
         MJTtmvNddo+F6YN/LmboJLeCaJvILByKXIM22X76XC+l0drpceuUZ/1e+0LmhlIApF5k
         gHE7zCuuq9xKxSW6vUipmPgmZ6X0/iSuDE5L+71GYcVPvBu0HjvlBu3jhrNVgmodD4Br
         Kz6g==
X-Gm-Message-State: AOAM530+xfHbWKGz+FqmrDQZH1MszNEilhXze4+pMHeO1yuq/mrJJT43
	dJHsSCyvIdaTaRRI9+I8JQLhObgv5Xiowg==
X-Google-Smtp-Source: ABdhPJxKop5GgjFMmQBGYSeNlaflSNceryKM7iIe+lkxcAKAs5mu5SvecLSYh16CpKiALqO4OA1KTw==
X-Received: by 2002:a17:902:426:b029:db:65c4:dbf7 with SMTP id 35-20020a1709020426b02900db65c4dbf7mr83394ple.3.1607474146630;
        Tue, 08 Dec 2020 16:35:46 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.local ([2601:1c0:6000:9640:183:c5f6:e3c0:185c])
        by smtp.gmail.com with ESMTPSA id a26sm143372pgd.64.2020.12.08.16.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 16:35:46 -0800 (PST)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@linux.intel.com>
Subject: [PATCH 0/5] Core python3 recipe updates
Date: Tue,  8 Dec 2020 16:35:40 -0800
Message-Id: <cover.1607473952.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Tim Orling <timothy.t.orling@linux.intel.com>

Upgrade several recipes to latest versions and fix some deps.

NOTE: python3-packaging 20.7 is available, but we need the next tag
      which will re-add setup.py

The following changes since commit e995e67bc7a3d30adf9f8d0d2f4df92a941baeae:

  meta/lib/oeqa/manual/oe-core.json: Update test_bitbake_devshell (2020-12-06 23:16:50 +0000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib timo/py3-core-recipe-updates-20201208
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=timo/py3-core-recipe-updates-20201208

Tim Orling (5):
  python3-hypothesis: upgrade 5.41.4 -> 5.41.5
  python3-importlib-metadata: upgrade 3.1.0 -> 3.1.1
  python3-pygments: upgrade v2.7.2 -> v2.7.3
  python3-setuptools: upgrade 50.3.2 -> 51.0.0
  python3-setuptools-scm: add python3-toml dep

 ...hon3-hypothesis_5.41.4.bb => python3-hypothesis_5.41.5.bb} | 4 ++--
 ...-metadata_3.1.0.bb => python3-importlib-metadata_3.1.1.bb} | 4 ++--
 .../{python3-pygments_2.7.2.bb => python3-pygments_2.7.3.bb}  | 2 +-
 meta/recipes-devtools/python/python3-setuptools-scm_4.1.2.bb  | 2 ++
 ...hon3-setuptools_50.3.2.bb => python3-setuptools_51.0.0.bb} | 2 +-
 5 files changed, 8 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_5.41.4.bb => python3-hypothesis_5.41.5.bb} (67%)
 rename meta/recipes-devtools/python/{python3-importlib-metadata_3.1.0.bb => python3-importlib-metadata_3.1.1.bb} (68%)
 rename meta/recipes-devtools/python/{python3-pygments_2.7.2.bb => python3-pygments_2.7.3.bb} (83%)
 rename meta/recipes-devtools/python/{python3-setuptools_50.3.2.bb => python3-setuptools_51.0.0.bb} (95%)

-- 
2.25.0

