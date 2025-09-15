Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3528CAC5A4
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 11:54:59 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.30904.1757937288170118044
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 04:54:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=xyCRv8K+;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=gR3jK1B3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101994d3a673f-df921031-7cba-42d3-a275-29c16befcc13-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1757937297;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=RZ6yqkSvQejzsKzXMetLzsg7rHWRQjipQ0b4ngyReXU=;
	b=xyCRv8K+mQAUNpuGzKNxZUiQCtm5OJnKRfRm9TP5BJ++CsP8kMBlLO/uhi6CvTd1
	HWAa2bLaJS4Ef/MLNffmeEO6YS2dgtvotqhilfPwVDS/YsrIpICKIkEcTOrATjbxgI3
	DgvsgygLpMRWf8HSYafUmOHuXBKAJ4H1tMvObiwE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1757937297;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=RZ6yqkSvQejzsKzXMetLzsg7rHWRQjipQ0b4ngyReXU=;
	b=gR3jK1B3K1mgfArsbtbZ2PXRfHKep9EoE+797wm0KlcMflyDvzxGElfLI2kUc92c
	J32S/+R9sAC8SBLgnAhXAf2Cnb2pR7XHjxz2FdXceFrx5M4/J1NzfVRNZinkZJnXRHi
	9MfY3gHH+ROMOOhoYI/XKg+3JOBdNV5CQQVp9ZVA=
Content-Type: multipart/mixed; boundary="===============5163793989787285453=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libproxy: upgrading to 0.5.11 SUCCEEDED
Message-ID: <010101994d3a673f-df921031-7cba-42d3-a275-29c16befcc13-000000@us-west-2.amazonses.com>
Date: Mon, 15 Sep 2025 11:54:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 11:54:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223479

--===============5163793989787285453==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libproxy* to *0.5.11* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libproxy-upgrade-0.5.10-0.5.11.patch
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

-- >8 --
From 3fbc4007cfa69958bf24e3d5a5c12b083a3fb2a9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Sep 2025 11:42:45 +0000
Subject: [PATCH] libproxy: upgrade 0.5.10 -> 0.5.11

---
 .../libproxy/{libproxy_0.5.10.bb => libproxy_0.5.11.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libproxy/{libproxy_0.5.10.bb => libproxy_0.5.11.bb} (95%)

diff --git a/meta/recipes-support/libproxy/libproxy_0.5.10.bb b/meta/recipes-support/libproxy/libproxy_0.5.11.bb
similarity index 95%
rename from meta/recipes-support/libproxy/libproxy_0.5.10.bb
rename to meta/recipes-support/libproxy/libproxy_0.5.11.bb
index 21930ada00..1efa3cdc0e 100644
--- a/meta/recipes-support/libproxy/libproxy_0.5.10.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.5.11.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 DEPENDS = "glib-2.0"
 
 SRC_URI = "git://github.com/libproxy/libproxy;protocol=https;branch=main;tag=${PV}"
-SRCREV = "7e4852f9658084c61a95973b8a1d720b1763437a"
+SRCREV = "3fd3a6e845c0386d91abc742453d0f29bf28c404"
 
 inherit meson pkgconfig gobject-introspection vala gi-docgen
 GIDOCGEN_MESON_OPTION = 'docs'
-- 
2.47.1


--===============5163793989787285453==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libproxy: PV changed from "0.5.10" to "0.5.11"
packages/x86-64-v3-poky-linux/libproxy: PKGV changed from 0.5.10 [default] to 0.5.11 [default]
packages/x86-64-v3-poky-linux/libproxy: SRC_URI changed from "git://github.com/libproxy/libproxy;protocol=https;branch=main;tag=0.5.10" to "git://github.com/libproxy/libproxy;protocol=https;branch=main;tag=0.5.11"
packages/x86-64-v3-poky-linux/libproxy/libproxy-dbg: PV changed from "0.5.10" to "0.5.11"
packages/x86-64-v3-poky-linux/libproxy/libproxy-dbg: FILELIST: removed "/usr/lib/.debug/libproxy.so.0.5.10", added "/usr/lib/.debug/libproxy.so.0.5.11"
packages/x86-64-v3-poky-linux/libproxy/libproxy-dbg: PKGV changed from 0.5.10 [default] to 0.5.11 [default]
packages/x86-64-v3-poky-linux/libproxy/libproxy-dev: PV changed from "0.5.10" to "0.5.11"
packages/x86-64-v3-poky-linux/libproxy/libproxy-dev: PKGV changed from 0.5.10 [default] to 0.5.11 [default]
packages/x86-64-v3-poky-linux/libproxy/libproxy-doc: PV changed from "0.5.10" to "0.5.11"
packages/x86-64-v3-poky-linux/libproxy/libproxy-doc: PKGV changed from 0.5.10 [default] to 0.5.11 [default]
packages/x86-64-v3-poky-linux/libproxy/libproxy-locale: PV changed from "0.5.10" to "0.5.11"
packages/x86-64-v3-poky-linux/libproxy/libproxy-locale: PKGV changed from 0.5.10 [default] to 0.5.11 [default]
packages/x86-64-v3-poky-linux/libproxy/libproxy-src: PV changed from "0.5.10" to "0.5.11"
packages/x86-64-v3-poky-linux/libproxy/libproxy-src: PKGV changed from 0.5.10 [default] to 0.5.11 [default]
packages/x86-64-v3-poky-linux/libproxy/libproxy-staticdev: PV changed from "0.5.10" to "0.5.11"
packages/x86-64-v3-poky-linux/libproxy/libproxy-staticdev: PKGV changed from 0.5.10 [default] to 0.5.11 [default]
packages/x86-64-v3-poky-linux/libproxy/libproxy: PV changed from "0.5.10" to "0.5.11"
packages/x86-64-v3-poky-linux/libproxy/libproxy: FILELIST: removed "/usr/lib/libproxy.so.0.5.10", added "/usr/lib/libproxy.so.0.5.11"
packages/x86-64-v3-poky-linux/libproxy/libproxy: PKGV changed from 0.5.10 [default] to 0.5.11 [default]
packages/x86-64-v3-poky-linux/libproxy/libproxy: FILES: removed "/usr/lib/libproxy/0.5.10/modules", added "/usr/lib/libproxy/0.5.11/modules"
Changes to packages/x86-64-v3-poky-linux/libproxy (sysroot):
  /usr/lib/libproxy.so.1 changed symlink target from libproxy.so.0.5.10 to libproxy.so.0.5.11
  /usr/lib/libproxy.so.0.5.10 moved to /usr/lib/libproxy.so.0.5.11

--===============5163793989787285453==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libproxy-upgrade-0.5.10-0.5.11.patch"

RnJvbSAzZmJjNDAwN2NmYTY5OTU4YmYyNGUzZDVhNWMxMmIwODNhM2ZiMmE5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgU2VwIDIwMjUgMTE6NDI6NDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJwcm94eTogdXBncmFkZSAwLjUuMTAgLT4gMC41LjExCgotLS0KIC4uLi9saWJwcm94eS97bGli
cHJveHlfMC41LjEwLmJiID0+IGxpYnByb3h5XzAuNS4xMS5iYn0gICAgICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1zdXBwb3J0L2xpYnByb3h5L3tsaWJwcm94eV8wLjUuMTAuYmIgPT4gbGlicHJveHlf
MC41LjExLmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnBy
b3h5L2xpYnByb3h5XzAuNS4xMC5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnByb3h5L2xp
YnByb3h5XzAuNS4xMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9saWJwcm94eS9saWJwcm94eV8wLjUuMTAuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1zdXBwb3J0L2xpYnByb3h5L2xpYnByb3h5XzAuNS4xMS5iYgppbmRleCAyMTkzMGFk
YTAwLi4xZWZhM2NkYzBlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJwcm94
eS9saWJwcm94eV8wLjUuMTAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlicHJveHkv
bGlicHJveHlfMC41LjExLmJiCkBAIC0xNCw3ICsxNCw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL0NPUFlJTkc7bWQ1PTRmYmQ2NTM4MGNkZDI1NTk1MTA3OTAwOGIzNjQ1MTZjIFwKIERF
UEVORFMgPSAiZ2xpYi0yLjAiCiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9saWJwcm94
eS9saWJwcm94eTtwcm90b2NvbD1odHRwczticmFuY2g9bWFpbjt0YWc9JHtQVn0iCi1TUkNSRVYg
PSAiN2U0ODUyZjk2NTgwODRjNjFhOTU5NzNiOGExZDcyMGIxNzYzNDM3YSIKK1NSQ1JFViA9ICIz
ZmQzYTZlODQ1YzAzODZkOTFhYmM3NDI0NTNkMGYyOWJmMjhjNDA0IgogCiBpbmhlcml0IG1lc29u
IHBrZ2NvbmZpZyBnb2JqZWN0LWludHJvc3BlY3Rpb24gdmFsYSBnaS1kb2NnZW4KIEdJRE9DR0VO
X01FU09OX09QVElPTiA9ICdkb2NzJwotLSAKMi40Ny4xCgo=

--===============5163793989787285453==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libproxy/libproxy: FILELIST: removed "/usr/lib/libproxy.so.0.5.10", added "/usr/lib/libproxy.so.0.5.11"
Changes to packages/x86-64-v3-poky-linux/libproxy (sysroot):
  /usr/lib/libproxy.so.1 changed symlink target from libproxy.so.0.5.10 to libproxy.so.0.5.11
  /usr/lib/libproxy.so.0.5.10 moved to /usr/lib/libproxy.so.0.5.11

--===============5163793989787285453==--

