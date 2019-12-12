Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id A29027FC2A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 18:15:10 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id d139so4193361wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 10:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=auahApo/+hRUfMzr5rZG6AjDp5mtSibwGoJhxRGuu4c=;
	b=UbW/cU3ctGPIKzG0X/gfq6EPkSe5oVZI09BilfWdD2qES1np0IBN6HErATCw/Jvqlr
	PLu2gNHsCKxnhjUKTM1v7TUJR116eD+tTL5sOC2BCsbuqykzJntYBfnCNZssh1USCl/A
	7QY9QxY2MsDefB8HNZmnhZYqHtbchqWHL2n87eu8wA0+sp/weAqp3yWVlT3R+YJcsETO
	jnYhlE/bBYDkI0njLHMvvsgIsSpDBNUs1+oTh9S896NhwX1qExQNPFtCGGMC8wojd0Ri
	paIIQcKwIriyaLgACMmt3eikTicGBLO4OQDCJUb6IUTVEYB3t7+qo+BSNHM/MhY+t3ql
	XJEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=auahApo/+hRUfMzr5rZG6AjDp5mtSibwGoJhxRGuu4c=;
	b=elJvBNVDXWYt+JUe89J8Cea1fcYoLMoADDfkEEX7pHThxALJtDzBwPKtY8WQy2qcIN
	hfZdOEea9e2OSm9p0s9+la/rackqkOcAsCC9sHkqvMnByQl6sf9esX0MLqaYZV/zf//G
	vd7xDMUqk1uxgdFQRh6y/lowHq4BthdJhQ26Yel76JO3fsYik9t++FfKClbP35MohCC9
	dq5nJZOJGJ8QyGNF0uw5MdKrMit0Dp2ypregjWmqXGAWhqWvZf5sRs0ccWlDNZY0raHz
	kZVmf2uSuR0ySHOH3+TKEU11UyzfXvJQALN2QYqqxWFWLbNhH4QYjN+PGznjMH4SEndS
	+zlA==
X-Gm-Message-State: APjAAAV5HijB6BicQTBHhazvQ9ilFmlkywTDu3MbJmsSvExgxfIyKmF6
	ePhRmGmHDIitjp1gG0YeAkRbUZlV
X-Google-Smtp-Source: APXvYqzJIVNIojdoKdVp3jZWxt9rKQBbb8cY08ysZ/vUbLOuNfwIjrenVzG89IlCfNnjCpH8d52WDQ==
X-Received: by 2002:a05:600c:1051:: with SMTP id
	17mr7983298wmx.49.1576174511235; 
	Thu, 12 Dec 2019 10:15:11 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	o66sm3147571wmo.20.2019.12.12.10.15.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Dec 2019 10:15:10 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Dec 2019 19:14:36 +0100
Message-Id: <20191212181436.1322-30-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191212181436.1322-1-alex.kanavin@gmail.com>
References: <20191212181436.1322-1-alex.kanavin@gmail.com>
Subject: [PATCH 30/30] debianutils: update to 4.9.1
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
X-List-Received-Date: Thu, 12 Dec 2019 18:15:11 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{debianutils_4.8.6.3.bb => debianutils_4.9.1.bb}        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/debianutils/{debianutils_4.8.6.3.bb => debianutils_4.9.1.bb} (87%)

diff --git a/meta/recipes-support/debianutils/debianutils_4.8.6.3.bb b/meta/recipes-support/debianutils/debianutils_4.9.1.bb
similarity index 87%
rename from meta/recipes-support/debianutils/debianutils_4.8.6.3.bb
rename to meta/recipes-support/debianutils/debianutils_4.9.1.bb
index a69d01e0f95..904c52780f4 100644
--- a/meta/recipes-support/debianutils/debianutils_4.8.6.3.bb
+++ b/meta/recipes-support/debianutils/debianutils_4.9.1.bb
@@ -3,13 +3,13 @@ SECTION = "base"
 LICENSE = "GPLv2 & SMAIL_GPL"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=f01a5203d50512fc4830b4332b696a9f"
 
-SRC_URI = "http://snapshot.debian.org/archive/debian/20190717T213444Z/pool/main/d/${BPN}/${BPN}_${PV}.tar.xz"
+SRC_URI = "http://snapshot.debian.org/archive/debian/20191212T145612Z/pool/main/d/${BPN}/${BPN}_${PV}.tar.xz"
 # the package is taken from snapshots.debian.org; that source is static and goes stale
 # so we check the latest upstream from a directory that does get updated
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/d/${BPN}/"
 
-SRC_URI[md5sum] = "ca57cc6621275346d7d516ab0b5fa1f5"
-SRC_URI[sha256sum] = "2cc7de3afc6df1cf6d00af9938efac7ee8f739228e548e512ddc186b6a7be221"
+SRC_URI[md5sum] = "95633416680bfd249b7cb07d94137048"
+SRC_URI[sha256sum] = "af826685d9c56abfa873e84cd392539cd363cb0ba04a09d21187377e1b764091"
 
 inherit autotools update-alternatives
 
-- 
2.17.1


