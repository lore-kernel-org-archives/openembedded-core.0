Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC918CA5FA3
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 05:17:39 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.51907.1790572654828410630
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 22:17:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=N3qSHo8s;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=tgPKSP9f;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101a0e6726b03-15298447-b30e-4406-b07c-e23b8567ee8c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790572653;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=JLP8VRoVRnnDrmGj861XlCUOo8BrspIKC873fJtVt9M=;
	b=N3qSHo8snC5VbAIJPHRhjcHGHo0tTSF2cSm/JeeAcQtMij+Re1ayGUsGFB1z8l8Y
	Pkfksnq1t9jOJ3VZYJSNoavJAjPBv0MX6kYl8QXeAxnUz3cyWJlPxVHMcfmOxt7LiTb
	vY4PZjvolRhdrWBLv/kgEbBYuYvcyiAnC+bSvMAE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790572653;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=JLP8VRoVRnnDrmGj861XlCUOo8BrspIKC873fJtVt9M=;
	b=tgPKSP9ffpFiNeo1tCc+NaJOouU1zSx5sc3WVjfQFF3Owh54QicXuE4vs5Z3hR5L
	b9vQvphrknFy121XP7xeyxjf7LYfWxCYAz6RLTz6vzWt+np4gFVDQYUtpLafq0zcnMl
	Rd9uVufnTVUj4fHSqyd99CaXDsghTEi1GHJF9y3c=
Content-Type: multipart/mixed; boundary="===============3506596501060317289=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: 
	=?utf-8?q?Juhandr=C3=A9_Knoetze_=3Cjuhandre=2Eknoetze=40windriver=2Ecom?=@yoctoproject.org, 
	=?utf-8?q?=3E?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dbus-glib: upgrading to 0.116 SUCCEEDED
Message-ID: <010101a0e6726b03-15298447-b30e-4406-b07c-e23b8567ee8c-000000@us-west-2.amazonses.com>
Date: Mon, 28 Sep 2026 05:17:33 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.28-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 05:17:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246727

--===============3506596501060317289==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sCgp0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFk
ZSBIZWxwZXIKdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBl
KHMpICpkYnVzLWdsaWIqIHRvICowLjExNiogaGFzIFN1Y2NlZWRlZC4KCk5leHQgc3RlcHM6CiAg
ICAtIGFwcGx5IHRoZSBwYXRjaDogZ2l0IGFtIDAwMDEtZGJ1cy1nbGliLXVwZ3JhZGUtMC4xMTQt
MC4xMTYucGF0Y2gKICAgIC0gY2hlY2sgdGhlIGNoYW5nZXMgdG8gdXBzdHJlYW0gcGF0Y2hlcyBh
bmQgc3VtbWFyaXplIHRoZW0gaW4gdGhlIGNvbW1pdCBtZXNzYWdlLAogICAgLSBjb21waWxlIGFu
IGltYWdlIHRoYXQgY29udGFpbnMgdGhlIHBhY2thZ2UKICAgIC0gcGVyZm9ybSBzb21lIGJhc2lj
IHNhbml0eSB0ZXN0cwogICAgLSBhbWVuZCB0aGUgcGF0Y2ggYW5kIHNpZ24gaXQgb2ZmOiBnaXQg
Y29tbWl0IC1zIC0tcmVzZXQtYXV0aG9yIC0tYW1lbmQKICAgIC0gc2VuZCBpdCB0byB0aGUgYXBw
cm9wcmlhdGUgbWFpbGluZyBsaXN0CgpBbHRlcm5hdGl2ZWx5LCBpZiB5b3UgYmVsaWV2ZSB0aGUg
cmVjaXBlIHNob3VsZCBub3QgYmUgdXBncmFkZWQgYXQgdGhpcyB0aW1lLAp5b3UgY2FuIGZpbGwg
UkVDSVBFX05PX1VQREFURV9SRUFTT04gaW4gcmVzcGVjdGl2ZSByZWNpcGUgZmlsZSBzbyB0aGF0
CmF1dG9tYXRpYyB1cGdyYWRlcyB3b3VsZCBubyBsb25nZXIgYmUgYXR0ZW1wdGVkLgoKUGxlYXNl
IHJldmlldyB0aGUgYXR0YWNoZWQgZmlsZXMgZm9yIGZ1cnRoZXIgaW5mb3JtYXRpb24gYW5kIGJ1
aWxkL3VwZGF0ZSBmYWlsdXJlcy4KQW55IHByb2JsZW0gcGxlYXNlIGZpbGUgYSBidWcgYXQgaHR0
cHM6Ly9idWd6aWxsYS55b2N0b3Byb2plY3Qub3JnL2VudGVyX2J1Zy5jZ2k/cHJvZHVjdD1BdXRv
bWF0ZWQlMjBVcGRhdGUlMjBIYW5kbGVyCgpSZWdhcmRzLApUaGUgVXBncmFkZSBIZWxwZXIKCi0t
ID44IC0tCkZyb20gM2EyOGY4NjAwNzMyYzlmZTljNDFlZDE1YTM2ODdjOWUyMzA5ZGVkZSBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKRnJvbTogVXBncmFkZSBIZWxwZXIgPGF1aEB5b2N0b3Byb2pl
Y3Qub3JnPgpEYXRlOiBNb24sIDI4IFNlcCAyMDI2IDA1OjA3OjM2ICswMDAwClN1YmplY3Q6IFtQ
QVRDSF0gZGJ1cy1nbGliOiB1cGdyYWRlIDAuMTE0IC0+IDAuMTE2Ck1JTUUtVmVyc2lvbjogMS4w
CkNvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOApDb250ZW50LVRyYW5zZmVy
LUVuY29kaW5nOiA4Yml0CgpkYnVzLWdsaWIgMC4xMTYgKDIwMjYtMDktMjcpCj09PT09PT09PT09
PT09PT09PT09PT09PT09PT0KClRoZSDigJxUaGlzIGlzIHdyb25nIHRvb2whIE5vLiBOb3QgZ29v
ZC4gTm8uIE5ldmVyIHVzZSB0aGlz4oCdIHJlbGVhc2UuCkJ1ZyBmaXhlczoKCuKAoiBSZW1vdmUg
YEdfR05VQ19DT05TVGAgZnJvbSBgX2dldF90eXBlKClgIGZ1bmN0aW9ucy4KICBUaGlzIGNhbiBj
YXVzZSBtaXNjb21waWxhdGlvbiB3aXRoIGdjYy0xNi4KICAoZGJ1cy1nbGliITcsIERhdmlkIE5v
cnRoKQoK4oCiIERpc2FibGUgYmFzaCBjb21wbGV0aW9uIGJ5IGRlZmF1bHQuCiAgVGhpcyBpcyBh
biB1bm1haW50YWluZWQgYmFzaCBjb21wbGV0aW9uIGZvciBkYnVzLXNlbmQoMSksCiAgd2hpY2gg
aXMgbm90IHBhcnQgb2YgR0xpYiwgYW5kIGFwcGFyZW50bHkgZG9lc24ndCB3b3JrIGFzIGludGVu
ZGVkLgogIEZvciBhIGRidXMtc2VuZCBlcXVpdmFsZW50IHdpdGggc2hlbGwgY29tcGxldGlvbiwg
cGxlYXNlIHRyeSBHTGliJ3MKICBnZGJ1cygxKSBvciBzeXN0ZW1kJ3MgYnVzY3RsKDEpLiAoZGJ1
cy1nbGliITUsIFNpbW9uIE1jVml0dGllKQotLS0KIC4uLi9kYnVzL3tkYnVzLWdsaWJfMC4xMTQu
YmIgPT4gZGJ1cy1nbGliXzAuMTE2LmJifSAgICAgICAgICAgICB8IDIgKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1j
b3JlL2RidXMve2RidXMtZ2xpYl8wLjExNC5iYiA9PiBkYnVzLWdsaWJfMC4xMTYuYmJ9ICg5NSUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZGJ1cy9kYnVzLWdsaWJfMC4xMTQuYmIg
Yi9tZXRhL3JlY2lwZXMtY29yZS9kYnVzL2RidXMtZ2xpYl8wLjExNi5iYgpzaW1pbGFyaXR5IGlu
ZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29yZS9kYnVzL2RidXMtZ2xpYl8wLjEx
NC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvcmUvZGJ1cy9kYnVzLWdsaWJfMC4xMTYuYmIK
aW5kZXggYzY4MjRkNTY4OC4uNjI0NDgxNWQzMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNv
cmUvZGJ1cy9kYnVzLWdsaWJfMC4xMTQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZGJ1cy9k
YnVzLWdsaWJfMC4xMTYuYmIKQEAgLTE2LDcgKzE2LDcgQEAgREVQRU5EUyA9ICJleHBhdCBnbGli
LTIuMCB2aXJ0dWFsL2xpYmludGwgZGJ1cy1nbGliLW5hdGl2ZSBkYnVzIgogREVQRU5EUzpjbGFz
cy1uYXRpdmUgPSAiZ2xpYi0yLjAtbmF0aXZlIGRidXMtbmF0aXZlIgogCiBTUkNfVVJJID0gImh0
dHBzOi8vZGJ1cy5mcmVlZGVza3RvcC5vcmcvcmVsZWFzZXMvZGJ1cy1nbGliL2RidXMtZ2xpYi0k
e1BWfS50YXIuZ3oiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYzA5YzVjMDg1YjJhMGUzOTFiOGVl
N2Q3ODNhMWQ2M2ZlNDQ0ZTk2NzE3Y2MxODE0ZDYxYjVlOGZjMjgyN2E3YyIKK1NSQ19VUklbc2hh
MjU2c3VtXSA9ICJlM2YzZDQ0ODdlMjg4MzgwMDc3MGVkNTg5OWVkMTExYmRjNGJhNzA1NmFmMzRh
MjU1YzRjNDZhZDhhMjQ4NmYzIgogCiBpbmhlcml0IGF1dG90b29scyBwa2djb25maWcgZ2V0dGV4
dCBiYXNoLWNvbXBsZXRpb24gZ3RrLWRvYwogCi0tIAoyLjQ3LjEKCg==

--===============3506596501060317289==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/dbus-glib/dbus-glib-bash-completion: FILELIST: removed all items "/etc/bash_completion.d/dbus-bash-completion.sh /usr/libexec/dbus-bash-completion-helper"
packages/x86-64-v3-poky-linux/dbus-glib/dbus-glib-bash-completion: RDEPENDS: removed "glib-2.0 (['>= 2.90.0']) expat (['>= 2.8.5']) glibc (['>= 2.44+git0+5c479454d1']) dbus-glib (['>= 0.114']) dbus-lib (['>= 1.16.2'])"
packages/x86-64-v3-poky-linux/dbus-glib/dbus-glib-bash-completion: PKGSIZE changed from 35449 to 0 (-100%)
packages/x86-64-v3-poky-linux/dbus-glib/dbus-glib-dbg: PKGSIZE changed from 988216 to 883504 (-11%)
packages/x86-64-v3-poky-linux/dbus-glib/dbus-glib: FILELIST: removed "/usr/lib/libdbus-glib-1.so.2.3.6", added "/usr/lib/libdbus-glib-1.so.2.3.7"
Changes to packages/x86-64-v3-poky-linux/dbus-glib (sysroot):
  /usr/lib/libdbus-glib-1.so.2 changed symlink target from libdbus-glib-1.so.2.3.6 to libdbus-glib-1.so.2.3.7
  /usr/lib/libdbus-glib-1.so changed symlink target from libdbus-glib-1.so.2.3.6 to libdbus-glib-1.so.2.3.7
  /usr/lib/libdbus-glib-1.so.2.3.6 moved to /usr/lib/libdbus-glib-1.so.2.3.7

--===============3506596501060317289==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="dbus-glib-changelog.txt"

ZGJ1cy1nbGliIDAuMTE2ICgyMDI2LTA5LTI3KQo9PT09PT09PT09PT09PT09PT09PT09PT09PT09
CgpUaGUg4oCcVGhpcyBpcyB3cm9uZyB0b29sISBOby4gTm90IGdvb2QuIE5vLiBOZXZlciB1c2Ug
dGhpc+KAnSByZWxlYXNlLgpCdWcgZml4ZXM6CgrigKIgUmVtb3ZlIGBHX0dOVUNfQ09OU1RgIGZy
b20gYF9nZXRfdHlwZSgpYCBmdW5jdGlvbnMuCiAgVGhpcyBjYW4gY2F1c2UgbWlzY29tcGlsYXRp
b24gd2l0aCBnY2MtMTYuCiAgKGRidXMtZ2xpYiE3LCBEYXZpZCBOb3J0aCkKCuKAoiBEaXNhYmxl
IGJhc2ggY29tcGxldGlvbiBieSBkZWZhdWx0LgogIFRoaXMgaXMgYW4gdW5tYWludGFpbmVkIGJh
c2ggY29tcGxldGlvbiBmb3IgZGJ1cy1zZW5kKDEpLAogIHdoaWNoIGlzIG5vdCBwYXJ0IG9mIEdM
aWIsIGFuZCBhcHBhcmVudGx5IGRvZXNuJ3Qgd29yayBhcyBpbnRlbmRlZC4KICBGb3IgYSBkYnVz
LXNlbmQgZXF1aXZhbGVudCB3aXRoIHNoZWxsIGNvbXBsZXRpb24sIHBsZWFzZSB0cnkgR0xpYidz
CiAgZ2RidXMoMSkgb3Igc3lzdGVtZCdzIGJ1c2N0bCgxKS4gKGRidXMtZ2xpYiE1LCBTaW1vbiBN
Y1ZpdHRpZSkK

--===============3506596501060317289==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dbus-glib-upgrade-0.114-0.116.patch"

RnJvbSAzYTI4Zjg2MDA3MzJjOWZlOWM0MWVkMTVhMzY4N2M5ZTIzMDlkZWRlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMjggU2VwIDIwMjYgMDU6MDc6MzYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
YnVzLWdsaWI6IHVwZ3JhZGUgMC4xMTQgLT4gMC4xMTYKTUlNRS1WZXJzaW9uOiAxLjAKQ29udGVu
dC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04CkNvbnRlbnQtVHJhbnNmZXItRW5jb2Rp
bmc6IDhiaXQKCmRidXMtZ2xpYiAwLjExNiAoMjAyNi0wOS0yNykKPT09PT09PT09PT09PT09PT09
PT09PT09PT09PQoKVGhlIOKAnFRoaXMgaXMgd3JvbmcgdG9vbCEgTm8uIE5vdCBnb29kLiBOby4g
TmV2ZXIgdXNlIHRoaXPigJ0gcmVsZWFzZS4KQnVnIGZpeGVzOgoK4oCiIFJlbW92ZSBgR19HTlVD
X0NPTlNUYCBmcm9tIGBfZ2V0X3R5cGUoKWAgZnVuY3Rpb25zLgogIFRoaXMgY2FuIGNhdXNlIG1p
c2NvbXBpbGF0aW9uIHdpdGggZ2NjLTE2LgogIChkYnVzLWdsaWIhNywgRGF2aWQgTm9ydGgpCgri
gKIgRGlzYWJsZSBiYXNoIGNvbXBsZXRpb24gYnkgZGVmYXVsdC4KICBUaGlzIGlzIGFuIHVubWFp
bnRhaW5lZCBiYXNoIGNvbXBsZXRpb24gZm9yIGRidXMtc2VuZCgxKSwKICB3aGljaCBpcyBub3Qg
cGFydCBvZiBHTGliLCBhbmQgYXBwYXJlbnRseSBkb2Vzbid0IHdvcmsgYXMgaW50ZW5kZWQuCiAg
Rm9yIGEgZGJ1cy1zZW5kIGVxdWl2YWxlbnQgd2l0aCBzaGVsbCBjb21wbGV0aW9uLCBwbGVhc2Ug
dHJ5IEdMaWIncwogIGdkYnVzKDEpIG9yIHN5c3RlbWQncyBidXNjdGwoMSkuIChkYnVzLWdsaWIh
NSwgU2ltb24gTWNWaXR0aWUpCi0tLQogLi4uL2RidXMve2RidXMtZ2xpYl8wLjExNC5iYiA9PiBk
YnVzLWdsaWJfMC4xMTYuYmJ9ICAgICAgICAgICAgIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUvZGJ1
cy97ZGJ1cy1nbGliXzAuMTE0LmJiID0+IGRidXMtZ2xpYl8wLjExNi5iYn0gKDk1JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9kYnVzL2RidXMtZ2xpYl8wLjExNC5iYiBiL21ldGEv
cmVjaXBlcy1jb3JlL2RidXMvZGJ1cy1nbGliXzAuMTE2LmJiCnNpbWlsYXJpdHkgaW5kZXggOTUl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3JlL2RidXMvZGJ1cy1nbGliXzAuMTE0LmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS9kYnVzL2RidXMtZ2xpYl8wLjExNi5iYgppbmRleCBj
NjgyNGQ1Njg4Li42MjQ0ODE1ZDMwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9kYnVz
L2RidXMtZ2xpYl8wLjExNC5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9kYnVzL2RidXMtZ2xp
Yl8wLjExNi5iYgpAQCAtMTYsNyArMTYsNyBAQCBERVBFTkRTID0gImV4cGF0IGdsaWItMi4wIHZp
cnR1YWwvbGliaW50bCBkYnVzLWdsaWItbmF0aXZlIGRidXMiCiBERVBFTkRTOmNsYXNzLW5hdGl2
ZSA9ICJnbGliLTIuMC1uYXRpdmUgZGJ1cy1uYXRpdmUiCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly9k
YnVzLmZyZWVkZXNrdG9wLm9yZy9yZWxlYXNlcy9kYnVzLWdsaWIvZGJ1cy1nbGliLSR7UFZ9LnRh
ci5neiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJjMDljNWMwODViMmEwZTM5MWI4ZWU3ZDc4M2Ex
ZDYzZmU0NDRlOTY3MTdjYzE4MTRkNjFiNWU4ZmMyODI3YTdjIgorU1JDX1VSSVtzaGEyNTZzdW1d
ID0gImUzZjNkNDQ4N2UyODgzODAwNzcwZWQ1ODk5ZWQxMTFiZGM0YmE3MDU2YWYzNGEyNTVjNGM0
NmFkOGEyNDg2ZjMiCiAKIGluaGVyaXQgYXV0b3Rvb2xzIHBrZ2NvbmZpZyBnZXR0ZXh0IGJhc2gt
Y29tcGxldGlvbiBndGstZG9jCiAKLS0gCjIuNDcuMQoK

--===============3506596501060317289==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/dbus-glib/dbus-glib-bash-completion: PKGSIZE changed from 35449 to 0 (-100%)
packages/x86-64-v3-poky-linux/dbus-glib/dbus-glib-bash-completion: FILELIST: removed all items "/usr/libexec/dbus-bash-completion-helper /etc/bash_completion.d/dbus-bash-completion.sh"
packages/x86-64-v3-poky-linux/dbus-glib/dbus-glib-bash-completion: PKGV changed from 0.114 [default] to 0.116 [default]
packages/x86-64-v3-poky-linux/dbus-glib/dbus-glib-bash-completion: PV changed from "0.114" to "0.116"
packages/x86-64-v3-poky-linux/dbus-glib/dbus-glib-bash-completion: RDEPENDS: removed "expat (['>= 2.8.5']) glibc (['>= 2.44+git0+5c479454d1']) glib-2.0 (['>= 2.90.0']) dbus-lib (['>= 1.16.2']) dbus-glib (['>= 0.114'])"
packages/x86-64-v3-poky-linux/dbus-glib/dbus-glib-dbg: PKGSIZE changed from 988216 to 883504 (-11%)
packages/x86-64-v3-poky-linux/dbus-glib/dbus-glib-dbg: FILELIST: removed "/usr/lib/.debug/libdbus-glib-1.so.2.3.6 /usr/libexec/.debug/dbus-bash-completion-helper", added "/usr/lib/.debug/libdbus-glib-1.so.2.3.7"
packages/x86-64-v3-poky-linux/dbus-glib/dbus-glib-dbg: PKGV changed from 0.114 [default] to 0.116 [default]
packages/x86-64-v3-poky-linux/dbus-glib/dbus-glib-dbg: PV changed from "0.114" to "0.116"
packages/x86-64-v3-poky-linux/dbus-glib/dbus-glib-dev: PKGSIZE changed from 50142 to 50051 (-0%)
packages/x86-64-v3-poky-linux/dbus-glib/dbus-glib-dev: PKGV changed from 0.114 [default] to 0.116 [default]
packages/x86-64-v3-poky-linux/dbus-glib/dbus-glib-dev: PV changed from "0.114" to "0.116"
packages/x86-64-v3-poky-linux/dbus-glib/dbus-glib-doc: PKGV changed from 0.114 [default] to 0.116 [default]
packages/x86-64-v3-poky-linux/dbus-glib/dbus-glib-doc: PV changed from "0.114" to "0.116"
packages/x86-64-v3-poky-linux/dbus-glib/dbus-glib-locale: PKGV changed from 0.114 [default] to 0.116 [default]
packages/x86-64-v3-poky-linux/dbus-glib/dbus-glib-locale: PV changed from "0.114" to "0.116"
packages/x86-64-v3-poky-linux/dbus-glib/dbus-glib-src: PKGSIZE changed from 597432 to 582099 (-3%)
packages/x86-64-v3-poky-linux/dbus-glib/dbus-glib-src: FILELIST: directory renamed /usr/src/debug/dbus-glib/0.114/dbus-gmain -> /usr/src/debug/dbus-glib/0.116/dbus-gmain, removed "/usr/src/debug/dbus-glib/0.114/dbus/dbus-gparser.c /usr/src/debug/dbus-glib/0.114/dbus/dbus-gthread.c /usr/src/debug/dbus-glib/0.114/dbus/dbus-gobject.c /usr/src/debug/dbus-glib/0.114/dbus/dbus-gparser.h /usr/src/debug/dbus-glib/0.114/dbus/dbus-gobject.h /usr/src/debug/dbus-glib/0.114/dbus/dbus-gtest.c /usr/src/debug/dbus-glib/0.114/dbus/dbus-gtype-specialized.c /usr/src/debug/dbus-glib/0.114/dbus/dbus-gidl.c /usr/src/debug/dbus-glib/0.114/dbus/dbus-gidl.h /usr/src/debug/dbus-glib/0.114/dbus/dbus-gtype-specialized.h /usr/src/debug/dbus-glib/0.114/dbus/dbus-gloader-expat.c /usr/src/debug/dbus-glib/0.114/dbus/dbus-gproxy.c /usr/src/debug/dbus-glib/0.114/dbus/dbus-gutils.c /usr/src/debug/dbus-glib/0.114/dbus/dbus-gvalue.c /usr/src/debug/dbus-glib/0.114/dbus/dbus-gsignature.c /usr/src/debug/dbus-glib/0.114/dbus
 /dbus-gutils.h /usr/src/debug/dbus-glib/0.114/dbus/dbus-gtype-specialized-priv.h /usr/src/debug/dbus-glib/0.114/dbus/dbus-gvalue.h /usr/src/debug/dbus-glib/0.114/dbus/dbus-gsignature.h /usr/src/debug/dbus-glib/0.114/dbus/dbus-gvalue-parse-variant.c /usr/src/debug/dbus-glib/0.114/dbus/dbus-binding-tool-glib.c /usr/src/debug/dbus-glib/0.114/dbus/dbus-gvalue-utils.c /usr/src/debug/dbus-glib/0.114/dbus/dbus-bash-completion-helper.c /usr/src/debug/dbus-glib/0.114/dbus/dbus-binding-tool-glib.h /usr/src/debug/dbus-glib/0.114/dbus/dbus-gvalue-utils.h /usr/src/debug/dbus-glib/0.114/dbus/dbus-glib.c /usr/src/debug/dbus-glib/0.114/dbus/dbus-glib-tool.c /usr/src/debug/dbus-glib/0.114/dbus/dbus-glib-lowlevel.h /usr/src/debug/dbus-glib/0.114/dbus/dbus-glib.h /usr/src/debug/dbus-glib/0.114/dbus/dbus-glib-tool.h /usr/src/debug/dbus-glib/0.114/dbus/dbus-gmarshal.c", added "/usr/src/debug/dbus-glib/0.116/dbus/dbus-gparser.c /usr/src/debug/dbus-glib/0.116/dbus/dbus-gthread.c /usr/src/debug/dbus-glib/0
 .116/dbus/dbus-gobject.c /usr/src/debug/dbus-glib/0.116/dbus/dbus-gparser.h /usr/src/debug/dbus-glib/0.116/dbus/dbus-gobject.h /usr/src/debug/dbus-glib/0.116/dbus/dbus-gtest.c /usr/src/debug/dbus-glib/0.116/dbus/dbus-gtype-specialized.c /usr/src/debug/dbus-glib/0.116/dbus/dbus-gidl.c /usr/src/debug/dbus-glib/0.116/dbus/dbus-gidl.h /usr/src/debug/dbus-glib/0.116/dbus/dbus-gtype-specialized.h /usr/src/debug/dbus-glib/0.116/dbus/dbus-gloader-expat.c /usr/src/debug/dbus-glib/0.116/dbus/dbus-gproxy.c /usr/src/debug/dbus-glib/0.116/dbus/dbus-gutils.c /usr/src/debug/dbus-glib/0.116/dbus/dbus-gvalue.c /usr/src/debug/dbus-glib/0.116/dbus/dbus-gsignature.c /usr/src/debug/dbus-glib/0.116/dbus/dbus-gutils.h /usr/src/debug/dbus-glib/0.116/dbus/dbus-gtype-specialized-priv.h /usr/src/debug/dbus-glib/0.116/dbus/dbus-gvalue.h /usr/src/debug/dbus-glib/0.116/dbus/dbus-gsignature.h /usr/src/debug/dbus-glib/0.116/dbus/dbus-gvalue-parse-variant.c /usr/src/debug/dbus-glib/0.116/dbus/dbus-binding-tool-glib
 .c /usr/src/debug/dbus-glib/0.116/dbus/dbus-gvalue-utils.c /usr/src/debug/dbus-glib/0.116/dbus/dbus-binding-tool-glib.h /usr/src/debug/dbus-glib/0.116/dbus/dbus-gvalue-utils.h /usr/src/debug/dbus-glib/0.116/dbus/dbus-glib.c /usr/src/debug/dbus-glib/0.116/dbus/dbus-glib-tool.c /usr/src/debug/dbus-glib/0.116/dbus/dbus-glib-lowlevel.h /usr/src/debug/dbus-glib/0.116/dbus/dbus-glib.h /usr/src/debug/dbus-glib/0.116/dbus/dbus-glib-tool.h /usr/src/debug/dbus-glib/0.116/dbus/dbus-gmarshal.c"
packages/x86-64-v3-poky-linux/dbus-glib/dbus-glib-src: PKGV changed from 0.114 [default] to 0.116 [default]
packages/x86-64-v3-poky-linux/dbus-glib/dbus-glib-src: PV changed from "0.114" to "0.116"
packages/x86-64-v3-poky-linux/dbus-glib/dbus-glib-staticdev: PKGV changed from 0.114 [default] to 0.116 [default]
packages/x86-64-v3-poky-linux/dbus-glib/dbus-glib-staticdev: PV changed from "0.114" to "0.116"
packages/x86-64-v3-poky-linux/dbus-glib/dbus-glib-tools: PKGV changed from 0.114 [default] to 0.116 [default]
packages/x86-64-v3-poky-linux/dbus-glib/dbus-glib-tools: PV changed from "0.114" to "0.116"
packages/x86-64-v3-poky-linux/dbus-glib/dbus-glib: FILELIST: removed "/usr/lib/libdbus-glib-1.so.2.3.6", added "/usr/lib/libdbus-glib-1.so.2.3.7"
packages/x86-64-v3-poky-linux/dbus-glib/dbus-glib: PKGV changed from 0.114 [default] to 0.116 [default]
packages/x86-64-v3-poky-linux/dbus-glib/dbus-glib: PV changed from "0.114" to "0.116"
packages/x86-64-v3-poky-linux/dbus-glib: PKGV changed from 0.114 [default] to 0.116 [default]
packages/x86-64-v3-poky-linux/dbus-glib: SRC_URI changed from "https://dbus.freedesktop.org/releases/dbus-glib/dbus-glib-0.114.tar.gz" to "https://dbus.freedesktop.org/releases/dbus-glib/dbus-glib-0.116.tar.gz"
packages/x86-64-v3-poky-linux/dbus-glib: PV changed from "0.114" to "0.116"
Changes to packages/x86-64-v3-poky-linux/dbus-glib (sysroot):
  /usr/lib/libdbus-glib-1.so.2 changed symlink target from libdbus-glib-1.so.2.3.6 to libdbus-glib-1.so.2.3.7
  /usr/lib/libdbus-glib-1.so changed symlink target from libdbus-glib-1.so.2.3.6 to libdbus-glib-1.so.2.3.7
  /usr/lib/libdbus-glib-1.so.2.3.6 moved to /usr/lib/libdbus-glib-1.so.2.3.7

--===============3506596501060317289==--

