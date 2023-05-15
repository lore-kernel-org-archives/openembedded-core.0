Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE79CC83003
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 21:39:15 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.3764.1684186747582821049
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 14:39:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=FyZ070f6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010188215a61ea-776fdee3-6023-41e6-ae41-e1e7557c8efd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1684186751;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=u+cZdlxb8+5ks0oZmoyzAz5YWc5bk+nlKG1L3GTh1p8=;
	b=FyZ070f6/gXQNvPBI8EzwXISKEsQzQzqUENgk1Ht7jUvW9Fk58+SViAm8T6uPieo
	3FNxg2xituafie/2K6nitql6vMAfaUvXBU0oSRkH4Z0ZYZg1UaiLNgB/fHAVhRnNzvs
	pjRynBITy+yf18N0VaI+sb80lwoTKRGeYsIqchds=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1684186751;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=u+cZdlxb8+5ks0oZmoyzAz5YWc5bk+nlKG1L3GTh1p8=;
	b=krV5dSf8AtZfBcSuJaptqOt98Y05SfDebJL+J0a0qj6qNCKdvQM043ZTH9QqajC+
	w1z9oX+UFbpaxm5bBqhrgSrHZ1yaHZ9H2BAjOPtvQkMjPUYa70XRlJnSVmMe+karm+0
	V1hz2rci+JK2X7wzpaPHy8zMYesHAztoDBrBUUuw=
Content-Type: multipart/mixed; boundary="===============8116256183547129072=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] alsa-utils: upgrading to 1.2.9 FAILED
Message-ID: <01010188215a61ea-776fdee3-6023-41e6-ae41-e1e7557c8efd-000000@us-west-2.amazonses.com>
Date: Mon, 15 May 2023 21:39:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 21:39:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181375

--===============8116256183547129072==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *alsa-utils* to *1.2.9* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-alsa-utils-upgrade-1.2.8-1.2.9.patch
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
--===============8116256183547129072==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-alsa-utils-upgrade-1.2.8-1.2.9.patch"

RnJvbSA0YjQ3ZmRiZDg3YmU1YmVmMzBlMGY0ZDI0MzJkMzgxZWVmNTJlNTQyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgTWF5IDIwMjMgMjA6MTI6NTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBh
bHNhLXV0aWxzOiB1cGdyYWRlIDEuMi44IC0+IDEuMi45CgotLS0KIC4uLmxheS1heGZlci1SZXBs
YWNlLW9mZjY0X3Qtd2l0aC1vZmZfdC5wYXRjaCB8IDI3MiAtLS0tLS0tLS0tLS0tLS0tLS0KIC4u
LmxzYS11dGlsc18xLjIuOC5iYiA9PiBhbHNhLXV0aWxzXzEuMi45LmJifSB8ICAgNiArLQogMiBm
aWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDI3NiBkZWxldGlvbnMoLSkKIGRlbGV0ZSBt
b2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9hbHNhL2Fsc2EtdXRpbHMvMDAwMS1h
cGxheS1heGZlci1SZXBsYWNlLW9mZjY0X3Qtd2l0aC1vZmZfdC5wYXRjaAogcmVuYW1lIG1ldGEv
cmVjaXBlcy1tdWx0aW1lZGlhL2Fsc2Eve2Fsc2EtdXRpbHNfMS4yLjguYmIgPT4gYWxzYS11dGls
c18xLjIuOS5iYn0gKDk2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9h
bHNhL2Fsc2EtdXRpbHMvMDAwMS1hcGxheS1heGZlci1SZXBsYWNlLW9mZjY0X3Qtd2l0aC1vZmZf
dC5wYXRjaCBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2Fsc2EvYWxzYS11dGlscy8wMDAxLWFw
bGF5LWF4ZmVyLVJlcGxhY2Utb2ZmNjRfdC13aXRoLW9mZl90LnBhdGNoCmRlbGV0ZWQgZmlsZSBt
b2RlIDEwMDY0NAppbmRleCAzNTZjNTk2NGFlLi4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBl
cy1tdWx0aW1lZGlhL2Fsc2EvYWxzYS11dGlscy8wMDAxLWFwbGF5LWF4ZmVyLVJlcGxhY2Utb2Zm
NjRfdC13aXRoLW9mZl90LnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsMjcyICswLDAgQEAKLUZy
b20gMDM1NTNjY2M2Mjg0YTQzNzU3NjM0OWI1YTNjMmVkMGQ3ZDQyNjVlMSBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKLUZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+Ci1EYXRlOiBU
aHUsIDE1IERlYyAyMDIyIDE0OjA0OjEwIC0wODAwCi1TdWJqZWN0OiBbUEFUQ0hdIGFwbGF5LGF4
ZmVyOiBSZXBsYWNlIG9mZjY0X3Qgd2l0aCBvZmZfdAotCi1BbHNvIHJlcGxhY2UgbHNlZWs2NCB3
aXRoIGxzZWVrLgotCi1fRklMRV9PRkZTRVRfQklUUz02NCBpcyBwYXNzZWQgdG8gbmVlZGVkIHBs
YXRmb3JtcyBzaW5jZSBjb25maWd1cmUgdXNlcwotQUNfU1lTX0xBUkdFRklMRSBtYWNyby4gVGhl
cmVmb3JlIG9mZl90IGlzIGFscmVhZHkgNjQtYml0IGFuZCBsc2VlayBpcwotc2FtZSBhcyBsc2Vl
azY0LgotCi1BZGRpdGlvbmFsbHkgdGhpcyBmaXhlcyBidWlscyB3aXRoIGxhdGVzdCBtdXNsIHdo
ZXJlIHRoZXNlIGxmczY0Ci1mdW5jdGlvbnMgYXJlIG1vdmVkIG91dCBmcm9tIF9HTlVfU09VUkNF
IGFuZCB1bmRlciBfTEFSR0VGSUxFNjRfU09VUkNFCi1tYWNybyBhbG9uZS4gVGhpcyBtYWtlcyB0
aGUgYnVpbGRzIGZhaWwgb24gMzItYml0IHBsYXRmb3JtcyBldmVuIHRob3VnaAotZGVmYXVsdCBv
ZmZfdCBvbiBtdXNsIGlzIDY0LWJpdCBhbHdheXMuCi0KLVVwc3RyZWFtLVN0YXR1czogU3VibWl0
dGVkIFtodHRwczovL2dpdGh1Yi5jb20vYWxzYS1wcm9qZWN0L2Fsc2EtdXRpbHMvcHVsbC8xODNd
Ci1TaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgotLS0tCi0gYXBs
YXkvYXBsYXkuYyAgICAgICAgICAgICAgIHwgNDQgKysrKysrKysrKysrKysrKysrLS0tLS0tLS0t
LS0tLS0tLS0tLQotIGF4ZmVyL2NvbnRhaW5lci12b2MuYyAgICAgICB8ICAyICstCi0gYXhmZXIv
Y29udGFpbmVyLmMgICAgICAgICAgIHwgIDYgKystLS0KLSBheGZlci9jb250YWluZXIuaCAgICAg
ICAgICAgfCAgMiArLQotIGF4ZmVyL3Rlc3QvY29udGFpbmVyLXRlc3QuYyB8ICA0ICsrLS0KLSBh
eGZlci90ZXN0L21hcHBlci10ZXN0LmMgICAgfCAgMiArLQotIDYgZmlsZXMgY2hhbmdlZCwgMzAg
aW5zZXJ0aW9ucygrKSwgMzAgZGVsZXRpb25zKC0pCi0KLWRpZmYgLS1naXQgYS9hcGxheS9hcGxh
eS5jIGIvYXBsYXkvYXBsYXkuYwotaW5kZXggNmNlNzE5MS4uYmQ5M2JlMyAxMDA2NDQKLS0tLSBh
L2FwbGF5L2FwbGF5LmMKLSsrKyBiL2FwbGF5L2FwbGF5LmMKLUBAIC0xNDEsNyArMTQxLDcgQEAg
c3RhdGljIGxvbmcgdGVybV9jX2xmbGFnID0gLTE7Ci0gc3RhdGljIGludCBkdW1wX2h3X3BhcmFt
cyA9IDA7Ci0gCi0gc3RhdGljIGludCBmZCA9IC0xOwotLXN0YXRpYyBvZmY2NF90IHBicmVjX2Nv
dW50ID0gTExPTkdfTUFYLCBmZGNvdW50OwotK3N0YXRpYyBvZmZfdCBwYnJlY19jb3VudCA9IExM
T05HX01BWCwgZmRjb3VudDsKLSBzdGF0aWMgaW50IHZvY21ham9yLCB2b2NtaW5vcjsKLSAKLSBz
dGF0aWMgY2hhciAqcGlkZmlsZV9uYW1lID0gTlVMTDsKLUBAIC0yMzU2LDcgKzIzNTYsNyBAQCBz
dGF0aWMgdm9pZCB2b2NfcGxheShpbnQgZmQsIGludCBvZnMsIGNoYXIgKm5hbWUpCi0gCXVfY2hh
ciAqZGF0YSwgKmJ1ZjsKLSAJY2hhciB3YXNfZXh0ZW5kZWQgPSAwLCBvdXRwdXQgPSAwOwotIAl1
X3Nob3J0ICpzcCwgcmVwZWF0ID0gMDsKLS0Jb2ZmNjRfdCBmaWxlcG9zID0gMDsKLSsJb2ZmX3Qg
ZmlsZXBvcyA9IDA7Ci0gCi0gI2RlZmluZSBDT1VOVCh4KQluZXh0YmxvY2sgLT0geDsgaW5fYnVm
ZmVyIC09IHg7IGRhdGEgKz0geAotICNkZWZpbmUgQ09VTlQxKHgpCWluX2J1ZmZlciAtPSB4OyBk
YXRhICs9IHgKLUBAIC0yNDkwLDcgKzI0OTAsNyBAQCBzdGF0aWMgdm9pZCB2b2NfcGxheShpbnQg
ZmQsIGludCBvZnMsIGNoYXIgKm5hbWUpCi0gCQkJCWRfcHJpbnRmKCJSZXBlYXQgbG9vcCAlZCB0
aW1lc1xuIiwgcmVwZWF0KTsKLSAjZW5kaWYKLSAJCQkJaWYgKGZpbGVwb3MgPj0gMCkgewkvKiBp
ZiA8IDAsIG9uZSBzZWVrIGZhaWxzLCB3aHkgdGVzdCBhbm90aGVyICovCi0tCQkJCQlpZiAoKGZp
bGVwb3MgPSBsc2VlazY0KGZkLCAwLCAxKSkgPCAwKSB7Ci0rCQkJCQlpZiAoKGZpbGVwb3MgPSBs
c2VlayhmZCwgMCwgMSkpIDwgMCkgewotIAkJCQkJCWVycm9yKF8oImNhbid0IHBsYXkgbG9vcHM7
ICVzIGlzbid0IHNlZWthYmxlXG4iKSwgbmFtZSk7Ci0gCQkJCQkJcmVwZWF0ID0gMDsKLSAJCQkJ
CX0gZWxzZSB7Ci1AQCAtMjUxMiw3ICsyNTEyLDcgQEAgc3RhdGljIHZvaWQgdm9jX3BsYXkoaW50
IGZkLCBpbnQgb2ZzLCBjaGFyICpuYW1lKQotIAkJCQkJZWxzZQotIAkJCQkJCWRfcHJpbnRmKCJO
ZXZlcmVuZGluZyBsb29wXG4iKTsKLSAjZW5kaWYKLS0JCQkJCWxzZWVrNjQoZmQsIGZpbGVwb3Ms
IDApOwotKwkJCQkJbHNlZWsoZmQsIGZpbGVwb3MsIDApOwotIAkJCQkJaW5fYnVmZmVyID0gMDsJ
LyogY2xlYXIgdGhlIGJ1ZmZlciAqLwotIAkJCQkJZ290byBGaWxsX3RoZV9idWZmZXI7Ci0gCQkJ
CX0KLUBAIC0yNTc4LDkgKzI1NzgsOSBAQCBzdGF0aWMgdm9pZCBpbml0X3Jhd19kYXRhKHZvaWQp
Ci0gfQotIAotIC8qIGNhbGN1bGF0ZSB0aGUgZGF0YSBjb3VudCB0byByZWFkIGZyb20vdG8gZHNw
ICovCi0tc3RhdGljIG9mZjY0X3QgY2FsY19jb3VudCh2b2lkKQotK3N0YXRpYyBvZmZfdCBjYWxj
X2NvdW50KHZvaWQpCi0gewotLQlvZmY2NF90IGNvdW50OwotKwlvZmZfdCBjb3VudDsKLSAKLSAJ
aWYgKHRpbWVsaW1pdCA9PSAwKQotIAkJaWYgKHNhbXBsZXNsaW1pdCA9PSAwKQotQEAgLTI1ODks
NyArMjU4OSw3IEBAIHN0YXRpYyBvZmY2NF90IGNhbGNfY291bnQodm9pZCkKLSAJCQljb3VudCA9
IHNuZF9wY21fZm9ybWF0X3NpemUoaHdwYXJhbXMuZm9ybWF0LCBzYW1wbGVzbGltaXQgKiBod3Bh
cmFtcy5jaGFubmVscyk7Ci0gCWVsc2UgewotIAkJY291bnQgPSBzbmRfcGNtX2Zvcm1hdF9zaXpl
KGh3cGFyYW1zLmZvcm1hdCwgaHdwYXJhbXMucmF0ZSAqIGh3cGFyYW1zLmNoYW5uZWxzKTsKLS0J
CWNvdW50ICo9IChvZmY2NF90KXRpbWVsaW1pdDsKLSsJCWNvdW50ICo9IChvZmZfdCl0aW1lbGlt
aXQ7Ci0gCX0KLSAJcmV0dXJuIGNvdW50IDwgcGJyZWNfY291bnQgPyBjb3VudCA6IHBicmVjX2Nv
dW50OwotIH0KLUBAIC0yNzUwLDcgKzI3NTAsNyBAQCBzdGF0aWMgdm9pZCBiZWdpbl9hdShpbnQg
ZmQsIHNpemVfdCBjbnQpCi0gLyogY2xvc2luZyAuVk9DICovCi0gc3RhdGljIHZvaWQgZW5kX3Zv
YyhpbnQgZmQpCi0gewotLQlvZmY2NF90IGxlbmd0aF9zZWVrOwotKwlvZmZfdCBsZW5ndGhfc2Vl
azsKLSAJVm9jQmxvY2tUeXBlIGJ0OwotIAlzaXplX3QgY250OwotIAljaGFyIGR1bW15ID0gMDsJ
CS8qIFdyaXRlIGEgVGVybWluYXRvciAqLwotQEAgLTI3NzAsMTUgKzI3NzAsMTUgQEAgc3RhdGlj
IHZvaWQgZW5kX3ZvYyhpbnQgZmQpCi0gCWJ0LmRhdGFsZW4gPSAodV9jaGFyKSAoY250ICYgMHhG
Rik7Ci0gCWJ0LmRhdGFsZW5fbSA9ICh1X2NoYXIpICgoY250ICYgMHhGRjAwKSA+PiA4KTsKLSAJ
YnQuZGF0YWxlbl9oID0gKHVfY2hhcikgKChjbnQgJiAweEZGMDAwMCkgPj4gMTYpOwotLQlpZiAo
bHNlZWs2NChmZCwgbGVuZ3RoX3NlZWssIFNFRUtfU0VUKSA9PSBsZW5ndGhfc2VlaykKLSsJaWYg
KGxzZWVrKGZkLCBsZW5ndGhfc2VlaywgU0VFS19TRVQpID09IGxlbmd0aF9zZWVrKQotIAkJeHdy
aXRlKGZkLCAmYnQsIHNpemVvZihWb2NCbG9ja1R5cGUpKTsKLSB9Ci0gCi0gc3RhdGljIHZvaWQg
ZW5kX3dhdmUoaW50IGZkKQotIHsJCQkJLyogb25seSBjbG9zZSBvdXRwdXQgKi8KLSAJV2F2ZUNo
dW5rSGVhZGVyIGNkOwotLQlvZmY2NF90IGxlbmd0aF9zZWVrOwotLQlvZmY2NF90IGZpbGVsZW47
Ci0rCW9mZl90IGxlbmd0aF9zZWVrOwotKwlvZmZfdCBmaWxlbGVuOwotIAl1X2ludCByaWZmbGVu
OwotIAkKLSAJbGVuZ3RoX3NlZWsgPSBzaXplb2YoV2F2ZUhlYWRlcikgKwotQEAgLTI3ODgsMjAg
KzI3ODgsMjAgQEAgc3RhdGljIHZvaWQgZW5kX3dhdmUoaW50IGZkKQotIAljZC5sZW5ndGggPSBm
ZGNvdW50ID4gMHg3ZmZmZmZmZiA/IExFX0lOVCgweDdmZmZmZmZmKSA6IExFX0lOVChmZGNvdW50
KTsKLSAJZmlsZWxlbiA9IGZkY291bnQgKyAyKnNpemVvZihXYXZlQ2h1bmtIZWFkZXIpICsgc2l6
ZW9mKFdhdmVGbXRCb2R5KSArIDQ7Ci0gCXJpZmZsZW4gPSBmaWxlbGVuID4gMHg3ZmZmZmZmZiA/
IExFX0lOVCgweDdmZmZmZmZmKSA6IExFX0lOVChmaWxlbGVuKTsKLS0JaWYgKGxzZWVrNjQoZmQs
IDQsIFNFRUtfU0VUKSA9PSA0KQotKwlpZiAobHNlZWsoZmQsIDQsIFNFRUtfU0VUKSA9PSA0KQot
IAkJeHdyaXRlKGZkLCAmcmlmZmxlbiwgNCk7Ci0tCWlmIChsc2VlazY0KGZkLCBsZW5ndGhfc2Vl
aywgU0VFS19TRVQpID09IGxlbmd0aF9zZWVrKQotKwlpZiAobHNlZWsoZmQsIGxlbmd0aF9zZWVr
LCBTRUVLX1NFVCkgPT0gbGVuZ3RoX3NlZWspCi0gCQl4d3JpdGUoZmQsICZjZCwgc2l6ZW9mKFdh
dmVDaHVua0hlYWRlcikpOwotIH0KLSAKLSBzdGF0aWMgdm9pZCBlbmRfYXUoaW50IGZkKQotIHsJ
CQkJLyogb25seSBjbG9zZSBvdXRwdXQgKi8KLSAJQXVIZWFkZXIgYWg7Ci0tCW9mZjY0X3QgbGVu
Z3RoX3NlZWs7Ci0rCW9mZl90IGxlbmd0aF9zZWVrOwotIAkKLSAJbGVuZ3RoX3NlZWsgPSAoY2hh
ciAqKSZhaC5kYXRhX3NpemUgLSAoY2hhciAqKSZhaDsKLSAJYWguZGF0YV9zaXplID0gZmRjb3Vu
dCA+IDB4ZmZmZmZmZmYgPyAweGZmZmZmZmZmIDogQkVfSU5UKGZkY291bnQpOwotLQlpZiAobHNl
ZWs2NChmZCwgbGVuZ3RoX3NlZWssIFNFRUtfU0VUKSA9PSBsZW5ndGhfc2VlaykKLSsJaWYgKGxz
ZWVrKGZkLCBsZW5ndGhfc2VlaywgU0VFS19TRVQpID09IGxlbmd0aF9zZWVrKQotIAkJeHdyaXRl
KGZkLCAmYWguZGF0YV9zaXplLCBzaXplb2YoYWguZGF0YV9zaXplKSk7Ci0gfQotIAotQEAgLTI4
MjgsMTEgKzI4MjgsMTEgQEAgc3RhdGljIHZvaWQgaGVhZGVyKGludCBydHlwZSwgY2hhciAqbmFt
ZSkKLSAKLSAvKiBwbGF5aW5nIHJhdyBkYXRhICovCi0gCi0tc3RhdGljIHZvaWQgcGxheWJhY2tf
Z28oaW50IGZkLCBzaXplX3QgbG9hZGVkLCBvZmY2NF90IGNvdW50LCBpbnQgcnR5cGUsIGNoYXIg
Km5hbWUpCi0rc3RhdGljIHZvaWQgcGxheWJhY2tfZ28oaW50IGZkLCBzaXplX3QgbG9hZGVkLCBv
ZmZfdCBjb3VudCwgaW50IHJ0eXBlLCBjaGFyICpuYW1lKQotIHsKLSAJaW50IGwsIHI7Ci0tCW9m
ZjY0X3Qgd3JpdHRlbiA9IDA7Ci0tCW9mZjY0X3QgYzsKLSsJb2ZmX3Qgd3JpdHRlbiA9IDA7Ci0r
CW9mZl90IGM7Ci0gCi0gCWhlYWRlcihydHlwZSwgbmFtZSk7Ci0gCXNldF9wYXJhbXMoKTsKLUBA
IC0zMjAyLDcgKzMyMDIsNyBAQCBzdGF0aWMgdm9pZCBjYXB0dXJlKGNoYXIgKm9yaWdfbmFtZSkK
LSAJaW50IGZpbGVjb3VudD0wOwkvKiBudW1iZXIgb2YgZmlsZXMgd3JpdHRlbiAqLwotIAljaGFy
ICpuYW1lID0gb3JpZ19uYW1lOwkvKiBjdXJyZW50IGZpbGVuYW1lICovCi0gCWNoYXIgbmFtZWJ1
ZltQQVRIX01BWCsyXTsKLS0Jb2ZmNjRfdCBjb3VudCwgcmVzdDsJCS8qIG51bWJlciBvZiBieXRl
cyB0byBjYXB0dXJlICovCi0rCW9mZl90IGNvdW50LCByZXN0OwkJLyogbnVtYmVyIG9mIGJ5dGVz
IHRvIGNhcHR1cmUgKi8KLSAJc3RydWN0IHN0YXQgc3RhdGJ1ZjsKLSAKLSAJLyogZ2V0IG51bWJl
ciBvZiBieXRlcyB0byBjYXB0dXJlICovCi1AQCAtMzI3Myw3ICszMjczLDcgQEAgc3RhdGljIHZv
aWQgY2FwdHVyZShjaGFyICpvcmlnX25hbWUpCi0gCQkvKiBjYXB0dXJlICovCi0gCQlmZGNvdW50
ID0gMDsKLSAJCXdoaWxlIChyZXN0ID4gMCAmJiByZWN5Y2xlX2NhcHR1cmVfZmlsZSA9PSAwICYm
ICFpbl9hYm9ydGluZykgewotLQkJCXNpemVfdCBjID0gKHJlc3QgPD0gKG9mZjY0X3QpY2h1bmtf
Ynl0ZXMpID8KLSsJCQlzaXplX3QgYyA9IChyZXN0IDw9IChvZmZfdCljaHVua19ieXRlcykgPwot
IAkJCQkoc2l6ZV90KXJlc3QgOiBjaHVua19ieXRlczsKLSAJCQlzaXplX3QgZiA9IGMgKiA4IC8g
Yml0c19wZXJfZnJhbWU7Ci0gCQkJc2l6ZV90IHJlYWQgPSBwY21fcmVhZChhdWRpb2J1ZiwgZik7
Ci1AQCAtMzMxNCw3ICszMzE0LDcgQEAgc3RhdGljIHZvaWQgY2FwdHVyZShjaGFyICpvcmlnX25h
bWUpCi0gCX0gd2hpbGUgKChmaWxlX3R5cGUgPT0gRk9STUFUX1JBVyAmJiAhdGltZWxpbWl0ICYm
ICFzYW1wbGVzbGltaXQpIHx8IGNvdW50ID4gMCk7Ci0gfQotIAotLXN0YXRpYyB2b2lkIHBsYXli
YWNrdl9nbyhpbnQqIGZkcywgdW5zaWduZWQgaW50IGNoYW5uZWxzLCBzaXplX3QgbG9hZGVkLCBv
ZmY2NF90IGNvdW50LCBpbnQgcnR5cGUsIGNoYXIgKipuYW1lcykKLStzdGF0aWMgdm9pZCBwbGF5
YmFja3ZfZ28oaW50KiBmZHMsIHVuc2lnbmVkIGludCBjaGFubmVscywgc2l6ZV90IGxvYWRlZCwg
b2ZmX3QgY291bnQsIGludCBydHlwZSwgY2hhciAqKm5hbWVzKQotIHsKLSAJaW50IHI7Ci0gCXNp
emVfdCB2c2l6ZTsKLUBAIC0zMzY4LDcgKzMzNjgsNyBAQCBzdGF0aWMgdm9pZCBwbGF5YmFja3Zf
Z28oaW50KiBmZHMsIHVuc2lnbmVkIGludCBjaGFubmVscywgc2l6ZV90IGxvYWRlZCwgb2ZmNjRf
dAotIAl9Ci0gfQotIAotLXN0YXRpYyB2b2lkIGNhcHR1cmV2X2dvKGludCogZmRzLCB1bnNpZ25l
ZCBpbnQgY2hhbm5lbHMsIG9mZjY0X3QgY291bnQsIGludCBydHlwZSwgY2hhciAqKm5hbWVzKQot
K3N0YXRpYyB2b2lkIGNhcHR1cmV2X2dvKGludCogZmRzLCB1bnNpZ25lZCBpbnQgY2hhbm5lbHMs
IG9mZl90IGNvdW50LCBpbnQgcnR5cGUsIGNoYXIgKipuYW1lcykKLSB7Ci0gCXNpemVfdCBjOwot
IAlzc2l6ZV90IHI7Ci1kaWZmIC0tZ2l0IGEvYXhmZXIvY29udGFpbmVyLXZvYy5jIGIvYXhmZXIv
Y29udGFpbmVyLXZvYy5jCi1pbmRleCBlYzBjZmZmLi41OTQxMDAzIDEwMDY0NAotLS0tIGEvYXhm
ZXIvY29udGFpbmVyLXZvYy5jCi0rKysgYi9heGZlci9jb250YWluZXItdm9jLmMKLUBAIC03NzUs
NyArNzc1LDcgQEAgc3RhdGljIGludCB3cml0ZV9ibG9ja190ZXJtaW5hdG9yKHN0cnVjdCBjb250
YWluZXJfY29udGV4dCAqY250cikKLSBzdGF0aWMgaW50IHdyaXRlX2RhdGFfc2l6ZShzdHJ1Y3Qg
Y29udGFpbmVyX2NvbnRleHQgKmNudHIsIHVpbnQ2NF90IGJ5dGVfY291bnQpCi0gewotIAlzdHJ1
Y3QgYnVpbGRlcl9zdGF0ZSAqc3RhdGUgPSBjbnRyLT5wcml2YXRlX2RhdGE7Ci0tCW9mZjY0X3Qg
b2Zmc2V0OwotKwlvZmZfdCBvZmZzZXQ7Ci0gCXVpbnQ4X3Qgc2l6ZV9maWVsZFszXTsKLSAJaW50
IGVycjsKLSAKLWRpZmYgLS1naXQgYS9heGZlci9jb250YWluZXIuYyBiL2F4ZmVyL2NvbnRhaW5l
ci5jCi1pbmRleCA4Yzg4ZDVjLi4zNzliNzJmIDEwMDY0NAotLS0tIGEvYXhmZXIvY29udGFpbmVy
LmMKLSsrKyBiL2F4ZmVyL2NvbnRhaW5lci5jCi1AQCAtMTEzLDExICsxMTMsMTEgQEAgZW51bSBj
b250YWluZXJfZm9ybWF0IGNvbnRhaW5lcl9mb3JtYXRfZnJvbV9wYXRoKGNvbnN0IGNoYXIgKnBh
dGgpCi0gCXJldHVybiBDT05UQUlORVJfRk9STUFUX1JBVzsKLSB9Ci0gCi0taW50IGNvbnRhaW5l
cl9zZWVrX29mZnNldChzdHJ1Y3QgY29udGFpbmVyX2NvbnRleHQgKmNudHIsIG9mZjY0X3Qgb2Zm
c2V0KQotK2ludCBjb250YWluZXJfc2Vla19vZmZzZXQoc3RydWN0IGNvbnRhaW5lcl9jb250ZXh0
ICpjbnRyLCBvZmZfdCBvZmZzZXQpCi0gewotLQlvZmY2NF90IHBvczsKLSsJb2ZmX3QgcG9zOwot
IAotLQlwb3MgPSBsc2VlazY0KGNudHItPmZkLCBvZmZzZXQsIFNFRUtfU0VUKTsKLSsJcG9zID0g
bHNlZWsoY250ci0+ZmQsIG9mZnNldCwgU0VFS19TRVQpOwotIAlpZiAocG9zIDwgMCkKLSAJCXJl
dHVybiAtZXJybm87Ci0gCWlmIChwb3MgIT0gb2Zmc2V0KQotZGlmZiAtLWdpdCBhL2F4ZmVyL2Nv
bnRhaW5lci5oIGIvYXhmZXIvY29udGFpbmVyLmgKLWluZGV4IDcxMDE3YTYuLmY2Y2U2ODkgMTAw
NjQ0Ci0tLS0gYS9heGZlci9jb250YWluZXIuaAotKysrIGIvYXhmZXIvY29udGFpbmVyLmgKLUBA
IC0xMDcsNyArMTA3LDcgQEAgaW50IGNvbnRhaW5lcl9yZWN1cnNpdmVfcmVhZChzdHJ1Y3QgY29u
dGFpbmVyX2NvbnRleHQgKmNudHIsIHZvaWQgKmJ1ZiwKLSAJCQkgICAgIHVuc2lnbmVkIGludCBi
eXRlX2NvdW50KTsKLSBpbnQgY29udGFpbmVyX3JlY3Vyc2l2ZV93cml0ZShzdHJ1Y3QgY29udGFp
bmVyX2NvbnRleHQgKmNudHIsIHZvaWQgKmJ1ZiwKLSAJCQkgICAgICB1bnNpZ25lZCBpbnQgYnl0
ZV9jb3VudCk7Ci0taW50IGNvbnRhaW5lcl9zZWVrX29mZnNldChzdHJ1Y3QgY29udGFpbmVyX2Nv
bnRleHQgKmNudHIsIG9mZjY0X3Qgb2Zmc2V0KTsKLStpbnQgY29udGFpbmVyX3NlZWtfb2Zmc2V0
KHN0cnVjdCBjb250YWluZXJfY29udGV4dCAqY250ciwgb2ZmX3Qgb2Zmc2V0KTsKLSAKLSBleHRl
cm4gY29uc3Qgc3RydWN0IGNvbnRhaW5lcl9wYXJzZXIgY29udGFpbmVyX3BhcnNlcl9yaWZmX3dh
dmU7Ci0gZXh0ZXJuIGNvbnN0IHN0cnVjdCBjb250YWluZXJfYnVpbGRlciBjb250YWluZXJfYnVp
bGRlcl9yaWZmX3dhdmU7Ci1kaWZmIC0tZ2l0IGEvYXhmZXIvdGVzdC9jb250YWluZXItdGVzdC5j
IGIvYXhmZXIvdGVzdC9jb250YWluZXItdGVzdC5jCi1pbmRleCBlNWI2MmRkLi40NWI2YzZhIDEw
MDY0NAotLS0tIGEvYXhmZXIvdGVzdC9jb250YWluZXItdGVzdC5jCi0rKysgYi9heGZlci90ZXN0
L2NvbnRhaW5lci10ZXN0LmMKLUBAIC0xNTMsNyArMTUzLDcgQEAgc3RhdGljIGludCBjYWxsYmFj
ayhzdHJ1Y3QgdGVzdF9nZW5lcmF0b3IgKmdlbiwgc25kX3BjbV9hY2Nlc3NfdCBhY2Nlc3MsCi0g
Ci0gCWZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKGVudHJpZXMpOyArK2kpIHsKLSAJCWludCBm
ZDsKLS0JCW9mZjY0X3QgcG9zOwotKwkJb2ZmX3QgcG9zOwotIAotIAkJZnJhbWVzX3Blcl9zZWNv
bmQgPSBlbnRyaWVzW2ldOwotIAotQEAgLTE3Miw3ICsxNzIsNyBAQCBzdGF0aWMgaW50IGNhbGxi
YWNrKHN0cnVjdCB0ZXN0X2dlbmVyYXRvciAqZ2VuLCBzbmRfcGNtX2FjY2Vzc190IGFjY2VzcywK
LSAJCQkgICAgIGZyYW1lc19wZXJfc2Vjb25kLCBmcmFtZV9idWZmZXIsIGZyYW1lX2NvdW50LAot
IAkJCSAgICAgdHJpYWwtPnZlcmJvc2UpOwotIAotLQkJcG9zID0gbHNlZWs2NChmZCwgMCwgU0VF
S19TRVQpOwotKwkJcG9zID0gbHNlZWsoZmQsIDAsIFNFRUtfU0VUKTsKLSAJCWlmIChwb3MgPCAw
KSB7Ci0gCQkJZXJyID0gLWVycm5vOwotIAkJCWJyZWFrOwotZGlmZiAtLWdpdCBhL2F4ZmVyL3Rl
c3QvbWFwcGVyLXRlc3QuYyBiL2F4ZmVyL3Rlc3QvbWFwcGVyLXRlc3QuYwotaW5kZXggNDc3ODcx
ZC4uNmEzODllOSAxMDA2NDQKLS0tLSBhL2F4ZmVyL3Rlc3QvbWFwcGVyLXRlc3QuYwotKysrIGIv
YXhmZXIvdGVzdC9tYXBwZXItdGVzdC5jCi1AQCAtMjU3LDcgKzI1Nyw3IEBAIHN0YXRpYyBpbnQg
dGVzdF9tYXBwZXIoc3RydWN0IG1hcHBlcl90cmlhbCAqdHJpYWwsIHNuZF9wY21fYWNjZXNzX3Qg
YWNjZXNzLAotIAkJZ290byBlbmQ7Ci0gCi0gCWZvciAoaSA9IDA7IGkgPCBjbnRyX2NvdW50OyAr
K2kpIHsKLS0JCW9mZjY0X3QgcG9zID0gbHNlZWs2NChjbnRyX2Zkc1tpXSwgMCwgU0VFS19TRVQp
OwotKwkJb2ZmX3QgcG9zID0gbHNlZWsoY250cl9mZHNbaV0sIDAsIFNFRUtfU0VUKTsKLSAJCWlm
IChwb3MgIT0gMCkgewotIAkJCWVyciA9IC1FSU87Ci0gCQkJZ290byBlbmQ7CmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9hbHNhL2Fsc2EtdXRpbHNfMS4yLjguYmIgYi9tZXRh
L3JlY2lwZXMtbXVsdGltZWRpYS9hbHNhL2Fsc2EtdXRpbHNfMS4yLjkuYmIKc2ltaWxhcml0eSBp
bmRleCA5NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvYWxzYS9hbHNhLXV0
aWxzXzEuMi44LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9hbHNhL2Fsc2Et
dXRpbHNfMS4yLjkuYmIKaW5kZXggNDZkMzliMGRlOC4uZTlmZDM4MmExOCAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvYWxzYS9hbHNhLXV0aWxzXzEuMi44LmJiCisrKyBiL21l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2Fsc2EvYWxzYS11dGlsc18xLjIuOS5iYgpAQCAtMjQsMTAg
KzI0LDggQEAgUEFDS0FHRUNPTkZJR1t1ZGV2XSA9ICItLXdpdGgtdWRldi1ydWxlcy1kaXI9YHBr
Zy1jb25maWcgLS12YXJpYWJsZT11ZGV2ZGlyIHVkZXYKIFBBQ0tBR0VDT05GSUdbbWFucGFnZXNd
ID0gIi0tZW5hYmxlLXhtbHRvLCAtLWRpc2FibGUteG1sdG8sIHhtbHRvLW5hdGl2ZSBkb2Nib29r
LXhtbC1kdGQ0LW5hdGl2ZSBkb2Nib29rLXhzbC1zdHlsZXNoZWV0cy1uYXRpdmUiCiAKICMgYWxz
YS11dGlscyBzcGVjaWZpZWQgaW4gU1JDX1VSSSBkdWUgdG8gYWxzYS11dGlscy1zY3JpcHRzIHJl
Y2lwZQotU1JDX1VSSSA9ICJodHRwczovL3d3dy5hbHNhLXByb2plY3Qub3JnL2ZpbGVzL3B1Yi91
dGlscy9hbHNhLXV0aWxzLSR7UFZ9LnRhci5iejIgXAotICAgICAgICAgICBmaWxlOi8vMDAwMS1h
cGxheS1heGZlci1SZXBsYWNlLW9mZjY0X3Qtd2l0aC1vZmZfdC5wYXRjaCBcCi0gICAgICAgICAg
ICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJlMTQwZmE2MDRjMzUxZjM2YmQ3MjE2N2M4ODYwYzY5
ZDgxYjk2NGFlNmFiNTM5OTJkNjQzNGRkZTM4ZTkzMzNjIgorU1JDX1VSSSA9ICJodHRwczovL3d3
dy5hbHNhLXByb2plY3Qub3JnL2ZpbGVzL3B1Yi91dGlscy9hbHNhLXV0aWxzLSR7UFZ9LnRhci5i
ejIiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZTc2MjNkNDUyNTU5NWY5MmUxMWNlMjVlZTlhOTdm
MjA0MGExNGM2ZTRkY2QwMjdhYTk2ZTA2Y2JjZTc4MTdiZCIKIAogIyBPbiBidWlsZCBtYWNoaW5l
cyB3aXRoIHB5dGhvbi1kb2N1dGlscyAobm90IHB5dGhvbjMtZG9jdXRpbHMgISEpIGluc3RhbGxl
ZAogIyByc3QybWFuIChub3QgcnN0Mm1hbi5weSkgaXMgZGV0ZWN0ZWQgYW5kIGNvbXBpbGUgZmFp
bHMgd2l0aAotLSAKMi4zOS4yCgo=

--===============8116256183547129072==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1803 entries from dependency cache.
Parsing recipes...done.
Parsing of 900 .bb files complete (899 cached, 1 parsed). 1803 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:b0b085ed10e4db39674e0bc889712cec80b09dd1"
workspace            = "master:35e5d29a7d654fc79bdb898d0f1fb277270dbfd5"

Initialising tasks...done.
Sstate summary: Wanted 156 Local 148 Mirrors 0 Missed 8 Current 294 (94% match, 98% complete)
Removing 1 stale sstate objects for arch core2-32...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1337 of 1630 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.9.bb:do_fetch)
NOTE: recipe alsa-utils-1.2.9-r0: task do_fetch: Started
NOTE: recipe alsa-utils-1.2.9-r0: task do_fetch: Succeeded
NOTE: Running task 1616 of 1630 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.9.bb:do_unpack)
NOTE: Running task 1617 of 1630 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-utils-1.2.9-r0: task do_unpack: Started
NOTE: recipe alsa-utils-1.2.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-1.2.9-r0: task do_unpack: Succeeded
NOTE: Running task 1618 of 1630 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.9.bb:do_patch)
NOTE: recipe alsa-utils-1.2.9-r0: task do_patch: Started
NOTE: recipe alsa-utils-1.2.9-r0: task do_patch: Succeeded
NOTE: Running task 1619 of 1630 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 1620 of 1630 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.9.bb:do_populate_lic)
NOTE: recipe alsa-utils-1.2.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-utils-1.2.9-r0: task do_populate_lic: Started
NOTE: recipe alsa-utils-1.2.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-utils-1.2.9-r0: task do_populate_lic: Succeeded
NOTE: recipe alsa-utils-1.2.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1621 of 1630 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.9.bb:do_configure)
NOTE: recipe alsa-utils-1.2.9-r0: task do_configure: Started
NOTE: recipe alsa-utils-1.2.9-r0: task do_configure: Succeeded
NOTE: Running task 1622 of 1630 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.9.bb:do_compile)
NOTE: recipe alsa-utils-1.2.9-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common', 'common-linux', 'common-glibc', 'i686-linux', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_compile
| NOTE: make -j 56
| Making all in include
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/build/include'
| make  all-am
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/build/include'
| Updating version.h
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/build/include'
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/build/include'
| Making all in alsactl
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/build/alsactl'
| Making all in init
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/build/alsactl/init'
| make[2]: Nothing to be done for 'all'.
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/build/alsactl/init'
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/build/alsactl'
| i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../alsa-utils-1.2.9/alsactl -I../include    -D_GNU_SOURCE -D__USE_GNU -DSYS_ASOUNDRC=\"/var/lib/alsa/asound.state\" -DSYS_LOCKPATH=\"/var/lock\" -DSYS_LOCKFILE=\"asound.state.lock\" -DSYS_PIDFILE=\"/var/run/alsactl.pid\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/alsa-utils-1.2.9=/usr/src/debug/alsa-utils/1.2.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/alsa-utils-1.2.9=/usr/src/debug/alsa-utils/1.2.9-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/
 build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/build=/usr/src/debug/alsa-utils/1.2.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/build=/usr/src/debug/alsa-utils/1.2.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot-native=  -c -o alsactl-alsactl.o `test -f 'alsactl.c' || echo '../../alsa-utils-1.2.9/alsactl/'`alsactl.c
| i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../alsa-utils-1.2.9/alsactl -I../include    -D_GNU_SOURCE -D__USE_GNU -DSYS_ASOUNDRC=\"/var/lib/alsa/asound.state\" -DSYS_LOCKPATH=\"/var/lock\" -DSYS_LOCKFILE=\"asound.state.lock\" -DSYS_PIDFILE=\"/var/run/alsactl.pid\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/alsa-utils-1.2.9=/usr/src/debug/alsa-utils/1.2.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/alsa-utils-1.2.9=/usr/src/debug/alsa-utils/1.2.9-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/
 build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/build=/usr/src/debug/alsa-utils/1.2.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/build=/usr/src/debug/alsa-utils/1.2.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot-native=  -c -o alsactl-state.o `test -f 'state.c' || echo '../../alsa-utils-1.2.9/alsactl/'`state.c
| i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../alsa-utils-1.2.9/alsactl -I../include    -D_GNU_SOURCE -D__USE_GNU -DSYS_ASOUNDRC=\"/var/lib/alsa/asound.state\" -DSYS_LOCKPATH=\"/var/lock\" -DSYS_LOCKFILE=\"asound.state.lock\" -DSYS_PIDFILE=\"/var/run/alsactl.pid\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/alsa-utils-1.2.9=/usr/src/debug/alsa-utils/1.2.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/alsa-utils-1.2.9=/usr/src/debug/alsa-utils/1.2.9-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/
 build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/build=/usr/src/debug/alsa-utils/1.2.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/build=/usr/src/debug/alsa-utils/1.2.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot-native=  -c -o alsactl-lock.o `test -f 'lock.c' || echo '../../alsa-utils-1.2.9/alsactl/'`lock.c
| i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../alsa-utils-1.2.9/alsactl -I../include    -D_GNU_SOURCE -D__USE_GNU -DSYS_ASOUNDRC=\"/var/lib/alsa/asound.state\" -DSYS_LOCKPATH=\"/var/lock\" -DSYS_LOCKFILE=\"asound.state.lock\" -DSYS_PIDFILE=\"/var/run/alsactl.pid\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/alsa-utils-1.2.9=/usr/src/debug/alsa-utils/1.2.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/alsa-utils-1.2.9=/usr/src/debug/alsa-utils/1.2.9-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/
 build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/build=/usr/src/debug/alsa-utils/1.2.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/build=/usr/src/debug/alsa-utils/1.2.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot-native=  -c -o alsactl-utils.o `test -f 'utils.c' || echo '../../alsa-utils-1.2.9/alsactl/'`utils.c
| i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../alsa-utils-1.2.9/alsactl -I../include    -D_GNU_SOURCE -D__USE_GNU -DSYS_ASOUNDRC=\"/var/lib/alsa/asound.state\" -DSYS_LOCKPATH=\"/var/lock\" -DSYS_LOCKFILE=\"asound.state.lock\" -DSYS_PIDFILE=\"/var/run/alsactl.pid\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/alsa-utils-1.2.9=/usr/src/debug/alsa-utils/1.2.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/alsa-utils-1.2.9=/usr/src/debug/alsa-utils/1.2.9-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/
 build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/build=/usr/src/debug/alsa-utils/1.2.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/build=/usr/src/debug/alsa-utils/1.2.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot-native=  -c -o alsactl-init_parse.o `test -f 'init_parse.c' || echo '../../alsa-utils-1.2.9/alsactl/'`init_parse.c
| i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../alsa-utils-1.2.9/alsactl -I../include    -D_GNU_SOURCE -D__USE_GNU -DSYS_ASOUNDRC=\"/var/lib/alsa/asound.state\" -DSYS_LOCKPATH=\"/var/lock\" -DSYS_LOCKFILE=\"asound.state.lock\" -DSYS_PIDFILE=\"/var/run/alsactl.pid\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/alsa-utils-1.2.9=/usr/src/debug/alsa-utils/1.2.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/alsa-utils-1.2.9=/usr/src/debug/alsa-utils/1.2.9-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/
 build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/build=/usr/src/debug/alsa-utils/1.2.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/build=/usr/src/debug/alsa-utils/1.2.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot-native=  -c -o alsactl-init_ucm.o `test -f 'init_ucm.c' || echo '../../alsa-utils-1.2.9/alsactl/'`init_ucm.c
| i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../alsa-utils-1.2.9/alsactl -I../include    -D_GNU_SOURCE -D__USE_GNU -DSYS_ASOUNDRC=\"/var/lib/alsa/asound.state\" -DSYS_LOCKPATH=\"/var/lock\" -DSYS_LOCKFILE=\"asound.state.lock\" -DSYS_PIDFILE=\"/var/run/alsactl.pid\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/alsa-utils-1.2.9=/usr/src/debug/alsa-utils/1.2.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/alsa-utils-1.2.9=/usr/src/debug/alsa-utils/1.2.9-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/
 build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/build=/usr/src/debug/alsa-utils/1.2.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/build=/usr/src/debug/alsa-utils/1.2.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot-native=  -c -o alsactl-daemon.o `test -f 'daemon.c' || echo '../../alsa-utils-1.2.9/alsactl/'`daemon.c
| i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../alsa-utils-1.2.9/alsactl -I../include    -D_GNU_SOURCE -D__USE_GNU -DSYS_ASOUNDRC=\"/var/lib/alsa/asound.state\" -DSYS_LOCKPATH=\"/var/lock\" -DSYS_LOCKFILE=\"asound.state.lock\" -DSYS_PIDFILE=\"/var/run/alsactl.pid\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/alsa-utils-1.2.9=/usr/src/debug/alsa-utils/1.2.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/alsa-utils-1.2.9=/usr/src/debug/alsa-utils/1.2.9-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/
 build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/build=/usr/src/debug/alsa-utils/1.2.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/build=/usr/src/debug/alsa-utils/1.2.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot-native=  -c -o alsactl-monitor.o `test -f 'monitor.c' || echo '../../alsa-utils-1.2.9/alsactl/'`monitor.c
| i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../alsa-utils-1.2.9/alsactl -I../include    -D_GNU_SOURCE -D__USE_GNU -DSYS_ASOUNDRC=\"/var/lib/alsa/asound.state\" -DSYS_LOCKPATH=\"/var/lock\" -DSYS_LOCKFILE=\"asound.state.lock\" -DSYS_PIDFILE=\"/var/run/alsactl.pid\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/alsa-utils-1.2.9=/usr/src/debug/alsa-utils/1.2.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/alsa-utils-1.2.9=/usr/src/debug/alsa-utils/1.2.9-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/
 build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/build=/usr/src/debug/alsa-utils/1.2.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/build=/usr/src/debug/alsa-utils/1.2.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot-native=  -c -o alsactl-clean.o `test -f 'clean.c' || echo '../../alsa-utils-1.2.9/alsactl/'`clean.c
| i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../alsa-utils-1.2.9/alsactl -I../include    -D_GNU_SOURCE -D__USE_GNU -DSYS_ASOUNDRC=\"/var/lib/alsa/asound.state\" -DSYS_LOCKPATH=\"/var/lock\" -DSYS_LOCKFILE=\"asound.state.lock\" -DSYS_PIDFILE=\"/var/run/alsactl.pid\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/alsa-utils-1.2.9=/usr/src/debug/alsa-utils/1.2.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/alsa-utils-1.2.9=/usr/src/debug/alsa-utils/1.2.9-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/
 build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/build=/usr/src/debug/alsa-utils/1.2.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/build=/usr/src/debug/alsa-utils/1.2.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot-native=  -c -o alsactl-info.o `test -f 'info.c' || echo '../../alsa-utils-1.2.9/alsactl/'`info.c
| sed -r -e 's,@sbindir\@,/usr/sbin,g' -e 's,@mydatadir\@,/usr/share/alsa,g' -e 's,@daemonswitch\@,/etc/alsa/state-daemon.conf,g' -e 's,@asoundrcfile\@,/var/lib/alsa/asound.state,g' < ../../alsa-utils-1.2.9/alsactl/alsa-state.service.in > alsa-state.service || rm alsa-state.service
| sed -r -e 's,@sbindir\@,/usr/sbin,g' -e 's,@mydatadir\@,/usr/share/alsa,g' -e 's,@daemonswitch\@,/etc/alsa/state-daemon.conf,g' -e 's,@asoundrcfile\@,/var/lib/alsa/asound.state,g' < ../../alsa-utils-1.2.9/alsactl/alsa-restore.service.in > alsa-restore.service || rm alsa-restore.service
| sed -r -e 's,@sbindir\@,/usr/sbin,g' -e 's,@mydatadir\@,/usr/share/alsa,g' -e 's,@daemonswitch\@,/etc/alsa/state-daemon.conf,g' -e 's,@asoundrcfile\@,/var/lib/alsa/asound.state,g' < ../../alsa-utils-1.2.9/alsactl/90-alsa-restore.rules.in > 90-alsa-restore.rules || rm 90-alsa-restore.rules
| ../../alsa-utils-1.2.9/alsactl/alsactl.c:33:10: fatal error: os_compat.h: No such file or directory
|    33 | #include "os_compat.h"
|       |          ^~~~~~~~~~~~~
| compilation terminated.
| make[2]: *** [Makefile:615: alsactl-alsactl.o] Error 1
| make[2]: *** Waiting for unfinished jobs....
| ../../alsa-utils-1.2.9/alsactl/lock.c:34:10: fatal error: os_compat.h: No such file or directory
|    34 | #include "os_compat.h"
|       |          ^~~~~~~~~~~~~
| compilation terminated.
| make[2]: *** [Makefile:643: alsactl-lock.o] Error 1
| ../../alsa-utils-1.2.9/alsactl/utils.c: In function 'initfailed':
| ../../alsa-utils-1.2.9/alsactl/utils.c:94:15: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|    94 |         (void)write(fp, str, strlen(str));
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| ../../alsa-utils-1.2.9/alsactl/utils.c:95:15: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|    95 |         (void)write(fp, ":", 1);
|       |               ^~~~~~~~~~~~~~~~~
| ../../alsa-utils-1.2.9/alsactl/utils.c:96:15: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|    96 |         (void)write(fp, reason, strlen(reason));
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| ../../alsa-utils-1.2.9/alsactl/utils.c:97:15: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|    97 |         (void)write(fp, ":", 1);
|       |               ^~~~~~~~~~~~~~~~~
| ../../alsa-utils-1.2.9/alsactl/utils.c:98:15: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|    98 |         (void)write(fp, sexitcode, strlen(sexitcode));
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| ../../alsa-utils-1.2.9/alsactl/utils.c:99:15: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|    99 |         (void)write(fp, "\n", 1);
|       |               ^~~~~~~~~~~~~~~~~~
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/build/alsactl'
| make[1]: *** [Makefile:891: all-recursive] Error 1
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/build/alsactl'
| make: *** [Makefile:457: all-recursive] Error 1
| ERROR: oe_runmake failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/temp/run.do_compile.1216474:183 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/temp/run.do_compile.1216474, line 183
| 	#2: die, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/temp/run.do_compile.1216474, line 167
| 	#3: oe_runmake, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/temp/run.do_compile.1216474, line 162
| 	#4: autotools_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/temp/run.do_compile.1216474, line 157
| 	#5: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/temp/run.do_compile.1216474, line 152
| 	#6: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/temp/run.do_compile.1216474, line 196
NOTE: recipe alsa-utils-1.2.9-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1622 tasks of which 1614 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.9.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: alsa-utils-1.2.9-r0 do_compile: oe_runmake failed
ERROR: alsa-utils-1.2.9-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/temp/run.do_compile.1216474', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/temp/log.do_compile.1216474
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.9.bb:do_compile) failed with exit code '1'

--===============8116256183547129072==--

