Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id C84EF78287
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 23:22:27 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id h4so2074566pfk.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 16:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=YNioS7WKmguS1x1VfcmhxhOUczk+TKa1hDjucrhaj9s=;
	b=ZxJSJMBwAf3PrJ/jrE1SWTe2rY1F6z3Qh7wfRSuW2L4WLLoF2B6IcKo2CUOgb+0RyQ
	y5ZtUP7CgzEXt9hD+RKy+EoSLBCsrPC/h6YH+bYrtZsyXIyRMmYBSS2jxMFY1MOaGXmf
	xiUKtzGEp4Reppg8Y4HgXYR6/rUBvvNfXqLvaZRV/j8JC+2RbUiSCqAuX/wJHk7r2/Dy
	nsACHY76L4WlDeGOVELz2ZISrn5urH6a6jgyo3yQfZq2r4NaMaqjmhJESZAbtjotkIHH
	/7H/xkwgoD7oreNwS26JfCbPb1lWDJJsZT4D8+x4Ynkb0Yu6n2dvMEfVyxP4/jmjue+E
	gGvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=YNioS7WKmguS1x1VfcmhxhOUczk+TKa1hDjucrhaj9s=;
	b=c3dXSAaoYV+nrO6PQaiq8RP+PwBhSp+R5c0Bkn70Cn7YnKoCByFt5kvdzusV2nuCh1
	Wm7U7txR1oKSvaAJjHot8lsBzn848yw6OGa3iOLKcUMgehM9QbXoURQsJwvBfFs7q9l2
	+TofZ2uTBBQhRN8Pn9Ua2FNOLzvKhGDD7v1nc30eISN+S1Z0cqc+y/oExMwA7N0y4RYh
	5EqL2aAJk6yhaj6uJnpjPb5vra5sGgZwo3UQqlscUpvZPoHStENt0mUiVQEP3Q2OtFYr
	GNpmWzrL0tIsYypzczqpfX4duMuP05TdnTXNUtZrtSuyqd4oKq8G0KyGmBA7Uzmbzzrt
	lfZA==
X-Gm-Message-State: AHPjjUin2rMhOlDsuDziRVx2DKJSbpFM6zamfwf5w7nzqqhjeCZt/btC
	Cb+5o8FPCSE42iDX
X-Google-Smtp-Source: ADKCNb5L/RDJS+glaVoUYoKEsmqyG3pIYPH4i0noqjy6g0oV1sD3UZFNuaid2HNOWFmVPl2AG+6ukA==
X-Received: by 10.84.129.65 with SMTP id 59mr5133560plb.442.1504912949134;
	Fri, 08 Sep 2017 16:22:29 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	q13sm5510822pfi.110.2017.09.08.16.22.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Sep 2017 16:22:28 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Sep 2017 16:21:46 -0700
Message-Id: <1504912911-23120-11-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1504912911-23120-1-git-send-email-armccurdy@gmail.com>
References: <1504912911-23120-1-git-send-email-armccurdy@gmail.com>
Subject: [daisy][PATCH 10/15] cryptodev-linux: update SRC_URI
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
X-List-Received-Date: Fri, 08 Sep 2017 23:22:28 -0000

From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>

Gna! project announced that the download site from gna.org HTTP server
will soon be closing down. We have verified that the site is no longer
accessible without network proxy cache. We need to update SRC_URI to
point to new alternative (nwl.cc HTTP server) in order to avoid fetcher
issues in future.

[YOCTO #11575]

Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dc8b21ae0ed3bceb9f3df4f6cd8f8f55b9c306fb)

Tweak commit to apply to older cryptodev 1.6 recipe in OE 1.6

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-kernel/cryptodev/cryptodev_1.6.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/cryptodev/cryptodev_1.6.inc b/meta/recipes-kernel/cryptodev/cryptodev_1.6.inc
index 946faac..4a9d0ab 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev_1.6.inc
+++ b/meta/recipes-kernel/cryptodev/cryptodev_1.6.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://cryptodev-linux.org/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "http://download.gna.org/cryptodev-linux/cryptodev-linux-${PV}.tar.gz"
+SRC_URI = "http://nwl.cc/pub/cryptodev-linux/cryptodev-linux-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "eade38998313c25fd7934719cdf8a2ea"
 SRC_URI[sha256sum] = "75f1425c8ea1f8cae523905a5a046a35092327a6152800b0b86efc4e56fb3e2f"
-- 
1.9.1


