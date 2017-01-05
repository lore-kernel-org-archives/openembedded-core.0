Return-Path: <oleksandr.kravchuk@pelagicore.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 93D776071F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2017 07:00:54 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id u144so112683258wmu.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jan 2017 23:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=bwbG+34khv23+0BMb3FTgqX+33X+MNMg5HyGZjJ3QK4=;
	b=PLH4v4t87nxJO3QiZC32boO7JfshP0Cf2IttkA7AxoaKMPyYI1jyCW/10fBF3yNRmP
	3Tg9ngVp2e344OThNyhCddMTSkKlIntd+2ky1k8jC54oOAMOP8byJRurXIghNqtXZgsg
	SHGbkyGScPuvWRzaARfiZJjTnJqATyk/hGmSGbBkOboXIzacbN3hiAZ/XdC8uIjMlz9v
	jUybMMf3gj4AsF8kM05NhF+qJoxEvJ+DZc1LOFF30gICXf0OOiM+TVpjDGrJOlfpcgFO
	tqnievVtcweCZKw1o5Wosk6KZClY1CRurYBD5skbGBVhRNR64DVLt08fwCy4w2NbrHVD
	x4hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bwbG+34khv23+0BMb3FTgqX+33X+MNMg5HyGZjJ3QK4=;
	b=cse8BL+phDv2Df+vINp1TJ1zF6Lkl5bkeLixEodsYU+Wb4f6fzKAIOuOF3sT3CSiyf
	Y230sR/UY59GUQrD3ezXRjsDCoui+bRvQt6I9OMSGEgpRLlJ3GZtxuL2CrCahmcnFIAj
	AS+4slVEtSiN6pMG8rh6atUyj/kgpKLGvpP0ANrJRgGlefn4k1kak3y14LxLdUn3zA0K
	jMS4JBc3rg21ivajxgwmg/W6+aAIREkoGsgka33PZs6i8SOFFbakCQNuhy1eg8HK11Ar
	Nz/pbtnaFBPRwMwDIl3kyABy0wj/qMMs296JGjH237Z4/V8AHw26ZgJS0BipVsxcbdbM
	Rm5g==
X-Gm-Message-State: AIkVDXJuqNjL0hcCFDk2FRoXxOr5wxNZ7wpFqWPT/airqBJBGbIFhwK3IpDHZNYK4JTQnQ0Q
X-Received: by 10.28.229.72 with SMTP id c69mr65380298wmh.110.1483599653813;
	Wed, 04 Jan 2017 23:00:53 -0800 (PST)
Received: from stout.office.pelagicore.net ([83.218.80.242])
	by smtp.gmail.com with ESMTPSA id
	q65sm98374207wmd.6.2017.01.04.23.00.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 04 Jan 2017 23:00:53 -0800 (PST)
From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jan 2017 08:00:50 +0100
Message-Id: <1483599650-29293-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] curl: upgrade to 7.52.1
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
X-List-Received-Date: Thu, 05 Jan 2017 07:00:55 -0000

Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
---
 meta/recipes-support/curl/{curl_7.51.0.bb => curl_7.52.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/curl/{curl_7.51.0.bb => curl_7.52.1.bb} (94%)

diff --git a/meta/recipes-support/curl/curl_7.51.0.bb b/meta/recipes-support/curl/curl_7.52.1.bb
similarity index 94%
rename from meta/recipes-support/curl/curl_7.51.0.bb
rename to meta/recipes-support/curl/curl_7.52.1.bb
index a9589b8..2882bc0 100644
--- a/meta/recipes-support/curl/curl_7.51.0.bb
+++ b/meta/recipes-support/curl/curl_7.52.1.bb
@@ -14,8 +14,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
 #
 SRC_URI += " file://configure_ac.patch"
 
-SRC_URI[md5sum] = "09a7c5769a7eae676d5e2c86d51f167e"
-SRC_URI[sha256sum] = "7f8240048907e5030f67be0a6129bc4b333783b9cca1391026d700835a788dde"
+SRC_URI[md5sum] = "dd014df06ff1d12e173de86873f9f77a"
+SRC_URI[sha256sum] = "d16185a767cb2c1ba3d5b9096ec54e5ec198b213f45864a38b3bda4bbf87389b"
 
 CVE_PRODUCT = "libcurl"
 inherit autotools pkgconfig binconfig multilib_header
-- 
2.7.4


