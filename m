Return-Path: <george.mccollister@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 026A8601F2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 22:07:35 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id r141so787804ita.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 14:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=8QYdlQ+16n5wQdEPSyCT4SHnxeixRLO7z/LWsVqSXxQ=;
	b=Sm2g1qWweBc6LRYGIJ7nOYzKa75znYph52V1n4EIkzZUuDAQqkUYtdk3lyzkykl5S1
	cRakkyxyIhETMA+kZHhgARkD2yl+wgk51Ajo8jbipM77BSYeqZWQAlQLuKGm/dt28DtU
	ZNhDTMyre8zbVtw/AIW8U+cyq0SrbzvCybUfzUni4UFfBkDnqvDTcbECGhKdLKJg/NLx
	e3eg5C8K9kkF5NUw2jtz5H/0FXOVQsGHf1S5EmAY2fLFSg2dV9cvGm/vwG0i0X/xLr7+
	s+9W36Kwo16kIBIB47v2cSLQ/zTHNyllBvF3pzA0EdPJoiSn/XBEngD34fVWy81Y1Ck+
	1kbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8QYdlQ+16n5wQdEPSyCT4SHnxeixRLO7z/LWsVqSXxQ=;
	b=lGZvioUVkDBE6XWCAsOK9EeBP0bIcMEFBG+9KXgOy2sTzD4EyPpnWgw8Dw+gfTiT/q
	m6xS9UczRXMWaCuM+mTU1FfhPy86bSwABDCExKwf9d9iGpcPjyJqrqNo7ptsv1Q+JA7q
	yNXSCsOgBkfIzte/C71q2s33DBXTvAxGnazQbjoQPQotpzoG2lU+MFzqMRIK9dn60yQM
	3wHsqmCXnCscXpnd3aO7nxJzJHJFbKZcId1i7odWkOIcNKASJ2Sn+ZfgTo9pbJ6YGVK5
	h9ejGUyTZkqp3onU3u3+XJagKWMATa3c1R919M4P0c89H3+e+OQgY44TDMZ8Smg6m5Le
	U7KQ==
X-Gm-Message-State: AMke39lDew0wGXblcyPHZ5bKJ9BBKB4aSFf2LSdwYZC3+io6mFS32zmaB3hyI+TvC4gPew==
X-Received: by 10.36.227.198 with SMTP id d189mr568738ith.36.1487023655603;
	Mon, 13 Feb 2017 14:07:35 -0800 (PST)
Received: from localhost.localdomain (216-21-169-52.slc.googlefiber.net.
	[216.21.169.52])
	by smtp.gmail.com with ESMTPSA id m6sm4457659ioa.57.2017.02.13.14.07.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 Feb 2017 14:07:35 -0800 (PST)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Feb 2017 16:06:53 -0600
Message-Id: <cover.1487022302.git.george.mccollister@gmail.com>
X-Mailer: git-send-email 2.8.0
Subject: [morty][PATCH v2 0/3] Resolve gdb-cross-canadian dependency on imp
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
X-List-Received-Date: Mon, 13 Feb 2017 22:07:36 -0000

Add imp to python3-importlib. Make gdb-cross-canadian depend on
nativesdk-python3-importlib when python is enabled.

Changed since v1:
Cherry picked patch that changes generate-manifest-3.5.py to add imp to importlib

The following changes since commit 55c835c73cc41b6fc809c941c295d62a612e49e0:

  build-appliance-image: Update to morty head revision (2017-02-08 12:00:29 +0000)

are available in the git repository at:

  git://github.com/gmccollister/openembedded-core morty-gdb-cross-canadian
  https://github.com/gmccollister/openembedded-core/tree/morty-gdb-cross-canadian

Anders Darander (1):
  python-3-manifest: fix adding imp to importlib

George McCollister (2):
  python-3.5-manifest: Add imp to importlib
  gdb-cross-canadian: Depend on nativesdk-python3-importlib

 meta/recipes-devtools/gdb/gdb-cross-canadian.inc     | 3 ++-
 meta/recipes-devtools/python/python-3.5-manifest.inc | 2 +-
 scripts/contrib/python/generate-manifest-3.5.py      | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

-- 
2.8.0


