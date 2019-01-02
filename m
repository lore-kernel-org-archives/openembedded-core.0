Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id AD3186BA9C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Jan 2019 16:36:19 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id g9so14713281plo.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Jan 2019 08:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=8OtEN6w94c4LMmUH8Quh41i766ASOIAc/JqR2WEBQg4=;
	b=ApcGprCs2jmH/y2ksqMVY1YNffVYeuanZLMU1PqZ9sx+V+Ya27f5RmVQIMKhfL76Tl
	m9RW0s2VsXuFcuc0OZDuURzU5H5ypDfqIJ7j+zE8AVIK40Eew0EUSlTd0GFlhp3lfQGA
	90oTRkvqQpTmV1efzPdmqxun3dobS+aMPXCkbawiRfI6Xnj0eOQVi5Am0AqUbe/cDF7b
	7Pb0nwOaT5yQly6c/EaAbgwcgp/xAuZjtI3WL9ou6uZE1cOnUngVU4NFpLssMwWiB2pd
	P9AydR/EfxLZxRwzmDO7AfjXI9tkz8u5k2O+azO3soc+Dhgbbc50b2IDh2o0kXfFNXsa
	jg4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=8OtEN6w94c4LMmUH8Quh41i766ASOIAc/JqR2WEBQg4=;
	b=lYQMkUh8pALQxKDl1a5l8fJRhN2zyCHzSyH4wGZMa5YK2tefpN4XFVcEL1+6Yr5oKd
	86Cs+UThIWNTV/OW6zAwMut0yRYM4ac5nHEOl+TvKkIgW0yHLwJm6RIXKj+Jb59JXSng
	mBhgO3M7o7yj3UObVz7DyuwuzzrUYKgJf+Z726eLuV8gWBZIK0Rwl7wnOrMYglKrxdN4
	/M1Y1wSdUnfKOgVxSPHyPn0tbE5/09nsGmxn7obFZeJNvG5e3bJF/C++DRZ7jkkECVrJ
	N8bAmeH8dzmD0wiyLBT3adw0MoL4CcMxJBFZDPzGPVpu+WaKYbNaOvnsk48UrlxYaSQM
	BSMg==
X-Gm-Message-State: AJcUukcnSSezqq74/zcCHxU24bDXpzmPYotlfLSsNd8PdsdFZ7WYPgnS
	p9YPqOcz2JzT3NolEc7rXSM=
X-Google-Smtp-Source: ALg8bN5kC9viRgBk16K9ae7WYDf28tC2nYXiJR2vJVgScDbbtiftysXoIWNoMZEbI65enTo0IDLGNg==
X-Received: by 2002:a17:902:8b88:: with SMTP id
	ay8mr44516963plb.55.1546446980900; 
	Wed, 02 Jan 2019 08:36:20 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:b176:14d6:5577:24f])
	by smtp.gmail.com with ESMTPSA id
	v89sm62973472pfj.164.2019.01.02.08.36.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Jan 2019 08:36:20 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Wed,  2 Jan 2019 08:36:12 -0800
Message-Id: <1546446977-27510-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1546446977-27510-1-git-send-email-akuster808@gmail.com>
References: <1546446977-27510-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 3/8] nettle: update to 3.4.1
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
X-List-Received-Date: Wed, 02 Jan 2019 16:36:19 -0000

Bug fix only release

Include:

  CVE-2018-16868 gnutls: Bleichenbacher-like side channel leakage in
  PKCS#1 1.5 verification and padding oracle verification

  CVE-2018-16869 nettle: Leaky data conversion exposing a manager oracle

For full details see:
http://lists.lysator.liu.se/pipermail/nettle-bugs/2018/007369.html

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../Add-target-to-only-build-tests-not-run-them.patch                 | 0
 .../check-header-files-of-openssl-only-if-enable_.patch               | 0
 .../nettle/{nettle-3.4 => nettle-3.4.1}/dlopen-test.patch             | 0
 meta/recipes-support/nettle/{nettle-3.4 => nettle-3.4.1}/run-ptest    | 0
 meta/recipes-support/nettle/{nettle_3.4.bb => nettle_3.4.1.bb}        | 4 ++--
 5 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/nettle/{nettle-3.4 => nettle-3.4.1}/Add-target-to-only-build-tests-not-run-them.patch (100%)
 rename meta/recipes-support/nettle/{nettle-3.4 => nettle-3.4.1}/check-header-files-of-openssl-only-if-enable_.patch (100%)
 rename meta/recipes-support/nettle/{nettle-3.4 => nettle-3.4.1}/dlopen-test.patch (100%)
 rename meta/recipes-support/nettle/{nettle-3.4 => nettle-3.4.1}/run-ptest (100%)
 rename meta/recipes-support/nettle/{nettle_3.4.bb => nettle_3.4.1.bb} (91%)

diff --git a/meta/recipes-support/nettle/nettle-3.4/Add-target-to-only-build-tests-not-run-them.patch b/meta/recipes-support/nettle/nettle-3.4.1/Add-target-to-only-build-tests-not-run-them.patch
similarity index 100%
rename from meta/recipes-support/nettle/nettle-3.4/Add-target-to-only-build-tests-not-run-them.patch
rename to meta/recipes-support/nettle/nettle-3.4.1/Add-target-to-only-build-tests-not-run-them.patch
diff --git a/meta/recipes-support/nettle/nettle-3.4/check-header-files-of-openssl-only-if-enable_.patch b/meta/recipes-support/nettle/nettle-3.4.1/check-header-files-of-openssl-only-if-enable_.patch
similarity index 100%
rename from meta/recipes-support/nettle/nettle-3.4/check-header-files-of-openssl-only-if-enable_.patch
rename to meta/recipes-support/nettle/nettle-3.4.1/check-header-files-of-openssl-only-if-enable_.patch
diff --git a/meta/recipes-support/nettle/nettle-3.4/dlopen-test.patch b/meta/recipes-support/nettle/nettle-3.4.1/dlopen-test.patch
similarity index 100%
rename from meta/recipes-support/nettle/nettle-3.4/dlopen-test.patch
rename to meta/recipes-support/nettle/nettle-3.4.1/dlopen-test.patch
diff --git a/meta/recipes-support/nettle/nettle-3.4/run-ptest b/meta/recipes-support/nettle/nettle-3.4.1/run-ptest
similarity index 100%
rename from meta/recipes-support/nettle/nettle-3.4/run-ptest
rename to meta/recipes-support/nettle/nettle-3.4.1/run-ptest
diff --git a/meta/recipes-support/nettle/nettle_3.4.bb b/meta/recipes-support/nettle/nettle_3.4.1.bb
similarity index 91%
rename from meta/recipes-support/nettle/nettle_3.4.bb
rename to meta/recipes-support/nettle/nettle_3.4.1.bb
index ca8450e..33de928 100644
--- a/meta/recipes-support/nettle/nettle_3.4.bb
+++ b/meta/recipes-support/nettle/nettle_3.4.1.bb
@@ -20,8 +20,8 @@ SRC_URI_append_class-target = "\
             file://dlopen-test.patch \
             "
 
-SRC_URI[md5sum] = "dc0f13028264992f58e67b4e8915f53d"
-SRC_URI[sha256sum] = "ae7a42df026550b85daca8389b6a60ba6313b0567f374392e54918588a411e94"
+SRC_URI[md5sum] = "9bdebb0e2f638d3b9d91f7fc264b70c1"
+SRC_URI[sha256sum] = "f941cf1535cd5d1819be5ccae5babef01f6db611f9b5a777bae9c7604b8a92ad"
 
 UPSTREAM_CHECK_REGEX = "nettle-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.7.4


