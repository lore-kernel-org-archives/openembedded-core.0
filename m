Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82016C6370A
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 15:30:33 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.46776.1669908628182959811
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 07:30:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=S3QOSoha;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010184ce4f7eba-d94be0fa-4c84-4196-a8f4-2786bc4aadd9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1669908627;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=oT7PNO8bpBKnmk4qnMGqjt6r6vViWa2XbortC3hJwSU=;
	b=S3QOSohaz+vgZ8m1kamRYFchvPfdiFPt8YADXKMc+FNamKJvktbNgIEdewZ9TVHj
	av+ZBF05+rm9vZHSBIeK1/oAbdT5fsowXCfxCZ0vRtpEqgATYvuWzt2R4jipG4CqmaO
	oQNLH1AJKEXKhlFRww9paTj+MCNf+3hMDlQ+wKJ0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1669908627;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=oT7PNO8bpBKnmk4qnMGqjt6r6vViWa2XbortC3hJwSU=;
	b=MEHUW74y1ZoPZIpssBFK3u7HQ+30tP/k8rXFiOCpWLeV8vdDp5/qXOeMamJ2Pa6y
	MwgvbQiRi5BY29djbvZOaFavqncFrxU1S8IvFqsq59Mhg1d42i+aTBpYv/BrvHfamph
	xJNEXvtp0s52+VYIf00UBIiLEBrHHa5PEvfQvq1k=
Content-Type: multipart/mixed; boundary="===============9194376731906155558=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gobject-introspection: upgrading to 1.74.0 SUCCEEDED
Message-ID: <01010184ce4f7eba-d94be0fa-4c84-4196-a8f4-2786bc4aadd9-000000@us-west-2.amazonses.com>
Date: Thu, 1 Dec 2022 15:30:27 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 15:30:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174176

--===============9194376731906155558==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gobject-introspection* to *1.74.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gobject-introspection-upgrade-1.72.0-1.74.0.patch
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
--===============9194376731906155558==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gobject-introspection/gobject-introspection-dbg: PKGV changed from 1.72.0 [default] to 1.74.0 [default]
packages/core2-32-poky-linux/gobject-introspection/gobject-introspection-dbg: PV changed from "1.72.0" to "1.74.0"
packages/core2-32-poky-linux/gobject-introspection/gobject-introspection-dbg: PKGSIZE changed from 1412832 to 1413784 (+0%)
packages/core2-32-poky-linux/gobject-introspection/gobject-introspection-dev: PKGV changed from 1.72.0 [default] to 1.74.0 [default]
packages/core2-32-poky-linux/gobject-introspection/gobject-introspection-dev: PV changed from "1.72.0" to "1.74.0"
packages/core2-32-poky-linux/gobject-introspection/gobject-introspection-dev: PKGSIZE changed from 12560702 to 12642508 (+1%)
packages/core2-32-poky-linux/gobject-introspection/gobject-introspection-doc: PKGV changed from 1.72.0 [default] to 1.74.0 [default]
packages/core2-32-poky-linux/gobject-introspection/gobject-introspection-doc: PV changed from "1.72.0" to "1.74.0"
packages/core2-32-poky-linux/gobject-introspection/gobject-introspection-locale: PKGV changed from 1.72.0 [default] to 1.74.0 [default]
packages/core2-32-poky-linux/gobject-introspection/gobject-introspection-locale: PV changed from "1.72.0" to "1.74.0"
packages/core2-32-poky-linux/gobject-introspection/gobject-introspection-src: PKGV changed from 1.72.0 [default] to 1.74.0 [default]
packages/core2-32-poky-linux/gobject-introspection/gobject-introspection-src: PV changed from "1.72.0" to "1.74.0"
packages/core2-32-poky-linux/gobject-introspection/gobject-introspection-src: PKGSIZE changed from 1464573 to 1469418 (+0%)
packages/core2-32-poky-linux/gobject-introspection/gobject-introspection-staticdev: PKGV changed from 1.72.0 [default] to 1.74.0 [default]
packages/core2-32-poky-linux/gobject-introspection/gobject-introspection-staticdev: PV changed from "1.72.0" to "1.74.0"
packages/core2-32-poky-linux/gobject-introspection/gobject-introspection: PKGV changed from 1.72.0 [default] to 1.74.0 [default]
packages/core2-32-poky-linux/gobject-introspection/gobject-introspection: PV changed from "1.72.0" to "1.74.0"
packages/core2-32-poky-linux/gobject-introspection/gobject-introspection: PKGSIZE changed from 1969578 to 1972164 (+0%)
packages/core2-32-poky-linux/gobject-introspection: SRC_URI changed from "https://download.gnome.org/sources//gobject-introspection/1.72/gobject-introspection-1.72.0.tar.xz file://0001-g-ir-tool-template.in-fix-girdir-path.patch" to "https://download.gnome.org/sources//gobject-introspection/1.74/gobject-introspection-1.74.0.tar.xz file://0001-g-ir-tool-template.in-fix-girdir-path.patch"
packages/core2-32-poky-linux/gobject-introspection: PKGV changed from 1.72.0 [default] to 1.74.0 [default]
packages/core2-32-poky-linux/gobject-introspection: PV changed from "1.72.0" to "1.74.0"

--===============9194376731906155558==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gobject-introspection-upgrade-1.72.0-1.74.0.patch"

RnJvbSA0YWE1ZmE3MjM3YTY5N2UzMTZhMDQ0MzFmZGJjYWIzNzMxMmI1OGE0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBEZWMgMjAyMiAxMTo0OToyOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdv
YmplY3QtaW50cm9zcGVjdGlvbjogdXBncmFkZSAxLjcyLjAgLT4gMS43NC4wCgotLS0KIC4uLi1S
ZWxvY2F0ZS10aGUtcmVwb3NpdG9yeS1kaXJlY3RvcnktZm9yLW5hdGl2ZS1idWlsZHMucGF0Y2gg
fCA0ICsrLS0KIC4uLm50cm9zcGVjdGlvbl8xLjcyLjAuYmIgPT4gZ29iamVjdC1pbnRyb3NwZWN0
aW9uXzEuNzQuMC5iYn0gfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ25vbWUvZ29iamVjdC1pbnRyb3Nw
ZWN0aW9uL3tnb2JqZWN0LWludHJvc3BlY3Rpb25fMS43Mi4wLmJiID0+IGdvYmplY3QtaW50cm9z
cGVjdGlvbl8xLjc0LjAuYmJ9ICg5OSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdub21l
L2dvYmplY3QtaW50cm9zcGVjdGlvbi9nb2JqZWN0LWludHJvc3BlY3Rpb24vMDAwMS1SZWxvY2F0
ZS10aGUtcmVwb3NpdG9yeS1kaXJlY3RvcnktZm9yLW5hdGl2ZS1idWlsZHMucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtZ25vbWUvZ29iamVjdC1pbnRyb3NwZWN0aW9uL2dvYmplY3QtaW50cm9zcGVjdGlv
bi8wMDAxLVJlbG9jYXRlLXRoZS1yZXBvc2l0b3J5LWRpcmVjdG9yeS1mb3ItbmF0aXZlLWJ1aWxk
cy5wYXRjaAppbmRleCBiYTk2NTA5MmUxLi5mZWJlZjgyNDc5IDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZ25vbWUvZ29iamVjdC1pbnRyb3NwZWN0aW9uL2dvYmplY3QtaW50cm9zcGVjdGlvbi8w
MDAxLVJlbG9jYXRlLXRoZS1yZXBvc2l0b3J5LWRpcmVjdG9yeS1mb3ItbmF0aXZlLWJ1aWxkcy5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZ29iamVjdC1pbnRyb3NwZWN0aW9uL2dvYmpl
Y3QtaW50cm9zcGVjdGlvbi8wMDAxLVJlbG9jYXRlLXRoZS1yZXBvc2l0b3J5LWRpcmVjdG9yeS1m
b3ItbmF0aXZlLWJ1aWxkcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNzRhMGZlZTg5MjIz
NWM3MjJhYzYwZGRlYTZlZTc5YmMzZDdhOTNmNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gNzdiNjdkOTc0MWE4NzFmYTE1OWM3NDA5MDQyN2ZiMjYwOGZkOTQzNSBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKIEZyb206IFNhc2NoYSBTaWxiZSA8eC15bzE3QHNlLXNpbGJlLmRlPgogRGF0
ZTogRnJpLCA4IEp1biAyMDE4IDEzOjU1OjEwICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIFJlbG9j
YXRlIHRoZSByZXBvc2l0b3J5IGRpcmVjdG9yeSBmb3IgbmF0aXZlIGJ1aWxkcwpAQCAtMjEsNyAr
MjEsNyBAQCBTaWduZWQtb2ZmLWJ5OiBTYXNjaGEgU2lsYmUgPHgteW8xN0BzZS1zaWxiZS5kZT4K
ICAyIGZpbGVzIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCiAKIGRp
ZmYgLS1naXQgYS9naXJlcG9zaXRvcnkvZ2lyZXBvc2l0b3J5LmMgYi9naXJlcG9zaXRvcnkvZ2ly
ZXBvc2l0b3J5LmMKLWluZGV4IDdkMDM0ODUuLjIwZjQ4MTMgMTAwNjQ0CitpbmRleCBhMDc1NGY0
Li4yZDQ1NmY5IDEwMDY0NAogLS0tIGEvZ2lyZXBvc2l0b3J5L2dpcmVwb3NpdG9yeS5jCiArKysg
Yi9naXJlcG9zaXRvcnkvZ2lyZXBvc2l0b3J5LmMKIEBAIC0yMSw2ICsyMSw4IEBACmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ29iamVjdC1pbnRyb3NwZWN0aW9uL2dvYmplY3QtaW50
cm9zcGVjdGlvbl8xLjcyLjAuYmIgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZ29iamVjdC1pbnRyb3Nw
ZWN0aW9uL2dvYmplY3QtaW50cm9zcGVjdGlvbl8xLjc0LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5
OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdub21lL2dvYmplY3QtaW50cm9zcGVjdGlvbi9n
b2JqZWN0LWludHJvc3BlY3Rpb25fMS43Mi4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ25v
bWUvZ29iamVjdC1pbnRyb3NwZWN0aW9uL2dvYmplY3QtaW50cm9zcGVjdGlvbl8xLjc0LjAuYmIK
aW5kZXggZDkzNWNiZDkwNS4uYWI5ZDJkMzVkOSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdu
b21lL2dvYmplY3QtaW50cm9zcGVjdGlvbi9nb2JqZWN0LWludHJvc3BlY3Rpb25fMS43Mi4wLmJi
CisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9nb2JqZWN0LWludHJvc3BlY3Rpb24vZ29iamVjdC1p
bnRyb3NwZWN0aW9uXzEuNzQuMC5iYgpAQCAtMTcsNyArMTcsNyBAQCBTUkNfVVJJID0gIiR7R05P
TUVfTUlSUk9SfS8ke0JQTn0vJHtAb2UudXRpbHMudHJpbV92ZXJzaW9uKCIke1BWfSIsIDIpfS8k
e0JQTn0tJAogICAgICAgICAgICBmaWxlOi8vMDAwMS1nLWlyLXRvb2wtdGVtcGxhdGUuaW4tZml4
LWdpcmRpci1wYXRoLnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0g
PSAiMDJmZThlNTkwODYxZDg4ZjgzMDYwZGQzOWNkYTVjY2FhNjBiMmRhMWQyMWQwZjk1NDk5MzAx
YjE4NmJlYWFiYyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIzNDdiM2E3MTllNjhiYTRjNjlmZjJk
NTdlZTI2ODkyMzNlYThjMDdmYzQ5MjIwNWU1NzMzODY3NzllNDJkNjUzIgogCiBTUkNfVVJJOmFw
cGVuZDpjbGFzcy1uYXRpdmUgPSAiIGZpbGU6Ly8wMDAxLVJlbG9jYXRlLXRoZS1yZXBvc2l0b3J5
LWRpcmVjdG9yeS1mb3ItbmF0aXZlLWJ1aWxkcy5wYXRjaCIKIAotLSAKMi4zMS4xCgo=

--===============9194376731906155558==--

