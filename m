Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 472F3CD4F51
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 13:20:49 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34817.1778851226141020403
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 06:20:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=f0OhjUgq;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=1BBsKlnu;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019e2bcbe717-30152a0c-0934-4b14-ae9a-9c09f8d3d765-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1778851243;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ZZrJw6S0vA/+++fsgia/6lJ4+jZjBSctsfBwzMbRwr0=;
	b=f0OhjUgqJ4622rL2dI7tpOEPfBPVecYeLSBo7614qV5pzC82XroqDQ+ij3qnTr88
	lG82eYdxNesKn/fUyLAsheBeHnG5VI2wT6+CqnB0qbDEqDToN9pWM43q80KB3lbQnD5
	w+qvYUT7qbLXULBCJah+jlAxPLtdqxLW1tiG6Zis=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1778851243;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ZZrJw6S0vA/+++fsgia/6lJ4+jZjBSctsfBwzMbRwr0=;
	b=1BBsKlnu2oKX0hubt0VXvnEF2VwIgC3ogry+Si2lhgAahREWvitmscTZZ5o+FG+Z
	WGk4q3MvfWEb/KcotIRpmqvP4AJuFd2rvE01p8EEnvS0pKi2dobiJ4k7Zxu+1RFGSOM
	AnN7MZ/aR+IKMinec+V469VoKjWEpQaSIumOiwCI=
Content-Type: multipart/mixed; boundary="===============6026780608319582194=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libmd: upgrading to 1.2.0 SUCCEEDED
Message-ID: <0101019e2bcbe717-30152a0c-0934-4b14-ae9a-9c09f8d3d765-000000@us-west-2.amazonses.com>
Date: Fri, 15 May 2026 13:20:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 13:20:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237168

--===============6026780608319582194==
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
cm9tIDE5YmI5MDk5NDVmYjU3NDcwN2FiY2YzMjliYjQ1YWFmZDIyMDA4YzAgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCkZyb206IFVwZ3JhZGUgSGVscGVyIDxhdWhAeW9jdG9wcm9qZWN0Lm9yZz4K
RGF0ZTogRnJpLCAxNSBNYXkgMjAyNiAxMjo1NzozMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
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

--===============6026780608319582194==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libmd: PKGV changed from 1.1.0 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/libmd: PV changed from "1.1.0" to "1.2.0"
packages/x86-64-v3-poky-linux/libmd: SRC_URI changed from "https://archive.hadrons.org/software/libmd/libmd-1.1.0.tar.xz file://run-ptest" to "https://archive.hadrons.org/software/libmd/libmd-1.2.0.tar.xz file://run-ptest"
packages/x86-64-v3-poky-linux/libmd/libmd-dbg: PKGSIZE changed from 248952 to 292176 (+17%)
packages/x86-64-v3-poky-linux/libmd/libmd-dbg: FILELIST: removed "/usr/lib/.debug/libmd.so.0.1.0", added "/usr/lib/libmd/ptest/test/.debug/sha3 /usr/lib/.debug/libmd.so.0.2.0"
packages/x86-64-v3-poky-linux/libmd/libmd-dbg: PKGV changed from 1.1.0 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/libmd/libmd-dbg: PV changed from "1.1.0" to "1.2.0"
packages/x86-64-v3-poky-linux/libmd/libmd-dev: PKGSIZE changed from 21568 to 24824 (+15%)
packages/x86-64-v3-poky-linux/libmd/libmd-dev: FILELIST: added "/usr/include/sha3.h"
packages/x86-64-v3-poky-linux/libmd/libmd-dev: PKGV changed from 1.1.0 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/libmd/libmd-dev: PV changed from "1.1.0" to "1.2.0"
packages/x86-64-v3-poky-linux/libmd/libmd-doc: PKGSIZE changed from 40012 to 52458 (+31%)
packages/x86-64-v3-poky-linux/libmd/libmd-doc: FILELIST: added "/usr/share/man/man3/SHA512_256Update.3 /usr/share/man/man3/SHA3_384_Final.3 /usr/share/man/man3/SHA3_512_Final.3 /usr/share/man/man3/SHA224Pad.3 /usr/share/man/man3/SHA3_224_Final.3 /usr/share/man/man3/SHA3_256_Final.3 /usr/share/man/man3/SHA224File.3 /usr/share/man/man3/shake.3 /usr/share/man/man3/SHA3_384_Update.3 /usr/share/man/man3/SHA3_512_Update.3 /usr/share/man/man3/SHA512_256File.3 /usr/share/man/man3/SHA3_224_Update.3 /usr/share/man/man3/SHA3_256_Update.3 /usr/share/man/man3/SHA224Transform.3 /usr/share/man/man3/SHA3_Selftest.3 /usr/share/man/man3/SHA3_384_Init.3 /usr/share/man/man3/SHA3_512_Init.3 /usr/share/man/man3/SHA3_224_Init.3 /usr/share/man/man3/SHA3_256_Init.3 /usr/share/man/man3/SHA512_256FileChunk.3 /usr/share/man/man3/SHA224Data.3 /usr/share/man/man3/SHA512_256End.3 /usr/share/man/man3/SHA512_256Pad.3 /usr/share/man/man3/SHAKE128_Update.3 /usr/share/man/man3/SHAKE256_Update.3 /usr/share/man/man3/SHA2
 24Update.3 /usr/share/man/man3/sha3.3 /usr/share/man/man3/SHAKE256_Init.3 /usr/share/man/man3/SHA512_256Transform.3 /usr/share/man/man3/SHA512_256Init.3 /usr/share/man/man3/SHAKE128_Init.3 /usr/share/man/man3/SHA224Final.3 /usr/share/man/man3/SHAKE256_Final.3 /usr/share/man/man3/SHA224FileChunk.3 /usr/share/man/man3/SHAKE128_Final.3 /usr/share/man/man3/SHA512_256Data.3 /usr/share/man/man3/SHA224End.3 /usr/share/man/man3/SHA224Init.3 /usr/share/man/man3/SHA512_256Final.3"
packages/x86-64-v3-poky-linux/libmd/libmd-doc: PKGV changed from 1.1.0 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/libmd/libmd-doc: PV changed from "1.1.0" to "1.2.0"
packages/x86-64-v3-poky-linux/libmd/libmd-locale: PKGV changed from 1.1.0 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/libmd/libmd-locale: PV changed from "1.1.0" to "1.2.0"
packages/x86-64-v3-poky-linux/libmd/libmd-ptest: PKGSIZE changed from 86510 to 100886 (+17%)
packages/x86-64-v3-poky-linux/libmd/libmd-ptest: FILELIST: added "/usr/lib/libmd/ptest/test/sha3"
packages/x86-64-v3-poky-linux/libmd/libmd-ptest: PKGV changed from 1.1.0 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/libmd/libmd-ptest: PV changed from "1.1.0" to "1.2.0"
packages/x86-64-v3-poky-linux/libmd/libmd-src: PKGSIZE changed from 116868 to 147543 (+26%)
packages/x86-64-v3-poky-linux/libmd/libmd-src: FILELIST: removed "/usr/src/debug/libmd/1.1.0/include/md5.h /usr/src/debug/libmd/1.1.0/src/sha2.c /usr/src/debug/libmd/1.1.0/include/md4.h /usr/src/debug/libmd/1.1.0/src/sha224hl.c /usr/src/debug/libmd/1.1.0/src/sha256hl.c /usr/src/debug/libmd/1.1.0/src/sha384hl.c /usr/src/debug/libmd/1.1.0/src/sha512hl.c /usr/src/debug/libmd/1.1.0/test/rmd160.c /usr/src/debug/libmd/1.1.0/src/sha1.c /usr/src/debug/libmd/1.1.0/src/sha1hl.c /usr/src/debug/libmd/1.1.0/src/md5.c /usr/src/debug/libmd/1.1.0/src/md2.c /usr/src/debug/libmd/1.1.0/src/rmd160hl.c /usr/src/debug/libmd/1.1.0/test/md2.c /usr/src/debug/libmd/1.1.0/test/md4.c /usr/src/debug/libmd/1.1.0/src/md2hl.c /usr/src/debug/libmd/1.1.0/test/md5.c /usr/src/debug/libmd/1.1.0/src/md5hl.c /usr/src/debug/libmd/1.1.0/test/test.h /usr/src/debug/libmd/1.1.0/include/rmd160.h /usr/src/debug/libmd/1.1.0/src/rmd160.c /usr/src/debug/libmd/1.1.0/include/md2.h /usr/src/debug/libmd/1.1.0/src/sha512_256hl.c /usr/sr
 c/debug/libmd/1.1.0/test/sha1.c /usr/src/debug/libmd/1.1.0/include/sha1.h /usr/src/debug/libmd/1.1.0/include/sha2.h /usr/src/debug/libmd/1.1.0/test/sha2.c /usr/src/debug/libmd/1.1.0/src/md4hl.c /usr/src/debug/libmd/1.1.0/src/md4.c", added "/usr/src/debug/libmd/1.2.0/include/md5.h /usr/src/debug/libmd/1.2.0/src/sha2.c /usr/src/debug/libmd/1.2.0/src/sha3.c /usr/src/debug/libmd/1.2.0/include/md4.h /usr/src/debug/libmd/1.2.0/src/sha224hl.c /usr/src/debug/libmd/1.2.0/src/sha256hl.c /usr/src/debug/libmd/1.2.0/src/sha384hl.c /usr/src/debug/libmd/1.2.0/src/sha512hl.c /usr/src/debug/libmd/1.2.0/src/keccak.c /usr/src/debug/libmd/1.2.0/test/rmd160.c /usr/src/debug/libmd/1.2.0/src/keccak.h /usr/src/debug/libmd/1.2.0/src/sha1.c /usr/src/debug/libmd/1.2.0/src/sha1hl.c /usr/src/debug/libmd/1.2.0/src/md5.c /usr/src/debug/libmd/1.2.0/src/md2.c /usr/src/debug/libmd/1.2.0/src/rmd160hl.c /usr/src/debug/libmd/1.2.0/test/md2.c /usr/src/debug/libmd/1.2.0/test/md4.c /usr/src/debug/libmd/1.2.0/src/md2hl.c /
 usr/src/debug/libmd/1.2.0/test/md5.c /usr/src/debug/libmd/1.2.0/src/md5hl.c /usr/src/debug/libmd/1.2.0/test/test.h /usr/src/debug/libmd/1.2.0/include/rmd160.h /usr/src/debug/libmd/1.2.0/src/rmd160.c /usr/src/debug/libmd/1.2.0/src/local-endian.h /usr/src/debug/libmd/1.2.0/include/md2.h /usr/src/debug/libmd/1.2.0/src/sha512_256hl.c /usr/src/debug/libmd/1.2.0/test/sha1.c /usr/src/debug/libmd/1.2.0/include/sha1.h /usr/src/debug/libmd/1.2.0/include/sha2.h /usr/src/debug/libmd/1.2.0/include/sha3.h /usr/src/debug/libmd/1.2.0/test/sha2.c /usr/src/debug/libmd/1.2.0/src/md4hl.c /usr/src/debug/libmd/1.2.0/src/md4.c /usr/src/debug/libmd/1.2.0/test/sha3.c"
packages/x86-64-v3-poky-linux/libmd/libmd-src: PKGV changed from 1.1.0 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/libmd/libmd-src: PV changed from "1.1.0" to "1.2.0"
packages/x86-64-v3-poky-linux/libmd/libmd-staticdev: PKGV changed from 1.1.0 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/libmd/libmd-staticdev: PV changed from "1.1.0" to "1.2.0"
packages/x86-64-v3-poky-linux/libmd/libmd: PKGSIZE changed from 63638 to 71830 (+13%)
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

--===============6026780608319582194==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libmd/libmd-dbg: PKGSIZE changed from 248952 to 292176 (+17%)
packages/x86-64-v3-poky-linux/libmd/libmd-dev: FILELIST: added "/usr/include/sha3.h"
packages/x86-64-v3-poky-linux/libmd/libmd-dev: PKGSIZE changed from 21568 to 24824 (+15%)
packages/x86-64-v3-poky-linux/libmd/libmd-doc: FILELIST: added "/usr/share/man/man3/SHA512_256Init.3 /usr/share/man/man3/SHA512_256Transform.3 /usr/share/man/man3/SHAKE128_Update.3 /usr/share/man/man3/SHAKE256_Update.3 /usr/share/man/man3/SHA224Update.3 /usr/share/man/man3/SHA3_384_Init.3 /usr/share/man/man3/SHA3_512_Init.3 /usr/share/man/man3/SHA3_Selftest.3 /usr/share/man/man3/SHA3_224_Init.3 /usr/share/man/man3/SHA3_256_Init.3 /usr/share/man/man3/SHA224File.3 /usr/share/man/man3/SHAKE256_Final.3 /usr/share/man/man3/SHAKE128_Final.3 /usr/share/man/man3/SHA224Pad.3 /usr/share/man/man3/SHA224FileChunk.3 /usr/share/man/man3/SHA3_224_Update.3 /usr/share/man/man3/SHA3_256_Update.3 /usr/share/man/man3/SHA3_384_Update.3 /usr/share/man/man3/SHA224Transform.3 /usr/share/man/man3/SHA3_512_Update.3 /usr/share/man/man3/SHA224End.3 /usr/share/man/man3/sha3.3 /usr/share/man/man3/shake.3 /usr/share/man/man3/SHA512_256End.3 /usr/share/man/man3/SHA3_224_Final.3 /usr/share/man/man3/SHA3_256_Final.3 
 /usr/share/man/man3/SHA512_256Pad.3 /usr/share/man/man3/SHA3_384_Final.3 /usr/share/man/man3/SHA512_256File.3 /usr/share/man/man3/SHA3_512_Final.3 /usr/share/man/man3/SHA512_256FileChunk.3 /usr/share/man/man3/SHA512_256Final.3 /usr/share/man/man3/SHA512_256Data.3 /usr/share/man/man3/SHA224Data.3 /usr/share/man/man3/SHA224Final.3 /usr/share/man/man3/SHAKE128_Init.3 /usr/share/man/man3/SHA512_256Update.3 /usr/share/man/man3/SHAKE256_Init.3 /usr/share/man/man3/SHA224Init.3"
packages/x86-64-v3-poky-linux/libmd/libmd-doc: PKGSIZE changed from 40012 to 52458 (+31%)
packages/x86-64-v3-poky-linux/libmd/libmd-ptest: FILELIST: added "/usr/lib/libmd/ptest/test/sha3"
packages/x86-64-v3-poky-linux/libmd/libmd-ptest: PKGSIZE changed from 86510 to 100886 (+17%)
packages/x86-64-v3-poky-linux/libmd/libmd-src: PKGSIZE changed from 116868 to 147543 (+26%)
packages/x86-64-v3-poky-linux/libmd/libmd: FILELIST: removed "/usr/lib/libmd.so.0.1.0", added "/usr/lib/libmd.so.0.2.0"
packages/x86-64-v3-poky-linux/libmd/libmd: PKGSIZE changed from 63638 to 71830 (+13%)
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

--===============6026780608319582194==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libmd-upgrade-1.1.0-1.2.0.patch"

RnJvbSAxOWJiOTA5OTQ1ZmI1NzQ3MDdhYmNmMzI5YmI0NWFhZmQyMjAwOGMwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWF5IDIwMjYgMTI6NTc6MzMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJtZDogdXBncmFkZSAxLjEuMCAtPiAxLjIuMAoKLS0tCiAuLi4vbGlibWQve2xpYm1kXzEuMS4w
LmJiID0+IGxpYm1kXzEuMi4wLmJifSAgfCAxMDUgKysrKysrKysrKysrKysrKystCiAxIGZpbGUg
Y2hhbmdlZCwgMTAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvbGlibWQve2xpYm1kXzEuMS4wLmJiID0+IGxpYm1kXzEuMi4wLmJifSAo
MTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYm1kL2xpYm1kXzEuMS4w
LmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlibWQvbGlibWRfMS4yLjAuYmIKc2ltaWxhcml0
eSBpbmRleCAxNyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlibWQvbGlibWRf
MS4xLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYm1kL2xpYm1kXzEuMi4w
LmJiCmluZGV4IGZmYzU5ZGViMjYuLjRiYjBlMTk4Y2UgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1zdXBwb3J0L2xpYm1kL2xpYm1kXzEuMS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0
L2xpYm1kL2xpYm1kXzEuMi4wLmJiCkBAIC0xLDMgKzEsMTA0IEBACisjIEZJWE1FOiB0aGUgTElD
X0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFk
ZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFu
ZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1
ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBt
ZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1V
cGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIwor
IyAtLS0gQ09QWUlORworIyArKysgQ09QWUlORworIyBAQCAtMyw3ICszLDcgQEAKKyMgIEZpbGVz
OgorIyAgICoKKyMgIENvcHlyaWdodDoKKyMgLSBDb3B5cmlnaHQgwqkgMjAwOSwgMjAxMSwgMjAx
NiBHdWlsbGVtIEpvdmVyIDxndWlsbGVtQGhhZHJvbnMub3JnPgorIyArIDIwMDktMjAyNiBHdWls
bGVtIEpvdmVyIDxndWlsbGVtQGhhZHJvbnMub3JnPgorIyAgTGljZW5zZTogQlNELTMtY2xhdXNl
CisjICAgUmVkaXN0cmlidXRpb24gYW5kIHVzZSBpbiBzb3VyY2UgYW5kIGJpbmFyeSBmb3Jtcywg
d2l0aCBvciB3aXRob3V0CisjICAgbW9kaWZpY2F0aW9uLCBhcmUgcGVybWl0dGVkIHByb3ZpZGVk
IHRoYXQgdGhlIGZvbGxvd2luZyBjb25kaXRpb25zCisjIEBAIC0zMSw4ICszMSw3IEBACisjICAg
aW5jbHVkZS9zaGEyLmgKKyMgICBzcmMvc2hhMi5jCisjICBDb3B5cmlnaHQ6CisjIC0gQ29weXJp
Z2h0IMKpIDIwMDAtMjAwMSwgQWFyb24gRC4gR2lmZm9yZAorIyAtIEFsbCByaWdodHMgcmVzZXJ2
ZWQuCisjICsgMjAwMC0yMDAxIEFhcm9uIEQuIEdpZmZvcmQKKyMgIExpY2Vuc2U6IEJTRC0zLWNs
YXVzZS1BYXJvbi1ELUdpZmZvcmQKKyMgICBSZWRpc3RyaWJ1dGlvbiBhbmQgdXNlIGluIHNvdXJj
ZSBhbmQgYmluYXJ5IGZvcm1zLCB3aXRoIG9yIHdpdGhvdXQKKyMgICBtb2RpZmljYXRpb24sIGFy
ZSBwZXJtaXR0ZWQgcHJvdmlkZWQgdGhhdCB0aGUgZm9sbG93aW5nIGNvbmRpdGlvbnMKKyMgQEAg
LTYyLDcgKzYxLDcgQEAKKyMgICBpbmNsdWRlL3JtZDE2MC5oCisjICAgc3JjL3JtZDE2MC5jCisj
ICBDb3B5cmlnaHQ6CisjIC0gQ29weXJpZ2h0IMKpIDIwMDEgTWFya3VzIEZyaWVkbC4gIEFsbCBy
aWdodHMgcmVzZXJ2ZWQuCisjICsgMjAwMSBNYXJrdXMgRnJpZWRsCisjICBMaWNlbnNlOiBCU0Qt
Mi1jbGF1c2UKKyMgICBSZWRpc3RyaWJ1dGlvbiBhbmQgdXNlIGluIHNvdXJjZSBhbmQgYmluYXJ5
IGZvcm1zLCB3aXRoIG9yIHdpdGhvdXQKKyMgICBtb2RpZmljYXRpb24sIGFyZSBwZXJtaXR0ZWQg
cHJvdmlkZWQgdGhhdCB0aGUgZm9sbG93aW5nIGNvbmRpdGlvbnMKKyMgQEAgLTg1LDEyICs4NCw0
NiBAQAorIyAgIFRISVMgU09GVFdBUkUsIEVWRU4gSUYgQURWSVNFRCBPRiBUSEUgUE9TU0lCSUxJ
VFkgT0YgU1VDSCBEQU1BR0UuCisjICAKKyMgIEZpbGVzOgorIyArIGluY2x1ZGUvc2hhMy5oCisj
ICsgbWFuL1NIQTNfU2VsZnRlc3QuMworIyArIG1hbi9zaGEzLjMKKyMgKyBtYW4vc2hha2UuMwor
IyArIHNyYy9rZWNjYWsuYworIyArIHNyYy9rZWNjYWsuaAorIyArIHNyYy9sb2NhbC1lbmRpYW4u
aAorIyArIHNyYy9zaGEzLmMKKyMgK0NvcHlyaWdodDoKKyMgKyBDb3B5cmlnaHQgwqkgMjAwMiBU
aG9tYXMgTW9lc3RsIDx0bW1ARnJlZUJTRC5vcmc+CisjICsgQ29weXJpZ2h0IMKpIDIwMTEgR3Vp
bGxlbSBKb3ZlciA8Z3VpbGxlbUBoYWRyb25zLm9yZz4KKyMgKyBDb3B5cmlnaHQgwqkgMjAxNSBU
YXlsb3IgUi4gQ2FtcGJlbGwKKyMgK0xpY2Vuc2U6IEJTRC0yLWNsYXVzZS1jb250cmlidXRvcnMK
KyMgKyBSZWRpc3RyaWJ1dGlvbiBhbmQgdXNlIGluIHNvdXJjZSBhbmQgYmluYXJ5IGZvcm1zLCB3
aXRoIG9yIHdpdGhvdXQKKyMgKyBtb2RpZmljYXRpb24sIGFyZSBwZXJtaXR0ZWQgcHJvdmlkZWQg
dGhhdCB0aGUgZm9sbG93aW5nIGNvbmRpdGlvbnMKKyMgKyBhcmUgbWV0OgorIyArIDEuIFJlZGlz
dHJpYnV0aW9ucyBvZiBzb3VyY2UgY29kZSBtdXN0IHJldGFpbiB0aGUgYWJvdmUgY29weXJpZ2h0
CisjICsgICAgbm90aWNlLCB0aGlzIGxpc3Qgb2YgY29uZGl0aW9ucyBhbmQgdGhlIGZvbGxvd2lu
ZyBkaXNjbGFpbWVyLgorIyArIDIuIFJlZGlzdHJpYnV0aW9ucyBpbiBiaW5hcnkgZm9ybSBtdXN0
IHJlcHJvZHVjZSB0aGUgYWJvdmUgY29weXJpZ2h0CisjICsgICAgbm90aWNlLCB0aGlzIGxpc3Qg
b2YgY29uZGl0aW9ucyBhbmQgdGhlIGZvbGxvd2luZyBkaXNjbGFpbWVyIGluIHRoZQorIyArICAg
IGRvY3VtZW50YXRpb24gYW5kL29yIG90aGVyIG1hdGVyaWFscyBwcm92aWRlZCB3aXRoIHRoZSBk
aXN0cmlidXRpb24uCisjICsgLgorIyArIFRISVMgU09GVFdBUkUgSVMgUFJPVklERUQgQlkgVEhF
IEFVVEhPUiBBTkQgQ09OVFJJQlVUT1JTIGBgQVMgSVMnJyBBTkQKKyMgKyBBTlkgRVhQUkVTUyBP
UiBJTVBMSUVEIFdBUlJBTlRJRVMsIElOQ0xVRElORywgQlVUIE5PVCBMSU1JVEVEIFRPLCBUSEUK
KyMgKyBJTVBMSUVEIFdBUlJBTlRJRVMgT0YgTUVSQ0hBTlRBQklMSVRZIEFORCBGSVRORVNTIEZP
UiBBIFBBUlRJQ1VMQVIgUFVSUE9TRQorIyArIEFSRSBESVNDTEFJTUVELiAgSU4gTk8gRVZFTlQg
U0hBTEwgVEhFIEFVVEhPUiBPUiBDT05UUklCVVRPUlMgQkUgTElBQkxFCisjICsgRk9SIEFOWSBE
SVJFQ1QsIElORElSRUNULCBJTkNJREVOVEFMLCBTUEVDSUFMLCBFWEVNUExBUlksIE9SIENPTlNF
UVVFTlRJQUwKKyMgKyBEQU1BR0VTIChJTkNMVURJTkcsIEJVVCBOT1QgTElNSVRFRCBUTywgUFJP
Q1VSRU1FTlQgT0YgU1VCU1RJVFVURSBHT09EUworIyArIE9SIFNFUlZJQ0VTOyBMT1NTIE9GIFVT
RSwgREFUQSwgT1IgUFJPRklUUzsgT1IgQlVTSU5FU1MgSU5URVJSVVBUSU9OKQorIyArIEhPV0VW
RVIgQ0FVU0VEIEFORCBPTiBBTlkgVEhFT1JZIE9GIExJQUJJTElUWSwgV0hFVEhFUiBJTiBDT05U
UkFDVCwgU1RSSUNUCisjICsgTElBQklMSVRZLCBPUiBUT1JUIChJTkNMVURJTkcgTkVHTElHRU5D
RSBPUiBPVEhFUldJU0UpIEFSSVNJTkcgSU4gQU5ZIFdBWQorIyArIE9VVCBPRiBUSEUgVVNFIE9G
IFRISVMgU09GVFdBUkUsIEVWRU4gSUYgQURWSVNFRCBPRiBUSEUgUE9TU0lCSUxJVFkgT0YKKyMg
KyBTVUNIIERBTUFHRS4KKyMgKworIyArRmlsZXM6CisjICAgc3JjL21kMi5jCisjICBDb3B5cmln
aHQ6CisjIC0gQ29weXJpZ2h0IChjKSAyMDAxIFRoZSBOZXRCU0QgRm91bmRhdGlvbiwgSW5jLgor
IyAtIEFsbCByaWdodHMgcmVzZXJ2ZWQuCisjIC0gLgorIyAtIFRoaXMgY29kZSBpcyBkZXJpdmVk
IGZyb20gc29mdHdhcmUgY29udHJpYnV0ZWQgdG8gVGhlIE5ldEJTRCBGb3VuZGF0aW9uCisjICsg
MjAwMSBUaGUgTmV0QlNEIEZvdW5kYXRpb24sIEluYy4KKyMgK0NvbW1lbnQ6CisjICsgU29tZSBj
b2RlIGlzIGRlcml2ZWQgZnJvbSBzb2Z0d2FyZSBjb250cmlidXRlZCB0byBUaGUgTmV0QlNEIEZv
dW5kYXRpb24KKyMgICBieSBBbmRyZXcgQnJvd24uCisjICBMaWNlbnNlOiBCU0QtMi1jbGF1c2Ut
TmV0QlNECisjICAgUmVkaXN0cmlidXRpb24gYW5kIHVzZSBpbiBzb3VyY2UgYW5kIGJpbmFyeSBm
b3Jtcywgd2l0aCBvciB3aXRob3V0CisjIEBAIC0xMTksNyArMTUyLDcgQEAKKyMgICBtYW4vc2hh
MS4zCisjICAgbWFuL3NoYTIuMworIyAgQ29weXJpZ2h0OgorIyAtIENvcHlyaWdodCDCqSAxOTk3
LCAyMDAzLCAyMDA0IFRvZGQgQy4gTWlsbGVyIDxUb2RkLk1pbGxlckBjb3VydGVzYW4uY29tPgor
IyArIDE5OTcsIDIwMDMsIDIwMDQgVG9kZCBDLiBNaWxsZXIgPFRvZGQuTWlsbGVyQGNvdXJ0ZXNh
bi5jb20+CisjICBMaWNlbnNlOiBJU0MKKyMgICBQZXJtaXNzaW9uIHRvIHVzZSwgY29weSwgbW9k
aWZ5LCBhbmQgZGlzdHJpYnV0ZSB0aGlzIHNvZnR3YXJlIGZvciBhbnkKKyMgICBwdXJwb3NlIHdp
dGggb3Igd2l0aG91dCBmZWUgaXMgaGVyZWJ5IGdyYW50ZWQsIHByb3ZpZGVkIHRoYXQgdGhlIGFi
b3ZlCisjIAorIworCiBTVU1NQVJZID0gIk1lc3NhZ2UgRGlnZXN0IGZ1bmN0aW9ucyBmcm9tIEJT
RCBzeXN0ZW1zIgogREVTQ1JJUFRJT04gPSAiVGhpcyBsaWJyYXJ5IHByb3ZpZGVzIG1lc3NhZ2Ug
ZGlnZXN0IGZ1bmN0aW9ucyBcCiBmb3VuZCBvbiBCU0Qgc3lzdGVtcyBlaXRoZXIgb24gdGhlaXIg
bGliYyAoTmV0QlNELCBPcGVuQlNEKSBvciBcCkBAIC02LDEyICsxMDcsMTIgQEAgbGFja2luZyBv
biBvdGhlcnMgbGlrZSBHTlUgc3lzdGVtcy4iCiBIT01FUEFHRSA9ICJodHRwczovL3d3dy5oYWRy
b25zLm9yZy9zb2Z0d2FyZS9saWJtZC8iCiAKIExJQ0VOU0UgPSAiQlNELTMtQ2xhdXNlICYgQlNE
LTItQ2xhdXNlIgotTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9MDQzNmQ0
ZmI2MmE3MWY2NjFkNmU4Yjc4MTJmOWUxZGYiCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9D
T1BZSU5HO21kNT0yNjFiZjIyNjAyMjcwZTJiMjljNTM5MzBkNDA5YTNjYSIKIAogU1JDX1VSSSA9
ICJodHRwczovL2FyY2hpdmUuaGFkcm9ucy5vcmcvc29mdHdhcmUvbGlibWQvbGlibWQtJHtQVn0u
dGFyLnh6IFwKIAkgICBmaWxlOi8vcnVuLXB0ZXN0IFwKICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9
ICIxYmQ2YWE0MjI3NTMxM2FmMzE0MWM3Y2YyZTViOTY0ZThiMWZkNDg4MDI1Y2FmMmY5NzFmNDNi
MDA3NzZiMzMyIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImFjMTVmZmI4NDMwNTAyZmJhY2NkZWM2
NmM1YTgyZWUwZWFiMGIwZjM2MjIwZGY1NjcxMGZlYWRmZWIxM2QwYTAiCiAKIGluaGVyaXQgYXV0
b3Rvb2xzIHB0ZXN0CiAKLS0gCjIuNDcuMQoK

--===============6026780608319582194==--

