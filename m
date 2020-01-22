Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id 92D167FE09
	for <openembedded-core@openembedded.org>;
	Wed, 22 Jan 2020 05:48:18 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id d9so2451229plo.11
	for <openembedded-core@openembedded.org>;
	Tue, 21 Jan 2020 21:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=HzmXzOYpvRaxKF6+kJ5VzugOWhbO+hnts6ND7o4LI40=;
	b=U8jDmdyMnJszhrIEDhFgRobBjzRsA/NeAPf/4mEuQLICuCgrp1gUQ9r0hGSHV0KQwC
	Jz8u0L42G+82DiVA8HOvAmAK7WVFkniZBTlRH6U3gfeUGgw9dZT142UuQ3jmgYuzMlS1
	x4YoY+9lYUDnVzolD8jqGDlviAtVqKYnM03RRKXWBd9NrLpOq/VtNzYzbujXhBevLJdi
	nGOCFBib2ZJA3hdGKWSkXnzTeVkxVu8b8RQsA7X3iju0doR+TpheXkUcKh9GJ1fmb845
	y7rOjzT847i0bKHpWgLYD0TgKqJMU21Kncxo6wYjswhUEsc2aCxJ3Ma7Pu7M5RTIDS3Q
	ThAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=HzmXzOYpvRaxKF6+kJ5VzugOWhbO+hnts6ND7o4LI40=;
	b=WuFMKPhvtg1/8dBk+Q4YEUl/AzY0sSwdJp2VbDejMsulUKM4O5fN7NOCabTYzBsY3N
	uoU56yC+lZhjbn2f1y5oFj3TTONflTQO7Ui/+uU5WcKPcNWeNLkZ7pMGrvHYDgt9709/
	XId/Erp181qCOSUtGnMh0sXYtlmaMpepKRJ3gLECcTFBkc5g21QE5y22x4YoBbJjTjbN
	Y50xFiBorAsE/4YIpOpDNCr/xH+f+FdPVT0Xs53V/fV53OKukzcTwTtGaUGQtbicIrBr
	bRw5YF7VyoVo4i2bPL+TkOsKWX7VKhLXiw8EKqsDR1yjfMEYp+9M+le+lauT61Ds2Jen
	xkdQ==
X-Gm-Message-State: APjAAAUxw0G4tPst6yOQiY5Zwlx9hqe8GL797m/TbZG1ss9w5dNdRzya
	Tj+8aSzVI9rUFP0Ibwr+0GBekCaq
X-Google-Smtp-Source: APXvYqxUgvbwc0jKs8Z35VVhKbZjm9roUPs1b+8U9A6VCpX7hpDkaTJqZYlsJI07FG47JvnpIuN7nw==
X-Received: by 2002:a17:902:8682:: with SMTP id
	g2mr8876381plo.273.1579672099432; 
	Tue, 21 Jan 2020 21:48:19 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:682c:76b9:6d8a:bbd2])
	by smtp.gmail.com with ESMTPSA id p18sm1413247pjo.3.2020.01.21.21.48.18
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 21 Jan 2020 21:48:19 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Tue, 21 Jan 2020 21:48:05 -0800
Message-Id: <cover.1579672034.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [zeus 00/11] pull request
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
X-List-Received-Date: Wed, 22 Jan 2020 05:48:18 -0000

Please concider these changes for zeus

The following changes since commit f9739e0f58f5d8a5dc01fdb0efaa778af4edd671:

  kernel: Make symbol link to vmlinux.64 in boot directory (2020-01-08 20:33:12 -0800)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/zeus-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/zeus-next

Alex Kiernan (1):
  linuxloader: Correct loader for glibc on armhf

Kalle Lampila (1):
  wic/filemap: If FIGETBSZ iotctl fail, failback to os.stat

Mike Crowe (1):
  multilib.conf: Ensure that RECIPE_SYSROOT is unchanged for native

Peter Kjellerstedt (5):
  toaster.bbclass: Correct pkgdatadir path in toaster_package_dumpdata()
  populate_sdk_ext.bbclass: No longer needed to clean away
    conf/sanity_info
  sanity.bbclass: Move sanity_info from conf to cache
  licenses.conf: Remove the SRC_DISTRIBUTE_LICENSES variable
  license.bbclass: Introduce AVAILABLE_LICENSES that lists all licenses

Richard Purdie (3):
  sstatesig: Test cross/native hashserv method extension
  scripts/oe-build-perf-report: Avoid buildstats warning
  sstatesig: Improve debug output if getpwuid() fails

 meta/classes/license.bbclass                  | 27 ++++++++++--
 meta/classes/linuxloader.bbclass              |  2 +-
 meta/classes/populate_sdk_ext.bbclass         |  2 +-
 meta/classes/sanity.bbclass                   |  2 +-
 meta/classes/toaster.bbclass                  | 15 +++++--
 meta/conf/documentation.conf                  |  1 +
 meta/conf/licenses.conf                       | 43 -------------------
 meta/conf/multilib.conf                       |  1 +
 meta/lib/oe/sstatesig.py                      | 17 +++++++-
 meta/lib/oeqa/buildperf/base.py               |  2 +-
 .../oeqa/selftest/cases/incompatible_lic.py   |  6 +--
 meta/lib/oeqa/selftest/cases/sstatetests.py   | 40 +++++++++++++++++
 scripts/lib/wic/filemap.py                    |  6 ++-
 scripts/oe-build-perf-report                  | 20 ++++++---
 14 files changed, 116 insertions(+), 68 deletions(-)

-- 
2.17.1


