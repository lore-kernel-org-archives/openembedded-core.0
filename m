Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2B5256FEFA
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Feb 2018 00:24:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w1B0O3vM007854
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 10 Feb 2018 16:24:03 -0800 (PST)
Received: from [128.224.163.220] (128.224.163.220) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Sat, 10 Feb 2018 16:23:54 -0800
To: "Burton, Ross" <ross.burton@intel.com>, Anders Roxell
	<anders.roxell@linaro.org>
References: <1518111299-21765-1-git-send-email-anders.roxell@linaro.org>
	<CAJTo0LZ+H+usAY7s+XXBFs+EQdNJwvBrc5KRbbPoLFh-df9ouA@mail.gmail.com>
From: Yi Zhao <yi.zhao@windriver.com>
Message-ID: <13aef14f-e443-7dad-181d-2b8097e42d01@windriver.com>
Date: Sun, 11 Feb 2018 08:22:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZ+H+usAY7s+XXBFs+EQdNJwvBrc5KRbbPoLFh-df9ouA@mail.gmail.com>
X-Originating-IP: [128.224.163.220]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ltp: fix knob to control numa support
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
X-List-Received-Date: Sun, 11 Feb 2018 00:24:05 -0000
Content-Type: multipart/alternative;
	boundary="------------ECFECD123DD18E0A20CAC25A"
Content-Language: en-US

--------------ECFECD123DD18E0A20CAC25A
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



在 2018年02月09日 18:26, Burton, Ross 写道:
> There's now two patches which do this on the list, can you decide 
> which one should be merged?

Sorry I missed Anders's patch. His patch is better than mine.

Regards,
Yi

>
> Cheers,
> Ross
>
> On 8 February 2018 at 17:34, Anders Roxell <anders.roxell@linaro.org 
> <mailto:anders.roxell@linaro.org>> wrote:
>
>     Reported-by: Yi Zhao <yi.zhao@windriver.com
>     <mailto:yi.zhao@windriver.com>>
>     Signed-off-by: Anders Roxell <anders.roxell@linaro.org
>     <mailto:anders.roxell@linaro.org>>
>     ---
>      ...ix-default-value-of-without-numa-switch-i.patch | 31
>     ++++++++++++++
>      ...onfigure-add-knob-to-control-numa-support.patch | 50
>     ++++++++++++++++++++++
>      ...-control-whether-numa-support-should-be-c.patch | 45
>     -------------------
>      meta/recipes-extended/ltp/ltp_20180118.bb
>     <http://ltp_20180118.bb>         |  3 +-
>      4 files changed, 83 insertions(+), 46 deletions(-)
>      create mode 100644
>     meta/recipes-extended/ltp/ltp/0001-configure-Fix-default-value-of-without-numa-switch-i.patch
>      create mode 100644
>     meta/recipes-extended/ltp/ltp/0001-configure-add-knob-to-control-numa-support.patch
>      delete mode 100644
>     meta/recipes-extended/ltp/ltp/0002-Add-knob-to-control-whether-numa-support-should-be-c.patch
>
>     diff --git
>     a/meta/recipes-extended/ltp/ltp/0001-configure-Fix-default-value-of-without-numa-switch-i.patch
>     b/meta/recipes-extended/ltp/ltp/0001-configure-Fix-default-value-of-without-numa-switch-i.patch
>     new file mode 100644
>     index 0000000..da62687
>     --- /dev/null
>     +++
>     b/meta/recipes-extended/ltp/ltp/0001-configure-Fix-default-value-of-without-numa-switch-i.patch
>     @@ -0,0 +1,31 @@
>     +From 4ace68a6ba501907a0741dba5f5f155e06a74c35 Mon Sep 17 00:00:00
>     2001
>     +From: Petr Vorel <pvorel@suse.cz <mailto:pvorel@suse.cz>>
>     +Date: Wed, 7 Feb 2018 11:09:49 +0100
>     +Subject: [PATCH] configure: Fix default value of --without-numa
>     switch in help
>     +
>     +The default value is no.
>     +
>     +Fixes: 39a85a1f1 ("configure: add knob to control numa support")
>     +
>     +Signed-off-by: Petr Vorel <pvorel@suse.cz <mailto:pvorel@suse.cz>>
>     +Upstream-Status: Accepted
>     +---
>     + configure.ac <http://configure.ac> | 2 +-
>     + 1 file changed, 1 insertion(+), 1 deletion(-)
>     +
>     +diff --git a/configure.ac <http://configure.ac> b/configure.ac
>     <http://configure.ac>
>     +index b39a31d..d66ea00 100644
>     +--- a/configure.ac <http://configure.ac>
>     ++++ b/configure.ac <http://configure.ac>
>     +@@ -86,7 +86,7 @@ fi
>     + # Numa
>     + AC_ARG_WITH([numa],
>     +   AC_HELP_STRING([--without-numa],
>     +-    [without numa support (default=yes)]),
>     ++    [without numa support (default=no)]),
>     +   [with_numa=no],
>     +   [with_numa=yes]
>     + )
>     +--
>     +2.7.4
>     +
>     diff --git
>     a/meta/recipes-extended/ltp/ltp/0001-configure-add-knob-to-control-numa-support.patch
>     b/meta/recipes-extended/ltp/ltp/0001-configure-add-knob-to-control-numa-support.patch
>     new file mode 100644
>     index 0000000..8aaa287
>     --- /dev/null
>     +++
>     b/meta/recipes-extended/ltp/ltp/0001-configure-add-knob-to-control-numa-support.patch
>     @@ -0,0 +1,50 @@
>     +From 39a85a1f1e6624f554215ba4b6843d3689a8415e Mon Sep 17 00:00:00
>     2001
>     +From: Anders Roxell <anders.roxell@linaro.org
>     <mailto:anders.roxell@linaro.org>>
>     +Date: Mon, 5 Feb 2018 11:56:04 +0100
>     +Subject: [PATCH] configure: add knob to control numa support
>     +
>     +Allow to disable numa from the top level.
>     +
>     +Based on patch:
>     +http://cgit.openembedded.org/openembedded-core/commit/meta/recipes-extended/ltp?id=4c7873552e13dfdba96afca7562c398d2966ca71
>     <http://cgit.openembedded.org/openembedded-core/commit/meta/recipes-extended/ltp?id=4c7873552e13dfdba96afca7562c398d2966ca71>
>     +
>     +Reported-by: Roy Li <rongqing.li@windriver.com
>     <mailto:rongqing.li@windriver.com>>
>     +Signed-off-by: Anders Roxell <anders.roxell@linaro.org
>     <mailto:anders.roxell@linaro.org>>
>     +Signed-off-by: Petr Vorel <pvorel@suse.cz <mailto:pvorel@suse.cz>>
>     +Upstream-Status: Accepted
>     +---
>     + configure.ac <http://configure.ac> | 10 ++++++++++
>     + 1 file changed, 10 insertions(+)
>     +
>     +diff --git a/configure.ac <http://configure.ac> b/configure.ac
>     <http://configure.ac>
>     +index 5c8d4ea..b39a31d 100644
>     +--- a/configure.ac <http://configure.ac>
>     ++++ b/configure.ac <http://configure.ac>
>     +@@ -83,6 +83,14 @@ else
>     +     AC_SUBST([WITH_EXPECT],["no"])
>     + fi
>     +
>     ++# Numa
>     ++AC_ARG_WITH([numa],
>     ++  AC_HELP_STRING([--without-numa],
>     ++    [without numa support (default=yes)]),
>     ++  [with_numa=no],
>     ++  [with_numa=yes]
>     ++)
>     ++
>     + # Perl
>     + AC_ARG_WITH([perl],
>     +   [AC_HELP_STRING([--with-perl],
>     +@@ -157,7 +165,9 @@ LTP_CHECK_SELINUX
>     + LTP_CHECK_SIGNAL
>     + LTP_CHECK_SYSCALL_EVENTFD
>     + LTP_CHECK_SYSCALL_MODIFY_LDT
>     ++if test "x$with_numa" = xyes; then
>     + LTP_CHECK_SYSCALL_NUMA
>     ++fi
>     + LTP_CHECK_SYSCALL_QUOTACTL
>     + LTP_CHECK_SYSCALL_SIGNALFD
>     + LTP_CHECK_SYSCALL_UNSHARE
>     +--
>     +2.7.4
>     +
>     diff --git
>     a/meta/recipes-extended/ltp/ltp/0002-Add-knob-to-control-whether-numa-support-should-be-c.patch
>     b/meta/recipes-extended/ltp/ltp/0002-Add-knob-to-control-whether-numa-support-should-be-c.patch
>     deleted file mode 100644
>     index 31460b9..0000000
>     ---
>     a/meta/recipes-extended/ltp/ltp/0002-Add-knob-to-control-whether-numa-support-should-be-c.patch
>     +++ /dev/null
>     @@ -1,45 +0,0 @@
>     -From 867ad5d5d64b9b27ee32148027532db0a00f6433 Mon Sep 17 00:00:00
>     2001
>     -From: "Roy.Li" <rongqing.li@windriver.com
>     <mailto:rongqing.li@windriver.com>>
>     -Date: Thu, 7 Jan 2016 17:33:26 +0000
>     -Subject: [PATCH 02/32] Add knob to control whether numa support
>     should be
>     - checked
>     -
>     -otherwise undeterministic dependency will be generated
>     -during build depending upong numa being staged or not
>     -
>     -Signed-off-by: Roy.Li <rongqing.li@windriver.com
>     <mailto:rongqing.li@windriver.com>>
>     -Signed-off-by: Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>>
>     -Signed-off-by: Anders Roxell <anders.roxell@linaro.org
>     <mailto:anders.roxell@linaro.org>>
>     -Upstream-Status: Pending
>     ----
>     - m4/ltp-numa.m4 | 10 +++++++++-
>     - 1 file changed, 9 insertions(+), 1 deletion(-)
>     -
>     -diff --git a/m4/ltp-numa.m4 b/m4/ltp-numa.m4
>     -index fc3383e..44cb559 100644
>     ---- a/m4/ltp-numa.m4
>     -+++ b/m4/ltp-numa.m4
>     -@@ -24,7 +24,13 @@ dnl LTP_CHECK_SYSCALL_NUMA
>     - dnl ----------------------------
>     - dnl
>     - AC_DEFUN([LTP_CHECK_SYSCALL_NUMA], [
>     --      AC_CHECK_LIB(numa, numa_available, [have_libnuma=yes])
>     -+      AC_MSG_CHECKING([for numa])
>     -+      AC_ARG_WITH(
>     -+              [numa],
>     -+              AC_HELP_STRING([--without-numa],
>     -+              [without numa support]),
>     -+              [],
>     -+      [AC_CHECK_LIB(numa, numa_available, [have_libnuma=yes])
>     -       AC_CHECK_HEADERS([numa.h numaif.h], [],
>     [have_numa_headers=no])
>     -
>     -       if test "x$have_numa_headers" != "xno"; then
>     -@@ -42,3 +48,5 @@ exit(1);
>     -               AC_DEFINE(HAVE_NUMA_V2, 1, [Define to 1 if you
>     have libnuma and it's headers version >= 2 installed.])
>     -       fi
>     - ])
>     -+AC_MSG_RESULT([$with_numa])
>     -+])
>     ---
>     -2.7.0
>     -
>     diff --git a/meta/recipes-extended/ltp/ltp_20180118.bb
>     <http://ltp_20180118.bb>
>     b/meta/recipes-extended/ltp/ltp_20180118.bb <http://ltp_20180118.bb>
>     index 369b98d..a0dd9aa 100644
>     --- a/meta/recipes-extended/ltp/ltp_20180118.bb
>     <http://ltp_20180118.bb>
>     +++ b/meta/recipes-extended/ltp/ltp_20180118.bb
>     <http://ltp_20180118.bb>
>     @@ -24,7 +24,8 @@ CFLAGS_append_mipsarchn64 = "
>     -D__SANE_USERSPACE_TYPES__"
>      SRCREV = "731cd34e682d297b207668be8b1d15320a9ac1b1"
>
>      SRC_URI = "git://github.com/linux-test-project/ltp.git
>     <http://github.com/linux-test-project/ltp.git> \
>     -         
>      file://0002-Add-knob-to-control-whether-numa-support-should-be-c.patch
>     \
>     +         
>      file://0001-configure-add-knob-to-control-numa-support.patch \
>     +         
>      file://0001-configure-Fix-default-value-of-without-numa-switch-i.patch
>     \
>                 file://0003-Add-knob-to-control-tirpc-support.patch \
>                
>     file://0004-build-Add-option-to-select-libc-implementation.patch \
>                
>     file://0005-kernel-controllers-Link-with-libfts-explicitly-on-mu.patch
>     \
>     --
>     2.7.4
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


--------------ECFECD123DD18E0A20CAC25A
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">在 2018年02月09日 18:26, Burton, Ross 写道:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAJTo0LZ+H+usAY7s+XXBFs+EQdNJwvBrc5KRbbPoLFh-df9ouA@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">There's now two patches which do this on the list,
        can you decide which one should be merged?</div>
    </blockquote>
    <br>
    Sorry I missed Anders's patch. His patch is better than mine.<br>
    <br>
    Regards,<br>
    Yi<br>
    <br>
    <blockquote type="cite"
cite="mid:CAJTo0LZ+H+usAY7s+XXBFs+EQdNJwvBrc5KRbbPoLFh-df9ouA@mail.gmail.com">
      <div dir="ltr">
        <div><br>
        </div>
        <div>Cheers,</div>
        <div>Ross</div>
      </div>
      <div class="gmail_extra"><br>
        <div class="gmail_quote">On 8 February 2018 at 17:34, Anders
          Roxell <span dir="ltr">&lt;<a
              href="mailto:anders.roxell@linaro.org" target="_blank"
              moz-do-not-send="true">anders.roxell@linaro.org</a>&gt;</span>
          wrote:<br>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">Reported-by:
            Yi Zhao &lt;<a href="mailto:yi.zhao@windriver.com"
              moz-do-not-send="true">yi.zhao@windriver.com</a>&gt;<br>
            Signed-off-by: Anders Roxell &lt;<a
              href="mailto:anders.roxell@linaro.org"
              moz-do-not-send="true">anders.roxell@linaro.org</a>&gt;<br>
            ---<br>
             ...ix-default-value-of-<wbr>without-numa-switch-i.patch |
            31 ++++++++++++++<br>
             ...onfigure-add-knob-to-<wbr>control-numa-support.patch |
            50 ++++++++++++++++++++++<br>
             ...-control-whether-numa-<wbr>support-should-be-c.patch |
            45 -------------------<br>
             meta/recipes-extended/ltp/<a href="http://ltp_20180118.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">ltp_<wbr>20180118.bb</a> 
                    |  3 +-<br>
             4 files changed, 83 insertions(+), 46 deletions(-)<br>
             create mode 100644 meta/recipes-extended/ltp/ltp/<wbr>0001-configure-Fix-default-<wbr>value-of-without-numa-switch-<wbr>i.patch<br>
             create mode 100644 meta/recipes-extended/ltp/ltp/<wbr>0001-configure-add-knob-to-<wbr>control-numa-support.patch<br>
             delete mode 100644 meta/recipes-extended/ltp/ltp/<wbr>0002-Add-knob-to-control-<wbr>whether-numa-support-should-<wbr>be-c.patch<br>
            <br>
            diff --git a/meta/recipes-extended/ltp/<wbr>ltp/0001-configure-Fix-<wbr>default-value-of-without-numa-<wbr>switch-i.patch
            b/meta/recipes-extended/ltp/<wbr>ltp/0001-configure-Fix-<wbr>default-value-of-without-numa-<wbr>switch-i.patch<br>
            new file mode 100644<br>
            index 0000000..da62687<br>
            --- /dev/null<br>
            +++ b/meta/recipes-extended/ltp/<wbr>ltp/0001-configure-Fix-<wbr>default-value-of-without-numa-<wbr>switch-i.patch<br>
            @@ -0,0 +1,31 @@<br>
            +From 4ace68a6ba501907a0741dba5f5f15<wbr>5e06a74c35 Mon Sep
            17 00:00:00 2001<br>
            +From: Petr Vorel &lt;<a href="mailto:pvorel@suse.cz"
              moz-do-not-send="true">pvorel@suse.cz</a>&gt;<br>
            +Date: Wed, 7 Feb 2018 11:09:49 +0100<br>
            +Subject: [PATCH] configure: Fix default value of
            --without-numa switch in help<br>
            +<br>
            +The default value is no.<br>
            +<br>
            +Fixes: 39a85a1f1 ("configure: add knob to control numa
            support")<br>
            +<br>
            +Signed-off-by: Petr Vorel &lt;<a
              href="mailto:pvorel@suse.cz" moz-do-not-send="true">pvorel@suse.cz</a>&gt;<br>
            +Upstream-Status: Accepted<br>
            +---<br>
            + <a href="http://configure.ac" rel="noreferrer"
              target="_blank" moz-do-not-send="true">configure.ac</a> |
            2 +-<br>
            + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
            +<br>
            +diff --git a/<a href="http://configure.ac" rel="noreferrer"
              target="_blank" moz-do-not-send="true">configure.ac</a> b/<a
              href="http://configure.ac" rel="noreferrer"
              target="_blank" moz-do-not-send="true">configure.ac</a><br>
            +index b39a31d..d66ea00 100644<br>
            +--- a/<a href="http://configure.ac" rel="noreferrer"
              target="_blank" moz-do-not-send="true">configure.ac</a><br>
            ++++ b/<a href="http://configure.ac" rel="noreferrer"
              target="_blank" moz-do-not-send="true">configure.ac</a><br>
            +@@ -86,7 +86,7 @@ fi<br>
            + # Numa<br>
            + AC_ARG_WITH([numa],<br>
            +   AC_HELP_STRING([--without-<wbr>numa],<br>
            +-    [without numa support (default=yes)]),<br>
            ++    [without numa support (default=no)]),<br>
            +   [with_numa=no],<br>
            +   [with_numa=yes]<br>
            + )<br>
            +--<br>
            +2.7.4<br>
            +<br>
            diff --git a/meta/recipes-extended/ltp/<wbr>ltp/0001-configure-add-knob-<wbr>to-control-numa-support.patch
            b/meta/recipes-extended/ltp/<wbr>ltp/0001-configure-add-knob-<wbr>to-control-numa-support.patch<br>
            new file mode 100644<br>
            index 0000000..8aaa287<br>
            --- /dev/null<br>
            +++ b/meta/recipes-extended/ltp/<wbr>ltp/0001-configure-add-knob-<wbr>to-control-numa-support.patch<br>
            @@ -0,0 +1,50 @@<br>
            +From 39a85a1f1e6624f554215ba4b6843d<wbr>3689a8415e Mon Sep
            17 00:00:00 2001<br>
            +From: Anders Roxell &lt;<a
              href="mailto:anders.roxell@linaro.org"
              moz-do-not-send="true">anders.roxell@linaro.org</a>&gt;<br>
            +Date: Mon, 5 Feb 2018 11:56:04 +0100<br>
            +Subject: [PATCH] configure: add knob to control numa
            support<br>
            +<br>
            +Allow to disable numa from the top level.<br>
            +<br>
            +Based on patch:<br>
            +<a
href="http://cgit.openembedded.org/openembedded-core/commit/meta/recipes-extended/ltp?id=4c7873552e13dfdba96afca7562c398d2966ca71"
              rel="noreferrer" target="_blank" moz-do-not-send="true">http://cgit.openembedded.org/<wbr>openembedded-core/commit/meta/<wbr>recipes-extended/ltp?id=<wbr>4c7873552e13dfdba96afca7562c39<wbr>8d2966ca71</a><br>
            +<br>
            +Reported-by: Roy Li &lt;<a
              href="mailto:rongqing.li@windriver.com"
              moz-do-not-send="true">rongqing.li@windriver.com</a>&gt;<br>
            +Signed-off-by: Anders Roxell &lt;<a
              href="mailto:anders.roxell@linaro.org"
              moz-do-not-send="true">anders.roxell@linaro.org</a>&gt;<br>
            +Signed-off-by: Petr Vorel &lt;<a
              href="mailto:pvorel@suse.cz" moz-do-not-send="true">pvorel@suse.cz</a>&gt;<br>
            +Upstream-Status: Accepted<br>
            +---<br>
            + <a href="http://configure.ac" rel="noreferrer"
              target="_blank" moz-do-not-send="true">configure.ac</a> |
            10 ++++++++++<br>
            + 1 file changed, 10 insertions(+)<br>
            +<br>
            +diff --git a/<a href="http://configure.ac" rel="noreferrer"
              target="_blank" moz-do-not-send="true">configure.ac</a> b/<a
              href="http://configure.ac" rel="noreferrer"
              target="_blank" moz-do-not-send="true">configure.ac</a><br>
            +index 5c8d4ea..b39a31d 100644<br>
            +--- a/<a href="http://configure.ac" rel="noreferrer"
              target="_blank" moz-do-not-send="true">configure.ac</a><br>
            ++++ b/<a href="http://configure.ac" rel="noreferrer"
              target="_blank" moz-do-not-send="true">configure.ac</a><br>
            +@@ -83,6 +83,14 @@ else<br>
            +     AC_SUBST([WITH_EXPECT],["no"])<br>
            + fi<br>
            +<br>
            ++# Numa<br>
            ++AC_ARG_WITH([numa],<br>
            ++  AC_HELP_STRING([--without-<wbr>numa],<br>
            ++    [without numa support (default=yes)]),<br>
            ++  [with_numa=no],<br>
            ++  [with_numa=yes]<br>
            ++)<br>
            ++<br>
            + # Perl<br>
            + AC_ARG_WITH([perl],<br>
            +   [AC_HELP_STRING([--with-perl],<br>
            +@@ -157,7 +165,9 @@ LTP_CHECK_SELINUX<br>
            + LTP_CHECK_SIGNAL<br>
            + LTP_CHECK_SYSCALL_EVENTFD<br>
            + LTP_CHECK_SYSCALL_MODIFY_LDT<br>
            ++if test "x$with_numa" = xyes; then<br>
            + LTP_CHECK_SYSCALL_NUMA<br>
            ++fi<br>
            + LTP_CHECK_SYSCALL_QUOTACTL<br>
            + LTP_CHECK_SYSCALL_SIGNALFD<br>
            + LTP_CHECK_SYSCALL_UNSHARE<br>
            +--<br>
            +2.7.4<br>
            +<br>
            diff --git a/meta/recipes-extended/ltp/<wbr>ltp/0002-Add-knob-to-control-<wbr>whether-numa-support-should-<wbr>be-c.patch
            b/meta/recipes-extended/ltp/<wbr>ltp/0002-Add-knob-to-control-<wbr>whether-numa-support-should-<wbr>be-c.patch<br>
            deleted file mode 100644<br>
            index 31460b9..0000000<br>
            --- a/meta/recipes-extended/ltp/<wbr>ltp/0002-Add-knob-to-control-<wbr>whether-numa-support-should-<wbr>be-c.patch<br>
            +++ /dev/null<br>
            @@ -1,45 +0,0 @@<br>
            -From 867ad5d5d64b9b27ee32148027532d<wbr>b0a00f6433 Mon Sep
            17 00:00:00 2001<br>
            -From: "Roy.Li" &lt;<a
              href="mailto:rongqing.li@windriver.com"
              moz-do-not-send="true">rongqing.li@windriver.com</a>&gt;<br>
            -Date: Thu, 7 Jan 2016 17:33:26 +0000<br>
            -Subject: [PATCH 02/32] Add knob to control whether numa
            support should be<br>
            - checked<br>
            -<br>
            -otherwise undeterministic dependency will be generated<br>
            -during build depending upong numa being staged or not<br>
            -<br>
            -Signed-off-by: Roy.Li &lt;<a
              href="mailto:rongqing.li@windriver.com"
              moz-do-not-send="true">rongqing.li@windriver.com</a>&gt;<br>
            -Signed-off-by: Khem Raj &lt;<a
              href="mailto:raj.khem@gmail.com" moz-do-not-send="true">raj.khem@gmail.com</a>&gt;<br>
            -Signed-off-by: Anders Roxell &lt;<a
              href="mailto:anders.roxell@linaro.org"
              moz-do-not-send="true">anders.roxell@linaro.org</a>&gt;<br>
            -Upstream-Status: Pending<br>
            ----<br>
            - m4/ltp-numa.m4 | 10 +++++++++-<br>
            - 1 file changed, 9 insertions(+), 1 deletion(-)<br>
            -<br>
            -diff --git a/m4/ltp-numa.m4 b/m4/ltp-numa.m4<br>
            -index fc3383e..44cb559 100644<br>
            ---- a/m4/ltp-numa.m4<br>
            -+++ b/m4/ltp-numa.m4<br>
            -@@ -24,7 +24,13 @@ dnl LTP_CHECK_SYSCALL_NUMA<br>
            - dnl ----------------------------<br>
            - dnl<br>
            - AC_DEFUN([LTP_CHECK_SYSCALL_<wbr>NUMA], [<br>
            --      AC_CHECK_LIB(numa, numa_available,
            [have_libnuma=yes])<br>
            -+      AC_MSG_CHECKING([for numa])<br>
            -+      AC_ARG_WITH(<br>
            -+              [numa],<br>
            -+              AC_HELP_STRING([--without-<wbr>numa],<br>
            -+              [without numa support]),<br>
            -+              [],<br>
            -+      [AC_CHECK_LIB(numa, numa_available,
            [have_libnuma=yes])<br>
            -       AC_CHECK_HEADERS([numa.h numaif.h], [],
            [have_numa_headers=no])<br>
            -<br>
            -       if test "x$have_numa_headers" != "xno"; then<br>
            -@@ -42,3 +48,5 @@ exit(1);<br>
            -               AC_DEFINE(HAVE_NUMA_V2, 1, [Define to 1 if
            you have libnuma and it's headers version &gt;= 2
            installed.])<br>
            -       fi<br>
            - ])<br>
            -+AC_MSG_RESULT([$with_numa])<br>
            -+])<br>
            ---<br>
            -2.7.0<br>
            -<br>
            diff --git a/meta/recipes-extended/ltp/<a
              href="http://ltp_20180118.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">lt<wbr>p_20180118.bb</a>
            b/meta/recipes-extended/ltp/<a href="http://ltp_20180118.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">lt<wbr>p_20180118.bb</a><br>
            index 369b98d..a0dd9aa 100644<br>
            --- a/meta/recipes-extended/ltp/<a
              href="http://ltp_20180118.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">lt<wbr>p_20180118.bb</a><br>
            +++ b/meta/recipes-extended/ltp/<a
              href="http://ltp_20180118.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">lt<wbr>p_20180118.bb</a><br>
            @@ -24,7 +24,8 @@ CFLAGS_append_mipsarchn64 = "
            -D__SANE_USERSPACE_TYPES__"<br>
             SRCREV = "<wbr>731cd34e682d297b207668be8b1d15<wbr>320a9ac1b1"<br>
            <br>
             SRC_URI = "git://<a
              href="http://github.com/linux-test-project/ltp.git"
              rel="noreferrer" target="_blank" moz-do-not-send="true">github.com/linux-test-<wbr>project/ltp.git</a>
            \<br>
            -           <a class="moz-txt-link-freetext" href="file://0002-Add-knob-to">file://0002-Add-knob-to</a>-<wbr>control-whether-numa-support-<wbr>should-be-c.patch
            \<br>
            +           <a class="moz-txt-link-freetext" href="file://0001-configure-add">file://0001-configure-add</a>-<wbr>knob-to-control-numa-support.<wbr>patch
            \<br>
            +           <a class="moz-txt-link-freetext" href="file://0001-configure-Fix">file://0001-configure-Fix</a>-<wbr>default-value-of-without-numa-<wbr>switch-i.patch
            \<br>
                        <a class="moz-txt-link-freetext" href="file://0003-Add-knob-to">file://0003-Add-knob-to</a>-<wbr>control-tirpc-support.patch
            \<br>
                        <a class="moz-txt-link-freetext" href="file://0004-build-Add-option">file://0004-build-Add-option</a>-<wbr>to-select-libc-implementation.<wbr>patch
            \<br>
                        <a class="moz-txt-link-freetext" href="file://0005-kernel">file://0005-kernel</a>-<wbr>controllers-Link-with-libfts-<wbr>explicitly-on-mu.patch
            \<br>
            <span class="HOEnZb"><font color="#888888">--<br>
                2.7.4<br>
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
              </font></span></blockquote>
        </div>
        <br>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------ECFECD123DD18E0A20CAC25A--
