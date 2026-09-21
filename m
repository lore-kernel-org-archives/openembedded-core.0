Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9781BC982F8
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 05:40:17 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43179.1789969210958134432
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Sep 2026 22:40:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=tybsarHl;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=0crCCAZf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101a0c27a9abb-24a72e7b-d6bb-46d3-8796-5c1b6ad19efd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789969210;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=ApXJRJevI2W0l8yzzXrLhH/WIlpSZuXcIJAI4RuOp7M=;
	b=tybsarHlx3yYDMgcA+B8P39Kcvo8rytTuwkYIlTj3I1Lv+o6aeaNzSWLWyjTpj9d
	5xNt2aIvJ8Au0K4clYltM8V8Q62awo0pVFQor6L/0LOSgQGIlhCGdn2OKOK+XFkZxOR
	NNirfxXb6p5lyBtQVlYgX7YaCpF19JToWwaiPYqY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789969210;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=ApXJRJevI2W0l8yzzXrLhH/WIlpSZuXcIJAI4RuOp7M=;
	b=0crCCAZfJTeRT1YKqlND2vO+26CG1MF96Tc5zpTgie/0SzmvRrEzggdXGeNdOXlJ
	wAoViVe5vOPa3ckLCoWUGk7X/DXa7f16dlTMn3V5SEBAsAPcScejgrkFkTCmTDuqjoH
	AMnGkbZp5qzQLmE/eigDY9mm48IJ6/iOM2Ps8Ujc=
Content-Type: multipart/mixed; boundary="===============0406947065763722036=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] cairo: upgrading to 1.18.6 SUCCEEDED
Message-ID: <010101a0c27a9abb-24a72e7b-d6bb-46d3-8796-5c1b6ad19efd-000000@us-west-2.amazonses.com>
Date: Mon, 21 Sep 2026 05:40:10 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.21-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 05:40:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246279

--===============0406947065763722036==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *cairo* to *1.18.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-cairo-upgrade-1.18.4-1.18.6.patch
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
From c8b000d3a12d989c24e12bade74a1c644e241e75 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 21 Sep 2026 05:30:06 +0000
Subject: [PATCH] cairo: upgrade 1.18.4 -> 1.18.6

Source: NEWS

Release 1.18.6 (2026-09-20 Emmanuele Bassi <ebassi@gnome.org>)
==============================================================

A new stable release.

The XCB surface triggered an UAF warning when building with GCC. [#898]

The clipping code was accessing various fields in a guard value, and
causing a crash inside Inkscape. See: https://gitlab.com/inkscape/inkscape/-/issues/5631

Multiple fixes for the Windows backends, including improvements in the
thread safety of the DirectWrite code. [#897]

The DirectWrite backend now supports COLRv1 fonts. [#903]

Multiple fixes for building with MSVC and ClangCL.

A leak in the PDF surfaces has been fixed. [!644]

Various gaps between abutting rectangles when drawing with ANTIALIAS_NONE
were removed by using absolute coordinates and avoiding rounding
errors. [#976]

Remove an overflow when computing the buffer size in the XRender code. [#950]
---
 .../cairo-get_bitmap_surface-bsc1036789-CVE-2017-7475.diff  | 6 +++---
 .../cairo/{cairo_1.18.4.bb => cairo_1.18.6.bb}              | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/cairo/{cairo_1.18.4.bb => cairo_1.18.6.bb} (97%)

diff --git a/meta/recipes-graphics/cairo/cairo/cairo-get_bitmap_surface-bsc1036789-CVE-2017-7475.diff b/meta/recipes-graphics/cairo/cairo/cairo-get_bitmap_surface-bsc1036789-CVE-2017-7475.diff
index 79ef16dfb9..c6c5ba09c6 100644
--- a/meta/recipes-graphics/cairo/cairo/cairo-get_bitmap_surface-bsc1036789-CVE-2017-7475.diff
+++ b/meta/recipes-graphics/cairo/cairo/cairo-get_bitmap_surface-bsc1036789-CVE-2017-7475.diff
@@ -1,4 +1,4 @@
-From 054ad9b65e074899c82e75cfc6623cfe29ab1fea Mon Sep 17 00:00:00 2001
+From e21fd76dc2572061d078a41fd5faa76592483e88 Mon Sep 17 00:00:00 2001
 From: Fan Xin <fan.xin@jp.fujitsu.com>
 Date: Tue, 6 Jun 2017 15:57:52 +0900
 Subject: [PATCH] Cairo: Fix Denial-of-Service Attack due to Logical Problem in
@@ -15,10 +15,10 @@ Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/cairo-ft-font.c b/src/cairo-ft-font.c
-index b5d08ee..5e20ae1 100644
+index b9bdf81..fa9c05d 100644
 --- a/src/cairo-ft-font.c
 +++ b/src/cairo-ft-font.c
-@@ -1220,7 +1220,7 @@ _get_bitmap_surface (FT_Bitmap		     *bitmap,
+@@ -1231,7 +1231,7 @@ _get_bitmap_surface (FT_Bitmap		     *bitmap,
      width = bitmap->width;
      height = bitmap->rows;
  
diff --git a/meta/recipes-graphics/cairo/cairo_1.18.4.bb b/meta/recipes-graphics/cairo/cairo_1.18.6.bb
similarity index 97%
rename from meta/recipes-graphics/cairo/cairo_1.18.4.bb
rename to meta/recipes-graphics/cairo/cairo_1.18.6.bb
index ae448101d9..138ad7492b 100644
--- a/meta/recipes-graphics/cairo/cairo_1.18.4.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.18.6.bb
@@ -31,7 +31,7 @@ SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.xz \
            file://cairo-get_bitmap_surface-bsc1036789-CVE-2017-7475.diff \
           "
 
-SRC_URI[sha256sum] = "445ed8208a6e4823de1226a74ca319d3600e83f6369f99b14265006599c32ccb"
+SRC_URI[sha256sum] = "1c767308174337a74694da0f3ec069c271452163a1ef4540964c50c301f157d4"
 
 inherit meson pkgconfig upstream-version-is-even gtk-doc multilib_script
 
-- 
2.47.1


--===============0406947065763722036==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/cairo/cairo-dbg: FILELIST: removed "/usr/lib/.debug/libcairo-gobject.so.2.11804.4 /usr/lib/.debug/libcairo.so.2.11804.4 /usr/lib/.debug/libcairo-script-interpreter.so.2.11804.4", added "/usr/lib/.debug/libcairo-script-interpreter.so.2.11806.6 /usr/lib/.debug/libcairo.so.2.11806.6 /usr/lib/.debug/libcairo-gobject.so.2.11806.6"
packages/x86-64-v3-poky-linux/cairo/cairo-dbg: PV changed from "1.18.4" to "1.18.6"
packages/x86-64-v3-poky-linux/cairo/cairo-dbg: PKGSIZE changed from 7099280 to 7097584 (-0%)
packages/x86-64-v3-poky-linux/cairo/cairo-dbg: PKGV changed from 1.18.4 [default] to 1.18.6 [default]
packages/x86-64-v3-poky-linux/cairo/cairo-dev: PV changed from "1.18.4" to "1.18.6"
packages/x86-64-v3-poky-linux/cairo/cairo-dev: PKGSIZE changed from 175410 to 175391 (-0%)
packages/x86-64-v3-poky-linux/cairo/cairo-dev: PKGV changed from 1.18.4 [default] to 1.18.6 [default]
packages/x86-64-v3-poky-linux/cairo/cairo-doc: PV changed from "1.18.4" to "1.18.6"
packages/x86-64-v3-poky-linux/cairo/cairo-doc: PKGV changed from 1.18.4 [default] to 1.18.6 [default]
packages/x86-64-v3-poky-linux/cairo/cairo-gobject: FILELIST: removed "/usr/lib/libcairo-gobject.so.2.11804.4", added "/usr/lib/libcairo-gobject.so.2.11806.6"
packages/x86-64-v3-poky-linux/cairo/cairo-gobject: PV changed from "1.18.4" to "1.18.6"
packages/x86-64-v3-poky-linux/cairo/cairo-gobject: PKGV changed from 1.18.4 [default] to 1.18.6 [default]
packages/x86-64-v3-poky-linux/cairo/cairo-locale: PV changed from "1.18.4" to "1.18.6"
packages/x86-64-v3-poky-linux/cairo/cairo-locale: PKGV changed from 1.18.4 [default] to 1.18.6 [default]
packages/x86-64-v3-poky-linux/cairo/cairo-perf-utils: PV changed from "1.18.4" to "1.18.6"
packages/x86-64-v3-poky-linux/cairo/cairo-perf-utils: PKGSIZE changed from 158472 to 162568 (+3%)
packages/x86-64-v3-poky-linux/cairo/cairo-perf-utils: PKGV changed from 1.18.4 [default] to 1.18.6 [default]
packages/x86-64-v3-poky-linux/cairo/cairo-script-interpreter: FILELIST: removed "/usr/lib/libcairo-script-interpreter.so.2.11804.4", added "/usr/lib/libcairo-script-interpreter.so.2.11806.6"
packages/x86-64-v3-poky-linux/cairo/cairo-script-interpreter: PV changed from "1.18.4" to "1.18.6"
packages/x86-64-v3-poky-linux/cairo/cairo-script-interpreter: PKGV changed from 1.18.4 [default] to 1.18.6 [default]
packages/x86-64-v3-poky-linux/cairo/cairo-src: FILELIST: directory renamed /usr/src/debug/cairo/1.18.4/util/cairo-script -> /usr/src/debug/cairo/1.18.6/util/cairo-script, directory renamed /usr/src/debug/cairo/1.18.4/util/cairo-fdr -> /usr/src/debug/cairo/1.18.6/util/cairo-fdr, directory renamed /usr/src/debug/cairo/1.18.4/util/cairo-gobject -> /usr/src/debug/cairo/1.18.6/util/cairo-gobject, directory renamed /usr/src/debug/cairo/1.18.4/src -> /usr/src/debug/cairo/1.18.6/src, directory renamed /usr/src/debug/cairo/1.18.4/util/cairo-trace -> /usr/src/debug/cairo/1.18.6/util/cairo-trace
packages/x86-64-v3-poky-linux/cairo/cairo-src: PV changed from "1.18.4" to "1.18.6"
packages/x86-64-v3-poky-linux/cairo/cairo-src: PKGSIZE changed from 5912961 to 5918099 (+0%)
packages/x86-64-v3-poky-linux/cairo/cairo-src: PKGV changed from 1.18.4 [default] to 1.18.6 [default]
packages/x86-64-v3-poky-linux/cairo/cairo-staticdev: PV changed from "1.18.4" to "1.18.6"
packages/x86-64-v3-poky-linux/cairo/cairo-staticdev: PKGV changed from 1.18.4 [default] to 1.18.6 [default]
packages/x86-64-v3-poky-linux/cairo/cairo: FILELIST: removed "/usr/lib/libcairo.so.2.11804.4", added "/usr/lib/libcairo.so.2.11806.6"
packages/x86-64-v3-poky-linux/cairo/cairo: PV changed from "1.18.4" to "1.18.6"
packages/x86-64-v3-poky-linux/cairo/cairo: PKGV changed from 1.18.4 [default] to 1.18.6 [default]
packages/x86-64-v3-poky-linux/cairo: PV changed from "1.18.4" to "1.18.6"
packages/x86-64-v3-poky-linux/cairo: PKGV changed from 1.18.4 [default] to 1.18.6 [default]
packages/x86-64-v3-poky-linux/cairo: SRC_URI changed from "http://cairographics.org/releases/cairo-1.18.4.tar.xz file://cairo-get_bitmap_surface-bsc1036789-CVE-2017-7475.diff" to "http://cairographics.org/releases/cairo-1.18.6.tar.xz file://cairo-get_bitmap_surface-bsc1036789-CVE-2017-7475.diff"
Changes to packages/x86-64-v3-poky-linux/cairo (sysroot):
  /usr/lib/libcairo-gobject.so.2 changed symlink target from libcairo-gobject.so.2.11804.4 to libcairo-gobject.so.2.11806.6
  /usr/lib/libcairo-script-interpreter.so.2 changed symlink target from libcairo-script-interpreter.so.2.11804.4 to libcairo-script-interpreter.so.2.11806.6
  /usr/lib/libcairo.so.2 changed symlink target from libcairo.so.2.11804.4 to libcairo.so.2.11806.6
  /usr/lib/libcairo-gobject.so.2.11804.4 moved to /usr/lib/libcairo-gobject.so.2.11806.6
  /usr/lib/libcairo-script-interpreter.so.2.11804.4 moved to /usr/lib/libcairo-script-interpreter.so.2.11806.6
  /usr/lib/libcairo.so.2.11804.4 moved to /usr/lib/libcairo.so.2.11806.6

--===============0406947065763722036==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cairo-upgrade-1.18.4-1.18.6.patch"

RnJvbSBjOGIwMDBkM2ExMmQ5ODljMjRlMTJiYWRlNzRhMWM2NDRlMjQxZTc1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMjEgU2VwIDIwMjYgMDU6MzA6MDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
YWlybzogdXBncmFkZSAxLjE4LjQgLT4gMS4xOC42CgpTb3VyY2U6IE5FV1MKClJlbGVhc2UgMS4x
OC42ICgyMDI2LTA5LTIwIEVtbWFudWVsZSBCYXNzaSA8ZWJhc3NpQGdub21lLm9yZz4pCj09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
CgpBIG5ldyBzdGFibGUgcmVsZWFzZS4KClRoZSBYQ0Igc3VyZmFjZSB0cmlnZ2VyZWQgYW4gVUFG
IHdhcm5pbmcgd2hlbiBidWlsZGluZyB3aXRoIEdDQy4gWyM4OThdCgpUaGUgY2xpcHBpbmcgY29k
ZSB3YXMgYWNjZXNzaW5nIHZhcmlvdXMgZmllbGRzIGluIGEgZ3VhcmQgdmFsdWUsIGFuZApjYXVz
aW5nIGEgY3Jhc2ggaW5zaWRlIElua3NjYXBlLiBTZWU6IGh0dHBzOi8vZ2l0bGFiLmNvbS9pbmtz
Y2FwZS9pbmtzY2FwZS8tL2lzc3Vlcy81NjMxCgpNdWx0aXBsZSBmaXhlcyBmb3IgdGhlIFdpbmRv
d3MgYmFja2VuZHMsIGluY2x1ZGluZyBpbXByb3ZlbWVudHMgaW4gdGhlCnRocmVhZCBzYWZldHkg
b2YgdGhlIERpcmVjdFdyaXRlIGNvZGUuIFsjODk3XQoKVGhlIERpcmVjdFdyaXRlIGJhY2tlbmQg
bm93IHN1cHBvcnRzIENPTFJ2MSBmb250cy4gWyM5MDNdCgpNdWx0aXBsZSBmaXhlcyBmb3IgYnVp
bGRpbmcgd2l0aCBNU1ZDIGFuZCBDbGFuZ0NMLgoKQSBsZWFrIGluIHRoZSBQREYgc3VyZmFjZXMg
aGFzIGJlZW4gZml4ZWQuIFshNjQ0XQoKVmFyaW91cyBnYXBzIGJldHdlZW4gYWJ1dHRpbmcgcmVj
dGFuZ2xlcyB3aGVuIGRyYXdpbmcgd2l0aCBBTlRJQUxJQVNfTk9ORQp3ZXJlIHJlbW92ZWQgYnkg
dXNpbmcgYWJzb2x1dGUgY29vcmRpbmF0ZXMgYW5kIGF2b2lkaW5nIHJvdW5kaW5nCmVycm9ycy4g
WyM5NzZdCgpSZW1vdmUgYW4gb3ZlcmZsb3cgd2hlbiBjb21wdXRpbmcgdGhlIGJ1ZmZlciBzaXpl
IGluIHRoZSBYUmVuZGVyIGNvZGUuIFsjOTUwXQotLS0KIC4uLi9jYWlyby1nZXRfYml0bWFwX3N1
cmZhY2UtYnNjMTAzNjc4OS1DVkUtMjAxNy03NDc1LmRpZmYgIHwgNiArKystLS0KIC4uLi9jYWly
by97Y2Fpcm9fMS4xOC40LmJiID0+IGNhaXJvXzEuMTguNi5iYn0gICAgICAgICAgICAgIHwgMiAr
LQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2NhaXJvL3tjYWlyb18xLjE4LjQuYmIgPT4gY2Fpcm9f
MS4xOC42LmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9jYWly
by9jYWlyby9jYWlyby1nZXRfYml0bWFwX3N1cmZhY2UtYnNjMTAzNjc4OS1DVkUtMjAxNy03NDc1
LmRpZmYgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvY2Fpcm8vY2Fpcm8vY2Fpcm8tZ2V0X2JpdG1h
cF9zdXJmYWNlLWJzYzEwMzY3ODktQ1ZFLTIwMTctNzQ3NS5kaWZmCmluZGV4IDc5ZWYxNmRmYjku
LmM2YzViYTA5YzYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9jYWlyby9jYWly
by9jYWlyby1nZXRfYml0bWFwX3N1cmZhY2UtYnNjMTAzNjc4OS1DVkUtMjAxNy03NDc1LmRpZmYK
KysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2NhaXJvL2NhaXJvL2NhaXJvLWdldF9iaXRtYXBf
c3VyZmFjZS1ic2MxMDM2Nzg5LUNWRS0yMDE3LTc0NzUuZGlmZgpAQCAtMSw0ICsxLDQgQEAKLUZy
b20gMDU0YWQ5YjY1ZTA3NDg5OWM4MmU3NWNmYzY2MjNjZmUyOWFiMWZlYSBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gZTIxZmQ3NmRjMjU3MjA2MWQwNzhhNDFmZDVmYWE3NjU5MjQ4M2U4
OCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEZhbiBYaW4gPGZhbi54aW5AanAuZnVq
aXRzdS5jb20+CiBEYXRlOiBUdWUsIDYgSnVuIDIwMTcgMTU6NTc6NTIgKzA5MDAKIFN1YmplY3Q6
IFtQQVRDSF0gQ2Fpcm86IEZpeCBEZW5pYWwtb2YtU2VydmljZSBBdHRhY2sgZHVlIHRvIExvZ2lj
YWwgUHJvYmxlbSBpbgpAQCAtMTUsMTAgKzE1LDEwIEBAIFNpZ25lZC1vZmYtYnk6IEZhbiBYaW4g
PGZhbi54aW5AanAuZnVqaXRzdS5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9zcmMvY2Fpcm8tZnQtZm9udC5jIGIvc3Jj
L2NhaXJvLWZ0LWZvbnQuYwotaW5kZXggYjVkMDhlZS4uNWUyMGFlMSAxMDA2NDQKK2luZGV4IGI5
YmRmODEuLmZhOWMwNWQgMTAwNjQ0CiAtLS0gYS9zcmMvY2Fpcm8tZnQtZm9udC5jCiArKysgYi9z
cmMvY2Fpcm8tZnQtZm9udC5jCi1AQCAtMTIyMCw3ICsxMjIwLDcgQEAgX2dldF9iaXRtYXBfc3Vy
ZmFjZSAoRlRfQml0bWFwCQkgICAgICpiaXRtYXAsCitAQCAtMTIzMSw3ICsxMjMxLDcgQEAgX2dl
dF9iaXRtYXBfc3VyZmFjZSAoRlRfQml0bWFwCQkgICAgICpiaXRtYXAsCiAgICAgIHdpZHRoID0g
Yml0bWFwLT53aWR0aDsKICAgICAgaGVpZ2h0ID0gYml0bWFwLT5yb3dzOwogIApkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2NhaXJvL2NhaXJvXzEuMTguNC5iYiBiL21ldGEvcmVj
aXBlcy1ncmFwaGljcy9jYWlyby9jYWlyb18xLjE4LjYuYmIKc2ltaWxhcml0eSBpbmRleCA5NyUK
cmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2NhaXJvL2NhaXJvXzEuMTguNC5iYgpy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2NhaXJvL2NhaXJvXzEuMTguNi5iYgppbmRl
eCBhZTQ0ODEwMWQ5Li4xMzhhZDc0OTJiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvY2Fpcm8vY2Fpcm9fMS4xOC40LmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9jYWly
by9jYWlyb18xLjE4LjYuYmIKQEAgLTMxLDcgKzMxLDcgQEAgU1JDX1VSSSA9ICJodHRwOi8vY2Fp
cm9ncmFwaGljcy5vcmcvcmVsZWFzZXMvY2Fpcm8tJHtQVn0udGFyLnh6IFwKICAgICAgICAgICAg
ZmlsZTovL2NhaXJvLWdldF9iaXRtYXBfc3VyZmFjZS1ic2MxMDM2Nzg5LUNWRS0yMDE3LTc0NzUu
ZGlmZiBcCiAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNDQ1ZWQ4MjA4YTZl
NDgyM2RlMTIyNmE3NGNhMzE5ZDM2MDBlODNmNjM2OWY5OWIxNDI2NTAwNjU5OWMzMmNjYiIKK1NS
Q19VUklbc2hhMjU2c3VtXSA9ICIxYzc2NzMwODE3NDMzN2E3NDY5NGRhMGYzZWMwNjljMjcxNDUy
MTYzYTFlZjQ1NDA5NjRjNTBjMzAxZjE1N2Q0IgogCiBpbmhlcml0IG1lc29uIHBrZ2NvbmZpZyB1
cHN0cmVhbS12ZXJzaW9uLWlzLWV2ZW4gZ3RrLWRvYyBtdWx0aWxpYl9zY3JpcHQKIAotLSAKMi40
Ny4xCgo=

--===============0406947065763722036==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/cairo/cairo-gobject: FILELIST: removed "/usr/lib/libcairo-gobject.so.2.11804.4", added "/usr/lib/libcairo-gobject.so.2.11806.6"
packages/x86-64-v3-poky-linux/cairo/cairo-script-interpreter: FILELIST: removed "/usr/lib/libcairo-script-interpreter.so.2.11804.4", added "/usr/lib/libcairo-script-interpreter.so.2.11806.6"
packages/x86-64-v3-poky-linux/cairo/cairo: FILELIST: removed "/usr/lib/libcairo.so.2.11804.4", added "/usr/lib/libcairo.so.2.11806.6"
Changes to packages/x86-64-v3-poky-linux/cairo (sysroot):
  /usr/lib/libcairo-gobject.so.2 changed symlink target from libcairo-gobject.so.2.11804.4 to libcairo-gobject.so.2.11806.6
  /usr/lib/libcairo-script-interpreter.so.2 changed symlink target from libcairo-script-interpreter.so.2.11804.4 to libcairo-script-interpreter.so.2.11806.6
  /usr/lib/libcairo.so.2 changed symlink target from libcairo.so.2.11804.4 to libcairo.so.2.11806.6
  /usr/lib/libcairo-gobject.so.2.11804.4 moved to /usr/lib/libcairo-gobject.so.2.11806.6
  /usr/lib/libcairo-script-interpreter.so.2.11804.4 moved to /usr/lib/libcairo-script-interpreter.so.2.11806.6
  /usr/lib/libcairo.so.2.11804.4 moved to /usr/lib/libcairo.so.2.11806.6

--===============0406947065763722036==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="cairo-changelog.txt"

Changelog for cairo: 1.18.4 -> 1.18.6
Source: NEWS

Release 1.18.6 (2026-09-20 Emmanuele Bassi <ebassi@gnome.org>)
==============================================================

A new stable release.

The XCB surface triggered an UAF warning when building with GCC. [#898]

The clipping code was accessing various fields in a guard value, and
causing a crash inside Inkscape. See: https://gitlab.com/inkscape/inkscape/-/issues/5631

Multiple fixes for the Windows backends, including improvements in the
thread safety of the DirectWrite code. [#897]

The DirectWrite backend now supports COLRv1 fonts. [#903]

Multiple fixes for building with MSVC and ClangCL.

A leak in the PDF surfaces has been fixed. [!644]

Various gaps between abutting rectangles when drawing with ANTIALIAS_NONE
were removed by using absolute coordinates and avoiding rounding
errors. [#976]

Remove an overflow when computing the buffer size in the XRender code. [#950]

--===============0406947065763722036==--

