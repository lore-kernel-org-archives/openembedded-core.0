Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36CB3CD6E69
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:36:02 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1569.1780328137833093025
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=LmfRNKGf;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=R1h7lEwk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019e83d3d21d-94a06e13-f523-4621-892e-01e6fc0996e0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328157;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=eXQaRjPJAEsSFDMXDHsOjmQVkdr+3hTS+eBCD7gmSSw=;
	b=LmfRNKGf+obF7c19Ufz/yOvd18QRrFCXGGGT6GJwqdqezmWyLq31c4BbgPm/rG7s
	mo2/w/MIPfHrNoR8ZactejqnjDr4LQsb9Xyoge9Hj+xNqTeFUgr5R6NA6ChXj4mLss3
	oJR51Liv+7x6XxF544EF8cdekwImKIBR3VhDGsbk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328157;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=eXQaRjPJAEsSFDMXDHsOjmQVkdr+3hTS+eBCD7gmSSw=;
	b=R1h7lEwkxvlEKqWntv1vGS3YJ58OsLPe/tio1mmsEviHso6c04IzIuthY66cUges
	ESUdmIoaiBIfQgXruAqhpJTl9Teacst9x2/8liZzupzSwyzm8a84kK52DIzpyATMUJc
	k68j8yr+fs3bW663Y8IEhKa7VrkglGNDvOdkdWXc=
Content-Type: multipart/mixed; boundary="===============4312178805981881486=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libmd: upgrading to 1.2.0 SUCCEEDED
Message-ID: <0101019e83d3d21d-94a06e13-f523-4621-892e-01e6fc0996e0-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:36:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237965

--===============4312178805981881486==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sCgp0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFk
ZSBIZWxwZXIKdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBl
KHMpICpsaWJtZCogdG8gKjEuMi4wKiBoYXMgU3VjY2VlZGVkLgoKTmV4dCBzdGVwczoKICAgIC0g
YXBwbHkgdGhlIHBhdGNoOiBnaXQgYW0gMDAwMS1saWJtZC11cGdyYWRlLTEuMS4wLTEuMi4wLnBh
dGNoCiAgICAtIGNoZWNrIHRoZSBjaGFuZ2VzIHRvIHVwc3RyZWFtIHBhdGNoZXMgYW5kIHN1bW1h
cml6ZSB0aGVtIGluIHRoZSBjb21taXQgbWVzc2FnZSwKICAgIC0gY29tcGlsZSBhbiBpbWFnZSB0
aGF0IGNvbnRhaW5zIHRoZSBwYWNrYWdlCiAgICAtIHBlcmZvcm0gc29tZSBiYXNpYyBzYW5pdHkg
dGVzdHMKICAgIC0gYW1lbmQgdGhlIHBhdGNoIGFuZCBzaWduIGl0IG9mZjogZ2l0IGNvbW1pdCAt
cyAtLXJlc2V0LWF1dGhvciAtLWFtZW5kCiAgICAtIHNlbmQgaXQgdG8gdGhlIGFwcHJvcHJpYXRl
IG1haWxpbmcgbGlzdAoKQWx0ZXJuYXRpdmVseSwgaWYgeW91IGJlbGlldmUgdGhlIHJlY2lwZSBz
aG91bGQgbm90IGJlIHVwZ3JhZGVkIGF0IHRoaXMgdGltZSwKeW91IGNhbiBmaWxsIFJFQ0lQRV9O
T19VUERBVEVfUkVBU09OIGluIHJlc3BlY3RpdmUgcmVjaXBlIGZpbGUgc28gdGhhdAphdXRvbWF0
aWMgdXBncmFkZXMgd291bGQgbm8gbG9uZ2VyIGJlIGF0dGVtcHRlZC4KClBsZWFzZSByZXZpZXcg
dGhlIGF0dGFjaGVkIGZpbGVzIGZvciBmdXJ0aGVyIGluZm9ybWF0aW9uIGFuZCBidWlsZC91cGRh
dGUgZmFpbHVyZXMuCkFueSBwcm9ibGVtIHBsZWFzZSBmaWxlIGEgYnVnIGF0IGh0dHBzOi8vYnVn
emlsbGEueW9jdG9wcm9qZWN0Lm9yZy9lbnRlcl9idWcuY2dpP3Byb2R1Y3Q9QXV0b21hdGVkJTIw
VXBkYXRlJTIwSGFuZGxlcgoKUmVnYXJkcywKVGhlIFVwZ3JhZGUgSGVscGVyCgotLSA+OCAtLQpG
cm9tIDM0NGM3OWEwM2JiN2UzMDg3MDgzYmMwMjk0NzJkYmE4ZGMxN2ZhMGYgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCkZyb206IFVwZ3JhZGUgSGVscGVyIDxhdWhAeW9jdG9wcm9qZWN0Lm9yZz4K
RGF0ZTogTW9uLCAxIEp1biAyMDI2IDE1OjAwOjI5ICswMDAwClN1YmplY3Q6IFtQQVRDSF0gbGli
bWQ6IHVwZ3JhZGUgMS4xLjAgLT4gMS4yLjAKCi0tLQogLi4uL2xpYm1kL3tsaWJtZF8xLjEuMC5i
YiA9PiBsaWJtZF8xLjIuMC5iYn0gIHwgMTA1ICsrKysrKysrKysrKysrKysrLQogMSBmaWxlIGNo
YW5nZWQsIDEwMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1zdXBwb3J0L2xpYm1kL3tsaWJtZF8xLjEuMC5iYiA9PiBsaWJtZF8xLjIuMC5iYn0gKDE3
JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJtZC9saWJtZF8xLjEuMC5i
YiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYm1kL2xpYm1kXzEuMi4wLmJiCnNpbWlsYXJpdHkg
aW5kZXggMTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYm1kL2xpYm1kXzEu
MS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJtZC9saWJtZF8xLjIuMC5i
YgppbmRleCBmZmM1OWRlYjI2Li40YmIwZTE5OGNlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9saWJtZC9saWJtZF8xLjEuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9s
aWJtZC9saWJtZF8xLjIuMC5iYgpAQCAtMSwzICsxLDEwNCBAQAorIyBGSVhNRTogdGhlIExJQ19G
SUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUn
LgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQg
dGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUg
aWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVz
c2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBk
YXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMg
LS0tIENPUFlJTkcKKyMgKysrIENPUFlJTkcKKyMgQEAgLTMsNyArMyw3IEBACisjICBGaWxlczoK
KyMgICAqCisjICBDb3B5cmlnaHQ6CisjIC0gQ29weXJpZ2h0IMKpIDIwMDksIDIwMTEsIDIwMTYg
R3VpbGxlbSBKb3ZlciA8Z3VpbGxlbUBoYWRyb25zLm9yZz4KKyMgKyAyMDA5LTIwMjYgR3VpbGxl
bSBKb3ZlciA8Z3VpbGxlbUBoYWRyb25zLm9yZz4KKyMgIExpY2Vuc2U6IEJTRC0zLWNsYXVzZQor
IyAgIFJlZGlzdHJpYnV0aW9uIGFuZCB1c2UgaW4gc291cmNlIGFuZCBiaW5hcnkgZm9ybXMsIHdp
dGggb3Igd2l0aG91dAorIyAgIG1vZGlmaWNhdGlvbiwgYXJlIHBlcm1pdHRlZCBwcm92aWRlZCB0
aGF0IHRoZSBmb2xsb3dpbmcgY29uZGl0aW9ucworIyBAQCAtMzEsOCArMzEsNyBAQAorIyAgIGlu
Y2x1ZGUvc2hhMi5oCisjICAgc3JjL3NoYTIuYworIyAgQ29weXJpZ2h0OgorIyAtIENvcHlyaWdo
dCDCqSAyMDAwLTIwMDEsIEFhcm9uIEQuIEdpZmZvcmQKKyMgLSBBbGwgcmlnaHRzIHJlc2VydmVk
LgorIyArIDIwMDAtMjAwMSBBYXJvbiBELiBHaWZmb3JkCisjICBMaWNlbnNlOiBCU0QtMy1jbGF1
c2UtQWFyb24tRC1HaWZmb3JkCisjICAgUmVkaXN0cmlidXRpb24gYW5kIHVzZSBpbiBzb3VyY2Ug
YW5kIGJpbmFyeSBmb3Jtcywgd2l0aCBvciB3aXRob3V0CisjICAgbW9kaWZpY2F0aW9uLCBhcmUg
cGVybWl0dGVkIHByb3ZpZGVkIHRoYXQgdGhlIGZvbGxvd2luZyBjb25kaXRpb25zCisjIEBAIC02
Miw3ICs2MSw3IEBACisjICAgaW5jbHVkZS9ybWQxNjAuaAorIyAgIHNyYy9ybWQxNjAuYworIyAg
Q29weXJpZ2h0OgorIyAtIENvcHlyaWdodCDCqSAyMDAxIE1hcmt1cyBGcmllZGwuICBBbGwgcmln
aHRzIHJlc2VydmVkLgorIyArIDIwMDEgTWFya3VzIEZyaWVkbAorIyAgTGljZW5zZTogQlNELTIt
Y2xhdXNlCisjICAgUmVkaXN0cmlidXRpb24gYW5kIHVzZSBpbiBzb3VyY2UgYW5kIGJpbmFyeSBm
b3Jtcywgd2l0aCBvciB3aXRob3V0CisjICAgbW9kaWZpY2F0aW9uLCBhcmUgcGVybWl0dGVkIHBy
b3ZpZGVkIHRoYXQgdGhlIGZvbGxvd2luZyBjb25kaXRpb25zCisjIEBAIC04NSwxMiArODQsNDYg
QEAKKyMgICBUSElTIFNPRlRXQVJFLCBFVkVOIElGIEFEVklTRUQgT0YgVEhFIFBPU1NJQklMSVRZ
IE9GIFNVQ0ggREFNQUdFLgorIyAgCisjICBGaWxlczoKKyMgKyBpbmNsdWRlL3NoYTMuaAorIyAr
IG1hbi9TSEEzX1NlbGZ0ZXN0LjMKKyMgKyBtYW4vc2hhMy4zCisjICsgbWFuL3NoYWtlLjMKKyMg
KyBzcmMva2VjY2FrLmMKKyMgKyBzcmMva2VjY2FrLmgKKyMgKyBzcmMvbG9jYWwtZW5kaWFuLmgK
KyMgKyBzcmMvc2hhMy5jCisjICtDb3B5cmlnaHQ6CisjICsgQ29weXJpZ2h0IMKpIDIwMDIgVGhv
bWFzIE1vZXN0bCA8dG1tQEZyZWVCU0Qub3JnPgorIyArIENvcHlyaWdodCDCqSAyMDExIEd1aWxs
ZW0gSm92ZXIgPGd1aWxsZW1AaGFkcm9ucy5vcmc+CisjICsgQ29weXJpZ2h0IMKpIDIwMTUgVGF5
bG9yIFIuIENhbXBiZWxsCisjICtMaWNlbnNlOiBCU0QtMi1jbGF1c2UtY29udHJpYnV0b3JzCisj
ICsgUmVkaXN0cmlidXRpb24gYW5kIHVzZSBpbiBzb3VyY2UgYW5kIGJpbmFyeSBmb3Jtcywgd2l0
aCBvciB3aXRob3V0CisjICsgbW9kaWZpY2F0aW9uLCBhcmUgcGVybWl0dGVkIHByb3ZpZGVkIHRo
YXQgdGhlIGZvbGxvd2luZyBjb25kaXRpb25zCisjICsgYXJlIG1ldDoKKyMgKyAxLiBSZWRpc3Ry
aWJ1dGlvbnMgb2Ygc291cmNlIGNvZGUgbXVzdCByZXRhaW4gdGhlIGFib3ZlIGNvcHlyaWdodAor
IyArICAgIG5vdGljZSwgdGhpcyBsaXN0IG9mIGNvbmRpdGlvbnMgYW5kIHRoZSBmb2xsb3dpbmcg
ZGlzY2xhaW1lci4KKyMgKyAyLiBSZWRpc3RyaWJ1dGlvbnMgaW4gYmluYXJ5IGZvcm0gbXVzdCBy
ZXByb2R1Y2UgdGhlIGFib3ZlIGNvcHlyaWdodAorIyArICAgIG5vdGljZSwgdGhpcyBsaXN0IG9m
IGNvbmRpdGlvbnMgYW5kIHRoZSBmb2xsb3dpbmcgZGlzY2xhaW1lciBpbiB0aGUKKyMgKyAgICBk
b2N1bWVudGF0aW9uIGFuZC9vciBvdGhlciBtYXRlcmlhbHMgcHJvdmlkZWQgd2l0aCB0aGUgZGlz
dHJpYnV0aW9uLgorIyArIC4KKyMgKyBUSElTIFNPRlRXQVJFIElTIFBST1ZJREVEIEJZIFRIRSBB
VVRIT1IgQU5EIENPTlRSSUJVVE9SUyBgYEFTIElTJycgQU5ECisjICsgQU5ZIEVYUFJFU1MgT1Ig
SU1QTElFRCBXQVJSQU5USUVTLCBJTkNMVURJTkcsIEJVVCBOT1QgTElNSVRFRCBUTywgVEhFCisj
ICsgSU1QTElFRCBXQVJSQU5USUVTIE9GIE1FUkNIQU5UQUJJTElUWSBBTkQgRklUTkVTUyBGT1Ig
QSBQQVJUSUNVTEFSIFBVUlBPU0UKKyMgKyBBUkUgRElTQ0xBSU1FRC4gIElOIE5PIEVWRU5UIFNI
QUxMIFRIRSBBVVRIT1IgT1IgQ09OVFJJQlVUT1JTIEJFIExJQUJMRQorIyArIEZPUiBBTlkgRElS
RUNULCBJTkRJUkVDVCwgSU5DSURFTlRBTCwgU1BFQ0lBTCwgRVhFTVBMQVJZLCBPUiBDT05TRVFV
RU5USUFMCisjICsgREFNQUdFUyAoSU5DTFVESU5HLCBCVVQgTk9UIExJTUlURUQgVE8sIFBST0NV
UkVNRU5UIE9GIFNVQlNUSVRVVEUgR09PRFMKKyMgKyBPUiBTRVJWSUNFUzsgTE9TUyBPRiBVU0Us
IERBVEEsIE9SIFBST0ZJVFM7IE9SIEJVU0lORVNTIElOVEVSUlVQVElPTikKKyMgKyBIT1dFVkVS
IENBVVNFRCBBTkQgT04gQU5ZIFRIRU9SWSBPRiBMSUFCSUxJVFksIFdIRVRIRVIgSU4gQ09OVFJB
Q1QsIFNUUklDVAorIyArIExJQUJJTElUWSwgT1IgVE9SVCAoSU5DTFVESU5HIE5FR0xJR0VOQ0Ug
T1IgT1RIRVJXSVNFKSBBUklTSU5HIElOIEFOWSBXQVkKKyMgKyBPVVQgT0YgVEhFIFVTRSBPRiBU
SElTIFNPRlRXQVJFLCBFVkVOIElGIEFEVklTRUQgT0YgVEhFIFBPU1NJQklMSVRZIE9GCisjICsg
U1VDSCBEQU1BR0UuCisjICsKKyMgK0ZpbGVzOgorIyAgIHNyYy9tZDIuYworIyAgQ29weXJpZ2h0
OgorIyAtIENvcHlyaWdodCAoYykgMjAwMSBUaGUgTmV0QlNEIEZvdW5kYXRpb24sIEluYy4KKyMg
LSBBbGwgcmlnaHRzIHJlc2VydmVkLgorIyAtIC4KKyMgLSBUaGlzIGNvZGUgaXMgZGVyaXZlZCBm
cm9tIHNvZnR3YXJlIGNvbnRyaWJ1dGVkIHRvIFRoZSBOZXRCU0QgRm91bmRhdGlvbgorIyArIDIw
MDEgVGhlIE5ldEJTRCBGb3VuZGF0aW9uLCBJbmMuCisjICtDb21tZW50OgorIyArIFNvbWUgY29k
ZSBpcyBkZXJpdmVkIGZyb20gc29mdHdhcmUgY29udHJpYnV0ZWQgdG8gVGhlIE5ldEJTRCBGb3Vu
ZGF0aW9uCisjICAgYnkgQW5kcmV3IEJyb3duLgorIyAgTGljZW5zZTogQlNELTItY2xhdXNlLU5l
dEJTRAorIyAgIFJlZGlzdHJpYnV0aW9uIGFuZCB1c2UgaW4gc291cmNlIGFuZCBiaW5hcnkgZm9y
bXMsIHdpdGggb3Igd2l0aG91dAorIyBAQCAtMTE5LDcgKzE1Miw3IEBACisjICAgbWFuL3NoYTEu
MworIyAgIG1hbi9zaGEyLjMKKyMgIENvcHlyaWdodDoKKyMgLSBDb3B5cmlnaHQgwqkgMTk5Nywg
MjAwMywgMjAwNCBUb2RkIEMuIE1pbGxlciA8VG9kZC5NaWxsZXJAY291cnRlc2FuLmNvbT4KKyMg
KyAxOTk3LCAyMDAzLCAyMDA0IFRvZGQgQy4gTWlsbGVyIDxUb2RkLk1pbGxlckBjb3VydGVzYW4u
Y29tPgorIyAgTGljZW5zZTogSVNDCisjICAgUGVybWlzc2lvbiB0byB1c2UsIGNvcHksIG1vZGlm
eSwgYW5kIGRpc3RyaWJ1dGUgdGhpcyBzb2Z0d2FyZSBmb3IgYW55CisjICAgcHVycG9zZSB3aXRo
IG9yIHdpdGhvdXQgZmVlIGlzIGhlcmVieSBncmFudGVkLCBwcm92aWRlZCB0aGF0IHRoZSBhYm92
ZQorIyAKKyMKKwogU1VNTUFSWSA9ICJNZXNzYWdlIERpZ2VzdCBmdW5jdGlvbnMgZnJvbSBCU0Qg
c3lzdGVtcyIKIERFU0NSSVBUSU9OID0gIlRoaXMgbGlicmFyeSBwcm92aWRlcyBtZXNzYWdlIGRp
Z2VzdCBmdW5jdGlvbnMgXAogZm91bmQgb24gQlNEIHN5c3RlbXMgZWl0aGVyIG9uIHRoZWlyIGxp
YmMgKE5ldEJTRCwgT3BlbkJTRCkgb3IgXApAQCAtNiwxMiArMTA3LDEyIEBAIGxhY2tpbmcgb24g
b3RoZXJzIGxpa2UgR05VIHN5c3RlbXMuIgogSE9NRVBBR0UgPSAiaHR0cHM6Ly93d3cuaGFkcm9u
cy5vcmcvc29mdHdhcmUvbGlibWQvIgogCiBMSUNFTlNFID0gIkJTRC0zLUNsYXVzZSAmIEJTRC0y
LUNsYXVzZSIKLUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTA0MzZkNGZi
NjJhNzFmNjYxZDZlOGI3ODEyZjllMWRmIgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09Q
WUlORzttZDU9MjYxYmYyMjYwMjI3MGUyYjI5YzUzOTMwZDQwOWEzY2EiCiAKIFNSQ19VUkkgPSAi
aHR0cHM6Ly9hcmNoaXZlLmhhZHJvbnMub3JnL3NvZnR3YXJlL2xpYm1kL2xpYm1kLSR7UFZ9LnRh
ci54eiBcCiAJICAgZmlsZTovL3J1bi1wdGVzdCBcCiAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAi
MWJkNmFhNDIyNzUzMTNhZjMxNDFjN2NmMmU1Yjk2NGU4YjFmZDQ4ODAyNWNhZjJmOTcxZjQzYjAw
Nzc2YjMzMiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJhYzE1ZmZiODQzMDUwMmZiYWNjZGVjNjZj
NWE4MmVlMGVhYjBiMGYzNjIyMGRmNTY3MTBmZWFkZmViMTNkMGEwIgogCiBpbmhlcml0IGF1dG90
b29scyBwdGVzdAogCi0tIAoyLjQ3LjEKCg==

--===============4312178805981881486==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libmd/libmd-dbg: PKGSIZE changed from 251368 to 294704 (+17%)
packages/x86-64-v3-poky-linux/libmd/libmd-dev: PKGSIZE changed from 21568 to 24824 (+15%)
packages/x86-64-v3-poky-linux/libmd/libmd-dev: FILELIST: added "/usr/include/sha3.h"
packages/x86-64-v3-poky-linux/libmd/libmd-doc: PKGSIZE changed from 40012 to 52458 (+31%)
packages/x86-64-v3-poky-linux/libmd/libmd-doc: FILELIST: added "/usr/share/man/man3/SHA512_256Update.3 /usr/share/man/man3/SHA3_384_Update.3 /usr/share/man/man3/SHA3_512_Update.3 /usr/share/man/man3/SHA3_224_Update.3 /usr/share/man/man3/SHA3_256_Update.3 /usr/share/man/man3/shake.3 /usr/share/man/man3/SHA512_256Final.3 /usr/share/man/man3/SHA224Pad.3 /usr/share/man/man3/SHA512_256End.3 /usr/share/man/man3/SHA512_256Pad.3 /usr/share/man/man3/SHA512_256Transform.3 /usr/share/man/man3/SHA3_224_Final.3 /usr/share/man/man3/SHA3_256_Final.3 /usr/share/man/man3/SHA3_384_Final.3 /usr/share/man/man3/SHA224Transform.3 /usr/share/man/man3/SHA3_512_Final.3 /usr/share/man/man3/SHA3_224_Init.3 /usr/share/man/man3/SHA3_Selftest.3 /usr/share/man/man3/SHA3_384_Init.3 /usr/share/man/man3/SHA224Final.3 /usr/share/man/man3/SHAKE128_Init.3 /usr/share/man/man3/SHA3_512_Init.3 /usr/share/man/man3/SHA3_256_Init.3 /usr/share/man/man3/SHAKE256_Init.3 /usr/share/man/man3/SHA512_256FileChunk.3 /usr/share/man/ma
 n3/SHAKE256_Update.3 /usr/share/man/man3/SHA512_256Init.3 /usr/share/man/man3/SHAKE128_Update.3 /usr/share/man/man3/sha3.3 /usr/share/man/man3/SHA224Update.3 /usr/share/man/man3/SHA224File.3 /usr/share/man/man3/SHA224Init.3 /usr/share/man/man3/SHA224FileChunk.3 /usr/share/man/man3/SHAKE256_Final.3 /usr/share/man/man3/SHA224Data.3 /usr/share/man/man3/SHAKE128_Final.3 /usr/share/man/man3/SHA512_256File.3 /usr/share/man/man3/SHA224End.3 /usr/share/man/man3/SHA512_256Data.3"
packages/x86-64-v3-poky-linux/libmd/libmd-ptest: PKGSIZE changed from 86510 to 100886 (+17%)
packages/x86-64-v3-poky-linux/libmd/libmd-ptest: FILELIST: added "/usr/lib/libmd/ptest/test/sha3"
packages/x86-64-v3-poky-linux/libmd/libmd-src: PKGSIZE changed from 116868 to 147543 (+26%)
packages/x86-64-v3-poky-linux/libmd/libmd: PKGSIZE changed from 67734 to 75926 (+12%)
packages/x86-64-v3-poky-linux/libmd/libmd: FILELIST: removed "/usr/lib/libmd.so.0.1.0", added "/usr/lib/libmd.so.0.2.0"
Changes to packages/x86-64-v3-poky-linux/libmd (sysroot):
  /usr/lib/libmd.so.0 changed symlink target from libmd.so.0.1.0 to libmd.so.0.2.0
  /usr/lib/libmd.so changed symlink target from libmd.so.0.1.0 to libmd.so.0.2.0
  /usr/lib/libmd.so.0.1.0 moved to /usr/lib/libmd.so.0.2.0
  /usr/include/sha3.h was added
Changes to packages/x86_64-linux/libmd-native (sysroot):
  /usr/lib/libmd.so.0 changed symlink target from libmd.so.0.1.0 to libmd.so.0.2.0
  /usr/lib/libmd.so changed symlink target from libmd.so.0.1.0 to libmd.so.0.2.0
  /usr/lib/libmd.so.0.1.0 moved to /usr/lib/libmd.so.0.2.0
  /usr/include/sha3.h was added
Changes to packages/x86_64-linux/shadow-native (sysroot):
  /lib-shadow-deps/libmd.so.0.1.0 moved to /lib-shadow-deps/libmd.so.0.2.0

--===============4312178805981881486==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libmd-upgrade-1.1.0-1.2.0.patch"

RnJvbSAzNDRjNzlhMDNiYjdlMzA4NzA4M2JjMDI5NDcyZGJhOGRjMTdmYTBmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAxNTowMDoyOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
Ym1kOiB1cGdyYWRlIDEuMS4wIC0+IDEuMi4wCgotLS0KIC4uLi9saWJtZC97bGlibWRfMS4xLjAu
YmIgPT4gbGlibWRfMS4yLjAuYmJ9ICB8IDEwNSArKysrKysrKysrKysrKysrKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxMDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9saWJtZC97bGlibWRfMS4xLjAuYmIgPT4gbGlibWRfMS4yLjAuYmJ9ICgx
NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlibWQvbGlibWRfMS4xLjAu
YmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJtZC9saWJtZF8xLjIuMC5iYgpzaW1pbGFyaXR5
IGluZGV4IDE3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJtZC9saWJtZF8x
LjEuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlibWQvbGlibWRfMS4yLjAu
YmIKaW5kZXggZmZjNTlkZWIyNi4uNGJiMGUxOThjZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LXN1cHBvcnQvbGlibWQvbGlibWRfMS4xLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQv
bGlibWQvbGlibWRfMS4yLjAuYmIKQEAgLTEsMyArMSwxMDQgQEAKKyMgRklYTUU6IHRoZSBMSUNf
RklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRl
Jy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5k
IHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVl
IGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1l
c3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVw
ZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisj
IC0tLSBDT1BZSU5HCisjICsrKyBDT1BZSU5HCisjIEBAIC0zLDcgKzMsNyBAQAorIyAgRmlsZXM6
CisjICAgKgorIyAgQ29weXJpZ2h0OgorIyAtIENvcHlyaWdodCDCqSAyMDA5LCAyMDExLCAyMDE2
IEd1aWxsZW0gSm92ZXIgPGd1aWxsZW1AaGFkcm9ucy5vcmc+CisjICsgMjAwOS0yMDI2IEd1aWxs
ZW0gSm92ZXIgPGd1aWxsZW1AaGFkcm9ucy5vcmc+CisjICBMaWNlbnNlOiBCU0QtMy1jbGF1c2UK
KyMgICBSZWRpc3RyaWJ1dGlvbiBhbmQgdXNlIGluIHNvdXJjZSBhbmQgYmluYXJ5IGZvcm1zLCB3
aXRoIG9yIHdpdGhvdXQKKyMgICBtb2RpZmljYXRpb24sIGFyZSBwZXJtaXR0ZWQgcHJvdmlkZWQg
dGhhdCB0aGUgZm9sbG93aW5nIGNvbmRpdGlvbnMKKyMgQEAgLTMxLDggKzMxLDcgQEAKKyMgICBp
bmNsdWRlL3NoYTIuaAorIyAgIHNyYy9zaGEyLmMKKyMgIENvcHlyaWdodDoKKyMgLSBDb3B5cmln
aHQgwqkgMjAwMC0yMDAxLCBBYXJvbiBELiBHaWZmb3JkCisjIC0gQWxsIHJpZ2h0cyByZXNlcnZl
ZC4KKyMgKyAyMDAwLTIwMDEgQWFyb24gRC4gR2lmZm9yZAorIyAgTGljZW5zZTogQlNELTMtY2xh
dXNlLUFhcm9uLUQtR2lmZm9yZAorIyAgIFJlZGlzdHJpYnV0aW9uIGFuZCB1c2UgaW4gc291cmNl
IGFuZCBiaW5hcnkgZm9ybXMsIHdpdGggb3Igd2l0aG91dAorIyAgIG1vZGlmaWNhdGlvbiwgYXJl
IHBlcm1pdHRlZCBwcm92aWRlZCB0aGF0IHRoZSBmb2xsb3dpbmcgY29uZGl0aW9ucworIyBAQCAt
NjIsNyArNjEsNyBAQAorIyAgIGluY2x1ZGUvcm1kMTYwLmgKKyMgICBzcmMvcm1kMTYwLmMKKyMg
IENvcHlyaWdodDoKKyMgLSBDb3B5cmlnaHQgwqkgMjAwMSBNYXJrdXMgRnJpZWRsLiAgQWxsIHJp
Z2h0cyByZXNlcnZlZC4KKyMgKyAyMDAxIE1hcmt1cyBGcmllZGwKKyMgIExpY2Vuc2U6IEJTRC0y
LWNsYXVzZQorIyAgIFJlZGlzdHJpYnV0aW9uIGFuZCB1c2UgaW4gc291cmNlIGFuZCBiaW5hcnkg
Zm9ybXMsIHdpdGggb3Igd2l0aG91dAorIyAgIG1vZGlmaWNhdGlvbiwgYXJlIHBlcm1pdHRlZCBw
cm92aWRlZCB0aGF0IHRoZSBmb2xsb3dpbmcgY29uZGl0aW9ucworIyBAQCAtODUsMTIgKzg0LDQ2
IEBACisjICAgVEhJUyBTT0ZUV0FSRSwgRVZFTiBJRiBBRFZJU0VEIE9GIFRIRSBQT1NTSUJJTElU
WSBPRiBTVUNIIERBTUFHRS4KKyMgIAorIyAgRmlsZXM6CisjICsgaW5jbHVkZS9zaGEzLmgKKyMg
KyBtYW4vU0hBM19TZWxmdGVzdC4zCisjICsgbWFuL3NoYTMuMworIyArIG1hbi9zaGFrZS4zCisj
ICsgc3JjL2tlY2Nhay5jCisjICsgc3JjL2tlY2Nhay5oCisjICsgc3JjL2xvY2FsLWVuZGlhbi5o
CisjICsgc3JjL3NoYTMuYworIyArQ29weXJpZ2h0OgorIyArIENvcHlyaWdodCDCqSAyMDAyIFRo
b21hcyBNb2VzdGwgPHRtbUBGcmVlQlNELm9yZz4KKyMgKyBDb3B5cmlnaHQgwqkgMjAxMSBHdWls
bGVtIEpvdmVyIDxndWlsbGVtQGhhZHJvbnMub3JnPgorIyArIENvcHlyaWdodCDCqSAyMDE1IFRh
eWxvciBSLiBDYW1wYmVsbAorIyArTGljZW5zZTogQlNELTItY2xhdXNlLWNvbnRyaWJ1dG9ycwor
IyArIFJlZGlzdHJpYnV0aW9uIGFuZCB1c2UgaW4gc291cmNlIGFuZCBiaW5hcnkgZm9ybXMsIHdp
dGggb3Igd2l0aG91dAorIyArIG1vZGlmaWNhdGlvbiwgYXJlIHBlcm1pdHRlZCBwcm92aWRlZCB0
aGF0IHRoZSBmb2xsb3dpbmcgY29uZGl0aW9ucworIyArIGFyZSBtZXQ6CisjICsgMS4gUmVkaXN0
cmlidXRpb25zIG9mIHNvdXJjZSBjb2RlIG11c3QgcmV0YWluIHRoZSBhYm92ZSBjb3B5cmlnaHQK
KyMgKyAgICBub3RpY2UsIHRoaXMgbGlzdCBvZiBjb25kaXRpb25zIGFuZCB0aGUgZm9sbG93aW5n
IGRpc2NsYWltZXIuCisjICsgMi4gUmVkaXN0cmlidXRpb25zIGluIGJpbmFyeSBmb3JtIG11c3Qg
cmVwcm9kdWNlIHRoZSBhYm92ZSBjb3B5cmlnaHQKKyMgKyAgICBub3RpY2UsIHRoaXMgbGlzdCBv
ZiBjb25kaXRpb25zIGFuZCB0aGUgZm9sbG93aW5nIGRpc2NsYWltZXIgaW4gdGhlCisjICsgICAg
ZG9jdW1lbnRhdGlvbiBhbmQvb3Igb3RoZXIgbWF0ZXJpYWxzIHByb3ZpZGVkIHdpdGggdGhlIGRp
c3RyaWJ1dGlvbi4KKyMgKyAuCisjICsgVEhJUyBTT0ZUV0FSRSBJUyBQUk9WSURFRCBCWSBUSEUg
QVVUSE9SIEFORCBDT05UUklCVVRPUlMgYGBBUyBJUycnIEFORAorIyArIEFOWSBFWFBSRVNTIE9S
IElNUExJRUQgV0FSUkFOVElFUywgSU5DTFVESU5HLCBCVVQgTk9UIExJTUlURUQgVE8sIFRIRQor
IyArIElNUExJRUQgV0FSUkFOVElFUyBPRiBNRVJDSEFOVEFCSUxJVFkgQU5EIEZJVE5FU1MgRk9S
IEEgUEFSVElDVUxBUiBQVVJQT1NFCisjICsgQVJFIERJU0NMQUlNRUQuICBJTiBOTyBFVkVOVCBT
SEFMTCBUSEUgQVVUSE9SIE9SIENPTlRSSUJVVE9SUyBCRSBMSUFCTEUKKyMgKyBGT1IgQU5ZIERJ
UkVDVCwgSU5ESVJFQ1QsIElOQ0lERU5UQUwsIFNQRUNJQUwsIEVYRU1QTEFSWSwgT1IgQ09OU0VR
VUVOVElBTAorIyArIERBTUFHRVMgKElOQ0xVRElORywgQlVUIE5PVCBMSU1JVEVEIFRPLCBQUk9D
VVJFTUVOVCBPRiBTVUJTVElUVVRFIEdPT0RTCisjICsgT1IgU0VSVklDRVM7IExPU1MgT0YgVVNF
LCBEQVRBLCBPUiBQUk9GSVRTOyBPUiBCVVNJTkVTUyBJTlRFUlJVUFRJT04pCisjICsgSE9XRVZF
UiBDQVVTRUQgQU5EIE9OIEFOWSBUSEVPUlkgT0YgTElBQklMSVRZLCBXSEVUSEVSIElOIENPTlRS
QUNULCBTVFJJQ1QKKyMgKyBMSUFCSUxJVFksIE9SIFRPUlQgKElOQ0xVRElORyBORUdMSUdFTkNF
IE9SIE9USEVSV0lTRSkgQVJJU0lORyBJTiBBTlkgV0FZCisjICsgT1VUIE9GIFRIRSBVU0UgT0Yg
VEhJUyBTT0ZUV0FSRSwgRVZFTiBJRiBBRFZJU0VEIE9GIFRIRSBQT1NTSUJJTElUWSBPRgorIyAr
IFNVQ0ggREFNQUdFLgorIyArCisjICtGaWxlczoKKyMgICBzcmMvbWQyLmMKKyMgIENvcHlyaWdo
dDoKKyMgLSBDb3B5cmlnaHQgKGMpIDIwMDEgVGhlIE5ldEJTRCBGb3VuZGF0aW9uLCBJbmMuCisj
IC0gQWxsIHJpZ2h0cyByZXNlcnZlZC4KKyMgLSAuCisjIC0gVGhpcyBjb2RlIGlzIGRlcml2ZWQg
ZnJvbSBzb2Z0d2FyZSBjb250cmlidXRlZCB0byBUaGUgTmV0QlNEIEZvdW5kYXRpb24KKyMgKyAy
MDAxIFRoZSBOZXRCU0QgRm91bmRhdGlvbiwgSW5jLgorIyArQ29tbWVudDoKKyMgKyBTb21lIGNv
ZGUgaXMgZGVyaXZlZCBmcm9tIHNvZnR3YXJlIGNvbnRyaWJ1dGVkIHRvIFRoZSBOZXRCU0QgRm91
bmRhdGlvbgorIyAgIGJ5IEFuZHJldyBCcm93bi4KKyMgIExpY2Vuc2U6IEJTRC0yLWNsYXVzZS1O
ZXRCU0QKKyMgICBSZWRpc3RyaWJ1dGlvbiBhbmQgdXNlIGluIHNvdXJjZSBhbmQgYmluYXJ5IGZv
cm1zLCB3aXRoIG9yIHdpdGhvdXQKKyMgQEAgLTExOSw3ICsxNTIsNyBAQAorIyAgIG1hbi9zaGEx
LjMKKyMgICBtYW4vc2hhMi4zCisjICBDb3B5cmlnaHQ6CisjIC0gQ29weXJpZ2h0IMKpIDE5OTcs
IDIwMDMsIDIwMDQgVG9kZCBDLiBNaWxsZXIgPFRvZGQuTWlsbGVyQGNvdXJ0ZXNhbi5jb20+Cisj
ICsgMTk5NywgMjAwMywgMjAwNCBUb2RkIEMuIE1pbGxlciA8VG9kZC5NaWxsZXJAY291cnRlc2Fu
LmNvbT4KKyMgIExpY2Vuc2U6IElTQworIyAgIFBlcm1pc3Npb24gdG8gdXNlLCBjb3B5LCBtb2Rp
ZnksIGFuZCBkaXN0cmlidXRlIHRoaXMgc29mdHdhcmUgZm9yIGFueQorIyAgIHB1cnBvc2Ugd2l0
aCBvciB3aXRob3V0IGZlZSBpcyBoZXJlYnkgZ3JhbnRlZCwgcHJvdmlkZWQgdGhhdCB0aGUgYWJv
dmUKKyMgCisjCisKIFNVTU1BUlkgPSAiTWVzc2FnZSBEaWdlc3QgZnVuY3Rpb25zIGZyb20gQlNE
IHN5c3RlbXMiCiBERVNDUklQVElPTiA9ICJUaGlzIGxpYnJhcnkgcHJvdmlkZXMgbWVzc2FnZSBk
aWdlc3QgZnVuY3Rpb25zIFwKIGZvdW5kIG9uIEJTRCBzeXN0ZW1zIGVpdGhlciBvbiB0aGVpciBs
aWJjIChOZXRCU0QsIE9wZW5CU0QpIG9yIFwKQEAgLTYsMTIgKzEwNywxMiBAQCBsYWNraW5nIG9u
IG90aGVycyBsaWtlIEdOVSBzeXN0ZW1zLiIKIEhPTUVQQUdFID0gImh0dHBzOi8vd3d3LmhhZHJv
bnMub3JnL3NvZnR3YXJlL2xpYm1kLyIKIAogTElDRU5TRSA9ICJCU0QtMy1DbGF1c2UgJiBCU0Qt
Mi1DbGF1c2UiCi1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT0wNDM2ZDRm
YjYyYTcxZjY2MWQ2ZThiNzgxMmY5ZTFkZiIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NP
UFlJTkc7bWQ1PTI2MWJmMjI2MDIyNzBlMmIyOWM1MzkzMGQ0MDlhM2NhIgogCiBTUkNfVVJJID0g
Imh0dHBzOi8vYXJjaGl2ZS5oYWRyb25zLm9yZy9zb2Z0d2FyZS9saWJtZC9saWJtZC0ke1BWfS50
YXIueHogXAogCSAgIGZpbGU6Ly9ydW4tcHRlc3QgXAogIgotU1JDX1VSSVtzaGEyNTZzdW1dID0g
IjFiZDZhYTQyMjc1MzEzYWYzMTQxYzdjZjJlNWI5NjRlOGIxZmQ0ODgwMjVjYWYyZjk3MWY0M2Iw
MDc3NmIzMzIiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYWMxNWZmYjg0MzA1MDJmYmFjY2RlYzY2
YzVhODJlZTBlYWIwYjBmMzYyMjBkZjU2NzEwZmVhZGZlYjEzZDBhMCIKIAogaW5oZXJpdCBhdXRv
dG9vbHMgcHRlc3QKIAotLSAKMi40Ny4xCgo=

--===============4312178805981881486==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libmd: SRC_URI changed from "https://archive.hadrons.org/software/libmd/libmd-1.1.0.tar.xz file://run-ptest" to "https://archive.hadrons.org/software/libmd/libmd-1.2.0.tar.xz file://run-ptest"
packages/x86-64-v3-poky-linux/libmd: PKGV changed from 1.1.0 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/libmd: PV changed from "1.1.0" to "1.2.0"
packages/x86-64-v3-poky-linux/libmd/libmd-dbg: PKGSIZE changed from 251368 to 294704 (+17%)
packages/x86-64-v3-poky-linux/libmd/libmd-dbg: FILELIST: removed "/usr/lib/.debug/libmd.so.0.1.0", added "/usr/lib/libmd/ptest/test/.debug/sha3 /usr/lib/.debug/libmd.so.0.2.0"
packages/x86-64-v3-poky-linux/libmd/libmd-dbg: PKGV changed from 1.1.0 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/libmd/libmd-dbg: PV changed from "1.1.0" to "1.2.0"
packages/x86-64-v3-poky-linux/libmd/libmd-dev: PKGSIZE changed from 21568 to 24824 (+15%)
packages/x86-64-v3-poky-linux/libmd/libmd-dev: FILELIST: added "/usr/include/sha3.h"
packages/x86-64-v3-poky-linux/libmd/libmd-dev: PKGV changed from 1.1.0 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/libmd/libmd-dev: PV changed from "1.1.0" to "1.2.0"
packages/x86-64-v3-poky-linux/libmd/libmd-doc: PKGSIZE changed from 40012 to 52458 (+31%)
packages/x86-64-v3-poky-linux/libmd/libmd-doc: FILELIST: added "/usr/share/man/man3/SHA512_256FileChunk.3 /usr/share/man/man3/SHA3_256_Final.3 /usr/share/man/man3/SHA3_224_Final.3 /usr/share/man/man3/SHAKE256_Final.3 /usr/share/man/man3/SHAKE128_Final.3 /usr/share/man/man3/SHA3_384_Final.3 /usr/share/man/man3/SHA224Pad.3 /usr/share/man/man3/SHA224End.3 /usr/share/man/man3/SHA512_256End.3 /usr/share/man/man3/SHA512_256Pad.3 /usr/share/man/man3/SHA224Data.3 /usr/share/man/man3/SHA3_384_Init.3 /usr/share/man/man3/SHA3_512_Init.3 /usr/share/man/man3/SHA3_Selftest.3 /usr/share/man/man3/SHA224File.3 /usr/share/man/man3/SHA3_224_Init.3 /usr/share/man/man3/SHA3_256_Init.3 /usr/share/man/man3/SHAKE128_Update.3 /usr/share/man/man3/SHA512_256Update.3 /usr/share/man/man3/SHA512_256File.3 /usr/share/man/man3/SHA512_256Transform.3 /usr/share/man/man3/SHA224FileChunk.3 /usr/share/man/man3/SHA224Init.3 /usr/share/man/man3/shake.3 /usr/share/man/man3/SHA224Update.3 /usr/share/man/man3/SHA512_256Data.
 3 /usr/share/man/man3/SHA224Transform.3 /usr/share/man/man3/SHA3_384_Update.3 /usr/share/man/man3/SHA512_256Init.3 /usr/share/man/man3/SHA3_512_Update.3 /usr/share/man/man3/SHA3_224_Update.3 /usr/share/man/man3/SHA3_256_Update.3 /usr/share/man/man3/sha3.3 /usr/share/man/man3/SHA512_256Final.3 /usr/share/man/man3/SHA224Final.3 /usr/share/man/man3/SHAKE128_Init.3 /usr/share/man/man3/SHAKE256_Init.3 /usr/share/man/man3/SHA3_512_Final.3 /usr/share/man/man3/SHAKE256_Update.3"
packages/x86-64-v3-poky-linux/libmd/libmd-doc: PKGV changed from 1.1.0 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/libmd/libmd-doc: PV changed from "1.1.0" to "1.2.0"
packages/x86-64-v3-poky-linux/libmd/libmd-locale: PKGV changed from 1.1.0 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/libmd/libmd-locale: PV changed from "1.1.0" to "1.2.0"
packages/x86-64-v3-poky-linux/libmd/libmd-ptest: PKGSIZE changed from 86510 to 100886 (+17%)
packages/x86-64-v3-poky-linux/libmd/libmd-ptest: FILELIST: added "/usr/lib/libmd/ptest/test/sha3"
packages/x86-64-v3-poky-linux/libmd/libmd-ptest: PKGV changed from 1.1.0 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/libmd/libmd-ptest: PV changed from "1.1.0" to "1.2.0"
packages/x86-64-v3-poky-linux/libmd/libmd-src: PKGSIZE changed from 116868 to 147543 (+26%)
packages/x86-64-v3-poky-linux/libmd/libmd-src: FILELIST: removed "/usr/src/debug/libmd/1.1.0/src/rmd160.c /usr/src/debug/libmd/1.1.0/test/sha1.c /usr/src/debug/libmd/1.1.0/src/sha512_256hl.c /usr/src/debug/libmd/1.1.0/src/md2hl.c /usr/src/debug/libmd/1.1.0/include/md2.h /usr/src/debug/libmd/1.1.0/test/md4.c /usr/src/debug/libmd/1.1.0/test/md5.c /usr/src/debug/libmd/1.1.0/include/md4.h /usr/src/debug/libmd/1.1.0/src/sha224hl.c /usr/src/debug/libmd/1.1.0/src/sha256hl.c /usr/src/debug/libmd/1.1.0/src/sha384hl.c /usr/src/debug/libmd/1.1.0/src/sha512hl.c /usr/src/debug/libmd/1.1.0/include/md5.h /usr/src/debug/libmd/1.1.0/src/md4hl.c /usr/src/debug/libmd/1.1.0/test/sha2.c /usr/src/debug/libmd/1.1.0/src/rmd160hl.c /usr/src/debug/libmd/1.1.0/include/rmd160.h /usr/src/debug/libmd/1.1.0/src/md4.c /usr/src/debug/libmd/1.1.0/test/test.h /usr/src/debug/libmd/1.1.0/include/sha1.h /usr/src/debug/libmd/1.1.0/include/sha2.h /usr/src/debug/libmd/1.1.0/src/sha1hl.c /usr/src/debug/libmd/1.1.0/src/md2.c 
 /usr/src/debug/libmd/1.1.0/test/md2.c /usr/src/debug/libmd/1.1.0/src/md5hl.c /usr/src/debug/libmd/1.1.0/src/sha1.c /usr/src/debug/libmd/1.1.0/test/rmd160.c /usr/src/debug/libmd/1.1.0/src/md5.c /usr/src/debug/libmd/1.1.0/src/sha2.c", added "/usr/src/debug/libmd/1.2.0/src/rmd160.c /usr/src/debug/libmd/1.2.0/test/sha1.c /usr/src/debug/libmd/1.2.0/src/sha512_256hl.c /usr/src/debug/libmd/1.2.0/src/md2hl.c /usr/src/debug/libmd/1.2.0/include/md2.h /usr/src/debug/libmd/1.2.0/test/md4.c /usr/src/debug/libmd/1.2.0/test/md5.c /usr/src/debug/libmd/1.2.0/src/sha2.c /usr/src/debug/libmd/1.2.0/include/md4.h /usr/src/debug/libmd/1.2.0/src/sha224hl.c /usr/src/debug/libmd/1.2.0/src/sha256hl.c /usr/src/debug/libmd/1.2.0/src/sha384hl.c /usr/src/debug/libmd/1.2.0/src/sha512hl.c /usr/src/debug/libmd/1.2.0/include/md5.h /usr/src/debug/libmd/1.2.0/src/md4hl.c /usr/src/debug/libmd/1.2.0/src/keccak.c /usr/src/debug/libmd/1.2.0/test/sha3.c /usr/src/debug/libmd/1.2.0/test/sha2.c /usr/src/debug/libmd/1.2.0/src/
 rmd160hl.c /usr/src/debug/libmd/1.2.0/src/keccak.h /usr/src/debug/libmd/1.2.0/src/sha3.c /usr/src/debug/libmd/1.2.0/src/md4.c /usr/src/debug/libmd/1.2.0/src/local-endian.h /usr/src/debug/libmd/1.2.0/test/test.h /usr/src/debug/libmd/1.2.0/include/sha1.h /usr/src/debug/libmd/1.2.0/include/sha2.h /usr/src/debug/libmd/1.2.0/include/sha3.h /usr/src/debug/libmd/1.2.0/src/sha1hl.c /usr/src/debug/libmd/1.2.0/src/md2.c /usr/src/debug/libmd/1.2.0/test/md2.c /usr/src/debug/libmd/1.2.0/src/md5hl.c /usr/src/debug/libmd/1.2.0/src/sha1.c /usr/src/debug/libmd/1.2.0/include/rmd160.h /usr/src/debug/libmd/1.2.0/src/md5.c /usr/src/debug/libmd/1.2.0/test/rmd160.c"
packages/x86-64-v3-poky-linux/libmd/libmd-src: PKGV changed from 1.1.0 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/libmd/libmd-src: PV changed from "1.1.0" to "1.2.0"
packages/x86-64-v3-poky-linux/libmd/libmd-staticdev: PKGV changed from 1.1.0 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/libmd/libmd-staticdev: PV changed from "1.1.0" to "1.2.0"
packages/x86-64-v3-poky-linux/libmd/libmd: PKGSIZE changed from 67734 to 75926 (+12%)
packages/x86-64-v3-poky-linux/libmd/libmd: FILELIST: removed "/usr/lib/libmd.so.0.1.0", added "/usr/lib/libmd.so.0.2.0"
packages/x86-64-v3-poky-linux/libmd/libmd: PKGV changed from 1.1.0 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/libmd/libmd: PV changed from "1.1.0" to "1.2.0"
Changes to packages/x86-64-v3-poky-linux/libmd (sysroot):
  /usr/lib/libmd.so.0 changed symlink target from libmd.so.0.1.0 to libmd.so.0.2.0
  /usr/lib/libmd.so changed symlink target from libmd.so.0.1.0 to libmd.so.0.2.0
  /usr/lib/libmd.so.0.1.0 moved to /usr/lib/libmd.so.0.2.0
  /usr/include/sha3.h was added
Changes to packages/x86_64-linux/libmd-native (sysroot):
  /usr/lib/libmd.so.0 changed symlink target from libmd.so.0.1.0 to libmd.so.0.2.0
  /usr/lib/libmd.so changed symlink target from libmd.so.0.1.0 to libmd.so.0.2.0
  /usr/lib/libmd.so.0.1.0 moved to /usr/lib/libmd.so.0.2.0
  /usr/include/sha3.h was added
Changes to packages/x86_64-linux/shadow-native (sysroot):
  /lib-shadow-deps/libmd.so.0.1.0 moved to /lib-shadow-deps/libmd.so.0.2.0

--===============4312178805981881486==--

