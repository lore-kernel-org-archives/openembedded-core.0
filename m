Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5339.1793687205659172838
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2026 22:26:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=HBvnaZOE;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=WVgW5P2a;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101a1a016b3c3-325e26c9-af91-4144-855d-1d3fdb97576d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793687204;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=K4GdRuCmznjPsXcsGWJiRs7LqRV9yCdxS5dFX7aIkNM=;
	b=HBvnaZOE08nRDeyNo8qJzS1mfnqcdFOPp8FKxvwPCxCQqtd29FYWTfviRzDhKmhA
	JyzdJ6/neg1xWFVZZDHzlb9/k6ZXInCEW8+FN/Lxd/2rFcHxJCQ8EGF1y624SdjMa6G
	lpXYHwzdUlLi1AhdNTyRGu16Bvl/yu8x2JIhGpHY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793687204;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=K4GdRuCmznjPsXcsGWJiRs7LqRV9yCdxS5dFX7aIkNM=;
	b=WVgW5P2awpgF79uQ6kNeCpvGIp6v/lQwVEqt3lnCqZ8wEs/iDtWg6KqUZv3SuHfi
	NCMe9LB6P4TFBNDymypjmvPL6KQNeSVM2bBWTJitPqYDAtOxjxc7uL7qTq0kNituilr
	SgGKYUzpyTZJ6EJfUh3MlNr+Q5kq2CchXbjMtIjY=
Content-Type: multipart/mixed; boundary="===============5900856345481813981=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] nghttp2: upgrading to 1.71.0 SUCCEEDED
Message-ID: <010101a1a016b3c3-325e26c9-af91-4144-855d-1d3fdb97576d-000000@us-west-2.amazonses.com>
Date: Tue, 3 Nov 2026 06:26:44 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.03-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 06:26:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249244

--===============5900856345481813981==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *nghttp2* to *1.71.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-nghttp2-upgrade-1.70.0-1.71.0.patch
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
From b2a81bf82c56570b010aa20fa7fbc625c2cd3fbb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 3 Nov 2026 06:26:35 +0000
Subject: [PATCH] nghttp2: upgrade 1.70.0 -> 1.71.0

Update bash_completion
Update manual pages
Bump package and library versions
Update AUTHORS
Bump ngtcp2 and nghttp3
GHA: Remove macos-15
Remove public server text
Update window upfront
Update remote window upfront when DATA is sent
Increase recv window when DATA frame header is received
Bump deps
Fix docker build
Bump wolfssl to v5.9.4-stable
Bump aws-lc to v5.12.0
Bump boringssl
Bump libbpf to v1.8.0
Simplify map insertion
Fix priority update
Simplify map insertion
build(deps): bump github.com/quic-go/quic-go from 0.64.0 to 0.64.1
Remove LICENSE file
Add oss-scanner files
Better map hasher
build(deps): bump github.com/quic-go/quic-go from 0.64.0 to 0.64.1
nghttp2_nv_array_copy: Detect size_t overflow
Update doc
Fix signed integer overflow in nghttp2_session_get_stream_local_window_size
Deal with too large window size when consuming data
build(deps): bump github.com/quic-go/quic-go from 0.63.0 to 0.64.0
GHA: Use aws-lc instead of openssl for macos build
build(deps): bump golang.org/x/net from 0.59.0 to 0.61.0
Update doc
bpf: Avoid verifier instruction limits
nghttpx: Fix the bug that GSO on QUIC connection is disabled
Update GitHub funding configuration
build(deps): bump github.com/quic-go/quic-go from 0.62.0 to 0.63.0
build(deps): bump golang.org/x/net from 0.58.0 to 0.59.0
GHA: Reduce cmake and macos jobs
GHA: Remove cygwin build because it stopped functioning
GHA: Reduce openssl1 jobs
GHA: Use packaged OpenSSL
Bump ubuntu
Bump ubuntu to 26.04 for android Dockerfile
GHA: Bump ubuntu to 26.04
GHA: Bump clang to 21
Bump neverbleed
nghttpx: Remove server push
Bump clang-format to 21
lib: Disallow HEADERS and PUSH_PROMISE in CONNECT stream
nghttpx: Rewrite CertLookupTree based on RFC 9525 rules
nghttpx: Client TLS certificate validation based on RFC 9525
nghttpx: Refactor Router
build(deps): bump github.com/quic-go/quic-go from 0.61.0 to 0.62.0
Bump go to 1.26
Munit cxx assertions
src: Use munit C++ assertions
tests: Bump munit
GHA: Use g++-15
Gha bump ubuntu
GHA: Disable examples with aws-lc as well
GHA: Bump ubuntu to 26.04
build(deps): bump golang.org/x/net from 0.57.0 to 0.58.0
nghttpx: Check QUIC version
Add length check for CONTINUATION
util: add <fstream> include
build(deps): bump actions/stale from 10 to 11
Revert "Take into account idle streams"
Add option to limit the maximum outbound queue size
Take into account idle streams
build(deps): bump actions/stale from 10 to 11
Bump package version
---
 .../nghttp2/{nghttp2_1.70.0.bb => nghttp2_1.71.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/nghttp2/{nghttp2_1.70.0.bb => nghttp2_1.71.0.bb} (84%)

diff --git a/meta/recipes-support/nghttp2/nghttp2_1.70.0.bb b/meta/recipes-support/nghttp2/nghttp2_1.71.0.bb
similarity index 84%
rename from meta/recipes-support/nghttp2/nghttp2_1.70.0.bb
rename to meta/recipes-support/nghttp2/nghttp2_1.71.0.bb
index 1b09f91ce6..214545ab81 100644
--- a/meta/recipes-support/nghttp2/nghttp2_1.70.0.bb
+++ b/meta/recipes-support/nghttp2/nghttp2_1.71.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=764abdf30b2eadd37ce47dcbce0ea1ec"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/nghttp2-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "e05cb1388eaca3830aded4ccf20044b6e1ac1a61411dcca11b0437c4285c8bc2"
+SRC_URI[sha256sum] = "c0f55121d88650e4b9227aec28cebaf664d2417ca60fe70be0f8d38829f52116"
 
 inherit cmake manpages python3native github-releases
 
-- 
2.47.1


--===============5900856345481813981==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/nghttp2: PV changed from "1.70.0" to "1.71.0"
packages/x86-64-v3-poky-linux/nghttp2: SRC_URI changed from "https://github.com/nghttp2/nghttp2/releases//download/v1.70.0/nghttp2-1.70.0.tar.xz" to "https://github.com/nghttp2/nghttp2/releases//download/v1.71.0/nghttp2-1.71.0.tar.xz"
packages/x86-64-v3-poky-linux/nghttp2: PKGV changed from 1.70.0 [default] to 1.71.0 [default]
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-dbg: PV changed from "1.70.0" to "1.71.0"
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-dbg: PKGSIZE changed from 638632 to 644168 (+1%)
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-dbg: PKGV changed from 1.70.0 [default] to 1.71.0 [default]
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-dbg: FILELIST: removed "/usr/lib/.debug/libnghttp2.so.14.29.5", added "/usr/lib/.debug/libnghttp2.so.14.30.0"
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-dev: PV changed from "1.70.0" to "1.71.0"
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-dev: PKGSIZE changed from 253584 to 254636 (+0%)
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-dev: PKGV changed from 1.70.0 [default] to 1.71.0 [default]
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-doc: PV changed from "1.70.0" to "1.71.0"
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-doc: PKGSIZE changed from 49546 to 49388 (-0%)
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-doc: PKGV changed from 1.70.0 [default] to 1.71.0 [default]
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-locale: PV changed from "1.70.0" to "1.71.0"
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-locale: PKGV changed from 1.70.0 [default] to 1.71.0 [default]
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-src: PV changed from "1.70.0" to "1.71.0"
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-src: PKGSIZE changed from 1050159 to 1054646 (+0%)
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-src: PKGV changed from 1.70.0 [default] to 1.71.0 [default]
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-src: FILELIST: directory renamed /usr/src/debug/nghttp2/1.70.0/lib/includes/nghttp2 -> /usr/src/debug/nghttp2/1.71.0/lib/includes/nghttp2, directory renamed /usr/src/debug/nghttp2/1.70.0/lib -> /usr/src/debug/nghttp2/1.71.0/lib
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-staticdev: PV changed from "1.70.0" to "1.71.0"
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-staticdev: PKGV changed from 1.70.0 [default] to 1.71.0 [default]
packages/x86-64-v3-poky-linux/nghttp2/nghttp2: PV changed from "1.70.0" to "1.71.0"
packages/x86-64-v3-poky-linux/nghttp2/nghttp2: PKGV changed from 1.70.0 [default] to 1.71.0 [default]
packages/x86-64-v3-poky-linux/nghttp2/nghttp2: FILELIST: removed "/usr/lib/libnghttp2.so.14.29.5", added "/usr/lib/libnghttp2.so.14.30.0"
Changes to packages/x86-64-v3-poky-linux/nghttp2 (sysroot):
  /usr/lib/libnghttp2.so.14 changed symlink target from libnghttp2.so.14.29.5 to libnghttp2.so.14.30.0
  /usr/lib/libnghttp2.so.14.29.5 moved to /usr/lib/libnghttp2.so.14.30.0

--===============5900856345481813981==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="nghttp2-changelog.txt"

Update bash_completion
Update manual pages
Bump package and library versions
Update AUTHORS
Bump ngtcp2 and nghttp3
GHA: Remove macos-15
Remove public server text
Update window upfront
Update remote window upfront when DATA is sent
Increase recv window when DATA frame header is received
Bump deps
Fix docker build
Bump wolfssl to v5.9.4-stable
Bump aws-lc to v5.12.0
Bump boringssl
Bump libbpf to v1.8.0
Simplify map insertion
Fix priority update
Simplify map insertion
build(deps): bump github.com/quic-go/quic-go from 0.64.0 to 0.64.1
Remove LICENSE file
Add oss-scanner files
Better map hasher
build(deps): bump github.com/quic-go/quic-go from 0.64.0 to 0.64.1
nghttp2_nv_array_copy: Detect size_t overflow
Update doc
Fix signed integer overflow in nghttp2_session_get_stream_local_window_size
Deal with too large window size when consuming data
build(deps): bump github.com/quic-go/quic-go from 0.63.0 to 0.64.0
GHA: Use aws-lc instead of openssl for macos build
build(deps): bump golang.org/x/net from 0.59.0 to 0.61.0
Update doc
bpf: Avoid verifier instruction limits
nghttpx: Fix the bug that GSO on QUIC connection is disabled
Update GitHub funding configuration
build(deps): bump github.com/quic-go/quic-go from 0.62.0 to 0.63.0
build(deps): bump golang.org/x/net from 0.58.0 to 0.59.0
GHA: Reduce cmake and macos jobs
GHA: Remove cygwin build because it stopped functioning
GHA: Reduce openssl1 jobs
GHA: Use packaged OpenSSL
Bump ubuntu
Bump ubuntu to 26.04 for android Dockerfile
GHA: Bump ubuntu to 26.04
GHA: Bump clang to 21
Bump neverbleed
nghttpx: Remove server push
Bump clang-format to 21
lib: Disallow HEADERS and PUSH_PROMISE in CONNECT stream
nghttpx: Rewrite CertLookupTree based on RFC 9525 rules
nghttpx: Client TLS certificate validation based on RFC 9525
nghttpx: Refactor Router
build(deps): bump github.com/quic-go/quic-go from 0.61.0 to 0.62.0
Bump go to 1.26
Munit cxx assertions
src: Use munit C++ assertions
tests: Bump munit
GHA: Use g++-15
Gha bump ubuntu
GHA: Disable examples with aws-lc as well
GHA: Bump ubuntu to 26.04
build(deps): bump golang.org/x/net from 0.57.0 to 0.58.0
nghttpx: Check QUIC version
Add length check for CONTINUATION
util: add <fstream> include
build(deps): bump actions/stale from 10 to 11
Revert "Take into account idle streams"
Add option to limit the maximum outbound queue size
Take into account idle streams
build(deps): bump actions/stale from 10 to 11
Bump package version

--===============5900856345481813981==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-nghttp2-upgrade-1.70.0-1.71.0.patch"

RnJvbSBiMmE4MWJmODJjNTY1NzBiMDEwYWEyMGZhN2ZiYzYyNWMyY2QzZmJiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMyBOb3YgMjAyNiAwNjoyNjozNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG5n
aHR0cDI6IHVwZ3JhZGUgMS43MC4wIC0+IDEuNzEuMAoKVXBkYXRlIGJhc2hfY29tcGxldGlvbgpV
cGRhdGUgbWFudWFsIHBhZ2VzCkJ1bXAgcGFja2FnZSBhbmQgbGlicmFyeSB2ZXJzaW9ucwpVcGRh
dGUgQVVUSE9SUwpCdW1wIG5ndGNwMiBhbmQgbmdodHRwMwpHSEE6IFJlbW92ZSBtYWNvcy0xNQpS
ZW1vdmUgcHVibGljIHNlcnZlciB0ZXh0ClVwZGF0ZSB3aW5kb3cgdXBmcm9udApVcGRhdGUgcmVt
b3RlIHdpbmRvdyB1cGZyb250IHdoZW4gREFUQSBpcyBzZW50CkluY3JlYXNlIHJlY3Ygd2luZG93
IHdoZW4gREFUQSBmcmFtZSBoZWFkZXIgaXMgcmVjZWl2ZWQKQnVtcCBkZXBzCkZpeCBkb2NrZXIg
YnVpbGQKQnVtcCB3b2xmc3NsIHRvIHY1LjkuNC1zdGFibGUKQnVtcCBhd3MtbGMgdG8gdjUuMTIu
MApCdW1wIGJvcmluZ3NzbApCdW1wIGxpYmJwZiB0byB2MS44LjAKU2ltcGxpZnkgbWFwIGluc2Vy
dGlvbgpGaXggcHJpb3JpdHkgdXBkYXRlClNpbXBsaWZ5IG1hcCBpbnNlcnRpb24KYnVpbGQoZGVw
cyk6IGJ1bXAgZ2l0aHViLmNvbS9xdWljLWdvL3F1aWMtZ28gZnJvbSAwLjY0LjAgdG8gMC42NC4x
ClJlbW92ZSBMSUNFTlNFIGZpbGUKQWRkIG9zcy1zY2FubmVyIGZpbGVzCkJldHRlciBtYXAgaGFz
aGVyCmJ1aWxkKGRlcHMpOiBidW1wIGdpdGh1Yi5jb20vcXVpYy1nby9xdWljLWdvIGZyb20gMC42
NC4wIHRvIDAuNjQuMQpuZ2h0dHAyX252X2FycmF5X2NvcHk6IERldGVjdCBzaXplX3Qgb3ZlcmZs
b3cKVXBkYXRlIGRvYwpGaXggc2lnbmVkIGludGVnZXIgb3ZlcmZsb3cgaW4gbmdodHRwMl9zZXNz
aW9uX2dldF9zdHJlYW1fbG9jYWxfd2luZG93X3NpemUKRGVhbCB3aXRoIHRvbyBsYXJnZSB3aW5k
b3cgc2l6ZSB3aGVuIGNvbnN1bWluZyBkYXRhCmJ1aWxkKGRlcHMpOiBidW1wIGdpdGh1Yi5jb20v
cXVpYy1nby9xdWljLWdvIGZyb20gMC42My4wIHRvIDAuNjQuMApHSEE6IFVzZSBhd3MtbGMgaW5z
dGVhZCBvZiBvcGVuc3NsIGZvciBtYWNvcyBidWlsZApidWlsZChkZXBzKTogYnVtcCBnb2xhbmcu
b3JnL3gvbmV0IGZyb20gMC41OS4wIHRvIDAuNjEuMApVcGRhdGUgZG9jCmJwZjogQXZvaWQgdmVy
aWZpZXIgaW5zdHJ1Y3Rpb24gbGltaXRzCm5naHR0cHg6IEZpeCB0aGUgYnVnIHRoYXQgR1NPIG9u
IFFVSUMgY29ubmVjdGlvbiBpcyBkaXNhYmxlZApVcGRhdGUgR2l0SHViIGZ1bmRpbmcgY29uZmln
dXJhdGlvbgpidWlsZChkZXBzKTogYnVtcCBnaXRodWIuY29tL3F1aWMtZ28vcXVpYy1nbyBmcm9t
IDAuNjIuMCB0byAwLjYzLjAKYnVpbGQoZGVwcyk6IGJ1bXAgZ29sYW5nLm9yZy94L25ldCBmcm9t
IDAuNTguMCB0byAwLjU5LjAKR0hBOiBSZWR1Y2UgY21ha2UgYW5kIG1hY29zIGpvYnMKR0hBOiBS
ZW1vdmUgY3lnd2luIGJ1aWxkIGJlY2F1c2UgaXQgc3RvcHBlZCBmdW5jdGlvbmluZwpHSEE6IFJl
ZHVjZSBvcGVuc3NsMSBqb2JzCkdIQTogVXNlIHBhY2thZ2VkIE9wZW5TU0wKQnVtcCB1YnVudHUK
QnVtcCB1YnVudHUgdG8gMjYuMDQgZm9yIGFuZHJvaWQgRG9ja2VyZmlsZQpHSEE6IEJ1bXAgdWJ1
bnR1IHRvIDI2LjA0CkdIQTogQnVtcCBjbGFuZyB0byAyMQpCdW1wIG5ldmVyYmxlZWQKbmdodHRw
eDogUmVtb3ZlIHNlcnZlciBwdXNoCkJ1bXAgY2xhbmctZm9ybWF0IHRvIDIxCmxpYjogRGlzYWxs
b3cgSEVBREVSUyBhbmQgUFVTSF9QUk9NSVNFIGluIENPTk5FQ1Qgc3RyZWFtCm5naHR0cHg6IFJl
d3JpdGUgQ2VydExvb2t1cFRyZWUgYmFzZWQgb24gUkZDIDk1MjUgcnVsZXMKbmdodHRweDogQ2xp
ZW50IFRMUyBjZXJ0aWZpY2F0ZSB2YWxpZGF0aW9uIGJhc2VkIG9uIFJGQyA5NTI1Cm5naHR0cHg6
IFJlZmFjdG9yIFJvdXRlcgpidWlsZChkZXBzKTogYnVtcCBnaXRodWIuY29tL3F1aWMtZ28vcXVp
Yy1nbyBmcm9tIDAuNjEuMCB0byAwLjYyLjAKQnVtcCBnbyB0byAxLjI2Ck11bml0IGN4eCBhc3Nl
cnRpb25zCnNyYzogVXNlIG11bml0IEMrKyBhc3NlcnRpb25zCnRlc3RzOiBCdW1wIG11bml0CkdI
QTogVXNlIGcrKy0xNQpHaGEgYnVtcCB1YnVudHUKR0hBOiBEaXNhYmxlIGV4YW1wbGVzIHdpdGgg
YXdzLWxjIGFzIHdlbGwKR0hBOiBCdW1wIHVidW50dSB0byAyNi4wNApidWlsZChkZXBzKTogYnVt
cCBnb2xhbmcub3JnL3gvbmV0IGZyb20gMC41Ny4wIHRvIDAuNTguMApuZ2h0dHB4OiBDaGVjayBR
VUlDIHZlcnNpb24KQWRkIGxlbmd0aCBjaGVjayBmb3IgQ09OVElOVUFUSU9OCnV0aWw6IGFkZCA8
ZnN0cmVhbT4gaW5jbHVkZQpidWlsZChkZXBzKTogYnVtcCBhY3Rpb25zL3N0YWxlIGZyb20gMTAg
dG8gMTEKUmV2ZXJ0ICJUYWtlIGludG8gYWNjb3VudCBpZGxlIHN0cmVhbXMiCkFkZCBvcHRpb24g
dG8gbGltaXQgdGhlIG1heGltdW0gb3V0Ym91bmQgcXVldWUgc2l6ZQpUYWtlIGludG8gYWNjb3Vu
dCBpZGxlIHN0cmVhbXMKYnVpbGQoZGVwcyk6IGJ1bXAgYWN0aW9ucy9zdGFsZSBmcm9tIDEwIHRv
IDExCkJ1bXAgcGFja2FnZSB2ZXJzaW9uCi0tLQogLi4uL25naHR0cDIve25naHR0cDJfMS43MC4w
LmJiID0+IG5naHR0cDJfMS43MS4wLmJifSAgICAgICAgICAgIHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLXN1
cHBvcnQvbmdodHRwMi97bmdodHRwMl8xLjcwLjAuYmIgPT4gbmdodHRwMl8xLjcxLjAuYmJ9ICg4
NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbmdodHRwMi9uZ2h0dHAyXzEu
NzAuMC5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L25naHR0cDIvbmdodHRwMl8xLjcxLjAuYmIK
c2ltaWxhcml0eSBpbmRleCA4NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvbmdo
dHRwMi9uZ2h0dHAyXzEuNzAuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvbmdo
dHRwMi9uZ2h0dHAyXzEuNzEuMC5iYgppbmRleCAxYjA5ZjkxY2U2Li4yMTQ1NDVhYjgxIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9uZ2h0dHAyL25naHR0cDJfMS43MC4wLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L25naHR0cDIvbmdodHRwMl8xLjcxLjAuYmIKQEAgLTYs
NyArNiw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTc2NGFiZGYz
MGIyZWFkZDM3Y2U0N2RjYmNlMGVhMWVjIgogCiBTUkNfVVJJID0gIiR7R0lUSFVCX0JBU0VfVVJJ
fS9kb3dubG9hZC92JHtQVn0vbmdodHRwMi0ke1BWfS50YXIueHoiCiAKLVNSQ19VUklbc2hhMjU2
c3VtXSA9ICJlMDVjYjEzODhlYWNhMzgzMGFkZWQ0Y2NmMjAwNDRiNmUxYWMxYTYxNDExZGNjYTEx
YjA0MzdjNDI4NWM4YmMyIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImMwZjU1MTIxZDg4NjUwZTRi
OTIyN2FlYzI4Y2ViYWY2NjRkMjQxN2NhNjBmZTcwYmUwZjhkMzg4MjlmNTIxMTYiCiAKIGluaGVy
aXQgY21ha2UgbWFucGFnZXMgcHl0aG9uM25hdGl2ZSBnaXRodWItcmVsZWFzZXMKIAotLSAKMi40
Ny4xCgo=

--===============5900856345481813981==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/nghttp2/nghttp2: FILELIST: removed "/usr/lib/libnghttp2.so.14.29.5", added "/usr/lib/libnghttp2.so.14.30.0"
Changes to packages/x86-64-v3-poky-linux/nghttp2 (sysroot):
  /usr/lib/libnghttp2.so.14 changed symlink target from libnghttp2.so.14.29.5 to libnghttp2.so.14.30.0
  /usr/lib/libnghttp2.so.14.29.5 moved to /usr/lib/libnghttp2.so.14.30.0

--===============5900856345481813981==--
