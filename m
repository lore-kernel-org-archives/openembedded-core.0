Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCD95C98314
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 05:34:38 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1371.1790228074496294625
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 22:34:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=u3yPxXX6;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=bNNNV5eb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101a0d1e88cb3-17cf115a-f896-451a-a781-ddbd4649d6d2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790228073;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=OyxgSZ1Q4cPFDdHE4U2LYklllHOVRkALjDkUWkrtxak=;
	b=u3yPxXX6q2vZ9aNfYaqQl8KwcYymjVAM75OprGxam62/TGMx9VZ0n3wj7vW8b/ng
	QgUvQpVjMx5VBKYvoXLxFSXOKYO+Nbnly1xrwcIFfY5VLK4NY5dGFWsuRZa6BJ8BKFw
	l7w+Bn8iFT3RrgIxvu5rjXOuYYDI47R/GvmWgB0I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790228073;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=OyxgSZ1Q4cPFDdHE4U2LYklllHOVRkALjDkUWkrtxak=;
	b=bNNNV5ebaCzOEBGUgOfvEaZh5WyPfzyoAPKhLUaVx4WBuA3aq0FapuR1nfD5UCrD
	9BFg2nKMezd6hvLF4PXSRuyqrmA6b5hnXuz+78ONtci5GcaDGLN8C8XR141zs5/xo02
	6sF4j8V+cTWk0sEbwCBE2c2ITnwItYKQdlnr/seA=
Content-Type: multipart/mixed; boundary="===============8966731044939071050=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-wcwidth: upgrading to 0.9.1 SUCCEEDED
Message-ID: <010101a0d1e88cb3-17cf115a-f896-451a-a781-ddbd4649d6d2-000000@us-west-2.amazonses.com>
Date: Thu, 24 Sep 2026 05:34:33 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.24-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Sep 2026 05:34:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246565

--===============8966731044939071050==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-wcwidth* to *0.9.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-wcwidth-upgrade-0.8.3-0.9.1.patch
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
From eaafbff4160537fa5afbf68a66cbd7c891e4265e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 24 Sep 2026 05:24:27 +0000
Subject: [PATCH] python3-wcwidth: upgrade 0.8.3 -> 0.9.1

=======
History
=======

0.9.1 *2026-09-23*
0.9.0 *2026-09-23*
0.8.5 *2026-09-23*
0.8.4 *2026-09-17*
0.8.3 *2026-08-28*
0.8.2 *2026-06-29*
0.8.1 *2026-06-08*
0.8.0 *2026-06-05*
0.7.0 *2026-05-02*
0.6.0 *2026-02-06*
0.5.3 *2026-01-30*
0.5.2 *2026-01-29*
0.5.1 *2026-01-27*
0.5.0 *2026-01-26*
0.4.0 *2026-01-25*
0.3.5 *2026-01-24*
0.3.4 *2026-01-24*
0.3.3 *2026-01-24*
0.3.2 *2026-01-23*
0.3.1 *2026-01-22*
0.3.0 *2026-01-21*
0.2.14 *2025-09-22*
0.2.13 *2024-01-06*
0.2.12 *2023-11-21*
0.2.11 *2023-11-20*
0.2.10 *2023-11-13*
0.2.9 *2023-10-30*
0.2.8 *2023-09-30*
0.2.7 *2023-09-28*
0.2.6 *2023-01-14*
0.2.1 .. 0.2.5 *2020-06-23*
0.2.0 *2020-06-01*
0.1.9 *2020-03-22*
0.1.8 *2020-01-01*
0.1.7 *2016-07-01*
0.1.6 *2016-01-08 Production/Stable*
0.1.5 *2015-09-13 Alpha*
0.1.4 *2014-11-20 Pre-Alpha*
0.1.3 *2014-10-29 Pre-Alpha*
0.1.2 *2014-10-28 Pre-Alpha*
0.1.1 *2014-05-14 Pre-Alpha*

This code was originally derived directly from C code of the same name,
whose latest version is available at
https://www.cl.cam.ac.uk/~mgk25/ucs/wcwidth.c::
---
 .../{python3-wcwidth_0.8.3.bb => python3-wcwidth_0.9.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-wcwidth_0.8.3.bb => python3-wcwidth_0.9.1.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-wcwidth_0.8.3.bb b/meta/recipes-devtools/python/python3-wcwidth_0.9.1.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-wcwidth_0.8.3.bb
rename to meta/recipes-devtools/python/python3-wcwidth_0.9.1.bb
index 3ba5b5b29b..2647fe59b2 100644
--- a/meta/recipes-devtools/python/python3-wcwidth_0.8.3.bb
+++ b/meta/recipes-devtools/python/python3-wcwidth_0.9.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/jquast/wcwidth"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b15979c39a2543892fca8cd86b4b52cb"
 
-SRC_URI[sha256sum] = "d128512515fbf4612e0ff21fd6380399210318b7b54a9af59dff8454cf9730eb"
+SRC_URI[sha256sum] = "5823209b0d43af322ce698c689380d7c15ca31fa8e6e3be8459f27031bef0af5"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-- 
2.47.1


--===============8966731044939071050==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-wcwidth-changelog.txt"

=======
History
=======

0.9.1 *2026-09-23*
0.9.0 *2026-09-23*
0.8.5 *2026-09-23*
0.8.4 *2026-09-17*
0.8.3 *2026-08-28*
0.8.2 *2026-06-29*
0.8.1 *2026-06-08*
0.8.0 *2026-06-05*
0.7.0 *2026-05-02*
0.6.0 *2026-02-06*
0.5.3 *2026-01-30*
0.5.2 *2026-01-29*
0.5.1 *2026-01-27*
0.5.0 *2026-01-26*
0.4.0 *2026-01-25*
0.3.5 *2026-01-24*
0.3.4 *2026-01-24*
0.3.3 *2026-01-24*
0.3.2 *2026-01-23*
0.3.1 *2026-01-22*
0.3.0 *2026-01-21*
0.2.14 *2025-09-22*
0.2.13 *2024-01-06*
0.2.12 *2023-11-21*
0.2.11 *2023-11-20*
0.2.10 *2023-11-13*
0.2.9 *2023-10-30*
0.2.8 *2023-09-30*
0.2.7 *2023-09-28*
0.2.6 *2023-01-14*
0.2.1 .. 0.2.5 *2020-06-23*
0.2.0 *2020-06-01*
0.1.9 *2020-03-22*
0.1.8 *2020-01-01*
0.1.7 *2016-07-01*
0.1.6 *2016-01-08 Production/Stable*
0.1.5 *2015-09-13 Alpha*
0.1.4 *2014-11-20 Pre-Alpha*
0.1.3 *2014-10-29 Pre-Alpha*
0.1.2 *2014-10-28 Pre-Alpha*
0.1.1 *2014-05-14 Pre-Alpha*

This code was originally derived directly from C code of the same name,
whose latest version is available at
https://www.cl.cam.ac.uk/~mgk25/ucs/wcwidth.c::

--===============8966731044939071050==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-dbg: PKGSIZE changed from 0 to 1604928 (+100%)
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-dbg: RRECOMMENDS: added "glibc-dbg"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-dev: RRECOMMENDS: added "glibc-dev"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-ptest: PKGSIZE changed from 198538 to 261999 (+32%)
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-ptest: FILELIST: added "/usr/lib/python3-wcwidth/ptest/tests/test_fastcall_args.py /usr/lib/python3-wcwidth/ptest/tests/test_setup.py /usr/lib/python3-wcwidth/ptest/tests/test_check_release.py"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-src: PKGSIZE changed from 0 to 3534102 (+100%)
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: PKGSIZE changed from 4410977 to 5343493 (+21%)
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: FILELIST: directory renamed /usr/lib/python3.14/site-packages/wcwidth-0.8.3.dist-info/licenses -> /usr/lib/python3.14/site-packages/wcwidth-0.9.1.dist-info/licenses, removed "/usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_529fbb4a.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_8f94b404.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_fd9d4c44.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_da9ceb0a.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_3d4826b8.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_970dbe10.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_50bf0759.cpython-314.pyc /usr/lib
 /python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_529fbb4a.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_3d4826b8.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_da9ceb0a.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_5bfac390.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_c2157f7e.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_970dbe10.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_c2157f7e.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_fd9d4c44.py /usr/lib/python3.14/site-packages/wcwidth/textwrap.py,cover /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_813fee16.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_27e0693f.py /usr/lib/python3.14/site-packages/w
 cwidth/table_grapheme_overrides/__pycache__/_known_5bfac390.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_27e0693f.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_8f94b404.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_50bf0759.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_fcc05a0f.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_e08bd75e.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_8589765c.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_c3db41c0.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_e22030f3.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth-0.8.3.dist-info/METADATA /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_e08bd75e.cpython-314.pyc /usr/
 lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_8589765c.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_e22030f3.py /usr/lib/python3.14/site-packages/wcwidth-0.8.3.dist-info/WHEEL /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_813fee16.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_4cdf59ce.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_4cdf59ce.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_c3db41c0.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_45d92e98.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_fcc05a0f.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_45d92e98.py /usr/lib/pytho
 n3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_c0a2cdbf.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_c0a2cdbf.py", added "/usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_97904ece.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/_wcwidth_c.pyi /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_2148ff29.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_e2b75ee3.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_244dc88b.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_2148ff29.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_33ac73f2.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_336a71a1.cpython-314.pyc /usr/lib/python3.14/s
 ite-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_c57c295b.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_900356bf.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_a5880eeb.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_cf02297d.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_3a1895d5.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_59180a0d.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_e18ac6a7.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_65c6beb5.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_78f828e8.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_058c7585.py /usr/lib
 /python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_fdc99132.py /usr/lib/python3.14/site-packages/wcwidth/_wcwidth_c.abi3.so /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_fb5fd79b.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_8c2ae14d.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_336a71a1.py /usr/lib/python3.14/site-packages/wcwidth-0.9.1.dist-info/METADATA /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_a5880eeb.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_058c7585.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_e18ac6a7.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_3a1895d5.py /usr/lib/python3.14/site-packages/wcwidth-0.9.1.dist-info/WHEEL /usr/lib/python3.14/site-
 packages/wcwidth/table_grapheme_overrides/_known_c57c295b.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_78f828e8.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_cf02297d.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_8c2ae14d.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_97904ece.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_b6d33cf4.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_fb5fd79b.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_65c6beb5.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_fdc99132.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth-0.9.1.dist-info/top_level.txt /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_24
 4dc88b.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_b6d33cf4.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_33ac73f2.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_900356bf.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_e2b75ee3.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_59180a0d.py"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: RDEPENDS: added "glibc (['>= 2.44+git0+5c479454d1'])"
Changes to packages/x86-64-v3-poky-linux/python3-wcwidth (sysroot):
  /usr/lib/python3.14/site-packages/wcwidth-0.8.3.dist-info moved to /usr/lib/python3.14/site-packages/wcwidth-0.9.1.dist-info
  /usr/lib/python3.14/site-packages/wcwidth-0.9.1.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_058c7585.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_2148ff29.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_244dc88b.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_336a71a1.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_33ac73f2.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_3a1895d5.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_59180a0d.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_65c6beb5.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_78f828e8.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_8c2ae14d.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_900356bf.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_97904ece.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_a5880eeb.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_b6d33cf4.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_c57c295b.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_cf02297d.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_e18ac6a7.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_e2b75ee3.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_fb5fd79b.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_fdc99132.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_058c7585.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_2148ff29.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_244dc88b.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_336a71a1.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_33ac73f2.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_3a1895d5.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_59180a0d.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_65c6beb5.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_78f828e8.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_8c2ae14d.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_900356bf.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_97904ece.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_a5880eeb.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_b6d33cf4.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_c57c295b.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_cf02297d.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_e18ac6a7.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_e2b75ee3.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_fb5fd79b.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_fdc99132.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/_wcwidth_c.abi3.so was added
  /usr/lib/python3.14/site-packages/wcwidth/_wcwidth_c.pyi was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_27e0693f.py was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_3d4826b8.py was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_45d92e98.py was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_4cdf59ce.py was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_50bf0759.py was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_529fbb4a.py was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_5bfac390.py was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_813fee16.py was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_8589765c.py was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_8f94b404.py was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_970dbe10.py was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_c0a2cdbf.py was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_c2157f7e.py was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_c3db41c0.py was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_da9ceb0a.py was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_e08bd75e.py was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_e22030f3.py was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_fcc05a0f.py was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_fd9d4c44.py was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_27e0693f.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_3d4826b8.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_45d92e98.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_4cdf59ce.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_50bf0759.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_529fbb4a.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_5bfac390.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_813fee16.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_8589765c.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_8f94b404.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_970dbe10.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_c0a2cdbf.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_c2157f7e.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_c3db41c0.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_da9ceb0a.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_e08bd75e.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_e22030f3.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_fcc05a0f.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_fd9d4c44.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/wcwidth/textwrap.py,cover was removed
Changes to packages/x86_64-linux/python3-vcs-versioning-native (sysroot):
  /usr/lib/python3.14/site-packages/vcs_versioning-2.5.0.dist-info moved to /usr/lib/python3.14/site-packages/vcs_versioning-2.4.0.dist-info

--===============8966731044939071050==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-wcwidth: PV changed from "0.8.3" to "0.9.1"
packages/x86-64-v3-poky-linux/python3-wcwidth: PKGV changed from 0.8.3 [default] to 0.9.1 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth: SRC_URI changed from "https://files.pythonhosted.org/packages/source/w/wcwidth/wcwidth-0.8.3.tar.gz" to "https://files.pythonhosted.org/packages/source/w/wcwidth/wcwidth-0.9.1.tar.gz"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-dbg: PKGSIZE changed from 0 to 1604928 (+100%)
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-dbg: PV changed from "0.8.3" to "0.9.1"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-dbg: RRECOMMENDS: added "glibc-dbg"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-dbg: PKGV changed from 0.8.3 [default] to 0.9.1 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-dbg: FILELIST: added "/usr/lib/python3.14/site-packages/wcwidth/.debug/_wcwidth_c.abi3.so"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-dev: PV changed from "0.8.3" to "0.9.1"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-dev: RRECOMMENDS: added "glibc-dev"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-dev: PKGV changed from 0.8.3 [default] to 0.9.1 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-doc: PV changed from "0.8.3" to "0.9.1"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-doc: PKGV changed from 0.8.3 [default] to 0.9.1 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-locale: PV changed from "0.8.3" to "0.9.1"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-locale: PKGV changed from 0.8.3 [default] to 0.9.1 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-ptest: PKGSIZE changed from 198538 to 261999 (+32%)
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-ptest: PV changed from "0.8.3" to "0.9.1"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-ptest: PKGV changed from 0.8.3 [default] to 0.9.1 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-ptest: FILELIST: added "/usr/lib/python3-wcwidth/ptest/tests/test_check_release.py /usr/lib/python3-wcwidth/ptest/tests/test_fastcall_args.py /usr/lib/python3-wcwidth/ptest/tests/test_setup.py"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-src: PKGSIZE changed from 0 to 3534102 (+100%)
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-src: PV changed from "0.8.3" to "0.9.1"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-src: PKGV changed from 0.8.3 [default] to 0.9.1 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-src: FILELIST: added "/usr/src/debug/python3-wcwidth/0.9.1/libwcwidth/src/escape.c /usr/src/debug/python3-wcwidth/0.9.1/libwcwidth/src/wcstwidth.c /usr/src/debug/python3-wcwidth/0.9.1/libwcwidth/src/grapheme.c /usr/src/debug/python3-wcwidth/0.9.1/libwcwidth/include/wcwidth/escape.h /usr/src/debug/python3-wcwidth/0.9.1/libwcwidth/include/wcwidth/clip.h /usr/src/debug/python3-wcwidth/0.9.1/libwcwidth/src/align.c /usr/src/debug/python3-wcwidth/0.9.1/libwcwidth/src/tables/table_vs16.c /usr/src/debug/python3-wcwidth/0.9.1/libwcwidth/src/text_sizing.c /usr/src/debug/python3-wcwidth/0.9.1/libwcwidth/include/wcwidth/utf8.h /usr/src/debug/python3-wcwidth/0.9.1/libwcwidth/src/bisearch.c /usr/src/debug/python3-wcwidth/0.9.1/libwcwidth/include/wcwidth/tables.h /usr/src/debug/python3-wcwidth/0.9.1/libwcwidth/include/wcwidth/wcwidth.h /usr/src/debug/python3-wcwidth/0.9.1/libwcwidth/src/terminal_override.c /usr/src/debug/python3-wcwidth/
 0.9.1/libwcwidth/include/wcwidth/unicode.h /usr/src/debug/python3-wcwidth/0.9.1/libwcwidth/src/tables/table_grapheme.c /usr/src/debug/python3-wcwidth/0.9.1/wcwidth/_wcwidth_c.c /usr/src/debug/python3-wcwidth/0.9.1/libwcwidth/include/wcwidth/textwrap.h /usr/src/debug/python3-wcwidth/0.9.1/libwcwidth/include/wcwidth/table_types.h /usr/src/debug/python3-wcwidth/0.9.1/libwcwidth/include/wcwidth/sgr.h /usr/src/debug/python3-wcwidth/0.9.1/libwcwidth/src/clip.c /usr/src/debug/python3-wcwidth/0.9.1/libwcwidth/src/utf8.c /usr/src/debug/python3-wcwidth/0.9.1/libwcwidth/src/tables/table_ambiguous.c /usr/src/debug/python3-wcwidth/0.9.1/libwcwidth/src/sgr.c /usr/src/debug/python3-wcwidth/0.9.1/libwcwidth/include/wcwidth/grapheme.h /usr/src/debug/python3-wcwidth/0.9.1/libwcwidth/include/wcwidth/text_sizing.h /usr/src/debug/python3-wcwidth/0.9.1/libwcwidth/src/tables/table_zero.c /usr/src/debug/python3-wcwidth/0.9.1/libwcwidth/include/wcwidth/terminal_override.h /usr/src/debug/python3-wcwidth/0.9.
 1/libwcwidth/include/wcwidth/width.h /usr/src/debug/python3-wcwidth/0.9.1/libwcwidth/src/textwrap.c /usr/src/debug/python3-wcwidth/0.9.1/libwcwidth/src/tables/table_mc.c /usr/src/debug/python3-wcwidth/0.9.1/libwcwidth/src/tables/table_gcb_class.c /usr/src/debug/python3-wcwidth/0.9.1/libwcwidth/src/tables/table_wide.c /usr/src/debug/python3-wcwidth/0.9.1/libwcwidth/src/wcwidth.c /usr/src/debug/python3-wcwidth/0.9.1/libwcwidth/src/tables/table_term_programs.c /usr/src/debug/python3-wcwidth/0.9.1/libwcwidth/include/wcwidth/align.h /usr/src/debug/python3-wcwidth/0.9.1/libwcwidth/src/width.c /usr/src/debug/python3-wcwidth/0.9.1/libwcwidth/src/wcswidth.c /usr/src/debug/python3-wcwidth/0.9.1/libwcwidth/src/tables/table_terminal_overrides.c /usr/src/debug/python3-wcwidth/0.9.1/libwcwidth/src/tables/table_vs15.c"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-staticdev: PV changed from "0.8.3" to "0.9.1"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-staticdev: PKGV changed from 0.8.3 [default] to 0.9.1 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: PKGSIZE changed from 4410977 to 5343493 (+21%)
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: RDEPENDS: added "glibc (['>= 2.44+git0+5c479454d1'])"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: PV changed from "0.8.3" to "0.9.1"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: PKGV changed from 0.8.3 [default] to 0.9.1 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: FILELIST: directory renamed /usr/lib/python3.14/site-packages/wcwidth-0.8.3.dist-info/licenses -> /usr/lib/python3.14/site-packages/wcwidth-0.9.1.dist-info/licenses, removed "/usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_e22030f3.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_5bfac390.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_e08bd75e.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_8589765c.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_da9ceb0a.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_529fbb4a.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_8f94b404.cpython-314.pyc /usr/lib
 /python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_970dbe10.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_fd9d4c44.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_970dbe10.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_e22030f3.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_e08bd75e.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_45d92e98.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_4cdf59ce.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_c3db41c0.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_529fbb4a.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_4cdf59ce.py /usr/lib/python3.14/
 site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_3d4826b8.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_813fee16.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_27e0693f.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_50bf0759.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_8f94b404.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_27e0693f.py /usr/lib/python3.14/site-packages/wcwidth/textwrap.py,cover /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_5bfac390.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_c0a2cdbf.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_da9ceb0a.py /usr/lib/python3.14/site-packages
 /wcwidth/table_grapheme_overrides/_known_fd9d4c44.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_fcc05a0f.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_c2157f7e.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth-0.8.3.dist-info/METADATA /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_813fee16.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_fcc05a0f.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_45d92e98.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_c0a2cdbf.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_50bf0759.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_8589765c.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_c2157f7e.py /usr/lib/python3.14/site-packages/wcwidth-0.8.3.dist-
 info/WHEEL /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_3d4826b8.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_c3db41c0.py", added "/usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_8c2ae14d.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_a5880eeb.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_058c7585.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_e18ac6a7.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_97904ece.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_900356bf.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_cf02297d.cpython-314.pyc /usr/lib/python3.14/site-pac
 kages/wcwidth/table_grapheme_overrides/_known_fdc99132.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_c57c295b.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_cf02297d.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_8c2ae14d.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_b6d33cf4.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_e18ac6a7.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_a5880eeb.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_c57c295b.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_97904ece.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_2148ff29.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_244d
 c88b.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_e2b75ee3.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/_wcwidth_c.pyi /usr/lib/python3.14/site-packages/wcwidth-0.9.1.dist-info/top_level.txt /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_3a1895d5.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_78f828e8.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_fb5fd79b.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_78f828e8.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_33ac73f2.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_336a71a1.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_2148ff29.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_know
 n_336a71a1.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_e2b75ee3.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_3a1895d5.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth-0.9.1.dist-info/METADATA /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_59180a0d.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_65c6beb5.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_33ac73f2.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_65c6beb5.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_fdc99132.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_244dc88b.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_59180a0d.py /usr/lib/python3.14/site-pack
 ages/wcwidth/table_grapheme_overrides/_known_900356bf.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_058c7585.py /usr/lib/python3.14/site-packages/wcwidth-0.9.1.dist-info/WHEEL /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_b6d33cf4.py /usr/lib/python3.14/site-packages/wcwidth/_wcwidth_c.abi3.so /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_fb5fd79b.cpython-314.pyc"
Changes to packages/x86-64-v3-poky-linux/python3-wcwidth (sysroot):
  /usr/lib/python3.14/site-packages/wcwidth-0.8.3.dist-info moved to /usr/lib/python3.14/site-packages/wcwidth-0.9.1.dist-info
  /usr/lib/python3.14/site-packages/wcwidth-0.9.1.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_058c7585.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_2148ff29.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_244dc88b.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_336a71a1.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_33ac73f2.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_3a1895d5.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_59180a0d.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_65c6beb5.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_78f828e8.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_8c2ae14d.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_900356bf.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_97904ece.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_a5880eeb.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_b6d33cf4.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_c57c295b.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_cf02297d.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_e18ac6a7.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_e2b75ee3.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_fb5fd79b.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_fdc99132.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_058c7585.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_2148ff29.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_244dc88b.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_336a71a1.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_33ac73f2.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_3a1895d5.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_59180a0d.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_65c6beb5.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_78f828e8.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_8c2ae14d.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_900356bf.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_97904ece.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_a5880eeb.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_b6d33cf4.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_c57c295b.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_cf02297d.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_e18ac6a7.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_e2b75ee3.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_fb5fd79b.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_fdc99132.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/_wcwidth_c.abi3.so was added
  /usr/lib/python3.14/site-packages/wcwidth/_wcwidth_c.pyi was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_27e0693f.py was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_3d4826b8.py was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_45d92e98.py was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_4cdf59ce.py was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_50bf0759.py was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_529fbb4a.py was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_5bfac390.py was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_813fee16.py was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_8589765c.py was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_8f94b404.py was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_970dbe10.py was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_c0a2cdbf.py was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_c2157f7e.py was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_c3db41c0.py was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_da9ceb0a.py was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_e08bd75e.py was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_e22030f3.py was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_fcc05a0f.py was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_fd9d4c44.py was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_27e0693f.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_3d4826b8.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_45d92e98.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_4cdf59ce.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_50bf0759.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_529fbb4a.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_5bfac390.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_813fee16.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_8589765c.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_8f94b404.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_970dbe10.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_c0a2cdbf.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_c2157f7e.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_c3db41c0.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_da9ceb0a.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_e08bd75e.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_e22030f3.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_fcc05a0f.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_fd9d4c44.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/wcwidth/textwrap.py,cover was removed
Changes to packages/x86_64-linux/python3-vcs-versioning-native (sysroot):
  /usr/lib/python3.14/site-packages/vcs_versioning-2.5.0.dist-info moved to /usr/lib/python3.14/site-packages/vcs_versioning-2.4.0.dist-info

--===============8966731044939071050==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-wcwidth-upgrade-0.8.3-0.9.1.patch"

RnJvbSBlYWFmYmZmNDE2MDUzN2ZhNWFmYmY2OGE2NmNiZDdjODkxZTQyNjVlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMjQgU2VwIDIwMjYgMDU6MjQ6MjcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXdjd2lkdGg6IHVwZ3JhZGUgMC44LjMgLT4gMC45LjEKCj09PT09PT0KSGlzdG9yeQo9
PT09PT09CgowLjkuMSAqMjAyNi0wOS0yMyoKMC45LjAgKjIwMjYtMDktMjMqCjAuOC41ICoyMDI2
LTA5LTIzKgowLjguNCAqMjAyNi0wOS0xNyoKMC44LjMgKjIwMjYtMDgtMjgqCjAuOC4yICoyMDI2
LTA2LTI5KgowLjguMSAqMjAyNi0wNi0wOCoKMC44LjAgKjIwMjYtMDYtMDUqCjAuNy4wICoyMDI2
LTA1LTAyKgowLjYuMCAqMjAyNi0wMi0wNioKMC41LjMgKjIwMjYtMDEtMzAqCjAuNS4yICoyMDI2
LTAxLTI5KgowLjUuMSAqMjAyNi0wMS0yNyoKMC41LjAgKjIwMjYtMDEtMjYqCjAuNC4wICoyMDI2
LTAxLTI1KgowLjMuNSAqMjAyNi0wMS0yNCoKMC4zLjQgKjIwMjYtMDEtMjQqCjAuMy4zICoyMDI2
LTAxLTI0KgowLjMuMiAqMjAyNi0wMS0yMyoKMC4zLjEgKjIwMjYtMDEtMjIqCjAuMy4wICoyMDI2
LTAxLTIxKgowLjIuMTQgKjIwMjUtMDktMjIqCjAuMi4xMyAqMjAyNC0wMS0wNioKMC4yLjEyICoy
MDIzLTExLTIxKgowLjIuMTEgKjIwMjMtMTEtMjAqCjAuMi4xMCAqMjAyMy0xMS0xMyoKMC4yLjkg
KjIwMjMtMTAtMzAqCjAuMi44ICoyMDIzLTA5LTMwKgowLjIuNyAqMjAyMy0wOS0yOCoKMC4yLjYg
KjIwMjMtMDEtMTQqCjAuMi4xIC4uIDAuMi41ICoyMDIwLTA2LTIzKgowLjIuMCAqMjAyMC0wNi0w
MSoKMC4xLjkgKjIwMjAtMDMtMjIqCjAuMS44ICoyMDIwLTAxLTAxKgowLjEuNyAqMjAxNi0wNy0w
MSoKMC4xLjYgKjIwMTYtMDEtMDggUHJvZHVjdGlvbi9TdGFibGUqCjAuMS41ICoyMDE1LTA5LTEz
IEFscGhhKgowLjEuNCAqMjAxNC0xMS0yMCBQcmUtQWxwaGEqCjAuMS4zICoyMDE0LTEwLTI5IFBy
ZS1BbHBoYSoKMC4xLjIgKjIwMTQtMTAtMjggUHJlLUFscGhhKgowLjEuMSAqMjAxNC0wNS0xNCBQ
cmUtQWxwaGEqCgpUaGlzIGNvZGUgd2FzIG9yaWdpbmFsbHkgZGVyaXZlZCBkaXJlY3RseSBmcm9t
IEMgY29kZSBvZiB0aGUgc2FtZSBuYW1lLAp3aG9zZSBsYXRlc3QgdmVyc2lvbiBpcyBhdmFpbGFi
bGUgYXQKaHR0cHM6Ly93d3cuY2wuY2FtLmFjLnVrL35tZ2syNS91Y3Mvd2N3aWR0aC5jOjoKLS0t
CiAuLi4ve3B5dGhvbjMtd2N3aWR0aF8wLjguMy5iYiA9PiBweXRob24zLXdjd2lkdGhfMC45LjEu
YmJ9ICAgICAgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXdjd2lk
dGhfMC44LjMuYmIgPT4gcHl0aG9uMy13Y3dpZHRoXzAuOS4xLmJifSAoODQlKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13Y3dpZHRoXzAuOC4zLmJi
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXdjd2lkdGhfMC45LjEuYmIK
c2ltaWxhcml0eSBpbmRleCA4NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLXdjd2lkdGhfMC44LjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy13Y3dpZHRoXzAuOS4xLmJiCmluZGV4IDNiYTViNWIyOWIuLjI2
NDdmZTU5YjIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My13Y3dpZHRoXzAuOC4zLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy13Y3dpZHRoXzAuOS4xLmJiCkBAIC00LDcgKzQsNyBAQCBIT01FUEFHRSA9ICJodHRwczov
L2dpdGh1Yi5jb20vanF1YXN0L3djd2lkdGgiCiBMSUNFTlNFID0gIk1JVCIKIExJQ19GSUxFU19D
SEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWIxNTk3OWMzOWEyNTQzODkyZmNhOGNkODZiNGI1
MmNiIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZDEyODUxMjUxNWZiZjQ2MTJlMGZmMjFmZDYz
ODAzOTkyMTAzMThiN2I1NGE5YWY1OWRmZjg0NTRjZjk3MzBlYiIKK1NSQ19VUklbc2hhMjU2c3Vt
XSA9ICI1ODIzMjA5YjBkNDNhZjMyMmNlNjk4YzY4OTM4MGQ3YzE1Y2EzMWZhOGU2ZTNiZTg0NTlm
MjcwMzFiZWYwYWY1IgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX2hhdGNobGluZyBwdGVzdC1weXRo
b24tcHl0ZXN0CiAKLS0gCjIuNDcuMQoK

--===============8966731044939071050==--

