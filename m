Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
	[209.85.217.68])
	by mail.openembedded.org (Postfix) with ESMTP id 99DF97F7BB
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2019 17:15:47 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id x4so2668623vsx.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2019 09:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=av39lXIrgAPIjZKTQo1wuHh0+BkxlZeBaWTo8Hq4H+Y=;
	b=EyevsDymOFe0imIUPMU8MOiHD3nk9jqkXCcs+bd4sknez9ItrzSdsrGtB+O9oeIpGq
	Pxqekv61RyGHYt34W5jUA++h9cOnvHCNMrH39Kmcg3xw56hUKr/E/sxmpVc3DR4UUjr+
	q5MMGReuD2KGIpT7kKo+G0Vv/acyt4f1xUUZNTxwHa4CoLqxdhA/7L16nTBelxnHap6H
	avJGfRj/BKSvMVsKOrXl3JZemwo1TibtsmEEf7xkbiEsi4d6I9aGOA5BxOo89L4ahBEz
	P030cpdyeDMJkgkA33H00DqAr9AwIA0H5iF+clqSY6npjho0Q/cqQsXIcl2cQiMPS/9J
	TRNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=av39lXIrgAPIjZKTQo1wuHh0+BkxlZeBaWTo8Hq4H+Y=;
	b=gGncovrDVL6PHIpwziF+X+/9PMJ+ezIo6ezqS31Xexd5+t/2h2W2Zl/xBEJogLU5ji
	YOyEmaTeXk3MBCzlX6XCPp0VI7R8VX43Jes5SxeDgA2eDSuK9VS5lX1XYPFPIfoi958E
	ZOyQnwjfoxJ6sjF7lWJ8vBecP7WEVW1jrCReq/98MozdOpLZWGnWgqihYD6LrkaW4WQx
	SoyYoIm/gMx0sjoKLHVtAjqaQ4aO5WtBpOzpuwV3JqqRrYjY7+1QJ43mU3s+TvtTwm31
	sVx+Mmfn18Weom2nCQoBVvIeZ3cllh1kvq1WysCGs6Kc2m2WVmFL49x10ESxXCsH/p6H
	SNMQ==
X-Gm-Message-State: APjAAAVeCTeeNe95NT8O3kEXz6nXkVrt82pbqC1EHNNL3mG31byii+T1
	mNGnV2fJWBDtKUqEX35rdQCq1cYoqsNUdGxog6A=
X-Google-Smtp-Source: APXvYqxiQTqu47jAq2j78LQRFSaDnDLgEy1WZFgSFIs+tRbkGGhXLxZvmgh+KPZuwLgO/ULDo2GkNV31qU/GdnfHb/k=
X-Received: by 2002:a67:f356:: with SMTP id p22mr17263435vsm.25.1576430148003; 
	Sun, 15 Dec 2019 09:15:48 -0800 (PST)
MIME-Version: 1.0
References: <20191212181436.1322-1-alex.kanavin@gmail.com>
	<20191212181436.1322-26-alex.kanavin@gmail.com>
	<CAMKF1sokvqH-igunDBraLVSQ+Xd9MxMkLGE3BojqAtKN9Suwtg@mail.gmail.com>
	<CANNYZj98h6pBXigiOVBfNZMeZj5jqa+KUfBtS8bUeDc=YVRtmA@mail.gmail.com>
	<CAMKF1so5Kn7g-_ryg+-jBU43mpbjAiB+ocGuqfWkeNyjufujvg@mail.gmail.com>
In-Reply-To: <CAMKF1so5Kn7g-_ryg+-jBU43mpbjAiB+ocGuqfWkeNyjufujvg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 15 Dec 2019 18:15:36 +0100
Message-ID: <CANNYZj-eQxXhDScqfmOVa==b+mdrbKocP6BEDEoPXrrkTQtHOQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 26/30] ltp: update to 20190930
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
X-List-Received-Date: Sun, 15 Dec 2019 17:15:48 -0000
Content-Type: multipart/alternative; boundary="000000000000fc2c900599c13e09"

--000000000000fc2c900599c13e09
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 15 Dec 2019 at 18:11, Khem Raj <raj.khem@gmail.com> wrote:

> On Sun, Dec 15, 2019 at 3:02 AM Alexander Kanavin <alex.kanavin@gmail.com=
>
> wrote:
>
>> As the last three issues are clang or musl related, may I request that
>> you look into them?
>>
>
> I will try but there is one issue where a patch is removed which should
> not be so it=E2=80=99s better if that patch can be forward ported as need=
ed for
> newer issues I will see if I can find some solutions
>

The patch was removed as upstream has actually fixed/changed the things it
was patching, so it's probably a new issue. Also I am not able to easily
test with clang.
Can you take a look please?

Alex



>> Alex
>>
>> On Sun, 15 Dec 2019 at 06:33, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>> musl build fails on aarch64
>>>
>>> https://errors.yoctoproject.org/Errors/Details/297288/
>>>
>>> On Thu, Dec 12, 2019 at 10:18 AM Alexander Kanavin
>>> <alex.kanavin@gmail.com> wrote:
>>> >
>>> > Drop a big pile of backports.
>>> >
>>> > Add a patch to address absent string formatting error.
>>> >
>>> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>>> > ---
>>> >  ...me-check-for-getdents-getdents64-API.patch |  72 --------
>>> >  ...option-to-select-libc-implementation.patch |  27 ++-
>>> >  ...-17052-Avoid-unsafe-exits-in-threads.patch |  64 -------
>>> >  ...meltdown.c-Fix-kernel-symbol-finding.patch |  81 ---------
>>> >  ...y-update-for-mm-fix-false-positive-O.patch |  57 -------
>>> >  ...medwait01-Fix-wrong-sigset-length-fo.patch |  46 -----
>>> >  ...3-wait-for-defunct-tid-to-get-detach.patch |  75 --------
>>> >  ...es-fix-an-absent-format-string-issue.patch |  24 +++
>>> >  ...thon3-everywhere-to-run-python-scrip.patch | 161 ----------------=
--
>>> >  ...x-EFAULT-in-32bit-compatibility-mode.patch |  36 ----
>>> >  ...k-for-RES_USE_INET6-during-configure.patch |  68 --------
>>> >  ...BC_PREREQ-is-defined-before-using-it.patch |  27 ++-
>>> >  ...se-hardcoded-index-0-for-SHM_STAT-te.patch |  82 ---------
>>> >  ...11-direct_io-diotest4-drop-MAP_FIXED.patch |  56 ------
>>> >  ...st-a-bit-of-code-to-compatiable-with.patch |  64 -------
>>> >  .../ltp/{ltp_20190517.bb =3D> ltp_20190930.bb}  |  15 +-
>>> >  16 files changed, 51 insertions(+), 904 deletions(-)
>>> >  delete mode 100644
>>> meta/recipes-extended/ltp/ltp/0001-Add-configure-time-check-for-getdent=
s-getdents64-API.patch
>>> >  delete mode 100644
>>> meta/recipes-extended/ltp/ltp/0001-cve-2017-17052-Avoid-unsafe-exits-in=
-threads.patch
>>> >  delete mode 100644
>>> meta/recipes-extended/ltp/ltp/0001-cve-meltdown.c-Fix-kernel-symbol-fin=
ding.patch
>>> >  delete mode 100644
>>> meta/recipes-extended/ltp/ltp/0001-overcommit_memory-update-for-mm-fix-=
false-positive-O.patch
>>> >  delete mode 100644
>>> meta/recipes-extended/ltp/ltp/0001-syscall-rt_sigtimedwait01-Fix-wrong-=
sigset-length-fo.patch
>>> >  delete mode 100644
>>> meta/recipes-extended/ltp/ltp/0001-syscalls-tgkill03-wait-for-defunct-t=
id-to-get-detach.patch
>>> >  create mode 100644
>>> meta/recipes-extended/ltp/ltp/0001-testcases-fix-an-absent-format-strin=
g-issue.patch
>>> >  delete mode 100644
>>> meta/recipes-extended/ltp/ltp/0001-testcases-use-python3-everywhere-to-=
run-python-scrip.patch
>>> >  delete mode 100644
>>> meta/recipes-extended/ltp/ltp/0001-ustat02-Fix-EFAULT-in-32bit-compatib=
ility-mode.patch
>>> >  delete mode 100644
>>> meta/recipes-extended/ltp/ltp/0002-check-for-RES_USE_INET6-during-confi=
gure.patch
>>> >  delete mode 100644
>>> meta/recipes-extended/ltp/ltp/0010-shmctl01-don-t-use-hardcoded-index-0=
-for-SHM_STAT-te.patch
>>> >  delete mode 100644
>>> meta/recipes-extended/ltp/ltp/0011-direct_io-diotest4-drop-MAP_FIXED.pa=
tch
>>> >  delete mode 100644
>>> meta/recipes-extended/ltp/ltp/0012-getrlimit03-adjust-a-bit-of-code-to-=
compatiable-with.patch
>>> >  rename meta/recipes-extended/ltp/{ltp_20190517.bb =3D> ltp_20190930.=
bb}
>>> (84%)
>>> >
>>> > diff --git
>>> a/meta/recipes-extended/ltp/ltp/0001-Add-configure-time-check-for-getde=
nts-getdents64-API.patch
>>> b/meta/recipes-extended/ltp/ltp/0001-Add-configure-time-check-for-getde=
nts-getdents64-API.patch
>>> > deleted file mode 100644
>>> > index bfceadb190d..00000000000
>>> > ---
>>> a/meta/recipes-extended/ltp/ltp/0001-Add-configure-time-check-for-getde=
nts-getdents64-API.patch
>>> > +++ /dev/null
>>> > @@ -1,72 +0,0 @@
>>> > -From 404dfeb4faef213b0450f173b60cd7080edec349 Mon Sep 17 00:00:00 20=
01
>>> > -From: Khem Raj <raj.khem@gmail.com>
>>> > -Date: Fri, 26 Jul 2019 10:32:29 -0700
>>> > -Subject: [PATCH 1/2] Add configure time check for getdents/getdents6=
4
>>> APIs
>>> > -
>>> > -glibc 2.30 has added wrapper for getdents64 this will help in
>>> detecting
>>> > -right condition to use fallback
>>> > -
>>> > -Check for getdents API as well while here
>>> > -
>>> > -Upstream-Status: Submitted [
>>> http://lists.linux.it/pipermail/ltp/2019-July/012954.html]
>>> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> > ----
>>> > - configure.ac                                  | 2 ++
>>> > - testcases/kernel/syscalls/getdents/getdents.h | 8 ++++++--
>>> > - 2 files changed, 8 insertions(+), 2 deletions(-)
>>> > -
>>> > ---- a/configure.ac
>>> > -+++ b/configure.ac
>>> > -@@ -65,6 +65,8 @@ AC_CHECK_FUNCS([ \
>>> > -     fallocate \
>>> > -     fchownat \
>>> > -     fstatat \
>>> > -+    getdents \
>>> > -+    getdents64 \
>>> > -     kcmp \
>>> > -     mkdirat \
>>> > -     mknodat \
>>> > ---- a/testcases/kernel/syscalls/getdents/getdents.h
>>> > -+++ b/testcases/kernel/syscalls/getdents/getdents.h
>>> > -@@ -23,7 +23,7 @@
>>> > - #include <stdint.h>
>>> > - #include "test.h"
>>> > - #include "lapi/syscalls.h"
>>> > --
>>> > -+#include "config.h"
>>> > - /*
>>> > -  * See fs/compat.c struct compat_linux_dirent
>>> > -  */
>>> > -@@ -34,12 +34,17 @@ struct linux_dirent {
>>> > -       char            d_name[];
>>> > - };
>>> > -
>>> > -+#if HAVE_GETDENTS
>>> > -+#include <unistd.h>
>>> > -+#else
>>> > - static inline int
>>> > - getdents(unsigned int fd, struct linux_dirent *dirp, unsigned int
>>> size)
>>> > - {
>>> > -       return ltp_syscall(__NR_getdents, fd, dirp, size);
>>> > - }
>>> > -
>>> > -+#endif /* HAVE_GETDENTS */
>>> > -+
>>> > - struct linux_dirent64 {
>>> > -       uint64_t        d_ino;
>>> > -       int64_t         d_off;
>>> > -@@ -48,10 +53,13 @@ struct linux_dirent64 {
>>> > -       char            d_name[];
>>> > - };
>>> > -
>>> > -+#if HAVE_GETDENTS64
>>> > -+#include <unistd.h>
>>> > -+#else
>>> > - static inline int
>>> > - getdents64(unsigned int fd, struct linux_dirent64 *dirp64, unsigned
>>> int size)
>>> > - {
>>> > -       return ltp_syscall(__NR_getdents64, fd, dirp64, size);
>>> > - }
>>> > --
>>> > -+#endif /* HAVE_GETDENTS64 */
>>> > - #endif /* GETDENTS_H */
>>> > diff --git
>>> a/meta/recipes-extended/ltp/ltp/0001-build-Add-option-to-select-libc-im=
plementation.patch
>>> b/meta/recipes-extended/ltp/ltp/0001-build-Add-option-to-select-libc-im=
plementation.patch
>>> > index b5c25c56a57..1705abcf196 100644
>>> > ---
>>> a/meta/recipes-extended/ltp/ltp/0001-build-Add-option-to-select-libc-im=
plementation.patch
>>> > +++
>>> b/meta/recipes-extended/ltp/ltp/0001-build-Add-option-to-select-libc-im=
plementation.patch
>>> > @@ -1,4 +1,4 @@
>>> > -From ec282980e6eee96f5b74aba464141f86049263e6 Mon Sep 17 00:00:00 20=
01
>>> > +From 62c3481c73a2414d7a5f0a70808bfc9a06195bd9 Mon Sep 17 00:00:00 20=
01
>>> >  From: Khem Raj <raj.khem@gmail.com>
>>> >  Date: Thu, 7 Jan 2016 18:19:03 +0000
>>> >  Subject: [PATCH] build: Add option to select libc implementation
>>> > @@ -12,6 +12,7 @@ Disable tests specifically not building _yet_ on
>>> musl based systems
>>> >  Upstream-Status: Pending
>>> >
>>> >  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> > +
>>> >  ---
>>> >   Makefile                                    | 5 +++++
>>> >   testcases/kernel/Makefile                   | 5 ++++-
>>> > @@ -24,7 +25,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> >   8 files changed, 35 insertions(+), 2 deletions(-)
>>> >
>>> >  diff --git a/Makefile b/Makefile
>>> > -index 768ca46..e9d679a 100644
>>> > +index 768ca4606..e9d679a71 100644
>>> >  --- a/Makefile
>>> >  +++ b/Makefile
>>> >  @@ -41,6 +41,11 @@ vpath %.mk
>>> $(top_srcdir)/mk:$(top_srcdir)/mk/include
>>> > @@ -40,18 +41,19 @@ index 768ca46..e9d679a 100644
>>> >   # COMMON_TARGETS:     Targets which exist in all, clean, and instal=
l.
>>> >   # INSTALL_TARGETS:    Targets which exist in clean and install
>>> (contains
>>> >  diff --git a/testcases/kernel/Makefile b/testcases/kernel/Makefile
>>> > -index 39d79c7..24a57d9 100644
>>> > +index 3319b3163..94ea362c8 100644
>>> >  --- a/testcases/kernel/Makefile
>>> >  +++ b/testcases/kernel/Makefile
>>> > -@@ -49,12 +49,15 @@ SUBDIRS                    +=3D connectors \
>>> > +@@ -49,13 +49,16 @@ SUBDIRS                    +=3D connectors \
>>> >                            logging \
>>> >                            mem \
>>> >                            numa \
>>> >  -                         pty \
>>> >                            sched \
>>> >                            security \
>>> > -                          timers \
>>> > +                          sound \
>>> >                            tracing \
>>> > +                          uevents \
>>> >
>>> >  +ifneq ($(LIBC),musl)
>>> >  +SUBDIRS                       +=3D pty
>>> > @@ -61,7 +63,7 @@ index 39d79c7..24a57d9 100644
>>> >   SUBDIRS                       +=3D power_management
>>> >   endif
>>> >  diff --git a/testcases/kernel/sched/Makefile
>>> b/testcases/kernel/sched/Makefile
>>> > -index 6a57d79..74bb933 100644
>>> > +index 6a57d79ee..74bb93370 100644
>>> >  --- a/testcases/kernel/sched/Makefile
>>> >  +++ b/testcases/kernel/sched/Makefile
>>> >  @@ -23,5 +23,7 @@
>>> > @@ -74,7 +76,7 @@ index 6a57d79..74bb933 100644
>>> >  +endif
>>> >   include $(top_srcdir)/include/mk/generic_trunk_target.mk
>>> >  diff --git a/testcases/kernel/syscalls/Makefile
>>> b/testcases/kernel/syscalls/Makefile
>>> > -index 45a00cf..d1becd0 100644
>>> > +index 45a00cf7d..d1becd054 100644
>>> >  --- a/testcases/kernel/syscalls/Makefile
>>> >  +++ b/testcases/kernel/syscalls/Makefile
>>> >  @@ -28,6 +28,11 @@ ifeq ($(UCLINUX),1)
>>> > @@ -90,7 +92,7 @@ index 45a00cf..d1becd0 100644
>>> >   ifeq ($(UCLIBC),1)
>>> >   FILTER_OUT_DIRS       +=3D profil
>>> >  diff --git a/testcases/network/nfsv4/acl/Makefile
>>> b/testcases/network/nfsv4/acl/Makefile
>>> > -index 8c55a6b..f7cda62 100644
>>> > +index 8c55a6bbd..f7cda621d 100644
>>> >  --- a/testcases/network/nfsv4/acl/Makefile
>>> >  +++ b/testcases/network/nfsv4/acl/Makefile
>>> >  @@ -26,4 +26,8 @@ include $(top_srcdir)/include/mk/env_pre.mk
>>> > @@ -103,7 +105,7 @@ index 8c55a6b..f7cda62 100644
>>> >  +
>>> >   include $(top_srcdir)/include/mk/generic_leaf_target.mk
>>> >  diff --git a/testcases/network/rpc/basic_tests/Makefile
>>> b/testcases/network/rpc/basic_tests/Makefile
>>> > -index 66e9d56..ea8eb8a 100644
>>> > +index 66e9d5675..ea8eb8a98 100644
>>> >  --- a/testcases/network/rpc/basic_tests/Makefile
>>> >  +++ b/testcases/network/rpc/basic_tests/Makefile
>>> >  @@ -23,4 +23,9 @@
>>> > @@ -117,7 +119,7 @@ index 66e9d56..ea8eb8a 100644
>>> >  +
>>> >   include $(top_srcdir)/include/mk/generic_trunk_target.mk
>>> >  diff --git a/testcases/realtime/func/pi-tests/Makefile
>>> b/testcases/realtime/func/pi-tests/Makefile
>>> > -index 68616a7..748754b 100644
>>> > +index 68616a711..748754bb4 100644
>>> >  --- a/testcases/realtime/func/pi-tests/Makefile
>>> >  +++ b/testcases/realtime/func/pi-tests/Makefile
>>> >  @@ -27,5 +27,9 @@ include $(top_srcdir)/include/mk/env_pre.mk
>>> > @@ -131,7 +133,7 @@ index 68616a7..748754b 100644
>>> >
>>> >   include $(top_srcdir)/include/mk/generic_leaf_target.mk
>>> >  diff --git a/testcases/realtime/stress/pi-tests/Makefile
>>> b/testcases/realtime/stress/pi-tests/Makefile
>>> > -index 1881f75..266e0b8 100644
>>> > +index 1881f7565..266e0b815 100644
>>> >  --- a/testcases/realtime/stress/pi-tests/Makefile
>>> >  +++ b/testcases/realtime/stress/pi-tests/Makefile
>>> >  @@ -24,4 +24,9 @@ top_srcdir           ?=3D ../../../..
>>> > @@ -144,6 +146,3 @@ index 1881f75..266e0b8 100644
>>> >  +endif
>>> >  +
>>> >   include $(top_srcdir)/include/mk/generic_leaf_target.mk
>>> > ---
>>> > -2.7.4
>>> > -
>>> > diff --git
>>> a/meta/recipes-extended/ltp/ltp/0001-cve-2017-17052-Avoid-unsafe-exits-=
in-threads.patch
>>> b/meta/recipes-extended/ltp/ltp/0001-cve-2017-17052-Avoid-unsafe-exits-=
in-threads.patch
>>> > deleted file mode 100644
>>> > index cc40081300c..00000000000
>>> > ---
>>> a/meta/recipes-extended/ltp/ltp/0001-cve-2017-17052-Avoid-unsafe-exits-=
in-threads.patch
>>> > +++ /dev/null
>>> > @@ -1,64 +0,0 @@
>>> > -From e3a8502d0a4f8a44ddd02ca4b2efc097133fb9f7 Mon Sep 17 00:00:00 20=
01
>>> > -From: Mathias Fiedler <mathias.fiedler@aox-tech.de>
>>> > -Date: Fri, 23 Aug 2019 12:46:48 +0200
>>> > -Subject: [PATCH] cve-2017-17052: Avoid unsafe exits in threads
>>> > -
>>> > -According to manpage exit(3) calling exit is not thread-safe.
>>> > -And with glibc 2.28 (and probably also with glibc >=3D2.27) sometime=
s
>>> > -child processes created in fork_thread can get stuck on process exit
>>> in
>>> > -glibc's __run_exit_handlers trying to acquire some lock which was in
>>> > -locked state while the fork was created. This can happen when exit i=
s
>>> > -called in mmap_thread concurrently to the fork.
>>> > -While the main process will still return with PASSED some of its
>>> > -children are left behind.
>>> > -
>>> > -Comparing the source code with the original program as described in
>>> the
>>> > -commit 2b7e8665b4ff51c034c55df3cff76518d1a9ee3a of linux kernel >=3D=
4.13
>>> > -the exits in mmap_thread and fork_thread should not be necessary to
>>> > -trigger the original bug.
>>> > -
>>> > -Therefore those exit calls are removed. The mmap_thread and
>>> fork_thread
>>> > -should still exit when their corresponding main thread in do_test_fo=
rk
>>> > -calls exit_group. The remaining exit in do_test_fork will be called =
in
>>> > -the main thread without any concurrent thread in the same process.
>>> > -
>>> > -Signed-off-by: Mathias Fiedler <mathias.fiedler@aox-tech.de>
>>> > -Acked-by: Cyril Hrubis <chrubis@suse.cz>
>>> > -Acked-by: Jan Stancek <jstancek@redhat.com>
>>> > -
>>> > -Upstream-Status: Backport
>>> > -[
>>> https://github.com/linux-test-project/ltp/commit/9f0b452c1af4bcb54da357=
11eb3fa77334a350b4
>>> ]
>>> > -
>>> > -CVE: CVE-2017-17052
>>> > -
>>> > -Signed-off-by: He Zhe <zhe.he@windriver.com>
>>> > ----
>>> > - testcases/cve/cve-2017-17052.c | 5 -----
>>> > - 1 file changed, 5 deletions(-)
>>> > -
>>> > -diff --git a/testcases/cve/cve-2017-17052.c
>>> b/testcases/cve/cve-2017-17052.c
>>> > -index d7da7e919..18cd2a6d7 100644
>>> > ---- a/testcases/cve/cve-2017-17052.c
>>> > -+++ b/testcases/cve/cve-2017-17052.c
>>> > -@@ -58,8 +58,6 @@ static void *mmap_thread(void *arg)
>>> > -       for (;;) {
>>> > -               SAFE_MMAP(NULL, 0x1000000, PROT_READ,
>>> > -
>>>  MAP_POPULATE|MAP_ANONYMOUS|MAP_PRIVATE, -1, 0);
>>> > --              if (*do_exit)
>>> > --                      exit(0);
>>> > -       }
>>> > -
>>> > -       return arg;
>>> > -@@ -67,9 +65,6 @@ static void *mmap_thread(void *arg)
>>> > -
>>> > - static void *fork_thread(void *arg)
>>> > - {
>>> > --      if (*do_exit)
>>> > --              exit(0);
>>> > --
>>> > -       usleep(rand() % 10000);
>>> > -       SAFE_FORK();
>>> > -
>>> > ---
>>> > -2.17.1
>>> > -
>>> > diff --git
>>> a/meta/recipes-extended/ltp/ltp/0001-cve-meltdown.c-Fix-kernel-symbol-f=
inding.patch
>>> b/meta/recipes-extended/ltp/ltp/0001-cve-meltdown.c-Fix-kernel-symbol-f=
inding.patch
>>> > deleted file mode 100644
>>> > index 94f6f5a15a6..00000000000
>>> > ---
>>> a/meta/recipes-extended/ltp/ltp/0001-cve-meltdown.c-Fix-kernel-symbol-f=
inding.patch
>>> > +++ /dev/null
>>> > @@ -1,81 +0,0 @@
>>> > -From fbeda82f440a0098be42dd668cbc47212a86ab48 Mon Sep 17 00:00:00 20=
01
>>> > -From: He Zhe <zhe.he@windriver.com>
>>> > -Date: Wed, 21 Aug 2019 16:27:24 +0800
>>> > -Subject: [PATCH] cve/meltdown.c: Fix kernel symbol finding
>>> > -
>>> > -meltdown case fails as below.
>>> > -safe_file_ops.c:219: BROK: Expected 3 conversions got 2 at
>>> meltdown.c:272
>>> > -
>>> > -find_kernel_symbol is defined to try twice with each of
>>> /proc/kallsyms and
>>> > -/boot/System.map-%s. Currently if the symbol is not found in
>>> /proc/kallsyms,
>>> > -when kernel option CONFIG_KALLSYMS_ALL is disabled, it would stop th=
e
>>> case
>>> > -immediately due to SAFE_FILE_LINES_SCANF.
>>> > -
>>> > -This patch turns to use FILE_LINES_SCANF to give find_kernel_symbol
>>> second
>>> > -chance.
>>> > -
>>> > -[jstancek] Fix also condition introduced in 7709d2ae92ea, even if
>>> > -           /proc/kallsyms is disabled, we still want to try
>>> System.map.
>>> > -
>>> > -Signed-off-by: He Zhe <zhe.he@windriver.com>
>>> > -Signed-off-by: Jan Stancek <jstancek@redhat.com>
>>> > -
>>> > -Upstream-Status: Backport
>>> > -[
>>> https://github.com/linux-test-project/ltp/commit/c2049b5c874bc071f8185b=
ffb5fd7dcb042d9ec8
>>> ]
>>> > -
>>> > -Remove the hunk for upstream 7709d2ae92ea ("cve/meltdown.c: abort th=
e
>>> test if kallsyms was not enabled")
>>> > -that has been covered by this patch.
>>> > -
>>> > -Signed-off-by: He Zhe <zhe.he@windriver.com>
>>> > ----
>>> > - testcases/cve/meltdown.c | 13 ++++++++++---
>>> > - 1 file changed, 10 insertions(+), 3 deletions(-)
>>> > -
>>> > -diff --git a/testcases/cve/meltdown.c b/testcases/cve/meltdown.c
>>> > -index a53ea9b..22651a6 100644
>>> > ---- a/testcases/cve/meltdown.c
>>> > -+++ b/testcases/cve/meltdown.c
>>> > -@@ -267,9 +267,15 @@ find_symbol_in_file(const char *filename, const
>>> char *symname)
>>> > -       int ret, read;
>>> > -       char fmt[strlen(symname) + 64];
>>> > -
>>> > -+      tst_res(TINFO, "Looking for %s in %s", symname, filename);
>>> > -+      if (access(filename, F_OK) =3D=3D -1) {
>>> > -+              tst_res(TINFO, "%s not available", filename);
>>> > -+              return 0;
>>> > -+      }
>>> > -+
>>> > -       sprintf(fmt, "%%lx %%c %s%%c", symname);
>>> > -
>>> > --      ret =3D SAFE_FILE_LINES_SCANF(filename, fmt, &addr, &type,
>>> &read);
>>> > -+      ret =3D FILE_LINES_SCANF(filename, fmt, &addr, &type, &read);
>>> > -       if (ret)
>>> > -               return 0;
>>> > -
>>> > -@@ -287,13 +293,11 @@ find_kernel_symbol(const char *name)
>>> > -       if (addr)
>>> > -               return addr;
>>> > -
>>> > --      tst_res(TINFO, "not found '%s' in /proc/kallsyms", name);
>>> > -       if (uname(&utsname) < 0)
>>> > -               tst_brk(TBROK | TERRNO, "uname");
>>> > -
>>> > -       sprintf(systemmap, "/boot/System.map-%s", utsname.release);
>>> > -
>>> > --      tst_res(TINFO, "looking in '%s'\n", systemmap);
>>> > -       addr =3D find_symbol_in_file(systemmap, name);
>>> > -       return addr;
>>> > - }
>>> > -@@ -308,6 +312,9 @@ static void setup(void)
>>> > -       saved_cmdline_addr =3D find_kernel_symbol("saved_command_line=
");
>>> > -       tst_res(TINFO, "&saved_command_line =3D=3D 0x%lx",
>>> saved_cmdline_addr);
>>> > -
>>> > -+      if (!saved_cmdline_addr)
>>> > -+              tst_brk(TCONF, "saved_command_line not found");
>>> > -+
>>> > -       spec_fd =3D SAFE_OPEN("/proc/cmdline", O_RDONLY);
>>> > -
>>> > -       memset(target_array, 1, sizeof(target_array));
>>> > ---
>>> > -2.7.4
>>> > -
>>> > diff --git
>>> a/meta/recipes-extended/ltp/ltp/0001-overcommit_memory-update-for-mm-fi=
x-false-positive-O.patch
>>> b/meta/recipes-extended/ltp/ltp/0001-overcommit_memory-update-for-mm-fi=
x-false-positive-O.patch
>>> > deleted file mode 100644
>>> > index bed84712a15..00000000000
>>> > ---
>>> a/meta/recipes-extended/ltp/ltp/0001-overcommit_memory-update-for-mm-fi=
x-false-positive-O.patch
>>> > +++ /dev/null
>>> > @@ -1,57 +0,0 @@
>>> > -From d656a447893dccc310c975a239f482278550c3e0 Mon Sep 17 00:00:00 20=
01
>>> > -From: Jan Stancek <jstancek@redhat.com>
>>> > -Date: Tue, 21 May 2019 10:10:44 +0200
>>> > -Subject: [PATCH] overcommit_memory: update for "mm: fix false-positi=
ve
>>> > - OVERCOMMIT_GUESS failures"
>>> > -
>>> > -commit 8c7829b04c52 ("mm: fix false-positive OVERCOMMIT_GUESS
>>> failures")
>>> > -changes logic of __vm_enough_memory(), simplifying it to:
>>> > -    When in GUESS mode, catch wild allocations by comparing their
>>> request
>>> > -    size to total amount of ram and swap in the system.
>>> > -
>>> > -Testcase currently allocates mem_total + swap_total, which doesn't
>>> trigger
>>> > -new condition. Make it more extreme, but assuming free_total / 2 wil=
l
>>> PASS,
>>> > -and 2*sum_total will FAIL.
>>> > -
>>> > -Signed-off-by: Jan Stancek <jstancek@redhat.com>
>>> > -Acked-by: Cyril Hrubis <chrubis@suse.cz>
>>> > -
>>> > -Upstream-Status: Backport [
>>> https://github.com/linux-test-project/ltp/commit/d656a447893dccc310c975=
a239f482278550c3e0
>>> ]
>>> > -Signed-off-by: He Zhe <zhe.he@windriver.com>
>>> > ----
>>> > - testcases/kernel/mem/tunable/overcommit_memory.c | 11 ++++-------
>>> > - 1 file changed, 4 insertions(+), 7 deletions(-)
>>> > -
>>> > -diff --git a/testcases/kernel/mem/tunable/overcommit_memory.c
>>> b/testcases/kernel/mem/tunable/overcommit_memory.c
>>> > -index 555298f..345764d 100644
>>> > ---- a/testcases/kernel/mem/tunable/overcommit_memory.c
>>> > -+++ b/testcases/kernel/mem/tunable/overcommit_memory.c
>>> > -@@ -36,11 +36,10 @@
>>> > -  *
>>> > -  * The program is designed to test the two tunables:
>>> > -  *
>>> > -- * When overcommit_memory =3D 0, allocatable memory can't overexten=
ds
>>> > -- * the amount of free memory. I choose the three cases:
>>> > -+ * When overcommit_memory =3D 0, allocatable memory can't overexten=
d
>>> > -+ * the amount of total memory:
>>> > -  * a. less than free_total:    free_total / 2, alloc should pass.
>>> > -- * b. greater than free_total: free_total * 2, alloc should fail.
>>> > -- * c. equal to sum_total:      sum_tatal,      alloc should fail
>>> > -+ * b. greater than sum_total:   sum_total * 2, alloc should fail.
>>> > -  *
>>> > -  * When overcommit_memory =3D 1, it can alloc enough much memory, I
>>> > -  * choose the three cases:
>>> > -@@ -164,9 +163,7 @@ static void overcommit_memory_test(void)
>>> > -
>>> > -       update_mem();
>>> > -       alloc_and_check(free_total / 2, EXPECT_PASS);
>>> > --      update_mem();
>>> > --      alloc_and_check(free_total * 2, EXPECT_FAIL);
>>> > --      alloc_and_check(sum_total, EXPECT_FAIL);
>>> > -+      alloc_and_check(sum_total * 2, EXPECT_FAIL);
>>> > -
>>> > -       /* start to test overcommit_memory=3D1 */
>>> > -       set_sys_tune("overcommit_memory", 1, 1);
>>> > ---
>>> > -2.7.4
>>> > -
>>> > diff --git
>>> a/meta/recipes-extended/ltp/ltp/0001-syscall-rt_sigtimedwait01-Fix-wron=
g-sigset-length-fo.patch
>>> b/meta/recipes-extended/ltp/ltp/0001-syscall-rt_sigtimedwait01-Fix-wron=
g-sigset-length-fo.patch
>>> > deleted file mode 100644
>>> > index 0e56c08255e..00000000000
>>> > ---
>>> a/meta/recipes-extended/ltp/ltp/0001-syscall-rt_sigtimedwait01-Fix-wron=
g-sigset-length-fo.patch
>>> > +++ /dev/null
>>> > @@ -1,46 +0,0 @@
>>> > -From a5046625eaeed2d3fba456c3ba84c6c141c2ad7c Mon Sep 17 00:00:00 20=
01
>>> > -From: He Zhe <zhe.he@windriver.com>
>>> > -Date: Thu, 29 Aug 2019 21:09:46 +0800
>>> > -Subject: [PATCH] syscall/rt_sigtimedwait01: Fix wrong sigset length
>>> for MIPS
>>> > -
>>> > -rt_sigtimedwait01 fails as follow on MIPS arches
>>> > -rt_sigtimedwait01    1  TFAIL  :  .../sigwaitinfo01.c:58:
>>> test_empty_set
>>> > -(.../sigwaitinfo01.c: 148): Unexpected failure:
>>> > -TEST_ERRNO=3DEINVAL(22): Invalid argument
>>> > -
>>> > -As this case purposely bypasses glibc, it should align with the size
>>> of kernel
>>> > -definition of sigset_t which is different from other arches.
>>> > -
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/arch/mips/include/uapi/asm/signal.h#n15
>>> > -
>>> > -This patch turns to use _NSIG which is always right for all arches.
>>> > -
>>> > -Upstream-Status: Backport [a5046625eaeed2d3fba456c3ba84c6c141c2ad7c]
>>> > -
>>> > -Suggested-by: Jan Stancek <jstancek@redhat.com>
>>> > -Acked-by: Jan Stancek <jstancek@redhat.com>
>>> > -Acked-by: Cyril Hrubis <chrubis@suse.cz>
>>> > -Signed-off-by: He Zhe <zhe.he@windriver.com>
>>> > -Signed-off-by: Petr Vorel <pvorel@suse.cz>
>>> > ----
>>> > - testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c | 5 ++---
>>> > - 1 file changed, 2 insertions(+), 3 deletions(-)
>>> > -
>>> > -diff --git a/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
>>> b/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
>>> > -index 5a32ce1..6a30c27 100644
>>> > ---- a/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
>>> > -+++ b/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
>>> > -@@ -128,9 +128,8 @@ static int my_sigtimedwait(const sigset_t * set,
>>> siginfo_t * info,
>>> > - static int my_rt_sigtimedwait(const sigset_t * set, siginfo_t * inf=
o,
>>> > -                             struct timespec *timeout)
>>> > - {
>>> > --
>>> > --      /* The last argument is (number_of_signals)/(bits_per_byte),
>>> which are 64 and 8, resp. */
>>> > --      return ltp_syscall(__NR_rt_sigtimedwait, set, info, timeout,
>>> 8);
>>> > -+      /* _NSIG is always the right number of bits of signal map for
>>> all arches */
>>> > -+      return ltp_syscall(__NR_rt_sigtimedwait, set, info, timeout,
>>> _NSIG/8);
>>> > - }
>>> > - #endif
>>> > -
>>> > ---
>>> > -2.7.4
>>> > -
>>> > diff --git
>>> a/meta/recipes-extended/ltp/ltp/0001-syscalls-tgkill03-wait-for-defunct=
-tid-to-get-detach.patch
>>> b/meta/recipes-extended/ltp/ltp/0001-syscalls-tgkill03-wait-for-defunct=
-tid-to-get-detach.patch
>>> > deleted file mode 100644
>>> > index 6ea26150fbf..00000000000
>>> > ---
>>> a/meta/recipes-extended/ltp/ltp/0001-syscalls-tgkill03-wait-for-defunct=
-tid-to-get-detach.patch
>>> > +++ /dev/null
>>> > @@ -1,75 +0,0 @@
>>> > -From e747d0456adc080a1d31fb653bda9dc491795c80 Mon Sep 17 00:00:00 20=
01
>>> > -From: Jan Stancek <jstancek@redhat.com>
>>> > -Date: Sun, 16 Jun 2019 11:14:16 +0200
>>> > -Subject: [PATCH] syscalls/tgkill03: wait for defunct tid to get
>>> detached
>>> > -
>>> > -Case where defunct tid is used has been observed to sporadically fai=
l:
>>> > -  tgkill03.c:96: FAIL: Defunct tid should have failed with ESRCH:
>>> SUCCESS
>>> > -
>>> > -glibc __pthread_timedjoin_ex() waits for CLONE_CHILD_CLEARTID to
>>> clear tid,
>>> > -and then resumes. Kernel clears it (glibc pd->tid) at:
>>> > -  do_exit
>>> > -    exit_mm
>>> > -      mm_release
>>> > -        put_user(0, tsk->clear_child_tid);
>>> > -
>>> > -but kernel tid is still valid, presumably until:
>>> > -  release_task
>>> > -    __exit_signal
>>> > -      __unhash_process
>>> > -        detach_pid
>>> > -
>>> > -To avoid race wait until /proc/<pid>/task/<tid> disappears.
>>> > -
>>> > -Signed-off-by: Jan Stancek <jstancek@redhat.com>
>>> > -Reviewed-by: Li Wang <liwang@redhat.com>
>>> > -Acked-by: Sumit Garg <sumit.garg@linaro.org>
>>> > -
>>> > -Upstream-Status: Backport
>>> > -[
>>> https://github.com/linux-test-project/ltp/commit/e747d0456adc080a1d31fb=
653bda9dc491795c80
>>> ]
>>> > -
>>> > -Signed-off-by: He Zhe <zhe.he@windriver.com>
>>> > ----
>>> > - testcases/kernel/syscalls/tgkill/tgkill03.c | 6 +++++-
>>> > - 1 file changed, 5 insertions(+), 1 deletion(-)
>>> > -
>>> > -diff --git a/testcases/kernel/syscalls/tgkill/tgkill03.c
>>> b/testcases/kernel/syscalls/tgkill/tgkill03.c
>>> > -index f5bbdc5..593a217 100644
>>> > ---- a/testcases/kernel/syscalls/tgkill/tgkill03.c
>>> > -+++ b/testcases/kernel/syscalls/tgkill/tgkill03.c
>>> > -@@ -7,6 +7,7 @@
>>> > -
>>> > - #include <pthread.h>
>>> > - #include <pwd.h>
>>> > -+#include <stdio.h>
>>> > - #include <sys/types.h>
>>> > -
>>> > - #include "tst_safe_pthread.h"
>>> > -@@ -42,6 +43,7 @@ static void setup(void)
>>> > - {
>>> > -       sigset_t sigusr1;
>>> > -       pthread_t defunct_thread;
>>> > -+      char defunct_tid_path[PATH_MAX];
>>> > -
>>> > -       sigemptyset(&sigusr1);
>>> > -       sigaddset(&sigusr1, SIGUSR1);
>>> > -@@ -55,8 +57,9 @@ static void setup(void)
>>> > -       TST_CHECKPOINT_WAIT(0);
>>> > -
>>> > -       SAFE_PTHREAD_CREATE(&defunct_thread, NULL,
>>> defunct_thread_func, NULL);
>>> > --
>>> > -       SAFE_PTHREAD_JOIN(defunct_thread, NULL);
>>> > -+      sprintf(defunct_tid_path, "/proc/%d/task/%d", getpid(),
>>> defunct_tid);
>>> > -+      TST_RETRY_FN_EXP_BACKOFF(access(defunct_tid_path, R_OK), -1,
>>> 15);
>>> > - }
>>> > -
>>> > - static void cleanup(void)
>>> > -@@ -108,4 +111,5 @@ static struct tst_test test =3D {
>>> > -       .setup =3D setup,
>>> > -       .cleanup =3D cleanup,
>>> > -       .test =3D run,
>>> > -+      .timeout =3D 20,
>>> > - };
>>> > ---
>>> > -2.7.4
>>> > -
>>> > diff --git
>>> a/meta/recipes-extended/ltp/ltp/0001-testcases-fix-an-absent-format-str=
ing-issue.patch
>>> b/meta/recipes-extended/ltp/ltp/0001-testcases-fix-an-absent-format-str=
ing-issue.patch
>>> > new file mode 100644
>>> > index 00000000000..93308445098
>>> > --- /dev/null
>>> > +++
>>> b/meta/recipes-extended/ltp/ltp/0001-testcases-fix-an-absent-format-str=
ing-issue.patch
>>> > @@ -0,0 +1,24 @@
>>> > +From 476ce907fa18042cdde0a244ba9a46cd895ce76c Mon Sep 17 00:00:00 20=
01
>>> > +From: Alexander Kanavin <alex.kanavin@gmail.com>
>>> > +Date: Thu, 12 Dec 2019 17:56:02 +0100
>>> > +Subject: [PATCH] testcases: fix an absent format string issue
>>> > +
>>> > +Upstream-Status: Pending
>>> > +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>>> > +---
>>> > + .../kernel/syscalls/pidfd_send_signal/pidfd_send_signal03.c     | 2
>>> +-
>>> > + 1 file changed, 1 insertion(+), 1 deletion(-)
>>> > +
>>> > +diff --git
>>> a/testcases/kernel/syscalls/pidfd_send_signal/pidfd_send_signal03.c
>>> b/testcases/kernel/syscalls/pidfd_send_signal/pidfd_send_signal03.c
>>> > +index 27dbc6626..19d943d06 100644
>>> > +---
>>> a/testcases/kernel/syscalls/pidfd_send_signal/pidfd_send_signal03.c
>>> > ++++
>>> b/testcases/kernel/syscalls/pidfd_send_signal/pidfd_send_signal03.c
>>> > +@@ -59,7 +59,7 @@ static void verify_pidfd_send_signal(void)
>>> > +
>>> > +               /* Manipulate PID for next process */
>>> > +               sprintf(pid_str, "%d", pid - 1);
>>> > +-              SAFE_FILE_PRINTF(last_pid_file, pid_str);
>>> > ++              SAFE_FILE_PRINTF(last_pid_file, "%s", pid_str);
>>> > +
>>> > +               new_pid =3D SAFE_FORK();
>>> > +               if (new_pid =3D=3D 0) {
>>> > diff --git
>>> a/meta/recipes-extended/ltp/ltp/0001-testcases-use-python3-everywhere-t=
o-run-python-scrip.patch
>>> b/meta/recipes-extended/ltp/ltp/0001-testcases-use-python3-everywhere-t=
o-run-python-scrip.patch
>>> > deleted file mode 100644
>>> > index f4f87f38ab7..00000000000
>>> > ---
>>> a/meta/recipes-extended/ltp/ltp/0001-testcases-use-python3-everywhere-t=
o-run-python-scrip.patch
>>> > +++ /dev/null
>>> > @@ -1,161 +0,0 @@
>>> > -From 0463d793566772a606255957915f99d166d5740c Mon Sep 17 00:00:00 20=
01
>>> > -From: Alexander Kanavin <alex.kanavin@gmail.com>
>>> > -Date: Wed, 28 Aug 2019 18:30:23 +0200
>>> > -Subject: [PATCH] testcases: use python3 everywhere to run python
>>> scripts
>>> > -
>>> > -The scripts themselves have #!/usr/bin/python3 in them,
>>> > -so I trust they are already py3-compatible.
>>> > -
>>> > -Upstream-Status: Pending
>>> > -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>>> > ----
>>> > - testcases/kernel/power_management/runpwtests05.sh  |  2 +-
>>> > - .../power_management/runpwtests_exclusive01.sh     |  2 +-
>>> > - .../power_management/runpwtests_exclusive02.sh     |  2 +-
>>> > - .../power_management/runpwtests_exclusive03.sh     |  2 +-
>>> > - .../power_management/runpwtests_exclusive04.sh     |  2 +-
>>> > - .../power_management/runpwtests_exclusive05.sh     |  2 +-
>>> > - testcases/network/nfsv4/acl/runtest                | 14
>>> +++++++-------
>>> > - testcases/realtime/func/pi-tests/run_auto.sh       |  6 +++---
>>> > - 8 files changed, 16 insertions(+), 16 deletions(-)
>>> > -
>>> > -diff --git a/testcases/kernel/power_management/runpwtests05.sh
>>> b/testcases/kernel/power_management/runpwtests05.sh
>>> > -index 8a7d0f6e0..43e234d01 100755
>>> > ---- a/testcases/kernel/power_management/runpwtests05.sh
>>> > -+++ b/testcases/kernel/power_management/runpwtests05.sh
>>> > -@@ -35,7 +35,7 @@ else
>>> > -       max_sched_smt=3D1
>>> > - fi
>>> > -
>>> > --tst_test_cmds python
>>> > -+tst_test_cmds python3
>>> > -
>>> > - if ! grep sched_debug -qw /proc/cmdline ; then
>>> > -       tst_brkm TCONF "Kernel cmdline parameter 'sched_debug'
>>> needed," \
>>> > -diff --git
>>> a/testcases/kernel/power_management/runpwtests_exclusive01.sh
>>> b/testcases/kernel/power_management/runpwtests_exclusive01.sh
>>> > -index ec78319e2..9fefcbf6e 100755
>>> > ---- a/testcases/kernel/power_management/runpwtests_exclusive01.sh
>>> > -+++ b/testcases/kernel/power_management/runpwtests_exclusive01.sh
>>> > -@@ -35,7 +35,7 @@ else
>>> > -       max_sched_smt=3D1
>>> > - fi
>>> > -
>>> > --tst_test_cmds python
>>> > -+tst_test_cmds python3
>>> > -
>>> > - hyper_threaded=3D$(is_hyper_threaded)
>>> > - multi_socket=3D$(is_multi_socket)
>>> > -diff --git
>>> a/testcases/kernel/power_management/runpwtests_exclusive02.sh
>>> b/testcases/kernel/power_management/runpwtests_exclusive02.sh
>>> > -index e107fce35..2cd0ecb05 100755
>>> > ---- a/testcases/kernel/power_management/runpwtests_exclusive02.sh
>>> > -+++ b/testcases/kernel/power_management/runpwtests_exclusive02.sh
>>> > -@@ -33,7 +33,7 @@ else
>>> > -       max_sched_smt=3D1
>>> > - fi
>>> > -
>>> > --tst_test_cmds python
>>> > -+tst_test_cmds python3
>>> > -
>>> > - hyper_threaded=3D$(is_hyper_threaded)
>>> > - multi_socket=3D$(is_multi_socket)
>>> > -diff --git
>>> a/testcases/kernel/power_management/runpwtests_exclusive03.sh
>>> b/testcases/kernel/power_management/runpwtests_exclusive03.sh
>>> > -index 490344bb3..ab3a5d11d 100755
>>> > ---- a/testcases/kernel/power_management/runpwtests_exclusive03.sh
>>> > -+++ b/testcases/kernel/power_management/runpwtests_exclusive03.sh
>>> > -@@ -35,7 +35,7 @@ else
>>> > -       max_sched_smt=3D1
>>> > - fi
>>> > -
>>> > --tst_test_cmds python
>>> > -+tst_test_cmds python3
>>> > -
>>> > - hyper_threaded=3D$(is_hyper_threaded)
>>> > - multi_socket=3D$(is_multi_socket)
>>> > -diff --git
>>> a/testcases/kernel/power_management/runpwtests_exclusive04.sh
>>> b/testcases/kernel/power_management/runpwtests_exclusive04.sh
>>> > -index 978ca02ae..438ef603f 100755
>>> > ---- a/testcases/kernel/power_management/runpwtests_exclusive04.sh
>>> > -+++ b/testcases/kernel/power_management/runpwtests_exclusive04.sh
>>> > -@@ -27,7 +27,7 @@ export TST_TOTAL=3D2
>>> > - # Checking test environment
>>> > - check_kervel_arch
>>> > -
>>> > --tst_test_cmds python
>>> > -+tst_test_cmds python3
>>> > -
>>> > - hyper_threaded=3D$(is_hyper_threaded)
>>> > - multi_socket=3D$(is_multi_socket)
>>> > -diff --git
>>> a/testcases/kernel/power_management/runpwtests_exclusive05.sh
>>> b/testcases/kernel/power_management/runpwtests_exclusive05.sh
>>> > -index a0dad5834..3a9afdbf2 100755
>>> > ---- a/testcases/kernel/power_management/runpwtests_exclusive05.sh
>>> > -+++ b/testcases/kernel/power_management/runpwtests_exclusive05.sh
>>> > -@@ -35,7 +35,7 @@ else
>>> > -       max_sched_smt=3D1
>>> > - fi
>>> > -
>>> > --tst_test_cmds python
>>> > -+tst_test_cmds python3
>>> > -
>>> > - hyper_threaded=3D$(is_hyper_threaded)
>>> > - multi_socket=3D$(is_multi_socket)
>>> > -diff --git a/testcases/network/nfsv4/acl/runtest
>>> b/testcases/network/nfsv4/acl/runtest
>>> > -index d2e1b4c49..a859e85bc 100755
>>> > ---- a/testcases/network/nfsv4/acl/runtest
>>> > -+++ b/testcases/network/nfsv4/acl/runtest
>>> > -@@ -22,7 +22,7 @@ do
>>> > - done
>>> > -
>>> > - #  creation of users on the remote machine (removed only at the end
>>> of the tests)
>>> > --rsh -n $REMOTEHOST python $PWD/create_users.py -u 50 -g 50
>>> > -+rsh -n $REMOTEHOST python3 $PWD/create_users.py -u 50 -g 50
>>> > -
>>> > - echo "Starting ACL testing"
>>> > -
>>> > -@@ -51,19 +51,19 @@ echo "Basic tests finished"
>>> > -
>>> > - echo "LONG ACL TEST"
>>> > - echo "creating necessary users and groups"
>>> > --python create_users.py -u 50 -g 50
>>> > -+python3 create_users.py -u 50 -g 50
>>> > - echo "creating necessary users and groups on the remote host"
>>> > - mkdir $NFSMNTDIR/lacl-testdir
>>> > --python test_long_acl.py -l $MAXLENGTH -p $NFSMNTDIR/lacl-testdir
>>> > -+python3 test_long_acl.py -l $MAXLENGTH -p $NFSMNTDIR/lacl-testdir
>>> > - rm -rf $NFSMNTDIR/lacl-testdir
>>> > - echo "Long ACL test OK with $MAXLENGTH entries"
>>> > - echo "ACL STRESSING TEST"
>>> > --python setacl_stress.py -n 100 -u $USER_NB -g $GRP_NB -f $FILE_NB -=
p
>>> $NFSMNTDIR
>>> > -+python3 setacl_stress.py -n 100 -u $USER_NB -g $GRP_NB -f $FILE_NB
>>> -p $NFSMNTDIR
>>> > -
>>> > - # remove local an remote users
>>> > --python cleanusers.py
>>> > --python cleangroups.py
>>> > --rsh -n $REMOTEHOST python $PWD/cleanusers.py
>>> > -+python3 cleanusers.py
>>> > -+python3 cleangroups.py
>>> > -+rsh -n $REMOTEHOST python3 $PWD/cleanusers.py
>>> > -
>>> > - echo "Test OK"
>>> > -
>>> > -diff --git a/testcases/realtime/func/pi-tests/run_auto.sh
>>> b/testcases/realtime/func/pi-tests/run_auto.sh
>>> > -index d13026049..277988568 100755
>>> > ---- a/testcases/realtime/func/pi-tests/run_auto.sh
>>> > -+++ b/testcases/realtime/func/pi-tests/run_auto.sh
>>> > -@@ -15,15 +15,15 @@ $SCRIPTS_DIR/run_c_files.sh $profile testpi-0
>>> > -
>>> > - export LOG_FILE=3D"$LOG_DIR/$LOG_FORMAT-testpi-1.log"
>>> > - $SCRIPTS_DIR/run_c_files.sh $profile testpi-1
>>> > --PYTHONPATH=3D../../  python parse-testpi1.py $LOG_FILE 2>&1 | tee -=
a
>>> $LOG_FILE
>>> > -+PYTHONPATH=3D../../  python3 parse-testpi1.py $LOG_FILE 2>&1 | tee =
-a
>>> $LOG_FILE
>>> > -
>>> > - export LOG_FILE=3D"$LOG_DIR/$LOG_FORMAT-testpi-2.log"
>>> > - $SCRIPTS_DIR/run_c_files.sh $profile testpi-2
>>> > --PYTHONPATH=3D../../  python parse-testpi2.py $LOG_FILE 2>&1 | tee -=
a
>>> $LOG_FILE
>>> > -+PYTHONPATH=3D../../  python3 parse-testpi2.py $LOG_FILE 2>&1 | tee =
-a
>>> $LOG_FILE
>>> > -
>>> > - export LOG_FILE=3D"$LOG_DIR/$LOG_FORMAT-testpi-4.log"
>>> > - $SCRIPTS_DIR/run_c_files.sh $profile testpi-4
>>> > --PYTHONPATH=3D../../  python parse-testpi1.py $LOG_FILE 2>&1 | tee -=
a
>>> $LOG_FILE
>>> > -+PYTHONPATH=3D../../  python3 parse-testpi1.py $LOG_FILE 2>&1 | tee =
-a
>>> $LOG_FILE
>>> > -
>>> > -
>>> > - export LOG_FILE=3D""
>>> > diff --git
>>> a/meta/recipes-extended/ltp/ltp/0001-ustat02-Fix-EFAULT-in-32bit-compat=
ibility-mode.patch
>>> b/meta/recipes-extended/ltp/ltp/0001-ustat02-Fix-EFAULT-in-32bit-compat=
ibility-mode.patch
>>> > deleted file mode 100644
>>> > index c936b788fe1..00000000000
>>> > ---
>>> a/meta/recipes-extended/ltp/ltp/0001-ustat02-Fix-EFAULT-in-32bit-compat=
ibility-mode.patch
>>> > +++ /dev/null
>>> > @@ -1,36 +0,0 @@
>>> > -From 156776a3e29491b363fdc9811912e1298655d060 Mon Sep 17 00:00:00 20=
01
>>> > -From: Steven Price <steven.price@arm.com>
>>> > -Date: Fri, 19 Jul 2019 13:48:17 +0100
>>> > -Subject: [PATCH] ustat02: Fix EFAULT in 32bit compatibility mode
>>> > -
>>> > -The size of dev_t is larger than 32 bits which causes the dev argume=
nt
>>> > -to be passed incorrectly. On Arm this means that the EFAULT test cas=
e
>>> > -actually returns EINVAL because the device number isn't recognised.
>>> > -
>>> > -Signed-off-by: Steven Price <steven.price@arm.com>
>>> > -Acked-by: Li Wang <liwang@redhat.com>
>>> > -
>>> > -Upstream-Status: Backport
>>> > -[
>>> https://github.com/linux-test-project/ltp/commit/156776a3e29491b363fdc9=
811912e1298655d060
>>> ]
>>> > -
>>> > -Signed-off-by: He Zhe <zhe.he@windriver.com>
>>> > ----
>>> > - testcases/kernel/syscalls/ustat/ustat02.c | 2 +-
>>> > - 1 file changed, 1 insertion(+), 1 deletion(-)
>>> > -
>>> > -diff --git a/testcases/kernel/syscalls/ustat/ustat02.c
>>> b/testcases/kernel/syscalls/ustat/ustat02.c
>>> > -index 9bbe4f3..1a0e9e0 100644
>>> > ---- a/testcases/kernel/syscalls/ustat/ustat02.c
>>> > -+++ b/testcases/kernel/syscalls/ustat/ustat02.c
>>> > -@@ -36,7 +36,7 @@ int TST_TOTAL =3D ARRAY_SIZE(tc);
>>> > -
>>> > - void run(unsigned int test)
>>> > - {
>>> > --      TEST(tst_syscall(__NR_ustat, *tc[test].dev, tc[test].buf));
>>> > -+      TEST(tst_syscall(__NR_ustat, (unsigned int)*tc[test].dev,
>>> tc[test].buf));
>>> > -
>>> > -       if ((TST_RET =3D=3D -1) && (TST_ERR =3D=3D tc[test].exp_errno=
))
>>> > -               tst_res(TPASS | TTERRNO, "ustat(2) expected failure")=
;
>>> > ---
>>> > -2.7.4
>>> > -
>>> > diff --git
>>> a/meta/recipes-extended/ltp/ltp/0002-check-for-RES_USE_INET6-during-con=
figure.patch
>>> b/meta/recipes-extended/ltp/ltp/0002-check-for-RES_USE_INET6-during-con=
figure.patch
>>> > deleted file mode 100644
>>> > index 12e47eb2b61..00000000000
>>> > ---
>>> a/meta/recipes-extended/ltp/ltp/0002-check-for-RES_USE_INET6-during-con=
figure.patch
>>> > +++ /dev/null
>>> > @@ -1,68 +0,0 @@
>>> > -From 7bc134545b7beb09717a60541530c20a1a5740d3 Mon Sep 17 00:00:00 20=
01
>>> > -From: Khem Raj <raj.khem@gmail.com>
>>> > -Date: Fri, 26 Jul 2019 10:55:28 -0700
>>> > -Subject: [PATCH 2/2] check for RES_USE_INET6 during configure
>>> > -
>>> > -glibc 2.30 has remove RES_USE_INET6 define which has been on its way
>>> out
>>> > -since 2.26 release, this check ensures that we detect it before usin=
g
>>> it
>>> > -
>>> > -Upstream-Status: Submitted [
>>> http://lists.linux.it/pipermail/ltp/2019-July/012955.html]
>>> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> > ----
>>> > - configure.ac                                        | 13
>>> +++++++++++++
>>> > - testcases/network/multicast/mc_gethost/mc_gethost.c |  6 ++++++
>>> > - 2 files changed, 19 insertions(+)
>>> > -
>>> > -diff --git a/configure.ac b/configure.ac
>>> > -index 2255b5c181..ed7acccb01 100644
>>> > ---- a/configure.ac
>>> > -+++ b/configure.ac
>>> > -@@ -91,6 +91,19 @@ AC_CHECK_FUNCS([ \
>>> > -     vmsplice \
>>> > - ])
>>> > -
>>> > -+#check defines
>>> > -+AC_MSG_CHECKING([for RES_USE_INET6])
>>> > -+AC_COMPILE_IFELSE( [AC_LANG_PROGRAM([[#include <resolv.h>]],
>>> > -+  [[char dummy[RES_USE_INET6];]])],
>>> > -+  [
>>> > -+    AC_MSG_RESULT([yes])
>>> > -+    AC_DEFINE_UNQUOTED([HAVE_RES_USE_INET6], 1, [Define to 1 if you
>>> have the RES_USE_INET6 macro.])
>>> > -+  ],
>>> > -+  [
>>> > -+    AC_MSG_RESULT([no])
>>> > -+    AC_DEFINE_UNQUOTED([HAVE_RES_USE_INET6], 0, [Define to 1 if you
>>> have the RES_USE_INET6 macro.])
>>> > -+  ]
>>> > -+)
>>> > - # Tools knobs
>>> > -
>>> > - # Expect
>>> > -diff --git a/testcases/network/multicast/mc_gethost/mc_gethost.c
>>> b/testcases/network/multicast/mc_gethost/mc_gethost.c
>>> > -index 9cc15d086b..d1cae5441a 100644
>>> > ---- a/testcases/network/multicast/mc_gethost/mc_gethost.c
>>> > -+++ b/testcases/network/multicast/mc_gethost/mc_gethost.c
>>> > -@@ -17,6 +17,8 @@
>>> > - #include <string.h>
>>> > - #include <stdlib.h>
>>> > -
>>> > -+#include "config.h"
>>> > -+
>>> > - #ifndef LOG_PERROR
>>> > - #define LOG_PERROR 0
>>> > - #endif
>>> > -@@ -50,8 +52,12 @@ usage:
>>> > -               argv++, argc--;
>>> > -       }
>>> > -       if (argc >=3D 1 && !strcmp(*argv, "-6")) {
>>> > -+#if HAVE_RES_USE_INET6
>>> > -               af =3D AF_INET6, size =3D IN6ADDRSZ;
>>> > -               _res.options |=3D RES_USE_INET6;
>>> > -+#else
>>> > -+              af =3D AF_INET, size =3D INADDRSZ;
>>> > -+#endif
>>> > -               argv++, argc--;
>>> > -       }
>>> > -       if (argc >=3D 1 && !strcmp(*argv, "-f")) {
>>> > ---
>>> > -2.22.0
>>> > -
>>> > diff --git
>>> a/meta/recipes-extended/ltp/ltp/0003-Check-if-__GLIBC_PREREQ-is-defined=
-before-using-it.patch
>>> b/meta/recipes-extended/ltp/ltp/0003-Check-if-__GLIBC_PREREQ-is-defined=
-before-using-it.patch
>>> > index c0f69ecf5fc..df3e8831f54 100644
>>> > ---
>>> a/meta/recipes-extended/ltp/ltp/0003-Check-if-__GLIBC_PREREQ-is-defined=
-before-using-it.patch
>>> > +++
>>> b/meta/recipes-extended/ltp/ltp/0003-Check-if-__GLIBC_PREREQ-is-defined=
-before-using-it.patch
>>> > @@ -1,4 +1,4 @@
>>> > -From 29ce9fdab3bd34e69d73b5b890795559c06553f7 Mon Sep 17 00:00:00 20=
01
>>> > +From 1ce47a6ed811fd78ed04ea2f82e6321c6bca57b6 Mon Sep 17 00:00:00 20=
01
>>> >  From: Khem Raj <raj.khem@gmail.com>
>>> >  Date: Thu, 7 Jan 2016 19:40:08 +0000
>>> >  Subject: [PATCH] Check if __GLIBC_PREREQ is defined before using it
>>> > @@ -10,16 +10,17 @@ Upstream-Status: Pending
>>> >
>>> >  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> >  Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>>> > +
>>> >  ---
>>> >   testcases/kernel/syscalls/accept4/accept4_01.c | 7 +++++++
>>> >   1 file changed, 7 insertions(+)
>>> >
>>> >  diff --git a/testcases/kernel/syscalls/accept4/accept4_01.c
>>> b/testcases/kernel/syscalls/accept4/accept4_01.c
>>> > -index dd289cf..76aa969 100644
>>> > +index 29e18f27d..07444a46f 100644
>>> >  --- a/testcases/kernel/syscalls/accept4/accept4_01.c
>>> >  +++ b/testcases/kernel/syscalls/accept4/accept4_01.c
>>> >  @@ -38,6 +38,7 @@
>>> > - static struct sockaddr_in conn_addr;
>>> > + static struct sockaddr_in *conn_addr, *accept_addr;
>>> >   static int listening_fd;
>>> >
>>> >  +#if defined(__GLIBC__) && defined(__GLIBC_PREREQ)
>>> > @@ -34,25 +35,21 @@ index dd289cf..76aa969 100644
>>> >
>>> >   static int create_listening_socket(void)
>>> >   {
>>> > -@@ -115,6 +117,7 @@ static void verify_accept4(unsigned int nr)
>>> > -       SAFE_CONNECT(connfd, (struct sockaddr *)&conn_addr,
>>> sizeof(conn_addr));
>>> > -       addrlen =3D sizeof(claddr);
>>> > +@@ -114,12 +116,17 @@ static void verify_accept4(unsigned int nr)
>>> > +       SAFE_CONNECT(connfd, (struct sockaddr *)conn_addr,
>>> sizeof(*conn_addr));
>>> > +       addrlen =3D sizeof(*accept_addr);
>>> >
>>> >  +#if defined(__GLIBC__) && defined(__GLIBC_PREREQ)
>>> >   #if !(__GLIBC_PREREQ(2, 10))
>>> > -       TEST(accept4_01(listening_fd, (struct sockaddr *)&claddr,
>>> &addrlen,
>>> > +       TEST(accept4_01(listening_fd, (struct sockaddr *)accept_addr,
>>> &addrlen,
>>> >                                 tcase->cloexec | tcase->nonblock));
>>> > -@@ -122,6 +125,10 @@ static void verify_accept4(unsigned int nr)
>>> > -       TEST(accept4(listening_fd, (struct sockaddr *)&claddr,
>>> &addrlen,
>>> > + #else
>>> > +       TEST(accept4(listening_fd, (struct sockaddr *)accept_addr,
>>> &addrlen,
>>> >                                 tcase->cloexec | tcase->nonblock));
>>> > - #endif
>>> > ++#endif
>>> >  +#else
>>> >  +      TEST(accept4(listening_fd, (struct sockaddr *)&claddr,
>>> &addrlen,
>>> >  +                              tcase->cloexec | tcase->nonblock));
>>> > -+#endif
>>> > + #endif
>>> >         if (TST_RET =3D=3D -1) {
>>> >                 if (TST_ERR =3D=3D ENOSYS)
>>> > -                       tst_brk(TCONF, "syscall __NR_accept4 not
>>> supported");
>>> > ---
>>> > -2.7.4
>>> > -
>>> > diff --git
>>> a/meta/recipes-extended/ltp/ltp/0010-shmctl01-don-t-use-hardcoded-index=
-0-for-SHM_STAT-te.patch
>>> b/meta/recipes-extended/ltp/ltp/0010-shmctl01-don-t-use-hardcoded-index=
-0-for-SHM_STAT-te.patch
>>> > deleted file mode 100644
>>> > index 8704e5ffe8a..00000000000
>>> > ---
>>> a/meta/recipes-extended/ltp/ltp/0010-shmctl01-don-t-use-hardcoded-index=
-0-for-SHM_STAT-te.patch
>>> > +++ /dev/null
>>> > @@ -1,82 +0,0 @@
>>> > -From 794933b38354a2612cf2c471f11798b306f35315 Mon Sep 17 00:00:00 20=
01
>>> > -From: Jan Stancek <jstancek@redhat.com>
>>> > -Date: Mon, 20 May 2019 20:47:20 +0200
>>> > -Subject: [PATCH] shmctl01: don't use hardcoded index =3D=3D 0 for
>>> SHM_STAT test
>>> > -
>>> > -Test fails on SHM_STAT testcase:
>>> > -   shmctl01    5  TFAIL  :  shmctl01.c:173: shmctl01 call failed
>>> > -                            errno =3D 22 : Invalid argument
>>> > -   shmctl(0, SHM_STAT, 0x601060)           =3D -EINVAL
>>> > -
>>> > -since following commit:
>>> > -   commit 99db46ea292780cd978d56932d9445b1e8bdafe8
>>> > -   Author: Manfred Spraul <manfred@colorfullife.com>
>>> > -   Date:   Tue May 14 15:46:36 2019 -0700
>>> > -     ipc: do cyclic id allocation for the ipc object.
>>> > -
>>> > -Don't rely on index 0 being always available, but instead
>>> > -use (maximum) index returned by SHM_INFO.
>>> > -
>>> > -Signed-off-by: Jan Stancek <jstancek@redhat.com>
>>> > -Reviewed-by: Petr Vorel <pvorel@suse.cz>
>>> > -Acked-by: Cyril Hrubis <chrubis@suse.cz>
>>> > -
>>> > -Upstream-Status: Backport
>>> > -[
>>> https://github.com/linux-test-project/ltp/commit/db0a43d9388be2c347a830=
6751bbe6bec086d062
>>> ]
>>> > -
>>> > -Signed-off-by: Hongzhi Song <hongzhi.song@windriver.com>
>>> > -Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>>> > ----
>>> > - testcases/kernel/syscalls/ipc/shmctl/shmctl01.c | 21
>>> ++++++++++++++++++---
>>> > - 1 file changed, 18 insertions(+), 3 deletions(-)
>>> > -
>>> > -diff --git a/testcases/kernel/syscalls/ipc/shmctl/shmctl01.c
>>> b/testcases/kernel/syscalls/ipc/shmctl/shmctl01.c
>>> > -index 1b46977..52bf23a 100644
>>> > ---- a/testcases/kernel/syscalls/ipc/shmctl/shmctl01.c
>>> > -+++ b/testcases/kernel/syscalls/ipc/shmctl/shmctl01.c
>>> > -@@ -79,6 +79,7 @@ static void func_info(int ret);
>>> > -
>>> > - /* Check routine for SHM_STAT */
>>> > - static void func_sstat(int ret);
>>> > -+static void func_sstat_setup(void);
>>> > -
>>> > - /* Check routine for SHM_LOCK */
>>> > - static void func_lock(int ret);
>>> > -@@ -110,7 +111,7 @@ static struct test_case_t {
>>> > - #endif
>>> > -       {&shm_id_1, IPC_SET, &buf, func_set, set_setup},
>>> > -       {&shm_id_1, IPC_INFO, (struct shmid_ds *) &info, func_info,
>>> NULL},
>>> > --      {&shm_index, SHM_STAT, &buf, func_sstat, NULL},
>>> > -+      {&shm_index, SHM_STAT, &buf, func_sstat, func_sstat_setup},
>>> > -       {&shm_id_1, SHM_LOCK, NULL, func_lock, NULL},
>>> > -       {&shm_id_1, SHM_UNLOCK, NULL, func_unlock, NULL},
>>> > -       {&shm_id_1, IPC_RMID, NULL, func_rmid, NULL},
>>> > -@@ -407,9 +408,23 @@ static void func_info(int ret)
>>> > - static void func_sstat(int ret)
>>> > - {
>>> > -       if (ret >=3D 0)
>>> > --              tst_resm(TPASS, "get correct shared memory id");
>>> > -+              tst_resm(TPASS, "get correct shared memory id for
>>> index: %d",
>>> > -+                      shm_index);
>>> > -       else
>>> > --              tst_resm(TFAIL, "shared memory id is incorrect");
>>> > -+              tst_resm(TFAIL, "shared memory id is incorrect, index=
:
>>> %d",
>>> > -+                      shm_index);
>>> > -+}
>>> > -+
>>> > -+static void func_sstat_setup(void)
>>> > -+{
>>> > -+      struct shm_info tmp;
>>> > -+      int ret;
>>> > -+
>>> > -+      ret =3D shmctl(shm_id_1, SHM_INFO, (void *)&tmp);
>>> > -+      if (ret < 0)
>>> > -+              tst_resm(TFAIL|TERRNO, "shmctl(SHM_INFO)");
>>> > -+      else
>>> > -+              shm_index =3D ret;
>>> > - }
>>> > -
>>> > - static void func_lock(int ret)
>>> > ---
>>> > -2.7.4
>>> > -
>>> > diff --git
>>> a/meta/recipes-extended/ltp/ltp/0011-direct_io-diotest4-drop-MAP_FIXED.=
patch
>>> b/meta/recipes-extended/ltp/ltp/0011-direct_io-diotest4-drop-MAP_FIXED.=
patch
>>> > deleted file mode 100644
>>> > index 9cd188f6567..00000000000
>>> > ---
>>> a/meta/recipes-extended/ltp/ltp/0011-direct_io-diotest4-drop-MAP_FIXED.=
patch
>>> > +++ /dev/null
>>> > @@ -1,56 +0,0 @@
>>> > -From f210d7e19b721041f31b7f258a169f89dc850303 Mon Sep 17 00:00:00 20=
01
>>> > -From: Jan Stancek <jstancek@redhat.com>
>>> > -Date: Thu, 4 Jul 2019 16:45:23 +0200
>>> > -Subject: [PATCH] direct_io/diotest4: drop MAP_FIXED
>>> > -
>>> > -Hongzhi reports that this test is failing on mips64 with 5.1+:
>>> > -  diotest4 10 TBROK : diotest4.c:368: can't mmap file: Invalid
>>> argument
>>> > -  diotest4 11 TBROK : diotest4.c:368: Remaining cases broken
>>> > -I could reproduce it on emulated 5kc-malta, running 5.2.0-rc7.
>>> > -
>>> > -Test is trying to map into area immediately following heap as
>>> MAP_SHARED,
>>> > -but it used wrong alignment (fixed by 'lapi/mmap.h: include
>>> config.h').
>>> > -
>>> > -Usage of MAP_FIXED seems unnecessary, so drop that too and let the
>>> kernel
>>> > -pick an address.
>>> > -
>>> > -Reported-by: Hongzhi.Song <hongzhi.song@windriver.com>
>>> > -Signed-off-by: Jan Stancek <jstancek@redhat.com>
>>> > -Acked-by: Cyril Hrubis <chrubis@suse.cz>
>>> > -
>>> > -Upstream-Status: Backport
>>> > -[
>>> https://github.com/linux-test-project/ltp/commit/f5444eeeabf252b8884b94=
65d277b6af853819e3
>>> ]
>>> > -
>>> > -Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>>> > ----
>>> > - testcases/kernel/io/direct_io/diotest4.c | 8 ++------
>>> > - 1 file changed, 2 insertions(+), 6 deletions(-)
>>> > -
>>> > -diff --git a/testcases/kernel/io/direct_io/diotest4.c
>>> b/testcases/kernel/io/direct_io/diotest4.c
>>> > -index e4616e4..bf200cd 100644
>>> > ---- a/testcases/kernel/io/direct_io/diotest4.c
>>> > -+++ b/testcases/kernel/io/direct_io/diotest4.c
>>> > -@@ -352,18 +352,14 @@ int main(int argc, char *argv[])
>>> > -       total++;
>>> > -
>>> > -       /* Test-10: read, write to a mmaped file */
>>> > --      shm_base =3D (char *)(((long)sbrk(0) + (shmsz - 1)) & ~(shmsz=
 -
>>> 1));
>>> > --      if (shm_base =3D=3D NULL) {
>>> > --              tst_brkm(TBROK, cleanup, "sbrk failed: %s",
>>> strerror(errno));
>>> > --      }
>>> > -       offset =3D 4096;
>>> > -       count =3D bufsize;
>>> > -       if ((fd =3D open(filename, O_DIRECT | O_RDWR)) < 0) {
>>> > -               tst_brkm(TBROK, cleanup, "can't open %s: %s",
>>> > -                        filename, strerror(errno));
>>> > -       }
>>> > --      shm_base =3D mmap(shm_base, 0x100000, PROT_READ | PROT_WRITE,
>>> > --                      MAP_SHARED | MAP_FIXED, fd, 0);
>>> > -+      shm_base =3D mmap(0, 0x100000, PROT_READ | PROT_WRITE,
>>> > -+                      MAP_SHARED, fd, 0);
>>> > -       if (shm_base =3D=3D (caddr_t) - 1) {
>>> > -               tst_brkm(TBROK, cleanup, "can't mmap file: %s",
>>> > -                        strerror(errno));
>>> > ---
>>> > -2.7.4
>>> > -
>>> > diff --git
>>> a/meta/recipes-extended/ltp/ltp/0012-getrlimit03-adjust-a-bit-of-code-t=
o-compatiable-with.patch
>>> b/meta/recipes-extended/ltp/ltp/0012-getrlimit03-adjust-a-bit-of-code-t=
o-compatiable-with.patch
>>> > deleted file mode 100644
>>> > index aecbc80e9b5..00000000000
>>> > ---
>>> a/meta/recipes-extended/ltp/ltp/0012-getrlimit03-adjust-a-bit-of-code-t=
o-compatiable-with.patch
>>> > +++ /dev/null
>>> > @@ -1,64 +0,0 @@
>>> > -From 4ac747c1f7ff8e2ec2567d6672822e95a9b56e55 Mon Sep 17 00:00:00 20=
01
>>> > -From: "Hongzhi.Song" <hongzhi.song@windriver.com>
>>> > -Date: Mon, 15 Jul 2019 03:39:06 -0400
>>> > -Subject: [PATCH] getrlimit03: adjust a bit of code to compatiable
>>> with mips32
>>> > -
>>> > -Error info:
>>> > -getrlimit03.c:104: FAIL: __NR_prlimit64(0) had rlim_cur =3D
>>> > -ffffffffffffffff but __NR_getrlimit(0) had rlim_cur =3D 7fffffff
>>> > -
>>> > -According to kernel code: [arch/mips/include/uapi/asm/resource.h]
>>> > -RLIM_INFINITY is set to 0x7fffffffUL instead of ULONG_MAX on mips32.
>>> > -
>>> > - /*
>>> > - * SuS says limits have to be unsigned.
>>> > - * Which makes a ton more sense anyway,
>>> > - * but we keep the old value on MIPS32,
>>> > - * for compatibility:
>>> > - */
>>> > - #ifndef __mips64
>>> > - # define RLIM_INFINITY      0x7fffffffUL
>>> > - #endif
>>> > -
>>> > -Adding conditional statement about mips to fix this.
>>> > -
>>> > -Signed-off-by: Jan Stancek <jstancek@redhat.com>
>>> > -Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
>>> > -
>>> > -Upstream-Status: Backport
>>> > -[
>>> https://github.com/linux-test-project/ltp/commit/7a3bca63cd7f059d490b62=
74f0fdf3247be93fde
>>> ]
>>> > -
>>> > -Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
>>> > ----
>>> > - testcases/kernel/syscalls/getrlimit/getrlimit03.c | 8 +++++++-
>>> > - 1 file changed, 7 insertions(+), 1 deletion(-)
>>> > -
>>> > -diff --git a/testcases/kernel/syscalls/getrlimit/getrlimit03.c
>>> b/testcases/kernel/syscalls/getrlimit/getrlimit03.c
>>> > -index e4d56c4..319bc49 100644
>>> > ---- a/testcases/kernel/syscalls/getrlimit/getrlimit03.c
>>> > -+++ b/testcases/kernel/syscalls/getrlimit/getrlimit03.c
>>> > -@@ -26,6 +26,7 @@
>>> > -
>>> > - #include "tst_test.h"
>>> > - #include "lapi/syscalls.h"
>>> > -+#include "lapi/abisize.h"
>>> > -
>>> > - /**
>>> > -  * Linux provides an "old" getrlimit syscall handler that uses
>>> signed long,
>>> > -@@ -61,7 +62,12 @@ struct rlimit_ulong {
>>> > -       unsigned long rlim_cur;
>>> > -       unsigned long rlim_max;
>>> > - };
>>> > --const unsigned long RLIM_INFINITY_UL =3D ULONG_MAX;
>>> > -+
>>> > -+#if defined(__mips__) && defined(TST_ABI32)
>>> > -+      const unsigned long RLIM_INFINITY_UL =3D 0x7fffffffUL;
>>> > -+#else
>>> > -+      const unsigned long RLIM_INFINITY_UL =3D ULONG_MAX;
>>> > -+#endif
>>> > -
>>> > - static int getrlimit_ulong(int resource, struct rlimit_ulong *rlim)
>>> > - {
>>> > ---
>>> > -2.7.4
>>> > -
>>> > diff --git a/meta/recipes-extended/ltp/ltp_20190517.bb
>>> b/meta/recipes-extended/ltp/ltp_20190930.bb
>>> > similarity index 84%
>>> > rename from meta/recipes-extended/ltp/ltp_20190517.bb
>>> > rename to meta/recipes-extended/ltp/ltp_20190930.bb
>>> > index 60f749b4c01..9a436a52303 100644
>>> > --- a/meta/recipes-extended/ltp/ltp_20190517.bb
>>> > +++ b/meta/recipes-extended/ltp/ltp_20190930.bb
>>> > @@ -27,7 +27,7 @@ CFLAGS_append_x86-64 =3D " -fomit-frame-pointer"
>>> >
>>> >  CFLAGS_append_powerpc64 =3D " -D__SANE_USERSPACE_TYPES__"
>>> >  CFLAGS_append_mipsarchn64 =3D " -D__SANE_USERSPACE_TYPES__"
>>> > -SRCREV =3D "ac33ef87f0b9dc56533026435be3ea8c67ce86d2"
>>> > +SRCREV =3D "c9707b465a08397569920b676345474f44327200"
>>> >
>>> >  SRC_URI =3D "git://github.com/linux-test-project/ltp.git \
>>> >
>>>  file://0001-build-Add-option-to-select-libc-implementation.patch \
>>> > @@ -38,19 +38,8 @@ SRC_URI =3D "git://
>>> github.com/linux-test-project/ltp.git \
>>> >             file://0007-Fix-test_proc_kill-hanging.patch \
>>> >
>>>  file://0008-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch=
 \
>>> >
>>>  file://0009-open_posix_testsuite-mmap24-2-Relax-condition-a-bit.patch =
\
>>> > -
>>>  file://0010-shmctl01-don-t-use-hardcoded-index-0-for-SHM_STAT-te.patch=
 \
>>> > -           file://0011-direct_io-diotest4-drop-MAP_FIXED.patch \
>>> > -
>>>  file://0012-getrlimit03-adjust-a-bit-of-code-to-compatiable-with.patch=
 \
>>> > -
>>>  file://0001-Add-configure-time-check-for-getdents-getdents64-API.patch=
 \
>>> > -           file://0002-check-for-RES_USE_INET6-during-configure.patc=
h
>>> \
>>> > -
>>>  file://0001-syscalls-tgkill03-wait-for-defunct-tid-to-get-detach.patch=
 \
>>> > -
>>>  file://0001-ustat02-Fix-EFAULT-in-32bit-compatibility-mode.patch \
>>> > -           file://0001-cve-meltdown.c-Fix-kernel-symbol-finding.patc=
h
>>> \
>>> > -
>>>  file://0001-testcases-use-python3-everywhere-to-run-python-scrip.patch=
 \
>>> > -
>>>  file://0001-syscall-rt_sigtimedwait01-Fix-wrong-sigset-length-fo.patch=
 \
>>> > -
>>>  file://0001-cve-2017-17052-Avoid-unsafe-exits-in-threads.patch \
>>> > -
>>>  file://0001-overcommit_memory-update-for-mm-fix-false-positive-O.patch=
 \
>>> >
>>>  file://0001-mkswap01.sh-Add-udevadm-trigger-before-swap-verifica.patch=
 \
>>> > +
>>>  file://0001-testcases-fix-an-absent-format-string-issue.patch \
>>> >             "
>>> >
>>> >  S =3D "${WORKDIR}/git"
>>> > --
>>> > 2.17.1
>>> >
>>> > --
>>> > _______________________________________________
>>> > Openembedded-core mailing list
>>> > Openembedded-core@lists.openembedded.org
>>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>>

--000000000000fc2c900599c13e09
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sun, 15 Dec 2019 at 18:11, Khem Raj &l=
t;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<b=
r></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Sun, Dec 15, 2019 at 3:02 AM Alexander Kanavin &lt;<a href=3D=
"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a=
>&gt; wrote:<br><div><div class=3D"gmail_quote"><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex"><div dir=3D"ltr"><div>As the last three issues are c=
lang or musl related, may I request that you look into them?</div><div></di=
v></div></blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I will t=
ry but there is one issue where a patch is removed which should not be so i=
t=E2=80=99s better if that patch can be forward ported as needed for newer =
issues I will see if I can find some solutions <br></div></div></div></bloc=
kquote><div><br></div><div>The patch was removed as upstream has actually f=
ixed/changed the things it was patching, so it&#39;s probably a new issue. =
Also I am not able to easily test with clang.<br></div><div>Can you take a =
look please?</div><div><br></div><div>Alex<br></div><div><br></div><div> <b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div><div class=
=3D"gmail_quote"><div dir=3D"auto"></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><div dir=3D"ltr"><div><br></div><div>Alex<br></div></div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, =
15 Dec 2019 at 06:33, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" ta=
rget=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">musl build fails on aarch64<br>
<br>
<a href=3D"https://errors.yoctoproject.org/Errors/Details/297288/" rel=3D"n=
oreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/Details=
/297288/</a><br>
<br>
On Thu, Dec 12, 2019 at 10:18 AM Alexander Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Drop a big pile of backports.<br>
&gt;<br>
&gt; Add a patch to address absent string formatting error.<br>
&gt;<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gm=
ail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...me-check-for-getdents-getdents64-API.patch |=C2=A0 72 -------=
-<br>
&gt;=C2=A0 ...option-to-select-libc-implementation.patch |=C2=A0 27 ++-<br>
&gt;=C2=A0 ...-17052-Avoid-unsafe-exits-in-threads.patch |=C2=A0 64 -------=
<br>
&gt;=C2=A0 ...meltdown.c-Fix-kernel-symbol-finding.patch |=C2=A0 81 -------=
--<br>
&gt;=C2=A0 ...y-update-for-mm-fix-false-positive-O.patch |=C2=A0 57 -------=
<br>
&gt;=C2=A0 ...medwait01-Fix-wrong-sigset-length-fo.patch |=C2=A0 46 -----<b=
r>
&gt;=C2=A0 ...3-wait-for-defunct-tid-to-get-detach.patch |=C2=A0 75 -------=
-<br>
&gt;=C2=A0 ...es-fix-an-absent-format-string-issue.patch |=C2=A0 24 +++<br>
&gt;=C2=A0 ...thon3-everywhere-to-run-python-scrip.patch | 161 ------------=
------<br>
&gt;=C2=A0 ...x-EFAULT-in-32bit-compatibility-mode.patch |=C2=A0 36 ----<br=
>
&gt;=C2=A0 ...k-for-RES_USE_INET6-during-configure.patch |=C2=A0 68 -------=
-<br>
&gt;=C2=A0 ...BC_PREREQ-is-defined-before-using-it.patch |=C2=A0 27 ++-<br>
&gt;=C2=A0 ...se-hardcoded-index-0-for-SHM_STAT-te.patch |=C2=A0 82 -------=
--<br>
&gt;=C2=A0 ...11-direct_io-diotest4-drop-MAP_FIXED.patch |=C2=A0 56 ------<=
br>
&gt;=C2=A0 ...st-a-bit-of-code-to-compatiable-with.patch |=C2=A0 64 -------=
<br>
&gt;=C2=A0 .../ltp/{<a href=3D"http://ltp_20190517.bb" rel=3D"noreferrer" t=
arget=3D"_blank">ltp_20190517.bb</a> =3D&gt; <a href=3D"http://ltp_20190930=
.bb" rel=3D"noreferrer" target=3D"_blank">ltp_20190930.bb</a>}=C2=A0 |=C2=
=A0 15 +-<br>
&gt;=C2=A0 16 files changed, 51 insertions(+), 904 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-Add-config=
ure-time-check-for-getdents-getdents64-API.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-cve-2017-1=
7052-Avoid-unsafe-exits-in-threads.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-cve-meltdo=
wn.c-Fix-kernel-symbol-finding.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-overcommit=
_memory-update-for-mm-fix-false-positive-O.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-syscall-rt=
_sigtimedwait01-Fix-wrong-sigset-length-fo.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-syscalls-t=
gkill03-wait-for-defunct-tid-to-get-detach.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-extended/ltp/ltp/0001-testcases-=
fix-an-absent-format-string-issue.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-testcases-=
use-python3-everywhere-to-run-python-scrip.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-ustat02-Fi=
x-EFAULT-in-32bit-compatibility-mode.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-extended/ltp/ltp/0002-check-for-=
RES_USE_INET6-during-configure.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-extended/ltp/ltp/0010-shmctl01-d=
on-t-use-hardcoded-index-0-for-SHM_STAT-te.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-extended/ltp/ltp/0011-direct_io-=
diotest4-drop-MAP_FIXED.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-extended/ltp/ltp/0012-getrlimit0=
3-adjust-a-bit-of-code-to-compatiable-with.patch<br>
&gt;=C2=A0 rename meta/recipes-extended/ltp/{<a href=3D"http://ltp_20190517=
.bb" rel=3D"noreferrer" target=3D"_blank">ltp_20190517.bb</a> =3D&gt; <a hr=
ef=3D"http://ltp_20190930.bb" rel=3D"noreferrer" target=3D"_blank">ltp_2019=
0930.bb</a>} (84%)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-extended/ltp/ltp/0001-Add-configure-time-che=
ck-for-getdents-getdents64-API.patch b/meta/recipes-extended/ltp/ltp/0001-A=
dd-configure-time-check-for-getdents-getdents64-API.patch<br>
&gt; deleted file mode 100644<br>
&gt; index bfceadb190d..00000000000<br>
&gt; --- a/meta/recipes-extended/ltp/ltp/0001-Add-configure-time-check-for-=
getdents-getdents64-API.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,72 +0,0 @@<br>
&gt; -From 404dfeb4faef213b0450f173b60cd7080edec349 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
&gt; -Date: Fri, 26 Jul 2019 10:32:29 -0700<br>
&gt; -Subject: [PATCH 1/2] Add configure time check for getdents/getdents64=
 APIs<br>
&gt; -<br>
&gt; -glibc 2.30 has added wrapper for getdents64 this will help in detecti=
ng<br>
&gt; -right condition to use fallback<br>
&gt; -<br>
&gt; -Check for getdents API as well while here<br>
&gt; -<br>
&gt; -Upstream-Status: Submitted [<a href=3D"http://lists.linux.it/pipermai=
l/ltp/2019-July/012954.html" rel=3D"noreferrer" target=3D"_blank">http://li=
sts.linux.it/pipermail/ltp/2019-July/012954.html</a>]<br>
&gt; -Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ----<br>
&gt; - <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 ++<br>
&gt; - testcases/kernel/syscalls/getdents/getdents.h | 8 ++++++--<br>
&gt; - 2 files changed, 8 insertions(+), 2 deletions(-)<br>
&gt; -<br>
&gt; ---- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
&gt; -+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
&gt; -@@ -65,6 +65,8 @@ AC_CHECK_FUNCS([ \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0fallocate \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0fchownat \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0fstatat \<br>
&gt; -+=C2=A0 =C2=A0 getdents \<br>
&gt; -+=C2=A0 =C2=A0 getdents64 \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0kcmp \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0mkdirat \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0mknodat \<br>
&gt; ---- a/testcases/kernel/syscalls/getdents/getdents.h<br>
&gt; -+++ b/testcases/kernel/syscalls/getdents/getdents.h<br>
&gt; -@@ -23,7 +23,7 @@<br>
&gt; - #include &lt;stdint.h&gt;<br>
&gt; - #include &quot;test.h&quot;<br>
&gt; - #include &quot;lapi/syscalls.h&quot;<br>
&gt; --<br>
&gt; -+#include &quot;config.h&quot;<br>
&gt; - /*<br>
&gt; -=C2=A0 * See fs/compat.c struct compat_linux_dirent<br>
&gt; -=C2=A0 */<br>
&gt; -@@ -34,12 +34,17 @@ struct linux_dirent {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0char=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 d_name[];<br>
&gt; - };<br>
&gt; -<br>
&gt; -+#if HAVE_GETDENTS<br>
&gt; -+#include &lt;unistd.h&gt;<br>
&gt; -+#else<br>
&gt; - static inline int<br>
&gt; - getdents(unsigned int fd, struct linux_dirent *dirp, unsigned int si=
ze)<br>
&gt; - {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return ltp_syscall(__NR_getdents, fd, dirp=
, size);<br>
&gt; - }<br>
&gt; -<br>
&gt; -+#endif /* HAVE_GETDENTS */<br>
&gt; -+<br>
&gt; - struct linux_dirent64 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 d_ino;=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0int64_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d=
_off;<br>
&gt; -@@ -48,10 +53,13 @@ struct linux_dirent64 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0char=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 d_name[];<br>
&gt; - };<br>
&gt; -<br>
&gt; -+#if HAVE_GETDENTS64<br>
&gt; -+#include &lt;unistd.h&gt;<br>
&gt; -+#else<br>
&gt; - static inline int<br>
&gt; - getdents64(unsigned int fd, struct linux_dirent64 *dirp64, unsigned =
int size)<br>
&gt; - {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return ltp_syscall(__NR_getdents64, fd, di=
rp64, size);<br>
&gt; - }<br>
&gt; --<br>
&gt; -+#endif /* HAVE_GETDENTS64 */<br>
&gt; - #endif /* GETDENTS_H */<br>
&gt; diff --git a/meta/recipes-extended/ltp/ltp/0001-build-Add-option-to-se=
lect-libc-implementation.patch b/meta/recipes-extended/ltp/ltp/0001-build-A=
dd-option-to-select-libc-implementation.patch<br>
&gt; index b5c25c56a57..1705abcf196 100644<br>
&gt; --- a/meta/recipes-extended/ltp/ltp/0001-build-Add-option-to-select-li=
bc-implementation.patch<br>
&gt; +++ b/meta/recipes-extended/ltp/ltp/0001-build-Add-option-to-select-li=
bc-implementation.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From ec282980e6eee96f5b74aba464141f86049263e6 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 62c3481c73a2414d7a5f0a70808bfc9a06195bd9 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Thu, 7 Jan 2016 18:19:03 +0000<br>
&gt;=C2=A0 Subject: [PATCH] build: Add option to select libc implementation=
<br>
&gt; @@ -12,6 +12,7 @@ Disable tests specifically not building _yet_ on mus=
l based systems<br>
&gt;=C2=A0 Upstream-Status: Pending<br>
&gt;<br>
&gt;=C2=A0 Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com=
" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; +<br>
&gt;=C2=A0 ---<br>
&gt;=C2=A0 =C2=A0Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 5 +++++<br>
&gt;=C2=A0 =C2=A0testcases/kernel/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 5 ++++-<br>
&gt; @@ -24,7 +25,7 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.kh=
em@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A08 files changed, 35 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/Makefile b/Makefile<br>
&gt; -index 768ca46..e9d679a 100644<br>
&gt; +index 768ca4606..e9d679a71 100644<br>
&gt;=C2=A0 --- a/Makefile<br>
&gt;=C2=A0 +++ b/Makefile<br>
&gt;=C2=A0 @@ -41,6 +41,11 @@ vpath %.mk=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
$(top_srcdir)/mk:$(top_srcdir)/mk/include<br>
&gt; @@ -40,18 +41,19 @@ index 768ca46..e9d679a 100644<br>
&gt;=C2=A0 =C2=A0# COMMON_TARGETS:=C2=A0 =C2=A0 =C2=A0Targets which exist i=
n all, clean, and install.<br>
&gt;=C2=A0 =C2=A0# INSTALL_TARGETS:=C2=A0 =C2=A0 Targets which exist in cle=
an and install (contains<br>
&gt;=C2=A0 diff --git a/testcases/kernel/Makefile b/testcases/kernel/Makefi=
le<br>
&gt; -index 39d79c7..24a57d9 100644<br>
&gt; +index 3319b3163..94ea362c8 100644<br>
&gt;=C2=A0 --- a/testcases/kernel/Makefile<br>
&gt;=C2=A0 +++ b/testcases/kernel/Makefile<br>
&gt; -@@ -49,12 +49,15 @@ SUBDIRS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D connectors \<br>
&gt; +@@ -49,13 +49,16 @@ SUBDIRS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D connectors \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 logging \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mem \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 numa \<br>
&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0pty \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sched \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 security \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 timers \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 sound \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tracing \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 uevents \<br>
&gt;<br>
&gt;=C2=A0 +ifneq ($(LIBC),musl)<br>
&gt;=C2=A0 +SUBDIRS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D pty<br>
&gt; @@ -61,7 +63,7 @@ index 39d79c7..24a57d9 100644<br>
&gt;=C2=A0 =C2=A0SUBDIRS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D power_management<br>
&gt;=C2=A0 =C2=A0endif<br>
&gt;=C2=A0 diff --git a/testcases/kernel/sched/Makefile b/testcases/kernel/=
sched/Makefile<br>
&gt; -index 6a57d79..74bb933 100644<br>
&gt; +index 6a57d79ee..74bb93370 100644<br>
&gt;=C2=A0 --- a/testcases/kernel/sched/Makefile<br>
&gt;=C2=A0 +++ b/testcases/kernel/sched/Makefile<br>
&gt;=C2=A0 @@ -23,5 +23,7 @@<br>
&gt; @@ -74,7 +76,7 @@ index 6a57d79..74bb933 100644<br>
&gt;=C2=A0 +endif<br>
&gt;=C2=A0 =C2=A0include $(top_srcdir)/include/mk/<a href=3D"http://generic=
_trunk_target.mk" rel=3D"noreferrer" target=3D"_blank">generic_trunk_target=
.mk</a><br>
&gt;=C2=A0 diff --git a/testcases/kernel/syscalls/Makefile b/testcases/kern=
el/syscalls/Makefile<br>
&gt; -index 45a00cf..d1becd0 100644<br>
&gt; +index 45a00cf7d..d1becd054 100644<br>
&gt;=C2=A0 --- a/testcases/kernel/syscalls/Makefile<br>
&gt;=C2=A0 +++ b/testcases/kernel/syscalls/Makefile<br>
&gt;=C2=A0 @@ -28,6 +28,11 @@ ifeq ($(UCLINUX),1)<br>
&gt; @@ -90,7 +92,7 @@ index 45a00cf..d1becd0 100644<br>
&gt;=C2=A0 =C2=A0ifeq ($(UCLIBC),1)<br>
&gt;=C2=A0 =C2=A0FILTER_OUT_DIRS=C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D profil<br>
&gt;=C2=A0 diff --git a/testcases/network/nfsv4/acl/Makefile b/testcases/ne=
twork/nfsv4/acl/Makefile<br>
&gt; -index 8c55a6b..f7cda62 100644<br>
&gt; +index 8c55a6bbd..f7cda621d 100644<br>
&gt;=C2=A0 --- a/testcases/network/nfsv4/acl/Makefile<br>
&gt;=C2=A0 +++ b/testcases/network/nfsv4/acl/Makefile<br>
&gt;=C2=A0 @@ -26,4 +26,8 @@ include $(top_srcdir)/include/mk/<a href=3D"ht=
tp://env_pre.mk" rel=3D"noreferrer" target=3D"_blank">env_pre.mk</a><br>
&gt; @@ -103,7 +105,7 @@ index 8c55a6b..f7cda62 100644<br>
&gt;=C2=A0 +<br>
&gt;=C2=A0 =C2=A0include $(top_srcdir)/include/mk/<a href=3D"http://generic=
_leaf_target.mk" rel=3D"noreferrer" target=3D"_blank">generic_leaf_target.m=
k</a><br>
&gt;=C2=A0 diff --git a/testcases/network/rpc/basic_tests/Makefile b/testca=
ses/network/rpc/basic_tests/Makefile<br>
&gt; -index 66e9d56..ea8eb8a 100644<br>
&gt; +index 66e9d5675..ea8eb8a98 100644<br>
&gt;=C2=A0 --- a/testcases/network/rpc/basic_tests/Makefile<br>
&gt;=C2=A0 +++ b/testcases/network/rpc/basic_tests/Makefile<br>
&gt;=C2=A0 @@ -23,4 +23,9 @@<br>
&gt; @@ -117,7 +119,7 @@ index 66e9d56..ea8eb8a 100644<br>
&gt;=C2=A0 +<br>
&gt;=C2=A0 =C2=A0include $(top_srcdir)/include/mk/<a href=3D"http://generic=
_trunk_target.mk" rel=3D"noreferrer" target=3D"_blank">generic_trunk_target=
.mk</a><br>
&gt;=C2=A0 diff --git a/testcases/realtime/func/pi-tests/Makefile b/testcas=
es/realtime/func/pi-tests/Makefile<br>
&gt; -index 68616a7..748754b 100644<br>
&gt; +index 68616a711..748754bb4 100644<br>
&gt;=C2=A0 --- a/testcases/realtime/func/pi-tests/Makefile<br>
&gt;=C2=A0 +++ b/testcases/realtime/func/pi-tests/Makefile<br>
&gt;=C2=A0 @@ -27,5 +27,9 @@ include $(top_srcdir)/include/mk/<a href=3D"ht=
tp://env_pre.mk" rel=3D"noreferrer" target=3D"_blank">env_pre.mk</a><br>
&gt; @@ -131,7 +133,7 @@ index 68616a7..748754b 100644<br>
&gt;<br>
&gt;=C2=A0 =C2=A0include $(top_srcdir)/include/mk/<a href=3D"http://generic=
_leaf_target.mk" rel=3D"noreferrer" target=3D"_blank">generic_leaf_target.m=
k</a><br>
&gt;=C2=A0 diff --git a/testcases/realtime/stress/pi-tests/Makefile b/testc=
ases/realtime/stress/pi-tests/Makefile<br>
&gt; -index 1881f75..266e0b8 100644<br>
&gt; +index 1881f7565..266e0b815 100644<br>
&gt;=C2=A0 --- a/testcases/realtime/stress/pi-tests/Makefile<br>
&gt;=C2=A0 +++ b/testcases/realtime/stress/pi-tests/Makefile<br>
&gt;=C2=A0 @@ -24,4 +24,9 @@ top_srcdir=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0?=3D ../../../..<br>
&gt; @@ -144,6 +146,3 @@ index 1881f75..266e0b8 100644<br>
&gt;=C2=A0 +endif<br>
&gt;=C2=A0 +<br>
&gt;=C2=A0 =C2=A0include $(top_srcdir)/include/mk/<a href=3D"http://generic=
_leaf_target.mk" rel=3D"noreferrer" target=3D"_blank">generic_leaf_target.m=
k</a><br>
&gt; ---<br>
&gt; -2.7.4<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-extended/ltp/ltp/0001-cve-2017-17052-Avoid-u=
nsafe-exits-in-threads.patch b/meta/recipes-extended/ltp/ltp/0001-cve-2017-=
17052-Avoid-unsafe-exits-in-threads.patch<br>
&gt; deleted file mode 100644<br>
&gt; index cc40081300c..00000000000<br>
&gt; --- a/meta/recipes-extended/ltp/ltp/0001-cve-2017-17052-Avoid-unsafe-e=
xits-in-threads.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,64 +0,0 @@<br>
&gt; -From e3a8502d0a4f8a44ddd02ca4b2efc097133fb9f7 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Mathias Fiedler &lt;<a href=3D"mailto:mathias.fiedler@aox-tech.=
de" target=3D"_blank">mathias.fiedler@aox-tech.de</a>&gt;<br>
&gt; -Date: Fri, 23 Aug 2019 12:46:48 +0200<br>
&gt; -Subject: [PATCH] cve-2017-17052: Avoid unsafe exits in threads<br>
&gt; -<br>
&gt; -According to manpage exit(3) calling exit is not thread-safe.<br>
&gt; -And with glibc 2.28 (and probably also with glibc &gt;=3D2.27) someti=
mes<br>
&gt; -child processes created in fork_thread can get stuck on process exit =
in<br>
&gt; -glibc&#39;s __run_exit_handlers trying to acquire some lock which was=
 in<br>
&gt; -locked state while the fork was created. This can happen when exit is=
<br>
&gt; -called in mmap_thread concurrently to the fork.<br>
&gt; -While the main process will still return with PASSED some of its<br>
&gt; -children are left behind.<br>
&gt; -<br>
&gt; -Comparing the source code with the original program as described in t=
he<br>
&gt; -commit 2b7e8665b4ff51c034c55df3cff76518d1a9ee3a of linux kernel &gt;=
=3D4.13<br>
&gt; -the exits in mmap_thread and fork_thread should not be necessary to<b=
r>
&gt; -trigger the original bug.<br>
&gt; -<br>
&gt; -Therefore those exit calls are removed. The mmap_thread and fork_thre=
ad<br>
&gt; -should still exit when their corresponding main thread in do_test_for=
k<br>
&gt; -calls exit_group. The remaining exit in do_test_fork will be called i=
n<br>
&gt; -the main thread without any concurrent thread in the same process.<br=
>
&gt; -<br>
&gt; -Signed-off-by: Mathias Fiedler &lt;<a href=3D"mailto:mathias.fiedler@=
aox-tech.de" target=3D"_blank">mathias.fiedler@aox-tech.de</a>&gt;<br>
&gt; -Acked-by: Cyril Hrubis &lt;<a href=3D"mailto:chrubis@suse.cz" target=
=3D"_blank">chrubis@suse.cz</a>&gt;<br>
&gt; -Acked-by: Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.com" targ=
et=3D"_blank">jstancek@redhat.com</a>&gt;<br>
&gt; -<br>
&gt; -Upstream-Status: Backport<br>
&gt; -[<a href=3D"https://github.com/linux-test-project/ltp/commit/9f0b452c=
1af4bcb54da35711eb3fa77334a350b4" rel=3D"noreferrer" target=3D"_blank">http=
s://github.com/linux-test-project/ltp/commit/9f0b452c1af4bcb54da35711eb3fa7=
7334a350b4</a>]<br>
&gt; -<br>
&gt; -CVE: CVE-2017-17052<br>
&gt; -<br>
&gt; -Signed-off-by: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com" tar=
get=3D"_blank">zhe.he@windriver.com</a>&gt;<br>
&gt; ----<br>
&gt; - testcases/cve/cve-2017-17052.c | 5 -----<br>
&gt; - 1 file changed, 5 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/testcases/cve/cve-2017-17052.c b/testcases/cve/cve-2017-=
17052.c<br>
&gt; -index d7da7e919..18cd2a6d7 100644<br>
&gt; ---- a/testcases/cve/cve-2017-17052.c<br>
&gt; -+++ b/testcases/cve/cve-2017-17052.c<br>
&gt; -@@ -58,8 +58,6 @@ static void *mmap_thread(void *arg)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0for (;;) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_MMAP(NULL=
, 0x1000000, PROT_READ,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MAP_POPULATE|MAP_ANONYMOUS|MAP_PR=
IVATE, -1, 0);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*do_exit)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 exit(0);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return arg;<br>
&gt; -@@ -67,9 +65,6 @@ static void *mmap_thread(void *arg)<br>
&gt; -<br>
&gt; - static void *fork_thread(void *arg)<br>
&gt; - {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 if (*do_exit)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(0);<br>
&gt; --<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0usleep(rand() % 10000);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_FORK();<br>
&gt; -<br>
&gt; ---<br>
&gt; -2.17.1<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-extended/ltp/ltp/0001-cve-meltdown.c-Fix-ker=
nel-symbol-finding.patch b/meta/recipes-extended/ltp/ltp/0001-cve-meltdown.=
c-Fix-kernel-symbol-finding.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 94f6f5a15a6..00000000000<br>
&gt; --- a/meta/recipes-extended/ltp/ltp/0001-cve-meltdown.c-Fix-kernel-sym=
bol-finding.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,81 +0,0 @@<br>
&gt; -From fbeda82f440a0098be42dd668cbc47212a86ab48 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com" target=3D"_b=
lank">zhe.he@windriver.com</a>&gt;<br>
&gt; -Date: Wed, 21 Aug 2019 16:27:24 +0800<br>
&gt; -Subject: [PATCH] cve/meltdown.c: Fix kernel symbol finding<br>
&gt; -<br>
&gt; -meltdown case fails as below.<br>
&gt; -safe_file_ops.c:219: BROK: Expected 3 conversions got 2 at meltdown.c=
:272<br>
&gt; -<br>
&gt; -find_kernel_symbol is defined to try twice with each of /proc/kallsym=
s and<br>
&gt; -/boot/System.map-%s. Currently if the symbol is not found in /proc/ka=
llsyms,<br>
&gt; -when kernel option CONFIG_KALLSYMS_ALL is disabled, it would stop the=
 case<br>
&gt; -immediately due to SAFE_FILE_LINES_SCANF.<br>
&gt; -<br>
&gt; -This patch turns to use FILE_LINES_SCANF to give find_kernel_symbol s=
econd<br>
&gt; -chance.<br>
&gt; -<br>
&gt; -[jstancek] Fix also condition introduced in 7709d2ae92ea, even if<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/proc/kallsyms is disabled, =
we still want to try System.map.<br>
&gt; -<br>
&gt; -Signed-off-by: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com" tar=
get=3D"_blank">zhe.he@windriver.com</a>&gt;<br>
&gt; -Signed-off-by: Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.com"=
 target=3D"_blank">jstancek@redhat.com</a>&gt;<br>
&gt; -<br>
&gt; -Upstream-Status: Backport<br>
&gt; -[<a href=3D"https://github.com/linux-test-project/ltp/commit/c2049b5c=
874bc071f8185bffb5fd7dcb042d9ec8" rel=3D"noreferrer" target=3D"_blank">http=
s://github.com/linux-test-project/ltp/commit/c2049b5c874bc071f8185bffb5fd7d=
cb042d9ec8</a>]<br>
&gt; -<br>
&gt; -Remove the hunk for upstream 7709d2ae92ea (&quot;cve/meltdown.c: abor=
t the test if kallsyms was not enabled&quot;)<br>
&gt; -that has been covered by this patch.<br>
&gt; -<br>
&gt; -Signed-off-by: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com" tar=
get=3D"_blank">zhe.he@windriver.com</a>&gt;<br>
&gt; ----<br>
&gt; - testcases/cve/meltdown.c | 13 ++++++++++---<br>
&gt; - 1 file changed, 10 insertions(+), 3 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/testcases/cve/meltdown.c b/testcases/cve/meltdown.c<br>
&gt; -index a53ea9b..22651a6 100644<br>
&gt; ---- a/testcases/cve/meltdown.c<br>
&gt; -+++ b/testcases/cve/meltdown.c<br>
&gt; -@@ -267,9 +267,15 @@ find_symbol_in_file(const char *filename, const =
char *symname)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret, read;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0char fmt[strlen(symname) + 64];<br>
&gt; -<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 tst_res(TINFO, &quot;Looking for %s in %s&quot;=
, symname, filename);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 if (access(filename, F_OK) =3D=3D -1) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TINFO, &quo=
t;%s not available&quot;, filename);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -+<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0sprintf(fmt, &quot;%%lx %%c %s%%c&quot;, s=
ymname);<br>
&gt; -<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 ret =3D SAFE_FILE_LINES_SCANF(filename, fmt, &a=
mp;addr, &amp;type, &amp;read);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 ret =3D FILE_LINES_SCANF(filename, fmt, &amp;ad=
dr, &amp;type, &amp;read);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; -<br>
&gt; -@@ -287,13 +293,11 @@ find_kernel_symbol(const char *name)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (addr)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return addr;<b=
r>
&gt; -<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 tst_res(TINFO, &quot;not found &#39;%s&#39; in =
/proc/kallsyms&quot;, name);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (uname(&amp;utsname) &lt; 0)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TBROK =
| TERRNO, &quot;uname&quot;);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0sprintf(systemmap, &quot;/boot/System.map-=
%s&quot;, utsname.release);<br>
&gt; -<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 tst_res(TINFO, &quot;looking in &#39;%s&#39;\n&=
quot;, systemmap);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0addr =3D find_symbol_in_file(systemmap, na=
me);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return addr;<br>
&gt; - }<br>
&gt; -@@ -308,6 +312,9 @@ static void setup(void)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0saved_cmdline_addr =3D find_kernel_symbol(=
&quot;saved_command_line&quot;);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TINFO, &quot;&amp;saved_command_li=
ne =3D=3D 0x%lx&quot;, saved_cmdline_addr);<br>
&gt; -<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 if (!saved_cmdline_addr)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_brk(TCONF, &quo=
t;saved_command_line not found&quot;);<br>
&gt; -+<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0spec_fd =3D SAFE_OPEN(&quot;/proc/cmdline&=
quot;, O_RDONLY);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0memset(target_array, 1, sizeof(target_arra=
y));<br>
&gt; ---<br>
&gt; -2.7.4<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-extended/ltp/ltp/0001-overcommit_memory-upda=
te-for-mm-fix-false-positive-O.patch b/meta/recipes-extended/ltp/ltp/0001-o=
vercommit_memory-update-for-mm-fix-false-positive-O.patch<br>
&gt; deleted file mode 100644<br>
&gt; index bed84712a15..00000000000<br>
&gt; --- a/meta/recipes-extended/ltp/ltp/0001-overcommit_memory-update-for-=
mm-fix-false-positive-O.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,57 +0,0 @@<br>
&gt; -From d656a447893dccc310c975a239f482278550c3e0 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.com" target=
=3D"_blank">jstancek@redhat.com</a>&gt;<br>
&gt; -Date: Tue, 21 May 2019 10:10:44 +0200<br>
&gt; -Subject: [PATCH] overcommit_memory: update for &quot;mm: fix false-po=
sitive<br>
&gt; - OVERCOMMIT_GUESS failures&quot;<br>
&gt; -<br>
&gt; -commit 8c7829b04c52 (&quot;mm: fix false-positive OVERCOMMIT_GUESS fa=
ilures&quot;)<br>
&gt; -changes logic of __vm_enough_memory(), simplifying it to:<br>
&gt; -=C2=A0 =C2=A0 When in GUESS mode, catch wild allocations by comparing=
 their request<br>
&gt; -=C2=A0 =C2=A0 size to total amount of ram and swap in the system.<br>
&gt; -<br>
&gt; -Testcase currently allocates mem_total + swap_total, which doesn&#39;=
t trigger<br>
&gt; -new condition. Make it more extreme, but assuming free_total / 2 will=
 PASS,<br>
&gt; -and 2*sum_total will FAIL.<br>
&gt; -<br>
&gt; -Signed-off-by: Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.com"=
 target=3D"_blank">jstancek@redhat.com</a>&gt;<br>
&gt; -Acked-by: Cyril Hrubis &lt;<a href=3D"mailto:chrubis@suse.cz" target=
=3D"_blank">chrubis@suse.cz</a>&gt;<br>
&gt; -<br>
&gt; -Upstream-Status: Backport [<a href=3D"https://github.com/linux-test-p=
roject/ltp/commit/d656a447893dccc310c975a239f482278550c3e0" rel=3D"noreferr=
er" target=3D"_blank">https://github.com/linux-test-project/ltp/commit/d656=
a447893dccc310c975a239f482278550c3e0</a>]<br>
&gt; -Signed-off-by: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com" tar=
get=3D"_blank">zhe.he@windriver.com</a>&gt;<br>
&gt; ----<br>
&gt; - testcases/kernel/mem/tunable/overcommit_memory.c | 11 ++++-------<br=
>
&gt; - 1 file changed, 4 insertions(+), 7 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/testcases/kernel/mem/tunable/overcommit_memory.c b/testc=
ases/kernel/mem/tunable/overcommit_memory.c<br>
&gt; -index 555298f..345764d 100644<br>
&gt; ---- a/testcases/kernel/mem/tunable/overcommit_memory.c<br>
&gt; -+++ b/testcases/kernel/mem/tunable/overcommit_memory.c<br>
&gt; -@@ -36,11 +36,10 @@<br>
&gt; -=C2=A0 *<br>
&gt; -=C2=A0 * The program is designed to test the two tunables:<br>
&gt; -=C2=A0 *<br>
&gt; -- * When overcommit_memory =3D 0, allocatable memory can&#39;t overex=
tends<br>
&gt; -- * the amount of free memory. I choose the three cases:<br>
&gt; -+ * When overcommit_memory =3D 0, allocatable memory can&#39;t overex=
tend<br>
&gt; -+ * the amount of total memory:<br>
&gt; -=C2=A0 * a. less than free_total:=C2=A0 =C2=A0 free_total / 2, alloc =
should pass.<br>
&gt; -- * b. greater than free_total: free_total * 2, alloc should fail.<br=
>
&gt; -- * c. equal to sum_total:=C2=A0 =C2=A0 =C2=A0 sum_tatal,=C2=A0 =C2=
=A0 =C2=A0 alloc should fail<br>
&gt; -+ * b. greater than sum_total:=C2=A0 =C2=A0sum_total * 2, alloc shoul=
d fail.<br>
&gt; -=C2=A0 *<br>
&gt; -=C2=A0 * When overcommit_memory =3D 1, it can alloc enough much memor=
y, I<br>
&gt; -=C2=A0 * choose the three cases:<br>
&gt; -@@ -164,9 +163,7 @@ static void overcommit_memory_test(void)<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0update_mem();<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0alloc_and_check(free_total / 2, EXPECT_PAS=
S);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 update_mem();<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 alloc_and_check(free_total * 2, EXPECT_FAIL);<b=
r>
&gt; --=C2=A0 =C2=A0 =C2=A0 alloc_and_check(sum_total, EXPECT_FAIL);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 alloc_and_check(sum_total * 2, EXPECT_FAIL);<br=
>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0/* start to test overcommit_memory=3D1 */<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0set_sys_tune(&quot;overcommit_memory&quot;=
, 1, 1);<br>
&gt; ---<br>
&gt; -2.7.4<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-extended/ltp/ltp/0001-syscall-rt_sigtimedwai=
t01-Fix-wrong-sigset-length-fo.patch b/meta/recipes-extended/ltp/ltp/0001-s=
yscall-rt_sigtimedwait01-Fix-wrong-sigset-length-fo.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 0e56c08255e..00000000000<br>
&gt; --- a/meta/recipes-extended/ltp/ltp/0001-syscall-rt_sigtimedwait01-Fix=
-wrong-sigset-length-fo.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,46 +0,0 @@<br>
&gt; -From a5046625eaeed2d3fba456c3ba84c6c141c2ad7c Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com" target=3D"_b=
lank">zhe.he@windriver.com</a>&gt;<br>
&gt; -Date: Thu, 29 Aug 2019 21:09:46 +0800<br>
&gt; -Subject: [PATCH] syscall/rt_sigtimedwait01: Fix wrong sigset length f=
or MIPS<br>
&gt; -<br>
&gt; -rt_sigtimedwait01 fails as follow on MIPS arches<br>
&gt; -rt_sigtimedwait01=C2=A0 =C2=A0 1=C2=A0 TFAIL=C2=A0 :=C2=A0 .../sigwai=
tinfo01.c:58: test_empty_set<br>
&gt; -(.../sigwaitinfo01.c: 148): Unexpected failure:<br>
&gt; -TEST_ERRNO=3DEINVAL(22): Invalid argument<br>
&gt; -<br>
&gt; -As this case purposely bypasses glibc, it should align with the size =
of kernel<br>
&gt; -definition of sigset_t which is different from other arches.<br>
&gt; -<a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/l=
inux.git/tree/arch/mips/include/uapi/asm/signal.h#n15" rel=3D"noreferrer" t=
arget=3D"_blank">https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/l=
inux.git/tree/arch/mips/include/uapi/asm/signal.h#n15</a><br>
&gt; -<br>
&gt; -This patch turns to use _NSIG which is always right for all arches.<b=
r>
&gt; -<br>
&gt; -Upstream-Status: Backport [a5046625eaeed2d3fba456c3ba84c6c141c2ad7c]<=
br>
&gt; -<br>
&gt; -Suggested-by: Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.com" =
target=3D"_blank">jstancek@redhat.com</a>&gt;<br>
&gt; -Acked-by: Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.com" targ=
et=3D"_blank">jstancek@redhat.com</a>&gt;<br>
&gt; -Acked-by: Cyril Hrubis &lt;<a href=3D"mailto:chrubis@suse.cz" target=
=3D"_blank">chrubis@suse.cz</a>&gt;<br>
&gt; -Signed-off-by: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com" tar=
get=3D"_blank">zhe.he@windriver.com</a>&gt;<br>
&gt; -Signed-off-by: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" targe=
t=3D"_blank">pvorel@suse.cz</a>&gt;<br>
&gt; ----<br>
&gt; - testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c | 5 ++---<br>
&gt; - 1 file changed, 2 insertions(+), 3 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c b/=
testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c<br>
&gt; -index 5a32ce1..6a30c27 100644<br>
&gt; ---- a/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c<br>
&gt; -+++ b/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c<br>
&gt; -@@ -128,9 +128,8 @@ static int my_sigtimedwait(const sigset_t * set, =
siginfo_t * info,<br>
&gt; - static int my_rt_sigtimedwait(const sigset_t * set, siginfo_t * info=
,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct timespec *timeout)<br>
&gt; - {<br>
&gt; --<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 /* The last argument is (number_of_signals)/(bi=
ts_per_byte), which are 64 and 8, resp. */<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 return ltp_syscall(__NR_rt_sigtimedwait, set, i=
nfo, timeout, 8);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 /* _NSIG is always the right number of bits of =
signal map for all arches */<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 return ltp_syscall(__NR_rt_sigtimedwait, set, i=
nfo, timeout, _NSIG/8);<br>
&gt; - }<br>
&gt; - #endif<br>
&gt; -<br>
&gt; ---<br>
&gt; -2.7.4<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-extended/ltp/ltp/0001-syscalls-tgkill03-wait=
-for-defunct-tid-to-get-detach.patch b/meta/recipes-extended/ltp/ltp/0001-s=
yscalls-tgkill03-wait-for-defunct-tid-to-get-detach.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 6ea26150fbf..00000000000<br>
&gt; --- a/meta/recipes-extended/ltp/ltp/0001-syscalls-tgkill03-wait-for-de=
funct-tid-to-get-detach.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,75 +0,0 @@<br>
&gt; -From e747d0456adc080a1d31fb653bda9dc491795c80 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.com" target=
=3D"_blank">jstancek@redhat.com</a>&gt;<br>
&gt; -Date: Sun, 16 Jun 2019 11:14:16 +0200<br>
&gt; -Subject: [PATCH] syscalls/tgkill03: wait for defunct tid to get detac=
hed<br>
&gt; -<br>
&gt; -Case where defunct tid is used has been observed to sporadically fail=
:<br>
&gt; -=C2=A0 tgkill03.c:96: FAIL: Defunct tid should have failed with ESRCH=
: SUCCESS<br>
&gt; -<br>
&gt; -glibc __pthread_timedjoin_ex() waits for CLONE_CHILD_CLEARTID to clea=
r tid,<br>
&gt; -and then resumes. Kernel clears it (glibc pd-&gt;tid) at:<br>
&gt; -=C2=A0 do_exit<br>
&gt; -=C2=A0 =C2=A0 exit_mm<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 mm_release<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 put_user(0, tsk-&gt;clear_child_tid);<br>
&gt; -<br>
&gt; -but kernel tid is still valid, presumably until:<br>
&gt; -=C2=A0 release_task<br>
&gt; -=C2=A0 =C2=A0 __exit_signal<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 __unhash_process<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 detach_pid<br>
&gt; -<br>
&gt; -To avoid race wait until /proc/&lt;pid&gt;/task/&lt;tid&gt; disappear=
s.<br>
&gt; -<br>
&gt; -Signed-off-by: Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.com"=
 target=3D"_blank">jstancek@redhat.com</a>&gt;<br>
&gt; -Reviewed-by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=
=3D"_blank">liwang@redhat.com</a>&gt;<br>
&gt; -Acked-by: Sumit Garg &lt;<a href=3D"mailto:sumit.garg@linaro.org" tar=
get=3D"_blank">sumit.garg@linaro.org</a>&gt;<br>
&gt; -<br>
&gt; -Upstream-Status: Backport<br>
&gt; -[<a href=3D"https://github.com/linux-test-project/ltp/commit/e747d045=
6adc080a1d31fb653bda9dc491795c80" rel=3D"noreferrer" target=3D"_blank">http=
s://github.com/linux-test-project/ltp/commit/e747d0456adc080a1d31fb653bda9d=
c491795c80</a>]<br>
&gt; -<br>
&gt; -Signed-off-by: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com" tar=
get=3D"_blank">zhe.he@windriver.com</a>&gt;<br>
&gt; ----<br>
&gt; - testcases/kernel/syscalls/tgkill/tgkill03.c | 6 +++++-<br>
&gt; - 1 file changed, 5 insertions(+), 1 deletion(-)<br>
&gt; -<br>
&gt; -diff --git a/testcases/kernel/syscalls/tgkill/tgkill03.c b/testcases/=
kernel/syscalls/tgkill/tgkill03.c<br>
&gt; -index f5bbdc5..593a217 100644<br>
&gt; ---- a/testcases/kernel/syscalls/tgkill/tgkill03.c<br>
&gt; -+++ b/testcases/kernel/syscalls/tgkill/tgkill03.c<br>
&gt; -@@ -7,6 +7,7 @@<br>
&gt; -<br>
&gt; - #include &lt;pthread.h&gt;<br>
&gt; - #include &lt;pwd.h&gt;<br>
&gt; -+#include &lt;stdio.h&gt;<br>
&gt; - #include &lt;sys/types.h&gt;<br>
&gt; -<br>
&gt; - #include &quot;tst_safe_pthread.h&quot;<br>
&gt; -@@ -42,6 +43,7 @@ static void setup(void)<br>
&gt; - {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0sigset_t sigusr1;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0pthread_t defunct_thread;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 char defunct_tid_path[PATH_MAX];<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0sigemptyset(&amp;sigusr1);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0sigaddset(&amp;sigusr1, SIGUSR1);<br>
&gt; -@@ -55,8 +57,9 @@ static void setup(void)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0TST_CHECKPOINT_WAIT(0);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_PTHREAD_CREATE(&amp;defunct_thread, N=
ULL, defunct_thread_func, NULL);<br>
&gt; --<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_PTHREAD_JOIN(defunct_thread, NULL);<b=
r>
&gt; -+=C2=A0 =C2=A0 =C2=A0 sprintf(defunct_tid_path, &quot;/proc/%d/task/%=
d&quot;, getpid(), defunct_tid);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 TST_RETRY_FN_EXP_BACKOFF(access(defunct_tid_pat=
h, R_OK), -1, 15);<br>
&gt; - }<br>
&gt; -<br>
&gt; - static void cleanup(void)<br>
&gt; -@@ -108,4 +111,5 @@ static struct tst_test test =3D {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0.setup =3D setup,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0.cleanup =3D cleanup,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0.test =3D run,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 .timeout =3D 20,<br>
&gt; - };<br>
&gt; ---<br>
&gt; -2.7.4<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-extended/ltp/ltp/0001-testcases-fix-an-absen=
t-format-string-issue.patch b/meta/recipes-extended/ltp/ltp/0001-testcases-=
fix-an-absent-format-string-issue.patch<br>
&gt; new file mode 100644<br>
&gt; index 00000000000..93308445098<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-extended/ltp/ltp/0001-testcases-fix-an-absent-forma=
t-string-issue.patch<br>
&gt; @@ -0,0 +1,24 @@<br>
&gt; +From 476ce907fa18042cdde0a244ba9a46cd895ce76c Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com"=
 target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; +Date: Thu, 12 Dec 2019 17:56:02 +0100<br>
&gt; +Subject: [PATCH] testcases: fix an absent format string issue<br>
&gt; +<br>
&gt; +Upstream-Status: Pending<br>
&gt; +Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + .../kernel/syscalls/pidfd_send_signal/pidfd_send_signal03.c=C2=A0 =
=C2=A0 =C2=A0| 2 +-<br>
&gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/testcases/kernel/syscalls/pidfd_send_signal/pidfd_send_s=
ignal03.c b/testcases/kernel/syscalls/pidfd_send_signal/pidfd_send_signal03=
.c<br>
&gt; +index 27dbc6626..19d943d06 100644<br>
&gt; +--- a/testcases/kernel/syscalls/pidfd_send_signal/pidfd_send_signal03=
.c<br>
&gt; ++++ b/testcases/kernel/syscalls/pidfd_send_signal/pidfd_send_signal03=
.c<br>
&gt; +@@ -59,7 +59,7 @@ static void verify_pidfd_send_signal(void)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Manipulate =
PID for next process */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sprintf(pid_st=
r, &quot;%d&quot;, pid - 1);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SAFE_FILE_PRINTF(la=
st_pid_file, pid_str);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SAFE_FILE_PRINTF(la=
st_pid_file, &quot;%s&quot;, pid_str);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0new_pid =3D SA=
FE_FORK();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (new_pid =
=3D=3D 0) {<br>
&gt; diff --git a/meta/recipes-extended/ltp/ltp/0001-testcases-use-python3-=
everywhere-to-run-python-scrip.patch b/meta/recipes-extended/ltp/ltp/0001-t=
estcases-use-python3-everywhere-to-run-python-scrip.patch<br>
&gt; deleted file mode 100644<br>
&gt; index f4f87f38ab7..00000000000<br>
&gt; --- a/meta/recipes-extended/ltp/ltp/0001-testcases-use-python3-everywh=
ere-to-run-python-scrip.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,161 +0,0 @@<br>
&gt; -From 0463d793566772a606255957915f99d166d5740c Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com"=
 target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; -Date: Wed, 28 Aug 2019 18:30:23 +0200<br>
&gt; -Subject: [PATCH] testcases: use python3 everywhere to run python scri=
pts<br>
&gt; -<br>
&gt; -The scripts themselves have #!/usr/bin/python3 in them,<br>
&gt; -so I trust they are already py3-compatible.<br>
&gt; -<br>
&gt; -Upstream-Status: Pending<br>
&gt; -Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ----<br>
&gt; - testcases/kernel/power_management/runpwtests05.sh=C2=A0 |=C2=A0 2 +-=
<br>
&gt; - .../power_management/runpwtests_exclusive01.sh=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 2 +-<br>
&gt; - .../power_management/runpwtests_exclusive02.sh=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 2 +-<br>
&gt; - .../power_management/runpwtests_exclusive03.sh=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 2 +-<br>
&gt; - .../power_management/runpwtests_exclusive04.sh=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 2 +-<br>
&gt; - .../power_management/runpwtests_exclusive05.sh=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 2 +-<br>
&gt; - testcases/network/nfsv4/acl/runtest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 14 +++++++-------<br>
&gt; - testcases/realtime/func/pi-tests/run_auto.sh=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 6 +++---<br>
&gt; - 8 files changed, 16 insertions(+), 16 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/testcases/kernel/power_management/runpwtests05.sh b/test=
cases/kernel/power_management/runpwtests05.sh<br>
&gt; -index 8a7d0f6e0..43e234d01 100755<br>
&gt; ---- a/testcases/kernel/power_management/runpwtests05.sh<br>
&gt; -+++ b/testcases/kernel/power_management/runpwtests05.sh<br>
&gt; -@@ -35,7 +35,7 @@ else<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0max_sched_smt=3D1<br>
&gt; - fi<br>
&gt; -<br>
&gt; --tst_test_cmds python<br>
&gt; -+tst_test_cmds python3<br>
&gt; -<br>
&gt; - if ! grep sched_debug -qw /proc/cmdline ; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brkm TCONF &quot;Kernel cmdline parame=
ter &#39;sched_debug&#39; needed,&quot; \<br>
&gt; -diff --git a/testcases/kernel/power_management/runpwtests_exclusive01=
.sh b/testcases/kernel/power_management/runpwtests_exclusive01.sh<br>
&gt; -index ec78319e2..9fefcbf6e 100755<br>
&gt; ---- a/testcases/kernel/power_management/runpwtests_exclusive01.sh<br>
&gt; -+++ b/testcases/kernel/power_management/runpwtests_exclusive01.sh<br>
&gt; -@@ -35,7 +35,7 @@ else<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0max_sched_smt=3D1<br>
&gt; - fi<br>
&gt; -<br>
&gt; --tst_test_cmds python<br>
&gt; -+tst_test_cmds python3<br>
&gt; -<br>
&gt; - hyper_threaded=3D$(is_hyper_threaded)<br>
&gt; - multi_socket=3D$(is_multi_socket)<br>
&gt; -diff --git a/testcases/kernel/power_management/runpwtests_exclusive02=
.sh b/testcases/kernel/power_management/runpwtests_exclusive02.sh<br>
&gt; -index e107fce35..2cd0ecb05 100755<br>
&gt; ---- a/testcases/kernel/power_management/runpwtests_exclusive02.sh<br>
&gt; -+++ b/testcases/kernel/power_management/runpwtests_exclusive02.sh<br>
&gt; -@@ -33,7 +33,7 @@ else<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0max_sched_smt=3D1<br>
&gt; - fi<br>
&gt; -<br>
&gt; --tst_test_cmds python<br>
&gt; -+tst_test_cmds python3<br>
&gt; -<br>
&gt; - hyper_threaded=3D$(is_hyper_threaded)<br>
&gt; - multi_socket=3D$(is_multi_socket)<br>
&gt; -diff --git a/testcases/kernel/power_management/runpwtests_exclusive03=
.sh b/testcases/kernel/power_management/runpwtests_exclusive03.sh<br>
&gt; -index 490344bb3..ab3a5d11d 100755<br>
&gt; ---- a/testcases/kernel/power_management/runpwtests_exclusive03.sh<br>
&gt; -+++ b/testcases/kernel/power_management/runpwtests_exclusive03.sh<br>
&gt; -@@ -35,7 +35,7 @@ else<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0max_sched_smt=3D1<br>
&gt; - fi<br>
&gt; -<br>
&gt; --tst_test_cmds python<br>
&gt; -+tst_test_cmds python3<br>
&gt; -<br>
&gt; - hyper_threaded=3D$(is_hyper_threaded)<br>
&gt; - multi_socket=3D$(is_multi_socket)<br>
&gt; -diff --git a/testcases/kernel/power_management/runpwtests_exclusive04=
.sh b/testcases/kernel/power_management/runpwtests_exclusive04.sh<br>
&gt; -index 978ca02ae..438ef603f 100755<br>
&gt; ---- a/testcases/kernel/power_management/runpwtests_exclusive04.sh<br>
&gt; -+++ b/testcases/kernel/power_management/runpwtests_exclusive04.sh<br>
&gt; -@@ -27,7 +27,7 @@ export TST_TOTAL=3D2<br>
&gt; - # Checking test environment<br>
&gt; - check_kervel_arch<br>
&gt; -<br>
&gt; --tst_test_cmds python<br>
&gt; -+tst_test_cmds python3<br>
&gt; -<br>
&gt; - hyper_threaded=3D$(is_hyper_threaded)<br>
&gt; - multi_socket=3D$(is_multi_socket)<br>
&gt; -diff --git a/testcases/kernel/power_management/runpwtests_exclusive05=
.sh b/testcases/kernel/power_management/runpwtests_exclusive05.sh<br>
&gt; -index a0dad5834..3a9afdbf2 100755<br>
&gt; ---- a/testcases/kernel/power_management/runpwtests_exclusive05.sh<br>
&gt; -+++ b/testcases/kernel/power_management/runpwtests_exclusive05.sh<br>
&gt; -@@ -35,7 +35,7 @@ else<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0max_sched_smt=3D1<br>
&gt; - fi<br>
&gt; -<br>
&gt; --tst_test_cmds python<br>
&gt; -+tst_test_cmds python3<br>
&gt; -<br>
&gt; - hyper_threaded=3D$(is_hyper_threaded)<br>
&gt; - multi_socket=3D$(is_multi_socket)<br>
&gt; -diff --git a/testcases/network/nfsv4/acl/runtest b/testcases/network/=
nfsv4/acl/runtest<br>
&gt; -index d2e1b4c49..a859e85bc 100755<br>
&gt; ---- a/testcases/network/nfsv4/acl/runtest<br>
&gt; -+++ b/testcases/network/nfsv4/acl/runtest<br>
&gt; -@@ -22,7 +22,7 @@ do<br>
&gt; - done<br>
&gt; -<br>
&gt; - #=C2=A0 creation of users on the remote machine (removed only at the=
 end of the tests)<br>
&gt; --rsh -n $REMOTEHOST python $PWD/create_users.py -u 50 -g 50<br>
&gt; -+rsh -n $REMOTEHOST python3 $PWD/create_users.py -u 50 -g 50<br>
&gt; -<br>
&gt; - echo &quot;Starting ACL testing&quot;<br>
&gt; -<br>
&gt; -@@ -51,19 +51,19 @@ echo &quot;Basic tests finished&quot;<br>
&gt; -<br>
&gt; - echo &quot;LONG ACL TEST&quot;<br>
&gt; - echo &quot;creating necessary users and groups&quot;<br>
&gt; --python create_users.py -u 50 -g 50<br>
&gt; -+python3 create_users.py -u 50 -g 50<br>
&gt; - echo &quot;creating necessary users and groups on the remote host&qu=
ot;<br>
&gt; - mkdir $NFSMNTDIR/lacl-testdir<br>
&gt; --python test_long_acl.py -l $MAXLENGTH -p $NFSMNTDIR/lacl-testdir<br>
&gt; -+python3 test_long_acl.py -l $MAXLENGTH -p $NFSMNTDIR/lacl-testdir<br=
>
&gt; - rm -rf $NFSMNTDIR/lacl-testdir<br>
&gt; - echo &quot;Long ACL test OK with $MAXLENGTH entries&quot;<br>
&gt; - echo &quot;ACL STRESSING TEST&quot;<br>
&gt; --python setacl_stress.py -n 100 -u $USER_NB -g $GRP_NB -f $FILE_NB -p=
 $NFSMNTDIR<br>
&gt; -+python3 setacl_stress.py -n 100 -u $USER_NB -g $GRP_NB -f $FILE_NB -=
p $NFSMNTDIR<br>
&gt; -<br>
&gt; - # remove local an remote users<br>
&gt; --python cleanusers.py<br>
&gt; --python cleangroups.py<br>
&gt; --rsh -n $REMOTEHOST python $PWD/cleanusers.py<br>
&gt; -+python3 cleanusers.py<br>
&gt; -+python3 cleangroups.py<br>
&gt; -+rsh -n $REMOTEHOST python3 $PWD/cleanusers.py<br>
&gt; -<br>
&gt; - echo &quot;Test OK&quot;<br>
&gt; -<br>
&gt; -diff --git a/testcases/realtime/func/pi-tests/run_auto.sh b/testcases=
/realtime/func/pi-tests/run_auto.sh<br>
&gt; -index d13026049..277988568 100755<br>
&gt; ---- a/testcases/realtime/func/pi-tests/run_auto.sh<br>
&gt; -+++ b/testcases/realtime/func/pi-tests/run_auto.sh<br>
&gt; -@@ -15,15 +15,15 @@ $SCRIPTS_DIR/run_c_files.sh $profile testpi-0<br>
&gt; -<br>
&gt; - export LOG_FILE=3D&quot;$LOG_DIR/$LOG_FORMAT-testpi-1.log&quot;<br>
&gt; - $SCRIPTS_DIR/run_c_files.sh $profile testpi-1<br>
&gt; --PYTHONPATH=3D../../=C2=A0 python parse-testpi1.py $LOG_FILE 2&gt;&am=
p;1 | tee -a $LOG_FILE<br>
&gt; -+PYTHONPATH=3D../../=C2=A0 python3 parse-testpi1.py $LOG_FILE 2&gt;&a=
mp;1 | tee -a $LOG_FILE<br>
&gt; -<br>
&gt; - export LOG_FILE=3D&quot;$LOG_DIR/$LOG_FORMAT-testpi-2.log&quot;<br>
&gt; - $SCRIPTS_DIR/run_c_files.sh $profile testpi-2<br>
&gt; --PYTHONPATH=3D../../=C2=A0 python parse-testpi2.py $LOG_FILE 2&gt;&am=
p;1 | tee -a $LOG_FILE<br>
&gt; -+PYTHONPATH=3D../../=C2=A0 python3 parse-testpi2.py $LOG_FILE 2&gt;&a=
mp;1 | tee -a $LOG_FILE<br>
&gt; -<br>
&gt; - export LOG_FILE=3D&quot;$LOG_DIR/$LOG_FORMAT-testpi-4.log&quot;<br>
&gt; - $SCRIPTS_DIR/run_c_files.sh $profile testpi-4<br>
&gt; --PYTHONPATH=3D../../=C2=A0 python parse-testpi1.py $LOG_FILE 2&gt;&am=
p;1 | tee -a $LOG_FILE<br>
&gt; -+PYTHONPATH=3D../../=C2=A0 python3 parse-testpi1.py $LOG_FILE 2&gt;&a=
mp;1 | tee -a $LOG_FILE<br>
&gt; -<br>
&gt; -<br>
&gt; - export LOG_FILE=3D&quot;&quot;<br>
&gt; diff --git a/meta/recipes-extended/ltp/ltp/0001-ustat02-Fix-EFAULT-in-=
32bit-compatibility-mode.patch b/meta/recipes-extended/ltp/ltp/0001-ustat02=
-Fix-EFAULT-in-32bit-compatibility-mode.patch<br>
&gt; deleted file mode 100644<br>
&gt; index c936b788fe1..00000000000<br>
&gt; --- a/meta/recipes-extended/ltp/ltp/0001-ustat02-Fix-EFAULT-in-32bit-c=
ompatibility-mode.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,36 +0,0 @@<br>
&gt; -From 156776a3e29491b363fdc9811912e1298655d060 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Steven Price &lt;<a href=3D"mailto:steven.price@arm.com" target=
=3D"_blank">steven.price@arm.com</a>&gt;<br>
&gt; -Date: Fri, 19 Jul 2019 13:48:17 +0100<br>
&gt; -Subject: [PATCH] ustat02: Fix EFAULT in 32bit compatibility mode<br>
&gt; -<br>
&gt; -The size of dev_t is larger than 32 bits which causes the dev argumen=
t<br>
&gt; -to be passed incorrectly. On Arm this means that the EFAULT test case=
<br>
&gt; -actually returns EINVAL because the device number isn&#39;t recognise=
d.<br>
&gt; -<br>
&gt; -Signed-off-by: Steven Price &lt;<a href=3D"mailto:steven.price@arm.co=
m" target=3D"_blank">steven.price@arm.com</a>&gt;<br>
&gt; -Acked-by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=3D"=
_blank">liwang@redhat.com</a>&gt;<br>
&gt; -<br>
&gt; -Upstream-Status: Backport<br>
&gt; -[<a href=3D"https://github.com/linux-test-project/ltp/commit/156776a3=
e29491b363fdc9811912e1298655d060" rel=3D"noreferrer" target=3D"_blank">http=
s://github.com/linux-test-project/ltp/commit/156776a3e29491b363fdc9811912e1=
298655d060</a>]<br>
&gt; -<br>
&gt; -Signed-off-by: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com" tar=
get=3D"_blank">zhe.he@windriver.com</a>&gt;<br>
&gt; ----<br>
&gt; - testcases/kernel/syscalls/ustat/ustat02.c | 2 +-<br>
&gt; - 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; -<br>
&gt; -diff --git a/testcases/kernel/syscalls/ustat/ustat02.c b/testcases/ke=
rnel/syscalls/ustat/ustat02.c<br>
&gt; -index 9bbe4f3..1a0e9e0 100644<br>
&gt; ---- a/testcases/kernel/syscalls/ustat/ustat02.c<br>
&gt; -+++ b/testcases/kernel/syscalls/ustat/ustat02.c<br>
&gt; -@@ -36,7 +36,7 @@ int TST_TOTAL =3D ARRAY_SIZE(tc);<br>
&gt; -<br>
&gt; - void run(unsigned int test)<br>
&gt; - {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 TEST(tst_syscall(__NR_ustat, *tc[test].dev, tc[=
test].buf));<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 TEST(tst_syscall(__NR_ustat, (unsigned int)*tc[=
test].dev, tc[test].buf));<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((TST_RET =3D=3D -1) &amp;&amp; (TST_ER=
R =3D=3D tc[test].exp_errno))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TPASS =
| TTERRNO, &quot;ustat(2) expected failure&quot;);<br>
&gt; ---<br>
&gt; -2.7.4<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-extended/ltp/ltp/0002-check-for-RES_USE_INET=
6-during-configure.patch b/meta/recipes-extended/ltp/ltp/0002-check-for-RES=
_USE_INET6-during-configure.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 12e47eb2b61..00000000000<br>
&gt; --- a/meta/recipes-extended/ltp/ltp/0002-check-for-RES_USE_INET6-durin=
g-configure.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,68 +0,0 @@<br>
&gt; -From 7bc134545b7beb09717a60541530c20a1a5740d3 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
&gt; -Date: Fri, 26 Jul 2019 10:55:28 -0700<br>
&gt; -Subject: [PATCH 2/2] check for RES_USE_INET6 during configure<br>
&gt; -<br>
&gt; -glibc 2.30 has remove RES_USE_INET6 define which has been on its way =
out<br>
&gt; -since 2.26 release, this check ensures that we detect it before using=
 it<br>
&gt; -<br>
&gt; -Upstream-Status: Submitted [<a href=3D"http://lists.linux.it/pipermai=
l/ltp/2019-July/012955.html" rel=3D"noreferrer" target=3D"_blank">http://li=
sts.linux.it/pipermail/ltp/2019-July/012955.html</a>]<br>
&gt; -Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ----<br>
&gt; - <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 13 +++++++++++++<br>
&gt; - testcases/network/multicast/mc_gethost/mc_gethost.c |=C2=A0 6 ++++++=
<br>
&gt; - 2 files changed, 19 insertions(+)<br>
&gt; -<br>
&gt; -diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" targe=
t=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"nore=
ferrer" target=3D"_blank">configure.ac</a><br>
&gt; -index 2255b5c181..ed7acccb01 100644<br>
&gt; ---- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
&gt; -+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
&gt; -@@ -91,6 +91,19 @@ AC_CHECK_FUNCS([ \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0vmsplice \<br>
&gt; - ])<br>
&gt; -<br>
&gt; -+#check defines<br>
&gt; -+AC_MSG_CHECKING([for RES_USE_INET6])<br>
&gt; -+AC_COMPILE_IFELSE( [AC_LANG_PROGRAM([[#include &lt;resolv.h&gt;]],<b=
r>
&gt; -+=C2=A0 [[char dummy[RES_USE_INET6];]])],<br>
&gt; -+=C2=A0 [<br>
&gt; -+=C2=A0 =C2=A0 AC_MSG_RESULT([yes])<br>
&gt; -+=C2=A0 =C2=A0 AC_DEFINE_UNQUOTED([HAVE_RES_USE_INET6], 1, [Define to=
 1 if you have the RES_USE_INET6 macro.])<br>
&gt; -+=C2=A0 ],<br>
&gt; -+=C2=A0 [<br>
&gt; -+=C2=A0 =C2=A0 AC_MSG_RESULT([no])<br>
&gt; -+=C2=A0 =C2=A0 AC_DEFINE_UNQUOTED([HAVE_RES_USE_INET6], 0, [Define to=
 1 if you have the RES_USE_INET6 macro.])<br>
&gt; -+=C2=A0 ]<br>
&gt; -+)<br>
&gt; - # Tools knobs<br>
&gt; -<br>
&gt; - # Expect<br>
&gt; -diff --git a/testcases/network/multicast/mc_gethost/mc_gethost.c b/te=
stcases/network/multicast/mc_gethost/mc_gethost.c<br>
&gt; -index 9cc15d086b..d1cae5441a 100644<br>
&gt; ---- a/testcases/network/multicast/mc_gethost/mc_gethost.c<br>
&gt; -+++ b/testcases/network/multicast/mc_gethost/mc_gethost.c<br>
&gt; -@@ -17,6 +17,8 @@<br>
&gt; - #include &lt;string.h&gt;<br>
&gt; - #include &lt;stdlib.h&gt;<br>
&gt; -<br>
&gt; -+#include &quot;config.h&quot;<br>
&gt; -+<br>
&gt; - #ifndef LOG_PERROR<br>
&gt; - #define LOG_PERROR 0<br>
&gt; - #endif<br>
&gt; -@@ -50,8 +52,12 @@ usage:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0argv++, argc--=
;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (argc &gt;=3D 1 &amp;&amp; !strcmp(*arg=
v, &quot;-6&quot;)) {<br>
&gt; -+#if HAVE_RES_USE_INET6<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0af =3D AF_INET=
6, size =3D IN6ADDRSZ;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_res.options |=
=3D RES_USE_INET6;<br>
&gt; -+#else<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 af =3D AF_INET, siz=
e =3D INADDRSZ;<br>
&gt; -+#endif<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0argv++, argc--=
;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (argc &gt;=3D 1 &amp;&amp; !strcmp(*arg=
v, &quot;-f&quot;)) {<br>
&gt; ---<br>
&gt; -2.22.0<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-extended/ltp/ltp/0003-Check-if-__GLIBC_PRERE=
Q-is-defined-before-using-it.patch b/meta/recipes-extended/ltp/ltp/0003-Che=
ck-if-__GLIBC_PREREQ-is-defined-before-using-it.patch<br>
&gt; index c0f69ecf5fc..df3e8831f54 100644<br>
&gt; --- a/meta/recipes-extended/ltp/ltp/0003-Check-if-__GLIBC_PREREQ-is-de=
fined-before-using-it.patch<br>
&gt; +++ b/meta/recipes-extended/ltp/ltp/0003-Check-if-__GLIBC_PREREQ-is-de=
fined-before-using-it.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 29ce9fdab3bd34e69d73b5b890795559c06553f7 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 1ce47a6ed811fd78ed04ea2f82e6321c6bca57b6 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Thu, 7 Jan 2016 19:40:08 +0000<br>
&gt;=C2=A0 Subject: [PATCH] Check if __GLIBC_PREREQ is defined before using=
 it<br>
&gt; @@ -10,16 +10,17 @@ Upstream-Status: Pending<br>
&gt;<br>
&gt;=C2=A0 Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com=
" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windriver.c=
om" target=3D"_blank">yi.zhao@windriver.com</a>&gt;<br>
&gt; +<br>
&gt;=C2=A0 ---<br>
&gt;=C2=A0 =C2=A0testcases/kernel/syscalls/accept4/accept4_01.c | 7 +++++++=
<br>
&gt;=C2=A0 =C2=A01 file changed, 7 insertions(+)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/testcases/kernel/syscalls/accept4/accept4_01.c b/te=
stcases/kernel/syscalls/accept4/accept4_01.c<br>
&gt; -index dd289cf..76aa969 100644<br>
&gt; +index 29e18f27d..07444a46f 100644<br>
&gt;=C2=A0 --- a/testcases/kernel/syscalls/accept4/accept4_01.c<br>
&gt;=C2=A0 +++ b/testcases/kernel/syscalls/accept4/accept4_01.c<br>
&gt;=C2=A0 @@ -38,6 +38,7 @@<br>
&gt; - static struct sockaddr_in conn_addr;<br>
&gt; + static struct sockaddr_in *conn_addr, *accept_addr;<br>
&gt;=C2=A0 =C2=A0static int listening_fd;<br>
&gt;<br>
&gt;=C2=A0 +#if defined(__GLIBC__) &amp;&amp; defined(__GLIBC_PREREQ)<br>
&gt; @@ -34,25 +35,21 @@ index dd289cf..76aa969 100644<br>
&gt;<br>
&gt;=C2=A0 =C2=A0static int create_listening_socket(void)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; -@@ -115,6 +117,7 @@ static void verify_accept4(unsigned int nr)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_CONNECT(connfd, (struct sockaddr *)&a=
mp;conn_addr, sizeof(conn_addr));<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0addrlen =3D sizeof(claddr);<br>
&gt; +@@ -114,12 +116,17 @@ static void verify_accept4(unsigned int nr)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_CONNECT(connfd, (struct sockaddr *)co=
nn_addr, sizeof(*conn_addr));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0addrlen =3D sizeof(*accept_addr);<br>
&gt;<br>
&gt;=C2=A0 +#if defined(__GLIBC__) &amp;&amp; defined(__GLIBC_PREREQ)<br>
&gt;=C2=A0 =C2=A0#if !(__GLIBC_PREREQ(2, 10))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0TEST(accept4_01(listening_fd, (struct sock=
addr *)&amp;claddr, &amp;addrlen,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0TEST(accept4_01(listening_fd, (struct sock=
addr *)accept_addr, &amp;addrlen,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcase-&gt;cloexec | tcase-&=
gt;nonblock));<br>
&gt; -@@ -122,6 +125,10 @@ static void verify_accept4(unsigned int nr)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0TEST(accept4(listening_fd, (struct sockadd=
r *)&amp;claddr, &amp;addrlen,<br>
&gt; + #else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0TEST(accept4(listening_fd, (struct sockadd=
r *)accept_addr, &amp;addrlen,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcase-&gt;cloexec | tcase-&=
gt;nonblock));<br>
&gt; - #endif<br>
&gt; ++#endif<br>
&gt;=C2=A0 +#else<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 TEST(accept4(listening_fd, (struct sockadd=
r *)&amp;claddr, &amp;addrlen,<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcase-&gt;cloexec | tcase-&gt;non=
block));<br>
&gt; -+#endif<br>
&gt; + #endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (TST_RET =3D=3D -1) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (TST_E=
RR =3D=3D ENOSYS)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0tst_brk(TCONF, &quot;syscall __NR_accept4 not supported&quot;=
);<br>
&gt; ---<br>
&gt; -2.7.4<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-extended/ltp/ltp/0010-shmctl01-don-t-use-har=
dcoded-index-0-for-SHM_STAT-te.patch b/meta/recipes-extended/ltp/ltp/0010-s=
hmctl01-don-t-use-hardcoded-index-0-for-SHM_STAT-te.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 8704e5ffe8a..00000000000<br>
&gt; --- a/meta/recipes-extended/ltp/ltp/0010-shmctl01-don-t-use-hardcoded-=
index-0-for-SHM_STAT-te.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,82 +0,0 @@<br>
&gt; -From 794933b38354a2612cf2c471f11798b306f35315 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.com" target=
=3D"_blank">jstancek@redhat.com</a>&gt;<br>
&gt; -Date: Mon, 20 May 2019 20:47:20 +0200<br>
&gt; -Subject: [PATCH] shmctl01: don&#39;t use hardcoded index =3D=3D 0 for=
 SHM_STAT test<br>
&gt; -<br>
&gt; -Test fails on SHM_STAT testcase:<br>
&gt; -=C2=A0 =C2=A0shmctl01=C2=A0 =C2=A0 5=C2=A0 TFAIL=C2=A0 :=C2=A0 shmctl=
01.c:173: shmctl01 call failed<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D 22 : Invalid argument<br>
&gt; -=C2=A0 =C2=A0shmctl(0, SHM_STAT, 0x601060)=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0=3D -EINVAL<br>
&gt; -<br>
&gt; -since following commit:<br>
&gt; -=C2=A0 =C2=A0commit 99db46ea292780cd978d56932d9445b1e8bdafe8<br>
&gt; -=C2=A0 =C2=A0Author: Manfred Spraul &lt;<a href=3D"mailto:manfred@col=
orfullife.com" target=3D"_blank">manfred@colorfullife.com</a>&gt;<br>
&gt; -=C2=A0 =C2=A0Date:=C2=A0 =C2=A0Tue May 14 15:46:36 2019 -0700<br>
&gt; -=C2=A0 =C2=A0 =C2=A0ipc: do cyclic id allocation for the ipc object.<=
br>
&gt; -<br>
&gt; -Don&#39;t rely on index 0 being always available, but instead<br>
&gt; -use (maximum) index returned by SHM_INFO.<br>
&gt; -<br>
&gt; -Signed-off-by: Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.com"=
 target=3D"_blank">jstancek@redhat.com</a>&gt;<br>
&gt; -Reviewed-by: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=
=3D"_blank">pvorel@suse.cz</a>&gt;<br>
&gt; -Acked-by: Cyril Hrubis &lt;<a href=3D"mailto:chrubis@suse.cz" target=
=3D"_blank">chrubis@suse.cz</a>&gt;<br>
&gt; -<br>
&gt; -Upstream-Status: Backport<br>
&gt; -[<a href=3D"https://github.com/linux-test-project/ltp/commit/db0a43d9=
388be2c347a8306751bbe6bec086d062" rel=3D"noreferrer" target=3D"_blank">http=
s://github.com/linux-test-project/ltp/commit/db0a43d9388be2c347a8306751bbe6=
bec086d062</a>]<br>
&gt; -<br>
&gt; -Signed-off-by: Hongzhi Song &lt;<a href=3D"mailto:hongzhi.song@windri=
ver.com" target=3D"_blank">hongzhi.song@windriver.com</a>&gt;<br>
&gt; -Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windriver.com" t=
arget=3D"_blank">yi.zhao@windriver.com</a>&gt;<br>
&gt; ----<br>
&gt; - testcases/kernel/syscalls/ipc/shmctl/shmctl01.c | 21 +++++++++++++++=
+++---<br>
&gt; - 1 file changed, 18 insertions(+), 3 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/testcases/kernel/syscalls/ipc/shmctl/shmctl01.c b/testca=
ses/kernel/syscalls/ipc/shmctl/shmctl01.c<br>
&gt; -index 1b46977..52bf23a 100644<br>
&gt; ---- a/testcases/kernel/syscalls/ipc/shmctl/shmctl01.c<br>
&gt; -+++ b/testcases/kernel/syscalls/ipc/shmctl/shmctl01.c<br>
&gt; -@@ -79,6 +79,7 @@ static void func_info(int ret);<br>
&gt; -<br>
&gt; - /* Check routine for SHM_STAT */<br>
&gt; - static void func_sstat(int ret);<br>
&gt; -+static void func_sstat_setup(void);<br>
&gt; -<br>
&gt; - /* Check routine for SHM_LOCK */<br>
&gt; - static void func_lock(int ret);<br>
&gt; -@@ -110,7 +111,7 @@ static struct test_case_t {<br>
&gt; - #endif<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0{&amp;shm_id_1, IPC_SET, &amp;buf, func_se=
t, set_setup},<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0{&amp;shm_id_1, IPC_INFO, (struct shmid_ds=
 *) &amp;info, func_info, NULL},<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 {&amp;shm_index, SHM_STAT, &amp;buf, func_sstat=
, NULL},<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 {&amp;shm_index, SHM_STAT, &amp;buf, func_sstat=
, func_sstat_setup},<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0{&amp;shm_id_1, SHM_LOCK, NULL, func_lock,=
 NULL},<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0{&amp;shm_id_1, SHM_UNLOCK, NULL, func_unl=
ock, NULL},<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0{&amp;shm_id_1, IPC_RMID, NULL, func_rmid,=
 NULL},<br>
&gt; -@@ -407,9 +408,23 @@ static void func_info(int ret)<br>
&gt; - static void func_sstat(int ret)<br>
&gt; - {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &gt;=3D 0)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_resm(TPASS, &qu=
ot;get correct shared memory id&quot;);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_resm(TPASS, &qu=
ot;get correct shared memory id for index: %d&quot;,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 shm_index);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_resm(TFAIL, &qu=
ot;shared memory id is incorrect&quot;);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_resm(TFAIL, &qu=
ot;shared memory id is incorrect, index: %d&quot;,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 shm_index);<br>
&gt; -+}<br>
&gt; -+<br>
&gt; -+static void func_sstat_setup(void)<br>
&gt; -+{<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 struct shm_info tmp;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 int ret;<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 ret =3D shmctl(shm_id_1, SHM_INFO, (void *)&amp=
;tmp);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 if (ret &lt; 0)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_resm(TFAIL|TERR=
NO, &quot;shmctl(SHM_INFO)&quot;);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 else<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shm_index =3D ret;<=
br>
&gt; - }<br>
&gt; -<br>
&gt; - static void func_lock(int ret)<br>
&gt; ---<br>
&gt; -2.7.4<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-extended/ltp/ltp/0011-direct_io-diotest4-dro=
p-MAP_FIXED.patch b/meta/recipes-extended/ltp/ltp/0011-direct_io-diotest4-d=
rop-MAP_FIXED.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 9cd188f6567..00000000000<br>
&gt; --- a/meta/recipes-extended/ltp/ltp/0011-direct_io-diotest4-drop-MAP_F=
IXED.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,56 +0,0 @@<br>
&gt; -From f210d7e19b721041f31b7f258a169f89dc850303 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.com" target=
=3D"_blank">jstancek@redhat.com</a>&gt;<br>
&gt; -Date: Thu, 4 Jul 2019 16:45:23 +0200<br>
&gt; -Subject: [PATCH] direct_io/diotest4: drop MAP_FIXED<br>
&gt; -<br>
&gt; -Hongzhi reports that this test is failing on mips64 with 5.1+:<br>
&gt; -=C2=A0 diotest4 10 TBROK : diotest4.c:368: can&#39;t mmap file: Inval=
id argument<br>
&gt; -=C2=A0 diotest4 11 TBROK : diotest4.c:368: Remaining cases broken<br>
&gt; -I could reproduce it on emulated 5kc-malta, running 5.2.0-rc7.<br>
&gt; -<br>
&gt; -Test is trying to map into area immediately following heap as MAP_SHA=
RED,<br>
&gt; -but it used wrong alignment (fixed by &#39;lapi/mmap.h: include confi=
g.h&#39;).<br>
&gt; -<br>
&gt; -Usage of MAP_FIXED seems unnecessary, so drop that too and let the ke=
rnel<br>
&gt; -pick an address.<br>
&gt; -<br>
&gt; -Reported-by: Hongzhi.Song &lt;<a href=3D"mailto:hongzhi.song@windrive=
r.com" target=3D"_blank">hongzhi.song@windriver.com</a>&gt;<br>
&gt; -Signed-off-by: Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.com"=
 target=3D"_blank">jstancek@redhat.com</a>&gt;<br>
&gt; -Acked-by: Cyril Hrubis &lt;<a href=3D"mailto:chrubis@suse.cz" target=
=3D"_blank">chrubis@suse.cz</a>&gt;<br>
&gt; -<br>
&gt; -Upstream-Status: Backport<br>
&gt; -[<a href=3D"https://github.com/linux-test-project/ltp/commit/f5444eee=
abf252b8884b9465d277b6af853819e3" rel=3D"noreferrer" target=3D"_blank">http=
s://github.com/linux-test-project/ltp/commit/f5444eeeabf252b8884b9465d277b6=
af853819e3</a>]<br>
&gt; -<br>
&gt; -Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windriver.com" t=
arget=3D"_blank">yi.zhao@windriver.com</a>&gt;<br>
&gt; ----<br>
&gt; - testcases/kernel/io/direct_io/diotest4.c | 8 ++------<br>
&gt; - 1 file changed, 2 insertions(+), 6 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/testcases/kernel/io/direct_io/diotest4.c b/testcases/ker=
nel/io/direct_io/diotest4.c<br>
&gt; -index e4616e4..bf200cd 100644<br>
&gt; ---- a/testcases/kernel/io/direct_io/diotest4.c<br>
&gt; -+++ b/testcases/kernel/io/direct_io/diotest4.c<br>
&gt; -@@ -352,18 +352,14 @@ int main(int argc, char *argv[])<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0total++;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Test-10: read, write to a mmaped file *=
/<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 shm_base =3D (char *)(((long)sbrk(0) + (shmsz -=
 1)) &amp; ~(shmsz - 1));<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 if (shm_base =3D=3D NULL) {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_brkm(TBROK, cle=
anup, &quot;sbrk failed: %s&quot;, strerror(errno));<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0offset =3D 4096;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0count =3D bufsize;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((fd =3D open(filename, O_DIRECT | O_RD=
WR)) &lt; 0) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brkm(TBROK=
, cleanup, &quot;can&#39;t open %s: %s&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 filename, strerror(errno));<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 shm_base =3D mmap(shm_base, 0x100000, PROT_READ=
 | PROT_WRITE,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 MAP_SHARED | MAP_FIXED, fd, 0);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 shm_base =3D mmap(0, 0x100000, PROT_READ | PROT=
_WRITE,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 MAP_SHARED, fd, 0);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (shm_base =3D=3D (caddr_t) - 1) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brkm(TBROK=
, cleanup, &quot;can&#39;t mmap file: %s&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 strerror(errno));<br>
&gt; ---<br>
&gt; -2.7.4<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-extended/ltp/ltp/0012-getrlimit03-adjust-a-b=
it-of-code-to-compatiable-with.patch b/meta/recipes-extended/ltp/ltp/0012-g=
etrlimit03-adjust-a-bit-of-code-to-compatiable-with.patch<br>
&gt; deleted file mode 100644<br>
&gt; index aecbc80e9b5..00000000000<br>
&gt; --- a/meta/recipes-extended/ltp/ltp/0012-getrlimit03-adjust-a-bit-of-c=
ode-to-compatiable-with.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,64 +0,0 @@<br>
&gt; -From 4ac747c1f7ff8e2ec2567d6672822e95a9b56e55 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: &quot;Hongzhi.Song&quot; &lt;<a href=3D"mailto:hongzhi.song@win=
driver.com" target=3D"_blank">hongzhi.song@windriver.com</a>&gt;<br>
&gt; -Date: Mon, 15 Jul 2019 03:39:06 -0400<br>
&gt; -Subject: [PATCH] getrlimit03: adjust a bit of code to compatiable wit=
h mips32<br>
&gt; -<br>
&gt; -Error info:<br>
&gt; -getrlimit03.c:104: FAIL: __NR_prlimit64(0) had rlim_cur =3D<br>
&gt; -ffffffffffffffff but __NR_getrlimit(0) had rlim_cur =3D 7fffffff<br>
&gt; -<br>
&gt; -According to kernel code: [arch/mips/include/uapi/asm/resource.h]<br>
&gt; -RLIM_INFINITY is set to 0x7fffffffUL instead of ULONG_MAX on mips32.<=
br>
&gt; -<br>
&gt; - /*<br>
&gt; - * SuS says limits have to be unsigned.<br>
&gt; - * Which makes a ton more sense anyway,<br>
&gt; - * but we keep the old value on MIPS32,<br>
&gt; - * for compatibility:<br>
&gt; - */<br>
&gt; - #ifndef __mips64<br>
&gt; - # define RLIM_INFINITY=C2=A0 =C2=A0 =C2=A0 0x7fffffffUL<br>
&gt; - #endif<br>
&gt; -<br>
&gt; -Adding conditional statement about mips to fix this.<br>
&gt; -<br>
&gt; -Signed-off-by: Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.com"=
 target=3D"_blank">jstancek@redhat.com</a>&gt;<br>
&gt; -Signed-off-by: Hongzhi.Song &lt;<a href=3D"mailto:hongzhi.song@windri=
ver.com" target=3D"_blank">hongzhi.song@windriver.com</a>&gt;<br>
&gt; -<br>
&gt; -Upstream-Status: Backport<br>
&gt; -[<a href=3D"https://github.com/linux-test-project/ltp/commit/7a3bca63=
cd7f059d490b6274f0fdf3247be93fde" rel=3D"noreferrer" target=3D"_blank">http=
s://github.com/linux-test-project/ltp/commit/7a3bca63cd7f059d490b6274f0fdf3=
247be93fde</a>]<br>
&gt; -<br>
&gt; -Signed-off-by: Hongzhi.Song &lt;<a href=3D"mailto:hongzhi.song@windri=
ver.com" target=3D"_blank">hongzhi.song@windriver.com</a>&gt;<br>
&gt; ----<br>
&gt; - testcases/kernel/syscalls/getrlimit/getrlimit03.c | 8 +++++++-<br>
&gt; - 1 file changed, 7 insertions(+), 1 deletion(-)<br>
&gt; -<br>
&gt; -diff --git a/testcases/kernel/syscalls/getrlimit/getrlimit03.c b/test=
cases/kernel/syscalls/getrlimit/getrlimit03.c<br>
&gt; -index e4d56c4..319bc49 100644<br>
&gt; ---- a/testcases/kernel/syscalls/getrlimit/getrlimit03.c<br>
&gt; -+++ b/testcases/kernel/syscalls/getrlimit/getrlimit03.c<br>
&gt; -@@ -26,6 +26,7 @@<br>
&gt; -<br>
&gt; - #include &quot;tst_test.h&quot;<br>
&gt; - #include &quot;lapi/syscalls.h&quot;<br>
&gt; -+#include &quot;lapi/abisize.h&quot;<br>
&gt; -<br>
&gt; - /**<br>
&gt; -=C2=A0 * Linux provides an &quot;old&quot; getrlimit syscall handler =
that uses signed long,<br>
&gt; -@@ -61,7 +62,12 @@ struct rlimit_ulong {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long rlim_cur;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long rlim_max;<br>
&gt; - };<br>
&gt; --const unsigned long RLIM_INFINITY_UL =3D ULONG_MAX;<br>
&gt; -+<br>
&gt; -+#if defined(__mips__) &amp;&amp; defined(TST_ABI32)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 const unsigned long RLIM_INFINITY_UL =3D 0x7fff=
ffffUL;<br>
&gt; -+#else<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 const unsigned long RLIM_INFINITY_UL =3D ULONG_=
MAX;<br>
&gt; -+#endif<br>
&gt; -<br>
&gt; - static int getrlimit_ulong(int resource, struct rlimit_ulong *rlim)<=
br>
&gt; - {<br>
&gt; ---<br>
&gt; -2.7.4<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-extended/ltp/<a href=3D"http://ltp_20190517.=
bb" rel=3D"noreferrer" target=3D"_blank">ltp_20190517.bb</a> b/meta/recipes=
-extended/ltp/<a href=3D"http://ltp_20190930.bb" rel=3D"noreferrer" target=
=3D"_blank">ltp_20190930.bb</a><br>
&gt; similarity index 84%<br>
&gt; rename from meta/recipes-extended/ltp/<a href=3D"http://ltp_20190517.b=
b" rel=3D"noreferrer" target=3D"_blank">ltp_20190517.bb</a><br>
&gt; rename to meta/recipes-extended/ltp/<a href=3D"http://ltp_20190930.bb"=
 rel=3D"noreferrer" target=3D"_blank">ltp_20190930.bb</a><br>
&gt; index 60f749b4c01..9a436a52303 100644<br>
&gt; --- a/meta/recipes-extended/ltp/<a href=3D"http://ltp_20190517.bb" rel=
=3D"noreferrer" target=3D"_blank">ltp_20190517.bb</a><br>
&gt; +++ b/meta/recipes-extended/ltp/<a href=3D"http://ltp_20190930.bb" rel=
=3D"noreferrer" target=3D"_blank">ltp_20190930.bb</a><br>
&gt; @@ -27,7 +27,7 @@ CFLAGS_append_x86-64 =3D &quot; -fomit-frame-pointer=
&quot;<br>
&gt;<br>
&gt;=C2=A0 CFLAGS_append_powerpc64 =3D &quot; -D__SANE_USERSPACE_TYPES__&qu=
ot;<br>
&gt;=C2=A0 CFLAGS_append_mipsarchn64 =3D &quot; -D__SANE_USERSPACE_TYPES__&=
quot;<br>
&gt; -SRCREV =3D &quot;ac33ef87f0b9dc56533026435be3ea8c67ce86d2&quot;<br>
&gt; +SRCREV =3D &quot;c9707b465a08397569920b676345474f44327200&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/linux-test-=
project/ltp.git" rel=3D"noreferrer" target=3D"_blank">github.com/linux-test=
-project/ltp.git</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-build-Add-o=
ption-to-select-libc-implementation.patch \<br>
&gt; @@ -38,19 +38,8 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.co=
m/linux-test-project/ltp.git" rel=3D"noreferrer" target=3D"_blank">github.c=
om/linux-test-project/ltp.git</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0007-Fix-test_pr=
oc_kill-hanging.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0008-testcases-n=
etwork-nfsv4-acl-acl1.c-Security-fix-on-s.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0009-open_posix_=
testsuite-mmap24-2-Relax-condition-a-bit.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0010-shmctl01-don-t-u=
se-hardcoded-index-0-for-SHM_STAT-te.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0011-direct_io-diotes=
t4-drop-MAP_FIXED.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0012-getrlimit03-adju=
st-a-bit-of-code-to-compatiable-with.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Add-configure-ti=
me-check-for-getdents-getdents64-API.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-check-for-RES_US=
E_INET6-during-configure.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-syscalls-tgkill0=
3-wait-for-defunct-tid-to-get-detach.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-ustat02-Fix-EFAU=
LT-in-32bit-compatibility-mode.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-cve-meltdown.c-F=
ix-kernel-symbol-finding.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-testcases-use-py=
thon3-everywhere-to-run-python-scrip.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-syscall-rt_sigti=
medwait01-Fix-wrong-sigset-length-fo.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-cve-2017-17052-A=
void-unsafe-exits-in-threads.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-overcommit_memor=
y-update-for-mm-fix-false-positive-O.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-mkswap01.sh=
-Add-udevadm-trigger-before-swap-verifica.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-testcases-fix-an=
-absent-format-string-issue.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; --<br>
&gt; 2.17.1<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
</blockquote></div>
</blockquote></div></div>
</blockquote></div></div>

--000000000000fc2c900599c13e09--
