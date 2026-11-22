Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29470.1795324411020056123
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Nov 2026 21:13:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=J8Qx/leZ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=z1xVkbrX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101a201ac78bf-52a6f46a-7ca3-4e66-971f-39b15610aa50-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1795324410;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=gH+WFm2SucXJ64EUxrr29erVOyyXloifeRoKYuiZX30=;
	b=J8Qx/leZ+T3007oeHGn1lbfchd6abIg1MFq1q30adPXR/ev58Gx+b9DGXA/8uK6R
	/YBVYMkk0wbA+zLhbCO9QsCdfHnXsVBqJRCUowwHzx1aDYFZfF69gh0XP4qkX304nmI
	SHVO5xAYC/nPNrkYZtxBK7PqkJIdGGVGaqI3fZS0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1795324410;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=gH+WFm2SucXJ64EUxrr29erVOyyXloifeRoKYuiZX30=;
	b=z1xVkbrXRmRt8k5JO9qAVnBzQwfbAkoadlef2cZzVViHc3YqjD7fg34Ske23Rurx
	3468xUB8hZgqmEUOX/eZsHDU67oqcNZTxd6CkleG2bMysQVUHAIuQiP5pDOWqjERc1y
	35hZXrkbT1/meV0xoWZF5qMb/N3Dw5PfjKBLDVic=
Content-Type: multipart/mixed; boundary="===============0466483637788655224=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-wcwidth: upgrading to 0.9.5 SUCCEEDED
Message-ID: <010101a201ac78bf-52a6f46a-7ca3-4e66-971f-39b15610aa50-000000@us-west-2.amazonses.com>
Date: Sun, 22 Nov 2026 05:13:30 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.22-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 22 Nov 2026 05:13:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250863

--===============0466483637788655224==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-wcwidth* to *0.9.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-wcwidth-upgrade-0.9.4-0.9.5.patch
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
From 6046167421485c87a1315b95ead65e190e546acf Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 22 Nov 2026 05:09:12 +0000
Subject: [PATCH] python3-wcwidth: upgrade 0.9.4 -> 0.9.5

0.9.5 *unreleased*
---
 .../{python3-wcwidth_0.9.4.bb => python3-wcwidth_0.9.5.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-wcwidth_0.9.4.bb => python3-wcwidth_0.9.5.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-wcwidth_0.9.4.bb b/meta/recipes-devtools/python/python3-wcwidth_0.9.5.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-wcwidth_0.9.4.bb
rename to meta/recipes-devtools/python/python3-wcwidth_0.9.5.bb
index 6deefa0467..78a20373df 100644
--- a/meta/recipes-devtools/python/python3-wcwidth_0.9.4.bb
+++ b/meta/recipes-devtools/python/python3-wcwidth_0.9.5.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/jquast/wcwidth"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b15979c39a2543892fca8cd86b4b52cb"
 
-SRC_URI[sha256sum] = "fd8d57d3cdfe570e3265c8fab1885c24e34ef40889c0759c0c304a19e9835954"
+SRC_URI[sha256sum] = "713534e2ecb16e0fc39f19e0a5dda997da76d010953e9e8f803e7971f8accd80"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-- 
2.47.1


--===============0466483637788655224==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-wcwidth: PKGV changed from 0.9.4 [default] to 0.9.5 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth: SRC_URI changed from "https://files.pythonhosted.org/packages/source/w/wcwidth/wcwidth-0.9.4.tar.gz" to "https://files.pythonhosted.org/packages/source/w/wcwidth/wcwidth-0.9.5.tar.gz"
packages/x86-64-v3-poky-linux/python3-wcwidth: PV changed from "0.9.4" to "0.9.5"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-dbg: PKGV changed from 0.9.4 [default] to 0.9.5 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-dbg: PKGSIZE changed from 1656792 to 1661200 (+0%)
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-dbg: PV changed from "0.9.4" to "0.9.5"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-dev: PKGV changed from 0.9.4 [default] to 0.9.5 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-dev: PV changed from "0.9.4" to "0.9.5"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-doc: PKGV changed from 0.9.4 [default] to 0.9.5 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-doc: PV changed from "0.9.4" to "0.9.5"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-locale: PKGV changed from 0.9.4 [default] to 0.9.5 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-locale: PV changed from "0.9.4" to "0.9.5"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-ptest: FILELIST: added "/usr/lib/python3-wcwidth/ptest/libwcwidth/src/wcwidth_assert.h /usr/lib/python3-wcwidth/ptest/libwcwidth/src/wcwidth_assert.c /usr/lib/python3-wcwidth/ptest/libwcwidth/src/linebreak.c /usr/lib/python3-wcwidth/ptest/libwcwidth/tests/test_terminal_override.c /usr/lib/python3-wcwidth/ptest/libwcwidth/include/wcwidth/linebreak.h /usr/lib/python3-wcwidth/ptest/libwcwidth/src/tables/table_linebreak.c /usr/lib/python3-wcwidth/ptest/libwcwidth/tests/test_linebreak.c /usr/lib/python3-wcwidth/ptest/tests/test_linebreak.py /usr/lib/python3-wcwidth/ptest/libwcwidth/tests/test_oom.c"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-ptest: PKGV changed from 0.9.4 [default] to 0.9.5 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-ptest: PKGSIZE changed from 4025045 to 4306227 (+7%)
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-ptest: PV changed from "0.9.4" to "0.9.5"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-src: FILELIST: directory renamed /usr/src/debug/python3-wcwidth/0.9.4/wcwidth -> /usr/src/debug/python3-wcwidth/0.9.5/wcwidth, removed "/usr/src/debug/python3-wcwidth/0.9.4/libwcwidth/src/tables/bitset_tables.c /usr/src/debug/python3-wcwidth/0.9.4/libwcwidth/src/tables/table_mc.c /usr/src/debug/python3-wcwidth/0.9.4/libwcwidth/include/wcwidth/bitset_tables.h /usr/src/debug/python3-wcwidth/0.9.4/libwcwidth/src/sgr.c /usr/src/debug/python3-wcwidth/0.9.4/libwcwidth/src/tables/table_vs16.c /usr/src/debug/python3-wcwidth/0.9.4/libwcwidth/src/text_sizing.c /usr/src/debug/python3-wcwidth/0.9.4/libwcwidth/src/align.c /usr/src/debug/python3-wcwidth/0.9.4/libwcwidth/include/wcwidth/sgr.h /usr/src/debug/python3-wcwidth/0.9.4/libwcwidth/include/wcwidth/wcwidth.h /usr/src/debug/python3-wcwidth/0.9.4/libwcwidth/include/wcwidth/align.h /usr/src/debug/python3-wcwidth/0.9.4/libwcwidth/src/width.c /usr/src/debug/python3-wcwidth/0.9.4/libwcw
 idth/include/wcwidth/table_types.h /usr/src/debug/python3-wcwidth/0.9.4/libwcwidth/include/wcwidth/unicode.h /usr/src/debug/python3-wcwidth/0.9.4/libwcwidth/src/tables/table_zero.c /usr/src/debug/python3-wcwidth/0.9.4/libwcwidth/include/wcwidth/grapheme.h /usr/src/debug/python3-wcwidth/0.9.4/libwcwidth/src/tables/table_vs15.c /usr/src/debug/python3-wcwidth/0.9.4/libwcwidth/include/wcwidth/terminal_override.h /usr/src/debug/python3-wcwidth/0.9.4/libwcwidth/src/grapheme.c /usr/src/debug/python3-wcwidth/0.9.4/libwcwidth/src/wcswidth.c /usr/src/debug/python3-wcwidth/0.9.4/libwcwidth/include/wcwidth/textwrap.h /usr/src/debug/python3-wcwidth/0.9.4/libwcwidth/src/tables/table_gcb_class.c /usr/src/debug/python3-wcwidth/0.9.4/libwcwidth/src/escape.c /usr/src/debug/python3-wcwidth/0.9.4/libwcwidth/include/wcwidth/utf8.h /usr/src/debug/python3-wcwidth/0.9.4/libwcwidth/src/bisearch.c /usr/src/debug/python3-wcwidth/0.9.4/libwcwidth/src/tables/table_ambiguous.c /usr/src/debug/python3-wcwidth/0.9.
 4/libwcwidth/include/wcwidth/tables.h /usr/src/debug/python3-wcwidth/0.9.4/libwcwidth/include/wcwidth/width.h /usr/src/debug/python3-wcwidth/0.9.4/libwcwidth/src/tables/table_grapheme.c /usr/src/debug/python3-wcwidth/0.9.4/libwcwidth/src/clip.c /usr/src/debug/python3-wcwidth/0.9.4/libwcwidth/src/tables/table_terminal_overrides.c /usr/src/debug/python3-wcwidth/0.9.4/libwcwidth/src/utf8.c /usr/src/debug/python3-wcwidth/0.9.4/libwcwidth/src/wcstwidth.c /usr/src/debug/python3-wcwidth/0.9.4/libwcwidth/src/terminal_override.c /usr/src/debug/python3-wcwidth/0.9.4/libwcwidth/include/wcwidth/escape.h /usr/src/debug/python3-wcwidth/0.9.4/libwcwidth/src/textwrap.c /usr/src/debug/python3-wcwidth/0.9.4/libwcwidth/src/tables/table_wide.c /usr/src/debug/python3-wcwidth/0.9.4/libwcwidth/include/wcwidth/text_sizing.h /usr/src/debug/python3-wcwidth/0.9.4/libwcwidth/src/wcwidth.c /usr/src/debug/python3-wcwidth/0.9.4/libwcwidth/src/tables/table_term_programs.c /usr/src/debug/python3-wcwidth/0.9.4/libwc
 width/include/wcwidth/clip.h", added "/usr/src/debug/python3-wcwidth/0.9.5/libwcwidth/src/tables/bitset_tables.c /usr/src/debug/python3-wcwidth/0.9.5/libwcwidth/src/tables/table_mc.c /usr/src/debug/python3-wcwidth/0.9.5/libwcwidth/include/wcwidth/bitset_tables.h /usr/src/debug/python3-wcwidth/0.9.5/libwcwidth/src/sgr.c /usr/src/debug/python3-wcwidth/0.9.5/libwcwidth/src/tables/table_vs16.c /usr/src/debug/python3-wcwidth/0.9.5/libwcwidth/src/text_sizing.c /usr/src/debug/python3-wcwidth/0.9.5/libwcwidth/include/wcwidth/linebreak.h /usr/src/debug/python3-wcwidth/0.9.5/libwcwidth/src/align.c /usr/src/debug/python3-wcwidth/0.9.5/libwcwidth/src/linebreak.c /usr/src/debug/python3-wcwidth/0.9.5/libwcwidth/include/wcwidth/sgr.h /usr/src/debug/python3-wcwidth/0.9.5/libwcwidth/include/wcwidth/wcwidth.h /usr/src/debug/python3-wcwidth/0.9.5/libwcwidth/include/wcwidth/align.h /usr/src/debug/python3-wcwidth/0.9.5/libwcwidth/src/width.c /usr/src/debug/python3-wcwidth/0.9.5/libwcwidth/include/wcwidt
 h/table_types.h /usr/src/debug/python3-wcwidth/0.9.5/libwcwidth/include/wcwidth/unicode.h /usr/src/debug/python3-wcwidth/0.9.5/libwcwidth/src/tables/table_zero.c /usr/src/debug/python3-wcwidth/0.9.5/libwcwidth/include/wcwidth/grapheme.h /usr/src/debug/python3-wcwidth/0.9.5/libwcwidth/src/tables/table_vs15.c /usr/src/debug/python3-wcwidth/0.9.5/libwcwidth/include/wcwidth/terminal_override.h /usr/src/debug/python3-wcwidth/0.9.5/libwcwidth/src/grapheme.c /usr/src/debug/python3-wcwidth/0.9.5/libwcwidth/src/wcswidth.c /usr/src/debug/python3-wcwidth/0.9.5/libwcwidth/include/wcwidth/textwrap.h /usr/src/debug/python3-wcwidth/0.9.5/libwcwidth/src/tables/table_gcb_class.c /usr/src/debug/python3-wcwidth/0.9.5/libwcwidth/src/escape.c /usr/src/debug/python3-wcwidth/0.9.5/libwcwidth/include/wcwidth/utf8.h /usr/src/debug/python3-wcwidth/0.9.5/libwcwidth/src/bisearch.c /usr/src/debug/python3-wcwidth/0.9.5/libwcwidth/src/tables/table_ambiguous.c /usr/src/debug/python3-wcwidth/0.9.5/libwcwidth/includ
 e/wcwidth/tables.h /usr/src/debug/python3-wcwidth/0.9.5/libwcwidth/src/tables/table_linebreak.c /usr/src/debug/python3-wcwidth/0.9.5/libwcwidth/include/wcwidth/width.h /usr/src/debug/python3-wcwidth/0.9.5/libwcwidth/src/tables/table_grapheme.c /usr/src/debug/python3-wcwidth/0.9.5/libwcwidth/src/clip.c /usr/src/debug/python3-wcwidth/0.9.5/libwcwidth/src/tables/table_terminal_overrides.c /usr/src/debug/python3-wcwidth/0.9.5/libwcwidth/src/utf8.c /usr/src/debug/python3-wcwidth/0.9.5/libwcwidth/src/wcstwidth.c /usr/src/debug/python3-wcwidth/0.9.5/libwcwidth/src/terminal_override.c /usr/src/debug/python3-wcwidth/0.9.5/libwcwidth/include/wcwidth/escape.h /usr/src/debug/python3-wcwidth/0.9.5/libwcwidth/src/textwrap.c /usr/src/debug/python3-wcwidth/0.9.5/libwcwidth/src/tables/table_wide.c /usr/src/debug/python3-wcwidth/0.9.5/libwcwidth/include/wcwidth/text_sizing.h /usr/src/debug/python3-wcwidth/0.9.5/libwcwidth/src/wcwidth.c /usr/src/debug/python3-wcwidth/0.9.5/libwcwidth/src/tables/table_
 term_programs.c /usr/src/debug/python3-wcwidth/0.9.5/libwcwidth/include/wcwidth/clip.h"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-src: PKGV changed from 0.9.4 [default] to 0.9.5 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-src: PKGSIZE changed from 3723431 to 3911116 (+5%)
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-src: PV changed from "0.9.4" to "0.9.5"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-staticdev: PKGV changed from 0.9.4 [default] to 0.9.5 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-staticdev: PV changed from "0.9.4" to "0.9.5"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: FILELIST: directory renamed /usr/lib/python3.15/site-packages/wcwidth-0.9.4.dist-info -> /usr/lib/python3.15/site-packages/wcwidth-0.9.5.dist-info, directory renamed /usr/lib/python3.15/site-packages/wcwidth-0.9.4.dist-info/licenses -> /usr/lib/python3.15/site-packages/wcwidth-0.9.5.dist-info/licenses, removed "/usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_3a1895d5.py /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_cf02297d.py /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_336a71a1.py /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_a5880eeb.py /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_b6d33cf4.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_fb5fd79b.py /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_8c2ae14
 d.py /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_fb5fd79b.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_e18ac6a7.py /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_2148ff29.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_c57c295b.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_e18ac6a7.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_058c7585.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_336a71a1.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_65c6beb5.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_a5880eeb.cpython-315.pyc /usr/lib/python3.1
 5/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_fdc99132.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_59180a0d.py /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_3a1895d5.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_59180a0d.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_b6d33cf4.py /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_fdc99132.py /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_65c6beb5.py /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_cf02297d.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_97904ece.py /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_c57c295b.py /usr/lib/python3.15/site-packages/wcwidth/table_graphem
 e_overrides/_known_33ac73f2.py /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_33ac73f2.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_8c2ae14d.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_2148ff29.py /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_97904ece.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_058c7585.py", added "/usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_e49e5a83.py /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_0460e7c9.py /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_e6aa9aa1.py /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_df39fd07.py /usr/lib/python3.15/site-packages/wcwidth/__pycache__/linebreak.cpython-315.pyc /usr/lib/python3.15/site-pac
 kages/wcwidth/__pycache__/table_linebreak.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_a6ed02ec.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_2d39712a.py /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_88d642c4.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_dc5c5d4b.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_dfff5112.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_c298be52.py /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_88d642c4.py /usr/lib/python3.15/site-packages/wcwidth/linebreak.py /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_f2715990.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__py
 cache__/_known_f3849ab9.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_307dff55.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_5a296381.py /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_0460e7c9.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/table_linebreak.py /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_9e152b0f.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_d9127156.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_2d39712a.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_963e665b.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_df39fd07.cpython-315.pyc /usr/lib/python3.15/site-packages
 /wcwidth/table_grapheme_overrides/_known_d9127156.py /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_a6ed02ec.py /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_dfff5112.py /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_42203bb5.py /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_dc5c5d4b.py /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_963e665b.py /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_e6aa9aa1.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_5a296381.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_42203bb5.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_307dff55.py /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_9e152b0f.py /usr/lib/
 python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_e49e5a83.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_c298be52.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_f2715990.py /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_f3849ab9.py"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: PKGV changed from 0.9.4 [default] to 0.9.5 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: PKGSIZE changed from 5392392 to 5614678 (+4%)
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: PV changed from "0.9.4" to "0.9.5"
Changes to packages/x86-64-v3-poky-linux/python3-wcwidth (sysroot):
  /usr/lib/python3.15/site-packages/wcwidth-0.9.4.dist-info moved to /usr/lib/python3.15/site-packages/wcwidth-0.9.5.dist-info
  /usr/lib/python3.15/site-packages/wcwidth/linebreak.py was added
  /usr/lib/python3.15/site-packages/wcwidth/__pycache__/linebreak.cpython-315.pyc was added
  /usr/lib/python3.15/site-packages/wcwidth/__pycache__/table_linebreak.cpython-315.pyc was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_0460e7c9.py was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_2d39712a.py was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_307dff55.py was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_42203bb5.py was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_5a296381.py was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_88d642c4.py was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_963e665b.py was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_9e152b0f.py was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_a6ed02ec.py was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_c298be52.py was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_d9127156.py was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_dc5c5d4b.py was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_df39fd07.py was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_dfff5112.py was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_e49e5a83.py was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_e6aa9aa1.py was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_f2715990.py was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_f3849ab9.py was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_0460e7c9.cpython-315.pyc was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_2d39712a.cpython-315.pyc was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_307dff55.cpython-315.pyc was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_42203bb5.cpython-315.pyc was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_5a296381.cpython-315.pyc was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_88d642c4.cpython-315.pyc was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_963e665b.cpython-315.pyc was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_9e152b0f.cpython-315.pyc was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_a6ed02ec.cpython-315.pyc was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_c298be52.cpython-315.pyc was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_d9127156.cpython-315.pyc was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_dc5c5d4b.cpython-315.pyc was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_df39fd07.cpython-315.pyc was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_dfff5112.cpython-315.pyc was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_e49e5a83.cpython-315.pyc was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_e6aa9aa1.cpython-315.pyc was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_f2715990.cpython-315.pyc was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_f3849ab9.cpython-315.pyc was added
  /usr/lib/python3.15/site-packages/wcwidth/table_linebreak.py was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_058c7585.py was removed
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_2148ff29.py was removed
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_336a71a1.py was removed
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_33ac73f2.py was removed
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_3a1895d5.py was removed
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_59180a0d.py was removed
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_65c6beb5.py was removed
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_8c2ae14d.py was removed
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_97904ece.py was removed
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_a5880eeb.py was removed
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_b6d33cf4.py was removed
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_c57c295b.py was removed
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_cf02297d.py was removed
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_e18ac6a7.py was removed
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_fb5fd79b.py was removed
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_fdc99132.py was removed
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_058c7585.cpython-315.pyc was removed
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_2148ff29.cpython-315.pyc was removed
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_336a71a1.cpython-315.pyc was removed
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_33ac73f2.cpython-315.pyc was removed
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_3a1895d5.cpython-315.pyc was removed
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_59180a0d.cpython-315.pyc was removed
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_65c6beb5.cpython-315.pyc was removed
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_8c2ae14d.cpython-315.pyc was removed
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_97904ece.cpython-315.pyc was removed
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_a5880eeb.cpython-315.pyc was removed
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_b6d33cf4.cpython-315.pyc was removed
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_c57c295b.cpython-315.pyc was removed
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_cf02297d.cpython-315.pyc was removed
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_e18ac6a7.cpython-315.pyc was removed
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_fb5fd79b.cpython-315.pyc was removed
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_fdc99132.cpython-315.pyc was removed

--===============0466483637788655224==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-wcwidth-upgrade-0.9.4-0.9.5.patch"

RnJvbSA2MDQ2MTY3NDIxNDg1Yzg3YTEzMTViOTVlYWQ2NWUxOTBlNTQ2YWNmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMjIgTm92IDIwMjYgMDU6MDk6MTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXdjd2lkdGg6IHVwZ3JhZGUgMC45LjQgLT4gMC45LjUKCjAuOS41ICp1bnJlbGVhc2Vk
KgotLS0KIC4uLi97cHl0aG9uMy13Y3dpZHRoXzAuOS40LmJiID0+IHB5dGhvbjMtd2N3aWR0aF8w
LjkuNS5iYn0gICAgICB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMt
d2N3aWR0aF8wLjkuNC5iYiA9PiBweXRob24zLXdjd2lkdGhfMC45LjUuYmJ9ICg4OCUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXdjd2lkdGhfMC45
LjQuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2N3aWR0aF8wLjku
NS5iYgpzaW1pbGFyaXR5IGluZGV4IDg4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtd2N3aWR0aF8wLjkuNC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXdjd2lkdGhfMC45LjUuYmIKaW5kZXggNmRlZWZhMDQ2
Ny4uNzhhMjAzNzNkZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXdjd2lkdGhfMC45LjQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXdjd2lkdGhfMC45LjUuYmIKQEAgLTQsNyArNCw3IEBAIEhPTUVQQUdFID0gImh0
dHBzOi8vZ2l0aHViLmNvbS9qcXVhc3Qvd2N3aWR0aCIKIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJ
TEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9YjE1OTc5YzM5YTI1NDM4OTJmY2E4Y2Q4
NmI0YjUyY2IiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJmZDhkNTdkM2NkZmU1NzBlMzI2NWM4
ZmFiMTg4NWMyNGUzNGVmNDA4ODljMDc1OWMwYzMwNGExOWU5ODM1OTU0IgorU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjcxMzUzNGUyZWNiMTZlMGZjMzlmMTllMGE1ZGRhOTk3ZGE3NmQwMTA5NTNlOWU4
ZjgwM2U3OTcxZjhhY2NkODAiCiAKIGluaGVyaXQgcHlwaSBweXRob25faGF0Y2hsaW5nIHB0ZXN0
LXB5dGhvbi1weXRlc3QKIAotLSAKMi40Ny4xCgo=

--===============0466483637788655224==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-ptest: FILELIST: added "/usr/lib/python3-wcwidth/ptest/tests/test_linebreak.py /usr/lib/python3-wcwidth/ptest/libwcwidth/tests/test_terminal_override.c /usr/lib/python3-wcwidth/ptest/libwcwidth/include/wcwidth/linebreak.h /usr/lib/python3-wcwidth/ptest/libwcwidth/tests/test_linebreak.c /usr/lib/python3-wcwidth/ptest/libwcwidth/src/wcwidth_assert.c /usr/lib/python3-wcwidth/ptest/libwcwidth/src/linebreak.c /usr/lib/python3-wcwidth/ptest/libwcwidth/src/wcwidth_assert.h /usr/lib/python3-wcwidth/ptest/libwcwidth/src/tables/table_linebreak.c /usr/lib/python3-wcwidth/ptest/libwcwidth/tests/test_oom.c"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: FILELIST: directory renamed /usr/lib/python3.15/site-packages/wcwidth-0.9.4.dist-info/licenses -> /usr/lib/python3.15/site-packages/wcwidth-0.9.5.dist-info/licenses, directory renamed /usr/lib/python3.15/site-packages/wcwidth-0.9.4.dist-info -> /usr/lib/python3.15/site-packages/wcwidth-0.9.5.dist-info, removed "/usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_336a71a1.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_b6d33cf4.py /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_59180a0d.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_3a1895d5.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_058c7585.py /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_a5880eeb.py /usr/lib/python3.15/site-packag
 es/wcwidth/table_grapheme_overrides/__pycache__/_known_b6d33cf4.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_33ac73f2.py /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_fb5fd79b.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_336a71a1.py /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_cf02297d.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_fb5fd79b.py /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_97904ece.py /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_97904ece.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_a5880eeb.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_058c7585.cpython-315.pyc /usr/lib/python3.1
 5/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_e18ac6a7.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_c57c295b.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_8c2ae14d.py /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_cf02297d.py /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_2148ff29.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_59180a0d.py /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_2148ff29.py /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_65c6beb5.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_fdc99132.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_33ac73f2.cpython-315.pyc /usr/
 lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_c57c295b.py /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_fdc99132.py /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_8c2ae14d.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_3a1895d5.py /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_e18ac6a7.py /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_65c6beb5.py", added "/usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_0460e7c9.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_df39fd07.py /usr/lib/python3.15/site-packages/wcwidth/table_linebreak.py /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_d9127156.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_kno
 wn_9e152b0f.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_dfff5112.py /usr/lib/python3.15/site-packages/wcwidth/__pycache__/table_linebreak.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/linebreak.py /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_88d642c4.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_f3849ab9.py /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_dc5c5d4b.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_dc5c5d4b.py /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_e6aa9aa1.py /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_c298be52.py /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_f2715990.py /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_e49e
 5a83.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_f3849ab9.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_c298be52.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_a6ed02ec.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_5a296381.py /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_f2715990.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_307dff55.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_2d39712a.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_963e665b.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_df39fd07.cpython-315.pyc /u
 sr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_a6ed02ec.py /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_dfff5112.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_307dff55.py /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_88d642c4.py /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_d9127156.py /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_e6aa9aa1.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_963e665b.py /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_9e152b0f.py /usr/lib/python3.15/site-packages/wcwidth/__pycache__/linebreak.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_2d39712a.py /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_e49e5a83.py /usr/lib/
 python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_42203bb5.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_0460e7c9.py /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_5a296381.cpython-315.pyc /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_42203bb5.py"
Changes to packages/x86-64-v3-poky-linux/python3-wcwidth (sysroot):
  /usr/lib/python3.15/site-packages/wcwidth-0.9.4.dist-info moved to /usr/lib/python3.15/site-packages/wcwidth-0.9.5.dist-info
  /usr/lib/python3.15/site-packages/wcwidth/linebreak.py was added
  /usr/lib/python3.15/site-packages/wcwidth/__pycache__/linebreak.cpython-315.pyc was added
  /usr/lib/python3.15/site-packages/wcwidth/__pycache__/table_linebreak.cpython-315.pyc was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_0460e7c9.py was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_2d39712a.py was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_307dff55.py was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_42203bb5.py was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_5a296381.py was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_88d642c4.py was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_963e665b.py was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_9e152b0f.py was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_a6ed02ec.py was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_c298be52.py was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_d9127156.py was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_dc5c5d4b.py was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_df39fd07.py was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_dfff5112.py was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_e49e5a83.py was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_e6aa9aa1.py was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_f2715990.py was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_f3849ab9.py was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_0460e7c9.cpython-315.pyc was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_2d39712a.cpython-315.pyc was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_307dff55.cpython-315.pyc was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_42203bb5.cpython-315.pyc was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_5a296381.cpython-315.pyc was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_88d642c4.cpython-315.pyc was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_963e665b.cpython-315.pyc was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_9e152b0f.cpython-315.pyc was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_a6ed02ec.cpython-315.pyc was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_c298be52.cpython-315.pyc was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_d9127156.cpython-315.pyc was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_dc5c5d4b.cpython-315.pyc was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_df39fd07.cpython-315.pyc was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_dfff5112.cpython-315.pyc was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_e49e5a83.cpython-315.pyc was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_e6aa9aa1.cpython-315.pyc was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_f2715990.cpython-315.pyc was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_f3849ab9.cpython-315.pyc was added
  /usr/lib/python3.15/site-packages/wcwidth/table_linebreak.py was added
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_058c7585.py was removed
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_2148ff29.py was removed
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_336a71a1.py was removed
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_33ac73f2.py was removed
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_3a1895d5.py was removed
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_59180a0d.py was removed
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_65c6beb5.py was removed
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_8c2ae14d.py was removed
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_97904ece.py was removed
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_a5880eeb.py was removed
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_b6d33cf4.py was removed
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_c57c295b.py was removed
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_cf02297d.py was removed
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_e18ac6a7.py was removed
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_fb5fd79b.py was removed
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/_known_fdc99132.py was removed
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_058c7585.cpython-315.pyc was removed
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_2148ff29.cpython-315.pyc was removed
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_336a71a1.cpython-315.pyc was removed
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_33ac73f2.cpython-315.pyc was removed
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_3a1895d5.cpython-315.pyc was removed
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_59180a0d.cpython-315.pyc was removed
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_65c6beb5.cpython-315.pyc was removed
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_8c2ae14d.cpython-315.pyc was removed
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_97904ece.cpython-315.pyc was removed
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_a5880eeb.cpython-315.pyc was removed
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_b6d33cf4.cpython-315.pyc was removed
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_c57c295b.cpython-315.pyc was removed
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_cf02297d.cpython-315.pyc was removed
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_e18ac6a7.cpython-315.pyc was removed
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_fb5fd79b.cpython-315.pyc was removed
  /usr/lib/python3.15/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_fdc99132.cpython-315.pyc was removed

--===============0466483637788655224==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-wcwidth-changelog.txt"

0.9.5 *unreleased*

--===============0466483637788655224==--
