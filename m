Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 80E716B06C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2019 13:47:40 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id p17so2361312qtl.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2019 05:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=SMbTrPxCiDguhQ9E34iErd6smk586qKSAQaUy8NXRw8=;
	b=SKsZ1e+3hCAv4FgJJI8c4JIlb51BJUaITEyjS1l66sYTJqH5BzxrhAXeo3NDQLloy6
	Q6xjJEoMl+Nwkm5YQVKUBYeekSP2Q+YuRuxvf436sTMAzxAbNaSF/DyDAWpgwyukkASZ
	M4qa3i1JqpmgxaTaBJW8LzzsdIwFz1qvutcxfiSxfrXv7hDQ+70Ubqmxge6psAVA3bMy
	RPAomY3023dLenO55WYDuL/7mM6RZ5OAasYA8xDPeURyn3mZwXf4w/tZEOuYg58Yludm
	vij0nPr+aIAjpw3n6KpFM6bvB2YWtBy0hGXuMgZcKocVqTnaP3+Ba/iV5CeWmhz/Q7ht
	FwxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SMbTrPxCiDguhQ9E34iErd6smk586qKSAQaUy8NXRw8=;
	b=T2dinb1/eBEaNUo+r6I79g6XlvgWTyS1ghY7vGH0MjY22NzCyHHJjR3iGxYrrUNHYt
	DXWHwx7nIXpeIyHkGgVOre7qgJH/nzKPRVjPULyPBttcj5ykRIRHmj2Bgv9SJKn+rPkz
	yNVLQzzc4VbMkGBW1O3ZwswSbWaWwIaHKyCAUERNyuDu2u/zw4HTCRwF8mNmHxZrsa4e
	czmaYyqop8/6jGZ170mEstG3CMvyjeI8+SWm4W4DZl2ujo5IgFaApzID6pMx5Tgs1bz/
	YxsOy1MPyNbn7MYu4TtibzmUpdCAXyj3EK+4/ZzQtEuqh8wJIHqPl00P8PjIgDIjBpIS
	ilWw==
X-Gm-Message-State: AJcUuke4Lg1pMRLyIlbk3qYxDh4e5WOAEjvjYmeHRe7bVVtgYMq6Ta9j
	oolZcAZ9yJMFViyOLHVBYu+rK8CAznd8/wQgQys=
X-Google-Smtp-Source: ALg8bN4l22+4LPHYlY+uXf9XbVo/CVRTwjsMQSZTY1dAk2eTboUDGhzM7EHRIUHQQydbZEPyk3AcYpfsvFz1j3i0Ftg=
X-Received: by 2002:aed:3eac:: with SMTP id n41mr2293474qtf.196.1548251261077; 
	Wed, 23 Jan 2019 05:47:41 -0800 (PST)
MIME-Version: 1.0
References: <1547636693-29101-1-git-send-email-mikko.rapeli@bmw.de>
	<CAMKF1sqiOyZO--Y=zZr=La0fZUNwWw4aeS+hovHjapa-7wpL-A@mail.gmail.com>
	<20190117080109.GZ7474@hiutale>
	<68651111-db74-a41d-a6d2-3e2610e4041d@gmail.com>
	<20190123080236.GL7474@hiutale>
In-Reply-To: <20190123080236.GL7474@hiutale>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Jan 2019 08:47:29 -0500
Message-ID: <CAMKF1sqv4BrptMT3uHO4vmEyk4Q8WAKJvALjN0Qf6Mna8vE2Rw@mail.gmail.com>
To: Mikko.Rapeli@bmw.de
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH RFC sumo] gcc: update from 7.3 to 7.4
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
X-List-Received-Date: Wed, 23 Jan 2019 13:47:42 -0000
Content-Type: multipart/alternative; boundary="000000000000708d8e0580205610"

--000000000000708d8e0580205610
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 23, 2019 at 3:02 AM <Mikko.Rapeli@bmw.de> wrote:

> On Tue, Jan 22, 2019 at 04:18:09PM -0800, akuster808 wrote:
> >
> >
> > On 1/17/19 12:01 AM, Mikko.Rapeli@bmw.de wrote:
> > > On Wed, Jan 16, 2019 at 11:48:29PM -0800, Khem Raj wrote:
> > >> we need to apply this to thud as well, otherwise people upgrading fr=
om
> > >> sumo to thud and staying with gcc 7 will see a downgrade. I am fine
> > >> with the patch in general since its a point release. It still can
> > >> cause issues so its not a simple change.
> > > Ok, I had forgot about thud since I'm not using. Patch applies with
> conflicts,
> > > meta/recipes-devtools/gcc/gcc-7.4/0008-c99-snprintf.patch needs to be
> deleted.
> >
> > Actual it has turned out to be more than that.
> > 0049-gcc-override-TARGET_LIBC_PROVIDES_SSP.patch did not migrate over
> > and I had to refresh a lot of patches.
> >
> > Now I am seeing a compile error.
> >
> > usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/7.4.0/include/unwind.h'=
:
> > No such file or directory
> >
> >
> > I am not taking this update to thud in this fashion. I am more than
> > happy to revisit this with a clean patch to thud.
>
> Ok. I wouldn't mind skipping this update from thud because it has gcc-8.2
> as default
> anyway.
>
> But I'd like to know if the update triggers any build failures on sumo an=
d
> what
> ever build targets are tested by yocto?
>
> In my project I did not see any real problems, only compiler version
> string failures
> in some tests.
>

I think even if we don=E2=80=99t have it default yet using older compiler o=
n a
newer release is counter intuitive and users are still using gcc7 on thud
too now we have removed it so I would not ask for doing this upgrade on
master


> -Mikko
>
> > - armin
> > >
> > > -Mikko
> > >
> > >> On Wed, Jan 16, 2019 at 3:30 AM Mikko Rapeli <mikko.rapeli@bmw.de>
> wrote:
> > >>> 7.4 is a bug fix maintenance release.
> > >>>
> > >>> List of fixed bugs is:
> > >>>
> > >>>
> https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=3DRESOLVED&resolution=
=3DFIXED&target_milestone=3D7.4
> > >>>
> > >>> 85113   gcc     c++     jason   RESO    FIXE    [7/8 Regression] IC=
E
> with __builtin_constant_p  2018-12-06
> > >>> 86070   gcc     libfortr        jvdelisle       RESO    FIXE    [7
> regression] gfortran.dg/fmt_zero_digits.f90 segmentation fault starting
> with r261077         2018-06-12
> > >>> 85442   gcc     libstdc+        redi    RESO    FIXE    [7/8
> Regression] cxx11-ios_failure.lo build fails for microblaze
> 2018-04-18
> > >>> 70359   gcc     middle-e        aldyh   RESO    FIXE    [7/8/9
> Regression] Code size increase for x86/ARM/others compared to gcc-5.3.0
> 2018-12-05
> > >>> 81228   gcc     target  amker   RESO    FIXE    [7 Regression] ICE
> in gen_vec_cmpv2dfv2di, at config/aarch64/aarch64-simd.md:2508
>  2018-02-22
> > >>> 84071   gcc     rtl-opti        ebotcazou       RESO    FIXE    [7/=
8
> regression] wrong elimination of zero-extension after sign-extended load
>  2018-02-02
> > >>> 85925   gcc     rtl-opti        ebotcazou       RESO    FIXE
> [7/8/9 regression] compilation of masking with 257 goes wrong in combine =
at
> -02         2018-11-22
> > >>> 81004   gcc     lto     hubicka         RESO    FIXE    [7
> Regression] linking failed with -flto and static libboost_program_options
>   2018-03-08
> > >>> 49726   gcc     driver  jakub   RESO    FIXE    [6 Regression] -g0
> file.S -g does not produce debug info        2018-10-26
> > >>> 80598   gcc     c++     jakub   RESO    FIXE    [7 regression]
> -Wunused triggers for functions used in uninstantiated templates
>  2018-06-25
> > >>> 81661   gcc     tree-opt        jakub   RESO    FIXE    [7
> Regression] ICE in gimplify_modify_expr, at gimplify.c:5638  2018-03-03
> > >>> 83930   gcc     target  jakub   RESO    FIXE    [6 Regression] ICE:
> RTL check: expected code 'const_int', have 'mem' in
> simplify_binary_operation_1, at simplify-rtx.c:3302     2018-06-25
> > >>> 83945   gcc     middle-e        jakub   RESO    FIXE    [7
> Regression] internal compiler error: Segmentation fault with -O
> -fcode-hoisting      2018-03-03
> > >>> 83958   gcc     c++     jakub   RESO    FIXE    [7 Regression] ICE:
> Segmentation fault (in find_decomp_class_base)      2018-03-03
> > >>> 83993   gcc     c++     jakub   RESO    FIXE    [7 Regression] ICE:
> constant not recomputed when ADDR_EXPR changed      2018-03-03
> > >>> 84082   gcc     c++     jakub   RESO    FIXE    [7 Regression] ICE
> with broken template function definition     2018-03-03
> > >>> 84308   gcc     rtl-opti        jakub   RESO    FIXE    [7
> Regression] Memory leak in spread_components         2018-03-03
> > >>> 84430   gcc     c++     jakub   RESO    FIXE    [7 Regression] ICE
> with #pragma omp simd in lambda      2018-03-03
> > >>> 84445   gcc     c++     jakub   RESO    FIXE    [7 Regression] ICE
> with __builtin_launder and virtual function  2018-03-03
> > >>> 84503   gcc     tree-opt        jakub   RESO    FIXE    [7
> Regression] store-merging miscompilation on powerpc64 with -O3 since
> r241789         2018-03-03
> > >>> 84834   gcc     middle-e        jakub   RESO    FIXE    [7
> Regression] ICE: tree check: expected integer_cst, have complex_cst in
> to_wide, at tree.h:5527       2018-06-25
> > >>> 84841   gcc     tree-opt        jakub   RESO    FIXE    [7
> Regression] ICE: tree check: expected ssa_name, have real_cst in
> rewrite_expr_tree_parallel, at tree-ssa-reassoc.c:4624      2018-06-23
> > >>> 84853   gcc     c       jakub   RESO    FIXE    [7 Regression] ICE:
> verify_gimple failed (expand_shift_1)       2018-06-25
> > >>> 84961   gcc     c++     jakub   RESO    FIXE    [7 Regression] ICE
> error: SSA_NAME_DEF_STMT is wrong    2018-06-25
> > >>> 84999   gcc     c       jakub   RESO    FIXE    [7 Regression] ICE
> in make_vector_type, at tree.c:9561  2018-06-25
> > >>> 85430   gcc     target  jakub   RESO    FIXE    [7 Regression] ICE:
> SIGSEGV in memory_operand at recog.c:1358/9 with -O2 -fno-tree-ccp
> -fno-tree-fre    2018-06-25
> > >>> 85446   gcc     tree-opt        jakub   RESO    FIXE    [7
> Regression] wrong-code on riscv64    2018-06-25
> > >>> 86314   gcc     target  jakub   RESO    FIXE    [7/8/9 Regression]
> GCC 7.x and 8.x zero out "eax" before using "rax" in "lock bts"
> 2018-06-26
> > >>> 71569   gcc     c++     jason   RESO    FIXE    [6 regression]
> Crash: External definition of template member from template struct
>  2018-10-26
> > >>> 71834   gcc     c++     jason   RESO    FIXE    [6/7 Regression]
> accepts invalid C++11 code with too few number of template arguments for
> class template        2018-03-23
> > >>> 80227   gcc     c++     jason   RESO    FIXE    [6/7 Regression]
> SFINAE ambiguity with a pointer to array argument      2018-05-10
> > >>> 80290   gcc     c++     jason   RESO    FIXE    [6/7/8/9 Regression=
]
> g++ uses unreasonable amount of memory compiling nested string maps
> 2018-06-28
> > >>> 82152   gcc     c++     jason   RESO    FIXE    [7 Regression] ICE
> on invalid code in C++17 mode if inheriting constructors are used
> 2018-04-06
> > >>> 82336   gcc     c++     jason   RESO    FIXE    [6 Regression] GCC
> requires but does not emit defaulted constructors in certain cases
>  2018-10-26
> > >>> 82461   gcc     c++     jason   RESO    FIXE    [7 Regression]
> Temporary required for brace-initializing (non-literal-type) member
> variable     2018-01-29
> > >>> 82664   gcc     c++     jason   RESO    FIXE    [7/8 Regression ]
> ICE when using Match7 library         2018-02-16
> > >>> 82764   gcc     c++     jason   RESO    FIXE    [7/8 Regression] IC=
E
> in output_constructor_regular_field, at varasm.c:5030      2018-05-03
> > >>> 83227   gcc     c++     jason   RESO    FIXE    [7 Regression]
> internal compiler error: in process_init_constructor_array       2018-02-=
16
> > >>> 84045   gcc     c++     jason   RESO    FIXE    [7 Regression] ICE
> when is_nothrow_default_constructible is used before #include<set>
>  2018-02-16
> > >>> 84355   gcc     c++     jason   RESO    FIXE    [7 Regression] ICE
> with failing template argument deduction     2018-03-23
> > >>> 84665   gcc     c++     jason   RESO    FIXE    [7/8 Regression]
> internal compiler error: in build_value_init, at cp/init.c:343
>  2018-04-05
> > >>> 84937   gcc     c++     jason   RESO    FIXE    [7 Regression] ICE
> with class template argument deduction and auto      2018-03-23
> > >>> 85006   gcc     c++     jason   RESO    FIXE    [7 Regression]
> [concepts] ICE with bogus parameter pack         2018-04-06
> > >>> 85060   gcc     c++     jason   RESO    FIXE    [7/8 Regression]
> Object cannot call its inherited member function "without object"
> 2018-04-03
> > >>> 85148   gcc     c++     jason   RESO    FIXE    [6/7/8 Regression]
> ICE with NSDMI and this pointer      2018-04-04
> > >>> 85279   gcc     c++     jason   RESO    FIXE    [6 Regression]
> Broken diagnostic for decltype   2018-05-01
> > >>> 85470   gcc     c++     jason   RESO    FIXE    [7 Regression]
> Strange error about "call to non-constexpr function"     2018-04-23
> > >>> 85646   gcc     c++     jason   RESO    FIXE    [7/8/9 Regression]
> Incorrect lambda visibility with -fvisibility=3Dhidden         2018-09-04
> > >>> 85815   gcc     c++     jason   RESO    FIXE    [7/8/9 Regression]
> incorrect "invalid use of incomplete type" in a lambda on valid code
>  2018-06-12
> > >>> 86060   gcc     c++     jason   RESO    FIXE    [6/7/8/9 Regression=
]
> g++ ICE at on with "c++03" in tsubst_copy, at cp/pt.c:15459
> 2018-06-12
> > >>> 33562   gcc     tree-opt        law     RESO    FIXE    [6
> Regression] aggregate DSE disabled   2018-04-30
> > >>> 84658   gcc     ipa     marxin  RESO    FIXE    [7 Regression] -O3
> -fmerge-all-constants causes incorrect for-each loop generation.
>  2018-04-24
> > >>> 84154   gcc     target  meissner        RESO    FIXE    [7
> Regression] PowerPC GCC 7 and 8 have regression in converting fp to
> short/char and returning it      2018-02-17
> > >>> 71638   gcc     c++     mpolacek        RESO    FIXE    [6
> Regression] ICE on invalid C++ code on x86_64-linux-gnu with -Wall
> (internal compiler error: non-constant element in constant CONSTRUCTOR)
>  2018-10-26
> > >>> 81860   gcc     c++     mpolacek        RESO    FIXE    [7
> Regression] Call to undefined inline function involving inheriting
> constructors      2018-02-19
> > >>> 84590   gcc     c++     mpolacek        RESO    FIXE    [7
> Regression] -fsanitize=3Dundefined internal compiler error: tree check:
> expected constructor, have target_expr in split_nonconstant_init_1, at
> cp/typeck2.c:629        2018-03-02
> > >>> 84854   gcc     c++     mpolacek        RESO    FIXE    [7
> Regression] ICE: unexpected expression in cxx_eval_constant_expression, a=
t
> cp/constexpr.c:4774       2018-03-22
> > >>> 84927   gcc     c++     mpolacek        RESO    FIXE    [7
> Regression] ICE with NSDMI and reference     2018-03-22
> > >>> 88120   gcc     c++     mpolacek        RESO    FIXE    [7
> Regression] ICE in contains_placeholder_p at gcc/tree.c:3710
>  2018-12-04
> > >>> 87542   gcc     c++     msebor  RESO    FIXE    [7/8 Regression]
> bogus error on attribute format with a named constant argument
>  2018-11-19
> > >>> 87462   gcc     debug   nathan  RESO    FIXE    [7/8 Regression]
> undefined reference error occurs when -g, -fdebug-types-section and -O2 a=
re
> used at the same time      2018-11-30
> > >>> 85222   gcc     libstdc+        redi    RESO    FIXE    [7
> Regression] ABI breakage of __throw_ios_failure by r244498   2018-08-08
> > >>> 85464   gcc     c++     redi    RESO    FIXE    [7 Regression]
> Wignored-qualifiers is emitted by cc1plus without diagnostics when
> triggered by a cast operator.         2018-04-19
> > >>> 85904   gcc     target  redi    RESO    FIXE    [7/8 Regression]
> configure issue cross compiling on netbsd, with patch  2018-08-13
> > >>> 45397   gcc     tree-opt        rguenth         RESO    FIXE    [6
> Regression] Issues with integer narrowing conversions        2018-11-19
> > >>> 79351   gcc     tree-opt        rguenth         RESO    FIXE
> [7/8/9 Regression] Invalid tree PRE optimization around compound literal
>     2018-11-28
> > >>> 84233   gcc     middle-e        rguenth         RESO    FIXE    [7/=
8
> Regression] ICE (segfault) in gimple_assign_rhs_code       2018-02-08
> > >>> 84486   gcc     tree-opt        rguenth         RESO    FIXE    [7
> Regression] code hoisting removes alignment assumption       2018-03-06
> > >>> 85168   gcc     tree-opt        rguenth         RESO    FIXE    [7
> Regression] ICE in tree-ssa-coalesce.c: SSA corruption: Unable to coalesc=
e
> ssa_names which are marked as MUST COALESCE when -O2 is used      2018-04=
-26
> > >>> 85284   gcc     tree-opt        rguenth         RESO    FIXE    [7
> Regression] Loop miscompilation starting with r238367        2018-04-26
> > >>> 85567   gcc     middle-e        rguenth         RESO    FIXE    [7
> Regression] internal compiler error: in gimplify_modify_expr, at
> gimplify.c:5797 when using sincos()         2018-06-07
> > >>> 86076   gcc     tree-opt        rguenth         RESO    FIXE    [7
> Regression] ICE: verify_gimple failed (error: location references block n=
ot
> in block tree)   2018-11-26
> > >>> 86139   gcc     target  rguenth         RESO    FIXE    [7
> Regression] ICE in in store_constructor, at expr.c:6849 on
> arm-linux-gnueabihf       2018-11-26
> > >>> 86763   gcc     c++     rguenth         RESO    FIXE    [7
> Regression] Wrong code comparing member of copy of a 237 byte object with
> nontrivial default constructor on x86-64 arch      2018-08-17
> > >>> 87610   gcc     middle-e        rguenth         RESO    FIXE    [7
> Regression] wrong-code with restrict         2018-11-26
> > >>> 87645   gcc     tree-opt        rguenth         RESO    FIXE    [7
> Regression] gcc hangs up on vr_values::vrp_visit_assignment_or_call
> 2018-11-26
> > >>> 87665   gcc     tree-opt        rguenth         RESO    FIXE    [7
> Regression] gcc HEAD (svn: 265340) breaks elements on resize
>  2018-11-26
> > >>> 84485   gcc     tree-opt        rsandifo        RESO    FIXE    [6
> Regression] Vectorising zero-stride rmw operation    2018-10-26
> > >>> 85645   gcc     rtl-opti        segher  RESO    FIXE    [7
> Regression] ICE in maybe_record_trace_start, at dwarf2cfi.c:2348
>  2018-08-13
> > >>> 39838   gcc     middle-e        unassigned      RESO    FIXE    [6
> regression] unoptimal code for two simple loops      2018-10-26
> > >>> 46639   gcc     tree-opt        unassigned      RESO    FIXE    [6
> Regression] Missing optimization due to function splitting and redundant
> conditionals        2018-10-26
> > >>> 61409   gcc     middle-e        unassigned      RESO    FIXE    [6
> regression] -Wmaybe-uninitialized false-positive with -O2    2018-10-26
> > >>> 65135   gcc     rtl-opti        unassigned      RESO    FIXE    [6
> Regression] Performance regression in pic mode after r220674.
> 2018-10-26
> > >>> 70681   gcc     rtl-opti        unassigned      RESO    FIXE
> [7/8/9 Regression] FAIL: gcc.dg/ira-shrinkwrap-prep-2.c gcc.dg/pr10474.c =
on
> arm and powerpc     2018-11-20
> > >>> 84813   gcc     c++     unassigned      RESO    FIXE    [7
> Regression] internal compiler error: Segmentation fault with lambdas and
> constexpr variables         2018-12-01
> > >>> 85805   gcc     rtl-opti        unassigned      RESO    FIXE    [7/=
8
> Regression] Wrong code for 64 bit comparisons on avr-gcc   2018-11-20
> > >>> 87867   gcc     target  unassigned      RESO    FIXE    [7
> regression] ICE on virtual destructor (-mlong-calls -ffunction-sections) =
on
> arm-none-eabi    2018-11-21
> > >>> 84955   gcc     middle-e        vries   RESO    FIXE    [7
> Regression] Incorrect OpenACC tile expansion         2018-05-01
> > >>> 87473   gcc     tree-opt        wschmidt        RESO    FIXE
> [7/8/9 Regression] ICE in create_add_on_incoming_edge, at
> gimple-ssa-strength-reduction.c:2344  2018-10-27
> > >>> 85436   gcc     target  bergner         RESO    FIXE    [7
> Regression] ICE compiling go code with -mcpu=3Dpower9  2018-04-20
> > >>> 85384   gcc     jit     dmalcolm        RESO    FIXE    libgccjit
> does not work if --with-gcc-major-version is used     2018-06-25
> > >>> 83496   gcc     rtl-opti        ebotcazou       RESO    FIXE    [7/=
8
> regression] wrong code generated with -Os -mbranch-cost=3D1  2018-02-27
> > >>> 88199   gcc     libstdc+        fdumont         RESO    FIXE    [7/=
8
> Regression] memory leak on unordered container move assignment
>  2018-11-28
> > >>> 84192   gcc     c++     jakub   RESO    FIXE    [7 Regression] ICE
> with statement expression    2018-03-03
> > >>> 84444   gcc     c++     jakub   RESO    FIXE    ICE with
> __builtin_launder and cast     2018-03-03
> > >>> 85208   gcc     c++     jakub   RESO    FIXE    ICE with #pragma
> weak and structured binding    2018-06-24
> > >>> 85529   gcc     tree-opt        jakub   RESO    FIXE    [7
> Regression] wrong code at -O2 and -O3 on x86_64-linux-gnu    2018-06-25
> > >>> 87065   gcc     rtl-opti        jakub   RESO    FIXE    [7
> Regression] combine causes ICE in trunc_int_for_mode         2018-10-12
> > >>> 64095   gcc     c++     jason   RESO    FIXE    [C++14] Ellipsis at
> end of generic lambda parameter-declaration-clause should be parsed as a
> parameter pack     2018-07-28
> > >>> 81853   gcc     c++     jason   RESO    FIXE    [ 6/7/8 Regression]
> "using namespace" is not a constant expression in a statement expression
> 2018-02-16
> > >>> 83835   gcc     c++     jason   RESO    FIXE    [7/8 Regression]
> constexpr constructor rejected in c++17 mode (regression WRT c++14)
> 2018-02-16
> > >>> 84015   gcc     c++     jason   RESO    FIXE    [7 Regression] ICE
> with class template argument deduction       2018-02-26
> > >>> 86378   gcc     c++     jason   RESO    FIXE    [7/8/9 regression]
> typedef breaks functional cast in noexcept-qualifier         2018-07-03
> > >>> 80867   gcc     bootstra        kelvin  RESO    FIXE    gnat
> bootstrap broken on powerpc64le-linux-gnu with -O3         2018-01-31
> > >>> 85081   gcc     sanitize        marxin  RESO    FIXE    [7
> Regression] Sanitizer error with references in vectorized/parallel
> for-loop  2018-04-24
> > >>> 85424   gcc     target  meissner        RESO    FIXE    The
> __builtin_packlongdouble function might have issues with the output
> overlapping the inputs  2018-06-25
> > >>> 83659   gcc     c++     mpolacek        RESO    FIXE    [7
> Regression] ICE on compilable C++ code: in tree_to_shwi, at tree.c:6821
>   2018-03-03
> > >>> 71625   gcc     tree-opt        msebor  RESO    FIXE    missing
> strlen optimization on different array initialization style     2018-10-0=
5
> > >>> 87284   gcc     fortran         pault   RESO    FIXE    [7/8/9
> Regression] Allocation of class arrays with mold results in "conditional
> jump or move depends on uninitialised value"    2018-09-13
> > >>> 78595   gcc     libstdc+        redi    RESO    FIXE    Unnecessary
> copies in _Rb_tree  2018-10-12
> > >>> 81076   gcc     libstdc+        redi    RESO    FIXE
> __byte_operand<cv T> is not SFINAE-friendly     2018-01-25
> > >>> 82966   gcc     libstdc+        redi    RESO    FIXE    node_handle
> swap fails to compile       2018-05-14
> > >>> 83658   gcc     libstdc+        redi    RESO    FIXE    any::emplac=
e
> deletes invalid memory when an overloaded operator new() throws
> 2018-01-29
> > >>> 83662   gcc     libstdc+        redi    RESO    FIXE
> std::aligned_alloc() not available      2018-03-23
> > >>> 84087   gcc     libstdc+        redi    RESO    FIXE
> string::assign problem with two arguments       2018-08-23
> > >>> 84532   gcc     libstdc+        redi    RESO    FIXE    [7
> Regression] std::thread::__make_invoker prematurely unwraps
> reference_wrappers       2018-02-26
> > >>> 85671   gcc     libstdc+        redi    RESO    FIXE    Lack of
> `std::move()` inside `operator/` for `std::filesystem::path`.   2018-07-0=
4
> > >>> 85812   gcc     libstdc+        redi    RESO    FIXE    [7/8
> Regression] make_exception_ptr can leak the allocated exception if
> construction throws     2018-05-17
> > >>> 86138   gcc     libstdc+        redi    RESO    FIXE    [7/8
> Regression] C++17: getline(istream, string) crashes on Cygwin because
> incompatible C++14 function is called        2018-09-21
> > >>> 86169   gcc     libstdc+        redi    RESO    FIXE    .data()
> fails to unshare strings        2018-06-15
> > >>> 86734   gcc     libstdc+        redi    RESO    FIXE    [DR 2188]
> reverse_iterator::operator-> does not support overloaded operator&
> 2018-08-08
> > >>> 86861   gcc     libstdc+        redi    RESO    FIXE
> 18_support/new_aligned.cc FAILs         2018-08-07
> > >>> 87538   gcc     libstdc+        redi    RESO    FIXE    [7/8
> Regression] Incorrect noexcept specifier for not_fn        2018-10-08
> > >>> 87822   gcc     libstdc+        redi    RESO    FIXE    [6/7/8/9
> Regression] Binary incompatibility in std::pair introduced by PR 86751
>    2018-10-31
> > >>> 82795   gcc     target  rguenth         RESO    FIXE    [7/8
> Regression] ICE in predicate_mem_writes, at tree-if-conv.c:2251
> 2018-02-01
> > >>> 84190   gcc     c       rguenth         RESO    FIXE    [7/8
> Regression] double arithmetic on x86 no longer rounds to nearest
>  2018-02-16
> > >>> 81647   gcc     target  sudi    RESO    FIXE    inconsistent LTGT
> behavior at different optimization levels on AArch64.         2018-04-04
> > >>> 85203   gcc     target  thomas.preudhomme       RESO    FIXE
> cmse_nonsecure_caller intrinsic returns incorrect results       2018-04-1=
7
> > >>> 84654   gcc     libstdc+        tuliom  RESO    FIXE    libstdc++
> tries to use __float128 when compiling with -mno-float128     2018-08-07
> > >>> 58372   gcc     c++     ubizjak         RESO    FIXE    internal
> compiler error: ix86_compute_frame_layout      2018-11-11
> > >>> 87928   gcc     target  ubizjak         RESO    FIXE    [7/8/9
> Regression] ICE in ix86_compute_frame_layout, at config/i386/i386.c:11161
> since r228607  2018-11-20
> > >>> 88051   gcc     target  ubizjak         RESO    FIXE    internal
> compiler error: in add_clobbers, at config/i386/sync.md:1762   2018-11-22
> > >>> 71450   gcc     c++     unassigned      RESO    FIXE    [6
> Regression] ICE on invalid C++11 code on x86_64-linux-gnu: in tree check:
> expected record_type or union_type or qual_union_type, have
> template_type_parm in lookup_base, at cp/search.c:203  2018-11-19
> > >>> 81589   gcc     c++     unassigned      RESO    FIXE    Possible
> False-Positive with decltype   2018-06-22
> > >>> 81763   gcc     target  unassigned      RESO    FIXE    Issues with
> BMI on 32bit x86 apps on GCC 7.1+   2018-01-29
> > >>> 82805   gcc     target  unassigned      RESO    FIXE    [7/8/9
> Regression] SPEC CPU2006 454.calculix ~6% performance deviation in betwee=
n
> 6.3 and 7.2   2018-06-08
> > >>> 82813   gcc     ada     unassigned      RESO    FIXE    warning:
> '.builtin_memcpy' writing between 2 and 6 bytes into a region of size 0
> overflows the destination [-Wstringop-overflow=3D]       2018-03-12
> > >>> 83830   gcc     libstdc+        unassigned      RESO    FIXE
> has_unique_object_representations_v is missing  2018-01-25
> > >>> 83990   gcc     c++     unassigned      RESO    FIXE    [7
> Regression] Spurious "potential null pointer dereference" warning
> regression from 7.1 onwards        2018-02-15
> > >>> 84769   gcc     libstdc+        unassigned      RESO    FIXE
> variant::get(): unscoped call to get<size_t>    2018-05-03
> > >>> 84773   gcc     libstdc+        unassigned      RESO    FIXE    [7/=
8
> Regression] Cross-compilers do not use aligned_alloc or _aligned_malloc f=
or
> aligned-new    2018-03-12
> > >>> 86127   gcc     libstdc+        unassigned      RESO    FIXE    STL
> containers do not satisfy container.requirements.general clause 8
>  2018-07-04
> > >>> 86705   gcc     middle-e        unassigned      RESO    FIXE
> [7/8/9 Regression] pr45678-2.c ICE with msp430-elf -mlarge      2018-08-0=
2
> > >>> 87033   gcc     target  unassigned      RESO    FIXE    The compile=
r
> does not generate the LWAX instruction     2018-09-28
> > >>> 87370   gcc     target  unassigned      RESO    FIXE    [7/8/9
> Regression] Inefficient return code of struct values     2018-12-14
> > >>> 87517   gcc     target  unassigned      RESO    FIXE    Typo in
> avx512fintrin.h         2018-10-12
> > >>> 80654   gcc     libstdc+        ville.voutilainen       RESO
> FIXE    is_trivially_copy_constructible fails with compiler error with
> vector of uncopyable objects     2018-06-22
> > >>> 84116   gcc     fortran         jakub   RESO    FIXE    [7
> Regression] ICE in gfc_match_omp_clauses, at fortran/openmp.c:1354
>  2018-03-03
> > >>> 84449   gcc     c++     jakub   RESO    FIXE    [7 Regression] ICE
> with constexpr and deleted destructor        2018-03-03
> > >>> 85210   gcc     c++     jakub   RESO    FIXE    [7 Regression] ICE
> with broken structured binding in template   2018-06-24
> > >>> 44491   gcc     fortran         kargl   RESO    FIXE    Diagnostic
> just shows "<During initialization>" instead of a locus      2018-06-12
> > >>> 51434   gcc     fortran         kargl   RESO    FIXE    ICE with
> scalar init of an array parameter, used in DT default init with transfer
>    2018-03-03
> > >>> 77414   gcc     fortran         kargl   RESO    FIXE    ICE in
> create_function_arglist, at fortran/trans-decl.c:2410    2018-03-19
> > >>> 78278   gcc     fortran         kargl   RESO    FIXE    ICE in
> gfc_wide_memset, at fortran/scanner.c:153        2018-06-09
> > >>> 78741   gcc     fortran         kargl   RESO    FIXE    ICE in
> gfc_get_symbol_decl, at fortran/trans-decl.c:1534        2018-03-16
> > >>> 85981   gcc     fortran         kargl   RESO    FIXE    ICE in
> gfc_trans_string_copy, at fortran/trans-expr.c:6539      2018-06-04
> > >>> 86045   gcc     fortran         kargl   RESO    FIXE    ICE in
> reduce_binary_ac, at fortran/arith.c:1308        2018-06-07
> > >>> 86059   gcc     fortran         kargl   RESO    FIXE    ICE in
> reduce_binary_ac, at fortran/arith.c:1308 (and others)   2018-06-09
> > >>> 86110   gcc     fortran         kargl   RESO    FIXE    ICE in
> gfc_resolve_character_array_constructor, at fortran/array.c:2044
>  2018-06-13
> > >>> 68467   gcc     target  law     RESO    FIXE    libgcc, compilation
> for target m68k-linux breaks in linux_atomic.c      2018-01-29
> > >>> 85258   gcc     c++     mpolacek        RESO    FIXE    [7/8
> Regression] ICE with invalid range-based for-loop  2018-04-12
> > >>> 80657   gcc     fortran         pault   RESO    FIXE    [7/8/9
> Regression] Loop in character function declaration       2018-05-20
> > >>> 80965   gcc     fortran         pault   RESO    FIXE    [7/8
> Regression] ICE with class argument and -O2 optimization   2018-03-03
> > >>> 84546   gcc     fortran         pault   RESO    FIXE    [7
> Regression] Bad sourced allocation of CLASS(*) with source with CLASS(*)
> component   2018-05-16
> > >>> 84113   gcc     target  segher  RESO    FIXE    [7/8 Regression]
> libgcc/unwind.inc:136:1: unrecognizable insn: internal compiler error on
> Darwin        2018-02-08
> > >>> 78238   gcc     fortran         tkoenig         RESO    FIXE    [7/=
8
> Regression] [OOP] ICE: verify_gimple failed, with -fdefault-integer-8
> 2018-02-25
> > >>> 84270   gcc     fortran         tkoenig         RESO    FIXE    [7/=
8
> Regression] optimization bug with assumed size array argument
> 2018-02-17
> > >>> 85641   gcc     fortran         tkoenig         RESO    FIXE
> [7/8/9 Regression] ICE with string concatenate  2018-06-07
> > >>> 88073   gcc     fortran         tkoenig         RESO    FIXE    [7/=
8
> Regression] Internal compiler error compiling WHERE construct with -O or
> -O2       2018-11-26
> > >>> 62247   gcc     target  unassigned      RESO    FIXE    [7/8/9
> Regression] FAIL: g++.dg/abi/anon3.C -std=3Dc++98/9 scan-assembler
> .weak(_definition)      2018-11-21
> > >>> 68226   gcc     fortran         unassigned      RESO    FIXE
> [7/8/9 Regression] [OOP] ICE on assignment of pointer-valued function to
> allocatable    2018-10-26
> > >>> 79929   gcc     fortran         unassigned      RESO    FIXE    [7
> Regression] Bogus Warning: '__builtin_memset': specified size 4294967291
> exceeds maximum object size 2147483647      2018-05-04
> > >>> 82961   gcc     target  unassigned      RESO    FIXE    ICE in
> dwarf2out.c: deferred_asm_name !=3D NULL   2018-11-22
> > >>> 83319   gcc     fortran         unassigned      RESO    FIXE    [7/=
8
> Regression] ICE on use of allocatable component in derived type coarray
> defined in module  2018-03-28
> > >>> 84070   gcc     fortran         unassigned      RESO    FIXE
> Incorrect assignment to allocatable character variable  2018-03-11
> > >>> 84209   gcc     target  unassigned      RESO    FIXE    [avr] Don't
> split SP in split2  2018-03-07
> > >>> 87597   gcc     fortran         unassigned      RESO    FIXE
> [7/8/9 Regression] wrong result with matmul inlining    2018-11-03
> > >>> 38351   gcc     fortran         kargl   RESO    FIXE    Poor error
> message for rank mismatch in operator args   2018-06-09
> > >>>
> > >>> Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
> > >>> ---
> > >>>  meta/recipes-devtools/gcc/gcc-7.3.inc              | 132 ---------=
-
> > >>>  ...1-Fix-internal-compiler-error-in-testcase.patch | 212
> ---------------
> > >>>  ...ix-ppc64le-build-Partial-backport-r256656.patch |  37 ---
> > >>>  .../0001-PR-c-80290-memory-hog-with-std-pair.patch |  58 -----
> > >>>  .../gcc-7.3/0001-PR-rtl-optimization-83030.patch   | 272
> --------------------
> > >>>  .../0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch     |  42 ---
> > >>>  .../gcc/gcc-7.3/0008-c99-snprintf.patch            |  28 --
> > >>>  .../0009-gcc-poison-system-directories.patch       | 192
> --------------
> > >>>  .../gcc/gcc-7.3/0010-gcc-poison-dir-extend.patch   |  39 ---
> > >>>  .../0011-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |  73 ------
> > >>>  .../gcc/gcc-7.3/0012-64-bit-multilib-hack.patch    |  85 ------
> > >>>  .../gcc/gcc-7.3/0013-optional-libstdc.patch        | 125 ---------
> > >>>  ...0014-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch |  59 -----
> > >>>  .../gcc/gcc-7.3/0015-COLLECT_GCC_OPTIONS.patch     |  38 ---
> > >>>  ...efaults.h-in-B-instead-of-S-and-t-oe-in-B.patch |  96 -------
> > >>>  .../gcc-7.3/0017-fortran-cross-compile-hack.patch  |  46 ----
> > >>>  .../gcc/gcc-7.3/0018-cpp-honor-sysroot.patch       |  54 ----
> > >>>  .../gcc-7.3/0019-MIPS64-Default-to-N64-ABI.patch   |  57 -----
> > >>>  ...C_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch | 234
> -----------------
> > >>>  ...0021-gcc-Fix-argument-list-too-long-error.patch |  40 ---
> > >>>  .../gcc/gcc-7.3/0022-Disable-sdt.patch             | 113 --------
> > >>>  .../gcc/gcc-7.3/0023-libtool.patch                 |  42 ---
> > >>>  ...4-pass-fix-v4bx-to-linker-to-support-EABI.patch |  43 ----
> > >>>  ...tilib-config-files-from-B-instead-of-usin.patch | 102 --------
> > >>>  ...-libdir-from-.la-which-usually-points-to-.patch |  31 ---
> > >>>  .../gcc/gcc-7.3/0027-export-CPP.patch              |  53 ----
> > >>>  ...AltiVec-generation-on-powepc-linux-target.patch |  56 ----
> > >>>  ...-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch |  42 ---
> > >>>  ...Ensure-target-gcc-headers-can-be-included.patch |  98 -------
> > >>>  ...-t-build-with-disable-dependency-tracking.patch |  54 ----
> > >>>  ...h-host-directory-during-relink-if-inst_pr.patch |  38 ---
> > >>>  ...IBS_DIR-replacement-instead-of-hardcoding.patch |  29 ---
> > >>>  .../0034-aarch64-Add-support-for-musl-ldso.patch   |  28 --
> > >>>  ...ibcc1-fix-libcc1-s-install-path-and-rpath.patch |  54 ----
> > >>>  ...-handle-sysroot-support-for-nativesdk-gcc.patch | 213
> ----------------
> > >>>  ...et-sysroot-gcc-version-specific-dirs-with.patch | 102 --------
> > >>>  ...-various-_FOR_BUILD-and-related-variables.patch | 137 ---------=
-
> > >>>  .../0039-nios2-Define-MUSL_DYNAMIC_LINKER.patch    |  28 --
> > >>>  ...shared-to-link-commandline-for-musl-targe.patch |  87 -------
> > >>>  ...c-libcpp-support-ffile-prefix-map-old-new.patch | 284
> ---------------------
> > >>>  ...ug-prefix-map-to-replace-ffile-prefix-map.patch |  43 ----
> > >>>  ...-fdebug-prefix-map-support-to-remap-sourc.patch |  54 ----
> > >>>  ...44-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch | 124 ---------
> > >>>  ...bgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch |  29 ---
> > >>>  .../gcc-7.3/0047-sync-gcc-stddef.h-with-musl.patch |  91 -------
> > >>>  .../gcc/gcc-7.3/0048-gcc-Enable-static-PIE.patch   |  46 ----
> > >>>  .../fix-segmentation-fault-precompiled-hdr.patch   |  49 ----
> > >>>  .../gcc-7.3/no-sse-fix-test-case-failures.patch    | 259
> -------------------
> > >>>  meta/recipes-devtools/gcc/gcc-7.4.inc              | 130 +++++++++=
+
> > >>>  ...1-Fix-internal-compiler-error-in-testcase.patch | 212
> +++++++++++++++
> > >>>  ...ix-ppc64le-build-Partial-backport-r256656.patch |  37 +++
> > >>>  .../gcc-7.4/0001-PR-rtl-optimization-83030.patch   | 272
> ++++++++++++++++++++
> > >>>  .../0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch     |  42 +++
> > >>>  .../gcc/gcc-7.4/0008-c99-snprintf.patch            |  28 ++
> > >>>  .../0009-gcc-poison-system-directories.patch       | 192
> ++++++++++++++
> > >>>  .../gcc/gcc-7.4/0010-gcc-poison-dir-extend.patch   |  39 +++
> > >>>  .../0011-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |  73 ++++++
> > >>>  .../gcc/gcc-7.4/0012-64-bit-multilib-hack.patch    |  85 ++++++
> > >>>  .../gcc/gcc-7.4/0013-optional-libstdc.patch        | 125 +++++++++
> > >>>  ...0014-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch |  59 +++++
> > >>>  .../gcc/gcc-7.4/0015-COLLECT_GCC_OPTIONS.patch     |  38 +++
> > >>>  ...efaults.h-in-B-instead-of-S-and-t-oe-in-B.patch |  96 +++++++
> > >>>  .../gcc-7.4/0017-fortran-cross-compile-hack.patch  |  46 ++++
> > >>>  .../gcc/gcc-7.4/0018-cpp-honor-sysroot.patch       |  54 ++++
> > >>>  .../gcc-7.4/0019-MIPS64-Default-to-N64-ABI.patch   |  57 +++++
> > >>>  ...C_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch | 234
> +++++++++++++++++
> > >>>  ...0021-gcc-Fix-argument-list-too-long-error.patch |  40 +++
> > >>>  .../gcc/gcc-7.4/0022-Disable-sdt.patch             | 113 ++++++++
> > >>>  .../gcc/gcc-7.4/0023-libtool.patch                 |  42 +++
> > >>>  ...4-pass-fix-v4bx-to-linker-to-support-EABI.patch |  43 ++++
> > >>>  ...tilib-config-files-from-B-instead-of-usin.patch | 102 ++++++++
> > >>>  ...-libdir-from-.la-which-usually-points-to-.patch |  31 +++
> > >>>  .../gcc/gcc-7.4/0027-export-CPP.patch              |  53 ++++
> > >>>  ...AltiVec-generation-on-powepc-linux-target.patch |  56 ++++
> > >>>  ...-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch |  42 +++
> > >>>  ...Ensure-target-gcc-headers-can-be-included.patch |  98 +++++++
> > >>>  ...-t-build-with-disable-dependency-tracking.patch |  54 ++++
> > >>>  ...h-host-directory-during-relink-if-inst_pr.patch |  38 +++
> > >>>  ...IBS_DIR-replacement-instead-of-hardcoding.patch |  29 +++
> > >>>  .../0034-aarch64-Add-support-for-musl-ldso.patch   |  28 ++
> > >>>  ...ibcc1-fix-libcc1-s-install-path-and-rpath.patch |  54 ++++
> > >>>  ...-handle-sysroot-support-for-nativesdk-gcc.patch | 213
> ++++++++++++++++
> > >>>  ...et-sysroot-gcc-version-specific-dirs-with.patch | 102 ++++++++
> > >>>  ...-various-_FOR_BUILD-and-related-variables.patch | 137 +++++++++=
+
> > >>>  .../0039-nios2-Define-MUSL_DYNAMIC_LINKER.patch    |  28 ++
> > >>>  ...shared-to-link-commandline-for-musl-targe.patch |  87 +++++++
> > >>>  ...c-libcpp-support-ffile-prefix-map-old-new.patch | 284
> +++++++++++++++++++++
> > >>>  ...ug-prefix-map-to-replace-ffile-prefix-map.patch |  43 ++++
> > >>>  ...-fdebug-prefix-map-support-to-remap-sourc.patch |  54 ++++
> > >>>  ...44-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch | 124 +++++++++
> > >>>  ...bgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch |  29 +++
> > >>>  .../gcc-7.4/0047-sync-gcc-stddef.h-with-musl.patch |  91 +++++++
> > >>>  .../gcc/gcc-7.4/0048-gcc-Enable-static-PIE.patch   |  46 ++++
> > >>>  .../fix-segmentation-fault-precompiled-hdr.patch   |  49 ++++
> > >>>  .../gcc-7.4/no-sse-fix-test-case-failures.patch    | 259
> +++++++++++++++++++
> > >>>  .../recipes-devtools/gcc/gcc-cross-canadian_7.3.bb |   5 -
> > >>>  .../recipes-devtools/gcc/gcc-cross-canadian_7.4.bb |   5 +
> > >>>  meta/recipes-devtools/gcc/gcc-cross-initial_7.3.bb |   2 -
> > >>>  meta/recipes-devtools/gcc/gcc-cross-initial_7.4.bb |   2 +
> > >>>  meta/recipes-devtools/gcc/gcc-cross_7.3.bb         |   3 -
> > >>>  meta/recipes-devtools/gcc/gcc-cross_7.4.bb         |   3 +
> > >>>  .../gcc/gcc-crosssdk-initial_7.3.bb                |   3 -
> > >>>  .../gcc/gcc-crosssdk-initial_7.4.bb                |   3 +
> > >>>  meta/recipes-devtools/gcc/gcc-crosssdk_7.3.bb      |   2 -
> > >>>  meta/recipes-devtools/gcc/gcc-crosssdk_7.4.bb      |   2 +
> > >>>  meta/recipes-devtools/gcc/gcc-runtime_7.3.bb       |   7 -
> > >>>  meta/recipes-devtools/gcc/gcc-runtime_7.4.bb       |   7 +
> > >>>  meta/recipes-devtools/gcc/gcc-sanitizers_7.3.bb    |   2 -
> > >>>  meta/recipes-devtools/gcc/gcc-sanitizers_7.4.bb    |   2 +
> > >>>  meta/recipes-devtools/gcc/gcc-source_7.3.bb        |   4 -
> > >>>  meta/recipes-devtools/gcc/gcc-source_7.4.bb        |   4 +
> > >>>  meta/recipes-devtools/gcc/gcc_7.3.bb               |  10 -
> > >>>  meta/recipes-devtools/gcc/gcc_7.4.bb               |  10 +
> > >>>  meta/recipes-devtools/gcc/libgcc-initial_7.3.bb    |   2 -
> > >>>  meta/recipes-devtools/gcc/libgcc-initial_7.4.bb    |   2 +
> > >>>  meta/recipes-devtools/gcc/libgcc_7.3.bb            |   2 -
> > >>>  meta/recipes-devtools/gcc/libgcc_7.4.bb            |   2 +
> > >>>  meta/recipes-devtools/gcc/libgfortran_7.3.bb       |   3 -
> > >>>  meta/recipes-devtools/gcc/libgfortran_7.4.bb       |   3 +
> > >>>  119 files changed, 4233 insertions(+), 4293 deletions(-)
> > >>>  delete mode 100644 meta/recipes-devtools/gcc/gcc-7.3.inc
> > >>>  delete mode 100644
> meta/recipes-devtools/gcc/gcc-7.3/0001-Fix-internal-compiler-error-in-tes=
tcase.patch
> > >>>  delete mode 100644
> meta/recipes-devtools/gcc/gcc-7.3/0001-Fix-ppc64le-build-Partial-backport=
-r256656.patch
> > >>>  delete mode 100644
> meta/recipes-devtools/gcc/gcc-7.3/0001-PR-c-80290-memory-hog-with-std-pai=
r.patch
> > >>>  delete mode 100644
> meta/recipes-devtools/gcc/gcc-7.3/0001-PR-rtl-optimization-83030.patch
> > >>>  delete mode 100644
> meta/recipes-devtools/gcc/gcc-7.3/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.pa=
tch
> > >>>  delete mode 100644
> meta/recipes-devtools/gcc/gcc-7.3/0008-c99-snprintf.patch
> > >>>  delete mode 100644
> meta/recipes-devtools/gcc/gcc-7.3/0009-gcc-poison-system-directories.patc=
h
> > >>>  delete mode 100644
> meta/recipes-devtools/gcc/gcc-7.3/0010-gcc-poison-dir-extend.patch
> > >>>  delete mode 100644
> meta/recipes-devtools/gcc/gcc-7.3/0011-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGE=
T.patch
> > >>>  delete mode 100644
> meta/recipes-devtools/gcc/gcc-7.3/0012-64-bit-multilib-hack.patch
> > >>>  delete mode 100644
> meta/recipes-devtools/gcc/gcc-7.3/0013-optional-libstdc.patch
> > >>>  delete mode 100644
> meta/recipes-devtools/gcc/gcc-7.3/0014-gcc-disable-MASK_RELAX_PIC_CALLS-b=
it.patch
> > >>>  delete mode 100644
> meta/recipes-devtools/gcc/gcc-7.3/0015-COLLECT_GCC_OPTIONS.patch
> > >>>  delete mode 100644
> meta/recipes-devtools/gcc/gcc-7.3/0016-Use-the-defaults.h-in-B-instead-of=
-S-and-t-oe-in-B.patch
> > >>>  delete mode 100644
> meta/recipes-devtools/gcc/gcc-7.3/0017-fortran-cross-compile-hack.patch
> > >>>  delete mode 100644
> meta/recipes-devtools/gcc/gcc-7.3/0018-cpp-honor-sysroot.patch
> > >>>  delete mode 100644
> meta/recipes-devtools/gcc/gcc-7.3/0019-MIPS64-Default-to-N64-ABI.patch
> > >>>  delete mode 100644
> meta/recipes-devtools/gcc/gcc-7.3/0020-Define-GLIBC_DYNAMIC_LINKER-and-UC=
LIBC_DYNAMIC_LINKE.patch
> > >>>  delete mode 100644
> meta/recipes-devtools/gcc/gcc-7.3/0021-gcc-Fix-argument-list-too-long-err=
or.patch
> > >>>  delete mode 100644
> meta/recipes-devtools/gcc/gcc-7.3/0022-Disable-sdt.patch
> > >>>  delete mode 100644
> meta/recipes-devtools/gcc/gcc-7.3/0023-libtool.patch
> > >>>  delete mode 100644
> meta/recipes-devtools/gcc/gcc-7.3/0024-gcc-armv4-pass-fix-v4bx-to-linker-=
to-support-EABI.patch
> > >>>  delete mode 100644
> meta/recipes-devtools/gcc/gcc-7.3/0025-Use-the-multilib-config-files-from=
-B-instead-of-usin.patch
> > >>>  delete mode 100644
> meta/recipes-devtools/gcc/gcc-7.3/0026-Avoid-using-libdir-from-.la-which-=
usually-points-to-.patch
> > >>>  delete mode 100644
> meta/recipes-devtools/gcc/gcc-7.3/0027-export-CPP.patch
> > >>>  delete mode 100644
> meta/recipes-devtools/gcc/gcc-7.3/0028-Enable-SPE-AltiVec-generation-on-p=
owepc-linux-target.patch
> > >>>  delete mode 100644
> meta/recipes-devtools/gcc/gcc-7.3/0029-Disable-the-MULTILIB_OSDIRNAMES-an=
d-other-multilib-o.patch
> > >>>  delete mode 100644
> meta/recipes-devtools/gcc/gcc-7.3/0030-Ensure-target-gcc-headers-can-be-i=
ncluded.patch
> > >>>  delete mode 100644
> meta/recipes-devtools/gcc/gcc-7.3/0031-gcc-4.8-won-t-build-with-disable-d=
ependency-tracking.patch
> > >>>  delete mode 100644
> meta/recipes-devtools/gcc/gcc-7.3/0032-Don-t-search-host-directory-during=
-relink-if-inst_pr.patch
> > >>>  delete mode 100644
> meta/recipes-devtools/gcc/gcc-7.3/0033-Use-SYSTEMLIBS_DIR-replacement-ins=
tead-of-hardcoding.patch
> > >>>  delete mode 100644
> meta/recipes-devtools/gcc/gcc-7.3/0034-aarch64-Add-support-for-musl-ldso.=
patch
> > >>>  delete mode 100644
> meta/recipes-devtools/gcc/gcc-7.3/0035-libcc1-fix-libcc1-s-install-path-a=
nd-rpath.patch
> > >>>  delete mode 100644
> meta/recipes-devtools/gcc/gcc-7.3/0036-handle-sysroot-support-for-natives=
dk-gcc.patch
> > >>>  delete mode 100644
> meta/recipes-devtools/gcc/gcc-7.3/0037-Search-target-sysroot-gcc-version-=
specific-dirs-with.patch
> > >>>  delete mode 100644
> meta/recipes-devtools/gcc/gcc-7.3/0038-Fix-various-_FOR_BUILD-and-related=
-variables.patch
> > >>>  delete mode 100644
> meta/recipes-devtools/gcc/gcc-7.3/0039-nios2-Define-MUSL_DYNAMIC_LINKER.p=
atch
> > >>>  delete mode 100644
> meta/recipes-devtools/gcc/gcc-7.3/0040-Add-ssp_nonshared-to-link-commandl=
ine-for-musl-targe.patch
> > >>>  delete mode 100644
> meta/recipes-devtools/gcc/gcc-7.3/0041-gcc-libcpp-support-ffile-prefix-ma=
p-old-new.patch
> > >>>  delete mode 100644
> meta/recipes-devtools/gcc/gcc-7.3/0042-Reuse-fdebug-prefix-map-to-replace=
-ffile-prefix-map.patch
> > >>>  delete mode 100644
> meta/recipes-devtools/gcc/gcc-7.3/0043-gcc-final.c-fdebug-prefix-map-supp=
ort-to-remap-sourc.patch
> > >>>  delete mode 100644
> meta/recipes-devtools/gcc/gcc-7.3/0044-libgcc-Add-knob-to-use-ldbl-128-on=
-ppc.patch
> > >>>  delete mode 100644
> meta/recipes-devtools/gcc/gcc-7.3/0045-Link-libgcc-using-LDFLAGS-not-just=
-SHLIB_LDFLAGS.patch
> > >>>  delete mode 100644
> meta/recipes-devtools/gcc/gcc-7.3/0047-sync-gcc-stddef.h-with-musl.patch
> > >>>  delete mode 100644
> meta/recipes-devtools/gcc/gcc-7.3/0048-gcc-Enable-static-PIE.patch
> > >>>  delete mode 100644
> meta/recipes-devtools/gcc/gcc-7.3/fix-segmentation-fault-precompiled-hdr.=
patch
> > >>>  delete mode 100644
> meta/recipes-devtools/gcc/gcc-7.3/no-sse-fix-test-case-failures.patch
> > >>>  create mode 100644 meta/recipes-devtools/gcc/gcc-7.4.inc
> > >>>  create mode 100644
> meta/recipes-devtools/gcc/gcc-7.4/0001-Fix-internal-compiler-error-in-tes=
tcase.patch
> > >>>  create mode 100644
> meta/recipes-devtools/gcc/gcc-7.4/0001-Fix-ppc64le-build-Partial-backport=
-r256656.patch
> > >>>  create mode 100644
> meta/recipes-devtools/gcc/gcc-7.4/0001-PR-rtl-optimization-83030.patch
> > >>>  create mode 100644
> meta/recipes-devtools/gcc/gcc-7.4/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.pa=
tch
> > >>>  create mode 100644
> meta/recipes-devtools/gcc/gcc-7.4/0008-c99-snprintf.patch
> > >>>  create mode 100644
> meta/recipes-devtools/gcc/gcc-7.4/0009-gcc-poison-system-directories.patc=
h
> > >>>  create mode 100644
> meta/recipes-devtools/gcc/gcc-7.4/0010-gcc-poison-dir-extend.patch
> > >>>  create mode 100644
> meta/recipes-devtools/gcc/gcc-7.4/0011-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGE=
T.patch
> > >>>  create mode 100644
> meta/recipes-devtools/gcc/gcc-7.4/0012-64-bit-multilib-hack.patch
> > >>>  create mode 100644
> meta/recipes-devtools/gcc/gcc-7.4/0013-optional-libstdc.patch
> > >>>  create mode 100644
> meta/recipes-devtools/gcc/gcc-7.4/0014-gcc-disable-MASK_RELAX_PIC_CALLS-b=
it.patch
> > >>>  create mode 100644
> meta/recipes-devtools/gcc/gcc-7.4/0015-COLLECT_GCC_OPTIONS.patch
> > >>>  create mode 100644
> meta/recipes-devtools/gcc/gcc-7.4/0016-Use-the-defaults.h-in-B-instead-of=
-S-and-t-oe-in-B.patch
> > >>>  create mode 100644
> meta/recipes-devtools/gcc/gcc-7.4/0017-fortran-cross-compile-hack.patch
> > >>>  create mode 100644
> meta/recipes-devtools/gcc/gcc-7.4/0018-cpp-honor-sysroot.patch
> > >>>  create mode 100644
> meta/recipes-devtools/gcc/gcc-7.4/0019-MIPS64-Default-to-N64-ABI.patch
> > >>>  create mode 100644
> meta/recipes-devtools/gcc/gcc-7.4/0020-Define-GLIBC_DYNAMIC_LINKER-and-UC=
LIBC_DYNAMIC_LINKE.patch
> > >>>  create mode 100644
> meta/recipes-devtools/gcc/gcc-7.4/0021-gcc-Fix-argument-list-too-long-err=
or.patch
> > >>>  create mode 100644
> meta/recipes-devtools/gcc/gcc-7.4/0022-Disable-sdt.patch
> > >>>  create mode 100644
> meta/recipes-devtools/gcc/gcc-7.4/0023-libtool.patch
> > >>>  create mode 100644
> meta/recipes-devtools/gcc/gcc-7.4/0024-gcc-armv4-pass-fix-v4bx-to-linker-=
to-support-EABI.patch
> > >>>  create mode 100644
> meta/recipes-devtools/gcc/gcc-7.4/0025-Use-the-multilib-config-files-from=
-B-instead-of-usin.patch
> > >>>  create mode 100644
> meta/recipes-devtools/gcc/gcc-7.4/0026-Avoid-using-libdir-from-.la-which-=
usually-points-to-.patch
> > >>>  create mode 100644
> meta/recipes-devtools/gcc/gcc-7.4/0027-export-CPP.patch
> > >>>  create mode 100644
> meta/recipes-devtools/gcc/gcc-7.4/0028-Enable-SPE-AltiVec-generation-on-p=
owepc-linux-target.patch
> > >>>  create mode 100644
> meta/recipes-devtools/gcc/gcc-7.4/0029-Disable-the-MULTILIB_OSDIRNAMES-an=
d-other-multilib-o.patch
> > >>>  create mode 100644
> meta/recipes-devtools/gcc/gcc-7.4/0030-Ensure-target-gcc-headers-can-be-i=
ncluded.patch
> > >>>  create mode 100644
> meta/recipes-devtools/gcc/gcc-7.4/0031-gcc-4.8-won-t-build-with-disable-d=
ependency-tracking.patch
> > >>>  create mode 100644
> meta/recipes-devtools/gcc/gcc-7.4/0032-Don-t-search-host-directory-during=
-relink-if-inst_pr.patch
> > >>>  create mode 100644
> meta/recipes-devtools/gcc/gcc-7.4/0033-Use-SYSTEMLIBS_DIR-replacement-ins=
tead-of-hardcoding.patch
> > >>>  create mode 100644
> meta/recipes-devtools/gcc/gcc-7.4/0034-aarch64-Add-support-for-musl-ldso.=
patch
> > >>>  create mode 100644
> meta/recipes-devtools/gcc/gcc-7.4/0035-libcc1-fix-libcc1-s-install-path-a=
nd-rpath.patch
> > >>>  create mode 100644
> meta/recipes-devtools/gcc/gcc-7.4/0036-handle-sysroot-support-for-natives=
dk-gcc.patch
> > >>>  create mode 100644
> meta/recipes-devtools/gcc/gcc-7.4/0037-Search-target-sysroot-gcc-version-=
specific-dirs-with.patch
> > >>>  create mode 100644
> meta/recipes-devtools/gcc/gcc-7.4/0038-Fix-various-_FOR_BUILD-and-related=
-variables.patch
> > >>>  create mode 100644
> meta/recipes-devtools/gcc/gcc-7.4/0039-nios2-Define-MUSL_DYNAMIC_LINKER.p=
atch
> > >>>  create mode 100644
> meta/recipes-devtools/gcc/gcc-7.4/0040-Add-ssp_nonshared-to-link-commandl=
ine-for-musl-targe.patch
> > >>>  create mode 100644
> meta/recipes-devtools/gcc/gcc-7.4/0041-gcc-libcpp-support-ffile-prefix-ma=
p-old-new.patch
> > >>>  create mode 100644
> meta/recipes-devtools/gcc/gcc-7.4/0042-Reuse-fdebug-prefix-map-to-replace=
-ffile-prefix-map.patch
> > >>>  create mode 100644
> meta/recipes-devtools/gcc/gcc-7.4/0043-gcc-final.c-fdebug-prefix-map-supp=
ort-to-remap-sourc.patch
> > >>>  create mode 100644
> meta/recipes-devtools/gcc/gcc-7.4/0044-libgcc-Add-knob-to-use-ldbl-128-on=
-ppc.patch
> > >>>  create mode 100644
> meta/recipes-devtools/gcc/gcc-7.4/0045-Link-libgcc-using-LDFLAGS-not-just=
-SHLIB_LDFLAGS.patch
> > >>>  create mode 100644
> meta/recipes-devtools/gcc/gcc-7.4/0047-sync-gcc-stddef.h-with-musl.patch
> > >>>  create mode 100644
> meta/recipes-devtools/gcc/gcc-7.4/0048-gcc-Enable-static-PIE.patch
> > >>>  create mode 100644
> meta/recipes-devtools/gcc/gcc-7.4/fix-segmentation-fault-precompiled-hdr.=
patch
> > >>>  create mode 100644
> meta/recipes-devtools/gcc/gcc-7.4/no-sse-fix-test-case-failures.patch
> > >>>  delete mode 100644 meta/recipes-devtools/gcc/
> gcc-cross-canadian_7.3.bb
> > >>>  create mode 100644 meta/recipes-devtools/gcc/
> gcc-cross-canadian_7.4.bb
> > >>>  delete mode 100644 meta/recipes-devtools/gcc/
> gcc-cross-initial_7.3.bb
> > >>>  create mode 100644 meta/recipes-devtools/gcc/
> gcc-cross-initial_7.4.bb
> > >>>  delete mode 100644 meta/recipes-devtools/gcc/gcc-cross_7.3.bb
> > >>>  create mode 100644 meta/recipes-devtools/gcc/gcc-cross_7.4.bb
> > >>>  delete mode 100644 meta/recipes-devtools/gcc/
> gcc-crosssdk-initial_7.3.bb
> > >>>  create mode 100644 meta/recipes-devtools/gcc/
> gcc-crosssdk-initial_7.4.bb
> > >>>  delete mode 100644 meta/recipes-devtools/gcc/gcc-crosssdk_7.3.bb
> > >>>  create mode 100644 meta/recipes-devtools/gcc/gcc-crosssdk_7.4.bb
> > >>>  delete mode 100644 meta/recipes-devtools/gcc/gcc-runtime_7.3.bb
> > >>>  create mode 100644 meta/recipes-devtools/gcc/gcc-runtime_7.4.bb
> > >>>  delete mode 100644 meta/recipes-devtools/gcc/gcc-sanitizers_7.3.bb
> > >>>  create mode 100644 meta/recipes-devtools/gcc/gcc-sanitizers_7.4.bb
> > >>>  delete mode 100644 meta/recipes-devtools/gcc/gcc-source_7.3.bb
> > >>>  create mode 100644 meta/recipes-devtools/gcc/gcc-source_7.4.bb
> > >>>  delete mode 100644 meta/recipes-devtools/gcc/gcc_7.3.bb
> > >>>  create mode 100644 meta/recipes-devtools/gcc/gcc_7.4.bb
> > >>>  delete mode 100644 meta/recipes-devtools/gcc/libgcc-initial_7.3.bb
> > >>>  create mode 100644 meta/recipes-devtools/gcc/libgcc-initial_7.4.bb
> > >>>  delete mode 100644 meta/recipes-devtools/gcc/libgcc_7.3.bb
> > >>>  create mode 100644 meta/recipes-devtools/gcc/libgcc_7.4.bb
> > >>>  delete mode 100644 meta/recipes-devtools/gcc/libgfortran_7.3.bb
> > >>>  create mode 100644 meta/recipes-devtools/gcc/libgfortran_7.4.bb
> > >>>
> > >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.3.inc
> b/meta/recipes-devtools/gcc/gcc-7.3.inc
> > >>> deleted file mode 100644
> > >>> index d4aaca4..0000000
> > >>> --- a/meta/recipes-devtools/gcc/gcc-7.3.inc
> > >>> +++ /dev/null
> > >>> @@ -1,132 +0,0 @@
> > >>> -require gcc-common.inc
> > >>> -
> > >>> -# Third digit in PV should be incremented after a minor release
> > >>> -
> > >>> -PV =3D "7.3.0"
> > >>> -
> > >>> -# BINV should be incremented to a revision after a minor gcc relea=
se
> > >>> -
> > >>> -BINV =3D "7.3.0"
> > >>> -
> > >>> -FILESEXTRAPATHS =3D.
> "${FILE_DIRNAME}/gcc-7.3:${FILE_DIRNAME}/gcc-7.3/backport:"
> > >>> -
> > >>> -DEPENDS =3D+ "mpfr gmp libmpc zlib flex-native"
> > >>> -NATIVEDEPS =3D "mpfr-native gmp-native libmpc-native zlib-native
> flex-native"
> > >>> -
> > >>> -LICENSE =3D "GPL-3.0-with-GCC-exception & GPLv3"
> > >>> -
> > >>> -LIC_FILES_CHKSUM =3D "\
> > >>> -    file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6552 \
> > >>> -    file://COPYING3;md5=3Dd32239bcb673463ab874e80d47fae504 \
> > >>> -    file://COPYING3.LIB;md5=3D6a6a8e020838b23406c81b19c1d46df6 \
> > >>> -    file://COPYING.LIB;md5=3D2d5025d4aa3495befef8f17206a5b0a1 \
> > >>> -    file://COPYING.RUNTIME;md5=3Dfe60d87048567d4fe8c8a0ed2448bcc8 =
\
> > >>> -"
> > >>> -
> > >>> -#RELEASE =3D "7-20170504"
> > >>> -BASEURI ?=3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz"
> > >>> -#SRCREV =3D "f7cf798b73fd1a07098f9a490deec1e2a36e0bed"
> > >>> -#BASEURI ?=3D "git://
> github.com/gcc-mirror/gcc;branch=3Dgcc-6-branch;protocol=3Dgit"
> > >>> -#BASEURI ?=3D "
> http://mirrors.concertpass.com/gcc/snapshots/${RELEASE}/gcc-${RELEASE}.ta=
r.bz2
> "
> > >>> -
> > >>> -SRC_URI =3D "\
> > >>> -           ${BASEURI} \
> > >>> -           file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
> > >>> -           file://0008-c99-snprintf.patch \
> > >>> -           file://0009-gcc-poison-system-directories.patch \
> > >>> -           file://0010-gcc-poison-dir-extend.patch \
> > >>> -           file://0011-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch \
> > >>> -           file://0012-64-bit-multilib-hack.patch \
> > >>> -           file://0013-optional-libstdc.patch \
> > >>> -           file://0014-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch =
\
> > >>> -           file://0015-COLLECT_GCC_OPTIONS.patch \
> > >>> -
>  file://0016-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch \
> > >>> -           file://0017-fortran-cross-compile-hack.patch \
> > >>> -           file://0018-cpp-honor-sysroot.patch \
> > >>> -           file://0019-MIPS64-Default-to-N64-ABI.patch \
> > >>> -
>  file://0020-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch \
> > >>> -           file://0021-gcc-Fix-argument-list-too-long-error.patch =
\
> > >>> -           file://0022-Disable-sdt.patch \
> > >>> -           file://0023-libtool.patch \
> > >>> -
>  file://0024-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch \
> > >>> -
>  file://0025-Use-the-multilib-config-files-from-B-instead-of-usin.patch \
> > >>> -
>  file://0026-Avoid-using-libdir-from-.la-which-usually-points-to-.patch \
> > >>> -           file://0027-export-CPP.patch \
> > >>> -
>  file://0028-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch \
> > >>> -
>  file://0029-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch \
> > >>> -
>  file://0030-Ensure-target-gcc-headers-can-be-included.patch \
> > >>> -
>  file://0031-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch \
> > >>> -
>  file://0032-Don-t-search-host-directory-during-relink-if-inst_pr.patch \
> > >>> -
>  file://0033-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch \
> > >>> -           file://0034-aarch64-Add-support-for-musl-ldso.patch \
> > >>> -
>  file://0035-libcc1-fix-libcc1-s-install-path-and-rpath.patch \
> > >>> -
>  file://0036-handle-sysroot-support-for-nativesdk-gcc.patch \
> > >>> -
>  file://0037-Search-target-sysroot-gcc-version-specific-dirs-with.patch \
> > >>> -
>  file://0038-Fix-various-_FOR_BUILD-and-related-variables.patch \
> > >>> -           file://0039-nios2-Define-MUSL_DYNAMIC_LINKER.patch \
> > >>> -
>  file://0040-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch \
> > >>> -
>  file://0041-gcc-libcpp-support-ffile-prefix-map-old-new.patch \
> > >>> -
>  file://0042-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch \
> > >>> -
>  file://0043-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch \
> > >>> -           file://0044-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patc=
h
> \
> > >>> -
>  file://0045-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch \
> > >>> -           file://0047-sync-gcc-stddef.h-with-musl.patch \
> > >>> -           file://0048-gcc-Enable-static-PIE.patch \
> > >>> -           file://fix-segmentation-fault-precompiled-hdr.patch \
> > >>> -           file://no-sse-fix-test-case-failures.patch \
> > >>> -           ${BACKPORTS} \
> > >>> -"
> > >>> -BACKPORTS =3D "\
> > >>> -
>  file://0001-Fix-internal-compiler-error-in-testcase.patch \
> > >>> -           file://0001-PR-rtl-optimization-83030.patch \
> > >>> -
>  file://0001-Fix-ppc64le-build-Partial-backport-r256656.patch \
> > >>> -           file://0001-PR-c-80290-memory-hog-with-std-pair.patch \
> > >>> -"
> > >>> -
> > >>> -SRC_URI[md5sum] =3D "be2da21680f27624f3a87055c4ba5af2"
> > >>> -SRC_URI[sha256sum] =3D
> "832ca6ae04636adbb430e865a1451adf6979ab44ca1c8374f61fba65645ce15c"
> > >>> -
> > >>> -S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
> > >>> -#S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/git"
> > >>> -B =3D "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
> > >>> -
> > >>> -# Language Overrides
> > >>> -FORTRAN =3D ""
> > >>> -JAVA =3D ""
> > >>> -
> > >>> -LTO =3D "--enable-lto"
> > >>> -
> > >>> -EXTRA_OECONF_BASE =3D "\
> > >>> -    ${LTO} \
> > >>> -    --enable-libssp \
> > >>> -    --enable-libitm \
> > >>> -    --disable-bootstrap \
> > >>> -    --disable-libmudflap \
> > >>> -    --with-system-zlib \
> > >>> -    ${@'--with-linker-hash-style=3D${LINKER_HASH_STYLE}' if
> '${LINKER_HASH_STYLE}' else ''} \
> > >>> -    --enable-linker-build-id \
> > >>> -    --with-ppl=3Dno \
> > >>> -    --with-cloog=3Dno \
> > >>> -    --enable-checking=3Drelease \
> > >>> -    --enable-cheaders=3Dc_global \
> > >>> -    --without-isl \
> > >>> -"
> > >>> -
> > >>> -EXTRA_OECONF_INITIAL =3D "\
> > >>> -    --disable-libmudflap \
> > >>> -    --disable-libgomp \
> > >>> -    --disable-libitm \
> > >>> -    --disable-libquadmath \
> > >>> -    --with-system-zlib \
> > >>> -    --disable-lto \
> > >>> -    --disable-plugin \
> > >>> -    --enable-decimal-float=3Dno \
> > >>> -    --without-isl \
> > >>> -    gcc_cv_libc_provides_ssp=3Dyes \
> > >>> -"
> > >>> -
> > >>> -EXTRA_OECONF_PATHS =3D "\
> > >>> -
> --with-gxx-include-dir=3D/not/exist{target_includedir}/c++/${BINV} \
> > >>> -    --with-sysroot=3D/not/exist \
> > >>> -    --with-build-sysroot=3D${STAGING_DIR_TARGET} \
> > >>> -"
> > >>> diff --git
> a/meta/recipes-devtools/gcc/gcc-7.3/0001-Fix-internal-compiler-error-in-t=
estcase.patch
> b/meta/recipes-devtools/gcc/gcc-7.3/0001-Fix-internal-compiler-error-in-t=
estcase.patch
> > >>> deleted file mode 100644
> > >>> index 45cc0ee..0000000
> > >>> ---
> a/meta/recipes-devtools/gcc/gcc-7.3/0001-Fix-internal-compiler-error-in-t=
estcase.patch
> > >>> +++ /dev/null
> > >>> @@ -1,212 +0,0 @@
> > >>> -From d3cdd96a300f9003a1cc242541605169aacdc811 Mon Sep 17 00:00:00
> 2001
> > >>> -From: willschm <willschm@138bc75d-0d04-0410-961f-82ee72b054a4>
> > >>> -Date: Mon, 25 Sep 2017 14:35:02 +0000
> > >>> -Subject: [PATCH] [gcc]
> > >>> -
> > >>> -2017-09-25  Will Schmidt  <will_schmidt@vnet.ibm.com>
> > >>> -
> > >>> -       * config/rs6000/rs6000.c (rs6000_gimple_fold_builtin): Add
> handling
> > >>> -       for early folding of vector stores (ALTIVEC_BUILTIN_ST_*).
> > >>> -       (rs6000_builtin_valid_without_lhs): New helper function.
> > >>> -       * config/rs6000/rs6000-c.c
> (altivec_resolve_overloaded_builtin):
> > >>> -       Remove obsoleted code for handling ALTIVEC_BUILTIN_VEC_ST.
> > >>> -
> > >>> -git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@253152
> 138bc75d-0d04-0410-961f-82ee72b054a4
> > >>> -
> > >>> -Fix internal compiler error for testcase gcc.dg/vmx/7d-02.c
> > >>> -
> > >>> -Upstream commit: d3cdd96a300f9003a1cc242541605169aacdc811
> > >>> -
> > >>> -Backport by Kaushik Phatak <Kaushik.Phatak@kpit.com>
> > >>> -
> > >>> -This patch removes changes to Changelog from the original upstream
> patch.
> > >>> -This will help us avoid conflicts.
> > >>> -
> > >>> -Upstream-Status: Backport
> > >>> -
> > >>> -Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> > >>> ----
> > >>> - gcc/ChangeLog                |  8 +++++
> > >>> - gcc/config/rs6000/rs6000-c.c | 72
> -------------------------------------------
> > >>> - gcc/config/rs6000/rs6000.c   | 73
> ++++++++++++++++++++++++++++++++++++++++++--
> > >>> - 3 files changed, 78 insertions(+), 75 deletions(-)
> > >>> -
> > >>> -diff --git a/gcc/config/rs6000/rs6000-c.c
> b/gcc/config/rs6000/rs6000-c.c
> > >>> -index a49db97..4a363a1 100644
> > >>> ---- a/gcc/config/rs6000/rs6000-c.c
> > >>> -+++ b/gcc/config/rs6000/rs6000-c.c
> > >>> -@@ -6279,70 +6279,6 @@ altivec_resolve_overloaded_builtin (loca
> > >>> -       }
> > >>> -     }
> > >>> -
> > >>> --  /* Similarly for stvx.  */
> > >>> --  if (fcode =3D=3D ALTIVEC_BUILTIN_VEC_ST
> > >>> --      && (BYTES_BIG_ENDIAN || !VECTOR_ELT_ORDER_BIG)
> > >>> --      && nargs =3D=3D 3)
> > >>> --    {
> > >>> --      tree arg0 =3D (*arglist)[0];
> > >>> --      tree arg1 =3D (*arglist)[1];
> > >>> --      tree arg2 =3D (*arglist)[2];
> > >>> --
> > >>> --      /* Construct the masked address.  Let existing error
> handling take
> > >>> --       over if we don't have a constant offset.  */
> > >>> --      arg1 =3D fold (arg1);
> > >>> --
> > >>> --      if (TREE_CODE (arg1) =3D=3D INTEGER_CST)
> > >>> --      {
> > >>> --        if (!ptrofftype_p (TREE_TYPE (arg1)))
> > >>> --          arg1 =3D build1 (NOP_EXPR, sizetype, arg1);
> > >>> --
> > >>> --        tree arg2_type =3D TREE_TYPE (arg2);
> > >>> --        if (TREE_CODE (arg2_type) =3D=3D ARRAY_TYPE && c_dialect_=
cxx
> ())
> > >>> --          {
> > >>> --            /* Force array-to-pointer decay for C++.  */
> > >>> --            arg2 =3D default_conversion (arg2);
> > >>> --            arg2_type =3D TREE_TYPE (arg2);
> > >>> --          }
> > >>> --
> > >>> --        /* Find the built-in to make sure a compatible one exists=
;
> if not
> > >>> --           we fall back to default handling to get the error
> message.  */
> > >>> --        for (desc =3D altivec_overloaded_builtins;
> > >>> --             desc->code && desc->code !=3D fcode; desc++)
> > >>> --          continue;
> > >>> --
> > >>> --        for (; desc->code =3D=3D fcode; desc++)
> > >>> --          if (rs6000_builtin_type_compatible (TREE_TYPE (arg0),
> desc->op1)
> > >>> --              && rs6000_builtin_type_compatible (TREE_TYPE (arg1)=
,
> desc->op2)
> > >>> --              && rs6000_builtin_type_compatible (TREE_TYPE (arg2)=
,
> > >>> --                                                 desc->op3))
> > >>> --            {
> > >>> --              tree addr =3D fold_build2_loc (loc, POINTER_PLUS_EX=
PR,
> arg2_type,
> > >>> --                                           arg2, arg1);
> > >>> --              tree aligned
> > >>> --                =3D fold_build2_loc (loc, BIT_AND_EXPR, arg2_type=
,
> > >>> --

--000000000000708d8e0580205610
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed,=
 Jan 23, 2019 at 3:02 AM &lt;<a href=3D"mailto:Mikko.Rapeli@bmw.de">Mikko.R=
apeli@bmw.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Tue,=
 Jan 22, 2019 at 04:18:09PM -0800, akuster808 wrote:<br>
&gt; <br>
&gt; <br>
&gt; On 1/17/19 12:01 AM, <a href=3D"mailto:Mikko.Rapeli@bmw.de" target=3D"=
_blank">Mikko.Rapeli@bmw.de</a> wrote:<br>
&gt; &gt; On Wed, Jan 16, 2019 at 11:48:29PM -0800, Khem Raj wrote:<br>
&gt; &gt;&gt; we need to apply this to thud as well, otherwise people upgra=
ding from<br>
&gt; &gt;&gt; sumo to thud and staying with gcc 7 will see a downgrade. I a=
m fine<br>
&gt; &gt;&gt; with the patch in general since its a point release. It still=
 can<br>
&gt; &gt;&gt; cause issues so its not a simple change.<br>
&gt; &gt; Ok, I had forgot about thud since I&#39;m not using. Patch applie=
s with conflicts,<br>
&gt; &gt; meta/recipes-devtools/gcc/gcc-7.4/0008-c99-snprintf.patch needs t=
o be deleted.<br>
&gt; <br>
&gt; Actual it has turned out to be more than that.<br>
&gt; 0049-gcc-override-TARGET_LIBC_PROVIDES_SSP.patch did not migrate over<=
br>
&gt; and I had to refresh a lot of patches.<br>
&gt; <br>
&gt; Now I am seeing a compile error.<br>
&gt; <br>
&gt; usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/7.4.0/include/unwind.h=
&#39;:<br>
&gt; No such file or directory<br>
&gt; <br>
&gt; <br>
&gt; I am not taking this update to thud in this fashion. I am more than<br=
>
&gt; happy to revisit this with a clean patch to thud.<br>
<br>
Ok. I wouldn&#39;t mind skipping this update from thud because it has gcc-8=
.2 as default<br>
anyway.<br>
<br>
But I&#39;d like to know if the update triggers any build failures on sumo =
and what<br>
ever build targets are tested by yocto?<br>
<br>
In my project I did not see any real problems, only compiler version string=
 failures<br>
in some tests.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I think even if =
we don=E2=80=99t have it default yet using older compiler on a newer releas=
e is counter intuitive and users are still using gcc7 on thud too now we ha=
ve removed it so I would not ask for doing this upgrade on master=C2=A0</di=
v><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
-Mikko<br>
<br>
&gt; - armin<br>
&gt; &gt;<br>
&gt; &gt; -Mikko<br>
&gt; &gt;<br>
&gt; &gt;&gt; On Wed, Jan 16, 2019 at 3:30 AM Mikko Rapeli &lt;<a href=3D"m=
ailto:mikko.rapeli@bmw.de" target=3D"_blank">mikko.rapeli@bmw.de</a>&gt; wr=
ote:<br>
&gt; &gt;&gt;&gt; 7.4 is a bug fix maintenance release.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; List of fixed bugs is:<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; <a href=3D"https://gcc.gnu.org/bugzilla/buglist.cgi?bug_s=
tatus=3DRESOLVED&amp;resolution=3DFIXED&amp;target_milestone=3D7.4" rel=3D"=
noreferrer" target=3D"_blank">https://gcc.gnu.org/bugzilla/buglist.cgi?bug_=
status=3DRESOLVED&amp;resolution=3DFIXED&amp;target_milestone=3D7.4</a><br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; 85113=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0c++=C2=A0 =C2=A0=
 =C2=A0jason=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [7/8 Regressio=
n] ICE with __builtin_constant_p=C2=A0 2018-12-06<br>
&gt; &gt;&gt;&gt; 86070=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0libfortr=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 jvdelisle=C2=A0 =C2=A0 =C2=A0 =C2=A0RESO=C2=A0 =C2=A0 =
FIXE=C2=A0 =C2=A0 [7 regression] gfortran.dg/fmt_zero_digits.f90 segmentati=
on fault starting with r261077=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02018-06-12<=
br>
&gt; &gt;&gt;&gt; 85442=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0libstdc+=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 redi=C2=A0 =C2=A0 RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 =
[7/8 Regression] cxx11-ios_failure.lo build fails for microblaze=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 2018-04-18<br>
&gt; &gt;&gt;&gt; 70359=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0middle-e=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 aldyh=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 =
[7/8/9 Regression] Code size increase for x86/ARM/others compared to gcc-5.=
3.0=C2=A0 2018-12-05<br>
&gt; &gt;&gt;&gt; 81228=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0target=C2=A0 amk=
er=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [7 Regression] ICE in ge=
n_vec_cmpv2dfv2di, at config/aarch64/aarch64-simd.md:2508=C2=A0 =C2=A0 =C2=
=A0 =C2=A02018-02-22<br>
&gt; &gt;&gt;&gt; 84071=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0rtl-opti=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 ebotcazou=C2=A0 =C2=A0 =C2=A0 =C2=A0RESO=C2=A0 =C2=A0 =
FIXE=C2=A0 =C2=A0 [7/8 regression] wrong elimination of zero-extension afte=
r sign-extended load=C2=A0 =C2=A02018-02-02<br>
&gt; &gt;&gt;&gt; 85925=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0rtl-opti=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 ebotcazou=C2=A0 =C2=A0 =C2=A0 =C2=A0RESO=C2=A0 =C2=A0 =
FIXE=C2=A0 =C2=A0 [7/8/9 regression] compilation of masking with 257 goes w=
rong in combine at -02=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02018-11-22<br>
&gt; &gt;&gt;&gt; 81004=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0lto=C2=A0 =C2=A0=
 =C2=A0hubicka=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=
=A0 =C2=A0 [7 Regression] linking failed with -flto and static libboost_pro=
gram_options=C2=A0 =C2=A0 2018-03-08<br>
&gt; &gt;&gt;&gt; 49726=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0driver=C2=A0 jak=
ub=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [6 Regression] -g0 file.=
S -g does not produce debug info=C2=A0 =C2=A0 =C2=A0 =C2=A0 2018-10-26<br>
&gt; &gt;&gt;&gt; 80598=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0c++=C2=A0 =C2=A0=
 =C2=A0jakub=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [7 regression]=
 -Wunused triggers for functions used in uninstantiated templates=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A02018-06-25<br>
&gt; &gt;&gt;&gt; 81661=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0tree-opt=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 jakub=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 =
[7 Regression] ICE in gimplify_modify_expr, at gimplify.c:5638=C2=A0 2018-0=
3-03<br>
&gt; &gt;&gt;&gt; 83930=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0target=C2=A0 jak=
ub=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [6 Regression] ICE: RTL =
check: expected code &#39;const_int&#39;, have &#39;mem&#39; in simplify_bi=
nary_operation_1, at simplify-rtx.c:3302=C2=A0 =C2=A0 =C2=A02018-06-25<br>
&gt; &gt;&gt;&gt; 83945=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0middle-e=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 jakub=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 =
[7 Regression] internal compiler error: Segmentation fault with -O -fcode-h=
oisting=C2=A0 =C2=A0 =C2=A0 2018-03-03<br>
&gt; &gt;&gt;&gt; 83958=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0c++=C2=A0 =C2=A0=
 =C2=A0jakub=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [7 Regression]=
 ICE: Segmentation fault (in find_decomp_class_base)=C2=A0 =C2=A0 =C2=A0 20=
18-03-03<br>
&gt; &gt;&gt;&gt; 83993=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0c++=C2=A0 =C2=A0=
 =C2=A0jakub=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [7 Regression]=
 ICE: constant not recomputed when ADDR_EXPR changed=C2=A0 =C2=A0 =C2=A0 20=
18-03-03<br>
&gt; &gt;&gt;&gt; 84082=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0c++=C2=A0 =C2=A0=
 =C2=A0jakub=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [7 Regression]=
 ICE with broken template function definition=C2=A0 =C2=A0 =C2=A02018-03-03=
<br>
&gt; &gt;&gt;&gt; 84308=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0rtl-opti=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 jakub=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 =
[7 Regression] Memory leak in spread_components=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A02018-03-03<br>
&gt; &gt;&gt;&gt; 84430=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0c++=C2=A0 =C2=A0=
 =C2=A0jakub=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [7 Regression]=
 ICE with #pragma omp simd in lambda=C2=A0 =C2=A0 =C2=A0 2018-03-03<br>
&gt; &gt;&gt;&gt; 84445=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0c++=C2=A0 =C2=A0=
 =C2=A0jakub=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [7 Regression]=
 ICE with __builtin_launder and virtual function=C2=A0 2018-03-03<br>
&gt; &gt;&gt;&gt; 84503=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0tree-opt=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 jakub=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 =
[7 Regression] store-merging miscompilation on powerpc64 with -O3 since r24=
1789=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02018-03-03<br>
&gt; &gt;&gt;&gt; 84834=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0middle-e=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 jakub=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 =
[7 Regression] ICE: tree check: expected integer_cst, have complex_cst in t=
o_wide, at tree.h:5527=C2=A0 =C2=A0 =C2=A0 =C2=A02018-06-25<br>
&gt; &gt;&gt;&gt; 84841=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0tree-opt=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 jakub=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 =
[7 Regression] ICE: tree check: expected ssa_name, have real_cst in rewrite=
_expr_tree_parallel, at tree-ssa-reassoc.c:4624=C2=A0 =C2=A0 =C2=A0 2018-06=
-23<br>
&gt; &gt;&gt;&gt; 84853=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0c=C2=A0 =C2=A0 =
=C2=A0 =C2=A0jakub=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [7 Regre=
ssion] ICE: verify_gimple failed (expand_shift_1)=C2=A0 =C2=A0 =C2=A0 =C2=
=A02018-06-25<br>
&gt; &gt;&gt;&gt; 84961=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0c++=C2=A0 =C2=A0=
 =C2=A0jakub=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [7 Regression]=
 ICE error: SSA_NAME_DEF_STMT is wrong=C2=A0 =C2=A0 2018-06-25<br>
&gt; &gt;&gt;&gt; 84999=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0c=C2=A0 =C2=A0 =
=C2=A0 =C2=A0jakub=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [7 Regre=
ssion] ICE in make_vector_type, at tree.c:9561=C2=A0 2018-06-25<br>
&gt; &gt;&gt;&gt; 85430=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0target=C2=A0 jak=
ub=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [7 Regression] ICE: SIGS=
EGV in memory_operand at recog.c:1358/9 with -O2 -fno-tree-ccp -fno-tree-fr=
e=C2=A0 =C2=A0 2018-06-25<br>
&gt; &gt;&gt;&gt; 85446=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0tree-opt=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 jakub=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 =
[7 Regression] wrong-code on riscv64=C2=A0 =C2=A0 2018-06-25<br>
&gt; &gt;&gt;&gt; 86314=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0target=C2=A0 jak=
ub=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [7/8/9 Regression] GCC 7=
.x and 8.x zero out &quot;eax&quot; before using &quot;rax&quot; in &quot;l=
ock bts&quot;=C2=A0 =C2=A0 =C2=A0 2018-06-26<br>
&gt; &gt;&gt;&gt; 71569=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0c++=C2=A0 =C2=A0=
 =C2=A0jason=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [6 regression]=
 Crash: External definition of template member from template struct=C2=A0 =
=C2=A0 =C2=A0 =C2=A02018-10-26<br>
&gt; &gt;&gt;&gt; 71834=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0c++=C2=A0 =C2=A0=
 =C2=A0jason=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [6/7 Regressio=
n] accepts invalid C++11 code with too few number of template arguments for=
 class template=C2=A0 =C2=A0 =C2=A0 =C2=A0 2018-03-23<br>
&gt; &gt;&gt;&gt; 80227=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0c++=C2=A0 =C2=A0=
 =C2=A0jason=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [6/7 Regressio=
n] SFINAE ambiguity with a pointer to array argument=C2=A0 =C2=A0 =C2=A0 20=
18-05-10<br>
&gt; &gt;&gt;&gt; 80290=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0c++=C2=A0 =C2=A0=
 =C2=A0jason=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [6/7/8/9 Regre=
ssion] g++ uses unreasonable amount of memory compiling nested string maps=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 2018-06-28<br>
&gt; &gt;&gt;&gt; 82152=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0c++=C2=A0 =C2=A0=
 =C2=A0jason=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [7 Regression]=
 ICE on invalid code in C++17 mode if inheriting constructors are used=C2=
=A0 =C2=A0 2018-04-06<br>
&gt; &gt;&gt;&gt; 82336=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0c++=C2=A0 =C2=A0=
 =C2=A0jason=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [6 Regression]=
 GCC requires but does not emit defaulted constructors in certain cases=C2=
=A0 =C2=A02018-10-26<br>
&gt; &gt;&gt;&gt; 82461=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0c++=C2=A0 =C2=A0=
 =C2=A0jason=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [7 Regression]=
 Temporary required for brace-initializing (non-literal-type) member variab=
le=C2=A0 =C2=A0 =C2=A02018-01-29<br>
&gt; &gt;&gt;&gt; 82664=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0c++=C2=A0 =C2=A0=
 =C2=A0jason=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [7/8 Regressio=
n ] ICE when using Match7 library=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02018-02-=
16<br>
&gt; &gt;&gt;&gt; 82764=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0c++=C2=A0 =C2=A0=
 =C2=A0jason=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [7/8 Regressio=
n] ICE in output_constructor_regular_field, at varasm.c:5030=C2=A0 =C2=A0 =
=C2=A0 2018-05-03<br>
&gt; &gt;&gt;&gt; 83227=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0c++=C2=A0 =C2=A0=
 =C2=A0jason=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [7 Regression]=
 internal compiler error: in process_init_constructor_array=C2=A0 =C2=A0 =
=C2=A0 =C2=A02018-02-16<br>
&gt; &gt;&gt;&gt; 84045=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0c++=C2=A0 =C2=A0=
 =C2=A0jason=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [7 Regression]=
 ICE when is_nothrow_default_constructible is used before #include&lt;set&g=
t;=C2=A0 =C2=A02018-02-16<br>
&gt; &gt;&gt;&gt; 84355=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0c++=C2=A0 =C2=A0=
 =C2=A0jason=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [7 Regression]=
 ICE with failing template argument deduction=C2=A0 =C2=A0 =C2=A02018-03-23=
<br>
&gt; &gt;&gt;&gt; 84665=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0c++=C2=A0 =C2=A0=
 =C2=A0jason=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [7/8 Regressio=
n] internal compiler error: in build_value_init, at cp/init.c:343=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A02018-04-05<br>
&gt; &gt;&gt;&gt; 84937=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0c++=C2=A0 =C2=A0=
 =C2=A0jason=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [7 Regression]=
 ICE with class template argument deduction and auto=C2=A0 =C2=A0 =C2=A0 20=
18-03-23<br>
&gt; &gt;&gt;&gt; 85006=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0c++=C2=A0 =C2=A0=
 =C2=A0jason=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [7 Regression]=
 [concepts] ICE with bogus parameter pack=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
2018-04-06<br>
&gt; &gt;&gt;&gt; 85060=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0c++=C2=A0 =C2=A0=
 =C2=A0jason=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [7/8 Regressio=
n] Object cannot call its inherited member function &quot;without object&qu=
ot;=C2=A0 =C2=A0 =C2=A0 2018-04-03<br>
&gt; &gt;&gt;&gt; 85148=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0c++=C2=A0 =C2=A0=
 =C2=A0jason=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [6/7/8 Regress=
ion] ICE with NSDMI and this pointer=C2=A0 =C2=A0 =C2=A0 2018-04-04<br>
&gt; &gt;&gt;&gt; 85279=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0c++=C2=A0 =C2=A0=
 =C2=A0jason=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [6 Regression]=
 Broken diagnostic for decltype=C2=A0 =C2=A02018-05-01<br>
&gt; &gt;&gt;&gt; 85470=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0c++=C2=A0 =C2=A0=
 =C2=A0jason=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [7 Regression]=
 Strange error about &quot;call to non-constexpr function&quot;=C2=A0 =C2=
=A0 =C2=A02018-04-23<br>
&gt; &gt;&gt;&gt; 85646=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0c++=C2=A0 =C2=A0=
 =C2=A0jason=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [7/8/9 Regress=
ion] Incorrect lambda visibility with -fvisibility=3Dhidden=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A02018-09-04<br>
&gt; &gt;&gt;&gt; 85815=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0c++=C2=A0 =C2=A0=
 =C2=A0jason=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [7/8/9 Regress=
ion] incorrect &quot;invalid use of incomplete type&quot; in a lambda on va=
lid code=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02018-06-12<br>
&gt; &gt;&gt;&gt; 86060=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0c++=C2=A0 =C2=A0=
 =C2=A0jason=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [6/7/8/9 Regre=
ssion] g++ ICE at on with &quot;c++03&quot; in tsubst_copy, at cp/pt.c:1545=
9=C2=A0 =C2=A0 =C2=A0 =C2=A0 2018-06-12<br>
&gt; &gt;&gt;&gt; 33562=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0tree-opt=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 law=C2=A0 =C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =
=C2=A0 [6 Regression] aggregate DSE disabled=C2=A0 =C2=A02018-04-30<br>
&gt; &gt;&gt;&gt; 84658=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0ipa=C2=A0 =C2=A0=
 =C2=A0marxin=C2=A0 RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [7 Regression] -O3 =
-fmerge-all-constants causes incorrect for-each loop generation.=C2=A0 =C2=
=A0 =C2=A02018-04-24<br>
&gt; &gt;&gt;&gt; 84154=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0target=C2=A0 mei=
ssner=C2=A0 =C2=A0 =C2=A0 =C2=A0 RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [7 Reg=
ression] PowerPC GCC 7 and 8 have regression in converting fp to short/char=
 and returning it=C2=A0 =C2=A0 =C2=A0 2018-02-17<br>
&gt; &gt;&gt;&gt; 71638=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0c++=C2=A0 =C2=A0=
 =C2=A0mpolacek=C2=A0 =C2=A0 =C2=A0 =C2=A0 RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=
=A0 [6 Regression] ICE on invalid C++ code on x86_64-linux-gnu with -Wall (=
internal compiler error: non-constant element in constant CONSTRUCTOR)=C2=
=A0 =C2=A02018-10-26<br>
&gt; &gt;&gt;&gt; 81860=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0c++=C2=A0 =C2=A0=
 =C2=A0mpolacek=C2=A0 =C2=A0 =C2=A0 =C2=A0 RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=
=A0 [7 Regression] Call to undefined inline function involving inheriting c=
onstructors=C2=A0 =C2=A0 =C2=A0 2018-02-19<br>
&gt; &gt;&gt;&gt; 84590=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0c++=C2=A0 =C2=A0=
 =C2=A0mpolacek=C2=A0 =C2=A0 =C2=A0 =C2=A0 RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=
=A0 [7 Regression] -fsanitize=3Dundefined internal compiler error: tree che=
ck: expected constructor, have target_expr in split_nonconstant_init_1, at =
cp/typeck2.c:629=C2=A0 =C2=A0 =C2=A0 =C2=A0 2018-03-02<br>
&gt; &gt;&gt;&gt; 84854=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0c++=C2=A0 =C2=A0=
 =C2=A0mpolacek=C2=A0 =C2=A0 =C2=A0 =C2=A0 RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=
=A0 [7 Regression] ICE: unexpected expression in cxx_eval_constant_expressi=
on, at cp/constexpr.c:4774=C2=A0 =C2=A0 =C2=A0 =C2=A02018-03-22<br>
&gt; &gt;&gt;&gt; 84927=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0c++=C2=A0 =C2=A0=
 =C2=A0mpolacek=C2=A0 =C2=A0 =C2=A0 =C2=A0 RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=
=A0 [7 Regression] ICE with NSDMI and reference=C2=A0 =C2=A0 =C2=A02018-03-=
22<br>
&gt; &gt;&gt;&gt; 88120=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0c++=C2=A0 =C2=A0=
 =C2=A0mpolacek=C2=A0 =C2=A0 =C2=A0 =C2=A0 RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=
=A0 [7 Regression] ICE in contains_placeholder_p at gcc/tree.c:3710=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A02018-12-04<br>
&gt; &gt;&gt;&gt; 87542=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0c++=C2=A0 =C2=A0=
 =C2=A0msebor=C2=A0 RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [7/8 Regression] bo=
gus error on attribute format with a named constant argument=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A02018-11-19<br>
&gt; &gt;&gt;&gt; 87462=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0debug=C2=A0 =C2=
=A0nathan=C2=A0 RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [7/8 Regression] undefi=
ned reference error occurs when -g, -fdebug-types-section and -O2 are used =
at the same time=C2=A0 =C2=A0 =C2=A0 2018-11-30<br>
&gt; &gt;&gt;&gt; 85222=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0libstdc+=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 redi=C2=A0 =C2=A0 RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 =
[7 Regression] ABI breakage of __throw_ios_failure by r244498=C2=A0 =C2=A02=
018-08-08<br>
&gt; &gt;&gt;&gt; 85464=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0c++=C2=A0 =C2=A0=
 =C2=A0redi=C2=A0 =C2=A0 RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [7 Regression]=
 Wignored-qualifiers is emitted by cc1plus without diagnostics when trigger=
ed by a cast operator.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02018-04-19<br>
&gt; &gt;&gt;&gt; 85904=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0target=C2=A0 red=
i=C2=A0 =C2=A0 RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [7/8 Regression] configu=
re issue cross compiling on netbsd, with patch=C2=A0 2018-08-13<br>
&gt; &gt;&gt;&gt; 45397=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0tree-opt=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 rguenth=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RESO=C2=A0 =
=C2=A0 FIXE=C2=A0 =C2=A0 [6 Regression] Issues with integer narrowing conve=
rsions=C2=A0 =C2=A0 =C2=A0 =C2=A0 2018-11-19<br>
&gt; &gt;&gt;&gt; 79351=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0tree-opt=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 rguenth=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RESO=C2=A0 =
=C2=A0 FIXE=C2=A0 =C2=A0 [7/8/9 Regression] Invalid tree PRE optimization a=
round compound literal=C2=A0 =C2=A0 =C2=A0 =C2=A0 2018-11-28<br>
&gt; &gt;&gt;&gt; 84233=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0middle-e=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 rguenth=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RESO=C2=A0 =
=C2=A0 FIXE=C2=A0 =C2=A0 [7/8 Regression] ICE (segfault) in gimple_assign_r=
hs_code=C2=A0 =C2=A0 =C2=A0 =C2=A02018-02-08<br>
&gt; &gt;&gt;&gt; 84486=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0tree-opt=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 rguenth=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RESO=C2=A0 =
=C2=A0 FIXE=C2=A0 =C2=A0 [7 Regression] code hoisting removes alignment ass=
umption=C2=A0 =C2=A0 =C2=A0 =C2=A02018-03-06<br>
&gt; &gt;&gt;&gt; 85168=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0tree-opt=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 rguenth=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RESO=C2=A0 =
=C2=A0 FIXE=C2=A0 =C2=A0 [7 Regression] ICE in tree-ssa-coalesce.c: SSA cor=
ruption: Unable to coalesce ssa_names which are marked as MUST COALESCE whe=
n -O2 is used=C2=A0 =C2=A0 =C2=A0 2018-04-26<br>
&gt; &gt;&gt;&gt; 85284=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0tree-opt=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 rguenth=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RESO=C2=A0 =
=C2=A0 FIXE=C2=A0 =C2=A0 [7 Regression] Loop miscompilation starting with r=
238367=C2=A0 =C2=A0 =C2=A0 =C2=A0 2018-04-26<br>
&gt; &gt;&gt;&gt; 85567=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0middle-e=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 rguenth=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RESO=C2=A0 =
=C2=A0 FIXE=C2=A0 =C2=A0 [7 Regression] internal compiler error: in gimplif=
y_modify_expr, at gimplify.c:5797 when using sincos()=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A02018-06-07<br>
&gt; &gt;&gt;&gt; 86076=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0tree-opt=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 rguenth=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RESO=C2=A0 =
=C2=A0 FIXE=C2=A0 =C2=A0 [7 Regression] ICE: verify_gimple failed (error: l=
ocation references block not in block tree)=C2=A0 =C2=A02018-11-26<br>
&gt; &gt;&gt;&gt; 86139=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0target=C2=A0 rgu=
enth=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [=
7 Regression] ICE in in store_constructor, at expr.c:6849 on arm-linux-gnue=
abihf=C2=A0 =C2=A0 =C2=A0 =C2=A02018-11-26<br>
&gt; &gt;&gt;&gt; 86763=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0c++=C2=A0 =C2=A0=
 =C2=A0rguenth=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=
=A0 =C2=A0 [7 Regression] Wrong code comparing member of copy of a 237 byte=
 object with nontrivial default constructor on x86-64 arch=C2=A0 =C2=A0 =C2=
=A0 2018-08-17<br>
&gt; &gt;&gt;&gt; 87610=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0middle-e=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 rguenth=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RESO=C2=A0 =
=C2=A0 FIXE=C2=A0 =C2=A0 [7 Regression] wrong-code with restrict=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A02018-11-26<br>
&gt; &gt;&gt;&gt; 87645=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0tree-opt=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 rguenth=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RESO=C2=A0 =
=C2=A0 FIXE=C2=A0 =C2=A0 [7 Regression] gcc hangs up on vr_values::vrp_visi=
t_assignment_or_call=C2=A0 2018-11-26<br>
&gt; &gt;&gt;&gt; 87665=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0tree-opt=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 rguenth=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RESO=C2=A0 =
=C2=A0 FIXE=C2=A0 =C2=A0 [7 Regression] gcc HEAD (svn: 265340) breaks eleme=
nts on resize=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02018-11-26<br>
&gt; &gt;&gt;&gt; 84485=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0tree-opt=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 rsandifo=C2=A0 =C2=A0 =C2=A0 =C2=A0 RESO=C2=A0 =C2=A0 =
FIXE=C2=A0 =C2=A0 [6 Regression] Vectorising zero-stride rmw operation=C2=
=A0 =C2=A0 2018-10-26<br>
&gt; &gt;&gt;&gt; 85645=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0rtl-opti=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 segher=C2=A0 RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [7 Re=
gression] ICE in maybe_record_trace_start, at dwarf2cfi.c:2348=C2=A0 =C2=A0=
 =C2=A02018-08-13<br>
&gt; &gt;&gt;&gt; 39838=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0middle-e=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 unassigned=C2=A0 =C2=A0 =C2=A0 RESO=C2=A0 =C2=A0 FIXE=
=C2=A0 =C2=A0 [6 regression] unoptimal code for two simple loops=C2=A0 =C2=
=A0 =C2=A0 2018-10-26<br>
&gt; &gt;&gt;&gt; 46639=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0tree-opt=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 unassigned=C2=A0 =C2=A0 =C2=A0 RESO=C2=A0 =C2=A0 FIXE=
=C2=A0 =C2=A0 [6 Regression] Missing optimization due to function splitting=
 and redundant conditionals=C2=A0 =C2=A0 =C2=A0 =C2=A0 2018-10-26<br>
&gt; &gt;&gt;&gt; 61409=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0middle-e=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 unassigned=C2=A0 =C2=A0 =C2=A0 RESO=C2=A0 =C2=A0 FIXE=
=C2=A0 =C2=A0 [6 regression] -Wmaybe-uninitialized false-positive with -O2=
=C2=A0 =C2=A0 2018-10-26<br>
&gt; &gt;&gt;&gt; 65135=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0rtl-opti=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 unassigned=C2=A0 =C2=A0 =C2=A0 RESO=C2=A0 =C2=A0 FIXE=
=C2=A0 =C2=A0 [6 Regression] Performance regression in pic mode after r2206=
74.=C2=A0 =C2=A0 =C2=A0 =C2=A0 2018-10-26<br>
&gt; &gt;&gt;&gt; 70681=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0rtl-opti=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 unassigned=C2=A0 =C2=A0 =C2=A0 RESO=C2=A0 =C2=A0 FIXE=
=C2=A0 =C2=A0 [7/8/9 Regression] FAIL: gcc.dg/ira-shrinkwrap-prep-2.c gcc.d=
g/pr10474.c on arm and powerpc=C2=A0 =C2=A0 =C2=A02018-11-20<br>
&gt; &gt;&gt;&gt; 84813=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0c++=C2=A0 =C2=A0=
 =C2=A0unassigned=C2=A0 =C2=A0 =C2=A0 RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [=
7 Regression] internal compiler error: Segmentation fault with lambdas and =
constexpr variables=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02018-12-01<br>
&gt; &gt;&gt;&gt; 85805=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0rtl-opti=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 unassigned=C2=A0 =C2=A0 =C2=A0 RESO=C2=A0 =C2=A0 FIXE=
=C2=A0 =C2=A0 [7/8 Regression] Wrong code for 64 bit comparisons on avr-gcc=
=C2=A0 =C2=A02018-11-20<br>
&gt; &gt;&gt;&gt; 87867=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0target=C2=A0 una=
ssigned=C2=A0 =C2=A0 =C2=A0 RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [7 regressi=
on] ICE on virtual destructor (-mlong-calls -ffunction-sections) on arm-non=
e-eabi=C2=A0 =C2=A0 2018-11-21<br>
&gt; &gt;&gt;&gt; 84955=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0middle-e=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 vries=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 =
[7 Regression] Incorrect OpenACC tile expansion=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A02018-05-01<br>
&gt; &gt;&gt;&gt; 87473=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0tree-opt=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 wschmidt=C2=A0 =C2=A0 =C2=A0 =C2=A0 RESO=C2=A0 =C2=A0 =
FIXE=C2=A0 =C2=A0 [7/8/9 Regression] ICE in create_add_on_incoming_edge, at=
 gimple-ssa-strength-reduction.c:2344=C2=A0 2018-10-27<br>
&gt; &gt;&gt;&gt; 85436=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0target=C2=A0 ber=
gner=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [=
7 Regression] ICE compiling go code with -mcpu=3Dpower9=C2=A0 2018-04-20<br=
>
&gt; &gt;&gt;&gt; 85384=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0jit=C2=A0 =C2=A0=
 =C2=A0dmalcolm=C2=A0 =C2=A0 =C2=A0 =C2=A0 RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=
=A0 libgccjit does not work if --with-gcc-major-version is used=C2=A0 =C2=
=A0 =C2=A02018-06-25<br>
&gt; &gt;&gt;&gt; 83496=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0rtl-opti=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 ebotcazou=C2=A0 =C2=A0 =C2=A0 =C2=A0RESO=C2=A0 =C2=A0 =
FIXE=C2=A0 =C2=A0 [7/8 regression] wrong code generated with -Os -mbranch-c=
ost=3D1=C2=A0 2018-02-27<br>
&gt; &gt;&gt;&gt; 88199=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0libstdc+=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 fdumont=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RESO=C2=A0 =
=C2=A0 FIXE=C2=A0 =C2=A0 [7/8 Regression] memory leak on unordered containe=
r move assignment=C2=A0 =C2=A0 =C2=A02018-11-28<br>
&gt; &gt;&gt;&gt; 84192=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0c++=C2=A0 =C2=A0=
 =C2=A0jakub=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [7 Regression]=
 ICE with statement expression=C2=A0 =C2=A0 2018-03-03<br>
&gt; &gt;&gt;&gt; 84444=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0c++=C2=A0 =C2=A0=
 =C2=A0jakub=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 ICE with __bui=
ltin_launder and cast=C2=A0 =C2=A0 =C2=A02018-03-03<br>
&gt; &gt;&gt;&gt; 85208=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0c++=C2=A0 =C2=A0=
 =C2=A0jakub=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 ICE with #prag=
ma weak and structured binding=C2=A0 =C2=A0 2018-06-24<br>
&gt; &gt;&gt;&gt; 85529=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0tree-opt=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 jakub=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 =
[7 Regression] wrong code at -O2 and -O3 on x86_64-linux-gnu=C2=A0 =C2=A0 2=
018-06-25<br>
&gt; &gt;&gt;&gt; 87065=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0rtl-opti=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 jakub=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 =
[7 Regression] combine causes ICE in trunc_int_for_mode=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A02018-10-12<br>
&gt; &gt;&gt;&gt; 64095=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0c++=C2=A0 =C2=A0=
 =C2=A0jason=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [C++14] Ellips=
is at end of generic lambda parameter-declaration-clause should be parsed a=
s a parameter pack=C2=A0 =C2=A0 =C2=A02018-07-28<br>
&gt; &gt;&gt;&gt; 81853=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0c++=C2=A0 =C2=A0=
 =C2=A0jason=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [ 6/7/8 Regres=
sion] &quot;using namespace&quot; is not a constant expression in a stateme=
nt expression=C2=A0 =C2=A0 2018-02-16<br>
&gt; &gt;&gt;&gt; 83835=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0c++=C2=A0 =C2=A0=
 =C2=A0jason=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [7/8 Regressio=
n] constexpr constructor rejected in c++17 mode (regression WRT c++14)=C2=
=A0 =C2=A0 2018-02-16<br>
&gt; &gt;&gt;&gt; 84015=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0c++=C2=A0 =C2=A0=
 =C2=A0jason=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [7 Regression]=
 ICE with class template argument deduction=C2=A0 =C2=A0 =C2=A0 =C2=A02018-=
02-26<br>
&gt; &gt;&gt;&gt; 86378=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0c++=C2=A0 =C2=A0=
 =C2=A0jason=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [7/8/9 regress=
ion] typedef breaks functional cast in noexcept-qualifier=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A02018-07-03<br>
&gt; &gt;&gt;&gt; 80867=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0bootstra=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 kelvin=C2=A0 RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 gnat =
bootstrap broken on powerpc64le-linux-gnu with -O3=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A02018-01-31<br>
&gt; &gt;&gt;&gt; 85081=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0sanitize=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 marxin=C2=A0 RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [7 Re=
gression] Sanitizer error with references in vectorized/parallel for-loop=
=C2=A0 2018-04-24<br>
&gt; &gt;&gt;&gt; 85424=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0target=C2=A0 mei=
ssner=C2=A0 =C2=A0 =C2=A0 =C2=A0 RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 The __=
builtin_packlongdouble function might have issues with the output overlappi=
ng the inputs=C2=A0 2018-06-25<br>
&gt; &gt;&gt;&gt; 83659=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0c++=C2=A0 =C2=A0=
 =C2=A0mpolacek=C2=A0 =C2=A0 =C2=A0 =C2=A0 RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=
=A0 [7 Regression] ICE on compilable C++ code: in tree_to_shwi, at tree.c:6=
821=C2=A0 =C2=A0 =C2=A0 2018-03-03<br>
&gt; &gt;&gt;&gt; 71625=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0tree-opt=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 msebor=C2=A0 RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 missi=
ng strlen optimization on different array initialization style=C2=A0 =C2=A0=
 =C2=A02018-10-05<br>
&gt; &gt;&gt;&gt; 87284=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0fortran=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0pault=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =
=C2=A0 [7/8/9 Regression] Allocation of class arrays with mold results in &=
quot;conditional jump or move depends on uninitialised value&quot;=C2=A0 =
=C2=A0 2018-09-13<br>
&gt; &gt;&gt;&gt; 78595=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0libstdc+=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 redi=C2=A0 =C2=A0 RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 =
Unnecessary copies in _Rb_tree=C2=A0 2018-10-12<br>
&gt; &gt;&gt;&gt; 81076=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0libstdc+=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 redi=C2=A0 =C2=A0 RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 =
__byte_operand&lt;cv T&gt; is not SFINAE-friendly=C2=A0 =C2=A0 =C2=A02018-0=
1-25<br>
&gt; &gt;&gt;&gt; 82966=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0libstdc+=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 redi=C2=A0 =C2=A0 RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 =
node_handle swap fails to compile=C2=A0 =C2=A0 =C2=A0 =C2=A02018-05-14<br>
&gt; &gt;&gt;&gt; 83658=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0libstdc+=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 redi=C2=A0 =C2=A0 RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 =
any::emplace deletes invalid memory when an overloaded operator new() throw=
s=C2=A0 =C2=A0 2018-01-29<br>
&gt; &gt;&gt;&gt; 83662=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0libstdc+=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 redi=C2=A0 =C2=A0 RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 =
std::aligned_alloc() not available=C2=A0 =C2=A0 =C2=A0 2018-03-23<br>
&gt; &gt;&gt;&gt; 84087=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0libstdc+=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 redi=C2=A0 =C2=A0 RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 =
string::assign problem with two arguments=C2=A0 =C2=A0 =C2=A0 =C2=A02018-08=
-23<br>
&gt; &gt;&gt;&gt; 84532=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0libstdc+=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 redi=C2=A0 =C2=A0 RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 =
[7 Regression] std::thread::__make_invoker prematurely unwraps reference_wr=
appers=C2=A0 =C2=A0 =C2=A0 =C2=A02018-02-26<br>
&gt; &gt;&gt;&gt; 85671=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0libstdc+=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 redi=C2=A0 =C2=A0 RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 =
Lack of `std::move()` inside `operator/` for `std::filesystem::path`.=C2=A0=
 =C2=A02018-07-04<br>
&gt; &gt;&gt;&gt; 85812=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0libstdc+=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 redi=C2=A0 =C2=A0 RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 =
[7/8 Regression] make_exception_ptr can leak the allocated exception if con=
struction throws=C2=A0 =C2=A0 =C2=A02018-05-17<br>
&gt; &gt;&gt;&gt; 86138=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0libstdc+=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 redi=C2=A0 =C2=A0 RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 =
[7/8 Regression] C++17: getline(istream, string) crashes on Cygwin because =
incompatible C++14 function is called=C2=A0 =C2=A0 =C2=A0 =C2=A0 2018-09-21=
<br>
&gt; &gt;&gt;&gt; 86169=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0libstdc+=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 redi=C2=A0 =C2=A0 RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 =
.data() fails to unshare strings=C2=A0 =C2=A0 =C2=A0 =C2=A0 2018-06-15<br>
&gt; &gt;&gt;&gt; 86734=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0libstdc+=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 redi=C2=A0 =C2=A0 RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 =
[DR 2188] reverse_iterator::operator-&gt; does not support overloaded opera=
tor&amp;=C2=A0 =C2=A0 2018-08-08<br>
&gt; &gt;&gt;&gt; 86861=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0libstdc+=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 redi=C2=A0 =C2=A0 RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 =
18_support/new_aligned.cc FAILs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02018-08-07=
<br>
&gt; &gt;&gt;&gt; 87538=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0libstdc+=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 redi=C2=A0 =C2=A0 RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 =
[7/8 Regression] Incorrect noexcept specifier for not_fn=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 2018-10-08<br>
&gt; &gt;&gt;&gt; 87822=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0libstdc+=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 redi=C2=A0 =C2=A0 RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 =
[6/7/8/9 Regression] Binary incompatibility in std::pair introduced by PR 8=
6751=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02018-10-31<br>
&gt; &gt;&gt;&gt; 82795=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0target=C2=A0 rgu=
enth=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [=
7/8 Regression] ICE in predicate_mem_writes, at tree-if-conv.c:2251=C2=A0 =
=C2=A0 2018-02-01<br>
&gt; &gt;&gt;&gt; 84190=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0c=C2=A0 =C2=A0 =
=C2=A0 =C2=A0rguenth=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIX=
E=C2=A0 =C2=A0 [7/8 Regression] double arithmetic on x86 no longer rounds t=
o nearest=C2=A0 =C2=A02018-02-16<br>
&gt; &gt;&gt;&gt; 81647=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0target=C2=A0 sud=
i=C2=A0 =C2=A0 RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 inconsistent LTGT behavi=
or at different optimization levels on AArch64.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A02018-04-04<br>
&gt; &gt;&gt;&gt; 85203=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0target=C2=A0 tho=
mas.preudhomme=C2=A0 =C2=A0 =C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=
=A0 cmse_nonsecure_caller intrinsic returns incorrect results=C2=A0 =C2=A0 =
=C2=A0 =C2=A02018-04-17<br>
&gt; &gt;&gt;&gt; 84654=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0libstdc+=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 tuliom=C2=A0 RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 libst=
dc++ tries to use __float128 when compiling with -mno-float128=C2=A0 =C2=A0=
 =C2=A02018-08-07<br>
&gt; &gt;&gt;&gt; 58372=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0c++=C2=A0 =C2=A0=
 =C2=A0ubizjak=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=
=A0 =C2=A0 internal compiler error: ix86_compute_frame_layout=C2=A0 =C2=A0 =
=C2=A0 2018-11-11<br>
&gt; &gt;&gt;&gt; 87928=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0target=C2=A0 ubi=
zjak=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [=
7/8/9 Regression] ICE in ix86_compute_frame_layout, at config/i386/i386.c:1=
1161 since r228607=C2=A0 2018-11-20<br>
&gt; &gt;&gt;&gt; 88051=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0target=C2=A0 ubi=
zjak=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 i=
nternal compiler error: in add_clobbers, at config/i386/sync.md:1762=C2=A0 =
=C2=A02018-11-22<br>
&gt; &gt;&gt;&gt; 71450=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0c++=C2=A0 =C2=A0=
 =C2=A0unassigned=C2=A0 =C2=A0 =C2=A0 RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [=
6 Regression] ICE on invalid C++11 code on x86_64-linux-gnu: in tree check:=
 expected record_type or union_type or qual_union_type, have template_type_=
parm in lookup_base, at cp/search.c:203=C2=A0 2018-11-19<br>
&gt; &gt;&gt;&gt; 81589=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0c++=C2=A0 =C2=A0=
 =C2=A0unassigned=C2=A0 =C2=A0 =C2=A0 RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 P=
ossible False-Positive with decltype=C2=A0 =C2=A02018-06-22<br>
&gt; &gt;&gt;&gt; 81763=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0target=C2=A0 una=
ssigned=C2=A0 =C2=A0 =C2=A0 RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 Issues with=
 BMI on 32bit x86 apps on GCC 7.1+=C2=A0 =C2=A02018-01-29<br>
&gt; &gt;&gt;&gt; 82805=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0target=C2=A0 una=
ssigned=C2=A0 =C2=A0 =C2=A0 RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [7/8/9 Regr=
ession] SPEC CPU2006 454.calculix ~6% performance deviation in between 6.3 =
and 7.2=C2=A0 =C2=A02018-06-08<br>
&gt; &gt;&gt;&gt; 82813=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0ada=C2=A0 =C2=A0=
 =C2=A0unassigned=C2=A0 =C2=A0 =C2=A0 RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 w=
arning: &#39;.builtin_memcpy&#39; writing between 2 and 6 bytes into a regi=
on of size 0 overflows the destination [-Wstringop-overflow=3D]=C2=A0 =C2=
=A0 =C2=A0 =C2=A02018-03-12<br>
&gt; &gt;&gt;&gt; 83830=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0libstdc+=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 unassigned=C2=A0 =C2=A0 =C2=A0 RESO=C2=A0 =C2=A0 FIXE=
=C2=A0 =C2=A0 has_unique_object_representations_v is missing=C2=A0 2018-01-=
25<br>
&gt; &gt;&gt;&gt; 83990=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0c++=C2=A0 =C2=A0=
 =C2=A0unassigned=C2=A0 =C2=A0 =C2=A0 RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [=
7 Regression] Spurious &quot;potential null pointer dereference&quot; warni=
ng regression from 7.1 onwards=C2=A0 =C2=A0 =C2=A0 =C2=A0 2018-02-15<br>
&gt; &gt;&gt;&gt; 84769=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0libstdc+=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 unassigned=C2=A0 =C2=A0 =C2=A0 RESO=C2=A0 =C2=A0 FIXE=
=C2=A0 =C2=A0 variant::get(): unscoped call to get&lt;size_t&gt;=C2=A0 =C2=
=A0 2018-05-03<br>
&gt; &gt;&gt;&gt; 84773=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0libstdc+=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 unassigned=C2=A0 =C2=A0 =C2=A0 RESO=C2=A0 =C2=A0 FIXE=
=C2=A0 =C2=A0 [7/8 Regression] Cross-compilers do not use aligned_alloc or =
_aligned_malloc for aligned-new=C2=A0 =C2=A0 2018-03-12<br>
&gt; &gt;&gt;&gt; 86127=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0libstdc+=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 unassigned=C2=A0 =C2=A0 =C2=A0 RESO=C2=A0 =C2=A0 FIXE=
=C2=A0 =C2=A0 STL containers do not satisfy container.requirements.general =
clause 8=C2=A0 =C2=A02018-07-04<br>
&gt; &gt;&gt;&gt; 86705=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0middle-e=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 unassigned=C2=A0 =C2=A0 =C2=A0 RESO=C2=A0 =C2=A0 FIXE=
=C2=A0 =C2=A0 [7/8/9 Regression] pr45678-2.c ICE with msp430-elf -mlarge=C2=
=A0 =C2=A0 =C2=A0 2018-08-02<br>
&gt; &gt;&gt;&gt; 87033=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0target=C2=A0 una=
ssigned=C2=A0 =C2=A0 =C2=A0 RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 The compile=
r does not generate the LWAX instruction=C2=A0 =C2=A0 =C2=A02018-09-28<br>
&gt; &gt;&gt;&gt; 87370=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0target=C2=A0 una=
ssigned=C2=A0 =C2=A0 =C2=A0 RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [7/8/9 Regr=
ession] Inefficient return code of struct values=C2=A0 =C2=A0 =C2=A02018-12=
-14<br>
&gt; &gt;&gt;&gt; 87517=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0target=C2=A0 una=
ssigned=C2=A0 =C2=A0 =C2=A0 RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 Typo in avx=
512fintrin.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02018-10-12<br>
&gt; &gt;&gt;&gt; 80654=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0libstdc+=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 ville.voutilainen=C2=A0 =C2=A0 =C2=A0 =C2=A0RESO=C2=A0=
 =C2=A0 FIXE=C2=A0 =C2=A0 is_trivially_copy_constructible fails with compil=
er error with vector of uncopyable objects=C2=A0 =C2=A0 =C2=A02018-06-22<br=
>
&gt; &gt;&gt;&gt; 84116=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0fortran=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0jakub=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =
=C2=A0 [7 Regression] ICE in gfc_match_omp_clauses, at fortran/openmp.c:135=
4=C2=A0 =C2=A02018-03-03<br>
&gt; &gt;&gt;&gt; 84449=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0c++=C2=A0 =C2=A0=
 =C2=A0jakub=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [7 Regression]=
 ICE with constexpr and deleted destructor=C2=A0 =C2=A0 =C2=A0 =C2=A0 2018-=
03-03<br>
&gt; &gt;&gt;&gt; 85210=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0c++=C2=A0 =C2=A0=
 =C2=A0jakub=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [7 Regression]=
 ICE with broken structured binding in template=C2=A0 =C2=A02018-06-24<br>
&gt; &gt;&gt;&gt; 44491=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0fortran=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0kargl=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =
=C2=A0 Diagnostic just shows &quot;&lt;During initialization&gt;&quot; inst=
ead of a locus=C2=A0 =C2=A0 =C2=A0 2018-06-12<br>
&gt; &gt;&gt;&gt; 51434=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0fortran=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0kargl=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =
=C2=A0 ICE with scalar init of an array parameter, used in DT default init =
with transfer=C2=A0 =C2=A0 =C2=A0 =C2=A02018-03-03<br>
&gt; &gt;&gt;&gt; 77414=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0fortran=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0kargl=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =
=C2=A0 ICE in create_function_arglist, at fortran/trans-decl.c:2410=C2=A0 =
=C2=A0 2018-03-19<br>
&gt; &gt;&gt;&gt; 78278=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0fortran=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0kargl=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =
=C2=A0 ICE in gfc_wide_memset, at fortran/scanner.c:153=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 2018-06-09<br>
&gt; &gt;&gt;&gt; 78741=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0fortran=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0kargl=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =
=C2=A0 ICE in gfc_get_symbol_decl, at fortran/trans-decl.c:1534=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 2018-03-16<br>
&gt; &gt;&gt;&gt; 85981=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0fortran=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0kargl=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =
=C2=A0 ICE in gfc_trans_string_copy, at fortran/trans-expr.c:6539=C2=A0 =C2=
=A0 =C2=A0 2018-06-04<br>
&gt; &gt;&gt;&gt; 86045=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0fortran=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0kargl=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =
=C2=A0 ICE in reduce_binary_ac, at fortran/arith.c:1308=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 2018-06-07<br>
&gt; &gt;&gt;&gt; 86059=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0fortran=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0kargl=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =
=C2=A0 ICE in reduce_binary_ac, at fortran/arith.c:1308 (and others)=C2=A0 =
=C2=A02018-06-09<br>
&gt; &gt;&gt;&gt; 86110=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0fortran=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0kargl=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =
=C2=A0 ICE in gfc_resolve_character_array_constructor, at fortran/array.c:2=
044=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02018-06-13<br>
&gt; &gt;&gt;&gt; 68467=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0target=C2=A0 law=
=C2=A0 =C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 libgcc, compilation=
 for target m68k-linux breaks in linux_atomic.c=C2=A0 =C2=A0 =C2=A0 2018-01=
-29<br>
&gt; &gt;&gt;&gt; 85258=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0c++=C2=A0 =C2=A0=
 =C2=A0mpolacek=C2=A0 =C2=A0 =C2=A0 =C2=A0 RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=
=A0 [7/8 Regression] ICE with invalid range-based for-loop=C2=A0 2018-04-12=
<br>
&gt; &gt;&gt;&gt; 80657=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0fortran=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0pault=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =
=C2=A0 [7/8/9 Regression] Loop in character function declaration=C2=A0 =C2=
=A0 =C2=A0 =C2=A02018-05-20<br>
&gt; &gt;&gt;&gt; 80965=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0fortran=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0pault=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =
=C2=A0 [7/8 Regression] ICE with class argument and -O2 optimization=C2=A0 =
=C2=A02018-03-03<br>
&gt; &gt;&gt;&gt; 84546=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0fortran=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0pault=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =
=C2=A0 [7 Regression] Bad sourced allocation of CLASS(*) with source with C=
LASS(*) component=C2=A0 =C2=A02018-05-16<br>
&gt; &gt;&gt;&gt; 84113=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0target=C2=A0 seg=
her=C2=A0 RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [7/8 Regression] libgcc/unwin=
d.inc:136:1: unrecognizable insn: internal compiler error on Darwin=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 2018-02-08<br>
&gt; &gt;&gt;&gt; 78238=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0fortran=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0tkoenig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RESO=C2=
=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [7/8 Regression] [OOP] ICE: verify_gimple fail=
ed, with -fdefault-integer-8=C2=A0 =C2=A0 =C2=A0 2018-02-25<br>
&gt; &gt;&gt;&gt; 84270=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0fortran=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0tkoenig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RESO=C2=
=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [7/8 Regression] optimization bug with assumed=
 size array argument=C2=A0 =C2=A0 =C2=A0 2018-02-17<br>
&gt; &gt;&gt;&gt; 85641=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0fortran=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0tkoenig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RESO=C2=
=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [7/8/9 Regression] ICE with string concatenate=
=C2=A0 2018-06-07<br>
&gt; &gt;&gt;&gt; 88073=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0fortran=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0tkoenig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RESO=C2=
=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [7/8 Regression] Internal compiler error compi=
ling WHERE construct with -O or -O2=C2=A0 =C2=A0 =C2=A0 =C2=A02018-11-26<br=
>
&gt; &gt;&gt;&gt; 62247=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0target=C2=A0 una=
ssigned=C2=A0 =C2=A0 =C2=A0 RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [7/8/9 Regr=
ession] FAIL: g++.dg/abi/anon3.C -std=3Dc++98/9 scan-assembler .weak(_defin=
ition)=C2=A0 =C2=A0 =C2=A0 2018-11-21<br>
&gt; &gt;&gt;&gt; 68226=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0fortran=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0unassigned=C2=A0 =C2=A0 =C2=A0 RESO=C2=A0 =C2=A0=
 FIXE=C2=A0 =C2=A0 [7/8/9 Regression] [OOP] ICE on assignment of pointer-va=
lued function to allocatable=C2=A0 =C2=A0 2018-10-26<br>
&gt; &gt;&gt;&gt; 79929=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0fortran=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0unassigned=C2=A0 =C2=A0 =C2=A0 RESO=C2=A0 =C2=A0=
 FIXE=C2=A0 =C2=A0 [7 Regression] Bogus Warning: &#39;__builtin_memset&#39;=
: specified size 4294967291 exceeds maximum object size 2147483647=C2=A0 =
=C2=A0 =C2=A0 2018-05-04<br>
&gt; &gt;&gt;&gt; 82961=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0target=C2=A0 una=
ssigned=C2=A0 =C2=A0 =C2=A0 RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 ICE in dwar=
f2out.c: deferred_asm_name !=3D NULL=C2=A0 =C2=A02018-11-22<br>
&gt; &gt;&gt;&gt; 83319=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0fortran=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0unassigned=C2=A0 =C2=A0 =C2=A0 RESO=C2=A0 =C2=A0=
 FIXE=C2=A0 =C2=A0 [7/8 Regression] ICE on use of allocatable component in =
derived type coarray defined in module=C2=A0 2018-03-28<br>
&gt; &gt;&gt;&gt; 84070=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0fortran=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0unassigned=C2=A0 =C2=A0 =C2=A0 RESO=C2=A0 =C2=A0=
 FIXE=C2=A0 =C2=A0 Incorrect assignment to allocatable character variable=
=C2=A0 2018-03-11<br>
&gt; &gt;&gt;&gt; 84209=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0target=C2=A0 una=
ssigned=C2=A0 =C2=A0 =C2=A0 RESO=C2=A0 =C2=A0 FIXE=C2=A0 =C2=A0 [avr] Don&#=
39;t split SP in split2=C2=A0 2018-03-07<br>
&gt; &gt;&gt;&gt; 87597=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0fortran=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0unassigned=C2=A0 =C2=A0 =C2=A0 RESO=C2=A0 =C2=A0=
 FIXE=C2=A0 =C2=A0 [7/8/9 Regression] wrong result with matmul inlining=C2=
=A0 =C2=A0 2018-11-03<br>
&gt; &gt;&gt;&gt; 38351=C2=A0 =C2=A0gcc=C2=A0 =C2=A0 =C2=A0fortran=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0kargl=C2=A0 =C2=A0RESO=C2=A0 =C2=A0 FIXE=C2=A0 =
=C2=A0 Poor error message for rank mismatch in operator args=C2=A0 =C2=A020=
18-06-09<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Signed-off-by: Mikko Rapeli &lt;<a href=3D"mailto:mikko.r=
apeli@bmw.de" target=3D"_blank">mikko.rapeli@bmw.de</a>&gt;<br>
&gt; &gt;&gt;&gt; ---<br>
&gt; &gt;&gt;&gt;=C2=A0 meta/recipes-devtools/gcc/gcc-7.3.inc=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 132 ----------<br>
&gt; &gt;&gt;&gt;=C2=A0 ...1-Fix-internal-compiler-error-in-testcase.patch =
| 212 ---------------<br>
&gt; &gt;&gt;&gt;=C2=A0 ...ix-ppc64le-build-Partial-backport-r256656.patch =
|=C2=A0 37 ---<br>
&gt; &gt;&gt;&gt;=C2=A0 .../0001-PR-c-80290-memory-hog-with-std-pair.patch =
|=C2=A0 58 -----<br>
&gt; &gt;&gt;&gt;=C2=A0 .../gcc-7.3/0001-PR-rtl-optimization-83030.patch=C2=
=A0 =C2=A0| 272 --------------------<br>
&gt; &gt;&gt;&gt;=C2=A0 .../0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch=C2=
=A0 =C2=A0 =C2=A0|=C2=A0 42 ---<br>
&gt; &gt;&gt;&gt;=C2=A0 .../gcc/gcc-7.3/0008-c99-snprintf.patch=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 28 --<br>
&gt; &gt;&gt;&gt;=C2=A0 .../0009-gcc-poison-system-directories.patch=C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 192 --------------<br>
&gt; &gt;&gt;&gt;=C2=A0 .../gcc/gcc-7.3/0010-gcc-poison-dir-extend.patch=C2=
=A0 =C2=A0|=C2=A0 39 ---<br>
&gt; &gt;&gt;&gt;=C2=A0 .../0011-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch =
|=C2=A0 73 ------<br>
&gt; &gt;&gt;&gt;=C2=A0 .../gcc/gcc-7.3/0012-64-bit-multilib-hack.patch=C2=
=A0 =C2=A0 |=C2=A0 85 ------<br>
&gt; &gt;&gt;&gt;=C2=A0 .../gcc/gcc-7.3/0013-optional-libstdc.patch=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 125 ---------<br>
&gt; &gt;&gt;&gt;=C2=A0 ...0014-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch =
|=C2=A0 59 -----<br>
&gt; &gt;&gt;&gt;=C2=A0 .../gcc/gcc-7.3/0015-COLLECT_GCC_OPTIONS.patch=C2=
=A0 =C2=A0 =C2=A0|=C2=A0 38 ---<br>
&gt; &gt;&gt;&gt;=C2=A0 ...efaults.h-in-B-instead-of-S-and-t-oe-in-B.patch =
|=C2=A0 96 -------<br>
&gt; &gt;&gt;&gt;=C2=A0 .../gcc-7.3/0017-fortran-cross-compile-hack.patch=
=C2=A0 |=C2=A0 46 ----<br>
&gt; &gt;&gt;&gt;=C2=A0 .../gcc/gcc-7.3/0018-cpp-honor-sysroot.patch=C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 54 ----<br>
&gt; &gt;&gt;&gt;=C2=A0 .../gcc-7.3/0019-MIPS64-Default-to-N64-ABI.patch=C2=
=A0 =C2=A0|=C2=A0 57 -----<br>
&gt; &gt;&gt;&gt;=C2=A0 ...C_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch =
| 234 -----------------<br>
&gt; &gt;&gt;&gt;=C2=A0 ...0021-gcc-Fix-argument-list-too-long-error.patch =
|=C2=A0 40 ---<br>
&gt; &gt;&gt;&gt;=C2=A0 .../gcc/gcc-7.3/0022-Disable-sdt.patch=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 113 --------<br>
&gt; &gt;&gt;&gt;=C2=A0 .../gcc/gcc-7.3/0023-libtool.patch=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 42 ---<br>
&gt; &gt;&gt;&gt;=C2=A0 ...4-pass-fix-v4bx-to-linker-to-support-EABI.patch =
|=C2=A0 43 ----<br>
&gt; &gt;&gt;&gt;=C2=A0 ...tilib-config-files-from-B-instead-of-usin.patch =
| 102 --------<br>
&gt; &gt;&gt;&gt;=C2=A0 ...-libdir-from-.la-which-usually-points-to-.patch =
|=C2=A0 31 ---<br>
&gt; &gt;&gt;&gt;=C2=A0 .../gcc/gcc-7.3/0027-export-CPP.patch=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 53 ----<br>
&gt; &gt;&gt;&gt;=C2=A0 ...AltiVec-generation-on-powepc-linux-target.patch =
|=C2=A0 56 ----<br>
&gt; &gt;&gt;&gt;=C2=A0 ...-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch =
|=C2=A0 42 ---<br>
&gt; &gt;&gt;&gt;=C2=A0 ...Ensure-target-gcc-headers-can-be-included.patch =
|=C2=A0 98 -------<br>
&gt; &gt;&gt;&gt;=C2=A0 ...-t-build-with-disable-dependency-tracking.patch =
|=C2=A0 54 ----<br>
&gt; &gt;&gt;&gt;=C2=A0 ...h-host-directory-during-relink-if-inst_pr.patch =
|=C2=A0 38 ---<br>
&gt; &gt;&gt;&gt;=C2=A0 ...IBS_DIR-replacement-instead-of-hardcoding.patch =
|=C2=A0 29 ---<br>
&gt; &gt;&gt;&gt;=C2=A0 .../0034-aarch64-Add-support-for-musl-ldso.patch=C2=
=A0 =C2=A0|=C2=A0 28 --<br>
&gt; &gt;&gt;&gt;=C2=A0 ...ibcc1-fix-libcc1-s-install-path-and-rpath.patch =
|=C2=A0 54 ----<br>
&gt; &gt;&gt;&gt;=C2=A0 ...-handle-sysroot-support-for-nativesdk-gcc.patch =
| 213 ----------------<br>
&gt; &gt;&gt;&gt;=C2=A0 ...et-sysroot-gcc-version-specific-dirs-with.patch =
| 102 --------<br>
&gt; &gt;&gt;&gt;=C2=A0 ...-various-_FOR_BUILD-and-related-variables.patch =
| 137 ----------<br>
&gt; &gt;&gt;&gt;=C2=A0 .../0039-nios2-Define-MUSL_DYNAMIC_LINKER.patch=C2=
=A0 =C2=A0 |=C2=A0 28 --<br>
&gt; &gt;&gt;&gt;=C2=A0 ...shared-to-link-commandline-for-musl-targe.patch =
|=C2=A0 87 -------<br>
&gt; &gt;&gt;&gt;=C2=A0 ...c-libcpp-support-ffile-prefix-map-old-new.patch =
| 284 ---------------------<br>
&gt; &gt;&gt;&gt;=C2=A0 ...ug-prefix-map-to-replace-ffile-prefix-map.patch =
|=C2=A0 43 ----<br>
&gt; &gt;&gt;&gt;=C2=A0 ...-fdebug-prefix-map-support-to-remap-sourc.patch =
|=C2=A0 54 ----<br>
&gt; &gt;&gt;&gt;=C2=A0 ...44-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch =
| 124 ---------<br>
&gt; &gt;&gt;&gt;=C2=A0 ...bgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch =
|=C2=A0 29 ---<br>
&gt; &gt;&gt;&gt;=C2=A0 .../gcc-7.3/0047-sync-gcc-stddef.h-with-musl.patch =
|=C2=A0 91 -------<br>
&gt; &gt;&gt;&gt;=C2=A0 .../gcc/gcc-7.3/0048-gcc-Enable-static-PIE.patch=C2=
=A0 =C2=A0|=C2=A0 46 ----<br>
&gt; &gt;&gt;&gt;=C2=A0 .../fix-segmentation-fault-precompiled-hdr.patch=C2=
=A0 =C2=A0|=C2=A0 49 ----<br>
&gt; &gt;&gt;&gt;=C2=A0 .../gcc-7.3/no-sse-fix-test-case-failures.patch=C2=
=A0 =C2=A0 | 259 -------------------<br>
&gt; &gt;&gt;&gt;=C2=A0 meta/recipes-devtools/gcc/gcc-7.4.inc=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 130 ++++++++++<br>
&gt; &gt;&gt;&gt;=C2=A0 ...1-Fix-internal-compiler-error-in-testcase.patch =
| 212 +++++++++++++++<br>
&gt; &gt;&gt;&gt;=C2=A0 ...ix-ppc64le-build-Partial-backport-r256656.patch =
|=C2=A0 37 +++<br>
&gt; &gt;&gt;&gt;=C2=A0 .../gcc-7.4/0001-PR-rtl-optimization-83030.patch=C2=
=A0 =C2=A0| 272 ++++++++++++++++++++<br>
&gt; &gt;&gt;&gt;=C2=A0 .../0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch=C2=
=A0 =C2=A0 =C2=A0|=C2=A0 42 +++<br>
&gt; &gt;&gt;&gt;=C2=A0 .../gcc/gcc-7.4/0008-c99-snprintf.patch=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 28 ++<br>
&gt; &gt;&gt;&gt;=C2=A0 .../0009-gcc-poison-system-directories.patch=C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 192 ++++++++++++++<br>
&gt; &gt;&gt;&gt;=C2=A0 .../gcc/gcc-7.4/0010-gcc-poison-dir-extend.patch=C2=
=A0 =C2=A0|=C2=A0 39 +++<br>
&gt; &gt;&gt;&gt;=C2=A0 .../0011-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch =
|=C2=A0 73 ++++++<br>
&gt; &gt;&gt;&gt;=C2=A0 .../gcc/gcc-7.4/0012-64-bit-multilib-hack.patch=C2=
=A0 =C2=A0 |=C2=A0 85 ++++++<br>
&gt; &gt;&gt;&gt;=C2=A0 .../gcc/gcc-7.4/0013-optional-libstdc.patch=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 125 +++++++++<br>
&gt; &gt;&gt;&gt;=C2=A0 ...0014-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch =
|=C2=A0 59 +++++<br>
&gt; &gt;&gt;&gt;=C2=A0 .../gcc/gcc-7.4/0015-COLLECT_GCC_OPTIONS.patch=C2=
=A0 =C2=A0 =C2=A0|=C2=A0 38 +++<br>
&gt; &gt;&gt;&gt;=C2=A0 ...efaults.h-in-B-instead-of-S-and-t-oe-in-B.patch =
|=C2=A0 96 +++++++<br>
&gt; &gt;&gt;&gt;=C2=A0 .../gcc-7.4/0017-fortran-cross-compile-hack.patch=
=C2=A0 |=C2=A0 46 ++++<br>
&gt; &gt;&gt;&gt;=C2=A0 .../gcc/gcc-7.4/0018-cpp-honor-sysroot.patch=C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 54 ++++<br>
&gt; &gt;&gt;&gt;=C2=A0 .../gcc-7.4/0019-MIPS64-Default-to-N64-ABI.patch=C2=
=A0 =C2=A0|=C2=A0 57 +++++<br>
&gt; &gt;&gt;&gt;=C2=A0 ...C_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch =
| 234 +++++++++++++++++<br>
&gt; &gt;&gt;&gt;=C2=A0 ...0021-gcc-Fix-argument-list-too-long-error.patch =
|=C2=A0 40 +++<br>
&gt; &gt;&gt;&gt;=C2=A0 .../gcc/gcc-7.4/0022-Disable-sdt.patch=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 113 ++++++++<br>
&gt; &gt;&gt;&gt;=C2=A0 .../gcc/gcc-7.4/0023-libtool.patch=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 42 +++<br>
&gt; &gt;&gt;&gt;=C2=A0 ...4-pass-fix-v4bx-to-linker-to-support-EABI.patch =
|=C2=A0 43 ++++<br>
&gt; &gt;&gt;&gt;=C2=A0 ...tilib-config-files-from-B-instead-of-usin.patch =
| 102 ++++++++<br>
&gt; &gt;&gt;&gt;=C2=A0 ...-libdir-from-.la-which-usually-points-to-.patch =
|=C2=A0 31 +++<br>
&gt; &gt;&gt;&gt;=C2=A0 .../gcc/gcc-7.4/0027-export-CPP.patch=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 53 ++++<br>
&gt; &gt;&gt;&gt;=C2=A0 ...AltiVec-generation-on-powepc-linux-target.patch =
|=C2=A0 56 ++++<br>
&gt; &gt;&gt;&gt;=C2=A0 ...-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch =
|=C2=A0 42 +++<br>
&gt; &gt;&gt;&gt;=C2=A0 ...Ensure-target-gcc-headers-can-be-included.patch =
|=C2=A0 98 +++++++<br>
&gt; &gt;&gt;&gt;=C2=A0 ...-t-build-with-disable-dependency-tracking.patch =
|=C2=A0 54 ++++<br>
&gt; &gt;&gt;&gt;=C2=A0 ...h-host-directory-during-relink-if-inst_pr.patch =
|=C2=A0 38 +++<br>
&gt; &gt;&gt;&gt;=C2=A0 ...IBS_DIR-replacement-instead-of-hardcoding.patch =
|=C2=A0 29 +++<br>
&gt; &gt;&gt;&gt;=C2=A0 .../0034-aarch64-Add-support-for-musl-ldso.patch=C2=
=A0 =C2=A0|=C2=A0 28 ++<br>
&gt; &gt;&gt;&gt;=C2=A0 ...ibcc1-fix-libcc1-s-install-path-and-rpath.patch =
|=C2=A0 54 ++++<br>
&gt; &gt;&gt;&gt;=C2=A0 ...-handle-sysroot-support-for-nativesdk-gcc.patch =
| 213 ++++++++++++++++<br>
&gt; &gt;&gt;&gt;=C2=A0 ...et-sysroot-gcc-version-specific-dirs-with.patch =
| 102 ++++++++<br>
&gt; &gt;&gt;&gt;=C2=A0 ...-various-_FOR_BUILD-and-related-variables.patch =
| 137 ++++++++++<br>
&gt; &gt;&gt;&gt;=C2=A0 .../0039-nios2-Define-MUSL_DYNAMIC_LINKER.patch=C2=
=A0 =C2=A0 |=C2=A0 28 ++<br>
&gt; &gt;&gt;&gt;=C2=A0 ...shared-to-link-commandline-for-musl-targe.patch =
|=C2=A0 87 +++++++<br>
&gt; &gt;&gt;&gt;=C2=A0 ...c-libcpp-support-ffile-prefix-map-old-new.patch =
| 284 +++++++++++++++++++++<br>
&gt; &gt;&gt;&gt;=C2=A0 ...ug-prefix-map-to-replace-ffile-prefix-map.patch =
|=C2=A0 43 ++++<br>
&gt; &gt;&gt;&gt;=C2=A0 ...-fdebug-prefix-map-support-to-remap-sourc.patch =
|=C2=A0 54 ++++<br>
&gt; &gt;&gt;&gt;=C2=A0 ...44-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch =
| 124 +++++++++<br>
&gt; &gt;&gt;&gt;=C2=A0 ...bgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch =
|=C2=A0 29 +++<br>
&gt; &gt;&gt;&gt;=C2=A0 .../gcc-7.4/0047-sync-gcc-stddef.h-with-musl.patch =
|=C2=A0 91 +++++++<br>
&gt; &gt;&gt;&gt;=C2=A0 .../gcc/gcc-7.4/0048-gcc-Enable-static-PIE.patch=C2=
=A0 =C2=A0|=C2=A0 46 ++++<br>
&gt; &gt;&gt;&gt;=C2=A0 .../fix-segmentation-fault-precompiled-hdr.patch=C2=
=A0 =C2=A0|=C2=A0 49 ++++<br>
&gt; &gt;&gt;&gt;=C2=A0 .../gcc-7.4/no-sse-fix-test-case-failures.patch=C2=
=A0 =C2=A0 | 259 +++++++++++++++++++<br>
&gt; &gt;&gt;&gt;=C2=A0 .../recipes-devtools/gcc/<a href=3D"http://gcc-cros=
s-canadian_7.3.bb" rel=3D"noreferrer" target=3D"_blank">gcc-cross-canadian_=
7.3.bb</a> |=C2=A0 =C2=A05 -<br>
&gt; &gt;&gt;&gt;=C2=A0 .../recipes-devtools/gcc/<a href=3D"http://gcc-cros=
s-canadian_7.4.bb" rel=3D"noreferrer" target=3D"_blank">gcc-cross-canadian_=
7.4.bb</a> |=C2=A0 =C2=A05 +<br>
&gt; &gt;&gt;&gt;=C2=A0 meta/recipes-devtools/gcc/<a href=3D"http://gcc-cro=
ss-initial_7.3.bb" rel=3D"noreferrer" target=3D"_blank">gcc-cross-initial_7=
.3.bb</a> |=C2=A0 =C2=A02 -<br>
&gt; &gt;&gt;&gt;=C2=A0 meta/recipes-devtools/gcc/<a href=3D"http://gcc-cro=
ss-initial_7.4.bb" rel=3D"noreferrer" target=3D"_blank">gcc-cross-initial_7=
.4.bb</a> |=C2=A0 =C2=A02 +<br>
&gt; &gt;&gt;&gt;=C2=A0 meta/recipes-devtools/gcc/<a href=3D"http://gcc-cro=
ss_7.3.bb" rel=3D"noreferrer" target=3D"_blank">gcc-cross_7.3.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 -<br>
&gt; &gt;&gt;&gt;=C2=A0 meta/recipes-devtools/gcc/<a href=3D"http://gcc-cro=
ss_7.4.bb" rel=3D"noreferrer" target=3D"_blank">gcc-cross_7.4.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
&gt; &gt;&gt;&gt;=C2=A0 .../gcc/<a href=3D"http://gcc-crosssdk-initial_7.3.=
bb" rel=3D"noreferrer" target=3D"_blank">gcc-crosssdk-initial_7.3.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 -<br>
&gt; &gt;&gt;&gt;=C2=A0 .../gcc/<a href=3D"http://gcc-crosssdk-initial_7.4.=
bb" rel=3D"noreferrer" target=3D"_blank">gcc-crosssdk-initial_7.4.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 +<br>
&gt; &gt;&gt;&gt;=C2=A0 meta/recipes-devtools/gcc/<a href=3D"http://gcc-cro=
sssdk_7.3.bb" rel=3D"noreferrer" target=3D"_blank">gcc-crosssdk_7.3.bb</a>=
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 -<br>
&gt; &gt;&gt;&gt;=C2=A0 meta/recipes-devtools/gcc/<a href=3D"http://gcc-cro=
sssdk_7.4.bb" rel=3D"noreferrer" target=3D"_blank">gcc-crosssdk_7.4.bb</a>=
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
&gt; &gt;&gt;&gt;=C2=A0 meta/recipes-devtools/gcc/<a href=3D"http://gcc-run=
time_7.3.bb" rel=3D"noreferrer" target=3D"_blank">gcc-runtime_7.3.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A07 -<br>
&gt; &gt;&gt;&gt;=C2=A0 meta/recipes-devtools/gcc/<a href=3D"http://gcc-run=
time_7.4.bb" rel=3D"noreferrer" target=3D"_blank">gcc-runtime_7.4.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A07 +<br>
&gt; &gt;&gt;&gt;=C2=A0 meta/recipes-devtools/gcc/<a href=3D"http://gcc-san=
itizers_7.3.bb" rel=3D"noreferrer" target=3D"_blank">gcc-sanitizers_7.3.bb<=
/a>=C2=A0 =C2=A0 |=C2=A0 =C2=A02 -<br>
&gt; &gt;&gt;&gt;=C2=A0 meta/recipes-devtools/gcc/<a href=3D"http://gcc-san=
itizers_7.4.bb" rel=3D"noreferrer" target=3D"_blank">gcc-sanitizers_7.4.bb<=
/a>=C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
&gt; &gt;&gt;&gt;=C2=A0 meta/recipes-devtools/gcc/<a href=3D"http://gcc-sou=
rce_7.3.bb" rel=3D"noreferrer" target=3D"_blank">gcc-source_7.3.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 -<br>
&gt; &gt;&gt;&gt;=C2=A0 meta/recipes-devtools/gcc/<a href=3D"http://gcc-sou=
rce_7.4.bb" rel=3D"noreferrer" target=3D"_blank">gcc-source_7.4.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +<br>
&gt; &gt;&gt;&gt;=C2=A0 meta/recipes-devtools/gcc/<a href=3D"http://gcc_7.3=
.bb" rel=3D"noreferrer" target=3D"_blank">gcc_7.3.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 10 -<br>
&gt; &gt;&gt;&gt;=C2=A0 meta/recipes-devtools/gcc/<a href=3D"http://gcc_7.4=
.bb" rel=3D"noreferrer" target=3D"_blank">gcc_7.4.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 10 +<br>
&gt; &gt;&gt;&gt;=C2=A0 meta/recipes-devtools/gcc/<a href=3D"http://libgcc-=
initial_7.3.bb" rel=3D"noreferrer" target=3D"_blank">libgcc-initial_7.3.bb<=
/a>=C2=A0 =C2=A0 |=C2=A0 =C2=A02 -<br>
&gt; &gt;&gt;&gt;=C2=A0 meta/recipes-devtools/gcc/<a href=3D"http://libgcc-=
initial_7.4.bb" rel=3D"noreferrer" target=3D"_blank">libgcc-initial_7.4.bb<=
/a>=C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
&gt; &gt;&gt;&gt;=C2=A0 meta/recipes-devtools/gcc/<a href=3D"http://libgcc_=
7.3.bb" rel=3D"noreferrer" target=3D"_blank">libgcc_7.3.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 -<br>
&gt; &gt;&gt;&gt;=C2=A0 meta/recipes-devtools/gcc/<a href=3D"http://libgcc_=
7.4.bb" rel=3D"noreferrer" target=3D"_blank">libgcc_7.4.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
&gt; &gt;&gt;&gt;=C2=A0 meta/recipes-devtools/gcc/<a href=3D"http://libgfor=
tran_7.3.bb" rel=3D"noreferrer" target=3D"_blank">libgfortran_7.3.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 -<br>
&gt; &gt;&gt;&gt;=C2=A0 meta/recipes-devtools/gcc/<a href=3D"http://libgfor=
tran_7.4.bb" rel=3D"noreferrer" target=3D"_blank">libgfortran_7.4.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
&gt; &gt;&gt;&gt;=C2=A0 119 files changed, 4233 insertions(+), 4293 deletio=
ns(-)<br>
&gt; &gt;&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/gcc-7.=
3.inc<br>
&gt; &gt;&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/gcc-7.=
3/0001-Fix-internal-compiler-error-in-testcase.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/gcc-7.=
3/0001-Fix-ppc64le-build-Partial-backport-r256656.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/gcc-7.=
3/0001-PR-c-80290-memory-hog-with-std-pair.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/gcc-7.=
3/0001-PR-rtl-optimization-83030.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/gcc-7.=
3/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/gcc-7.=
3/0008-c99-snprintf.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/gcc-7.=
3/0009-gcc-poison-system-directories.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/gcc-7.=
3/0010-gcc-poison-dir-extend.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/gcc-7.=
3/0011-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/gcc-7.=
3/0012-64-bit-multilib-hack.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/gcc-7.=
3/0013-optional-libstdc.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/gcc-7.=
3/0014-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/gcc-7.=
3/0015-COLLECT_GCC_OPTIONS.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/gcc-7.=
3/0016-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/gcc-7.=
3/0017-fortran-cross-compile-hack.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/gcc-7.=
3/0018-cpp-honor-sysroot.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/gcc-7.=
3/0019-MIPS64-Default-to-N64-ABI.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/gcc-7.=
3/0020-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/gcc-7.=
3/0021-gcc-Fix-argument-list-too-long-error.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/gcc-7.=
3/0022-Disable-sdt.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/gcc-7.=
3/0023-libtool.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/gcc-7.=
3/0024-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/gcc-7.=
3/0025-Use-the-multilib-config-files-from-B-instead-of-usin.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/gcc-7.=
3/0026-Avoid-using-libdir-from-.la-which-usually-points-to-.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/gcc-7.=
3/0027-export-CPP.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/gcc-7.=
3/0028-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/gcc-7.=
3/0029-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/gcc-7.=
3/0030-Ensure-target-gcc-headers-can-be-included.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/gcc-7.=
3/0031-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/gcc-7.=
3/0032-Don-t-search-host-directory-during-relink-if-inst_pr.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/gcc-7.=
3/0033-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/gcc-7.=
3/0034-aarch64-Add-support-for-musl-ldso.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/gcc-7.=
3/0035-libcc1-fix-libcc1-s-install-path-and-rpath.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/gcc-7.=
3/0036-handle-sysroot-support-for-nativesdk-gcc.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/gcc-7.=
3/0037-Search-target-sysroot-gcc-version-specific-dirs-with.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/gcc-7.=
3/0038-Fix-various-_FOR_BUILD-and-related-variables.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/gcc-7.=
3/0039-nios2-Define-MUSL_DYNAMIC_LINKER.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/gcc-7.=
3/0040-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/gcc-7.=
3/0041-gcc-libcpp-support-ffile-prefix-map-old-new.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/gcc-7.=
3/0042-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/gcc-7.=
3/0043-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/gcc-7.=
3/0044-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/gcc-7.=
3/0045-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/gcc-7.=
3/0047-sync-gcc-stddef.h-with-musl.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/gcc-7.=
3/0048-gcc-Enable-static-PIE.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/gcc-7.=
3/fix-segmentation-fault-precompiled-hdr.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/gcc-7.=
3/no-sse-fix-test-case-failures.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/gcc/gcc-7.=
4.inc<br>
&gt; &gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/gcc/gcc-7.=
4/0001-Fix-internal-compiler-error-in-testcase.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/gcc/gcc-7.=
4/0001-Fix-ppc64le-build-Partial-backport-r256656.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/gcc/gcc-7.=
4/0001-PR-rtl-optimization-83030.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/gcc/gcc-7.=
4/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/gcc/gcc-7.=
4/0008-c99-snprintf.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/gcc/gcc-7.=
4/0009-gcc-poison-system-directories.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/gcc/gcc-7.=
4/0010-gcc-poison-dir-extend.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/gcc/gcc-7.=
4/0011-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/gcc/gcc-7.=
4/0012-64-bit-multilib-hack.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/gcc/gcc-7.=
4/0013-optional-libstdc.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/gcc/gcc-7.=
4/0014-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/gcc/gcc-7.=
4/0015-COLLECT_GCC_OPTIONS.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/gcc/gcc-7.=
4/0016-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/gcc/gcc-7.=
4/0017-fortran-cross-compile-hack.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/gcc/gcc-7.=
4/0018-cpp-honor-sysroot.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/gcc/gcc-7.=
4/0019-MIPS64-Default-to-N64-ABI.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/gcc/gcc-7.=
4/0020-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/gcc/gcc-7.=
4/0021-gcc-Fix-argument-list-too-long-error.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/gcc/gcc-7.=
4/0022-Disable-sdt.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/gcc/gcc-7.=
4/0023-libtool.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/gcc/gcc-7.=
4/0024-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/gcc/gcc-7.=
4/0025-Use-the-multilib-config-files-from-B-instead-of-usin.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/gcc/gcc-7.=
4/0026-Avoid-using-libdir-from-.la-which-usually-points-to-.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/gcc/gcc-7.=
4/0027-export-CPP.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/gcc/gcc-7.=
4/0028-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/gcc/gcc-7.=
4/0029-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/gcc/gcc-7.=
4/0030-Ensure-target-gcc-headers-can-be-included.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/gcc/gcc-7.=
4/0031-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/gcc/gcc-7.=
4/0032-Don-t-search-host-directory-during-relink-if-inst_pr.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/gcc/gcc-7.=
4/0033-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/gcc/gcc-7.=
4/0034-aarch64-Add-support-for-musl-ldso.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/gcc/gcc-7.=
4/0035-libcc1-fix-libcc1-s-install-path-and-rpath.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/gcc/gcc-7.=
4/0036-handle-sysroot-support-for-nativesdk-gcc.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/gcc/gcc-7.=
4/0037-Search-target-sysroot-gcc-version-specific-dirs-with.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/gcc/gcc-7.=
4/0038-Fix-various-_FOR_BUILD-and-related-variables.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/gcc/gcc-7.=
4/0039-nios2-Define-MUSL_DYNAMIC_LINKER.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/gcc/gcc-7.=
4/0040-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/gcc/gcc-7.=
4/0041-gcc-libcpp-support-ffile-prefix-map-old-new.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/gcc/gcc-7.=
4/0042-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/gcc/gcc-7.=
4/0043-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/gcc/gcc-7.=
4/0044-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/gcc/gcc-7.=
4/0045-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/gcc/gcc-7.=
4/0047-sync-gcc-stddef.h-with-musl.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/gcc/gcc-7.=
4/0048-gcc-Enable-static-PIE.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/gcc/gcc-7.=
4/fix-segmentation-fault-precompiled-hdr.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/gcc/gcc-7.=
4/no-sse-fix-test-case-failures.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/<a hre=
f=3D"http://gcc-cross-canadian_7.3.bb" rel=3D"noreferrer" target=3D"_blank"=
>gcc-cross-canadian_7.3.bb</a><br>
&gt; &gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/gcc/<a hre=
f=3D"http://gcc-cross-canadian_7.4.bb" rel=3D"noreferrer" target=3D"_blank"=
>gcc-cross-canadian_7.4.bb</a><br>
&gt; &gt;&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/<a hre=
f=3D"http://gcc-cross-initial_7.3.bb" rel=3D"noreferrer" target=3D"_blank">=
gcc-cross-initial_7.3.bb</a><br>
&gt; &gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/gcc/<a hre=
f=3D"http://gcc-cross-initial_7.4.bb" rel=3D"noreferrer" target=3D"_blank">=
gcc-cross-initial_7.4.bb</a><br>
&gt; &gt;&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/<a hre=
f=3D"http://gcc-cross_7.3.bb" rel=3D"noreferrer" target=3D"_blank">gcc-cros=
s_7.3.bb</a><br>
&gt; &gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/gcc/<a hre=
f=3D"http://gcc-cross_7.4.bb" rel=3D"noreferrer" target=3D"_blank">gcc-cros=
s_7.4.bb</a><br>
&gt; &gt;&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/<a hre=
f=3D"http://gcc-crosssdk-initial_7.3.bb" rel=3D"noreferrer" target=3D"_blan=
k">gcc-crosssdk-initial_7.3.bb</a><br>
&gt; &gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/gcc/<a hre=
f=3D"http://gcc-crosssdk-initial_7.4.bb" rel=3D"noreferrer" target=3D"_blan=
k">gcc-crosssdk-initial_7.4.bb</a><br>
&gt; &gt;&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/<a hre=
f=3D"http://gcc-crosssdk_7.3.bb" rel=3D"noreferrer" target=3D"_blank">gcc-c=
rosssdk_7.3.bb</a><br>
&gt; &gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/gcc/<a hre=
f=3D"http://gcc-crosssdk_7.4.bb" rel=3D"noreferrer" target=3D"_blank">gcc-c=
rosssdk_7.4.bb</a><br>
&gt; &gt;&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/<a hre=
f=3D"http://gcc-runtime_7.3.bb" rel=3D"noreferrer" target=3D"_blank">gcc-ru=
ntime_7.3.bb</a><br>
&gt; &gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/gcc/<a hre=
f=3D"http://gcc-runtime_7.4.bb" rel=3D"noreferrer" target=3D"_blank">gcc-ru=
ntime_7.4.bb</a><br>
&gt; &gt;&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/<a hre=
f=3D"http://gcc-sanitizers_7.3.bb" rel=3D"noreferrer" target=3D"_blank">gcc=
-sanitizers_7.3.bb</a><br>
&gt; &gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/gcc/<a hre=
f=3D"http://gcc-sanitizers_7.4.bb" rel=3D"noreferrer" target=3D"_blank">gcc=
-sanitizers_7.4.bb</a><br>
&gt; &gt;&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/<a hre=
f=3D"http://gcc-source_7.3.bb" rel=3D"noreferrer" target=3D"_blank">gcc-sou=
rce_7.3.bb</a><br>
&gt; &gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/gcc/<a hre=
f=3D"http://gcc-source_7.4.bb" rel=3D"noreferrer" target=3D"_blank">gcc-sou=
rce_7.4.bb</a><br>
&gt; &gt;&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/<a hre=
f=3D"http://gcc_7.3.bb" rel=3D"noreferrer" target=3D"_blank">gcc_7.3.bb</a>=
<br>
&gt; &gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/gcc/<a hre=
f=3D"http://gcc_7.4.bb" rel=3D"noreferrer" target=3D"_blank">gcc_7.4.bb</a>=
<br>
&gt; &gt;&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/<a hre=
f=3D"http://libgcc-initial_7.3.bb" rel=3D"noreferrer" target=3D"_blank">lib=
gcc-initial_7.3.bb</a><br>
&gt; &gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/gcc/<a hre=
f=3D"http://libgcc-initial_7.4.bb" rel=3D"noreferrer" target=3D"_blank">lib=
gcc-initial_7.4.bb</a><br>
&gt; &gt;&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/<a hre=
f=3D"http://libgcc_7.3.bb" rel=3D"noreferrer" target=3D"_blank">libgcc_7.3.=
bb</a><br>
&gt; &gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/gcc/<a hre=
f=3D"http://libgcc_7.4.bb" rel=3D"noreferrer" target=3D"_blank">libgcc_7.4.=
bb</a><br>
&gt; &gt;&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/<a hre=
f=3D"http://libgfortran_7.3.bb" rel=3D"noreferrer" target=3D"_blank">libgfo=
rtran_7.3.bb</a><br>
&gt; &gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/gcc/<a hre=
f=3D"http://libgfortran_7.4.bb" rel=3D"noreferrer" target=3D"_blank">libgfo=
rtran_7.4.bb</a><br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; diff --git a/meta/recipes-devtools/gcc/gcc-7.3.inc b/meta=
/recipes-devtools/gcc/gcc-7.3.inc<br>
&gt; &gt;&gt;&gt; deleted file mode 100644<br>
&gt; &gt;&gt;&gt; index d4aaca4..0000000<br>
&gt; &gt;&gt;&gt; --- a/meta/recipes-devtools/gcc/gcc-7.3.inc<br>
&gt; &gt;&gt;&gt; +++ /dev/null<br>
&gt; &gt;&gt;&gt; @@ -1,132 +0,0 @@<br>
&gt; &gt;&gt;&gt; -require gcc-common.inc<br>
&gt; &gt;&gt;&gt; -<br>
&gt; &gt;&gt;&gt; -# Third digit in PV should be incremented after a minor =
release<br>
&gt; &gt;&gt;&gt; -<br>
&gt; &gt;&gt;&gt; -PV =3D &quot;7.3.0&quot;<br>
&gt; &gt;&gt;&gt; -<br>
&gt; &gt;&gt;&gt; -# BINV should be incremented to a revision after a minor=
 gcc release<br>
&gt; &gt;&gt;&gt; -<br>
&gt; &gt;&gt;&gt; -BINV =3D &quot;7.3.0&quot;<br>
&gt; &gt;&gt;&gt; -<br>
&gt; &gt;&gt;&gt; -FILESEXTRAPATHS =3D. &quot;${FILE_DIRNAME}/gcc-7.3:${FIL=
E_DIRNAME}/gcc-7.3/backport:&quot;<br>
&gt; &gt;&gt;&gt; -<br>
&gt; &gt;&gt;&gt; -DEPENDS =3D+ &quot;mpfr gmp libmpc zlib flex-native&quot=
;<br>
&gt; &gt;&gt;&gt; -NATIVEDEPS =3D &quot;mpfr-native gmp-native libmpc-nativ=
e zlib-native flex-native&quot;<br>
&gt; &gt;&gt;&gt; -<br>
&gt; &gt;&gt;&gt; -LICENSE =3D &quot;GPL-3.0-with-GCC-exception &amp; GPLv3=
&quot;<br>
&gt; &gt;&gt;&gt; -<br>
&gt; &gt;&gt;&gt; -LIC_FILES_CHKSUM =3D &quot;\<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 file://COPYING;md5=3D59530bdf33659b29e73d4=
adb9f9f6552 \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 file://COPYING3;md5=3Dd32239bcb673463ab874=
e80d47fae504 \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 file://COPYING3.LIB;md5=3D6a6a8e020838b234=
06c81b19c1d46df6 \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 file://COPYING.LIB;md5=3D2d5025d4aa3495bef=
ef8f17206a5b0a1 \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 file://COPYING.RUNTIME;md5=3Dfe60d87048567=
d4fe8c8a0ed2448bcc8 \<br>
&gt; &gt;&gt;&gt; -&quot;<br>
&gt; &gt;&gt;&gt; -<br>
&gt; &gt;&gt;&gt; -#RELEASE =3D &quot;7-20170504&quot;<br>
&gt; &gt;&gt;&gt; -BASEURI ?=3D &quot;${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}=
.tar.xz&quot;<br>
&gt; &gt;&gt;&gt; -#SRCREV =3D &quot;f7cf798b73fd1a07098f9a490deec1e2a36e0b=
ed&quot;<br>
&gt; &gt;&gt;&gt; -#BASEURI ?=3D &quot;git://<a href=3D"http://github.com/g=
cc-mirror/gcc;branch=3Dgcc-6-branch;protocol=3Dgit" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/gcc-mirror/gcc;branch=3Dgcc-6-branch;protocol=3Dgi=
t</a>&quot;<br>
&gt; &gt;&gt;&gt; -#BASEURI ?=3D &quot;<a href=3D"http://mirrors.concertpas=
s.com/gcc/snapshots/$%7BRELEASE%7D/gcc-$%7BRELEASE%7D.tar.bz2" rel=3D"noref=
errer" target=3D"_blank">http://mirrors.concertpass.com/gcc/snapshots/${REL=
EASE}/gcc-${RELEASE}.tar.bz2</a>&quot;<br>
&gt; &gt;&gt;&gt; -<br>
&gt; &gt;&gt;&gt; -SRC_URI =3D &quot;\<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${BASEURI} \<br=
>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-gcc=
-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0008-c99=
-snprintf.patch \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0009-gcc=
-poison-system-directories.patch \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0010-gcc=
-poison-dir-extend.patch \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0011-gcc=
-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0012-64-=
bit-multilib-hack.patch \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0013-opt=
ional-libstdc.patch \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0014-gcc=
-disable-MASK_RELAX_PIC_CALLS-bit.patch \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0015-COL=
LECT_GCC_OPTIONS.patch \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0016-Use=
-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0017-for=
tran-cross-compile-hack.patch \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0018-cpp=
-honor-sysroot.patch \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0019-MIP=
S64-Default-to-N64-ABI.patch \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0020-Def=
ine-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0021-gcc=
-Fix-argument-list-too-long-error.patch \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0022-Dis=
able-sdt.patch \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0023-lib=
tool.patch \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0024-gcc=
-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0025-Use=
-the-multilib-config-files-from-B-instead-of-usin.patch \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0026-Avo=
id-using-libdir-from-.la-which-usually-points-to-.patch \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0027-exp=
ort-CPP.patch \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0028-Ena=
ble-SPE-AltiVec-generation-on-powepc-linux-target.patch \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0029-Dis=
able-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0030-Ens=
ure-target-gcc-headers-can-be-included.patch \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0031-gcc=
-4.8-won-t-build-with-disable-dependency-tracking.patch \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0032-Don=
-t-search-host-directory-during-relink-if-inst_pr.patch \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0033-Use=
-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0034-aar=
ch64-Add-support-for-musl-ldso.patch \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0035-lib=
cc1-fix-libcc1-s-install-path-and-rpath.patch \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0036-han=
dle-sysroot-support-for-nativesdk-gcc.patch \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0037-Sea=
rch-target-sysroot-gcc-version-specific-dirs-with.patch \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0038-Fix=
-various-_FOR_BUILD-and-related-variables.patch \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0039-nio=
s2-Define-MUSL_DYNAMIC_LINKER.patch \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0040-Add=
-ssp_nonshared-to-link-commandline-for-musl-targe.patch \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0041-gcc=
-libcpp-support-ffile-prefix-map-old-new.patch \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0042-Reu=
se-fdebug-prefix-map-to-replace-ffile-prefix-map.patch \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0043-gcc=
-final.c-fdebug-prefix-map-support-to-remap-sourc.patch \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0044-lib=
gcc-Add-knob-to-use-ldbl-128-on-ppc.patch \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0045-Lin=
k-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0047-syn=
c-gcc-stddef.h-with-musl.patch \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0048-gcc=
-Enable-static-PIE.patch \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://fix-segm=
entation-fault-precompiled-hdr.patch \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://no-sse-f=
ix-test-case-failures.patch \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${BACKPORTS} \<=
br>
&gt; &gt;&gt;&gt; -&quot;<br>
&gt; &gt;&gt;&gt; -BACKPORTS =3D &quot;\<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Fix=
-internal-compiler-error-in-testcase.patch \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-PR-=
rtl-optimization-83030.patch \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Fix=
-ppc64le-build-Partial-backport-r256656.patch \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-PR-=
c-80290-memory-hog-with-std-pair.patch \<br>
&gt; &gt;&gt;&gt; -&quot;<br>
&gt; &gt;&gt;&gt; -<br>
&gt; &gt;&gt;&gt; -SRC_URI[md5sum] =3D &quot;be2da21680f27624f3a87055c4ba5a=
f2&quot;<br>
&gt; &gt;&gt;&gt; -SRC_URI[sha256sum] =3D &quot;832ca6ae04636adbb430e865a14=
51adf6979ab44ca1c8374f61fba65645ce15c&quot;<br>
&gt; &gt;&gt;&gt; -<br>
&gt; &gt;&gt;&gt; -S =3D &quot;${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${=
PV}&quot;<br>
&gt; &gt;&gt;&gt; -#S =3D &quot;${TMPDIR}/work-shared/gcc-${PV}-${PR}/git&q=
uot;<br>
&gt; &gt;&gt;&gt; -B =3D &quot;${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TAR=
GET_SYS}&quot;<br>
&gt; &gt;&gt;&gt; -<br>
&gt; &gt;&gt;&gt; -# Language Overrides<br>
&gt; &gt;&gt;&gt; -FORTRAN =3D &quot;&quot;<br>
&gt; &gt;&gt;&gt; -JAVA =3D &quot;&quot;<br>
&gt; &gt;&gt;&gt; -<br>
&gt; &gt;&gt;&gt; -LTO =3D &quot;--enable-lto&quot;<br>
&gt; &gt;&gt;&gt; -<br>
&gt; &gt;&gt;&gt; -EXTRA_OECONF_BASE =3D &quot;\<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 ${LTO} \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 --enable-libssp \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 --enable-libitm \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 --disable-bootstrap \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 --disable-libmudflap \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 --with-system-zlib \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 ${@&#39;--with-linker-hash-style=3D${LINKE=
R_HASH_STYLE}&#39; if &#39;${LINKER_HASH_STYLE}&#39; else &#39;&#39;} \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 --enable-linker-build-id \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 --with-ppl=3Dno \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 --with-cloog=3Dno \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 --enable-checking=3Drelease \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 --enable-cheaders=3Dc_global \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 --without-isl \<br>
&gt; &gt;&gt;&gt; -&quot;<br>
&gt; &gt;&gt;&gt; -<br>
&gt; &gt;&gt;&gt; -EXTRA_OECONF_INITIAL =3D &quot;\<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 --disable-libmudflap \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 --disable-libgomp \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 --disable-libitm \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 --disable-libquadmath \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 --with-system-zlib \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 --disable-lto \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 --disable-plugin \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 --enable-decimal-float=3Dno \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 --without-isl \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 gcc_cv_libc_provides_ssp=3Dyes \<br>
&gt; &gt;&gt;&gt; -&quot;<br>
&gt; &gt;&gt;&gt; -<br>
&gt; &gt;&gt;&gt; -EXTRA_OECONF_PATHS =3D &quot;\<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 --with-gxx-include-dir=3D/not/exist{target=
_includedir}/c++/${BINV} \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 --with-sysroot=3D/not/exist \<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 --with-build-sysroot=3D${STAGING_DIR_TARGE=
T} \<br>
&gt; &gt;&gt;&gt; -&quot;<br>
&gt; &gt;&gt;&gt; diff --git a/meta/recipes-devtools/gcc/gcc-7.3/0001-Fix-i=
nternal-compiler-error-in-testcase.patch b/meta/recipes-devtools/gcc/gcc-7.=
3/0001-Fix-internal-compiler-error-in-testcase.patch<br>
&gt; &gt;&gt;&gt; deleted file mode 100644<br>
&gt; &gt;&gt;&gt; index 45cc0ee..0000000<br>
&gt; &gt;&gt;&gt; --- a/meta/recipes-devtools/gcc/gcc-7.3/0001-Fix-internal=
-compiler-error-in-testcase.patch<br>
&gt; &gt;&gt;&gt; +++ /dev/null<br>
&gt; &gt;&gt;&gt; @@ -1,212 +0,0 @@<br>
&gt; &gt;&gt;&gt; -From d3cdd96a300f9003a1cc242541605169aacdc811 Mon Sep 17=
 00:00:00 2001<br>
&gt; &gt;&gt;&gt; -From: willschm &lt;willschm@138bc75d-0d04-0410-961f-82ee=
72b054a4&gt;<br>
&gt; &gt;&gt;&gt; -Date: Mon, 25 Sep 2017 14:35:02 +0000<br>
&gt; &gt;&gt;&gt; -Subject: [PATCH] [gcc]<br>
&gt; &gt;&gt;&gt; -<br>
&gt; &gt;&gt;&gt; -2017-09-25=C2=A0 Will Schmidt=C2=A0 &lt;<a href=3D"mailt=
o:will_schmidt@vnet.ibm.com" target=3D"_blank">will_schmidt@vnet.ibm.com</a=
>&gt;<br>
&gt; &gt;&gt;&gt; -<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/rs6000/rs6000.c (rs6=
000_gimple_fold_builtin): Add handling<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0for early folding of vector s=
tores (ALTIVEC_BUILTIN_ST_*).<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0(rs6000_builtin_valid_without=
_lhs): New helper function.<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/rs6000/rs6000-c.c (a=
ltivec_resolve_overloaded_builtin):<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0Remove obsoleted code for han=
dling ALTIVEC_BUILTIN_VEC_ST.<br>
&gt; &gt;&gt;&gt; -<br>
&gt; &gt;&gt;&gt; -git-svn-id: svn+ssh://<a href=3D"http://gcc.gnu.org/svn/=
gcc/trunk@253152" rel=3D"noreferrer" target=3D"_blank">gcc.gnu.org/svn/gcc/=
trunk@253152</a> 138bc75d-0d04-0410-961f-82ee72b054a4<br>
&gt; &gt;&gt;&gt; -<br>
&gt; &gt;&gt;&gt; -Fix internal compiler error for testcase gcc.dg/vmx/7d-0=
2.c<br>
&gt; &gt;&gt;&gt; -<br>
&gt; &gt;&gt;&gt; -Upstream commit: d3cdd96a300f9003a1cc242541605169aacdc81=
1<br>
&gt; &gt;&gt;&gt; -<br>
&gt; &gt;&gt;&gt; -Backport by Kaushik Phatak &lt;<a href=3D"mailto:Kaushik=
.Phatak@kpit.com" target=3D"_blank">Kaushik.Phatak@kpit.com</a>&gt;<br>
&gt; &gt;&gt;&gt; -<br>
&gt; &gt;&gt;&gt; -This patch removes changes to Changelog from the origina=
l upstream patch.<br>
&gt; &gt;&gt;&gt; -This will help us avoid conflicts.<br>
&gt; &gt;&gt;&gt; -<br>
&gt; &gt;&gt;&gt; -Upstream-Status: Backport<br>
&gt; &gt;&gt;&gt; -<br>
&gt; &gt;&gt;&gt; -Signed-off-by: Mark Hatle &lt;<a href=3D"mailto:mark.hat=
le@windriver.com" target=3D"_blank">mark.hatle@windriver.com</a>&gt;<br>
&gt; &gt;&gt;&gt; ----<br>
&gt; &gt;&gt;&gt; - gcc/ChangeLog=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 8 +++++<br>
&gt; &gt;&gt;&gt; - gcc/config/rs6000/rs6000-c.c | 72 ---------------------=
----------------------<br>
&gt; &gt;&gt;&gt; - gcc/config/rs6000/rs6000.c=C2=A0 =C2=A0| 73 +++++++++++=
+++++++++++++++++++++++++++++++--<br>
&gt; &gt;&gt;&gt; - 3 files changed, 78 insertions(+), 75 deletions(-)<br>
&gt; &gt;&gt;&gt; -<br>
&gt; &gt;&gt;&gt; -diff --git a/gcc/config/rs6000/rs6000-c.c b/gcc/config/r=
s6000/rs6000-c.c<br>
&gt; &gt;&gt;&gt; -index a49db97..4a363a1 100644<br>
&gt; &gt;&gt;&gt; ---- a/gcc/config/rs6000/rs6000-c.c<br>
&gt; &gt;&gt;&gt; -+++ b/gcc/config/rs6000/rs6000-c.c<br>
&gt; &gt;&gt;&gt; -@@ -6279,70 +6279,6 @@ altivec_resolve_overloaded_builti=
n (loca<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt;&gt;&gt; -<br>
&gt; &gt;&gt;&gt; --=C2=A0 /* Similarly for stvx.=C2=A0 */<br>
&gt; &gt;&gt;&gt; --=C2=A0 if (fcode =3D=3D ALTIVEC_BUILTIN_VEC_ST<br>
&gt; &gt;&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 &amp;&amp; (BYTES_BIG_ENDIAN || !V=
ECTOR_ELT_ORDER_BIG)<br>
&gt; &gt;&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 &amp;&amp; nargs =3D=3D 3)<br>
&gt; &gt;&gt;&gt; --=C2=A0 =C2=A0 {<br>
&gt; &gt;&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 tree arg0 =3D (*arglist)[0];<br>
&gt; &gt;&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 tree arg1 =3D (*arglist)[1];<br>
&gt; &gt;&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 tree arg2 =3D (*arglist)[2];<br>
&gt; &gt;&gt;&gt; --<br>
&gt; &gt;&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 /* Construct the masked address.=
=C2=A0 Let existing error handling take<br>
&gt; &gt;&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0over if we don&#39;t have a =
constant offset.=C2=A0 */<br>
&gt; &gt;&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 arg1 =3D fold (arg1);<br>
&gt; &gt;&gt;&gt; --<br>
&gt; &gt;&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 if (TREE_CODE (arg1) =3D=3D INTEGE=
R_CST)<br>
&gt; &gt;&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 {<br>
&gt; &gt;&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!ptrofftype_p (TREE_TYP=
E (arg1)))<br>
&gt; &gt;&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 arg1 =3D build1 (NOP=
_EXPR, sizetype, arg1);<br>
&gt; &gt;&gt;&gt; --<br>
&gt; &gt;&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 tree arg2_type =3D TREE_TYP=
E (arg2);<br>
&gt; &gt;&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (TREE_CODE (arg2_type) =
=3D=3D ARRAY_TYPE &amp;&amp; c_dialect_cxx ())<br>
&gt; &gt;&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; &gt;&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Force arra=
y-to-pointer decay for C++.=C2=A0 */<br>
&gt; &gt;&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 arg2 =3D defa=
ult_conversion (arg2);<br>
&gt; &gt;&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 arg2_type =3D=
 TREE_TYPE (arg2);<br>
&gt; &gt;&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt;&gt;&gt; --<br>
&gt; &gt;&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Find the built-in to mak=
e sure a compatible one exists; if not<br>
&gt; &gt;&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0we fall back t=
o default handling to get the error message.=C2=A0 */<br>
&gt; &gt;&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (desc =3D altivec_overl=
oaded_builtins;<br>
&gt; &gt;&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0desc-&g=
t;code &amp;&amp; desc-&gt;code !=3D fcode; desc++)<br>
&gt; &gt;&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
&gt; &gt;&gt;&gt; --<br>
&gt; &gt;&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (; desc-&gt;code =3D=3D=
 fcode; desc++)<br>
&gt; &gt;&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (rs6000_builtin_t=
ype_compatible (TREE_TYPE (arg0), desc-&gt;op1)<br>
&gt; &gt;&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&=
amp; rs6000_builtin_type_compatible (TREE_TYPE (arg1), desc-&gt;op2)<br>
&gt; &gt;&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&=
amp; rs6000_builtin_type_compatible (TREE_TYPE (arg2),<br>
&gt; &gt;&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0desc-&gt;op3))<br>
&gt; &gt;&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; &gt;&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tree a=
ddr =3D fold_build2_loc (loc, POINTER_PLUS_EXPR, arg2_type,<br>
&gt; &gt;&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0arg2, arg1);<br>
&gt; &gt;&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tree a=
ligned<br>
&gt; &gt;&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =3D fold_build2_loc (loc, BIT_AND_EXPR, arg2_type,<br>
&gt; &gt;&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </blockquote></div></div>

--000000000000708d8e0580205610--
