Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id D272D6003C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Aug 2017 10:09:06 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id k20so5288879wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Aug 2017 03:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=k6lUd0qKhd7eFt0J3aY122mCUjN7Jj8926vNLSfTjLc=;
	b=KKkBpuJQ0X21iBoLU2slvSPbS4+2FodTWeqXXBvUniLNUE4+Rg+DllwwL0XWJWaFW3
	wewHnLgBIBs4S+twEBoVX34ggV9HOA7FdIuSKXsKmWyfZjpBQkJMHEavbSJg7KSFIJx9
	ERTbzpke+TSEmglPv/BAZUv71uRWgBWlvbRGHkUmPIIit0TNAUSYStMWZlIaOVyfFi6F
	eVtCdmSPjQBBqDY4Qke3wvzela5QOHs21T8B5TMqk9A/E0/+Lx5N+r37wWSBajk89jgX
	dZcHMSn67AQAuaThBWfYEA9NZZNmwWvn0fmdod2Es7/p65OzVjK5p8yC+hj83ru/2XBq
	f76Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=k6lUd0qKhd7eFt0J3aY122mCUjN7Jj8926vNLSfTjLc=;
	b=r98mkomkrufdKhlQQ9gdye5NqY2zgWq12fHG48GPdg8fwS/PKUCWmQ7EQQijThS/C4
	YtJQAPvaFy7+NVM2oEWXn8HEPKqkd9D/KMgqQxQ8dz6V1aWmqTh2CwVKCihEkNSheNHJ
	mNiRhyDwaAx3bfLIEdGwAMxamc3ypv3M4N9WAVEVkG9GsoXtfvteNbl+zkPnUfZz+seO
	Ui0l5NnDbW4YYuOTb6FcV+nP6WmXBYOQwOIvosu4cFGLQ/cmuZOYxY/KTV+24JSoBtVE
	My0lQMOk7wV9jyWqlBp24gq1DM9MD+xP3ifksh79GYhXckfCsJ4+//VSTOlY11H1IFL2
	KNHQ==
X-Gm-Message-State: AHYfb5idKU+haMnNzgU+uk6NWTvgRkg0g6Zmn9x254I26fFpF0M42Xmx
	2Yzmi7S78frbGBzvA00=
X-Received: by 10.28.38.133 with SMTP id m127mr2252322wmm.6.1502186947587;
	Tue, 08 Aug 2017 03:09:07 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	o82sm1257935wmg.34.2017.08.08.03.09.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Aug 2017 03:09:06 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Aug 2017 11:09:01 +0100
Message-Id: <20170808100901.21858-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170808100901.21858-1-ross.burton@intel.com>
References: <20170808100901.21858-1-ross.burton@intel.com>
Subject: [PATCH 2/2] diffstat: exclude aclocal
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
X-List-Received-Date: Tue, 08 Aug 2017 10:09:07 -0000

Instead of moving aclocal.m4 to acinclude.m4 in a custom do_configure, simply
tell autoreconf not to run aclocal.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/diffstat/diffstat_1.61.bb | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/diffstat/diffstat_1.61.bb b/meta/recipes-devtools/diffstat/diffstat_1.61.bb
index 583b387e957..f8b7b06cf24 100644
--- a/meta/recipes-devtools/diffstat/diffstat_1.61.bb
+++ b/meta/recipes-devtools/diffstat/diffstat_1.61.bb
@@ -18,14 +18,9 @@ S = "${WORKDIR}/diffstat-${PV}"
 
 inherit autotools gettext ptest
 
-LDFLAGS += "${TOOLCHAIN_OPTIONS}"
+EXTRA_AUTORECONF += "--exclude=aclocal"
 
-do_configure () {
-	if [ ! -e ${S}/acinclude.m4 ]; then
-		mv ${S}/aclocal.m4 ${S}/acinclude.m4
-	fi
-	autotools_do_configure
-}
+LDFLAGS += "${TOOLCHAIN_OPTIONS}"
 
 do_install_ptest() {
 	cp -r ${S}/testing ${D}${PTEST_PATH}
-- 
2.11.0


