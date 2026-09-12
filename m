Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C1C0C79FB6
	for <webhook@archiver.kernel.org>; Sat, 12 Sep 2026 06:45:58 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1962.1789195556954844355
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2026 23:45:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=bpdG2yF3;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=yN2ZmW8Z;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101a0945d94c3-49970faa-168d-4fe1-98ec-f2337112b8dd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789195556;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FuzE8oJ0b3loZ5UqRiWwvQdGkSIrkyruFZIB6ZgYWEc=;
	b=bpdG2yF3/C+LxBBJxEBBkSkt16nyCbLg+kHZ8dAQG8SezSoqOYsVj3ZDsiqw0W6G
	2UW4rpoBGjVJWXajzASPK56c0gI9CRS252tihgK70A9ut9hXidbeQROsPtrssMGDYbs
	Bu6PRgJkPl6kacH+3e0ItmCgfvboHdk7W05Xq3Qg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789195556;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FuzE8oJ0b3loZ5UqRiWwvQdGkSIrkyruFZIB6ZgYWEc=;
	b=yN2ZmW8ZcPQuwCT+3we1TFZJVqoUDR+KUI4uX9uSCstWuCM7Kn1V5Dim2XFQtGi+
	gxCRP7XszTxBVXJUadrU5rrVzQdvZGNN4tJKa5JxVzQleyg6+WpFpqSCGO6s7vUgx3Y
	bzkIkY57s1XlBSxwrSjyfsEwfm2z4sYB7u2aiol8=
Content-Type: multipart/mixed; boundary="===============3137402317178982708=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gn: upgrading to cfcd774b98f3433e18b722f9a7ff06119825b8eb
 SUCCEEDED
Message-ID: <010101a0945d94c3-49970faa-168d-4fe1-98ec-f2337112b8dd-000000@us-west-2.amazonses.com>
Date: Sat, 12 Sep 2026 06:45:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.12-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Sep 2026 06:45:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245684

--===============3137402317178982708==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gn* to *cfcd774b98f3433e18b722f9a7ff06119825b8eb* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gn-upgrade-to-latest-revision.patch
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
From cab5019f61c06bf250b7eab1794e92c7cbe73253 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 12 Sep 2026 05:42:01 +0000
Subject: [PATCH] gn: upgrade to latest revision

cfcd774b Header check: avoid interning paths during include lookup
0625da07 Improve heuristic to disambiguate recommended dependency to add.
f9997211 No longer automatically add files to public.
e095a1af Deduplicate deps/public_deps and sources/public in gn edit
c0e4aae6 Preserve toolchain when generating suggestions in gn check
5df47e55 Use ReachabilityCache to improve performance of loop detection
28fc4470 Support `target(target_type, name)` in `gn edit`
3163718c Cache reverse dependencies for dependency exposure.
8288110a Skip attempting to resolve known files as module names.
5b0f8830 Cache file path -> target lookup in `gn suggest`.
4f6a76b6 Make `gn edit move` idempotent.
356ee8a8 When re-running build/gen.py from ninja, preserve environment variables.
7e0a9f67 Implement pretty for several more types
16d3d2e2 Ensure `gn edit` follows the style guide for variable ordering.
7826279d Simplify code produced by gn edit.
1c73f622 Support setting expressions in `gn edit`
f73e445a Revert "Write to ninja files via a standard API"
8e99cccd Write to ninja files via a standard API
02564b48 Use move instead of add where suitable when suggesting fixes.
a99d46a9 Fix EditCommandTest.ShardSubcommand
a6f2c97a Support public_inputs in gn desc
4cf50b37 Update `gn format` to always insert newlines before targets.
150a9d6b run_formatter.sh: Warn if `rustfmt` is not installed.
d71c4a70 docs: Document that copy() uses the toolchain's copy tool
c1b66378 standard_out.h: Add ScopedBufferedOuptut class.
664f3e63 Support public_inputs in group targets
deecdc59 Run benchmarks serially.
07014ca3 Write benchmarks to out/before and out/after instead of out/
a6473d48 Add jj subcommands to easily compare revisions.
e10143e8 Add `build/gen.py --gen ~/chromium/src=out/Default`
d0aec586 Create a trace comparison tool to evaluate the performance impact of a change.
c7ffaf80 Allow host_os and host_cpu to be accessed in .gn files
e0a6ab04 Implement `gn edit "shard"` subcommand
b1da1218 Hint about --fix/--apply when running without them
2fc5f9e5 Add support for creating new targets in `gn edit`
58933a7c Support cloning of nodes in the AST.
f3d7a0c8 Mark NOTREACHED as [[noreturn]]
2481edf5 Implement `gn check --fix`
f0be464b Fix gn suggest adding self-dependency loops.
d2e84fac Add a `gn suggest --apply` option.
39e3f7ad Add `gn edit` suggestions to `gn suggest`
c6cffd45 Implement `gn edit "rename attr attr"`
bc1914cf Implement `gn edit "move attr attr value(s)"`
167116e0 Implement `gn edit "add attribute value(s)"`
1c79e13d Implement `gn edit "remove attr value(s)"`
e8a8e093 Refactor parse nodes to support non-const access.
24800a7f Implement `gn edit delete` and `gn edit remove attr`
0db00fc0 Implement `gn edit` command, and implement a simple subcommand "set"
d5594ca8 Add features to test framework
152bfad2 Implement a Result<T> type.
6b0190f7 Fix formatter on main branch
73243639 Fix path to build/gen.py.
d1996a79 Add pre-upload checks into ninja targets
64cfb834 Add --exclude-t

[Changelog truncated as it exceeds 3000 characters;
the full changelog can be found in an attachment to the AUH email]
---
 meta/recipes-devtools/gn/gn_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gn/gn_git.bb b/meta/recipes-devtools/gn/gn_git.bb
index eddbbcdf7f..6e8626dc32 100644
--- a/meta/recipes-devtools/gn/gn_git.bb
+++ b/meta/recipes-devtools/gn/gn_git.bb
@@ -8,7 +8,7 @@ UPSTREAM_CHECK_COMMITS = "1"
 
 SRC_URI = "git://gn.googlesource.com/gn;protocol=https;branch=main \
 "
-SRCREV = "17b0057970fa2b07a20cbb4289ab78cf93565f35"
+SRCREV = "cfcd774b98f3433e18b722f9a7ff06119825b8eb"
 PV = "0+git"
 
 BB_GIT_SHALLOW = ""
-- 
2.47.1


--===============3137402317178982708==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gn-upgrade-to-latest-revision.patch"

RnJvbSBjYWI1MDE5ZjYxYzA2YmYyNTBiN2VhYjE3OTRlOTJjN2NiZTczMjUzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTIgU2VwIDIwMjYgMDU6NDI6MDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
bjogdXBncmFkZSB0byBsYXRlc3QgcmV2aXNpb24KCmNmY2Q3NzRiIEhlYWRlciBjaGVjazogYXZv
aWQgaW50ZXJuaW5nIHBhdGhzIGR1cmluZyBpbmNsdWRlIGxvb2t1cAowNjI1ZGEwNyBJbXByb3Zl
IGhldXJpc3RpYyB0byBkaXNhbWJpZ3VhdGUgcmVjb21tZW5kZWQgZGVwZW5kZW5jeSB0byBhZGQu
CmY5OTk3MjExIE5vIGxvbmdlciBhdXRvbWF0aWNhbGx5IGFkZCBmaWxlcyB0byBwdWJsaWMuCmUw
OTVhMWFmIERlZHVwbGljYXRlIGRlcHMvcHVibGljX2RlcHMgYW5kIHNvdXJjZXMvcHVibGljIGlu
IGduIGVkaXQKYzBlNGFhZTYgUHJlc2VydmUgdG9vbGNoYWluIHdoZW4gZ2VuZXJhdGluZyBzdWdn
ZXN0aW9ucyBpbiBnbiBjaGVjawo1ZGY0N2U1NSBVc2UgUmVhY2hhYmlsaXR5Q2FjaGUgdG8gaW1w
cm92ZSBwZXJmb3JtYW5jZSBvZiBsb29wIGRldGVjdGlvbgoyOGZjNDQ3MCBTdXBwb3J0IGB0YXJn
ZXQodGFyZ2V0X3R5cGUsIG5hbWUpYCBpbiBgZ24gZWRpdGAKMzE2MzcxOGMgQ2FjaGUgcmV2ZXJz
ZSBkZXBlbmRlbmNpZXMgZm9yIGRlcGVuZGVuY3kgZXhwb3N1cmUuCjgyODgxMTBhIFNraXAgYXR0
ZW1wdGluZyB0byByZXNvbHZlIGtub3duIGZpbGVzIGFzIG1vZHVsZSBuYW1lcy4KNWIwZjg4MzAg
Q2FjaGUgZmlsZSBwYXRoIC0+IHRhcmdldCBsb29rdXAgaW4gYGduIHN1Z2dlc3RgLgo0ZjZhNzZi
NiBNYWtlIGBnbiBlZGl0IG1vdmVgIGlkZW1wb3RlbnQuCjM1NmVlOGE4IFdoZW4gcmUtcnVubmlu
ZyBidWlsZC9nZW4ucHkgZnJvbSBuaW5qYSwgcHJlc2VydmUgZW52aXJvbm1lbnQgdmFyaWFibGVz
Lgo3ZTBhOWY2NyBJbXBsZW1lbnQgcHJldHR5IGZvciBzZXZlcmFsIG1vcmUgdHlwZXMKMTZkM2Qy
ZTIgRW5zdXJlIGBnbiBlZGl0YCBmb2xsb3dzIHRoZSBzdHlsZSBndWlkZSBmb3IgdmFyaWFibGUg
b3JkZXJpbmcuCjc4MjYyNzlkIFNpbXBsaWZ5IGNvZGUgcHJvZHVjZWQgYnkgZ24gZWRpdC4KMWM3
M2Y2MjIgU3VwcG9ydCBzZXR0aW5nIGV4cHJlc3Npb25zIGluIGBnbiBlZGl0YApmNzNlNDQ1YSBS
ZXZlcnQgIldyaXRlIHRvIG5pbmphIGZpbGVzIHZpYSBhIHN0YW5kYXJkIEFQSSIKOGU5OWNjY2Qg
V3JpdGUgdG8gbmluamEgZmlsZXMgdmlhIGEgc3RhbmRhcmQgQVBJCjAyNTY0YjQ4IFVzZSBtb3Zl
IGluc3RlYWQgb2YgYWRkIHdoZXJlIHN1aXRhYmxlIHdoZW4gc3VnZ2VzdGluZyBmaXhlcy4KYTk5
ZDQ2YTkgRml4IEVkaXRDb21tYW5kVGVzdC5TaGFyZFN1YmNvbW1hbmQKYTZmMmM5N2EgU3VwcG9y
dCBwdWJsaWNfaW5wdXRzIGluIGduIGRlc2MKNGNmNTBiMzcgVXBkYXRlIGBnbiBmb3JtYXRgIHRv
IGFsd2F5cyBpbnNlcnQgbmV3bGluZXMgYmVmb3JlIHRhcmdldHMuCjE1MGE5ZDZiIHJ1bl9mb3Jt
YXR0ZXIuc2g6IFdhcm4gaWYgYHJ1c3RmbXRgIGlzIG5vdCBpbnN0YWxsZWQuCmQ3MWM0YTcwIGRv
Y3M6IERvY3VtZW50IHRoYXQgY29weSgpIHVzZXMgdGhlIHRvb2xjaGFpbidzIGNvcHkgdG9vbApj
MWI2NjM3OCBzdGFuZGFyZF9vdXQuaDogQWRkIFNjb3BlZEJ1ZmZlcmVkT3VwdHV0IGNsYXNzLgo2
NjRmM2U2MyBTdXBwb3J0IHB1YmxpY19pbnB1dHMgaW4gZ3JvdXAgdGFyZ2V0cwpkZWVjZGM1OSBS
dW4gYmVuY2htYXJrcyBzZXJpYWxseS4KMDcwMTRjYTMgV3JpdGUgYmVuY2htYXJrcyB0byBvdXQv
YmVmb3JlIGFuZCBvdXQvYWZ0ZXIgaW5zdGVhZCBvZiBvdXQvCmE2NDczZDQ4IEFkZCBqaiBzdWJj
b21tYW5kcyB0byBlYXNpbHkgY29tcGFyZSByZXZpc2lvbnMuCmUxMDE0M2U4IEFkZCBgYnVpbGQv
Z2VuLnB5IC0tZ2VuIH4vY2hyb21pdW0vc3JjPW91dC9EZWZhdWx0YApkMGFlYzU4NiBDcmVhdGUg
YSB0cmFjZSBjb21wYXJpc29uIHRvb2wgdG8gZXZhbHVhdGUgdGhlIHBlcmZvcm1hbmNlIGltcGFj
dCBvZiBhIGNoYW5nZS4KYzdmZmFmODAgQWxsb3cgaG9zdF9vcyBhbmQgaG9zdF9jcHUgdG8gYmUg
YWNjZXNzZWQgaW4gLmduIGZpbGVzCmUwYTZhYjA0IEltcGxlbWVudCBgZ24gZWRpdCAic2hhcmQi
YCBzdWJjb21tYW5kCmIxZGExMjE4IEhpbnQgYWJvdXQgLS1maXgvLS1hcHBseSB3aGVuIHJ1bm5p
bmcgd2l0aG91dCB0aGVtCjJmYzVmOWU1IEFkZCBzdXBwb3J0IGZvciBjcmVhdGluZyBuZXcgdGFy
Z2V0cyBpbiBgZ24gZWRpdGAKNTg5MzNhN2MgU3VwcG9ydCBjbG9uaW5nIG9mIG5vZGVzIGluIHRo
ZSBBU1QuCmYzZDdhMGM4IE1hcmsgTk9UUkVBQ0hFRCBhcyBbW25vcmV0dXJuXV0KMjQ4MWVkZjUg
SW1wbGVtZW50IGBnbiBjaGVjayAtLWZpeGAKZjBiZTQ2NGIgRml4IGduIHN1Z2dlc3QgYWRkaW5n
IHNlbGYtZGVwZW5kZW5jeSBsb29wcy4KZDJlODRmYWMgQWRkIGEgYGduIHN1Z2dlc3QgLS1hcHBs
eWAgb3B0aW9uLgozOWUzZjdhZCBBZGQgYGduIGVkaXRgIHN1Z2dlc3Rpb25zIHRvIGBnbiBzdWdn
ZXN0YApjNmNmZmQ0NSBJbXBsZW1lbnQgYGduIGVkaXQgInJlbmFtZSBhdHRyIGF0dHIiYApiYzE5
MTRjZiBJbXBsZW1lbnQgYGduIGVkaXQgIm1vdmUgYXR0ciBhdHRyIHZhbHVlKHMpImAKMTY3MTE2
ZTAgSW1wbGVtZW50IGBnbiBlZGl0ICJhZGQgYXR0cmlidXRlIHZhbHVlKHMpImAKMWM3OWUxM2Qg
SW1wbGVtZW50IGBnbiBlZGl0ICJyZW1vdmUgYXR0ciB2YWx1ZShzKSJgCmU4YThlMDkzIFJlZmFj
dG9yIHBhcnNlIG5vZGVzIHRvIHN1cHBvcnQgbm9uLWNvbnN0IGFjY2Vzcy4KMjQ4MDBhN2YgSW1w
bGVtZW50IGBnbiBlZGl0IGRlbGV0ZWAgYW5kIGBnbiBlZGl0IHJlbW92ZSBhdHRyYAowZGIwMGZj
MCBJbXBsZW1lbnQgYGduIGVkaXRgIGNvbW1hbmQsIGFuZCBpbXBsZW1lbnQgYSBzaW1wbGUgc3Vi
Y29tbWFuZCAic2V0IgpkNTU5NGNhOCBBZGQgZmVhdHVyZXMgdG8gdGVzdCBmcmFtZXdvcmsKMTUy
YmZhZDIgSW1wbGVtZW50IGEgUmVzdWx0PFQ+IHR5cGUuCjZiMDE5MGY3IEZpeCBmb3JtYXR0ZXIg
b24gbWFpbiBicmFuY2gKNzMyNDM2MzkgRml4IHBhdGggdG8gYnVpbGQvZ2VuLnB5LgpkMTk5NmE3
OSBBZGQgcHJlLXVwbG9hZCBjaGVja3MgaW50byBuaW5qYSB0YXJnZXRzCjY0Y2ZiODM0IEFkZCAt
LWV4Y2x1ZGUtdAoKW0NoYW5nZWxvZyB0cnVuY2F0ZWQgYXMgaXQgZXhjZWVkcyAzMDAwIGNoYXJh
Y3RlcnM7CnRoZSBmdWxsIGNoYW5nZWxvZyBjYW4gYmUgZm91bmQgaW4gYW4gYXR0YWNobWVudCB0
byB0aGUgQVVIIGVtYWlsXQotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nbi9nbl9naXQuYmIg
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ24vZ25fZ2l0LmJiIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2duL2duX2dpdC5iYgppbmRleCBlZGRiYmNkZjdmLi42ZTg2MjZkYzMyIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ24vZ25fZ2l0LmJiCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9nbi9nbl9naXQuYmIKQEAgLTgsNyArOCw3IEBAIFVQU1RSRUFNX0NI
RUNLX0NPTU1JVFMgPSAiMSIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9nbi5nb29nbGVzb3VyY2UuY29t
L2duO3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYWluIFwKICIKLVNSQ1JFViA9ICIxN2IwMDU3OTcw
ZmEyYjA3YTIwY2JiNDI4OWFiNzhjZjkzNTY1ZjM1IgorU1JDUkVWID0gImNmY2Q3NzRiOThmMzQz
M2UxOGI3MjJmOWE3ZmYwNjExOTgyNWI4ZWIiCiBQViA9ICIwK2dpdCIKIAogQkJfR0lUX1NIQUxM
T1cgPSAiIgotLSAKMi40Ny4xCgo=

--===============3137402317178982708==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="gn-changelog.txt"

Changelog for gn: 0+git -> 0+git

cfcd774b Header check: avoid interning paths during include lookup
0625da07 Improve heuristic to disambiguate recommended dependency to add.
f9997211 No longer automatically add files to public.
e095a1af Deduplicate deps/public_deps and sources/public in gn edit
c0e4aae6 Preserve toolchain when generating suggestions in gn check
5df47e55 Use ReachabilityCache to improve performance of loop detection
28fc4470 Support `target(target_type, name)` in `gn edit`
3163718c Cache reverse dependencies for dependency exposure.
8288110a Skip attempting to resolve known files as module names.
5b0f8830 Cache file path -> target lookup in `gn suggest`.
4f6a76b6 Make `gn edit move` idempotent.
356ee8a8 When re-running build/gen.py from ninja, preserve environment variables.
7e0a9f67 Implement pretty for several more types
16d3d2e2 Ensure `gn edit` follows the style guide for variable ordering.
7826279d Simplify code produced by gn edit.
1c73f622 Support setting expressions in `gn edit`
f73e445a Revert "Write to ninja files via a standard API"
8e99cccd Write to ninja files via a standard API
02564b48 Use move instead of add where suitable when suggesting fixes.
a99d46a9 Fix EditCommandTest.ShardSubcommand
a6f2c97a Support public_inputs in gn desc
4cf50b37 Update `gn format` to always insert newlines before targets.
150a9d6b run_formatter.sh: Warn if `rustfmt` is not installed.
d71c4a70 docs: Document that copy() uses the toolchain's copy tool
c1b66378 standard_out.h: Add ScopedBufferedOuptut class.
664f3e63 Support public_inputs in group targets
deecdc59 Run benchmarks serially.
07014ca3 Write benchmarks to out/before and out/after instead of out/
a6473d48 Add jj subcommands to easily compare revisions.
e10143e8 Add `build/gen.py --gen ~/chromium/src=out/Default`
d0aec586 Create a trace comparison tool to evaluate the performance impact of a change.
c7ffaf80 Allow host_os and host_cpu to be accessed in .gn files
e0a6ab04 Implement `gn edit "shard"` subcommand
b1da1218 Hint about --fix/--apply when running without them
2fc5f9e5 Add support for creating new targets in `gn edit`
58933a7c Support cloning of nodes in the AST.
f3d7a0c8 Mark NOTREACHED as [[noreturn]]
2481edf5 Implement `gn check --fix`
f0be464b Fix gn suggest adding self-dependency loops.
d2e84fac Add a `gn suggest --apply` option.
39e3f7ad Add `gn edit` suggestions to `gn suggest`
c6cffd45 Implement `gn edit "rename attr attr"`
bc1914cf Implement `gn edit "move attr attr value(s)"`
167116e0 Implement `gn edit "add attribute value(s)"`
1c79e13d Implement `gn edit "remove attr value(s)"`
e8a8e093 Refactor parse nodes to support non-const access.
24800a7f Implement `gn edit delete` and `gn edit remove attr`
0db00fc0 Implement `gn edit` command, and implement a simple subcommand "set"
d5594ca8 Add features to test framework
152bfad2 Implement a Result<T> type.
6b0190f7 Fix formatter on main branch
73243639 Fix path to build/gen.py.
d1996a79 Add pre-upload checks into ninja targets
64cfb834 Add --exclude-type command-line argument
925dd782 Add CQ to starlark branch
a01a5a9b Refactor main.star to support multiple branches.
f9cea148 Implement rule implementation execution.
3a817c2e Create a simple session type and create a test for it.
37ab73c2 Fix lifetime of starlark struct keys passed to C++.
4ac29005 Rename .bzl to .scl in accordance with design doc guidance.

--===============3137402317178982708==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/gn/gn-dbg: PKGV changed from 0+git0+17b0057970 to 0+git0+cfcd774b98
packages/x86-64-v3-poky-linux/gn/gn-dev: PKGV changed from 0+git0+17b0057970 to 0+git0+cfcd774b98
packages/x86-64-v3-poky-linux/gn/gn-doc: PKGV changed from 0+git0+17b0057970 to 0+git0+cfcd774b98
packages/x86-64-v3-poky-linux/gn/gn-locale: PKGV changed from 0+git0+17b0057970 to 0+git0+cfcd774b98
packages/x86-64-v3-poky-linux/gn/gn-src: PKGV changed from 0+git0+17b0057970 to 0+git0+cfcd774b98
packages/x86-64-v3-poky-linux/gn/gn-staticdev: PKGV changed from 0+git0+17b0057970 to 0+git0+cfcd774b98
packages/x86-64-v3-poky-linux/gn/gn: PKGV changed from 0+git0+17b0057970 to 0+git0+cfcd774b98

--===============3137402317178982708==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gn/gn-dbg: PKGV changed from 0+git0+17b0057970 to 0+git0+cfcd774b98
packages/x86-64-v3-poky-linux/gn/gn-dbg: PKGSIZE changed from 108901032 to 114538736 (+5%)
packages/x86-64-v3-poky-linux/gn/gn-dev: PKGV changed from 0+git0+17b0057970 to 0+git0+cfcd774b98
packages/x86-64-v3-poky-linux/gn/gn-doc: PKGV changed from 0+git0+17b0057970 to 0+git0+cfcd774b98
packages/x86-64-v3-poky-linux/gn/gn-locale: PKGV changed from 0+git0+17b0057970 to 0+git0+cfcd774b98
packages/x86-64-v3-poky-linux/gn/gn-src: PKGV changed from 0+git0+17b0057970 to 0+git0+cfcd774b98
packages/x86-64-v3-poky-linux/gn/gn-src: PKGSIZE changed from 3265044 to 3380363 (+4%)
packages/x86-64-v3-poky-linux/gn/gn-src: FILELIST: added "/usr/src/debug/gn/0+git/src/gn/build_file_editor.h /usr/src/debug/gn/0+git/src/gn/edit_command.cc /usr/src/debug/gn/0+git/src/gn/edit_command.h /usr/src/debug/gn/0+git/src/gn/edit_subcommands.cc /usr/src/debug/gn/0+git/src/gn/edit_subcommands.h /usr/src/debug/gn/0+git/src/gn/build_file_editor.cc"
packages/x86-64-v3-poky-linux/gn/gn-staticdev: PKGV changed from 0+git0+17b0057970 to 0+git0+cfcd774b98
packages/x86-64-v3-poky-linux/gn/gn: PKGV changed from 0+git0+17b0057970 to 0+git0+cfcd774b98
packages/x86-64-v3-poky-linux/gn/gn: PKGSIZE changed from 4112584 to 4358376 (+6%)

--===============3137402317178982708==--

