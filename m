Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id F420577143
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Apr 2016 16:10:49 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id l6so30305244wml.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Apr 2016 09:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=bQcS7RB87IAdptyOQkhYqK/PnJdH1mO3IkwySxAlrbM=;
	b=rXPqc6CaJF+Uv6hfhESNmSIBs2ev5Z3U2/XOC/IRrfIO07pUzoHFOaGuCokiFTasMm
	H9aszu1i6x7naXXAUxU6O9QVUfg0FhjMUskTsYyxRY8z6biPc0DHK3vfuMwT6fPbca0T
	VVYEOK6CjGuWqjcYxJc+tiZewHh4fp7LyeQ2tRCYe5BXNTzN3vb9CKX7oQ5rDAYKPv59
	vSw381Fs8zRzFWAGvCTkuv2qiMeVQ7g8ZMadzxiSUdGyUh30z8wUinV6ShP8ZXKsN2AN
	8Njyj1JQmpVPNQAX4YoCX6k+JYmSjQBr3E9WpRoRekXpDjoaNEg/itHjyzNvICOzC2G+
	ZvlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=bQcS7RB87IAdptyOQkhYqK/PnJdH1mO3IkwySxAlrbM=;
	b=hZjNAnlDAfVKDUWErKHVrxWL+dtprTnHSG3Di1CBZVran8apXXTFlM7ToHsTWOzKdc
	Q2Mxxja9wDFGzeoM2R/oWIhxi94ImrUa1KSuaYQ48lMleYJkJf/Zn3qskv6ll/qRV8iY
	0ZJzMyEbfOeJ2Clh59eIkda/UpEOIjQRD44AEyE0Y2EqhXrE+d7wNBphelQwSCIhiCWo
	0/w3ptdjQBMY1F/P59SenzxwuH86Yh9PIHMBZQj1AhKmi5xitRsg4vXA8Ly8YE4S9qL3
	FoNWKiPez1HOK/xbfgDNIzGnsq/l4DXbLlwrGWzmHQRmiKCgAFx4Y0LE/WczYlYGladn
	2Azw==
X-Gm-Message-State: AD7BkJIcw3jfQMyJVVbhbfZlJnNNtkuy7E3/TBN0+aKHl/Y5EGqTwwedlFgYBdA2cUayL5qz
X-Received: by 10.194.23.7 with SMTP id i7mr4586233wjf.9.1459872649902;
	Tue, 05 Apr 2016 09:10:49 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	wr2sm35479664wjc.49.2016.04.05.09.10.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 05 Apr 2016 09:10:49 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Apr 2016 17:10:44 +0100
Message-Id: <1459872644-6381-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1459872644-6381-1-git-send-email-ross.burton@intel.com>
References: <1459872644-6381-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] gstreamer: remove now-redundant expansion in do_split_packages
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
X-List-Received-Date: Tue, 05 Apr 2016 16:10:50 -0000

do_split_packages now expands extra_depends, so there's no need to pre-expand
it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/gstreamer/gst-plugins-package.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
index 3cef1d3..c24493e 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
@@ -9,8 +9,8 @@ python split_gstreamer10_packages () {
     do_split_packages(d, glibdir, '^lib(.*)\.so\.*', 'lib%s', 'gstreamer %s library', extra_depends='', allow_links=True)
     do_split_packages(d, gst_libdir, 'libgst(.*)\.so$', d.expand('${PN}-%s'), 'GStreamer plugin for %s', postinst=postinst, extra_depends='')
     do_split_packages(d, glibdir+'/girepository-1.0', 'Gst(.*)-1.0\.typelib$', d.expand('${PN}-%s-typelib'), 'GStreamer typelib file for %s', postinst=postinst, extra_depends='')
-    do_split_packages(d, gst_libdir, 'libgst(.*)\.la$', d.expand('${PN}-%s-dev'), 'GStreamer plugin for %s (development files)', extra_depends=d.expand('${PN}-dev'))
-    do_split_packages(d, gst_libdir, 'libgst(.*)\.a$', d.expand('${PN}-%s-staticdev'), 'GStreamer plugin for %s (static development files)', extra_depends=d.expand('${PN}-staticdev'))
+    do_split_packages(d, gst_libdir, 'libgst(.*)\.la$', d.expand('${PN}-%s-dev'), 'GStreamer plugin for %s (development files)', extra_depends='${PN}-dev')
+    do_split_packages(d, gst_libdir, 'libgst(.*)\.a$', d.expand('${PN}-%s-staticdev'), 'GStreamer plugin for %s (static development files)', extra_depends='${PN}-staticdev')
 }
 
 python set_metapkg_rdepends () {
-- 
2.7.0


