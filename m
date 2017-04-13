Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f171.google.com (mail-wr0-f171.google.com
	[209.85.128.171])
	by mail.openembedded.org (Postfix) with ESMTP id 2392277E3E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 22:36:53 +0000 (UTC)
Received: by mail-wr0-f171.google.com with SMTP id o21so43310392wrb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 15:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=JiqYwcKyk3cEDX2hcImj6JPylzI/gbx9D3Snu7TVdV8=;
	b=nLb9TeD8Vt/8AD+aOA+UNCALZpVw87CnF4S7Q1T5QGXaa37LzqCrs7aoMSyDTKrfls
	bFfC/XsNxHusWwzIIdFI/9r7EzDvrONSy92vX/tHPXYUCT4lwwhEmk8/8pHK7ph3b5Iq
	MdOdYMgdKlNFM16lFdH48QyReatjLCZx6jINTHpIGkMkME0HVkOsOAuffMI9mmgPR/OW
	KBrlnduZUH/O18s3UF9MQnCR8t498K2R/741QiQOC6NyXvOChGAec6s3dXjq842CDCts
	Ks56dt1eBv345Tp9DzmhYvs5lJXYJrTJYU/ml/lDGA8fMmHfcGRqnxZfsrhBHvePEMXl
	XESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=JiqYwcKyk3cEDX2hcImj6JPylzI/gbx9D3Snu7TVdV8=;
	b=mFB8yVYyT21K5dXF8zZdsQBq9F2TNZGPhVUJujKyhtnavRIUTzF+kW8elrI5ocjJyG
	gYAXAq+Ecl9pqpBun6OIN4+S26myn5Ltsf1QELssUTNZi9jbuUAWKFIDkf/yKfl0pkId
	v729rPoGmly1WmC8fezfFfZJVCbji+TvYYvlMrykaN0R7HKuJC6cb/k03mRDheWlkJyt
	+h8Iwe4d/dv54xFD9Kk7fIw6sMmdybqfx48Ad2dhs6Hiufg8ELlwEiQ/upR19GauK5tT
	hiF0YJxba7l6vPrBDw7vg0Q1vDw3Ro+igov17cZeDbIAgL7bN4Bz7/7m29gXwQU21ChV
	/hWw==
X-Gm-Message-State: AN3rC/6ECudcyvWQ+3io9h2L2nynUvXtIz4iIFxnWso0zuQF0sprNLlB
	E6Zse89YycvjFPPAOkI=
X-Received: by 10.223.146.98 with SMTP id 89mr4662912wrj.71.1492123014387;
	Thu, 13 Apr 2017 15:36:54 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id k13sm457770wmi.28.2017.04.13.15.36.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Apr 2017 15:36:53 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Apr 2017 23:36:52 +0100
Message-Id: <1492123012-31330-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] unzip: add missing CVE headers to patches
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
X-List-Received-Date: Thu, 13 Apr 2017 22:36:55 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../unzip/unzip/18-cve-2014-9913-unzip-buffer-overflow.patch            | 2 +-
 .../unzip/unzip/19-cve-2016-9844-zipinfo-buffer-overflow.patch          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/unzip/unzip/18-cve-2014-9913-unzip-buffer-overflow.patch b/meta/recipes-extended/unzip/unzip/18-cve-2014-9913-unzip-buffer-overflow.patch
index eb76e2e..3c02d59 100644
--- a/meta/recipes-extended/unzip/unzip/18-cve-2014-9913-unzip-buffer-overflow.patch
+++ b/meta/recipes-extended/unzip/unzip/18-cve-2014-9913-unzip-buffer-overflow.patch
@@ -6,7 +6,7 @@ Bug-Ubuntu: https://launchpad.net/bugs/387350
 X-Debian-version: 6.0-21
 
 Upstream-Status: Backport
-
+CVE: CVE-2014-9913
 Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
 
 --- a/list.c
diff --git a/meta/recipes-extended/unzip/unzip/19-cve-2016-9844-zipinfo-buffer-overflow.patch b/meta/recipes-extended/unzip/unzip/19-cve-2016-9844-zipinfo-buffer-overflow.patch
index fd0c024..ffadbc2 100644
--- a/meta/recipes-extended/unzip/unzip/19-cve-2016-9844-zipinfo-buffer-overflow.patch
+++ b/meta/recipes-extended/unzip/unzip/19-cve-2016-9844-zipinfo-buffer-overflow.patch
@@ -5,7 +5,7 @@ Bug-Ubuntu: https://launchpad.net/bugs/1643750
 X-Debian-version: 6.0-21
 
 Upstream-Status: Backport
-
+CVE: CVE-2016-9844
 Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
 
 --- a/zipinfo.c
-- 
2.8.1


