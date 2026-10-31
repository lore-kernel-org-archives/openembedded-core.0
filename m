Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1568.1793425338749673097
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 22:42:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=TeOigJ2G;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=rC/8gLfw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101a1907aed95-6254f9d2-3150-4f5e-912e-f23aedb56fb2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793425337;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=jV9aWtVLIOjPvUdk4/t/y8y6zDXcxaPdstZrDLIOK2w=;
	b=TeOigJ2GHIDVdcMyNz0+JeFnpmrCMrwYzKP5na7NU1MWOpG2awmhh4iRUrHjiO0i
	Bowsr//uCSNI6HnaOJ/4lQp8qdzpj+FMvUzpjywRFjpIxfuDuqRZIPucSLLSi3hE9tz
	snjQtiUxqgjCGN30Ui1/RMz9L/FnEdjImljI1wFE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793425337;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=jV9aWtVLIOjPvUdk4/t/y8y6zDXcxaPdstZrDLIOK2w=;
	b=rC/8gLfw2vHGEDqLumWM8OQLKa/yo14FMVeEvEfDJM7GajItBAQH+xDzcF53UuHY
	GnvKghqdDSI5oflroD0Lw1E7Z4h7IgFMjiM21JR7bUQssGscmD64EIFpAxXTWNIIBEu
	99ZrVMFhqL8DykzxfrKC06dlWdv/4I7IygZghFXY=
Content-Type: multipart/mixed; boundary="===============3651353072052000201=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] kmod: upgrading to 34.3 SUCCEEDED
Message-ID: <010101a1907aed95-6254f9d2-3150-4f5e-912e-f23aedb56fb2-000000@us-west-2.amazonses.com>
Date: Sat, 31 Oct 2026 05:42:17 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.31-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 05:42:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249137

--===============3651353072052000201==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *kmod* to *34.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-kmod-upgrade-34.2-34.3.patch
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
From aea91a4dc4a9c5892d90d3bc06ba9be5d5a9403d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 31 Oct 2026 05:37:02 +0000
Subject: [PATCH] kmod: upgrade 34.2 -> 34.3

---
 meta/recipes-kernel/kmod/{kmod_34.2.bb => kmod_34.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/kmod/{kmod_34.2.bb => kmod_34.3.bb} (97%)

diff --git a/meta/recipes-kernel/kmod/kmod_34.2.bb b/meta/recipes-kernel/kmod/kmod_34.3.bb
similarity index 97%
rename from meta/recipes-kernel/kmod/kmod_34.2.bb
rename to meta/recipes-kernel/kmod/kmod_34.3.bb
index 892468a87e..435ab4f47c 100644
--- a/meta/recipes-kernel/kmod/kmod_34.2.bb
+++ b/meta/recipes-kernel/kmod/kmod_34.3.bb
@@ -18,7 +18,7 @@ inherit bash-completion gtk-doc manpages meson pkgconfig update-alternatives
 SRC_URI = "https://www.kernel.org/pub/linux/utils/kernel/${BPN}/${BP}.tar.xz \
            file://depmod-search.conf \
            "
-SRC_URI[sha256sum] = "5a5d5073070cc7e0c7a7a3c6ec2a0e1780850c8b47b3e3892226b93ffcb9cb54"
+SRC_URI[sha256sum] = "985554de49c21a58abd68c6cda2251384e1e5bb08b3b14c7f02b51f4c90c2958"
 
 EXTRA_OEMESON += "\
     -Ddistconfdir=${nonarch_base_libdir} \
-- 
2.47.1


--===============3651353072052000201==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/kmod/kmod-bash-completion: PKGV changed from 34.2 [default] to 34.3 [default]
packages/x86-64-v3-poky-linux/kmod/kmod-bash-completion: PV changed from "34.2" to "34.3"
packages/x86-64-v3-poky-linux/kmod/kmod-dbg: PKGV changed from 34.2 [default] to 34.3 [default]
packages/x86-64-v3-poky-linux/kmod/kmod-dbg: PV changed from "34.2" to "34.3"
packages/x86-64-v3-poky-linux/kmod/kmod-dbg: PKGSIZE changed from 1063880 to 1065064 (+0%)
packages/x86-64-v3-poky-linux/kmod/kmod-dev: PKGV changed from 34.2 [default] to 34.3 [default]
packages/x86-64-v3-poky-linux/kmod/kmod-dev: PV changed from "34.2" to "34.3"
packages/x86-64-v3-poky-linux/kmod/kmod-doc: PKGV changed from 34.2 [default] to 34.3 [default]
packages/x86-64-v3-poky-linux/kmod/kmod-doc: PV changed from "34.2" to "34.3"
packages/x86-64-v3-poky-linux/kmod/kmod-fish-completion: PKGV changed from 34.2 [default] to 34.3 [default]
packages/x86-64-v3-poky-linux/kmod/kmod-fish-completion: PV changed from "34.2" to "34.3"
packages/x86-64-v3-poky-linux/kmod/kmod-locale: PKGV changed from 34.2 [default] to 34.3 [default]
packages/x86-64-v3-poky-linux/kmod/kmod-locale: PV changed from "34.2" to "34.3"
packages/x86-64-v3-poky-linux/kmod/kmod-src: PKGV changed from 34.2 [default] to 34.3 [default]
packages/x86-64-v3-poky-linux/kmod/kmod-src: PV changed from "34.2" to "34.3"
packages/x86-64-v3-poky-linux/kmod/kmod-src: PKGSIZE changed from 405030 to 405446 (+0%)
packages/x86-64-v3-poky-linux/kmod/kmod-src: FILELIST: directory renamed /usr/src/debug/kmod/34.2/libkmod -> /usr/src/debug/kmod/34.3/libkmod, directory renamed /usr/src/debug/kmod/34.2/shared -> /usr/src/debug/kmod/34.3/shared, directory renamed /usr/src/debug/kmod/34.2/tools -> /usr/src/debug/kmod/34.3/tools
packages/x86-64-v3-poky-linux/kmod/kmod-staticdev: PKGV changed from 34.2 [default] to 34.3 [default]
packages/x86-64-v3-poky-linux/kmod/kmod-staticdev: PV changed from "34.2" to "34.3"
packages/x86-64-v3-poky-linux/kmod/kmod-zsh-completion: PKGV changed from 34.2 [default] to 34.3 [default]
packages/x86-64-v3-poky-linux/kmod/kmod-zsh-completion: PV changed from "34.2" to "34.3"
packages/x86-64-v3-poky-linux/kmod/kmod: PKGV changed from 34.2 [default] to 34.3 [default]
packages/x86-64-v3-poky-linux/kmod/kmod: PV changed from "34.2" to "34.3"
packages/x86-64-v3-poky-linux/kmod: PKGV changed from 34.2 [default] to 34.3 [default]
packages/x86-64-v3-poky-linux/kmod: PV changed from "34.2" to "34.3"
packages/x86-64-v3-poky-linux/kmod: SRC_URI changed from "https://www.kernel.org/pub/linux/utils/kernel/kmod/kmod-34.2.tar.xz file://depmod-search.conf" to "https://www.kernel.org/pub/linux/utils/kernel/kmod/kmod-34.3.tar.xz file://depmod-search.conf"
packages/x86-64-v3-poky-linux/kmod/libkmod: PKGV changed from 34.2 [default] to 34.3 [default]
packages/x86-64-v3-poky-linux/kmod/libkmod: PV changed from "34.2" to "34.3"

--===============3651353072052000201==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-kmod-upgrade-34.2-34.3.patch"

RnJvbSBhZWE5MWE0ZGM0YTljNTg5MmQ5MGQzYmMwNmJhOWJlNWQ1YTk0MDNkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMzEgT2N0IDIwMjYgMDU6Mzc6MDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBr
bW9kOiB1cGdyYWRlIDM0LjIgLT4gMzQuMwoKLS0tCiBtZXRhL3JlY2lwZXMta2VybmVsL2ttb2Qv
e2ttb2RfMzQuMi5iYiA9PiBrbW9kXzM0LjMuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWtlcm5lbC9r
bW9kL3trbW9kXzM0LjIuYmIgPT4ga21vZF8zNC4zLmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1rZXJuZWwva21vZC9rbW9kXzM0LjIuYmIgYi9tZXRhL3JlY2lwZXMta2VybmVs
L2ttb2Qva21vZF8zNC4zLmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1rZXJuZWwva21vZC9rbW9kXzM0LjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1r
ZXJuZWwva21vZC9rbW9kXzM0LjMuYmIKaW5kZXggODkyNDY4YTg3ZS4uNDM1YWI0ZjQ3YyAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9rbW9kL2ttb2RfMzQuMi5iYgorKysgYi9tZXRh
L3JlY2lwZXMta2VybmVsL2ttb2Qva21vZF8zNC4zLmJiCkBAIC0xOCw3ICsxOCw3IEBAIGluaGVy
aXQgYmFzaC1jb21wbGV0aW9uIGd0ay1kb2MgbWFucGFnZXMgbWVzb24gcGtnY29uZmlnIHVwZGF0
ZS1hbHRlcm5hdGl2ZXMKIFNSQ19VUkkgPSAiaHR0cHM6Ly93d3cua2VybmVsLm9yZy9wdWIvbGlu
dXgvdXRpbHMva2VybmVsLyR7QlBOfS8ke0JQfS50YXIueHogXAogICAgICAgICAgICBmaWxlOi8v
ZGVwbW9kLXNlYXJjaC5jb25mIFwKICAgICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0g
IjVhNWQ1MDczMDcwY2M3ZTBjN2E3YTNjNmVjMmEwZTE3ODA4NTBjOGI0N2IzZTM4OTIyMjZiOTNm
ZmNiOWNiNTQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiOTg1NTU0ZGU0OWMyMWE1OGFiZDY4YzZj
ZGEyMjUxMzg0ZTFlNWJiMDhiM2IxNGM3ZjAyYjUxZjRjOTBjMjk1OCIKIAogRVhUUkFfT0VNRVNP
TiArPSAiXAogICAgIC1EZGlzdGNvbmZkaXI9JHtub25hcmNoX2Jhc2VfbGliZGlyfSBcCi0tIAoy
LjQ3LjEKCg==

--===============3651353072052000201==--
