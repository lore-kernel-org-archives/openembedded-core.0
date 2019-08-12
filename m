Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id CF4AA7E553
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2019 15:23:37 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id u25so12120296wmc.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2019 08:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ptEYFPz83RYzl7jPGnhIkf0eWgkykedKy1fmztH5N68=;
	b=CSPYfZJM+PxE9FxJQHfamwbLUjw90aAv++g+G/fl3UyEGv5zYrHYEMVhWYmw3DSDmc
	QP/ApsoVcSt2p5thZGASXpS/UXc/xjYDNIFpURQ/n/IVvWmImTKqaiIopj3OKynJbjCV
	fnBdSW5ir4uYXoVBukcRcGlP8YPmG7sbe0lBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ptEYFPz83RYzl7jPGnhIkf0eWgkykedKy1fmztH5N68=;
	b=R4m/UtEFtPpww06J9vtFrWHmDNy5X9C6uEZsEvnanDvbrzSTrXKNVKmqsSUwIjx8/w
	aJpSFBBlrvb70SXR/fYkA2xpzzJS5ti/jvO8BD2eDJy+H62RttMaQEHQ7GF3LwdtEVdN
	xYsLfTzl1Y5BYbEmYSs/VKap8e+NXb6MNqGu0i0Hm0/o5KQlVh5k4BL8Ab1lHLX3o9rW
	Gckrn1WZicjhFeh0DhWaqi7Yf/+XFMlg90YaFSpHEoxQntdAWRWuWkLXQjzmH6qzW1nI
	i+vuO74cUpOaBLKs393xr8Ct+xtkK7/MDk/ty+Q3f0ntGleni4SAjYC5+9R4DBC+Q6VT
	CGgA==
X-Gm-Message-State: APjAAAWnpfaxYwHxJ8a1ivzZ6Y9HYpaKv+SX9LLkGkLQstpAk+22JLK9
	3G5BUlTzATkOaTCugU6N5sr72RaxD5Vobw==
X-Google-Smtp-Source: APXvYqzIFtpGiUe709qx7Vzfd/O//PrsT3riFXO4UzBDCTXez+/PojpwIpHQnVCDUQcwuoeeIS12yg==
X-Received: by 2002:a05:600c:292:: with SMTP id
	18mr28313891wmk.51.1565623418289; 
	Mon, 12 Aug 2019 08:23:38 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	f17sm19580291wmf.27.2019.08.12.08.23.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 12 Aug 2019 08:23:37 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Aug 2019 16:23:36 +0100
Message-Id: <20190812152336.3514-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] python3-pygobject: Add missing pkgutil RDEPENDS
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
X-List-Received-Date: Mon, 12 Aug 2019 15:23:38 -0000
Content-Transfer-Encoding: 8bit

With the removal of setuputils, there was a missing runtime dependency on pkgutil
which was breaking the selftests for gobject-introspection at runtime. Fix this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/python/python3-pygobject_3.32.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.32.2.bb b/meta/recipes-devtools/python/python3-pygobject_3.32.2.bb
index 453fdac2c8b..476957e8871 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.32.2.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.32.2.bb
@@ -23,6 +23,8 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 PACKAGECONFIG ??= "${@bb.utils.contains_any('DISTRO_FEATURES', [ 'directfb', 'wayland', 'x11' ], 'cairo', '', d)}"
 
+RDEPENDS_${PN} += "python3-pkgutil"
+
 # python3-pycairo is checked on configuration -> DEPENDS
 # we don't link against python3-pycairo -> RDEPENDS
 PACKAGECONFIG[cairo] = "-Dpycairo=true,-Dpycairo=false, cairo python3-pycairo, python3-pycairo"
-- 
2.20.1


