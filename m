Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 85EA673189
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 12:13:38 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id a66so98620592wme.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 05:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=GtizlP009wFNZ44hdTdJBRbDxGibdjK1b68aRTcWTPk=;
	b=aGdybRnoeCVmTEw5/PyZmTD9g8LPZSjyXsTyWdD6z4zywlLHSSbaUzZpe5tObNYEOH
	OlSv24KJSQt61cf8+yWsIOz1qH8gNuXTpadTaaZEYV5i28/ZaqC6mJBmaVO5UPjJGOHI
	f1KZj1wjWYIfCG4aPd6+mCd4vH84o1ouXfj9yts8uMhi3zVHPPXGljcTh3bADWB4u0MN
	wHHJIvXz17VG1EIQ/E1FY3QSFXPIM6g5Hz7vaNfVF7g0vG2cfIl9w9wA1QVaSyFJoZGS
	s86qx7lkfc1fdmAKiUMDVvn/gph9k4R4Gm3j1unWE4PSrzlXQnxuHnyw0mju35zPfy9q
	ifCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=GtizlP009wFNZ44hdTdJBRbDxGibdjK1b68aRTcWTPk=;
	b=JXAAPKpot9pFIbkEQuSou/X0QEwz4tzlXQLSakhKtvklt/xbXrLC8jbx2Ckm7Opuzj
	FWkH7vmod4HAmz7m1ypoU+QbOutUlcw+uKVEZrxIbSRVR5wvonVVPNeD9pAPbecuK9QF
	i++LAYmE57BhCpu4mCXnoc5E33i2DRgDXa1ITKS/C3giiNl/J1ZcYC0/cfDvNrbtXWKE
	47iOSlQeWz/87QJmrHVM8ych7d7pPiwUTBqxoeB8AHAJDDBnFWVVB2UjVOebj/q74Tow
	8R574ch5gRKizoHlCuWO0pq2mwpRJxiwebZabhC51r0geY5w0TqLqKqkkOm2ZyFvccRd
	lViw==
X-Gm-Message-State: ALyK8tLpMik0RnJfRhYQ0tYpugcztzCQOEEh9G1h6xHK4tmGVNb2b1L0ljU++fRGnIk7mETl
X-Received: by 10.28.229.147 with SMTP id c141mr21576758wmh.5.1466165618423;
	Fri, 17 Jun 2016 05:13:38 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id b77sm5162848wme.0.2016.06.17.05.13.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 17 Jun 2016 05:13:37 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jun 2016 13:13:34 +0100
Message-Id: <1466165614-9635-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
In-Reply-To: <1466165614-9635-1-git-send-email-ross.burton@intel.com>
References: <1466165614-9635-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] packagegroup-self-hosted: add back Python 2
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
X-List-Received-Date: Fri, 17 Jun 2016 12:13:38 -0000

Some recipes depend on Python 2 being present (eg glib and ncurses) so until
they've all been migrated to Python 3 we should continue to ship Python 2 in the
self-hosted packagegroup.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/packagegroups/packagegroup-self-hosted.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index e8b4feb..73430b8 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -146,6 +146,9 @@ RDEPENDS_packagegroup-self-hosted-extended = "\
     perl-dev \
     perl-modules \
     perl-pod \
+    python \
+    python-modules \
+    python-git \
     python3 \
     python3-modules \
     python3-git \
-- 
2.8.0.rc3


