Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48832CD98E7
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:31:50 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50611.1781195502460528921
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:31:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=R+AzlUY9;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Z/jJ9zQR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019eb7866ff0-fc9322d7-5b18-47d3-81f3-84ba28fadffc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195501;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8NMW65XH1MfSwYoLNEHd/CsgY4y2pV9kTqPC70pQu34=;
	b=R+AzlUY9wl1wQ4xU7kryOXmoSw88WuOGZqCxDPCzOPWn579NjQeERPA/qhQ7kfCE
	90cuYDItGnJ/nyptFcMWyz/kwmwW8/9HbhWheVPq17V7CPUS3Xb/m3NbGyrvVm1SKLz
	CSdOZQmMmGwWD1t1Rh2sctq+uP6L4Wm0k7wEGxXc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195501;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8NMW65XH1MfSwYoLNEHd/CsgY4y2pV9kTqPC70pQu34=;
	b=Z/jJ9zQRzKM4F7vmWpFRfLj18716UBnT8wVLMf065MarC+9HEp7nQ2G14VF5Yp6A
	ntHFdC0AscrBWJrYDh4wvXWvVgmBFw3sKH/T/1+7L/07osu/9gSITh7padTAG+g4afn
	VG9Xy/sWcVHintD59hnvSfn9M7IgabycoDjzKWZ0=
Content-Type: multipart/mixed; boundary="===============2420894342499468276=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] file: upgrading to 5.48 SUCCEEDED
Message-ID: <0101019eb7866ff0-fc9322d7-5b18-47d3-81f3-84ba28fadffc-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:31:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:31:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238484

--===============2420894342499468276==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *file* to *5.48* has Succeeded.

Next steps:
    - apply the patch: git am 0001-file-upgrade-5.47-5.48.patch
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
From 1cdfa168812511980559edb8722a50de4833be19 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 09:04:23 +0000
Subject: [PATCH] file: upgrade 5.47 -> 5.48

---
 meta/recipes-devtools/file/{file_5.47.bb => file_5.48.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/file/{file_5.47.bb => file_5.48.bb} (97%)

diff --git a/meta/recipes-devtools/file/file_5.47.bb b/meta/recipes-devtools/file/file_5.48.bb
similarity index 97%
rename from meta/recipes-devtools/file/file_5.47.bb
rename to meta/recipes-devtools/file/file_5.48.bb
index 528ed49a12..20e167f436 100644
--- a/meta/recipes-devtools/file/file_5.47.bb
+++ b/meta/recipes-devtools/file/file_5.48.bb
@@ -14,7 +14,7 @@ DEPENDS:class-native = "bzip2-replacement-native"
 SRC_URI = "git://github.com/file/file.git;branch=master;protocol=https \
            "
 
-SRCREV = "7d20612996567ecedec7f5c58f7bf15c2cf42c19"
+SRCREV = "eb754ace19fed5481d8142426543100a2d6bae4e"
 
 inherit autotools update-alternatives
 
-- 
2.47.1


--===============2420894342499468276==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-file-upgrade-5.47-5.48.patch"

RnJvbSAxY2RmYTE2ODgxMjUxMTk4MDU1OWVkYjg3MjJhNTBkZTQ4MzNiZTE5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMDk6MDQ6MjMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBm
aWxlOiB1cGdyYWRlIDUuNDcgLT4gNS40OAoKLS0tCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZmls
ZS97ZmlsZV81LjQ3LmJiID0+IGZpbGVfNS40OC5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvZmlsZS97ZmlsZV81LjQ3LmJiID0+IGZpbGVfNS40OC5iYn0gKDk3JSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZmlsZS9maWxlXzUuNDcuYmIgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvZmlsZS9maWxlXzUuNDguYmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2ZpbGUvZmlsZV81LjQ3LmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZmlsZS9maWxlXzUuNDguYmIKaW5kZXggNTI4ZWQ0OWExMi4uMjBl
MTY3ZjQzNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2ZpbGUvZmlsZV81LjQ3
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9maWxlL2ZpbGVfNS40OC5iYgpAQCAtMTQs
NyArMTQsNyBAQCBERVBFTkRTOmNsYXNzLW5hdGl2ZSA9ICJiemlwMi1yZXBsYWNlbWVudC1uYXRp
dmUiCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vZmlsZS9maWxlLmdpdDticmFuY2g9bWFz
dGVyO3Byb3RvY29sPWh0dHBzIFwKICAgICAgICAgICAgIgogCi1TUkNSRVYgPSAiN2QyMDYxMjk5
NjU2N2VjZWRlYzdmNWM1OGY3YmYxNWMyY2Y0MmMxOSIKK1NSQ1JFViA9ICJlYjc1NGFjZTE5ZmVk
NTQ4MWQ4MTQyNDI2NTQzMTAwYTJkNmJhZTRlIgogCiBpbmhlcml0IGF1dG90b29scyB1cGRhdGUt
YWx0ZXJuYXRpdmVzCiAKLS0gCjIuNDcuMQoK

--===============2420894342499468276==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/file/file-dbg: PKGSIZE changed from 684584 to 697776 (+2%)
packages/x86-64-v3-poky-linux/file/file-dbg: PV changed from "5.47" to "5.48"
packages/x86-64-v3-poky-linux/file/file-dbg: PKGV changed from 5.47 [default] to 5.48 [default]
packages/x86-64-v3-poky-linux/file/file-dev: PKGSIZE changed from 6326 to 6358 (+1%)
packages/x86-64-v3-poky-linux/file/file-dev: PV changed from "5.47" to "5.48"
packages/x86-64-v3-poky-linux/file/file-dev: PKGV changed from 5.47 [default] to 5.48 [default]
packages/x86-64-v3-poky-linux/file/file-doc: PKGSIZE changed from 61100 to 61162 (+0%)
packages/x86-64-v3-poky-linux/file/file-doc: PV changed from "5.47" to "5.48"
packages/x86-64-v3-poky-linux/file/file-doc: PKGV changed from 5.47 [default] to 5.48 [default]
packages/x86-64-v3-poky-linux/file/file-locale: PV changed from "5.47" to "5.48"
packages/x86-64-v3-poky-linux/file/file-locale: PKGV changed from 5.47 [default] to 5.48 [default]
packages/x86-64-v3-poky-linux/file/file-src: PKGSIZE changed from 528053 to 540766 (+2%)
packages/x86-64-v3-poky-linux/file/file-src: FILELIST: removed "/usr/src/debug/file/5.47/src/fsmagic.c /usr/src/debug/file/5.47/src/apptype.c /usr/src/debug/file/5.47/src/ascmagic.c /usr/src/debug/file/5.47/src/elfclass.h /usr/src/debug/file/5.47/src/cdf_time.c /usr/src/debug/file/5.47/src/fmtcheck.c /usr/src/debug/file/5.47/src/is_json.c /usr/src/debug/file/5.47/src/is_csv.c /usr/src/debug/file/5.47/src/file.c /usr/src/debug/file/5.47/src/cdf.h /usr/src/debug/file/5.47/src/der.h /usr/src/debug/file/5.47/src/tar.h /usr/src/debug/file/5.47/src/apprentice.c /usr/src/debug/file/5.47/src/cdf.c /usr/src/debug/file/5.47/src/encoding.c /usr/src/debug/file/5.47/src/der.c /usr/src/debug/file/5.47/src/file.h /usr/src/debug/file/5.47/src/file_opts.h /usr/src/debug/file/5.47/src/magic.h /usr/src/debug/file/5.47/src/softmagic.c /usr/src/debug/file/5.47/src/readcdf.c /usr/src/debug/file/5.47/src/magic.c /usr/src/debug/file/5.47/src/readelf.c /usr/src/debug/file/5.47/src/funcs.c /usr/src/debug/file
 /5.47/src/is_tar.c /usr/src/debug/file/5.47/src/readelf.h /usr/src/debug/file/5.47/src/seccomp.c /usr/src/debug/file/5.47/src/compress.c /usr/src/debug/file/5.47/src/is_simh.c /usr/src/debug/file/5.47/src/print.c /usr/src/debug/file/5.47/src/buffer.c", added "/usr/src/debug/file/5.48/src/fsmagic.c /usr/src/debug/file/5.48/src/swap.c /usr/src/debug/file/5.48/src/apptype.c /usr/src/debug/file/5.48/src/ascmagic.c /usr/src/debug/file/5.48/src/elfclass.h /usr/src/debug/file/5.48/src/cdf_time.c /usr/src/debug/file/5.48/src/fmtcheck.c /usr/src/debug/file/5.48/src/is_json.c /usr/src/debug/file/5.48/src/is_csv.c /usr/src/debug/file/5.48/src/file.c /usr/src/debug/file/5.48/src/cdf.h /usr/src/debug/file/5.48/src/der.h /usr/src/debug/file/5.48/src/tar.h /usr/src/debug/file/5.48/src/apprentice.c /usr/src/debug/file/5.48/src/cdf.c /usr/src/debug/file/5.48/src/encoding.c /usr/src/debug/file/5.48/src/der.c /usr/src/debug/file/5.48/src/file.h /usr/src/debug/file/5.48/src/file_opts.h /usr/src/debug/f
 ile/5.48/src/magic.h /usr/src/debug/file/5.48/src/softmagic.c /usr/src/debug/file/5.48/src/readcdf.c /usr/src/debug/file/5.48/src/magic.c /usr/src/debug/file/5.48/src/readelf.c /usr/src/debug/file/5.48/src/funcs.c /usr/src/debug/file/5.48/src/is_tar.c /usr/src/debug/file/5.48/src/readelf.h /usr/src/debug/file/5.48/src/buffer.c /usr/src/debug/file/5.48/src/seccomp.c /usr/src/debug/file/5.48/src/compress.c /usr/src/debug/file/5.48/src/is_simh.c /usr/src/debug/file/5.48/src/print.c /usr/src/debug/file/5.48/src/landlock.c"
packages/x86-64-v3-poky-linux/file/file-src: PV changed from "5.47" to "5.48"
packages/x86-64-v3-poky-linux/file/file-src: PKGV changed from 5.47 [default] to 5.48 [default]
packages/x86-64-v3-poky-linux/file/file-staticdev: PV changed from "5.47" to "5.48"
packages/x86-64-v3-poky-linux/file/file-staticdev: PKGV changed from 5.47 [default] to 5.48 [default]
packages/x86-64-v3-poky-linux/file/file: PKGSIZE changed from 10876257 to 11016001 (+1%)
packages/x86-64-v3-poky-linux/file/file: PV changed from "5.47" to "5.48"
packages/x86-64-v3-poky-linux/file/file: PKGV changed from 5.47 [default] to 5.48 [default]
packages/x86-64-v3-poky-linux/file: PKGV changed from 5.47 [default] to 5.48 [default]
packages/x86-64-v3-poky-linux/file: PV changed from "5.47" to "5.48"

--===============2420894342499468276==--

