Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65108CA0ECD
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 14:08:12 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.88624.1754057267642143515
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 07:08:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=bmMAiYNS;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=F6U2F3P0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019865f63301-4aacf90b-5638-4793-9b06-094ae463e280-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1754057290;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=RJKSwmmLgQKWrdEet+djjEymMbJOXXw8uw+ocPgRkBk=;
	b=bmMAiYNSwoLHNdgT/dGq/k7/3yUOKtTd07wkiFu9zmf7yAFJd/DZNYpaBMv7nAS7
	QtGjCQQGNhGtHPfxFk2cEod2IeHrPLHCbtG7AEPpca4aVK2MqJI+4aKyUs/pvhyqz5d
	tGO26fxHWcvh1EuQmIjgpdjeRJ/ScshZiWXKle/w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1754057290;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=RJKSwmmLgQKWrdEet+djjEymMbJOXXw8uw+ocPgRkBk=;
	b=F6U2F3P0Wsxjt1OmkuBRiXeT9iC4kRbHg3pqP0oWN2BbwsH8xRczvrNDxx1qmJYi
	jIHw3b5JYXLGtABv2i1YHsOO11zYnBWS4o8ac+1QhsR+r7wAyu3FLM0srWtr+5FxT4b
	Bt/Tx7DVKhvq+Vom7nYMYUhGW6MFq4Zu6tX42DJE=
Content-Type: multipart/mixed; boundary="===============5422412529295120486=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Joslyn <robert.joslyn@redrectangle.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] curl: upgrading to 8.15.0 SUCCEEDED
Message-ID: <0101019865f63301-4aacf90b-5638-4793-9b06-094ae463e280-000000@us-west-2.amazonses.com>
Date: Fri, 1 Aug 2025 14:08:10 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 14:08:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221337

--===============5422412529295120486==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *curl* to *8.15.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-curl-upgrade-8.14.1-8.15.0.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 75c873a02cabbb6fa257f5fb416386b2b0bbef84 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Aug 2025 13:34:00 +0000
Subject: [PATCH] curl: upgrade 8.14.1 -> 8.15.0

---
 meta/recipes-support/curl/curl/no-test-timeout.patch        | 6 +++---
 .../recipes-support/curl/{curl_8.14.1.bb => curl_8.15.0.bb} | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/curl/{curl_8.14.1.bb => curl_8.15.0.bb} (98%)

diff --git a/meta/recipes-support/curl/curl/no-test-timeout.patch b/meta/recipes-support/curl/curl/no-test-timeout.patch
index 5b901a6fe9..eb15fffb11 100644
--- a/meta/recipes-support/curl/curl/no-test-timeout.patch
+++ b/meta/recipes-support/curl/curl/no-test-timeout.patch
@@ -1,4 +1,4 @@
-From 42cddb52e821cfc2f09f1974742714e5f2f1856e Mon Sep 17 00:00:00 2001
+From f11a16da27bfa00d98ffae3e7a49d0936e411443 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Fri, 15 Mar 2024 14:37:37 +0000
 Subject: [PATCH] Set the max-time timeout to 600 so the timeout is 10 minutes
@@ -11,10 +11,10 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tests/servers.pm b/tests/servers.pm
-index d4472d5..9999938 100644
+index df32ca7..933e250 100644
 --- a/tests/servers.pm
 +++ b/tests/servers.pm
-@@ -124,7 +124,7 @@ my $sshdverstr;  # for socks server, ssh daemon version string
+@@ -125,7 +125,7 @@ my $sshdverstr;  # for socks server, ssh daemon version string
  my $sshderror;   # for socks server, ssh daemon version error
  my %doesntrun;    # servers that don't work, identified by pidfile
  my %PORT = (nolisten => 47); # port we use for a local non-listening service
diff --git a/meta/recipes-support/curl/curl_8.14.1.bb b/meta/recipes-support/curl/curl_8.15.0.bb
similarity index 98%
rename from meta/recipes-support/curl/curl_8.14.1.bb
rename to meta/recipes-support/curl/curl_8.15.0.bb
index 08ad9cdb17..809aac8bec 100644
--- a/meta/recipes-support/curl/curl_8.14.1.bb
+++ b/meta/recipes-support/curl/curl_8.15.0.bb
@@ -20,7 +20,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-curl.sh \
 "
 
-SRC_URI[sha256sum] = "f4619a1e2474c4bbfedc88a7c2191209c8334b48fa1f4e53fd584cc12e9120dd"
+SRC_URI[sha256sum] = "6cd0a8a5b126ddfda61c94dc2c3fc53481ba7a35461cf7c5ab66aa9d6775b609"
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
-- 
2.47.1


--===============5422412529295120486==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/curl/curl-dbg: FILELIST: removed "/usr/lib/curl/ptest/tests/libtest/.debug/lib1908 /usr/lib/curl/ptest/tests/libtest/.debug/lib1906 /usr/lib/curl/ptest/tests/libtest/.debug/lib1907 /usr/lib/curl/ptest/tests/libtest/.debug/lib1905 /usr/lib/curl/ptest/tests/libtest/.debug/lib1903 /usr/lib/curl/ptest/tests/libtest/.debug/lib1900 /usr/lib/curl/ptest/tests/libtest/.debug/lib1901 /usr/lib/curl/ptest/tests/libtest/.debug/lib542 /usr/lib/curl/ptest/tests/libtest/.debug/lib543 /usr/lib/curl/ptest/tests/libtest/.debug/lib540 /usr/lib/curl/ptest/tests/libtest/.debug/lib541 /usr/lib/curl/ptest/tests/libtest/.debug/lib547 /usr/lib/curl/ptest/tests/libtest/.debug/lib544 /usr/lib/curl/ptest/tests/libtest/.debug/lib545 /usr/lib/curl/ptest/tests/libtest/.debug/lib548 /usr/lib/curl/ptest/tests/libtest/.debug/lib549 /usr/lib/curl/ptest/tests/libtest/.debug/lib2304 /usr/lib/curl/ptest/tests/libtest/.debug/lib1978 /usr/lib/curl/ptest/tests/libtest/.debug/lib2301 /usr/lib/curl
 /ptest/tests/libtest/.debug/lib2306 /usr/lib/curl/ptest/tests/libtest/.debug/lib2302 /usr/lib/curl/ptest/tests/libtest/.debug/lib1973 /usr/lib/curl/ptest/tests/libtest/.debug/lib1972 /usr/lib/curl/ptest/tests/libtest/.debug/lib1971 /usr/lib/curl/ptest/tests/libtest/.debug/lib1970 /usr/lib/curl/ptest/tests/libtest/.debug/lib1977 /usr/lib/curl/ptest/tests/libtest/.debug/lib2308 /usr/lib/curl/ptest/tests/libtest/.debug/lib1975 /usr/lib/curl/ptest/tests/libtest/.debug/lib1974 /usr/lib/curl/ptest/tests/libtest/.debug/lib2309 /usr/lib/curl/ptest/tests/libtest/.debug/lib668 /usr/lib/curl/ptest/tests/libtest/.debug/lib667 /usr/lib/curl/ptest/tests/libtest/.debug/lib666 /usr/lib/curl/ptest/tests/libtest/.debug/libprereq /usr/lib/curl/ptest/tests/libtest/.debug/lib661 /usr/lib/curl/ptest/tests/libtest/.debug/lib1598 /usr/lib/curl/ptest/tests/libtest/.debug/lib1591 /usr/lib/curl/ptest/tests/libtest/.debug/lib1593 /usr/lib/curl/ptest/tests/libtest/.debug/lib1592 /usr/lib/curl/ptest/tests/libtes
 t/.debug/lib1594 /usr/lib/curl/ptest/tests/libtest/.debug/lib1597 /usr/lib/curl/ptest/tests/libtest/.debug/lib1596 /usr/lib/curl/ptest/tests/libtest/.debug/lib533 /usr/lib/curl/ptest/tests/libtest/.debug/lib532 /usr/lib/curl/ptest/tests/libtest/.debug/lib530 /usr/lib/curl/ptest/tests/libtest/.debug/lib537 /usr/lib/curl/ptest/tests/libtest/.debug/lib536 /usr/lib/curl/ptest/tests/libtest/.debug/lib539 /usr/lib/curl/ptest/tests/server/.debug/socksd /usr/lib/curl/ptest/tests/libtest/.debug/lib1528 /usr/lib/curl/ptest/tests/libtest/.debug/lib1529 /usr/lib/curl/ptest/tests/libtest/.debug/lib1525 /usr/lib/curl/ptest/tests/libtest/.debug/lib643 /usr/lib/curl/ptest/tests/libtest/.debug/lib1526 /usr/lib/curl/ptest/tests/libtest/.debug/lib645 /usr/lib/curl/ptest/tests/libtest/.debug/lib1527 /usr/lib/curl/ptest/tests/libtest/.debug/lib1520 /usr/lib/curl/ptest/tests/libtest/.debug/lib1521 /usr/lib/curl/ptest/tests/libtest/.debug/lib1522 /usr/lib/curl/ptest/tests/libtest/.debug/lib1523 /usr/lib/c
 url/ptest/tests/libtest/.debug/lib652 /usr/lib/curl/ptest/tests/libtest/.debug/lib653 /usr/lib/curl/ptest/tests/libtest/.debug/libntlmconnect /usr/lib/curl/ptest/tests/libtest/.debug/lib1301 /usr/lib/curl/ptest/tests/libtest/.debug/lib1308 /usr/lib/curl/ptest/tests/libtest/.debug/lib751 /usr/lib/curl/ptest/tests/libtest/.debug/lib2502 /usr/lib/curl/ptest/tests/server/.debug/sockfilt /usr/lib/curl/ptest/tests/server/.debug/rtspd /usr/lib/curl/ptest/tests/libtest/.debug/lib1955 /usr/lib/curl/ptest/tests/libtest/.debug/lib1957 /usr/lib/curl/ptest/tests/libtest/.debug/lib1956 /usr/lib/curl/ptest/tests/libtest/.debug/lib1959 /usr/lib/curl/ptest/tests/libtest/.debug/lib1958 /usr/lib/curl/ptest/tests/server/.debug/resolve /usr/lib/curl/ptest/tests/libtest/.debug/lib1662 /usr/lib/curl/ptest/tests/libtest/.debug/lib1156 /usr/lib/curl/ptest/tests/libtest/.debug/lib1502 /usr/lib/curl/ptest/tests/libtest/.debug/lib1503 /usr/lib/curl/ptest/tests/libtest/.debug/lib1500 /usr/lib/curl/ptest/tests/l
 ibtest/.debug/lib1501 /usr/lib/curl/ptest/tests/libtest/.debug/lib1506 /usr/lib/curl/ptest/tests/libtest/.debug/lib1507 /usr/lib/curl/ptest/tests/libtest/.debug/lib1504 /usr/lib/curl/ptest/tests/libtest/.debug/lib1505 /usr/lib/curl/ptest/tests/libtest/.debug/lib1508 /usr/lib/curl/ptest/tests/libtest/.debug/lib1509 /usr/lib/curl/ptest/tests/server/.debug/sws /usr/lib/curl/ptest/tests/libtest/.debug/lib586 /usr/lib/curl/ptest/tests/libtest/.debug/lib587 /usr/lib/curl/ptest/tests/libtest/.debug/lib584 /usr/lib/curl/ptest/tests/libtest/.debug/lib585 /usr/lib/curl/ptest/tests/libtest/.debug/lib582 /usr/lib/curl/ptest/tests/libtest/.debug/lib583 /usr/lib/curl/ptest/tests/libtest/.debug/lib589 /usr/lib/curl/ptest/tests/libtest/.debug/lib1937 /usr/lib/curl/ptest/tests/libtest/.debug/lib1936 /usr/lib/curl/ptest/tests/libtest/.debug/lib1935 /usr/lib/curl/ptest/tests/libtest/.debug/lib1934 /usr/lib/curl/ptest/tests/libtest/.debug/lib1933 /usr/lib/curl/ptest/tests/libtest/.debug/lib1485 /usr/li
 b/curl/ptest/tests/server/.debug/dnsd /usr/lib/curl/ptest/tests/libtest/.debug/lib1939 /usr/lib/curl/ptest/tests/libtest/.debug/lib1938 /usr/lib/curl/ptest/tests/libtest/.debug/lib519 /usr/lib/curl/ptest/tests/libtest/.debug/lib518 /usr/lib/curl/ptest/tests/libtest/.debug/lib515 /usr/lib/curl/ptest/tests/libtest/.debug/lib514 /usr/lib/curl/ptest/tests/libtest/.debug/lib517 /usr/lib/curl/ptest/tests/libtest/.debug/lib516 /usr/lib/curl/ptest/tests/libtest/.debug/lib511 /usr/lib/curl/ptest/tests/libtest/.debug/lib510 /usr/lib/curl/ptest/tests/libtest/.debug/lib513 /usr/lib/curl/ptest/tests/libtest/.debug/lib512 /usr/lib/curl/ptest/tests/libtest/.debug/lib1568 /usr/lib/curl/ptest/tests/libtest/.debug/lib1569 /usr/lib/curl/ptest/tests/libtest/.debug/lib670 /usr/lib/curl/ptest/tests/libtest/.debug/lib671 /usr/lib/curl/ptest/tests/libtest/.debug/lib672 /usr/lib/curl/ptest/tests/libtest/.debug/lib673 /usr/lib/curl/ptest/tests/libtest/.debug/lib674 /usr/lib/curl/ptest/tests/libtest/.debug/li
 b676 /usr/lib/curl/ptest/tests/libtest/.debug/lib1560 /usr/lib/curl/ptest/tests/libtest/.debug/lib677 /usr/lib/curl/ptest/tests/libtest/.debug/lib678 /usr/lib/curl/ptest/tests/libtest/.debug/lib1564 /usr/lib/curl/ptest/tests/libtest/.debug/lib1565 /usr/lib/curl/ptest/tests/libtest/.debug/lib1567 /usr/lib/curl/ptest/tests/libtest/.debug/lib3104 /usr/lib/curl/ptest/tests/libtest/.debug/lib3105 /usr/lib/curl/ptest/tests/libtest/.debug/lib3100 /usr/lib/curl/ptest/tests/libtest/.debug/lib3101 /usr/lib/curl/ptest/tests/libtest/.debug/lib3102 /usr/lib/curl/ptest/tests/libtest/.debug/lib3103 /usr/lib/curl/ptest/tests/libtest/.debug/lib1539 /usr/lib/curl/ptest/tests/libtest/.debug/lib1538 /usr/lib/curl/ptest/tests/libtest/.debug/lib658 /usr/lib/curl/ptest/tests/libtest/.debug/lib659 /usr/lib/curl/ptest/tests/libtest/.debug/lib1533 /usr/lib/curl/ptest/tests/libtest/.debug/lib1532 /usr/lib/curl/ptest/tests/libtest/.debug/lib1531 /usr/lib/curl/ptest/tests/libtest/.debug/lib1530 /usr/lib/curl/pt
 est/tests/libtest/.debug/lib1537 /usr/lib/curl/ptest/tests/libtest/.debug/lib1536 /usr/lib/curl/ptest/tests/libtest/.debug/lib1535 /usr/lib/curl/ptest/tests/libtest/.debug/lib1534 /usr/lib/curl/ptest/tests/libtest/.debug/lib650 /usr/lib/curl/ptest/tests/libtest/.debug/lib651 /usr/lib/curl/ptest/tests/libtest/.debug/lib654 /usr/lib/curl/ptest/tests/libtest/.debug/lib655 /usr/lib/curl/ptest/tests/libtest/.debug/lib3010 /usr/lib/curl/ptest/tests/libtest/.debug/lib1919 /usr/lib/curl/ptest/tests/libtest/.debug/lib1918 /usr/lib/curl/ptest/tests/libtest/.debug/lib1915 /usr/lib/curl/ptest/tests/libtest/.debug/lib1917 /usr/lib/curl/ptest/tests/libtest/.debug/lib1916 /usr/lib/curl/ptest/tests/libtest/.debug/lib1911 /usr/lib/curl/ptest/tests/libtest/.debug/lib1910 /usr/lib/curl/ptest/tests/libtest/.debug/lib1913 /usr/lib/curl/ptest/tests/libtest/.debug/lib1912 /usr/lib/curl/ptest/tests/libtest/.debug/lib576 /usr/lib/curl/ptest/tests/libtest/.debug/lib575 /usr/lib/curl/ptest/tests/libtest/.debu
 g/lib574 /usr/lib/curl/ptest/tests/libtest/.debug/lib573 /usr/lib/curl/ptest/tests/libtest/.debug/lib572 /usr/lib/curl/ptest/tests/libtest/.debug/lib571 /usr/lib/curl/ptest/tests/libtest/.debug/lib570 /usr/lib/curl/ptest/tests/libtest/.debug/lib579 /usr/lib/curl/ptest/tests/libtest/.debug/lib578 /usr/lib/curl/ptest/tests/libtest/.debug/lib1545 /usr/lib/curl/ptest/tests/libtest/.debug/lib1542 /usr/lib/curl/ptest/tests/libtest/.debug/lib1543 /usr/lib/curl/ptest/tests/libtest/.debug/lib1540 /usr/lib/curl/ptest/tests/libtest/.debug/lib1541 /usr/lib/curl/ptest/tests/server/.debug/tftpd /usr/lib/curl/ptest/tests/libtest/.debug/lib1511 /usr/lib/curl/ptest/tests/libtest/.debug/lib1510 /usr/lib/curl/ptest/tests/libtest/.debug/lib1513 /usr/lib/curl/ptest/tests/libtest/.debug/lib1512 /usr/lib/curl/ptest/tests/libtest/.debug/lib1515 /usr/lib/curl/ptest/tests/libtest/.debug/lib1514 /usr/lib/curl/ptest/tests/libtest/.debug/lib1517 /usr/lib/curl/ptest/tests/libtest/.debug/lib2402 /usr/lib/curl/pte
 st/tests/libtest/.debug/lib1518 /usr/lib/curl/ptest/tests/libtest/.debug/lib2404 /usr/lib/curl/ptest/tests/libtest/.debug/lib2405 /usr/lib/curl/ptest/tests/libtest/.debug/lib553 /usr/lib/curl/ptest/tests/libtest/.debug/lib552 /usr/lib/curl/ptest/tests/libtest/.debug/lib555 /usr/lib/curl/ptest/tests/libtest/.debug/lib554 /usr/lib/curl/ptest/tests/libtest/.debug/lib557 /usr/lib/curl/ptest/tests/libtest/.debug/lib556 /usr/lib/curl/ptest/tests/libtest/.debug/lib559 /usr/lib/curl/ptest/tests/libtest/.debug/lib558 /usr/lib/curl/ptest/tests/libtest/.debug/lib524 /usr/lib/curl/ptest/tests/libtest/.debug/lib525 /usr/lib/curl/ptest/tests/libtest/.debug/lib526 /usr/lib/curl/ptest/tests/libtest/.debug/lib527 /usr/lib/curl/ptest/tests/libtest/.debug/lib520 /usr/lib/curl/ptest/tests/libtest/.debug/lib521 /usr/lib/curl/ptest/tests/libtest/.debug/lib523 /usr/lib/curl/ptest/tests/libtest/.debug/lib529 /usr/lib/curl/ptest/tests/libtest/.debug/lib2700 /usr/lib/curl/ptest/tests/libtest/.debug/lib1964 /
 usr/lib/curl/ptest/tests/libtest/.debug/lib1960 /usr/lib/curl/ptest/tests/libtest/.debug/lib3207 /usr/lib/curl/ptest/tests/libtest/.debug/lib1940 /usr/lib/curl/ptest/tests/libtest/.debug/lib1946 /usr/lib/curl/ptest/tests/libtest/.debug/lib1947 /usr/lib/curl/ptest/tests/libtest/.debug/lib1945 /usr/lib/curl/ptest/tests/libtest/.debug/lib696 /usr/lib/curl/ptest/tests/libtest/.debug/lib1948 /usr/lib/curl/ptest/tests/libtest/.debug/lib694 /usr/lib/curl/ptest/tests/libtest/.debug/lib695 /usr/lib/curl/ptest/tests/libtest/.debug/lib3208 /usr/lib/curl/ptest/tests/libtest/.debug/lib508 /usr/lib/curl/ptest/tests/libtest/.debug/lib509 /usr/lib/curl/ptest/tests/libtest/.debug/lib506 /usr/lib/curl/ptest/tests/libtest/.debug/lib507 /usr/lib/curl/ptest/tests/libtest/.debug/lib504 /usr/lib/curl/ptest/tests/libtest/.debug/lib505 /usr/lib/curl/ptest/tests/libtest/.debug/lib502 /usr/lib/curl/ptest/tests/libtest/.debug/lib503 /usr/lib/curl/ptest/tests/libtest/.debug/lib500 /usr/lib/curl/ptest/tests/libt
 est/.debug/lib501 /usr/lib/curl/ptest/tests/libtest/.debug/lib1576 /usr/lib/curl/ptest/tests/libtest/.debug/lib1571 /usr/lib/curl/ptest/tests/libtest/.debug/libauthretry /usr/lib/curl/ptest/tests/server/.debug/mqttd /usr/lib/curl/ptest/tests/libtest/.debug/lib1578 /usr/lib/curl/ptest/tests/libtest/.debug/lib597 /usr/lib/curl/ptest/tests/libtest/.debug/lib591 /usr/lib/curl/ptest/tests/libtest/.debug/lib590 /usr/lib/curl/ptest/tests/libtest/.debug/lib599 /usr/lib/curl/ptest/tests/libtest/.debug/lib598 /usr/lib/curl/ptest/tests/libtest/.debug/lib568 /usr/lib/curl/ptest/tests/libtest/.debug/lib569 /usr/lib/curl/ptest/tests/libtest/.debug/lib560 /usr/lib/curl/ptest/tests/libtest/.debug/lib562 /usr/lib/curl/ptest/tests/libtest/.debug/lib564 /usr/lib/curl/ptest/tests/libtest/.debug/lib565 /usr/lib/curl/ptest/tests/libtest/.debug/lib566 /usr/lib/curl/ptest/tests/libtest/.debug/lib567 /usr/lib/curl/ptest/tests/libtest/.debug/lib1559 /usr/lib/curl/ptest/tests/libtest/.debug/lib1558 /usr/lib/c
 url/ptest/tests/libtest/.debug/lib1555 /usr/lib/curl/ptest/tests/libtest/.debug/lib1554 /usr/lib/curl/ptest/tests/libtest/.debug/lib1557 /usr/lib/curl/ptest/tests/libtest/.debug/lib1556 /usr/lib/curl/ptest/tests/libtest/.debug/lib1551 /usr/lib/curl/ptest/tests/libtest/.debug/lib1550 /usr/lib/curl/ptest/tests/libtest/.debug/lib1553 /usr/lib/curl/ptest/tests/libtest/.debug/lib1552 /usr/lib/curl/ptest/tests/libtest/.debug/lib3027 /usr/lib/curl/ptest/tests/libtest/.debug/lib3026 /usr/lib/curl/ptest/tests/libtest/.debug/lib3025", added "/usr/lib/curl/ptest/tests/server/.debug/servers /usr/lib/curl/ptest/tests/libtest/.debug/libtests"
packages/core2-64-poky-linux/curl/curl-dbg: PV changed from "8.14.1" to "8.15.0"
packages/core2-64-poky-linux/curl/curl-dbg: PKGV changed from 8.14.1 [default] to 8.15.0 [default]
packages/core2-64-poky-linux/curl/curl-dbg: PKGSIZE changed from 15843656 to 5907680 (-63%)
packages/core2-64-poky-linux/curl/curl-dev: PV changed from "8.14.1" to "8.15.0"
packages/core2-64-poky-linux/curl/curl-dev: PKGV changed from 8.14.1 [default] to 8.15.0 [default]
packages/core2-64-poky-linux/curl/curl-dev: PKGSIZE changed from 266876 to 264395 (-1%)
packages/core2-64-poky-linux/curl/curl-doc: PV changed from "8.14.1" to "8.15.0"
packages/core2-64-poky-linux/curl/curl-doc: PKGV changed from 8.14.1 [default] to 8.15.0 [default]
packages/core2-64-poky-linux/curl/curl-doc: PKGSIZE changed from 1638705 to 1636480 (-0%)
packages/core2-64-poky-linux/curl/curl-locale: PV changed from "8.14.1" to "8.15.0"
packages/core2-64-poky-linux/curl/curl-locale: PKGV changed from 8.14.1 [default] to 8.15.0 [default]
packages/core2-64-poky-linux/curl/curl-ptest: FILELIST: removed "/usr/lib/curl/ptest/tests/libtest/libntlmconnect /usr/lib/curl/ptest/tests/libtest/lib695 /usr/lib/curl/ptest/tests/libtest/lib694 /usr/lib/curl/ptest/tests/libtest/lib696 /usr/lib/curl/ptest/tests/libtest/lib509 /usr/lib/curl/ptest/tests/libtest/lib508 /usr/lib/curl/ptest/tests/libtest/lib651 /usr/lib/curl/ptest/tests/libtest/lib501 /usr/lib/curl/ptest/tests/libtest/lib500 /usr/lib/curl/ptest/tests/libtest/lib503 /usr/lib/curl/ptest/tests/libtest/lib502 /usr/lib/curl/ptest/tests/libtest/lib3101 /usr/lib/curl/ptest/tests/libtest/lib1301 /usr/lib/curl/ptest/tests/libtest/lib1501 /usr/lib/curl/ptest/tests/libtest/lib505 /usr/lib/curl/ptest/tests/libtest/lib504 /usr/lib/curl/ptest/tests/libtest/lib507 /usr/lib/curl/ptest/tests/libtest/lib506 /usr/lib/curl/ptest/tests/libtest/lib1511 /usr/lib/curl/ptest/tests/libtest/lib1521 /usr/lib/curl/ptest/tests/libtest/lib1531 /usr/lib/curl/ptest/tests/libtest/lib653 /usr/lib/curl/pte
 st/tests/libtest/lib652 /usr/lib/curl/ptest/tests/libtest/lib590 /usr/lib/curl/ptest/tests/libtest/lib591 /usr/lib/curl/ptest/tests/libtest/lib1510 /usr/lib/curl/ptest/tests/libtest/lib1520 /usr/lib/curl/ptest/tests/libtest/lib1530 /usr/lib/curl/ptest/tests/libtest/lib1540 /usr/lib/curl/ptest/tests/libtest/lib1550 /usr/lib/curl/ptest/tests/libtest/lib597 /usr/lib/curl/ptest/tests/libtest/lib598 /usr/lib/curl/ptest/tests/libtest/lib599 /usr/lib/curl/ptest/tests/server/resolve /usr/lib/curl/ptest/tests/libtest/lib650 /usr/lib/curl/ptest/tests/libtest/lib1593 /usr/lib/curl/ptest/tests/libtest/lib1903 /usr/lib/curl/ptest/tests/libtest/lib1913 /usr/lib/curl/ptest/tests/libtest/lib1933 /usr/lib/curl/ptest/tests/libtest/lib1973 /usr/lib/curl/ptest/tests/libtest/lib3103 /usr/lib/curl/ptest/tests/libtest/lib1513 /usr/lib/curl/ptest/tests/libtest/lib1523 /usr/lib/curl/ptest/tests/libtest/lib1533 /usr/lib/curl/ptest/tests/libtest/lib1543 /usr/lib/curl/ptest/tests/server/sockfilt /usr/lib/curl/
 ptest/tests/libtest/lib1972 /usr/lib/curl/ptest/tests/libtest/lib2302 /usr/lib/curl/ptest/tests/libtest/lib1502 /usr/lib/curl/ptest/tests/libtest/lib3102 /usr/lib/curl/ptest/tests/libtest/lib1512 /usr/lib/curl/ptest/tests/libtest/lib1522 /usr/lib/curl/ptest/tests/libtest/lib1532 /usr/lib/curl/ptest/tests/libtest/lib1542 /usr/lib/curl/ptest/tests/libtest/lib1552 /usr/lib/curl/ptest/tests/libtest/lib543 /usr/lib/curl/ptest/tests/libtest/lib542 /usr/lib/curl/ptest/tests/libtest/lib583 /usr/lib/curl/ptest/tests/libtest/lib582 /usr/lib/curl/ptest/tests/libtest/lib585 /usr/lib/curl/ptest/tests/libtest/lib1565 /usr/lib/curl/ptest/tests/libtest/lib584 /usr/lib/curl/ptest/tests/libtest/lib587 /usr/lib/curl/ptest/tests/libtest/lib586 /usr/lib/curl/ptest/tests/libtest/lib589 /usr/lib/curl/ptest/tests/libtest/libprereq /usr/lib/curl/ptest/tests/libtest/lib1905 /usr/lib/curl/ptest/tests/libtest/lib1485 /usr/lib/curl/ptest/tests/libtest/lib1505 /usr/lib/curl/ptest/tests/libtest/lib1541 /usr/lib/c
 url/ptest/tests/libtest/lib1551 /usr/lib/curl/ptest/tests/libtest/lib1515 /usr/lib/curl/ptest/tests/libtest/lib1525 /usr/lib/curl/ptest/tests/libtest/lib1535 /usr/lib/curl/ptest/tests/libtest/lib1545 /usr/lib/curl/ptest/tests/libtest/lib1555 /usr/lib/curl/ptest/tests/libtest/lib549 /usr/lib/curl/ptest/tests/libtest/lib548 /usr/lib/curl/ptest/tests/server/tftpd /usr/lib/curl/ptest/tests/libtest/lib569 /usr/lib/curl/ptest/tests/libtest/lib568 /usr/lib/curl/ptest/tests/libtest/lib567 /usr/lib/curl/ptest/tests/libtest/lib566 /usr/lib/curl/ptest/tests/libtest/lib565 /usr/lib/curl/ptest/tests/libtest/lib564 /usr/lib/curl/ptest/tests/libtest/lib1934 /usr/lib/curl/ptest/tests/libtest/lib562 /usr/lib/curl/ptest/tests/libtest/lib1504 /usr/lib/curl/ptest/tests/libtest/lib560 /usr/lib/curl/ptest/tests/libtest/lib1514 /usr/lib/curl/ptest/tests/libtest/lib1534 /usr/lib/curl/ptest/tests/libtest/lib1554 /usr/lib/curl/ptest/tests/libtest/lib1947 /usr/lib/curl/ptest/tests/libtest/lib1957 /usr/lib/cur
 l/ptest/tests/libtest/lib1977 /usr/lib/curl/ptest/tests/libtest/lib3027 /usr/lib/curl/ptest/tests/libtest/lib3207 /usr/lib/curl/ptest/tests/libtest/lib1507 /usr/lib/curl/ptest/tests/libtest/lib1517 /usr/lib/curl/ptest/tests/libtest/lib1527 /usr/lib/curl/ptest/tests/libtest/lib1537 /usr/lib/curl/ptest/tests/libtest/lib1557 /usr/lib/curl/ptest/tests/server/socksd /usr/lib/curl/ptest/tests/libtest/lib1946 /usr/lib/curl/ptest/tests/libtest/lib1956 /usr/lib/curl/ptest/tests/libtest/lib2306 /usr/lib/curl/ptest/tests/libtest/lib1156 /usr/lib/curl/ptest/tests/libtest/lib1506 /usr/lib/curl/ptest/tests/libtest/lib3026 /usr/lib/curl/ptest/tests/libtest/lib1526 /usr/lib/curl/ptest/tests/libtest/lib518 /usr/lib/curl/ptest/tests/libtest/lib519 /usr/lib/curl/ptest/tests/libtest/lib1536 /usr/lib/curl/ptest/tests/libtest/lib512 /usr/lib/curl/ptest/tests/libtest/lib513 /usr/lib/curl/ptest/tests/libtest/lib510 /usr/lib/curl/ptest/tests/libtest/lib511 /usr/lib/curl/ptest/tests/libtest/lib516 /usr/lib/c
 url/ptest/tests/libtest/lib517 /usr/lib/curl/ptest/tests/libtest/lib514 /usr/lib/curl/ptest/tests/libtest/lib515 /usr/lib/curl/ptest/tests/libtest/lib677 /usr/lib/curl/ptest/tests/libtest/lib676 /usr/lib/curl/ptest/tests/libtest/lib674 /usr/lib/curl/ptest/tests/libtest/lib1509 /usr/lib/curl/ptest/tests/libtest/lib1919 /usr/lib/curl/ptest/tests/libtest/lib1939 /usr/lib/curl/ptest/tests/libtest/lib1959 /usr/lib/curl/ptest/tests/libtest/lib2309 /usr/lib/curl/ptest/tests/libtest/lib1529 /usr/lib/curl/ptest/tests/libtest/lib1539 /usr/lib/curl/ptest/tests/libtest/lib673 /usr/lib/curl/ptest/tests/libtest/lib672 /usr/lib/curl/ptest/tests/libtest/lib671 /usr/lib/curl/ptest/tests/libtest/lib670 /usr/lib/curl/ptest/tests/libtest/lib678 /usr/lib/curl/ptest/tests/libtest/lib1564 /usr/lib/curl/ptest/tests/mk-bundle.pl /usr/lib/curl/ptest/tests/libtest/lib1594 /usr/lib/curl/ptest/tests/libtest/lib1938 /usr/lib/curl/ptest/tests/libtest/lib1948 /usr/lib/curl/ptest/tests/libtest/lib1958 /usr/lib/curl
 /ptest/tests/libtest/lib1978 /usr/lib/curl/ptest/tests/libtest/lib2308 /usr/lib/curl/ptest/tests/libtest/lib3208 /usr/lib/curl/ptest/tests/libtest/lib1558 /usr/lib/curl/ptest/tests/libtest/lib1568 /usr/lib/curl/ptest/tests/libtest/lib1578 /usr/lib/curl/ptest/tests/libtest/lib1598 /usr/lib/curl/ptest/tests/libtest/libauthretry /usr/lib/curl/ptest/tests/libtest/lib545 /usr/lib/curl/ptest/tests/libtest/lib544 /usr/lib/curl/ptest/tests/libtest/lib547 /usr/lib/curl/ptest/tests/libtest/lib659 /usr/lib/curl/ptest/tests/libtest/lib658 /usr/lib/curl/ptest/tests/libtest/lib541 /usr/lib/curl/ptest/tests/libtest/lib540 /usr/lib/curl/ptest/tests/libtest/lib655 /usr/lib/curl/ptest/tests/libtest/lib654 /usr/lib/curl/ptest/tests/libtest/lib1911 /usr/lib/curl/ptest/tests/libtest/lib1591 /usr/lib/curl/ptest/tests/libtest/lib1901 /usr/lib/curl/ptest/tests/libtest/lib1971 /usr/lib/curl/ptest/tests/libtest/lib2301 /usr/lib/curl/ptest/tests/libtest/lib1970 /usr/lib/curl/ptest/tests/libtest/lib2700 /usr/l
 ib/curl/ptest/tests/libtest/lib3010 /usr/lib/curl/ptest/tests/libtest/lib3100 /usr/lib/curl/ptest/tests/libtest/lib1960 /usr/lib/curl/ptest/tests/server/rtspd /usr/lib/curl/ptest/tests/libtest/lib1560 /usr/lib/curl/ptest/tests/libtest/lib1500 /usr/lib/curl/ptest/tests/libtest/lib1503 /usr/lib/curl/ptest/tests/server/mqttd /usr/lib/curl/ptest/tests/libtest/lib2402 /usr/lib/curl/ptest/tests/libtest/lib2502 /usr/lib/curl/ptest/tests/libtest/lib1592 /usr/lib/curl/ptest/tests/libtest/lib1662 /usr/lib/curl/ptest/tests/libtest/lib1912 /usr/lib/curl/ptest/tests/libtest/lib1915 /usr/lib/curl/ptest/tests/libtest/lib1935 /usr/lib/curl/ptest/tests/libtest/lib1571 /usr/lib/curl/ptest/tests/libtest/lib1900 /usr/lib/curl/ptest/tests/libtest/lib1910 /usr/lib/curl/ptest/tests/libtest/lib1940 /usr/lib/curl/ptest/tests/libtest/lib1945 /usr/lib/curl/ptest/tests/libtest/lib1955 /usr/lib/curl/ptest/tests/libtest/lib1975 /usr/lib/curl/ptest/tests/libtest/lib2405 /usr/lib/curl/ptest/tests/libtest/lib3025 /
 usr/lib/curl/ptest/tests/libtest/lib3105 /usr/lib/curl/ptest/tests/libtest/lib1964 /usr/lib/curl/ptest/tests/libtest/lib1974 /usr/lib/curl/ptest/tests/libtest/lib2304 /usr/lib/curl/ptest/tests/libtest/lib2404 /usr/lib/curl/ptest/tests/libtest/lib3104 /usr/lib/curl/ptest/tests/libtest/lib1907 /usr/lib/curl/ptest/tests/libtest/lib1917 /usr/lib/curl/ptest/tests/libtest/lib1937 /usr/lib/curl/ptest/tests/libtest/lib1576 /usr/lib/curl/ptest/tests/libtest/lib1596 /usr/lib/curl/ptest/tests/libtest/lib1906 /usr/lib/curl/ptest/tests/libtest/lib1916 /usr/lib/curl/ptest/tests/libtest/lib1936 /usr/lib/curl/ptest/tests/libtest/lib1559 /usr/lib/curl/ptest/tests/libtest/lib1569 /usr/lib/curl/ptest/tests/libtest/lib1908 /usr/lib/curl/ptest/tests/libtest/lib1918 /usr/lib/curl/ptest/tests/libtest/lib1308 /usr/lib/curl/ptest/tests/libtest/lib1508 /usr/lib/curl/ptest/tests/libtest/lib1518 /usr/lib/curl/ptest/tests/libtest/lib1528 /usr/lib/curl/ptest/tests/libtest/lib1538 /usr/lib/curl/ptest/tests/libtes
 t/lib570 /usr/lib/curl/ptest/tests/libtest/lib571 /usr/lib/curl/ptest/tests/libtest/lib572 /usr/lib/curl/ptest/tests/libtest/lib573 /usr/lib/curl/ptest/tests/libtest/lib574 /usr/lib/curl/ptest/tests/libtest/lib575 /usr/lib/curl/ptest/tests/libtest/lib576 /usr/lib/curl/ptest/tests/libtest/lib668 /usr/lib/curl/ptest/tests/libtest/lib578 /usr/lib/curl/ptest/tests/libtest/lib579 /usr/lib/curl/ptest/tests/libtest/lib661 /usr/lib/curl/ptest/tests/libtest/lib666 /usr/lib/curl/ptest/tests/libtest/lib667 /usr/lib/curl/ptest/tests/server/sws /usr/lib/curl/ptest/tests/libtest/lib1567 /usr/lib/curl/ptest/tests/libtest/lib1597 /usr/lib/curl/ptest/tests/libtest/lib1553 /usr/lib/curl/ptest/tests/libtest/lib536 /usr/lib/curl/ptest/tests/libtest/lib537 /usr/lib/curl/ptest/tests/libtest/lib530 /usr/lib/curl/ptest/tests/libtest/lib532 /usr/lib/curl/ptest/tests/libtest/lib533 /usr/lib/curl/ptest/tests/libtest/lib539 /usr/lib/curl/ptest/tests/libtest/lib751 /usr/lib/curl/ptest/tests/server/dnsd /usr/lib
 /curl/ptest/tests/libtest/lib556 /usr/lib/curl/ptest/tests/libtest/lib557 /usr/lib/curl/ptest/tests/libtest/lib554 /usr/lib/curl/ptest/tests/libtest/lib555 /usr/lib/curl/ptest/tests/libtest/lib552 /usr/lib/curl/ptest/tests/libtest/lib553 /usr/lib/curl/ptest/tests/libtest/lib645 /usr/lib/curl/ptest/tests/libtest/lib643 /usr/lib/curl/ptest/tests/libtest/lib558 /usr/lib/curl/ptest/tests/libtest/lib559 /usr/lib/curl/ptest/tests/libtest/lib523 /usr/lib/curl/ptest/tests/libtest/lib521 /usr/lib/curl/ptest/tests/libtest/lib520 /usr/lib/curl/ptest/tests/libtest/lib527 /usr/lib/curl/ptest/tests/libtest/lib526 /usr/lib/curl/ptest/tests/libtest/lib525 /usr/lib/curl/ptest/tests/libtest/lib524 /usr/lib/curl/ptest/tests/libtest/lib529 /usr/lib/curl/ptest/tests/libtest/lib1556", added "/usr/lib/curl/ptest/tests/libtest/libtests /usr/lib/curl/ptest/tests/data/test1599 /usr/lib/curl/ptest/tests/data/test1499 /usr/lib/curl/ptest/tests/data/test3214 /usr/lib/curl/ptest/tests/data/test1547 /usr/lib/curl
 /ptest/tests/server/servers /usr/lib/curl/ptest/tests/data/test752 /usr/lib/curl/ptest/tests/data/test753 /usr/lib/curl/ptest/tests/data/test754 /usr/lib/curl/ptest/tests/data/test2103 /usr/lib/curl/ptest/tests/data/test792 /usr/lib/curl/ptest/tests/data/test793"
packages/core2-64-poky-linux/curl/curl-ptest: PV changed from "8.14.1" to "8.15.0"
packages/core2-64-poky-linux/curl/curl-ptest: PKGV changed from 8.14.1 [default] to 8.15.0 [default]
packages/core2-64-poky-linux/curl/curl-ptest: PKGSIZE changed from 7348139 to 3803414 (-48%)
packages/core2-64-poky-linux/curl/curl-src: FILELIST: directory renamed /usr/src/debug/curl/8.14.1/src -> /usr/src/debug/curl/8.15.0/src, removed "/usr/src/debug/curl/8.14.1/tests/libtest/lib1521.c", added "/usr/src/debug/curl/8.15.0/tests/libtest/lib1521.c /usr/src/debug/curl/8.15.0/tests/libtest/libtests.c"
packages/core2-64-poky-linux/curl/curl-src: PV changed from "8.14.1" to "8.15.0"
packages/core2-64-poky-linux/curl/curl-src: PKGV changed from 8.14.1 [default] to 8.15.0 [default]
packages/core2-64-poky-linux/curl/curl-src: PKGSIZE changed from 223335 to 235418 (+5%)
packages/core2-64-poky-linux/curl/curl-staticdev: PV changed from "8.14.1" to "8.15.0"
packages/core2-64-poky-linux/curl/curl-staticdev: PKGV changed from 8.14.1 [default] to 8.15.0 [default]
packages/core2-64-poky-linux/curl/curl: PV changed from "8.14.1" to "8.15.0"
packages/core2-64-poky-linux/curl/curl: PKGV changed from 8.14.1 [default] to 8.15.0 [default]
packages/core2-64-poky-linux/curl: SRC_URI changed from "https://curl.se/download/curl-8.14.1.tar.xz file://run-ptest file://disable-tests file://no-test-timeout.patch" to "https://curl.se/download/curl-8.15.0.tar.xz file://run-ptest file://disable-tests file://no-test-timeout.patch"
packages/core2-64-poky-linux/curl: PV changed from "8.14.1" to "8.15.0"
packages/core2-64-poky-linux/curl: PKGV changed from 8.14.1 [default] to 8.15.0 [default]
packages/core2-64-poky-linux/curl/libcurl: PV changed from "8.14.1" to "8.15.0"
packages/core2-64-poky-linux/curl/libcurl: PKGV changed from 8.14.1 [default] to 8.15.0 [default]
packages/core2-64-poky-linux/curl/libcurl: PKGSIZE changed from 671776 to 675856 (+1%)

--===============5422412529295120486==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-curl-upgrade-8.14.1-8.15.0.patch"

RnJvbSA3NWM4NzNhMDJjYWJiYjZmYTI1N2Y1ZmI0MTYzODZiMmIwYmJlZjg0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBBdWcgMjAyNSAxMzozNDowMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGN1
cmw6IHVwZ3JhZGUgOC4xNC4xIC0+IDguMTUuMAoKLS0tCiBtZXRhL3JlY2lwZXMtc3VwcG9ydC9j
dXJsL2N1cmwvbm8tdGVzdC10aW1lb3V0LnBhdGNoICAgICAgICB8IDYgKysrLS0tCiAuLi4vcmVj
aXBlcy1zdXBwb3J0L2N1cmwve2N1cmxfOC4xNC4xLmJiID0+IGN1cmxfOC4xNS4wLmJifSB8IDIg
Ky0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2N1cmwve2N1cmxfOC4xNC4xLmJiID0+IGN1cmxfOC4x
NS4wLmJifSAoOTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2N1cmwvY3Vy
bC9uby10ZXN0LXRpbWVvdXQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9jdXJsL2N1cmwv
bm8tdGVzdC10aW1lb3V0LnBhdGNoCmluZGV4IDViOTAxYTZmZTkuLmViMTVmZmZiMTEgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2N1cmwvY3VybC9uby10ZXN0LXRpbWVvdXQucGF0
Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvY3VybC9jdXJsL25vLXRlc3QtdGltZW91dC5w
YXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNDJjZGRiNTJlODIxY2ZjMmYwOWYxOTc0NzQyNzE0
ZTVmMmYxODU2ZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZjExYTE2ZGEyN2JmYTAw
ZDk4ZmZhZTNlN2E0OWQwOTM2ZTQxMTQ0MyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206
IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29tPgogRGF0ZTogRnJpLCAxNSBNYXIgMjAy
NCAxNDozNzozNyArMDAwMAogU3ViamVjdDogW1BBVENIXSBTZXQgdGhlIG1heC10aW1lIHRpbWVv
dXQgdG8gNjAwIHNvIHRoZSB0aW1lb3V0IGlzIDEwIG1pbnV0ZXMKQEAgLTExLDEwICsxMSwxMCBA
QCBTaWduZWQtb2ZmLWJ5OiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4KICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBh
L3Rlc3RzL3NlcnZlcnMucG0gYi90ZXN0cy9zZXJ2ZXJzLnBtCi1pbmRleCBkNDQ3MmQ1Li45OTk5
OTM4IDEwMDY0NAoraW5kZXggZGYzMmNhNy4uOTMzZTI1MCAxMDA2NDQKIC0tLSBhL3Rlc3RzL3Nl
cnZlcnMucG0KICsrKyBiL3Rlc3RzL3NlcnZlcnMucG0KLUBAIC0xMjQsNyArMTI0LDcgQEAgbXkg
JHNzaGR2ZXJzdHI7ICAjIGZvciBzb2NrcyBzZXJ2ZXIsIHNzaCBkYWVtb24gdmVyc2lvbiBzdHJp
bmcKK0BAIC0xMjUsNyArMTI1LDcgQEAgbXkgJHNzaGR2ZXJzdHI7ICAjIGZvciBzb2NrcyBzZXJ2
ZXIsIHNzaCBkYWVtb24gdmVyc2lvbiBzdHJpbmcKICBteSAkc3NoZGVycm9yOyAgICMgZm9yIHNv
Y2tzIHNlcnZlciwgc3NoIGRhZW1vbiB2ZXJzaW9uIGVycm9yCiAgbXkgJWRvZXNudHJ1bjsgICAg
IyBzZXJ2ZXJzIHRoYXQgZG9uJ3Qgd29yaywgaWRlbnRpZmllZCBieSBwaWRmaWxlCiAgbXkgJVBP
UlQgPSAobm9saXN0ZW4gPT4gNDcpOyAjIHBvcnQgd2UgdXNlIGZvciBhIGxvY2FsIG5vbi1saXN0
ZW5pbmcgc2VydmljZQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvY3VybC9jdXJs
XzguMTQuMS5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2N1cmwvY3VybF84LjE1LjAuYmIKc2lt
aWxhcml0eSBpbmRleCA5OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvY3VybC9j
dXJsXzguMTQuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvY3VybC9jdXJsXzgu
MTUuMC5iYgppbmRleCAwOGFkOWNkYjE3Li44MDlhYWM4YmVjIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9jdXJsL2N1cmxfOC4xNC4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBw
b3J0L2N1cmwvY3VybF84LjE1LjAuYmIKQEAgLTIwLDcgKzIwLDcgQEAgU1JDX1VSSTphcHBlbmQ6
Y2xhc3MtbmF0aXZlc2RrID0gIiBcCiAgICAgICAgICAgIGZpbGU6Ly9lbnZpcm9ubWVudC5kLWN1
cmwuc2ggXAogIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZjQ2MTlhMWUyNDc0YzRiYmZlZGM4
OGE3YzIxOTEyMDljODMzNGI0OGZhMWY0ZTUzZmQ1ODRjYzEyZTkxMjBkZCIKK1NSQ19VUklbc2hh
MjU2c3VtXSA9ICI2Y2QwYThhNWIxMjZkZGZkYTYxYzk0ZGMyYzNmYzUzNDgxYmE3YTM1NDYxY2Y3
YzVhYjY2YWE5ZDY3NzViNjA5IgogCiAjIEN1cmwgaGFzIHVzZWQgbWFueSBuYW1lcyBvdmVyIHRo
ZSB5ZWFycy4uLgogQ1ZFX1BST0RVQ1QgPSAiaGF4eDpjdXJsIGhheHg6bGliY3VybCBjdXJsOmN1
cmwgY3VybDpsaWJjdXJsIGxpYmN1cmw6bGliY3VybCBkYW5pZWxfc3RlbmJlcmc6Y3VybCIKLS0g
CjIuNDcuMQoK

--===============5422412529295120486==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/curl/curl-dbg: PKGSIZE changed from 15843656 to 5907680 (-63%)
packages/core2-64-poky-linux/curl/curl-ptest: FILELIST: removed "/usr/lib/curl/ptest/tests/libtest/lib2700 /usr/lib/curl/ptest/tests/libtest/lib3010 /usr/lib/curl/ptest/tests/libtest/lib3100 /usr/lib/curl/ptest/tests/libtest/lib1550 /usr/lib/curl/ptest/tests/libtest/lib1560 /usr/lib/curl/ptest/tests/libtest/lib1900 /usr/lib/curl/ptest/tests/libtest/lib1910 /usr/lib/curl/ptest/tests/libtest/lib1940 /usr/lib/curl/ptest/tests/libtest/lib1960 /usr/lib/curl/ptest/tests/libtest/lib1970 /usr/lib/curl/ptest/tests/libtest/lib575 /usr/lib/curl/ptest/tests/libtest/lib574 /usr/lib/curl/ptest/tests/libtest/lib576 /usr/lib/curl/ptest/tests/libtest/lib1551 /usr/lib/curl/ptest/tests/libtest/lib1592 /usr/lib/curl/ptest/tests/libtest/lib1662 /usr/lib/curl/ptest/tests/libtest/lib1593 /usr/lib/curl/ptest/tests/libtest/lib1903 /usr/lib/curl/ptest/tests/libtest/lib1913 /usr/lib/curl/ptest/tests/libtest/lib1912 /usr/lib/curl/ptest/tests/libtest/lib1594 /usr/lib/curl/ptest/tests/libtest/lib1934 /usr/lib/cur
 l/ptest/tests/libtest/lib1964 /usr/lib/curl/ptest/tests/libtest/lib1974 /usr/lib/curl/ptest/tests/libtest/lib1933 /usr/lib/curl/ptest/tests/libtest/lib1905 /usr/lib/curl/ptest/tests/libtest/lib1915 /usr/lib/curl/ptest/tests/libtest/lib1935 /usr/lib/curl/ptest/tests/libtest/lib1945 /usr/lib/curl/ptest/tests/libtest/lib1955 /usr/lib/curl/ptest/tests/libtest/lib1975 /usr/lib/curl/ptest/tests/libtest/lib2405 /usr/lib/curl/ptest/tests/libtest/lib3025 /usr/lib/curl/ptest/tests/libtest/lib645 /usr/lib/curl/ptest/tests/libtest/lib3105 /usr/lib/curl/ptest/tests/libtest/lib643 /usr/lib/curl/ptest/tests/libtest/lib1906 /usr/lib/curl/ptest/tests/libtest/lib1916 /usr/lib/curl/ptest/tests/libtest/lib1936 /usr/lib/curl/ptest/tests/libtest/lib1946 /usr/lib/curl/ptest/tests/libtest/lib1907 /usr/lib/curl/ptest/tests/libtest/lib1917 /usr/lib/curl/ptest/tests/libtest/lib1937 /usr/lib/curl/ptest/tests/libtest/lib1947 /usr/lib/curl/ptest/tests/libtest/lib1957 /usr/lib/curl/ptest/tests/libtest/lib1918 /us
 r/lib/curl/ptest/tests/libtest/lib1938 /usr/lib/curl/ptest/tests/libtest/lib1948 /usr/lib/curl/ptest/tests/libtest/lib1958 /usr/lib/curl/ptest/tests/libtest/lib1978 /usr/lib/curl/ptest/tests/libtest/lib1559 /usr/lib/curl/ptest/tests/libtest/lib1569 /usr/lib/curl/ptest/tests/libtest/lib1919 /usr/lib/curl/ptest/tests/libtest/lib1939 /usr/lib/curl/ptest/tests/libtest/lib1959 /usr/lib/curl/ptest/tests/libtest/lib672 /usr/lib/curl/ptest/tests/libtest/lib673 /usr/lib/curl/ptest/tests/libtest/lib670 /usr/lib/curl/ptest/tests/libtest/lib671 /usr/lib/curl/ptest/tests/libtest/lib676 /usr/lib/curl/ptest/tests/libtest/lib677 /usr/lib/curl/ptest/tests/libtest/lib674 /usr/lib/curl/ptest/tests/server/dnsd /usr/lib/curl/ptest/tests/libtest/lib589 /usr/lib/curl/ptest/tests/libtest/lib678 /usr/lib/curl/ptest/tests/libtest/lib582 /usr/lib/curl/ptest/tests/libtest/lib583 /usr/lib/curl/ptest/tests/libtest/lib584 /usr/lib/curl/ptest/tests/libtest/lib585 /usr/lib/curl/ptest/tests/libtest/lib586 /usr/lib/c
 url/ptest/tests/libtest/lib500 /usr/lib/curl/ptest/tests/libtest/lib501 /usr/lib/curl/ptest/tests/libtest/lib502 /usr/lib/curl/ptest/tests/libtest/lib503 /usr/lib/curl/ptest/tests/libtest/lib504 /usr/lib/curl/ptest/tests/libtest/lib505 /usr/lib/curl/ptest/tests/libtest/lib506 /usr/lib/curl/ptest/tests/libtest/lib507 /usr/lib/curl/ptest/tests/libtest/lib508 /usr/lib/curl/ptest/tests/libtest/lib509 /usr/lib/curl/ptest/tests/libtest/lib571 /usr/lib/curl/ptest/tests/libtest/lib694 /usr/lib/curl/ptest/tests/libtest/lib695 /usr/lib/curl/ptest/tests/libtest/lib696 /usr/lib/curl/ptest/tests/libtest/lib570 /usr/lib/curl/ptest/tests/libtest/lib573 /usr/lib/curl/ptest/tests/server/tftpd /usr/lib/curl/ptest/tests/libtest/lib572 /usr/lib/curl/ptest/tests/libtest/lib1510 /usr/lib/curl/ptest/tests/libtest/lib1520 /usr/lib/curl/ptest/tests/libtest/lib1530 /usr/lib/curl/ptest/tests/libtest/lib1540 /usr/lib/curl/ptest/tests/server/sockfilt /usr/lib/curl/ptest/tests/libtest/lib661 /usr/lib/curl/ptest/
 tests/libtest/lib599 /usr/lib/curl/ptest/tests/libtest/lib598 /usr/lib/curl/ptest/tests/libtest/lib667 /usr/lib/curl/ptest/tests/libtest/lib666 /usr/lib/curl/ptest/tests/libtest/lib668 /usr/lib/curl/ptest/tests/libtest/lib597 /usr/lib/curl/ptest/tests/libtest/lib579 /usr/lib/curl/ptest/tests/libtest/lib1571 /usr/lib/curl/ptest/tests/libtest/lib517 /usr/lib/curl/ptest/tests/libtest/lib516 /usr/lib/curl/ptest/tests/libtest/lib515 /usr/lib/curl/ptest/tests/libtest/lib514 /usr/lib/curl/ptest/tests/libtest/lib513 /usr/lib/curl/ptest/tests/libtest/lib512 /usr/lib/curl/ptest/tests/libtest/lib511 /usr/lib/curl/ptest/tests/libtest/lib510 /usr/lib/curl/ptest/tests/libtest/lib1591 /usr/lib/curl/ptest/tests/server/resolve /usr/lib/curl/ptest/tests/libtest/lib578 /usr/lib/curl/ptest/tests/libtest/lib519 /usr/lib/curl/ptest/tests/libtest/lib518 /usr/lib/curl/ptest/tests/libtest/lib1972 /usr/lib/curl/ptest/tests/libtest/lib2302 /usr/lib/curl/ptest/tests/libtest/lib2402 /usr/lib/curl/ptest/tests/li
 btest/lib2502 /usr/lib/curl/ptest/tests/libtest/lib3102 /usr/lib/curl/ptest/tests/libtest/lib1512 /usr/lib/curl/ptest/tests/libtest/lib1522 /usr/lib/curl/ptest/tests/libtest/lib1532 /usr/lib/curl/ptest/tests/libtest/lib1542 /usr/lib/curl/ptest/tests/libtest/lib1552 /usr/lib/curl/ptest/tests/libtest/libprereq /usr/lib/curl/ptest/tests/libtest/lib1973 /usr/lib/curl/ptest/tests/libtest/lib3103 /usr/lib/curl/ptest/tests/libtest/lib1513 /usr/lib/curl/ptest/tests/libtest/lib1523 /usr/lib/curl/ptest/tests/libtest/lib1533 /usr/lib/curl/ptest/tests/libtest/lib1543 /usr/lib/curl/ptest/tests/libtest/lib1553 /usr/lib/curl/ptest/tests/libtest/lib751 /usr/lib/curl/ptest/tests/libtest/lib529 /usr/lib/curl/ptest/tests/server/sws /usr/lib/curl/ptest/tests/libtest/lib523 /usr/lib/curl/ptest/tests/libtest/lib520 /usr/lib/curl/ptest/tests/libtest/lib521 /usr/lib/curl/ptest/tests/libtest/lib526 /usr/lib/curl/ptest/tests/libtest/lib527 /usr/lib/curl/ptest/tests/libtest/lib524 /usr/lib/curl/ptest/tests/li
 btest/lib525 /usr/lib/curl/ptest/tests/libtest/lib1500 /usr/lib/curl/ptest/tests/libtest/lib1301 /usr/lib/curl/ptest/tests/libtest/lib1501 /usr/lib/curl/ptest/tests/libtest/lib1502 /usr/lib/curl/ptest/tests/libtest/lib1503 /usr/lib/curl/ptest/tests/libtest/lib1485 /usr/lib/curl/ptest/tests/libtest/lib1156 /usr/lib/curl/ptest/tests/libtest/lib1504 /usr/lib/curl/ptest/tests/libtest/lib1308 /usr/lib/curl/ptest/tests/libtest/lib1505 /usr/lib/curl/ptest/tests/libtest/lib1506 /usr/lib/curl/ptest/tests/libtest/lib1507 /usr/lib/curl/ptest/tests/libtest/lib1508 /usr/lib/curl/ptest/tests/libtest/lib1509 /usr/lib/curl/ptest/tests/libtest/lib1517 /usr/lib/curl/ptest/tests/libtest/lib1518 /usr/lib/curl/ptest/tests/libtest/lib1528 /usr/lib/curl/ptest/tests/libtest/lib1529 /usr/lib/curl/ptest/tests/libtest/lib1539 /usr/lib/curl/ptest/tests/libtest/lib1515 /usr/lib/curl/ptest/tests/libtest/lib1525 /usr/lib/curl/ptest/tests/libtest/lib1535 /usr/lib/curl/ptest/tests/libtest/lib1545 /usr/lib/curl/ptes
 t/tests/libtest/lib1555 /usr/lib/curl/ptest/tests/libtest/lib1565 /usr/lib/curl/ptest/tests/libtest/lib1956 /usr/lib/curl/ptest/tests/libtest/lib2306 /usr/lib/curl/ptest/tests/libtest/lib3026 /usr/lib/curl/ptest/tests/libtest/lib1526 /usr/lib/curl/ptest/tests/libtest/lib539 /usr/lib/curl/ptest/tests/libtest/lib1536 /usr/lib/curl/ptest/tests/libtest/lib1556 /usr/lib/curl/ptest/tests/libtest/lib1576 /usr/lib/curl/ptest/tests/libtest/lib1596 /usr/lib/curl/ptest/tests/libtest/lib530 /usr/lib/curl/ptest/tests/libtest/lib533 /usr/lib/curl/ptest/tests/libtest/lib532 /usr/lib/curl/ptest/tests/libtest/lib537 /usr/lib/curl/ptest/tests/libtest/lib536 /usr/lib/curl/ptest/tests/libtest/lib1977 /usr/lib/curl/ptest/tests/libtest/lib3027 /usr/lib/curl/ptest/tests/libtest/lib3207 /usr/lib/curl/ptest/tests/libtest/lib1527 /usr/lib/curl/ptest/tests/libtest/lib1537 /usr/lib/curl/ptest/tests/libtest/lib1557 /usr/lib/curl/ptest/tests/libtest/lib1567 /usr/lib/curl/ptest/tests/libtest/lib1597 /usr/lib/curl
 /ptest/tests/server/socksd /usr/lib/curl/ptest/tests/libtest/lib1578 /usr/lib/curl/ptest/tests/libtest/lib1598 /usr/lib/curl/ptest/tests/libtest/lib1908 /usr/lib/curl/ptest/tests/libtest/lib591 /usr/lib/curl/ptest/tests/libtest/lib2308 /usr/lib/curl/ptest/tests/libtest/lib3208 /usr/lib/curl/ptest/tests/libtest/lib1538 /usr/lib/curl/ptest/tests/libtest/lib1558 /usr/lib/curl/ptest/tests/libtest/lib1568 /usr/lib/curl/ptest/tests/libtest/lib2304 /usr/lib/curl/ptest/tests/libtest/lib2404 /usr/lib/curl/ptest/tests/libtest/lib3104 /usr/lib/curl/ptest/tests/libtest/lib1514 /usr/lib/curl/ptest/tests/libtest/lib1534 /usr/lib/curl/ptest/tests/libtest/lib1554 /usr/lib/curl/ptest/tests/libtest/lib1564 /usr/lib/curl/ptest/tests/libtest/lib590 /usr/lib/curl/ptest/tests/libtest/lib1521 /usr/lib/curl/ptest/tests/libtest/lib1531 /usr/lib/curl/ptest/tests/libtest/lib1541 /usr/lib/curl/ptest/tests/libtest/lib548 /usr/lib/curl/ptest/tests/libtest/lib549 /usr/lib/curl/ptest/tests/libtest/lib2309 /usr/lib
 /curl/ptest/tests/libtest/lib544 /usr/lib/curl/ptest/tests/libtest/lib545 /usr/lib/curl/ptest/tests/server/mqttd /usr/lib/curl/ptest/tests/libtest/lib547 /usr/lib/curl/ptest/tests/libtest/lib540 /usr/lib/curl/ptest/tests/libtest/lib541 /usr/lib/curl/ptest/tests/libtest/lib542 /usr/lib/curl/ptest/tests/libtest/lib543 /usr/lib/curl/ptest/tests/server/rtspd /usr/lib/curl/ptest/tests/libtest/libntlmconnect /usr/lib/curl/ptest/tests/libtest/libauthretry /usr/lib/curl/ptest/tests/libtest/lib553 /usr/lib/curl/ptest/tests/libtest/lib552 /usr/lib/curl/ptest/tests/libtest/lib557 /usr/lib/curl/ptest/tests/libtest/lib556 /usr/lib/curl/ptest/tests/libtest/lib555 /usr/lib/curl/ptest/tests/libtest/lib554 /usr/lib/curl/ptest/tests/libtest/lib559 /usr/lib/curl/ptest/tests/libtest/lib558 /usr/lib/curl/ptest/tests/mk-bundle.pl /usr/lib/curl/ptest/tests/libtest/lib566 /usr/lib/curl/ptest/tests/libtest/lib567 /usr/lib/curl/ptest/tests/libtest/lib564 /usr/lib/curl/ptest/tests/libtest/lib565 /usr/lib/curl
 /ptest/tests/libtest/lib562 /usr/lib/curl/ptest/tests/libtest/lib560 /usr/lib/curl/ptest/tests/libtest/lib1901 /usr/lib/curl/ptest/tests/libtest/lib1911 /usr/lib/curl/ptest/tests/libtest/lib568 /usr/lib/curl/ptest/tests/libtest/lib569 /usr/lib/curl/ptest/tests/libtest/lib658 /usr/lib/curl/ptest/tests/libtest/lib659 /usr/lib/curl/ptest/tests/libtest/lib1971 /usr/lib/curl/ptest/tests/libtest/lib2301 /usr/lib/curl/ptest/tests/libtest/lib3101 /usr/lib/curl/ptest/tests/libtest/lib1511 /usr/lib/curl/ptest/tests/libtest/lib587 /usr/lib/curl/ptest/tests/libtest/lib650 /usr/lib/curl/ptest/tests/libtest/lib651 /usr/lib/curl/ptest/tests/libtest/lib652 /usr/lib/curl/ptest/tests/libtest/lib653 /usr/lib/curl/ptest/tests/libtest/lib654 /usr/lib/curl/ptest/tests/libtest/lib655", added "/usr/lib/curl/ptest/tests/data/test753 /usr/lib/curl/ptest/tests/data/test752 /usr/lib/curl/ptest/tests/libtest/libtests /usr/lib/curl/ptest/tests/data/test793 /usr/lib/curl/ptest/tests/data/test792 /usr/lib/curl/pte
 st/tests/data/test1547 /usr/lib/curl/ptest/tests/data/test754 /usr/lib/curl/ptest/tests/data/test3214 /usr/lib/curl/ptest/tests/server/servers /usr/lib/curl/ptest/tests/data/test1599 /usr/lib/curl/ptest/tests/data/test2103 /usr/lib/curl/ptest/tests/data/test1499"
packages/core2-64-poky-linux/curl/curl-ptest: PKGSIZE changed from 7348139 to 3803414 (-48%)

--===============5422412529295120486==--

