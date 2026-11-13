Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12344.1794579784051185604
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2026 06:23:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=TK6O2bme;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.208.54, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6aa77d4d968so194835a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 06:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1794579782; x=1795184582; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jFCIBdUZJ3DiUXx5T0+rgY/GVJEPpW7BSEdzTl3MkfQ=;
        b=TK6O2bmeQK/CSadwjt0OqoYCxlO+6JRIFDu/xTc6N0Ct0HhiwH86RscjVo27sJHa8L
         /fAL2no8XaXDC6dF9wYZeePPlyzqSHPU07BmBoGDrYec8wlt8Yhjimvxczqd8GAfM7n8
         agXpJ4kfCLpAM/Qw00mou8Iy7Pyj+kmFUPfeo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794579782; x=1795184582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jFCIBdUZJ3DiUXx5T0+rgY/GVJEPpW7BSEdzTl3MkfQ=;
        b=tZuNfx95F/ZY2Hw+JRpqJyWz6VCbpdHnl2Mit4/X5CL4xkmyab9wUXCA1BBo3/7XGc
         Pm/PpsHB2Hq35bCHZD69LiXOXeamgVsfLiXH2Nqs5cPzVaGFfRToRXyiGaJvNYtXxnYe
         bxTzI2ofUoGG5s79ikskMoUKuOtiiOQwBpHeEzltA0bfJ+azRauyNvW3OSeox8m0eR8p
         gla4g0z59MU7Jb7clkBYI+MqiIxnvo6+Q0NSTr1+XhGbuGY/vN/Ui2Ln+CoyePcoVtwx
         b30XJdF++t9nNfe6hxsANeCduWc9WIlnRovkSO2Dca8KMK+mPb/LI87uk4nvrGioYfSu
         NhJQ==
X-Gm-Message-State: APuU4Z+E+kipvhVoF+g8JSfAwGljwgxTbWttIGK14qjXih3zOZ3TKxvr
	bO4ffkyghGZQPIbEDkAte5GIT1b5w+fqYXlch8EDHXXb09fDr+bsgJ+uVZoahMqwLV4F8TeN9s4
	uZGKDmnw=
X-Gm-Gg: AYBFou17YABQvp7YvJiBGrMf9YFy8QZamlMW77oMBMSu8FRBCZUIkFfjB9mkDz28Fs8
	9VOPD/hjKwh8XyGUTjl26KWyNOXcNDlZe/fh9FDppDM8V4YCLyGza8ODfU++KzGWpVcHpbbVgFO
	S4Yim9gFXDpIcX2eBNgaCoudEHD3F3ywJSSeF0E0k4qvgGQf8yji5vWnrBYyx55ogQB5aiV7iZl
	NYp6g986RWY2cpCDwM/j2JL/ytYY8iSJCA5Ph4ko8SU1l9dxPSnyzif+GN72fZnK/BSFavmMMP1
	1STSY78FRb4fbmDG6Ki+QWjHn/k/IxtYgeby0EOANBano72puE9jESzVuibo9pWAC6Wy/K0NMtf
	RqLfImvfQtHQsbqclHWZewofQygt0e9vDUyGrDtUxnWr9U5+Ro3NFkynVK+FfpPyaPk1Owma/kp
	5fyNEpiXr2Z1UkLoB//+YJI6ONPev8bfLfPg2GZw6kosgzx5rX3T+EtuPi308EJ6z0pQ4nsJT9n
	CSN8lGJuwwMaD8NHp9h+WLHK2bQM0LTj1Kg5V/q8I3leIxxOkmmWfpCBMPSqb4I0HNnRvbEyiWK
	TdHWD9yCEPQJybaT9vUp+q1aqaUQ3AZgORsQqcY6KjHWYEDOmMgQ1exsoDHhddVtywN7RVZu7Av
	RlcdqKz1fh3HRsyPIjlEbHtgr9RTVqqB24RfDU+ZWL6JAkjVPe51VfmzBAHR1Qy1UdR7USicAAs
	KY3DmCJLooSp/t3aOQUdo7JGdADNXvA6ppLdYC0+6vVnunDYnU1Ew52wnU56CLLABfiSIiClvdh
	H1grWvVVHaqMy0kmal3AOj40+FcbBZacXVv
X-Received: by 2002:a17:906:f6d3:b0:c40:5ee3:8694 with SMTP id a640c23a62f3a-c5096347528mr260260666b.4.1794579782073;
        Fri, 13 Nov 2026 06:23:02 -0800 (PST)
Return-Path: <adam.duskett@amarulasolutions.com>
Received: from adam-linux.arnhem.chello.nl (2001-1c00-8181-e800-030c-182b-b2a8-e89d.cable.dynamic.v6.ziggo.nl. [2001:1c00:8181:e800:30c:182b:b2a8:e89d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b8651bsm104620666b.78.2026.11.13.06.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 06:23:01 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v14 1/5] rpm: add 0017-critically-fail-if-post-install-fails.patch
Date: Fri, 13 Nov 2026 15:22:54 +0100
Message-ID: <20261113142259.1708386-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 14:23:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250171
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
2.56.1

