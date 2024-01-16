Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95846C47077
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 18:45:56 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.25505.1705430748288528962
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jan 2024 10:45:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fLB0sVoi;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6d9bec20980so5487947b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 10:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705430747; x=1706035547; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tGqWwlU39wbIlXoSL5A4zLc6sFzl8PjPhAH65Jl1HyA=;
        b=fLB0sVoi+oEm77WD61X4q2bOt+P6qf8CybsDKfPf8WAqnyjib0pDuh7pWjhYaHrXMz
         F9kpuHT+S95+OVNaI2e6fiORT7k7SN31xHqx+0ap5ZZ5DsTbwZgdtdTtHb12/ifKBHnY
         2lZyUKq5IT+/0ufYHNEsKi+zgDpaF9QwQYv/Bdm+NgFJ+sKEu5vbNvNecc55hmEjXR9F
         2ITnN9ANagLs/eJhDH7FFHAMuwHAkG92v5LE3fV0AEvEzJp+KjjZnvUwp6NLH3ebt8EA
         JCUpuPLxojTp07mdTneXuWFRh0Ktw67nTu+cxhYmCoYT3wEsoVXUkEZlybEQfUOj7Cjb
         y/Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705430747; x=1706035547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tGqWwlU39wbIlXoSL5A4zLc6sFzl8PjPhAH65Jl1HyA=;
        b=NLvDelFmsHVjuB36C+wykk9LOyzd7jqFR44+e42godVh0QX5AZPNLjbop6Ld6zheyT
         N95k3StPvhD9kzanZefX0+0FUX7Y3hBYWaYQsGVzK2DuWHcGu6mcEBKChzjeyyHswvIX
         yfMMCGvD4KPHnSdfos1hDGrU3QqsyhX+fM/ZSttSmoSMP/oluRXuhTa2ockOZKwjB6YF
         Mjl40o8AGMqWi/PNpqvCn6UZg7f5IYkEiQKy1iBy6wsrS1DS5AUc03Roo94VBdLmhbAH
         Ap9l3OVZ3U65jzs5FmaDQSGQuyWSaH8/mGz8PGxbEvBshrP8uGj3v4knl1oAF8k3BJE8
         myrQ==
X-Gm-Message-State: AOJu0YxyufrPEYsjhzjr432Qszglg0fPz1cOVeTZ+CflwbVmtSg5dllF
	6LKF0f1q8T7ceYevOcDAM9YXfxVQ4HE=
X-Google-Smtp-Source: AGHT+IEbXjZKByuNnTFYEADmPZ/THN6YUM10/wi691x+Zgu6SPPCK4tciGVYD4EqBQ5MIAzqx2ZtdA==
X-Received: by 2002:a05:6a20:9f86:b0:19a:fad2:5051 with SMTP id mm6-20020a056a209f8600b0019afad25051mr2762864pzb.43.1705430747179;
        Tue, 16 Jan 2024 10:45:47 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0:9215:7e73:c00c:6dae])
        by smtp.gmail.com with ESMTPSA id l23-20020a63ba57000000b005cdad153d84sm9050875pgu.90.2024.01.16.10.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 10:45:46 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-alabaster: upgrade 0.7.13 -> 0.7.16
Date: Tue, 16 Jan 2024 10:45:04 -0800
Message-Id: <20240116184503.3146833-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 18:45:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193871

* Since 0.7.14 setup.py was dropped and now the project is using the
  flit core backend (inherit python_flit_core)
* Add BUGTRACKER url

License-Update: LICENSE renamed to LICENSE.rst

https://alabaster.readthedocs.io/en/latest/changelog.html#changelog

0.7.14 – 2024-01-08
* Dropped support for Python 3.8 and earlier.
* Dropped support for Sphinx 3.3 and earlier.
* #198 Fix horizontal scrolling on mobile.
* #206 Properly support the html_support_sphinx config value.
* #211 Fix the GitHub ‘forkme’ banner.
* Added alabaster_version_info to the HTML template context.
* Declare support for Python 3.13.
* Adopt the Ruff linter and formatter.
* Migrate from CircleCI to GitHub Actions.

0.7.15 – 2024-01-08
* #213 Allow an arbitrary string in the logo_name option.
* #114 Improved sidebar CSS styles.
* #178 Deprecated canonical_url in favor of html_baseurl.
* #200 Removed duplicate <meta name="viewport" ... /> tag.
* #188 Removed underline from whitespace.
* #164 Removed type="text/javascript" from <script> elements.
* #161 Replaced &copy; with unicode decimal code entity #169;.

0.7.16 – 2024-01-10
* #215 Do not display logo_name if it is set to False.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...on3-alabaster_0.7.13.bb => python3-alabaster_0.7.16.bb} | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-alabaster_0.7.13.bb => python3-alabaster_0.7.16.bb} (50%)

diff --git a/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb b/meta/recipes-devtools/python/python3-alabaster_0.7.16.bb
similarity index 50%
rename from meta/recipes-devtools/python/python3-alabaster_0.7.13.bb
rename to meta/recipes-devtools/python/python3-alabaster_0.7.16.bb
index 05d59febf0d..c61fce454f0 100644
--- a/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb
+++ b/meta/recipes-devtools/python/python3-alabaster_0.7.16.bb
@@ -1,11 +1,12 @@
 SUMMARY = "Alabaster is a visually (c)lean, responsive, configurable theme for the Sphinx documentation system."
 HOMEPAGE = "https://alabaster.readthedocs.io/en/latest/"
+BUGTRACKER = "https://github.com/sphinx-doc/alabaster/issues"
 SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=21860fdb805bf4e0bfaf94b566b747fa"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=21860fdb805bf4e0bfaf94b566b747fa"
 
-SRC_URI[sha256sum] = "a27a4a084d5e690e16e01e03ad2b2e552c61a65469419b907243193de1a84ae2"
+SRC_URI[sha256sum] = "75a8b99c28a5dad50dd7f8ccdd447a121ddb3892da9e53d1ca5cca3106d58d65"
 
-inherit setuptools3 pypi
+inherit python_flit_core pypi
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


