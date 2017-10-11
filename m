Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	by mail.openembedded.org (Postfix) with ESMTP id 4E38571A74
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 20:30:33 +0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id 72so4358416itk.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 13:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ctyrc4U/hx8I1fZ7XBmjdPd7K7w9ELHka5c++1B84hY=;
	b=tGzj7ZYiQ6sG0eyqyDW7opt2sQ53KnyiaSfjqzMlqRKP6ucZ5y/EAHx8X+K8p98/Bb
	X9X+WMjJnHaxHYXWmDIrSQrU2fd9kyvKnoa48xadFQ4fTB4RwttJPLH6rhus4pI75llU
	FKtmJxwi1LQrUgI/V1UTTNz0PKUDv+z5F5AlbX89MLWbs8+wFLHxyFpWtUCk9YxFcDlw
	T4q390pSAGymAzHUgPCkUbc4EvqTkBPiP0IUfOZVKCq60NRK/JBtTVR8im/nkyIHVCWx
	jHa6e15YppibdJTEj9huGg+giyNBnCl1YICPFzQIwwEC2h66ZqwryJamyatXHTkxDNZW
	WNQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ctyrc4U/hx8I1fZ7XBmjdPd7K7w9ELHka5c++1B84hY=;
	b=FRULnzJ8OX9v3nv7fQGKUtHNPiiQS8oa1F2e0PAGne1r1z28Rx5cgwky61o2LlNVd6
	E2WXZiCM0+EJvtNbzbrOxclQDXl1jzC67rTXEzlYbFZFKIJS3TKM329AbdeJJDXlO8Ll
	H3MNobRSKyHGumLRltfOpycTeyKSsTCiLfD72+gwXUFbchLVivw7mMgHiOPT38zBD1le
	atjb5f1NdkHuAMZluWw7tqpIXD1ovTfXrhrwjTsbOhN9lMca9hNkhgdRjQoO27fLpp/u
	hvz8H/uySoIuTm4f8Ehot9CNpbAF62g1/DxPNP+YSVaYH1zwuvMs2oKtnd5FhkSxdiXT
	V42g==
X-Gm-Message-State: AMCzsaX0u5W1Zz9rewxp0v9Be78KGZnS9XNkG27zy6GIXrF+EfKphMgo
	oU8jyG/BylmBYh7XHukjolp8Ru8iTSyNq6xlW5Rzqw==
X-Google-Smtp-Source: AOwi7QApeCrEa7UVdJMHAxDFXB9FU0zj0ESY3F1PfPHdsTGTWDPvb29DmhCDbtnolQN/HHGzWJ6M+VPcon/pBb4J34M=
X-Received: by 10.36.178.1 with SMTP id u1mr288355ite.120.1507753834203; Wed,
	11 Oct 2017 13:30:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.205 with HTTP; Wed, 11 Oct 2017 13:30:13 -0700 (PDT)
In-Reply-To: <20171005174751.30098-1-fathi.boudra@linaro.org>
References: <20171005174751.30098-1-fathi.boudra@linaro.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 11 Oct 2017 21:30:13 +0100
Message-ID: <CAJTo0La1Zfy9BAje3c6_RZ9AAUi_1qEF0cpOLOWGD32_Rxnttg@mail.gmail.com>
To: Fathi Boudra <fathi.boudra@linaro.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ltp: update to new upstream release 20170929
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
X-List-Received-Date: Wed, 11 Oct 2017 20:30:33 -0000
Content-Type: multipart/alternative; boundary="f403045d9c0eb27b38055b4b4b05"

--f403045d9c0eb27b38055b4b4b05
Content-Type: text/plain; charset="UTF-8"

Sorry:

| fanotify08.c:56:3: error: format not a string literal and no format
arguments [-Werror=format-security]
|    tst_res(TPASS, msg);
|    ^~~~~~~
| fanotify08.c:58:3: error: format not a string literal and no format
arguments [-Werror=format-security]
|    tst_res(TFAIL, msg);
|    ^~~~~~~

Ross

On 5 October 2017 at 18:47, Fathi Boudra <fathi.boudra@linaro.org> wrote:

> * Update SRCREV to match 20170929 release
> * Drop patches available in 20170929 release:
>   - 0037-ltp-fix-PAGE_SIZE-redefinition-and-O_CREAT-undeclear.patch
>   - 0038-commands-gdb01-replace-stdin-with-dev-null.patch
>
> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
> ---
>  ...E_SIZE-redefinition-and-O_CREAT-undeclear.patch | 113
> ---------------------
>  ...ommands-gdb01-replace-stdin-with-dev-null.patch |  34 -------
>  .../ltp/{ltp_20170516.bb => ltp_20170929.bb}       |   4 +-
>  3 files changed, 1 insertion(+), 150 deletions(-)
>  delete mode 100644 meta/recipes-extended/ltp/ltp/0037-ltp-fix-PAGE_SIZE-
> redefinition-and-O_CREAT-undeclear.patch
>  delete mode 100644 meta/recipes-extended/ltp/ltp/
> 0038-commands-gdb01-replace-stdin-with-dev-null.patch
>  rename meta/recipes-extended/ltp/{ltp_20170516.bb => ltp_20170929.bb}
> (96%)
>
> diff --git a/meta/recipes-extended/ltp/ltp/0037-ltp-fix-PAGE_SIZE-
> redefinition-and-O_CREAT-undeclear.patch b/meta/recipes-extended/ltp/
> ltp/0037-ltp-fix-PAGE_SIZE-redefinition-and-O_CREAT-undeclear.patch
> deleted file mode 100644
> index c8738ae0d4..0000000000
> --- a/meta/recipes-extended/ltp/ltp/0037-ltp-fix-PAGE_SIZE-
> redefinition-and-O_CREAT-undeclear.patch
> +++ /dev/null
> @@ -1,113 +0,0 @@
> -From a9d5595d2fa2ab252f1cabf63f4b65c3efbafeb9 Mon Sep 17 00:00:00 2001
> -From: Dengke Du <dengke.du@windriver.com>
> -Date: Thu, 10 Aug 2017 15:27:03 +0800
> -Subject: [PATCH] ltp: fix PAGE_SIZE redefinition and O_CREAT undeclear
> when
> - build with musl
> -
> -error 1:
> -
> -|stack_clash.c:50:22: error: expected identifier or '(' before numeric
> constant
> -| static unsigned long PAGE_SIZE;
> -
> -This is because the musl libc already contain PAGE_SIZE definition in
> limits.c,
> -we can check it here:
> -
> -    https://git.musl-libc.org/cgit/musl/tree/include/limits.h#n43
> -
> -error 2:
> -
> -|ck01.c:157:22: error: 'O_CREAT' undeclared (first use in this function);
> did you mean 'S_IREAD'?
> -|   fd = open(filename, O_CREAT | O_TRUNC | O_RDWR, 0644);
> -|                       ^~~~~~~
> -|                       S_IREAD
> -
> -This is because the musl libc put those in fcntl.h, so we should include
> that
> -file.
> -
> -Upstream-Status: Submitted [ https://github.com/linux-test-
> project/ltp/pull/194 ]
> -
> -Signed-off-by: Dengke Du <dengke.du@windriver.com>
> ----
> - testcases/cve/stack_clash.c               | 12 ++++++------
> - testcases/kernel/syscalls/flock/flock01.c |  1 +
> - testcases/kernel/syscalls/flock/flock02.c |  1 +
> - 3 files changed, 8 insertions(+), 6 deletions(-)
> -
> -diff --git a/testcases/cve/stack_clash.c b/testcases/cve/stack_clash.c
> -index 2ef1a82..7c45991 100644
> ---- a/testcases/cve/stack_clash.c
> -+++ b/testcases/cve/stack_clash.c
> -@@ -47,7 +47,7 @@
> - #include "tst_test.h"
> - #include "tst_safe_stdio.h"
> -
> --static unsigned long PAGE_SIZE;
> -+static unsigned long PAGE_SIZE_tst;
> - static unsigned long PAGE_MASK;
> - static unsigned long GAP_PAGES = 256;
> - static unsigned long THRESHOLD;
> -@@ -66,7 +66,7 @@ void exhaust_stack_into_sigsegv(void)
> -       exhaust_stack_into_sigsegv();
> - }
> -
> --#define MAPPED_LEN PAGE_SIZE
> -+#define MAPPED_LEN PAGE_SIZE_tst
> - static unsigned long mapped_addr;
> -
> - void segv_handler(int sig, siginfo_t *info, void *data
> LTP_ATTRIBUTE_UNUSED)
> -@@ -150,7 +150,7 @@ void do_child(void)
> -       stack_t signal_stack;
> -       struct sigaction segv_sig = {.sa_sigaction = segv_handler,
> .sa_flags = SA_ONSTACK|SA_SIGINFO};
> -       void *map;
> --      unsigned long gap = GAP_PAGES * PAGE_SIZE;
> -+      unsigned long gap = GAP_PAGES * PAGE_SIZE_tst;
> -       struct rlimit rlimit;
> -
> -       rlimit.rlim_cur = rlimit.rlim_max = RLIM_INFINITY;
> -@@ -200,8 +200,8 @@ void setup(void)
> - {
> -       char buf[4096], *p;
> -
> --      PAGE_SIZE = sysconf(_SC_PAGESIZE);
> --      PAGE_MASK = ~(PAGE_SIZE - 1);
> -+      PAGE_SIZE_tst = sysconf(_SC_PAGESIZE);
> -+      PAGE_MASK = ~(PAGE_SIZE_tst - 1);
> -
> -       buf[4095] = '\0';
> -       SAFE_FILE_SCANF("/proc/cmdline", "%4095[^\n]", buf);
> -@@ -214,7 +214,7 @@ void setup(void)
> -               tst_res(TINFO, "stack_guard_gap = %ld", GAP_PAGES);
> -       }
> -
> --      THRESHOLD = (GAP_PAGES - 1) * PAGE_SIZE;
> -+      THRESHOLD = (GAP_PAGES - 1) * PAGE_SIZE_tst;
> -
> -       {
> -               volatile int *a = alloca(128);
> -diff --git a/testcases/kernel/syscalls/flock/flock01.c
> b/testcases/kernel/syscalls/flock/flock01.c
> -index 3e17be4..06d89e3 100644
> ---- a/testcases/kernel/syscalls/flock/flock01.c
> -+++ b/testcases/kernel/syscalls/flock/flock01.c
> -@@ -69,6 +69,7 @@
> - #include <stdio.h>
> - #include <sys/wait.h>
> - #include <sys/file.h>
> -+#include <fcntl.h>
> - #include "test.h"
> -
> - void setup(void);
> -diff --git a/testcases/kernel/syscalls/flock/flock02.c
> b/testcases/kernel/syscalls/flock/flock02.c
> -index 414df68..9ddf729 100644
> ---- a/testcases/kernel/syscalls/flock/flock02.c
> -+++ b/testcases/kernel/syscalls/flock/flock02.c
> -@@ -75,6 +75,7 @@
> - #include <sys/types.h>
> - #include <sys/file.h>
> - #include <sys/wait.h>
> -+#include <fcntl.h>
> - #include <errno.h>
> - #include <stdio.h>
> - #include "test.h"
> ---
> -2.7.4
> -
> diff --git a/meta/recipes-extended/ltp/ltp/0038-commands-gdb01-
> replace-stdin-with-dev-null.patch b/meta/recipes-extended/ltp/
> ltp/0038-commands-gdb01-replace-stdin-with-dev-null.patch
> deleted file mode 100644
> index f7c0a4bf17..0000000000
> --- a/meta/recipes-extended/ltp/ltp/0038-commands-gdb01-
> replace-stdin-with-dev-null.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From 2f6ab8f694b26b7f2566624f6d1f23788d6ab8a0 Mon Sep 17 00:00:00 2001
> -From: Jan Stancek <jstancek@redhat.com>
> -Date: Mon, 11 Sep 2017 12:57:58 +0200
> -Subject: [PATCH] commands/gdb01: replace stdin with /dev/null
> -
> -If this testcase runs as background process, gdb can receive
> -SIGTTOU and then testcase gets stuck.
> -
> -Signed-off-by: Jan Stancek <jstancek@redhat.com>
> -
> -Upstream-Status: Backport
> -[https://github.com/linux-test-project/ltp/commit/
> 2f6ab8f694b26b7f2566624f6d1f23788d6ab8a0]
> -
> -Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ----
> - testcases/commands/gdb/gdb01.sh | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/testcases/commands/gdb/gdb01.sh b/testcases/commands/gdb/
> gdb01.sh
> -index 07ae36f..e3a5b51 100755
> ---- a/testcases/commands/gdb/gdb01.sh
> -+++ b/testcases/commands/gdb/gdb01.sh
> -@@ -29,7 +29,7 @@ TST_NEEDS_CMDS="gdb /bin/cat"
> -
> - simple_test()
> - {
> --      gdb /bin/cat -ex "run /etc/passwd" -ex quit
> -+      gdb /bin/cat -ex "run /etc/passwd" -ex quit < /dev/null
> -       RC=$?
> -       if [ $RC -eq 0 ] ; then
> -               tst_res TPASS "gdb attached to process and completed run"
> ---
> -2.7.4
> -
> diff --git a/meta/recipes-extended/ltp/ltp_20170516.bb
> b/meta/recipes-extended/ltp/ltp_20170929.bb
> similarity index 96%
> rename from meta/recipes-extended/ltp/ltp_20170516.bb
> rename to meta/recipes-extended/ltp/ltp_20170929.bb
> index 653cbfd4ed..925dd91256 100644
> --- a/meta/recipes-extended/ltp/ltp_20170516.bb
> +++ b/meta/recipes-extended/ltp/ltp_20170929.bb
> @@ -21,7 +21,7 @@ DEPENDS_append_libc-musl = " fts "
>  EXTRA_OEMAKE_append_libc-musl = " LIBC=musl "
>  CFLAGS_append_powerpc64 = " -D__SANE_USERSPACE_TYPES__"
>  CFLAGS_append_mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
> -SRCREV = "18916a2e6d8c997b7b29dcfa9550d5a15b22ed22"
> +SRCREV = "e671f2a13c695bbd87f7dfec2954ca7e3c43f377"
>
>  SRC_URI = "git://github.com/linux-test-project/ltp.git \
>             file://0001-add-_GNU_SOURCE-to-pec_listener.c.patch \
> @@ -48,8 +48,6 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
>             file://0034-periodic_output.patch \
>             file://0035-fix-test_proc_kill-hang.patch \
>             file://0036-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch
> \
> -           file://0037-ltp-fix-PAGE_SIZE-redefinition-and-O_CREAT-undeclear.patch
> \
> -           file://0038-commands-gdb01-replace-stdin-with-dev-null.patch \
>             "
>
>  S = "${WORKDIR}/git"
> --
> 2.14.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--f403045d9c0eb27b38055b4b4b05
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sorry:<div><br></div><div><div>| fanotify08.c:56:3: error:=
 format not a string literal and no format arguments [-Werror=3Dformat-secu=
rity]</div><div>| =C2=A0 =C2=A0tst_res(TPASS, msg);</div><div>| =C2=A0 =C2=
=A0^~~~~~~</div><div>| fanotify08.c:58:3: error: format not a string litera=
l and no format arguments [-Werror=3Dformat-security]</div><div>| =C2=A0 =
=C2=A0tst_res(TFAIL, msg);</div><div>| =C2=A0 =C2=A0^~~~~~~</div></div><div=
><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On 5 October 2017 at 18:47, Fathi Boudra <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:fathi.boudra@linaro.org" target=3D"_blank">fathi.bou=
dra@linaro.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">* Up=
date SRCREV to match 20170929 release<br>
* Drop patches available in 20170929 release:<br>
=C2=A0 - 0037-ltp-fix-PAGE_SIZE-<wbr>redefinition-and-O_CREAT-<wbr>undeclea=
r.patch<br>
=C2=A0 - 0038-commands-gdb01-replace-<wbr>stdin-with-dev-null.patch<br>
<br>
Signed-off-by: Fathi Boudra &lt;<a href=3D"mailto:fathi.boudra@linaro.org">=
fathi.boudra@linaro.org</a>&gt;<br>
---<br>
=C2=A0...E_SIZE-redefinition-and-O_<wbr>CREAT-undeclear.patch | 113 -------=
--------------<br>
=C2=A0...ommands-gdb01-replace-<wbr>stdin-with-dev-null.patch |=C2=A0 34 --=
-----<br>
=C2=A0.../ltp/{<a href=3D"http://ltp_20170516.bb" rel=3D"noreferrer" target=
=3D"_blank">ltp_20170516.bb</a> =3D&gt; <a href=3D"http://ltp_20170929.bb" =
rel=3D"noreferrer" target=3D"_blank">ltp_20170929.bb</a>}=C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A03 files changed, 1 insertion(+), 150 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-extended/ltp/ltp/<wbr>0037-ltp-fix-PA=
GE_SIZE-<wbr>redefinition-and-O_CREAT-<wbr>undeclear.patch<br>
=C2=A0delete mode 100644 meta/recipes-extended/ltp/ltp/<wbr>0038-commands-g=
db01-replace-<wbr>stdin-with-dev-null.patch<br>
=C2=A0rename meta/recipes-extended/ltp/{<a href=3D"http://ltp_20170516.bb" =
rel=3D"noreferrer" target=3D"_blank">ltp<wbr>_20170516.bb</a> =3D&gt; <a hr=
ef=3D"http://ltp_20170929.bb" rel=3D"noreferrer" target=3D"_blank">ltp_2017=
0929.bb</a>} (96%)<br>
<br>
diff --git a/meta/recipes-extended/ltp/<wbr>ltp/0037-ltp-fix-PAGE_SIZE-<wbr=
>redefinition-and-O_CREAT-<wbr>undeclear.patch b/meta/recipes-extended/ltp/=
<wbr>ltp/0037-ltp-fix-PAGE_SIZE-<wbr>redefinition-and-O_CREAT-<wbr>undeclea=
r.patch<br>
deleted file mode 100644<br>
index c8738ae0d4..0000000000<br>
--- a/meta/recipes-extended/ltp/<wbr>ltp/0037-ltp-fix-PAGE_SIZE-<wbr>redefi=
nition-and-O_CREAT-<wbr>undeclear.patch<br>
+++ /dev/null<br>
@@ -1,113 +0,0 @@<br>
-From a9d5595d2fa2ab252f1cabf63f4b65<wbr>c3efbafeb9 Mon Sep 17 00:00:00 200=
1<br>
-From: Dengke Du &lt;<a href=3D"mailto:dengke.du@windriver.com">dengke.du@w=
indriver.com</a>&gt;<br>
-Date: Thu, 10 Aug 2017 15:27:03 +0800<br>
-Subject: [PATCH] ltp: fix PAGE_SIZE redefinition and O_CREAT undeclear whe=
n<br>
- build with musl<br>
-<br>
-error 1:<br>
-<br>
-|stack_clash.c:50:22: error: expected identifier or &#39;(&#39; before num=
eric constant<br>
-| static unsigned long PAGE_SIZE;<br>
-<br>
-This is because the musl libc already contain PAGE_SIZE definition in limi=
ts.c,<br>
-we can check it here:<br>
-<br>
-=C2=A0 =C2=A0 <a href=3D"https://git.musl-libc.org/cgit/musl/tree/include/=
limits.h#n43" rel=3D"noreferrer" target=3D"_blank">https://git.musl-libc.or=
g/<wbr>cgit/musl/tree/include/limits.<wbr>h#n43</a><br>
-<br>
-error 2:<br>
-<br>
-|ck01.c:157:22: error: &#39;O_CREAT&#39; undeclared (first use in this fun=
ction); did you mean &#39;S_IREAD&#39;?<br>
-|=C2=A0 =C2=A0fd =3D open(filename, O_CREAT | O_TRUNC | O_RDWR, 0644);<br>
-|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0^~~~~~~<br>
-|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0S_IREAD<br>
-<br>
-This is because the musl libc put those in fcntl.h, so we should include t=
hat<br>
-file.<br>
-<br>
-Upstream-Status: Submitted [ <a href=3D"https://github.com/linux-test-proj=
ect/ltp/pull/194" rel=3D"noreferrer" target=3D"_blank">https://github.com/l=
inux-test-<wbr>project/ltp/pull/194</a> ]<br>
-<br>
-Signed-off-by: Dengke Du &lt;<a href=3D"mailto:dengke.du@windriver.com">de=
ngke.du@windriver.com</a>&gt;<br>
----<br>
- testcases/cve/stack_clash.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 12 ++++++------<br>
- testcases/kernel/syscalls/<wbr>flock/flock01.c |=C2=A0 1 +<br>
- testcases/kernel/syscalls/<wbr>flock/flock02.c |=C2=A0 1 +<br>
- 3 files changed, 8 insertions(+), 6 deletions(-)<br>
-<br>
-diff --git a/testcases/cve/stack_clash.c b/testcases/cve/stack_clash.c<br>
-index 2ef1a82..7c45991 100644<br>
---- a/testcases/cve/stack_clash.c<br>
-+++ b/testcases/cve/stack_clash.c<br>
-@@ -47,7 +47,7 @@<br>
- #include &quot;tst_test.h&quot;<br>
- #include &quot;tst_safe_stdio.h&quot;<br>
-<br>
--static unsigned long PAGE_SIZE;<br>
-+static unsigned long PAGE_SIZE_tst;<br>
- static unsigned long PAGE_MASK;<br>
- static unsigned long GAP_PAGES =3D 256;<br>
- static unsigned long THRESHOLD;<br>
-@@ -66,7 +66,7 @@ void exhaust_stack_into_sigsegv(<wbr>void)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0exhaust_stack_into_sigsegv();<br>
- }<br>
-<br>
--#define MAPPED_LEN PAGE_SIZE<br>
-+#define MAPPED_LEN PAGE_SIZE_tst<br>
- static unsigned long mapped_addr;<br>
-<br>
- void segv_handler(int sig, siginfo_t *info, void *data LTP_ATTRIBUTE_UNUS=
ED)<br>
-@@ -150,7 +150,7 @@ void do_child(void)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0stack_t signal_stack;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sigaction segv_sig =3D {.sa_sigaction =
=3D segv_handler, .sa_flags =3D SA_ONSTACK|SA_SIGINFO};<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0void *map;<br>
--=C2=A0 =C2=A0 =C2=A0 unsigned long gap =3D GAP_PAGES * PAGE_SIZE;<br>
-+=C2=A0 =C2=A0 =C2=A0 unsigned long gap =3D GAP_PAGES * PAGE_SIZE_tst;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct rlimit rlimit;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rlimit.rlim_cur =3D rlimit.rlim_max =3D RLIM_IN=
FINITY;<br>
-@@ -200,8 +200,8 @@ void setup(void)<br>
- {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0char buf[4096], *p;<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 PAGE_SIZE =3D sysconf(_SC_PAGESIZE);<br>
--=C2=A0 =C2=A0 =C2=A0 PAGE_MASK =3D ~(PAGE_SIZE - 1);<br>
-+=C2=A0 =C2=A0 =C2=A0 PAGE_SIZE_tst =3D sysconf(_SC_PAGESIZE);<br>
-+=C2=A0 =C2=A0 =C2=A0 PAGE_MASK =3D ~(PAGE_SIZE_tst - 1);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0buf[4095] =3D &#39;\0&#39;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_FILE_SCANF(&quot;/proc/<wbr>cmdline&quot;,=
 &quot;%4095[^\n]&quot;, buf);<br>
-@@ -214,7 +214,7 @@ void setup(void)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TINFO, &quo=
t;stack_guard_gap =3D %ld&quot;, GAP_PAGES);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 THRESHOLD =3D (GAP_PAGES - 1) * PAGE_SIZE;<br>
-+=C2=A0 =C2=A0 =C2=A0 THRESHOLD =3D (GAP_PAGES - 1) * PAGE_SIZE_tst;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0volatile int *a =3D=
 alloca(128);<br>
-diff --git a/testcases/kernel/syscalls/<wbr>flock/flock01.c b/testcases/ke=
rnel/syscalls/<wbr>flock/flock01.c<br>
-index 3e17be4..06d89e3 100644<br>
---- a/testcases/kernel/syscalls/<wbr>flock/flock01.c<br>
-+++ b/testcases/kernel/syscalls/<wbr>flock/flock01.c<br>
-@@ -69,6 +69,7 @@<br>
- #include &lt;stdio.h&gt;<br>
- #include &lt;sys/wait.h&gt;<br>
- #include &lt;sys/file.h&gt;<br>
-+#include &lt;fcntl.h&gt;<br>
- #include &quot;test.h&quot;<br>
-<br>
- void setup(void);<br>
-diff --git a/testcases/kernel/syscalls/<wbr>flock/flock02.c b/testcases/ke=
rnel/syscalls/<wbr>flock/flock02.c<br>
-index 414df68..9ddf729 100644<br>
---- a/testcases/kernel/syscalls/<wbr>flock/flock02.c<br>
-+++ b/testcases/kernel/syscalls/<wbr>flock/flock02.c<br>
-@@ -75,6 +75,7 @@<br>
- #include &lt;sys/types.h&gt;<br>
- #include &lt;sys/file.h&gt;<br>
- #include &lt;sys/wait.h&gt;<br>
-+#include &lt;fcntl.h&gt;<br>
- #include &lt;errno.h&gt;<br>
- #include &lt;stdio.h&gt;<br>
- #include &quot;test.h&quot;<br>
---<br>
-2.7.4<br>
-<br>
diff --git a/meta/recipes-extended/ltp/<wbr>ltp/0038-commands-gdb01-<wbr>re=
place-stdin-with-dev-null.<wbr>patch b/meta/recipes-extended/ltp/<wbr>ltp/0=
038-commands-gdb01-<wbr>replace-stdin-with-dev-null.<wbr>patch<br>
deleted file mode 100644<br>
index f7c0a4bf17..0000000000<br>
--- a/meta/recipes-extended/ltp/<wbr>ltp/0038-commands-gdb01-<wbr>replace-s=
tdin-with-dev-null.<wbr>patch<br>
+++ /dev/null<br>
@@ -1,34 +0,0 @@<br>
-From 2f6ab8f694b26b7f2566624f6d1f23<wbr>788d6ab8a0 Mon Sep 17 00:00:00 200=
1<br>
-From: Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.com">jstancek@redh=
at.com</a>&gt;<br>
-Date: Mon, 11 Sep 2017 12:57:58 +0200<br>
-Subject: [PATCH] commands/gdb01: replace stdin with /dev/null<br>
-<br>
-If this testcase runs as background process, gdb can receive<br>
-SIGTTOU and then testcase gets stuck.<br>
-<br>
-Signed-off-by: Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.com">jsta=
ncek@redhat.com</a>&gt;<br>
-<br>
-Upstream-Status: Backport<br>
-[<a href=3D"https://github.com/linux-test-project/ltp/commit/2f6ab8f694b26=
b7f2566624f6d1f23788d6ab8a0" rel=3D"noreferrer" target=3D"_blank">https://g=
ithub.com/linux-<wbr>test-project/ltp/commit/<wbr>2f6ab8f694b26b7f2566624f6=
d1f23<wbr>788d6ab8a0</a>]<br>
-<br>
-Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windriver.com">yi.zha=
o@windriver.com</a>&gt;<br>
----<br>
- testcases/commands/gdb/gdb01.<wbr>sh | 2 +-<br>
- 1 file changed, 1 insertion(+), 1 deletion(-)<br>
-<br>
-diff --git a/testcases/commands/gdb/<wbr>gdb01.sh b/testcases/commands/gdb=
/<wbr>gdb01.sh<br>
-index 07ae36f..e3a5b51 100755<br>
---- a/testcases/commands/gdb/<wbr>gdb01.sh<br>
-+++ b/testcases/commands/gdb/<wbr>gdb01.sh<br>
-@@ -29,7 +29,7 @@ TST_NEEDS_CMDS=3D&quot;gdb /bin/cat&quot;<br>
-<br>
- simple_test()<br>
- {<br>
--=C2=A0 =C2=A0 =C2=A0 gdb /bin/cat -ex &quot;run /etc/passwd&quot; -ex qui=
t<br>
-+=C2=A0 =C2=A0 =C2=A0 gdb /bin/cat -ex &quot;run /etc/passwd&quot; -ex qui=
t &lt; /dev/null<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0RC=3D$?<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ $RC -eq 0 ] ; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res TPASS &quot=
;gdb attached to process and completed run&quot;<br>
---<br>
-2.7.4<br>
-<br>
diff --git a/meta/recipes-extended/ltp/<a href=3D"http://ltp_20170516.bb" r=
el=3D"noreferrer" target=3D"_blank">lt<wbr>p_20170516.bb</a> b/meta/recipes=
-extended/ltp/<a href=3D"http://ltp_20170929.bb" rel=3D"noreferrer" target=
=3D"_blank">lt<wbr>p_20170929.bb</a><br>
similarity index 96%<br>
rename from meta/recipes-extended/ltp/<a href=3D"http://ltp_20170516.bb" re=
l=3D"noreferrer" target=3D"_blank">ltp_<wbr>20170516.bb</a><br>
rename to meta/recipes-extended/ltp/<a href=3D"http://ltp_20170929.bb" rel=
=3D"noreferrer" target=3D"_blank">ltp_<wbr>20170929.bb</a><br>
index 653cbfd4ed..925dd91256 100644<br>
--- a/meta/recipes-extended/ltp/<a href=3D"http://ltp_20170516.bb" rel=3D"n=
oreferrer" target=3D"_blank">lt<wbr>p_20170516.bb</a><br>
+++ b/meta/recipes-extended/ltp/<a href=3D"http://ltp_20170929.bb" rel=3D"n=
oreferrer" target=3D"_blank">lt<wbr>p_20170929.bb</a><br>
@@ -21,7 +21,7 @@ DEPENDS_append_libc-musl =3D &quot; fts &quot;<br>
=C2=A0EXTRA_OEMAKE_append_libc-musl =3D &quot; LIBC=3Dmusl &quot;<br>
=C2=A0CFLAGS_append_powerpc64 =3D &quot; -D__SANE_USERSPACE_TYPES__&quot;<b=
r>
=C2=A0CFLAGS_append_mipsarchn64 =3D &quot; -D__SANE_USERSPACE_TYPES__&quot;=
<br>
-SRCREV =3D &quot;<wbr>18916a2e6d8c997b7b29dcfa9550d5<wbr>a15b22ed22&quot;<=
br>
+SRCREV =3D &quot;<wbr>e671f2a13c695bbd87f7dfec2954ca<wbr>7e3c43f377&quot;<=
br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/linux-test-proje=
ct/ltp.git" rel=3D"noreferrer" target=3D"_blank">github.com/linux-test-<wbr=
>project/ltp.git</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-add-_GNU_SOURCE-<wbr>=
to-pec_listener.c.patch \<br>
@@ -48,8 +48,6 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/linu=
x-test-project/ltp.git" rel=3D"noreferrer" target=3D"_blank">github.com/lin=
ux-test-<wbr>project/ltp.git</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0034-periodic_output.<wbr>=
patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0035-fix-test_proc_<wbr>ki=
ll-hang.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0036-testcases-network-<wb=
r>nfsv4-acl-acl1.c-Security-fix-<wbr>on-s.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0037-ltp-fix-PAGE_SIZE-<wb=
r>redefinition-and-O_CREAT-<wbr>undeclear.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0038-commands-gdb01-<wbr>r=
eplace-stdin-with-dev-null.<wbr>patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.14.2<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--f403045d9c0eb27b38055b4b4b05--
