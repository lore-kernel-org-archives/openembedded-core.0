Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F3BEC38A2B
	for <webhook@archiver.kernel.org>; Sat,  1 Oct 2022 16:54:14 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web12.424.1664643228665366096
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Oct 2022 09:53:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=fdBy3ahz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 010101839477e182-1eaa5063-7943-485c-8b9a-090beac8e9e3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1664643228;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KykOFagaOXFC8zMRNRWY5aAbmq0c/INxyeiATOR88z0=;
	b=fdBy3ahz9bwfVShX+ktz72okGvSLni7J7aNOZL80QZD6IMUk2CjwA72u9CGgUuZ+
	b86NBXixh6Tiy2HxW4PWBHI0ScXJumtexr2Jwi5jTrtqA56MlRqdBVIyM8BQZrodjUv
	2EOQvMyaUBIQrIpfl7PAL8NocmrgFpAlgLjONMCo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1664643228;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KykOFagaOXFC8zMRNRWY5aAbmq0c/INxyeiATOR88z0=;
	b=VwwdkQgFtXQy3bGG1+d+7RyJGkgTN3RUM01oPdz2HyMkWinNCAe3GqDNG5KLEnt0
	oONvLBH7ZJU++yC0adZcGSGIu4qMxEIdRHkxkfbpKNV76paPqRZezpOV9BW208eOmNP
	NJv5KZJG7xDPcKIPubi1et2Ak9Umj2stxgiNXyM8=
Content-Type: multipart/mixed; boundary="===============1621091388505580340=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] harfbuzz: upgrading to 5.2.0 SUCCEEDED
Message-ID: 
 <010101839477e182-1eaa5063-7943-485c-8b9a-090beac8e9e3-000000@us-west-2.amazonses.com>
Date: Sat, 1 Oct 2022 16:53:48 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Oct 2022 16:54:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171296

--===============1621091388505580340==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *harfbuzz* to *5.2.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-harfbuzz-upgrade-5.1.0-5.2.0.patch
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
--===============1621091388505580340==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/harfbuzz/harfbuzz-icu: FILELIST: removed "/usr/lib/libharfbuzz-icu.so.0.50100.0", added "/usr/lib/libharfbuzz-icu.so.0.50200.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-subset: FILELIST: removed "/usr/lib/libharfbuzz-subset.so.0.50100.0", added "/usr/lib/libharfbuzz-subset.so.0.50200.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz: FILELIST: removed "/usr/lib/libharfbuzz.so.0.50100.0 /usr/lib/libharfbuzz-gobject.so.0.50100.0", added "/usr/lib/libharfbuzz-gobject.so.0.50200.0 /usr/lib/libharfbuzz.so.0.50200.0"
Changes to packages/core2-32-poky-linux/harfbuzz (sysroot):
  /usr/lib/libharfbuzz-gobject.so.0 changed symlink target from libharfbuzz-gobject.so.0.50100.0 to libharfbuzz-gobject.so.0.50200.0
  /usr/lib/libharfbuzz-icu.so.0 changed symlink target from libharfbuzz-icu.so.0.50100.0 to libharfbuzz-icu.so.0.50200.0
  /usr/lib/libharfbuzz.so.0 changed symlink target from libharfbuzz.so.0.50100.0 to libharfbuzz.so.0.50200.0
  /usr/lib/libharfbuzz-subset.so.0 changed symlink target from libharfbuzz-subset.so.0.50100.0 to libharfbuzz-subset.so.0.50200.0
  /usr/lib/libharfbuzz-gobject.so.0.50100.0 moved to /usr/lib/libharfbuzz-gobject.so.0.50200.0
  /usr/lib/libharfbuzz-icu.so.0.50100.0 moved to /usr/lib/libharfbuzz-icu.so.0.50200.0
  /usr/lib/libharfbuzz.so.0.50100.0 moved to /usr/lib/libharfbuzz.so.0.50200.0
  /usr/lib/libharfbuzz-subset.so.0.50100.0 moved to /usr/lib/libharfbuzz-subset.so.0.50200.0

--===============1621091388505580340==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-harfbuzz-upgrade-5.1.0-5.2.0.patch"

RnJvbSA2MjBiOGY1MDk5YjJjNzhlNjc2NzBlOTE1MDVlMzIyMjgyMGY1YzQxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBPY3QgMjAyMiAxMjo1MjozOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGhh
cmZidXp6OiB1cGdyYWRlIDUuMS4wIC0+IDUuMi4wCgotLS0KIC4uLjAwMDEtZml4LXNpZ25lZG5l
c3Mtb2YtY2hhci1pbi10ZXN0cy5wYXRjaCB8IDI3IC0tLS0tLS0tLS0tLS0tLS0tLS0KIC4uLi97
aGFyZmJ1enpfNS4xLjAuYmIgPT4gaGFyZmJ1enpfNS4yLjAuYmJ9ICB8ICA2ICsrLS0tCiAyIGZp
bGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMzEgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9k
ZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2hhcmZidXp6L2hhcmZidXp6LzAwMDEtZml4
LXNpZ25lZG5lc3Mtb2YtY2hhci1pbi10ZXN0cy5wYXRjaAogcmVuYW1lIG1ldGEvcmVjaXBlcy1n
cmFwaGljcy9oYXJmYnV6ei97aGFyZmJ1enpfNS4xLjAuYmIgPT4gaGFyZmJ1enpfNS4yLjAuYmJ9
ICg5MSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2hhcmZidXp6L2hhcmZi
dXp6LzAwMDEtZml4LXNpZ25lZG5lc3Mtb2YtY2hhci1pbi10ZXN0cy5wYXRjaCBiL21ldGEvcmVj
aXBlcy1ncmFwaGljcy9oYXJmYnV6ei9oYXJmYnV6ei8wMDAxLWZpeC1zaWduZWRuZXNzLW9mLWNo
YXItaW4tdGVzdHMucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAyOWNhMmJm
ZmYuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2hhcmZidXp6L2hhcmZi
dXp6LzAwMDEtZml4LXNpZ25lZG5lc3Mtb2YtY2hhci1pbi10ZXN0cy5wYXRjaAorKysgL2Rldi9u
dWxsCkBAIC0xLDI3ICswLDAgQEAKLUZyb20gMWJkMzg4NGJjMDU0NGZmYmI2NTQ1ZWQyMzkxZjA5
MzJiYjhkN2Q5MSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IHBzeWtvc2UgPGFsaWNl
QGF5YXlhLmRldj4KLURhdGU6IE1vbiwgMSBBdWcgMjAyMiAwNzo0NToyNSArMDAwMAotU3ViamVj
dDogW1BBVENIXSBmaXggc2lnbmVkbmVzcyBvZiBjaGFyIGluIHRlc3RzCi0KLVVwc3RyZWFtLVN0
YXR1czogQmFja3BvcnQKLVNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxp
bnV0cm9uaXguZGU+Ci0tLS0KLSBzcmMvdGVzdC1yZXBhY2tlci5jYyB8IDQgKystLQotIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCi0KLWRpZmYgLS1naXQg
YS9zcmMvdGVzdC1yZXBhY2tlci5jYyBiL3NyYy90ZXN0LXJlcGFja2VyLmNjCi1pbmRleCAwNTNj
MGM2Li4xYjdlMWYwIDEwMDY0NAotLS0tIGEvc3JjL3Rlc3QtcmVwYWNrZXIuY2MKLSsrKyBiL3Ny
Yy90ZXN0LXJlcGFja2VyLmNjCi1AQCAtMTEyLDkgKzExMiw5IEBAIHN0YXRpYyB2b2lkIHN0YXJ0
X2xvb2t1cCAoaW50OF90IHR5cGUsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICBoYl9zZXJp
YWxpemVfY29udGV4dF90KiBjKQotIHsKLSAgIGNoYXIgbG9va3VwW10gPSB7Ci0tICAgIDAsIHR5
cGUsIC8vIHR5cGUKLSsgICAgMCwgKGNoYXIpdHlwZSwgLy8gdHlwZQotICAgICAwLCAwLCAvLyBm
bGFnCi0tICAgIDAsIG51bV9zdWJ0YWJsZXMsIC8vIG51bSBzdWJ0YWJsZXMKLSsgICAgMCwgKGNo
YXIpbnVtX3N1YnRhYmxlcywgLy8gbnVtIHN1YnRhYmxlcwotICAgfTsKLSAKLSAgIHN0YXJ0X29i
amVjdCAobG9va3VwLCA2LCBjKTsKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9o
YXJmYnV6ei9oYXJmYnV6el81LjEuMC5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9oYXJmYnV6
ei9oYXJmYnV6el81LjIuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDkxJQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvaGFyZmJ1enovaGFyZmJ1enpfNS4xLjAuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1ncmFwaGljcy9oYXJmYnV6ei9oYXJmYnV6el81LjIuMC5iYgppbmRleCA0OTA1
ZThlMmFkLi5hOTUzNWMzMmVlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvaGFy
ZmJ1enovaGFyZmJ1enpfNS4xLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2hhcmZi
dXp6L2hhcmZidXp6XzUuMi4wLmJiCkBAIC04LDEwICs4LDggQEAgTElDX0ZJTEVTX0NIS1NVTSA9
ICJmaWxlOi8vQ09QWUlORzttZDU9NmVlMGYxNjI4MTY5NGZiNmFhNjg5Y2NhMWUwZmIzZGEgXAog
ICAgICAgICAgICAgICAgICAgICBmaWxlOi8vc3JjL2hiLXVjZC5jYztiZWdpbmxpbmU9MTtlbmRs
aW5lPTE1O21kNT0yOWQ0ZGNiNjQxMDQyOTE5NWRmNjdlZmUzMzgyZDhiYyBcCiAgICAgICAgICAg
ICAgICAgICAgICIKIAotU1JDX1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvJHtQ
Vn0vJHtCUE59LSR7UFZ9LnRhci54eiBcCi0gICAgICAgICAgIGZpbGU6Ly8wMDAxLWZpeC1zaWdu
ZWRuZXNzLW9mLWNoYXItaW4tdGVzdHMucGF0Y2ggXAotICAgICAgICAgICAiCi1TUkNfVVJJW3No
YTI1NnN1bV0gPSAiMmVkYjk1ZGI2Njg3ODFhYWE4ZDYwOTU5ZDIxYmUyZmY4MDA4NWYzMWIxMjA1
M2NkZDY2MGQ5YTUwY2U4NGYwNSIKK1NSQ19VUkkgPSAiJHtHSVRIVUJfQkFTRV9VUkl9L2Rvd25s
b2FkLyR7UFZ9LyR7QlBOfS0ke1BWfS50YXIueHoiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNzM1
YTk0OTE3YjQ3OTM2NTc1YWNiNGQ0ZmE3ZTc5ODY1MjJmOGE4OTUyN2U0NjM1NzIxNDc0ZGVlMmJj
OTQyYyIKIAogaW5oZXJpdCBtZXNvbiBwa2djb25maWcgbGliX3BhY2thZ2UgZ3RrLWRvYyBnb2Jq
ZWN0LWludHJvc3BlY3Rpb24gZ2l0aHViLXJlbGVhc2VzCiAKLS0gCjIuMzEuMQoK

--===============1621091388505580340==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/harfbuzz/harfbuzz-bin: PKGV changed from 5.1.0 [default] to 5.2.0 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-bin: PV changed from "5.1.0" to "5.2.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-dbg: PKGV changed from 5.1.0 [default] to 5.2.0 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-dbg: PKGSIZE changed from 47653208 to 43762432 (-8%)
packages/core2-32-poky-linux/harfbuzz/harfbuzz-dbg: FILELIST: removed "/usr/lib/.debug/libharfbuzz-gobject.so.0.50100.0 /usr/lib/.debug/libharfbuzz.so.0.50100.0 /usr/lib/.debug/libharfbuzz-icu.so.0.50100.0 /usr/lib/.debug/libharfbuzz-subset.so.0.50100.0", added "/usr/lib/.debug/libharfbuzz-subset.so.0.50200.0 /usr/lib/.debug/libharfbuzz-gobject.so.0.50200.0 /usr/lib/.debug/libharfbuzz.so.0.50200.0 /usr/lib/.debug/libharfbuzz-icu.so.0.50200.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-dbg: PV changed from "5.1.0" to "5.2.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-dev: PKGV changed from 5.1.0 [default] to 5.2.0 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-dev: PKGSIZE changed from 1460618 to 1462961 (+0%)
packages/core2-32-poky-linux/harfbuzz/harfbuzz-dev: PV changed from "5.1.0" to "5.2.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-doc: PKGV changed from 5.1.0 [default] to 5.2.0 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-doc: PV changed from "5.1.0" to "5.2.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-icu-dev: PKGV changed from 5.1.0 [default] to 5.2.0 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-icu-dev: PV changed from "5.1.0" to "5.2.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-icu: PKGV changed from 5.1.0 [default] to 5.2.0 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-icu: FILELIST: removed "/usr/lib/libharfbuzz-icu.so.0.50100.0", added "/usr/lib/libharfbuzz-icu.so.0.50200.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-icu: PV changed from "5.1.0" to "5.2.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-locale: PKGV changed from 5.1.0 [default] to 5.2.0 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-locale: PV changed from "5.1.0" to "5.2.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-src: PKGV changed from 5.1.0 [default] to 5.2.0 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-src: PKGSIZE changed from 4032472 to 4114641 (+2%)
packages/core2-32-poky-linux/harfbuzz/harfbuzz-src: FILELIST: directory renamed /usr/src/debug/harfbuzz/5.1.0-r0/src/OT/Layout -> /usr/src/debug/harfbuzz/5.2.0-r0/src/OT/Layout, directory renamed /usr/src/debug/harfbuzz/5.1.0-r0/src -> /usr/src/debug/harfbuzz/5.2.0-r0/src, directory renamed /usr/src/debug/harfbuzz/5.1.0-r0/src/OT/Layout/GPOS -> /usr/src/debug/harfbuzz/5.2.0-r0/src/OT/Layout/GPOS, directory renamed /usr/src/debug/harfbuzz/5.1.0-r0/util -> /usr/src/debug/harfbuzz/5.2.0-r0/util, directory renamed /usr/src/debug/harfbuzz/5.1.0-r0/src/OT/Layout/Common -> /usr/src/debug/harfbuzz/5.2.0-r0/src/OT/Layout/Common, directory renamed /usr/src/debug/harfbuzz/5.1.0-r0/src/OT/Layout/GSUB -> /usr/src/debug/harfbuzz/5.2.0-r0/src/OT/Layout/GSUB, directory renamed /usr/src/debug/harfbuzz/5.1.0-r0/src/OT/glyf -> /usr/src/debug/harfbuzz/5.2.0-r0/src/OT/glyf, removed "/usr/src/debug/harfbuzz/5.1.0-r0/src/graph/graph.hh /usr/src/debug/harfbuzz/5.1.0-r0/src/graph/serialize.hh /usr/src/debug/
 harfbuzz/5.1.0-r0/src/graph/gsubgpos-graph.hh /usr/src/debug/harfbuzz/5.1.0-r0/src/graph/gsubgpos-context.cc /usr/src/debug/harfbuzz/5.1.0-r0/src/graph/pairpos-graph.hh /usr/src/debug/harfbuzz/5.1.0-r0/src/graph/coverage-graph.hh /usr/src/debug/harfbuzz/5.1.0-r0/src/graph/gsubgpos-context.hh", added "/usr/src/debug/harfbuzz/5.2.0-r0/src/graph/gsubgpos-graph.hh /usr/src/debug/harfbuzz/5.2.0-r0/src/graph/split-helpers.hh /usr/src/debug/harfbuzz/5.2.0-r0/src/graph/coverage-graph.hh /usr/src/debug/harfbuzz/5.2.0-r0/src/graph/classdef-graph.hh /usr/src/debug/harfbuzz/5.2.0-r0/src/graph/pairpos-graph.hh /usr/src/debug/harfbuzz/5.2.0-r0/src/graph/gsubgpos-context.hh /usr/src/debug/harfbuzz/5.2.0-r0/src/graph/gsubgpos-context.cc /usr/src/debug/harfbuzz/5.2.0-r0/src/graph/markbasepos-graph.hh /usr/src/debug/harfbuzz/5.2.0-r0/src/graph/graph.hh /usr/src/debug/harfbuzz/5.2.0-r0/src/graph/serialize.hh"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-src: PV changed from "5.1.0" to "5.2.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-staticdev: PKGV changed from 5.1.0 [default] to 5.2.0 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-staticdev: PV changed from "5.1.0" to "5.2.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-subset: PKGV changed from 5.1.0 [default] to 5.2.0 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-subset: PKGSIZE changed from 1304107 to 1197611 (-8%)
packages/core2-32-poky-linux/harfbuzz/harfbuzz-subset: FILELIST: removed "/usr/lib/libharfbuzz-subset.so.0.50100.0", added "/usr/lib/libharfbuzz-subset.so.0.50200.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-subset: PV changed from "5.1.0" to "5.2.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz: PKGV changed from 5.1.0 [default] to 5.2.0 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz: PKGSIZE changed from 1509640 to 1407356 (-7%)
packages/core2-32-poky-linux/harfbuzz/harfbuzz: FILELIST: removed "/usr/lib/libharfbuzz-gobject.so.0.50100.0 /usr/lib/libharfbuzz.so.0.50100.0", added "/usr/lib/libharfbuzz-gobject.so.0.50200.0 /usr/lib/libharfbuzz.so.0.50200.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz: PV changed from "5.1.0" to "5.2.0"
packages/core2-32-poky-linux/harfbuzz: PKGV changed from 5.1.0 [default] to 5.2.0 [default]
packages/core2-32-poky-linux/harfbuzz: SRC_URI changed from "https://github.com/harfbuzz/harfbuzz/releases//download/5.1.0/harfbuzz-5.1.0.tar.xz file://0001-fix-signedness-of-char-in-tests.patch" to "https://github.com/harfbuzz/harfbuzz/releases//download/5.2.0/harfbuzz-5.2.0.tar.xz"
packages/core2-32-poky-linux/harfbuzz: PV changed from "5.1.0" to "5.2.0"
Changes to packages/core2-32-poky-linux/harfbuzz (sysroot):
  /usr/lib/libharfbuzz-gobject.so.0 changed symlink target from libharfbuzz-gobject.so.0.50100.0 to libharfbuzz-gobject.so.0.50200.0
  /usr/lib/libharfbuzz-icu.so.0 changed symlink target from libharfbuzz-icu.so.0.50100.0 to libharfbuzz-icu.so.0.50200.0
  /usr/lib/libharfbuzz.so.0 changed symlink target from libharfbuzz.so.0.50100.0 to libharfbuzz.so.0.50200.0
  /usr/lib/libharfbuzz-subset.so.0 changed symlink target from libharfbuzz-subset.so.0.50100.0 to libharfbuzz-subset.so.0.50200.0
  /usr/lib/libharfbuzz-gobject.so.0.50100.0 moved to /usr/lib/libharfbuzz-gobject.so.0.50200.0
  /usr/lib/libharfbuzz-icu.so.0.50100.0 moved to /usr/lib/libharfbuzz-icu.so.0.50200.0
  /usr/lib/libharfbuzz.so.0.50100.0 moved to /usr/lib/libharfbuzz.so.0.50200.0
  /usr/lib/libharfbuzz-subset.so.0.50100.0 moved to /usr/lib/libharfbuzz-subset.so.0.50200.0

--===============1621091388505580340==--

