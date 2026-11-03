Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13187.1793717961004978018
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 06:59:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=YFA04yRa;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.54, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c33700b6435so108595566b.1
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 06:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793717959; x=1794322759; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gx7cJZTp27XKDa/D6tqXUH7BccgF3znA3x9uQjA+mtU=;
        b=YFA04yRa0KNOwK4PA3BKnbWvxMyqyclnae7EulpGXNZTCNYPGl+jjkrOa6NwyCpsP1
         w+/UcqV2/GrGpIBp8AA6rwcPTjoBreKTa0+P+UerU93godAp1yr1+qzK97VnHj6B7r8a
         iYsX0XLEgv3rAWWuOGLWeCmR74kIOjc1h11Co=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793717959; x=1794322759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gx7cJZTp27XKDa/D6tqXUH7BccgF3znA3x9uQjA+mtU=;
        b=ckeZ8Rsl5CN0H9ktlRsGyKbVypzkkQSxL3HNNqwHfnfBi8iXygXbBdEtMwQx+yOjLm
         TE1+Z1evSYB81S+SnX2uwWl5Nt8qOgt4at9FgKPi3DgGcHxgem81jxQp4X88/9b5vccA
         cc5v7Bu0XZEE7eGIHMkKvCjuy4+u/HJco1H1/K9lYh4sPpaM44n2e9ebigvfJFJ/mO+M
         BNQPK2mS+pp7smSFfQ8ajSxiaRnQWLGCTc6CHyacUbsAk6aKxLAgJ5OuWsTXXeKvWQ3B
         KUJ/3AKuIZz5siLkfqvvv2nB2c3wxYKgghN2+zmK3ujVUZdIq2TLZlKPdLnNJAf412yY
         hHWQ==
X-Gm-Message-State: APuU4Z+PwX4sKDnf3pNTFxfg9yfI/GbQgfzVsXAKoo4T9pjED/IKFlya
	oI2bG3RNK5LTi1rznewXbgNQK6JsJJGa5KqIdulE150mYOhCgj9eJiTKvMGAvqY3FUk+v3T10pk
	6WwmO1x4=
X-Gm-Gg: AYBFou16KJTeFkWM7lCe0hSCXnJ6qPaiIkATz3xbHTabnt0rRFxl9ijnrZp3VkNZwY0
	BCT6O6ebrCCq5GAHpEsxYOetfWEAAQGP5rMZ7I8b8dp6HixEJ6yE8Z09G3t5l43aUVpSSb7UVuf
	fVivUSoV6vWX4tnSMmQRf7hgLvHdi2eXoe029U2ZZ7Q8nRO075CiZaZCTPbajSbjilEGu1k9LuN
	c6AfmUq0fvU9lYnSpK1SRtg/k89dCVTj1Aj9GTKbw0jIOH+X6VWXRAtnSvMXg8ywwg1hyXMim3m
	SkGzCu8lL3CpdgE1vtLOHwqqEDNP8bCfvNfYQUz0tLSQlWouYSgW16Q0wonYjkL8TIg+vro+Ypm
	Wo/RR4+l7+geNgUj0ZDCgXb88gK2U+/Qrt0at15DRByJQLxRgB8RX/5EyOr1gv0v3rEcBtGyGsm
	LkaDaE4+vgxjWBO5VDDBWskASAH0i/oh+uGj8o9FaF3wpaY+4ecobG0SzLP8kxLCwkc7bhSgq5d
	ToLpu3mC3NgRuDAuBq/V21mqzo8qOeh7UsjlyWWdJvsfIMVhOeEvHl+0nfMfUIkZTz8RzOxbKSn
	Bi9TuQPSvbCfMnk+bm2BJ9Njkk1COFxzLR/qBhWoZHzQEyALLUjpEuzRoSfc8ITcdNeLRyl4CGH
	QhZvw61I4eIH9HHD4VgvYuOkNWpagdIGot6NdUOTJbRRw1hJNoe6/ZM+T0tLAInW+bWpKIWNVoT
	RHMxqkITHdGwfjUf7k42YfEoMMlkSv2Pa/pgaLGw==
X-Received: by 2002:a17:906:6a88:b0:c2e:3698:dbba with SMTP id a640c23a62f3a-c4ca7a72e75mr1173513866b.4.1793717958863;
        Tue, 03 Nov 2026 06:59:18 -0800 (PST)
Return-Path: <adam.duskett@amarulasolutions.com>
Received: from adam-linux.amarulasolutions.com (2001-1c00-8181-e800-030c-182b-b2a8-e89d.cable.dynamic.v6.ziggo.nl. [2001:1c00:8181:e800:30c:182b:b2a8:e89d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cebf3dcd8sm96379266b.54.2026.11.03.06.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:59:18 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v11 2/4] rpm: add 0017-critically-fail-if-post-install-fails.patch
Date: Tue,  3 Nov 2026 15:59:08 +0100
Message-ID: <20261103145914.1229467-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103145914.1229467-1-adam.duskett@amarulasolutions.com>
References: <20261103145914.1229467-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 14:59:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249285
Content-Type: text/plain; charset="utf-8"

Starting with commit b5fe8a926aeb80e3ce84787e7624685326a2f412,
DNF5 respects the callbacks of RPM and no longer fails unless
RPM reports a failure.

RPM does not report post install failures as critical. However,
Yocto does expect DNF to fail on post-install failures.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 ...ritically-fail-if-post-install-fails.patch | 34 +++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_6.0.2.bb        |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/files/0017-critically-fail-if-post-install-fails.patch

diff --git a/meta/recipes-devtools/rpm/files/0017-critically-fail-if-post-install-fails.patch b/meta/recipes-devtools/rpm/files/0017-critically-fail-if-post-install-fails.patch
new file mode 100644
index 0000000000..05e8ba0cf5
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0017-critically-fail-if-post-install-fails.patch
@@ -0,0 +1,34 @@
+From 390841ea7870408826fbddacf50f07a70778a22b Mon Sep 17 00:00:00 2001
+From: Adam Duskett <adam.duskett@amarulasolutions.com>
+Date: Thu, 30 Jul 2026 12:48:24 +0200
+Subject: [PATCH] critically fail if post-install fails
+
+Starting with commit b5fe8a926aeb80e3ce84787e7624685326a2f412,
+DNF5 respects the callback of RPM and no longer fails unless
+RPM reports a failure.
+
+RPM does not report post install failures as critical. However,
+Yocto does expect DNF to fail on post-install failures.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+---
+ lib/rpmscript.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/rpmscript.cc b/lib/rpmscript.cc
+index 97bd8da62..a354d944c 100644
+--- a/lib/rpmscript.cc
++++ b/lib/rpmscript.cc
+@@ -60,7 +60,7 @@ static const struct scriptInfo_s scriptInfo[] = {
+ 	RPMSCRIPT_FLAG_CRITICAL, },
+     { RPMSCRIPT_POSTIN, "post", 0,
+ 	RPMTAG_POSTIN, RPMTAG_POSTINPROG, RPMTAG_POSTINFLAGS,
+-	0, },
++	RPMSCRIPT_FLAG_CRITICAL, },
+     { RPMSCRIPT_POSTUN, "postun", 0,
+ 	RPMTAG_POSTUN, RPMTAG_POSTUNPROG, RPMTAG_POSTUNFLAGS,
+ 	0, },
+-- 
+2.55.0
+
diff --git a/meta/recipes-devtools/rpm/rpm_6.0.2.bb b/meta/recipes-devtools/rpm/rpm_6.0.2.bb
index c27f58a0e8..a8f35f87bf 100644
--- a/meta/recipes-devtools/rpm/rpm_6.0.2.bb
+++ b/meta/recipes-devtools/rpm/rpm_6.0.2.bb
@@ -40,6 +40,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;protocol=https;branch=rp
            file://0001-tools-elfdeps.cc-Remove-format-module.patch \
            file://0001-macros.in-Set-_pkgverify_level-to-digest-as-RCPM-4.2.patch \
            file://0003-Do-not-install-the-pkgconfig-dependency-generator.patch \
+           file://0017-critically-fail-if-post-install-fails.patch \
            "
 
 PE = "1"
-- 
2.56.0

