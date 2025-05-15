Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C87CC71131
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 12:32:12 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.11264.1747312317228362051
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 05:32:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=vJWi3fv5;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=QCi/YNWS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010196d3ee3840-971ff495-1576-4003-b3bd-77687004c3e2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1747312326;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=JzS9bmrFwl+IDppizTgyNK079RD5qDY5MzRn62rsT7M=;
	b=vJWi3fv5SNNfyAmNkNlRKe/NAOExURKfzjkcUbYL7KbDN9NZWyeA7ho3geb4G+G4
	a3x7cxdJyvy6OAMnL3Bx/cUgtG84oQoAO+rbyfkD76vBy0ZklxB1ymO16oEKQcEnbgb
	LFKZyRGZxy80t41y7RsxcbB6LQ7SwXZXbe9cLSfs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1747312326;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=JzS9bmrFwl+IDppizTgyNK079RD5qDY5MzRn62rsT7M=;
	b=QCi/YNWSuYq+Fjbdukrc76gZMggwErvjbadQhUAhJyrWh3byrHwbpYWQj3dr9ZG9
	UmExu24FiFVJDjGRCRfKzdgFjSNg7emBqMYDZaG9YzmjL76JLtarA5G6fDR9PLOU3m9
	hqFUOQT/WO2NeBKkCPdwTOf3FBG5jqCwv0WxOwgI=
Content-Type: multipart/mixed; boundary="===============0700775958496922552=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Joslyn <robert.joslyn@redrectangle.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] curl: upgrading to 8.13.0 SUCCEEDED
Message-ID: <01010196d3ee3840-971ff495-1576-4003-b3bd-77687004c3e2-000000@us-west-2.amazonses.com>
Date: Thu, 15 May 2025 12:32:06 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 12:32:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216656

--===============0700775958496922552==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *curl* to *8.13.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-curl-upgrade-8.12.1-8.13.0.patch
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
From 64a4be3303d8b69d753d76f596bc8551090d0dfc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 May 2025 12:05:36 +0000
Subject: [PATCH] curl: upgrade 8.12.1 -> 8.13.0

---
 meta/recipes-support/curl/curl/no-test-timeout.patch        | 6 +++---
 .../recipes-support/curl/{curl_8.12.1.bb => curl_8.13.0.bb} | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/curl/{curl_8.12.1.bb => curl_8.13.0.bb} (98%)

diff --git a/meta/recipes-support/curl/curl/no-test-timeout.patch b/meta/recipes-support/curl/curl/no-test-timeout.patch
index 677d177302..dd7ad38dca 100644
--- a/meta/recipes-support/curl/curl/no-test-timeout.patch
+++ b/meta/recipes-support/curl/curl/no-test-timeout.patch
@@ -1,4 +1,4 @@
-From 42cddb52e821cfc2f09f1974742714e5f2f1856e Mon Sep 17 00:00:00 2001
+From 7ac1fd5b52ab82b06c0d80b3be46777d8bb5875d Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Fri, 15 Mar 2024 14:37:37 +0000
 Subject: [PATCH] Set the max-time timeout to 600 so the timeout is 10 minutes
@@ -11,10 +11,10 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tests/servers.pm b/tests/servers.pm
-index d4472d5..9999938 100644
+index a3e5edb..f75df79 100644
 --- a/tests/servers.pm
 +++ b/tests/servers.pm
-@@ -123,7 +123,7 @@ my $sshdverstr;  # for socks server, ssh daemon version string
+@@ -124,7 +124,7 @@ my $sshdverstr;  # for socks server, ssh daemon version string
  my $sshderror;   # for socks server, ssh daemon version error
  my %doesntrun;    # servers that don't work, identified by pidfile
  my %PORT = (nolisten => 47); # port we use for a local non-listening service
diff --git a/meta/recipes-support/curl/curl_8.12.1.bb b/meta/recipes-support/curl/curl_8.13.0.bb
similarity index 98%
rename from meta/recipes-support/curl/curl_8.12.1.bb
rename to meta/recipes-support/curl/curl_8.13.0.bb
index 4192693da8..b9b5ef1a15 100644
--- a/meta/recipes-support/curl/curl_8.12.1.bb
+++ b/meta/recipes-support/curl/curl_8.13.0.bb
@@ -20,7 +20,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-curl.sh \
 "
 
-SRC_URI[sha256sum] = "0341f1ed97a26c811abaebd37d62b833956792b7607ea3f15d001613c76de202"
+SRC_URI[sha256sum] = "4a093979a3c2d02de2fbc00549a32771007f2e78032c6faa5ecd2f7a9e152025"
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
-- 
2.47.1


--===============0700775958496922552==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/curl/curl-dbg: PV changed from "8.12.1" to "8.13.0"
packages/core2-64-poky-linux/curl/curl-dbg: PKGV changed from 8.12.1 [default] to 8.13.0 [default]
packages/core2-64-poky-linux/curl/curl-dbg: PKGSIZE changed from 15846904 to 16362600 (+3%)
packages/core2-64-poky-linux/curl/curl-dbg: FILELIST: removed "/usr/lib/curl/ptest/tests/server/.debug/getpart", added "/usr/lib/curl/ptest/tests/libtest/.debug/lib1978 /usr/lib/curl/ptest/tests/libtest/.debug/lib2311 /usr/lib/curl/ptest/tests/libtest/.debug/lib1576 /usr/lib/curl/ptest/tests/libtest/.debug/lib1571 /usr/lib/curl/ptest/tests/libtest/.debug/lib1578"
packages/core2-64-poky-linux/curl/curl-dev: PV changed from "8.12.1" to "8.13.0"
packages/core2-64-poky-linux/curl/curl-dev: PKGV changed from 8.12.1 [default] to 8.13.0 [default]
packages/core2-64-poky-linux/curl/curl-dev: PKGSIZE changed from 255759 to 257795 (+1%)
packages/core2-64-poky-linux/curl/curl-doc: PV changed from "8.12.1" to "8.13.0"
packages/core2-64-poky-linux/curl/curl-doc: PKGV changed from 8.12.1 [default] to 8.13.0 [default]
packages/core2-64-poky-linux/curl/curl-doc: PKGSIZE changed from 1604480 to 1627481 (+1%)
packages/core2-64-poky-linux/curl/curl-doc: FILELIST: added "/usr/share/man/man3/CURLOPT_UPLOAD_FLAGS.3"
packages/core2-64-poky-linux/curl/curl-locale: PV changed from "8.12.1" to "8.13.0"
packages/core2-64-poky-linux/curl/curl-locale: PKGV changed from 8.12.1 [default] to 8.13.0 [default]
packages/core2-64-poky-linux/curl/curl-ptest: PV changed from "8.12.1" to "8.13.0"
packages/core2-64-poky-linux/curl/curl-ptest: PKGV changed from 8.12.1 [default] to 8.13.0 [default]
packages/core2-64-poky-linux/curl/curl-ptest: PKGSIZE changed from 7237260 to 7396472 (+2%)
packages/core2-64-poky-linux/curl/curl-ptest: FILELIST: removed "/usr/lib/curl/ptest/tests/server/getpart", added "/usr/lib/curl/ptest/tests/libtest/lib1571 /usr/lib/curl/ptest/tests/libtest/lib2311 /usr/lib/curl/ptest/tests/libtest/lib1576 /usr/lib/curl/ptest/tests/libtest/lib1578 /usr/lib/curl/ptest/tests/libtest/lib1978 /usr/lib/curl/ptest/tests/data/test2311 /usr/lib/curl/ptest/tests/data/test1581 /usr/lib/curl/ptest/tests/data/test1580 /usr/lib/curl/ptest/tests/data/test1978 /usr/lib/curl/ptest/tests/data/test698 /usr/lib/curl/ptest/tests/data/test3210 /usr/lib/curl/ptest/tests/data/test2101 /usr/lib/curl/ptest/tests/data/test1579 /usr/lib/curl/ptest/tests/data/test76 /usr/lib/curl/ptest/tests/data/test3209 /usr/lib/curl/ptest/tests/data/test1574 /usr/lib/curl/ptest/tests/data/test1575 /usr/lib/curl/ptest/tests/data/test1576 /usr/lib/curl/ptest/tests/data/test1577 /usr/lib/curl/ptest/tests/data/test488 /usr/lib/curl/ptest/tests/data/test1571 /usr/lib/curl/ptest/tests/data/test15
 72 /usr/lib/curl/ptest/tests/data/test1573 /usr/lib/curl/ptest/tests/data/test489 /usr/lib/curl/ptest/tests/data/test1578 /usr/lib/curl/ptest/tests/data/test487"
packages/core2-64-poky-linux/curl/curl-src: PV changed from "8.12.1" to "8.13.0"
packages/core2-64-poky-linux/curl/curl-src: PKGV changed from 8.12.1 [default] to 8.13.0 [default]
packages/core2-64-poky-linux/curl/curl-src: PKGSIZE changed from 221783 to 222750 (+0%)
packages/core2-64-poky-linux/curl/curl-staticdev: PV changed from "8.12.1" to "8.13.0"
packages/core2-64-poky-linux/curl/curl-staticdev: PKGV changed from 8.12.1 [default] to 8.13.0 [default]
packages/core2-64-poky-linux/curl/curl: PV changed from "8.12.1" to "8.13.0"
packages/core2-64-poky-linux/curl/curl: PKGV changed from 8.12.1 [default] to 8.13.0 [default]
packages/core2-64-poky-linux/curl/curl: PKGSIZE changed from 211256 to 219448 (+4%)
packages/core2-64-poky-linux/curl: SRC_URI changed from "https://curl.se/download/curl-8.12.1.tar.xz file://run-ptest file://disable-tests file://no-test-timeout.patch" to "https://curl.se/download/curl-8.13.0.tar.xz file://run-ptest file://disable-tests file://no-test-timeout.patch"
packages/core2-64-poky-linux/curl: PV changed from "8.12.1" to "8.13.0"
packages/core2-64-poky-linux/curl: PKGV changed from 8.12.1 [default] to 8.13.0 [default]
packages/core2-64-poky-linux/curl/libcurl: PV changed from "8.12.1" to "8.13.0"
packages/core2-64-poky-linux/curl/libcurl: PKGV changed from 8.12.1 [default] to 8.13.0 [default]
packages/core2-64-poky-linux/curl/libcurl: PKGSIZE changed from 626304 to 651008 (+4%)

--===============0700775958496922552==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/curl/curl-doc: FILELIST: added "/usr/share/man/man3/CURLOPT_UPLOAD_FLAGS.3"
packages/core2-64-poky-linux/curl/curl-ptest: FILELIST: removed "/usr/lib/curl/ptest/tests/server/getpart", added "/usr/lib/curl/ptest/tests/data/test1574 /usr/lib/curl/ptest/tests/data/test1575 /usr/lib/curl/ptest/tests/data/test1576 /usr/lib/curl/ptest/tests/data/test1577 /usr/lib/curl/ptest/tests/data/test488 /usr/lib/curl/ptest/tests/data/test1571 /usr/lib/curl/ptest/tests/data/test1572 /usr/lib/curl/ptest/tests/data/test1573 /usr/lib/curl/ptest/tests/data/test489 /usr/lib/curl/ptest/tests/data/test1578 /usr/lib/curl/ptest/tests/data/test1579 /usr/lib/curl/ptest/tests/data/test487 /usr/lib/curl/ptest/tests/data/test3209 /usr/lib/curl/ptest/tests/data/test2311 /usr/lib/curl/ptest/tests/data/test1581 /usr/lib/curl/ptest/tests/data/test1580 /usr/lib/curl/ptest/tests/libtest/lib1571 /usr/lib/curl/ptest/tests/libtest/lib2311 /usr/lib/curl/ptest/tests/libtest/lib1576 /usr/lib/curl/ptest/tests/libtest/lib1978 /usr/lib/curl/ptest/tests/libtest/lib1578 /usr/lib/curl/ptest/tests/data/test1
 978 /usr/lib/curl/ptest/tests/data/test3210 /usr/lib/curl/ptest/tests/data/test698 /usr/lib/curl/ptest/tests/data/test2101 /usr/lib/curl/ptest/tests/data/test76"

--===============0700775958496922552==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-curl-upgrade-8.12.1-8.13.0.patch"

RnJvbSA2NGE0YmUzMzAzZDhiNjlkNzUzZDc2ZjU5NmJjODU1MTA5MGQwZGZjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgTWF5IDIwMjUgMTI6MDU6MzYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
dXJsOiB1cGdyYWRlIDguMTIuMSAtPiA4LjEzLjAKCi0tLQogbWV0YS9yZWNpcGVzLXN1cHBvcnQv
Y3VybC9jdXJsL25vLXRlc3QtdGltZW91dC5wYXRjaCAgICAgICAgfCA2ICsrKy0tLQogLi4uL3Jl
Y2lwZXMtc3VwcG9ydC9jdXJsL3tjdXJsXzguMTIuMS5iYiA9PiBjdXJsXzguMTMuMC5iYn0gfCAy
ICstCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9jdXJsL3tjdXJsXzguMTIuMS5iYiA9PiBjdXJsXzgu
MTMuMC5iYn0gKDk4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9jdXJsL2N1
cmwvbm8tdGVzdC10aW1lb3V0LnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvY3VybC9jdXJs
L25vLXRlc3QtdGltZW91dC5wYXRjaAppbmRleCA2NzdkMTc3MzAyLi5kZDdhZDM4ZGNhIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9jdXJsL2N1cmwvbm8tdGVzdC10aW1lb3V0LnBh
dGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2N1cmwvY3VybC9uby10ZXN0LXRpbWVvdXQu
cGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDQyY2RkYjUyZTgyMWNmYzJmMDlmMTk3NDc0Mjcx
NGU1ZjJmMTg1NmUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDdhYzFmZDViNTJhYjgy
YjA2YzBkODBiM2JlNDY3NzdkOGJiNTg3NWQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9t
OiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4KIERhdGU6IEZyaSwgMTUgTWFyIDIw
MjQgMTQ6Mzc6MzcgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gU2V0IHRoZSBtYXgtdGltZSB0aW1l
b3V0IHRvIDYwMCBzbyB0aGUgdGltZW91dCBpcyAxMCBtaW51dGVzCkBAIC0xMSwxMCArMTEsMTAg
QEAgU2lnbmVkLW9mZi1ieTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGFybS5jb20+CiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQg
YS90ZXN0cy9zZXJ2ZXJzLnBtIGIvdGVzdHMvc2VydmVycy5wbQotaW5kZXggZDQ0NzJkNS4uOTk5
OTkzOCAxMDA2NDQKK2luZGV4IGEzZTVlZGIuLmY3NWRmNzkgMTAwNjQ0CiAtLS0gYS90ZXN0cy9z
ZXJ2ZXJzLnBtCiArKysgYi90ZXN0cy9zZXJ2ZXJzLnBtCi1AQCAtMTIzLDcgKzEyMyw3IEBAIG15
ICRzc2hkdmVyc3RyOyAgIyBmb3Igc29ja3Mgc2VydmVyLCBzc2ggZGFlbW9uIHZlcnNpb24gc3Ry
aW5nCitAQCAtMTI0LDcgKzEyNCw3IEBAIG15ICRzc2hkdmVyc3RyOyAgIyBmb3Igc29ja3Mgc2Vy
dmVyLCBzc2ggZGFlbW9uIHZlcnNpb24gc3RyaW5nCiAgbXkgJHNzaGRlcnJvcjsgICAjIGZvciBz
b2NrcyBzZXJ2ZXIsIHNzaCBkYWVtb24gdmVyc2lvbiBlcnJvcgogIG15ICVkb2VzbnRydW47ICAg
ICMgc2VydmVycyB0aGF0IGRvbid0IHdvcmssIGlkZW50aWZpZWQgYnkgcGlkZmlsZQogIG15ICVQ
T1JUID0gKG5vbGlzdGVuID0+IDQ3KTsgIyBwb3J0IHdlIHVzZSBmb3IgYSBsb2NhbCBub24tbGlz
dGVuaW5nIHNlcnZpY2UKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2N1cmwvY3Vy
bF84LjEyLjEuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9jdXJsL2N1cmxfOC4xMy4wLmJiCnNp
bWlsYXJpdHkgaW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2N1cmwv
Y3VybF84LjEyLjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2N1cmwvY3VybF84
LjEzLjAuYmIKaW5kZXggNDE5MjY5M2RhOC4uYjliNWVmMWExNSAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvY3VybC9jdXJsXzguMTIuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC9jdXJsL2N1cmxfOC4xMy4wLmJiCkBAIC0yMCw3ICsyMCw3IEBAIFNSQ19VUkk6YXBwZW5k
OmNsYXNzLW5hdGl2ZXNkayA9ICIgXAogICAgICAgICAgICBmaWxlOi8vZW52aXJvbm1lbnQuZC1j
dXJsLnNoIFwKICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjAzNDFmMWVkOTdhMjZjODExYWJh
ZWJkMzdkNjJiODMzOTU2NzkyYjc2MDdlYTNmMTVkMDAxNjEzYzc2ZGUyMDIiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiNGEwOTM5NzlhM2MyZDAyZGUyZmJjMDA1NDlhMzI3NzEwMDdmMmU3ODAzMmM2
ZmFhNWVjZDJmN2E5ZTE1MjAyNSIKIAogIyBDdXJsIGhhcyB1c2VkIG1hbnkgbmFtZXMgb3ZlciB0
aGUgeWVhcnMuLi4KIENWRV9QUk9EVUNUID0gImhheHg6Y3VybCBoYXh4OmxpYmN1cmwgY3VybDpj
dXJsIGN1cmw6bGliY3VybCBsaWJjdXJsOmxpYmN1cmwgZGFuaWVsX3N0ZW5iZXJnOmN1cmwiCi0t
IAoyLjQ3LjEKCg==

--===============0700775958496922552==--

