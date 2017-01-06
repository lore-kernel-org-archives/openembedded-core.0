Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id A069D60107
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jan 2017 09:55:12 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id p127so53233838iop.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jan 2017 01:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=jnuLrXM7VxNLoDtU6DK42TVMuhNCw8m8hIMW/FGq9Tc=;
	b=o8/0FERYtk628Z/oyvRpnlQbujRPxa0TYshyPUlpfEbNqGQ9n8QLlVbzobInmQwYo+
	/KvLdvRRQTctEmLyH4rh8QzK/8FFwmtn5/4FqYhDgSr8np+yTNKOJTKj3mkW2qwOvPJ3
	chuftrWTU64kLaS4q7mFbaXylvUWe76cMf/KzASfjC27aaF9Umn1aHUpI1Mhw9cfzoaZ
	sVttTzroLydnUnJ1zyQ4OFTd1oAgoKXXjv7T/K6ooHGN3CLN5T9ivqQfgqrGtWAJn4/d
	oeNm2ZMF2SsUvcAUb88IVY9oGs6mpYifl8mSSR39ZwceZ5EAyYXBoOdWU4uhp2A+U4TL
	VzwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=jnuLrXM7VxNLoDtU6DK42TVMuhNCw8m8hIMW/FGq9Tc=;
	b=BMKzqzwiRFM7o5a+HMWSsWyKgHkqfgPf/w9lulhSuFGdtufkF/oXHrGcvxXyRWQYmm
	LBF3vH8q+GwstQUmzNEmmF+sSsGPfQ23ecBcsfzo+d49QqSrZ8+wLCi0PVM/yUHNUpWo
	qdS/hLmSQg2qKcWH7MLm5Yd+KSXqPn7HnsDjFkmx6JktJ4xgEJvLjYMkNu4unFmuU8lJ
	z4dkB4d4IbZF/0XI3C3Dip6wnvHLrWbo75aV9OZLaAkSRrqQ98wSlzCZjtPAIMl2fz12
	STxkZ9v552cwpAFYYFfsKYm7dbped2orj0DMZPDHZKAY9C+cp9YkArxwMOgNSW7V3idW
	yozg==
X-Gm-Message-State: AIkVDXIKoFYBk2CAMicSo5nPJK4VuPUo2s3M9HyUxGp9pqCeG3FqaOeVYpRyKkv5wtevX0rD
X-Received: by 10.107.131.150 with SMTP id n22mr57789760ioi.71.1483696512084; 
	Fri, 06 Jan 2017 01:55:12 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8F5BD.dip0.t-ipconnect.de.
	[93.232.245.189]) by smtp.gmail.com with ESMTPSA id
	m128sm1157680itm.16.2017.01.06.01.55.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 06 Jan 2017 01:55:11 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Jan 2017 10:55:00 +0100
Message-Id: <cover.1483696378.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/3] rm_work enhancements
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
X-List-Received-Date: Fri, 06 Jan 2017 09:55:12 -0000

This is the OE-core side of the rm_work.bbclass enhancements. Depends
on the corresponding bitbake patch series. See the OE-core "rm_work +
pybootchart enhancements" mail thread for further information.

The following changes since commit af330fc0087692039d4256a6fb1e122742e8ec1a:

  packagegroup-core-lsb: add opengl to REQUIRED_DISTRO_FEATURES (2017-01-05 13:53:45 +0000)

are available in the git repository at:

  git://github.com/pohly/openembedded-core rmwork
  https://github.com/pohly/openembedded-core/tree/rmwork

Patrick Ohly (3):
  gcc-source.inc: cleanly disable do_rm_work
  rm_work_and_downloads.bbclass: more aggressively minimize disk usage
  rm_work.bbclass: clean up sooner

 meta/classes/rm_work.bbclass               | 31 ++++++++++++++++------------
 meta/classes/rm_work_and_downloads.bbclass | 33 ++++++++++++++++++++++++++++++
 meta/recipes-devtools/gcc/gcc-source.inc   |  2 +-
 3 files changed, 52 insertions(+), 14 deletions(-)
 create mode 100644 meta/classes/rm_work_and_downloads.bbclass

-- 
2.1.4


