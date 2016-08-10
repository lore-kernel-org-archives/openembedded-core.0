Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 163CC74197
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 15:03:37 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id y134so2992885pfg.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 08:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=sEY8wanzPU9NrQRBsqvcMMmAWcRKRF93qtrYb1JlteE=;
	b=em2uteygMDsXm8auu0EZVYqDPVv+L1a6wWRx1WXA5xJ+QghorgUmlDC/+7PtarJFvo
	epq18025G3fAEs2tz48ZZ1WWfI+ybZ1rEd1plJAI1VZ7PXPK1GMLKsC9Dn4QkjhGrtqy
	o083o749KYxwDlwpsGRgjH9K8XNKubTFVm4uSe67ZRJCNy6sKPdNA7IjutZB09KhMNBQ
	FwTNCjg0ynApxOQ6dzXldTAgGqBT3RA9Z/Myg6wz+W8FX8RCm3nraHB0669fcpJkpdlX
	tlpm3RtSQl1zjfLjOD8FemeZ5HcN9XH5iYF1uXIPTl5smwdzHy+FVSM/gb26ZfOjYy+6
	9P/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=sEY8wanzPU9NrQRBsqvcMMmAWcRKRF93qtrYb1JlteE=;
	b=j+oH+VtdbfeICZXE6iYGyQl4Fa1wqawnKqtZeyCnDcp2op7v2C3y8ykOfnQCEm4xGP
	giEdTdTnBeddoaWK0fe39eLNwuv6RGt/2dcKi44ymXVwdF33DMqVMO7dqg+Bq4DVjsze
	VJKqLeH6CAHo1LkbjxTZZO46TeElbm/I0iSCZokwuuMAsMODAdiK8fDKo0L7SBs4H/cz
	4QbWp0kuARAg9M58Hau1SsOaDyOWnGYOZTw7aTd56dZQhn8nYSYUniyQayTI7zeu8bVb
	ibyH8SltKcWwsd+u6gXok4LxaVAuwU8JNXwpYHwhKMT3d4J1Mwau+29x5AloU8ih7VpI
	43QA==
X-Gm-Message-State: AEkoouu62HQXulW4DaZxFaRZvXvk9xNmHCQ6w4dD+YoBlZfwhkw4A0sQRKSWssj1s+xr/A==
X-Received: by 10.98.34.151 with SMTP id p23mr8046528pfj.102.1470841418259;
	Wed, 10 Aug 2016 08:03:38 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	b64sm64742783pfa.82.2016.08.10.08.03.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Aug 2016 08:03:37 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com, openembedded-core@lists.openembedded.org,
	liezhi.yang@windriver.com
Date: Wed, 10 Aug 2016 08:03:18 -0700
Message-Id: <cover.1470841075.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [PATCH 0/8] Jethro-next pull request
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
X-List-Received-Date: Wed, 10 Aug 2016 15:03:38 -0000

Please consider these changes for jethro-next. 

The QEMU changes are a second request.

The following changes since commit 7ed60009e2bcdd2380265ca95eb5de2328825eb5:

  libxml2: Security fix for CVE-2016-4448 (2016-07-09 15:47:51 -0700)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akuster/jethro-next
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akuster/jethro-next

Armin Kuster (4):
  qemu: Security fix for CVE-2016-2858
  qemu: Security fix for CVE-2016-4001
  qemu: Security fix for CVE-2016-4020
  qemu: Security fix for CVE-2016-4037

Awais Belal (1):
  python3: fix CROSSPYTHONPATH for cross builds

Ismo Puustinen (1):
  libpcre: Fix CVE-2016-3191

Jackie Huang (1):
  python: Fix cross compiling issue

Jussi Kukkonen (1):
  bind: CVE-2016-2088

 .../bind/bind/CVE-2016-2088.patch                  | 247 +++++++++++++++++++++
 meta/recipes-connectivity/bind/bind_9.10.2-P4.bb   |   1 +
 .../add-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch |  31 +++
 meta/recipes-devtools/python/python3_3.4.3.bb      |   4 +-
 meta/recipes-devtools/python/python_2.7.9.bb       |   1 +
 .../recipes-devtools/qemu/qemu/CVE-2016-2858.patch | 182 +++++++++++++++
 .../qemu/qemu/CVE-2016-2858_pre_1.patch            |  99 +++++++++
 .../qemu/qemu/CVE-2016-2858_pre_2.patch            | 137 ++++++++++++
 .../qemu/qemu/CVE-2016-2858_pre_3.patch            | 165 ++++++++++++++
 .../recipes-devtools/qemu/qemu/CVE-2016-4001.patch |  50 +++++
 .../recipes-devtools/qemu/qemu/CVE-2016-4020.patch |  38 ++++
 .../recipes-devtools/qemu/qemu/CVE-2016-4037.patch |  66 ++++++
 meta/recipes-devtools/qemu/qemu_2.4.0.bb           |   7 +
 .../libpcre/libpcre/CVE-2016-3191.patch            | 174 +++++++++++++++
 meta/recipes-support/libpcre/libpcre_8.38.bb       |   1 +
 15 files changed, 1201 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-2088.patch
 create mode 100644 meta/recipes-devtools/python/python/add-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-2858.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-2858_pre_1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-2858_pre_2.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-2858_pre_3.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-4001.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-4020.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-4037.patch
 create mode 100644 meta/recipes-support/libpcre/libpcre/CVE-2016-3191.patch

-- 
2.3.5


