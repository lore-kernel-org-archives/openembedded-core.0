Return-Path: <jpewhacker@gmail.com>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id E92B17D274
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Apr 2019 20:04:26 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id v14so7407328wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Apr 2019 13:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Q8ZjCluaWLpgiiFu2Nq9wa6pvOt/hb/wPCn+fQo5iVQ=;
	b=fk3J6uVjf/IvQ38/bIyocy3Jmx5Pg5iEDQGnEO2+ISgWCKuw8iqHT3L0l4nKI0l9xH
	kq2DHLNW9JEHN9ygRUrwTz17ILrRhyQJfOY6MZkpsk4gDQqEufrUwUR9iNaYPrZmHmlm
	/3IKjmLhWTJqMt+QL3LE7TEGWpsrP2UdUVIk/wXTS31VDk4eO5c1xh+ROVZC3WkFeRJQ
	buM9nlZLzRtOzqlQz654Eaqfq9tHQUzlT9IEfGikjL0v/7IE3R1z9Qb1tBUql8gfbLjU
	WVBBblC7pf7xxd9RsLfiMArclltbk5+OMvodPkEheeFWN4SG3HWLKTM3JETr66hc2ROl
	Kc9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Q8ZjCluaWLpgiiFu2Nq9wa6pvOt/hb/wPCn+fQo5iVQ=;
	b=Ds+8V5qMVm3wnrZsB80x2Y19ml0moeI0HqHnR2J1mfpp4lt934MWafFIHqfv+xU4Y5
	Jh57wEhcpI0/vKkZNT468P22WyFUuNMNBDgtqEKcGWCrc/OnDRrbd88bjXySVWApgxTv
	S5CJtnaWzsVyBtJ2rt3SElnagh9hS/Yd9J/7CxoRjY612MCmhfAPb8dGbhtKUXux2kmo
	3fHkRdITcpNU/+ozxdd2nWXkTdUMybOqeUVfqWbqVN235mbQwhrGmSCvR1BbDf6cjOQ/
	wRxkv1H1GZNJd/fhLm7YrSXZ6IRyjK89+6eh3wBZE4uU85T+7jMDkSuQhQ4/O06N6smI
	Q91w==
X-Gm-Message-State: APjAAAWU8oMBmDAbz6G8UbnMCQPjcxSpkUP22p4BEn7iDIK0fmMPmz6g
	gN1aow1o8T07TfEkGuCx8pTLA8V+KGcWdaMfZvI=
X-Google-Smtp-Source: APXvYqwgZ/DdARYAdealrOW7Xd7XQpPCwG3qTdiojCeOQt5vVl4wJ3qNGs2IhmqYBu3ybkc+SODfB7GKcaPEEhhlkRQ=
X-Received: by 2002:a1c:dc84:: with SMTP id t126mr3548017wmg.143.1555704267560;
	Fri, 19 Apr 2019 13:04:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190419190139.26106-1-Randy.MacLeod@windriver.com>
	<042de1d8-1cec-1941-c270-629709cb4a2e@windriver.com>
In-Reply-To: <042de1d8-1cec-1941-c270-629709cb4a2e@windriver.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Fri, 19 Apr 2019 15:04:16 -0500
Message-ID: <CAJdd5GbT1HscC-8zTiud4_=Vm6PwWUYW370=C7KBt6H_soSpHg@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] valgrind: update from 3.14.0 to 3.15.0
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
X-List-Received-Date: Fri, 19 Apr 2019 20:04:27 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 19, 2019 at 2:27 PM Randy MacLeod
<randy.macleod@windriver.com> wrote:
>
> On 4/19/19 3:01 PM, Randy MacLeod wrote:
> > The SRC_URI moved.
> > Two local patches are now fixed upstream so remove them.
> >
> > The glibc ptest results are essentially the same.
> s/glibc/qemux86-64 glibc/
> >
> >               3.14  3.15
> > TOTAL:        579   589
> > PASSED:       297   301
> > FAILED:       251   254
> > SKIPPED:       31    34
> > DURATION:    1312  1171
>
> I hope to have time to fix some of these valgrind ptest failures
> but I didn't want to hold back the update.
>
> Build tested for all qemu machines, for both glibc and musl.
>
> I'm building core-image-sato-sdk-ptest for qemuarm64 now but
> it will be a while so merge if you like or wait for an update
> and a v2 with minor improvements.

Randy,

Might this be related to or fix
https://bugzilla.yoctoproject.org/show_bug.cgi?id=13302 ?

>
> ../Randy
>
> >
> > Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> > ---
> >   ...-between-libcoregrind-.a-and-m_main..patch | 45 -------------------
> >   ...ts-amd64-Do-not-clobber-rsp-register.patch | 37 ---------------
> >   ...{valgrind_3.14.0.bb => valgrind_3.15.0.bb} |  8 ++--
> >   3 files changed, 3 insertions(+), 87 deletions(-)
> >   delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-Fix-dependencies-between-libcoregrind-.a-and-m_main..patch
> >   delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-tests-amd64-Do-not-clobber-rsp-register.patch
> >   rename meta/recipes-devtools/valgrind/{valgrind_3.14.0.bb => valgrind_3.15.0.bb} (94%)
> >
> > diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-Fix-dependencies-between-libcoregrind-.a-and-m_main..patch b/meta/recipes-devtools/valgrind/valgrind/0001-Fix-dependencies-between-libcoregrind-.a-and-m_main..patch
> > deleted file mode 100644
> > index bedf1c1274..0000000000
> > --- a/meta/recipes-devtools/valgrind/valgrind/0001-Fix-dependencies-between-libcoregrind-.a-and-m_main..patch
> > +++ /dev/null
> > @@ -1,45 +0,0 @@
> > -From 7820fc268fae4353118b6355f1d4b9e1b7eeebec Mon Sep 17 00:00:00 2001
> > -From: Philippe Waroquiers <philippe.waroquiers@skynet.be>
> > -Date: Sun, 28 Oct 2018 18:35:11 +0100
> > -Subject: [PATCH] Fix dependencies between libcoregrind*.a and
> > - *m_main.o/*m_libcsetjmp.o
> > -
> > -The primary and secondary coregrind libraries must be updated
> > -when m_main.c or m_libcsetjmp.c are changed.
> > -
> > -A dependency was missing between libcoregrind*.a and libnolto_coregrind*.a,
> > -and so tools were not relinked when m_main.c or m_libcsetjmp.c were
> > -changed.
> > -
> > -Upstream-Status: Backport[git://sourceware.org/git/valgrind.git 7820fc268fae4353118b6355f1d4b9e1b7eeebec]
> > -
> > -Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> > ----
> > - coregrind/Makefile.am | 4 ++++
> > - 1 file changed, 4 insertions(+)
> > -
> > -diff --git a/coregrind/Makefile.am b/coregrind/Makefile.am
> > -index 914a270..8de1996 100644
> > ---- a/coregrind/Makefile.am
> > -+++ b/coregrind/Makefile.am
> > -@@ -511,6 +511,8 @@ libcoregrind_@VGCONF_ARCH_PRI@_@VGCONF_OS@_a_CFLAGS += \
> > - endif
> > - libcoregrind_@VGCONF_ARCH_PRI@_@VGCONF_OS@_a_LIBADD = \
> > -     $(libnolto_coregrind_@VGCONF_ARCH_PRI@_@VGCONF_OS@_a_OBJECTS)
> > -+libcoregrind_@VGCONF_ARCH_PRI@_@VGCONF_OS@_a_DEPENDENCIES = \
> > -+    libnolto_coregrind-@VGCONF_ARCH_PRI@-@VGCONF_OS@.a
> > -
> > - if VGCONF_HAVE_PLATFORM_SEC
> > - libcoregrind_@VGCONF_ARCH_SEC@_@VGCONF_OS@_a_SOURCES = \
> > -@@ -531,6 +533,8 @@ libcoregrind_@VGCONF_ARCH_SEC@_@VGCONF_OS@_a_CFLAGS += \
> > - endif
> > - libcoregrind_@VGCONF_ARCH_SEC@_@VGCONF_OS@_a_LIBADD = \
> > -     $(libnolto_coregrind_@VGCONF_ARCH_SEC@_@VGCONF_OS@_a_OBJECTS)
> > -+libcoregrind_@VGCONF_ARCH_SEC@_@VGCONF_OS@_a_DEPENDENCIES = \
> > -+    libnolto_coregrind-@VGCONF_ARCH_SEC@-@VGCONF_OS@.a
> > - endif
> > -
> > - #----------------------------------------------------------------------------
> > ---
> > -2.10.2
> > -
> > diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-tests-amd64-Do-not-clobber-rsp-register.patch b/meta/recipes-devtools/valgrind/valgrind/0001-tests-amd64-Do-not-clobber-rsp-register.patch
> > deleted file mode 100644
> > index 657f80335d..0000000000
> > --- a/meta/recipes-devtools/valgrind/valgrind/0001-tests-amd64-Do-not-clobber-rsp-register.patch
> > +++ /dev/null
> > @@ -1,37 +0,0 @@
> > -From 8c1ebb564f5eca2baeedc27a703200786d1abb0b Mon Sep 17 00:00:00 2001
> > -From: Khem Raj <raj.khem@gmail.com>
> > -Date: Sat, 22 Dec 2018 15:28:40 -0800
> > -Subject: [PATCH] tests/amd64: Do not clobber %rsp register
> > -
> > -This is seen with gcc-9.0 compiler now which is fix that gcc community
> > -did recently
> > -https://gcc.gnu.org/bugzilla/show_bug.cgi?id=52813
> > -
> > -Upstream-Status: Submitted [https://bugs.kde.org/show_bug.cgi?id=402480]
> > -
> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ----
> > - none/tests/amd64-linux/bug345887.c | 5 +++--
> > - 1 file changed, 3 insertions(+), 2 deletions(-)
> > -
> > -diff --git a/none/tests/amd64-linux/bug345887.c b/none/tests/amd64-linux/bug345887.c
> > -index 0f9237d..4b07fe1 100644
> > ---- a/none/tests/amd64-linux/bug345887.c
> > -+++ b/none/tests/amd64-linux/bug345887.c
> > -@@ -20,13 +20,14 @@ static void inner(void)
> > -       "movq $0x10d, %%r14\n"
> > -       "movq $0x10e, %%r15\n"
> > -       // not %rbp as mdb is then not able to reconstruct stack trace
> > --      "movq $0x10f, %%rsp\n"
> > -+      // not %rsp since gcc ignores it and since gcc >= 9.0 errors about it
> > -+      // see https://gcc.gnu.org/bugzilla/show_bug.cgi?id=52813
> > -       "movq $0x1234, (%%rax)\n"  // should cause SEGV here
> > -       "ud2"                      // should never get here
> > -       : // no output registers
> > -       : // no input registers
> > -       : "memory", "%rax", "%rbx", "%rcx", "%rdx", "%rsi", "%rdi",
> > --        "%r8", "%r9", "%r10", "%r11", "%r12", "%r13", "%r14", "%r15", "%rsp");
> > -+        "%r8", "%r9", "%r10", "%r11", "%r12", "%r13", "%r14", "%r15");
> > - }
> > -
> > - __attribute__((noinline))
> > diff --git a/meta/recipes-devtools/valgrind/valgrind_3.14.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
> > similarity index 94%
> > rename from meta/recipes-devtools/valgrind/valgrind_3.14.0.bb
> > rename to meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
> > index db1bd9fc5b..3159f32230 100644
> > --- a/meta/recipes-devtools/valgrind/valgrind_3.14.0.bb
> > +++ b/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
> > @@ -12,7 +12,7 @@ DEPENDS = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d
> >              ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'boost', '', d)} \
> >           "
> >
> > -SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
> > +SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
> >              file://fixed-perl-path.patch \
> >              file://Added-support-for-PPC-instructions-mfatbu-mfatbl.patch \
> >              file://run-ptest \
> > @@ -36,11 +36,9 @@ SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
> >              file://0001-fix-opcode-not-supported-on-mips32-linux.patch \
> >              file://0001-Guard-against-__GLIBC_PREREQ-for-musl-libc.patch \
> >              file://0001-Make-local-functions-static-to-avoid-assembler-error.patch \
> > -           file://0001-tests-amd64-Do-not-clobber-rsp-register.patch \
> > -           file://0001-Fix-dependencies-between-libcoregrind-.a-and-m_main..patch \
> >              "
> > -SRC_URI[md5sum] = "74175426afa280184b62591b58c671b3"
> > -SRC_URI[sha256sum] = "037c11bfefd477cc6e9ebe8f193bb237fe397f7ce791b4a4ce3fa1c6a520baa5"
> > +SRC_URI[md5sum] = "46e5fbdcbc3502a5976a317a0860a975"
> > +SRC_URI[sha256sum] = "417c7a9da8f60dd05698b3a7bc6002e4ef996f14c13f0ff96679a16873e78ab1"
> >   UPSTREAM_CHECK_REGEX = "valgrind-(?P<pver>\d+(\.\d+)+)\.tar"
> >
> >   COMPATIBLE_HOST = '(i.86|x86_64|arm|aarch64|mips|powerpc|powerpc64).*-linux'
> >
>
>
> --
> # Randy MacLeod
> # Wind River Linux
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

