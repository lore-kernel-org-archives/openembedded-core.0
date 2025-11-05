Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE3B3CCFA1F
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:34 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2373.1762384594247576122
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=mseuDAnP;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=F4SuVWwi;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019a564ec32b-c10d3ffc-6776-4f8e-a351-0acd5caadfdd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384593;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=BbFABbE5jz2ED1Z2S6Oay3c8ZQlxVdf16MI8i16rVGI=;
	b=mseuDAnPBCVVJiNDjf0uTrG8/uxkOsrmeEsSxkwx+MaEhNwC8tUQavY+fGY9Jobz
	uaBNfw7K42Mgz2WK8WPbhHgsZxN+H7/BPAKW1bnkwwNiKaPoTc57WW5vYtilxuu8EwX
	TtJ7Omo062anJ1bf+XXxCccl1tT3BlfVAPCEa5nU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384593;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=BbFABbE5jz2ED1Z2S6Oay3c8ZQlxVdf16MI8i16rVGI=;
	b=F4SuVWwiFbj3DO9iP+56sxSjDhxgBuTdVreNay8RpyMwYUrMnmp/5jnbHOQ9miV6
	kJcgOVLX3RhKSMkV4sorkv5GWYzjbfNQC6RMQlyM/UMJH+VH2NrgFJCq5FGkMaP7/7d
	cV+3koHBInRXYNgP5hsB2HIvB2F2qzjNLgwP7uG4=
Content-Type: multipart/mixed; boundary="===============0001753192971625997=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] swig: upgrading to 4.4.0 SUCCEEDED
Message-ID: <0101019a564ec32b-c10d3ffc-6776-4f8e-a351-0acd5caadfdd-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:33 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225861

--===============0001753192971625997==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *swig* to *4.4.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-swig-upgrade-4.3.1-4.4.0.patch
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
From 4ea4e45d34a0fcc734622fdb5137d498aefa0fe1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 18:36:00 +0000
Subject: [PATCH] swig: upgrade 4.3.1 -> 4.4.0

---
 meta/recipes-devtools/swig/swig/determinism.patch           | 2 +-
 meta/recipes-devtools/swig/{swig_4.3.1.bb => swig_4.4.0.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/swig/{swig_4.3.1.bb => swig_4.4.0.bb} (94%)

diff --git a/meta/recipes-devtools/swig/swig/determinism.patch b/meta/recipes-devtools/swig/swig/determinism.patch
index 4359281bbb..cd87c4c467 100644
--- a/meta/recipes-devtools/swig/swig/determinism.patch
+++ b/meta/recipes-devtools/swig/swig/determinism.patch
@@ -1,4 +1,4 @@
-From 1cd6f0cc21fc977a710e8d30c3d2ebfee3c72dc0 Mon Sep 17 00:00:00 2001
+From 796f550c5158e9f9efb3d5f543a1e6934f4221de Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Mon, 1 Mar 2021 00:11:10 +0000
 Subject: [PATCH] swig: Fix reproducibility issue
diff --git a/meta/recipes-devtools/swig/swig_4.3.1.bb b/meta/recipes-devtools/swig/swig_4.4.0.bb
similarity index 94%
rename from meta/recipes-devtools/swig/swig_4.3.1.bb
rename to meta/recipes-devtools/swig/swig_4.4.0.bb
index dd979580a1..93d06b6a5f 100644
--- a/meta/recipes-devtools/swig/swig_4.3.1.bb
+++ b/meta/recipes-devtools/swig/swig_4.4.0.bb
@@ -15,7 +15,7 @@ DEPENDS = "libpcre2 bison-native"
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
             file://determinism.patch \
            "
-SRC_URI[sha256sum] = "44fc829f70f1e17d635a2b4d69acab38896699ecc24aa023e516e0eabbec61b8"
+SRC_URI[sha256sum] = "c3f8e5dcd68c18aa19847b33b0a1bb92f07e904c53ae9cf5ae4ff8727a72927e"
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/swig/files/swig/"
 UPSTREAM_CHECK_REGEX = "swig-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.47.1


--===============0001753192971625997==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/swig/swig: FILELIST: directory renamed /usr/share/swig/4.3.1/javascript/v8 -> /usr/share/swig/4.4.0/javascript/v8, directory renamed /usr/share/swig/4.3.1/perl5 -> /usr/share/swig/4.4.0/perl5, directory renamed /usr/share/swig/4.3.1/guile -> /usr/share/swig/4.4.0/guile, directory renamed /usr/share/swig/4.3.1/javascript/jsc -> /usr/share/swig/4.4.0/javascript/jsc, directory renamed /usr/share/swig/4.3.1/ruby -> /usr/share/swig/4.4.0/ruby, directory renamed /usr/share/swig/4.3.1/typemaps -> /usr/share/swig/4.4.0/typemaps, directory renamed /usr/share/swig/4.3.1/javascript -> /usr/share/swig/4.4.0/javascript, directory renamed /usr/share/swig/4.3.1/javascript/napi -> /usr/share/swig/4.4.0/javascript/napi, directory renamed /usr/share/swig/4.3.1/c -> /usr/share/swig/4.4.0/c, directory renamed /usr/share/swig/4.3.1/scilab -> /usr/share/swig/4.4.0/scilab, directory renamed /usr/share/swig/4.3.1/php -> /usr/share/swig/4.4.0/php, directory renamed /usr/share/sw
 ig/4.3.1/d -> /usr/share/swig/4.4.0/d, directory renamed /usr/share/swig/4.3.1/xml -> /usr/share/swig/4.4.0/xml, directory renamed /usr/share/swig/4.3.1/r -> /usr/share/swig/4.4.0/r, directory renamed /usr/share/swig/4.3.1/std -> /usr/share/swig/4.4.0/std, directory renamed /usr/share/swig/4.3.1/lua -> /usr/share/swig/4.4.0/lua, directory renamed /usr/share/swig/4.3.1 -> /usr/share/swig/4.4.0, directory renamed /usr/share/swig/4.3.1/go -> /usr/share/swig/4.4.0/go, directory renamed /usr/share/swig/4.3.1/ocaml -> /usr/share/swig/4.4.0/ocaml, directory renamed /usr/share/swig/4.3.1/octave -> /usr/share/swig/4.4.0/octave, directory renamed /usr/share/swig/4.3.1/java -> /usr/share/swig/4.4.0/java, directory renamed /usr/share/swig/4.3.1/csharp -> /usr/share/swig/4.4.0/csharp, removed "/usr/share/swig/4.3.1/python/std_shared_ptr.i /usr/share/swig/4.3.1/tcl/swigmove.i /usr/share/swig/4.3.1/python/pymacros.swg /usr/share/swig/4.3.1/tcl/tclopers.swg /usr/share/swig/4.3.1/mzscheme/std_unique
 _ptr.i /usr/share/swig/4.3.1/python/README /usr/share/swig/4.3.1/tcl/wish.i /usr/share/swig/4.3.1/python/pyclasses.swg /usr/share/swig/4.3.1/python/std_common.i /usr/share/swig/4.3.1/python/std_except.i /usr/share/swig/4.3.1/python/std_string.i /usr/share/swig/4.3.1/tcl/tclmacros.swg /usr/share/swig/4.3.1/tcl/tclfragments.swg /usr/share/swig/4.3.1/python/pytypemaps.swg /usr/share/swig/4.3.1/python/pyhead.swg /usr/share/swig/4.3.1/python/pyrun.swg /usr/share/swig/4.3.1/tcl/cstring.i /usr/share/swig/4.3.1/mzscheme/swigmove.i /usr/share/swig/4.3.1/tcl/std_unique_ptr.i /usr/share/swig/4.3.1/python/std_container.i /usr/share/swig/4.3.1/tcl/tcltypemaps.swg /usr/share/swig/4.3.1/python/boost_shared_ptr.i /usr/share/swig/4.3.1/python/std_unordered_multimap.i /usr/share/swig/4.3.1/python/pydocs.swg /usr/share/swig/4.3.1/python/carrays.i /usr/share/swig/4.3.1/python/std_ios.i /usr/share/swig/4.3.1/tcl/Makefile.in /usr/share/swig/4.3.1/python/pyopers.swg /usr/share/swig/4.3.1/tcl/std_wstring.i
  /usr/share/swig/4.3.1/tcl/cmalloc.i /usr/share/swig/4.3.1/python/exception.i /usr/share/swig/4.3.1/tcl/tclerrors.swg /usr/share/swig/4.3.1/python/std_streambuf.i /usr/share/swig/4.3.1/python/pyruntime.swg /usr/share/swig/4.3.1/tcl/std_auto_ptr.i /usr/share/swig/4.3.1/tcl/tclruntime.swg /usr/share/swig/4.3.1/python/embed.i /usr/share/swig/4.3.1/mzscheme/Makefile /usr/share/swig/4.3.1/python/std_deque.i /usr/share/swig/4.3.1/tcl/tclresult.i /usr/share/swig/4.3.1/python/argcargv.i /usr/share/swig/4.3.1/python/pyinit.swg /usr/share/swig/4.3.1/python/std_iostream.i /usr/share/swig/4.3.1/python/std_wsstream.i /usr/share/swig/4.3.1/python/std_set.i /usr/share/swig/4.3.1/tcl/std_string_view.i /usr/share/swig/4.3.1/python/typemaps.i /usr/share/swig/4.3.1/tcl/tclapi.swg /usr/share/swig/4.3.1/python/std_complex.i /usr/share/swig/4.3.1/python/std_sstream.i /usr/share/swig/4.3.1/python/std_wstring.i /usr/share/swig/4.3.1/python/file.i /usr/share/swig/4.3.1/tcl/tclrun.swg /usr/share/swig/4.3.1/t
 cl/tclinit.swg /usr/share/swig/4.3.1/tcl/std_deque.i /usr/share/swig/4.3.1/python/cstring.i /usr/share/swig/4.3.1/python/pyiterators.swg /usr/share/swig/4.3.1/mzscheme/mzrun.swg /usr/share/swig/4.3.1/python/std_auto_ptr.i /usr/share/swig/4.3.1/tcl/std_common.i /usr/share/swig/4.3.1/tcl/std_vector.i /usr/share/swig/4.3.1/python/std_multimap.i /usr/share/swig/4.3.1/mzscheme/std_string.i /usr/share/swig/4.3.1/mzscheme/cdata.i /usr/share/swig/4.3.1/python/std_list.i /usr/share/swig/4.3.1/python/pycontainer.swg /usr/share/swig/4.3.1/tcl/tclsh.i /usr/share/swig/4.3.1/tcl/argcargv.i /usr/share/swig/4.3.1/python/implicit.i /usr/share/swig/4.3.1/python/pybackward.swg /usr/share/swig/4.3.1/tcl/typemaps.i /usr/share/swig/4.3.1/python/cpointer.i /usr/share/swig/4.3.1/python/std_multiset.i /usr/share/swig/4.3.1/tcl/tclstrings.swg /usr/share/swig/4.3.1/mzscheme/std_auto_ptr.i /usr/share/swig/4.3.1/python/std_array.i /usr/share/swig/4.3.1/mzscheme/std_pair.i /usr/share/swig/4.3.1/python/director.s
 wg /usr/share/swig/4.3.1/python/std_pair.i /usr/share/swig/4.3.1/tcl/cwstring.i /usr/share/swig/4.3.1/python/ccomplex.i /usr/share/swig/4.3.1/python/pystrings.swg /usr/share/swig/4.3.1/python/std_basic_string.i /usr/share/swig/4.3.1/tcl/std_map.i /usr/share/swig/4.3.1/python/builtin.swg /usr/share/swig/4.3.1/python/std_filesystem.i /usr/share/swig/4.3.1/tcl/stl.i /usr/share/swig/4.3.1/mzscheme/mzscheme.swg /usr/share/swig/4.3.1/python/python.swg /usr/share/swig/4.3.1/python/pyfragments.swg /usr/share/swig/4.3.1/python/pyprimtypes.swg /usr/share/swig/4.3.1/python/std_vector.i /usr/share/swig/4.3.1/python/std_unordered_multiset.i /usr/share/swig/4.3.1/python/std_wiostream.i /usr/share/swig/4.3.1/tcl/exception.i /usr/share/swig/4.3.1/python/std_unordered_set.i /usr/share/swig/4.3.1/python/std_wstreambuf.i /usr/share/swig/4.3.1/tcl/carrays.i /usr/share/swig/4.3.1/python/stl.i /usr/share/swig/4.3.1/python/cwstring.i /usr/share/swig/4.3.1/mzscheme/std_common.i /usr/share/swig/4.3.1/python
 /wchar.i /usr/share/swig/4.3.1/python/cmalloc.i /usr/share/swig/4.3.1/python/pybuffer.i /usr/share/swig/4.3.1/python/pywstrings.swg /usr/share/swig/4.3.1/tcl/std_string.i /usr/share/swig/4.3.1/tcl/tcluserdir.swg /usr/share/swig/4.3.1/python/pyname_compat.i /usr/share/swig/4.3.1/python/pyerrors.swg /usr/share/swig/4.3.1/python/Makefile.in /usr/share/swig/4.3.1/tcl/tclprimtypes.swg /usr/share/swig/4.3.1/tcl/tclwstrings.swg /usr/share/swig/4.3.1/python/std_alloc.i /usr/share/swig/4.3.1/tcl/tclinterp.i /usr/share/swig/4.3.1/mzscheme/stl.i /usr/share/swig/4.3.1/python/std_char_traits.i /usr/share/swig/4.3.1/python/swigmove.i /usr/share/swig/4.3.1/mzscheme/std_map.i /usr/share/swig/4.3.1/tcl/std_pair.i /usr/share/swig/4.3.1/python/factory.i /usr/share/swig/4.3.1/mzscheme/argcargv.i /usr/share/swig/4.3.1/python/attribute.i /usr/share/swig/4.3.1/python/std_map.i /usr/share/swig/4.3.1/tcl/factory.i /usr/share/swig/4.3.1/python/director_py_mutex.swg /usr/share/swig/4.3.1/tcl/attribute.i /usr/
 share/swig/4.3.1/python/pyabc.i /usr/share/swig/4.3.1/python/pythreads.swg /usr/share/swig/4.3.1/tcl/cpointer.i /usr/share/swig/4.3.1/tcl/tclkw.swg /usr/share/swig/4.3.1/mzscheme/typemaps.i /usr/share/swig/4.3.1/python/std_vectora.i /usr/share/swig/4.3.1/tcl/tcl8.swg /usr/share/swig/4.3.1/python/pyuserdir.swg /usr/share/swig/4.3.1/tcl/std_except.i /usr/share/swig/4.3.1/mzscheme/std_deque.i /usr/share/swig/4.3.1/python/std_string_view.i /usr/share/swig/4.3.1/python/pystdcommon.swg /usr/share/swig/4.3.1/python/pythonkw.swg /usr/share/swig/4.3.1/mzscheme/std_vector.i /usr/share/swig/4.3.1/python/std_unordered_map.i /usr/share/swig/4.3.1/python/complex.i /usr/share/swig/4.3.1/python/pyapi.swg /usr/share/swig/4.3.1/python/pycomplex.swg /usr/share/swig/4.3.1/python/std_wios.i /usr/share/swig/4.3.1/python/std_unique_ptr.i", added "/usr/share/swig/4.4.0/python/std_shared_ptr.i /usr/share/swig/4.4.0/tcl/swigmove.i /usr/share/swig/4.4.0/python/pymacros.swg /usr/share/swig/4.4.0/tcl/tclopers.s
 wg /usr/share/swig/4.4.0/python/README /usr/share/swig/4.4.0/tcl/wish.i /usr/share/swig/4.4.0/python/pyclasses.swg /usr/share/swig/4.4.0/python/std_common.i /usr/share/swig/4.4.0/python/std_except.i /usr/share/swig/4.4.0/python/std_string.i /usr/share/swig/4.4.0/tcl/tclmacros.swg /usr/share/swig/4.4.0/tcl/tclfragments.swg /usr/share/swig/4.4.0/python/pytypemaps.swg /usr/share/swig/4.4.0/python/pyhead.swg /usr/share/swig/4.4.0/python/pyrun.swg /usr/share/swig/4.4.0/tcl/cstring.i /usr/share/swig/4.4.0/tcl/std_unique_ptr.i /usr/share/swig/4.4.0/python/std_container.i /usr/share/swig/4.4.0/tcl/tcltypemaps.swg /usr/share/swig/4.4.0/python/boost_shared_ptr.i /usr/share/swig/4.4.0/python/std_unordered_multimap.i /usr/share/swig/4.4.0/python/pydocs.swg /usr/share/swig/4.4.0/python/carrays.i /usr/share/swig/4.4.0/python/std_ios.i /usr/share/swig/4.4.0/tcl/Makefile.in /usr/share/swig/4.4.0/python/pyopers.swg /usr/share/swig/4.4.0/tcl/std_wstring.i /usr/share/swig/4.4.0/tcl/cmalloc.i /usr/shar
 e/swig/4.4.0/python/exception.i /usr/share/swig/4.4.0/tcl/tclerrors.swg /usr/share/swig/4.4.0/python/std_streambuf.i /usr/share/swig/4.4.0/python/pyruntime.swg /usr/share/swig/4.4.0/tcl/std_auto_ptr.i /usr/share/swig/4.4.0/tcl/tclruntime.swg /usr/share/swig/4.4.0/python/embed.i /usr/share/swig/4.4.0/python/std_deque.i /usr/share/swig/4.4.0/tcl/tclresult.i /usr/share/swig/4.4.0/python/argcargv.i /usr/share/swig/4.4.0/python/pyinit.swg /usr/share/swig/4.4.0/python/std_iostream.i /usr/share/swig/4.4.0/python/std_wsstream.i /usr/share/swig/4.4.0/python/std_set.i /usr/share/swig/4.4.0/tcl/std_string_view.i /usr/share/swig/4.4.0/python/typemaps.i /usr/share/swig/4.4.0/tcl/tclapi.swg /usr/share/swig/4.4.0/python/std_complex.i /usr/share/swig/4.4.0/python/std_sstream.i /usr/share/swig/4.4.0/python/std_wstring.i /usr/share/swig/4.4.0/python/file.i /usr/share/swig/4.4.0/tcl/tclrun.swg /usr/share/swig/4.4.0/tcl/tclinit.swg /usr/share/swig/4.4.0/tcl/std_deque.i /usr/share/swig/4.4.0/python/cstr
 ing.i /usr/share/swig/4.4.0/python/pyiterators.swg /usr/share/swig/4.4.0/python/std_auto_ptr.i /usr/share/swig/4.4.0/tcl/std_common.i /usr/share/swig/4.4.0/tcl/std_vector.i /usr/share/swig/4.4.0/python/std_multimap.i /usr/share/swig/4.4.0/python/std_list.i /usr/share/swig/4.4.0/python/pycontainer.swg /usr/share/swig/4.4.0/tcl/tclsh.i /usr/share/swig/4.4.0/tcl/argcargv.i /usr/share/swig/4.4.0/python/implicit.i /usr/share/swig/4.4.0/python/pybackward.swg /usr/share/swig/4.4.0/tcl/typemaps.i /usr/share/swig/4.4.0/python/cpointer.i /usr/share/swig/4.4.0/python/std_multiset.i /usr/share/swig/4.4.0/tcl/tclstrings.swg /usr/share/swig/4.4.0/python/std_array.i /usr/share/swig/4.4.0/python/director.swg /usr/share/swig/4.4.0/python/std_pair.i /usr/share/swig/4.4.0/tcl/cwstring.i /usr/share/swig/4.4.0/python/ccomplex.i /usr/share/swig/4.4.0/python/pystrings.swg /usr/share/swig/4.4.0/python/std_basic_string.i /usr/share/swig/4.4.0/tcl/std_map.i /usr/share/swig/4.4.0/python/builtin.swg /usr/share
 /swig/4.4.0/python/std_filesystem.i /usr/share/swig/4.4.0/tcl/stl.i /usr/share/swig/4.4.0/python/python.swg /usr/share/swig/4.4.0/python/pyfragments.swg /usr/share/swig/4.4.0/python/pyprimtypes.swg /usr/share/swig/4.4.0/python/std_vector.i /usr/share/swig/4.4.0/python/std_unordered_multiset.i /usr/share/swig/4.4.0/python/std_wiostream.i /usr/share/swig/4.4.0/tcl/exception.i /usr/share/swig/4.4.0/python/std_unordered_set.i /usr/share/swig/4.4.0/python/std_wstreambuf.i /usr/share/swig/4.4.0/tcl/carrays.i /usr/share/swig/4.4.0/python/stl.i /usr/share/swig/4.4.0/python/cwstring.i /usr/share/swig/4.4.0/python/wchar.i /usr/share/swig/4.4.0/python/cmalloc.i /usr/share/swig/4.4.0/python/pybuffer.i /usr/share/swig/4.4.0/python/pywstrings.swg /usr/share/swig/4.4.0/tcl/std_string.i /usr/share/swig/4.4.0/tcl/tcluserdir.swg /usr/share/swig/4.4.0/python/pyerrors.swg /usr/share/swig/4.4.0/python/Makefile.in /usr/share/swig/4.4.0/tcl/tclprimtypes.swg /usr/share/swig/4.4.0/tcl/tclwstrings.swg /usr/s
 hare/swig/4.4.0/python/std_alloc.i /usr/share/swig/4.4.0/tcl/tclinterp.i /usr/share/swig/4.4.0/python/std_char_traits.i /usr/share/swig/4.4.0/python/swigmove.i /usr/share/swig/4.4.0/tcl/std_pair.i /usr/share/swig/4.4.0/python/factory.i /usr/share/swig/4.4.0/python/attribute.i /usr/share/swig/4.4.0/python/std_map.i /usr/share/swig/4.4.0/tcl/factory.i /usr/share/swig/4.4.0/python/director_py_mutex.swg /usr/share/swig/4.4.0/tcl/attribute.i /usr/share/swig/4.4.0/python/pyabc.i /usr/share/swig/4.4.0/python/pythreads.swg /usr/share/swig/4.4.0/tcl/cpointer.i /usr/share/swig/4.4.0/tcl/tclkw.swg /usr/share/swig/4.4.0/python/std_vectora.i /usr/share/swig/4.4.0/tcl/tcl8.swg /usr/share/swig/4.4.0/python/pyuserdir.swg /usr/share/swig/4.4.0/tcl/std_except.i /usr/share/swig/4.4.0/python/std_string_view.i /usr/share/swig/4.4.0/python/pystdcommon.swg /usr/share/swig/4.4.0/python/pythonkw.swg /usr/share/swig/4.4.0/python/std_unordered_map.i /usr/share/swig/4.4.0/python/complex.i /usr/share/swig/4.4.0
 /python/pyapi.swg /usr/share/swig/4.4.0/python/pycomplex.swg /usr/share/swig/4.4.0/python/std_wios.i /usr/share/swig/4.4.0/tcl/tclincludes.swg /usr/share/swig/4.4.0/python/std_unique_ptr.i"
Changes to packages/x86-64-v3-poky-linux/swig (sysroot):
  /usr/share/swig/4.3.1 moved to /usr/share/swig/4.4.0
  /usr/share/swig/4.4.0/tcl/tclincludes.swg was added
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

--===============0001753192971625997==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/swig: PKGV changed from 4.3.1 [default] to 4.4.0 [default]
packages/x86-64-v3-poky-linux/swig: SRC_URI changed from "https://downloads.sourceforge.net/swig/swig-4.3.1.tar.gz file://determinism.patch" to "https://downloads.sourceforge.net/swig/swig-4.4.0.tar.gz file://determinism.patch"
packages/x86-64-v3-poky-linux/swig: PV changed from "4.3.1" to "4.4.0"
packages/x86-64-v3-poky-linux/swig/swig-dbg: PKGV changed from 4.3.1 [default] to 4.4.0 [default]
packages/x86-64-v3-poky-linux/swig/swig-dbg: PV changed from "4.3.1" to "4.4.0"
packages/x86-64-v3-poky-linux/swig/swig-dbg: PKGSIZE changed from 11433288 to 11434072 (+0%)
packages/x86-64-v3-poky-linux/swig/swig-dev: PKGV changed from 4.3.1 [default] to 4.4.0 [default]
packages/x86-64-v3-poky-linux/swig/swig-dev: PV changed from "4.3.1" to "4.4.0"
packages/x86-64-v3-poky-linux/swig/swig-doc: PKGV changed from 4.3.1 [default] to 4.4.0 [default]
packages/x86-64-v3-poky-linux/swig/swig-doc: PV changed from "4.3.1" to "4.4.0"
packages/x86-64-v3-poky-linux/swig/swig-locale: PKGV changed from 4.3.1 [default] to 4.4.0 [default]
packages/x86-64-v3-poky-linux/swig/swig-locale: PV changed from "4.3.1" to "4.4.0"
packages/x86-64-v3-poky-linux/swig/swig-src: PKGV changed from 4.3.1 [default] to 4.4.0 [default]
packages/x86-64-v3-poky-linux/swig/swig-src: PV changed from "4.3.1" to "4.4.0"
packages/x86-64-v3-poky-linux/swig/swig-src: PKGSIZE changed from 4231918 to 4217304 (-0%)
packages/x86-64-v3-poky-linux/swig/swig-src: FILELIST: directory renamed /usr/src/debug/swig/4.3.1/Source/CParse -> /usr/src/debug/swig/4.4.0/Source/CParse, directory renamed /usr/src/debug/swig/4.3.1/Source/DOH -> /usr/src/debug/swig/4.4.0/Source/DOH, directory renamed /usr/src/debug/swig/4.3.1/Source/Preprocessor -> /usr/src/debug/swig/4.4.0/Source/Preprocessor, directory renamed /usr/src/debug/swig/4.3.1/Source/Doxygen -> /usr/src/debug/swig/4.4.0/Source/Doxygen, directory renamed /usr/src/debug/swig/4.3.1/Source/Swig -> /usr/src/debug/swig/4.4.0/Source/Swig, removed "/usr/src/debug/swig/4.3.1/Source/Modules/d.cxx /usr/src/debug/swig/4.3.1/Source/Modules/lang.cxx /usr/src/debug/swig/4.3.1/Source/Modules/java.cxx /usr/src/debug/swig/4.3.1/Source/Modules/main.cxx /usr/src/debug/swig/4.3.1/Source/Modules/emit.cxx /usr/src/debug/swig/4.3.1/Source/Modules/php.cxx /usr/src/debug/swig/4.3.1/Source/Modules/overload.cxx /usr/src/debug/swig/4.3.1/Source/Modules/ruby.cxx /usr/src/debug/swig/
 4.3.1/Source/Modules/tcl8.cxx /usr/src/debug/swig/4.3.1/Source/Modules/guile.cxx /usr/src/debug/swig/4.3.1/Source/Modules/ocaml.cxx /usr/src/debug/swig/4.3.1/Source/Modules/perl5.cxx /usr/src/debug/swig/4.3.1/Source/Modules/utils.cxx /usr/src/debug/swig/4.3.1/Source/Modules/octave.cxx /usr/src/debug/swig/4.3.1/Source/Modules/python.cxx /usr/src/debug/swig/4.3.1/Source/Modules/contract.cxx /usr/src/debug/swig/4.3.1/Source/Modules/nested.cxx /usr/src/debug/swig/4.3.1/Source/Modules/scilab.cxx /usr/src/debug/swig/4.3.1/Source/Modules/swigmod.h /usr/src/debug/swig/4.3.1/Source/Modules/xml.cxx /usr/src/debug/swig/4.3.1/Source/Modules/lua.cxx /usr/src/debug/swig/4.3.1/Source/Modules/swigmain.cxx /usr/src/debug/swig/4.3.1/Source/Modules/typepass.cxx /usr/src/debug/swig/4.3.1/Source/Modules/r.cxx /usr/src/debug/swig/4.3.1/Source/Modules/directors.cxx /usr/src/debug/swig/4.3.1/Source/Modules/go.cxx /usr/src/debug/swig/4.3.1/Source/Modules/allocate.cxx /usr/src/debug/swig/4.3.1/Source/Modules
 /mzscheme.cxx /usr/src/debug/swig/4.3.1/Source/Modules/javascript.cxx /usr/src/debug/swig/4.3.1/Source/Modules/c.cxx /usr/src/debug/swig/4.3.1/Source/Modules/csharp.cxx /usr/src/debug/swig/4.3.1/Source/Modules/interface.cxx", added "/usr/src/debug/swig/4.4.0/Source/Modules/allocate.cxx /usr/src/debug/swig/4.4.0/Source/Modules/contract.cxx /usr/src/debug/swig/4.4.0/Source/Modules/lang.cxx /usr/src/debug/swig/4.4.0/Source/Modules/emit.cxx /usr/src/debug/swig/4.4.0/Source/Modules/java.cxx /usr/src/debug/swig/4.4.0/Source/Modules/main.cxx /usr/src/debug/swig/4.4.0/Source/Modules/ruby.cxx /usr/src/debug/swig/4.4.0/Source/Modules/swigmain.cxx /usr/src/debug/swig/4.4.0/Source/Modules/tcl8.cxx /usr/src/debug/swig/4.4.0/Source/Modules/guile.cxx /usr/src/debug/swig/4.4.0/Source/Modules/d.cxx /usr/src/debug/swig/4.4.0/Source/Modules/ocaml.cxx /usr/src/debug/swig/4.4.0/Source/Modules/perl5.cxx /usr/src/debug/swig/4.4.0/Source/Modules/utils.cxx /usr/src/debug/swig/4.4.0/Source/Modules/interface.
 cxx /usr/src/debug/swig/4.4.0/Source/Modules/typepass.cxx /usr/src/debug/swig/4.4.0/Source/Modules/csharp.cxx /usr/src/debug/swig/4.4.0/Source/Modules/nested.cxx /usr/src/debug/swig/4.4.0/Source/Modules/octave.cxx /usr/src/debug/swig/4.4.0/Source/Modules/python.cxx /usr/src/debug/swig/4.4.0/Source/Modules/go.cxx /usr/src/debug/swig/4.4.0/Source/Modules/scilab.cxx /usr/src/debug/swig/4.4.0/Source/Modules/javascript.cxx /usr/src/debug/swig/4.4.0/Source/Modules/overload.cxx /usr/src/debug/swig/4.4.0/Source/Modules/swigmod.h /usr/src/debug/swig/4.4.0/Source/Modules/c.cxx /usr/src/debug/swig/4.4.0/Source/Modules/r.cxx /usr/src/debug/swig/4.4.0/Source/Modules/xml.cxx /usr/src/debug/swig/4.4.0/Source/Modules/php.cxx /usr/src/debug/swig/4.4.0/Source/Modules/lua.cxx /usr/src/debug/swig/4.4.0/Source/Modules/directors.cxx"
packages/x86-64-v3-poky-linux/swig/swig-staticdev: PKGV changed from 4.3.1 [default] to 4.4.0 [default]
packages/x86-64-v3-poky-linux/swig/swig-staticdev: PV changed from "4.3.1" to "4.4.0"
packages/x86-64-v3-poky-linux/swig/swig: PKGV changed from 4.3.1 [default] to 4.4.0 [default]
packages/x86-64-v3-poky-linux/swig/swig: PV changed from "4.3.1" to "4.4.0"
packages/x86-64-v3-poky-linux/swig/swig: PKGSIZE changed from 5189423 to 5100579 (-2%)
packages/x86-64-v3-poky-linux/swig/swig: FILELIST: directory renamed /usr/share/swig/4.3.1/javascript/v8 -> /usr/share/swig/4.4.0/javascript/v8, directory renamed /usr/share/swig/4.3.1/java -> /usr/share/swig/4.4.0/java, directory renamed /usr/share/swig/4.3.1/octave -> /usr/share/swig/4.4.0/octave, directory renamed /usr/share/swig/4.3.1/javascript/jsc -> /usr/share/swig/4.4.0/javascript/jsc, directory renamed /usr/share/swig/4.3.1/javascript -> /usr/share/swig/4.4.0/javascript, directory renamed /usr/share/swig/4.3.1/ruby -> /usr/share/swig/4.4.0/ruby, directory renamed /usr/share/swig/4.3.1/go -> /usr/share/swig/4.4.0/go, directory renamed /usr/share/swig/4.3.1/scilab -> /usr/share/swig/4.4.0/scilab, directory renamed /usr/share/swig/4.3.1/php -> /usr/share/swig/4.4.0/php, directory renamed /usr/share/swig/4.3.1/csharp -> /usr/share/swig/4.4.0/csharp, directory renamed /usr/share/swig/4.3.1/xml -> /usr/share/swig/4.4.0/xml, directory renamed /usr/share/swig/4.3.1/guile -> /usr/sha
 re/swig/4.4.0/guile, directory renamed /usr/share/swig/4.3.1/lua -> /usr/share/swig/4.4.0/lua, directory renamed /usr/share/swig/4.3.1/ocaml -> /usr/share/swig/4.4.0/ocaml, directory renamed /usr/share/swig/4.3.1/std -> /usr/share/swig/4.4.0/std, directory renamed /usr/share/swig/4.3.1/javascript/napi -> /usr/share/swig/4.4.0/javascript/napi, directory renamed /usr/share/swig/4.3.1/r -> /usr/share/swig/4.4.0/r, directory renamed /usr/share/swig/4.3.1/perl5 -> /usr/share/swig/4.4.0/perl5, directory renamed /usr/share/swig/4.3.1 -> /usr/share/swig/4.4.0, directory renamed /usr/share/swig/4.3.1/typemaps -> /usr/share/swig/4.4.0/typemaps, directory renamed /usr/share/swig/4.3.1/c -> /usr/share/swig/4.4.0/c, directory renamed /usr/share/swig/4.3.1/d -> /usr/share/swig/4.4.0/d, removed "/usr/share/swig/4.3.1/tcl/tcl8.swg /usr/share/swig/4.3.1/python/std_pair.i /usr/share/swig/4.3.1/python/pycontainer.swg /usr/share/swig/4.3.1/python/std_except.i /usr/share/swig/4.3.1/python/std_common.i /
 usr/share/swig/4.3.1/python/std_string.i /usr/share/swig/4.3.1/tcl/std_string_view.i /usr/share/swig/4.3.1/tcl/attribute.i /usr/share/swig/4.3.1/tcl/Makefile.in /usr/share/swig/4.3.1/python/boost_shared_ptr.i /usr/share/swig/4.3.1/mzscheme/std_pair.i /usr/share/swig/4.3.1/tcl/std_string.i /usr/share/swig/4.3.1/python/file.i /usr/share/swig/4.3.1/python/std_deque.i /usr/share/swig/4.3.1/mzscheme/std_map.i /usr/share/swig/4.3.1/python/README /usr/share/swig/4.3.1/tcl/std_pair.i /usr/share/swig/4.3.1/python/std_iostream.i /usr/share/swig/4.3.1/python/std_container.i /usr/share/swig/4.3.1/python/std_shared_ptr.i /usr/share/swig/4.3.1/python/std_unique_ptr.i /usr/share/swig/4.3.1/python/std_wsstream.i /usr/share/swig/4.3.1/python/pymacros.swg /usr/share/swig/4.3.1/tcl/tclprimtypes.swg /usr/share/swig/4.3.1/tcl/tclmacros.swg /usr/share/swig/4.3.1/python/std_wios.i /usr/share/swig/4.3.1/python/std_vectora.i /usr/share/swig/4.3.1/tcl/std_vector.i /usr/share/swig/4.3.1/python/std_unordered_s
 et.i /usr/share/swig/4.3.1/tcl/tclinit.swg /usr/share/swig/4.3.1/tcl/std_unique_ptr.i /usr/share/swig/4.3.1/python/std_multiset.i /usr/share/swig/4.3.1/mzscheme/swigmove.i /usr/share/swig/4.3.1/python/pybuffer.i /usr/share/swig/4.3.1/python/pyerrors.swg /usr/share/swig/4.3.1/python/std_array.i /usr/share/swig/4.3.1/python/std_auto_ptr.i /usr/share/swig/4.3.1/python/stl.i /usr/share/swig/4.3.1/python/std_map.i /usr/share/swig/4.3.1/mzscheme/std_string.i /usr/share/swig/4.3.1/python/factory.i /usr/share/swig/4.3.1/python/pyruntime.swg /usr/share/swig/4.3.1/python/std_multimap.i /usr/share/swig/4.3.1/python/pystdcommon.swg /usr/share/swig/4.3.1/python/pythreads.swg /usr/share/swig/4.3.1/python/typemaps.i /usr/share/swig/4.3.1/python/pyabc.i /usr/share/swig/4.3.1/python/pythonkw.swg /usr/share/swig/4.3.1/tcl/cstring.i /usr/share/swig/4.3.1/tcl/tclruntime.swg /usr/share/swig/4.3.1/python/pydocs.swg /usr/share/swig/4.3.1/python/pyuserdir.swg /usr/share/swig/4.3.1/mzscheme/argcargv.i /usr/
 share/swig/4.3.1/mzscheme/std_vector.i /usr/share/swig/4.3.1/tcl/carrays.i /usr/share/swig/4.3.1/tcl/tcltypemaps.swg /usr/share/swig/4.3.1/tcl/tclerrors.swg /usr/share/swig/4.3.1/tcl/std_auto_ptr.i /usr/share/swig/4.3.1/tcl/tclapi.swg /usr/share/swig/4.3.1/tcl/tclrun.swg /usr/share/swig/4.3.1/tcl/std_deque.i /usr/share/swig/4.3.1/python/python.swg /usr/share/swig/4.3.1/tcl/cwstring.i /usr/share/swig/4.3.1/tcl/tclwstrings.swg /usr/share/swig/4.3.1/python/pyname_compat.i /usr/share/swig/4.3.1/mzscheme/cdata.i /usr/share/swig/4.3.1/python/ccomplex.i /usr/share/swig/4.3.1/python/std_filesystem.i /usr/share/swig/4.3.1/python/cpointer.i /usr/share/swig/4.3.1/python/cstring.i /usr/share/swig/4.3.1/python/complex.i /usr/share/swig/4.3.1/tcl/cpointer.i /usr/share/swig/4.3.1/python/std_unordered_multimap.i /usr/share/swig/4.3.1/python/std_char_traits.i /usr/share/swig/4.3.1/python/implicit.i /usr/share/swig/4.3.1/mzscheme/std_unique_ptr.i /usr/share/swig/4.3.1/tcl/tclkw.swg /usr/share/swig/4.
 3.1/mzscheme/std_deque.i /usr/share/swig/4.3.1/python/std_basic_string.i /usr/share/swig/4.3.1/tcl/cmalloc.i /usr/share/swig/4.3.1/tcl/argcargv.i /usr/share/swig/4.3.1/python/argcargv.i /usr/share/swig/4.3.1/python/std_alloc.i /usr/share/swig/4.3.1/python/attribute.i /usr/share/swig/4.3.1/python/std_vector.i /usr/share/swig/4.3.1/python/embed.i /usr/share/swig/4.3.1/python/exception.i /usr/share/swig/4.3.1/tcl/tclsh.i /usr/share/swig/4.3.1/python/std_set.i /usr/share/swig/4.3.1/python/pybackward.swg /usr/share/swig/4.3.1/tcl/stl.i /usr/share/swig/4.3.1/tcl/std_except.i /usr/share/swig/4.3.1/python/std_streambuf.i /usr/share/swig/4.3.1/python/cmalloc.i /usr/share/swig/4.3.1/tcl/std_map.i /usr/share/swig/4.3.1/python/director.swg /usr/share/swig/4.3.1/python/pyrun.swg /usr/share/swig/4.3.1/python/std_complex.i /usr/share/swig/4.3.1/python/std_sstream.i /usr/share/swig/4.3.1/python/std_wstring.i /usr/share/swig/4.3.1/python/pyfragments.swg /usr/share/swig/4.3.1/python/pyinit.swg /usr/s
 hare/swig/4.3.1/python/pyprimtypes.swg /usr/share/swig/4.3.1/python/wchar.i /usr/share/swig/4.3.1/tcl/exception.i /usr/share/swig/4.3.1/tcl/tclopers.swg /usr/share/swig/4.3.1/tcl/tclinterp.i /usr/share/swig/4.3.1/tcl/typemaps.i /usr/share/swig/4.3.1/tcl/tcluserdir.swg /usr/share/swig/4.3.1/python/std_wiostream.i /usr/share/swig/4.3.1/tcl/tclfragments.swg /usr/share/swig/4.3.1/python/builtin.swg /usr/share/swig/4.3.1/python/director_py_mutex.swg /usr/share/swig/4.3.1/python/pyiterators.swg /usr/share/swig/4.3.1/python/pycomplex.swg /usr/share/swig/4.3.1/python/std_list.i /usr/share/swig/4.3.1/tcl/tclresult.i /usr/share/swig/4.3.1/mzscheme/mzscheme.swg /usr/share/swig/4.3.1/mzscheme/std_auto_ptr.i /usr/share/swig/4.3.1/python/carrays.i /usr/share/swig/4.3.1/python/swigmove.i /usr/share/swig/4.3.1/python/pywstrings.swg /usr/share/swig/4.3.1/mzscheme/std_common.i /usr/share/swig/4.3.1/tcl/factory.i /usr/share/swig/4.3.1/tcl/swigmove.i /usr/share/swig/4.3.1/python/cwstring.i /usr/share/s
 wig/4.3.1/python/pytypemaps.swg /usr/share/swig/4.3.1/tcl/std_wstring.i /usr/share/swig/4.3.1/python/std_unordered_map.i /usr/share/swig/4.3.1/python/std_wstreambuf.i /usr/share/swig/4.3.1/python/pyclasses.swg /usr/share/swig/4.3.1/tcl/tclstrings.swg /usr/share/swig/4.3.1/python/pyhead.swg /usr/share/swig/4.3.1/python/pystrings.swg /usr/share/swig/4.3.1/python/std_string_view.i /usr/share/swig/4.3.1/mzscheme/mzrun.swg /usr/share/swig/4.3.1/python/std_unordered_multiset.i /usr/share/swig/4.3.1/python/std_ios.i /usr/share/swig/4.3.1/tcl/std_common.i /usr/share/swig/4.3.1/python/pyapi.swg /usr/share/swig/4.3.1/python/Makefile.in /usr/share/swig/4.3.1/python/pyopers.swg /usr/share/swig/4.3.1/mzscheme/stl.i /usr/share/swig/4.3.1/mzscheme/Makefile /usr/share/swig/4.3.1/tcl/wish.i /usr/share/swig/4.3.1/mzscheme/typemaps.i", added "/usr/share/swig/4.4.0/tcl/tcl8.swg /usr/share/swig/4.4.0/python/std_pair.i /usr/share/swig/4.4.0/python/pycontainer.swg /usr/share/swig/4.4.0/python/std_except.i
  /usr/share/swig/4.4.0/python/std_common.i /usr/share/swig/4.4.0/python/std_string.i /usr/share/swig/4.4.0/tcl/std_string_view.i /usr/share/swig/4.4.0/tcl/attribute.i /usr/share/swig/4.4.0/tcl/Makefile.in /usr/share/swig/4.4.0/python/boost_shared_ptr.i /usr/share/swig/4.4.0/tcl/std_string.i /usr/share/swig/4.4.0/python/file.i /usr/share/swig/4.4.0/python/std_deque.i /usr/share/swig/4.4.0/python/README /usr/share/swig/4.4.0/tcl/std_pair.i /usr/share/swig/4.4.0/python/std_iostream.i /usr/share/swig/4.4.0/python/std_container.i /usr/share/swig/4.4.0/python/std_shared_ptr.i /usr/share/swig/4.4.0/python/std_unique_ptr.i /usr/share/swig/4.4.0/python/std_wsstream.i /usr/share/swig/4.4.0/python/pymacros.swg /usr/share/swig/4.4.0/tcl/tclprimtypes.swg /usr/share/swig/4.4.0/tcl/tclmacros.swg /usr/share/swig/4.4.0/python/std_wios.i /usr/share/swig/4.4.0/python/std_vectora.i /usr/share/swig/4.4.0/tcl/std_vector.i /usr/share/swig/4.4.0/python/std_unordered_set.i /usr/share/swig/4.4.0/tcl/tclinit.
 swg /usr/share/swig/4.4.0/tcl/std_unique_ptr.i /usr/share/swig/4.4.0/python/std_multiset.i /usr/share/swig/4.4.0/python/pybuffer.i /usr/share/swig/4.4.0/python/pyerrors.swg /usr/share/swig/4.4.0/python/std_array.i /usr/share/swig/4.4.0/python/std_auto_ptr.i /usr/share/swig/4.4.0/python/stl.i /usr/share/swig/4.4.0/python/std_map.i /usr/share/swig/4.4.0/python/factory.i /usr/share/swig/4.4.0/python/pyruntime.swg /usr/share/swig/4.4.0/python/std_multimap.i /usr/share/swig/4.4.0/python/pystdcommon.swg /usr/share/swig/4.4.0/python/pythreads.swg /usr/share/swig/4.4.0/python/typemaps.i /usr/share/swig/4.4.0/python/pyabc.i /usr/share/swig/4.4.0/python/pythonkw.swg /usr/share/swig/4.4.0/tcl/cstring.i /usr/share/swig/4.4.0/tcl/tclruntime.swg /usr/share/swig/4.4.0/python/pydocs.swg /usr/share/swig/4.4.0/python/pyuserdir.swg /usr/share/swig/4.4.0/tcl/tcltypemaps.swg /usr/share/swig/4.4.0/tcl/carrays.i /usr/share/swig/4.4.0/tcl/tclerrors.swg /usr/share/swig/4.4.0/tcl/std_auto_ptr.i /usr/share/sw
 ig/4.4.0/tcl/tclapi.swg /usr/share/swig/4.4.0/tcl/tclrun.swg /usr/share/swig/4.4.0/tcl/std_deque.i /usr/share/swig/4.4.0/python/python.swg /usr/share/swig/4.4.0/tcl/cwstring.i /usr/share/swig/4.4.0/tcl/tclwstrings.swg /usr/share/swig/4.4.0/python/ccomplex.i /usr/share/swig/4.4.0/python/std_filesystem.i /usr/share/swig/4.4.0/python/cpointer.i /usr/share/swig/4.4.0/python/cstring.i /usr/share/swig/4.4.0/python/complex.i /usr/share/swig/4.4.0/tcl/cpointer.i /usr/share/swig/4.4.0/python/std_unordered_multimap.i /usr/share/swig/4.4.0/python/implicit.i /usr/share/swig/4.4.0/python/std_char_traits.i /usr/share/swig/4.4.0/tcl/tclkw.swg /usr/share/swig/4.4.0/python/std_basic_string.i /usr/share/swig/4.4.0/tcl/cmalloc.i /usr/share/swig/4.4.0/tcl/argcargv.i /usr/share/swig/4.4.0/python/argcargv.i /usr/share/swig/4.4.0/python/std_alloc.i /usr/share/swig/4.4.0/python/attribute.i /usr/share/swig/4.4.0/python/std_vector.i /usr/share/swig/4.4.0/python/embed.i /usr/share/swig/4.4.0/python/exception.
 i /usr/share/swig/4.4.0/tcl/tclsh.i /usr/share/swig/4.4.0/python/std_set.i /usr/share/swig/4.4.0/python/pybackward.swg /usr/share/swig/4.4.0/tcl/stl.i /usr/share/swig/4.4.0/tcl/std_except.i /usr/share/swig/4.4.0/python/std_streambuf.i /usr/share/swig/4.4.0/python/cmalloc.i /usr/share/swig/4.4.0/tcl/std_map.i /usr/share/swig/4.4.0/python/director.swg /usr/share/swig/4.4.0/python/pyrun.swg /usr/share/swig/4.4.0/python/std_complex.i /usr/share/swig/4.4.0/python/std_sstream.i /usr/share/swig/4.4.0/python/std_wstring.i /usr/share/swig/4.4.0/python/pyfragments.swg /usr/share/swig/4.4.0/python/pyinit.swg /usr/share/swig/4.4.0/python/pyprimtypes.swg /usr/share/swig/4.4.0/python/wchar.i /usr/share/swig/4.4.0/tcl/exception.i /usr/share/swig/4.4.0/tcl/tclopers.swg /usr/share/swig/4.4.0/tcl/tclinterp.i /usr/share/swig/4.4.0/tcl/typemaps.i /usr/share/swig/4.4.0/tcl/tcluserdir.swg /usr/share/swig/4.4.0/python/std_wiostream.i /usr/share/swig/4.4.0/tcl/tclfragments.swg /usr/share/swig/4.4.0/tcl/tcl
 includes.swg /usr/share/swig/4.4.0/python/builtin.swg /usr/share/swig/4.4.0/python/director_py_mutex.swg /usr/share/swig/4.4.0/python/pyiterators.swg /usr/share/swig/4.4.0/python/std_list.i /usr/share/swig/4.4.0/python/pycomplex.swg /usr/share/swig/4.4.0/tcl/tclresult.i /usr/share/swig/4.4.0/python/carrays.i /usr/share/swig/4.4.0/python/swigmove.i /usr/share/swig/4.4.0/python/pywstrings.swg /usr/share/swig/4.4.0/tcl/factory.i /usr/share/swig/4.4.0/tcl/swigmove.i /usr/share/swig/4.4.0/python/cwstring.i /usr/share/swig/4.4.0/python/pytypemaps.swg /usr/share/swig/4.4.0/tcl/std_wstring.i /usr/share/swig/4.4.0/python/std_unordered_map.i /usr/share/swig/4.4.0/python/std_wstreambuf.i /usr/share/swig/4.4.0/python/pyclasses.swg /usr/share/swig/4.4.0/tcl/tclstrings.swg /usr/share/swig/4.4.0/python/pyhead.swg /usr/share/swig/4.4.0/python/pystrings.swg /usr/share/swig/4.4.0/python/std_string_view.i /usr/share/swig/4.4.0/python/std_unordered_multiset.i /usr/share/swig/4.4.0/python/std_ios.i /usr
 /share/swig/4.4.0/tcl/std_common.i /usr/share/swig/4.4.0/python/pyapi.swg /usr/share/swig/4.4.0/python/Makefile.in /usr/share/swig/4.4.0/python/pyopers.swg /usr/share/swig/4.4.0/tcl/wish.i"
Changes to packages/x86-64-v3-poky-linux/swig (sysroot):
  /usr/share/swig/4.3.1 moved to /usr/share/swig/4.4.0
  /usr/share/swig/4.4.0/tcl/tclincludes.swg was added
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

--===============0001753192971625997==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-swig-upgrade-4.3.1-4.4.0.patch"

RnJvbSA0ZWE0ZTQ1ZDM0YTBmY2M3MzQ2MjJmZGI1MTM3ZDQ5OGFlZmEwZmUxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAxODozNjowMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHN3
aWc6IHVwZ3JhZGUgNC4zLjEgLT4gNC40LjAKCi0tLQogbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N3
aWcvc3dpZy9kZXRlcm1pbmlzbS5wYXRjaCAgICAgICAgICAgfCAyICstCiBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvc3dpZy97c3dpZ180LjMuMS5iYiA9PiBzd2lnXzQuNC4wLmJifSB8IDIgKy0KIDIg
ZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9zd2lnL3tzd2lnXzQuMy4xLmJiID0+IHN3aWdfNC40LjAuYmJ9
ICg5NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N3aWcvc3dpZy9kZXRl
cm1pbmlzbS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9zd2lnL3N3aWcvZGV0ZXJtaW5p
c20ucGF0Y2gKaW5kZXggNDM1OTI4MWJiYi4uY2Q4N2M0YzQ2NyAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3N3aWcvc3dpZy9kZXRlcm1pbmlzbS5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvc3dpZy9zd2lnL2RldGVybWluaXNtLnBhdGNoCkBAIC0xLDQgKzEsNCBA
QAotRnJvbSAxY2Q2ZjBjYzIxZmM5NzdhNzEwZThkMzBjM2QyZWJmZWUzYzcyZGMwIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQorRnJvbSA3OTZmNTUwYzUxNThlOWY5ZWZiM2Q1ZjU0M2ExZTY5MzRm
NDIyMWRlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUmljaGFyZCBQdXJkaWUgPHJp
Y2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+CiBEYXRlOiBNb24sIDEgTWFyIDIwMjEg
MDA6MTE6MTAgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gc3dpZzogRml4IHJlcHJvZHVjaWJpbGl0
eSBpc3N1ZQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N3aWcvc3dpZ180LjMu
MS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9zd2lnL3N3aWdfNC40LjAuYmIKc2ltaWxhcml0
eSBpbmRleCA5NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N3aWcvc3dpZ180
LjMuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N3aWcvc3dpZ180LjQuMC5i
YgppbmRleCBkZDk3OTU4MGExLi45M2QwNmI2YTVmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvc3dpZy9zd2lnXzQuMy4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9z
d2lnL3N3aWdfNC40LjAuYmIKQEAgLTE1LDcgKzE1LDcgQEAgREVQRU5EUyA9ICJsaWJwY3JlMiBi
aXNvbi1uYXRpdmUiCiBTUkNfVVJJID0gIiR7U09VUkNFRk9SR0VfTUlSUk9SfS8ke0JQTn0vJHtC
UE59LSR7UFZ9LnRhci5neiBcCiAgICAgICAgICAgICBmaWxlOi8vZGV0ZXJtaW5pc20ucGF0Y2gg
XAogICAgICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNDRmYzgyOWY3MGYxZTE3ZDYz
NWEyYjRkNjlhY2FiMzg4OTY2OTllY2MyNGFhMDIzZTUxNmUwZWFiYmVjNjFiOCIKK1NSQ19VUklb
c2hhMjU2c3VtXSA9ICJjM2Y4ZTVkY2Q2OGMxOGFhMTk4NDdiMzNiMGExYmI5MmYwN2U5MDRjNTNh
ZTljZjVhZTRmZjg3MjdhNzI5MjdlIgogVVBTVFJFQU1fQ0hFQ0tfVVJJID0gImh0dHBzOi8vc291
cmNlZm9yZ2UubmV0L3Byb2plY3RzL3N3aWcvZmlsZXMvc3dpZy8iCiBVUFNUUkVBTV9DSEVDS19S
RUdFWCA9ICJzd2lnLSg/UDxwdmVyPlxkKyhcLlxkKykrKSIKIAotLSAKMi40Ny4xCgo=

--===============0001753192971625997==--

