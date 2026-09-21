Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D3D6C982ED
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 05:40:16 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43180.1789969211014390922
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Sep 2026 22:40:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=DhDrVlq5;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=EEZbykTW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a0c27a9ac6-e6a4bc25-e212-46de-b7f8-37552cf31f7f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789969210;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=LtzOnn8m+o06VkMDNoELckn2Q0xWAkIt+W+lFGk1idE=;
	b=DhDrVlq5JsJgp9eMuIJuba9NTyL0VAzsgt4DgMnBLou9VSuZu/A3obYw7m17Ghd2
	PM/rJ6gXjME2ugZ0cBwt/7rKKHP0Oqpc9HNNkilT8SNSrJDfFI0+y56aAgpCTbPvpr1
	jsBb8WLAQ2zn567p0nqIUQPnYw83FRwskvGm2FnU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789969210;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=LtzOnn8m+o06VkMDNoELckn2Q0xWAkIt+W+lFGk1idE=;
	b=EEZbykTWr4aWz7mFuuucc/XKdsr8CdAAkvZXD4cgam8XIRjT0UzrbIkUOkYI9p8Q
	qG/f1Se1DmAsmXsK38P0h5Ooag7It8g3t5JBmYOKUrC/BaRJ9wHNkfTtyhvYXdYUtrZ
	XAPa+1D65YMi3s0WwuDzCmHADOeEQdzRzlKg1R2w=
Content-Type: multipart/mixed; boundary="===============6799833431488842124=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rsync: upgrading to 3.5.1 FAILED
Message-ID: <010101a0c27a9ac6-e6a4bc25-e212-46de-b7f8-37552cf31f7f-000000@us-west-2.amazonses.com>
Date: Mon, 21 Sep 2026 05:40:10 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.21-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 05:40:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246280

--===============6799833431488842124==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *rsync* to *3.5.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-rsync-upgrade-3.5.0-3.5.1.patch
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
From 257368fd1cbd63a77ef8d34b0dbe98a447faa8d9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 21 Sep 2026 05:14:20 +0000
Subject: [PATCH] rsync: upgrade 3.5.0 -> 3.5.1

Source: NEWS.md

# NEWS for rsync 3.5.1 (21 Sep 2026)

## Changes in this version:

### PROTOCOL NUMBER:

- The protocol number was changed to 33.

### MAINTAINERS AND CONTRIBUTORS:

Zen Dodd (@steadytao) now has release authority as an rsync maintainer.

Thanks to Omar Elsayed (@seks99x) for the path-handling fixes and new block
statistics and to Samuel Henrique (@samueloph) for the `--max-alloc=0` fix and
test improvements.

### BUG FIXES:
- Fixed several path-handling regressions from 3.5.0. Explicit sender paths
  can again traverse symlinked ancestors without weakening confinement of
  paths found during recursive scans. Local and remote-shell `--files-from`
  paths are handled as operator-supplied paths rather than paths beneath the
  transfer root.
- Fixed access to `/dev/stdin`, `/dev/stdout`, `/dev/stderr` and `/dev/fd/N`
  when they refer to pipes or descriptors inside user namespaces. Reading
  batch data from a FIFO or process substitution works again.
- Restored `--max-alloc=0` as a spelling for the parser's maximum allocation
  limit rather than disabling that limit.
- Fixed restricted-root paths in `rrsync` and detection of an inetd connection
  when a daemon is started with a local socket on standard input, as can
  happen under ADB without a PTY.
- Allowed `--contimeout` for daemon connections made through `--rsh` without
  applying it to ordinary remote-shell transfers.
- Tightened validation of partial-directory state and alternate-destination
  paths on the receiver. An alternate-destination leaf symlink is no longer
  followed as a basis file.
- Fixed undefined shifts in the bundled zlib code and a FreeBSD amd64 build
  failure involving the assembly and SIMD objects.

### ENHANCEMENTS:
- Added support for internationalised domain names when the required library
  is available at build time.
- Added the number of 4 KiB logical blocks touched to `--stats`. This counts
  distinct logical file regions written by the receiver, not physical disk
  blocks or disk I/O. It is reported when both peers negotiate protocol 33.

### BUILD AND TESTS:
- `install-strip` now honours `STRIP` including during cross-compilation.
- Updated platform tests and fleet-test coverage for the 3.5.0 fixes.

------------------------------------------------------------------------------

| 21 Sep 2026  | 3.5.1  | 21 Sep 2026      | 33          |
---
 ...01-Add-missing-prototypes-to-function-declarations.patch | 4 ++--
 meta/recipes-devtools/rsync/files/determism.patch           | 6 +++---
 meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch | 6 +++---
 .../rsync/{rsync_3.5.0.bb => rsync_3.5.1.bb}                | 2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)
 rename meta/recipes-devtools/rsync/{rsync_3.5.0.bb => rsync_3.5.1.bb} (97%)

diff --git a/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch b/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
index 5aed93e458..1f1fc3f3b3 100644
--- a/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
+++ b/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
@@ -1,4 +1,4 @@
-From 64e62c659649593239ed39ed40a3ae689bf2d593 Mon Sep 17 00:00:00 2001
+From 56a785a7d964f797a786b2d5b75d9cee51b530b1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 29 Aug 2022 19:53:28 -0700
 Subject: [PATCH] Add missing prototypes to function declarations
@@ -63,7 +63,7 @@ index 889b57b..19e5e98 100644
  	int options = LOG_PID;
  
 diff --git a/main.c b/main.c
-index 6050d0e..45722c4 100644
+index ed6e554..b5f9448 100644
 --- a/main.c
 +++ b/main.c
 @@ -250,7 +250,7 @@ void read_del_stats(int f)
diff --git a/meta/recipes-devtools/rsync/files/determism.patch b/meta/recipes-devtools/rsync/files/determism.patch
index 2eea267bb2..890275f6d7 100644
--- a/meta/recipes-devtools/rsync/files/determism.patch
+++ b/meta/recipes-devtools/rsync/files/determism.patch
@@ -1,4 +1,4 @@
-From c4c9b52a864c3b9ff67771b9d881a78276448100 Mon Sep 17 00:00:00 2001
+From e784131e4ccbaf8ad7107d1f7a7f13da8c675827 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Sun, 21 Feb 2021 09:45:48 +0000
 Subject: [PATCH] rsync: Fix a file sorting determinism issue
@@ -25,10 +25,10 @@ https://github.com/WayneD/rsync/commit/d3085f7add38a5cf833a0b31cb0637ff46c80f8d
  1 file changed, 5 insertions(+)
 
 diff --git a/Makefile.in b/Makefile.in
-index 91807d6..c18b4be 100644
+index de24949..bb9bb27 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -27,6 +27,11 @@ MKDIR_P=@MKDIR_P@
+@@ -28,6 +28,11 @@ MKDIR_P=@MKDIR_P@
  VPATH=$(srcdir)
  SHELL=/bin/sh
  
diff --git a/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch b/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
index 4ff070ea3c..59255d15e7 100644
--- a/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
+++ b/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
@@ -1,4 +1,4 @@
-From bab7abb3c7c1c1db8ef6c3084c1ffb5152f5bf1e Mon Sep 17 00:00:00 2001
+From 0e1f2aec0dbfc150013860b42b41645cebe236b7 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 12 Apr 2016 15:51:54 +0100
 Subject: [PATCH] rsync: remove upstream's rebuild logic
@@ -13,10 +13,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  1 file changed, 54 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index 801e864..91807d6 100644
+index 716171d..de24949 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -265,60 +265,6 @@ conf: configure.sh config.h.in
+@@ -267,60 +267,6 @@ conf: configure.sh config.h.in
  .PHONY: gen
  gen: conf proto.h man git-version.h
  
diff --git a/meta/recipes-devtools/rsync/rsync_3.5.0.bb b/meta/recipes-devtools/rsync/rsync_3.5.1.bb
similarity index 97%
rename from meta/recipes-devtools/rsync/rsync_3.5.0.bb
rename to meta/recipes-devtools/rsync/rsync_3.5.1.bb
index d9a4884d96..71a3225e24 100644
--- a/meta/recipes-devtools/rsync/rsync_3.5.0.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.5.1.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://determism.patch \
            file://0001-Add-missing-prototypes-to-function-declarations.patch \
            "
-SRC_URI[sha256sum] = "c7ffd1ef653e99540f661e47cb00b7f9cad1ee6b972399b16f93d672656e0d33"
+SRC_URI[sha256sum] = "c55f9c9dc10fb8bec397b399a0fdded53cc9a2d8e30891bb0d63724d25c37bef"
 
 # Out-of-tree builds don't install the documentation currently
 # https://github.com/RsyncProject/rsync/issues/846
-- 
2.47.1


--===============6799833431488842124==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-rsync-upgrade-3.5.0-3.5.1.patch"

RnJvbSAyNTczNjhmZDFjYmQ2M2E3N2VmOGQzNGIwZGJlOThhNDQ3ZmFhOGQ5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMjEgU2VwIDIwMjYgMDU6MTQ6MjAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBy
c3luYzogdXBncmFkZSAzLjUuMCAtPiAzLjUuMQoKU291cmNlOiBORVdTLm1kCgojIE5FV1MgZm9y
IHJzeW5jIDMuNS4xICgyMSBTZXAgMjAyNikKCiMjIENoYW5nZXMgaW4gdGhpcyB2ZXJzaW9uOgoK
IyMjIFBST1RPQ09MIE5VTUJFUjoKCi0gVGhlIHByb3RvY29sIG51bWJlciB3YXMgY2hhbmdlZCB0
byAzMy4KCiMjIyBNQUlOVEFJTkVSUyBBTkQgQ09OVFJJQlVUT1JTOgoKWmVuIERvZGQgKEBzdGVh
ZHl0YW8pIG5vdyBoYXMgcmVsZWFzZSBhdXRob3JpdHkgYXMgYW4gcnN5bmMgbWFpbnRhaW5lci4K
ClRoYW5rcyB0byBPbWFyIEVsc2F5ZWQgKEBzZWtzOTl4KSBmb3IgdGhlIHBhdGgtaGFuZGxpbmcg
Zml4ZXMgYW5kIG5ldyBibG9jawpzdGF0aXN0aWNzIGFuZCB0byBTYW11ZWwgSGVucmlxdWUgKEBz
YW11ZWxvcGgpIGZvciB0aGUgYC0tbWF4LWFsbG9jPTBgIGZpeCBhbmQKdGVzdCBpbXByb3ZlbWVu
dHMuCgojIyMgQlVHIEZJWEVTOgotIEZpeGVkIHNldmVyYWwgcGF0aC1oYW5kbGluZyByZWdyZXNz
aW9ucyBmcm9tIDMuNS4wLiBFeHBsaWNpdCBzZW5kZXIgcGF0aHMKICBjYW4gYWdhaW4gdHJhdmVy
c2Ugc3ltbGlua2VkIGFuY2VzdG9ycyB3aXRob3V0IHdlYWtlbmluZyBjb25maW5lbWVudCBvZgog
IHBhdGhzIGZvdW5kIGR1cmluZyByZWN1cnNpdmUgc2NhbnMuIExvY2FsIGFuZCByZW1vdGUtc2hl
bGwgYC0tZmlsZXMtZnJvbWAKICBwYXRocyBhcmUgaGFuZGxlZCBhcyBvcGVyYXRvci1zdXBwbGll
ZCBwYXRocyByYXRoZXIgdGhhbiBwYXRocyBiZW5lYXRoIHRoZQogIHRyYW5zZmVyIHJvb3QuCi0g
Rml4ZWQgYWNjZXNzIHRvIGAvZGV2L3N0ZGluYCwgYC9kZXYvc3Rkb3V0YCwgYC9kZXYvc3RkZXJy
YCBhbmQgYC9kZXYvZmQvTmAKICB3aGVuIHRoZXkgcmVmZXIgdG8gcGlwZXMgb3IgZGVzY3JpcHRv
cnMgaW5zaWRlIHVzZXIgbmFtZXNwYWNlcy4gUmVhZGluZwogIGJhdGNoIGRhdGEgZnJvbSBhIEZJ
Rk8gb3IgcHJvY2VzcyBzdWJzdGl0dXRpb24gd29ya3MgYWdhaW4uCi0gUmVzdG9yZWQgYC0tbWF4
LWFsbG9jPTBgIGFzIGEgc3BlbGxpbmcgZm9yIHRoZSBwYXJzZXIncyBtYXhpbXVtIGFsbG9jYXRp
b24KICBsaW1pdCByYXRoZXIgdGhhbiBkaXNhYmxpbmcgdGhhdCBsaW1pdC4KLSBGaXhlZCByZXN0
cmljdGVkLXJvb3QgcGF0aHMgaW4gYHJyc3luY2AgYW5kIGRldGVjdGlvbiBvZiBhbiBpbmV0ZCBj
b25uZWN0aW9uCiAgd2hlbiBhIGRhZW1vbiBpcyBzdGFydGVkIHdpdGggYSBsb2NhbCBzb2NrZXQg
b24gc3RhbmRhcmQgaW5wdXQsIGFzIGNhbgogIGhhcHBlbiB1bmRlciBBREIgd2l0aG91dCBhIFBU
WS4KLSBBbGxvd2VkIGAtLWNvbnRpbWVvdXRgIGZvciBkYWVtb24gY29ubmVjdGlvbnMgbWFkZSB0
aHJvdWdoIGAtLXJzaGAgd2l0aG91dAogIGFwcGx5aW5nIGl0IHRvIG9yZGluYXJ5IHJlbW90ZS1z
aGVsbCB0cmFuc2ZlcnMuCi0gVGlnaHRlbmVkIHZhbGlkYXRpb24gb2YgcGFydGlhbC1kaXJlY3Rv
cnkgc3RhdGUgYW5kIGFsdGVybmF0ZS1kZXN0aW5hdGlvbgogIHBhdGhzIG9uIHRoZSByZWNlaXZl
ci4gQW4gYWx0ZXJuYXRlLWRlc3RpbmF0aW9uIGxlYWYgc3ltbGluayBpcyBubyBsb25nZXIKICBm
b2xsb3dlZCBhcyBhIGJhc2lzIGZpbGUuCi0gRml4ZWQgdW5kZWZpbmVkIHNoaWZ0cyBpbiB0aGUg
YnVuZGxlZCB6bGliIGNvZGUgYW5kIGEgRnJlZUJTRCBhbWQ2NCBidWlsZAogIGZhaWx1cmUgaW52
b2x2aW5nIHRoZSBhc3NlbWJseSBhbmQgU0lNRCBvYmplY3RzLgoKIyMjIEVOSEFOQ0VNRU5UUzoK
LSBBZGRlZCBzdXBwb3J0IGZvciBpbnRlcm5hdGlvbmFsaXNlZCBkb21haW4gbmFtZXMgd2hlbiB0
aGUgcmVxdWlyZWQgbGlicmFyeQogIGlzIGF2YWlsYWJsZSBhdCBidWlsZCB0aW1lLgotIEFkZGVk
IHRoZSBudW1iZXIgb2YgNCBLaUIgbG9naWNhbCBibG9ja3MgdG91Y2hlZCB0byBgLS1zdGF0c2Au
IFRoaXMgY291bnRzCiAgZGlzdGluY3QgbG9naWNhbCBmaWxlIHJlZ2lvbnMgd3JpdHRlbiBieSB0
aGUgcmVjZWl2ZXIsIG5vdCBwaHlzaWNhbCBkaXNrCiAgYmxvY2tzIG9yIGRpc2sgSS9PLiBJdCBp
cyByZXBvcnRlZCB3aGVuIGJvdGggcGVlcnMgbmVnb3RpYXRlIHByb3RvY29sIDMzLgoKIyMjIEJV
SUxEIEFORCBURVNUUzoKLSBgaW5zdGFsbC1zdHJpcGAgbm93IGhvbm91cnMgYFNUUklQYCBpbmNs
dWRpbmcgZHVyaW5nIGNyb3NzLWNvbXBpbGF0aW9uLgotIFVwZGF0ZWQgcGxhdGZvcm0gdGVzdHMg
YW5kIGZsZWV0LXRlc3QgY292ZXJhZ2UgZm9yIHRoZSAzLjUuMCBmaXhlcy4KCi0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQoKfCAyMSBTZXAgMjAyNiAgfCAzLjUuMSAgfCAyMSBTZXAgMjAyNiAgICAgIHwg
MzMgICAgICAgICAgfAotLS0KIC4uLjAxLUFkZC1taXNzaW5nLXByb3RvdHlwZXMtdG8tZnVuY3Rp
b24tZGVjbGFyYXRpb25zLnBhdGNoIHwgNCArKy0tCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnN5
bmMvZmlsZXMvZGV0ZXJtaXNtLnBhdGNoICAgICAgICAgICB8IDYgKysrLS0tCiBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcnN5bmMvZmlsZXMvbWFrZWZpbGUtbm8tcmVidWlsZC5wYXRjaCB8IDYgKysr
LS0tCiAuLi4vcnN5bmMve3JzeW5jXzMuNS4wLmJiID0+IHJzeW5jXzMuNS4xLmJifSAgICAgICAg
ICAgICAgICB8IDIgKy0KIDQgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA5IGRlbGV0
aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9yc3luYy97cnN5bmNfMy41LjAu
YmIgPT4gcnN5bmNfMy41LjEuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3JzeW5jL2ZpbGVzLzAwMDEtQWRkLW1pc3NpbmctcHJvdG90eXBlcy10by1mdW5jdGlv
bi1kZWNsYXJhdGlvbnMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnN5bmMvZmlsZXMv
MDAwMS1BZGQtbWlzc2luZy1wcm90b3R5cGVzLXRvLWZ1bmN0aW9uLWRlY2xhcmF0aW9ucy5wYXRj
aAppbmRleCA1YWVkOTNlNDU4Li4xZjFmYzNmM2IzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcnN5bmMvZmlsZXMvMDAwMS1BZGQtbWlzc2luZy1wcm90b3R5cGVzLXRvLWZ1bmN0
aW9uLWRlY2xhcmF0aW9ucy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnN5bmMv
ZmlsZXMvMDAwMS1BZGQtbWlzc2luZy1wcm90b3R5cGVzLXRvLWZ1bmN0aW9uLWRlY2xhcmF0aW9u
cy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNjRlNjJjNjU5NjQ5NTkzMjM5ZWQzOWVkNDBh
M2FlNjg5YmYyZDU5MyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNTZhNzg1YTdkOTY0
Zjc5N2E3ODZiMmQ1Yjc1ZDljZWU1MWI1MzBiMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZy
b206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBNb24sIDI5IEF1ZyAyMDIy
IDE5OjUzOjI4IC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIEFkZCBtaXNzaW5nIHByb3RvdHlwZXMg
dG8gZnVuY3Rpb24gZGVjbGFyYXRpb25zCkBAIC02Myw3ICs2Myw3IEBAIGluZGV4IDg4OWI1N2Iu
LjE5ZTVlOTggMTAwNjQ0CiAgCWludCBvcHRpb25zID0gTE9HX1BJRDsKICAKIGRpZmYgLS1naXQg
YS9tYWluLmMgYi9tYWluLmMKLWluZGV4IDYwNTBkMGUuLjQ1NzIyYzQgMTAwNjQ0CitpbmRleCBl
ZDZlNTU0Li5iNWY5NDQ4IDEwMDY0NAogLS0tIGEvbWFpbi5jCiArKysgYi9tYWluLmMKIEBAIC0y
NTAsNyArMjUwLDcgQEAgdm9pZCByZWFkX2RlbF9zdGF0cyhpbnQgZikKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9yc3luYy9maWxlcy9kZXRlcm1pc20ucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcnN5bmMvZmlsZXMvZGV0ZXJtaXNtLnBhdGNoCmluZGV4IDJlZWEyNjdi
YjIuLjg5MDI3NWY2ZDcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yc3luYy9m
aWxlcy9kZXRlcm1pc20ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JzeW5jL2Zp
bGVzL2RldGVybWlzbS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYzRjOWI1MmE4NjRjM2I5
ZmY2Nzc3MWI5ZDg4MWE3ODI3NjQ0ODEwMCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
ZTc4NDEzMWU0Y2NiYWY4YWQ3MTA3ZDFmN2E3ZjEzZGE4YzY3NTgyNyBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKIEZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5k
YXRpb24ub3JnPgogRGF0ZTogU3VuLCAyMSBGZWIgMjAyMSAwOTo0NTo0OCArMDAwMAogU3ViamVj
dDogW1BBVENIXSByc3luYzogRml4IGEgZmlsZSBzb3J0aW5nIGRldGVybWluaXNtIGlzc3VlCkBA
IC0yNSwxMCArMjUsMTAgQEAgaHR0cHM6Ly9naXRodWIuY29tL1dheW5lRC9yc3luYy9jb21taXQv
ZDMwODVmN2FkZDM4YTVjZjgzM2EwYjMxY2IwNjM3ZmY0NmM4MGY4ZAogIDEgZmlsZSBjaGFuZ2Vk
LCA1IGluc2VydGlvbnMoKykKIAogZGlmZiAtLWdpdCBhL01ha2VmaWxlLmluIGIvTWFrZWZpbGUu
aW4KLWluZGV4IDkxODA3ZDYuLmMxOGI0YmUgMTAwNjQ0CitpbmRleCBkZTI0OTQ5Li5iYjliYjI3
IDEwMDY0NAogLS0tIGEvTWFrZWZpbGUuaW4KICsrKyBiL01ha2VmaWxlLmluCi1AQCAtMjcsNiAr
MjcsMTEgQEAgTUtESVJfUD1ATUtESVJfUEAKK0BAIC0yOCw2ICsyOCwxMSBAQCBNS0RJUl9QPUBN
S0RJUl9QQAogIFZQQVRIPSQoc3JjZGlyKQogIFNIRUxMPS9iaW4vc2gKICAKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9yc3luYy9maWxlcy9tYWtlZmlsZS1uby1yZWJ1aWxkLnBh
dGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JzeW5jL2ZpbGVzL21ha2VmaWxlLW5vLXJlYnVp
bGQucGF0Y2gKaW5kZXggNGZmMDcwZWEzYy4uNTkyNTVkMTVlNyAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3JzeW5jL2ZpbGVzL21ha2VmaWxlLW5vLXJlYnVpbGQucGF0Y2gKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JzeW5jL2ZpbGVzL21ha2VmaWxlLW5vLXJlYnVpbGQu
cGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGJhYjdhYmIzYzdjMWMxZGI4ZWY2YzMwODRjMWZm
YjUxNTJmNWJmMWUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDBlMWYyYWVjMGRiZmMx
NTAwMTM4NjBiNDJiNDE2NDVjZWJlMjM2YjcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9t
OiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AaW50ZWwuY29tPgogRGF0ZTogVHVlLCAxMiBBcHIg
MjAxNiAxNTo1MTo1NCArMDEwMAogU3ViamVjdDogW1BBVENIXSByc3luYzogcmVtb3ZlIHVwc3Ry
ZWFtJ3MgcmVidWlsZCBsb2dpYwpAQCAtMTMsMTAgKzEzLDEwIEBAIFNpZ25lZC1vZmYtYnk6IFJv
c3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBpbnRlbC5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDU0IGRl
bGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvTWFrZWZpbGUuaW4gYi9NYWtlZmlsZS5pbgotaW5k
ZXggODAxZTg2NC4uOTE4MDdkNiAxMDA2NDQKK2luZGV4IDcxNjE3MWQuLmRlMjQ5NDkgMTAwNjQ0
CiAtLS0gYS9NYWtlZmlsZS5pbgogKysrIGIvTWFrZWZpbGUuaW4KLUBAIC0yNjUsNjAgKzI2NSw2
IEBAIGNvbmY6IGNvbmZpZ3VyZS5zaCBjb25maWcuaC5pbgorQEAgLTI2Nyw2MCArMjY3LDYgQEAg
Y29uZjogY29uZmlndXJlLnNoIGNvbmZpZy5oLmluCiAgLlBIT05ZOiBnZW4KICBnZW46IGNvbmYg
cHJvdG8uaCBtYW4gZ2l0LXZlcnNpb24uaAogIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3JzeW5jL3JzeW5jXzMuNS4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JzeW5j
L3JzeW5jXzMuNS4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9yc3luYy9yc3luY18zLjUuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3JzeW5jL3JzeW5jXzMuNS4xLmJiCmluZGV4IGQ5YTQ4ODRkOTYuLjcxYTMyMjVl
MjQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yc3luYy9yc3luY18zLjUuMC5i
YgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnN5bmMvcnN5bmNfMy41LjEuYmIKQEAgLTE2
LDcgKzE2LDcgQEAgU1JDX1VSSSA9ICJodHRwczovL2Rvd25sb2FkLnNhbWJhLm9yZy9wdWIvJHtC
UE59L3NyYy8ke0JQfS50YXIuZ3ogXAogICAgICAgICAgICBmaWxlOi8vZGV0ZXJtaXNtLnBhdGNo
IFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtQWRkLW1pc3NpbmctcHJvdG90eXBlcy10by1mdW5j
dGlvbi1kZWNsYXJhdGlvbnMucGF0Y2ggXAogICAgICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiYzdmZmQxZWY2NTNlOTk1NDBmNjYxZTQ3Y2IwMGI3ZjljYWQxZWU2Yjk3MjM5OWIxNmY5
M2Q2NzI2NTZlMGQzMyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJjNTVmOWM5ZGMxMGZiOGJlYzM5
N2IzOTlhMGZkZGVkNTNjYzlhMmQ4ZTMwODkxYmIwZDYzNzI0ZDI1YzM3YmVmIgogCiAjIE91dC1v
Zi10cmVlIGJ1aWxkcyBkb24ndCBpbnN0YWxsIHRoZSBkb2N1bWVudGF0aW9uIGN1cnJlbnRseQog
IyBodHRwczovL2dpdGh1Yi5jb20vUnN5bmNQcm9qZWN0L3JzeW5jL2lzc3Vlcy84NDYKLS0gCjIu
NDcuMQoK

--===============6799833431488842124==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="rsync-changelog.txt"

Changelog for rsync: 3.5.0 -> 3.5.1
Source: NEWS.md

# NEWS for rsync 3.5.1 (21 Sep 2026)

## Changes in this version:

### PROTOCOL NUMBER:

- The protocol number was changed to 33.

### MAINTAINERS AND CONTRIBUTORS:

Zen Dodd (@steadytao) now has release authority as an rsync maintainer.

Thanks to Omar Elsayed (@seks99x) for the path-handling fixes and new block
statistics and to Samuel Henrique (@samueloph) for the `--max-alloc=0` fix and
test improvements.

### BUG FIXES:
- Fixed several path-handling regressions from 3.5.0. Explicit sender paths
  can again traverse symlinked ancestors without weakening confinement of
  paths found during recursive scans. Local and remote-shell `--files-from`
  paths are handled as operator-supplied paths rather than paths beneath the
  transfer root.
- Fixed access to `/dev/stdin`, `/dev/stdout`, `/dev/stderr` and `/dev/fd/N`
  when they refer to pipes or descriptors inside user namespaces. Reading
  batch data from a FIFO or process substitution works again.
- Restored `--max-alloc=0` as a spelling for the parser's maximum allocation
  limit rather than disabling that limit.
- Fixed restricted-root paths in `rrsync` and detection of an inetd connection
  when a daemon is started with a local socket on standard input, as can
  happen under ADB without a PTY.
- Allowed `--contimeout` for daemon connections made through `--rsh` without
  applying it to ordinary remote-shell transfers.
- Tightened validation of partial-directory state and alternate-destination
  paths on the receiver. An alternate-destination leaf symlink is no longer
  followed as a basis file.
- Fixed undefined shifts in the bundled zlib code and a FreeBSD amd64 build
  failure involving the assembly and SIMD objects.

### ENHANCEMENTS:
- Added support for internationalised domain names when the required library
  is available at build time.
- Added the number of 4 KiB logical blocks touched to `--stats`. This counts
  distinct logical file regions written by the receiver, not physical disk
  blocks or disk I/O. It is reported when both peers negotiate protocol 33.

### BUILD AND TESTS:
- `install-strip` now honours `STRIP` including during cross-compilation.
- Updated platform tests and fleet-test coverage for the 3.5.0 fixes.

------------------------------------------------------------------------------

| 21 Sep 2026  | 3.5.1  | 21 Sep 2026      | 33          |

--===============6799833431488842124==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 959 .bb files complete (0 cached, 959 parsed). 1993 targets, 43 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-06cee827bd22979de556b1e62eed88747ef44413"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:06cee827bd22979de556b1e62eed88747ef44413"
meta-yocto-bsp       
meta-poky            = "master:d36c827e02ab138b446386792fd7588b5a041507"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 263 Local 196 Mirrors 0 Missed 67 Current 142 (74% match, 83% complete)
done.
Removing 13 stale sstate objects for arch x86-64-v3...done.
Removing 9 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 229 of 405 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/gettext/gettext_1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 233 of 405 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 261 of 405 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 268 of 405 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 269 of 405 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 273 of 405 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.47.bb:do_create_spdx_setscene)
NOTE: Running setscene task 279 of 405 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gperf/gperf_3.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 280 of 405 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_16.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 283 of 405 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/unifdef/unifdef_2.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 287 of 405 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 288 of 405 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 292 of 405 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 294 of 405 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_create_spdx_setscene)
NOTE: Running setscene task 295 of 405 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 297 of 405 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 304 of 405 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.47-r0: task do_create_spdx_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-initial-16.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe unifdef-native-2.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe gperf-native-3.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe gettext-native-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe perl-native-5.44.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe popt-native-1.19-r0: task do_create_spdx_setscene: Started
NOTE: recipe gawk-native-5.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe acl-native-2.4.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 306 of 405 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 312 of 405 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 313 of 405 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.47-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgcc-initial-16.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 314 of 405 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_16.2.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 315 of 405 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_16.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 317 of 405 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.47.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 318 of 405 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/bison/bison_3.8.2.bb:do_create_spdx_setscene)
NOTE: recipe unifdef-native-2.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe perl-native-5.44.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gettext-native-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gperf-native-3.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 319 of 405 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/unifdef/unifdef_2.12.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 320 of 405 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 321 of 405 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/gettext/gettext_1.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 324 of 405 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 325 of 405 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gperf/gperf_3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 327 of 405 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gperf/gperf_3.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe popt-native-1.19-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gawk-native-5.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe acl-native-2.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 333 of 405 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 334 of 405 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 337 of 405 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-initial-16.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-initial-16.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.47-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe glibc-2.44+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bison-native-3.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe unifdef-native-2.12-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-native-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe gperf-native-3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 339 of 405 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pkgconf/pkgconf_3.0.7.bb:do_create_spdx_setscene)
NOTE: recipe gperf-native-3.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe perl-native-5.44.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 342 of 405 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gettext-native-1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe glibc-2.44+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-initial-16.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe popt-native-1.19-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.47-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 344 of 405 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_create_spdx_setscene)
NOTE: recipe gawk-native-5.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-native-2.4.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe bison-native-3.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe unifdef-native-2.12-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 346 of 405 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/bison/bison_3.8.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running task 197 of 1102 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.44.bb:do_fetch)
NOTE: recipe libgcc-initial-16.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-native-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 348 of 405 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_16.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 350 of 405 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_16.2.bb:do_gcc_stash_builddir_setscene)
NOTE: recipe gperf-native-3.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe perl-native-5.44.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gettext-native-1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 352 of 405 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running noexec task 251 of 1102 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_fetch)
NOTE: recipe popt-native-1.19-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe acl-native-2.4.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe pkgconf-native-3.0.7-r0: task do_create_spdx_setscene: Started
NOTE: Running task 316 of 1102 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_fetch)
NOTE: Running noexec task 318 of 1102 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_fetch)
NOTE: Running task 345 of 1102 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_fetch)
NOTE: Running task 347 of 1102 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_fetch)
NOTE: recipe gperf-native-3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 358 of 405 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gperf/gperf_3.3.bb:do_recipe_qa_setscene)
NOTE: recipe gawk-native-5.4.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running task 402 of 1102 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_fetch)
NOTE: Running task 403 of 1102 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_fetch)
NOTE: Running task 404 of 1102 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_fetch)
NOTE: recipe attr-native-2.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcc-initial-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-16.2.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe gawk-native-5.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glibc-2.44+git-r0: task do_fetch: Started
NOTE: recipe bison-native-3.8.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 360 of 405 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_fetch: Started
NOTE: recipe zlib-native-1.3.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Started
NOTE: recipe gawk-native-5.4.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_fetch: Started
NOTE: recipe glibc-2.44+git-r0: task do_fetch: Succeeded
NOTE: Running task 406 of 1102 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rsync/rsync_3.5.1.bb:do_recipe_qa)
NOTE: recipe libgcc-initial-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pkgconf-native-3.0.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 407 of 1102 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.44.bb:do_unpack)
NOTE: recipe libtool-cross-2.6.2-r0: task do_fetch: Succeeded
NOTE: recipe attr-native-2.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe popt-1.19-r0: task do_fetch: Started
NOTE: recipe zlib-1.3.2-r0: task do_fetch: Started
NOTE: Running setscene task 361 of 405 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pkgconf/pkgconf_3.0.7.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 362 of 405 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-native_2.6.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 364 of 405 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe acl-2.4.0-r0: task do_fetch: Started
NOTE: Running task 428 of 1102 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_unpack)
NOTE: recipe gperf-native-3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_fetch: Succeeded
NOTE: Running task 429 of 1102 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_unpack)
NOTE: recipe bison-native-3.8.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe popt-1.19-r0: task do_fetch: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 433 of 1102 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_unpack)
NOTE: recipe zlib-1.3.2-r0: task do_fetch: Succeeded
NOTE: recipe zlib-native-1.3.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running task 434 of 1102 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_unpack)
NOTE: Running task 435 of 1102 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_unpack)
NOTE: recipe libtool-native-2.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe gawk-native-5.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe rsync-3.5.1-r0: task do_recipe_qa: Started
NOTE: recipe gperf-native-3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_unpack: Started
NOTE: recipe glibc-2.44+git-r0: task do_unpack: Started
NOTE: recipe pkgconf-native-3.0.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_unpack: Started
NOTE: recipe popt-1.19-r0: task do_unpack: Started
NOTE: recipe zlib-1.3.2-r0: task do_unpack: Started
NOTE: recipe attr-native-2.6.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_unpack: Started
NOTE: recipe gawk-native-5.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-native-2.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 366 of 405 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/automake/automake_1.19.bb:do_create_spdx_setscene)
NOTE: recipe attr-2.6.0-r0: task do_unpack: Succeeded
NOTE: recipe popt-1.19-r0: task do_unpack: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_unpack: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_unpack: Succeeded
NOTE: recipe attr-native-2.6.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe pkgconf-native-3.0.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_unpack: Succeeded
NOTE: Running setscene task 368 of 405 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-native_2.6.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe automake-native-1.19-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-native-2.6.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe automake-native-1.19-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 369 of 405 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/autoconf/autoconf_2.73.bb:do_create_spdx_setscene)
NOTE: recipe libtool-native-2.6.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 370 of 405 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/automake/automake_1.19.bb:do_create_recipe_spdx_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 452 of 1102 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_unpack)
NOTE: recipe rsync-3.5.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 453 of 1102 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rsync/rsync_3.5.1.bb:do_fetch)
NOTE: recipe autoconf-native-2.73-r0: task do_create_spdx_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Started
NOTE: recipe automake-native-1.19-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe rsync-3.5.1-r0: task do_fetch: Started
NOTE: recipe autoconf-native-2.73-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 375 of 405 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy-native.bb:do_create_spdx_setscene)
NOTE: recipe rsync-3.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 476 of 1102 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rsync/rsync_3.5.1.bb:do_unpack)
NOTE: recipe automake-native-1.19-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 378 of 405 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/autoconf/autoconf_2.73.bb:do_create_recipe_spdx_setscene)
NOTE: recipe texinfo-dummy-native-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe rsync-3.5.1-r0: task do_unpack: Started
NOTE: recipe texinfo-dummy-native-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe autoconf-native-2.73-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe rsync-3.5.1-r0: task do_unpack: Succeeded
NOTE: recipe autoconf-native-2.73-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 382 of 405 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy-native.bb:do_create_recipe_spdx_setscene)
NOTE: recipe texinfo-dummy-native-1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe texinfo-dummy-native-1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running task 510 of 1102 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rsync/rsync_3.5.1.bb:do_create_recipe_spdx)
NOTE: recipe rsync-native-3.5.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Succeeded
NOTE: recipe gcc-cross-x86_64-16.2.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: Running setscene task 387 of 405 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/unifdef/unifdef_2.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 390 of 405 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pkgconf/pkgconf_3.0.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 391 of 405 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/bison/bison_3.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 392 of 405 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 520 of 1102 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rsync/rsync_3.5.1.bb:do_recipe_qa)
NOTE: Running task 521 of 1102 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-source_16.2.bb:do_fetch)
NOTE: recipe gcc-source-16.2.0-16.2.0-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe unifdef-native-2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pkgconf-native-3.0.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bison-native-3.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rsync-native-3.5.1-r0: task do_recipe_qa: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 523 of 1102 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_fetch)
NOTE: recipe unifdef-native-2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 395 of 405 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/unifdef/unifdef_2.12.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-7.2-r0: task do_fetch: Started
NOTE: recipe bison-native-3.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 397 of 405 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/bison/bison_3.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe pkgconf-native-3.0.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 398 of 405 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/automake/automake_1.19.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 400 of 405 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pkgconf/pkgconf_3.0.7.bb:do_recipe_qa_setscene)
NOTE: recipe unifdef-native-2.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe rsync-native-3.5.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe rsync-native-3.5.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 524 of 1102 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rsync/rsync_3.5.1.bb:do_fetch)
NOTE: Running task 525 of 1102 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_create_recipe_spdx)
NOTE: recipe bison-native-3.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe unifdef-native-2.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe automake-native-1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pkgconf-native-3.0.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bison-native-3.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe rsync-native-3.5.1-r0: task do_fetch: Started
NOTE: recipe rsync-native-3.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 542 of 1102 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rsync/rsync_3.5.1.bb:do_unpack)
NOTE: recipe pkgconf-native-3.0.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe automake-native-1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 402 of 405 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/autoconf/autoconf_2.73.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 403 of 405 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/automake/automake_1.19.bb:do_recipe_qa_setscene)
NOTE: recipe rsync-native-3.5.1-r0: task do_unpack: Started
NOTE: recipe autoconf-native-2.73-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe automake-native-1.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 550 of 1102 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.44.bb:do_create_recipe_spdx)
NOTE: recipe rsync-native-3.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 551 of 1102 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rsync/rsync_3.5.1.bb:do_patch)
NOTE: recipe automake-native-1.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glibc-2.44+git-r0: task do_create_recipe_spdx: Started
NOTE: recipe autoconf-native-2.73-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 405 of 405 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/autoconf/autoconf_2.73.bb:do_recipe_qa_setscene)
NOTE: recipe rsync-native-3.5.1-r0: task do_patch: Started
NOTE: recipe autoconf-native-2.73-r0: task do_recipe_qa_setscene: Started
NOTE: recipe autoconf-native-2.73-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 717 of 1102 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rsync/rsync_3.5.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 826 of 1102 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_patch)
NOTE: recipe gcc-source-16.2.0-16.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 867 of 1102 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_patch)
NOTE: Running task 868 of 1102 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_patch)
NOTE: Running task 880 of 1102 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-source_16.2.bb:do_unpack)
NOTE: Running task 916 of 1102 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_patch)
NOTE: Running task 917 of 1102 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_patch)
NOTE: Running task 918 of 1102 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_patch)
NOTE: Running task 925 of 1102 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rsync/rsync_3.5.1.bb:do_patch)
NOTE: recipe rsync-native-3.5.1-r0: task do_patch: Succeeded
NOTE: Running task 946 of 1102 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rsync/rsync_3.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libtool-cross-2.6.2-r0: task do_patch: Started
NOTE: recipe gcc-source-16.2.0-16.2.0-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Started
NOTE: recipe rsync-native-3.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe attr-2.6.0-r0: task do_patch: Started
NOTE: recipe zlib-1.3.2-r0: task do_patch: Started
NOTE: recipe popt-1.19-r0: task do_patch: Started
NOTE: recipe rsync-3.5.1-r0: task do_patch: Started
NOTE: recipe acl-2.4.0-r0: task do_patch: Started
NOTE: recipe rsync-native-3.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glibc-2.44+git-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 947 of 1102 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_create_recipe_spdx)
NOTE: recipe attr-2.6.0-r0: task do_patch: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_patch: Succeeded
NOTE: recipe popt-1.19-r0: task do_patch: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_patch: Succeeded
NOTE: recipe libgcc-16.2.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Succeeded
NOTE: recipe rsync-native-3.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe rsync-3.5.1-r0: task do_patch: Succeeded
NOTE: Running task 953 of 1102 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rsync/rsync_3.5.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 954 of 1102 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rsync/rsync_3.5.1.bb:do_populate_lic)
NOTE: recipe rsync-native-3.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcc-16.2.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 955 of 1102 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rsync/rsync_3.5.1.bb:do_configure)
NOTE: Running task 956 of 1102 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_create_recipe_spdx)
NOTE: recipe rsync-3.5.1-r0: task do_populate_lic: Started
NOTE: recipe rsync-3.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe rsync-native-3.5.1-r0: task do_configure: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_fetch: Succeeded
NOTE: Running task 957 of 1102 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_unpack)
NOTE: recipe libtool-cross-2.6.2-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_unpack: Started
NOTE: recipe rsync-3.5.1-r0: task do_populate_lic: Succeeded
NOTE: recipe rsync-3.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 959 of 1102 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_create_recipe_spdx)
NOTE: Running task 960 of 1102 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_recipe_spdx)
NOTE: Running task 961 of 1102 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_recipe_spdx)
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 962 of 1102 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_create_recipe_spdx)
NOTE: recipe popt-1.19-r0: task do_create_recipe_spdx: Started
NOTE: recipe popt-1.19-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 963 of 1102 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_create_recipe_spdx)
NOTE: recipe attr-2.6.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe attr-2.6.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 964 of 1102 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_create_recipe_spdx)
NOTE: recipe acl-2.4.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe acl-2.4.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 965 of 1102 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rsync/rsync_3.5.1.bb:do_create_recipe_spdx)
NOTE: recipe rsync-3.5.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe rsync-3.5.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe glibc-2.44+git-r0: task do_unpack: Succeeded
NOTE: Running task 966 of 1102 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.44.bb:do_patch)
NOTE: recipe glibc-2.44+git-r0: task do_patch: Started
NOTE: recipe glibc-2.44+git-r0: task do_patch: Succeeded
NOTE: recipe gcc-source-16.2.0-16.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 968 of 1102 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-source_16.2.bb:do_patch)
NOTE: recipe gcc-source-16.2.0-16.2.0-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_unpack: Succeeded
NOTE: Running task 969 of 1102 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_patch)
NOTE: recipe linux-libc-headers-7.2-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_patch: Succeeded
NOTE: recipe gcc-source-16.2.0-16.2.0-r0: task do_patch: Succeeded
NOTE: Running task 972 of 1102 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-source_16.2.bb:do_preconfigure)
NOTE: recipe gcc-source-16.2.0-16.2.0-r0: task do_preconfigure: Started
NOTE: recipe gcc-source-16.2.0-16.2.0-r0: task do_preconfigure: Succeeded
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-native_2.6.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/autoconf/autoconf_2.73.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/automake/automake_1.19.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.
 0.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['gettext-minimal-native', 'libtool-native', 'm4-native', 'quilt-native', 'texinfo-dummy-native', 'zlib-native', 'autoconf-native', 'automake-native', 'gnu-config-native', 'acl-native', 'attr-native', 'popt-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_sitefiles
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64', 'x86_64-linux', 'common']
| DEBUG: Python function autotools_sitefiles finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing ACLOCAL="aclocal --aclocal-path=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/rsync-native/3.5.1/recipe-sysroot-native/usr/share/aclocal/" autoreconf -Wcross --verbose --install --force --exclude=autopoint
| autoreconf: export WARNINGS=cross,no-obsolete
| autoreconf: Entering directory '.'
| autoreconf: configure.ac: not running autopoint: --exclude autopoint was given
| autoreconf: running: aclocal --aclocal-path=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/rsync-native/3.5.1/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: configure.ac: tracing
| autoreconf: configure.ac: not using Libtool
| autoreconf: configure.ac: not using Intltool
| autoreconf: configure.ac: not using Gtkdoc
| autoreconf: configure.ac: no need to run autopoint (confirmed)
| autoreconf: running: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/rsync-native/3.5.1/recipe-sysroot-native/usr/bin/autoconf --force
| configure.ac:317: warning: AC_RUN_IFELSE called without default to allow cross compiling
| ../sources/autoconf-2.73/lib/autoconf/general.m4:3037: AC_RUN_IFELSE is expanded from...
| configure.ac:317: the top level
| autoreconf: running: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/rsync-native/3.5.1/recipe-sysroot-native/usr/bin/autoheader --force
| autoreconf: configure.ac: not using Automake
| autoreconf: './config.sub' is updated
| autoreconf: './config.guess' is updated
| autoreconf: './install-sh' is updated
| autoreconf: configure.ac: not running make: --make not given
| autoreconf: Leaving directory '.'
| NOTE: Running ./configure  --build=x86_64-linux 		  --host=x86_64-linux 		  --target=x86_64-linux 		  --prefix=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/rsync-native/3.5.1/recipe-sysroot-native/usr 		  --exec_prefix=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/rsync-native/3.5.1/recipe-sysroot-native/usr 		  --bindir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/rsync-native/3.5.1/recipe-sysroot-native/usr/bin 		  --sbindir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/rsync-native/3.5.1/recipe-sysroot-native/usr/sbin 		  --libexecdir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/rsync-native/3.5.1/recipe-sysroot-native/usr/libexec 		  --datadir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/rsync-native/3.5.1/recipe-sysroot-native/usr/share 		  --sysconfdir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/rsync-native/3.5.1/recipe-sysroot-nat
 ive/etc 		  --sharedstatedir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/rsync-native/3.5.1/recipe-sysroot-native/com 		  --localstatedir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/rsync-native/3.5.1/recipe-sysroot-native/var 		  --libdir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/rsync-native/3.5.1/recipe-sysroot-native/usr/lib 		  --includedir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/rsync-native/3.5.1/recipe-sysroot-native/usr/include 		  --oldincludedir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/rsync-native/3.5.1/recipe-sysroot-native/usr/include 		  --infodir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/rsync-native/3.5.1/recipe-sysroot-native/usr/share/info 		  --mandir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/rsync-native/3.5.1/recipe-sysroot-native/usr/share/man 		  --disable-silent-rules 		  --disable-dependency-t
 racking --disable-md2man --with-nobody-group=nogroup --without-included-zlib --disable-static  --enable-acl-support --enable-xattr-support --enable-ipv6 --disable-lz4 --disable-openssl --disable-xxhash --disable-zstd
| configure: WARNING: unrecognized options: --disable-silent-rules, --disable-dependency-tracking, --disable-static
| configure: loading site script /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/site/endian-little
| configure: loading site script /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/site/common-linux
| configure: loading site script /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/site/common-glibc
| configure: loading site script /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/site/x86_64-linux
| configure: loading site script /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/site/common
| checking for x86_64-linux-gcc... gcc
| checking whether the C compiler works... yes
| checking for C compiler default output file name... a.out
| checking for suffix of executables...
| checking whether we are cross compiling... no
| checking for suffix of object files... o
| checking whether the compiler supports GNU C... yes
| checking whether gcc  accepts -g... yes
| checking for gcc  option to enable C23 features... -std=gnu23
| checking for stdio.h... yes
| checking for stdlib.h... yes
| checking for string.h... yes
| checking for inttypes.h... yes
| checking for stdint.h... yes
| checking for strings.h... yes
| checking for sys/stat.h... yes
| checking for sys/types.h... yes
| checking for unistd.h... yes
| checking for utime.h... yes
| checking whether byte ordering is bigendian... (cached) no
| checking for dirent.h that defines DIR... yes
| checking for library containing opendir... none required
| checking for sys/wait.h that is POSIX.1 compatible... yes
| checking for poll.h... yes
| checking for sys/fcntl.h... yes
| checking for sys/select.h... yes
| checking for fcntl.h... yes
| checking for sys/time.h... yes
| checking for sys/unistd.h... yes
| checking for unistd.h... (cached) yes
| checking for utime.h... (cached) yes
| checking for compat.h... no
| checking for sys/param.h... yes
| checking for ctype.h... yes
| checking for sys/wait.h... (cached) yes
| checking for sys/stat.h... (cached) yes
| checking for sys/ioctl.h... yes
| checking for sys/filio.h... no
| checking for string.h... (cached) yes
| checking for stdlib.h... (cached) yes
| checking for sys/socket.h... yes
| checking for sys/mode.h... no
| checking for grp.h... yes
| checking for sys/un.h... yes
| checking for sys/attr.h... no
| checking for arpa/inet.h... yes
| checking for arpa/nameser.h... yes
| checking for locale.h... yes
| checking for sys/types.h... (cached) yes
| checking for netdb.h... yes
| checking for malloc.h... yes
| checking for float.h... yes
| checking for limits.h... yes
| checking for iconv.h... yes
| checking for libcharset.h... no
| checking for langinfo.h... yes
| checking for mcheck.h... yes
| checking for sys/acl.h... yes
| checking for acl/libacl.h... yes
| checking for attr/xattr.h... no
| checking for sys/xattr.h... yes
| checking for sys/extattr.h... no
| checking for dl.h... no
| checking for popt.h... yes
| checking for popt/popt.h... no
| checking for linux/falloc.h... yes
| checking for netinet/in_systm.h... yes
| checking for netgroup.h... no
| checking for zlib.h... yes
| checking for xxhash.h... no
| checking for openssl/md4.h... no
| checking for openssl/md5.h... no
| checking for zstd.h... no
| checking for lz4.h... no
| checking for sys/file.h... yes
| checking for sys/resource.h... yes
| checking for bsd/string.h... no
| checking for idn2.h... no
| checking for netinet/ip.h... yes
| checking whether sys/types.h defines makedev... no
| checking for sys/mkdev.h... no
| checking for sys/sysmacros.h... yes
| configure: Configuring rsync 3.5.1
| checking build system type... x86_64-pc-linux-gnu
| checking host system type... x86_64-pc-linux-gnu
| checking whether to include debugging symbols... yes
| checking for x86_64-linux-gcc... (cached) gcc
| checking whether the compiler supports GNU C... (cached) yes
| checking whether gcc  accepts -g... (cached) yes
| checking for gcc  option to enable C23 features... (cached) -std=gnu23
| checking how to run the C preprocessor... gcc  -E
| checking whether the compiler supports GNU C++... yes
| checking whether g++  accepts -g... yes
| checking for gawk... gawk
| checking for grep that handles long lines and -e... /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/grep
| checking for egrep... /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/grep -E
| checking for a BSD-compatible install... /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c
| checking for x86_64-linux-strip... strip
| checking for a race-free mkdir -p... /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p
| checking for perl... /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/perl
| checking for python3... /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/python3
| checking if md2man can create manpages... no
| Failed to find cmarkgfm or commonmark for python3.
| checking if we require man-page building... no
| checking for remsh... 0
| checking for sh... /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/sh
| checking for fakeroot... /usr/bin/fakeroot
| checking whether to enable rolling-checksum SIMD optimizations... yes (x86_64)
| checking if assembler accepts noexecstack... yes
| checking for openat2... yes
| checking for broken largefile support... no
| checking for gcc  -std=gnu23 option to support large files... none needed
| checking whether to enable ipv6... yes
| checking whether to call shutdown on all sockets... no
| checking for deflateParams in -lz... yes
| checking whether to use included zlib... no
| checking whether to enable use of openssl crypto library... no
| checking whether to enable MD5 ASM optimizations... yes (x86_64)
| checking whether to enable rolling-checksum ASM optimizations... no
| checking whether to enable xxhash checksum support... no
| checking whether to enable zstd compression... no
| checking whether to enable LZ4 compression... no
| checking whether to enable IDN support... no
| 
| Configure found the following issues:
| 
| - Failed to find idn2.h for IDN support.
| 
| See the INSTALL file for hints on how to install the missing libraries and/or
| how to generate (or fetch) manpages:
|     https://github.com/RsyncProject/rsync/blob/master/INSTALL.md
| 
| To disable one or more features, the relevant configure options are:
|     --disable-idn
| 
| configure: error: Aborting configure run
| NOTE: The following config.log files may provide further information.
| NOTE: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/rsync-native/3.5.1/sources/rsync-3.5.1/config.log
| ERROR: configure failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/rsync-native/3.5.1/temp/run.do_configure.288634:277 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/rsync-native/3.5.1/temp/run.do_configure.288634, line 277
| 	#2: oe_runconf, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/rsync-native/3.5.1/temp/run.do_configure.288634, line 253
| 	#3: autotools_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/rsync-native/3.5.1/temp/run.do_configure.288634, line 226
| 	#4: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/rsync-native/3.5.1/temp/run.do_configure.288634, line 147
| 	#5: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/rsync-native/3.5.1/temp/run.do_configure.288634, line 281
NOTE: recipe rsync-native-3.5.1-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 976 tasks of which 921 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260921051400.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260921051400.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rsync/rsync_3.5.1.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/rsync-native/3.5.1/temp/log.do_configure.288634
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: rsync-native-3.5.1-r0 do_configure: configure failed
ERROR: rsync-native-3.5.1-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/rsync-native/3.5.1/temp/run.do_configure.288634' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/rsync-native/3.5.1/temp/log.do_configure.288634
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rsync/rsync_3.5.1.bb:do_configure) failed with exit code '1'

--===============6799833431488842124==--

