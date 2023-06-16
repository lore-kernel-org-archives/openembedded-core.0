Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AF17C05053
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:28 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.817.1686887484447303153
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=NPX+uR0c;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010188c25448fc-d0ff24c7-11be-42e9-9454-684f27d9765d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887483;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=09WDRnhO2RTEh1f6k5d2+SeTRQrhCFIti66JJmnn6iQ=;
	b=NPX+uR0cn99TzTuE4ZUQ7f0X0wMfsAq7cZbhGBkfXOJBNicPBZuhuGYU+83vwImz
	rEM9YUj8L0hfpS97ySpWkjYmhzEVRs2fPHRJxDGIhUCZVbyJjzS22Sx+SphlwD1k5Cq
	n0/BXSH3izOronI6dpneHy3VgYneyNiHU9PsNBG8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887483;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=09WDRnhO2RTEh1f6k5d2+SeTRQrhCFIti66JJmnn6iQ=;
	b=bwtQGTbZZvlgtnH2DHmqP9B17RsRzIfDLwB1U6MTzmXnZeEp/IAUbW0sVD22FdMw
	y4d6OTINCsd/tpsOEPnDH9x6NwcdiAXmX8auuJU4ARrjAT6bTDoCed7Ytv2DIeGbrjz
	/6oo2KSqcQpeLEQjw5knsuaQmJhHO7V7oRxmAgx8=
Content-Type: multipart/mixed; boundary="===============7729891347050702013=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] cups: upgrading to 2.4.5 SUCCEEDED
Message-ID: <01010188c25448fc-d0ff24c7-11be-42e9-9454-684f27d9765d-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:23 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182955

--===============7729891347050702013==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sCgp0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFk
ZSBIZWxwZXIKdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBl
ICpjdXBzKiB0byAqMi40LjUqIGhhcyBTdWNjZWVkZWQuCgpOZXh0IHN0ZXBzOgogICAgLSBhcHBs
eSB0aGUgcGF0Y2g6IGdpdCBhbSAwMDAxLWN1cHMtdXBncmFkZS0yLjQuMi0yLjQuNS5wYXRjaAog
ICAgLSBjaGVjayB0aGUgY2hhbmdlcyB0byB1cHN0cmVhbSBwYXRjaGVzIGFuZCBzdW1tYXJpemUg
dGhlbSBpbiB0aGUgY29tbWl0IG1lc3NhZ2UsCiAgICAtIGNvbXBpbGUgYW4gaW1hZ2UgdGhhdCBj
b250YWlucyB0aGUgcGFja2FnZQogICAgLSBwZXJmb3JtIHNvbWUgYmFzaWMgc2FuaXR5IHRlc3Rz
CiAgICAtIGFtZW5kIHRoZSBwYXRjaCBhbmQgc2lnbiBpdCBvZmY6IGdpdCBjb21taXQgLXMgLS1y
ZXNldC1hdXRob3IgLS1hbWVuZAogICAgLSBzZW5kIGl0IHRvIHRoZSBhcHByb3ByaWF0ZSBtYWls
aW5nIGxpc3QKCkFsdGVybmF0aXZlbHksIGlmIHlvdSBiZWxpZXZlIHRoZSByZWNpcGUgc2hvdWxk
IG5vdCBiZSB1cGdyYWRlZCBhdCB0aGlzIHRpbWUsCnlvdSBjYW4gZmlsbCBSRUNJUEVfTk9fVVBE
QVRFX1JFQVNPTiBpbiByZXNwZWN0aXZlIHJlY2lwZSBmaWxlIHNvIHRoYXQKYXV0b21hdGljIHVw
Z3JhZGVzIHdvdWxkIG5vIGxvbmdlciBiZSBhdHRlbXB0ZWQuCgpQbGVhc2UgcmV2aWV3IHRoZSBh
dHRhY2hlZCBmaWxlcyBmb3IgZnVydGhlciBpbmZvcm1hdGlvbiBhbmQgYnVpbGQvdXBkYXRlIGZh
aWx1cmVzLgpBbnkgcHJvYmxlbSBwbGVhc2UgZmlsZSBhIGJ1ZyBhdCBodHRwczovL2J1Z3ppbGxh
LnlvY3RvcHJvamVjdC5vcmcvZW50ZXJfYnVnLmNnaT9wcm9kdWN0PUF1dG9tYXRlZCUyMFVwZGF0
ZSUyMEhhbmRsZXIKClJlZ2FyZHMsClRoZSBVcGdyYWRlIEhlbHBlcgoKLS0gPjggLS0KRnJvbSBi
MjU4ZmMzZjg2M2RlZmNkMDc0NTRiZmQ2Y2VjMjM4OTYyOWZlODFhIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+CkRhdGU6
IFRodSwgMTUgSnVuIDIwMjMgMTU6MzI6NDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBjdXBzOiB1
cGdyYWRlIDIuNC4yIC0+IDIuNC41CgotLS0KIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1
cHMuaW5jICAgICAgICAgICB8ICAxIC0KIC4uLi9jdXBzL2N1cHMvQ1ZFLTIwMjMtMzIzMjQucGF0
Y2ggICAgICAgICAgICB8IDM2IC0tLS0tLS0tLS0tLS0tLS0tLS0KIC4uLi9jdXBzL3tjdXBzXzIu
NC4yLmJiID0+IGN1cHNfMi40LjUuYmJ9ICAgICB8ICAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAzOCBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzL0NWRS0yMDIzLTMyMzI0LnBhdGNoCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMve2N1cHNfMi40LjIuYmIgPT4gY3Vwc18yLjQuNS5iYn0g
KDUxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzLmluYyBi
L21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHMuaW5jCmluZGV4IGQ3Nzc1OGZkM2YuLmRh
MzIwYjEwODUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHMuaW5j
CisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHMuaW5jCkBAIC0xNSw3ICsxNSw2
IEBAIFNSQ19VUkkgPSAiJHtHSVRIVUJfQkFTRV9VUkl9L2Rvd25sb2FkL3Yke1BWfS9jdXBzLSR7
UFZ9LXNvdXJjZS50YXIuZ3ogXAogICAgICAgICAgICBmaWxlOi8vMDAwNC1jdXBzLWZpeC1tdWx0
aWxpYi1pbnN0YWxsLWZpbGUtY29uZmxpY3RzLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovL3Zv
bGF0aWxlcy45OV9jdXBzIFwKICAgICAgICAgICAgZmlsZTovL2N1cHMtdm9sYXRpbGVzLmNvbmYg
XAotICAgICAgICAgICBmaWxlOi8vQ1ZFLTIwMjMtMzIzMjQucGF0Y2ggXAogICAgICAgICAgICAi
CiAKIEdJVEhVQl9CQVNFX1VSSSA9ICJodHRwczovL2dpdGh1Yi5jb20vT3BlblByaW50aW5nL2N1
cHMvcmVsZWFzZXMiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBz
L0NWRS0yMDIzLTMyMzI0LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwcy9D
VkUtMjAyMy0zMjMyNC5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggNDBiODlj
OTg5OS4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzL0NW
RS0yMDIzLTMyMzI0LnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsMzYgKzAsMCBAQAotRnJvbSAw
N2NiZmZkMTExMDdlZWQzYWFmMWM2NGUzNTU1MmFlYzIwZjc5MmRhIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQotRnJvbTogWmRlbmVrIERvaG5hbCA8emRvaG5hbEByZWRoYXQuY29tPgotRGF0ZTog
VGh1LCAxIEp1biAyMDIzIDEyOjA0OjAwICswMjAwCi1TdWJqZWN0OiBbUEFUQ0hdIGN1cHMvc3Ry
aW5nLmM6IFJldHVybiBpZiBgc2l6ZWAgaXMgMCAoZml4ZXMgQ1ZFLTIwMjMtMzIzMjQpCi0KLUNW
RTogQ1ZFLTIwMjMtMzIzMjQKLVVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQgW2h0dHBzOi8vZ2l0
aHViLmNvbS9PcGVuUHJpbnRpbmcvY3Vwcy9jb21taXQvZmQ4YmMyZDMyNTg5XQotCi0oY2hlcnJ5
IHBpY2tlZCBmcm9tIGNvbW1pdCBmZDhiYzJkMzI1ODlkMWZkOTFmZTFjMDUyMWJlMmE3YzA0NjIx
MDllKQotU2lnbmVkLW9mZi1ieTogU2FuamF5IENoaXRyb2RhIDxzY2hpdHJvZEBjaXNjby5jb20+
Ci0tLS0KLSBjdXBzL3N0cmluZy5jIHwgNCArKysrCi0gMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKQotCi1kaWZmIC0tZ2l0IGEvY3Vwcy9zdHJpbmcuYyBiL2N1cHMvc3RyaW5nLmMKLWlu
ZGV4IDkzY2RhZDE5Li42ZWY1ODUxNSAxMDA2NDQKLS0tLSBhL2N1cHMvc3RyaW5nLmMKLSsrKyBi
L2N1cHMvc3RyaW5nLmMKLUBAIC0xLDYgKzEsNyBAQAotIC8qCi0gICogU3RyaW5nIGZ1bmN0aW9u
cyBmb3IgQ1VQUy4KLSAgKgotKyAqIENvcHlyaWdodCDCqSAyMDIzIGJ5IE9wZW5QcmludGluZy4K
LSAgKiBDb3B5cmlnaHQgwqnCoDIwMDctMjAxOSBieSBBcHBsZSBJbmMuCi0gICogQ29weXJpZ2h0
IMKpwqAxOTk3LTIwMDcgYnkgRWFzeSBTb2Z0d2FyZSBQcm9kdWN0cy4KLSAgKgotQEAgLTczMCw2
ICs3MzEsOSBAQCBfY3Vwc19zdHJsY3B5KGNoYXIgICAgICAgKmRzdCwJCS8qIE8gLSBEZXN0aW5h
dGlvbiBzdHJpbmcgKi8KLSAgIHNpemVfdAlzcmNsZW47CQkJLyogTGVuZ3RoIG9mIHNvdXJjZSBz
dHJpbmcgKi8KLSAKLSAKLSsgIGlmIChzaXplID09IDApCi0rICAgIHJldHVybiAoMCk7Ci0rCi0g
IC8qCi0gICAqIEZpZ3VyZSBvdXQgaG93IG11Y2ggcm9vbSBpcyBuZWVkZWQuLi4KLSAgICovCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzXzIuNC4yLmJiIGIvbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwc18yLjQuNS5iYgpzaW1pbGFyaXR5IGluZGV4IDUx
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzXzIuNC4yLmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzXzIuNC41LmJiCmluZGV4IGY1
Y2E3NDliYWMuLmUxYmI0M2FhM2MgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9j
dXBzL2N1cHNfMi40LjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwc18y
LjQuNS5iYgpAQCAtMiw0ICsyLDQgQEAgcmVxdWlyZSBjdXBzLmluYwogCiBMSUNfRklMRVNfQ0hL
U1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT0zYjgzZWY5NjM4N2YxNDY1NWZjODU0ZGRjM2M2YmQ1
NyIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImYwM2NjYjQwYjA4N2QxZTMwOTQwYTQwZTAxNDFk
Y2JiYTI2M2YzOTk3NGMyMGViOWYyNTIxMDY2YzljNmM5MDgiCitTUkNfVVJJW3NoYTI1NnN1bV0g
PSAiOWE0MDRkZTU1Zjc0NTI1YjBhNjg1MWRmMGNmZGViZmExMjE1YWVjMGU3YzJmN2JlNmI5YjA5
YjY5MTZmYjAwMCIKLS0gCjIuMzkuMgoK

--===============7729891347050702013==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cups-upgrade-2.4.2-2.4.5.patch"

RnJvbSBiMjU4ZmMzZjg2M2RlZmNkMDc0NTRiZmQ2Y2VjMjM4OTYyOWZlODFhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSnVuIDIwMjMgMTU6MzI6NDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
dXBzOiB1cGdyYWRlIDIuNC4yIC0+IDIuNC41CgotLS0KIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9j
dXBzL2N1cHMuaW5jICAgICAgICAgICB8ICAxIC0KIC4uLi9jdXBzL2N1cHMvQ1ZFLTIwMjMtMzIz
MjQucGF0Y2ggICAgICAgICAgICB8IDM2IC0tLS0tLS0tLS0tLS0tLS0tLS0KIC4uLi9jdXBzL3tj
dXBzXzIuNC4yLmJiID0+IGN1cHNfMi40LjUuYmJ9ICAgICB8ICAyICstCiAzIGZpbGVzIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAzOCBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBt
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzL0NWRS0yMDIzLTMyMzI0LnBhdGNoCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMve2N1cHNfMi40LjIuYmIgPT4gY3Vwc18yLjQu
NS5iYn0gKDUxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBz
LmluYyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHMuaW5jCmluZGV4IGQ3Nzc1OGZk
M2YuLmRhMzIwYjEwODUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1
cHMuaW5jCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHMuaW5jCkBAIC0xNSw3
ICsxNSw2IEBAIFNSQ19VUkkgPSAiJHtHSVRIVUJfQkFTRV9VUkl9L2Rvd25sb2FkL3Yke1BWfS9j
dXBzLSR7UFZ9LXNvdXJjZS50YXIuZ3ogXAogICAgICAgICAgICBmaWxlOi8vMDAwNC1jdXBzLWZp
eC1tdWx0aWxpYi1pbnN0YWxsLWZpbGUtY29uZmxpY3RzLnBhdGNoIFwKICAgICAgICAgICAgZmls
ZTovL3ZvbGF0aWxlcy45OV9jdXBzIFwKICAgICAgICAgICAgZmlsZTovL2N1cHMtdm9sYXRpbGVz
LmNvbmYgXAotICAgICAgICAgICBmaWxlOi8vQ1ZFLTIwMjMtMzIzMjQucGF0Y2ggXAogICAgICAg
ICAgICAiCiAKIEdJVEhVQl9CQVNFX1VSSSA9ICJodHRwczovL2dpdGh1Yi5jb20vT3BlblByaW50
aW5nL2N1cHMvcmVsZWFzZXMiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vw
cy9jdXBzL0NWRS0yMDIzLTMyMzI0LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMv
Y3Vwcy9DVkUtMjAyMy0zMjMyNC5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXgg
NDBiODljOTg5OS4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9j
dXBzL0NWRS0yMDIzLTMyMzI0LnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsMzYgKzAsMCBAQAot
RnJvbSAwN2NiZmZkMTExMDdlZWQzYWFmMWM2NGUzNTU1MmFlYzIwZjc5MmRhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQotRnJvbTogWmRlbmVrIERvaG5hbCA8emRvaG5hbEByZWRoYXQuY29tPgot
RGF0ZTogVGh1LCAxIEp1biAyMDIzIDEyOjA0OjAwICswMjAwCi1TdWJqZWN0OiBbUEFUQ0hdIGN1
cHMvc3RyaW5nLmM6IFJldHVybiBpZiBgc2l6ZWAgaXMgMCAoZml4ZXMgQ1ZFLTIwMjMtMzIzMjQp
Ci0KLUNWRTogQ1ZFLTIwMjMtMzIzMjQKLVVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQgW2h0dHBz
Oi8vZ2l0aHViLmNvbS9PcGVuUHJpbnRpbmcvY3Vwcy9jb21taXQvZmQ4YmMyZDMyNTg5XQotCi0o
Y2hlcnJ5IHBpY2tlZCBmcm9tIGNvbW1pdCBmZDhiYzJkMzI1ODlkMWZkOTFmZTFjMDUyMWJlMmE3
YzA0NjIxMDllKQotU2lnbmVkLW9mZi1ieTogU2FuamF5IENoaXRyb2RhIDxzY2hpdHJvZEBjaXNj
by5jb20+Ci0tLS0KLSBjdXBzL3N0cmluZy5jIHwgNCArKysrCi0gMSBmaWxlIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKQotCi1kaWZmIC0tZ2l0IGEvY3Vwcy9zdHJpbmcuYyBiL2N1cHMvc3RyaW5n
LmMKLWluZGV4IDkzY2RhZDE5Li42ZWY1ODUxNSAxMDA2NDQKLS0tLSBhL2N1cHMvc3RyaW5nLmMK
LSsrKyBiL2N1cHMvc3RyaW5nLmMKLUBAIC0xLDYgKzEsNyBAQAotIC8qCi0gICogU3RyaW5nIGZ1
bmN0aW9ucyBmb3IgQ1VQUy4KLSAgKgotKyAqIENvcHlyaWdodCDCqSAyMDIzIGJ5IE9wZW5Qcmlu
dGluZy4KLSAgKiBDb3B5cmlnaHQgwqnCoDIwMDctMjAxOSBieSBBcHBsZSBJbmMuCi0gICogQ29w
eXJpZ2h0IMKpwqAxOTk3LTIwMDcgYnkgRWFzeSBTb2Z0d2FyZSBQcm9kdWN0cy4KLSAgKgotQEAg
LTczMCw2ICs3MzEsOSBAQCBfY3Vwc19zdHJsY3B5KGNoYXIgICAgICAgKmRzdCwJCS8qIE8gLSBE
ZXN0aW5hdGlvbiBzdHJpbmcgKi8KLSAgIHNpemVfdAlzcmNsZW47CQkJLyogTGVuZ3RoIG9mIHNv
dXJjZSBzdHJpbmcgKi8KLSAKLSAKLSsgIGlmIChzaXplID09IDApCi0rICAgIHJldHVybiAoMCk7
Ci0rCi0gIC8qCi0gICAqIEZpZ3VyZSBvdXQgaG93IG11Y2ggcm9vbSBpcyBuZWVkZWQuLi4KLSAg
ICovCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzXzIuNC4yLmJi
IGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwc18yLjQuNS5iYgpzaW1pbGFyaXR5IGlu
ZGV4IDUxJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzXzIuNC4y
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzXzIuNC41LmJiCmlu
ZGV4IGY1Y2E3NDliYWMuLmUxYmI0M2FhM2MgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRl
bmRlZC9jdXBzL2N1cHNfMi40LjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMv
Y3Vwc18yLjQuNS5iYgpAQCAtMiw0ICsyLDQgQEAgcmVxdWlyZSBjdXBzLmluYwogCiBMSUNfRklM
RVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT0zYjgzZWY5NjM4N2YxNDY1NWZjODU0ZGRj
M2M2YmQ1NyIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImYwM2NjYjQwYjA4N2QxZTMwOTQwYTQw
ZTAxNDFkY2JiYTI2M2YzOTk3NGMyMGViOWYyNTIxMDY2YzljNmM5MDgiCitTUkNfVVJJW3NoYTI1
NnN1bV0gPSAiOWE0MDRkZTU1Zjc0NTI1YjBhNjg1MWRmMGNmZGViZmExMjE1YWVjMGU3YzJmN2Jl
NmI5YjA5YjY5MTZmYjAwMCIKLS0gCjIuMzkuMgoK

--===============7729891347050702013==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/cups/cups-dbg: PV changed from "2.4.2" to "2.4.5"
packages/core2-32-poky-linux/cups/cups-dbg: PKGSIZE changed from 6635660 to 6645896 (+0%)
packages/core2-32-poky-linux/cups/cups-dbg: PKGV changed from 2.4.2 [default] to 2.4.5 [default]
packages/core2-32-poky-linux/cups/cups-dev: PV changed from "2.4.2" to "2.4.5"
packages/core2-32-poky-linux/cups/cups-dev: PKGSIZE changed from 188118 to 188119 (+0%)
packages/core2-32-poky-linux/cups/cups-dev: PKGV changed from 2.4.2 [default] to 2.4.5 [default]
packages/core2-32-poky-linux/cups/cups-doc: PV changed from "2.4.2" to "2.4.5"
packages/core2-32-poky-linux/cups/cups-doc: PKGSIZE changed from 225807 to 225888 (+0%)
packages/core2-32-poky-linux/cups/cups-doc: PKGV changed from 2.4.2 [default] to 2.4.5 [default]
packages/core2-32-poky-linux/cups/cups-lib: PV changed from "2.4.2" to "2.4.5"
packages/core2-32-poky-linux/cups/cups-lib: PKGV changed from 2.4.2 [default] to 2.4.5 [default]
packages/core2-32-poky-linux/cups/cups-libimage: PV changed from "2.4.2" to "2.4.5"
packages/core2-32-poky-linux/cups/cups-libimage: PKGV changed from 2.4.2 [default] to 2.4.5 [default]
packages/core2-32-poky-linux/cups/cups-locale-ca: PV changed from "2.4.2" to "2.4.5"
packages/core2-32-poky-linux/cups/cups-locale-ca: PKGV changed from 2.4.2 [default] to 2.4.5 [default]
packages/core2-32-poky-linux/cups/cups-locale-cs: PV changed from "2.4.2" to "2.4.5"
packages/core2-32-poky-linux/cups/cups-locale-cs: PKGV changed from 2.4.2 [default] to 2.4.5 [default]
packages/core2-32-poky-linux/cups/cups-locale-da: PV changed from "2.4.2" to "2.4.5"
packages/core2-32-poky-linux/cups/cups-locale-da: PKGV changed from 2.4.2 [default] to 2.4.5 [default]
packages/core2-32-poky-linux/cups/cups-locale-de: PV changed from "2.4.2" to "2.4.5"
packages/core2-32-poky-linux/cups/cups-locale-de: PKGSIZE changed from 374840 to 374842 (+0%)
packages/core2-32-poky-linux/cups/cups-locale-de: PKGV changed from 2.4.2 [default] to 2.4.5 [default]
packages/core2-32-poky-linux/cups/cups-locale-en: PV changed from "2.4.2" to "2.4.5"
packages/core2-32-poky-linux/cups/cups-locale-en: PKGV changed from 2.4.2 [default] to 2.4.5 [default]
packages/core2-32-poky-linux/cups/cups-locale-es: PV changed from "2.4.2" to "2.4.5"
packages/core2-32-poky-linux/cups/cups-locale-es: PKGV changed from 2.4.2 [default] to 2.4.5 [default]
packages/core2-32-poky-linux/cups/cups-locale-fr: PV changed from "2.4.2" to "2.4.5"
packages/core2-32-poky-linux/cups/cups-locale-fr: PKGV changed from 2.4.2 [default] to 2.4.5 [default]
packages/core2-32-poky-linux/cups/cups-locale-it: PV changed from "2.4.2" to "2.4.5"
packages/core2-32-poky-linux/cups/cups-locale-it: PKGV changed from 2.4.2 [default] to 2.4.5 [default]
packages/core2-32-poky-linux/cups/cups-locale-ja: PV changed from "2.4.2" to "2.4.5"
packages/core2-32-poky-linux/cups/cups-locale-ja: PKGV changed from 2.4.2 [default] to 2.4.5 [default]
packages/core2-32-poky-linux/cups/cups-locale-pt-br: PV changed from "2.4.2" to "2.4.5"
packages/core2-32-poky-linux/cups/cups-locale-pt-br: PKGV changed from 2.4.2 [default] to 2.4.5 [default]
packages/core2-32-poky-linux/cups/cups-locale-ru: PV changed from "2.4.2" to "2.4.5"
packages/core2-32-poky-linux/cups/cups-locale-ru: PKGV changed from 2.4.2 [default] to 2.4.5 [default]
packages/core2-32-poky-linux/cups/cups-locale-zh-cn: PV changed from "2.4.2" to "2.4.5"
packages/core2-32-poky-linux/cups/cups-locale-zh-cn: PKGSIZE changed from 343139 to 343945 (+0%)
packages/core2-32-poky-linux/cups/cups-locale-zh-cn: PKGV changed from 2.4.2 [default] to 2.4.5 [default]
packages/core2-32-poky-linux/cups/cups-src: PV changed from "2.4.2" to "2.4.5"
packages/core2-32-poky-linux/cups/cups-src: PKGSIZE changed from 5880869 to 5904164 (+0%)
packages/core2-32-poky-linux/cups/cups-src: PKGV changed from 2.4.2 [default] to 2.4.5 [default]
packages/core2-32-poky-linux/cups/cups-staticdev: PV changed from "2.4.2" to "2.4.5"
packages/core2-32-poky-linux/cups/cups-staticdev: PKGV changed from 2.4.2 [default] to 2.4.5 [default]
packages/core2-32-poky-linux/cups/cups-webif: PV changed from "2.4.2" to "2.4.5"
packages/core2-32-poky-linux/cups/cups-webif: PKGSIZE changed from 1565527 to 1565612 (+0%)
packages/core2-32-poky-linux/cups/cups-webif: PKGV changed from 2.4.2 [default] to 2.4.5 [default]
packages/core2-32-poky-linux/cups/cups: PV changed from "2.4.2" to "2.4.5"
packages/core2-32-poky-linux/cups/cups: PKGSIZE changed from 7845091 to 7854048 (+0%)
packages/core2-32-poky-linux/cups/cups: PKGV changed from 2.4.2 [default] to 2.4.5 [default]
packages/core2-32-poky-linux/cups: PV changed from "2.4.2" to "2.4.5"
packages/core2-32-poky-linux/cups: PKGV changed from 2.4.2 [default] to 2.4.5 [default]
packages/core2-32-poky-linux/cups: SRC_URI changed from "https://github.com/OpenPrinting/cups/releases/download/v2.4.2/cups-2.4.2-source.tar.gz file://0001-use-echo-only-in-init.patch file://0002-don-t-try-to-run-generated-binaries.patch file://libexecdir.patch file://0004-cups-fix-multilib-install-file-conflicts.patch file://volatiles.99_cups file://cups-volatiles.conf file://CVE-2023-32324.patch" to "https://github.com/OpenPrinting/cups/releases/download/v2.4.5/cups-2.4.5-source.tar.gz file://0001-use-echo-only-in-init.patch file://0002-don-t-try-to-run-generated-binaries.patch file://libexecdir.patch file://0004-cups-fix-multilib-install-file-conflicts.patch file://volatiles.99_cups file://cups-volatiles.conf"

--===============7729891347050702013==--

