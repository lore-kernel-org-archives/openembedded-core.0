Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 6219D6003C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Aug 2017 10:09:05 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id t201so3056684wmt.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Aug 2017 03:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=mzBN69/mku4QCKPAnaGwDq4BndQhlRVLEEVH/b6H5lw=;
	b=Y2Y7iW7eStPld38RyMUp08BqaoYjxoFkrHwSBRysKpx+xt/kA3k9BUf4fTAJt3oljV
	PhQq6An8FsN3sDMNb7s56SAMxq25JnAdFnskkI93tu3bgESGkd+SW2srjh9Sy/eBBr+3
	NpaWAwIJ20/hGergLSE0XU3ObFuRHkCeaGbBUyAoABoHVPatjpgc3daSPtOWiSznVSy/
	XWLYd9LI5PlrY2jNJPsARV5RMloIW2WJ28G9pUToy1X9/vBS3ZdohhF3gLMI+1rWKaiy
	ZInkjnPeX1UZVGCJaVIxG2ARA92b9VoerJQ37leZInpOHKLsJj1vCG6tYfdgmfoCfo61
	tVbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=mzBN69/mku4QCKPAnaGwDq4BndQhlRVLEEVH/b6H5lw=;
	b=fVWGvzKLZXUeSuxcD9Ypk6pbkJ4PJyxKoHVy76YBGpuZxnV3jrVPeqHe9TZafocJDA
	wCMlSvaZ0o+Fp/J8cnvIy/ob+hUsFtJqFwNFOpCpBzaQA6lVOK2MjXSBBz7YGL7tEkWq
	E7EW2KBIQ+SNtfwmWyklet3IRn0Z9CXoLY4CQgu7a7EfYfXspoEckAdD/qVbe4GC9/A8
	/ixWwdC9CIQ60FrKChq1/plecICeXBtZC8sl70H5vs2IGDuvnOrMwtn1VhDRlZHXSdYF
	Wwhl6cSJbxFxxp1gAfvbsjnLgoY+9BEn8BxfjMKivcIuqvRmtmPAlrRpwtG5UMkw6ojk
	PjNg==
X-Gm-Message-State: AHYfb5i3su21b2r0E2A3Tp7jGgBIjmB3dI6wE5nU+4YzTr2HTBpkJKfu
	eghr0MZ1lLYD4Iw/Xo4=
X-Received: by 10.28.142.74 with SMTP id q71mr2909721wmd.25.1502186946553;
	Tue, 08 Aug 2017 03:09:06 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	o82sm1257935wmg.34.2017.08.08.03.09.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Aug 2017 03:09:05 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Aug 2017 11:09:00 +0100
Message-Id: <20170808100901.21858-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/2] diffstat: use HTTP mirror for SRC_URI
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
X-List-Received-Date: Tue, 08 Aug 2017 10:09:06 -0000

The Invisible Mirror FTP service is currently down, and FTP is horrible, so
switch to the HTTP mirror.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/diffstat/diffstat_1.61.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/diffstat/diffstat_1.61.bb b/meta/recipes-devtools/diffstat/diffstat_1.61.bb
index 0ec41c3abfd..583b387e957 100644
--- a/meta/recipes-devtools/diffstat/diffstat_1.61.bb
+++ b/meta/recipes-devtools/diffstat/diffstat_1.61.bb
@@ -7,7 +7,7 @@ SECTION = "devel"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://install-sh;endline=42;md5=b3549726c1022bee09c174c72a0ca4a5"
 
-SRC_URI = "ftp://invisible-island.net/diffstat/diffstat-${PV}.tgz \
+SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
            file://run-ptest \
 "
 
-- 
2.11.0


