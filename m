Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id C0BEA74D03
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Oct 2018 22:24:46 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id k3-v6so8382631qth.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Oct 2018 15:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fQ9L9/vrAQ1f+ctEbH36pc7oguQpu7XIeY0DAjCjY1M=;
	b=EHGvxjneYujyGodJ5bJt5R46us2q9tsdMfPV1nKbaU7i4SPHYE86ca3iAFHGPxm7mG
	lJq/YjSZeT97Qjth2OjrGgukCe/sFf+ek2LC5KiTH8brVxPW5pDvr5geGDub6OpCAGYs
	zp7mi5efQ6P/RPpWsuEmdkn3F+l9h5U7ZBL7NW+j6XSrpHWPCE1XU2i0Yn7CI/Vgs6FZ
	E6gsRwXeTQwVBi4DlNCjk3OpheeG8iqbEpoDiQvWAXfSA5jHPbo48ytMHyQppC70OjrD
	mtU9UstfYO9N8R17Q6y4nvVnTePfZEayTegvzbF/5P1nGJHMVKbj8ynMtjBprnLhOKn1
	kokA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fQ9L9/vrAQ1f+ctEbH36pc7oguQpu7XIeY0DAjCjY1M=;
	b=QsMm7oFPdsJqoDS2QeN6E5pxcR6Fw4jDddfmB8LKN8+R23jdSL3TdW8AK0AHQ+aP2q
	bjLcHYgF+qU/rw7IlWubqlsWp0QR03WmJcDAaSLgrxZCbbNGgPx/zoWHuA0tDnSCq3Ly
	04GNiMGej8F4CGlpdr2QudLSyOWmB4ve1MqgweLeSTAjE/isPCqCaV3RDEh5Wveo6M4X
	p0hPiV+ud/QzgI4cHQcGHFGnTmDxejRoAqyRgW9ucugpH60VOXd8M86Nn7tQKntk7Lgb
	6RWCVYZmtKoaEKr6CvaFokowG+6m+Ca9FiXnDT/rKCHBmhtyUw03nIb8cpVS5bjxhEKp
	tV2Q==
X-Gm-Message-State: ABuFfohK1i7Cxlv2Rye+Ddb3ALOpiunedOKHksvpKOkWNsk17Ftx9Z98
	DC5mct9Cy7+KzVMf8aqNMieKtWkrt5hy5ZueQnI=
X-Google-Smtp-Source: ACcGV60ZPcmN5if5bKQnzwf1ICrXP3P12SBM27rzldnWW7DU0XewsweStwD0tRFWNQkTpHSRMKO64wOaLrCJPM1ZdqA=
X-Received: by 2002:a0c:98a6:: with SMTP id f35mr26991342qvd.224.1540160687388;
	Sun, 21 Oct 2018 15:24:47 -0700 (PDT)
MIME-Version: 1.0
References: <20181020054026.9619-1-Randy.MacLeod@windriver.com>
	<20181020054026.9619-2-Randy.MacLeod@windriver.com>
	<CAMKF1sp3xrV_1zG0UhknY26csC1TMbBjd+dMixrCbUXBwzQ2Uw@mail.gmail.com>
	<625e1152-8cfe-f9dc-c80f-e93a7fb74b26@windriver.com>
In-Reply-To: <625e1152-8cfe-f9dc-c80f-e93a7fb74b26@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 21 Oct 2018 23:24:20 +0100
Message-ID: <CAMKF1srghdS66FHbZv_ikGHLDUqGDK1oxZOC40UnSied=Y2EGw@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] valgrind: update from 3.13.0 to 3.14.0
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
X-List-Received-Date: Sun, 21 Oct 2018 22:24:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Oct 21, 2018 at 9:48 PM Randy MacLeod
<randy.macleod@windriver.com> wrote:
>
> On 10/21/18 5:47 AM, Khem Raj wrote:
> > fails ptest compile on musl/mips
> > http://errors.yoctoproject.org/Errors/Details/197122/
>
> I have a fix that I'll send later tonight or tomorrow morning
> once I've tested it a bit more. I'll paste it inline below in
> case anyone wants it now.
>
> I did notice that the ptest build of valgrind takes a more than
> 30 minutes!:
>
> 0: valgrind-3.14.0-r0 do_compile_ptest_base - 2306s (pid 21911)
>
> It's building:
>    none/tests/mips32/msa_fpu.c
> which is from a commit [1] that tries to cover
> all MIPS SIMD architecture instructions. I'll
> drop that test unless someone objects since it's overkill
> for a ptest IMO.

I do not use MSA here so it might be ok to to save some time. but I am
curious how it
looks on real h/w

>
> ../Randy
>
>
> [1] from valgrind.git
>
> commit 0e1fa562e977c9ff86b56d7a29d12588b6a2c731
> Author: Petar Jovanovic <mips32r2@gmail.com>
> Date:   Fri Oct 27 16:26:24 2017 +0200
>
>      mips: MSA tests
>
>      This set of tests covers the whole MSA instruction set:
>
>
>        none/tests/mips32/msa_arithmetic
>        none/tests/mips32/msa_comparison
>        none/tests/mips32/msa_data_transfer
>        none/tests/mips32/msa_fpu
>        none/tests/mips32/msa_logical_and_shift
>        none/tests/mips32/msa_shuffle
>
>        none/tests/mips64/msa_arithmetic         (symlink to mips32)
>        none/tests/mips64/msa_comparison         (symlink to mips32)
>        none/tests/mips64/msa_data_transfer
>        none/tests/mips64/msa_fpu                (symlink to mips32)
>        none/tests/mips64/msa_logical_and_shift  (symlink to mips32)
>        none/tests/mips64/msa_shuffle            (symlink to mips32)
>
>      Contributed by:
>        Tamara Vlahovic, Aleksandar Rikalo and Aleksandra Karadzic.
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>
>
>
> commit d9cd7744a30b9c35a2b0c128209b959511bb1583
> Author: Randy MacLeod <Randy.MacLeod@windriver.com>
> Date:   Sun Oct 21 15:09:31 2018 -0400
>
>      Fix compiler warnings by making functions static
>
>      Avoid compiler warnings such as:
>      | ../../../valgrind-3.14.0/helgrind/tests/annotate_hbefore.c:360:6:
> warning: no previous prototype for 'do_signal' [-Wmissing-prototypes]
>      |  void do_signal ( UWord* w )
>      |       ^~~~~~~~~
>      by making functions and global variables that are file scope be static.
>

I would have just defined a prototype for the function at the top of
file or in .h file
but this is a good cleanup. May be send upstream too please.

>      Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
>
> diff --git a/helgrind/tests/annotate_hbefore.c
> b/helgrind/tests/annotate_hbefore.c
> index e311714f7..f55514e45 100644
> --- a/helgrind/tests/annotate_hbefore.c
> +++ b/helgrind/tests/annotate_hbefore.c
> @@ -24,7 +24,7 @@ typedef  unsigned long int  UWord;
>
>   // ppc64
>   /* return 1 if success, 0 if failure */
> -UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
> +static UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
>   {
>     UWord old, success;
>
> @@ -57,7 +57,7 @@ UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
>
>   // ppc32
>   /* return 1 if success, 0 if failure */
> -UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
> +static UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
>   {
>     UWord old, success;
>
> @@ -90,7 +90,7 @@ UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
>
>   // amd64
>   /* return 1 if success, 0 if failure */
> -UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
> +static UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
>   {
>      UWord block[4] = { (UWord)addr, expected, nyu, 2 };
>      __asm__ __volatile__(
> @@ -113,7 +113,7 @@ UWord do_acasW ( UWord* addr, UWord expected, UWord
> nyu )
>
>   // x86
>   /* return 1 if success, 0 if failure */
> -UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
> +static UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
>   {
>      UWord block[4] = { (UWord)addr, expected, nyu, 2 };
>      __asm__ __volatile__(
> @@ -138,7 +138,7 @@ UWord do_acasW ( UWord* addr, UWord expected, UWord
> nyu )
>
>   // arm
>   /* return 1 if success, 0 if failure */
> -UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
> +static UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
>   {
>     UWord old, success;
>     UWord block[2] = { (UWord)addr, nyu };
> @@ -171,7 +171,7 @@ UWord do_acasW ( UWord* addr, UWord expected, UWord
> nyu )
>
>   // arm64
>   /* return 1 if success, 0 if failure */
> -UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
> +static UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
>   {
>     UWord old, success;
>     UWord block[2] = { (UWord)addr, nyu };
> @@ -204,7 +204,7 @@ UWord do_acasW ( UWord* addr, UWord expected, UWord
> nyu )
>
>   // s390x
>   /* return 1 if success, 0 if failure */
> -UWord do_acasW(UWord* addr, UWord expected, UWord nyu )
> +static UWord do_acasW(UWord* addr, UWord expected, UWord nyu )
>   {
>      int cc;
>
> @@ -223,7 +223,7 @@ UWord do_acasW(UWord* addr, UWord expected, UWord nyu )
>
>   // mips32
>   /* return 1 if success, 0 if failure */
> -UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
> +static UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
>   {
>     UWord success;
>     UWord block[3] = { (UWord)addr, nyu, expected};
> @@ -256,7 +256,7 @@ UWord do_acasW ( UWord* addr, UWord expected, UWord
> nyu )
>
>   // mips64
>   /* return 1 if success, 0 if failure */
> -UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
> +static UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
>   {
>     UWord success;
>     UWord block[3] = { (UWord)addr, nyu, expected};
> @@ -287,7 +287,7 @@ UWord do_acasW ( UWord* addr, UWord expected, UWord
> nyu )
>
>   #endif
>
> -void atomic_incW ( UWord* w )
> +static void atomic_incW ( UWord* w )
>   {
>      while (1) {
>         UWord old = *w;
> @@ -301,7 +301,7 @@ void atomic_incW ( UWord* w )
>
>   #define NNN 1000000
>
> -void* thread_fn ( void* arg )
> +static void* thread_fn ( void* arg )
>   {
>     UWord* w = (UWord*)arg;
>     int i;
> @@ -331,10 +331,10 @@ int main ( void )
>
>   #endif
>
> -int shared_var = 0;  // is not raced upon
> +static int shared_var = 0;  // is not raced upon
>
>
> -void delayXms ( int i )
> +static void delayXms ( int i )
>   {
>      struct timespec ts = { 0, 1 * 1000 * 1000 };
>      // We do the sleep in small pieces to have scheduling
> @@ -348,7 +348,7 @@ void delayXms ( int i )
>      }
>   }
>
> -void do_wait ( UWord* w )
> +static void do_wait ( UWord* w )
>   {
>     UWord w0 = *w;
>     UWord volatile * wV = w;
> @@ -357,7 +357,7 @@ void do_wait ( UWord* w )
>     ANNOTATE_HAPPENS_AFTER(w);
>   }
>
> -void do_signal ( UWord* w )
> +static void do_signal ( UWord* w )
>   {
>     ANNOTATE_HAPPENS_BEFORE(w);
>     atomic_incW(w);
> @@ -365,7 +365,7 @@ void do_signal ( UWord* w )
>
>
>
> -void* thread_fn1 ( void* arg )
> +static void* thread_fn1 ( void* arg )
>   {
>     UWord* w = (UWord*)arg;
>     delayXms(500);    // ensure t2 gets to its wait first
> @@ -376,7 +376,7 @@ void* thread_fn1 ( void* arg )
>     return NULL;
>   }
>
> -void* thread_fn2 ( void* arg )
> +static void* thread_fn2 ( void* arg )
>   {
>     UWord* w = (UWord*)arg;
>     do_wait(w);      // wait for h-b edge from first thread
>

