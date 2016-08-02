Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 7F3C065CC2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Aug 2016 20:02:43 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id i5so306009678wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Aug 2016 13:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=6beGiMSdfG4K07BvKh1ejEsJpx8rxMrYTmwh6h7PWnA=;
	b=ZSm51rD+yuLxfEu6IOIs0T5SnqIf7MjZn9WePv+qOS69Vdz9++RlBz+8DhtmtryYxo
	9uG5rn10yhk+sRk3s94TmpPpYEKv+eWkqwJxLnCt8GNdTg+lFM5yIREvZkx/G/JtOpud
	2YyB4vFrvpnSxZ8IMAOP5XUZj9ug/jc0JXuYoC4X2Y0/m9bTIjNr6GvCZPmDcX58qIe0
	8QzDt0Yk+vipCiDLMK7uv/Mbrq2YjIh+u4rzBNxZRT/mne7gzB4433y+gCNuYR9ojKJM
	aUabKdJgoQziiZ5hKka3CAyjYvVgutfPejUqg3Xp9s6rT1qkOonXT0z6j5HtAIHWbcIa
	FlbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=6beGiMSdfG4K07BvKh1ejEsJpx8rxMrYTmwh6h7PWnA=;
	b=YY6jdHYHA7eMbC/3kHhdipOdlJcSV2JYKqdMTVsGWw2qiWE6jXbdtWizgmTdMIdd1Q
	78T/3Z8da/UkZKvDDFPZmZmIlLaxreVi4ZTHhLsKY7Mj+lJx0frDXP5kj0iYKxM4ba5c
	Lg58DWY9wGHfKltxr3MP7xZUo9SnMmkIF7NXXGwKumstpp7SdrFhpARxBZBvzU/B+Pyh
	ebzHKkN4U+o1v5ivHqFuc2xcu4/VP743A7ElxddcYixDV689J92TG9KQYurrnz5F1ER3
	ouJr9mRmWhbpdUhTGFRjsUF7YdChOpD8lcRGxzBZh18IUKN01HgeGyxLj9riPih5rwUt
	NV0w==
X-Gm-Message-State: AEkoouskO4pFHSjIPlXZXaFN72mtyIg+YfHo9jTGXZeMQEkXWBzqAXFF7/17zRqfOszyiKHh
X-Received: by 10.28.113.151 with SMTP id d23mr21701729wmi.89.1470168163001;
	Tue, 02 Aug 2016 13:02:43 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	q187sm23559344wma.17.2016.08.02.13.02.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 02 Aug 2016 13:02:42 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Aug 2016 21:02:39 +0100
Message-Id: <1470168159-1748-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] pointercal-xinput: set ALLOW_EMPTY
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
X-List-Received-Date: Tue, 02 Aug 2016 20:02:43 -0000

Many BSPs don't have pointer calibration, so set ALLOW_EMPTY so the package
still exists (for dependencies) even if there isn't a calibration file to
package.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
index 65348c3..71756c3 100644
--- a/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
+++ b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
@@ -17,4 +17,5 @@ do_install() {
 }
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
+ALLOW_EMPTY_${PN} = "1"
 CONFFILES_${PN} = "${sysconfdir}/pointercal.xinput"
-- 
2.8.1


