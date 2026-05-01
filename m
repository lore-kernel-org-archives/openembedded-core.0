Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 631C9CD3436
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:39 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15615.1777645533778284771
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=2Qz8QGWc;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=dz/W/m2I;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019de3ee3734-454dd53e-f4df-4596-8ff9-767d092a3cd4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645533;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=eEim2ADF3cLuG7hkXaAyOMs23s1GaN0bCM5jtnyl1sA=;
	b=2Qz8QGWcmPKyBYOTxk6VmeEhe7xiTuZ1T3BoLKqOB6l8YnxI+zQhUO0rrV/+QHv1
	g4Ytwq7XZUF9id/di+GdzBzT/htR3Sc7R0ir3MqGNZXZS/iJyXwJK8WRqKW0HXMiPPz
	bD0aHcQaJgNa4GDAvCX3Xq1KeLfY4Wd/2gQcBaLM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645533;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=eEim2ADF3cLuG7hkXaAyOMs23s1GaN0bCM5jtnyl1sA=;
	b=dz/W/m2I462s9PTgriScCbRJy904rLNrZM6n2j6U88symPKqHjBW80LJGmH23fNm
	MWuwe6NMMSggJyYcc9OQok4IzNeDJqtgujmUCJvgvzJUj9iTJXD3tGNN75yktmddZzm
	sgt9NzoJmnK2o5AvqzpsJ0wpalR2KY0hvSD70SI0=
Content-Type: multipart/mixed; boundary="===============3066205561690726588=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] font-util: upgrading to 1.4.2 SUCCEEDED
Message-ID: <0101019de3ee3734-454dd53e-f4df-4596-8ff9-767d092a3cd4-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:32 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236214

--===============3066205561690726588==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sCgp0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFk
ZSBIZWxwZXIKdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBl
KHMpICpmb250LXV0aWwqIHRvICoxLjQuMiogaGFzIFN1Y2NlZWRlZC4KCk5leHQgc3RlcHM6CiAg
ICAtIGFwcGx5IHRoZSBwYXRjaDogZ2l0IGFtIDAwMDEtZm9udC11dGlsLXVwZ3JhZGUtMS40LjEt
MS40LjIucGF0Y2gKICAgIC0gY2hlY2sgdGhlIGNoYW5nZXMgdG8gdXBzdHJlYW0gcGF0Y2hlcyBh
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
ID44IC0tCkZyb20gMjFhYTMzMzJjNDBiNjFmMDE1OGUxOTExNmRjYzM0YTM2NjQ2NzA1ZSBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKRnJvbTogVXBncmFkZSBIZWxwZXIgPGF1aEB5b2N0b3Byb2pl
Y3Qub3JnPgpEYXRlOiBGcmksIDEgTWF5IDIwMjYgMDY6MjA6NTggKzAwMDAKU3ViamVjdDogW1BB
VENIXSBmb250LXV0aWw6IHVwZ3JhZGUgMS40LjEgLT4gMS40LjIKCi0tLQogLi4ue2ZvbnQtdXRp
bF8xLjQuMS5iYiA9PiBmb250LXV0aWxfMS40LjIuYmJ9IHwgMjMgKysrKysrKysrKysrKysrKyst
LQogMSBmaWxlIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctZm9udC97Zm9udC11dGlsXzEuNC4xLmJiID0+
IGZvbnQtdXRpbF8xLjQuMi5iYn0gKDM0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MveG9yZy1mb250L2ZvbnQtdXRpbF8xLjQuMS5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy94b3JnLWZvbnQvZm9udC11dGlsXzEuNC4yLmJiCnNpbWlsYXJpdHkgaW5kZXggMzQlCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWZvbnQvZm9udC11dGlsXzEuNC4xLmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1mb250L2ZvbnQtdXRpbF8xLjQu
Mi5iYgppbmRleCA2YWQxMTJhY2E3Li44YjEzZWQ4ZmU1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MveG9yZy1mb250L2ZvbnQtdXRpbF8xLjQuMS5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MveG9yZy1mb250L2ZvbnQtdXRpbF8xLjQuMi5iYgpAQCAtMSw5ICsxLDI4IEBA
CisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQg
YnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2Ug
YmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0
ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMg
aW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChl
eGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisj
IFRoZSBjaGFuZ2VzOgorIworIyAtLS0gQ09QWUlORworIyArKysgQ09QWUlORworIyBAQCAtMTUx
LDQgKzE1MSw0IEBACisjICAgICAgICAgIE1vZGlmaWNhdGlvbiBieSBVbmljb2RlLCBJbmMuIFVu
aWNvZGUsIEluYy4gc2hhbGwgaGF2ZSB0aGUgcmlnaHQgdG8gbW9kaWZ5IHRoaXMgQWdyZWVtZW50
IGF0IGFueSB0aW1lIGJ5IHBvc3RpbmcgaXQgdG8gdGhpcyB3ZWJzaXRlLiBUaGUgdXNlciBtYXkg
bm90IGFzc2lnbiBhbnkgcGFydCBvZiB0aGlzIEFncmVlbWVudCB3aXRob3V0IFVuaWNvZGUsIElu
Yy7igJlzIHByaW9yIHdyaXR0ZW4gY29uc2VudC4KKyMgICAgICAgICAgVGF4ZXMuIFRoZSB1c2Vy
IGFncmVlcyB0byBwYXkgYW55IHRheGVzIGFyaXNpbmcgZnJvbSBhY2Nlc3MgdG8gdGhpcyB3ZWJz
aXRlIG9yIHVzZSBvZiB0aGUgaW5mb3JtYXRpb24gaGVyZWluLCBleGNlcHQgZm9yIHRob3NlIGJh
c2VkIG9uIFVuaWNvZGXigJlzIG5ldCBpbmNvbWUuCisjICAgICAgICAgIFNldmVyYWJpbGl0eS4g
IElmIGFueSBwcm92aXNpb24gb2YgdGhpcyBBZ3JlZW1lbnQgaXMgZGVjbGFyZWQgaW52YWxpZCBv
ciB1bmVuZm9yY2VhYmxlLCB0aGUgcmVtYWluaW5nIHByb3Zpc2lvbnMgb2YgdGhpcyBBZ3JlZW1l
bnQgc2hhbGwgcmVtYWluIGluIGVmZmVjdC4KKyMgLSAgICAgICAgRW50aXJlIEFncmVlbWVudC4g
VGhpcyBBZ3JlZW1lbnQgY29uc3RpdHV0ZXMgdGhlIGVudGlyZSBhZ3JlZW1lbnQgYmV0d2VlbiB0
aGUgcGFydGllcy4gCisjICsgICAgICAgIEVudGlyZSBBZ3JlZW1lbnQuIFRoaXMgQWdyZWVtZW50
IGNvbnN0aXR1dGVzIHRoZSBlbnRpcmUgYWdyZWVtZW50IGJldHdlZW4gdGhlIHBhcnRpZXMuCisj
IAorIworCiBTVU1NQVJZID0gIlguT3JnIGZvbnQgcGFja2FnZSBjcmVhdGlvbi9pbnN0YWxsYXRp
b24gdXRpbGl0aWVzIgogCiByZXF1aXJlIHhvcmctZm9udC1jb21tb24uaW5jCiAKIExJQ0VOU0Ug
PSAiVW5pY29kZS1UT1UgJiBNSVQgJiBYMTEgJiBCU0QtMi1DbGF1c2UiCi1MSUNfRklMRVNfQ0hL
U1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT0yYTllNzA1YzAwZTQ2M2M4ZDI5NGY5MDQ4Njg1MmUw
NiBcCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT03NTZlNzQxMmVlMDRj
ODBmNTgzM2NkMmYzNTI0MmY3YSBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly91Y3MyYW55
LmM7ZW5kbGluZT0yODttZDU9ODM1N2RjNTY3ZmM2MjhiZDEyNjk2ZjE1YjJhMzNiY2IgXAogICAg
ICAgICAgICAgICAgICAgICBmaWxlOi8vYmRmdHJ1bmNhdGUuYztlbmRsaW5lPTI2O21kNT00Zjgy
ZmZjMTAxYTFiMTY1ZWFlOWM2OTk4YWJmZjkzNyBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6
Ly9tYXAtSVNPODg1OS0xO2JlZ2lubGluZT0xO2VuZGxpbmU9NDttZDU9OWM5YzFkNTI1ZDI5YzBl
ODJiNWM5OWVkYmI4ZTcxYzEgXApAQCAtMTYsNyArMzUsNyBAQCBSREVQRU5EUzoke1BOfTpjbGFz
cy1uYXRpdmUgPSAiIgogCiBCQkNMQVNTRVhURU5EID0gIm5hdGl2ZSIKIAotU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjVjOWY2NDEyM2MxOTRiMTUwZmVlODkwNDk5OTE2ODczODZlNmZmMzZlZjJhZjdi
ODBiYTUzZWZhZjM2OGNjOTUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMDJlNGY4YWZkY2YwM2Nj
ODM3MmNhOWMzN2FhMTA0YjFlMzZiNDc3MjJkYmM3OTUzMWJlMDhmMGE0YzYyMjk5OSIKIAogU1lT
Uk9PVF9ESVJTX0lHTk9SRTpyZW1vdmUgPSAiJHtkYXRhZGlyfS9mb250cyIKIAotLSAKMi40Ny4x
Cgo=

--===============3066205561690726588==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/font-util/font-util-doc: PKGSIZE changed from 2864 to 3222 (+12%)

--===============3066205561690726588==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1976 targets, 62 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-c1026a1237a61beb542242e5860dd71977c2eeed"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:c1026a1237a61beb542242e5860dd71977c2eeed"
meta-yocto-bsp       
meta-poky            = "master:a67ae0e83d8aba0c46cb8383808b2d1203fbb414"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 296 Local 260 Mirrors 0 Missed 36 Current 227 (87% match, 93% complete)
done.
Removing 7 stale sstate objects for arch allarch...done.
Removing 1 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 249 of 523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/font-util_1.4.2.bb:do_populate_lic_setscene)
NOTE: Running setscene task 364 of 523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 394 of 523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 407 of 523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 424 of 523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 897 of 1295 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/encodings_1.1.0.bb:do_configure)
NOTE: Running task 898 of 1295 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/mkfontscale_1.2.3.bb:do_recipe_qa)
NOTE: recipe font-util-1.4.2-r0: task do_populate_lic_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe encodings-1_1.1.0-r0: task do_configure: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libfontenc-1_1.1.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mkfontscale-1.2.3-r0: task do_recipe_qa: Started
NOTE: recipe font-util-1.4.2-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running task 929 of 1295 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/font-util_1.4.2.bb:do_recipe_qa)
NOTE: recipe freetype-2.14.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 431 of 523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 433 of 523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 434 of 523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 435 of 523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 436 of 523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 437 of 523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 438 of 523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 439 of 523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 440 of 523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 441 of 523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 442 of 523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: recipe font-util-1.4.2-r0: task do_recipe_qa: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe mkfontscale-1.2.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 930 of 1295 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/mkfontscale_1.2.3.bb:do_fetch)
NOTE: recipe libfontenc-1_1.1.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 443 of 523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe freetype-2.14.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 444 of 523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 446 of 523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 447 of 523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe mkfontscale-1.2.3-r0: task do_fetch: Started
NOTE: recipe libfontenc-1_1.1.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mkfontscale-1.2.3-r0: task do_fetch: Succeeded
NOTE: Running task 931 of 1295 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/mkfontscale_1.2.3.bb:do_unpack)
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 451 of 523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2025.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 453 of 523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_recipe_qa_setscene)
NOTE: recipe font-util-1.4.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libfontenc-1_1.1.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 933 of 1295 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/font-util_1.4.2.bb:do_fetch)
NOTE: Running task 935 of 1295 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb:do_fetch)
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 455 of 523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.56.bb:do_packagedata_setscene)
NOTE: recipe mkfontscale-1.2.3-r0: task do_unpack: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe font-util-1.4.2-r0: task do_fetch: Started
NOTE: recipe libfontenc-1_1.1.9-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe font-util-1.4.2-r0: task do_fetch: Succeeded
NOTE: Running setscene task 456 of 523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 458 of 523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libfontenc-1_1.1.9-r0: task do_fetch: Succeeded
NOTE: Running task 936 of 1295 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/font-util_1.4.2.bb:do_unpack)
NOTE: Running task 937 of 1295 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb:do_unpack)
NOTE: recipe freetype-2.14.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 459 of 523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.56.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 461 of 523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.56-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mkfontscale-1.2.3-r0: task do_unpack: Succeeded
NOTE: Running task 949 of 1295 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/mkfontscale_1.2.3.bb:do_patch)
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe font-util-1.4.2-r0: task do_unpack: Started
NOTE: recipe libfontenc-1_1.1.9-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libpng-1.6.56-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mkfontscale-1.2.3-r0: task do_patch: Started
NOTE: recipe libpng-1.6.56-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 463 of 523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mkfontscale-1.2.3-r0: task do_patch: Succeeded
NOTE: recipe freetype-2.14.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running task 955 of 1295 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/mkfontscale_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: Running setscene task 469 of 523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe font-util-1.4.2-r0: task do_unpack: Succeeded
NOTE: Running task 956 of 1295 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/font-util_1.4.2.bb:do_patch)
NOTE: recipe libfontenc-1_1.1.9-r0: task do_unpack: Succeeded
NOTE: Running task 957 of 1295 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb:do_patch)
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe mkfontscale-1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpng-1.6.56-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 470 of 523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 471 of 523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 473 of 523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.56.bb:do_recipe_qa_setscene)
NOTE: recipe font-util-1.4.2-r0: task do_patch: Started
NOTE: recipe libfontenc-1_1.1.9-r0: task do_patch: Started
NOTE: recipe font-util-1.4.2-r0: task do_patch: Succeeded
NOTE: recipe libfontenc-1_1.1.9-r0: task do_patch: Succeeded
NOTE: Running task 958 of 1295 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/font-util_1.4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 487 of 523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.56-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1072 of 1295 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/font-util_1.4.2.bb:do_create_recipe_spdx)
NOTE: recipe font-util-1.4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpng-1.6.56-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe font-util-1.4.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe mkfontscale-1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 489 of 523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/mkfontscale_1.2.3.bb:do_deploy_source_date_epoch unihash changed to 0bfc208238d58be73660eba8ac62ac1d1d18c6840208e1086476bc38f5b82ada
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 483 of 523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 492 of 523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 494 of 523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 496 of 523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe font-util-1.4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe font-util-1.4.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1098 of 1295 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb:do_create_recipe_spdx)
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libfontenc-1_1.1.9-r0: task do_create_recipe_spdx: Started
NOTE: Running setscene task 497 of 523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 499 of 523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 501 of 523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 502 of 523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 503 of 523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 505 of 523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 506 of 523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libfontenc-1_1.1.9-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1101 of 1295 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/mkfontscale_1.2.3.bb:do_create_recipe_spdx)
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mkfontscale-1.2.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 510 of 523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 511 of 523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 512 of 523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 515 of 523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe mkfontscale-1.2.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 519 of 523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 521 of 523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 523 of 523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe encodings-1_1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1252 of 1295 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/encodings_1.1.0.bb:do_compile)
NOTE: recipe encodings-1_1.1.0-r0: task do_compile: Started
NOTE: recipe encodings-1_1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1253 of 1295 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/encodings_1.1.0.bb:do_install)
NOTE: recipe encodings-1_1.1.0-r0: task do_install: Started
NOTE: recipe encodings-1_1.1.0-r0: task do_install: Succeeded
NOTE: Running task 1254 of 1295 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/encodings_1.1.0.bb:do_populate_sysroot)
NOTE: Running task 1255 of 1295 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/encodings_1.1.0.bb:do_package)
NOTE: recipe encodings-1_1.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe encodings-1_1.1.0-r0: task do_package: Started
NOTE: recipe encodings-1_1.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/encodings_1.1.0.bb:do_populate_sysroot unihash changed to 6a4f157502a7f2d9b5c8e9f62b208aa77dd69328f66a9471e2f81497cd8fcf93
NOTE: Setscene tasks completed
NOTE: Running task 1256 of 1295 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/font-util_1.4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe font-util-1.4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe font-util-1.4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1257 of 1295 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/font-util_1.4.2.bb:do_configure)
NOTE: recipe font-util-1.4.2-r0: task do_configure: Started
NOTE: recipe encodings-1_1.1.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/encodings_1.1.0.bb:do_package unihash changed to c482b9b98009fe39d0a83e2d5e30c79da2b75e6fae4cb22f1ba08639f350fff7
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/encodings_1.1.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/encodings_1.1.0.bb:do_package_qa became valid
NOTE: Running setscene task 511 of 523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/encodings_1.1.0.bb:do_package_qa_setscene)
NOTE: recipe encodings-1_1.1.0-r0: task do_package_qa_setscene: Started
NOTE: recipe encodings-1_1.1.0-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 523 of 523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/encodings_1.1.0.bb:do_packagedata_setscene)
NOTE: recipe encodings-1_1.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe encodings-1_1.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1259 of 1295 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/encodings_1.1.0.bb:do_create_spdx)
NOTE: Running task 1260 of 1295 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/encodings_1.1.0.bb:do_package_write_ipk)
NOTE: Running task 1261 of 1295 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/encodings_1.1.0.bb:do_package_write_deb)
NOTE: Running task 1262 of 1295 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/encodings_1.1.0.bb:do_package_write_rpm)
NOTE: recipe encodings-1_1.1.0-r0: task do_create_spdx: Started
NOTE: recipe encodings-1_1.1.0-r0: task do_package_write_ipk: Started
NOTE: recipe encodings-1_1.1.0-r0: task do_package_write_deb: Started
NOTE: recipe encodings-1_1.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe encodings-1_1.1.0-r0: task do_create_spdx: Succeeded
NOTE: recipe encodings-1_1.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/encodings_1.1.0.bb:do_package_write_rpm unihash changed to 8a09ee9f89c803b9020dfdc5b1a11f2aff8c3462d5ba06ae93916bc637240fb8
NOTE: recipe encodings-1_1.1.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/encodings_1.1.0.bb:do_package_write_deb unihash changed to 93e3abf3d2b38654cda7bb0972c90e4ec1953417d58131962139cc9c736ef6e2
NOTE: recipe encodings-1_1.1.0-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/encodings_1.1.0.bb:do_package_write_ipk unihash changed to cb2baa7576359843e0f43b641b91cb5cf2d1e4009b8b4b1226777f672dca7053
NOTE: recipe font-util-1.4.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1264 of 1295 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/font-util_1.4.2.bb:do_compile)
NOTE: recipe font-util-1.4.2-r0: task do_compile: Started
NOTE: recipe font-util-1.4.2-r0: task do_compile: Succeeded
NOTE: Running task 1265 of 1295 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/font-util_1.4.2.bb:do_install)
NOTE: recipe font-util-1.4.2-r0: task do_install: Started
NOTE: recipe font-util-1.4.2-r0: task do_install: Succeeded
NOTE: Running task 1266 of 1295 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/font-util_1.4.2.bb:do_populate_sysroot)
NOTE: Running task 1267 of 1295 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/font-util_1.4.2.bb:do_package)
NOTE: recipe font-util-1.4.2-r0: task do_populate_sysroot: Started
NOTE: recipe font-util-1.4.2-r0: task do_package: Started
NOTE: recipe font-util-1.4.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1268 of 1295 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfontenc-1_1.1.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfontenc-1_1.1.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1269 of 1295 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb:do_configure)
NOTE: recipe libfontenc-1_1.1.9-r0: task do_configure: Started
NOTE: recipe font-util-1.4.2-r0: task do_package: Succeeded
NOTE: Running task 1270 of 1295 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/font-util_1.4.2.bb:do_packagedata)
NOTE: recipe font-util-1.4.2-r0: task do_packagedata: Started
NOTE: recipe font-util-1.4.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1271 of 1295 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/font-util_1.4.2.bb:do_create_spdx)
NOTE: recipe font-util-1.4.2-r0: task do_create_spdx: Started
NOTE: recipe font-util-1.4.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libfontenc-1_1.1.9-r0: task do_configure: Succeeded
NOTE: Running task 1272 of 1295 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.9-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.9-r0: task do_compile: Succeeded
NOTE: Running task 1273 of 1295 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb:do_install)
NOTE: recipe libfontenc-1_1.1.9-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.9-r0: task do_install: Succeeded
NOTE: Running task 1274 of 1295 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb:do_package)
NOTE: Running task 1275 of 1295 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb:do_populate_sysroot)
NOTE: recipe libfontenc-1_1.1.9-r0: task do_populate_sysroot: Started
NOTE: recipe libfontenc-1_1.1.9-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.9-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1276 of 1295 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/mkfontscale_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe mkfontscale-1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mkfontscale-1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1277 of 1295 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/mkfontscale_1.2.3.bb:do_configure)
NOTE: recipe mkfontscale-1.2.3-r0: task do_configure: Started
NOTE: recipe libfontenc-1_1.1.9-r0: task do_package: Succeeded
NOTE: Running task 1278 of 1295 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb:do_packagedata)
NOTE: recipe libfontenc-1_1.1.9-r0: task do_packagedata: Started
NOTE: recipe libfontenc-1_1.1.9-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb:do_packagedata unihash changed to db133421a35d6f9ce1ad8e6bda6d612e66b9134a334a234c9b8e6fd00fed9749
NOTE: Setscene tasks completed
NOTE: Running task 1279 of 1295 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb:do_create_spdx)
NOTE: recipe libfontenc-1_1.1.9-r0: task do_create_spdx: Started
NOTE: recipe libfontenc-1_1.1.9-r0: task do_create_spdx: Succeeded
NOTE: recipe mkfontscale-1.2.3-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1280 of 1295 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/mkfontscale_1.2.3.bb:do_compile)
NOTE: recipe mkfontscale-1.2.3-r0: task do_compile: Started
NOTE: recipe mkfontscale-1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 1281 of 1295 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/mkfontscale_1.2.3.bb:do_install)
NOTE: recipe mkfontscale-1.2.3-r0: task do_install: Started
NOTE: recipe mkfontscale-1.2.3-r0: task do_install: Succeeded
NOTE: Running task 1282 of 1295 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/mkfontscale_1.2.3.bb:do_package)
NOTE: Running task 1283 of 1295 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/mkfontscale_1.2.3.bb:do_populate_sysroot)
NOTE: recipe mkfontscale-1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe mkfontscale-1.2.3-r0: task do_package: Started
NOTE: recipe mkfontscale-1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mkfontscale-1.2.3-r0: task do_package: Succeeded
NOTE: Running task 1284 of 1295 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/mkfontscale_1.2.3.bb:do_packagedata)
NOTE: recipe mkfontscale-1.2.3-r0: task do_packagedata: Started
NOTE: recipe mkfontscale-1.2.3-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1284 tasks of which 1236 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260501062019.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260501062019.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/mkfontscale_1.2.3.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/mkfontscale/1.2.3/temp/log.do_packagedata.2383714
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: mkfontscale-1.2.3-r0 do_packagedata: QA Issue: Package version for package mkfontscale-src went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: mkfontscale-1.2.3-r0 do_packagedata: QA Issue: Package version for package mkfontscale-dbg went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: mkfontscale-1.2.3-r0 do_packagedata: QA Issue: Package version for package mkfontscale-staticdev went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: mkfontscale-1.2.3-r0 do_packagedata: QA Issue: Package version for package mkfontscale-dev went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: mkfontscale-1.2.3-r0 do_packagedata: QA Issue: Package version for package mkfontscale-doc went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: mkfontscale-1.2.3-r0 do_packagedata: QA Issue: Package version for package mkfontscale-locale went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: mkfontscale-1.2.3-r0 do_packagedata: QA Issue: Package version for package mkfontscale went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: mkfontscale-1.2.3-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/mkfontscale/1.2.3/temp/log.do_packagedata.2383714
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/mkfontscale_1.2.3.bb:do_packagedata) failed with exit code '1'

--===============3066205561690726588==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/encodings/encodings-dev: FILES: removed "/lib/*.la /lib/lib*.so /lib/*.o"
packages/all-poky-linux/encodings/encodings-staticdev: FILES: removed "/lib/*.a"
packages/all-poky-linux/encodings/encodings: FILES: removed "/lib/*.so.* /sbin/* /bin/*", added "/usr/lib/*.so.*"
packages/x86-64-v3-poky-linux/font-util/font-util-dbg: PKGSIZE changed from 81856 to 83272 (+2%)
packages/x86-64-v3-poky-linux/font-util/font-util-dbg: PV changed from "1.4.1" to "1.4.2"
packages/x86-64-v3-poky-linux/font-util/font-util-dbg: PKGV changed from 1.4.1 [default] to 1.4.2 [default]
packages/x86-64-v3-poky-linux/font-util/font-util-dev: PKGSIZE changed from 14721 to 14720 (-0%)
packages/x86-64-v3-poky-linux/font-util/font-util-dev: PV changed from "1.4.1" to "1.4.2"
packages/x86-64-v3-poky-linux/font-util/font-util-dev: PKGV changed from 1.4.1 [default] to 1.4.2 [default]
packages/x86-64-v3-poky-linux/font-util/font-util-doc: PKGSIZE changed from 2864 to 3222 (+12%)
packages/x86-64-v3-poky-linux/font-util/font-util-doc: PV changed from "1.4.1" to "1.4.2"
packages/x86-64-v3-poky-linux/font-util/font-util-doc: PKGV changed from 1.4.1 [default] to 1.4.2 [default]
packages/x86-64-v3-poky-linux/font-util/font-util-locale: PV changed from "1.4.1" to "1.4.2"
packages/x86-64-v3-poky-linux/font-util/font-util-locale: PKGV changed from 1.4.1 [default] to 1.4.2 [default]
packages/x86-64-v3-poky-linux/font-util/font-util-src: PKGSIZE changed from 30281 to 31427 (+4%)
packages/x86-64-v3-poky-linux/font-util/font-util-src: PV changed from "1.4.1" to "1.4.2"
packages/x86-64-v3-poky-linux/font-util/font-util-src: PKGV changed from 1.4.1 [default] to 1.4.2 [default]
packages/x86-64-v3-poky-linux/font-util/font-util-src: FILELIST: directory renamed /usr/src/debug/font-util/1.4.1 -> /usr/src/debug/font-util/1.4.2
packages/x86-64-v3-poky-linux/font-util/font-util-staticdev: PV changed from "1.4.1" to "1.4.2"
packages/x86-64-v3-poky-linux/font-util/font-util-staticdev: PKGV changed from 1.4.1 [default] to 1.4.2 [default]
packages/x86-64-v3-poky-linux/font-util/font-util: PKGSIZE changed from 205415 to 205414 (-0%)
packages/x86-64-v3-poky-linux/font-util/font-util: PV changed from "1.4.1" to "1.4.2"
packages/x86-64-v3-poky-linux/font-util/font-util: PKGV changed from 1.4.1 [default] to 1.4.2 [default]
packages/x86-64-v3-poky-linux/font-util: PV changed from "1.4.1" to "1.4.2"
packages/x86-64-v3-poky-linux/font-util: SRC_URI changed from "https://www.x.org/releases//individual/font/font-util-1.4.1.tar.xz" to "https://www.x.org/releases//individual/font/font-util-1.4.2.tar.xz"
packages/x86-64-v3-poky-linux/font-util: PKGV changed from 1.4.1 [default] to 1.4.2 [default]

--===============3066205561690726588==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-font-util-upgrade-1.4.1-1.4.2.patch"

RnJvbSAyMWFhMzMzMmM0MGI2MWYwMTU4ZTE5MTE2ZGNjMzRhMzY2NDY3MDVlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXkgMjAyNiAwNjoyMDo1OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGZv
bnQtdXRpbDogdXBncmFkZSAxLjQuMSAtPiAxLjQuMgoKLS0tCiAuLi57Zm9udC11dGlsXzEuNC4x
LmJiID0+IGZvbnQtdXRpbF8xLjQuMi5iYn0gfCAyMyArKysrKysrKysrKysrKysrKy0tCiAxIGZp
bGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1mb250L3tmb250LXV0aWxfMS40LjEuYmIgPT4gZm9udC11
dGlsXzEuNC4yLmJifSAoMzQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94
b3JnLWZvbnQvZm9udC11dGlsXzEuNC4xLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmct
Zm9udC9mb250LXV0aWxfMS40LjIuYmIKc2ltaWxhcml0eSBpbmRleCAzNCUKcmVuYW1lIGZyb20g
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctZm9udC9mb250LXV0aWxfMS40LjEuYmIKcmVuYW1l
IHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWZvbnQvZm9udC11dGlsXzEuNC4yLmJiCmlu
ZGV4IDZhZDExMmFjYTcuLjhiMTNlZDhmZTUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFw
aGljcy94b3JnLWZvbnQvZm9udC11dGlsXzEuNC4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFw
aGljcy94b3JnLWZvbnQvZm9udC11dGlsXzEuNC4yLmJiCkBAIC0xLDkgKzEsMjggQEAKKyMgRklY
TUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2
dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVu
IHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBM
SUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0
aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6
ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNo
YW5nZXM6CisjCisjIC0tLSBDT1BZSU5HCisjICsrKyBDT1BZSU5HCisjIEBAIC0xNTEsNCArMTUx
LDQgQEAKKyMgICAgICAgICAgTW9kaWZpY2F0aW9uIGJ5IFVuaWNvZGUsIEluYy4gVW5pY29kZSwg
SW5jLiBzaGFsbCBoYXZlIHRoZSByaWdodCB0byBtb2RpZnkgdGhpcyBBZ3JlZW1lbnQgYXQgYW55
IHRpbWUgYnkgcG9zdGluZyBpdCB0byB0aGlzIHdlYnNpdGUuIFRoZSB1c2VyIG1heSBub3QgYXNz
aWduIGFueSBwYXJ0IG9mIHRoaXMgQWdyZWVtZW50IHdpdGhvdXQgVW5pY29kZSwgSW5jLuKAmXMg
cHJpb3Igd3JpdHRlbiBjb25zZW50LgorIyAgICAgICAgICBUYXhlcy4gVGhlIHVzZXIgYWdyZWVz
IHRvIHBheSBhbnkgdGF4ZXMgYXJpc2luZyBmcm9tIGFjY2VzcyB0byB0aGlzIHdlYnNpdGUgb3Ig
dXNlIG9mIHRoZSBpbmZvcm1hdGlvbiBoZXJlaW4sIGV4Y2VwdCBmb3IgdGhvc2UgYmFzZWQgb24g
VW5pY29kZeKAmXMgbmV0IGluY29tZS4KKyMgICAgICAgICAgU2V2ZXJhYmlsaXR5LiAgSWYgYW55
IHByb3Zpc2lvbiBvZiB0aGlzIEFncmVlbWVudCBpcyBkZWNsYXJlZCBpbnZhbGlkIG9yIHVuZW5m
b3JjZWFibGUsIHRoZSByZW1haW5pbmcgcHJvdmlzaW9ucyBvZiB0aGlzIEFncmVlbWVudCBzaGFs
bCByZW1haW4gaW4gZWZmZWN0LgorIyAtICAgICAgICBFbnRpcmUgQWdyZWVtZW50LiBUaGlzIEFn
cmVlbWVudCBjb25zdGl0dXRlcyB0aGUgZW50aXJlIGFncmVlbWVudCBiZXR3ZWVuIHRoZSBwYXJ0
aWVzLiAKKyMgKyAgICAgICAgRW50aXJlIEFncmVlbWVudC4gVGhpcyBBZ3JlZW1lbnQgY29uc3Rp
dHV0ZXMgdGhlIGVudGlyZSBhZ3JlZW1lbnQgYmV0d2VlbiB0aGUgcGFydGllcy4KKyMgCisjCisK
IFNVTU1BUlkgPSAiWC5PcmcgZm9udCBwYWNrYWdlIGNyZWF0aW9uL2luc3RhbGxhdGlvbiB1dGls
aXRpZXMiCiAKIHJlcXVpcmUgeG9yZy1mb250LWNvbW1vbi5pbmMKIAogTElDRU5TRSA9ICJVbmlj
b2RlLVRPVSAmIE1JVCAmIFgxMSAmIEJTRC0yLUNsYXVzZSIKLUxJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL0NPUFlJTkc7bWQ1PTJhOWU3MDVjMDBlNDYzYzhkMjk0ZjkwNDg2ODUyZTA2IFwKK0xJ
Q19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTc1NmU3NDEyZWUwNGM4MGY1ODMz
Y2QyZjM1MjQyZjdhIFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL3VjczJhbnkuYztlbmRs
aW5lPTI4O21kNT04MzU3ZGM1NjdmYzYyOGJkMTI2OTZmMTViMmEzM2JjYiBcCiAgICAgICAgICAg
ICAgICAgICAgIGZpbGU6Ly9iZGZ0cnVuY2F0ZS5jO2VuZGxpbmU9MjY7bWQ1PTRmODJmZmMxMDFh
MWIxNjVlYWU5YzY5OThhYmZmOTM3IFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL21hcC1J
U084ODU5LTE7YmVnaW5saW5lPTE7ZW5kbGluZT00O21kNT05YzljMWQ1MjVkMjljMGU4MmI1Yzk5
ZWRiYjhlNzFjMSBcCkBAIC0xNiw3ICszNSw3IEBAIFJERVBFTkRTOiR7UE59OmNsYXNzLW5hdGl2
ZSA9ICIiCiAKIEJCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0g
PSAiNWM5ZjY0MTIzYzE5NGIxNTBmZWU4OTA0OTk5MTY4NzM4NmU2ZmYzNmVmMmFmN2I4MGJhNTNl
ZmFmMzY4Y2M5NSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIwMmU0ZjhhZmRjZjAzY2M4MzcyY2E5
YzM3YWExMDRiMWUzNmI0NzcyMmRiYzc5NTMxYmUwOGYwYTRjNjIyOTk5IgogCiBTWVNST09UX0RJ
UlNfSUdOT1JFOnJlbW92ZSA9ICIke2RhdGFkaXJ9L2ZvbnRzIgogCi0tIAoyLjQ3LjEKCg==

--===============3066205561690726588==--

