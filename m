Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id B114F71B32
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2016 17:49:24 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id o81so10881643wma.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2016 10:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=y9cZzYsI73nRU7tHDoZ7/BaVAM4NSNsbpD0Cj8k+eXc=;
	b=toJR5Fyr5aKgxRo5ZdyseYzbkyfz4aH+6vS9wxFkQyFNNkYf8qhMoGxXrSb+Wlv6CT
	gBbHZF7DvmJBo2YIABel4WB4W0X8Hrf1+p7PedLg3PepIWysILoV8yy50xfVLiXdyc8m
	7ZjRK7VAZRFGFiOyrLGECxhndA1wwXtkhDeZvQDrHTCttCsQFB+qZNnglg4lYz/sNDjk
	9v2UHWA3hyQXeXrr7ujouXfDMs8/wz1O4yprKTl+RhevnCf+lj/gbu+jIxkr6v64YtaK
	WxA/x0TyfFA2bYuLHO/uqjH+P/UEAARtFAwk1zpxdvoYGrCARkXpOfhb59iHlW/N1yb8
	FJBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=y9cZzYsI73nRU7tHDoZ7/BaVAM4NSNsbpD0Cj8k+eXc=;
	b=eKJRuRz45ryVG6qN3q95D0g5E1++nAvBSOYAbsRWhhbCeYcG4TsDx3imGwpqVJz/XO
	7F9G3c60pj4cD4IOTZ6/VgmKANu0wTnTj4ifL99MaiF42NNYZTSIpTrR9OOActBFRClT
	7TISVCKIYcBWjRRcPZ1acBRZvK3uHkRDIkIeo0+hL37nlO5frXJE9EgVbgSdrFoFTPZw
	HTyOsCbdl/80ZcjqweBlnFv2dXo1rRncQPDWIrOqHuRKDd6JDh3LAZJEMVOyDfeRiY9L
	ACnum4IJfdl8pNf4tTZttNUqqwOXeR5kH6MSYNr9z7eE5kSP6+6uFlis6pkZmT2mvyZY
	awwQ==
X-Gm-Message-State: ABUngveP30l+Vploa0J7IXuy+6lc5v+OBG5TQqDPg0FSYMYdyv4SEO4Ew4QUdpFk5Dn+FA==
X-Received: by 10.194.23.66 with SMTP id k2mr12284247wjf.108.1477331365177;
	Mon, 24 Oct 2016 10:49:25 -0700 (PDT)
Received: from localhost.localdomain (p5B0A3D70.dip0.t-ipconnect.de.
	[91.10.61.112]) by smtp.googlemail.com with ESMTPSA id
	e5sm15952078wma.10.2016.10.24.10.49.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Oct 2016 10:49:24 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Oct 2016 19:49:09 +0200
Message-Id: <1477331349-3389-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1477331349-3389-1-git-send-email-schnitzeltony@googlemail.com>
References: <1477331349-3389-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH v2 2/2] taglib: update to 1.11
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
X-List-Received-Date: Mon, 24 Oct 2016 17:49:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/recipes-support/taglib/{taglib_1.9.1.bb => taglib_1.11.bb} | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)
 rename meta/recipes-support/taglib/{taglib_1.9.1.bb => taglib_1.11.bb} (74%)

diff --git a/meta/recipes-support/taglib/taglib_1.9.1.bb b/meta/recipes-support/taglib/taglib_1.11.bb
similarity index 74%
rename from meta/recipes-support/taglib/taglib_1.9.1.bb
rename to meta/recipes-support/taglib/taglib_1.11.bb
index d125308..9c0d374 100644
--- a/meta/recipes-support/taglib/taglib_1.9.1.bb
+++ b/meta/recipes-support/taglib/taglib_1.11.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING.LGPL;md5=4fbd65380cdd255951079008b364516c \
 DEPENDS = "zlib"
 
 SRC_URI = "http://taglib.github.io/releases/${BP}.tar.gz"
-SRC_URI[md5sum] = "0d35df96822bbd564c5504cb3c2e4d86"
-SRC_URI[sha256sum] = "72d371cd1419a87ae200447a53bff2be219283071e80fd12337928cc967dc71a"
+SRC_URI[md5sum] = "be39fa2054df40664cb557126ad7cf7c"
+SRC_URI[sha256sum] = "ed4cabb3d970ff9a30b2620071c2b054c4347f44fc63546dbe06f97980ece288"
 
 UPSTREAM_CHECK_URI = "http://github.com/taglib/taglib/releases/"
 
@@ -30,3 +30,6 @@ do_configure_prepend () {
 	sed -i -e "s/atomic.hpp/atomic-not-exist.hpp/" ${S}/ConfigureChecks.cmake ${S}/taglib/toolkit/trefcounter.cpp
 }
 
+# without -fPIC depending packages failed with many errors like:
+# | <...>/ld: error: <...>/usr/lib/libtag.a(modfilebase.cpp.o): requires unsupported dynamic reloc R_ARM_THM_MOVW_ABS_NC; recompile with -fPIC
+CXXFLAGS += "-fPIC"
-- 
2.5.5


