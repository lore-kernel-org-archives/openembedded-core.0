Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 5208F65CC2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Feb 2016 20:56:15 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id c200so182007312wme.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Feb 2016 12:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=NgG1aEo6R1NJrQlHyyQQ4o1WDJVpJ4a9P64u7Mvjy8s=;
	b=kfK36FYhw9a97sqMo/mITmMDkpOlRxwO7fUdTKRYMEUVo/E+YEYCA05KStFOy0NR/R
	5pT0qG+shMj64e9qyMCli7aP6wXqVeFqHNRI6kwK8fR7Efj8xSgDCFVGmEZqD8phWnwJ
	yFE5TEZ2+QWy6++XxkRUk4baBJ8TIieHmYd32NcMO2+WFLvXB/LTgiF4YbhL4VeEtwOi
	dPEkh56qWsK3z97i15WaORKlszN6iFnXeELbxB6ri5kA51Xta9621sD1UiOv8K2U/Ux8
	bKMxJRJ4T8KhALauXV9LbjdL7hINq/ZDpsxit2j9MlhTUQTGe2zet2aeMrmfo5YFG1ii
	rRLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=NgG1aEo6R1NJrQlHyyQQ4o1WDJVpJ4a9P64u7Mvjy8s=;
	b=gV4EhpVwgka4iU24zRPbkSs5tM50sgzJssiq+3D64c1t7LwthOBK/HEAO4Ym8KajqL
	8fhUMvMcOLdmrp3zNIEEPlutX9T9aek23gAbzOlsOS4w8Mol08fIF3MIupB1r4KrEyjN
	PyeWQU27OnL5aakX++vOgDb5Aax/OzHBPOgxzd3nQ+UMYo1JAJyjq+NsbuWybcp/9hLz
	c1m9wB6cAuLdivCa8oXql5u8B7Ec5sKyzbpDUgeYpjdbu5OBUzT1ySs7GlZdPQniBZ1t
	FL5t0m2a+TKnUknEKITvOLCmEHmonw/C23fcVm/DkjuOXBcmEC6nC+BpeLN8mudURHqc
	IqjA==
X-Gm-Message-State: AG10YORm1/kyk9fm4uT61+SsxvE3DDdfB1UNouZWxsUcri5CbEs/ipWYcbFY+89HZjk83Q+8
X-Received: by 10.194.185.237 with SMTP id ff13mr27412542wjc.129.1455656175976;
	Tue, 16 Feb 2016 12:56:15 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	m67sm22113221wma.10.2016.02.16.12.56.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 16 Feb 2016 12:56:15 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Feb 2016 20:56:09 +0000
Message-Id: <1455656169-17396-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1455656169-17396-1-git-send-email-ross.burton@intel.com>
References: <1455656169-17396-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] glew: upgrade to 1.13.0.
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
X-List-Received-Date: Tue, 16 Feb 2016 20:56:17 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/glew/{glew_1.12.0.bb => glew_1.13.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/glew/{glew_1.12.0.bb => glew_1.13.0.bb} (90%)

diff --git a/meta/recipes-graphics/glew/glew_1.12.0.bb b/meta/recipes-graphics/glew/glew_1.13.0.bb
similarity index 90%
rename from meta/recipes-graphics/glew/glew_1.12.0.bb
rename to meta/recipes-graphics/glew/glew_1.13.0.bb
index f1707d6..a25c405 100644
--- a/meta/recipes-graphics/glew/glew_1.12.0.bb
+++ b/meta/recipes-graphics/glew/glew_1.13.0.bb
@@ -11,8 +11,8 @@ DEPENDS = "virtual/libx11 virtual/libgl libglu libxext libxi libxmu"
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/glew/glew/${PV}/glew-${PV}.tgz \
            file://no-strip.patch"
 
-SRC_URI[md5sum] = "01246c7ecd135d99be031aa63f86dca1"
-SRC_URI[sha256sum] = "af58103f4824b443e7fa4ed3af593b8edac6f3a7be3b30911edbc7344f48e4bf"
+SRC_URI[md5sum] = "7cbada3166d2aadfc4169c4283701066"
+SRC_URI[sha256sum] = "aa25dc48ed84b0b64b8d41cdd42c8f40f149c37fa2ffa39cd97f42c78d128bc7"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/glew/files/glew"
 UPSTREAM_CHECK_REGEX = "/glew/(?P<pver>(\d+[\.\-_]*)+)/"
-- 
2.7.0


