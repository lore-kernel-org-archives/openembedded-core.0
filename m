Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8909.1793798465313753897
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 05:21:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=d4izVXUD;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.45, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c41d20c016fso12792666b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 05:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793798463; x=1794403263; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gx7cJZTp27XKDa/D6tqXUH7BccgF3znA3x9uQjA+mtU=;
        b=d4izVXUDejn8y2RD3/7HVMA7F8hLsoBewRyZUpzHJYyXiX+qFX4FdQ73LmPQAPvE8d
         CMT4/YkO8E41wSlfyRR+GEZyEpeSgLs8y1rikiKLWQZhtrIJiyfonddaFQEYfdZo+h70
         Bz4wjiePnXPzWwvjbQiwGiZ1vdAE5touBBqCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793798463; x=1794403263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gx7cJZTp27XKDa/D6tqXUH7BccgF3znA3x9uQjA+mtU=;
        b=d6mPG/iwPbjHuBbWzKvege0DTCi5et8wtgLMTVwYWmpcd+zPIv5RI9L5SZINFNF6ce
         jmy3q1E84IfFHMIhOZMHGAuClJoCl557NTN9nj5KjZX3XvIdXeCTuk+S3vtkE+0EJkVE
         Zik+SdAh5ypbL55FCNWDWenOc8F3otz8IbIaaMV6/6R+WO9Uh3R7GrUFL0IGoKLveGpV
         Vv4tQCshvXDIOI5gLIWo8Qg0N2fh+8gzb+PTgE6053uk5W25HNymkBfIyE4zEkkzVER/
         z6t634kSdyGZH/Z7VU6A7K+HquLvCYdFl0vV836NncxoCYpTumTjdj+rGPkMZIGWfiKw
         w9AQ==
X-Gm-Message-State: APuU4Z/nN4AQR4lxk6wNt7+BYsvyoTiiWCAMhhZbQghwy16Oth/Nw9zL
	TwnIUvlQp5aWTxL8vBaaDMudDMJ3958yT1qaikbwDt0EehMEBEz+luewiIsLT3v+HH4ga6JuuIc
	ePrCO2T8=
X-Gm-Gg: AYBFou1rJG1WAcL3o3lEDgR1QlQd9xAAu2q7P3ZheLs52JRiIRxBkI3zBJVzG7Fye4m
	SUpcv/CXfWpPBChseUzCX3UgEHCBofkcaBkQiKfxIW+PQ4yBNjBPzl7quP5JoULAF+CILbGuv7T
	tCevKfY2iacuqcAsIiibg9xllRgrXjOG2Xa2mT4pW1JV3ehZOir9YihehILTG4WzmViV4uLONTf
	ZqgKbZmFjRKFbithZS/JUETM4gh7U2WgRetdoHlK+ZH/0uWuv4WlcCDQ7xZoPYfP8rAKH/Tiqx2
	v/RXsbbGwb0OES1LNv4dmyHfIfeMUTtecK5gvNp7T3Giw48AP0zotM9K7vwr+aF59rEiW0Doutc
	cRkiMoU0XBdIPBg43cI26pVCNibFKMy495g+kJeE6Qwmw5t77Dn7P5sx3U8WJwMD1Wx6EtkL+CG
	xDB+eiWIz0pO+vB1xF1Iu4UPE7b8oaJEJT0ewjXLZakmmkmf9k4dOYJScSXBHh0aQauzmOYlJB5
	bpxK3UY9S3FVX06edAN7FIqTrDmhd0+I2tws1ULgkQC8HytdmiMl/B/T+oagcykSouZFAAxFp8/
	xc3Zao9EyKzKCA9T6rZl+lckKulOPSdMpQ35pe8d76EX3CYfM84RiGD7LyrHf6AVpwqG5rwnJ6b
	MZ5csnu6AvqLa8Jojgruuiz1ruGDXKvcjZFIttInIY3NV0zZBtekvStlR8rNXxBIupHURai6Qbx
	rOek2BzE3P8tDs/W6JquritqRbN9rOTkg=
X-Received: by 2002:a17:906:c0c1:b0:c40:b180:db3b with SMTP id a640c23a62f3a-c4ca7a6b633mr1253158366b.3.1793798463527;
        Wed, 04 Nov 2026 05:21:03 -0800 (PST)
Return-Path: <adam.duskett@amarulasolutions.com>
Received: from adam-linux.tail032493.ts.net (2001-1c00-8181-e800-030c-182b-b2a8-e89d.cable.dynamic.v6.ziggo.nl. [2001:1c00:8181:e800:30c:182b:b2a8:e89d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e140f93sm70343466b.6.2026.11.04.05.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 05:21:02 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v12 2/4] rpm: add 0017-critically-fail-if-post-install-fails.patch
Date: Wed,  4 Nov 2026 14:20:54 +0100
Message-ID: <20261104132057.607953-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104132057.607953-1-adam.duskett@amarulasolutions.com>
References: <20261104132057.607953-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 13:21:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249377
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

