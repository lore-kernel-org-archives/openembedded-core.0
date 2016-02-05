Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6475477155
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 14:53:29 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id yy13so2541786pab.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Feb 2016 06:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=7qj/Pofjct5Uydk6KmJKUhZI0V0xqd07qm1FP1Co0Kw=;
	b=BNHUPxu8UKPIjIdd3+qk8u0u5CQ3nVEYiKPD7BvJtiyt8zQLGFFeKdbUBksR9roTix
	C7xgHpCg8ATa4lAOUqUIJfKBUd0UN6HOYob+vho3Z6i+NuXxRhVaVWHcBGKouQdfGCsR
	1sC0pZpj1ZozMeRbr25U0ucVAkqAQMDxvUluiRf279YUJuX0z8FjiXj4ESoHUqyJuN4t
	mREiP5teljazfWlBVENGvzSKmLNaZwbQl4N6DSFF+jQT0qQQic0GCXR/ZqD/dZQnG0tU
	Gx67T6DuBDqTx3tIcAbSO7R1DMnuyvNYOaj0nRIfHNoZ+HFwWUhtDP79NkbXP9rKvcrQ
	X3eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=7qj/Pofjct5Uydk6KmJKUhZI0V0xqd07qm1FP1Co0Kw=;
	b=EbWPDTZ1ptMvVfejNkXtB7T+dkRxLscyVeLi3IXCh14kV9jGYXD3q8lROO+JfCqb8L
	hP+zXAFM+A4P5R5xSCbDbQEte3mGJ/IaSDFeNwqHaer3Fc4UmUdJZgyMa+9e5ltSqfTk
	GlrAW695YbkHvYRiKQFfCLSLFE+IzQbz5mNdV4u7OOfcCDHMgUdmgpQRmc4B12OIKyc4
	sDH6KWtXgdiqCQTZ10kYRvhxgHXjto5pYMKcy0oo3A5kfKQThFp6LcYkjGp/H8gTBbsI
	lIoojDKSONyL0yl40UOQYewuPe6gIsD+BudWg2SH9zLrfm57SdRP6Hn0aAhmpYpIRoYQ
	M1jw==
X-Gm-Message-State: AG10YOQuK9QA+hJDvLCarEBFcUq5B7LkiviqhsJCSWKvvASnCqXGg3su4g/bxjOYKke3Lw==
X-Received: by 10.66.156.195 with SMTP id wg3mr20245773pab.54.1454684010042;
	Fri, 05 Feb 2016 06:53:30 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	o184sm25144290pfo.36.2016.02.05.06.53.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 05 Feb 2016 06:53:28 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	liezhi.yang@windriver.com
Date: Fri,  5 Feb 2016 06:53:19 -0800
Message-Id: <cover.1454683625.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
Subject: [PATCH 0/4][jethro] Secuirty Fixes pull request
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
X-List-Received-Date: Fri, 05 Feb 2016 14:53:32 -0000

From: Armin Kuster <akuster@mvista.com>

please consider these changes for Jethro next.

foomatic-filters: Security fixes CVE-2015-8327 is version 2 as the recipe was not updated.

The following changes since commit ae1df825062fc841130622b8e154c6ed0f83f375:

  foomatic-filters: Security fix CVE-2015-8560 (2016-02-04 20:41:33 -0800)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akuster/jethro_cve_fixes
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akuster/jethro_cve_fixes

Armin Kuster (4):
  foomatic-filters: Security fixes CVE-2015-8327
  libpng: Security fix CVE-2015-8126
  libpng: Security fix CVE-2015-8472
  socat: Security fix CVE-2016-2217

 .../socat/socat/CVE-2016-2217.patch                | 372 +++++++++++++++++++++
 meta/recipes-connectivity/socat/socat_1.7.3.0.bb   |   1 +
 .../foomatic-filters-4.0.17/CVE-2015-8327.patch    |  23 ++
 .../foomatic/foomatic-filters_4.0.17.bb            |   1 +
 .../libpng/libpng-1.6.17/CVE-2015-8126_1.patch     |  91 +++++
 .../libpng/libpng-1.6.17/CVE-2015-8126_2.patch     | 134 ++++++++
 .../libpng/libpng-1.6.17/CVE-2015-8126_3.patch     |  79 +++++
 .../libpng/libpng-1.6.17/CVE-2015-8126_4.patch     |  48 +++
 .../libpng/libpng-1.6.17/CVE-2015-8472.patch       |  29 ++
 meta/recipes-multimedia/libpng/libpng_1.6.17.bb    |   8 +
 10 files changed, 786 insertions(+)
 create mode 100644 meta/recipes-connectivity/socat/socat/CVE-2016-2217.patch
 create mode 100644 meta/recipes-extended/foomatic/foomatic-filters-4.0.17/CVE-2015-8327.patch
 create mode 100644 meta/recipes-multimedia/libpng/libpng-1.6.17/CVE-2015-8126_1.patch
 create mode 100644 meta/recipes-multimedia/libpng/libpng-1.6.17/CVE-2015-8126_2.patch
 create mode 100644 meta/recipes-multimedia/libpng/libpng-1.6.17/CVE-2015-8126_3.patch
 create mode 100644 meta/recipes-multimedia/libpng/libpng-1.6.17/CVE-2015-8126_4.patch
 create mode 100644 meta/recipes-multimedia/libpng/libpng-1.6.17/CVE-2015-8472.patch

-- 
2.3.5


