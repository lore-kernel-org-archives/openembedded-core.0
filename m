Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76FCAC00140
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 08:46:41 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.8724.1661330800354983088
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 01:46:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=su2N0QpG;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661330798; i=@fujitsu.com;
	bh=RN7P2Vd+/h0A5HpeAMEffPlp85WHG2N5ADJ+KwG/jRI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=su2N0QpGwLD35+OGEy2osOL6mNus7ujbzZW8d4C4C0j++Jix5FpgFxGf+47CWaZ5g
	 28BPTuvakqXxXDeQla55Mxem1NYdJFPsiKA2WZF0lA6rYsBlQZbWfHtavzCJ8dWQJi
	 n9kZHThDiChEEdn/fzK0tHqSYZClT1oyZU+Kt8myvFVag28N+/r7O78ZD8/zRdfSyd
	 MOCof2cPmcBODUtKjaodbMJYdLxPC7WMPMpQ7t9ydDVbAlCUGLVhNYqCK5CWGSyoFV
	 s5kOcyc4luifK2kl1E4bw8oHoXWBt+r/gbEy7OXiVEOJuxhrE30HdzNBZoBfU+A8FO
	 S+qK+oZ2Om5Xg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8MxSTf3KWu
  ywZMuY4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePFnnVMBSf0KuZNuMbSwNim3cXIxSEk8JhR
  4tfricwQznUmiWMH97FAOHsZJZb8vs/YxcjJwSagJjH91g3WLkYODhEBPYmr/0RBwswCKhIvf
  vewg4SFBSwl1v7UAQmzCKhKnD3bwA5i8wo4Sex9PhVsioSAgsSUh++ZIeKCEidnPmGBGCMhcf
  DFC2aIGkWJ2ZebWSDsSok9s/qZIGw1iavnNjFPYOSfhaR9FpL2BYxMqxitk4oy0zNKchMzc3Q
  NDQx0DQ1NdY1NdQ0tTPQSq3QT9VJLdctTi0t0jfQSy4v1UouL9Yorc5NzUvTyUks2MQKDMqVY
  eccOxrZVP/UOMUpyMCmJ8t48w5osxJeUn1KZkVicEV9UmpNafIhRhoNDSYJX4AlQTrAoNT21I
  i0zBxghMGkJDh4lEV4JkFbe4oLE3OLMdIjUKUZLjqmz/+1n5lgOJmd+bTvALMSSl5+XKiXOm/
  oIqEEApCGjNA9uHCyKLzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5t3yAGgKT2ZeCdzWV0A
  HMQEdFLSbGeSgkkSElFQDk5N0Qltd2jcPnvBswdl9W29Ivvym4ntyTtDW2csCXyvtS5nz7d5N
  iyvy66dNuHbmoW3ajAO5Rzuszkhqnj/z5MPytH0z/55aNlMoOL+jT+hW2YSXh/T9fhokTpzE1
  pfFdS1Q9mqJ6MFZ8spGjx9Mt9xmeCm0zOXYzl9PHd0imLP99C81X5bv3S8or7t39qRfH/RcOy
  698VG+vVK/pWnheqcsUT2vXSd4J/0/rtPh6bwv2DtaYI9vZclP1uQ1TrtN4vauWqt7b0Pw4cK
  di8x/9jE42ck+sTFqF65ezLJr2akjl67frTW4OsONR/RV2gNLg9nHJcw4nubu/qu+ZeWKuLWa
  V6U7jF7eETcvXnUk5psSS3FGoqEWc1FxIgBn/6BYXQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-565.messagelabs.com!1661330797!22154!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30888 invoked from network); 24 Aug 2022 08:46:37 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-14.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 24 Aug 2022 08:46:37 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 893A71000CE
	for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 09:46:37 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 7CDED1000CD
	for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 09:46:37 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 24 Aug 2022 09:46:35 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] bind: upgrade 9.18.5 -> 9.18.6
Date: Wed, 24 Aug 2022 16:46:13 +0800
Message-ID: <1661330777-13307-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Aug 2022 08:46:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169789

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-avoid-start-failure-with-bind-user.patch               | 0
 .../0001-named-lwresd-V-and-start-log-hide-build-options.patch  | 0
 .../bind-ensure-searching-for-json-headers-searches-sysr.patch  | 0
 .../bind/{bind-9.18.5 => bind-9.18.6}/bind9                     | 0
 .../bind/{bind-9.18.5 => bind-9.18.6}/conf.patch                | 0
 .../bind/{bind-9.18.5 => bind-9.18.6}/generate-rndc-key.sh      | 0
 .../init.d-add-support-for-read-only-rootfs.patch               | 0
 .../make-etc-initd-bind-stop-work.patch                         | 0
 .../bind/{bind-9.18.5 => bind-9.18.6}/named.service             | 0
 .../bind/{bind_9.18.5.bb => bind_9.18.6.bb}                     | 2 +-
 10 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind-9.18.5 => bind-9.18.6}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.5 => bind-9.18.6}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.5 => bind-9.18.6}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.5 => bind-9.18.6}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.5 => bind-9.18.6}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.5 => bind-9.18.6}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.5 => bind-9.18.6}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.5 => bind-9.18.6}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.5 => bind-9.18.6}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.18.5.bb => bind_9.18.6.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind-9.18.5/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.18.6/0001-avoid-start-failure-with-bind-user.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.5/0001-avoid-start-failure-with-bind-user.patch
rename to meta/recipes-connectivity/bind/bind-9.18.6/0001-avoid-start-failure-with-bind-user.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.5/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.18.6/0001-named-lwresd-V-and-start-log-hide-build-options.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.5/0001-named-lwresd-V-and-start-log-hide-build-options.patch
rename to meta/recipes-connectivity/bind/bind-9.18.6/0001-named-lwresd-V-and-start-log-hide-build-options.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.5/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.18.6/bind-ensure-searching-for-json-headers-searches-sysr.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.5/bind-ensure-searching-for-json-headers-searches-sysr.patch
rename to meta/recipes-connectivity/bind/bind-9.18.6/bind-ensure-searching-for-json-headers-searches-sysr.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.5/bind9 b/meta/recipes-connectivity/bind/bind-9.18.6/bind9
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.5/bind9
rename to meta/recipes-connectivity/bind/bind-9.18.6/bind9
diff --git a/meta/recipes-connectivity/bind/bind-9.18.5/conf.patch b/meta/recipes-connectivity/bind/bind-9.18.6/conf.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.5/conf.patch
rename to meta/recipes-connectivity/bind/bind-9.18.6/conf.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.5/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.18.6/generate-rndc-key.sh
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.5/generate-rndc-key.sh
rename to meta/recipes-connectivity/bind/bind-9.18.6/generate-rndc-key.sh
diff --git a/meta/recipes-connectivity/bind/bind-9.18.5/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.18.6/init.d-add-support-for-read-only-rootfs.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.5/init.d-add-support-for-read-only-rootfs.patch
rename to meta/recipes-connectivity/bind/bind-9.18.6/init.d-add-support-for-read-only-rootfs.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.5/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.18.6/make-etc-initd-bind-stop-work.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.5/make-etc-initd-bind-stop-work.patch
rename to meta/recipes-connectivity/bind/bind-9.18.6/make-etc-initd-bind-stop-work.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.5/named.service b/meta/recipes-connectivity/bind/bind-9.18.6/named.service
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.5/named.service
rename to meta/recipes-connectivity/bind/bind-9.18.6/named.service
diff --git a/meta/recipes-connectivity/bind/bind_9.18.5.bb b/meta/recipes-connectivity/bind/bind_9.18.6.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.18.5.bb
rename to meta/recipes-connectivity/bind/bind_9.18.6.bb
index 6059ca6a33..5f54942776 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.5.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.6.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "0cee078d74f0bdc4ec374435026b25de7892f26540a18b22a02ef728a11dcae7"
+SRC_URI[sha256sum] = "d43a0fed03c774d1685d203598218c0b7774a88fcc390a0170710d5feb7fbff1"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.25.1


