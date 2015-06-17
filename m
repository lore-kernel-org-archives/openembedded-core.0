Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 9802775662
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 10:25:11 +0000 (UTC)
Received: by igbsb11 with SMTP id sb11so33513759igb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 03:25:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=EwLVF+kF4Grk+62uTt+uD++kYXVaufUE7wphc8zIKyQ=;
	b=Oj94bMyXSkLp18r5O+dRKFfNdTdaxxMJeVR3uhwG9HRH4Z3P7jenpNk8YvRjhJY0eu
	qyfGXJMBUBDAH3zV2D9u1M0HWuFuFTiVGOJAYDDqFfDyXGsQJ7CAWxeOSPJHFFYJkIo1
	lpcQ6+AbdQwhsHCNSLiVbah5cAYZ1VVASk4BtkHZi79BzaBK6IblXudANFd+gkSdCDbK
	U8r+sPl+uoAMUuZBFZ5rFK9/wvMg/Ifjc55SsxnT368/Vo3XoG1RiVfs34TCjNpJZu82
	tfpx+LyMjuMS06tQeCOPT0UtYJvELF00swMJAsaT7ycrELDR82PMaLYuQuO8qqX7IvAg
	JeYg==
X-Gm-Message-State: ALoCoQlsm9pdXFYPRSHTfuf6xeacHDu6/eZuXVGo9qioHenqMSWwY3bioGbHhBryaYRmH59Q2TnP
X-Received: by 10.50.59.211 with SMTP id b19mr33430928igr.42.1434536712391;
	Wed, 17 Jun 2015 03:25:12 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8C53F.dip0.t-ipconnect.de.
	[93.232.197.63])
	by mx.google.com with ESMTPSA id 191sm2360582iof.18.2015.06.17.03.25.10
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 17 Jun 2015 03:25:11 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jun 2015 12:25:13 +0200
Message-Id: <1434536714-22457-1-git-send-email-patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: indirect dependencies
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
X-List-Received-Date: Wed, 17 Jun 2015 10:25:13 -0000

I recently ran into a situation where due to a stupid typo (DEPEND
instead of DEPENDS) my recipe happened to work for me when the
required package was pulled in indirectly and failed for someone else.

It would be nice if such indirect dependencies triggered a QA
warning, which they do not at the moment.

I started coding that, but ran into issues with false positives. I
don't have the time and knowledge to address these problems, but
wanted to shared the code anyway, in case that someone wants to
continue.

Patrick Ohly (1):
  insane.bbclass: add indirect-build-deps QA check

 meta/classes/insane.bbclass | 52 +++++++++++++++++++++++++++++++++++++++------
 1 file changed, 45 insertions(+), 7 deletions(-)

-- 
2.1.4


