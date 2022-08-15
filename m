Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 557F5C00140
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 18:57:02 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com
 (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web09.6460.1660589819622344365
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 11:56:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=JqGnywU7;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191,
 mailfrom: 01010182a2ddc229-87933a77-51d9-4ee5-a1f7-f1857733ab94-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1660589818;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=B1SZmfU9iGOLGz3XCLQsNDv9t23Jj/vEie4wGkYJzxU=;
	b=JqGnywU78UEGnYS2uI11cuUrLsrEakGSU5R2xNy/saezjSrVr3zOREb/3955QiyL
	QfVRocoB1CSfYcNs+5qXfN1KJPdC4FqHyt+kdXoifeLP86BgHWRZaSVKjhK0NwJpCxp
	TQGSnUKFrdT/gvGfuu51rNtGjgzr5DfvOgZRoUgw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1660589818;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=B1SZmfU9iGOLGz3XCLQsNDv9t23Jj/vEie4wGkYJzxU=;
	b=beD8kRVfhpe4RNDr3Uf57opJNOHmFsJsgt4RE7bUzd0nt+SXg/jtT9FplwBEjq51
	M+KS1KVKWRSxfJZ2fP/OCCXez8/7XnpaLy2hqWXojlb+RuAibNG+hv6+GkJ0GtdrWG2
	H4SA1JWLduCRN+bueDufIlKW3GIRbb+OTle56cwc=
Content-Type: multipart/mixed; boundary="===============8120456758819684153=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gnu-efi: upgrading to 3.0.15 SUCCEEDED
Message-ID: 
 <01010182a2ddc229-87933a77-51d9-4ee5-a1f7-f1857733ab94-000000@us-west-2.amazonses.com>
Date: Mon, 15 Aug 2022 18:56:58 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Aug 2022 18:57:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169361

--===============8120456758819684153==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gnu-efi* to *3.0.15* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gnu-efi-upgrade-3.0.14-3.0.15.patch
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
--===============8120456758819684153==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gnu-efi/gnu-efi-dbg: PV changed from "3.0.14" to "3.0.15"
packages/core2-32-poky-linux/gnu-efi/gnu-efi-dbg: PKGV changed from 3.0.14 [default] to 3.0.15 [default]
packages/core2-32-poky-linux/gnu-efi/gnu-efi-dev: PKGSIZE changed from 378908 to 379027 (+0%)
packages/core2-32-poky-linux/gnu-efi/gnu-efi-dev: PV changed from "3.0.14" to "3.0.15"
packages/core2-32-poky-linux/gnu-efi/gnu-efi-dev: PKGV changed from 3.0.14 [default] to 3.0.15 [default]
packages/core2-32-poky-linux/gnu-efi/gnu-efi-doc: PV changed from "3.0.14" to "3.0.15"
packages/core2-32-poky-linux/gnu-efi/gnu-efi-doc: PKGV changed from 3.0.14 [default] to 3.0.15 [default]
packages/core2-32-poky-linux/gnu-efi/gnu-efi-locale: PV changed from "3.0.14" to "3.0.15"
packages/core2-32-poky-linux/gnu-efi/gnu-efi-locale: PKGV changed from 3.0.14 [default] to 3.0.15 [default]
packages/core2-32-poky-linux/gnu-efi/gnu-efi-src: PKGSIZE changed from 357126 to 357258 (+0%)
packages/core2-32-poky-linux/gnu-efi/gnu-efi-src: PV changed from "3.0.14" to "3.0.15"
packages/core2-32-poky-linux/gnu-efi/gnu-efi-src: PKGV changed from 3.0.14 [default] to 3.0.15 [default]
packages/core2-32-poky-linux/gnu-efi/gnu-efi-staticdev: PKGSIZE changed from 358016 to 358044 (+0%)
packages/core2-32-poky-linux/gnu-efi/gnu-efi-staticdev: PV changed from "3.0.14" to "3.0.15"
packages/core2-32-poky-linux/gnu-efi/gnu-efi-staticdev: PKGV changed from 3.0.14 [default] to 3.0.15 [default]
packages/core2-32-poky-linux/gnu-efi/gnu-efi: PV changed from "3.0.14" to "3.0.15"
packages/core2-32-poky-linux/gnu-efi/gnu-efi: PKGV changed from 3.0.14 [default] to 3.0.15 [default]
packages/core2-32-poky-linux/gnu-efi: SRC_URI changed from "https://downloads.sourceforge.net/gnu-efi/files/gnu-efi-3.0.14.tar.bz2 file://parallel-make-archives.patch file://lib-Makefile-fix-parallel-issue.patch file://gnu-efi-3.0.9-fix-clang-build.patch" to "https://downloads.sourceforge.net/gnu-efi/files/gnu-efi-3.0.15.tar.bz2 file://parallel-make-archives.patch file://gnu-efi-3.0.9-fix-clang-build.patch"
packages/core2-32-poky-linux/gnu-efi: PV changed from "3.0.14" to "3.0.15"
packages/core2-32-poky-linux/gnu-efi: PKGV changed from 3.0.14 [default] to 3.0.15 [default]

--===============8120456758819684153==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (0 cached, 884 parsed). 1658 targets, 63 skipped, 0 masked, 0 errors.

Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: Nothing PROVIDES 'gnu-efi'
gnu-efi was skipped: incompatible with host mips-poky-linux (not in COMPATIBLE_HOST)

--===============8120456758819684153==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gnu-efi-upgrade-3.0.14-3.0.15.patch"

RnJvbSBmOTE5ZjdkNDhlMzNkY2ZjYTZiNTg2NGY4OTEzMTFmNTg4NGQ5ODE4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXVnIDIwMjIgMDU6NTA6MjggKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
bnUtZWZpOiB1cGdyYWRlIDMuMC4xNCAtPiAzLjAuMTUKCi0tLQogLi4uL2xpYi1NYWtlZmlsZS1m
aXgtcGFyYWxsZWwtaXNzdWUucGF0Y2ggICAgIHwgMzggLS0tLS0tLS0tLS0tLS0tLS0tLQogLi4u
L2dudS1lZmkvcGFyYWxsZWwtbWFrZS1hcmNoaXZlcy5wYXRjaCAgICAgIHwgMTcgKysrKystLS0t
CiAuLi4ve2dudS1lZmlfMy4wLjE0LmJiID0+IGdudS1lZmlfMy4wLjE1LmJifSAgfCAgMyArLQog
MyBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA0OCBkZWxldGlvbnMoLSkKIGRlbGV0
ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtYnNwL2dudS1lZmkvZ251LWVmaS9saWItTWFrZWZp
bGUtZml4LXBhcmFsbGVsLWlzc3VlLnBhdGNoCiByZW5hbWUgbWV0YS9yZWNpcGVzLWJzcC9nbnUt
ZWZpL3tnbnUtZWZpXzMuMC4xNC5iYiA9PiBnbnUtZWZpXzMuMC4xNS5iYn0gKDk0JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtYnNwL2dudS1lZmkvZ251LWVmaS9saWItTWFrZWZpbGUtZml4
LXBhcmFsbGVsLWlzc3VlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWJzcC9nbnUtZWZpL2dudS1lZmkv
bGliLU1ha2VmaWxlLWZpeC1wYXJhbGxlbC1pc3N1ZS5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAx
MDA2NDQKaW5kZXggZGMwMGI4ZmE0ZC4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtYnNw
L2dudS1lZmkvZ251LWVmaS9saWItTWFrZWZpbGUtZml4LXBhcmFsbGVsLWlzc3VlLnBhdGNoCisr
KyAvZGV2L251bGwKQEAgLTEsMzggKzAsMCBAQAotRnJvbSAzZWM4YzJhNzAzMDRlYWJkNTc2MDkz
N2E0ZWMzZmJjNDA2OGE3N2VkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogUm9iZXJ0
IFlhbmcgPGxpZXpoaS55YW5nQHdpbmRyaXZlci5jb20+Ci1EYXRlOiBUaHUsIDIzIEFwciAyMDE1
IDAxOjQ5OjMxIC0wNzAwCi1TdWJqZWN0OiBbUEFUQ0ggMi8zXSBsaWIvTWFrZWZpbGU6IGZpeCBw
YXJhbGxlbCBpc3N1ZQotCi1GaXhlZDoKLUFzc2VtYmxlciBtZXNzYWdlczoKLUZhdGFsIGVycm9y
OiBjYW4ndCBjcmVhdGUgcnVudGltZS9ydGxvY2subzogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9y
eQotQXNzZW1ibGVyIG1lc3NhZ2VzOgotRmF0YWwgZXJyb3I6IGNhbid0IGNyZWF0ZSBydW50aW1l
L3J0ZGF0YS5vOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5Ci1Bc3NlbWJsZXIgbWVzc2FnZXM6
Ci1GYXRhbCBlcnJvcjogY2FuJ3QgY3JlYXRlIHJ1bnRpbWUvdm0ubzogTm8gc3VjaCBmaWxlIG9y
IGRpcmVjdG9yeQotQXNzZW1ibGVyIG1lc3NhZ2VzOgotRmF0YWwgZXJyb3I6IGNhbid0IGNyZWF0
ZSBydW50aW1lL2VmaXJ0bGliLm86IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKLQotVXBzdHJl
YW0tU3RhdHVzOiBQZW5kaW5nCi0KLVNpZ25lZC1vZmYtYnk6IFJvYmVydCBZYW5nIDxsaWV6aGku
eWFuZ0B3aW5kcml2ZXIuY29tPgotLS0tCi0gbGliL01ha2VmaWxlIHwgMiArKwotIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKykKLQotZGlmZiAtLWdpdCBhL2xpYi9NYWtlZmlsZSBiL2xp
Yi9NYWtlZmlsZQotaW5kZXggMDQ4NzUxYS4uZWQzOWJiYiAxMDA2NDQKLS0tLSBhL2xpYi9NYWtl
ZmlsZQotKysrIGIvbGliL01ha2VmaWxlCi1AQCAtNzQsNiArNzQsOCBAQCBhbGw6IGxpYnN1YmRp
cnMgbGliZWZpLmEKLSBsaWJzdWJkaXJzOgotIAlmb3Igc2RpciBpbiAkKFNVQkRJUlMpOyBkbyBt
a2RpciAtcCAkJHNkaXI7IGRvbmUKLSAKLSskKE9CSlMpOiBsaWJzdWJkaXJzCi0rCi0gbGliZWZp
LmE6ICQoT0JKUykKLSAJJChBUikgJChBUkZMQUdTKSAkQCAkKE9CSlMpCi0gCi0tLSAKLTIuNy40
Ci0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ic3AvZ251LWVmaS9nbnUtZWZpL3BhcmFsbGVs
LW1ha2UtYXJjaGl2ZXMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtYnNwL2dudS1lZmkvZ251LWVmaS9w
YXJhbGxlbC1tYWtlLWFyY2hpdmVzLnBhdGNoCmluZGV4IDhhMDEzOGJiZTUuLjYzZDliNmZjMzEg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ic3AvZ251LWVmaS9nbnUtZWZpL3BhcmFsbGVsLW1h
a2UtYXJjaGl2ZXMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWJzcC9nbnUtZWZpL2dudS1lZmkv
cGFyYWxsZWwtbWFrZS1hcmNoaXZlcy5wYXRjaApAQCAtMSw3ICsxLDcgQEAKLUZyb20gNDhiMmNk
YmNkNzYxMTA1ZThlYmFkNDEyZmNiZjIzZGIxYWM0ZWY3YyBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gZjU2ZGRiMDBhNjU2YWYyZTg0ZjgzOTczOGZhZDE5OTA5YWM2NTA0NyBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFNhdWwgV29sZCA8c2d3QGxpbnV4LmludGVsLmNvbT4K
IERhdGU6IFN1biwgOSBNYXIgMjAxNCAxNToyMjoxNSArMDIwMAotU3ViamVjdDogW1BBVENIIDEv
M10gRml4IHBhcmFsbGVsIG1ha2UgZmFpbHVyZSBmb3IgYXJjaGl2ZXMKK1N1YmplY3Q6IFtQQVRD
SF0gRml4IHBhcmFsbGVsIG1ha2UgZmFpbHVyZSBmb3IgYXJjaGl2ZXMKIAogVXBzdHJlYW0tU3Rh
dHVzOiBQZW5kaW5nCiAKQEAgLTIwLDEyICsyMCwxNiBAQCBTaWduZWQtb2ZmLWJ5OiBDYWxpZm9y
bmlhIFN1bGxpdmFuIDxjYWxpZm9ybmlhLmwuc3VsbGl2YW5AaW50ZWwuY29tPgogW1JlYmFzZWQg
Zm9yIDMuMC44XQogU2lnbmVkLW9mZi1ieTogWWkgWmhhbyA8eWkuemhhb0B3aW5kcml2ZXIuY29t
PgogCistLS0KKyBsaWIvTWFrZWZpbGUgfCAyICstCisgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCisKIGRpZmYgLS1naXQgYS9saWIvTWFrZWZpbGUgYi9saWIv
TWFrZWZpbGUKLWluZGV4IDBlNjQxMGQuLjA0ODc1MWEgMTAwNjQ0CitpbmRleCAxZmM2YTQ3Li41
NGIwY2E3IDEwMDY0NAogLS0tIGEvbGliL01ha2VmaWxlCiArKysgYi9saWIvTWFrZWZpbGUKLUBA
IC03NSw3ICs3NSw3IEBAIGxpYnN1YmRpcnM6Ci0gCWZvciBzZGlyIGluICQoU1VCRElSUyk7IGRv
IG1rZGlyIC1wICQkc2RpcjsgZG9uZQorQEAgLTc3LDcgKzc3LDcgQEAgbGlic3ViZGlyczoKKyAk
KE9CSlMpOiBsaWJzdWJkaXJzCiAgCiAgbGliZWZpLmE6ICQoT0JKUykKIC0JJChBUikgJChBUkZM
QUdTKSAkQCAkXgpAQCAtMzMsNiArMzcsMyBAQCBpbmRleCAwZTY0MTBkLi4wNDg3NTFhIDEwMDY0
NAogIAogIGNsZWFuOgogIAlybSAtZiBsaWJlZmkuYSAqfiAkKE9CSlMpICovKi5vCi0tLSAKLTIu
Ny40Ci0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ic3AvZ251LWVmaS9nbnUtZWZpXzMuMC4x
NC5iYiBiL21ldGEvcmVjaXBlcy1ic3AvZ251LWVmaS9nbnUtZWZpXzMuMC4xNS5iYgpzaW1pbGFy
aXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtYnNwL2dudS1lZmkvZ251LWVm
aV8zLjAuMTQuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ic3AvZ251LWVmaS9nbnUtZWZpXzMu
MC4xNS5iYgppbmRleCAzNmQxMDM1NGVkLi41YWU2ZjM5MWFlIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtYnNwL2dudS1lZmkvZ251LWVmaV8zLjAuMTQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWJz
cC9nbnUtZWZpL2dudS1lZmlfMy4wLjE1LmJiCkBAIC0xNCwxMSArMTQsMTAgQEAgTElDX0ZJTEVT
X0NIS1NVTSA9ICJmaWxlOi8vZ251ZWZpL2NydDAtZWZpLWFybS5TO2JlZ2lubGluZT00O2VuZGxp
bmU9MTY7bWQ1PWU1ODIKIAogU1JDX1VSSSA9ICIke1NPVVJDRUZPUkdFX01JUlJPUn0vJHtCUE59
L2ZpbGVzLyR7QlB9LnRhci5iejIgXAogICAgICAgICAgICBmaWxlOi8vcGFyYWxsZWwtbWFrZS1h
cmNoaXZlcy5wYXRjaCBcCi0gICAgICAgICAgIGZpbGU6Ly9saWItTWFrZWZpbGUtZml4LXBhcmFs
bGVsLWlzc3VlLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovL2dudS1lZmktMy4wLjktZml4LWNs
YW5nLWJ1aWxkLnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAi
YjczYjY0M2EwZDU2OTdkMWYzOTZkNzQzMTQ0OGU4ODZkZDgwNTY2ODc4OTU3OGUzZTFhMjgyNzdj
OTUyODQzNSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI5MzFhMjU3YjljNWMxYmE2NWZmNTE5ZjE4
MzczYzQzOGEyNjgyNWYyZGI3ODY2YjE2M2U5NmQxYjE2OGYyMGVhIgogCiBDT01QQVRJQkxFX0hP
U1QgPSAiKHg4Nl82NC4qfGkuODYuKnxhYXJjaDY0Lip8YXJtLip8cmlzY3Y2NC4qKS1saW51eCIK
IENPTVBBVElCTEVfSE9TVDphcm12NCA9ICdudWxsJwotLSAKMi4zMS4xCgo=

--===============8120456758819684153==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (0 cached, 884 parsed). 1658 targets, 70 skipped, 0 masked, 0 errors.

Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: Nothing PROVIDES 'gnu-efi'
gnu-efi was skipped: incompatible with host powerpc-poky-linux (not in COMPATIBLE_HOST)

--===============8120456758819684153==--

