Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id C3AEC7705C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 19:25:15 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id pv5so6916554pac.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 11:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=Glbv/0u0TqM4R0eCqVnbSyhbToTjnecdaIifpQSh8J4=;
	b=MgCI66MsToNMvh7dg1AynqGdDiaeY3SQhPSJkbZOhQLvb4rsf0asGye/c4Gb3E/5E2
	TuNYY500qNaoSqTU++6WG6nJQDDtl/GuOQs0ecaVAELOrJSzIEK2ZvnTLB1gOtIvtcc5
	8xpanX875VEXBHSBhlTPgh2Ga6zwGrrfqBh9dIENQKwm9xyNxX9BG0vdEBSxTIJbxuSR
	zqo/h1NNvF6ULdSYXKncULSDc0WZSc/9b9Z6ZqV9NebEA0QEWs+fy63lPbtYa0tUg8eS
	LwlTbLA0aNVnBJd4gOplyABIwqgzVArM16JHl0BapN6K8VggVm8+upf+BF7V9btSdqes
	DBvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Glbv/0u0TqM4R0eCqVnbSyhbToTjnecdaIifpQSh8J4=;
	b=j4l2Pmo07muVfJSYJxFz7m9IeS/9du/HWhWCeUDMqkLKs+23gWvTMMOa5NEdLtc44s
	btiPD9SlnnvlhIOpRIaEv9BDqSeKo1EhQHmsit7pSJsy4WqluXZa2A6Myy1uu98km/Vj
	HMW8aGk5wK5bNO5ep+LXDBEuoQpHObgEep1bdre4Ceqy5uekPNJSY4KbYzuO3uPjsWbd
	47cYrQeNEcTTzjWWsb6O5EiDeX+YHOmIF0vKyeu5y00WhyZnabqvuZ6PeE8o54YSHL7K
	BELLonOEUOv/mMG47vGjilK86NTt3XS0tGDWLHxIrIUX3Bm/EbkB0L1LJoa+Lbbvnpe+
	k7Ug==
X-Gm-Message-State: AG10YOSTtArUAicKuA4oIHgXcpUMKJv6xtBnPabCEQoHZzXc0wMB1bSI4UKAQH9LmOwKgg==
X-Received: by 10.66.235.162 with SMTP id un2mr28115773pac.17.1453749915872;
	Mon, 25 Jan 2016 11:25:15 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	b84sm30482439pfj.25.2016.01.25.11.25.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Jan 2016 11:25:14 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jan 2016 11:25:03 -0800
Message-Id: <cover.1453749700.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [PATCH 0/4][jethro] Glibc security fixes
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
X-List-Received-Date: Mon, 25 Jan 2016 19:25:15 -0000

not sure if my first request went out correctly.

please consider these for the next jethro update

The following changes since commit dd0ba9ea4a11ab15348d4fe3574e4b28784db82f:

  build-appliance-image: Update to jethro head revision (2016-01-17 14:33:04 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akuster/jethro_glibc_cve_fixes
  http://git.yoctoproject.org/cgit.cgi//log/?h=akuster/jethro_glibc_cve_fixes

Armin Kuster (4):
  glibc: CVE-2015-8777.patch
  glibc: CVE-2015-8779
  glibc: CVE-2015-9761
  glibc: CVE-2015-8776

 meta/recipes-core/glibc/glibc/CVE-2015-8776.patch  |  155 +++
 meta/recipes-core/glibc/glibc/CVE-2015-8777.patch  |  123 +++
 meta/recipes-core/glibc/glibc/CVE-2015-8779.patch  |  262 +++++
 .../recipes-core/glibc/glibc/CVE-2015-9761_1.patch | 1039 ++++++++++++++++++++
 .../recipes-core/glibc/glibc/CVE-2015-9761_2.patch |  385 ++++++++
 meta/recipes-core/glibc/glibc_2.22.bb              |    5 +
 6 files changed, 1969 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-8776.patch
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-8777.patch
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-8779.patch
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-9761_1.patch
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-9761_2.patch

-- 
2.3.5


