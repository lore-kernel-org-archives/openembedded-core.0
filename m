Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2253374CB4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Sep 2018 15:50:10 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id c14-v6so4970740wmb.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Sep 2018 08:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=rN+xTzd27pWuY8YL6LSXa8anGeFP3sW8uWfwoNok6mc=;
	b=jHC2DeU2oHwZtpHvowbeB1oHhEUg4POzc6KovE8T5u3XuOoxzU2nPc4vo2S4rj2Yw0
	NeBK20uVBYXsOzB4xZCJYBljI7p2pwkbmBcQ63fFwdSqmYgaSsuoFW+dJyVToGSSXsCP
	yprW9obsHhcC5dNDjglkJxD78dsJvZfGlJdcguIkJ9HL/mGlpm74XeXHgjPI4xEmPrAy
	Oqr5cCj6QOiyu7aOn7J34yEDsesDigQ7xtbI5lwDR6dzZifm1n52EchPQqBR6QFjLq/s
	CH/a78R2rRobnjmFmLAZKc9FUzL4FJCwAGBpe+PEoG2zi4HamHmyQvFw8a+4ChY+qthZ
	NHOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=rN+xTzd27pWuY8YL6LSXa8anGeFP3sW8uWfwoNok6mc=;
	b=gjAEUm9HdljMB2hU7BX28X2B+2RvJ37ru84HSvJoIzmH08ysfzqdKyppEg+ajace2P
	qtiucyYthYmRmuva5kcBJ7+qBTYEQ3hVEOD5WlwTPMyL4PS4IOv6wQ1RAnprnkzrozeW
	6glFwnPwIohnNLGKjVbyx/nCHEFozLRy+fE6MvFo6XOhLN4PTP+LrXNosYbjDnrEcY11
	ZBQIhHWO6+f7WlKB6M7bQbbKtt5LFRE6gOSP9Lbp3FotmQsIiI+o9QNpEH4R6d4MfIKA
	IxGBjlCLRJT+ZhIKEq2+V9/1wkqtMJ7CnnV8DHSfwM65ZJ56XlOndEXdVPrXfrmwhEEB
	+XMQ==
X-Gm-Message-State: APzg51C6wQnGg1gOzoLDAeOR94lGEzPOi3/C7dYcbultJPhmcgV0oKI4
	zGQra9eC/grYcXwezVpNOj3TYdkfMLQ=
X-Google-Smtp-Source: ANB0VdYFf01jzR7uuaZWfYozwwkA3PHqrwXp0++6+rddP6ZvwhncETzcQdaiMF7AN4Rvmk4F0wndNg==
X-Received: by 2002:a1c:5f82:: with SMTP id
	t124-v6mr2963768wmb.14.1536076210500; 
	Tue, 04 Sep 2018 08:50:10 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	w18-v6sm45231059wrc.38.2018.09.04.08.50.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Sep 2018 08:50:09 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Sep 2018 16:50:00 +0100
Message-Id: <20180904155000.3715-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Cc: Joshua Lock <joshua.g.lock@intel.com>
Subject: [PATCH] os-release: fix to install in the expected location
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
X-List-Received-Date: Tue, 04 Sep 2018 15:50:10 -0000

From: Joshua Lock <joshua.g.lock@intel.com>

os-release (5) recommends that the os-release file be installed in
/usr/lib/os-release and that /etc/os-release be a relative symlink to it.

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/os-release/os-release.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/os-release/os-release.bb b/meta/recipes-core/os-release/os-release.bb
index f9887047561..c6e36001dc5 100644
--- a/meta/recipes-core/os-release/os-release.bb
+++ b/meta/recipes-core/os-release/os-release.bb
@@ -1,7 +1,7 @@
 inherit allarch
 
 SUMMARY = "Operating system identification"
-DESCRIPTION = "The /etc/os-release file contains operating system identification data."
+DESCRIPTION = "The /usr/lib/os-release file contains operating system identification data."
 LICENSE = "MIT"
 INHIBIT_DEFAULT_DEPS = "1"
 
@@ -42,6 +42,7 @@ python do_compile () {
 do_compile[vardeps] += "${OS_RELEASE_FIELDS}"
 
 do_install () {
-    install -d ${D}${sysconfdir}
-    install -m 0644 os-release ${D}${sysconfdir}/
+    install -d ${D}${libdir}
+    install -m 0644 os-release ${D}${libdir}/
+    lnr ${D}${libdir}/os-release ${D}${sysconfdir}
 }
-- 
2.11.0


