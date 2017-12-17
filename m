Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id A9E6577FEC
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Dec 2017 16:34:44 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id g2so3354912pli.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Dec 2017 08:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=WGJvkj6eT+mzidQsRG73SDF0AsUJ2x7DOVFWG2IrGb0=;
	b=oEi5ehiRHEoJ0ACoyRW65emWQeKxfGgc7dq9JoH3HL7qXF2a4MmyN/NUijWQ+/KFDd
	x2fPZWpV/x7utvw/9ie8kWbwJ2K+HmOtUlZ14i8Pvz+UnVB4ZUmCGSosMrRaEXh/WFNI
	bnpLpiMbZIAPVo/TdepzAjjFZv9AkaIeVpT1TUl8qU+c4jxmAxQfuJR32BUA3wOVDCD2
	ECJvQYNds0t3/d9inNwbyhIL+I7jtupEaCRQKGTDVzrqBfUK9m4rCiRKeSq0fncSdMdf
	fcuYxw/FMYIGtkp+kIXedC93jSjSkYOB3AXzdbNpMFexVUJYvX41Pk4DzZSM6gxYJaPv
	wOgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=WGJvkj6eT+mzidQsRG73SDF0AsUJ2x7DOVFWG2IrGb0=;
	b=FJZA1xrpzVyJBIJEbK1bZBFd+26S+RiwukjH5Y5ps8P+xGW2OfWFNM6GFLjsDn4kw4
	BO4p9AcrQS7jhSloLcMaZDZuQ52h0H81uuD4J/vFVseDm6rr1MYIjGapcaYcpiBZO25J
	1pdqRAiMusElcCv1/u/JDYvpr1yPQCAInkbQC+h6r3XD4DG34RgSzRcZquHX2EmkEjnE
	vHt6W5OMblrH6/3dHPhGNjx5vd5oPW6O9zRd6twEMBnfBnXCVC/L2V4Ye5MZBbBhpJPj
	TrYLaeQBOPNM2jXQSVSPNc2mXQvrVDIMhSuvBdb/sLupWsRqkiqcPb3/40QWxaWM73t2
	zulA==
X-Gm-Message-State: AKGB3mJokvdW5CjozLcqIv4a7WuTI7hv0YnajUSFkXfvI+07MbUxRdq8
	FEBkRyA1omfEsfwPBsUFho+tKw==
X-Google-Smtp-Source: ACJfBosOl1iIELZyPSaf3YJY9UPiKo33k9gizXVERTsS+qw1CMRSpYYFWT9rNWd+OtWM/O8S0JTXjA==
X-Received: by 10.84.149.102 with SMTP id b35mr15341670plh.240.1513528486260; 
	Sun, 17 Dec 2017 08:34:46 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:35e6:5321:54f2:87e6])
	by smtp.gmail.com with ESMTPSA id
	t202sm18393035pgb.75.2017.12.17.08.34.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Dec 2017 08:34:45 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Sun, 17 Dec 2017 08:34:34 -0800
Message-Id: <b5f213c31ad2f01c8edead8530667b8edaf03117.1513527416.git.akuster@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1513527416.git.akuster@mvista.com>
References: <cover.1513527416.git.akuster@mvista.com>
Subject: [PATCH 5/8] libxfont2: update to 2.0.3 with sec fix
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
X-List-Received-Date: Sun, 17 Dec 2017 16:34:44 -0000

From: Armin Kuster <akuster@mvista.com>

Includes:
Open files with O_NOFOLLOW. (CVE-2017-16611)

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../xorg-lib/{libxfont2_2.0.2.bb => libxfont2_2.0.3.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxfont2_2.0.2.bb => libxfont2_2.0.3.bb} (80%)

diff --git a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.2.bb b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.3.bb
similarity index 80%
rename from meta/recipes-graphics/xorg-lib/libxfont2_2.0.2.bb
rename to meta/recipes-graphics/xorg-lib/libxfont2_2.0.3.bb
index 08d1123..5f27a55 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.3.bb
@@ -15,8 +15,8 @@ XORG_PN = "libXfont2"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "d39e6446e46f939486d1a8b856e8b67b"
-SRC_URI[sha256sum] = "94088d3b87f7d42c7116d9adaad155859e93330c6e47f5989f2de600b9a6c111"
+SRC_URI[md5sum] = "b7ca87dfafeb5205b28a1e91ac3efe85"
+SRC_URI[sha256sum] = "0e8ab7fd737ccdfe87e1f02b55f221f0bd4503a1c5f28be4ed6a54586bac9c4e"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
-- 
2.7.4


