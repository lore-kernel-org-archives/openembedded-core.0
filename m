Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5C95578489
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Nov 2017 13:19:46 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id l141so12992494wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Nov 2017 05:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Kb8UtvRO3DCrxkyTQM9LUK/C7/bFC0GkWJZwV932ebs=;
	b=b/MKrMpsUBVwXelfdosADhcJi6Ruuuh+sGcJ4oRO8zUI6IUfxJMcOlB5j7C1MaR+YE
	4LYrGjkviq1DA6IHTyazYUkUFstWA2vfHyIfJ99YlIw0uhiP8fNRg++V7En0lKdIClYl
	ilwtedSdeWY9iAGsZ0fU7cvjgpp8jfCxHj+zYiad7sM551XH4zpzD0JtqToipbWoVFe7
	sIGWIZk54cSEQQiLJ4RHcH9pPiMZF9Wj7KQKw9JFUTiRs8W7ia9QNCUEXG1HwcVT3iPr
	SmMF3DFOExYrICc67+lDRk85i2z7lMbZ6NkonFfCQEN4EoCOw9oLVhrXAzsl+oGy8m5q
	dwuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Kb8UtvRO3DCrxkyTQM9LUK/C7/bFC0GkWJZwV932ebs=;
	b=SmAg006FMUx29wrH6PlZ63hEQy9BzI1DWr00acfnmVi+2DF/pZ2xkm7551S5u2dqO+
	IROhWZYBAjegFtNl3lGcXN3gf1713W3cxKbwW8y88F6gPfeI9i7XB53Bw8EklPR0Skqv
	/OAzMkPnU+rGEmFwGo2hy0EN7upRLlmap8zWSChXZzA6ZW/G+//xN+ab4wMHmcaGPdty
	eYxY6HOw8kyX/+/qerJeGmTPh3wpWLQUGKWq3REtFD3SRx08ZAcjFyj42LC1v3n0EsA9
	rTBpZ5m1oDKALMianNMuXKCe+Gkgm/Qqmty8vbCphE/UORC/vHtbMVrvDt+fSlNjzZJG
	FFgA==
X-Gm-Message-State: AJaThX7oVgrXRQPwJJAe6GT+ZyURO/weHxLd4ZToZfdLs87eP2ploHIh
	VnkWgsjZyxbRwBi6mOgbagNcOPLK
X-Google-Smtp-Source: AGs4zMb13EeU9w0KimPbmhihQQqfpngYp4TruypICGKgraodcXsSUJIsMGoVyXBN/S/6eDS830QYhg==
X-Received: by 10.28.135.204 with SMTP id j195mr1917560wmd.119.1512047987018; 
	Thu, 30 Nov 2017 05:19:47 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	q15sm3602780wra.91.2017.11.30.05.19.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Nov 2017 05:19:46 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Nov 2017 13:19:35 +0000
Message-Id: <20171130131935.20771-4-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20171130131935.20771-1-ross.burton@intel.com>
References: <20171130131935.20771-1-ross.burton@intel.com>
Subject: [PATCH 4/4] gperf: don't use aclocal.m4/acinclude.m4 dance
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
X-List-Received-Date: Thu, 30 Nov 2017 13:19:47 -0000

gperf doesn't use aclocal so don't call aclocal.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/gperf/gperf_3.1.bb | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-extended/gperf/gperf_3.1.bb b/meta/recipes-extended/gperf/gperf_3.1.bb
index c680ee183cb..f61b2a329af 100644
--- a/meta/recipes-extended/gperf/gperf_3.1.bb
+++ b/meta/recipes-extended/gperf/gperf_3.1.bb
@@ -11,14 +11,8 @@ SRC_URI[sha256sum] = "588546b945bba4b70b6a3a616e80b4ab466e3f33024a352fc2198112cd
 
 inherit autotools
 
-# autoreconf couldn't find acinclude.m4 when stepping into subdirectory. Instead of
-# duplicating acinclude.m4 in every subdirectory, use absolute include path to aclocal
-EXTRA_AUTORECONF += " -I ${S}"
-
-do_configure_prepend() {
-        if [ ! -e ${S}/acinclude.m4 ]; then
-                cat ${S}/aclocal.m4 > ${S}/acinclude.m4
-        fi
-}
+# The nested configures don't find the parent aclocal.m4 out of the box, so tell
+# it where to look explicitly (mirroring the behaviour of upstream's Makefile.devel).
+EXTRA_AUTORECONF += " -I ${S} --exclude=aclocal"
 
 BBCLASSEXTEND = "native"
-- 
2.11.0


