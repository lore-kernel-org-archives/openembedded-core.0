Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77419C61DD6
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 05:53:12 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1376.1788241989629145012
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Aug 2026 22:53:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=lIx/T6UT;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=tAXD57zz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101a05b874a8b-5517c663-2d71-4bf1-8008-0bc5f62b4e12-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1788241988;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ZfVBB3vAXW7qNwXuScXcxM1yBMZRhj3j4eKlyI5da88=;
	b=lIx/T6UTmx4eH2KaJSiKZIw8Hvi68fl7Z2qddFVIb66yNu8a6xy28VjMqfMEErTh
	nkPBYVFjAtaSg5EGvDaRjHr463TbpcJHvxy05obL2RjGpzBSigl2+QNMnebdu7cYp+D
	5zl1zDMWoDjtPo/fgPpBYrrWyu9P9ZpTjo9A8Sfk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1788241988;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ZfVBB3vAXW7qNwXuScXcxM1yBMZRhj3j4eKlyI5da88=;
	b=tAXD57zz5sZgMvH+2+yEltoO9EJVODGJDOk1+V9uBT3AYtMy95hFcuBfFUsNXJpi
	u+hBYksrp2u/QunYz6cbAzPMzDSPcw3cPDKEQ+kymp1x96X2vBV8x1qheRBl3wvWdiz
	UjWc/HwLg0VNaaB/2UqXheXZm5aiTIt3gQ4VVJXg=
Content-Type: multipart/mixed; boundary="===============8387795670115161492=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] librepo: upgrading to 1.21.0 SUCCEEDED
Message-ID: <010101a05b874a8b-5517c663-2d71-4bf1-8008-0bc5f62b4e12-000000@us-west-2.amazonses.com>
Date: Tue, 1 Sep 2026 05:53:08 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 05:53:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244787

--===============8387795670115161492==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sCgp0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFk
ZSBIZWxwZXIKdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBl
KHMpICpsaWJyZXBvKiB0byAqMS4yMS4wKiBoYXMgU3VjY2VlZGVkLgoKTmV4dCBzdGVwczoKICAg
IC0gYXBwbHkgdGhlIHBhdGNoOiBnaXQgYW0gMDAwMS1saWJyZXBvLXVwZ3JhZGUtMS4yMC4wLTEu
MjEuMC5wYXRjaAogICAgLSBjaGVjayB0aGUgY2hhbmdlcyB0byB1cHN0cmVhbSBwYXRjaGVzIGFu
ZCBzdW1tYXJpemUgdGhlbSBpbiB0aGUgY29tbWl0IG1lc3NhZ2UsCiAgICAtIGNvbXBpbGUgYW4g
aW1hZ2UgdGhhdCBjb250YWlucyB0aGUgcGFja2FnZQogICAgLSBwZXJmb3JtIHNvbWUgYmFzaWMg
c2FuaXR5IHRlc3RzCiAgICAtIGFtZW5kIHRoZSBwYXRjaCBhbmQgc2lnbiBpdCBvZmY6IGdpdCBj
b21taXQgLXMgLS1yZXNldC1hdXRob3IgLS1hbWVuZAogICAgLSBzZW5kIGl0IHRvIHRoZSBhcHBy
b3ByaWF0ZSBtYWlsaW5nIGxpc3QKCkFsdGVybmF0aXZlbHksIGlmIHlvdSBiZWxpZXZlIHRoZSBy
ZWNpcGUgc2hvdWxkIG5vdCBiZSB1cGdyYWRlZCBhdCB0aGlzIHRpbWUsCnlvdSBjYW4gZmlsbCBS
RUNJUEVfTk9fVVBEQVRFX1JFQVNPTiBpbiByZXNwZWN0aXZlIHJlY2lwZSBmaWxlIHNvIHRoYXQK
YXV0b21hdGljIHVwZ3JhZGVzIHdvdWxkIG5vIGxvbmdlciBiZSBhdHRlbXB0ZWQuCgpQbGVhc2Ug
cmV2aWV3IHRoZSBhdHRhY2hlZCBmaWxlcyBmb3IgZnVydGhlciBpbmZvcm1hdGlvbiBhbmQgYnVp
bGQvdXBkYXRlIGZhaWx1cmVzLgpBbnkgcHJvYmxlbSBwbGVhc2UgZmlsZSBhIGJ1ZyBhdCBodHRw
czovL2J1Z3ppbGxhLnlvY3RvcHJvamVjdC5vcmcvZW50ZXJfYnVnLmNnaT9wcm9kdWN0PUF1dG9t
YXRlZCUyMFVwZGF0ZSUyMEhhbmRsZXIKClJlZ2FyZHMsClRoZSBVcGdyYWRlIEhlbHBlcgoKLS0g
PjggLS0KRnJvbSA2MDVlMjc3YzY1OTVlZDcyNjExMGM2MzhlNzA3MWM1MGIwMTgwN2YzIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVj
dC5vcmc+CkRhdGU6IFR1ZSwgMSBTZXAgMjAyNiAwNTozMDo0NiArMDAwMApTdWJqZWN0OiBbUEFU
Q0hdIGxpYnJlcG86IHVwZ3JhZGUgMS4yMC4wIC0+IDEuMjEuMApNSU1FLVZlcnNpb246IDEuMApD
b250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKQ29udGVudC1UcmFuc2Zlci1F
bmNvZGluZzogOGJpdAoKNWU1YmRkYSB1c2UgUFJPViBmb3IgcGtjczExIFVSSXMgd2l0aCBPcGVu
U1NMIDQueAo1NGU4NDk2IHRlc3Q6IHZlcmlmeSBtaXNzaW5nIGtleSBlcnJvciBtZXNzYWdlIGNv
bnNpc3RlbmN5IGFjcm9zcyBiYWNrZW5kcwplYTMzZDU3IGdwZ21lOiByZXBvcnQgIlNpZ25pbmcg
a2V5IG5vdCBmb3VuZCIgd2hlbiBzaWduaW5nIGtleSBpcyBtaXNzaW5nCjEzZTJhOWIgUEdQOiBk
ZWZpbmUgc2hhcmVkIGVycm9yIG1lc3NhZ2UgY29uc3RhbnRzIGZvciBib3RoIGJhY2tlbmRzCmY3
NTZhZGQgT3B0aW9uYWxseSBidWlsZCBsaWJyZXBvIGFzIGEgc3RhdGljIGxpYnJhcnkgYXMgd2Vs
bAphZGY0YWZhIHRlc3Q6IGRvbid0IGV4cGVjdCBlbXB0eSBmaWxlIHdoZW4gZG93bmxvYWRpbmcg
ZmFpbHMKODRjZTc2MCBGaXggbWV0YWRhdGEgZmlsZSBkZXNjcmlwdG9yIGxlYWtzCmVjNDlmMjIg
Q2xvc2UgemNodW5rIHNlZWQgZmQgaW4gZmluZF9sb2NhbF96Y2tfaGVhZGVyCmE0MjI3N2EgRG8g
bm90IGZhaWwgaW4gbHJfcHJlcGFyZV9yZXBvZGF0YV9kaXIoKSBpZiByZXBvZGF0YS8gZGlyIGV4
aXN0cwo4NDIwNmIyIEZpeCBkb3dubG9hZCByZXN1bWUgd2l0aGluIGEgc2luZ2xlIHNlc3Npb24K
MjNhOTU4ZiBDb25maWd1cmUgcGFja2l0IHRvIHVzZSBjYXJldCBub3RhdGlvbiBmb3IgcG9zdHJl
bGVhc2Ugc25hcHNob3RzCjllNWIwMDMgU2V0IENNQUtFX1NLSVBfUlBBVEggdG8gVFJVRQo1ZDhi
MGVhIEZpeCBtZW1vcnkgbGVha3MgaW4gYGxyX3l1bV9kb3dubG9hZF9yZXBvc2AKZTM5ZWY3NCBG
aXg6IGFjdHVhbGx5IHN0b3JlIG1ldGFsaW5rIGFuZCBtaXJyb3JsaXN0IGRvd25sb2FkIHRhcmdl
dHMKOWVmZjJmYyBQR1A6IEZpeCBjcmVhdGluZyAvcnVuL2dudXBnL3VzZXIKNzMxYjVmOSBSZXBs
YWNlIGRlcHJlY2F0ZWQgQ1VSTE9QVF9QUk9HUkVTU0ZVTkNUSU9OCmJlNzg4ZTggc3BlYzogUG9z
dHJlbGVhc2UgdmVyc2lvbiBidW1wCjVkNTI2MDYgZ3BnbWU6IEltcHJvdmUgaGFuZGxpbmcgb2Yg
ZXhwaXJlZCBHUEcgc2lnbmF0dXJlcyB3aXRoIGtleSByb3RhdGlvbiBzdXBwb3J0CjA2N2UwZWEg
TWVyZ2UgcGFja2l0IGNvcHJfYnVpbGQgam9icyBpbnRvIG9uZQozMTBkMjQ3IENJOiBDb3JyZWN0
IGEgbGluayB0byBwYWNraXQgZG9jdW1lbnRhdGlvbgowM2EyMGIyIEFkZCBidWlsZCByZXF1aXJl
bWVudHMgaW5zdGFsbGF0aW9uIGluc3RydWN0aW9ucwowZmM0Yjk4IFRlc3QgaW1wb3J0aW5nIGtl
eXMgd2l0aCBwcmVmaXggYW5kIHN1ZmZpeAphMjYwZjIxIFdlIGNhbm5vdCBidWlsZCBmb3IgZXBl
bC04IGR1ZSB0byBnbGliMiDiiaUgMi42NiByZXF1aXJlbWVudApmMjJmYzMwIEFkZCBwYWNraXQg
Y29wci1idWlsZHMgYW5kIHRlc3RzCi0tLQogLi4uRG8tbm90LXRyeS10by1vYnRhaW4tUFlUSE9O
X0lOU1RBTExfRElSLWJ5LXJ1bm5pbmctcC5wYXRjaCB8IDQgKystLQogLi4uL2xpYnJlcG8ve2xp
YnJlcG9fMS4yMC4wLmJiID0+IGxpYnJlcG9fMS4yMS4wLmJifSAgICAgICAgICB8IDIgKy0KIDIg
ZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9saWJyZXBvL3tsaWJyZXBvXzEuMjAuMC5iYiA9PiBsaWJyZXBv
XzEuMjEuMC5iYn0gKDk0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGli
cmVwby9saWJyZXBvLzAwMDItRG8tbm90LXRyeS10by1vYnRhaW4tUFlUSE9OX0lOU1RBTExfRElS
LWJ5LXJ1bm5pbmctcC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJyZXBvL2xpYnJl
cG8vMDAwMi1Eby1ub3QtdHJ5LXRvLW9idGFpbi1QWVRIT05fSU5TVEFMTF9ESVItYnktcnVubmlu
Zy1wLnBhdGNoCmluZGV4IGFjNTM3M2YyZTcuLjZjZmU5NzBjMmYgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9saWJyZXBvL2xpYnJlcG8vMDAwMi1Eby1ub3QtdHJ5LXRvLW9idGFp
bi1QWVRIT05fSU5TVEFMTF9ESVItYnktcnVubmluZy1wLnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9saWJyZXBvL2xpYnJlcG8vMDAwMi1Eby1ub3QtdHJ5LXRvLW9idGFpbi1QWVRI
T05fSU5TVEFMTF9ESVItYnktcnVubmluZy1wLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAw
MDYyZjQ5YjYyY2UwMTRkYzgxNDg1YzZhZTEwMWQ0OTM5OWQyMmNmIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbSBiYTgxZGZjM2FhZWFkYWQwZTIyMjcyMTM2NzQwODY0YmM5NWQ0ZjZiIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2Fu
YXZpbkBnbWFpbC5jb20+CiBEYXRlOiBGcmksIDMwIERlYyAyMDE2IDE4OjA1OjM2ICswMjAwCiBT
dWJqZWN0OiBbUEFUQ0hdIERvIG5vdCB0cnkgdG8gb2J0YWluIFBZVEhPTl9JTlNUQUxMX0RJUiBi
eSBydW5uaW5nIHB5dGhvbi4KQEAgLTExLDcgKzExLDcgQEAgU2lnbmVkLW9mZi1ieTogV2FuZyBN
aW5neXUgPHdhbmdteUBmdWppdHN1LmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25z
KCspLCA2IGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvbGlicmVwby9weXRob24vQ01ha2VM
aXN0cy50eHQgYi9saWJyZXBvL3B5dGhvbi9DTWFrZUxpc3RzLnR4dAotaW5kZXggODUyM2NhNy4u
MDZlNWY3YiAxMDA2NDQKK2luZGV4IDkxYjczODUuLmIwODM1OGIgMTAwNjQ0CiAtLS0gYS9saWJy
ZXBvL3B5dGhvbi9DTWFrZUxpc3RzLnR4dAogKysrIGIvbGlicmVwby9weXRob24vQ01ha2VMaXN0
cy50eHQKIEBAIC0xNiwxMiArMTYsMTIgQEAgU0VUIChsaWJyZXBvbW9kdWxlX1NSQ1MKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJyZXBvL2xpYnJlcG9fMS4yMC4wLmJiIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYnJlcG8vbGlicmVwb18xLjIxLjAuYmIKc2ltaWxhcml0
eSBpbmRleCA5NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYnJlcG8vbGli
cmVwb18xLjIwLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJyZXBvL2xp
YnJlcG9fMS4yMS4wLmJiCmluZGV4IDdhMmU5ZTZiOWIuLjcyZWU5YTYyN2MgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJyZXBvL2xpYnJlcG9fMS4yMC4wLmJiCisrKyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9saWJyZXBvL2xpYnJlcG9fMS4yMS4wLmJiCkBAIC05LDcgKzks
NyBAQCBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vcnBtLXNvZnR3YXJlLW1hbmFnZW1lbnQv
bGlicmVwby5naXQ7YnJhbmNoPW1hc3RlcjtwcgogICAgICAgICAgICBmaWxlOi8vMDAwMi1Eby1u
b3QtdHJ5LXRvLW9idGFpbi1QWVRIT05fSU5TVEFMTF9ESVItYnktcnVubmluZy1wLnBhdGNoIFwK
ICAgICAgICAgICAgIgogCi1TUkNSRVYgPSAiMzYzY2I3MGM2NTQ4YmU5MDA4MzJiYzliMThjZWQz
ZTc1NjlkYTE1YSIKK1NSQ1JFViA9ICI1ZTViZGRhY2FkNTIxMjFmOTcwYzQ5OWUxM2E5OGQ5MzZk
Y2RjN2I2IgogCiBERVBFTkRTID0gImN1cmwgZ2xpYi0yLjAgb3BlbnNzbCBhdHRyIGdwZ21lIGxp
YnhtbDIiCiAKLS0gCjIuNDcuMQoK

--===============8387795670115161492==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 956 .bb files complete (0 cached, 956 parsed). 1986 targets, 63 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-fa4db14329f57e96b8586a6a054c19010c8cf73e"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:fa4db14329f57e96b8586a6a054c19010c8cf73e"
meta-yocto-bsp       
meta-poky            = "master:6ce984c0a3a68c2fdc3c32bc185b6729d09e7829"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 578 Local 514 Mirrors 0 Missed 64 Current 245 (88% match, 92% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 267 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 287 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 288 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 290 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 294 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.21.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 303 of 823 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_create_spdx_setscene)
NOTE: Running setscene task 315 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 319 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_package_qa_setscene)
NOTE: Running setscene task 345 of 823 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 348 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 359 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_create_spdx_setscene)
NOTE: Running setscene task 364 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 374 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 376 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 381 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.5.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 392 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libassuan/libassuan_3.0.2.bb:do_recipe_qa_setscene)
NOTE: recipe librepo-1.21.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-ng-0.9.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libgpg-error-1.61-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.15.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxml2-2.15.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libassuan-3.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe libgpg-error-native-1.61-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_package_qa_setscene: Started
NOTE: recipe gobject-introspection-native-1.86.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe librepo-1.21.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 393 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_create_recipe_spdx_setscene)
NOTE: recipe attr-2.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libassuan-3.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 394 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.9.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 400 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 401 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgpg-error-1.61-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 402 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgpg-error-native-1.61-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 403 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-3.14.7-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gobject-introspection-native-1.86.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 406 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 407 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 408 of 823 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxml2-2.15.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 409 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 410 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_11.1.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.14.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 411 of 823 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.47-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxml2-2.15.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 412 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe qemu-native-11.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgpg-error-1.61-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe util-linux-2.42.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 415 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gobject-introspection-native-1.86.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gobject-introspection-native-1.86.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 416 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 417 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_create_spdx_setscene)
NOTE: recipe qemu-native-11.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 419 of 823 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_create_spdx_setscene)
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxml2-2.15.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 421 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpcre2-10.47-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe util-linux-2.42.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 423 of 823 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.36.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 424 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_create_spdx_setscene)
NOTE: recipe libgpg-error-1.61-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 425 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 426 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gobject-introspection-native-1.86.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 427 of 823 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libcap-ng-0.9.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 428 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_spdx_setscene)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.15.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 430 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_11.1.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 432 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-native-1.86.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 433 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 434 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe qemu-native-11.1.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgpg-error-native-1.61-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 435 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 436 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_spdx_setscene)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 439 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 440 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 441 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 442 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 443 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 444 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.7-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 446 of 823 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.36.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe qemu-native-11.1.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 447 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-native-1.61-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 450 of 823 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.12.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 452 of 823 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-3.14.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libcap-ng-0.9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.5.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 453 of 823 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 454 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.15.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 455 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 456 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 457 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe ncurses-6.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe meson-native-1.12.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 460 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.5.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 461 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_create_spdx_setscene)
NOTE: recipe libpcre2-10.47-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 462 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 464 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 465 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 466 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.2.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.15.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 467 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_packagedata_setscene)
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.9.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe meson-native-1.12.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 468 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 469 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.8.bb:do_create_recipe_spdx_setscene)
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-native-1.86.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 470 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 471 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-16.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.9.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 472 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260816.bb:do_packagedata_setscene)
NOTE: recipe tzdata-2026c-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-native-1.86.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 474 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 475 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.5.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 477 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 478 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 481 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 483 of 823 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.12.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe ca-certificates-20260816-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 484 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe tzdata-2026c-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 485 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_create_spdx_setscene)
NOTE: recipe binutils-2.47-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 488 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_recipe_spdx_setscene)
NOTE: recipe bash-completion-2.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 491 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 492 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_packagedata_setscene)
NOTE: recipe ca-certificates-20260816-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe meson-native-1.12.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 509 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe meson-native-1.12.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe coreutils-9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gcc-16.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 527 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 528 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 533 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 535 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 536 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 542 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 543 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 544 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 545 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 546 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 548 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 549 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 550 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_packagedata_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 551 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libmpc-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 552 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 555 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 563 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.196.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 564 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-4.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libmpc-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 578 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 583 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 585 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe elfutils-0.196-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_recipe_spdx_setscene: Started
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/expat/2.8.3/temp/log.do_packagedata_setscene.2292159
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 586 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_package_setscene)
NOTE: recipe python3-3.14.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe elfutils-0.196-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 593 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 594 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 595 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 596 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 597 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 599 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 600 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 602 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 604 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 605 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 608 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 609 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 610 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 614 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.19-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 650 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_fetch)
NOTE: recipe libarchive-3.8.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 710 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_fetch)
NOTE: Running task 733 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb:do_fetch)
NOTE: recipe libpcre2-10.47-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 751 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.5.bb:do_fetch)
NOTE: Running task 753 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_fetch)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 769 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb:do_write_config)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 793 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libassuan/libassuan_3.0.2.bb:do_fetch)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 799 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_fetch)
NOTE: Running task 802 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_fetch)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 646 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: Running task 803 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_fetch)
NOTE: Running setscene task 648 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.47-r0: task do_fetch: Succeeded
NOTE: Running task 804 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_unpack)
NOTE: recipe json-c-0.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.8.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 651 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 653 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 655 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.18.0-r0: task do_fetch: Started
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_fetch: Started
NOTE: recipe libcap-ng-0.9.5-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 657 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_write_config: Started
NOTE: recipe util-linux-2.42.2-r0: task do_fetch: Started
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_fetch: Succeeded
NOTE: recipe libassuan-3.0.2-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 660 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_fetch: Started
NOTE: recipe libxml2-2.15.3-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.47-r0: task do_unpack: Started
NOTE: recipe util-linux-2.42.2-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_fetch: Started
NOTE: recipe curl-8.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.21.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 666 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe libassuan-3.0.2-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_fetch: Succeeded
NOTE: Running task 813 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_unpack)
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_write_config: Succeeded
NOTE: Running task 814 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_fetch: Succeeded
NOTE: Running task 815 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_unpack)
NOTE: recipe file-5.48-r0: task do_packagedata_setscene: Started
NOTE: Running task 824 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libassuan/libassuan_3.0.2.bb:do_unpack)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 836 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_unpack)
NOTE: Running task 840 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_unpack)
NOTE: recipe libgcrypt-1.12.2-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.15.3-r0: task do_fetch: Succeeded
NOTE: Running task 841 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_unpack)
NOTE: recipe bash-completion-2.18.0-r0: task do_unpack: Started
NOTE: recipe expat-2.8.3-r0: task do_package_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_unpack: Started
NOTE: recipe curl-8.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 670 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_package_setscene)
NOTE: recipe libassuan-3.0.2-r0: task do_unpack: Started
NOTE: recipe util-linux-2.42.2-r0: task do_unpack: Started
NOTE: recipe file-5.48-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.21.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 672 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 673 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.9.5-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_unpack: Started
NOTE: Running setscene task 674 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.15.3-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 678 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.18.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 679 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.8.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 680 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.21.0-r0: task do_package_setscene: Started
NOTE: Running setscene task 682 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe xz-5.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libassuan-3.0.2-r0: task do_unpack: Succeeded
NOTE: Running setscene task 685 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_unpack: Succeeded
NOTE: Running setscene task 686 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 687 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.61-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 688 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 691 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_packagedata_setscene)
NOTE: recipe attr-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 693 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 694 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 696 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 709 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.61-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 712 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.61-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 714 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.8.3-r0: task do_package_setscene: Succeeded
NOTE: Running task 842 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_patch)
NOTE: recipe attr-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 719 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 843 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_patch)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_unpack: Succeeded
NOTE: Running task 846 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb:do_patch)
NOTE: recipe xz-5.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 722 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.47-r0: task do_patch: Started
NOTE: recipe expat-2.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 724 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 727 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_recipe_qa_setscene)
NOTE: Running task 862 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.5.bb:do_unpack)
NOTE: recipe nettle-4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_patch: Started
NOTE: Running setscene task 730 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe xz-5.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_unpack: Succeeded
NOTE: Running task 899 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libassuan/libassuan_3.0.2.bb:do_patch)
NOTE: Running task 900 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_patch)
NOTE: Running task 910 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_write_config)
NOTE: recipe libxml2-2.15.3-r0: task do_unpack: Succeeded
NOTE: recipe libgpg-error-1.61-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.47-r0: task do_patch: Succeeded
NOTE: Running task 911 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_patch)
NOTE: Running setscene task 738 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 913 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_patch)
NOTE: Running task 914 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_write_config)
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.9.5-r0: task do_unpack: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_patch: Succeeded
NOTE: Running task 953 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gpgme/gpgme_2.1.2.bb:do_recipe_qa)
NOTE: recipe libassuan-3.0.2-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.61-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.15.3-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_write_config: Started
NOTE: Running task 979 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.21.0.bb:do_recipe_qa)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gpgme-2.1.2-r0: task do_recipe_qa: Started
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgpg-error-1.61-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_write_config: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_write_config: Succeeded
NOTE: Running task 1026 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 1038 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_create_recipe_spdx)
NOTE: Running task 1039 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb:do_create_recipe_spdx)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_patch: Succeeded
NOTE: recipe librepo-1.21.0-r0: task do_recipe_qa: Started
NOTE: Running task 1094 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libassuan/libassuan_3.0.2.bb:do_create_recipe_spdx)
NOTE: Running task 1095 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_create_recipe_spdx)
NOTE: recipe util-linux-2.42.2-r0: task do_unpack: Succeeded
NOTE: Running task 1127 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_patch)
NOTE: recipe libassuan-3.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1154 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libassuan/libassuan_3.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_create_recipe_spdx: Started
NOTE: Running task 1155 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1156 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.8-r0: task do_create_recipe_spdx: Started
NOTE: recipe libassuan-3.0.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe util-linux-2.42.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe gpgme-2.1.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe libassuan-3.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-linux-2.42.2-r0: task do_patch: Started
NOTE: Running task 1157 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gpgme/gpgme_2.1.2.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe librepo-1.21.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1158 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.21.0.bb:do_fetch)
NOTE: recipe libxml2-2.15.3-r0: task do_patch: Succeeded
NOTE: recipe gpgme-2.1.2-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1160 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe gpgme-2.1.2-r0: task do_fetch: Succeeded
NOTE: recipe librepo-1.21.0-r0: task do_fetch: Started
NOTE: Running task 1161 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gpgme/gpgme_2.1.2.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.8-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 744 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libassuan-3.0.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libassuan-3.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1163 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_create_recipe_spdx)
NOTE: recipe util-linux-2.42.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1164 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gpgme/gpgme_2.1.2.bb:do_create_recipe_spdx)
NOTE: Running task 1165 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_recipe_spdx)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libassuan/libassuan_3.0.2.bb:do_deploy_source_date_epoch unihash changed to e95b068c8b23dd6abe11e9cade708e63dd85eebd1752b5a85a3e1c542c21aeed
NOTE: recipe gpgme-2.1.2-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe libcap-ng-0.9.5-r0: task do_unpack: Succeeded
NOTE: recipe libpsl-0.23.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe gpgme-2.1.2-r0: task do_create_recipe_spdx: Started
NOTE: Running task 1166 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.5.bb:do_patch)
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1168 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe librepo-1.21.0-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-2.42.2-r0: task do_patch: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe libcap-ng-0.9.5-r0: task do_patch: Started
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_patch: Succeeded
NOTE: Running task 1176 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.21.0.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe gpgme-2.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 1177 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: Running task 1178 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gpgme/gpgme_2.1.2.bb:do_patch)
NOTE: recipe libcap-ng-0.9.5-r0: task do_patch: Succeeded
NOTE: recipe librepo-1.21.0-r0: task do_unpack: Started
NOTE: recipe gpgme-2.1.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libpsl-0.23.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: Running task 1181 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_create_recipe_spdx)
NOTE: Running task 1182 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_create_recipe_spdx)
NOTE: recipe gpgme-2.1.2-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1183 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe curl-8.21.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe curl-8.21.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 745 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 746 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 747 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 748 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 749 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 750 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 751 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.8.bb:do_packagedata_setscene)
NOTE: recipe curl-8.21.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1184 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.21.0.bb:do_create_recipe_spdx)
NOTE: recipe libpsl-0.23.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.21.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.8-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.21.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 752 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_recipe_qa_setscene)
NOTE: recipe gpgme-2.1.2-r0: task do_patch: Succeeded
NOTE: Running task 1185 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gpgme/gpgme_2.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe librepo-1.21.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpsl-0.23.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 754 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_package_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 756 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe libpsl-0.23.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.5.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 758 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe curl-8.21.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gpgme-2.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe openssl-3.5.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 760 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 761 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.8.bb:do_recipe_qa_setscene)
NOTE: recipe librepo-1.21.0-r0: task do_unpack: Succeeded
NOTE: Running task 1187 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.21.0.bb:do_patch)
NOTE: recipe libpsl-0.23.3-r0: task do_package_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.21.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1189 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_fetch)
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe librepo-1.21.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe openssl-3.5.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe librepo-1.21.0-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.21.0-r0: task do_fetch: Started
NOTE: recipe openssl-3.5.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.21.0-r0: task do_fetch: Succeeded
NOTE: recipe gpgme-2.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1200 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_unpack)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gpgme/gpgme_2.1.2.bb:do_deploy_source_date_epoch unihash changed to 9ef895222affe411763bf2e8f1290bfdb421f74da9f06dea2c1c58ce56d0c39d
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 759 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe librepo-1.21.0-r0: task do_patch: Succeeded
NOTE: recipe curl-8.21.0-r0: task do_unpack: Started
NOTE: Running task 1201 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.21.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1202 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.21.0.bb:do_generate_toolchain_file)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 765 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 766 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 767 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_11.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 768 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe librepo-1.21.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe librepo-1.21.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe qemu-native-11.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe librepo-1.21.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 769 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.21.0-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1210 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_patch)
NOTE: recipe librepo-1.21.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpsl-0.23.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 770 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_package_setscene)
NOTE: recipe curl-8.21.0-r0: task do_patch: Started
NOTE: recipe libpsl-0.23.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1212 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_fetch)
NOTE: recipe libidn2-2.3.8-r0: task do_package_setscene: Started
NOTE: recipe qemu-native-11.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 771 of 823 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libpsl-0.23.3-r0: task do_fetch: Started
NOTE: recipe curl-8.21.0-r0: task do_patch: Succeeded
NOTE: recipe libpsl-0.23.3-r0: task do_fetch: Succeeded
NOTE: Running task 1218 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_unpack)
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_unpack: Started
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpsl-0.23.3-r0: task do_unpack: Succeeded
NOTE: Running task 1224 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_patch)
NOTE: recipe libpsl-0.23.3-r0: task do_patch: Started
NOTE: recipe libpsl-0.23.3-r0: task do_patch: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 772 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 773 of 823 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.36.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 774 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 775 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 776 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 778 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 779 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 781 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 782 of 823 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.12.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-16.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1232 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_fetch)
NOTE: recipe libunistring-1.4.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe meson-native-1.12.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.8-r0: task do_fetch: Succeeded
NOTE: Running task 1238 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_unpack)
NOTE: recipe libtool-cross-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 783 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 785 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 787 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_unpack: Started
NOTE: recipe meson-native-1.12.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 788 of 823 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_unpack: Succeeded
NOTE: recipe libgcc-16.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 790 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: Running task 1248 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_patch)
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_patch: Started
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 791 of 823 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_patch: Succeeded
NOTE: Running setscene task 793 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 794 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 795 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 796 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 797 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-build-native-1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-build-native-1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 802 of 823 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 803 of 823 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-16.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 804 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 806 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-packaging-native-26.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-packaging-native-26.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 807 of 823 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 808 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 809 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 810 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 815 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-installer-native-1.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-installer-native-1.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 818 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 819 of 823 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 821 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 823 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1490 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1523 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1676 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libassuan/libassuan_3.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1684 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1765 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_packagedata)
NOTE: recipe libpcre2-10.47-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1847 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_create_spdx)
NOTE: Running task 1902 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libassuan-3.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxml2-2.15.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expat-2.8.3-r0: task do_packagedata: Started
NOTE: recipe libidn2-2.3.8-r0: task do_create_spdx: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe libpcre2-10.47-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1941 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_configure)
NOTE: Running task 1942 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_configure)
NOTE: recipe libxml2-2.15.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libassuan-3.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1943 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_configure)
NOTE: Running task 1944 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libassuan/libassuan_3.0.2.bb:do_configure)
NOTE: recipe expat-2.8.3-r0: task do_packagedata: Succeeded
NOTE: recipe libpcre2-10.47-r0: task do_configure: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_configure: Started
NOTE: recipe libxml2-2.15.3-r0: task do_configure: Started
NOTE: recipe libassuan-3.0.2-r0: task do_configure: Started
NOTE: recipe libidn2-2.3.8-r0: task do_create_spdx: Succeeded
NOTE: Running task 1949 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_create_spdx)
NOTE: recipe libpsl-0.23.3-r0: task do_create_spdx: Started
NOTE: recipe libpsl-0.23.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 1950 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_create_spdx)
NOTE: recipe curl-8.21.0-r0: task do_create_spdx: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1951 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 01601c830bf0505dffefe38b59daca3ab016e10d573425e9e20abf8724f20aa7
NOTE: recipe curl-8.21.0-r0: task do_create_spdx: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_configure: Succeeded
NOTE: Running task 1958 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_compile)
NOTE: recipe bash-completion-2.18.0-r0: task do_compile: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_compile: Succeeded
NOTE: Running task 1959 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_install)
NOTE: recipe bash-completion-2.18.0-r0: task do_install: Started
NOTE: recipe libxml2-2.15.3-r0: task do_configure: Succeeded
NOTE: Running task 1960 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_configure_ptest_base)
NOTE: recipe libxml2-2.15.3-r0: task do_configure_ptest_base: Started
NOTE: recipe libxml2-2.15.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1961 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_compile)
NOTE: recipe libxml2-2.15.3-r0: task do_compile: Started
NOTE: recipe libpcre2-10.47-r0: task do_configure: Succeeded
NOTE: Running task 1962 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_configure_ptest_base)
NOTE: recipe libpcre2-10.47-r0: task do_configure_ptest_base: Started
NOTE: recipe libpcre2-10.47-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1963 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_compile)
NOTE: recipe libpcre2-10.47-r0: task do_compile: Started
NOTE: recipe libassuan-3.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1964 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libassuan/libassuan_3.0.2.bb:do_configure_ptest_base)
NOTE: recipe libassuan-3.0.2-r0: task do_configure_ptest_base: Started
NOTE: recipe libassuan-3.0.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1965 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libassuan/libassuan_3.0.2.bb:do_compile)
NOTE: recipe libassuan-3.0.2-r0: task do_compile: Started
NOTE: recipe libassuan-3.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1966 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libassuan/libassuan_3.0.2.bb:do_compile_ptest_base)
NOTE: recipe libassuan-3.0.2-r0: task do_compile_ptest_base: Started
NOTE: recipe libassuan-3.0.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1967 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libassuan/libassuan_3.0.2.bb:do_install)
NOTE: recipe libassuan-3.0.2-r0: task do_install: Started
NOTE: recipe libassuan-3.0.2-r0: task do_install: Succeeded
NOTE: Running task 1968 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libassuan/libassuan_3.0.2.bb:do_install_ptest_base)
NOTE: recipe libassuan-3.0.2-r0: task do_install_ptest_base: Started
NOTE: recipe libassuan-3.0.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1969 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libassuan/libassuan_3.0.2.bb:do_populate_sysroot)
NOTE: Running task 1970 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libassuan/libassuan_3.0.2.bb:do_package)
NOTE: recipe libassuan-3.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe libassuan-3.0.2-r0: task do_package: Started
NOTE: recipe libassuan-3.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1971 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gpgme/gpgme_2.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gpgme-2.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gpgme-2.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1972 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gpgme/gpgme_2.1.2.bb:do_configure)
NOTE: recipe gpgme-2.1.2-r0: task do_configure: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_install: Succeeded
NOTE: Running task 1974 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1975 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_package)
NOTE: recipe libcap-ng-0.9.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_package: Started
NOTE: recipe libcap-ng-0.9.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1976 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.5.bb:do_configure)
NOTE: recipe libcap-ng-0.9.5-r0: task do_configure: Started
NOTE: recipe libassuan-3.0.2-r0: task do_package: Succeeded
NOTE: Running task 1977 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libassuan/libassuan_3.0.2.bb:do_packagedata)
NOTE: recipe libassuan-3.0.2-r0: task do_packagedata: Started
NOTE: recipe libassuan-3.0.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1978 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libassuan/libassuan_3.0.2.bb:do_create_spdx)
NOTE: recipe libassuan-3.0.2-r0: task do_create_spdx: Started
NOTE: recipe libxml2-2.15.3-r0: task do_compile: Succeeded
NOTE: Running task 1979 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_compile_ptest_base)
NOTE: recipe libassuan-3.0.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libxml2-2.15.3-r0: task do_compile_ptest_base: Started
NOTE: recipe libxml2-2.15.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1980 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_install)
NOTE: recipe libxml2-2.15.3-r0: task do_install: Started
NOTE: recipe libpcre2-10.47-r0: task do_compile: Succeeded
NOTE: Running task 1981 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_compile_ptest_base)
NOTE: recipe libxml2-2.15.3-r0: task do_install: Succeeded
NOTE: Running task 1982 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_install_ptest_base)
NOTE: recipe libpcre2-10.47-r0: task do_compile_ptest_base: Started
NOTE: recipe libpcre2-10.47-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libxml2-2.15.3-r0: task do_install_ptest_base: Started
NOTE: Running task 1983 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_install)
NOTE: recipe libpcre2-10.47-r0: task do_install: Started
NOTE: recipe libpcre2-10.47-r0: task do_install: Succeeded
NOTE: Running task 1984 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_install_ptest_base)
NOTE: recipe libpcre2-10.47-r0: task do_install_ptest_base: Started
NOTE: recipe libpcre2-10.47-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1986 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1987 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_package)
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_package: Succeeded
NOTE: recipe libpcre2-10.47-r0: task do_package: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_package unihash changed to ee53215d38af29daf47ab3fc0127e4aae826e4ff02aed1b8bbf129b8c9694381
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_create_spdx became valid
NOTE: Running setscene task 817 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_create_spdx_setscene)
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1988 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb:do_configure)
NOTE: recipe bash-completion-2.18.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 823 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_configure: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libxml2-2.15.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1991 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_package)
NOTE: recipe libxml2-2.15.3-r0: task do_package: Started
NOTE: recipe libpcre2-10.47-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_package unihash changed to ab59fac42c536d6efac420f012f4d77aab6488f39ca8dd0dff3c390e6d213388
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_create_spdx became valid
NOTE: recipe libcap-ng-0.9.5-r0: task do_configure: Succeeded
NOTE: Running setscene task 821 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_create_spdx_setscene)
NOTE: Running task 1993 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.5.bb:do_compile)
NOTE: recipe libpcre2-10.47-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-ng-0.9.5-r0: task do_compile: Started
NOTE: recipe libpcre2-10.47-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 823 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.47-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe gpgme-2.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1996 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gpgme/gpgme_2.1.2.bb:do_compile)
NOTE: recipe gpgme-2.1.2-r0: task do_compile: Started
NOTE: recipe libcap-ng-0.9.5-r0: task do_compile: Succeeded
NOTE: Running task 1997 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.5.bb:do_install)
NOTE: recipe libcap-ng-0.9.5-r0: task do_install: Started
NOTE: recipe libcap-ng-0.9.5-r0: task do_install: Succeeded
NOTE: Running task 1999 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2000 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.5.bb:do_package)
NOTE: recipe util-linux-2.42.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-ng-0.9.5-r0: task do_package: Started
NOTE: recipe util-linux-2.42.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2001 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_configure)
NOTE: recipe gpgme-2.1.2-r0: task do_compile: Succeeded
NOTE: Running task 2002 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gpgme/gpgme_2.1.2.bb:do_install)
NOTE: recipe util-linux-2.42.2-r0: task do_configure: Started
NOTE: recipe gpgme-2.1.2-r0: task do_install: Started
NOTE: recipe gpgme-2.1.2-r0: task do_install: Succeeded
NOTE: Running task 2003 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gpgme/gpgme_2.1.2.bb:do_package)
NOTE: Running task 2004 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gpgme/gpgme_2.1.2.bb:do_populate_sysroot)
NOTE: recipe gpgme-2.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe gpgme-2.1.2-r0: task do_package: Started
NOTE: recipe gpgme-2.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libcap-ng-0.9.5-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.5.bb:do_package unihash changed to 5c76501da3405fd82284a3d8314ff17543ae4e19ad8bde8490b75df29accef71
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.5.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.5.bb:do_create_spdx became valid
NOTE: Running setscene task 817 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.5.bb:do_create_spdx_setscene)
NOTE: recipe libcap-ng-0.9.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-ng-0.9.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 823 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.5.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe gpgme-2.1.2-r0: task do_package: Succeeded
NOTE: Running task 2007 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gpgme/gpgme_2.1.2.bb:do_packagedata)
NOTE: recipe gpgme-2.1.2-r0: task do_packagedata: Started
NOTE: recipe gpgme-2.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2008 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gpgme/gpgme_2.1.2.bb:do_create_spdx)
NOTE: recipe gpgme-2.1.2-r0: task do_create_spdx: Started
NOTE: recipe gpgme-2.1.2-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_configure: Succeeded
NOTE: Running task 2009 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2010 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb:do_compile)
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_compile: Started
NOTE: recipe libxml2-2.15.3-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_package unihash changed to 319de3c12b687982370a1314cfeb37bf2c445597d1af870a62d08cefca406d22
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_create_spdx became valid
NOTE: Running setscene task 819 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_create_spdx_setscene)
NOTE: recipe libxml2-2.15.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.15.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 823 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.15.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.15.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_compile: Succeeded
NOTE: Running task 2013 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2014 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb:do_install)
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_install: Started
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_install: Succeeded
NOTE: Running task 2015 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2016 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb:do_populate_sysroot)
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb:do_populate_sysroot unihash changed to fecb8e8acfa25e400ca19e8ab2fcd08d7c989363419f4951d1d8b9934ce0ecd0
NOTE: Setscene tasks completed
NOTE: Running task 2017 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2018 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb:do_create_spdx)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_create_spdx: Started
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_create_spdx: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2019 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_configure)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_configure: Succeeded
NOTE: Running task 2020 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_compile)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_compile: Started
NOTE: recipe util-linux-2.42.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2021 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_configure_ptest_base)
NOTE: recipe util-linux-2.42.2-r0: task do_configure_ptest_base: Started
NOTE: recipe util-linux-2.42.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2022 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_compile)
NOTE: recipe util-linux-2.42.2-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_compile: Succeeded
NOTE: Running task 2023 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_install)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_install: Succeeded
NOTE: Running task 2024 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot)
NOTE: Running task 2025 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_package)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_package: Started
NOTE: recipe util-linux-2.42.2-r0: task do_compile: Succeeded
NOTE: Running task 2026 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_compile_ptest_base)
NOTE: recipe util-linux-2.42.2-r0: task do_compile_ptest_base: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe util-linux-2.42.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2027 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_install)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_package: Succeeded
NOTE: Running task 2028 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_packagedata)
NOTE: recipe util-linux-2.42.2-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_packagedata unihash changed to c3e70f2cb704a2e1cbde356f839f0ab6e232905655941f2cae4f67eaecadd567
NOTE: Setscene tasks completed
NOTE: Running task 2029 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_spdx)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx: Succeeded
NOTE: recipe util-linux-2.42.2-r0: task do_install: Succeeded
NOTE: Running task 2030 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_install_ptest_base)
NOTE: recipe util-linux-2.42.2-r0: task do_install_ptest_base: Started
NOTE: recipe util-linux-2.42.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2031 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_populate_sysroot)
NOTE: Running task 2032 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_package)
NOTE: recipe util-linux-2.42.2-r0: task do_populate_sysroot: Started
NOTE: recipe util-linux-2.42.2-r0: task do_package: Started
NOTE: recipe util-linux-2.42.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_populate_sysroot unihash changed to 7881bc9261339c95fbe32368c17e421cd10a6f224eb4d9861a9cf1e0ba831d37
NOTE: Setscene tasks completed
NOTE: Running task 2033 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2034 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_configure)
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_configure: Succeeded
NOTE: Running task 2035 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2036 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_compile)
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_compile: Started
NOTE: recipe util-linux-2.42.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_package unihash changed to 4b7f9557fe12bd9895e838575541b491db6e9d6143c721e82998ececf4f57bba
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_packagedata became valid
NOTE: Running setscene task 820 of 823 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2038 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_create_spdx)
NOTE: recipe util-linux-2.42.2-r0: task do_create_spdx: Started
NOTE: recipe util-linux-2.42.2-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2039 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2040 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_install)
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_install: Succeeded
NOTE: Running task 2041 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2042 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_package)
NOTE: Running task 2043 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_populate_sysroot)
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2044 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.21.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe librepo-1.21.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librepo-1.21.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2045 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.21.0.bb:do_configure)
NOTE: recipe librepo-1.21.0-r0: task do_configure: Started
NOTE: recipe librepo-1.21.0-r0: task do_configure: Succeeded
NOTE: Running task 2046 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.21.0.bb:do_compile)
NOTE: recipe librepo-1.21.0-r0: task do_compile: Started
NOTE: recipe librepo-1.21.0-r0: task do_compile: Succeeded
NOTE: Running task 2047 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.21.0.bb:do_install)
NOTE: recipe librepo-1.21.0-r0: task do_install: Started
NOTE: recipe librepo-1.21.0-r0: task do_install: Succeeded
NOTE: Running task 2048 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.21.0.bb:do_populate_sysroot)
NOTE: recipe librepo-1.21.0-r0: task do_populate_sysroot: Started
NOTE: recipe librepo-1.21.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_package: Succeeded
NOTE: Running task 2049 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_packagedata unihash changed to e70858ba4f55670e30c3ac33dd013f075a12c16cba7ffcb87ae2e79839e91d7c
NOTE: Setscene tasks completed
NOTE: Running task 2050 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.21.0.bb:do_package)
NOTE: Running task 2051 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_create_spdx)
NOTE: recipe librepo-1.21.0-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_create_spdx: Started
NOTE: recipe librepo-1.21.0-r0: task do_package: Succeeded
NOTE: Running task 2052 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.21.0.bb:do_packagedata)
NOTE: recipe librepo-1.21.0-r0: task do_packagedata: Started
NOTE: recipe librepo-1.21.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2053 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.21.0.bb:do_package_write_ipk)
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 2054 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.21.0.bb:do_package_write_deb)
NOTE: Running task 2055 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.21.0.bb:do_create_spdx)
NOTE: Running task 2056 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.21.0.bb:do_package_write_rpm)
NOTE: Running task 2057 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.21.0.bb:do_package_qa)
NOTE: recipe librepo-1.21.0-r0: task do_package_write_ipk: Started
NOTE: recipe librepo-1.21.0-r0: task do_package_write_deb: Started
NOTE: recipe librepo-1.21.0-r0: task do_create_spdx: Started
NOTE: recipe librepo-1.21.0-r0: task do_package_write_rpm: Started
NOTE: recipe librepo-1.21.0-r0: task do_package_qa: Started
NOTE: recipe librepo-1.21.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2058 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.21.0.bb:do_create_package_spdx)
NOTE: recipe librepo-1.21.0-r0: task do_create_package_spdx: Started
NOTE: recipe librepo-1.21.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe librepo-1.21.0-r0: task do_package_qa: Succeeded
NOTE: recipe librepo-1.21.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe librepo-1.21.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe librepo-1.21.0-r0: task do_create_package_spdx: Succeeded
NOTE: Running noexec task 2059 of 2059 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.21.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2059 tasks of which 1888 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 10 ERROR messages, returning a non-zero exit code.
ERROR: expat-2.8.3-r0 do_packagedata_setscene: QA Issue: Package version for package expat-src went backwards which would break package feeds (from 0:2.8.4-r0 to 0:2.8.3-r0) [version-going-backwards]
ERROR: expat-2.8.3-r0 do_packagedata_setscene: QA Issue: Package version for package expat-dbg went backwards which would break package feeds (from 0:2.8.4-r0 to 0:2.8.3-r0) [version-going-backwards]
ERROR: expat-2.8.3-r0 do_packagedata_setscene: QA Issue: Package version for package expat-ptest went backwards which would break package feeds (from 0:2.8.4-r0 to 0:2.8.3-r0) [version-going-backwards]
ERROR: expat-2.8.3-r0 do_packagedata_setscene: QA Issue: Package version for package expat-staticdev went backwards which would break package feeds (from 0:2.8.4-r0 to 0:2.8.3-r0) [version-going-backwards]
ERROR: expat-2.8.3-r0 do_packagedata_setscene: QA Issue: Package version for package expat-dev went backwards which would break package feeds (from 0:2.8.4-r0 to 0:2.8.3-r0) [version-going-backwards]
ERROR: expat-2.8.3-r0 do_packagedata_setscene: QA Issue: Package version for package expat-doc went backwards which would break package feeds (from 0:2.8.4-r0 to 0:2.8.3-r0) [version-going-backwards]
ERROR: expat-2.8.3-r0 do_packagedata_setscene: QA Issue: Package version for package expat-locale went backwards which would break package feeds (from 0:2.8.4-r0 to 0:2.8.3-r0) [version-going-backwards]
ERROR: expat-2.8.3-r0 do_packagedata_setscene: QA Issue: Package version for package expat-bin went backwards which would break package feeds (from 0:2.8.4-r0 to 0:2.8.3-r0) [version-going-backwards]
ERROR: expat-2.8.3-r0 do_packagedata_setscene: QA Issue: Package version for package expat went backwards which would break package feeds (from 0:2.8.4-r0 to 0:2.8.3-r0) [version-going-backwards]
ERROR: expat-2.8.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8387795670115161492==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="librepo-changelog.txt"

Q2hhbmdlbG9nIGZvciBsaWJyZXBvOiAxLjIwLjAgLT4gMS4yMS4wCgo1ZTViZGRhIHVzZSBQUk9W
IGZvciBwa2NzMTEgVVJJcyB3aXRoIE9wZW5TU0wgNC54CjU0ZTg0OTYgdGVzdDogdmVyaWZ5IG1p
c3Npbmcga2V5IGVycm9yIG1lc3NhZ2UgY29uc2lzdGVuY3kgYWNyb3NzIGJhY2tlbmRzCmVhMzNk
NTcgZ3BnbWU6IHJlcG9ydCAiU2lnbmluZyBrZXkgbm90IGZvdW5kIiB3aGVuIHNpZ25pbmcga2V5
IGlzIG1pc3NpbmcKMTNlMmE5YiBQR1A6IGRlZmluZSBzaGFyZWQgZXJyb3IgbWVzc2FnZSBjb25z
dGFudHMgZm9yIGJvdGggYmFja2VuZHMKZjc1NmFkZCBPcHRpb25hbGx5IGJ1aWxkIGxpYnJlcG8g
YXMgYSBzdGF0aWMgbGlicmFyeSBhcyB3ZWxsCmFkZjRhZmEgdGVzdDogZG9uJ3QgZXhwZWN0IGVt
cHR5IGZpbGUgd2hlbiBkb3dubG9hZGluZyBmYWlscwo4NGNlNzYwIEZpeCBtZXRhZGF0YSBmaWxl
IGRlc2NyaXB0b3IgbGVha3MKZWM0OWYyMiBDbG9zZSB6Y2h1bmsgc2VlZCBmZCBpbiBmaW5kX2xv
Y2FsX3pja19oZWFkZXIKYTQyMjc3YSBEbyBub3QgZmFpbCBpbiBscl9wcmVwYXJlX3JlcG9kYXRh
X2RpcigpIGlmIHJlcG9kYXRhLyBkaXIgZXhpc3RzCjg0MjA2YjIgRml4IGRvd25sb2FkIHJlc3Vt
ZSB3aXRoaW4gYSBzaW5nbGUgc2Vzc2lvbgoyM2E5NThmIENvbmZpZ3VyZSBwYWNraXQgdG8gdXNl
IGNhcmV0IG5vdGF0aW9uIGZvciBwb3N0cmVsZWFzZSBzbmFwc2hvdHMKOWU1YjAwMyBTZXQgQ01B
S0VfU0tJUF9SUEFUSCB0byBUUlVFCjVkOGIwZWEgRml4IG1lbW9yeSBsZWFrcyBpbiBgbHJfeXVt
X2Rvd25sb2FkX3JlcG9zYAplMzllZjc0IEZpeDogYWN0dWFsbHkgc3RvcmUgbWV0YWxpbmsgYW5k
IG1pcnJvcmxpc3QgZG93bmxvYWQgdGFyZ2V0cwo5ZWZmMmZjIFBHUDogRml4IGNyZWF0aW5nIC9y
dW4vZ251cGcvdXNlcgo3MzFiNWY5IFJlcGxhY2UgZGVwcmVjYXRlZCBDVVJMT1BUX1BST0dSRVNT
RlVOQ1RJT04KYmU3ODhlOCBzcGVjOiBQb3N0cmVsZWFzZSB2ZXJzaW9uIGJ1bXAKNWQ1MjYwNiBn
cGdtZTogSW1wcm92ZSBoYW5kbGluZyBvZiBleHBpcmVkIEdQRyBzaWduYXR1cmVzIHdpdGgga2V5
IHJvdGF0aW9uIHN1cHBvcnQKMDY3ZTBlYSBNZXJnZSBwYWNraXQgY29wcl9idWlsZCBqb2JzIGlu
dG8gb25lCjMxMGQyNDcgQ0k6IENvcnJlY3QgYSBsaW5rIHRvIHBhY2tpdCBkb2N1bWVudGF0aW9u
CjAzYTIwYjIgQWRkIGJ1aWxkIHJlcXVpcmVtZW50cyBpbnN0YWxsYXRpb24gaW5zdHJ1Y3Rpb25z
CjBmYzRiOTggVGVzdCBpbXBvcnRpbmcga2V5cyB3aXRoIHByZWZpeCBhbmQgc3VmZml4CmEyNjBm
MjEgV2UgY2Fubm90IGJ1aWxkIGZvciBlcGVsLTggZHVlIHRvIGdsaWIyIOKJpSAyLjY2IHJlcXVp
cmVtZW50CmYyMmZjMzAgQWRkIHBhY2tpdCBjb3ByLWJ1aWxkcyBhbmQgdGVzdHMK

--===============8387795670115161492==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/librepo: SRC_URI changed from "git://github.com/rpm-software-management/librepo.git;branch=master;protocol=https;tag=1.20.0 file://0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch" to "git://github.com/rpm-software-management/librepo.git;branch=master;protocol=https;tag=1.21.0 file://0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch"
packages/x86-64-v3-poky-linux/librepo: PKGV changed from 1.20.0 [default] to 1.21.0 [default]
packages/x86-64-v3-poky-linux/librepo: PV changed from "1.20.0" to "1.21.0"
packages/x86-64-v3-poky-linux/librepo/librepo-dbg: PKGV changed from 1.20.0 [default] to 1.21.0 [default]
packages/x86-64-v3-poky-linux/librepo/librepo-dbg: PKGSIZE changed from 961848 to 963096 (+0%)
packages/x86-64-v3-poky-linux/librepo/librepo-dbg: PV changed from "1.20.0" to "1.21.0"
packages/x86-64-v3-poky-linux/librepo/librepo-dev: PKGV changed from 1.20.0 [default] to 1.21.0 [default]
packages/x86-64-v3-poky-linux/librepo/librepo-dev: PKGSIZE changed from 128412 to 128421 (+0%)
packages/x86-64-v3-poky-linux/librepo/librepo-dev: PV changed from "1.20.0" to "1.21.0"
packages/x86-64-v3-poky-linux/librepo/librepo-doc: PKGV changed from 1.20.0 [default] to 1.21.0 [default]
packages/x86-64-v3-poky-linux/librepo/librepo-doc: PV changed from "1.20.0" to "1.21.0"
packages/x86-64-v3-poky-linux/librepo/librepo-locale: PKGV changed from 1.20.0 [default] to 1.21.0 [default]
packages/x86-64-v3-poky-linux/librepo/librepo-locale: PV changed from "1.20.0" to "1.21.0"
packages/x86-64-v3-poky-linux/librepo/librepo-src: FILELIST: directory renamed /usr/src/debug/librepo/1.20.0/librepo/python -> /usr/src/debug/librepo/1.21.0/librepo/python, directory renamed /usr/src/debug/librepo/1.20.0/librepo -> /usr/src/debug/librepo/1.21.0/librepo
packages/x86-64-v3-poky-linux/librepo/librepo-src: PKGV changed from 1.20.0 [default] to 1.21.0 [default]
packages/x86-64-v3-poky-linux/librepo/librepo-src: PKGSIZE changed from 744920 to 748899 (+1%)
packages/x86-64-v3-poky-linux/librepo/librepo-src: PV changed from "1.20.0" to "1.21.0"
packages/x86-64-v3-poky-linux/librepo/librepo-staticdev: PKGV changed from 1.20.0 [default] to 1.21.0 [default]
packages/x86-64-v3-poky-linux/librepo/librepo-staticdev: PV changed from "1.20.0" to "1.21.0"
packages/x86-64-v3-poky-linux/librepo/librepo: PKGV changed from 1.20.0 [default] to 1.21.0 [default]
packages/x86-64-v3-poky-linux/librepo/librepo: PV changed from "1.20.0" to "1.21.0"

--===============8387795670115161492==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-librepo-upgrade-1.20.0-1.21.0.patch"

RnJvbSA2MDVlMjc3YzY1OTVlZDcyNjExMGM2MzhlNzA3MWM1MGIwMTgwN2YzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBTZXAgMjAyNiAwNTozMDo0NiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnJlcG86IHVwZ3JhZGUgMS4yMC4wIC0+IDEuMjEuMApNSU1FLVZlcnNpb246IDEuMApDb250ZW50
LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKQ29udGVudC1UcmFuc2Zlci1FbmNvZGlu
ZzogOGJpdAoKNWU1YmRkYSB1c2UgUFJPViBmb3IgcGtjczExIFVSSXMgd2l0aCBPcGVuU1NMIDQu
eAo1NGU4NDk2IHRlc3Q6IHZlcmlmeSBtaXNzaW5nIGtleSBlcnJvciBtZXNzYWdlIGNvbnNpc3Rl
bmN5IGFjcm9zcyBiYWNrZW5kcwplYTMzZDU3IGdwZ21lOiByZXBvcnQgIlNpZ25pbmcga2V5IG5v
dCBmb3VuZCIgd2hlbiBzaWduaW5nIGtleSBpcyBtaXNzaW5nCjEzZTJhOWIgUEdQOiBkZWZpbmUg
c2hhcmVkIGVycm9yIG1lc3NhZ2UgY29uc3RhbnRzIGZvciBib3RoIGJhY2tlbmRzCmY3NTZhZGQg
T3B0aW9uYWxseSBidWlsZCBsaWJyZXBvIGFzIGEgc3RhdGljIGxpYnJhcnkgYXMgd2VsbAphZGY0
YWZhIHRlc3Q6IGRvbid0IGV4cGVjdCBlbXB0eSBmaWxlIHdoZW4gZG93bmxvYWRpbmcgZmFpbHMK
ODRjZTc2MCBGaXggbWV0YWRhdGEgZmlsZSBkZXNjcmlwdG9yIGxlYWtzCmVjNDlmMjIgQ2xvc2Ug
emNodW5rIHNlZWQgZmQgaW4gZmluZF9sb2NhbF96Y2tfaGVhZGVyCmE0MjI3N2EgRG8gbm90IGZh
aWwgaW4gbHJfcHJlcGFyZV9yZXBvZGF0YV9kaXIoKSBpZiByZXBvZGF0YS8gZGlyIGV4aXN0cwo4
NDIwNmIyIEZpeCBkb3dubG9hZCByZXN1bWUgd2l0aGluIGEgc2luZ2xlIHNlc3Npb24KMjNhOTU4
ZiBDb25maWd1cmUgcGFja2l0IHRvIHVzZSBjYXJldCBub3RhdGlvbiBmb3IgcG9zdHJlbGVhc2Ug
c25hcHNob3RzCjllNWIwMDMgU2V0IENNQUtFX1NLSVBfUlBBVEggdG8gVFJVRQo1ZDhiMGVhIEZp
eCBtZW1vcnkgbGVha3MgaW4gYGxyX3l1bV9kb3dubG9hZF9yZXBvc2AKZTM5ZWY3NCBGaXg6IGFj
dHVhbGx5IHN0b3JlIG1ldGFsaW5rIGFuZCBtaXJyb3JsaXN0IGRvd25sb2FkIHRhcmdldHMKOWVm
ZjJmYyBQR1A6IEZpeCBjcmVhdGluZyAvcnVuL2dudXBnL3VzZXIKNzMxYjVmOSBSZXBsYWNlIGRl
cHJlY2F0ZWQgQ1VSTE9QVF9QUk9HUkVTU0ZVTkNUSU9OCmJlNzg4ZTggc3BlYzogUG9zdHJlbGVh
c2UgdmVyc2lvbiBidW1wCjVkNTI2MDYgZ3BnbWU6IEltcHJvdmUgaGFuZGxpbmcgb2YgZXhwaXJl
ZCBHUEcgc2lnbmF0dXJlcyB3aXRoIGtleSByb3RhdGlvbiBzdXBwb3J0CjA2N2UwZWEgTWVyZ2Ug
cGFja2l0IGNvcHJfYnVpbGQgam9icyBpbnRvIG9uZQozMTBkMjQ3IENJOiBDb3JyZWN0IGEgbGlu
ayB0byBwYWNraXQgZG9jdW1lbnRhdGlvbgowM2EyMGIyIEFkZCBidWlsZCByZXF1aXJlbWVudHMg
aW5zdGFsbGF0aW9uIGluc3RydWN0aW9ucwowZmM0Yjk4IFRlc3QgaW1wb3J0aW5nIGtleXMgd2l0
aCBwcmVmaXggYW5kIHN1ZmZpeAphMjYwZjIxIFdlIGNhbm5vdCBidWlsZCBmb3IgZXBlbC04IGR1
ZSB0byBnbGliMiDiiaUgMi42NiByZXF1aXJlbWVudApmMjJmYzMwIEFkZCBwYWNraXQgY29wci1i
dWlsZHMgYW5kIHRlc3RzCi0tLQogLi4uRG8tbm90LXRyeS10by1vYnRhaW4tUFlUSE9OX0lOU1RB
TExfRElSLWJ5LXJ1bm5pbmctcC5wYXRjaCB8IDQgKystLQogLi4uL2xpYnJlcG8ve2xpYnJlcG9f
MS4yMC4wLmJiID0+IGxpYnJlcG9fMS4yMS4wLmJifSAgICAgICAgICB8IDIgKy0KIDIgZmlsZXMg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9saWJyZXBvL3tsaWJyZXBvXzEuMjAuMC5iYiA9PiBsaWJyZXBvXzEuMjEu
MC5iYn0gKDk0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGlicmVwby9s
aWJyZXBvLzAwMDItRG8tbm90LXRyeS10by1vYnRhaW4tUFlUSE9OX0lOU1RBTExfRElSLWJ5LXJ1
bm5pbmctcC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJyZXBvL2xpYnJlcG8vMDAw
Mi1Eby1ub3QtdHJ5LXRvLW9idGFpbi1QWVRIT05fSU5TVEFMTF9ESVItYnktcnVubmluZy1wLnBh
dGNoCmluZGV4IGFjNTM3M2YyZTcuLjZjZmU5NzBjMmYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9saWJyZXBvL2xpYnJlcG8vMDAwMi1Eby1ub3QtdHJ5LXRvLW9idGFpbi1QWVRI
T05fSU5TVEFMTF9ESVItYnktcnVubmluZy1wLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9saWJyZXBvL2xpYnJlcG8vMDAwMi1Eby1ub3QtdHJ5LXRvLW9idGFpbi1QWVRIT05fSU5T
VEFMTF9ESVItYnktcnVubmluZy1wLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAwMDYyZjQ5
YjYyY2UwMTRkYzgxNDg1YzZhZTEwMWQ0OTM5OWQyMmNmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSBiYTgxZGZjM2FhZWFkYWQwZTIyMjcyMTM2NzQwODY0YmM5NWQ0ZjZiIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBn
bWFpbC5jb20+CiBEYXRlOiBGcmksIDMwIERlYyAyMDE2IDE4OjA1OjM2ICswMjAwCiBTdWJqZWN0
OiBbUEFUQ0hdIERvIG5vdCB0cnkgdG8gb2J0YWluIFBZVEhPTl9JTlNUQUxMX0RJUiBieSBydW5u
aW5nIHB5dGhvbi4KQEAgLTExLDcgKzExLDcgQEAgU2lnbmVkLW9mZi1ieTogV2FuZyBNaW5neXUg
PHdhbmdteUBmdWppdHN1LmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA2
IGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvbGlicmVwby9weXRob24vQ01ha2VMaXN0cy50
eHQgYi9saWJyZXBvL3B5dGhvbi9DTWFrZUxpc3RzLnR4dAotaW5kZXggODUyM2NhNy4uMDZlNWY3
YiAxMDA2NDQKK2luZGV4IDkxYjczODUuLmIwODM1OGIgMTAwNjQ0CiAtLS0gYS9saWJyZXBvL3B5
dGhvbi9DTWFrZUxpc3RzLnR4dAogKysrIGIvbGlicmVwby9weXRob24vQ01ha2VMaXN0cy50eHQK
IEBAIC0xNiwxMiArMTYsMTIgQEAgU0VUIChsaWJyZXBvbW9kdWxlX1NSQ1MKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJyZXBvL2xpYnJlcG9fMS4yMC4wLmJiIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2xpYnJlcG8vbGlicmVwb18xLjIxLjAuYmIKc2ltaWxhcml0eSBpbmRl
eCA5NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYnJlcG8vbGlicmVwb18x
LjIwLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJyZXBvL2xpYnJlcG9f
MS4yMS4wLmJiCmluZGV4IDdhMmU5ZTZiOWIuLjcyZWU5YTYyN2MgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9saWJyZXBvL2xpYnJlcG9fMS4yMC4wLmJiCisrKyBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9saWJyZXBvL2xpYnJlcG9fMS4yMS4wLmJiCkBAIC05LDcgKzksNyBAQCBT
UkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vcnBtLXNvZnR3YXJlLW1hbmFnZW1lbnQvbGlicmVw
by5naXQ7YnJhbmNoPW1hc3RlcjtwcgogICAgICAgICAgICBmaWxlOi8vMDAwMi1Eby1ub3QtdHJ5
LXRvLW9idGFpbi1QWVRIT05fSU5TVEFMTF9ESVItYnktcnVubmluZy1wLnBhdGNoIFwKICAgICAg
ICAgICAgIgogCi1TUkNSRVYgPSAiMzYzY2I3MGM2NTQ4YmU5MDA4MzJiYzliMThjZWQzZTc1Njlk
YTE1YSIKK1NSQ1JFViA9ICI1ZTViZGRhY2FkNTIxMjFmOTcwYzQ5OWUxM2E5OGQ5MzZkY2RjN2I2
IgogCiBERVBFTkRTID0gImN1cmwgZ2xpYi0yLjAgb3BlbnNzbCBhdHRyIGdwZ21lIGxpYnhtbDIi
CiAKLS0gCjIuNDcuMQoK

--===============8387795670115161492==--

