Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
	[209.85.208.46])
	by mail.openembedded.org (Postfix) with ESMTP id 1B1797D19E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 21:59:51 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id q3so9821884edg.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2019 14:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=W7fVOezNkGI3s8lpAUvTf8bRhg519utG/9F2mNryMS0=;
	b=pdYZGl88TwrFXheWQqp4K2ACUgDVtLSsEZLMBTghGNZ0SI+yAXb3Yu6p9iZtEkjH9q
	X1AK/H+7QVRiNVoJEsS2I5tNWD1ZNOZQ0Kk0fb9iSPR8irInc/tKudqppPYIY9+oTimP
	mOjuYTGUdSys18o3Jo906Eeal+IPH+77wVbrahyULrT9zPq527fzB44IfJljsLSqIJ5B
	oKlm1El3FG2IoiFR0ub0hd0hy68Z1xeTY9bzvau1JArlDNxFX6rb0c2BO31MmXidAqer
	MhCHd0IapuVx4bHIhw3oujNtmbRwfjrVnOT33LUA/KuYFAhts9mkXYgTOvGWMRZWhI/u
	eFIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=W7fVOezNkGI3s8lpAUvTf8bRhg519utG/9F2mNryMS0=;
	b=cFg4jzS/YZugXy96NnHqK2tcWZsXJEjPKL2Rgx/7jimuuclaRsXxoVUb4y5BrnrkU4
	88f0RrEqvHQb882NuKYEVzEsVFUnjiSSPBw5kD+Q/yQ/+BvR60Yg4/MslOiyOVzuQZaH
	MrnMUhGShFeaFapJbohYnDFxc9VUOAsVzv90x/ztYgbvyI5QIvJhNuxogIEgqe6tEj/p
	SgI1DaWPDwjt09ZiW0hk0SnepzsCTe3I8ZiYRtamvH78CE3xceJlAXB//ga/d3IG1Um4
	SVZGXrMQmeWThdgbMMch518ESzTD0lCCUkhpHYDSXDO8tPhVKzqw1e2/DBgehyeYjbah
	N0xg==
X-Gm-Message-State: APjAAAVYsLu63wpYrJicYZzfsXBFUjWoqz62CkxOT3C8Fc8OyVqwaO9H
	IyN7FC9dA8KokATLSeS0d19mLFwuwP4=
X-Google-Smtp-Source: APXvYqxlOMzrKyT/KgXau54ZPt9UebkGmwYioYuY+otWq13oDeW0hhtpAF58lYbWxaiNSqxHzAJLnA==
X-Received: by 2002:a17:906:d512:: with SMTP id
	ge18mr17942615ejb.232.1554155992457; 
	Mon, 01 Apr 2019 14:59:52 -0700 (PDT)
Received: from lund.luxoft.com (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	z39sm3495343edz.26.2019.04.01.14.59.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Apr 2019 14:59:51 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Apr 2019 23:59:49 +0200
Message-Id: <20190401215949.24633-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] wget: update to 1.20.2
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
X-List-Received-Date: Mon, 01 Apr 2019 21:59:52 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-extended/wget/wget_1.20.1.bb | 8 --------
 meta/recipes-extended/wget/wget_1.20.2.bb | 8 ++++++++
 2 files changed, 8 insertions(+), 8 deletions(-)
 delete mode 100644 meta/recipes-extended/wget/wget_1.20.1.bb
 create mode 100644 meta/recipes-extended/wget/wget_1.20.2.bb

diff --git a/meta/recipes-extended/wget/wget_1.20.1.bb b/meta/recipes-extended/wget/wget_1.20.1.bb
deleted file mode 100644
index d176bd0acd..0000000000
--- a/meta/recipes-extended/wget/wget_1.20.1.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
-           file://0002-improve-reproducibility.patch \
-          "
-
-SRC_URI[md5sum] = "f6ebe9c7b375fc9832fb1b2028271fb7"
-SRC_URI[sha256sum] = "b783b390cb571c837b392857945f5a1f00ec6b043177cc42abb8ee1b542ee1b3"
-
-require wget.inc
diff --git a/meta/recipes-extended/wget/wget_1.20.2.bb b/meta/recipes-extended/wget/wget_1.20.2.bb
new file mode 100644
index 0000000000..cd20785259
--- /dev/null
+++ b/meta/recipes-extended/wget/wget_1.20.2.bb
@@ -0,0 +1,8 @@
+SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
+           file://0002-improve-reproducibility.patch \
+          "
+
+SRC_URI[md5sum] = "2692f6678e93601441306b5c1fc6a77a"
+SRC_URI[sha256sum] = "7e43b98cb5e10234836ebef6faf24c4d96c0ae7a480e49ff658117cc4793d166"
+
+require wget.inc
-- 
2.17.1


