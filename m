Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2B70C4708C
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:19 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web12.24545.1665871395705713942
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Og74V4P3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010183ddac3994-d041ff28-537e-42dd-8d41-4f24f8a144ea-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871395;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=03KlTZwLYNV8ZSdaCZrWiKCr0dxJJQb6MRwgkDH8Oc8=;
	b=Og74V4P3F8ZUxOm14DU+210fCUjQvg3zmR+xK0bp1ChNaFHLDpNzIaelQRVkcWhi
	A7gVdYss+BZaja24rUgOnh5eLnjZh4Wsm6K2g+lz/CYrYHmHp5XmJqzzutRtVTN6i5F
	zyDECknK/VZwHEcSttwr3PzqhCQpnDOg6kRDbGHE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871395;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=03KlTZwLYNV8ZSdaCZrWiKCr0dxJJQb6MRwgkDH8Oc8=;
	b=k+KeQgKlk0gHPz8s2Mtsyoh1jmep49y5oR5vT3G37BKK5cJ//+Cmq0I04JHYFrKB
	zf8QDEEmfc+mSZLa+9EgurNEUrxoCSMJJVWI9gszXdWpZpBweV3GXRLN2OYe+IvT3TM
	6uyKcgpBtjMXH0HozGsIaPnOTgKFXdFx+dWsC0OY=
Content-Type: multipart/mixed; boundary="===============7820965111258796369=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] harfbuzz: upgrading to 5.3.0 SUCCEEDED
Message-ID: <01010183ddac3994-d041ff28-537e-42dd-8d41-4f24f8a144ea-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171828

--===============7820965111258796369==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *harfbuzz* to *5.3.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-harfbuzz-upgrade-5.1.0-5.3.0.patch
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
--===============7820965111258796369==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/harfbuzz/harfbuzz-icu: FILELIST: removed "/usr/lib/libharfbuzz-icu.so.0.50100.0", added "/usr/lib/libharfbuzz-icu.so.0.50300.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-subset: FILELIST: removed "/usr/lib/libharfbuzz-subset.so.0.50100.0", added "/usr/lib/libharfbuzz-subset.so.0.50300.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz: FILELIST: removed "/usr/lib/libharfbuzz-gobject.so.0.50100.0 /usr/lib/libharfbuzz.so.0.50100.0", added "/usr/lib/libharfbuzz-gobject.so.0.50300.0 /usr/lib/libharfbuzz.so.0.50300.0"
Changes to packages/core2-32-poky-linux/harfbuzz (sysroot):
  /usr/lib/libharfbuzz-gobject.so.0 changed symlink target from libharfbuzz-gobject.so.0.50100.0 to libharfbuzz-gobject.so.0.50300.0
  /usr/lib/libharfbuzz-icu.so.0 changed symlink target from libharfbuzz-icu.so.0.50100.0 to libharfbuzz-icu.so.0.50300.0
  /usr/lib/libharfbuzz.so.0 changed symlink target from libharfbuzz.so.0.50100.0 to libharfbuzz.so.0.50300.0
  /usr/lib/libharfbuzz-subset.so.0 changed symlink target from libharfbuzz-subset.so.0.50100.0 to libharfbuzz-subset.so.0.50300.0
  /usr/lib/libharfbuzz-gobject.so.0.50100.0 moved to /usr/lib/libharfbuzz-gobject.so.0.50300.0
  /usr/lib/libharfbuzz-icu.so.0.50100.0 moved to /usr/lib/libharfbuzz-icu.so.0.50300.0
  /usr/lib/libharfbuzz.so.0.50100.0 moved to /usr/lib/libharfbuzz.so.0.50300.0
  /usr/lib/libharfbuzz-subset.so.0.50100.0 moved to /usr/lib/libharfbuzz-subset.so.0.50300.0

--===============7820965111258796369==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-harfbuzz-upgrade-5.1.0-5.3.0.patch"

RnJvbSAyMWIwYTZiNWFkYzJlNmNhODdhZjhjMWFlNGNjOWY5NjA4NmFkNGJhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMTU6MzE6MjUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBo
YXJmYnV6ejogdXBncmFkZSA1LjEuMCAtPiA1LjMuMAoKLS0tCiAuLi4wMDAxLWZpeC1zaWduZWRu
ZXNzLW9mLWNoYXItaW4tdGVzdHMucGF0Y2ggfCAyNyAtLS0tLS0tLS0tLS0tLS0tLS0tCiAuLi4v
e2hhcmZidXp6XzUuMS4wLmJiID0+IGhhcmZidXp6XzUuMy4wLmJifSAgfCAgNiArKy0tLQogMiBm
aWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMxIGRlbGV0aW9ucygtKQogZGVsZXRlIG1v
ZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1ncmFwaGljcy9oYXJmYnV6ei9oYXJmYnV6ei8wMDAxLWZp
eC1zaWduZWRuZXNzLW9mLWNoYXItaW4tdGVzdHMucGF0Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMt
Z3JhcGhpY3MvaGFyZmJ1enove2hhcmZidXp6XzUuMS4wLmJiID0+IGhhcmZidXp6XzUuMy4wLmJi
fSAoOTElKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9oYXJmYnV6ei9oYXJm
YnV6ei8wMDAxLWZpeC1zaWduZWRuZXNzLW9mLWNoYXItaW4tdGVzdHMucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MvaGFyZmJ1enovaGFyZmJ1enovMDAwMS1maXgtc2lnbmVkbmVzcy1vZi1j
aGFyLWluLXRlc3RzLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMjljYTJi
ZmZmLi4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9oYXJmYnV6ei9oYXJm
YnV6ei8wMDAxLWZpeC1zaWduZWRuZXNzLW9mLWNoYXItaW4tdGVzdHMucGF0Y2gKKysrIC9kZXYv
bnVsbApAQCAtMSwyNyArMCwwIEBACi1Gcm9tIDFiZDM4ODRiYzA1NDRmZmJiNjU0NWVkMjM5MWYw
OTMyYmI4ZDdkOTEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBwc3lrb3NlIDxhbGlj
ZUBheWF5YS5kZXY+Ci1EYXRlOiBNb24sIDEgQXVnIDIwMjIgMDc6NDU6MjUgKzAwMDAKLVN1Ympl
Y3Q6IFtQQVRDSF0gZml4IHNpZ25lZG5lc3Mgb2YgY2hhciBpbiB0ZXN0cwotCi1VcHN0cmVhbS1T
dGF0dXM6IEJhY2twb3J0Ci1TaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBs
aW51dHJvbml4LmRlPgotLS0tCi0gc3JjL3Rlc3QtcmVwYWNrZXIuY2MgfCA0ICsrLS0KLSAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQotCi1kaWZmIC0tZ2l0
IGEvc3JjL3Rlc3QtcmVwYWNrZXIuY2MgYi9zcmMvdGVzdC1yZXBhY2tlci5jYwotaW5kZXggMDUz
YzBjNi4uMWI3ZTFmMCAxMDA2NDQKLS0tLSBhL3NyYy90ZXN0LXJlcGFja2VyLmNjCi0rKysgYi9z
cmMvdGVzdC1yZXBhY2tlci5jYwotQEAgLTExMiw5ICsxMTIsOSBAQCBzdGF0aWMgdm9pZCBzdGFy
dF9sb29rdXAgKGludDhfdCB0eXBlLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgaGJfc2Vy
aWFsaXplX2NvbnRleHRfdCogYykKLSB7Ci0gICBjaGFyIGxvb2t1cFtdID0gewotLSAgICAwLCB0
eXBlLCAvLyB0eXBlCi0rICAgIDAsIChjaGFyKXR5cGUsIC8vIHR5cGUKLSAgICAgMCwgMCwgLy8g
ZmxhZwotLSAgICAwLCBudW1fc3VidGFibGVzLCAvLyBudW0gc3VidGFibGVzCi0rICAgIDAsIChj
aGFyKW51bV9zdWJ0YWJsZXMsIC8vIG51bSBzdWJ0YWJsZXMKLSAgIH07Ci0gCi0gICBzdGFydF9v
YmplY3QgKGxvb2t1cCwgNiwgYyk7CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
aGFyZmJ1enovaGFyZmJ1enpfNS4xLjAuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvaGFyZmJ1
enovaGFyZmJ1enpfNS4zLjAuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL2hhcmZidXp6L2hhcmZidXp6XzUuMS4wLmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvaGFyZmJ1enovaGFyZmJ1enpfNS4zLjAuYmIKaW5kZXggNDkw
NWU4ZTJhZC4uMWMyMTYxMGZiNSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2hh
cmZidXp6L2hhcmZidXp6XzUuMS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9oYXJm
YnV6ei9oYXJmYnV6el81LjMuMC5iYgpAQCAtOCwxMCArOCw4IEBAIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0NPUFlJTkc7bWQ1PTZlZTBmMTYyODE2OTRmYjZhYTY4OWNjYTFlMGZiM2RhIFwK
ICAgICAgICAgICAgICAgICAgICAgZmlsZTovL3NyYy9oYi11Y2QuY2M7YmVnaW5saW5lPTE7ZW5k
bGluZT0xNTttZDU9MjlkNGRjYjY0MTA0MjkxOTVkZjY3ZWZlMzM4MmQ4YmMgXAogICAgICAgICAg
ICAgICAgICAgICAiCiAKLVNSQ19VUkkgPSAiJHtHSVRIVUJfQkFTRV9VUkl9L2Rvd25sb2FkLyR7
UFZ9LyR7QlBOfS0ke1BWfS50YXIueHogXAotICAgICAgICAgICBmaWxlOi8vMDAwMS1maXgtc2ln
bmVkbmVzcy1vZi1jaGFyLWluLXRlc3RzLnBhdGNoIFwKLSAgICAgICAgICAgIgotU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjJlZGI5NWRiNjY4NzgxYWFhOGQ2MDk1OWQyMWJlMmZmODAwODVmMzFiMTIw
NTNjZGQ2NjBkOWE1MGNlODRmMDUiCitTUkNfVVJJID0gIiR7R0lUSFVCX0JBU0VfVVJJfS9kb3du
bG9hZC8ke1BWfS8ke0JQTn0tJHtQVn0udGFyLnh6IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImEw
NWUxOWUzZjUyZGEyNGVkMDcxNTIyZjBmZGRmODcyMTU3ZDdkMjVlODY5Y2ZkMTU2Y2Q2ZjFlODFj
NDIxNTIiCiAKIGluaGVyaXQgbWVzb24gcGtnY29uZmlnIGxpYl9wYWNrYWdlIGd0ay1kb2MgZ29i
amVjdC1pbnRyb3NwZWN0aW9uIGdpdGh1Yi1yZWxlYXNlcwogCi0tIAoyLjMxLjEKCg==

--===============7820965111258796369==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/harfbuzz/harfbuzz-bin: PV changed from "5.1.0" to "5.3.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-bin: PKGV changed from 5.1.0 [default] to 5.3.0 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-dbg: PV changed from "5.1.0" to "5.3.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-dbg: PKGSIZE changed from 47653208 to 45010072 (-6%)
packages/core2-32-poky-linux/harfbuzz/harfbuzz-dbg: FILELIST: removed "/usr/lib/.debug/libharfbuzz-gobject.so.0.50100.0 /usr/lib/.debug/libharfbuzz.so.0.50100.0 /usr/lib/.debug/libharfbuzz-icu.so.0.50100.0 /usr/lib/.debug/libharfbuzz-subset.so.0.50100.0", added "/usr/lib/.debug/libharfbuzz-icu.so.0.50300.0 /usr/lib/.debug/libharfbuzz-subset.so.0.50300.0 /usr/lib/.debug/libharfbuzz-gobject.so.0.50300.0 /usr/lib/.debug/libharfbuzz.so.0.50300.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-dbg: PKGV changed from 5.1.0 [default] to 5.3.0 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-dev: PV changed from "5.1.0" to "5.3.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-dev: PKGSIZE changed from 1460618 to 1466546 (+0%)
packages/core2-32-poky-linux/harfbuzz/harfbuzz-dev: PKGV changed from 5.1.0 [default] to 5.3.0 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-doc: PV changed from "5.1.0" to "5.3.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-doc: PKGV changed from 5.1.0 [default] to 5.3.0 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-icu-dev: PV changed from "5.1.0" to "5.3.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-icu-dev: PKGV changed from 5.1.0 [default] to 5.3.0 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-icu: PV changed from "5.1.0" to "5.3.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-icu: FILELIST: removed "/usr/lib/libharfbuzz-icu.so.0.50100.0", added "/usr/lib/libharfbuzz-icu.so.0.50300.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-icu: PKGV changed from 5.1.0 [default] to 5.3.0 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-locale: PV changed from "5.1.0" to "5.3.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-locale: PKGV changed from 5.1.0 [default] to 5.3.0 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-src: PV changed from "5.1.0" to "5.3.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-src: PKGSIZE changed from 4032472 to 4138944 (+3%)
packages/core2-32-poky-linux/harfbuzz/harfbuzz-src: FILELIST: directory renamed /usr/src/debug/harfbuzz/5.1.0-r0/util -> /usr/src/debug/harfbuzz/5.3.0-r0/util, directory renamed /usr/src/debug/harfbuzz/5.1.0-r0/src/OT/Layout/GPOS -> /usr/src/debug/harfbuzz/5.3.0-r0/src/OT/Layout/GPOS, directory renamed /usr/src/debug/harfbuzz/5.1.0-r0/src/OT/Layout/Common -> /usr/src/debug/harfbuzz/5.3.0-r0/src/OT/Layout/Common, directory renamed /usr/src/debug/harfbuzz/5.1.0-r0/src/OT/Layout -> /usr/src/debug/harfbuzz/5.3.0-r0/src/OT/Layout, directory renamed /usr/src/debug/harfbuzz/5.1.0-r0/src/OT/glyf -> /usr/src/debug/harfbuzz/5.3.0-r0/src/OT/glyf, directory renamed /usr/src/debug/harfbuzz/5.1.0-r0/src/OT/Layout/GSUB -> /usr/src/debug/harfbuzz/5.3.0-r0/src/OT/Layout/GSUB, directory renamed /usr/src/debug/harfbuzz/5.1.0-r0/src -> /usr/src/debug/harfbuzz/5.3.0-r0/src, removed "/usr/src/debug/harfbuzz/5.1.0-r0/src/graph/gsubgpos-graph.hh /usr/src/debug/harfbuzz/5.1.0-r0/src/graph/pairpos-graph.hh /u
 sr/src/debug/harfbuzz/5.1.0-r0/src/graph/coverage-graph.hh /usr/src/debug/harfbuzz/5.1.0-r0/src/graph/graph.hh /usr/src/debug/harfbuzz/5.1.0-r0/src/graph/gsubgpos-context.hh /usr/src/debug/harfbuzz/5.1.0-r0/src/graph/gsubgpos-context.cc /usr/src/debug/harfbuzz/5.1.0-r0/src/graph/serialize.hh", added "/usr/src/debug/harfbuzz/5.3.0-r0/src/graph/markbasepos-graph.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/graph/gsubgpos-graph.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/graph/split-helpers.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/graph/graph.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/graph/gsubgpos-context.cc /usr/src/debug/harfbuzz/5.3.0-r0/src/graph/classdef-graph.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/graph/gsubgpos-context.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/graph/pairpos-graph.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/graph/serialize.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/graph/coverage-graph.hh"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-src: PKGV changed from 5.1.0 [default] to 5.3.0 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-staticdev: PV changed from "5.1.0" to "5.3.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-staticdev: PKGV changed from 5.1.0 [default] to 5.3.0 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-subset: PV changed from "5.1.0" to "5.3.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-subset: PKGSIZE changed from 1304107 to 1209899 (-7%)
packages/core2-32-poky-linux/harfbuzz/harfbuzz-subset: FILELIST: removed "/usr/lib/libharfbuzz-subset.so.0.50100.0", added "/usr/lib/libharfbuzz-subset.so.0.50300.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-subset: PKGV changed from 5.1.0 [default] to 5.3.0 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz: PV changed from "5.1.0" to "5.3.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz: PKGSIZE changed from 1509640 to 1411772 (-6%)
packages/core2-32-poky-linux/harfbuzz/harfbuzz: FILELIST: removed "/usr/lib/libharfbuzz-gobject.so.0.50100.0 /usr/lib/libharfbuzz.so.0.50100.0", added "/usr/lib/libharfbuzz-gobject.so.0.50300.0 /usr/lib/libharfbuzz.so.0.50300.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz: PKGV changed from 5.1.0 [default] to 5.3.0 [default]
packages/core2-32-poky-linux/harfbuzz: SRC_URI changed from "https://github.com/harfbuzz/harfbuzz/releases//download/5.1.0/harfbuzz-5.1.0.tar.xz file://0001-fix-signedness-of-char-in-tests.patch" to "https://github.com/harfbuzz/harfbuzz/releases//download/5.3.0/harfbuzz-5.3.0.tar.xz"
packages/core2-32-poky-linux/harfbuzz: PV changed from "5.1.0" to "5.3.0"
packages/core2-32-poky-linux/harfbuzz: PKGV changed from 5.1.0 [default] to 5.3.0 [default]
Changes to packages/core2-32-poky-linux/harfbuzz (sysroot):
  /usr/lib/libharfbuzz-gobject.so.0 changed symlink target from libharfbuzz-gobject.so.0.50100.0 to libharfbuzz-gobject.so.0.50300.0
  /usr/lib/libharfbuzz-icu.so.0 changed symlink target from libharfbuzz-icu.so.0.50100.0 to libharfbuzz-icu.so.0.50300.0
  /usr/lib/libharfbuzz.so.0 changed symlink target from libharfbuzz.so.0.50100.0 to libharfbuzz.so.0.50300.0
  /usr/lib/libharfbuzz-subset.so.0 changed symlink target from libharfbuzz-subset.so.0.50100.0 to libharfbuzz-subset.so.0.50300.0
  /usr/lib/libharfbuzz-gobject.so.0.50100.0 moved to /usr/lib/libharfbuzz-gobject.so.0.50300.0
  /usr/lib/libharfbuzz-icu.so.0.50100.0 moved to /usr/lib/libharfbuzz-icu.so.0.50300.0
  /usr/lib/libharfbuzz.so.0.50100.0 moved to /usr/lib/libharfbuzz.so.0.50300.0
  /usr/lib/libharfbuzz-subset.so.0.50100.0 moved to /usr/lib/libharfbuzz-subset.so.0.50300.0

--===============7820965111258796369==--

