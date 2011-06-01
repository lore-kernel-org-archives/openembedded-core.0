Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QRf5e-000513-MA
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 08:39:39 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 31 May 2011 23:36:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,302,1304319600"; d="scan'208";a="10208521"
Received: from unknown (HELO [10.255.13.41]) ([10.255.13.41])
	by fmsmga002.fm.intel.com with ESMTP; 31 May 2011 23:36:27 -0700
Message-ID: <4DE5DDEB.6000900@linux.intel.com>
Date: Tue, 31 May 2011 23:36:27 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: raj.khem@gmail.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1306909184.git.sgw@linux.intel.com>	<e74dcf6b43e35912c4f901aa48173eb4e6e783f7.1306909184.git.sgw@linux.intel.com>
	<4DE5DD09.1040704@gmail.com>
In-Reply-To: <4DE5DD09.1040704@gmail.com>
Subject: Re: [CONSOLIDATED PULL 09/32] gettext: Update to 0.18.1.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Jun 2011 06:39:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/31/2011 11:32 PM, Khem Raj wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 05/31/2011 11:21 PM, Saul Wold wrote:
>> Add Upstream Status tags to patches
>>
>> Signed-off-by: Saul Wold<sgw@linux.intel.com>
>> ---
>>   .../gettext/gettext-0.16.1/disable_java.patch      |    2 +
>>   .../gettext-0.16.1/fix_aclocal_version.patch       |    2 +
>>   .../gettext-0.16.1/fix_gnu_source_circular.patch   |    2 +
>>   .../gettext/gettext-0.16.1/fixchicken.patch        |    2 +
>>   .../gettext/gettext-0.16.1/getline.m4.patch        |    2 +
>>   .../gettext-autoconf-lib-link-no-L.patch           |    2 +
>>   .../gettext-error_print_progname.patch             |    2 +
>>   .../gettext/gettext-0.16.1/gettext-vpath.patch     |    2 +
>>   .../gettext-0.16.1/hardcode_macro_version.patch    |    2 +
>>   .../gettext/gettext-0.16.1/linklib_from_0.17.patch |    2 +
>>   .../gettext/gettext-0.17/wchar-uclibc.patch        |   96 --------------------
>>   .../autotools.patch                                |    2 +
>>   .../gettext-error_print_progname.patch             |    2 +
>>   .../{gettext-0.17 =>  gettext-0.18.1.1}/m4fix.patch |    2 +
>>   .../use_open_properly.patch                        |    2 +
>>   .../gettext/gettext-0.18.1.1/wchar-uclibc.patch    |   74 +++++++++++++++
>>   .../{gettext_0.17.bb =>  gettext_0.18.1.1.bb}       |   14 +--
>>   17 files changed, 107 insertions(+), 105 deletions(-)
>>   delete mode 100644 meta/recipes-core/gettext/gettext-0.17/wchar-uclibc.patch
>>   rename meta/recipes-core/gettext/{gettext-0.17 =>  gettext-0.18.1.1}/autotools.patch (98%)
>>   rename meta/recipes-core/gettext/{gettext-0.17 =>  gettext-0.18.1.1}/gettext-error_print_progname.patch (96%)
>>   rename meta/recipes-core/gettext/{gettext-0.17 =>  gettext-0.18.1.1}/m4fix.patch (98%)
>>   rename meta/recipes-core/gettext/{gettext-0.17 =>  gettext-0.18.1.1}/use_open_properly.patch (96%)
>>   create mode 100644 meta/recipes-core/gettext/gettext-0.18.1.1/wchar-uclibc.patch
>>   rename meta/recipes-core/gettext/{gettext_0.17.bb =>  gettext_0.18.1.1.bb} (90%)
>>
>> diff --git a/meta/recipes-core/gettext/gettext-0.16.1/disable_java.patch b/meta/recipes-core/gettext/gettext-0.16.1/disable_java.patch
>> index cf7dc55..2f8478a 100644
>> --- a/meta/recipes-core/gettext/gettext-0.16.1/disable_java.patch
>> +++ b/meta/recipes-core/gettext/gettext-0.16.1/disable_java.patch
>> @@ -2,6 +2,8 @@
>>   #
>>   # Commented by: Saul Wold<saul.wold@intel.com>
>>
>> +Upstream-Status: Inappropriate [embedded]
>> +
>>   Index: gettext-0.16.1/gettext-tools/configure.ac
>>   ===================================================================
>>   --- gettext-0.16.1.orig/gettext-tools/configure.ac	2006-11-27 09:02:01.000000000 -0800
>> diff --git a/meta/recipes-core/gettext/gettext-0.16.1/fix_aclocal_version.patch b/meta/recipes-core/gettext/gettext-0.16.1/fix_aclocal_version.patch
>> index 3796052..8fe7712 100644
>> --- a/meta/recipes-core/gettext/gettext-0.16.1/fix_aclocal_version.patch
>> +++ b/meta/recipes-core/gettext/gettext-0.16.1/fix_aclocal_version.patch
>> @@ -2,6 +2,8 @@ This patch updates the required version number from 2.61 to the
>>   current 2.65 version of aclocal, this will need to be updated
>>   when we update aclocal
>>
>> +Upstream-Status: Inappropriate [configuration]
>> +
>>   Signed-off-by Saul Wold<sgw@linux.intel.com>
>>
>>   Index: gettext-0.16.1/autoconf-lib-link/m4/lib-link.m4
>> diff --git a/meta/recipes-core/gettext/gettext-0.16.1/fix_gnu_source_circular.patch b/meta/recipes-core/gettext/gettext-0.16.1/fix_gnu_source_circular.patch
>> index 8b42f1b..d1c0bbb 100644
>> --- a/meta/recipes-core/gettext/gettext-0.16.1/fix_gnu_source_circular.patch
>> +++ b/meta/recipes-core/gettext/gettext-0.16.1/fix_gnu_source_circular.patch
>> @@ -3,6 +3,8 @@ AC_USE_SYSTEM_EXTENSIONS.
>>
>>   Thanks to Mark Hatle for the timely pointers and fixes.
>>
>> +Upstream-Status: Inappropriate [configuration]
>> +
>>   Signed-off-by Saul Wold<sgw@linux.intel.com>
>>
>>   diff -ru gettext-0.16.1/gettext-runtime/gnulib-m4/extensions.m4 gettext.patched/gettext-runtime/gnulib-m4/extensions.m4
>> diff --git a/meta/recipes-core/gettext/gettext-0.16.1/fixchicken.patch b/meta/recipes-core/gettext/gettext-0.16.1/fixchicken.patch
>> index ef51056..d6bb7b0 100644
>> --- a/meta/recipes-core/gettext/gettext-0.16.1/fixchicken.patch
>> +++ b/meta/recipes-core/gettext/gettext-0.16.1/fixchicken.patch
>> @@ -2,6 +2,8 @@
>>   #
>>   # Commented by: Saul Wold<saul.wold@intel.com>
>>
>> +Upstream-Status: Inappropriate [embedded]
>> +
>>   Index: gettext-tools/m4/csharpcomp.m4
>>   ===================================================================
>>   RCS file: /cvs/gettext/gettext/gettext-tools/m4/csharpcomp.m4,v
>> diff --git a/meta/recipes-core/gettext/gettext-0.16.1/getline.m4.patch b/meta/recipes-core/gettext/gettext-0.16.1/getline.m4.patch
>> index f71d0e1..34965fc 100644
>> --- a/meta/recipes-core/gettext/gettext-0.16.1/getline.m4.patch
>> +++ b/meta/recipes-core/gettext/gettext-0.16.1/getline.m4.patch
>> @@ -2,6 +2,8 @@
>>   #
>>   # Commented by: Saul Wold<saul.wold@intel.com>
>>
>> +Upstream-Status: Inappropriate [configuration]
>> +
>>   --- /gettext-tools/m4/orig-getline.m4	2003-07-18 18:11:37.000000000 +0300
>>   +++ /gettext-tools/m4/getline.m4	2007-02-03 13:33:41.000000000 +0200
>>   @@ -42,12 +42,23 @@
>> diff --git a/meta/recipes-core/gettext/gettext-0.16.1/gettext-autoconf-lib-link-no-L.patch b/meta/recipes-core/gettext/gettext-0.16.1/gettext-autoconf-lib-link-no-L.patch
>> index e8bb2f6..82775d6 100644
>> --- a/meta/recipes-core/gettext/gettext-0.16.1/gettext-autoconf-lib-link-no-L.patch
>> +++ b/meta/recipes-core/gettext/gettext-0.16.1/gettext-autoconf-lib-link-no-L.patch
>> @@ -2,6 +2,8 @@
>>   #
>>   # Commented by: Saul Wold<saul.wold@intel.com>
>>
>> +Upstream-Status: Pending
>> +
>>   --- gettext-0.17/autoconf-lib-link/m4/lib-link.m4~	2009-04-17 15:12:30.000000000 -0700
>>   +++ gettext-0.17/autoconf-lib-link/m4/lib-link.m4	2009-04-17 15:37:39.000000000 -0700
>>   @@ -267,6 +267,9 @@
>> diff --git a/meta/recipes-core/gettext/gettext-0.16.1/gettext-error_print_progname.patch b/meta/recipes-core/gettext/gettext-0.16.1/gettext-error_print_progname.patch
>> index 96a2196..abb7195 100644
>> --- a/meta/recipes-core/gettext/gettext-0.16.1/gettext-error_print_progname.patch
>> +++ b/meta/recipes-core/gettext/gettext-0.16.1/gettext-error_print_progname.patch
>> @@ -2,6 +2,8 @@
>>   #
>>   # Commented by: Saul Wold<saul.wold@intel.com>
>>
>> +Upstream-Status: Inappropriate [configuration]
>> +
>>   diff -ur gettext-0.14.6/gettext-tools/lib/error.h gettext-0.14.6-patched/gettext-tools/lib/error.h
>>   --- gettext-0.14.6/gettext-tools/lib/error.h	2005-05-20 16:03:42.000000000 -0500
>>   +++ gettext-0.14.6-patched/gettext-tools/lib/error.h	2007-01-13 20:57:24.422168053 -0600
>> diff --git a/meta/recipes-core/gettext/gettext-0.16.1/gettext-vpath.patch b/meta/recipes-core/gettext/gettext-0.16.1/gettext-vpath.patch
>> index 62420b7..67b0a5a 100644
>> --- a/meta/recipes-core/gettext/gettext-0.16.1/gettext-vpath.patch
>> +++ b/meta/recipes-core/gettext/gettext-0.16.1/gettext-vpath.patch
>> @@ -2,6 +2,8 @@
>>   #
>>   # Commented by: Saul Wold<saul.wold@intel.com>
>>
>> +Upstream-Status: Pending
>> +
>>   Index: gettext-0.16.1/gettext-runtime/intl/Makefile.in
>>   ===================================================================
>>   --- gettext-0.16.1.orig/gettext-runtime/intl/Makefile.in	2006-11-27 09:02:00.000000000 -0800
>> diff --git a/meta/recipes-core/gettext/gettext-0.16.1/hardcode_macro_version.patch b/meta/recipes-core/gettext/gettext-0.16.1/hardcode_macro_version.patch
>> index ef57dc2..82ed04d 100644
>> --- a/meta/recipes-core/gettext/gettext-0.16.1/hardcode_macro_version.patch
>> +++ b/meta/recipes-core/gettext/gettext-0.16.1/hardcode_macro_version.patch
>> @@ -2,6 +2,8 @@ This patch hardcodes in version 0.17 for the GETTEXT_MACRO_VERSION,
>>   the version check is only part of 0.17 and will not affect any 0.16.1
>>   operations
>>
>> +Upstream-Status: Inappropriate [configuration]
>> +
>>   Signed-off-by: Saul Wold<sgw@linux.intel.com>
>>
>>   Index: gettext-0.16.1/gettext-runtime/m4/po.m4
>> diff --git a/meta/recipes-core/gettext/gettext-0.16.1/linklib_from_0.17.patch b/meta/recipes-core/gettext/gettext-0.16.1/linklib_from_0.17.patch
>> index 2b805c9..3cbe867 100644
>> --- a/meta/recipes-core/gettext/gettext-0.16.1/linklib_from_0.17.patch
>> +++ b/meta/recipes-core/gettext/gettext-0.16.1/linklib_from_0.17.patch
>> @@ -2,6 +2,8 @@
>>   #
>>   # Commented by: Saul Wold<saul.wold@intel.com>
>>
>> +Upstream-Status: Inappropriate [configuration]
>> +
>>   Index: gettext-0.16.1/autoconf-lib-link/m4/lib-link.m4
>>   ===================================================================
>>   --- gettext-0.16.1.orig/autoconf-lib-link/m4/lib-link.m4	2006-11-27 09:01:58.000000000 -0800
>> diff --git a/meta/recipes-core/gettext/gettext-0.17/wchar-uclibc.patch b/meta/recipes-core/gettext/gettext-0.17/wchar-uclibc.patch
>> deleted file mode 100644
>> index 7b3880b..0000000
>> --- a/meta/recipes-core/gettext/gettext-0.17/wchar-uclibc.patch
>> +++ /dev/null
>> @@ -1,96 +0,0 @@
>> -Index: gettext-0.17/gettext-runtime/gnulib-lib/wchar.in.h
>> -===================================================================
>> ---- gettext-0.17.orig/gettext-runtime/gnulib-lib/wchar.in.h	2008-07-29 14:51:52.336394636 +0200
>> -+++ gettext-0.17/gettext-runtime/gnulib-lib/wchar.in.h	2008-07-29 14:52:25.546430195 +0200
>> -@@ -1,6 +1,6 @@
>> - /* A substitute for ISO C99<wchar.h>, for platforms that have issues.
>> -
>> --   Copyright (C) 2007 Free Software Foundation, Inc.
>> -+   Copyright (C) 2007-2008 Free Software Foundation, Inc.
>> -
>> -    This program is free software; you can redistribute it and/or modify
>> -    it under the terms of the GNU General Public License as published by
>> -@@ -26,6 +26,14 @@
>> -  * the declaration of wcwidth().
>> -  */
>> -
>> -+#ifdef __need_mbstate_t
>> -+/* Special invocation convention inside uClibc header files.  */
>> -+
>> -+#@INCLUDE_NEXT@ @NEXT_WCHAR_H@
>> -+
>> -+#else
>> -+/* Normal invocation convention.  */
>> -+
>> - #ifndef _GL_WCHAR_H
>> -
>> - /* Tru64 with Desktop Toolkit C has a bug:<stdio.h>  must be included before
>> -@@ -80,3 +88,4 @@
>> -
>> - #endif /* _GL_WCHAR_H */
>> - #endif /* _GL_WCHAR_H */
>> -+#endif
>> -Index: gettext-0.17/gettext-tools/gnulib-lib/wchar.in.h
>> -===================================================================
>> ---- gettext-0.17.orig/gettext-tools/gnulib-lib/wchar.in.h	2008-07-29 14:52:03.886393956 +0200
>> -+++ gettext-0.17/gettext-tools/gnulib-lib/wchar.in.h	2008-07-29 14:52:50.876388000 +0200
>> -@@ -1,6 +1,6 @@
>> - /* A substitute for ISO C99<wchar.h>, for platforms that have issues.
>> -
>> --   Copyright (C) 2007 Free Software Foundation, Inc.
>> -+   Copyright (C) 2007-2008 Free Software Foundation, Inc.
>> -
>> -    This program is free software; you can redistribute it and/or modify
>> -    it under the terms of the GNU General Public License as published by
>> -@@ -26,6 +26,14 @@
>> -  * the declaration of wcwidth().
>> -  */
>> -
>> -+#ifdef __need_mbstate_t
>> -+/* Special invocation convention inside uClibc header files.  */
>> -+
>> -+#@INCLUDE_NEXT@ @NEXT_WCHAR_H@
>> -+
>> -+#else
>> -+/* Normal invocation convention.  */
>> -+
>> - #ifndef _GL_WCHAR_H
>> -
>> - /* Tru64 with Desktop Toolkit C has a bug:<stdio.h>  must be included before
>> -@@ -80,3 +88,4 @@
>> -
>> - #endif /* _GL_WCHAR_H */
>> - #endif /* _GL_WCHAR_H */
>> -+#endif
>> -Index: gettext-0.17/gettext-tools/libgettextpo/wchar.in.h
>> -===================================================================
>> ---- gettext-0.17.orig/gettext-tools/libgettextpo/wchar.in.h	2008-07-29 14:51:58.826395009 +0200
>> -+++ gettext-0.17/gettext-tools/libgettextpo/wchar.in.h	2008-07-29 14:52:38.609723575 +0200
>> -@@ -1,6 +1,6 @@
>> - /* A substitute for ISO C99<wchar.h>, for platforms that have issues.
>> -
>> --   Copyright (C) 2007 Free Software Foundation, Inc.
>> -+   Copyright (C) 2007-2008 Free Software Foundation, Inc.
>> -
>> -    This program is free software; you can redistribute it and/or modify
>> -    it under the terms of the GNU General Public License as published by
>> -@@ -26,6 +26,14 @@
>> -  * the declaration of wcwidth().
>> -  */
>> -
>> -+#ifdef __need_mbstate_t
>> -+/* Special invocation convention inside uClibc header files.  */
>> -+
>> -+#@INCLUDE_NEXT@ @NEXT_WCHAR_H@
>> -+
>> -+#else
>> -+/* Normal invocation convention.  */
>> -+
>> - #ifndef _GL_WCHAR_H
>> -
>> - /* Tru64 with Desktop Toolkit C has a bug:<stdio.h>  must be included before
>> -@@ -80,3 +88,4 @@
>> -
>> - #endif /* _GL_WCHAR_H */
>> - #endif /* _GL_WCHAR_H */
>> -+#endif
>> diff --git a/meta/recipes-core/gettext/gettext-0.17/autotools.patch b/meta/recipes-core/gettext/gettext-0.18.1.1/autotools.patch
>> similarity index 98%
>> rename from meta/recipes-core/gettext/gettext-0.17/autotools.patch
>> rename to meta/recipes-core/gettext/gettext-0.18.1.1/autotools.patch
>> index 9f16b18..e4545fd 100644
>> --- a/meta/recipes-core/gettext/gettext-0.17/autotools.patch
>> +++ b/meta/recipes-core/gettext/gettext-0.18.1.1/autotools.patch
>> @@ -1,3 +1,5 @@
>> +Upstream-Status: Inappropriate [configuration]
>> +
>>   Index: gettext-0.17/gettext-runtime/man/Makefile.am
>>   ===================================================================
>>   --- gettext-0.17.orig/gettext-runtime/man/Makefile.am	2007-10-07 21:37:36.000000000 +0200
>> diff --git a/meta/recipes-core/gettext/gettext-0.17/gettext-error_print_progname.patch b/meta/recipes-core/gettext/gettext-0.18.1.1/gettext-error_print_progname.patch
>> similarity index 96%
>> rename from meta/recipes-core/gettext/gettext-0.17/gettext-error_print_progname.patch
>> rename to meta/recipes-core/gettext/gettext-0.18.1.1/gettext-error_print_progname.patch
>> index 0f67cd0..4a1b2c6 100644
>> --- a/meta/recipes-core/gettext/gettext-0.17/gettext-error_print_progname.patch
>> +++ b/meta/recipes-core/gettext/gettext-0.18.1.1/gettext-error_print_progname.patch
>> @@ -1,3 +1,5 @@
>> +Upstream-Status: Pending
>> +
>>   Index: gettext-0.17/gettext-tools/libgettextpo/error.h
>>   ===================================================================
>>   --- gettext-0.17.orig/gettext-tools/libgettextpo/error.h	2008-07-27 21:16:25.561115527 +0200
>> diff --git a/meta/recipes-core/gettext/gettext-0.17/m4fix.patch b/meta/recipes-core/gettext/gettext-0.18.1.1/m4fix.patch
>> similarity index 98%
>> rename from meta/recipes-core/gettext/gettext-0.17/m4fix.patch
>> rename to meta/recipes-core/gettext/gettext-0.18.1.1/m4fix.patch
>> index a02457f..34930d1 100644
>> --- a/meta/recipes-core/gettext/gettext-0.17/m4fix.patch
>> +++ b/meta/recipes-core/gettext/gettext-0.18.1.1/m4fix.patch
>> @@ -22,6 +22,8 @@ Ralf
>>           * m4/openmp.m4 (AC_OPENMP): Do not define with Autoconf 2.62 or
>>           newer.
>>
>> +Upstream-Status: Pending
>> +
>>   Index: gettext-0.17/gettext-tools/gnulib-m4/openmp.m4
>>   ===================================================================
>>   --- gettext-0.17.orig/gettext-tools/gnulib-m4/openmp.m4	2010-02-01 10:51:00.437788710 +0000
>> diff --git a/meta/recipes-core/gettext/gettext-0.17/use_open_properly.patch b/meta/recipes-core/gettext/gettext-0.18.1.1/use_open_properly.patch
>> similarity index 96%
>> rename from meta/recipes-core/gettext/gettext-0.17/use_open_properly.patch
>> rename to meta/recipes-core/gettext/gettext-0.18.1.1/use_open_properly.patch
>> index 111714b..a04a32d 100644
>> --- a/meta/recipes-core/gettext/gettext-0.17/use_open_properly.patch
>> +++ b/meta/recipes-core/gettext/gettext-0.18.1.1/use_open_properly.patch
>> @@ -1,3 +1,5 @@
>> +Upstream-Status: Pending
>> +
>>   Index: gettext-0.17/gettext-tools/src/write-catalog.c
>>   ===================================================================
>>   --- gettext-0.17.orig/gettext-tools/src/write-catalog.c	2008-10-16 15:18:16.000000000 +0200
>> diff --git a/meta/recipes-core/gettext/gettext-0.18.1.1/wchar-uclibc.patch b/meta/recipes-core/gettext/gettext-0.18.1.1/wchar-uclibc.patch
>> new file mode 100644
>> index 0000000..34e3f1a
>> --- /dev/null
>> +++ b/meta/recipes-core/gettext/gettext-0.18.1.1/wchar-uclibc.patch
>> @@ -0,0 +1,74 @@
>> +Upstream-Status: Pending
>> +
>> +Index: gettext-0.18.1.1/gettext-runtime/gnulib-lib/wchar.in.h
>> +===================================================================
>> +--- gettext-0.18.1.1.orig/gettext-runtime/gnulib-lib/wchar.in.h	2010-05-08 18:36:16.000000000 -0700
>> ++++ gettext-0.18.1.1/gettext-runtime/gnulib-lib/wchar.in.h	2011-05-25 16:28:38.656220937 -0700
>> +@@ -48,6 +48,14 @@
>> + #else
>> + /* Normal invocation convention.  */
>> +
>> ++#ifdef __need_mbstate_t
>> ++/* Special invocation convention inside uClibc header files.  */
>> ++
>> ++#@INCLUDE_NEXT@ @NEXT_WCHAR_H@
>> ++
>> ++#else
>> ++/* Normal invocation convention.  */
>> ++
>> + #ifndef _GL_WCHAR_H
>> +
>> + #define _GL_ALREADY_INCLUDING_WCHAR_H
>> +@@ -426,3 +434,4 @@
>> + #endif /* _GL_WCHAR_H */
>> + #endif /* _GL_WCHAR_H */
>> + #endif
>> ++#endif
>> +Index: gettext-0.18.1.1/gettext-tools/gnulib-lib/wchar.in.h
>> +===================================================================
>> +--- gettext-0.18.1.1.orig/gettext-tools/gnulib-lib/wchar.in.h	2010-05-24 02:42:48.000000000 -0700
>> ++++ gettext-0.18.1.1/gettext-tools/gnulib-lib/wchar.in.h	2011-05-25 16:28:15.717360791 -0700
>> +@@ -48,6 +48,14 @@
>> + #else
>> + /* Normal invocation convention.  */
>> +
>> ++#ifdef __need_mbstate_t
>> ++/* Special invocation convention inside uClibc header files.  */
>> ++
>> ++#@INCLUDE_NEXT@ @NEXT_WCHAR_H@
>> ++
>> ++#else
>> ++/* Normal invocation convention.  */
>> ++
>> + #ifndef _GL_WCHAR_H
>> +
>> + #define _GL_ALREADY_INCLUDING_WCHAR_H
>> +@@ -426,3 +434,4 @@
>> + #endif /* _GL_WCHAR_H */
>> + #endif /* _GL_WCHAR_H */
>> + #endif
>> ++#endif
>> +Index: gettext-0.18.1.1/gettext-tools/libgettextpo/wchar.in.h
>> +===================================================================
>> +--- gettext-0.18.1.1.orig/gettext-tools/libgettextpo/wchar.in.h	2010-05-08 18:38:04.000000000 -0700
>> ++++ gettext-0.18.1.1/gettext-tools/libgettextpo/wchar.in.h	2011-05-25 16:28:26.998721087 -0700
>> +@@ -48,6 +48,14 @@
>> + #else
>> + /* Normal invocation convention.  */
>> +
>> ++#ifdef __need_mbstate_t
>> ++/* Special invocation convention inside uClibc header files.  */
>> ++
>> ++#@INCLUDE_NEXT@ @NEXT_WCHAR_H@
>> ++
>> ++#else
>> ++/* Normal invocation convention.  */
>> ++
>> + #ifndef _GL_WCHAR_H
>> +
>> + #define _GL_ALREADY_INCLUDING_WCHAR_H
>> +@@ -426,3 +434,4 @@
>> + #endif /* _GL_WCHAR_H */
>> + #endif /* _GL_WCHAR_H */
>> + #endif
>> ++#endif
>> diff --git a/meta/recipes-core/gettext/gettext_0.17.bb b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
>> similarity index 90%
>> rename from meta/recipes-core/gettext/gettext_0.17.bb
>> rename to meta/recipes-core/gettext/gettext_0.18.1.1.bb
>> index ce5fc3e..fe1b266 100644
>> --- a/meta/recipes-core/gettext/gettext_0.17.bb
>> +++ b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
>> @@ -5,24 +5,21 @@ SECTION = "libs"
>>   LICENSE = "GPLv3"
>>   LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>>
>> -PR = "r5"
>> +PR = "r0"
>>   DEPENDS = "gettext-native virtual/libiconv ncurses expat"
>>   DEPENDS_virtclass-native = ""
>>   PROVIDES = "virtual/libintl virtual/gettext"
>>   PROVIDES_virtclass-native = ""
>>   CONFLICTS_${PN} = "proxy-libintl"
>>   SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
>> -           file://autotools.patch;patch=1 \
>> -           file://wchar-uclibc.patch;patch=1 \
>> -           file://use_open_properly.patch;patch=1 \
>> -           file://m4fix.patch;patch=1 \
>> +           file://wchar-uclibc.patch \
>>             "
>>
>>   SRC_URI_append_linux-uclibc = " file://gettext-error_print_progname.patch;patch=1"
>>   SRC_URI_append_linux-uclibceabi = " file://gettext-error_print_progname.patch;patch=1"
>>
>> -SRC_URI[md5sum] = "58a2bc6d39c0ba57823034d55d65d606"
>> -SRC_URI[sha256sum] = "209638bb8e162f22c281145a34e220c66f1f6e9ff5e4c50c6f2ef2ded59537ba"
>> +SRC_URI[md5sum] = "3dd55b952826d2b32f51308f2f91aa89"
>> +SRC_URI[sha256sum] = "93ac71a7afa5b70c1b1032516663658c51e653087f42a3fc8044752c026443e9"
>>
>>   #PARALLEL_MAKE = ""
>>
>> @@ -39,8 +36,7 @@ EXTRA_OECONF += "--without-lispdir \
>>                    --without-emacs \
>>                   "
>>
>> -acpaths = '-I ${S}/autoconf-lib-link/m4/ \
>> -           -I ${S}/gettext-runtime/m4 \
>> +acpaths = '-I ${S}/gettext-runtime/m4 \
>>              -I ${S}/gettext-tools/m4'
>>
>>
>
>
> I assume you did a complete build from scratch for testing gettext
> upgrade that is using no sstate.

Clean no sstate.

Sau!

> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.11 (GNU/Linux)
> Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/
>
> iEYEARECAAYFAk3l3QgACgkQuwUzVZGdMxRpEQCfRyTZL6AwQfU7OL4Ee6Nbpt4C
> gvgAnjOjf/0T7XBPOmyD5i8OCqm0x5Nd
> =PO6E
> -----END PGP SIGNATURE-----
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


