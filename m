Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55FF3C98318
	for <webhook@archiver.kernel.org>; Sat, 26 Sep 2026 05:25:12 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14310.1790400311127389709
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Sep 2026 22:25:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=dURkOMMC;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=0uEc/FBS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101a0dc2caab1-f3ba0329-4c96-4e2c-bc15-dfda42f0e4ed-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790400310;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Wa88RrE38/RotbQGP1kZraz/3m5ZZx6QFviF1zSEd5Q=;
	b=dURkOMMCKAUu8Xv008GIHKs+INtw1B6Fwo6z4OwLchvdCKFcY11SzwdkKw5ng4Bo
	3FSms7VYN7wtFv122euz0G2iexlu5aGqUnHoHG6Hjx4wPMr5dYNgIyJO9ZOWVcAJsby
	fLv9HhzwNSeaRrN+Nwd4e+rJlrVKjhOmvS6aSkWg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790400310;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Wa88RrE38/RotbQGP1kZraz/3m5ZZx6QFviF1zSEd5Q=;
	b=0uEc/FBSPOWKGjoZJkeEzOo7VLMEb4P88d8WMiaZJVzP5kZeLYnXit+WYhvfl4Q5
	AVK2h6DhnlnplpexSH0YqVfsIOU+RlAawucvcS9EwNkVVrPa3TU/fc2t/bZ/fPlM6HQ
	SZHkj/F+Q00Uy5DGW6fPVoK1HoJ+j7FxZuqre6Yk=
Content-Type: multipart/mixed; boundary="===============7903197337100005936=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-markdown: upgrading to 3.11 SUCCEEDED
Message-ID: <010101a0dc2caab1-f3ba0329-4c96-4e2c-bc15-dfda42f0e4ed-000000@us-west-2.amazonses.com>
Date: Sat, 26 Sep 2026 05:25:09 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.26-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Sep 2026 05:25:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246629

--===============7903197337100005936==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-markdown* to *3.11* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-markdown-upgrade-3.10.3-3.11.patch
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
From 2101b2f868c33e2ac7e43ae8a0384feb6d0f0463 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 26 Sep 2026 05:14:59 +0000
Subject: [PATCH] python3-markdown: upgrade 3.10.3 -> 3.11

---
title: Release Notes for v2.0
---

Python-Markdown 2.0 Release Notes
=================================

We are happy to release Python-Markdown 2.0, which has been over a year in the
making. We have rewritten significant portions of the code, dramatically
extending the extension API, increased performance, and added numerous
extensions to the distribution (including an extension that mimics PHP Markdown
Extra), all while maintaining backward compatibility with the end user API in
version 1.7.

Python-Markdown supports Python versions 2.3, 2.4, 2.5, and 2.6. We have even
released a version converted to Python 3.0!

Backwards-incompatible Changes
------------------------------

While Python-Markdown has experienced numerous internal changes, those changes
should only affect extension authors. If you have not written your own
extensions, then you should not need to make any changes to your code.
However, you may want to ensure that any third party extensions you are using
are compatible with the new API.

The new extension API is fully [documented](../extensions/api.md) in the docs.
Below is a summary of the significant changes:

What's New in Python-Markdown 2.0
---------------------------------

Thanks to the work of Artem Yunusov as part of GSoC 2008, Python-Markdown uses
ElementTree internally to build the (X)HTML document from markdown source text.
This has resolved various issues with the older home-grown NanoDOM and made
notable increases in performance.

Artem also refactored the Inline Patterns to better support nested patterns
which has resolved many inconsistencies in Python-Markdown's parsing of the
markdown syntax.

The core parser had been completely rewritten, increasing performance and, for
the first time, making it possible to override/add/change the way block level
content is parsed.

Python-Markdown now parses markdown source text more closely to the other
popular implementations (Perl, PHP, etc.) than it ever has before. With the
exception of a few minor insignificant differences, any difference should be
considered a bug, rather than a limitation of the parser.

The option to return HTML4 output as apposed to XHTML has been added. In
addition, extensions should be able to easily add additional output formats.

As part of implementing markdown in the Dr. Project project (a Trac fork), among
other things, David Wolever refactored the "extension" keyword so that it
accepts either the extension names as strings or instances of extensions. This
makes it possible to include multiple extensions in a single module.

Numerous extensions are included in the distribution by default. See
[available_extensions](../extensions/index.md) for a complete list.

See the [Change Log](index.md) for a full list of changes.

---
title: Release Notes for v2.1
---

Python-Markdown 2.1 Release Notes
=================================

We are pleased to release Python-Markdown 2.1 which makes many
improvements on 2.0. In fact, we consider 2.1 to be what 2.0 should have been.
While 2.1 consists mostly of bug fixes, bringing Python-Markdown more inline
with other implementations, some internal improvements were made to the parser,
a few new built-in extensions were added, and HTML5 support was added.

Python-Markdown supports Python versions 2.4, 2.5, 2.6, 2.7, 3.1, and 3.2 out
of the box. In fact, the same code base installs on Python 3.1 and 3.2 with no
extra work by the end user.

Backwards-incompatible Changes
------------------------------

While Python-Markdown has received only minor internal changes since the last
release, there are a few backward-incompatible changes to note:

What's New in Python-Markdown 2.1
---------------------------------

Three new extensions were added. [Attribute Lists](../extensions/attr_list.md),
which was inspired by Maruku's feature of the same name, [Newline to
Break](../extensions/nl2br.md), which was inspired by GitHub Flavored Markdown,
and Smart Strong, which fills a hole in the Extra extension.

HTML5 is now supported. All this really means is that new block level elements
introduced in the HTML5 spec are now properly recognized as raw HTML. As
valid  HTML5 can consist of either HTML4 or XHTML1, there is no need to add a
new HTML5  serializers. That said, `html5` and `xhtml5` have been added as
aliases of the `html4` and `xhtml1` serializers respectively.

An XHTML serializer has been added. Previously, ElementTree's XML serializer
was being used for XHTML output. With the new serializer we are able to avoid
more invalid output like empty elements (i.e., `<p />`) which can choke
browsers.

Improved support for Python 3.x. Now when running `setupy.py install` in
Python 3.1 or greater the 2to3 tool is run automatically. Note that Python 3.0
is not supported due to a bug in its 2to3 tool. If you must use Python-Markdown
with Python 3.0, it is suggested you manually use Python 3.1's 2to3 tool to
do a conversion.

Methods on instances of the Markdown class that do not return r

[Changelog truncated as it exceeds 5000 characters;
the full changelog can be found in an attachment to the AUH email]
---
 .../{python3-markdown_3.10.3.bb => python3-markdown_3.11.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-markdown_3.10.3.bb => python3-markdown_3.11.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-markdown_3.10.3.bb b/meta/recipes-devtools/python/python3-markdown_3.11.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-markdown_3.10.3.bb
rename to meta/recipes-devtools/python/python3-markdown_3.11.bb
index a7fd3d7840..709e7cdb70 100644
--- a/meta/recipes-devtools/python/python3-markdown_3.10.3.bb
+++ b/meta/recipes-devtools/python/python3-markdown_3.11.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=ec58cdf7cfed06a21f7a9362627a5480"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "3589362618f743188b4d955b874402bc814f4f83f544dc207719f4baa7d9c45f"
+SRC_URI[sha256sum] = "180224db6aed87ba9ce1f2781ebcd5826253de8ff637112090e24b84502bbf9f"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.47.1


--===============7903197337100005936==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown: FILELIST: directory renamed /usr/lib/python3.14/site-packages/markdown-3.10.3.dist-info/licenses -> /usr/lib/python3.14/site-packages/markdown-3.11.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/markdown-3.10.3.dist-info -> /usr/lib/python3.14/site-packages/markdown-3.11.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-markdown (sysroot):
  /usr/lib/python3.14/site-packages/markdown-3.11.dist-info was added
  /usr/lib/python3.14/site-packages/markdown-3.11.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/markdown-3.11.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/markdown-3.11.dist-info/licenses/LICENSE.md was added
  /usr/lib/python3.14/site-packages/markdown-3.11.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/markdown-3.11.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/markdown-3.11.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/markdown-3.10.3.dist-info was removed
  /usr/lib/python3.14/site-packages/markdown-3.10.3.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/markdown-3.10.3.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/markdown-3.10.3.dist-info/licenses/LICENSE.md was removed
  /usr/lib/python3.14/site-packages/markdown-3.10.3.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/markdown-3.10.3.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/markdown-3.10.3.dist-info/WHEEL was removed

--===============7903197337100005936==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-markdown-upgrade-3.10.3-3.11.patch"

RnJvbSAyMTAxYjJmODY4YzMzZTJhYzdlNDNhZThhMDM4NGZlYjZkMGYwNDYzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMjYgU2VwIDIwMjYgMDU6MTQ6NTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLW1hcmtkb3duOiB1cGdyYWRlIDMuMTAuMyAtPiAzLjExCgotLS0KdGl0bGU6IFJlbGVh
c2UgTm90ZXMgZm9yIHYyLjAKLS0tCgpQeXRob24tTWFya2Rvd24gMi4wIFJlbGVhc2UgTm90ZXMK
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CgpXZSBhcmUgaGFwcHkgdG8gcmVsZWFz
ZSBQeXRob24tTWFya2Rvd24gMi4wLCB3aGljaCBoYXMgYmVlbiBvdmVyIGEgeWVhciBpbiB0aGUK
bWFraW5nLiBXZSBoYXZlIHJld3JpdHRlbiBzaWduaWZpY2FudCBwb3J0aW9ucyBvZiB0aGUgY29k
ZSwgZHJhbWF0aWNhbGx5CmV4dGVuZGluZyB0aGUgZXh0ZW5zaW9uIEFQSSwgaW5jcmVhc2VkIHBl
cmZvcm1hbmNlLCBhbmQgYWRkZWQgbnVtZXJvdXMKZXh0ZW5zaW9ucyB0byB0aGUgZGlzdHJpYnV0
aW9uIChpbmNsdWRpbmcgYW4gZXh0ZW5zaW9uIHRoYXQgbWltaWNzIFBIUCBNYXJrZG93bgpFeHRy
YSksIGFsbCB3aGlsZSBtYWludGFpbmluZyBiYWNrd2FyZCBjb21wYXRpYmlsaXR5IHdpdGggdGhl
IGVuZCB1c2VyIEFQSSBpbgp2ZXJzaW9uIDEuNy4KClB5dGhvbi1NYXJrZG93biBzdXBwb3J0cyBQ
eXRob24gdmVyc2lvbnMgMi4zLCAyLjQsIDIuNSwgYW5kIDIuNi4gV2UgaGF2ZSBldmVuCnJlbGVh
c2VkIGEgdmVyc2lvbiBjb252ZXJ0ZWQgdG8gUHl0aG9uIDMuMCEKCkJhY2t3YXJkcy1pbmNvbXBh
dGlibGUgQ2hhbmdlcwotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KCldoaWxlIFB5dGhv
bi1NYXJrZG93biBoYXMgZXhwZXJpZW5jZWQgbnVtZXJvdXMgaW50ZXJuYWwgY2hhbmdlcywgdGhv
c2UgY2hhbmdlcwpzaG91bGQgb25seSBhZmZlY3QgZXh0ZW5zaW9uIGF1dGhvcnMuIElmIHlvdSBo
YXZlIG5vdCB3cml0dGVuIHlvdXIgb3duCmV4dGVuc2lvbnMsIHRoZW4geW91IHNob3VsZCBub3Qg
bmVlZCB0byBtYWtlIGFueSBjaGFuZ2VzIHRvIHlvdXIgY29kZS4KSG93ZXZlciwgeW91IG1heSB3
YW50IHRvIGVuc3VyZSB0aGF0IGFueSB0aGlyZCBwYXJ0eSBleHRlbnNpb25zIHlvdSBhcmUgdXNp
bmcKYXJlIGNvbXBhdGlibGUgd2l0aCB0aGUgbmV3IEFQSS4KClRoZSBuZXcgZXh0ZW5zaW9uIEFQ
SSBpcyBmdWxseSBbZG9jdW1lbnRlZF0oLi4vZXh0ZW5zaW9ucy9hcGkubWQpIGluIHRoZSBkb2Nz
LgpCZWxvdyBpcyBhIHN1bW1hcnkgb2YgdGhlIHNpZ25pZmljYW50IGNoYW5nZXM6CgpXaGF0J3Mg
TmV3IGluIFB5dGhvbi1NYXJrZG93biAyLjAKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCgpUaGFua3MgdG8gdGhlIHdvcmsgb2YgQXJ0ZW0gWXVudXNvdiBhcyBwYXJ0IG9mIEdTb0Mg
MjAwOCwgUHl0aG9uLU1hcmtkb3duIHVzZXMKRWxlbWVudFRyZWUgaW50ZXJuYWxseSB0byBidWls
ZCB0aGUgKFgpSFRNTCBkb2N1bWVudCBmcm9tIG1hcmtkb3duIHNvdXJjZSB0ZXh0LgpUaGlzIGhh
cyByZXNvbHZlZCB2YXJpb3VzIGlzc3VlcyB3aXRoIHRoZSBvbGRlciBob21lLWdyb3duIE5hbm9E
T00gYW5kIG1hZGUKbm90YWJsZSBpbmNyZWFzZXMgaW4gcGVyZm9ybWFuY2UuCgpBcnRlbSBhbHNv
IHJlZmFjdG9yZWQgdGhlIElubGluZSBQYXR0ZXJucyB0byBiZXR0ZXIgc3VwcG9ydCBuZXN0ZWQg
cGF0dGVybnMKd2hpY2ggaGFzIHJlc29sdmVkIG1hbnkgaW5jb25zaXN0ZW5jaWVzIGluIFB5dGhv
bi1NYXJrZG93bidzIHBhcnNpbmcgb2YgdGhlCm1hcmtkb3duIHN5bnRheC4KClRoZSBjb3JlIHBh
cnNlciBoYWQgYmVlbiBjb21wbGV0ZWx5IHJld3JpdHRlbiwgaW5jcmVhc2luZyBwZXJmb3JtYW5j
ZSBhbmQsIGZvcgp0aGUgZmlyc3QgdGltZSwgbWFraW5nIGl0IHBvc3NpYmxlIHRvIG92ZXJyaWRl
L2FkZC9jaGFuZ2UgdGhlIHdheSBibG9jayBsZXZlbApjb250ZW50IGlzIHBhcnNlZC4KClB5dGhv
bi1NYXJrZG93biBub3cgcGFyc2VzIG1hcmtkb3duIHNvdXJjZSB0ZXh0IG1vcmUgY2xvc2VseSB0
byB0aGUgb3RoZXIKcG9wdWxhciBpbXBsZW1lbnRhdGlvbnMgKFBlcmwsIFBIUCwgZXRjLikgdGhh
biBpdCBldmVyIGhhcyBiZWZvcmUuIFdpdGggdGhlCmV4Y2VwdGlvbiBvZiBhIGZldyBtaW5vciBp
bnNpZ25pZmljYW50IGRpZmZlcmVuY2VzLCBhbnkgZGlmZmVyZW5jZSBzaG91bGQgYmUKY29uc2lk
ZXJlZCBhIGJ1ZywgcmF0aGVyIHRoYW4gYSBsaW1pdGF0aW9uIG9mIHRoZSBwYXJzZXIuCgpUaGUg
b3B0aW9uIHRvIHJldHVybiBIVE1MNCBvdXRwdXQgYXMgYXBwb3NlZCB0byBYSFRNTCBoYXMgYmVl
biBhZGRlZC4gSW4KYWRkaXRpb24sIGV4dGVuc2lvbnMgc2hvdWxkIGJlIGFibGUgdG8gZWFzaWx5
IGFkZCBhZGRpdGlvbmFsIG91dHB1dCBmb3JtYXRzLgoKQXMgcGFydCBvZiBpbXBsZW1lbnRpbmcg
bWFya2Rvd24gaW4gdGhlIERyLiBQcm9qZWN0IHByb2plY3QgKGEgVHJhYyBmb3JrKSwgYW1vbmcK
b3RoZXIgdGhpbmdzLCBEYXZpZCBXb2xldmVyIHJlZmFjdG9yZWQgdGhlICJleHRlbnNpb24iIGtl
eXdvcmQgc28gdGhhdCBpdAphY2NlcHRzIGVpdGhlciB0aGUgZXh0ZW5zaW9uIG5hbWVzIGFzIHN0
cmluZ3Mgb3IgaW5zdGFuY2VzIG9mIGV4dGVuc2lvbnMuIFRoaXMKbWFrZXMgaXQgcG9zc2libGUg
dG8gaW5jbHVkZSBtdWx0aXBsZSBleHRlbnNpb25zIGluIGEgc2luZ2xlIG1vZHVsZS4KCk51bWVy
b3VzIGV4dGVuc2lvbnMgYXJlIGluY2x1ZGVkIGluIHRoZSBkaXN0cmlidXRpb24gYnkgZGVmYXVs
dC4gU2VlClthdmFpbGFibGVfZXh0ZW5zaW9uc10oLi4vZXh0ZW5zaW9ucy9pbmRleC5tZCkgZm9y
IGEgY29tcGxldGUgbGlzdC4KClNlZSB0aGUgW0NoYW5nZSBMb2ddKGluZGV4Lm1kKSBmb3IgYSBm
dWxsIGxpc3Qgb2YgY2hhbmdlcy4KCi0tLQp0aXRsZTogUmVsZWFzZSBOb3RlcyBmb3IgdjIuMQot
LS0KClB5dGhvbi1NYXJrZG93biAyLjEgUmVsZWFzZSBOb3Rlcwo9PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT0KCldlIGFyZSBwbGVhc2VkIHRvIHJlbGVhc2UgUHl0aG9uLU1hcmtkb3du
IDIuMSB3aGljaCBtYWtlcyBtYW55CmltcHJvdmVtZW50cyBvbiAyLjAuIEluIGZhY3QsIHdlIGNv
bnNpZGVyIDIuMSB0byBiZSB3aGF0IDIuMCBzaG91bGQgaGF2ZSBiZWVuLgpXaGlsZSAyLjEgY29u
c2lzdHMgbW9zdGx5IG9mIGJ1ZyBmaXhlcywgYnJpbmdpbmcgUHl0aG9uLU1hcmtkb3duIG1vcmUg
aW5saW5lCndpdGggb3RoZXIgaW1wbGVtZW50YXRpb25zLCBzb21lIGludGVybmFsIGltcHJvdmVt
ZW50cyB3ZXJlIG1hZGUgdG8gdGhlIHBhcnNlciwKYSBmZXcgbmV3IGJ1aWx0LWluIGV4dGVuc2lv
bnMgd2VyZSBhZGRlZCwgYW5kIEhUTUw1IHN1cHBvcnQgd2FzIGFkZGVkLgoKUHl0aG9uLU1hcmtk
b3duIHN1cHBvcnRzIFB5dGhvbiB2ZXJzaW9ucyAyLjQsIDIuNSwgMi42LCAyLjcsIDMuMSwgYW5k
IDMuMiBvdXQKb2YgdGhlIGJveC4gSW4gZmFjdCwgdGhlIHNhbWUgY29kZSBiYXNlIGluc3RhbGxz
IG9uIFB5dGhvbiAzLjEgYW5kIDMuMiB3aXRoIG5vCmV4dHJhIHdvcmsgYnkgdGhlIGVuZCB1c2Vy
LgoKQmFja3dhcmRzLWluY29tcGF0aWJsZSBDaGFuZ2VzCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQoKV2hpbGUgUHl0aG9uLU1hcmtkb3duIGhhcyByZWNlaXZlZCBvbmx5IG1pbm9yIGlu
dGVybmFsIGNoYW5nZXMgc2luY2UgdGhlIGxhc3QKcmVsZWFzZSwgdGhlcmUgYXJlIGEgZmV3IGJh
Y2t3YXJkLWluY29tcGF0aWJsZSBjaGFuZ2VzIHRvIG5vdGU6CgpXaGF0J3MgTmV3IGluIFB5dGhv
bi1NYXJrZG93biAyLjEKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCgpUaHJlZSBu
ZXcgZXh0ZW5zaW9ucyB3ZXJlIGFkZGVkLiBbQXR0cmlidXRlIExpc3RzXSguLi9leHRlbnNpb25z
L2F0dHJfbGlzdC5tZCksCndoaWNoIHdhcyBpbnNwaXJlZCBieSBNYXJ1a3UncyBmZWF0dXJlIG9m
IHRoZSBzYW1lIG5hbWUsIFtOZXdsaW5lIHRvCkJyZWFrXSguLi9leHRlbnNpb25zL25sMmJyLm1k
KSwgd2hpY2ggd2FzIGluc3BpcmVkIGJ5IEdpdEh1YiBGbGF2b3JlZCBNYXJrZG93biwKYW5kIFNt
YXJ0IFN0cm9uZywgd2hpY2ggZmlsbHMgYSBob2xlIGluIHRoZSBFeHRyYSBleHRlbnNpb24uCgpI
VE1MNSBpcyBub3cgc3VwcG9ydGVkLiBBbGwgdGhpcyByZWFsbHkgbWVhbnMgaXMgdGhhdCBuZXcg
YmxvY2sgbGV2ZWwgZWxlbWVudHMKaW50cm9kdWNlZCBpbiB0aGUgSFRNTDUgc3BlYyBhcmUgbm93
IHByb3Blcmx5IHJlY29nbml6ZWQgYXMgcmF3IEhUTUwuIEFzCnZhbGlkICBIVE1MNSBjYW4gY29u
c2lzdCBvZiBlaXRoZXIgSFRNTDQgb3IgWEhUTUwxLCB0aGVyZSBpcyBubyBuZWVkIHRvIGFkZCBh
Cm5ldyBIVE1MNSAgc2VyaWFsaXplcnMuIFRoYXQgc2FpZCwgYGh0bWw1YCBhbmQgYHhodG1sNWAg
aGF2ZSBiZWVuIGFkZGVkIGFzCmFsaWFzZXMgb2YgdGhlIGBodG1sNGAgYW5kIGB4aHRtbDFgIHNl
cmlhbGl6ZXJzIHJlc3BlY3RpdmVseS4KCkFuIFhIVE1MIHNlcmlhbGl6ZXIgaGFzIGJlZW4gYWRk
ZWQuIFByZXZpb3VzbHksIEVsZW1lbnRUcmVlJ3MgWE1MIHNlcmlhbGl6ZXIKd2FzIGJlaW5nIHVz
ZWQgZm9yIFhIVE1MIG91dHB1dC4gV2l0aCB0aGUgbmV3IHNlcmlhbGl6ZXIgd2UgYXJlIGFibGUg
dG8gYXZvaWQKbW9yZSBpbnZhbGlkIG91dHB1dCBsaWtlIGVtcHR5IGVsZW1lbnRzIChpLmUuLCBg
PHAgLz5gKSB3aGljaCBjYW4gY2hva2UKYnJvd3NlcnMuCgpJbXByb3ZlZCBzdXBwb3J0IGZvciBQ
eXRob24gMy54LiBOb3cgd2hlbiBydW5uaW5nIGBzZXR1cHkucHkgaW5zdGFsbGAgaW4KUHl0aG9u
IDMuMSBvciBncmVhdGVyIHRoZSAydG8zIHRvb2wgaXMgcnVuIGF1dG9tYXRpY2FsbHkuIE5vdGUg
dGhhdCBQeXRob24gMy4wCmlzIG5vdCBzdXBwb3J0ZWQgZHVlIHRvIGEgYnVnIGluIGl0cyAydG8z
IHRvb2wuIElmIHlvdSBtdXN0IHVzZSBQeXRob24tTWFya2Rvd24Kd2l0aCBQeXRob24gMy4wLCBp
dCBpcyBzdWdnZXN0ZWQgeW91IG1hbnVhbGx5IHVzZSBQeXRob24gMy4xJ3MgMnRvMyB0b29sIHRv
CmRvIGEgY29udmVyc2lvbi4KCk1ldGhvZHMgb24gaW5zdGFuY2VzIG9mIHRoZSBNYXJrZG93biBj
bGFzcyB0aGF0IGRvIG5vdCByZXR1cm4gcgoKW0NoYW5nZWxvZyB0cnVuY2F0ZWQgYXMgaXQgZXhj
ZWVkcyA1MDAwIGNoYXJhY3RlcnM7CnRoZSBmdWxsIGNoYW5nZWxvZyBjYW4gYmUgZm91bmQgaW4g
YW4gYXR0YWNobWVudCB0byB0aGUgQVVIIGVtYWlsXQotLS0KIC4uLi97cHl0aG9uMy1tYXJrZG93
bl8zLjEwLjMuYmIgPT4gcHl0aG9uMy1tYXJrZG93bl8zLjExLmJifSAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtbWFya2Rvd25fMy4xMC4zLmJiID0+IHB5dGhv
bjMtbWFya2Rvd25fMy4xMS5iYn0gKDc5JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWFya2Rvd25fMy4xMC4zLmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLW1hcmtkb3duXzMuMTEuYmIKc2ltaWxhcml0eSBpbmRleCA3
OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1hcmtk
b3duXzMuMTAuMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLW1hcmtkb3duXzMuMTEuYmIKaW5kZXggYTdmZDNkNzg0MC4uNzA5ZTdjZGI3MCAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1hcmtkb3duXzMuMTAu
My5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWFya2Rvd25f
My4xMS5iYgpAQCAtNSw3ICs1LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5T
RS5tZDttZDU9ZWM1OGNkZjdjZmVkMDZhMjFmN2E5MzYyNjI3YTU0ODAiCiAKIGluaGVyaXQgcHlw
aSBweXRob25fc2V0dXB0b29sc19idWlsZF9tZXRhCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIz
NTg5MzYyNjE4Zjc0MzE4OGI0ZDk1NWI4NzQ0MDJiYzgxNGY0ZjgzZjU0NGRjMjA3NzE5ZjRiYWE3
ZDljNDVmIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjE4MDIyNGRiNmFlZDg3YmE5Y2UxZjI3ODFl
YmNkNTgyNjI1M2RlOGZmNjM3MTEyMDkwZTI0Yjg0NTAyYmJmOWYiCiAKIEJCQ0xBU1NFWFRFTkQg
PSAibmF0aXZlIG5hdGl2ZXNkayIKIAotLSAKMi40Ny4xCgo=

--===============7903197337100005936==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-markdown: SRC_URI changed from "https://files.pythonhosted.org/packages/source/m/markdown/markdown-3.10.3.tar.gz" to "https://files.pythonhosted.org/packages/source/m/markdown/markdown-3.11.tar.gz"
packages/x86-64-v3-poky-linux/python3-markdown: PKGV changed from 3.10.3 [default] to 3.11 [default]
packages/x86-64-v3-poky-linux/python3-markdown: PV changed from "3.10.3" to "3.11"
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-dbg: PV changed from "3.10.3" to "3.11"
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-dbg: PKGV changed from 3.10.3 [default] to 3.11 [default]
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-dev: PV changed from "3.10.3" to "3.11"
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-dev: PKGV changed from 3.10.3 [default] to 3.11 [default]
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-doc: PV changed from "3.10.3" to "3.11"
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-doc: PKGV changed from 3.10.3 [default] to 3.11 [default]
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-locale: PV changed from "3.10.3" to "3.11"
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-locale: PKGV changed from 3.10.3 [default] to 3.11 [default]
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-src: PV changed from "3.10.3" to "3.11"
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-src: PKGV changed from 3.10.3 [default] to 3.11 [default]
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-staticdev: PV changed from "3.10.3" to "3.11"
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-staticdev: PKGV changed from 3.10.3 [default] to 3.11 [default]
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown: PV changed from "3.10.3" to "3.11"
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown: PKGSIZE changed from 777645 to 781669 (+1%)
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown: FILELIST: directory renamed /usr/lib/python3.14/site-packages/markdown-3.10.3.dist-info -> /usr/lib/python3.14/site-packages/markdown-3.11.dist-info, directory renamed /usr/lib/python3.14/site-packages/markdown-3.10.3.dist-info/licenses -> /usr/lib/python3.14/site-packages/markdown-3.11.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown: PKGV changed from 3.10.3 [default] to 3.11 [default]
Changes to packages/x86-64-v3-poky-linux/python3-markdown (sysroot):
  /usr/lib/python3.14/site-packages/markdown-3.11.dist-info was added
  /usr/lib/python3.14/site-packages/markdown-3.11.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/markdown-3.11.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/markdown-3.11.dist-info/licenses/LICENSE.md was added
  /usr/lib/python3.14/site-packages/markdown-3.11.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/markdown-3.11.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/markdown-3.11.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/markdown-3.10.3.dist-info was removed
  /usr/lib/python3.14/site-packages/markdown-3.10.3.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/markdown-3.10.3.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/markdown-3.10.3.dist-info/licenses/LICENSE.md was removed
  /usr/lib/python3.14/site-packages/markdown-3.10.3.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/markdown-3.10.3.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/markdown-3.10.3.dist-info/WHEEL was removed

--===============7903197337100005936==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-markdown-changelog.txt"

---
title: Release Notes for v2.0
---

Python-Markdown 2.0 Release Notes
=================================

We are happy to release Python-Markdown 2.0, which has been over a year in the
making. We have rewritten significant portions of the code, dramatically
extending the extension API, increased performance, and added numerous
extensions to the distribution (including an extension that mimics PHP Markdown
Extra), all while maintaining backward compatibility with the end user API in
version 1.7.

Python-Markdown supports Python versions 2.3, 2.4, 2.5, and 2.6. We have even
released a version converted to Python 3.0!

Backwards-incompatible Changes
------------------------------

While Python-Markdown has experienced numerous internal changes, those changes
should only affect extension authors. If you have not written your own
extensions, then you should not need to make any changes to your code.
However, you may want to ensure that any third party extensions you are using
are compatible with the new API.

The new extension API is fully [documented](../extensions/api.md) in the docs.
Below is a summary of the significant changes:

What's New in Python-Markdown 2.0
---------------------------------

Thanks to the work of Artem Yunusov as part of GSoC 2008, Python-Markdown uses
ElementTree internally to build the (X)HTML document from markdown source text.
This has resolved various issues with the older home-grown NanoDOM and made
notable increases in performance.

Artem also refactored the Inline Patterns to better support nested patterns
which has resolved many inconsistencies in Python-Markdown's parsing of the
markdown syntax.

The core parser had been completely rewritten, increasing performance and, for
the first time, making it possible to override/add/change the way block level
content is parsed.

Python-Markdown now parses markdown source text more closely to the other
popular implementations (Perl, PHP, etc.) than it ever has before. With the
exception of a few minor insignificant differences, any difference should be
considered a bug, rather than a limitation of the parser.

The option to return HTML4 output as apposed to XHTML has been added. In
addition, extensions should be able to easily add additional output formats.

As part of implementing markdown in the Dr. Project project (a Trac fork), among
other things, David Wolever refactored the "extension" keyword so that it
accepts either the extension names as strings or instances of extensions. This
makes it possible to include multiple extensions in a single module.

Numerous extensions are included in the distribution by default. See
[available_extensions](../extensions/index.md) for a complete list.

See the [Change Log](index.md) for a full list of changes.

---
title: Release Notes for v2.1
---

Python-Markdown 2.1 Release Notes
=================================

We are pleased to release Python-Markdown 2.1 which makes many
improvements on 2.0. In fact, we consider 2.1 to be what 2.0 should have been.
While 2.1 consists mostly of bug fixes, bringing Python-Markdown more inline
with other implementations, some internal improvements were made to the parser,
a few new built-in extensions were added, and HTML5 support was added.

Python-Markdown supports Python versions 2.4, 2.5, 2.6, 2.7, 3.1, and 3.2 out
of the box. In fact, the same code base installs on Python 3.1 and 3.2 with no
extra work by the end user.

Backwards-incompatible Changes
------------------------------

While Python-Markdown has received only minor internal changes since the last
release, there are a few backward-incompatible changes to note:

What's New in Python-Markdown 2.1
---------------------------------

Three new extensions were added. [Attribute Lists](../extensions/attr_list.md),
which was inspired by Maruku's feature of the same name, [Newline to
Break](../extensions/nl2br.md), which was inspired by GitHub Flavored Markdown,
and Smart Strong, which fills a hole in the Extra extension.

HTML5 is now supported. All this really means is that new block level elements
introduced in the HTML5 spec are now properly recognized as raw HTML. As
valid  HTML5 can consist of either HTML4 or XHTML1, there is no need to add a
new HTML5  serializers. That said, `html5` and `xhtml5` have been added as
aliases of the `html4` and `xhtml1` serializers respectively.

An XHTML serializer has been added. Previously, ElementTree's XML serializer
was being used for XHTML output. With the new serializer we are able to avoid
more invalid output like empty elements (i.e., `<p />`) which can choke
browsers.

Improved support for Python 3.x. Now when running `setupy.py install` in
Python 3.1 or greater the 2to3 tool is run automatically. Note that Python 3.0
is not supported due to a bug in its 2to3 tool. If you must use Python-Markdown
with Python 3.0, it is suggested you manually use Python 3.1's 2to3 tool to
do a conversion.

Methods on instances of the Markdown class that do not return results can now
be changed allowing one to do `md.reset().convert(moretext)`.

The Markdown class was refactored so that a subclass could define its own
`build_parser` method which would build a completely different parser. In
other words, one could use the basic machinery in the markdown library to
build a parser of a different markup language without the overhead of building
the markdown parser and throwing it away.

Import statements within markdown have been improved so that third party
libraries can embed the markdown library if they desire (licensing permitting).

Added support for Python's `-m` command line option. You can run the markdown
package as a command line script. Do `python -m markdown [options] [args]`.
Note that this is only fully supported in Python 2.7+. Python 2.5 & 2.6
require you to call the module directly (`markdown.__main__`) rather than
the package (`markdown`). This does not work in Python 2.4.

The command line script has been renamed to `markdown_py` which avoids all the
various problems we had with previous names.  Also improved the command line
script to accept input on `stdin`.

The testing framework has been completely rebuilt using the Nose testing
framework. This provides a number of benefits including the ability to better
test the built-in extensions and other options available to change the parsing
behavior. See the Test Suite documentation for details.

Various bug fixes have been made, which are too numerous to list here. See the
[commit log](https://github.com/Python-Markdown/markdown/commits/master) for a
complete history of the changes.

---
title: Release Notes for v2.2
---

Python-Markdown 2.2 Release Notes
=================================

We are pleased to release Python-Markdown 2.2 which makes improvements on 2.1.
While 2.2 is primarily a bug fix release, some internal improvements were made
to the parser, and a few security issues were resolved.

Python-Markdown supports Python versions 2.5, 2.6, 2.7, 3.1, and 3.2 out
of the box.

Backwards-incompatible Changes
------------------------------

While Python-Markdown has received only minor internal changes since the last
release, there are a few backward-incompatible changes to note:

What's New in Python-Markdown 2.2
---------------------------------

The docs were refactored and can now be found at
`http://packages.python.org/Markdown/`. The docs are now maintained in the
Repository and are generated by the `setup.py build_docs` command.

The [Sane_Lists](../extensions/sane_lists.md)
extension was added. The Sane Lists Extension alters the behavior of the
Markdown List syntax to be less surprising by not allowing the mixing of list
types. In other words, an ordered list will not continue when an unordered list
item is encountered and vice versa.

Markdown now excepts a full path to an extension module. In other words, your
extensions no longer need to be in the primary namespace (and start with `mdx_`)
for Markdown to find them. Just do
`Markdown(extension=['path.to.some.module'])`.
As long as the provided module contains a compatible extension, the extension
will be loaded.

The BlockParser API was slightly altered to allow `blockprocessor.run` to return
`True` or `False` which provides more control to the block processor loop from
within any Blockprocessor instance.

Various bug fixes have been made. See the
[commit log](https://github.com/Python-Markdown/markdown/commits/master)
for a complete history of the changes.

---
title: Release Notes for v2.3
---

Python-Markdown 2.3 Release Notes
=================================

We are pleased to release Python-Markdown 2.3 which adds one new extension,
removes a few old (obsolete) extensions, and now runs on both Python 2 and
Python 3 without running the 2to3 conversion tool. See the list of changes
below for details.

Python-Markdown supports Python versions 2.6, 2.7, 3.1, 3.2, and 3.3.

Backwards-incompatible Changes
------------------------------

[CodeHilite Extension]: ../extensions/code_hilite.md
[PyTidyLib]: http://countergram.github.io/pytidylib/

What's New in Python-Markdown 2.3
---------------------------------

[Admonition Extension]: ../extensions/admonition.md
[rST]: http://docutils.sourceforge.net/docs/ref/rst/directives.html#specific-
admonitions

---
title:      Release Notes for v2.4
---

Python-Markdown 2.4 Release Notes
=================================

We are pleased to release Python-Markdown 2.4 which adds one new extension
and fixes various bugs. See the list of changes below for details.

Python-Markdown supports Python versions 2.6, 2.7, 3.1, 3.2, and 3.3.

Backwards-incompatible Changes
------------------------------

[CodeHilite Extension]: ../extensions/code_hilite.md

What's New in Python-Markdown 2.4
---------------------------------

[Dmitry Shachnev]: https://github.com/mitya57
[Smarty Extension]: ../extensions/smarty.md
[SmartyPants]: https://daringfireball.net/projects/smartypants/

[Table of Contents Extension]: ../extensions/toc.md
[Sphinx]: http://sphinx-doc.org/

[Markdown Inside HTML Blocks]: ../extensions/md_in_html.md
[ryneeverett]: https://github.com/ryneeverett

        ```.python hl_lines="1 3"
        # This line will be emphasized.
        # This one won't.
        # This one will be also emphasized.
        ```

    Thanks to [A. Jesse Jiryu Davis] for implementing this feature.

[Fenced Code Extension]: ../extensions/fenced_code_blocks.md
[A. Jesse Jiryu Davis]: https://github.com/ajdavis

---
title:      Release Notes for v2.5
---

Python-Markdown 2.5 Release Notes
=================================

We are pleased to release Python-Markdown 2.5 which adds a few new features
and fixes various bugs. See the list of changes below for details.

Python-Markdown version 2.5 supports Python versions 2.7, 3.2, 3.3, and 3.4.

Backwards-incompatible Changes
------------------------------

[CodeHilite Extension]: ../extensions/code_hilite.md
[linenums]: ../extensions/code_hilite.md#usage

    If your code previously looked like this:
        html = markdown.markdown(text, same_mode=True)

    Then it is recommended that you change your code to read something like
    this:

        import bleach
        html = bleach.clean(markdown.markdown(text))

    If you are not interested in sanitizing untrusted text, but simply desire to
    escape raw HTML, then that can be accomplished through an extension which
    removes HTML parsing:

        from markdown.extensions import Extension

        class EscapeHtml(Extension):
            def extendMarkdown(self, md, md_globals):
                del md.preprocessors['html_block']
                del md.inlinePatterns['html']

        html = markdown.markdown(text, extensions=[EscapeHtml()])

    As the HTML would not be parsed with the above Extension, then the
    serializer will escape the raw HTML, which is exactly what happens now when
    `safe_mode="escape"`.

[Bleach]: https://bleach.readthedocs.io/
         html = markdown.markdown(text, ['extra'])
    Then it is recommended that you change it to read something like this:
        html = markdown.markdown(text, extensions=['extra'])

    !!! Note
        This change is being made as a result of deprecating `"safe_mode"` as
        the
        `safe_mode` argument was one of the positional arguments. When that
        argument
        is removed, the two arguments following it will no longer be at the
        correct
        position. It is recommended that you always use keywords when they are
        supported
        for this reason.

        markdown.markdown(text, extensions=['extra'])
    You should change your code to the following:
        markdown.markdown(text, extensions=['markdown.extensions.extra'])
    The same applies to the command line:
        $ python -m markdown -x markdown.extensions.extra input.txt

    See the [documentation](../library.md#extensions) for a full explanation
    of the current behavior.

What's New in Python-Markdown 2.5
---------------------------------

[Smarty Extension]: ../extensions/smarty.md
[Martin Altmayer]:https://github.com/MartinAltmayer

    Additionally, a Class may be specified in the name. The class must be at the
    end of the name (which uses dot notation from PYTHONPATH) and be separated
    by a colon from the module.

    Therefore, if you were to import the class like this:
        from path.to.module import SomeExtensionClass
    Then the named extension would comprise this string:
        "path.to.module:SomeExtensionClass"

    This allows multiple extensions to be implemented within the same module and
    still accessible when the user is not able to import the extension directly
    (perhaps from a template filter or the command line).

    This also means that extension modules are no longer required to include the
    `makeExtension` function which returns an instance of the extension class.
    However, if the user does not specify the class name (she only provides
    `"path.to.module"`) the extension will fail to load without the
    `makeExtension` function included in the module. Extension authors will want
    to document carefully what is required to load their extensions.

[ex]: ../library.md#extensions

    Extension authors are encouraged to review the new methods available on the
    `markdown.extnesions.Extension` class for handling configuration and adjust
    their code going forward. The included extensions provide a model for best
    practices. See the [API] documentation for a full explanation.

[ec]: ../library.md#extension_configs
[API]: ../extensions/api.md#configsettings

[cli]: ../cli.md#using-extensions
[YAML]: https://yaml.org/
[JSON]: https://json.org/
[PyYAML]: https://pyyaml.org/

[ae]: ../extensions/admonition.md

---
title: Release Notes for v2.6
---

# Python-Markdown 2.6 Release Notes

We are pleased to release Python-Markdown 2.6 which adds a few new features
and fixes various bugs. See the list of changes below for details.

Python-Markdown version 2.6 supports Python versions 2.7, 3.2, 3.3, and 3.4 as
well as PyPy.

## Backwards-incompatible Changes
### `safe_mode` Deprecated

Both `safe_mode` and the associated `html_replacement_text` keywords are
deprecated in version 2.6 and will raise a **`DeprecationWarning`**. The
`safe_mode` and `html_replacement_text` keywords will be ignored in the next
release. The so-called "safe mode" was never actually "safe" which has resulted
in many people having a false sense of security when using it. As an
alternative, the developers of Python-Markdown recommend that any untrusted
content be passed through an HTML sanitizer (like [Bleach]) after being
converted to HTML by markdown. In fact, [Bleach Whitelist] provides a curated
list of tags, attributes, and styles suitable for filtering user-provided HTML
using bleach.

If your code previously looked like this:

```python
html = markdown.markdown(text, safe_mode=True)
```

Then it is recommended that you change your code to read something like this:

```python
import bleach
from bleach_whitelist import markdown_tags, markdown_attrs
html = bleach.clean(markdown.markdown(text), markdown_tags, markdown_attrs)
```

If you are not interested in sanitizing untrusted text, but simply desire to
escape raw HTML, then that can be accomplished through an extension which
removes HTML parsing:

```python
from markdown.extensions import Extension

class EscapeHtml(Extension):
    def extendMarkdown(self, md, md_globals):
        del md.preprocessors['html_block']
        del md.inlinePatterns['html']

html = markdown.markdown(text, extensions=[EscapeHtml()])
```

As the HTML would not be parsed with the above Extension, then the serializer
will escape the raw HTML, which is exactly what happens now when
`safe_mode="escape"`.

[Bleach]: https://bleach.readthedocs.io/
[Bleach Whitelist]: https://github.com/yourcelf/bleach-whitelist

### Positional Arguments Deprecated

Positional arguments on the `markdown.Markdown()` class are deprecated as are
all except the `text` argument on the `markdown.markdown()` wrapper function.
Using positional arguments will raise a **`DeprecationWarning`** in 2.6 and an
error in the next release. Only keyword arguments should be used. For example,
if your code previously looked like this:

```python
html = markdown.markdown(text, [SomeExtension()])
```

Then it is recommended that you change it to read something like this:

```python
html = markdown.markdown(text, extensions=[SomeExtension()])
```

!!! Note
    This change is being made as a result of deprecating `"safe_mode"` as the
    `safe_mode` argument was one of the positional arguments. When that argument
    is removed, the two arguments following it will no longer be at the correct
    position. It is recommended that you always use keywords when they are
    supported for this reason.

### "Shortened" Extension Names Deprecated

In previous versions of Python-Markdown, the built-in extensions received
special status and did not require the full path to be provided. Additionally,
third party extensions whose name started with `"mdx_"` received the same
special treatment. This behavior is deprecated and will raise a
**`DeprecationWarning`** in version 2.6 and an error in the next release. Ensure
that you always use the full path to your extensions. For example, if you
previously did the following:

```python
markdown.markdown(text, extensions=['extra'])
```

You should change your code to the following:

```python
markdown.markdown(text, extensions=['markdown.extensions.extra'])
```

The same applies to the command line:

```python
python -m markdown -x markdown.extensions.extra input.txt
```

Similarly, if you have used a third party extension (for example `mdx_math`),
previously you might have called it like this:

```python
markdown.markdown(text, extensions=['math'])
```

As the `"mdx"` prefix will no longer be appended, you will need to change your
code as follows (assuming the file `mdx_math.py` is installed at the root of
your PYTHONPATH):

```python
markdown.markdown(text, extensions=['mdx_math'])
```

Extension authors will want to update their documentation to reflect the new
behavior.

See the [documentation](../library.md#extensions) for a full explanation
of the current behavior.

### Extension Configuration as Part of Extension Name Deprecated

The previously documented method of appending the extension configuration
options as a string to the extension name is deprecated and will raise a
**`DeprecationWarning`** in version 2.6 and an error in 2.7. The
[`extension_configs`](../library.md#extension_configs) keyword should be used
instead. See the [documentation](../library.md#extension_configs) for a full
explanation of the current behavior.

### HeaderId Extension Pending Deprecation

The HeaderId Extension is pending deprecation and will raise a
**`PendingDeprecationWarning`** in version 2.6. The extension will be deprecated
in the next release and raise an error in the release after that. Use the [Table
of Contents][TOC] Extension instead, which offers most of the features of the
HeaderId Extension and more (support for meta data is missing).

Extension authors who have been using the `slugify` and `unique` functions
defined in the HeaderId Extension should note that those functions are now
defined in the Table of Contents extension and should adjust their import
statements accordingly (`from markdown.extensions.toc import slugify, unique`).

### The `configs` Keyword is Deprecated

Positional arguments and the `configs` keyword on the
`markdown.extension.Extension` class (and its subclasses) are deprecated. Each
individual configuration option should be passed to the class as a keyword/value
pair. For example. one might have previously initiated an extension subclass
like this:

```python
ext = SomeExtension(configs={'somekey': 'somevalue'})
```

That code should be updated to pass in the options directly:

```python
ext = SomeExtension(somekey='somevalue')
```

Extension authors will want to note that this affects the `makeExtension`
function as well. Previously it was common for the function to be defined as
follows:

```python
def makeExtension(configs=None):
    return SomeExtension(configs=configs)
```

Extension authors will want to update their code to the following instead:

```python
def makeExtension(**kwargs):
    return SomeExtension(**kwargs)
```

Failing to do so will result in a **`DeprecationWarning`** and will raise an
error in the next release. See the [Extension API][mext] documentation for more
information.

In the event that an `markdown.extension.Extension` subclass overrides the
`__init__` method and implements its own configuration handling, then the above
may not apply. However, it is recommended that the subclass still calls the
parent `__init__` method to handle configuration options like so:

```python
class SomeExtension(markdown.extension.Extension):
    def __init__(**kwargs):
        # Do pre-config stuff here
        # Set config defaults
        self.config = {
            'option1' : ['value1', 'description1'],
            'option2' : ['value2', 'description2']
        }
        # Set user defined configs
        super(MyExtension, self).__init__(**kwargs)
        # Do post-config stuff here
```

Note the call to `super` to get the benefits of configuration handling from the
parent class. See the [documentation][config] for more information.

[config]: ../extensions/api.md#configsettings
[mext]: ../extensions/api.md#dot_notation

## What's New in Python-Markdown 2.6
### Official Support for PyPy

Official support for [PyPy] has been added. While Python-Markdown has most
likely worked on PyPy for some time, it is now officially supported and tested
on PyPy.

[PyPy]: https://pypy.org/
### YAML Style Meta-Data

<del>The [Meta-Data] Extension now includes optional support for [YAML] style
meta-data.</del> By default, the YAML deliminators are recognized, however, the
actual data is parsed as previously. This follows the syntax of [MultiMarkdown],
which inspired this extension.

<del>Alternatively, if the `yaml` option is set, then the data is parsed as
YAML.</del> <ins>As the `yaml` option was buggy, it was removed in 2.6.1. It is
suggested that a preprocessor (like [docdata]) or a third party extension be
used if you want true YAML support. See [Issue #390][#390] for a full
explanation.</ins>

[MultiMarkdown]: https://fletcherpenney.net/multimarkdown/#metadata
[Meta-Data]: ../extensions/meta_data.md
[YAML]: https://yaml.org/
[#390]:
[docdata]: https://github.com/waylan/docdata

### Table of Contents Extension Refactored

The [Table of Contents][TOC] Extension has been refactored and some new features
have been added. See the documentation for a full explanation of each feature
listed below:

[TOC]: ../extensions/toc.md
### Pygments can now be disabled

The [CodeHilite][ch] Extension has gained a new configuration option:
`use_pygments`. The option is `True` by default, however, it allows one to turn
off Pygments code highlighting (set to `False`) while preserving the language
detection features of the extension. Note that Pygments language guessing is not
used as that would 'use Pygments'. If a language is defined for a code block, it
will be assigned to the `<code>` tag as a class in the manner suggested by the
[HTML5 spec][spec] (alternate output will not be entertained) and could
potentially be used by a JavaScript library in the browser to highlight the code
block.

[ch]: ../extensions/code_hilite.md
[spec]: https://www.w3.org/TR/html5/text-level-semantics.html#the-code-element

### Miscellaneous

Test coverage has been improved including running [flake8]. While those changes
will not directly effect end users, the code is being better tested which will
benefit everyone.

[flake8]: https://flake8.readthedocs.io/en/latest/

Various bug fixes have been made.  See the
[commit log](https://github.com/Python-Markdown/markdown/commits/master)
for a complete history of the changes.

--===============7903197337100005936==--

