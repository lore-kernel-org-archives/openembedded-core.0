Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E62C3C021AD
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 13:21:00 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.42637.1738416057166345233
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Feb 2025 05:20:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=PU4k8Hdj;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=kfWC1SBv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010194c1abe8ba-ccfb0afd-dd2a-436c-8e26-77051b0d3d3b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1738416056;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=VoWV9lwQyd/gca2ePtn6MHu7P15J0xBarsiD5XEECSo=;
	b=PU4k8HdjkdDeDa9j4L3R+31j38/ZarM9DKg7PHyKX9ifTn7Ct576qfm97iJ1cUFT
	h2Xo7pUF5/mx7bkaRKs+ffXHHb1ueIkP1TiqSORucS/+0/t5dwab8U7/WgfjFnWbif7
	3pmus8yCTDwts+f+a5cIsMiCZ8OvEJYxb66hb5gI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1738416056;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=VoWV9lwQyd/gca2ePtn6MHu7P15J0xBarsiD5XEECSo=;
	b=kfWC1SBv4rZnnYjo7XUVrkRXysffWlrUv8hQBxM7doOjZQKMFAcn8iA69XBKZsRk
	djsn5CRpejeC46xoyQhF3YhfuHUNIZWBQf8pPwSz7DfN+eL2lMR7ji4aLmoVR1CoDIw
	peL3LkAn5h+sHqVJr4eC6TZLchAtPxCy05vP/yCQ=
Content-Type: multipart/mixed; boundary="===============7627385582079893607=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-typogrify: upgrading to 2.1.0 FAILED
Message-ID: <01010194c1abe8ba-ccfb0afd-dd2a-436c-8e26-77051b0d3d3b-000000@us-west-2.amazonses.com>
Date: Sat, 1 Feb 2025 13:20:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 13:21:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210548

--===============7627385582079893607==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sCgp0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFk
ZSBIZWxwZXIKdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBl
KHMpICpweXRob24zLXR5cG9ncmlmeSogdG8gKjIuMS4wKiBoYXMgRmFpbGVkKGRvX2NvbXBpbGUp
LgoKRGV0YWlsZWQgZXJyb3IgaW5mb3JtYXRpb246Cgpkb19jb21waWxlIGZhaWxlZAoKCgpOZXh0
IHN0ZXBzOgogICAgLSBhcHBseSB0aGUgcGF0Y2g6IGdpdCBhbSAwMDAxLXB5dGhvbjMtdHlwb2dy
aWZ5LXVwZ3JhZGUtMi4wLjctMi4xLjAucGF0Y2gKICAgIC0gY2hlY2sgdGhlIGNoYW5nZXMgdG8g
dXBzdHJlYW0gcGF0Y2hlcyBhbmQgc3VtbWFyaXplIHRoZW0gaW4gdGhlIGNvbW1pdCBtZXNzYWdl
LAogICAgLSBjb21waWxlIGFuIGltYWdlIHRoYXQgY29udGFpbnMgdGhlIHBhY2thZ2UKICAgIC0g
cGVyZm9ybSBzb21lIGJhc2ljIHNhbml0eSB0ZXN0cwogICAgLSBhbWVuZCB0aGUgcGF0Y2ggYW5k
IHNpZ24gaXQgb2ZmOiBnaXQgY29tbWl0IC1zIC0tcmVzZXQtYXV0aG9yIC0tYW1lbmQKICAgIC0g
c2VuZCBpdCB0byB0aGUgYXBwcm9wcmlhdGUgbWFpbGluZyBsaXN0CgpBbHRlcm5hdGl2ZWx5LCBp
ZiB5b3UgYmVsaWV2ZSB0aGUgcmVjaXBlIHNob3VsZCBub3QgYmUgdXBncmFkZWQgYXQgdGhpcyB0
aW1lLAp5b3UgY2FuIGZpbGwgUkVDSVBFX05PX1VQREFURV9SRUFTT04gaW4gcmVzcGVjdGl2ZSBy
ZWNpcGUgZmlsZSBzbyB0aGF0CmF1dG9tYXRpYyB1cGdyYWRlcyB3b3VsZCBubyBsb25nZXIgYmUg
YXR0ZW1wdGVkLgoKUGxlYXNlIHJldmlldyB0aGUgYXR0YWNoZWQgZmlsZXMgZm9yIGZ1cnRoZXIg
aW5mb3JtYXRpb24gYW5kIGJ1aWxkL3VwZGF0ZSBmYWlsdXJlcy4KQW55IHByb2JsZW0gcGxlYXNl
IGZpbGUgYSBidWcgYXQgaHR0cHM6Ly9idWd6aWxsYS55b2N0b3Byb2plY3Qub3JnL2VudGVyX2J1
Zy5jZ2k/cHJvZHVjdD1BdXRvbWF0ZWQlMjBVcGRhdGUlMjBIYW5kbGVyCgpSZWdhcmRzLApUaGUg
VXBncmFkZSBIZWxwZXIKCi0tID44IC0tCkZyb20gOTdkMjYzMGYzNGIxMTUyMzEyOWY0Y2ZkMDk3
NWQ5NzMzNWRhYzg1NCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKRnJvbTogVXBncmFkZSBIZWxw
ZXIgPGF1aEB5b2N0b3Byb2plY3Qub3JnPgpEYXRlOiBTYXQsIDEgRmViIDIwMjUgMDg6NDM6MTIg
KzAwMDAKU3ViamVjdDogW1BBVENIXSBweXRob24zLXR5cG9ncmlmeTogdXBncmFkZSAyLjAuNyAt
PiAyLjEuMAoKLS0tCiAuLi5meV8yLjAuNy5iYiA9PiBweXRob24zLXR5cG9ncmlmeV8yLjEuMC5i
Yn0gfCAyNSArKysrKysrKysrKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3tweXRob24zLXR5cG9ncmlmeV8yLjAuNy5iYiA9PiBweXRob24zLXR5cG9ncmlmeV8yLjEuMC5i
Yn0gKDI2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtdHlwb2dyaWZ5XzIuMC43LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXR5cG9ncmlmeV8yLjEuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDI2JQpyZW5hbWUgZnJvbSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdHlwb2dyaWZ5XzIuMC43LmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdHlwb2dyaWZ5XzIu
MS4wLmJiCmluZGV4IDhiYTI3ODhjOWIuLjA2MzU1ZWExMzcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10eXBvZ3JpZnlfMi4wLjcuYmIKKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXR5cG9ncmlmeV8yLjEuMC5iYgpAQCAt
MSwxMiArMSwzMyBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUg
YmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRo
ZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisj
IFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXpl
IHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRl
OicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBk
YXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIExJQ0VOU0UudHh0CisjICsrKyBM
SUNFTlNFLnR4dAorIyBAQCAtMSw1ICsxLDUgQEAKKyMgLUNvcHlyaWdodCAoYykgMjAwNywgQ2hy
aXN0aWFuIE1ldHRzCisjIC1VcGRhdGVzIGNvcHlyaWdodCAoYykgMjAxNCwgSnVzdGluIE1heWVy
CisjICtDb3B5cmlnaHQgKGMpIDIwMTTigJNwcmVzZW50LCBKdXN0aW4gTWF5ZXIKKyMgK0NvcHly
aWdodCAoYykgMjAwN+KAkzIwMTMsIENocmlzdGlhbiBNZXR0cworIyAgQWxsIHJpZ2h0cyByZXNl
cnZlZC4KKyMgIAorIyAgUmVkaXN0cmlidXRpb24gYW5kIHVzZSBpbiBzb3VyY2UgYW5kIGJpbmFy
eSBmb3Jtcywgd2l0aCBvciB3aXRob3V0CisjIAorIworCiBTVU1NQVJZID0gIkZpbHRlcnMgdG8g
ZW5oYW5jZSB3ZWIgdHlwb2dyYXBoeSwgaW5jbHVkaW5nIHN1cHBvcnQgZm9yIERqYW5nbyAmIEpp
bmphIHRlbXBsYXRlcyIKIEhPTUVQQUdFID0gImh0dHBzOi8vZ2l0aHViLmNvbS9taW50Y2hhb3Mv
dHlwb2dyaWZ5IgogTElDRU5TRSA9ICJCU0QtMy1DbGF1c2UiCi1MSUNfRklMRVNfQ0hLU1VNID0g
ImZpbGU6Ly9MSUNFTlNFLnR4dDttZDU9MTJiYzc5MmQ2ZjU0MTVkYmY0MjFmM2ZkMTgzYzZkZDIi
CitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLnR4dDttZDU9Yjg1NThlYmNjNjgy
MDc4YzFhNDRkMDIyNzU3MzAwNmQiCiAKIGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCiBQWVBJ
X1BBQ0tBR0UgPSAidHlwb2dyaWZ5IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjhiZTQ2NjhjZGE0
MzQxNjNjZTIyOWQ4N2NhMjczYTExOTIyY2IxNjE0Y2IzNTk5NzBiN2RjOTZlZWQxM2NiMzgiCitT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiZjBhYTAwNGU5ODAzMmE2ZTZiZTRjOWRhNjVlN2ViNzE1MGUz
NmNhM2JmNTA4YWRiY2RhODJiNGQwMDNlNjFlZSIKIAogQkJDTEFTU0VYVEVORCA9ICJuYXRpdmUg
bmF0aXZlc2RrIgogCi0tIAoyLjQ0LjEKCg==

--===============7627385582079893607==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-typogrify-upgrade-2.0.7-2.1.0.patch"

RnJvbSA5N2QyNjMwZjM0YjExNTIzMTI5ZjRjZmQwOTc1ZDk3MzM1ZGFjODU0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBGZWIgMjAyNSAwODo0MzoxMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtdHlwb2dyaWZ5OiB1cGdyYWRlIDIuMC43IC0+IDIuMS4wCgotLS0KIC4uLmZ5XzIuMC43
LmJiID0+IHB5dGhvbjMtdHlwb2dyaWZ5XzIuMS4wLmJifSB8IDI1ICsrKysrKysrKysrKysrKysr
LS0KIDEgZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtdHlwb2dyaWZ5XzIuMC43
LmJiID0+IHB5dGhvbjMtdHlwb2dyaWZ5XzIuMS4wLmJifSAoMjYlKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10eXBvZ3JpZnlfMi4wLjcuYmIgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdHlwb2dyaWZ5XzIuMS4wLmJiCnNp
bWlsYXJpdHkgaW5kZXggMjYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy10eXBvZ3JpZnlfMi4wLjcuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy10eXBvZ3JpZnlfMi4xLjAuYmIKaW5kZXggOGJhMjc4OGM5Yi4u
MDYzNTVlYTEzNyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXR5cG9ncmlmeV8yLjAuNy5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtdHlwb2dyaWZ5XzIuMS4wLmJiCkBAIC0xLDEyICsxLDMzIEBACisjIEZJWE1FOiB0
aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wg
dXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUg
b2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5T
RSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNv
bW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGlj
ZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2Vz
OgorIworIyAtLS0gTElDRU5TRS50eHQKKyMgKysrIExJQ0VOU0UudHh0CisjIEBAIC0xLDUgKzEs
NSBAQAorIyAtQ29weXJpZ2h0IChjKSAyMDA3LCBDaHJpc3RpYW4gTWV0dHMKKyMgLVVwZGF0ZXMg
Y29weXJpZ2h0IChjKSAyMDE0LCBKdXN0aW4gTWF5ZXIKKyMgK0NvcHlyaWdodCAoYykgMjAxNOKA
k3ByZXNlbnQsIEp1c3RpbiBNYXllcgorIyArQ29weXJpZ2h0IChjKSAyMDA34oCTMjAxMywgQ2hy
aXN0aWFuIE1ldHRzCisjICBBbGwgcmlnaHRzIHJlc2VydmVkLgorIyAgCisjICBSZWRpc3RyaWJ1
dGlvbiBhbmQgdXNlIGluIHNvdXJjZSBhbmQgYmluYXJ5IGZvcm1zLCB3aXRoIG9yIHdpdGhvdXQK
KyMgCisjCisKIFNVTU1BUlkgPSAiRmlsdGVycyB0byBlbmhhbmNlIHdlYiB0eXBvZ3JhcGh5LCBp
bmNsdWRpbmcgc3VwcG9ydCBmb3IgRGphbmdvICYgSmluamEgdGVtcGxhdGVzIgogSE9NRVBBR0Ug
PSAiaHR0cHM6Ly9naXRodWIuY29tL21pbnRjaGFvcy90eXBvZ3JpZnkiCiBMSUNFTlNFID0gIkJT
RC0zLUNsYXVzZSIKLUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UudHh0O21kNT0x
MmJjNzkyZDZmNTQxNWRiZjQyMWYzZmQxODNjNmRkMiIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmls
ZTovL0xJQ0VOU0UudHh0O21kNT1iODU1OGViY2M2ODIwNzhjMWE0NGQwMjI3NTczMDA2ZCIKIAog
aW5oZXJpdCBweXBpIHNldHVwdG9vbHMzCiAKIFBZUElfUEFDS0FHRSA9ICJ0eXBvZ3JpZnkiCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiOGJlNDY2OGNkYTQzNDE2M2NlMjI5ZDg3Y2EyNzNhMTE5MjJj
YjE2MTRjYjM1OTk3MGI3ZGM5NmVlZDEzY2IzOCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJmMGFh
MDA0ZTk4MDMyYTZlNmJlNGM5ZGE2NWU3ZWI3MTUwZTM2Y2EzYmY1MDhhZGJjZGE4MmI0ZDAwM2U2
MWVlIgogCiBCQkNMQVNTRVhURU5EID0gIm5hdGl2ZSBuYXRpdmVzZGsiCiAKLS0gCjIuNDQuMQoK

--===============7627385582079893607==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1876 entries from dependency cache.
Parsing recipes...done.
Parsing of 919 .bb files complete (918 cached, 1 parsed). 1874 targets, 41 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:78b9d4879941b0e442ff5e3a8d144e6c61dd3ca0"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 294 Local 285 Mirrors 0 Missed 9 Current 361 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 425 of 655 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typogrify_2.1.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 585 of 655 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typogrify_2.1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-typogrify-2.1.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-typogrify-2.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-typogrify-2.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-typogrify-2.1.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 655 of 655 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typogrify_2.1.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-typogrify-2.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-typogrify-2.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1843 of 1863 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typogrify_2.1.0.bb:do_fetch)
NOTE: recipe python3-typogrify-2.1.0-r0: task do_fetch: Started
NOTE: recipe python3-typogrify-2.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1844 of 1863 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typogrify_2.1.0.bb:do_unpack)
NOTE: Running task 1845 of 1863 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typogrify_2.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-typogrify-2.1.0-r0: task do_unpack: Started
NOTE: recipe python3-typogrify-2.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-typogrify-2.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1846 of 1863 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typogrify_2.1.0.bb:do_patch)
NOTE: Running task 1847 of 1863 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typogrify_2.1.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-typogrify-2.1.0-r0: task do_patch: Started
NOTE: recipe python3-typogrify-2.1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-typogrify-2.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-typogrify-2.1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-typogrify-2.1.0-r0: task do_patch: Succeeded
NOTE: Running task 1849 of 1863 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typogrify_2.1.0.bb:do_check_backend)
NOTE: recipe python3-typogrify-2.1.0-r0: task do_check_backend: Started
WARNING: python3-typogrify-2.1.0-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with hatchling.build, use the correct class [pep517-backend]
NOTE: recipe python3-typogrify-2.1.0-r0: task do_check_backend: Succeeded
NOTE: Running task 1851 of 1863 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typogrify_2.1.0.bb:do_configure)
NOTE: recipe python3-typogrify-2.1.0-r0: task do_configure: Started
NOTE: recipe python3-typogrify-2.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1852 of 1863 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typogrify_2.1.0.bb:do_compile)
NOTE: recipe python3-typogrify-2.1.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-typogrify/2.1.0/recipe-sysroot-native/usr/bin/python3-native/python3: can't open file '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-typogrify/2.1.0/typogrify-2.1.0/setup.py': [Errno 2] No such file or directory
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-typogrify/2.1.0/temp/run.do_compile.3464395:180 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-typogrify/2.1.0/temp/run.do_compile.3464395, line 180
| 	#2: setuptools3_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-typogrify/2.1.0/temp/run.do_compile.3464395, line 170
| 	#3: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-typogrify/2.1.0/temp/run.do_compile.3464395, line 152
| 	#4: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-typogrify/2.1.0/temp/run.do_compile.3464395, line 184
NOTE: recipe python3-typogrify-2.1.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1852 tasks of which 1844 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250201084258.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250201084258.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typogrify_2.1.0.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-typogrify/2.1.0/temp/log.do_compile.3464395
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-typogrify-2.1.0-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-typogrify-2.1.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-typogrify/2.1.0/temp/run.do_compile.3464395' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-typogrify/2.1.0/temp/log.do_compile.3464395
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typogrify_2.1.0.bb:do_compile) failed with exit code '1'

--===============7627385582079893607==--

