Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 1445A60670
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 16:23:03 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id r129so219727764wmr.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Feb 2016 08:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=sXM49GJd1tdNwRqS2P8fP4uWOTGx5jNSYPd6ECmbHv4=;
	b=Uu4SLZOPRtliKUquip0Crbu4eq6DkrbuuNiAl4li1BJc2bFFYxzFZurueVW0MrL3Rd
	wdN/ijSb9nz4HQW+vwNJNquovMfH2aErHMqy7WXiSKsQoqJBHzRTwwlIM6QhAc2QyYiy
	6dxGNPr3NF0wNBWsvfByPhYgN17fwlTEnUlexWBwzuf16Cw0DSwNb94WEenFGYXfvbVq
	wBBlBaSRualtZ83/1EyLtT81RY8i+ZNM9rwRa6qArqlXl7hQvfDNzylGrE62HyaIlAW1
	7OXvQoHZc3M5Tx8Dhyqmjb8i3VI5bWjq5Rj3fkxzp0t+XHAJtp7/w4e4gmai9Hv8+F1t
	5E0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=sXM49GJd1tdNwRqS2P8fP4uWOTGx5jNSYPd6ECmbHv4=;
	b=R74oLM5ZF49Ke3S/d6QHko8hEpgkDDHBIrj6a7MOMnC8vevSRh6NVxx+TTXmcP03Br
	kdQkadCA7SSbPvZFBy5Nm7AisIlYjDNKToxWHhopD/OOxne8uR4q0dHmv0g11d4+A/l3
	0Uiy1JphxXguDYtP9QlQFoiLG2QL573Po6OaZeKIxb4nzF8KhThWRUlVz0KknwFXVuGD
	dFo+VFcxYqm0sSYfKFcbKLM33j60X2FeLeaWuNhm2M2Tsy2Vdfunf7WwaRRy1oToTUh6
	ibMxdo1l+X2M5C+qbWNi/QD0hs8I7MXlTE5T+bXwT9htlgTxKonMIeIaCsWBnPqg6YbB
	gMqw==
X-Gm-Message-State: AG10YORnqL1Vrtvsk6uUvb2DD9Da428Uhz0aNxp+xHAaUuf6J6Ea9nigkLIy7gUInfXiwvtq
X-Received: by 10.28.222.214 with SMTP id v205mr526269wmg.92.1454602984020;
	Thu, 04 Feb 2016 08:23:04 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	i2sm11951507wjx.42.2016.02.04.08.23.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 04 Feb 2016 08:23:03 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Feb 2016 16:22:52 +0000
Message-Id: <1454602972-13669-4-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1454602972-13669-1-git-send-email-ross.burton@intel.com>
References: <1454602972-13669-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 4/4] socat: upgrade to 1.7.3.1
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
X-List-Received-Date: Thu, 04 Feb 2016 16:23:04 -0000

This fixes Socat Security Advisory 7 (MSVR-1499) and 8.

[ YOCTO #9024 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../recipes-connectivity/socat/{socat_1.7.3.0.bb => socat_1.7.3.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/socat/{socat_1.7.3.0.bb => socat_1.7.3.1.bb} (88%)

diff --git a/meta/recipes-connectivity/socat/socat_1.7.3.0.bb b/meta/recipes-connectivity/socat/socat_1.7.3.1.bb
similarity index 88%
rename from meta/recipes-connectivity/socat/socat_1.7.3.0.bb
rename to meta/recipes-connectivity/socat/socat_1.7.3.1.bb
index b58e0a7..c215e04 100644
--- a/meta/recipes-connectivity/socat/socat_1.7.3.0.bb
+++ b/meta/recipes-connectivity/socat/socat_1.7.3.1.bb
@@ -16,8 +16,8 @@ SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2 \
            file://Makefile.in-fix-for-parallel-build.patch \
 "
 
-SRC_URI[md5sum] = "b607edb65bc6c57f4a43f06247504274"
-SRC_URI[sha256sum] = "0767e850c0329b9fdf711c6cd468565cbbb28786ba1a8a1cbd5531d4016b3e04"
+SRC_URI[md5sum] = "334e46924f2b386299c9db2ac22bcd36"
+SRC_URI[sha256sum] = "d2da659540c38139f388e9437bfaae16bb458d174d056cb3228432a8f489fbaa"
 
 inherit autotools
 
-- 
2.7.0


