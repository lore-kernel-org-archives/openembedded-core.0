Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 43D97731C4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Mar 2016 09:47:29 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id n186so26612492wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Mar 2016 01:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=i/Ft1Fwqp7hINFjjo65mljbO00y4cBgbTVjT0nB5uo8=;
	b=wsxIPxtDT5x2XhjkJlz1kF8NqEBAXT7LbKNdtZbmAUZiaVWu4s1siLZGaEth+kAkCo
	sxaQ+a1EV6GJ7LW/z7wio8fJyhO9fuCHZRGy6U0740fcb5QU6e2p1HDqoYcoLffyil+u
	UN/UEqL9X5SS7FcC4yqTOU62hGoYJytIuTYRYHM76JjWoEIg6mGi3U756xzIky+RSVif
	0dBQq3zZqrYFVJMAuxEeio59rhhDt5A8rkQXRAh+v5PrPo53hZto2OGPO8a4kgvKwwC3
	+03+E7Kq+3D8SVt6N39MtxKGvCOJxmrZfoqKxpyVRAJLAE80jBD/VSr5mAdG1fi8Mm2j
	My2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=i/Ft1Fwqp7hINFjjo65mljbO00y4cBgbTVjT0nB5uo8=;
	b=PM/dPo4EEyf0R8Av2bosJl1AnJyyzvclpQha4C6ZISRy7Y6m4P8A6wG5zEsGTmrJ9h
	VwI841lSqvrZarB4zJlrGQpfhFx+wmgcWzaKabeguMksQweAOl/drategJYBiwI792uO
	/wgRdW1Jcq2+mVHaQRl5j0jvx/zRXjgU4ylW4EIppA9eKayYlM0FTE0AvefE1QD90b8y
	O2M0dBvjkGDOa8sKVxuMaSB9P5MvwDPNwaES5T0VQwigeNHny+jRkmMFeEkjK4RodTRO
	qIVkAqjma7POOlWfgrZgy+fm7/bJ68UsYzEbQ8aqBOKsIp69khLurC+9w29cipn0yUAL
	LanQ==
X-Gm-Message-State: AD7BkJKxWENrjy5q8H4I8YT/G8LRPFGJqgXC6zKYhz9gIzxWtuGsPtwhabmjpQ+nFMa4ZY6v
X-Received: by 10.194.60.100 with SMTP id g4mr7862696wjr.30.1457084850390;
	Fri, 04 Mar 2016 01:47:30 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id o16sm2503990wjr.9.2016.03.04.01.47.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 04 Mar 2016 01:47:29 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Mar 2016 09:47:28 +0000
Message-Id: <1457084848-21497-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] xcursor-transparent-theme: use a version glob in the selftest bbappend
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
X-List-Received-Date: Fri, 04 Mar 2016 09:47:30 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...nsparent-theme_0.1.1.bbappend => xcursor-transparent-theme_%.bbappend} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-selftest/recipes-test/xcursor-transparent-theme/{xcursor-transparent-theme_0.1.1.bbappend => xcursor-transparent-theme_%.bbappend} (100%)

diff --git a/meta-selftest/recipes-test/xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bbappend b/meta-selftest/recipes-test/xcursor-transparent-theme/xcursor-transparent-theme_%.bbappend
similarity index 100%
rename from meta-selftest/recipes-test/xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bbappend
rename to meta-selftest/recipes-test/xcursor-transparent-theme/xcursor-transparent-theme_%.bbappend
-- 
2.7.0


