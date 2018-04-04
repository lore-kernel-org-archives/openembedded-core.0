Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3165C745C6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 05:46:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w345kCZR022493
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 3 Apr 2018 22:46:13 -0700
Received: from [128.224.163.159] (128.224.163.159) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 3 Apr 2018 22:46:05 -0700
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1522399417.git.hongxu.jia@windriver.com>
	<4ead7c624b44292b85b21d82a731e1af0378d819.1522399417.git.hongxu.jia@windriver.com>
	<CA+chaQcySp4rBQaSHJ1NRFQa05uKZkP6QOuSnDH0BYuCOaEHzA@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <d63aa1d1-8e36-001d-d565-60e4fd40f78b@windriver.com>
Date: Wed, 4 Apr 2018 13:46:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQcySp4rBQaSHJ1NRFQa05uKZkP6QOuSnDH0BYuCOaEHzA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 4/7] libgpg-error: 1.27 -> 1.28
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Apr 2018 05:46:14 -0000
Content-Type: multipart/alternative;
	boundary="------------5ED6118CE99FC15ECB501C0F"
Content-Language: en-US

--------------5ED6118CE99FC15ECB501C0F
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2018年04月04日 02:35, Martin Jansa wrote:
> This seems to cause:
>
> | ../../libgpg-error-1.28/src/logging.c: In function 
> '_gpgrt_log_printhex':
> | ../../libgpg-error-1.28/src/logging.c:1153:49: error: incompatible 
> type for argument 4 of '_gpgrt_logv_printhex'
> |      _gpgrt_logv_printhex (buffer, length, NULL, NULL);
> |                                                  ^~~~
> | ../../libgpg-error-1.28/src/logging.c:1097:1: note: expected 
> 'va_list {aka __va_list}' but argument is of type 'void *'
> |  _gpgrt_logv_printhex (const void *buffer, size_t length,
> |  ^~~~~~~~~~~~~~~~~~~~
> | make[3]: *** [libgpg_error_la-logging.lo] Error 1
>
> which looks the same as:
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=893370
>

Yes, backport a fix from upstream git repo could fix the issue

https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgpg-error.git;a=commitdiff;h=791177de023574223eddf7288eb7c5a0721ac623

V3 incoming

//Hongxu

>
> On Fri, Mar 30, 2018 at 10:52 AM, Hongxu Jia <hongxu.jia@windriver.com 
> <mailto:hongxu.jia@windriver.com>> wrote:
>
>     - Rebase pkgconfig.patch
>
>     License-Update: copyright years
>
>     Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com
>     <mailto:hongxu.jia@windriver.com>>
>     ---
>      .../libgpg-error/libgpg-error/pkgconfig.patch     | 67
>     +++++++++++++---------
>      .../{libgpg-error_1.27.bb <http://libgpg-error_1.27.bb> =>
>     libgpg-error_1.28.bb <http://libgpg-error_1.28.bb>} |  6 +-
>      2 files changed, 44 insertions(+), 29 deletions(-)
>      rename meta/recipes-support/libgpg-error/{libgpg-error_1.27.bb
>     <http://libgpg-error_1.27.bb> => libgpg-error_1.28.bb
>     <http://libgpg-error_1.28.bb>} (88%)
>
>     diff --git
>     a/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
>     b/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
>     index 9ffeedb..3066613 100644
>     --- a/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
>     +++ b/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
>     @@ -1,15 +1,26 @@
>     -
>     -#
>     -# Patch managed by
>     http://www.mn-logistik.de/unsupported/pxa250/patcher
>     <http://www.mn-logistik.de/unsupported/pxa250/patcher>
>     -#
>     +From ec309e20b5a27d42a5fb915c328d61e924ab5f19 Mon Sep 17 00:00:00
>     2001
>     +From: Hongxu Jia <hongxu.jia@windriver.com
>     <mailto:hongxu.jia@windriver.com>>
>     +Date: Thu, 29 Mar 2018 15:12:17 +0800
>     +Subject: [PATCH] support pkgconfig
>
>      Upstream-Status: Pending
>
>     -Index: libgpg-error-1.17/configure.ac <http://configure.ac>
>     -===================================================================
>     ---- libgpg-error-1.17.orig/configure.ac <http://configure.ac>
>     -+++ libgpg-error-1.17/configure.ac <http://configure.ac>
>     -@@ -529,6 +529,7 @@ AC_CONFIG_FILES([src/Makefile tests/Make
>     +Rebase to 1.28
>     +
>     +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com
>     <mailto:hongxu.jia@windriver.com>>
>     +---
>     + configure.ac <http://configure.ac>       |  1 +
>     + src/Makefile.am     |  4 ++-
>     + src/gpg-error.m4    | 71
>     +++--------------------------------------------------
>     + src/gpg-error.pc.in <http://gpg-error.pc.in> | 11 +++++++++
>     + 4 files changed, 18 insertions(+), 69 deletions(-)
>     + create mode 100644 src/gpg-error.pc.in <http://gpg-error.pc.in>
>     +
>     +diff --git a/configure.ac <http://configure.ac> b/configure.ac
>     <http://configure.ac>
>     +index aca9300..f7794e9 100644
>     +--- a/configure.ac <http://configure.ac>
>     ++++ b/configure.ac <http://configure.ac>
>     +@@ -621,6 +621,7 @@ AC_CONFIG_FILES([src/Makefile tests/Makefile])
>       AC_CONFIG_FILES([lang/Makefile lang/cl/Makefile
>     lang/cl/gpg-error.asd])
>       AC_CONFIG_FILES([src/versioninfo.rc src/gpg-error.w32-manifest])
>       AC_CONFIG_FILES([src/gpg-error-config], [chmod +x
>     src/gpg-error-config])
>     @@ -17,33 +28,33 @@ Index: libgpg-error-1.17/configure.ac
>     <http://configure.ac>
>
>       AC_OUTPUT
>
>     -Index: libgpg-error-1.17/src/Makefile.am
>     -===================================================================
>     ---- libgpg-error-1.17.orig/src/Makefile.am
>     -+++ libgpg-error-1.17/src/Makefile.am
>     -@@ -75,6 +75,8 @@ nodist_include_HEADERS = gpg-error.h
>     - bin_SCRIPTS = gpg-error-config
>     +diff --git a/src/Makefile.am b/src/Makefile.am
>     +index 268c2ab..95f8459 100644
>     +--- a/src/Makefile.am
>     ++++ b/src/Makefile.am
>     +@@ -87,6 +87,8 @@ bin_SCRIPTS = gpg-error-config
>     + nodist_bin_SCRIPTS = gpgrt-config
>       m4datadir = $(datadir)/aclocal
>     - m4data_DATA = gpg-error.m4
>     + m4data_DATA = gpg-error.m4 gpgrt.m4
>      +pkgconfigdir = $(libdir)/pkgconfig
>      +pkgconfig_DATA = gpg-error.pc
>
>       EXTRA_DIST = mkstrtable.awk err-sources.h.in
>     <http://err-sources.h.in> err-codes.h.in <http://err-codes.h.in> \
>             mkerrnos.awk errnos.in <http://errnos.in> README \
>     -@@ -82,7 +84,7 @@ EXTRA_DIST = mkstrtable.awk err-sources.
>     +@@ -94,7 +96,7 @@ EXTRA_DIST = mkstrtable.awk err-sources.h.in
>     <http://err-sources.h.in> err-codes.h.in <http://err-codes.h.in> \
>             mkheader.c gpg-error.h.in <http://gpg-error.h.in>
>     mkw32errmap.c w32-add.h w32ce-add.h \
>     -       err-sources.h err-codes.h gpg-error-config.in
>     <http://gpg-error-config.in> gpg-error.m4 \
>     +       err-sources.h err-codes.h gpg-error-config.in
>     <http://gpg-error-config.in> gpg-error.m4 gpgrt.m4 \
>             gpg-error.vers gpg-error.def.in <http://gpg-error.def.in> \
>      - versioninfo.rc.in <http://versioninfo.rc.in>
>     gpg-error.w32-manifest.in <http://gpg-error.w32-manifest.in> \
>      + versioninfo.rc.in <http://versioninfo.rc.in>
>     gpg-error.w32-manifest.in <http://gpg-error.w32-manifest.in>
>     gpg-error.pc \
>             $(lock_obj_pub)
>
>       BUILT_SOURCES = err-sources.h err-codes.h code-to-errno.h
>     code-from-errno.h \
>     -Index: libgpg-error-1.17/src/gpg-error.m4
>     -===================================================================
>     ---- libgpg-error-1.17.orig/src/gpg-error.m4
>     -+++ libgpg-error-1.17/src/gpg-error.m4
>     -@@ -26,73 +26,13 @@ dnl is added to the gpg_config_script_wa
>     +diff --git a/src/gpg-error.m4 b/src/gpg-error.m4
>     +index 60c88d8..2ef7e3e 100644
>     +--- a/src/gpg-error.m4
>     ++++ b/src/gpg-error.m4
>     +@@ -26,73 +26,13 @@ dnl is added to the gpg_config_script_warn
>     variable.
>       dnl
>       AC_DEFUN([AM_PATH_GPG_ERROR],
>       [ AC_REQUIRE([AC_CANONICAL_HOST])
>     @@ -132,10 +143,11 @@ Index: libgpg-error-1.17/src/gpg-error.m4
>           ifelse([$3], , :, [$3])
>         fi
>         AC_SUBST(GPG_ERROR_CFLAGS)
>     -Index: libgpg-error-1.17/src/gpg-error.pc.in <http://gpg-error.pc.in>
>     -===================================================================
>     +diff --git a/src/gpg-error.pc.in <http://gpg-error.pc.in>
>     b/src/gpg-error.pc.in <http://gpg-error.pc.in>
>     +new file mode 100644
>     +index 0000000..bc0b174
>      --- /dev/null
>     -+++ libgpg-error-1.17/src/gpg-error.pc.in <http://gpg-error.pc.in>
>     ++++ b/src/gpg-error.pc.in <http://gpg-error.pc.in>
>      @@ -0,0 +1,11 @@
>      +prefix=@prefix@
>      +exec_prefix=@exec_prefix@
>     @@ -148,3 +160,6 @@ Index: libgpg-error-1.17/src/gpg-error.pc.in
>     <http://gpg-error.pc.in>
>      +Version: @VERSION@
>      +Libs: -L${libdir} -lgpg-error
>      +Cflags: -I${includedir}
>     +--
>     +1.8.3.1
>     +
>     diff --git
>     a/meta/recipes-support/libgpg-error/libgpg-error_1.27.bb
>     <http://libgpg-error_1.27.bb>
>     b/meta/recipes-support/libgpg-error/libgpg-error_1.28.bb
>     <http://libgpg-error_1.28.bb>
>     similarity index 88%
>     rename from meta/recipes-support/libgpg-error/libgpg-error_1.27.bb
>     <http://libgpg-error_1.27.bb>
>     rename to meta/recipes-support/libgpg-error/libgpg-error_1.28.bb
>     <http://libgpg-error_1.28.bb>
>     index b74f079..2be297d 100644
>     --- a/meta/recipes-support/libgpg-error/libgpg-error_1.27.bb
>     <http://libgpg-error_1.27.bb>
>     +++ b/meta/recipes-support/libgpg-error/libgpg-error_1.28.bb
>     <http://libgpg-error_1.28.bb>
>     @@ -5,7 +5,7 @@ BUGTRACKER = "https://bugs.g10code.com/gnupg/index
>     <https://bugs.g10code.com/gnupg/index>"
>      LICENSE = "GPLv2+ & LGPLv2.1+"
>      LIC_FILES_CHKSUM =
>     "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
>                        
>      file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
>     -                    file://src/gpg-error.h.in
>     <http://gpg-error.h.in>;endline=23;md5=beae1e44d8d5c265d194760276033a7c
>     \
>     +                    file://src/gpg-error.h.in
>     <http://gpg-error.h.in>;endline=23;md5=fc7423b56d5f7163a9a2acf9fe2f8d6b
>     \
>                        
>      file://src/init.c;endline=20;md5=872b2389fe9bae7ffb80d2b91225afbc"
>
>
>     @@ -16,8 +16,8 @@ SRC_URI =
>     "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${PV}.tar.bz2 \
>                 file://pkgconfig.patch \
>               "
>
>     -SRC_URI[md5sum] = "5217ef3e76a7275a2a3b569a12ddc989"
>     -SRC_URI[sha256sum] =
>     "4f93aac6fecb7da2b92871bb9ee33032be6a87b174f54abf8ddf0911a22d29d2"
>     +SRC_URI[md5sum] = "2b072f6194eb22d48cd4c7c77e59b5af"
>     +SRC_URI[sha256sum] =
>     "3edb957744905412f30de3e25da18682cbe509541e18cd3b8f9df695a075da49"
>
>      BINCONFIG = "${bindir}/gpg-error-config"
>
>     --
>     2.8.1
>
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>
>


--------------5ED6118CE99FC15ECB501C0F
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 2018年04月04日 02:35, Martin Jansa
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CA+chaQcySp4rBQaSHJ1NRFQa05uKZkP6QOuSnDH0BYuCOaEHzA@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">This seems to cause:
        <div><br>
        </div>
        <div>
          <div>| ../../libgpg-error-1.28/src/logging.c: In function
            '_gpgrt_log_printhex':</div>
          <div>| ../../libgpg-error-1.28/src/logging.c:1153:49: error:
            incompatible type for argument 4 of '_gpgrt_logv_printhex'</div>
          <div>|      _gpgrt_logv_printhex (buffer, length, NULL, NULL);</div>
          <div>|                                                  ^~~~</div>
          <div>| ../../libgpg-error-1.28/src/logging.c:1097:1: note:
            expected 'va_list {aka __va_list}' but argument is of type
            'void *'</div>
          <div>|  _gpgrt_logv_printhex (const void *buffer, size_t
            length,</div>
          <div>|  ^~~~~~~~~~~~~~~~~~~~</div>
          <div>| make[3]: *** [libgpg_error_la-logging.lo] Error 1</div>
        </div>
        <div><br>
        </div>
        <div>which looks the same as:</div>
        <div><a
            href="https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=893370"
            moz-do-not-send="true">https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=893370</a><br>
        </div>
        <div><br>
        </div>
      </div>
    </blockquote>
    <br>
    Yes, backport a fix from upstream git repo could fix the issue<br>
    <br>
<a class="moz-txt-link-freetext" href="https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgpg-error.git;a=commitdiff;h=791177de023574223eddf7288eb7c5a0721ac623">https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgpg-error.git;a=commitdiff;h=791177de023574223eddf7288eb7c5a0721ac623</a><br>
    <br>
    V3 incoming<br>
    <br>
    //Hongxu<br>
    <br>
    <blockquote type="cite"
cite="mid:CA+chaQcySp4rBQaSHJ1NRFQa05uKZkP6QOuSnDH0BYuCOaEHzA@mail.gmail.com">
      <div class="gmail_extra"><br>
        <div class="gmail_quote">On Fri, Mar 30, 2018 at 10:52 AM,
          Hongxu Jia <span dir="ltr">&lt;<a
              href="mailto:hongxu.jia@windriver.com" target="_blank"
              moz-do-not-send="true">hongxu.jia@windriver.com</a>&gt;</span>
          wrote:<br>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">- Rebase
            pkgconfig.patch<br>
            <br>
            License-Update: copyright years<br>
            <span class=""><br>
              Signed-off-by: Hongxu Jia &lt;<a
                href="mailto:hongxu.jia@windriver.com"
                moz-do-not-send="true">hongxu.jia@windriver.com</a>&gt;<br>
              ---<br>
            </span> .../libgpg-error/libgpg-error/<wbr>pkgconfig.patch 
                | 67 +++++++++++++---------<br>
             .../{<a href="http://libgpg-error_1.27.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">libgpg-error_1.27.bb</a>
            =&gt; <a href="http://libgpg-error_1.28.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">libgpg-error_1.28.bb</a>}
            |  6 +-<br>
             2 files changed, 44 insertions(+), 29 deletions(-)<br>
             rename meta/recipes-support/libgpg-<wbr>error/{<a
              href="http://libgpg-error_1.27.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">libgpg-error_1.27.bb</a>
            =&gt; <a href="http://libgpg-error_1.28.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">libgpg-error_1.28.bb</a>}
            (88%)<br>
            <br>
            diff --git a/meta/recipes-support/libgpg-<wbr>error/libgpg-error/pkgconfig.<wbr>patch
            b/meta/recipes-support/libgpg-<wbr>error/libgpg-error/pkgconfig.<wbr>patch<br>
            <span class="">index 9ffeedb..3066613 100644<br>
              --- a/meta/recipes-support/libgpg-<wbr>error/libgpg-error/pkgconfig.<wbr>patch<br>
            </span>+++ b/meta/recipes-support/libgpg-<wbr>error/libgpg-error/pkgconfig.<wbr>patch<br>
            <div>
              <div class="h5">@@ -1,15 +1,26 @@<br>
                -<br>
                -#<br>
                -# Patch managed by <a
                  href="http://www.mn-logistik.de/unsupported/pxa250/patcher"
                  rel="noreferrer" target="_blank"
                  moz-do-not-send="true">http://www.mn-logistik.de/<wbr>unsupported/pxa250/patcher</a><br>
                -#<br>
                +From ec309e20b5a27d42a5fb915c328d61<wbr>e924ab5f19 Mon
                Sep 17 00:00:00 2001<br>
                +From: Hongxu Jia &lt;<a
                  href="mailto:hongxu.jia@windriver.com"
                  moz-do-not-send="true">hongxu.jia@windriver.com</a>&gt;<br>
                +Date: Thu, 29 Mar 2018 15:12:17 +0800<br>
                +Subject: [PATCH] support pkgconfig<br>
                <br>
                 Upstream-Status: Pending<br>
                <br>
                -Index: libgpg-error-1.17/<a href="http://configure.ac"
                  rel="noreferrer" target="_blank"
                  moz-do-not-send="true">configure.ac</a><br>
                -=============================<wbr>==============================<wbr>========<br>
                ---- libgpg-error-1.17.orig/<a
                  href="http://configure.ac" rel="noreferrer"
                  target="_blank" moz-do-not-send="true">configu<wbr>re.ac</a><br>
                -+++ libgpg-error-1.17/<a href="http://configure.ac"
                  rel="noreferrer" target="_blank"
                  moz-do-not-send="true">configure.ac</a><br>
                -@@ -529,6 +529,7 @@ AC_CONFIG_FILES([src/Makefile
                tests/Make<br>
                +Rebase to 1.28<br>
                +<br>
                +Signed-off-by: Hongxu Jia &lt;<a
                  href="mailto:hongxu.jia@windriver.com"
                  moz-do-not-send="true">hongxu.jia@windriver.com</a>&gt;<br>
                +---<br>
                + <a href="http://configure.ac" rel="noreferrer"
                  target="_blank" moz-do-not-send="true">configure.ac</a> 
                      |  1 +<br>
                + src/Makefile.am     |  4 ++-<br>
                + src/gpg-error.m4    | 71
                +++---------------------------<wbr>-----------------------<br>
                + src/<a href="http://gpg-error.pc.in" rel="noreferrer"
                  target="_blank" moz-do-not-send="true">gpg-error.pc.in</a>
                | 11 +++++++++<br>
                + 4 files changed, 18 insertions(+), 69 deletions(-)<br>
                + create mode 100644 src/<a
                  href="http://gpg-error.pc.in" rel="noreferrer"
                  target="_blank" moz-do-not-send="true">gpg-error.pc.in</a><br>
                +<br>
                +diff --git a/<a href="http://configure.ac"
                  rel="noreferrer" target="_blank"
                  moz-do-not-send="true">configure.ac</a> b/<a
                  href="http://configure.ac" rel="noreferrer"
                  target="_blank" moz-do-not-send="true">configure.ac</a><br>
                +index aca9300..f7794e9 100644<br>
                +--- a/<a href="http://configure.ac" rel="noreferrer"
                  target="_blank" moz-do-not-send="true">configure.ac</a><br>
                ++++ b/<a href="http://configure.ac" rel="noreferrer"
                  target="_blank" moz-do-not-send="true">configure.ac</a><br>
                +@@ -621,6 +621,7 @@ AC_CONFIG_FILES([src/Makefile
                tests/Makefile])<br>
                  AC_CONFIG_FILES([lang/Makefile lang/cl/Makefile
                lang/cl/gpg-error.asd])<br>
                  AC_CONFIG_FILES([src/<wbr>versioninfo.rc
                src/gpg-error.w32-manifest])<br>
                  AC_CONFIG_FILES([src/gpg-<wbr>error-config], [chmod +x
                src/gpg-error-config])<br>
                @@ -17,33 +28,33 @@ Index: libgpg-error-1.17/<a
                  href="http://configure.ac" rel="noreferrer"
                  target="_blank" moz-do-not-send="true">configure.ac</a><br>
                <br>
                  AC_OUTPUT<br>
                <br>
                -Index: libgpg-error-1.17/src/<wbr>Makefile.am<br>
                -=============================<wbr>==============================<wbr>========<br>
                ---- libgpg-error-1.17.orig/src/<wbr>Makefile.am<br>
                -+++ libgpg-error-1.17/src/<wbr>Makefile.am<br>
                -@@ -75,6 +75,8 @@ nodist_include_HEADERS = gpg-error.h<br>
                - bin_SCRIPTS = gpg-error-config<br>
                +diff --git a/src/Makefile.am b/src/Makefile.am<br>
                +index 268c2ab..95f8459 100644<br>
                +--- a/src/Makefile.am<br>
                ++++ b/src/Makefile.am<br>
                +@@ -87,6 +87,8 @@ bin_SCRIPTS = gpg-error-config<br>
                + nodist_bin_SCRIPTS = gpgrt-config<br>
                  m4datadir = $(datadir)/aclocal<br>
                - m4data_DATA = gpg-error.m4<br>
                + m4data_DATA = gpg-error.m4 gpgrt.m4<br>
                 +pkgconfigdir = $(libdir)/pkgconfig<br>
                 +pkgconfig_DATA = gpg-error.pc<br>
                <br>
                  EXTRA_DIST = mkstrtable.awk <a
                  href="http://err-sources.h.in" rel="noreferrer"
                  target="_blank" moz-do-not-send="true">err-sources.h.in</a>
                <a href="http://err-codes.h.in" rel="noreferrer"
                  target="_blank" moz-do-not-send="true">err-codes.h.in</a>
                \<br>
                        mkerrnos.awk <a href="http://errnos.in"
                  rel="noreferrer" target="_blank"
                  moz-do-not-send="true">errnos.in</a> README \<br>
                -@@ -82,7 +84,7 @@ EXTRA_DIST = mkstrtable.awk
                err-sources.<br>
                +@@ -94,7 +96,7 @@ EXTRA_DIST = mkstrtable.awk <a
                  href="http://err-sources.h.in" rel="noreferrer"
                  target="_blank" moz-do-not-send="true">err-sources.h.in</a>
                <a href="http://err-codes.h.in" rel="noreferrer"
                  target="_blank" moz-do-not-send="true">err-codes.h.in</a>
                \<br>
                        mkheader.c <a href="http://gpg-error.h.in"
                  rel="noreferrer" target="_blank"
                  moz-do-not-send="true">gpg-error.h.in</a>
                mkw32errmap.c w32-add.h w32ce-add.h \<br>
                -       err-sources.h err-codes.h <a
                  href="http://gpg-error-config.in" rel="noreferrer"
                  target="_blank" moz-do-not-send="true">gpg-error-config.in</a>
                gpg-error.m4 \<br>
                +       err-sources.h err-codes.h <a
                  href="http://gpg-error-config.in" rel="noreferrer"
                  target="_blank" moz-do-not-send="true">gpg-error-config.in</a>
                gpg-error.m4 gpgrt.m4 \<br>
                        gpg-error.vers <a
                  href="http://gpg-error.def.in" rel="noreferrer"
                  target="_blank" moz-do-not-send="true">gpg-error.def.in</a>
                \<br>
                 -        <a href="http://versioninfo.rc.in"
                  rel="noreferrer" target="_blank"
                  moz-do-not-send="true">versioninfo.rc.in</a> <a
                  href="http://gpg-error.w32-manifest.in"
                  rel="noreferrer" target="_blank"
                  moz-do-not-send="true">gpg-error.w32-manifest.in</a> \<br>
                 +        <a href="http://versioninfo.rc.in"
                  rel="noreferrer" target="_blank"
                  moz-do-not-send="true">versioninfo.rc.in</a> <a
                  href="http://gpg-error.w32-manifest.in"
                  rel="noreferrer" target="_blank"
                  moz-do-not-send="true">gpg-error.w32-manifest.in</a>
                gpg-error.pc \<br>
                        $(lock_obj_pub)<br>
                <br>
                  BUILT_SOURCES = err-sources.h err-codes.h
                code-to-errno.h code-from-errno.h \<br>
                -Index: libgpg-error-1.17/src/gpg-<wbr>error.m4<br>
                -=============================<wbr>==============================<wbr>========<br>
                ---- libgpg-error-1.17.orig/src/<wbr>gpg-error.m4<br>
                -+++ libgpg-error-1.17/src/gpg-<wbr>error.m4<br>
                -@@ -26,73 +26,13 @@ dnl is added to the
                gpg_config_script_wa<br>
                +diff --git a/src/gpg-error.m4 b/src/gpg-error.m4<br>
                +index 60c88d8..2ef7e3e 100644<br>
                +--- a/src/gpg-error.m4<br>
                ++++ b/src/gpg-error.m4<br>
                +@@ -26,73 +26,13 @@ dnl is added to the
                gpg_config_script_warn variable.<br>
                  dnl<br>
                  AC_DEFUN([AM_PATH_GPG_ERROR],<br>
                  [ AC_REQUIRE([AC_CANONICAL_HOST]<wbr>)<br>
                @@ -132,10 +143,11 @@ Index: libgpg-error-1.17/src/gpg-<wbr>error.m4<br>
                      ifelse([$3], , :, [$3])<br>
                    fi<br>
                    AC_SUBST(GPG_ERROR_CFLAGS)<br>
                -Index: libgpg-error-1.17/src/<a
                  href="http://gpg-error.pc.in" rel="noreferrer"
                  target="_blank" moz-do-not-send="true">gpg-<wbr>error.pc.in</a><br>
                -=============================<wbr>==============================<wbr>========<br>
                +diff --git a/src/<a href="http://gpg-error.pc.in"
                  rel="noreferrer" target="_blank"
                  moz-do-not-send="true">gpg-error.pc.in</a> b/src/<a
                  href="http://gpg-error.pc.in" rel="noreferrer"
                  target="_blank" moz-do-not-send="true">gpg-error.pc.in</a><br>
                +new file mode 100644<br>
                +index 0000000..bc0b174<br>
                 --- /dev/null<br>
                -+++ libgpg-error-1.17/src/<a
                  href="http://gpg-error.pc.in" rel="noreferrer"
                  target="_blank" moz-do-not-send="true">gpg-<wbr>error.pc.in</a><br>
                ++++ b/src/<a href="http://gpg-error.pc.in"
                  rel="noreferrer" target="_blank"
                  moz-do-not-send="true">gpg-error.pc.in</a><br>
                 @@ -0,0 +1,11 @@<br>
                 +prefix=@prefix@<br>
                 +exec_prefix=@exec_prefix@<br>
                @@ -148,3 +160,6 @@ Index: libgpg-error-1.17/src/<a
                  href="http://gpg-error.pc.in" rel="noreferrer"
                  target="_blank" moz-do-not-send="true">gpg-<wbr>error.pc.in</a><br>
                 +Version: @VERSION@<br>
                 +Libs: -L${libdir} -lgpg-error<br>
                 +Cflags: -I${includedir}<br>
                +--<br>
                +1.8.3.1<br>
                +<br>
                diff --git a/meta/recipes-support/libgpg-<wbr>error/<a
                  href="http://libgpg-error_1.27.bb" rel="noreferrer"
                  target="_blank" moz-do-not-send="true">libgpg-error_1.27.bb</a>
                b/meta/recipes-support/libgpg-<wbr>error/<a
                  href="http://libgpg-error_1.28.bb" rel="noreferrer"
                  target="_blank" moz-do-not-send="true">libgpg-error_1.28.bb</a><br>
              </div>
            </div>
            similarity index 88%<br>
            <span class="">rename from meta/recipes-support/libgpg-<wbr>error/<a
                href="http://libgpg-error_1.27.bb" rel="noreferrer"
                target="_blank" moz-do-not-send="true">libgpg-error_1.27.bb</a><br>
              rename to meta/recipes-support/libgpg-<wbr>error/<a
                href="http://libgpg-error_1.28.bb" rel="noreferrer"
                target="_blank" moz-do-not-send="true">libgpg-error_1.28.bb</a><br>
            </span>index b74f079..2be297d 100644<br>
            <span class="">--- a/meta/recipes-support/libgpg-<wbr>error/<a
                href="http://libgpg-error_1.27.bb" rel="noreferrer"
                target="_blank" moz-do-not-send="true">libgpg-error_1.27.bb</a><br>
              +++ b/meta/recipes-support/libgpg-<wbr>error/<a
                href="http://libgpg-error_1.28.bb" rel="noreferrer"
                target="_blank" moz-do-not-send="true">libgpg-error_1.28.bb</a><br>
              @@ -5,7 +5,7 @@ BUGTRACKER = "<a
                href="https://bugs.g10code.com/gnupg/index"
                rel="noreferrer" target="_blank" moz-do-not-send="true">https://bugs.g10code.com/<wbr>gnupg/index</a>"<br>
               LICENSE = "GPLv2+ &amp; LGPLv2.1+"<br>
               LIC_FILES_CHKSUM = "<a class="moz-txt-link-freetext" href="file://COPYING;md5=">file://COPYING;md5=</a><wbr>59530bdf33659b29e73d4adb9f9f65<wbr>52
              \<br>
                                   <a class="moz-txt-link-freetext" href="file://COPYING.LIB;md5=">file://COPYING.LIB;md5=</a><wbr>2d5025d4aa3495befef8f17206a5b0<wbr>a1
              \<br>
              -                    <a class="moz-txt-link-freetext" href="file://src/">file://src/</a><a
                href="http://gpg-error.h.in" rel="noreferrer"
                target="_blank" moz-do-not-send="true">gpg-error.h.in</a>;<wbr>endline=23;md5=<wbr>beae1e44d8d5c265d194760276033a<wbr>7c
              \<br>
              +                    <a class="moz-txt-link-freetext" href="file://src/">file://src/</a><a
                href="http://gpg-error.h.in" rel="noreferrer"
                target="_blank" moz-do-not-send="true">gpg-error.h.in</a>;<wbr>endline=23;md5=<wbr>fc7423b56d5f7163a9a2acf9fe2f8d<wbr>6b
              \<br>
                                   <a class="moz-txt-link-freetext" href="file://src/init.c;endline=20">file://src/init.c;endline=20</a>;<wbr>md5=<wbr>872b2389fe9bae7ffb80d2b91225af<wbr>bc"<br>
              <br>
              <br>
            </span>@@ -16,8 +16,8 @@ SRC_URI =
            "${GNUPG_MIRROR}/libgpg-error/<wbr>libgpg-error-${PV}.tar.bz2
            \<br>
                        <a class="moz-txt-link-freetext" href="file://pkgconfig.patch">file://pkgconfig.patch</a> \<br>
            <div class="HOEnZb">
              <div class="h5">          "<br>
                <br>
                -SRC_URI[md5sum] = "<wbr>5217ef3e76a7275a2a3b569a12ddc9<wbr>89"<br>
                -SRC_URI[sha256sum] = "<wbr>4f93aac6fecb7da2b92871bb9ee330<wbr>32be6a87b174f54abf8ddf0911a22d<wbr>29d2"<br>
                +SRC_URI[md5sum] = "<wbr>2b072f6194eb22d48cd4c7c77e59b5<wbr>af"<br>
                +SRC_URI[sha256sum] = "<wbr>3edb957744905412f30de3e25da186<wbr>82cbe509541e18cd3b8f9df695a075<wbr>da49"<br>
                <br>
                 BINCONFIG = "${bindir}/gpg-error-config"<br>
                <br>
                --<br>
                2.8.1<br>
                <br>
                --<br>
                ______________________________<wbr>_________________<br>
                Openembedded-core mailing list<br>
                <a
                  href="mailto:Openembedded-core@lists.openembedded.org"
                  moz-do-not-send="true">Openembedded-core@lists.<wbr>openembedded.org</a><br>
                <a
                  href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                  rel="noreferrer" target="_blank"
                  moz-do-not-send="true">http://lists.openembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
              </div>
            </div>
          </blockquote>
        </div>
        <br>
      </div>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------5ED6118CE99FC15ECB501C0F--
