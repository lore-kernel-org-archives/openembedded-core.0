Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 986D779F89
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 17:09:01 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id g67so6500822wmd.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 09:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=VScN2MjNWrzW5iIBJb/pEjGk8zFsHvKr2+7GEm9SqZI=;
	b=fgNQeVWilxcvmbfXijTDvnsY6PmqnFO03OIN/ZZFvCgBRVOAZo4p4dZtU0AqaUPUf0
	CwRDkDCd6sc8/79b2uUbMlIstvVUlOL02s1CqK4I4b7h4sUU39lLCjwGN0grnIC4I9HG
	DeMI7lACkK3z9q7ibZy2bLqDhMVpe10kv+grdABafxTK+sMYOJffBpzmNGkTqNW5wW4e
	hL8bLXdoC92WipuiFGtQpfqUO/u3/0rwZKoGluieay8JnGjk+rWSbfnHl/7UU2YVFdGM
	DubdiarTIzEBo8X8p/IzCpy4hlgXkxG15gSmG9MJKO2Ny80YtNtRXcXHET2Kd3f2bP9+
	qkiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=VScN2MjNWrzW5iIBJb/pEjGk8zFsHvKr2+7GEm9SqZI=;
	b=AhT0D6pUi8qCX1R/iGndYCNNGyZSYkssTbbOR8ZcnWyEjO/bACFYU5InVcu3H/oPCm
	dEF/M7OJLH6nUgbeAKYxqTd0PeK+FdTrC0ENzV+BI3bdByO7lxpcZDqCFfPpq0PEFPCH
	BjiHop6ttu8cCh8XWyy/c26OZaNlfn0g9kB4JCBQfqWJBSVPIHk+RqudYr0iIQntTnln
	YBhzF7FK6NPASABy0h8jZPMxe0A6KOucJ7CHtHc6LDLL6NzX3qf6YnF6ZFOWiI4pfqY7
	p4l2uN7t6NLTcnmHjnNqZr93/XZX7/7C9F2Tnmn2p2+PB9iwc50IQu/mXEVK+v78i3mi
	ueLA==
X-Gm-Message-State: AA+aEWaZaKDlAzDsSVu7XXGtW0dMnnHYXGhjxSvFxz6LgQ1t5fBtXRzj
	JSxocsYZPle86WHHPM7giSq4R/f0tK8=
X-Google-Smtp-Source: AFSGD/VBgag6mxmC3dYUx5thLaqAXyk9wcttRTV156aAS3v8q/FEu1r1Wh5UowWEp+uQTX4XKv8Epw==
X-Received: by 2002:a1c:2856:: with SMTP id o83mr4209643wmo.45.1544807342036; 
	Fri, 14 Dec 2018 09:09:02 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	x76sm11108844wmd.27.2018.12.14.09.09.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Dec 2018 09:09:01 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Dec 2018 17:08:59 +0000
Message-Id: <20181214170859.1737-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] Revert "popt: update SRC_URI"
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
X-List-Received-Date: Fri, 14 Dec 2018 17:09:02 -0000

Go back to use rpm5.org, as it's the canonical host for popt.  The host is back up now.

This reverts commit 347ee336dcc94e6fa4e4788117013615b90abd70.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/popt/popt_1.16.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/popt/popt_1.16.bb b/meta/recipes-support/popt/popt_1.16.bb
index 377d1084495..478288f9bf2 100644
--- a/meta/recipes-support/popt/popt_1.16.bb
+++ b/meta/recipes-support/popt/popt_1.16.bb
@@ -8,7 +8,7 @@ PR = "r3"
 
 DEPENDS = "virtual/libiconv"
 
-SRC_URI = "https://fossies.org/linux/misc/popt-${PV}.tar.gz \
+SRC_URI = "http://rpm5.org/files/popt/popt-${PV}.tar.gz \
            file://pkgconfig_fix.patch \
            file://popt_fix_for_automake-1.12.patch \
            file://disable_tests.patch \
-- 
2.11.0


