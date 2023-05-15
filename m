Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 634FDC77B75
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 21:39:15 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.3699.1684186745541162252
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 14:39:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=CfAa7uxZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010188215a46ef-22facd84-f6d2-469d-9aa6-829469644398-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1684186744;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=3P2RfiO85RqPXBuGR6PkLkyBcLVlwJjJqswZq4Z3KbY=;
	b=CfAa7uxZ8SrNW3etHCH9yeyIgHlGmqDW3AsdSRIpWqFx3juinApWyiUuMcDE5mnY
	VPmG7V215WGOIXiOuDXLXefWDw5XoytoQwWe47X4ejmPMSHoVCynlqiFdl4XxKRIlAu
	AKg9BryDgdldzqUEJWs+r/SnxgBO61q+xUNhvR6o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1684186744;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=3P2RfiO85RqPXBuGR6PkLkyBcLVlwJjJqswZq4Z3KbY=;
	b=gV2sSL1kf0abCHbzYiHG+LV8C9cGplNBnhH5cG/LjI2O1NHoMAwNMTSGYMOZMZdv
	8r6lfrR7oGQA0r4ZPNLLxlqV1wtm4hx5Lb93Ax+zzHp6r1icSe1ebJqDF1/GZKneHDG
	jjMkuseX32fDW1V34U41a+uVqqGO0LWbHiTbH3jg=
Content-Type: multipart/mixed; boundary="===============2056415916975538284=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] bind: upgrading to 9.18.14 SUCCEEDED
Message-ID: <01010188215a46ef-22facd84-f6d2-469d-9aa6-829469644398-000000@us-west-2.amazonses.com>
Date: Mon, 15 May 2023 21:39:04 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 21:39:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181271

--===============2056415916975538284==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *bind* to *9.18.14* has Succeeded.

Next steps:
    - apply the patch: git am 0001-bind-upgrade-9.18.13-9.18.14.patch
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
--===============2056415916975538284==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-bind-upgrade-9.18.13-9.18.14.patch"

RnJvbSAzNzRmYzZlZDAxNmU2OTE4NmU4NDEyYzM1MTEyMzZmNTZiYWY3NGE4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgTWF5IDIwMjMgMDY6MzU6MjEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
aW5kOiB1cGdyYWRlIDkuMTguMTMgLT4gOS4xOC4xNAoKLS0tCiAuLi4vMDAwMS1hdm9pZC1zdGFy
dC1mYWlsdXJlLXdpdGgtYmluZC11c2VyLnBhdGNoICAgICAgICAgICAgICAgfCAwCiAuLi4vMDAw
MS1uYW1lZC1sd3Jlc2QtVi1hbmQtc3RhcnQtbG9nLWhpZGUtYnVpbGQtb3B0aW9ucy5wYXRjaCAg
fCAwCiAuLi4vYmluZC1lbnN1cmUtc2VhcmNoaW5nLWZvci1qc29uLWhlYWRlcnMtc2VhcmNoZXMt
c3lzci5wYXRjaCAgfCAwCiAuLi4vYmluZC97YmluZC05LjE4LjEzID0+IGJpbmQtOS4xOC4xNH0v
YmluZDkgICAgICAgICAgICAgICAgICAgfCAwCiAuLi4vYmluZC97YmluZC05LjE4LjEzID0+IGJp
bmQtOS4xOC4xNH0vY29uZi5wYXRjaCAgICAgICAgICAgICAgfCAwCiAuLi4vYmluZC97YmluZC05
LjE4LjEzID0+IGJpbmQtOS4xOC4xNH0vZ2VuZXJhdGUtcm5kYy1rZXkuc2ggICAgfCAwCiAuLi4v
aW5pdC5kLWFkZC1zdXBwb3J0LWZvci1yZWFkLW9ubHktcm9vdGZzLnBhdGNoICAgICAgICAgICAg
ICAgfCAwCiAuLi4vbWFrZS1ldGMtaW5pdGQtYmluZC1zdG9wLXdvcmsucGF0Y2ggICAgICAgICAg
ICAgICAgICAgICAgICAgfCAwCiAuLi4vYmluZC97YmluZC05LjE4LjEzID0+IGJpbmQtOS4xOC4x
NH0vbmFtZWQuc2VydmljZSAgICAgICAgICAgfCAwCiAuLi4vYmluZC97YmluZF85LjE4LjEzLmJi
ID0+IGJpbmRfOS4xOC4xNC5iYn0gICAgICAgICAgICAgICAgICAgfCAyICstCiAxMCBmaWxlcyBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkvYmluZC97YmluZC05LjE4LjEzID0+IGJpbmQtOS4xOC4xNH0vMDAwMS1h
dm9pZC1zdGFydC1mYWlsdXJlLXdpdGgtYmluZC11c2VyLnBhdGNoICgxMDAlKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC97YmluZC05LjE4LjEzID0+IGJpbmQtOS4xOC4x
NH0vMDAwMS1uYW1lZC1sd3Jlc2QtVi1hbmQtc3RhcnQtbG9nLWhpZGUtYnVpbGQtb3B0aW9ucy5w
YXRjaCAoMTAwJSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQve2JpbmQt
OS4xOC4xMyA9PiBiaW5kLTkuMTguMTR9L2JpbmQtZW5zdXJlLXNlYXJjaGluZy1mb3ItanNvbi1o
ZWFkZXJzLXNlYXJjaGVzLXN5c3IucGF0Y2ggKDEwMCUpCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNv
bm5lY3Rpdml0eS9iaW5kL3tiaW5kLTkuMTguMTMgPT4gYmluZC05LjE4LjE0fS9iaW5kOSAoMTAw
JSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQve2JpbmQtOS4xOC4xMyA9
PiBiaW5kLTkuMTguMTR9L2NvbmYucGF0Y2ggKDEwMCUpCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNv
bm5lY3Rpdml0eS9iaW5kL3tiaW5kLTkuMTguMTMgPT4gYmluZC05LjE4LjE0fS9nZW5lcmF0ZS1y
bmRjLWtleS5zaCAoMTAwJSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQv
e2JpbmQtOS4xOC4xMyA9PiBiaW5kLTkuMTguMTR9L2luaXQuZC1hZGQtc3VwcG9ydC1mb3ItcmVh
ZC1vbmx5LXJvb3Rmcy5wYXRjaCAoMTAwJSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2
aXR5L2JpbmQve2JpbmQtOS4xOC4xMyA9PiBiaW5kLTkuMTguMTR9L21ha2UtZXRjLWluaXRkLWJp
bmQtc3RvcC13b3JrLnBhdGNoICgxMDAlKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZp
dHkvYmluZC97YmluZC05LjE4LjEzID0+IGJpbmQtOS4xOC4xNH0vbmFtZWQuc2VydmljZSAoMTAw
JSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQve2JpbmRfOS4xOC4xMy5i
YiA9PiBiaW5kXzkuMTguMTQuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNv
bm5lY3Rpdml0eS9iaW5kL2JpbmQtOS4xOC4xMy8wMDAxLWF2b2lkLXN0YXJ0LWZhaWx1cmUtd2l0
aC1iaW5kLXVzZXIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC05
LjE4LjE0LzAwMDEtYXZvaWQtc3RhcnQtZmFpbHVyZS13aXRoLWJpbmQtdXNlci5wYXRjaApzaW1p
bGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9i
aW5kL2JpbmQtOS4xOC4xMy8wMDAxLWF2b2lkLXN0YXJ0LWZhaWx1cmUtd2l0aC1iaW5kLXVzZXIu
cGF0Y2gKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLTkuMTgu
MTQvMDAwMS1hdm9pZC1zdGFydC1mYWlsdXJlLXdpdGgtYmluZC11c2VyLnBhdGNoCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC05LjE4LjEzLzAwMDEtbmFt
ZWQtbHdyZXNkLVYtYW5kLXN0YXJ0LWxvZy1oaWRlLWJ1aWxkLW9wdGlvbnMucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC05LjE4LjE0LzAwMDEtbmFtZWQtbHdyZXNk
LVYtYW5kLXN0YXJ0LWxvZy1oaWRlLWJ1aWxkLW9wdGlvbnMucGF0Y2gKc2ltaWxhcml0eSBpbmRl
eCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLTku
MTguMTMvMDAwMS1uYW1lZC1sd3Jlc2QtVi1hbmQtc3RhcnQtbG9nLWhpZGUtYnVpbGQtb3B0aW9u
cy5wYXRjaApyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQtOS4x
OC4xNC8wMDAxLW5hbWVkLWx3cmVzZC1WLWFuZC1zdGFydC1sb2ctaGlkZS1idWlsZC1vcHRpb25z
LnBhdGNoCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC05
LjE4LjEzL2JpbmQtZW5zdXJlLXNlYXJjaGluZy1mb3ItanNvbi1oZWFkZXJzLXNlYXJjaGVzLXN5
c3IucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC05LjE4LjE0L2Jp
bmQtZW5zdXJlLXNlYXJjaGluZy1mb3ItanNvbi1oZWFkZXJzLXNlYXJjaGVzLXN5c3IucGF0Y2gK
c2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZp
dHkvYmluZC9iaW5kLTkuMTguMTMvYmluZC1lbnN1cmUtc2VhcmNoaW5nLWZvci1qc29uLWhlYWRl
cnMtc2VhcmNoZXMtc3lzci5wYXRjaApyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9iaW5kL2JpbmQtOS4xOC4xNC9iaW5kLWVuc3VyZS1zZWFyY2hpbmctZm9yLWpzb24taGVhZGVy
cy1zZWFyY2hlcy1zeXNyLnBhdGNoCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2
aXR5L2JpbmQvYmluZC05LjE4LjEzL2JpbmQ5IGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9i
aW5kL2JpbmQtOS4xOC4xNC9iaW5kOQpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20g
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQtOS4xOC4xMy9iaW5kOQpyZW5hbWUg
dG8gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQtOS4xOC4xNC9iaW5kOQpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQtOS4xOC4xMy9jb25m
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQtOS4xOC4xNC9jb25m
LnBhdGNoCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L2JpbmQvYmluZC05LjE4LjEzL2NvbmYucGF0Y2gKcmVuYW1lIHRvIG1ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLTkuMTguMTQvY29uZi5wYXRjaApkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQtOS4xOC4xMy9nZW5lcmF0ZS1y
bmRjLWtleS5zaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLTkuMTguMTQv
Z2VuZXJhdGUtcm5kYy1rZXkuc2gKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLTkuMTguMTMvZ2VuZXJhdGUtcm5kYy1r
ZXkuc2gKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLTkuMTgu
MTQvZ2VuZXJhdGUtcm5kYy1rZXkuc2gKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0
aXZpdHkvYmluZC9iaW5kLTkuMTguMTMvaW5pdC5kLWFkZC1zdXBwb3J0LWZvci1yZWFkLW9ubHkt
cm9vdGZzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQtOS4xOC4x
NC9pbml0LmQtYWRkLXN1cHBvcnQtZm9yLXJlYWQtb25seS1yb290ZnMucGF0Y2gKc2ltaWxhcml0
eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9i
aW5kLTkuMTguMTMvaW5pdC5kLWFkZC1zdXBwb3J0LWZvci1yZWFkLW9ubHktcm9vdGZzLnBhdGNo
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC05LjE4LjE0L2lu
aXQuZC1hZGQtc3VwcG9ydC1mb3ItcmVhZC1vbmx5LXJvb3Rmcy5wYXRjaApkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQtOS4xOC4xMy9tYWtlLWV0Yy1pbml0
ZC1iaW5kLXN0b3Atd29yay5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9i
aW5kLTkuMTguMTQvbWFrZS1ldGMtaW5pdGQtYmluZC1zdG9wLXdvcmsucGF0Y2gKc2ltaWxhcml0
eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9i
aW5kLTkuMTguMTMvbWFrZS1ldGMtaW5pdGQtYmluZC1zdG9wLXdvcmsucGF0Y2gKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLTkuMTguMTQvbWFrZS1ldGMtaW5p
dGQtYmluZC1zdG9wLXdvcmsucGF0Y2gKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0
aXZpdHkvYmluZC9iaW5kLTkuMTguMTMvbmFtZWQuc2VydmljZSBiL21ldGEvcmVjaXBlcy1jb25u
ZWN0aXZpdHkvYmluZC9iaW5kLTkuMTguMTQvbmFtZWQuc2VydmljZQpzaW1pbGFyaXR5IGluZGV4
IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQtOS4x
OC4xMy9uYW1lZC5zZXJ2aWNlCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2Jp
bmQvYmluZC05LjE4LjE0L25hbWVkLnNlcnZpY2UKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1j
b25uZWN0aXZpdHkvYmluZC9iaW5kXzkuMTguMTMuYmIgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2
aXR5L2JpbmQvYmluZF85LjE4LjE0LmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9t
IG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kXzkuMTguMTMuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kXzkuMTguMTQuYmIKaW5kZXggODYx
NzEzN2U4Ny4uYzUxM2NiYzhiNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9iaW5kL2JpbmRfOS4xOC4xMy5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2Jp
bmQvYmluZF85LjE4LjE0LmJiCkBAIC0yMCw3ICsyMCw3IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly9m
dHAuaXNjLm9yZy9pc2MvYmluZDkvJHtQVn0vJHtCUE59LSR7UFZ9LnRhci54eiBcCiAgICAgICAg
ICAgIGZpbGU6Ly8wMDAxLWF2b2lkLXN0YXJ0LWZhaWx1cmUtd2l0aC1iaW5kLXVzZXIucGF0Y2gg
XAogICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIzYjA2YjYzOTBjMTAxMmRk
Mzk1NmIxNDc5YzczYjIwOTdjMGIyMjIwNzgxN2UyZThhYWUzNTJmZDIwZTU3OGM3IgorU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjlhZTEyZWRmNmFjM2M0MzBiMzNlY2QxYTdjMGMwYzYwODc1ZDI1NTE4
NWViODc4NTBmYTlhNWU3OTRhNjRhMDkiCiAKIFVQU1RSRUFNX0NIRUNLX1VSSSA9ICJodHRwczov
L2Z0cC5pc2Mub3JnL2lzYy9iaW5kOS8iCiAjIGZvbGxvdyB0aGUgRVNWIHZlcnNpb25zIGRpdmlz
aWJsZSBieSAyCi0tIAoyLjM5LjIKCg==

--===============2056415916975538284==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/bind/bind-dbg: FILELIST: removed "/usr/lib/.debug/libns-9.18.13.so /usr/lib/.debug/libisccfg-9.18.13.so /usr/lib/.debug/libisc-9.18.13.so /usr/lib/.debug/libirs-9.18.13.so /usr/lib/.debug/libdns-9.18.13.so /usr/lib/.debug/libbind9-9.18.13.so /usr/lib/.debug/libisccc-9.18.13.so", added "/usr/lib/.debug/libisc-9.18.14.so /usr/lib/.debug/libirs-9.18.14.so /usr/lib/.debug/libdns-9.18.14.so /usr/lib/.debug/libbind9-9.18.14.so /usr/lib/.debug/libisccc-9.18.14.so /usr/lib/.debug/libns-9.18.14.so /usr/lib/.debug/libisccfg-9.18.14.so"
packages/core2-32-poky-linux/bind/bind-dbg: PKGV changed from 9.18.13 [default] to 9.18.14 [default]
packages/core2-32-poky-linux/bind/bind-dbg: PKGSIZE changed from 10889752 to 10887156 (-0%)
packages/core2-32-poky-linux/bind/bind-dbg: PV changed from "9.18.13" to "9.18.14"
packages/core2-32-poky-linux/bind/bind-dev: FILELIST: removed "/usr/include/isc/fsaccess.h"
packages/core2-32-poky-linux/bind/bind-dev: PKGV changed from 9.18.13 [default] to 9.18.14 [default]
packages/core2-32-poky-linux/bind/bind-dev: PKGSIZE changed from 1462835 to 1456196 (-0%)
packages/core2-32-poky-linux/bind/bind-dev: PV changed from "9.18.13" to "9.18.14"
packages/core2-32-poky-linux/bind/bind-doc: PKGV changed from 9.18.13 [default] to 9.18.14 [default]
packages/core2-32-poky-linux/bind/bind-doc: PV changed from "9.18.13" to "9.18.14"
packages/core2-32-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libirs-9.18.13.so /usr/lib/libbind9-9.18.13.so /usr/lib/libdns-9.18.13.so /usr/lib/libns-9.18.13.so /usr/lib/libisccfg-9.18.13.so /usr/lib/libisccc-9.18.13.so /usr/lib/libisc-9.18.13.so", added "/usr/lib/libdns-9.18.14.so /usr/lib/libisc-9.18.14.so /usr/lib/libisccfg-9.18.14.so /usr/lib/libns-9.18.14.so /usr/lib/libbind9-9.18.14.so /usr/lib/libisccc-9.18.14.so /usr/lib/libirs-9.18.14.so"
packages/core2-32-poky-linux/bind/bind-libs: PKGV changed from 9.18.13 [default] to 9.18.14 [default]
packages/core2-32-poky-linux/bind/bind-libs: FILES: removed "/usr/lib/*-9.18.13.so", added "/usr/lib/*-9.18.14.so"
packages/core2-32-poky-linux/bind/bind-libs: PV changed from "9.18.13" to "9.18.14"
packages/core2-32-poky-linux/bind/bind-locale: PKGV changed from 9.18.13 [default] to 9.18.14 [default]
packages/core2-32-poky-linux/bind/bind-locale: PV changed from "9.18.13" to "9.18.14"
packages/core2-32-poky-linux/bind/bind-src: FILELIST: directory renamed /usr/src/debug/bind/9.18.13-r0/bin/dnssec -> /usr/src/debug/bind/9.18.14-r0/bin/dnssec, directory renamed /usr/src/debug/bind/9.18.13-r0/lib/isccfg/include/isccfg -> /usr/src/debug/bind/9.18.14-r0/lib/isccfg/include/isccfg, directory renamed /usr/src/debug/bind/9.18.13-r0/lib/isccfg -> /usr/src/debug/bind/9.18.14-r0/lib/isccfg, directory renamed /usr/src/debug/bind/9.18.13-r0/lib/ns/include/ns -> /usr/src/debug/bind/9.18.14-r0/lib/ns/include/ns, directory renamed /usr/src/debug/bind/9.18.13-r0/bin/rndc -> /usr/src/debug/bind/9.18.14-r0/bin/rndc, directory renamed /usr/src/debug/bind/9.18.13-r0/bin/confgen/include/confgen -> /usr/src/debug/bind/9.18.14-r0/bin/confgen/include/confgen, directory renamed /usr/src/debug/bind/9.18.13-r0/lib/dns/include/dns -> /usr/src/debug/bind/9.18.14-r0/lib/dns/include/dns, directory renamed /usr/src/debug/bind/9.18.13-r0/lib/dns/include/dst -> /usr/src/debug/bind/9.18.14-r0/lib/dns
 /include/dst, directory renamed /usr/src/debug/bind/9.18.13-r0/lib/isc/netmgr -> /usr/src/debug/bind/9.18.14-r0/lib/isc/netmgr, directory renamed /usr/src/debug/bind/9.18.13-r0/bin/named/include/named -> /usr/src/debug/bind/9.18.14-r0/bin/named/include/named, directory renamed /usr/src/debug/bind/9.18.13-r0/lib/dns -> /usr/src/debug/bind/9.18.14-r0/lib/dns, directory renamed /usr/src/debug/bind/9.18.13-r0/lib/dns/rdata/any_255 -> /usr/src/debug/bind/9.18.14-r0/lib/dns/rdata/any_255, directory renamed /usr/src/debug/bind/9.18.13-r0/bin/check -> /usr/src/debug/bind/9.18.14-r0/bin/check, directory renamed /usr/src/debug/bind/9.18.13-r0/bin/dig -> /usr/src/debug/bind/9.18.14-r0/bin/dig, directory renamed /usr/src/debug/bind/9.18.13-r0/bin/plugins -> /usr/src/debug/bind/9.18.14-r0/bin/plugins, directory renamed /usr/src/debug/bind/9.18.13-r0/lib/isccc -> /usr/src/debug/bind/9.18.14-r0/lib/isccc, directory renamed /usr/src/debug/bind/9.18.13-r0/lib/dns/rdata/generic -> /usr/src/debug/bind
 /9.18.14-r0/lib/dns/rdata/generic, directory renamed /usr/src/debug/bind/9.18.13-r0/lib/dns/rdata/hs_4 -> /usr/src/debug/bind/9.18.14-r0/lib/dns/rdata/hs_4, directory renamed /usr/src/debug/bind/9.18.13-r0/bin/tools -> /usr/src/debug/bind/9.18.14-r0/bin/tools, directory renamed /usr/src/debug/bind/9.18.13-r0/lib/irs -> /usr/src/debug/bind/9.18.14-r0/lib/irs, directory renamed /usr/src/debug/bind/9.18.13-r0/lib/dns/rdata/in_1 -> /usr/src/debug/bind/9.18.14-r0/lib/dns/rdata/in_1, directory renamed /usr/src/debug/bind/9.18.13-r0/lib/dns/rdata/ch_3 -> /usr/src/debug/bind/9.18.14-r0/lib/dns/rdata/ch_3, directory renamed /usr/src/debug/bind/9.18.13-r0/lib/isccc/include/isccc -> /usr/src/debug/bind/9.18.14-r0/lib/isccc/include/isccc, directory renamed /usr/src/debug/bind/9.18.13-r0/bin/confgen -> /usr/src/debug/bind/9.18.14-r0/bin/confgen, directory renamed /usr/src/debug/bind/9.18.13-r0/bin/nsupdate -> /usr/src/debug/bind/9.18.14-r0/bin/nsupdate, directory renamed /usr/src/debug/bind/9.18
 .13-r0/lib/irs/include/irs -> /usr/src/debug/bind/9.18.14-r0/lib/irs/include/irs, directory renamed /usr/src/debug/bind/9.18.13-r0/lib/bind9 -> /usr/src/debug/bind/9.18.14-r0/lib/bind9, directory renamed /usr/src/debug/bind/9.18.13-r0/bin/named/include/dlz -> /usr/src/debug/bind/9.18.14-r0/bin/named/include/dlz, directory renamed /usr/src/debug/bind/9.18.13-r0/lib/ns -> /usr/src/debug/bind/9.18.14-r0/lib/ns, directory renamed /usr/src/debug/bind/9.18.13-r0/bin/named -> /usr/src/debug/bind/9.18.14-r0/bin/named, directory renamed /usr/src/debug/bind/9.18.13-r0/bin/delv -> /usr/src/debug/bind/9.18.14-r0/bin/delv, directory renamed /usr/src/debug/bind/9.18.13-r0/lib/bind9/include/bind9 -> /usr/src/debug/bind/9.18.14-r0/lib/bind9/include/bind9, removed "/usr/src/debug/bind/9.18.13-r0/lib/isc/file.c /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/serial.h /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/ht.h /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/mutexblock.h /usr/src/deb
 ug/bind/9.18.13-r0/lib/isc/include/isc/aes.h /usr/src/debug/bind/9.18.13-r0/lib/isc/portset.c /usr/src/debug/bind/9.18.13-r0/lib/isc/result.c /usr/src/debug/bind/9.18.13-r0/lib/isc/ratelimiter.c /usr/src/debug/bind/9.18.13-r0/lib/isc/log.c /usr/src/debug/bind/9.18.13-r0/lib/isc/trampoline.c /usr/src/debug/bind/9.18.13-r0/lib/isc/pool.c /usr/src/debug/bind/9.18.13-r0/lib/isc/task.c /usr/src/debug/bind/9.18.13-r0/lib/isc/lib.c /usr/src/debug/bind/9.18.13-r0/lib/isc/fsaccess.c /usr/src/debug/bind/9.18.13-r0/lib/isc/fsaccess_common.c /usr/src/debug/bind/9.18.13-r0/lib/isc/quota.c /usr/src/debug/bind/9.18.13-r0/lib/isc/stats.c /usr/src/debug/bind/9.18.13-r0/lib/isc/symtab.c /usr/src/debug/bind/9.18.13-r0/lib/isc/time.c /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/symtab.h /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/tm.h /usr/src/debug/bind/9.18.13-r0/lib/isc/string.c /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/lex.h /usr/src/debug/bind/9.18.13-r0/lib/isc/mem.c /usr/sr
 c/debug/bind/9.18.13-r0/lib/isc/netaddr.c /usr/src/debug/bind/9.18.13-r0/lib/isc/syslog.c /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/interfaceiter.h /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/counter.h /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/region.h /usr/src/debug/bind/9.18.13-r0/lib/isc/utf8.c /usr/src/debug/bind/9.18.13-r0/lib/isc/backtrace.c /usr/src/debug/bind/9.18.13-r0/lib/isc/crc64.c /usr/src/debug/bind/9.18.13-r0/lib/isc/timer_p.h /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/portset.h /usr/src/debug/bind/9.18.13-r0/lib/isc/md.c /usr/src/debug/bind/9.18.13-r0/lib/isc/entropy_private.h /usr/src/debug/bind/9.18.13-r0/lib/isc/base32.c /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/iterated_hash.h /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/netscope.h /usr/src/debug/bind/9.18.13-r0/lib/isc/random.c /usr/src/debug/bind/9.18.13-r0/lib/isc/siphash.c /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/file.h /usr/src/debug/bind/9.18.13-r0/l
 ib/isc/include/isc/fuzz.h /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/glob.h /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/hash.h /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/heap.h /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/hmac.h /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/once.h /usr/src/debug/bind/9.18.13-r0/lib/isc/meminfo.c /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/safe.h /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/task.h /usr/src/debug/bind/9.18.13-r0/lib/isc/assertions.c /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/stdtime.h /usr/src/debug/bind/9.18.13-r0/lib/isc/thread.c /usr/src/debug/bind/9.18.13-r0/lib/isc/hmac.c /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/net.h /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/string.h /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/mem.h /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/syslog.h /usr/src/debug/bind/9.18.13-r0/lib/isc/picohttpparser.h /usr/src/debug/bind
 /9.18.13-r0/lib/isc/stdtime.c /usr/src/debug/bind/9.18.13-r0/lib/isc/jemalloc_shim.h /usr/src/debug/bind/9.18.13-r0/lib/isc/picohttpparser.c /usr/src/debug/bind/9.18.13-r0/lib/isc/safe.c /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/refcount.h /usr/src/debug/bind/9.18.13-r0/lib/isc/dir.c /usr/src/debug/bind/9.18.13-r0/lib/isc/stdio.c /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/log.h /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/tls.h /usr/src/debug/bind/9.18.13-r0/lib/isc/glob.c /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/pool.h /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/time.h /usr/src/debug/bind/9.18.13-r0/lib/isc/httpd.c /usr/src/debug/bind/9.18.13-r0/lib/isc/task_p.h /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/parseint.h /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/taskpool.h /usr/src/debug/bind/9.18.13-r0/lib/isc/resource.c /usr/src/debug/bind/9.18.13-r0/lib/isc/managers.c /usr/src/debug/bind/9.18.13-r0/lib/isc/parseint.c /usr/src/de
 bug/bind/9.18.13-r0/lib/isc/app.c /usr/src/debug/bind/9.18.13-r0/lib/isc/hex.c /usr/src/debug/bind/9.18.13-r0/lib/isc/lex.c /usr/src/debug/bind/9.18.13-r0/lib/isc/ht.c /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/offset.h /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/result.h /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/commandline.h /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/errno.h /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/app.h /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/quota.h /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/radix.h /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/regex.h /usr/src/debug/bind/9.18.13-r0/lib/isc/os_p.h /usr/src/debug/bind/9.18.13-r0/lib/isc/region.c /usr/src/debug/bind/9.18.13-r0/lib/isc/tls.c /usr/src/debug/bind/9.18.13-r0/lib/isc/error.c /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/thread.h /usr/src/debug/bind/9.18.13-r0/lib/isc/errno.c /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/manager
 s.h /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/condition.h /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/sockaddr.h /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/backtrace.h /usr/src/debug/bind/9.18.13-r0/lib/isc/serial.c /usr/src/debug/bind/9.18.13-r0/lib/isc/fsaccess_common_p.h /usr/src/debug/bind/9.18.13-r0/lib/isc/iterated_hash.c /usr/src/debug/bind/9.18.13-r0/lib/isc/aes.c /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/md.h /usr/src/debug/bind/9.18.13-r0/lib/isc/tm.c /usr/src/debug/bind/9.18.13-r0/lib/isc/condition.c /usr/src/debug/bind/9.18.13-r0/lib/isc/sockaddr.c /usr/src/debug/bind/9.18.13-r0/lib/isc/url.c /usr/src/debug/bind/9.18.13-r0/lib/isc/commandline.c /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/os.h /usr/src/debug/bind/9.18.13-r0/lib/isc/buffer.c /usr/src/debug/bind/9.18.13-r0/lib/isc/nonce.c /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/stats.h /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/stdio.h /usr/src/debug/bind/9.18.13-r0
 /lib/isc/include/isc/timer.h /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/types.h /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/nonce.h /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/error.h /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/event.h /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/httpd.h /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/magic.h /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/mutex.h /usr/src/debug/bind/9.18.13-r0/lib/isc/tls_p.h /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/random.h /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/base32.h /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/ratelimiter.h /usr/src/debug/bind/9.18.13-r0/lib/isc/os.c /usr/src/debug/bind/9.18.13-r0/lib/isc/mutex.c /usr/src/debug/bind/9.18.13-r0/lib/isc/timer.c /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/astack.h /usr/src/debug/bind/9.18.13-r0/lib/isc/event.c /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/rwlock.h /usr/src/debug/bin
 d/9.18.13-r0/lib/isc/heap.c /usr/src/debug/bind/9.18.13-r0/lib/isc/rwlock.c /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/assertions.h /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/netaddr.h /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/dir.h /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/base64.h /usr/src/debug/bind/9.18.13-r0/lib/isc/errno2result.c /usr/src/debug/bind/9.18.13-r0/lib/isc/interfaceiter.c /usr/src/debug/bind/9.18.13-r0/lib/isc/astack.c /usr/src/debug/bind/9.18.13-r0/lib/isc/errno2result.h /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/meminfo.h /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/url.h /usr/src/debug/bind/9.18.13-r0/lib/isc/net.c /usr/src/debug/bind/9.18.13-r0/lib/isc/radix.c /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/buffer.h /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/netmgr.h /usr/src/debug/bind/9.18.13-r0/lib/isc/base64.c /usr/src/debug/bind/9.18.13-r0/lib/isc/entropy.c /usr/src/debug/bind/9.18.13-r0/lib/isc/ne
 tmgr_p.h /usr/src/debug/bind/9.18.13-r0/lib/isc/mutexblock.c /usr/src/debug/bind/9.18.13-r0/lib/isc/netscope.c /usr/src/debug/bind/9.18.13-r0/lib/isc/mem_p.h /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/fsaccess.h /usr/src/debug/bind/9.18.13-r0/lib/isc/trampoline_p.h /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/siphash.h /usr/src/debug/bind/9.18.13-r0/lib/isc/taskpool.c /usr/src/debug/bind/9.18.13-r0/lib/isc/counter.c /usr/src/debug/bind/9.18.13-r0/lib/isc/hash.c /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/resource.h /usr/src/debug/bind/9.18.13-r0/lib/isc/regex.c /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/hex.h /usr/src/debug/bind/9.18.13-r0/lib/isc/include/isc/utf8.h", added "/usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/once.h /usr/src/debug/bind/9.18.14-r0/lib/isc/file.c /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/time.h /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/serial.h /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/ht.h /usr/s
 rc/debug/bind/9.18.14-r0/lib/isc/include/isc/mutexblock.h /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/aes.h /usr/src/debug/bind/9.18.14-r0/lib/isc/portset.c /usr/src/debug/bind/9.18.14-r0/lib/isc/result.c /usr/src/debug/bind/9.18.14-r0/lib/isc/ratelimiter.c /usr/src/debug/bind/9.18.14-r0/lib/isc/log.c /usr/src/debug/bind/9.18.14-r0/lib/isc/trampoline.c /usr/src/debug/bind/9.18.14-r0/lib/isc/pool.c /usr/src/debug/bind/9.18.14-r0/lib/isc/task.c /usr/src/debug/bind/9.18.14-r0/lib/isc/lib.c /usr/src/debug/bind/9.18.14-r0/lib/isc/quota.c /usr/src/debug/bind/9.18.14-r0/lib/isc/stats.c /usr/src/debug/bind/9.18.14-r0/lib/isc/symtab.c /usr/src/debug/bind/9.18.14-r0/lib/isc/time.c /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/symtab.h /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/tm.h /usr/src/debug/bind/9.18.14-r0/lib/isc/string.c /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/lex.h /usr/src/debug/bind/9.18.14-r0/lib/isc/mem.c /usr/src/debug/bind/9.18.14-r0/lib/isc/netad
 dr.c /usr/src/debug/bind/9.18.14-r0/lib/isc/syslog.c /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/interfaceiter.h /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/counter.h /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/region.h /usr/src/debug/bind/9.18.14-r0/lib/isc/utf8.c /usr/src/debug/bind/9.18.14-r0/lib/isc/backtrace.c /usr/src/debug/bind/9.18.14-r0/lib/isc/crc64.c /usr/src/debug/bind/9.18.14-r0/lib/isc/timer_p.h /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/portset.h /usr/src/debug/bind/9.18.14-r0/lib/isc/md.c /usr/src/debug/bind/9.18.14-r0/lib/isc/entropy_private.h /usr/src/debug/bind/9.18.14-r0/lib/isc/base32.c /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/iterated_hash.h /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/netscope.h /usr/src/debug/bind/9.18.14-r0/lib/isc/random.c /usr/src/debug/bind/9.18.14-r0/lib/isc/siphash.c /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/pool.h /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/safe.h /usr/src/de
 bug/bind/9.18.14-r0/lib/isc/include/isc/utf8.h /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/file.h /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/fuzz.h /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/glob.h /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/hash.h /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/heap.h /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/hmac.h /usr/src/debug/bind/9.18.14-r0/lib/isc/meminfo.c /usr/src/debug/bind/9.18.14-r0/lib/isc/assertions.c /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/stdtime.h /usr/src/debug/bind/9.18.14-r0/lib/isc/thread.c /usr/src/debug/bind/9.18.14-r0/lib/isc/hmac.c /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/net.h /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/string.h /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/mem.h /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/syslog.h /usr/src/debug/bind/9.18.14-r0/lib/isc/picohttpparser.h /usr/src/debug/bind/9.18.14-r0/lib/isc/stdtime.c /usr/sr
 c/debug/bind/9.18.14-r0/lib/isc/jemalloc_shim.h /usr/src/debug/bind/9.18.14-r0/lib/isc/picohttpparser.c /usr/src/debug/bind/9.18.14-r0/lib/isc/safe.c /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/refcount.h /usr/src/debug/bind/9.18.14-r0/lib/isc/dir.c /usr/src/debug/bind/9.18.14-r0/lib/isc/stdio.c /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/log.h /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/tls.h /usr/src/debug/bind/9.18.14-r0/lib/isc/glob.c /usr/src/debug/bind/9.18.14-r0/lib/isc/httpd.c /usr/src/debug/bind/9.18.14-r0/lib/isc/task_p.h /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/parseint.h /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/taskpool.h /usr/src/debug/bind/9.18.14-r0/lib/isc/resource.c /usr/src/debug/bind/9.18.14-r0/lib/isc/managers.c /usr/src/debug/bind/9.18.14-r0/lib/isc/parseint.c /usr/src/debug/bind/9.18.14-r0/lib/isc/app.c /usr/src/debug/bind/9.18.14-r0/lib/isc/hex.c /usr/src/debug/bind/9.18.14-r0/lib/isc/lex.c /usr/src/debug/bind/9.18.14-r
 0/lib/isc/ht.c /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/offset.h /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/result.h /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/commandline.h /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/quota.h /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/app.h /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/radix.h /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/errno.h /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/regex.h /usr/src/debug/bind/9.18.14-r0/lib/isc/os_p.h /usr/src/debug/bind/9.18.14-r0/lib/isc/region.c /usr/src/debug/bind/9.18.14-r0/lib/isc/tls.c /usr/src/debug/bind/9.18.14-r0/lib/isc/error.c /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/thread.h /usr/src/debug/bind/9.18.14-r0/lib/isc/errno.c /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/managers.h /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/condition.h /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/sockaddr.h /usr/src/debug/bind/9.18
 .14-r0/lib/isc/include/isc/backtrace.h /usr/src/debug/bind/9.18.14-r0/lib/isc/serial.c /usr/src/debug/bind/9.18.14-r0/lib/isc/iterated_hash.c /usr/src/debug/bind/9.18.14-r0/lib/isc/aes.c /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/md.h /usr/src/debug/bind/9.18.14-r0/lib/isc/tm.c /usr/src/debug/bind/9.18.14-r0/lib/isc/condition.c /usr/src/debug/bind/9.18.14-r0/lib/isc/sockaddr.c /usr/src/debug/bind/9.18.14-r0/lib/isc/url.c /usr/src/debug/bind/9.18.14-r0/lib/isc/commandline.c /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/os.h /usr/src/debug/bind/9.18.14-r0/lib/isc/buffer.c /usr/src/debug/bind/9.18.14-r0/lib/isc/nonce.c /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/stats.h /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/stdio.h /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/timer.h /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/types.h /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/error.h /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/event.h /usr/s
 rc/debug/bind/9.18.14-r0/lib/isc/include/isc/httpd.h /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/magic.h /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/mutex.h /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/nonce.h /usr/src/debug/bind/9.18.14-r0/lib/isc/tls_p.h /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/random.h /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/base32.h /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/ratelimiter.h /usr/src/debug/bind/9.18.14-r0/lib/isc/os.c /usr/src/debug/bind/9.18.14-r0/lib/isc/mutex.c /usr/src/debug/bind/9.18.14-r0/lib/isc/timer.c /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/astack.h /usr/src/debug/bind/9.18.14-r0/lib/isc/event.c /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/rwlock.h /usr/src/debug/bind/9.18.14-r0/lib/isc/heap.c /usr/src/debug/bind/9.18.14-r0/lib/isc/rwlock.c /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/assertions.h /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/netaddr.h /usr/src/de
 bug/bind/9.18.14-r0/lib/isc/include/isc/dir.h /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/base64.h /usr/src/debug/bind/9.18.14-r0/lib/isc/errno2result.c /usr/src/debug/bind/9.18.14-r0/lib/isc/interfaceiter.c /usr/src/debug/bind/9.18.14-r0/lib/isc/astack.c /usr/src/debug/bind/9.18.14-r0/lib/isc/errno2result.h /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/meminfo.h /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/url.h /usr/src/debug/bind/9.18.14-r0/lib/isc/net.c /usr/src/debug/bind/9.18.14-r0/lib/isc/radix.c /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/buffer.h /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/netmgr.h /usr/src/debug/bind/9.18.14-r0/lib/isc/base64.c /usr/src/debug/bind/9.18.14-r0/lib/isc/entropy.c /usr/src/debug/bind/9.18.14-r0/lib/isc/netmgr_p.h /usr/src/debug/bind/9.18.14-r0/lib/isc/mutexblock.c /usr/src/debug/bind/9.18.14-r0/lib/isc/netscope.c /usr/src/debug/bind/9.18.14-r0/lib/isc/mem_p.h /usr/src/debug/bind/9.18.14-r0/lib/isc/trampoline_p.h 
 /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/siphash.h /usr/src/debug/bind/9.18.14-r0/lib/isc/taskpool.c /usr/src/debug/bind/9.18.14-r0/lib/isc/counter.c /usr/src/debug/bind/9.18.14-r0/lib/isc/hash.c /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/resource.h /usr/src/debug/bind/9.18.14-r0/lib/isc/regex.c /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/hex.h /usr/src/debug/bind/9.18.14-r0/lib/isc/include/isc/task.h"
packages/core2-32-poky-linux/bind/bind-src: PKGV changed from 9.18.13 [default] to 9.18.14 [default]
packages/core2-32-poky-linux/bind/bind-src: PKGSIZE changed from 9592377 to 9587056 (-0%)
packages/core2-32-poky-linux/bind/bind-src: PV changed from "9.18.13" to "9.18.14"
packages/core2-32-poky-linux/bind/bind-staticdev: PKGV changed from 9.18.13 [default] to 9.18.14 [default]
packages/core2-32-poky-linux/bind/bind-staticdev: PV changed from "9.18.13" to "9.18.14"
packages/core2-32-poky-linux/bind/bind-utils: PKGV changed from 9.18.13 [default] to 9.18.14 [default]
packages/core2-32-poky-linux/bind/bind-utils: PV changed from "9.18.13" to "9.18.14"
packages/core2-32-poky-linux/bind/bind: PKGV changed from 9.18.13 [default] to 9.18.14 [default]
packages/core2-32-poky-linux/bind/bind: PV changed from "9.18.13" to "9.18.14"
packages/core2-32-poky-linux/bind: SRC_URI changed from "https://ftp.isc.org/isc/bind9/9.18.13/bind-9.18.13.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch" to "https://ftp.isc.org/isc/bind9/9.18.14/bind-9.18.14.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch"
packages/core2-32-poky-linux/bind: PKGV changed from 9.18.13 [default] to 9.18.14 [default]
packages/core2-32-poky-linux/bind: PV changed from "9.18.13" to "9.18.14"
Changes to packages/core2-32-poky-linux/bind (sysroot):
  /usr/lib/libbind9.so changed symlink target from libbind9-9.18.13.so to libbind9-9.18.14.so
  /usr/lib/libdns.so changed symlink target from libdns-9.18.13.so to libdns-9.18.14.so
  /usr/lib/libirs.so changed symlink target from libirs-9.18.13.so to libirs-9.18.14.so
  /usr/lib/libisccc.so changed symlink target from libisccc-9.18.13.so to libisccc-9.18.14.so
  /usr/lib/libisccfg.so changed symlink target from libisccfg-9.18.13.so to libisccfg-9.18.14.so
  /usr/lib/libisc.so changed symlink target from libisc-9.18.13.so to libisc-9.18.14.so
  /usr/lib/libns.so changed symlink target from libns-9.18.13.so to libns-9.18.14.so
  /usr/lib/libbind9-9.18.13.so moved to /usr/lib/libbind9-9.18.14.so
  /usr/lib/libdns-9.18.13.so moved to /usr/lib/libdns-9.18.14.so
  /usr/lib/libirs-9.18.13.so moved to /usr/lib/libirs-9.18.14.so
  /usr/lib/libisc-9.18.13.so moved to /usr/lib/libisc-9.18.14.so
  /usr/lib/libisccc-9.18.13.so moved to /usr/lib/libisccc-9.18.14.so
  /usr/lib/libisccfg-9.18.13.so moved to /usr/lib/libisccfg-9.18.14.so
  /usr/lib/libns-9.18.13.so moved to /usr/lib/libns-9.18.14.so
  /usr/include/isc/fsaccess.h was removed

--===============2056415916975538284==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/bind/bind-dev: FILELIST: removed "/usr/include/isc/fsaccess.h"
packages/core2-32-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libisccfg-9.18.13.so /usr/lib/libisccc-9.18.13.so /usr/lib/libbind9-9.18.13.so /usr/lib/libdns-9.18.13.so /usr/lib/libirs-9.18.13.so /usr/lib/libisc-9.18.13.so /usr/lib/libns-9.18.13.so", added "/usr/lib/libbind9-9.18.14.so /usr/lib/libisc-9.18.14.so /usr/lib/libdns-9.18.14.so /usr/lib/libisccc-9.18.14.so /usr/lib/libisccfg-9.18.14.so /usr/lib/libirs-9.18.14.so /usr/lib/libns-9.18.14.so"
Changes to packages/core2-32-poky-linux/bind (sysroot):
  /usr/lib/libbind9.so changed symlink target from libbind9-9.18.13.so to libbind9-9.18.14.so
  /usr/lib/libdns.so changed symlink target from libdns-9.18.13.so to libdns-9.18.14.so
  /usr/lib/libirs.so changed symlink target from libirs-9.18.13.so to libirs-9.18.14.so
  /usr/lib/libisccc.so changed symlink target from libisccc-9.18.13.so to libisccc-9.18.14.so
  /usr/lib/libisccfg.so changed symlink target from libisccfg-9.18.13.so to libisccfg-9.18.14.so
  /usr/lib/libisc.so changed symlink target from libisc-9.18.13.so to libisc-9.18.14.so
  /usr/lib/libns.so changed symlink target from libns-9.18.13.so to libns-9.18.14.so
  /usr/lib/libbind9-9.18.13.so moved to /usr/lib/libbind9-9.18.14.so
  /usr/lib/libdns-9.18.13.so moved to /usr/lib/libdns-9.18.14.so
  /usr/lib/libirs-9.18.13.so moved to /usr/lib/libirs-9.18.14.so
  /usr/lib/libisc-9.18.13.so moved to /usr/lib/libisc-9.18.14.so
  /usr/lib/libisccc-9.18.13.so moved to /usr/lib/libisccc-9.18.14.so
  /usr/lib/libisccfg-9.18.13.so moved to /usr/lib/libisccfg-9.18.14.so
  /usr/lib/libns-9.18.13.so moved to /usr/lib/libns-9.18.14.so
  /usr/include/isc/fsaccess.h was removed

--===============2056415916975538284==--

