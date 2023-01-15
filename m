Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65BD0C71131
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 18:02:31 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.145726.1673805744693388316
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jan 2023 10:02:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=lO+9+BWJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010185b698c7ca-18262597-49e9-45d7-b023-6df0648576ca-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1673805744;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=deT+nm5kg3noNoJVccxA+FPf+o/DtGVnk4uQNNAWMeA=;
	b=lO+9+BWJBd8PA//TAGKRLgmkIMJA26tY+QQqG6SgPkbeDvJ2BYMXL1qj8lHgZPy6
	yy33XB6mAElnd8zf7SzRwo0UPevOS3GkQAxqMawPnT8daoynff05FhDgAytc+fWVQ16
	DB7KzV4PBbRbeIyX8FtK3bo/VfyZT6aPuDUsdMfg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1673805744;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=deT+nm5kg3noNoJVccxA+FPf+o/DtGVnk4uQNNAWMeA=;
	b=L454cq68jQCcz6/LD0ywS9Q6GcVarQB6tWw9TMdcfUZ5z1XPGhSAuIJw9d2iTiI9
	lD4Xs40yHONE/awc65AJXTIro6lG8nnCxz/dLxr/LPY0AZPMUNMyrwNtQ/iFHJKXB1S
	J5YuGo/+NPFDpIG5YhlgByBzh0s3Fwo34pX70tdU=
Content-Type: multipart/mixed; boundary="===============2346458208325823324=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] man-pages: upgrading to 6.02 SUCCEEDED
Message-ID: <01010185b698c7ca-18262597-49e9-45d7-b023-6df0648576ca-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jan 2023 18:02:24 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 18:02:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175931

--===============2346458208325823324==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *man-pages* to *6.02* has Succeeded.

Next steps:
    - apply the patch: git am 0001-man-pages-upgrade-6.01-6.02.patch
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
--===============2346458208325823324==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/man-pages: SRC_URI changed from "https://cdn.kernel.org/pub/linux/docs/man-pages/man-pages-6.01.tar.gz" to "https://cdn.kernel.org/pub/linux/docs/man-pages/man-pages-6.02.tar.gz"
packages/core2-32-poky-linux/man-pages: PKGV changed from 6.01 [default] to 6.02 [default]
packages/core2-32-poky-linux/man-pages: PV changed from "6.01" to "6.02"
packages/core2-32-poky-linux/man-pages/man-pages-dbg: PKGV changed from 6.01 [default] to 6.02 [default]
packages/core2-32-poky-linux/man-pages/man-pages-dbg: PV changed from "6.01" to "6.02"
packages/core2-32-poky-linux/man-pages/man-pages-dev: PKGV changed from 6.01 [default] to 6.02 [default]
packages/core2-32-poky-linux/man-pages/man-pages-dev: PV changed from "6.01" to "6.02"
packages/core2-32-poky-linux/man-pages/man-pages-doc: PKGV changed from 6.01 [default] to 6.02 [default]
packages/core2-32-poky-linux/man-pages/man-pages-doc: PV changed from "6.01" to "6.02"
packages/core2-32-poky-linux/man-pages/man-pages-locale: PKGV changed from 6.01 [default] to 6.02 [default]
packages/core2-32-poky-linux/man-pages/man-pages-locale: PV changed from "6.01" to "6.02"
packages/core2-32-poky-linux/man-pages/man-pages-src: PKGV changed from 6.01 [default] to 6.02 [default]
packages/core2-32-poky-linux/man-pages/man-pages-src: PV changed from "6.01" to "6.02"
packages/core2-32-poky-linux/man-pages/man-pages-staticdev: PKGV changed from 6.01 [default] to 6.02 [default]
packages/core2-32-poky-linux/man-pages/man-pages-staticdev: PV changed from "6.01" to "6.02"
packages/core2-32-poky-linux/man-pages/man-pages: PKGSIZE changed from 7404925 to 7450162 (+1%)
packages/core2-32-poky-linux/man-pages/man-pages: FILELIST: removed "/usr/share/man/man3/FILE.3", added "/usr/share/man/man3/static_assert.3 /usr/share/man/man3const/EXIT_SUCCESS.3const /usr/share/man/man3/zustr2stp.3 /usr/share/man/man3/_Static_assert.3 /usr/share/man/man3const/EXIT_FAILURE.3const /usr/share/man/man3/zustr2ustp.3 /usr/share/man/man3/stpecpy.3 /usr/share/man/man3/ustpcpy.3 /usr/share/man/man3/ustr2stp.3 /usr/share/man/man3/stpecpyx.3 /usr/share/man/man3type/FILE.3type /usr/share/man/man7/string_copying.7"
packages/core2-32-poky-linux/man-pages/man-pages: PKGV changed from 6.01 [default] to 6.02 [default]
packages/core2-32-poky-linux/man-pages/man-pages: PV changed from "6.01" to "6.02"

--===============2346458208325823324==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/man-pages/man-pages: FILELIST: removed "/usr/share/man/man3/FILE.3", added "/usr/share/man/man3/zustr2ustp.3 /usr/share/man/man3/static_assert.3 /usr/share/man/man3/_Static_assert.3 /usr/share/man/man3const/EXIT_SUCCESS.3const /usr/share/man/man7/string_copying.7 /usr/share/man/man3/stpecpyx.3 /usr/share/man/man3const/EXIT_FAILURE.3const /usr/share/man/man3/stpecpy.3 /usr/share/man/man3/ustpcpy.3 /usr/share/man/man3/ustr2stp.3 /usr/share/man/man3/zustr2stp.3 /usr/share/man/man3type/FILE.3type"

--===============2346458208325823324==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-man-pages-upgrade-6.01-6.02.patch"

RnJvbSAzYTQ0Mzg5YTVmNWIwMjFlYTVjMzdmMzUwNWIzNDUwMWQ2ZjBlM2MzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSmFuIDIwMjMgMTQ6MDQ6MTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
YW4tcGFnZXM6IHVwZ3JhZGUgNi4wMSAtPiA2LjAyCgotLS0KIC4uLi97bWFuLXBhZ2VzXzYuMDEu
YmIgPT4gbWFuLXBhZ2VzXzYuMDIuYmJ9ICB8IDEyOSArKysrKysrKysrKysrKysrKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxMjcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvbWFuLXBhZ2VzL3ttYW4tcGFnZXNfNi4wMS5iYiA9PiBtYW4tcGFn
ZXNfNi4wMi5iYn0gKDE5JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbWFu
LXBhZ2VzL21hbi1wYWdlc182LjAxLmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL21hbi1wYWdl
cy9tYW4tcGFnZXNfNi4wMi5iYgpzaW1pbGFyaXR5IGluZGV4IDE5JQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvbWFuLXBhZ2VzL21hbi1wYWdlc182LjAxLmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbWFuLXBhZ2VzL21hbi1wYWdlc182LjAyLmJiCmluZGV4IDFh
ZDRlZDEzMTcuLmUwYzUxYjgwNmYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9t
YW4tcGFnZXMvbWFuLXBhZ2VzXzYuMDEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL21h
bi1wYWdlcy9tYW4tcGFnZXNfNi4wMi5iYgpAQCAtMSwxMyArMSwxMzggQEAKKyMgRklYTUU6IHRo
ZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1
cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBv
bGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNF
IHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29t
bWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNl
bnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6
CisjCisjIC0tLSBSRUFETUUKKyMgKysrIFJFQURNRQorIyBAQCAtMSwxOSArMSw5NiBAQAorIyAt
VGhpcyBwYWNrYWdlIGNvbnRhaW5zIExpbnV4IG1hbiBwYWdlcyBmb3Igc2VjdGlvbnMgMSB0aHJv
dWdoIDguCisjIC1Tb21lIG1vcmUgaW5mb3JtYXRpb24gaXMgZ2l2ZW4gaW4gdGhlIDxtYW4tcGFn
ZXMteC55LkFubm91bmNlPiBmaWxlLgorIyArTmFtZQorIyArICAgICAgIExpbnV4IG1hbi1wYWdl
cyAtIG1hbnVhbCBwYWdlcyBmb3IgR05VL0xpbnV4CisjICAKKyMgLUhvbWVwYWdlCisjIC09PT09
PT09PQorIyAtRm9yIGluZm9ybWF0aW9uIGFib3V0IHRoZSBMaW51eCBtYW4tcGFnZXMgcHJvamVj
dCwgc2VlCisjIC08aHR0cDovL3d3dy5rZXJuZWwub3JnL2RvYy9tYW4tcGFnZXMvaW5kZXguaHRt
bD4uCisjICtTeW5vcHNpcworIyArICAgICAgIFRoaXMgcGFja2FnZSBjb250YWlucyBHTlUvTGlu
dXggbWFudWFsIHBhZ2VzIGZvciBzZWN0aW9ucyAxIHRocm91Z2ggOC4KKyMgIAorIyAtQnVnIHJl
cG9ydHMgYW5kIGNvbnRyaWJ1dGluZworIyAtPT09PT09PT09PT09PT09PT09PT09PT09PT09PQor
IyAtU2VlIHRoZSA8Q09OVFJJQlVUSU5HPiBmaWxlLgorIyArRGVzY3JpcHRpb24KKyMgKyAgICAg
ICBUaGUgbWFudWFsIHBhZ2VzIGluIHRoaXMgcHJvamVjdCBkb2N1bWVudCBwcmltYXJpbHkgdGhl
IExpbnV4IGtlcm5lbAorIyArICAgICAgIGFuZCB0aGUgR05VIEMgbGlicmFyeSwgYnV0IGFsc28g
Y29uc2lkZXIgcmVsZXZhbnQgZGlmZmVyZW5jZXMgaW4gb3RoZXIKKyMgKyAgICAgICBrZXJuZWxz
IG9yIEMgbGlicmFyaWVzLgorIyAgCisjIC1JbnN0YWxsaW5nIGFuZCB1bmluc3RhbGxpbmcKKyMg
LT09PT09PT09PT09PT09PT09PT09PT09PT09PQorIyAtU2VlIHRoZSA8SU5TVEFMTD4gZmlsZS4K
KyMgKyAgICAgICBUaGVzZSBwYWdlcyBhcmUgbW9zdCBvZiB0aGUgc2VjdGlvbiAyLCAzLCA0LCA1
LCA3IG1hbiBwYWdlcyBmb3IKKyMgKyAgICAgICBHTlUvTGludXguICBBIGZldyBwYWdlcyBhcmUg
cHJvdmlkZWQgaW4gc2VjdGlvbnMgMSBhbmQgOCBmb3IgY29tbWFuZHMKKyMgKyAgICAgICB0aGF0
IGFyZSBub3QgZG9jdW1lbnRlZCBpbiBvdGhlciBwYWNrYWdlcywgYW5kIHRoZXJlIGFyZSBhIGZl
dyBwYWdlcyBpbgorIyArICAgICAgIHNlY3Rpb25zIDUgYW5kIDggZm9yIHRoZSB0aW1lem9uZSB1
dGlsaXRpZXMuCisjICAKKyMgLUNvcHlyaWdodHMKKyMgLT09PT09PT09PT0KKyMgLVNlZSB0aGUg
PG1hbi1wYWdlcy14LnkuQW5ub3VuY2U+IGZpbGUuCisjICtGaWxlcworIyArICAgQ09OVFJJQlVU
SU5HCisjICsgICAgICAgSW5zdHJ1Y3Rpb25zIGZvciByZXBvcnRpbmcgYnVncyBhbmQgY29udHJp
YnV0aW5nLgorIyArCisjICsgICBJTlNUQUxMCisjICsgICAgICAgSW5zdHJ1Y3Rpb25zIGZvciBp
bnN0YWxsaW5nIGFuZCB1bmluc3RhbGxpbmcuCisjICsKKyMgKyAgIE1BSU5UQUlORVJfTk9URVMK
KyMgKyAgICAgICBOb3RlcyBmb3IgbWFpbnRhaW5lcnMuCisjICsKKyMgKyAgIFJFQURNRQorIyAr
ICAgICAgIE1haW4gaW5mb3JtYXRpb24gYWJvdXQgdGhlIHByb2plY3QgYW5kIHRoZSByZXBvc2l0
b3J5LgorIyArCisjICsgICBSRUxFQVNFCisjICsgICAgICAgSW5zdHJ1Y3Rpb25zIGZvciByZWxl
YXNpbmcgYW5kIGRpc3RyaWJ1dGluZyBuZXcgdmVyc2lvbnMuCisjICsKKyMgKyAgIENoYW5nZXMs
IENoYW5nZXMub2xkCisjICsgICAgICAgQ2hhbmdlIGxvZy4gIEluY2x1ZGVzIG1vc3QgcmVsZXZh
bnQgY2hhbmdlcy4gIEhvd2V2ZXIsIGl0J3Mgbm90IGFzCisjICsgICAgICAgY29tcGxldGUgYXMg
dGhlIGdpdCgxKSBsb2cuCisjICsKKyMgKyAgIE1ha2VmaWxlLCBsaWIvKi5taworIyArICAgICAg
IEJ1aWxkIHN5c3RlbS4gIEZvciBoZWxwLCBjb25zdWx0IHRoZSA8SU5TVEFMTD4gZmlsZSwgYW5k
IHJ1biAnbWFrZSBoZWxwJy4KKyMgKworIyArICAgbHNtCisjICsgICAgICAgTGludXggc29mdHdh
cmUgbWFwLiAgU2VlIGFsc28gPGh0dHBzOi8vbHNtLnFxeC5vcmcvPi4KKyMgKworIyArICAgLm1h
aWxtYXAKKyMgKyAgICAgICBTZWUgZ2l0bWFpbG1hcCg1KS4KKyMgKworIyArICAgTElDRU5TRVMv
Ki50eHQKKyMgKyAgICAgICBMaWNlbnNlcyBpbiB1c2UgYnkgdGhlIHByb2plY3QuCisjICsKKyMg
KyAgIGV0Yy8qCisjICsgICAgICAgQ29uZmlndXJhdGlvbiBmaWxlcyBmb3IgKGxpbnRlcikgcHJv
Z3JhbXMgY2FsbGVkIGJ5IHRoZSBidWlsZCBzeXN0ZW0uCisjICsKKyMgKyAgIG1hbiovKgorIyAr
ICAgICAgIE1hbnVhbCBwYWdlcy4KKyMgKworIyArICAgc2NyaXB0cy8qCisjICsgICAgICAgVXNl
ZnVsIHNjcmlwdHMgZm9yIG1haW50YWluZXJzLgorIyArCisjICsgICB0bXAvCisjICsgICAgICAg
RGVmYXVsdCBkaXJlY3RvcnkgZm9yIGZpbGVzIGNyZWF0ZWQgYnkgdGhlIGJ1aWxkIHN5c3RlbS4K
KyMgKworIyArVmVyc2lvbnMKKyMgKyAgICAgICBUYXJiYWxscyBvZiByZWxlYXNlcyBzdGFydGlu
ZyBmcm9tIDIuMDAgYXJlIGF2YWlsYWJsZSBhdAorIyArICAgICAgIDxodHRwczovL21pcnJvcnMu
ZWRnZS5rZXJuZWwub3JnL3B1Yi9saW51eC9kb2NzL21hbi1wYWdlcy8+LgorIyArCisjICsgICAg
ICAgVGhlIGdpdCgxKSByZXBvc2l0b3J5IGNvdmVycyB0aGUgZGV2ZWxvcG1lbnQgc2luY2UgMS43
MDoKKyMgKyAgICAgICA8Z2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9kb2NzL21hbi1wYWdl
cy9tYW4tcGFnZXMuZ2l0PgorIyArCisjICsgICAgICAgQSBzZWNvbmRhcnkgZ2l0KDEpIHJlcG9z
aXRvcnkgY2FuIGJlIGZvdW5kIGF0OgorIyArICAgICAgIDxnaXQ6Ly93d3cuYWxlamFuZHJvLWNv
bG9tYXIuZXMvc3JjL2FseC9saW51eC9tYW4tcGFnZXMvbWFuLXBhZ2VzLmdpdD4KKyMgKworIyAr
Q2F2ZWF0cworIyArICAgICAgIFNvbWUgcHJvamVjdHMgcHJvdmlkZSB0aGVpciBvd24gbWFudWFs
IHBhZ2VzLCBub3QgcmVsYXRlZCB0byB0aGUgTGludXgKKyMgKyAgICAgICBtYW4tcGFnZXMgcHJv
amVjdC4KKyMgKworIyArQnVncworIyArICAgICAgIFNlZSB0aGUgPENPTlRSSUJVVElORz4gZmls
ZS4KKyMgKworIyArTWFpbnRhaW5lcnMKKyMgKyAgICAgICBBbGVqYW5kcm8gQ29sb21hciA8YWx4
QGtlcm5lbC5vcmc+IDxodHRwOi8vd3d3LmFsZWphbmRyby1jb2xvbWFyLmVzLz4KKyMgKyAgICAg
ICAgICAgICAyMDIwIC0gcHJlc2VudCAoNS4wOSAtIEhFQUQpCisjICsgICAgICAgTWljaGFlbCBL
ZXJyaXNrIDxtdGsubWFucGFnZXNAZ21haWwuY29tPiA8aHR0cHM6Ly9tYW43Lm9yZy8+CisjICsg
ICAgICAgICAgICAgMjAwNCAtIDIwMjEgKDIuMDAgLSA1LjEzKQorIyArICAgICAgIEFuZHJpZXMg
QnJvdXdlciA8YWViQGN3aS5ubD4gPGh0dHBzOi8vd3d3Lndpbi50dWUubmwvfmFlYj4KKyMgKyAg
ICAgICAgICAgICAxOTk1IC0gMjAwNCAgICAoMS42ICAtIDEuNzApCisjICsgICAgICAgUmlrIEZh
aXRoIDxodHRwczovL3d3dy5jcy51bmMuZWR1L35mYWl0aC8+CisjICsgICAgICAgICAgICAgMTk5
MyAtIDE5OTUgICAgKDEuMCAgLSAxLjUpCisjICsKKyMgK0NvcHlyaWdodAorIyArICAgICAgIFNl
dmVyYWwgZnJlZS9vcGVuIHNvdXJjZSBsaWNlbnNlcy4gIFNlZSB0aGUgPExJQ0VOU0VTLz4gZGly
ZWN0b3J5LCBhbmQKKyMgKyAgICAgICB0aGUgY29tbWVudCBhdCB0aGUgdG9wIG9mIGVhY2ggc291
cmNlIGZpbGUuCisjICsKKyMgK1NlZSBhbHNvCisjICsgICAgICAgbWFuLXBhZ2VzKDcpCisjICsK
KyMgKyAgIFdlYnNpdGUKKyMgKyAgICAgICA8aHR0cDovL3d3dy5rZXJuZWwub3JnL2RvYy9tYW4t
cGFnZXMvaW5kZXguaHRtbD4uCisjIAorIworCiBTVU1NQVJZID0gIkxpbnV4IG1hbi1wYWdlcyIK
IERFU0NSSVBUSU9OID0gIlRoZSBMaW51eCBtYW4tcGFnZXMgcHJvamVjdCBkb2N1bWVudHMgdGhl
IExpbnV4IGtlcm5lbCBhbmQgQyBsaWJyYXJ5IGludGVyZmFjZXMgdGhhdCBhcmUgZW1wbG95ZWQg
YnkgdXNlciBwcm9ncmFtcyIKIFNFQ1RJT04gPSAiY29uc29sZS91dGlscyIKIEhPTUVQQUdFID0g
Imh0dHA6Ly93d3cua2VybmVsLm9yZy9wdWIvbGludXgvZG9jcy9tYW4tcGFnZXMiCiBMSUNFTlNF
ID0gIkdQTC0yLjAtb3ItbGF0ZXIiCiAKLUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL1JFQURN
RTttZDU9YmYxZmFhOWIwMjQ1ZTM5YTdjMGM5NjkwZmZkZjZlNTQiCitMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9SRUFETUU7bWQ1PTI2OTAxNDA4ZDhjZmQ2ZjY2NzVmOGI0OWRhZjljYzc0Igog
U1JDX1VSSSA9ICIke0tFUk5FTE9SR19NSVJST1J9L2xpbnV4L2RvY3MvJHtCUE59LyR7QlB9LnRh
ci5neiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImMxZThiZWE4ODU4OWYxYTgwYjY3ZGFmZDgy
ZmI5OGIwMThkZGQ3ZjdiZmE1OTRmOGY3OTY4NjI1OGQyNmU3ODQiCitTUkNfVVJJW3NoYTI1NnN1
bV0gPSAiOTY4ZGVmOWU3MDU1YzljYmNhOWE0ZjIxZjc5Njc3YjAyYWM4YjBkMmZhNjJjZWVhN2Jk
OGVmNGRjYzZjYWM0MSIKIAogaW5oZXJpdCBtYW5wYWdlcwogCi0tIAoyLjM3LjMKCg==

--===============2346458208325823324==--

