Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCDC1EEEC35
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 19:00:02 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.29666.1694804393320073538
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 11:59:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Etjx9+gR;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=H7j5ax0L;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018a9a36c658-852e200b-ed7b-4539-afe2-22e853287c7e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1694804395;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=32EGmsJxWxkN4rM3Iuc7m5b/EWv4R+DVDnt6NsZZU6w=;
	b=Etjx9+gRtt99JJWEhHDHamWtVdUhWzUGCwlhI8QlcaVjOf2dmq4ssjwni6gKy2G1
	MeTEktfopmzUd2ehvh0dXs0qDAgdtHE2+hfwypRlVu0A79KKpvdSzhqmyTfeg5a15LU
	rsHfHsvw0gOHkO4UjYHW+D9qq9/M7v4i3pCEGLQU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1694804395;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=32EGmsJxWxkN4rM3Iuc7m5b/EWv4R+DVDnt6NsZZU6w=;
	b=H7j5ax0LA9Gyzf7fadGZ4v4n7at6xnQ/9TupQcqosuZGpW1/MHGATS4cwCwe/CXq
	mw10jECxaB1VZXzOuTzm94eFl4c0Pld7h/sl0Fc9rb4A+YlmdepxMlC8sgJckvn8+mh
	TzJDFOh7QPFXfnV2njFt2lopvUH3ZPlQNICFt5P4=
Content-Type: multipart/mixed; boundary="===============2272796562390975066=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] boost: upgrading to 1.83.0 SUCCEEDED
Message-ID: <0101018a9a36c658-852e200b-ed7b-4539-afe2-22e853287c7e-000000@us-west-2.amazonses.com>
Date: Fri, 15 Sep 2023 18:59:55 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 19:00:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187761

--===============2272796562390975066==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *boost* to *1.83.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-boost-upgrade-1.82.0-1.83.0.patch
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
From ce0e31c14be548e3dde752d4ba015fe2aeaa10d9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Sep 2023 18:08:21 +0000
Subject: [PATCH] boost: upgrade 1.82.0 -> 1.83.0

---
 .../boost/{boost-1.82.0.inc => boost-1.83.0.inc}                | 2 +-
 meta/recipes-support/boost/{boost_1.82.0.bb => boost_1.83.0.bb} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/boost/{boost-1.82.0.inc => boost-1.83.0.inc} (90%)
 rename meta/recipes-support/boost/{boost_1.82.0.bb => boost_1.83.0.bb} (100%)

diff --git a/meta/recipes-support/boost/boost-1.82.0.inc b/meta/recipes-support/boost/boost-1.83.0.inc
similarity index 90%
rename from meta/recipes-support/boost/boost-1.82.0.inc
rename to meta/recipes-support/boost/boost-1.83.0.inc
index 39d3c9ce5d..da275f18c1 100644
--- a/meta/recipes-support/boost/boost-1.82.0.inc
+++ b/meta/recipes-support/boost/boost-1.83.0.inc
@@ -12,7 +12,7 @@ BOOST_MAJ = "${@"_".join(d.getVar("PV").split(".")[0:2])}"
 BOOST_P = "boost_${BOOST_VER}"
 
 SRC_URI = "https://boostorg.jfrog.io/artifactory/main/release/${PV}/source/${BOOST_P}.tar.bz2"
-SRC_URI[sha256sum] = "a6e1ab9b0860e6a2881dd7b21fe9f737a095e5f33a3a874afc6a345228597ee6"
+SRC_URI[sha256sum] = "6478edfe2f3305127cffe8caf73ea0176c53769f4bf1585be237eb30798c3b8e"
 
 UPSTREAM_CHECK_URI = "http://www.boost.org/users/download/"
 UPSTREAM_CHECK_REGEX = "release/(?P<pver>.*)/source/"
diff --git a/meta/recipes-support/boost/boost_1.82.0.bb b/meta/recipes-support/boost/boost_1.83.0.bb
similarity index 100%
rename from meta/recipes-support/boost/boost_1.82.0.bb
rename to meta/recipes-support/boost/boost_1.83.0.bb
-- 
2.39.2


--===============2272796562390975066==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-boost-upgrade-1.82.0-1.83.0.patch"

RnJvbSBjZTBlMzFjMTRiZTU0OGUzZGRlNzUyZDRiYTAxNWZlMmFlYWExMGQ5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgU2VwIDIwMjMgMTg6MDg6MjEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
b29zdDogdXBncmFkZSAxLjgyLjAgLT4gMS44My4wCgotLS0KIC4uLi9ib29zdC97Ym9vc3QtMS44
Mi4wLmluYyA9PiBib29zdC0xLjgzLjAuaW5jfSAgICAgICAgICAgICAgICB8IDIgKy0KIG1ldGEv
cmVjaXBlcy1zdXBwb3J0L2Jvb3N0L3tib29zdF8xLjgyLjAuYmIgPT4gYm9vc3RfMS44My4wLmJi
fSB8IDAKIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9ib29zdC97Ym9vc3QtMS44Mi4wLmluYyA9PiBib29z
dC0xLjgzLjAuaW5jfSAoOTAlKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2Jvb3N0L3ti
b29zdF8xLjgyLjAuYmIgPT4gYm9vc3RfMS44My4wLmJifSAoMTAwJSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC9ib29zdC9ib29zdC0xLjgyLjAuaW5jIGIvbWV0YS9yZWNpcGVz
LXN1cHBvcnQvYm9vc3QvYm9vc3QtMS44My4wLmluYwpzaW1pbGFyaXR5IGluZGV4IDkwJQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9ib29zdC9ib29zdC0xLjgyLjAuaW5jCnJlbmFt
ZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9ib29zdC9ib29zdC0xLjgzLjAuaW5jCmluZGV4IDM5
ZDNjOWNlNWQuLmRhMjc1ZjE4YzEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2Jv
b3N0L2Jvb3N0LTEuODIuMC5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYm9vc3QvYm9v
c3QtMS44My4wLmluYwpAQCAtMTIsNyArMTIsNyBAQCBCT09TVF9NQUogPSAiJHtAIl8iLmpvaW4o
ZC5nZXRWYXIoIlBWIikuc3BsaXQoIi4iKVswOjJdKX0iCiBCT09TVF9QID0gImJvb3N0XyR7Qk9P
U1RfVkVSfSIKIAogU1JDX1VSSSA9ICJodHRwczovL2Jvb3N0b3JnLmpmcm9nLmlvL2FydGlmYWN0
b3J5L21haW4vcmVsZWFzZS8ke1BWfS9zb3VyY2UvJHtCT09TVF9QfS50YXIuYnoyIgotU1JDX1VS
SVtzaGEyNTZzdW1dID0gImE2ZTFhYjliMDg2MGU2YTI4ODFkZDdiMjFmZTlmNzM3YTA5NWU1ZjMz
YTNhODc0YWZjNmEzNDUyMjg1OTdlZTYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNjQ3OGVkZmUy
ZjMzMDUxMjdjZmZlOGNhZjczZWEwMTc2YzUzNzY5ZjRiZjE1ODViZTIzN2ViMzA3OThjM2I4ZSIK
IAogVVBTVFJFQU1fQ0hFQ0tfVVJJID0gImh0dHA6Ly93d3cuYm9vc3Qub3JnL3VzZXJzL2Rvd25s
b2FkLyIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gInJlbGVhc2UvKD9QPHB2ZXI+LiopL3NvdXJj
ZS8iCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ib29zdC9ib29zdF8xLjgyLjAu
YmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ib29zdC9ib29zdF8xLjgzLjAuYmIKc2ltaWxhcml0
eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2Jvb3N0L2Jvb3N0
XzEuODIuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvYm9vc3QvYm9vc3RfMS44
My4wLmJiCi0tIAoyLjM5LjIKCg==

--===============2272796562390975066==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/boost/boost-atomic: PV changed from "1.82.0" to "1.83.0"
packages/core2-32-poky-linux/boost/boost-atomic: PKGV changed from 1.82.0 [default] to 1.83.0 [default]
packages/core2-32-poky-linux/boost/boost-atomic: PKG changed from libboost-atomic1.82.0 to libboost-atomic1.83.0
packages/core2-32-poky-linux/boost/boost-atomic: FILELIST: removed "/usr/lib/libboost_atomic.so.1.82.0", added "/usr/lib/libboost_atomic.so.1.83.0"
packages/core2-32-poky-linux/boost/boost-chrono: PV changed from "1.82.0" to "1.83.0"
packages/core2-32-poky-linux/boost/boost-chrono: PKGV changed from 1.82.0 [default] to 1.83.0 [default]
packages/core2-32-poky-linux/boost/boost-chrono: PKG changed from libboost-chrono1.82.0 to libboost-chrono1.83.0
packages/core2-32-poky-linux/boost/boost-chrono: FILELIST: removed "/usr/lib/libboost_chrono.so.1.82.0", added "/usr/lib/libboost_chrono.so.1.83.0"
packages/core2-32-poky-linux/boost/boost-container: PV changed from "1.82.0" to "1.83.0"
packages/core2-32-poky-linux/boost/boost-container: PKGV changed from 1.82.0 [default] to 1.83.0 [default]
packages/core2-32-poky-linux/boost/boost-container: PKG changed from libboost-container1.82.0 to libboost-container1.83.0
packages/core2-32-poky-linux/boost/boost-container: FILELIST: removed "/usr/lib/libboost_container.so.1.82.0", added "/usr/lib/libboost_container.so.1.83.0"
packages/core2-32-poky-linux/boost/boost-context: PV changed from "1.82.0" to "1.83.0"
packages/core2-32-poky-linux/boost/boost-context: PKGV changed from 1.82.0 [default] to 1.83.0 [default]
packages/core2-32-poky-linux/boost/boost-context: PKG changed from libboost-context1.82.0 to libboost-context1.83.0
packages/core2-32-poky-linux/boost/boost-context: FILELIST: removed "/usr/lib/libboost_context.so.1.82.0", added "/usr/lib/libboost_context.so.1.83.0"
packages/core2-32-poky-linux/boost/boost-contract: PV changed from "1.82.0" to "1.83.0"
packages/core2-32-poky-linux/boost/boost-contract: PKGV changed from 1.82.0 [default] to 1.83.0 [default]
packages/core2-32-poky-linux/boost/boost-contract: PKG changed from libboost-contract1.82.0 to libboost-contract1.83.0
packages/core2-32-poky-linux/boost/boost-contract: FILELIST: removed "/usr/lib/libboost_contract.so.1.82.0", added "/usr/lib/libboost_contract.so.1.83.0"
packages/core2-32-poky-linux/boost/boost-coroutine: PV changed from "1.82.0" to "1.83.0"
packages/core2-32-poky-linux/boost/boost-coroutine: PKGV changed from 1.82.0 [default] to 1.83.0 [default]
packages/core2-32-poky-linux/boost/boost-coroutine: PKG changed from libboost-coroutine1.82.0 to libboost-coroutine1.83.0
packages/core2-32-poky-linux/boost/boost-coroutine: FILELIST: removed "/usr/lib/libboost_coroutine.so.1.82.0", added "/usr/lib/libboost_coroutine.so.1.83.0"
packages/core2-32-poky-linux/boost/boost-date-time: PV changed from "1.82.0" to "1.83.0"
packages/core2-32-poky-linux/boost/boost-date-time: PKGV changed from 1.82.0 [default] to 1.83.0 [default]
packages/core2-32-poky-linux/boost/boost-date-time: PKG changed from libboost-date-time1.82.0 to libboost-date-time1.83.0
packages/core2-32-poky-linux/boost/boost-date-time: FILELIST: removed "/usr/lib/libboost_date_time.so.1.82.0", added "/usr/lib/libboost_date_time.so.1.83.0"
packages/core2-32-poky-linux/boost/boost-dbg: PV changed from "1.82.0" to "1.83.0"
packages/core2-32-poky-linux/boost/boost-dbg: RRECOMMENDS: removed "boost-chrono-dbg"
packages/core2-32-poky-linux/boost/boost-dbg: PKGV changed from 1.82.0 [default] to 1.83.0 [default]
packages/core2-32-poky-linux/boost/boost-dbg: PKGSIZE changed from 136387364 to 141839920 (+4%)
packages/core2-32-poky-linux/boost/boost-dbg: FILELIST: removed "/usr/lib/.debug/libboost_math_tr1l.so.1.82.0 /usr/lib/.debug/libboost_python311.so.1.82.0 /usr/lib/.debug/libboost_math_tr1f.so.1.82.0 /usr/lib/.debug/libboost_container.so.1.82.0 /usr/lib/.debug/libboost_chrono.so.1.82.0 /usr/lib/.debug/libboost_atomic.so.1.82.0 /usr/lib/.debug/libboost_locale.so.1.82.0 /usr/lib/.debug/libboost_random.so.1.82.0 /usr/lib/.debug/libboost_system.so.1.82.0 /usr/lib/.debug/libboost_contract.so.1.82.0 /usr/lib/.debug/libboost_thread.so.1.82.0 /usr/lib/.debug/libboost_program_options.so.1.82.0 /usr/lib/.debug/libboost_math_c99.so.1.82.0 /usr/lib/.debug/libboost_serialization.so.1.82.0 /usr/lib/.debug/libboost_log.so.1.82.0 /usr/lib/.debug/libboost_url.so.1.82.0 /usr/lib/.debug/libboost_math_c99f.so.1.82.0 /usr/lib/.debug/libboost_math_c99l.so.1.82.0 /usr/lib/.debug/libboost_filesystem.so.1.82.0 /usr/lib/.debug/libboost_unit_test_framework.so.1.82.0 /usr/lib/.debug/libboost_coroutine.so.1.82.0
  /usr/lib/.debug/libboost_fiber.so.1.82.0 /usr/lib/.debug/libboost_graph.so.1.82.0 /usr/lib/.debug/libboost_regex.so.1.82.0 /usr/lib/.debug/libboost_timer.so.1.82.0 /usr/lib/.debug/libboost_math_tr1.so.1.82.0 /usr/lib/.debug/libboost_wserialization.so.1.82.0 /usr/lib/.debug/libboost_prg_exec_monitor.so.1.82.0 /usr/lib/.debug/libboost_context.so.1.82.0 /usr/lib/.debug/libboost_date_time.so.1.82.0 /usr/lib/.debug/libboost_iostreams.so.1.82.0 /usr/lib/.debug/libboost_wave.so.1.82.0 /usr/lib/.debug/libboost_log_setup.so.1.82.0 /usr/lib/.debug/libboost_type_erasure.so.1.82.0 /usr/lib/.debug/libboost_json.so.1.82.0", added "/usr/lib/.debug/libboost_math_tr1.so.1.83.0 /usr/lib/.debug/libboost_json.so.1.83.0 /usr/lib/.debug/libboost_math_tr1l.so.1.83.0 /usr/lib/.debug/libboost_python311.so.1.83.0 /usr/lib/.debug/libboost_math_tr1f.so.1.83.0 /usr/lib/.debug/libboost_wave.so.1.83.0 /usr/lib/.debug/libboost_container.so.1.83.0 /usr/lib/.debug/libboost_math_c99f.so.1.83.0 /usr/lib/.debug/libboo
 st_math_c99l.so.1.83.0 /usr/lib/.debug/libboost_chrono.so.1.83.0 /usr/lib/.debug/libboost_atomic.so.1.83.0 /usr/lib/.debug/libboost_locale.so.1.83.0 /usr/lib/.debug/libboost_random.so.1.83.0 /usr/lib/.debug/libboost_system.so.1.83.0 /usr/lib/.debug/libboost_thread.so.1.83.0 /usr/lib/.debug/libboost_unit_test_framework.so.1.83.0 /usr/lib/.debug/libboost_program_options.so.1.83.0 /usr/lib/.debug/libboost_contract.so.1.83.0 /usr/lib/.debug/libboost_serialization.so.1.83.0 /usr/lib/.debug/libboost_math_c99.so.1.83.0 /usr/lib/.debug/libboost_log.so.1.83.0 /usr/lib/.debug/libboost_url.so.1.83.0 /usr/lib/.debug/libboost_fiber.so.1.83.0 /usr/lib/.debug/libboost_graph.so.1.83.0 /usr/lib/.debug/libboost_regex.so.1.83.0 /usr/lib/.debug/libboost_timer.so.1.83.0 /usr/lib/.debug/libboost_coroutine.so.1.83.0 /usr/lib/.debug/libboost_filesystem.so.1.83.0 /usr/lib/.debug/libboost_wserialization.so.1.83.0 /usr/lib/.debug/libboost_prg_exec_monitor.so.1.83.0 /usr/lib/.debug/libboost_iostreams.so.1.83.0
  /usr/lib/.debug/libboost_context.so.1.83.0 /usr/lib/.debug/libboost_date_time.so.1.83.0 /usr/lib/.debug/libboost_type_erasure.so.1.83.0 /usr/lib/.debug/libboost_log_setup.so.1.83.0"
packages/core2-32-poky-linux/boost/boost-dev: PV changed from "1.82.0" to "1.83.0"
packages/core2-32-poky-linux/boost/boost-dev: PKGV changed from 1.82.0 [default] to 1.83.0 [default]
packages/core2-32-poky-linux/boost/boost-dev: PKGSIZE changed from 149589034 to 149940921 (+0%)
packages/core2-32-poky-linux/boost/boost-dev: FILELIST: directory renamed /usr/lib/cmake/boost_headers-1.82.0 -> /usr/lib/cmake/boost_headers-1.83.0, directory renamed /usr/lib/cmake/boost_math_c99f-1.82.0 -> /usr/lib/cmake/boost_math_c99f-1.83.0, directory renamed /usr/lib/cmake/boost_math_c99l-1.82.0 -> /usr/lib/cmake/boost_math_c99l-1.83.0, directory renamed /usr/lib/cmake/boost_math_tr1f-1.82.0 -> /usr/lib/cmake/boost_math_tr1f-1.83.0, directory renamed /usr/lib/cmake/boost_math_tr1l-1.82.0 -> /usr/lib/cmake/boost_math_tr1l-1.83.0, directory renamed /usr/lib/cmake/boost_graph-1.82.0 -> /usr/lib/cmake/boost_graph-1.83.0, directory renamed /usr/lib/cmake/boost_locale-1.82.0 -> /usr/lib/cmake/boost_locale-1.83.0, directory renamed /usr/lib/cmake/boost_unit_test_framework-1.82.0 -> /usr/lib/cmake/boost_unit_test_framework-1.83.0, directory renamed /usr/lib/cmake/boost_log-1.82.0 -> /usr/lib/cmake/boost_log-1.83.0, directory renamed /usr/lib/cmake/boost_prg_exec_monitor-1.82.0 -> /usr
 /lib/cmake/boost_prg_exec_monitor-1.83.0, directory renamed /usr/lib/cmake/boost_url-1.82.0 -> /usr/lib/cmake/boost_url-1.83.0, directory renamed /usr/lib/cmake/boost_coroutine-1.82.0 -> /usr/lib/cmake/boost_coroutine-1.83.0, directory renamed /usr/lib/cmake/boost_system-1.82.0 -> /usr/lib/cmake/boost_system-1.83.0, directory renamed /usr/lib/cmake/boost_exception-1.82.0 -> /usr/lib/cmake/boost_exception-1.83.0, directory renamed /usr/lib/cmake/boost_date_time-1.82.0 -> /usr/lib/cmake/boost_date_time-1.83.0, directory renamed /usr/lib/cmake/boost_contract-1.82.0 -> /usr/lib/cmake/boost_contract-1.83.0, directory renamed /usr/lib/cmake/boost_type_erasure-1.82.0 -> /usr/lib/cmake/boost_type_erasure-1.83.0, directory renamed /usr/lib/cmake/boost_context-1.82.0 -> /usr/lib/cmake/boost_context-1.83.0, directory renamed /usr/lib/cmake/boost_json-1.82.0 -> /usr/lib/cmake/boost_json-1.83.0, directory renamed /usr/lib/cmake/boost_program_options-1.82.0 -> /usr/lib/cmake/boost_program_options
 -1.83.0, directory renamed /usr/lib/cmake/boost_test_exec_monitor-1.82.0 -> /usr/lib/cmake/boost_test_exec_monitor-1.83.0, directory renamed /usr/lib/cmake/boost_wserialization-1.82.0 -> /usr/lib/cmake/boost_wserialization-1.83.0, directory renamed /usr/lib/cmake/Boost-1.82.0 -> /usr/lib/cmake/Boost-1.83.0, directory renamed /usr/lib/cmake/boost_iostreams-1.82.0 -> /usr/lib/cmake/boost_iostreams-1.83.0, directory renamed /usr/lib/cmake/boost_container-1.82.0 -> /usr/lib/cmake/boost_container-1.83.0, directory renamed /usr/lib/cmake/boost_atomic-1.82.0 -> /usr/lib/cmake/boost_atomic-1.83.0, directory renamed /usr/lib/cmake/boost_log_setup-1.82.0 -> /usr/lib/cmake/boost_log_setup-1.83.0, directory renamed /usr/lib/cmake/boost_serialization-1.82.0 -> /usr/lib/cmake/boost_serialization-1.83.0, directory renamed /usr/lib/cmake/boost_math_c99-1.82.0 -> /usr/lib/cmake/boost_math_c99-1.83.0, directory renamed /usr/lib/cmake/boost_math_tr1-1.82.0 -> /usr/lib/cmake/boost_math_tr1-1.83.0, dire
 ctory renamed /usr/lib/cmake/boost_chrono-1.82.0 -> /usr/lib/cmake/boost_chrono-1.83.0, directory renamed /usr/lib/cmake/boost_wave-1.82.0 -> /usr/lib/cmake/boost_wave-1.83.0, directory renamed /usr/lib/cmake/boost_python-1.82.0 -> /usr/lib/cmake/boost_python-1.83.0, directory renamed /usr/lib/cmake/boost_filesystem-1.82.0 -> /usr/lib/cmake/boost_filesystem-1.83.0, directory renamed /usr/lib/cmake/boost_fiber-1.82.0 -> /usr/lib/cmake/boost_fiber-1.83.0, directory renamed /usr/lib/cmake/boost_timer-1.82.0 -> /usr/lib/cmake/boost_timer-1.83.0, directory renamed /usr/lib/cmake/boost_regex-1.82.0 -> /usr/lib/cmake/boost_regex-1.83.0, directory renamed /usr/lib/cmake/boost_random-1.82.0 -> /usr/lib/cmake/boost_random-1.83.0, directory renamed /usr/lib/cmake/boost_thread-1.82.0 -> /usr/lib/cmake/boost_thread-1.83.0, removed "/usr/include/boost/mysql/detail/protocol/null_bitmap_traits.hpp /usr/include/boost/mysql/detail/network_algorithms/close_connection.hpp /usr/include/boost/url/rfc/det
 ail/impl/scheme_rule.ipp /usr/include/boost/url/grammar/detail/impl/recycled.ipp /usr/include/boost/url/impl/url_view.ipp /usr/include/boost/mysql/detail/protocol/impl/prepared_statement_messages.hpp /usr/include/boost/url/detail/impl/format_args.ipp /usr/include/boost/mysql/detail/network_algorithms/impl/connect.hpp /usr/include/boost/mysql/detail/network_algorithms/read_some_rows.hpp /usr/include/boost/mysql/detail/protocol/protocol_types.hpp /usr/include/boost/smart_ptr/detail/sp_win32_sleep.hpp /usr/include/boost/mysql/detail/auth/caching_sha2_password.hpp /usr/include/boost/url/impl/static_url.ipp /usr/include/boost/mysql/detail/channel/impl/message_reader.hpp /usr/include/boost/mysql/detail/channel/impl/disableable_ssl_stream.hpp /usr/include/boost/mysql/detail/protocol/deserialize_text_field.hpp /usr/include/boost/mysql/detail/auth/impl/mysql_native_password.ipp /usr/include/boost/mysql/detail/channel/read_buffer.hpp /usr/include/boost/mysql/detail/protocol/serialization_cont
 ext.hpp /usr/include/boost/unordered/detail/foa.hpp /usr/include/boost/mysql/detail/protocol/impl/deserialize_row.ipp /usr/include/boost/mysql/detail/protocol/prepared_statement_messages.hpp /usr/include/boost/url/detail/impl/params_iter_impl.ipp /usr/include/boost/url/impl/decode_view.ipp /usr/include/boost/mysql/detail/network_algorithms/execute_statement.hpp /usr/include/boost/url/rfc/detail/impl/hier_part_rule.ipp /usr/include/boost/mysql/detail/protocol/process_error_packet.hpp /usr/include/boost/url/rfc/impl/relative_ref_rule.ipp /usr/include/boost/url/impl/params_encoded_base.ipp /usr/include/boost/url/impl/params_encoded_view.ipp /usr/include/boost/mysql/detail/auxiliar/impl/row_base.ipp /usr/include/boost/url/impl/segments_view.ipp /usr/include/boost/mysql/detail/protocol/impl/process_error_packet.ipp /usr/include/boost/mysql/detail/network_algorithms/connect.hpp /usr/include/boost/mysql/detail/auxiliar/rebind_executor.hpp /usr/include/boost/mysql/detail/protocol/capabiliti
 es.hpp /usr/include/boost/mysql/detail/network_algorithms/impl/execute_statement.hpp /usr/include/boost/mysql/detail/network_algorithms/close_statement.hpp /usr/include/boost/mysql/detail/auxiliar/datetime.hpp /usr/include/boost/url/impl/parse_path.ipp /usr/include/boost/mysql/detail/auxiliar/row_base.hpp /usr/include/boost/outcome/experimental/status-code/status-code/status_code_ptr.hpp /usr/include/boost/mysql/detail/channel/message_parser.hpp /usr/include/boost/mysql/detail/auxiliar/stringize.hpp /usr/include/boost/url/rfc/detail/impl/userinfo_rule.ipp /usr/include/boost/mysql/impl/date.hpp /usr/include/boost/mysql/detail/protocol/impl/common_messages.ipp /usr/include/boost/mysql/detail/auxiliar/field_impl.hpp /usr/include/boost/mysql/detail/auxiliar/field_type_traits.hpp /usr/include/boost/mysql/detail/network_algorithms/impl/read_some_rows.hpp /usr/include/boost/mysql/detail/protocol/handshake_messages.hpp /usr/include/boost/url/impl/segments_encoded_view.ipp /usr/include/boost
 /mysql/impl/error_categories.hpp /usr/include/boost/url/detail/impl/normalize.ipp /usr/include/boost/mysql/detail/network_algorithms/impl/read_all_rows.hpp /usr/include/boost/mysql/detail/network_algorithms/impl/handshake.hpp /usr/include/boost/url/impl/params_encoded_ref.ipp /usr/include/boost/url/impl/pct_string_view.ipp /usr/include/boost/url/rfc/impl/query_rule.ipp /usr/include/boost/mysql/detail/protocol/common_messages.hpp /usr/include/boost/mysql/detail/auxiliar/make_string_view.hpp /usr/include/boost/url/detail/impl/except.ipp /usr/include/boost/url/impl/parse_query.ipp /usr/include/boost/mysql/detail/network_algorithms/impl/ping.hpp /usr/include/boost/url/grammar/impl/literal_rule.ipp /usr/include/boost/mysql/detail/network_algorithms/impl/prepare_statement.hpp /usr/include/boost/mysql/detail/auxiliar/error_helpers.hpp /usr/include/boost/url/detail/impl/pattern.ipp /usr/include/boost/mysql/impl/execution_state.hpp /usr/include/boost/url/detail/impl/path.ipp /usr/include/boo
 st/mysql/detail/protocol/impl/serialization.ipp /usr/include/boost/mysql/detail/auth/auth_calculator.hpp /usr/include/boost/mysql/impl/rows_view.hpp /usr/include/boost/mysql/detail/channel/impl/message_parser.ipp /usr/include/boost/mysql/detail/network_algorithms/impl/close_statement.hpp /usr/include/boost/mysql/detail/protocol/bit_deserialization.hpp /usr/include/boost/url/rfc/detail/impl/host_rule.ipp /usr/include/boost/url/grammar/impl/ci_string.ipp /usr/include/boost/url/grammar/detail/impl/ci_string.ipp /usr/include/boost/mysql/detail/network_algorithms/quit_connection.hpp /usr/include/boost/url/grammar/impl/delim_rule.ipp /usr/include/boost/url/impl/params_ref.ipp /usr/include/boost/mysql/detail/protocol/impl/serialization.hpp /usr/include/boost/mysql/detail/channel/message_writer_processor.hpp /usr/include/boost/mysql/detail/network_algorithms/impl/query.hpp /usr/include/boost/url/detail/impl/pct_format.ipp /usr/include/boost/mysql/detail/channel/impl/message_writer.hpp /usr/
 include/boost/mysql/detail/auxiliar/valgrind.hpp /usr/include/boost/mysql/detail/auxiliar/impl/datetime.hpp /usr/include/boost/mysql/detail/network_algorithms/read_all_rows.hpp /usr/include/boost/url/impl/params_base.ipp /usr/include/boost/url/impl/params_view.ipp /usr/include/boost/url/impl/parse.ipp /usr/include/boost/mysql/detail/protocol/serialization.hpp /usr/include/boost/url/impl/segments_ref.ipp /usr/include/boost/url/impl/url_base.ipp /usr/include/boost/mysql/detail/network_algorithms/query.hpp /usr/include/boost/url/impl/ipv4_address.ipp /usr/include/boost/url/impl/ipv6_address.ipp /usr/include/boost/mysql/detail/auxiliar/server_errc_strings.hpp /usr/include/boost/mysql/impl/connection.hpp /usr/include/boost/mysql/detail/network_algorithms/impl/quit_connection.hpp /usr/include/boost/url/impl/url.ipp /usr/include/boost/url/detail/impl/replacement_field_rule.ipp /usr/include/boost/mysql/detail/auxiliar/void_t.hpp /usr/include/boost/mysql/impl/rows.hpp /usr/include/boost/mysq
 l/detail/protocol/resultset_encoding.hpp /usr/include/boost/mysql/detail/protocol/deserialize_binary_field.hpp /usr/include/boost/mysql/detail/network_algorithms/impl/start_execution_generic.hpp /usr/include/boost/mysql/detail/channel/message_writer.hpp /usr/include/boost/url/detail/impl/decode.ipp /usr/include/boost/mysql/detail/auxiliar/bytestring.hpp /usr/include/boost/mysql/detail/protocol/deserialize_errc.hpp /usr/include/boost/mysql/detail/protocol/binary_serialization.hpp /usr/include/boost/mysql/detail/protocol/deserialization_context.hpp /usr/include/boost/mysql/detail/auxiliar/access_fwd.hpp /usr/include/boost/mysql/detail/network_algorithms/prepare_statement.hpp /usr/include/boost/mysql/detail/protocol/impl/deserialize_binary_field.ipp /usr/include/boost/url/impl/segments_encoded_base.ipp /usr/include/boost/mysql/detail/channel/message_reader.hpp /usr/include/boost/mysql/detail/network_algorithms/impl/start_query.hpp /usr/include/boost/url/detail/impl/any_params_iter.ipp 
 /usr/include/boost/mysql/detail/auxiliar/static_string.hpp /usr/include/boost/url/rfc/impl/ipv6_address_rule.ipp /usr/include/boost/url/rfc/impl/ipv4_address_rule.ipp /usr/include/boost/url/detail/impl/url_impl.ipp /usr/include/boost/url/impl/error.ipp /usr/include/boost/url/rfc/impl/origin_form_rule.ipp /usr/include/boost/mysql/impl/diagnostics.hpp /usr/include/boost/url/rfc/detail/impl/h16_rule.ipp /usr/include/boost/url/impl/authority_view.ipp /usr/include/boost/mysql/detail/protocol/deserialize_row.hpp /usr/include/boost/mysql/detail/auth/impl/caching_sha2_password.ipp /usr/include/boost/mysql/detail/network_algorithms/start_statement_execution.hpp /usr/include/boost/mysql/detail/network_algorithms/handshake.hpp /usr/include/boost/mysql/detail/channel/disableable_ssl_stream.hpp /usr/include/boost/mysql/detail/auth/impl/auth_calculator.ipp /usr/include/boost/mysql/detail/auxiliar/string_view_offset.hpp /usr/include/boost/mysql/impl/datetime.hpp /usr/include/boost/mysql/impl/metad
 ata.hpp /usr/include/boost/url/grammar/impl/error.ipp /usr/include/boost/url/grammar/impl/dec_octet_rule.ipp /usr/include/boost/mysql/detail/protocol/impl/handshake_messages.ipp /usr/include/boost/url/impl/scheme.ipp /usr/include/boost/mysql/detail/protocol/constants.hpp /usr/include/boost/mysql/detail/channel/channel.hpp /usr/include/boost/mysql/impl/row_view.hpp /usr/include/boost/url/grammar/impl/string_view_base.ipp /usr/include/boost/url/impl/segments_base.ipp /usr/include/boost/mysql/detail/network_algorithms/ping.hpp /usr/include/boost/mysql/detail/auxiliar/rows_iterator.hpp /usr/include/boost/url/rfc/impl/uri_reference_rule.ipp /usr/include/boost/mysql/detail/protocol/query_messages.hpp /usr/include/boost/mysql/detail/protocol/impl/deserialize_text_field.ipp /usr/include/boost/url/impl/url_view_base.ipp /usr/include/boost/url/detail/impl/any_segments_iter.ipp /usr/include/boost/url/rfc/detail/impl/relative_part_rule.ipp /usr/include/boost/mysql/impl/results.hpp /usr/include/
 boost/mysql/detail/auth/mysql_native_password.hpp /usr/include/boost/url/impl/segments_encoded_ref.ipp /usr/include/boost/mysql/detail/network_algorithms/start_query.hpp /usr/include/boost/mysql/detail/network_algorithms/impl/start_statement_execution.hpp /usr/include/boost/url/rfc/detail/impl/port_rule.ipp /usr/include/boost/mysql/detail/network_algorithms/start_execution_generic.hpp /usr/include/boost/mysql/detail/network_algorithms/impl/close_connection.hpp /usr/include/boost/mysql/impl/field.hpp /usr/include/boost/url/rfc/impl/authority_rule.ipp /usr/include/boost/url/detail/impl/segments_iter_impl.ipp /usr/include/boost/url/rfc/impl/absolute_uri_rule.ipp /usr/lib/cmake/BoostDetectToolset-1.82.0.cmake /usr/include/boost/url/rfc/detail/impl/ipvfuture_rule.ipp /usr/include/boost/url/rfc/impl/uri_rule.ipp /usr/include/boost/mysql/detail/channel/impl/read_buffer.ipp /usr/include/boost/url/rfc/detail/impl/ip_literal_rule.ipp /usr/include/boost/mysql/detail/protocol/impl/binary_serial
 ization.ipp /usr/include/boost/mysql/detail/protocol/db_flavor.hpp", added "/usr/include/boost/mysql/detail/resultset_encoding.hpp /usr/include/boost/atomic/detail/type_traits/remove_cv.hpp /usr/include/boost/mysql/impl/internal/network_algorithms/handshake.hpp /usr/include/boost/mysql/impl/internal/make_string_view.hpp /usr/include/boost/mp11/detail/mp_list_v.hpp /usr/include/boost/mysql/impl/static_results_impl.ipp /usr/include/boost/unordered/detail/foa/rw_spinlock.hpp /usr/include/boost/unordered/detail/foa/core.hpp /usr/include/boost/outcome/experimental/status-code/status-code/nested_status_code.hpp /usr/include/boost/mysql/impl/internal/channel/message_writer.hpp /usr/include/boost/iterator/is_iterator.hpp /usr/include/boost/mysql/detail/rebind_executor.hpp /usr/include/boost/mysql/impl/internal/channel/read_buffer.hpp /usr/include/boost/mysql/impl/internal/protocol/deserialize_binary_field.ipp /usr/include/boost/mysql/impl/internal/protocol/deserialize_binary_field.hpp /usr/
 include/boost/mysql/detail/row_impl.hpp /usr/include/boost/mysql/detail/execution_processor/execution_processor.hpp /usr/include/boost/mysql/detail/flags.hpp /usr/include/boost/mysql/impl/internal/protocol/basic_types.hpp /usr/include/boost/mysql/detail/typing/meta_check_context.hpp /usr/include/boost/json/detail/charconv/detail/emulated128.hpp /usr/include/boost/json/detail/charconv/detail/from_chars_result.hpp /usr/include/boost/mysql/impl/results_impl.ipp /usr/include/boost/mysql/impl/meta_check_context.ipp /usr/include/boost/mysql/impl/internal/channel/message_reader.hpp /usr/include/boost/mysql/impl/internal/auth/auth.ipp /usr/include/boost/mysql/impl/date.ipp /usr/include/boost/mysql/impl/internal/protocol/null_bitmap_traits.hpp /usr/include/boost/unordered/detail/foa/tuple_rotate_right.hpp /usr/include/boost/mysql/impl/internal/channel/valgrind.hpp /usr/include/boost/mysql/impl/internal/channel/message_parser.hpp /usr/include/boost/mysql/impl/internal/channel/message_parser.i
 pp /usr/include/boost/json/detail/charconv/detail/fast_float/float_common.hpp /usr/include/boost/core/detail/sp_thread_sleep.hpp /usr/include/boost/url/rfc/detail/ipv6_addrz_rule.hpp /usr/include/boost/core/detail/sp_thread_yield.hpp /usr/include/boost/mysql/detail/network_algorithms.hpp /usr/include/boost/mysql/detail/execution_concepts.hpp /usr/include/boost/mysql/src.hpp /usr/include/boost/json/detail/charconv/detail/significand_tables.hpp /usr/include/boost/locale/detail/encoding.hpp /usr/include/boost/mysql/detail/any_stream_impl.hpp /usr/include/boost/core/yield_primitives.hpp /usr/include/boost/mysql/impl/internal/protocol/db_flavor.hpp /usr/include/boost/mysql/detail/execution_processor/execution_state_impl.hpp /usr/include/boost/mysql/impl/internal/protocol/protocol_field_type.hpp /usr/include/boost/mysql/impl/internal/protocol/protocol_field_type.ipp /usr/include/boost/mysql/detail/coldef_view.hpp /usr/include/boost/mysql/impl/internal/protocol/protocol.hpp /usr/include/bo
 ost/json/detail/charconv/detail/config.hpp /usr/include/boost/json/detail/charconv/detail/fast_float/fast_table.hpp /usr/include/boost/mysql/detail/execution_processor/static_results_impl.hpp /usr/include/boost/mysql/impl/error_categories.ipp /usr/include/boost/json/detail/charconv/impl/from_chars.ipp /usr/include/boost/mysql/impl/execution_state_impl.ipp /usr/include/boost/mysql/detail/datetime.hpp /usr/include/boost/any/detail/placeholder.hpp /usr/include/boost/mysql/detail/results_iterator.hpp /usr/include/boost/mysql/impl/internal/network_algorithms/start_execution.hpp /usr/include/boost/json/detail/charconv/from_chars.hpp /usr/include/boost/mysql/detail/throw_on_error_loc.hpp /usr/include/boost/core/detail/sp_win32_sleep.hpp /usr/include/boost/json/detail/charconv/detail/fast_float/ascii_number.hpp /usr/include/boost/json/detail/charconv/detail/fast_float/parse_number.hpp /usr/include/boost/unordered/detail/foa/flat_map_types.hpp /usr/include/boost/unordered/detail/foa/flat_set
 _types.hpp /usr/include/boost/mysql/detail/typing/get_type_index.hpp /usr/include/boost/mysql/impl/internal/error/server_error_to_string.hpp /usr/include/boost/filesystem/cstdio.hpp /usr/include/boost/mysql/detail/execution_processor/results_impl.hpp /usr/include/boost/unordered/detail/foa/table.hpp /usr/include/boost/mysql/impl/resultset.ipp /usr/include/boost/json/detail/charconv/detail/fast_float/fast_float.hpp /usr/include/boost/mysql/impl/internal/network_algorithms/read_resultset_head.hpp /usr/include/boost/json/detail/sbo_buffer.hpp /usr/include/boost/json/detail/charconv/detail/from_chars_float_impl.hpp /usr/include/boost/json/detail/charconv/detail/integer_search_trees.hpp /usr/include/boost/mysql/impl/internal/channel/channel.hpp /usr/include/boost/mysql/detail/execution_processor/static_execution_state_impl.hpp /usr/include/boost/mysql/impl/internal/protocol/binary_serialization.ipp /usr/include/boost/mysql/impl/field_view.ipp /usr/include/boost/mysql/impl/column_type.ipp
  /usr/include/boost/json/serialize_options.hpp /usr/include/boost/json/detail/charconv/detail/fast_float/bigint.hpp /usr/include/boost/mysql/detail/string_view_offset.hpp /usr/include/boost/json/detail/charconv/detail/fast_float/decimal_to_binary.hpp /usr/include/boost/mysql/impl/internal/network_algorithms/execute.hpp /usr/include/boost/json/detail/charconv/chars_format.hpp /usr/include/boost/mysql/static_results.hpp /usr/include/boost/mysql/impl/internal/protocol/bit_deserialization.hpp /usr/include/boost/json/detail/charconv/detail/fast_float/digit_comparison.hpp /usr/include/boost/locale/detail/is_supported_char.hpp /usr/include/boost/mysql/detail/typing/pos_map.hpp /usr/include/boost/mysql/detail/typing/readable_field_traits.hpp /usr/include/boost/mysql/detail/channel_ptr.hpp /usr/include/boost/mysql/impl/internal/network_algorithms/connect.hpp /usr/include/boost/json/detail/charconv/detail/compute_float64.hpp /usr/include/boost/mysql/detail/access.hpp /usr/include/boost/mp11/d
 etail/mp_is_value_list.hpp /usr/include/boost/mysql/static_execution_state.hpp /usr/include/boost/mysql/detail/typing/row_traits.hpp /usr/include/boost/geometry/util/constexpr.hpp /usr/include/boost/mysql/detail/any_execution_request.hpp /usr/include/boost/json/detail/charconv/detail/fast_float/constexpr_feature_detect.hpp /usr/include/boost/mysql/impl/internal/protocol/capabilities.hpp /usr/include/boost/core/detail/sp_thread_pause.hpp /usr/include/boost/mysql/impl/network_algorithms.ipp /usr/include/boost/mysql/detail/rows_iterator.hpp /usr/include/boost/unordered/detail/foa/ignore_wshadow.hpp /usr/include/boost/mysql/impl/any_stream_impl.ipp /usr/include/boost/json/detail/charconv/detail/parser.hpp /usr/include/boost/mysql/resultset_view.hpp /usr/include/boost/unordered/concurrent_flat_map_fwd.hpp /usr/include/boost/mysql/impl/internal/protocol/protocol.ipp /usr/include/boost/mysql/detail/ok_view.hpp /usr/include/boost/unordered/concurrent_flat_map.hpp /usr/include/boost/unordere
 d/detail/foa/node_map_types.hpp /usr/include/boost/mysql/resultset.hpp /usr/include/boost/unordered/detail/foa/node_set_types.hpp /usr/include/boost/math/special_functions/fourier_transform_daubechies.hpp /usr/include/boost/mysql/impl/internal/network_algorithms/ping.hpp /usr/include/boost/mysql/impl/internal/protocol/deserialize_text_field.hpp /usr/include/boost/mysql/impl/internal/protocol/deserialize_text_field.ipp /usr/include/boost/mysql/impl/datetime.ipp /usr/include/boost/unordered/detail/foa/restore_wshadow.hpp /usr/include/boost/mysql/impl/static_execution_state_impl.ipp /usr/include/boost/mysql/detail/void_t.hpp /usr/include/boost/mysql/detail/any_stream.hpp /usr/include/boost/compat/shared_lock.hpp /usr/include/boost/locale/detail/facet_id.hpp /usr/include/boost/mysql/impl/row_impl.ipp /usr/include/boost/unordered/detail/foa/concurrent_table.hpp /usr/include/boost/compat/detail/throw_system_error.hpp /usr/include/boost/mysql/impl/internal/network_algorithms/read_some_rows
 _dynamic.hpp /usr/include/boost/mysql/impl/internal/network_algorithms/close_statement.hpp /usr/include/boost/mysql/impl/channel_ptr.ipp /usr/include/boost/mysql/impl/internal/protocol/constants.hpp /usr/include/boost/mysql/detail/field_impl.hpp /usr/include/boost/mysql/impl/internal/network_algorithms/prepare_statement.hpp /usr/include/boost/mysql/impl/internal/network_algorithms/quit_connection.hpp /usr/include/boost/mysql/impl/internal/protocol/binary_serialization.hpp /usr/include/boost/mysql/impl/internal/error/server_error_to_string.ipp /usr/include/boost/mysql/impl/internal/network_algorithms/read_some_rows.hpp /usr/include/boost/mysql/impl/field.ipp /usr/include/boost/mysql/impl/internal/channel/write_message.hpp /usr/include/boost/json/detail/charconv/limits.hpp /usr/include/boost/mysql/impl/internal/protocol/static_buffer.hpp /usr/include/boost/compat/latch.hpp /usr/include/boost/mysql/impl/internal/protocol/serialization.hpp /usr/include/boost/json/detail/charconv/detail/
 from_chars_integer_impl.hpp /usr/include/boost/mp11/detail/mp_defer.hpp /usr/include/boost/mp11/detail/mp_value.hpp /usr/lib/cmake/BoostDetectToolset-1.83.0.cmake /usr/include/boost/mysql/impl/internal/auth/auth.hpp /usr/include/boost/mysql/detail/writable_field_traits.hpp /usr/include/boost/mysql/detail/socket_stream.hpp /usr/include/boost/mysql/impl/internal/network_algorithms/close_connection.hpp"
packages/core2-32-poky-linux/boost/boost-exception: PV changed from "1.82.0" to "1.83.0"
packages/core2-32-poky-linux/boost/boost-exception: PKGV changed from 1.82.0 [default] to 1.83.0 [default]
packages/core2-32-poky-linux/boost/boost-fiber: PV changed from "1.82.0" to "1.83.0"
packages/core2-32-poky-linux/boost/boost-fiber: PKGV changed from 1.82.0 [default] to 1.83.0 [default]
packages/core2-32-poky-linux/boost/boost-fiber: PKG changed from libboost-fiber1.82.0 to libboost-fiber1.83.0
packages/core2-32-poky-linux/boost/boost-fiber: FILELIST: removed "/usr/lib/libboost_fiber.so.1.82.0", added "/usr/lib/libboost_fiber.so.1.83.0"
packages/core2-32-poky-linux/boost/boost-filesystem: PV changed from "1.82.0" to "1.83.0"
packages/core2-32-poky-linux/boost/boost-filesystem: PKGV changed from 1.82.0 [default] to 1.83.0 [default]
packages/core2-32-poky-linux/boost/boost-filesystem: PKG changed from libboost-filesystem1.82.0 to libboost-filesystem1.83.0
packages/core2-32-poky-linux/boost/boost-filesystem: FILELIST: removed "/usr/lib/libboost_filesystem.so.1.82.0", added "/usr/lib/libboost_filesystem.so.1.83.0"
packages/core2-32-poky-linux/boost/boost-graph: PV changed from "1.82.0" to "1.83.0"
packages/core2-32-poky-linux/boost/boost-graph: PKGV changed from 1.82.0 [default] to 1.83.0 [default]
packages/core2-32-poky-linux/boost/boost-graph: PKG changed from libboost-graph1.82.0 to libboost-graph1.83.0
packages/core2-32-poky-linux/boost/boost-graph: FILELIST: removed "/usr/lib/libboost_graph.so.1.82.0", added "/usr/lib/libboost_graph.so.1.83.0"
packages/core2-32-poky-linux/boost/boost-headers: PV changed from "1.82.0" to "1.83.0"
packages/core2-32-poky-linux/boost/boost-headers: PKGV changed from 1.82.0 [default] to 1.83.0 [default]
packages/core2-32-poky-linux/boost/boost-iostreams: PV changed from "1.82.0" to "1.83.0"
packages/core2-32-poky-linux/boost/boost-iostreams: PKGV changed from 1.82.0 [default] to 1.83.0 [default]
packages/core2-32-poky-linux/boost/boost-iostreams: PKG changed from libboost-iostreams1.82.0 to libboost-iostreams1.83.0
packages/core2-32-poky-linux/boost/boost-iostreams: FILELIST: removed "/usr/lib/libboost_iostreams.so.1.82.0", added "/usr/lib/libboost_iostreams.so.1.83.0"
packages/core2-32-poky-linux/boost/boost-json: PV changed from "1.82.0" to "1.83.0"
packages/core2-32-poky-linux/boost/boost-json: PKGV changed from 1.82.0 [default] to 1.83.0 [default]
packages/core2-32-poky-linux/boost/boost-json: PKGSIZE changed from 304760 to 386648 (+27%)
packages/core2-32-poky-linux/boost/boost-json: PKG changed from libboost-json1.82.0 to libboost-json1.83.0
packages/core2-32-poky-linux/boost/boost-json: FILELIST: removed "/usr/lib/libboost_json.so.1.82.0", added "/usr/lib/libboost_json.so.1.83.0"
packages/core2-32-poky-linux/boost/boost-locale: PV changed from "1.82.0" to "1.83.0"
packages/core2-32-poky-linux/boost/boost-locale: PKGV changed from 1.82.0 [default] to 1.83.0 [default]
packages/core2-32-poky-linux/boost/boost-locale: PKGSIZE changed from 1017788 to 911164 (-10%)
packages/core2-32-poky-linux/boost/boost-locale: PKG changed from libboost-locale1.82.0 to libboost-locale1.83.0
packages/core2-32-poky-linux/boost/boost-locale: FILELIST: removed "/usr/lib/libboost_locale.so.1.82.0", added "/usr/lib/libboost_locale.so.1.83.0"
packages/core2-32-poky-linux/boost/boost-log: PV changed from "1.82.0" to "1.83.0"
packages/core2-32-poky-linux/boost/boost-log: PKGV changed from 1.82.0 [default] to 1.83.0 [default]
packages/core2-32-poky-linux/boost/boost-log: FILELIST: removed "/usr/lib/libboost_log_setup.so.1.82.0 /usr/lib/libboost_log.so.1.82.0", added "/usr/lib/libboost_log_setup.so.1.83.0 /usr/lib/libboost_log.so.1.83.0"
packages/core2-32-poky-linux/boost/boost-math: PV changed from "1.82.0" to "1.83.0"
packages/core2-32-poky-linux/boost/boost-math: PKGV changed from 1.82.0 [default] to 1.83.0 [default]
packages/core2-32-poky-linux/boost/boost-math: FILELIST: removed "/usr/lib/libboost_math_tr1f.so.1.82.0 /usr/lib/libboost_math_tr1l.so.1.82.0 /usr/lib/libboost_math_c99.so.1.82.0 /usr/lib/libboost_math_tr1.so.1.82.0 /usr/lib/libboost_math_c99l.so.1.82.0 /usr/lib/libboost_math_c99f.so.1.82.0", added "/usr/lib/libboost_math_tr1l.so.1.83.0 /usr/lib/libboost_math_c99f.so.1.83.0 /usr/lib/libboost_math_tr1f.so.1.83.0 /usr/lib/libboost_math_c99l.so.1.83.0 /usr/lib/libboost_math_c99.so.1.83.0 /usr/lib/libboost_math_tr1.so.1.83.0"
packages/core2-32-poky-linux/boost/boost-program-options: PV changed from "1.82.0" to "1.83.0"
packages/core2-32-poky-linux/boost/boost-program-options: PKGV changed from 1.82.0 [default] to 1.83.0 [default]
packages/core2-32-poky-linux/boost/boost-program-options: PKG changed from libboost-program-options1.82.0 to libboost-program-options1.83.0
packages/core2-32-poky-linux/boost/boost-program-options: FILELIST: removed "/usr/lib/libboost_program_options.so.1.82.0", added "/usr/lib/libboost_program_options.so.1.83.0"
packages/core2-32-poky-linux/boost/boost-python: PV changed from "1.82.0" to "1.83.0"
packages/core2-32-poky-linux/boost/boost-python: PKGV changed from 1.82.0 [default] to 1.83.0 [default]
packages/core2-32-poky-linux/boost/boost-python: PKG changed from libboost-python311-1.82.0 to libboost-python311-1.83.0
packages/core2-32-poky-linux/boost/boost-python: FILELIST: removed "/usr/lib/libboost_python311.so.1.82.0", added "/usr/lib/libboost_python311.so.1.83.0"
packages/core2-32-poky-linux/boost/boost-random: PV changed from "1.82.0" to "1.83.0"
packages/core2-32-poky-linux/boost/boost-random: PKGV changed from 1.82.0 [default] to 1.83.0 [default]
packages/core2-32-poky-linux/boost/boost-random: PKG changed from libboost-random1.82.0 to libboost-random1.83.0
packages/core2-32-poky-linux/boost/boost-random: FILELIST: removed "/usr/lib/libboost_random.so.1.82.0", added "/usr/lib/libboost_random.so.1.83.0"
packages/core2-32-poky-linux/boost/boost-regex: PV changed from "1.82.0" to "1.83.0"
packages/core2-32-poky-linux/boost/boost-regex: PKGV changed from 1.82.0 [default] to 1.83.0 [default]
packages/core2-32-poky-linux/boost/boost-regex: PKG changed from libboost-regex1.82.0 to libboost-regex1.83.0
packages/core2-32-poky-linux/boost/boost-regex: FILELIST: removed "/usr/lib/libboost_regex.so.1.82.0", added "/usr/lib/libboost_regex.so.1.83.0"
packages/core2-32-poky-linux/boost/boost-serialization: PV changed from "1.82.0" to "1.83.0"
packages/core2-32-poky-linux/boost/boost-serialization: PKGV changed from 1.82.0 [default] to 1.83.0 [default]
packages/core2-32-poky-linux/boost/boost-serialization: FILELIST: removed "/usr/lib/libboost_wserialization.so.1.82.0 /usr/lib/libboost_serialization.so.1.82.0", added "/usr/lib/libboost_wserialization.so.1.83.0 /usr/lib/libboost_serialization.so.1.83.0"
packages/core2-32-poky-linux/boost/boost-src: PV changed from "1.82.0" to "1.83.0"
packages/core2-32-poky-linux/boost/boost-src: PKGV changed from 1.82.0 [default] to 1.83.0 [default]
packages/core2-32-poky-linux/boost/boost-src: PKGSIZE changed from 19839090 to 20173533 (+2%)
packages/core2-32-poky-linux/boost/boost-src: FILELIST: directory renamed /usr/src/debug/boost/1.82.0-r0/boost/tuple/detail -> /usr/src/debug/boost/1.83.0-r0/boost/tuple/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/graph -> /usr/src/debug/boost/1.83.0-r0/boost/graph, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/support/iterators/detail -> /usr/src/debug/boost/1.83.0-r0/boost/spirit/home/support/iterators/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/numeric/conversion/detail -> /usr/src/debug/boost/1.83.0-r0/boost/numeric/conversion/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/graph/detail -> /usr/src/debug/boost/1.83.0-r0/boost/graph/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/any -> /usr/src/debug/boost/1.83.0-r0/boost/any, directory renamed /usr/src/debug/boost/1.82.0-r0/libs/coroutine/src -> /usr/src/debug/boost/1.83.0-r0/libs/coroutine/src, directory renamed /usr/src/debug/boost/1.82.0-
 r0/boost/range/detail -> /usr/src/debug/boost/1.83.0-r0/boost/range/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/fusion/algorithm/query -> /usr/src/debug/boost/1.83.0-r0/boost/fusion/algorithm/query, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/filesystem -> /usr/src/debug/boost/1.83.0-r0/boost/filesystem, directory renamed /usr/src/debug/boost/1.82.0-r0/libs/graph/src -> /usr/src/debug/boost/1.83.0-r0/libs/graph/src, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/log/expressions -> /usr/src/debug/boost/1.83.0-r0/boost/log/expressions, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/date_time/local_time -> /usr/src/debug/boost/1.83.0-r0/boost/date_time/local_time, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/date_time/posix_time -> /usr/src/debug/boost/1.83.0-r0/boost/date_time/posix_time, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/classic/core/scanner -> /usr/src/debug/boost/1.83.0-r0/boost/spirit/home/cla
 ssic/core/scanner, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/xpressive/detail/static/transforms -> /usr/src/debug/boost/1.83.0-r0/boost/xpressive/detail/static/transforms, directory renamed /usr/src/debug/boost/1.82.0-r0/libs/log/src -> /usr/src/debug/boost/1.83.0-r0/libs/log/src, directory renamed /usr/src/debug/boost/1.82.0-r0/libs/log/src/setup -> /usr/src/debug/boost/1.83.0-r0/libs/log/src/setup, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/classic/utility/impl -> /usr/src/debug/boost/1.83.0-r0/boost/spirit/home/classic/utility/impl, directory renamed /usr/src/debug/boost/1.82.0-r0/libs/log/src/posix -> /usr/src/debug/boost/1.83.0-r0/libs/log/src/posix, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/function_types -> /usr/src/debug/boost/1.83.0-r0/boost/function_types, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/coroutine/detail -> /usr/src/debug/boost/1.83.0-r0/boost/coroutine/detail, directory renamed /usr/src/debug/boost/1
 .82.0-r0/boost/numeric/conversion -> /usr/src/debug/boost/1.83.0-r0/boost/numeric/conversion, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/phoenix/bind -> /usr/src/debug/boost/1.83.0-r0/boost/phoenix/bind, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/phoenix/core -> /usr/src/debug/boost/1.83.0-r0/boost/phoenix/core, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/json/detail/ryu/impl -> /usr/src/debug/boost/1.83.0-r0/boost/json/detail/ryu/impl, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/function -> /usr/src/debug/boost/1.83.0-r0/boost/function, directory renamed /usr/src/debug/boost/1.82.0-r0/boost -> /usr/src/debug/boost/1.83.0-r0/boost, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/support/detail -> /usr/src/debug/boost/1.83.0-r0/boost/spirit/home/support/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/iostreams/device -> /usr/src/debug/boost/1.83.0-r0/boost/iostreams/device, directory renamed /usr/src/debu
 g/boost/1.82.0-r0/boost/spirit/home/classic/core/scanner/impl -> /usr/src/debug/boost/1.83.0-r0/boost/spirit/home/classic/core/scanner/impl, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/date_time/gregorian -> /usr/src/debug/boost/1.83.0-r0/boost/date_time/gregorian, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/wave/util -> /usr/src/debug/boost/1.83.0-r0/boost/wave/util, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/thread/detail -> /usr/src/debug/boost/1.83.0-r0/boost/thread/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/libs/coroutine/src/posix -> /usr/src/debug/boost/1.83.0-r0/libs/coroutine/src/posix, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/qi/directive -> /usr/src/debug/boost/1.83.0-r0/boost/spirit/home/qi/directive, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/exception -> /usr/src/debug/boost/1.83.0-r0/boost/exception, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/iterator/detail -> /usr/src/d
 ebug/boost/1.83.0-r0/boost/iterator/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/xpressive -> /usr/src/debug/boost/1.83.0-r0/boost/xpressive, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/variant -> /usr/src/debug/boost/1.83.0-r0/boost/variant, directory renamed /usr/src/debug/boost/1.82.0-r0/libs/context/src/posix -> /usr/src/debug/boost/1.83.0-r0/libs/context/src/posix, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/contract/detail/inlined/core -> /usr/src/debug/boost/1.83.0-r0/boost/contract/detail/inlined/core, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/property_map -> /usr/src/debug/boost/1.83.0-r0/boost/property_map, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/random/detail -> /usr/src/debug/boost/1.83.0-r0/boost/random/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/libs/type_erasure/src -> /usr/src/debug/boost/1.83.0-r0/libs/type_erasure/src, directory renamed /usr/src/debug/boost/1.82.0-r0/libs/locale/src/bo
 ost/locale/shared -> /usr/src/debug/boost/1.83.0-r0/libs/locale/src/boost/locale/shared, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/karma/detail -> /usr/src/debug/boost/1.83.0-r0/boost/spirit/home/karma/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/classic/tree -> /usr/src/debug/boost/1.83.0-r0/boost/spirit/home/classic/tree, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/asio/traits -> /usr/src/debug/boost/1.83.0-r0/boost/asio/traits, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/proto -> /usr/src/debug/boost/1.83.0-r0/boost/proto, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/parameter/aux_ -> /usr/src/debug/boost/1.83.0-r0/boost/parameter/aux_, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/assert -> /usr/src/debug/boost/1.83.0-r0/boost/assert, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/filesystem/detail -> /usr/src/debug/boost/1.83.0-r0/boost/filesystem/detail, directory renamed /u
 sr/src/debug/boost/1.82.0-r0/boost/spirit/home/karma/numeric -> /usr/src/debug/boost/1.83.0-r0/boost/spirit/home/karma/numeric, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/type_erasure/detail -> /usr/src/debug/boost/1.83.0-r0/boost/type_erasure/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/proto/detail/preprocessed -> /usr/src/debug/boost/1.83.0-r0/boost/proto/detail/preprocessed, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/math/special_functions -> /usr/src/debug/boost/1.83.0-r0/boost/math/special_functions, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/type_traits/detail -> /usr/src/debug/boost/1.83.0-r0/boost/type_traits/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/python/object -> /usr/src/debug/boost/1.83.0-r0/boost/python/object, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/log/utility/setup -> /usr/src/debug/boost/1.83.0-r0/boost/log/utility/setup, directory renamed /usr/src/debug/boost/1.82.0-r0/boos
 t/property_tree -> /usr/src/debug/boost/1.83.0-r0/boost/property_tree, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/classic/attribute -> /usr/src/debug/boost/1.83.0-r0/boost/spirit/home/classic/attribute, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/contract/detail -> /usr/src/debug/boost/1.83.0-r0/boost/contract/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/libs/serialization/src -> /usr/src/debug/boost/1.83.0-r0/libs/serialization/src, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/type_index -> /usr/src/debug/boost/1.83.0-r0/boost/type_index, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/chrono/detail/inlined/posix -> /usr/src/debug/boost/1.83.0-r0/boost/chrono/detail/inlined/posix, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/mpl/vector/aux_ -> /usr/src/debug/boost/1.83.0-r0/boost/mpl/vector/aux_, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/variant2 -> /usr/src/debug/boost/1.83.0-r0/boost/variant2, 
 directory renamed /usr/src/debug/boost/1.82.0-r0/libs/exception/src -> /usr/src/debug/boost/1.83.0-r0/libs/exception/src, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/fusion/support/detail -> /usr/src/debug/boost/1.83.0-r0/boost/fusion/support/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/archive/detail -> /usr/src/debug/boost/1.83.0-r0/boost/archive/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/libs/fiber/src -> /usr/src/debug/boost/1.83.0-r0/libs/fiber/src, directory renamed /usr/src/debug/boost/1.82.0-r0/libs/timer/src -> /usr/src/debug/boost/1.83.0-r0/libs/timer/src, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/system/detail -> /usr/src/debug/boost/1.83.0-r0/boost/system/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/config/detail -> /usr/src/debug/boost/1.83.0-r0/boost/config/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/function/detail -> /usr/src/debug/boost/1.83.0-r0/boost/function/detail, direc
 tory renamed /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/support/char_set -> /usr/src/debug/boost/1.83.0-r0/boost/spirit/home/support/char_set, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/phoenix/support/preprocessed -> /usr/src/debug/boost/1.83.0-r0/boost/phoenix/support/preprocessed, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/wave/grammars -> /usr/src/debug/boost/1.83.0-r0/boost/wave/grammars, directory renamed /usr/src/debug/boost/1.82.0-r0/libs/iostreams/src -> /usr/src/debug/boost/1.83.0-r0/libs/iostreams/src, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/phoenix/core/detail -> /usr/src/debug/boost/1.83.0-r0/boost/phoenix/core/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/libs/fiber/src/algo -> /usr/src/debug/boost/1.83.0-r0/libs/fiber/src/algo, directory renamed /usr/src/debug/boost/1.82.0-r0/libs/locale/src/boost/locale/std -> /usr/src/debug/boost/1.83.0-r0/libs/locale/src/boost/locale/std, directory renamed /usr/src/debug/boost
 /1.82.0-r0/boost/test/tools/old -> /usr/src/debug/boost/1.83.0-r0/boost/test/tools/old, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/qi/numeric -> /usr/src/debug/boost/1.83.0-r0/boost/spirit/home/qi/numeric, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/smart_ptr/detail -> /usr/src/debug/boost/1.83.0-r0/boost/smart_ptr/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/unordered/detail -> /usr/src/debug/boost/1.83.0-r0/boost/unordered/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/property_tree/detail -> /usr/src/debug/boost/1.83.0-r0/boost/property_tree/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/asio/execution -> /usr/src/debug/boost/1.83.0-r0/boost/asio/execution, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/lexical_cast -> /usr/src/debug/boost/1.83.0-r0/boost/lexical_cast, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/fiber -> /usr/src/debug/boost/1.83.0-r0/boost/fiber, directory ren
 amed /usr/src/debug/boost/1.82.0-r0/boost/timer -> /usr/src/debug/boost/1.83.0-r0/boost/timer, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/algorithm/cxx11 -> /usr/src/debug/boost/1.83.0-r0/boost/algorithm/cxx11, directory renamed /usr/src/debug/boost/1.82.0-r0/libs/python/src/converter -> /usr/src/debug/boost/1.83.0-r0/libs/python/src/converter, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/xpressive/detail/static -> /usr/src/debug/boost/1.83.0-r0/boost/xpressive/detail/static, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/math/tools -> /usr/src/debug/boost/1.83.0-r0/boost/math/tools, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/function_types/detail -> /usr/src/debug/boost/1.83.0-r0/boost/function_types/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/log/utility/ipc -> /usr/src/debug/boost/1.83.0-r0/boost/log/utility/ipc, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/fusion/algorithm/query/detail -> /usr/src/debug/boost
 /1.83.0-r0/boost/fusion/algorithm/query/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/json/detail/ryu -> /usr/src/debug/boost/1.83.0-r0/boost/json/detail/ryu, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/serialization -> /usr/src/debug/boost/1.83.0-r0/boost/serialization, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/classic/core/primitives -> /usr/src/debug/boost/1.83.0-r0/boost/spirit/home/classic/core/primitives, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/atomic/detail -> /usr/src/debug/boost/1.83.0-r0/boost/atomic/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/iostreams/filter -> /usr/src/debug/boost/1.83.0-r0/boost/iostreams/filter, directory renamed /usr/src/debug/boost/1.82.0-r0/libs/thread/src/pthread -> /usr/src/debug/boost/1.83.0-r0/libs/thread/src/pthread, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/interprocess/detail -> /usr/src/debug/boost/1.83.0-r0/boost/interprocess/detail, directo
 ry renamed /usr/src/debug/boost/1.82.0-r0/boost/archive -> /usr/src/debug/boost/1.83.0-r0/boost/archive, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/parameter -> /usr/src/debug/boost/1.83.0-r0/boost/parameter, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/bind/detail -> /usr/src/debug/boost/1.83.0-r0/boost/bind/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/contract/detail/inlined -> /usr/src/debug/boost/1.83.0-r0/boost/contract, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/type_traits -> /usr/src/debug/boost/1.83.0-r0/boost/type_traits, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/concept/detail -> /usr/src/debug/boost/1.83.0-r0/boost/concept/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/qi/char -> /usr/src/debug/boost/1.83.0-r0/boost/spirit/home/qi/char, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/classic/core -> /usr/src/debug/boost/1.83.0-r0/boost/spirit/home/classic/core,
  directory renamed /usr/src/debug/boost/1.82.0-r0/boost/fusion/container/list -> /usr/src/debug/boost/1.83.0-r0/boost/fusion/container/list, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/test/utils/runtime/cla -> /usr/src/debug/boost/1.83.0-r0/boost/test/utils/runtime/cla, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/test/tree -> /usr/src/debug/boost/1.83.0-r0/boost/test/tree, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/archive/impl -> /usr/src/debug/boost/1.83.0-r0/boost/archive/impl, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/python/detail -> /usr/src/debug/boost/1.83.0-r0/boost/python/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/log/utility/type_dispatch -> /usr/src/debug/boost/1.83.0-r0/boost/log/utility/type_dispatch, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/proto/transform -> /usr/src/debug/boost/1.83.0-r0/boost/proto/transform, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/ratio -> /usr/src/deb
 ug/boost/1.83.0-r0/boost/ratio, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/log/expressions/predicates -> /usr/src/debug/boost/1.83.0-r0/boost/log/expressions/predicates, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/locale/boundary -> /usr/src/debug/boost/1.83.0-r0/boost/locale/boundary, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/xpressive/detail/core -> /usr/src/debug/boost/1.83.0-r0/boost/xpressive/detail/core, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/atomic/detail/type_traits -> /usr/src/debug/boost/1.83.0-r0/boost/atomic/detail/type_traits, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/karma/numeric/detail -> /usr/src/debug/boost/1.83.0-r0/boost/spirit/home/karma/numeric/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/libs/atomic/src -> /usr/src/debug/boost/1.83.0-r0/libs/atomic/src, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/context/detail -> /usr/src/debug/boost/1.83.0-r0/boost/context/det
 ail, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/lexical_cast/detail -> /usr/src/debug/boost/1.83.0-r0/boost/lexical_cast/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/test/tools -> /usr/src/debug/boost/1.83.0-r0/boost/test/tools, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/classic/phoenix -> /usr/src/debug/boost/1.83.0-r0/boost/spirit/home/classic/phoenix, directory renamed /usr/src/debug/boost/1.82.0-r0/libs/coroutine/src/detail -> /usr/src/debug/boost/1.83.0-r0/libs/coroutine/src/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/xpressive/detail/core/matcher -> /usr/src/debug/boost/1.83.0-r0/boost/xpressive/detail/core/matcher, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/multi_index -> /usr/src/debug/boost/1.83.0-r0/boost/multi_index, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/integer -> /usr/src/debug/boost/1.83.0-r0/boost/integer, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/test/ut
 ils -> /usr/src/debug/boost/1.83.0-r0/boost/test/utils, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/pending -> /usr/src/debug/boost/1.83.0-r0/boost/pending, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/io -> /usr/src/debug/boost/1.83.0-r0/boost/io, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/fusion/sequence/intrinsic -> /usr/src/debug/boost/1.83.0-r0/boost/fusion/sequence/intrinsic, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/qi/numeric/detail -> /usr/src/debug/boost/1.83.0-r0/boost/spirit/home/qi/numeric/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/thread -> /usr/src/debug/boost/1.83.0-r0/boost/thread, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/wave/cpplexer -> /usr/src/debug/boost/1.83.0-r0/boost/wave/cpplexer, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/asio/execution/detail -> /usr/src/debug/boost/1.83.0-r0/boost/asio/execution/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/
 boost/spirit/home/support/char_encoding -> /usr/src/debug/boost/1.83.0-r0/boost/spirit/home/support/char_encoding, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/qi -> /usr/src/debug/boost/1.83.0-r0/boost/spirit/home/qi, directory renamed /usr/src/debug/boost/1.82.0-r0/libs/math/src/tr1 -> /usr/src/debug/boost/1.83.0-r0/libs/math/src/tr1, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/json/detail/impl -> /usr/src/debug/boost/1.83.0-r0/boost/json/detail/impl, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/phoenix/core/detail/cpp03/preprocessed -> /usr/src/debug/boost/1.83.0-r0/boost/phoenix/core/detail/cpp03/preprocessed, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/math/policies -> /usr/src/debug/boost/1.83.0-r0/boost/math/policies, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/atomic -> /usr/src/debug/boost/1.83.0-r0/boost/atomic, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/fusion/adapted/struct/detail -> /usr/src/de
 bug/boost/1.83.0-r0/boost/fusion/adapted/struct/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/libs/locale/src/boost/locale/icu -> /usr/src/debug/boost/1.83.0-r0/libs/locale/src/boost/locale/icu, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/proto/detail -> /usr/src/debug/boost/1.83.0-r0/boost/proto/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/describe/detail -> /usr/src/debug/boost/1.83.0-r0/boost/describe/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/chrono -> /usr/src/debug/boost/1.83.0-r0/boost/chrono, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/classic/core/composite/impl -> /usr/src/debug/boost/1.83.0-r0/boost/spirit/home/classic/core/composite/impl, directory renamed /usr/src/debug/boost/1.82.0-r0/libs/locale/src/boost/locale/posix -> /usr/src/debug/boost/1.83.0-r0/libs/locale/src/boost/locale/posix, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/classic/iterator -> /usr/src/debug
 /boost/1.83.0-r0/boost/spirit/home/classic/iterator, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/classic/dynamic -> /usr/src/debug/boost/1.83.0-r0/boost/spirit/home/classic/dynamic, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/program_options/detail -> /usr/src/debug/boost/1.83.0-r0/boost/program_options/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/thread/pthread -> /usr/src/debug/boost/1.83.0-r0/boost/thread/pthread, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/mpl/aux_/preprocessed/gcc -> /usr/src/debug/boost/1.83.0-r0/boost/mpl/aux_/preprocessed/gcc, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/coroutine -> /usr/src/debug/boost/1.83.0-r0/boost/coroutine, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/asio/impl -> /usr/src/debug/boost/1.83.0-r0/boost/asio/impl, directory renamed /usr/src/debug/boost/1.82.0-r0/libs/wave/src/cpplexer/re2clex -> /usr/src/debug/boost/1.83.0-r0/libs/wave/src/cpplexer/re2clex
 , directory renamed /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/classic/core/composite -> /usr/src/debug/boost/1.83.0-r0/boost/spirit/home/classic/core/composite, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/log -> /usr/src/debug/boost/1.83.0-r0/boost/log, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/classic/core/impl -> /usr/src/debug/boost/1.83.0-r0/boost/spirit/home/classic/core/impl, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/iostreams/detail -> /usr/src/debug/boost/1.83.0-r0/boost/iostreams/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/thread/csbl/memory -> /usr/src/debug/boost/1.83.0-r0/boost/thread/csbl/memory, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/fiber/detail -> /usr/src/debug/boost/1.83.0-r0/boost/fiber/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/interprocess -> /usr/src/debug/boost/1.83.0-r0/boost/interprocess, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/date_t
 ime -> /usr/src/debug/boost/1.83.0-r0/boost/date_time, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/fusion/support -> /usr/src/debug/boost/1.83.0-r0/boost/fusion/support, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/math/tools/detail -> /usr/src/debug/boost/1.83.0-r0/boost/math/tools/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/asio/ip/impl -> /usr/src/debug/boost/1.83.0-r0/boost/asio/ip/impl, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/fusion/algorithm/iteration -> /usr/src/debug/boost/1.83.0-r0/boost/fusion/algorithm/iteration/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/optional -> /usr/src/debug/boost/1.83.0-r0/boost/optional, directory renamed /usr/src/debug/boost/1.82.0-r0/libs/container/src -> /usr/src/debug/boost/1.83.0-r0/libs/container/src, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/asio/ip/detail -> /usr/src/debug/boost/1.83.0-r0/boost/asio/ip/detail, directory renamed /usr/src/debug/boost/1.82
 .0-r0/boost/multi_index/detail -> /usr/src/debug/boost/1.83.0-r0/boost/multi_index/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/asio/ip/detail/impl -> /usr/src/debug/boost/1.83.0-r0/boost/asio/ip/detail/impl, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/log/sources -> /usr/src/debug/boost/1.83.0-r0/boost/log/sources, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/classic/meta -> /usr/src/debug/boost/1.83.0-r0/boost/spirit/home/classic/meta, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/log/utility/functional -> /usr/src/debug/boost/1.83.0-r0/boost/log/utility/functional, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/mpl -> /usr/src/debug/boost/1.83.0-r0/boost/mpl, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/log/core -> /usr/src/debug/boost/1.83.0-r0/boost/log/core, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/asio/execution/impl -> /usr/src/debug/boost/1.83.0-r0/boost/asio/execution/impl, director
 y renamed /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/qi/detail -> /usr/src/debug/boost/1.83.0-r0/boost/spirit/home/qi/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/qi/nonterminal -> /usr/src/debug/boost/1.83.0-r0/boost/spirit/home/qi/nonterminal, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/mpl/list/aux_ -> /usr/src/debug/boost/1.83.0-r0/boost/mpl/list/aux_, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/locale/util -> /usr/src/debug/boost/1.83.0-r0/boost/locale/util, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/align/detail -> /usr/src/debug/boost/1.83.0-r0/boost/align/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/log/sinks -> /usr/src/debug/boost/1.83.0-r0/boost/log/sinks, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/log/utility/manipulators -> /usr/src/debug/boost/1.83.0-r0/boost/log/utility/manipulators, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/proto/transform/detail/preproces
 sed -> /usr/src/debug/boost/1.83.0-r0/boost/proto/transform/detail/preprocessed, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/wave/cpplexer/re2clex -> /usr/src/debug/boost/1.83.0-r0/boost/wave/cpplexer/re2clex, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/fusion/iterator -> /usr/src/debug/boost/1.83.0-r0/boost/fusion/iterator, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/container_hash -> /usr/src/debug/boost/1.83.0-r0/boost/container_hash, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/range/algorithm -> /usr/src/debug/boost/1.83.0-r0/boost/range/algorithm, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/asio/detail -> /usr/src/debug/boost/1.83.0-r0/boost/asio/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/chrono/detail -> /usr/src/debug/boost/1.83.0-r0/boost/chrono/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/test/output -> /usr/src/debug/boost/1.83.0-r0/boost/test/output, directory renamed /usr/src/deb
 ug/boost/1.82.0-r0/libs/wave/src -> /usr/src/debug/boost/1.83.0-r0/libs/wave/src, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/fusion/container/set -> /usr/src/debug/boost/1.83.0-r0/boost/fusion/container/set, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/container -> /usr/src/debug/boost/1.83.0-r0/boost/container, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/random -> /usr/src/debug/boost/1.83.0-r0/boost/random, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/classic/dynamic/impl -> /usr/src/debug/boost/1.83.0-r0/boost/spirit/home/classic/dynamic/impl, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/classic/utility -> /usr/src/debug/boost/1.83.0-r0/boost/spirit/home/classic/utility, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/type_erasure -> /usr/src/debug/boost/1.83.0-r0/boost/type_erasure, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/qi/string -> /usr/src/debug/boost/1.83.0-r0/boos
 t/spirit/home/qi/string, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/test/utils/runtime -> /usr/src/debug/boost/1.83.0-r0/boost/test/utils/runtime, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/algorithm/string -> /usr/src/debug/boost/1.83.0-r0/boost/algorithm/string, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/python -> /usr/src/debug/boost/1.83.0-r0/boost/python, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/log/utility -> /usr/src/debug/boost/1.83.0-r0/boost/log/utility, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/fusion/adapted/boost_tuple/detail -> /usr/src/debug/boost/1.83.0-r0/boost/fusion/adapted/boost_tuple/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/math/constants -> /usr/src/debug/boost/1.83.0-r0/boost/math/constants, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/describe -> /usr/src/debug/boost/1.83.0-r0/boost/describe, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/thread/futures -> /
 usr/src/debug/boost/1.83.0-r0/boost/thread/futures, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/system -> /usr/src/debug/boost/1.83.0-r0/boost/system, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/context -> /usr/src/debug/boost/1.83.0-r0/boost/context, directory renamed /usr/src/debug/boost/1.82.0-r0/libs/date_time/src/gregorian -> /usr/src/debug/boost/1.83.0-r0/libs/date_time/src/gregorian, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/fusion/container/set/detail -> /usr/src/debug/boost/1.83.0-r0/boost/fusion/container/set/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/classic/utility/impl/chset -> /usr/src/debug/boost/1.83.0-r0/boost/spirit/home/classic/utility/impl/chset, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/support/nonterminal -> /usr/src/debug/boost/1.83.0-r0/boost/spirit/home/support/nonterminal, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/python/converter -> /usr/src/debug/boost
 /1.83.0-r0/boost/python/converter, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/test/utils/basic_cstring -> /usr/src/debug/boost/1.83.0-r0/boost/test/utils/basic_cstring, directory renamed /usr/src/debug/boost/1.82.0-r0/libs/random/src -> /usr/src/debug/boost/1.83.0-r0/libs/random/src, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/classic/actor -> /usr/src/debug/boost/1.83.0-r0/boost/spirit/home/classic/actor, directory renamed /usr/src/debug/boost/1.82.0-r0/libs/program_options/src -> /usr/src/debug/boost/1.83.0-r0/libs/program_options/src, directory renamed /usr/src/debug/boost/1.82.0-r0/libs/python/src -> /usr/src/debug/boost/1.83.0-r0/libs/python/src, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/xpressive/traits -> /usr/src/debug/boost/1.83.0-r0/boost/xpressive/traits, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/contract -> /usr/src/debug/boost/1.83.0-r0/boost/contract/detail/inlined, directory renamed /usr/src/debug/boost/1.82
 .0-r0/boost/move/detail -> /usr/src/debug/boost/1.83.0-r0/boost/move/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/contract/core -> /usr/src/debug/boost/1.83.0-r0/boost/contract/core, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/smart_ptr -> /usr/src/debug/boost/1.83.0-r0/boost/smart_ptr, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/classic/meta/impl -> /usr/src/debug/boost/1.83.0-r0/boost/spirit/home/classic/meta/impl, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/test/utils/runtime/env -> /usr/src/debug/boost/1.83.0-r0/boost/test/utils/runtime/env, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/xpressive/detail/utility -> /usr/src/debug/boost/1.83.0-r0/boost/xpressive/detail/utility, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/test/impl -> /usr/src/debug/boost/1.83.0-r0/boost/test/impl, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/classic/core/primitives/impl -> /usr/src/debug/boost/
 1.83.0-r0/boost/spirit/home/classic/core/primitives/impl, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/xpressive/detail -> /usr/src/debug/boost/1.83.0-r0/boost/xpressive/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/variant/detail -> /usr/src/debug/boost/1.83.0-r0/boost/variant/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/ratio/detail -> /usr/src/debug/boost/1.83.0-r0/boost/ratio/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/preprocessor/iteration/detail/limits -> /usr/src/debug/boost/1.83.0-r0/boost/preprocessor/iteration/detail/limits, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/optional/detail -> /usr/src/debug/boost/1.83.0-r0/boost/optional/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/container_hash/detail -> /usr/src/debug/boost/1.83.0-r0/boost/container_hash/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/mpl/vector/aux_/preprocessed/typeof_based -> /usr/src/debug/boost/1.
 83.0-r0/boost/mpl/vector/aux_/preprocessed/typeof_based, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/phoenix/scope/detail -> /usr/src/debug/boost/1.83.0-r0/boost/phoenix/scope/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/karma -> /usr/src/debug/boost/1.83.0-r0/boost/spirit/home/karma, directory renamed /usr/src/debug/boost/1.82.0-r0/libs/system/src -> /usr/src/debug/boost/1.83.0-r0/libs/system/src, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/iostreams -> /usr/src/debug/boost/1.83.0-r0/boost/iostreams, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/contract/detail/inlined/detail -> /usr/src/debug/boost/1.83.0-r0/boost/contract/detail/inlined/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/libs/thread/src -> /usr/src/debug/boost/1.83.0-r0/libs/thread/src, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/log/support -> /usr/src/debug/boost/1.83.0-r0/boost/log/support, directory renamed /usr/src/debug/boost/1.82.
 0-r0/boost/asio/ip -> /usr/src/debug/boost/1.83.0-r0/boost/asio/ip, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/fiber/algo -> /usr/src/debug/boost/1.83.0-r0/boost/fiber/algo, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/io/detail -> /usr/src/debug/boost/1.83.0-r0/boost/io/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/log/detail -> /usr/src/debug/boost/1.83.0-r0/boost/log/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/support/iterators -> /usr/src/debug/boost/1.83.0-r0/boost/spirit/home/support/iterators, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/tuple -> /usr/src/debug/boost/1.83.0-r0/boost/tuple, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/json/detail/ryu/detail -> /usr/src/debug/boost/1.83.0-r0/boost/json/detail/ryu/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/range -> /usr/src/debug/boost/1.83.0-r0/boost/range, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/align ->
  /usr/src/debug/boost/1.83.0-r0/boost/align, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/classic/core/non_terminal/impl -> /usr/src/debug/boost/1.83.0-r0/boost/spirit/home/classic/core/non_terminal/impl, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/utility/detail -> /usr/src/debug/boost/1.83.0-r0/boost/utility/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/program_options -> /usr/src/debug/boost/1.83.0-r0/boost/program_options, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/container/pmr -> /usr/src/debug/boost/1.83.0-r0/boost/container/pmr, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/fusion/container/vector -> /usr/src/debug/boost/1.83.0-r0/boost/fusion/container/vector, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/asio/detail/impl -> /usr/src/debug/boost/1.83.0-r0/boost/asio/detail/impl, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/fusion/algorithm/iteration/detail -> /usr/src/debug/boost/1.83.
 0-r0/boost/fusion/algorithm/iteration, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/phoenix/operator -> /usr/src/debug/boost/1.83.0-r0/boost/phoenix/operator, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/log/attributes -> /usr/src/debug/boost/1.83.0-r0/boost/log/attributes, directory renamed /usr/src/debug/boost/1.82.0-r0/libs/filesystem/src -> /usr/src/debug/boost/1.83.0-r0/libs/filesystem/src, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/proto/functional/fusion -> /usr/src/debug/boost/1.83.0-r0/boost/proto/functional/fusion, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/mp11 -> /usr/src/debug/boost/1.83.0-r0/boost/mp11, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/intrusive -> /usr/src/debug/boost/1.83.0-r0/boost/intrusive, directory renamed /usr/src/debug/boost/1.82.0-r0/libs/regex/src -> /usr/src/debug/boost/1.83.0-r0/libs/regex/src, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/container/detail -> /usr/src/debug/boost/1.
 83.0-r0/boost/container/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/archive/iterators -> /usr/src/debug/boost/1.83.0-r0/boost/archive/iterators, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/intrusive/detail -> /usr/src/debug/boost/1.83.0-r0/boost/intrusive/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/log/keywords -> /usr/src/debug/boost/1.83.0-r0/boost/log/keywords, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/qi/action -> /usr/src/debug/boost/1.83.0-r0/boost/spirit/home/qi/action, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/exception/detail -> /usr/src/debug/boost/1.83.0-r0/boost/exception/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/test/utils/iterator -> /usr/src/debug/boost/1.83.0-r0/boost/test/utils/iterator, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/fusion/container/vector/detail -> /usr/src/debug/boost/1.83.0-r0/boost/fusion/container/vector/detail, directory renamed
  /usr/src/debug/boost/1.82.0-r0/boost/test -> /usr/src/debug/boost/1.83.0-r0/boost/test, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/mpl/aux_ -> /usr/src/debug/boost/1.83.0-r0/boost/mpl/aux_, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/classic/core/non_terminal -> /usr/src/debug/boost/1.83.0-r0/boost/spirit/home/classic/core/non_terminal, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/pool/detail -> /usr/src/debug/boost/1.83.0-r0/boost/pool/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/bind -> /usr/src/debug/boost/1.83.0-r0/boost/bind, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/move -> /usr/src/debug/boost/1.83.0-r0/boost/move, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/wave -> /usr/src/debug/boost/1.83.0-r0/boost/wave, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/phoenix/scope -> /usr/src/debug/boost/1.83.0-r0/boost/phoenix/scope, directory renamed /usr/src/debug/boost/1.82.0-r0/libs/python
 /src/object -> /usr/src/debug/boost/1.83.0-r0/libs/python/src/object, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/pool -> /usr/src/debug/boost/1.83.0-r0/boost/pool, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/asio -> /usr/src/debug/boost/1.83.0-r0/boost/asio, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/math -> /usr/src/debug/boost/1.83.0-r0/boost/math, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/math/special_functions/detail -> /usr/src/debug/boost/1.83.0-r0/boost/math/special_functions/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/test/tools/detail -> /usr/src/debug/boost/1.83.0-r0/boost/test/tools/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/test/detail -> /usr/src/debug/boost/1.83.0-r0/boost/test/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/fusion/sequence -> /usr/src/debug/boost/1.83.0-r0/boost/fusion/sequence, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/suppor
 t -> /usr/src/debug/boost/1.83.0-r0/boost/spirit/home/support, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/detail -> /usr/src/debug/boost/1.83.0-r0/boost/detail, directory renamed /usr/src/debug/boost/1.82.0-r0/boost/algorithm/string/detail -> /usr/src/debug/boost/1.83.0-r0/boost/algorithm/string/detail, removed "/usr/src/debug/boost/1.82.0-r0/boost/core/detail/is_same.hpp /usr/src/debug/boost/1.82.0-r0/boost/iterator/iterator_concepts.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/rfc/relative_ref_rule.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/error.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/system_error.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/detail/format.hpp /usr/src/debug/boost/1.82.0-r0/boost/core/typeinfo.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/detail/value.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/literal_rule.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/segments_ref.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/string_view.hpp 
 /usr/src/debug/boost/1.82.0-r0/boost/url/detail/impl/any_segments_iter.ipp /usr/src/debug/boost/1.82.0-r0/boost/regex/v5/regbase.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/rfc/detail/userinfo_rule.hpp /usr/src/debug/boost/1.82.0-r0/boost/regex/v5/cpp_regex_traits.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/detail/impl/normalize.ipp /usr/src/debug/boost/1.82.0-r0/boost/url/detail/params_iter_impl.hpp /usr/src/debug/boost/1.82.0-r0/boost/iterator/interoperable.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/segments_encoded_base.ipp /usr/src/debug/boost/1.82.0-r0/boost/url/rfc/detail/scheme_rule.hpp /usr/src/debug/boost/1.82.0-r0/boost/locale/message.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/rfc/detail/reg_name_rule.hpp /usr/src/debug/boost/1.82.0-r0/boost/locale/localization_backend.hpp /usr/src/debug/boost/1.82.0-r0/boost/locale/formatting.hpp /usr/src/debug/boost/1.82.0-r0/boost/regex/v5/perl_matcher.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/detail/impl/decode.ipp /usr/s
 rc/debug/boost/1.82.0-r0/boost/url/rfc/detail/hier_part_rule.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/rfc/authority_rule.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/parse_path.ipp /usr/src/debug/boost/1.82.0-r0/boost/url/rfc/pct_encoded_rule.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/error.hpp /usr/src/debug/boost/1.82.0-r0/boost/regex/v5/basic_regex_parser.hpp /usr/src/debug/boost/1.82.0-r0/libs/locale/src/boost/locale/util/info.cpp /usr/src/debug/boost/1.82.0-r0/boost/regex/v5/object_cache.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/delim_rule.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/token_rule.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/tuple_rule.hpp /usr/src/debug/boost/1.82.0-r0/boost/locale/date_time.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/impl/optional_rule.hpp /usr/src/debug/boost/1.82.0-r0/libs/locale/src/boost/locale/encoding/codepage.cpp /usr/src/debug/boost/1.82.0-r0/boost/iterator/distance.hpp /usr/src/debu
 g/boost/1.82.0-r0/boost/core/allocator_access.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/detail/default_resource.hpp /usr/src/debug/boost/1.82.0-r0/libs/locale/src/boost/locale/util/timezone.hpp /usr/src/debug/boost/1.82.0-r0/boost/iterator/transform_iterator.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/lut_chars.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/value_stack.hpp /usr/src/debug/boost/1.82.0-r0/boost/locale/utf.hpp /usr/src/debug/boost/1.82.0-r0/boost/regex/v5/char_regex_traits.hpp /usr/src/debug/boost/1.82.0-r0/boost/core/addressof.hpp /usr/src/debug/boost/1.82.0-r0/boost/iterator/iterator_categories.hpp /usr/src/debug/boost/1.82.0-r0/libs/locale/src/boost/locale/util/gregorian.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/ipv4_address.ipp /usr/src/debug/boost/1.82.0-r0/boost/url/rfc/impl/query_rule.ipp /usr/src/debug/boost/1.82.0-r0/boost/utility/value_init.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/params_encoded_base.hpp /usr/src/debug/boost/1.82.0-r0/
 boost/url/impl/params_encoded_base.ipp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/segments_base.ipp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/error.ipp /usr/src/debug/boost/1.82.0-r0/boost/json/impl/stream_parser.ipp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/segments_encoded_base.hpp /usr/src/debug/boost/1.82.0-r0/libs/locale/src/boost/locale/util/encoding.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/authority_view.ipp /usr/src/debug/boost/1.82.0-r0/libs/locale/src/boost/locale/util/iconv.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/params_base.ipp /usr/src/debug/boost/1.82.0-r0/boost/json/impl/error.ipp /usr/src/debug/boost/1.82.0-r0/boost/core/uncaught_exceptions.hpp /usr/src/debug/boost/1.82.0-r0/boost/core/use_default.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/urls.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/detail/ci_string.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/rfc/detail/impl/ip_literal_rule.ipp /usr/src/debug/boost/1.82.0-r0/boost/url/rf
 c/ipv6_address_rule.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/impl/parse.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/detail/tuple.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/basic_parser.hpp /usr/src/debug/boost/1.82.0-r0/boost/regex/v5/states.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/impl/dec_octet_rule.ipp /usr/src/debug/boost/1.82.0-r0/boost/json/impl/value_stack.ipp /usr/src/debug/boost/1.82.0-r0/boost/json/detail/shared_resource.hpp /usr/src/debug/boost/1.82.0-r0/boost/regex/v5/unicode_iterator.hpp /usr/src/debug/boost/1.82.0-r0/boost/iterator/advance.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/params_encoded_ref.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/parse_options.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/rfc/detail/query_part_rule.hpp /usr/src/debug/boost/1.82.0-r0/libs/locale/src/boost/locale/util/numeric.hpp /usr/src/debug/boost/1.82.0-r0/boost/core/checked_delete.hpp /usr/src/debug/boost/1.82.0-r0/boost/locale/generic_codecvt.hpp
  /usr/src/debug/boost/1.82.0-r0/boost/url/impl/url_base.ipp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/url_view.ipp /usr/src/debug/boost/1.82.0-r0/boost/url/rfc/detail/path_rules.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/detail/encode.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/memory_resource.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/static_resource.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/detail/replacement_field_rule.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/impl/range_rule.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/static_url.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/rfc/detail/relative_part_rule.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/scheme.ipp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/variant_rule.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/impl/tuple_rule.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/authority_view.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/impl/error.ipp /usr/src/debug/boost/1.82.0-r0/boost/
 url/optional.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/serializer.hpp /usr/src/debug/boost/1.82.0-r0/boost/regex/v5/cregex.hpp /usr/src/debug/boost/1.82.0-r0/boost/regex/v5/regex_match.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/segments_ref.hpp /usr/src/debug/boost/1.82.0-r0/boost/regex/v5/c_regex_traits.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/url_view_base.hpp /usr/src/debug/boost/1.82.0-r0/boost/mp11/detail/mp_with_index.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/digit_chars.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/segments_encoded_ref.ipp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/hexdig_chars.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/segments_base.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/ignore_case.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/segments_view.hpp /usr/src/debug/boost/1.82.0-r0/boost/core/scoped_enum.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/array.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/error.hpp /usr/src/debug/b
 oost/1.82.0-r0/boost/core/ignore_unused.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/value.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/detail/impl/pattern.ipp /usr/src/debug/boost/1.82.0-r0/boost/url/detail/pattern.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/impl/delim_rule.ipp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/params_ref.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/params_ref.hpp /usr/src/debug/boost/1.82.0-r0/boost/locale/collator.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/vchars.hpp /usr/src/debug/boost/1.82.0-r0/libs/locale/src/boost/locale/encoding/conv.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/rfc/pchars.hpp /usr/src/debug/boost/1.82.0-r0/boost/locale/time_zone.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/detail/impl/recycled.ipp /usr/src/debug/boost/1.82.0-r0/boost/url/host_type.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/rfc/detail/impl/scheme_rule.ipp /usr/src/debug/boost/1.82.0-r0/boost/url/rfc/gen_delim_chars.hpp /usr/src/debug
 /boost/1.82.0-r0/boost/url/params_encoded_view.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/rfc/sub_delim_chars.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/params_encoded_ref.ipp /usr/src/debug/boost/1.82.0-r0/boost/url/encoding_opts.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/dec_octet_rule.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/impl/serialize.ipp /usr/src/debug/boost/1.82.0-r0/boost/url/url.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/detail/path.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/string_view_base.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/detail/object.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/param.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/detail/impl/pct_format.ipp /usr/src/debug/boost/1.82.0-r0/boost/url/params_view.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/rfc/detail/impl/ipvfuture_rule.ipp /usr/src/debug/boost/1.82.0-r0/boost/url/rfc/query_rule.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/impl/error.hpp /usr/src/deb
 ug/boost/1.82.0-r0/boost/url/impl/ipv6_address.ipp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/url.ipp /usr/src/debug/boost/1.82.0-r0/boost/json/impl/value.ipp /usr/src/debug/boost/1.82.0-r0/boost/regex/v5/pattern_except.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/rfc/reserved_chars.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/detail/optional_string.hpp /usr/src/debug/boost/1.82.0-r0/boost/locale/encoding_errors.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/ci_string.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/detail/impl/format_args.ipp /usr/src/debug/boost/1.82.0-r0/boost/url/rfc/detail/ipvfuture_rule.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/detail/impl/url_impl.ipp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/impl/ci_string.ipp /usr/src/debug/boost/1.82.0-r0/boost/regex/v5/primary_transform.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/ipv4_address.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/ipv6_address.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/rfc/detail/h
 16_rule.hpp /usr/src/debug/boost/1.82.0-r0/boost/locale/encoding.hpp /usr/src/debug/boost/1.82.0-r0/libs/locale/src/boost/locale/util/encoding.cpp /usr/src/debug/boost/1.82.0-r0/boost/core/noncopyable.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/object.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/parser.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/pilfer.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/string.hpp /usr/src/debug/boost/1.82.0-r0/boost/regex/v5/syntax_type.hpp /usr/src/debug/boost/1.82.0-r0/boost/locale/generator.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/detail/sse2.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/impl/literal_rule.ipp /usr/src/debug/boost/1.82.0-r0/boost/core/pointer_traits.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/segments_encoded_ref.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/rfc/absolute_uri_rule.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/rfc/detail/fragment_part_rule.hpp /usr/src/debug/boost/1.82.0-r0/boost/utility/base_from_me
 mber.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/detail/charset.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/decode_view.hpp /usr/src/debug/boost/1.82.0-r0/boost/core/cmath.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/impl/parse.ipp /usr/src/debug/boost/1.82.0-r0/boost/core/serialization.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/parse.ipp /usr/src/debug/boost/1.82.0-r0/boost/iterator/reverse_iterator.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/pct_string_view.ipp /usr/src/debug/boost/1.82.0-r0/boost/locale/info.hpp /usr/src/debug/boost/1.82.0-r0/boost/locale/util.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/all_chars.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/detail/buffer.hpp /usr/src/debug/boost/1.82.0-r0/boost/core/default_allocator.hpp /usr/src/debug/boost/1.82.0-r0/boost/core/null_deleter.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/impl/value_ref.ipp /usr/src/debug/boost/1.82.0-r0/boost/url/detail/impl/format_args.hpp /usr/src/debug/boo
 st/1.82.0-r0/boost/url/rfc/impl/pct_encoded_rule.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/rfc/detail/charsets.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/rfc/ipv4_address_rule.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/static_url.ipp /usr/src/debug/boost/1.82.0-r0/boost/json/kind.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/rfc/impl/uri_rule.ipp /usr/src/debug/boost/1.82.0-r0/boost/url/detail/any_segments_iter.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/unsigned_rule.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/url_view_base.ipp /usr/src/debug/boost/1.82.0-r0/boost/url/scheme.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/rfc/impl/relative_ref_rule.ipp /usr/src/debug/boost/1.82.0-r0/boost/url/detail/parts_base.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/set_pointer_options.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/rfc/detail/impl/host_rule.ipp /usr/src/debug/boost/1.82.0-r0/boost/url/rfc/detail/impl/port_rule.ipp /usr/src/debug/boost/1.82.0-r0/boost/url/
 detail/string_view.hpp /usr/src/debug/boost/1.82.0-r0/boost/mp11/detail/mp_is_list.hpp /usr/src/debug/boost/1.82.0-r0/libs/locale/src/boost/locale/util/codecvt_converter.cpp /usr/src/debug/boost/1.82.0-r0/boost/locale/conversion.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/detail/format_args.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/impl/visit.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/rfc/impl/absolute_uri_rule.ipp /usr/src/debug/boost/1.82.0-r0/boost/core/enable_if.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/impl/unsigned_rule.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/params_base.hpp /usr/src/debug/boost/1.82.0-r0/boost/locale/gnu_gettext.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/detail/impl/segments_iter_impl.ipp /usr/src/debug/boost/1.82.0-r0/boost/iterator/iterator_adaptor.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/detail/print.hpp /usr/src/debug/boost/1.82.0-r0/libs/locale/src/boost/locale/util/locale_data.cpp /usr/src/debug/boost/1.82.0-r0/boost/json/de
 tail/stack.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/url_base.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/params_encoded_base.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/params_view.ipp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/segments_base.hpp /usr/src/debug/boost/1.82.0-r0/libs/locale/src/boost/locale/encoding/iconv_codepage.ipp /usr/src/debug/boost/1.82.0-r0/libs/locale/src/boost/locale/encoding/uconv_codepage.ipp /usr/src/debug/boost/1.82.0-r0/boost/json/detail/string_impl.hpp /usr/src/debug/boost/1.82.0-r0/boost/regex/v5/regex_fwd.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/params_base.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/impl/string.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/impl/string.ipp /usr/src/debug/boost/1.82.0-r0/boost/url/url_view.hpp /usr/src/debug/boost/1.82.0-r0/boost/mp11/detail/mp_fold.hpp /usr/src/debug/boost/1.82.0-r0/boost/mp11/detail/mp_list.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/rfc/impl/origin_form_rule.ipp /usr/s
 rc/debug/boost/1.82.0-r0/boost/locale/hold_ptr.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/rfc/detail/impl/relative_part_rule.ipp /usr/src/debug/boost/1.82.0-r0/boost/json/impl/array.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/storage_ptr.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/monotonic_resource.hpp /usr/src/debug/boost/1.82.0-r0/boost/regex/v5/basic_regex.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/alnum_chars.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/alpha_chars.hpp /usr/src/debug/boost/1.82.0-r0/boost/core/bit.hpp /usr/src/debug/boost/1.82.0-r0/boost/core/nvp.hpp /usr/src/debug/boost/1.82.0-r0/boost/core/ref.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/detail/utf8.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/rfc/detail/ip_literal_rule.hpp /usr/src/debug/boost/1.82.0-r0/boost/core/demangle.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/impl/object.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/impl/object.ipp /usr/src/debug/boost/1.82.0-r0/boost/url/rf
 c/uri_reference_rule.hpp /usr/src/debug/boost/1.82.0-r0/boost/regex/v5/regex_traits_defaults.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/detail/impl/any_params_iter.ipp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/charset.hpp /usr/src/debug/boost/1.82.0-r0/libs/locale/src/boost/locale/util/gregorian.cpp /usr/src/debug/boost/1.82.0-r0/boost/core/snprintf.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/detail/digest.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/detail/config.hpp /usr/src/debug/boost/1.82.0-r0/boost/regex/v5/perl_matcher_non_recursive.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/error.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/detail/impl/params_iter_impl.ipp /usr/src/debug/boost/1.82.0-r0/boost/regex/v5/regex_search.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/segments_encoded_view.ipp /usr/src/debug/boost/1.82.0-r0/boost/json/impl/static_resource.ipp /usr/src/debug/boost/1.82.0-r0/boost/url/detail/normalize.hpp /usr/src/debug/boost/1.82.0-r0/boost/iterator/i
 terator_traits.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/error_types.hpp /usr/src/debug/boost/1.82.0-r0/boost/core/max_align.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/detail/move_chars.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/optional_rule.hpp /usr/src/debug/boost/1.82.0-r0/boost/core/empty_value.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/rfc/detail/host_rule.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/rfc/detail/port_rule.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/params_encoded_view.ipp /usr/src/debug/boost/1.82.0-r0/boost/iterator/iterator_facade.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/impl/array.ipp /usr/src/debug/boost/1.82.0-r0/boost/url/rfc/origin_form_rule.hpp /usr/src/debug/boost/1.82.0-r0/boost/regex/v5/basic_regex_creator.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/encode.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/rfc/impl/ipv4_address_rule.ipp /usr/src/debug/boost/1.82.0-r0/boost/url/rfc/impl/ipv6_address_rule.ipp /usr/src/debug/
 boost/1.82.0-r0/boost/locale/date_time_facet.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/detail/segments_iter_impl.hpp /usr/src/debug/boost/1.82.0-r0/boost/locale/format.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/string_token.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/detail/impl/replacement_field_rule.ipp /usr/src/debug/boost/1.82.0-r0/boost/regex/v5/error_type.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/params_ref.ipp /usr/src/debug/boost/1.82.0-r0/boost/url/detail/url_impl.hpp /usr/src/debug/boost/1.82.0-r0/boost/core/swap.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/rfc/impl/uri_reference_rule.ipp /usr/src/debug/boost/1.82.0-r0/boost/url/detail/over_allocator.hpp /usr/src/debug/boost/1.82.0-r0/boost/regex/v5/mem_block_cache.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/impl/monotonic_resource.ipp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/impl/variant_rule.hpp /usr/src/debug/boost/1.82.0-r0/boost/regex/v5/perl_matcher_common.hpp /usr/src/debug/boost/1.82
 .0-r0/boost/url/grammar/impl/token_rule.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/range_rule.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/impl/pointer.ipp /usr/src/debug/boost/1.82.0-r0/boost/url/rfc/uri_rule.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/rfc/impl/authority_rule.ipp /usr/src/debug/boost/1.82.0-r0/boost/regex/v5/regex.hpp /usr/src/debug/boost/1.82.0-r0/boost/regex/v5/regex_raw_buffer.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/params_encoded_ref.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/segments_encoded_base.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/segments_encoded_view.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/detail/handler.hpp /usr/src/debug/boost/1.82.0-r0/boost/regex/v5/match_flags.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/basic_parser_impl.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/pct_string_view.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/impl/serializer.ipp /usr/src/debug/boost/1.82.0-r0/boost/regex/v5/match_results.hpp /us
 r/src/debug/boost/1.82.0-r0/boost/json/detail/config.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/detail/stream.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/detail/impl/except.ipp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/impl/string_view_base.ipp /usr/src/debug/boost/1.82.0-r0/boost/locale/utf8_codecvt.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/detail/array.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/rfc/unreserved_chars.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/decode_view.hpp /usr/src/debug/boost/1.82.0-r0/boost/regex/v5/regex_workaround.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/rfc/detail/impl/hier_part_rule.ipp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/segments_ref.ipp /usr/src/debug/boost/1.82.0-r0/boost/url/segments_encoded_ref.hpp /usr/src/debug/boost/1.82.0-r0/boost/mp11/detail/mp_append.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/impl/kind.ipp /usr/src/debug/boost/1.82.0-r0/boost/core/detail/string_view.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/
 impl/null_resource.ipp /usr/src/debug/boost/1.82.0-r0/boost/mp11/detail/mp_front.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/detail/any_params_iter.hpp /usr/src/debug/boost/1.82.0-r0/boost/utility/in_place_factory.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/rfc/detail/impl/userinfo_rule.ipp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/parse_query.ipp /usr/src/debug/boost/1.82.0-r0/boost/json/impl/parser.ipp /usr/src/debug/boost/1.82.0-r0/boost/json/value_ref.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/string_view.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/rfc/detail/impl/h16_rule.ipp /usr/src/debug/boost/1.82.0-r0/boost/json/stream_parser.hpp /usr/src/debug/boost/1.82.0-r0/libs/locale/src/boost/locale/util/default_locale.cpp /usr/src/debug/boost/1.82.0-r0/boost/regex/v5/sub_match.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/decode_view.ipp /usr/src/debug/boost/1.82.0-r0/boost/regex/v5/regex_traits.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/segments_view.ipp", adde
 d "/usr/src/debug/boost/1.83.0-r0/boost/iterator/iterator_concepts.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/rfc/unreserved_chars.hpp /usr/src/debug/boost/1.83.0-r0/libs/locale/src/boost/locale/util/gregorian.cpp /usr/src/debug/boost/1.83.0-r0/boost/json/set_pointer_options.hpp /usr/src/debug/boost/1.83.0-r0/boost/core/snprintf.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/rfc/query_rule.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/rfc/sub_delim_chars.hpp /usr/src/debug/boost/1.83.0-r0/boost/core/allocator_access.hpp /usr/src/debug/boost/1.83.0-r0/boost/regex/v5/regex.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/static_url.hpp /usr/src/debug/boost/1.83.0-r0/boost/json/impl/string.hpp /usr/src/debug/boost/1.83.0-r0/boost/json/impl/string.ipp /usr/src/debug/boost/1.83.0-r0/boost/json/detail/charconv/detail/from_chars_float_impl.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/grammar/impl/range_rule.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/grammar/string_view_base.hpp /usr/src/debug
 /boost/1.83.0-r0/boost/regex/v5/regex_workaround.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/grammar/impl/tuple_rule.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/grammar/digit_chars.hpp /usr/src/debug/boost/1.83.0-r0/libs/url/src/detail/url_impl.cpp /usr/src/debug/boost/1.83.0-r0/boost/locale/utf.hpp /usr/src/debug/boost/1.83.0-r0/libs/locale/src/boost/locale/encoding/iconv_converter.hpp /usr/src/debug/boost/1.83.0-r0/libs/locale/src/boost/locale/encoding/uconv_converter.hpp /usr/src/debug/boost/1.83.0-r0/libs/url/src/encoding_opts.cpp /usr/src/debug/boost/1.83.0-r0/boost/json/detail/sbo_buffer.hpp /usr/src/debug/boost/1.83.0-r0/boost/json/detail/charconv/detail/fast_float/parse_number.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/grammar/dec_octet_rule.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/grammar/detail/charset.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/grammar/lut_chars.hpp /usr/src/debug/boost/1.83.0-r0/boost/locale/conversion.hpp /usr/src/debug/boost/1.83.0-r0/boost/ur
 l/grammar/impl/error.hpp /usr/src/debug/boost/1.83.0-r0/boost/locale/encoding_errors.hpp /usr/src/debug/boost/1.83.0-r0/boost/core/detail/sp_thread_pause.hpp /usr/src/debug/boost/1.83.0-r0/boost/json/detail/charconv/chars_format.hpp /usr/src/debug/boost/1.83.0-r0/libs/url/src/detail/format_args.cpp /usr/src/debug/boost/1.83.0-r0/boost/iterator/iterator_adaptor.hpp /usr/src/debug/boost/1.83.0-r0/boost/regex/v5/regex_raw_buffer.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/rfc/detail/scheme_rule.hpp /usr/src/debug/boost/1.83.0-r0/boost/core/checked_delete.hpp /usr/src/debug/boost/1.83.0-r0/boost/iterator/distance.hpp /usr/src/debug/boost/1.83.0-r0/boost/locale/utf8_codecvt.hpp /usr/src/debug/boost/1.83.0-r0/libs/url/src/segments_view.cpp /usr/src/debug/boost/1.83.0-r0/boost/json/detail/charconv/detail/integer_search_trees.hpp /usr/src/debug/boost/1.83.0-r0/libs/locale/src/boost/locale/encoding/codepage.cpp /usr/src/debug/boost/1.83.0-r0/boost/url/params_encoded_view.hpp /usr/src/debug/
 boost/1.83.0-r0/boost/json/impl/visit.hpp /usr/src/debug/boost/1.83.0-r0/boost/core/detail/string_view.hpp /usr/src/debug/boost/1.83.0-r0/boost/regex/v5/error_type.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/detail/url_impl.hpp /usr/src/debug/boost/1.83.0-r0/libs/url/src/rfc/detail/ipvfuture_rule.cpp /usr/src/debug/boost/1.83.0-r0/boost/json/impl/serialize.ipp /usr/src/debug/boost/1.83.0-r0/boost/core/cmath.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/rfc/detail/path_rules.hpp /usr/src/debug/boost/1.83.0-r0/libs/locale/src/boost/locale/util/info.cpp /usr/src/debug/boost/1.83.0-r0/boost/json/system_error.hpp /usr/src/debug/boost/1.83.0-r0/boost/json/detail/stack.hpp /usr/src/debug/boost/1.83.0-r0/boost/json/memory_resource.hpp /usr/src/debug/boost/1.83.0-r0/boost/json/static_resource.hpp /usr/src/debug/boost/1.83.0-r0/boost/json/impl/object.hpp /usr/src/debug/boost/1.83.0-r0/boost/json/impl/object.ipp /usr/src/debug/boost/1.83.0-r0/libs/url/src/detail/except.cpp /usr/src/debug/boost
 /1.83.0-r0/boost/url/impl/params_encoded_base.hpp /usr/src/debug/boost/1.83.0-r0/boost/json/impl/value_stack.ipp /usr/src/debug/boost/1.83.0-r0/boost/url/params_encoded_ref.hpp /usr/src/debug/boost/1.83.0-r0/libs/url/src/grammar/error.cpp /usr/src/debug/boost/1.83.0-r0/boost/url/rfc/absolute_uri_rule.hpp /usr/src/debug/boost/1.83.0-r0/boost/json/detail/handler.hpp /usr/src/debug/boost/1.83.0-r0/boost/json/detail/sse2.hpp /usr/src/debug/boost/1.83.0-r0/boost/mp11/detail/mp_with_index.hpp /usr/src/debug/boost/1.83.0-r0/boost/json/detail/charconv/detail/fast_float/fast_table.hpp /usr/src/debug/boost/1.83.0-r0/boost/regex/v5/regex_search.hpp /usr/src/debug/boost/1.83.0-r0/boost/regex/v5/basic_regex_parser.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/params_view.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/parse_query.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/grammar/detail/tuple.hpp /usr/src/debug/boost/1.83.0-r0/boost/locale/collator.hpp /usr/src/debug/boost/1.83.0-r0/libs/url/src/s
 cheme.cpp /usr/src/debug/boost/1.83.0-r0/libs/url/src/detail/normalize.cpp /usr/src/debug/boost/1.83.0-r0/boost/url/rfc/authority_rule.hpp /usr/src/debug/boost/1.83.0-r0/libs/locale/src/boost/locale/util/default_locale.cpp /usr/src/debug/boost/1.83.0-r0/libs/url/src/detail/any_params_iter.cpp /usr/src/debug/boost/1.83.0-r0/boost/json/detail/default_resource.hpp /usr/src/debug/boost/1.83.0-r0/libs/url/src/rfc/detail/ipv6_addrz_rule.cpp /usr/src/debug/boost/1.83.0-r0/libs/url/src/detail/decode.cpp /usr/src/debug/boost/1.83.0-r0/libs/url/src/rfc/origin_form_rule.cpp /usr/src/debug/boost/1.83.0-r0/boost/json/value_stack.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/rfc/detail/hier_part_rule.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/param.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/parse.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/params_base.hpp /usr/src/debug/boost/1.83.0-r0/boost/core/enable_if.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/grammar/range_rule.hpp /usr/src/debug/boos
 t/1.83.0-r0/boost/url/grammar/vchars.hpp /usr/src/debug/boost/1.83.0-r0/boost/json/detail/format.hpp /usr/src/debug/boost/1.83.0-r0/boost/core/pointer_traits.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/rfc/detail/ipv6_addrz_rule.hpp /usr/src/debug/boost/1.83.0-r0/boost/regex/v5/object_cache.hpp /usr/src/debug/boost/1.83.0-r0/boost/regex/v5/cpp_regex_traits.hpp /usr/src/debug/boost/1.83.0-r0/libs/locale/src/boost/locale/util/locale_data.cpp /usr/src/debug/boost/1.83.0-r0/boost/url/detail/replacement_field_rule.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/rfc/relative_ref_rule.hpp /usr/src/debug/boost/1.83.0-r0/boost/core/addressof.hpp /usr/src/debug/boost/1.83.0-r0/boost/regex/v5/states.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/ipv4_address.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/ipv6_address.hpp /usr/src/debug/boost/1.83.0-r0/libs/url/src/rfc/detail/userinfo_rule.cpp /usr/src/debug/boost/1.83.0-r0/boost/url/impl/segments_encoded_base.hpp /usr/src/debug/boost/1.83.0-r0/boost
 /core/default_allocator.hpp /usr/src/debug/boost/1.83.0-r0/boost/json/detail/charconv/detail/fast_float/decimal_to_binary.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/error_types.hpp /usr/src/debug/boost/1.83.0-r0/boost/regex/v5/basic_regex.hpp /usr/src/debug/boost/1.83.0-r0/libs/locale/src/boost/locale/util/timezone.hpp /usr/src/debug/boost/1.83.0-r0/libs/url/src/rfc/relative_ref_rule.cpp /usr/src/debug/boost/1.83.0-r0/boost/url/rfc/detail/fragment_part_rule.hpp /usr/src/debug/boost/1.83.0-r0/libs/url/src/grammar/literal_rule.cpp /usr/src/debug/boost/1.83.0-r0/libs/url/src/parse.cpp /usr/src/debug/boost/1.83.0-r0/boost/mp11/detail/mp_front.hpp /usr/src/debug/boost/1.83.0-r0/libs/url/src/grammar/string_view_base.cpp /usr/src/debug/boost/1.83.0-r0/libs/url/src/segments_base.cpp /usr/src/debug/boost/1.83.0-r0/boost/url/segments_base.hpp /usr/src/debug/boost/1.83.0-r0/boost/json/detail/charconv/detail/fast_float/bigint.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/segments_view.hpp /usr
 /src/debug/boost/1.83.0-r0/boost/url/scheme.hpp /usr/src/debug/boost/1.83.0-r0/boost/json/detail/charconv/detail/fast_float/ascii_number.hpp /usr/src/debug/boost/1.83.0-r0/libs/url/src/detail/pct_format.cpp /usr/src/debug/boost/1.83.0-r0/boost/json/impl/array.hpp /usr/src/debug/boost/1.83.0-r0/boost/locale/gnu_gettext.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/detail/normalize.hpp /usr/src/debug/boost/1.83.0-r0/boost/json/impl/value.ipp /usr/src/debug/boost/1.83.0-r0/boost/utility/string_view_fwd.hpp /usr/src/debug/boost/1.83.0-r0/libs/url/src/detail/any_segments_iter.cpp /usr/src/debug/boost/1.83.0-r0/boost/url/detail/any_segments_iter.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/detail/impl/format_args.hpp /usr/src/debug/boost/1.83.0-r0/boost/core/serialization.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/detail/optional_string.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/impl/params_base.hpp /usr/src/debug/boost/1.83.0-r0/boost/regex/v5/char_regex_traits.hpp /usr/src/debug/boos
 t/1.83.0-r0/boost/url/host_type.hpp /usr/src/debug/boost/1.83.0-r0/boost/regex/v5/regex_traits_defaults.hpp /usr/src/debug/boost/1.83.0-r0/libs/url/src/rfc/authority_rule.cpp /usr/src/debug/boost/1.83.0-r0/boost/json/detail/shared_resource.hpp /usr/src/debug/boost/1.83.0-r0/boost/json/impl/null_resource.ipp /usr/src/debug/boost/1.83.0-r0/boost/url/pct_string_view.hpp /usr/src/debug/boost/1.83.0-r0/libs/locale/src/boost/locale/util/iconv.hpp /usr/src/debug/boost/1.83.0-r0/boost/json/detail/config.hpp /usr/src/debug/boost/1.83.0-r0/boost/json/detail/stream.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/grammar/impl/unsigned_rule.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/impl/params_encoded_ref.hpp /usr/src/debug/boost/1.83.0-r0/boost/locale/detail/is_supported_char.hpp /usr/src/debug/boost/1.83.0-r0/boost/mp11/detail/mp_list.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/grammar/detail/recycled.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/grammar/impl/optional_rule.hpp /usr/src/debug/b
 oost/1.83.0-r0/boost/url/detail/except.hpp /usr/src/debug/boost/1.83.0-r0/boost/locale/localization_backend.hpp /usr/src/debug/boost/1.83.0-r0/boost/core/use_default.hpp /usr/src/debug/boost/1.83.0-r0/boost/mp11/detail/mp_value.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/params_encoded_base.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/grammar/error.hpp /usr/src/debug/boost/1.83.0-r0/boost/json/object.hpp /usr/src/debug/boost/1.83.0-r0/boost/json/impl/kind.ipp /usr/src/debug/boost/1.83.0-r0/boost/json/parser.hpp /usr/src/debug/boost/1.83.0-r0/boost/json/pilfer.hpp /usr/src/debug/boost/1.83.0-r0/boost/json/string.hpp /usr/src/debug/boost/1.83.0-r0/boost/regex/v5/sub_match.hpp /usr/src/debug/boost/1.83.0-r0/libs/url/src/grammar/dec_octet_rule.cpp /usr/src/debug/boost/1.83.0-r0/boost/json/detail/array.hpp /usr/src/debug/boost/1.83.0-r0/boost/iterator/iterator_categories.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/authority_view.hpp /usr/src/debug/boost/1.83.0-r0/boost/json/detail/char
 conv/detail/parser.hpp /usr/src/debug/boost/1.83.0-r0/boost/locale/format.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/rfc/detail/reg_name_rule.hpp /usr/src/debug/boost/1.83.0-r0/boost/regex/v5/cregex.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/encoding_opts.hpp /usr/src/debug/boost/1.83.0-r0/boost/locale/detail/facet_id.hpp /usr/src/debug/boost/1.83.0-r0/boost/json/impl/error.ipp /usr/src/debug/boost/1.83.0-r0/boost/url/impl/segments_ref.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/rfc/detail/query_part_rule.hpp /usr/src/debug/boost/1.83.0-r0/boost/iterator/iterator_facade.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/parse_path.hpp /usr/src/debug/boost/1.83.0-r0/boost/json/detail/utf8.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/ignore_case.hpp /usr/src/debug/boost/1.83.0-r0/boost/regex/v5/syntax_type.hpp /usr/src/debug/boost/1.83.0-r0/libs/url/src/rfc/detail/ip_literal_rule.cpp /usr/src/debug/boost/1.83.0-r0/boost/core/typeinfo.hpp /usr/src/debug/boost/1.83.0-r0/libs/url/src/rfc/
 detail/hier_part_rule.cpp /usr/src/debug/boost/1.83.0-r0/boost/url/detail/parts_base.hpp /usr/src/debug/boost/1.83.0-r0/libs/url/src/rfc/uri_reference_rule.cpp /usr/src/debug/boost/1.83.0-r0/boost/mp11/detail/mp_defer.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/detail/format_args.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/rfc/uri_rule.hpp /usr/src/debug/boost/1.83.0-r0/boost/core/swap.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/rfc/detail/host_rule.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/rfc/detail/port_rule.hpp /usr/src/debug/boost/1.83.0-r0/boost/locale/formatting.hpp /usr/src/debug/boost/1.83.0-r0/boost/regex/v5/regex_fwd.hpp /usr/src/debug/boost/1.83.0-r0/libs/url/src/detail/replacement_field_rule.cpp /usr/src/debug/boost/1.83.0-r0/libs/url/src/rfc/query_rule.cpp /usr/src/debug/boost/1.83.0-r0/boost/url/detail/pct_format.hpp /usr/src/debug/boost/1.83.0-r0/libs/url/src/url_base.cpp /usr/src/debug/boost/1.83.0-r0/boost/json/detail/charconv/detail/significand_tables.hpp /u
 sr/src/debug/boost/1.83.0-r0/boost/url/detail/pattern.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/grammar/delim_rule.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/grammar/token_rule.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/grammar/tuple_rule.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/url_base.hpp /usr/src/debug/boost/1.83.0-r0/boost/json/stream_parser.hpp /usr/src/debug/boost/1.83.0-r0/boost/locale/hold_ptr.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/rfc/detail/ip_literal_rule.hpp /usr/src/debug/boost/1.83.0-r0/boost/json/detail/charconv/detail/compute_float64.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/rfc/detail/ipvfuture_rule.hpp /usr/src/debug/boost/1.83.0-r0/libs/url/src/parse_path.cpp /usr/src/debug/boost/1.83.0-r0/boost/url/segments_encoded_ref.hpp /usr/src/debug/boost/1.83.0-r0/libs/url/src/url_view.cpp /usr/src/debug/boost/1.83.0-r0/boost/regex/v5/regbase.hpp /usr/src/debug/boost/1.83.0-r0/boost/locale/detail/encoding.hpp /usr/src/debug/boost/1.83.0-r0/boost/json/de
 tail/charconv/detail/emulated128.hpp /usr/src/debug/boost/1.83.0-r0/boost/iterator/transform_iterator.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/detail/over_allocator.hpp /usr/src/debug/boost/1.83.0-r0/boost/json/impl/serializer.ipp /usr/src/debug/boost/1.83.0-r0/boost/locale/encoding.hpp /usr/src/debug/boost/1.83.0-r0/boost/regex/v5/basic_regex_creator.hpp /usr/src/debug/boost/1.83.0-r0/libs/url/src/segments_ref.cpp /usr/src/debug/boost/1.83.0-r0/boost/json/impl/pointer.ipp /usr/src/debug/boost/1.83.0-r0/boost/url/rfc/ipv6_address_rule.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/impl/decode_view.hpp /usr/src/debug/boost/1.83.0-r0/boost/locale/message.hpp /usr/src/debug/boost/1.83.0-r0/boost/regex/v5/regex_match.hpp /usr/src/debug/boost/1.83.0-r0/boost/json/error.hpp /usr/src/debug/boost/1.83.0-r0/boost/json/array.hpp /usr/src/debug/boost/1.83.0-r0/boost/json/value.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/grammar/string_token.hpp /usr/src/debug/boost/1.83.0-r0/libs/url/src/rf
 c/detail/port_rule.cpp /usr/src/debug/boost/1.83.0-r0/boost/json/detail/charconv/detail/fast_float/float_common.hpp /usr/src/debug/boost/1.83.0-r0/boost/regex/v5/mem_block_cache.hpp /usr/src/debug/boost/1.83.0-r0/libs/url/src/params_encoded_base.cpp /usr/src/debug/boost/1.83.0-r0/libs/url/src/params_encoded_view.cpp /usr/src/debug/boost/1.83.0-r0/libs/locale/src/boost/locale/util/codecvt_converter.cpp /usr/src/debug/boost/1.83.0-r0/boost/url/grammar/literal_rule.hpp /usr/src/debug/boost/1.83.0-r0/boost/json/basic_parser_impl.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/rfc/pchars.hpp /usr/src/debug/boost/1.83.0-r0/boost/json/detail/charconv/impl/from_chars.ipp /usr/src/debug/boost/1.83.0-r0/libs/url/src/detail/segments_iter_impl.cpp /usr/src/debug/boost/1.83.0-r0/boost/url/error.hpp /usr/src/debug/boost/1.83.0-r0/boost/regex/v5/perl_matcher_common.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/detail/decode.hpp /usr/src/debug/boost/1.83.0-r0/boost/json/string_view.hpp /usr/src/debug/b
 oost/1.83.0-r0/boost/json/detail/charconv/detail/from_chars_integer_impl.hpp /usr/src/debug/boost/1.83.0-r0/libs/locale/src/boost/locale/util/encoding.cpp /usr/src/debug/boost/1.83.0-r0/boost/json/impl/stream_parser.ipp /usr/src/debug/boost/1.83.0-r0/libs/url/src/rfc/absolute_uri_rule.cpp /usr/src/debug/boost/1.83.0-r0/boost/url/detail/encode.hpp /usr/src/debug/boost/1.83.0-r0/boost/core/exchange.hpp /usr/src/debug/boost/1.83.0-r0/libs/url/src/params_ref.cpp /usr/src/debug/boost/1.83.0-r0/libs/locale/src/boost/locale/util/numeric.hpp /usr/src/debug/boost/1.83.0-r0/boost/core/noncopyable.hpp /usr/src/debug/boost/1.83.0-r0/boost/utility/in_place_factory.hpp /usr/src/debug/boost/1.83.0-r0/boost/utility/string_view.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/rfc/detail/h16_rule.hpp /usr/src/debug/boost/1.83.0-r0/boost/mp11/detail/mp_is_list.hpp /usr/src/debug/boost/1.83.0-r0/libs/locale/src/boost/locale/util/gregorian.hpp /usr/src/debug/boost/1.83.0-r0/libs/url/src/parse_query.cpp /usr
 /src/debug/boost/1.83.0-r0/libs/url/src/rfc/detail/relative_part_rule.cpp /usr/src/debug/boost/1.83.0-r0/libs/url/src/segments_encoded_ref.cpp /usr/src/debug/boost/1.83.0-r0/boost/url/url.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/segments_ref.hpp /usr/src/debug/boost/1.83.0-r0/boost/json/serialize_options.hpp /usr/src/debug/boost/1.83.0-r0/libs/url/src/rfc/ipv4_address_rule.cpp /usr/src/debug/boost/1.83.0-r0/boost/json/detail/charconv/detail/fast_float/digit_comparison.hpp /usr/src/debug/boost/1.83.0-r0/boost/iterator/advance.hpp /usr/src/debug/boost/1.83.0-r0/libs/url/src/rfc/ipv6_address_rule.cpp /usr/src/debug/boost/1.83.0-r0/boost/url/grammar/alnum_chars.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/grammar/alpha_chars.hpp /usr/src/debug/boost/1.83.0-r0/libs/url/src/rfc/uri_rule.cpp /usr/src/debug/boost/1.83.0-r0/boost/url/url_view.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/impl/segments_encoded_ref.hpp /usr/src/debug/boost/1.83.0-r0/boost/core/demangle.hpp /usr/src/debug/bo
 ost/1.83.0-r0/boost/url/grammar/unsigned_rule.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/decode_view.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/grammar/all_chars.hpp /usr/src/debug/boost/1.83.0-r0/libs/url/src/rfc/detail/scheme_rule.cpp /usr/src/debug/boost/1.83.0-r0/boost/url/impl/error.hpp /usr/src/debug/boost/1.83.0-r0/boost/json/detail/string_impl.hpp /usr/src/debug/boost/1.83.0-r0/libs/url/src/params_base.cpp /usr/src/debug/boost/1.83.0-r0/libs/url/src/params_view.cpp /usr/src/debug/boost/1.83.0-r0/boost/regex/v5/c_regex_traits.hpp /usr/src/debug/boost/1.83.0-r0/boost/core/scoped_enum.hpp /usr/src/debug/boost/1.83.0-r0/boost/core/ignore_unused.hpp /usr/src/debug/boost/1.83.0-r0/libs/url/src/rfc/detail/h16_rule.cpp /usr/src/debug/boost/1.83.0-r0/libs/url/src/rfc/detail/host_rule.cpp /usr/src/debug/boost/1.83.0-r0/libs/locale/src/boost/locale/util/make_std_unique.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/grammar/ci_string.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/detail
 /any_params_iter.hpp /usr/src/debug/boost/1.83.0-r0/boost/locale/time_zone.hpp /usr/src/debug/boost/1.83.0-r0/boost/regex/v5/primary_transform.hpp /usr/src/debug/boost/1.83.0-r0/boost/locale/encoding_utf.hpp /usr/src/debug/boost/1.83.0-r0/libs/url/src/detail/pattern.cpp /usr/src/debug/boost/1.83.0-r0/boost/url/url_view_base.hpp /usr/src/debug/boost/1.83.0-r0/boost/utility/base_from_member.hpp /usr/src/debug/boost/1.83.0-r0/boost/json/detail/buffer.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/rfc/ipv4_address_rule.hpp /usr/src/debug/boost/1.83.0-r0/boost/regex/v5/match_flags.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/detail/string_view.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/grammar/impl/variant_rule.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/grammar/parse.hpp /usr/src/debug/boost/1.83.0-r0/libs/url/src/error.cpp /usr/src/debug/boost/1.83.0-r0/boost/iterator/interoperable.hpp /usr/src/debug/boost/1.83.0-r0/boost/json/detail/value.hpp /usr/src/debug/boost/1.83.0-r0/boost/json
 /impl/array.ipp /usr/src/debug/boost/1.83.0-r0/boost/url/detail/move_chars.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/grammar/type_traits.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/grammar/impl/token_rule.hpp /usr/src/debug/boost/1.83.0-r0/libs/url/src/ipv4_address.cpp /usr/src/debug/boost/1.83.0-r0/libs/url/src/decode_view.cpp /usr/src/debug/boost/1.83.0-r0/libs/url/src/ipv6_address.cpp /usr/src/debug/boost/1.83.0-r0/boost/iterator/reverse_iterator.hpp /usr/src/debug/boost/1.83.0-r0/boost/json/impl/value_ref.ipp /usr/src/debug/boost/1.83.0-r0/boost/locale/generic_codecvt.hpp /usr/src/debug/boost/1.83.0-r0/libs/url/src/params_encoded_ref.cpp /usr/src/debug/boost/1.83.0-r0/boost/iterator/is_iterator.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/impl/segments_base.hpp /usr/src/debug/boost/1.83.0-r0/boost/json/value_ref.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/rfc/impl/pct_encoded_rule.hpp /usr/src/debug/boost/1.83.0-r0/libs/url/src/url.cpp /usr/src/debug/boost/1.83.0-r0/libs/ur
 l/src/pct_string_view.cpp /usr/src/debug/boost/1.83.0-r0/boost/core/uncaught_exceptions.hpp /usr/src/debug/boost/1.83.0-r0/boost/core/detail/is_same.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/grammar/variant_rule.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/impl/encode.hpp /usr/src/debug/boost/1.83.0-r0/boost/mp11/detail/mp_append.hpp /usr/src/debug/boost/1.83.0-r0/boost/regex/v5/regex_traits.hpp /usr/src/debug/boost/1.83.0-r0/boost/core/max_align.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/detail/segments_iter_impl.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/detail/config.hpp /usr/src/debug/boost/1.83.0-r0/boost/json/detail/object.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/grammar/charset.hpp /usr/src/debug/boost/1.83.0-r0/libs/url/src/static_url.cpp /usr/src/debug/boost/1.83.0-r0/libs/url/src/authority_view.cpp /usr/src/debug/boost/1.83.0-r0/boost/core/empty_value.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/impl/params_ref.hpp /usr/src/debug/boost/1.83.0-r0/boost/json/impl/
 monotonic_resource.ipp /usr/src/debug/boost/1.83.0-r0/boost/regex/v5/perl_matcher_non_recursive.hpp /usr/src/debug/boost/1.83.0-r0/boost/locale/generator.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/grammar/impl/parse.hpp /usr/src/debug/boost/1.83.0-r0/libs/url/src/url_view_base.cpp /usr/src/debug/boost/1.83.0-r0/boost/url/detail/params_iter_impl.hpp /usr/src/debug/boost/1.83.0-r0/boost/core/null_deleter.hpp /usr/src/debug/boost/1.83.0-r0/boost/core/bit.hpp /usr/src/debug/boost/1.83.0-r0/boost/core/nvp.hpp /usr/src/debug/boost/1.83.0-r0/boost/core/ref.hpp /usr/src/debug/boost/1.83.0-r0/boost/regex/v5/match_results.hpp /usr/src/debug/boost/1.83.0-r0/boost/regex/v5/pattern_except.hpp /usr/src/debug/boost/1.83.0-r0/boost/json/parse_options.hpp /usr/src/debug/boost/1.83.0-r0/libs/url/src/segments_encoded_view.cpp /usr/src/debug/boost/1.83.0-r0/boost/json/monotonic_resource.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/segments_encoded_base.hpp /usr/src/debug/boost/1.83.0-r0/boost/json/im
 pl/static_resource.ipp /usr/src/debug/boost/1.83.0-r0/boost/url/segments_encoded_view.hpp /usr/src/debug/boost/1.83.0-r0/libs/url/src/grammar/detail/recycled.cpp /usr/src/debug/boost/1.83.0-r0/boost/json/impl/error.hpp /usr/src/debug/boost/1.83.0-r0/boost/json/kind.hpp /usr/src/debug/boost/1.83.0-r0/libs/url/src/detail/params_iter_impl.cpp /usr/src/debug/boost/1.83.0-r0/boost/url/params_ref.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/rfc/detail/relative_part_rule.hpp /usr/src/debug/boost/1.83.0-r0/boost/json/basic_parser.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/rfc/detail/userinfo_rule.hpp /usr/src/debug/boost/1.83.0-r0/boost/json/impl/parser.ipp /usr/src/debug/boost/1.83.0-r0/boost/locale/info.hpp /usr/src/debug/boost/1.83.0-r0/boost/locale/util.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/rfc/pct_encoded_rule.hpp /usr/src/debug/boost/1.83.0-r0/boost/utility/value_init.hpp /usr/src/debug/boost/1.83.0-r0/boost/json/impl/parse.ipp /usr/src/debug/boost/1.83.0-r0/boost/json/storag
 e_ptr.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/grammar/optional_rule.hpp /usr/src/debug/boost/1.83.0-r0/libs/url/src/segments_encoded_base.cpp /usr/src/debug/boost/1.83.0-r0/boost/iterator/iterator_traits.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/rfc/origin_form_rule.hpp /usr/src/debug/boost/1.83.0-r0/boost/any/detail/placeholder.hpp /usr/src/debug/boost/1.83.0-r0/boost/json/detail/charconv/from_chars.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/rfc/detail/charsets.hpp /usr/src/debug/boost/1.83.0-r0/libs/url/src/grammar/ci_string.cpp /usr/src/debug/boost/1.83.0-r0/boost/url/grammar/hexdig_chars.hpp /usr/src/debug/boost/1.83.0-r0/libs/locale/src/boost/locale/util/encoding.hpp /usr/src/debug/boost/1.83.0-r0/boost/regex/v5/perl_matcher.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/detail/path.hpp /usr/src/debug/boost/1.83.0-r0/boost/locale/date_time.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/detail/print.hpp /usr/src/debug/boost/1.83.0-r0/boost/locale/date_time_facet.hpp /usr/s
 rc/debug/boost/1.83.0-r0/boost/url/rfc/uri_reference_rule.hpp /usr/src/debug/boost/1.83.0-r0/boost/json/detail/charconv/detail/from_chars_result.hpp /usr/src/debug/boost/1.83.0-r0/libs/url/src/grammar/delim_rule.cpp /usr/src/debug/boost/1.83.0-r0/boost/json/detail/digest.hpp /usr/src/debug/boost/1.83.0-r0/boost/json/serializer.hpp /usr/src/debug/boost/1.83.0-r0/boost/url/grammar/detail/ci_string.hpp"
packages/core2-32-poky-linux/boost/boost-staticdev: PV changed from "1.82.0" to "1.83.0"
packages/core2-32-poky-linux/boost/boost-staticdev: PKGV changed from 1.82.0 [default] to 1.83.0 [default]
packages/core2-32-poky-linux/boost/boost-staticdev: PKGSIZE changed from 124651215 to 131644537 (+6%)
packages/core2-32-poky-linux/boost/boost-system: PV changed from "1.82.0" to "1.83.0"
packages/core2-32-poky-linux/boost/boost-system: PKGV changed from 1.82.0 [default] to 1.83.0 [default]
packages/core2-32-poky-linux/boost/boost-system: PKG changed from libboost-system1.82.0 to libboost-system1.83.0
packages/core2-32-poky-linux/boost/boost-system: FILELIST: removed "/usr/lib/libboost_system.so.1.82.0", added "/usr/lib/libboost_system.so.1.83.0"
packages/core2-32-poky-linux/boost/boost-test: PV changed from "1.82.0" to "1.83.0"
packages/core2-32-poky-linux/boost/boost-test: PKGV changed from 1.82.0 [default] to 1.83.0 [default]
packages/core2-32-poky-linux/boost/boost-test: FILELIST: removed "/usr/lib/libboost_unit_test_framework.so.1.82.0 /usr/lib/libboost_prg_exec_monitor.so.1.82.0", added "/usr/lib/libboost_unit_test_framework.so.1.83.0 /usr/lib/libboost_prg_exec_monitor.so.1.83.0"
packages/core2-32-poky-linux/boost/boost-thread: PV changed from "1.82.0" to "1.83.0"
packages/core2-32-poky-linux/boost/boost-thread: PKGV changed from 1.82.0 [default] to 1.83.0 [default]
packages/core2-32-poky-linux/boost/boost-thread: PKG changed from libboost-thread1.82.0 to libboost-thread1.83.0
packages/core2-32-poky-linux/boost/boost-thread: FILELIST: removed "/usr/lib/libboost_thread.so.1.82.0", added "/usr/lib/libboost_thread.so.1.83.0"
packages/core2-32-poky-linux/boost/boost-timer: PV changed from "1.82.0" to "1.83.0"
packages/core2-32-poky-linux/boost/boost-timer: PKGV changed from 1.82.0 [default] to 1.83.0 [default]
packages/core2-32-poky-linux/boost/boost-timer: PKGSIZE changed from 30104 to 21860 (-27%)
packages/core2-32-poky-linux/boost/boost-timer: RDEPENDS: removed all items "boost-chrono (['>= 1.82.0'])"
packages/core2-32-poky-linux/boost/boost-timer: PKG changed from libboost-timer1.82.0 to libboost-timer1.83.0
packages/core2-32-poky-linux/boost/boost-timer: FILELIST: removed "/usr/lib/libboost_timer.so.1.82.0", added "/usr/lib/libboost_timer.so.1.83.0"
packages/core2-32-poky-linux/boost/boost-type-erasure: PV changed from "1.82.0" to "1.83.0"
packages/core2-32-poky-linux/boost/boost-type-erasure: PKGV changed from 1.82.0 [default] to 1.83.0 [default]
packages/core2-32-poky-linux/boost/boost-type-erasure: PKG changed from libboost-type-erasure1.82.0 to libboost-type-erasure1.83.0
packages/core2-32-poky-linux/boost/boost-type-erasure: FILELIST: removed "/usr/lib/libboost_type_erasure.so.1.82.0", added "/usr/lib/libboost_type_erasure.so.1.83.0"
packages/core2-32-poky-linux/boost/boost-url: PV changed from "1.82.0" to "1.83.0"
packages/core2-32-poky-linux/boost/boost-url: PKGV changed from 1.82.0 [default] to 1.83.0 [default]
packages/core2-32-poky-linux/boost/boost-url: PKGSIZE changed from 357968 to 390732 (+9%)
packages/core2-32-poky-linux/boost/boost-url: PKG changed from libboost-url1.82.0 to libboost-url1.83.0
packages/core2-32-poky-linux/boost/boost-url: FILELIST: removed "/usr/lib/libboost_url.so.1.82.0", added "/usr/lib/libboost_url.so.1.83.0"
packages/core2-32-poky-linux/boost/boost-wave: PV changed from "1.82.0" to "1.83.0"
packages/core2-32-poky-linux/boost/boost-wave: PKGV changed from 1.82.0 [default] to 1.83.0 [default]
packages/core2-32-poky-linux/boost/boost-wave: PKG changed from libboost-wave1.82.0 to libboost-wave1.83.0
packages/core2-32-poky-linux/boost/boost-wave: FILELIST: removed "/usr/lib/libboost_wave.so.1.82.0", added "/usr/lib/libboost_wave.so.1.83.0"
packages/core2-32-poky-linux/boost/boost: PV changed from "1.82.0" to "1.83.0"
packages/core2-32-poky-linux/boost/boost: PKGV changed from 1.82.0 [default] to 1.83.0 [default]
packages/core2-32-poky-linux/boost: PV changed from "1.82.0" to "1.83.0"
packages/core2-32-poky-linux/boost: PKGV changed from 1.82.0 [default] to 1.83.0 [default]
packages/core2-32-poky-linux/boost: SRC_URI changed from "https://boostorg.jfrog.io/artifactory/main/release/1.82.0/source/boost_1_82_0.tar.bz2 file://boost-math-disable-pch-for-gcc.patch file://0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch file://0001-dont-setup-compiler-flags-m32-m64.patch" to "https://boostorg.jfrog.io/artifactory/main/release/1.83.0/source/boost_1_83_0.tar.bz2 file://boost-math-disable-pch-for-gcc.patch file://0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch file://0001-dont-setup-compiler-flags-m32-m64.patch"
Changes to packages/core2-32-poky-linux/boost (sysroot):
  /usr/lib/libboost_atomic.so changed symlink target from libboost_atomic.so.1.82.0 to libboost_atomic.so.1.83.0
  /usr/lib/libboost_chrono.so changed symlink target from libboost_chrono.so.1.82.0 to libboost_chrono.so.1.83.0
  /usr/lib/libboost_container.so changed symlink target from libboost_container.so.1.82.0 to libboost_container.so.1.83.0
  /usr/lib/libboost_context.so changed symlink target from libboost_context.so.1.82.0 to libboost_context.so.1.83.0
  /usr/lib/libboost_contract.so changed symlink target from libboost_contract.so.1.82.0 to libboost_contract.so.1.83.0
  /usr/lib/libboost_coroutine.so changed symlink target from libboost_coroutine.so.1.82.0 to libboost_coroutine.so.1.83.0
  /usr/lib/libboost_date_time.so changed symlink target from libboost_date_time.so.1.82.0 to libboost_date_time.so.1.83.0
  /usr/lib/libboost_fiber.so changed symlink target from libboost_fiber.so.1.82.0 to libboost_fiber.so.1.83.0
  /usr/lib/libboost_filesystem.so changed symlink target from libboost_filesystem.so.1.82.0 to libboost_filesystem.so.1.83.0
  /usr/lib/libboost_graph.so changed symlink target from libboost_graph.so.1.82.0 to libboost_graph.so.1.83.0
  /usr/lib/libboost_iostreams.so changed symlink target from libboost_iostreams.so.1.82.0 to libboost_iostreams.so.1.83.0
  /usr/lib/libboost_json.so changed symlink target from libboost_json.so.1.82.0 to libboost_json.so.1.83.0
  /usr/lib/libboost_locale.so changed symlink target from libboost_locale.so.1.82.0 to libboost_locale.so.1.83.0
  /usr/lib/libboost_log_setup.so changed symlink target from libboost_log_setup.so.1.82.0 to libboost_log_setup.so.1.83.0
  /usr/lib/libboost_log.so changed symlink target from libboost_log.so.1.82.0 to libboost_log.so.1.83.0
  /usr/lib/libboost_math_c99f.so changed symlink target from libboost_math_c99f.so.1.82.0 to libboost_math_c99f.so.1.83.0
  /usr/lib/libboost_math_c99l.so changed symlink target from libboost_math_c99l.so.1.82.0 to libboost_math_c99l.so.1.83.0
  /usr/lib/libboost_math_c99.so changed symlink target from libboost_math_c99.so.1.82.0 to libboost_math_c99.so.1.83.0
  /usr/lib/libboost_math_tr1f.so changed symlink target from libboost_math_tr1f.so.1.82.0 to libboost_math_tr1f.so.1.83.0
  /usr/lib/libboost_math_tr1l.so changed symlink target from libboost_math_tr1l.so.1.82.0 to libboost_math_tr1l.so.1.83.0
  /usr/lib/libboost_math_tr1.so changed symlink target from libboost_math_tr1.so.1.82.0 to libboost_math_tr1.so.1.83.0
  /usr/lib/libboost_prg_exec_monitor.so changed symlink target from libboost_prg_exec_monitor.so.1.82.0 to libboost_prg_exec_monitor.so.1.83.0
  /usr/lib/libboost_program_options.so changed symlink target from libboost_program_options.so.1.82.0 to libboost_program_options.so.1.83.0
  /usr/lib/libboost_python311.so changed symlink target from libboost_python311.so.1.82.0 to libboost_python311.so.1.83.0
  /usr/lib/libboost_random.so changed symlink target from libboost_random.so.1.82.0 to libboost_random.so.1.83.0
  /usr/lib/libboost_regex.so changed symlink target from libboost_regex.so.1.82.0 to libboost_regex.so.1.83.0
  /usr/lib/libboost_serialization.so changed symlink target from libboost_serialization.so.1.82.0 to libboost_serialization.so.1.83.0
  /usr/lib/libboost_system.so changed symlink target from libboost_system.so.1.82.0 to libboost_system.so.1.83.0
  /usr/lib/libboost_thread.so changed symlink target from libboost_thread.so.1.82.0 to libboost_thread.so.1.83.0
  /usr/lib/libboost_timer.so changed symlink target from libboost_timer.so.1.82.0 to libboost_timer.so.1.83.0
  /usr/lib/libboost_type_erasure.so changed symlink target from libboost_type_erasure.so.1.82.0 to libboost_type_erasure.so.1.83.0
  /usr/lib/libboost_unit_test_framework.so changed symlink target from libboost_unit_test_framework.so.1.82.0 to libboost_unit_test_framework.so.1.83.0
  /usr/lib/libboost_url.so changed symlink target from libboost_url.so.1.82.0 to libboost_url.so.1.83.0
  /usr/lib/libboost_wave.so changed symlink target from libboost_wave.so.1.82.0 to libboost_wave.so.1.83.0
  /usr/lib/libboost_wserialization.so changed symlink target from libboost_wserialization.so.1.82.0 to libboost_wserialization.so.1.83.0
  /usr/lib/cmake/Boost-1.82.0 moved to /usr/lib/cmake/Boost-1.83.0
  /usr/lib/cmake/boost_atomic-1.82.0 moved to /usr/lib/cmake/boost_atomic-1.83.0
  /usr/lib/cmake/boost_chrono-1.82.0 moved to /usr/lib/cmake/boost_chrono-1.83.0
  /usr/lib/cmake/boost_container-1.82.0 moved to /usr/lib/cmake/boost_container-1.83.0
  /usr/lib/cmake/boost_context-1.82.0 moved to /usr/lib/cmake/boost_context-1.83.0
  /usr/lib/cmake/boost_contract-1.82.0 moved to /usr/lib/cmake/boost_contract-1.83.0
  /usr/lib/cmake/boost_coroutine-1.82.0 moved to /usr/lib/cmake/boost_coroutine-1.83.0
  /usr/lib/cmake/boost_date_time-1.82.0 moved to /usr/lib/cmake/boost_date_time-1.83.0
  /usr/lib/cmake/BoostDetectToolset-1.82.0.cmake moved to /usr/lib/cmake/BoostDetectToolset-1.83.0.cmake
  /usr/lib/cmake/boost_exception-1.82.0 moved to /usr/lib/cmake/boost_exception-1.83.0
  /usr/lib/cmake/boost_fiber-1.82.0 moved to /usr/lib/cmake/boost_fiber-1.83.0
  /usr/lib/cmake/boost_filesystem-1.82.0 moved to /usr/lib/cmake/boost_filesystem-1.83.0
  /usr/lib/cmake/boost_graph-1.82.0 moved to /usr/lib/cmake/boost_graph-1.83.0
  /usr/lib/cmake/boost_headers-1.82.0 moved to /usr/lib/cmake/boost_headers-1.83.0
  /usr/lib/cmake/boost_iostreams-1.82.0 moved to /usr/lib/cmake/boost_iostreams-1.83.0
  /usr/lib/cmake/boost_json-1.82.0 moved to /usr/lib/cmake/boost_json-1.83.0
  /usr/lib/cmake/boost_locale-1.82.0 moved to /usr/lib/cmake/boost_locale-1.83.0
  /usr/lib/cmake/boost_log-1.82.0 moved to /usr/lib/cmake/boost_log-1.83.0
  /usr/lib/cmake/boost_log_setup-1.82.0 moved to /usr/lib/cmake/boost_log_setup-1.83.0
  /usr/lib/cmake/boost_math_c99-1.82.0 moved to /usr/lib/cmake/boost_math_c99-1.83.0
  /usr/lib/cmake/boost_math_c99f-1.82.0 moved to /usr/lib/cmake/boost_math_c99f-1.83.0
  /usr/lib/cmake/boost_math_c99l-1.82.0 moved to /usr/lib/cmake/boost_math_c99l-1.83.0
  /usr/lib/cmake/boost_math_tr1-1.82.0 moved to /usr/lib/cmake/boost_math_tr1-1.83.0
  /usr/lib/cmake/boost_math_tr1f-1.82.0 moved to /usr/lib/cmake/boost_math_tr1f-1.83.0
  /usr/lib/cmake/boost_math_tr1l-1.82.0 moved to /usr/lib/cmake/boost_math_tr1l-1.83.0
  /usr/lib/cmake/boost_prg_exec_monitor-1.82.0 moved to /usr/lib/cmake/boost_prg_exec_monitor-1.83.0
  /usr/lib/cmake/boost_program_options-1.82.0 moved to /usr/lib/cmake/boost_program_options-1.83.0
  /usr/lib/cmake/boost_python-1.82.0 moved to /usr/lib/cmake/boost_python-1.83.0
  /usr/lib/cmake/boost_random-1.82.0 moved to /usr/lib/cmake/boost_random-1.83.0
  /usr/lib/cmake/boost_regex-1.82.0 moved to /usr/lib/cmake/boost_regex-1.83.0
  /usr/lib/cmake/boost_serialization-1.82.0 moved to /usr/lib/cmake/boost_serialization-1.83.0
  /usr/lib/cmake/boost_system-1.82.0 moved to /usr/lib/cmake/boost_system-1.83.0
  /usr/lib/cmake/boost_test_exec_monitor-1.82.0 moved to /usr/lib/cmake/boost_test_exec_monitor-1.83.0
  /usr/lib/cmake/boost_thread-1.82.0 moved to /usr/lib/cmake/boost_thread-1.83.0
  /usr/lib/cmake/boost_timer-1.82.0 moved to /usr/lib/cmake/boost_timer-1.83.0
  /usr/lib/cmake/boost_type_erasure-1.82.0 moved to /usr/lib/cmake/boost_type_erasure-1.83.0
  /usr/lib/cmake/boost_unit_test_framework-1.82.0 moved to /usr/lib/cmake/boost_unit_test_framework-1.83.0
  /usr/lib/cmake/boost_url-1.82.0 moved to /usr/lib/cmake/boost_url-1.83.0
  /usr/lib/cmake/boost_wave-1.82.0 moved to /usr/lib/cmake/boost_wave-1.83.0
  /usr/lib/cmake/boost_wserialization-1.82.0 moved to /usr/lib/cmake/boost_wserialization-1.83.0
  /usr/lib/libboost_atomic.so.1.82.0 moved to /usr/lib/libboost_atomic.so.1.83.0
  /usr/lib/libboost_chrono.so.1.82.0 moved to /usr/lib/libboost_chrono.so.1.83.0
  /usr/lib/libboost_container.so.1.82.0 moved to /usr/lib/libboost_container.so.1.83.0
  /usr/lib/libboost_context.so.1.82.0 moved to /usr/lib/libboost_context.so.1.83.0
  /usr/lib/libboost_contract.so.1.82.0 moved to /usr/lib/libboost_contract.so.1.83.0
  /usr/lib/libboost_coroutine.so.1.82.0 moved to /usr/lib/libboost_coroutine.so.1.83.0
  /usr/lib/libboost_date_time.so.1.82.0 moved to /usr/lib/libboost_date_time.so.1.83.0
  /usr/lib/libboost_fiber.so.1.82.0 moved to /usr/lib/libboost_fiber.so.1.83.0
  /usr/lib/libboost_filesystem.so.1.82.0 moved to /usr/lib/libboost_filesystem.so.1.83.0
  /usr/lib/libboost_graph.so.1.82.0 moved to /usr/lib/libboost_graph.so.1.83.0
  /usr/lib/libboost_iostreams.so.1.82.0 moved to /usr/lib/libboost_iostreams.so.1.83.0
  /usr/lib/libboost_json.so.1.82.0 moved to /usr/lib/libboost_json.so.1.83.0
  /usr/lib/libboost_locale.so.1.82.0 moved to /usr/lib/libboost_locale.so.1.83.0
  /usr/lib/libboost_log_setup.so.1.82.0 moved to /usr/lib/libboost_log_setup.so.1.83.0
  /usr/lib/libboost_log.so.1.82.0 moved to /usr/lib/libboost_log.so.1.83.0
  /usr/lib/libboost_math_c99f.so.1.82.0 moved to /usr/lib/libboost_math_c99f.so.1.83.0
  /usr/lib/libboost_math_c99l.so.1.82.0 moved to /usr/lib/libboost_math_c99l.so.1.83.0
  /usr/lib/libboost_math_c99.so.1.82.0 moved to /usr/lib/libboost_math_c99.so.1.83.0
  /usr/lib/libboost_math_tr1f.so.1.82.0 moved to /usr/lib/libboost_math_tr1f.so.1.83.0
  /usr/lib/libboost_math_tr1l.so.1.82.0 moved to /usr/lib/libboost_math_tr1l.so.1.83.0
  /usr/lib/libboost_math_tr1.so.1.82.0 moved to /usr/lib/libboost_math_tr1.so.1.83.0
  /usr/lib/libboost_prg_exec_monitor.so.1.82.0 moved to /usr/lib/libboost_prg_exec_monitor.so.1.83.0
  /usr/lib/libboost_program_options.so.1.82.0 moved to /usr/lib/libboost_program_options.so.1.83.0
  /usr/lib/libboost_python311.so.1.82.0 moved to /usr/lib/libboost_python311.so.1.83.0
  /usr/lib/libboost_random.so.1.82.0 moved to /usr/lib/libboost_random.so.1.83.0
  /usr/lib/libboost_regex.so.1.82.0 moved to /usr/lib/libboost_regex.so.1.83.0
  /usr/lib/libboost_serialization.so.1.82.0 moved to /usr/lib/libboost_serialization.so.1.83.0
  /usr/lib/libboost_system.so.1.82.0 moved to /usr/lib/libboost_system.so.1.83.0
  /usr/lib/libboost_thread.so.1.82.0 moved to /usr/lib/libboost_thread.so.1.83.0
  /usr/lib/libboost_timer.so.1.82.0 moved to /usr/lib/libboost_timer.so.1.83.0
  /usr/lib/libboost_type_erasure.so.1.82.0 moved to /usr/lib/libboost_type_erasure.so.1.83.0
  /usr/lib/libboost_unit_test_framework.so.1.82.0 moved to /usr/lib/libboost_unit_test_framework.so.1.83.0
  /usr/lib/libboost_url.so.1.82.0 moved to /usr/lib/libboost_url.so.1.83.0
  /usr/lib/libboost_wave.so.1.82.0 moved to /usr/lib/libboost_wave.so.1.83.0
  /usr/lib/libboost_wserialization.so.1.82.0 moved to /usr/lib/libboost_wserialization.so.1.83.0
  /usr/include/boost/any/detail was added
  /usr/include/boost/any/detail/placeholder.hpp was added
  /usr/include/boost/atomic/detail/type_traits/remove_cv.hpp was added
  /usr/include/boost/compat was added
  /usr/include/boost/compat/detail was added
  /usr/include/boost/compat/detail/throw_system_error.hpp was added
  /usr/include/boost/compat/latch.hpp was added
  /usr/include/boost/compat/shared_lock.hpp was added
  /usr/include/boost/core/detail/sp_thread_pause.hpp was added
  /usr/include/boost/core/detail/sp_thread_sleep.hpp was added
  /usr/include/boost/core/detail/sp_thread_yield.hpp was added
  /usr/include/boost/core/detail/sp_win32_sleep.hpp was added
  /usr/include/boost/core/yield_primitives.hpp was added
  /usr/include/boost/filesystem/cstdio.hpp was added
  /usr/include/boost/geometry/util/constexpr.hpp was added
  /usr/include/boost/iterator/is_iterator.hpp was added
  /usr/include/boost/json/detail/charconv was added
  /usr/include/boost/json/detail/charconv/chars_format.hpp was added
  /usr/include/boost/json/detail/charconv/detail was added
  /usr/include/boost/json/detail/charconv/detail/compute_float64.hpp was added
  /usr/include/boost/json/detail/charconv/detail/config.hpp was added
  /usr/include/boost/json/detail/charconv/detail/emulated128.hpp was added
  /usr/include/boost/json/detail/charconv/detail/fast_float was added
  /usr/include/boost/json/detail/charconv/detail/fast_float/ascii_number.hpp was added
  /usr/include/boost/json/detail/charconv/detail/fast_float/bigint.hpp was added
  /usr/include/boost/json/detail/charconv/detail/fast_float/constexpr_feature_detect.hpp was added
  /usr/include/boost/json/detail/charconv/detail/fast_float/decimal_to_binary.hpp was added
  /usr/include/boost/json/detail/charconv/detail/fast_float/digit_comparison.hpp was added
  /usr/include/boost/json/detail/charconv/detail/fast_float/fast_float.hpp was added
  /usr/include/boost/json/detail/charconv/detail/fast_float/fast_table.hpp was added
  /usr/include/boost/json/detail/charconv/detail/fast_float/float_common.hpp was added
  /usr/include/boost/json/detail/charconv/detail/fast_float/parse_number.hpp was added
  /usr/include/boost/json/detail/charconv/detail/from_chars_float_impl.hpp was added
  /usr/include/boost/json/detail/charconv/detail/from_chars_integer_impl.hpp was added
  /usr/include/boost/json/detail/charconv/detail/from_chars_result.hpp was added
  /usr/include/boost/json/detail/charconv/detail/integer_search_trees.hpp was added
  /usr/include/boost/json/detail/charconv/detail/parser.hpp was added
  /usr/include/boost/json/detail/charconv/detail/significand_tables.hpp was added
  /usr/include/boost/json/detail/charconv/from_chars.hpp was added
  /usr/include/boost/json/detail/charconv/impl was added
  /usr/include/boost/json/detail/charconv/impl/from_chars.ipp was added
  /usr/include/boost/json/detail/charconv/limits.hpp was added
  /usr/include/boost/json/detail/sbo_buffer.hpp was added
  /usr/include/boost/json/serialize_options.hpp was added
  /usr/include/boost/locale/detail was added
  /usr/include/boost/locale/detail/encoding.hpp was added
  /usr/include/boost/locale/detail/facet_id.hpp was added
  /usr/include/boost/locale/detail/is_supported_char.hpp was added
  /usr/include/boost/math/special_functions/fourier_transform_daubechies.hpp was added
  /usr/include/boost/mp11/detail/mp_defer.hpp was added
  /usr/include/boost/mp11/detail/mp_is_value_list.hpp was added
  /usr/include/boost/mp11/detail/mp_list_v.hpp was added
  /usr/include/boost/mp11/detail/mp_value.hpp was added
  /usr/include/boost/mysql/detail/access.hpp was added
  /usr/include/boost/mysql/detail/any_execution_request.hpp was added
  /usr/include/boost/mysql/detail/any_stream.hpp was added
  /usr/include/boost/mysql/detail/any_stream_impl.hpp was added
  /usr/include/boost/mysql/detail/channel_ptr.hpp was added
  /usr/include/boost/mysql/detail/coldef_view.hpp was added
  /usr/include/boost/mysql/detail/datetime.hpp was added
  /usr/include/boost/mysql/detail/execution_concepts.hpp was added
  /usr/include/boost/mysql/detail/execution_processor was added
  /usr/include/boost/mysql/detail/execution_processor/execution_processor.hpp was added
  /usr/include/boost/mysql/detail/execution_processor/execution_state_impl.hpp was added
  /usr/include/boost/mysql/detail/execution_processor/results_impl.hpp was added
  /usr/include/boost/mysql/detail/execution_processor/static_execution_state_impl.hpp was added
  /usr/include/boost/mysql/detail/execution_processor/static_results_impl.hpp was added
  /usr/include/boost/mysql/detail/field_impl.hpp was added
  /usr/include/boost/mysql/detail/flags.hpp was added
  /usr/include/boost/mysql/detail/network_algorithms.hpp was added
  /usr/include/boost/mysql/detail/ok_view.hpp was added
  /usr/include/boost/mysql/detail/rebind_executor.hpp was added
  /usr/include/boost/mysql/detail/resultset_encoding.hpp was added
  /usr/include/boost/mysql/detail/results_iterator.hpp was added
  /usr/include/boost/mysql/detail/row_impl.hpp was added
  /usr/include/boost/mysql/detail/rows_iterator.hpp was added
  /usr/include/boost/mysql/detail/socket_stream.hpp was added
  /usr/include/boost/mysql/detail/string_view_offset.hpp was added
  /usr/include/boost/mysql/detail/throw_on_error_loc.hpp was added
  /usr/include/boost/mysql/detail/typing was added
  /usr/include/boost/mysql/detail/typing/get_type_index.hpp was added
  /usr/include/boost/mysql/detail/typing/meta_check_context.hpp was added
  /usr/include/boost/mysql/detail/typing/pos_map.hpp was added
  /usr/include/boost/mysql/detail/typing/readable_field_traits.hpp was added
  /usr/include/boost/mysql/detail/typing/row_traits.hpp was added
  /usr/include/boost/mysql/detail/void_t.hpp was added
  /usr/include/boost/mysql/detail/writable_field_traits.hpp was added
  /usr/include/boost/mysql/impl/any_stream_impl.ipp was added
  /usr/include/boost/mysql/impl/channel_ptr.ipp was added
  /usr/include/boost/mysql/impl/column_type.ipp was added
  /usr/include/boost/mysql/impl/date.ipp was added
  /usr/include/boost/mysql/impl/datetime.ipp was added
  /usr/include/boost/mysql/impl/error_categories.ipp was added
  /usr/include/boost/mysql/impl/execution_state_impl.ipp was added
  /usr/include/boost/mysql/impl/field.ipp was added
  /usr/include/boost/mysql/impl/field_view.ipp was added
  /usr/include/boost/mysql/impl/internal was added
  /usr/include/boost/mysql/impl/internal/auth was added
  /usr/include/boost/mysql/impl/internal/auth/auth.hpp was added
  /usr/include/boost/mysql/impl/internal/auth/auth.ipp was added
  /usr/include/boost/mysql/impl/internal/channel was added
  /usr/include/boost/mysql/impl/internal/channel/channel.hpp was added
  /usr/include/boost/mysql/impl/internal/channel/message_parser.hpp was added
  /usr/include/boost/mysql/impl/internal/channel/message_parser.ipp was added
  /usr/include/boost/mysql/impl/internal/channel/message_reader.hpp was added
  /usr/include/boost/mysql/impl/internal/channel/message_writer.hpp was added
  /usr/include/boost/mysql/impl/internal/channel/read_buffer.hpp was added
  /usr/include/boost/mysql/impl/internal/channel/valgrind.hpp was added
  /usr/include/boost/mysql/impl/internal/channel/write_message.hpp was added
  /usr/include/boost/mysql/impl/internal/error was added
  /usr/include/boost/mysql/impl/internal/error/server_error_to_string.hpp was added
  /usr/include/boost/mysql/impl/internal/error/server_error_to_string.ipp was added
  /usr/include/boost/mysql/impl/internal/make_string_view.hpp was added
  /usr/include/boost/mysql/impl/internal/network_algorithms was added
  /usr/include/boost/mysql/impl/internal/network_algorithms/close_connection.hpp was added
  /usr/include/boost/mysql/impl/internal/network_algorithms/close_statement.hpp was added
  /usr/include/boost/mysql/impl/internal/network_algorithms/connect.hpp was added
  /usr/include/boost/mysql/impl/internal/network_algorithms/execute.hpp was added
  /usr/include/boost/mysql/impl/internal/network_algorithms/handshake.hpp was added
  /usr/include/boost/mysql/impl/internal/network_algorithms/ping.hpp was added
  /usr/include/boost/mysql/impl/internal/network_algorithms/prepare_statement.hpp was added
  /usr/include/boost/mysql/impl/internal/network_algorithms/quit_connection.hpp was added
  /usr/include/boost/mysql/impl/internal/network_algorithms/read_resultset_head.hpp was added
  /usr/include/boost/mysql/impl/internal/network_algorithms/read_some_rows_dynamic.hpp was added
  /usr/include/boost/mysql/impl/internal/network_algorithms/read_some_rows.hpp was added
  /usr/include/boost/mysql/impl/internal/network_algorithms/start_execution.hpp was added
  /usr/include/boost/mysql/impl/internal/protocol was added
  /usr/include/boost/mysql/impl/internal/protocol/basic_types.hpp was added
  /usr/include/boost/mysql/impl/internal/protocol/binary_serialization.hpp was added
  /usr/include/boost/mysql/impl/internal/protocol/binary_serialization.ipp was added
  /usr/include/boost/mysql/impl/internal/protocol/bit_deserialization.hpp was added
  /usr/include/boost/mysql/impl/internal/protocol/capabilities.hpp was added
  /usr/include/boost/mysql/impl/internal/protocol/constants.hpp was added
  /usr/include/boost/mysql/impl/internal/protocol/db_flavor.hpp was added
  /usr/include/boost/mysql/impl/internal/protocol/deserialize_binary_field.hpp was added
  /usr/include/boost/mysql/impl/internal/protocol/deserialize_binary_field.ipp was added
  /usr/include/boost/mysql/impl/internal/protocol/deserialize_text_field.hpp was added
  /usr/include/boost/mysql/impl/internal/protocol/deserialize_text_field.ipp was added
  /usr/include/boost/mysql/impl/internal/protocol/null_bitmap_traits.hpp was added
  /usr/include/boost/mysql/impl/internal/protocol/protocol_field_type.hpp was added
  /usr/include/boost/mysql/impl/internal/protocol/protocol_field_type.ipp was added
  /usr/include/boost/mysql/impl/internal/protocol/protocol.hpp was added
  /usr/include/boost/mysql/impl/internal/protocol/protocol.ipp was added
  /usr/include/boost/mysql/impl/internal/protocol/serialization.hpp was added
  /usr/include/boost/mysql/impl/internal/protocol/static_buffer.hpp was added
  /usr/include/boost/mysql/impl/meta_check_context.ipp was added
  /usr/include/boost/mysql/impl/network_algorithms.ipp was added
  /usr/include/boost/mysql/impl/resultset.ipp was added
  /usr/include/boost/mysql/impl/results_impl.ipp was added
  /usr/include/boost/mysql/impl/row_impl.ipp was added
  /usr/include/boost/mysql/impl/static_execution_state_impl.ipp was added
  /usr/include/boost/mysql/impl/static_results_impl.ipp was added
  /usr/include/boost/mysql/resultset.hpp was added
  /usr/include/boost/mysql/resultset_view.hpp was added
  /usr/include/boost/mysql/src.hpp was added
  /usr/include/boost/mysql/static_execution_state.hpp was added
  /usr/include/boost/mysql/static_results.hpp was added
  /usr/include/boost/outcome/experimental/status-code/status-code/nested_status_code.hpp was added
  /usr/include/boost/unordered/concurrent_flat_map_fwd.hpp was added
  /usr/include/boost/unordered/concurrent_flat_map.hpp was added
  /usr/include/boost/unordered/detail/foa/concurrent_table.hpp was added
  /usr/include/boost/unordered/detail/foa/core.hpp was added
  /usr/include/boost/unordered/detail/foa/flat_map_types.hpp was added
  /usr/include/boost/unordered/detail/foa/flat_set_types.hpp was added
  /usr/include/boost/unordered/detail/foa/ignore_wshadow.hpp was added
  /usr/include/boost/unordered/detail/foa/node_map_types.hpp was added
  /usr/include/boost/unordered/detail/foa/node_set_types.hpp was added
  /usr/include/boost/unordered/detail/foa/restore_wshadow.hpp was added
  /usr/include/boost/unordered/detail/foa/rw_spinlock.hpp was added
  /usr/include/boost/unordered/detail/foa/table.hpp was added
  /usr/include/boost/unordered/detail/foa/tuple_rotate_right.hpp was added
  /usr/include/boost/url/rfc/detail/ipv6_addrz_rule.hpp was added
  /usr/include/boost/mysql/detail/auth was removed
  /usr/include/boost/mysql/detail/auth/auth_calculator.hpp was removed
  /usr/include/boost/mysql/detail/auth/caching_sha2_password.hpp was removed
  /usr/include/boost/mysql/detail/auth/impl was removed
  /usr/include/boost/mysql/detail/auth/impl/auth_calculator.ipp was removed
  /usr/include/boost/mysql/detail/auth/impl/caching_sha2_password.ipp was removed
  /usr/include/boost/mysql/detail/auth/impl/mysql_native_password.ipp was removed
  /usr/include/boost/mysql/detail/auth/mysql_native_password.hpp was removed
  /usr/include/boost/mysql/detail/auxiliar was removed
  /usr/include/boost/mysql/detail/auxiliar/access_fwd.hpp was removed
  /usr/include/boost/mysql/detail/auxiliar/bytestring.hpp was removed
  /usr/include/boost/mysql/detail/auxiliar/datetime.hpp was removed
  /usr/include/boost/mysql/detail/auxiliar/error_helpers.hpp was removed
  /usr/include/boost/mysql/detail/auxiliar/field_impl.hpp was removed
  /usr/include/boost/mysql/detail/auxiliar/field_type_traits.hpp was removed
  /usr/include/boost/mysql/detail/auxiliar/impl was removed
  /usr/include/boost/mysql/detail/auxiliar/impl/datetime.hpp was removed
  /usr/include/boost/mysql/detail/auxiliar/impl/row_base.ipp was removed
  /usr/include/boost/mysql/detail/auxiliar/make_string_view.hpp was removed
  /usr/include/boost/mysql/detail/auxiliar/rebind_executor.hpp was removed
  /usr/include/boost/mysql/detail/auxiliar/row_base.hpp was removed
  /usr/include/boost/mysql/detail/auxiliar/rows_iterator.hpp was removed
  /usr/include/boost/mysql/detail/auxiliar/server_errc_strings.hpp was removed
  /usr/include/boost/mysql/detail/auxiliar/static_string.hpp was removed
  /usr/include/boost/mysql/detail/auxiliar/stringize.hpp was removed
  /usr/include/boost/mysql/detail/auxiliar/string_view_offset.hpp was removed
  /usr/include/boost/mysql/detail/auxiliar/valgrind.hpp was removed
  /usr/include/boost/mysql/detail/auxiliar/void_t.hpp was removed
  /usr/include/boost/mysql/detail/channel was removed
  /usr/include/boost/mysql/detail/channel/channel.hpp was removed
  /usr/include/boost/mysql/detail/channel/disableable_ssl_stream.hpp was removed
  /usr/include/boost/mysql/detail/channel/impl was removed
  /usr/include/boost/mysql/detail/channel/impl/disableable_ssl_stream.hpp was removed
  /usr/include/boost/mysql/detail/channel/impl/message_parser.ipp was removed
  /usr/include/boost/mysql/detail/channel/impl/message_reader.hpp was removed
  /usr/include/boost/mysql/detail/channel/impl/message_writer.hpp was removed
  /usr/include/boost/mysql/detail/channel/impl/read_buffer.ipp was removed
  /usr/include/boost/mysql/detail/channel/message_parser.hpp was removed
  /usr/include/boost/mysql/detail/channel/message_reader.hpp was removed
  /usr/include/boost/mysql/detail/channel/message_writer.hpp was removed
  /usr/include/boost/mysql/detail/channel/message_writer_processor.hpp was removed
  /usr/include/boost/mysql/detail/channel/read_buffer.hpp was removed
  /usr/include/boost/mysql/detail/network_algorithms was removed
  /usr/include/boost/mysql/detail/network_algorithms/close_connection.hpp was removed
  /usr/include/boost/mysql/detail/network_algorithms/close_statement.hpp was removed
  /usr/include/boost/mysql/detail/network_algorithms/connect.hpp was removed
  /usr/include/boost/mysql/detail/network_algorithms/execute_statement.hpp was removed
  /usr/include/boost/mysql/detail/network_algorithms/handshake.hpp was removed
  /usr/include/boost/mysql/detail/network_algorithms/impl was removed
  /usr/include/boost/mysql/detail/network_algorithms/impl/close_connection.hpp was removed
  /usr/include/boost/mysql/detail/network_algorithms/impl/close_statement.hpp was removed
  /usr/include/boost/mysql/detail/network_algorithms/impl/connect.hpp was removed
  /usr/include/boost/mysql/detail/network_algorithms/impl/execute_statement.hpp was removed
  /usr/include/boost/mysql/detail/network_algorithms/impl/handshake.hpp was removed
  /usr/include/boost/mysql/detail/network_algorithms/impl/ping.hpp was removed
  /usr/include/boost/mysql/detail/network_algorithms/impl/prepare_statement.hpp was removed
  /usr/include/boost/mysql/detail/network_algorithms/impl/query.hpp was removed
  /usr/include/boost/mysql/detail/network_algorithms/impl/quit_connection.hpp was removed
  /usr/include/boost/mysql/detail/network_algorithms/impl/read_all_rows.hpp was removed
  /usr/include/boost/mysql/detail/network_algorithms/impl/read_some_rows.hpp was removed
  /usr/include/boost/mysql/detail/network_algorithms/impl/start_execution_generic.hpp was removed
  /usr/include/boost/mysql/detail/network_algorithms/impl/start_query.hpp was removed
  /usr/include/boost/mysql/detail/network_algorithms/impl/start_statement_execution.hpp was removed
  /usr/include/boost/mysql/detail/network_algorithms/ping.hpp was removed
  /usr/include/boost/mysql/detail/network_algorithms/prepare_statement.hpp was removed
  /usr/include/boost/mysql/detail/network_algorithms/query.hpp was removed
  /usr/include/boost/mysql/detail/network_algorithms/quit_connection.hpp was removed
  /usr/include/boost/mysql/detail/network_algorithms/read_all_rows.hpp was removed
  /usr/include/boost/mysql/detail/network_algorithms/read_some_rows.hpp was removed
  /usr/include/boost/mysql/detail/network_algorithms/start_execution_generic.hpp was removed
  /usr/include/boost/mysql/detail/network_algorithms/start_query.hpp was removed
  /usr/include/boost/mysql/detail/network_algorithms/start_statement_execution.hpp was removed
  /usr/include/boost/mysql/detail/protocol was removed
  /usr/include/boost/mysql/detail/protocol/binary_serialization.hpp was removed
  /usr/include/boost/mysql/detail/protocol/bit_deserialization.hpp was removed
  /usr/include/boost/mysql/detail/protocol/capabilities.hpp was removed
  /usr/include/boost/mysql/detail/protocol/common_messages.hpp was removed
  /usr/include/boost/mysql/detail/protocol/constants.hpp was removed
  /usr/include/boost/mysql/detail/protocol/db_flavor.hpp was removed
  /usr/include/boost/mysql/detail/protocol/deserialization_context.hpp was removed
  /usr/include/boost/mysql/detail/protocol/deserialize_binary_field.hpp was removed
  /usr/include/boost/mysql/detail/protocol/deserialize_errc.hpp was removed
  /usr/include/boost/mysql/detail/protocol/deserialize_row.hpp was removed
  /usr/include/boost/mysql/detail/protocol/deserialize_text_field.hpp was removed
  /usr/include/boost/mysql/detail/protocol/handshake_messages.hpp was removed
  /usr/include/boost/mysql/detail/protocol/impl was removed
  /usr/include/boost/mysql/detail/protocol/impl/binary_serialization.ipp was removed
  /usr/include/boost/mysql/detail/protocol/impl/common_messages.ipp was removed
  /usr/include/boost/mysql/detail/protocol/impl/deserialize_binary_field.ipp was removed
  /usr/include/boost/mysql/detail/protocol/impl/deserialize_row.ipp was removed
  /usr/include/boost/mysql/detail/protocol/impl/deserialize_text_field.ipp was removed
  /usr/include/boost/mysql/detail/protocol/impl/handshake_messages.ipp was removed
  /usr/include/boost/mysql/detail/protocol/impl/prepared_statement_messages.hpp was removed
  /usr/include/boost/mysql/detail/protocol/impl/process_error_packet.ipp was removed
  /usr/include/boost/mysql/detail/protocol/impl/serialization.hpp was removed
  /usr/include/boost/mysql/detail/protocol/impl/serialization.ipp was removed
  /usr/include/boost/mysql/detail/protocol/null_bitmap_traits.hpp was removed
  /usr/include/boost/mysql/detail/protocol/prepared_statement_messages.hpp was removed
  /usr/include/boost/mysql/detail/protocol/process_error_packet.hpp was removed
  /usr/include/boost/mysql/detail/protocol/protocol_types.hpp was removed
  /usr/include/boost/mysql/detail/protocol/query_messages.hpp was removed
  /usr/include/boost/mysql/detail/protocol/resultset_encoding.hpp was removed
  /usr/include/boost/mysql/detail/protocol/serialization_context.hpp was removed
  /usr/include/boost/mysql/detail/protocol/serialization.hpp was removed
  /usr/include/boost/mysql/impl/connection.hpp was removed
  /usr/include/boost/mysql/impl/date.hpp was removed
  /usr/include/boost/mysql/impl/datetime.hpp was removed
  /usr/include/boost/mysql/impl/diagnostics.hpp was removed
  /usr/include/boost/mysql/impl/error_categories.hpp was removed
  /usr/include/boost/mysql/impl/execution_state.hpp was removed
  /usr/include/boost/mysql/impl/field.hpp was removed
  /usr/include/boost/mysql/impl/metadata.hpp was removed
  /usr/include/boost/mysql/impl/results.hpp was removed
  /usr/include/boost/mysql/impl/rows.hpp was removed
  /usr/include/boost/mysql/impl/rows_view.hpp was removed
  /usr/include/boost/mysql/impl/row_view.hpp was removed
  /usr/include/boost/outcome/experimental/status-code/status-code/status_code_ptr.hpp was removed
  /usr/include/boost/smart_ptr/detail/sp_win32_sleep.hpp was removed
  /usr/include/boost/unordered/detail/foa.hpp was removed
  /usr/include/boost/url/detail/impl/any_params_iter.ipp was removed
  /usr/include/boost/url/detail/impl/any_segments_iter.ipp was removed
  /usr/include/boost/url/detail/impl/decode.ipp was removed
  /usr/include/boost/url/detail/impl/except.ipp was removed
  /usr/include/boost/url/detail/impl/format_args.ipp was removed
  /usr/include/boost/url/detail/impl/normalize.ipp was removed
  /usr/include/boost/url/detail/impl/params_iter_impl.ipp was removed
  /usr/include/boost/url/detail/impl/path.ipp was removed
  /usr/include/boost/url/detail/impl/pattern.ipp was removed
  /usr/include/boost/url/detail/impl/pct_format.ipp was removed
  /usr/include/boost/url/detail/impl/replacement_field_rule.ipp was removed
  /usr/include/boost/url/detail/impl/segments_iter_impl.ipp was removed
  /usr/include/boost/url/detail/impl/url_impl.ipp was removed
  /usr/include/boost/url/grammar/detail/impl was removed
  /usr/include/boost/url/grammar/detail/impl/ci_string.ipp was removed
  /usr/include/boost/url/grammar/detail/impl/recycled.ipp was removed
  /usr/include/boost/url/grammar/impl/ci_string.ipp was removed
  /usr/include/boost/url/grammar/impl/dec_octet_rule.ipp was removed
  /usr/include/boost/url/grammar/impl/delim_rule.ipp was removed
  /usr/include/boost/url/grammar/impl/error.ipp was removed
  /usr/include/boost/url/grammar/impl/literal_rule.ipp was removed
  /usr/include/boost/url/grammar/impl/string_view_base.ipp was removed
  /usr/include/boost/url/impl/authority_view.ipp was removed
  /usr/include/boost/url/impl/decode_view.ipp was removed
  /usr/include/boost/url/impl/error.ipp was removed
  /usr/include/boost/url/impl/ipv4_address.ipp was removed
  /usr/include/boost/url/impl/ipv6_address.ipp was removed
  /usr/include/boost/url/impl/params_base.ipp was removed
  /usr/include/boost/url/impl/params_encoded_base.ipp was removed
  /usr/include/boost/url/impl/params_encoded_ref.ipp was removed
  /usr/include/boost/url/impl/params_encoded_view.ipp was removed
  /usr/include/boost/url/impl/params_ref.ipp was removed
  /usr/include/boost/url/impl/params_view.ipp was removed
  /usr/include/boost/url/impl/parse.ipp was removed
  /usr/include/boost/url/impl/parse_path.ipp was removed
  /usr/include/boost/url/impl/parse_query.ipp was removed
  /usr/include/boost/url/impl/pct_string_view.ipp was removed
  /usr/include/boost/url/impl/scheme.ipp was removed
  /usr/include/boost/url/impl/segments_base.ipp was removed
  /usr/include/boost/url/impl/segments_encoded_base.ipp was removed
  /usr/include/boost/url/impl/segments_encoded_ref.ipp was removed
  /usr/include/boost/url/impl/segments_encoded_view.ipp was removed
  /usr/include/boost/url/impl/segments_ref.ipp was removed
  /usr/include/boost/url/impl/segments_view.ipp was removed
  /usr/include/boost/url/impl/static_url.ipp was removed
  /usr/include/boost/url/impl/url_base.ipp was removed
  /usr/include/boost/url/impl/url.ipp was removed
  /usr/include/boost/url/impl/url_view_base.ipp was removed
  /usr/include/boost/url/impl/url_view.ipp was removed
  /usr/include/boost/url/rfc/detail/impl was removed
  /usr/include/boost/url/rfc/detail/impl/h16_rule.ipp was removed
  /usr/include/boost/url/rfc/detail/impl/hier_part_rule.ipp was removed
  /usr/include/boost/url/rfc/detail/impl/host_rule.ipp was removed
  /usr/include/boost/url/rfc/detail/impl/ip_literal_rule.ipp was removed
  /usr/include/boost/url/rfc/detail/impl/ipvfuture_rule.ipp was removed
  /usr/include/boost/url/rfc/detail/impl/port_rule.ipp was removed
  /usr/include/boost/url/rfc/detail/impl/relative_part_rule.ipp was removed
  /usr/include/boost/url/rfc/detail/impl/scheme_rule.ipp was removed
  /usr/include/boost/url/rfc/detail/impl/userinfo_rule.ipp was removed
  /usr/include/boost/url/rfc/impl/absolute_uri_rule.ipp was removed
  /usr/include/boost/url/rfc/impl/authority_rule.ipp was removed
  /usr/include/boost/url/rfc/impl/ipv4_address_rule.ipp was removed
  /usr/include/boost/url/rfc/impl/ipv6_address_rule.ipp was removed
  /usr/include/boost/url/rfc/impl/origin_form_rule.ipp was removed
  /usr/include/boost/url/rfc/impl/query_rule.ipp was removed
  /usr/include/boost/url/rfc/impl/relative_ref_rule.ipp was removed
  /usr/include/boost/url/rfc/impl/uri_reference_rule.ipp was removed
  /usr/include/boost/url/rfc/impl/uri_rule.ipp was removed

--===============2272796562390975066==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/boost/boost-atomic: PKG changed from libboost-atomic1.82.0 to libboost-atomic1.83.0
packages/core2-32-poky-linux/boost/boost-atomic: FILELIST: removed "/usr/lib/libboost_atomic.so.1.82.0", added "/usr/lib/libboost_atomic.so.1.83.0"
packages/core2-32-poky-linux/boost/boost-chrono: PKG changed from libboost-chrono1.82.0 to libboost-chrono1.83.0
packages/core2-32-poky-linux/boost/boost-chrono: FILELIST: removed "/usr/lib/libboost_chrono.so.1.82.0", added "/usr/lib/libboost_chrono.so.1.83.0"
packages/core2-32-poky-linux/boost/boost-container: PKG changed from libboost-container1.82.0 to libboost-container1.83.0
packages/core2-32-poky-linux/boost/boost-container: FILELIST: removed "/usr/lib/libboost_container.so.1.82.0", added "/usr/lib/libboost_container.so.1.83.0"
packages/core2-32-poky-linux/boost/boost-context: PKG changed from libboost-context1.82.0 to libboost-context1.83.0
packages/core2-32-poky-linux/boost/boost-context: FILELIST: removed "/usr/lib/libboost_context.so.1.82.0", added "/usr/lib/libboost_context.so.1.83.0"
packages/core2-32-poky-linux/boost/boost-contract: PKG changed from libboost-contract1.82.0 to libboost-contract1.83.0
packages/core2-32-poky-linux/boost/boost-contract: FILELIST: removed "/usr/lib/libboost_contract.so.1.82.0", added "/usr/lib/libboost_contract.so.1.83.0"
packages/core2-32-poky-linux/boost/boost-coroutine: PKG changed from libboost-coroutine1.82.0 to libboost-coroutine1.83.0
packages/core2-32-poky-linux/boost/boost-coroutine: FILELIST: removed "/usr/lib/libboost_coroutine.so.1.82.0", added "/usr/lib/libboost_coroutine.so.1.83.0"
packages/core2-32-poky-linux/boost/boost-date-time: PKG changed from libboost-date-time1.82.0 to libboost-date-time1.83.0
packages/core2-32-poky-linux/boost/boost-date-time: FILELIST: removed "/usr/lib/libboost_date_time.so.1.82.0", added "/usr/lib/libboost_date_time.so.1.83.0"
packages/core2-32-poky-linux/boost/boost-dbg: RRECOMMENDS: removed "boost-chrono-dbg"
packages/core2-32-poky-linux/boost/boost-dev: FILELIST: directory renamed /usr/lib/cmake/boost_type_erasure-1.82.0 -> /usr/lib/cmake/boost_type_erasure-1.83.0, directory renamed /usr/lib/cmake/boost_system-1.82.0 -> /usr/lib/cmake/boost_system-1.83.0, directory renamed /usr/lib/cmake/boost_contract-1.82.0 -> /usr/lib/cmake/boost_contract-1.83.0, directory renamed /usr/lib/cmake/boost_context-1.82.0 -> /usr/lib/cmake/boost_context-1.83.0, directory renamed /usr/lib/cmake/boost_math_c99f-1.82.0 -> /usr/lib/cmake/boost_math_c99f-1.83.0, directory renamed /usr/lib/cmake/boost_math_tr1f-1.82.0 -> /usr/lib/cmake/boost_math_tr1f-1.83.0, directory renamed /usr/lib/cmake/boost_math_c99l-1.82.0 -> /usr/lib/cmake/boost_math_c99l-1.83.0, directory renamed /usr/lib/cmake/boost_math_tr1l-1.82.0 -> /usr/lib/cmake/boost_math_tr1l-1.83.0, directory renamed /usr/lib/cmake/boost_test_exec_monitor-1.82.0 -> /usr/lib/cmake/boost_test_exec_monitor-1.83.0, directory renamed /usr/lib/cmake/boost_graph-1.82.
 0 -> /usr/lib/cmake/boost_graph-1.83.0, directory renamed /usr/lib/cmake/boost_prg_exec_monitor-1.82.0 -> /usr/lib/cmake/boost_prg_exec_monitor-1.83.0, directory renamed /usr/lib/cmake/boost_headers-1.82.0 -> /usr/lib/cmake/boost_headers-1.83.0, directory renamed /usr/lib/cmake/boost_json-1.82.0 -> /usr/lib/cmake/boost_json-1.83.0, directory renamed /usr/lib/cmake/boost_filesystem-1.82.0 -> /usr/lib/cmake/boost_filesystem-1.83.0, directory renamed /usr/lib/cmake/boost_python-1.82.0 -> /usr/lib/cmake/boost_python-1.83.0, directory renamed /usr/lib/cmake/boost_exception-1.82.0 -> /usr/lib/cmake/boost_exception-1.83.0, directory renamed /usr/lib/cmake/boost_atomic-1.82.0 -> /usr/lib/cmake/boost_atomic-1.83.0, directory renamed /usr/lib/cmake/boost_serialization-1.82.0 -> /usr/lib/cmake/boost_serialization-1.83.0, directory renamed /usr/lib/cmake/boost_date_time-1.82.0 -> /usr/lib/cmake/boost_date_time-1.83.0, directory renamed /usr/lib/cmake/boost_thread-1.82.0 -> /usr/lib/cmake/boost_
 thread-1.83.0, directory renamed /usr/lib/cmake/boost_random-1.82.0 -> /usr/lib/cmake/boost_random-1.83.0, directory renamed /usr/lib/cmake/boost_fiber-1.82.0 -> /usr/lib/cmake/boost_fiber-1.83.0, directory renamed /usr/lib/cmake/boost_timer-1.82.0 -> /usr/lib/cmake/boost_timer-1.83.0, directory renamed /usr/lib/cmake/boost_regex-1.82.0 -> /usr/lib/cmake/boost_regex-1.83.0, directory renamed /usr/lib/cmake/boost_unit_test_framework-1.82.0 -> /usr/lib/cmake/boost_unit_test_framework-1.83.0, directory renamed /usr/lib/cmake/boost_log_setup-1.82.0 -> /usr/lib/cmake/boost_log_setup-1.83.0, directory renamed /usr/lib/cmake/boost_url-1.82.0 -> /usr/lib/cmake/boost_url-1.83.0, directory renamed /usr/lib/cmake/Boost-1.82.0 -> /usr/lib/cmake/Boost-1.83.0, directory renamed /usr/lib/cmake/boost_locale-1.82.0 -> /usr/lib/cmake/boost_locale-1.83.0, directory renamed /usr/lib/cmake/boost_wserialization-1.82.0 -> /usr/lib/cmake/boost_wserialization-1.83.0, directory renamed /usr/lib/cmake/boost_i
 ostreams-1.82.0 -> /usr/lib/cmake/boost_iostreams-1.83.0, directory renamed /usr/lib/cmake/boost_container-1.82.0 -> /usr/lib/cmake/boost_container-1.83.0, directory renamed /usr/lib/cmake/boost_program_options-1.82.0 -> /usr/lib/cmake/boost_program_options-1.83.0, directory renamed /usr/lib/cmake/boost_coroutine-1.82.0 -> /usr/lib/cmake/boost_coroutine-1.83.0, directory renamed /usr/lib/cmake/boost_chrono-1.82.0 -> /usr/lib/cmake/boost_chrono-1.83.0, directory renamed /usr/lib/cmake/boost_math_c99-1.82.0 -> /usr/lib/cmake/boost_math_c99-1.83.0, directory renamed /usr/lib/cmake/boost_wave-1.82.0 -> /usr/lib/cmake/boost_wave-1.83.0, directory renamed /usr/lib/cmake/boost_math_tr1-1.82.0 -> /usr/lib/cmake/boost_math_tr1-1.83.0, directory renamed /usr/lib/cmake/boost_log-1.82.0 -> /usr/lib/cmake/boost_log-1.83.0, removed "/usr/include/boost/mysql/detail/channel/message_reader.hpp /usr/include/boost/mysql/detail/protocol/deserialize_binary_field.hpp /usr/include/boost/url/impl/parse_que
 ry.ipp /usr/include/boost/url/detail/impl/except.ipp /usr/include/boost/url/grammar/impl/literal_rule.ipp /usr/include/boost/url/detail/impl/pattern.ipp /usr/include/boost/url/impl/ipv4_address.ipp /usr/include/boost/url/rfc/detail/impl/port_rule.ipp /usr/include/boost/url/impl/ipv6_address.ipp /usr/include/boost/mysql/impl/rows.hpp /usr/include/boost/mysql/detail/protocol/common_messages.hpp /usr/include/boost/url/impl/url_view.ipp /usr/include/boost/url/detail/impl/normalize.ipp /usr/include/boost/mysql/detail/protocol/serialization_context.hpp /usr/include/boost/mysql/detail/network_algorithms/impl/quit_connection.hpp /usr/include/boost/mysql/detail/protocol/prepared_statement_messages.hpp /usr/include/boost/mysql/impl/connection.hpp /usr/include/boost/mysql/detail/auxiliar/valgrind.hpp /usr/include/boost/url/impl/segments_ref.ipp /usr/include/boost/url/impl/segments_encoded_ref.ipp /usr/include/boost/url/impl/parse.ipp /usr/include/boost/url/impl/url_base.ipp /usr/include/boost/
 mysql/detail/protocol/binary_serialization.hpp /usr/include/boost/mysql/detail/network_algorithms/query.hpp /usr/include/boost/mysql/detail/protocol/capabilities.hpp /usr/include/boost/mysql/detail/network_algorithms/impl/prepare_statement.hpp /usr/include/boost/mysql/detail/network_algorithms/start_statement_execution.hpp /usr/include/boost/mysql/detail/protocol/deserialize_errc.hpp /usr/include/boost/url/impl/scheme.ipp /usr/include/boost/mysql/detail/protocol/deserialization_context.hpp /usr/include/boost/url/detail/impl/decode.ipp /usr/include/boost/url/rfc/detail/impl/scheme_rule.ipp /usr/include/boost/url/rfc/detail/impl/hier_part_rule.ipp /usr/include/boost/mysql/detail/network_algorithms/handshake.hpp /usr/include/boost/mysql/detail/protocol/impl/process_error_packet.ipp /usr/include/boost/url/grammar/impl/ci_string.ipp /usr/include/boost/mysql/detail/network_algorithms/connect.hpp /usr/include/boost/smart_ptr/detail/sp_win32_sleep.hpp /usr/include/boost/url/impl/segments_en
 coded_base.ipp /usr/include/boost/url/detail/impl/pct_format.ipp /usr/include/boost/mysql/detail/network_algorithms/close_statement.hpp /usr/include/boost/url/rfc/impl/authority_rule.ipp /usr/include/boost/url/grammar/detail/impl/recycled.ipp /usr/include/boost/mysql/detail/auth/mysql_native_password.hpp /usr/include/boost/mysql/detail/network_algorithms/prepare_statement.hpp /usr/include/boost/mysql/detail/network_algorithms/close_connection.hpp /usr/include/boost/url/rfc/detail/impl/relative_part_rule.ipp /usr/include/boost/mysql/detail/auth/impl/mysql_native_password.ipp /usr/include/boost/mysql/detail/network_algorithms/start_query.hpp /usr/include/boost/url/impl/params_encoded_ref.ipp /usr/include/boost/url/rfc/impl/query_rule.ipp /usr/include/boost/url/impl/decode_view.ipp /usr/include/boost/mysql/detail/protocol/impl/handshake_messages.ipp /usr/include/boost/url/impl/parse_path.ipp /usr/include/boost/mysql/impl/rows_view.hpp /usr/include/boost/mysql/detail/protocol/impl/seria
 lization.ipp /usr/include/boost/mysql/detail/network_algorithms/impl/close_connection.hpp /usr/include/boost/mysql/detail/protocol/impl/serialization.hpp /usr/include/boost/mysql/detail/protocol/handshake_messages.hpp /usr/include/boost/mysql/detail/network_algorithms/impl/start_execution_generic.hpp /usr/include/boost/mysql/detail/network_algorithms/impl/handshake.hpp /usr/include/boost/mysql/detail/network_algorithms/ping.hpp /usr/include/boost/mysql/detail/auxiliar/bytestring.hpp /usr/include/boost/url/impl/params_ref.ipp /usr/include/boost/mysql/detail/protocol/process_error_packet.hpp /usr/include/boost/mysql/detail/network_algorithms/execute_statement.hpp /usr/include/boost/url/rfc/impl/uri_reference_rule.ipp /usr/include/boost/url/detail/impl/segments_iter_impl.ipp /usr/include/boost/mysql/detail/channel/impl/message_parser.ipp /usr/include/boost/url/impl/params_encoded_base.ipp /usr/include/boost/url/impl/params_encoded_view.ipp /usr/include/boost/mysql/detail/protocol/const
 ants.hpp /usr/include/boost/url/impl/authority_view.ipp /usr/include/boost/mysql/detail/protocol/impl/deserialize_binary_field.ipp /usr/include/boost/mysql/detail/network_algorithms/quit_connection.hpp /usr/include/boost/mysql/detail/network_algorithms/impl/start_query.hpp /usr/include/boost/mysql/detail/channel/impl/read_buffer.ipp /usr/include/boost/mysql/detail/channel/impl/message_reader.hpp /usr/include/boost/mysql/detail/auxiliar/string_view_offset.hpp /usr/include/boost/url/impl/url_view_base.ipp /usr/include/boost/mysql/detail/protocol/impl/common_messages.ipp /usr/include/boost/url/impl/segments_view.ipp /usr/include/boost/url/detail/impl/url_impl.ipp /usr/include/boost/mysql/detail/channel/impl/message_writer.hpp /usr/include/boost/url/impl/static_url.ipp /usr/include/boost/url/grammar/impl/string_view_base.ipp /usr/include/boost/mysql/detail/auxiliar/rows_iterator.hpp /usr/include/boost/url/rfc/impl/ipv4_address_rule.ipp /usr/include/boost/url/rfc/impl/ipv6_address_rule.i
 pp /usr/include/boost/url/rfc/impl/relative_ref_rule.ipp /usr/include/boost/url/impl/error.ipp /usr/include/boost/mysql/detail/protocol/resultset_encoding.hpp /usr/include/boost/url/grammar/impl/error.ipp /usr/include/boost/mysql/detail/protocol/protocol_types.hpp /usr/include/boost/url/rfc/detail/impl/host_rule.ipp /usr/include/boost/mysql/detail/protocol/query_messages.hpp /usr/include/boost/url/rfc/detail/impl/ip_literal_rule.ipp /usr/include/boost/mysql/detail/network_algorithms/impl/read_some_rows.hpp /usr/include/boost/mysql/detail/auth/auth_calculator.hpp /usr/include/boost/url/detail/impl/replacement_field_rule.ipp /usr/include/boost/mysql/detail/auxiliar/void_t.hpp /usr/include/boost/mysql/detail/channel/read_buffer.hpp /usr/include/boost/mysql/detail/channel/message_writer_processor.hpp /usr/include/boost/mysql/detail/protocol/null_bitmap_traits.hpp /usr/include/boost/url/impl/params_base.ipp /usr/include/boost/url/detail/impl/format_args.ipp /usr/include/boost/url/impl/pa
 rams_view.ipp /usr/include/boost/mysql/detail/protocol/impl/deserialize_row.ipp /usr/include/boost/outcome/experimental/status-code/status-code/status_code_ptr.hpp /usr/include/boost/mysql/detail/protocol/bit_deserialization.hpp /usr/include/boost/mysql/detail/protocol/impl/deserialize_text_field.ipp /usr/include/boost/mysql/impl/diagnostics.hpp /usr/include/boost/url/rfc/detail/impl/h16_rule.ipp /usr/include/boost/url/impl/segments_encoded_view.ipp /usr/include/boost/unordered/detail/foa.hpp /usr/include/boost/mysql/detail/protocol/serialization.hpp /usr/include/boost/mysql/detail/auxiliar/impl/datetime.hpp /usr/include/boost/url/rfc/impl/origin_form_rule.ipp /usr/include/boost/mysql/detail/auxiliar/stringize.hpp /usr/include/boost/mysql/detail/network_algorithms/impl/close_statement.hpp /usr/include/boost/mysql/detail/channel/disableable_ssl_stream.hpp /usr/include/boost/url/grammar/impl/delim_rule.ipp /usr/include/boost/mysql/detail/protocol/db_flavor.hpp /usr/include/boost/url/d
 etail/impl/any_segments_iter.ipp /usr/include/boost/url/rfc/detail/impl/userinfo_rule.ipp /usr/lib/cmake/BoostDetectToolset-1.82.0.cmake /usr/include/boost/mysql/detail/auxiliar/static_string.hpp /usr/include/boost/mysql/detail/network_algorithms/start_execution_generic.hpp /usr/include/boost/mysql/detail/protocol/deserialize_row.hpp /usr/include/boost/mysql/impl/field.hpp /usr/include/boost/url/detail/impl/any_params_iter.ipp /usr/include/boost/url/rfc/impl/uri_rule.ipp /usr/include/boost/url/detail/impl/path.ipp /usr/include/boost/url/rfc/impl/absolute_uri_rule.ipp /usr/include/boost/mysql/detail/auxiliar/server_errc_strings.hpp /usr/include/boost/url/impl/pct_string_view.ipp /usr/include/boost/mysql/detail/network_algorithms/impl/ping.hpp /usr/include/boost/mysql/detail/auxiliar/rebind_executor.hpp /usr/include/boost/mysql/impl/execution_state.hpp /usr/include/boost/url/detail/impl/params_iter_impl.ipp /usr/include/boost/url/rfc/detail/impl/ipvfuture_rule.ipp /usr/include/boost/m
 ysql/detail/auxiliar/row_base.hpp /usr/include/boost/mysql/detail/network_algorithms/impl/execute_statement.hpp /usr/include/boost/mysql/detail/channel/message_parser.hpp /usr/include/boost/mysql/detail/auxiliar/datetime.hpp /usr/include/boost/mysql/detail/network_algorithms/impl/read_all_rows.hpp /usr/include/boost/mysql/detail/network_algorithms/read_all_rows.hpp /usr/include/boost/mysql/detail/auxiliar/impl/row_base.ipp /usr/include/boost/mysql/detail/auxiliar/make_string_view.hpp /usr/include/boost/mysql/detail/channel/channel.hpp /usr/include/boost/mysql/detail/auxiliar/access_fwd.hpp /usr/include/boost/mysql/impl/row_view.hpp /usr/include/boost/mysql/impl/metadata.hpp /usr/include/boost/mysql/detail/auth/impl/auth_calculator.ipp /usr/include/boost/mysql/impl/datetime.hpp /usr/include/boost/mysql/detail/channel/message_writer.hpp /usr/include/boost/mysql/detail/auxiliar/field_impl.hpp /usr/include/boost/url/impl/segments_base.ipp /usr/include/boost/mysql/detail/auth/caching_sha
 2_password.hpp /usr/include/boost/mysql/detail/network_algorithms/impl/connect.hpp /usr/include/boost/mysql/detail/auxiliar/field_type_traits.hpp /usr/include/boost/url/grammar/detail/impl/ci_string.ipp /usr/include/boost/mysql/impl/error_categories.hpp /usr/include/boost/mysql/detail/auth/impl/caching_sha2_password.ipp /usr/include/boost/mysql/detail/protocol/deserialize_text_field.hpp /usr/include/boost/mysql/impl/date.hpp /usr/include/boost/mysql/impl/results.hpp /usr/include/boost/url/grammar/impl/dec_octet_rule.ipp /usr/include/boost/mysql/detail/protocol/impl/prepared_statement_messages.hpp /usr/include/boost/mysql/detail/network_algorithms/impl/start_statement_execution.hpp /usr/include/boost/mysql/detail/network_algorithms/read_some_rows.hpp /usr/include/boost/mysql/detail/channel/impl/disableable_ssl_stream.hpp /usr/include/boost/mysql/detail/protocol/impl/binary_serialization.ipp /usr/include/boost/mysql/detail/auxiliar/error_helpers.hpp /usr/include/boost/url/impl/url.ipp
  /usr/include/boost/mysql/detail/network_algorithms/impl/query.hpp", added "/usr/include/boost/filesystem/cstdio.hpp /usr/include/boost/unordered/detail/foa/restore_wshadow.hpp /usr/include/boost/mysql/impl/internal/protocol/bit_deserialization.hpp /usr/include/boost/mysql/detail/string_view_offset.hpp /usr/include/boost/mysql/detail/socket_stream.hpp /usr/include/boost/mysql/impl/internal/channel/valgrind.hpp /usr/include/boost/mysql/impl/internal/channel/message_reader.hpp /usr/include/boost/mysql/impl/internal/protocol/deserialize_binary_field.ipp /usr/include/boost/mysql/impl/internal/channel/message_parser.hpp /usr/include/boost/mysql/impl/internal/channel/message_parser.ipp /usr/include/boost/mysql/impl/internal/network_algorithms/start_execution.hpp /usr/include/boost/mysql/detail/results_iterator.hpp /usr/include/boost/mysql/impl/internal/protocol/deserialize_binary_field.hpp /usr/include/boost/json/detail/charconv/detail/emulated128.hpp /usr/include/boost/mysql/impl/results
 _impl.ipp /usr/include/boost/json/detail/charconv/detail/fast_float/fast_float.hpp /usr/include/boost/geometry/util/constexpr.hpp /usr/include/boost/json/detail/charconv/detail/from_chars_result.hpp /usr/include/boost/mysql/impl/internal/error/server_error_to_string.ipp /usr/include/boost/mysql/impl/internal/protocol/protocol.ipp /usr/include/boost/mysql/detail/row_impl.hpp /usr/include/boost/mysql/impl/internal/protocol/capabilities.hpp /usr/include/boost/mysql/impl/internal/error/server_error_to_string.hpp /usr/include/boost/json/detail/charconv/limits.hpp /usr/include/boost/mysql/impl/internal/protocol/protocol_field_type.ipp /usr/include/boost/json/detail/charconv/chars_format.hpp /usr/include/boost/mysql/impl/internal/protocol/db_flavor.hpp /usr/include/boost/json/detail/charconv/detail/fast_float/float_common.hpp /usr/include/boost/json/detail/charconv/detail/parser.hpp /usr/include/boost/json/detail/charconv/detail/from_chars_float_impl.hpp /usr/include/boost/mysql/impl/inter
 nal/network_algorithms/close_connection.hpp /usr/include/boost/mysql/impl/internal/network_algorithms/prepare_statement.hpp /usr/include/boost/unordered/detail/foa/core.hpp /usr/include/boost/compat/latch.hpp /usr/include/boost/mysql/impl/internal/channel/channel.hpp /usr/include/boost/unordered/detail/foa/tuple_rotate_right.hpp /usr/include/boost/mysql/resultset_view.hpp /usr/include/boost/mysql/detail/coldef_view.hpp /usr/include/boost/any/detail/placeholder.hpp /usr/include/boost/mysql/detail/rows_iterator.hpp /usr/include/boost/unordered/concurrent_flat_map_fwd.hpp /usr/include/boost/mp11/detail/mp_is_value_list.hpp /usr/include/boost/mysql/detail/any_stream.hpp /usr/include/boost/mysql/detail/flags.hpp /usr/include/boost/mysql/detail/typing/readable_field_traits.hpp /usr/include/boost/mysql/impl/internal/protocol/null_bitmap_traits.hpp /usr/include/boost/mysql/detail/any_execution_request.hpp /usr/include/boost/url/rfc/detail/ipv6_addrz_rule.hpp /usr/include/boost/mysql/impl/in
 ternal/auth/auth.ipp /usr/include/boost/mysql/static_results.hpp /usr/include/boost/core/detail/sp_thread_sleep.hpp /usr/include/boost/core/detail/sp_thread_yield.hpp /usr/include/boost/outcome/experimental/status-code/status-code/nested_status_code.hpp /usr/include/boost/mysql/detail/execution_concepts.hpp /usr/include/boost/mysql/impl/internal/network_algorithms/ping.hpp /usr/include/boost/compat/detail/throw_system_error.hpp /usr/include/boost/mysql/impl/internal/network_algorithms/close_statement.hpp /usr/include/boost/mysql/src.hpp /usr/include/boost/mysql/detail/channel_ptr.hpp /usr/include/boost/unordered/concurrent_flat_map.hpp /usr/include/boost/mysql/impl/resultset.ipp /usr/include/boost/mysql/detail/typing/get_type_index.hpp /usr/include/boost/mysql/detail/typing/meta_check_context.hpp /usr/include/boost/mysql/impl/date.ipp /usr/include/boost/mysql/impl/internal/network_algorithms/connect.hpp /usr/include/boost/mysql/impl/field.ipp /usr/include/boost/mysql/impl/internal/n
 etwork_algorithms/read_resultset_head.hpp /usr/include/boost/mysql/impl/internal/make_string_view.hpp /usr/include/boost/mysql/detail/typing/row_traits.hpp /usr/include/boost/mysql/detail/rebind_executor.hpp /usr/include/boost/mp11/detail/mp_defer.hpp /usr/include/boost/mp11/detail/mp_value.hpp /usr/include/boost/mysql/impl/internal/network_algorithms/handshake.hpp /usr/include/boost/mysql/detail/throw_on_error_loc.hpp /usr/include/boost/mysql/detail/resultset_encoding.hpp /usr/include/boost/json/detail/charconv/detail/fast_float/digit_comparison.hpp /usr/include/boost/mysql/detail/execution_processor/execution_state_impl.hpp /usr/include/boost/mysql/impl/channel_ptr.ipp /usr/include/boost/mysql/impl/internal/protocol/static_buffer.hpp /usr/include/boost/mysql/impl/internal/protocol/protocol.hpp /usr/include/boost/mysql/detail/any_stream_impl.hpp /usr/include/boost/mysql/impl/internal/network_algorithms/read_some_rows_dynamic.hpp /usr/include/boost/mysql/detail/field_impl.hpp /usr/i
 nclude/boost/mysql/impl/internal/channel/write_message.hpp /usr/include/boost/mysql/impl/internal/channel/message_writer.hpp /usr/include/boost/mysql/impl/internal/protocol/protocol_field_type.hpp /usr/include/boost/mysql/detail/network_algorithms.hpp /usr/include/boost/json/detail/charconv/detail/fast_float/bigint.hpp /usr/include/boost/json/detail/charconv/impl/from_chars.ipp /usr/include/boost/mysql/detail/execution_processor/execution_processor.hpp /usr/include/boost/iterator/is_iterator.hpp /usr/include/boost/mysql/detail/void_t.hpp /usr/include/boost/json/detail/sbo_buffer.hpp /usr/include/boost/mysql/impl/execution_state_impl.ipp /usr/include/boost/mysql/impl/meta_check_context.ipp /usr/include/boost/json/detail/charconv/detail/integer_search_trees.hpp /usr/include/boost/mysql/impl/internal/protocol/serialization.hpp /usr/include/boost/locale/detail/facet_id.hpp /usr/include/boost/unordered/detail/foa/node_map_types.hpp /usr/include/boost/unordered/detail/foa/node_set_types.h
 pp /usr/include/boost/math/special_functions/fourier_transform_daubechies.hpp /usr/include/boost/mysql/impl/internal/network_algorithms/execute.hpp /usr/include/boost/unordered/detail/foa/rw_spinlock.hpp /usr/include/boost/mysql/impl/static_results_impl.ipp /usr/include/boost/json/detail/charconv/detail/fast_float/constexpr_feature_detect.hpp /usr/include/boost/mysql/impl/static_execution_state_impl.ipp /usr/include/boost/json/detail/charconv/detail/fast_float/decimal_to_binary.hpp /usr/lib/cmake/BoostDetectToolset-1.83.0.cmake /usr/include/boost/mysql/resultset.hpp /usr/include/boost/unordered/detail/foa/concurrent_table.hpp /usr/include/boost/mysql/impl/internal/protocol/constants.hpp /usr/include/boost/mysql/detail/execution_processor/static_results_impl.hpp /usr/include/boost/mysql/impl/network_algorithms.ipp /usr/include/boost/mp11/detail/mp_list_v.hpp /usr/include/boost/json/detail/charconv/detail/significand_tables.hpp /usr/include/boost/mysql/detail/access.hpp /usr/include/b
 oost/mysql/detail/execution_processor/static_execution_state_impl.hpp /usr/include/boost/mysql/detail/datetime.hpp /usr/include/boost/json/detail/charconv/detail/fast_float/ascii_number.hpp /usr/include/boost/mysql/impl/internal/auth/auth.hpp /usr/include/boost/json/detail/charconv/detail/fast_float/parse_number.hpp /usr/include/boost/json/detail/charconv/detail/fast_float/fast_table.hpp /usr/include/boost/json/serialize_options.hpp /usr/include/boost/mysql/impl/internal/network_algorithms/read_some_rows.hpp /usr/include/boost/mysql/impl/internal/channel/read_buffer.hpp /usr/include/boost/mysql/impl/column_type.ipp /usr/include/boost/mysql/impl/any_stream_impl.ipp /usr/include/boost/core/detail/sp_thread_pause.hpp /usr/include/boost/mysql/detail/execution_processor/results_impl.hpp /usr/include/boost/json/detail/charconv/from_chars.hpp /usr/include/boost/mysql/impl/internal/protocol/deserialize_text_field.hpp /usr/include/boost/mysql/impl/row_impl.ipp /usr/include/boost/mysql/impl/i
 nternal/protocol/deserialize_text_field.ipp /usr/include/boost/json/detail/charconv/detail/config.hpp /usr/include/boost/mysql/impl/datetime.ipp /usr/include/boost/mysql/detail/writable_field_traits.hpp /usr/include/boost/locale/detail/encoding.hpp /usr/include/boost/json/detail/charconv/detail/from_chars_integer_impl.hpp /usr/include/boost/mysql/detail/typing/pos_map.hpp /usr/include/boost/mysql/impl/internal/network_algorithms/quit_connection.hpp /usr/include/boost/unordered/detail/foa/ignore_wshadow.hpp /usr/include/boost/compat/shared_lock.hpp /usr/include/boost/atomic/detail/type_traits/remove_cv.hpp /usr/include/boost/locale/detail/is_supported_char.hpp /usr/include/boost/mysql/impl/error_categories.ipp /usr/include/boost/mysql/impl/internal/protocol/basic_types.hpp /usr/include/boost/mysql/impl/field_view.ipp /usr/include/boost/unordered/detail/foa/flat_map_types.hpp /usr/include/boost/unordered/detail/foa/flat_set_types.hpp /usr/include/boost/mysql/impl/internal/protocol/bin
 ary_serialization.ipp /usr/include/boost/mysql/static_execution_state.hpp /usr/include/boost/mysql/detail/ok_view.hpp /usr/include/boost/core/detail/sp_win32_sleep.hpp /usr/include/boost/json/detail/charconv/detail/compute_float64.hpp /usr/include/boost/mysql/impl/internal/protocol/binary_serialization.hpp /usr/include/boost/core/yield_primitives.hpp /usr/include/boost/unordered/detail/foa/table.hpp"
packages/core2-32-poky-linux/boost/boost-fiber: PKG changed from libboost-fiber1.82.0 to libboost-fiber1.83.0
packages/core2-32-poky-linux/boost/boost-fiber: FILELIST: removed "/usr/lib/libboost_fiber.so.1.82.0", added "/usr/lib/libboost_fiber.so.1.83.0"
packages/core2-32-poky-linux/boost/boost-filesystem: PKG changed from libboost-filesystem1.82.0 to libboost-filesystem1.83.0
packages/core2-32-poky-linux/boost/boost-filesystem: FILELIST: removed "/usr/lib/libboost_filesystem.so.1.82.0", added "/usr/lib/libboost_filesystem.so.1.83.0"
packages/core2-32-poky-linux/boost/boost-graph: PKG changed from libboost-graph1.82.0 to libboost-graph1.83.0
packages/core2-32-poky-linux/boost/boost-graph: FILELIST: removed "/usr/lib/libboost_graph.so.1.82.0", added "/usr/lib/libboost_graph.so.1.83.0"
packages/core2-32-poky-linux/boost/boost-iostreams: PKG changed from libboost-iostreams1.82.0 to libboost-iostreams1.83.0
packages/core2-32-poky-linux/boost/boost-iostreams: FILELIST: removed "/usr/lib/libboost_iostreams.so.1.82.0", added "/usr/lib/libboost_iostreams.so.1.83.0"
packages/core2-32-poky-linux/boost/boost-json: PKG changed from libboost-json1.82.0 to libboost-json1.83.0
packages/core2-32-poky-linux/boost/boost-json: PKGSIZE changed from 304760 to 386648 (+27%)
packages/core2-32-poky-linux/boost/boost-json: FILELIST: removed "/usr/lib/libboost_json.so.1.82.0", added "/usr/lib/libboost_json.so.1.83.0"
packages/core2-32-poky-linux/boost/boost-locale: PKG changed from libboost-locale1.82.0 to libboost-locale1.83.0
packages/core2-32-poky-linux/boost/boost-locale: PKGSIZE changed from 1017788 to 911164 (-10%)
packages/core2-32-poky-linux/boost/boost-locale: FILELIST: removed "/usr/lib/libboost_locale.so.1.82.0", added "/usr/lib/libboost_locale.so.1.83.0"
packages/core2-32-poky-linux/boost/boost-log: FILELIST: removed "/usr/lib/libboost_log.so.1.82.0 /usr/lib/libboost_log_setup.so.1.82.0", added "/usr/lib/libboost_log.so.1.83.0 /usr/lib/libboost_log_setup.so.1.83.0"
packages/core2-32-poky-linux/boost/boost-math: FILELIST: removed "/usr/lib/libboost_math_tr1f.so.1.82.0 /usr/lib/libboost_math_tr1l.so.1.82.0 /usr/lib/libboost_math_c99f.so.1.82.0 /usr/lib/libboost_math_c99l.so.1.82.0 /usr/lib/libboost_math_tr1.so.1.82.0 /usr/lib/libboost_math_c99.so.1.82.0", added "/usr/lib/libboost_math_c99f.so.1.83.0 /usr/lib/libboost_math_c99l.so.1.83.0 /usr/lib/libboost_math_tr1.so.1.83.0 /usr/lib/libboost_math_c99.so.1.83.0 /usr/lib/libboost_math_tr1f.so.1.83.0 /usr/lib/libboost_math_tr1l.so.1.83.0"
packages/core2-32-poky-linux/boost/boost-program-options: PKG changed from libboost-program-options1.82.0 to libboost-program-options1.83.0
packages/core2-32-poky-linux/boost/boost-program-options: FILELIST: removed "/usr/lib/libboost_program_options.so.1.82.0", added "/usr/lib/libboost_program_options.so.1.83.0"
packages/core2-32-poky-linux/boost/boost-python: PKG changed from libboost-python311-1.82.0 to libboost-python311-1.83.0
packages/core2-32-poky-linux/boost/boost-python: FILELIST: removed "/usr/lib/libboost_python311.so.1.82.0", added "/usr/lib/libboost_python311.so.1.83.0"
packages/core2-32-poky-linux/boost/boost-random: PKG changed from libboost-random1.82.0 to libboost-random1.83.0
packages/core2-32-poky-linux/boost/boost-random: FILELIST: removed "/usr/lib/libboost_random.so.1.82.0", added "/usr/lib/libboost_random.so.1.83.0"
packages/core2-32-poky-linux/boost/boost-regex: PKG changed from libboost-regex1.82.0 to libboost-regex1.83.0
packages/core2-32-poky-linux/boost/boost-regex: FILELIST: removed "/usr/lib/libboost_regex.so.1.82.0", added "/usr/lib/libboost_regex.so.1.83.0"
packages/core2-32-poky-linux/boost/boost-serialization: FILELIST: removed "/usr/lib/libboost_serialization.so.1.82.0 /usr/lib/libboost_wserialization.so.1.82.0", added "/usr/lib/libboost_serialization.so.1.83.0 /usr/lib/libboost_wserialization.so.1.83.0"
packages/core2-32-poky-linux/boost/boost-system: PKG changed from libboost-system1.82.0 to libboost-system1.83.0
packages/core2-32-poky-linux/boost/boost-system: FILELIST: removed "/usr/lib/libboost_system.so.1.82.0", added "/usr/lib/libboost_system.so.1.83.0"
packages/core2-32-poky-linux/boost/boost-test: FILELIST: removed "/usr/lib/libboost_prg_exec_monitor.so.1.82.0 /usr/lib/libboost_unit_test_framework.so.1.82.0", added "/usr/lib/libboost_prg_exec_monitor.so.1.83.0 /usr/lib/libboost_unit_test_framework.so.1.83.0"
packages/core2-32-poky-linux/boost/boost-thread: PKG changed from libboost-thread1.82.0 to libboost-thread1.83.0
packages/core2-32-poky-linux/boost/boost-thread: FILELIST: removed "/usr/lib/libboost_thread.so.1.82.0", added "/usr/lib/libboost_thread.so.1.83.0"
packages/core2-32-poky-linux/boost/boost-timer: PKG changed from libboost-timer1.82.0 to libboost-timer1.83.0
packages/core2-32-poky-linux/boost/boost-timer: RDEPENDS: removed all items "boost-chrono (['>= 1.82.0'])"
packages/core2-32-poky-linux/boost/boost-timer: PKGSIZE changed from 30104 to 21860 (-27%)
packages/core2-32-poky-linux/boost/boost-timer: FILELIST: removed "/usr/lib/libboost_timer.so.1.82.0", added "/usr/lib/libboost_timer.so.1.83.0"
packages/core2-32-poky-linux/boost/boost-type-erasure: PKG changed from libboost-type-erasure1.82.0 to libboost-type-erasure1.83.0
packages/core2-32-poky-linux/boost/boost-type-erasure: FILELIST: removed "/usr/lib/libboost_type_erasure.so.1.82.0", added "/usr/lib/libboost_type_erasure.so.1.83.0"
packages/core2-32-poky-linux/boost/boost-url: PKG changed from libboost-url1.82.0 to libboost-url1.83.0
packages/core2-32-poky-linux/boost/boost-url: FILELIST: removed "/usr/lib/libboost_url.so.1.82.0", added "/usr/lib/libboost_url.so.1.83.0"
packages/core2-32-poky-linux/boost/boost-wave: PKG changed from libboost-wave1.82.0 to libboost-wave1.83.0
packages/core2-32-poky-linux/boost/boost-wave: FILELIST: removed "/usr/lib/libboost_wave.so.1.82.0", added "/usr/lib/libboost_wave.so.1.83.0"
Changes to packages/core2-32-poky-linux/boost (sysroot):
  /usr/lib/libboost_atomic.so changed symlink target from libboost_atomic.so.1.82.0 to libboost_atomic.so.1.83.0
  /usr/lib/libboost_chrono.so changed symlink target from libboost_chrono.so.1.82.0 to libboost_chrono.so.1.83.0
  /usr/lib/libboost_container.so changed symlink target from libboost_container.so.1.82.0 to libboost_container.so.1.83.0
  /usr/lib/libboost_context.so changed symlink target from libboost_context.so.1.82.0 to libboost_context.so.1.83.0
  /usr/lib/libboost_contract.so changed symlink target from libboost_contract.so.1.82.0 to libboost_contract.so.1.83.0
  /usr/lib/libboost_coroutine.so changed symlink target from libboost_coroutine.so.1.82.0 to libboost_coroutine.so.1.83.0
  /usr/lib/libboost_date_time.so changed symlink target from libboost_date_time.so.1.82.0 to libboost_date_time.so.1.83.0
  /usr/lib/libboost_fiber.so changed symlink target from libboost_fiber.so.1.82.0 to libboost_fiber.so.1.83.0
  /usr/lib/libboost_filesystem.so changed symlink target from libboost_filesystem.so.1.82.0 to libboost_filesystem.so.1.83.0
  /usr/lib/libboost_graph.so changed symlink target from libboost_graph.so.1.82.0 to libboost_graph.so.1.83.0
  /usr/lib/libboost_iostreams.so changed symlink target from libboost_iostreams.so.1.82.0 to libboost_iostreams.so.1.83.0
  /usr/lib/libboost_json.so changed symlink target from libboost_json.so.1.82.0 to libboost_json.so.1.83.0
  /usr/lib/libboost_locale.so changed symlink target from libboost_locale.so.1.82.0 to libboost_locale.so.1.83.0
  /usr/lib/libboost_log_setup.so changed symlink target from libboost_log_setup.so.1.82.0 to libboost_log_setup.so.1.83.0
  /usr/lib/libboost_log.so changed symlink target from libboost_log.so.1.82.0 to libboost_log.so.1.83.0
  /usr/lib/libboost_math_c99f.so changed symlink target from libboost_math_c99f.so.1.82.0 to libboost_math_c99f.so.1.83.0
  /usr/lib/libboost_math_c99l.so changed symlink target from libboost_math_c99l.so.1.82.0 to libboost_math_c99l.so.1.83.0
  /usr/lib/libboost_math_c99.so changed symlink target from libboost_math_c99.so.1.82.0 to libboost_math_c99.so.1.83.0
  /usr/lib/libboost_math_tr1f.so changed symlink target from libboost_math_tr1f.so.1.82.0 to libboost_math_tr1f.so.1.83.0
  /usr/lib/libboost_math_tr1l.so changed symlink target from libboost_math_tr1l.so.1.82.0 to libboost_math_tr1l.so.1.83.0
  /usr/lib/libboost_math_tr1.so changed symlink target from libboost_math_tr1.so.1.82.0 to libboost_math_tr1.so.1.83.0
  /usr/lib/libboost_prg_exec_monitor.so changed symlink target from libboost_prg_exec_monitor.so.1.82.0 to libboost_prg_exec_monitor.so.1.83.0
  /usr/lib/libboost_program_options.so changed symlink target from libboost_program_options.so.1.82.0 to libboost_program_options.so.1.83.0
  /usr/lib/libboost_python311.so changed symlink target from libboost_python311.so.1.82.0 to libboost_python311.so.1.83.0
  /usr/lib/libboost_random.so changed symlink target from libboost_random.so.1.82.0 to libboost_random.so.1.83.0
  /usr/lib/libboost_regex.so changed symlink target from libboost_regex.so.1.82.0 to libboost_regex.so.1.83.0
  /usr/lib/libboost_serialization.so changed symlink target from libboost_serialization.so.1.82.0 to libboost_serialization.so.1.83.0
  /usr/lib/libboost_system.so changed symlink target from libboost_system.so.1.82.0 to libboost_system.so.1.83.0
  /usr/lib/libboost_thread.so changed symlink target from libboost_thread.so.1.82.0 to libboost_thread.so.1.83.0
  /usr/lib/libboost_timer.so changed symlink target from libboost_timer.so.1.82.0 to libboost_timer.so.1.83.0
  /usr/lib/libboost_type_erasure.so changed symlink target from libboost_type_erasure.so.1.82.0 to libboost_type_erasure.so.1.83.0
  /usr/lib/libboost_unit_test_framework.so changed symlink target from libboost_unit_test_framework.so.1.82.0 to libboost_unit_test_framework.so.1.83.0
  /usr/lib/libboost_url.so changed symlink target from libboost_url.so.1.82.0 to libboost_url.so.1.83.0
  /usr/lib/libboost_wave.so changed symlink target from libboost_wave.so.1.82.0 to libboost_wave.so.1.83.0
  /usr/lib/libboost_wserialization.so changed symlink target from libboost_wserialization.so.1.82.0 to libboost_wserialization.so.1.83.0
  /usr/lib/cmake/Boost-1.82.0 moved to /usr/lib/cmake/Boost-1.83.0
  /usr/lib/cmake/boost_atomic-1.82.0 moved to /usr/lib/cmake/boost_atomic-1.83.0
  /usr/lib/cmake/boost_chrono-1.82.0 moved to /usr/lib/cmake/boost_chrono-1.83.0
  /usr/lib/cmake/boost_container-1.82.0 moved to /usr/lib/cmake/boost_container-1.83.0
  /usr/lib/cmake/boost_context-1.82.0 moved to /usr/lib/cmake/boost_context-1.83.0
  /usr/lib/cmake/boost_contract-1.82.0 moved to /usr/lib/cmake/boost_contract-1.83.0
  /usr/lib/cmake/boost_coroutine-1.82.0 moved to /usr/lib/cmake/boost_coroutine-1.83.0
  /usr/lib/cmake/boost_date_time-1.82.0 moved to /usr/lib/cmake/boost_date_time-1.83.0
  /usr/lib/cmake/BoostDetectToolset-1.82.0.cmake moved to /usr/lib/cmake/BoostDetectToolset-1.83.0.cmake
  /usr/lib/cmake/boost_exception-1.82.0 moved to /usr/lib/cmake/boost_exception-1.83.0
  /usr/lib/cmake/boost_fiber-1.82.0 moved to /usr/lib/cmake/boost_fiber-1.83.0
  /usr/lib/cmake/boost_filesystem-1.82.0 moved to /usr/lib/cmake/boost_filesystem-1.83.0
  /usr/lib/cmake/boost_graph-1.82.0 moved to /usr/lib/cmake/boost_graph-1.83.0
  /usr/lib/cmake/boost_headers-1.82.0 moved to /usr/lib/cmake/boost_headers-1.83.0
  /usr/lib/cmake/boost_iostreams-1.82.0 moved to /usr/lib/cmake/boost_iostreams-1.83.0
  /usr/lib/cmake/boost_json-1.82.0 moved to /usr/lib/cmake/boost_json-1.83.0
  /usr/lib/cmake/boost_locale-1.82.0 moved to /usr/lib/cmake/boost_locale-1.83.0
  /usr/lib/cmake/boost_log-1.82.0 moved to /usr/lib/cmake/boost_log-1.83.0
  /usr/lib/cmake/boost_log_setup-1.82.0 moved to /usr/lib/cmake/boost_log_setup-1.83.0
  /usr/lib/cmake/boost_math_c99-1.82.0 moved to /usr/lib/cmake/boost_math_c99-1.83.0
  /usr/lib/cmake/boost_math_c99f-1.82.0 moved to /usr/lib/cmake/boost_math_c99f-1.83.0
  /usr/lib/cmake/boost_math_c99l-1.82.0 moved to /usr/lib/cmake/boost_math_c99l-1.83.0
  /usr/lib/cmake/boost_math_tr1-1.82.0 moved to /usr/lib/cmake/boost_math_tr1-1.83.0
  /usr/lib/cmake/boost_math_tr1f-1.82.0 moved to /usr/lib/cmake/boost_math_tr1f-1.83.0
  /usr/lib/cmake/boost_math_tr1l-1.82.0 moved to /usr/lib/cmake/boost_math_tr1l-1.83.0
  /usr/lib/cmake/boost_prg_exec_monitor-1.82.0 moved to /usr/lib/cmake/boost_prg_exec_monitor-1.83.0
  /usr/lib/cmake/boost_program_options-1.82.0 moved to /usr/lib/cmake/boost_program_options-1.83.0
  /usr/lib/cmake/boost_python-1.82.0 moved to /usr/lib/cmake/boost_python-1.83.0
  /usr/lib/cmake/boost_random-1.82.0 moved to /usr/lib/cmake/boost_random-1.83.0
  /usr/lib/cmake/boost_regex-1.82.0 moved to /usr/lib/cmake/boost_regex-1.83.0
  /usr/lib/cmake/boost_serialization-1.82.0 moved to /usr/lib/cmake/boost_serialization-1.83.0
  /usr/lib/cmake/boost_system-1.82.0 moved to /usr/lib/cmake/boost_system-1.83.0
  /usr/lib/cmake/boost_test_exec_monitor-1.82.0 moved to /usr/lib/cmake/boost_test_exec_monitor-1.83.0
  /usr/lib/cmake/boost_thread-1.82.0 moved to /usr/lib/cmake/boost_thread-1.83.0
  /usr/lib/cmake/boost_timer-1.82.0 moved to /usr/lib/cmake/boost_timer-1.83.0
  /usr/lib/cmake/boost_type_erasure-1.82.0 moved to /usr/lib/cmake/boost_type_erasure-1.83.0
  /usr/lib/cmake/boost_unit_test_framework-1.82.0 moved to /usr/lib/cmake/boost_unit_test_framework-1.83.0
  /usr/lib/cmake/boost_url-1.82.0 moved to /usr/lib/cmake/boost_url-1.83.0
  /usr/lib/cmake/boost_wave-1.82.0 moved to /usr/lib/cmake/boost_wave-1.83.0
  /usr/lib/cmake/boost_wserialization-1.82.0 moved to /usr/lib/cmake/boost_wserialization-1.83.0
  /usr/lib/libboost_atomic.so.1.82.0 moved to /usr/lib/libboost_atomic.so.1.83.0
  /usr/lib/libboost_chrono.so.1.82.0 moved to /usr/lib/libboost_chrono.so.1.83.0
  /usr/lib/libboost_container.so.1.82.0 moved to /usr/lib/libboost_container.so.1.83.0
  /usr/lib/libboost_context.so.1.82.0 moved to /usr/lib/libboost_context.so.1.83.0
  /usr/lib/libboost_contract.so.1.82.0 moved to /usr/lib/libboost_contract.so.1.83.0
  /usr/lib/libboost_coroutine.so.1.82.0 moved to /usr/lib/libboost_coroutine.so.1.83.0
  /usr/lib/libboost_date_time.so.1.82.0 moved to /usr/lib/libboost_date_time.so.1.83.0
  /usr/lib/libboost_fiber.so.1.82.0 moved to /usr/lib/libboost_fiber.so.1.83.0
  /usr/lib/libboost_filesystem.so.1.82.0 moved to /usr/lib/libboost_filesystem.so.1.83.0
  /usr/lib/libboost_graph.so.1.82.0 moved to /usr/lib/libboost_graph.so.1.83.0
  /usr/lib/libboost_iostreams.so.1.82.0 moved to /usr/lib/libboost_iostreams.so.1.83.0
  /usr/lib/libboost_json.so.1.82.0 moved to /usr/lib/libboost_json.so.1.83.0
  /usr/lib/libboost_locale.so.1.82.0 moved to /usr/lib/libboost_locale.so.1.83.0
  /usr/lib/libboost_log_setup.so.1.82.0 moved to /usr/lib/libboost_log_setup.so.1.83.0
  /usr/lib/libboost_log.so.1.82.0 moved to /usr/lib/libboost_log.so.1.83.0
  /usr/lib/libboost_math_c99f.so.1.82.0 moved to /usr/lib/libboost_math_c99f.so.1.83.0
  /usr/lib/libboost_math_c99l.so.1.82.0 moved to /usr/lib/libboost_math_c99l.so.1.83.0
  /usr/lib/libboost_math_c99.so.1.82.0 moved to /usr/lib/libboost_math_c99.so.1.83.0
  /usr/lib/libboost_math_tr1f.so.1.82.0 moved to /usr/lib/libboost_math_tr1f.so.1.83.0
  /usr/lib/libboost_math_tr1l.so.1.82.0 moved to /usr/lib/libboost_math_tr1l.so.1.83.0
  /usr/lib/libboost_math_tr1.so.1.82.0 moved to /usr/lib/libboost_math_tr1.so.1.83.0
  /usr/lib/libboost_prg_exec_monitor.so.1.82.0 moved to /usr/lib/libboost_prg_exec_monitor.so.1.83.0
  /usr/lib/libboost_program_options.so.1.82.0 moved to /usr/lib/libboost_program_options.so.1.83.0
  /usr/lib/libboost_python311.so.1.82.0 moved to /usr/lib/libboost_python311.so.1.83.0
  /usr/lib/libboost_random.so.1.82.0 moved to /usr/lib/libboost_random.so.1.83.0
  /usr/lib/libboost_regex.so.1.82.0 moved to /usr/lib/libboost_regex.so.1.83.0
  /usr/lib/libboost_serialization.so.1.82.0 moved to /usr/lib/libboost_serialization.so.1.83.0
  /usr/lib/libboost_system.so.1.82.0 moved to /usr/lib/libboost_system.so.1.83.0
  /usr/lib/libboost_thread.so.1.82.0 moved to /usr/lib/libboost_thread.so.1.83.0
  /usr/lib/libboost_timer.so.1.82.0 moved to /usr/lib/libboost_timer.so.1.83.0
  /usr/lib/libboost_type_erasure.so.1.82.0 moved to /usr/lib/libboost_type_erasure.so.1.83.0
  /usr/lib/libboost_unit_test_framework.so.1.82.0 moved to /usr/lib/libboost_unit_test_framework.so.1.83.0
  /usr/lib/libboost_url.so.1.82.0 moved to /usr/lib/libboost_url.so.1.83.0
  /usr/lib/libboost_wave.so.1.82.0 moved to /usr/lib/libboost_wave.so.1.83.0
  /usr/lib/libboost_wserialization.so.1.82.0 moved to /usr/lib/libboost_wserialization.so.1.83.0
  /usr/include/boost/any/detail was added
  /usr/include/boost/any/detail/placeholder.hpp was added
  /usr/include/boost/atomic/detail/type_traits/remove_cv.hpp was added
  /usr/include/boost/compat was added
  /usr/include/boost/compat/detail was added
  /usr/include/boost/compat/detail/throw_system_error.hpp was added
  /usr/include/boost/compat/latch.hpp was added
  /usr/include/boost/compat/shared_lock.hpp was added
  /usr/include/boost/core/detail/sp_thread_pause.hpp was added
  /usr/include/boost/core/detail/sp_thread_sleep.hpp was added
  /usr/include/boost/core/detail/sp_thread_yield.hpp was added
  /usr/include/boost/core/detail/sp_win32_sleep.hpp was added
  /usr/include/boost/core/yield_primitives.hpp was added
  /usr/include/boost/filesystem/cstdio.hpp was added
  /usr/include/boost/geometry/util/constexpr.hpp was added
  /usr/include/boost/iterator/is_iterator.hpp was added
  /usr/include/boost/json/detail/charconv was added
  /usr/include/boost/json/detail/charconv/chars_format.hpp was added
  /usr/include/boost/json/detail/charconv/detail was added
  /usr/include/boost/json/detail/charconv/detail/compute_float64.hpp was added
  /usr/include/boost/json/detail/charconv/detail/config.hpp was added
  /usr/include/boost/json/detail/charconv/detail/emulated128.hpp was added
  /usr/include/boost/json/detail/charconv/detail/fast_float was added
  /usr/include/boost/json/detail/charconv/detail/fast_float/ascii_number.hpp was added
  /usr/include/boost/json/detail/charconv/detail/fast_float/bigint.hpp was added
  /usr/include/boost/json/detail/charconv/detail/fast_float/constexpr_feature_detect.hpp was added
  /usr/include/boost/json/detail/charconv/detail/fast_float/decimal_to_binary.hpp was added
  /usr/include/boost/json/detail/charconv/detail/fast_float/digit_comparison.hpp was added
  /usr/include/boost/json/detail/charconv/detail/fast_float/fast_float.hpp was added
  /usr/include/boost/json/detail/charconv/detail/fast_float/fast_table.hpp was added
  /usr/include/boost/json/detail/charconv/detail/fast_float/float_common.hpp was added
  /usr/include/boost/json/detail/charconv/detail/fast_float/parse_number.hpp was added
  /usr/include/boost/json/detail/charconv/detail/from_chars_float_impl.hpp was added
  /usr/include/boost/json/detail/charconv/detail/from_chars_integer_impl.hpp was added
  /usr/include/boost/json/detail/charconv/detail/from_chars_result.hpp was added
  /usr/include/boost/json/detail/charconv/detail/integer_search_trees.hpp was added
  /usr/include/boost/json/detail/charconv/detail/parser.hpp was added
  /usr/include/boost/json/detail/charconv/detail/significand_tables.hpp was added
  /usr/include/boost/json/detail/charconv/from_chars.hpp was added
  /usr/include/boost/json/detail/charconv/impl was added
  /usr/include/boost/json/detail/charconv/impl/from_chars.ipp was added
  /usr/include/boost/json/detail/charconv/limits.hpp was added
  /usr/include/boost/json/detail/sbo_buffer.hpp was added
  /usr/include/boost/json/serialize_options.hpp was added
  /usr/include/boost/locale/detail was added
  /usr/include/boost/locale/detail/encoding.hpp was added
  /usr/include/boost/locale/detail/facet_id.hpp was added
  /usr/include/boost/locale/detail/is_supported_char.hpp was added
  /usr/include/boost/math/special_functions/fourier_transform_daubechies.hpp was added
  /usr/include/boost/mp11/detail/mp_defer.hpp was added
  /usr/include/boost/mp11/detail/mp_is_value_list.hpp was added
  /usr/include/boost/mp11/detail/mp_list_v.hpp was added
  /usr/include/boost/mp11/detail/mp_value.hpp was added
  /usr/include/boost/mysql/detail/access.hpp was added
  /usr/include/boost/mysql/detail/any_execution_request.hpp was added
  /usr/include/boost/mysql/detail/any_stream.hpp was added
  /usr/include/boost/mysql/detail/any_stream_impl.hpp was added
  /usr/include/boost/mysql/detail/channel_ptr.hpp was added
  /usr/include/boost/mysql/detail/coldef_view.hpp was added
  /usr/include/boost/mysql/detail/datetime.hpp was added
  /usr/include/boost/mysql/detail/execution_concepts.hpp was added
  /usr/include/boost/mysql/detail/execution_processor was added
  /usr/include/boost/mysql/detail/execution_processor/execution_processor.hpp was added
  /usr/include/boost/mysql/detail/execution_processor/execution_state_impl.hpp was added
  /usr/include/boost/mysql/detail/execution_processor/results_impl.hpp was added
  /usr/include/boost/mysql/detail/execution_processor/static_execution_state_impl.hpp was added
  /usr/include/boost/mysql/detail/execution_processor/static_results_impl.hpp was added
  /usr/include/boost/mysql/detail/field_impl.hpp was added
  /usr/include/boost/mysql/detail/flags.hpp was added
  /usr/include/boost/mysql/detail/network_algorithms.hpp was added
  /usr/include/boost/mysql/detail/ok_view.hpp was added
  /usr/include/boost/mysql/detail/rebind_executor.hpp was added
  /usr/include/boost/mysql/detail/resultset_encoding.hpp was added
  /usr/include/boost/mysql/detail/results_iterator.hpp was added
  /usr/include/boost/mysql/detail/row_impl.hpp was added
  /usr/include/boost/mysql/detail/rows_iterator.hpp was added
  /usr/include/boost/mysql/detail/socket_stream.hpp was added
  /usr/include/boost/mysql/detail/string_view_offset.hpp was added
  /usr/include/boost/mysql/detail/throw_on_error_loc.hpp was added
  /usr/include/boost/mysql/detail/typing was added
  /usr/include/boost/mysql/detail/typing/get_type_index.hpp was added
  /usr/include/boost/mysql/detail/typing/meta_check_context.hpp was added
  /usr/include/boost/mysql/detail/typing/pos_map.hpp was added
  /usr/include/boost/mysql/detail/typing/readable_field_traits.hpp was added
  /usr/include/boost/mysql/detail/typing/row_traits.hpp was added
  /usr/include/boost/mysql/detail/void_t.hpp was added
  /usr/include/boost/mysql/detail/writable_field_traits.hpp was added
  /usr/include/boost/mysql/impl/any_stream_impl.ipp was added
  /usr/include/boost/mysql/impl/channel_ptr.ipp was added
  /usr/include/boost/mysql/impl/column_type.ipp was added
  /usr/include/boost/mysql/impl/date.ipp was added
  /usr/include/boost/mysql/impl/datetime.ipp was added
  /usr/include/boost/mysql/impl/error_categories.ipp was added
  /usr/include/boost/mysql/impl/execution_state_impl.ipp was added
  /usr/include/boost/mysql/impl/field.ipp was added
  /usr/include/boost/mysql/impl/field_view.ipp was added
  /usr/include/boost/mysql/impl/internal was added
  /usr/include/boost/mysql/impl/internal/auth was added
  /usr/include/boost/mysql/impl/internal/auth/auth.hpp was added
  /usr/include/boost/mysql/impl/internal/auth/auth.ipp was added
  /usr/include/boost/mysql/impl/internal/channel was added
  /usr/include/boost/mysql/impl/internal/channel/channel.hpp was added
  /usr/include/boost/mysql/impl/internal/channel/message_parser.hpp was added
  /usr/include/boost/mysql/impl/internal/channel/message_parser.ipp was added
  /usr/include/boost/mysql/impl/internal/channel/message_reader.hpp was added
  /usr/include/boost/mysql/impl/internal/channel/message_writer.hpp was added
  /usr/include/boost/mysql/impl/internal/channel/read_buffer.hpp was added
  /usr/include/boost/mysql/impl/internal/channel/valgrind.hpp was added
  /usr/include/boost/mysql/impl/internal/channel/write_message.hpp was added
  /usr/include/boost/mysql/impl/internal/error was added
  /usr/include/boost/mysql/impl/internal/error/server_error_to_string.hpp was added
  /usr/include/boost/mysql/impl/internal/error/server_error_to_string.ipp was added
  /usr/include/boost/mysql/impl/internal/make_string_view.hpp was added
  /usr/include/boost/mysql/impl/internal/network_algorithms was added
  /usr/include/boost/mysql/impl/internal/network_algorithms/close_connection.hpp was added
  /usr/include/boost/mysql/impl/internal/network_algorithms/close_statement.hpp was added
  /usr/include/boost/mysql/impl/internal/network_algorithms/connect.hpp was added
  /usr/include/boost/mysql/impl/internal/network_algorithms/execute.hpp was added
  /usr/include/boost/mysql/impl/internal/network_algorithms/handshake.hpp was added
  /usr/include/boost/mysql/impl/internal/network_algorithms/ping.hpp was added
  /usr/include/boost/mysql/impl/internal/network_algorithms/prepare_statement.hpp was added
  /usr/include/boost/mysql/impl/internal/network_algorithms/quit_connection.hpp was added
  /usr/include/boost/mysql/impl/internal/network_algorithms/read_resultset_head.hpp was added
  /usr/include/boost/mysql/impl/internal/network_algorithms/read_some_rows_dynamic.hpp was added
  /usr/include/boost/mysql/impl/internal/network_algorithms/read_some_rows.hpp was added
  /usr/include/boost/mysql/impl/internal/network_algorithms/start_execution.hpp was added
  /usr/include/boost/mysql/impl/internal/protocol was added
  /usr/include/boost/mysql/impl/internal/protocol/basic_types.hpp was added
  /usr/include/boost/mysql/impl/internal/protocol/binary_serialization.hpp was added
  /usr/include/boost/mysql/impl/internal/protocol/binary_serialization.ipp was added
  /usr/include/boost/mysql/impl/internal/protocol/bit_deserialization.hpp was added
  /usr/include/boost/mysql/impl/internal/protocol/capabilities.hpp was added
  /usr/include/boost/mysql/impl/internal/protocol/constants.hpp was added
  /usr/include/boost/mysql/impl/internal/protocol/db_flavor.hpp was added
  /usr/include/boost/mysql/impl/internal/protocol/deserialize_binary_field.hpp was added
  /usr/include/boost/mysql/impl/internal/protocol/deserialize_binary_field.ipp was added
  /usr/include/boost/mysql/impl/internal/protocol/deserialize_text_field.hpp was added
  /usr/include/boost/mysql/impl/internal/protocol/deserialize_text_field.ipp was added
  /usr/include/boost/mysql/impl/internal/protocol/null_bitmap_traits.hpp was added
  /usr/include/boost/mysql/impl/internal/protocol/protocol_field_type.hpp was added
  /usr/include/boost/mysql/impl/internal/protocol/protocol_field_type.ipp was added
  /usr/include/boost/mysql/impl/internal/protocol/protocol.hpp was added
  /usr/include/boost/mysql/impl/internal/protocol/protocol.ipp was added
  /usr/include/boost/mysql/impl/internal/protocol/serialization.hpp was added
  /usr/include/boost/mysql/impl/internal/protocol/static_buffer.hpp was added
  /usr/include/boost/mysql/impl/meta_check_context.ipp was added
  /usr/include/boost/mysql/impl/network_algorithms.ipp was added
  /usr/include/boost/mysql/impl/resultset.ipp was added
  /usr/include/boost/mysql/impl/results_impl.ipp was added
  /usr/include/boost/mysql/impl/row_impl.ipp was added
  /usr/include/boost/mysql/impl/static_execution_state_impl.ipp was added
  /usr/include/boost/mysql/impl/static_results_impl.ipp was added
  /usr/include/boost/mysql/resultset.hpp was added
  /usr/include/boost/mysql/resultset_view.hpp was added
  /usr/include/boost/mysql/src.hpp was added
  /usr/include/boost/mysql/static_execution_state.hpp was added
  /usr/include/boost/mysql/static_results.hpp was added
  /usr/include/boost/outcome/experimental/status-code/status-code/nested_status_code.hpp was added
  /usr/include/boost/unordered/concurrent_flat_map_fwd.hpp was added
  /usr/include/boost/unordered/concurrent_flat_map.hpp was added
  /usr/include/boost/unordered/detail/foa/concurrent_table.hpp was added
  /usr/include/boost/unordered/detail/foa/core.hpp was added
  /usr/include/boost/unordered/detail/foa/flat_map_types.hpp was added
  /usr/include/boost/unordered/detail/foa/flat_set_types.hpp was added
  /usr/include/boost/unordered/detail/foa/ignore_wshadow.hpp was added
  /usr/include/boost/unordered/detail/foa/node_map_types.hpp was added
  /usr/include/boost/unordered/detail/foa/node_set_types.hpp was added
  /usr/include/boost/unordered/detail/foa/restore_wshadow.hpp was added
  /usr/include/boost/unordered/detail/foa/rw_spinlock.hpp was added
  /usr/include/boost/unordered/detail/foa/table.hpp was added
  /usr/include/boost/unordered/detail/foa/tuple_rotate_right.hpp was added
  /usr/include/boost/url/rfc/detail/ipv6_addrz_rule.hpp was added
  /usr/include/boost/mysql/detail/auth was removed
  /usr/include/boost/mysql/detail/auth/auth_calculator.hpp was removed
  /usr/include/boost/mysql/detail/auth/caching_sha2_password.hpp was removed
  /usr/include/boost/mysql/detail/auth/impl was removed
  /usr/include/boost/mysql/detail/auth/impl/auth_calculator.ipp was removed
  /usr/include/boost/mysql/detail/auth/impl/caching_sha2_password.ipp was removed
  /usr/include/boost/mysql/detail/auth/impl/mysql_native_password.ipp was removed
  /usr/include/boost/mysql/detail/auth/mysql_native_password.hpp was removed
  /usr/include/boost/mysql/detail/auxiliar was removed
  /usr/include/boost/mysql/detail/auxiliar/access_fwd.hpp was removed
  /usr/include/boost/mysql/detail/auxiliar/bytestring.hpp was removed
  /usr/include/boost/mysql/detail/auxiliar/datetime.hpp was removed
  /usr/include/boost/mysql/detail/auxiliar/error_helpers.hpp was removed
  /usr/include/boost/mysql/detail/auxiliar/field_impl.hpp was removed
  /usr/include/boost/mysql/detail/auxiliar/field_type_traits.hpp was removed
  /usr/include/boost/mysql/detail/auxiliar/impl was removed
  /usr/include/boost/mysql/detail/auxiliar/impl/datetime.hpp was removed
  /usr/include/boost/mysql/detail/auxiliar/impl/row_base.ipp was removed
  /usr/include/boost/mysql/detail/auxiliar/make_string_view.hpp was removed
  /usr/include/boost/mysql/detail/auxiliar/rebind_executor.hpp was removed
  /usr/include/boost/mysql/detail/auxiliar/row_base.hpp was removed
  /usr/include/boost/mysql/detail/auxiliar/rows_iterator.hpp was removed
  /usr/include/boost/mysql/detail/auxiliar/server_errc_strings.hpp was removed
  /usr/include/boost/mysql/detail/auxiliar/static_string.hpp was removed
  /usr/include/boost/mysql/detail/auxiliar/stringize.hpp was removed
  /usr/include/boost/mysql/detail/auxiliar/string_view_offset.hpp was removed
  /usr/include/boost/mysql/detail/auxiliar/valgrind.hpp was removed
  /usr/include/boost/mysql/detail/auxiliar/void_t.hpp was removed
  /usr/include/boost/mysql/detail/channel was removed
  /usr/include/boost/mysql/detail/channel/channel.hpp was removed
  /usr/include/boost/mysql/detail/channel/disableable_ssl_stream.hpp was removed
  /usr/include/boost/mysql/detail/channel/impl was removed
  /usr/include/boost/mysql/detail/channel/impl/disableable_ssl_stream.hpp was removed
  /usr/include/boost/mysql/detail/channel/impl/message_parser.ipp was removed
  /usr/include/boost/mysql/detail/channel/impl/message_reader.hpp was removed
  /usr/include/boost/mysql/detail/channel/impl/message_writer.hpp was removed
  /usr/include/boost/mysql/detail/channel/impl/read_buffer.ipp was removed
  /usr/include/boost/mysql/detail/channel/message_parser.hpp was removed
  /usr/include/boost/mysql/detail/channel/message_reader.hpp was removed
  /usr/include/boost/mysql/detail/channel/message_writer.hpp was removed
  /usr/include/boost/mysql/detail/channel/message_writer_processor.hpp was removed
  /usr/include/boost/mysql/detail/channel/read_buffer.hpp was removed
  /usr/include/boost/mysql/detail/network_algorithms was removed
  /usr/include/boost/mysql/detail/network_algorithms/close_connection.hpp was removed
  /usr/include/boost/mysql/detail/network_algorithms/close_statement.hpp was removed
  /usr/include/boost/mysql/detail/network_algorithms/connect.hpp was removed
  /usr/include/boost/mysql/detail/network_algorithms/execute_statement.hpp was removed
  /usr/include/boost/mysql/detail/network_algorithms/handshake.hpp was removed
  /usr/include/boost/mysql/detail/network_algorithms/impl was removed
  /usr/include/boost/mysql/detail/network_algorithms/impl/close_connection.hpp was removed
  /usr/include/boost/mysql/detail/network_algorithms/impl/close_statement.hpp was removed
  /usr/include/boost/mysql/detail/network_algorithms/impl/connect.hpp was removed
  /usr/include/boost/mysql/detail/network_algorithms/impl/execute_statement.hpp was removed
  /usr/include/boost/mysql/detail/network_algorithms/impl/handshake.hpp was removed
  /usr/include/boost/mysql/detail/network_algorithms/impl/ping.hpp was removed
  /usr/include/boost/mysql/detail/network_algorithms/impl/prepare_statement.hpp was removed
  /usr/include/boost/mysql/detail/network_algorithms/impl/query.hpp was removed
  /usr/include/boost/mysql/detail/network_algorithms/impl/quit_connection.hpp was removed
  /usr/include/boost/mysql/detail/network_algorithms/impl/read_all_rows.hpp was removed
  /usr/include/boost/mysql/detail/network_algorithms/impl/read_some_rows.hpp was removed
  /usr/include/boost/mysql/detail/network_algorithms/impl/start_execution_generic.hpp was removed
  /usr/include/boost/mysql/detail/network_algorithms/impl/start_query.hpp was removed
  /usr/include/boost/mysql/detail/network_algorithms/impl/start_statement_execution.hpp was removed
  /usr/include/boost/mysql/detail/network_algorithms/ping.hpp was removed
  /usr/include/boost/mysql/detail/network_algorithms/prepare_statement.hpp was removed
  /usr/include/boost/mysql/detail/network_algorithms/query.hpp was removed
  /usr/include/boost/mysql/detail/network_algorithms/quit_connection.hpp was removed
  /usr/include/boost/mysql/detail/network_algorithms/read_all_rows.hpp was removed
  /usr/include/boost/mysql/detail/network_algorithms/read_some_rows.hpp was removed
  /usr/include/boost/mysql/detail/network_algorithms/start_execution_generic.hpp was removed
  /usr/include/boost/mysql/detail/network_algorithms/start_query.hpp was removed
  /usr/include/boost/mysql/detail/network_algorithms/start_statement_execution.hpp was removed
  /usr/include/boost/mysql/detail/protocol was removed
  /usr/include/boost/mysql/detail/protocol/binary_serialization.hpp was removed
  /usr/include/boost/mysql/detail/protocol/bit_deserialization.hpp was removed
  /usr/include/boost/mysql/detail/protocol/capabilities.hpp was removed
  /usr/include/boost/mysql/detail/protocol/common_messages.hpp was removed
  /usr/include/boost/mysql/detail/protocol/constants.hpp was removed
  /usr/include/boost/mysql/detail/protocol/db_flavor.hpp was removed
  /usr/include/boost/mysql/detail/protocol/deserialization_context.hpp was removed
  /usr/include/boost/mysql/detail/protocol/deserialize_binary_field.hpp was removed
  /usr/include/boost/mysql/detail/protocol/deserialize_errc.hpp was removed
  /usr/include/boost/mysql/detail/protocol/deserialize_row.hpp was removed
  /usr/include/boost/mysql/detail/protocol/deserialize_text_field.hpp was removed
  /usr/include/boost/mysql/detail/protocol/handshake_messages.hpp was removed
  /usr/include/boost/mysql/detail/protocol/impl was removed
  /usr/include/boost/mysql/detail/protocol/impl/binary_serialization.ipp was removed
  /usr/include/boost/mysql/detail/protocol/impl/common_messages.ipp was removed
  /usr/include/boost/mysql/detail/protocol/impl/deserialize_binary_field.ipp was removed
  /usr/include/boost/mysql/detail/protocol/impl/deserialize_row.ipp was removed
  /usr/include/boost/mysql/detail/protocol/impl/deserialize_text_field.ipp was removed
  /usr/include/boost/mysql/detail/protocol/impl/handshake_messages.ipp was removed
  /usr/include/boost/mysql/detail/protocol/impl/prepared_statement_messages.hpp was removed
  /usr/include/boost/mysql/detail/protocol/impl/process_error_packet.ipp was removed
  /usr/include/boost/mysql/detail/protocol/impl/serialization.hpp was removed
  /usr/include/boost/mysql/detail/protocol/impl/serialization.ipp was removed
  /usr/include/boost/mysql/detail/protocol/null_bitmap_traits.hpp was removed
  /usr/include/boost/mysql/detail/protocol/prepared_statement_messages.hpp was removed
  /usr/include/boost/mysql/detail/protocol/process_error_packet.hpp was removed
  /usr/include/boost/mysql/detail/protocol/protocol_types.hpp was removed
  /usr/include/boost/mysql/detail/protocol/query_messages.hpp was removed
  /usr/include/boost/mysql/detail/protocol/resultset_encoding.hpp was removed
  /usr/include/boost/mysql/detail/protocol/serialization_context.hpp was removed
  /usr/include/boost/mysql/detail/protocol/serialization.hpp was removed
  /usr/include/boost/mysql/impl/connection.hpp was removed
  /usr/include/boost/mysql/impl/date.hpp was removed
  /usr/include/boost/mysql/impl/datetime.hpp was removed
  /usr/include/boost/mysql/impl/diagnostics.hpp was removed
  /usr/include/boost/mysql/impl/error_categories.hpp was removed
  /usr/include/boost/mysql/impl/execution_state.hpp was removed
  /usr/include/boost/mysql/impl/field.hpp was removed
  /usr/include/boost/mysql/impl/metadata.hpp was removed
  /usr/include/boost/mysql/impl/results.hpp was removed
  /usr/include/boost/mysql/impl/rows.hpp was removed
  /usr/include/boost/mysql/impl/rows_view.hpp was removed
  /usr/include/boost/mysql/impl/row_view.hpp was removed
  /usr/include/boost/outcome/experimental/status-code/status-code/status_code_ptr.hpp was removed
  /usr/include/boost/smart_ptr/detail/sp_win32_sleep.hpp was removed
  /usr/include/boost/unordered/detail/foa.hpp was removed
  /usr/include/boost/url/detail/impl/any_params_iter.ipp was removed
  /usr/include/boost/url/detail/impl/any_segments_iter.ipp was removed
  /usr/include/boost/url/detail/impl/decode.ipp was removed
  /usr/include/boost/url/detail/impl/except.ipp was removed
  /usr/include/boost/url/detail/impl/format_args.ipp was removed
  /usr/include/boost/url/detail/impl/normalize.ipp was removed
  /usr/include/boost/url/detail/impl/params_iter_impl.ipp was removed
  /usr/include/boost/url/detail/impl/path.ipp was removed
  /usr/include/boost/url/detail/impl/pattern.ipp was removed
  /usr/include/boost/url/detail/impl/pct_format.ipp was removed
  /usr/include/boost/url/detail/impl/replacement_field_rule.ipp was removed
  /usr/include/boost/url/detail/impl/segments_iter_impl.ipp was removed
  /usr/include/boost/url/detail/impl/url_impl.ipp was removed
  /usr/include/boost/url/grammar/detail/impl was removed
  /usr/include/boost/url/grammar/detail/impl/ci_string.ipp was removed
  /usr/include/boost/url/grammar/detail/impl/recycled.ipp was removed
  /usr/include/boost/url/grammar/impl/ci_string.ipp was removed
  /usr/include/boost/url/grammar/impl/dec_octet_rule.ipp was removed
  /usr/include/boost/url/grammar/impl/delim_rule.ipp was removed
  /usr/include/boost/url/grammar/impl/error.ipp was removed
  /usr/include/boost/url/grammar/impl/literal_rule.ipp was removed
  /usr/include/boost/url/grammar/impl/string_view_base.ipp was removed
  /usr/include/boost/url/impl/authority_view.ipp was removed
  /usr/include/boost/url/impl/decode_view.ipp was removed
  /usr/include/boost/url/impl/error.ipp was removed
  /usr/include/boost/url/impl/ipv4_address.ipp was removed
  /usr/include/boost/url/impl/ipv6_address.ipp was removed
  /usr/include/boost/url/impl/params_base.ipp was removed
  /usr/include/boost/url/impl/params_encoded_base.ipp was removed
  /usr/include/boost/url/impl/params_encoded_ref.ipp was removed
  /usr/include/boost/url/impl/params_encoded_view.ipp was removed
  /usr/include/boost/url/impl/params_ref.ipp was removed
  /usr/include/boost/url/impl/params_view.ipp was removed
  /usr/include/boost/url/impl/parse.ipp was removed
  /usr/include/boost/url/impl/parse_path.ipp was removed
  /usr/include/boost/url/impl/parse_query.ipp was removed
  /usr/include/boost/url/impl/pct_string_view.ipp was removed
  /usr/include/boost/url/impl/scheme.ipp was removed
  /usr/include/boost/url/impl/segments_base.ipp was removed
  /usr/include/boost/url/impl/segments_encoded_base.ipp was removed
  /usr/include/boost/url/impl/segments_encoded_ref.ipp was removed
  /usr/include/boost/url/impl/segments_encoded_view.ipp was removed
  /usr/include/boost/url/impl/segments_ref.ipp was removed
  /usr/include/boost/url/impl/segments_view.ipp was removed
  /usr/include/boost/url/impl/static_url.ipp was removed
  /usr/include/boost/url/impl/url_base.ipp was removed
  /usr/include/boost/url/impl/url.ipp was removed
  /usr/include/boost/url/impl/url_view_base.ipp was removed
  /usr/include/boost/url/impl/url_view.ipp was removed
  /usr/include/boost/url/rfc/detail/impl was removed
  /usr/include/boost/url/rfc/detail/impl/h16_rule.ipp was removed
  /usr/include/boost/url/rfc/detail/impl/hier_part_rule.ipp was removed
  /usr/include/boost/url/rfc/detail/impl/host_rule.ipp was removed
  /usr/include/boost/url/rfc/detail/impl/ip_literal_rule.ipp was removed
  /usr/include/boost/url/rfc/detail/impl/ipvfuture_rule.ipp was removed
  /usr/include/boost/url/rfc/detail/impl/port_rule.ipp was removed
  /usr/include/boost/url/rfc/detail/impl/relative_part_rule.ipp was removed
  /usr/include/boost/url/rfc/detail/impl/scheme_rule.ipp was removed
  /usr/include/boost/url/rfc/detail/impl/userinfo_rule.ipp was removed
  /usr/include/boost/url/rfc/impl/absolute_uri_rule.ipp was removed
  /usr/include/boost/url/rfc/impl/authority_rule.ipp was removed
  /usr/include/boost/url/rfc/impl/ipv4_address_rule.ipp was removed
  /usr/include/boost/url/rfc/impl/ipv6_address_rule.ipp was removed
  /usr/include/boost/url/rfc/impl/origin_form_rule.ipp was removed
  /usr/include/boost/url/rfc/impl/query_rule.ipp was removed
  /usr/include/boost/url/rfc/impl/relative_ref_rule.ipp was removed
  /usr/include/boost/url/rfc/impl/uri_reference_rule.ipp was removed
  /usr/include/boost/url/rfc/impl/uri_rule.ipp was removed

--===============2272796562390975066==--

