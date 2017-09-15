Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 9FB567864E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Sep 2017 11:58:57 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id a137so2468823wma.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Sep 2017 04:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=AKFYtX4AQCjc2UUt4+MpcoM8Ed5/48ThYKKqd4P46s4=;
	b=oPzCT4RwizHNDgXsTxGpnWJbJvLunfkK0HNKzMoZU99v7kISqzz2WAO3vogzJNwUzp
	gKEhC5VymxWfkCWXOATlwUTLnCUGBONbcQA1UP7aWKTMha93lFmjmjYzCqwIVDRL+/wC
	7EZOyJpe4OTJssJcD++u1bAe18Co4et4yS/nuGvoq5BGQ/0WRY++sjTSirS9/3NOZtpK
	6N+mpoVf4oVJsEVO49cq+9DSxgWWsTpSFbXbbfKVV+fa88z5UtLH8jcZVPEICynrJRzg
	DmDo6DC+aRrcCWWarzdfq8QqGQ1K6AozZ7SrAqyRYRZeAoeE1f/geMbc3lesSC/GOGDo
	x+0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=AKFYtX4AQCjc2UUt4+MpcoM8Ed5/48ThYKKqd4P46s4=;
	b=h8fSlWy+lo59yC0k+o6iYyXvU/LYco+r984i3SLyQk14PoyAyGdqb/aCuQ190wl47H
	BvUGyYEL91iUu1BZhTodS7pge4V22JwtwDn2BcQmkltpPEZxbUHfFwI2uxCcXBTGNghw
	i4j7EsbB5Of5dnw9pvv4vvVijgmQm8KEs0I6o86Na8TgGo2G2TC9kLqywazQbp1rizVy
	21ajQM9xnPbNQwiZZGJXUo8AhbqOCj4SAnit/duPOQ4cAuj4jHpIQ/BxV6jUDwj5EpVo
	sXBz/CFsp9n81ePgr9ozsjTqp6IdfzQ78no8wFPjyigbWyKYa9tV2nqXXFnA4kYvfedT
	jcaQ==
X-Gm-Message-State: AHPjjUgiSJbSa0UFYaWWD8RwQSLzSfwTRjRMIZga4rlkPhJ/vW9/OMW9
	HKeNSZw+Vkz6EOLbqYY=
X-Google-Smtp-Source: AOwi7QAn8/pkWE5IY+FSw6x7h2/IE28JKSGz8YjGghAWxz1+Kbws1bciEk2Zx2iaIf5Z5Bx0o82UhQ==
X-Received: by 10.28.38.198 with SMTP id m189mr2395828wmm.28.1505476737318;
	Fri, 15 Sep 2017 04:58:57 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id s86sm894994wma.24.2017.09.15.04.58.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Sep 2017 04:58:56 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Sep 2017 12:58:54 +0100
Message-Id: <20170915115854.4990-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] libproxy: use stable download URL
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
X-List-Received-Date: Fri, 15 Sep 2017 11:58:58 -0000

GitHub automatically-generated tarballs from tags can and do change over time,
so change libproxy to use the uploaded tarball.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/libproxy/libproxy_0.4.14.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/libproxy/libproxy_0.4.14.bb b/meta/recipes-support/libproxy/libproxy_0.4.14.bb
index f91bd67f7b1..4c39f52ff2c 100644
--- a/meta/recipes-support/libproxy/libproxy_0.4.14.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.4.14.bb
@@ -8,14 +8,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 DEPENDS = "glib-2.0"
 
-SRC_URI = "https://github.com/${BPN}/${BPN}/archive/${PV}.tar.gz"
+SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz"
+SRC_URI[md5sum] = "e7514f78f5432210e17a01b6b618dde2"
+SRC_URI[sha256sum] = "e25d046850346a505c0617646f1e68b660092efadf665548a89c280900262ea6"
 
 UPSTREAM_CHECK_URI = "https://github.com/libproxy/libproxy/releases"
 UPSTREAM_CHECK_REGEX = "libproxy-(?P<pver>.*)\.tar"
 
-SRC_URI[md5sum] = "272dc378efcc3335154cef30d171e84a"
-SRC_URI[sha256sum] = "6220a6cab837a8996116a0568324cadfd09a07ec16b930d2a330e16d5c2e1eb6"
-
 inherit cmake pkgconfig
 
 PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gnome', '', d)} gnome3"
-- 
2.11.0


