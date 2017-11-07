Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 1408378429
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Nov 2017 16:55:50 +0000 (UTC)
Received: by mail-pf0-f172.google.com with SMTP id x7so10765178pfa.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Nov 2017 08:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=kubxyqqFwrCUm1qU1YJKKakq31NzKBB846vuifmVYAU=;
	b=YBA0XlBZMcl/qLAjdTP1hPGB/G0lKQ03DMRXGnBjzkYJhgANhOAfAfp89tWBfQLIC0
	9fwsawH1re1J3ludcrsIT/Y6SQYLezjyRMpbuovuCftWMWDjFHVbeylouNBPVwbgQU/p
	RDMGtoM29t/niTpXefUuw++x+uaDxg31ZLoJeXg9e+KJ4BKdK+9zqPaLR3/McCxV0zt8
	ofSFmFpZeoOjFbbt/dVIZkn/Lc0mE6p52hnzqXBaPyRKTczGre4niygTZOYkmwnikD2K
	NMq+0kRIFBbtTpM1kVBA2z7lSVDQMqxJTz3umySBDcQx2sshAOkjB2hqklZMiFYW0tMV
	jg5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=kubxyqqFwrCUm1qU1YJKKakq31NzKBB846vuifmVYAU=;
	b=fXcCBYESGjB9sRU9h/XDmY9wBOpJMu+z3ZY1OJxnsDY4UX2Ndp8ThzOm3RjbTuGglj
	qPSds4aCkco/BefQQxBVoKRclcmngTJ5zUuZT5inAO82toXOAt3ju3+XeiWpv+gN1/O3
	+o6Va36XMcnc/oG6RUULEN4AYyRl7s40cqxh1S56Wf5ngaOb2p0pPZ9KktRJG2/4K+R4
	kycz3Cxq7hz2GMGrvWGodJGw9pE66UGwrBNmPpL00mcYNLXLTH5itiCnYLw6zscTMKJ4
	LOKdqwEE98ocq0Ep/0/FhXStmFHlhjk00PzycUnlWHAx9ogc/RmVeQ5wVe6YEkLLpeLH
	p7Dw==
X-Gm-Message-State: AMCzsaXzOHGpfP+vOmTzZtVuYyspjBljcg5YbhkXuMZwHYXvakg/YZRC
	GNvwkd1V0HVVPS23yRP05xo=
X-Google-Smtp-Source: ABhQp+R2Y//yeeHzj046mkYXDVpR/s9s+IyLh3bxnBvFnlMzuETKBpvLbj6Y/ZtJnl5+lyYipjmxeg==
X-Received: by 10.98.155.10 with SMTP id r10mr21523788pfd.66.1510073751977;
	Tue, 07 Nov 2017 08:55:51 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4001:9ea0:a54b:f983:3094:c1b6])
	by smtp.gmail.com with ESMTPSA id
	v22sm3693914pgb.65.2017.11.07.08.55.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 07 Nov 2017 08:55:51 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Tue,  7 Nov 2017 08:55:13 -0800
Message-Id: <cover.1510071393.git.akuster@mvista.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 00/36] Morty-next pull request
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Nov 2017 16:55:51 -0000

From: Armin Kuster <akuster@mvista.com>

Cover letter only
Please consider these changes for morty.
Clean AB build

The following changes since commit 6da3e0a0abf1251db243548639979f8d74e99766:

  bitbake: Replace deprecated git branch parameter "--set-upstream" (2017-11-07 13:38:57 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akuster/morty-next
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akuster/morty-next

Joshua Lock (1):
  ruby: fix build of ruby-native with gcc7

Li Zhou (1):
  libtiff: Security Advisory - libtiff - CVE-2017-5225

Rajkumar Veer (19):
  tiff: Security fix for CVE-2016-10271
  tiff: Secruity fix CVE-2016-10093
  tiff: Security fix CVE-2016-10268
  tiff: Security fix CVE-2016-10266
  tiff: Security fix CVE-2016-10267
  tiff: Security fix for CVE-2016-10269
  tiff: Security fix for CVE-2016-10270
  tiff: Security fix for CVE-2017-7592
  tiff: Security fix for CVE-2017-7594
  tiff: Security fix for CVE-2017-7595
  tiff: Security fix for CVE-2017-7596
  tiff: Security fix for CVE-2017-7598
  tiff: Security fix for CVE-2017-7601
  tiff: Security fix for CVE-2017-7602
  tiff: Security fix for CVE-2017-7593
  curl: Security fix for CVE-2017-1000100
  curl: Security fix for CVE-2017-1000101
  ruby: Security fix for CVE-2017-14033
  ruby: Security fix for CVE-2017-14064

Thiruvadi Rajaraman (14):
  curl: Security fix for CVE-2016-8615
  curl: Security fix for CVE-2016-8618
  curl: Security fix for CVE-2016-8619
  curl: Security fix for CVE-2016-8620
  curl: Security fix for CVE-2016-8621
  curl: Security fix for CVE-2016-8623
  curl: Security fix for CVE-2016-8617
  curl: Security fix for CVE-2016-8624
  curl: Security fix for CVE-2016-9586
  ruby: Security fix for CVE-2016-7798
  ruby: Security fix for CVE-2017-9227
  ruby: Security fix for CVE-2017-9228
  ruby: Secruity fix for CVE-2017-9226
  ruby: Security fix for CVE-2017-9229

Yi Zhao (1):
  tiff: Security fixes

 .../recipes-devtools/ruby/ruby/CVE-2016-7798.patch | 164 +++++++++++
 .../ruby/ruby/CVE-2017-14033.patch                 |  89 ++++++
 .../ruby/ruby/CVE-2017-14064.patch                 |  79 ++++++
 .../recipes-devtools/ruby/ruby/CVE-2017-9226.patch |  33 +++
 .../recipes-devtools/ruby/ruby/CVE-2017-9227.patch |  24 ++
 .../recipes-devtools/ruby/ruby/CVE-2017-9228.patch |  26 ++
 .../recipes-devtools/ruby/ruby/CVE-2017-9229.patch |  36 +++
 meta/recipes-devtools/ruby/ruby/prevent-gc.patch   |  32 +++
 meta/recipes-devtools/ruby/ruby_2.2.5.bb           |  10 +
 .../libtiff/files/CVE-2016-10093.patch             |  47 ++++
 .../libtiff/files/CVE-2016-10266.patch             |  60 ++++
 .../libtiff/files/CVE-2016-10267.patch             |  70 +++++
 .../libtiff/files/CVE-2016-10268.patch             |  30 ++
 .../libtiff/files/CVE-2016-10269.patch             | 131 +++++++++
 .../libtiff/files/CVE-2016-10270.patch             | 134 +++++++++
 .../libtiff/files/CVE-2016-10271.patch             |  30 ++
 .../libtiff/files/CVE-2017-10688.patch             |  88 ++++++
 .../libtiff/files/CVE-2017-11335.patch             |  54 ++++
 .../libtiff/files/CVE-2017-7592.patch              |  40 +++
 .../libtiff/files/CVE-2017-7593.patch              |  98 +++++++
 .../libtiff/files/CVE-2017-7594-p1.patch           |  43 +++
 .../libtiff/files/CVE-2017-7594-p2.patch           |  50 ++++
 .../libtiff/files/CVE-2017-7595.patch              |  48 ++++
 .../libtiff/files/CVE-2017-7596.patch              | 308 +++++++++++++++++++++
 .../libtiff/files/CVE-2017-7598.patch              |  65 +++++
 .../libtiff/files/CVE-2017-7601.patch              |  52 ++++
 .../libtiff/files/CVE-2017-7602.patch              |  69 +++++
 .../libtiff/files/CVE-2017-9147.patch              | 203 ++++++++++++++
 .../libtiff/files/CVE-2017-9936.patch              |  46 +++
 .../libtiff/files/libtiff-CVE-2017-5225.patch      |  92 ++++++
 meta/recipes-multimedia/libtiff/tiff_4.0.7.bb      |  23 +-
 meta/recipes-support/curl/curl/CVE-2016-8615.patch |  71 +++++
 meta/recipes-support/curl/curl/CVE-2016-8617.patch |  30 ++
 meta/recipes-support/curl/curl/CVE-2016-8618.patch |  49 ++++
 meta/recipes-support/curl/curl/CVE-2016-8619.patch |  56 ++++
 meta/recipes-support/curl/curl/CVE-2016-8620.patch | 146 ++++++++++
 meta/recipes-support/curl/curl/CVE-2016-8621.patch | 104 +++++++
 meta/recipes-support/curl/curl/CVE-2016-8623.patch | 174 ++++++++++++
 meta/recipes-support/curl/curl/CVE-2016-8624.patch |  68 +++++
 meta/recipes-support/curl/curl/CVE-2016-9586.patch |  66 +++++
 .../curl/curl/CVE-2017-1000100.patch               |  47 ++++
 .../curl/curl/CVE-2017-1000101.patch               |  94 +++++++
 meta/recipes-support/curl/curl_7.50.1.bb           |  14 +-
 43 files changed, 3191 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2016-7798.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2017-14033.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2017-14064.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2017-9226.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2017-9227.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2017-9228.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2017-9229.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/prevent-gc.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-10093.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-10266.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-10267.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-10268.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-10269.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-10270.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-10271.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2017-10688.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2017-11335.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2017-7592.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2017-7593.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2017-7594-p1.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2017-7594-p2.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2017-7595.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2017-7596.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2017-7598.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2017-7601.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2017-7602.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2017-9147.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2017-9936.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/libtiff-CVE-2017-5225.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2016-8615.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2016-8617.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2016-8618.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2016-8619.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2016-8620.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2016-8621.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2016-8623.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2016-8624.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2016-9586.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2017-1000100.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2017-1000101.patch

-- 
2.7.4


