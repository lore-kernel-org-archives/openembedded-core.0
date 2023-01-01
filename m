Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1613C71130
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 20:46:18 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.20179.1672605967239804541
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 12:46:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=NPPIZQMY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101856f15a4d4-b7337823-7f4e-4cac-9ff2-4e029f86f60a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1672605967;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KaHnSkc4+YcHqr2Jzjt0ZHxx2T32NJv61atSvF6z8BU=;
	b=NPPIZQMY+V0wF1MsaX0G+IzMSyinbNzSVa27BXVAMkueSbuNJ6xS8YVQO7R2RYfE
	KN0rbUzm3mvICa/7H12dfd6LC0dgCodPvYYqwpT1kaZxZsx9sgGajcbQ2wMnX8lS83j
	t2vZMYtGGJzW3Yg37vWQQ0GlrmUnw6J4O3vnGRis=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1672605967;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KaHnSkc4+YcHqr2Jzjt0ZHxx2T32NJv61atSvF6z8BU=;
	b=Vf4Tr92TQgyoA2BUaLa2woKgfZg04iIFqUPSmhQCRlnx+GBUTc1pFCpUY+08G+Ax
	p5Q0Wf0eXj40KkMRc6d1H3EnYk2i7s1Q6qZlbRs5J78/O5bZ71GaA7wJmNgprinVeM1
	02rfOVsx/bpbfyrBVm8q7yRzS6geCyKE35ep3E8M=
Content-Type: multipart/mixed; boundary="===============0550458819613884448=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] man-pages: upgrading to 6.02 SUCCEEDED
Message-ID: <010101856f15a4d4-b7337823-7f4e-4cac-9ff2-4e029f86f60a-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jan 2023 20:46:07 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 20:46:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175280

--===============0550458819613884448==
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
--===============0550458819613884448==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/man-pages/man-pages: FILELIST: removed "/usr/share/man/man3/FILE.3", added "/usr/share/man/man3/static_assert.3 /usr/share/man/man3/stpecpyx.3 /usr/share/man/man3/zustr2ustp.3 /usr/share/man/man3/stpecpy.3 /usr/share/man/man3/ustpcpy.3 /usr/share/man/man3/_Static_assert.3 /usr/share/man/man3/zustr2stp.3 /usr/share/man/man3const/EXIT_SUCCESS.3const /usr/share/man/man3type/FILE.3type /usr/share/man/man7/string_copying.7 /usr/share/man/man3const/EXIT_FAILURE.3const /usr/share/man/man3/ustr2stp.3"

--===============0550458819613884448==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/man-pages: PKGV changed from 6.01 [default] to 6.02 [default]
packages/core2-32-poky-linux/man-pages: PV changed from "6.01" to "6.02"
packages/core2-32-poky-linux/man-pages: SRC_URI changed from "https://cdn.kernel.org/pub/linux/docs/man-pages/man-pages-6.01.tar.gz" to "https://cdn.kernel.org/pub/linux/docs/man-pages/man-pages-6.02.tar.gz"
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
packages/core2-32-poky-linux/man-pages/man-pages: FILELIST: removed "/usr/share/man/man3/FILE.3", added "/usr/share/man/man3type/FILE.3type /usr/share/man/man3const/EXIT_SUCCESS.3const /usr/share/man/man3/stpecpyx.3 /usr/share/man/man3/zustr2ustp.3 /usr/share/man/man3/stpecpy.3 /usr/share/man/man3/ustpcpy.3 /usr/share/man/man3/static_assert.3 /usr/share/man/man3const/EXIT_FAILURE.3const /usr/share/man/man3/zustr2stp.3 /usr/share/man/man7/string_copying.7 /usr/share/man/man3/_Static_assert.3 /usr/share/man/man3/ustr2stp.3"
packages/core2-32-poky-linux/man-pages/man-pages: PKGV changed from 6.01 [default] to 6.02 [default]
packages/core2-32-poky-linux/man-pages/man-pages: PV changed from "6.01" to "6.02"
packages/core2-32-poky-linux/man-pages/man-pages: PKGSIZE changed from 7404925 to 7450162 (+1%)

--===============0550458819613884448==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-man-pages-upgrade-6.01-6.02.patch"

RnJvbSBlMTM4YzAxMmM4OGY0NjY2M2FiYTVmMzI3Mjk0MTQ4YjFkYWI3YWJhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKYW4gMjAyMyAxMjoxNDowOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1h
bi1wYWdlczogdXBncmFkZSA2LjAxIC0+IDYuMDIKCi0tLQogLi4uL3ttYW4tcGFnZXNfNi4wMS5i
YiA9PiBtYW4tcGFnZXNfNi4wMi5iYn0gIHwgMTI5ICsrKysrKysrKysrKysrKysrLQogMSBmaWxl
IGNoYW5nZWQsIDEyNyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1leHRlbmRlZC9tYW4tcGFnZXMve21hbi1wYWdlc182LjAxLmJiID0+IG1hbi1wYWdl
c182LjAyLmJifSAoMTklKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9tYW4t
cGFnZXMvbWFuLXBhZ2VzXzYuMDEuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbWFuLXBhZ2Vz
L21hbi1wYWdlc182LjAyLmJiCnNpbWlsYXJpdHkgaW5kZXggMTklCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1leHRlbmRlZC9tYW4tcGFnZXMvbWFuLXBhZ2VzXzYuMDEuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1leHRlbmRlZC9tYW4tcGFnZXMvbWFuLXBhZ2VzXzYuMDIuYmIKaW5kZXggMWFk
NGVkMTMxNy4uZTBjNTFiODA2ZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL21h
bi1wYWdlcy9tYW4tcGFnZXNfNi4wMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbWFu
LXBhZ2VzL21hbi1wYWdlc182LjAyLmJiCkBAIC0xLDEzICsxLDEzOCBAQAorIyBGSVhNRTogdGhl
IExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVw
Z3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9s
ZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0Ug
dmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21t
aXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vu
c2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoK
KyMKKyMgLS0tIFJFQURNRQorIyArKysgUkVBRE1FCisjIEBAIC0xLDE5ICsxLDk2IEBACisjIC1U
aGlzIHBhY2thZ2UgY29udGFpbnMgTGludXggbWFuIHBhZ2VzIGZvciBzZWN0aW9ucyAxIHRocm91
Z2ggOC4KKyMgLVNvbWUgbW9yZSBpbmZvcm1hdGlvbiBpcyBnaXZlbiBpbiB0aGUgPG1hbi1wYWdl
cy14LnkuQW5ub3VuY2U+IGZpbGUuCisjICtOYW1lCisjICsgICAgICAgTGludXggbWFuLXBhZ2Vz
IC0gbWFudWFsIHBhZ2VzIGZvciBHTlUvTGludXgKKyMgIAorIyAtSG9tZXBhZ2UKKyMgLT09PT09
PT09CisjIC1Gb3IgaW5mb3JtYXRpb24gYWJvdXQgdGhlIExpbnV4IG1hbi1wYWdlcyBwcm9qZWN0
LCBzZWUKKyMgLTxodHRwOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL21hbi1wYWdlcy9pbmRleC5odG1s
Pi4KKyMgK1N5bm9wc2lzCisjICsgICAgICAgVGhpcyBwYWNrYWdlIGNvbnRhaW5zIEdOVS9MaW51
eCBtYW51YWwgcGFnZXMgZm9yIHNlY3Rpb25zIDEgdGhyb3VnaCA4LgorIyAgCisjIC1CdWcgcmVw
b3J0cyBhbmQgY29udHJpYnV0aW5nCisjIC09PT09PT09PT09PT09PT09PT09PT09PT09PT09Cisj
IC1TZWUgdGhlIDxDT05UUklCVVRJTkc+IGZpbGUuCisjICtEZXNjcmlwdGlvbgorIyArICAgICAg
IFRoZSBtYW51YWwgcGFnZXMgaW4gdGhpcyBwcm9qZWN0IGRvY3VtZW50IHByaW1hcmlseSB0aGUg
TGludXgga2VybmVsCisjICsgICAgICAgYW5kIHRoZSBHTlUgQyBsaWJyYXJ5LCBidXQgYWxzbyBj
b25zaWRlciByZWxldmFudCBkaWZmZXJlbmNlcyBpbiBvdGhlcgorIyArICAgICAgIGtlcm5lbHMg
b3IgQyBsaWJyYXJpZXMuCisjICAKKyMgLUluc3RhbGxpbmcgYW5kIHVuaW5zdGFsbGluZworIyAt
PT09PT09PT09PT09PT09PT09PT09PT09PT09CisjIC1TZWUgdGhlIDxJTlNUQUxMPiBmaWxlLgor
IyArICAgICAgIFRoZXNlIHBhZ2VzIGFyZSBtb3N0IG9mIHRoZSBzZWN0aW9uIDIsIDMsIDQsIDUs
IDcgbWFuIHBhZ2VzIGZvcgorIyArICAgICAgIEdOVS9MaW51eC4gIEEgZmV3IHBhZ2VzIGFyZSBw
cm92aWRlZCBpbiBzZWN0aW9ucyAxIGFuZCA4IGZvciBjb21tYW5kcworIyArICAgICAgIHRoYXQg
YXJlIG5vdCBkb2N1bWVudGVkIGluIG90aGVyIHBhY2thZ2VzLCBhbmQgdGhlcmUgYXJlIGEgZmV3
IHBhZ2VzIGluCisjICsgICAgICAgc2VjdGlvbnMgNSBhbmQgOCBmb3IgdGhlIHRpbWV6b25lIHV0
aWxpdGllcy4KKyMgIAorIyAtQ29weXJpZ2h0cworIyAtPT09PT09PT09PQorIyAtU2VlIHRoZSA8
bWFuLXBhZ2VzLXgueS5Bbm5vdW5jZT4gZmlsZS4KKyMgK0ZpbGVzCisjICsgICBDT05UUklCVVRJ
TkcKKyMgKyAgICAgICBJbnN0cnVjdGlvbnMgZm9yIHJlcG9ydGluZyBidWdzIGFuZCBjb250cmli
dXRpbmcuCisjICsKKyMgKyAgIElOU1RBTEwKKyMgKyAgICAgICBJbnN0cnVjdGlvbnMgZm9yIGlu
c3RhbGxpbmcgYW5kIHVuaW5zdGFsbGluZy4KKyMgKworIyArICAgTUFJTlRBSU5FUl9OT1RFUwor
IyArICAgICAgIE5vdGVzIGZvciBtYWludGFpbmVycy4KKyMgKworIyArICAgUkVBRE1FCisjICsg
ICAgICAgTWFpbiBpbmZvcm1hdGlvbiBhYm91dCB0aGUgcHJvamVjdCBhbmQgdGhlIHJlcG9zaXRv
cnkuCisjICsKKyMgKyAgIFJFTEVBU0UKKyMgKyAgICAgICBJbnN0cnVjdGlvbnMgZm9yIHJlbGVh
c2luZyBhbmQgZGlzdHJpYnV0aW5nIG5ldyB2ZXJzaW9ucy4KKyMgKworIyArICAgQ2hhbmdlcywg
Q2hhbmdlcy5vbGQKKyMgKyAgICAgICBDaGFuZ2UgbG9nLiAgSW5jbHVkZXMgbW9zdCByZWxldmFu
dCBjaGFuZ2VzLiAgSG93ZXZlciwgaXQncyBub3QgYXMKKyMgKyAgICAgICBjb21wbGV0ZSBhcyB0
aGUgZ2l0KDEpIGxvZy4KKyMgKworIyArICAgTWFrZWZpbGUsIGxpYi8qLm1rCisjICsgICAgICAg
QnVpbGQgc3lzdGVtLiAgRm9yIGhlbHAsIGNvbnN1bHQgdGhlIDxJTlNUQUxMPiBmaWxlLCBhbmQg
cnVuICdtYWtlIGhlbHAnLgorIyArCisjICsgICBsc20KKyMgKyAgICAgICBMaW51eCBzb2Z0d2Fy
ZSBtYXAuICBTZWUgYWxzbyA8aHR0cHM6Ly9sc20ucXF4Lm9yZy8+LgorIyArCisjICsgICAubWFp
bG1hcAorIyArICAgICAgIFNlZSBnaXRtYWlsbWFwKDUpLgorIyArCisjICsgICBMSUNFTlNFUy8q
LnR4dAorIyArICAgICAgIExpY2Vuc2VzIGluIHVzZSBieSB0aGUgcHJvamVjdC4KKyMgKworIyAr
ICAgZXRjLyoKKyMgKyAgICAgICBDb25maWd1cmF0aW9uIGZpbGVzIGZvciAobGludGVyKSBwcm9n
cmFtcyBjYWxsZWQgYnkgdGhlIGJ1aWxkIHN5c3RlbS4KKyMgKworIyArICAgbWFuKi8qCisjICsg
ICAgICAgTWFudWFsIHBhZ2VzLgorIyArCisjICsgICBzY3JpcHRzLyoKKyMgKyAgICAgICBVc2Vm
dWwgc2NyaXB0cyBmb3IgbWFpbnRhaW5lcnMuCisjICsKKyMgKyAgIHRtcC8KKyMgKyAgICAgICBE
ZWZhdWx0IGRpcmVjdG9yeSBmb3IgZmlsZXMgY3JlYXRlZCBieSB0aGUgYnVpbGQgc3lzdGVtLgor
IyArCisjICtWZXJzaW9ucworIyArICAgICAgIFRhcmJhbGxzIG9mIHJlbGVhc2VzIHN0YXJ0aW5n
IGZyb20gMi4wMCBhcmUgYXZhaWxhYmxlIGF0CisjICsgICAgICAgPGh0dHBzOi8vbWlycm9ycy5l
ZGdlLmtlcm5lbC5vcmcvcHViL2xpbnV4L2RvY3MvbWFuLXBhZ2VzLz4uCisjICsKKyMgKyAgICAg
ICBUaGUgZ2l0KDEpIHJlcG9zaXRvcnkgY292ZXJzIHRoZSBkZXZlbG9wbWVudCBzaW5jZSAxLjcw
OgorIyArICAgICAgIDxnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2RvY3MvbWFuLXBhZ2Vz
L21hbi1wYWdlcy5naXQ+CisjICsKKyMgKyAgICAgICBBIHNlY29uZGFyeSBnaXQoMSkgcmVwb3Np
dG9yeSBjYW4gYmUgZm91bmQgYXQ6CisjICsgICAgICAgPGdpdDovL3d3dy5hbGVqYW5kcm8tY29s
b21hci5lcy9zcmMvYWx4L2xpbnV4L21hbi1wYWdlcy9tYW4tcGFnZXMuZ2l0PgorIyArCisjICtD
YXZlYXRzCisjICsgICAgICAgU29tZSBwcm9qZWN0cyBwcm92aWRlIHRoZWlyIG93biBtYW51YWwg
cGFnZXMsIG5vdCByZWxhdGVkIHRvIHRoZSBMaW51eAorIyArICAgICAgIG1hbi1wYWdlcyBwcm9q
ZWN0LgorIyArCisjICtCdWdzCisjICsgICAgICAgU2VlIHRoZSA8Q09OVFJJQlVUSU5HPiBmaWxl
LgorIyArCisjICtNYWludGFpbmVycworIyArICAgICAgIEFsZWphbmRybyBDb2xvbWFyIDxhbHhA
a2VybmVsLm9yZz4gPGh0dHA6Ly93d3cuYWxlamFuZHJvLWNvbG9tYXIuZXMvPgorIyArICAgICAg
ICAgICAgIDIwMjAgLSBwcmVzZW50ICg1LjA5IC0gSEVBRCkKKyMgKyAgICAgICBNaWNoYWVsIEtl
cnJpc2sgPG10ay5tYW5wYWdlc0BnbWFpbC5jb20+IDxodHRwczovL21hbjcub3JnLz4KKyMgKyAg
ICAgICAgICAgICAyMDA0IC0gMjAyMSAoMi4wMCAtIDUuMTMpCisjICsgICAgICAgQW5kcmllcyBC
cm91d2VyIDxhZWJAY3dpLm5sPiA8aHR0cHM6Ly93d3cud2luLnR1ZS5ubC9+YWViPgorIyArICAg
ICAgICAgICAgIDE5OTUgLSAyMDA0ICAgICgxLjYgIC0gMS43MCkKKyMgKyAgICAgICBSaWsgRmFp
dGggPGh0dHBzOi8vd3d3LmNzLnVuYy5lZHUvfmZhaXRoLz4KKyMgKyAgICAgICAgICAgICAxOTkz
IC0gMTk5NSAgICAoMS4wICAtIDEuNSkKKyMgKworIyArQ29weXJpZ2h0CisjICsgICAgICAgU2V2
ZXJhbCBmcmVlL29wZW4gc291cmNlIGxpY2Vuc2VzLiAgU2VlIHRoZSA8TElDRU5TRVMvPiBkaXJl
Y3RvcnksIGFuZAorIyArICAgICAgIHRoZSBjb21tZW50IGF0IHRoZSB0b3Agb2YgZWFjaCBzb3Vy
Y2UgZmlsZS4KKyMgKworIyArU2VlIGFsc28KKyMgKyAgICAgICBtYW4tcGFnZXMoNykKKyMgKwor
IyArICAgV2Vic2l0ZQorIyArICAgICAgIDxodHRwOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL21hbi1w
YWdlcy9pbmRleC5odG1sPi4KKyMgCisjCisKIFNVTU1BUlkgPSAiTGludXggbWFuLXBhZ2VzIgog
REVTQ1JJUFRJT04gPSAiVGhlIExpbnV4IG1hbi1wYWdlcyBwcm9qZWN0IGRvY3VtZW50cyB0aGUg
TGludXgga2VybmVsIGFuZCBDIGxpYnJhcnkgaW50ZXJmYWNlcyB0aGF0IGFyZSBlbXBsb3llZCBi
eSB1c2VyIHByb2dyYW1zIgogU0VDVElPTiA9ICJjb25zb2xlL3V0aWxzIgogSE9NRVBBR0UgPSAi
aHR0cDovL3d3dy5rZXJuZWwub3JnL3B1Yi9saW51eC9kb2NzL21hbi1wYWdlcyIKIExJQ0VOU0Ug
PSAiR1BMLTIuMC1vci1sYXRlciIKIAotTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vUkVBRE1F
O21kNT1iZjFmYWE5YjAyNDVlMzlhN2MwYzk2OTBmZmRmNmU1NCIKK0xJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL1JFQURNRTttZDU9MjY5MDE0MDhkOGNmZDZmNjY3NWY4YjQ5ZGFmOWNjNzQiCiBT
UkNfVVJJID0gIiR7S0VSTkVMT1JHX01JUlJPUn0vbGludXgvZG9jcy8ke0JQTn0vJHtCUH0udGFy
Lmd6IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYzFlOGJlYTg4NTg5ZjFhODBiNjdkYWZkODJm
Yjk4YjAxOGRkZDdmN2JmYTU5NGY4Zjc5Njg2MjU4ZDI2ZTc4NCIKK1NSQ19VUklbc2hhMjU2c3Vt
XSA9ICI5NjhkZWY5ZTcwNTVjOWNiY2E5YTRmMjFmNzk2NzdiMDJhYzhiMGQyZmE2MmNlZWE3YmQ4
ZWY0ZGNjNmNhYzQxIgogCiBpbmhlcml0IG1hbnBhZ2VzCiAKLS0gCjIuMzcuMwoK

--===============0550458819613884448==--

