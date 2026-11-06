Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5524.1793970214836675723
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 05:03:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=UzFhDf1b;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.43, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c347be93d54so6504666b.2
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 05:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793970213; x=1794575013; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gx7cJZTp27XKDa/D6tqXUH7BccgF3znA3x9uQjA+mtU=;
        b=UzFhDf1bejQWctVM0aAffMGYhFQULDSOGTZSnlwxaY95MA3CQahMxHcDE900U2o767
         JHKYpfGkV5B4w1+3pcAjRxuYP62nsTDcdn5h/ZmvsNSmDn7V9V+Psx1rdmPpr9c1mrIz
         8MiMLlky+uJfuG1w1ZzMRH7PcQcMG1e1CTmqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793970213; x=1794575013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gx7cJZTp27XKDa/D6tqXUH7BccgF3znA3x9uQjA+mtU=;
        b=PjjanMizVn/zwiTXFPzjCWt4BOzs4u3wv2GNbsiI3NBkTurvQLlR0orxiEdeWfG/jB
         K2gXk8qHjbW/QZOFnCovJx2nfqzfxsMmOh+zVqve5oAC28hNkFxUF3QzZ6I4wJlWUiZj
         8xdo/Qb+y0Pk6Kx8MtyN6UMxzVBdotiKs5ruzozDo3zRlB9Y76HfGW/Dyw7HcbbCVmi5
         wR3OF5prajJjlp1oYjZ2s36Li+jWlQX6U2qMtrT6n5rAFq2I09tAwlb5INAj8/26faCv
         wtT7yn6El39jS2JXrl9xLLDVRGW7xfmpFa8Tdu/VjC1Kyl0nkRJbjdbYqM+NoqSawohu
         H00A==
X-Gm-Message-State: APuU4Z/B5dEJs3JqV0X1gK5j6kQDS9/W47+KYQ3yhhSieeYUWdqDDD0K
	T3HMhMg6HjJd8ghDM9LII9Glwfwka5H849B3iKTfNCv8D/5EuhZdBrR0V2gzSBO0d3q5y3TM7qb
	WU4jNn6uBVw==
X-Gm-Gg: AYBFou2/vPb9tvPRwPXOmldXFXzUYZ7B1nanN1zRJX8AbAbJ2cOMH2S1U8qfKlhSxeC
	qi1MZUcGRgv3TX+ps3Owx688cRw/y3N5gM29Ca3v+IfVPFd5auFpVeicgN79gBkDSAkEWiWgRYK
	nsg4jct2yw7r9coBw3md9mgSBzgxcJo5XkxXd/sGdliPX2KXtvdMxvGAcgwctfBjsBYShgxk6q4
	k6BIcrjg0H+TL4/mvJ+Udj5t8CzzdNWYufzcbZPkUNu+2Sld4ZYv4BvV9SzNHgEgEJG0wcAV8qD
	4G6wQiBRVaup0AnffhnYEHaqvBhte8pUEfRCeg2MgRJZ3g6L5wqScqFqjuJ7uQDnlSNHgcxGxor
	AVjZxvmQuHR7mVxlknbozQAD93TIqDd+lrMHRRc3WqJjj0Uogb52V4VrMi4yDpIjwv8Uf0j82x0
	jnIV8ntHjTnsjGKk1rz7msLUqnFNiEZIXwk1xoKpkDOwyPdr091UPG/bfkmvpMxRLHblI3uMGvp
	MwicxWnltv5x0Ec7uwiVU1D8CwSgQNUmifPIF1DYQpCYMlu0oUS+/oCynulpVrUjsiQ8vrj8AO/
	NKP8SEmhvk4ERvaFJn9/qovnJLyInGpEK5+6bO/LCGINv9JQKbVdwyF8dsjpeyY4rRF6KATkAZI
	3UqZa51hihcVNGCW0icLVp2V8/tNZiC0hYufHSQFmopTrFz/AZfMwVqJB28HOucEgnMxYzu/m1u
	mREGiEVRiBX5edCNrJyMt5Gc2unB3LzQZQoknlUZcNwNRQn5OJ9zA37fAa5tXpzQBUXOy2zpeVn
	9Z232w1aYTJ1TQL67sCjDPbAA27RR6wnf8q
X-Received: by 2002:a17:906:f50:b0:c46:ae89:cd3c with SMTP id a640c23a62f3a-c4d3466c88bmr239461566b.1.1793970212959;
        Fri, 06 Nov 2026 05:03:32 -0800 (PST)
Return-Path: <adam.duskett@amarulasolutions.com>
Received: from adam-linux.arnhem.chello.nl (2001-1c00-8181-e800-030c-182b-b2a8-e89d.cable.dynamic.v6.ziggo.nl. [2001:1c00:8181:e800:30c:182b:b2a8:e89d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d354ac3f3sm81222566b.7.2026.11.06.05.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:03:28 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v13 2/4] rpm: add 0017-critically-fail-if-post-install-fails.patch
Date: Fri,  6 Nov 2026 14:03:22 +0100
Message-ID: <20261106130325.2154855-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106130325.2154855-1-adam.duskett@amarulasolutions.com>
References: <20261106130325.2154855-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 13:03:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249645
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

