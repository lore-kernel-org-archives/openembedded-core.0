Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B9F6D5CCBF
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:39 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17195.1765872154046813139
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=eXnC9JmC;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=EYsbm6K5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019b262eb209-87f97b85-673b-4b22-9b14-9ff90d44e742-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872153;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=X/3U+LyzgGlvxPT5IHXzGVXJcpLiCi8+D7ycFFhsVAs=;
	b=eXnC9JmCD5P0Z8NX20itc36K91r7mRzcbMiC+nQ0ZbEwE/nrBFZ8RV/+/YcC2SuT
	G/r43QBGHQYVwYcY6lQVhQuyNLwhjcYxYKVOeKyRW/fQ3QSl6WpmOwhgtNzRo1QV2s2
	DpTGOcxGC2o8DGgp2gOQqTNDJc9OlBgVxQf/F1HA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872153;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=X/3U+LyzgGlvxPT5IHXzGVXJcpLiCi8+D7ycFFhsVAs=;
	b=EYsbm6K58JDmmZjvm9PKvxH9drgMOYJdYMdARh1+8ifyB3w1H/9/FrFR7FIqHSSf
	ZqFNBwd2D+yNn6WRLIiFHFFGl4mYrh8p58AW5Xc/kq61lWYiM4s1NhNWOb5yIfCmc8p
	CIB1vUgpJIY23PahvfBs/Pe85zfbRdi4Eumgtjj8=
Content-Type: multipart/mixed; boundary="===============1787950786567042188=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] swig: upgrading to 4.4.1 SUCCEEDED
Message-ID: <0101019b262eb209-87f97b85-673b-4b22-9b14-9ff90d44e742-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:33 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227845

--===============1787950786567042188==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *swig* to *4.4.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-swig-upgrade-4.3.1-4.4.1.patch
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
From 2cbf905737f1d395be4c3bc2657b2b1d9fcbd73c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 02:26:20 +0000
Subject: [PATCH] swig: upgrade 4.3.1 -> 4.4.1

---
 meta/recipes-devtools/swig/swig/determinism.patch           | 2 +-
 meta/recipes-devtools/swig/{swig_4.3.1.bb => swig_4.4.1.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/swig/{swig_4.3.1.bb => swig_4.4.1.bb} (94%)

diff --git a/meta/recipes-devtools/swig/swig/determinism.patch b/meta/recipes-devtools/swig/swig/determinism.patch
index 4359281bbb..d6af38248d 100644
--- a/meta/recipes-devtools/swig/swig/determinism.patch
+++ b/meta/recipes-devtools/swig/swig/determinism.patch
@@ -1,4 +1,4 @@
-From 1cd6f0cc21fc977a710e8d30c3d2ebfee3c72dc0 Mon Sep 17 00:00:00 2001
+From 7df78bedb666e49131c48f1854c6be1597bd133c Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Mon, 1 Mar 2021 00:11:10 +0000
 Subject: [PATCH] swig: Fix reproducibility issue
diff --git a/meta/recipes-devtools/swig/swig_4.3.1.bb b/meta/recipes-devtools/swig/swig_4.4.1.bb
similarity index 94%
rename from meta/recipes-devtools/swig/swig_4.3.1.bb
rename to meta/recipes-devtools/swig/swig_4.4.1.bb
index dd979580a1..f71a92d931 100644
--- a/meta/recipes-devtools/swig/swig_4.3.1.bb
+++ b/meta/recipes-devtools/swig/swig_4.4.1.bb
@@ -15,7 +15,7 @@ DEPENDS = "libpcre2 bison-native"
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
             file://determinism.patch \
            "
-SRC_URI[sha256sum] = "44fc829f70f1e17d635a2b4d69acab38896699ecc24aa023e516e0eabbec61b8"
+SRC_URI[sha256sum] = "40162a706c56f7592d08fd52ef5511cb7ac191f3593cf07306a0a554c6281fcf"
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/swig/files/swig/"
 UPSTREAM_CHECK_REGEX = "swig-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.47.1


--===============1787950786567042188==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/swig/swig: FILELIST: directory renamed /usr/share/swig/4.3.1/lua -> /usr/share/swig/4.4.1/lua, directory renamed /usr/share/swig/4.3.1/javascript -> /usr/share/swig/4.4.1/javascript, directory renamed /usr/share/swig/4.3.1/std -> /usr/share/swig/4.4.1/std, directory renamed /usr/share/swig/4.3.1/scilab -> /usr/share/swig/4.4.1/scilab, directory renamed /usr/share/swig/4.3.1/xml -> /usr/share/swig/4.4.1/xml, directory renamed /usr/share/swig/4.3.1/php -> /usr/share/swig/4.4.1/php, directory renamed /usr/share/swig/4.3.1/typemaps -> /usr/share/swig/4.4.1/typemaps, directory renamed /usr/share/swig/4.3.1/javascript/jsc -> /usr/share/swig/4.4.1/javascript/jsc, directory renamed /usr/share/swig/4.3.1/ruby -> /usr/share/swig/4.4.1/ruby, directory renamed /usr/share/swig/4.3.1 -> /usr/share/swig/4.4.1, directory renamed /usr/share/swig/4.3.1/perl5 -> /usr/share/swig/4.4.1/perl5, directory renamed /usr/share/swig/4.3.1/ocaml -> /usr/share/swig/4.4.1/ocaml, direc
 tory renamed /usr/share/swig/4.3.1/javascript/v8 -> /usr/share/swig/4.4.1/javascript/v8, directory renamed /usr/share/swig/4.3.1/csharp -> /usr/share/swig/4.4.1/csharp, directory renamed /usr/share/swig/4.3.1/go -> /usr/share/swig/4.4.1/go, directory renamed /usr/share/swig/4.3.1/java -> /usr/share/swig/4.4.1/java, directory renamed /usr/share/swig/4.3.1/javascript/napi -> /usr/share/swig/4.4.1/javascript/napi, directory renamed /usr/share/swig/4.3.1/guile -> /usr/share/swig/4.4.1/guile, directory renamed /usr/share/swig/4.3.1/r -> /usr/share/swig/4.4.1/r, directory renamed /usr/share/swig/4.3.1/c -> /usr/share/swig/4.4.1/c, directory renamed /usr/share/swig/4.3.1/d -> /usr/share/swig/4.4.1/d, directory renamed /usr/share/swig/4.3.1/octave -> /usr/share/swig/4.4.1/octave, removed "/usr/share/swig/4.3.1/python/implicit.i /usr/share/swig/4.3.1/python/std_list.i /usr/share/swig/4.3.1/tcl/std_deque.i /usr/share/swig/4.3.1/mzscheme/std_auto_ptr.i /usr/share/swig/4.3.1/tcl/std_auto_ptr.i 
 /usr/share/swig/4.3.1/python/pydocs.swg /usr/share/swig/4.3.1/python/std_complex.i /usr/share/swig/4.3.1/python/std_sstream.i /usr/share/swig/4.3.1/python/std_wstring.i /usr/share/swig/4.3.1/python/README /usr/share/swig/4.3.1/python/pyruntime.swg /usr/share/swig/4.3.1/tcl/Makefile.in /usr/share/swig/4.3.1/tcl/stl.i /usr/share/swig/4.3.1/mzscheme/argcargv.i /usr/share/swig/4.3.1/tcl/std_unique_ptr.i /usr/share/swig/4.3.1/python/pystrings.swg /usr/share/swig/4.3.1/python/std_auto_ptr.i /usr/share/swig/4.3.1/python/director_py_mutex.swg /usr/share/swig/4.3.1/tcl/factory.i /usr/share/swig/4.3.1/python/pyopers.swg /usr/share/swig/4.3.1/tcl/tclkw.swg /usr/share/swig/4.3.1/python/swigmove.i /usr/share/swig/4.3.1/python/pyfragments.swg /usr/share/swig/4.3.1/python/pyprimtypes.swg /usr/share/swig/4.3.1/python/std_pair.i /usr/share/swig/4.3.1/tcl/tclwstrings.swg /usr/share/swig/4.3.1/tcl/tclprimtypes.swg /usr/share/swig/4.3.1/tcl/tclopers.swg /usr/share/swig/4.3.1/tcl/tclinterp.i /usr/share/
 swig/4.3.1/mzscheme/std_unique_ptr.i /usr/share/swig/4.3.1/tcl/tcltypemaps.swg /usr/share/swig/4.3.1/python/builtin.swg /usr/share/swig/4.3.1/python/cpointer.i /usr/share/swig/4.3.1/python/pycomplex.swg /usr/share/swig/4.3.1/tcl/tclstrings.swg /usr/share/swig/4.3.1/tcl/argcargv.i /usr/share/swig/4.3.1/tcl/std_string_view.i /usr/share/swig/4.3.1/tcl/tclsh.i /usr/share/swig/4.3.1/python/factory.i /usr/share/swig/4.3.1/python/pythonkw.swg /usr/share/swig/4.3.1/tcl/std_pair.i /usr/share/swig/4.3.1/mzscheme/Makefile /usr/share/swig/4.3.1/python/std_unordered_set.i /usr/share/swig/4.3.1/python/pystdcommon.swg /usr/share/swig/4.3.1/mzscheme/mzscheme.swg /usr/share/swig/4.3.1/tcl/tclruntime.swg /usr/share/swig/4.3.1/python/std_multimap.i /usr/share/swig/4.3.1/python/Makefile.in /usr/share/swig/4.3.1/python/ccomplex.i /usr/share/swig/4.3.1/mzscheme/mzrun.swg /usr/share/swig/4.3.1/python/std_shared_ptr.i /usr/share/swig/4.3.1/python/std_unique_ptr.i /usr/share/swig/4.3.1/python/cmalloc.i /usr
 /share/swig/4.3.1/python/std_ios.i /usr/share/swig/4.3.1/python/cwstring.i /usr/share/swig/4.3.1/python/pyabc.i /usr/share/swig/4.3.1/python/exception.i /usr/share/swig/4.3.1/python/pymacros.swg /usr/share/swig/4.3.1/python/std_container.i /usr/share/swig/4.3.1/python/pywstrings.swg /usr/share/swig/4.3.1/python/pyerrors.swg /usr/share/swig/4.3.1/python/stl.i /usr/share/swig/4.3.1/python/typemaps.i /usr/share/swig/4.3.1/python/std_common.i /usr/share/swig/4.3.1/python/std_alloc.i /usr/share/swig/4.3.1/python/boost_shared_ptr.i /usr/share/swig/4.3.1/tcl/tcluserdir.swg /usr/share/swig/4.3.1/python/pyapi.swg /usr/share/swig/4.3.1/python/pyname_compat.i /usr/share/swig/4.3.1/python/std_except.i /usr/share/swig/4.3.1/python/std_string.i /usr/share/swig/4.3.1/tcl/cpointer.i /usr/share/swig/4.3.1/python/pybackward.swg /usr/share/swig/4.3.1/tcl/carrays.i /usr/share/swig/4.3.1/python/wchar.i /usr/share/swig/4.3.1/python/std_wstreambuf.i /usr/share/swig/4.3.1/python/pyclasses.swg /usr/share/sw
 ig/4.3.1/tcl/swigmove.i /usr/share/swig/4.3.1/tcl/wish.i /usr/share/swig/4.3.1/python/std_map.i /usr/share/swig/4.3.1/python/std_streambuf.i /usr/share/swig/4.3.1/python/std_deque.i /usr/share/swig/4.3.1/tcl/tclfragments.swg /usr/share/swig/4.3.1/mzscheme/cdata.i /usr/share/swig/4.3.1/python/attribute.i /usr/share/swig/4.3.1/mzscheme/typemaps.i /usr/share/swig/4.3.1/python/pybuffer.i /usr/share/swig/4.3.1/python/std_wiostream.i /usr/share/swig/4.3.1/python/cstring.i /usr/share/swig/4.3.1/tcl/cmalloc.i /usr/share/swig/4.3.1/python/std_vectora.i /usr/share/swig/4.3.1/python/std_set.i /usr/share/swig/4.3.1/python/std_unordered_map.i /usr/share/swig/4.3.1/tcl/tclinit.swg /usr/share/swig/4.3.1/python/pyrun.swg /usr/share/swig/4.3.1/python/pyuserdir.swg /usr/share/swig/4.3.1/python/pyinit.swg /usr/share/swig/4.3.1/tcl/std_except.i /usr/share/swig/4.3.1/python/std_multiset.i /usr/share/swig/4.3.1/tcl/std_wstring.i /usr/share/swig/4.3.1/mzscheme/std_string.i /usr/share/swig/4.3.1/tcl/except
 ion.i /usr/share/swig/4.3.1/tcl/std_common.i /usr/share/swig/4.3.1/tcl/cwstring.i /usr/share/swig/4.3.1/python/embed.i /usr/share/swig/4.3.1/python/std_string_view.i /usr/share/swig/4.3.1/tcl/std_map.i /usr/share/swig/4.3.1/tcl/std_string.i /usr/share/swig/4.3.1/mzscheme/swigmove.i /usr/share/swig/4.3.1/mzscheme/stl.i /usr/share/swig/4.3.1/python/std_filesystem.i /usr/share/swig/4.3.1/python/file.i /usr/share/swig/4.3.1/python/pythreads.swg /usr/share/swig/4.3.1/mzscheme/std_common.i /usr/share/swig/4.3.1/python/pytypemaps.swg /usr/share/swig/4.3.1/python/pyiterators.swg /usr/share/swig/4.3.1/python/std_iostream.i /usr/share/swig/4.3.1/python/std_wsstream.i /usr/share/swig/4.3.1/tcl/typemaps.i /usr/share/swig/4.3.1/python/argcargv.i /usr/share/swig/4.3.1/tcl/tcl8.swg /usr/share/swig/4.3.1/tcl/tclmacros.swg /usr/share/swig/4.3.1/python/pyhead.swg /usr/share/swig/4.3.1/python/std_unordered_multiset.i /usr/share/swig/4.3.1/tcl/tclresult.i /usr/share/swig/4.3.1/tcl/tclerrors.swg /usr/sh
 are/swig/4.3.1/mzscheme/std_pair.i /usr/share/swig/4.3.1/tcl/tclapi.swg /usr/share/swig/4.3.1/tcl/tclrun.swg /usr/share/swig/4.3.1/python/std_unordered_multimap.i /usr/share/swig/4.3.1/python/carrays.i /usr/share/swig/4.3.1/python/complex.i /usr/share/swig/4.3.1/tcl/attribute.i /usr/share/swig/4.3.1/mzscheme/std_map.i /usr/share/swig/4.3.1/mzscheme/std_vector.i /usr/share/swig/4.3.1/tcl/cstring.i /usr/share/swig/4.3.1/tcl/std_vector.i /usr/share/swig/4.3.1/python/std_wios.i /usr/share/swig/4.3.1/python/std_char_traits.i /usr/share/swig/4.3.1/python/std_vector.i /usr/share/swig/4.3.1/python/director.swg /usr/share/swig/4.3.1/python/python.swg /usr/share/swig/4.3.1/mzscheme/std_deque.i /usr/share/swig/4.3.1/python/std_basic_string.i /usr/share/swig/4.3.1/python/std_array.i /usr/share/swig/4.3.1/python/pycontainer.swg", added "/usr/share/swig/4.4.1/python/implicit.i /usr/share/swig/4.4.1/python/std_list.i /usr/share/swig/4.4.1/tcl/std_deque.i /usr/share/swig/4.4.1/tcl/std_auto_ptr.i /u
 sr/share/swig/4.4.1/python/pydocs.swg /usr/share/swig/4.4.1/python/std_complex.i /usr/share/swig/4.4.1/python/std_sstream.i /usr/share/swig/4.4.1/python/std_wstring.i /usr/share/swig/4.4.1/python/README /usr/share/swig/4.4.1/python/pyruntime.swg /usr/share/swig/4.4.1/tcl/Makefile.in /usr/share/swig/4.4.1/tcl/stl.i /usr/share/swig/4.4.1/tcl/std_unique_ptr.i /usr/share/swig/4.4.1/python/pystrings.swg /usr/share/swig/4.4.1/python/std_auto_ptr.i /usr/share/swig/4.4.1/python/director_py_mutex.swg /usr/share/swig/4.4.1/tcl/factory.i /usr/share/swig/4.4.1/python/pyopers.swg /usr/share/swig/4.4.1/tcl/tclkw.swg /usr/share/swig/4.4.1/python/swigmove.i /usr/share/swig/4.4.1/python/pyfragments.swg /usr/share/swig/4.4.1/python/pyprimtypes.swg /usr/share/swig/4.4.1/python/std_pair.i /usr/share/swig/4.4.1/tcl/tclwstrings.swg /usr/share/swig/4.4.1/tcl/tclprimtypes.swg /usr/share/swig/4.4.1/tcl/tclopers.swg /usr/share/swig/4.4.1/tcl/tclinterp.i /usr/share/swig/4.4.1/tcl/tcltypemaps.swg /usr/share/sw
 ig/4.4.1/python/builtin.swg /usr/share/swig/4.4.1/python/cpointer.i /usr/share/swig/4.4.1/python/pycomplex.swg /usr/share/swig/4.4.1/tcl/tclstrings.swg /usr/share/swig/4.4.1/tcl/argcargv.i /usr/share/swig/4.4.1/tcl/std_string_view.i /usr/share/swig/4.4.1/tcl/tclsh.i /usr/share/swig/4.4.1/python/factory.i /usr/share/swig/4.4.1/python/pythonkw.swg /usr/share/swig/4.4.1/tcl/std_pair.i /usr/share/swig/4.4.1/python/std_unordered_set.i /usr/share/swig/4.4.1/python/pystdcommon.swg /usr/share/swig/4.4.1/tcl/tclruntime.swg /usr/share/swig/4.4.1/python/std_multimap.i /usr/share/swig/4.4.1/python/Makefile.in /usr/share/swig/4.4.1/python/ccomplex.i /usr/share/swig/4.4.1/python/std_shared_ptr.i /usr/share/swig/4.4.1/python/std_unique_ptr.i /usr/share/swig/4.4.1/python/cmalloc.i /usr/share/swig/4.4.1/python/std_ios.i /usr/share/swig/4.4.1/python/cwstring.i /usr/share/swig/4.4.1/tcl/tclincludes.swg /usr/share/swig/4.4.1/python/pyabc.i /usr/share/swig/4.4.1/python/exception.i /usr/share/swig/4.4.1/
 python/pymacros.swg /usr/share/swig/4.4.1/python/std_container.i /usr/share/swig/4.4.1/python/pywstrings.swg /usr/share/swig/4.4.1/python/pyerrors.swg /usr/share/swig/4.4.1/python/stl.i /usr/share/swig/4.4.1/python/typemaps.i /usr/share/swig/4.4.1/python/std_string.i /usr/share/swig/4.4.1/python/std_alloc.i /usr/share/swig/4.4.1/python/boost_shared_ptr.i /usr/share/swig/4.4.1/python/pyapi.swg /usr/share/swig/4.4.1/python/std_common.i /usr/share/swig/4.4.1/python/std_except.i /usr/share/swig/4.4.1/tcl/cpointer.i /usr/share/swig/4.4.1/tcl/tcluserdir.swg /usr/share/swig/4.4.1/python/pybackward.swg /usr/share/swig/4.4.1/tcl/carrays.i /usr/share/swig/4.4.1/python/wchar.i /usr/share/swig/4.4.1/python/std_wstreambuf.i /usr/share/swig/4.4.1/python/pyclasses.swg /usr/share/swig/4.4.1/tcl/wish.i /usr/share/swig/4.4.1/tcl/swigmove.i /usr/share/swig/4.4.1/python/std_map.i /usr/share/swig/4.4.1/python/std_streambuf.i /usr/share/swig/4.4.1/python/std_deque.i /usr/share/swig/4.4.1/tcl/tclfragments
 .swg /usr/share/swig/4.4.1/python/attribute.i /usr/share/swig/4.4.1/python/pybuffer.i /usr/share/swig/4.4.1/python/std_wiostream.i /usr/share/swig/4.4.1/python/cstring.i /usr/share/swig/4.4.1/tcl/cmalloc.i /usr/share/swig/4.4.1/python/std_vectora.i /usr/share/swig/4.4.1/python/std_set.i /usr/share/swig/4.4.1/python/std_unordered_map.i /usr/share/swig/4.4.1/tcl/tclinit.swg /usr/share/swig/4.4.1/python/pyrun.swg /usr/share/swig/4.4.1/python/pyuserdir.swg /usr/share/swig/4.4.1/python/pyinit.swg /usr/share/swig/4.4.1/tcl/std_except.i /usr/share/swig/4.4.1/python/std_multiset.i /usr/share/swig/4.4.1/tcl/std_wstring.i /usr/share/swig/4.4.1/tcl/exception.i /usr/share/swig/4.4.1/tcl/std_common.i /usr/share/swig/4.4.1/tcl/cwstring.i /usr/share/swig/4.4.1/python/embed.i /usr/share/swig/4.4.1/python/std_string_view.i /usr/share/swig/4.4.1/tcl/std_map.i /usr/share/swig/4.4.1/tcl/std_string.i /usr/share/swig/4.4.1/python/std_filesystem.i /usr/share/swig/4.4.1/python/file.i /usr/share/swig/4.4.1/
 python/pythreads.swg /usr/share/swig/4.4.1/python/pytypemaps.swg /usr/share/swig/4.4.1/python/pyiterators.swg /usr/share/swig/4.4.1/python/std_iostream.i /usr/share/swig/4.4.1/python/std_wsstream.i /usr/share/swig/4.4.1/tcl/typemaps.i /usr/share/swig/4.4.1/python/argcargv.i /usr/share/swig/4.4.1/tcl/tcl8.swg /usr/share/swig/4.4.1/tcl/tclmacros.swg /usr/share/swig/4.4.1/python/pyhead.swg /usr/share/swig/4.4.1/python/std_unordered_multiset.i /usr/share/swig/4.4.1/tcl/tclresult.i /usr/share/swig/4.4.1/tcl/tclerrors.swg /usr/share/swig/4.4.1/tcl/tclapi.swg /usr/share/swig/4.4.1/tcl/tclrun.swg /usr/share/swig/4.4.1/python/std_unordered_multimap.i /usr/share/swig/4.4.1/python/carrays.i /usr/share/swig/4.4.1/python/complex.i /usr/share/swig/4.4.1/tcl/attribute.i /usr/share/swig/4.4.1/tcl/cstring.i /usr/share/swig/4.4.1/tcl/std_vector.i /usr/share/swig/4.4.1/python/std_wios.i /usr/share/swig/4.4.1/python/std_char_traits.i /usr/share/swig/4.4.1/python/std_vector.i /usr/share/swig/4.4.1/pytho
 n/director.swg /usr/share/swig/4.4.1/python/python.swg /usr/share/swig/4.4.1/python/std_basic_string.i /usr/share/swig/4.4.1/python/std_array.i /usr/share/swig/4.4.1/python/pycontainer.swg"
Changes to packages/x86-64-v3-poky-linux/swig (sysroot):
  /usr/share/swig/4.3.1 moved to /usr/share/swig/4.4.1
  /usr/share/swig/4.4.1/tcl/tclincludes.swg was added
  /usr/share/swig/4.3.1/mzscheme was removed
  /usr/share/swig/4.3.1/mzscheme/argcargv.i was removed
  /usr/share/swig/4.3.1/mzscheme/cdata.i was removed
  /usr/share/swig/4.3.1/mzscheme/Makefile was removed
  /usr/share/swig/4.3.1/mzscheme/mzrun.swg was removed
  /usr/share/swig/4.3.1/mzscheme/mzscheme.swg was removed
  /usr/share/swig/4.3.1/mzscheme/std_auto_ptr.i was removed
  /usr/share/swig/4.3.1/mzscheme/std_common.i was removed
  /usr/share/swig/4.3.1/mzscheme/std_deque.i was removed
  /usr/share/swig/4.3.1/mzscheme/std_map.i was removed
  /usr/share/swig/4.3.1/mzscheme/std_pair.i was removed
  /usr/share/swig/4.3.1/mzscheme/std_string.i was removed
  /usr/share/swig/4.3.1/mzscheme/std_unique_ptr.i was removed
  /usr/share/swig/4.3.1/mzscheme/std_vector.i was removed
  /usr/share/swig/4.3.1/mzscheme/stl.i was removed
  /usr/share/swig/4.3.1/mzscheme/swigmove.i was removed
  /usr/share/swig/4.3.1/mzscheme/typemaps.i was removed
  /usr/share/swig/4.3.1/python/pyname_compat.i was removed

--===============1787950786567042188==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-swig-upgrade-4.3.1-4.4.1.patch"

RnJvbSAyY2JmOTA1NzM3ZjFkMzk1YmU0YzNiYzI2NTdiMmIxZDlmY2JkNzNjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDI6MjY6MjAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
d2lnOiB1cGdyYWRlIDQuMy4xIC0+IDQuNC4xCgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9z
d2lnL3N3aWcvZGV0ZXJtaW5pc20ucGF0Y2ggICAgICAgICAgIHwgMiArLQogbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3N3aWcve3N3aWdfNC4zLjEuYmIgPT4gc3dpZ180LjQuMS5iYn0gfCAyICstCiAy
IGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvc3dpZy97c3dpZ180LjMuMS5iYiA9PiBzd2lnXzQuNC4xLmJi
fSAoOTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9zd2lnL3N3aWcvZGV0
ZXJtaW5pc20ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvc3dpZy9zd2lnL2RldGVybWlu
aXNtLnBhdGNoCmluZGV4IDQzNTkyODFiYmIuLmQ2YWYzODI0OGQgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9zd2lnL3N3aWcvZGV0ZXJtaW5pc20ucGF0Y2gKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3N3aWcvc3dpZy9kZXRlcm1pbmlzbS5wYXRjaApAQCAtMSw0ICsxLDQg
QEAKLUZyb20gMWNkNmYwY2MyMWZjOTc3YTcxMGU4ZDMwYzNkMmViZmVlM2M3MmRjMCBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gN2RmNzhiZWRiNjY2ZTQ5MTMxYzQ4ZjE4NTRjNmJlMTU5
N2JkMTMzYyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJpY2hhcmQgUHVyZGllIDxy
aWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPgogRGF0ZTogTW9uLCAxIE1hciAyMDIx
IDAwOjExOjEwICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIHN3aWc6IEZpeCByZXByb2R1Y2liaWxp
dHkgaXNzdWUKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9zd2lnL3N3aWdfNC4z
LjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvc3dpZy9zd2lnXzQuNC4xLmJiCnNpbWlsYXJp
dHkgaW5kZXggOTQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9zd2lnL3N3aWdf
NC4zLjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9zd2lnL3N3aWdfNC40LjEu
YmIKaW5kZXggZGQ5Nzk1ODBhMS4uZjcxYTkyZDkzMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3N3aWcvc3dpZ180LjMuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
c3dpZy9zd2lnXzQuNC4xLmJiCkBAIC0xNSw3ICsxNSw3IEBAIERFUEVORFMgPSAibGlicGNyZTIg
Ymlzb24tbmF0aXZlIgogU1JDX1VSSSA9ICIke1NPVVJDRUZPUkdFX01JUlJPUn0vJHtCUE59LyR7
QlBOfS0ke1BWfS50YXIuZ3ogXAogICAgICAgICAgICAgZmlsZTovL2RldGVybWluaXNtLnBhdGNo
IFwKICAgICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjQ0ZmM4MjlmNzBmMWUxN2Q2
MzVhMmI0ZDY5YWNhYjM4ODk2Njk5ZWNjMjRhYTAyM2U1MTZlMGVhYmJlYzYxYjgiCitTUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiNDAxNjJhNzA2YzU2Zjc1OTJkMDhmZDUyZWY1NTExY2I3YWMxOTFmMzU5
M2NmMDczMDZhMGE1NTRjNjI4MWZjZiIKIFVQU1RSRUFNX0NIRUNLX1VSSSA9ICJodHRwczovL3Nv
dXJjZWZvcmdlLm5ldC9wcm9qZWN0cy9zd2lnL2ZpbGVzL3N3aWcvIgogVVBTVFJFQU1fQ0hFQ0tf
UkVHRVggPSAic3dpZy0oP1A8cHZlcj5cZCsoXC5cZCspKykiCiAKLS0gCjIuNDcuMQoK

--===============1787950786567042188==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/swig: SRC_URI changed from "https://downloads.sourceforge.net/swig/swig-4.3.1.tar.gz file://determinism.patch" to "https://downloads.sourceforge.net/swig/swig-4.4.1.tar.gz file://determinism.patch"
packages/x86-64-v3-poky-linux/swig: PKGV changed from 4.3.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/swig: PV changed from "4.3.1" to "4.4.1"
packages/x86-64-v3-poky-linux/swig/swig-dbg: PKGSIZE changed from 11433416 to 11434192 (+0%)
packages/x86-64-v3-poky-linux/swig/swig-dbg: PKGV changed from 4.3.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/swig/swig-dbg: PV changed from "4.3.1" to "4.4.1"
packages/x86-64-v3-poky-linux/swig/swig-dev: PKGV changed from 4.3.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/swig/swig-dev: PV changed from "4.3.1" to "4.4.1"
packages/x86-64-v3-poky-linux/swig/swig-doc: PKGV changed from 4.3.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/swig/swig-doc: PV changed from "4.3.1" to "4.4.1"
packages/x86-64-v3-poky-linux/swig/swig-locale: PKGV changed from 4.3.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/swig/swig-locale: PV changed from "4.3.1" to "4.4.1"
packages/x86-64-v3-poky-linux/swig/swig-src: FILELIST: directory renamed /usr/src/debug/swig/4.3.1/Source/DOH -> /usr/src/debug/swig/4.4.1/Source/DOH, directory renamed /usr/src/debug/swig/4.3.1/Source/Doxygen -> /usr/src/debug/swig/4.4.1/Source/Doxygen, directory renamed /usr/src/debug/swig/4.3.1/Source/Preprocessor -> /usr/src/debug/swig/4.4.1/Source/Preprocessor, directory renamed /usr/src/debug/swig/4.3.1/Source/CParse -> /usr/src/debug/swig/4.4.1/Source/CParse, directory renamed /usr/src/debug/swig/4.3.1/Source/Swig -> /usr/src/debug/swig/4.4.1/Source/Swig, removed "/usr/src/debug/swig/4.3.1/Source/Modules/ruby.cxx /usr/src/debug/swig/4.3.1/Source/Modules/main.cxx /usr/src/debug/swig/4.3.1/Source/Modules/java.cxx /usr/src/debug/swig/4.3.1/Source/Modules/emit.cxx /usr/src/debug/swig/4.3.1/Source/Modules/lang.cxx /usr/src/debug/swig/4.3.1/Source/Modules/tcl8.cxx /usr/src/debug/swig/4.3.1/Source/Modules/csharp.cxx /usr/src/debug/swig/4.3.1/Source/Modules/nested.cxx /usr/src/debug/s
 wig/4.3.1/Source/Modules/octave.cxx /usr/src/debug/swig/4.3.1/Source/Modules/python.cxx /usr/src/debug/swig/4.3.1/Source/Modules/scilab.cxx /usr/src/debug/swig/4.3.1/Source/Modules/allocate.cxx /usr/src/debug/swig/4.3.1/Source/Modules/mzscheme.cxx /usr/src/debug/swig/4.3.1/Source/Modules/typepass.cxx /usr/src/debug/swig/4.3.1/Source/Modules/directors.cxx /usr/src/debug/swig/4.3.1/Source/Modules/c.cxx /usr/src/debug/swig/4.3.1/Source/Modules/go.cxx /usr/src/debug/swig/4.3.1/Source/Modules/contract.cxx /usr/src/debug/swig/4.3.1/Source/Modules/xml.cxx /usr/src/debug/swig/4.3.1/Source/Modules/overload.cxx /usr/src/debug/swig/4.3.1/Source/Modules/php.cxx /usr/src/debug/swig/4.3.1/Source/Modules/javascript.cxx /usr/src/debug/swig/4.3.1/Source/Modules/swigmain.cxx /usr/src/debug/swig/4.3.1/Source/Modules/d.cxx /usr/src/debug/swig/4.3.1/Source/Modules/swigmod.h /usr/src/debug/swig/4.3.1/Source/Modules/r.cxx /usr/src/debug/swig/4.3.1/Source/Modules/lua.cxx /usr/src/debug/swig/4.3.1/Source/Mo
 dules/interface.cxx /usr/src/debug/swig/4.3.1/Source/Modules/guile.cxx /usr/src/debug/swig/4.3.1/Source/Modules/ocaml.cxx /usr/src/debug/swig/4.3.1/Source/Modules/perl5.cxx /usr/src/debug/swig/4.3.1/Source/Modules/utils.cxx", added "/usr/src/debug/swig/4.4.1/Source/Modules/ruby.cxx /usr/src/debug/swig/4.4.1/Source/Modules/main.cxx /usr/src/debug/swig/4.4.1/Source/Modules/java.cxx /usr/src/debug/swig/4.4.1/Source/Modules/emit.cxx /usr/src/debug/swig/4.4.1/Source/Modules/lang.cxx /usr/src/debug/swig/4.4.1/Source/Modules/tcl8.cxx /usr/src/debug/swig/4.4.1/Source/Modules/csharp.cxx /usr/src/debug/swig/4.4.1/Source/Modules/nested.cxx /usr/src/debug/swig/4.4.1/Source/Modules/octave.cxx /usr/src/debug/swig/4.4.1/Source/Modules/python.cxx /usr/src/debug/swig/4.4.1/Source/Modules/scilab.cxx /usr/src/debug/swig/4.4.1/Source/Modules/allocate.cxx /usr/src/debug/swig/4.4.1/Source/Modules/typepass.cxx /usr/src/debug/swig/4.4.1/Source/Modules/directors.cxx /usr/src/debug/swig/4.4.1/Source/Modules/
 c.cxx /usr/src/debug/swig/4.4.1/Source/Modules/go.cxx /usr/src/debug/swig/4.4.1/Source/Modules/contract.cxx /usr/src/debug/swig/4.4.1/Source/Modules/xml.cxx /usr/src/debug/swig/4.4.1/Source/Modules/overload.cxx /usr/src/debug/swig/4.4.1/Source/Modules/php.cxx /usr/src/debug/swig/4.4.1/Source/Modules/javascript.cxx /usr/src/debug/swig/4.4.1/Source/Modules/swigmain.cxx /usr/src/debug/swig/4.4.1/Source/Modules/d.cxx /usr/src/debug/swig/4.4.1/Source/Modules/swigmod.h /usr/src/debug/swig/4.4.1/Source/Modules/r.cxx /usr/src/debug/swig/4.4.1/Source/Modules/lua.cxx /usr/src/debug/swig/4.4.1/Source/Modules/interface.cxx /usr/src/debug/swig/4.4.1/Source/Modules/guile.cxx /usr/src/debug/swig/4.4.1/Source/Modules/ocaml.cxx /usr/src/debug/swig/4.4.1/Source/Modules/perl5.cxx /usr/src/debug/swig/4.4.1/Source/Modules/utils.cxx"
packages/x86-64-v3-poky-linux/swig/swig-src: PKGSIZE changed from 4231918 to 4217304 (-0%)
packages/x86-64-v3-poky-linux/swig/swig-src: PKGV changed from 4.3.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/swig/swig-src: PV changed from "4.3.1" to "4.4.1"
packages/x86-64-v3-poky-linux/swig/swig-staticdev: PKGV changed from 4.3.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/swig/swig-staticdev: PV changed from "4.3.1" to "4.4.1"
packages/x86-64-v3-poky-linux/swig/swig: FILELIST: directory renamed /usr/share/swig/4.3.1/ocaml -> /usr/share/swig/4.4.1/ocaml, directory renamed /usr/share/swig/4.3.1/csharp -> /usr/share/swig/4.4.1/csharp, directory renamed /usr/share/swig/4.3.1/ruby -> /usr/share/swig/4.4.1/ruby, directory renamed /usr/share/swig/4.3.1/javascript -> /usr/share/swig/4.4.1/javascript, directory renamed /usr/share/swig/4.3.1/scilab -> /usr/share/swig/4.4.1/scilab, directory renamed /usr/share/swig/4.3.1/xml -> /usr/share/swig/4.4.1/xml, directory renamed /usr/share/swig/4.3.1/lua -> /usr/share/swig/4.4.1/lua, directory renamed /usr/share/swig/4.3.1/guile -> /usr/share/swig/4.4.1/guile, directory renamed /usr/share/swig/4.3.1/std -> /usr/share/swig/4.4.1/std, directory renamed /usr/share/swig/4.3.1/go -> /usr/share/swig/4.4.1/go, directory renamed /usr/share/swig/4.3.1/javascript/jsc -> /usr/share/swig/4.4.1/javascript/jsc, directory renamed /usr/share/swig/4.3.1/javascript/napi -> /usr/share/swig/4.
 4.1/javascript/napi, directory renamed /usr/share/swig/4.3.1/php -> /usr/share/swig/4.4.1/php, directory renamed /usr/share/swig/4.3.1 -> /usr/share/swig/4.4.1, directory renamed /usr/share/swig/4.3.1/java -> /usr/share/swig/4.4.1/java, directory renamed /usr/share/swig/4.3.1/javascript/v8 -> /usr/share/swig/4.4.1/javascript/v8, directory renamed /usr/share/swig/4.3.1/perl5 -> /usr/share/swig/4.4.1/perl5, directory renamed /usr/share/swig/4.3.1/r -> /usr/share/swig/4.4.1/r, directory renamed /usr/share/swig/4.3.1/c -> /usr/share/swig/4.4.1/c, directory renamed /usr/share/swig/4.3.1/d -> /usr/share/swig/4.4.1/d, directory renamed /usr/share/swig/4.3.1/octave -> /usr/share/swig/4.4.1/octave, directory renamed /usr/share/swig/4.3.1/typemaps -> /usr/share/swig/4.4.1/typemaps, removed "/usr/share/swig/4.3.1/python/std_wiostream.i /usr/share/swig/4.3.1/tcl/cpointer.i /usr/share/swig/4.3.1/mzscheme/argcargv.i /usr/share/swig/4.3.1/python/implicit.i /usr/share/swig/4.3.1/python/typemaps.i /
 usr/share/swig/4.3.1/python/pystdcommon.swg /usr/share/swig/4.3.1/python/factory.i /usr/share/swig/4.3.1/python/pyapi.swg /usr/share/swig/4.3.1/python/pydocs.swg /usr/share/swig/4.3.1/mzscheme/std_deque.i /usr/share/swig/4.3.1/python/std_ios.i /usr/share/swig/4.3.1/python/std_complex.i /usr/share/swig/4.3.1/python/std_sstream.i /usr/share/swig/4.3.1/python/std_wstreambuf.i /usr/share/swig/4.3.1/python/std_wstring.i /usr/share/swig/4.3.1/python/std_string_view.i /usr/share/swig/4.3.1/mzscheme/mzscheme.swg /usr/share/swig/4.3.1/python/pyuserdir.swg /usr/share/swig/4.3.1/python/std_shared_ptr.i /usr/share/swig/4.3.1/python/std_unique_ptr.i /usr/share/swig/4.3.1/mzscheme/std_map.i /usr/share/swig/4.3.1/tcl/argcargv.i /usr/share/swig/4.3.1/mzscheme/cdata.i /usr/share/swig/4.3.1/tcl/carrays.i /usr/share/swig/4.3.1/python/pycomplex.swg /usr/share/swig/4.3.1/mzscheme/std_auto_ptr.i /usr/share/swig/4.3.1/python/std_unordered_multimap.i /usr/share/swig/4.3.1/python/std_deque.i /usr/share/swig
 /4.3.1/tcl/std_auto_ptr.i /usr/share/swig/4.3.1/tcl/std_string.i /usr/share/swig/4.3.1/python/cpointer.i /usr/share/swig/4.3.1/tcl/cstring.i /usr/share/swig/4.3.1/python/stl.i /usr/share/swig/4.3.1/python/pybuffer.i /usr/share/swig/4.3.1/python/swigmove.i /usr/share/swig/4.3.1/tcl/std_unique_ptr.i /usr/share/swig/4.3.1/tcl/tclinterp.i /usr/share/swig/4.3.1/python/pystrings.swg /usr/share/swig/4.3.1/tcl/tclruntime.swg /usr/share/swig/4.3.1/tcl/tclkw.swg /usr/share/swig/4.3.1/python/std_unordered_multiset.i /usr/share/swig/4.3.1/tcl/std_pair.i /usr/share/swig/4.3.1/python/pytypemaps.swg /usr/share/swig/4.3.1/python/director_py_mutex.swg /usr/share/swig/4.3.1/python/std_alloc.i /usr/share/swig/4.3.1/python/builtin.swg /usr/share/swig/4.3.1/python/std_streambuf.i /usr/share/swig/4.3.1/mzscheme/std_pair.i /usr/share/swig/4.3.1/python/carrays.i /usr/share/swig/4.3.1/python/pyabc.i /usr/share/swig/4.3.1/python/wchar.i /usr/share/swig/4.3.1/python/cwstring.i /usr/share/swig/4.3.1/tcl/std_st
 ring_view.i /usr/share/swig/4.3.1/tcl/tclerrors.swg /usr/share/swig/4.3.1/python/pyinit.swg /usr/share/swig/4.3.1/python/python.swg /usr/share/swig/4.3.1/tcl/std_wstring.i /usr/share/swig/4.3.1/mzscheme/std_vector.i /usr/share/swig/4.3.1/python/README /usr/share/swig/4.3.1/python/pyclasses.swg /usr/share/swig/4.3.1/tcl/std_deque.i /usr/share/swig/4.3.1/tcl/wish.i /usr/share/swig/4.3.1/tcl/tclmacros.swg /usr/share/swig/4.3.1/mzscheme/Makefile /usr/share/swig/4.3.1/python/director.swg /usr/share/swig/4.3.1/mzscheme/stl.i /usr/share/swig/4.3.1/python/std_pair.i /usr/share/swig/4.3.1/python/exception.i /usr/share/swig/4.3.1/python/complex.i /usr/share/swig/4.3.1/python/std_vector.i /usr/share/swig/4.3.1/tcl/attribute.i /usr/share/swig/4.3.1/tcl/tclinit.swg /usr/share/swig/4.3.1/mzscheme/std_unique_ptr.i /usr/share/swig/4.3.1/python/file.i /usr/share/swig/4.3.1/python/pyruntime.swg /usr/share/swig/4.3.1/python/pythonkw.swg /usr/share/swig/4.3.1/tcl/typemaps.i /usr/share/swig/4.3.1/python
 /std_basic_string.i /usr/share/swig/4.3.1/tcl/Makefile.in /usr/share/swig/4.3.1/python/std_multiset.i /usr/share/swig/4.3.1/python/ccomplex.i /usr/share/swig/4.3.1/python/std_array.i /usr/share/swig/4.3.1/python/pythreads.swg /usr/share/swig/4.3.1/python/pyiterators.swg /usr/share/swig/4.3.1/python/std_unordered_set.i /usr/share/swig/4.3.1/python/std_container.i /usr/share/swig/4.3.1/tcl/tclresult.i /usr/share/swig/4.3.1/python/pywstrings.swg /usr/share/swig/4.3.1/python/std_vectora.i /usr/share/swig/4.3.1/tcl/tclwstrings.swg /usr/share/swig/4.3.1/tcl/tclfragments.swg /usr/share/swig/4.3.1/python/Makefile.in /usr/share/swig/4.3.1/mzscheme/std_string.i /usr/share/swig/4.3.1/tcl/exception.i /usr/share/swig/4.3.1/python/pyname_compat.i /usr/share/swig/4.3.1/python/std_iostream.i /usr/share/swig/4.3.1/python/std_wsstream.i /usr/share/swig/4.3.1/tcl/stl.i /usr/share/swig/4.3.1/tcl/tclopers.swg /usr/share/swig/4.3.1/python/std_map.i /usr/share/swig/4.3.1/tcl/tcltypemaps.swg /usr/share/swi
 g/4.3.1/mzscheme/swigmove.i /usr/share/swig/4.3.1/tcl/std_except.i /usr/share/swig/4.3.1/python/std_set.i /usr/share/swig/4.3.1/python/pybackward.swg /usr/share/swig/4.3.1/tcl/tclstrings.swg /usr/share/swig/4.3.1/tcl/tclapi.swg /usr/share/swig/4.3.1/tcl/tclrun.swg /usr/share/swig/4.3.1/python/pyhead.swg /usr/share/swig/4.3.1/python/std_multimap.i /usr/share/swig/4.3.1/python/std_filesystem.i /usr/share/swig/4.3.1/python/embed.i /usr/share/swig/4.3.1/tcl/std_map.i /usr/share/swig/4.3.1/tcl/tclprimtypes.swg /usr/share/swig/4.3.1/mzscheme/mzrun.swg /usr/share/swig/4.3.1/python/pyfragments.swg /usr/share/swig/4.3.1/python/pyprimtypes.swg /usr/share/swig/4.3.1/tcl/cmalloc.i /usr/share/swig/4.3.1/python/std_auto_ptr.i /usr/share/swig/4.3.1/python/std_list.i /usr/share/swig/4.3.1/tcl/swigmove.i /usr/share/swig/4.3.1/tcl/tcluserdir.swg /usr/share/swig/4.3.1/python/argcargv.i /usr/share/swig/4.3.1/python/pyerrors.swg /usr/share/swig/4.3.1/mzscheme/std_common.i /usr/share/swig/4.3.1/tcl/facto
 ry.i /usr/share/swig/4.3.1/mzscheme/typemaps.i /usr/share/swig/4.3.1/python/pyopers.swg /usr/share/swig/4.3.1/python/boost_shared_ptr.i /usr/share/swig/4.3.1/python/attribute.i /usr/share/swig/4.3.1/python/pyrun.swg /usr/share/swig/4.3.1/python/cmalloc.i /usr/share/swig/4.3.1/tcl/cwstring.i /usr/share/swig/4.3.1/python/cstring.i /usr/share/swig/4.3.1/tcl/tclsh.i /usr/share/swig/4.3.1/tcl/std_vector.i /usr/share/swig/4.3.1/python/pycontainer.swg /usr/share/swig/4.3.1/tcl/std_common.i /usr/share/swig/4.3.1/python/pymacros.swg /usr/share/swig/4.3.1/python/std_unordered_map.i /usr/share/swig/4.3.1/tcl/tcl8.swg /usr/share/swig/4.3.1/python/std_common.i /usr/share/swig/4.3.1/python/std_except.i /usr/share/swig/4.3.1/python/std_string.i /usr/share/swig/4.3.1/python/std_wios.i /usr/share/swig/4.3.1/python/std_char_traits.i", added "/usr/share/swig/4.4.1/python/std_wiostream.i /usr/share/swig/4.4.1/tcl/cpointer.i /usr/share/swig/4.4.1/python/implicit.i /usr/share/swig/4.4.1/python/typemaps.i
  /usr/share/swig/4.4.1/python/pystdcommon.swg /usr/share/swig/4.4.1/python/factory.i /usr/share/swig/4.4.1/python/pyapi.swg /usr/share/swig/4.4.1/python/pydocs.swg /usr/share/swig/4.4.1/python/std_ios.i /usr/share/swig/4.4.1/python/std_complex.i /usr/share/swig/4.4.1/python/std_sstream.i /usr/share/swig/4.4.1/python/std_wstreambuf.i /usr/share/swig/4.4.1/python/std_wstring.i /usr/share/swig/4.4.1/python/std_string_view.i /usr/share/swig/4.4.1/python/pyuserdir.swg /usr/share/swig/4.4.1/python/std_unique_ptr.i /usr/share/swig/4.4.1/python/std_shared_ptr.i /usr/share/swig/4.4.1/tcl/argcargv.i /usr/share/swig/4.4.1/tcl/carrays.i /usr/share/swig/4.4.1/python/pycomplex.swg /usr/share/swig/4.4.1/python/std_unordered_multimap.i /usr/share/swig/4.4.1/python/std_deque.i /usr/share/swig/4.4.1/tcl/std_auto_ptr.i /usr/share/swig/4.4.1/tcl/std_string.i /usr/share/swig/4.4.1/python/cpointer.i /usr/share/swig/4.4.1/tcl/cstring.i /usr/share/swig/4.4.1/python/stl.i /usr/share/swig/4.4.1/python/pybuff
 er.i /usr/share/swig/4.4.1/python/swigmove.i /usr/share/swig/4.4.1/tcl/std_unique_ptr.i /usr/share/swig/4.4.1/tcl/tclinterp.i /usr/share/swig/4.4.1/python/pystrings.swg /usr/share/swig/4.4.1/tcl/tclruntime.swg /usr/share/swig/4.4.1/tcl/tclkw.swg /usr/share/swig/4.4.1/python/std_unordered_multiset.i /usr/share/swig/4.4.1/tcl/std_pair.i /usr/share/swig/4.4.1/python/pytypemaps.swg /usr/share/swig/4.4.1/python/director_py_mutex.swg /usr/share/swig/4.4.1/python/std_alloc.i /usr/share/swig/4.4.1/python/builtin.swg /usr/share/swig/4.4.1/python/std_streambuf.i /usr/share/swig/4.4.1/python/carrays.i /usr/share/swig/4.4.1/python/pyabc.i /usr/share/swig/4.4.1/python/wchar.i /usr/share/swig/4.4.1/python/cwstring.i /usr/share/swig/4.4.1/tcl/std_string_view.i /usr/share/swig/4.4.1/tcl/tclerrors.swg /usr/share/swig/4.4.1/python/pyinit.swg /usr/share/swig/4.4.1/python/python.swg /usr/share/swig/4.4.1/tcl/std_wstring.i /usr/share/swig/4.4.1/python/README /usr/share/swig/4.4.1/python/pyclasses.swg /u
 sr/share/swig/4.4.1/tcl/std_deque.i /usr/share/swig/4.4.1/tcl/wish.i /usr/share/swig/4.4.1/tcl/tclmacros.swg /usr/share/swig/4.4.1/python/director.swg /usr/share/swig/4.4.1/python/std_pair.i /usr/share/swig/4.4.1/python/exception.i /usr/share/swig/4.4.1/python/complex.i /usr/share/swig/4.4.1/python/std_vector.i /usr/share/swig/4.4.1/tcl/attribute.i /usr/share/swig/4.4.1/tcl/tclinit.swg /usr/share/swig/4.4.1/python/file.i /usr/share/swig/4.4.1/python/pyruntime.swg /usr/share/swig/4.4.1/python/pythonkw.swg /usr/share/swig/4.4.1/tcl/typemaps.i /usr/share/swig/4.4.1/python/std_basic_string.i /usr/share/swig/4.4.1/tcl/Makefile.in /usr/share/swig/4.4.1/python/std_multiset.i /usr/share/swig/4.4.1/python/ccomplex.i /usr/share/swig/4.4.1/python/std_array.i /usr/share/swig/4.4.1/python/pythreads.swg /usr/share/swig/4.4.1/python/pyiterators.swg /usr/share/swig/4.4.1/python/std_unordered_set.i /usr/share/swig/4.4.1/python/std_container.i /usr/share/swig/4.4.1/tcl/tclresult.i /usr/share/swig/4.4
 .1/python/pywstrings.swg /usr/share/swig/4.4.1/python/std_vectora.i /usr/share/swig/4.4.1/tcl/tclwstrings.swg /usr/share/swig/4.4.1/tcl/tclfragments.swg /usr/share/swig/4.4.1/python/Makefile.in /usr/share/swig/4.4.1/tcl/exception.i /usr/share/swig/4.4.1/python/std_iostream.i /usr/share/swig/4.4.1/python/std_wsstream.i /usr/share/swig/4.4.1/tcl/stl.i /usr/share/swig/4.4.1/tcl/tclopers.swg /usr/share/swig/4.4.1/python/std_map.i /usr/share/swig/4.4.1/tcl/tcltypemaps.swg /usr/share/swig/4.4.1/tcl/std_except.i /usr/share/swig/4.4.1/python/std_set.i /usr/share/swig/4.4.1/tcl/tclincludes.swg /usr/share/swig/4.4.1/python/pybackward.swg /usr/share/swig/4.4.1/tcl/tclstrings.swg /usr/share/swig/4.4.1/tcl/tclapi.swg /usr/share/swig/4.4.1/tcl/tclrun.swg /usr/share/swig/4.4.1/python/pyhead.swg /usr/share/swig/4.4.1/python/std_multimap.i /usr/share/swig/4.4.1/python/std_filesystem.i /usr/share/swig/4.4.1/python/embed.i /usr/share/swig/4.4.1/tcl/std_map.i /usr/share/swig/4.4.1/tcl/tclprimtypes.swg 
 /usr/share/swig/4.4.1/python/pyfragments.swg /usr/share/swig/4.4.1/python/pyprimtypes.swg /usr/share/swig/4.4.1/tcl/cmalloc.i /usr/share/swig/4.4.1/python/std_auto_ptr.i /usr/share/swig/4.4.1/python/std_list.i /usr/share/swig/4.4.1/tcl/swigmove.i /usr/share/swig/4.4.1/tcl/tcluserdir.swg /usr/share/swig/4.4.1/python/argcargv.i /usr/share/swig/4.4.1/python/pyerrors.swg /usr/share/swig/4.4.1/tcl/factory.i /usr/share/swig/4.4.1/python/pyopers.swg /usr/share/swig/4.4.1/python/boost_shared_ptr.i /usr/share/swig/4.4.1/python/attribute.i /usr/share/swig/4.4.1/python/pyrun.swg /usr/share/swig/4.4.1/python/cmalloc.i /usr/share/swig/4.4.1/tcl/cwstring.i /usr/share/swig/4.4.1/python/cstring.i /usr/share/swig/4.4.1/tcl/tclsh.i /usr/share/swig/4.4.1/tcl/std_vector.i /usr/share/swig/4.4.1/python/pycontainer.swg /usr/share/swig/4.4.1/tcl/std_common.i /usr/share/swig/4.4.1/python/pymacros.swg /usr/share/swig/4.4.1/python/std_unordered_map.i /usr/share/swig/4.4.1/tcl/tcl8.swg /usr/share/swig/4.4.1/py
 thon/std_common.i /usr/share/swig/4.4.1/python/std_except.i /usr/share/swig/4.4.1/python/std_string.i /usr/share/swig/4.4.1/python/std_wios.i /usr/share/swig/4.4.1/python/std_char_traits.i"
packages/x86-64-v3-poky-linux/swig/swig: PKGSIZE changed from 5189423 to 5101352 (-2%)
packages/x86-64-v3-poky-linux/swig/swig: PKGV changed from 4.3.1 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/swig/swig: PV changed from "4.3.1" to "4.4.1"
Changes to packages/x86-64-v3-poky-linux/swig (sysroot):
  /usr/share/swig/4.3.1 moved to /usr/share/swig/4.4.1
  /usr/share/swig/4.4.1/tcl/tclincludes.swg was added
  /usr/share/swig/4.3.1/mzscheme was removed
  /usr/share/swig/4.3.1/mzscheme/argcargv.i was removed
  /usr/share/swig/4.3.1/mzscheme/cdata.i was removed
  /usr/share/swig/4.3.1/mzscheme/Makefile was removed
  /usr/share/swig/4.3.1/mzscheme/mzrun.swg was removed
  /usr/share/swig/4.3.1/mzscheme/mzscheme.swg was removed
  /usr/share/swig/4.3.1/mzscheme/std_auto_ptr.i was removed
  /usr/share/swig/4.3.1/mzscheme/std_common.i was removed
  /usr/share/swig/4.3.1/mzscheme/std_deque.i was removed
  /usr/share/swig/4.3.1/mzscheme/std_map.i was removed
  /usr/share/swig/4.3.1/mzscheme/std_pair.i was removed
  /usr/share/swig/4.3.1/mzscheme/std_string.i was removed
  /usr/share/swig/4.3.1/mzscheme/std_unique_ptr.i was removed
  /usr/share/swig/4.3.1/mzscheme/std_vector.i was removed
  /usr/share/swig/4.3.1/mzscheme/stl.i was removed
  /usr/share/swig/4.3.1/mzscheme/swigmove.i was removed
  /usr/share/swig/4.3.1/mzscheme/typemaps.i was removed
  /usr/share/swig/4.3.1/python/pyname_compat.i was removed

--===============1787950786567042188==--

