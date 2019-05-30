Return-Path: <crg7475@mailbox.org>
Received: from mx1.mailbox.org (mx1.mailbox.org [80.241.60.212])
	by mail.openembedded.org (Postfix) with ESMTP id 63D2A7E42D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 16:42:12 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mx1.mailbox.org (Postfix) with ESMTPS id 220FD50326
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 18:42:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	references:in-reply-to:message-id:date:date:subject:subject:from
	:from:received; s=mail20150812; t=1559234526; bh=Kx+USg16t82tMzS
	yM+arZt82qN3CA/k5DWLmGrxeqrM=; b=C4H7LbyCQZgVttAWbI43+cqbfJ79RTH
	0RipUY6mAQf/ewjMBBJAJ+bIkuA9iOZgxc23mVBharjHKQhF+7EnqPJkLdABOjMH
	mb8hWXPS3+gZ0jzqr7XLs2P+okA/Wmk8I+AlIhcRWaU/mISisuRYk6zZcbSXfkMm
	wJM+1PY+PhqJshWlqJLxeNHgHSKxunFKvDN1Gh3jcL/jOP0xSCY4cLjP3W/mKYR+
	1tIVyYCPIJXtSubqikRu1jGW+f418dwopDWITNHZ9x65Y45jWqh1yUrYdtMOzjYe
	9C8iewz83tBxXbPu2zpQy/OsrN1udpDNdfZ/Im0CZwDYLCidQDPMF4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
	s=mail20150812; 
	t=1559234533; h=from:from:sender:reply-to:subject:subject:date:date:
	message-id:message-id:to:to:cc:mime-version:content-type:
	content-transfer-encoding:in-reply-to:in-reply-to: references:references;
	bh=3cYaqJOaZMzd2wfInCtHP5BaUkEX8wy7ceV1l2RB+uM=;
	b=EfaLzdEhcl9OpomJUk9Zm0c3s8LZDRmhlUcXH+zOhCdDcOl9DhFrFfkU47b5pSrFfNZpwT
	rmOWD7Uuetgz+kVg5QVDf1VRdxxmopqnu4+aXr26aUhYuYcgNeiIOjH1ve+KDs5kPqeM5t
	PDCrQzJiKQ/whBYV4qSmNRap++oiZrPFbfXb7l7kGaR3TEwmiqqW5SUtLFxiRtesOXNrKZ
	HgsfRbs6pE5vXuwE8uMoRE+7LTDES2To2VPR91W2pX9Pxu5V8J1kYlGrLKf8Vyo8sECcEQ
	/vqZhWtsSnicE52Es15bKh1iwKT6X5qHFczP/1/NoGewrV9GNML6D461YMJ4vg==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
	by hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172])
	(amavisd-new, port 10030) with ESMTP id ScaF674dxGkF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 18:42:06 +0200 (CEST)
From: Carlos Rafael Giani <crg7475@mailbox.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2019 18:41:49 +0200
Message-Id: <20190530164150.27038-10-crg7475@mailbox.org>
In-Reply-To: <20190530164150.27038-1-crg7475@mailbox.org>
References: <20190530164150.27038-1-crg7475@mailbox.org>
Subject: [PATCH v2 10/11] gstreamer1.0-python: upgrade to version 1.16.0
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
X-List-Received-Date: Thu, 30 May 2019 16:42:12 -0000

From: Philippe Normand <philn@igalia.com>

Signed-off-by: Philippe Normand <philn@igalia.com>
Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
---
 ...amer1.0-python_1.14.4.bb => gstreamer1.0-python_1.16.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.14.4.bb => gstreamer1.0-python_1.16.0.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.14.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.0.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.14.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.0.bb
index 048aaf4413..af9f3f213b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.14.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.0.bb
@@ -6,8 +6,8 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[md5sum] = "d4c0e3915f547feef49208ee08981e5a"
-SRC_URI[sha256sum] = "d0fdb24f93b6d889f309d2f526b8ea9577e0084ff0a62b4623ef1aed52e85a1b"
+SRC_URI[md5sum] = "877b2ed2aaffdb62e63f38ea9469b70f"
+SRC_URI[sha256sum] = "55dc7aaed1855565f9b9ef842d93e93bfc5cb2b376faef6af5b463e1774e2d38"
 
 DEPENDS = "gstreamer1.0 python3-pygobject"
 RDEPENDS_${PN} += "gstreamer1.0 python3-pygobject"
-- 
2.17.1


