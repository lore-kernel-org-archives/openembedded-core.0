Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F248C433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 13:42:19 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web08.7589.1645623737618544757
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 05:42:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ren1J21+;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1645623735; i=@fujitsu.com;
	bh=5JyLZnbYLCyBBemfDg0PSfiivLqILmJ0mkw3SVOm4J4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ren1J21+jPi3i14b+jETmeiedOvMSDAFteiJWO7JoyiNHUnaDzV7YFIfmVInvRFwd
	 yMsmxsNadvuuL8Mfa2M5URzDqAn892E94uPaXx7SutGasvmzZuFGuWVKnnCFOO4BIm
	 h+6AGgxroA+T8GFCv+QmjSkA7E7n0KchFv6f8Dqxw96BwTx1Pzl8E4XCmb4hjW3htw
	 8jMa5EYAwrrTjV9DCsUuLMS0hlgno6JyqixH7pQ6KnZlAgK5MecXRbV9j5q05Md6fx
	 rh5S4PSh0wkOCcdOSdoJzTOYvcYWgeSbeS1MCm1P9rpaSGFMQur1IIAvzhWGtc+DhG
	 8PnnQZPSD62oQ==
Received: from [100.115.69.48] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 AA/0F-25243-7B936126; Wed, 23 Feb 2022 13:42:15 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCIsWRWlGSWpSXmKPExsViZ8MxSXe7pVi
  SQd8EEYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPT0syCGZoVp54uZW5gfKXUxcjFISTwmFFi
  zfw1rBDOeSaJa49usEE4Jxgl9r24BORwcrAJqElMv3UDqIqDQ0RAT+LqP1GQMLOAisSL3z3sI
  LawgLnE/R9NLCA2i4CqxORDu5hAbF4BJ4n2Qy1gNRICChJTHr5nhogLSpyc+YQFYo6ExMEXL5
  ghahQlZl9uZoGwKyRmzWpjgrDVJK6e28Q8gZF/FpL2WUjaFzAyrWK0TSrKTM8oyU3MzNE1NDD
  QNTQ01TWz1DU21kus0k3USy3VTU7NKylKBMrqJZYX66UWF+sVV+Ym56To5aWWbGIEBmZKsavi
  DsZrfT/1DjFKcjApifJe4xFLEuJLyk+pzEgszogvKs1JLT7EKMPBoSTBK2YBlBMsSk1PrUjLz
  AFGCUxagoNHSYT3uipQmre4IDG3ODMdInWKUVFKnPe6AVBCACSRUZoH1waLzEuMslLCvIwMDA
  xCPAWpRbmZJajyrxjFORiVhHm1zYCm8GTmlcBNfwW0mAlo8ZQsIZDFJYkIKakGpt0p9/r+Knk
  HacoIuaVc8r+beNr9DtNE3qVzNsU0RL4WfaPKt+nGwt13b3ruT2F34p//7HR6ssmhas1wnxUp
  H82ec79PqFwiytf3Qe9ns8bPd8xpSm1sYVellhRa7W6Z8aBM4LHGLcHfrP43oie/UNjL2Dllr
  pBI2TL9zR8PKolwmeec2KZ++NP1biWpUycnTFNxDj18pmLuAqE7YSm7JVNlnvW41jS5rk/d5a
  C8/K++caZw+CvpO/cYd/koGj9c+3zqrFWfziy+esSV+V+K6Z7XvAd2Bbruu3OY/33fYZvEpmd
  2dUvElF+bf7rYEcSq2j196bI8oSrF59s+vNE/X2fNoGl4IyYkYaPZZU8NASWW4oxEQy3mouJE
  APo6aYJHAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-532.messagelabs.com!1645623735!21712!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1429 invoked from network); 23 Feb 2022 13:42:15 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-5.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Feb 2022 13:42:15 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id CC838100450
	for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 13:42:14 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id BCB1410033A
	for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 13:42:14 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Wed, 23 Feb 2022 13:42:03 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] ruby: upgrade 3.1.0 -> 3.1.1
Date: Wed, 23 Feb 2022 21:41:53 +0800
Message-ID: <1645623714-29329-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Feb 2022 13:42:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162265

refresh the following patches for 3.1.1:
0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
0006-Make-gemspecs-reproducible.patch

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...eproducible-change-fixing-784225-too.patch | 41 ++++++++++---------
 .../0006-Make-gemspecs-reproducible.patch     | 13 +++---
 .../ruby/{ruby_3.1.0.bb => ruby_3.1.1.bb}     |  2 +-
 3 files changed, 31 insertions(+), 25 deletions(-)
 rename meta/recipes-devtools/ruby/{ruby_3.1.0.bb => ruby_3.1.1.bb} (97%)

diff --git a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
index b7faa58655..41f206523e 100644
--- a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
+++ b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
@@ -1,28 +1,31 @@
-From: Christian Hofstaedtler <zeha@debian.org>
-Date: Tue, 10 Oct 2017 15:07:11 -0300
-Subject: Mark Gemspec-reproducible change fixing #784225, too
+From 6e1dc610724a7aa8368cbcddf4bbe21cccc0f731 Mon Sep 17 00:00:00 2001
+From: Lucas Kanashiro <kanashiro@debian.org>
+Date: Fri, 1 Nov 2019 15:25:17 -0300
+Subject: [PATCH] Make gemspecs reproducible
 
-I think the UTC date change will fix the Multi-Arch not-same file issue,
-too.
+Without an explicit date, they will get the current date and make the
+build unreproducible
 
 Upstream-Status: Backport [debian]
-
-Signed-off-by: Antonio Terceiro <terceiro@debian.org>
-Signed-off-by: Christian Hofstaedtler <zeha@debian.org>
 ---
  lib/rubygems/specification.rb | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
 
+diff --git a/lib/rubygems/specification.rb b/lib/rubygems/specification.rb
+index 0d72cee..eb7bc25 100644
 --- a/lib/rubygems/specification.rb
 +++ b/lib/rubygems/specification.rb
-@@ -1695,7 +1695,9 @@
-                 raise(Gem::InvalidSpecificationException,
-                       "invalid date format in specification: #{date.inspect}")
-               end
--            when Time, DateLike then
-+            when Time then
-+              Time.utc(date.utc.year, date.utc.month, date.utc.day)
-+            when DateLike then
-               Time.utc(date.year, date.month, date.day)
-             else
-               TODAY
+@@ -1691,7 +1691,9 @@ class Gem::Specification < Gem::BasicSpecification
+         raise(Gem::InvalidSpecificationException,
+               "invalid date format in specification: #{date.inspect}")
+       end
+-    when Time, DateLike then
++    when Time then
++      Time.utc(date.utc.year, date.utc.month, date.utc.day)
++    when DateLike then
+       Time.utc(date.year, date.month, date.day)
+     else
+       TODAY
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
index de8d4f04cc..1e4a298317 100644
--- a/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
+++ b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
@@ -41,10 +41,10 @@ index a9c0ec4..89da078 100644
    spec.email         = ["aaron@tenderlovemaking.com", "hsbt@ruby-lang.org"]
  
 diff --git a/ext/io/console/io-console.gemspec b/ext/io/console/io-console.gemspec
-index 36beda7..e932d83 100644
+index aa57f8a..ba7f8e5 100644
 --- a/ext/io/console/io-console.gemspec
 +++ b/ext/io/console/io-console.gemspec
-@@ -4,6 +4,7 @@ _VERSION = "0.5.10"
+@@ -4,6 +4,7 @@ _VERSION = "0.5.11"
  Gem::Specification.new do |s|
    s.name = "io-console"
    s.version = _VERSION
@@ -53,13 +53,13 @@ index 36beda7..e932d83 100644
    s.email = "nobu@ruby-lang.org"
    s.description = "add console capabilities to IO instances."
 diff --git a/lib/ipaddr.gemspec b/lib/ipaddr.gemspec
-index 36e2300..06dc888 100644
+index 1f4798e..48743cf 100644
 --- a/lib/ipaddr.gemspec
 +++ b/lib/ipaddr.gemspec
-@@ -6,6 +6,7 @@ $LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
+@@ -18,6 +18,7 @@ end
  Gem::Specification.new do |spec|
    spec.name          = "ipaddr"
-   spec.version       = "1.2.3"
+   spec.version       = version
 +  spec.date          = RUBY_RELEASE_DATE
    spec.authors       = ["Akinori MUSHA", "Hajimu UMEMOTO"]
    spec.email         = ["knu@idaemons.org", "ume@mahoroba.org"]
@@ -76,3 +76,6 @@ index 525a15f..f6d0e22 100644
    s.version = RDoc::VERSION
  
    s.authors = [
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/ruby/ruby_3.1.0.bb b/meta/recipes-devtools/ruby/ruby_3.1.1.bb
similarity index 97%
rename from meta/recipes-devtools/ruby/ruby_3.1.0.bb
rename to meta/recipes-devtools/ruby/ruby_3.1.1.bb
index 7a04a36432..d8fddfa520 100644
--- a/meta/recipes-devtools/ruby/ruby_3.1.0.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.1.1.bb
@@ -14,7 +14,7 @@ SRC_URI += " \
            file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch \
            "
 
-SRC_URI[sha256sum] = "50a0504c6edcb4d61ce6b8cfdbddaa95707195fab0ecd7b5e92654b2a9412854"
+SRC_URI[sha256sum] = "fe6e4782de97443978ddba8ba4be38d222aa24dc3e3f02a6a8e7701c0eeb619d"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-- 
2.25.1


