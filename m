Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
	[209.85.208.177])
	by mail.openembedded.org (Postfix) with ESMTP id A41D360291
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2019 17:47:05 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id r9so89676208ljg.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Aug 2019 10:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=mok7fYCIJss2PMiaYoVj4CFV7hwgFr0RgNnkoOfFZBg=;
	b=AMkw6+ebN1gkYSznlSdV+cDNH1M85frU4E45H3FSKO+4stG57fF3PfRUEjfdC2XOji
	qqNFGHeTb3IdcIyCfLjkgKkAJueLwS99168iEM9HD9m5EM6rjwINjJAejl4qR6ioDgeB
	sRUfrYqS/PVEiP9QCk4V//PdKNCoxF9nLMWGA8iEDsqDIK4pMyUKKw07ipsrHsptEyz6
	FO9byaA68fqv7um3hODQzd3TBr2Ah/DqnmxbFlTCIiiQj4ESLqmvEiP3SDBh+w9sHk3S
	Hz9mUAYkDd4ASogMN+e9N/peG6XJ/24MPg0Wq1V/AhNvsm+B/2+AVW3rOTg1zL2rWDoD
	d2+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=mok7fYCIJss2PMiaYoVj4CFV7hwgFr0RgNnkoOfFZBg=;
	b=SRd7yqghUZURjUUnxUjeuNmGq82tiv3/jY+SeP9pg1V+Fkj1Nu9I4sn8NO4EyOU3to
	rlusrhlYdaf01Qp76UeSuSLGFsXwJbkJQ0zsOha5fGW4XAyfjUjxJH2baKAZtVSzFssA
	jpVyxI2hBe9iIl4AsWM6OnHnQg+iYRUsTMFY2mr6ZmDfYhT1xdDYTo9NqfL3ETvU/GsZ
	RGewOiT98OsLFsHwYvz4ETuMRWRF2yoyCAFU+WM4zzZjJhpMTTi78yimT5uH1UOJiE/w
	IYLYTEWj4IW07DjQN6Km6FxMbdMw6v4EkKjByzUjcU+tbiqrYnH5FJsF6t+eR88QeK45
	qJ2w==
X-Gm-Message-State: APjAAAVyEBsAMYGOZntaqjvlX5YfvHisVmbG46vuI5fY8tP87jWVL969
	jPp27EExNK0ZdIDdJaBdJzkvMfnub2Q=
X-Google-Smtp-Source: APXvYqzIo3u9bo+DtbLw9JCJlJmGEMz2AqkKOuLnz9CVqNchEhQ8oZ1/a1ZzW6sXtJl6+exmAUrquQ==
X-Received: by 2002:a2e:93c5:: with SMTP id p5mr8792994ljh.79.1565286425921;
	Thu, 08 Aug 2019 10:47:05 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	f1sm18852354ljf.53.2019.08.08.10.47.05
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 08 Aug 2019 10:47:05 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Aug 2019 19:47:02 +0200
Message-Id: <20190808174702.6261-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] python3-mako: update to 1.1.0
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
X-List-Received-Date: Thu, 08 Aug 2019 17:47:05 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../python/{python3-mako_1.0.14.bb => python3-mako_1.1.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-mako_1.0.14.bb => python3-mako_1.1.0.bb} (75%)

diff --git a/meta/recipes-devtools/python/python3-mako_1.0.14.bb b/meta/recipes-devtools/python/python3-mako_1.1.0.bb
similarity index 75%
rename from meta/recipes-devtools/python/python3-mako_1.0.14.bb
rename to meta/recipes-devtools/python/python3-mako_1.1.0.bb
index d2f5188cc4..b139e5ab00 100644
--- a/meta/recipes-devtools/python/python3-mako_1.0.14.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.1.0.bb
@@ -8,8 +8,8 @@ PYPI_PACKAGE = "Mako"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "e162578170331f0cc6a4adb063c7c0f6"
-SRC_URI[sha256sum] = "f5a642d8c5699269ab62a68b296ff990767eb120f51e2e8f3d6afb16bdb57f4b"
+SRC_URI[md5sum] = "6c3f2da0b74af529a4c4a537d0848bf2"
+SRC_URI[sha256sum] = "a36919599a9b7dc5d86a7a8988f23a9a3a3d083070023bab23d64f7f1d1e0a4b"
 
 RDEPENDS_${PN} = "${PYTHON_PN}-html \
                   ${PYTHON_PN}-netclient \
-- 
2.17.1


