Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B24ECC433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 13:08:57 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web08.7246.1645621734861951758
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 05:08:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=hmkku7Wb;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1645621733; i=@fujitsu.com;
	bh=nU5U2YfHswPkashkhdgt5hzxR1ue1JrtEsVfyS1YZ8c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=hmkku7Wb5oT4xPv/Qn/69BcCv2eZeGJQVESUTiIwzFCnRCzBUEMSVByVSSrvlwaVw
	 i3jPuLU3wwbJlTk/o2YUS7/5trhp6D2zMywMi1enVTGJap/iUaRXKYD068KpCeixxZ
	 ML8vu2tZXuyuL1A1PV4XSqyn0gavAgaoqM0a74YD0UxFTCW/PACE8iVL/hM/kRdFh7
	 459Yaj7BsEpXYetvbgiR4bX9eYju36B6G/4+ev4auFwtwoM4SmXkO0IprnW+Wm8w5I
	 nmOhr5lkW426UutUhqhj77r5OIFXs+PB9THHT23mFBsdJDCdXcX4fOOCHkqLir5sZv
	 2pb/6enK9b2aA==
Received: from [100.115.36.74] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-2.aws.ess.symcld.net id 68/83-29321-5E136126;
 Wed, 23 Feb 2022 13:08:53 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8ORqPvEUCz
  J4MYnI4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPVht8sBcuEK878XcDWwDhdsIuRi0NI4DGj
  xJTV05ggnPNMEj+Xf2OHcE4wSsz9PJO5i5GTg01ATWL6rRusXYwcHCICehJX/4mChJkFVCRe/
  O5hB7GFBcwk5jRdYgKxWQRUJT4+nQAW5xVwkrjVMYMVxJYQUJCY8vA92EhOAWeJdUd7GEFsIa
  CaqSubWSDqBSVOznzCAjFfQuLgixfMEL2KErMvQ9RICFRIzJrVxgRhq0lcPbeJeQKj4Cwk7bO
  QtC9gZFrFaJ1UlJmeUZKbmJmja2hgoGtoaKprbKFraGKgl1ilm6iXWqpbnlpcomukl1herJda
  XKxXXJmbnJOil5dasokRGMYpxWo9OxhPrPqpd4hRkoNJSZT3Go9YkhBfUn5KZUZicUZ8UWlOa
  vEhRhkODiUJ3hgdoJxgUWp6akVaZg4wpmDSEhw8SiK811WB0rzFBYm5xZnpEKlTjIpS4ryxBk
  AJAZBERmkeXBssji8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEuZtBZnCk5lXAjf9FdBiJqD
  FU7KEQBaXJCKkpBqY+FULz9bqRJhZSM7oTVgrOFuPob992hXbrq+PQop+dj7aPrdnTtxTBqd7
  Dzu8Uv4lHnz/b/mz+nvCmrNub5I5bxehf+5x2gM2uc3HbbLjfPdJ9TdLTej4s4unY26bNuPro
  86TNtdeqf/78IaNLtuh1yoXOaelZj79cUWpJzxmegnXrSPy8tuEH+0TaOTj0r+rmxYnfeiaZq
  Klskblog6PuMInRtrLPT64PpqqnHLrdOrsOOv3SVmMVfXVegwqhS7cIi+P2ivc85r54k3+FUe
  Li60hb6OSTmwoVb5xsVO+wflfvqTn1PXBUcn+xVv2TjZ2fTurQnr3tsnqizY27P7G7/eZ56SW
  OtsB4/22v0WUWIozEg21mIuKEwHz0bIDXgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-565.messagelabs.com!1645621732!25989!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25616 invoked from network); 23 Feb 2022 13:08:52 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-19.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Feb 2022 13:08:52 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 4C0511001A5
	for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 13:08:52 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 2404E10019E
	for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 13:08:52 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Wed, 23 Feb 2022 13:08:25 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] quilt: upgrade 0.66 -> 0.67
Date: Wed, 23 Feb 2022 21:08:08 +0800
Message-ID: <1645621688-29191-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1645621688-29191-1-git-send-email-wangmy@fujitsu.com>
References: <1645621688-29191-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Feb 2022 13:08:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162263

Changelog:
=========
- Call pager with original LANG environment variable
- Consistently complain early if no series file is found
- Fix handling of symbolic links by several commands
- Tighten the patch format parsing
- Reuse the shell (performance)
- Document the series file format further
- Document that quilt loads /etc/quilt.quiltrc
- configure: Make stat configurable
- series: Minor optimizations
- setup: Don't obey the settings of any englobing .pc
- setup: Default to fast mode
- quilt.el: Fix documentation of quilt-pc-directory
- quilt.el: Load /etc/quilt.quiltrc if ~/.quiltrc doesn't exist
- quilt.el: Fix quilt-editable when QUILT_PATCHES_PREFIX is set

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../quilt/{quilt-native_0.66.bb => quilt-native_0.67.bb}       | 0
 meta/recipes-devtools/quilt/quilt.inc                          | 3 +--
 meta/recipes-devtools/quilt/{quilt_0.66.bb => quilt_0.67.bb}   | 1 +
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/quilt/{quilt-native_0.66.bb => quilt-native_0.67.bb} (100%)
 rename meta/recipes-devtools/quilt/{quilt_0.66.bb => quilt_0.67.bb} (97%)

diff --git a/meta/recipes-devtools/quilt/quilt-native_0.66.bb b/meta/recipes-devtools/quilt/quilt-native_0.67.bb
similarity index 100%
rename from meta/recipes-devtools/quilt/quilt-native_0.66.bb
rename to meta/recipes-devtools/quilt/quilt-native_0.67.bb
diff --git a/meta/recipes-devtools/quilt/quilt.inc b/meta/recipes-devtools/quilt/quilt.inc
index 06c761ab3a..19532051cd 100644
--- a/meta/recipes-devtools/quilt/quilt.inc
+++ b/meta/recipes-devtools/quilt/quilt.inc
@@ -16,8 +16,7 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/quilt/quilt-${PV}.tar.gz \
 
 SRC_URI:append:class-target = " file://gnu_patch_test_fix_target.patch"
 
-SRC_URI[md5sum] = "6800c2404a2c0598ab2eff92a636ba70"
-SRC_URI[sha256sum] = "314b319a6feb13bf9d0f9ffa7ce6683b06919e734a41275087ea457cc9dc6e07"
+SRC_URI[sha256sum] = "3be3be0987e72a6c364678bb827e3e1fcc10322b56bc5f02b576698f55013cc2"
 
 inherit autotools-brokensep ptest
 
diff --git a/meta/recipes-devtools/quilt/quilt_0.66.bb b/meta/recipes-devtools/quilt/quilt_0.67.bb
similarity index 97%
rename from meta/recipes-devtools/quilt/quilt_0.66.bb
rename to meta/recipes-devtools/quilt/quilt_0.67.bb
index ff9726576e..bf9e3c720f 100644
--- a/meta/recipes-devtools/quilt/quilt_0.66.bb
+++ b/meta/recipes-devtools/quilt/quilt_0.67.bb
@@ -1,2 +1,3 @@
 require quilt.inc
 inherit gettext
+
-- 
2.25.1


