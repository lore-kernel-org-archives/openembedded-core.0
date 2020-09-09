Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web12.8947.1599639082885077012
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2020 01:11:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: cqCgEvV1DmAeufd2nMW2aCLpPTAiq0Irm/YbKfIDwDNwuo0/sgCMKciXAyZs9VeI9UoQt9zXrB
 UjVu44MYQ4Cg==
X-IronPort-AV: E=McAfee;i="6000,8403,9738"; a="155766982"
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; 
   d="scan'208";a="155766982"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2020 01:11:22 -0700
IronPort-SDR: C+gQMpTR/DezGaAHcH6x4pbu+dKWJIAJ2Jsz2KMw/lTeYUpc3GUXAuceRyUOiEYLvADfS+t4Bx
 eKmoqhTSzn0A==
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; 
   d="scan'208";a="480371030"
Received: from rbint21-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.66.132])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2020 01:11:21 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 00/11] zeus review request
Date: Wed,  9 Sep 2020 16:11:02 +0800
Message-Id: <cover.1599638315.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A set of CVE fixes for zeus. Please review.

I have rebased these on top of current zeus-next and have run the entire
set through autobuilder using the contrib/rpurdie/zeus helper branch. 

There's one failure while compiling acl (for reproducibility
test) which probably happened because of memory availability and is
unrelated:

| make: *** read jobs pipe: Resource temporarily unavailable.  Stop.

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/1358/steps/8/logs/step2d

Thanks,

Anuj

The following changes since commit 1c367349b733e931369944c362b357f92621f07b:

  oeqa/runtime_test: Disable test_testimage_virgl_gtk (2020-09-08 14:34:18 +0100)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib anujm/zeus

Li Wang (3):
  qemu: CVE-2020-16092
  qemu : fix CVE-2020-15863
  qemu: CVE-2020-14364

Li Zhou (5):
  xserver-xorg: Security Advisory - xserver-xorg - CVE-2020-14347
  bind: Security Advisory - bind - CVE-2020-8622
  bind: Security Advisory - bind - CVE-2020-8623
  bind: Security Advisory - bind - CVE-2020-8624
  go: Security Advisory - go - CVE-2020-24553

Stefan Ghinea (1):
  qemu: CVE-2020-10756

Zhixiong Chi (2):
  go: CVE-2020-16845
  gnutls: CVE-2020-24659

 .../bind/bind/CVE-2020-8622.patch             |  60 +++
 .../bind/bind/CVE-2020-8623.patch             | 402 ++++++++++++++++
 .../bind/bind/CVE-2020-8624.patch             |  33 ++
 .../recipes-connectivity/bind/bind_9.11.19.bb |   3 +
 meta/recipes-devtools/go/go-1.12.inc          |   3 +
 ...i-rename-a-test-file-to-be-less-cute.patch |  28 ++
 .../go/go-1.12/CVE-2020-16845.patch           | 110 +++++
 .../go/go-1.12/CVE-2020-24553.patch           | 429 ++++++++++++++++++
 meta/recipes-devtools/qemu/qemu.inc           |   4 +
 .../qemu/qemu/CVE-2020-10756.patch            |  40 ++
 .../qemu/qemu/CVE-2020-14364.patch            |  93 ++++
 .../qemu/qemu/CVE-2020-15863.patch            |  64 +++
 .../qemu/qemu/CVE-2020-16092.patch            |  49 ++
 .../xserver-xorg/CVE-2020-14347.patch         |  37 ++
 .../xorg-xserver/xserver-xorg_1.20.5.bb       |   1 +
 .../gnutls/gnutls/CVE-2020-24659.patch        | 117 +++++
 meta/recipes-support/gnutls/gnutls_3.6.13.bb  |   1 +
 17 files changed, 1474 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2020-8622.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2020-8623.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2020-8624.patch
 create mode 100644 meta/recipes-devtools/go/go-1.12/0001-net-http-cgi-rename-a-test-file-to-be-less-cute.patch
 create mode 100644 meta/recipes-devtools/go/go-1.12/CVE-2020-16845.patch
 create mode 100644 meta/recipes-devtools/go/go-1.12/CVE-2020-24553.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-10756.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-14364.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-15863.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-16092.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14347.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2020-24659.patch

-- 
2.26.2

