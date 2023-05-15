Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D91AAC7EE3A
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 21:39:15 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.3700.1684186745667924058
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 14:39:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=HDfyyQnK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010188215a63b0-960bd075-1a5d-4729-87c8-a56ffb6bc284-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1684186752;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4A4bKwg3eeX6Vszj7m1ygbznqvXkduYCocBl234hk/M=;
	b=HDfyyQnKlx7AbtRmOS1Y/16Il9coZhWZBq+HEBFBx3glr2+/Z2bzj2FY3cNIOsm/
	xPNjo8wGRocOJhIQC06AmecjmlYNeOfb4lQXJpfGQrmNRYnzwR26sjXB0a1Joc2wYIZ
	Q4u2HACqJcGzL+SDfwqtRX4fyl5LKscn5yIpPiwM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1684186752;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4A4bKwg3eeX6Vszj7m1ygbznqvXkduYCocBl234hk/M=;
	b=ZDF2y7BCZzT+b1Ie8SDId1Nx2UvQTPqz62RLYku3rVNhi3w0uQxfNdsXVE7gzaXY
	8uxtJ0SJzU3wNMWWb+dOUMQ825183XivrrhqSge90C3ELwRyhGlNgAioPasZwat4cGd
	SIg51MFURIF2CPTopz8DsmreA65V5K5Oq87xY0+o=
Content-Type: multipart/mixed; boundary="===============0448404380859910168=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gnupg: upgrading to 2.4.1 SUCCEEDED
Message-ID: <01010188215a63b0-960bd075-1a5d-4729-87c8-a56ffb6bc284-000000@us-west-2.amazonses.com>
Date: Mon, 15 May 2023 21:39:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 21:39:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181379

--===============0448404380859910168==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gnupg* to *2.4.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gnupg-upgrade-2.4.0-2.4.1.patch
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
--===============0448404380859910168==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gnupg-upgrade-2.4.0-2.4.1.patch"

RnJvbSBkZTExZjU5ZGY4YjFmYjk3ZjEwOGViNzBkYjFiN2Y2YmQzMjMzMDFmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgTWF5IDIwMjMgMjA6NDY6MDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
bnVwZzogdXBncmFkZSAyLjQuMCAtPiAyLjQuMQoKLS0tCiAuLi5lLWEtY3VzdG9tLXZhbHVlLWZv
ci10aGUtbG9jYXRpb24tb2YtLnBhdGNoIHwgIDYgKysrLS0tCiAuLi4vcmVjaXBlcy1zdXBwb3J0
L2dudXBnL2dudXBnL3JlbG9jYXRlLnBhdGNoIHwgMTggKysrKysrKysrLS0tLS0tLS0tCiAuLi4v
Z251cGcve2dudXBnXzIuNC4wLmJiID0+IGdudXBnXzIuNC4xLmJifSAgIHwgIDIgKy0KIDMgZmls
ZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcve2dudXBnXzIuNC4wLmJiID0+IGdudXBnXzIuNC4xLmJi
fSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnLzAw
MDEtY29uZmlndXJlLmFjLXVzZS1hLWN1c3RvbS12YWx1ZS1mb3ItdGhlLWxvY2F0aW9uLW9mLS5w
YXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnLzAwMDEtY29uZmlndXJlLmFj
LXVzZS1hLWN1c3RvbS12YWx1ZS1mb3ItdGhlLWxvY2F0aW9uLW9mLS5wYXRjaAppbmRleCAwY2Q0
YzQ1OTA3Li4xMTA3OGVjNDIxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVw
Zy9nbnVwZy8wMDAxLWNvbmZpZ3VyZS5hYy11c2UtYS1jdXN0b20tdmFsdWUtZm9yLXRoZS1sb2Nh
dGlvbi1vZi0ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGcvMDAw
MS1jb25maWd1cmUuYWMtdXNlLWEtY3VzdG9tLXZhbHVlLWZvci10aGUtbG9jYXRpb24tb2YtLnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAzNDZhNmIxN2EwN2I2NTg5NTRkYjY1ZjgxNDQ2MWI1
OTgyNGQ5ZmNkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA4YjVjNTMzNDFhOTI2MGMw
ZDI5ODM1NjE0YjkxOWVmMmUxMjY5YTRmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
QWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBNb24sIDIy
IEphbiAyMDE4IDE4OjAwOjIxICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIGNvbmZpZ3VyZS5hYzog
dXNlIGEgY3VzdG9tIHZhbHVlIGZvciB0aGUgbG9jYXRpb24gb2YKQEAgLTE0LDEwICsxNCwxMCBA
QCBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNv
bT4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlm
ZiAtLWdpdCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5hYwotaW5kZXggMDk5YzZhOC4uZThj
ZjQwOCAxMDA2NDQKK2luZGV4IGMzMWFlMDIuLmU5NDI5NDcgMTAwNjQ0CiAtLS0gYS9jb25maWd1
cmUuYWMKICsrKyBiL2NvbmZpZ3VyZS5hYwotQEAgLTE5MzUsNyArMTkzNSw3IEBAIEFDX0RFRklO
RV9VTlFVT1RFRChHUEdDT05GX0RJU1BfTkFNRSwgIkdQR0NvbmYiLAorQEAgLTE5MjIsNyArMTky
Miw3IEBAIEFDX0RFRklORV9VTlFVT1RFRChHUEdDT05GX0RJU1BfTkFNRSwgIkdQR0NvbmYiLAog
IAogIEFDX0RFRklORV9VTlFVT1RFRChHUEdUQVJfTkFNRSwgImdwZ3RhciIsIFtUaGUgbmFtZSBv
ZiB0aGUgZ3BndGFyIHRvb2xdKQogIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQv
Z251cGcvZ251cGcvcmVsb2NhdGUucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9n
bnVwZy9yZWxvY2F0ZS5wYXRjaAppbmRleCAwNzFkZDkzZmY1Li4zMDZhY2I0OTU5IDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZy9yZWxvY2F0ZS5wYXRjaAorKysg
Yi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZy9yZWxvY2F0ZS5wYXRjaApAQCAtMSw0
ICsxLDQgQEAKLUZyb20gYjExMTdhZGViNDc2MzA0Y2UyNzkyODE0NTE2YTViN2NkNDRkMGQzOCBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZDIyNGFhZmZlNjU1NzU4NzgwOTJmZTcwZDM4
OWFiOGRkYzU0NWFjNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJvc3MgQnVydG9u
IDxyb3NzLmJ1cnRvbkBpbnRlbC5jb20+CiBEYXRlOiBXZWQsIDE5IFNlcCAyMDE4IDE0OjQ0OjQw
ICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIEFsbG93IHRoZSBlbnZpcm9ubWVudCB0byBvdmVycmlk
ZSB3aGVyZSBnbnVwZyBsb29rcyBmb3IgaXRzCkBAIC0xNCwxMCArMTQsMTAgQEAgU2lnbmVkLW9m
Zi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KICAxIGZpbGUgY2hh
bmdlZCwgNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvY29t
bW9uL2hvbWVkaXIuYyBiL2NvbW1vbi9ob21lZGlyLmMKLWluZGV4IDY3YmJkZTguLjdmMzYwYmEg
MTAwNjQ0CitpbmRleCAyODY2ODVmLi4yMTJhOTQ1IDEwMDY0NAogLS0tIGEvY29tbW9uL2hvbWVk
aXIuYwogKysrIGIvY29tbW9uL2hvbWVkaXIuYwotQEAgLTExNzEsNyArMTE3MSw3IEBAIGdudXBn
X3NvY2tldGRpciAodm9pZCkKK0BAIC0xMjEzLDcgKzEyMTMsNyBAQCBnbnVwZ19zb2NrZXRkaXIg
KHZvaWQpCiAgICBpZiAoIW5hbWUpCiAgICAgIHsKICAgICAgICB1bnNpZ25lZCBpbnQgZHVtbXk7
CkBAIC0yNiw3ICsyNiw3IEBAIGluZGV4IDY3YmJkZTguLjdmMzYwYmEgMTAwNjQ0CiAgICAgICAg
Z3BncnRfYW5ub3RhdGVfbGVha2VkX29iamVjdCAobmFtZSk7CiAgICAgIH0KICAKLUBAIC0xMjAz
LDcgKzEyMDMsNyBAQCBnbnVwZ19zeXNjb25mZGlyICh2b2lkKQorQEAgLTEyNDUsNyArMTI0NSw3
IEBAIGdudXBnX3N5c2NvbmZkaXIgKHZvaWQpCiAgICBpZiAoZGlyKQogICAgICByZXR1cm4gZGly
OwogICAgZWxzZQpAQCAtMzUsNyArMzUsNyBAQCBpbmRleCA2N2JiZGU4Li43ZjM2MGJhIDEwMDY0
NAogICNlbmRpZiAvKiFIQVZFX1czMl9TWVNURU0qLwogIH0KICAKLUBAIC0xMjM5LDcgKzEyMzks
NyBAQCBnbnVwZ19iaW5kaXIgKHZvaWQpCitAQCAtMTI4MSw3ICsxMjgxLDcgQEAgZ251cGdfYmlu
ZGlyICh2b2lkKQogICAgICAgIHJldHVybiBuYW1lOwogICAgICB9CiAgICBlbHNlCkBAIC00NCw3
ICs0NCw3IEBAIGluZGV4IDY3YmJkZTguLjdmMzYwYmEgMTAwNjQ0CiAgI2VuZGlmIC8qIUhBVkVf
VzMyX1NZU1RFTSovCiAgfQogIAotQEAgLTEyNjYsNyArMTI2Niw3IEBAIGdudXBnX2xpYmV4ZWNk
aXIgKHZvaWQpCitAQCAtMTMwOCw3ICsxMzA4LDcgQEAgZ251cGdfbGliZXhlY2RpciAodm9pZCkK
ICAgICAgICByZXR1cm4gbmFtZTsKICAgICAgfQogICAgZWxzZQpAQCAtNTMsNyArNTMsNyBAQCBp
bmRleCA2N2JiZGU4Li43ZjM2MGJhIDEwMDY0NAogICNlbmRpZiAvKiFIQVZFX1czMl9TWVNURU0q
LwogIH0KICAKLUBAIC0xMjk2LDcgKzEyOTYsNyBAQCBnbnVwZ19saWJkaXIgKHZvaWQpCitAQCAt
MTMzOCw3ICsxMzM4LDcgQEAgZ251cGdfbGliZGlyICh2b2lkKQogICAgICAgIHJldHVybiBuYW1l
OwogICAgICB9CiAgICBlbHNlCkBAIC02Miw3ICs2Miw3IEBAIGluZGV4IDY3YmJkZTguLjdmMzYw
YmEgMTAwNjQ0CiAgI2VuZGlmIC8qIUhBVkVfVzMyX1NZU1RFTSovCiAgfQogIAotQEAgLTEzMjcs
NyArMTMyNyw3IEBAIGdudXBnX2RhdGFkaXIgKHZvaWQpCitAQCAtMTM2OSw3ICsxMzY5LDcgQEAg
Z251cGdfZGF0YWRpciAodm9pZCkKICAgICAgICByZXR1cm4gbmFtZTsKICAgICAgfQogICAgZWxz
ZQpAQCAtNzEsNyArNzEsNyBAQCBpbmRleCA2N2JiZGU4Li43ZjM2MGJhIDEwMDY0NAogICNlbmRp
ZiAvKiFIQVZFX1czMl9TWVNURU0qLwogIH0KICAKLUBAIC0xMzU5LDcgKzEzNTksNyBAQCBnbnVw
Z19sb2NhbGVkaXIgKHZvaWQpCitAQCAtMTQwMSw3ICsxNDAxLDcgQEAgZ251cGdfbG9jYWxlZGly
ICh2b2lkKQogICAgICAgIHJldHVybiBuYW1lOwogICAgICB9CiAgICBlbHNlCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZ18yLjQuMC5iYiBiL21ldGEvcmVjaXBl
cy1zdXBwb3J0L2dudXBnL2dudXBnXzIuNC4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnXzIuNC4wLmJiCnJlbmFtZSB0
byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZ18yLjQuMS5iYgppbmRleCA5MDBhYThh
ZDczLi42NjE2NWVkNjkxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9n
bnVwZ18yLjQuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZ18yLjQu
MS5iYgpAQCAtMjMsNyArMjMsNyBAQCBTUkNfVVJJOmFwcGVuZDpjbGFzcy1uYXRpdmUgPSAiIGZp
bGU6Ly8wMDAxLWNvbmZpZ3VyZS5hYy11c2UtYS1jdXN0b20tdmFsdWUtZm9yLQogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBmaWxlOi8vcmVsb2NhdGUucGF0Y2giCiBTUkNfVVJJOmFw
cGVuZDpjbGFzcy1uYXRpdmVzZGsgPSAiIGZpbGU6Ly9yZWxvY2F0ZS5wYXRjaCIKIAotU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjFkNzkxNThkZDAxZDk5MjQzMWRkMmUzZmFjYjg5ZmRhYzk3MTI3Zjg5
Nzg0ZWEyY2I2MTBjNjAwZmIwYzE0ODMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNzZiNzFlNWFl
YjQ0M2JmZDkxMGNlOWNiYzgyODFiNjE3YzgzNDE2ODdhZmI2N2JhZTQ1NTg3Nzk3MmI1OWRlOCIK
IAogRVhUUkFfT0VDT05GID0gIi0tZGlzYWJsZS1sZGFwIFwKIAkJLS1kaXNhYmxlLWNjaWQtZHJp
dmVyIFwKLS0gCjIuMzkuMgoK

--===============0448404380859910168==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gnupg/gnupg-dbg: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/core2-32-poky-linux/gnupg/gnupg-dbg: PKGSIZE changed from 18050272 to 17446536 (-3%)
packages/core2-32-poky-linux/gnupg/gnupg-dbg: PV changed from "2.4.0" to "2.4.1"
packages/core2-32-poky-linux/gnupg/gnupg-dev: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/core2-32-poky-linux/gnupg/gnupg-dev: PV changed from "2.4.0" to "2.4.1"
packages/core2-32-poky-linux/gnupg/gnupg-doc: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/core2-32-poky-linux/gnupg/gnupg-doc: FILELIST: removed "/usr/share/doc/gnupg/examples/debug.prf /usr/share/doc/gnupg/examples/systemd-user/gpg-agent.service /usr/share/doc/gnupg/examples/Automatic.prf /usr/share/doc/gnupg/examples/systemd-user/dirmngr.socket /usr/share/doc/gnupg/examples/systemd-user/gpg-agent-extra.socket /usr/share/doc/gnupg/examples/systemd-user/gpg-agent.socket /usr/share/doc/gnupg/examples/systemd-user/gpg-agent-ssh.socket /usr/share/doc/gnupg/examples/systemd-user/README /usr/share/doc/gnupg/examples/VS-NfD.prf /usr/share/doc/gnupg/examples/systemd-user/dirmngr.service /usr/share/doc/gnupg/examples/systemd-user/gpg-agent-browser.socket"
packages/core2-32-poky-linux/gnupg/gnupg-doc: PKGSIZE changed from 1163381 to 1181914 (+2%)
packages/core2-32-poky-linux/gnupg/gnupg-doc: PV changed from "2.4.0" to "2.4.1"
packages/core2-32-poky-linux/gnupg/gnupg-gpg: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/core2-32-poky-linux/gnupg/gnupg-gpg: PKGSIZE changed from 1844976 to 1832752 (-1%)
packages/core2-32-poky-linux/gnupg/gnupg-gpg: PV changed from "2.4.0" to "2.4.1"
packages/core2-32-poky-linux/gnupg/gnupg-locale-ca: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-ca: PV changed from "2.4.0" to "2.4.1"
packages/core2-32-poky-linux/gnupg/gnupg-locale-cs: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-cs: PKGSIZE changed from 240512 to 240391 (-0%)
packages/core2-32-poky-linux/gnupg/gnupg-locale-cs: PV changed from "2.4.0" to "2.4.1"
packages/core2-32-poky-linux/gnupg/gnupg-locale-da: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-da: PV changed from "2.4.0" to "2.4.1"
packages/core2-32-poky-linux/gnupg/gnupg-locale-de: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-de: PKGSIZE changed from 244301 to 245501 (+0%)
packages/core2-32-poky-linux/gnupg/gnupg-locale-de: PV changed from "2.4.0" to "2.4.1"
packages/core2-32-poky-linux/gnupg/gnupg-locale-el: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-el: PV changed from "2.4.0" to "2.4.1"
packages/core2-32-poky-linux/gnupg/gnupg-locale-en+boldquot: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-en+boldquot: PKGSIZE changed from 222514 to 223710 (+1%)
packages/core2-32-poky-linux/gnupg/gnupg-locale-en+boldquot: PV changed from "2.4.0" to "2.4.1"
packages/core2-32-poky-linux/gnupg/gnupg-locale-en+quot: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-en+quot: PKGSIZE changed from 220162 to 221334 (+1%)
packages/core2-32-poky-linux/gnupg/gnupg-locale-en+quot: PV changed from "2.4.0" to "2.4.1"
packages/core2-32-poky-linux/gnupg/gnupg-locale-eo: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-eo: PV changed from "2.4.0" to "2.4.1"
packages/core2-32-poky-linux/gnupg/gnupg-locale-es: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-es: PV changed from "2.4.0" to "2.4.1"
packages/core2-32-poky-linux/gnupg/gnupg-locale-et: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-et: PV changed from "2.4.0" to "2.4.1"
packages/core2-32-poky-linux/gnupg/gnupg-locale-fi: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-fi: PV changed from "2.4.0" to "2.4.1"
packages/core2-32-poky-linux/gnupg/gnupg-locale-fr: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-fr: PV changed from "2.4.0" to "2.4.1"
packages/core2-32-poky-linux/gnupg/gnupg-locale-gl: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-gl: PV changed from "2.4.0" to "2.4.1"
packages/core2-32-poky-linux/gnupg/gnupg-locale-hu: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-hu: PV changed from "2.4.0" to "2.4.1"
packages/core2-32-poky-linux/gnupg/gnupg-locale-id: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-id: PV changed from "2.4.0" to "2.4.1"
packages/core2-32-poky-linux/gnupg/gnupg-locale-it: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-it: PV changed from "2.4.0" to "2.4.1"
packages/core2-32-poky-linux/gnupg/gnupg-locale-ja: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-ja: PKGSIZE changed from 250886 to 252729 (+1%)
packages/core2-32-poky-linux/gnupg/gnupg-locale-ja: PV changed from "2.4.0" to "2.4.1"
packages/core2-32-poky-linux/gnupg/gnupg-locale-nb: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-nb: PV changed from "2.4.0" to "2.4.1"
packages/core2-32-poky-linux/gnupg/gnupg-locale-pl: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-pl: PV changed from "2.4.0" to "2.4.1"
packages/core2-32-poky-linux/gnupg/gnupg-locale-pt: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-pt: PV changed from "2.4.0" to "2.4.1"
packages/core2-32-poky-linux/gnupg/gnupg-locale-ro: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-ro: PV changed from "2.4.0" to "2.4.1"
packages/core2-32-poky-linux/gnupg/gnupg-locale-ru: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-ru: PV changed from "2.4.0" to "2.4.1"
packages/core2-32-poky-linux/gnupg/gnupg-locale-sk: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-sk: PV changed from "2.4.0" to "2.4.1"
packages/core2-32-poky-linux/gnupg/gnupg-locale-sv: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-sv: PV changed from "2.4.0" to "2.4.1"
packages/core2-32-poky-linux/gnupg/gnupg-locale-tr: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-tr: PKGSIZE changed from 238880 to 238752 (-0%)
packages/core2-32-poky-linux/gnupg/gnupg-locale-tr: PV changed from "2.4.0" to "2.4.1"
packages/core2-32-poky-linux/gnupg/gnupg-locale-uk: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-uk: PV changed from "2.4.0" to "2.4.1"
packages/core2-32-poky-linux/gnupg/gnupg-locale-zh-cn: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-zh-cn: PKGSIZE changed from 220044 to 219889 (-0%)
packages/core2-32-poky-linux/gnupg/gnupg-locale-zh-cn: PV changed from "2.4.0" to "2.4.1"
packages/core2-32-poky-linux/gnupg/gnupg-locale-zh-tw: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-zh-tw: PV changed from "2.4.0" to "2.4.1"
packages/core2-32-poky-linux/gnupg/gnupg-src: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/core2-32-poky-linux/gnupg/gnupg-src: FILELIST: directory renamed /usr/src/debug/gnupg/2.4.0-r0/agent -> /usr/src/debug/gnupg/2.4.1-r0/agent, directory renamed /usr/src/debug/gnupg/2.4.0-r0/tests/gpgscm -> /usr/src/debug/gnupg/2.4.1-r0/tests/gpgscm, directory renamed /usr/src/debug/gnupg/2.4.0-r0/common -> /usr/src/debug/gnupg/2.4.1-r0/common, directory renamed /usr/src/debug/gnupg/2.4.0-r0/scd -> /usr/src/debug/gnupg/2.4.1-r0/scd, directory renamed /usr/src/debug/gnupg/2.4.0-r0/kbx -> /usr/src/debug/gnupg/2.4.1-r0/kbx, directory renamed /usr/src/debug/gnupg/2.4.0-r0/tools -> /usr/src/debug/gnupg/2.4.1-r0/tools, directory renamed /usr/src/debug/gnupg/2.4.0-r0/sm -> /usr/src/debug/gnupg/2.4.1-r0/sm, directory renamed /usr/src/debug/gnupg/2.4.0-r0/g10 -> /usr/src/debug/gnupg/2.4.1-r0/g10, directory renamed /usr/src/debug/gnupg/2.4.0-r0/regexp -> /usr/src/debug/gnupg/2.4.1-r0/regexp, removed "/usr/src/debug/gnupg/2.4.0-r0/dirmngr/dirmngr-client.c /usr/src/debug/gnupg/2.4.0-r0/di
 rmngr/cdblib.c /usr/src/debug/gnupg/2.4.0-r0/dirmngr/dirmngr-status.h /usr/src/debug/gnupg/2.4.0-r0/dirmngr/ocsp.c /usr/src/debug/gnupg/2.4.0-r0/dirmngr/http-common.c /usr/src/debug/gnupg/2.4.0-r0/dirmngr/ks-engine-http.c /usr/src/debug/gnupg/2.4.0-r0/dirmngr/http-common.h /usr/src/debug/gnupg/2.4.0-r0/dirmngr/ks-engine-hkp.c /usr/src/debug/gnupg/2.4.0-r0/dirmngr/ocsp.h /usr/src/debug/gnupg/2.4.0-r0/dirmngr/ks-action.h /usr/src/debug/gnupg/2.4.0-r0/dirmngr/ks-engine.h /usr/src/debug/gnupg/2.4.0-r0/dirmngr/ks-action.c /usr/src/debug/gnupg/2.4.0-r0/dirmngr/dirmngr.c /usr/src/debug/gnupg/2.4.0-r0/dirmngr/validate.c /usr/src/debug/gnupg/2.4.0-r0/dirmngr/loadswdb.c /usr/src/debug/gnupg/2.4.0-r0/dirmngr/dirmngr.h /usr/src/debug/gnupg/2.4.0-r0/dirmngr/validate.h /usr/src/debug/gnupg/2.4.0-r0/dirmngr/certcache.h /usr/src/debug/gnupg/2.4.0-r0/dirmngr/crlcache.h /usr/src/debug/gnupg/2.4.0-r0/dirmngr/cdb.h /usr/src/debug/gnupg/2.4.0-r0/dirmngr/crlcache.c /usr/src/debug/gnupg/2.4.0-r0/dirmngr/s
 erver.c /usr/src/debug/gnupg/2.4.0-r0/dirmngr/certcache.c /usr/src/debug/gnupg/2.4.0-r0/dirmngr/workqueue.c /usr/src/debug/gnupg/2.4.0-r0/dirmngr/misc.c /usr/src/debug/gnupg/2.4.0-r0/dirmngr/http.c /usr/src/debug/gnupg/2.4.0-r0/dirmngr/ks-engine-finger.c /usr/src/debug/gnupg/2.4.0-r0/dirmngr/misc.h /usr/src/debug/gnupg/2.4.0-r0/dirmngr/http.h /usr/src/debug/gnupg/2.4.0-r0/dirmngr/http-ntbtls.c /usr/src/debug/gnupg/2.4.0-r0/dirmngr/domaininfo.c /usr/src/debug/gnupg/2.4.0-r0/dirmngr/dns.h /usr/src/debug/gnupg/2.4.0-r0/dirmngr/crlfetch.c /usr/src/debug/gnupg/2.4.0-r0/dirmngr/dns.c /usr/src/debug/gnupg/2.4.0-r0/dirmngr/crlfetch.h /usr/src/debug/gnupg/2.4.0-r0/dirmngr/ks-engine-kdns.c /usr/src/debug/gnupg/2.4.0-r0/dirmngr/dns-stuff.h /usr/src/debug/gnupg/2.4.0-r0/dirmngr/dns-stuff.c", added "/usr/src/debug/gnupg/2.4.1-r0/dirmngr/dirmngr-client.c /usr/src/debug/gnupg/2.4.1-r0/dirmngr/cdblib.c /usr/src/debug/gnupg/2.4.1-r0/dirmngr/dirmngr-status.h /usr/src/debug/gnupg/2.4.1-r0/dirmngr/ocsp
 .c /usr/src/debug/gnupg/2.4.1-r0/dirmngr/http-common.c /usr/src/debug/gnupg/2.4.1-r0/dirmngr/ks-engine-http.c /usr/src/debug/gnupg/2.4.1-r0/dirmngr/http-common.h /usr/src/debug/gnupg/2.4.1-r0/dirmngr/ks-engine-hkp.c /usr/src/debug/gnupg/2.4.1-r0/dirmngr/ocsp.h /usr/src/debug/gnupg/2.4.1-r0/dirmngr/ks-action.h /usr/src/debug/gnupg/2.4.1-r0/dirmngr/ks-engine.h /usr/src/debug/gnupg/2.4.1-r0/dirmngr/ks-action.c /usr/src/debug/gnupg/2.4.1-r0/dirmngr/dirmngr.c /usr/src/debug/gnupg/2.4.1-r0/dirmngr/validate.c /usr/src/debug/gnupg/2.4.1-r0/dirmngr/loadswdb.c /usr/src/debug/gnupg/2.4.1-r0/dirmngr/dirmngr.h /usr/src/debug/gnupg/2.4.1-r0/dirmngr/validate.h /usr/src/debug/gnupg/2.4.1-r0/dirmngr/certcache.h /usr/src/debug/gnupg/2.4.1-r0/dirmngr/crlcache.h /usr/src/debug/gnupg/2.4.1-r0/dirmngr/cdb.h /usr/src/debug/gnupg/2.4.1-r0/dirmngr/crlcache.c /usr/src/debug/gnupg/2.4.1-r0/dirmngr/server.c /usr/src/debug/gnupg/2.4.1-r0/dirmngr/certcache.c /usr/src/debug/gnupg/2.4.1-r0/dirmngr/workqueue.c /usr
 /src/debug/gnupg/2.4.1-r0/dirmngr/misc.c /usr/src/debug/gnupg/2.4.1-r0/dirmngr/http.c /usr/src/debug/gnupg/2.4.1-r0/dirmngr/ks-engine-finger.c /usr/src/debug/gnupg/2.4.1-r0/dirmngr/misc.h /usr/src/debug/gnupg/2.4.1-r0/dirmngr/http.h /usr/src/debug/gnupg/2.4.1-r0/dirmngr/http-ntbtls.c /usr/src/debug/gnupg/2.4.1-r0/dirmngr/domaininfo.c /usr/src/debug/gnupg/2.4.1-r0/dirmngr/dns.h /usr/src/debug/gnupg/2.4.1-r0/dirmngr/crlfetch.c /usr/src/debug/gnupg/2.4.1-r0/dirmngr/dns.c /usr/src/debug/gnupg/2.4.1-r0/dirmngr/crlfetch.h /usr/src/debug/gnupg/2.4.1-r0/dirmngr/ks-engine-kdns.c /usr/src/debug/gnupg/2.4.1-r0/dirmngr/dns-stuff.h /usr/src/debug/gnupg/2.4.1-r0/dirmngr/dns-stuff.c /usr/src/debug/gnupg/2.4.1-r0/dirmngr/fakecrl.c"
packages/core2-32-poky-linux/gnupg/gnupg-src: PKGSIZE changed from 8849198 to 8925750 (+1%)
packages/core2-32-poky-linux/gnupg/gnupg-src: PV changed from "2.4.0" to "2.4.1"
packages/core2-32-poky-linux/gnupg/gnupg-staticdev: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/core2-32-poky-linux/gnupg/gnupg-staticdev: PV changed from "2.4.0" to "2.4.1"
packages/core2-32-poky-linux/gnupg/gnupg: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/core2-32-poky-linux/gnupg/gnupg: PKGSIZE changed from 5653142 to 5370754 (-5%)
packages/core2-32-poky-linux/gnupg/gnupg: PV changed from "2.4.0" to "2.4.1"
packages/core2-32-poky-linux/gnupg: SRC_URI changed from "https://www.gnupg.org/ftp/gcrypt/gnupg/gnupg-2.4.0.tar.bz2 file://0002-use-pkgconfig-instead-of-npth-config.patch file://0004-autogen.sh-fix-find-version-for-beta-checking.patch file://0001-Woverride-init-is-not-needed-with-gcc-9.patch" to "https://www.gnupg.org/ftp/gcrypt/gnupg/gnupg-2.4.1.tar.bz2 file://0002-use-pkgconfig-instead-of-npth-config.patch file://0004-autogen.sh-fix-find-version-for-beta-checking.patch file://0001-Woverride-init-is-not-needed-with-gcc-9.patch"
packages/core2-32-poky-linux/gnupg: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/core2-32-poky-linux/gnupg: PV changed from "2.4.0" to "2.4.1"

--===============0448404380859910168==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/gnupg/gnupg-doc: FILELIST: removed "/usr/share/doc/gnupg/examples/systemd-user/gpg-agent.socket /usr/share/doc/gnupg/examples/systemd-user/README /usr/share/doc/gnupg/examples/systemd-user/dirmngr.service /usr/share/doc/gnupg/examples/VS-NfD.prf /usr/share/doc/gnupg/examples/systemd-user/gpg-agent.service /usr/share/doc/gnupg/examples/systemd-user/gpg-agent-browser.socket /usr/share/doc/gnupg/examples/systemd-user/gpg-agent-extra.socket /usr/share/doc/gnupg/examples/debug.prf /usr/share/doc/gnupg/examples/systemd-user/dirmngr.socket /usr/share/doc/gnupg/examples/Automatic.prf /usr/share/doc/gnupg/examples/systemd-user/gpg-agent-ssh.socket"

--===============0448404380859910168==--

