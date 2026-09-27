Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B12AC9830E
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 05:16:32 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31804.1790486186109087877
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Sep 2026 22:16:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=tu1QwX9d;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=HjnpMsrf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101a0e14b04ae-1ae30082-f065-423b-bf88-6d1f5ba5c8d5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790486185;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/JBgnWCBMbPyhAobihhndoq7BdUWTVsMeibvWxj6ohc=;
	b=tu1QwX9d+QOEaO3HlX2MA8KkEer6MqZDWuXBnqbeYIcyaKNLqDmGF4EjB971LbWn
	xcpC7ihisq6xq4r3ufr1x0HRh9oIBRzFxZhlgWgcWGP2iCxLaZsPJqYRSQp/uBLP6DN
	F732xIWx3514JfBJbTBJjiPZUF3LFGC6JKmNd9I8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790486185;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/JBgnWCBMbPyhAobihhndoq7BdUWTVsMeibvWxj6ohc=;
	b=HjnpMsrf0s/Wnyj3Ubz+2IpjbZR8F4Yv8bV9t7jC2tgMtuIFCkzpKga0IfNY6jbS
	SaqBN5dSttwwtuBqNtNP/Ix6bfabIsqh0lkP3VROEw8bKGWUGaXEq1ZGB1xmTAty5FA
	CTq0H0xzVya/ChT+/vFcylanynFCkr3tGauFQI80=
Content-Type: multipart/mixed; boundary="===============7813831496673508329=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-meson-python: upgrading to 0.22.0 SUCCEEDED
Message-ID: <010101a0e14b04ae-1ae30082-f065-423b-bf88-6d1f5ba5c8d5-000000@us-west-2.amazonses.com>
Date: Sun, 27 Sep 2026 05:16:25 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.27-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 05:16:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246645

--===============7813831496673508329==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sCgp0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFk
ZSBIZWxwZXIKdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBl
KHMpICpweXRob24zLW1lc29uLXB5dGhvbiogdG8gKjAuMjIuMCogaGFzIFN1Y2NlZWRlZC4KCk5l
eHQgc3RlcHM6CiAgICAtIGFwcGx5IHRoZSBwYXRjaDogZ2l0IGFtIDAwMDEtcHl0aG9uMy1tZXNv
bi1weXRob24tdXBncmFkZS0wLjIxLjEtMC4yMi4wLnBhdGNoCiAgICAtIGNoZWNrIHRoZSBjaGFu
Z2VzIHRvIHVwc3RyZWFtIHBhdGNoZXMgYW5kIHN1bW1hcml6ZSB0aGVtIGluIHRoZSBjb21taXQg
bWVzc2FnZSwKICAgIC0gY29tcGlsZSBhbiBpbWFnZSB0aGF0IGNvbnRhaW5zIHRoZSBwYWNrYWdl
CiAgICAtIHBlcmZvcm0gc29tZSBiYXNpYyBzYW5pdHkgdGVzdHMKICAgIC0gYW1lbmQgdGhlIHBh
dGNoIGFuZCBzaWduIGl0IG9mZjogZ2l0IGNvbW1pdCAtcyAtLXJlc2V0LWF1dGhvciAtLWFtZW5k
CiAgICAtIHNlbmQgaXQgdG8gdGhlIGFwcHJvcHJpYXRlIG1haWxpbmcgbGlzdAoKQWx0ZXJuYXRp
dmVseSwgaWYgeW91IGJlbGlldmUgdGhlIHJlY2lwZSBzaG91bGQgbm90IGJlIHVwZ3JhZGVkIGF0
IHRoaXMgdGltZSwKeW91IGNhbiBmaWxsIFJFQ0lQRV9OT19VUERBVEVfUkVBU09OIGluIHJlc3Bl
Y3RpdmUgcmVjaXBlIGZpbGUgc28gdGhhdAphdXRvbWF0aWMgdXBncmFkZXMgd291bGQgbm8gbG9u
Z2VyIGJlIGF0dGVtcHRlZC4KClBsZWFzZSByZXZpZXcgdGhlIGF0dGFjaGVkIGZpbGVzIGZvciBm
dXJ0aGVyIGluZm9ybWF0aW9uIGFuZCBidWlsZC91cGRhdGUgZmFpbHVyZXMuCkFueSBwcm9ibGVt
IHBsZWFzZSBmaWxlIGEgYnVnIGF0IGh0dHBzOi8vYnVnemlsbGEueW9jdG9wcm9qZWN0Lm9yZy9l
bnRlcl9idWcuY2dpP3Byb2R1Y3Q9QXV0b21hdGVkJTIwVXBkYXRlJTIwSGFuZGxlcgoKUmVnYXJk
cywKVGhlIFVwZ3JhZGUgSGVscGVyCgotLSA+OCAtLQpGcm9tIDYwOTQ4NjFkYTIxNThmNDQ3Nzg3
MWQyNjQ1NmVjM2VlNDQyMGQ2M2YgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCkZyb206IFVwZ3Jh
ZGUgSGVscGVyIDxhdWhAeW9jdG9wcm9qZWN0Lm9yZz4KRGF0ZTogU3VuLCAyNyBTZXAgMjAyNiAw
NTowNzoyMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5dGhvbjMtbWVzb24tcHl0aG9uOiB1cGdy
YWRlIDAuMjEuMSAtPiAwLjIyLjAKTUlNRS1WZXJzaW9uOiAxLjAKQ29udGVudC1UeXBlOiB0ZXh0
L3BsYWluOyBjaGFyc2V0PVVURi04CkNvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKCjAu
MjIuMAo9PT09PT0KCi0gQWRkIHN1cHBvcnQgZm9yIGFkZGluZyBSUEFUSCBlbnRyaWVzIHNwZWNp
ZmllZCB3aXRoIGBgaW5zdGFsbF9ycGF0aGBgCiAgYXJndW1lbnQgdG8gTWVzb24gZnVuY3Rpb25z
IHRoYXQgYWNjZXB0IGl0LgotIEFkZCBzdXBwb3J0IGZvciByZW1vdmluZyBidWlsZCBSUEFUSCBl
bnRyaWVzIGFkZGVkIGJ5IE1lc29uIHRvIGFsbG93CiAgZXhlY3V0aW5nIHBhcnRzIG9mIHRoZSBw
cm9qZWN0IGZyb20gdGhlIGJ1aWxkIGRpcmVjdG9yeS4KLSBGaXggY29ybmVyIGNhc2VzIGluIGhh
bmRsaW5nIFJQQVRIIGVudHJpZXMgYW5kIHJlbG9jYXRpb24gb2Ygc2hhcmVkCiAgbGlicmFyaWVz
IGRpc3RyaWJ1dGVkIGFzIHBhcnQgb2YgUHl0aG9uIHBhY2thZ2VzLgoKRGFuaWVsZSBOaWNvbG9k
aSwgTWlrZSBUYXZlcywgTmF0aGFuIEdvbGRiYXVtLCBSYWxmIEdvbW1lcnMgLS0tIDI1LTA5LTIw
MjYuCgotIEZyb20gdGhpcyByZWxlYXNlIG9ud2FyZHMsIFNTSCBrZXlzIHVzZWQgdG8gc2lnbiBy
ZWxlYXNlIHRhZ3MuCkRhbmllbGUgTmljb2xvZGksIE1pY2hhxYIgR8Ozcm55LCBSYWxmIEdvbW1l
cnMgLS0tIDA3LTA5LTIwMjYuCi0tLQogLi4ubjMtbWVzb24tcHl0aG9uXzAuMjEuMS5iYiA9PiBw
eXRob24zLW1lc29uLXB5dGhvbl8wLjIyLjAuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi97cHl0aG9uMy1tZXNvbi1weXRob25fMC4yMS4xLmJiID0+IHB5dGhvbjMtbWVzb24t
cHl0aG9uXzAuMjIuMC5iYn0gKDg1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtbWVzb24tcHl0aG9uXzAuMjEuMS5iYiBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1tZXNvbi1weXRob25fMC4yMi4wLmJiCnNpbWlsYXJpdHkg
aW5kZXggODUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1tZXNvbi1weXRob25fMC4yMS4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtbWVzb24tcHl0aG9uXzAuMjIuMC5iYgppbmRleCAyYzg2ZjdmZWQ0Li5m
ODVmNmM1NWNiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtbWVzb24tcHl0aG9uXzAuMjEuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtbWVzb24tcHl0aG9uXzAuMjIuMC5iYgpAQCAtMTMsNyArMTMsNyBAQCBERVBF
TkRTID0gIiBcCiBQWVBJX1BBQ0tBR0UgPSAibWVzb25fcHl0aG9uIgogCiBpbmhlcml0IHB5cGkg
cHl0aG9uX21lc29ucHkKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI3OGIzMzQ1ZGNiYzBmZWQ3Yjkz
OWU3ZTM3YTlmYWFiMzViZGRhYWUwN2JmNjJlNzU0MmM4YWQ0NzljMzk1YWY1IgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjljODE5ZDBkNGVmYTc0NmVkYWRmYWFlNDY2M2MwZTljNzU2NTkxODZlZjdl
NWJhYjEyMzMwYmZlMjI5NjRkZmMiCiAKIERFUEVORFM6cmVtb3ZlOmNsYXNzLW5hdGl2ZSA9ICJw
eXRob24zLW1lc29uLXB5dGhvbi1uYXRpdmUiCiAKLS0gCjIuNDcuMQoK

--===============7813831496673508329==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python: FILELIST: directory renamed /usr/lib/python3.14/site-packages/meson_python-0.21.1.dist-info/licenses/LICENSES -> /usr/lib/python3.14/site-packages/meson_python-0.22.0.dist-info/licenses/LICENSES, directory renamed /usr/lib/python3.14/site-packages/meson_python-0.21.1.dist-info -> /usr/lib/python3.14/site-packages/meson_python-0.22.0.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-meson-python (sysroot):
  /usr/lib/python3.14/site-packages/meson_python-0.21.1.dist-info moved to /usr/lib/python3.14/site-packages/meson_python-0.22.0.dist-info

--===============7813831496673508329==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-meson-python: SRC_URI changed from "https://files.pythonhosted.org/packages/source/m/meson_python/meson_python-0.21.1.tar.gz" to "https://files.pythonhosted.org/packages/source/m/meson_python/meson_python-0.22.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-meson-python: PKGV changed from 0.21.1 [default] to 0.22.0 [default]
packages/x86-64-v3-poky-linux/python3-meson-python: PV changed from "0.21.1" to "0.22.0"
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python-dbg: PKGV changed from 0.21.1 [default] to 0.22.0 [default]
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python-dbg: PV changed from "0.21.1" to "0.22.0"
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python-dev: PKGV changed from 0.21.1 [default] to 0.22.0 [default]
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python-dev: PV changed from "0.21.1" to "0.22.0"
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python-doc: PKGV changed from 0.21.1 [default] to 0.22.0 [default]
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python-doc: PV changed from "0.21.1" to "0.22.0"
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python-locale: PKGV changed from 0.21.1 [default] to 0.22.0 [default]
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python-locale: PV changed from "0.21.1" to "0.22.0"
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python-src: PKGV changed from 0.21.1 [default] to 0.22.0 [default]
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python-src: PV changed from "0.21.1" to "0.22.0"
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python-staticdev: PKGV changed from 0.21.1 [default] to 0.22.0 [default]
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python-staticdev: PV changed from "0.21.1" to "0.22.0"
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python: PKGSIZE changed from 235790 to 244602 (+4%)
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python: PKGV changed from 0.21.1 [default] to 0.22.0 [default]
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python: FILELIST: directory renamed /usr/lib/python3.14/site-packages/meson_python-0.21.1.dist-info/licenses/LICENSES -> /usr/lib/python3.14/site-packages/meson_python-0.22.0.dist-info/licenses/LICENSES, directory renamed /usr/lib/python3.14/site-packages/meson_python-0.21.1.dist-info -> /usr/lib/python3.14/site-packages/meson_python-0.22.0.dist-info
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python: PV changed from "0.21.1" to "0.22.0"
Changes to packages/x86-64-v3-poky-linux/python3-meson-python (sysroot):
  /usr/lib/python3.14/site-packages/meson_python-0.21.1.dist-info moved to /usr/lib/python3.14/site-packages/meson_python-0.22.0.dist-info

--===============7813831496673508329==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="python3-meson-python-changelog.txt"

MC4yMi4wCj09PT09PQoKLSBBZGQgc3VwcG9ydCBmb3IgYWRkaW5nIFJQQVRIIGVudHJpZXMgc3Bl
Y2lmaWVkIHdpdGggYGBpbnN0YWxsX3JwYXRoYGAKICBhcmd1bWVudCB0byBNZXNvbiBmdW5jdGlv
bnMgdGhhdCBhY2NlcHQgaXQuCi0gQWRkIHN1cHBvcnQgZm9yIHJlbW92aW5nIGJ1aWxkIFJQQVRI
IGVudHJpZXMgYWRkZWQgYnkgTWVzb24gdG8gYWxsb3cKICBleGVjdXRpbmcgcGFydHMgb2YgdGhl
IHByb2plY3QgZnJvbSB0aGUgYnVpbGQgZGlyZWN0b3J5LgotIEZpeCBjb3JuZXIgY2FzZXMgaW4g
aGFuZGxpbmcgUlBBVEggZW50cmllcyBhbmQgcmVsb2NhdGlvbiBvZiBzaGFyZWQKICBsaWJyYXJp
ZXMgZGlzdHJpYnV0ZWQgYXMgcGFydCBvZiBQeXRob24gcGFja2FnZXMuCgpEYW5pZWxlIE5pY29s
b2RpLCBNaWtlIFRhdmVzLCBOYXRoYW4gR29sZGJhdW0sIFJhbGYgR29tbWVycyAtLS0gMjUtMDkt
MjAyNi4KCi0gRnJvbSB0aGlzIHJlbGVhc2Ugb253YXJkcywgU1NIIGtleXMgdXNlZCB0byBzaWdu
IHJlbGVhc2UgdGFncy4KRGFuaWVsZSBOaWNvbG9kaSwgTWljaGHFgiBHw7NybnksIFJhbGYgR29t
bWVycyAtLS0gMDctMDktMjAyNi4K

--===============7813831496673508329==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-meson-python-upgrade-0.21.1-0.22.0.patch"

RnJvbSA2MDk0ODYxZGEyMTU4ZjQ0Nzc4NzFkMjY0NTZlYzNlZTQ0MjBkNjNmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMjcgU2VwIDIwMjYgMDU6MDc6MjEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLW1lc29uLXB5dGhvbjogdXBncmFkZSAwLjIxLjEgLT4gMC4yMi4wCk1JTUUtVmVyc2lv
bjogMS4wCkNvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOApDb250ZW50LVRy
YW5zZmVyLUVuY29kaW5nOiA4Yml0CgowLjIyLjAKPT09PT09CgotIEFkZCBzdXBwb3J0IGZvciBh
ZGRpbmcgUlBBVEggZW50cmllcyBzcGVjaWZpZWQgd2l0aCBgYGluc3RhbGxfcnBhdGhgYAogIGFy
Z3VtZW50IHRvIE1lc29uIGZ1bmN0aW9ucyB0aGF0IGFjY2VwdCBpdC4KLSBBZGQgc3VwcG9ydCBm
b3IgcmVtb3ZpbmcgYnVpbGQgUlBBVEggZW50cmllcyBhZGRlZCBieSBNZXNvbiB0byBhbGxvdwog
IGV4ZWN1dGluZyBwYXJ0cyBvZiB0aGUgcHJvamVjdCBmcm9tIHRoZSBidWlsZCBkaXJlY3Rvcnku
Ci0gRml4IGNvcm5lciBjYXNlcyBpbiBoYW5kbGluZyBSUEFUSCBlbnRyaWVzIGFuZCByZWxvY2F0
aW9uIG9mIHNoYXJlZAogIGxpYnJhcmllcyBkaXN0cmlidXRlZCBhcyBwYXJ0IG9mIFB5dGhvbiBw
YWNrYWdlcy4KCkRhbmllbGUgTmljb2xvZGksIE1pa2UgVGF2ZXMsIE5hdGhhbiBHb2xkYmF1bSwg
UmFsZiBHb21tZXJzIC0tLSAyNS0wOS0yMDI2LgoKLSBGcm9tIHRoaXMgcmVsZWFzZSBvbndhcmRz
LCBTU0gga2V5cyB1c2VkIHRvIHNpZ24gcmVsZWFzZSB0YWdzLgpEYW5pZWxlIE5pY29sb2RpLCBN
aWNoYcWCIEfDs3JueSwgUmFsZiBHb21tZXJzIC0tLSAwNy0wOS0yMDI2LgotLS0KIC4uLm4zLW1l
c29uLXB5dGhvbl8wLjIxLjEuYmIgPT4gcHl0aG9uMy1tZXNvbi1weXRob25fMC4yMi4wLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtbWVzb24tcHl0aG9uXzAu
MjEuMS5iYiA9PiBweXRob24zLW1lc29uLXB5dGhvbl8wLjIyLjAuYmJ9ICg4NSUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1lc29uLXB5dGhvbl8w
LjIxLjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWVzb24tcHl0
aG9uXzAuMjIuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDg1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWVzb24tcHl0aG9uXzAuMjEuMS5iYgpyZW5hbWUg
dG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1lc29uLXB5dGhvbl8wLjIy
LjAuYmIKaW5kZXggMmM4NmY3ZmVkNC4uZjg1ZjZjNTVjYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1lc29uLXB5dGhvbl8wLjIxLjEuYmIKKysrIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1lc29uLXB5dGhvbl8wLjIyLjAu
YmIKQEAgLTEzLDcgKzEzLDcgQEAgREVQRU5EUyA9ICIgXAogUFlQSV9QQUNLQUdFID0gIm1lc29u
X3B5dGhvbiIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9tZXNvbnB5Ci1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiNzhiMzM0NWRjYmMwZmVkN2I5MzllN2UzN2E5ZmFhYjM1YmRkYWFlMDdiZjYyZTc1NDJj
OGFkNDc5YzM5NWFmNSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI5YzgxOWQwZDRlZmE3NDZlZGFk
ZmFhZTQ2NjNjMGU5Yzc1NjU5MTg2ZWY3ZTViYWIxMjMzMGJmZTIyOTY0ZGZjIgogCiBERVBFTkRT
OnJlbW92ZTpjbGFzcy1uYXRpdmUgPSAicHl0aG9uMy1tZXNvbi1weXRob24tbmF0aXZlIgogCi0t
IAoyLjQ3LjEKCg==

--===============7813831496673508329==--

