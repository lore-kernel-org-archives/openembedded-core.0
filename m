Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 1406F719B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 16:48:18 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id a197so31333609wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 09:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=t7MdqQMNcqVELnQdhNzVBsEg+ojTVLfFysUsMONWkOg=;
	b=CJHCumudqAEUbPuwFXztRr3mtHqAdwMvxHVkMHbHV+bb7P77y5CUwA8DXg+PMUo6I8
	d2tLL5PveIaKRD9Fd8aUozxqin4sMU9MFHlFZRsPtpAhUExABXUKh189DC4dywB1kZ0X
	KE7F68N0XeyQXFFRkYBDUKeVxd7e7RpwDabZuw/T4sQ4zMVxGvX6VJNYL+YZrRZw2LjQ
	70W8p03PT/tanw6qbtIyQ0+RTg7d55ijTRDcGjJo5zqQvutJu2QgkUUK70leD1CK5d8l
	yVgxczG9RyaQEMzI3TgYgAdgB5wpcwAOqT+F6o80/+A4Ra7s+WAki/WVNA8vyUdjI2Cp
	voTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=t7MdqQMNcqVELnQdhNzVBsEg+ojTVLfFysUsMONWkOg=;
	b=cO+dhgyqECcR18ZkKhaEqa2vkoUTQ7h1Gkj79nvcc7zeVw3JTcwriKTXXv+8iVaRYJ
	rZvcf9aOcHiahzfkH9PKAPkIhD2BJehS6ugml7c62LjiUAXLpRGCBLAgLdzlV6z/bNma
	aJWHTFrh1Ap8wSJeTkER2fzszs5OLQhopjHUFEupGEhcEvU5U51IqNDSiSGV3j3Xo5ht
	uWBObLBn6nHTKrs04A1s8h+piOV1Nw+u1Crhfj1DJ+KUDauJFfIggM9+caINDwMbNgVN
	E/iz6nRxErTQldXEeRAFzmNkyNYDQkhnPOqK1TZ1LCw/qKZ+/NTp/YKuRz+dzXosUOgf
	v5tw==
X-Gm-Message-State: ABUngvdSKcxqMNdcQuK3n0cVXch/LQzePDdGzUX4WTNz55vshSQuV9d/549Bp2bvZDxmh1ad
X-Received: by 10.194.116.104 with SMTP id jv8mr14092632wjb.12.1477932499091; 
	Mon, 31 Oct 2016 09:48:19 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	18sm25667499wmp.24.2016.10.31.09.48.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 31 Oct 2016 09:48:18 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Oct 2016 16:48:14 +0000
Message-Id: <1477932495-21204-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH 1/2] slang: add PREMIRRORS to handle upstream moving tarballs
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
X-List-Received-Date: Mon, 31 Oct 2016 16:48:19 -0000

The slang maintainer only puts the current release at
jedsoft.org/releases/slang/slang-1.2.3.tar.bz2, all previous releases are moved
into /releases/slang/old/.

As this breaks the fetch the moment a new version is released, use PREMIRRORS to
also look in the /old/ directory.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/slang/slang_2.3.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/slang/slang_2.3.0.bb b/meta/recipes-extended/slang/slang_2.3.0.bb
index 17efbbe..ce7b16a 100644
--- a/meta/recipes-extended/slang/slang_2.3.0.bb
+++ b/meta/recipes-extended/slang/slang_2.3.0.bb
@@ -22,6 +22,7 @@ SRC_URI = "http://www.jedsoft.org/releases/${BPN}/${BP}.tar.bz2 \
            file://0001-Fix-error-conflicting-types-for-posix_close.patch \
           "
 UPSTREAM_CHECK_URI = "http://www.jedsoft.org/releases/slang/"
+PREMIRRORS_append = "\n http://www.jedsoft.org/releases/slang/.* http://www.jedsoft.org/releases/slang/old/ \n"
 
 inherit autotools-brokensep
 
-- 
2.8.1


