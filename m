Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ED3DC54EB9
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:32:36 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.20152.1708018343881316405
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:32:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=KxYi/SZg;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=e0auWgo/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018dadd3a62f-2ff41ba8-0ce8-42e3-9290-4ec9812cb544-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1708018345;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=sbPhUgyhBJQRibU/G8/citpWQcG5OuqSQr3Rnb4/lqI=;
	b=KxYi/SZgMAxtRBYBp3+GSmXoKRRs1F8XVlcHyzzJc26YCDnADyWDSwEYT+PMVQg1
	VfaB48UJObYY/eYi6bkfkiJLVjc1kc5cS191GvkiaShN9Rbr6otR4as8qXMvmE+trE1
	MyS/+oX88QP0jqhX+6lYzYH/MeFCWeLcfpOjigSc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1708018345;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=sbPhUgyhBJQRibU/G8/citpWQcG5OuqSQr3Rnb4/lqI=;
	b=e0auWgo/eFoei1niy2ZzGl2/nAyTzhRM5G3eQ7YRmiDmC1+AGwd6XA/L2Oroo8WF
	Tlm0kYUdEN0vypHtDMamU+756APygIK7P9PuMyYDoyry7em4P6g85lIjqJE6U0ihGdT
	d8Zhr/HHhmbVjkRQkcJrgToSHOGqs+UHIIo7x5n8=
Content-Type: multipart/mixed; boundary="===============0321425950547229631=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mc: upgrading to 4.8.31 SUCCEEDED
Message-ID: <0101018dadd3a62f-2ff41ba8-0ce8-42e3-9290-4ec9812cb544-000000@us-west-2.amazonses.com>
Date: Thu, 15 Feb 2024 17:32:25 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195610

--===============0321425950547229631==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mc* to *4.8.31* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mc-upgrade-4.8.30-4.8.31.patch
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
From a28fbca6ac2d7d448151d163d5ffc67a5993eacc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Feb 2024 11:41:52 +0000
Subject: [PATCH] mc: upgrade 4.8.30 -> 4.8.31

---
 meta/recipes-extended/mc/files/nomandate.patch          | 4 ++--
 meta/recipes-extended/mc/{mc_4.8.30.bb => mc_4.8.31.bb} | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/mc/{mc_4.8.30.bb => mc_4.8.31.bb} (97%)

diff --git a/meta/recipes-extended/mc/files/nomandate.patch b/meta/recipes-extended/mc/files/nomandate.patch
index 4ebaaa2fa7..aa88c6c3b6 100644
--- a/meta/recipes-extended/mc/files/nomandate.patch
+++ b/meta/recipes-extended/mc/files/nomandate.patch
@@ -1,4 +1,4 @@
-From 4482ed0b8bd506cc2590ceacfdada6cc34450796 Mon Sep 17 00:00:00 2001
+From 771edfd3d7922b9babb7e38830179b9cd0040957 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 4 Feb 2020 18:12:15 +0000
 Subject: [PATCH] mc: Fix manpage date indeterminism
@@ -21,7 +21,7 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/doc/man/date-of-man-include.am b/doc/man/date-of-man-include.am
-index c6b1e69..165a796 100644
+index 96f9f10..d734c5d 100644
 --- a/doc/man/date-of-man-include.am
 +++ b/doc/man/date-of-man-include.am
 @@ -1,5 +1,5 @@
diff --git a/meta/recipes-extended/mc/mc_4.8.30.bb b/meta/recipes-extended/mc/mc_4.8.31.bb
similarity index 97%
rename from meta/recipes-extended/mc/mc_4.8.30.bb
rename to meta/recipes-extended/mc/mc_4.8.31.bb
index 258ac38e15..b6e5a1f98c 100644
--- a/meta/recipes-extended/mc/mc_4.8.30.bb
+++ b/meta/recipes-extended/mc/mc_4.8.31.bb
@@ -11,7 +11,7 @@ RRECOMMENDS:${PN} = "ncurses-terminfo"
 SRC_URI = "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.bz2 \
            file://nomandate.patch \
            "
-SRC_URI[sha256sum] = "38171f22f889e3030ec9055463d3ecd7843984ab24e6497d8294d1c441a7ddb4"
+SRC_URI[sha256sum] = "f42f4114ed42f6cf9995f1d896fa6c797ccb36dac57760dda8dd9f78ac462841"
 
 inherit autotools gettext pkgconfig
 
-- 
2.42.0


--===============0321425950547229631==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mc-upgrade-4.8.30-4.8.31.patch"

RnJvbSBhMjhmYmNhNmFjMmQ3ZDQ0ODE1MWQxNjNkNWZmYzY3YTU5OTNlYWNjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRmViIDIwMjQgMTE6NDE6NTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
YzogdXBncmFkZSA0LjguMzAgLT4gNC44LjMxCgotLS0KIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9t
Yy9maWxlcy9ub21hbmRhdGUucGF0Y2ggICAgICAgICAgfCA0ICsrLS0KIG1ldGEvcmVjaXBlcy1l
eHRlbmRlZC9tYy97bWNfNC44LjMwLmJiID0+IG1jXzQuOC4zMS5iYn0gfCAyICstCiAyIGZpbGVz
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvbWMve21jXzQuOC4zMC5iYiA9PiBtY180LjguMzEuYmJ9ICg5NyUpCgpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL21jL2ZpbGVzL25vbWFuZGF0ZS5wYXRj
aCBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9tYy9maWxlcy9ub21hbmRhdGUucGF0Y2gKaW5kZXgg
NGViYWFhMmZhNy4uYWE4OGM2YzNiNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L21jL2ZpbGVzL25vbWFuZGF0ZS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbWMv
ZmlsZXMvbm9tYW5kYXRlLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA0NDgyZWQwYjhiZDUw
NmNjMjU5MGNlYWNmZGFkYTZjYzM0NDUwNzk2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSA3NzFlZGZkM2Q3OTIyYjliYWJiN2UzODgzMDE3OWI5Y2QwMDQwOTU3IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91
bmRhdGlvbi5vcmc+CiBEYXRlOiBUdWUsIDQgRmViIDIwMjAgMTg6MTI6MTUgKzAwMDAKIFN1Ympl
Y3Q6IFtQQVRDSF0gbWM6IEZpeCBtYW5wYWdlIGRhdGUgaW5kZXRlcm1pbmlzbQpAQCAtMjEsNyAr
MjEsNyBAQCBTaWduZWQtb2ZmLWJ5OiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGlu
dXhmb3VuZGF0aW9uLm9yZz4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL2RvYy9tYW4vZGF0ZS1vZi1tYW4taW5jbHVkZS5hbSBi
L2RvYy9tYW4vZGF0ZS1vZi1tYW4taW5jbHVkZS5hbQotaW5kZXggYzZiMWU2OS4uMTY1YTc5NiAx
MDA2NDQKK2luZGV4IDk2ZjlmMTAuLmQ3MzRjNWQgMTAwNjQ0CiAtLS0gYS9kb2MvbWFuL2RhdGUt
b2YtbWFuLWluY2x1ZGUuYW0KICsrKyBiL2RvYy9tYW4vZGF0ZS1vZi1tYW4taW5jbHVkZS5hbQog
QEAgLTEsNSArMSw1IEBACmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbWMvbWNf
NC44LjMwLmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL21jL21jXzQuOC4zMS5iYgpzaW1pbGFy
aXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbWMvbWNfNC44
LjMwLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbWMvbWNfNC44LjMxLmJiCmlu
ZGV4IDI1OGFjMzhlMTUuLmI2ZTVhMWY5OGMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRl
bmRlZC9tYy9tY180LjguMzAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL21jL21jXzQu
OC4zMS5iYgpAQCAtMTEsNyArMTEsNyBAQCBSUkVDT01NRU5EUzoke1BOfSA9ICJuY3Vyc2VzLXRl
cm1pbmZvIgogU1JDX1VSSSA9ICJodHRwOi8vd3d3Lm1pZG5pZ2h0LWNvbW1hbmRlci5vcmcvZG93
bmxvYWRzLyR7QlBOfS0ke1BWfS50YXIuYnoyIFwKICAgICAgICAgICAgZmlsZTovL25vbWFuZGF0
ZS5wYXRjaCBcCiAgICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIzODE3MWYyMmY4
ODllMzAzMGVjOTA1NTQ2M2QzZWNkNzg0Mzk4NGFiMjRlNjQ5N2Q4Mjk0ZDFjNDQxYTdkZGI0Igor
U1JDX1VSSVtzaGEyNTZzdW1dID0gImY0MmY0MTE0ZWQ0MmY2Y2Y5OTk1ZjFkODk2ZmE2Yzc5N2Nj
YjM2ZGFjNTc3NjBkZGE4ZGQ5Zjc4YWM0NjI4NDEiCiAKIGluaGVyaXQgYXV0b3Rvb2xzIGdldHRl
eHQgcGtnY29uZmlnCiAKLS0gCjIuNDIuMAoK

--===============0321425950547229631==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/mc: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc: SRC_URI changed from "http://www.midnight-commander.org/downloads/mc-4.8.30.tar.bz2 file://nomandate.patch" to "http://www.midnight-commander.org/downloads/mc-4.8.31.tar.bz2 file://nomandate.patch"
packages/core2-64-poky-linux/mc/mc-dbg: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-dbg: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-dbg: PKGSIZE changed from 3960400 to 3963096 (+0%)
packages/core2-64-poky-linux/mc/mc-dev: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-dev: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-doc: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-doc: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-doc: PKGSIZE changed from 1083788 to 1083784 (-0%)
packages/core2-64-poky-linux/mc/mc-fish: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-fish: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-fish: FILELIST: removed all items "/usr/libexec/mc/fish/ln /usr/libexec/mc/fish/unlink /usr/libexec/mc/fish/get /usr/libexec/mc/fish/fexists /usr/libexec/mc/fish/mkdir /usr/libexec/mc/fish/rmdir /usr/libexec/mc/fish/ls /usr/libexec/mc/fish/mv /usr/libexec/mc/fish/hardlink /usr/libexec/mc/fish/append /usr/libexec/mc/fish/chown /usr/libexec/mc/fish/info /usr/libexec/mc/fish/utime /usr/libexec/mc/fish/README.fish /usr/libexec/mc/fish/send /usr/libexec/mc/fish/chmod"
packages/core2-64-poky-linux/mc/mc-fish: PKGSIZE changed from 17132 to 0 (-100%)
packages/core2-64-poky-linux/mc/mc-helpers-perl: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-helpers-perl: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-helpers-perl: PKGSIZE changed from 77901 to 78149 (+0%)
packages/core2-64-poky-linux/mc/mc-helpers: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-helpers: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-helpers: PKGSIZE changed from 103695 to 104333 (+1%)
packages/core2-64-poky-linux/mc/mc-locale-af: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-locale-af: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-locale-ar: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-locale-ar: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-locale-az: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-locale-az: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-locale-az: PKGSIZE changed from 20124 to 19405 (-4%)
packages/core2-64-poky-linux/mc/mc-locale-be: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-locale-be: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-locale-be: PKGSIZE changed from 113736 to 112778 (-1%)
packages/core2-64-poky-linux/mc/mc-locale-bg: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-locale-bg: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-locale-bg: PKGSIZE changed from 109171 to 105958 (-3%)
packages/core2-64-poky-linux/mc/mc-locale-br: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-locale-br: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-locale-ca: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-locale-ca: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-locale-ca: PKGSIZE changed from 94405 to 95292 (+1%)
packages/core2-64-poky-linux/mc/mc-locale-cs: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-locale-cs: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-locale-cs: PKGSIZE changed from 93878 to 90967 (-3%)
packages/core2-64-poky-linux/mc/mc-locale-da: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-locale-da: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-locale-da: PKGSIZE changed from 87310 to 84430 (-3%)
packages/core2-64-poky-linux/mc/mc-locale-de-ch: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-locale-de-ch: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-locale-de: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-locale-de: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-locale-de: PKGSIZE changed from 91265 to 89623 (-2%)
packages/core2-64-poky-linux/mc/mc-locale-el: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-locale-el: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-locale-el: PKGSIZE changed from 56398 to 55474 (-2%)
packages/core2-64-poky-linux/mc/mc-locale-en-gb: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-locale-en-gb: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-locale-en-gb: PKGSIZE changed from 26760 to 28330 (+6%)
packages/core2-64-poky-linux/mc/mc-locale-eo: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-locale-eo: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-locale-eo: PKGSIZE changed from 88898 to 87420 (-2%)
packages/core2-64-poky-linux/mc/mc-locale-es: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-locale-es: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-locale-es: PKGSIZE changed from 90242 to 90628 (+0%)
packages/core2-64-poky-linux/mc/mc-locale-et: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-locale-et: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-locale-et: PKGSIZE changed from 87323 to 88531 (+1%)
packages/core2-64-poky-linux/mc/mc-locale-eu: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-locale-eu: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-locale-eu: PKGSIZE changed from 81013 to 78149 (-4%)
packages/core2-64-poky-linux/mc/mc-locale-fa: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-locale-fa: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-locale-fi: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-locale-fi: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-locale-fi: PKGSIZE changed from 42747 to 42070 (-2%)
packages/core2-64-poky-linux/mc/mc-locale-fr-ca: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-locale-fr-ca: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-locale-fr: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-locale-fr: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-locale-fr: PKGSIZE changed from 95447 to 95947 (+1%)
packages/core2-64-poky-linux/mc/mc-locale-ga: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-locale-ga: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-locale-gl: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-locale-gl: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-locale-gl: PKGSIZE changed from 83304 to 80443 (-3%)
packages/core2-64-poky-linux/mc/mc-locale-he: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-locale-he: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-locale-hr: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-locale-hr: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-locale-hu: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-locale-hu: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-locale-hu: PKGSIZE changed from 77835 to 75033 (-4%)
packages/core2-64-poky-linux/mc/mc-locale-ia: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-locale-ia: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-locale-ia: PKGSIZE changed from 28589 to 27694 (-3%)
packages/core2-64-poky-linux/mc/mc-locale-id: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-locale-id: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-locale-ie: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-locale-ie: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-locale-ie: PKGSIZE changed from 19013 to 18924 (-0%)
packages/core2-64-poky-linux/mc/mc-locale-it: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-locale-it: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-locale-it: PKGSIZE changed from 88177 to 85228 (-3%)
packages/core2-64-poky-linux/mc/mc-locale-ja: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-locale-ja: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-locale-ja: PKGSIZE changed from 39067 to 38282 (-2%)
packages/core2-64-poky-linux/mc/mc-locale-ka: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-locale-ka: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-locale-ka: PKGSIZE changed from 69185 to 66443 (-4%)
packages/core2-64-poky-linux/mc/mc-locale-kk: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-locale-kk: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-locale-ko: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-locale-ko: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-locale-ko: PKGSIZE changed from 93470 to 90903 (-3%)
packages/core2-64-poky-linux/mc/mc-locale-kw: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-locale-kw: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-locale-lt: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-locale-lt: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-locale-lt: PKGSIZE changed from 48043 to 47340 (-1%)
packages/core2-64-poky-linux/mc/mc-locale-lv: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-locale-lv: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-locale-lv: PKGSIZE changed from 19415 to 18714 (-4%)
packages/core2-64-poky-linux/mc/mc-locale-mn: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-locale-mn: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-locale-mn: PKGSIZE changed from 31118 to 30266 (-3%)
packages/core2-64-poky-linux/mc/mc-locale-nb: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-locale-nb: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-locale-nb: PKGSIZE changed from 87563 to 87880 (+0%)
packages/core2-64-poky-linux/mc/mc-locale-nl-be: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-locale-nl-be: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-locale-nl: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-locale-nl: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-locale-nl: PKGSIZE changed from 87731 to 84912 (-3%)
packages/core2-64-poky-linux/mc/mc-locale-pl: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-locale-pl: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-locale-pl: PKGSIZE changed from 92888 to 93284 (+0%)
packages/core2-64-poky-linux/mc/mc-locale-pt-br: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-locale-pt-br: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-locale-pt-br: PKGSIZE changed from 97486 to 97891 (+0%)
packages/core2-64-poky-linux/mc/mc-locale-pt: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-locale-pt: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-locale-pt: PKGSIZE changed from 91990 to 92306 (+0%)
packages/core2-64-poky-linux/mc/mc-locale-ro: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-locale-ro: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-locale-ro: PKGSIZE changed from 91588 to 88756 (-3%)
packages/core2-64-poky-linux/mc/mc-locale-ru: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-locale-ru: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-locale-ru: PKGSIZE changed from 115135 to 113548 (-1%)
packages/core2-64-poky-linux/mc/mc-locale-sk: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-locale-sk: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-locale-sk: PKGSIZE changed from 82273 to 79477 (-3%)
packages/core2-64-poky-linux/mc/mc-locale-sl: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-locale-sl: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-locale-sl: PKGSIZE changed from 22865 to 22131 (-3%)
packages/core2-64-poky-linux/mc/mc-locale-sr: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-locale-sr: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-locale-sr: PKGSIZE changed from 96511 to 93427 (-3%)
packages/core2-64-poky-linux/mc/mc-locale-sv: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-locale-sv: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-locale-sv: PKGSIZE changed from 80973 to 78256 (-3%)
packages/core2-64-poky-linux/mc/mc-locale-szl: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-locale-szl: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-locale-ta: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-locale-ta: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-locale-te: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-locale-te: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-locale-tr: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-locale-tr: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-locale-tr: PKGSIZE changed from 83076 to 80194 (-3%)
packages/core2-64-poky-linux/mc/mc-locale-uk: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-locale-uk: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-locale-uk: PKGSIZE changed from 113888 to 110483 (-3%)
packages/core2-64-poky-linux/mc/mc-locale-uz: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-locale-uz: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-locale-vi: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-locale-vi: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-locale-vi: PKGSIZE changed from 24556 to 23803 (-3%)
packages/core2-64-poky-linux/mc/mc-locale-wa: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-locale-wa: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-locale-wa: PKGSIZE changed from 13343 to 13108 (-2%)
packages/core2-64-poky-linux/mc/mc-locale-zh-cn: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-locale-zh-cn: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-locale-zh-cn: PKGSIZE changed from 76418 to 73791 (-3%)
packages/core2-64-poky-linux/mc/mc-locale-zh-tw: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-locale-zh-tw: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-locale-zh-tw: PKGSIZE changed from 49011 to 48119 (-2%)
packages/core2-64-poky-linux/mc/mc-src: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-src: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc-src: FILELIST: directory renamed /usr/src/debug/mc/4.8.30/lib/strutil -> /usr/src/debug/mc/4.8.31/lib/strutil, directory renamed /usr/src/debug/mc/4.8.30/src/consaver -> /usr/src/debug/mc/4.8.31/src/consaver, directory renamed /usr/src/debug/mc/4.8.30/lib/event -> /usr/src/debug/mc/4.8.31/lib/event, directory renamed /usr/src/debug/mc/4.8.30/lib/filehighlight -> /usr/src/debug/mc/4.8.31/lib/filehighlight, directory renamed /usr/src/debug/mc/4.8.30/src/editor -> /usr/src/debug/mc/4.8.31/src/editor, directory renamed /usr/src/debug/mc/4.8.30/lib/search -> /usr/src/debug/mc/4.8.31/lib/search, directory renamed /usr/src/debug/mc/4.8.30/src/vfs -> /usr/src/debug/mc/4.8.31/src/vfs, directory renamed /usr/src/debug/mc/4.8.30/src/vfs/sfs -> /usr/src/debug/mc/4.8.31/src/vfs/sfs, directory renamed /usr/src/debug/mc/4.8.30/src/viewer -> /usr/src/debug/mc/4.8.31/src/viewer, directory renamed /usr/src/debug/mc/4.8.30/lib/tty -> /usr/src/debug/mc/4.8.31/lib/tty, 
 directory renamed /usr/src/debug/mc/4.8.30/src/filemanager -> /usr/src/debug/mc/4.8.31/src/filemanager, directory renamed /usr/src/debug/mc/4.8.30/lib/vfs -> /usr/src/debug/mc/4.8.31/lib/vfs, directory renamed /usr/src/debug/mc/4.8.30/src -> /usr/src/debug/mc/4.8.31/src, directory renamed /usr/src/debug/mc/4.8.30/src/vfs/extfs -> /usr/src/debug/mc/4.8.31/src/vfs/extfs, directory renamed /usr/src/debug/mc/4.8.30/src/diffviewer -> /usr/src/debug/mc/4.8.31/src/diffviewer, directory renamed /usr/src/debug/mc/4.8.30/src/vfs/local -> /usr/src/debug/mc/4.8.31/src/vfs/local, directory renamed /usr/src/debug/mc/4.8.30/lib -> /usr/src/debug/mc/4.8.31/lib, directory renamed /usr/src/debug/mc/4.8.30/lib/mcconfig -> /usr/src/debug/mc/4.8.31/lib/mcconfig, directory renamed /usr/src/debug/mc/4.8.30/src/vfs/ftpfs -> /usr/src/debug/mc/4.8.31/src/vfs/ftpfs, directory renamed /usr/src/debug/mc/4.8.30/lib/skin -> /usr/src/debug/mc/4.8.31/lib/skin, directory renamed /usr/src/debug/mc/4.8.30/src/vfs/cpio
  -> /usr/src/debug/mc/4.8.31/src/vfs/cpio, directory renamed /usr/src/debug/mc/4.8.30/src/subshell -> /usr/src/debug/mc/4.8.31/src/subshell, directory renamed /usr/src/debug/mc/4.8.30/src/vfs/tar -> /usr/src/debug/mc/4.8.31/src/vfs/tar, directory renamed /usr/src/debug/mc/4.8.30/lib/widget -> /usr/src/debug/mc/4.8.31/lib/widget, removed "/usr/src/debug/mc/4.8.30/src/vfs/fish/fish.h /usr/src/debug/mc/4.8.30/src/vfs/fish/fish.c", added "/usr/src/debug/mc/4.8.31/src/vfs/shell/shell.c /usr/src/debug/mc/4.8.31/src/vfs/shell/shell.h"
packages/core2-64-poky-linux/mc/mc-src: PKGSIZE changed from 3954728 to 3956776 (+0%)
packages/core2-64-poky-linux/mc/mc-staticdev: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc-staticdev: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc: PKGV changed from 4.8.30 [default] to 4.8.31 [default]
packages/core2-64-poky-linux/mc/mc: PV changed from "4.8.30" to "4.8.31"
packages/core2-64-poky-linux/mc/mc: FILELIST: added "/usr/libexec/mc/shell/append /usr/libexec/mc/shell/fexists /usr/libexec/mc/shell/mv /usr/libexec/mc/shell/ls /usr/libexec/mc/shell/mkdir /usr/libexec/mc/shell/rmdir /usr/libexec/mc/shell/utime /usr/libexec/mc/shell/send /usr/libexec/mc/shell/ln /usr/libexec/mc/shell/chmod /usr/libexec/mc/shell/hardlink /usr/libexec/mc/shell/chown /usr/libexec/mc/shell/get /usr/libexec/mc/shell/README.shell /usr/libexec/mc/shell/info /usr/libexec/mc/shell/unlink"
packages/core2-64-poky-linux/mc/mc: PKGSIZE changed from 3649364 to 3672372 (+1%)

--===============0321425950547229631==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/mc/mc-fish: PKGSIZE changed from 17132 to 0 (-100%)
packages/core2-64-poky-linux/mc/mc-fish: FILELIST: removed all items "/usr/libexec/mc/fish/unlink /usr/libexec/mc/fish/ln /usr/libexec/mc/fish/info /usr/libexec/mc/fish/ls /usr/libexec/mc/fish/mkdir /usr/libexec/mc/fish/rmdir /usr/libexec/mc/fish/chown /usr/libexec/mc/fish/append /usr/libexec/mc/fish/fexists /usr/libexec/mc/fish/hardlink /usr/libexec/mc/fish/mv /usr/libexec/mc/fish/chmod /usr/libexec/mc/fish/get /usr/libexec/mc/fish/send /usr/libexec/mc/fish/README.fish /usr/libexec/mc/fish/utime"
packages/core2-64-poky-linux/mc/mc: FILELIST: added "/usr/libexec/mc/shell/send /usr/libexec/mc/shell/utime /usr/libexec/mc/shell/rmdir /usr/libexec/mc/shell/mkdir /usr/libexec/mc/shell/mv /usr/libexec/mc/shell/hardlink /usr/libexec/mc/shell/fexists /usr/libexec/mc/shell/ls /usr/libexec/mc/shell/chmod /usr/libexec/mc/shell/unlink /usr/libexec/mc/shell/info /usr/libexec/mc/shell/append /usr/libexec/mc/shell/README.shell /usr/libexec/mc/shell/get /usr/libexec/mc/shell/chown /usr/libexec/mc/shell/ln"

--===============0321425950547229631==--

