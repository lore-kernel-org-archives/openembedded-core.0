Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D1F9C7EE29
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:31 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.7518.1685693430161136734
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=RO+e6q2g;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101887b28753d-2e6dcfd5-4684-44c2-8f6d-657546b47e06-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693429;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=DSiaRlF1PjpAvmYnf0rGjykXvQeBXnz0rd0NmB+/FlQ=;
	b=RO+e6q2g+AYxEgbwSjzvibt0NO4qfZyVHN3rqYpHNgCxzQHdty+Lp5pX/8FAAk4N
	kZwRJHDUMjNOLMT8P3Bg1TqLUjc5m0Gz2ZcJ12Beevk343Iw8ztyJwhylyyJ7jVXxAP
	AelwyQ/yySv3N9GhnmqYkfAGJWyk1FzFr7JatJdA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693429;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=DSiaRlF1PjpAvmYnf0rGjykXvQeBXnz0rd0NmB+/FlQ=;
	b=Wl0+4wB7z+x8bk/ygznthH8tsEnT+nxPEREqZMsAjPxpyKb+mllbkagEKLtSrMwE
	F0PExWbBAqgLjMoz0LztipXjDBUP6ihccTwX+vnrXoPy+ug8nwZ3yIqsD7yrXYkOaPI
	I8+RHELscHhgg486pHfEnNJdme6/DUAdndyWEboE=
Content-Type: multipart/mixed; boundary="===============8818562228867656443=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] bind: upgrading to 9.18.15 SUCCEEDED
Message-ID: <010101887b28753d-2e6dcfd5-4684-44c2-8f6d-657546b47e06-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:29 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182149

--===============8818562228867656443==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *bind* to *9.18.15* has Succeeded.

Next steps:
    - apply the patch: git am 0001-bind-upgrade-9.18.14-9.18.15.patch
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
--===============8818562228867656443==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libbind9-9.18.14.so /usr/lib/libisc-9.18.14.so /usr/lib/libdns-9.18.14.so /usr/lib/libisccfg-9.18.14.so /usr/lib/libirs-9.18.14.so /usr/lib/libns-9.18.14.so /usr/lib/libisccc-9.18.14.so", added "/usr/lib/libdns-9.18.15.so /usr/lib/libisc-9.18.15.so /usr/lib/libirs-9.18.15.so /usr/lib/libisccc-9.18.15.so /usr/lib/libbind9-9.18.15.so /usr/lib/libisccfg-9.18.15.so /usr/lib/libns-9.18.15.so"
Changes to packages/core2-32-poky-linux/bind (sysroot):
  /usr/lib/libbind9.so changed symlink target from libbind9-9.18.14.so to libbind9-9.18.15.so
  /usr/lib/libdns.so changed symlink target from libdns-9.18.14.so to libdns-9.18.15.so
  /usr/lib/libirs.so changed symlink target from libirs-9.18.14.so to libirs-9.18.15.so
  /usr/lib/libisccc.so changed symlink target from libisccc-9.18.14.so to libisccc-9.18.15.so
  /usr/lib/libisccfg.so changed symlink target from libisccfg-9.18.14.so to libisccfg-9.18.15.so
  /usr/lib/libisc.so changed symlink target from libisc-9.18.14.so to libisc-9.18.15.so
  /usr/lib/libns.so changed symlink target from libns-9.18.14.so to libns-9.18.15.so
  /usr/lib/libbind9-9.18.14.so moved to /usr/lib/libbind9-9.18.15.so
  /usr/lib/libdns-9.18.14.so moved to /usr/lib/libdns-9.18.15.so
  /usr/lib/libirs-9.18.14.so moved to /usr/lib/libirs-9.18.15.so
  /usr/lib/libisc-9.18.14.so moved to /usr/lib/libisc-9.18.15.so
  /usr/lib/libisccc-9.18.14.so moved to /usr/lib/libisccc-9.18.15.so
  /usr/lib/libisccfg-9.18.14.so moved to /usr/lib/libisccfg-9.18.15.so
  /usr/lib/libns-9.18.14.so moved to /usr/lib/libns-9.18.15.so

--===============8818562228867656443==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-bind-upgrade-9.18.14-9.18.15.patch"

RnJvbSAwMmU5ZDJiYzc4MzA0NDlhZmU2MGNmMWY3YWRjY2VkM2IwNjgyNmMwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKdW4gMjAyMyAwNjoyMjo0MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJp
bmQ6IHVwZ3JhZGUgOS4xOC4xNCAtPiA5LjE4LjE1CgotLS0KIC4uLi8wMDAxLWF2b2lkLXN0YXJ0
LWZhaWx1cmUtd2l0aC1iaW5kLXVzZXIucGF0Y2ggICAgICAgICAgICAgICB8IDAKIC4uLi8wMDAx
LW5hbWVkLWx3cmVzZC1WLWFuZC1zdGFydC1sb2ctaGlkZS1idWlsZC1vcHRpb25zLnBhdGNoICB8
IDAKIC4uLi9iaW5kLWVuc3VyZS1zZWFyY2hpbmctZm9yLWpzb24taGVhZGVycy1zZWFyY2hlcy1z
eXNyLnBhdGNoICB8IDAKIC4uLi9iaW5kL3tiaW5kLTkuMTguMTQgPT4gYmluZC05LjE4LjE1fS9i
aW5kOSAgICAgICAgICAgICAgICAgICB8IDAKIC4uLi9iaW5kL3tiaW5kLTkuMTguMTQgPT4gYmlu
ZC05LjE4LjE1fS9jb25mLnBhdGNoICAgICAgICAgICAgICB8IDAKIC4uLi9iaW5kL3tiaW5kLTku
MTguMTQgPT4gYmluZC05LjE4LjE1fS9nZW5lcmF0ZS1ybmRjLWtleS5zaCAgICB8IDAKIC4uLi9p
bml0LmQtYWRkLXN1cHBvcnQtZm9yLXJlYWQtb25seS1yb290ZnMucGF0Y2ggICAgICAgICAgICAg
ICB8IDAKIC4uLi9tYWtlLWV0Yy1pbml0ZC1iaW5kLXN0b3Atd29yay5wYXRjaCAgICAgICAgICAg
ICAgICAgICAgICAgICB8IDAKIC4uLi9iaW5kL3tiaW5kLTkuMTguMTQgPT4gYmluZC05LjE4LjE1
fS9uYW1lZC5zZXJ2aWNlICAgICAgICAgICB8IDAKIC4uLi9iaW5kL3tiaW5kXzkuMTguMTQuYmIg
PT4gYmluZF85LjE4LjE1LmJifSAgICAgICAgICAgICAgICAgICB8IDIgKy0KIDEwIGZpbGVzIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9iaW5kL3tiaW5kLTkuMTguMTQgPT4gYmluZC05LjE4LjE1fS8wMDAxLWF2
b2lkLXN0YXJ0LWZhaWx1cmUtd2l0aC1iaW5kLXVzZXIucGF0Y2ggKDEwMCUpCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL3tiaW5kLTkuMTguMTQgPT4gYmluZC05LjE4LjE1
fS8wMDAxLW5hbWVkLWx3cmVzZC1WLWFuZC1zdGFydC1sb2ctaGlkZS1idWlsZC1vcHRpb25zLnBh
dGNoICgxMDAlKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC97YmluZC05
LjE4LjE0ID0+IGJpbmQtOS4xOC4xNX0vYmluZC1lbnN1cmUtc2VhcmNoaW5nLWZvci1qc29uLWhl
YWRlcnMtc2VhcmNoZXMtc3lzci5wYXRjaCAoMTAwJSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L2JpbmQve2JpbmQtOS4xOC4xNCA9PiBiaW5kLTkuMTguMTV9L2JpbmQ5ICgxMDAl
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC97YmluZC05LjE4LjE0ID0+
IGJpbmQtOS4xOC4xNX0vY29uZi5wYXRjaCAoMTAwJSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L2JpbmQve2JpbmQtOS4xOC4xNCA9PiBiaW5kLTkuMTguMTV9L2dlbmVyYXRlLXJu
ZGMta2V5LnNoICgxMDAlKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC97
YmluZC05LjE4LjE0ID0+IGJpbmQtOS4xOC4xNX0vaW5pdC5kLWFkZC1zdXBwb3J0LWZvci1yZWFk
LW9ubHktcm9vdGZzLnBhdGNoICgxMDAlKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZp
dHkvYmluZC97YmluZC05LjE4LjE0ID0+IGJpbmQtOS4xOC4xNX0vbWFrZS1ldGMtaW5pdGQtYmlu
ZC1zdG9wLXdvcmsucGF0Y2ggKDEwMCUpCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9iaW5kL3tiaW5kLTkuMTguMTQgPT4gYmluZC05LjE4LjE1fS9uYW1lZC5zZXJ2aWNlICgxMDAl
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC97YmluZF85LjE4LjE0LmJi
ID0+IGJpbmRfOS4xOC4xNS5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L2JpbmQvYmluZC05LjE4LjE0LzAwMDEtYXZvaWQtc3RhcnQtZmFpbHVyZS13aXRo
LWJpbmQtdXNlci5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLTku
MTguMTUvMDAwMS1hdm9pZC1zdGFydC1mYWlsdXJlLXdpdGgtYmluZC11c2VyLnBhdGNoCnNpbWls
YXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2Jp
bmQvYmluZC05LjE4LjE0LzAwMDEtYXZvaWQtc3RhcnQtZmFpbHVyZS13aXRoLWJpbmQtdXNlci5w
YXRjaApyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQtOS4xOC4x
NS8wMDAxLWF2b2lkLXN0YXJ0LWZhaWx1cmUtd2l0aC1iaW5kLXVzZXIucGF0Y2gKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLTkuMTguMTQvMDAwMS1uYW1l
ZC1sd3Jlc2QtVi1hbmQtc3RhcnQtbG9nLWhpZGUtYnVpbGQtb3B0aW9ucy5wYXRjaCBiL21ldGEv
cmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLTkuMTguMTUvMDAwMS1uYW1lZC1sd3Jlc2Qt
Vi1hbmQtc3RhcnQtbG9nLWhpZGUtYnVpbGQtb3B0aW9ucy5wYXRjaApzaW1pbGFyaXR5IGluZGV4
IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQtOS4x
OC4xNC8wMDAxLW5hbWVkLWx3cmVzZC1WLWFuZC1zdGFydC1sb2ctaGlkZS1idWlsZC1vcHRpb25z
LnBhdGNoCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC05LjE4
LjE1LzAwMDEtbmFtZWQtbHdyZXNkLVYtYW5kLXN0YXJ0LWxvZy1oaWRlLWJ1aWxkLW9wdGlvbnMu
cGF0Y2gKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLTku
MTguMTQvYmluZC1lbnN1cmUtc2VhcmNoaW5nLWZvci1qc29uLWhlYWRlcnMtc2VhcmNoZXMtc3lz
ci5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLTkuMTguMTUvYmlu
ZC1lbnN1cmUtc2VhcmNoaW5nLWZvci1qc29uLWhlYWRlcnMtc2VhcmNoZXMtc3lzci5wYXRjaApz
aW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9iaW5kL2JpbmQtOS4xOC4xNC9iaW5kLWVuc3VyZS1zZWFyY2hpbmctZm9yLWpzb24taGVhZGVy
cy1zZWFyY2hlcy1zeXNyLnBhdGNoCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L2JpbmQvYmluZC05LjE4LjE1L2JpbmQtZW5zdXJlLXNlYXJjaGluZy1mb3ItanNvbi1oZWFkZXJz
LXNlYXJjaGVzLXN5c3IucGF0Y2gKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZp
dHkvYmluZC9iaW5kLTkuMTguMTQvYmluZDkgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2Jp
bmQvYmluZC05LjE4LjE1L2JpbmQ5CnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBt
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC05LjE4LjE0L2JpbmQ5CnJlbmFtZSB0
byBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC05LjE4LjE1L2JpbmQ5CmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC05LjE4LjE0L2NvbmYu
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC05LjE4LjE1L2NvbmYu
cGF0Y2gKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb25u
ZWN0aXZpdHkvYmluZC9iaW5kLTkuMTguMTQvY29uZi5wYXRjaApyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQtOS4xOC4xNS9jb25mLnBhdGNoCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC05LjE4LjE0L2dlbmVyYXRlLXJu
ZGMta2V5LnNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQtOS4xOC4xNS9n
ZW5lcmF0ZS1ybmRjLWtleS5zaApzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQtOS4xOC4xNC9nZW5lcmF0ZS1ybmRjLWtl
eS5zaApyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQtOS4xOC4x
NS9nZW5lcmF0ZS1ybmRjLWtleS5zaApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9iaW5kL2JpbmQtOS4xOC4xNC9pbml0LmQtYWRkLXN1cHBvcnQtZm9yLXJlYWQtb25seS1y
b290ZnMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC05LjE4LjE1
L2luaXQuZC1hZGQtc3VwcG9ydC1mb3ItcmVhZC1vbmx5LXJvb3Rmcy5wYXRjaApzaW1pbGFyaXR5
IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2Jp
bmQtOS4xOC4xNC9pbml0LmQtYWRkLXN1cHBvcnQtZm9yLXJlYWQtb25seS1yb290ZnMucGF0Y2gK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLTkuMTguMTUvaW5p
dC5kLWFkZC1zdXBwb3J0LWZvci1yZWFkLW9ubHktcm9vdGZzLnBhdGNoCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC05LjE4LjE0L21ha2UtZXRjLWluaXRk
LWJpbmQtc3RvcC13b3JrLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2Jp
bmQtOS4xOC4xNS9tYWtlLWV0Yy1pbml0ZC1iaW5kLXN0b3Atd29yay5wYXRjaApzaW1pbGFyaXR5
IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2Jp
bmQtOS4xOC4xNC9tYWtlLWV0Yy1pbml0ZC1iaW5kLXN0b3Atd29yay5wYXRjaApyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQtOS4xOC4xNS9tYWtlLWV0Yy1pbml0
ZC1iaW5kLXN0b3Atd29yay5wYXRjaApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9iaW5kL2JpbmQtOS4xOC4xNC9uYW1lZC5zZXJ2aWNlIGIvbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9iaW5kL2JpbmQtOS4xOC4xNS9uYW1lZC5zZXJ2aWNlCnNpbWlsYXJpdHkgaW5kZXgg
MTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC05LjE4
LjE0L25hbWVkLnNlcnZpY2UKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmlu
ZC9iaW5kLTkuMTguMTUvbmFtZWQuc2VydmljZQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNv
bm5lY3Rpdml0eS9iaW5kL2JpbmRfOS4xOC4xNC5iYiBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZp
dHkvYmluZC9iaW5kXzkuMTguMTUuYmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20g
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmRfOS4xOC4xNC5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmRfOS4xOC4xNS5iYgppbmRleCBjNTEz
Y2JjOGI2Li44MDE2NGFhZDg3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L2JpbmQvYmluZF85LjE4LjE0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmlu
ZC9iaW5kXzkuMTguMTUuYmIKQEAgLTIwLDcgKzIwLDcgQEAgU1JDX1VSSSA9ICJodHRwczovL2Z0
cC5pc2Mub3JnL2lzYy9iaW5kOS8ke1BWfS8ke0JQTn0tJHtQVn0udGFyLnh6IFwKICAgICAgICAg
ICAgZmlsZTovLzAwMDEtYXZvaWQtc3RhcnQtZmFpbHVyZS13aXRoLWJpbmQtdXNlci5wYXRjaCBc
CiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjlhZTEyZWRmNmFjM2M0MzBi
MzNlY2QxYTdjMGMwYzYwODc1ZDI1NTE4NWViODc4NTBmYTlhNWU3OTRhNjRhMDkiCitTUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiMjhhZThkYjE0ODYyODAxYmMyYmQ0ZmQ4MjBkYjAwNjY3ZDNmMWZmOWFl
OWNjMmQwNmEwZWY3ODEwZmVkN2E0ZSIKIAogVVBTVFJFQU1fQ0hFQ0tfVVJJID0gImh0dHBzOi8v
ZnRwLmlzYy5vcmcvaXNjL2JpbmQ5LyIKICMgZm9sbG93IHRoZSBFU1YgdmVyc2lvbnMgZGl2aXNp
YmxlIGJ5IDIKLS0gCjIuMzkuMgoK

--===============8818562228867656443==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/bind/bind-dbg: PKGV changed from 9.18.14 [default] to 9.18.15 [default]
packages/core2-32-poky-linux/bind/bind-dbg: FILELIST: removed "/usr/lib/.debug/libbind9-9.18.14.so /usr/lib/.debug/libisccc-9.18.14.so /usr/lib/.debug/libdns-9.18.14.so /usr/lib/.debug/libirs-9.18.14.so /usr/lib/.debug/libisc-9.18.14.so /usr/lib/.debug/libisccfg-9.18.14.so /usr/lib/.debug/libns-9.18.14.so", added "/usr/lib/.debug/libisccfg-9.18.15.so /usr/lib/.debug/libbind9-9.18.15.so /usr/lib/.debug/libisccc-9.18.15.so /usr/lib/.debug/libdns-9.18.15.so /usr/lib/.debug/libirs-9.18.15.so /usr/lib/.debug/libisc-9.18.15.so /usr/lib/.debug/libns-9.18.15.so"
packages/core2-32-poky-linux/bind/bind-dbg: PV changed from "9.18.14" to "9.18.15"
packages/core2-32-poky-linux/bind/bind-dbg: PKGSIZE changed from 10886064 to 10893760 (+0%)
packages/core2-32-poky-linux/bind/bind-dev: PKGV changed from 9.18.14 [default] to 9.18.15 [default]
packages/core2-32-poky-linux/bind/bind-dev: PV changed from "9.18.14" to "9.18.15"
packages/core2-32-poky-linux/bind/bind-dev: PKGSIZE changed from 1456196 to 1456425 (+0%)
packages/core2-32-poky-linux/bind/bind-doc: PKGV changed from 9.18.14 [default] to 9.18.15 [default]
packages/core2-32-poky-linux/bind/bind-doc: PV changed from "9.18.14" to "9.18.15"
packages/core2-32-poky-linux/bind/bind-libs: FILES: removed "/usr/lib/*-9.18.14.so", added "/usr/lib/*-9.18.15.so"
packages/core2-32-poky-linux/bind/bind-libs: PKGV changed from 9.18.14 [default] to 9.18.15 [default]
packages/core2-32-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libbind9-9.18.14.so /usr/lib/libns-9.18.14.so /usr/lib/libisccfg-9.18.14.so /usr/lib/libdns-9.18.14.so /usr/lib/libirs-9.18.14.so /usr/lib/libisc-9.18.14.so /usr/lib/libisccc-9.18.14.so", added "/usr/lib/libns-9.18.15.so /usr/lib/libisccc-9.18.15.so /usr/lib/libdns-9.18.15.so /usr/lib/libbind9-9.18.15.so /usr/lib/libisc-9.18.15.so /usr/lib/libirs-9.18.15.so /usr/lib/libisccfg-9.18.15.so"
packages/core2-32-poky-linux/bind/bind-libs: PV changed from "9.18.14" to "9.18.15"
packages/core2-32-poky-linux/bind/bind-locale: PKGV changed from 9.18.14 [default] to 9.18.15 [default]
packages/core2-32-poky-linux/bind/bind-locale: PV changed from "9.18.14" to "9.18.15"
packages/core2-32-poky-linux/bind/bind-src: PKGV changed from 9.18.14 [default] to 9.18.15 [default]
packages/core2-32-poky-linux/bind/bind-src: PV changed from "9.18.14" to "9.18.15"
packages/core2-32-poky-linux/bind/bind-src: PKGSIZE changed from 9587056 to 9593865 (+0%)
packages/core2-32-poky-linux/bind/bind-staticdev: PKGV changed from 9.18.14 [default] to 9.18.15 [default]
packages/core2-32-poky-linux/bind/bind-staticdev: PV changed from "9.18.14" to "9.18.15"
packages/core2-32-poky-linux/bind/bind-utils: PKGV changed from 9.18.14 [default] to 9.18.15 [default]
packages/core2-32-poky-linux/bind/bind-utils: PV changed from "9.18.14" to "9.18.15"
packages/core2-32-poky-linux/bind/bind: PKGV changed from 9.18.14 [default] to 9.18.15 [default]
packages/core2-32-poky-linux/bind/bind: PV changed from "9.18.14" to "9.18.15"
packages/core2-32-poky-linux/bind: SRC_URI changed from "https://ftp.isc.org/isc/bind9/9.18.14/bind-9.18.14.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch" to "https://ftp.isc.org/isc/bind9/9.18.15/bind-9.18.15.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch"
packages/core2-32-poky-linux/bind: PKGV changed from 9.18.14 [default] to 9.18.15 [default]
packages/core2-32-poky-linux/bind: PV changed from "9.18.14" to "9.18.15"
Changes to packages/core2-32-poky-linux/bind (sysroot):
  /usr/lib/libbind9.so changed symlink target from libbind9-9.18.14.so to libbind9-9.18.15.so
  /usr/lib/libdns.so changed symlink target from libdns-9.18.14.so to libdns-9.18.15.so
  /usr/lib/libirs.so changed symlink target from libirs-9.18.14.so to libirs-9.18.15.so
  /usr/lib/libisccc.so changed symlink target from libisccc-9.18.14.so to libisccc-9.18.15.so
  /usr/lib/libisccfg.so changed symlink target from libisccfg-9.18.14.so to libisccfg-9.18.15.so
  /usr/lib/libisc.so changed symlink target from libisc-9.18.14.so to libisc-9.18.15.so
  /usr/lib/libns.so changed symlink target from libns-9.18.14.so to libns-9.18.15.so
  /usr/lib/libbind9-9.18.14.so moved to /usr/lib/libbind9-9.18.15.so
  /usr/lib/libdns-9.18.14.so moved to /usr/lib/libdns-9.18.15.so
  /usr/lib/libirs-9.18.14.so moved to /usr/lib/libirs-9.18.15.so
  /usr/lib/libisc-9.18.14.so moved to /usr/lib/libisc-9.18.15.so
  /usr/lib/libisccc-9.18.14.so moved to /usr/lib/libisccc-9.18.15.so
  /usr/lib/libisccfg-9.18.14.so moved to /usr/lib/libisccfg-9.18.15.so
  /usr/lib/libns-9.18.14.so moved to /usr/lib/libns-9.18.15.so

--===============8818562228867656443==--

