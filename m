Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-lf0-f49.google.com (mail-lf0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id 9A3C971B2F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 07:09:35 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id b14so21332584lfg.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 23:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=2M9T2cSN59Ljc2a6IBidjant8FDYCAN5WDG/Erccotc=;
	b=dvS9kogCDs0m99nBE1cG124rtiLBIi4liUg9yawrfFYgyQAFW4436QcGqtigiODvpd
	s2ulhd/J/zlPCVxbOdj1u1WpREC1ZYExdAFOzF2lI01ehcgObwT1VFQOC4iEJLEksxNr
	nKCczTDN4RGk2wRJWJ/ePHEqeKj8Mz/HmR8+A/1uvWr1HiYTMhEPpWWLHJ26GaB9/abj
	EIEO5lSJwqnWvnFLhbKhH4mvZmkMbCaR16Rhef8Mis4d3fENXut8jApGY0Ix+XPkFPin
	8QwN1V87htcCn9vjizJ2tD4gu41Wzzyzeh7pbR4g0f1d08Aq1ZfhcdA6GFIViVvHhWhm
	xxVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2M9T2cSN59Ljc2a6IBidjant8FDYCAN5WDG/Erccotc=;
	b=VOB6lkNllDBaDKL4KOt64N/GkvTaz5iZPRimZQgE+Iyuchb1kLmNczMcVN5Od3Mn0q
	96W4xaam3synXFCjwvEkC4GL/3pDGNLvHBpm1QnjM7jF6ZIoY2P8LHk74vx15ey+b+MA
	ngO3Ux+vVTQKQ3DdlH2dFo3KQG6gNw6G3dyTLUeDPaORuEuCnzmYNhFr1Jw6/Ut+RSgH
	7JlcBEwo249gMp87/zB8AD97v1PaDK6DV1d72QFp1eng7QVtsvnUnUrlisLcsi7ItWvv
	+7Y9NCH+/OC7WDjLNn0M08zozjHgQUG8dTMU0CU+EE1WDjhs9SNbv+tUDwFnZcwkT18a
	zbcw==
X-Gm-Message-State: AKaTC01U22JxOwC7AqfoKTxto8iY41+oLxXQzG/MfgWKliJ29DYw6Z6qDDgiOOk+pkZpNA==
X-Received: by 10.46.5.150 with SMTP id 144mr463582ljf.45.1479971376810;
	Wed, 23 Nov 2016 23:09:36 -0800 (PST)
Received: from comp_016_pc_buildenv.localdomain
	(staticline-31-182-60-238.toya.net.pl. [31.182.60.238])
	by smtp.gmail.com with ESMTPSA id v9sm7780542lja.0.2016.11.23.23.09.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 23:09:35 -0800 (PST)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Nov 2016 08:08:27 +0100
Message-Id: <cover.1479970230.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.5.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Maciej Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH v5 0/6] wic: bugfixes & --fixed-size support, tests, oe-selftest: minor fixes
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
X-List-Received-Date: Thu, 24 Nov 2016 07:09:37 -0000

v5 of a patch series previously posted here [1].

Changes since v4:

* dropped `wic: selftest: do not repeat core-image-minimal` & rebased
  dependant patches

* minor formatting fix in `wic: selftest: add tests for --fixed-size
  partition flags`

[1]. http://lists.openembedded.org/pipermail/openembedded-core/2016-November/129103.html

Maciej Borzecki (6):
  oe-selftest: enforce en_US.UTF-8 locale
  oeqa/utils/commands.py: allow use of binaries from native sysroot
  wic: add --fixed-size wks option
  wic: selftest: avoid COMPATIBLE_HOST issues
  wic: selftest: do not assume bzImage kernel image
  wic: selftest: add tests for --fixed-size partition flags

 meta/lib/oeqa/selftest/wic.py          | 123 +++++++++++++++++++++++++++++++--
 meta/lib/oeqa/utils/commands.py        |   9 ++-
 scripts/lib/wic/help.py                |  14 +++-
 scripts/lib/wic/imager/direct.py       |   2 +-
 scripts/lib/wic/ksparser.py            |  41 +++++++++--
 scripts/lib/wic/partition.py           |  88 ++++++++++++++---------
 scripts/lib/wic/utils/partitionedfs.py |   2 +-
 scripts/oe-selftest                    |   3 +
 8 files changed, 234 insertions(+), 48 deletions(-)

-- 
2.5.0


