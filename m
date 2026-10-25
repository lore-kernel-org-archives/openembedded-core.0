Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18338.1792905493604346428
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Oct 2026 22:18:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=nl7qVzKT;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ohX9a24+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a1717eb854-617bc7bc-c0ca-4186-88fa-b09ce0111e2c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792905492;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=u+8xrssMupyaQx/XQFNFPnC/4BSzJBicqRO8oOUBYYU=;
	b=nl7qVzKTdObe/pfVvvrJgKYx9hrQe07/rlmWBAHK6GDkpSq1PuRy5RuMKGoqJ9ja
	JtgnBWc5D7ytioiJlnrgtGy7mzhvo0t0hX6Ma/khBhk0+j4HNe7XVVTrKXFQ8S+d2lK
	O5/r9OFUvTcGLbqsIr/eUBXwg0JQifmbdqJVwsU8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792905492;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=u+8xrssMupyaQx/XQFNFPnC/4BSzJBicqRO8oOUBYYU=;
	b=ohX9a24+MgMCfzFfdVmEfWqSdBPNSaUtPtQlLU5ZxU0W7DFinU0Nqwpo0jApbUW9
	aLWmhaVXw0UZY+CQa7sL8UxdiDGTfC215XcG+t79cEP6P6CD3uMiGUKke7JeXh7/D18
	bwEVYA6rqrYL0Tt5Jg20TuyODvZmADxdj85huarU=
Content-Type: multipart/mixed; boundary="===============7296830052464589372=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-wcwidth: upgrading to 0.9.4 SUCCEEDED
Message-ID: <010101a1717eb854-617bc7bc-c0ca-4186-88fa-b09ce0111e2c-000000@us-west-2.amazonses.com>
Date: Sun, 25 Oct 2026 05:18:12 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.25-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 25 Oct 2026 05:18:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248601

--===============7296830052464589372==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-wcwidth* to *0.9.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-wcwidth-upgrade-0.9.1-0.9.4.patch
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
From cab1ab46b9c4c93fdf6c9a3b590c5d6c908cabea Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 25 Oct 2026 05:18:06 +0000
Subject: [PATCH] python3-wcwidth: upgrade 0.9.1 -> 0.9.4

0.9.4 *2026-10-24*
0.9.3 *2026-10-20*
0.9.2 *2026-10-04*
---
 .../{python3-wcwidth_0.9.1.bb => python3-wcwidth_0.9.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-wcwidth_0.9.1.bb => python3-wcwidth_0.9.4.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-wcwidth_0.9.1.bb b/meta/recipes-devtools/python/python3-wcwidth_0.9.4.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-wcwidth_0.9.1.bb
rename to meta/recipes-devtools/python/python3-wcwidth_0.9.4.bb
index e7156a79ee..6deefa0467 100644
--- a/meta/recipes-devtools/python/python3-wcwidth_0.9.1.bb
+++ b/meta/recipes-devtools/python/python3-wcwidth_0.9.4.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/jquast/wcwidth"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b15979c39a2543892fca8cd86b4b52cb"
 
-SRC_URI[sha256sum] = "5823209b0d43af322ce698c689380d7c15ca31fa8e6e3be8459f27031bef0af5"
+SRC_URI[sha256sum] = "fd8d57d3cdfe570e3265c8fab1885c24e34ef40889c0759c0c304a19e9835954"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-- 
2.47.1


--===============7296830052464589372==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-wcwidth: PV changed from "0.9.1" to "0.9.4"
packages/x86-64-v3-poky-linux/python3-wcwidth: PKGV changed from 0.9.1 [default] to 0.9.4 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth: SRC_URI changed from "https://files.pythonhosted.org/packages/source/w/wcwidth/wcwidth-0.9.1.tar.gz" to "https://files.pythonhosted.org/packages/source/w/wcwidth/wcwidth-0.9.4.tar.gz"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-dbg: PV changed from "0.9.1" to "0.9.4"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-dbg: PKGSIZE changed from 1604928 to 1656616 (+3%)
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-dbg: PKGV changed from 0.9.1 [default] to 0.9.4 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-dev: PV changed from "0.9.1" to "0.9.4"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-dev: PKGV changed from 0.9.1 [default] to 0.9.4 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-doc: PV changed from "0.9.1" to "0.9.4"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-doc: PKGV changed from 0.9.1 [default] to 0.9.4 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-locale: PV changed from "0.9.1" to "0.9.4"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-locale: PKGV changed from 0.9.1 [default] to 0.9.4 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-ptest: PV changed from "0.9.1" to "0.9.4"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-ptest: PKGSIZE changed from 3834969 to 4025045 (+5%)
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-ptest: FILELIST: added "/usr/lib/python3-wcwidth/ptest/libwcwidth/src/tables/bitset_tables.c /usr/lib/python3-wcwidth/ptest/libwcwidth/include/wcwidth/bitset_tables.h"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-ptest: PKGV changed from 0.9.1 [default] to 0.9.4 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-src: PV changed from "0.9.1" to "0.9.4"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-src: PKGSIZE changed from 3534102 to 3723431 (+5%)
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-src: FILELIST: directory renamed /usr/src/debug/python3-wcwidth/0.9.1/wcwidth -> /usr/src/debug/python3-wcwidth/0.9.4/wcwidth, directory renamed /usr/src/debug/python3-wcwidth/0.9.1/libwcwidth/src -> /usr/src/debug/python3-wcwidth/0.9.4/libwcwidth/src, removed "/usr/src/debug/python3-wcwidth/0.9.1/libwcwidth/src/tables/table_wide.c /usr/src/debug/python3-wcwidth/0.9.1/libwcwidth/include/wcwidth/width.h /usr/src/debug/python3-wcwidth/0.9.1/libwcwidth/include/wcwidth/grapheme.h /usr/src/debug/python3-wcwidth/0.9.1/libwcwidth/include/wcwidth/unicode.h /usr/src/debug/python3-wcwidth/0.9.1/libwcwidth/include/wcwidth/wcwidth.h /usr/src/debug/python3-wcwidth/0.9.1/libwcwidth/include/wcwidth/escape.h /usr/src/debug/python3-wcwidth/0.9.1/libwcwidth/include/wcwidth/sgr.h /usr/src/debug/python3-wcwidth/0.9.1/libwcwidth/src/tables/table_ambiguous.c /usr/src/debug/python3-wcwidth/0.9.1/libwcwidth/include/wcwidth/text_sizing.h /usr/src/
 debug/python3-wcwidth/0.9.1/libwcwidth/include/wcwidth/clip.h /usr/src/debug/python3-wcwidth/0.9.1/libwcwidth/include/wcwidth/textwrap.h /usr/src/debug/python3-wcwidth/0.9.1/libwcwidth/include/wcwidth/terminal_override.h /usr/src/debug/python3-wcwidth/0.9.1/libwcwidth/src/tables/table_gcb_class.c /usr/src/debug/python3-wcwidth/0.9.1/libwcwidth/src/tables/table_term_programs.c /usr/src/debug/python3-wcwidth/0.9.1/libwcwidth/include/wcwidth/align.h /usr/src/debug/python3-wcwidth/0.9.1/libwcwidth/include/wcwidth/tables.h /usr/src/debug/python3-wcwidth/0.9.1/libwcwidth/src/tables/table_vs15.c /usr/src/debug/python3-wcwidth/0.9.1/libwcwidth/src/tables/table_zero.c /usr/src/debug/python3-wcwidth/0.9.1/libwcwidth/src/tables/table_vs16.c /usr/src/debug/python3-wcwidth/0.9.1/libwcwidth/include/wcwidth/utf8.h /usr/src/debug/python3-wcwidth/0.9.1/libwcwidth/include/wcwidth/table_types.h /usr/src/debug/python3-wcwidth/0.9.1/libwcwidth/src/tables/table_mc.c /usr/src/debug/python3-wcwidth/0.9.1/l
 ibwcwidth/src/tables/table_terminal_overrides.c /usr/src/debug/python3-wcwidth/0.9.1/libwcwidth/src/tables/table_grapheme.c", added "/usr/src/debug/python3-wcwidth/0.9.4/libwcwidth/src/tables/table_wide.c /usr/src/debug/python3-wcwidth/0.9.4/libwcwidth/include/wcwidth/width.h /usr/src/debug/python3-wcwidth/0.9.4/libwcwidth/include/wcwidth/grapheme.h /usr/src/debug/python3-wcwidth/0.9.4/libwcwidth/include/wcwidth/unicode.h /usr/src/debug/python3-wcwidth/0.9.4/libwcwidth/include/wcwidth/wcwidth.h /usr/src/debug/python3-wcwidth/0.9.4/libwcwidth/include/wcwidth/escape.h /usr/src/debug/python3-wcwidth/0.9.4/libwcwidth/include/wcwidth/sgr.h /usr/src/debug/python3-wcwidth/0.9.4/libwcwidth/src/tables/table_ambiguous.c /usr/src/debug/python3-wcwidth/0.9.4/libwcwidth/include/wcwidth/text_sizing.h /usr/src/debug/python3-wcwidth/0.9.4/libwcwidth/include/wcwidth/clip.h /usr/src/debug/python3-wcwidth/0.9.4/libwcwidth/include/wcwidth/textwrap.h /usr/src/debug/python3-wcwidth/0.9.4/libwcwidth/inclu
 de/wcwidth/terminal_override.h /usr/src/debug/python3-wcwidth/0.9.4/libwcwidth/src/tables/bitset_tables.c /usr/src/debug/python3-wcwidth/0.9.4/libwcwidth/src/tables/table_gcb_class.c /usr/src/debug/python3-wcwidth/0.9.4/libwcwidth/src/tables/table_term_programs.c /usr/src/debug/python3-wcwidth/0.9.4/libwcwidth/include/wcwidth/align.h /usr/src/debug/python3-wcwidth/0.9.4/libwcwidth/include/wcwidth/tables.h /usr/src/debug/python3-wcwidth/0.9.4/libwcwidth/src/tables/table_vs15.c /usr/src/debug/python3-wcwidth/0.9.4/libwcwidth/src/tables/table_zero.c /usr/src/debug/python3-wcwidth/0.9.4/libwcwidth/src/tables/table_vs16.c /usr/src/debug/python3-wcwidth/0.9.4/libwcwidth/include/wcwidth/utf8.h /usr/src/debug/python3-wcwidth/0.9.4/libwcwidth/include/wcwidth/table_types.h /usr/src/debug/python3-wcwidth/0.9.4/libwcwidth/src/tables/table_mc.c /usr/src/debug/python3-wcwidth/0.9.4/libwcwidth/src/tables/table_terminal_overrides.c /usr/src/debug/python3-wcwidth/0.9.4/libwcwidth/include/wcwidth/bit
 set_tables.h /usr/src/debug/python3-wcwidth/0.9.4/libwcwidth/src/tables/table_grapheme.c"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-src: PKGV changed from 0.9.1 [default] to 0.9.4 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-staticdev: PV changed from "0.9.1" to "0.9.4"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-staticdev: PKGV changed from 0.9.1 [default] to 0.9.4 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: PV changed from "0.9.1" to "0.9.4"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: PKGSIZE changed from 5343493 to 5389874 (+1%)
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: FILELIST: directory renamed /usr/lib/python3.14/site-packages/wcwidth-0.9.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/wcwidth-0.9.4.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/wcwidth-0.9.1.dist-info -> /usr/lib/python3.14/site-packages/wcwidth-0.9.4.dist-info
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: PKGV changed from 0.9.1 [default] to 0.9.4 [default]
Changes to packages/x86-64-v3-poky-linux/python3-wcwidth (sysroot):
  /usr/lib/python3.14/site-packages/wcwidth-0.9.1.dist-info moved to /usr/lib/python3.14/site-packages/wcwidth-0.9.4.dist-info

--===============7296830052464589372==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-ptest: FILELIST: added "/usr/lib/python3-wcwidth/ptest/libwcwidth/include/wcwidth/bitset_tables.h /usr/lib/python3-wcwidth/ptest/libwcwidth/src/tables/bitset_tables.c"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: FILELIST: directory renamed /usr/lib/python3.14/site-packages/wcwidth-0.9.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/wcwidth-0.9.4.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/wcwidth-0.9.1.dist-info -> /usr/lib/python3.14/site-packages/wcwidth-0.9.4.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-wcwidth (sysroot):
  /usr/lib/python3.14/site-packages/wcwidth-0.9.1.dist-info moved to /usr/lib/python3.14/site-packages/wcwidth-0.9.4.dist-info

--===============7296830052464589372==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-wcwidth-changelog.txt"

0.9.4 *2026-10-24*
0.9.3 *2026-10-20*
0.9.2 *2026-10-04*

--===============7296830052464589372==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-wcwidth-upgrade-0.9.1-0.9.4.patch"

RnJvbSBjYWIxYWI0NmI5YzRjOTNmZGY2YzlhM2I1OTBjNWQ2YzkwOGNhYmVhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMjUgT2N0IDIwMjYgMDU6MTg6MDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXdjd2lkdGg6IHVwZ3JhZGUgMC45LjEgLT4gMC45LjQKCjAuOS40ICoyMDI2LTEwLTI0
KgowLjkuMyAqMjAyNi0xMC0yMCoKMC45LjIgKjIwMjYtMTAtMDQqCi0tLQogLi4uL3tweXRob24z
LXdjd2lkdGhfMC45LjEuYmIgPT4gcHl0aG9uMy13Y3dpZHRoXzAuOS40LmJifSAgICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy13Y3dpZHRoXzAuOS4xLmJiID0+
IHB5dGhvbjMtd2N3aWR0aF8wLjkuNC5iYn0gKDg4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2N3aWR0aF8wLjkuMS5iYiBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13Y3dpZHRoXzAuOS40LmJiCnNpbWlsYXJpdHkgaW5k
ZXggODglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13
Y3dpZHRoXzAuOS4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtd2N3aWR0aF8wLjkuNC5iYgppbmRleCBlNzE1NmE3OWVlLi42ZGVlZmEwNDY3IDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2N3aWR0aF8wLjku
MS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2N3aWR0aF8w
LjkuNC5iYgpAQCAtNCw3ICs0LDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL2px
dWFzdC93Y3dpZHRoIgogTElDRU5TRSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly9MSUNFTlNFO21kNT1iMTU5NzljMzlhMjU0Mzg5MmZjYThjZDg2YjRiNTJjYiIKIAotU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjU4MjMyMDliMGQ0M2FmMzIyY2U2OThjNjg5MzgwZDdjMTVjYTMxZmE4
ZTZlM2JlODQ1OWYyNzAzMWJlZjBhZjUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZmQ4ZDU3ZDNj
ZGZlNTcwZTMyNjVjOGZhYjE4ODVjMjRlMzRlZjQwODg5YzA3NTljMGMzMDRhMTllOTgzNTk1NCIK
IAogaW5oZXJpdCBweXBpIHB5dGhvbl9oYXRjaGxpbmcgcHRlc3QtcHl0aG9uLXB5dGVzdAogCi0t
IAoyLjQ3LjEKCg==

--===============7296830052464589372==--
