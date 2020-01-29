Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id CB058608AB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 14:46:17 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id s10so4044841wmh.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 06:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=FCGOZyGFe9rA/z9XRFqvn8hHn+wYK4QWTaJ+4R+AXbE=;
	b=g2+e+UDOAhPqnuicwQgTlPat/rfMll8paaiPSThcRsM1mQVEVZqVvbmHkm864dR22h
	X94+BLIKbuMkwpK7P/DxY7OJZN2vLGaLQcmN4u13FjZtEv2ygpkKbHBalZQgFAtMPfn7
	6j94COg3MECABaCfFEWgHSYxFq5B0pg78wPf1+tWCKPO/r91LFAotWATp/Uw+aUo2plH
	Ohm4NZwjoc4NBkrHqcFtW0wQh0rROs4XQldUtsApwV/85Zmhrfb3bwRsKyf6U4WMLVgu
	c8hJCJiyRvj17580F+jXXgCw0dhp46HWJAVHdKgOXAM32SizLoYlDjYU2kdGhDDS0pbh
	BILQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=FCGOZyGFe9rA/z9XRFqvn8hHn+wYK4QWTaJ+4R+AXbE=;
	b=AUOdEwyCyfgX7nsbGdotj8JaeWxQ7sCAZuFcdLxw0oRA5g4M0zVUY0XRX9t9WkCoMn
	cD6MDphb3FVSawt9KFjrCGOwhguUeJ9P+fM0v9KPxwU5VQRxoec7I8Q9srxFWmm7aYfB
	U2+yDTjUr4qzriS+7KzL4qlz+UvFq3PWkwZXODFUKRmGbDt9VUEYGyRXn4YEW8CG5GHs
	7M7h4g73TMU1TaDN/r2Ko9rGjTp3XMkoN/D60laac2EBV4TPHISnYULHLvALVdI0yyxc
	/02riSS2Hr6K0ou2v4RWUXIxeuHaknn+yhDeYrk42wxc9BcLuSAdavjxOxGa0ilsQzy9
	55Lg==
X-Gm-Message-State: APjAAAU7j77VvirdF+qUIaNFr/xGP9h6ZJVSHdPchDPFl4GEnDO7bMVP
	OBsniwFZNkqTYzvxaH3AJifIhut8
X-Google-Smtp-Source: APXvYqzHqalaiMc8IOXdZPexxWiHflLz32Bqb2NHumgmHnmSjbfKI6hj/S1aOADxxX9q5SaTFrZqLw==
X-Received: by 2002:a05:600c:2c41:: with SMTP id
	r1mr8937969wmg.57.1580288905073; 
	Wed, 29 Jan 2020 01:08:25 -0800 (PST)
Received: from linux-f9zs.box (cable-95-168-152-69.cust.telecolumbus.net.
	[95.168.152.69]) by smtp.gmail.com with ESMTPSA id
	a62sm1550224wmh.33.2020.01.29.01.08.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 29 Jan 2020 01:08:24 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jan 2020 10:07:37 +0100
Message-Id: <20200129090738.1398-23-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200129090738.1398-1-alex.kanavin@gmail.com>
References: <20200129090738.1398-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 23/24] sed: upgrade 4.7 -> 4.8
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
X-List-Received-Date: Thu, 30 Jan 2020 14:46:18 -0000
Content-Transfer-Encoding: 8bit

License-update: copyright years
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-extended/sed/{sed_4.7.bb => sed_4.8.bb} | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/sed/{sed_4.7.bb => sed_4.8.bb} (91%)

diff --git a/meta/recipes-extended/sed/sed_4.7.bb b/meta/recipes-extended/sed/sed_4.8.bb
similarity index 91%
rename from meta/recipes-extended/sed/sed_4.7.bb
rename to meta/recipes-extended/sed/sed_4.8.bb
index a285941dc4b..39e3a61df5e 100644
--- a/meta/recipes-extended/sed/sed_4.7.bb
+++ b/meta/recipes-extended/sed/sed_4.8.bb
@@ -2,15 +2,16 @@ SUMMARY = "Stream EDitor (text filtering utility)"
 HOMEPAGE = "http://www.gnu.org/software/sed/"
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c678957b0c8e964aa6c70fd77641a71e \
-                    file://sed/sed.h;beginline=1;endline=15;md5=e869c874e5472ba89f63f381b0e93475"
+                    file://sed/sed.h;beginline=1;endline=15;md5=fb3c7e6fbca6f66943859153d4be8efe \
+                    "
 SECTION = "console/utils"
 
 SRC_URI = "${GNU_MIRROR}/sed/sed-${PV}.tar.xz \
            file://run-ptest \
 "
 
-SRC_URI[md5sum] = "777ddfd9d71dd06711fe91f0925e1573"
-SRC_URI[sha256sum] = "2885768cd0a29ff8d58a6280a270ff161f6a3deb5690b2be6c49f46d4c67bd6a"
+SRC_URI[md5sum] = "6d906edfdb3202304059233f51f9a71d"
+SRC_URI[sha256sum] = "f79b0cfea71b37a8eeec8490db6c5f7ae7719c35587f21edb0617f370eeff633"
 
 inherit autotools texinfo update-alternatives gettext ptest
 
-- 
2.25.0


