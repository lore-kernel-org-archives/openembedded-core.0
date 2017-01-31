Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f46.google.com (mail-lf0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id 9F14271E51
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2017 07:18:14 +0000 (UTC)
Received: by mail-lf0-f46.google.com with SMTP id v186so206638875lfa.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 23:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=WvgowXfB4fT4+FT+YZLSiHXLCRG/W9m+VWJ+V2QVLv4=;
	b=wRWL21AjiEQzFwYQ8GcqK/C3IO8Ca8JNjX0ZiF/kyV7va3VSQjV4gufC2V8sCVRFzR
	HQF/IUfxYFok9FyeR7BNPz9kwVSFXoncWnj4nJ5XmYQ9ft5OSyAlACsbmMbf85xar6aR
	PGpRAEpY4oXnEB4KCuT9ARrA9H2/F9zls3Rw2YDf1CC3oXRXVy7asnA4fJE+CA9uDD66
	mfgL43SgBFPCwN64mokqrDMi4U19vSnXuQVsn+TA3VX1NMQG3WNOvstEWzbDdrt9W2Jw
	OD/4HoZNbLXXMqDxcdZ2Xhkb8qbjROszKPzOenuiplooOVtbOhDvF8LNV7NyF365DMJ1
	VmRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WvgowXfB4fT4+FT+YZLSiHXLCRG/W9m+VWJ+V2QVLv4=;
	b=FKCiYdGSkyYbCwbgY/pYUcP+vNvK3qPxHOUCCBDGk3rpEiBbzs3WX/PDVdIz/bDolJ
	j8k2RTWGg6LDmDjgHWodPkaEfNyhnVn1SG4IV6ej0sPK+0NMK04aRDRQFabRAyCNkF1h
	lyKJiF9De+thq+iJ7gjeeizFFBz7ePY8MaiRlq9Zy2pvS7kGPe0iaewUO1E6EmHh6C17
	KO9HI7GJPdW6m9sz1/mNCIVB04Y9MeYs7CM+VwN8OUfy6sLk4VZChIOgywYPAmHncK8t
	Ofh8/ETqk9kgqTkYvyd2+nH+Rne8nUFZHF1E7YXxdrsD/UZMVi58Lplnh/x9/qvLS6Qm
	QyWA==
X-Gm-Message-State: AIkVDXJBNbYBfuQDJ+XjmEUF0sS+eBJaMQUQEWOJwB0/YyhauvCodFEkaur3/QIMVYCZIw==
X-Received: by 10.46.80.22 with SMTP id e22mr9652349ljb.29.1485847094960;
	Mon, 30 Jan 2017 23:18:14 -0800 (PST)
Received: from localhost (194-237-220-218.customer.telia.com.
	[194.237.220.218]) by smtp.gmail.com with ESMTPSA id
	c143sm4332335lfc.13.2017.01.30.23.18.13
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 30 Jan 2017 23:18:13 -0800 (PST)
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jan 2017 08:18:11 +0100
Message-Id: <cover.1485846907.git.anders@chargestorm.se>
X-Mailer: git-send-email 2.11.0
Cc: Anders Darander <anders@chargestorm.se>
Subject: [PATCH v2 0/7] Python3 packaging fixes
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
X-List-Received-Date: Tue, 31 Jan 2017 07:18:17 -0000

This moves a few python modules to more logical places (thus removing the
need for python3-misc on more systems).

A new package for typing.py is also created.

0001 add imp to importlib in the generator, the earlier commit in oe-core 
that made this move, only patched the generated manifest.

v2: rebased on todays master

The following changes since commit d7d26488f252d60628862ee114a4404e8d6cb6f1:

  staging: Handle stale sysroot rebuild issue (2017-01-28 23:31:18 +0000)

are available in the git repository at:

  git://github.com/darander/openembedded-core python-splitting-v2
  https://github.com/darander/openembedded-core/tree/python-splitting-v2

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
2.10.2


