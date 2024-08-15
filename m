Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AC0FC531DF
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 18:59:02 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.131452.1723748336349286693
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Aug 2024 11:58:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=jLbwIeI3;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=ytMl2FMT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019157684093-859081bf-5710-48e0-904b-b606f24b5fac-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1723748335;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=2RF8AMR3m4SfykCxR38gJdOrEiD9Mkr02XrsLMk3XSA=;
	b=jLbwIeI3RCoFyeK0XAQLqfuZq7rMBK09+mOsXwtVwq31exgQgCAfCC7Fsg2+uSlt
	18LDPX+kGloCLmBdMps+CgCFYAS996o+FoA7/0XjiFSyabAtBQEjstLzR/msrY8qNcE
	a2hwIkExvvEf4OmGnTObQJZby4W2DLMNqjztNamo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1723748335;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=2RF8AMR3m4SfykCxR38gJdOrEiD9Mkr02XrsLMk3XSA=;
	b=ytMl2FMTq9snCmG3l8h0L8eWMFEAsZ5i0m5AkAXuPnxVEjRTviDTgB2lNkmM1Jdl
	66wLgEKedqBjsveoPeDRzz+wQhytgF4OO904R770vSSF+Jw+DAIVWX93Z24kxa0glke
	Fucb2651vDsrIgKQg2YZgSiOsppDAgyTI4D/FVMc=
Content-Type: multipart/mixed; boundary="===============3168696206245246610=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vte: upgrading to 0.76.3 FAILED
Message-ID: <0101019157684093-859081bf-5710-48e0-904b-b606f24b5fac-000000@us-west-2.amazonses.com>
Date: Thu, 15 Aug 2024 18:58:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Aug 2024 18:59:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203451

--===============3168696206245246610==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sCgp0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFk
ZSBIZWxwZXIKdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBl
KHMpICp2dGUqIHRvICowLjc2LjMqIGhhcyBGYWlsZWQoZG9fY29tcGlsZSkuCgpEZXRhaWxlZCBl
cnJvciBpbmZvcm1hdGlvbjoKCmRvX2NvbXBpbGUgZmFpbGVkCgoKCk5leHQgc3RlcHM6CiAgICAt
IGFwcGx5IHRoZSBwYXRjaDogZ2l0IGFtIDAwMDEtdnRlLXVwZ3JhZGUtMC43NC4yLTAuNzYuMy5w
YXRjaAogICAgLSBjaGVjayB0aGUgY2hhbmdlcyB0byB1cHN0cmVhbSBwYXRjaGVzIGFuZCBzdW1t
YXJpemUgdGhlbSBpbiB0aGUgY29tbWl0IG1lc3NhZ2UsCiAgICAtIGNvbXBpbGUgYW4gaW1hZ2Ug
dGhhdCBjb250YWlucyB0aGUgcGFja2FnZQogICAgLSBwZXJmb3JtIHNvbWUgYmFzaWMgc2FuaXR5
IHRlc3RzCiAgICAtIGFtZW5kIHRoZSBwYXRjaCBhbmQgc2lnbiBpdCBvZmY6IGdpdCBjb21taXQg
LXMgLS1yZXNldC1hdXRob3IgLS1hbWVuZAogICAgLSBzZW5kIGl0IHRvIHRoZSBhcHByb3ByaWF0
ZSBtYWlsaW5nIGxpc3QKCkFsdGVybmF0aXZlbHksIGlmIHlvdSBiZWxpZXZlIHRoZSByZWNpcGUg
c2hvdWxkIG5vdCBiZSB1cGdyYWRlZCBhdCB0aGlzIHRpbWUsCnlvdSBjYW4gZmlsbCBSRUNJUEVf
Tk9fVVBEQVRFX1JFQVNPTiBpbiByZXNwZWN0aXZlIHJlY2lwZSBmaWxlIHNvIHRoYXQKYXV0b21h
dGljIHVwZ3JhZGVzIHdvdWxkIG5vIGxvbmdlciBiZSBhdHRlbXB0ZWQuCgpQbGVhc2UgcmV2aWV3
IHRoZSBhdHRhY2hlZCBmaWxlcyBmb3IgZnVydGhlciBpbmZvcm1hdGlvbiBhbmQgYnVpbGQvdXBk
YXRlIGZhaWx1cmVzLgpBbnkgcHJvYmxlbSBwbGVhc2UgZmlsZSBhIGJ1ZyBhdCBodHRwczovL2J1
Z3ppbGxhLnlvY3RvcHJvamVjdC5vcmcvZW50ZXJfYnVnLmNnaT9wcm9kdWN0PUF1dG9tYXRlZCUy
MFVwZGF0ZSUyMEhhbmRsZXIKClJlZ2FyZHMsClRoZSBVcGdyYWRlIEhlbHBlcgoKLS0gPjggLS0K
RnJvbSAzOWE5ZDExZjhlMTEwYWQ4NzExMzkyM2Q0NjY1Yzk3ODQzOTM5OWY0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgQXVnIDIwMjQgMTg6NTg6NTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
dGU6IHVwZ3JhZGUgMC43NC4yIC0+IDAuNzYuMwoKLS0tCiAuLi4xLUFkZC1XX0VYSVRDT0RFLW1h
Y3JvLWZvci1ub24tZ2xpYmMtc3lzdGVtcy5wYXRjaCB8IDExICsrKystLS0tLS0tCiAuLi4vdnRl
L3t2dGVfMC43NC4yLmJiID0+IHZ0ZV8wLjc2LjMuYmJ9ICAgICAgICAgICAgICB8ICAyICstCiAy
IGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtc3VwcG9ydC92dGUve3Z0ZV8wLjc0LjIuYmIgPT4gdnRlXzAuNzYuMy5iYn0g
KDk2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC92dGUvdnRlLzAwMDEtQWRk
LVdfRVhJVENPREUtbWFjcm8tZm9yLW5vbi1nbGliYy1zeXN0ZW1zLnBhdGNoIGIvbWV0YS9yZWNp
cGVzLXN1cHBvcnQvdnRlL3Z0ZS8wMDAxLUFkZC1XX0VYSVRDT0RFLW1hY3JvLWZvci1ub24tZ2xp
YmMtc3lzdGVtcy5wYXRjaAppbmRleCA4OTM0ZDVmODBhLi5lMmNmZjZjZjc2IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtc3VwcG9ydC92dGUvdnRlLzAwMDEtQWRkLVdfRVhJVENPREUtbWFjcm8t
Zm9yLW5vbi1nbGliYy1zeXN0ZW1zLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0
ZS92dGUvMDAwMS1BZGQtV19FWElUQ09ERS1tYWNyby1mb3Itbm9uLWdsaWJjLXN5c3RlbXMucGF0
Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGRlOTYzOWJhYWM3OTIzMjdjNzAxZTUwOTI1OGI4YTEz
ZjY5NTllODIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGI4Nzk1ZGRhNjI5NjE0Y2Q4
NDJmY2JhMWM0YjUwYmU3NTljMjBkYTQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBE
YW5pbG8gU3BpbmVsbGEgPGRhbnlzcGluOTdAcHJvdG9ubWFpbC5jb20+CiBEYXRlOiBUaHUsIDIx
IE1hciAyMDE5IDE0OjE5OjI2ICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIEFkZCBXX0VYSVRDT0RF
IG1hY3JvIGZvciBub24tZ2xpYmMgc3lzdGVtcwpAQCAtMTIsMTEgKzEyLDExIEBAIFNpZ25lZC1v
ZmYtYnk6IEFuZHJlYXMgTcO8bGxlciA8c2Nobml0emVsdG9ueUBnbWFpbC5jb20+CiAKIFsxXSBo
dHRwczovL2dpdGxhYi5nbm9tZS5vcmcvR05PTUUvdnRlL2lzc3Vlcy83MgogLS0tCi0gc3JjL3dp
ZGdldC5jYyAgfCA0ICsrKwotIDEgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCisgc3Jj
L3dpZGdldC5jYyB8IDQgKysrKworIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKIAog
ZGlmZiAtLWdpdCBhL3NyYy93aWRnZXQuY2MgYi9zcmMvd2lkZ2V0LmNjCi1pbmRleCAwN2Y3Y2Fi
Zi4uMzFhNzdmNjggMTAwNjQ0CitpbmRleCBiOGRhYTVjLi5jMzU3OTYwIDEwMDY0NAogLS0tIGEv
c3JjL3dpZGdldC5jYwogKysrIGIvc3JjL3dpZGdldC5jYwogQEAgLTE2LDYgKzE2LDEwIEBACkBA
IC0zMCw2ICszMCwzIEBAIGluZGV4IDA3ZjdjYWJmLi4zMWE3N2Y2OCAxMDA2NDQKICAjaW5jbHVk
ZSAiY29uZmlnLmgiCiAgCiAgI2luY2x1ZGUgIndpZGdldC5oaCIKLS0tIAotMi40Mi4wCi0KZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGVfMC43NC4yLmJiIGIvbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvdnRlL3Z0ZV8wLjc2LjMuYmIKc2ltaWxhcml0eSBpbmRleCA5NiUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvdnRlL3Z0ZV8wLjc0LjIuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGVfMC43Ni4zLmJiCmluZGV4IGQ4ZWFmZGUyZmIu
LjhiZWVjMWE4ZjYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGVfMC43
NC4yLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGVfMC43Ni4zLmJiCkBAIC0x
OSw3ICsxOSw3IEBAIEdJRE9DR0VOX01FU09OX09QVElPTiA9ICJkb2NzIgogaW5oZXJpdCBnbm9t
ZWJhc2UgZ2ktZG9jZ2VuIGZlYXR1cmVzX2NoZWNrIHVwc3RyZWFtLXZlcnNpb24taXMtZXZlbiBn
b2JqZWN0LWludHJvc3BlY3Rpb24gc3lzdGVtZCB2YWxhCiAKIFNSQ19VUkkgKz0gImZpbGU6Ly8w
MDAxLUFkZC1XX0VYSVRDT0RFLW1hY3JvLWZvci1ub24tZ2xpYmMtc3lzdGVtcy5wYXRjaCIKLVNS
Q19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gImE1MzVmYjJhOThmZWE4YTI0NDljZDFhMDJjY2Nm
NTE5MDEzMWRkZGZmNTJlNzE1YWZkYWNlM2ZlYjUzNmVhZTciCitTUkNfVVJJW2FyY2hpdmUuc2hh
MjU2c3VtXSA9ICJmNjc4ZTk0YzA1NmYzNzdmZDAwMjEyMTRhZGZmNTQ1MGNiMTcyZTlhMDhiMTYw
OTExMTgxZGRmZjdiN2Q1ZDYwIgogCiBBTllfT0ZfRElTVFJPX0ZFQVRVUkVTID0gIiR7R1RLM0RJ
U1RST0ZFQVRVUkVTfSIKIAotLSAKMi40NC4wCgo=

--===============3168696206245246610==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1867 entries from dependency cache.
Parsing recipes...done.
Parsing of 916 .bb files complete (915 cached, 1 parsed). 1867 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-c48a38333b5580b54c0f7e322738221ecfb23a68"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:c48a38333b5580b54c0f7e322738221ecfb23a68"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 521 Local 509 Mirrors 0 Missed 12 Current 777 (97% match, 99% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 1175 of 1298 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.76.3.bb:do_recipe_qa_setscene)
NOTE: recipe vte-0.76.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vte-0.76.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3196 of 3543 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.76.3.bb:do_fetch)
NOTE: Running task 3374 of 3543 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.76.3.bb:do_write_config)
NOTE: recipe vte-0.76.3-r0: task do_fetch: Started
NOTE: recipe vte-0.76.3-r0: task do_fetch: Succeeded
NOTE: Running task 3525 of 3543 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.76.3.bb:do_unpack)
NOTE: Running task 3526 of 3543 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.76.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe vte-0.76.3-r0: task do_write_config: Started
NOTE: recipe vte-0.76.3-r0: task do_write_config: Succeeded
NOTE: recipe vte-0.76.3-r0: task do_unpack: Started
NOTE: recipe vte-0.76.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vte-0.76.3-r0: task do_unpack: Succeeded
NOTE: Running task 3527 of 3543 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.76.3.bb:do_patch)
NOTE: Running task 3528 of 3543 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.76.3.bb:do_collect_spdx_deps)
NOTE: recipe vte-0.76.3-r0: task do_patch: Started
NOTE: recipe vte-0.76.3-r0: task do_patch: Succeeded
NOTE: Running task 3529 of 3543 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.76.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 3530 of 3543 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.76.3.bb:do_populate_lic)
NOTE: recipe vte-0.76.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe vte-0.76.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vte-0.76.3-r0: task do_populate_lic: Started
NOTE: recipe vte-0.76.3-r0: task do_populate_lic: Succeeded
NOTE: recipe vte-0.76.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.76.3.bb:do_populate_lic unihash changed to 4bc311f88f096de30a3008afeb9be9a124990d1353e87ec1b4ca87a17311bd46
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.76.3.bb:do_deploy_source_date_epoch unihash changed to 620d2c8a6610579c8ac928a0aaa4ac567254587ef122378ee46451bed763b894
NOTE: Setscene tasks completed
NOTE: recipe vte-0.76.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vte-0.76.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3531 of 3543 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.76.3.bb:do_configure)
NOTE: recipe vte-0.76.3-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd-systemctl-native.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_256.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_9.0.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.68.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_populate_sysroot'
 , '/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.8.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.5.1.bb:d
 o_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/ninja/ninja_1.12.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gperf/gperf_3.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot', 'virtual:nati
 ve:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['bluez5', 'openssl', 'base-files', 'base-passwd', 'dbus', 'expat', 'gettext-minimal-native', 'glib-2.0', 'glibc', 'initscripts', 'libxcrypt', 'libxml2', 'ncurses', 'readline', 'systemd-systemctl-native', 'systemd', 'update-rc.d', 'util-linux-libuuid', 'util-linux', 'zlib', 'binutils-cross-x86_64', 'cmake-native', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libedit', 'libtool-native', 'm4-native', 'opkg-utils', 'orc', 'python3-setuptools', 'python3', 'qemu-native', 'quilt-native', 'libstd-rs', 'vala', 'bzip2', 'cracklib', 'libidn2', 'libnsl2', 'libtirpc', 'libpam', 'shadow-sysroot', 'shadow', 'texinfo-dummy-native', 'xz', 'zstd', 'gdk-pixbuf', 'gi-docgen', 'gobject-introspection', 'gtk+3', 'gtk4', 'libgudev', 'librsvg', 'cairo', 'libdrm', 'fontconfig', 'freetype', 'graphene', 'harfbuzz', 'libjpeg-turbo', 'libepoxy', 'libglu', 'mesa', 'pango', 'vulkan-headers', 'vulkan-loader', 'wayland-protocols', 'wayland', 'xrandr', 'libice', 'libpci
 access', 'libpthread-stubs', 'libsm', 'libx11', 'libxau', 'libxcb', 'libxcomposite', 'libxcursor', 'libxdamage', 'libxdmcp', 'libxext', 'libxfixes', 'libxft', 'libxi', 'libxinerama', 'libxkbcommon', 'libxrandr', 'libxrender', 'libxshmfence', 'libxtst', 'libxv', 'libxxf86vm', 'pixman', 'xkeyboard-config', 'xtrans', 'xcb-proto', 'xorgproto', 'util-macros', 'kmod', 'linux-libc-headers', 'alsa-lib', 'flac', 'gstreamer1.0-plugins-bad', 'gstreamer1.0-plugins-base', 'gstreamer1.0', 'libogg', 'libpng', 'libsndfile1', 'libtheora', 'tiff', 'libvorbis', 'sbc', 'libwebp', 'at-spi2-core', 'acl', 'attr', 'bash-completion', 'curl', 'fribidi', 'gdbm', 'gmp', 'gnutls', 'libtasn1', 'icu', 'iso-codes', 'libcap-ng', 'libcap', 'libffi', 'libical', 'libpcre2', 'libseccomp', 'libunistring', 'libusb1', 'nettle', 'shared-mime-info', 'sqlite3', 'openssl-native', 'expat-native', 'gettext-native', 'glib-2.0-native', 'libxml2-native', 'ncurses-native', 'util-linux-libuuid-native', 'zlib-native', 'flex-native', 
 'gnu-config-native', 'libedit-native', 'make-native', 'meson-native', 'ninja-native', 'patch-native', 'perl-native', 'pkgconfig-native', 'pseudo-native', 'python3-build-native', 'python3-flit-core-native', 'python3-installer-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'python3-setuptools-native', 'python3-wheel-native', 'python3-native', 'vala-native', 'bzip2-native', 'gperf-native', 'libnsl2-native', 'libtirpc-native', 'shadow-native', 'unzip-native', 'xz-native', 'zstd-native', 'gobject-introspection-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libbsd-native', 'libffi-native', 'libmd-native', 'libmpc-native', 'libpcre2-native', 'mpfr-native', 're2c-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dgir=true -Ddocs=false -Dvapi=true -Dfribidi=false -Dgnutls=true -Dgtk4=true -D_systemd=true...
| The Meson build system
| Version: 1.5.1
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vte/0.76.3/vte-0.76.3
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vte/0.76.3/build
| Build type: cross build
| Project name: vte
| Project version: 0.76.3
| C compiler for the host machine: x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vte/0.76.3/recipe-sysroot (gcc 14.2.0 "x86_64-poky-linux-gcc (GCC) 14.2.0")
| C linker for the host machine: x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vte/0.76.3/recipe-sysroot ld.bfd 2.43.0.20240805
| C++ compiler for the host machine: x86_64-poky-linux-g++ -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vte/0.76.3/recipe-sysroot (gcc 14.2.0 "x86_64-poky-linux-g++ (GCC) 14.2.0")
| C++ linker for the host machine: x86_64-poky-linux-g++ -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vte/0.76.3/recipe-sysroot ld.bfd 2.43.0.20240805
| C compiler for the build machine: gcc (gcc 13.2.0 "gcc (GCC) 13.2.0")
| C linker for the build machine: gcc ld.bfd 2.42.0.20240216
| C++ compiler for the build machine: g++ (gcc 13.2.0 "g++ (GCC) 13.2.0")
| C++ linker for the build machine: g++ ld.bfd 2.42.0.20240216
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86_64
| Host machine cpu: x86_64
| Target machine cpu family: x86_64
| Target machine cpu: x86_64
| Compiler for C supports arguments -std=gnu11: YES
| ../vte-0.76.3/meson.build:143: WARNING: Consider using the built-in option for language standard version instead of using "-std=gnu11".
| Compiler for C++ supports arguments -std=gnu++20: YES
| ../vte-0.76.3/meson.build:151: WARNING: Consider using the built-in option for language standard version instead of using "-std=gnu++20".
| Program python3 (dataclasses) found: YES (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vte/0.76.3/recipe-sysroot-native/usr/bin/nativepython3) modules: dataclasses
| Header "sys/ioctl.h" has symbol "TIOCGWINSZ" : YES
| Library m found: YES
| Checking if "fork" compiles: YES
| Checking if "grantpt" compiles: YES
| Checking if "posix_openpt" compiles: YES
| Checking if "ptsname" compiles: YES
| Checking if "tcgetattr" compiles: YES
| Checking if "unlockpt" compiles: YES
| Checking if "explicit_bzero" compiles: YES
| Checking if "fdwalk" compiles: NO
| Checking if "pread" compiles: YES
| Checking if "pwrite" compiles: YES
| Checking if "strchrnul" compiles: YES
| Checking if "close_range" compiles: YES
| Checking if "ceil" with dependency -lm compiles: YES
| Checking if "floor" with dependency -lm compiles: YES
| Checking if "round" with dependency -lm compiles: YES
| Compiler for C supports arguments -Wall: YES
| Compiler for C supports arguments -Wextra: YES
| Compiler for C supports arguments -Wcast-align: YES
| Compiler for C supports arguments -Wcast-function-type: YES
| Compiler for C supports arguments -Wclobbered: YES
| Compiler for C supports arguments -Wempty-body: YES
| Compiler for C supports arguments -Wendif-labels: YES
| Compiler for C supports arguments -Werror=init-self: YES
| Compiler for C supports arguments -Werror=missing-include-dirs: YES
| Compiler for C supports arguments -Werror=pointer-arith: YES
| Compiler for C supports arguments -Wfloat-equal: YES
| Compiler for C supports arguments -Wignored-qualifiers: YES
| Compiler for C supports arguments -Winvalid-pch: YES
| Compiler for C supports arguments -Wlogical-op: YES
| Compiler for C supports arguments -Wmisleading-indentation: YES
| Compiler for C supports arguments -Wmissing-declarations: YES
| Compiler for C supports arguments -Wmissing-field-initializers: YES
| Compiler for C supports arguments -Wmissing-format-attribute: YES
| Compiler for C supports arguments -Wmissing-include-dirs: YES
| Compiler for C supports arguments -Wmissing-noreturn: YES
| Compiler for C supports arguments -Wno-deprecated-declarations: YES
| Compiler for C supports arguments -Wno-address-of-packed-member: YES
| Compiler for C supports arguments -Wno-c99-designator: NO
| Compiler for C supports arguments -Wno-missing-field-initializers: YES
| Compiler for C supports arguments -Wno-packed: YES
| Compiler for C supports arguments -Wno-switch-enum: YES
| Compiler for C supports arguments -Wno-unused-parameter: YES
| Compiler for C supports arguments -Wno-volatile: NO
| Compiler for C supports arguments -Wshadow: YES
| Compiler for C supports arguments -Wshift-negative-value: YES
| Compiler for C supports arguments -Wsign-compare: YES
| Compiler for C supports arguments -Wstrict-aliasing=2: YES
| Compiler for C supports arguments -Wtype-limits: YES
| Compiler for C supports arguments -Wundef: YES
| Compiler for C supports arguments -Wuninitialized: YES
| Compiler for C supports arguments -Wuninitialized: YES (cached)
| Compiler for C supports arguments -Wunsafe-loop-optimizations: YES
| Compiler for C supports arguments -Wunused: YES
| Compiler for C supports arguments -Wunused-but-set-parameter: YES
| Compiler for C supports arguments -Wunused-but-set-variable: YES
| Compiler for C supports arguments -Wunused-function: YES
| Compiler for C supports arguments -Wunused-label: YES
| Compiler for C supports arguments -Wunused-local-typedefs: YES
| Compiler for C supports arguments -Wunused-value: YES
| Compiler for C supports arguments -Wunused-variable: YES
| Compiler for C supports arguments -Wvla: YES
| Compiler for C supports arguments -Wwrite-strings: YES
| Compiler for C supports arguments -fdiagnostics-show-option: YES
| Compiler for C supports arguments -fno-common: YES
| Compiler for C supports arguments -fno-semantic-interposition: YES
| Compiler for C supports arguments -fno-strict-aliasing: YES
| Compiler for C supports arguments -Waggregate-return: YES
| Compiler for C supports arguments -Werror=implicit-function-declaration: YES
| Compiler for C supports arguments -Werror=missing-prototypes: YES
| Compiler for C supports arguments -Wimplicit: YES
| Compiler for C supports arguments -Wimplicit-fallthrough=3: YES
| Compiler for C supports arguments -Wmissing-parameter-type: YES
| Compiler for C supports arguments -Wnested-externs: YES
| Compiler for C supports arguments -Wold-style-declaration: YES
| Compiler for C supports arguments -Wold-style-definition: YES
| Compiler for C supports arguments -Woverride-init: YES
| Compiler for C supports arguments -Wsign-compare: YES (cached)
| Compiler for C supports arguments -Wstrict-prototypes: YES
| Compiler for C++ supports arguments -Wall: YES
| Compiler for C++ supports arguments -Wextra: YES
| Compiler for C++ supports arguments -Wcast-align: YES
| Compiler for C++ supports arguments -Wcast-function-type: YES
| Compiler for C++ supports arguments -Wclobbered: YES
| Compiler for C++ supports arguments -Wempty-body: YES
| Compiler for C++ supports arguments -Wendif-labels: YES
| Compiler for C++ supports arguments -Werror=init-self: YES
| Compiler for C++ supports arguments -Werror=missing-include-dirs: YES
| Compiler for C++ supports arguments -Werror=pointer-arith: YES
| Compiler for C++ supports arguments -Wfloat-equal: YES
| Compiler for C++ supports arguments -Wignored-qualifiers: YES
| Compiler for C++ supports arguments -Winvalid-pch: YES
| Compiler for C++ supports arguments -Wlogical-op: YES
| Compiler for C++ supports arguments -Wmisleading-indentation: YES
| Compiler for C++ supports arguments -Wmissing-declarations: YES
| Compiler for C++ supports arguments -Wmissing-field-initializers: YES
| Compiler for C++ supports arguments -Wmissing-format-attribute: YES
| Compiler for C++ supports arguments -Wmissing-include-dirs: YES
| Compiler for C++ supports arguments -Wmissing-noreturn: YES
| Compiler for C++ supports arguments -Wno-deprecated-declarations: YES
| Compiler for C++ supports arguments -Wno-address-of-packed-member: YES
| Compiler for C++ supports arguments -Wno-c99-designator: NO
| Compiler for C++ supports arguments -Wno-missing-field-initializers: YES
| Compiler for C++ supports arguments -Wno-packed: YES
| Compiler for C++ supports arguments -Wno-switch-enum: YES
| Compiler for C++ supports arguments -Wno-unused-parameter: YES
| Compiler for C++ supports arguments -Wno-volatile: YES
| Compiler for C++ supports arguments -Wshadow: YES
| Compiler for C++ supports arguments -Wshift-negative-value: YES
| Compiler for C++ supports arguments -Wsign-compare: YES
| Compiler for C++ supports arguments -Wstrict-aliasing=2: YES
| Compiler for C++ supports arguments -Wtype-limits: YES
| Compiler for C++ supports arguments -Wundef: YES
| Compiler for C++ supports arguments -Wuninitialized: YES
| Compiler for C++ supports arguments -Wuninitialized: YES (cached)
| Compiler for C++ supports arguments -Wunsafe-loop-optimizations: YES
| Compiler for C++ supports arguments -Wunused: YES
| Compiler for C++ supports arguments -Wunused-but-set-parameter: YES
| Compiler for C++ supports arguments -Wunused-but-set-variable: YES
| Compiler for C++ supports arguments -Wunused-function: YES
| Compiler for C++ supports arguments -Wunused-label: YES
| Compiler for C++ supports arguments -Wunused-local-typedefs: YES
| Compiler for C++ supports arguments -Wunused-value: YES
| Compiler for C++ supports arguments -Wunused-variable: YES
| Compiler for C++ supports arguments -Wvla: YES
| Compiler for C++ supports arguments -Wwrite-strings: YES
| Compiler for C++ supports arguments -fdiagnostics-show-option: YES
| Compiler for C++ supports arguments -fno-common: YES
| Compiler for C++ supports arguments -fno-semantic-interposition: YES
| Compiler for C++ supports arguments -fno-strict-aliasing: YES
| Compiler for C++ supports arguments -Wimplicit-fallthrough=5: YES
| Compiler for C++ supports arguments -Wnon-virtual-dtor: YES
| Compiler for C++ supports arguments -Wstrict-null-sentinel: YES
| Compiler for C++ supports arguments -fvisibility-inlines-hidden: YES
| Compiler for C++ supports arguments -fvisibility=hidden: YES
| Compiler for C++ supports arguments -fvisibility-inlines-hidden: YES (cached)
| Compiler for C++ supports arguments -fvisibility=hidden: YES (cached)
| Compiler for C supports arguments -Werror=format=2 -Werror=format-nonliteral -Werror=format-security: YES
| Compiler for C++ supports arguments -Werror=format=2 -Werror=format-nonliteral -Werror=format-security: YES
| ../vte-0.76.3/meson.build:577: WARNING: Consider using the built-in warning_level option instead of using "-Wall".
| ../vte-0.76.3/meson.build:577: WARNING: Consider using the built-in warning_level option instead of using "-Wextra".
| ../vte-0.76.3/meson.build:578: WARNING: Consider using the built-in warning_level option instead of using "-Wall".
| ../vte-0.76.3/meson.build:578: WARNING: Consider using the built-in warning_level option instead of using "-Wextra".
| Compiler for C supports link arguments -Wl,-Bsymbolic: YES
| Compiler for C++ supports link arguments -Wl,-Bsymbolic: YES
| Compiler for C supports link arguments -Wl,-Bsymbolic-functions: YES
| Compiler for C++ supports link arguments -Wl,-Bsymbolic-functions: YES
| Compiler for C supports link arguments -fstack-protector: YES
| Compiler for C++ supports link arguments -fstack-protector: YES
| Compiler for C supports link arguments -fstack-protector-strong: YES
| Compiler for C++ supports link arguments -fstack-protector-strong: YES
| Found pkg-config: YES (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vte/0.76.3/recipe-sysroot-native/usr/bin/pkg-config) 0.29.2
| Run-time dependency cairo found: YES 1.18.0
| Run-time dependency cairo-gobject found: YES 1.18.0
| Run-time dependency gio-2.0 found: YES 2.80.2
| Run-time dependency glib-2.0 found: YES 2.80.2
| Run-time dependency gobject-2.0 found: YES 2.80.2
| Run-time dependency pango found: YES 1.54.0
| Run-time dependency libpcre2-8 found: YES 10.44
| Run-time dependency threads found: YES
| Found CMake: NO
| Run-time dependency liblz4 found: NO (tried pkgconfig)
| 
| ../vte-0.76.3/meson.build:615:20: ERROR: Dependency "liblz4" not found, tried pkgconfig
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vte/0.76.3/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vte/0.76.3/temp/run.do_configure.338694:177 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vte/0.76.3/temp/run.do_configure.338694, line 177
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vte/0.76.3/temp/run.do_configure.338694, line 166
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vte/0.76.3/temp/run.do_configure.338694, line 155
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vte/0.76.3/temp/run.do_configure.338694, line 190
NOTE: recipe vte-0.76.3-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 3531 tasks of which 3522 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240815185830.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240815185830.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.76.3.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: vte-0.76.3-r0 do_configure: meson failed
ERROR: vte-0.76.3-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vte/0.76.3/temp/run.do_configure.338694', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vte/0.76.3/temp/log.do_configure.338694
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.76.3.bb:do_configure) failed with exit code '1'

--===============3168696206245246610==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vte-upgrade-0.74.2-0.76.3.patch"

RnJvbSAzOWE5ZDExZjhlMTEwYWQ4NzExMzkyM2Q0NjY1Yzk3ODQzOTM5OWY0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgQXVnIDIwMjQgMTg6NTg6NTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
dGU6IHVwZ3JhZGUgMC43NC4yIC0+IDAuNzYuMwoKLS0tCiAuLi4xLUFkZC1XX0VYSVRDT0RFLW1h
Y3JvLWZvci1ub24tZ2xpYmMtc3lzdGVtcy5wYXRjaCB8IDExICsrKystLS0tLS0tCiAuLi4vdnRl
L3t2dGVfMC43NC4yLmJiID0+IHZ0ZV8wLjc2LjMuYmJ9ICAgICAgICAgICAgICB8ICAyICstCiAy
IGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtc3VwcG9ydC92dGUve3Z0ZV8wLjc0LjIuYmIgPT4gdnRlXzAuNzYuMy5iYn0g
KDk2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC92dGUvdnRlLzAwMDEtQWRk
LVdfRVhJVENPREUtbWFjcm8tZm9yLW5vbi1nbGliYy1zeXN0ZW1zLnBhdGNoIGIvbWV0YS9yZWNp
cGVzLXN1cHBvcnQvdnRlL3Z0ZS8wMDAxLUFkZC1XX0VYSVRDT0RFLW1hY3JvLWZvci1ub24tZ2xp
YmMtc3lzdGVtcy5wYXRjaAppbmRleCA4OTM0ZDVmODBhLi5lMmNmZjZjZjc2IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtc3VwcG9ydC92dGUvdnRlLzAwMDEtQWRkLVdfRVhJVENPREUtbWFjcm8t
Zm9yLW5vbi1nbGliYy1zeXN0ZW1zLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0
ZS92dGUvMDAwMS1BZGQtV19FWElUQ09ERS1tYWNyby1mb3Itbm9uLWdsaWJjLXN5c3RlbXMucGF0
Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGRlOTYzOWJhYWM3OTIzMjdjNzAxZTUwOTI1OGI4YTEz
ZjY5NTllODIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGI4Nzk1ZGRhNjI5NjE0Y2Q4
NDJmY2JhMWM0YjUwYmU3NTljMjBkYTQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBE
YW5pbG8gU3BpbmVsbGEgPGRhbnlzcGluOTdAcHJvdG9ubWFpbC5jb20+CiBEYXRlOiBUaHUsIDIx
IE1hciAyMDE5IDE0OjE5OjI2ICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIEFkZCBXX0VYSVRDT0RF
IG1hY3JvIGZvciBub24tZ2xpYmMgc3lzdGVtcwpAQCAtMTIsMTEgKzEyLDExIEBAIFNpZ25lZC1v
ZmYtYnk6IEFuZHJlYXMgTcO8bGxlciA8c2Nobml0emVsdG9ueUBnbWFpbC5jb20+CiAKIFsxXSBo
dHRwczovL2dpdGxhYi5nbm9tZS5vcmcvR05PTUUvdnRlL2lzc3Vlcy83MgogLS0tCi0gc3JjL3dp
ZGdldC5jYyAgfCA0ICsrKwotIDEgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCisgc3Jj
L3dpZGdldC5jYyB8IDQgKysrKworIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKIAog
ZGlmZiAtLWdpdCBhL3NyYy93aWRnZXQuY2MgYi9zcmMvd2lkZ2V0LmNjCi1pbmRleCAwN2Y3Y2Fi
Zi4uMzFhNzdmNjggMTAwNjQ0CitpbmRleCBiOGRhYTVjLi5jMzU3OTYwIDEwMDY0NAogLS0tIGEv
c3JjL3dpZGdldC5jYwogKysrIGIvc3JjL3dpZGdldC5jYwogQEAgLTE2LDYgKzE2LDEwIEBACkBA
IC0zMCw2ICszMCwzIEBAIGluZGV4IDA3ZjdjYWJmLi4zMWE3N2Y2OCAxMDA2NDQKICAjaW5jbHVk
ZSAiY29uZmlnLmgiCiAgCiAgI2luY2x1ZGUgIndpZGdldC5oaCIKLS0tIAotMi40Mi4wCi0KZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGVfMC43NC4yLmJiIGIvbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvdnRlL3Z0ZV8wLjc2LjMuYmIKc2ltaWxhcml0eSBpbmRleCA5NiUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvdnRlL3Z0ZV8wLjc0LjIuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGVfMC43Ni4zLmJiCmluZGV4IGQ4ZWFmZGUyZmIu
LjhiZWVjMWE4ZjYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGVfMC43
NC4yLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGVfMC43Ni4zLmJiCkBAIC0x
OSw3ICsxOSw3IEBAIEdJRE9DR0VOX01FU09OX09QVElPTiA9ICJkb2NzIgogaW5oZXJpdCBnbm9t
ZWJhc2UgZ2ktZG9jZ2VuIGZlYXR1cmVzX2NoZWNrIHVwc3RyZWFtLXZlcnNpb24taXMtZXZlbiBn
b2JqZWN0LWludHJvc3BlY3Rpb24gc3lzdGVtZCB2YWxhCiAKIFNSQ19VUkkgKz0gImZpbGU6Ly8w
MDAxLUFkZC1XX0VYSVRDT0RFLW1hY3JvLWZvci1ub24tZ2xpYmMtc3lzdGVtcy5wYXRjaCIKLVNS
Q19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gImE1MzVmYjJhOThmZWE4YTI0NDljZDFhMDJjY2Nm
NTE5MDEzMWRkZGZmNTJlNzE1YWZkYWNlM2ZlYjUzNmVhZTciCitTUkNfVVJJW2FyY2hpdmUuc2hh
MjU2c3VtXSA9ICJmNjc4ZTk0YzA1NmYzNzdmZDAwMjEyMTRhZGZmNTQ1MGNiMTcyZTlhMDhiMTYw
OTExMTgxZGRmZjdiN2Q1ZDYwIgogCiBBTllfT0ZfRElTVFJPX0ZFQVRVUkVTID0gIiR7R1RLM0RJ
U1RST0ZFQVRVUkVTfSIKIAotLSAKMi40NC4wCgo=

--===============3168696206245246610==--

