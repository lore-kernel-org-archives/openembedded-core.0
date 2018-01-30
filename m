Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id ACA5F78853
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jan 2018 12:30:35 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id c16so392495itc.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jan 2018 04:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lt8ys43Hxc+6VpaNT+aXqxwvNs3sScUThb+zTZ1A+HI=;
	b=sFhIgxrnk35v553A5WidtHunxNwjRNWL6RxslWQPJm/ij5XsrHXQEHBcYPQRQzsx29
	Bm9OJ/rGSvkwnKAnpmq2kgsIqlQkREhKgm+izVYhkOhV6qaVFxgF1/RlGZBLw2ueW4Bs
	sHl5YGBO/7AAa62+SCXYUMzJfcKW+R4M3He6QG6O+hgl1R5r0ZRi1ytjIwDqayQhtjIN
	24ZtlHARdBfksPEzZUYkigtl7zPH5Y+OmMUGjQwG/oqIvxGdtJN+1c1t/duzyMmKknMd
	qBr191qW/flUfkifYVW2SFm2ntoF8ZQhRYeQJlvy+zn62/KDeKbtMhxZ3KQILTbt7dNs
	WaaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lt8ys43Hxc+6VpaNT+aXqxwvNs3sScUThb+zTZ1A+HI=;
	b=JIs0rH1TZEwbQXiSg9feZp/QFReHLM/6BL/Gn78bf8zhkp1KfzBHlgEQDlQeAROIE2
	qSDM7CS8aAql0L5ggFWIrKD1em3oFoMOK/Z7pxxw3q5j/4e9BiJTibNpLX42IvZOAnHq
	/ys5Q4m1fuz1xYMJHmtSt34WQ3TSjDSUyJFNynchk58nLn5mIz50HO8FAlerwH56wVyS
	TuozwingL4XczckjuvTelnqJPiYTVdseB8BKCEMNlsSdgY2o2VVUBDHZ+XzWayocx5Id
	4IsK0FIgChN/ynsgegx1lOa3Tpe0x5Vr4LZeatnCiVAvG4Iu/rYY3t70/6iz98DzXHoB
	s1LQ==
X-Gm-Message-State: AKwxytcr21b1C/U+1Zsp+Vqk4gb/EgEcI1ajdnFH6dxQuaqNYTrV/7ND
	5gjauAzXsDk1S8xQVTCecbpBx1OFMCvRMjqHkWfQUA==
X-Google-Smtp-Source: AH8x2273iBvoB3R4h4+pxlM10DN36mzLBzVyvntTfwZUCw3b8mZXJUkV9A6t4vt5i4XFcBNkJwmK/W/02/bTGdP6gQE=
X-Received: by 10.36.86.20 with SMTP id o20mr31684078itb.53.1517315436951;
	Tue, 30 Jan 2018 04:30:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Tue, 30 Jan 2018 04:30:16 -0800 (PST)
In-Reply-To: <4ce0566d-24c8-f271-7154-f5d01c3b29c8@windriver.com>
References: <1517235557-11980-1-git-send-email-anders.roxell@linaro.org>
	<4ce0566d-24c8-f271-7154-f5d01c3b29c8@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 30 Jan 2018 12:30:16 +0000
Message-ID: <CAJTo0LbJaTOEU6=2j81VEb_aN99s5qt1n+7Gs=PA6Hsm0cP3Ug@mail.gmail.com>
To: Yi Zhao <yi.zhao@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ltp: bump to release 20180118
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
X-List-Received-Date: Tue, 30 Jan 2018 12:30:35 -0000
Content-Type: multipart/alternative; boundary="001a1144d5eaa1d6f50563fd872d"

--001a1144d5eaa1d6f50563fd872d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Can someone please send an update to remove those patches, as this ltp
upgrade has already merged to master.

Ross

On 30 January 2018 at 03:26, Yi Zhao <yi.zhao@windriver.com> wrote:

>
>
> =E5=9C=A8 2018=E5=B9=B401=E6=9C=8829=E6=97=A5 22:19, Anders Roxell =E5=86=
=99=E9=81=93:
>
>> Removed 3 patches that have been upstreamed:
>> - 0030-lib-Use-PTHREAD_MUTEX_RECURSIVE-in-place-of-PTHREAD_.patch
>> - 0037-ltp-fix-format-security-error.patch
>> - 0038-generate-reproducible-gzip.patch
>>
>
> I'm also working on this these days.
>
> The following patches can also be removed since the issues have been fixe=
d
> upstream:
> 0001-add-_GNU_SOURCE-to-pec_listener.c.patch
> 0011-Rename-sigset-variable-to-sigset1.patch
> 0025-mc_gethost-include-sys-types.h.patch
> 0027-sysconf01-Use-_SC_2_C_VERSION-conditionally.patch
> 0033-shmat1-Cover-GNU-specific-code-under-__USE_GNU.patch
>
>
>> Reworked path 0002-Add-knob-to-control-whether-numa-support-should-be-c.
>> patch.
>>
>
> I tested this patch but seems like it doesn't work.
> Although --with-numa is passed to configure via PACKAGECONFIG=3D"numa", i=
t
> doesn't check numa headers and library, and doesn't link numa library whe=
n
> building.
>
>
> //Yi
>
>
>
>> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
>> ---
>>   ...-control-whether-numa-support-should-be-c.patch | 39
>> +++++++++++-----------
>>   ...READ_MUTEX_RECURSIVE-in-place-of-PTHREAD_.patch | 35
>> -------------------
>>   .../ltp/0037-ltp-fix-format-security-error.patch   | 36
>> --------------------
>>   .../ltp/ltp/0038-generate-reproducible-gzip.patch  | 20 -----------
>>   .../ltp/{ltp_20170929.bb =3D> ltp_20180118.bb}       |  5 +--
>>   5 files changed, 21 insertions(+), 114 deletions(-)
>>   delete mode 100644 meta/recipes-extended/ltp/ltp/
>> 0030-lib-Use-PTHREAD_MUTEX_RECURSIVE-in-place-of-PTHREAD_.patch
>>   delete mode 100644 meta/recipes-extended/ltp/ltp/
>> 0037-ltp-fix-format-security-error.patch
>>   delete mode 100644 meta/recipes-extended/ltp/ltp/
>> 0038-generate-reproducible-gzip.patch
>>   rename meta/recipes-extended/ltp/{ltp_20170929.bb =3D> ltp_20180118.bb=
}
>> (95%)
>>
>> diff --git a/meta/recipes-extended/ltp/ltp/0002-Add-knob-to-control-whe
>> ther-numa-support-should-be-c.patch b/meta/recipes-extended/ltp/lt
>> p/0002-Add-knob-to-control-whether-numa-support-should-be-c.patch
>> index 9865020..31460b9 100644
>> --- a/meta/recipes-extended/ltp/ltp/0002-Add-knob-to-control-whe
>> ther-numa-support-should-be-c.patch
>> +++ b/meta/recipes-extended/ltp/ltp/0002-Add-knob-to-control-whe
>> ther-numa-support-should-be-c.patch
>> @@ -9,34 +9,35 @@ during build depending upong numa being staged or not
>>     Signed-off-by: Roy.Li <rongqing.li@windriver.com>
>>   Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
>>   Upstream-Status: Pending
>>   ---
>>    m4/ltp-numa.m4 | 10 +++++++++-
>>    1 file changed, 9 insertions(+), 1 deletion(-)
>>     diff --git a/m4/ltp-numa.m4 b/m4/ltp-numa.m4
>> -index 60ae07b..ed7078d 100644
>> +index fc3383e..44cb559 100644
>>   --- a/m4/ltp-numa.m4
>>   +++ b/m4/ltp-numa.m4
>> -@@ -24,7 +24,13 @@ dnl ----------------------------
>> +@@ -24,7 +24,13 @@ dnl LTP_CHECK_SYSCALL_NUMA
>> + dnl ----------------------------
>>    dnl
>> - AC_DEFUN([LTP_CHECK_SYSCALL_NUMA],
>> - [dnl
>> --AC_CHECK_HEADERS([linux/mempolicy.h numa.h numaif.h],[
>> -+AC_MSG_CHECKING([for numa])
>> -+AC_ARG_WITH(
>> -+      [numa],
>> -+      AC_HELP_STRING([--without-numa],
>> -+      [without numa support]),
>> -+      [],
>> -+      [AC_CHECK_HEADERS([linux/mempolicy.h numa.h numaif.h],[
>> -       LTP_SYSCALL_NUMA_HEADERS=3Dyes
>> -       AC_CHECK_LIB(numa,numa_alloc_onnode,[have_numa_alloc_onnode
>> =3D"yes"])
>> -       if  test "x$have_numa_alloc_onnode" =3D "xyes"; then
>> -@@ -48,3 +54,5 @@ if test "x$have_mpol_constants" =3D "xyes"; then
>> -       AC_DEFINE(HAVE_MPOL_CONSTANTS,1,[define to 1 if you have all
>> constants required to use mbind tests])
>> - fi
>> - )])
>> + AC_DEFUN([LTP_CHECK_SYSCALL_NUMA], [
>> +-      AC_CHECK_LIB(numa, numa_available, [have_libnuma=3Dyes])
>> ++      AC_MSG_CHECKING([for numa])
>> ++      AC_ARG_WITH(
>> ++              [numa],
>> ++              AC_HELP_STRING([--without-numa],
>> ++              [without numa support]),
>> ++              [],
>> ++      [AC_CHECK_LIB(numa, numa_available, [have_libnuma=3Dyes])
>> +       AC_CHECK_HEADERS([numa.h numaif.h], [], [have_numa_headers=3Dno]=
)
>> +
>> +       if test "x$have_numa_headers" !=3D "xno"; then
>> +@@ -42,3 +48,5 @@ exit(1);
>> +               AC_DEFINE(HAVE_NUMA_V2, 1, [Define to 1 if you have
>> libnuma and it's headers version >=3D 2 installed.])
>> +       fi
>> + ])
>>   +AC_MSG_RESULT([$with_numa])
>>   +])
>>   --
>> diff --git a/meta/recipes-extended/ltp/ltp/0030-lib-Use-PTHREAD_MUTEX_
>> RECURSIVE-in-place-of-PTHREAD_.patch b/meta/recipes-extended/ltp/lt
>> p/0030-lib-Use-PTHREAD_MUTEX_RECURSIVE-in-place-of-PTHREAD_.patch
>> deleted file mode 100644
>> index efa6d06..0000000
>> --- a/meta/recipes-extended/ltp/ltp/0030-lib-Use-PTHREAD_MUTEX_
>> RECURSIVE-in-place-of-PTHREAD_.patch
>> +++ /dev/null
>> @@ -1,35 +0,0 @@
>> -From 00ba7cdd0608b1507027428f9f87b1cb9747372b Mon Sep 17 00:00:00 2001
>> -From: Dengke Du <dengke.du@windriver.com>
>> -Date: Thu, 9 Feb 2017 15:54:53 +0800
>> -Subject: [PATCH] lib: Use PTHREAD_MUTEX_RECURSIVE in place of
>> - PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP for non-glibc
>> -
>> -e.g. musl does not implement the _NP mutex types
>> -
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> -Signed-off-by: Dengke Du <dengke.du@windriver.com>
>> -
>> -Upstream-Status: Pending
>> ----
>> - lib/tst_res.c | 4 ++++
>> - 1 file changed, 4 insertions(+)
>> -
>> -diff --git a/lib/tst_res.c b/lib/tst_res.c
>> -index 61daaeb..435224f 100644
>> ---- a/lib/tst_res.c
>> -+++ b/lib/tst_res.c
>> -@@ -79,7 +79,11 @@ int TEST_ERRNO;
>> -       assert(strlen(buf) > 0);                \
>> - } while (0)
>> -
>> -+#ifdef __GLIBC__
>> - static pthread_mutex_t tmutex =3D PTHREAD_RECURSIVE_MUTEX_INITIALIZER_=
NP;
>> -+#else
>> -+static pthread_mutex_t tmutex =3D {  PTHREAD_MUTEX_RECURSIVE };
>> -+#endif
>> -
>> - static void check_env(void);
>> - static void tst_condense(int tnum, int ttype, const char *tmesg);
>> ---
>> -2.7.4
>> -
>> diff --git a/meta/recipes-extended/ltp/ltp/0037-ltp-fix-format-security-=
error.patch
>> b/meta/recipes-extended/ltp/ltp/0037-ltp-fix-format-security-error.patch
>> deleted file mode 100644
>> index 44d6990..0000000
>> --- a/meta/recipes-extended/ltp/ltp/0037-ltp-fix-format-security
>> -error.patch
>> +++ /dev/null
>> @@ -1,36 +0,0 @@
>> -From 8eb3e111ae1b89e5afb249cf984d657f94da2385 Mon Sep 17 00:00:00 2001
>> -From: Dengke Du <dengke.du@windriver.com>
>> -Date: Tue, 17 Oct 2017 05:42:47 -0400
>> -Subject: [PATCH] ltp: fix format security error
>> -
>> -When enable option: -Werror=3Dformat-security, the error like:
>> -
>> -    | fcntl36.c: In function 'test_fn':
>> -    | fcntl36.c:303:2: error: format not a string literal and no format
>> arguments [-Werror=3Dformat-security]
>> -    |   tst_res(TINFO, msg);
>> -    |   ^~~~~~~
>> -    | cc1: some warnings being treated as errors
>> -
>> -Upstream-Status: Pending
>> -
>> -Signed-off-by: Dengke Du <dengke.du@windriver.com>
>> ----
>> - testcases/kernel/syscalls/fcntl/fcntl36.c | 2 +-
>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>> -
>> -diff --git a/testcases/kernel/syscalls/fcntl/fcntl36.c
>> b/testcases/kernel/syscalls/fcntl/fcntl36.c
>> -index 6f2eb6b..3246d13 100644
>> ---- a/testcases/kernel/syscalls/fcntl/fcntl36.c
>> -+++ b/testcases/kernel/syscalls/fcntl/fcntl36.c
>> -@@ -300,7 +300,7 @@ static void test_fn(void *f0(void *), void *f1(void
>> *),
>> -       struct param p2[thread_cnt];
>> -       unsigned char buf[write_size];
>> -
>> --      tst_res(TINFO, msg);
>> -+      tst_res(TINFO, "%s", msg);
>> -
>> -       if (tst_fill_file(fname, 1, write_size, thread_cnt + 1))
>> -               tst_brk(TBROK, "Failed to create tst file");
>> ---
>> -2.8.1
>> -
>> diff --git a/meta/recipes-extended/ltp/ltp/0038-generate-reproducible-gz=
ip.patch
>> b/meta/recipes-extended/ltp/ltp/0038-generate-reproducible-gzip.patch
>> deleted file mode 100644
>> index 0153ace..0000000
>> --- a/meta/recipes-extended/ltp/ltp/0038-generate-reproducible-gzip.patc=
h
>> +++ /dev/null
>> @@ -1,20 +0,0 @@
>> -Do not generate timestamps in gzipped file headers.
>> -The timestamps prevent reproducible build.
>> -
>> -Upstream-Status: Submitted [https://github.com/linux-test
>> -project/ltp/pull/233]
>> -
>> -Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
>> -
>> -diff --git a/testcases/network/generate.sh
>> b/testcases/network/generate.sh
>> -index 00216a6..939f792 100755
>> ---- a/testcases/network/generate.sh
>> -+++ b/testcases/network/generate.sh
>> -@@ -55,7 +55,7 @@ fi
>> - if [ ! -e "bin.sm" ] ; then
>> -       cnt=3D0
>> -       while [ $cnt -lt 5 ] ; do
>> --              gzip -1 -c ascii.sm >> "bin.sm"
>> -+              gzip -1 -c -n ascii.sm >> "bin.sm"
>> -               cnt=3D$(($cnt + 1))
>> -       done
>> - fi
>> diff --git a/meta/recipes-extended/ltp/ltp_20170929.bb
>> b/meta/recipes-extended/ltp/ltp_20180118.bb
>> similarity index 95%
>> rename from meta/recipes-extended/ltp/ltp_20170929.bb
>> rename to meta/recipes-extended/ltp/ltp_20180118.bb
>> index bc0ecdf..a4a2724 100644
>> --- a/meta/recipes-extended/ltp/ltp_20170929.bb
>> +++ b/meta/recipes-extended/ltp/ltp_20180118.bb
>> @@ -21,7 +21,7 @@ DEPENDS_append_libc-musl =3D " fts "
>>   EXTRA_OEMAKE_append_libc-musl =3D " LIBC=3Dmusl "
>>   CFLAGS_append_powerpc64 =3D " -D__SANE_USERSPACE_TYPES__"
>>   CFLAGS_append_mipsarchn64 =3D " -D__SANE_USERSPACE_TYPES__"
>> -SRCREV =3D "bac930f71b1e6786ebb8a894463503d07681ef6a"
>> +SRCREV =3D "731cd34e682d297b207668be8b1d15320a9ac1b1"
>>     SRC_URI =3D "git://github.com/linux-test-project/ltp.git \
>>              file://0001-add-_GNU_SOURCE-to-pec_listener.c.patch \
>> @@ -43,13 +43,10 @@ SRC_URI =3D "git://github.com/linux-test-p
>> roject/ltp.git \
>>              file://0026-crash01-Define-_GNU_SOURCE.patch \
>>              file://0027-sysconf01-Use-_SC_2_C_VERSION-conditionally.pat=
ch
>> \
>>              file://0028-rt_sigaction.h-Use-sighandler_t-instead-of-__si=
ghand.patch
>> \
>> -           file://0030-lib-Use-PTHREAD_MUTEX_RECURSIVE-in-place-of-PTHR=
EAD_.patch
>> \
>>              file://0033-shmat1-Cover-GNU-specific-code-under-__USE_GNU.=
patch
>> \
>>              file://0034-periodic_output.patch \
>>              file://0035-fix-test_proc_kill-hang.patch \
>>              file://0036-testcases-network-nfsv4-acl-acl1.c-Security-fix=
-on-s.patch
>> \
>> -           file://0037-ltp-fix-format-security-error.patch \
>> -           file://0038-generate-reproducible-gzip.patch \
>>              file://0039-commands-ar01-Fix-for-test-in-deterministic-mod=
e.patch
>> \
>>              "
>>
>>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1144d5eaa1d6f50563fd872d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Can someone please send an update to remove those patches,=
 as this ltp upgrade has already merged to master.<div><br></div><div>Ross<=
/div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 30 =
January 2018 at 03:26, Yi Zhao <span dir=3D"ltr">&lt;<a href=3D"mailto:yi.z=
hao@windriver.com" target=3D"_blank">yi.zhao@windriver.com</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><span class=3D""><br>
<br>
=E5=9C=A8 2018=E5=B9=B401=E6=9C=8829=E6=97=A5 22:19, Anders Roxell =E5=86=
=99=E9=81=93:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Removed 3 patches that have been upstreamed:<br>
- 0030-lib-Use-PTHREAD_MUTEX_REC<wbr>URSIVE-in-place-of-PTHREAD_.<wbr>patch=
<br>
- 0037-ltp-fix-format-security-e<wbr>rror.patch<br>
- 0038-generate-reproducible-gzi<wbr>p.patch<br>
</blockquote>
<br></span>
I&#39;m also working on this these days.<br>
<br>
The following patches can also be removed since the issues have been fixed =
upstream:<br>
0001-add-_GNU_SOURCE-to-pec_li<wbr>stener.c.patch<br>
0011-Rename-sigset-variable-to<wbr>-sigset1.patch<br>
0025-mc_gethost-include-sys-ty<wbr>pes.h.patch<br>
0027-sysconf01-Use-_SC_2_C_VER<wbr>SION-conditionally.patch<br>
0033-shmat1-Cover-GNU-specific<wbr>-code-under-__USE_GNU.patch<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
Reworked path 0002-Add-knob-to-control-wheth<wbr>er-numa-support-should-be-=
c.<wbr>patch.<br>
</blockquote>
<br>
I tested this patch but seems like it doesn&#39;t work.<br>
Although --with-numa is passed to configure via PACKAGECONFIG=3D&quot;numa&=
quot;, it doesn&#39;t check numa headers and library, and doesn&#39;t link =
numa library when building.<span class=3D"HOEnZb"><font color=3D"#888888"><=
br>
<br>
<br>
//Yi</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
Signed-off-by: Anders Roxell &lt;<a href=3D"mailto:anders.roxell@linaro.org=
" target=3D"_blank">anders.roxell@linaro.org</a>&gt;<br>
---<br>
=C2=A0 ...-control-whether-numa-suppo<wbr>rt-should-be-c.patch | 39 +++++++=
++++-----------<br>
=C2=A0 ...READ_MUTEX_RECURSIVE-in-pla<wbr>ce-of-PTHREAD_.patch | 35 -------=
------------<br>
=C2=A0 .../ltp/0037-ltp-fix-format-se<wbr>curity-error.patch=C2=A0 =C2=A0| =
36 --------------------<br>
=C2=A0 .../ltp/ltp/0038-generate-repr<wbr>oducible-gzip.patch=C2=A0 | 20 --=
---------<br>
=C2=A0 .../ltp/{<a href=3D"http://ltp_20170929.bb" rel=3D"noreferrer" targe=
t=3D"_blank">ltp_20170929.bb</a> =3D&gt; <a href=3D"http://ltp_20180118.bb"=
 rel=3D"noreferrer" target=3D"_blank">ltp_20180118.bb</a>}=C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 5 +--<br>
=C2=A0 5 files changed, 21 insertions(+), 114 deletions(-)<br>
=C2=A0 delete mode 100644 meta/recipes-extended/ltp/ltp/<wbr>0030-lib-Use-P=
THREAD_MUTEX_REC<wbr>URSIVE-in-place-of-PTHREAD_.<wbr>patch<br>
=C2=A0 delete mode 100644 meta/recipes-extended/ltp/ltp/<wbr>0037-ltp-fix-f=
ormat-security-e<wbr>rror.patch<br>
=C2=A0 delete mode 100644 meta/recipes-extended/ltp/ltp/<wbr>0038-generate-=
reproducible-gzi<wbr>p.patch<br>
=C2=A0 rename meta/recipes-extended/ltp/{<a href=3D"http://ltp_20170929.bb"=
 rel=3D"noreferrer" target=3D"_blank">ltp<wbr>_20170929.bb</a> =3D&gt; <a h=
ref=3D"http://ltp_20180118.bb" rel=3D"noreferrer" target=3D"_blank">ltp_201=
80118.bb</a>} (95%)<br>
<br>
diff --git a/meta/recipes-extended/ltp/lt<wbr>p/0002-Add-knob-to-control-wh=
e<wbr>ther-numa-support-should-be-c.<wbr>patch b/meta/recipes-extended/ltp/=
lt<wbr>p/0002-Add-knob-to-control-whe<wbr>ther-numa-support-should-be-c.<wb=
r>patch<br>
index 9865020..31460b9 100644<br>
--- a/meta/recipes-extended/ltp/lt<wbr>p/0002-Add-knob-to-control-whe<wbr>t=
her-numa-support-should-be-c.<wbr>patch<br>
+++ b/meta/recipes-extended/ltp/lt<wbr>p/0002-Add-knob-to-control-whe<wbr>t=
her-numa-support-should-be-c.<wbr>patch<br>
@@ -9,34 +9,35 @@ during build depending upong numa being staged or not<br>
=C2=A0 =C2=A0 Signed-off-by: Roy.Li &lt;<a href=3D"mailto:rongqing.li@windr=
iver.com" target=3D"_blank">rongqing.li@windriver.com</a>&gt;<br>
=C2=A0 Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" ta=
rget=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
+Signed-off-by: Anders Roxell &lt;<a href=3D"mailto:anders.roxell@linaro.or=
g" target=3D"_blank">anders.roxell@linaro.org</a>&gt;<br>
=C2=A0 Upstream-Status: Pending<br>
=C2=A0 ---<br>
=C2=A0 =C2=A0m4/ltp-numa.m4 | 10 +++++++++-<br>
=C2=A0 =C2=A01 file changed, 9 insertions(+), 1 deletion(-)<br>
=C2=A0 =C2=A0 diff --git a/m4/ltp-numa.m4 b/m4/ltp-numa.m4<br>
-index 60ae07b..ed7078d 100644<br>
+index fc3383e..44cb559 100644<br>
=C2=A0 --- a/m4/ltp-numa.m4<br>
=C2=A0 +++ b/m4/ltp-numa.m4<br>
-@@ -24,7 +24,13 @@ dnl ----------------------------<br>
+@@ -24,7 +24,13 @@ dnl LTP_CHECK_SYSCALL_NUMA<br>
+ dnl ----------------------------<br>
=C2=A0 =C2=A0dnl<br>
- AC_DEFUN([LTP_CHECK_SYSCALL_NU<wbr>MA],<br>
- [dnl<br>
--AC_CHECK_HEADERS([linux/memp<wbr>olicy.h numa.h numaif.h],[<br>
-+AC_MSG_CHECKING([for numa])<br>
-+AC_ARG_WITH(<br>
-+=C2=A0 =C2=A0 =C2=A0 [numa],<br>
-+=C2=A0 =C2=A0 =C2=A0 AC_HELP_STRING([--without-numa<wbr>],<br>
-+=C2=A0 =C2=A0 =C2=A0 [without numa support]),<br>
-+=C2=A0 =C2=A0 =C2=A0 [],<br>
-+=C2=A0 =C2=A0 =C2=A0 [AC_CHECK_HEADERS([linux/mempo<wbr>licy.h numa.h num=
aif.h],[<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0LTP_SYSCALL_NUMA_HEADERS=3Dyes<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0AC_CHECK_LIB(numa,numa_alloc_<wbr>onnode,[have_=
numa_alloc_onnode<wbr>=3D&quot;yes&quot;])<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if=C2=A0 test &quot;x$have_numa_alloc_onnode&qu=
ot; =3D &quot;xyes&quot;; then<br>
-@@ -48,3 +54,5 @@ if test &quot;x$have_mpol_constants&quot; =3D &quot;xyes=
&quot;; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0AC_DEFINE(HAVE_MPOL_<wbr>CONSTANTS,1,[define to=
 1 if you have all constants required to use mbind tests])<br>
- fi<br>
- )])<br>
+ AC_DEFUN([LTP_CHECK_SYSCALL_NU<wbr>MA], [<br>
+-=C2=A0 =C2=A0 =C2=A0 AC_CHECK_LIB(numa, numa_available, [have_libnuma=3Dy=
es])<br>
++=C2=A0 =C2=A0 =C2=A0 AC_MSG_CHECKING([for numa])<br>
++=C2=A0 =C2=A0 =C2=A0 AC_ARG_WITH(<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [numa],<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_HELP_STRING([--withou=
t-numa<wbr>],<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [without numa support]),=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [],<br>
++=C2=A0 =C2=A0 =C2=A0 [AC_CHECK_LIB(numa, numa_available, [have_libnuma=3D=
yes])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0AC_CHECK_HEADERS([numa.h numaif.h], [], [have_n=
uma_headers=3Dno])<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if test &quot;x$have_numa_headers&quot; !=3D &q=
uot;xno&quot;; then<br>
+@@ -42,3 +48,5 @@ exit(1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_DEFINE(HAVE_NUMA=
_V2, 1, [Define to 1 if you have libnuma and it&#39;s headers version &gt;=
=3D 2 installed.])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+ ])<br>
=C2=A0 +AC_MSG_RESULT([$with_numa])<br>
=C2=A0 +])<br>
=C2=A0 --<br>
diff --git a/meta/recipes-extended/ltp/lt<wbr>p/0030-lib-Use-PTHREAD_MUTEX_=
<wbr>RECURSIVE-in-place-of-PTHREAD_<wbr>.patch b/meta/recipes-extended/ltp/=
lt<wbr>p/0030-lib-Use-PTHREAD_MUTEX_<wbr>RECURSIVE-in-place-of-PTHREAD_<wbr=
>.patch<br>
deleted file mode 100644<br>
index efa6d06..0000000<br>
--- a/meta/recipes-extended/ltp/lt<wbr>p/0030-lib-Use-PTHREAD_MUTEX_<wbr>RE=
CURSIVE-in-place-of-PTHREAD_<wbr>.patch<br>
+++ /dev/null<br>
@@ -1,35 +0,0 @@<br>
-From 00ba7cdd0608b1507027428f9f87b1<wbr>cb9747372b Mon Sep 17 00:00:00 200=
1<br>
-From: Dengke Du &lt;<a href=3D"mailto:dengke.du@windriver.com" target=3D"_=
blank">dengke.du@windriver.com</a>&gt;<br>
-Date: Thu, 9 Feb 2017 15:54:53 +0800<br>
-Subject: [PATCH] lib: Use PTHREAD_MUTEX_RECURSIVE in place of<br>
- PTHREAD_RECURSIVE_MUTEX_INITIA<wbr>LIZER_NP for non-glibc<br>
-<br>
-e.g. musl does not implement the _NP mutex types<br>
-<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
-Signed-off-by: Dengke Du &lt;<a href=3D"mailto:dengke.du@windriver.com" ta=
rget=3D"_blank">dengke.du@windriver.com</a>&gt;<br>
-<br>
-Upstream-Status: Pending<br>
----<br>
- lib/tst_res.c | 4 ++++<br>
- 1 file changed, 4 insertions(+)<br>
-<br>
-diff --git a/lib/tst_res.c b/lib/tst_res.c<br>
-index 61daaeb..435224f 100644<br>
---- a/lib/tst_res.c<br>
-+++ b/lib/tst_res.c<br>
-@@ -79,7 +79,11 @@ int TEST_ERRNO;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0assert(strlen(buf) &gt; 0);=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
- } while (0)<br>
-<br>
-+#ifdef __GLIBC__<br>
- static pthread_mutex_t tmutex =3D PTHREAD_RECURSIVE_MUTEX_INITIA<wbr>LIZE=
R_NP;<br>
-+#else<br>
-+static pthread_mutex_t tmutex =3D {=C2=A0 PTHREAD_MUTEX_RECURSIVE };<br>
-+#endif<br>
-<br>
- static void check_env(void);<br>
- static void tst_condense(int tnum, int ttype, const char *tmesg);<br>
---<br>
-2.7.4<br>
-<br>
diff --git a/meta/recipes-extended/ltp/lt<wbr>p/0037-ltp-fix-format-securit=
y<wbr>-error.patch b/meta/recipes-extended/ltp/lt<wbr>p/0037-ltp-fix-format=
-security<wbr>-error.patch<br>
deleted file mode 100644<br>
index 44d6990..0000000<br>
--- a/meta/recipes-extended/ltp/lt<wbr>p/0037-ltp-fix-format-security<wbr>-=
error.patch<br>
+++ /dev/null<br>
@@ -1,36 +0,0 @@<br>
-From 8eb3e111ae1b89e5afb249cf984d65<wbr>7f94da2385 Mon Sep 17 00:00:00 200=
1<br>
-From: Dengke Du &lt;<a href=3D"mailto:dengke.du@windriver.com" target=3D"_=
blank">dengke.du@windriver.com</a>&gt;<br>
-Date: Tue, 17 Oct 2017 05:42:47 -0400<br>
-Subject: [PATCH] ltp: fix format security error<br>
-<br>
-When enable option: -Werror=3Dformat-security, the error like:<br>
-<br>
-=C2=A0 =C2=A0 | fcntl36.c: In function &#39;test_fn&#39;:<br>
-=C2=A0 =C2=A0 | fcntl36.c:303:2: error: format not a string literal and no=
 format arguments [-Werror=3Dformat-security]<br>
-=C2=A0 =C2=A0 |=C2=A0 =C2=A0tst_res(TINFO, msg);<br>
-=C2=A0 =C2=A0 |=C2=A0 =C2=A0^~~~~~~<br>
-=C2=A0 =C2=A0 | cc1: some warnings being treated as errors<br>
-<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Dengke Du &lt;<a href=3D"mailto:dengke.du@windriver.com" ta=
rget=3D"_blank">dengke.du@windriver.com</a>&gt;<br>
----<br>
- testcases/kernel/syscalls/fcnt<wbr>l/fcntl36.c | 2 +-<br>
- 1 file changed, 1 insertion(+), 1 deletion(-)<br>
-<br>
-diff --git a/testcases/kernel/syscalls/fc<wbr>ntl/fcntl36.c b/testcases/ke=
rnel/syscalls/fc<wbr>ntl/fcntl36.c<br>
-index 6f2eb6b..3246d13 100644<br>
---- a/testcases/kernel/syscalls/fc<wbr>ntl/fcntl36.c<br>
-+++ b/testcases/kernel/syscalls/fc<wbr>ntl/fcntl36.c<br>
-@@ -300,7 +300,7 @@ static void test_fn(void *f0(void *), void *f1(void *)=
,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct param p2[thread_cnt];<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned char buf[write_size];<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 tst_res(TINFO, msg);<br>
-+=C2=A0 =C2=A0 =C2=A0 tst_res(TINFO, &quot;%s&quot;, msg);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (tst_fill_file(fname, 1, write_size, thread_=
cnt + 1))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TBROK, &quo=
t;Failed to create tst file&quot;);<br>
---<br>
-2.8.1<br>
-<br>
diff --git a/meta/recipes-extended/ltp/lt<wbr>p/0038-generate-reproducible-=
<wbr>gzip.patch b/meta/recipes-extended/ltp/lt<wbr>p/0038-generate-reproduc=
ible-<wbr>gzip.patch<br>
deleted file mode 100644<br>
index 0153ace..0000000<br>
--- a/meta/recipes-extended/ltp/lt<wbr>p/0038-generate-reproducible-<wbr>gz=
ip.patch<br>
+++ /dev/null<br>
@@ -1,20 +0,0 @@<br>
-Do not generate timestamps in gzipped file headers.<br>
-The timestamps prevent reproducible build.<br>
-<br>
-Upstream-Status: Submitted [<a href=3D"https://github.com/linux-test-proje=
ct/ltp/pull/233" rel=3D"noreferrer" target=3D"_blank">https://github.com/li=
nux-test<wbr>-project/ltp/pull/233</a>]<br>
-<br>
-Signed-off-by: Juro Bystricky &lt;<a href=3D"mailto:juro.bystricky@intel.c=
om" target=3D"_blank">juro.bystricky@intel.com</a>&gt;<br>
-<br>
-diff --git a/testcases/network/generate.s<wbr>h b/testcases/network/genera=
te.s<wbr>h<br>
-index 00216a6..939f792 100755<br>
---- a/testcases/network/generate.s<wbr>h<br>
-+++ b/testcases/network/generate.s<wbr>h<br>
-@@ -55,7 +55,7 @@ fi<br>
- if [ ! -e &quot;<a href=3D"http://bin.sm" rel=3D"noreferrer" target=3D"_b=
lank">bin.sm</a>&quot; ] ; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cnt=3D0<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0while [ $cnt -lt 5 ] ; do<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gzip -1 -c <a href=3D"ht=
tp://ascii.sm" rel=3D"noreferrer" target=3D"_blank">ascii.sm</a> &gt;&gt; &=
quot;<a href=3D"http://bin.sm" rel=3D"noreferrer" target=3D"_blank">bin.sm<=
/a>&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gzip -1 -c -n <a href=3D=
"http://ascii.sm" rel=3D"noreferrer" target=3D"_blank">ascii.sm</a> &gt;&gt=
; &quot;<a href=3D"http://bin.sm" rel=3D"noreferrer" target=3D"_blank">bin.=
sm</a>&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cnt=3D$(($cnt + 1))=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
- fi<br>
diff --git a/meta/recipes-extended/ltp/<a href=3D"http://ltp_20170929.bb" r=
el=3D"noreferrer" target=3D"_blank">lt<wbr>p_20170929.bb</a> b/meta/recipes=
-extended/ltp/<a href=3D"http://ltp_20180118.bb" rel=3D"noreferrer" target=
=3D"_blank">lt<wbr>p_20180118.bb</a><br>
similarity index 95%<br>
rename from meta/recipes-extended/ltp/<a href=3D"http://ltp_20170929.bb" re=
l=3D"noreferrer" target=3D"_blank">ltp_<wbr>20170929.bb</a><br>
rename to meta/recipes-extended/ltp/<a href=3D"http://ltp_20180118.bb" rel=
=3D"noreferrer" target=3D"_blank">ltp_<wbr>20180118.bb</a><br>
index bc0ecdf..a4a2724 100644<br>
--- a/meta/recipes-extended/ltp/<a href=3D"http://ltp_20170929.bb" rel=3D"n=
oreferrer" target=3D"_blank">lt<wbr>p_20170929.bb</a><br>
+++ b/meta/recipes-extended/ltp/<a href=3D"http://ltp_20180118.bb" rel=3D"n=
oreferrer" target=3D"_blank">lt<wbr>p_20180118.bb</a><br>
@@ -21,7 +21,7 @@ DEPENDS_append_libc-musl =3D &quot; fts &quot;<br>
=C2=A0 EXTRA_OEMAKE_append_libc-musl =3D &quot; LIBC=3Dmusl &quot;<br>
=C2=A0 CFLAGS_append_powerpc64 =3D &quot; -D__SANE_USERSPACE_TYPES__&quot;<=
br>
=C2=A0 CFLAGS_append_mipsarchn64 =3D &quot; -D__SANE_USERSPACE_TYPES__&quot=
;<br>
-SRCREV =3D &quot;bac930f71b1e6786ebb8a89446350<wbr>3d07681ef6a&quot;<br>
+SRCREV =3D &quot;731cd34e682d297b207668be8b1d1<wbr>5320a9ac1b1&quot;<br>
=C2=A0 =C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/linux-te=
st-project/ltp.git" rel=3D"noreferrer" target=3D"_blank">github.com/linux-t=
est-p<wbr>roject/ltp.git</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-add-_GNU_SOURCE=
-t<wbr>o-pec_listener.c.patch \<br>
@@ -43,13 +43,10 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/li=
nux-test-project/ltp.git" rel=3D"noreferrer" target=3D"_blank">github.com/l=
inux-test-p<wbr>roject/ltp.git</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0026-crash01-Define-=
_G<wbr>NU_SOURCE.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0027-sysconf01-Use-_=
<wbr>SC_2_C_VERSION-conditionally.p<wbr>atch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0028-rt_sigaction.h-=
Us<wbr>e-sighandler_t-instead-of-__si<wbr>ghand.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0030-lib-Use-PTHREAD_M<wbr=
>UTEX_RECURSIVE-in-place-of-PTH<wbr>READ_.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0033-shmat1-Cover-GN=
U-<wbr>specific-code-under-__USE_GNU.<wbr>patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0034-periodic_output=
.p<wbr>atch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0035-fix-test_proc_k=
il<wbr>l-hang.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0036-testcases-<wbr>=
network-nfsv4-acl-acl1.c-<wbr>Security-fix-on-s.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0037-ltp-fix-format-se<wbr=
>curity-error.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0038-generate-reproduc<wbr=
>ible-gzip.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0039-commands-ar01-<=
wbr>Fix-for-test-in-deterministic-<wbr>mode.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
=C2=A0 <br>
</blockquote>
<br>
-- <br></div></div><div class=3D"HOEnZb"><div class=3D"h5">
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--001a1144d5eaa1d6f50563fd872d--
