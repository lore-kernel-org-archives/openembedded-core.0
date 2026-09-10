Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02CC7C88E41
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 06:00:33 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7458.1789020028921149251
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 23:00:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=nGZz6Q7z;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=E1ZS3wtZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101a089e73c93-b97aaf06-babe-4b15-8491-b0ae867b25fe-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789020028;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=s3m4uWSQUJF9BgxhMpr/nwzEPNB1S5ogrTAA2j9s8uU=;
	b=nGZz6Q7zuZXvFLKk2j0IFB5vWlND4nh38vJtyjCZJsgFNuND8SHjLci7HuuFsPu+
	yosm+0in6RzMjvsvIAyZUZwvWHGiY4Rzz1S9IMgAJDMI+uWSjaJAW1XKV6i3sJ6F4rZ
	xcBbALfR9VBnnuEWtLp3nZxg9RZsMA7JfXIgo5Ys=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789020028;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=s3m4uWSQUJF9BgxhMpr/nwzEPNB1S5ogrTAA2j9s8uU=;
	b=E1ZS3wtZ0/u7SxX50EkHRNKMD07Lo28qNq9GpG4GK+FOAOaEDsv/M356CyJLI25K
	OYCEStqDuKRQjAzCxzWVxjFCjmrJ27if1VrCTsUpoFesyCpbq20YoNL/V4V+VLT2/vl
	GjImgwJS8oKMa158gsDchlGePK0OTnL1zcJN9yQk=
Content-Type: multipart/mixed; boundary="===============2430244094621967206=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] xz: upgrading to 5.8.4 SUCCEEDED
Message-ID: <010101a089e73c93-b97aaf06-babe-4b15-8491-b0ae867b25fe-000000@us-west-2.amazonses.com>
Date: Thu, 10 Sep 2026 06:00:28 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.10-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 06:00:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245535

--===============2430244094621967206==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *xz* to *5.8.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xz-upgrade-5.8.3-5.8.4.patch
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
From 814fffc75f24ce9ab49ceae29ba4be2cae8ef9ba Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 10 Sep 2026 06:00:21 +0000
Subject: [PATCH] xz: upgrade 5.8.3 -> 5.8.4

Source: NEWS

5.8.4 (2026-09-09)

    IMPORTANT: This includes a fix for a security issue that affects all
    XZ Utils versions since 5.0.0. This and a few other fixes have also
    been committed to the old stable branches (v5.2, v5.4, and v5.6) in
    the xz Git repository. Those fixes are marked below. No new 5.2.x,
    5.4.x, or 5.6.x releases will be made.

    * liblzma:

        - lzma_alone_decoder(), lzma_lzip_decoder(),
          lzma_auto_decoder(), and lzma_microlzma_decoder(): Fix an
          invalid memory access after memory allocation has failed and
          the application reinitializes the existing decoder to decode
          a different file. This bug could at least result in a crash.
          This is tracked as GHSA-5qpq-xqfv-j9pg. CVE number is pending.
          (Also in v5.2, v5.4, and v5.6.)

        - lzma_stream_buffer_decode(): Fix wrong error code and,
          in debug builds, assertion failure. LZMA_BUF_ERROR could
          be returned with truncated inputs while LZMA_DATA_ERROR
          is the correct one in this function.
          (Also in v5.2, v5.4, and v5.6.)

        - Fix a performance issue in the typical use case of
          lzma_index_cat(). Internally liblzma calls it from
          lzma_file_info_decoder(), so that was affected too. The
          problem occurred if the input .xz file was created by
          concatenating a large number of .xz files. A crafted file
          could make "xz --list" very slow or effectively hang.
          Normal decompression doesn't use these functions and
          thus wasn't affected.
          (Also in v5.2, v5.4, and v5.6.)

        - Fix a theoretical integer overflow in lzma_index_cat().
          (Also in v5.2, v5.4, and v5.6.)

        - Fix bogus memory usage report in lzma_index_decoder() when
          the .xz Index is obviously invalid. A huge bogus value could
          cause an integer overflow in lzma_file_info_decoder()'s
          memory usage reporting due to a missing overflow check,
          making lzma_memused() report an incorrect tiny value. This
          bug didn't affect the memory usage limiter in these two
          decoders; only the reporting via lzma_memused() was affected.
          (Also in v5.2, v5.4, and v5.6.)

        - Fix a too low memory usage report in lzma_index_decoder()
          if lzma_memused() is called after a part of the Index has
          already been decoded. The typical use case is to call
          lzma_memused() immediately after LZMA_MEMLIMIT_ERROR,
          which did work correctly.

        - Fix copying of check type in lzma_index_dup(). Calling
          lzma_index_checks() on the duplicated lzma_index returned
          return garbage a result. lzma_index_dup() is rarely used;
          liblzma doesn't use it internally and xz itself doesn't use
          it either.
          (Also in v5.2, v5.4, and v5.6.)

        - lzma_file_info_decoder() and lzma_index_decoder(): Reject
          an obviously-

[Changelog truncated as it exceeds 3000 characters;
the full changelog can be found in an attachment to the AUH email]
---
 meta/recipes-extended/xz/{xz_5.8.3.bb => xz_5.8.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/xz/{xz_5.8.3.bb => xz_5.8.4.bb} (97%)

diff --git a/meta/recipes-extended/xz/xz_5.8.3.bb b/meta/recipes-extended/xz/xz_5.8.4.bb
similarity index 97%
rename from meta/recipes-extended/xz/xz_5.8.3.bb
rename to meta/recipes-extended/xz/xz_5.8.4.bb
index 0735696011..cfb0574f0d 100644
--- a/meta/recipes-extended/xz/xz_5.8.3.bb
+++ b/meta/recipes-extended/xz/xz_5.8.4.bb
@@ -30,7 +30,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d38d562f6112174de93a9677682231b2 \
 SRC_URI = "https://github.com/tukaani-project/xz/releases/download/v${PV}/xz-${PV}.tar.gz \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "3d3a1b973af218114f4f889bbaa2f4c037deaae0c8e815eec381c3d546b974a0"
+SRC_URI[sha256sum] = "0014c7886930454fe8bd4228665b51af55eeae560ea135c9c4cd33f55b2591d9"
 UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
 UPSTREAM_CHECK_URI = "https://github.com/tukaani-project/xz/releases/"
 
-- 
2.47.1


--===============2430244094621967206==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-xz-upgrade-5.8.3-5.8.4.patch"

RnJvbSA4MTRmZmZjNzVmMjRjZTlhYjQ5Y2VhZTI5YmE0YmUyY2FlOGVmOWJhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTAgU2VwIDIwMjYgMDY6MDA6MjEgKzAwMDAKU3ViamVjdDogW1BBVENIXSB4
ejogdXBncmFkZSA1LjguMyAtPiA1LjguNAoKU291cmNlOiBORVdTCgo1LjguNCAoMjAyNi0wOS0w
OSkKCiAgICBJTVBPUlRBTlQ6IFRoaXMgaW5jbHVkZXMgYSBmaXggZm9yIGEgc2VjdXJpdHkgaXNz
dWUgdGhhdCBhZmZlY3RzIGFsbAogICAgWFogVXRpbHMgdmVyc2lvbnMgc2luY2UgNS4wLjAuIFRo
aXMgYW5kIGEgZmV3IG90aGVyIGZpeGVzIGhhdmUgYWxzbwogICAgYmVlbiBjb21taXR0ZWQgdG8g
dGhlIG9sZCBzdGFibGUgYnJhbmNoZXMgKHY1LjIsIHY1LjQsIGFuZCB2NS42KSBpbgogICAgdGhl
IHh6IEdpdCByZXBvc2l0b3J5LiBUaG9zZSBmaXhlcyBhcmUgbWFya2VkIGJlbG93LiBObyBuZXcg
NS4yLngsCiAgICA1LjQueCwgb3IgNS42LnggcmVsZWFzZXMgd2lsbCBiZSBtYWRlLgoKICAgICog
bGlibHptYToKCiAgICAgICAgLSBsem1hX2Fsb25lX2RlY29kZXIoKSwgbHptYV9semlwX2RlY29k
ZXIoKSwKICAgICAgICAgIGx6bWFfYXV0b19kZWNvZGVyKCksIGFuZCBsem1hX21pY3JvbHptYV9k
ZWNvZGVyKCk6IEZpeCBhbgogICAgICAgICAgaW52YWxpZCBtZW1vcnkgYWNjZXNzIGFmdGVyIG1l
bW9yeSBhbGxvY2F0aW9uIGhhcyBmYWlsZWQgYW5kCiAgICAgICAgICB0aGUgYXBwbGljYXRpb24g
cmVpbml0aWFsaXplcyB0aGUgZXhpc3RpbmcgZGVjb2RlciB0byBkZWNvZGUKICAgICAgICAgIGEg
ZGlmZmVyZW50IGZpbGUuIFRoaXMgYnVnIGNvdWxkIGF0IGxlYXN0IHJlc3VsdCBpbiBhIGNyYXNo
LgogICAgICAgICAgVGhpcyBpcyB0cmFja2VkIGFzIEdIU0EtNXFwcS14cWZ2LWo5cGcuIENWRSBu
dW1iZXIgaXMgcGVuZGluZy4KICAgICAgICAgIChBbHNvIGluIHY1LjIsIHY1LjQsIGFuZCB2NS42
LikKCiAgICAgICAgLSBsem1hX3N0cmVhbV9idWZmZXJfZGVjb2RlKCk6IEZpeCB3cm9uZyBlcnJv
ciBjb2RlIGFuZCwKICAgICAgICAgIGluIGRlYnVnIGJ1aWxkcywgYXNzZXJ0aW9uIGZhaWx1cmUu
IExaTUFfQlVGX0VSUk9SIGNvdWxkCiAgICAgICAgICBiZSByZXR1cm5lZCB3aXRoIHRydW5jYXRl
ZCBpbnB1dHMgd2hpbGUgTFpNQV9EQVRBX0VSUk9SCiAgICAgICAgICBpcyB0aGUgY29ycmVjdCBv
bmUgaW4gdGhpcyBmdW5jdGlvbi4KICAgICAgICAgIChBbHNvIGluIHY1LjIsIHY1LjQsIGFuZCB2
NS42LikKCiAgICAgICAgLSBGaXggYSBwZXJmb3JtYW5jZSBpc3N1ZSBpbiB0aGUgdHlwaWNhbCB1
c2UgY2FzZSBvZgogICAgICAgICAgbHptYV9pbmRleF9jYXQoKS4gSW50ZXJuYWxseSBsaWJsem1h
IGNhbGxzIGl0IGZyb20KICAgICAgICAgIGx6bWFfZmlsZV9pbmZvX2RlY29kZXIoKSwgc28gdGhh
dCB3YXMgYWZmZWN0ZWQgdG9vLiBUaGUKICAgICAgICAgIHByb2JsZW0gb2NjdXJyZWQgaWYgdGhl
IGlucHV0IC54eiBmaWxlIHdhcyBjcmVhdGVkIGJ5CiAgICAgICAgICBjb25jYXRlbmF0aW5nIGEg
bGFyZ2UgbnVtYmVyIG9mIC54eiBmaWxlcy4gQSBjcmFmdGVkIGZpbGUKICAgICAgICAgIGNvdWxk
IG1ha2UgInh6IC0tbGlzdCIgdmVyeSBzbG93IG9yIGVmZmVjdGl2ZWx5IGhhbmcuCiAgICAgICAg
ICBOb3JtYWwgZGVjb21wcmVzc2lvbiBkb2Vzbid0IHVzZSB0aGVzZSBmdW5jdGlvbnMgYW5kCiAg
ICAgICAgICB0aHVzIHdhc24ndCBhZmZlY3RlZC4KICAgICAgICAgIChBbHNvIGluIHY1LjIsIHY1
LjQsIGFuZCB2NS42LikKCiAgICAgICAgLSBGaXggYSB0aGVvcmV0aWNhbCBpbnRlZ2VyIG92ZXJm
bG93IGluIGx6bWFfaW5kZXhfY2F0KCkuCiAgICAgICAgICAoQWxzbyBpbiB2NS4yLCB2NS40LCBh
bmQgdjUuNi4pCgogICAgICAgIC0gRml4IGJvZ3VzIG1lbW9yeSB1c2FnZSByZXBvcnQgaW4gbHpt
YV9pbmRleF9kZWNvZGVyKCkgd2hlbgogICAgICAgICAgdGhlIC54eiBJbmRleCBpcyBvYnZpb3Vz
bHkgaW52YWxpZC4gQSBodWdlIGJvZ3VzIHZhbHVlIGNvdWxkCiAgICAgICAgICBjYXVzZSBhbiBp
bnRlZ2VyIG92ZXJmbG93IGluIGx6bWFfZmlsZV9pbmZvX2RlY29kZXIoKSdzCiAgICAgICAgICBt
ZW1vcnkgdXNhZ2UgcmVwb3J0aW5nIGR1ZSB0byBhIG1pc3Npbmcgb3ZlcmZsb3cgY2hlY2ssCiAg
ICAgICAgICBtYWtpbmcgbHptYV9tZW11c2VkKCkgcmVwb3J0IGFuIGluY29ycmVjdCB0aW55IHZh
bHVlLiBUaGlzCiAgICAgICAgICBidWcgZGlkbid0IGFmZmVjdCB0aGUgbWVtb3J5IHVzYWdlIGxp
bWl0ZXIgaW4gdGhlc2UgdHdvCiAgICAgICAgICBkZWNvZGVyczsgb25seSB0aGUgcmVwb3J0aW5n
IHZpYSBsem1hX21lbXVzZWQoKSB3YXMgYWZmZWN0ZWQuCiAgICAgICAgICAoQWxzbyBpbiB2NS4y
LCB2NS40LCBhbmQgdjUuNi4pCgogICAgICAgIC0gRml4IGEgdG9vIGxvdyBtZW1vcnkgdXNhZ2Ug
cmVwb3J0IGluIGx6bWFfaW5kZXhfZGVjb2RlcigpCiAgICAgICAgICBpZiBsem1hX21lbXVzZWQo
KSBpcyBjYWxsZWQgYWZ0ZXIgYSBwYXJ0IG9mIHRoZSBJbmRleCBoYXMKICAgICAgICAgIGFscmVh
ZHkgYmVlbiBkZWNvZGVkLiBUaGUgdHlwaWNhbCB1c2UgY2FzZSBpcyB0byBjYWxsCiAgICAgICAg
ICBsem1hX21lbXVzZWQoKSBpbW1lZGlhdGVseSBhZnRlciBMWk1BX01FTUxJTUlUX0VSUk9SLAog
ICAgICAgICAgd2hpY2ggZGlkIHdvcmsgY29ycmVjdGx5LgoKICAgICAgICAtIEZpeCBjb3B5aW5n
IG9mIGNoZWNrIHR5cGUgaW4gbHptYV9pbmRleF9kdXAoKS4gQ2FsbGluZwogICAgICAgICAgbHpt
YV9pbmRleF9jaGVja3MoKSBvbiB0aGUgZHVwbGljYXRlZCBsem1hX2luZGV4IHJldHVybmVkCiAg
ICAgICAgICByZXR1cm4gZ2FyYmFnZSBhIHJlc3VsdC4gbHptYV9pbmRleF9kdXAoKSBpcyByYXJl
bHkgdXNlZDsKICAgICAgICAgIGxpYmx6bWEgZG9lc24ndCB1c2UgaXQgaW50ZXJuYWxseSBhbmQg
eHogaXRzZWxmIGRvZXNuJ3QgdXNlCiAgICAgICAgICBpdCBlaXRoZXIuCiAgICAgICAgICAoQWxz
byBpbiB2NS4yLCB2NS40LCBhbmQgdjUuNi4pCgogICAgICAgIC0gbHptYV9maWxlX2luZm9fZGVj
b2RlcigpIGFuZCBsem1hX2luZGV4X2RlY29kZXIoKTogUmVqZWN0CiAgICAgICAgICBhbiBvYnZp
b3VzbHktCgpbQ2hhbmdlbG9nIHRydW5jYXRlZCBhcyBpdCBleGNlZWRzIDMwMDAgY2hhcmFjdGVy
czsKdGhlIGZ1bGwgY2hhbmdlbG9nIGNhbiBiZSBmb3VuZCBpbiBhbiBhdHRhY2htZW50IHRvIHRo
ZSBBVUggZW1haWxdCi0tLQogbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3h6L3t4el81LjguMy5iYiA9
PiB4el81LjguNC5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQveHove3h6XzUuOC4zLmJi
ID0+IHh6XzUuOC40LmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRl
ZC94ei94el81LjguMy5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC94ei94el81LjguNC5iYgpz
aW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQveHov
eHpfNS44LjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC94ei94el81LjguNC5i
YgppbmRleCAwNzM1Njk2MDExLi5jZmIwNTc0ZjBkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQveHoveHpfNS44LjMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3h6L3h6
XzUuOC40LmJiCkBAIC0zMCw3ICszMCw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NP
UFlJTkc7bWQ1PWQzOGQ1NjJmNjExMjE3NGRlOTNhOTY3NzY4MjIzMWIyIFwKIFNSQ19VUkkgPSAi
aHR0cHM6Ly9naXRodWIuY29tL3R1a2FhbmktcHJvamVjdC94ei9yZWxlYXNlcy9kb3dubG9hZC92
JHtQVn0veHotJHtQVn0udGFyLmd6IFwKICAgICAgICAgICAgZmlsZTovL3J1bi1wdGVzdCBcCiAg
ICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIzZDNhMWI5NzNhZjIxODExNGY0Zjg4
OWJiYWEyZjRjMDM3ZGVhYWUwYzhlODE1ZWVjMzgxYzNkNTQ2Yjk3NGEwIgorU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjAwMTRjNzg4NjkzMDQ1NGZlOGJkNDIyODY2NWI1MWFmNTVlZWFlNTYwZWExMzVj
OWM0Y2QzM2Y1NWIyNTkxZDkiCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJyZWxlYXNlcy90YWcv
dig/UDxwdmVyPlxkKyhcLlxkKykrKSIKIFVQU1RSRUFNX0NIRUNLX1VSSSA9ICJodHRwczovL2dp
dGh1Yi5jb20vdHVrYWFuaS1wcm9qZWN0L3h6L3JlbGVhc2VzLyIKIAotLSAKMi40Ny4xCgo=

--===============2430244094621967206==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/xz/liblzma: FILELIST: removed "/usr/lib/liblzma.so.5.8.3", added "/usr/lib/liblzma.so.5.8.4"
Changes to packages/x86-64-v3-poky-linux/xz (sysroot):
  /usr/lib/liblzma.so.5 changed symlink target from liblzma.so.5.8.3 to liblzma.so.5.8.4
  /usr/lib/liblzma.so changed symlink target from liblzma.so.5.8.3 to liblzma.so.5.8.4
  /usr/lib/liblzma.so.5.8.3 moved to /usr/lib/liblzma.so.5.8.4
packages/x86-64-v3-poky-linux/xz/xz-locale-pt-br: PKGSIZE changed from 15660 to 29048 (+85%)
packages/x86-64-v3-poky-linux/xz/xz-ptest: PKGSIZE changed from 477088 to 533487 (+12%)
packages/x86-64-v3-poky-linux/xz/xz-ptest: FILELIST: added "/usr/lib/xz/ptest/tests/files/bad-1-index-huge-uncomp.xz /usr/lib/xz/ptest/tests/files/bad-0-index-1.xz /usr/lib/xz/ptest/tests/test_alone_decoder /usr/lib/xz/ptest/tests/test_stream_buffer_decode /usr/lib/xz/ptest/tests/test_stream_buffer_encode"
Changes to packages/x86_64-linux/elfutils-native (sysroot):
  /usr/bin/eu-stackprof was added
Changes to packages/x86_64-linux/xz-native (sysroot):
  /usr/lib/liblzma.so.5 changed symlink target from liblzma.so.5.8.3 to liblzma.so.5.8.4
  /usr/lib/liblzma.so changed symlink target from liblzma.so.5.8.3 to liblzma.so.5.8.4
  /usr/lib/liblzma.so.5.8.3 moved to /usr/lib/liblzma.so.5.8.4

--===============2430244094621967206==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="xz-changelog.txt"

Changelog for xz: 5.8.3 -> 5.8.4
Source: NEWS

5.8.4 (2026-09-09)

    IMPORTANT: This includes a fix for a security issue that affects all
    XZ Utils versions since 5.0.0. This and a few other fixes have also
    been committed to the old stable branches (v5.2, v5.4, and v5.6) in
    the xz Git repository. Those fixes are marked below. No new 5.2.x,
    5.4.x, or 5.6.x releases will be made.

    * liblzma:

        - lzma_alone_decoder(), lzma_lzip_decoder(),
          lzma_auto_decoder(), and lzma_microlzma_decoder(): Fix an
          invalid memory access after memory allocation has failed and
          the application reinitializes the existing decoder to decode
          a different file. This bug could at least result in a crash.
          This is tracked as GHSA-5qpq-xqfv-j9pg. CVE number is pending.
          (Also in v5.2, v5.4, and v5.6.)

        - lzma_stream_buffer_decode(): Fix wrong error code and,
          in debug builds, assertion failure. LZMA_BUF_ERROR could
          be returned with truncated inputs while LZMA_DATA_ERROR
          is the correct one in this function.
          (Also in v5.2, v5.4, and v5.6.)

        - Fix a performance issue in the typical use case of
          lzma_index_cat(). Internally liblzma calls it from
          lzma_file_info_decoder(), so that was affected too. The
          problem occurred if the input .xz file was created by
          concatenating a large number of .xz files. A crafted file
          could make "xz --list" very slow or effectively hang.
          Normal decompression doesn't use these functions and
          thus wasn't affected.
          (Also in v5.2, v5.4, and v5.6.)

        - Fix a theoretical integer overflow in lzma_index_cat().
          (Also in v5.2, v5.4, and v5.6.)

        - Fix bogus memory usage report in lzma_index_decoder() when
          the .xz Index is obviously invalid. A huge bogus value could
          cause an integer overflow in lzma_file_info_decoder()'s
          memory usage reporting due to a missing overflow check,
          making lzma_memused() report an incorrect tiny value. This
          bug didn't affect the memory usage limiter in these two
          decoders; only the reporting via lzma_memused() was affected.
          (Also in v5.2, v5.4, and v5.6.)

        - Fix a too low memory usage report in lzma_index_decoder()
          if lzma_memused() is called after a part of the Index has
          already been decoded. The typical use case is to call
          lzma_memused() immediately after LZMA_MEMLIMIT_ERROR,
          which did work correctly.

        - Fix copying of check type in lzma_index_dup(). Calling
          lzma_index_checks() on the duplicated lzma_index returned
          return garbage a result. lzma_index_dup() is rarely used;
          liblzma doesn't use it internally and xz itself doesn't use
          it either.
          (Also in v5.2, v5.4, and v5.6.)

        - lzma_file_info_decoder() and lzma_index_decoder(): Reject
          an obviously-invalid Number of Records field earlier.
          (Partially also in v5.2, v5.4, and v5.6.)

        - Fix a missing synchronization in the threaded .xz decoder. It
          could make lzma_get_progress() return incorrect progress info.
          (Also in v5.4 and v5.6.)

        - Detect certain kinds of corrupt inputs slightly earlier in
          the LZMA2 decoder.

        - ARM64 and LoongArch: Don't use aligned reads on unaligned
          buffers. This makes the code work on strict-align processors
          and fixes a sanitizer error in other cases. (Since 5.7.1alpha)

    * xz:

        - Fix a use-after-free when showing an error message if --files
          or --files0 was specified in the environment variables XZ_OPT
          or XZ_DEFAULTS.
          (Also in v5.2, v5.4, and v5.6.)

        - Fix a use-after-free bug when --verbose is used and
          standard error isn't a terminal. (Since 5.7.1alpha)

        - Make it an error if the totals in "xz --list" exceed the range
          of 64-bit integers.
          (Also in v5.2, v5.4, and v5.6.)

    * xz and xzdec on Linux:

        - Add support for Landlock ABI version 9.

        - Use fallback macros for Landlock ABI version 2, 3, and 5
          (but not 4) if <linux/landlock.h> is older than ABI version 5.
          This makes the binary slightly more protected if it is run on
          a kernel that supports newer ABIs than <linux/landlock.h>.

    * Scripts:

        - xzgrep: Fix handling of the ' char at the end of a command
          line option. For example, the following tricked xzgrep to
          run "id": xzgrep "-e'" "-e;id;'" somefile
          (Also in v5.2, v5.4, and v5.6.)

        - xzdiff: Use the C locale (LC_ALL=C) with "sed" and "expr"
          to ensure safe behavior with invalid multibyte sequences.
          An equivalent improvement was made in xzgrep in 5.2.6
          (2022-08-12), but it was forgotten from xzdiff.
          (Also in v5.2, v5.4, and v5.6.)

    * Tests:

        - Improve a few tests and fuzz targets.

        - Add new test files:
            * bad-0-index-1.xz (32 bytes)
            * bad-1-index-huge-uncomp.xz (72 bytes)

    * Man pages:

        - Improve the rendering with OpenBSD's mandoc(1).

        - Reduce indentation of the tables to avoid overlong lines
          in translated versions of the xz man page.

    * Translations:

        - In translated man pages, workaround an issue with non-ASCII
          characters in tables.

        - Fix syntax errors in a few man page translations.

        - Update Arabic and German man page translations.

        - Update Brazilian Portuguese, Croatian, Dutch, German, Italian,
          Korean, Polish, Portuguese, Romanian, and Ukrainian message
          translations.

        - Fix a buffer overflow in lzma_index_append() (CVE-2026-34743):
          If lzma_index_decoder() was used to decode an Index that

--===============2430244094621967206==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/xz: SRC_URI changed from "https://github.com/tukaani-project/xz/releases/download/v5.8.3/xz-5.8.3.tar.gz file://run-ptest" to "https://github.com/tukaani-project/xz/releases/download/v5.8.4/xz-5.8.4.tar.gz file://run-ptest"
packages/x86-64-v3-poky-linux/xz: PKGV changed from 5.8.3 [default] to 5.8.4 [default]
packages/x86-64-v3-poky-linux/xz: PV changed from "5.8.3" to "5.8.4"
packages/x86-64-v3-poky-linux/xz/liblzma: PV changed from "5.8.3" to "5.8.4"
packages/x86-64-v3-poky-linux/xz/liblzma: PKGV changed from 5.8.3 [default] to 5.8.4 [default]
packages/x86-64-v3-poky-linux/xz/liblzma: PKGSIZE changed from 207096 to 211192 (+2%)
packages/x86-64-v3-poky-linux/xz/liblzma: FILELIST: removed "/usr/lib/liblzma.so.5.8.3", added "/usr/lib/liblzma.so.5.8.4"
Changes to packages/x86-64-v3-poky-linux/xz (sysroot):
  /usr/lib/liblzma.so.5 changed symlink target from liblzma.so.5.8.3 to liblzma.so.5.8.4
  /usr/lib/liblzma.so changed symlink target from liblzma.so.5.8.3 to liblzma.so.5.8.4
  /usr/lib/liblzma.so.5.8.3 moved to /usr/lib/liblzma.so.5.8.4
packages/x86-64-v3-poky-linux/xz/xz-dbg: PV changed from "5.8.3" to "5.8.4"
packages/x86-64-v3-poky-linux/xz/xz-dbg: PKGV changed from 5.8.3 [default] to 5.8.4 [default]
packages/x86-64-v3-poky-linux/xz/xz-dbg: PKGSIZE changed from 2293848 to 2473640 (+8%)
packages/x86-64-v3-poky-linux/xz/xz-dbg: FILELIST: removed "/usr/lib/.debug/liblzma.so.5.8.3", added "/usr/lib/xz/ptest/tests/.debug/test_stream_buffer_decode /usr/lib/.debug/liblzma.so.5.8.4 /usr/lib/xz/ptest/tests/.debug/test_alone_decoder /usr/lib/xz/ptest/tests/.debug/test_stream_buffer_encode"
packages/x86-64-v3-poky-linux/xz/xz-dev: PV changed from "5.8.3" to "5.8.4"
packages/x86-64-v3-poky-linux/xz/xz-dev: PKGV changed from 5.8.3 [default] to 5.8.4 [default]
packages/x86-64-v3-poky-linux/xz/xz-dev: PKGSIZE changed from 229942 to 229971 (+0%)
packages/x86-64-v3-poky-linux/xz/xz-doc: PV changed from "5.8.3" to "5.8.4"
packages/x86-64-v3-poky-linux/xz/xz-doc: PKGV changed from 5.8.3 [default] to 5.8.4 [default]
packages/x86-64-v3-poky-linux/xz/xz-doc: PKGSIZE changed from 1517047 to 1524024 (+0%)
packages/x86-64-v3-poky-linux/xz/xz-locale-ca: PV changed from "5.8.3" to "5.8.4"
packages/x86-64-v3-poky-linux/xz/xz-locale-ca: PKGV changed from 5.8.3 [default] to 5.8.4 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-cs: PV changed from "5.8.3" to "5.8.4"
packages/x86-64-v3-poky-linux/xz/xz-locale-cs: PKGV changed from 5.8.3 [default] to 5.8.4 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-da: PV changed from "5.8.3" to "5.8.4"
packages/x86-64-v3-poky-linux/xz/xz-locale-da: PKGV changed from 5.8.3 [default] to 5.8.4 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-de: PV changed from "5.8.3" to "5.8.4"
packages/x86-64-v3-poky-linux/xz/xz-locale-de: PKGV changed from 5.8.3 [default] to 5.8.4 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-de: PKGSIZE changed from 29882 to 30057 (+1%)
packages/x86-64-v3-poky-linux/xz/xz-locale-eo: PV changed from "5.8.3" to "5.8.4"
packages/x86-64-v3-poky-linux/xz/xz-locale-eo: PKGV changed from 5.8.3 [default] to 5.8.4 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-es: PV changed from "5.8.3" to "5.8.4"
packages/x86-64-v3-poky-linux/xz/xz-locale-es: PKGV changed from 5.8.3 [default] to 5.8.4 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-fi: PV changed from "5.8.3" to "5.8.4"
packages/x86-64-v3-poky-linux/xz/xz-locale-fi: PKGV changed from 5.8.3 [default] to 5.8.4 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-fr: PV changed from "5.8.3" to "5.8.4"
packages/x86-64-v3-poky-linux/xz/xz-locale-fr: PKGV changed from 5.8.3 [default] to 5.8.4 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-hr: PV changed from "5.8.3" to "5.8.4"
packages/x86-64-v3-poky-linux/xz/xz-locale-hr: PKGV changed from 5.8.3 [default] to 5.8.4 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-hr: PKGSIZE changed from 28799 to 28975 (+1%)
packages/x86-64-v3-poky-linux/xz/xz-locale-hu: PV changed from "5.8.3" to "5.8.4"
packages/x86-64-v3-poky-linux/xz/xz-locale-hu: PKGV changed from 5.8.3 [default] to 5.8.4 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-it: PV changed from "5.8.3" to "5.8.4"
packages/x86-64-v3-poky-linux/xz/xz-locale-it: PKGV changed from 5.8.3 [default] to 5.8.4 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-it: PKGSIZE changed from 28688 to 29139 (+2%)
packages/x86-64-v3-poky-linux/xz/xz-locale-ka: PV changed from "5.8.3" to "5.8.4"
packages/x86-64-v3-poky-linux/xz/xz-locale-ka: PKGV changed from 5.8.3 [default] to 5.8.4 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-ko: PV changed from "5.8.3" to "5.8.4"
packages/x86-64-v3-poky-linux/xz/xz-locale-ko: PKGV changed from 5.8.3 [default] to 5.8.4 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-ko: PKGSIZE changed from 29850 to 30007 (+1%)
packages/x86-64-v3-poky-linux/xz/xz-locale-nl: PV changed from "5.8.3" to "5.8.4"
packages/x86-64-v3-poky-linux/xz/xz-locale-nl: PKGV changed from 5.8.3 [default] to 5.8.4 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-nl: PKGSIZE changed from 28532 to 28711 (+1%)
packages/x86-64-v3-poky-linux/xz/xz-locale-pl: PV changed from "5.8.3" to "5.8.4"
packages/x86-64-v3-poky-linux/xz/xz-locale-pl: PKGV changed from 5.8.3 [default] to 5.8.4 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-pl: PKGSIZE changed from 29090 to 29253 (+1%)
packages/x86-64-v3-poky-linux/xz/xz-locale-pt-br: PV changed from "5.8.3" to "5.8.4"
packages/x86-64-v3-poky-linux/xz/xz-locale-pt-br: PKGV changed from 5.8.3 [default] to 5.8.4 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-pt-br: PKGSIZE changed from 15660 to 29048 (+85%)
packages/x86-64-v3-poky-linux/xz/xz-locale-pt: PV changed from "5.8.3" to "5.8.4"
packages/x86-64-v3-poky-linux/xz/xz-locale-pt: PKGV changed from 5.8.3 [default] to 5.8.4 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-pt: PKGSIZE changed from 28796 to 28957 (+1%)
packages/x86-64-v3-poky-linux/xz/xz-locale-ro: PV changed from "5.8.3" to "5.8.4"
packages/x86-64-v3-poky-linux/xz/xz-locale-ro: PKGV changed from 5.8.3 [default] to 5.8.4 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-ro: PKGSIZE changed from 30418 to 30596 (+1%)
packages/x86-64-v3-poky-linux/xz/xz-locale-sr: PV changed from "5.8.3" to "5.8.4"
packages/x86-64-v3-poky-linux/xz/xz-locale-sr: PKGV changed from 5.8.3 [default] to 5.8.4 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-sv: PV changed from "5.8.3" to "5.8.4"
packages/x86-64-v3-poky-linux/xz/xz-locale-sv: PKGV changed from 5.8.3 [default] to 5.8.4 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-tr: PV changed from "5.8.3" to "5.8.4"
packages/x86-64-v3-poky-linux/xz/xz-locale-tr: PKGV changed from 5.8.3 [default] to 5.8.4 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-uk: PV changed from "5.8.3" to "5.8.4"
packages/x86-64-v3-poky-linux/xz/xz-locale-uk: PKGV changed from 5.8.3 [default] to 5.8.4 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-uk: PKGSIZE changed from 39005 to 39235 (+1%)
packages/x86-64-v3-poky-linux/xz/xz-locale-vi: PV changed from "5.8.3" to "5.8.4"
packages/x86-64-v3-poky-linux/xz/xz-locale-vi: PKGV changed from 5.8.3 [default] to 5.8.4 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-zh-cn: PV changed from "5.8.3" to "5.8.4"
packages/x86-64-v3-poky-linux/xz/xz-locale-zh-cn: PKGV changed from 5.8.3 [default] to 5.8.4 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-zh-tw: PV changed from "5.8.3" to "5.8.4"
packages/x86-64-v3-poky-linux/xz/xz-locale-zh-tw: PKGV changed from 5.8.3 [default] to 5.8.4 [default]
packages/x86-64-v3-poky-linux/xz/xz-ptest: PV changed from "5.8.3" to "5.8.4"
packages/x86-64-v3-poky-linux/xz/xz-ptest: PKGV changed from 5.8.3 [default] to 5.8.4 [default]
packages/x86-64-v3-poky-linux/xz/xz-ptest: PKGSIZE changed from 477088 to 533487 (+12%)
packages/x86-64-v3-poky-linux/xz/xz-ptest: FILELIST: added "/usr/lib/xz/ptest/tests/test_alone_decoder /usr/lib/xz/ptest/tests/files/bad-1-index-huge-uncomp.xz /usr/lib/xz/ptest/tests/files/bad-0-index-1.xz /usr/lib/xz/ptest/tests/test_stream_buffer_decode /usr/lib/xz/ptest/tests/test_stream_buffer_encode"
packages/x86-64-v3-poky-linux/xz/xz-src: PV changed from "5.8.3" to "5.8.4"
packages/x86-64-v3-poky-linux/xz/xz-src: PKGV changed from 5.8.3 [default] to 5.8.4 [default]
packages/x86-64-v3-poky-linux/xz/xz-src: PKGSIZE changed from 1698866 to 1723485 (+1%)
packages/x86-64-v3-poky-linux/xz/xz-src: FILELIST: directory renamed /usr/src/debug/xz/5.8.3/src/common -> /usr/src/debug/xz/5.8.4/src/common, directory renamed /usr/src/debug/xz/5.8.3/src/liblzma/api/lzma -> /usr/src/debug/xz/5.8.4/src/liblzma/api/lzma, directory renamed /usr/src/debug/xz/5.8.3/src/liblzma/lzma -> /usr/src/debug/xz/5.8.4/src/liblzma/lzma, directory renamed /usr/src/debug/xz/5.8.3/src/xzdec -> /usr/src/debug/xz/5.8.4/src/xzdec, directory renamed /usr/src/debug/xz/5.8.3/src/liblzma/check -> /usr/src/debug/xz/5.8.4/src/liblzma/check, directory renamed /usr/src/debug/xz/5.8.3/src/liblzma/common -> /usr/src/debug/xz/5.8.4/src/liblzma/common, directory renamed /usr/src/debug/xz/5.8.3/src/liblzma/rangecoder -> /usr/src/debug/xz/5.8.4/src/liblzma/rangecoder, directory renamed /usr/src/debug/xz/5.8.3/src/liblzma/simple -> /usr/src/debug/xz/5.8.4/src/liblzma/simple, directory renamed /usr/src/debug/xz/5.8.3/src/lzmainfo -> /usr/src/debug/xz/5.8.4/src/lzmainfo, directory renam
 ed /usr/src/debug/xz/5.8.3/src/xz -> /usr/src/debug/xz/5.8.4/src/xz, directory renamed /usr/src/debug/xz/5.8.3/src/liblzma/delta -> /usr/src/debug/xz/5.8.4/src/liblzma/delta, directory renamed /usr/src/debug/xz/5.8.3/src/liblzma/lz -> /usr/src/debug/xz/5.8.4/src/liblzma/lz, removed "/usr/src/debug/xz/5.8.3/tests/tuktest.h /usr/src/debug/xz/5.8.3/tests/test_filter_flags.c /usr/src/debug/xz/5.8.3/tests/test_index_hash.c /usr/src/debug/xz/5.8.3/tests/test_lzip_decoder.c /usr/src/debug/xz/5.8.3/tests/create_compress_files.c /usr/src/debug/xz/5.8.3/tests/test_bcj_exact_size.c /usr/src/debug/xz/5.8.3/tests/test_stream_flags.c /usr/src/debug/xz/5.8.3/tests/test_filter_str.c /usr/src/debug/xz/5.8.3/tests/test_vli.c /usr/src/debug/xz/5.8.3/tests/tests.h /usr/src/debug/xz/5.8.3/tests/test_check.c /usr/src/debug/xz/5.8.3/tests/test_index.c /usr/src/debug/xz/5.8.3/tests/test_hardware.c /usr/src/debug/xz/5.8.3/tests/test_microlzma.c /usr/src/debug/xz/5.8.3/tests/test_memlimit.c /usr/src/debug/xz
 /5.8.3/tests/test_block_header.c", added "/usr/src/debug/xz/5.8.4/tests/test_filter_str.c /usr/src/debug/xz/5.8.4/tests/test_lzip_decoder.c /usr/src/debug/xz/5.8.4/tests/create_compress_files.c /usr/src/debug/xz/5.8.4/tests/test_bcj_exact_size.c /usr/src/debug/xz/5.8.4/tests/test_vli.c /usr/src/debug/xz/5.8.4/tests/test_hardware.c /usr/src/debug/xz/5.8.4/tests/tuktest.h /usr/src/debug/xz/5.8.4/tests/test_filter_flags.c /usr/src/debug/xz/5.8.4/tests/test_stream_flags.c /usr/src/debug/xz/5.8.4/tests/test_alone_decoder.c /usr/src/debug/xz/5.8.4/tests/test_check.c /usr/src/debug/xz/5.8.4/tests/test_index.c /usr/src/debug/xz/5.8.4/tests/test_index_hash.c /usr/src/debug/xz/5.8.4/tests/test_microlzma.c /usr/src/debug/xz/5.8.4/tests/test_block_header.c /usr/src/debug/xz/5.8.4/tests/test_stream_buffer_decode.c /usr/src/debug/xz/5.8.4/tests/test_stream_buffer_encode.c /usr/src/debug/xz/5.8.4/tests/tests.h /usr/src/debug/xz/5.8.4/tests/test_memlimit.c"
packages/x86-64-v3-poky-linux/xz/xz-staticdev: PV changed from "5.8.3" to "5.8.4"
packages/x86-64-v3-poky-linux/xz/xz-staticdev: PKGV changed from 5.8.3 [default] to 5.8.4 [default]
packages/x86-64-v3-poky-linux/xz/xz: PV changed from "5.8.3" to "5.8.4"
packages/x86-64-v3-poky-linux/xz/xz: PKGV changed from 5.8.3 [default] to 5.8.4 [default]
packages/x86-64-v3-poky-linux/xz/xz: PKGSIZE changed from 175560 to 175622 (+0%)
Changes to packages/x86_64-linux/elfutils-native (sysroot):
  /usr/bin/eu-stackprof was added
Changes to packages/x86_64-linux/xz-native (sysroot):
  /usr/lib/liblzma.so.5 changed symlink target from liblzma.so.5.8.3 to liblzma.so.5.8.4
  /usr/lib/liblzma.so changed symlink target from liblzma.so.5.8.3 to liblzma.so.5.8.4
  /usr/lib/liblzma.so.5.8.3 moved to /usr/lib/liblzma.so.5.8.4

--===============2430244094621967206==--

