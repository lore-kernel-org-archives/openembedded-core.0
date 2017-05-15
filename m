Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 7EEE872F28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 13:27:26 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id f102so72931439ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 06:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=PYQqcbirqhtZ4VnkbeViom8nsJgpSpk649W5koOFDIU=;
	b=tY0ZIOgSbhOJG16iGSu8cV6xea5aF3xKv94PJdSZsEzuCZP+J+7onxUQfZNEn42+TN
	AOENXIAq2tBLw1SaeAv+Umchpq/iT1k7bMkm96EMTq490RXbhnpd7CgcHTMu3eaer0AL
	lKTzNPYd+3jd72obu3jFpBZXP5CQdkc9XC7E1VSqDh8EJygNfpTfVaxoiVNJGVpeMmwS
	JnA8PyBCwrUukNaGDVBgi6XwK+VpDr1q6NIrHgI8sOUcqo2moofUPLZ33QQgDiwFMyKI
	IopAHw+qU6gLJk11JKD90Iln0IoxlyILnOjmjCQJEtDkqBP+SzizRXCx3lUpOVpMPetZ
	Nz+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=PYQqcbirqhtZ4VnkbeViom8nsJgpSpk649W5koOFDIU=;
	b=QP5g4DdaLIC4FiZrdMA0+WNgGFUFc3gsPfj09vUAoWWVmlmTWo+5/4wVvDCAQeFumb
	LGwF0TSQgq8xHGxm1BKJt0snz+C0uNsFdF/lQEZ62FSTzAkXNTbdrjQP3pV7PjZXnZmv
	zN+bYhDvIHQZri5Ihf1ue3xol1pGhNwPhBn01QjGVYTEfSEjtJrrSmccjJ9yerD/ehpl
	LvjKLbYn6geGdMtzd/gSYSIlof9cXGCGKRpIK6c3TqAdUv+/XABHeDwh3twBmRMESJyS
	qzSqakgOtDvV6FRAobkKwhQnp5+vrwJ5tY8SRJZ6WiiCKrFV1Jqle5Gt8ssrlOG+Vp4u
	I8mw==
X-Gm-Message-State: AODbwcCn/s8fdvxUaEITs2xw871GruQgMYnTKw4/fualO1KGZmdhAVgz
	h/RcqLq7jXoR8KnPb50=
X-Received: by 10.107.11.137 with SMTP id 9mr5359861iol.86.1494854847359;
	Mon, 15 May 2017 06:27:27 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8F79A.dip0.t-ipconnect.de.
	[93.232.247.154])
	by smtp.gmail.com with ESMTPSA id c7sm4537765itc.14.2017.05.15.06.27.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 15 May 2017 06:27:26 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 May 2017 15:27:03 +0200
Message-Id: <e03ca7d9d2d8b290fe306da077e0fc74a6916efd.1494854721.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.da0bfaf0b62cb1033573711fd83cf5251f8827f3.1494854721.git-series.patrick.ohly@intel.com>
References: <cover.da0bfaf0b62cb1033573711fd83cf5251f8827f3.1494854721.git-series.patrick.ohly@intel.com>
In-Reply-To: <cover.da0bfaf0b62cb1033573711fd83cf5251f8827f3.1494854721.git-series.patrick.ohly@intel.com>
References: <cover.da0bfaf0b62cb1033573711fd83cf5251f8827f3.1494854721.git-series.patrick.ohly@intel.com>
Subject: [RFC][PATCH 6/6] local.conf.sample: make debug-tweaks depend on IMAGE_MODE
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
X-List-Received-Date: Mon, 15 May 2017 13:27:26 -0000

Enabling "debug-tweaks" unconditionally, even if it is only in the
local.conf.sample file, runs the risk of that getting used in
production images.

By checking the per-image IMAGE_MODE, the debug tweaks only get
enabled for images not meant for production.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/conf/local.conf.sample | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index 85c5e21..edadbb7 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -114,8 +114,9 @@ PACKAGE_CLASSES ?= "package_ipk"
 #                     e.g. ssh root access has a blank password
 # There are other application targets that can be used here too, see
 # meta/classes/image.bbclass and meta/classes/core-image.bbclass for more details.
-# We default to enabling the debugging tweaks.
-EXTRA_IMAGE_FEATURES ?= "debug-tweaks"
+# We default to enabling the debugging tweaks unless an image is explicitly
+# requested to be built for production.
+EXTRA_IMAGE_FEATURES ?= "${@ '' if 'production' == d.getVar('IMAGE_MODE') else 'debug-tweaks'}"
 
 #
 # Additional image features
-- 
git-series 0.9.1

