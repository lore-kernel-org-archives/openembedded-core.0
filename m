Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web12.28892.1623018016739235075
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Jun 2021 15:20:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dVJpbZO0;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id k7so8645590pjf.5
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Jun 2021 15:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wi2xlCfrwxFDuaZ4cpMEGwg88WSltHULYEVCrC1GZZ8=;
        b=dVJpbZO0yRvxM065laa91uFKo0Soduzni4F5VPV/GdO3uwVb+NKu6XuCrZdtqvvR/o
         68NsqTSL1xs2sxfkcJozpfoek71bXmWFrDKivROoZN9qmW3d5YcnJVfzayBWqUSYdCJh
         /wkT2jPr1mFbqR0dNruvVtlR07O5yKiE7i9Yyah5Q8Oq0jLqrWOyB+ebvsiJFr0rEJd5
         9yZz4O3noh/ExkUn2Cx8DHmy/mw6mE9u3tTRg93n6169DDU3bcNXASpt63smCj0TKIJs
         fdwztfHd3sMGZKUqxf+7pMZdbyUgQxQNkCvqX0j7j6FixCBTiUJSMgpim4zSAAUTFyQU
         XaEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wi2xlCfrwxFDuaZ4cpMEGwg88WSltHULYEVCrC1GZZ8=;
        b=WkN6FrKAwawod63UP1xogEJ4h7wC1Uvt8kMkqgBOhXwy0AXfYaD8oiRjPWmwHRqTf9
         0LOGZe5M7nhQx/qNYQq5ilmW4DSfG/aiowGQzzJI7rnE50mM8zJ5yE0DU+/ZNFlfMOO7
         NvAdsOQfq2HfDJMgPOMFvYx6ZQKNKEZO5mmV+osvmYE9vaonE6cXY/HpfEbHl7nnqtkc
         68VT+O2uCtrA52qkETd99XbmmHCisyKCgZrNySbCZ5mczCf91Gw5JhDLrANZxotOZsiW
         mcT0kQcF5j0aDgpOR4sHTIXAkqlAqQqvqK5KmqRY8ZN0sVrhwJZ7acmmUZOVn7KK6omp
         fUig==
X-Gm-Message-State: AOAM532EvyeIO24o/OORtVqiiVQOTLs0xWgKO9Ce/QCa8RZK/stDJv+h
	aTCtY5YVhAzZtFn229hEhhJS3T3DMFs+ag==
X-Google-Smtp-Source: ABdhPJxadAQIaSTBkYpm9/G2XP7g3Me67jTqKuWBIWmdCgHg8kpxpsF8wMpmHvu16PGE5jlL9i3WPg==
X-Received: by 2002:a17:902:be0d:b029:f9:c913:821f with SMTP id r13-20020a170902be0db02900f9c913821fmr15226763pls.2.1623018016068;
        Sun, 06 Jun 2021 15:20:16 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from nereus.local ([2601:1c0:6000:9640:d783:82a8:8b1b:d4e0])
        by smtp.gmail.com with ESMTPSA id u21sm6473983pfh.163.2021.06.06.15.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jun 2021 15:20:15 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Subject: [PATCH 0/5] Recipe upgrades
Date: Sun,  6 Jun 2021 15:20:06 -0700
Message-Id: <cover.1623016777.git.timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update maintainer email.

Upgrade python3-scons and fix upstream check.

AUH upgrades to:
* python3-hypothesis
* python3-importlib-metadata
* at-spi2-core

Tested on qemux86-64 core-image-full-cmdline and core-image-weston

The following changes since commit d6b62b5a9d6c64971b9f981a4732791658150e43:

  nativesdk-libdnf: fix installed and not shipped files (2021-06-03 23:09:18 +0100)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib timo/recipe-upgrades-20210606

Tim Orling (5):
  maintainers.inc: update email address
  python3-scons: upgrade 3.1.2 -> 4.1.0; simplify
  python3-hypothesis: upgrade 6.13.7 -> 6.13.14
  python3-importlib-metadata: upgrade 4.3.0 -> 4.5.0
  at-spi2-core: upgrade 2.40.1 -> 2.40.2

 meta/conf/distro/include/maintainers.inc      | 68 +++++++++----------
 ....13.7.bb => python3-hypothesis_6.13.14.bb} |  4 +-
 ...bb => python3-importlib-metadata_4.5.0.bb} |  2 +-
 ...3.1.2.bb => python3-scons-native_4.1.0.bb} |  0
 .../0001-Fix-man-page-installation.patch      | 46 +++++++++++++
 .../python/python3-scons_3.1.2.bb             | 34 ----------
 .../python/python3-scons_4.1.0.bb             | 27 ++++++++
 ...-core_2.40.1.bb => at-spi2-core_2.40.2.bb} |  2 +-
 8 files changed, 111 insertions(+), 72 deletions(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.13.7.bb => python3-hypothesis_6.13.14.bb} (77%)
 rename meta/recipes-devtools/python/{python3-importlib-metadata_4.3.0.bb => python3-importlib-metadata_4.5.0.bb} (88%)
 rename meta/recipes-devtools/python/{python3-scons-native_3.1.2.bb => python3-scons-native_4.1.0.bb} (100%)
 create mode 100644 meta/recipes-devtools/python/python3-scons/0001-Fix-man-page-installation.patch
 delete mode 100644 meta/recipes-devtools/python/python3-scons_3.1.2.bb
 create mode 100644 meta/recipes-devtools/python/python3-scons_4.1.0.bb
 rename meta/recipes-support/atk/{at-spi2-core_2.40.1.bb => at-spi2-core_2.40.2.bb} (94%)

-- 
2.29.2

