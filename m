Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1829.1792822999099367564
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 23:23:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=YsmLEaoB;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=oTSmEm5A;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101a16c93f4eb-45cfa4ec-6e28-408a-b9ad-859a9f28fd1b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792822998;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=C9849LNzS8j/Rv2K1tgHIloZ5L68RFOUrv0r4vxWFAg=;
	b=YsmLEaoBapPNN6Qd9oS3O6TAKMFAQKt+lo1846tYakfACzIVUI6v5EYI/YLpgNzk
	uu7lxtMku3633rifCiwQEqvvDneo+YWvleDbXCClTHNBFL5isu0mkgssmbaLM/uR2g8
	xWvvADkz8UyMgNJSNfsMJOs3q0jRjXEH/PZY4TSM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792822998;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=C9849LNzS8j/Rv2K1tgHIloZ5L68RFOUrv0r4vxWFAg=;
	b=oTSmEm5AcH2tZJKYDKkvy0RGICdhKMRl50UWIM3e2Q77f5EsyZ3wa1F2LMLMYdZ6
	LJ5T025t5EnKKdBLVNB6U2AMF2wBgW+uV1y3EXeNe4s/IU1p7bXTcBMGJkct1ytl6sf
	aRl/UO5hWKFFEYZllvuxqE30TqK7I14zszYkgEBg=
Content-Type: multipart/mixed; boundary="===============2492766053098225246=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libsolv: upgrading to 0.7.41 SUCCEEDED
Message-ID: <010101a16c93f4eb-45cfa4ec-6e28-408a-b9ad-859a9f28fd1b-000000@us-west-2.amazonses.com>
Date: Sat, 24 Oct 2026 06:23:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.24-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 24 Oct 2026 06:23:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248576

--===============2492766053098225246==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libsolv* to *0.7.41* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libsolv-upgrade-0.7.40-0.7.41.patch
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
From e3686598bea1574a63d37ab840aadd45c649e32a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 24 Oct 2026 05:34:32 +0000
Subject: [PATCH] libsolv: upgrade 0.7.40 -> 0.7.41

Version 0.7.41
- selected bug fixes:
---
 .../libsolv/{libsolv_0.7.40.bb => libsolv_0.7.41.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libsolv/{libsolv_0.7.40.bb => libsolv_0.7.41.bb} (96%)

diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.40.bb b/meta/recipes-extended/libsolv/libsolv_0.7.41.bb
similarity index 96%
rename from meta/recipes-extended/libsolv/libsolv_0.7.40.bb
rename to meta/recipes-extended/libsolv/libsolv_0.7.41.bb
index 96b889d6cd..bc866725ec 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.40.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.41.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/openSUSE/libsolv.git;branch=master;protocol=https;ta
            file://run-ptest \
 "
 
-SRCREV = "0e6eea45c9ffc7dd0756060f2b0f5527df02efa7"
+SRCREV = "fa356d93545033a9962dfa99c4685e6299932922"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-- 
2.47.1


--===============2492766053098225246==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libsolv: PV changed from "0.7.40" to "0.7.41"
packages/x86-64-v3-poky-linux/libsolv: SRC_URI changed from "git://github.com/openSUSE/libsolv.git;branch=master;protocol=https;tag=0.7.40 file://run-ptest" to "git://github.com/openSUSE/libsolv.git;branch=master;protocol=https;tag=0.7.41 file://run-ptest"
packages/x86-64-v3-poky-linux/libsolv: PKGV changed from 0.7.40 [default] to 0.7.41 [default]
packages/x86-64-v3-poky-linux/libsolv/libsolv-dbg: PV changed from "0.7.40" to "0.7.41"
packages/x86-64-v3-poky-linux/libsolv/libsolv-dbg: PKGV changed from 0.7.40 [default] to 0.7.41 [default]
packages/x86-64-v3-poky-linux/libsolv/libsolv-dbg: PKGSIZE changed from 3173712 to 3183816 (+0%)
packages/x86-64-v3-poky-linux/libsolv/libsolv-dev: PV changed from "0.7.40" to "0.7.41"
packages/x86-64-v3-poky-linux/libsolv/libsolv-dev: PKGV changed from 0.7.40 [default] to 0.7.41 [default]
packages/x86-64-v3-poky-linux/libsolv/libsolv-dev: PKGSIZE changed from 131728 to 132459 (+1%)
packages/x86-64-v3-poky-linux/libsolv/libsolv-doc: PV changed from "0.7.40" to "0.7.41"
packages/x86-64-v3-poky-linux/libsolv/libsolv-doc: PKGV changed from 0.7.40 [default] to 0.7.41 [default]
packages/x86-64-v3-poky-linux/libsolv/libsolv-doc: PKGSIZE changed from 301899 to 304012 (+1%)
packages/x86-64-v3-poky-linux/libsolv/libsolv-locale: PV changed from "0.7.40" to "0.7.41"
packages/x86-64-v3-poky-linux/libsolv/libsolv-locale: PKGV changed from 0.7.40 [default] to 0.7.41 [default]
packages/x86-64-v3-poky-linux/libsolv/libsolv-ptest: PV changed from "0.7.40" to "0.7.41"
packages/x86-64-v3-poky-linux/libsolv/libsolv-ptest: PKGV changed from 0.7.40 [default] to 0.7.41 [default]
packages/x86-64-v3-poky-linux/libsolv/libsolv-src: PV changed from "0.7.40" to "0.7.41"
packages/x86-64-v3-poky-linux/libsolv/libsolv-src: FILELIST: directory renamed /usr/src/debug/libsolv/0.7.40/tools -> /usr/src/debug/libsolv/0.7.41/tools, directory renamed /usr/src/debug/libsolv/0.7.40/src -> /usr/src/debug/libsolv/0.7.41/src, directory renamed /usr/src/debug/libsolv/0.7.40/ext -> /usr/src/debug/libsolv/0.7.41/ext
packages/x86-64-v3-poky-linux/libsolv/libsolv-src: PKGV changed from 0.7.40 [default] to 0.7.41 [default]
packages/x86-64-v3-poky-linux/libsolv/libsolv-src: PKGSIZE changed from 1701111 to 1710477 (+1%)
packages/x86-64-v3-poky-linux/libsolv/libsolv-staticdev: PV changed from "0.7.40" to "0.7.41"
packages/x86-64-v3-poky-linux/libsolv/libsolv-staticdev: PKGV changed from 0.7.40 [default] to 0.7.41 [default]
packages/x86-64-v3-poky-linux/libsolv/libsolv-staticdev: PKGSIZE changed from 4625082 to 4613946 (-0%)
packages/x86-64-v3-poky-linux/libsolv/libsolv-tools: PV changed from "0.7.40" to "0.7.41"
packages/x86-64-v3-poky-linux/libsolv/libsolv-tools: PKGV changed from 0.7.40 [default] to 0.7.41 [default]
packages/x86-64-v3-poky-linux/libsolv/libsolv: PV changed from "0.7.40" to "0.7.41"
packages/x86-64-v3-poky-linux/libsolv/libsolv: PKGV changed from 0.7.40 [default] to 0.7.41 [default]
packages/x86-64-v3-poky-linux/libsolv/libsolvext: PV changed from "0.7.40" to "0.7.41"
packages/x86-64-v3-poky-linux/libsolv/libsolvext: PKGV changed from 0.7.40 [default] to 0.7.41 [default]

--===============2492766053098225246==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libsolv-upgrade-0.7.40-0.7.41.patch"

RnJvbSBlMzY4NjU5OGJlYTE1NzRhNjNkMzdhYjg0MGFhZGQ0NWM2NDllMzJhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMjQgT2N0IDIwMjYgMDU6MzQ6MzIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJzb2x2OiB1cGdyYWRlIDAuNy40MCAtPiAwLjcuNDEKClZlcnNpb24gMC43LjQxCi0gc2VsZWN0
ZWQgYnVnIGZpeGVzOgotLS0KIC4uLi9saWJzb2x2L3tsaWJzb2x2XzAuNy40MC5iYiA9PiBsaWJz
b2x2XzAuNy40MS5iYn0gICAgICAgICAgICB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJz
b2x2L3tsaWJzb2x2XzAuNy40MC5iYiA9PiBsaWJzb2x2XzAuNy40MS5iYn0gKDk2JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlic29sdi9saWJzb2x2XzAuNy40MC5iYiBi
L21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJzb2x2L2xpYnNvbHZfMC43LjQxLmJiCnNpbWlsYXJp
dHkgaW5kZXggOTYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJzb2x2L2xp
YnNvbHZfMC43LjQwLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlic29sdi9s
aWJzb2x2XzAuNy40MS5iYgppbmRleCA5NmI4ODlkNmNkLi5iYzg2NjcyNWVjIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlic29sdi9saWJzb2x2XzAuNy40MC5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlic29sdi9saWJzb2x2XzAuNy40MS5iYgpAQCAtMTIsNyAr
MTIsNyBAQCBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vb3BlblNVU0UvbGlic29sdi5naXQ7
YnJhbmNoPW1hc3Rlcjtwcm90b2NvbD1odHRwczt0YQogICAgICAgICAgICBmaWxlOi8vcnVuLXB0
ZXN0IFwKICIKIAotU1JDUkVWID0gIjBlNmVlYTQ1YzlmZmM3ZGQwNzU2MDYwZjJiMGY1NTI3ZGYw
MmVmYTciCitTUkNSRVYgPSAiZmEzNTZkOTM1NDUwMzNhOTk2MmRmYTk5YzQ2ODVlNjI5OTkzMjky
MiIKIAogVVBTVFJFQU1fQ0hFQ0tfR0lUVEFHUkVHRVggPSAiKD9QPHB2ZXI+XGQrKFwuXGQrKSsp
IgogCi0tIAoyLjQ3LjEKCg==

--===============2492766053098225246==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libsolv-changelog.txt"

Version 0.7.41
- selected bug fixes:

--===============2492766053098225246==--
