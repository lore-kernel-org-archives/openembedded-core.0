Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2E3187D0FF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2019 12:02:53 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id y13so14045437wrd.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2019 05:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=PNr+cUjo0oYNkPozriIcUKMJ7HezXSwB5BtGevEK/BM=;
	b=ev7dTyk0skzfEj8b7epWq0eY5cYG9Mgf+4hLdq5wVwbbY0lNpGTdcSJWbyEwrM+PXg
	h2059YvNyZrqsdOXs6ooM48lgVsM2K9CLrNNOgsuG/ih30CN9EFtptKloZWTHKU+UR1S
	L8M81BKExj1E9QuKw5O/7YAxsh+frWH9uSJUae05ap3Z9xwzVvUilxQnhrY6aYHEjREN
	wS1v8s/Vr3IRZJoAjfbLGlQpAeTRQhtncYTFmxCYeyyIHM7T1NR2HIeycDUGAFHgGXbb
	4BMYcAYkU9mfHlLAo2+Z7lihTxijC4bwJL7nihwHQyCM/8Zm7aepKS0jdJ4dTdRc5rYr
	q3EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=PNr+cUjo0oYNkPozriIcUKMJ7HezXSwB5BtGevEK/BM=;
	b=shAC1evFc9EINQRToUREE8FsvDUuaI8BvCVMOIQZjKWDCkVenSf8U/ZS6dusL66DPd
	fmbPpc5KkKIjwP1OBtQ7n25iKPxTn+HHknB4PdHT1LXF/ZYQfjlrx2qBIbqSiNcqzjWG
	pHe9IvnjtZAtpl1DNMx3SGKGfcVNjqWoWl5+2y+wfCmQI7Ns6fHub62Q3HHrJs2whIaN
	YnG8qaFSyTaU906mKOPE6tXsESRWpIXmyPmMQ4NbWrUrw3NwXLUqvgnsMWlJF5TWOuIs
	gFNk8UdQN2C9yemECE4n0Uf4pdt5rgPFDoQwVAWipVA10JCQfRcwd2DSBe+puKoinjGZ
	9mJw==
X-Gm-Message-State: APjAAAUlYszM2qX+gnlbykGzVK1nbUWXkIIcN6KAW5c3OxwMyhaidC7a
	d1S6U4MzqXU5X75aMvaGxVGkO5BqZWM=
X-Google-Smtp-Source: APXvYqy2AB5yxMyn0AxPKzcW+lT7oIuWxmLwdJFW5yzbkDsGKvJxXjjkQyxkVfvfF+5r3R5ghCaevQ==
X-Received: by 2002:adf:f48d:: with SMTP id l13mr20718319wro.2.1553601773714; 
	Tue, 26 Mar 2019 05:02:53 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	u2sm33314163wmc.45.2019.03.26.05.02.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Mar 2019 05:02:52 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Mar 2019 12:02:50 +0000
Message-Id: <20190326120250.4580-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] sysvinit: consolidate patches
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
X-List-Received-Date: Tue, 26 Mar 2019 12:02:53 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../0001-include-sys-sysmacros.h-for-major-minor-defines-in-g.patch       | 0
 meta/recipes-core/sysvinit/{sysvinit-2.88dsf => sysvinit}/crypt-lib.patch | 0
 meta/recipes-core/sysvinit/{sysvinit-2.88dsf => sysvinit}/install.patch   | 0
 .../sysvinit/{sysvinit-2.88dsf => sysvinit}/pidof-add-m-option.patch      | 0
 4 files changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-core/sysvinit/{sysvinit-2.88dsf => sysvinit}/0001-include-sys-sysmacros.h-for-major-minor-defines-in-g.patch (100%)
 rename meta/recipes-core/sysvinit/{sysvinit-2.88dsf => sysvinit}/crypt-lib.patch (100%)
 rename meta/recipes-core/sysvinit/{sysvinit-2.88dsf => sysvinit}/install.patch (100%)
 rename meta/recipes-core/sysvinit/{sysvinit-2.88dsf => sysvinit}/pidof-add-m-option.patch (100%)

diff --git a/meta/recipes-core/sysvinit/sysvinit-2.88dsf/0001-include-sys-sysmacros.h-for-major-minor-defines-in-g.patch b/meta/recipes-core/sysvinit/sysvinit/0001-include-sys-sysmacros.h-for-major-minor-defines-in-g.patch
similarity index 100%
rename from meta/recipes-core/sysvinit/sysvinit-2.88dsf/0001-include-sys-sysmacros.h-for-major-minor-defines-in-g.patch
rename to meta/recipes-core/sysvinit/sysvinit/0001-include-sys-sysmacros.h-for-major-minor-defines-in-g.patch
diff --git a/meta/recipes-core/sysvinit/sysvinit-2.88dsf/crypt-lib.patch b/meta/recipes-core/sysvinit/sysvinit/crypt-lib.patch
similarity index 100%
rename from meta/recipes-core/sysvinit/sysvinit-2.88dsf/crypt-lib.patch
rename to meta/recipes-core/sysvinit/sysvinit/crypt-lib.patch
diff --git a/meta/recipes-core/sysvinit/sysvinit-2.88dsf/install.patch b/meta/recipes-core/sysvinit/sysvinit/install.patch
similarity index 100%
rename from meta/recipes-core/sysvinit/sysvinit-2.88dsf/install.patch
rename to meta/recipes-core/sysvinit/sysvinit/install.patch
diff --git a/meta/recipes-core/sysvinit/sysvinit-2.88dsf/pidof-add-m-option.patch b/meta/recipes-core/sysvinit/sysvinit/pidof-add-m-option.patch
similarity index 100%
rename from meta/recipes-core/sysvinit/sysvinit-2.88dsf/pidof-add-m-option.patch
rename to meta/recipes-core/sysvinit/sysvinit/pidof-add-m-option.patch
-- 
2.11.0


