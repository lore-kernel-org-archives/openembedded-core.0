Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id D12797E34E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 01:32:36 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id e17so275594pgo.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 18:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=5ZWhW3YeUko+GE0SNNEZO9vdhXZW9RkHzQIzcU5aQ2w=;
	b=vWvt4bojn7J8z3Ic5VGRXU1fZrzJM2Cyz6mlK7qhA4pbLsCge9Xj/u2BkMoU3VXf5d
	GiKKMtRFnja7b1uBjCwIcSVPzcxQinWD/2/LiO/0JBCu/DJdkTEIRdZf+G5WjZsNmgQF
	qoOwE6rjkIfz2rfb9j2XLk0ss1qWHvuWI0jHKoM6QCP27gn6p+ENO2Vn5bPjPasEMlI5
	CRLfhC1ZPdeE8g2oy+mfJ5U/4c3jvGLroHXfeQY3rkGmseZ7yt61LZgsa5SEjbrACC9g
	N4SAhGtPwiTB7UYNgkNBFUpFf6qn3v6lwj2XDQb9bvkp7lRU530jnvjIIxxDKAJtgs2W
	PI+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=5ZWhW3YeUko+GE0SNNEZO9vdhXZW9RkHzQIzcU5aQ2w=;
	b=STSDJ5gBaaBPito5RoxPSlSjfwntDNQgZ5u0N8B+R9/iVvCLZDhEaHR8iPdeSArXmZ
	Bb3qbggeFhgXlXeMPNLku/uxrABPwTQSMfoY6vWC+kkbgT6FD+zBWJB0/OOZbFQEm2Ns
	dzayXPCJgN44iq6X9AbA1U4RTenYtqcPLwUMEIqG6AW11nSB2r7mo2HIO655rMGppT6M
	qW8uZFuKgcmnzWSiN8h7wK6MJN1p5kL1dl4mBMw6Buhf1pHBWdClh9O0ht5TKTL/ViLM
	wwkuBv3VARzVDdoNcYhl27lFc/llJMK8Yce2FBFKhoXuS7I9eMlMswiPQ+rAam914HVi
	XwcQ==
X-Gm-Message-State: APjAAAWAei4w3sYex7tcBtgTgfbgo/0Ndd5T5qFyxoLADgpiRn/dCMcu
	wzstAHBFVtwAsMbSr50djQxqb+9Tuyk=
X-Google-Smtp-Source: APXvYqzRI75k1uV1KpzgouJ2yb4A5bVCGAB1xXVO+MF1WxIyqsx+y5HIh+x6G38iY6q39Nbl0sjI0Q==
X-Received: by 2002:a62:fb18:: with SMTP id x24mr27328348pfm.76.1558488757453; 
	Tue, 21 May 2019 18:32:37 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::3506])
	by smtp.gmail.com with ESMTPSA id
	p64sm34197147pfp.72.2019.05.21.18.32.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 May 2019 18:32:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 May 2019 18:32:27 -0700
Message-Id: <20190522013228.7591-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190522013228.7591-1-raj.khem@gmail.com>
References: <20190522013228.7591-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] maintainers: Account for musl-obstack and libssp-nonshared
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
X-List-Received-Date: Wed, 22 May 2019 01:32:36 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/maintainers.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 67a51cdecc..2c10b104de 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -382,6 +382,7 @@ RECIPE_MAINTAINER_pn-libsm = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-libsndfile1 = "Tanu Kaskinen <tanuk@iki.fi>"
 RECIPE_MAINTAINER_pn-libsolv = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-libsoup-2.4 = "Anuj Mittal <anuj.mittal@intel.com>"
+RECIPE_MAINTAINER_pn-libssp-nonshared = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-libtasn1 = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-libtest-needs-perl = "Tim Orling <timothy.t.orling@linux.intel.com>"
 RECIPE_MAINTAINER_pn-libtheora = "Alexander Kanavin <alex.kanavin@gmail.com>"
@@ -512,6 +513,7 @@ RECIPE_MAINTAINER_pn-mtd-utils = "Denys Dmytriyenko <denys@ti.com>"
 RECIPE_MAINTAINER_pn-mtdev = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-mtools = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-musl = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER_pn-musl-obstack = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-musl-utils = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-mx-1.0 = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-nasm = "Richard Purdie <richard.purdie@linuxfoundation.org>"
-- 
2.21.0


