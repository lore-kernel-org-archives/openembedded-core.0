Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f51.google.com (mail-lf0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id 49F4177341
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 09:06:16 +0000 (UTC)
Received: by mail-lf0-f51.google.com with SMTP id n124so158290061lfd.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 01:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=AzkioQIfY8JiIqm2aXDQGGtXM78q6d9q70b5AKIIbBw=;
	b=arOnLCSlr0pGF8LP25M7Rcy5ySe62sduV60Bq+nIdfra5rBlqgofsX/+i0VDGwBnHE
	+UPI9O9RXwV7KCTA4V6RYsj+k2ypagBWAGt/DwBP80HdUIt+U6reTKFxVixxGX7QqtXv
	QQ9r1VUgLYslI+WlkLDxY/BeRUVXUnk/WOFSaaTlpm7C/BxT2TyOubDXVbsPL8JSf/9q
	4sMuDsvSbItOcjXKOHedjdXa7b49jToXb6DInzs053kKw6pQUv6nkBTaawG6VNQU/o9H
	KKKIgaziogRlF96PyvCzK8WGuVJVVyjUPUSSxBM0OiUrWtsKwVKlUNgEmgId56Hi5WPR
	JPTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=AzkioQIfY8JiIqm2aXDQGGtXM78q6d9q70b5AKIIbBw=;
	b=r1NvQjJfJI6vbjHVoQJohFLJSJJAGYds3qnbFVsl6ffAh7bTfnrksjCAAG9tU3wF5X
	edQZb0MsZJ0YPYqdI2mYJMjQOr4VnDclC5yuMoCSfNxN8diX74rE9MJ/B/rD2iwc7m5Z
	Vka6qJfipXsyadbQRAx+HlmZz0sONozY0hJPk+B+SaQbwZ+OJSsHmgslLzBSMIUhjr57
	DT0TPzvxVCCT7/rgwl3Mg31yZ/sqksA0N1QN/N/J/GT/MrALgTl4mW8x+OwIlqMpORk6
	jg0SjgtFIgoaqyi3ERZcwZH8bI47XHtAFZlGkeUXrs0uTucq3myZKv3TghV+t3hY6NI5
	J5ig==
X-Gm-Message-State: AIkVDXKN1ShNGgc65sp3vnxOlIAaD57xPDQ3rGTD0FS7Kg7wxLVw/WroiO65q3yUmPFHOw==
X-Received: by 10.25.137.193 with SMTP id l184mr1988351lfd.31.1485507976715;
	Fri, 27 Jan 2017 01:06:16 -0800 (PST)
Received: from localhost (194-237-220-218.customer.telia.com.
	[194.237.220.218])
	by smtp.gmail.com with ESMTPSA id 25sm1128430ljo.43.2017.01.27.01.06.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 27 Jan 2017 01:06:15 -0800 (PST)
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jan 2017 10:05:55 +0100
Message-Id: <cover.1485505680.git.anders@chargestorm.se>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 0/7] Python3 packaging fixes
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
X-List-Received-Date: Fri, 27 Jan 2017 09:06:18 -0000

This moves a few python modules to more logical places (thus removing the
need for python3-misc on more systems).

A new package for typing.py is also created.

0001 add imp to importlib in the generator, the earlier commit in oe-core 
that made this move, only patched the generated manifest.

The following changes since commit a99cca0e8ee15f7b542986d89b70054ac7cb24be:

  xserver-xorg: Upgrade 1.19.0 -> 1.19.1 (2017-01-26 10:41:12 +0000)

are available in the git repository at:

  git://github.com/darander/openembedded-core python-splitting
  https://github.com/darander/openembedded-core/tree/python-splitting

Anders Darander (7):
  python-3-manifest: fix adding imp to importlib
  python3-manifest: move htlm.py to python3-html
  python-3-manifest: add argparse to RDEPENDS for netclient
  python-3-manifest: add socketserver to netserver
  python-3-manifest: add _compat_pickle to python3-pickle
  python-3-manifest: add ipaddress to python3-io
  python-3-manifest: split out typing

 meta/recipes-devtools/python/python-3.5-manifest.inc | 20 ++++++++++++--------
 scripts/contrib/python/generate-manifest-3.5.py      | 15 +++++++++------
 2 files changed, 21 insertions(+), 14 deletions(-)

-- 
2.11.0


