Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E759CCD185
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 11:55:00 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.30909.1757937292466247228
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 04:54:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=UWfmjvK6;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=nUIe7bm9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101994d3a6183-28425f0f-c12f-479d-81d9-90c716596266-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1757937295;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3+F8/67IsUte4CzXupvDqLywWRsGfw/10ISsh8QPXbE=;
	b=UWfmjvK6bV7JWorvSvzuko5h1YDK925hSHSx9Yy+1DwOJBrqxf3SrlLoSQZRBzhY
	auPK4p6f1AZIuyq4V+tLhWXgPDknBwKEdxH3HJO/6dRN47jI5vy3Kr5JuX8KD80esn2
	jL3mVVmdfds4oUbd2eM8NUvmz8vQVnDmVzMROFlA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1757937295;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3+F8/67IsUte4CzXupvDqLywWRsGfw/10ISsh8QPXbE=;
	b=nUIe7bm9MOhUYiN/RHtCMao5J80DspaV0cqV0Gb1N5D9/fGIivXCsyFM41bVJcWs
	tXPpmQ25xypdcomtuFSD2JY4l++EOgmtDJ8zmp5fUen1At35hyb7fA+7WJwnkmNbh6f
	k3HXXetf9ZUQTO73I+WJjxhTMQhhcu2NqI84OixM=
Content-Type: multipart/mixed; boundary="===============4851177713393414911=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Joslyn <robert.joslyn@redrectangle.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] curl: upgrading to 8.16.0 SUCCEEDED
Message-ID: <010101994d3a6183-28425f0f-c12f-479d-81d9-90c716596266-000000@us-west-2.amazonses.com>
Date: Mon, 15 Sep 2025 11:54:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 11:55:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223475

--===============4851177713393414911==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *curl* to *8.16.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-curl-upgrade-8.15.0-8.16.0.patch
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
From 2aa279358f4a4cede3525befd5772872d8694dd3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Sep 2025 11:38:48 +0000
Subject: [PATCH] curl: upgrade 8.15.0 -> 8.16.0

---
 meta/recipes-support/curl/curl/no-test-timeout.patch        | 6 +++---
 .../recipes-support/curl/{curl_8.15.0.bb => curl_8.16.0.bb} | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/curl/{curl_8.15.0.bb => curl_8.16.0.bb} (98%)

diff --git a/meta/recipes-support/curl/curl/no-test-timeout.patch b/meta/recipes-support/curl/curl/no-test-timeout.patch
index 5b901a6fe9..efe5df8a05 100644
--- a/meta/recipes-support/curl/curl/no-test-timeout.patch
+++ b/meta/recipes-support/curl/curl/no-test-timeout.patch
@@ -1,4 +1,4 @@
-From 42cddb52e821cfc2f09f1974742714e5f2f1856e Mon Sep 17 00:00:00 2001
+From 408a185fadb4f12fbc4950e63a9c7d400ea47110 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Fri, 15 Mar 2024 14:37:37 +0000
 Subject: [PATCH] Set the max-time timeout to 600 so the timeout is 10 minutes
@@ -11,10 +11,10 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tests/servers.pm b/tests/servers.pm
-index d4472d5..9999938 100644
+index e625058..41655d6 100644
 --- a/tests/servers.pm
 +++ b/tests/servers.pm
-@@ -124,7 +124,7 @@ my $sshdverstr;  # for socks server, ssh daemon version string
+@@ -125,7 +125,7 @@ my $sshdverstr;  # for socks server, ssh daemon version string
  my $sshderror;   # for socks server, ssh daemon version error
  my %doesntrun;    # servers that don't work, identified by pidfile
  my %PORT = (nolisten => 47); # port we use for a local non-listening service
diff --git a/meta/recipes-support/curl/curl_8.15.0.bb b/meta/recipes-support/curl/curl_8.16.0.bb
similarity index 98%
rename from meta/recipes-support/curl/curl_8.15.0.bb
rename to meta/recipes-support/curl/curl_8.16.0.bb
index 809aac8bec..c226670357 100644
--- a/meta/recipes-support/curl/curl_8.15.0.bb
+++ b/meta/recipes-support/curl/curl_8.16.0.bb
@@ -20,7 +20,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-curl.sh \
 "
 
-SRC_URI[sha256sum] = "6cd0a8a5b126ddfda61c94dc2c3fc53481ba7a35461cf7c5ab66aa9d6775b609"
+SRC_URI[sha256sum] = "40c8cddbcb6cc6251c03dea423a472a6cea4037be654ba5cf5dec6eb2d22ff1d"
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
-- 
2.47.1


--===============4851177713393414911==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/curl/curl-dbg: PKGSIZE changed from 5893232 to 6048392 (+3%)
packages/x86-64-v3-poky-linux/curl/curl-dbg: PV changed from "8.15.0" to "8.16.0"
packages/x86-64-v3-poky-linux/curl/curl-dbg: PKGV changed from 8.15.0 [default] to 8.16.0 [default]
packages/x86-64-v3-poky-linux/curl/curl-dev: PKGSIZE changed from 264308 to 271906 (+3%)
packages/x86-64-v3-poky-linux/curl/curl-dev: PV changed from "8.15.0" to "8.16.0"
packages/x86-64-v3-poky-linux/curl/curl-dev: PKGV changed from 8.15.0 [default] to 8.16.0 [default]
packages/x86-64-v3-poky-linux/curl/curl-doc: PKGSIZE changed from 1636480 to 1668389 (+2%)
packages/x86-64-v3-poky-linux/curl/curl-doc: FILELIST: added "/usr/share/man/man3/CURLMINFO_XFERS_ADDED.3 /usr/share/man/man3/CURLMINFO_XFERS_CURRENT.3 /usr/share/man/man3/CURLMINFO_XFERS_DONE.3 /usr/share/man/man3/CURLMINFO_XFERS_PENDING.3 /usr/share/man/man3/curl_ws_start_frame.3 /usr/share/man/man3/CURLMINFO_XFERS_RUNNING.3 /usr/share/man/man3/CURLMOPT_NETWORK_CHANGED.3 /usr/share/man/man3/curl_multi_get_offt.3"
packages/x86-64-v3-poky-linux/curl/curl-doc: PV changed from "8.15.0" to "8.16.0"
packages/x86-64-v3-poky-linux/curl/curl-doc: PKGV changed from 8.15.0 [default] to 8.16.0 [default]
packages/x86-64-v3-poky-linux/curl/curl-locale: PV changed from "8.15.0" to "8.16.0"
packages/x86-64-v3-poky-linux/curl/curl-locale: PKGV changed from 8.15.0 [default] to 8.16.0 [default]
packages/x86-64-v3-poky-linux/curl/curl-ptest: PKGSIZE changed from 3807353 to 3855818 (+1%)
packages/x86-64-v3-poky-linux/curl/curl-ptest: FILELIST: added "/usr/lib/curl/ptest/tests/data/test1548 /usr/lib/curl/ptest/tests/data/test1981 /usr/lib/curl/ptest/tests/data/test1549 /usr/lib/curl/ptest/tests/data/test2307 /usr/lib/curl/ptest/tests/data/test760 /usr/lib/curl/ptest/tests/data/test761 /usr/lib/curl/ptest/tests/data/test3034 /usr/lib/curl/ptest/tests/data/test762 /usr/lib/curl/ptest/tests/data/test763 /usr/lib/curl/ptest/tests/data/test3033 /usr/lib/curl/ptest/tests/data/test2104 /usr/lib/curl/ptest/tests/data/test3215 /usr/lib/curl/ptest/tests/data/test795 /usr/lib/curl/ptest/tests/data/test794 /usr/lib/curl/ptest/tests/data/test797 /usr/lib/curl/ptest/tests/data/test796 /usr/lib/curl/ptest/tests/data/test759 /usr/lib/curl/ptest/tests/data/test758 /usr/lib/curl/ptest/tests/data/test755 /usr/lib/curl/ptest/tests/data/test757 /usr/lib/curl/ptest/tests/data/test756"
packages/x86-64-v3-poky-linux/curl/curl-ptest: PV changed from "8.15.0" to "8.16.0"
packages/x86-64-v3-poky-linux/curl/curl-ptest: RDEPENDS: added "libcrypto (['>= 3.5.2']) libssl (['>= 3.5.2'])"
packages/x86-64-v3-poky-linux/curl/curl-ptest: PKGV changed from 8.15.0 [default] to 8.16.0 [default]
packages/x86-64-v3-poky-linux/curl/curl-src: PKGSIZE changed from 235418 to 236336 (+0%)
packages/x86-64-v3-poky-linux/curl/curl-src: PV changed from "8.15.0" to "8.16.0"
packages/x86-64-v3-poky-linux/curl/curl-src: PKGV changed from 8.15.0 [default] to 8.16.0 [default]
packages/x86-64-v3-poky-linux/curl/curl-staticdev: PV changed from "8.15.0" to "8.16.0"
packages/x86-64-v3-poky-linux/curl/curl-staticdev: PKGV changed from 8.15.0 [default] to 8.16.0 [default]
packages/x86-64-v3-poky-linux/curl/curl: PV changed from "8.15.0" to "8.16.0"
packages/x86-64-v3-poky-linux/curl/curl: PKGV changed from 8.15.0 [default] to 8.16.0 [default]
packages/x86-64-v3-poky-linux/curl: SRC_URI changed from "https://curl.se/download/curl-8.15.0.tar.xz file://run-ptest file://disable-tests file://no-test-timeout.patch" to "https://curl.se/download/curl-8.16.0.tar.xz file://run-ptest file://disable-tests file://no-test-timeout.patch"
packages/x86-64-v3-poky-linux/curl: PV changed from "8.15.0" to "8.16.0"
packages/x86-64-v3-poky-linux/curl: PKGV changed from 8.15.0 [default] to 8.16.0 [default]
packages/x86-64-v3-poky-linux/curl/libcurl: PKGSIZE changed from 679952 to 684048 (+1%)
packages/x86-64-v3-poky-linux/curl/libcurl: PV changed from "8.15.0" to "8.16.0"
packages/x86-64-v3-poky-linux/curl/libcurl: PKGV changed from 8.15.0 [default] to 8.16.0 [default]

--===============4851177713393414911==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/curl/curl-doc: FILELIST: added "/usr/share/man/man3/CURLMINFO_XFERS_DONE.3 /usr/share/man/man3/CURLMINFO_XFERS_CURRENT.3 /usr/share/man/man3/curl_multi_get_offt.3 /usr/share/man/man3/CURLMOPT_NETWORK_CHANGED.3 /usr/share/man/man3/curl_ws_start_frame.3 /usr/share/man/man3/CURLMINFO_XFERS_ADDED.3 /usr/share/man/man3/CURLMINFO_XFERS_RUNNING.3 /usr/share/man/man3/CURLMINFO_XFERS_PENDING.3"
packages/x86-64-v3-poky-linux/curl/curl-ptest: FILELIST: added "/usr/lib/curl/ptest/tests/data/test795 /usr/lib/curl/ptest/tests/data/test794 /usr/lib/curl/ptest/tests/data/test797 /usr/lib/curl/ptest/tests/data/test3033 /usr/lib/curl/ptest/tests/data/test3034 /usr/lib/curl/ptest/tests/data/test796 /usr/lib/curl/ptest/tests/data/test2307 /usr/lib/curl/ptest/tests/data/test760 /usr/lib/curl/ptest/tests/data/test761 /usr/lib/curl/ptest/tests/data/test762 /usr/lib/curl/ptest/tests/data/test763 /usr/lib/curl/ptest/tests/data/test1981 /usr/lib/curl/ptest/tests/data/test1548 /usr/lib/curl/ptest/tests/data/test1549 /usr/lib/curl/ptest/tests/data/test2104 /usr/lib/curl/ptest/tests/data/test3215 /usr/lib/curl/ptest/tests/data/test759 /usr/lib/curl/ptest/tests/data/test758 /usr/lib/curl/ptest/tests/data/test755 /usr/lib/curl/ptest/tests/data/test757 /usr/lib/curl/ptest/tests/data/test756"
packages/x86-64-v3-poky-linux/curl/curl-ptest: RDEPENDS: added "libssl (['>= 3.5.2']) libcrypto (['>= 3.5.2'])"

--===============4851177713393414911==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-curl-upgrade-8.15.0-8.16.0.patch"

RnJvbSAyYWEyNzkzNThmNGE0Y2VkZTM1MjViZWZkNTc3Mjg3MmQ4Njk0ZGQzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgU2VwIDIwMjUgMTE6Mzg6NDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
dXJsOiB1cGdyYWRlIDguMTUuMCAtPiA4LjE2LjAKCi0tLQogbWV0YS9yZWNpcGVzLXN1cHBvcnQv
Y3VybC9jdXJsL25vLXRlc3QtdGltZW91dC5wYXRjaCAgICAgICAgfCA2ICsrKy0tLQogLi4uL3Jl
Y2lwZXMtc3VwcG9ydC9jdXJsL3tjdXJsXzguMTUuMC5iYiA9PiBjdXJsXzguMTYuMC5iYn0gfCAy
ICstCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9jdXJsL3tjdXJsXzguMTUuMC5iYiA9PiBjdXJsXzgu
MTYuMC5iYn0gKDk4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9jdXJsL2N1
cmwvbm8tdGVzdC10aW1lb3V0LnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvY3VybC9jdXJs
L25vLXRlc3QtdGltZW91dC5wYXRjaAppbmRleCA1YjkwMWE2ZmU5Li5lZmU1ZGY4YTA1IDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9jdXJsL2N1cmwvbm8tdGVzdC10aW1lb3V0LnBh
dGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2N1cmwvY3VybC9uby10ZXN0LXRpbWVvdXQu
cGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDQyY2RkYjUyZTgyMWNmYzJmMDlmMTk3NDc0Mjcx
NGU1ZjJmMTg1NmUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDQwOGExODVmYWRiNGYx
MmZiYzQ5NTBlNjNhOWM3ZDQwMGVhNDcxMTAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9t
OiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4KIERhdGU6IEZyaSwgMTUgTWFyIDIw
MjQgMTQ6Mzc6MzcgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gU2V0IHRoZSBtYXgtdGltZSB0aW1l
b3V0IHRvIDYwMCBzbyB0aGUgdGltZW91dCBpcyAxMCBtaW51dGVzCkBAIC0xMSwxMCArMTEsMTAg
QEAgU2lnbmVkLW9mZi1ieTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGFybS5jb20+CiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQg
YS90ZXN0cy9zZXJ2ZXJzLnBtIGIvdGVzdHMvc2VydmVycy5wbQotaW5kZXggZDQ0NzJkNS4uOTk5
OTkzOCAxMDA2NDQKK2luZGV4IGU2MjUwNTguLjQxNjU1ZDYgMTAwNjQ0CiAtLS0gYS90ZXN0cy9z
ZXJ2ZXJzLnBtCiArKysgYi90ZXN0cy9zZXJ2ZXJzLnBtCi1AQCAtMTI0LDcgKzEyNCw3IEBAIG15
ICRzc2hkdmVyc3RyOyAgIyBmb3Igc29ja3Mgc2VydmVyLCBzc2ggZGFlbW9uIHZlcnNpb24gc3Ry
aW5nCitAQCAtMTI1LDcgKzEyNSw3IEBAIG15ICRzc2hkdmVyc3RyOyAgIyBmb3Igc29ja3Mgc2Vy
dmVyLCBzc2ggZGFlbW9uIHZlcnNpb24gc3RyaW5nCiAgbXkgJHNzaGRlcnJvcjsgICAjIGZvciBz
b2NrcyBzZXJ2ZXIsIHNzaCBkYWVtb24gdmVyc2lvbiBlcnJvcgogIG15ICVkb2VzbnRydW47ICAg
ICMgc2VydmVycyB0aGF0IGRvbid0IHdvcmssIGlkZW50aWZpZWQgYnkgcGlkZmlsZQogIG15ICVQ
T1JUID0gKG5vbGlzdGVuID0+IDQ3KTsgIyBwb3J0IHdlIHVzZSBmb3IgYSBsb2NhbCBub24tbGlz
dGVuaW5nIHNlcnZpY2UKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2N1cmwvY3Vy
bF84LjE1LjAuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9jdXJsL2N1cmxfOC4xNi4wLmJiCnNp
bWlsYXJpdHkgaW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2N1cmwv
Y3VybF84LjE1LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2N1cmwvY3VybF84
LjE2LjAuYmIKaW5kZXggODA5YWFjOGJlYy4uYzIyNjY3MDM1NyAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvY3VybC9jdXJsXzguMTUuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC9jdXJsL2N1cmxfOC4xNi4wLmJiCkBAIC0yMCw3ICsyMCw3IEBAIFNSQ19VUkk6YXBwZW5k
OmNsYXNzLW5hdGl2ZXNkayA9ICIgXAogICAgICAgICAgICBmaWxlOi8vZW52aXJvbm1lbnQuZC1j
dXJsLnNoIFwKICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjZjZDBhOGE1YjEyNmRkZmRhNjFj
OTRkYzJjM2ZjNTM0ODFiYTdhMzU0NjFjZjdjNWFiNjZhYTlkNjc3NWI2MDkiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiNDBjOGNkZGJjYjZjYzYyNTFjMDNkZWE0MjNhNDcyYTZjZWE0MDM3YmU2NTRi
YTVjZjVkZWM2ZWIyZDIyZmYxZCIKIAogIyBDdXJsIGhhcyB1c2VkIG1hbnkgbmFtZXMgb3ZlciB0
aGUgeWVhcnMuLi4KIENWRV9QUk9EVUNUID0gImhheHg6Y3VybCBoYXh4OmxpYmN1cmwgY3VybDpj
dXJsIGN1cmw6bGliY3VybCBsaWJjdXJsOmxpYmN1cmwgZGFuaWVsX3N0ZW5iZXJnOmN1cmwiCi0t
IAoyLjQ3LjEKCg==

--===============4851177713393414911==--

