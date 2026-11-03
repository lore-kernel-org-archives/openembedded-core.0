Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5338.1793687205366038542
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2026 22:26:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=lyCIJ2fm;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=VLCQQgwd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101a1a016b296-f468c6c1-70ea-433d-bb4c-fc87b0faee9e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793687204;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=cin7pZp65wpuiVZElY+AoLPnLki1gvjW07SDWwtEDFI=;
	b=lyCIJ2fm7yJbK4kWBlJ/DEOq3Q54DIcATDyXR5tnEr4zKG87lYbMTB3QM40ATErP
	Iy+/eA/haIsF4x8DWviILoGz3aamojmQu4MG7W0BY6TThsohk/iAap2RSzeKZnCdcJ9
	7OzjifR+XTMBR3F2LNVLSR2AmlWQiapkfjtlw0vg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793687204;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=cin7pZp65wpuiVZElY+AoLPnLki1gvjW07SDWwtEDFI=;
	b=VLCQQgwdCXPsj92bTTFN3JUWoGVN3mkQUeDH8J+rKi7WqODoo0tyCOmiRvbsn04a
	gc/s30KleDrrjNdCC1tVJQCoDKAi41bl4MLPg+5T/YJP4ouefLcJ5qZXcgAef3pSIUg
	ZbA1oDwskqzDdLGdYx8mveu9GufjaJAaXiAqZEZw=
Content-Type: multipart/mixed; boundary="===============0585928642177814693=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] mesa-demos: upgrading to
 649baedafcb90313ade69909fdef1ee156ab5f8d SUCCEEDED
Message-ID: <010101a1a016b296-f468c6c1-70ea-433d-bb4c-fc87b0faee9e-000000@us-west-2.amazonses.com>
Date: Tue, 3 Nov 2026 06:26:44 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.03-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 06:26:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249241

--===============0585928642177814693==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *mesa-demos* to *649baedafcb90313ade69909fdef1ee156ab5f8d* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mesa-demos-upgrade-to-latest-revision.patch
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
From 6a35f45309eaba048d7b4dfcfa593abb2aa1aa9d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 3 Nov 2026 06:06:00 +0000
Subject: [PATCH] mesa-demos: upgrade to latest revision

meson: list GLU before GL in demo dependencies
---
 meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb b/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
index e945538c48..6c5b83f4a1 100644
--- a/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
+++ b/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://src/xdemos/glxgears.c;beginline=1;endline=5;md5=2c456
 
 SRC_URI = "git://gitlab.freedesktop.org/mesa/demos.git;protocol=https;branch=main"
 
-SRCREV = "71b184c379625c91195f5d69186d4de5a1f642ac"
+SRCREV = "649baedafcb90313ade69909fdef1ee156ab5f8d"
 
 # This recipe doesn't plan to make more releases, so track upstream git commits
 PV .= "+git"
-- 
2.47.1


--===============0585928642177814693==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos-dbg: PKGV changed from 9.0.0+git0+71b184c379 to 9.0.0+git0+649baedafc
packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos-dev: PKGV changed from 9.0.0+git0+71b184c379 to 9.0.0+git0+649baedafc
packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos-doc: PKGV changed from 9.0.0+git0+71b184c379 to 9.0.0+git0+649baedafc
packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos-info: PKGV changed from 9.0.0+git0+71b184c379 to 9.0.0+git0+649baedafc
packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos-locale: PKGV changed from 9.0.0+git0+71b184c379 to 9.0.0+git0+649baedafc
packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos-src: PKGV changed from 9.0.0+git0+71b184c379 to 9.0.0+git0+649baedafc
packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos-staticdev: PKGV changed from 9.0.0+git0+71b184c379 to 9.0.0+git0+649baedafc
packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos: PKGV changed from 9.0.0+git0+71b184c379 to 9.0.0+git0+649baedafc

--===============0585928642177814693==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="mesa-demos-changelog.txt"

meson: list GLU before GL in demo dependencies

--===============0585928642177814693==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos-dbg: PKGV changed from 9.0.0+git0+71b184c379 to 9.0.0+git0+649baedafc
packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos-dev: PKGV changed from 9.0.0+git0+71b184c379 to 9.0.0+git0+649baedafc
packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos-doc: PKGV changed from 9.0.0+git0+71b184c379 to 9.0.0+git0+649baedafc
packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos-info: PKGV changed from 9.0.0+git0+71b184c379 to 9.0.0+git0+649baedafc
packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos-locale: PKGV changed from 9.0.0+git0+71b184c379 to 9.0.0+git0+649baedafc
packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos-src: PKGV changed from 9.0.0+git0+71b184c379 to 9.0.0+git0+649baedafc
packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos-staticdev: PKGV changed from 9.0.0+git0+71b184c379 to 9.0.0+git0+649baedafc
packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos: PKGV changed from 9.0.0+git0+71b184c379 to 9.0.0+git0+649baedafc

--===============0585928642177814693==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mesa-demos-upgrade-to-latest-revision.patch"

RnJvbSA2YTM1ZjQ1MzA5ZWFiYTA0OGQ3YjRkZmNmYTU5M2FiYjJhYTFhYTlkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMyBOb3YgMjAyNiAwNjowNjowMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1l
c2EtZGVtb3M6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgptZXNvbjogbGlzdCBHTFUgYmVm
b3JlIEdMIGluIGRlbW8gZGVwZW5kZW5jaWVzCi0tLQogbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21l
c2EvbWVzYS1kZW1vc185LjAuMC5iYiB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9t
ZXNhL21lc2EtZGVtb3NfOS4wLjAuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9tZXNh
LWRlbW9zXzkuMC4wLmJiCmluZGV4IGU5NDU1MzhjNDguLjZjNWI4M2Y0YTEgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL21lc2EtZGVtb3NfOS4wLjAuYmIKKysrIGIvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvbWVzYS1kZW1vc185LjAuMC5iYgpAQCAtMTEsNyArMTEs
NyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9zcmMveGRlbW9zL2dseGdlYXJzLmM7YmVn
aW5saW5lPTE7ZW5kbGluZT01O21kNT0yYzQ1NgogCiBTUkNfVVJJID0gImdpdDovL2dpdGxhYi5m
cmVlZGVza3RvcC5vcmcvbWVzYS9kZW1vcy5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1haW4i
CiAKLVNSQ1JFViA9ICI3MWIxODRjMzc5NjI1YzkxMTk1ZjVkNjkxODZkNGRlNWExZjY0MmFjIgor
U1JDUkVWID0gIjY0OWJhZWRhZmNiOTAzMTNhZGU2OTkwOWZkZWYxZWUxNTZhYjVmOGQiCiAKICMg
VGhpcyByZWNpcGUgZG9lc24ndCBwbGFuIHRvIG1ha2UgbW9yZSByZWxlYXNlcywgc28gdHJhY2sg
dXBzdHJlYW0gZ2l0IGNvbW1pdHMKIFBWIC49ICIrZ2l0IgotLSAKMi40Ny4xCgo=

--===============0585928642177814693==--
