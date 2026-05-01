Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0BC2CD342C
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:53 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15628.1777645547319756106
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=BGRQRZGn;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=hCc4IdYD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019de3ee7962-13cb3603-4318-42d0-bbcd-287ecff48ab2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645550;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1ospgttvsdAVoeUvM/gvxqp0XOLYQWQXcKz9DdTVvtw=;
	b=BGRQRZGnwtgqBmlU3O1bNQoI4KQaSdTL0IY61fvbN+kVmGg3TqRSQ73BbGiv1cfR
	5+5uKVvTYtcNi8Nenfw1jxZ2V84SDkiceShg4Fy4uInOwu3W6JsJ2ZBZ0jgkkglXKNU
	luBKC+kHOMy9uBGmzgue8B1XXthXOKeDqi8lGgU0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645550;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1ospgttvsdAVoeUvM/gvxqp0XOLYQWQXcKz9DdTVvtw=;
	b=hCc4IdYDhEU6N175BC2K62VtzYNe7OdgNvKHfUEFDNj0xENce1tzMENMXBYOXwhP
	ldsjNAtcQnLu6EJAhkwQJCJQ12WieP42oQoR/dyfrUVa2oGiZxtqw2Q3c9142D1tCke
	r98wYjc8rit1Bpiu9B8uwogqOB4FkqDv88OFa2fw=
Content-Type: multipart/mixed; boundary="===============1887480274877112605=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libjpeg-turbo: upgrading to 3.1.4.1 SUCCEEDED
Message-ID: <0101019de3ee7962-13cb3603-4318-42d0-bbcd-287ecff48ab2-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:49 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236270

--===============1887480274877112605==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sCgp0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFk
ZSBIZWxwZXIKdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBl
KHMpICpsaWJqcGVnLXR1cmJvKiB0byAqMy4xLjQuMSogaGFzIFN1Y2NlZWRlZC4KCk5leHQgc3Rl
cHM6CiAgICAtIGFwcGx5IHRoZSBwYXRjaDogZ2l0IGFtIDAwMDEtbGlianBlZy10dXJiby11cGdy
YWRlLTMuMS4zLTMuMS40LjEucGF0Y2gKICAgIC0gY2hlY2sgdGhlIGNoYW5nZXMgdG8gdXBzdHJl
YW0gcGF0Y2hlcyBhbmQgc3VtbWFyaXplIHRoZW0gaW4gdGhlIGNvbW1pdCBtZXNzYWdlLAogICAg
LSBjb21waWxlIGFuIGltYWdlIHRoYXQgY29udGFpbnMgdGhlIHBhY2thZ2UKICAgIC0gcGVyZm9y
bSBzb21lIGJhc2ljIHNhbml0eSB0ZXN0cwogICAgLSBhbWVuZCB0aGUgcGF0Y2ggYW5kIHNpZ24g
aXQgb2ZmOiBnaXQgY29tbWl0IC1zIC0tcmVzZXQtYXV0aG9yIC0tYW1lbmQKICAgIC0gc2VuZCBp
dCB0byB0aGUgYXBwcm9wcmlhdGUgbWFpbGluZyBsaXN0CgpBbHRlcm5hdGl2ZWx5LCBpZiB5b3Ug
YmVsaWV2ZSB0aGUgcmVjaXBlIHNob3VsZCBub3QgYmUgdXBncmFkZWQgYXQgdGhpcyB0aW1lLAp5
b3UgY2FuIGZpbGwgUkVDSVBFX05PX1VQREFURV9SRUFTT04gaW4gcmVzcGVjdGl2ZSByZWNpcGUg
ZmlsZSBzbyB0aGF0CmF1dG9tYXRpYyB1cGdyYWRlcyB3b3VsZCBubyBsb25nZXIgYmUgYXR0ZW1w
dGVkLgoKUGxlYXNlIHJldmlldyB0aGUgYXR0YWNoZWQgZmlsZXMgZm9yIGZ1cnRoZXIgaW5mb3Jt
YXRpb24gYW5kIGJ1aWxkL3VwZGF0ZSBmYWlsdXJlcy4KQW55IHByb2JsZW0gcGxlYXNlIGZpbGUg
YSBidWcgYXQgaHR0cHM6Ly9idWd6aWxsYS55b2N0b3Byb2plY3Qub3JnL2VudGVyX2J1Zy5jZ2k/
cHJvZHVjdD1BdXRvbWF0ZWQlMjBVcGRhdGUlMjBIYW5kbGVyCgpSZWdhcmRzLApUaGUgVXBncmFk
ZSBIZWxwZXIKCi0tID44IC0tCkZyb20gMDc4ZmU0ZjU0Njc2ZmM4Y2QwMWJhMjg4Njc2MmRkOTM4
NTIwMjBiNyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKRnJvbTogVXBncmFkZSBIZWxwZXIgPGF1
aEB5b2N0b3Byb2plY3Qub3JnPgpEYXRlOiBGcmksIDEgTWF5IDIwMjYgMTI6MDE6NDEgKzAwMDAK
U3ViamVjdDogW1BBVENIXSBsaWJqcGVnLXR1cmJvOiB1cGdyYWRlIDMuMS4zIC0+IDMuMS40LjEK
Ci0tLQogLi4udXJib18zLjEuMy5iYiA9PiBsaWJqcGVnLXR1cmJvXzMuMS40LjEuYmJ9IHwgMjgg
KysrKysrKysrKysrKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2pwZWcve2xpYmpwZWct
dHVyYm9fMy4xLjMuYmIgPT4gbGlianBlZy10dXJib18zLjEuNC4xLmJifSAoNzMlKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9qcGVnL2xpYmpwZWctdHVyYm9fMy4xLjMuYmIg
Yi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvanBlZy9saWJqcGVnLXR1cmJvXzMuMS40LjEuYmIKc2lt
aWxhcml0eSBpbmRleCA3MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2pwZWcv
bGlianBlZy10dXJib18zLjEuMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2pw
ZWcvbGlianBlZy10dXJib18zLjEuNC4xLmJiCmluZGV4IGYzZTFmZjU5YTYuLjA3MmRlOTc4ZTkg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9qcGVnL2xpYmpwZWctdHVyYm9fMy4x
LjMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2pwZWcvbGlianBlZy10dXJib18zLjEu
NC4xLmJiCkBAIC0xLDE1ICsxLDM5IEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2
YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xs
b3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vu
c2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFu
ZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGlj
ZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdo
dCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gTElDRU5TRS5t
ZAorIyArKysgTElDRU5TRS5tZAorIyBAQCAtOTQsOCArOTQsOCBAQAorIyAgVGhlIE1vZGlmaWVk
ICgzLWNsYXVzZSkgQlNEIExpY2Vuc2UKKyMgID09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09CisjICAKKyMgLUNvcHlyaWdodCAoQykyMDA5LTIwMjUgRC4gUi4gQ29tbWFuZGVyLiAg
QWxsIFJpZ2h0cyBSZXNlcnZlZC48YnI+CisjIC1Db3B5cmlnaHQgKEMpMjAxNSBWaWt0b3IgU3ph
dGhtw6FyeS4gIEFsbCBSaWdodHMgUmVzZXJ2ZWQuCisjICtDb3B5cmlnaHQgKEMpIDIwMDktMjAy
NiBELiBSLiBDb21tYW5kZXIuICBBbGwgUmlnaHRzIFJlc2VydmVkLjxicj4KKyMgK0NvcHlyaWdo
dCAoQykgMjAxNSBWaWt0b3IgU3phdGhtw6FyeS4gIEFsbCBSaWdodHMgUmVzZXJ2ZWQuCisjICAK
KyMgIFJlZGlzdHJpYnV0aW9uIGFuZCB1c2UgaW4gc291cmNlIGFuZCBiaW5hcnkgZm9ybXMsIHdp
dGggb3Igd2l0aG91dAorIyAgbW9kaWZpY2F0aW9uLCBhcmUgcGVybWl0dGVkIHByb3ZpZGVkIHRo
YXQgdGhlIGZvbGxvd2luZyBjb25kaXRpb25zIGFyZSBtZXQ6CisjIAorIworCiBTVU1NQVJZID0g
IkhhcmR3YXJlIGFjY2VsZXJhdGVkIEpQRUcgY29tcHJlc3Npb24vZGVjb21wcmVzc2lvbiBsaWJy
YXJ5IgogREVTQ1JJUFRJT04gPSAibGlianBlZy10dXJibyBpcyBhIGRlcml2YXRpdmUgb2YgbGli
anBlZyB0aGF0IHVzZXMgU0lNRCBpbnN0cnVjdGlvbnMgKE1NWCwgU1NFMiwgTkVPTikgdG8gYWNj
ZWxlcmF0ZSBiYXNlbGluZSBKUEVHIGNvbXByZXNzaW9uIGFuZCBkZWNvbXByZXNzaW9uIgogSE9N
RVBBR0UgPSAiaHR0cDovL2xpYmpwZWctdHVyYm8ub3JnLyIKIAogTElDRU5TRSA9ICJJSkcgJiBC
U0QtMy1DbGF1c2UgJiBabGliIgotTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS5t
ZDttZDU9NTJmZGRhYmM3ZThlNzkyMzMxNTBlYmRhOTVjM2ZjMWYiCitMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9MSUNFTlNFLm1kO21kNT01ZTIyMjIwOTk0ODMxZDdmMGI5MWQwOWQ5NGM4OWE2
MyIKIAogREVQRU5EUzphcHBlbmQ6eDg2LTY0OmNsYXNzLXRhcmdldCA9ICIgbmFzbS1uYXRpdmUi
CiBERVBFTkRTOmFwcGVuZDp4ODY6Y2xhc3MtdGFyZ2V0ID0gIiBuYXNtLW5hdGl2ZSIKIAogU1JD
X1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvJHtQVn0vJHtCUH0udGFyLmd6Igot
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjA3NTkyMGI4MjY4MzRhYzRkZGY5NzY2MWNjNzM0OTEwNDc4
NTU4NTlhZmZkNjcxZDUyMDc5YzY4NjdjMWM2YzAiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZWNh
ZTgwMDhlMmNjOWFkZTJmMmMxYmI5ZDVlNmQ0ZmI3M2U3YzQzMzg2NmEwNTZiZDgyOTgwNzQxNTcx
YTAyMiIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gInJlbGVhc2VzL3RhZy8oP1A8cHZlcj5cZCtc
LlxkK1wuKD8hOVxkKylcZCsoXC5cZCspKikiCiAKIFBFID0gIjEiCi0tIAoyLjQ3LjEKCg==

--===============1887480274877112605==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libjpeg-turbo-upgrade-3.1.3-3.1.4.1.patch"

RnJvbSAwNzhmZTRmNTQ2NzZmYzhjZDAxYmEyODg2NzYyZGQ5Mzg1MjAyMGI3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXkgMjAyNiAxMjowMTo0MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmpwZWctdHVyYm86IHVwZ3JhZGUgMy4xLjMgLT4gMy4xLjQuMQoKLS0tCiAuLi51cmJvXzMuMS4z
LmJiID0+IGxpYmpwZWctdHVyYm9fMy4xLjQuMS5iYn0gfCAyOCArKysrKysrKysrKysrKysrKy0t
CiAxIGZpbGUgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvanBlZy97bGlianBlZy10dXJib18zLjEuMy5iYiA9PiBs
aWJqcGVnLXR1cmJvXzMuMS40LjEuYmJ9ICg3MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL2pwZWcvbGlianBlZy10dXJib18zLjEuMy5iYiBiL21ldGEvcmVjaXBlcy1ncmFw
aGljcy9qcGVnL2xpYmpwZWctdHVyYm9fMy4xLjQuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDczJQpy
ZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvanBlZy9saWJqcGVnLXR1cmJvXzMuMS4z
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvanBlZy9saWJqcGVnLXR1cmJvXzMu
MS40LjEuYmIKaW5kZXggZjNlMWZmNTlhNi4uMDcyZGU5NzhlOSAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL2pwZWcvbGlianBlZy10dXJib18zLjEuMy5iYgorKysgYi9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MvanBlZy9saWJqcGVnLXR1cmJvXzMuMS40LjEuYmIKQEAgLTEsMTUgKzEs
MzkgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBk
YXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVy
ZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2Ug
dXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hh
bmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4K
KyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykK
KyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBMSUNFTlNFLm1kCisjICsrKyBMSUNFTlNFLm1k
CisjIEBAIC05NCw4ICs5NCw4IEBACisjICBUaGUgTW9kaWZpZWQgKDMtY2xhdXNlKSBCU0QgTGlj
ZW5zZQorIyAgPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KKyMgIAorIyAtQ29w
eXJpZ2h0IChDKTIwMDktMjAyNSBELiBSLiBDb21tYW5kZXIuICBBbGwgUmlnaHRzIFJlc2VydmVk
Ljxicj4KKyMgLUNvcHlyaWdodCAoQykyMDE1IFZpa3RvciBTemF0aG3DoXJ5LiAgQWxsIFJpZ2h0
cyBSZXNlcnZlZC4KKyMgK0NvcHlyaWdodCAoQykgMjAwOS0yMDI2IEQuIFIuIENvbW1hbmRlci4g
IEFsbCBSaWdodHMgUmVzZXJ2ZWQuPGJyPgorIyArQ29weXJpZ2h0IChDKSAyMDE1IFZpa3RvciBT
emF0aG3DoXJ5LiAgQWxsIFJpZ2h0cyBSZXNlcnZlZC4KKyMgIAorIyAgUmVkaXN0cmlidXRpb24g
YW5kIHVzZSBpbiBzb3VyY2UgYW5kIGJpbmFyeSBmb3Jtcywgd2l0aCBvciB3aXRob3V0CisjICBt
b2RpZmljYXRpb24sIGFyZSBwZXJtaXR0ZWQgcHJvdmlkZWQgdGhhdCB0aGUgZm9sbG93aW5nIGNv
bmRpdGlvbnMgYXJlIG1ldDoKKyMgCisjCisKIFNVTU1BUlkgPSAiSGFyZHdhcmUgYWNjZWxlcmF0
ZWQgSlBFRyBjb21wcmVzc2lvbi9kZWNvbXByZXNzaW9uIGxpYnJhcnkiCiBERVNDUklQVElPTiA9
ICJsaWJqcGVnLXR1cmJvIGlzIGEgZGVyaXZhdGl2ZSBvZiBsaWJqcGVnIHRoYXQgdXNlcyBTSU1E
IGluc3RydWN0aW9ucyAoTU1YLCBTU0UyLCBORU9OKSB0byBhY2NlbGVyYXRlIGJhc2VsaW5lIEpQ
RUcgY29tcHJlc3Npb24gYW5kIGRlY29tcHJlc3Npb24iCiBIT01FUEFHRSA9ICJodHRwOi8vbGli
anBlZy10dXJiby5vcmcvIgogCiBMSUNFTlNFID0gIklKRyAmIEJTRC0zLUNsYXVzZSAmIFpsaWIi
Ci1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLm1kO21kNT01MmZkZGFiYzdlOGU3
OTIzMzE1MGViZGE5NWMzZmMxZiIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0Uu
bWQ7bWQ1PTVlMjIyMjA5OTQ4MzFkN2YwYjkxZDA5ZDk0Yzg5YTYzIgogCiBERVBFTkRTOmFwcGVu
ZDp4ODYtNjQ6Y2xhc3MtdGFyZ2V0ID0gIiBuYXNtLW5hdGl2ZSIKIERFUEVORFM6YXBwZW5kOng4
NjpjbGFzcy10YXJnZXQgPSAiIG5hc20tbmF0aXZlIgogCiBTUkNfVVJJID0gIiR7R0lUSFVCX0JB
U0VfVVJJfS9kb3dubG9hZC8ke1BWfS8ke0JQfS50YXIuZ3oiCi1TUkNfVVJJW3NoYTI1NnN1bV0g
PSAiMDc1OTIwYjgyNjgzNGFjNGRkZjk3NjYxY2M3MzQ5MTA0Nzg1NTg1OWFmZmQ2NzFkNTIwNzlj
Njg2N2MxYzZjMCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJlY2FlODAwOGUyY2M5YWRlMmYyYzFi
YjlkNWU2ZDRmYjczZTdjNDMzODY2YTA1NmJkODI5ODA3NDE1NzFhMDIyIgogVVBTVFJFQU1fQ0hF
Q0tfUkVHRVggPSAicmVsZWFzZXMvdGFnLyg/UDxwdmVyPlxkK1wuXGQrXC4oPyE5XGQrKVxkKyhc
LlxkKykqKSIKIAogUEUgPSAiMSIKLS0gCjIuNDcuMQoK

--===============1887480274877112605==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libjpeg-turbo/jpeg-tools: PKGV changed from 3.1.3 [default] to 3.1.4.1 [default]
packages/x86-64-v3-poky-linux/libjpeg-turbo/jpeg-tools: PV changed from "3.1.3" to "3.1.4.1"
packages/x86-64-v3-poky-linux/libjpeg-turbo: PKGV changed from 3.1.3 [default] to 3.1.4.1 [default]
packages/x86-64-v3-poky-linux/libjpeg-turbo: PV changed from "3.1.3" to "3.1.4.1"
packages/x86-64-v3-poky-linux/libjpeg-turbo: SRC_URI changed from "https://github.com/libjpeg-turbo/libjpeg-turbo/releases//download/3.1.3/libjpeg-turbo-3.1.3.tar.gz" to "https://github.com/libjpeg-turbo/libjpeg-turbo/releases//download/3.1.4.1/libjpeg-turbo-3.1.4.1.tar.gz"
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-dbg: PKGV changed from 3.1.3 [default] to 3.1.4.1 [default]
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-dbg: PV changed from "3.1.3" to "3.1.4.1"
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-dbg: PKGSIZE changed from 5707128 to 5718632 (+0%)
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-dev: PKGV changed from 3.1.3 [default] to 3.1.4.1 [default]
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-dev: PV changed from "3.1.3" to "3.1.4.1"
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-dev: PKGSIZE changed from 218034 to 218601 (+0%)
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-doc: PKGV changed from 3.1.3 [default] to 3.1.4.1 [default]
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-doc: PV changed from "3.1.3" to "3.1.4.1"
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-doc: PKGSIZE changed from 436430 to 436511 (+0%)
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-locale: PKGV changed from 3.1.3 [default] to 3.1.4.1 [default]
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-locale: PV changed from "3.1.3" to "3.1.4.1"
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-src: PKGV changed from 3.1.3 [default] to 3.1.4.1 [default]
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-src: PV changed from "3.1.3" to "3.1.4.1"
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-src: FILELIST: directory renamed /usr/src/debug/libjpeg-turbo/3.1.3/src -> /usr/src/debug/libjpeg-turbo/3.1.4.1/src, directory renamed /usr/src/debug/libjpeg-turbo/3.1.3/simd -> /usr/src/debug/libjpeg-turbo/3.1.4.1/simd, directory renamed /usr/src/debug/libjpeg-turbo/3.1.3/simd/x86_64 -> /usr/src/debug/libjpeg-turbo/3.1.4.1/simd/x86_64
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-src: PKGSIZE changed from 2123117 to 2125782 (+0%)
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-staticdev: PKGV changed from 3.1.3 [default] to 3.1.4.1 [default]
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo-staticdev: PV changed from "3.1.3" to "3.1.4.1"
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo: PKGV changed from 3.1.3 [default] to 3.1.4.1 [default]
packages/x86-64-v3-poky-linux/libjpeg-turbo/libjpeg-turbo: PV changed from "3.1.3" to "3.1.4.1"
packages/x86-64-v3-poky-linux/libjpeg-turbo/libturbojpeg: PKGV changed from 3.1.3 [default] to 3.1.4.1 [default]
packages/x86-64-v3-poky-linux/libjpeg-turbo/libturbojpeg: PV changed from "3.1.3" to "3.1.4.1"

--===============1887480274877112605==--

