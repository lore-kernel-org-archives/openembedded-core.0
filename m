Return-Path: <luca.boccassi@gmail.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id 799C17F2D5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2019 13:59:05 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id g17so95031490wrr.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Aug 2019 06:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=MNcco1CWtyMLurnk1F2hVJQebTWRVxc9lXSEWmEQJ48=;
	b=jeLdnnAthCpghdHYJVkymB/m5EZpboyxpmeUcQVh1MfYPeE7+HL7XCIR6Qt3C4iw5o
	afNjuLW57Vq9eRfCmzY+td/gSOYsGlZ2cfbEmCXMBKgOcT4gnvU2C2E1DDt59SjhpB6F
	PvkUqJRTJHfcIgXoTpnOCEZFEUCWR93zKv0AeeCBde0vcL7xXGFNAv9SSHK18PvuHo85
	vUjz1tTXu4XG+xNJr99JVkdSF3EhBqXfdDHHa6R6jbTII6lD/LN2YnwjudM9VnfSsy4M
	CkEAfDZaSH0O9pjYFPo6eGGbLutUL2JNiAC1Q9LK03M4Tzfs+y7+XADuCAOxn4kNMrZ5
	MUlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=MNcco1CWtyMLurnk1F2hVJQebTWRVxc9lXSEWmEQJ48=;
	b=EyGZO619QkkxhbDMTu03GZTaMRV+JETrkKI9xi8kLW4xMN7XqCJGLbxc26OWqW2fmP
	k9z3ZZYEldV8hr4jFEvIu44nwV62OQDI7PXt7CZ2UlzG3djq1pGOV0z4jkpDsDWSdb5q
	ghILfh7gn62zMABpFmBF3H/rbLG0Cy09lBv1RN4CuDjU9U+62aEprHt1gTKoekwG3h2P
	8KWVCjLjDzcmn4XZRb8s59RKSFZRz+cudUq42NafWg+eMk6JTVOE294TBywnAj7JOEs2
	gkau/7ghK2IG05/GTRt0UK8z2RPbh8ISqHhqX/yI/5Xc0T1UhiX4stjOmwQqkQEAszXH
	RnnQ==
X-Gm-Message-State: APjAAAWsO1ZQs7YB6jM/9FvH1mPQJkk2v4+sRpMIA+qlfP9y33QhoUF8
	uNHWeau/RpU517rYrv3IVffhyRsP
X-Google-Smtp-Source: APXvYqxwQyu+q2miQ32sUlUzqhT4OqM4eMtb0j6cQ3jke4nPxb1k1HQU2DCWSuIpBGbBhSmsPwG6BQ==
X-Received: by 2002:a05:6000:12c3:: with SMTP id
	l3mr13655898wrx.100.1565272745701; 
	Thu, 08 Aug 2019 06:59:05 -0700 (PDT)
Received: from localhost ([2a01:4b00:f419:6f00:7a8e:ed70:5c52:ea3])
	by smtp.gmail.com with ESMTPSA id
	c187sm4021415wmd.39.2019.08.08.06.59.04
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 08 Aug 2019 06:59:05 -0700 (PDT)
From: luca.boccassi@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Aug 2019 14:58:58 +0100
Message-Id: <20190808135858.4609-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190805105232.16148-1-luca.boccassi@gmail.com>
References: <20190805105232.16148-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Subject: [PATCH v3] python3-pygobject: move python3-setuptools from RDEPENDS to DEPENDS
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
X-List-Received-Date: Thu, 08 Aug 2019 13:59:05 -0000
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

python3-setuptools is necessary to build pygobject but not to run it, as
also documented by the upstream packaging guide:

https://gitlab.gnome.org/GNOME/pygobject/blob/master/docs/packagingguide.rst

Move it to DEPENDS to shrink the runtime dependency chain, as setuptools
includes scripts to download other packages, which might not be desired on
a minimal image.

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
v2: use -native suffix as requested during the code review
v3: do not add setuptools to DEPENDS - it is optional and it builds without it

 meta/recipes-devtools/python/python3-pygobject_3.32.2.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.32.2.bb b/meta/recipes-devtools/python/python3-pygobject_3.32.2.bb
index 05688be603..453fdac2c8 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.32.2.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.32.2.bb
@@ -27,7 +27,5 @@ PACKAGECONFIG ??= "${@bb.utils.contains_any('DISTRO_FEATURES', [ 'directfb', 'wa
 # we don't link against python3-pycairo -> RDEPENDS
 PACKAGECONFIG[cairo] = "-Dpycairo=true,-Dpycairo=false, cairo python3-pycairo, python3-pycairo"
 
-RDEPENDS_${PN} += "python3-setuptools"
-
 BBCLASSEXTEND = "native"
 PACKAGECONFIG_class-native = ""
-- 
2.20.1


