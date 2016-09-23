Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 9D7196076F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 08:39:46 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id r145so111567562ior.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 01:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=EG7x5oEYfWPLLYXmvzz5MSowQ8kbOMQNWsG4JnZ6pY0=;
	b=QgTvifAL6DZDPX6+mBNR+t1vxz+Y+wx49cexfvayMRIxrtRukjyuX3ieFPQayjd5bi
	I3hBbo8GaGGrhX4jWaBPLZl7h2dhZ4XAqyQ7cHWk1lZak1RMFK071CIRa7xe+9fvYkEd
	r4/mcxPsmtTBvqQJ5xU8FRk7F1/7etWTAJotcTKd2Vg60cdLaqIbbNAKZHb7hhaASrjP
	afZerrQLRY4kk99cp+DotSu1AemyHB987yb400YrdkBe5O/ka805CDa2JvfVgach8/dE
	sWl+nCS+BECH60vbgJSKPLT9oK8pVwZOLJxREclmXsJmZ+H7RSb9dY0UryAJk9UF/LTp
	xzKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=EG7x5oEYfWPLLYXmvzz5MSowQ8kbOMQNWsG4JnZ6pY0=;
	b=B3FxzhFK1w2outnJn5miCaefb16PAPa/R/5VfZ74WM8ioL58wA6aWSs3hiFNRSpAH1
	QfqS6WLiefoxeUCrkllHDRMgLmigPJPLtIINMj4aiDzNaKV+E4GQbd7AQj9Eg+c1mmoP
	7y+YglXRdOKxq3oLSW869BAcrrMNxQTdJ06UOvsptUUDS/Fi+i+SIPgvXo2qSCko//JD
	Q983nOke3k8cUL6QJFnYkOHgJTBUzclFLQDqHQTWmRDficYjMNdSR7cAmdwqobOyNXB6
	wCDds/jtA5WBPsw/q0XVFrAWedDiuxptsbAvXiRpZp3GaQNi5GboLQzOed1tpqh3EU55
	P9aQ==
X-Gm-Message-State: AA6/9Rk/xZcicZzwdSar9e07v8JBLWwZGdAg7RXtYVDOPF0Ra8q9XX0bNhLDUYCLj02btH5r
X-Received: by 10.107.147.9 with SMTP id v9mr7523494iod.66.1474619987973;
	Fri, 23 Sep 2016 01:39:47 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p57A56298.dip0.t-ipconnect.de.
	[87.165.98.152]) by smtp.gmail.com with ESMTPSA id
	l15sm2469545ioe.14.2016.09.23.01.39.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 23 Sep 2016 01:39:18 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Sep 2016 10:38:56 +0200
Message-Id: <cover.1474619763.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/1] openssl: update to 1.0.2i (CVE-2016-6304 and more)
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
X-List-Received-Date: Fri, 23 Sep 2016 08:39:48 -0000

Fixes several CVEs.

It compiled for me okay for qemux86, but running the ptests showed a
problem in one of the new tests. I'll investigate that further, but in
the meantime wanted to send out the patch already in case that someone
has any comments, and to let everyone know that something is in the
pipeline for these CVEs.

The following changes since commit 7e0f95bf359bc3b5bb1578024a993e184de155cd:

  base.bbclass: Drop unnecessary dirs setting (2016-09-22 11:08:23 +0100)

are available in the git repository at:

  git://github.com/pohly/openembedded-core openssl-102i
  https://github.com/pohly/openembedded-core/tree/openssl-102i

Patrick Ohly (1):
  openssl: update to 1.0.2i (CVE-2016-6304 and more)

 .../openssl/openssl/CVE-2016-2177.patch            | 286 ---------------------
 .../openssl/openssl/CVE-2016-2178.patch            |  51 ----
 .../openssl/Fix-typo-introduced-by-a03f81f4.patch  |  29 +++
 .../openssl/openssl/debian/ca.patch                |   2 +-
 .../openssl/openssl/parallel.patch                 |  17 +-
 .../{openssl_1.0.2h.bb => openssl_1.0.2i.bb}       |   7 +-
 6 files changed, 47 insertions(+), 345 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-2177.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-2178.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/Fix-typo-introduced-by-a03f81f4.patch
 rename meta/recipes-connectivity/openssl/{openssl_1.0.2h.bb => openssl_1.0.2i.bb} (91%)

-- 
2.1.4


