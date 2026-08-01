Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 271B6C55181
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 06:05:30 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.936.1785564322574829860
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jul 2026 23:05:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=bl/QZd33;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=PiaGQgQE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019fbbed5730-9ced821c-8aaf-427e-b617-b198935c6954-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1785564321;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=MjgZdPGV+dt6Trafm+I6uY22A6wfSFSVclJVgnF5cZQ=;
	b=bl/QZd338JrDm9cJdVgtKfMXZOE1yn3de+jgEI63iTiK8UT04IJJh7mly6YRedrp
	jlYkuT9rBUsIadrmXy0XLhS2ScM9b3912fs/JOMCztPSSIF2NfgD7Dw/z8iKc6NVVCy
	9PB4pkZhKmJzmeVS96JlbJmVCVjux1f9t2v2gYCk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1785564321;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=MjgZdPGV+dt6Trafm+I6uY22A6wfSFSVclJVgnF5cZQ=;
	b=PiaGQgQEreRzLbgsqkpJgZ5XiHTPE38NkoSD/8UMDmGIgFzY8wRxTOm7VqvuPq5e
	wfWiWAEnSoESboVvJ4Kou2SN4cFbcssuLG3Ek/wdHAHc4XH/FbM/xLkRR7FI+rsluzH
	fbqTqJ0wREBC/KdcHdMeO/9pwtIqVUub8KX985x0=
Content-Type: multipart/mixed; boundary="===============1066665864141599809=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] harfbuzz: upgrading to 14.3.0 SUCCEEDED
Message-ID: <0101019fbbed5730-9ced821c-8aaf-427e-b617-b198935c6954-000000@us-west-2.amazonses.com>
Date: Sat, 1 Aug 2026 06:05:21 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2026 06:05:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242465

--===============1066665864141599809==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sCgp0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFk
ZSBIZWxwZXIKdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBl
KHMpICpoYXJmYnV6eiogdG8gKjE0LjMuMCogaGFzIFN1Y2NlZWRlZC4KCk5leHQgc3RlcHM6CiAg
ICAtIGFwcGx5IHRoZSBwYXRjaDogZ2l0IGFtIDAwMDEtaGFyZmJ1enotdXBncmFkZS0xNC4yLjEt
MTQuMy4wLnBhdGNoCiAgICAtIGNoZWNrIHRoZSBjaGFuZ2VzIHRvIHVwc3RyZWFtIHBhdGNoZXMg
YW5kIHN1bW1hcml6ZSB0aGVtIGluIHRoZSBjb21taXQgbWVzc2FnZSwKICAgIC0gY29tcGlsZSBh
biBpbWFnZSB0aGF0IGNvbnRhaW5zIHRoZSBwYWNrYWdlCiAgICAtIHBlcmZvcm0gc29tZSBiYXNp
YyBzYW5pdHkgdGVzdHMKICAgIC0gYW1lbmQgdGhlIHBhdGNoIGFuZCBzaWduIGl0IG9mZjogZ2l0
IGNvbW1pdCAtcyAtLXJlc2V0LWF1dGhvciAtLWFtZW5kCiAgICAtIHNlbmQgaXQgdG8gdGhlIGFw
cHJvcHJpYXRlIG1haWxpbmcgbGlzdAoKQWx0ZXJuYXRpdmVseSwgaWYgeW91IGJlbGlldmUgdGhl
IHJlY2lwZSBzaG91bGQgbm90IGJlIHVwZ3JhZGVkIGF0IHRoaXMgdGltZSwKeW91IGNhbiBmaWxs
IFJFQ0lQRV9OT19VUERBVEVfUkVBU09OIGluIHJlc3BlY3RpdmUgcmVjaXBlIGZpbGUgc28gdGhh
dAphdXRvbWF0aWMgdXBncmFkZXMgd291bGQgbm8gbG9uZ2VyIGJlIGF0dGVtcHRlZC4KClBsZWFz
ZSByZXZpZXcgdGhlIGF0dGFjaGVkIGZpbGVzIGZvciBmdXJ0aGVyIGluZm9ybWF0aW9uIGFuZCBi
dWlsZC91cGRhdGUgZmFpbHVyZXMuCkFueSBwcm9ibGVtIHBsZWFzZSBmaWxlIGEgYnVnIGF0IGh0
dHBzOi8vYnVnemlsbGEueW9jdG9wcm9qZWN0Lm9yZy9lbnRlcl9idWcuY2dpP3Byb2R1Y3Q9QXV0
b21hdGVkJTIwVXBkYXRlJTIwSGFuZGxlcgoKUmVnYXJkcywKVGhlIFVwZ3JhZGUgSGVscGVyCgot
LSA+OCAtLQpGcm9tIDZkYWYxMjAxYTg0OGRlNzYwYjcxOWU1MzBlZDY4NjU1ZDFkM2ZlYTQgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCkZyb206IFVwZ3JhZGUgSGVscGVyIDxhdWhAeW9jdG9wcm9q
ZWN0Lm9yZz4KRGF0ZTogU2F0LCAxIEF1ZyAyMDI2IDA1OjQ4OjUzICswMDAwClN1YmplY3Q6IFtQ
QVRDSF0gaGFyZmJ1eno6IHVwZ3JhZGUgMTQuMi4xIC0+IDE0LjMuMApNSU1FLVZlcnNpb246IDEu
MApDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKQ29udGVudC1UcmFuc2Zl
ci1FbmNvZGluZzogOGJpdAoKU291cmNlOiBORVdTCgpPdmVydmlldyBvZiBjaGFuZ2VzIGxlYWRp
bmcgdG8gMTQuMy4wCkZyaWRheSwgSnVseSAzMSwgMjAyNgo9PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09Ci0gQ2hhbmdlcyBhZmZlY3Rpbmcgc2hhcGluZyBvdXRwdXQ6CiAgKiBM
b29rdXAgb3JkZXIgaXMgbm93IHJlc3BlY3RlZCBmb3IgbWFyayBwb3NpdGlvbmluZyBpbiB0aGUg
Y3Jvc3MtZGlyZWN0aW9uCiAgICAoeSBpbiBob3Jpem9udGFsIHRleHQsIHggaW4gdmVydGljYWwg
dGV4dCk6IG1hcmtzIG5vIGxvbmdlciBmb2xsb3cgYQogICAgY3Jvc3MtZGlyZWN0aW9uIHNoaWZ0
IHRoYXQgYSBsYXRlciBsb29rdXAgYXBwbGllcyB0byB0aGUgYmFzZS4gVGhpcwogICAgaW1wcm92
ZXMgY29tcGF0aWJpbGl0eSB3aXRoIERpcmVjdFdyaXRlIGFuZCBDb3JlIFRleHQuCiAgKiBGaXgg
bWFyayBhdHRhY2htZW50IHRvIGxpZ2F0dXJlcyBmb3JtZWQgZnJvbSBkZWNvbXBvc2VkIGdseXBo
cy4KICAqIFRoZSBgY2FsdGAgZmVhdHVyZSBpbiBIYW5ndWwgdGV4dCBpcyBub3cgZGlzYWJsZWQg
b25seSBmb3IgdGhlIEphbW9zLAogICAgbm90IHRoZSB3aG9sZSBidWZmZXIuCgotIFN1cHBvcnQg
Zm9yIHBhcnRpYWxseSBpbnN0YW5jaW5nIHZlcnNpb24gb2YgYGF2YXJgIHRhYmxlLCBhcyB3ZWxs
IGFzIGBDRkYyYAogIHRhYmxlLgoKLSBOZXcgZmlsbC1nbHlwaCBwYWludCBvcGVyYXRpb24gYW5k
IEFQSXMgZm9yIHRoZSBjb21tb24gY2FzZSBvZiBmaWxsaW5nIGEKICBnbHlwaCB3aXRoIGEgc29s
aWQgY29sb3IuCgotIE5ldyBBUEkgdG8gZmV0Y2ggYXNzb3J0ZWQgcmF3IHZhbHVlcyBmcm9tIHRo
ZSBgT1MvMmAsIGBoZWFkYCwgYW5kIGBwb3N0YAogIHRhYmxlcy4KCi0gTmV3IGV4cGVyaW1lbnRh
bCBBUEkgdG8gZXh0cmFjdCBhIGZvbnTigJlzIGdseXBoIGRlcGVuZGVuY3kgZ3JhcGgsIHRoYXQK
ICBhcHBsaWNhdGlvbnMgY2FuIHVzZSB0byBjb21wdXRlIGdseXBoIGNsb3N1cmVzIHRoZW1zZWx2
ZXMgd2l0aG91dCBydW5uaW5nIHRoZQogIHN1YnNldHRlci4KCi0gTmV3IHN1YnNldCBmbGFnIHRv
IGNvbnZlcnQgdGhlIGNoYXJzZXQgb2YgYSBzdWJzZXR0ZWQgQ0lELWtleWVkIGBDRkZgIGZvbnRz
CiAgaW50byBpZGVudGl0eSBjaGFyc2V0LCBhbmQgYSBtYXRjaGluZyBgaGItc3Vic2V0YCBvcHRp
b24uIFVzZWZ1bCBmb3IKICBlbWJlZGRpbmcgZm9udHMgaW4gUERGLgoKLSBDb21tYW5kLWxpbmUg
dXRpbGl0aWVzIG5vdyBoYW5kbGUgbm9uLUFTQ0lJIGFyZ3VtZW50cyBjb3JyZWN0bHkgb24gV2lu
ZG93cy4KCi0gVmFyaW91cyBpbnN0YW5jaW5nIGFuZCBzdWJzZXR0aW5nIGZpeGVzLgoKLSBWYXJp
b3VzIGZpeGVzIHRvIHRoZSBleHBlcmltZW50YWwgYGhhcmZidXp6LXZlY3RvcmAsIGBoYXJmYnV6
ei1yYXN0ZXJgIGFuZAogIGBoYXJmYnV6ei1ncHVgIGxpYnJhcmllcy4KCi0gVmFyaW91cyBpbXBy
b3ZlbWVudHMgdG8gdGhlIEhhcmZSdXN0IGludGVncmF0aW9uIHNoYXBlci4KCi0gVmFyaW91cyBi
dWlsZCwgQ0ksIHBvcnRhYmlsaXR5LCBhbmQgZnV6emluZyBmaXhlcy4KCi0gTmV3IEFQSToKICAq
IE9wZW5UeXBlOgogICAgK0hCX09UX0JJVFNfVEFHX0ZTX1RZUEUKICAgICtIQl9PVF9CSVRTX1RB
R19GU19TRUxFQ1RJT04KICAgICtIQl9PVF9CSVRTX1RBR19NQUNfU1RZTEUKICAgICtIQl9PVF9C
SVRTX1RBR19JU19GSVhFRF9QSVRDSAogICAgK0hCX09UX0JJVFNfVEFHX1VOSUNPREVfUkFOR0Vf
MQogICAgK0hCX09UX0JJVFNfVEFHX1VOSUNPREVfUkFOR0VfMgogICAgK0hCX09UX0JJVFNfVEFH
X1VOSUNPREVfUkFOR0VfMwogICAgK0hCX09UX0JJVFNfVEFHX1VOSUNPREVfUkFOR0VfNAogICAg
K0hCX09UX0JJVFNfVEFHX0NPREVfUEFHRV9SQU5HRV8xCiAgICArSEJfT1RfQklUU19UQUdfQ09E
RV9QQUdFX1JBTkdFXzIKICAgICtIQl9PVF9OVU1CRVJfVEFHX0ZPTlRfWF9NSU4KICAgICtIQl9P
VF9OVU1CRVJfVEFHX0ZPTlRfWV9NSU4KICAgICtIQl9PVF9OVU1CRVJfVEFHX0ZPTlRfWF9NQVgK
ICAgICtIQl9PVF9OVU1CRVJfVEFHX0ZPTlRfWV9NQVgKICAgICtoYl9vdF9iaXRzX3RhZ190CiAg
ICAraGJfb3RfZmV0Y2hfYml0cygpCiAgICAraGJfb3RfbnVtYmVyX3RhZ190CiAgICAraGJfb3Rf
ZmV0Y2hfbnVtYmVyKCkKCiAgKiBQYWludDoKICAgICtoYl9wYWludF9maWxsX2dseXBoX2Z1bmNf
dAogICAgK2hiX3BhaW50X2ZpbGxfZ2x5cGgoKQogICAgK2hiX3BhaW50X2Z1bmNzX3NldF9maWxs
X2dseXBoX2Z1bmMoKQoKICAqIFN1YnNldCBsaWJyYXJ5OgogICAgK0hCX1NVQlNFVF9GTEFHU19D
RkZfSURFTlRJVFlfQ0hBUlNFVAotLS0KIC4uLi9oYXJmYnV6ei97aGFyZmJ1enpfMTQuMi4xLmJi
ID0+IGhhcmZidXp6XzE0LjMuMC5iYn0gICAgICAgICB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGlj
cy9oYXJmYnV6ei97aGFyZmJ1enpfMTQuMi4xLmJiID0+IGhhcmZidXp6XzE0LjMuMC5iYn0gKDk2
JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvaGFyZmJ1enovaGFyZmJ1enpf
MTQuMi4xLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2hhcmZidXp6L2hhcmZidXp6XzE0LjMu
MC5iYgpzaW1pbGFyaXR5IGluZGV4IDk2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvaGFyZmJ1enovaGFyZmJ1enpfMTQuMi4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MvaGFyZmJ1enovaGFyZmJ1enpfMTQuMy4wLmJiCmluZGV4IDZiNmM2YTBmNjAuLjZlNGU5
YjdiODUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9oYXJmYnV6ei9oYXJmYnV6
el8xNC4yLjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2hhcmZidXp6L2hhcmZidXp6
XzE0LjMuMC5iYgpAQCAtOSw3ICs5LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09Q
WUlORzttZDU9Yjk4NDI5YjhlOGUzYzJhNjdjZmVmMDFlOTllNDg5M2QgXAogICAgICAgICAgICAg
ICAgICAgICAiCiAKIFNSQ19VUkkgPSAiJHtHSVRIVUJfQkFTRV9VUkl9L2Rvd25sb2FkLyR7UFZ9
LyR7QlBOfS0ke1BWfS50YXIueHoiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYTU0YTVkOGU5Mzgw
YTQxZmJiNzYyY2UzNjdiY2JmNzcwNDc5MmRmY2EwZDkzZjFiYmNhODZjNWE1NzkwMmUwZSIKK1NS
Q19VUklbc2hhMjU2c3VtXSA9ICIxNjA3MGQ3N2NmYzRiYTFmMWU3MzI3ZTgzYmY5YjNmNTU4OTgw
ODFjYWJkYjk0ZTU2YTMzZTA0ZmM4ODc0ZWFlIgogCiBpbmhlcml0IG1lc29uIHBrZ2NvbmZpZyBs
aWJfcGFja2FnZSBndGstZG9jIGdvYmplY3QtaW50cm9zcGVjdGlvbiBnaXRodWItcmVsZWFzZXMK
IAotLSAKMi40Ny4xCgo=

--===============1066665864141599809==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-cairo: FILELIST: removed "/usr/lib/libharfbuzz-cairo.so.0.61421.0", added "/usr/lib/libharfbuzz-cairo.so.0.61430.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dev: FILELIST: added "/usr/include/harfbuzz/hb-subset-depend.h /usr/include/harfbuzz/hb-ot-fetch.h"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-gobject: FILELIST: removed "/usr/lib/libharfbuzz-gobject.so.0.61421.0", added "/usr/lib/libharfbuzz-gobject.so.0.61430.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu: FILELIST: removed "/usr/lib/libharfbuzz-icu.so.0.61421.0", added "/usr/lib/libharfbuzz-icu.so.0.61430.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: FILELIST: removed "/usr/lib/libharfbuzz-subset.so.0.61421.0", added "/usr/lib/libharfbuzz-subset.so.0.61430.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: FILELIST: removed "/usr/lib/libharfbuzz.so.0.61421.0", added "/usr/lib/libharfbuzz.so.0.61430.0"
Changes to packages/x86-64-v3-poky-linux/harfbuzz (sysroot):
  /usr/lib/libharfbuzz-cairo.so.0 changed symlink target from libharfbuzz-cairo.so.0.61421.0 to libharfbuzz-cairo.so.0.61430.0
  /usr/lib/libharfbuzz-gobject.so.0 changed symlink target from libharfbuzz-gobject.so.0.61421.0 to libharfbuzz-gobject.so.0.61430.0
  /usr/lib/libharfbuzz-icu.so.0 changed symlink target from libharfbuzz-icu.so.0.61421.0 to libharfbuzz-icu.so.0.61430.0
  /usr/lib/libharfbuzz.so.0 changed symlink target from libharfbuzz.so.0.61421.0 to libharfbuzz.so.0.61430.0
  /usr/lib/libharfbuzz-subset.so.0 changed symlink target from libharfbuzz-subset.so.0.61421.0 to libharfbuzz-subset.so.0.61430.0
  /usr/lib/libharfbuzz-cairo.so.0.61421.0 moved to /usr/lib/libharfbuzz-cairo.so.0.61430.0
  /usr/lib/libharfbuzz-gobject.so.0.61421.0 moved to /usr/lib/libharfbuzz-gobject.so.0.61430.0
  /usr/lib/libharfbuzz-icu.so.0.61421.0 moved to /usr/lib/libharfbuzz-icu.so.0.61430.0
  /usr/lib/libharfbuzz.so.0.61421.0 moved to /usr/lib/libharfbuzz.so.0.61430.0
  /usr/lib/libharfbuzz-subset.so.0.61421.0 moved to /usr/lib/libharfbuzz-subset.so.0.61430.0
  /usr/include/harfbuzz/hb-ot-fetch.h was added
  /usr/include/harfbuzz/hb-subset-depend.h was added

--===============1066665864141599809==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="harfbuzz-changelog.txt"

Q2hhbmdlbG9nIGZvciBoYXJmYnV6ejogMTQuMi4xIC0+IDE0LjMuMApTb3VyY2U6IE5FV1MKCk92
ZXJ2aWV3IG9mIGNoYW5nZXMgbGVhZGluZyB0byAxNC4zLjAKRnJpZGF5LCBKdWx5IDMxLCAyMDI2
Cj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KLSBDaGFuZ2VzIGFmZmVjdGlu
ZyBzaGFwaW5nIG91dHB1dDoKICAqIExvb2t1cCBvcmRlciBpcyBub3cgcmVzcGVjdGVkIGZvciBt
YXJrIHBvc2l0aW9uaW5nIGluIHRoZSBjcm9zcy1kaXJlY3Rpb24KICAgICh5IGluIGhvcml6b250
YWwgdGV4dCwgeCBpbiB2ZXJ0aWNhbCB0ZXh0KTogbWFya3Mgbm8gbG9uZ2VyIGZvbGxvdyBhCiAg
ICBjcm9zcy1kaXJlY3Rpb24gc2hpZnQgdGhhdCBhIGxhdGVyIGxvb2t1cCBhcHBsaWVzIHRvIHRo
ZSBiYXNlLiBUaGlzCiAgICBpbXByb3ZlcyBjb21wYXRpYmlsaXR5IHdpdGggRGlyZWN0V3JpdGUg
YW5kIENvcmUgVGV4dC4KICAqIEZpeCBtYXJrIGF0dGFjaG1lbnQgdG8gbGlnYXR1cmVzIGZvcm1l
ZCBmcm9tIGRlY29tcG9zZWQgZ2x5cGhzLgogICogVGhlIGBjYWx0YCBmZWF0dXJlIGluIEhhbmd1
bCB0ZXh0IGlzIG5vdyBkaXNhYmxlZCBvbmx5IGZvciB0aGUgSmFtb3MsCiAgICBub3QgdGhlIHdo
b2xlIGJ1ZmZlci4KCi0gU3VwcG9ydCBmb3IgcGFydGlhbGx5IGluc3RhbmNpbmcgdmVyc2lvbiBv
ZiBgYXZhcmAgdGFibGUsIGFzIHdlbGwgYXMgYENGRjJgCiAgdGFibGUuCgotIE5ldyBmaWxsLWds
eXBoIHBhaW50IG9wZXJhdGlvbiBhbmQgQVBJcyBmb3IgdGhlIGNvbW1vbiBjYXNlIG9mIGZpbGxp
bmcgYQogIGdseXBoIHdpdGggYSBzb2xpZCBjb2xvci4KCi0gTmV3IEFQSSB0byBmZXRjaCBhc3Nv
cnRlZCByYXcgdmFsdWVzIGZyb20gdGhlIGBPUy8yYCwgYGhlYWRgLCBhbmQgYHBvc3RgCiAgdGFi
bGVzLgoKLSBOZXcgZXhwZXJpbWVudGFsIEFQSSB0byBleHRyYWN0IGEgZm9udOKAmXMgZ2x5cGgg
ZGVwZW5kZW5jeSBncmFwaCwgdGhhdAogIGFwcGxpY2F0aW9ucyBjYW4gdXNlIHRvIGNvbXB1dGUg
Z2x5cGggY2xvc3VyZXMgdGhlbXNlbHZlcyB3aXRob3V0IHJ1bm5pbmcgdGhlCiAgc3Vic2V0dGVy
LgoKLSBOZXcgc3Vic2V0IGZsYWcgdG8gY29udmVydCB0aGUgY2hhcnNldCBvZiBhIHN1YnNldHRl
ZCBDSUQta2V5ZWQgYENGRmAgZm9udHMKICBpbnRvIGlkZW50aXR5IGNoYXJzZXQsIGFuZCBhIG1h
dGNoaW5nIGBoYi1zdWJzZXRgIG9wdGlvbi4gVXNlZnVsIGZvcgogIGVtYmVkZGluZyBmb250cyBp
biBQREYuCgotIENvbW1hbmQtbGluZSB1dGlsaXRpZXMgbm93IGhhbmRsZSBub24tQVNDSUkgYXJn
dW1lbnRzIGNvcnJlY3RseSBvbiBXaW5kb3dzLgoKLSBWYXJpb3VzIGluc3RhbmNpbmcgYW5kIHN1
YnNldHRpbmcgZml4ZXMuCgotIFZhcmlvdXMgZml4ZXMgdG8gdGhlIGV4cGVyaW1lbnRhbCBgaGFy
ZmJ1enotdmVjdG9yYCwgYGhhcmZidXp6LXJhc3RlcmAgYW5kCiAgYGhhcmZidXp6LWdwdWAgbGli
cmFyaWVzLgoKLSBWYXJpb3VzIGltcHJvdmVtZW50cyB0byB0aGUgSGFyZlJ1c3QgaW50ZWdyYXRp
b24gc2hhcGVyLgoKLSBWYXJpb3VzIGJ1aWxkLCBDSSwgcG9ydGFiaWxpdHksIGFuZCBmdXp6aW5n
IGZpeGVzLgoKLSBOZXcgQVBJOgogICogT3BlblR5cGU6CiAgICArSEJfT1RfQklUU19UQUdfRlNf
VFlQRQogICAgK0hCX09UX0JJVFNfVEFHX0ZTX1NFTEVDVElPTgogICAgK0hCX09UX0JJVFNfVEFH
X01BQ19TVFlMRQogICAgK0hCX09UX0JJVFNfVEFHX0lTX0ZJWEVEX1BJVENICiAgICArSEJfT1Rf
QklUU19UQUdfVU5JQ09ERV9SQU5HRV8xCiAgICArSEJfT1RfQklUU19UQUdfVU5JQ09ERV9SQU5H
RV8yCiAgICArSEJfT1RfQklUU19UQUdfVU5JQ09ERV9SQU5HRV8zCiAgICArSEJfT1RfQklUU19U
QUdfVU5JQ09ERV9SQU5HRV80CiAgICArSEJfT1RfQklUU19UQUdfQ09ERV9QQUdFX1JBTkdFXzEK
ICAgICtIQl9PVF9CSVRTX1RBR19DT0RFX1BBR0VfUkFOR0VfMgogICAgK0hCX09UX05VTUJFUl9U
QUdfRk9OVF9YX01JTgogICAgK0hCX09UX05VTUJFUl9UQUdfRk9OVF9ZX01JTgogICAgK0hCX09U
X05VTUJFUl9UQUdfRk9OVF9YX01BWAogICAgK0hCX09UX05VTUJFUl9UQUdfRk9OVF9ZX01BWAog
ICAgK2hiX290X2JpdHNfdGFnX3QKICAgICtoYl9vdF9mZXRjaF9iaXRzKCkKICAgICtoYl9vdF9u
dW1iZXJfdGFnX3QKICAgICtoYl9vdF9mZXRjaF9udW1iZXIoKQoKICAqIFBhaW50OgogICAgK2hi
X3BhaW50X2ZpbGxfZ2x5cGhfZnVuY190CiAgICAraGJfcGFpbnRfZmlsbF9nbHlwaCgpCiAgICAr
aGJfcGFpbnRfZnVuY3Nfc2V0X2ZpbGxfZ2x5cGhfZnVuYygpCgogICogU3Vic2V0IGxpYnJhcnk6
CiAgICArSEJfU1VCU0VUX0ZMQUdTX0NGRl9JREVOVElUWV9DSEFSU0VUCg==

--===============1066665864141599809==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-bin: PKGV changed from 14.2.1 [default] to 14.3.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-bin: PV changed from "14.2.1" to "14.3.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-cairo: FILES: removed "/usr/lib/libharfbuzz-cairo.so.0.61421.0", added "/usr/lib/libharfbuzz-cairo.so.0.61430.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-cairo: FILELIST: removed "/usr/lib/libharfbuzz-cairo.so.0.61421.0", added "/usr/lib/libharfbuzz-cairo.so.0.61430.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-cairo: PKGV changed from 14.2.1 [default] to 14.3.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-cairo: PV changed from "14.2.1" to "14.3.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dbg: FILELIST: removed "/usr/lib/.debug/libharfbuzz-subset.so.0.61421.0 /usr/lib/.debug/libharfbuzz-gobject.so.0.61421.0 /usr/lib/.debug/libharfbuzz.so.0.61421.0 /usr/lib/.debug/libharfbuzz-cairo.so.0.61421.0 /usr/lib/.debug/libharfbuzz-icu.so.0.61421.0", added "/usr/lib/.debug/libharfbuzz-cairo.so.0.61430.0 /usr/lib/.debug/libharfbuzz-icu.so.0.61430.0 /usr/lib/.debug/libharfbuzz-gobject.so.0.61430.0 /usr/lib/.debug/libharfbuzz-subset.so.0.61430.0 /usr/lib/.debug/libharfbuzz.so.0.61430.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dbg: PKGSIZE changed from 85756296 to 91844560 (+7%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dbg: PKGV changed from 14.2.1 [default] to 14.3.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dbg: PV changed from "14.2.1" to "14.3.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dev: FILELIST: added "/usr/include/harfbuzz/hb-ot-fetch.h /usr/include/harfbuzz/hb-subset-depend.h"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dev: PKGSIZE changed from 1872187 to 1900436 (+2%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dev: PKGV changed from 14.2.1 [default] to 14.3.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dev: PV changed from "14.2.1" to "14.3.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-doc: PKGV changed from 14.2.1 [default] to 14.3.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-doc: PV changed from "14.2.1" to "14.3.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-gobject: FILES: removed "/usr/lib/libharfbuzz-gobject.so.0.61421.0", added "/usr/lib/libharfbuzz-gobject.so.0.61430.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-gobject: FILELIST: removed "/usr/lib/libharfbuzz-gobject.so.0.61421.0", added "/usr/lib/libharfbuzz-gobject.so.0.61430.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-gobject: PKGSIZE changed from 120696 to 128888 (+7%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-gobject: PKGV changed from 14.2.1 [default] to 14.3.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-gobject: PV changed from "14.2.1" to "14.3.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu: FILES: removed "/usr/lib/libharfbuzz-icu.so.0.61421.0", added "/usr/lib/libharfbuzz-icu.so.0.61430.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu: FILELIST: removed "/usr/lib/libharfbuzz-icu.so.0.61421.0", added "/usr/lib/libharfbuzz-icu.so.0.61430.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu: PKGV changed from 14.2.1 [default] to 14.3.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu: PV changed from "14.2.1" to "14.3.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-locale: PKGV changed from 14.2.1 [default] to 14.3.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-locale: PV changed from "14.2.1" to "14.3.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-src: FILELIST: directory renamed /usr/src/debug/harfbuzz/14.2.1/src/OT/Var/VARC -> /usr/src/debug/harfbuzz/14.3.0/src/OT/Var/VARC, directory renamed /usr/src/debug/harfbuzz/14.2.1/src/OT/Color/CPAL -> /usr/src/debug/harfbuzz/14.3.0/src/OT/Color/CPAL, directory renamed /usr/src/debug/harfbuzz/14.2.1/src/OT/Layout/GPOS -> /usr/src/debug/harfbuzz/14.3.0/src/OT/Layout/GPOS, directory renamed /usr/src/debug/harfbuzz/14.2.1/src/OT/Layout -> /usr/src/debug/harfbuzz/14.3.0/src/OT/Layout, directory renamed /usr/src/debug/harfbuzz/14.2.1/src/OT/glyf -> /usr/src/debug/harfbuzz/14.3.0/src/OT/glyf, directory renamed /usr/src/debug/harfbuzz/14.2.1/src/OT/Color/svg -> /usr/src/debug/harfbuzz/14.3.0/src/OT/Color/svg, directory renamed /usr/src/debug/harfbuzz/14.2.1/util -> /usr/src/debug/harfbuzz/14.3.0/util, directory renamed /usr/src/debug/harfbuzz/14.2.1/src/OT/Color/sbix -> /usr/src/debug/harfbuzz/14.3.0/src/OT/Color/sbix, directory renamed /usr/sr
 c/debug/harfbuzz/14.2.1/src/OT/name -> /usr/src/debug/harfbuzz/14.3.0/src/OT/name, directory renamed /usr/src/debug/harfbuzz/14.2.1/src/OT/Layout/GDEF -> /usr/src/debug/harfbuzz/14.3.0/src/OT/Layout/GDEF, directory renamed /usr/src/debug/harfbuzz/14.2.1/src/OT/Color/CBDT -> /usr/src/debug/harfbuzz/14.3.0/src/OT/Color/CBDT, directory renamed /usr/src/debug/harfbuzz/14.2.1/src/OT/Layout/GSUB -> /usr/src/debug/harfbuzz/14.3.0/src/OT/Layout/GSUB, directory renamed /usr/src/debug/harfbuzz/14.2.1/src/OT/Layout/Common -> /usr/src/debug/harfbuzz/14.3.0/src/OT/Layout/Common, directory renamed /usr/src/debug/harfbuzz/14.2.1/src/graph -> /usr/src/debug/harfbuzz/14.3.0/src/graph, removed "/usr/src/debug/harfbuzz/14.2.1/src/hb-serialize.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-metrics.h /usr/src/debug/harfbuzz/14.2.1/src/hb-unicode.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-shaper-syllabic.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-object.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-subset-cff-com
 mon.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-layout-common.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-blob.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-os2-unicode-ranges.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-decycler.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-debug.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-shaper-thai.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-gobject-enums.h /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-shape-fallback.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-deprecated.h /usr/src/debug/harfbuzz/14.2.1/src/hb-face.h /usr/src/debug/harfbuzz/14.2.1/src/hb-buffer-verify.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-metrics.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-font.h /usr/src/debug/harfbuzz/14.2.1/src/hb-cff2-interp-cs.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-font.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-shape.h /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-color.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-aat-layout-ankr-table.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-aat-lay
 out-kerx-table.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-aat-layout-morx-table.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-shape.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-set.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-shape.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-map.h /usr/src/debug/harfbuzz/14.2.1/src/hb-cff-width-optimizer.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-ucd.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-tag-table.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-paint-bounded.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-paint.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-cairo.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-set.h /usr/src/debug/harfbuzz/14.2.1/src/hb-subset-plan-var.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-bit-set-invertible.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-meta.h /usr/src/debug/harfbuzz/14.2.1/src/hb-icu.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-name.h /usr/src/debug/harfbuzz/14.2.1/src/hb-shape.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-glib.cc /usr/src/debug/harfbuzz
 /14.2.1/src/hb-subset-table-cff.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-subset-table-var.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-script-list.h /usr/src/debug/harfbuzz/14.2.1/src/hb-paint.h /usr/src/debug/harfbuzz/14.2.1/src/hb-buffer-serialize.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-draw.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-cache.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-layout-gsub-table.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-shaper-arabic-fallback.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-priority-queue.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-layout-base-table.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-face.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-aat-ltag-table.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-shaper.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-kern-table.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-math-table.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-maxp-table.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-meta-table.hh /usr/src/debug/harfbuzz/14.2.1/s
 rc/hb-ot-cff2-table.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-cmap-table.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-cff1-table.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-shape-plan.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-subset-cff2.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-shaper-arabic.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-shaper-arabic-joining-list.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-fallback-shape.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-subset-accelerator.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-cff-interp-dict-common.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-paint.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-shaper-arabic.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-style.h /usr/src/debug/harfbuzz/14.2.1/src/hb-algs.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-face-builder.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-name.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-shaper-indic.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-kern.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-subset.h 
 /usr/src/debug/harfbuzz/14.2.1/src/hb-subset-cff2-to-cff1.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-subset-input.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-null.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-number.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-shaper-list.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-face.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-outline.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-var-common.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-multimap.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-cairo-utils.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-shaper-use-table.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-aat-layout.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-set-digest.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-string-array.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-subset-cff1.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-subset-plan.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-subset-instancer-iup.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-subset-serialize.h /usr/src/debug/harfbuzz/14.2.1/src/hb-
 font.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-math.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-font.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-name-language.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-unicode.h /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-shaper-myanmar.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-free-pool.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-aat-layout-common.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-repacker.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-buffer.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-ft.h /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-shaper-vowel-constraints.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-unicode.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-shaper-indic-table.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-geometry.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-common.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-var.h /usr/src/debug/harfbuzz/14.2.1/src/hb-utf.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-cff1-std-str.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-post-t
 able-v2subset.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-subset-table.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-aat-map.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-subset.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-gobject-structs.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-meta.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-subset-serialize.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-unicode-emoji-table.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-layout.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-post-macroman.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-paint-bounded.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-common.h /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-var.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-ucd-table.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-shaper-use.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-cairo.h /usr/src/debug/harfbuzz/14.2.1/src/hb-dispatch.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-aat-layout.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-cff1-interp-cs.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-
 ot-shape-normalize.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-shaper-syllabic.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-subset-instancer-iup.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-map.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-aat-layout-feat-table.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-aat-layout-just-table.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-aat-layout-trak-table.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-blob.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-style.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-layout.h /usr/src/debug/harfbuzz/14.2.1/src/hb-sanitize.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-aat-layout.h /usr/src/debug/harfbuzz/14.2.1/src/hb-bimap.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-os2-table.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-shape-fallback.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-shaper.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-subset-table-layout.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-buffer.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-outline.hh /usr/src/
 debug/harfbuzz/14.2.1/src/hb-ot-metrics.hh /usr/src/debug/harfbuzz/14.2.1/src/hb.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-subset-plan-member-list.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-math.h /usr/src/debug/harfbuzz/14.2.1/src/hb-machinery.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-color.h /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-shaper-arabic-pua.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-face.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-iter.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-name-language-static.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-vector.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-subset.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-subset-instancer-solver.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-cff-interp-common.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-layout-gpos-table.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-bit-set.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-layout.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-shaper-hangul.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-
 ot-shaper-hebrew.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-hdmx-table.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-blob.h /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-head-table.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-hhea-table.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-hmtx-table.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-post-table.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-face-table-list.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-vorg-table.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-shaper.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-font.h /usr/src/debug/harfbuzz/14.2.1/src/hb-static.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-subset-instancer-solver.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-buffer.h /usr/src/debug/harfbuzz/14.2.1/src/hb-map.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-draw.h /usr/src/debug/harfbuzz/14.2.1/src/hb-ft.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-shape-plan.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-cff1-table.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-cff2-ta
 ble.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-cff-specializer.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-cff-interp-cs-common.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-cairo-utils.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-ft-colr.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-cplusplus.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-subset-plan.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-meta.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-var-avar-table.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-var-cvar-table.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-var-fvar-table.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-var-gvar-table.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-var-hvar-table.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-var-mvar-table.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-version.h /usr/src/debug/harfbuzz/14.2.1/src/hb-draw.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-shaper-default.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-cff-common.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-shaper-vowel-
 constraints.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-tag.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-map.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-gobject-enums.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-stat-table.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-face.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-shaper-khmer.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-subset-cff-common.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-shaper-indic.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-subset-plan-layout.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-subset-input.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-subset-table-color.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-subset-table-other.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-layout-gsubgpos.hh /usr/src/debug/harfbuzz/14.2.1/src/OT/Color/COLR/colrv1-closure.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-open-file.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-array.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-open-type.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-paint-ext
 ents.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-paint-extents.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-set.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-atomic.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-alloc-pool.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-mutex.hh /usr/src/debug/harfbuzz/14.2.1/src/OT/Color/COLR/COLR.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-bit-page.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-deprecated.h /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-shape-normalize.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-shape-plan.h /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-map.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-aat-map.cc /usr/src/debug/harfbuzz/14.2.1/src/hb-ot-shaper-arabic-table.hh /usr/src/debug/harfbuzz/14.2.1/src/hb-number.cc", added "/usr/src/debug/harfbuzz/14.3.0/src/hb-serialize.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-metrics.h /usr/src/debug/harfbuzz/14.3.0/src/hb-unicode.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-depend.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-shaper-sylla
 bic.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-object.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-subset-cff-common.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-layout-common.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-blob.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-os2-unicode-ranges.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-decycler.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-debug.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-shaper-thai.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-gobject-enums.h /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-shape-fallback.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-deprecated.h /usr/src/debug/harfbuzz/14.3.0/src/hb-face.h /usr/src/debug/harfbuzz/14.3.0/src/hb-buffer-verify.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-metrics.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-font.h /usr/src/debug/harfbuzz/14.3.0/src/hb-cff2-interp-cs.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-font.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-shape.h /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-color.cc /
 usr/src/debug/harfbuzz/14.3.0/src/hb-aat-layout-ankr-table.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-aat-layout-kerx-table.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-aat-layout-morx-table.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-shape.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-set.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-shape.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-map.h /usr/src/debug/harfbuzz/14.3.0/src/hb-cff-width-optimizer.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-ucd.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-tag-table.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-paint-bounded.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-paint.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-cairo.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-set.h /usr/src/debug/harfbuzz/14.3.0/src/hb-subset-plan-var.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-bit-set-invertible.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-meta.h /usr/src/debug/harfbuzz/14.3.0/src/hb-icu.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-name.h /usr/src/
 debug/harfbuzz/14.3.0/src/hb-shape.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-glib.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-subset-table-cff.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-subset-table-var.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-script-list.h /usr/src/debug/harfbuzz/14.3.0/src/hb-paint.h /usr/src/debug/harfbuzz/14.3.0/src/hb-buffer-serialize.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-draw.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-cache.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-layout-gsub-table.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-shaper-arabic-fallback.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-priority-queue.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-layout-base-table.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-face.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-aat-ltag-table.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-shaper.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-kern-table.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-math-table.hh /usr/src/debug/harfbuzz/14.3.0/src/
 hb-ot-maxp-table.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-meta-table.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-cff2-table.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-cmap-table.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-cff1-table.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-shape-plan.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-shaper-arabic-joining-list.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-shaper-arabic.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-shape-fallback.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-fallback-shape.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-subset-accelerator.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-cff-interp-dict-common.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-paint.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-depend-data.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-shaper-arabic.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-style.h /usr/src/debug/harfbuzz/14.3.0/src/hb-algs.hh /usr/src/debug/harfbuzz/14.3.0/src/OT/Color/COLR/colrv1-depend.hh /usr/src/debug/harfbu
 zz/14.3.0/src/hb-face-builder.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-name.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-shaper-indic.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-kern.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-subset.h /usr/src/debug/harfbuzz/14.3.0/src/hb-subset-cff2-to-cff1.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-subset-input.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-null.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-number.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-shaper-list.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-face.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-outline.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-var-common.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-multimap.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-cairo-utils.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-depend.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-shaper-use-table.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-aat-layout.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-set-digest.hh /usr/src/debug/harfbuzz/14.3.0/src/hb
 -string-array.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-subset-cff1.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-subset-plan.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-subset-instancer-iup.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-subset-serialize.h /usr/src/debug/harfbuzz/14.3.0/src/hb-font.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-math.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-font.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-name-language.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-unicode.h /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-shaper-myanmar.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-free-pool.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-aat-layout-common.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-fetch.h /usr/src/debug/harfbuzz/14.3.0/src/hb-repacker.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-buffer.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-ft.h /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-shaper-vowel-constraints.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-unicode.hh /usr/src/debug/harfbuzz/14.3
 .0/src/hb-ot-shaper-indic-table.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-geometry.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-common.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-var.h /usr/src/debug/harfbuzz/14.3.0/src/hb-utf.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-cff1-std-str.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-post-table-v2subset.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-subset-table.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-aat-map.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-subset.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-gobject-structs.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-meta.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-subset-depend.h /usr/src/debug/harfbuzz/14.3.0/src/hb-subset-serialize.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-layout.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-post-macroman.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-unicode-emoji-table.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-paint-bounded.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-common.h /usr/src/debu
 g/harfbuzz/14.3.0/src/hb-ot-var.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-ucd-table.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-shaper-use.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-cairo.h /usr/src/debug/harfbuzz/14.3.0/src/hb-dispatch.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-aat-layout.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-cff1-interp-cs.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-shape-normalize.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-shaper-syllabic.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-subset-instancer-iup.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-map.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-fetch.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-aat-layout-feat-table.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-aat-layout-just-table.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-aat-layout-trak-table.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-blob.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-style.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-layout.h /usr/src/debug/harfbuzz/14.3.0/src/hb-subse
 t-cff2.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-sanitize.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-aat-layout.h /usr/src/debug/harfbuzz/14.3.0/src/hb-bimap.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-os2-table.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-shaper.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-subset-table-layout.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-buffer.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-outline.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-metrics.hh /usr/src/debug/harfbuzz/14.3.0/src/hb.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-subset-plan-member-list.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-math.h /usr/src/debug/harfbuzz/14.3.0/src/hb-machinery.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-color.h /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-shaper-arabic-pua.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-face.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-iter.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-name-language-static.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-vector.hh /us
 r/src/debug/harfbuzz/14.3.0/src/hb-subset.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-subset-instancer-solver.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-cff-interp-common.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-layout-gpos-table.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-bit-set.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-layout.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-shaper-hangul.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-shaper-hebrew.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-hdmx-table.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-blob.h /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-head-table.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-hhea-table.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-hmtx-table.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-post-table.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-face-table-list.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-vorg-table.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-shaper.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-font.h /usr/src/debug/harfbuz
 z/14.3.0/src/hb-static.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-subset-instancer-solver.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-buffer.h /usr/src/debug/harfbuzz/14.3.0/src/hb-map.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-draw.h /usr/src/debug/harfbuzz/14.3.0/src/hb-ft.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-shape-plan.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-cff1-table.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-cff2-table.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-cff-specializer.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-cff-interp-cs-common.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-cairo-utils.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-ft-colr.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-cplusplus.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-subset-plan.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-meta.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-var-avar-table.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-var-cvar-table.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-var-fvar-table.hh /usr/src/deb
 ug/harfbuzz/14.3.0/src/hb-ot-var-gvar-table.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-var-hvar-table.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-var-mvar-table.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-version.h /usr/src/debug/harfbuzz/14.3.0/src/hb-draw.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-shaper-default.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-cff-common.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-shaper-vowel-constraints.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-tag.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-map.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-gobject-enums.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-stat-table.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-face.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-shaper-khmer.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-subset-cff-common.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-shaper-indic.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-subset-plan-layout.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-subset-input.hh /usr/src/debug/h
 arfbuzz/14.3.0/src/hb-subset-table-color.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-subset-table-other.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-layout-gsubgpos.hh /usr/src/debug/harfbuzz/14.3.0/src/OT/Color/COLR/colrv1-closure.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-open-file.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-array.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-open-type.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-paint-extents.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-paint-extents.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-set.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-atomic.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-alloc-pool.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-mutex.hh /usr/src/debug/harfbuzz/14.3.0/src/OT/Color/COLR/COLR.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-bit-page.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-deprecated.h /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-shape-normalize.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-shape-plan.h /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-ma
 p.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-aat-map.cc /usr/src/debug/harfbuzz/14.3.0/src/hb-ot-shaper-arabic-table.hh /usr/src/debug/harfbuzz/14.3.0/src/hb-number.cc"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-src: PKGSIZE changed from 5297943 to 5501685 (+4%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-src: PKGV changed from 14.2.1 [default] to 14.3.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-src: PV changed from "14.2.1" to "14.3.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-staticdev: PKGV changed from 14.2.1 [default] to 14.3.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-staticdev: PV changed from "14.2.1" to "14.3.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: FILES: removed "/usr/lib/libharfbuzz-subset.so.0.61421.0", added "/usr/lib/libharfbuzz-subset.so.0.61430.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: FILELIST: removed "/usr/lib/libharfbuzz-subset.so.0.61421.0", added "/usr/lib/libharfbuzz-subset.so.0.61430.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: PKGSIZE changed from 931999 to 1018015 (+9%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: PKGV changed from 14.2.1 [default] to 14.3.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: PV changed from "14.2.1" to "14.3.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: FILELIST: removed "/usr/lib/libharfbuzz.so.0.61421.0", added "/usr/lib/libharfbuzz.so.0.61430.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: PKGSIZE changed from 1054160 to 1060676 (+1%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: PKGV changed from 14.2.1 [default] to 14.3.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: PV changed from "14.2.1" to "14.3.0"
packages/x86-64-v3-poky-linux/harfbuzz: SRC_URI changed from "https://github.com/harfbuzz/harfbuzz/releases//download/14.2.1/harfbuzz-14.2.1.tar.xz" to "https://github.com/harfbuzz/harfbuzz/releases//download/14.3.0/harfbuzz-14.3.0.tar.xz"
packages/x86-64-v3-poky-linux/harfbuzz: PKGV changed from 14.2.1 [default] to 14.3.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz: PV changed from "14.2.1" to "14.3.0"
Changes to packages/x86-64-v3-poky-linux/harfbuzz (sysroot):
  /usr/lib/libharfbuzz-cairo.so.0 changed symlink target from libharfbuzz-cairo.so.0.61421.0 to libharfbuzz-cairo.so.0.61430.0
  /usr/lib/libharfbuzz-gobject.so.0 changed symlink target from libharfbuzz-gobject.so.0.61421.0 to libharfbuzz-gobject.so.0.61430.0
  /usr/lib/libharfbuzz-icu.so.0 changed symlink target from libharfbuzz-icu.so.0.61421.0 to libharfbuzz-icu.so.0.61430.0
  /usr/lib/libharfbuzz.so.0 changed symlink target from libharfbuzz.so.0.61421.0 to libharfbuzz.so.0.61430.0
  /usr/lib/libharfbuzz-subset.so.0 changed symlink target from libharfbuzz-subset.so.0.61421.0 to libharfbuzz-subset.so.0.61430.0
  /usr/lib/libharfbuzz-cairo.so.0.61421.0 moved to /usr/lib/libharfbuzz-cairo.so.0.61430.0
  /usr/lib/libharfbuzz-gobject.so.0.61421.0 moved to /usr/lib/libharfbuzz-gobject.so.0.61430.0
  /usr/lib/libharfbuzz-icu.so.0.61421.0 moved to /usr/lib/libharfbuzz-icu.so.0.61430.0
  /usr/lib/libharfbuzz.so.0.61421.0 moved to /usr/lib/libharfbuzz.so.0.61430.0
  /usr/lib/libharfbuzz-subset.so.0.61421.0 moved to /usr/lib/libharfbuzz-subset.so.0.61430.0
  /usr/include/harfbuzz/hb-ot-fetch.h was added
  /usr/include/harfbuzz/hb-subset-depend.h was added

--===============1066665864141599809==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-harfbuzz-upgrade-14.2.1-14.3.0.patch"

RnJvbSA2ZGFmMTIwMWE4NDhkZTc2MGI3MTllNTMwZWQ2ODY1NWQxZDNmZWE0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBBdWcgMjAyNiAwNTo0ODo1MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGhh
cmZidXp6OiB1cGdyYWRlIDE0LjIuMSAtPiAxNC4zLjAKTUlNRS1WZXJzaW9uOiAxLjAKQ29udGVu
dC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04CkNvbnRlbnQtVHJhbnNmZXItRW5jb2Rp
bmc6IDhiaXQKClNvdXJjZTogTkVXUwoKT3ZlcnZpZXcgb2YgY2hhbmdlcyBsZWFkaW5nIHRvIDE0
LjMuMApGcmlkYXksIEp1bHkgMzEsIDIwMjYKPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PQotIENoYW5nZXMgYWZmZWN0aW5nIHNoYXBpbmcgb3V0cHV0OgogICogTG9va3VwIG9y
ZGVyIGlzIG5vdyByZXNwZWN0ZWQgZm9yIG1hcmsgcG9zaXRpb25pbmcgaW4gdGhlIGNyb3NzLWRp
cmVjdGlvbgogICAgKHkgaW4gaG9yaXpvbnRhbCB0ZXh0LCB4IGluIHZlcnRpY2FsIHRleHQpOiBt
YXJrcyBubyBsb25nZXIgZm9sbG93IGEKICAgIGNyb3NzLWRpcmVjdGlvbiBzaGlmdCB0aGF0IGEg
bGF0ZXIgbG9va3VwIGFwcGxpZXMgdG8gdGhlIGJhc2UuIFRoaXMKICAgIGltcHJvdmVzIGNvbXBh
dGliaWxpdHkgd2l0aCBEaXJlY3RXcml0ZSBhbmQgQ29yZSBUZXh0LgogICogRml4IG1hcmsgYXR0
YWNobWVudCB0byBsaWdhdHVyZXMgZm9ybWVkIGZyb20gZGVjb21wb3NlZCBnbHlwaHMuCiAgKiBU
aGUgYGNhbHRgIGZlYXR1cmUgaW4gSGFuZ3VsIHRleHQgaXMgbm93IGRpc2FibGVkIG9ubHkgZm9y
IHRoZSBKYW1vcywKICAgIG5vdCB0aGUgd2hvbGUgYnVmZmVyLgoKLSBTdXBwb3J0IGZvciBwYXJ0
aWFsbHkgaW5zdGFuY2luZyB2ZXJzaW9uIG9mIGBhdmFyYCB0YWJsZSwgYXMgd2VsbCBhcyBgQ0ZG
MmAKICB0YWJsZS4KCi0gTmV3IGZpbGwtZ2x5cGggcGFpbnQgb3BlcmF0aW9uIGFuZCBBUElzIGZv
ciB0aGUgY29tbW9uIGNhc2Ugb2YgZmlsbGluZyBhCiAgZ2x5cGggd2l0aCBhIHNvbGlkIGNvbG9y
LgoKLSBOZXcgQVBJIHRvIGZldGNoIGFzc29ydGVkIHJhdyB2YWx1ZXMgZnJvbSB0aGUgYE9TLzJg
LCBgaGVhZGAsIGFuZCBgcG9zdGAKICB0YWJsZXMuCgotIE5ldyBleHBlcmltZW50YWwgQVBJIHRv
IGV4dHJhY3QgYSBmb2504oCZcyBnbHlwaCBkZXBlbmRlbmN5IGdyYXBoLCB0aGF0CiAgYXBwbGlj
YXRpb25zIGNhbiB1c2UgdG8gY29tcHV0ZSBnbHlwaCBjbG9zdXJlcyB0aGVtc2VsdmVzIHdpdGhv
dXQgcnVubmluZyB0aGUKICBzdWJzZXR0ZXIuCgotIE5ldyBzdWJzZXQgZmxhZyB0byBjb252ZXJ0
IHRoZSBjaGFyc2V0IG9mIGEgc3Vic2V0dGVkIENJRC1rZXllZCBgQ0ZGYCBmb250cwogIGludG8g
aWRlbnRpdHkgY2hhcnNldCwgYW5kIGEgbWF0Y2hpbmcgYGhiLXN1YnNldGAgb3B0aW9uLiBVc2Vm
dWwgZm9yCiAgZW1iZWRkaW5nIGZvbnRzIGluIFBERi4KCi0gQ29tbWFuZC1saW5lIHV0aWxpdGll
cyBub3cgaGFuZGxlIG5vbi1BU0NJSSBhcmd1bWVudHMgY29ycmVjdGx5IG9uIFdpbmRvd3MuCgot
IFZhcmlvdXMgaW5zdGFuY2luZyBhbmQgc3Vic2V0dGluZyBmaXhlcy4KCi0gVmFyaW91cyBmaXhl
cyB0byB0aGUgZXhwZXJpbWVudGFsIGBoYXJmYnV6ei12ZWN0b3JgLCBgaGFyZmJ1enotcmFzdGVy
YCBhbmQKICBgaGFyZmJ1enotZ3B1YCBsaWJyYXJpZXMuCgotIFZhcmlvdXMgaW1wcm92ZW1lbnRz
IHRvIHRoZSBIYXJmUnVzdCBpbnRlZ3JhdGlvbiBzaGFwZXIuCgotIFZhcmlvdXMgYnVpbGQsIENJ
LCBwb3J0YWJpbGl0eSwgYW5kIGZ1enppbmcgZml4ZXMuCgotIE5ldyBBUEk6CiAgKiBPcGVuVHlw
ZToKICAgICtIQl9PVF9CSVRTX1RBR19GU19UWVBFCiAgICArSEJfT1RfQklUU19UQUdfRlNfU0VM
RUNUSU9OCiAgICArSEJfT1RfQklUU19UQUdfTUFDX1NUWUxFCiAgICArSEJfT1RfQklUU19UQUdf
SVNfRklYRURfUElUQ0gKICAgICtIQl9PVF9CSVRTX1RBR19VTklDT0RFX1JBTkdFXzEKICAgICtI
Ql9PVF9CSVRTX1RBR19VTklDT0RFX1JBTkdFXzIKICAgICtIQl9PVF9CSVRTX1RBR19VTklDT0RF
X1JBTkdFXzMKICAgICtIQl9PVF9CSVRTX1RBR19VTklDT0RFX1JBTkdFXzQKICAgICtIQl9PVF9C
SVRTX1RBR19DT0RFX1BBR0VfUkFOR0VfMQogICAgK0hCX09UX0JJVFNfVEFHX0NPREVfUEFHRV9S
QU5HRV8yCiAgICArSEJfT1RfTlVNQkVSX1RBR19GT05UX1hfTUlOCiAgICArSEJfT1RfTlVNQkVS
X1RBR19GT05UX1lfTUlOCiAgICArSEJfT1RfTlVNQkVSX1RBR19GT05UX1hfTUFYCiAgICArSEJf
T1RfTlVNQkVSX1RBR19GT05UX1lfTUFYCiAgICAraGJfb3RfYml0c190YWdfdAogICAgK2hiX290
X2ZldGNoX2JpdHMoKQogICAgK2hiX290X251bWJlcl90YWdfdAogICAgK2hiX290X2ZldGNoX251
bWJlcigpCgogICogUGFpbnQ6CiAgICAraGJfcGFpbnRfZmlsbF9nbHlwaF9mdW5jX3QKICAgICto
Yl9wYWludF9maWxsX2dseXBoKCkKICAgICtoYl9wYWludF9mdW5jc19zZXRfZmlsbF9nbHlwaF9m
dW5jKCkKCiAgKiBTdWJzZXQgbGlicmFyeToKICAgICtIQl9TVUJTRVRfRkxBR1NfQ0ZGX0lERU5U
SVRZX0NIQVJTRVQKLS0tCiAuLi4vaGFyZmJ1enove2hhcmZidXp6XzE0LjIuMS5iYiA9PiBoYXJm
YnV6el8xNC4zLjAuYmJ9ICAgICAgICAgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvaGFyZmJ1
enove2hhcmZidXp6XzE0LjIuMS5iYiA9PiBoYXJmYnV6el8xNC4zLjAuYmJ9ICg5NiUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2hhcmZidXp6L2hhcmZidXp6XzE0LjIuMS5i
YiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9oYXJmYnV6ei9oYXJmYnV6el8xNC4zLjAuYmIKc2lt
aWxhcml0eSBpbmRleCA5NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2hhcmZi
dXp6L2hhcmZidXp6XzE0LjIuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2hh
cmZidXp6L2hhcmZidXp6XzE0LjMuMC5iYgppbmRleCA2YjZjNmEwZjYwLi42ZTRlOWI3Yjg1IDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvaGFyZmJ1enovaGFyZmJ1enpfMTQuMi4x
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9oYXJmYnV6ei9oYXJmYnV6el8xNC4zLjAu
YmIKQEAgLTksNyArOSw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1
PWI5ODQyOWI4ZThlM2MyYTY3Y2ZlZjAxZTk5ZTQ4OTNkIFwKICAgICAgICAgICAgICAgICAgICAg
IgogCiBTUkNfVVJJID0gIiR7R0lUSFVCX0JBU0VfVVJJfS9kb3dubG9hZC8ke1BWfS8ke0JQTn0t
JHtQVn0udGFyLnh6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImE1NGE1ZDhlOTM4MGE0MWZiYjc2
MmNlMzY3YmNiZjc3MDQ3OTJkZmNhMGQ5M2YxYmJjYTg2YzVhNTc5MDJlMGUiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiMTYwNzBkNzdjZmM0YmExZjFlNzMyN2U4M2JmOWIzZjU1ODk4MDgxY2FiZGI5
NGU1NmEzM2UwNGZjODg3NGVhZSIKIAogaW5oZXJpdCBtZXNvbiBwa2djb25maWcgbGliX3BhY2th
Z2UgZ3RrLWRvYyBnb2JqZWN0LWludHJvc3BlY3Rpb24gZ2l0aHViLXJlbGVhc2VzCiAKLS0gCjIu
NDcuMQoK

--===============1066665864141599809==--

