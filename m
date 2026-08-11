Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D371C5CFED
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 07:24:01 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49078.1786433030909749959
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 00:23:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=hM7HBejC;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=a7AIMdMx;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019fefb4c738-f00e78f1-8fad-45cf-896f-01d3952b1b0d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1786433030;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=JMuvrVpd2Aa8r9Td9TMasAZ2/gecyl3u+N3si113Oms=;
	b=hM7HBejCyg1uJiFO65p96U9EH1qgUY3Zk/9JxuW31Gxv/IoFKjNf7cQoxRuxtVN9
	L8yjMfz5AtVcsTs767v2O+jm6p0QSgTEweiWXjiG5E8x7Mk+OfqdpuR2An0kSzosmPJ
	7zEvMVn5CSRrR9n0dZ7XH6dvk0zTcLsF+xvezkCY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1786433030;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=JMuvrVpd2Aa8r9Td9TMasAZ2/gecyl3u+N3si113Oms=;
	b=a7AIMdMx6A9SSnPNuiAe5/sQplL7/PxI2pUMRe5n8ilw1c5cA5rX8cQh0WcNaGkH
	eU3FcKeT+rXLKFDomboZL/ZDAhgdGPm8b15Zmp7y1Uu/svWNOVlpFmiLpOT2oEk03DG
	yxltKp+W6I1eeQcy74v2ZNEDHeTvhY91yk5SX28s=
Content-Type: multipart/mixed; boundary="===============8507998262313273389=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] expat: upgrading to 2.8.3 FAILED
Message-ID: <0101019fefb4c738-f00e78f1-8fad-45cf-896f-01d3952b1b0d-000000@us-west-2.amazonses.com>
Date: Tue, 11 Aug 2026 07:23:49 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.11-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 07:24:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243157

--===============8507998262313273389==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sCgp0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFk
ZSBIZWxwZXIKdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBl
KHMpICpleHBhdCogdG8gKjIuOC4zKiBoYXMgRmFpbGVkKGRvX2NvbXBpbGUpLgoKRGV0YWlsZWQg
ZXJyb3IgaW5mb3JtYXRpb246Cgpkb19jb21waWxlIGZhaWxlZAoKCgpOZXh0IHN0ZXBzOgogICAg
LSBhcHBseSB0aGUgcGF0Y2g6IGdpdCBhbSAwMDAxLWV4cGF0LXVwZ3JhZGUtMi44LjItMi44LjMu
cGF0Y2gKICAgIC0gY2hlY2sgdGhlIGNoYW5nZXMgdG8gdXBzdHJlYW0gcGF0Y2hlcyBhbmQgc3Vt
bWFyaXplIHRoZW0gaW4gdGhlIGNvbW1pdCBtZXNzYWdlLAogICAgLSBjb21waWxlIGFuIGltYWdl
IHRoYXQgY29udGFpbnMgdGhlIHBhY2thZ2UKICAgIC0gcGVyZm9ybSBzb21lIGJhc2ljIHNhbml0
eSB0ZXN0cwogICAgLSBhbWVuZCB0aGUgcGF0Y2ggYW5kIHNpZ24gaXQgb2ZmOiBnaXQgY29tbWl0
IC1zIC0tcmVzZXQtYXV0aG9yIC0tYW1lbmQKICAgIC0gc2VuZCBpdCB0byB0aGUgYXBwcm9wcmlh
dGUgbWFpbGluZyBsaXN0CgpBbHRlcm5hdGl2ZWx5LCBpZiB5b3UgYmVsaWV2ZSB0aGUgcmVjaXBl
IHNob3VsZCBub3QgYmUgdXBncmFkZWQgYXQgdGhpcyB0aW1lLAp5b3UgY2FuIGZpbGwgUkVDSVBF
X05PX1VQREFURV9SRUFTT04gaW4gcmVzcGVjdGl2ZSByZWNpcGUgZmlsZSBzbyB0aGF0CmF1dG9t
YXRpYyB1cGdyYWRlcyB3b3VsZCBubyBsb25nZXIgYmUgYXR0ZW1wdGVkLgoKUGxlYXNlIHJldmll
dyB0aGUgYXR0YWNoZWQgZmlsZXMgZm9yIGZ1cnRoZXIgaW5mb3JtYXRpb24gYW5kIGJ1aWxkL3Vw
ZGF0ZSBmYWlsdXJlcy4KQW55IHByb2JsZW0gcGxlYXNlIGZpbGUgYSBidWcgYXQgaHR0cHM6Ly9i
dWd6aWxsYS55b2N0b3Byb2plY3Qub3JnL2VudGVyX2J1Zy5jZ2k/cHJvZHVjdD1BdXRvbWF0ZWQl
MjBVcGRhdGUlMjBIYW5kbGVyCgpSZWdhcmRzLApUaGUgVXBncmFkZSBIZWxwZXIKCi0tID44IC0t
CkZyb20gZDJiN2U0YmU5NDU1ZjExNmI3MWVjMTk1NDg1MGIyNjVhYzcyYzYzZiBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKRnJvbTogVXBncmFkZSBIZWxwZXIgPGF1aEB5b2N0b3Byb2plY3Qub3Jn
PgpEYXRlOiBUdWUsIDExIEF1ZyAyMDI2IDA1OjMzOjQ5ICswMDAwClN1YmplY3Q6IFtQQVRDSF0g
ZXhwYXQ6IHVwZ3JhZGUgMi44LjIgLT4gMi44LjMKTUlNRS1WZXJzaW9uOiAxLjAKQ29udGVudC1U
eXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04CkNvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6
IDhiaXQKClNvdXJjZTogQ2hhbmdlcwoKISEgPGJsaW5rPkV4cGF0IGhhcyBVTkZJWEVEIFNFQ1VS
SVRZIElTU1VFUyE8L2JsaW5rPiAgICAgICAgICAgICAgICAgICAgICAgICAhIQohISBQbGVhc2Ug
c2VlIGh0dHBzOi8vZ2l0aHViLmNvbS9saWJleHBhdC9saWJleHBhdC9pc3N1ZXMvMTE2MCBmb3Ig
ZGV0YWlscy4gICEhCiEhIFN0YXJ0aW5nIDIwMjYtMDgtMDEsIGZvciB1cCB0byBzaXggbW9udGhz
IG15IHdvcmsgbWFpbnRhaW5pbmcgbGliZXhwYXQgICAgISEKISEgd2lsbCBiZSBmdW5kZWQgYnkg
dGhlIENpdHkgb2YgTXVuaWNoIGFzIHBhcnQgb2YgdGhlaXIgICAgICAgICAgICAgICAgICAgICAh
IQohISBPcGVuIFNvdXJjZSBTYWJiYXRpY2FsIChodHRwczovL29wZW5zb3VyY2UubXVlbmNoZW4u
ZGUvc2FiYmF0aWNhbC5odG1sKSAgICEhCiEhIOKAlCB0aGFuayB5b3UhICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAhIQohISAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgU2ViYXN0aWFuIFBpcHBpbmcgLS0gQmVybGlu
LCAyMDI2LTA4LTAzICEhClJlbGVhc2UgMi44LjMgTW9uIEF1Z3VzdCAxMCAyMDI2CiAgICAgICAg
U2VjdXJpdHkgZml4ZXM6CiAgICAgICAgICAgIzEyOTYgIENWRS0yMDI2LTcyNTIyIC0tIEZpeCBh
biBvdXQtb2YtYm91bmRzIHJlYWQgYW5kIHRoZSByZXN1bHRpbmcKICAgICAgICAgICAgICAgICAg
ICBpbmZpbml0ZSBsb29wIGNhdXNlZCBieSB0cmVhdGluZyBsb3cgc3Vycm9nYXRlcyAoVW5pY29k
ZSkKICAgICAgICAgICAgICAgICAgICB0aGUgc2FtZSBhcyBoaWdoIHN1cnJvZ2F0ZXMgaW4gZnVu
Y3Rpb25zICpfdG9VdGYxNi4KICAgICAgICAgICAgICAgICAgICBOZWVkcyBFeHBhdCBjb21waWxl
ZCB3aXRoIDE2Yml0IGNoYXJhY3RlciBzdXBwb3J0CiAgICAgICAgICAgICAgICAgICAgKGUuZy4g
d2l0aCBGaXJlZm94IGFuZC9vciBvbiBXaW5kb3dzKSB0byBiZSBhZmZlY3RlZC4KICAgICAgICAg
ICAgICAgICAgICBVcHN0cmVhbSBDVlNTIDMuMSB2ZWN0b3I6CiAgICAgICAgICAgICAgICAgICAg
QVY6Ti9BQzpML1BSOk4vVUk6Ti9TOlUvQzpOL0k6Ti9BOkggKENWU1Mgc2NvcmU6IDcuNSkKICAg
ICAgICAgICAgICAgICAgICAoTm90ZSB0aGUgIkFWOk4iIGZvciBuZXR3b3JrL3JlbW90ZSwgdGhl
ICJBVjpMIiBpbiBOVkQgYnkKICAgICAgICAgICAgICAgICAgICBNaXRyZSBpcyBtaXN0YWtlbi4p
CiAgICAgICAgICAgICAgICAgICAgT3JpZ2luYWwgYnVnIHJlcG9ydCBmcm9tIE1vemlsbGEgYXQ6
CiAgICAgICAgICAgICAgICAgICAgaHR0cHM6Ly9idWd6aWxsYS5tb3ppbGxhLm9yZy9zaG93X2J1
Zy5jZ2k/aWQ9MjA1MzE1MwoKICAgICAgICBCdWcgZml4ZXM6CiAgICAgIzEyOTcgIzEzMDAgIGxp
YjogRml4IHN1cHBvcnQgZm9yIDIrIEdpQiBkb2N1bWVudHMgKHJlZ3Jlc3Npb24gZnJvbSAyLjgu
MikKICAgICAgICAgICAjMTI4NiAgbGliOiBSZWplY3QgZW1wdHkgdmVyc2lvbiBpbiB0aGUgWE1M
IGRlY2xhcmF0aW9uCiAgICAgIzEzMDUgIzEzMDYgIGxpYjogRml4IHByaW50ZiBmb3JtYXQgZm9y
IEFJWAoKICAgICAgICBPdGhlciBjaGFuZ2VzOgogICAgICAgICAgICMxMzA5ICBDTWFrZXxBSVg6
IEVuYWJsZSBFWFBBVF9ERVZfVVJBTkRPTSBieSBkZWZhdWx0IGZvciBBSVgKICAgICAgICAgICAj
MTI5NSAgQ01ha2V8V2luZG93czogQWRkIGEgNjRiaXQgTWluR1cgdG9vbGNoYWluIGZpbGUKICAg
ICAjMTI4NyAjMTI4OSAgQ01ha2V8V2luZG93czogU3RhcnQgaW52b2tpbmcgTVNWQyB3aXRoIC9z
b3VyY2UtY2hhcnNldDp1dGYtOAogICAgICAgICAgICMxMjg5ICBDTWFrZXxXaW5kb3dzOiBTdGFy
dCByZXF1aXJpbmcgTVNWQyAyMDE1IFVwZGF0ZSAyIG9yIGxhdGVyCiAgICAgICAgICAgIzEzMDAg
IERvY3VtZW50IHRoZSBjdXJyZW50IHdyYXAtYXJvdW5kIGlzc3VlcyB3aXRoIGZ1bmN0aW9ucwog
ICAgICAgICAgICAgICAgICAgIC0gWE1MX0dldEN1cnJlbnRCeXRlSW5kZXgKICAgICAgICAgICAg
ICAgICAgICAtIFhNTF9HZXRDdXJyZW50Q29sdW1uTnVtYmVyCiAgICAgICAgICAgICAgICAgICAg
LSBYTUxfR2V0Q3VycmVudExpbmVOdW1iZXIKICAgICAgICAgICAgICAgICAgICAtIFhNTF9HZXRB
dHRyaWJ1dGVJbmZvCiAgICAgICAgICAgICAgICAgICAgZXhwbGljaXRseS4KICAgICAgICAgICAj
MTMwMyAgQWRkcmVzcyBDbGFuZyBTdGF0aWMgQW5hbHl6ZXIgMjIgd2FybmluZwogICAgICAgICAg
ICAgICAgICAgIGBjb3JlLk51bGxQb2ludGVyQXJpdGhtYAogICAgICMxMzEzICMxMzE0ICBWZXJz
aW9uIGluZm8gYnVtcGVkIGZyb20gMTM6MjoxMiAobGliZXhwYXQqLnNvLjEuMTIuMikKICAgICAg
ICAgICAgICAgICAgICB0byAxMzozOjEyIChsaWJleHBhdCouc28uMS4xMi4zKTsgc2VlIGh0dHBz
Oi8vdmVyYnVtcC5kZS8KICAgICAgICAgICAgICAgICAgICBmb3Igd2hhdCB0aGVzZSBudW1iZXJz
IGRvCgogICAgICAgIEluZnJhc3RydWN0dXJlOgogICAgICAgICAgICMxMzExICBDSTogTGltaXQg
d29ya2Zsb3cgcnVudGltZSBhbmQgcGFja2FnZSBpbnN0YWxsYXRpb24gcnVudGltZQogICAgICAg
ICAgICMxMzEwICBDSTogUGluIENwcGNoZWNrIHZlcnNpb24gZm9yIGEgcm9idXN0IENJCiAgICAg
ICAgICAgIzEzMTAgIENJOiBNaWdyYXRlIENwcGNoZWNrIENJIGZyb20gbWFjT1MgdG8gTGludXgK
ICAgICAgICAgICAjMTMxMiAgQ0k6IEdldCBDRkxBR1MgYW5kIENYWEZMQUdTIGJhY2sgaW4gc3lu
YyBmb3IgYm90aCBFbXNjcmlwdGVuCiAgICAgICAgICAgICAgICAgICAgYW5kIFdBU0kgU0RLCiAg
ICAgICAgICAgIzEzMDQgIENJOiBBY3RpdmF0ZSBBZGRyZXNzU2FuaXRpemVyIGZvciBNU1ZDIFdp
bmRvd3MgQ0kKICAgICAgICAgICAjMTMwOCAgQ0k6IEludHJvZHVjZSB6aXptb3Igc3RhdGljIGFu
YWx5c2lzIGZvciBHaXRIdWIgQWN0aW9ucwogICAgICAgICAgICMxMzA4ICBDCgpbQ2hhbmdlbG9n
IHRydW5jYXRlZCBhcyBpdCBleGNlZWRzIDMwMDAgY2hhcmFjdGVyczsKdGhlIGZ1bGwgY2hhbmdl
bG9nIGNhbiBiZSBmb3VuZCBpbiBhbiBhdHRhY2htZW50IHRvIHRoZSBBVUggZW1haWxdCi0tLQog
bWV0YS9yZWNpcGVzLWNvcmUvZXhwYXQve2V4cGF0XzIuOC4yLmJiID0+IGV4cGF0XzIuOC4zLmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1jb3JlL2V4cGF0L3tleHBhdF8yLjguMi5iYiA9PiBleHBhdF8y
LjguMy5iYn0gKDkyJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9leHBhdC9leHBh
dF8yLjguMi5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL2V4cGF0L2V4cGF0XzIuOC4zLmJiCnNpbWls
YXJpdHkgaW5kZXggOTIlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3JlL2V4cGF0L2V4cGF0
XzIuOC4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS9leHBhdC9leHBhdF8yLjguMy5i
YgppbmRleCAwYjlkYmUxNjFiLi43OWU4YzE1MjI3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
Y29yZS9leHBhdC9leHBhdF8yLjguMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9leHBhdC9l
eHBhdF8yLjguMy5iYgpAQCAtMTUsNyArMTUsNyBAQCBTUkNfVVJJID0gIiR7R0lUSFVCX0JBU0Vf
VVJJfS9kb3dubG9hZC9SXyR7VkVSU0lPTl9UQUd9L2V4cGF0LSR7UFZ9LnRhci5iejIgIFwKIEdJ
VEhVQl9CQVNFX1VSSSA9ICJodHRwczovL2dpdGh1Yi5jb20vbGliZXhwYXQvbGliZXhwYXQvcmVs
ZWFzZXMvIgogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAicmVsZWFzZXMvdGFnL1JfKD9QPHB2ZXI+
LispIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNjllN2Y1MjQxN2Q4NWIxYzJiN2ZlODU1ZTE3
NmVlYzU1ZDBiMmQ3ZDkyZDY5MTM3MmQ4MzNhMWM3ZGY3OTIzYiIKK1NSQ19VUklbc2hhMjU2c3Vt
XSA9ICJiNGNjMjQ4MzkyN2Q1ZTkwYmY4YzQwYjQ0YTZiOTViMzY4YjQyYThhOTZlMjU4ODNmY2Ux
ODhiNDhhOTJiNjcwIgogCiBFWFRSQV9PRUNNQUtFOmNsYXNzLW5hdGl2ZSArPSAiLURFWFBBVF9C
VUlMRF9ET0NTPU9GRiIKIAotLSAKMi40Ny4xCgo=

--===============8507998262313273389==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="expat-changelog.txt"

Q2hhbmdlbG9nIGZvciBleHBhdDogMi44LjIgLT4gMi44LjMKU291cmNlOiBDaGFuZ2VzCgohISA8
Ymxpbms+RXhwYXQgaGFzIFVORklYRUQgU0VDVVJJVFkgSVNTVUVTITwvYmxpbms+ICAgICAgICAg
ICAgICAgICAgICAgICAgICEhCiEhIFBsZWFzZSBzZWUgaHR0cHM6Ly9naXRodWIuY29tL2xpYmV4
cGF0L2xpYmV4cGF0L2lzc3Vlcy8xMTYwIGZvciBkZXRhaWxzLiAgISEKISEgU3RhcnRpbmcgMjAy
Ni0wOC0wMSwgZm9yIHVwIHRvIHNpeCBtb250aHMgbXkgd29yayBtYWludGFpbmluZyBsaWJleHBh
dCAgICAhIQohISB3aWxsIGJlIGZ1bmRlZCBieSB0aGUgQ2l0eSBvZiBNdW5pY2ggYXMgcGFydCBv
ZiB0aGVpciAgICAgICAgICAgICAgICAgICAgICEhCiEhIE9wZW4gU291cmNlIFNhYmJhdGljYWwg
KGh0dHBzOi8vb3BlbnNvdXJjZS5tdWVuY2hlbi5kZS9zYWJiYXRpY2FsLmh0bWwpICAgISEKISEg
4oCUIHRoYW5rIHlvdSEgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICEhCiEhICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBTZWJhc3RpYW4gUGlwcGluZyAtLSBCZXJsaW4sIDIwMjYtMDgtMDMgISEKUmVsZWFzZSAyLjgu
MyBNb24gQXVndXN0IDEwIDIwMjYKICAgICAgICBTZWN1cml0eSBmaXhlczoKICAgICAgICAgICAj
MTI5NiAgQ1ZFLTIwMjYtNzI1MjIgLS0gRml4IGFuIG91dC1vZi1ib3VuZHMgcmVhZCBhbmQgdGhl
IHJlc3VsdGluZwogICAgICAgICAgICAgICAgICAgIGluZmluaXRlIGxvb3AgY2F1c2VkIGJ5IHRy
ZWF0aW5nIGxvdyBzdXJyb2dhdGVzIChVbmljb2RlKQogICAgICAgICAgICAgICAgICAgIHRoZSBz
YW1lIGFzIGhpZ2ggc3Vycm9nYXRlcyBpbiBmdW5jdGlvbnMgKl90b1V0ZjE2LgogICAgICAgICAg
ICAgICAgICAgIE5lZWRzIEV4cGF0IGNvbXBpbGVkIHdpdGggMTZiaXQgY2hhcmFjdGVyIHN1cHBv
cnQKICAgICAgICAgICAgICAgICAgICAoZS5nLiB3aXRoIEZpcmVmb3ggYW5kL29yIG9uIFdpbmRv
d3MpIHRvIGJlIGFmZmVjdGVkLgogICAgICAgICAgICAgICAgICAgIFVwc3RyZWFtIENWU1MgMy4x
IHZlY3RvcjoKICAgICAgICAgICAgICAgICAgICBBVjpOL0FDOkwvUFI6Ti9VSTpOL1M6VS9DOk4v
STpOL0E6SCAoQ1ZTUyBzY29yZTogNy41KQogICAgICAgICAgICAgICAgICAgIChOb3RlIHRoZSAi
QVY6TiIgZm9yIG5ldHdvcmsvcmVtb3RlLCB0aGUgIkFWOkwiIGluIE5WRCBieQogICAgICAgICAg
ICAgICAgICAgIE1pdHJlIGlzIG1pc3Rha2VuLikKICAgICAgICAgICAgICAgICAgICBPcmlnaW5h
bCBidWcgcmVwb3J0IGZyb20gTW96aWxsYSBhdDoKICAgICAgICAgICAgICAgICAgICBodHRwczov
L2J1Z3ppbGxhLm1vemlsbGEub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDUzMTUzCgogICAgICAgIEJ1
ZyBmaXhlczoKICAgICAjMTI5NyAjMTMwMCAgbGliOiBGaXggc3VwcG9ydCBmb3IgMisgR2lCIGRv
Y3VtZW50cyAocmVncmVzc2lvbiBmcm9tIDIuOC4yKQogICAgICAgICAgICMxMjg2ICBsaWI6IFJl
amVjdCBlbXB0eSB2ZXJzaW9uIGluIHRoZSBYTUwgZGVjbGFyYXRpb24KICAgICAjMTMwNSAjMTMw
NiAgbGliOiBGaXggcHJpbnRmIGZvcm1hdCBmb3IgQUlYCgogICAgICAgIE90aGVyIGNoYW5nZXM6
CiAgICAgICAgICAgIzEzMDkgIENNYWtlfEFJWDogRW5hYmxlIEVYUEFUX0RFVl9VUkFORE9NIGJ5
IGRlZmF1bHQgZm9yIEFJWAogICAgICAgICAgICMxMjk1ICBDTWFrZXxXaW5kb3dzOiBBZGQgYSA2
NGJpdCBNaW5HVyB0b29sY2hhaW4gZmlsZQogICAgICMxMjg3ICMxMjg5ICBDTWFrZXxXaW5kb3dz
OiBTdGFydCBpbnZva2luZyBNU1ZDIHdpdGggL3NvdXJjZS1jaGFyc2V0OnV0Zi04CiAgICAgICAg
ICAgIzEyODkgIENNYWtlfFdpbmRvd3M6IFN0YXJ0IHJlcXVpcmluZyBNU1ZDIDIwMTUgVXBkYXRl
IDIgb3IgbGF0ZXIKICAgICAgICAgICAjMTMwMCAgRG9jdW1lbnQgdGhlIGN1cnJlbnQgd3JhcC1h
cm91bmQgaXNzdWVzIHdpdGggZnVuY3Rpb25zCiAgICAgICAgICAgICAgICAgICAgLSBYTUxfR2V0
Q3VycmVudEJ5dGVJbmRleAogICAgICAgICAgICAgICAgICAgIC0gWE1MX0dldEN1cnJlbnRDb2x1
bW5OdW1iZXIKICAgICAgICAgICAgICAgICAgICAtIFhNTF9HZXRDdXJyZW50TGluZU51bWJlcgog
ICAgICAgICAgICAgICAgICAgIC0gWE1MX0dldEF0dHJpYnV0ZUluZm8KICAgICAgICAgICAgICAg
ICAgICBleHBsaWNpdGx5LgogICAgICAgICAgICMxMzAzICBBZGRyZXNzIENsYW5nIFN0YXRpYyBB
bmFseXplciAyMiB3YXJuaW5nCiAgICAgICAgICAgICAgICAgICAgYGNvcmUuTnVsbFBvaW50ZXJB
cml0aG1gCiAgICAgIzEzMTMgIzEzMTQgIFZlcnNpb24gaW5mbyBidW1wZWQgZnJvbSAxMzoyOjEy
IChsaWJleHBhdCouc28uMS4xMi4yKQogICAgICAgICAgICAgICAgICAgIHRvIDEzOjM6MTIgKGxp
YmV4cGF0Ki5zby4xLjEyLjMpOyBzZWUgaHR0cHM6Ly92ZXJidW1wLmRlLwogICAgICAgICAgICAg
ICAgICAgIGZvciB3aGF0IHRoZXNlIG51bWJlcnMgZG8KCiAgICAgICAgSW5mcmFzdHJ1Y3R1cmU6
CiAgICAgICAgICAgIzEzMTEgIENJOiBMaW1pdCB3b3JrZmxvdyBydW50aW1lIGFuZCBwYWNrYWdl
IGluc3RhbGxhdGlvbiBydW50aW1lCiAgICAgICAgICAgIzEzMTAgIENJOiBQaW4gQ3BwY2hlY2sg
dmVyc2lvbiBmb3IgYSByb2J1c3QgQ0kKICAgICAgICAgICAjMTMxMCAgQ0k6IE1pZ3JhdGUgQ3Bw
Y2hlY2sgQ0kgZnJvbSBtYWNPUyB0byBMaW51eAogICAgICAgICAgICMxMzEyICBDSTogR2V0IENG
TEFHUyBhbmQgQ1hYRkxBR1MgYmFjayBpbiBzeW5jIGZvciBib3RoIEVtc2NyaXB0ZW4KICAgICAg
ICAgICAgICAgICAgICBhbmQgV0FTSSBTREsKICAgICAgICAgICAjMTMwNCAgQ0k6IEFjdGl2YXRl
IEFkZHJlc3NTYW5pdGl6ZXIgZm9yIE1TVkMgV2luZG93cyBDSQogICAgICAgICAgICMxMzA4ICBD
STogSW50cm9kdWNlIHppem1vciBzdGF0aWMgYW5hbHlzaXMgZm9yIEdpdEh1YiBBY3Rpb25zCiAg
ICAgICAgICAgIzEzMDggIENJOiBTdGFydCB1c2luZyBgcGVyc2lzdC1jcmVkZW50aWFsczogZmFs
c2VgIHdpdGggR2l0IGNoZWNrb3V0CiAgICAgICAgICAgIzEyMTkgIENJOiBBZGQgYSA3IGRheSBj
b29sZG93biB0byBEZXBlbmRhYm90IGZvciBHaXRIdWIgQWN0aW9ucwogICAgICMxMzAyICMxMzAz
ICBDSTogQnVtcCBDbGFuZyBmcm9tIDIxIHRvIDIyCiAgICAgIzEyOTMgIzEyOTQgIFVwZGF0ZSBw
cm9qZWN0IHN0YXR1cyBmb3IgMjAyNi0wOAogICAgICMxMzAxICMxMzA3ICBBZGQgU1BEWCBsaWNl
bnNlIGlkZW50aWZpZXJzIHRvIHRoZSBzb3VyY2UgY29kZQoKICAgICAgICBTcGVjaWFsIHRoYW5r
cyB0bzoKICAgICAgICAgICAgRXZnZW55IEtvdGtvdgogICAgICAgICAgICBIZW5yaSBTaXZvbmVu
CiAgICAgICAgICAgIEthcnRpayBLZW5jaGkKICAgICAgICAgICAgTWF0dGhldyBGZXJuYW5kZXoK
ICAgICAgICAgICAgTWF0dGhldyBXb3puaWN6a2EKICAgICAgICAgICAgU3RhbiBVbGJyeWNoCiAg
ICAgICAgICAgIFR1dWtrYSBQYXNhbmVuCiAgICAgICAgICAgIFdpbGxpYW0gV29vZHJ1ZmYKICAg
ICAgICAgICAgICAgICBhbmQKICAgICAgICAgICAgQW50aHJvcGljCiAgICAgICAgICAgIENpdHkg
b2YgTXVuaWNoIE9wZW4gU291cmNlIFNhYmJhdGljYWwKICAgICAgICAgICAgTW96aWxsYSBTZWN1
cml0eSBUZWFtCiAgICAgICAgICAgIFN1YnZlcnNpb24KICAgICAgICAgICAgeml6bW9yIHN0YXRp
YyBhbmFseXNpcwoKICAgICAgICAgICAgICAgICAgICBVcHN0cmVhbSBDVlNTIDMuMSB2ZWN0b3I6
CiAgICAgICAgICAgICAgICAgICAgQVY6Ti9BQzpML1BSOk4vVUk6Ti9TOlUvQzpOL0k6Ti9BOkgg
KENWU1Mgc2NvcmU6IDcuNSkKICAgICAgICAgICAgICAgICAgICAoTm90ZSB0aGUgIkFWOk4iIGZv
ciBuZXR3b3JrL3JlbW90ZSBhbmQgdGhlICJBQzpMIgogICAgICAgICAgICAgICAgICAgIGZvciBs
b3cgY29tcGxleGl0eTsgdGhlIE5WRCBlbnRyeSBmcm9tIE1pdHJlIGlzIG1pc3Rha2VuLikK

--===============8507998262313273389==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-expat-upgrade-2.8.2-2.8.3.patch"

RnJvbSBkMmI3ZTRiZTk0NTVmMTE2YjcxZWMxOTU0ODUwYjI2NWFjNzJjNjNmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTEgQXVnIDIwMjYgMDU6MzM6NDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
eHBhdDogdXBncmFkZSAyLjguMiAtPiAyLjguMwpNSU1FLVZlcnNpb246IDEuMApDb250ZW50LVR5
cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzog
OGJpdAoKU291cmNlOiBDaGFuZ2VzCgohISA8Ymxpbms+RXhwYXQgaGFzIFVORklYRUQgU0VDVVJJ
VFkgSVNTVUVTITwvYmxpbms+ICAgICAgICAgICAgICAgICAgICAgICAgICEhCiEhIFBsZWFzZSBz
ZWUgaHR0cHM6Ly9naXRodWIuY29tL2xpYmV4cGF0L2xpYmV4cGF0L2lzc3Vlcy8xMTYwIGZvciBk
ZXRhaWxzLiAgISEKISEgU3RhcnRpbmcgMjAyNi0wOC0wMSwgZm9yIHVwIHRvIHNpeCBtb250aHMg
bXkgd29yayBtYWludGFpbmluZyBsaWJleHBhdCAgICAhIQohISB3aWxsIGJlIGZ1bmRlZCBieSB0
aGUgQ2l0eSBvZiBNdW5pY2ggYXMgcGFydCBvZiB0aGVpciAgICAgICAgICAgICAgICAgICAgICEh
CiEhIE9wZW4gU291cmNlIFNhYmJhdGljYWwgKGh0dHBzOi8vb3BlbnNvdXJjZS5tdWVuY2hlbi5k
ZS9zYWJiYXRpY2FsLmh0bWwpICAgISEKISEg4oCUIHRoYW5rIHlvdSEgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICEhCiEhICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBTZWJhc3RpYW4gUGlwcGluZyAtLSBCZXJsaW4s
IDIwMjYtMDgtMDMgISEKUmVsZWFzZSAyLjguMyBNb24gQXVndXN0IDEwIDIwMjYKICAgICAgICBT
ZWN1cml0eSBmaXhlczoKICAgICAgICAgICAjMTI5NiAgQ1ZFLTIwMjYtNzI1MjIgLS0gRml4IGFu
IG91dC1vZi1ib3VuZHMgcmVhZCBhbmQgdGhlIHJlc3VsdGluZwogICAgICAgICAgICAgICAgICAg
IGluZmluaXRlIGxvb3AgY2F1c2VkIGJ5IHRyZWF0aW5nIGxvdyBzdXJyb2dhdGVzIChVbmljb2Rl
KQogICAgICAgICAgICAgICAgICAgIHRoZSBzYW1lIGFzIGhpZ2ggc3Vycm9nYXRlcyBpbiBmdW5j
dGlvbnMgKl90b1V0ZjE2LgogICAgICAgICAgICAgICAgICAgIE5lZWRzIEV4cGF0IGNvbXBpbGVk
IHdpdGggMTZiaXQgY2hhcmFjdGVyIHN1cHBvcnQKICAgICAgICAgICAgICAgICAgICAoZS5nLiB3
aXRoIEZpcmVmb3ggYW5kL29yIG9uIFdpbmRvd3MpIHRvIGJlIGFmZmVjdGVkLgogICAgICAgICAg
ICAgICAgICAgIFVwc3RyZWFtIENWU1MgMy4xIHZlY3RvcjoKICAgICAgICAgICAgICAgICAgICBB
VjpOL0FDOkwvUFI6Ti9VSTpOL1M6VS9DOk4vSTpOL0E6SCAoQ1ZTUyBzY29yZTogNy41KQogICAg
ICAgICAgICAgICAgICAgIChOb3RlIHRoZSAiQVY6TiIgZm9yIG5ldHdvcmsvcmVtb3RlLCB0aGUg
IkFWOkwiIGluIE5WRCBieQogICAgICAgICAgICAgICAgICAgIE1pdHJlIGlzIG1pc3Rha2VuLikK
ICAgICAgICAgICAgICAgICAgICBPcmlnaW5hbCBidWcgcmVwb3J0IGZyb20gTW96aWxsYSBhdDoK
ICAgICAgICAgICAgICAgICAgICBodHRwczovL2J1Z3ppbGxhLm1vemlsbGEub3JnL3Nob3dfYnVn
LmNnaT9pZD0yMDUzMTUzCgogICAgICAgIEJ1ZyBmaXhlczoKICAgICAjMTI5NyAjMTMwMCAgbGli
OiBGaXggc3VwcG9ydCBmb3IgMisgR2lCIGRvY3VtZW50cyAocmVncmVzc2lvbiBmcm9tIDIuOC4y
KQogICAgICAgICAgICMxMjg2ICBsaWI6IFJlamVjdCBlbXB0eSB2ZXJzaW9uIGluIHRoZSBYTUwg
ZGVjbGFyYXRpb24KICAgICAjMTMwNSAjMTMwNiAgbGliOiBGaXggcHJpbnRmIGZvcm1hdCBmb3Ig
QUlYCgogICAgICAgIE90aGVyIGNoYW5nZXM6CiAgICAgICAgICAgIzEzMDkgIENNYWtlfEFJWDog
RW5hYmxlIEVYUEFUX0RFVl9VUkFORE9NIGJ5IGRlZmF1bHQgZm9yIEFJWAogICAgICAgICAgICMx
Mjk1ICBDTWFrZXxXaW5kb3dzOiBBZGQgYSA2NGJpdCBNaW5HVyB0b29sY2hhaW4gZmlsZQogICAg
ICMxMjg3ICMxMjg5ICBDTWFrZXxXaW5kb3dzOiBTdGFydCBpbnZva2luZyBNU1ZDIHdpdGggL3Nv
dXJjZS1jaGFyc2V0OnV0Zi04CiAgICAgICAgICAgIzEyODkgIENNYWtlfFdpbmRvd3M6IFN0YXJ0
IHJlcXVpcmluZyBNU1ZDIDIwMTUgVXBkYXRlIDIgb3IgbGF0ZXIKICAgICAgICAgICAjMTMwMCAg
RG9jdW1lbnQgdGhlIGN1cnJlbnQgd3JhcC1hcm91bmQgaXNzdWVzIHdpdGggZnVuY3Rpb25zCiAg
ICAgICAgICAgICAgICAgICAgLSBYTUxfR2V0Q3VycmVudEJ5dGVJbmRleAogICAgICAgICAgICAg
ICAgICAgIC0gWE1MX0dldEN1cnJlbnRDb2x1bW5OdW1iZXIKICAgICAgICAgICAgICAgICAgICAt
IFhNTF9HZXRDdXJyZW50TGluZU51bWJlcgogICAgICAgICAgICAgICAgICAgIC0gWE1MX0dldEF0
dHJpYnV0ZUluZm8KICAgICAgICAgICAgICAgICAgICBleHBsaWNpdGx5LgogICAgICAgICAgICMx
MzAzICBBZGRyZXNzIENsYW5nIFN0YXRpYyBBbmFseXplciAyMiB3YXJuaW5nCiAgICAgICAgICAg
ICAgICAgICAgYGNvcmUuTnVsbFBvaW50ZXJBcml0aG1gCiAgICAgIzEzMTMgIzEzMTQgIFZlcnNp
b24gaW5mbyBidW1wZWQgZnJvbSAxMzoyOjEyIChsaWJleHBhdCouc28uMS4xMi4yKQogICAgICAg
ICAgICAgICAgICAgIHRvIDEzOjM6MTIgKGxpYmV4cGF0Ki5zby4xLjEyLjMpOyBzZWUgaHR0cHM6
Ly92ZXJidW1wLmRlLwogICAgICAgICAgICAgICAgICAgIGZvciB3aGF0IHRoZXNlIG51bWJlcnMg
ZG8KCiAgICAgICAgSW5mcmFzdHJ1Y3R1cmU6CiAgICAgICAgICAgIzEzMTEgIENJOiBMaW1pdCB3
b3JrZmxvdyBydW50aW1lIGFuZCBwYWNrYWdlIGluc3RhbGxhdGlvbiBydW50aW1lCiAgICAgICAg
ICAgIzEzMTAgIENJOiBQaW4gQ3BwY2hlY2sgdmVyc2lvbiBmb3IgYSByb2J1c3QgQ0kKICAgICAg
ICAgICAjMTMxMCAgQ0k6IE1pZ3JhdGUgQ3BwY2hlY2sgQ0kgZnJvbSBtYWNPUyB0byBMaW51eAog
ICAgICAgICAgICMxMzEyICBDSTogR2V0IENGTEFHUyBhbmQgQ1hYRkxBR1MgYmFjayBpbiBzeW5j
IGZvciBib3RoIEVtc2NyaXB0ZW4KICAgICAgICAgICAgICAgICAgICBhbmQgV0FTSSBTREsKICAg
ICAgICAgICAjMTMwNCAgQ0k6IEFjdGl2YXRlIEFkZHJlc3NTYW5pdGl6ZXIgZm9yIE1TVkMgV2lu
ZG93cyBDSQogICAgICAgICAgICMxMzA4ICBDSTogSW50cm9kdWNlIHppem1vciBzdGF0aWMgYW5h
bHlzaXMgZm9yIEdpdEh1YiBBY3Rpb25zCiAgICAgICAgICAgIzEzMDggIEMKCltDaGFuZ2Vsb2cg
dHJ1bmNhdGVkIGFzIGl0IGV4Y2VlZHMgMzAwMCBjaGFyYWN0ZXJzOwp0aGUgZnVsbCBjaGFuZ2Vs
b2cgY2FuIGJlIGZvdW5kIGluIGFuIGF0dGFjaG1lbnQgdG8gdGhlIEFVSCBlbWFpbF0KLS0tCiBt
ZXRhL3JlY2lwZXMtY29yZS9leHBhdC97ZXhwYXRfMi44LjIuYmIgPT4gZXhwYXRfMi44LjMuYmJ9
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUvZXhwYXQve2V4cGF0XzIuOC4yLmJiID0+IGV4cGF0XzIu
OC4zLmJifSAoOTIlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2V4cGF0L2V4cGF0
XzIuOC4yLmJiIGIvbWV0YS9yZWNpcGVzLWNvcmUvZXhwYXQvZXhwYXRfMi44LjMuYmIKc2ltaWxh
cml0eSBpbmRleCA5MiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvcmUvZXhwYXQvZXhwYXRf
Mi44LjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb3JlL2V4cGF0L2V4cGF0XzIuOC4zLmJi
CmluZGV4IDBiOWRiZTE2MWIuLjc5ZThjMTUyMjcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1j
b3JlL2V4cGF0L2V4cGF0XzIuOC4yLmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2V4cGF0L2V4
cGF0XzIuOC4zLmJiCkBAIC0xNSw3ICsxNSw3IEBAIFNSQ19VUkkgPSAiJHtHSVRIVUJfQkFTRV9V
Ukl9L2Rvd25sb2FkL1JfJHtWRVJTSU9OX1RBR30vZXhwYXQtJHtQVn0udGFyLmJ6MiAgXAogR0lU
SFVCX0JBU0VfVVJJID0gImh0dHBzOi8vZ2l0aHViLmNvbS9saWJleHBhdC9saWJleHBhdC9yZWxl
YXNlcy8iCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJyZWxlYXNlcy90YWcvUl8oP1A8cHZlcj4u
KykiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI2OWU3ZjUyNDE3ZDg1YjFjMmI3ZmU4NTVlMTc2
ZWVjNTVkMGIyZDdkOTJkNjkxMzcyZDgzM2ExYzdkZjc5MjNiIgorU1JDX1VSSVtzaGEyNTZzdW1d
ID0gImI0Y2MyNDgzOTI3ZDVlOTBiZjhjNDBiNDRhNmI5NWIzNjhiNDJhOGE5NmUyNTg4M2ZjZTE4
OGI0OGE5MmI2NzAiCiAKIEVYVFJBX09FQ01BS0U6Y2xhc3MtbmF0aXZlICs9ICItREVYUEFUX0JV
SUxEX0RPQ1M9T0ZGIgogCi0tIAoyLjQ3LjEKCg==

--===============8507998262313273389==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 956 .bb files complete (0 cached, 956 parsed). 1987 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-d525ca6d09b355d481ae2c21d8f2bcd9bae66336"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:d525ca6d09b355d481ae2c21d8f2bcd9bae66336"
meta-yocto-bsp       
meta-poky            = "master:0afedb9b1195525861f9140d6f33e9cd4118b199"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 383 Local 229 Mirrors 0 Missed 154 Current 213 (59% match, 74% complete)
done.
Removing 32 stale sstate objects for arch qemux86_64...done.
Removing 22 stale sstate objects for arch x86-64-v3...done.
Removing 26 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 285 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 291 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 294 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc-locale_2.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 299 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 302 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 306 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/cross-localedef-native_2.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 308 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 313 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 316 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 319 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 321 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 323 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 327 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 329 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 330 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 333 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe cross-localedef-native-2.44+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe glibc-locale-2.44+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sed-4.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe coreutils-9.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe bash-5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.42.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 335 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: recipe coreutils-9.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glibc-locale-2.44+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sed-4.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 337 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 339 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 341 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 344 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 345 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 376 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 378 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.42.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 379 of 596 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_create_spdx_setscene)
NOTE: recipe cross-localedef-native-2.44+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 382 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 386 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.9.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 388 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 389 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 391 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 392 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe perl-5.44.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 394 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 395 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-2.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.44.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-native-10.47-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 396 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 399 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 400 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.78-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 405 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 409 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 412 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/cross-localedef-native_2.44.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 414 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 415 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 417 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre2-native-10.47-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 418 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 420 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 421 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_16.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 422 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 423 of 596 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.1.bb:do_create_spdx_setscene)
NOTE: recipe util-linux-2.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cross-localedef-native-2.44+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 424 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe perl-5.44.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 426 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.78-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 428 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_11.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.9.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cross-localedef-native-2.44+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 429 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcc-initial-16.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 431 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 433 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.47.bb:do_create_spdx_setscene)
NOTE: Running setscene task 436 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libgcc-16.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe perl-5.44.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 437 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 438 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gawk-native-5.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 440 of 596 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_create_recipe_spdx_setscene)
NOTE: recipe qemu-native-11.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.20.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 444 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gdbm-1.26-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-initial-16.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 445 of 596 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_create_spdx_setscene)
NOTE: recipe libgcc-16.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 446 of 596 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_create_spdx_setscene)
NOTE: recipe binutils-cross-x86_64-2.47-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 447 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe libxcrypt-4.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 450 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gawk-native-5.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 452 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 454 of 596 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_create_spdx_setscene)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe qemu-native-11.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 455 of 596 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/autoconf-archive/autoconf-archive_2024.10.16.bb:do_create_spdx_setscene)
NOTE: recipe shadow-4.20.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre2-native-10.47-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 456 of 596 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_create_spdx_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 457 of 596 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_create_spdx_setscene)
NOTE: recipe attr-2.6.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.47-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 458 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cmake/cmake-native_4.4.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 460 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-native-2.42.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 462 of 596 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_create_spdx_setscene)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe unzip-native-1_6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 463 of 596 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 467 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpcre2-native-10.47-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 470 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe cmake-native-4.4.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe unzip-native-1_6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-linux-libuuid-native-2.42.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gdbm-native-1.26-r0: task do_create_spdx_setscene: Started
NOTE: recipe autoconf-archive-native-2024.10.16-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 471 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 476 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 480 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.44.bb:do_stash_locale_setscene)
NOTE: Running setscene task 485 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libedit-native-20260512-3.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 491 of 596 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 495 of 596 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libffi-native-3.8.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-native-3_3.53.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cmake-native-4.4.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 496 of 596 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_create_spdx_setscene)
NOTE: recipe gdbm-native-1.26-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 497 of 596 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_spdx_setscene)
NOTE: recipe autoconf-archive-native-2024.10.16-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libedit-native-20260512-3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 498 of 596 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 499 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cmake/cmake-native_4.4.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 500 of 596 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libgcc-16.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-native-3.8.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-native-3_3.53.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 502 of 596 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 503 of 596 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 505 of 596 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 507 of 596 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe glibc-2.44+git-r0: task do_stash_locale_setscene: Started
NOTE: recipe unzip-native-1_6.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe rpm-native-1_4.20.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 508 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe xz-native-5.8.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cmake-native-4.4.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 515 of 596 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/autoconf-archive/autoconf-archive_2024.10.16.bb:do_create_recipe_spdx_setscene)
NOTE: recipe zstd-native-1.5.7-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 517 of 596 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 519 of 596 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.195.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe unzip-native-1_6.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 520 of 596 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_spdx_setscene)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-native-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe bzip2-native-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-native-5.8.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libedit-native-20260512-3.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe openssl-native-3.5.7-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 521 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/gettext/gettext-minimal-native_1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 522 of 596 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe cmake-native-4.4.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe util-linux-libuuid-native-2.42.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 523 of 596 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe zstd-native-1.5.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 524 of 596 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 526 of 596 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe zlib-native-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bzip2-native-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 527 of 596 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libedit-native-20260512-3.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gettext-minimal-native-1.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 532 of 596 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-native-3.5.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe autoconf-archive-native-2024.10.16-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 536 of 596 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 537 of 596 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmicrohttpd-native-1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 538 of 596 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-libuuid-native-2.42.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe elfutils-native-0.195-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-native-3_3.53.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 540 of 596 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gettext-minimal-native-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ncurses-native-6.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe zstd-native-1.5.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libffi-native-3.8.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libmicrohttpd-native-1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 543 of 596 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe autoconf-archive-native-2024.10.16-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 544 of 596 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 545 of 596 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libarchive-native-3.8.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-native-0.195-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-native-3_3.53.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 549 of 596 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.36.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 551 of 596 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.45.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-native-5.8.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe p11-kit-native-0.26.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-native-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-native-1.5.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe glibc-2.44+git-r0: task do_stash_locale_setscene: Succeeded
NOTE: Running setscene task 552 of 596 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ncurses-native-6.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 554 of 596 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.11.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libffi-native-3.8.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libarchive-native-3.8.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 555 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 556 of 596 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 559 of 596 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gnutls-native-3.8.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-native-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 560 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_16.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 561 of 596 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_recipe_spdx_setscene)
NOTE: recipe xz-native-5.8.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe p11-kit-native-0.26.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-native-3.5.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe util-linux-native-2.42.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtasn1-native-4.21.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 564 of 596 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 566 of 596 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxslt-native-1.1.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnutls-native-3.8.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 567 of 596 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe meson-native-1.11.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-native-3.5.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe util-linux-native-2.42.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtasn1-native-4.21.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 568 of 596 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 569 of 596 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcc-initial-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 570 of 596 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe gawk-native-5.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glibc-2.44+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 574 of 596 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe meson-native-1.11.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 578 of 596 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 579 of 596 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 580 of 596 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_recipe_spdx_setscene)
NOTE: recipe ncurses-native-6.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxslt-native-1.1.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-build-native-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 581 of 596 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-2.44+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-installer-native-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 582 of 596 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 583 of 596 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.36.1.bb:do_recipe_qa_setscene)
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 585 of 596 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.45.bb:do_recipe_qa_setscene)
NOTE: recipe python3-build-native-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-packaging-native-26.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-native-6.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gdbm-native-1.26-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe util-linux-native-2.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-initial-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 589 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_16.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-installer-native-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 590 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_16.1.bb:do_gcc_stash_builddir_setscene)
NOTE: recipe gawk-native-5.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-native-1.3.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe bzip2-native-1.0.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 593 of 596 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-packaging-native-26.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-native-2.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-native-1.26-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running task 183 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_recipe_qa)
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 594 of 596 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/gettext/gettext-minimal-native_1.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe bzip2-native-1.0.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxslt-native-1.1.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-native-3.14.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-native-1.3.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running task 302 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_fetch)
NOTE: recipe libgcc-initial-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-16.1.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: Running task 356 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_fetch)
NOTE: Running task 383 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.0.1.bb:do_fetch)
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gettext-minimal-native-1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxslt-native-1.1.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 422 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_fetch)
NOTE: Running task 424 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_fetch)
NOTE: Running task 430 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.5.1.bb:do_fetch)
NOTE: Running task 432 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.44.bb:do_fetch)
NOTE: Running task 436 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_fetch)
NOTE: recipe gawk-native-5.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-native-3.14.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 444 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_fetch)
NOTE: Running task 446 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_fetch)
NOTE: Running task 447 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.11.2.bb:do_fetch)
NOTE: recipe libgcc-initial-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gettext-minimal-native-1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running task 457 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.36.1.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.18-r0: task do_fetch: Started
NOTE: Running noexec task 467 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_fetch)
NOTE: Running task 481 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.36.1.bb:do_write_config)
NOTE: recipe expat-native-2.8.3-r0: task do_recipe_qa: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_fetch: Started
NOTE: recipe gawk-native-5.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_fetch: Started
NOTE: recipe python3-build-native-1.5.1-r0: task do_fetch: Started
NOTE: recipe glibc-2.44+git-r0: task do_fetch: Started
NOTE: Running task 482 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_unpack)
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_fetch: Started
NOTE: recipe python3-installer-native-1.0.1-r0: task do_fetch: Started
NOTE: Running task 483 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-packaging-native-26.3-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_fetch: Started
NOTE: recipe meson-native-1.11.2-r0: task do_fetch: Started
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 484 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_unpack)
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_fetch: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_unpack: Started
NOTE: Running task 485 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_unpack)
NOTE: recipe python3-build-native-1.5.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_fetch: Succeeded
NOTE: Running task 490 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_unpack)
NOTE: recipe python3-native-3.14.7-r0: task do_fetch: Started
NOTE: Running task 491 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.5.1.bb:do_unpack)
NOTE: recipe python3-packaging-native-26.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-installer-native-1.0.1-r0: task do_fetch: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expat-native-2.8.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 492 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_unpack)
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_fetch: Started
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_write_config: Started
NOTE: Running task 493 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.0.1.bb:do_unpack)
NOTE: Running task 494 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_fetch)
NOTE: recipe python3-native-3.14.7-r0: task do_fetch: Succeeded
NOTE: Running task 495 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_unpack)
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_fetch: Succeeded
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_write_config: Succeeded
NOTE: Running task 502 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_unpack)
NOTE: Running task 506 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_fetch)
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_unpack: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-build-native-1.5.1-r0: task do_unpack: Started
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_unpack: Started
NOTE: Running task 514 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_patch)
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-build-native-1.5.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-packaging-native-26.3-r0: task do_unpack: Started
NOTE: Running task 518 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_fetch)
NOTE: recipe glibc-2.44+git-r0: task do_fetch: Succeeded
NOTE: Running task 519 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_patch)
NOTE: Running task 520 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.5.1.bb:do_patch)
NOTE: recipe python3-installer-native-1.0.1-r0: task do_unpack: Started
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_unpack: Succeeded
NOTE: recipe expat-native-2.8.3-r0: task do_fetch: Started
NOTE: Running task 521 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.44.bb:do_unpack)
NOTE: Running task 522 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_patch)
NOTE: recipe python3-packaging-native-26.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-installer-native-1.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 523 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_patch)
NOTE: recipe expat-native-2.8.3-r0: task do_fetch: Succeeded
NOTE: Running task 524 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.0.1.bb:do_patch)
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_unpack: Started
NOTE: recipe libtasn1-native-4.21.0-r0: task do_fetch: Started
NOTE: Running task 525 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_unpack)
NOTE: recipe python3-native-3.14.7-r0: task do_unpack: Started
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_patch: Started
NOTE: recipe python3-build-native-1.5.1-r0: task do_patch: Started
NOTE: recipe glibc-2.44+git-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 526 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_fetch: Succeeded
NOTE: Running task 527 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_patch)
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_patch: Started
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe python3-build-native-1.5.1-r0: task do_patch: Succeeded
NOTE: recipe util-linux-native-2.42.2-r0: task do_fetch: Started
NOTE: Running task 529 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.36.1.bb:do_unpack)
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_patch: Started
NOTE: Running task 535 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_fetch)
NOTE: recipe util-linux-native-2.42.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_patch: Succeeded
NOTE: Running task 538 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_fetch)
NOTE: Running noexec task 553 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_fetch)
NOTE: Running task 555 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_fetch)
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_patch: Succeeded
NOTE: recipe python3-packaging-native-26.3-r0: task do_patch: Started
NOTE: recipe python3-installer-native-1.0.1-r0: task do_patch: Started
NOTE: Running task 561 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_unpack)
NOTE: recipe expat-native-2.8.3-r0: task do_unpack: Started
NOTE: recipe python3-packaging-native-26.3-r0: task do_patch: Succeeded
NOTE: Running task 572 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_fetch)
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_patch: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_fetch: Started
NOTE: recipe expat-native-2.8.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libarchive-native-3.8.9-r0: task do_fetch: Started
NOTE: recipe python3-installer-native-1.0.1-r0: task do_patch: Succeeded
NOTE: recipe meson-native-1.11.2-r0: task do_fetch: Succeeded
NOTE: Running task 574 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.11.2.bb:do_unpack)
NOTE: Running task 576 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.5.bb:do_fetch)
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_fetch: Started
NOTE: recipe util-linux-native-2.42.2-r0: task do_unpack: Started
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-native-2.3.8-r0: task do_fetch: Started
NOTE: Running task 577 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.36.1.bb:do_patch)
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_patch: Succeeded
NOTE: recipe expat-native-2.8.3-r0: task do_unpack: Succeeded
NOTE: Running task 580 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_patch)
NOTE: Running task 581 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_fetch)
NOTE: recipe meson-native-1.11.2-r0: task do_unpack: Started
NOTE: recipe p11-kit-native-0.26.5-r0: task do_fetch: Started
NOTE: recipe expat-native-2.8.3-r0: task do_patch: Started
NOTE: recipe gnutls-native-3.8.13-r0: task do_fetch: Started
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_patch: Started
NOTE: recipe expat-native-2.8.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 583 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_fetch)
NOTE: recipe expat-native-2.8.3-r0: task do_patch: Succeeded
NOTE: Running task 584 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libmicrohttpd-native-1.0.10-r0: task do_fetch: Started
NOTE: recipe expat-native-2.8.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe meson-native-1.11.2-r0: task do_unpack: Succeeded
NOTE: Running task 585 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_generate_toolchain_file)
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_patch: Succeeded
NOTE: Running task 586 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.11.2.bb:do_patch)
NOTE: recipe expat-native-2.8.3-r0: task do_generate_toolchain_file: Started
NOTE: recipe expat-native-2.8.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe meson-native-1.11.2-r0: task do_patch: Started
NOTE: Running task 591 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.195.bb:do_fetch)
NOTE: recipe expat-native-2.8.3-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 592 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_configure)
NOTE: recipe gnutls-native-3.8.13-r0: task do_fetch: Succeeded
NOTE: recipe expat-native-2.8.3-r0: task do_configure: Started
NOTE: Running task 597 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_fetch)
NOTE: recipe elfutils-native-0.195-r0: task do_fetch: Started
NOTE: recipe meson-native-1.11.2-r0: task do_patch: Succeeded
NOTE: Running task 602 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_fetch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Started
NOTE: recipe util-linux-native-2.42.2-r0: task do_unpack: Succeeded
NOTE: recipe rpm-native-1_4.20.1-r0: task do_fetch: Started
NOTE: Running task 603 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_patch)
WARNING: libtool-cross-2.6.2-r0 do_fetch: Failed to fetch URL https://ftpmirror.gnu.org/gnu/libtool/libtool-2.6.2.tar.xz, attempting MIRRORS if available
NOTE: recipe util-linux-native-2.42.2-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 612 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_unpack)
NOTE: recipe python3-native-3.14.7-r0: task do_unpack: Succeeded
WARNING: libtasn1-native-4.21.0-r0 do_fetch: Failed to fetch URL https://ftpmirror.gnu.org/gnu/libtasn1/libtasn1-4.21.0.tar.gz, attempting MIRRORS if available
NOTE: Running task 613 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_patch)
NOTE: recipe gnutls-native-3.8.13-r0: task do_unpack: Started
NOTE: recipe python3-native-3.14.7-r0: task do_patch: Started
NOTE: recipe gcc-cross-x86_64-16.1.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 632 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_fetch)
NOTE: recipe libtool-cross-2.6.2-r0: task do_fetch: Succeeded
NOTE: Running task 633 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_unpack)
NOTE: recipe util-linux-native-2.42.2-r0: task do_patch: Succeeded
NOTE: Running task 672 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_fetch)
NOTE: recipe attr-2.6.0-r0: task do_fetch: Started
NOTE: recipe attr-2.6.0-r0: task do_fetch: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_unpack: Started
NOTE: Running task 673 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_unpack)
NOTE: recipe libtasn1-native-4.21.0-r0: task do_fetch: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Started
NOTE: Running task 674 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_unpack)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_fetch: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 682 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_unpack)
NOTE: recipe libtool-cross-2.6.2-r0: task do_unpack: Succeeded
NOTE: Running task 683 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_patch)
NOTE: recipe libtasn1-native-4.21.0-r0: task do_unpack: Started
NOTE: recipe attr-2.6.0-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_patch: Started
NOTE: recipe attr-2.6.0-r0: task do_unpack: Succeeded
NOTE: Running task 684 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_patch)
NOTE: recipe libtasn1-native-4.21.0-r0: task do_unpack: Succeeded
NOTE: Running task 685 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_patch)
NOTE: recipe attr-2.6.0-r0: task do_patch: Started
NOTE: recipe libtasn1-native-4.21.0-r0: task do_patch: Started
NOTE: recipe gnutls-native-3.8.13-r0: task do_unpack: Succeeded
NOTE: Running task 686 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_patch)
NOTE: recipe attr-2.6.0-r0: task do_patch: Succeeded
NOTE: Running task 702 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.5.bb:do_write_config)
NOTE: recipe libtasn1-native-4.21.0-r0: task do_patch: Succeeded
NOTE: Running task 715 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_unpack)
NOTE: recipe python3-native-3.14.7-r0: task do_patch: Succeeded
NOTE: Running task 719 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_fetch)
NOTE: recipe p11-kit-native-0.26.5-r0: task do_write_config: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_fetch: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_unpack: Started
NOTE: recipe gnutls-native-3.8.13-r0: task do_patch: Started
NOTE: recipe p11-kit-native-0.26.5-r0: task do_write_config: Succeeded
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_unpack: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 720 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_patch)
NOTE: Running task 722 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_patch)
NOTE: Running task 723 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_fetch)
NOTE: recipe glibc-2.44+git-r0: task do_unpack: Succeeded
NOTE: Running task 724 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.44.bb:do_patch)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_patch: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_patch: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Started
NOTE: Running task 727 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_11.0.3.bb:do_fetch)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_patch: Succeeded
NOTE: Running task 729 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_fetch)
NOTE: recipe glibc-2.44+git-r0: task do_patch: Started
NOTE: recipe qemu-native-11.0.3-r0: task do_fetch: Started
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_fetch: Started
NOTE: Running task 764 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_write_config)
NOTE: recipe libpam-1.7.2-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-native-3.8.13-r0: task do_patch: Succeeded
NOTE: Running task 766 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_write_config)
NOTE: Running task 767 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_unpack)
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_write_config: Started
NOTE: recipe libpam-1.7.2-r0: task do_write_config: Started
NOTE: recipe libpam-1.7.2-r0: task do_unpack: Started
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_write_config: Succeeded
NOTE: Running task 773 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_fetch)
NOTE: recipe libpam-1.7.2-r0: task do_write_config: Succeeded
NOTE: Running task 782 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_create_recipe_spdx)
NOTE: recipe acl-2.4.0-r0: task do_fetch: Started
NOTE: recipe libpam-1.7.2-r0: task do_unpack: Succeeded
NOTE: Running task 783 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_patch)
NOTE: recipe acl-2.4.0-r0: task do_fetch: Succeeded
NOTE: recipe expat-native-2.8.3-r0: task do_create_recipe_spdx: Started
NOTE: Running task 788 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_unpack)
NOTE: recipe expat-native-2.8.3-r0: task do_configure: Succeeded
NOTE: Running task 789 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_compile)
NOTE: recipe acl-2.4.0-r0: task do_unpack: Started
NOTE: recipe libpam-1.7.2-r0: task do_patch: Started
NOTE: recipe acl-2.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 791 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_patch)
NOTE: recipe expat-native-2.8.3-r0: task do_compile: Started
NOTE: recipe libpam-1.7.2-r0: task do_patch: Succeeded
NOTE: Running task 794 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_fetch)
NOTE: recipe p11-kit-native-0.26.5-r0: task do_fetch: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_patch: Started
NOTE: Running task 795 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.5.bb:do_unpack)
NOTE: recipe expat-native-2.8.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_fetch: Succeeded
NOTE: Running task 796 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_unpack)
NOTE: recipe zlib-1.3.2-r0: task do_fetch: Started
NOTE: recipe zlib-1.3.2-r0: task do_fetch: Succeeded
NOTE: Running task 798 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_create_recipe_spdx)
NOTE: recipe acl-2.4.0-r0: task do_patch: Succeeded
NOTE: Running task 800 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_unpack)
NOTE: Running task 806 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_fetch)
NOTE: recipe p11-kit-native-0.26.5-r0: task do_unpack: Started
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_unpack: Started
NOTE: recipe zlib-1.3.2-r0: task do_unpack: Started
NOTE: recipe gdbm-1.26-r0: task do_fetch: Started
NOTE: recipe gdbm-1.26-r0: task do_fetch: Succeeded
NOTE: Running task 807 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_fetch)
NOTE: recipe zlib-1.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 808 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_patch)
NOTE: recipe python3-native-3.14.7-r0: task do_create_recipe_spdx: Started
NOTE: recipe zlib-1.3.2-r0: task do_patch: Started
NOTE: recipe libcap-2.78-r0: task do_fetch: Started
NOTE: recipe libcap-2.78-r0: task do_fetch: Succeeded
NOTE: Running task 809 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: recipe zlib-1.3.2-r0: task do_patch: Succeeded
NOTE: Running task 815 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_unpack)
NOTE: recipe glibc-2.44+git-r0: task do_patch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: Running task 817 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_unpack)
NOTE: recipe python3-native-3.14.7-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 818 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_create_recipe_spdx)
NOTE: recipe libcap-2.78-r0: task do_unpack: Started
NOTE: recipe gdbm-1.26-r0: task do_unpack: Started
NOTE: recipe libcap-2.78-r0: task do_unpack: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_unpack: Succeeded
NOTE: Running task 819 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: Running task 820 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_patch)
NOTE: Running task 821 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_patch)
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe libcap-2.78-r0: task do_patch: Started
NOTE: recipe gdbm-1.26-r0: task do_patch: Started
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_unpack: Succeeded
NOTE: Running task 822 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_patch)
NOTE: recipe libcap-2.78-r0: task do_patch: Succeeded
NOTE: Running task 831 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_fetch)
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_patch: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_patch: Succeeded
NOTE: Running task 832 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_recipe_qa)
NOTE: Running task 844 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.0.1.bb:do_create_recipe_spdx)
NOTE: recipe ncurses-6.6-r0: task do_fetch: Started
NOTE: recipe expat-2.8.3-r0: task do_recipe_qa: Started
NOTE: recipe python3-installer-native-1.0.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe ncurses-6.6-r0: task do_fetch: Succeeded
NOTE: Running task 845 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_unpack)
NOTE: recipe expat-2.8.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 846 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_fetch)
NOTE: recipe python3-installer-native-1.0.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_unpack: Started
NOTE: Running task 847 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: Running task 849 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_fetch)
NOTE: recipe expat-2.8.3-r0: task do_fetch: Started
NOTE: recipe expat-2.8.3-r0: task do_fetch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: Running task 850 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_unpack)
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_fetch: Succeeded
NOTE: Running task 851 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_unpack)
NOTE: recipe bash-5.3-r0: task do_fetch: Started
NOTE: recipe bash-5.3-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.8.3-r0: task do_unpack: Started
NOTE: Running task 856 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_fetch)
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_unpack: Started
NOTE: recipe p11-kit-native-0.26.5-r0: task do_unpack: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_fetch: Started
NOTE: Running task 857 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.5.bb:do_patch)
NOTE: recipe base-passwd-3.6.8-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.8.3-r0: task do_unpack: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: Running task 858 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_unpack)
NOTE: Running task 859 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_patch)
NOTE: Running task 862 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_fetch)
NOTE: recipe expat-2.8.3-r0: task do_patch: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_fetch: Started
NOTE: recipe bash-5.3-r0: task do_unpack: Started
NOTE: recipe p11-kit-native-0.26.5-r0: task do_patch: Started
NOTE: recipe p11-kit-native-0.26.5-r0: task do_patch: Succeeded
NOTE: Running task 872 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_unpack)
NOTE: recipe expat-2.8.3-r0: task do_patch: Succeeded
NOTE: Running task 877 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_fetch)
NOTE: recipe base-passwd-3.6.8-r0: task do_unpack: Started
NOTE: recipe expat-native-2.8.3-r0: task do_compile: Succeeded
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_patch: Succeeded
NOTE: Running task 879 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 880 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_install)
NOTE: recipe shadow-4.20.2-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_unpack: Succeeded
NOTE: Running task 881 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_patch)
NOTE: recipe shadow-4.20.2-r0: task do_fetch: Succeeded
NOTE: Running task 882 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_create_recipe_spdx)
NOTE: recipe bash-5.3-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.8.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 883 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_patch)
NOTE: recipe base-passwd-3.6.8-r0: task do_patch: Started
NOTE: recipe expat-native-2.8.3-r0: task do_install: Started
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe bash-5.3-r0: task do_patch: Started
NOTE: recipe ncurses-6.6-r0: task do_unpack: Succeeded
NOTE: recipe expat-native-2.8.3-r0: task do_install: Succeeded
NOTE: Running task 884 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_patch)
NOTE: recipe bash-completion-2.17.0-r0: task do_fetch: Succeeded
NOTE: Running task 885 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_unpack)
NOTE: Running task 886 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_populate_sysroot)
NOTE: recipe expat-2.8.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 888 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_generate_toolchain_file)
NOTE: recipe ncurses-6.6-r0: task do_patch: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_unpack: Started
NOTE: recipe expat-2.8.3-r0: task do_generate_toolchain_file: Started
NOTE: recipe expat-native-2.8.3-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 893 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_fetch)
NOTE: recipe expat-2.8.3-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 894 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_fetch)
NOTE: recipe bash-completion-2.17.0-r0: task do_unpack: Succeeded
NOTE: Running task 895 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_patch)
NOTE: recipe libcap-ng-0.9.3-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_patch: Started
NOTE: recipe bash-5.3-r0: task do_patch: Succeeded
NOTE: Running task 897 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_fetch)
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_fetch: Succeeded
NOTE: Running task 898 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_fetch)
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_unpack: Succeeded
NOTE: Running task 899 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_patch)
NOTE: recipe bash-completion-2.17.0-r0: task do_patch: Succeeded
NOTE: recipe sqlite3-3_3.53.4-r0: task do_fetch: Started
NOTE: Running task 900 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.5.1.bb:do_create_recipe_spdx)
NOTE: recipe base-passwd-3.6.8-r0: task do_patch: Succeeded
NOTE: Running task 905 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_fetch)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_fetch: Succeeded
NOTE: Running task 906 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_fetch)
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Started
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 907 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_fetch)
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_patch: Started
NOTE: recipe perl-5.44.0-r0: task do_fetch: Started
NOTE: recipe sed-4.10-r0: task do_fetch: Started
NOTE: recipe python3-build-native-1.5.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe perl-5.44.0-r0: task do_fetch: Succeeded
NOTE: recipe expat-native-2.8.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 908 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_fetch)
NOTE: recipe sed-4.10-r0: task do_fetch: Succeeded
NOTE: Running task 910 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_unpack)
NOTE: recipe util-linux-2.42.2-r0: task do_fetch: Started
NOTE: Running task 911 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe util-linux-2.42.2-r0: task do_fetch: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_patch: Succeeded
NOTE: Running task 912 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_create_spdx)
NOTE: Running task 920 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_unpack)
NOTE: recipe coreutils-9.11-r0: task do_fetch: Started
NOTE: recipe shadow-4.20.2-r0: task do_unpack: Started
NOTE: recipe coreutils-9.11-r0: task do_fetch: Succeeded
NOTE: Running task 921 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_unpack)
NOTE: recipe python3-build-native-1.5.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_unpack: Started
NOTE: Running task 922 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_unpack)
NOTE: recipe expat-native-2.8.3-r0: task do_create_spdx: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_unpack: Started
NOTE: recipe python3-native-3.14.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Started
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_patch: Succeeded
NOTE: recipe sqlite3-3_3.53.4-r0: task do_unpack: Succeeded
NOTE: Running task 926 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_unpack)
NOTE: Running task 927 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_patch)
NOTE: recipe libxcrypt-4.5.2-r0: task do_fetch: Succeeded
NOTE: Running task 928 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_unpack)
NOTE: recipe expat-native-2.8.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 929 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_unpack)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_patch: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_unpack: Started
NOTE: recipe util-linux-2.42.2-r0: task do_unpack: Started
NOTE: recipe perl-5.44.0-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_patch: Succeeded
NOTE: Running task 930 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_unpack)
NOTE: recipe python3-native-3.14.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sed-4.10-r0: task do_unpack: Started
NOTE: Running task 931 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_configure)
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Succeeded
NOTE: recipe qemu-native-11.0.3-r0: task do_fetch: Succeeded
NOTE: Running task 932 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_patch)
NOTE: Running task 933 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_11.0.3.bb:do_unpack)
NOTE: recipe qemu-native-11.0.3-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_fetch: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_patch: Started
NOTE: Running task 934 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_unpack)
NOTE: recipe shadow-4.20.2-r0: task do_unpack: Succeeded
NOTE: Running task 935 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_patch)
NOTE: recipe sed-4.10-r0: task do_unpack: Succeeded
NOTE: Running task 936 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_unpack)
NOTE: recipe python3-native-3.14.7-r0: task do_configure: Started
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_unpack: Succeeded
NOTE: recipe libcap-ng-0.9.3-r0: task do_unpack: Started
NOTE: Running task 937 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_patch)
NOTE: recipe shadow-4.20.2-r0: task do_patch: Started
NOTE: recipe coreutils-9.11-r0: task do_unpack: Started
NOTE: recipe shadow-4.20.2-r0: task do_patch: Succeeded
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_patch: Started
NOTE: Running task 938 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_patch)
NOTE: recipe libxcrypt-4.5.2-r0: task do_unpack: Succeeded
NOTE: Running task 939 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_patch)
NOTE: recipe sed-4.10-r0: task do_patch: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_patch: Started
NOTE: recipe gmp-6.3.0-r0: task do_patch: Succeeded
NOTE: Running task 941 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_fetch)
NOTE: recipe sed-4.10-r0: task do_patch: Succeeded
NOTE: Running task 943 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_fetch)
NOTE: recipe perl-5.44.0-r0: task do_unpack: Succeeded
NOTE: Running task 944 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_patch)
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Succeeded
NOTE: Running task 945 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_create_recipe_spdx)
NOTE: recipe ptest-runner-2.5.1-r0: task do_fetch: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_patch: Succeeded
NOTE: Running task 955 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_unpack)
NOTE: recipe perl-5.44.0-r0: task do_patch: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Succeeded
NOTE: Running task 956 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_patch: Succeeded
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_create_recipe_spdx: Started
NOTE: Running task 971 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe coreutils-9.11-r0: task do_unpack: Succeeded
NOTE: Running task 972 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_patch)
NOTE: recipe libcap-ng-0.9.3-r0: task do_unpack: Succeeded
NOTE: Running task 973 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_patch)
NOTE: recipe shadow-sysroot-4.6-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 974 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_unpack)
NOTE: recipe coreutils-9.11-r0: task do_patch: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_patch: Started
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 975 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_create_recipe_spdx)
NOTE: recipe shadow-sysroot-4.6-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.42.2-r0: task do_unpack: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_unpack: Started
NOTE: Running task 984 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_fetch)
NOTE: Running task 985 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_patch)
NOTE: recipe libcap-ng-0.9.3-r0: task do_patch: Succeeded
NOTE: Running task 987 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_fetch)
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe psmisc-23.7-r0: task do_fetch: Started
NOTE: recipe make-4.4.1-r0: task do_fetch: Started
NOTE: recipe util-linux-2.42.2-r0: task do_patch: Started
NOTE: recipe make-4.4.1-r0: task do_fetch: Succeeded
NOTE: Running task 994 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_unpack)
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 995 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.11.2.bb:do_create_recipe_spdx)
NOTE: recipe perl-5.44.0-r0: task do_patch: Succeeded
NOTE: Running task 1037 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_create_recipe_spdx)
NOTE: recipe make-4.4.1-r0: task do_unpack: Started
NOTE: recipe coreutils-9.11-r0: task do_patch: Succeeded
NOTE: Running task 1043 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_populate_lic)
NOTE: recipe psmisc-23.7-r0: task do_fetch: Succeeded
NOTE: recipe meson-native-1.11.2-r0: task do_create_recipe_spdx: Started
NOTE: Running task 1044 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_unpack)
NOTE: recipe make-4.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 1045 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_patch)
NOTE: recipe expat-2.8.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe expat-2.8.3-r0: task do_populate_lic: Started
NOTE: recipe psmisc-23.7-r0: task do_unpack: Started
NOTE: recipe make-4.4.1-r0: task do_patch: Started
NOTE: recipe util-linux-2.42.2-r0: task do_patch: Succeeded
NOTE: recipe meson-native-1.11.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe expat-2.8.3-r0: task do_populate_lic: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe expat-2.8.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1047 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_create_recipe_spdx)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 43a5eed45be5f03da4b85c3553d0f54d484743ea1bf86e066be2f808a536e5e1
NOTE: Setscene tasks completed
NOTE: recipe ptest-runner-2.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 1048 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_patch)
NOTE: recipe make-4.4.1-r0: task do_patch: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_patch: Started
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1051 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_11.0.3.bb:do_create_recipe_spdx)
NOTE: recipe qemu-native-11.0.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe psmisc-23.7-r0: task do_unpack: Succeeded
NOTE: Running task 1052 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_patch)
NOTE: recipe qemu-native-11.0.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1053 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_create_recipe_spdx)
NOTE: recipe psmisc-23.7-r0: task do_patch: Started
NOTE: recipe libpam-1.7.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe psmisc-23.7-r0: task do_patch: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1055 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_create_recipe_spdx)
NOTE: recipe shadow-4.20.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe shadow-4.20.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_unpack: Succeeded
NOTE: Running task 1057 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_patch)
NOTE: recipe linux-libc-headers-6.18-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_patch: Succeeded
NOTE: Running noexec task 1059 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_configure)
NOTE: Running noexec task 1060 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_compile)
NOTE: Running task 1061 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_install)
NOTE: recipe linux-libc-headers-6.18-r0: task do_install: Started
NOTE: recipe elfutils-native-0.195-r0: task do_fetch: Succeeded
NOTE: Running task 1062 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.195.bb:do_unpack)
NOTE: recipe qemu-native-11.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 1063 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_11.0.3.bb:do_patch)
NOTE: recipe elfutils-native-0.195-r0: task do_unpack: Started
NOTE: recipe qemu-native-11.0.3-r0: task do_patch: Started
NOTE: recipe qemu-native-11.0.3-r0: task do_patch: Succeeded
NOTE: recipe elfutils-native-0.195-r0: task do_unpack: Succeeded
NOTE: Running task 1065 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.195.bb:do_patch)
NOTE: recipe elfutils-native-0.195-r0: task do_patch: Started
NOTE: recipe elfutils-native-0.195-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_install: Succeeded
NOTE: Running task 1081 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.44.bb:do_prepare_recipe_sysroot)
NOTE: recipe glibc-2.44+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glibc-2.44+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1082 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.44.bb:do_configure)
NOTE: recipe glibc-2.44+git-r0: task do_configure: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_fetch: Succeeded
NOTE: Running task 1083 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_unpack)
NOTE: recipe rpm-native-1_4.20.1-r0: task do_unpack: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_unpack: Succeeded
NOTE: Running task 1084 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_patch)
NOTE: recipe rpm-native-1_4.20.1-r0: task do_patch: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_patch: Succeeded
NOTE: Running task 1085 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_generate_toolchain_file)
NOTE: recipe rpm-native-1_4.20.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glibc-2.44+git-r0: task do_configure: Succeeded
NOTE: Running task 1087 of 1509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.44.bb:do_compile)
NOTE: recipe glibc-2.44+git-r0: task do_compile: Started
NOTE: recipe libidn2-native-2.3.8-r0: task do_fetch: Succeeded
NOTE: Running task 1088 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_unpack)
NOTE: recipe libidn2-native-2.3.8-r0: task do_unpack: Started
NOTE: recipe libidn2-native-2.3.8-r0: task do_unpack: Succeeded
NOTE: Running task 1089 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_patch)
NOTE: recipe libidn2-native-2.3.8-r0: task do_patch: Started
NOTE: recipe libidn2-native-2.3.8-r0: task do_patch: Succeeded
NOTE: recipe libmicrohttpd-native-1.0.10-r0: task do_fetch: Succeeded
NOTE: Running task 1091 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_unpack)
NOTE: recipe libmicrohttpd-native-1.0.10-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-native-1.0.10-r0: task do_unpack: Succeeded
NOTE: Running task 1092 of 1509 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_patch)
NOTE: recipe libmicrohttpd-native-1.0.10-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-native-1.0.10-r0: task do_patch: Succeeded
WARNING: libarchive-native-3.8.9-r0 do_fetch: Failed to fetch URL https://libarchive.org/downloads/libarchive-3.8.9.tar.gz, attempting MIRRORS if available
NOTE: recipe libarchive-native-3.8.9-r0: task do_fetch: Failed
NOTE: recipe python3-native-3.14.7-r0: task do_configure: Succeeded
NOTE: recipe glibc-2.44+git-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1093 tasks of which 889 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260811053016.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260811053016.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_fetch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/libarchive-native/3.8.9/temp/log.do_fetch.2653068
Summary: There were 3 WARNING messages.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: libarchive-native-3.8.9-r0 do_fetch: Fetcher failure: Fetch command ['wget', '--tries=2', '--timeout=100', '--output-document=/srv/pokybuild/yocto-worker/auh/build/build/downloads/libarchive-3.8.9.tar.gz.tmp', '--continue', '--directory-prefix=/srv/pokybuild/yocto-worker/auh/build/build/downloads', 'https://libarchive.org/downloads/libarchive-3.8.9.tar.gz', '--progress=dot', '--verbose'] failed with exit code 4, see logfile for output
ERROR: libarchive-native-3.8.9-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'https://libarchive.org/downloads/libarchive-3.8.9.tar.gz')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/libarchive-native/3.8.9/temp/log.do_fetch.2653068
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_fetch) failed with exit code '1'

--===============8507998262313273389==--

