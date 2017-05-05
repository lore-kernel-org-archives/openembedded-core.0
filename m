Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id 02B5477D85
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 May 2017 10:25:29 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id w68so1144631itc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 May 2017 03:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=yJZTbyvM8wjB+qckMYnkfIctiYfwm29Bfy1Dzis+wtw=;
	b=F9fQ/ZCIlKhtTMxsdzmNugSl2QwmXrrdgaC8a45ClOeVFB9qjjQ6A4Xm8YxeRimnUK
	i6hSqEv1HXj5UW/WR3bgL1+odnw81steEpfxyIyzTKUd5+1fXluPuGLvQUWZ0s0ejfkC
	WB+FqQUftLsiAWehYIqJwuPcCBOSKeKD+TJg9IHaPIhnFXc5VrrRgcG27RXjxsyFOtho
	1rnN2Z7OIOHKdhmlM4Ck6ipwYU9RMX91/wUD4taRZSj5ddat73tJRZ98K9XBJmJogrbh
	qNU0PEMOHf6xPxyiyakInFeX5a3CADV+h6MdeijoHYLTwgFZbLzPvHZyEqHKg3zMEcG6
	tXvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=yJZTbyvM8wjB+qckMYnkfIctiYfwm29Bfy1Dzis+wtw=;
	b=T1XBREgqtBdr8XK6Dh2j6w9Klx03f8/dmKjMEcoqBNAVh2VRlhU7cjZb6iWX1jZ0tP
	Itq2sT33vQc8YO9TvzNhcL1PVe4SYy6ZzrOyEODgcVyhLMQE3HadmOX2TG10p1PBJWVO
	X5oP5+KNgvwHfp34IWsxbAJM+EUbrUvSU0IMxE3fUt4lvu8FdMj4hcnP/0yPkI9VcJ55
	Xvutw6N3XZ7M6xzUI3HbFvmxMF8Q/BcomzvnPfJ1cwGDNs7zxuFYum62vXFdezuyNL6L
	1YYMWPCA0dTihnL9nIjJL+yid4jjeTgIRg0kPZoJfDbcVpgKUi7YP2t6YX7eDd23eBRj
	Vs7w==
X-Gm-Message-State: AN3rC/6PFabtJLguQqvc22g7aexxBRDLAOb/urY3sA1+jlHvo03devqO
	qqyXXmruT+3y2fKu
X-Received: by 10.36.123.137 with SMTP id q131mr8060710itc.23.1493979930890;
	Fri, 05 May 2017 03:25:30 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8E982.dip0.t-ipconnect.de.
	[93.232.233.130])
	by smtp.gmail.com with ESMTPSA id m41sm786759iti.0.2017.05.05.03.25.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 05 May 2017 03:25:29 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 May 2017 12:25:23 +0200
Message-Id: <cover.56e4687985cb836a3bd5be5472b8e1f028840858.1493979782.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 0/2] archiver.bbclass enhancements
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
X-List-Received-Date: Fri, 05 May 2017 10:25:30 -0000

I just wanted to fix Yocto #11441, but then ran into three other
issues. So it goes...

I tried whether adding archiver.bbclass after a kernel build leads to
different source archives, but at least in my experiment it
didn't. It's still probably better to avoid that, just to be on the
safe side.

Patrick Ohly (2):
  archiver.bbclass: various fixes for original+diff mode
  archiver.bbclass: do not cause kernel rebuilds

 meta/classes/archiver.bbclass | 25 +++++++++++++++++++------
 meta/lib/oe/sstatesig.py      |  6 +++++-
 2 files changed, 24 insertions(+), 7 deletions(-)

base-commit: a85768a79daa9697edd8938553490cd9450fbd3f
-- 
git-series 0.9.1

