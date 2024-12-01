Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B397D49788
	for <webhook@archiver.kernel.org>; Sun,  1 Dec 2024 10:06:21 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.149812.1733047567127021579
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Dec 2024 02:06:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Yp4C3seJ;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=C+cQYuTw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019381af51d1-13597ccd-f4c0-4956-a893-dc904abf0eb5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1733047571;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=07RW87PpUd4uIvzVe6gD4U0DLinSiCJsNOFQXsgUuPs=;
	b=Yp4C3seJrvNYkVFoAsvzffnMjegJQjFRchrt8/LAHbdkTgBYBbCyvzOVJeoGX1Qv
	rjmd02JSPNtoyI1dixiJ2gLzvAtaQzToidsw0SlMn6aspMbi9+bYXKzR7vBLUj11Tfu
	Eul1XTSaUAWwOlF5n9mmk6KjhZlS453ERaMUUWJg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1733047571;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=07RW87PpUd4uIvzVe6gD4U0DLinSiCJsNOFQXsgUuPs=;
	b=C+cQYuTwHZTaKAh4iJWbmEATU/Q2Johog6LhbNb+1UQFITWfUPTbpGI7d7+xfinw
	vVghanYLsMcb7ZAX4gX51rmgFwMwYkCv0RM6jS0Ctt9k0fxPvWNfz9j8+7Dxt5KrEpA
	N4lPlLOgHOaNxyqom0c3qU3BGqj3aXdmQ4kVoZVk=
Content-Type: multipart/mixed; boundary="===============0085569250991295487=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vte: upgrading to 0.78.2 SUCCEEDED
Message-ID: <0101019381af51d1-13597ccd-f4c0-4956-a893-dc904abf0eb5-000000@us-west-2.amazonses.com>
Date: Sun, 1 Dec 2024 10:06:10 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.12.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Dec 2024 10:06:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208108

--===============0085569250991295487==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sCgp0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFk
ZSBIZWxwZXIKdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBl
KHMpICp2dGUqIHRvICowLjc4LjIqIGhhcyBTdWNjZWVkZWQuCgpOZXh0IHN0ZXBzOgogICAgLSBh
cHBseSB0aGUgcGF0Y2g6IGdpdCBhbSAwMDAxLXZ0ZS11cGdyYWRlLTAuNzguMS0wLjc4LjIucGF0
Y2gKICAgIC0gY2hlY2sgdGhlIGNoYW5nZXMgdG8gdXBzdHJlYW0gcGF0Y2hlcyBhbmQgc3VtbWFy
aXplIHRoZW0gaW4gdGhlIGNvbW1pdCBtZXNzYWdlLAogICAgLSBjb21waWxlIGFuIGltYWdlIHRo
YXQgY29udGFpbnMgdGhlIHBhY2thZ2UKICAgIC0gcGVyZm9ybSBzb21lIGJhc2ljIHNhbml0eSB0
ZXN0cwogICAgLSBhbWVuZCB0aGUgcGF0Y2ggYW5kIHNpZ24gaXQgb2ZmOiBnaXQgY29tbWl0IC1z
IC0tcmVzZXQtYXV0aG9yIC0tYW1lbmQKICAgIC0gc2VuZCBpdCB0byB0aGUgYXBwcm9wcmlhdGUg
bWFpbGluZyBsaXN0CgpBbHRlcm5hdGl2ZWx5LCBpZiB5b3UgYmVsaWV2ZSB0aGUgcmVjaXBlIHNo
b3VsZCBub3QgYmUgdXBncmFkZWQgYXQgdGhpcyB0aW1lLAp5b3UgY2FuIGZpbGwgUkVDSVBFX05P
X1VQREFURV9SRUFTT04gaW4gcmVzcGVjdGl2ZSByZWNpcGUgZmlsZSBzbyB0aGF0CmF1dG9tYXRp
YyB1cGdyYWRlcyB3b3VsZCBubyBsb25nZXIgYmUgYXR0ZW1wdGVkLgoKUGxlYXNlIHJldmlldyB0
aGUgYXR0YWNoZWQgZmlsZXMgZm9yIGZ1cnRoZXIgaW5mb3JtYXRpb24gYW5kIGJ1aWxkL3VwZGF0
ZSBmYWlsdXJlcy4KQW55IHByb2JsZW0gcGxlYXNlIGZpbGUgYSBidWcgYXQgaHR0cHM6Ly9idWd6
aWxsYS55b2N0b3Byb2plY3Qub3JnL2VudGVyX2J1Zy5jZ2k/cHJvZHVjdD1BdXRvbWF0ZWQlMjBV
cGRhdGUlMjBIYW5kbGVyCgpSZWdhcmRzLApUaGUgVXBncmFkZSBIZWxwZXIKCi0tID44IC0tCkZy
b20gNTQxMDA5Mjg5NjY2OGNjMDc0Mzk4N2RkNjdhODYwMmNmMjE5NjVlOSBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKRnJvbTogVXBncmFkZSBIZWxwZXIgPGF1aEB5b2N0b3Byb2plY3Qub3JnPgpE
YXRlOiBTdW4sIDEgRGVjIDIwMjQgMTA6MDU6NDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2dGU6
IHVwZ3JhZGUgMC43OC4xIC0+IDAuNzguMgoKLS0tCiAuLi4wMDAxLUFkZC1XX0VYSVRDT0RFLW1h
Y3JvLWZvci1ub24tZ2xpYmMtc3lzdGVtcy5wYXRjaCB8IDQgKystLQogbWV0YS9yZWNpcGVzLXN1
cHBvcnQvdnRlL3Z0ZS8wMDAyLWxpYi1UeXBvLWZpeC5wYXRjaCAgICAgfCA0ICsrLS0KIC4uLmZs
b2F0LUFkZC1zaW5nbGUtaGVhZGVyLWxpYnJhcnktZm9yLWZyb21fY2hhci1pLnBhdGNoIHwgOCAr
KysrLS0tLQogLi4uLXBhcnNlci1Vc2UtZmFzdF9mbG9hdC1pbXBsZW1lbnRhdGlvbi1mb3ItZnJv
bV8ucGF0Y2ggfCA5ICsrKystLS0tLQogLi4uL3JlY2lwZXMtc3VwcG9ydC92dGUve3Z0ZV8wLjc4
LjEuYmIgPT4gdnRlXzAuNzguMi5iYn0gfCAyICstCiA1IGZpbGVzIGNoYW5nZWQsIDEzIGluc2Vy
dGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0
ZS97dnRlXzAuNzguMS5iYiA9PiB2dGVfMC43OC4yLmJifSAoOTYlKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGUvMDAwMS1BZGQtV19FWElUQ09ERS1tYWNyby1mb3It
bm9uLWdsaWJjLXN5c3RlbXMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC92dGUvdnRlLzAw
MDEtQWRkLVdfRVhJVENPREUtbWFjcm8tZm9yLW5vbi1nbGliYy1zeXN0ZW1zLnBhdGNoCmluZGV4
IGUyY2ZmNmNmNzYuLjA1Y2RhNzExZDIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0
L3Z0ZS92dGUvMDAwMS1BZGQtV19FWElUQ09ERS1tYWNyby1mb3Itbm9uLWdsaWJjLXN5c3RlbXMu
cGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvdnRlL3Z0ZS8wMDAxLUFkZC1XX0VYSVRD
T0RFLW1hY3JvLWZvci1ub24tZ2xpYmMtc3lzdGVtcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gYjg3OTVkZGE2Mjk2MTRjZDg0MmZjYmExYzRiNTBiZTc1OWMyMGRhNCBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gZTVhNGFmMjM1NjczNTA2YzMyZTJhNjAzODE3YzAyNjMwMjIwOWRl
OSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IERhbmlsbyBTcGluZWxsYSA8ZGFueXNw
aW45N0Bwcm90b25tYWlsLmNvbT4KIERhdGU6IFRodSwgMjEgTWFyIDIwMTkgMTQ6MTk6MjYgKzAx
MDAKIFN1YmplY3Q6IFtQQVRDSF0gQWRkIFdfRVhJVENPREUgbWFjcm8gZm9yIG5vbi1nbGliYyBz
eXN0ZW1zCkBAIC0xNiw3ICsxNiw3IEBAIFNpZ25lZC1vZmYtYnk6IEFuZHJlYXMgTcO8bGxlciA8
c2Nobml0emVsdG9ueUBnbWFpbC5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KQogCiBkaWZmIC0tZ2l0IGEvc3JjL3dpZGdldC5jYyBiL3NyYy93aWRnZXQuY2MKLWluZGV4IGI4
ZGFhNWMuLmMzNTc5NjAgMTAwNjQ0CitpbmRleCA2Njk1NWE2Li5iMzUyYzExIDEwMDY0NAogLS0t
IGEvc3JjL3dpZGdldC5jYwogKysrIGIvc3JjL3dpZGdldC5jYwogQEAgLTE2LDYgKzE2LDEwIEBA
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC92dGUvdnRlLzAwMDItbGliLVR5cG8t
Zml4LnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvdnRlL3Z0ZS8wMDAyLWxpYi1UeXBvLWZp
eC5wYXRjaAppbmRleCA0MTBkNTA2ODA2Li44YWM1ZGJlYWExIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtc3VwcG9ydC92dGUvdnRlLzAwMDItbGliLVR5cG8tZml4LnBhdGNoCisrKyBiL21ldGEv
cmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGUvMDAwMi1saWItVHlwby1maXgucGF0Y2gKQEAgLTEsNyAr
MSw3IEBACi1Gcm9tIDZiNzQ0MDk5NjgxOWMxMmVjMzJiZmFmNGU3M2IyN2JhZWIyNzMyMDcgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGNkZTY0YjFiYWI4NjNmMzIyMDllNWY0NDE3MjIy
MmU0NGEzYjM0NzIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBDaHJpc3RpYW4gUGVy
c2NoIDxjaHBlQHNyYy5nbm9tZS5vcmc+CiBEYXRlOiBUaHUsIDUgU2VwIDIwMjQgMjM6NTk6MDUg
KzAyMDAKLVN1YmplY3Q6IFtQQVRDSCAyLzNdIGxpYjogVHlwbyBmaXgKK1N1YmplY3Q6IFtQQVRD
SF0gbGliOiBUeXBvIGZpeAogCiBGaXhlczogaHR0cHM6Ly9naXRsYWIuZ25vbWUub3JnL0dOT01F
L3Z0ZS8tL2lzc3Vlcy8yODE2CiBVcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0IFtodHRwczovL2dp
dGxhYi5nbm9tZS5vcmcvR05PTUUvdnRlLy0vY29tbWl0L2UyNDA4N2Q5NTNkOTM1MmM4YmM0NjA3
NGUyNjYyYzgwZjliZmJjMmRdCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC92dGUv
dnRlLzAwMDQtZmFzdF9mbG9hdC1BZGQtc2luZ2xlLWhlYWRlci1saWJyYXJ5LWZvci1mcm9tX2No
YXItaS5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGUvMDAwNC1mYXN0X2Zsb2F0
LUFkZC1zaW5nbGUtaGVhZGVyLWxpYnJhcnktZm9yLWZyb21fY2hhci1pLnBhdGNoCmluZGV4IDcz
MWRiYTcyOWQuLjI5YjhlOTczYjIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0
ZS92dGUvMDAwNC1mYXN0X2Zsb2F0LUFkZC1zaW5nbGUtaGVhZGVyLWxpYnJhcnktZm9yLWZyb21f
Y2hhci1pLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGUvMDAwNC1mYXN0
X2Zsb2F0LUFkZC1zaW5nbGUtaGVhZGVyLWxpYnJhcnktZm9yLWZyb21fY2hhci1pLnBhdGNoCkBA
IC0xLDcgKzEsNyBAQAotRnJvbSAyYTMyZTQzZTQzYjA0NzcxYTMzNTdkM2Q0Y2NiYWZhNzcxNGUw
MTE0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAxYjg0ZGViMDE0OGU4YTgzMzk2MzU0
YWY3NWMyMWVkY2VkMWVkNDExIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBS
YWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IEZyaSwgNCBPY3QgMjAyNCAyMToyMToxMSAt
MDcwMAotU3ViamVjdDogW1BBVENIIDQvNV0gZmFzdF9mbG9hdDogQWRkIHNpbmdsZSBoZWFkZXIg
bGlicmFyeSBmb3IgZnJvbV9jaGFyCitTdWJqZWN0OiBbUEFUQ0hdIGZhc3RfZmxvYXQ6IEFkZCBz
aW5nbGUgaGVhZGVyIGxpYnJhcnkgZm9yIGZyb21fY2hhcgogIGltcGxlbWVudGF0aW9uCiAKIERv
Y3VtZW50IHRoZSBwcm9jZXNzIHRvIHJlLWdlbmVyYXRlIHRoZSBmaWxlIHdoZW5ldmVyIG5ldyBy
ZWxlYXNlCkBAIC0xOCw3ICsxOCw3IEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hl
bUBnbWFpbC5jb20+CiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHNyYy9mYXN0X2Zsb2F0LmhoCiAKIGRp
ZmYgLS1naXQgYS9SRUFETUUubWQgYi9SRUFETUUubWQKLWluZGV4IGEzMjQ2NWE5Li4yMGVkNWJh
MiAxMDA2NDQKK2luZGV4IGEzMjQ2NWEuLjIwZWQ1YmEgMTAwNjQ0CiAtLS0gYS9SRUFETUUubWQK
ICsrKyBiL1JFQURNRS5tZAogQEAgLTIxLDYgKzIxLDIzIEBAIG9uIGRvd25sb2FkLmdub21lLm9y
ZywgYnV0IHBsZWFzZSBub3RlIHRoYXQgYW55IHRhcmJhbGwgZm9yIHJlbGVhc2VzCkBAIC00Nyw3
ICs0Nyw3IEBAIGluZGV4IGEzMjQ2NWE5Li4yMGVkNWJhMiAxMDA2NDQKICAKIGRpZmYgLS1naXQg
YS9zcmMvZmFzdF9mbG9hdC5oaCBiL3NyYy9mYXN0X2Zsb2F0LmhoCiBuZXcgZmlsZSBtb2RlIDEw
MDY0NAotaW5kZXggMDAwMDAwMDAuLmUwZDVkZDUzCitpbmRleCAwMDAwMDAwLi5lMGQ1ZGQ1CiAt
LS0gL2Rldi9udWxsCiArKysgYi9zcmMvZmFzdF9mbG9hdC5oaAogQEAgLTAsMCArMSwzODY5IEBA
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC92dGUvdnRlLzAwMDUtY29sb3ItcGFy
c2VyLVVzZS1mYXN0X2Zsb2F0LWltcGxlbWVudGF0aW9uLWZvci1mcm9tXy5wYXRjaCBiL21ldGEv
cmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGUvMDAwNS1jb2xvci1wYXJzZXItVXNlLWZhc3RfZmxvYXQt
aW1wbGVtZW50YXRpb24tZm9yLWZyb21fLnBhdGNoCmluZGV4IGI5NTFiYmFjMTguLmQ0MmU1MmNk
ZTQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGUvMDAwNS1jb2xvci1w
YXJzZXItVXNlLWZhc3RfZmxvYXQtaW1wbGVtZW50YXRpb24tZm9yLWZyb21fLnBhdGNoCisrKyBi
L21ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGUvMDAwNS1jb2xvci1wYXJzZXItVXNlLWZhc3Rf
ZmxvYXQtaW1wbGVtZW50YXRpb24tZm9yLWZyb21fLnBhdGNoCkBAIC0xLDggKzEsNyBAQAotRnJv
bSAwOGI5MGQwYTViZjhjZWI2OGRkMWI0ZTlkZWQwZjhhMmI1Mjg3YTZlIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQorRnJvbSAxOWU2ZWYwY2I0OTQ4NDQ5ZGJmMjdmZmRiMjQ0MzRjMWI4M2JkMzUw
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWls
LmNvbT4KIERhdGU6IEZyaSwgNCBPY3QgMjAyNCAyMToyMjo1MiAtMDcwMAotU3ViamVjdDogW1BB
VENIIDUvNV0gY29sb3ItcGFyc2VyOiBVc2UgZmFzdF9mbG9hdCBpbXBsZW1lbnRhdGlvbiBmb3IK
LSBmcm9tX2NoYXJzCitTdWJqZWN0OiBbUEFUQ0hdIGNvbG9yLXBhcnNlcjogVXNlIGZhc3RfZmxv
YXQgaW1wbGVtZW50YXRpb24gZm9yIGZyb21fY2hhcnMKIAogUmVtb3ZlZCBkZXBlbmRlbmN5IG9u
IGMrKyBydW50aW1lIHRvIHByb3ZpZGUgaXQuCiAKQEAgLTE2LDcgKzE1LDcgQEAgU2lnbmVkLW9m
Zi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KICAyIGZpbGVzIGNoYW5nZWQsIDEy
IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvc3JjL2NvbG9y
LXBhcnNlci5jYyBiL3NyYy9jb2xvci1wYXJzZXIuY2MKLWluZGV4IDAyZWM1ZDNhLi40MmM1MTk2
NiAxMDA2NDQKK2luZGV4IDAyZWM1ZDMuLjQyYzUxOTYgMTAwNjQ0CiAtLS0gYS9zcmMvY29sb3It
cGFyc2VyLmNjCiArKysgYi9zcmMvY29sb3ItcGFyc2VyLmNjCiBAQCAtMTcsNyArMTcsNyBAQApA
QCAtNjQsNyArNjMsNyBAQCBpbmRleCAwMmVjNWQzYS4uNDJjNTE5NjYgMTAwNjQ0CiAgICAgICAg
ICAgICAgICAgICAgICAgICAgcmV0dXJuIHN0ZDo6bnVsbG9wdDsKICAKIGRpZmYgLS1naXQgYS9z
cmMvdGVybXByb3BzLmhoIGIvc3JjL3Rlcm1wcm9wcy5oaAotaW5kZXggMGQzZjBmNGMuLmExMGZj
N2QxIDEwMDY0NAoraW5kZXggMGQzZjBmNC4uYTEwZmM3ZCAxMDA2NDQKIC0tLSBhL3NyYy90ZXJt
cHJvcHMuaGgKICsrKyBiL3NyYy90ZXJtcHJvcHMuaGgKIEBAIC0xNyw2ICsxNyw3IEBACmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC92dGUvdnRlXzAuNzguMS5iYiBiL21ldGEvcmVj
aXBlcy1zdXBwb3J0L3Z0ZS92dGVfMC43OC4yLmJiCnNpbWlsYXJpdHkgaW5kZXggOTYlCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGVfMC43OC4xLmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtc3VwcG9ydC92dGUvdnRlXzAuNzguMi5iYgppbmRleCA1NzIzZjM1YjgzLi4x
ODJhMzA3M2M0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC92dGUvdnRlXzAuNzgu
MS5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC92dGUvdnRlXzAuNzguMi5iYgpAQCAtMjIs
NyArMjIsNyBAQCBTUkNfVVJJICs9ICJmaWxlOi8vMDAwMS1BZGQtV19FWElUQ09ERS1tYWNyby1m
b3Itbm9uLWdsaWJjLXN5c3RlbXMucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwNC1mYXN0
X2Zsb2F0LUFkZC1zaW5nbGUtaGVhZGVyLWxpYnJhcnktZm9yLWZyb21fY2hhci1pLnBhdGNoIFwK
ICAgICAgICAgICAgZmlsZTovLzAwMDUtY29sb3ItcGFyc2VyLVVzZS1mYXN0X2Zsb2F0LWltcGxl
bWVudGF0aW9uLWZvci1mcm9tXy5wYXRjaCBcCiAgICAgICAgICAgICIKLVNSQ19VUklbYXJjaGl2
ZS5zaGEyNTZzdW1dID0gIjY0OTlkMjUxNzkzMTUyNTVmOWJjZmNlMDNjNjZmYjg0YzAzYWQzMjVk
ZWEyM2QwZTM3MjE3ODUyMWVjYTQyYjUiCitTUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICIz
NWQ3YmNkZTA3MzU2ODQ2YjRhMTI4ODFjOGUwMTY3MDViNzBhOTAwNGE5MDgyMjg1ZWVlNTgzNGNj
YzQ5ODkwIgogCiBBTllfT0ZfRElTVFJPX0ZFQVRVUkVTID0gIiR7R1RLM0RJU1RST0ZFQVRVUkVT
fSIKIAotLSAKMi40NC4xCgo=

--===============0085569250991295487==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (0 cached, 921 parsed). 1878 targets, 52 skipped, 0 masked, 0 errors.
Removing 124 recipes from the core2-64 sysroot...done.
Removing 124 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:441c49d9f5c25af8b33f1cdbda6b619d324e855e"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 931 Local 869 Mirrors 0 Missed 62 Current 342 (93% match, 95% complete)
Removing 5 stale sstate objects for arch allarch...done.
Removing 7 stale sstate objects for arch x86_64...done.
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 442 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.2.bb:do_populate_lic_setscene)
NOTE: Running setscene task 465 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 467 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 468 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 471 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 474 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.4.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 475 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/lz4/lz4_1.10.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 478 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.40.bb:do_create_spdx_setscene)
NOTE: Running setscene task 479 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 480 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.80.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 485 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 488 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 492 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 495 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 496 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 497 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_create_spdx_setscene)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe tiff-4.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwebp-1.4.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vte-0.78.2-r0: task do_populate_lic_setscene: Started
NOTE: recipe gnutls-3.8.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe orc-0.4.40-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libstd-rs-1.80.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.10.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe at-spi2-core-2.54.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 499 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_create_spdx_setscene)
NOTE: recipe sbc-2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vte-0.78.2-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe lz4-1_1.10.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe tiff-4.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libwebp-1.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 500 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_create_spdx_setscene)
NOTE: Running setscene task 502 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/iso-codes/iso-codes_4.17.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 503 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/lz4/lz4_1.10.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 505 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 508 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 510 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 514 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_create_spdx_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 515 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.1.0.bb:do_create_spdx_setscene)
NOTE: recipe gnutls-3.8.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libstd-rs-1.80.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 517 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/lz4/lz4_1.10.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 518 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_spdx_setscene)
NOTE: recipe curl-8.10.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe orc-0.4.40-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe at-spi2-core-2.54.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 520 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 521 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 523 of 1273 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo_1.80.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 527 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 528 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe iso-codes-4.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe tiff-4.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk4-4.16.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe harfbuzz-10.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.8-r0: task do_packagedata_setscene: Started
NOTE: recipe cargo-native-1.80.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gtk4-4.16.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 529 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 530 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_create_spdx_setscene)
NOTE: recipe iso-codes-4.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 532 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 534 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 538 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_packagedata_setscene)
NOTE: recipe lz4-1_1.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 539 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_packagedata_setscene)
NOTE: recipe harfbuzz-10.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 543 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 544 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 545 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe tiff-4.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 546 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 547 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 550 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.1.bb:do_populate_sysroot_setscene)
NOTE: recipe lz4-1_1.10.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 551 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_create_spdx_setscene)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 552 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cargo-native-1.80.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 553 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libwebp-1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe tiff-4.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.54.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.10.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnutls-3.8.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 556 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 558 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.1.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.8.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 560 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 563 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 565 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_create_spdx_setscene)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 569 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 570 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata_setscene)
NOTE: recipe libwebp-1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 573 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 575 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 577 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_76-1.bb:do_create_spdx_setscene)
NOTE: recipe tiff-4.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.24.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 578 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.13.bb:do_create_spdx_setscene)
NOTE: recipe gtk+3-3.24.43-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 580 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.7.bb:do_recipe_qa_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 581 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata_setscene)
NOTE: recipe at-spi2-core-2.54.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.10.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.10.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 583 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 586 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.54.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe icu-76-1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 589 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_create_spdx_setscene)
NOTE: recipe gnutls-3.8.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.13-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 591 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gtk4-4.16.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 592 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 593 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-76-1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 596 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.40.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gtk4-4.16.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 598 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 600 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.9.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.18.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 601 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 602 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 604 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/iso-codes/iso-codes_4.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 609 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_create_spdx_setscene)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 611 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.296.0.bb:do_create_spdx_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 612 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_populate_sysroot_setscene)
NOTE: recipe nettle-3.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwebp-1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 614 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: recipe libusb1-1.0.27-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 615 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.123.bb:do_create_spdx_setscene)
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe orc-0.4.40-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe iso-codes-4.17.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 616 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe cairo-1.18.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 618 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/lz4/lz4_1.10.0.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.3.296.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdrm-2.4.123-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 620 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 621 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 622 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb:do_create_spdx_setscene)
NOTE: recipe libwebp-1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.296.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe nettle-3.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 625 of 1273 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust_1.80.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 626 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 629 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot_setscene)
NOTE: recipe orc-0.4.40-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 634 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 635 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 636 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.40.bb:do_populate_sysroot_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 637 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_populate_sysroot_setscene)
NOTE: recipe lz4-1_1.10.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 640 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.123-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 643 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe nettle-3.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-protocols-1.38-r0: task do_create_spdx_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 645 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe orc-0.4.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.43-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 646 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_create_spdx_setscene)
NOTE: recipe rust-native-1.80.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe at-spi2-core-2.54.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 647 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-protocols-1.38-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 648 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_create_spdx_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe nettle-3.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 649 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 650 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 652 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 653 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe rust-native-1.80.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 654 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 655 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 658 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe orc-0.4.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 659 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 661 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.54.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe tiff-4.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 664 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 668 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: recipe xkeyboard-config-2.43-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 669 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_package_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.79-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.54.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe tiff-4.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gtk+3-3.24.43-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bluez5-5.79-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gtk+3-3.24.43-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe iso-codes-4.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pango-1.54.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 671 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 673 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 675 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.80.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 679 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 680 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 682 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 684 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.296.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 685 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 686 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 687 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_packagedata_setscene)
NOTE: Running setscene task 688 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 691 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 693 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_packagedata_setscene)
NOTE: Running setscene task 698 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 700 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.2.bb:do_create_spdx_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libstd-rs-1.80.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.79-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.43-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgudev-238-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnutls-3.8.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-33-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.82.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libusb1-1.0.27-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 701 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.54.0.bb:do_packagedata_setscene)
NOTE: recipe bluez5-5.79-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 702 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 703 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_populate_sysroot_setscene)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_package_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gnutls-3.8.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 708 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.80.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 712 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 714 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 715 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 718 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libstd-rs-1.80.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 719 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 722 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: recipe kmod-33-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 723 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_create_spdx_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.82.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 724 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.9.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.54.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 728 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.4.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 729 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-33-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.80.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-3.0.18-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.13.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwebp-1.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libical-3.0.18-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.9-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 730 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 735 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.40.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.43-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 736 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe pango-1.54.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 738 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 739 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_create_spdx_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 740 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.13.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 741 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.54.0.bb:do_package_setscene)
NOTE: recipe kmod-33-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 742 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libwebp-1.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 743 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.24.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 744 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 748 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 749 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe orc-0.4.40-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libical-3.0.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe librsvg-2.58.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.40-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 751 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pango-1.54.0-r0: task do_package_setscene: Started
NOTE: Running setscene task 752 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 753 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 754 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 755 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 760 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 761 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libical-3.0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 762 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_create_spdx_setscene)
NOTE: recipe librsvg-2.58.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 763 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.1.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 764 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.2.bb:do_recipe_qa_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 766 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 767 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.13.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.13.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-1.24.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.10.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 769 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_recipe_qa_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 770 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-lib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.24.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 774 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 777 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 779 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 780 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe curl-8.10.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe librsvg-2.58.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 781 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-lib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 782 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 784 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_create_spdx_setscene)
NOTE: recipe libstd-rs-1.80.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 785 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.10-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 786 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 787 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe librsvg-2.58.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 789 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_packagedata_setscene)
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 791 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 792 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.0.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 793 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 794 of 1273 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo_1.80.1.bb:do_populate_sysroot_setscene)
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 796 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_recipe_qa_setscene)
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 798 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 799 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 800 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.54.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 801 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 802 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.9.bb:do_recipe_qa_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 803 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.44.bb:do_create_spdx_setscene)
NOTE: recipe xkeyboard-config-2.43-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pango-1.54.0-r0: task do_package_setscene: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 804 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 805 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 806 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe cargo-native-1.80.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe at-spi2-core-2.54.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 811 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 812 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.43-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.24.9-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 813 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.44-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 814 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 818 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 819 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_packagedata_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-protocols-1.38-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 820 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.24.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 821 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 822 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.5.bb:do_packagedata_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 823 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.80.1.bb:do_recipe_qa_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.44-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 826 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 828 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-33-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 830 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: recipe wayland-protocols-1.38-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 831 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 832 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.80.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-33-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 833 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 834 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 835 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.1.0.bb:do_packagedata_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cargo-native-1.80.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 837 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 838 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.296.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 839 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 840 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libstd-rs-1.80.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 844 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.123.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 846 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 847 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 848 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe harfbuzz-10.1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 849 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.296.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 852 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_recipe_qa_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.123-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 853 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 856 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 858 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.123.bb:do_packagedata_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 860 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.3.296.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-10.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 863 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.296.0.bb:do_populate_sysroot_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 865 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.54.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 866 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 867 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 868 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 869 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 872 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.123-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 874 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 875 of 1273 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust_1.80.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.123-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.296.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 876 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 879 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_packagedata_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.54.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe harfbuzz-10.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 883 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_create_spdx_setscene)
NOTE: recipe pango-1.54.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 885 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_recipe_qa_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.16.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 887 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe rust-native-1.80.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 892 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 893 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.123-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 894 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.3.296.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 895 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.44-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 898 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_76-1.bb:do_packagedata_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 900 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_create_spdx_setscene)
NOTE: recipe harfbuzz-10.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vala-0.56.17-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 902 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 907 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 908 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 911 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.13.bb:do_recipe_qa_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.18.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.44-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 918 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot_setscene)
NOTE: recipe vala-0.56.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 920 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_recipe_qa_setscene)
NOTE: recipe icu-76-1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.4.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 924 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 925 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 928 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 933 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 934 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_76-1.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 935 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 937 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe cairo-1.18.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 939 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 940 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 944 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.296.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 945 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: recipe icu-76-1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 946 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.1.0.bb:do_recipe_qa_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 948 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.54.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 950 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.296.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe icu-76-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.18.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 952 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe harfbuzz-10.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pango-1.54.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 954 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 955 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 956 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 957 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe harfbuzz-10.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 960 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 961 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe pango-1.54.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 963 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 964 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.296.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 966 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 967 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.18.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 968 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.3.296.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 970 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_recipe_qa_setscene)
NOTE: recipe icu-76-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 973 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 976 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.123.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 979 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 982 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 984 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 985 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 986 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.296.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 988 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 989 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 990 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 992 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 993 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.123-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rust-native-1.80.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 995 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_76-1.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.18.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 997 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 998 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 999 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.123-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1000 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1003 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1004 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe cairo-1.18.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-76-1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1005 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.296.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1006 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1007 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1010 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1011 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1012 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-76-1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1014 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1015 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1018 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1020 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe freetype-2.13.3-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1025 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1026 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1028 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1030 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.13.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.10-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1032 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1034 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.13.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1036 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1040 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1042 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1043 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.13.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1044 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1046 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1047 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1058 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1059 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1060 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1061 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1063 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1064 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1065 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1066 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1067 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1069 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1074 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1075 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1199 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.9.bb:do_fetch)
NOTE: Running task 1261 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_fetch)
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1077 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1078 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1081 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1082 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1083 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1085 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running task 1292 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_fetch)
NOTE: recipe gstreamer1.0-1.24.9-r0: task do_fetch: Started
NOTE: Running task 1349 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_fetch)
NOTE: Running task 1351 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_fetch)
NOTE: Running task 1359 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.54.0.bb:do_fetch)
NOTE: recipe gstreamer1.0-1.24.9-r0: task do_fetch: Succeeded
NOTE: recipe vala-0.56.17-r0: task do_fetch: Started
NOTE: Running task 1389 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.9.bb:do_unpack)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1414 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_unpack)
NOTE: Running task 1420 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.9.bb:do_write_config)
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libical-3.0.18-r0: task do_fetch: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libical-3.0.18-r0: task do_fetch: Succeeded
NOTE: Running task 1445 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_unpack)
NOTE: recipe libusb1-1.0.27-r0: task do_fetch: Started
NOTE: recipe pango-1.54.0-r0: task do_fetch: Started
NOTE: recipe bluez5-5.79-r0: task do_fetch: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libusb1-1.0.27-r0: task do_fetch: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1492 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_unpack)
NOTE: recipe pango-1.54.0-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.79-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.24.9-r0: task do_unpack: Started
NOTE: Running task 1508 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.54.0.bb:do_unpack)
NOTE: Running task 1509 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_unpack)
NOTE: recipe vala-0.56.17-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-1.24.9-r0: task do_write_config: Started
NOTE: Running task 1564 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.2.bb:do_fetch)
NOTE: recipe libical-3.0.18-r0: task do_unpack: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1089 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1091 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-1.24.9-r0: task do_write_config: Succeeded
NOTE: recipe libusb1-1.0.27-r0: task do_unpack: Started
NOTE: recipe pango-1.54.0-r0: task do_unpack: Started
NOTE: recipe bluez5-5.79-r0: task do_unpack: Started
NOTE: recipe libical-3.0.18-r0: task do_unpack: Succeeded
NOTE: Running task 1707 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_patch)
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe librsvg-2.58.2-r0: task do_fetch: Started
NOTE: Running task 1800 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.9.bb:do_fetch)
NOTE: Running task 1801 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_fetch)
NOTE: recipe libusb1-1.0.27-r0: task do_unpack: Succeeded
NOTE: Running task 1818 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_patch)
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libical-3.0.18-r0: task do_patch: Started
NOTE: Running task 1844 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.9.bb:do_fetch)
NOTE: Running task 1846 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_fetch)
NOTE: recipe gstreamer1.0-1.24.9-r0: task do_unpack: Succeeded
NOTE: Running task 1877 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.9.bb:do_patch)
NOTE: Running task 1881 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_fetch)
NOTE: Running task 1882 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.7.bb:do_fetch)
NOTE: Running task 1897 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.9.bb:do_write_config)
NOTE: Running task 1898 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_write_config)
NOTE: recipe librsvg-2.58.2-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-238-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.9-r0: task do_fetch: Started
NOTE: Running task 1899 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.2.bb:do_unpack)
NOTE: recipe libusb1-1.0.27-r0: task do_patch: Started
NOTE: recipe libgudev-238-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.9-r0: task do_fetch: Succeeded
NOTE: Running task 1900 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_unpack)
NOTE: Running task 1901 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.9.bb:do_unpack)
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.9-r0: task do_fetch: Started
NOTE: recipe pango-1.54.0-r0: task do_unpack: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.24.9-r0: task do_fetch: Succeeded
NOTE: recipe gtk4-4.16.7-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.24.9-r0: task do_patch: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_fetch: Started
NOTE: Running task 1904 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_unpack)
NOTE: Running task 1909 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.9.bb:do_write_config)
NOTE: Running task 1910 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.9.bb:do_unpack)
NOTE: recipe libgudev-238-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.9-r0: task do_write_config: Started
NOTE: recipe gtk4-4.16.7-r0: task do_fetch: Succeeded
NOTE: recipe gtk+3-3.24.43-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.79-r0: task do_unpack: Succeeded
NOTE: Running task 1911 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.7.bb:do_unpack)
NOTE: Running task 1912 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_patch)
NOTE: Running task 1913 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_unpack)
NOTE: recipe libusb1-1.0.27-r0: task do_patch: Succeeded
NOTE: recipe libgudev-238-r0: task do_unpack: Started
NOTE: recipe libical-3.0.18-r0: task do_patch: Succeeded
NOTE: recipe libgudev-238-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.9-r0: task do_unpack: Started
NOTE: Running task 1915 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_write_config)
NOTE: recipe vala-0.56.17-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.9-r0: task do_write_config: Succeeded
NOTE: Running task 1917 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_generate_toolchain_file)
NOTE: Running task 1918 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.2.bb:do_recipe_qa)
NOTE: Running task 1919 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_patch)
NOTE: Running task 1920 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_write_config)
NOTE: recipe librsvg-2.58.2-r0: task do_unpack: Started
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_package_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.24.9-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.9-r0: task do_unpack: Started
NOTE: Running setscene task 1092 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gtk4-4.16.7-r0: task do_unpack: Started
NOTE: recipe bluez5-5.79-r0: task do_patch: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.9-r0: task do_write_config: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Started
NOTE: recipe libical-3.0.18-r0: task do_generate_toolchain_file: Started
NOTE: Running setscene task 1093 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe vala-0.56.17-r0: task do_patch: Started
NOTE: recipe vte-0.78.2-r0: task do_recipe_qa: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_write_config: Started
NOTE: recipe libgudev-238-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1094 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.44.bb:do_populate_sysroot_setscene)
NOTE: recipe libical-3.0.18-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Succeeded
NOTE: recipe vala-0.56.17-r0: task do_patch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1095 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1096 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1097 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.44.bb:do_packagedata_setscene)
NOTE: recipe gtk+3-3.24.43-r0: task do_write_config: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1098 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot_setscene)
NOTE: Running task 1923 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_patch)
NOTE: recipe libpng-1.6.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1099 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_recipe_qa_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.44-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.24.9-r0: task do_patch: Succeeded
NOTE: Running task 1925 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_patch)
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgudev-238-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.9-r0: task do_unpack: Succeeded
NOTE: Running task 1926 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.9.bb:do_patch)
NOTE: recipe bluez5-5.79-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1927 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.7.bb:do_write_config)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1968 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.2.bb:do_write_config)
NOTE: Running setscene task 1102 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_patch: Started
NOTE: Running setscene task 1105 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.44.bb:do_recipe_qa_setscene)
NOTE: recipe vte-0.78.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2000 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.2.bb:do_fetch)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.9-r0: task do_patch: Started
NOTE: Running task 2016 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_fetch)
NOTE: recipe libgudev-238-r0: task do_patch: Succeeded
NOTE: recipe gtk4-4.16.7-r0: task do_write_config: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vte-0.78.2-r0: task do_write_config: Started
NOTE: recipe gtk4-4.16.7-r0: task do_write_config: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_patch: Succeeded
NOTE: recipe vte-0.78.2-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_fetch: Started
NOTE: recipe vte-0.78.2-r0: task do_fetch: Succeeded
NOTE: recipe libpng-1.6.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 2031 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.2.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_fetch: Succeeded
NOTE: recipe vte-0.78.2-r0: task do_write_config: Succeeded
NOTE: Running task 2042 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.9-r0: task do_unpack: Succeeded
NOTE: Running task 2044 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.9.bb:do_patch)
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1108 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1109 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1110 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1111 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1112 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.2.bb:do_populate_sysroot_setscene)
NOTE: recipe vte-0.78.2-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.9-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.24.9-r0: task do_patch: Started
NOTE: recipe libxml2-2.13.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.13.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.82.2-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.82.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vte-0.78.2-r0: task do_unpack: Succeeded
NOTE: Running task 2052 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.2.bb:do_patch)
NOTE: recipe libxml2-2.13.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.13.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1115 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.5.bb:do_recipe_qa_setscene)
NOTE: recipe gtk+3-3.24.43-r0: task do_unpack: Succeeded
NOTE: Running task 2053 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.9-r0: task do_patch: Succeeded
NOTE: recipe vte-0.78.2-r0: task do_patch: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-1_2.82.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.13.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_patch: Started
NOTE: recipe libxml2-2.13.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gtk+3-3.24.43-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-1_2.82.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1117 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1118 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 1119 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1120 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1121 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1123 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.2.bb:do_recipe_qa_setscene)
NOTE: recipe vte-0.78.2-r0: task do_patch: Succeeded
NOTE: Running task 2064 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libpcre2-10.44-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.82.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vte-0.78.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.82.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.82.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1126 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.6.0.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1129 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1131 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1132 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-setuptools-75.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk4-4.16.7-r0: task do_unpack: Succeeded
NOTE: Running task 2078 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.7.bb:do_patch)
NOTE: recipe python3-setuptools-75.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-75.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1135 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gtk4-4.16.7-r0: task do_patch: Started
NOTE: recipe vte-0.78.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk4-4.16.7-r0: task do_patch: Succeeded
NOTE: recipe libpcre2-10.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1137 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-75.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1139 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1140 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-75.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1142 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1143 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1144 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1145 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1146 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1147 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1149 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-75.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1151 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1152 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1153 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1154 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1155 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1156 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1157 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.40.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1158 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1159 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/bash-completion/2.14.0/temp/log.do_packagedata_setscene.3785847
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1160 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: recipe libedit-20240808-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.47.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1161 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.4.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1163 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_package_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1165 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1167 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/sqlite3/3.47.0/temp/log.do_packagedata_setscene.3785935
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1168 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.0.bb:do_package_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_package_setscene: Started
NOTE: Running setscene task 1172 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1174 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1175 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1176 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1177 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1178 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1179 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1180 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1182 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1184 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.47.0-r0: task do_package_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1187 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1188 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1189 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1195 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1197 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20240808-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1200 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1201 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.47.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1202 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1204 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1205 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1208 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1211 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1213 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20240808-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1215 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.47.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1216 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1217 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1219 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20240808-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1222 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1223 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1225 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.47.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1227 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.0.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.47.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.47.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1229 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_package_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1230 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1231 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1233 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1234 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1236 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1238 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1240 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1242 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1243 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1244 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1245 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1246 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1252 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1253 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1256 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1258 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1259 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1262 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1264 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1265 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe librsvg-2.58.2-r0: task do_unpack: Succeeded
NOTE: Running task 2224 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.2.bb:do_patch)
NOTE: recipe librsvg-2.58.2-r0: task do_patch: Started
NOTE: recipe librsvg-2.58.2-r0: task do_patch: Succeeded
NOTE: Running task 2226 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.2.bb:do_rust_gen_targets)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1267 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe librsvg-2.58.2-r0: task do_rust_gen_targets: Started
NOTE: recipe librsvg-2.58.2-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1271 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1272 of 1273 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.1.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2572 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.0.bb:do_packagedata)
NOTE: Running task 2640 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_packagedata)
NOTE: Running task 2732 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2760 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_prepare_recipe_sysroot)
NOTE: recipe sqlite3-3_3.47.0-r0: task do_packagedata: Started
NOTE: Running task 2840 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_prepare_recipe_sysroot)
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.24.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3054 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3088 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libusb1-1.0.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3117 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgudev-238-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sqlite3-3_3.47.0-r0: task do_packagedata: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3310 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_packagedata)
NOTE: Running task 3326 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.54.0.bb:do_collect_spdx_deps)
NOTE: recipe libusb1-1.0.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3327 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_collect_spdx_deps)
NOTE: Running task 3328 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_configure)
NOTE: Running task 3331 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_collect_spdx_deps)
NOTE: Running task 3340 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.9.bb:do_collect_spdx_deps)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_packagedata: Started
NOTE: Running task 3343 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_collect_spdx_deps)
NOTE: Running task 3344 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_collect_spdx_deps)
NOTE: recipe pango-1.54.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe vala-0.56.17-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3345 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_collect_spdx_deps)
NOTE: recipe libusb1-1.0.27-r0: task do_configure: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-1.24.9-r0: task do_collect_spdx_deps: Started
NOTE: recipe libusb1-1.0.27-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgudev-238-r0: task do_collect_spdx_deps: Started
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe libusb1-1.0.27-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe pango-1.54.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3346 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.54.0.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-1.24.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3347 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.9.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-1.24.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vala-0.56.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vala-0.56.17-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe pango-1.54.0-r0: task do_create_spdx: Started
NOTE: Running task 3348 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_configure)
NOTE: recipe libgudev-238-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgudev-238-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3349 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_configure)
NOTE: recipe gstreamer1.0-1.24.9-r0: task do_configure: Started
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3350 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_configure)
NOTE: recipe vala-0.56.17-r0: task do_configure: Started
NOTE: recipe libgudev-238-r0: task do_configure: Started
NOTE: recipe graphene-1.10.8-r0: task do_configure: Started
NOTE: recipe pango-1.54.0-r0: task do_create_spdx: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_packagedata: Succeeded
NOTE: recipe gtk+3-3.24.43-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_packagedata unihash changed to df600e0d84c205f7e4938130e6e2ea55a195827402dcd744f2d551d6b21897be
NOTE: Setscene tasks completed
NOTE: Running task 3351 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_configure)
NOTE: Running task 3352 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_create_spdx)
NOTE: recipe gtk+3-3.24.43-r0: task do_configure: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_create_spdx: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_create_spdx: Succeeded
NOTE: Running task 3353 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_collect_spdx_deps)
NOTE: recipe gtk+3-3.24.43-r0: task do_collect_spdx_deps: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libgudev-238-r0: task do_configure: Succeeded
NOTE: Running task 3354 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_compile)
NOTE: recipe libgudev-238-r0: task do_compile: Started
NOTE: recipe graphene-1.10.8-r0: task do_configure: Succeeded
NOTE: Running task 3355 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_compile)
NOTE: recipe graphene-1.10.8-r0: task do_compile: Started
NOTE: recipe libgudev-238-r0: task do_compile: Succeeded
NOTE: Running task 3356 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_install)
NOTE: recipe libgudev-238-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.24.9-r0: task do_configure: Succeeded
NOTE: Running task 3357 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.9.bb:do_configure_ptest_base)
NOTE: recipe libgudev-238-r0: task do_install: Succeeded
NOTE: Running task 3358 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_populate_sysroot)
NOTE: Running task 3359 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_package)
NOTE: recipe gstreamer1.0-1.24.9-r0: task do_configure_ptest_base: Started
NOTE: recipe gstreamer1.0-1.24.9-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libgudev-238-r0: task do_populate_sysroot: Started
NOTE: Running task 3360 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.9.bb:do_compile)
NOTE: recipe libgudev-238-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.24.9-r0: task do_compile: Started
NOTE: recipe libgudev-238-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.43-r0: task do_configure: Succeeded
NOTE: Running task 3361 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_compile)
NOTE: recipe gtk+3-3.24.43-r0: task do_compile: Started
NOTE: recipe libgudev-238-r0: task do_package: Succeeded
NOTE: Running task 3362 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata)
NOTE: recipe libgudev-238-r0: task do_packagedata: Started
NOTE: recipe graphene-1.10.8-r0: task do_compile: Succeeded
NOTE: Running task 3363 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_install)
NOTE: recipe graphene-1.10.8-r0: task do_install: Started
NOTE: recipe libgudev-238-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata unihash changed to 0cf70caa4f6de6d7e4c754da07f8c04935a7b16b98cbcf633f18fa766a5d10de
NOTE: Setscene tasks completed
NOTE: Running task 3364 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_create_spdx)
NOTE: recipe libgudev-238-r0: task do_create_spdx: Started
NOTE: recipe libgudev-238-r0: task do_create_spdx: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_install: Succeeded
NOTE: Running task 3365 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot)
NOTE: Running task 3366 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_package)
NOTE: recipe libusb1-1.0.27-r0: task do_configure: Succeeded
NOTE: Running task 3367 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_configure_ptest_base)
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.27-r0: task do_configure_ptest_base: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Started
NOTE: recipe libusb1-1.0.27-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3368 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_compile)
NOTE: recipe libusb1-1.0.27-r0: task do_compile: Started
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libusb1-1.0.27-r0: task do_compile: Succeeded
NOTE: Running task 3369 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_compile_ptest_base)
NOTE: recipe vala-0.56.17-r0: task do_configure: Succeeded
NOTE: Running task 3370 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_compile)
NOTE: recipe libusb1-1.0.27-r0: task do_compile_ptest_base: Started
NOTE: recipe vala-0.56.17-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.27-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3371 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_install)
NOTE: recipe libusb1-1.0.27-r0: task do_install: Started
NOTE: recipe libusb1-1.0.27-r0: task do_install: Succeeded
NOTE: Running task 3372 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_install_ptest_base)
NOTE: recipe graphene-1.10.8-r0: task do_package: Succeeded
NOTE: recipe libusb1-1.0.27-r0: task do_install_ptest_base: Started
NOTE: Running task 3373 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata)
NOTE: recipe libusb1-1.0.27-r0: task do_install_ptest_base: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Started
NOTE: Running task 3374 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_populate_sysroot)
NOTE: Running task 3375 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_package)
NOTE: recipe libusb1-1.0.27-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.27-r0: task do_package: Started
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata unihash changed to e1e6c27d2f7166e91b2023dd8db5ed0c4bb6285166c8f87b9aafc8040180dbb2
NOTE: Setscene tasks completed
NOTE: Running task 3376 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_create_spdx)
NOTE: recipe libusb1-1.0.27-r0: task do_populate_sysroot: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Started
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Succeeded
NOTE: recipe libusb1-1.0.27-r0: task do_package: Succeeded
NOTE: Running task 3377 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_packagedata)
NOTE: recipe libusb1-1.0.27-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.27-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_packagedata unihash changed to e9026c9e816a3e411b6ceaae51c74e92ebd6a7357b40b38fb78cdbfb0b61062a
NOTE: Setscene tasks completed
NOTE: Running task 3378 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_create_spdx)
NOTE: recipe libusb1-1.0.27-r0: task do_create_spdx: Started
NOTE: recipe libusb1-1.0.27-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-1.24.9-r0: task do_compile: Succeeded
NOTE: Running task 3379 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.9.bb:do_compile_ptest_base)
NOTE: recipe gstreamer1.0-1.24.9-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-1.24.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3380 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.9.bb:do_install)
NOTE: recipe gstreamer1.0-1.24.9-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.24.9-r0: task do_install: Succeeded
NOTE: Running task 3381 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.9.bb:do_install_ptest_base)
NOTE: recipe gstreamer1.0-1.24.9-r0: task do_install_ptest_base: Started
NOTE: recipe gstreamer1.0-1.24.9-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3382 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.9.bb:do_populate_sysroot)
NOTE: Running task 3383 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.9.bb:do_package)
NOTE: recipe gstreamer1.0-1.24.9-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.24.9-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.24.9-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3384 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.24.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3385 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.9.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.24.9-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.9-r0: task do_configure: Succeeded
NOTE: Running task 3386 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.9.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.24.9-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-1.24.9-r0: task do_package: Succeeded
NOTE: Running task 3387 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.9.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.24.9-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.24.9-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.9.bb:do_packagedata unihash changed to cd6d24e725b6ec6c15bf950e62e9860b5187d7747daac938d0bad1553de4375c
NOTE: Setscene tasks completed
NOTE: Running task 3388 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.9.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-1.24.9-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-1.24.9-r0: task do_create_spdx: Succeeded
NOTE: Running task 3389 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.9.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-base-1.24.9-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vala-0.56.17-r0: task do_compile: Succeeded
NOTE: Running task 3390 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_install)
NOTE: recipe vala-0.56.17-r0: task do_install: Started
NOTE: recipe vala-0.56.17-r0: task do_install: Succeeded
NOTE: Running task 3391 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_populate_sysroot)
NOTE: Running task 3392 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_package)
NOTE: recipe vala-0.56.17-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.56.17-r0: task do_package: Started
NOTE: recipe vala-0.56.17-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3393 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3394 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libical-3.0.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.58.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libical-3.0.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3395 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_configure)
NOTE: recipe libical-3.0.18-r0: task do_configure: Started
NOTE: recipe librsvg-2.58.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3396 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.2.bb:do_rust_create_wrappers)
NOTE: recipe librsvg-2.58.2-r0: task do_rust_create_wrappers: Started
NOTE: recipe librsvg-2.58.2-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 3397 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.2.bb:do_configure)
NOTE: recipe librsvg-2.58.2-r0: task do_configure: Started
NOTE: recipe vala-0.56.17-r0: task do_package: Succeeded
NOTE: Running task 3398 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_packagedata)
NOTE: recipe vala-0.56.17-r0: task do_packagedata: Started
NOTE: recipe vala-0.56.17-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_packagedata unihash changed to f1e93a99a3db4ff6a0a5e651b3b606accd6d86a4c8c6f01e2b48f11f4b04b166
NOTE: Setscene tasks completed
NOTE: Running task 3399 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_create_spdx)
NOTE: recipe vala-0.56.17-r0: task do_create_spdx: Started
NOTE: recipe vala-0.56.17-r0: task do_create_spdx: Succeeded
NOTE: Running task 3400 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.2.bb:do_collect_spdx_deps)
NOTE: Running task 3401 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_collect_spdx_deps)
NOTE: recipe libical-3.0.18-r0: task do_collect_spdx_deps: Started
NOTE: recipe librsvg-2.58.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libical-3.0.18-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe librsvg-2.58.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gtk+3-3.24.43-r0: task do_compile: Succeeded
NOTE: Running task 3402 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_install)
NOTE: recipe gtk+3-3.24.43-r0: task do_install: Started
NOTE: recipe libical-3.0.18-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3403 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_compile)
NOTE: recipe libical-3.0.18-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_install: Succeeded
NOTE: Running task 3404 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_package)
NOTE: Running task 3405 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_populate_sysroot)
NOTE: recipe gtk+3-3.24.43-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.58.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3406 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.2.bb:do_compile)
NOTE: recipe gtk+3-3.24.43-r0: task do_populate_sysroot: Succeeded
NOTE: recipe librsvg-2.58.2-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.9-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3407 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.9.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.24.9-r0: task do_install: Started
NOTE: recipe libical-3.0.18-r0: task do_compile: Succeeded
NOTE: Running task 3408 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_install)
NOTE: recipe libical-3.0.18-r0: task do_install: Started
NOTE: recipe libical-3.0.18-r0: task do_install: Succeeded
NOTE: Running task 3409 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_populate_sysroot)
NOTE: Running task 3410 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_package)
NOTE: recipe libical-3.0.18-r0: task do_populate_sysroot: Started
NOTE: recipe libical-3.0.18-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.9-r0: task do_install: Succeeded
NOTE: Running task 3411 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.9.bb:do_populate_sysroot)
NOTE: Running task 3412 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.9.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.24.9-r0: task do_populate_sysroot: Started
NOTE: recipe libical-3.0.18-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3413 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.24.9-r0: task do_package: Started
NOTE: recipe bluez5-5.79-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bluez5-5.79-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3414 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_configure)
NOTE: recipe bluez5-5.79-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libical-3.0.18-r0: task do_package: Succeeded
NOTE: Running task 3415 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_packagedata)
NOTE: recipe libical-3.0.18-r0: task do_packagedata: Started
NOTE: recipe libical-3.0.18-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_packagedata unihash changed to 1b93ab29a666f612cf3a28f84ac0c63190488381da7ef4eb71429adf364ba085
NOTE: Setscene tasks completed
NOTE: Running task 3416 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_create_spdx)
NOTE: recipe libical-3.0.18-r0: task do_create_spdx: Started
NOTE: recipe libical-3.0.18-r0: task do_create_spdx: Succeeded
NOTE: Running task 3417 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_collect_spdx_deps)
NOTE: recipe bluez5-5.79-r0: task do_collect_spdx_deps: Started
NOTE: recipe bluez5-5.79-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe bluez5-5.79-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3418 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_configure_ptest_base)
NOTE: recipe bluez5-5.79-r0: task do_configure_ptest_base: Started
NOTE: recipe bluez5-5.79-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3419 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_compile)
NOTE: recipe bluez5-5.79-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_package: Succeeded
NOTE: Running task 3420 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.43-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_packagedata unihash changed to 52040a681b00d9e909cc7d913213aa7d03827332b5e4b37795c65be64c51c00a
NOTE: Setscene tasks completed
NOTE: Running task 3421 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_create_spdx)
NOTE: recipe gtk+3-3.24.43-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.9-r0: task do_package: Succeeded
NOTE: Running task 3422 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.9.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.24.9-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.9-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.9.bb:do_packagedata unihash changed to 9ca624bb7ca6a1289d071a81c335f6745f2859171f3f33bfb66d249f7a8b27a0
NOTE: Setscene tasks completed
NOTE: Running task 3423 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.9.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-base-1.24.9-r0: task do_create_spdx: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.9-r0: task do_create_spdx: Succeeded
NOTE: recipe bluez5-5.79-r0: task do_compile: Succeeded
NOTE: Running task 3424 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_compile_ptest_base)
NOTE: recipe bluez5-5.79-r0: task do_compile_ptest_base: Started
NOTE: recipe librsvg-2.58.2-r0: task do_compile: Succeeded
NOTE: Running task 3425 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.2.bb:do_install)
NOTE: recipe librsvg-2.58.2-r0: task do_install: Started
NOTE: recipe librsvg-2.58.2-r0: task do_install: Succeeded
NOTE: Running task 3426 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.2.bb:do_populate_sysroot)
NOTE: Running task 3427 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.2.bb:do_package)
NOTE: recipe librsvg-2.58.2-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.58.2-r0: task do_package: Started
NOTE: recipe librsvg-2.58.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe librsvg-2.58.2-r0: task do_package: Succeeded
NOTE: Running task 3428 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.2.bb:do_packagedata)
NOTE: recipe librsvg-2.58.2-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.58.2-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.2.bb:do_packagedata unihash changed to 9afe3068d17aa5aaa0a8e1b202090dd548cf042e54f324406cd871f0e8571698
NOTE: Setscene tasks completed
NOTE: Running task 3429 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.2.bb:do_create_spdx)
NOTE: recipe librsvg-2.58.2-r0: task do_create_spdx: Started
NOTE: recipe bluez5-5.79-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3430 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_install)
NOTE: recipe bluez5-5.79-r0: task do_install: Started
NOTE: recipe librsvg-2.58.2-r0: task do_create_spdx: Succeeded
NOTE: recipe bluez5-5.79-r0: task do_install: Succeeded
NOTE: Running task 3431 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_install_ptest_base)
NOTE: recipe bluez5-5.79-r0: task do_install_ptest_base: Started
NOTE: recipe bluez5-5.79-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3432 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_populate_sysroot)
NOTE: Running task 3433 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_package)
NOTE: recipe bluez5-5.79-r0: task do_populate_sysroot: Started
NOTE: recipe bluez5-5.79-r0: task do_package: Started
NOTE: recipe bluez5-5.79-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3434 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3435 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.9.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.9-r0: task do_configure: Started
NOTE: recipe bluez5-5.79-r0: task do_package: Succeeded
NOTE: Running task 3436 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_packagedata)
NOTE: recipe bluez5-5.79-r0: task do_packagedata: Started
NOTE: recipe bluez5-5.79-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_packagedata unihash changed to 118cf54819461d14520b27cdf43672e22851f089ca60285cdee0235c52c38be6
NOTE: Setscene tasks completed
NOTE: Running task 3437 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_create_spdx)
NOTE: recipe bluez5-5.79-r0: task do_create_spdx: Started
NOTE: recipe bluez5-5.79-r0: task do_create_spdx: Succeeded
NOTE: Running task 3438 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.9.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.9-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.24.9-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3439 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.9.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.9-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.9-r0: task do_compile: Succeeded
NOTE: Running task 3440 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.9.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.9-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.9-r0: task do_install: Succeeded
NOTE: Running task 3441 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.9.bb:do_populate_sysroot)
NOTE: Running task 3442 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.9.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.9-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.9-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.9-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3443 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk4-4.16.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk4-4.16.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3444 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.7.bb:do_configure)
NOTE: recipe gtk4-4.16.7-r0: task do_configure: Started
NOTE: recipe gtk4-4.16.7-r0: task do_configure: Succeeded
NOTE: Running task 3445 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.7.bb:do_compile)
NOTE: recipe gtk4-4.16.7-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.9-r0: task do_package: Succeeded
NOTE: Running task 3446 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.9.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.9-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.9-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.9.bb:do_packagedata unihash changed to 51dac59d00d07dc7125f54119e87c346b312d025a9e54293f5ff1297c8383f13
NOTE: Setscene tasks completed
NOTE: Running task 3447 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.9.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.9-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.9-r0: task do_create_spdx: Succeeded
NOTE: Running task 3448 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.7.bb:do_collect_spdx_deps)
NOTE: recipe gtk4-4.16.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe gtk4-4.16.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gtk4-4.16.7-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3449 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.7.bb:do_install)
NOTE: recipe gtk4-4.16.7-r0: task do_install: Started
NOTE: recipe gtk4-4.16.7-r0: task do_install: Succeeded
NOTE: Running task 3450 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.7.bb:do_package)
NOTE: Running task 3451 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.7.bb:do_populate_sysroot)
NOTE: recipe gtk4-4.16.7-r0: task do_package: Started
NOTE: recipe gtk4-4.16.7-r0: task do_populate_sysroot: Started
NOTE: recipe gtk4-4.16.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3452 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe vte-0.78.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vte-0.78.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3453 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.2.bb:do_configure)
NOTE: recipe vte-0.78.2-r0: task do_configure: Started
NOTE: recipe vte-0.78.2-r0: task do_configure: Succeeded
NOTE: Running task 3454 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.2.bb:do_compile)
NOTE: recipe vte-0.78.2-r0: task do_compile: Started
NOTE: recipe gtk4-4.16.7-r0: task do_package: Succeeded
NOTE: Running task 3455 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.7.bb:do_packagedata)
NOTE: recipe gtk4-4.16.7-r0: task do_packagedata: Started
NOTE: recipe gtk4-4.16.7-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.7.bb:do_packagedata unihash changed to 7a555b5f828dcf74525a6ab5791450465635fae83bf12b8a61310ddc8321fc17
NOTE: Setscene tasks completed
NOTE: Running task 3456 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.7.bb:do_create_spdx)
NOTE: recipe gtk4-4.16.7-r0: task do_create_spdx: Started
NOTE: recipe gtk4-4.16.7-r0: task do_create_spdx: Succeeded
NOTE: Running task 3457 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.2.bb:do_collect_spdx_deps)
NOTE: recipe vte-0.78.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe vte-0.78.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vte-0.78.2-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3458 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.2.bb:do_install)
NOTE: recipe vte-0.78.2-r0: task do_install: Started
NOTE: recipe vte-0.78.2-r0: task do_install: Succeeded
NOTE: Running task 3459 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.2.bb:do_package)
NOTE: Running task 3460 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.2.bb:do_populate_sysroot)
NOTE: recipe vte-0.78.2-r0: task do_package: Started
NOTE: recipe vte-0.78.2-r0: task do_populate_sysroot: Started
NOTE: recipe vte-0.78.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vte-0.78.2-r0: task do_package: Succeeded
NOTE: Running task 3461 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.2.bb:do_packagedata)
NOTE: recipe vte-0.78.2-r0: task do_packagedata: Started
NOTE: recipe vte-0.78.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3462 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.2.bb:do_create_spdx)
NOTE: Running task 3463 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.2.bb:do_package_write_ipk)
NOTE: Running task 3464 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.2.bb:do_package_write_deb)
NOTE: Running task 3465 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.2.bb:do_package_write_rpm)
NOTE: recipe vte-0.78.2-r0: task do_create_spdx: Started
NOTE: Running task 3466 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.2.bb:do_package_qa)
NOTE: recipe vte-0.78.2-r0: task do_package_write_ipk: Started
NOTE: recipe vte-0.78.2-r0: task do_package_write_deb: Started
NOTE: recipe vte-0.78.2-r0: task do_package_write_rpm: Started
NOTE: recipe vte-0.78.2-r0: task do_package_qa: Started
NOTE: recipe vte-0.78.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3467 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.2.bb:do_create_package_spdx)
NOTE: recipe vte-0.78.2-r0: task do_create_package_spdx: Started
NOTE: recipe vte-0.78.2-r0: task do_package_qa: Succeeded
NOTE: recipe vte-0.78.2-r0: task do_create_package_spdx: Succeeded
NOTE: recipe vte-0.78.2-r0: task do_package_write_ipk: Succeeded
NOTE: recipe vte-0.78.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vte-0.78.2-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 3468 of 3468 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.2.bb:do_build)
NOTE: Tasks Summary: Attempted 3468 tasks of which 3273 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 17 ERROR messages, returning a non-zero exit code.
ERROR: bash-completion-2.14.0-r0 do_packagedata_setscene: QA Issue: Package version for package bash-completion-src went backwards which would break package feeds (from 0:2.15.0-r0 to 0:2.14.0-r0) [version-going-backwards]
ERROR: bash-completion-2.14.0-r0 do_packagedata_setscene: QA Issue: Package version for package bash-completion-dbg went backwards which would break package feeds (from 0:2.15.0-r0 to 0:2.14.0-r0) [version-going-backwards]
ERROR: bash-completion-2.14.0-r0 do_packagedata_setscene: QA Issue: Package version for package bash-completion-extra went backwards which would break package feeds (from 0:2.15.0-r0 to 0:2.14.0-r0) [version-going-backwards]
ERROR: bash-completion-2.14.0-r0 do_packagedata_setscene: QA Issue: Package version for package bash-completion-staticdev went backwards which would break package feeds (from 0:2.15.0-r0 to 0:2.14.0-r0) [version-going-backwards]
ERROR: bash-completion-2.14.0-r0 do_packagedata_setscene: QA Issue: Package version for package bash-completion-dev went backwards which would break package feeds (from 0:2.15.0-r0 to 0:2.14.0-r0) [version-going-backwards]
ERROR: bash-completion-2.14.0-r0 do_packagedata_setscene: QA Issue: Package version for package bash-completion-doc went backwards which would break package feeds (from 0:2.15.0-r0 to 0:2.14.0-r0) [version-going-backwards]
ERROR: bash-completion-2.14.0-r0 do_packagedata_setscene: QA Issue: Package version for package bash-completion-locale went backwards which would break package feeds (from 0:2.15.0-r0 to 0:2.14.0-r0) [version-going-backwards]
ERROR: bash-completion-2.14.0-r0 do_packagedata_setscene: QA Issue: Package version for package bash-completion went backwards which would break package feeds (from 0:2.15.0-r0 to 0:2.14.0-r0) [version-going-backwards]
ERROR: bash-completion-2.14.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: sqlite3-3_3.47.0-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3-src went backwards which would break package feeds (from 3:3.47.1-r0 to 3:3.47.0-r0) [version-going-backwards]
ERROR: sqlite3-3_3.47.0-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3-dbg went backwards which would break package feeds (from 3:3.47.1-r0 to 3:3.47.0-r0) [version-going-backwards]
ERROR: sqlite3-3_3.47.0-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3 went backwards which would break package feeds (from 3:3.47.1-r0 to 3:3.47.0-r0) [version-going-backwards]
ERROR: sqlite3-3_3.47.0-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-dev went backwards which would break package feeds (from 3:3.47.1-r0 to 3:3.47.0-r0) [version-going-backwards]
ERROR: sqlite3-3_3.47.0-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-doc went backwards which would break package feeds (from 3:3.47.1-r0 to 3:3.47.0-r0) [version-going-backwards]
ERROR: sqlite3-3_3.47.0-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-staticdev went backwards which would break package feeds (from 3:3.47.1-r0 to 3:3.47.0-r0) [version-going-backwards]
ERROR: sqlite3-3_3.47.0-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3 went backwards which would break package feeds (from 3:3.47.1-r0 to 3:3.47.0-r0) [version-going-backwards]
ERROR: sqlite3-3_3.47.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============0085569250991295487==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/vte/libvte: FILELIST: removed "/usr/lib/libvte-2.91.so.0.7800.1", added "/usr/lib/libvte-2.91.so.0.7800.2"
Changes to packages/core2-64-poky-linux/vte (sysroot):
  /usr/lib/libvte-2.91.so.0 changed symlink target from libvte-2.91.so.0.7800.1 to libvte-2.91.so.0.7800.2
  /usr/lib/libvte-2.91.so.0.7800.1 moved to /usr/lib/libvte-2.91.so.0.7800.2

--===============0085569250991295487==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vte-upgrade-0.78.1-0.78.2.patch"

RnJvbSA1NDEwMDkyODk2NjY4Y2MwNzQzOTg3ZGQ2N2E4NjAyY2YyMTk2NWU5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBEZWMgMjAyNCAxMDowNTo0NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZ0
ZTogdXBncmFkZSAwLjc4LjEgLT4gMC43OC4yCgotLS0KIC4uLjAwMDEtQWRkLVdfRVhJVENPREUt
bWFjcm8tZm9yLW5vbi1nbGliYy1zeXN0ZW1zLnBhdGNoIHwgNCArKy0tCiBtZXRhL3JlY2lwZXMt
c3VwcG9ydC92dGUvdnRlLzAwMDItbGliLVR5cG8tZml4LnBhdGNoICAgICB8IDQgKystLQogLi4u
ZmxvYXQtQWRkLXNpbmdsZS1oZWFkZXItbGlicmFyeS1mb3ItZnJvbV9jaGFyLWkucGF0Y2ggfCA4
ICsrKystLS0tCiAuLi4tcGFyc2VyLVVzZS1mYXN0X2Zsb2F0LWltcGxlbWVudGF0aW9uLWZvci1m
cm9tXy5wYXRjaCB8IDkgKysrKy0tLS0tCiAuLi4vcmVjaXBlcy1zdXBwb3J0L3Z0ZS97dnRlXzAu
NzguMS5iYiA9PiB2dGVfMC43OC4yLmJifSB8IDIgKy0KIDUgZmlsZXMgY2hhbmdlZCwgMTMgaW5z
ZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLXN1cHBvcnQv
dnRlL3t2dGVfMC43OC4xLmJiID0+IHZ0ZV8wLjc4LjIuYmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLXN1cHBvcnQvdnRlL3Z0ZS8wMDAxLUFkZC1XX0VYSVRDT0RFLW1hY3JvLWZv
ci1ub24tZ2xpYmMtc3lzdGVtcy5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGUv
MDAwMS1BZGQtV19FWElUQ09ERS1tYWNyby1mb3Itbm9uLWdsaWJjLXN5c3RlbXMucGF0Y2gKaW5k
ZXggZTJjZmY2Y2Y3Ni4uMDVjZGE3MTFkMiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBv
cnQvdnRlL3Z0ZS8wMDAxLUFkZC1XX0VYSVRDT0RFLW1hY3JvLWZvci1ub24tZ2xpYmMtc3lzdGVt
cy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC92dGUvdnRlLzAwMDEtQWRkLVdfRVhJ
VENPREUtbWFjcm8tZm9yLW5vbi1nbGliYy1zeXN0ZW1zLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAot
RnJvbSBiODc5NWRkYTYyOTYxNGNkODQyZmNiYTFjNGI1MGJlNzU5YzIwZGE0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQorRnJvbSBlNWE0YWYyMzU2NzM1MDZjMzJlMmE2MDM4MTdjMDI2MzAyMjA5
ZGU5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogRGFuaWxvIFNwaW5lbGxhIDxkYW55
c3Bpbjk3QHByb3Rvbm1haWwuY29tPgogRGF0ZTogVGh1LCAyMSBNYXIgMjAxOSAxNDoxOToyNiAr
MDEwMAogU3ViamVjdDogW1BBVENIXSBBZGQgV19FWElUQ09ERSBtYWNybyBmb3Igbm9uLWdsaWJj
IHN5c3RlbXMKQEAgLTE2LDcgKzE2LDcgQEAgU2lnbmVkLW9mZi1ieTogQW5kcmVhcyBNw7xsbGVy
IDxzY2huaXR6ZWx0b255QGdtYWlsLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25z
KCspCiAKIGRpZmYgLS1naXQgYS9zcmMvd2lkZ2V0LmNjIGIvc3JjL3dpZGdldC5jYwotaW5kZXgg
YjhkYWE1Yy4uYzM1Nzk2MCAxMDA2NDQKK2luZGV4IDY2OTU1YTYuLmIzNTJjMTEgMTAwNjQ0CiAt
LS0gYS9zcmMvd2lkZ2V0LmNjCiArKysgYi9zcmMvd2lkZ2V0LmNjCiBAQCAtMTYsNiArMTYsMTAg
QEAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGUvMDAwMi1saWItVHlw
by1maXgucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC92dGUvdnRlLzAwMDItbGliLVR5cG8t
Zml4LnBhdGNoCmluZGV4IDQxMGQ1MDY4MDYuLjhhYzVkYmVhYTEgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGUvMDAwMi1saWItVHlwby1maXgucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvdnRlL3Z0ZS8wMDAyLWxpYi1UeXBvLWZpeC5wYXRjaApAQCAtMSw3
ICsxLDcgQEAKLUZyb20gNmI3NDQwOTk2ODE5YzEyZWMzMmJmYWY0ZTczYjI3YmFlYjI3MzIwNyBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gY2RlNjRiMWJhYjg2M2YzMjIwOWU1ZjQ0MTcy
MjIyZTQ0YTNiMzQ3MiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IENocmlzdGlhbiBQ
ZXJzY2ggPGNocGVAc3JjLmdub21lLm9yZz4KIERhdGU6IFRodSwgNSBTZXAgMjAyNCAyMzo1OTow
NSArMDIwMAotU3ViamVjdDogW1BBVENIIDIvM10gbGliOiBUeXBvIGZpeAorU3ViamVjdDogW1BB
VENIXSBsaWI6IFR5cG8gZml4CiAKIEZpeGVzOiBodHRwczovL2dpdGxhYi5nbm9tZS5vcmcvR05P
TUUvdnRlLy0vaXNzdWVzLzI4MTYKIFVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQgW2h0dHBzOi8v
Z2l0bGFiLmdub21lLm9yZy9HTk9NRS92dGUvLS9jb21taXQvZTI0MDg3ZDk1M2Q5MzUyYzhiYzQ2
MDc0ZTI2NjJjODBmOWJmYmMyZF0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0
ZS92dGUvMDAwNC1mYXN0X2Zsb2F0LUFkZC1zaW5nbGUtaGVhZGVyLWxpYnJhcnktZm9yLWZyb21f
Y2hhci1pLnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvdnRlL3Z0ZS8wMDA0LWZhc3RfZmxv
YXQtQWRkLXNpbmdsZS1oZWFkZXItbGlicmFyeS1mb3ItZnJvbV9jaGFyLWkucGF0Y2gKaW5kZXgg
NzMxZGJhNzI5ZC4uMjliOGU5NzNiMiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQv
dnRlL3Z0ZS8wMDA0LWZhc3RfZmxvYXQtQWRkLXNpbmdsZS1oZWFkZXItbGlicmFyeS1mb3ItZnJv
bV9jaGFyLWkucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvdnRlL3Z0ZS8wMDA0LWZh
c3RfZmxvYXQtQWRkLXNpbmdsZS1oZWFkZXItbGlicmFyeS1mb3ItZnJvbV9jaGFyLWkucGF0Y2gK
QEAgLTEsNyArMSw3IEBACi1Gcm9tIDJhMzJlNDNlNDNiMDQ3NzFhMzM1N2QzZDRjY2JhZmE3NzE0
ZTAxMTQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDFiODRkZWIwMTQ4ZThhODMzOTYz
NTRhZjc1YzIxZWRjZWQxZWQ0MTEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVt
IFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogRGF0ZTogRnJpLCA0IE9jdCAyMDI0IDIxOjIxOjEx
IC0wNzAwCi1TdWJqZWN0OiBbUEFUQ0ggNC81XSBmYXN0X2Zsb2F0OiBBZGQgc2luZ2xlIGhlYWRl
ciBsaWJyYXJ5IGZvciBmcm9tX2NoYXIKK1N1YmplY3Q6IFtQQVRDSF0gZmFzdF9mbG9hdDogQWRk
IHNpbmdsZSBoZWFkZXIgbGlicmFyeSBmb3IgZnJvbV9jaGFyCiAgaW1wbGVtZW50YXRpb24KIAog
RG9jdW1lbnQgdGhlIHByb2Nlc3MgdG8gcmUtZ2VuZXJhdGUgdGhlIGZpbGUgd2hlbmV2ZXIgbmV3
IHJlbGVhc2UKQEAgLTE4LDcgKzE4LDcgQEAgU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5r
aGVtQGdtYWlsLmNvbT4KICBjcmVhdGUgbW9kZSAxMDA2NDQgc3JjL2Zhc3RfZmxvYXQuaGgKIAog
ZGlmZiAtLWdpdCBhL1JFQURNRS5tZCBiL1JFQURNRS5tZAotaW5kZXggYTMyNDY1YTkuLjIwZWQ1
YmEyIDEwMDY0NAoraW5kZXggYTMyNDY1YS4uMjBlZDViYSAxMDA2NDQKIC0tLSBhL1JFQURNRS5t
ZAogKysrIGIvUkVBRE1FLm1kCiBAQCAtMjEsNiArMjEsMjMgQEAgb24gZG93bmxvYWQuZ25vbWUu
b3JnLCBidXQgcGxlYXNlIG5vdGUgdGhhdCBhbnkgdGFyYmFsbCBmb3IgcmVsZWFzZXMKQEAgLTQ3
LDcgKzQ3LDcgQEAgaW5kZXggYTMyNDY1YTkuLjIwZWQ1YmEyIDEwMDY0NAogIAogZGlmZiAtLWdp
dCBhL3NyYy9mYXN0X2Zsb2F0LmhoIGIvc3JjL2Zhc3RfZmxvYXQuaGgKIG5ldyBmaWxlIG1vZGUg
MTAwNjQ0Ci1pbmRleCAwMDAwMDAwMC4uZTBkNWRkNTMKK2luZGV4IDAwMDAwMDAuLmUwZDVkZDUK
IC0tLSAvZGV2L251bGwKICsrKyBiL3NyYy9mYXN0X2Zsb2F0LmhoCiBAQCAtMCwwICsxLDM4Njkg
QEAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGUvMDAwNS1jb2xvci1w
YXJzZXItVXNlLWZhc3RfZmxvYXQtaW1wbGVtZW50YXRpb24tZm9yLWZyb21fLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvdnRlL3Z0ZS8wMDA1LWNvbG9yLXBhcnNlci1Vc2UtZmFzdF9mbG9h
dC1pbXBsZW1lbnRhdGlvbi1mb3ItZnJvbV8ucGF0Y2gKaW5kZXggYjk1MWJiYWMxOC4uZDQyZTUy
Y2RlNCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvdnRlL3Z0ZS8wMDA1LWNvbG9y
LXBhcnNlci1Vc2UtZmFzdF9mbG9hdC1pbXBsZW1lbnRhdGlvbi1mb3ItZnJvbV8ucGF0Y2gKKysr
IGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvdnRlL3Z0ZS8wMDA1LWNvbG9yLXBhcnNlci1Vc2UtZmFz
dF9mbG9hdC1pbXBsZW1lbnRhdGlvbi1mb3ItZnJvbV8ucGF0Y2gKQEAgLTEsOCArMSw3IEBACi1G
cm9tIDA4YjkwZDBhNWJmOGNlYjY4ZGQxYjRlOWRlZDBmOGEyYjUyODdhNmUgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIDE5ZTZlZjBjYjQ5NDg0NDlkYmYyN2ZmZGIyNDQzNGMxYjgzYmQz
NTAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21h
aWwuY29tPgogRGF0ZTogRnJpLCA0IE9jdCAyMDI0IDIxOjIyOjUyIC0wNzAwCi1TdWJqZWN0OiBb
UEFUQ0ggNS81XSBjb2xvci1wYXJzZXI6IFVzZSBmYXN0X2Zsb2F0IGltcGxlbWVudGF0aW9uIGZv
cgotIGZyb21fY2hhcnMKK1N1YmplY3Q6IFtQQVRDSF0gY29sb3ItcGFyc2VyOiBVc2UgZmFzdF9m
bG9hdCBpbXBsZW1lbnRhdGlvbiBmb3IgZnJvbV9jaGFycwogCiBSZW1vdmVkIGRlcGVuZGVuY3kg
b24gYysrIHJ1bnRpbWUgdG8gcHJvdmlkZSBpdC4KIApAQCAtMTYsNyArMTUsNyBAQCBTaWduZWQt
b2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogIDIgZmlsZXMgY2hhbmdlZCwg
MTIgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9zcmMvY29s
b3ItcGFyc2VyLmNjIGIvc3JjL2NvbG9yLXBhcnNlci5jYwotaW5kZXggMDJlYzVkM2EuLjQyYzUx
OTY2IDEwMDY0NAoraW5kZXggMDJlYzVkMy4uNDJjNTE5NiAxMDA2NDQKIC0tLSBhL3NyYy9jb2xv
ci1wYXJzZXIuY2MKICsrKyBiL3NyYy9jb2xvci1wYXJzZXIuY2MKIEBAIC0xNyw3ICsxNyw3IEBA
CkBAIC02NCw3ICs2Myw3IEBAIGluZGV4IDAyZWM1ZDNhLi40MmM1MTk2NiAxMDA2NDQKICAgICAg
ICAgICAgICAgICAgICAgICAgICByZXR1cm4gc3RkOjpudWxsb3B0OwogIAogZGlmZiAtLWdpdCBh
L3NyYy90ZXJtcHJvcHMuaGggYi9zcmMvdGVybXByb3BzLmhoCi1pbmRleCAwZDNmMGY0Yy4uYTEw
ZmM3ZDEgMTAwNjQ0CitpbmRleCAwZDNmMGY0Li5hMTBmYzdkIDEwMDY0NAogLS0tIGEvc3JjL3Rl
cm1wcm9wcy5oaAogKysrIGIvc3JjL3Rlcm1wcm9wcy5oaAogQEAgLTE3LDYgKzE3LDcgQEAKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGVfMC43OC4xLmJiIGIvbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvdnRlL3Z0ZV8wLjc4LjIuYmIKc2ltaWxhcml0eSBpbmRleCA5NiUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvdnRlL3Z0ZV8wLjc4LjEuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGVfMC43OC4yLmJiCmluZGV4IDU3MjNmMzViODMu
LjE4MmEzMDczYzQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGVfMC43
OC4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGVfMC43OC4yLmJiCkBAIC0y
Miw3ICsyMiw3IEBAIFNSQ19VUkkgKz0gImZpbGU6Ly8wMDAxLUFkZC1XX0VYSVRDT0RFLW1hY3Jv
LWZvci1ub24tZ2xpYmMtc3lzdGVtcy5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDA0LWZh
c3RfZmxvYXQtQWRkLXNpbmdsZS1oZWFkZXItbGlicmFyeS1mb3ItZnJvbV9jaGFyLWkucGF0Y2gg
XAogICAgICAgICAgICBmaWxlOi8vMDAwNS1jb2xvci1wYXJzZXItVXNlLWZhc3RfZmxvYXQtaW1w
bGVtZW50YXRpb24tZm9yLWZyb21fLnBhdGNoIFwKICAgICAgICAgICAgIgotU1JDX1VSSVthcmNo
aXZlLnNoYTI1NnN1bV0gPSAiNjQ5OWQyNTE3OTMxNTI1NWY5YmNmY2UwM2M2NmZiODRjMDNhZDMy
NWRlYTIzZDBlMzcyMTc4NTIxZWNhNDJiNSIKK1NSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0g
IjM1ZDdiY2RlMDczNTY4NDZiNGExMjg4MWM4ZTAxNjcwNWI3MGE5MDA0YTkwODIyODVlZWU1ODM0
Y2NjNDk4OTAiCiAKIEFOWV9PRl9ESVNUUk9fRkVBVFVSRVMgPSAiJHtHVEszRElTVFJPRkVBVFVS
RVN9IgogCi0tIAoyLjQ0LjEKCg==

--===============0085569250991295487==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/vte: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte: SRC_URI changed from "https://download.gnome.org/sources//vte/0.78/vte-0.78.1.tar.xz;name=archive file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch file://0002-lib-Typo-fix.patch file://0004-fast_float-Add-single-header-library-for-from_char-i.patch file://0005-color-parser-Use-fast_float-implementation-for-from_.patch" to "https://download.gnome.org/sources//vte/0.78/vte-0.78.2.tar.xz;name=archive file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch file://0002-lib-Typo-fix.patch file://0004-fast_float-Add-single-header-library-for-from_char-i.patch file://0005-color-parser-Use-fast_float-implementation-for-from_.patch"
packages/core2-64-poky-linux/vte/libvte-gtk4: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/libvte-gtk4: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/libvte: FILELIST: removed "/usr/lib/libvte-2.91.so.0.7800.1", added "/usr/lib/libvte-2.91.so.0.7800.2"
packages/core2-64-poky-linux/vte/libvte: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/libvte: PV changed from "0.78.1" to "0.78.2"
Changes to packages/core2-64-poky-linux/vte (sysroot):
  /usr/lib/libvte-2.91.so.0 changed symlink target from libvte-2.91.so.0.7800.1 to libvte-2.91.so.0.7800.2
  /usr/lib/libvte-2.91.so.0.7800.1 moved to /usr/lib/libvte-2.91.so.0.7800.2
packages/core2-64-poky-linux/vte/vte-dbg: PKGSIZE changed from 21699464 to 21699480 (+0%)
packages/core2-64-poky-linux/vte/vte-dbg: FILELIST: removed "/usr/lib/.debug/libvte-2.91.so.0.7800.1", added "/usr/lib/.debug/libvte-2.91.so.0.7800.2"
packages/core2-64-poky-linux/vte/vte-dbg: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-dbg: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-dev: PKGSIZE changed from 573026 to 573044 (+0%)
packages/core2-64-poky-linux/vte/vte-dev: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-dev: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-doc: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-doc: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-gtk4-dev: PKGSIZE changed from 551863 to 551881 (+0%)
packages/core2-64-poky-linux/vte/vte-gtk4-dev: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-gtk4-dev: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-gtk4: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-gtk4: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-ab: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-ab: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-am: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-am: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-an: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-an: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-ang: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-ang: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-ar: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-ar: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-as: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-as: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-ast: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-ast: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-az: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-az: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-be+latin: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-be+latin: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-be: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-be: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-bg: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-bg: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-bn-in: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-bn-in: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-bn: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-bn: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-bs: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-bs: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-ca+valencia: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-ca+valencia: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-ca: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-ca: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-ckb: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-ckb: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-cs: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-cs: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-cy: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-cy: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-da: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-da: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-de: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-de: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-dz: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-dz: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-el: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-el: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-en+shaw: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-en+shaw: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-en-ca: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-en-ca: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-en-gb: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-en-gb: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-eo: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-eo: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-es: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-es: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-et: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-et: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-eu: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-eu: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-fa: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-fa: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-fi: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-fi: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-fr: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-fr: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-fur: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-fur: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-ga: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-ga: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-gd: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-gd: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-gl: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-gl: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-gu: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-gu: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-he: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-he: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-hi: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-hi: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-hr: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-hr: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-hu: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-hu: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-id: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-id: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-is: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-is: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-it: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-it: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-ja: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-ja: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-ka: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-ka: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-kab: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-kab: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-kk: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-kk: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-kn: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-kn: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-ko: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-ko: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-ku: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-ku: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-ky: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-ky: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-li: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-li: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-lt: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-lt: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-lv: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-lv: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-mai: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-mai: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-mi: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-mi: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-mjw: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-mjw: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-mk: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-mk: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-ml: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-ml: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-mn: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-mn: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-mr: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-mr: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-ms: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-ms: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-nb: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-nb: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-nds: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-nds: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-ne: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-ne: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-nl: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-nl: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-nn: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-nn: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-oc: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-oc: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-or: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-or: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-pa: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-pa: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-pl: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-pl: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-pt-br: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-pt-br: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-pt: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-pt: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-ro: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-ro: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-ru: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-ru: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-rw: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-rw: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-si: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-si: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-sk: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-sk: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-sl: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-sl: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-sq: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-sq: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-sr+latin: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-sr+latin: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-sr: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-sr: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-sv: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-sv: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-ta: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-ta: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-te: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-te: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-tg: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-tg: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-th: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-th: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-tr: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-tr: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-ug: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-ug: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-uk: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-uk: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-uz+cyrillic: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-uz+cyrillic: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-vi: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-vi: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-wa: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-wa: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-xh: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-xh: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-zh-cn: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-zh-cn: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-zh-hk: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-zh-hk: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-locale-zh-tw: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-zh-tw: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-prompt: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-prompt: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-src: PKGSIZE changed from 3441478 to 3441877 (+0%)
packages/core2-64-poky-linux/vte/vte-src: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-src: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte-staticdev: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte-staticdev: PV changed from "0.78.1" to "0.78.2"
packages/core2-64-poky-linux/vte/vte: PKGV changed from 0.78.1 [default] to 0.78.2 [default]
packages/core2-64-poky-linux/vte/vte: PV changed from "0.78.1" to "0.78.2"

--===============0085569250991295487==--

