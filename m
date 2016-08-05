Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id B4979770EF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2016 15:17:14 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id i5so41763587wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Aug 2016 08:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=77HKtcJ8otZyPu0PB2tB4254KChcfwTZcEwmI85fAmM=;
	b=Ne0wpJnUqZNr7LqZMulTD2856ON4IEVudo+ryXOV+I7e7zIUK7dr8jstAYsCHivUi0
	g+aJ8GkcLJZEmmc9wijLz9fTRG0XoP9Z97juf7QI2VAX3vVZIhp8W8heFa0Xf0axHUEV
	Z0VBpXPMxPMV6un9ANtihQMy0+BZWrHt5HfZd7bbX+bqz5EpRz+GHSqcAAx6+QaNQ0hJ
	f5NnAW7K8wm/seTzSL55tljQVjcJYuYF65t6vrZQimYDv+mgWEaNt4nBNcDuixl1iATG
	a0VLBs86sH37qq03jh7MmA1E/rjz0uMHSCic0GrG5F32OUWZGCOe7nni2CEsS76aw7kY
	3hsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=77HKtcJ8otZyPu0PB2tB4254KChcfwTZcEwmI85fAmM=;
	b=kOoD6c7vFjoR0Pp7+pkhHFTt0njRnJnF850Jna06fAo79NqzO2pfpYhGzhMCw6uEP+
	EY6gDd7vWXNheDS9izrcyPp46ZNrU3u6nqYgfrK/z5ocI4r9mqUpYqFmAzifCSYWJyBJ
	EGGY0Yb5rITwxg9fT4iz0fLyMNXOFc8ZTlzHjSKuZ4EXijMisznChbx+tuE1IYz0KA9y
	ZkVJR0AYsQiOVbOsmL+EHT6Z44rsFN0X5bj+yQD4HPmKFRkYsAteUavi9s2GCua3PVgK
	DxAACfdcF+IcE+hG9sAkddcYs3gJw5S5a/QR0ubmFHZSGfK7dYRFGnYk1IkM5X3CT0cZ
	dN7Q==
X-Gm-Message-State: AEkoouux/HvR9jiOL59IHW06fjRHip4dmfc7iuDkWZjX3waJ7n8bzKamK+wlITNCfcmC++4S
X-Received: by 10.28.26.5 with SMTP id a5mr4259302wma.27.1470410234373;
	Fri, 05 Aug 2016 08:17:14 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	qe2sm18285249wjc.28.2016.08.05.08.17.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 05 Aug 2016 08:17:13 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Aug 2016 16:17:07 +0100
Message-Id: <1470410231-21681-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH 1/5] yocto-uninative: bump to uninative tarball version 1.2
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
X-List-Received-Date: Fri, 05 Aug 2016 15:17:17 -0000

This new uninative version includes fixes to use the host locales.

[ YOCTO #9994 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 8b4e947..48ad283 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -6,6 +6,6 @@
 # to the distro running on the build machine.
 #
 
-UNINATIVE_URL = "http://downloads.yoctoproject.org/releases/uninative/1.1/"
-UNINATIVE_CHECKSUM[i686] ?= "1973aa8d07ba4fdae197ea3ffba1274c57ff7923679c364ec8e2b66c73483234"
-UNINATIVE_CHECKSUM[x86_64] ?= "84e89ed675156d13a27fe56e8433f5fa9662802349bb0bbe9e6eba577fc140d3"
+UNINATIVE_URL = "http://downloads.yoctoproject.org/releases/uninative/1.2/"
+UNINATIVE_CHECKSUM[i686] ?= "8b2f16d16cb037dd9905431875f5c355367dded84b18c3b98ca0e639b96fb8d1"
+UNINATIVE_CHECKSUM[x86_64] ?= "2919dd81e4cafcc0fe73736363c6232dc8bfc016a8c765481d98ae4de8193d24"
-- 
2.8.1


