Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4224CD1D875
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 12:15:51 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.11793.1728994550468410346
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 05:15:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=JKQBoMJZ;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=NuA3Gsnc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010192901b2051-ce6c513b-80d4-40c4-97d9-ddd3140bd316-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728994549;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nKzV1yKltSXCrZDgRt413Y2/Z3cUX+MoM3YrMDQVcvQ=;
	b=JKQBoMJZntPhftqMsJfgZ+3LB07IYZG3Nbhs//Cl/sL7kwWBLsBxXufXilZ/WGs8
	fOUCEO/O12sT2LvD2iJLMdxUQ3AwEB9x6zOKIcLF9EtD4C7aw/Vz7kP7S847SF6B/nd
	D/4msg4md6eV5VVUAOxpzdZfqMeSweAx5bo7jtrY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728994549;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nKzV1yKltSXCrZDgRt413Y2/Z3cUX+MoM3YrMDQVcvQ=;
	b=NuA3Gsnc2WMWCqdZmf6+wMUtOh+STCyDt1mupkqxPvj280zgGApC7PEYNHk42eXx
	LqKZwkHaZa/DYpN3QfcGhZTCeKVGRbBTPcR+dc6Q52+9OlyvSZoq7xrcikOq7tMFh06
	LD+FuBUCJe6cwYs6fviXfXlVddHM8WXs/52ODt9A=
Content-Type: multipart/mixed; boundary="===============6994836239959055014=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ppp: upgrading to 2.5.1 SUCCEEDED
Message-ID: <01010192901b2051-ce6c513b-80d4-40c4-97d9-ddd3140bd316-000000@us-west-2.amazonses.com>
Date: Tue, 15 Oct 2024 12:15:49 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 12:15:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205825

--===============6994836239959055014==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sCgp0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFk
ZSBIZWxwZXIKdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBl
KHMpICpwcHAqIHRvICoyLjUuMSogaGFzIFN1Y2NlZWRlZC4KCk5leHQgc3RlcHM6CiAgICAtIGFw
cGx5IHRoZSBwYXRjaDogZ2l0IGFtIDAwMDEtcHBwLXVwZ3JhZGUtMi41LjAtMi41LjEucGF0Y2gK
ICAgIC0gY2hlY2sgdGhlIGNoYW5nZXMgdG8gdXBzdHJlYW0gcGF0Y2hlcyBhbmQgc3VtbWFyaXpl
IHRoZW0gaW4gdGhlIGNvbW1pdCBtZXNzYWdlLAogICAgLSBjb21waWxlIGFuIGltYWdlIHRoYXQg
Y29udGFpbnMgdGhlIHBhY2thZ2UKICAgIC0gcGVyZm9ybSBzb21lIGJhc2ljIHNhbml0eSB0ZXN0
cwogICAgLSBhbWVuZCB0aGUgcGF0Y2ggYW5kIHNpZ24gaXQgb2ZmOiBnaXQgY29tbWl0IC1zIC0t
cmVzZXQtYXV0aG9yIC0tYW1lbmQKICAgIC0gc2VuZCBpdCB0byB0aGUgYXBwcm9wcmlhdGUgbWFp
bGluZyBsaXN0CgpBbHRlcm5hdGl2ZWx5LCBpZiB5b3UgYmVsaWV2ZSB0aGUgcmVjaXBlIHNob3Vs
ZCBub3QgYmUgdXBncmFkZWQgYXQgdGhpcyB0aW1lLAp5b3UgY2FuIGZpbGwgUkVDSVBFX05PX1VQ
REFURV9SRUFTT04gaW4gcmVzcGVjdGl2ZSByZWNpcGUgZmlsZSBzbyB0aGF0CmF1dG9tYXRpYyB1
cGdyYWRlcyB3b3VsZCBubyBsb25nZXIgYmUgYXR0ZW1wdGVkLgoKUGxlYXNlIHJldmlldyB0aGUg
YXR0YWNoZWQgZmlsZXMgZm9yIGZ1cnRoZXIgaW5mb3JtYXRpb24gYW5kIGJ1aWxkL3VwZGF0ZSBm
YWlsdXJlcy4KQW55IHByb2JsZW0gcGxlYXNlIGZpbGUgYSBidWcgYXQgaHR0cHM6Ly9idWd6aWxs
YS55b2N0b3Byb2plY3Qub3JnL2VudGVyX2J1Zy5jZ2k/cHJvZHVjdD1BdXRvbWF0ZWQlMjBVcGRh
dGUlMjBIYW5kbGVyCgpSZWdhcmRzLApUaGUgVXBncmFkZSBIZWxwZXIKCi0tID44IC0tCkZyb20g
Yzc1ZjE0ZDhlNjVhYjhmMzhkZDU2NzY4NTA0ZDczZWQzNmExNDhiMCBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKRnJvbTogVXBncmFkZSBIZWxwZXIgPGF1aEB5b2N0b3Byb2plY3Qub3JnPgpEYXRl
OiBUdWUsIDE1IE9jdCAyMDI0IDA3OjE5OjI3ICswMDAwClN1YmplY3Q6IFtQQVRDSF0gcHBwOiB1
cGdyYWRlIDIuNS4wIC0+IDIuNS4xCgotLS0KIC4uLi9wcHAve3BwcF8yLjUuMC5iYiA9PiBwcHBf
Mi41LjEuYmJ9ICAgICAgICB8IDU3ICsrKysrKysrKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2Vk
LCA1NCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1j
b25uZWN0aXZpdHkvcHBwL3twcHBfMi41LjAuYmIgPT4gcHBwXzIuNS4xLmJifSAoNjIlKQoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvcHBwL3BwcF8yLjUuMC5iYiBiL21l
dGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvcHBwL3BwcF8yLjUuMS5iYgpzaW1pbGFyaXR5IGluZGV4
IDYyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L3BwcC9wcHBfMi41LjAu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvcHBwL3BwcF8yLjUuMS5iYgpp
bmRleCAzNmUyNTg1ZGU0Li5mMzhiNjBmMDFjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L3BwcC9wcHBfMi41LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9wcHAvcHBwXzIuNS4xLmJiCkBAIC0xLDMgKzEsNTMgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklM
RVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4K
KyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRo
ZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlm
IG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3Nh
Z2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0
ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0t
LSBwcHBkL2NjcC5jCisjICsrKyBwcHBkL2NjcC5jCisjIEBAIC0xNyw3ICsxNyw3IEBACisjICAg
KiAzLiBSZWRpc3RyaWJ1dGlvbnMgb2YgYW55IGZvcm0gd2hhdHNvZXZlciBtdXN0IHJldGFpbiB0
aGUgZm9sbG93aW5nCisjICAgKiAgICBhY2tub3dsZWRnbWVudDoKKyMgICAqICAgICJUaGlzIHBy
b2R1Y3QgaW5jbHVkZXMgc29mdHdhcmUgZGV2ZWxvcGVkIGJ5IFBhdWwgTWFja2VycmFzCisjIC0g
KiAgICAgPHBhdWx1c0BzYW1iYS5vcmc+Ii4KKyMgKyAqICAgICA8cGF1bHVzQG96bGFicy5vcmc+
Ii4KKyMgICAqCisjICAgKiBUSEUgQVVUSE9SUyBPRiBUSElTIFNPRlRXQVJFIERJU0NMQUlNIEFM
TCBXQVJSQU5USUVTIFdJVEggUkVHQVJEIFRPCisjICAgKiBUSElTIFNPRlRXQVJFLCBJTkNMVURJ
TkcgQUxMIElNUExJRUQgV0FSUkFOVElFUyBPRiBNRVJDSEFOVEFCSUxJVFkKKyMgLS0tIGNoYXQv
Y2hhdC5jCisjICsrKyBjaGF0L2NoYXQuYworIyBAQCAtMSwxNSArMSwxNSBAQAorIyArLyogU1BE
WC1MaWNlbnNlLUlkZW50aWZpZXI6IE1JVCAqLworIyAgLyoKKyMgICAqCUNoYXQgLS0gYSBwcm9n
cmFtIGZvciBhdXRvbWF0aWMgc2Vzc2lvbiBlc3RhYmxpc2htZW50IChpLmUuIGRpYWwKKyMgICAq
CQl0aGUgcGhvbmUgYW5kIGxvZyBpbikuCisjICAgKgorIyAtICogU3RhbmRhcmQgdGVybWluYXRp
b24gY29kZXM6CisjIC0gKiAgMCAtIHN1Y2Nlc3NmdWwgY29tcGxldGlvbiBvZiB0aGUgc2NyaXB0
CisjIC0gKiAgMSAtIGludmFsaWQgYXJndW1lbnQsIGV4cGVjdCBzdHJpbmcgdG9vIGxhcmdlLCBl
dGMuCisjIC0gKiAgMiAtIGVycm9yIG9uIGFuIEkvTyBvcGVyYXRpb24gb3IgZmF0YWwgZXJyb3Ig
Y29uZGl0aW9uLgorIyAtICogIDMgLSB0aW1lb3V0IHdhaXRpbmcgZm9yIGEgc2ltcGxlIHN0cmlu
Zy4KKyMgLSAqICA0IC0gdGhlIGZpcnN0IHN0cmluZyBkZWNsYXJlZCBhcyAiQUJPUlQiCisjIC0g
KiAgNSAtIHRoZSBzZWNvbmQgc3RyaW5nIGRlY2xhcmVkIGFzICJBQk9SVCIKKyMgLSAqICA2IC0g
Li4uIGFuZCBzbyBvbiBmb3Igc3VjY2Vzc2l2ZSBBQk9SVCBzdHJpbmdzLgorIyArICogVGhpcyB2
ZXJzaW9uIGlzIENvcHlyaWdodCAxOTk1LTIwMjMgUGF1bCBNYWNrZXJyYXMgPHBhdWx1c0Bvemxh
YnMub3JnPgorIyArICogYmFzZWQgb24gdGhlIG9yaWdpbmFsIHB1YmxpYy1kb21haW4gdmVyc2lv
biBieSBLYXJsIEZveC4KKyMgICAqCisjIC0gKglUaGlzIHNvZnR3YXJlIGlzIGluIHRoZSBwdWJs
aWMgZG9tYWluLgorIyAtICoKKyMgKyAqIFBlcm1pc3Npb24gaXMgaGVyZWJ5IGdyYW50ZWQsIGZy
ZWUgb2YgY2hhcmdlLCB0byBhbnkgcGVyc29uCisjICsgKiBvYnRhaW5pbmcgYSBjb3B5IG9mIHRo
aXMgc29mdHdhcmUgYW5kIGFzc29jaWF0ZWQgZG9jdW1lbnRhdGlvbgorIyArICogZmlsZXMgKHRo
ZSDigJxTb2Z0d2FyZeKAnSksIHRvIGRlYWwgaW4gdGhlIFNvZnR3YXJlIHdpdGhvdXQKKyMgKyAq
IHJlc3RyaWN0aW9uLCBpbmNsdWRpbmcgd2l0aG91dCBsaW1pdGF0aW9uIHRoZSByaWdodHMgdG8g
dXNlLCBjb3B5LAorIyArICogbW9kaWZ5LCBtZXJnZSwgcHVibGlzaCwgZGlzdHJpYnV0ZSwgc3Vi
bGljZW5zZSwgYW5kL29yIHNlbGwgY29waWVzCisjICsgKiBvZiB0aGUgU29mdHdhcmUsIGFuZCB0
byBwZXJtaXQgcGVyc29ucyB0byB3aG9tIHRoZSBTb2Z0d2FyZSBpcworIyArICogZnVybmlzaGVk
IHRvIGRvIHNvLCBzdWJqZWN0IHRvIHRoZSBmb2xsb3dpbmcgY29uZGl0aW9uczoKKyMgCisjCisK
IFNVTU1BUlkgPSAiUG9pbnQtdG8tUG9pbnQgUHJvdG9jb2wgKFBQUCkgc3VwcG9ydCIKIERFU0NS
SVBUSU9OID0gInBwcCAoUGF1bCdzIFBQUCBQYWNrYWdlKSBpcyBhbiBvcGVuIHNvdXJjZSBwYWNr
YWdlIHdoaWNoIGltcGxlbWVudHMgXAogdGhlIFBvaW50LXRvLVBvaW50IFByb3RvY29sIChQUFAp
IG9uIExpbnV4IGFuZCBTb2xhcmlzIHN5c3RlbXMuIgpAQCAtNiwxMCArNTYsMTEgQEAgSE9NRVBB
R0UgPSAiaHR0cDovL3NhbWJhLm9yZy9wcHAvIgogQlVHVFJBQ0tFUiA9ICJodHRwOi8vcHBwLnNh
bWJhLm9yZy9jZ2ktYmluL3BwcC1idWdzIgogREVQRU5EUyA9ICJsaWJwY2FwIG9wZW5zc2wgdmly
dHVhbC9jcnlwdCIKIExJQ0VOU0UgPSAiQlNELTMtQ2xhdXNlICYgQlNELTMtQ2xhdXNlLUF0dHJp
YnV0aW9uICYgR1BMLTIuMC1vci1sYXRlciAmIExHUEwtMi4wLW9yLWxhdGVyICYgUEQgJiBSU0Et
TUQiCi1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9wcHBkL2NjcC5jO2JlZ2lubGluZT0xO2Vu
ZGxpbmU9Mjk7bWQ1PWUyYzQzZmU2ZTgxZmY3N2Q4N2RjOWMyOTBhNDI0ZGVhIFwKK0xJQ19GSUxF
U19DSEtTVU0gPSAiZmlsZTovL3BwcGQvY2NwLmM7YmVnaW5saW5lPTE7ZW5kbGluZT0yOTttZDU9
MWJlYTEwZTgxZmM2ZjJkZjEwNWIxZjhiNzMzY2IxNDkgXAogICAgICAgICAgICAgICAgICAgICBm
aWxlOi8vcHBwZC9wbHVnaW5zL3Bhc3Nwcm9tcHQuYztiZWdpbmxpbmU9MTtlbmRsaW5lPTEwO21k
NT0zYmNiY2RiZjBlMzY5YzlhM2UwYjhjODI3NWIwNjVkOCBcCiAgICAgICAgICAgICAgICAgICAg
IGZpbGU6Ly9wcHBkL3RkYi5jO2JlZ2lubGluZT0xO2VuZGxpbmU9Mjc7bWQ1PTRjYTNhOTk5MWIw
MTEwMzhkMDg1ZDY2NzVhZTdjNGU2IFwKLSAgICAgICAgICAgICAgICAgICAgZmlsZTovL2NoYXQv
Y2hhdC5jO2JlZ2lubGluZT0xO2VuZGxpbmU9MTU7bWQ1PTBkMzc0Yjg1NDVlZTVjNjJkN2FmZjFh
Y2JkMzhhZGQyIgorICAgICAgICAgICAgICAgICAgICBmaWxlOi8vY2hhdC9jaGF0LmM7YmVnaW5s
aW5lPTE7ZW5kbGluZT0xNTttZDU9ZjdhNTU4YWQ4OThiNDNiOGU0NzU0NGE4Y2FmNDZmYjMgXAor
ICAgICAgICAgICAgICAgICAgICAiCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly9kb3dubG9hZC5zYW1i
YS5vcmcvcHViLyR7QlBOfS8ke0JQfS50YXIuZ3ogXAogICAgICAgICAgICBmaWxlOi8vcG9uIFwK
QEAgLTI1LDcgKzc2LDcgQEAgU1JDX1VSSSA9ICJodHRwczovL2Rvd25sb2FkLnNhbWJhLm9yZy9w
dWIvJHtCUE59LyR7QlB9LnRhci5neiBcCiAgICAgICAgICAgIGZpbGU6Ly9wcHBALnNlcnZpY2Ug
XAogICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI1Y2FlMGU4MDc1ZjhhMTc1
NWYxNmNhMjkwZWI0NGU2YjM1NDVkM2YyOTJhZjRkYTY1ZWNmZmU4OTdkZTYzNmZmIgorU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjczM2I3ZjU4NDBiNjEzZGE0ZWFiMDQyOWE1MDgxMjkzMjc1ZjA2YmE4
YjUyOGUxYjhlZWE2OTY0ZmFmMDI0M2EiCiAKIGluaGVyaXQgYXV0b3Rvb2xzIHN5c3RlbWQKIAot
LSAKMi40NC4xCgo=

--===============6994836239959055014==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/ppp/ppp-tools: PKGSIZE changed from 58288 to 36944 (-37%)
packages/core2-64-poky-linux/ppp/ppp: FILELIST: removed "/etc/ppp/options /etc/ppp/eaptls-server /etc/ppp/eaptls-client /etc/ppp/openssl.cnf /etc/ppp/chap-secrets /etc/ppp/pap-secrets", added "/etc/ppp/pap-secrets.example /etc/ppp/chap-secrets.example /etc/ppp/eaptls-server.example /etc/ppp/openssl.cnf.example /etc/ppp/options.example /etc/ppp/eaptls-client.example"
Changes to packages/core2-64-poky-linux/ppp (sysroot):
  /usr/lib/pppd/2.5.0 moved to /usr/lib/pppd/2.5.1

--===============6994836239959055014==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ppp: SRC_URI changed from "https://download.samba.org/pub/ppp/ppp-2.5.0.tar.gz file://pon file://poff file://init file://ip-up file://ip-down file://08setupdns file://92removedns file://pap file://ppp_on_boot file://provider file://ppp@.service" to "https://download.samba.org/pub/ppp/ppp-2.5.1.tar.gz file://pon file://poff file://init file://ip-up file://ip-down file://08setupdns file://92removedns file://pap file://ppp_on_boot file://provider file://ppp@.service"
packages/core2-64-poky-linux/ppp: PV changed from "2.5.0" to "2.5.1"
packages/core2-64-poky-linux/ppp: PKGV changed from 2.5.0 [default] to 2.5.1 [default]
packages/core2-64-poky-linux/ppp/ppp-dbg: PV changed from "2.5.0" to "2.5.1"
packages/core2-64-poky-linux/ppp/ppp-dbg: PKGSIZE changed from 1455720 to 1400696 (-4%)
packages/core2-64-poky-linux/ppp/ppp-dbg: PKGV changed from 2.5.0 [default] to 2.5.1 [default]
packages/core2-64-poky-linux/ppp/ppp-dev: PV changed from "2.5.0" to "2.5.1"
packages/core2-64-poky-linux/ppp/ppp-dev: PKGSIZE changed from 96640 to 96806 (+0%)
packages/core2-64-poky-linux/ppp/ppp-dev: PKGV changed from 2.5.0 [default] to 2.5.1 [default]
packages/core2-64-poky-linux/ppp/ppp-doc: PV changed from "2.5.0" to "2.5.1"
packages/core2-64-poky-linux/ppp/ppp-doc: PKGSIZE changed from 121958 to 124244 (+2%)
packages/core2-64-poky-linux/ppp/ppp-doc: PKGV changed from 2.5.0 [default] to 2.5.1 [default]
packages/core2-64-poky-linux/ppp/ppp-l2tp: FILES: removed "/usr/lib/pppd/2.5.0/*l2tp.so", added "/usr/lib/pppd/2.5.1/*l2tp.so"
packages/core2-64-poky-linux/ppp/ppp-l2tp: PV changed from "2.5.0" to "2.5.1"
packages/core2-64-poky-linux/ppp/ppp-l2tp: PKGV changed from 2.5.0 [default] to 2.5.1 [default]
packages/core2-64-poky-linux/ppp/ppp-locale: PV changed from "2.5.0" to "2.5.1"
packages/core2-64-poky-linux/ppp/ppp-locale: PKGV changed from 2.5.0 [default] to 2.5.1 [default]
packages/core2-64-poky-linux/ppp/ppp-minconn: FILES: removed "/usr/lib/pppd/2.5.0/minconn.so", added "/usr/lib/pppd/2.5.1/minconn.so"
packages/core2-64-poky-linux/ppp/ppp-minconn: PV changed from "2.5.0" to "2.5.1"
packages/core2-64-poky-linux/ppp/ppp-minconn: PKGV changed from 2.5.0 [default] to 2.5.1 [default]
packages/core2-64-poky-linux/ppp/ppp-oa: FILES: removed "/usr/lib/pppd/2.5.0/pppoatm.so", added "/usr/lib/pppd/2.5.1/pppoatm.so"
packages/core2-64-poky-linux/ppp/ppp-oa: PV changed from "2.5.0" to "2.5.1"
packages/core2-64-poky-linux/ppp/ppp-oa: PKGSIZE changed from 23080 to 22912 (-1%)
packages/core2-64-poky-linux/ppp/ppp-oa: PKGV changed from 2.5.0 [default] to 2.5.1 [default]
packages/core2-64-poky-linux/ppp/ppp-oe: FILES: removed "/usr/lib/pppd/2.5.0/*pppoe.so", added "/usr/lib/pppd/2.5.1/*pppoe.so"
packages/core2-64-poky-linux/ppp/ppp-oe: PV changed from "2.5.0" to "2.5.1"
packages/core2-64-poky-linux/ppp/ppp-oe: PKGV changed from 2.5.0 [default] to 2.5.1 [default]
packages/core2-64-poky-linux/ppp/ppp-password: FILES: removed "/usr/lib/pppd/2.5.0/pass*.so", added "/usr/lib/pppd/2.5.1/pass*.so"
packages/core2-64-poky-linux/ppp/ppp-password: PV changed from "2.5.0" to "2.5.1"
packages/core2-64-poky-linux/ppp/ppp-password: PKGV changed from 2.5.0 [default] to 2.5.1 [default]
packages/core2-64-poky-linux/ppp/ppp-radius: FILES: removed "/usr/lib/pppd/2.5.0/radius.so /usr/lib/pppd/2.5.0/radrealms.so /usr/lib/pppd/2.5.0/radattr.so", added "/usr/lib/pppd/2.5.1/radius.so /usr/lib/pppd/2.5.1/radrealms.so /usr/lib/pppd/2.5.1/radattr.so"
packages/core2-64-poky-linux/ppp/ppp-radius: PV changed from "2.5.0" to "2.5.1"
packages/core2-64-poky-linux/ppp/ppp-radius: PKGSIZE changed from 94032 to 102224 (+9%)
packages/core2-64-poky-linux/ppp/ppp-radius: PKGV changed from 2.5.0 [default] to 2.5.1 [default]
packages/core2-64-poky-linux/ppp/ppp-src: FILELIST: directory renamed /usr/src/debug/ppp/2.5.0/pppd/plugins -> /usr/src/debug/ppp/2.5.1/pppd/plugins, directory renamed /usr/src/debug/ppp/2.5.0/chat -> /usr/src/debug/ppp/2.5.1/chat, directory renamed /usr/src/debug/ppp/2.5.0/pppd/plugins/pppoe -> /usr/src/debug/ppp/2.5.1/pppd/plugins/pppoe, directory renamed /usr/src/debug/ppp/2.5.0/pppstats -> /usr/src/debug/ppp/2.5.1/pppstats, directory renamed /usr/src/debug/ppp/2.5.0/pppd/plugins/radius -> /usr/src/debug/ppp/2.5.1/pppd/plugins/radius, directory renamed /usr/src/debug/ppp/2.5.0/pppd -> /usr/src/debug/ppp/2.5.1/pppd, directory renamed /usr/src/debug/ppp/2.5.0/pppd/plugins/pppol2tp -> /usr/src/debug/ppp/2.5.1/pppd/plugins/pppol2tp, directory renamed /usr/src/debug/ppp/2.5.0/pppd/plugins/pppoatm -> /usr/src/debug/ppp/2.5.1/pppd/plugins/pppoatm, removed "/usr/src/debug/ppp/2.5.0/pppdump/zlib.c /usr/src/debug/ppp/2.5.0/pppdump/ppp-comp.h /usr/src/debug/ppp/2.5.0/pppdump/pppdump.c /usr/s
 rc/debug/ppp/2.5.0/pppdump/deflate.c /usr/src/debug/ppp/2.5.0/pppdump/zlib.h /usr/src/debug/ppp/2.5.0/pppdump/bsd-comp.c", added "/usr/src/debug/ppp/2.5.1/pppdump/pppdump.c"
packages/core2-64-poky-linux/ppp/ppp-src: PV changed from "2.5.0" to "2.5.1"
packages/core2-64-poky-linux/ppp/ppp-src: PKGSIZE changed from 1499049 to 1392084 (-7%)
packages/core2-64-poky-linux/ppp/ppp-src: PKGV changed from 2.5.0 [default] to 2.5.1 [default]
packages/core2-64-poky-linux/ppp/ppp-staticdev: PV changed from "2.5.0" to "2.5.1"
packages/core2-64-poky-linux/ppp/ppp-staticdev: PKGV changed from 2.5.0 [default] to 2.5.1 [default]
packages/core2-64-poky-linux/ppp/ppp-tools: PV changed from "2.5.0" to "2.5.1"
packages/core2-64-poky-linux/ppp/ppp-tools: PKGSIZE changed from 58288 to 36944 (-37%)
packages/core2-64-poky-linux/ppp/ppp-tools: PKGV changed from 2.5.0 [default] to 2.5.1 [default]
packages/core2-64-poky-linux/ppp/ppp-winbind: FILES: removed "/usr/lib/pppd/2.5.0/winbind.so", added "/usr/lib/pppd/2.5.1/winbind.so"
packages/core2-64-poky-linux/ppp/ppp-winbind: PV changed from "2.5.0" to "2.5.1"
packages/core2-64-poky-linux/ppp/ppp-winbind: PKGV changed from 2.5.0 [default] to 2.5.1 [default]
packages/core2-64-poky-linux/ppp/ppp: FILELIST: removed "/etc/ppp/eaptls-client /etc/ppp/chap-secrets /etc/ppp/options /etc/ppp/eaptls-server /etc/ppp/openssl.cnf /etc/ppp/pap-secrets", added "/etc/ppp/openssl.cnf.example /etc/ppp/eaptls-server.example /etc/ppp/pap-secrets.example /etc/ppp/chap-secrets.example /etc/ppp/eaptls-client.example /etc/ppp/options.example"
packages/core2-64-poky-linux/ppp/ppp: PV changed from "2.5.0" to "2.5.1"
packages/core2-64-poky-linux/ppp/ppp: PKGSIZE changed from 421403 to 430139 (+2%)
packages/core2-64-poky-linux/ppp/ppp: PKGV changed from 2.5.0 [default] to 2.5.1 [default]
Changes to packages/core2-64-poky-linux/ppp (sysroot):
  /usr/lib/pppd/2.5.0 moved to /usr/lib/pppd/2.5.1

--===============6994836239959055014==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-ppp-upgrade-2.5.0-2.5.1.patch"

RnJvbSBjNzVmMTRkOGU2NWFiOGYzOGRkNTY3Njg1MDRkNzNlZDM2YTE0OGIwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgT2N0IDIwMjQgMDc6MTk6MjcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
cHA6IHVwZ3JhZGUgMi41LjAgLT4gMi41LjEKCi0tLQogLi4uL3BwcC97cHBwXzIuNS4wLmJiID0+
IHBwcF8yLjUuMS5iYn0gICAgICAgIHwgNTcgKysrKysrKysrKysrKysrKysrLQogMSBmaWxlIGNo
YW5nZWQsIDU0IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9wcHAve3BwcF8yLjUuMC5iYiA9PiBwcHBfMi41LjEuYmJ9ICg2MiUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9wcHAvcHBwXzIuNS4wLmJi
IGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9wcHAvcHBwXzIuNS4xLmJiCnNpbWlsYXJpdHkg
aW5kZXggNjIlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvcHBwL3BwcF8y
LjUuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9wcHAvcHBwXzIuNS4x
LmJiCmluZGV4IDM2ZTI1ODVkZTQuLmYzOGI2MGYwMWMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkvcHBwL3BwcF8yLjUuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVj
dGl2aXR5L3BwcC9wcHBfMi41LjEuYmIKQEAgLTEsMyArMSw1MyBAQAorIyBGSVhNRTogdGhlIExJ
Q19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3Jh
ZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBh
bmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFs
dWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQg
bWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2Ut
VXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMK
KyMgLS0tIHBwcGQvY2NwLmMKKyMgKysrIHBwcGQvY2NwLmMKKyMgQEAgLTE3LDcgKzE3LDcgQEAK
KyMgICAqIDMuIFJlZGlzdHJpYnV0aW9ucyBvZiBhbnkgZm9ybSB3aGF0c29ldmVyIG11c3QgcmV0
YWluIHRoZSBmb2xsb3dpbmcKKyMgICAqICAgIGFja25vd2xlZGdtZW50OgorIyAgICogICAgIlRo
aXMgcHJvZHVjdCBpbmNsdWRlcyBzb2Z0d2FyZSBkZXZlbG9wZWQgYnkgUGF1bCBNYWNrZXJyYXMK
KyMgLSAqICAgICA8cGF1bHVzQHNhbWJhLm9yZz4iLgorIyArICogICAgIDxwYXVsdXNAb3psYWJz
Lm9yZz4iLgorIyAgICoKKyMgICAqIFRIRSBBVVRIT1JTIE9GIFRISVMgU09GVFdBUkUgRElTQ0xB
SU0gQUxMIFdBUlJBTlRJRVMgV0lUSCBSRUdBUkQgVE8KKyMgICAqIFRISVMgU09GVFdBUkUsIElO
Q0xVRElORyBBTEwgSU1QTElFRCBXQVJSQU5USUVTIE9GIE1FUkNIQU5UQUJJTElUWQorIyAtLS0g
Y2hhdC9jaGF0LmMKKyMgKysrIGNoYXQvY2hhdC5jCisjIEBAIC0xLDE1ICsxLDE1IEBACisjICsv
KiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTUlUICovCisjICAvKgorIyAgICoJQ2hhdCAtLSBh
IHByb2dyYW0gZm9yIGF1dG9tYXRpYyBzZXNzaW9uIGVzdGFibGlzaG1lbnQgKGkuZS4gZGlhbAor
IyAgICoJCXRoZSBwaG9uZSBhbmQgbG9nIGluKS4KKyMgICAqCisjIC0gKiBTdGFuZGFyZCB0ZXJt
aW5hdGlvbiBjb2RlczoKKyMgLSAqICAwIC0gc3VjY2Vzc2Z1bCBjb21wbGV0aW9uIG9mIHRoZSBz
Y3JpcHQKKyMgLSAqICAxIC0gaW52YWxpZCBhcmd1bWVudCwgZXhwZWN0IHN0cmluZyB0b28gbGFy
Z2UsIGV0Yy4KKyMgLSAqICAyIC0gZXJyb3Igb24gYW4gSS9PIG9wZXJhdGlvbiBvciBmYXRhbCBl
cnJvciBjb25kaXRpb24uCisjIC0gKiAgMyAtIHRpbWVvdXQgd2FpdGluZyBmb3IgYSBzaW1wbGUg
c3RyaW5nLgorIyAtICogIDQgLSB0aGUgZmlyc3Qgc3RyaW5nIGRlY2xhcmVkIGFzICJBQk9SVCIK
KyMgLSAqICA1IC0gdGhlIHNlY29uZCBzdHJpbmcgZGVjbGFyZWQgYXMgIkFCT1JUIgorIyAtICog
IDYgLSAuLi4gYW5kIHNvIG9uIGZvciBzdWNjZXNzaXZlIEFCT1JUIHN0cmluZ3MuCisjICsgKiBU
aGlzIHZlcnNpb24gaXMgQ29weXJpZ2h0IDE5OTUtMjAyMyBQYXVsIE1hY2tlcnJhcyA8cGF1bHVz
QG96bGFicy5vcmc+CisjICsgKiBiYXNlZCBvbiB0aGUgb3JpZ2luYWwgcHVibGljLWRvbWFpbiB2
ZXJzaW9uIGJ5IEthcmwgRm94LgorIyAgICoKKyMgLSAqCVRoaXMgc29mdHdhcmUgaXMgaW4gdGhl
IHB1YmxpYyBkb21haW4uCisjIC0gKgorIyArICogUGVybWlzc2lvbiBpcyBoZXJlYnkgZ3JhbnRl
ZCwgZnJlZSBvZiBjaGFyZ2UsIHRvIGFueSBwZXJzb24KKyMgKyAqIG9idGFpbmluZyBhIGNvcHkg
b2YgdGhpcyBzb2Z0d2FyZSBhbmQgYXNzb2NpYXRlZCBkb2N1bWVudGF0aW9uCisjICsgKiBmaWxl
cyAodGhlIOKAnFNvZnR3YXJl4oCdKSwgdG8gZGVhbCBpbiB0aGUgU29mdHdhcmUgd2l0aG91dAor
IyArICogcmVzdHJpY3Rpb24sIGluY2x1ZGluZyB3aXRob3V0IGxpbWl0YXRpb24gdGhlIHJpZ2h0
cyB0byB1c2UsIGNvcHksCisjICsgKiBtb2RpZnksIG1lcmdlLCBwdWJsaXNoLCBkaXN0cmlidXRl
LCBzdWJsaWNlbnNlLCBhbmQvb3Igc2VsbCBjb3BpZXMKKyMgKyAqIG9mIHRoZSBTb2Z0d2FyZSwg
YW5kIHRvIHBlcm1pdCBwZXJzb25zIHRvIHdob20gdGhlIFNvZnR3YXJlIGlzCisjICsgKiBmdXJu
aXNoZWQgdG8gZG8gc28sIHN1YmplY3QgdG8gdGhlIGZvbGxvd2luZyBjb25kaXRpb25zOgorIyAK
KyMKKwogU1VNTUFSWSA9ICJQb2ludC10by1Qb2ludCBQcm90b2NvbCAoUFBQKSBzdXBwb3J0Igog
REVTQ1JJUFRJT04gPSAicHBwIChQYXVsJ3MgUFBQIFBhY2thZ2UpIGlzIGFuIG9wZW4gc291cmNl
IHBhY2thZ2Ugd2hpY2ggaW1wbGVtZW50cyBcCiB0aGUgUG9pbnQtdG8tUG9pbnQgUHJvdG9jb2wg
KFBQUCkgb24gTGludXggYW5kIFNvbGFyaXMgc3lzdGVtcy4iCkBAIC02LDEwICs1NiwxMSBAQCBI
T01FUEFHRSA9ICJodHRwOi8vc2FtYmEub3JnL3BwcC8iCiBCVUdUUkFDS0VSID0gImh0dHA6Ly9w
cHAuc2FtYmEub3JnL2NnaS1iaW4vcHBwLWJ1Z3MiCiBERVBFTkRTID0gImxpYnBjYXAgb3BlbnNz
bCB2aXJ0dWFsL2NyeXB0IgogTElDRU5TRSA9ICJCU0QtMy1DbGF1c2UgJiBCU0QtMy1DbGF1c2Ut
QXR0cmlidXRpb24gJiBHUEwtMi4wLW9yLWxhdGVyICYgTEdQTC0yLjAtb3ItbGF0ZXIgJiBQRCAm
IFJTQS1NRCIKLUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL3BwcGQvY2NwLmM7YmVnaW5saW5l
PTE7ZW5kbGluZT0yOTttZDU9ZTJjNDNmZTZlODFmZjc3ZDg3ZGM5YzI5MGE0MjRkZWEgXAorTElD
X0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vcHBwZC9jY3AuYztiZWdpbmxpbmU9MTtlbmRsaW5lPTI5
O21kNT0xYmVhMTBlODFmYzZmMmRmMTA1YjFmOGI3MzNjYjE0OSBcCiAgICAgICAgICAgICAgICAg
ICAgIGZpbGU6Ly9wcHBkL3BsdWdpbnMvcGFzc3Byb21wdC5jO2JlZ2lubGluZT0xO2VuZGxpbmU9
MTA7bWQ1PTNiY2JjZGJmMGUzNjljOWEzZTBiOGM4Mjc1YjA2NWQ4IFwKICAgICAgICAgICAgICAg
ICAgICAgZmlsZTovL3BwcGQvdGRiLmM7YmVnaW5saW5lPTE7ZW5kbGluZT0yNzttZDU9NGNhM2E5
OTkxYjAxMTAzOGQwODVkNjY3NWFlN2M0ZTYgXAotICAgICAgICAgICAgICAgICAgICBmaWxlOi8v
Y2hhdC9jaGF0LmM7YmVnaW5saW5lPTE7ZW5kbGluZT0xNTttZDU9MGQzNzRiODU0NWVlNWM2MmQ3
YWZmMWFjYmQzOGFkZDIiCisgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9jaGF0L2NoYXQuYzti
ZWdpbmxpbmU9MTtlbmRsaW5lPTE1O21kNT1mN2E1NThhZDg5OGI0M2I4ZTQ3NTQ0YThjYWY0NmZi
MyBcCisgICAgICAgICAgICAgICAgICAgICIKIAogU1JDX1VSSSA9ICJodHRwczovL2Rvd25sb2Fk
LnNhbWJhLm9yZy9wdWIvJHtCUE59LyR7QlB9LnRhci5neiBcCiAgICAgICAgICAgIGZpbGU6Ly9w
b24gXApAQCAtMjUsNyArNzYsNyBAQCBTUkNfVVJJID0gImh0dHBzOi8vZG93bmxvYWQuc2FtYmEu
b3JnL3B1Yi8ke0JQTn0vJHtCUH0udGFyLmd6IFwKICAgICAgICAgICAgZmlsZTovL3BwcEAuc2Vy
dmljZSBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjVjYWUwZTgwNzVm
OGExNzU1ZjE2Y2EyOTBlYjQ0ZTZiMzU0NWQzZjI5MmFmNGRhNjVlY2ZmZTg5N2RlNjM2ZmYiCitT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiNzMzYjdmNTg0MGI2MTNkYTRlYWIwNDI5YTUwODEyOTMyNzVm
MDZiYThiNTI4ZTFiOGVlYTY5NjRmYWYwMjQzYSIKIAogaW5oZXJpdCBhdXRvdG9vbHMgc3lzdGVt
ZAogCi0tIAoyLjQ0LjEKCg==

--===============6994836239959055014==--

