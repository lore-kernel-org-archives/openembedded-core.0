Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web08.28886.1606537480883004744
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2020 20:24:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cCzw/JMF;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id s63so5770094pgc.8
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2020 20:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rWsl2vDtRREx5voirPUInx0TkL3q9CEnzYnu1rrxj+A=;
        b=cCzw/JMFatzeSrx31AGK4X9n/89EV1GFG3M44WtRgcnp3jeCv8UglHpn3RmqJmn/sI
         RSRDo0K6t6LV1HS2KbOsJ1bqbQduTDGqI08UkCUKOfY6aSxIXnGN8GO1zfjF9uVvlg6s
         1if5er3tp4oxy0uYG+gH0CBGWYCrezZZFbIgC8r8nJkff2Jl+d0s75gFPI+6Mn7k6gQx
         13BjRfhm/OKSISCLGQgcn4ZXNpLbAY071q8D/lXUW/R5Qx25wcbMBtNAASs/i8qHD9CN
         4AFaigNNeLf3D9eXw3h8oOXrvjELrNr6kyS2dc77P6M7n+5LIk7aKtVsDEjxAoFTplU3
         b1Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rWsl2vDtRREx5voirPUInx0TkL3q9CEnzYnu1rrxj+A=;
        b=Ug4L2qauMolQfB0UzbWPH/FpHnLBK/l+Jim4U5eZkwxt72xnJUzWrqmTssV/Tp/t3k
         +xRdxfWKNvtEuyddHcnDhmXHdY43BpBx6TZ7pmTj03MyHNwNqEJBYW8xkV1AyQ1bQghL
         ZR2RC+LT8fWnMYQjJgew2pamYcZTPYGONFatfrOamBDIQGVq+czBIirEPxTi8u72ZSro
         VVOeBfty1cavRFbAkKKStfyrpRZGXJ8aya9WtKX2BU+O7boUIjwHae6WWaVEJMyyT5Lw
         gSIwsIuaxHfLy4Jq0YWm2GOSniLRgDh2Z5vgv2zdjdcud/bniyTyT/OqXZHW/NHqDDLJ
         FOoA==
X-Gm-Message-State: AOAM533BG5nWM1VSTnfOEXC/i5gNQbQkFCGSphs4Ruvp7njDrGj8+am5
	D60VcYjMm+iRoCWK+yVrpO6ux58T3cdjoQ==
X-Google-Smtp-Source: ABdhPJyeK7/symaY12Q89Y5DULLFDIBSucSgIw10nPFV9Uj82BvTZLpAFqamjQvWjkHsx/34+7R1gA==
X-Received: by 2002:a17:90a:62c3:: with SMTP id k3mr13469327pjs.24.1606537479766;
        Fri, 27 Nov 2020 20:24:39 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.local ([2601:1c0:6000:9640:74ec:3128:f635:34a1])
        by smtp.gmail.com with ESMTPSA id b5sm12625076pjg.28.2020.11.27.20.24.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 20:24:39 -0800 (PST)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 00/18] Move python3-pytest to oe-core
Date: Fri, 27 Nov 2020 20:24:13 -0800
Message-Id: <cover.1606536874.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <timothy.t.orling@linux.intel.com>

We are increasingly needing pytest in oe-core, so it is time to move it
from meta-python.

This series first imports the recipes -- as-is -- from meta-python.
Second, the maintainers.inc is updated to add myself as maintainer for all
the new recipes.
Third, the two recipes that have stable updates are updated to their
latest releases.
Finally, a fix caught during ptest runs is added for RDEPENDS for
pytest.

This was built on 'nodistro' with only openembedded-core and tested on 
qemux86-64. All the new recipes that have ptests pass all tests.

The following changes since commit 6e3785a3f1f3cf68f5fe101cd6bebe91db165973:

  uninative: Don't use single sstate for pseudo-native (2020-11-24 15:53:04 +0000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib timo/add-pytest-to-oe-core
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=timo/add-pytest-to-oe-core

For convenience, the same series is also available at the Git repository
at:

 git://git.yoctoproject.org/poky-contrib timo/move-pytest-to-core
 http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=timo/move-pytest-to-core

Tim Orling (18):
  python3-atomicwrites: move from meta-python
  python3-attrs: move from meta-python
  python3-iniconfig: move from meta-python
  python3-more-itertools: move from meta-python
  python3-pathlib2: move from meta-python
  python3-toml: move from meta-python
  python3-py: move from meta-python
  python3-setuptools-scm: move from meta-python
  python3-packaging: move from meta-python
  python3-wcwidth: move from meta-python
  python3-zipp: move from meta-python
  python3-importlib-metadata: move from meta-python
  python3-pluggy: move from meta-python
  python3-pytest: move from meta-python
  maintainers.inc: add self for new pytest packages
  python3-more-itertools: upgrade 8.5.0 -> 8.6.0
  python3-importlib-metadata: upgrade 2.0.0 to 3.1.0
  python3-pytest: RDEPENDS on python3-toml

 meta/conf/distro/include/maintainers.inc      | 14 +++++++
 .../python/python3-atomicwrites/run-ptest     |  3 ++
 .../python/python3-atomicwrites_1.4.0.bb      | 25 ++++++++++++
 .../python/python3-attrs_20.3.0.bb            | 20 ++++++++++
 .../python3-importlib-metadata_3.1.0.bb       | 18 +++++++++
 .../python/python3-iniconfig_1.1.1.bb         |  9 +++++
 .../python/python3-more-itertools/run-ptest   |  3 ++
 .../python/python3-more-itertools_8.6.0.bb    | 23 +++++++++++
 .../python/python3-packaging_20.4.bb          | 14 +++++++
 .../python/python3-pathlib2_2.3.5.bb          | 13 +++++++
 .../python/python3-pluggy/run-ptest           |  3 ++
 .../python/python3-pluggy_0.13.1.bb           | 27 +++++++++++++
 .../python/python3-py_1.9.0.bb                | 15 +++++++
 ...he-setup_requires-for-setuptools-scm.patch | 39 +++++++++++++++++++
 .../python/python3-pytest_6.1.2.bb            | 39 +++++++++++++++++++
 .../python/python3-setuptools-scm_4.1.2.bb    | 21 ++++++++++
 .../python/python3-toml_0.10.2.bb             | 15 +++++++
 .../python/python3-wcwidth/run-ptest          |  3 ++
 .../python/python3-wcwidth_0.2.5.bb           | 25 ++++++++++++
 .../python/python3-zipp_3.4.0.bb              | 19 +++++++++
 20 files changed, 348 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-atomicwrites/run-ptest
 create mode 100644 meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb
 create mode 100644 meta/recipes-devtools/python/python3-attrs_20.3.0.bb
 create mode 100644 meta/recipes-devtools/python/python3-importlib-metadata_3.1.0.bb
 create mode 100644 meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb
 create mode 100644 meta/recipes-devtools/python/python3-more-itertools/run-ptest
 create mode 100644 meta/recipes-devtools/python/python3-more-itertools_8.6.0.bb
 create mode 100644 meta/recipes-devtools/python/python3-packaging_20.4.bb
 create mode 100644 meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb
 create mode 100644 meta/recipes-devtools/python/python3-pluggy/run-ptest
 create mode 100644 meta/recipes-devtools/python/python3-pluggy_0.13.1.bb
 create mode 100644 meta/recipes-devtools/python/python3-py_1.9.0.bb
 create mode 100644 meta/recipes-devtools/python/python3-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch
 create mode 100644 meta/recipes-devtools/python/python3-pytest_6.1.2.bb
 create mode 100644 meta/recipes-devtools/python/python3-setuptools-scm_4.1.2.bb
 create mode 100644 meta/recipes-devtools/python/python3-toml_0.10.2.bb
 create mode 100644 meta/recipes-devtools/python/python3-wcwidth/run-ptest
 create mode 100644 meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb
 create mode 100644 meta/recipes-devtools/python/python3-zipp_3.4.0.bb

-- 
2.25.0

