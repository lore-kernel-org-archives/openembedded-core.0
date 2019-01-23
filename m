Return-Path: <prvs=9199175db=Mikko.Rapeli@bmw.de>
Received: from esa2.bmw.c3s2.iphmx.com (esa2.bmw.c3s2.iphmx.com
	[68.232.133.169])
	by mail.openembedded.org (Postfix) with ESMTP id DDE2B6D13A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2019 08:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1548230594; x=1579766594;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=yGLuMO2EgOizjbE3G7WZogzWEcqqpBdaR22AefcIt+M=;
	b=RbkDVnRlz2HDda/6XmsJqYG/HtTLzOSkbVch/AU6jhLMMlVBpPmNrnuF
	C5tY3rEiqMrQIrGMGRwNyLDcuikuwjJOjZQytc9x8EtJnGupr6lnikHJ6
	SoPXxAWW/qNYAgi5pD0R+nZmTJZMA3wMfO/zKQZVqjXDQOUs9aNnOh2f+ g=;
Received: from esagw5.bmwgroup.com (HELO esagw5.muc) ([160.46.252.46]) by
	esa2.bmw.c3s2.iphmx.com with ESMTP/TLS; 23 Jan 2019 09:02:50 +0100
Received: from esabb1.muc ([160.50.100.31])  by esagw5.muc with ESMTP/TLS;
	23 Jan 2019 09:02:40 +0100
Received: from smucm10j.bmwgroup.net (HELO smucm10j.europe.bmw.corp)
	([160.48.96.46])
	by esabb1.muc with ESMTP/TLS; 23 Jan 2019 09:02:40 +0100
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10j.europe.bmw.corp
	(160.48.96.46) with Microsoft SMTP Server (TLS;
	Wed, 23 Jan 2019 09:02:39 +0100
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1395.000;
	Wed, 23 Jan 2019 09:02:39 +0100
From: <Mikko.Rapeli@bmw.de>
To: <akuster808@gmail.com>
Thread-Topic: [OE-core] [PATCH RFC sumo] gcc: update from 7.3 to 7.4
Thread-Index: AQHUrYueR7WzbiNc6U+7r3VDDspLbqWzBjeAgAADioCACOyhgIAAgcQA
Date: Wed, 23 Jan 2019 08:02:39 +0000
Message-ID: <20190123080236.GL7474@hiutale>
References: <1547636693-29101-1-git-send-email-mikko.rapeli@bmw.de>
	<CAMKF1sqiOyZO--Y=zZr=La0fZUNwWw4aeS+hovHjapa-7wpL-A@mail.gmail.com>
	<20190117080109.GZ7474@hiutale>
	<68651111-db74-a41d-a6d2-3e2610e4041d@gmail.com>
In-Reply-To: <68651111-db74-a41d-a6d2-3e2610e4041d@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.221.45]
MIME-Version: 1.0
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
X-List-Received-Date: Wed, 23 Jan 2019 08:03:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <62DAAED984058B4C8A410B27930B28AE@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 22, 2019 at 04:18:09PM -0800, akuster808 wrote:
>=20
>=20
> On 1/17/19 12:01 AM, Mikko.Rapeli@bmw.de wrote:
> > On Wed, Jan 16, 2019 at 11:48:29PM -0800, Khem Raj wrote:
> >> we need to apply this to thud as well, otherwise people upgrading from
> >> sumo to thud and staying with gcc 7 will see a downgrade. I am fine
> >> with the patch in general since its a point release. It still can
> >> cause issues so its not a simple change.
> > Ok, I had forgot about thud since I'm not using. Patch applies with con=
flicts,
> > meta/recipes-devtools/gcc/gcc-7.4/0008-c99-snprintf.patch needs to be d=
eleted.
>=20
> Actual it has turned out to be more than that.
> 0049-gcc-override-TARGET_LIBC_PROVIDES_SSP.patch did not migrate over
> and I had to refresh a lot of patches.
>=20
> Now I am seeing a compile error.
>=20
> usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/7.4.0/include/unwind.h':
> No such file or directory
>=20
>=20
> I am not taking this update to thud in this fashion. I am more than
> happy to revisit this with a clean patch to thud.

Ok. I wouldn't mind skipping this update from thud because it has gcc-8.2 a=
s default
anyway.

But I'd like to know if the update triggers any build failures on sumo and =
what
ever build targets are tested by yocto?

In my project I did not see any real problems, only compiler version string=
 failures
in some tests.

-Mikko

> - armin
> >
> > -Mikko
> >
> >> On Wed, Jan 16, 2019 at 3:30 AM Mikko Rapeli <mikko.rapeli@bmw.de> wro=
te:
> >>> 7.4 is a bug fix maintenance release.
> >>>
> >>> List of fixed bugs is:
> >>>
> >>> https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=3DRESOLVED&resolu=
tion=3DFIXED&target_milestone=3D7.4
> >>>
> >>> 85113   gcc     c++     jason   RESO    FIXE    [7/8 Regression] ICE =
with __builtin_constant_p  2018-12-06
> >>> 86070   gcc     libfortr        jvdelisle       RESO    FIXE    [7 re=
gression] gfortran.dg/fmt_zero_digits.f90 segmentation fault starting with =
r261077         2018-06-12
> >>> 85442   gcc     libstdc+        redi    RESO    FIXE    [7/8 Regressi=
on] cxx11-ios_failure.lo build fails for microblaze        2018-04-18
> >>> 70359   gcc     middle-e        aldyh   RESO    FIXE    [7/8/9 Regres=
sion] Code size increase for x86/ARM/others compared to gcc-5.3.0  2018-12-=
05
> >>> 81228   gcc     target  amker   RESO    FIXE    [7 Regression] ICE in=
 gen_vec_cmpv2dfv2di, at config/aarch64/aarch64-simd.md:2508       2018-02-=
22
> >>> 84071   gcc     rtl-opti        ebotcazou       RESO    FIXE    [7/8 =
regression] wrong elimination of zero-extension after sign-extended load   =
2018-02-02
> >>> 85925   gcc     rtl-opti        ebotcazou       RESO    FIXE    [7/8/=
9 regression] compilation of masking with 257 goes wrong in combine at -02 =
        2018-11-22
> >>> 81004   gcc     lto     hubicka         RESO    FIXE    [7 Regression=
] linking failed with -flto and static libboost_program_options    2018-03-=
08
> >>> 49726   gcc     driver  jakub   RESO    FIXE    [6 Regression] -g0 fi=
le.S -g does not produce debug info        2018-10-26
> >>> 80598   gcc     c++     jakub   RESO    FIXE    [7 regression] -Wunus=
ed triggers for functions used in uninstantiated templates         2018-06-=
25
> >>> 81661   gcc     tree-opt        jakub   RESO    FIXE    [7 Regression=
] ICE in gimplify_modify_expr, at gimplify.c:5638  2018-03-03
> >>> 83930   gcc     target  jakub   RESO    FIXE    [6 Regression] ICE: R=
TL check: expected code 'const_int', have 'mem' in simplify_binary_operatio=
n_1, at simplify-rtx.c:3302     2018-06-25
> >>> 83945   gcc     middle-e        jakub   RESO    FIXE    [7 Regression=
] internal compiler error: Segmentation fault with -O -fcode-hoisting      =
2018-03-03
> >>> 83958   gcc     c++     jakub   RESO    FIXE    [7 Regression] ICE: S=
egmentation fault (in find_decomp_class_base)      2018-03-03
> >>> 83993   gcc     c++     jakub   RESO    FIXE    [7 Regression] ICE: c=
onstant not recomputed when ADDR_EXPR changed      2018-03-03
> >>> 84082   gcc     c++     jakub   RESO    FIXE    [7 Regression] ICE wi=
th broken template function definition     2018-03-03
> >>> 84308   gcc     rtl-opti        jakub   RESO    FIXE    [7 Regression=
] Memory leak in spread_components         2018-03-03
> >>> 84430   gcc     c++     jakub   RESO    FIXE    [7 Regression] ICE wi=
th #pragma omp simd in lambda      2018-03-03
> >>> 84445   gcc     c++     jakub   RESO    FIXE    [7 Regression] ICE wi=
th __builtin_launder and virtual function  2018-03-03
> >>> 84503   gcc     tree-opt        jakub   RESO    FIXE    [7 Regression=
] store-merging miscompilation on powerpc64 with -O3 since r241789         =
2018-03-03
> >>> 84834   gcc     middle-e        jakub   RESO    FIXE    [7 Regression=
] ICE: tree check: expected integer_cst, have complex_cst in to_wide, at tr=
ee.h:5527       2018-06-25
> >>> 84841   gcc     tree-opt        jakub   RESO    FIXE    [7 Regression=
] ICE: tree check: expected ssa_name, have real_cst in rewrite_expr_tree_pa=
rallel, at tree-ssa-reassoc.c:4624      2018-06-23
> >>> 84853   gcc     c       jakub   RESO    FIXE    [7 Regression] ICE: v=
erify_gimple failed (expand_shift_1)       2018-06-25
> >>> 84961   gcc     c++     jakub   RESO    FIXE    [7 Regression] ICE er=
ror: SSA_NAME_DEF_STMT is wrong    2018-06-25
> >>> 84999   gcc     c       jakub   RESO    FIXE    [7 Regression] ICE in=
 make_vector_type, at tree.c:9561  2018-06-25
> >>> 85430   gcc     target  jakub   RESO    FIXE    [7 Regression] ICE: S=
IGSEGV in memory_operand at recog.c:1358/9 with -O2 -fno-tree-ccp -fno-tree=
-fre    2018-06-25
> >>> 85446   gcc     tree-opt        jakub   RESO    FIXE    [7 Regression=
] wrong-code on riscv64    2018-06-25
> >>> 86314   gcc     target  jakub   RESO    FIXE    [7/8/9 Regression] GC=
C 7.x and 8.x zero out "eax" before using "rax" in "lock bts"      2018-06-=
26
> >>> 71569   gcc     c++     jason   RESO    FIXE    [6 regression] Crash:=
 External definition of template member from template struct       2018-10-=
26
> >>> 71834   gcc     c++     jason   RESO    FIXE    [6/7 Regression] acce=
pts invalid C++11 code with too few number of template arguments for class =
template        2018-03-23
> >>> 80227   gcc     c++     jason   RESO    FIXE    [6/7 Regression] SFIN=
AE ambiguity with a pointer to array argument      2018-05-10
> >>> 80290   gcc     c++     jason   RESO    FIXE    [6/7/8/9 Regression] =
g++ uses unreasonable amount of memory compiling nested string maps        =
2018-06-28
> >>> 82152   gcc     c++     jason   RESO    FIXE    [7 Regression] ICE on=
 invalid code in C++17 mode if inheriting constructors are used    2018-04-=
06
> >>> 82336   gcc     c++     jason   RESO    FIXE    [6 Regression] GCC re=
quires but does not emit defaulted constructors in certain cases   2018-10-=
26
> >>> 82461   gcc     c++     jason   RESO    FIXE    [7 Regression] Tempor=
ary required for brace-initializing (non-literal-type) member variable     =
2018-01-29
> >>> 82664   gcc     c++     jason   RESO    FIXE    [7/8 Regression ] ICE=
 when using Match7 library         2018-02-16
> >>> 82764   gcc     c++     jason   RESO    FIXE    [7/8 Regression] ICE =
in output_constructor_regular_field, at varasm.c:5030      2018-05-03
> >>> 83227   gcc     c++     jason   RESO    FIXE    [7 Regression] intern=
al compiler error: in process_init_constructor_array       2018-02-16
> >>> 84045   gcc     c++     jason   RESO    FIXE    [7 Regression] ICE wh=
en is_nothrow_default_constructible is used before #include<set>   2018-02-=
16
> >>> 84355   gcc     c++     jason   RESO    FIXE    [7 Regression] ICE wi=
th failing template argument deduction     2018-03-23
> >>> 84665   gcc     c++     jason   RESO    FIXE    [7/8 Regression] inte=
rnal compiler error: in build_value_init, at cp/init.c:343         2018-04-=
05
> >>> 84937   gcc     c++     jason   RESO    FIXE    [7 Regression] ICE wi=
th class template argument deduction and auto      2018-03-23
> >>> 85006   gcc     c++     jason   RESO    FIXE    [7 Regression] [conce=
pts] ICE with bogus parameter pack         2018-04-06
> >>> 85060   gcc     c++     jason   RESO    FIXE    [7/8 Regression] Obje=
ct cannot call its inherited member function "without object"      2018-04-=
03
> >>> 85148   gcc     c++     jason   RESO    FIXE    [6/7/8 Regression] IC=
E with NSDMI and this pointer      2018-04-04
> >>> 85279   gcc     c++     jason   RESO    FIXE    [6 Regression] Broken=
 diagnostic for decltype   2018-05-01
> >>> 85470   gcc     c++     jason   RESO    FIXE    [7 Regression] Strang=
e error about "call to non-constexpr function"     2018-04-23
> >>> 85646   gcc     c++     jason   RESO    FIXE    [7/8/9 Regression] In=
correct lambda visibility with -fvisibility=3Dhidden         2018-09-04
> >>> 85815   gcc     c++     jason   RESO    FIXE    [7/8/9 Regression] in=
correct "invalid use of incomplete type" in a lambda on valid code         =
2018-06-12
> >>> 86060   gcc     c++     jason   RESO    FIXE    [6/7/8/9 Regression] =
g++ ICE at on with "c++03" in tsubst_copy, at cp/pt.c:15459        2018-06-=
12
> >>> 33562   gcc     tree-opt        law     RESO    FIXE    [6 Regression=
] aggregate DSE disabled   2018-04-30
> >>> 84658   gcc     ipa     marxin  RESO    FIXE    [7 Regression] -O3 -f=
merge-all-constants causes incorrect for-each loop generation.     2018-04-=
24
> >>> 84154   gcc     target  meissner        RESO    FIXE    [7 Regression=
] PowerPC GCC 7 and 8 have regression in converting fp to short/char and re=
turning it      2018-02-17
> >>> 71638   gcc     c++     mpolacek        RESO    FIXE    [6 Regression=
] ICE on invalid C++ code on x86_64-linux-gnu with -Wall (internal compiler=
 error: non-constant element in constant CONSTRUCTOR)   2018-10-26
> >>> 81860   gcc     c++     mpolacek        RESO    FIXE    [7 Regression=
] Call to undefined inline function involving inheriting constructors      =
2018-02-19
> >>> 84590   gcc     c++     mpolacek        RESO    FIXE    [7 Regression=
] -fsanitize=3Dundefined internal compiler error: tree check: expected cons=
tructor, have target_expr in split_nonconstant_init_1, at cp/typeck2.c:629 =
       2018-03-02
> >>> 84854   gcc     c++     mpolacek        RESO    FIXE    [7 Regression=
] ICE: unexpected expression in cxx_eval_constant_expression, at cp/constex=
pr.c:4774       2018-03-22
> >>> 84927   gcc     c++     mpolacek        RESO    FIXE    [7 Regression=
] ICE with NSDMI and reference     2018-03-22
> >>> 88120   gcc     c++     mpolacek        RESO    FIXE    [7 Regression=
] ICE in contains_placeholder_p at gcc/tree.c:3710         2018-12-04
> >>> 87542   gcc     c++     msebor  RESO    FIXE    [7/8 Regression] bogu=
s error on attribute format with a named constant argument         2018-11-=
19
> >>> 87462   gcc     debug   nathan  RESO    FIXE    [7/8 Regression] unde=
fined reference error occurs when -g, -fdebug-types-section and -O2 are use=
d at the same time      2018-11-30
> >>> 85222   gcc     libstdc+        redi    RESO    FIXE    [7 Regression=
] ABI breakage of __throw_ios_failure by r244498   2018-08-08
> >>> 85464   gcc     c++     redi    RESO    FIXE    [7 Regression] Wignor=
ed-qualifiers is emitted by cc1plus without diagnostics when triggered by a=
 cast operator.         2018-04-19
> >>> 85904   gcc     target  redi    RESO    FIXE    [7/8 Regression] conf=
igure issue cross compiling on netbsd, with patch  2018-08-13
> >>> 45397   gcc     tree-opt        rguenth         RESO    FIXE    [6 Re=
gression] Issues with integer narrowing conversions        2018-11-19
> >>> 79351   gcc     tree-opt        rguenth         RESO    FIXE    [7/8/=
9 Regression] Invalid tree PRE optimization around compound literal        =
2018-11-28
> >>> 84233   gcc     middle-e        rguenth         RESO    FIXE    [7/8 =
Regression] ICE (segfault) in gimple_assign_rhs_code       2018-02-08
> >>> 84486   gcc     tree-opt        rguenth         RESO    FIXE    [7 Re=
gression] code hoisting removes alignment assumption       2018-03-06
> >>> 85168   gcc     tree-opt        rguenth         RESO    FIXE    [7 Re=
gression] ICE in tree-ssa-coalesce.c: SSA corruption: Unable to coalesce ss=
a_names which are marked as MUST COALESCE when -O2 is used      2018-04-26
> >>> 85284   gcc     tree-opt        rguenth         RESO    FIXE    [7 Re=
gression] Loop miscompilation starting with r238367        2018-04-26
> >>> 85567   gcc     middle-e        rguenth         RESO    FIXE    [7 Re=
gression] internal compiler error: in gimplify_modify_expr, at gimplify.c:5=
797 when using sincos()         2018-06-07
> >>> 86076   gcc     tree-opt        rguenth         RESO    FIXE    [7 Re=
gression] ICE: verify_gimple failed (error: location references block not i=
n block tree)   2018-11-26
> >>> 86139   gcc     target  rguenth         RESO    FIXE    [7 Regression=
] ICE in in store_constructor, at expr.c:6849 on arm-linux-gnueabihf       =
2018-11-26
> >>> 86763   gcc     c++     rguenth         RESO    FIXE    [7 Regression=
] Wrong code comparing member of copy of a 237 byte object with nontrivial =
default constructor on x86-64 arch      2018-08-17
> >>> 87610   gcc     middle-e        rguenth         RESO    FIXE    [7 Re=
gression] wrong-code with restrict         2018-11-26
> >>> 87645   gcc     tree-opt        rguenth         RESO    FIXE    [7 Re=
gression] gcc hangs up on vr_values::vrp_visit_assignment_or_call  2018-11-=
26
> >>> 87665   gcc     tree-opt        rguenth         RESO    FIXE    [7 Re=
gression] gcc HEAD (svn: 265340) breaks elements on resize         2018-11-=
26
> >>> 84485   gcc     tree-opt        rsandifo        RESO    FIXE    [6 Re=
gression] Vectorising zero-stride rmw operation    2018-10-26
> >>> 85645   gcc     rtl-opti        segher  RESO    FIXE    [7 Regression=
] ICE in maybe_record_trace_start, at dwarf2cfi.c:2348     2018-08-13
> >>> 39838   gcc     middle-e        unassigned      RESO    FIXE    [6 re=
gression] unoptimal code for two simple loops      2018-10-26
> >>> 46639   gcc     tree-opt        unassigned      RESO    FIXE    [6 Re=
gression] Missing optimization due to function splitting and redundant cond=
itionals        2018-10-26
> >>> 61409   gcc     middle-e        unassigned      RESO    FIXE    [6 re=
gression] -Wmaybe-uninitialized false-positive with -O2    2018-10-26
> >>> 65135   gcc     rtl-opti        unassigned      RESO    FIXE    [6 Re=
gression] Performance regression in pic mode after r220674.        2018-10-=
26
> >>> 70681   gcc     rtl-opti        unassigned      RESO    FIXE    [7/8/=
9 Regression] FAIL: gcc.dg/ira-shrinkwrap-prep-2.c gcc.dg/pr10474.c on arm =
and powerpc     2018-11-20
> >>> 84813   gcc     c++     unassigned      RESO    FIXE    [7 Regression=
] internal compiler error: Segmentation fault with lambdas and constexpr va=
riables         2018-12-01
> >>> 85805   gcc     rtl-opti        unassigned      RESO    FIXE    [7/8 =
Regression] Wrong code for 64 bit comparisons on avr-gcc   2018-11-20
> >>> 87867   gcc     target  unassigned      RESO    FIXE    [7 regression=
] ICE on virtual destructor (-mlong-calls -ffunction-sections) on arm-none-=
eabi    2018-11-21
> >>> 84955   gcc     middle-e        vries   RESO    FIXE    [7 Regression=
] Incorrect OpenACC tile expansion         2018-05-01
> >>> 87473   gcc     tree-opt        wschmidt        RESO    FIXE    [7/8/=
9 Regression] ICE in create_add_on_incoming_edge, at gimple-ssa-strength-re=
duction.c:2344  2018-10-27
> >>> 85436   gcc     target  bergner         RESO    FIXE    [7 Regression=
] ICE compiling go code with -mcpu=3Dpower9  2018-04-20
> >>> 85384   gcc     jit     dmalcolm        RESO    FIXE    libgccjit doe=
s not work if --with-gcc-major-version is used     2018-06-25
> >>> 83496   gcc     rtl-opti        ebotcazou       RESO    FIXE    [7/8 =
regression] wrong code generated with -Os -mbranch-cost=3D1  2018-02-27
> >>> 88199   gcc     libstdc+        fdumont         RESO    FIXE    [7/8 =
Regression] memory leak on unordered container move assignment     2018-11-=
28
> >>> 84192   gcc     c++     jakub   RESO    FIXE    [7 Regression] ICE wi=
th statement expression    2018-03-03
> >>> 84444   gcc     c++     jakub   RESO    FIXE    ICE with __builtin_la=
under and cast     2018-03-03
> >>> 85208   gcc     c++     jakub   RESO    FIXE    ICE with #pragma weak=
 and structured binding    2018-06-24
> >>> 85529   gcc     tree-opt        jakub   RESO    FIXE    [7 Regression=
] wrong code at -O2 and -O3 on x86_64-linux-gnu    2018-06-25
> >>> 87065   gcc     rtl-opti        jakub   RESO    FIXE    [7 Regression=
] combine causes ICE in trunc_int_for_mode         2018-10-12
> >>> 64095   gcc     c++     jason   RESO    FIXE    [C++14] Ellipsis at e=
nd of generic lambda parameter-declaration-clause should be parsed as a par=
ameter pack     2018-07-28
> >>> 81853   gcc     c++     jason   RESO    FIXE    [ 6/7/8 Regression] "=
using namespace" is not a constant expression in a statement expression    =
2018-02-16
> >>> 83835   gcc     c++     jason   RESO    FIXE    [7/8 Regression] cons=
texpr constructor rejected in c++17 mode (regression WRT c++14)    2018-02-=
16
> >>> 84015   gcc     c++     jason   RESO    FIXE    [7 Regression] ICE wi=
th class template argument deduction       2018-02-26
> >>> 86378   gcc     c++     jason   RESO    FIXE    [7/8/9 regression] ty=
pedef breaks functional cast in noexcept-qualifier         2018-07-03
> >>> 80867   gcc     bootstra        kelvin  RESO    FIXE    gnat bootstra=
p broken on powerpc64le-linux-gnu with -O3         2018-01-31
> >>> 85081   gcc     sanitize        marxin  RESO    FIXE    [7 Regression=
] Sanitizer error with references in vectorized/parallel for-loop  2018-04-=
24
> >>> 85424   gcc     target  meissner        RESO    FIXE    The __builtin=
_packlongdouble function might have issues with the output overlapping the =
inputs  2018-06-25
> >>> 83659   gcc     c++     mpolacek        RESO    FIXE    [7 Regression=
] ICE on compilable C++ code: in tree_to_shwi, at tree.c:6821      2018-03-=
03
> >>> 71625   gcc     tree-opt        msebor  RESO    FIXE    missing strle=
n optimization on different array initialization style     2018-10-05
> >>> 87284   gcc     fortran         pault   RESO    FIXE    [7/8/9 Regres=
sion] Allocation of class arrays with mold results in "conditional jump or =
move depends on uninitialised value"    2018-09-13
> >>> 78595   gcc     libstdc+        redi    RESO    FIXE    Unnecessary c=
opies in _Rb_tree  2018-10-12
> >>> 81076   gcc     libstdc+        redi    RESO    FIXE    __byte_operan=
d<cv T> is not SFINAE-friendly     2018-01-25
> >>> 82966   gcc     libstdc+        redi    RESO    FIXE    node_handle s=
wap fails to compile       2018-05-14
> >>> 83658   gcc     libstdc+        redi    RESO    FIXE    any::emplace =
deletes invalid memory when an overloaded operator new() throws    2018-01-=
29
> >>> 83662   gcc     libstdc+        redi    RESO    FIXE    std::aligned_=
alloc() not available      2018-03-23
> >>> 84087   gcc     libstdc+        redi    RESO    FIXE    string::assig=
n problem with two arguments       2018-08-23
> >>> 84532   gcc     libstdc+        redi    RESO    FIXE    [7 Regression=
] std::thread::__make_invoker prematurely unwraps reference_wrappers       =
2018-02-26
> >>> 85671   gcc     libstdc+        redi    RESO    FIXE    Lack of `std:=
:move()` inside `operator/` for `std::filesystem::path`.   2018-07-04
> >>> 85812   gcc     libstdc+        redi    RESO    FIXE    [7/8 Regressi=
on] make_exception_ptr can leak the allocated exception if construction thr=
ows     2018-05-17
> >>> 86138   gcc     libstdc+        redi    RESO    FIXE    [7/8 Regressi=
on] C++17: getline(istream, string) crashes on Cygwin because incompatible =
C++14 function is called        2018-09-21
> >>> 86169   gcc     libstdc+        redi    RESO    FIXE    .data() fails=
 to unshare strings        2018-06-15
> >>> 86734   gcc     libstdc+        redi    RESO    FIXE    [DR 2188] rev=
erse_iterator::operator-> does not support overloaded operator&    2018-08-=
08
> >>> 86861   gcc     libstdc+        redi    RESO    FIXE    18_support/ne=
w_aligned.cc FAILs         2018-08-07
> >>> 87538   gcc     libstdc+        redi    RESO    FIXE    [7/8 Regressi=
on] Incorrect noexcept specifier for not_fn        2018-10-08
> >>> 87822   gcc     libstdc+        redi    RESO    FIXE    [6/7/8/9 Regr=
ession] Binary incompatibility in std::pair introduced by PR 86751         =
2018-10-31
> >>> 82795   gcc     target  rguenth         RESO    FIXE    [7/8 Regressi=
on] ICE in predicate_mem_writes, at tree-if-conv.c:2251    2018-02-01
> >>> 84190   gcc     c       rguenth         RESO    FIXE    [7/8 Regressi=
on] double arithmetic on x86 no longer rounds to nearest   2018-02-16
> >>> 81647   gcc     target  sudi    RESO    FIXE    inconsistent LTGT beh=
avior at different optimization levels on AArch64.         2018-04-04
> >>> 85203   gcc     target  thomas.preudhomme       RESO    FIXE    cmse_=
nonsecure_caller intrinsic returns incorrect results       2018-04-17
> >>> 84654   gcc     libstdc+        tuliom  RESO    FIXE    libstdc++ tri=
es to use __float128 when compiling with -mno-float128     2018-08-07
> >>> 58372   gcc     c++     ubizjak         RESO    FIXE    internal comp=
iler error: ix86_compute_frame_layout      2018-11-11
> >>> 87928   gcc     target  ubizjak         RESO    FIXE    [7/8/9 Regres=
sion] ICE in ix86_compute_frame_layout, at config/i386/i386.c:11161 since r=
228607  2018-11-20
> >>> 88051   gcc     target  ubizjak         RESO    FIXE    internal comp=
iler error: in add_clobbers, at config/i386/sync.md:1762   2018-11-22
> >>> 71450   gcc     c++     unassigned      RESO    FIXE    [6 Regression=
] ICE on invalid C++11 code on x86_64-linux-gnu: in tree check: expected re=
cord_type or union_type or qual_union_type, have template_type_parm in look=
up_base, at cp/search.c:203  2018-11-19
> >>> 81589   gcc     c++     unassigned      RESO    FIXE    Possible Fals=
e-Positive with decltype   2018-06-22
> >>> 81763   gcc     target  unassigned      RESO    FIXE    Issues with B=
MI on 32bit x86 apps on GCC 7.1+   2018-01-29
> >>> 82805   gcc     target  unassigned      RESO    FIXE    [7/8/9 Regres=
sion] SPEC CPU2006 454.calculix ~6% performance deviation in between 6.3 an=
d 7.2   2018-06-08
> >>> 82813   gcc     ada     unassigned      RESO    FIXE    warning: '.bu=
iltin_memcpy' writing between 2 and 6 bytes into a region of size 0 overflo=
ws the destination [-Wstringop-overflow=3D]       2018-03-12
> >>> 83830   gcc     libstdc+        unassigned      RESO    FIXE    has_u=
nique_object_representations_v is missing  2018-01-25
> >>> 83990   gcc     c++     unassigned      RESO    FIXE    [7 Regression=
] Spurious "potential null pointer dereference" warning regression from 7.1=
 onwards        2018-02-15
> >>> 84769   gcc     libstdc+        unassigned      RESO    FIXE    varia=
nt::get(): unscoped call to get<size_t>    2018-05-03
> >>> 84773   gcc     libstdc+        unassigned      RESO    FIXE    [7/8 =
Regression] Cross-compilers do not use aligned_alloc or _aligned_malloc for=
 aligned-new    2018-03-12
> >>> 86127   gcc     libstdc+        unassigned      RESO    FIXE    STL c=
ontainers do not satisfy container.requirements.general clause 8   2018-07-=
04
> >>> 86705   gcc     middle-e        unassigned      RESO    FIXE    [7/8/=
9 Regression] pr45678-2.c ICE with msp430-elf -mlarge      2018-08-02
> >>> 87033   gcc     target  unassigned      RESO    FIXE    The compiler =
does not generate the LWAX instruction     2018-09-28
> >>> 87370   gcc     target  unassigned      RESO    FIXE    [7/8/9 Regres=
sion] Inefficient return code of struct values     2018-12-14
> >>> 87517   gcc     target  unassigned      RESO    FIXE    Typo in avx51=
2fintrin.h         2018-10-12
> >>> 80654   gcc     libstdc+        ville.voutilainen       RESO    FIXE =
   is_trivially_copy_constructible fails with compiler error with vector of=
 uncopyable objects     2018-06-22
> >>> 84116   gcc     fortran         jakub   RESO    FIXE    [7 Regression=
] ICE in gfc_match_omp_clauses, at fortran/openmp.c:1354   2018-03-03
> >>> 84449   gcc     c++     jakub   RESO    FIXE    [7 Regression] ICE wi=
th constexpr and deleted destructor        2018-03-03
> >>> 85210   gcc     c++     jakub   RESO    FIXE    [7 Regression] ICE wi=
th broken structured binding in template   2018-06-24
> >>> 44491   gcc     fortran         kargl   RESO    FIXE    Diagnostic ju=
st shows "<During initialization>" instead of a locus      2018-06-12
> >>> 51434   gcc     fortran         kargl   RESO    FIXE    ICE with scal=
ar init of an array parameter, used in DT default init with transfer       =
2018-03-03
> >>> 77414   gcc     fortran         kargl   RESO    FIXE    ICE in create=
_function_arglist, at fortran/trans-decl.c:2410    2018-03-19
> >>> 78278   gcc     fortran         kargl   RESO    FIXE    ICE in gfc_wi=
de_memset, at fortran/scanner.c:153        2018-06-09
> >>> 78741   gcc     fortran         kargl   RESO    FIXE    ICE in gfc_ge=
t_symbol_decl, at fortran/trans-decl.c:1534        2018-03-16
> >>> 85981   gcc     fortran         kargl   RESO    FIXE    ICE in gfc_tr=
ans_string_copy, at fortran/trans-expr.c:6539      2018-06-04
> >>> 86045   gcc     fortran         kargl   RESO    FIXE    ICE in reduce=
_binary_ac, at fortran/arith.c:1308        2018-06-07
> >>> 86059   gcc     fortran         kargl   RESO    FIXE    ICE in reduce=
_binary_ac, at fortran/arith.c:1308 (and others)   2018-06-09
> >>> 86110   gcc     fortran         kargl   RESO    FIXE    ICE in gfc_re=
solve_character_array_constructor, at fortran/array.c:2044         2018-06-=
13
> >>> 68467   gcc     target  law     RESO    FIXE    libgcc, compilation f=
or target m68k-linux breaks in linux_atomic.c      2018-01-29
> >>> 85258   gcc     c++     mpolacek        RESO    FIXE    [7/8 Regressi=
on] ICE with invalid range-based for-loop  2018-04-12
> >>> 80657   gcc     fortran         pault   RESO    FIXE    [7/8/9 Regres=
sion] Loop in character function declaration       2018-05-20
> >>> 80965   gcc     fortran         pault   RESO    FIXE    [7/8 Regressi=
on] ICE with class argument and -O2 optimization   2018-03-03
> >>> 84546   gcc     fortran         pault   RESO    FIXE    [7 Regression=
] Bad sourced allocation of CLASS(*) with source with CLASS(*) component   =
2018-05-16
> >>> 84113   gcc     target  segher  RESO    FIXE    [7/8 Regression] libg=
cc/unwind.inc:136:1: unrecognizable insn: internal compiler error on Darwin=
        2018-02-08
> >>> 78238   gcc     fortran         tkoenig         RESO    FIXE    [7/8 =
Regression] [OOP] ICE: verify_gimple failed, with -fdefault-integer-8      =
2018-02-25
> >>> 84270   gcc     fortran         tkoenig         RESO    FIXE    [7/8 =
Regression] optimization bug with assumed size array argument      2018-02-=
17
> >>> 85641   gcc     fortran         tkoenig         RESO    FIXE    [7/8/=
9 Regression] ICE with string concatenate  2018-06-07
> >>> 88073   gcc     fortran         tkoenig         RESO    FIXE    [7/8 =
Regression] Internal compiler error compiling WHERE construct with -O or -O=
2       2018-11-26
> >>> 62247   gcc     target  unassigned      RESO    FIXE    [7/8/9 Regres=
sion] FAIL: g++.dg/abi/anon3.C -std=3Dc++98/9 scan-assembler .weak(_definit=
ion)      2018-11-21
> >>> 68226   gcc     fortran         unassigned      RESO    FIXE    [7/8/=
9 Regression] [OOP] ICE on assignment of pointer-valued function to allocat=
able    2018-10-26
> >>> 79929   gcc     fortran         unassigned      RESO    FIXE    [7 Re=
gression] Bogus Warning: '__builtin_memset': specified size 4294967291 exce=
eds maximum object size 2147483647      2018-05-04
> >>> 82961   gcc     target  unassigned      RESO    FIXE    ICE in dwarf2=
out.c: deferred_asm_name !=3D NULL   2018-11-22
> >>> 83319   gcc     fortran         unassigned      RESO    FIXE    [7/8 =
Regression] ICE on use of allocatable component in derived type coarray def=
ined in module  2018-03-28
> >>> 84070   gcc     fortran         unassigned      RESO    FIXE    Incor=
rect assignment to allocatable character variable  2018-03-11
> >>> 84209   gcc     target  unassigned      RESO    FIXE    [avr] Don't s=
plit SP in split2  2018-03-07
> >>> 87597   gcc     fortran         unassigned      RESO    FIXE    [7/8/=
9 Regression] wrong result with matmul inlining    2018-11-03
> >>> 38351   gcc     fortran         kargl   RESO    FIXE    Poor error me=
ssage for rank mismatch in operator args   2018-06-09
> >>>
> >>> Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
> >>> ---
> >>>  meta/recipes-devtools/gcc/gcc-7.3.inc              | 132 ----------
> >>>  ...1-Fix-internal-compiler-error-in-testcase.patch | 212 -----------=
----
> >>>  ...ix-ppc64le-build-Partial-backport-r256656.patch |  37 ---
> >>>  .../0001-PR-c-80290-memory-hog-with-std-pair.patch |  58 -----
> >>>  .../gcc-7.3/0001-PR-rtl-optimization-83030.patch   | 272 -----------=
---------
> >>>  .../0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch     |  42 ---
> >>>  .../gcc/gcc-7.3/0008-c99-snprintf.patch            |  28 --
> >>>  .../0009-gcc-poison-system-directories.patch       | 192 -----------=
---
> >>>  .../gcc/gcc-7.3/0010-gcc-poison-dir-extend.patch   |  39 ---
> >>>  .../0011-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |  73 ------
> >>>  .../gcc/gcc-7.3/0012-64-bit-multilib-hack.patch    |  85 ------
> >>>  .../gcc/gcc-7.3/0013-optional-libstdc.patch        | 125 ---------
> >>>  ...0014-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch |  59 -----
> >>>  .../gcc/gcc-7.3/0015-COLLECT_GCC_OPTIONS.patch     |  38 ---
> >>>  ...efaults.h-in-B-instead-of-S-and-t-oe-in-B.patch |  96 -------
> >>>  .../gcc-7.3/0017-fortran-cross-compile-hack.patch  |  46 ----
> >>>  .../gcc/gcc-7.3/0018-cpp-honor-sysroot.patch       |  54 ----
> >>>  .../gcc-7.3/0019-MIPS64-Default-to-N64-ABI.patch   |  57 -----
> >>>  ...C_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch | 234 -----------=
------
> >>>  ...0021-gcc-Fix-argument-list-too-long-error.patch |  40 ---
> >>>  .../gcc/gcc-7.3/0022-Disable-sdt.patch             | 113 --------
> >>>  .../gcc/gcc-7.3/0023-libtool.patch                 |  42 ---
> >>>  ...4-pass-fix-v4bx-to-linker-to-support-EABI.patch |  43 ----
> >>>  ...tilib-config-files-from-B-instead-of-usin.patch | 102 --------
> >>>  ...-libdir-from-.la-which-usually-points-to-.patch |  31 ---
> >>>  .../gcc/gcc-7.3/0027-export-CPP.patch              |  53 ----
> >>>  ...AltiVec-generation-on-powepc-linux-target.patch |  56 ----
> >>>  ...-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch |  42 ---
> >>>  ...Ensure-target-gcc-headers-can-be-included.patch |  98 -------
> >>>  ...-t-build-with-disable-dependency-tracking.patch |  54 ----
> >>>  ...h-host-directory-during-relink-if-inst_pr.patch |  38 ---
> >>>  ...IBS_DIR-replacement-instead-of-hardcoding.patch |  29 ---
> >>>  .../0034-aarch64-Add-support-for-musl-ldso.patch   |  28 --
> >>>  ...ibcc1-fix-libcc1-s-install-path-and-rpath.patch |  54 ----
> >>>  ...-handle-sysroot-support-for-nativesdk-gcc.patch | 213 -----------=
-----
> >>>  ...et-sysroot-gcc-version-specific-dirs-with.patch | 102 --------
> >>>  ...-various-_FOR_BUILD-and-related-variables.patch | 137 ----------
> >>>  .../0039-nios2-Define-MUSL_DYNAMIC_LINKER.patch    |  28 --
> >>>  ...shared-to-link-commandline-for-musl-targe.patch |  87 -------
> >>>  ...c-libcpp-support-ffile-prefix-map-old-new.patch | 284 -----------=
----------
> >>>  ...ug-prefix-map-to-replace-ffile-prefix-map.patch |  43 ----
> >>>  ...-fdebug-prefix-map-support-to-remap-sourc.patch |  54 ----
> >>>  ...44-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch | 124 ---------
> >>>  ...bgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch |  29 ---
> >>>  .../gcc-7.3/0047-sync-gcc-stddef.h-with-musl.patch |  91 -------
> >>>  .../gcc/gcc-7.3/0048-gcc-Enable-static-PIE.patch   |  46 ----
> >>>  .../fix-segmentation-fault-precompiled-hdr.patch   |  49 ----
> >>>  .../gcc-7.3/no-sse-fix-test-case-failures.patch    | 259 -----------=
--------
> >>>  meta/recipes-devtools/gcc/gcc-7.4.inc              | 130 ++++++++++
> >>>  ...1-Fix-internal-compiler-error-in-testcase.patch | 212 +++++++++++=
++++
> >>>  ...ix-ppc64le-build-Partial-backport-r256656.patch |  37 +++
> >>>  .../gcc-7.4/0001-PR-rtl-optimization-83030.patch   | 272 +++++++++++=
+++++++++
> >>>  .../0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch     |  42 +++
> >>>  .../gcc/gcc-7.4/0008-c99-snprintf.patch            |  28 ++
> >>>  .../0009-gcc-poison-system-directories.patch       | 192 +++++++++++=
+++
> >>>  .../gcc/gcc-7.4/0010-gcc-poison-dir-extend.patch   |  39 +++
> >>>  .../0011-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |  73 ++++++
> >>>  .../gcc/gcc-7.4/0012-64-bit-multilib-hack.patch    |  85 ++++++
> >>>  .../gcc/gcc-7.4/0013-optional-libstdc.patch        | 125 +++++++++
> >>>  ...0014-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch |  59 +++++
> >>>  .../gcc/gcc-7.4/0015-COLLECT_GCC_OPTIONS.patch     |  38 +++
> >>>  ...efaults.h-in-B-instead-of-S-and-t-oe-in-B.patch |  96 +++++++
> >>>  .../gcc-7.4/0017-fortran-cross-compile-hack.patch  |  46 ++++
> >>>  .../gcc/gcc-7.4/0018-cpp-honor-sysroot.patch       |  54 ++++
> >>>  .../gcc-7.4/0019-MIPS64-Default-to-N64-ABI.patch   |  57 +++++
> >>>  ...C_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch | 234 +++++++++++=
++++++
> >>>  ...0021-gcc-Fix-argument-list-too-long-error.patch |  40 +++
> >>>  .../gcc/gcc-7.4/0022-Disable-sdt.patch             | 113 ++++++++
> >>>  .../gcc/gcc-7.4/0023-libtool.patch                 |  42 +++
> >>>  ...4-pass-fix-v4bx-to-linker-to-support-EABI.patch |  43 ++++
> >>>  ...tilib-config-files-from-B-instead-of-usin.patch | 102 ++++++++
> >>>  ...-libdir-from-.la-which-usually-points-to-.patch |  31 +++
> >>>  .../gcc/gcc-7.4/0027-export-CPP.patch              |  53 ++++
> >>>  ...AltiVec-generation-on-powepc-linux-target.patch |  56 ++++
> >>>  ...-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch |  42 +++
> >>>  ...Ensure-target-gcc-headers-can-be-included.patch |  98 +++++++
> >>>  ...-t-build-with-disable-dependency-tracking.patch |  54 ++++
> >>>  ...h-host-directory-during-relink-if-inst_pr.patch |  38 +++
> >>>  ...IBS_DIR-replacement-instead-of-hardcoding.patch |  29 +++
> >>>  .../0034-aarch64-Add-support-for-musl-ldso.patch   |  28 ++
> >>>  ...ibcc1-fix-libcc1-s-install-path-and-rpath.patch |  54 ++++
> >>>  ...-handle-sysroot-support-for-nativesdk-gcc.patch | 213 +++++++++++=
+++++
> >>>  ...et-sysroot-gcc-version-specific-dirs-with.patch | 102 ++++++++
> >>>  ...-various-_FOR_BUILD-and-related-variables.patch | 137 ++++++++++
> >>>  .../0039-nios2-Define-MUSL_DYNAMIC_LINKER.patch    |  28 ++
> >>>  ...shared-to-link-commandline-for-musl-targe.patch |  87 +++++++
> >>>  ...c-libcpp-support-ffile-prefix-map-old-new.patch | 284 +++++++++++=
++++++++++
> >>>  ...ug-prefix-map-to-replace-ffile-prefix-map.patch |  43 ++++
> >>>  ...-fdebug-prefix-map-support-to-remap-sourc.patch |  54 ++++
> >>>  ...44-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch | 124 +++++++++
> >>>  ...bgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch |  29 +++
> >>>  .../gcc-7.4/0047-sync-gcc-stddef.h-with-musl.patch |  91 +++++++
> >>>  .../gcc/gcc-7.4/0048-gcc-Enable-static-PIE.patch   |  46 ++++
> >>>  .../fix-segmentation-fault-precompiled-hdr.patch   |  49 ++++
> >>>  .../gcc-7.4/no-sse-fix-test-case-failures.patch    | 259 +++++++++++=
++++++++
> >>>  .../recipes-devtools/gcc/gcc-cross-canadian_7.3.bb |   5 -
> >>>  .../recipes-devtools/gcc/gcc-cross-canadian_7.4.bb |   5 +
> >>>  meta/recipes-devtools/gcc/gcc-cross-initial_7.3.bb |   2 -
> >>>  meta/recipes-devtools/gcc/gcc-cross-initial_7.4.bb |   2 +
> >>>  meta/recipes-devtools/gcc/gcc-cross_7.3.bb         |   3 -
> >>>  meta/recipes-devtools/gcc/gcc-cross_7.4.bb         |   3 +
> >>>  .../gcc/gcc-crosssdk-initial_7.3.bb                |   3 -
> >>>  .../gcc/gcc-crosssdk-initial_7.4.bb                |   3 +
> >>>  meta/recipes-devtools/gcc/gcc-crosssdk_7.3.bb      |   2 -
> >>>  meta/recipes-devtools/gcc/gcc-crosssdk_7.4.bb      |   2 +
> >>>  meta/recipes-devtools/gcc/gcc-runtime_7.3.bb       |   7 -
> >>>  meta/recipes-devtools/gcc/gcc-runtime_7.4.bb       |   7 +
> >>>  meta/recipes-devtools/gcc/gcc-sanitizers_7.3.bb    |   2 -
> >>>  meta/recipes-devtools/gcc/gcc-sanitizers_7.4.bb    |   2 +
> >>>  meta/recipes-devtools/gcc/gcc-source_7.3.bb        |   4 -
> >>>  meta/recipes-devtools/gcc/gcc-source_7.4.bb        |   4 +
> >>>  meta/recipes-devtools/gcc/gcc_7.3.bb               |  10 -
> >>>  meta/recipes-devtools/gcc/gcc_7.4.bb               |  10 +
> >>>  meta/recipes-devtools/gcc/libgcc-initial_7.3.bb    |   2 -
> >>>  meta/recipes-devtools/gcc/libgcc-initial_7.4.bb    |   2 +
> >>>  meta/recipes-devtools/gcc/libgcc_7.3.bb            |   2 -
> >>>  meta/recipes-devtools/gcc/libgcc_7.4.bb            |   2 +
> >>>  meta/recipes-devtools/gcc/libgfortran_7.3.bb       |   3 -
> >>>  meta/recipes-devtools/gcc/libgfortran_7.4.bb       |   3 +
> >>>  119 files changed, 4233 insertions(+), 4293 deletions(-)
> >>>  delete mode 100644 meta/recipes-devtools/gcc/gcc-7.3.inc
> >>>  delete mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0001-Fix-intern=
al-compiler-error-in-testcase.patch
> >>>  delete mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0001-Fix-ppc64l=
e-build-Partial-backport-r256656.patch
> >>>  delete mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0001-PR-c-80290=
-memory-hog-with-std-pair.patch
> >>>  delete mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0001-PR-rtl-opt=
imization-83030.patch
> >>>  delete mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0001-gcc-4.3.1-=
ARCH_FLAGS_FOR_TARGET.patch
> >>>  delete mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0008-c99-snprin=
tf.patch
> >>>  delete mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0009-gcc-poison=
-system-directories.patch
> >>>  delete mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0010-gcc-poison=
-dir-extend.patch
> >>>  delete mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0011-gcc-4.3.3-=
SYSROOT_CFLAGS_FOR_TARGET.patch
> >>>  delete mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0012-64-bit-mul=
tilib-hack.patch
> >>>  delete mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0013-optional-l=
ibstdc.patch
> >>>  delete mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0014-gcc-disabl=
e-MASK_RELAX_PIC_CALLS-bit.patch
> >>>  delete mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0015-COLLECT_GC=
C_OPTIONS.patch
> >>>  delete mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0016-Use-the-de=
faults.h-in-B-instead-of-S-and-t-oe-in-B.patch
> >>>  delete mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0017-fortran-cr=
oss-compile-hack.patch
> >>>  delete mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0018-cpp-honor-=
sysroot.patch
> >>>  delete mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0019-MIPS64-Def=
ault-to-N64-ABI.patch
> >>>  delete mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0020-Define-GLI=
BC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> >>>  delete mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0021-gcc-Fix-ar=
gument-list-too-long-error.patch
> >>>  delete mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0022-Disable-sd=
t.patch
> >>>  delete mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0023-libtool.pa=
tch
> >>>  delete mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0024-gcc-armv4-=
pass-fix-v4bx-to-linker-to-support-EABI.patch
> >>>  delete mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0025-Use-the-mu=
ltilib-config-files-from-B-instead-of-usin.patch
> >>>  delete mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0026-Avoid-usin=
g-libdir-from-.la-which-usually-points-to-.patch
> >>>  delete mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0027-export-CPP=
.patch
> >>>  delete mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0028-Enable-SPE=
-AltiVec-generation-on-powepc-linux-target.patch
> >>>  delete mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0029-Disable-th=
e-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
> >>>  delete mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0030-Ensure-tar=
get-gcc-headers-can-be-included.patch
> >>>  delete mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0031-gcc-4.8-wo=
n-t-build-with-disable-dependency-tracking.patch
> >>>  delete mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0032-Don-t-sear=
ch-host-directory-during-relink-if-inst_pr.patch
> >>>  delete mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0033-Use-SYSTEM=
LIBS_DIR-replacement-instead-of-hardcoding.patch
> >>>  delete mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0034-aarch64-Ad=
d-support-for-musl-ldso.patch
> >>>  delete mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0035-libcc1-fix=
-libcc1-s-install-path-and-rpath.patch
> >>>  delete mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0036-handle-sys=
root-support-for-nativesdk-gcc.patch
> >>>  delete mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0037-Search-tar=
get-sysroot-gcc-version-specific-dirs-with.patch
> >>>  delete mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0038-Fix-variou=
s-_FOR_BUILD-and-related-variables.patch
> >>>  delete mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0039-nios2-Defi=
ne-MUSL_DYNAMIC_LINKER.patch
> >>>  delete mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0040-Add-ssp_no=
nshared-to-link-commandline-for-musl-targe.patch
> >>>  delete mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0041-gcc-libcpp=
-support-ffile-prefix-map-old-new.patch
> >>>  delete mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0042-Reuse-fdeb=
ug-prefix-map-to-replace-ffile-prefix-map.patch
> >>>  delete mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0043-gcc-final.=
c-fdebug-prefix-map-support-to-remap-sourc.patch
> >>>  delete mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0044-libgcc-Add=
-knob-to-use-ldbl-128-on-ppc.patch
> >>>  delete mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0045-Link-libgc=
c-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
> >>>  delete mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0047-sync-gcc-s=
tddef.h-with-musl.patch
> >>>  delete mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0048-gcc-Enable=
-static-PIE.patch
> >>>  delete mode 100644 meta/recipes-devtools/gcc/gcc-7.3/fix-segmentatio=
n-fault-precompiled-hdr.patch
> >>>  delete mode 100644 meta/recipes-devtools/gcc/gcc-7.3/no-sse-fix-test=
-case-failures.patch
> >>>  create mode 100644 meta/recipes-devtools/gcc/gcc-7.4.inc
> >>>  create mode 100644 meta/recipes-devtools/gcc/gcc-7.4/0001-Fix-intern=
al-compiler-error-in-testcase.patch
> >>>  create mode 100644 meta/recipes-devtools/gcc/gcc-7.4/0001-Fix-ppc64l=
e-build-Partial-backport-r256656.patch
> >>>  create mode 100644 meta/recipes-devtools/gcc/gcc-7.4/0001-PR-rtl-opt=
imization-83030.patch
> >>>  create mode 100644 meta/recipes-devtools/gcc/gcc-7.4/0001-gcc-4.3.1-=
ARCH_FLAGS_FOR_TARGET.patch
> >>>  create mode 100644 meta/recipes-devtools/gcc/gcc-7.4/0008-c99-snprin=
tf.patch
> >>>  create mode 100644 meta/recipes-devtools/gcc/gcc-7.4/0009-gcc-poison=
-system-directories.patch
> >>>  create mode 100644 meta/recipes-devtools/gcc/gcc-7.4/0010-gcc-poison=
-dir-extend.patch
> >>>  create mode 100644 meta/recipes-devtools/gcc/gcc-7.4/0011-gcc-4.3.3-=
SYSROOT_CFLAGS_FOR_TARGET.patch
> >>>  create mode 100644 meta/recipes-devtools/gcc/gcc-7.4/0012-64-bit-mul=
tilib-hack.patch
> >>>  create mode 100644 meta/recipes-devtools/gcc/gcc-7.4/0013-optional-l=
ibstdc.patch
> >>>  create mode 100644 meta/recipes-devtools/gcc/gcc-7.4/0014-gcc-disabl=
e-MASK_RELAX_PIC_CALLS-bit.patch
> >>>  create mode 100644 meta/recipes-devtools/gcc/gcc-7.4/0015-COLLECT_GC=
C_OPTIONS.patch
> >>>  create mode 100644 meta/recipes-devtools/gcc/gcc-7.4/0016-Use-the-de=
faults.h-in-B-instead-of-S-and-t-oe-in-B.patch
> >>>  create mode 100644 meta/recipes-devtools/gcc/gcc-7.4/0017-fortran-cr=
oss-compile-hack.patch
> >>>  create mode 100644 meta/recipes-devtools/gcc/gcc-7.4/0018-cpp-honor-=
sysroot.patch
> >>>  create mode 100644 meta/recipes-devtools/gcc/gcc-7.4/0019-MIPS64-Def=
ault-to-N64-ABI.patch
> >>>  create mode 100644 meta/recipes-devtools/gcc/gcc-7.4/0020-Define-GLI=
BC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> >>>  create mode 100644 meta/recipes-devtools/gcc/gcc-7.4/0021-gcc-Fix-ar=
gument-list-too-long-error.patch
> >>>  create mode 100644 meta/recipes-devtools/gcc/gcc-7.4/0022-Disable-sd=
t.patch
> >>>  create mode 100644 meta/recipes-devtools/gcc/gcc-7.4/0023-libtool.pa=
tch
> >>>  create mode 100644 meta/recipes-devtools/gcc/gcc-7.4/0024-gcc-armv4-=
pass-fix-v4bx-to-linker-to-support-EABI.patch
> >>>  create mode 100644 meta/recipes-devtools/gcc/gcc-7.4/0025-Use-the-mu=
ltilib-config-files-from-B-instead-of-usin.patch
> >>>  create mode 100644 meta/recipes-devtools/gcc/gcc-7.4/0026-Avoid-usin=
g-libdir-from-.la-which-usually-points-to-.patch
> >>>  create mode 100644 meta/recipes-devtools/gcc/gcc-7.4/0027-export-CPP=
.patch
> >>>  create mode 100644 meta/recipes-devtools/gcc/gcc-7.4/0028-Enable-SPE=
-AltiVec-generation-on-powepc-linux-target.patch
> >>>  create mode 100644 meta/recipes-devtools/gcc/gcc-7.4/0029-Disable-th=
e-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
> >>>  create mode 100644 meta/recipes-devtools/gcc/gcc-7.4/0030-Ensure-tar=
get-gcc-headers-can-be-included.patch
> >>>  create mode 100644 meta/recipes-devtools/gcc/gcc-7.4/0031-gcc-4.8-wo=
n-t-build-with-disable-dependency-tracking.patch
> >>>  create mode 100644 meta/recipes-devtools/gcc/gcc-7.4/0032-Don-t-sear=
ch-host-directory-during-relink-if-inst_pr.patch
> >>>  create mode 100644 meta/recipes-devtools/gcc/gcc-7.4/0033-Use-SYSTEM=
LIBS_DIR-replacement-instead-of-hardcoding.patch
> >>>  create mode 100644 meta/recipes-devtools/gcc/gcc-7.4/0034-aarch64-Ad=
d-support-for-musl-ldso.patch
> >>>  create mode 100644 meta/recipes-devtools/gcc/gcc-7.4/0035-libcc1-fix=
-libcc1-s-install-path-and-rpath.patch
> >>>  create mode 100644 meta/recipes-devtools/gcc/gcc-7.4/0036-handle-sys=
root-support-for-nativesdk-gcc.patch
> >>>  create mode 100644 meta/recipes-devtools/gcc/gcc-7.4/0037-Search-tar=
get-sysroot-gcc-version-specific-dirs-with.patch
> >>>  create mode 100644 meta/recipes-devtools/gcc/gcc-7.4/0038-Fix-variou=
s-_FOR_BUILD-and-related-variables.patch
> >>>  create mode 100644 meta/recipes-devtools/gcc/gcc-7.4/0039-nios2-Defi=
ne-MUSL_DYNAMIC_LINKER.patch
> >>>  create mode 100644 meta/recipes-devtools/gcc/gcc-7.4/0040-Add-ssp_no=
nshared-to-link-commandline-for-musl-targe.patch
> >>>  create mode 100644 meta/recipes-devtools/gcc/gcc-7.4/0041-gcc-libcpp=
-support-ffile-prefix-map-old-new.patch
> >>>  create mode 100644 meta/recipes-devtools/gcc/gcc-7.4/0042-Reuse-fdeb=
ug-prefix-map-to-replace-ffile-prefix-map.patch
> >>>  create mode 100644 meta/recipes-devtools/gcc/gcc-7.4/0043-gcc-final.=
c-fdebug-prefix-map-support-to-remap-sourc.patch
> >>>  create mode 100644 meta/recipes-devtools/gcc/gcc-7.4/0044-libgcc-Add=
-knob-to-use-ldbl-128-on-ppc.patch
> >>>  create mode 100644 meta/recipes-devtools/gcc/gcc-7.4/0045-Link-libgc=
c-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
> >>>  create mode 100644 meta/recipes-devtools/gcc/gcc-7.4/0047-sync-gcc-s=
tddef.h-with-musl.patch
> >>>  create mode 100644 meta/recipes-devtools/gcc/gcc-7.4/0048-gcc-Enable=
-static-PIE.patch
> >>>  create mode 100644 meta/recipes-devtools/gcc/gcc-7.4/fix-segmentatio=
n-fault-precompiled-hdr.patch
> >>>  create mode 100644 meta/recipes-devtools/gcc/gcc-7.4/no-sse-fix-test=
-case-failures.patch
> >>>  delete mode 100644 meta/recipes-devtools/gcc/gcc-cross-canadian_7.3.=
bb
> >>>  create mode 100644 meta/recipes-devtools/gcc/gcc-cross-canadian_7.4.=
bb
> >>>  delete mode 100644 meta/recipes-devtools/gcc/gcc-cross-initial_7.3.b=
b
> >>>  create mode 100644 meta/recipes-devtools/gcc/gcc-cross-initial_7.4.b=
b
> >>>  delete mode 100644 meta/recipes-devtools/gcc/gcc-cross_7.3.bb
> >>>  create mode 100644 meta/recipes-devtools/gcc/gcc-cross_7.4.bb
> >>>  delete mode 100644 meta/recipes-devtools/gcc/gcc-crosssdk-initial_7.=
3.bb
> >>>  create mode 100644 meta/recipes-devtools/gcc/gcc-crosssdk-initial_7.=
4.bb
> >>>  delete mode 100644 meta/recipes-devtools/gcc/gcc-crosssdk_7.3.bb
> >>>  create mode 100644 meta/recipes-devtools/gcc/gcc-crosssdk_7.4.bb
> >>>  delete mode 100644 meta/recipes-devtools/gcc/gcc-runtime_7.3.bb
> >>>  create mode 100644 meta/recipes-devtools/gcc/gcc-runtime_7.4.bb
> >>>  delete mode 100644 meta/recipes-devtools/gcc/gcc-sanitizers_7.3.bb
> >>>  create mode 100644 meta/recipes-devtools/gcc/gcc-sanitizers_7.4.bb
> >>>  delete mode 100644 meta/recipes-devtools/gcc/gcc-source_7.3.bb
> >>>  create mode 100644 meta/recipes-devtools/gcc/gcc-source_7.4.bb
> >>>  delete mode 100644 meta/recipes-devtools/gcc/gcc_7.3.bb
> >>>  create mode 100644 meta/recipes-devtools/gcc/gcc_7.4.bb
> >>>  delete mode 100644 meta/recipes-devtools/gcc/libgcc-initial_7.3.bb
> >>>  create mode 100644 meta/recipes-devtools/gcc/libgcc-initial_7.4.bb
> >>>  delete mode 100644 meta/recipes-devtools/gcc/libgcc_7.3.bb
> >>>  create mode 100644 meta/recipes-devtools/gcc/libgcc_7.4.bb
> >>>  delete mode 100644 meta/recipes-devtools/gcc/libgfortran_7.3.bb
> >>>  create mode 100644 meta/recipes-devtools/gcc/libgfortran_7.4.bb
> >>>
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.3.inc b/meta/recipes-dev=
tools/gcc/gcc-7.3.inc
> >>> deleted file mode 100644
> >>> index d4aaca4..0000000
> >>> --- a/meta/recipes-devtools/gcc/gcc-7.3.inc
> >>> +++ /dev/null
> >>> @@ -1,132 +0,0 @@
> >>> -require gcc-common.inc
> >>> -
> >>> -# Third digit in PV should be incremented after a minor release
> >>> -
> >>> -PV =3D "7.3.0"
> >>> -
> >>> -# BINV should be incremented to a revision after a minor gcc release
> >>> -
> >>> -BINV =3D "7.3.0"
> >>> -
> >>> -FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/gcc-7.3:${FILE_DIRNAME}/gcc-7.=
3/backport:"
> >>> -
> >>> -DEPENDS =3D+ "mpfr gmp libmpc zlib flex-native"
> >>> -NATIVEDEPS =3D "mpfr-native gmp-native libmpc-native zlib-native fle=
x-native"
> >>> -
> >>> -LICENSE =3D "GPL-3.0-with-GCC-exception & GPLv3"
> >>> -
> >>> -LIC_FILES_CHKSUM =3D "\
> >>> -    file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6552 \
> >>> -    file://COPYING3;md5=3Dd32239bcb673463ab874e80d47fae504 \
> >>> -    file://COPYING3.LIB;md5=3D6a6a8e020838b23406c81b19c1d46df6 \
> >>> -    file://COPYING.LIB;md5=3D2d5025d4aa3495befef8f17206a5b0a1 \
> >>> -    file://COPYING.RUNTIME;md5=3Dfe60d87048567d4fe8c8a0ed2448bcc8 \
> >>> -"
> >>> -
> >>> -#RELEASE =3D "7-20170504"
> >>> -BASEURI ?=3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz"
> >>> -#SRCREV =3D "f7cf798b73fd1a07098f9a490deec1e2a36e0bed"
> >>> -#BASEURI ?=3D "git://github.com/gcc-mirror/gcc;branch=3Dgcc-6-branch=
;protocol=3Dgit"
> >>> -#BASEURI ?=3D "http://mirrors.concertpass.com/gcc/snapshots/${RELEAS=
E}/gcc-${RELEASE}.tar.bz2"
> >>> -
> >>> -SRC_URI =3D "\
> >>> -           ${BASEURI} \
> >>> -           file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
> >>> -           file://0008-c99-snprintf.patch \
> >>> -           file://0009-gcc-poison-system-directories.patch \
> >>> -           file://0010-gcc-poison-dir-extend.patch \
> >>> -           file://0011-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch \
> >>> -           file://0012-64-bit-multilib-hack.patch \
> >>> -           file://0013-optional-libstdc.patch \
> >>> -           file://0014-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch \
> >>> -           file://0015-COLLECT_GCC_OPTIONS.patch \
> >>> -           file://0016-Use-the-defaults.h-in-B-instead-of-S-and-t-oe=
-in-B.patch \
> >>> -           file://0017-fortran-cross-compile-hack.patch \
> >>> -           file://0018-cpp-honor-sysroot.patch \
> >>> -           file://0019-MIPS64-Default-to-N64-ABI.patch \
> >>> -           file://0020-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMI=
C_LINKE.patch \
> >>> -           file://0021-gcc-Fix-argument-list-too-long-error.patch \
> >>> -           file://0022-Disable-sdt.patch \
> >>> -           file://0023-libtool.patch \
> >>> -           file://0024-gcc-armv4-pass-fix-v4bx-to-linker-to-support-=
EABI.patch \
> >>> -           file://0025-Use-the-multilib-config-files-from-B-instead-=
of-usin.patch \
> >>> -           file://0026-Avoid-using-libdir-from-.la-which-usually-poi=
nts-to-.patch \
> >>> -           file://0027-export-CPP.patch \
> >>> -           file://0028-Enable-SPE-AltiVec-generation-on-powepc-linux=
-target.patch \
> >>> -           file://0029-Disable-the-MULTILIB_OSDIRNAMES-and-other-mul=
tilib-o.patch \
> >>> -           file://0030-Ensure-target-gcc-headers-can-be-included.pat=
ch \
> >>> -           file://0031-gcc-4.8-won-t-build-with-disable-dependency-t=
racking.patch \
> >>> -           file://0032-Don-t-search-host-directory-during-relink-if-=
inst_pr.patch \
> >>> -           file://0033-Use-SYSTEMLIBS_DIR-replacement-instead-of-har=
dcoding.patch \
> >>> -           file://0034-aarch64-Add-support-for-musl-ldso.patch \
> >>> -           file://0035-libcc1-fix-libcc1-s-install-path-and-rpath.pa=
tch \
> >>> -           file://0036-handle-sysroot-support-for-nativesdk-gcc.patc=
h \
> >>> -           file://0037-Search-target-sysroot-gcc-version-specific-di=
rs-with.patch \
> >>> -           file://0038-Fix-various-_FOR_BUILD-and-related-variables.=
patch \
> >>> -           file://0039-nios2-Define-MUSL_DYNAMIC_LINKER.patch \
> >>> -           file://0040-Add-ssp_nonshared-to-link-commandline-for-mus=
l-targe.patch \
> >>> -           file://0041-gcc-libcpp-support-ffile-prefix-map-old-new.p=
atch \
> >>> -           file://0042-Reuse-fdebug-prefix-map-to-replace-ffile-pref=
ix-map.patch \
> >>> -           file://0043-gcc-final.c-fdebug-prefix-map-support-to-rema=
p-sourc.patch \
> >>> -           file://0044-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch =
\
> >>> -           file://0045-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFL=
AGS.patch \
> >>> -           file://0047-sync-gcc-stddef.h-with-musl.patch \
> >>> -           file://0048-gcc-Enable-static-PIE.patch \
> >>> -           file://fix-segmentation-fault-precompiled-hdr.patch \
> >>> -           file://no-sse-fix-test-case-failures.patch \
> >>> -           ${BACKPORTS} \
> >>> -"
> >>> -BACKPORTS =3D "\
> >>> -           file://0001-Fix-internal-compiler-error-in-testcase.patch=
 \
> >>> -           file://0001-PR-rtl-optimization-83030.patch \
> >>> -           file://0001-Fix-ppc64le-build-Partial-backport-r256656.pa=
tch \
> >>> -           file://0001-PR-c-80290-memory-hog-with-std-pair.patch \
> >>> -"
> >>> -
> >>> -SRC_URI[md5sum] =3D "be2da21680f27624f3a87055c4ba5af2"
> >>> -SRC_URI[sha256sum] =3D "832ca6ae04636adbb430e865a1451adf6979ab44ca1c=
8374f61fba65645ce15c"
> >>> -
> >>> -S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
> >>> -#S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/git"
> >>> -B =3D "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
> >>> -
> >>> -# Language Overrides
> >>> -FORTRAN =3D ""
> >>> -JAVA =3D ""
> >>> -
> >>> -LTO =3D "--enable-lto"
> >>> -
> >>> -EXTRA_OECONF_BASE =3D "\
> >>> -    ${LTO} \
> >>> -    --enable-libssp \
> >>> -    --enable-libitm \
> >>> -    --disable-bootstrap \
> >>> -    --disable-libmudflap \
> >>> -    --with-system-zlib \
> >>> -    ${@'--with-linker-hash-style=3D${LINKER_HASH_STYLE}' if '${LINKE=
R_HASH_STYLE}' else ''} \
> >>> -    --enable-linker-build-id \
> >>> -    --with-ppl=3Dno \
> >>> -    --with-cloog=3Dno \
> >>> -    --enable-checking=3Drelease \
> >>> -    --enable-cheaders=3Dc_global \
> >>> -    --without-isl \
> >>> -"
> >>> -
> >>> -EXTRA_OECONF_INITIAL =3D "\
> >>> -    --disable-libmudflap \
> >>> -    --disable-libgomp \
> >>> -    --disable-libitm \
> >>> -    --disable-libquadmath \
> >>> -    --with-system-zlib \
> >>> -    --disable-lto \
> >>> -    --disable-plugin \
> >>> -    --enable-decimal-float=3Dno \
> >>> -    --without-isl \
> >>> -    gcc_cv_libc_provides_ssp=3Dyes \
> >>> -"
> >>> -
> >>> -EXTRA_OECONF_PATHS =3D "\
> >>> -    --with-gxx-include-dir=3D/not/exist{target_includedir}/c++/${BIN=
V} \
> >>> -    --with-sysroot=3D/not/exist \
> >>> -    --with-build-sysroot=3D${STAGING_DIR_TARGET} \
> >>> -"
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.3/0001-Fix-internal-comp=
iler-error-in-testcase.patch b/meta/recipes-devtools/gcc/gcc-7.3/0001-Fix-i=
nternal-compiler-error-in-testcase.patch
> >>> deleted file mode 100644
> >>> index 45cc0ee..0000000
> >>> --- a/meta/recipes-devtools/gcc/gcc-7.3/0001-Fix-internal-compiler-er=
ror-in-testcase.patch
> >>> +++ /dev/null
> >>> @@ -1,212 +0,0 @@
> >>> -From d3cdd96a300f9003a1cc242541605169aacdc811 Mon Sep 17 00:00:00 20=
01
> >>> -From: willschm <willschm@138bc75d-0d04-0410-961f-82ee72b054a4>
> >>> -Date: Mon, 25 Sep 2017 14:35:02 +0000
> >>> -Subject: [PATCH] [gcc]
> >>> -
> >>> -2017-09-25  Will Schmidt  <will_schmidt@vnet.ibm.com>
> >>> -
> >>> -       * config/rs6000/rs6000.c (rs6000_gimple_fold_builtin): Add ha=
ndling
> >>> -       for early folding of vector stores (ALTIVEC_BUILTIN_ST_*).
> >>> -       (rs6000_builtin_valid_without_lhs): New helper function.
> >>> -       * config/rs6000/rs6000-c.c (altivec_resolve_overloaded_builti=
n):
> >>> -       Remove obsoleted code for handling ALTIVEC_BUILTIN_VEC_ST.
> >>> -
> >>> -git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@253152 138bc75d-0d04=
-0410-961f-82ee72b054a4
> >>> -
> >>> -Fix internal compiler error for testcase gcc.dg/vmx/7d-02.c
> >>> -
> >>> -Upstream commit: d3cdd96a300f9003a1cc242541605169aacdc811
> >>> -
> >>> -Backport by Kaushik Phatak <Kaushik.Phatak@kpit.com>
> >>> -
> >>> -This patch removes changes to Changelog from the original upstream p=
atch.
> >>> -This will help us avoid conflicts.
> >>> -
> >>> -Upstream-Status: Backport
> >>> -
> >>> -Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> >>> ----
> >>> - gcc/ChangeLog                |  8 +++++
> >>> - gcc/config/rs6000/rs6000-c.c | 72 ---------------------------------=
----------
> >>> - gcc/config/rs6000/rs6000.c   | 73 +++++++++++++++++++++++++++++++++=
+++++++++--
> >>> - 3 files changed, 78 insertions(+), 75 deletions(-)
> >>> -
> >>> -diff --git a/gcc/config/rs6000/rs6000-c.c b/gcc/config/rs6000/rs6000=
-c.c
> >>> -index a49db97..4a363a1 100644
> >>> ---- a/gcc/config/rs6000/rs6000-c.c
> >>> -+++ b/gcc/config/rs6000/rs6000-c.c
> >>> -@@ -6279,70 +6279,6 @@ altivec_resolve_overloaded_builtin (loca
> >>> -       }
> >>> -     }
> >>> -
> >>> --  /* Similarly for stvx.  */
> >>> --  if (fcode =3D=3D ALTIVEC_BUILTIN_VEC_ST
> >>> --      && (BYTES_BIG_ENDIAN || !VECTOR_ELT_ORDER_BIG)
> >>> --      && nargs =3D=3D 3)
> >>> --    {
> >>> --      tree arg0 =3D (*arglist)[0];
> >>> --      tree arg1 =3D (*arglist)[1];
> >>> --      tree arg2 =3D (*arglist)[2];
> >>> --
> >>> --      /* Construct the masked address.  Let existing error handling=
 take
> >>> --       over if we don't have a constant offset.  */
> >>> --      arg1 =3D fold (arg1);
> >>> --
> >>> --      if (TREE_CODE (arg1) =3D=3D INTEGER_CST)
> >>> --      {
> >>> --        if (!ptrofftype_p (TREE_TYPE (arg1)))
> >>> --          arg1 =3D build1 (NOP_EXPR, sizetype, arg1);
> >>> --
> >>> --        tree arg2_type =3D TREE_TYPE (arg2);
> >>> --        if (TREE_CODE (arg2_type) =3D=3D ARRAY_TYPE && c_dialect_cx=
x ())
> >>> --          {
> >>> --            /* Force array-to-pointer decay for C++.  */
> >>> --            arg2 =3D default_conversion (arg2);
> >>> --            arg2_type =3D TREE_TYPE (arg2);
> >>> --          }
> >>> --
> >>> --        /* Find the built-in to make sure a compatible one exists; =
if not
> >>> --           we fall back to default handling to get the error messag=
e.  */
> >>> --        for (desc =3D altivec_overloaded_builtins;
> >>> --             desc->code && desc->code !=3D fcode; desc++)
> >>> --          continue;
> >>> --
> >>> --        for (; desc->code =3D=3D fcode; desc++)
> >>> --          if (rs6000_builtin_type_compatible (TREE_TYPE (arg0), des=
c->op1)
> >>> --              && rs6000_builtin_type_compatible (TREE_TYPE (arg1), =
desc->op2)
> >>> --              && rs6000_builtin_type_compatible (TREE_TYPE (arg2),
> >>> --                                                 desc->op3))
> >>> --            {
> >>> --              tree addr =3D fold_build2_loc (loc, POINTER_PLUS_EXPR=
, arg2_type,
> >>> --                                           arg2, arg1);
> >>> --              tree aligned
> >>> --                =3D fold_build2_loc (loc, BIT_AND_EXPR, arg2_type,
> >>> --                                   addr, build_int_cst (arg2_type, =
-16));
> >>> --
> >>> --              tree arg0_type =3D TREE_TYPE (arg0);
> >>> --              if (TYPE_MODE (arg0_type) =3D=3D V2DImode)
> >>> --                /* Type-based aliasing analysis thinks vector long
> >>> --                   and vector long long are different and will put =
them
> >>> --                   in distinct alias classes.  Force our address ty=
pe
> >>> --                   to be a may-alias type to avoid this.  */
> >>> --                arg0_type
> >>> --                  =3D build_pointer_type_for_mode (arg0_type, Pmode=
,
> >>> --                                                 true/*can_alias_al=
l*/);
> >>> --              else
> >>> --                arg0_type =3D build_pointer_type (arg0_type);
> >>> --              aligned =3D build1 (NOP_EXPR, arg0_type, aligned);
> >>> --              tree stg =3D build_indirect_ref (loc, aligned, RO_NUL=
L);
> >>> --              tree retval =3D build2 (MODIFY_EXPR, TREE_TYPE (stg),=
 stg,
> >>> --                                    convert (TREE_TYPE (stg), arg0)=
);
> >>> --              return retval;
> >>> --            }
> >>> --      }
> >>> --    }
> >>> --
> >>> -   for (n =3D 0;
> >>> -        !VOID_TYPE_P (TREE_VALUE (fnargs)) && n < nargs;
> >>> -        fnargs =3D TREE_CHAIN (fnargs), n++)
> >>> -diff --git a/gcc/config/rs6000/rs6000.c b/gcc/config/rs6000/rs6000.c
> >>> -index a49db97..4a363a1 100644
> >>> ---- a/gcc/config/rs6000/rs6000.c
> >>> -+++ b/gcc/config/rs6000/rs6000.c
> >>> -@@ -55,6 +55,7 @@
> >>> - #include "reload.h"
> >>> - #include "sched-int.h"
> >>> - #include "gimplify.h"
> >>> -+#include "gimple-fold.h"
> >>> - #include "gimple-iterator.h"
> >>> - #include "gimple-ssa.h"
> >>> - #include "gimple-walk.h"
> >>> -@@ -17089,6 +17090,25 @@ rs6000_fold_builtin (tree fndecl, int n_
> >>> - #endif
> >>> - }
> >>> -
> >>> -+/*  Helper function to sort out which built-ins may be valid withou=
t having
> >>> -+    a LHS.  */
> >>> -+bool
> >>> -+rs6000_builtin_valid_without_lhs (enum rs6000_builtins fn_code)
> >>> -+{
> >>> -+  switch (fn_code)
> >>> -+    {
> >>> -+    case ALTIVEC_BUILTIN_STVX_V16QI:
> >>> -+    case ALTIVEC_BUILTIN_STVX_V8HI:
> >>> -+    case ALTIVEC_BUILTIN_STVX_V4SI:
> >>> -+    case ALTIVEC_BUILTIN_STVX_V4SF:
> >>> -+    case ALTIVEC_BUILTIN_STVX_V2DI:
> >>> -+    case ALTIVEC_BUILTIN_STVX_V2DF:
> >>> -+      return true;
> >>> -+    default:
> >>> -+      return false;
> >>> -+    }
> >>> -+}
> >>> -+
> >>> - /* Fold a machine-dependent built-in in GIMPLE.  (For folding into
> >>> -    a constant, use rs6000_fold_builtin.)  */
> >>> -
> >>> -@@ -17102,6 +17122,10 @@ rs6000_gimple_fold_builtin (gimple_stmt_
> >>> -     =3D (enum rs6000_builtins) DECL_FUNCTION_CODE (fndecl);
> >>> -   tree arg0, arg1, lhs;
> >>> -
> >>> -+  /* Prevent gimple folding for code that does not have a LHS, unle=
ss it is
> >>> -+     allowed per the rs6000_builtin_valid_without_lhs helper functi=
on.  */
> >>> -+  if (!gimple_call_lhs (stmt) && !rs6000_builtin_valid_without_lhs =
(fn_code))
> >>> -+     return false;
> >>> -   switch (fn_code)
> >>> -     {
> >>> -     /* Flavors of vec_add.  We deliberately don't expand
> >>> -@@ -17169,6 +17193,54 @@ rs6000_gimple_fold_builtin (gimple_stmt_
> >>> -       gsi_replace (gsi, g, true);
> >>> -       return true;
> >>> -       }
> >>> -+    /* Vector stores.  */
> >>> -+    case ALTIVEC_BUILTIN_STVX_V16QI:
> >>> -+    case ALTIVEC_BUILTIN_STVX_V8HI:
> >>> -+    case ALTIVEC_BUILTIN_STVX_V4SI:
> >>> -+    case ALTIVEC_BUILTIN_STVX_V4SF:
> >>> -+    case ALTIVEC_BUILTIN_STVX_V2DI:
> >>> -+    case ALTIVEC_BUILTIN_STVX_V2DF:
> >>> -+      {
> >>> -+       /* Do not fold for -maltivec=3Dbe on LE targets.  */
> >>> -+       if (VECTOR_ELT_ORDER_BIG && !BYTES_BIG_ENDIAN)
> >>> -+          return false;
> >>> -+       arg0 =3D gimple_call_arg (stmt, 0); /* Value to be stored.  =
*/
> >>> -+       arg1 =3D gimple_call_arg (stmt, 1); /* Offset.  */
> >>> -+       tree arg2 =3D gimple_call_arg (stmt, 2); /* Store-to address=
.  */
> >>> -+       location_t loc =3D gimple_location (stmt);
> >>> -+       tree arg0_type =3D TREE_TYPE (arg0);
> >>> -+       /* Use ptr_type_node (no TBAA) for the arg2_type.
> >>> -+        FIXME: (Richard)  "A proper fix would be to transition this=
 type as
> >>> -+        seen from the frontend to GIMPLE, for example in a similar =
way we
> >>> -+        do for MEM_REFs by piggy-backing that on an extra argument,=
 a
> >>> -+        constant zero pointer of the alias pointer type to use (whi=
ch would
> >>> -+        also serve as a type indicator of the store itself).  I'd u=
se a
> >>> -+        target specific internal function for this (not sure if we =
can have
> >>> -+        those target specific, but I guess if it's folded away then=
 that's
> >>> -+        fine) and get away with the overload set."
> >>> -+        */
> >>> -+       tree arg2_type =3D ptr_type_node;
> >>> -+       /* POINTER_PLUS_EXPR wants the offset to be of type 'sizetyp=
e'.  Create
> >>> -+          the tree using the value from arg0.  The resulting type w=
ill match
> >>> -+          the type of arg2.  */
> >>> -+       gimple_seq stmts =3D NULL;
> >>> -+       tree temp_offset =3D gimple_convert (&stmts, loc, sizetype, =
arg1);
> >>> -+       tree temp_addr =3D gimple_build (&stmts, loc, POINTER_PLUS_E=
XPR,
> >>> -+                                     arg2_type, arg2, temp_offset);
> >>> -+       /* Mask off any lower bits from the address.  */
> >>> -+       tree aligned_addr =3D gimple_build (&stmts, loc, BIT_AND_EXP=
R,
> >>> -+                                        arg2_type, temp_addr,
> >>> -+                                        build_int_cst (arg2_type, -=
16));
> >>> -+       gsi_insert_seq_before (gsi, stmts, GSI_SAME_STMT);
> >>> -+      /* The desired gimple result should be similar to:
> >>> -+       MEM[(__vector floatD.1407 *)_1] =3D vf1D.2697;  */
> >>> -+       gimple *g;
> >>> -+       g =3D gimple_build_assign (build2 (MEM_REF, arg0_type, align=
ed_addr,
> >>> -+                                         build_int_cst (arg2_type, =
0)), arg0);
> >>> -+       gimple_set_location (g, loc);
> >>> -+       gsi_replace (gsi, g, true);
> >>> -+       return true;
> >>> -+      }
> >>> -
> >>> -     default:
> >>> -       break;
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.3/0001-Fix-ppc64le-build=
-Partial-backport-r256656.patch b/meta/recipes-devtools/gcc/gcc-7.3/0001-Fi=
x-ppc64le-build-Partial-backport-r256656.patch
> >>> deleted file mode 100644
> >>> index cfb70e1..0000000
> >>> --- a/meta/recipes-devtools/gcc/gcc-7.3/0001-Fix-ppc64le-build-Partia=
l-backport-r256656.patch
> >>> +++ /dev/null
> >>> @@ -1,37 +0,0 @@
> >>> -From aa65a43516da1d48011ef621ed5988289711d99b Mon Sep 17 00:00:00 20=
01
> >>> -From: marxin <marxin@138bc75d-0d04-0410-961f-82ee72b054a4>
> >>> -Date: Fri, 29 Jun 2018 09:31:30 +0000
> >>> -Subject: [PATCH] Partial backport r256656
> >>> -
> >>> -2018-06-29  Martin Liska  <mliska@suse.cz>
> >>> -
> >>> -       Backport from mainline
> >>> -       2018-01-10  Kelvin Nilsen  <kelvin@gcc.gnu.org>
> >>> -
> >>> -       * lex.c (search_line_fast): Remove illegal coercion of an
> >>> -       unaligned pointer value to vector pointer type and replace wi=
th
> >>> -       use of __builtin_vec_vsx_ld () built-in function, which opera=
tes
> >>> -       on unaligned pointer values.
> >>> -
> >>> -Upstream-Status: Backport
> >>> -Signed-off-by: Joel Stanley <joel@jms.id.au>
> >>> ----
> >>> - libcpp/lex.c  |  2 +-
> >>> - 1 files changed, 1 insertions(+), 1 deletion(-)
> >>> -
> >>> -diff --git a/libcpp/lex.c b/libcpp/lex.c
> >>> -index 097c78002cbb..e0fb9e822c44 100644
> >>> ---- a/libcpp/lex.c
> >>> -+++ b/libcpp/lex.c
> >>> -@@ -568,7 +568,7 @@ search_line_fast (const uchar *s, const uchar *e=
nd ATTRIBUTE_UNUSED)
> >>> -     {
> >>> -       vc m_nl, m_cr, m_bs, m_qm;
> >>> -
> >>> --      data =3D *((const vc *)s);
> >>> -+      data =3D __builtin_vec_vsx_ld (0, s);
> >>> -       s +=3D 16;
> >>> -
> >>> -       m_nl =3D (vc) __builtin_vec_cmpeq(data, repl_nl);
> >>> ---
> >>> -2.17.1
> >>> -
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.3/0001-PR-c-80290-memory=
-hog-with-std-pair.patch b/meta/recipes-devtools/gcc/gcc-7.3/0001-PR-c-8029=
0-memory-hog-with-std-pair.patch
> >>> deleted file mode 100644
> >>> index 603a29a..0000000
> >>> --- a/meta/recipes-devtools/gcc/gcc-7.3/0001-PR-c-80290-memory-hog-wi=
th-std-pair.patch
> >>> +++ /dev/null
> >>> @@ -1,58 +0,0 @@
> >>> -From 8c014bceeca6a558519e86b16a8142accc41e94f Mon Sep 17 00:00:00 20=
01
> >>> -From: jason <jason@138bc75d-0d04-0410-961f-82ee72b054a4>
> >>> -Date: Thu, 28 Jun 2018 00:25:21 +0000
> >>> -Subject: [PATCH]       PR c++/80290 - memory-hog with std::pair.
> >>> -
> >>> -       * pt.c (type_unification_real): Skip non-dependent conversion
> >>> -       check for a nested list argument.
> >>> -       (braced_init_depth): New.
> >>> -
> >>> -Upstream-Status: Backport
> >>> -Signed-off-by: Joel Stanley <joel@jms.id.au>
> >>> ----
> >>> - gcc/cp/pt.c      | 22 ++++++++++++++++++++++
> >>> - 1 file changed, 22 insertions(+)
> >>> -
> >>> -diff --git a/gcc/cp/pt.c b/gcc/cp/pt.c
> >>> -index 79cfd0129226..71077a3b0498 100644
> >>> ---- a/gcc/cp/pt.c
> >>> -+++ b/gcc/cp/pt.c
> >>> -@@ -19242,6 +19242,24 @@ try_array_deduction (tree tparms, tree targ=
s, tree parm)
> >>> -                         /*nondeduced*/false, array_deduction_r);
> >>> - }
> >>> -
> >>> -+/* Returns how many levels of { } INIT contains.  */
> >>> -+
> >>> -+static int
> >>> -+braced_init_depth (tree init)
> >>> -+{
> >>> -+  if (!init || !BRACE_ENCLOSED_INITIALIZER_P (init))
> >>> -+    return 0;
> >>> -+  unsigned i; tree val;
> >>> -+  unsigned max =3D 0;
> >>> -+  FOR_EACH_CONSTRUCTOR_VALUE (CONSTRUCTOR_ELTS (init), i, val)
> >>> -+    {
> >>> -+      unsigned elt_d =3D braced_init_depth (val);
> >>> -+      if (elt_d > max)
> >>> -+      max =3D elt_d;
> >>> -+    }
> >>> -+  return max + 1;
> >>> -+}
> >>> -+
> >>> - /* Most parms like fn_type_unification.
> >>> -
> >>> -    If SUBR is 1, we're being called recursively (to unify the
> >>> -@@ -19478,6 +19496,10 @@ type_unification_real (tree tparms,
> >>> -
> >>> -           if (uses_template_parms (parm))
> >>> -             continue;
> >>> -+          /* Workaround for c++/80290: avoid combinatorial explosio=
n on
> >>> -+             deeply nested braced init-lists.  */
> >>> -+          if (braced_init_depth (arg) > 2)
> >>> -+            continue;
> >>> -           if (check_non_deducible_conversion (parm, arg, strict, fl=
ags,
> >>> -                                               explain_p))
> >>> -             return 1;
> >>> ---
> >>> -2.17.1
> >>> -
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.3/0001-PR-rtl-optimizati=
on-83030.patch b/meta/recipes-devtools/gcc/gcc-7.3/0001-PR-rtl-optimization=
-83030.patch
> >>> deleted file mode 100644
> >>> index 71f7988..0000000
> >>> --- a/meta/recipes-devtools/gcc/gcc-7.3/0001-PR-rtl-optimization-8303=
0.patch
> >>> +++ /dev/null
> >>> @@ -1,272 +0,0 @@
> >>> -From f5c4a9440f15ccf6775659910a2014a5494ee86e Mon Sep 17 00:00:00 20=
01
> >>> -From: ebotcazou <ebotcazou@138bc75d-0d04-0410-961f-82ee72b054a4>
> >>> -Date: Wed, 22 Nov 2017 21:43:22 +0000
> >>> -Subject: [PATCH]       PR rtl-optimization/83030       * doc/rtl.tex=
i (Flags
> >>> - in an RTL Expression): Alphabetize, add entry         for CROSSING_=
JUMP_P and
> >>> - mention usage of 'jump' for JUMP_INSNs.       (Insns): Delete entry=
 for
> >>> - REG_CROSSING_JUMP in register notes.  * bb-reorder.c
> >>> - (update_crossing_jump_flags): Do not test whether the         CROSS=
ING_JUMP_P flag
> >>> - is already set before setting it.     * cfgrtl.c (fixup_partition_c=
rossing):
> >>> - Likewise.     * reorg.c (relax_delay_slots): Do not consider a
> >>> - CROSSING_JUMP_P insn  as useless.
> >>> -
> >>> -git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@255083 138bc75d-0d04=
-0410-961f-82ee72b054a4
> >>> -
> >>> -Upstream-Status: Backport
> >>> -
> >>> -This patch removes changes to Changelog from the original upstream p=
atch.
> >>> -This will help us avoid conflicts.
> >>> -
> >>> -Original backport to GCC 7.x by Amruta Pawar <Amruta.Pawar@kpit.com>
> >>> -
> >>> -Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> >>> -
> >>> ----
> >>> - gcc/bb-reorder.c |   5 +--
> >>> - gcc/cfgrtl.c     |   3 +-
> >>> - gcc/doc/rtl.texi | 129 ++++++++++++++++++++++++++++----------------=
-----------
> >>> - gcc/reorg.c      |   7 +--
> >>> - 5 files changed, 84 insertions(+), 72 deletions(-)
> >>> -
> >>> -diff --git a/gcc/bb-reorder.c b/gcc/bb-reorder.c
> >>> -index 55e6dc6..794283c 100644
> >>> ---- a/gcc/bb-reorder.c
> >>> -+++ b/gcc/bb-reorder.c
> >>> -@@ -2236,10 +2236,7 @@ update_crossing_jump_flags (void)
> >>> -     FOR_EACH_EDGE (e, ei, bb->succs)
> >>> -       if (e->flags & EDGE_CROSSING)
> >>> -       {
> >>> --        if (JUMP_P (BB_END (bb))
> >>> --            /* Some flags were added during fix_up_fall_thru_edges,=
 via
> >>> --               force_nonfallthru_and_redirect.  */
> >>> --            && !CROSSING_JUMP_P (BB_END (bb)))
> >>> -+        if (JUMP_P (BB_END (bb)))
> >>> -           CROSSING_JUMP_P (BB_END (bb)) =3D 1;
> >>> -         break;
> >>> -       }
> >>> -diff --git a/gcc/cfgrtl.c b/gcc/cfgrtl.c
> >>> -index d6e5ac0..a2ad075 100644
> >>> ---- a/gcc/cfgrtl.c
> >>> -+++ b/gcc/cfgrtl.c
> >>> -@@ -1334,8 +1334,7 @@ fixup_partition_crossing (edge e)
> >>> -   if (BB_PARTITION (e->src) !=3D BB_PARTITION (e->dest))
> >>> -     {
> >>> -       e->flags |=3D EDGE_CROSSING;
> >>> --      if (JUMP_P (BB_END (e->src))
> >>> --        && !CROSSING_JUMP_P (BB_END (e->src)))
> >>> -+      if (JUMP_P (BB_END (e->src)))
> >>> -       CROSSING_JUMP_P (BB_END (e->src)) =3D 1;
> >>> -     }
> >>> -   else if (BB_PARTITION (e->src) =3D=3D BB_PARTITION (e->dest))
> >>> -diff --git a/gcc/doc/rtl.texi b/gcc/doc/rtl.texi
> >>> -index 21524f5..a58eedc 100644
> >>> ---- a/gcc/doc/rtl.texi
> >>> -+++ b/gcc/doc/rtl.texi
> >>> -@@ -565,6 +565,16 @@ that are used in certain types of expression.  =
Most often they
> >>> - are accessed with the following macros, which expand into lvalues.
> >>> -
> >>> - @table @code
> >>> -+@findex CROSSING_JUMP_P
> >>> -+@cindex @code{jump_insn} and @samp{/j}
> >>> -+@item CROSSING_JUMP_P (@var{x})
> >>> -+Nonzero in a @code{jump_insn} if it crosses between hot and cold se=
ctions,
> >>> -+which could potentially be very far apart in the executable.  The p=
resence
> >>> -+of this flag indicates to other optimizations that this branching i=
nstruction
> >>> -+should not be ``collapsed'' into a simpler branching construct.  It=
 is used
> >>> -+when the optimization to partition basic blocks into hot and cold s=
ections
> >>> -+is turned on.
> >>> -+
> >>> - @findex CONSTANT_POOL_ADDRESS_P
> >>> - @cindex @code{symbol_ref} and @samp{/u}
> >>> - @cindex @code{unchanging}, in @code{symbol_ref}
> >>> -@@ -577,37 +587,6 @@ In either case GCC assumes these addresses can =
be addressed directly,
> >>> - perhaps with the help of base registers.
> >>> - Stored in the @code{unchanging} field and printed as @samp{/u}.
> >>> -
> >>> --@findex RTL_CONST_CALL_P
> >>> --@cindex @code{call_insn} and @samp{/u}
> >>> --@cindex @code{unchanging}, in @code{call_insn}
> >>> --@item RTL_CONST_CALL_P (@var{x})
> >>> --In a @code{call_insn} indicates that the insn represents a call to =
a
> >>> --const function.  Stored in the @code{unchanging} field and printed =
as
> >>> --@samp{/u}.
> >>> --
> >>> --@findex RTL_PURE_CALL_P
> >>> --@cindex @code{call_insn} and @samp{/i}
> >>> --@cindex @code{return_val}, in @code{call_insn}
> >>> --@item RTL_PURE_CALL_P (@var{x})
> >>> --In a @code{call_insn} indicates that the insn represents a call to =
a
> >>> --pure function.  Stored in the @code{return_val} field and printed a=
s
> >>> --@samp{/i}.
> >>> --
> >>> --@findex RTL_CONST_OR_PURE_CALL_P
> >>> --@cindex @code{call_insn} and @samp{/u} or @samp{/i}
> >>> --@item RTL_CONST_OR_PURE_CALL_P (@var{x})
> >>> --In a @code{call_insn}, true if @code{RTL_CONST_CALL_P} or
> >>> --@code{RTL_PURE_CALL_P} is true.
> >>> --
> >>> --@findex RTL_LOOPING_CONST_OR_PURE_CALL_P
> >>> --@cindex @code{call_insn} and @samp{/c}
> >>> --@cindex @code{call}, in @code{call_insn}
> >>> --@item RTL_LOOPING_CONST_OR_PURE_CALL_P (@var{x})
> >>> --In a @code{call_insn} indicates that the insn represents a possibly
> >>> --infinite looping call to a const or pure function.  Stored in the
> >>> --@code{call} field and printed as @samp{/c}.  Only true if one of
> >>> --@code{RTL_CONST_CALL_P} or @code{RTL_PURE_CALL_P} is true.
> >>> --
> >>> - @findex INSN_ANNULLED_BRANCH_P
> >>> - @cindex @code{jump_insn} and @samp{/u}
> >>> - @cindex @code{call_insn} and @samp{/u}
> >>> -@@ -702,6 +681,29 @@ Stored in the @code{call} field and printed as =
@samp{/c}.
> >>> - Nonzero in a @code{mem} if the memory reference holds a pointer.
> >>> - Stored in the @code{frame_related} field and printed as @samp{/f}.
> >>> -
> >>> -+@findex MEM_READONLY_P
> >>> -+@cindex @code{mem} and @samp{/u}
> >>> -+@cindex @code{unchanging}, in @code{mem}
> >>> -+@item MEM_READONLY_P (@var{x})
> >>> -+Nonzero in a @code{mem}, if the memory is statically allocated and =
read-only.
> >>> -+
> >>> -+Read-only in this context means never modified during the lifetime =
of the
> >>> -+program, not necessarily in ROM or in write-disabled pages.  A comm=
on
> >>> -+example of the later is a shared library's global offset table.  Th=
is
> >>> -+table is initialized by the runtime loader, so the memory is techni=
cally
> >>> -+writable, but after control is transferred from the runtime loader =
to the
> >>> -+application, this memory will never be subsequently modified.
> >>> -+
> >>> -+Stored in the @code{unchanging} field and printed as @samp{/u}.
> >>> -+
> >>> -+@findex PREFETCH_SCHEDULE_BARRIER_P
> >>> -+@cindex @code{prefetch} and @samp{/v}
> >>> -+@cindex @code{volatile}, in @code{prefetch}
> >>> -+@item PREFETCH_SCHEDULE_BARRIER_P (@var{x})
> >>> -+In a @code{prefetch}, indicates that the prefetch is a scheduling b=
arrier.
> >>> -+No other INSNs will be moved over it.
> >>> -+Stored in the @code{volatil} field and printed as @samp{/v}.
> >>> -+
> >>> - @findex REG_FUNCTION_VALUE_P
> >>> - @cindex @code{reg} and @samp{/i}
> >>> - @cindex @code{return_val}, in @code{reg}
> >>> -@@ -731,6 +733,37 @@ The same hard register may be used also for col=
lecting the values of
> >>> - functions called by this one, but @code{REG_FUNCTION_VALUE_P} is ze=
ro
> >>> - in this kind of use.
> >>> -
> >>> -+@findex RTL_CONST_CALL_P
> >>> -+@cindex @code{call_insn} and @samp{/u}
> >>> -+@cindex @code{unchanging}, in @code{call_insn}
> >>> -+@item RTL_CONST_CALL_P (@var{x})
> >>> -+In a @code{call_insn} indicates that the insn represents a call to =
a
> >>> -+const function.  Stored in the @code{unchanging} field and printed =
as
> >>> -+@samp{/u}.
> >>> -+
> >>> -+@findex RTL_PURE_CALL_P
> >>> -+@cindex @code{call_insn} and @samp{/i}
> >>> -+@cindex @code{return_val}, in @code{call_insn}
> >>> -+@item RTL_PURE_CALL_P (@var{x})
> >>> -+In a @code{call_insn} indicates that the insn represents a call to =
a
> >>> -+pure function.  Stored in the @code{return_val} field and printed a=
s
> >>> -+@samp{/i}.
> >>> -+
> >>> -+@findex RTL_CONST_OR_PURE_CALL_P
> >>> -+@cindex @code{call_insn} and @samp{/u} or @samp{/i}
> >>> -+@item RTL_CONST_OR_PURE_CALL_P (@var{x})
> >>> -+In a @code{call_insn}, true if @code{RTL_CONST_CALL_P} or
> >>> -+@code{RTL_PURE_CALL_P} is true.
> >>> -+
> >>> -+@findex RTL_LOOPING_CONST_OR_PURE_CALL_P
> >>> -+@cindex @code{call_insn} and @samp{/c}
> >>> -+@cindex @code{call}, in @code{call_insn}
> >>> -+@item RTL_LOOPING_CONST_OR_PURE_CALL_P (@var{x})
> >>> -+In a @code{call_insn} indicates that the insn represents a possibly
> >>> -+infinite looping call to a const or pure function.  Stored in the
> >>> -+@code{call} field and printed as @samp{/c}.  Only true if one of
> >>> -+@code{RTL_CONST_CALL_P} or @code{RTL_PURE_CALL_P} is true.
> >>> -+
> >>> - @findex RTX_FRAME_RELATED_P
> >>> - @cindex @code{insn} and @samp{/f}
> >>> - @cindex @code{call_insn} and @samp{/f}
> >>> -@@ -765,21 +798,6 @@ computation performed by this instruction, i.e.=
, one that
> >>> - This flag is required for exception handling support on targets wit=
h RTL
> >>> - prologues.
> >>> -
> >>> --@findex MEM_READONLY_P
> >>> --@cindex @code{mem} and @samp{/u}
> >>> --@cindex @code{unchanging}, in @code{mem}
> >>> --@item MEM_READONLY_P (@var{x})
> >>> --Nonzero in a @code{mem}, if the memory is statically allocated and =
read-only.
> >>> --
> >>> --Read-only in this context means never modified during the lifetime =
of the
> >>> --program, not necessarily in ROM or in write-disabled pages.  A comm=
on
> >>> --example of the later is a shared library's global offset table.  Th=
is
> >>> --table is initialized by the runtime loader, so the memory is techni=
cally
> >>> --writable, but after control is transferred from the runtime loader =
to the
> >>> --application, this memory will never be subsequently modified.
> >>> --
> >>> --Stored in the @code{unchanging} field and printed as @samp{/u}.
> >>> --
> >>> - @findex SCHED_GROUP_P
> >>> - @cindex @code{insn} and @samp{/s}
> >>> - @cindex @code{call_insn} and @samp{/s}
> >>> -@@ -879,14 +897,6 @@ Stored in the @code{volatil} field and printed =
as @samp{/v}.
> >>> - Most uses of @code{SYMBOL_REF_FLAG} are historic and may be subsume=
d
> >>> - by @code{SYMBOL_REF_FLAGS}.  Certainly use of @code{SYMBOL_REF_FLAG=
S}
> >>> - is mandatory if the target requires more than one bit of storage.
> >>> --
> >>> --@findex PREFETCH_SCHEDULE_BARRIER_P
> >>> --@cindex @code{prefetch} and @samp{/v}
> >>> --@cindex @code{volatile}, in @code{prefetch}
> >>> --@item PREFETCH_SCHEDULE_BARRIER_P (@var{x})
> >>> --In a @code{prefetch}, indicates that the prefetch is a scheduling b=
arrier.
> >>> --No other INSNs will be moved over it.
> >>> --Stored in the @code{volatil} field and printed as @samp{/v}.
> >>> - @end table
> >>> -
> >>> - These are the fields to which the above macros refer:
> >>> -@@ -974,6 +985,8 @@ In a @code{set}, 1 means it is for a return.
> >>> -
> >>> - In a @code{call_insn}, 1 means it is a sibling call.
> >>> -
> >>> -+In a @code{jump_insn}, 1 means it is a crossing jump.
> >>> -+
> >>> - In an RTL dump, this flag is represented as @samp{/j}.
> >>> -
> >>> - @findex unchanging
> >>> -@@ -3887,16 +3900,6 @@ multiple targets; the last label in the insn =
(in the highest numbered
> >>> - insn-field) goes into the @code{JUMP_LABEL} field and does not have=
 a
> >>> - @code{REG_LABEL_TARGET} note.  @xref{Insns, JUMP_LABEL}.
> >>> -
> >>> --@findex REG_CROSSING_JUMP
> >>> --@item REG_CROSSING_JUMP
> >>> --This insn is a branching instruction (either an unconditional jump =
or
> >>> --an indirect jump) which crosses between hot and cold sections, whic=
h
> >>> --could potentially be very far apart in the executable.  The presenc=
e
> >>> --of this note indicates to other optimizations that this branching
> >>> --instruction should not be ``collapsed'' into a simpler branching
> >>> --construct.  It is used when the optimization to partition basic blo=
cks
> >>> --into hot and cold sections is turned on.
> >>> --
> >>> - @findex REG_SETJMP
> >>> - @item REG_SETJMP
> >>> - Appears attached to each @code{CALL_INSN} to @code{setjmp} or a
> >>> -diff --git a/gcc/reorg.c b/gcc/reorg.c
> >>> -index 5914af6..77f3fe7 100644
> >>> ---- a/gcc/reorg.c
> >>> -+++ b/gcc/reorg.c
> >>> -@@ -3360,10 +3360,11 @@ relax_delay_slots (rtx_insn *first)
> >>> -       }
> >>> -
> >>> -       /* See if we have a simple (conditional) jump that is useless=
.  */
> >>> --      if (! INSN_ANNULLED_BRANCH_P (delay_jump_insn)
> >>> --        && ! condjump_in_parallel_p (delay_jump_insn)
> >>> -+      if (!CROSSING_JUMP_P (delay_jump_insn)
> >>> -+        && !INSN_ANNULLED_BRANCH_P (delay_jump_insn)
> >>> -+        && !condjump_in_parallel_p (delay_jump_insn)
> >>> -         && prev_active_insn (as_a<rtx_insn *> (target_label)) =3D=
=3D insn
> >>> --        && ! BARRIER_P (prev_nonnote_insn (as_a<rtx_insn *> (target=
_label)))
> >>> -+        && !BARRIER_P (prev_nonnote_insn (as_a<rtx_insn *> (target_=
label)))
> >>> -         /* If the last insn in the delay slot sets CC0 for some ins=
n,
> >>> -            various code assumes that it is in a delay slot.  We cou=
ld
> >>> -            put it back where it belonged and delete the register no=
tes,
> >>> ---
> >>> -1.8.5.6
> >>> -
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.3/0001-gcc-4.3.1-ARCH_FL=
AGS_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc-7.3/0001-gcc-4.3.1-ARC=
H_FLAGS_FOR_TARGET.patch
> >>> deleted file mode 100644
> >>> index 1af1c74..0000000
> >>> --- a/meta/recipes-devtools/gcc/gcc-7.3/0001-gcc-4.3.1-ARCH_FLAGS_FOR=
_TARGET.patch
> >>> +++ /dev/null
> >>> @@ -1,42 +0,0 @@
> >>> -From 2fcf1e23ef4b2a5c93526f12212aa892595261f6 Mon Sep 17 00:00:00 20=
01
> >>> -From: Khem Raj <raj.khem@gmail.com>
> >>> -Date: Fri, 29 Mar 2013 08:37:11 +0400
> >>> -Subject: [PATCH 01/47] gcc-4.3.1: ARCH_FLAGS_FOR_TARGET
> >>> -
> >>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> -
> >>> -Upstream-Status: Inappropriate [embedded specific]
> >>> ----
> >>> - configure    | 2 +-
> >>> - configure.ac | 2 +-
> >>> - 2 files changed, 2 insertions(+), 2 deletions(-)
> >>> -
> >>> -diff --git a/configure b/configure
> >>> -index 32a38633ad8..b4760952085 100755
> >>> ---- a/configure
> >>> -+++ b/configure
> >>> -@@ -7472,7 +7472,7 @@ fi
> >>> - # for target_alias and gcc doesn't manage it consistently.
> >>> - target_configargs=3D"--cache-file=3D./config.cache ${target_configa=
rgs}"
> >>> -
> >>> --FLAGS_FOR_TARGET=3D
> >>> -+FLAGS_FOR_TARGET=3D"$ARCH_FLAGS_FOR_TARGET"
> >>> - case " $target_configdirs " in
> >>> -  *" newlib "*)
> >>> -   case " $target_configargs " in
> >>> -diff --git a/configure.ac b/configure.ac
> >>> -index 12377499295..176ebb921ed 100644
> >>> ---- a/configure.ac
> >>> -+++ b/configure.ac
> >>> -@@ -3065,7 +3065,7 @@ fi
> >>> - # for target_alias and gcc doesn't manage it consistently.
> >>> - target_configargs=3D"--cache-file=3D./config.cache ${target_configa=
rgs}"
> >>> -
> >>> --FLAGS_FOR_TARGET=3D
> >>> -+FLAGS_FOR_TARGET=3D"$ARCH_FLAGS_FOR_TARGET"
> >>> - case " $target_configdirs " in
> >>> -  *" newlib "*)
> >>> -   case " $target_configargs " in
> >>> ---
> >>> -2.12.2
> >>> -
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.3/0008-c99-snprintf.patc=
h b/meta/recipes-devtools/gcc/gcc-7.3/0008-c99-snprintf.patch
> >>> deleted file mode 100644
> >>> index ebd562b..0000000
> >>> --- a/meta/recipes-devtools/gcc/gcc-7.3/0008-c99-snprintf.patch
> >>> +++ /dev/null
> >>> @@ -1,28 +0,0 @@
> >>> -From 732f10eead61830a8aee1bf38cce892da25c35b1 Mon Sep 17 00:00:00 20=
01
> >>> -From: Khem Raj <raj.khem@gmail.com>
> >>> -Date: Fri, 29 Mar 2013 08:49:03 +0400
> >>> -Subject: [PATCH 08/47] c99-snprintf
> >>> -
> >>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> -
> >>> -Upstream-Status: Pending
> >>> ----
> >>> - libstdc++-v3/include/c_std/cstdio | 2 +-
> >>> - 1 file changed, 1 insertion(+), 1 deletion(-)
> >>> -
> >>> -diff --git a/libstdc++-v3/include/c_std/cstdio b/libstdc++-v3/includ=
e/c_std/cstdio
> >>> -index 43969892aa2..12148457909 100644
> >>> ---- a/libstdc++-v3/include/c_std/cstdio
> >>> -+++ b/libstdc++-v3/include/c_std/cstdio
> >>> -@@ -144,7 +144,7 @@ namespace std
> >>> -   using ::vsprintf;
> >>> - } // namespace std
> >>> -
> >>> --#if _GLIBCXX_USE_C99_STDIO
> >>> -+#if _GLIBCXX_USE_C99_STDIO || defined(__UCLIBC__)
> >>> -
> >>> - #undef snprintf
> >>> - #undef vfscanf
> >>> ---
> >>> -2.12.2
> >>> -
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.3/0009-gcc-poison-system=
-directories.patch b/meta/recipes-devtools/gcc/gcc-7.3/0009-gcc-poison-syst=
em-directories.patch
> >>> deleted file mode 100644
> >>> index fe13ed6..0000000
> >>> --- a/meta/recipes-devtools/gcc/gcc-7.3/0009-gcc-poison-system-direct=
ories.patch
> >>> +++ /dev/null
> >>> @@ -1,192 +0,0 @@
> >>> -From 4791a0a0f4595d0a18974f4e85a759a0789943db Mon Sep 17 00:00:00 20=
01
> >>> -From: Khem Raj <raj.khem@gmail.com>
> >>> -Date: Fri, 29 Mar 2013 08:59:00 +0400
> >>> -Subject: [PATCH 09/47] gcc: poison-system-directories
> >>> -
> >>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> -
> >>> -Upstream-Status: Inappropriate [distribution: codesourcery]
> >>> ----
> >>> - gcc/common.opt      |  4 ++++
> >>> - gcc/config.in       |  6 ++++++
> >>> - gcc/configure       | 16 ++++++++++++++++
> >>> - gcc/configure.ac    | 10 ++++++++++
> >>> - gcc/doc/invoke.texi |  9 +++++++++
> >>> - gcc/gcc.c           |  2 ++
> >>> - gcc/incpath.c       | 19 +++++++++++++++++++
> >>> - 7 files changed, 66 insertions(+)
> >>> -
> >>> -diff --git a/gcc/common.opt b/gcc/common.opt
> >>> -index a5c3aeaa336..f02fe66367e 100644
> >>> ---- a/gcc/common.opt
> >>> -+++ b/gcc/common.opt
> >>> -@@ -662,6 +662,10 @@ Wreturn-local-addr
> >>> - Common Var(warn_return_local_addr) Init(1) Warning
> >>> - Warn about returning a pointer/reference to a local or temporary va=
riable.
> >>> -
> >>> -+Wpoison-system-directories
> >>> -+Common Var(flag_poison_system_directories) Init(1) Warning
> >>> -+Warn for -I and -L options using system directories if cross compil=
ing
> >>> -+
> >>> - Wshadow
> >>> - Common Var(warn_shadow) Warning
> >>> - Warn when one variable shadows another.  Same as -Wshadow=3Dglobal.
> >>> -diff --git a/gcc/config.in b/gcc/config.in
> >>> -index bf2aa7b2e7d..b1203987e15 100644
> >>> ---- a/gcc/config.in
> >>> -+++ b/gcc/config.in
> >>> -@@ -194,6 +194,12 @@
> >>> - #endif
> >>> -
> >>> -
> >>> -+/* Define to warn for use of native system header directories */
> >>> -+#ifndef USED_FOR_TARGET
> >>> -+#undef ENABLE_POISON_SYSTEM_DIRECTORIES
> >>> -+#endif
> >>> -+
> >>> -+
> >>> - /* Define if you want all operations on RTL (the basic data structu=
re of the
> >>> -    optimizer and back end) to be checked for dynamic type safety at=
 runtime.
> >>> -    This is quite expensive. */
> >>> -diff --git a/gcc/configure b/gcc/configure
> >>> -index c823ffe6290..4898f04fa6b 100755
> >>> ---- a/gcc/configure
> >>> -+++ b/gcc/configure
> >>> -@@ -949,6 +949,7 @@ with_system_zlib
> >>> - enable_maintainer_mode
> >>> - enable_link_mutex
> >>> - enable_version_specific_runtime_libs
> >>> -+enable_poison_system_directories
> >>> - enable_plugin
> >>> - enable_host_shared
> >>> - enable_libquadmath_support
> >>> -@@ -1691,6 +1692,8 @@ Optional Features:
> >>> -   --enable-version-specific-runtime-libs
> >>> -                           specify that runtime libraries should be =
installed
> >>> -                           in a compiler-specific directory
> >>> -+  --enable-poison-system-directories
> >>> -+                          warn for use of native system header dire=
ctories
> >>> -   --enable-plugin         enable plugin support
> >>> -   --enable-host-shared    build host code as shared libraries
> >>> -   --disable-libquadmath-support
> >>> -@@ -29347,6 +29350,19 @@ if test "${enable_version_specific_runtime_=
libs+set}" =3D set; then :
> >>> - fi
> >>> -
> >>> -
> >>> -+# Check whether --enable-poison-system-directories was given.
> >>> -+if test "${enable_poison_system_directories+set}" =3D set; then :
> >>> -+  enableval=3D$enable_poison_system_directories;
> >>> -+else
> >>> -+  enable_poison_system_directories=3Dno
> >>> -+fi
> >>> -+
> >>> -+if test "x${enable_poison_system_directories}" =3D "xyes"; then
> >>> -+
> >>> -+$as_echo "#define ENABLE_POISON_SYSTEM_DIRECTORIES 1" >>confdefs.h
> >>> -+
> >>> -+fi
> >>> -+
> >>> - # Substitute configuration variables
> >>> -
> >>> -
> >>> -diff --git a/gcc/configure.ac b/gcc/configure.ac
> >>> -index acfe9797389..9dc1dc7fc96 100644
> >>> ---- a/gcc/configure.ac
> >>> -+++ b/gcc/configure.ac
> >>> -@@ -6101,6 +6101,16 @@ AC_ARG_ENABLE(version-specific-runtime-libs,
> >>> -                 [specify that runtime libraries should be
> >>> -                  installed in a compiler-specific directory])])
> >>> -
> >>> -+AC_ARG_ENABLE([poison-system-directories],
> >>> -+             AS_HELP_STRING([--enable-poison-system-directories],
> >>> -+                            [warn for use of native system header d=
irectories]),,
> >>> -+             [enable_poison_system_directories=3Dno])
> >>> -+if test "x${enable_poison_system_directories}" =3D "xyes"; then
> >>> -+  AC_DEFINE([ENABLE_POISON_SYSTEM_DIRECTORIES],
> >>> -+           [1],
> >>> -+           [Define to warn for use of native system header director=
ies])
> >>> -+fi
> >>> -+
> >>> - # Substitute configuration variables
> >>> - AC_SUBST(subdirs)
> >>> - AC_SUBST(srcdir)
> >>> -diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
> >>> -index 68a558e9992..060cd7169c6 100644
> >>> ---- a/gcc/doc/invoke.texi
> >>> -+++ b/gcc/doc/invoke.texi
> >>> -@@ -298,6 +298,7 @@ Objective-C and Objective-C++ Dialects}.
> >>> - -Wpacked  -Wpacked-bitfield-compat  -Wpadded @gol
> >>> - -Wparentheses  -Wno-pedantic-ms-format @gol
> >>> - -Wplacement-new  -Wplacement-new=3D@var{n} @gol
> >>> -+-Wno-poison-system-directories @gol
> >>> - -Wpointer-arith  -Wpointer-compare  -Wno-pointer-to-int-cast @gol
> >>> - -Wno-pragmas  -Wredundant-decls  -Wrestrict  -Wno-return-local-addr=
 @gol
> >>> - -Wreturn-type  -Wsequence-point  -Wshadow  -Wno-shadow-ivar @gol
> >>> -@@ -5395,6 +5396,14 @@ made up of data only and thus requires no spe=
cial treatment.  But, for
> >>> - most targets, it is made up of code and thus requires the stack to =
be
> >>> - made executable in order for the program to work properly.
> >>> -
> >>> -+@item -Wno-poison-system-directories
> >>> -+@opindex Wno-poison-system-directories
> >>> -+Do not warn for @option{-I} or @option{-L} options using system
> >>> -+directories such as @file{/usr/include} when cross compiling.  This
> >>> -+option is intended for use in chroot environments when such
> >>> -+directories contain the correct headers and libraries for the targe=
t
> >>> -+system rather than the host.
> >>> -+
> >>> - @item -Wfloat-equal
> >>> - @opindex Wfloat-equal
> >>> - @opindex Wno-float-equal
> >>> -diff --git a/gcc/gcc.c b/gcc/gcc.c
> >>> -index c48178f..f63d53d 100644
> >>> ---- a/gcc/gcc.c
> >>> -+++ b/gcc/gcc.c
> >>> -@@ -1029,6 +1029,8 @@ proper position among the other output files. =
 */
> >>> -    "%{fuse-ld=3D*:-fuse-ld=3D%*} " LINK_COMPRESS_DEBUG_SPEC \
> >>> -    "%X %{o*} %{e*} %{N} %{n} %{r}\
> >>> -     %{s} %{t} %{u*} %{z} %{Z} %{!nostdlib:%{!nostartfiles:%S}} \
> >>> -+    %{Wno-poison-system-directories:--no-poison-system-directories}=
 \
> >>> -+    %{Werror=3Dpoison-system-directories:--error-poison-system-dire=
ctories} \
> >>> -     %{static|no-pie:} %{L*} %(mfwrap) %(link_libgcc) " \
> >>> -     VTABLE_VERIFICATION_SPEC " " SANITIZER_EARLY_SPEC " %o " CHKP_S=
PEC " \
> >>> -     %{fopenacc|fopenmp|%:gt(%{ftree-parallelize-loops=3D*:%*} 1):\
> >>> -diff --git a/gcc/incpath.c b/gcc/incpath.c
> >>> -index 98fe5ec9ab3..f90e74dbd73 100644
> >>> ---- a/gcc/incpath.c
> >>> -+++ b/gcc/incpath.c
> >>> -@@ -26,6 +26,7 @@
> >>> - #include "intl.h"
> >>> - #include "incpath.h"
> >>> - #include "cppdefault.h"
> >>> -+#include "diagnostic-core.h"
> >>> -
> >>> - /* Microsoft Windows does not natively support inodes.
> >>> -    VMS has non-numeric inodes.  */
> >>> -@@ -382,6 +383,24 @@ merge_include_chains (const char *sysroot, cpp_=
reader *pfile, int verbose)
> >>> -       }
> >>> -       fprintf (stderr, _("End of search list.\n"));
> >>> -     }
> >>> -+
> >>> -+#ifdef ENABLE_POISON_SYSTEM_DIRECTORIES
> >>> -+  if (flag_poison_system_directories)
> >>> -+    {
> >>> -+       struct cpp_dir *p;
> >>> -+
> >>> -+       for (p =3D heads[QUOTE]; p; p =3D p->next)
> >>> -+         {
> >>> -+          if ((!strncmp (p->name, "/usr/include", 12))
> >>> -+              || (!strncmp (p->name, "/usr/local/include", 18))
> >>> -+              || (!strncmp (p->name, "/usr/X11R6/include", 18)))
> >>> -+            warning (OPT_Wpoison_system_directories,
> >>> -+                     "include location \"%s\" is unsafe for "
> >>> -+                     "cross-compilation",
> >>> -+                     p->name);
> >>> -+         }
> >>> -+    }
> >>> -+#endif
> >>> - }
> >>> -
> >>> - /* Use given -I paths for #include "..." but not #include <...>, an=
d
> >>> ---
> >>> -2.12.2
> >>> -
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.3/0010-gcc-poison-dir-ex=
tend.patch b/meta/recipes-devtools/gcc/gcc-7.3/0010-gcc-poison-dir-extend.p=
atch
> >>> deleted file mode 100644
> >>> index 4e06aa2..0000000
> >>> --- a/meta/recipes-devtools/gcc/gcc-7.3/0010-gcc-poison-dir-extend.pa=
tch
> >>> +++ /dev/null
> >>> @@ -1,39 +0,0 @@
> >>> -From e74ef84ad609b3b6a5c37d207ffc3c6e70d1f025 Mon Sep 17 00:00:00 20=
01
> >>> -From: Khem Raj <raj.khem@gmail.com>
> >>> -Date: Fri, 29 Mar 2013 09:00:34 +0400
> >>> -Subject: [PATCH 10/47] gcc-poison-dir-extend
> >>> -
> >>> -Add /sw/include and /opt/include based on the original
> >>> -zecke-no-host-includes.patch patch.  The original patch checked for
> >>> -/usr/include, /sw/include and /opt/include and then triggered a fail=
ure and
> >>> -aborted.
> >>> -
> >>> -Instead, we add the two missing items to the current scan.  If the u=
ser
> >>> -wants this to be a failure, they can add "-Werror=3Dpoison-system-di=
rectories".
> >>> -
> >>> -Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> >>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> -
> >>> -Upstream-Status: Pending
> >>> ----
> >>> - gcc/incpath.c | 4 +++-
> >>> - 1 file changed, 3 insertions(+), 1 deletion(-)
> >>> -
> >>> -diff --git a/gcc/incpath.c b/gcc/incpath.c
> >>> -index f90e74dbd73..c583ee5061d 100644
> >>> ---- a/gcc/incpath.c
> >>> -+++ b/gcc/incpath.c
> >>> -@@ -393,7 +393,9 @@ merge_include_chains (const char *sysroot, cpp_r=
eader *pfile, int verbose)
> >>> -          {
> >>> -           if ((!strncmp (p->name, "/usr/include", 12))
> >>> -               || (!strncmp (p->name, "/usr/local/include", 18))
> >>> --              || (!strncmp (p->name, "/usr/X11R6/include", 18)))
> >>> -+              || (!strncmp (p->name, "/usr/X11R6/include", 18))
> >>> -+              || (!strncmp (p->name, "/sw/include", 11))
> >>> -+              || (!strncmp (p->name, "/opt/include", 12)))
> >>> -             warning (OPT_Wpoison_system_directories,
> >>> -                      "include location \"%s\" is unsafe for "
> >>> -                      "cross-compilation",
> >>> ---
> >>> -2.12.2
> >>> -
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.3/0011-gcc-4.3.3-SYSROOT=
_CFLAGS_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc-7.3/0011-gcc-4.3.3=
-SYSROOT_CFLAGS_FOR_TARGET.patch
> >>> deleted file mode 100644
> >>> index b39ff1e..0000000
> >>> --- a/meta/recipes-devtools/gcc/gcc-7.3/0011-gcc-4.3.3-SYSROOT_CFLAGS=
_FOR_TARGET.patch
> >>> +++ /dev/null
> >>> @@ -1,73 +0,0 @@
> >>> -From a41d3a53a4e313c20802330d6b5c75358a4ed882 Mon Sep 17 00:00:00 20=
01
> >>> -From: Khem Raj <raj.khem@gmail.com>
> >>> -Date: Fri, 29 Mar 2013 09:08:31 +0400
> >>> -Subject: [PATCH 11/47] gcc-4.3.3: SYSROOT_CFLAGS_FOR_TARGET
> >>> -
> >>> -Before committing, I noticed that PR/32161 was marked as a dup of PR=
/32009, but my previous patch did not fix it.
> >>> -
> >>> -This alternative patch is better because it lets you just use CFLAGS=
_FOR_TARGET to set the compilation flags for libgcc. Since bootstrapped tar=
get libraries are never compiled with the native compiler, it makes little =
sense to use different flags for stage1 and later stages. And it also makes=
 little sense to use a different variable than CFLAGS_FOR_TARGET.
> >>> -
> >>> -Other changes I had to do include:
> >>> -
> >>> -- moving the creation of default CFLAGS_FOR_TARGET from Makefile.am =
to configure.ac, because otherwise the BOOT_CFLAGS are substituted into CFL=
AGS_FOR_TARGET (which is "-O2 -g $(CFLAGS)") via $(CFLAGS). It is also clea=
ner this way though.
> >>> -
> >>> -- passing the right CFLAGS to configure scripts as exported environm=
ent variables
> >>> -
> >>> -I also stopped passing LIBCFLAGS to configure scripts since they are=
 unused in the whole src tree. And I updated the documentation as H-P remin=
ded me to do.
> >>> -
> >>> -Bootstrapped/regtested i686-pc-linux-gnu, will commit to 4.4 shortly=
. Ok for 4.3?
> >>> -
> >>> -Signed-off-by: Paolo Bonzini  <bonzini@gnu.org>
> >>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> -
> >>> -Upstream-Status: Pending
> >>> ----
> >>> - configure | 32 ++++++++++++++++++++++++++++++++
> >>> - 1 file changed, 32 insertions(+)
> >>> -
> >>> -diff --git a/configure b/configure
> >>> -index b4760952085..72a8ba94c4e 100755
> >>> ---- a/configure
> >>> -+++ b/configure
> >>> -@@ -6736,6 +6736,38 @@ fi
> >>> -
> >>> -
> >>> -
> >>> -+# During gcc bootstrap, if we use some random cc for stage1 then CF=
LAGS
> >>> -+# might be empty or "-g".  We don't require a C++ compiler, so CXXF=
LAGS
> >>> -+# might also be empty (or "-g", if a non-GCC C++ compiler is in the=
 path).
> >>> -+# We want to ensure that TARGET libraries (which we know are built =
with
> >>> -+# gcc) are built with "-O2 -g", so include those options when setti=
ng
> >>> -+# CFLAGS_FOR_TARGET and CXXFLAGS_FOR_TARGET.
> >>> -+if test "x$CFLAGS_FOR_TARGET" =3D x; then
> >>> -+  CFLAGS_FOR_TARGET=3D$CFLAGS
> >>> -+  case " $CFLAGS " in
> >>> -+    *" -O2 "*) ;;
> >>> -+    *) CFLAGS_FOR_TARGET=3D"-O2 $CFLAGS" ;;
> >>> -+  esac
> >>> -+  case " $CFLAGS " in
> >>> -+    *" -g "* | *" -g3 "*) ;;
> >>> -+    *) CFLAGS_FOR_TARGET=3D"-g $CFLAGS" ;;
> >>> -+  esac
> >>> -+fi
> >>> -+
> >>> -+
> >>> -+if test "x$CXXFLAGS_FOR_TARGET" =3D x; then
> >>> -+  CXXFLAGS_FOR_TARGET=3D$CXXFLAGS
> >>> -+  case " $CXXFLAGS " in
> >>> -+    *" -O2 "*) ;;
> >>> -+    *) CXXFLAGS_FOR_TARGET=3D"-O2 $CXXFLAGS" ;;
> >>> -+  esac
> >>> -+  case " $CXXFLAGS " in
> >>> -+    *" -g "* | *" -g3 "*) ;;
> >>> -+    *) CXXFLAGS_FOR_TARGET=3D"-g $CXXFLAGS" ;;
> >>> -+  esac
> >>> -+fi
> >>> -+
> >>> -+
> >>> - # Handle --with-headers=3DXXX.  If the value is not "yes", the cont=
ents of
> >>> - # the named directory are copied to $(tooldir)/sys-include.
> >>> - if test x"${with_headers}" !=3D x && test x"${with_headers}" !=3D x=
no ; then
> >>> ---
> >>> -2.12.2
> >>> -
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.3/0012-64-bit-multilib-h=
ack.patch b/meta/recipes-devtools/gcc/gcc-7.3/0012-64-bit-multilib-hack.pat=
ch
> >>> deleted file mode 100644
> >>> index f3b3912..0000000
> >>> --- a/meta/recipes-devtools/gcc/gcc-7.3/0012-64-bit-multilib-hack.pat=
ch
> >>> +++ /dev/null
> >>> @@ -1,85 +0,0 @@
> >>> -From 3af9fbbd14e83242ac2acb54bbb4bb726845fd34 Mon Sep 17 00:00:00 20=
01
> >>> -From: Khem Raj <raj.khem@gmail.com>
> >>> -Date: Fri, 29 Mar 2013 09:10:06 +0400
> >>> -Subject: [PATCH 12/47] 64-bit multilib hack.
> >>> -
> >>> -GCC has internal multilib handling code but it assumes a very specif=
ic rigid directory
> >>> -layout. The build system implementation of multilib layout is very g=
eneric and allows
> >>> -complete customisation of the library directories.
> >>> -
> >>> -This patch is a partial solution to allow any custom directories to =
be passed into gcc
> >>> -and handled correctly. It forces gcc to use the base_libdir (which i=
s the current
> >>> -directory, "."). We need to do this for each multilib that is config=
ured as we don't
> >>> -know which compiler options may be being passed into the compiler. S=
ince we have a compiler
> >>> -per mulitlib at this point that isn't an issue.
> >>> -
> >>> -The one problem is the target compiler is only going to work for the=
 default multlilib at
> >>> -this point. Ideally we'd figure out which multilibs were being enabl=
ed with which paths
> >>> -and be able to patch these entries with a complete set of correct pa=
ths but this we
> >>> -don't have such code at this point. This is something the target gcc=
 recipe should do
> >>> -and override these platform defaults in its build config.
> >>> -
> >>> -RP 15/8/11
> >>> -
> >>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> -Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
> >>> -
> >>> -Upstream-Status: Pending
> >>> ----
> >>> - gcc/config/i386/t-linux64   |  6 ++----
> >>> - gcc/config/mips/t-linux64   | 10 +++-------
> >>> - gcc/config/rs6000/t-linux64 |  5 ++---
> >>> - 3 files changed, 7 insertions(+), 14 deletions(-)
> >>> -
> >>> -diff --git a/gcc/config/i386/t-linux64 b/gcc/config/i386/t-linux64
> >>> -index e422c442dae..cc885e24457 100644
> >>> ---- a/gcc/config/i386/t-linux64
> >>> -+++ b/gcc/config/i386/t-linux64
> >>> -@@ -32,7 +32,5 @@
> >>> - #
> >>> - comma=3D,
> >>> - MULTILIB_OPTIONS    =3D $(subst $(comma),/,$(TM_MULTILIB_CONFIG))
> >>> --MULTILIB_DIRNAMES   =3D $(patsubst m%, %, $(subst /, ,$(MULTILIB_OP=
TIONS)))
> >>> --MULTILIB_OSDIRNAMES =3D m64=3D../lib64$(call if_multiarch,:x86_64-l=
inux-gnu)
> >>> --MULTILIB_OSDIRNAMES+=3D m32=3D$(if $(wildcard $(shell echo $(SYSTEM=
_HEADER_DIR))/../../usr/lib32),../lib32,../lib)$(call if_multiarch,:i386-li=
nux-gnu)
> >>> --MULTILIB_OSDIRNAMES+=3D mx32=3D../libx32$(call if_multiarch,:x86_64=
-linux-gnux32)
> >>> -+MULTILIB_DIRNAMES =3D . .
> >>> -+MULTILIB_OSDIRNAMES =3D ../$(shell basename $(base_libdir)) ../$(sh=
ell basename $(base_libdir))
> >>> -diff --git a/gcc/config/mips/t-linux64 b/gcc/config/mips/t-linux64
> >>> -index 100f9da5e14..601cdf08d05 100644
> >>> ---- a/gcc/config/mips/t-linux64
> >>> -+++ b/gcc/config/mips/t-linux64
> >>> -@@ -17,10 +17,6 @@
> >>> - # <http://www.gnu.org/licenses/>.
> >>> -
> >>> - MULTILIB_OPTIONS =3D mabi=3Dn32/mabi=3D32/mabi=3D64
> >>> --MULTILIB_DIRNAMES =3D n32 32 64
> >>> --MIPS_EL =3D $(if $(filter %el, $(firstword $(subst -, ,$(target))))=
,el)
> >>> --MIPS_SOFT =3D $(if $(strip $(filter MASK_SOFT_FLOAT_ABI, $(target_c=
pu_default)) $(filter soft, $(with_float))),soft)
> >>> --MULTILIB_OSDIRNAMES =3D \
> >>> --      ../lib32$(call if_multiarch,:mips64$(MIPS_EL)-linux-gnuabin32=
$(MIPS_SOFT)) \
> >>> --      ../lib$(call if_multiarch,:mips$(MIPS_EL)-linux-gnu$(MIPS_SOF=
T)) \
> >>> --      ../lib64$(call if_multiarch,:mips64$(MIPS_EL)-linux-gnuabi64$=
(MIPS_SOFT))
> >>> -+MULTILIB_DIRNAMES =3D . . .
> >>> -+MULTILIB_OSDIRNAMES =3D ../$(shell basename $(base_libdir)) ../$(sh=
ell basename $(base_libdir)) ../$(shell basename $(base_libdir))
> >>> -+
> >>> -diff --git a/gcc/config/rs6000/t-linux64 b/gcc/config/rs6000/t-linux=
64
> >>> -index 2830ed0d861..d057facd2fd 100644
> >>> ---- a/gcc/config/rs6000/t-linux64
> >>> -+++ b/gcc/config/rs6000/t-linux64
> >>> -@@ -26,10 +26,9 @@
> >>> - # MULTILIB_OSDIRNAMES according to what is found on the target.
> >>> -
> >>> - MULTILIB_OPTIONS    :=3D m64/m32
> >>> --MULTILIB_DIRNAMES   :=3D 64 32
> >>> -+MULTILIB_DIRNAMES   :=3D . .
> >>> - MULTILIB_EXTRA_OPTS :=3D
> >>> --MULTILIB_OSDIRNAMES :=3D m64=3D../lib64$(call if_multiarch,:powerpc=
64-linux-gnu)
> >>> --MULTILIB_OSDIRNAMES +=3D m32=3D$(if $(wildcard $(shell echo $(SYSTE=
M_HEADER_DIR))/../../usr/lib32),../lib32,../lib)$(call if_multiarch,:powerp=
c-linux-gnu)
> >>> -+MULTILIB_OSDIRNAMES :=3D ../$(shell basename $(base_libdir)) ../$(s=
hell basename $(base_libdir))
> >>> -
> >>> - rs6000-linux.o: $(srcdir)/config/rs6000/rs6000-linux.c
> >>> -       $(COMPILE) $<
> >>> ---
> >>> -2.12.2
> >>> -
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.3/0013-optional-libstdc.=
patch b/meta/recipes-devtools/gcc/gcc-7.3/0013-optional-libstdc.patch
> >>> deleted file mode 100644
> >>> index 3439bf6..0000000
> >>> --- a/meta/recipes-devtools/gcc/gcc-7.3/0013-optional-libstdc.patch
> >>> +++ /dev/null
> >>> @@ -1,125 +0,0 @@
> >>> -From 26a58d05844274915d011edbf9330c6151687b22 Mon Sep 17 00:00:00 20=
01
> >>> -From: Khem Raj <raj.khem@gmail.com>
> >>> -Date: Fri, 29 Mar 2013 09:12:56 +0400
> >>> -Subject: [PATCH 13/47] optional libstdc
> >>> -
> >>> -gcc-runtime builds libstdc++ separately from gcc-cross-*. Its config=
ure tests using g++
> >>> -will not run correctly since by default the linker will try to link =
against libstdc++
> >>> -which shouldn't exist yet. We need an option to disable -lstdc++
> >>> -option whilst leaving -lc, -lgcc and other automatic library depende=
ncies added by gcc
> >>> -driver. This patch adds such an option which only disables the -lstd=
c++.
> >>> -
> >>> -A "standard" gcc build uses xgcc and hence avoids this. We should as=
k upstream how to
> >>> -do this officially, the likely answer is don't build libstdc++ separ=
ately.
> >>> -
> >>> -RP 29/6/10
> >>> -
> >>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> -
> >>> -Upstream-Status: Inappropriate [embedded specific]
> >>> ----
> >>> - gcc/c-family/c.opt  |  4 ++++
> >>> - gcc/cp/g++spec.c    |  1 +
> >>> - gcc/doc/invoke.texi | 32 +++++++++++++++++++++++++++++++-
> >>> - gcc/gcc.c           |  1 +
> >>> - 4 files changed, 37 insertions(+), 1 deletion(-)
> >>> -
> >>> -diff --git a/gcc/c-family/c.opt b/gcc/c-family/c.opt
> >>> -index 9ad2f6e1fcc..c4ef7796282 100644
> >>> ---- a/gcc/c-family/c.opt
> >>> -+++ b/gcc/c-family/c.opt
> >>> -@@ -1848,6 +1848,10 @@ nostdinc++
> >>> - C++ ObjC++
> >>> - Do not search standard system include directories for C++.
> >>> -
> >>> -+nostdlib++
> >>> -+Driver
> >>> -+Do not link standard C++ runtime library
> >>> -+
> >>> - o
> >>> - C ObjC C++ ObjC++ Joined Separate
> >>> - ; Documented in common.opt
> >>> -diff --git a/gcc/cp/g++spec.c b/gcc/cp/g++spec.c
> >>> -index ffcc87c79c9..28d8a9cf530 100644
> >>> ---- a/gcc/cp/g++spec.c
> >>> -+++ b/gcc/cp/g++spec.c
> >>> -@@ -137,6 +137,7 @@ lang_specific_driver (struct cl_decoded_option *=
*in_decoded_options,
> >>> -       switch (decoded_options[i].opt_index)
> >>> -       {
> >>> -       case OPT_nostdlib:
> >>> -+      case OPT_nostdlib__:
> >>> -       case OPT_nodefaultlibs:
> >>> -         library =3D -1;
> >>> -         break;
> >>> -diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
> >>> -index 060cd7169c6..8e2adc25644 100644
> >>> ---- a/gcc/doc/invoke.texi
> >>> -+++ b/gcc/doc/invoke.texi
> >>> -@@ -211,6 +211,9 @@ in the following sections.
> >>> - -fno-weak  -nostdinc++ @gol
> >>> - -fvisibility-inlines-hidden @gol
> >>> - -fvisibility-ms-compat @gol
> >>> -+-fvtable-verify=3D@r{[}std@r{|}preinit@r{|}none@r{]} @gol
> >>> -+-fvtv-counts -fvtv-debug @gol
> >>> -+-nostdlib++ @gol
> >>> - -fext-numeric-literals @gol
> >>> - -Wabi=3D@var{n}  -Wabi-tag  -Wconversion-null  -Wctor-dtor-privacy =
@gol
> >>> - -Wdelete-non-virtual-dtor  -Wliteral-suffix  -Wmultiple-inheritance=
 @gol
> >>> -@@ -496,7 +499,7 @@ Objective-C and Objective-C++ Dialects}.
> >>> - -s  -static  -static-libgcc  -static-libstdc++ @gol
> >>> - -static-libasan  -static-libtsan  -static-liblsan  -static-libubsan=
 @gol
> >>> - -static-libmpx  -static-libmpxwrappers @gol
> >>> ---shared  -shared-libgcc  -symbolic @gol
> >>> -+-shared  -shared-libgcc  -symbolic -nostdlib++ @gol
> >>> - -T @var{script}  -Wl,@var{option}  -Xlinker @var{option} @gol
> >>> - -u @var{symbol}  -z @var{keyword}}
> >>> -
> >>> -@@ -11606,6 +11609,33 @@ library subroutines.
> >>> - constructors are called; @pxref{Collect2,,@code{collect2}, gccint,
> >>> - GNU Compiler Collection (GCC) Internals}.)
> >>> -
> >>> -+@item -nostdlib++
> >>> -+@opindex nostdlib++
> >>> -+Do not use the standard system C++ runtime libraries when linking.
> >>> -+Only the libraries you specify will be passed to the linker.
> >>> -+
> >>> -+@cindex @option{-lgcc}, use with @option{-nostdlib}
> >>> -+@cindex @option{-nostdlib} and unresolved references
> >>> -+@cindex unresolved references and @option{-nostdlib}
> >>> -+@cindex @option{-lgcc}, use with @option{-nodefaultlibs}
> >>> -+@cindex @option{-nodefaultlibs} and unresolved references
> >>> -+@cindex unresolved references and @option{-nodefaultlibs}
> >>> -+One of the standard libraries bypassed by @option{-nostdlib} and
> >>> -+@option{-nodefaultlibs} is @file{libgcc.a}, a library of internal s=
ubroutines
> >>> -+which GCC uses to overcome shortcomings of particular machines, or =
special
> >>> -+needs for some languages.
> >>> -+(@xref{Interface,,Interfacing to GCC Output,gccint,GNU Compiler
> >>> -+Collection (GCC) Internals},
> >>> -+for more discussion of @file{libgcc.a}.)
> >>> -+In most cases, you need @file{libgcc.a} even when you want to avoid
> >>> -+other standard libraries.  In other words, when you specify @option=
{-nostdlib}
> >>> -+or @option{-nodefaultlibs} you should usually specify @option{-lgcc=
} as well.
> >>> -+This ensures that you have no unresolved references to internal GCC
> >>> -+library subroutines.
> >>> -+(An example of such an internal subroutine is @code{__main}, used t=
o ensure C++
> >>> -+constructors are called; @pxref{Collect2,,@code{collect2}, gccint,
> >>> -+GNU Compiler Collection (GCC) Internals}.)
> >>> -+
> >>> - @item -pie
> >>> - @opindex pie
> >>> - Produce a position independent executable on targets that support i=
t.
> >>> -diff --git a/gcc/gcc.c b/gcc/gcc.c
> >>> -index 6315aa0dd16..a5fafbe5107 100644
> >>> ---- a/gcc/gcc.c
> >>> -+++ b/gcc/gcc.c
> >>> -@@ -1046,6 +1046,7 @@ proper position among the other output files. =
 */
> >>> -     %(mflib) " STACK_SPLIT_SPEC "\
> >>> -     %{fprofile-arcs|fprofile-generate*|coverage:-lgcov} " SANITIZER=
_SPEC " \
> >>> -     %{!nostdlib:%{!nodefaultlibs:%(link_ssp) %(link_gcc_c_sequence)=
}}\
> >>> -+    %{!nostdlib++:}\
> >>> -     %{!nostdlib:%{!nostartfiles:%E}} %{T*}  \n%(post_link) }}}}}}"
> >>> - #endif
> >>> -
> >>> ---
> >>> -2.12.2
> >>> -
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.3/0014-gcc-disable-MASK_=
RELAX_PIC_CALLS-bit.patch b/meta/recipes-devtools/gcc/gcc-7.3/0014-gcc-disa=
ble-MASK_RELAX_PIC_CALLS-bit.patch
> >>> deleted file mode 100644
> >>> index f92b5fb..0000000
> >>> --- a/meta/recipes-devtools/gcc/gcc-7.3/0014-gcc-disable-MASK_RELAX_P=
IC_CALLS-bit.patch
> >>> +++ /dev/null
> >>> @@ -1,59 +0,0 @@
> >>> -From 716de5db6859fd1ea21078c94a41fac7a885b7e9 Mon Sep 17 00:00:00 20=
01
> >>> -From: Khem Raj <raj.khem@gmail.com>
> >>> -Date: Fri, 29 Mar 2013 09:14:20 +0400
> >>> -Subject: [PATCH 14/47] gcc: disable MASK_RELAX_PIC_CALLS bit
> >>> -
> >>> -The new feature added after 4.3.3
> >>> -"http://www.pubbs.net/200909/gcc/94048-patch-add-support-for-rmipsja=
lr.html"
> >>> -will cause cc1plus eat up all the system memory when build webkit-gt=
k.
> >>> -The function mips_get_pic_call_symbol keeps on recursively calling i=
tself.
> >>> -Disable this feature to walk aside the bug.
> >>> -
> >>> -Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
> >>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> -
> >>> -Upstream-Status: Inappropriate [configuration]
> >>> ----
> >>> - gcc/configure    | 7 -------
> >>> - gcc/configure.ac | 7 -------
> >>> - 2 files changed, 14 deletions(-)
> >>> -
> >>> -diff --git a/gcc/configure b/gcc/configure
> >>> -index 4898f04fa6b..640e4643805 100755
> >>> ---- a/gcc/configure
> >>> -+++ b/gcc/configure
> >>> -@@ -27303,13 +27303,6 @@ $as_echo_n "checking assembler and linker f=
or explicit JALR relocation... " >&6;
> >>> -         rm -f conftest.*
> >>> -       fi
> >>> -     fi
> >>> --    if test $gcc_cv_as_ld_jalr_reloc =3D yes; then
> >>> --      if test x$target_cpu_default =3D x; then
> >>> --        target_cpu_default=3DMASK_RELAX_PIC_CALLS
> >>> --      else
> >>> --        target_cpu_default=3D"($target_cpu_default)|MASK_RELAX_PIC_=
CALLS"
> >>> --      fi
> >>> --    fi
> >>> -     { $as_echo "$as_me:${as_lineno-$LINENO}: result: $gcc_cv_as_ld_=
jalr_reloc" >&5
> >>> - $as_echo "$gcc_cv_as_ld_jalr_reloc" >&6; }
> >>> -
> >>> -diff --git a/gcc/configure.ac b/gcc/configure.ac
> >>> -index 9dc1dc7fc96..9a2dae55ba2 100644
> >>> ---- a/gcc/configure.ac
> >>> -+++ b/gcc/configure.ac
> >>> -@@ -4641,13 +4641,6 @@ x:
> >>> -         rm -f conftest.*
> >>> -       fi
> >>> -     fi
> >>> --    if test $gcc_cv_as_ld_jalr_reloc =3D yes; then
> >>> --      if test x$target_cpu_default =3D x; then
> >>> --        target_cpu_default=3DMASK_RELAX_PIC_CALLS
> >>> --      else
> >>> --        target_cpu_default=3D"($target_cpu_default)|MASK_RELAX_PIC_=
CALLS"
> >>> --      fi
> >>> --    fi
> >>> -     AC_MSG_RESULT($gcc_cv_as_ld_jalr_reloc)
> >>> -
> >>> -     AC_CACHE_CHECK([linker for .eh_frame personality relaxation],
> >>> ---
> >>> -2.12.2
> >>> -
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.3/0015-COLLECT_GCC_OPTIO=
NS.patch b/meta/recipes-devtools/gcc/gcc-7.3/0015-COLLECT_GCC_OPTIONS.patch
> >>> deleted file mode 100644
> >>> index 6e62945..0000000
> >>> --- a/meta/recipes-devtools/gcc/gcc-7.3/0015-COLLECT_GCC_OPTIONS.patc=
h
> >>> +++ /dev/null
> >>> @@ -1,38 +0,0 @@
> >>> -From 04a7a672301bb07caea6a7cad8378f63f1fe3200 Mon Sep 17 00:00:00 20=
01
> >>> -From: Khem Raj <raj.khem@gmail.com>
> >>> -Date: Fri, 29 Mar 2013 09:16:28 +0400
> >>> -Subject: [PATCH 15/47] COLLECT_GCC_OPTIONS
> >>> -
> >>> -This patch adds --sysroot into COLLECT_GCC_OPTIONS which is used to
> >>> -invoke collect2.
> >>> -
> >>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> -
> >>> -Upstream-Status: Pending
> >>> ----
> >>> - gcc/gcc.c | 9 +++++++++
> >>> - 1 file changed, 9 insertions(+)
> >>> -
> >>> -diff --git a/gcc/gcc.c b/gcc/gcc.c
> >>> -index a5fafbe5107..05896e19926 100644
> >>> ---- a/gcc/gcc.c
> >>> -+++ b/gcc/gcc.c
> >>> -@@ -4654,6 +4654,15 @@ set_collect_gcc_options (void)
> >>> -               sizeof ("COLLECT_GCC_OPTIONS=3D") - 1);
> >>> -
> >>> -   first_time =3D TRUE;
> >>> -+#ifdef HAVE_LD_SYSROOT
> >>> -+  if (target_system_root_changed && target_system_root)
> >>> -+    {
> >>> -+      obstack_grow (&collect_obstack, "'--sysroot=3D", sizeof("'--s=
ysroot=3D")-1);
> >>> -+      obstack_grow (&collect_obstack, target_system_root,strlen(tar=
get_system_root));
> >>> -+      obstack_grow (&collect_obstack, "'", 1);
> >>> -+      first_time =3D FALSE;
> >>> -+    }
> >>> -+#endif
> >>> -   for (i =3D 0; (int) i < n_switches; i++)
> >>> -     {
> >>> -       const char *const *args;
> >>> ---
> >>> -2.12.2
> >>> -
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.3/0016-Use-the-defaults.=
h-in-B-instead-of-S-and-t-oe-in-B.patch b/meta/recipes-devtools/gcc/gcc-7.3=
/0016-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
> >>> deleted file mode 100644
> >>> index 1991251..0000000
> >>> --- a/meta/recipes-devtools/gcc/gcc-7.3/0016-Use-the-defaults.h-in-B-=
instead-of-S-and-t-oe-in-B.patch
> >>> +++ /dev/null
> >>> @@ -1,96 +0,0 @@
> >>> -From 47071cbd4f13ff5a4974f71f359a04afcfb125da Mon Sep 17 00:00:00 20=
01
> >>> -From: Khem Raj <raj.khem@gmail.com>
> >>> -Date: Fri, 29 Mar 2013 09:17:25 +0400
> >>> -Subject: [PATCH 16/47] Use the defaults.h in ${B} instead of ${S}, a=
nd t-oe in
> >>> - ${B}
> >>> -
> >>> -Use the defaults.h in ${B} instead of ${S}, and t-oe in ${B}, so tha=
t
> >>> -the source can be shared between gcc-cross-initial,
> >>> -gcc-cross-intermediate, gcc-cross, gcc-runtime, and also the sdk bui=
ld.
> >>> -
> >>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> -
> >>> -Upstream-Status: Pending
> >>> -
> >>> -While compiling gcc-crosssdk-initial-x86_64 on some host, there is
> >>> -occasionally failure that test the existance of default.h doesn't
> >>> -work, the reason is tm_include_list=3D'** defaults.h' rather than
> >>> -tm_include_list=3D'** ./defaults.h'
> >>> -
> >>> -So we add the test condition for this situation.
> >>> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> >>> ----
> >>> - gcc/Makefile.in  | 2 +-
> >>> - gcc/configure    | 4 ++--
> >>> - gcc/configure.ac | 4 ++--
> >>> - gcc/mkconfig.sh  | 4 ++--
> >>> - 4 files changed, 7 insertions(+), 7 deletions(-)
> >>> -
> >>> -diff --git a/gcc/Makefile.in b/gcc/Makefile.in
> >>> -index 2411671cea3..7b590c9bbd3 100644
> >>> ---- a/gcc/Makefile.in
> >>> -+++ b/gcc/Makefile.in
> >>> -@@ -532,7 +532,7 @@ TARGET_SYSTEM_ROOT =3D @TARGET_SYSTEM_ROOT@
> >>> - TARGET_SYSTEM_ROOT_DEFINE =3D @TARGET_SYSTEM_ROOT_DEFINE@
> >>> -
> >>> - xmake_file=3D@xmake_file@
> >>> --tmake_file=3D@tmake_file@
> >>> -+tmake_file=3D@tmake_file@ ./t-oe
> >>> - TM_ENDIAN_CONFIG=3D@TM_ENDIAN_CONFIG@
> >>> - TM_MULTILIB_CONFIG=3D@TM_MULTILIB_CONFIG@
> >>> - TM_MULTILIB_EXCEPTIONS_CONFIG=3D@TM_MULTILIB_EXCEPTIONS_CONFIG@
> >>> -diff --git a/gcc/configure b/gcc/configure
> >>> -index 640e4643805..b5ac1552541 100755
> >>> ---- a/gcc/configure
> >>> -+++ b/gcc/configure
> >>> -@@ -12150,8 +12150,8 @@ for f in $tm_file; do
> >>> -        tm_include_list=3D"${tm_include_list} $f"
> >>> -        ;;
> >>> -     defaults.h )
> >>> --       tm_file_list=3D"${tm_file_list} \$(srcdir)/$f"
> >>> --       tm_include_list=3D"${tm_include_list} $f"
> >>> -+       tm_file_list=3D"${tm_file_list} ./$f"
> >>> -+       tm_include_list=3D"${tm_include_list} ./$f"
> >>> -        ;;
> >>> -     * )
> >>> -        tm_file_list=3D"${tm_file_list} \$(srcdir)/config/$f"
> >>> -diff --git a/gcc/configure.ac b/gcc/configure.ac
> >>> -index 9a2dae55ba2..cb1479d1ef4 100644
> >>> ---- a/gcc/configure.ac
> >>> -+++ b/gcc/configure.ac
> >>> -@@ -1922,8 +1922,8 @@ for f in $tm_file; do
> >>> -        tm_include_list=3D"${tm_include_list} $f"
> >>> -        ;;
> >>> -     defaults.h )
> >>> --       tm_file_list=3D"${tm_file_list} \$(srcdir)/$f"
> >>> --       tm_include_list=3D"${tm_include_list} $f"
> >>> -+       tm_file_list=3D"${tm_file_list} ./$f"
> >>> -+       tm_include_list=3D"${tm_include_list} ./$f"
> >>> -        ;;
> >>> -     * )
> >>> -        tm_file_list=3D"${tm_file_list} \$(srcdir)/config/$f"
> >>> -diff --git a/gcc/mkconfig.sh b/gcc/mkconfig.sh
> >>> -index 9fc7b5ca734..04abecfe648 100644
> >>> ---- a/gcc/mkconfig.sh
> >>> -+++ b/gcc/mkconfig.sh
> >>> -@@ -77,7 +77,7 @@ if [ -n "$HEADERS" ]; then
> >>> -     if [ $# -ge 1 ]; then
> >>> -       echo '#ifdef IN_GCC' >> ${output}T
> >>> -       for file in "$@"; do
> >>> --          if test x"$file" =3D x"defaults.h"; then
> >>> -+          if test x"$file" =3D x"./defaults.h" -o x"$file" =3D x"de=
faults.h"; then
> >>> -               postpone_defaults_h=3D"yes"
> >>> -           else
> >>> -               echo "# include \"$file\"" >> ${output}T
> >>> -@@ -109,7 +109,7 @@ esac
> >>> -
> >>> - # If we postponed including defaults.h, add the #include now.
> >>> - if test x"$postpone_defaults_h" =3D x"yes"; then
> >>> --    echo "# include \"defaults.h\"" >> ${output}T
> >>> -+    echo "# include \"./defaults.h\"" >> ${output}T
> >>> - fi
> >>> -
> >>> - # Add multiple inclusion protection guard, part two.
> >>> ---
> >>> -2.12.2
> >>> -
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.3/0017-fortran-cross-com=
pile-hack.patch b/meta/recipes-devtools/gcc/gcc-7.3/0017-fortran-cross-comp=
ile-hack.patch
> >>> deleted file mode 100644
> >>> index e2830c5..0000000
> >>> --- a/meta/recipes-devtools/gcc/gcc-7.3/0017-fortran-cross-compile-ha=
ck.patch
> >>> +++ /dev/null
> >>> @@ -1,46 +0,0 @@
> >>> -From 4fc35a2bb7666a7de35568eb5d47f0ce6acebe62 Mon Sep 17 00:00:00 20=
01
> >>> -From: Khem Raj <raj.khem@gmail.com>
> >>> -Date: Fri, 29 Mar 2013 09:20:01 +0400
> >>> -Subject: [PATCH 17/47] fortran cross-compile hack.
> >>> -
> >>> -* Fortran would have searched for arm-angstrom-gnueabi-gfortran but =
would have used
> >>> -used gfortan. For gcc_4.2.2.bb we want to use the gfortran compiler =
from our cross
> >>> -directory.
> >>> -
> >>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> -
> >>> -Upstream-Status: Inappropriate [embedded specific]
> >>> ----
> >>> - libgfortran/configure    | 2 +-
> >>> - libgfortran/configure.ac | 2 +-
> >>> - 2 files changed, 2 insertions(+), 2 deletions(-)
> >>> -
> >>> -diff --git a/libgfortran/configure b/libgfortran/configure
> >>> -index 81238fcb79c..7ded7abd456 100755
> >>> ---- a/libgfortran/configure
> >>> -+++ b/libgfortran/configure
> >>> -@@ -12792,7 +12792,7 @@ esac
> >>> -
> >>> - # We need gfortran to compile parts of the library
> >>> - #AC_PROG_FC(gfortran)
> >>> --FC=3D"$GFORTRAN"
> >>> -+#FC=3D"$GFORTRAN"
> >>> - ac_ext=3D${ac_fc_srcext-f}
> >>> - ac_compile=3D'$FC -c $FCFLAGS $ac_fcflags_srcext conftest.$ac_ext >=
&5'
> >>> - ac_link=3D'$FC -o conftest$ac_exeext $FCFLAGS $LDFLAGS $ac_fcflags_=
srcext conftest.$ac_ext $LIBS >&5'
> >>> -diff --git a/libgfortran/configure.ac b/libgfortran/configure.ac
> >>> -index 37b12d2998f..63a4166ef62 100644
> >>> ---- a/libgfortran/configure.ac
> >>> -+++ b/libgfortran/configure.ac
> >>> -@@ -243,7 +243,7 @@ AC_SUBST(enable_static)
> >>> -
> >>> - # We need gfortran to compile parts of the library
> >>> - #AC_PROG_FC(gfortran)
> >>> --FC=3D"$GFORTRAN"
> >>> -+#FC=3D"$GFORTRAN"
> >>> - AC_PROG_FC(gfortran)
> >>> -
> >>> - # extra LD Flags which are required for targets
> >>> ---
> >>> -2.12.2
> >>> -
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.3/0018-cpp-honor-sysroot=
.patch b/meta/recipes-devtools/gcc/gcc-7.3/0018-cpp-honor-sysroot.patch
> >>> deleted file mode 100644
> >>> index 5559074..0000000
> >>> --- a/meta/recipes-devtools/gcc/gcc-7.3/0018-cpp-honor-sysroot.patch
> >>> +++ /dev/null
> >>> @@ -1,54 +0,0 @@
> >>> -From 1c8a332469ca4bfefb10df70720e0dc83ff9a756 Mon Sep 17 00:00:00 20=
01
> >>> -From: Khem Raj <raj.khem@gmail.com>
> >>> -Date: Fri, 29 Mar 2013 09:22:00 +0400
> >>> -Subject: [PATCH 18/47] cpp: honor sysroot.
> >>> -
> >>> -Currently, if the gcc toolchain is relocated and installed from ssta=
te, then you try and compile
> >>> -preprocessed source (.i or .ii files), the compiler will try and acc=
ess the builtin sysroot location
> >>> -rather than the --sysroot option specified on the commandline. If ac=
cess to that directory is
> >>> -permission denied (unreadable), gcc will error.
> >>> -
> >>> -This happens when ccache is in use due to the fact it uses preproces=
sed source files.
> >>> -
> >>> -The fix below adds %I to the cpp-output spec macro so the default su=
bstitutions for -iprefix,
> >>> --isystem, -isysroot happen and the correct sysroot is used.
> >>> -
> >>> -[YOCTO #2074]
> >>> -
> >>> -RP 2012/04/13
> >>> -
> >>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> -
> >>> -Upstream-Status: Pending
> >>> ----
> >>> - gcc/cp/lang-specs.h | 2 +-
> >>> - gcc/gcc.c           | 2 +-
> >>> - 2 files changed, 2 insertions(+), 2 deletions(-)
> >>> -
> >>> -diff --git a/gcc/cp/lang-specs.h b/gcc/cp/lang-specs.h
> >>> -index 6b383e1d86d..c7c7d6a56ec 100644
> >>> ---- a/gcc/cp/lang-specs.h
> >>> -+++ b/gcc/cp/lang-specs.h
> >>> -@@ -64,5 +64,5 @@ along with GCC; see the file COPYING3.  If not see
> >>> -   {".ii", "@c++-cpp-output", 0, 0, 0},
> >>> -   {"@c++-cpp-output",
> >>> -    "%{!M:%{!MM:%{!E:\
> >>> --    cc1plus -fpreprocessed %i %(cc1_options) %2\
> >>> -+    cc1plus -fpreprocessed %i %I %(cc1_options) %2\
> >>> -     %{!fsyntax-only:%(invoke_as)}}}}", 0, 0, 0},
> >>> -diff --git a/gcc/gcc.c b/gcc/gcc.c
> >>> -index 05896e19926..c73d4023987 100644
> >>> ---- a/gcc/gcc.c
> >>> -+++ b/gcc/gcc.c
> >>> -@@ -1351,7 +1351,7 @@ static const struct compiler default_compilers=
[] =3D
> >>> -                                          %W{o*:--output-pch=3D%*}}%=
V}}}}}}}", 0, 0, 0},
> >>> -   {".i", "@cpp-output", 0, 0, 0},
> >>> -   {"@cpp-output",
> >>> --   "%{!M:%{!MM:%{!E:cc1 -fpreprocessed %i %(cc1_options) %{!fsyntax=
-only:%(invoke_as)}}}}", 0, 0, 0},
> >>> -+   "%{!M:%{!MM:%{!E:cc1 -fpreprocessed %i %I %(cc1_options) %{!fsyn=
tax-only:%(invoke_as)}}}}", 0, 0, 0},
> >>> -   {".s", "@assembler", 0, 0, 0},
> >>> -   {"@assembler",
> >>> -    "%{!M:%{!MM:%{!E:%{!S:as %(asm_debug) %(asm_options) %i %A }}}}"=
, 0, 0, 0},
> >>> ---
> >>> -2.12.2
> >>> -
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.3/0019-MIPS64-Default-to=
-N64-ABI.patch b/meta/recipes-devtools/gcc/gcc-7.3/0019-MIPS64-Default-to-N=
64-ABI.patch
> >>> deleted file mode 100644
> >>> index 742a401..0000000
> >>> --- a/meta/recipes-devtools/gcc/gcc-7.3/0019-MIPS64-Default-to-N64-AB=
I.patch
> >>> +++ /dev/null
> >>> @@ -1,57 +0,0 @@
> >>> -From 0a3b3cc45ea7ba83b46df7464b41c377e3966d88 Mon Sep 17 00:00:00 20=
01
> >>> -From: Khem Raj <raj.khem@gmail.com>
> >>> -Date: Fri, 29 Mar 2013 09:23:08 +0400
> >>> -Subject: [PATCH 19/47] MIPS64: Default to N64 ABI
> >>> -
> >>> -MIPS64 defaults to n32 ABI, this patch makes it
> >>> -so that it defaults to N64 ABI
> >>> -
> >>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> -
> >>> -Upstream-Status: Inappropriate [OE config specific]
> >>> ----
> >>> - gcc/config.gcc | 10 +++++-----
> >>> - 1 file changed, 5 insertions(+), 5 deletions(-)
> >>> -
> >>> -diff --git a/gcc/config.gcc b/gcc/config.gcc
> >>> -index b8bb4d65825..5e45f4b5199 100644
> >>> ---- a/gcc/config.gcc
> >>> -+++ b/gcc/config.gcc
> >>> -@@ -2084,29 +2084,29 @@ mips*-*-linux*)                             =
   # Linux MIPS, either endian.
> >>> -                       default_mips_arch=3Dmips32
> >>> -                       ;;
> >>> -               mips64el-st-linux-gnu)
> >>> --                      default_mips_abi=3Dn32
> >>> -+                      default_mips_abi=3D64
> >>> -                       tm_file=3D"${tm_file} mips/st.h"
> >>> -                       tmake_file=3D"${tmake_file} mips/t-st"
> >>> -                       enable_mips_multilibs=3D"yes"
> >>> -                       ;;
> >>> -               mips64octeon*-*-linux*)
> >>> --                      default_mips_abi=3Dn32
> >>> -+                      default_mips_abi=3D64
> >>> -                       tm_defines=3D"${tm_defines} MIPS_CPU_STRING_D=
EFAULT=3D\\\"octeon\\\""
> >>> -                       target_cpu_default=3DMASK_SOFT_FLOAT_ABI
> >>> -                       enable_mips_multilibs=3D"yes"
> >>> -                       ;;
> >>> -               mipsisa64r6*-*-linux*)
> >>> --                      default_mips_abi=3Dn32
> >>> -+                      default_mips_abi=3D64
> >>> -                       default_mips_arch=3Dmips64r6
> >>> -                       enable_mips_multilibs=3D"yes"
> >>> -                       ;;
> >>> -               mipsisa64r2*-*-linux*)
> >>> --                      default_mips_abi=3Dn32
> >>> -+                      default_mips_abi=3D64
> >>> -                       default_mips_arch=3Dmips64r2
> >>> -                       enable_mips_multilibs=3D"yes"
> >>> -                       ;;
> >>> -               mips64*-*-linux* | mipsisa64*-*-linux*)
> >>> --                      default_mips_abi=3Dn32
> >>> -+                      default_mips_abi=3D64
> >>> -                       enable_mips_multilibs=3D"yes"
> >>> -                       ;;
> >>> -       esac
> >>> ---
> >>> -2.12.2
> >>> -
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.3/0020-Define-GLIBC_DYNA=
MIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc-7=
.3/0020-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> >>> deleted file mode 100644
> >>> index de7b4df..0000000
> >>> --- a/meta/recipes-devtools/gcc/gcc-7.3/0020-Define-GLIBC_DYNAMIC_LIN=
KER-and-UCLIBC_DYNAMIC_LINKE.patch
> >>> +++ /dev/null
> >>> @@ -1,234 +0,0 @@
> >>> -From d6c983b685ee03e9cf21189108d31ed9f760ff3f Mon Sep 17 00:00:00 20=
01
> >>> -From: Khem Raj <raj.khem@gmail.com>
> >>> -Date: Fri, 29 Mar 2013 09:24:50 +0400
> >>> -Subject: [PATCH 20/47] Define GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMI=
C_LINKER
> >>> - relative to SYSTEMLIBS_DIR
> >>> -
> >>> -This patch defines GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKER
> >>> -relative to SYSTEMLIBS_DIR which can be set in generated headers
> >>> -This breaks the assumption of hardcoded multilib in gcc
> >>> -Change is only for the supported architectures in OE including
> >>> -SH, sparc, alpha for possible future support (if any)
> >>> -
> >>> -Removes the do_headerfix task in metadata
> >>> -
> >>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> -
> >>> -Upstream-Status: Inappropriate [OE configuration]
> >>> ----
> >>> - gcc/config/alpha/linux-elf.h |  4 ++--
> >>> - gcc/config/arm/linux-eabi.h  |  4 ++--
> >>> - gcc/config/arm/linux-elf.h   |  2 +-
> >>> - gcc/config/i386/linux.h      |  2 +-
> >>> - gcc/config/i386/linux64.h    |  6 +++---
> >>> - gcc/config/linux.h           |  8 ++++----
> >>> - gcc/config/mips/linux.h      | 12 ++++++------
> >>> - gcc/config/rs6000/linux64.h  | 16 ++++++----------
> >>> - gcc/config/sh/linux.h        |  2 +-
> >>> - gcc/config/sparc/linux.h     |  2 +-
> >>> - gcc/config/sparc/linux64.h   |  4 ++--
> >>> - 11 files changed, 29 insertions(+), 33 deletions(-)
> >>> -
> >>> -diff --git a/gcc/config/alpha/linux-elf.h b/gcc/config/alpha/linux-e=
lf.h
> >>> -index 2c39fbe601c..6d88e21abe2 100644
> >>> ---- a/gcc/config/alpha/linux-elf.h
> >>> -+++ b/gcc/config/alpha/linux-elf.h
> >>> -@@ -23,8 +23,8 @@ along with GCC; see the file COPYING3.  If not see
> >>> - #define EXTRA_SPECS \
> >>> - { "elf_dynamic_linker", ELF_DYNAMIC_LINKER },
> >>> -
> >>> --#define GLIBC_DYNAMIC_LINKER  "/lib/ld-linux.so.2"
> >>> --#define UCLIBC_DYNAMIC_LINKER "/lib/ld-uClibc.so.0"
> >>> -+#define GLIBC_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-linux.so.2"
> >>> -+#define UCLIBC_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-uClibc.so.0"
> >>> - #if DEFAULT_LIBC =3D=3D LIBC_UCLIBC
> >>> - #define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:" G ";:" U "}"
> >>> - #elif DEFAULT_LIBC =3D=3D LIBC_GLIBC
> >>> -diff --git a/gcc/config/arm/linux-eabi.h b/gcc/config/arm/linux-eabi=
.h
> >>> -index a08cfb34377..fbac9a9d994 100644
> >>> ---- a/gcc/config/arm/linux-eabi.h
> >>> -+++ b/gcc/config/arm/linux-eabi.h
> >>> -@@ -62,8 +62,8 @@
> >>> -    GLIBC_DYNAMIC_LINKER_DEFAULT and TARGET_DEFAULT_FLOAT_ABI.  */
> >>> -
> >>> - #undef  GLIBC_DYNAMIC_LINKER
> >>> --#define GLIBC_DYNAMIC_LINKER_SOFT_FLOAT "/lib/ld-linux.so.3"
> >>> --#define GLIBC_DYNAMIC_LINKER_HARD_FLOAT "/lib/ld-linux-armhf.so.3"
> >>> -+#define GLIBC_DYNAMIC_LINKER_SOFT_FLOAT SYSTEMLIBS_DIR "ld-linux.so=
.3"
> >>> -+#define GLIBC_DYNAMIC_LINKER_HARD_FLOAT SYSTEMLIBS_DIR "ld-linux-ar=
mhf.so.3"
> >>> - #define GLIBC_DYNAMIC_LINKER_DEFAULT GLIBC_DYNAMIC_LINKER_SOFT_FLOA=
T
> >>> -
> >>> - #define GLIBC_DYNAMIC_LINKER \
> >>> -diff --git a/gcc/config/arm/linux-elf.h b/gcc/config/arm/linux-elf.h
> >>> -index 3d62367ae68..e8a16191849 100644
> >>> ---- a/gcc/config/arm/linux-elf.h
> >>> -+++ b/gcc/config/arm/linux-elf.h
> >>> -@@ -60,7 +60,7 @@
> >>> -
> >>> - #define LIBGCC_SPEC "%{mfloat-abi=3Dsoft*:-lfloat} -lgcc"
> >>> -
> >>> --#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
> >>> -+#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
> >>> -
> >>> - #define LINUX_TARGET_LINK_SPEC  "%{h*} \
> >>> -    %{static:-Bstatic} \
> >>> -diff --git a/gcc/config/i386/linux.h b/gcc/config/i386/linux.h
> >>> -index 59132124d6b..336d158629c 100644
> >>> ---- a/gcc/config/i386/linux.h
> >>> -+++ b/gcc/config/i386/linux.h
> >>> -@@ -20,7 +20,7 @@ along with GCC; see the file COPYING3.  If not see
> >>> - <http://www.gnu.org/licenses/>.  */
> >>> -
> >>> - #define GNU_USER_LINK_EMULATION "elf_i386"
> >>> --#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
> >>> -+#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
> >>> -
> >>> - #undef MUSL_DYNAMIC_LINKER
> >>> - #define MUSL_DYNAMIC_LINKER "/lib/ld-musl-i386.so.1"
> >>> -diff --git a/gcc/config/i386/linux64.h b/gcc/config/i386/linux64.h
> >>> -index e65c404ff91..c34ded98481 100644
> >>> ---- a/gcc/config/i386/linux64.h
> >>> -+++ b/gcc/config/i386/linux64.h
> >>> -@@ -27,9 +27,9 @@ see the files COPYING3 and COPYING.RUNTIME respect=
ively.  If not, see
> >>> - #define GNU_USER_LINK_EMULATION64 "elf_x86_64"
> >>> - #define GNU_USER_LINK_EMULATIONX32 "elf32_x86_64"
> >>> -
> >>> --#define GLIBC_DYNAMIC_LINKER32 "/lib/ld-linux.so.2"
> >>> --#define GLIBC_DYNAMIC_LINKER64 "/lib64/ld-linux-x86-64.so.2"
> >>> --#define GLIBC_DYNAMIC_LINKERX32 "/libx32/ld-linux-x32.so.2"
> >>> -+#define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-linux.so.2"
> >>> -+#define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld-linux-x86-64.so.2=
"
> >>> -+#define GLIBC_DYNAMIC_LINKERX32 SYSTEMLIBS_DIR "ld-linux-x32.so.2"
> >>> -
> >>> - #undef MUSL_DYNAMIC_LINKER32
> >>> - #define MUSL_DYNAMIC_LINKER32 "/lib/ld-musl-i386.so.1"
> >>> -diff --git a/gcc/config/linux.h b/gcc/config/linux.h
> >>> -index b3a9e85e77f..2e683d0c430 100644
> >>> ---- a/gcc/config/linux.h
> >>> -+++ b/gcc/config/linux.h
> >>> -@@ -81,10 +81,10 @@ see the files COPYING3 and COPYING.RUNTIME respe=
ctively.  If not, see
> >>> -    GLIBC_DYNAMIC_LINKER must be defined for each target using them,=
 or
> >>> -    GLIBC_DYNAMIC_LINKER32 and GLIBC_DYNAMIC_LINKER64 for targets
> >>> -    supporting both 32-bit and 64-bit compilation.  */
> >>> --#define UCLIBC_DYNAMIC_LINKER "/lib/ld-uClibc.so.0"
> >>> --#define UCLIBC_DYNAMIC_LINKER32 "/lib/ld-uClibc.so.0"
> >>> --#define UCLIBC_DYNAMIC_LINKER64 "/lib/ld64-uClibc.so.0"
> >>> --#define UCLIBC_DYNAMIC_LINKERX32 "/lib/ldx32-uClibc.so.0"
> >>> -+#define UCLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-uClibc.so.0"
> >>> -+#define UCLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-uClibc.so.0"
> >>> -+#define UCLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld64-uClibc.so.0"
> >>> -+#define UCLIBC_DYNAMIC_LINKERX32 SYSTEMLIBS_DIR "ldx32-uClibc.so.0"
> >>> - #define BIONIC_DYNAMIC_LINKER "/system/bin/linker"
> >>> - #define BIONIC_DYNAMIC_LINKER32 "/system/bin/linker"
> >>> - #define BIONIC_DYNAMIC_LINKER64 "/system/bin/linker64"
> >>> -diff --git a/gcc/config/mips/linux.h b/gcc/config/mips/linux.h
> >>> -index 44132b8e44d..80505ad9f48 100644
> >>> ---- a/gcc/config/mips/linux.h
> >>> -+++ b/gcc/config/mips/linux.h
> >>> -@@ -22,20 +22,20 @@ along with GCC; see the file COPYING3.  If not s=
ee
> >>> - #define GNU_USER_LINK_EMULATIONN32 "elf32%{EB:b}%{EL:l}tsmipn32"
> >>> -
> >>> - #define GLIBC_DYNAMIC_LINKER32 \
> >>> --  "%{mnan=3D2008:/lib/ld-linux-mipsn8.so.1;:/lib/ld.so.1}"
> >>> -+  "%{mnan=3D2008:" SYSTEMLIBS_DIR "ld-linux-mipsn8.so.1;:" SYSTEMLI=
BS_DIR "ld.so.1}"
> >>> - #define GLIBC_DYNAMIC_LINKER64 \
> >>> --  "%{mnan=3D2008:/lib64/ld-linux-mipsn8.so.1;:/lib64/ld.so.1}"
> >>> -+  "%{mnan=3D2008:" SYSTEMLIBS_DIR "ld-linux-mipsn8.so.1;:" SYSTEMLI=
BS_DIR "ld.so.1}"
> >>> - #define GLIBC_DYNAMIC_LINKERN32 \
> >>> --  "%{mnan=3D2008:/lib32/ld-linux-mipsn8.so.1;:/lib32/ld.so.1}"
> >>> -+  "%{mnan=3D2008:" SYSTEMLIBS_DIR "ld-linux-mipsn8.so.1;:" SYSTEMLI=
BS_DIR "ld.so.1}"
> >>> -
> >>> - #undef UCLIBC_DYNAMIC_LINKER32
> >>> - #define UCLIBC_DYNAMIC_LINKER32 \
> >>> --  "%{mnan=3D2008:/lib/ld-uClibc-mipsn8.so.0;:/lib/ld-uClibc.so.0}"
> >>> -+  "%{mnan=3D2008:" SYSTEMLIBS_DIR "ld-uClibc-mipsn8.so.0;:" SYSTEML=
IBS_DIR "ld-uClibc.so.0}"
> >>> - #undef UCLIBC_DYNAMIC_LINKER64
> >>> - #define UCLIBC_DYNAMIC_LINKER64 \
> >>> --  "%{mnan=3D2008:/lib/ld64-uClibc-mipsn8.so.0;:/lib/ld64-uClibc.so.=
0}"
> >>> -+  "%{mnan=3D2008:" SYSTEMLIBS_DIR "ld64-uClibc-mipsn8.so.0;:" SYSTE=
MLIBS_DIR "ld64-uClibc.so.0}"
> >>> - #define UCLIBC_DYNAMIC_LINKERN32 \
> >>> --  "%{mnan=3D2008:/lib32/ld-uClibc-mipsn8.so.0;:/lib32/ld-uClibc.so.=
0}"
> >>> -+  "%{mnan=3D2008:" SYSTEMLIBS_DIR "ld-uClibc-mipsn8.so.0;:" SYSTEML=
IBS_DIR "ld-uClibc.so.0}"
> >>> -
> >>> - #undef MUSL_DYNAMIC_LINKER32
> >>> - #define MUSL_DYNAMIC_LINKER32 \
> >>> -diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64=
.h
> >>> -index 71e35b709ad..3b00ec0fcf0 100644
> >>> ---- a/gcc/config/rs6000/linux64.h
> >>> -+++ b/gcc/config/rs6000/linux64.h
> >>> -@@ -412,16 +412,11 @@ extern int dot_symbols;
> >>> - #undef        LINK_OS_DEFAULT_SPEC
> >>> - #define LINK_OS_DEFAULT_SPEC "%(link_os_linux)"
> >>> -
> >>> --#define GLIBC_DYNAMIC_LINKER32 "%(dynamic_linker_prefix)/lib/ld.so.=
1"
> >>> --
> >>> -+#define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld.so.1"
> >>> - #ifdef LINUX64_DEFAULT_ABI_ELFv2
> >>> --#define GLIBC_DYNAMIC_LINKER64 \
> >>> --"%{mabi=3Delfv1:%(dynamic_linker_prefix)/lib64/ld64.so.1;" \
> >>> --":%(dynamic_linker_prefix)/lib64/ld64.so.2}"
> >>> -+#define GLIBC_DYNAMIC_LINKER64 "%{mabi=3Delfv1:" SYSTEMLIBS_DIR "ld=
64.so.1;:" SYSTEMLIBS_DIR "ld64.so.2}"
> >>> - #else
> >>> --#define GLIBC_DYNAMIC_LINKER64 \
> >>> --"%{mabi=3Delfv2:%(dynamic_linker_prefix)/lib64/ld64.so.2;" \
> >>> --":%(dynamic_linker_prefix)/lib64/ld64.so.1}"
> >>> -+#define GLIBC_DYNAMIC_LINKER64 "%{mabi=3Delfv2:" SYSTEMLIBS_DIR "ld=
64.so.2;:" SYSTEMLIBS_DIR "ld64.so.1}"
> >>> - #endif
> >>> -
> >>> - #define MUSL_DYNAMIC_LINKER32 \
> >>> -@@ -429,8 +424,9 @@ extern int dot_symbols;
> >>> - #define MUSL_DYNAMIC_LINKER64 \
> >>> -   "/lib/ld-musl-powerpc64" MUSL_DYNAMIC_LINKER_E "%{msoft-float:-sf=
}.so.1"
> >>> -
> >>> --#define UCLIBC_DYNAMIC_LINKER32 "/lib/ld-uClibc.so.0"
> >>> --#define UCLIBC_DYNAMIC_LINKER64 "/lib/ld64-uClibc.so.0"
> >>> -+#define UCLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-uClibc.so.0"
> >>> -+#define UCLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld64-uClibc.so.0"
> >>> -+
> >>> - #if DEFAULT_LIBC =3D=3D LIBC_UCLIBC
> >>> - #define CHOOSE_DYNAMIC_LINKER(G, U, M) \
> >>> -   "%{mglibc:" G ";:%{mmusl:" M ";:" U "}}"
> >>> -diff --git a/gcc/config/sh/linux.h b/gcc/config/sh/linux.h
> >>> -index c30083423f2..196b82725f8 100644
> >>> ---- a/gcc/config/sh/linux.h
> >>> -+++ b/gcc/config/sh/linux.h
> >>> -@@ -64,7 +64,7 @@ along with GCC; see the file COPYING3.  If not see
> >>> -   "/lib/ld-musl-sh" MUSL_DYNAMIC_LINKER_E MUSL_DYNAMIC_LINKER_FP \
> >>> -   "%{mfdpic:-fdpic}.so.1"
> >>> -
> >>> --#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
> >>> -+#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
> >>> -
> >>> - #undef SUBTARGET_LINK_EMUL_SUFFIX
> >>> - #define SUBTARGET_LINK_EMUL_SUFFIX "%{mfdpic:_fd;:_linux}"
> >>> -diff --git a/gcc/config/sparc/linux.h b/gcc/config/sparc/linux.h
> >>> -index ce084656fca..bed6300cb2a 100644
> >>> ---- a/gcc/config/sparc/linux.h
> >>> -+++ b/gcc/config/sparc/linux.h
> >>> -@@ -83,7 +83,7 @@ extern const char *host_detect_local_cpu (int argc=
, const char **argv);
> >>> -    When the -shared link option is used a final link is not being
> >>> -    done.  */
> >>> -
> >>> --#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
> >>> -+#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
> >>> -
> >>> - #undef  LINK_SPEC
> >>> - #define LINK_SPEC "-m elf32_sparc %{shared:-shared} \
> >>> -diff --git a/gcc/config/sparc/linux64.h b/gcc/config/sparc/linux64.h
> >>> -index 573ce8a9a4c..6749f6b5d9c 100644
> >>> ---- a/gcc/config/sparc/linux64.h
> >>> -+++ b/gcc/config/sparc/linux64.h
> >>> -@@ -84,8 +84,8 @@ along with GCC; see the file COPYING3.  If not see
> >>> -    When the -shared link option is used a final link is not being
> >>> -    done.  */
> >>> -
> >>> --#define GLIBC_DYNAMIC_LINKER32 "/lib/ld-linux.so.2"
> >>> --#define GLIBC_DYNAMIC_LINKER64 "/lib64/ld-linux.so.2"
> >>> -+#define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-linux.so.2"
> >>> -+#define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld-linux.so.2"
> >>> -
> >>> - #ifdef SPARC_BI_ARCH
> >>> -
> >>> ---
> >>> -2.12.2
> >>> -
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.3/0021-gcc-Fix-argument-=
list-too-long-error.patch b/meta/recipes-devtools/gcc/gcc-7.3/0021-gcc-Fix-=
argument-list-too-long-error.patch
> >>> deleted file mode 100644
> >>> index 4e56214..0000000
> >>> --- a/meta/recipes-devtools/gcc/gcc-7.3/0021-gcc-Fix-argument-list-to=
o-long-error.patch
> >>> +++ /dev/null
> >>> @@ -1,40 +0,0 @@
> >>> -From 80c24247fed52c1269791088090bc0fa85280983 Mon Sep 17 00:00:00 20=
01
> >>> -From: Khem Raj <raj.khem@gmail.com>
> >>> -Date: Fri, 29 Mar 2013 09:26:37 +0400
> >>> -Subject: [PATCH 21/47] gcc: Fix argument list too long error.
> >>> -
> >>> -There would be an "Argument list too long" error when the
> >>> -build directory is longer than 200, this is caused by:
> >>> -
> >>> -headers=3D`echo $(PLUGIN_HEADERS) | tr ' ' '\012' | sort -u`
> >>> -
> >>> -The PLUGIN_HEADERS is too long before sort, so the "echo" can't hand=
le
> >>> -it, use the $(sort list) of GNU make which can handle the too long l=
ist
> >>> -would fix the problem, the header would be short enough after sorted=
.
> >>> -The "tr ' ' '\012'" was used for translating the space to "\n", the
> >>> -$(sort list) doesn't need this.
> >>> -
> >>> -Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> >>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> -
> >>> -Upstream-Status: Pending
> >>> ----
> >>> - gcc/Makefile.in | 2 +-
> >>> - 1 file changed, 1 insertion(+), 1 deletion(-)
> >>> -
> >>> -diff --git a/gcc/Makefile.in b/gcc/Makefile.in
> >>> -index 7b590c9bbd3..23cca7f0d5a 100644
> >>> ---- a/gcc/Makefile.in
> >>> -+++ b/gcc/Makefile.in
> >>> -@@ -3459,7 +3459,7 @@ install-plugin: installdirs lang.install-plugi=
n s-header-vars install-gengtype
> >>> - # We keep the directory structure for files in config or c-family a=
nd .def
> >>> - # files. All other files are flattened to a single directory.
> >>> -       $(mkinstalldirs) $(DESTDIR)$(plugin_includedir)
> >>> --      headers=3D`echo $(PLUGIN_HEADERS) $$(cd $(srcdir); echo *.h *=
.def) | tr ' ' '\012' | sort -u`; \
> >>> -+      headers=3D"$(sort $(PLUGIN_HEADERS) $$(cd $(srcdir); echo *.h=
 *.def))"; \
> >>> -       srcdirstrip=3D`echo "$(srcdir)" | sed 's/[].[^$$\\*|]/\\\\&/g=
'`; \
> >>> -       for file in $$headers; do \
> >>> -         if [ -f $$file ] ; then \
> >>> ---
> >>> -2.12.2
> >>> -
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.3/0022-Disable-sdt.patch=
 b/meta/recipes-devtools/gcc/gcc-7.3/0022-Disable-sdt.patch
> >>> deleted file mode 100644
> >>> index 871f195..0000000
> >>> --- a/meta/recipes-devtools/gcc/gcc-7.3/0022-Disable-sdt.patch
> >>> +++ /dev/null
> >>> @@ -1,113 +0,0 @@
> >>> -From 3021fec485f44478a3d5fffb4adac13d831fcdc1 Mon Sep 17 00:00:00 20=
01
> >>> -From: Khem Raj <raj.khem@gmail.com>
> >>> -Date: Fri, 29 Mar 2013 09:28:10 +0400
> >>> -Subject: [PATCH 22/47] Disable sdt.
> >>> -
> >>> -We don't list dtrace in DEPENDS so we shouldn't be depending on this=
 header.
> >>> -It may or may not exist from preivous builds though. To be determins=
tic, disable
> >>> -sdt.h usage always. This avoids build failures if the header is remo=
ved after configure
> >>> -but before libgcc is compiled for example.
> >>> -
> >>> -RP 2012/8/7
> >>> -
> >>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> -
> >>> -Disable sdt for libstdc++-v3.
> >>> -
> >>> -Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> >>> -
> >>> -Upstream-Status: Inappropriate [hack]
> >>> ----
> >>> - gcc/configure             | 12 ++++++------
> >>> - gcc/configure.ac          | 18 +++++++++---------
> >>> - libstdc++-v3/configure    |  6 +++---
> >>> - libstdc++-v3/configure.ac |  2 +-
> >>> - 4 files changed, 19 insertions(+), 19 deletions(-)
> >>> -
> >>> -diff --git a/gcc/configure b/gcc/configure
> >>> -index b5ac1552541..08b2f63c7fa 100755
> >>> ---- a/gcc/configure
> >>> -+++ b/gcc/configure
> >>> -@@ -28967,12 +28967,12 @@ fi
> >>> - { $as_echo "$as_me:${as_lineno-$LINENO}: checking sys/sdt.h in the =
target C library" >&5
> >>> - $as_echo_n "checking sys/sdt.h in the target C library... " >&6; }
> >>> - have_sys_sdt_h=3Dno
> >>> --if test -f $target_header_dir/sys/sdt.h; then
> >>> --  have_sys_sdt_h=3Dyes
> >>> --
> >>> --$as_echo "#define HAVE_SYS_SDT_H 1" >>confdefs.h
> >>> --
> >>> --fi
> >>> -+#if test -f $target_header_dir/sys/sdt.h; then
> >>> -+#  have_sys_sdt_h=3Dyes
> >>> -+#
> >>> -+#$as_echo "#define HAVE_SYS_SDT_H 1" >>confdefs.h
> >>> -+#
> >>> -+#fi
> >>> - { $as_echo "$as_me:${as_lineno-$LINENO}: result: $have_sys_sdt_h" >=
&5
> >>> - $as_echo "$have_sys_sdt_h" >&6; }
> >>> -
> >>> -diff --git a/gcc/configure.ac b/gcc/configure.ac
> >>> -index cb1479d1ef4..0581fe963dc 100644
> >>> ---- a/gcc/configure.ac
> >>> -+++ b/gcc/configure.ac
> >>> -@@ -5754,15 +5754,15 @@ fi
> >>> - AC_SUBST([enable_default_ssp])
> >>> -
> >>> - # Test for <sys/sdt.h> on the target.
> >>> --GCC_TARGET_TEMPLATE([HAVE_SYS_SDT_H])
> >>> --AC_MSG_CHECKING(sys/sdt.h in the target C library)
> >>> --have_sys_sdt_h=3Dno
> >>> --if test -f $target_header_dir/sys/sdt.h; then
> >>> --  have_sys_sdt_h=3Dyes
> >>> --  AC_DEFINE(HAVE_SYS_SDT_H, 1,
> >>> --            [Define if your target C library provides sys/sdt.h])
> >>> --fi
> >>> --AC_MSG_RESULT($have_sys_sdt_h)
> >>> -+#GCC_TARGET_TEMPLATE([HAVE_SYS_SDT_H])
> >>> -+#AC_MSG_CHECKING(sys/sdt.h in the target C library)
> >>> -+#have_sys_sdt_h=3Dno
> >>> -+#if test -f $target_header_dir/sys/sdt.h; then
> >>> -+#  have_sys_sdt_h=3Dyes
> >>> -+#  AC_DEFINE(HAVE_SYS_SDT_H, 1,
> >>> -+#            [Define if your target C library provides sys/sdt.h])
> >>> -+#fi
> >>> -+#AC_MSG_RESULT($have_sys_sdt_h)
> >>> -
> >>> - # Check if TFmode long double should be used by default or not.
> >>> - # Some glibc targets used DFmode long double, but with glibc 2.4
> >>> -diff --git a/libstdc++-v3/configure b/libstdc++-v3/configure
> >>> -index fb7e126c0b0..a18057feb88 100755
> >>> ---- a/libstdc++-v3/configure
> >>> -+++ b/libstdc++-v3/configure
> >>> -@@ -21856,11 +21856,11 @@ ac_compile=3D'$CC -c $CFLAGS $CPPFLAGS con=
ftest.$ac_ext >&5'
> >>> - ac_link=3D'$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS con=
ftest.$ac_ext $LIBS >&5'
> >>> - ac_compiler_gnu=3D$ac_cv_c_compiler_gnu
> >>> -
> >>> --  if test $glibcxx_cv_sys_sdt_h =3D yes; then
> >>> -+#  if test $glibcxx_cv_sys_sdt_h =3D yes; then
> >>> -
> >>> --$as_echo "#define HAVE_SYS_SDT_H 1" >>confdefs.h
> >>> -+#$as_echo "#define HAVE_SYS_SDT_H 1" >>confdefs.h
> >>> -
> >>> --  fi
> >>> -+#  fi
> >>> -   { $as_echo "$as_me:${as_lineno-$LINENO}: result: $glibcxx_cv_sys_=
sdt_h" >&5
> >>> - $as_echo "$glibcxx_cv_sys_sdt_h" >&6; }
> >>> -
> >>> -diff --git a/libstdc++-v3/configure.ac b/libstdc++-v3/configure.ac
> >>> -index 8e973503be0..a46d25e740d 100644
> >>> ---- a/libstdc++-v3/configure.ac
> >>> -+++ b/libstdc++-v3/configure.ac
> >>> -@@ -230,7 +230,7 @@ GLIBCXX_CHECK_SC_NPROCESSORS_ONLN
> >>> - GLIBCXX_CHECK_SC_NPROC_ONLN
> >>> - GLIBCXX_CHECK_PTHREADS_NUM_PROCESSORS_NP
> >>> - GLIBCXX_CHECK_SYSCTL_HW_NCPU
> >>> --GLIBCXX_CHECK_SDT_H
> >>> -+#GLIBCXX_CHECK_SDT_H
> >>> -
> >>> - # Check for available headers.
> >>> - AC_CHECK_HEADERS([endian.h execinfo.h float.h fp.h ieeefp.h inttype=
s.h \
> >>> ---
> >>> -2.12.2
> >>> -
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.3/0023-libtool.patch b/m=
eta/recipes-devtools/gcc/gcc-7.3/0023-libtool.patch
> >>> deleted file mode 100644
> >>> index 27dfb1f..0000000
> >>> --- a/meta/recipes-devtools/gcc/gcc-7.3/0023-libtool.patch
> >>> +++ /dev/null
> >>> @@ -1,42 +0,0 @@
> >>> -From e79a4f8169e836c8deabca5a45884cfe11d07847 Mon Sep 17 00:00:00 20=
01
> >>> -From: Khem Raj <raj.khem@gmail.com>
> >>> -Date: Fri, 29 Mar 2013 09:29:11 +0400
> >>> -Subject: [PATCH 23/47] libtool
> >>> -
> >>> -libstdc++ from gcc-runtime gets created with -rpath=3D/usr/lib/../li=
b for qemux86-64
> >>> -when running on am x86_64 build host.
> >>> -
> >>> -This patch stops this speading to libdir in the libstdc++.la file wi=
thin libtool.
> >>> -Arguably, it shouldn't be passing this into libtool in the first pla=
ce but
> >>> -for now this resolves the nastiest problems this causes.
> >>> -
> >>> -func_normal_abspath would resolve an empty path to `pwd` so we need
> >>> -to filter the zero case.
> >>> -
> >>> -RP 2012/8/24
> >>> -
> >>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> -
> >>> -Upstream-Status: Pending
> >>> ----
> >>> - ltmain.sh | 4 ++++
> >>> - 1 file changed, 4 insertions(+)
> >>> -
> >>> -diff --git a/ltmain.sh b/ltmain.sh
> >>> -index 9503ec85d70..0121fba707f 100644
> >>> ---- a/ltmain.sh
> >>> -+++ b/ltmain.sh
> >>> -@@ -6359,6 +6359,10 @@ func_mode_link ()
> >>> -       func_warning "ignoring multiple \`-rpath's for a libtool libr=
ary"
> >>> -
> >>> -       install_libdir=3D"$1"
> >>> -+      if test -n "$install_libdir"; then
> >>> -+      func_normal_abspath "$install_libdir"
> >>> -+      install_libdir=3D$func_normal_abspath_result
> >>> -+      fi
> >>> -
> >>> -       oldlibs=3D
> >>> -       if test -z "$rpath"; then
> >>> ---
> >>> -2.12.2
> >>> -
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.3/0024-gcc-armv4-pass-fi=
x-v4bx-to-linker-to-support-EABI.patch b/meta/recipes-devtools/gcc/gcc-7.3/=
0024-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
> >>> deleted file mode 100644
> >>> index aa1e1bb..0000000
> >>> --- a/meta/recipes-devtools/gcc/gcc-7.3/0024-gcc-armv4-pass-fix-v4bx-=
to-linker-to-support-EABI.patch
> >>> +++ /dev/null
> >>> @@ -1,43 +0,0 @@
> >>> -From 74d8dc48cb185e304c60067b4d8b50447ec328ec Mon Sep 17 00:00:00 20=
01
> >>> -From: Khem Raj <raj.khem@gmail.com>
> >>> -Date: Fri, 29 Mar 2013 09:30:32 +0400
> >>> -Subject: [PATCH 24/47] gcc: armv4: pass fix-v4bx to linker to suppor=
t EABI.
> >>> -
> >>> -The LINK_SPEC for linux gets overwritten by linux-eabi.h which
> >>> -means the value of TARGET_FIX_V4BX_SPEC gets lost and as a result
> >>> -the option is not passed to linker when chosing march=3Darmv4
> >>> -This patch redefines this in linux-eabi.h and reinserts it
> >>> -for eabi defaulting toolchains.
> >>> -
> >>> -We might want to send it upstream.
> >>> -
> >>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> -
> >>> -Upstream-Status: Pending
> >>> ----
> >>> - gcc/config/arm/linux-eabi.h | 6 +++++-
> >>> - 1 file changed, 5 insertions(+), 1 deletion(-)
> >>> -
> >>> -diff --git a/gcc/config/arm/linux-eabi.h b/gcc/config/arm/linux-eabi=
.h
> >>> -index fbac9a9d994..5a51a8a7095 100644
> >>> ---- a/gcc/config/arm/linux-eabi.h
> >>> -+++ b/gcc/config/arm/linux-eabi.h
> >>> -@@ -88,10 +88,14 @@
> >>> - #define MUSL_DYNAMIC_LINKER \
> >>> -   "/lib/ld-musl-arm" MUSL_DYNAMIC_LINKER_E "%{mfloat-abi=3Dhard:hf}=
.so.1"
> >>> -
> >>> -+/* For armv4 we pass --fix-v4bx to linker to support EABI */
> >>> -+#undef TARGET_FIX_V4BX_SPEC
> >>> -+#define TARGET_FIX_V4BX_SPEC "%{mcpu=3Darm8|mcpu=3Darm810|mcpu=3Dst=
rongarm*|march=3Darmv4: --fix-v4bx}"
> >>> -+
> >>> - /* At this point, bpabi.h will have clobbered LINK_SPEC.  We want t=
o
> >>> -    use the GNU/Linux version, not the generic BPABI version.  */
> >>> - #undef  LINK_SPEC
> >>> --#define LINK_SPEC EABI_LINK_SPEC                                   =
   \
> >>> -+#define LINK_SPEC TARGET_FIX_V4BX_SPEC EABI_LINK_SPEC              =
   \
> >>> -   LINUX_OR_ANDROID_LD (LINUX_TARGET_LINK_SPEC,                     =
           \
> >>> -                      LINUX_TARGET_LINK_SPEC " " ANDROID_LINK_SPEC)
> >>> -
> >>> ---
> >>> -2.12.2
> >>> -
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.3/0025-Use-the-multilib-=
config-files-from-B-instead-of-usin.patch b/meta/recipes-devtools/gcc/gcc-7=
.3/0025-Use-the-multilib-config-files-from-B-instead-of-usin.patch
> >>> deleted file mode 100644
> >>> index b234132..0000000
> >>> --- a/meta/recipes-devtools/gcc/gcc-7.3/0025-Use-the-multilib-config-=
files-from-B-instead-of-usin.patch
> >>> +++ /dev/null
> >>> @@ -1,102 +0,0 @@
> >>> -From ac50dc3010a66220ad483c09efe270bb3f4c9424 Mon Sep 17 00:00:00 20=
01
> >>> -From: Khem Raj <raj.khem@gmail.com>
> >>> -Date: Fri, 29 Mar 2013 09:33:04 +0400
> >>> -Subject: [PATCH 25/47] Use the multilib config files from ${B} inste=
ad of
> >>> - using the ones from ${S}
> >>> -
> >>> -Use the multilib config files from ${B} instead of using the ones fr=
om ${S}
> >>> -so that the source can be shared between gcc-cross-initial,
> >>> -gcc-cross-intermediate, gcc-cross, gcc-runtime, and also the sdk bui=
ld.
> >>> -
> >>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> -Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> >>> -
> >>> -Upstream-Status: Inappropriate [configuration]
> >>> ----
> >>> - gcc/configure    | 22 ++++++++++++++++++----
> >>> - gcc/configure.ac | 22 ++++++++++++++++++----
> >>> - 2 files changed, 36 insertions(+), 8 deletions(-)
> >>> -
> >>> -diff --git a/gcc/configure b/gcc/configure
> >>> -index 08b2f63c7fa..6ba391ed068 100755
> >>> ---- a/gcc/configure
> >>> -+++ b/gcc/configure
> >>> -@@ -12130,10 +12130,20 @@ done
> >>> - tmake_file_=3D
> >>> - for f in ${tmake_file}
> >>> - do
> >>> --      if test -f ${srcdir}/config/$f
> >>> --      then
> >>> --              tmake_file_=3D"${tmake_file_} \$(srcdir)/config/$f"
> >>> --      fi
> >>> -+  case $f in
> >>> -+    */t-linux64 )
> >>> -+       if test -f ./config/$f
> >>> -+       then
> >>> -+         tmake_file_=3D"${tmake_file_} ./config/$f"
> >>> -+       fi
> >>> -+       ;;
> >>> -+    * )
> >>> -+       if test -f ${srcdir}/config/$f
> >>> -+       then
> >>> -+         tmake_file_=3D"${tmake_file_} \$(srcdir)/config/$f"
> >>> -+       fi
> >>> -+       ;;
> >>> -+  esac
> >>> - done
> >>> - tmake_file=3D"${tmake_file_}"
> >>> -
> >>> -@@ -12144,6 +12154,10 @@ tm_file_list=3D"options.h"
> >>> - tm_include_list=3D"options.h insn-constants.h"
> >>> - for f in $tm_file; do
> >>> -   case $f in
> >>> -+    */linux64.h )
> >>> -+       tm_file_list=3D"${tm_file_list} ./config/$f"
> >>> -+       tm_include_list=3D"${tm_include_list} ./config/$f"
> >>> -+       ;;
> >>> -     ./* )
> >>> -        f=3D`echo $f | sed 's/^..//'`
> >>> -        tm_file_list=3D"${tm_file_list} $f"
> >>> -diff --git a/gcc/configure.ac b/gcc/configure.ac
> >>> -index 0581fe963dc..8551a412df3 100644
> >>> ---- a/gcc/configure.ac
> >>> -+++ b/gcc/configure.ac
> >>> -@@ -1902,10 +1902,20 @@ done
> >>> - tmake_file_=3D
> >>> - for f in ${tmake_file}
> >>> - do
> >>> --      if test -f ${srcdir}/config/$f
> >>> --      then
> >>> --              tmake_file_=3D"${tmake_file_} \$(srcdir)/config/$f"
> >>> --      fi
> >>> -+  case $f in
> >>> -+    */t-linux64 )
> >>> -+       if test -f ./config/$f
> >>> -+       then
> >>> -+         tmake_file_=3D"${tmake_file_} ./config/$f"
> >>> -+       fi
> >>> -+       ;;
> >>> -+    * )
> >>> -+       if test -f ${srcdir}/config/$f
> >>> -+       then
> >>> -+         tmake_file_=3D"${tmake_file_} \$(srcdir)/config/$f"
> >>> -+       fi
> >>> -+       ;;
> >>> -+  esac
> >>> - done
> >>> - tmake_file=3D"${tmake_file_}"
> >>> -
> >>> -@@ -1916,6 +1926,10 @@ tm_file_list=3D"options.h"
> >>> - tm_include_list=3D"options.h insn-constants.h"
> >>> - for f in $tm_file; do
> >>> -   case $f in
> >>> -+    */linux64.h )
> >>> -+       tm_file_list=3D"${tm_file_list} ./config/$f"
> >>> -+       tm_include_list=3D"${tm_include_list} ./config/$f"
> >>> -+       ;;
> >>> -     ./* )
> >>> -        f=3D`echo $f | sed 's/^..//'`
> >>> -        tm_file_list=3D"${tm_file_list} $f"
> >>> ---
> >>> -2.12.2
> >>> -
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.3/0026-Avoid-using-libdi=
r-from-.la-which-usually-points-to-.patch b/meta/recipes-devtools/gcc/gcc-7=
.3/0026-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
> >>> deleted file mode 100644
> >>> index fe24713..0000000
> >>> --- a/meta/recipes-devtools/gcc/gcc-7.3/0026-Avoid-using-libdir-from-=
.la-which-usually-points-to-.patch
> >>> +++ /dev/null
> >>> @@ -1,31 +0,0 @@
> >>> -From 9fab47d8662986ad887d9eddc39fcbe25e576383 Mon Sep 17 00:00:00 20=
01
> >>> -From: Khem Raj <raj.khem@gmail.com>
> >>> -Date: Fri, 20 Feb 2015 09:39:38 +0000
> >>> -Subject: [PATCH 26/47] Avoid using libdir from .la which usually poi=
nts to a
> >>> - host path
> >>> -
> >>> -Upstream-Status: Inappropriate [embedded specific]
> >>> -
> >>> -Signed-off-by: Jonathan Liu <net147@gmail.com>
> >>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> ----
> >>> - ltmain.sh | 3 +++
> >>> - 1 file changed, 3 insertions(+)
> >>> -
> >>> -diff --git a/ltmain.sh b/ltmain.sh
> >>> -index 0121fba707f..52bdbdb5f9c 100644
> >>> ---- a/ltmain.sh
> >>> -+++ b/ltmain.sh
> >>> -@@ -5628,6 +5628,9 @@ func_mode_link ()
> >>> -           absdir=3D"$abs_ladir"
> >>> -           libdir=3D"$abs_ladir"
> >>> -         else
> >>> -+          # Instead of using libdir from .la which usually points t=
o a host path,
> >>> -+          # use the path the .la is contained in.
> >>> -+          libdir=3D"$abs_ladir"
> >>> -           dir=3D"$libdir"
> >>> -           absdir=3D"$libdir"
> >>> -         fi
> >>> ---
> >>> -2.12.2
> >>> -
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.3/0027-export-CPP.patch =
b/meta/recipes-devtools/gcc/gcc-7.3/0027-export-CPP.patch
> >>> deleted file mode 100644
> >>> index 4f9e1f0..0000000
> >>> --- a/meta/recipes-devtools/gcc/gcc-7.3/0027-export-CPP.patch
> >>> +++ /dev/null
> >>> @@ -1,53 +0,0 @@
> >>> -From fa6a46fdf73de7eacd289c084bbde6643b23f73b Mon Sep 17 00:00:00 20=
01
> >>> -From: Khem Raj <raj.khem@gmail.com>
> >>> -Date: Fri, 20 Feb 2015 09:40:59 +0000
> >>> -Subject: [PATCH 27/47] export CPP
> >>> -
> >>> -The OE environment sets and exports CPP as being the target gcc. Whe=
n
> >>> -building gcc-cross-canadian for a mingw targetted sdk, the following=
 can be found
> >>> -in build.x86_64-pokysdk-mingw32.i586-poky-linux/build-x86_64-linux/l=
ibiberty/config.log:
> >>> -
> >>> -configure:3641: checking for _FILE_OFFSET_BITS value needed for larg=
e files
> >>> -configure:3666: gcc  -c -isystem/media/build1/poky/build/tmp/sysroot=
s/x86_64-linux/usr/include -O2 -pipe  conftest.c >&5
> >>> -configure:3666: $? =3D 0
> >>> -configure:3698: result: no
> >>> -configure:3786: checking how to run the C preprocessor
> >>> -configure:3856: result: x86_64-pokysdk-mingw32-gcc -E --sysroot=3D/m=
edia/build1/poky/build/tmp/sysroots/x86_64-nativesdk-mingw32-pokysdk-mingw3=
2
> >>> -configure:3876: x86_64-pokysdk-mingw32-gcc -E --sysroot=3D/media/bui=
ld1/poky/build/tmp/sysroots/x86_64-nativesdk-mingw32-pokysdk-mingw32 confte=
st.c
> >>> -configure:3876: $? =3D 0
> >>> -
> >>> -Note this is a *build* target (in build-x86_64-linux) so it should b=
e
> >>> -using the host "gcc", not x86_64-pokysdk-mingw32-gcc. Since the ming=
w32
> >>> -headers are very different, using the wrong cpp is a real problem. I=
t is leaking
> >>> -into configure through the CPP variable. Ultimately this leads to bu=
ild
> >>> -failures related to not being able to include a process.h file for p=
em-unix.c.
> >>> -
> >>> -The fix is to ensure we export a sane CPP value into the build
> >>> -environment when using build targets. We could define a CPP_FOR_BUIL=
D value which may be
> >>> -the version which needs to be upstreamed but for now, this fix is go=
od enough to
> >>> -avoid the problem.
> >>> -
> >>> -RP 22/08/2013
> >>> -
> >>> -Upstream-Status: Pending
> >>> -
> >>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> ----
> >>> - Makefile.in | 1 +
> >>> - 1 file changed, 1 insertion(+)
> >>> -
> >>> -diff --git a/Makefile.in b/Makefile.in
> >>> -index b824e0a0ca1..e34e9555388 100644
> >>> ---- a/Makefile.in
> >>> -+++ b/Makefile.in
> >>> -@@ -149,6 +149,7 @@ BUILD_EXPORTS =3D \
> >>> -       AR=3D"$(AR_FOR_BUILD)"; export AR; \
> >>> -       AS=3D"$(AS_FOR_BUILD)"; export AS; \
> >>> -       CC=3D"$(CC_FOR_BUILD)"; export CC; \
> >>> -+      CPP=3D"$(CC_FOR_BUILD) -E"; export CPP; \
> >>> -       CFLAGS=3D"$(CFLAGS_FOR_BUILD)"; export CFLAGS; \
> >>> -       CONFIG_SHELL=3D"$(SHELL)"; export CONFIG_SHELL; \
> >>> -       CXX=3D"$(CXX_FOR_BUILD)"; export CXX; \
> >>> ---
> >>> -2.12.2
> >>> -
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.3/0028-Enable-SPE-AltiVe=
c-generation-on-powepc-linux-target.patch b/meta/recipes-devtools/gcc/gcc-7=
.3/0028-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
> >>> deleted file mode 100644
> >>> index b903349..0000000
> >>> --- a/meta/recipes-devtools/gcc/gcc-7.3/0028-Enable-SPE-AltiVec-gener=
ation-on-powepc-linux-target.patch
> >>> +++ /dev/null
> >>> @@ -1,56 +0,0 @@
> >>> -From 2c05b4072f982df8002d61327837e18a724e934f Mon Sep 17 00:00:00 20=
01
> >>> -From: Alexandru-Cezar Sardan <alexandru.sardan@freescale.com>
> >>> -Date: Wed, 5 Feb 2014 16:52:31 +0200
> >>> -Subject: [PATCH 28/47] Enable SPE & AltiVec generation on powepc*lin=
ux target
> >>> -
> >>> -When is configured with --target=3Dpowerpc-linux, the resulting GCC =
will
> >>> -not be able to generate code for SPE targets (e500v1/v2).
> >>> -GCC configured with --target=3Dpowerpc-linuxspe will not be able to
> >>> -generate AltiVec instructions (for e6500).
> >>> -This patch modifies the configured file such that SPE or AltiVec cod=
e
> >>> -can be generated when gcc is configured with --target=3Dpowerpc-linu=
x.
> >>> -The ABI and speciffic instructions can be selected through the
> >>> -"-mabi=3Dspe or -mabi=3Daltivec" and the "-mspe or -maltivec" parame=
ters.
> >>> -
> >>> -Upstream-Status: Inappropriate [configuration]
> >>> -
> >>> -Signed-off-by: Alexandru-Cezar Sardan <alexandru.sardan@freescale.co=
m>
> >>> ----
> >>> - gcc/config.gcc               | 9 ++++++++-
> >>> - gcc/config/rs6000/linuxspe.h | 3 ---
> >>> - 2 files changed, 8 insertions(+), 4 deletions(-)
> >>> -
> >>> -diff --git a/gcc/config.gcc b/gcc/config.gcc
> >>> -index 5e45f4b5199..9b381dfd9af 100644
> >>> ---- a/gcc/config.gcc
> >>> -+++ b/gcc/config.gcc
> >>> -@@ -2415,7 +2415,14 @@ powerpc-*-rtems*)
> >>> -       tmake_file=3D"${tmake_file} rs6000/t-fprules rs6000/t-rtems r=
s6000/t-ppccomm"
> >>> -       ;;
> >>> - powerpc*-*-linux*)
> >>> --      tm_file=3D"${tm_file} dbxelf.h elfos.h gnu-user.h freebsd-spe=
c.h rs6000/sysv4.h"
> >>> -+      case ${target} in
> >>> -+          powerpc*-*-linux*spe* | powerpc*-*-linux*altivec*)
> >>> -+              tm_file=3D"${tm_file} dbxelf.h elfos.h gnu-user.h fre=
ebsd-spec.h rs6000/sysv4.h"
> >>> -+              ;;
> >>> -+          *)
> >>> -+              tm_file=3D"${tm_file} dbxelf.h elfos.h gnu-user.h fre=
ebsd-spec.h rs6000/sysv4.h rs6000/linuxaltivec.h rs6000/linuxspe.h rs6000/e=
500.h"
> >>> -+              ;;
> >>> -+      esac
> >>> -       extra_options=3D"${extra_options} rs6000/sysv4.opt"
> >>> -       tmake_file=3D"${tmake_file} rs6000/t-fprules rs6000/t-ppccomm=
"
> >>> -       extra_objs=3D"$extra_objs rs6000-linux.o"
> >>> -diff --git a/gcc/config/rs6000/linuxspe.h b/gcc/config/rs6000/linuxs=
pe.h
> >>> -index 92efabfe664..6d486451a7e 100644
> >>> ---- a/gcc/config/rs6000/linuxspe.h
> >>> -+++ b/gcc/config/rs6000/linuxspe.h
> >>> -@@ -27,6 +27,3 @@
> >>> - #undef        TARGET_DEFAULT
> >>> - #define TARGET_DEFAULT MASK_STRICT_ALIGN
> >>> - #endif
> >>> --
> >>> --#undef  ASM_DEFAULT_SPEC
> >>> --#define       ASM_DEFAULT_SPEC "-mppc -mspe -me500"
> >>> ---
> >>> -2.12.2
> >>> -
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.3/0029-Disable-the-MULTI=
LIB_OSDIRNAMES-and-other-multilib-o.patch b/meta/recipes-devtools/gcc/gcc-7=
.3/0029-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
> >>> deleted file mode 100644
> >>> index 7306a28..0000000
> >>> --- a/meta/recipes-devtools/gcc/gcc-7.3/0029-Disable-the-MULTILIB_OSD=
IRNAMES-and-other-multilib-o.patch
> >>> +++ /dev/null
> >>> @@ -1,42 +0,0 @@
> >>> -From ec0f843b86c0f76bc5ebb20fafbc4aae1be4db61 Mon Sep 17 00:00:00 20=
01
> >>> -From: Khem Raj <raj.khem@gmail.com>
> >>> -Date: Fri, 20 Feb 2015 10:21:55 +0000
> >>> -Subject: [PATCH 29/47] Disable the MULTILIB_OSDIRNAMES and other mul=
tilib
> >>> - options.
> >>> -
> >>> -Hard coding the MULTILIB_OSDIRNAMES with ../lib64 is causing problem=
s on
> >>> -systems where the libdir is NOT set to /lib64.  This is allowed by t=
he
> >>> -ABI, as
> >>> -long as the dynamic loader is present in /lib.
> >>> -
> >>> -We simply want to use the default rules in gcc to find and configure=
 the
> >>> -normal libdir.
> >>> -
> >>> -Upstream-Status: Inappropriate[OE-Specific]
> >>> -
> >>> -Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> >>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> ----
> >>> - gcc/config/aarch64/t-aarch64-linux | 8 ++++----
> >>> - 1 file changed, 4 insertions(+), 4 deletions(-)
> >>> -
> >>> -diff --git a/gcc/config/aarch64/t-aarch64-linux b/gcc/config/aarch64=
/t-aarch64-linux
> >>> -index ab064ab6f22..f4b1f98b216 100644
> >>> ---- a/gcc/config/aarch64/t-aarch64-linux
> >>> -+++ b/gcc/config/aarch64/t-aarch64-linux
> >>> -@@ -21,8 +21,8 @@
> >>> - LIB1ASMSRC   =3D aarch64/lib1funcs.asm
> >>> - LIB1ASMFUNCS =3D _aarch64_sync_cache_range
> >>> -
> >>> --AARCH_BE =3D $(if $(findstring TARGET_BIG_ENDIAN_DEFAULT=3D1, $(tm_=
defines)),_be)
> >>> --MULTILIB_OSDIRNAMES =3D mabi.lp64=3D../lib64$(call if_multiarch,:aa=
rch64$(AARCH_BE)-linux-gnu)
> >>> --MULTIARCH_DIRNAME =3D $(call if_multiarch,aarch64$(AARCH_BE)-linux-=
gnu)
> >>> -+#AARCH_BE =3D $(if $(findstring TARGET_BIG_ENDIAN_DEFAULT=3D1, $(tm=
_defines)),_be)
> >>> -+#MULTILIB_OSDIRNAMES =3D mabi.lp64=3D../lib64$(call if_multiarch,:a=
arch64$(AARCH_BE)-linux-gnu)
> >>> -+#MULTIARCH_DIRNAME =3D $(call if_multiarch,aarch64$(AARCH_BE)-linux=
-gnu)
> >>> -
> >>> --MULTILIB_OSDIRNAMES +=3D mabi.ilp32=3D../libilp32
> >>> -+#MULTILIB_OSDIRNAMES +=3D mabi.ilp32=3D../libilp32
> >>> ---
> >>> -2.12.2
> >>> -
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.3/0030-Ensure-target-gcc=
-headers-can-be-included.patch b/meta/recipes-devtools/gcc/gcc-7.3/0030-Ens=
ure-target-gcc-headers-can-be-included.patch
> >>> deleted file mode 100644
> >>> index 568ba95..0000000
> >>> --- a/meta/recipes-devtools/gcc/gcc-7.3/0030-Ensure-target-gcc-header=
s-can-be-included.patch
> >>> +++ /dev/null
> >>> @@ -1,98 +0,0 @@
> >>> -From bf5836989e0ffc1c1df1369df06877e96c08df41 Mon Sep 17 00:00:00 20=
01
> >>> -From: Khem Raj <raj.khem@gmail.com>
> >>> -Date: Fri, 20 Feb 2015 10:25:11 +0000
> >>> -Subject: [PATCH 30/47] Ensure target gcc headers can be included
> >>> -
> >>> -There are a few headers installed as part of the OpenEmbedded
> >>> -gcc-runtime target (omp.h, ssp/*.h). Being installed from a recipe
> >>> -built for the target architecture, these are within the target
> >>> -sysroot and not cross/nativesdk; thus they weren't able to be
> >>> -found by gcc with the existing search paths. Add support for
> >>> -picking up these headers under the sysroot supplied on the gcc
> >>> -command line in order to resolve this.
> >>> -
> >>> -Upstream-Status: Pending
> >>> -
> >>> -Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> >>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> ----
> >>> - gcc/Makefile.in  | 2 ++
> >>> - gcc/cppdefault.c | 4 ++++
> >>> - gcc/defaults.h   | 9 +++++++++
> >>> - gcc/gcc.c        | 7 -------
> >>> - 4 files changed, 15 insertions(+), 7 deletions(-)
> >>> -
> >>> -diff --git a/gcc/Makefile.in b/gcc/Makefile.in
> >>> -index 23cca7f0d5a..95d21effad3 100644
> >>> ---- a/gcc/Makefile.in
> >>> -+++ b/gcc/Makefile.in
> >>> -@@ -608,6 +608,7 @@ libexecdir =3D @libexecdir@
> >>> -
> >>> - # Directory in which the compiler finds libraries etc.
> >>> - libsubdir =3D $(libdir)/gcc/$(real_target_noncanonical)/$(version)$=
(accel_dir_suffix)
> >>> -+libsubdir_target =3D gcc/$(target_noncanonical)/$(version)
> >>> - # Directory in which the compiler finds executables
> >>> - libexecsubdir =3D $(libexecdir)/gcc/$(real_target_noncanonical)/$(v=
ersion)$(accel_dir_suffix)
> >>> - # Directory in which all plugin resources are installed
> >>> -@@ -2791,6 +2792,7 @@ CFLAGS-intl.o +=3D -DLOCALEDIR=3D\"$(localedir=
)\"
> >>> -
> >>> - PREPROCESSOR_DEFINES =3D \
> >>> -   -DGCC_INCLUDE_DIR=3D\"$(libsubdir)/include\" \
> >>> -+  -DGCC_INCLUDE_SUBDIR_TARGET=3D\"$(libsubdir_target)/include\" \
> >>> -   -DFIXED_INCLUDE_DIR=3D\"$(libsubdir)/include-fixed\" \
> >>> -   -DGPLUSPLUS_INCLUDE_DIR=3D\"$(gcc_gxx_include_dir)\" \
> >>> -   -DGPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT=3D$(gcc_gxx_include_dir_add_s=
ysroot) \
> >>> -diff --git a/gcc/cppdefault.c b/gcc/cppdefault.c
> >>> -index 10b96eca0a7..c8da0884872 100644
> >>> ---- a/gcc/cppdefault.c
> >>> -+++ b/gcc/cppdefault.c
> >>> -@@ -59,6 +59,10 @@ const struct default_include cpp_include_defaults=
[]
> >>> -     /* This is the dir for gcc's private headers.  */
> >>> -     { GCC_INCLUDE_DIR, "GCC", 0, 0, 0, 0 },
> >>> - #endif
> >>> -+#ifdef GCC_INCLUDE_SUBDIR_TARGET
> >>> -+    /* This is the dir for gcc's private headers under the specifie=
d sysroot.  */
> >>> -+    { STANDARD_STARTFILE_PREFIX_2 GCC_INCLUDE_SUBDIR_TARGET, "GCC",=
 0, 0, 1, 0 },
> >>> -+#endif
> >>> - #ifdef LOCAL_INCLUDE_DIR
> >>> -     /* /usr/local/include comes before the fixincluded header files=
.  */
> >>> -     { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 2 },
> >>> -diff --git a/gcc/defaults.h b/gcc/defaults.h
> >>> -index 7ad92d920f8..39848cc9c0e 100644
> >>> ---- a/gcc/defaults.h
> >>> -+++ b/gcc/defaults.h
> >>> -@@ -1475,4 +1475,13 @@ see the files COPYING3 and COPYING.RUNTIME re=
spectively.  If not, see
> >>> - #define DWARF_GNAT_ENCODINGS_DEFAULT DWARF_GNAT_ENCODINGS_GDB
> >>> - #endif
> >>> -
> >>> -+/* Default prefixes to attach to command names.  */
> >>> -+
> >>> -+#ifndef STANDARD_STARTFILE_PREFIX_1
> >>> -+#define STANDARD_STARTFILE_PREFIX_1 "/lib/"
> >>> -+#endif
> >>> -+#ifndef STANDARD_STARTFILE_PREFIX_2
> >>> -+#define STANDARD_STARTFILE_PREFIX_2 "/usr/lib/"
> >>> -+#endif
> >>> -+
> >>> - #endif  /* ! GCC_DEFAULTS_H */
> >>> -diff --git a/gcc/gcc.c b/gcc/gcc.c
> >>> -index c73d4023987..b27245dbf77 100644
> >>> ---- a/gcc/gcc.c
> >>> -+++ b/gcc/gcc.c
> >>> -@@ -1472,13 +1472,6 @@ static const char *gcc_libexec_prefix;
> >>> -
> >>> - /* Default prefixes to attach to command names.  */
> >>> -
> >>> --#ifndef STANDARD_STARTFILE_PREFIX_1
> >>> --#define STANDARD_STARTFILE_PREFIX_1 "/lib/"
> >>> --#endif
> >>> --#ifndef STANDARD_STARTFILE_PREFIX_2
> >>> --#define STANDARD_STARTFILE_PREFIX_2 "/usr/lib/"
> >>> --#endif
> >>> --
> >>> - #ifdef CROSS_DIRECTORY_STRUCTURE  /* Don't use these prefixes for a=
 cross compiler.  */
> >>> - #undef MD_EXEC_PREFIX
> >>> - #undef MD_STARTFILE_PREFIX
> >>> ---
> >>> -2.12.2
> >>> -
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.3/0031-gcc-4.8-won-t-bui=
ld-with-disable-dependency-tracking.patch b/meta/recipes-devtools/gcc/gcc-7=
.3/0031-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
> >>> deleted file mode 100644
> >>> index 0184010..0000000
> >>> --- a/meta/recipes-devtools/gcc/gcc-7.3/0031-gcc-4.8-won-t-build-with=
-disable-dependency-tracking.patch
> >>> +++ /dev/null
> >>> @@ -1,54 +0,0 @@
> >>> -From c7b4d957edda955fbe405fd5295846614529f517 Mon Sep 17 00:00:00 20=
01
> >>> -From: Khem Raj <raj.khem@gmail.com>
> >>> -Date: Fri, 20 Feb 2015 11:17:19 +0000
> >>> -Subject: [PATCH 31/47] gcc 4.8+ won't build with --disable-dependenc=
y-tracking
> >>> -
> >>> -since the *.Ppo files don't get created unless --enable-dependency-t=
racking is true.
> >>> -
> >>> -This patch ensures we only use those compiler options when its enabl=
ed.
> >>> -
> >>> -Upstream-Status: Submitted
> >>> -
> >>> -(Problem was already reported upstream, attached this patch there
> >>> -http://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D55930)
> >>> -
> >>> -RP
> >>> -2012/09/22
> >>> -
> >>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> ----
> >>> - libatomic/Makefile.am | 3 ++-
> >>> - libatomic/Makefile.in | 3 ++-
> >>> - 2 files changed, 4 insertions(+), 2 deletions(-)
> >>> -
> >>> -diff --git a/libatomic/Makefile.am b/libatomic/Makefile.am
> >>> -index d731406fdbd..2fafc72d2e7 100644
> >>> ---- a/libatomic/Makefile.am
> >>> -+++ b/libatomic/Makefile.am
> >>> -@@ -101,7 +101,8 @@ PAT_S              =3D $(word 3,$(PAT_SPLIT))
> >>> - IFUNC_DEF     =3D -DIFUNC_ALT=3D$(PAT_S)
> >>> - IFUNC_OPT     =3D $(word $(PAT_S),$(IFUNC_OPTIONS))
> >>> -
> >>> --M_DEPS                =3D -MT $@ -MD -MP -MF $(DEPDIR)/$(@F).Ppo
> >>> -+@AMDEP_TRUE@M_DEPS            =3D -MT $@ -MD -MP -MF $(DEPDIR)/$(@F=
).Ppo
> >>> -+@AMDEP_FALSE@M_DEPS           =3D
> >>> - M_SIZE                =3D -DN=3D$(PAT_N)
> >>> - M_IFUNC               =3D $(if $(PAT_S),$(IFUNC_DEF) $(IFUNC_OPT))
> >>> - M_FILE                =3D $(PAT_BASE)_n.c
> >>> -diff --git a/libatomic/Makefile.in b/libatomic/Makefile.in
> >>> -index f6eeab312ea..3f06a894058 100644
> >>> ---- a/libatomic/Makefile.in
> >>> -+++ b/libatomic/Makefile.in
> >>> -@@ -331,7 +331,8 @@ PAT_N =3D $(word 2,$(PAT_SPLIT))
> >>> - PAT_S =3D $(word 3,$(PAT_SPLIT))
> >>> - IFUNC_DEF =3D -DIFUNC_ALT=3D$(PAT_S)
> >>> - IFUNC_OPT =3D $(word $(PAT_S),$(IFUNC_OPTIONS))
> >>> --M_DEPS =3D -MT $@ -MD -MP -MF $(DEPDIR)/$(@F).Ppo
> >>> -+@AMDEP_TRUE@M_DEPS =3D -MT $@ -MD -MP -MF $(DEPDIR)/$(@F).Ppo
> >>> -+@AMDEP_FALSE@M_DEPS =3D
> >>> - M_SIZE =3D -DN=3D$(PAT_N)
> >>> - M_IFUNC =3D $(if $(PAT_S),$(IFUNC_DEF) $(IFUNC_OPT))
> >>> - M_FILE =3D $(PAT_BASE)_n.c
> >>> ---
> >>> -2.12.2
> >>> -
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.3/0032-Don-t-search-host=
-directory-during-relink-if-inst_pr.patch b/meta/recipes-devtools/gcc/gcc-7=
.3/0032-Don-t-search-host-directory-during-relink-if-inst_pr.patch
> >>> deleted file mode 100644
> >>> index e8905f5..0000000
> >>> --- a/meta/recipes-devtools/gcc/gcc-7.3/0032-Don-t-search-host-direct=
ory-during-relink-if-inst_pr.patch
> >>> +++ /dev/null
> >>> @@ -1,38 +0,0 @@
> >>> -From 3be6b766a5881b0b187c3c3c68250a9e4f7c0fa3 Mon Sep 17 00:00:00 20=
01
> >>> -From: Khem Raj <raj.khem@gmail.com>
> >>> -Date: Tue, 3 Mar 2015 08:21:19 +0000
> >>> -Subject: [PATCH 32/47] Don't search host directory during "relink" i=
f
> >>> - $inst_prefix is provided
> >>> -
> >>> -http://lists.gnu.org/archive/html/libtool-patches/2011-01/msg00026.h=
tml
> >>> -
> >>> -Upstream-Status: Submitted
> >>> -
> >>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> ----
> >>> - ltmain.sh | 5 +++--
> >>> - 1 file changed, 3 insertions(+), 2 deletions(-)
> >>> -
> >>> -diff --git a/ltmain.sh b/ltmain.sh
> >>> -index 52bdbdb5f9c..82bcec39f05 100644
> >>> ---- a/ltmain.sh
> >>> -+++ b/ltmain.sh
> >>> -@@ -6004,12 +6004,13 @@ func_mode_link ()
> >>> -             fi
> >>> -           else
> >>> -             # We cannot seem to hardcode it, guess we'll fake it.
> >>> -+            # Default if $libdir is not relative to the prefix:
> >>> -             add_dir=3D"-L$libdir"
> >>> --            # Try looking first in the location we're being install=
ed to.
> >>> -+
> >>> -             if test -n "$inst_prefix_dir"; then
> >>> -               case $libdir in
> >>> -                 [\\/]*)
> >>> --                  add_dir=3D"$add_dir -L$inst_prefix_dir$libdir"
> >>> -+                  add_dir=3D"-L$inst_prefix_dir$libdir"
> >>> -                   ;;
> >>> -               esac
> >>> -             fi
> >>> ---
> >>> -2.12.2
> >>> -
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.3/0033-Use-SYSTEMLIBS_DI=
R-replacement-instead-of-hardcoding.patch b/meta/recipes-devtools/gcc/gcc-7=
.3/0033-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
> >>> deleted file mode 100644
> >>> index c0b8df3..0000000
> >>> --- a/meta/recipes-devtools/gcc/gcc-7.3/0033-Use-SYSTEMLIBS_DIR-repla=
cement-instead-of-hardcoding.patch
> >>> +++ /dev/null
> >>> @@ -1,29 +0,0 @@
> >>> -From 6edcab9046b862cbb9b46892fc390ce69976539c Mon Sep 17 00:00:00 20=
01
> >>> -From: Khem Raj <raj.khem@gmail.com>
> >>> -Date: Tue, 28 Apr 2015 23:15:27 -0700
> >>> -Subject: [PATCH 33/47] Use SYSTEMLIBS_DIR replacement instead of har=
dcoding
> >>> - base_libdir
> >>> -
> >>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> ----
> >>> -Upstream-Status: Inappropriate [OE-Specific]
> >>> -
> >>> - gcc/config/aarch64/aarch64-linux.h | 2 +-
> >>> - 1 file changed, 1 insertion(+), 1 deletion(-)
> >>> -
> >>> -diff --git a/gcc/config/aarch64/aarch64-linux.h b/gcc/config/aarch64=
/aarch64-linux.h
> >>> -index c45fc1d35d1..a7afe197266 100644
> >>> ---- a/gcc/config/aarch64/aarch64-linux.h
> >>> -+++ b/gcc/config/aarch64/aarch64-linux.h
> >>> -@@ -21,7 +21,7 @@
> >>> - #ifndef GCC_AARCH64_LINUX_H
> >>> - #define GCC_AARCH64_LINUX_H
> >>> -
> >>> --#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-aarch64%{mbig-endian:_b=
e}%{mabi=3Dilp32:_ilp32}.so.1"
> >>> -+#define GLIBC_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-linux-aarch64%{mbi=
g-endian:_be}%{mabi=3Dilp32:_ilp32}.so.1"
> >>> -
> >>> - #undef MUSL_DYNAMIC_LINKER
> >>> - #define MUSL_DYNAMIC_LINKER "/lib/ld-musl-aarch64%{mbig-endian:_be}=
%{mabi=3Dilp32:_ilp32}.so.1"
> >>> ---
> >>> -2.12.2
> >>> -
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.3/0034-aarch64-Add-suppo=
rt-for-musl-ldso.patch b/meta/recipes-devtools/gcc/gcc-7.3/0034-aarch64-Add=
-support-for-musl-ldso.patch
> >>> deleted file mode 100644
> >>> index 7d866d9..0000000
> >>> --- a/meta/recipes-devtools/gcc/gcc-7.3/0034-aarch64-Add-support-for-=
musl-ldso.patch
> >>> +++ /dev/null
> >>> @@ -1,28 +0,0 @@
> >>> -From b140d6839cfba9cac892bc736d984540552d6a56 Mon Sep 17 00:00:00 20=
01
> >>> -From: Khem Raj <raj.khem@gmail.com>
> >>> -Date: Tue, 28 Apr 2015 23:18:39 -0700
> >>> -Subject: [PATCH 34/47] aarch64: Add support for musl ldso
> >>> -
> >>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> ----
> >>> -Upstream-Status: Inappropriate [OE-Specific]
> >>> -
> >>> - gcc/config/aarch64/aarch64-linux.h | 2 +-
> >>> - 1 file changed, 1 insertion(+), 1 deletion(-)
> >>> -
> >>> -diff --git a/gcc/config/aarch64/aarch64-linux.h b/gcc/config/aarch64=
/aarch64-linux.h
> >>> -index a7afe197266..580c2c7ea15 100644
> >>> ---- a/gcc/config/aarch64/aarch64-linux.h
> >>> -+++ b/gcc/config/aarch64/aarch64-linux.h
> >>> -@@ -24,7 +24,7 @@
> >>> - #define GLIBC_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-linux-aarch64%{mbi=
g-endian:_be}%{mabi=3Dilp32:_ilp32}.so.1"
> >>> -
> >>> - #undef MUSL_DYNAMIC_LINKER
> >>> --#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-aarch64%{mbig-endian:_be}=
%{mabi=3Dilp32:_ilp32}.so.1"
> >>> -+#define MUSL_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-musl-aarch64%{mbig-=
endian:_be}%{mabi=3Dilp32:_ilp32}.so.1"
> >>> -
> >>> - #undef  ASAN_CC1_SPEC
> >>> - #define ASAN_CC1_SPEC "%{%:sanitize(address):-funwind-tables}"
> >>> ---
> >>> -2.12.2
> >>> -
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.3/0035-libcc1-fix-libcc1=
-s-install-path-and-rpath.patch b/meta/recipes-devtools/gcc/gcc-7.3/0035-li=
bcc1-fix-libcc1-s-install-path-and-rpath.patch
> >>> deleted file mode 100644
> >>> index e2c1956..0000000
> >>> --- a/meta/recipes-devtools/gcc/gcc-7.3/0035-libcc1-fix-libcc1-s-inst=
all-path-and-rpath.patch
> >>> +++ /dev/null
> >>> @@ -1,54 +0,0 @@
> >>> -From 63617f2da153db10fa2fe938cce31bee01d47fe8 Mon Sep 17 00:00:00 20=
01
> >>> -From: Robert Yang <liezhi.yang@windriver.com>
> >>> -Date: Sun, 5 Jul 2015 20:25:18 -0700
> >>> -Subject: [PATCH 35/47] libcc1: fix libcc1's install path and rpath
> >>> -
> >>> -* Install libcc1.so and libcc1plugin.so into
> >>> -  $(libexecdir)/gcc/$(target_noncanonical)/$(gcc_version), as what w=
e
> >>> -  had done to lto-plugin.
> >>> -* Fix bad RPATH iussue:
> >>> -  gcc-5.2.0: package gcc-plugins contains bad RPATH /patht/to/tmp/sy=
sroots/qemux86-64/usr/lib64/../lib64 in file
> >>> - /path/to/gcc/5.2.0-r0/packages-split/gcc-plugins/usr/lib64/gcc/x86_=
64-poky-linux/5.2.0/plugin/libcc1plugin.so.0.0.0
> >>> - [rpaths]
> >>> -
> >>> -Upstream-Status: Inappropriate [OE configuration]
> >>> -
> >>> -Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> >>> ----
> >>> - libcc1/Makefile.am | 4 ++--
> >>> - libcc1/Makefile.in | 4 ++--
> >>> - 2 files changed, 4 insertions(+), 4 deletions(-)
> >>> -
> >>> -diff --git a/libcc1/Makefile.am b/libcc1/Makefile.am
> >>> -index 5e61a92a26b..e8b627f9cec 100644
> >>> ---- a/libcc1/Makefile.am
> >>> -+++ b/libcc1/Makefile.am
> >>> -@@ -37,8 +37,8 @@ libiberty =3D $(if $(wildcard $(libiberty_noasan))=
,$(Wc)$(libiberty_noasan), \
> >>> -           $(Wc)$(libiberty_normal)))
> >>> - libiberty_dep =3D $(patsubst $(Wc)%,%,$(libiberty))
> >>> -
> >>> --plugindir =3D $(libdir)/gcc/$(target_noncanonical)/$(gcc_version)/p=
lugin
> >>> --cc1libdir =3D $(libdir)/$(libsuffix)
> >>> -+cc1libdir =3D $(libexecdir)/gcc/$(target_noncanonical)/$(gcc_versio=
n)
> >>> -+plugindir =3D $(cc1libdir)
> >>> -
> >>> - if ENABLE_PLUGIN
> >>> - plugin_LTLIBRARIES =3D libcc1plugin.la libcp1plugin.la
> >>> -diff --git a/libcc1/Makefile.in b/libcc1/Makefile.in
> >>> -index 54babb02a49..e51d87ffdce 100644
> >>> ---- a/libcc1/Makefile.in
> >>> -+++ b/libcc1/Makefile.in
> >>> -@@ -303,8 +303,8 @@ libiberty =3D $(if $(wildcard $(libiberty_noasan=
)),$(Wc)$(libiberty_noasan), \
> >>> -           $(Wc)$(libiberty_normal)))
> >>> -
> >>> - libiberty_dep =3D $(patsubst $(Wc)%,%,$(libiberty))
> >>> --plugindir =3D $(libdir)/gcc/$(target_noncanonical)/$(gcc_version)/p=
lugin
> >>> --cc1libdir =3D $(libdir)/$(libsuffix)
> >>> -+cc1libdir =3D $(libexecdir)/gcc/$(target_noncanonical)/$(gcc_versio=
n)
> >>> -+plugindir =3D $(cc1libdir)
> >>> - @ENABLE_PLUGIN_TRUE@plugin_LTLIBRARIES =3D libcc1plugin.la libcp1pl=
ugin.la
> >>> - @ENABLE_PLUGIN_TRUE@cc1lib_LTLIBRARIES =3D libcc1.la
> >>> - BUILT_SOURCES =3D c-compiler-name.h cp-compiler-name.h
> >>> ---
> >>> -2.12.2
> >>> -
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.3/0036-handle-sysroot-su=
pport-for-nativesdk-gcc.patch b/meta/recipes-devtools/gcc/gcc-7.3/0036-hand=
le-sysroot-support-for-nativesdk-gcc.patch
> >>> deleted file mode 100644
> >>> index aa0b108..0000000
> >>> --- a/meta/recipes-devtools/gcc/gcc-7.3/0036-handle-sysroot-support-f=
or-nativesdk-gcc.patch
> >>> +++ /dev/null
> >>> @@ -1,213 +0,0 @@
> >>> -From ca14820ae834a62ef2b80b283e8f900714636272 Mon Sep 17 00:00:00 20=
01
> >>> -From: Khem Raj <raj.khem@gmail.com>
> >>> -Date: Mon, 7 Dec 2015 23:39:54 +0000
> >>> -Subject: [PATCH 36/47] handle sysroot support for nativesdk-gcc
> >>> -
> >>> -Being able to build a nativesdk gcc is useful, particularly in cases
> >>> -where the host compiler may be of an incompatible version (or a 32
> >>> -bit compiler is needed).
> >>> -
> >>> -Sadly, building nativesdk-gcc is not straight forward. We install
> >>> -nativesdk-gcc into a relocatable location and this means that its
> >>> -library locations can change. "Normal" sysroot support doesn't help
> >>> -in this case since the values of paths like "libdir" change, not jus=
t
> >>> -base root directory of the system.
> >>> -
> >>> -In order to handle this we do two things:
> >>> -
> >>> -a) Add %r into spec file markup which can be used for injected paths
> >>> -   such as SYSTEMLIBS_DIR (see gcc_multilib_setup()).
> >>> -b) Add other paths which need relocation into a .gccrelocprefix sect=
ion
> >>> -   which the relocation code will notice and adjust automatically.
> >>> -
> >>> -Upstream-Status: Inappropriate
> >>> -RP 2015/7/28
> >>> -
> >>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> ----
> >>> - gcc/cppdefault.c | 50 +++++++++++++++++++++++++++++++++++++--------=
-----
> >>> - gcc/cppdefault.h |  3 ++-
> >>> - gcc/gcc.c        | 20 ++++++++++++++------
> >>> - 3 files changed, 53 insertions(+), 20 deletions(-)
> >>> -
> >>> -diff --git a/gcc/cppdefault.c b/gcc/cppdefault.c
> >>> -index c8da0884872..43dc597a0c3 100644
> >>> ---- a/gcc/cppdefault.c
> >>> -+++ b/gcc/cppdefault.c
> >>> -@@ -35,6 +35,30 @@
> >>> - # undef CROSS_INCLUDE_DIR
> >>> - #endif
> >>> -
> >>> -+static char GPLUSPLUS_INCLUDE_DIRVAR[4096] __attribute__ ((section =
(".gccrelocprefix"))) =3D GPLUSPLUS_INCLUDE_DIR;
> >>> -+static char GCC_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gcc=
relocprefix"))) =3D GCC_INCLUDE_DIR;
> >>> -+static char GPLUSPLUS_TOOL_INCLUDE_DIRVAR[4096] __attribute__ ((sec=
tion (".gccrelocprefix"))) =3D GPLUSPLUS_TOOL_INCLUDE_DIR;
> >>> -+static char GPLUSPLUS_BACKWARD_INCLUDE_DIRVAR[4096] __attribute__ (=
(section (".gccrelocprefix"))) =3D GPLUSPLUS_BACKWARD_INCLUDE_DIR;
> >>> -+static char STANDARD_STARTFILE_PREFIX_2VAR[4096] __attribute__ ((se=
ction (".gccrelocprefix"))) =3D STANDARD_STARTFILE_PREFIX_2 GCC_INCLUDE_SUB=
DIR_TARGET;
> >>> -+#ifdef LOCAL_INCLUDE_DIR
> >>> -+static char LOCAL_INCLUDE_DIRVAR[4096] __attribute__ ((section (".g=
ccrelocprefix"))) =3D LOCAL_INCLUDE_DIR;
> >>> -+#endif
> >>> -+#ifdef PREFIX_INCLUDE_DIR
> >>> -+static char PREFIX_INCLUDE_DIRVAR[4096] __attribute__ ((section (".=
gccrelocprefix"))) =3D PREFIX_INCLUDE_DIR;
> >>> -+#endif
> >>> -+#ifdef FIXED_INCLUDE_DIR
> >>> -+static char FIXED_INCLUDE_DIRVAR[4096] __attribute__ ((section (".g=
ccrelocprefix"))) =3D FIXED_INCLUDE_DIR;
> >>> -+#endif
> >>> -+#ifdef CROSS_INCLUDE_DIR
> >>> -+static char CROSS_INCLUDE_DIRVAR[4096] __attribute__ ((section (".g=
ccrelocprefix"))) =3D CROSS_INCLUDE_DIR;
> >>> -+#endif
> >>> -+#ifdef TOOL_INCLUDE_DIR
> >>> -+static char TOOL_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gc=
crelocprefix"))) =3D TOOL_INCLUDE_DIR;
> >>> -+#endif
> >>> -+#ifdef NATIVE_SYSTEM_HEADER_DIR
> >>> -+static char NATIVE_SYSTEM_HEADER_DIRVAR[4096] __attribute__ ((secti=
on (".gccrelocprefix"))) =3D NATIVE_SYSTEM_HEADER_DIR;
> >>> -+#endif
> >>> -+
> >>> - const struct default_include cpp_include_defaults[]
> >>> - #ifdef INCLUDE_DEFAULTS
> >>> - =3D INCLUDE_DEFAULTS;
> >>> -@@ -42,38 +66,38 @@ const struct default_include cpp_include_default=
s[]
> >>> - =3D {
> >>> - #ifdef GPLUSPLUS_INCLUDE_DIR
> >>> -     /* Pick up GNU C++ generic include files.  */
> >>> --    { GPLUSPLUS_INCLUDE_DIR, "G++", 1, 1,
> >>> -+    { GPLUSPLUS_INCLUDE_DIRVAR, "G++", 1, 1,
> >>> -       GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 0 },
> >>> - #endif
> >>> - #ifdef GPLUSPLUS_TOOL_INCLUDE_DIR
> >>> -     /* Pick up GNU C++ target-dependent include files.  */
> >>> --    { GPLUSPLUS_TOOL_INCLUDE_DIR, "G++", 1, 1,
> >>> -+    { GPLUSPLUS_TOOL_INCLUDE_DIRVAR, "G++", 1, 1,
> >>> -       GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 1 },
> >>> - #endif
> >>> - #ifdef GPLUSPLUS_BACKWARD_INCLUDE_DIR
> >>> -     /* Pick up GNU C++ backward and deprecated include files.  */
> >>> --    { GPLUSPLUS_BACKWARD_INCLUDE_DIR, "G++", 1, 1,
> >>> -+    { GPLUSPLUS_BACKWARD_INCLUDE_DIRVAR, "G++", 1, 1,
> >>> -       GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 0 },
> >>> - #endif
> >>> - #ifdef GCC_INCLUDE_DIR
> >>> -     /* This is the dir for gcc's private headers.  */
> >>> --    { GCC_INCLUDE_DIR, "GCC", 0, 0, 0, 0 },
> >>> -+    { GCC_INCLUDE_DIRVAR, "GCC", 0, 0, 0, 0 },
> >>> - #endif
> >>> - #ifdef GCC_INCLUDE_SUBDIR_TARGET
> >>> -     /* This is the dir for gcc's private headers under the specifie=
d sysroot.  */
> >>> --    { STANDARD_STARTFILE_PREFIX_2 GCC_INCLUDE_SUBDIR_TARGET, "GCC",=
 0, 0, 1, 0 },
> >>> -+    { STANDARD_STARTFILE_PREFIX_2VAR, "GCC", 0, 0, 1, 0 },
> >>> - #endif
> >>> - #ifdef LOCAL_INCLUDE_DIR
> >>> -     /* /usr/local/include comes before the fixincluded header files=
.  */
> >>> --    { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 2 },
> >>> --    { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 0 },
> >>> -+    { LOCAL_INCLUDE_DIRVAR, 0, 0, 1, 1, 2 },
> >>> -+    { LOCAL_INCLUDE_DIRVAR, 0, 0, 1, 1, 0 },
> >>> - #endif
> >>> - #ifdef PREFIX_INCLUDE_DIR
> >>> --    { PREFIX_INCLUDE_DIR, 0, 0, 1, 0, 0 },
> >>> -+    { PREFIX_INCLUDE_DIRVAR, 0, 0, 1, 0, 0 },
> >>> - #endif
> >>> - #ifdef FIXED_INCLUDE_DIR
> >>> -     /* This is the dir for fixincludes.  */
> >>> --    { FIXED_INCLUDE_DIR, "GCC", 0, 0, 0,
> >>> -+    { FIXED_INCLUDE_DIRVAR, "GCC", 0, 0, 0,
> >>> -       /* A multilib suffix needs adding if different multilibs use
> >>> -        different headers.  */
> >>> - #ifdef SYSROOT_HEADERS_SUFFIX_SPEC
> >>> -@@ -85,16 +109,16 @@ const struct default_include cpp_include_defaul=
ts[]
> >>> - #endif
> >>> - #ifdef CROSS_INCLUDE_DIR
> >>> -     /* One place the target system's headers might be.  */
> >>> --    { CROSS_INCLUDE_DIR, "GCC", 0, 0, 0, 0 },
> >>> -+    { CROSS_INCLUDE_DIRVAR, "GCC", 0, 0, 0, 0 },
> >>> - #endif
> >>> - #ifdef TOOL_INCLUDE_DIR
> >>> -     /* Another place the target system's headers might be.  */
> >>> --    { TOOL_INCLUDE_DIR, "BINUTILS", 0, 1, 0, 0 },
> >>> -+    { TOOL_INCLUDE_DIRVAR, "BINUTILS", 0, 1, 0, 0 },
> >>> - #endif
> >>> - #ifdef NATIVE_SYSTEM_HEADER_DIR
> >>> -     /* /usr/include comes dead last.  */
> >>> --    { NATIVE_SYSTEM_HEADER_DIR, NATIVE_SYSTEM_HEADER_COMPONENT, 0, =
0, 1, 2 },
> >>> --    { NATIVE_SYSTEM_HEADER_DIR, NATIVE_SYSTEM_HEADER_COMPONENT, 0, =
0, 1, 0 },
> >>> -+    { NATIVE_SYSTEM_HEADER_DIRVAR, NATIVE_SYSTEM_HEADER_COMPONENT, =
0, 0, 1, 2 },
> >>> -+    { NATIVE_SYSTEM_HEADER_DIRVAR, NATIVE_SYSTEM_HEADER_COMPONENT, =
0, 0, 1, 0 },
> >>> - #endif
> >>> -     { 0, 0, 0, 0, 0, 0 }
> >>> -   };
> >>> -diff --git a/gcc/cppdefault.h b/gcc/cppdefault.h
> >>> -index 17bbb0eaef7..a937ec1d187 100644
> >>> ---- a/gcc/cppdefault.h
> >>> -+++ b/gcc/cppdefault.h
> >>> -@@ -33,7 +33,8 @@
> >>> -
> >>> - struct default_include
> >>> - {
> >>> --  const char *const fname;    /* The name of the directory.  */
> >>> -+  const char *fname;     /* The name of the directory.  */
> >>> -+
> >>> -   const char *const component;        /* The component containing t=
he directory
> >>> -                                  (see update_path in prefix.c) */
> >>> -   const char cplusplus;               /* Only look here if we're co=
mpiling C++.  */
> >>> -diff --git a/gcc/gcc.c b/gcc/gcc.c
> >>> -index b27245dbf77..e015c77f15f 100644
> >>> ---- a/gcc/gcc.c
> >>> -+++ b/gcc/gcc.c
> >>> -@@ -247,6 +247,8 @@ FILE *report_times_to_file =3D NULL;
> >>> - #endif
> >>> - static const char *target_system_root =3D DEFAULT_TARGET_SYSTEM_ROO=
T;
> >>> -
> >>> -+static char target_relocatable_prefix[4096] __attribute__ ((section=
 (".gccrelocprefix"))) =3D SYSTEMLIBS_DIR;
> >>> -+
> >>> - /* Nonzero means pass the updated target_system_root to the compile=
r.  */
> >>> -
> >>> - static int target_system_root_changed;
> >>> -@@ -518,6 +520,7 @@ or with constant text in a single argument.
> >>> -  %G     process LIBGCC_SPEC as a spec.
> >>> -  %R     Output the concatenation of target_system_root and
> >>> -         target_sysroot_suffix.
> >>> -+ %r     Output the base path target_relocatable_prefix
> >>> -  %S     process STARTFILE_SPEC as a spec.  A capital S is actually =
used here.
> >>> -  %E     process ENDFILE_SPEC as a spec.  A capital E is actually us=
ed here.
> >>> -  %C     process CPP_SPEC as a spec.
> >>> -@@ -1495,10 +1498,10 @@ static const char *gcc_libexec_prefix;
> >>> -    gcc_exec_prefix is set because, in that case, we know where the
> >>> -    compiler has been installed, and use paths relative to that
> >>> -    location instead.  */
> >>> --static const char *const standard_exec_prefix =3D STANDARD_EXEC_PRE=
FIX;
> >>> --static const char *const standard_libexec_prefix =3D STANDARD_LIBEX=
EC_PREFIX;
> >>> --static const char *const standard_bindir_prefix =3D STANDARD_BINDIR=
_PREFIX;
> >>> --static const char *const standard_startfile_prefix =3D STANDARD_STA=
RTFILE_PREFIX;
> >>> -+static char standard_exec_prefix[4096] __attribute__ ((section (".g=
ccrelocprefix"))) =3D STANDARD_EXEC_PREFIX;
> >>> -+static char standard_libexec_prefix[4096] __attribute__ ((section (=
".gccrelocprefix"))) =3D STANDARD_LIBEXEC_PREFIX;
> >>> -+static char standard_bindir_prefix[4096] __attribute__ ((section ("=
.gccrelocprefix"))) =3D STANDARD_BINDIR_PREFIX;
> >>> -+static char *const standard_startfile_prefix =3D STANDARD_STARTFILE=
_PREFIX;
> >>> -
> >>> - /* For native compilers, these are well-known paths containing
> >>> -    components that may be provided by the system.  For cross
> >>> -@@ -1506,9 +1509,9 @@ static const char *const standard_startfile_pr=
efix =3D STANDARD_STARTFILE_PREFIX;
> >>> - static const char *md_exec_prefix =3D MD_EXEC_PREFIX;
> >>> - static const char *md_startfile_prefix =3D MD_STARTFILE_PREFIX;
> >>> - static const char *md_startfile_prefix_1 =3D MD_STARTFILE_PREFIX_1;
> >>> --static const char *const standard_startfile_prefix_1
> >>> -+static char standard_startfile_prefix_1[4096] __attribute__ ((secti=
on (".gccrelocprefix")))
> >>> -   =3D STANDARD_STARTFILE_PREFIX_1;
> >>> --static const char *const standard_startfile_prefix_2
> >>> -+static char standard_startfile_prefix_2[4096] __attribute__ ((secti=
on (".gccrelocprefix")))
> >>> -   =3D STANDARD_STARTFILE_PREFIX_2;
> >>> -
> >>> - /* A relative path to be used in finding the location of tools
> >>> -@@ -5826,6 +5829,11 @@ do_spec_1 (const char *spec, int inswitch, co=
nst char *soft_matched_part)
> >>> -             }
> >>> -           break;
> >>> -
> >>> -+          case 'r':
> >>> -+              obstack_grow (&obstack, target_relocatable_prefix,
> >>> -+                    strlen (target_relocatable_prefix));
> >>> -+            break;
> >>> -+
> >>> -         case 'S':
> >>> -           value =3D do_spec_1 (startfile_spec, 0, NULL);
> >>> -           if (value !=3D 0)
> >>> ---
> >>> -2.12.2
> >>> -
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.3/0037-Search-target-sys=
root-gcc-version-specific-dirs-with.patch b/meta/recipes-devtools/gcc/gcc-7=
.3/0037-Search-target-sysroot-gcc-version-specific-dirs-with.patch
> >>> deleted file mode 100644
> >>> index 6c85a03..0000000
> >>> --- a/meta/recipes-devtools/gcc/gcc-7.3/0037-Search-target-sysroot-gc=
c-version-specific-dirs-with.patch
> >>> +++ /dev/null
> >>> @@ -1,102 +0,0 @@
> >>> -From 16a326bcd126b395b29019072905bae7a5d47500 Mon Sep 17 00:00:00 20=
01
> >>> -From: Khem Raj <raj.khem@gmail.com>
> >>> -Date: Mon, 7 Dec 2015 23:41:45 +0000
> >>> -Subject: [PATCH 37/47] Search target sysroot gcc version specific di=
rs with
> >>> - multilib.
> >>> -
> >>> -We install the gcc libraries (such as crtbegin.p) into
> >>> -<sysroot><libdir>/<target-sys>/5.2.0/
> >>> -which is a default search path for GCC (aka multi_suffix in the
> >>> -code below). <target-sys> is 'machine' in gcc's terminology. We use
> >>> -these directories so that multiple gcc versions could in theory
> >>> -co-exist on target.
> >>> -
> >>> -We only want to build one gcc-cross-canadian per arch and have this =
work
> >>> -for all multilibs. <target-sys> can be handled by mapping the multil=
ib
> >>> -<target-sys> to the one used by gcc-cross-canadian, e.g.
> >>> -mips64-polkmllib32-linux
> >>> -is symlinked to by mips64-poky-linux.
> >>> -
> >>> -The default gcc search path in the target sysroot for a "lib64" mutl=
ilib
> >>> -is:
> >>> -
> >>> -<sysroot>/lib32/mips64-poky-linux/5.2.0/
> >>> -<sysroot>/lib32/../lib64/
> >>> -<sysroot>/usr/lib32/mips64-poky-linux/5.2.0/
> >>> -<sysroot>/usr/lib32/../lib64/
> >>> -<sysroot>/lib32/
> >>> -<sysroot>/usr/lib32/
> >>> -
> >>> -which means that the lib32 crtbegin.o will be found and the lib64 on=
es
> >>> -will not which leads to compiler failures.
> >>> -
> >>> -This patch injects a multilib version of that path first so the lib6=
4
> >>> -binaries can be found first. With this change the search path become=
s:
> >>> -
> >>> -<sysroot>/lib32/../lib64/mips64-poky-linux/5.2.0/
> >>> -<sysroot>/lib32/mips64-poky-linux/5.2.0/
> >>> -<sysroot>/lib32/../lib64/
> >>> -<sysroot>/usr/lib32/../lib64/mips64-poky-linux/5.2.0/
> >>> -<sysroot>/usr/lib32/mips64-poky-linux/5.2.0/
> >>> -<sysroot>/usr/lib32/../lib64/
> >>> -<sysroot>/lib32/
> >>> -<sysroot>/usr/lib32/
> >>> -
> >>> -Upstream-Status: Pending
> >>> -RP 2015/7/31
> >>> -
> >>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> ----
> >>> - gcc/gcc.c | 29 ++++++++++++++++++++++++++++-
> >>> - 1 file changed, 28 insertions(+), 1 deletion(-)
> >>> -
> >>> -diff --git a/gcc/gcc.c b/gcc/gcc.c
> >>> -index e015c77f15f..84af5d5a2e1 100644
> >>> ---- a/gcc/gcc.c
> >>> -+++ b/gcc/gcc.c
> >>> -@@ -2533,7 +2533,7 @@ for_each_path (const struct path_prefix *paths=
,
> >>> -       if (path =3D=3D NULL)
> >>> -       {
> >>> -         len =3D paths->max_len + extra_space + 1;
> >>> --        len +=3D MAX (MAX (suffix_len, multi_os_dir_len), multiarch=
_len);
> >>> -+        len +=3D MAX ((suffix_len + multi_os_dir_len), multiarch_le=
n);
> >>> -         path =3D XNEWVEC (char, len);
> >>> -       }
> >>> -
> >>> -@@ -2545,6 +2545,33 @@ for_each_path (const struct path_prefix *path=
s,
> >>> -         /* Look first in MACHINE/VERSION subdirectory.  */
> >>> -         if (!skip_multi_dir)
> >>> -           {
> >>> -+            if (!(pl->os_multilib ? skip_multi_os_dir : skip_multi_=
dir))
> >>> -+              {
> >>> -+                const char *this_multi;
> >>> -+                size_t this_multi_len;
> >>> -+
> >>> -+                if (pl->os_multilib)
> >>> -+                  {
> >>> -+                    this_multi =3D multi_os_dir;
> >>> -+                    this_multi_len =3D multi_os_dir_len;
> >>> -+                  }
> >>> -+                else
> >>> -+                  {
> >>> -+                    this_multi =3D multi_dir;
> >>> -+                    this_multi_len =3D multi_dir_len;
> >>> -+                  }
> >>> -+
> >>> -+                /* Look in multilib MACHINE/VERSION subdirectory fi=
rst */
> >>> -+                if (this_multi_len)
> >>> -+                  {
> >>> -+                    memcpy (path + len, this_multi, this_multi_len =
+ 1);
> >>> -+                    memcpy (path + len + this_multi_len, multi_suff=
ix, suffix_len + 1);
> >>> -+                    ret =3D callback (path, callback_info);
> >>> -+                      if (ret)
> >>> -+                        break;
> >>> -+                  }
> >>> -+              }
> >>> -+
> >>> -             memcpy (path + len, multi_suffix, suffix_len + 1);
> >>> -             ret =3D callback (path, callback_info);
> >>> -             if (ret)
> >>> ---
> >>> -2.12.2
> >>> -
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.3/0038-Fix-various-_FOR_=
BUILD-and-related-variables.patch b/meta/recipes-devtools/gcc/gcc-7.3/0038-=
Fix-various-_FOR_BUILD-and-related-variables.patch
> >>> deleted file mode 100644
> >>> index a226d10..0000000
> >>> --- a/meta/recipes-devtools/gcc/gcc-7.3/0038-Fix-various-_FOR_BUILD-a=
nd-related-variables.patch
> >>> +++ /dev/null
> >>> @@ -1,137 +0,0 @@
> >>> -From 6e7f526e71a76aac3d49ba8f1742fe1b359c1060 Mon Sep 17 00:00:00 20=
01
> >>> -From: Khem Raj <raj.khem@gmail.com>
> >>> -Date: Mon, 7 Dec 2015 23:42:45 +0000
> >>> -Subject: [PATCH 38/47] Fix various _FOR_BUILD and related variables
> >>> -
> >>> -When doing a FOR_BUILD thing, you have to override CFLAGS with
> >>> -CFLAGS_FOR_BUILD. And if you use C++, you also have to override
> >>> -CXXFLAGS with CXXFLAGS_FOR_BUILD.
> >>> -Without this, when building for mingw, you end up trying to use
> >>> -the mingw headers for a host build.
> >>> -
> >>> -The same goes for other variables as well, such as CPPFLAGS,
> >>> -CPP, and GMPINC.
> >>> -
> >>> -Upstream-Status: Pending
> >>> -
> >>> -Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
> >>> -Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> >>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> ----
> >>> - Makefile.in      | 6 ++++++
> >>> - Makefile.tpl     | 5 +++++
> >>> - gcc/Makefile.in  | 2 +-
> >>> - gcc/configure    | 2 +-
> >>> - gcc/configure.ac | 2 +-
> >>> - 5 files changed, 14 insertions(+), 3 deletions(-)
> >>> -
> >>> -diff --git a/Makefile.in b/Makefile.in
> >>> -index e34e9555388..a03740f3f9d 100644
> >>> ---- a/Makefile.in
> >>> -+++ b/Makefile.in
> >>> -@@ -152,6 +152,7 @@ BUILD_EXPORTS =3D \
> >>> -       CPP=3D"$(CC_FOR_BUILD) -E"; export CPP; \
> >>> -       CFLAGS=3D"$(CFLAGS_FOR_BUILD)"; export CFLAGS; \
> >>> -       CONFIG_SHELL=3D"$(SHELL)"; export CONFIG_SHELL; \
> >>> -+      CPPFLAGS=3D"$(CPPFLAGS_FOR_BUILD)"; export CPPFLAGS; \
> >>> -       CXX=3D"$(CXX_FOR_BUILD)"; export CXX; \
> >>> -       CXXFLAGS=3D"$(CXXFLAGS_FOR_BUILD)"; export CXXFLAGS; \
> >>> -       GFORTRAN=3D"$(GFORTRAN_FOR_BUILD)"; export GFORTRAN; \
> >>> -@@ -169,6 +170,9 @@ BUILD_EXPORTS =3D \
> >>> - # built for the build system to override those in BASE_FLAGS_TO_PAS=
S.
> >>> - EXTRA_BUILD_FLAGS =3D \
> >>> -       CFLAGS=3D"$(CFLAGS_FOR_BUILD)" \
> >>> -+      CXXFLAGS=3D"$(CXXFLAGS_FOR_BUILD)" \
> >>> -+      CPP=3D"$(CC_FOR_BUILD) -E" \
> >>> -+      CPPFLAGS=3D"$(CPPFLAGS_FOR_BUILD)" \
> >>> -       LDFLAGS=3D"$(LDFLAGS_FOR_BUILD)"
> >>> -
> >>> - # This is the list of directories to built for the host system.
> >>> -@@ -186,6 +190,7 @@ HOST_SUBDIR =3D @host_subdir@
> >>> - HOST_EXPORTS =3D \
> >>> -       $(BASE_EXPORTS) \
> >>> -       CC=3D"$(CC)"; export CC; \
> >>> -+      CPP=3D"$(CC) -E"; export CPP; \
> >>> -       ADA_CFLAGS=3D"$(ADA_CFLAGS)"; export ADA_CFLAGS; \
> >>> -       CFLAGS=3D"$(CFLAGS)"; export CFLAGS; \
> >>> -       CONFIG_SHELL=3D"$(SHELL)"; export CONFIG_SHELL; \
> >>> -@@ -734,6 +739,7 @@ BASE_FLAGS_TO_PASS =3D \
> >>> -       "CC_FOR_BUILD=3D$(CC_FOR_BUILD)" \
> >>> -       "CFLAGS_FOR_BUILD=3D$(CFLAGS_FOR_BUILD)" \
> >>> -       "CXX_FOR_BUILD=3D$(CXX_FOR_BUILD)" \
> >>> -+      "CXXFLAGS_FOR_BUILD=3D$(CXXFLAGS_FOR_BUILD)" \
> >>> -       "EXPECT=3D$(EXPECT)" \
> >>> -       "FLEX=3D$(FLEX)" \
> >>> -       "INSTALL=3D$(INSTALL)" \
> >>> -diff --git a/Makefile.tpl b/Makefile.tpl
> >>> -index d0fa07005be..953376c658d 100644
> >>> ---- a/Makefile.tpl
> >>> -+++ b/Makefile.tpl
> >>> -@@ -154,6 +154,7 @@ BUILD_EXPORTS =3D \
> >>> -       CC=3D"$(CC_FOR_BUILD)"; export CC; \
> >>> -       CFLAGS=3D"$(CFLAGS_FOR_BUILD)"; export CFLAGS; \
> >>> -       CONFIG_SHELL=3D"$(SHELL)"; export CONFIG_SHELL; \
> >>> -+      CPPFLAGS=3D"$(CPPFLAGS_FOR_BUILD)"; export CPPFLAGS; \
> >>> -       CXX=3D"$(CXX_FOR_BUILD)"; export CXX; \
> >>> -       CXXFLAGS=3D"$(CXXFLAGS_FOR_BUILD)"; export CXXFLAGS; \
> >>> -       GFORTRAN=3D"$(GFORTRAN_FOR_BUILD)"; export GFORTRAN; \
> >>> -@@ -171,6 +172,9 @@ BUILD_EXPORTS =3D \
> >>> - # built for the build system to override those in BASE_FLAGS_TO_PAS=
S.
> >>> - EXTRA_BUILD_FLAGS =3D \
> >>> -       CFLAGS=3D"$(CFLAGS_FOR_BUILD)" \
> >>> -+      CXXFLAGS=3D"$(CXXFLAGS_FOR_BUILD)" \
> >>> -+      CPP=3D"$(CC_FOR_BUILD) -E" \
> >>> -+      CPPFLAGS=3D"$(CPPFLAGS_FOR_BUILD)" \
> >>> -       LDFLAGS=3D"$(LDFLAGS_FOR_BUILD)"
> >>> -
> >>> - # This is the list of directories to built for the host system.
> >>> -@@ -188,6 +192,7 @@ HOST_SUBDIR =3D @host_subdir@
> >>> - HOST_EXPORTS =3D \
> >>> -       $(BASE_EXPORTS) \
> >>> -       CC=3D"$(CC)"; export CC; \
> >>> -+      CPP=3D"$(CC) -E"; export CPP; \
> >>> -       ADA_CFLAGS=3D"$(ADA_CFLAGS)"; export ADA_CFLAGS; \
> >>> -       CFLAGS=3D"$(CFLAGS)"; export CFLAGS; \
> >>> -       CONFIG_SHELL=3D"$(SHELL)"; export CONFIG_SHELL; \
> >>> -diff --git a/gcc/Makefile.in b/gcc/Makefile.in
> >>> -index 95d21effad3..dbe2bacde50 100644
> >>> ---- a/gcc/Makefile.in
> >>> -+++ b/gcc/Makefile.in
> >>> -@@ -795,7 +795,7 @@ BUILD_LDFLAGS=3D@BUILD_LDFLAGS@
> >>> - BUILD_NO_PIE_FLAG =3D @BUILD_NO_PIE_FLAG@
> >>> - BUILD_LDFLAGS +=3D $(BUILD_NO_PIE_FLAG)
> >>> - BUILD_CPPFLAGS=3D -I. -I$(@D) -I$(srcdir) -I$(srcdir)/$(@D) \
> >>> --              -I$(srcdir)/../include @INCINTL@ $(CPPINC) $(CPPFLAGS=
)
> >>> -+              -I$(srcdir)/../include @INCINTL@ $(CPPINC) $(CPPFLAGS=
_FOR_BUILD)
> >>> -
> >>> - # Actual name to use when installing a native compiler.
> >>> - GCC_INSTALL_NAME :=3D $(shell echo gcc|sed '$(program_transform_nam=
e)')
> >>> -diff --git a/gcc/configure b/gcc/configure
> >>> -index 6ba391ed068..72ca6e5c535 100755
> >>> ---- a/gcc/configure
> >>> -+++ b/gcc/configure
> >>> -@@ -11789,7 +11789,7 @@ else
> >>> -       CC=3D"${CC_FOR_BUILD}" CFLAGS=3D"${CFLAGS_FOR_BUILD}" \
> >>> -       CXX=3D"${CXX_FOR_BUILD}" CXXFLAGS=3D"${CXXFLAGS_FOR_BUILD}" \
> >>> -       LD=3D"${LD_FOR_BUILD}" LDFLAGS=3D"${LDFLAGS_FOR_BUILD}" \
> >>> --      GMPINC=3D"" CPPFLAGS=3D"${CPPFLAGS} -DGENERATOR_FILE" \
> >>> -+      GMPINC=3D"" CPPFLAGS=3D"${CPPFLAGS_FOR_BUILD} -DGENERATOR_FIL=
E" \
> >>> -       ${realsrcdir}/configure \
> >>> -               --enable-languages=3D${enable_languages-all} \
> >>> -               --target=3D$target_alias --host=3D$build_alias --buil=
d=3D$build_alias
> >>> -diff --git a/gcc/configure.ac b/gcc/configure.ac
> >>> -index 8551a412df3..6eefb61dc2b 100644
> >>> ---- a/gcc/configure.ac
> >>> -+++ b/gcc/configure.ac
> >>> -@@ -1708,7 +1708,7 @@ else
> >>> -       CC=3D"${CC_FOR_BUILD}" CFLAGS=3D"${CFLAGS_FOR_BUILD}" \
> >>> -       CXX=3D"${CXX_FOR_BUILD}" CXXFLAGS=3D"${CXXFLAGS_FOR_BUILD}" \
> >>> -       LD=3D"${LD_FOR_BUILD}" LDFLAGS=3D"${LDFLAGS_FOR_BUILD}" \
> >>> --      GMPINC=3D"" CPPFLAGS=3D"${CPPFLAGS} -DGENERATOR_FILE" \
> >>> -+      GMPINC=3D"" CPPFLAGS=3D"${CPPFLAGS_FOR_BUILD} -DGENERATOR_FIL=
E" \
> >>> -       ${realsrcdir}/configure \
> >>> -               --enable-languages=3D${enable_languages-all} \
> >>> -               --target=3D$target_alias --host=3D$build_alias --buil=
d=3D$build_alias
> >>> ---
> >>> -2.12.2
> >>> -
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.3/0039-nios2-Define-MUSL=
_DYNAMIC_LINKER.patch b/meta/recipes-devtools/gcc/gcc-7.3/0039-nios2-Define=
-MUSL_DYNAMIC_LINKER.patch
> >>> deleted file mode 100644
> >>> index a7aeccd..0000000
> >>> --- a/meta/recipes-devtools/gcc/gcc-7.3/0039-nios2-Define-MUSL_DYNAMI=
C_LINKER.patch
> >>> +++ /dev/null
> >>> @@ -1,28 +0,0 @@
> >>> -From 6d03ddfb7a092942be6b58b1830f6986d012d5e3 Mon Sep 17 00:00:00 20=
01
> >>> -From: Khem Raj <raj.khem@gmail.com>
> >>> -Date: Tue, 2 Feb 2016 10:26:10 -0800
> >>> -Subject: [PATCH 39/47] nios2: Define MUSL_DYNAMIC_LINKER
> >>> -
> >>> -Signed-off-by: Marek Vasut <marex@denx.de>
> >>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> ----
> >>> -Upstream-Status: Inappropriate [OE-Specific]
> >>> -
> >>> - gcc/config/nios2/linux.h | 1 +
> >>> - 1 file changed, 1 insertion(+)
> >>> -
> >>> -diff --git a/gcc/config/nios2/linux.h b/gcc/config/nios2/linux.h
> >>> -index 5177fa641a4..1b8accda6ee 100644
> >>> ---- a/gcc/config/nios2/linux.h
> >>> -+++ b/gcc/config/nios2/linux.h
> >>> -@@ -30,6 +30,7 @@
> >>> - #define CPP_SPEC "%{posix:-D_POSIX_SOURCE} %{pthread:-D_REENTRANT}"
> >>> -
> >>> - #define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-nios2.so.1"
> >>> -+#define MUSL_DYNAMIC_LINKER  "/lib/ld-musl-nios2.so.1"
> >>> -
> >>> - #undef LINK_SPEC
> >>> - #define LINK_SPEC LINK_SPEC_ENDIAN \
> >>> ---
> >>> -2.12.2
> >>> -
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.3/0040-Add-ssp_nonshared=
-to-link-commandline-for-musl-targe.patch b/meta/recipes-devtools/gcc/gcc-7=
.3/0040-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
> >>> deleted file mode 100644
> >>> index 29b7ce7..0000000
> >>> --- a/meta/recipes-devtools/gcc/gcc-7.3/0040-Add-ssp_nonshared-to-lin=
k-commandline-for-musl-targe.patch
> >>> +++ /dev/null
> >>> @@ -1,87 +0,0 @@
> >>> -From 210f6b3b82084cc756e02b8bc12f909a43b14ee8 Mon Sep 17 00:00:00 20=
01
> >>> -From: Khem Raj <raj.khem@gmail.com>
> >>> -Date: Tue, 27 Jun 2017 18:10:54 -0700
> >>> -Subject: [PATCH 40/49] Add ssp_nonshared to link commandline for mus=
l targets
> >>> -
> >>> -when -fstack-protector options are enabled we need to
> >>> -link with ssp_shared on musl since it does not provide
> >>> -the __stack_chk_fail_local() so essentially it provides
> >>> -libssp but not libssp_nonshared something like
> >>> -TARGET_LIBC_PROVIDES_SSP_BUT_NOT_SSP_NONSHARED
> >>> - where-as for glibc the needed symbols
> >>> -are already present in libc_nonshared library therefore
> >>> -we do not need any library helper on glibc based systems
> >>> -but musl needs the libssp_noshared from gcc
> >>> -
> >>> -Upstream-Status: Pending
> >>> -
> >>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> ----
> >>> - gcc/config/linux.h          |  7 +++++++
> >>> - gcc/config/rs6000/linux.h   | 10 ++++++++++
> >>> - gcc/config/rs6000/linux64.h | 10 ++++++++++
> >>> - 3 files changed, 27 insertions(+)
> >>> -
> >>> -diff --git a/gcc/config/linux.h b/gcc/config/linux.h
> >>> -index 2e683d0c430..1b4df798671 100644
> >>> ---- a/gcc/config/linux.h
> >>> -+++ b/gcc/config/linux.h
> >>> -@@ -182,6 +182,13 @@ see the files COPYING3 and COPYING.RUNTIME resp=
ectively.  If not, see
> >>> -     { GCC_INCLUDE_DIR, "GCC", 0, 1, 0, 0 },           \
> >>> -     { 0, 0, 0, 0, 0, 0 }                              \
> >>> -   }
> >>> -+#ifdef TARGET_LIBC_PROVIDES_SSP
> >>> -+#undef LINK_SSP_SPEC
> >>> -+#define LINK_SSP_SPEC "%{fstack-protector|fstack-protector-all" \
> >>> -+                     "|fstack-protector-strong|fstack-protector-exp=
licit" \
> >>> -+                     ":-lssp_nonshared}"
> >>> -+#endif
> >>> -+
> >>> - #endif
> >>> -
> >>> - #if (DEFAULT_LIBC =3D=3D LIBC_UCLIBC) && defined (SINGLE_LIBC) /* u=
Clinux */
> >>> -diff --git a/gcc/config/rs6000/linux.h b/gcc/config/rs6000/linux.h
> >>> -index 684afd6c190..22cfa391b89 100644
> >>> ---- a/gcc/config/rs6000/linux.h
> >>> -+++ b/gcc/config/rs6000/linux.h
> >>> -@@ -91,6 +91,16 @@
> >>> -                                        " -m elf32ppclinux")
> >>> - #endif
> >>> -
> >>> -+/* link libssp_nonshared.a with musl */
> >>> -+#if DEFAULT_LIBC =3D=3D LIBC_MUSL
> >>> -+#ifdef TARGET_LIBC_PROVIDES_SSP
> >>> -+#undef LINK_SSP_SPEC
> >>> -+#define LINK_SSP_SPEC "%{fstack-protector|fstack-protector-all" \
> >>> -+                     "|fstack-protector-strong|fstack-protector-exp=
licit" \
> >>> -+                     ":-lssp_nonshared}"
> >>> -+#endif
> >>> -+#endif
> >>> -+
> >>> - #undef LINK_OS_LINUX_SPEC
> >>> - #define LINK_OS_LINUX_SPEC LINK_OS_LINUX_EMUL " %{!shared: %{!stati=
c: \
> >>> -   %{rdynamic:-export-dynamic} \
> >>> -diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64=
.h
> >>> -index 3b00ec0fcf0..8371f8d7b6b 100644
> >>> ---- a/gcc/config/rs6000/linux64.h
> >>> -+++ b/gcc/config/rs6000/linux64.h
> >>> -@@ -465,6 +465,16 @@ extern int dot_symbols;
> >>> -                                          " -m elf64ppc")
> >>> - #endif
> >>> -
> >>> -+/* link libssp_nonshared.a with musl */
> >>> -+#if DEFAULT_LIBC =3D=3D LIBC_MUSL
> >>> -+#ifdef TARGET_LIBC_PROVIDES_SSP
> >>> -+#undef LINK_SSP_SPEC
> >>> -+#define LINK_SSP_SPEC "%{fstack-protector|fstack-protector-all" \
> >>> -+                     "|fstack-protector-strong|fstack-protector-exp=
licit" \
> >>> -+                     ":-lssp_nonshared}"
> >>> -+#endif
> >>> -+#endif
> >>> -+
> >>> - #define LINK_OS_LINUX_SPEC32 LINK_OS_LINUX_EMUL32 " %{!shared: %{!s=
tatic: \
> >>> -   %{rdynamic:-export-dynamic} \
> >>> -   -dynamic-linker " GNU_USER_DYNAMIC_LINKER32 "}} \
> >>> ---
> >>> -2.13.2
> >>> -
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.3/0041-gcc-libcpp-suppor=
t-ffile-prefix-map-old-new.patch b/meta/recipes-devtools/gcc/gcc-7.3/0041-g=
cc-libcpp-support-ffile-prefix-map-old-new.patch
> >>> deleted file mode 100644
> >>> index 5260e36..0000000
> >>> --- a/meta/recipes-devtools/gcc/gcc-7.3/0041-gcc-libcpp-support-ffile=
-prefix-map-old-new.patch
> >>> +++ /dev/null
> >>> @@ -1,284 +0,0 @@
> >>> -From 4eadc99bdd0974761bf48f0fd32994dd9a3ffcfe Mon Sep 17 00:00:00 20=
01
> >>> -From: Hongxu Jia <hongxu.jia@windriver.com>
> >>> -Date: Wed, 16 Mar 2016 02:27:43 -0400
> >>> -Subject: [PATCH 41/47] gcc/libcpp: support -ffile-prefix-map=3D<old>=
=3D<new>
> >>> -
> >>> -Similar -fdebug-prefix-map, add option -ffile-prefix-map to map one
> >>> -directory name (old) to another (new) in __FILE__, __BASE_FILE__ and
> >>> -__builtin_FILE ().
> >>> -
> >>> -https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D70268
> >>> -
> >>> -Upstream-Status: Submitted [gcc-patches@gcc.gnu.org]
> >>> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> >>> ----
> >>> - gcc/c-family/c-opts.c     | 13 +++++++
> >>> - gcc/c-family/c.opt        |  4 +++
> >>> - gcc/dwarf2out.c           |  1 +
> >>> - gcc/gimplify.c            |  2 ++
> >>> - libcpp/Makefile.in        | 10 +++---
> >>> - libcpp/file-map.c         | 92 ++++++++++++++++++++++++++++++++++++=
+++++++++++
> >>> - libcpp/include/file-map.h | 30 ++++++++++++++++
> >>> - libcpp/macro.c            |  2 ++
> >>> - 8 files changed, 149 insertions(+), 5 deletions(-)
> >>> - create mode 100644 libcpp/file-map.c
> >>> - create mode 100644 libcpp/include/file-map.h
> >>> -
> >>> -diff --git a/gcc/c-family/c-opts.c b/gcc/c-family/c-opts.c
> >>> -index ea0e01b101c..a741c75a78f 100644
> >>> ---- a/gcc/c-family/c-opts.c
> >>> -+++ b/gcc/c-family/c-opts.c
> >>> -@@ -39,6 +39,14 @@ along with GCC; see the file COPYING3.  If not se=
e
> >>> - #include "opts.h"
> >>> - #include "plugin.h"           /* For PLUGIN_INCLUDE_FILE event.  */
> >>> - #include "mkdeps.h"
> >>> -+#include "file-map.h"
> >>> -+#include "c-target.h"
> >>> -+#include "tm.h"                       /* For BYTES_BIG_ENDIAN,
> >>> -+                                 DOLLARS_IN_IDENTIFIERS,
> >>> -+                                 STDC_0_IN_SYSTEM_HEADERS,
> >>> -+                                 TARGET_FLT_EVAL_METHOD_NON_DEFAULT=
 and
> >>> -+                                 TARGET_OPTF.  */
> >>> -+#include "tm_p.h"             /* For C_COMMON_OVERRIDE_OPTIONS.  */
> >>> - #include "dumpfile.h"
> >>> -
> >>> - #ifndef DOLLARS_IN_IDENTIFIERS
> >>> -@@ -517,6 +525,11 @@ c_common_handle_option (size_t scode, const cha=
r *arg, int value,
> >>> -       cpp_opts->narrow_charset =3D arg;
> >>> -       break;
> >>> -
> >>> -+    case OPT_ffile_prefix_map_:
> >>> -+      if (add_file_prefix_map (arg) < 0)
> >>> -+        error ("invalid argument %qs to -ffile-prefix-map", arg);
> >>> -+      break;
> >>> -+
> >>> -     case OPT_fwide_exec_charset_:
> >>> -       cpp_opts->wide_charset =3D arg;
> >>> -       break;
> >>> -diff --git a/gcc/c-family/c.opt b/gcc/c-family/c.opt
> >>> -index c4ef7796282..73333dfd57c 100644
> >>> ---- a/gcc/c-family/c.opt
> >>> -+++ b/gcc/c-family/c.opt
> >>> -@@ -1372,6 +1372,10 @@ fexec-charset=3D
> >>> - C ObjC C++ ObjC++ Joined RejectNegative
> >>> - -fexec-charset=3D<cset> Convert all strings and character constants=
 to character set <cset>.
> >>> -
> >>> -+ffile-prefix-map=3D
> >>> -+C ObjC C++ ObjC++ Joined RejectNegative
> >>> -+-ffile-prefix-map=3D<old=3Dnew>   Map one directory name to another=
 in __FILE__, __BASE_FILE__ and __builtin_FILE ()
> >>> -+
> >>> - fextended-identifiers
> >>> - C ObjC C++ ObjC++
> >>> - Permit universal character names (\\u and \\U) in identifiers.
> >>> -diff --git a/gcc/dwarf2out.c b/gcc/dwarf2out.c
> >>> -index 98c51576ec2..762f69ae88e 100644
> >>> ---- a/gcc/dwarf2out.c
> >>> -+++ b/gcc/dwarf2out.c
> >>> -@@ -23421,6 +23421,7 @@ gen_producer_string (void)
> >>> -       case OPT_fltrans_output_list_:
> >>> -       case OPT_fresolution_:
> >>> -       case OPT_fdebug_prefix_map_:
> >>> -+      case OPT_ffile_prefix_map_:
> >>> -       /* Ignore these.  */
> >>> -       continue;
> >>> -       default:
> >>> -diff --git a/gcc/gimplify.c b/gcc/gimplify.c
> >>> -index fd27eb1523f..5542b379f28 100644
> >>> ---- a/gcc/gimplify.c
> >>> -+++ b/gcc/gimplify.c
> >>> -@@ -58,6 +58,8 @@ along with GCC; see the file COPYING3.  If not see
> >>> - #include "gomp-constants.h"
> >>> - #include "tree-dump.h"
> >>> - #include "gimple-walk.h"
> >>> -+#include "file-map.h"
> >>> -+
> >>> - #include "langhooks-def.h"    /* FIXME: for lhd_set_decl_assembler_=
name */
> >>> - #include "builtins.h"
> >>> - #include "asan.h"
> >>> -diff --git a/libcpp/Makefile.in b/libcpp/Makefile.in
> >>> -index 0bd3787c25e..d3b52956b52 100644
> >>> ---- a/libcpp/Makefile.in
> >>> -+++ b/libcpp/Makefile.in
> >>> -@@ -84,12 +84,12 @@ DEPMODE =3D $(CXXDEPMODE)
> >>> -
> >>> -
> >>> - libcpp_a_OBJS =3D charset.o directives.o directives-only.o errors.o=
 \
> >>> --      expr.o files.o identifiers.o init.o lex.o line-map.o macro.o =
\
> >>> --      mkdeps.o pch.o symtab.o traditional.o
> >>> -+      expr.o file-map.o files.o identifiers.o init.o lex.o line-map=
.o \
> >>> -+      macro.o mkdeps.o pch.o symtab.o traditional.o
> >>> -
> >>> - libcpp_a_SOURCES =3D charset.c directives.c directives-only.c error=
s.c \
> >>> --      expr.c files.c identifiers.c init.c lex.c line-map.c macro.c =
\
> >>> --      mkdeps.c pch.c symtab.c traditional.c
> >>> -+      expr.c file-map.c files.c identifiers.c init.c lex.c line-map=
.c \
> >>> -+      macro.c mkdeps.c pch.c symtab.c traditional.c
> >>> -
> >>> - all: libcpp.a $(USED_CATALOGS)
> >>> -
> >>> -@@ -263,7 +263,7 @@ po/$(PACKAGE).pot: $(libcpp_a_SOURCES)
> >>> -
> >>> - TAGS_SOURCES =3D $(libcpp_a_SOURCES) internal.h ucnid.h \
> >>> -     include/line-map.h include/symtab.h include/cpp-id-data.h \
> >>> --    include/cpplib.h include/mkdeps.h system.h
> >>> -+    include/cpplib.h include/mkdeps.h system.h include/file-map.h
> >>> -
> >>> - TAGS: $(TAGS_SOURCES)
> >>> -       cd $(srcdir) && etags $(TAGS_SOURCES)
> >>> -diff --git a/libcpp/file-map.c b/libcpp/file-map.c
> >>> -new file mode 100644
> >>> -index 00000000000..18035ef6a72
> >>> ---- /dev/null
> >>> -+++ b/libcpp/file-map.c
> >>> -@@ -0,0 +1,92 @@
> >>> -+/* Map one directory name to another in __FILE__, __BASE_FILE__
> >>> -+   and __builtin_FILE ().
> >>> -+   Copyright (C) 2001-2016 Free Software Foundation, Inc.
> >>> -+
> >>> -+This program is free software; you can redistribute it and/or modif=
y it
> >>> -+under the terms of the GNU General Public License as published by t=
he
> >>> -+Free Software Foundation; either version 3, or (at your option) any
> >>> -+later version.
> >>> -+
> >>> -+This program is distributed in the hope that it will be useful,
> >>> -+but WITHOUT ANY WARRANTY; without even the implied warranty of
> >>> -+MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> >>> -+GNU General Public License for more details.
> >>> -+
> >>> -+You should have received a copy of the GNU General Public License
> >>> -+along with this program; see the file COPYING3.  If not see
> >>> -+<http://www.gnu.org/licenses/>.
> >>> -+
> >>> -+ In other words, you are welcome to use, share and improve this pro=
gram.
> >>> -+ You are forbidden to forbid anyone else to use, share and improve
> >>> -+ what you give them.   Help stamp out software-hoarding!  */
> >>> -+
> >>> -+#include "config.h"
> >>> -+#include "system.h"
> >>> -+#include "file-map.h"
> >>> -+
> >>> -+/* Structure recording the mapping from source file and directory
> >>> -+   names at compile time to __FILE__ */
> >>> -+typedef struct file_prefix_map
> >>> -+{
> >>> -+  const char *old_prefix;
> >>> -+  const char *new_prefix;
> >>> -+  size_t old_len;
> >>> -+  size_t new_len;
> >>> -+  struct file_prefix_map *next;
> >>> -+} file_prefix_map;
> >>> -+
> >>> -+/* Linked list of such structures.  */
> >>> -+static file_prefix_map *file_prefix_maps;
> >>> -+
> >>> -+/* Record prefix mapping of __FILE__.  ARG is the argument to
> >>> -+   -ffile-prefix-map and must be of the form OLD=3DNEW.  */
> >>> -+int
> >>> -+add_file_prefix_map (const char *arg)
> >>> -+{
> >>> -+  file_prefix_map *map;
> >>> -+  const char *p;
> >>> -+
> >>> -+  p =3D strchr (arg, '=3D');
> >>> -+  if (!p)
> >>> -+  {
> >>> -+      fprintf(stderr, "invalid argument %qs to -ffile-prefix-map", =
arg);
> >>> -+      return -1;
> >>> -+  }
> >>> -+  map =3D XNEW (file_prefix_map);
> >>> -+  map->old_prefix =3D xstrndup (arg, p - arg);
> >>> -+  map->old_len =3D p - arg;
> >>> -+  p++;
> >>> -+  map->new_prefix =3D xstrdup (p);
> >>> -+  map->new_len =3D strlen (p);
> >>> -+  map->next =3D file_prefix_maps;
> >>> -+  file_prefix_maps =3D map;
> >>> -+
> >>> -+  return 0;
> >>> -+}
> >>> -+
> >>> -+/* Perform user-specified mapping of __FILE__ prefixes.  Return
> >>> -+   the new name corresponding to filename.  */
> >>> -+
> >>> -+const char *
> >>> -+remap_file_filename (const char *filename)
> >>> -+{
> >>> -+  file_prefix_map *map;
> >>> -+  char *s;
> >>> -+  const char *name;
> >>> -+  size_t name_len;
> >>> -+
> >>> -+  for (map =3D file_prefix_maps; map; map =3D map->next)
> >>> -+    if (filename_ncmp (filename, map->old_prefix, map->old_len) =3D=
=3D 0)
> >>> -+      break;
> >>> -+  if (!map)
> >>> -+    return filename;
> >>> -+  name =3D filename + map->old_len;
> >>> -+  name_len =3D strlen (name) + 1;
> >>> -+  s =3D (char *) alloca (name_len + map->new_len);
> >>> -+  memcpy (s, map->new_prefix, map->new_len);
> >>> -+  memcpy (s + map->new_len, name, name_len);
> >>> -+
> >>> -+  return xstrdup (s);
> >>> -+}
> >>> -+
> >>> -+
> >>> -diff --git a/libcpp/include/file-map.h b/libcpp/include/file-map.h
> >>> -new file mode 100644
> >>> -index 00000000000..87503152d27
> >>> ---- /dev/null
> >>> -+++ b/libcpp/include/file-map.h
> >>> -@@ -0,0 +1,30 @@
> >>> -+/* Map one directory name to another in __FILE__, __BASE_FILE__
> >>> -+   and __builtin_FILE ().
> >>> -+   Copyright (C) 2001-2016 Free Software Foundation, Inc.
> >>> -+
> >>> -+This program is free software; you can redistribute it and/or modif=
y it
> >>> -+under the terms of the GNU General Public License as published by t=
he
> >>> -+Free Software Foundation; either version 3, or (at your option) any
> >>> -+later version.
> >>> -+
> >>> -+This program is distributed in the hope that it will be useful,
> >>> -+but WITHOUT ANY WARRANTY; without even the implied warranty of
> >>> -+MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> >>> -+GNU General Public License for more details.
> >>> -+
> >>> -+You should have received a copy of the GNU General Public License
> >>> -+along with this program; see the file COPYING3.  If not see
> >>> -+<http://www.gnu.org/licenses/>.
> >>> -+
> >>> -+ In other words, you are welcome to use, share and improve this pro=
gram.
> >>> -+ You are forbidden to forbid anyone else to use, share and improve
> >>> -+ what you give them.   Help stamp out software-hoarding!  */
> >>> -+
> >>> -+#ifndef LIBCPP_FILE_MAP_H
> >>> -+#define LIBCPP_FILE_MAP_H
> >>> -+
> >>> -+const char * remap_file_filename (const char *filename);
> >>> -+
> >>> -+int add_file_prefix_map (const char *arg);
> >>> -+
> >>> -+#endif /* !LIBCPP_FILE_MAP_H  */
> >>> -diff --git a/libcpp/macro.c b/libcpp/macro.c
> >>> -index de18c2210cf..2748c70d520 100644
> >>> ---- a/libcpp/macro.c
> >>> -+++ b/libcpp/macro.c
> >>> -@@ -26,6 +26,7 @@ along with this program; see the file COPYING3.  I=
f not see
> >>> - #include "system.h"
> >>> - #include "cpplib.h"
> >>> - #include "internal.h"
> >>> -+#include "file-map.h"
> >>> -
> >>> - typedef struct macro_arg macro_arg;
> >>> - /* This structure represents the tokens of a macro argument.  These
> >>> -@@ -301,6 +302,7 @@ _cpp_builtin_macro_text (cpp_reader *pfile, cpp_=
hashnode *node,
> >>> -           if (!name)
> >>> -             abort ();
> >>> -         }
> >>> -+      name =3D remap_file_filename (name);
> >>> -       len =3D strlen (name);
> >>> -       buf =3D _cpp_unaligned_alloc (pfile, len * 2 + 3);
> >>> -       result =3D buf;
> >>> ---
> >>> -2.12.2
> >>> -
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.3/0042-Reuse-fdebug-pref=
ix-map-to-replace-ffile-prefix-map.patch b/meta/recipes-devtools/gcc/gcc-7.=
3/0042-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch
> >>> deleted file mode 100644
> >>> index 5247167..0000000
> >>> --- a/meta/recipes-devtools/gcc/gcc-7.3/0042-Reuse-fdebug-prefix-map-=
to-replace-ffile-prefix-map.patch
> >>> +++ /dev/null
> >>> @@ -1,43 +0,0 @@
> >>> -From ddddc7335539fb8a6d30beba21781762df159186 Mon Sep 17 00:00:00 20=
01
> >>> -From: Hongxu Jia <hongxu.jia@windriver.com>
> >>> -Date: Wed, 16 Mar 2016 05:39:59 -0400
> >>> -Subject: [PATCH 42/47] Reuse -fdebug-prefix-map to replace -ffile-pr=
efix-map
> >>> -
> >>> -The oe-core may use external toolchain to compile,
> >>> -which may not support -ffile-prefix-map.
> >>> -
> >>> -Since we use -fdebug-prefix-map to do the same thing,
> >>> -so we could reuse it to replace -ffile-prefix-map.
> >>> -
> >>> -Upstream-Status: Inappropriate[oe-core specific]
> >>> -
> >>> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> >>> ----
> >>> - gcc/opts-global.c | 4 ++++
> >>> - 1 file changed, 4 insertions(+)
> >>> -
> >>> -diff --git a/gcc/opts-global.c b/gcc/opts-global.c
> >>> -index 50bad77c347..32b1d286721 100644
> >>> ---- a/gcc/opts-global.c
> >>> -+++ b/gcc/opts-global.c
> >>> -@@ -31,6 +31,7 @@ along with GCC; see the file COPYING3.  If not see
> >>> - #include "langhooks.h"
> >>> - #include "dbgcnt.h"
> >>> - #include "debug.h"
> >>> -+#include "file-map.h"
> >>> - #include "output.h"
> >>> - #include "plugin.h"
> >>> - #include "toplev.h"
> >>> -@@ -357,6 +358,9 @@ handle_common_deferred_options (void)
> >>> -
> >>> -       case OPT_fdebug_prefix_map_:
> >>> -         add_debug_prefix_map (opt->arg);
> >>> -+
> >>> -+        /* Reuse -fdebug-prefix-map to replace -ffile-prefix-map */
> >>> -+        add_file_prefix_map (opt->arg);
> >>> -         break;
> >>> -
> >>> -       case OPT_fdump_:
> >>> ---
> >>> -2.12.2
> >>> -
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.3/0043-gcc-final.c-fdebu=
g-prefix-map-support-to-remap-sourc.patch b/meta/recipes-devtools/gcc/gcc-7=
.3/0043-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch
> >>> deleted file mode 100644
> >>> index 74a5c86..0000000
> >>> --- a/meta/recipes-devtools/gcc/gcc-7.3/0043-gcc-final.c-fdebug-prefi=
x-map-support-to-remap-sourc.patch
> >>> +++ /dev/null
> >>> @@ -1,54 +0,0 @@
> >>> -From 5bc97be388485a5f8dd85db34372a1299bffd263 Mon Sep 17 00:00:00 20=
01
> >>> -From: Hongxu Jia <hongxu.jia@windriver.com>
> >>> -Date: Thu, 24 Mar 2016 11:23:14 -0400
> >>> -Subject: [PATCH 43/47] gcc/final.c: -fdebug-prefix-map support to re=
map
> >>> - sources with relative path
> >>> -
> >>> -PR other/70428
> >>> -* final.c (remap_debug_filename): Use lrealpath to translate
> >>> -relative path before remapping
> >>> -
> >>> -https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D70428
> >>> -Upstream-Status: Submitted [gcc-patches@gcc.gnu.org]
> >>> -
> >>> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> >>> ----
> >>> - gcc/final.c | 15 ++++++++++++---
> >>> - 1 file changed, 12 insertions(+), 3 deletions(-)
> >>> -
> >>> -diff --git a/gcc/final.c b/gcc/final.c
> >>> -index 820162b2d28..d74cb901abd 100644
> >>> ---- a/gcc/final.c
> >>> -+++ b/gcc/final.c
> >>> -@@ -1559,16 +1559,25 @@ remap_debug_filename (const char *filename)
> >>> -   const char *name;
> >>> -   size_t name_len;
> >>> -
> >>> -+  /* Support to remap filename with relative path  */
> >>> -+  char *realpath =3D lrealpath (filename);
> >>> -+  if (realpath =3D=3D NULL)
> >>> -+    return filename;
> >>> -+
> >>> -   for (map =3D debug_prefix_maps; map; map =3D map->next)
> >>> --    if (filename_ncmp (filename, map->old_prefix, map->old_len) =3D=
=3D 0)
> >>> -+    if (filename_ncmp (realpath, map->old_prefix, map->old_len) =3D=
=3D 0)
> >>> -       break;
> >>> -   if (!map)
> >>> --    return filename;
> >>> --  name =3D filename + map->old_len;
> >>> -+    {
> >>> -+      free (realpath);
> >>> -+      return filename;
> >>> -+    }
> >>> -+  name =3D realpath + map->old_len;
> >>> -   name_len =3D strlen (name) + 1;
> >>> -   s =3D (char *) alloca (name_len + map->new_len);
> >>> -   memcpy (s, map->new_prefix, map->new_len);
> >>> -   memcpy (s + map->new_len, name, name_len);
> >>> -+  free (realpath);
> >>> -   return ggc_strdup (s);
> >>> - }
> >>> -
> >>> ---
> >>> -2.12.2
> >>> -
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.3/0044-libgcc-Add-knob-t=
o-use-ldbl-128-on-ppc.patch b/meta/recipes-devtools/gcc/gcc-7.3/0044-libgcc=
-Add-knob-to-use-ldbl-128-on-ppc.patch
> >>> deleted file mode 100644
> >>> index e39af9b..0000000
> >>> --- a/meta/recipes-devtools/gcc/gcc-7.3/0044-libgcc-Add-knob-to-use-l=
dbl-128-on-ppc.patch
> >>> +++ /dev/null
> >>> @@ -1,124 +0,0 @@
> >>> -From 847aec764540636ec654fd7a012e271afa8d4e0f Mon Sep 17 00:00:00 20=
01
> >>> -From: Khem Raj <raj.khem@gmail.com>
> >>> -Date: Fri, 29 Apr 2016 20:03:28 +0000
> >>> -Subject: [PATCH 44/47] libgcc: Add knob to use ldbl-128 on ppc
> >>> -
> >>> -musl does not support ldbl 128 so we can not assume
> >>> -that linux as a whole supports ldbl-128 bits, instead
> >>> -act upon configure option passed to gcc and assume no
> >>> -on musl and yes otherwise if no option is passed since
> >>> -default behaviour is to assume ldbl128 it does not
> >>> -change the defaults
> >>> -
> >>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> -Upstream-Status: Pending
> >>> ----
> >>> - libgcc/Makefile.in           |  1 +
> >>> - libgcc/config/rs6000/t-linux |  5 ++++-
> >>> - libgcc/configure             | 18 ++++++++++++++++++
> >>> - libgcc/configure.ac          | 12 ++++++++++++
> >>> - 4 files changed, 35 insertions(+), 1 deletion(-)
> >>> - mode change 100644 =3D> 100755 libgcc/configure
> >>> -
> >>> -diff --git a/libgcc/Makefile.in b/libgcc/Makefile.in
> >>> -index a1a392de88d..2fe6889a342 100644
> >>> ---- a/libgcc/Makefile.in
> >>> -+++ b/libgcc/Makefile.in
> >>> -@@ -48,6 +48,7 @@ unwind_header =3D @unwind_header@
> >>> - md_unwind_header =3D @md_unwind_header@
> >>> - sfp_machine_header =3D @sfp_machine_header@
> >>> - thread_header =3D @thread_header@
> >>> -+with_ldbl128 =3D @with_ldbl128@
> >>> -
> >>> - host_noncanonical =3D @host_noncanonical@
> >>> - real_host_noncanonical =3D @real_host_noncanonical@
> >>> -diff --git a/libgcc/config/rs6000/t-linux b/libgcc/config/rs6000/t-l=
inux
> >>> -index 4f6d4c4a4d2..c50dd94a2da 100644
> >>> ---- a/libgcc/config/rs6000/t-linux
> >>> -+++ b/libgcc/config/rs6000/t-linux
> >>> -@@ -1,3 +1,6 @@
> >>> - SHLIB_MAPFILES +=3D $(srcdir)/config/rs6000/libgcc-glibc.ver
> >>> -
> >>> --HOST_LIBGCC2_CFLAGS +=3D -mlong-double-128 -mno-minimal-toc
> >>> -+ifeq ($(with_ldbl128),yes)
> >>> -+HOST_LIBGCC2_CFLAGS +=3D -mlong-double-128
> >>> -+endif
> >>> -+HOST_LIBGCC2_CFLAGS +=3D -mno-minimal-toc
> >>> -diff --git a/libgcc/configure b/libgcc/configure
> >>> -old mode 100644
> >>> -new mode 100755
> >>> -index 45c459788c3..e2d19b144b8
> >>> ---- a/libgcc/configure
> >>> -+++ b/libgcc/configure
> >>> -@@ -618,6 +618,7 @@ build_vendor
> >>> - build_cpu
> >>> - build
> >>> - with_aix_soname
> >>> -+with_ldbl128
> >>> - enable_vtable_verify
> >>> - enable_shared
> >>> - libgcc_topdir
> >>> -@@ -667,6 +668,7 @@ with_cross_host
> >>> - with_ld
> >>> - enable_shared
> >>> - enable_vtable_verify
> >>> -+with_long_double_128
> >>> - with_aix_soname
> >>> - enable_version_specific_runtime_libs
> >>> - with_slibdir
> >>> -@@ -1324,6 +1326,7 @@ Optional Packages:
> >>> -   --with-target-subdir=3DSUBDIR      Configuring in a subdirectory =
for target
> >>> -   --with-cross-host=3DHOST           Configuring with a cross compi=
ler
> >>> -   --with-ld               arrange to use the specified ld (full pat=
hname)
> >>> -+  --with-long-double-128  use 128-bit long double by default
> >>> -   --with-aix-soname=3Daix|svr4|both
> >>> -                           shared library versioning (aka "SONAME") =
variant to
> >>> -                           provide on AIX
> >>> -@@ -2208,6 +2211,21 @@ fi
> >>> -
> >>> -
> >>> -
> >>> -+# Check whether --with-long-double-128 was given.
> >>> -+if test "${with_long_double_128+set}" =3D set; then :
> >>> -+  withval=3D$with_long_double_128; with_ldbl128=3D"$with_long_doubl=
e_128"
> >>> -+else
> >>> -+  case "${host}" in
> >>> -+ power*-*-musl*)
> >>> -+   with_ldbl128=3D"no";;
> >>> -+ *) with_ldbl128=3D"yes";;
> >>> -+ esac
> >>> -+
> >>> -+fi
> >>> -+
> >>> -+
> >>> -+
> >>> -+
> >>> - # Check whether --with-aix-soname was given.
> >>> - if test "${with_aix_soname+set}" =3D set; then :
> >>> -   withval=3D$with_aix_soname; case "${host}:${enable_shared}" in
> >>> -diff --git a/libgcc/configure.ac b/libgcc/configure.ac
> >>> -index af151473709..dada52416da 100644
> >>> ---- a/libgcc/configure.ac
> >>> -+++ b/libgcc/configure.ac
> >>> -@@ -77,6 +77,18 @@ AC_ARG_ENABLE(vtable-verify,
> >>> - [enable_vtable_verify=3Dno])
> >>> - AC_SUBST(enable_vtable_verify)
> >>> -
> >>> -+AC_ARG_WITH(long-double-128,
> >>> -+[AS_HELP_STRING([--with-long-double-128],
> >>> -+    [use 128-bit long double by default])],
> >>> -+      with_ldbl128=3D"$with_long_double_128",
> >>> -+[case "${host}" in
> >>> -+ power*-*-musl*)
> >>> -+   with_ldbl128=3D"no";;
> >>> -+ *) with_ldbl128=3D"yes";;
> >>> -+ esac
> >>> -+])
> >>> -+AC_SUBST(with_ldbl128)
> >>> -+
> >>> - AC_ARG_WITH(aix-soname,
> >>> - [AS_HELP_STRING([--with-aix-soname=3Daix|svr4|both],
> >>> -     [shared library versioning (aka "SONAME") variant to provide on=
 AIX])],
> >>> ---
> >>> -2.12.2
> >>> -
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.3/0045-Link-libgcc-using=
-LDFLAGS-not-just-SHLIB_LDFLAGS.patch b/meta/recipes-devtools/gcc/gcc-7.3/0=
045-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
> >>> deleted file mode 100644
> >>> index 3aa038c..0000000
> >>> --- a/meta/recipes-devtools/gcc/gcc-7.3/0045-Link-libgcc-using-LDFLAG=
S-not-just-SHLIB_LDFLAGS.patch
> >>> +++ /dev/null
> >>> @@ -1,29 +0,0 @@
> >>> -From 92beb883ab57a23a35ba76c496bc1f4cabb1690e Mon Sep 17 00:00:00 20=
01
> >>> -From: Khem Raj <raj.khem@gmail.com>
> >>> -Date: Wed, 4 May 2016 21:11:34 -0700
> >>> -Subject: [PATCH 45/47] Link libgcc using LDFLAGS, not just SHLIB_LDF=
LAGS
> >>> -
> >>> -Upstream-Status: Pending
> >>> -
> >>> -Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> >>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> ----
> >>> - libgcc/config/t-slibgcc | 2 +-
> >>> - 1 file changed, 1 insertion(+), 1 deletion(-)
> >>> -
> >>> -diff --git a/libgcc/config/t-slibgcc b/libgcc/config/t-slibgcc
> >>> -index 76be7710960..a1ee2ee26ed 100644
> >>> ---- a/libgcc/config/t-slibgcc
> >>> -+++ b/libgcc/config/t-slibgcc
> >>> -@@ -32,7 +32,7 @@ SHLIB_INSTALL_SOLINK =3D $(LN_S) $(SHLIB_SONAME) \
> >>> -       $(DESTDIR)$(slibdir)$(SHLIB_SLIBDIR_QUAL)/$(SHLIB_SOLINK)
> >>> -
> >>> - SHLIB_LINK =3D $(CC) $(LIBGCC2_CFLAGS) -shared -nodefaultlibs \
> >>> --      $(SHLIB_LDFLAGS) \
> >>> -+      $(LDFLAGS) $(SHLIB_LDFLAGS) \
> >>> -       -o $(SHLIB_DIR)/$(SHLIB_SONAME).tmp @multilib_flags@ \
> >>> -       $(SHLIB_OBJS) $(SHLIB_LC) && \
> >>> -       rm -f $(SHLIB_DIR)/$(SHLIB_SOLINK) && \
> >>> ---
> >>> -2.12.2
> >>> -
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.3/0047-sync-gcc-stddef.h=
-with-musl.patch b/meta/recipes-devtools/gcc/gcc-7.3/0047-sync-gcc-stddef.h=
-with-musl.patch
> >>> deleted file mode 100644
> >>> index 65d22f1..0000000
> >>> --- a/meta/recipes-devtools/gcc/gcc-7.3/0047-sync-gcc-stddef.h-with-m=
usl.patch
> >>> +++ /dev/null
> >>> @@ -1,91 +0,0 @@
> >>> -From 9b951c8f6b0aaff7c16dc4db72b5e56ec73810bb Mon Sep 17 00:00:00 20=
01
> >>> -From: Khem Raj <raj.khem@gmail.com>
> >>> -Date: Fri, 3 Feb 2017 12:56:00 -0800
> >>> -Subject: [PATCH 47/47] sync gcc stddef.h with musl
> >>> -
> >>> -musl defines ptrdiff_t size_t and wchar_t
> >>> -so dont define them here if musl is definining them
> >>> -
> >>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> ----
> >>> -Upstream-Status: Inappropriate [OE-Specific]
> >>> -
> >>> - gcc/ginclude/stddef.h | 9 +++++++++
> >>> - 1 file changed, 9 insertions(+)
> >>> -
> >>> -diff --git a/gcc/ginclude/stddef.h b/gcc/ginclude/stddef.h
> >>> -index 872f451cac9..7e90938387c 100644
> >>> ---- a/gcc/ginclude/stddef.h
> >>> -+++ b/gcc/ginclude/stddef.h
> >>> -@@ -134,6 +134,7 @@ _TYPE_wchar_t;
> >>> - #ifndef ___int_ptrdiff_t_h
> >>> - #ifndef _GCC_PTRDIFF_T
> >>> - #ifndef _PTRDIFF_T_DECLARED /* DragonFly */
> >>> -+#ifndef __DEFINED_ptrdiff_t /* musl */
> >>> - #define _PTRDIFF_T
> >>> - #define _T_PTRDIFF_
> >>> - #define _T_PTRDIFF
> >>> -@@ -143,10 +144,12 @@ _TYPE_wchar_t;
> >>> - #define ___int_ptrdiff_t_h
> >>> - #define _GCC_PTRDIFF_T
> >>> - #define _PTRDIFF_T_DECLARED
> >>> -+#define __DEFINED_ptrdiff_t /* musl */
> >>> - #ifndef __PTRDIFF_TYPE__
> >>> - #define __PTRDIFF_TYPE__ long int
> >>> - #endif
> >>> - typedef __PTRDIFF_TYPE__ ptrdiff_t;
> >>> -+#endif /* __DEFINED_ptrdiff_t */
> >>> - #endif /* _PTRDIFF_T_DECLARED */
> >>> - #endif /* _GCC_PTRDIFF_T */
> >>> - #endif /* ___int_ptrdiff_t_h */
> >>> -@@ -184,6 +187,7 @@ typedef __PTRDIFF_TYPE__ ptrdiff_t;
> >>> - #ifndef _GCC_SIZE_T
> >>> - #ifndef _SIZET_
> >>> - #ifndef __size_t
> >>> -+#ifndef __DEFINED_size_t /* musl */
> >>> - #define __size_t__    /* BeOS */
> >>> - #define __SIZE_T__    /* Cray Unicos/Mk */
> >>> - #define _SIZE_T
> >>> -@@ -200,6 +204,7 @@ typedef __PTRDIFF_TYPE__ ptrdiff_t;
> >>> - #define ___int_size_t_h
> >>> - #define _GCC_SIZE_T
> >>> - #define _SIZET_
> >>> -+#define __DEFINED_size_t /* musl */
> >>> - #if (defined (__FreeBSD__) && (__FreeBSD__ >=3D 5)) \
> >>> -   || defined(__DragonFly__) \
> >>> -   || defined(__FreeBSD_kernel__)
> >>> -@@ -235,6 +240,7 @@ typedef long ssize_t;
> >>> - #endif /* _SIZE_T */
> >>> - #endif /* __SIZE_T__ */
> >>> - #endif /* __size_t__ */
> >>> -+#endif /* __DEFINED_size_t */
> >>> - #undef        __need_size_t
> >>> - #endif /* _STDDEF_H or __need_size_t.  */
> >>> -
> >>> -@@ -264,6 +270,7 @@ typedef long ssize_t;
> >>> - #ifndef ___int_wchar_t_h
> >>> - #ifndef __INT_WCHAR_T_H
> >>> - #ifndef _GCC_WCHAR_T
> >>> -+#ifndef __DEFINED_wchar_t /* musl */
> >>> - #define __wchar_t__   /* BeOS */
> >>> - #define __WCHAR_T__   /* Cray Unicos/Mk */
> >>> - #define _WCHAR_T
> >>> -@@ -279,6 +286,7 @@ typedef long ssize_t;
> >>> - #define __INT_WCHAR_T_H
> >>> - #define _GCC_WCHAR_T
> >>> - #define _WCHAR_T_DECLARED
> >>> -+#define __DEFINED_wchar_t /* musl */
> >>> -
> >>> - /* On BSD/386 1.1, at least, machine/ansi.h defines _BSD_WCHAR_T_
> >>> -    instead of _WCHAR_T_, and _BSD_RUNE_T_ (which, unlike the other
> >>> -@@ -344,6 +352,7 @@ typedef __WCHAR_TYPE__ wchar_t;
> >>> - #endif
> >>> - #endif /* __WCHAR_T__ */
> >>> - #endif /* __wchar_t__ */
> >>> -+#endif /* __DEFINED_wchar_t musl */
> >>> - #undef        __need_wchar_t
> >>> - #endif /* _STDDEF_H or __need_wchar_t.  */
> >>> -
> >>> ---
> >>> -2.12.2
> >>> -
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.3/0048-gcc-Enable-static=
-PIE.patch b/meta/recipes-devtools/gcc/gcc-7.3/0048-gcc-Enable-static-PIE.p=
atch
> >>> deleted file mode 100644
> >>> index a96e913..0000000
> >>> --- a/meta/recipes-devtools/gcc/gcc-7.3/0048-gcc-Enable-static-PIE.pa=
tch
> >>> +++ /dev/null
> >>> @@ -1,46 +0,0 @@
> >>> -From 44ef80688b56beea85c0070840dea1e2a4e34aed Mon Sep 17 00:00:00 20=
01
> >>> -From: Khem Raj <raj.khem@gmail.com>
> >>> -Date: Tue, 13 Jun 2017 12:12:52 -0700
> >>> -Subject: [PATCH 49/49] gcc: Enable static PIE
> >>> -
> >>> -Static PIE support in GCC
> >>> -see
> >>> -https://gcc.gnu.org/ml/gcc/2015-06/msg00008.html
> >>> -
> >>> -startfiles before patch:
> >>> - -static -> crt1.o crti.o crtbeginT.o
> >>> - -static -PIE -> crt1.o crti.o crtbeginT.o
> >>> -
> >>> -after patch:
> >>> - -static -> crt1.o crti.o crtbeginT.o
> >>> - -static -PIE -> rcrt1.o crti.o crtbeginS.o
> >>> -
> >>> -Upstream-Status: Pending
> >>> -
> >>> -Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> >>> -
> >>> ----
> >>> - gcc/config/gnu-user.h | 6 +++---
> >>> - 1 file changed, 3 insertions(+), 3 deletions(-)
> >>> -
> >>> -diff --git a/gcc/config/gnu-user.h b/gcc/config/gnu-user.h
> >>> -index de605b0..b035bbe 100644
> >>> ---- a/gcc/config/gnu-user.h
> >>> -+++ b/gcc/config/gnu-user.h
> >>> -@@ -52,11 +52,11 @@ see the files COPYING3 and COPYING.RUNTIME respe=
ctively.  If not, see
> >>> - #define GNU_USER_TARGET_STARTFILE_SPEC \
> >>> -   "%{shared:; \
> >>> -      pg|p|profile:gcrt1.o%s; \
> >>> --     static:crt1.o%s; \
> >>> -+     static: %{" PIE_SPEC ": rcrt1.o%s; :crt1.o%s}; \
> >>> -      " PIE_SPEC ":Scrt1.o%s; \
> >>> -      :crt1.o%s} \
> >>> -    crti.o%s \
> >>> --   %{static:crtbeginT.o%s; \
> >>> -+   %{static: %{" PIE_SPEC ": crtbeginS.o%s; :crtbeginT.o%s}; \
> >>> -      shared|" PIE_SPEC ":crtbeginS.o%s; \
> >>> -      :crtbegin.o%s} \
> >>> -    %{fvtable-verify=3Dnone:%s; \
> >>> -
> >>> -2.13.1
> >>> -
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.3/fix-segmentation-fault=
-precompiled-hdr.patch b/meta/recipes-devtools/gcc/gcc-7.3/fix-segmentation=
-fault-precompiled-hdr.patch
> >>> deleted file mode 100644
> >>> index c0adef6..0000000
> >>> --- a/meta/recipes-devtools/gcc/gcc-7.3/fix-segmentation-fault-precom=
piled-hdr.patch
> >>> +++ /dev/null
> >>> @@ -1,49 +0,0 @@
> >>> -
> >>> -Prevent a segmentation fault which occurs when using incorrect
> >>> -structure trying to access name of some named operators, such as
> >>> -CPP_NOT, CPP_AND etc. "token->val.node.spelling" cannot be used in
> >>> -those cases, as is may not be initialized at all.
> >>> -
> >>> -
> >>> -[YOCTO #11738]
> >>> -
> >>> -Upstream-Status: Pending
> >>> -
> >>> -Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> >>> -
> >>> -diff --git a/libcpp/lex.c b/libcpp/lex.c
> >>> ---- a/libcpp/lex.c
> >>> -+++ b/libcpp/lex.c
> >>> -@@ -3229,11 +3229,27 @@
> >>> -     spell_ident:
> >>> -     case SPELL_IDENT:
> >>> -       if (forstring)
> >>> --      {
> >>> --        memcpy (buffer, NODE_NAME (token->val.node.spelling),
> >>> --                NODE_LEN (token->val.node.spelling));
> >>> --        buffer +=3D NODE_LEN (token->val.node.spelling);
> >>> --      }
> >>> -+        {
> >>> -+          if (token->type =3D=3D CPP_NAME)
> >>> -+            {
> >>> -+              memcpy (buffer, NODE_NAME (token->val.node.spelling),
> >>> -+                    NODE_LEN (token->val.node.spelling));
> >>> -+              buffer +=3D NODE_LEN (token->val.node.spelling);
> >>> -+              break;
> >>> -+            }
> >>> -+          /* NAMED_OP, cannot use node.spelling */
> >>> -+          if (token->flags & NAMED_OP)
> >>> -+            {
> >>> -+              const char *str =3D cpp_named_operator2name (token->t=
ype);
> >>> -+              if (str)
> >>> -+                {
> >>> -+                  size_t len =3D strlen(str);
> >>> -+                  memcpy(buffer, str, len);
> >>> -+                  buffer +=3D len;
> >>> -+                }
> >>> -+              break;
> >>> -+            }
> >>> -+        }
> >>> -       else
> >>> -       buffer =3D _cpp_spell_ident_ucns (buffer, token->val.node.nod=
e);
> >>> -       break;
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.3/no-sse-fix-test-case-f=
ailures.patch b/meta/recipes-devtools/gcc/gcc-7.3/no-sse-fix-test-case-fail=
ures.patch
> >>> deleted file mode 100644
> >>> index cb87c5a..0000000
> >>> --- a/meta/recipes-devtools/gcc/gcc-7.3/no-sse-fix-test-case-failures=
.patch
> >>> +++ /dev/null
> >>> @@ -1,259 +0,0 @@
> >>> -From f22830da2ba64577deb6f717d05d86c03dd2e50d Mon Sep 17 00:00:00 20=
01
> >>> -From: RAGHUNATH LOLUR <raghunath.lolur@kpit.com>
> >>> -Date: Wed, 6 Dec 2017 22:52:26 -0800
> >>> -Subject: [PATCH] Fix for testsuite failure
> >>> -
> >>> -2017-11-16  Raghunath Lolur  <raghunath.lolur@kpit.com>
> >>> -
> >>> -       * gcc.dg/pr56275.c: If SSE is disabled, ensure that
> >>> -       "-mfpmath" is not set to use SSE. Set "-mfpmath=3D387".
> >>> -       * gcc.dg/pr68306.c: Likewise
> >>> -       * gcc.dg/pr68306-2.c: Likewise
> >>> -       * gcc.dg/pr68306-3.c: Likewise
> >>> -       * gcc.dg/pr69634.c: Likewise
> >>> -       * gcc.target/i386/amd64-abi-1.c: Likewise
> >>> -       * gcc.target/i386/funcspec-6.c: Likewise
> >>> -       * gcc.target/i386/interrupt-387-err-1.c: Likewise
> >>> -       * gcc.target/i386/isa-14.c: Likewise
> >>> -       * gcc.target/i386/pr44948-2b.c: Likewise
> >>> -       * gcc.target/i386/pr53425-1.c: Likewise
> >>> -       * gcc.target/i386/pr53425-2.c: Likewise
> >>> -       * gcc.target/i386/pr55247.c: Likewise
> >>> -       * gcc.target/i386/pr59644.c: Likewise
> >>> -       * gcc.target/i386/pr62120.c: Likewise
> >>> -       * gcc.target/i386/pr70467-1.c: Likewise
> >>> -       * gcc.target/i386/warn-vect-op-1.c: Likewise
> >>> -
> >>> -If -Wall, -Werror are used during compilation various test cases fai=
l
> >>> -to compile.
> >>> -
> >>> -If SSE is disabled, be sure to -mfpmath=3D387 to resolve this.
> >>> -
> >>> -This patch removes the changes to Changelog from the original patch.
> >>> -This will help us avoid conflicts.
> >>> -
> >>> -Upstream-Status: Pending
> >>> -
> >>> -Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> >>> ----
> >>> - gcc/testsuite/ChangeLog                   | 21 ++++++++++++++++++++=
+
> >>> - gcc/testsuite/gcc.dg/pr56275.c            |  2 +-
> >>> - gcc/testsuite/gcc.dg/pr68306-2.c          |  2 +-
> >>> - gcc/testsuite/gcc.dg/pr68306-3.c          |  2 +-
> >>> - gcc/testsuite/gcc.dg/pr68306.c            |  2 +-
> >>> - gcc/testsuite/gcc.dg/pr69634.c            |  2 +-
> >>> - .../gcc/testsuite/gcc.target/i386/amd64-abi-1.c     |  2 +-
> >>> - .../gcc/testsuite/gcc.target/i386/funcspec-6.c      |  1 +
> >>> - .../testsuite/gcc.target/i386/interrupt-387-err-1.c |  2 +-
> >>> - gcc/testsuite/gcc.target/i386/isa-14.c    |  2 +-
> >>> - .../gcc/testsuite/gcc.target/i386/pr44948-2b.c      |  2 +-
> >>> - gcc/testsuite/gcc.target/i386/pr53425-1.c |  2 +-
> >>> - gcc/testsuite/gcc.target/i386/pr53425-2.c |  2 +-
> >>> - gcc/testsuite/gcc.target/i386/pr55247.c   |  2 +-
> >>> - gcc/testsuite/gcc.target/i386/pr59644.c   |  2 +-
> >>> - gcc/testsuite/gcc.target/i386/pr62120.c   |  2 +-
> >>> - gcc/testsuite/gcc.target/i386/pr70467-1.c |  2 +-
> >>> - .../gcc/testsuite/gcc.target/i386/warn-vect-op-1.c  |  2 +-
> >>> - 18 files changed, 38 insertions(+), 16 deletions(-)
> >>> -
> >>> -diff --git a/gcc/testsuite/gcc.dg/pr56275.c b/gcc/testsuite/gcc.dg/p=
r56275.c
> >>> -index b901bb2..a4f6c95 100644
> >>> ---- a/gcc/testsuite/gcc.dg/pr56275.c
> >>> -+++ b/gcc/testsuite/gcc.dg/pr56275.c
> >>> -@@ -1,6 +1,6 @@
> >>> - /* { dg-do compile } */
> >>> - /* { dg-options "-O2" } */
> >>> --/* { dg-additional-options "-mno-sse" { target { i?86-*-* x86_64-*-=
* } } } */
> >>> -+/* { dg-additional-options "-mno-sse -mfpmath=3D387" { target { i?8=
6-*-* x86_64-*-* } } } */
> >>> -
> >>> - typedef long long v2tw __attribute__ ((vector_size (2 * sizeof (lon=
g long))));
> >>> -
> >>> -diff --git a/gcc/testsuite/gcc.dg/pr68306-2.c b/gcc/testsuite/gcc.dg=
/pr68306-2.c
> >>> -index 4672ebe..2a368c4 100644
> >>> ---- a/gcc/testsuite/gcc.dg/pr68306-2.c
> >>> -+++ b/gcc/testsuite/gcc.dg/pr68306-2.c
> >>> -@@ -1,6 +1,6 @@
> >>> - /* { dg-do compile } */
> >>> - /* { dg-options "-O3" } */
> >>> --/* { dg-additional-options "-mno-sse -mno-mmx" { target i?86-*-* x8=
6_64-*-* } } */
> >>> -+/* { dg-additional-options "-mno-sse -mno-mmx -mfpmath=3D387" { tar=
get i?86-*-* x86_64-*-* } } */
> >>> -
> >>> - struct {
> >>> -     int tz_minuteswest;
> >>> -diff --git a/gcc/testsuite/gcc.dg/pr68306-3.c b/gcc/testsuite/gcc.dg=
/pr68306-3.c
> >>> -index f5a8c10..df3390c 100644
> >>> ---- a/gcc/testsuite/gcc.dg/pr68306-3.c
> >>> -+++ b/gcc/testsuite/gcc.dg/pr68306-3.c
> >>> -@@ -1,6 +1,6 @@
> >>> - /* { dg-do compile } */
> >>> - /* { dg-options "-O3" } */
> >>> --/* { dg-additional-options "-mno-sse -mno-mmx" { target i?86-*-* x8=
6_64-*-* } } */
> >>> -+/* { dg-additional-options "-mno-sse -mno-mmx -mfpmath=3D387" { tar=
get i?86-*-* x86_64-*-* } } */
> >>> - /* { dg-additional-options "-mno-altivec -mno-vsx" { target powerpc=
*-*-* } } */
> >>> -
> >>> - extern void fn2();
> >>> -diff --git a/gcc/testsuite/gcc.dg/pr68306.c b/gcc/testsuite/gcc.dg/p=
r68306.c
> >>> -index 54e5b40..0813389 100644
> >>> ---- a/gcc/testsuite/gcc.dg/pr68306.c
> >>> -+++ b/gcc/testsuite/gcc.dg/pr68306.c
> >>> -@@ -1,6 +1,6 @@
> >>> - /* { dg-do compile } */
> >>> - /* { dg-options "-O3" } */
> >>> --/* { dg-additional-options "-mno-sse -mno-mmx" { target i?86-*-* x8=
6_64-*-* } } */
> >>> -+/* { dg-additional-options "-mno-sse -mno-mmx -mfpmath=3D387" { tar=
get i?86-*-* x86_64-*-* } } */
> >>> -
> >>> - enum powerpc_pmc_type { PPC_PMC_IBM };
> >>> - struct {
> >>> -diff --git a/gcc/testsuite/gcc.dg/pr69634.c b/gcc/testsuite/gcc.dg/p=
r69634.c
> >>> -index 60a5614..bcc23f9 100644
> >>> ---- a/gcc/testsuite/gcc.dg/pr69634.c
> >>> -+++ b/gcc/testsuite/gcc.dg/pr69634.c
> >>> -@@ -1,6 +1,6 @@
> >>> - /* { dg-do compile } */
> >>> - /* { dg-options "-O2 -fno-dce -fschedule-insns -fno-tree-vrp -fcomp=
are-debug -Wno-psabi" } */
> >>> --/* { dg-additional-options "-mno-sse" { target i?86-*-* x86_64-*-* =
} } */
> >>> -+/* { dg-additional-options "-mno-sse -mfpmath=3D387" { target i?86-=
*-* x86_64-*-* } } */
> >>> - /* { dg-require-effective-target scheduling } */
> >>> -
> >>> - typedef unsigned short u16;
> >>> -diff --git a/gcc/testsuite/gcc.target/i386/amd64-abi-1.c b/gcc/tests=
uite/gcc.target/i386/amd64-abi-1.c
> >>> -index 69fde57..7f1f1c0 100644
> >>> ---- a/gcc/testsuite/gcc.target/i386/amd64-abi-1.c
> >>> -+++ b/gcc/testsuite/gcc.target/i386/amd64-abi-1.c
> >>> -@@ -1,5 +1,5 @@
> >>> - /* { dg-do compile { target { ! ia32 } } } */
> >>> --/* { dg-options "-mno-sse" } */
> >>> -+/* { dg-options "-mno-sse -mfpmath=3D387" } */
> >>> - /* { dg-additional-options "-mabi=3Dsysv" { target *-*-mingw* } } *=
/
> >>> -
> >>> - double foo(void) { return 0; }        /* { dg-error "SSE disabled" =
} */
> >>> -diff --git a/gcc/testsuite/gcc.target/i386/funcspec-6.c b/gcc/testsu=
ite/gcc.target/i386/funcspec-6.c
> >>> -index ea896b7..bf15569 100644
> >>> ---- a/gcc/testsuite/gcc.target/i386/funcspec-6.c
> >>> -+++ b/gcc/testsuite/gcc.target/i386/funcspec-6.c
> >>> -@@ -1,6 +1,7 @@
> >>> - /* Test whether all of the 64-bit function specific options are acc=
epted
> >>> -    without error.  */
> >>> - /* { dg-do compile { target { ! ia32 } } } */
> >>> -+/* { dg-additional-options "-mfpmath=3D387" } */
> >>> -
> >>> - #include "funcspec-56.inc"
> >>> -
> >>> -diff --git a/gcc/testsuite/gcc.target/i386/interrupt-387-err-1.c b/g=
cc/testsuite/gcc.target/i386/interrupt-387-err-1.c
> >>> -index 3fbdc88..6b4d9d1 100644
> >>> ---- a/gcc/testsuite/gcc.target/i386/interrupt-387-err-1.c
> >>> -+++ b/gcc/testsuite/gcc.target/i386/interrupt-387-err-1.c
> >>> -@@ -1,5 +1,5 @@
> >>> - /* { dg-do compile } */
> >>> --/* { dg-options "-O2 -mgeneral-regs-only -mno-cld -mno-iamcu -m8038=
7" } */
> >>> -+/* { dg-options "-O2 -mgeneral-regs-only -mno-cld -mno-iamcu -m8038=
7 -mfpmath=3D387" } */
> >>> -
> >>> - typedef unsigned int uword_t __attribute__ ((mode (__word__)));
> >>> -
> >>> -diff --git a/gcc/testsuite/gcc.target/i386/isa-14.c b/gcc/testsuite/=
gcc.target/i386/isa-14.c
> >>> -index 5d49e6e..1de2db9 100644
> >>> ---- a/gcc/testsuite/gcc.target/i386/isa-14.c
> >>> -+++ b/gcc/testsuite/gcc.target/i386/isa-14.c
> >>> -@@ -1,5 +1,5 @@
> >>> - /* { dg-do run } */
> >>> --/* { dg-options "-march=3Dx86-64 -msse4a -mfma4 -mno-sse" } */
> >>> -+/* { dg-options "-march=3Dx86-64 -msse4a -mfma4 -mno-sse -mfpmath=
=3D387" } */
> >>> -
> >>> - extern void abort (void);
> >>> -
> >>> -diff --git a/gcc/testsuite/gcc.target/i386/pr44948-2b.c b/gcc/testsu=
ite/gcc.target/i386/pr44948-2b.c
> >>> -index fa1769b..f79fb12 100644
> >>> ---- a/gcc/testsuite/gcc.target/i386/pr44948-2b.c
> >>> -+++ b/gcc/testsuite/gcc.target/i386/pr44948-2b.c
> >>> -@@ -1,5 +1,5 @@
> >>> - /* { dg-do compile } */
> >>> --/* { dg-options "-O -mno-sse -Wno-psabi -mtune=3Dgeneric" } */
> >>> -+/* { dg-options "-O -mno-sse -Wno-psabi -mtune=3Dgeneric -mfpmath=
=3D387" } */
> >>> -
> >>> - struct A
> >>> - {
> >>> -diff --git a/gcc/testsuite/gcc.target/i386/pr53425-1.c b/gcc/testsui=
te/gcc.target/i386/pr53425-1.c
> >>> -index 2e89ff7..6339bf6 100644
> >>> ---- a/gcc/testsuite/gcc.target/i386/pr53425-1.c
> >>> -+++ b/gcc/testsuite/gcc.target/i386/pr53425-1.c
> >>> -@@ -1,6 +1,6 @@
> >>> - /* PR target/53425 */
> >>> - /* { dg-do compile { target { ! ia32 } } } */
> >>> --/* { dg-options "-O2 -mno-sse" } */
> >>> -+/* { dg-options "-O2 -mno-sse -mfpmath=3D387" } */
> >>> - /* { dg-skip-if "no SSE vector" { x86_64-*-mingw* } } */
> >>> -
> >>> - typedef double __v2df __attribute__ ((__vector_size__ (16)));
> >>> -diff --git a/gcc/testsuite/gcc.target/i386/pr53425-2.c b/gcc/testsui=
te/gcc.target/i386/pr53425-2.c
> >>> -index 61f6283..2c5a55f 100644
> >>> ---- a/gcc/testsuite/gcc.target/i386/pr53425-2.c
> >>> -+++ b/gcc/testsuite/gcc.target/i386/pr53425-2.c
> >>> -@@ -1,6 +1,6 @@
> >>> - /* PR target/53425 */
> >>> - /* { dg-do compile { target { ! ia32 } } } */
> >>> --/* { dg-options "-O2 -mno-sse" } */
> >>> -+/* { dg-options "-O2 -mno-sse -mfpmath=3D387" } */
> >>> - /* { dg-skip-if "no SSE vector" { x86_64-*-mingw* } } */
> >>> -
> >>> - typedef float __v2sf __attribute__ ((__vector_size__ (8)));
> >>> -diff --git a/gcc/testsuite/gcc.target/i386/pr55247.c b/gcc/testsuite=
/gcc.target/i386/pr55247.c
> >>> -index 23366d0..9810e3a 100644
> >>> ---- a/gcc/testsuite/gcc.target/i386/pr55247.c
> >>> -+++ b/gcc/testsuite/gcc.target/i386/pr55247.c
> >>> -@@ -1,6 +1,6 @@
> >>> - /* { dg-do compile { target { ! ia32 } } } */
> >>> - /* { dg-require-effective-target maybe_x32 } */
> >>> --/* { dg-options "-O2 -mno-sse -mno-mmx -mx32 -maddress-mode=3Dlong"=
 } */
> >>> -+/* { dg-options "-O2 -mno-sse -mno-mmx -mx32 -maddress-mode=3Dlong =
-mfpmath=3D387" } */
> >>> -
> >>> - typedef unsigned int uint32_t;
> >>> - typedef uint32_t Elf32_Word;
> >>> -diff --git a/gcc/testsuite/gcc.target/i386/pr59644.c b/gcc/testsuite=
/gcc.target/i386/pr59644.c
> >>> -index 96006b3..4287e45 100644
> >>> ---- a/gcc/testsuite/gcc.target/i386/pr59644.c
> >>> -+++ b/gcc/testsuite/gcc.target/i386/pr59644.c
> >>> -@@ -1,6 +1,6 @@
> >>> - /* PR target/59644 */
> >>> - /* { dg-do run { target lp64 } } */
> >>> --/* { dg-options "-O2 -ffreestanding -mno-sse -mpreferred-stack-boun=
dary=3D3 -maccumulate-outgoing-args -mno-red-zone" } */
> >>> -+/* { dg-options "-O2 -ffreestanding -mno-sse -mpreferred-stack-boun=
dary=3D3 -maccumulate-outgoing-args -mno-red-zone -mfpmath=3D387" } */
> >>> -
> >>> - /* This test uses __builtin_trap () instead of e.g. abort,
> >>> -    because due to -mpreferred-stack-boundary=3D3 it should not call
> >>> -diff --git a/gcc/testsuite/gcc.target/i386/pr62120.c b/gcc/testsuite=
/gcc.target/i386/pr62120.c
> >>> -index bfb8c47..ed04cf1 100644
> >>> ---- a/gcc/testsuite/gcc.target/i386/pr62120.c
> >>> -+++ b/gcc/testsuite/gcc.target/i386/pr62120.c
> >>> -@@ -1,5 +1,5 @@
> >>> - /* { dg-do compile } */
> >>> --/* { dg-options "-mno-sse" } */
> >>> -+/* { dg-options "-mno-sse -mfpmath=3D387" } */
> >>> -
> >>> - void foo ()
> >>> - {
> >>> -diff --git a/gcc/testsuite/gcc.target/i386/pr70467-1.c b/gcc/testsui=
te/gcc.target/i386/pr70467-1.c
> >>> -index 4e112c8..bcfb396 100644
> >>> ---- a/gcc/testsuite/gcc.target/i386/pr70467-1.c
> >>> -+++ b/gcc/testsuite/gcc.target/i386/pr70467-1.c
> >>> -@@ -1,6 +1,6 @@
> >>> - /* PR rtl-optimization/70467 */
> >>> - /* { dg-do compile } */
> >>> --/* { dg-options "-O2 -mno-sse" } */
> >>> -+/* { dg-options "-O2 -mno-sse -mfpmath=3D387" } */
> >>> -
> >>> - void foo (unsigned long long *);
> >>> -
> >>> -diff --git a/gcc/testsuite/gcc.target/i386/warn-vect-op-1.c b/gcc/te=
stsuite/gcc.target/i386/warn-vect-op-1.c
> >>> -index 6cda153..26e37f5 100644
> >>> ---- a/gcc/testsuite/gcc.target/i386/warn-vect-op-1.c
> >>> -+++ b/gcc/testsuite/gcc.target/i386/warn-vect-op-1.c
> >>> -@@ -1,5 +1,5 @@
> >>> - /* { dg-do compile { target { ! ia32 } } }  */
> >>> --/* { dg-options "-mno-sse -Wvector-operation-performance" }  */
> >>> -+/* { dg-options "-mno-sse -Wvector-operation-performance -mfpmath=
=3D387" }  */
> >>> - #define vector(elcount, type)  \
> >>> - __attribute__((vector_size((elcount)*sizeof(type)))) type
> >>> -
> >>> ---
> >>> -1.8.5.6
> >>> -
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.4.inc b/meta/recipes-dev=
tools/gcc/gcc-7.4.inc
> >>> new file mode 100644
> >>> index 0000000..fd666a9
> >>> --- /dev/null
> >>> +++ b/meta/recipes-devtools/gcc/gcc-7.4.inc
> >>> @@ -0,0 +1,130 @@
> >>> +require gcc-common.inc
> >>> +
> >>> +# Third digit in PV should be incremented after a minor release
> >>> +
> >>> +PV =3D "7.4.0"
> >>> +
> >>> +# BINV should be incremented to a revision after a minor gcc release
> >>> +
> >>> +BINV =3D "7.4.0"
> >>> +
> >>> +FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/gcc-7.4:${FILE_DIRNAME}/gcc-7.=
4/backport:"
> >>> +
> >>> +DEPENDS =3D+ "mpfr gmp libmpc zlib flex-native"
> >>> +NATIVEDEPS =3D "mpfr-native gmp-native libmpc-native zlib-native fle=
x-native"
> >>> +
> >>> +LICENSE =3D "GPL-3.0-with-GCC-exception & GPLv3"
> >>> +
> >>> +LIC_FILES_CHKSUM =3D "\
> >>> +    file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6552 \
> >>> +    file://COPYING3;md5=3Dd32239bcb673463ab874e80d47fae504 \
> >>> +    file://COPYING3.LIB;md5=3D6a6a8e020838b23406c81b19c1d46df6 \
> >>> +    file://COPYING.LIB;md5=3D2d5025d4aa3495befef8f17206a5b0a1 \
> >>> +    file://COPYING.RUNTIME;md5=3Dfe60d87048567d4fe8c8a0ed2448bcc8 \
> >>> +"
> >>> +
> >>> +#RELEASE =3D "7-20170504"
> >>> +BASEURI ?=3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz"
> >>> +#SRCREV =3D "f7cf798b73fd1a07098f9a490deec1e2a36e0bed"
> >>> +#BASEURI ?=3D "git://github.com/gcc-mirror/gcc;branch=3Dgcc-6-branch=
;protocol=3Dgit"
> >>> +#BASEURI ?=3D "http://mirrors.concertpass.com/gcc/snapshots/${RELEAS=
E}/gcc-${RELEASE}.tar.bz2"
> >>> +
> >>> +SRC_URI =3D "\
> >>> +           ${BASEURI} \
> >>> +           file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
> >>> +           file://0008-c99-snprintf.patch \
> >>> +           file://0009-gcc-poison-system-directories.patch \
> >>> +           file://0010-gcc-poison-dir-extend.patch \
> >>> +           file://0011-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch \
> >>> +           file://0012-64-bit-multilib-hack.patch \
> >>> +           file://0013-optional-libstdc.patch \
> >>> +           file://0014-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch \
> >>> +           file://0015-COLLECT_GCC_OPTIONS.patch \
> >>> +           file://0016-Use-the-defaults.h-in-B-instead-of-S-and-t-oe=
-in-B.patch \
> >>> +           file://0017-fortran-cross-compile-hack.patch \
> >>> +           file://0018-cpp-honor-sysroot.patch \
> >>> +           file://0019-MIPS64-Default-to-N64-ABI.patch \
> >>> +           file://0020-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMI=
C_LINKE.patch \
> >>> +           file://0021-gcc-Fix-argument-list-too-long-error.patch \
> >>> +           file://0022-Disable-sdt.patch \
> >>> +           file://0023-libtool.patch \
> >>> +           file://0024-gcc-armv4-pass-fix-v4bx-to-linker-to-support-=
EABI.patch \
> >>> +           file://0025-Use-the-multilib-config-files-from-B-instead-=
of-usin.patch \
> >>> +           file://0026-Avoid-using-libdir-from-.la-which-usually-poi=
nts-to-.patch \
> >>> +           file://0027-export-CPP.patch \
> >>> +           file://0028-Enable-SPE-AltiVec-generation-on-powepc-linux=
-target.patch \
> >>> +           file://0029-Disable-the-MULTILIB_OSDIRNAMES-and-other-mul=
tilib-o.patch \
> >>> +           file://0030-Ensure-target-gcc-headers-can-be-included.pat=
ch \
> >>> +           file://0031-gcc-4.8-won-t-build-with-disable-dependency-t=
racking.patch \
> >>> +           file://0032-Don-t-search-host-directory-during-relink-if-=
inst_pr.patch \
> >>> +           file://0033-Use-SYSTEMLIBS_DIR-replacement-instead-of-har=
dcoding.patch \
> >>> +           file://0034-aarch64-Add-support-for-musl-ldso.patch \
> >>> +           file://0035-libcc1-fix-libcc1-s-install-path-and-rpath.pa=
tch \
> >>> +           file://0036-handle-sysroot-support-for-nativesdk-gcc.patc=
h \
> >>> +           file://0037-Search-target-sysroot-gcc-version-specific-di=
rs-with.patch \
> >>> +           file://0038-Fix-various-_FOR_BUILD-and-related-variables.=
patch \
> >>> +           file://0039-nios2-Define-MUSL_DYNAMIC_LINKER.patch \
> >>> +           file://0040-Add-ssp_nonshared-to-link-commandline-for-mus=
l-targe.patch \
> >>> +           file://0041-gcc-libcpp-support-ffile-prefix-map-old-new.p=
atch \
> >>> +           file://0042-Reuse-fdebug-prefix-map-to-replace-ffile-pref=
ix-map.patch \
> >>> +           file://0043-gcc-final.c-fdebug-prefix-map-support-to-rema=
p-sourc.patch \
> >>> +           file://0044-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch =
\
> >>> +           file://0045-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFL=
AGS.patch \
> >>> +           file://0047-sync-gcc-stddef.h-with-musl.patch \
> >>> +           file://0048-gcc-Enable-static-PIE.patch \
> >>> +           file://fix-segmentation-fault-precompiled-hdr.patch \
> >>> +           file://no-sse-fix-test-case-failures.patch \
> >>> +           ${BACKPORTS} \
> >>> +"
> >>> +BACKPORTS =3D "\
> >>> +           file://0001-Fix-internal-compiler-error-in-testcase.patch=
 \
> >>> +           file://0001-PR-rtl-optimization-83030.patch \
> >>> +"
> >>> +
> >>> +SRC_URI[md5sum] =3D "6e9d754638ff03d2e9b2aff55aed82b4"
> >>> +SRC_URI[sha256sum] =3D "eddde28d04f334aec1604456e536416549e9b1aa137f=
c69204e65eb0c009fe51"
> >>> +
> >>> +S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
> >>> +#S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/git"
> >>> +B =3D "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
> >>> +
> >>> +# Language Overrides
> >>> +FORTRAN =3D ""
> >>> +JAVA =3D ""
> >>> +
> >>> +LTO =3D "--enable-lto"
> >>> +
> >>> +EXTRA_OECONF_BASE =3D "\
> >>> +    ${LTO} \
> >>> +    --enable-libssp \
> >>> +    --enable-libitm \
> >>> +    --disable-bootstrap \
> >>> +    --disable-libmudflap \
> >>> +    --with-system-zlib \
> >>> +    ${@'--with-linker-hash-style=3D${LINKER_HASH_STYLE}' if '${LINKE=
R_HASH_STYLE}' else ''} \
> >>> +    --enable-linker-build-id \
> >>> +    --with-ppl=3Dno \
> >>> +    --with-cloog=3Dno \
> >>> +    --enable-checking=3Drelease \
> >>> +    --enable-cheaders=3Dc_global \
> >>> +    --without-isl \
> >>> +"
> >>> +
> >>> +EXTRA_OECONF_INITIAL =3D "\
> >>> +    --disable-libmudflap \
> >>> +    --disable-libgomp \
> >>> +    --disable-libitm \
> >>> +    --disable-libquadmath \
> >>> +    --with-system-zlib \
> >>> +    --disable-lto \
> >>> +    --disable-plugin \
> >>> +    --enable-decimal-float=3Dno \
> >>> +    --without-isl \
> >>> +    gcc_cv_libc_provides_ssp=3Dyes \
> >>> +"
> >>> +
> >>> +EXTRA_OECONF_PATHS =3D "\
> >>> +    --with-gxx-include-dir=3D/not/exist{target_includedir}/c++/${BIN=
V} \
> >>> +    --with-sysroot=3D/not/exist \
> >>> +    --with-build-sysroot=3D${STAGING_DIR_TARGET} \
> >>> +"
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.4/0001-Fix-internal-comp=
iler-error-in-testcase.patch b/meta/recipes-devtools/gcc/gcc-7.4/0001-Fix-i=
nternal-compiler-error-in-testcase.patch
> >>> new file mode 100644
> >>> index 0000000..45cc0ee
> >>> --- /dev/null
> >>> +++ b/meta/recipes-devtools/gcc/gcc-7.4/0001-Fix-internal-compiler-er=
ror-in-testcase.patch
> >>> @@ -0,0 +1,212 @@
> >>> +From d3cdd96a300f9003a1cc242541605169aacdc811 Mon Sep 17 00:00:00 20=
01
> >>> +From: willschm <willschm@138bc75d-0d04-0410-961f-82ee72b054a4>
> >>> +Date: Mon, 25 Sep 2017 14:35:02 +0000
> >>> +Subject: [PATCH] [gcc]
> >>> +
> >>> +2017-09-25  Will Schmidt  <will_schmidt@vnet.ibm.com>
> >>> +
> >>> +       * config/rs6000/rs6000.c (rs6000_gimple_fold_builtin): Add ha=
ndling
> >>> +       for early folding of vector stores (ALTIVEC_BUILTIN_ST_*).
> >>> +       (rs6000_builtin_valid_without_lhs): New helper function.
> >>> +       * config/rs6000/rs6000-c.c (altivec_resolve_overloaded_builti=
n):
> >>> +       Remove obsoleted code for handling ALTIVEC_BUILTIN_VEC_ST.
> >>> +
> >>> +git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@253152 138bc75d-0d04=
-0410-961f-82ee72b054a4
> >>> +
> >>> +Fix internal compiler error for testcase gcc.dg/vmx/7d-02.c
> >>> +
> >>> +Upstream commit: d3cdd96a300f9003a1cc242541605169aacdc811
> >>> +
> >>> +Backport by Kaushik Phatak <Kaushik.Phatak@kpit.com>
> >>> +
> >>> +This patch removes changes to Changelog from the original upstream p=
atch.
> >>> +This will help us avoid conflicts.
> >>> +
> >>> +Upstream-Status: Backport
> >>> +
> >>> +Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> >>> +---
> >>> + gcc/ChangeLog                |  8 +++++
> >>> + gcc/config/rs6000/rs6000-c.c | 72 ---------------------------------=
----------
> >>> + gcc/config/rs6000/rs6000.c   | 73 +++++++++++++++++++++++++++++++++=
+++++++++--
> >>> + 3 files changed, 78 insertions(+), 75 deletions(-)
> >>> +
> >>> +diff --git a/gcc/config/rs6000/rs6000-c.c b/gcc/config/rs6000/rs6000=
-c.c
> >>> +index a49db97..4a363a1 100644
> >>> +--- a/gcc/config/rs6000/rs6000-c.c
> >>> ++++ b/gcc/config/rs6000/rs6000-c.c
> >>> +@@ -6279,70 +6279,6 @@ altivec_resolve_overloaded_builtin (loca
> >>> +       }
> >>> +     }
> >>> +
> >>> +-  /* Similarly for stvx.  */
> >>> +-  if (fcode =3D=3D ALTIVEC_BUILTIN_VEC_ST
> >>> +-      && (BYTES_BIG_ENDIAN || !VECTOR_ELT_ORDER_BIG)
> >>> +-      && nargs =3D=3D 3)
> >>> +-    {
> >>> +-      tree arg0 =3D (*arglist)[0];
> >>> +-      tree arg1 =3D (*arglist)[1];
> >>> +-      tree arg2 =3D (*arglist)[2];
> >>> +-
> >>> +-      /* Construct the masked address.  Let existing error handling=
 take
> >>> +-       over if we don't have a constant offset.  */
> >>> +-      arg1 =3D fold (arg1);
> >>> +-
> >>> +-      if (TREE_CODE (arg1) =3D=3D INTEGER_CST)
> >>> +-      {
> >>> +-        if (!ptrofftype_p (TREE_TYPE (arg1)))
> >>> +-          arg1 =3D build1 (NOP_EXPR, sizetype, arg1);
> >>> +-
> >>> +-        tree arg2_type =3D TREE_TYPE (arg2);
> >>> +-        if (TREE_CODE (arg2_type) =3D=3D ARRAY_TYPE && c_dialect_cx=
x ())
> >>> +-          {
> >>> +-            /* Force array-to-pointer decay for C++.  */
> >>> +-            arg2 =3D default_conversion (arg2);
> >>> +-            arg2_type =3D TREE_TYPE (arg2);
> >>> +-          }
> >>> +-
> >>> +-        /* Find the built-in to make sure a compatible one exists; =
if not
> >>> +-           we fall back to default handling to get the error messag=
e.  */
> >>> +-        for (desc =3D altivec_overloaded_builtins;
> >>> +-             desc->code && desc->code !=3D fcode; desc++)
> >>> +-          continue;
> >>> +-
> >>> +-        for (; desc->code =3D=3D fcode; desc++)
> >>> +-          if (rs6000_builtin_type_compatible (TREE_TYPE (arg0), des=
c->op1)
> >>> +-              && rs6000_builtin_type_compatible (TREE_TYPE (arg1), =
desc->op2)
> >>> +-              && rs6000_builtin_type_compatible (TREE_TYPE (arg2),
> >>> +-                                                 desc->op3))
> >>> +-            {
> >>> +-              tree addr =3D fold_build2_loc (loc, POINTER_PLUS_EXPR=
, arg2_type,
> >>> +-                                           arg2, arg1);
> >>> +-              tree aligned
> >>> +-                =3D fold_build2_loc (loc, BIT_AND_EXPR, arg2_type,
> >>> +-                                   addr, build_int_cst (arg2_type, =
-16));
> >>> +-
> >>> +-              tree arg0_type =3D TREE_TYPE (arg0);
> >>> +-              if (TYPE_MODE (arg0_type) =3D=3D V2DImode)
> >>> +-                /* Type-based aliasing analysis thinks vector long
> >>> +-                   and vector long long are different and will put =
them
> >>> +-                   in distinct alias classes.  Force our address ty=
pe
> >>> +-                   to be a may-alias type to avoid this.  */
> >>> +-                arg0_type
> >>> +-                  =3D build_pointer_type_for_mode (arg0_type, Pmode=
,
> >>> +-                                                 true/*can_alias_al=
l*/);
> >>> +-              else
> >>> +-                arg0_type =3D build_pointer_type (arg0_type);
> >>> +-              aligned =3D build1 (NOP_EXPR, arg0_type, aligned);
> >>> +-              tree stg =3D build_indirect_ref (loc, aligned, RO_NUL=
L);
> >>> +-              tree retval =3D build2 (MODIFY_EXPR, TREE_TYPE (stg),=
 stg,
> >>> +-                                    convert (TREE_TYPE (stg), arg0)=
);
> >>> +-              return retval;
> >>> +-            }
> >>> +-      }
> >>> +-    }
> >>> +-
> >>> +   for (n =3D 0;
> >>> +        !VOID_TYPE_P (TREE_VALUE (fnargs)) && n < nargs;
> >>> +        fnargs =3D TREE_CHAIN (fnargs), n++)
> >>> +diff --git a/gcc/config/rs6000/rs6000.c b/gcc/config/rs6000/rs6000.c
> >>> +index a49db97..4a363a1 100644
> >>> +--- a/gcc/config/rs6000/rs6000.c
> >>> ++++ b/gcc/config/rs6000/rs6000.c
> >>> +@@ -55,6 +55,7 @@
> >>> + #include "reload.h"
> >>> + #include "sched-int.h"
> >>> + #include "gimplify.h"
> >>> ++#include "gimple-fold.h"
> >>> + #include "gimple-iterator.h"
> >>> + #include "gimple-ssa.h"
> >>> + #include "gimple-walk.h"
> >>> +@@ -17089,6 +17090,25 @@ rs6000_fold_builtin (tree fndecl, int n_
> >>> + #endif
> >>> + }
> >>> +
> >>> ++/*  Helper function to sort out which built-ins may be valid withou=
t having
> >>> ++    a LHS.  */
> >>> ++bool
> >>> ++rs6000_builtin_valid_without_lhs (enum rs6000_builtins fn_code)
> >>> ++{
> >>> ++  switch (fn_code)
> >>> ++    {
> >>> ++    case ALTIVEC_BUILTIN_STVX_V16QI:
> >>> ++    case ALTIVEC_BUILTIN_STVX_V8HI:
> >>> ++    case ALTIVEC_BUILTIN_STVX_V4SI:
> >>> ++    case ALTIVEC_BUILTIN_STVX_V4SF:
> >>> ++    case ALTIVEC_BUILTIN_STVX_V2DI:
> >>> ++    case ALTIVEC_BUILTIN_STVX_V2DF:
> >>> ++      return true;
> >>> ++    default:
> >>> ++      return false;
> >>> ++    }
> >>> ++}
> >>> ++
> >>> + /* Fold a machine-dependent built-in in GIMPLE.  (For folding into
> >>> +    a constant, use rs6000_fold_builtin.)  */
> >>> +
> >>> +@@ -17102,6 +17122,10 @@ rs6000_gimple_fold_builtin (gimple_stmt_
> >>> +     =3D (enum rs6000_builtins) DECL_FUNCTION_CODE (fndecl);
> >>> +   tree arg0, arg1, lhs;
> >>> +
> >>> ++  /* Prevent gimple folding for code that does not have a LHS, unle=
ss it is
> >>> ++     allowed per the rs6000_builtin_valid_without_lhs helper functi=
on.  */
> >>> ++  if (!gimple_call_lhs (stmt) && !rs6000_builtin_valid_without_lhs =
(fn_code))
> >>> ++     return false;
> >>> +   switch (fn_code)
> >>> +     {
> >>> +     /* Flavors of vec_add.  We deliberately don't expand
> >>> +@@ -17169,6 +17193,54 @@ rs6000_gimple_fold_builtin (gimple_stmt_
> >>> +       gsi_replace (gsi, g, true);
> >>> +       return true;
> >>> +       }
> >>> ++    /* Vector stores.  */
> >>> ++    case ALTIVEC_BUILTIN_STVX_V16QI:
> >>> ++    case ALTIVEC_BUILTIN_STVX_V8HI:
> >>> ++    case ALTIVEC_BUILTIN_STVX_V4SI:
> >>> ++    case ALTIVEC_BUILTIN_STVX_V4SF:
> >>> ++    case ALTIVEC_BUILTIN_STVX_V2DI:
> >>> ++    case ALTIVEC_BUILTIN_STVX_V2DF:
> >>> ++      {
> >>> ++       /* Do not fold for -maltivec=3Dbe on LE targets.  */
> >>> ++       if (VECTOR_ELT_ORDER_BIG && !BYTES_BIG_ENDIAN)
> >>> ++          return false;
> >>> ++       arg0 =3D gimple_call_arg (stmt, 0); /* Value to be stored.  =
*/
> >>> ++       arg1 =3D gimple_call_arg (stmt, 1); /* Offset.  */
> >>> ++       tree arg2 =3D gimple_call_arg (stmt, 2); /* Store-to address=
.  */
> >>> ++       location_t loc =3D gimple_location (stmt);
> >>> ++       tree arg0_type =3D TREE_TYPE (arg0);
> >>> ++       /* Use ptr_type_node (no TBAA) for the arg2_type.
> >>> ++        FIXME: (Richard)  "A proper fix would be to transition this=
 type as
> >>> ++        seen from the frontend to GIMPLE, for example in a similar =
way we
> >>> ++        do for MEM_REFs by piggy-backing that on an extra argument,=
 a
> >>> ++        constant zero pointer of the alias pointer type to use (whi=
ch would
> >>> ++        also serve as a type indicator of the store itself).  I'd u=
se a
> >>> ++        target specific internal function for this (not sure if we =
can have
> >>> ++        those target specific, but I guess if it's folded away then=
 that's
> >>> ++        fine) and get away with the overload set."
> >>> ++        */
> >>> ++       tree arg2_type =3D ptr_type_node;
> >>> ++       /* POINTER_PLUS_EXPR wants the offset to be of type 'sizetyp=
e'.  Create
> >>> ++          the tree using the value from arg0.  The resulting type w=
ill match
> >>> ++          the type of arg2.  */
> >>> ++       gimple_seq stmts =3D NULL;
> >>> ++       tree temp_offset =3D gimple_convert (&stmts, loc, sizetype, =
arg1);
> >>> ++       tree temp_addr =3D gimple_build (&stmts, loc, POINTER_PLUS_E=
XPR,
> >>> ++                                     arg2_type, arg2, temp_offset);
> >>> ++       /* Mask off any lower bits from the address.  */
> >>> ++       tree aligned_addr =3D gimple_build (&stmts, loc, BIT_AND_EXP=
R,
> >>> ++                                        arg2_type, temp_addr,
> >>> ++                                        build_int_cst (arg2_type, -=
16));
> >>> ++       gsi_insert_seq_before (gsi, stmts, GSI_SAME_STMT);
> >>> ++      /* The desired gimple result should be similar to:
> >>> ++       MEM[(__vector floatD.1407 *)_1] =3D vf1D.2697;  */
> >>> ++       gimple *g;
> >>> ++       g =3D gimple_build_assign (build2 (MEM_REF, arg0_type, align=
ed_addr,
> >>> ++                                         build_int_cst (arg2_type, =
0)), arg0);
> >>> ++       gimple_set_location (g, loc);
> >>> ++       gsi_replace (gsi, g, true);
> >>> ++       return true;
> >>> ++      }
> >>> +
> >>> +     default:
> >>> +       break;
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.4/0001-Fix-ppc64le-build=
-Partial-backport-r256656.patch b/meta/recipes-devtools/gcc/gcc-7.4/0001-Fi=
x-ppc64le-build-Partial-backport-r256656.patch
> >>> new file mode 100644
> >>> index 0000000..cfb70e1
> >>> --- /dev/null
> >>> +++ b/meta/recipes-devtools/gcc/gcc-7.4/0001-Fix-ppc64le-build-Partia=
l-backport-r256656.patch
> >>> @@ -0,0 +1,37 @@
> >>> +From aa65a43516da1d48011ef621ed5988289711d99b Mon Sep 17 00:00:00 20=
01
> >>> +From: marxin <marxin@138bc75d-0d04-0410-961f-82ee72b054a4>
> >>> +Date: Fri, 29 Jun 2018 09:31:30 +0000
> >>> +Subject: [PATCH] Partial backport r256656
> >>> +
> >>> +2018-06-29  Martin Liska  <mliska@suse.cz>
> >>> +
> >>> +       Backport from mainline
> >>> +       2018-01-10  Kelvin Nilsen  <kelvin@gcc.gnu.org>
> >>> +
> >>> +       * lex.c (search_line_fast): Remove illegal coercion of an
> >>> +       unaligned pointer value to vector pointer type and replace wi=
th
> >>> +       use of __builtin_vec_vsx_ld () built-in function, which opera=
tes
> >>> +       on unaligned pointer values.
> >>> +
> >>> +Upstream-Status: Backport
> >>> +Signed-off-by: Joel Stanley <joel@jms.id.au>
> >>> +---
> >>> + libcpp/lex.c  |  2 +-
> >>> + 1 files changed, 1 insertions(+), 1 deletion(-)
> >>> +
> >>> +diff --git a/libcpp/lex.c b/libcpp/lex.c
> >>> +index 097c78002cbb..e0fb9e822c44 100644
> >>> +--- a/libcpp/lex.c
> >>> ++++ b/libcpp/lex.c
> >>> +@@ -568,7 +568,7 @@ search_line_fast (const uchar *s, const uchar *e=
nd ATTRIBUTE_UNUSED)
> >>> +     {
> >>> +       vc m_nl, m_cr, m_bs, m_qm;
> >>> +
> >>> +-      data =3D *((const vc *)s);
> >>> ++      data =3D __builtin_vec_vsx_ld (0, s);
> >>> +       s +=3D 16;
> >>> +
> >>> +       m_nl =3D (vc) __builtin_vec_cmpeq(data, repl_nl);
> >>> +--
> >>> +2.17.1
> >>> +
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.4/0001-PR-rtl-optimizati=
on-83030.patch b/meta/recipes-devtools/gcc/gcc-7.4/0001-PR-rtl-optimization=
-83030.patch
> >>> new file mode 100644
> >>> index 0000000..71f7988
> >>> --- /dev/null
> >>> +++ b/meta/recipes-devtools/gcc/gcc-7.4/0001-PR-rtl-optimization-8303=
0.patch
> >>> @@ -0,0 +1,272 @@
> >>> +From f5c4a9440f15ccf6775659910a2014a5494ee86e Mon Sep 17 00:00:00 20=
01
> >>> +From: ebotcazou <ebotcazou@138bc75d-0d04-0410-961f-82ee72b054a4>
> >>> +Date: Wed, 22 Nov 2017 21:43:22 +0000
> >>> +Subject: [PATCH]       PR rtl-optimization/83030       * doc/rtl.tex=
i (Flags
> >>> + in an RTL Expression): Alphabetize, add entry         for CROSSING_=
JUMP_P and
> >>> + mention usage of 'jump' for JUMP_INSNs.       (Insns): Delete entry=
 for
> >>> + REG_CROSSING_JUMP in register notes.  * bb-reorder.c
> >>> + (update_crossing_jump_flags): Do not test whether the         CROSS=
ING_JUMP_P flag
> >>> + is already set before setting it.     * cfgrtl.c (fixup_partition_c=
rossing):
> >>> + Likewise.     * reorg.c (relax_delay_slots): Do not consider a
> >>> + CROSSING_JUMP_P insn  as useless.
> >>> +
> >>> +git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@255083 138bc75d-0d04=
-0410-961f-82ee72b054a4
> >>> +
> >>> +Upstream-Status: Backport
> >>> +
> >>> +This patch removes changes to Changelog from the original upstream p=
atch.
> >>> +This will help us avoid conflicts.
> >>> +
> >>> +Original backport to GCC 7.x by Amruta Pawar <Amruta.Pawar@kpit.com>
> >>> +
> >>> +Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> >>> +
> >>> +---
> >>> + gcc/bb-reorder.c |   5 +--
> >>> + gcc/cfgrtl.c     |   3 +-
> >>> + gcc/doc/rtl.texi | 129 ++++++++++++++++++++++++++++----------------=
-----------
> >>> + gcc/reorg.c      |   7 +--
> >>> + 5 files changed, 84 insertions(+), 72 deletions(-)
> >>> +
> >>> +diff --git a/gcc/bb-reorder.c b/gcc/bb-reorder.c
> >>> +index 55e6dc6..794283c 100644
> >>> +--- a/gcc/bb-reorder.c
> >>> ++++ b/gcc/bb-reorder.c
> >>> +@@ -2236,10 +2236,7 @@ update_crossing_jump_flags (void)
> >>> +     FOR_EACH_EDGE (e, ei, bb->succs)
> >>> +       if (e->flags & EDGE_CROSSING)
> >>> +       {
> >>> +-        if (JUMP_P (BB_END (bb))
> >>> +-            /* Some flags were added during fix_up_fall_thru_edges,=
 via
> >>> +-               force_nonfallthru_and_redirect.  */
> >>> +-            && !CROSSING_JUMP_P (BB_END (bb)))
> >>> ++        if (JUMP_P (BB_END (bb)))
> >>> +           CROSSING_JUMP_P (BB_END (bb)) =3D 1;
> >>> +         break;
> >>> +       }
> >>> +diff --git a/gcc/cfgrtl.c b/gcc/cfgrtl.c
> >>> +index d6e5ac0..a2ad075 100644
> >>> +--- a/gcc/cfgrtl.c
> >>> ++++ b/gcc/cfgrtl.c
> >>> +@@ -1334,8 +1334,7 @@ fixup_partition_crossing (edge e)
> >>> +   if (BB_PARTITION (e->src) !=3D BB_PARTITION (e->dest))
> >>> +     {
> >>> +       e->flags |=3D EDGE_CROSSING;
> >>> +-      if (JUMP_P (BB_END (e->src))
> >>> +-        && !CROSSING_JUMP_P (BB_END (e->src)))
> >>> ++      if (JUMP_P (BB_END (e->src)))
> >>> +       CROSSING_JUMP_P (BB_END (e->src)) =3D 1;
> >>> +     }
> >>> +   else if (BB_PARTITION (e->src) =3D=3D BB_PARTITION (e->dest))
> >>> +diff --git a/gcc/doc/rtl.texi b/gcc/doc/rtl.texi
> >>> +index 21524f5..a58eedc 100644
> >>> +--- a/gcc/doc/rtl.texi
> >>> ++++ b/gcc/doc/rtl.texi
> >>> +@@ -565,6 +565,16 @@ that are used in certain types of expression.  =
Most often they
> >>> + are accessed with the following macros, which expand into lvalues.
> >>> +
> >>> + @table @code
> >>> ++@findex CROSSING_JUMP_P
> >>> ++@cindex @code{jump_insn} and @samp{/j}
> >>> ++@item CROSSING_JUMP_P (@var{x})
> >>> ++Nonzero in a @code{jump_insn} if it crosses between hot and cold se=
ctions,
> >>> ++which could potentially be very far apart in the executable.  The p=
resence
> >>> ++of this flag indicates to other optimizations that this branching i=
nstruction
> >>> ++should not be ``collapsed'' into a simpler branching construct.  It=
 is used
> >>> ++when the optimization to partition basic blocks into hot and cold s=
ections
> >>> ++is turned on.
> >>> ++
> >>> + @findex CONSTANT_POOL_ADDRESS_P
> >>> + @cindex @code{symbol_ref} and @samp{/u}
> >>> + @cindex @code{unchanging}, in @code{symbol_ref}
> >>> +@@ -577,37 +587,6 @@ In either case GCC assumes these addresses can =
be addressed directly,
> >>> + perhaps with the help of base registers.
> >>> + Stored in the @code{unchanging} field and printed as @samp{/u}.
> >>> +
> >>> +-@findex RTL_CONST_CALL_P
> >>> +-@cindex @code{call_insn} and @samp{/u}
> >>> +-@cindex @code{unchanging}, in @code{call_insn}
> >>> +-@item RTL_CONST_CALL_P (@var{x})
> >>> +-In a @code{call_insn} indicates that the insn represents a call to =
a
> >>> +-const function.  Stored in the @code{unchanging} field and printed =
as
> >>> +-@samp{/u}.
> >>> +-
> >>> +-@findex RTL_PURE_CALL_P
> >>> +-@cindex @code{call_insn} and @samp{/i}
> >>> +-@cindex @code{return_val}, in @code{call_insn}
> >>> +-@item RTL_PURE_CALL_P (@var{x})
> >>> +-In a @code{call_insn} indicates that the insn represents a call to =
a
> >>> +-pure function.  Stored in the @code{return_val} field and printed a=
s
> >>> +-@samp{/i}.
> >>> +-
> >>> +-@findex RTL_CONST_OR_PURE_CALL_P
> >>> +-@cindex @code{call_insn} and @samp{/u} or @samp{/i}
> >>> +-@item RTL_CONST_OR_PURE_CALL_P (@var{x})
> >>> +-In a @code{call_insn}, true if @code{RTL_CONST_CALL_P} or
> >>> +-@code{RTL_PURE_CALL_P} is true.
> >>> +-
> >>> +-@findex RTL_LOOPING_CONST_OR_PURE_CALL_P
> >>> +-@cindex @code{call_insn} and @samp{/c}
> >>> +-@cindex @code{call}, in @code{call_insn}
> >>> +-@item RTL_LOOPING_CONST_OR_PURE_CALL_P (@var{x})
> >>> +-In a @code{call_insn} indicates that the insn represents a possibly
> >>> +-infinite looping call to a const or pure function.  Stored in the
> >>> +-@code{call} field and printed as @samp{/c}.  Only true if one of
> >>> +-@code{RTL_CONST_CALL_P} or @code{RTL_PURE_CALL_P} is true.
> >>> +-
> >>> + @findex INSN_ANNULLED_BRANCH_P
> >>> + @cindex @code{jump_insn} and @samp{/u}
> >>> + @cindex @code{call_insn} and @samp{/u}
> >>> +@@ -702,6 +681,29 @@ Stored in the @code{call} field and printed as =
@samp{/c}.
> >>> + Nonzero in a @code{mem} if the memory reference holds a pointer.
> >>> + Stored in the @code{frame_related} field and printed as @samp{/f}.
> >>> +
> >>> ++@findex MEM_READONLY_P
> >>> ++@cindex @code{mem} and @samp{/u}
> >>> ++@cindex @code{unchanging}, in @code{mem}
> >>> ++@item MEM_READONLY_P (@var{x})
> >>> ++Nonzero in a @code{mem}, if the memory is statically allocated and =
read-only.
> >>> ++
> >>> ++Read-only in this context means never modified during the lifetime =
of the
> >>> ++program, not necessarily in ROM or in write-disabled pages.  A comm=
on
> >>> ++example of the later is a shared library's global offset table.  Th=
is
> >>> ++table is initialized by the runtime loader, so the memory is techni=
cally
> >>> ++writable, but after control is transferred from the runtime loader =
to the
> >>> ++application, this memory will never be subsequently modified.
> >>> ++
> >>> ++Stored in the @code{unchanging} field and printed as @samp{/u}.
> >>> ++
> >>> ++@findex PREFETCH_SCHEDULE_BARRIER_P
> >>> ++@cindex @code{prefetch} and @samp{/v}
> >>> ++@cindex @code{volatile}, in @code{prefetch}
> >>> ++@item PREFETCH_SCHEDULE_BARRIER_P (@var{x})
> >>> ++In a @code{prefetch}, indicates that the prefetch is a scheduling b=
arrier.
> >>> ++No other INSNs will be moved over it.
> >>> ++Stored in the @code{volatil} field and printed as @samp{/v}.
> >>> ++
> >>> + @findex REG_FUNCTION_VALUE_P
> >>> + @cindex @code{reg} and @samp{/i}
> >>> + @cindex @code{return_val}, in @code{reg}
> >>> +@@ -731,6 +733,37 @@ The same hard register may be used also for col=
lecting the values of
> >>> + functions called by this one, but @code{REG_FUNCTION_VALUE_P} is ze=
ro
> >>> + in this kind of use.
> >>> +
> >>> ++@findex RTL_CONST_CALL_P
> >>> ++@cindex @code{call_insn} and @samp{/u}
> >>> ++@cindex @code{unchanging}, in @code{call_insn}
> >>> ++@item RTL_CONST_CALL_P (@var{x})
> >>> ++In a @code{call_insn} indicates that the insn represents a call to =
a
> >>> ++const function.  Stored in the @code{unchanging} field and printed =
as
> >>> ++@samp{/u}.
> >>> ++
> >>> ++@findex RTL_PURE_CALL_P
> >>> ++@cindex @code{call_insn} and @samp{/i}
> >>> ++@cindex @code{return_val}, in @code{call_insn}
> >>> ++@item RTL_PURE_CALL_P (@var{x})
> >>> ++In a @code{call_insn} indicates that the insn represents a call to =
a
> >>> ++pure function.  Stored in the @code{return_val} field and printed a=
s
> >>> ++@samp{/i}.
> >>> ++
> >>> ++@findex RTL_CONST_OR_PURE_CALL_P
> >>> ++@cindex @code{call_insn} and @samp{/u} or @samp{/i}
> >>> ++@item RTL_CONST_OR_PURE_CALL_P (@var{x})
> >>> ++In a @code{call_insn}, true if @code{RTL_CONST_CALL_P} or
> >>> ++@code{RTL_PURE_CALL_P} is true.
> >>> ++
> >>> ++@findex RTL_LOOPING_CONST_OR_PURE_CALL_P
> >>> ++@cindex @code{call_insn} and @samp{/c}
> >>> ++@cindex @code{call}, in @code{call_insn}
> >>> ++@item RTL_LOOPING_CONST_OR_PURE_CALL_P (@var{x})
> >>> ++In a @code{call_insn} indicates that the insn represents a possibly
> >>> ++infinite looping call to a const or pure function.  Stored in the
> >>> ++@code{call} field and printed as @samp{/c}.  Only true if one of
> >>> ++@code{RTL_CONST_CALL_P} or @code{RTL_PURE_CALL_P} is true.
> >>> ++
> >>> + @findex RTX_FRAME_RELATED_P
> >>> + @cindex @code{insn} and @samp{/f}
> >>> + @cindex @code{call_insn} and @samp{/f}
> >>> +@@ -765,21 +798,6 @@ computation performed by this instruction, i.e.=
, one that
> >>> + This flag is required for exception handling support on targets wit=
h RTL
> >>> + prologues.
> >>> +
> >>> +-@findex MEM_READONLY_P
> >>> +-@cindex @code{mem} and @samp{/u}
> >>> +-@cindex @code{unchanging}, in @code{mem}
> >>> +-@item MEM_READONLY_P (@var{x})
> >>> +-Nonzero in a @code{mem}, if the memory is statically allocated and =
read-only.
> >>> +-
> >>> +-Read-only in this context means never modified during the lifetime =
of the
> >>> +-program, not necessarily in ROM or in write-disabled pages.  A comm=
on
> >>> +-example of the later is a shared library's global offset table.  Th=
is
> >>> +-table is initialized by the runtime loader, so the memory is techni=
cally
> >>> +-writable, but after control is transferred from the runtime loader =
to the
> >>> +-application, this memory will never be subsequently modified.
> >>> +-
> >>> +-Stored in the @code{unchanging} field and printed as @samp{/u}.
> >>> +-
> >>> + @findex SCHED_GROUP_P
> >>> + @cindex @code{insn} and @samp{/s}
> >>> + @cindex @code{call_insn} and @samp{/s}
> >>> +@@ -879,14 +897,6 @@ Stored in the @code{volatil} field and printed =
as @samp{/v}.
> >>> + Most uses of @code{SYMBOL_REF_FLAG} are historic and may be subsume=
d
> >>> + by @code{SYMBOL_REF_FLAGS}.  Certainly use of @code{SYMBOL_REF_FLAG=
S}
> >>> + is mandatory if the target requires more than one bit of storage.
> >>> +-
> >>> +-@findex PREFETCH_SCHEDULE_BARRIER_P
> >>> +-@cindex @code{prefetch} and @samp{/v}
> >>> +-@cindex @code{volatile}, in @code{prefetch}
> >>> +-@item PREFETCH_SCHEDULE_BARRIER_P (@var{x})
> >>> +-In a @code{prefetch}, indicates that the prefetch is a scheduling b=
arrier.
> >>> +-No other INSNs will be moved over it.
> >>> +-Stored in the @code{volatil} field and printed as @samp{/v}.
> >>> + @end table
> >>> +
> >>> + These are the fields to which the above macros refer:
> >>> +@@ -974,6 +985,8 @@ In a @code{set}, 1 means it is for a return.
> >>> +
> >>> + In a @code{call_insn}, 1 means it is a sibling call.
> >>> +
> >>> ++In a @code{jump_insn}, 1 means it is a crossing jump.
> >>> ++
> >>> + In an RTL dump, this flag is represented as @samp{/j}.
> >>> +
> >>> + @findex unchanging
> >>> +@@ -3887,16 +3900,6 @@ multiple targets; the last label in the insn =
(in the highest numbered
> >>> + insn-field) goes into the @code{JUMP_LABEL} field and does not have=
 a
> >>> + @code{REG_LABEL_TARGET} note.  @xref{Insns, JUMP_LABEL}.
> >>> +
> >>> +-@findex REG_CROSSING_JUMP
> >>> +-@item REG_CROSSING_JUMP
> >>> +-This insn is a branching instruction (either an unconditional jump =
or
> >>> +-an indirect jump) which crosses between hot and cold sections, whic=
h
> >>> +-could potentially be very far apart in the executable.  The presenc=
e
> >>> +-of this note indicates to other optimizations that this branching
> >>> +-instruction should not be ``collapsed'' into a simpler branching
> >>> +-construct.  It is used when the optimization to partition basic blo=
cks
> >>> +-into hot and cold sections is turned on.
> >>> +-
> >>> + @findex REG_SETJMP
> >>> + @item REG_SETJMP
> >>> + Appears attached to each @code{CALL_INSN} to @code{setjmp} or a
> >>> +diff --git a/gcc/reorg.c b/gcc/reorg.c
> >>> +index 5914af6..77f3fe7 100644
> >>> +--- a/gcc/reorg.c
> >>> ++++ b/gcc/reorg.c
> >>> +@@ -3360,10 +3360,11 @@ relax_delay_slots (rtx_insn *first)
> >>> +       }
> >>> +
> >>> +       /* See if we have a simple (conditional) jump that is useless=
.  */
> >>> +-      if (! INSN_ANNULLED_BRANCH_P (delay_jump_insn)
> >>> +-        && ! condjump_in_parallel_p (delay_jump_insn)
> >>> ++      if (!CROSSING_JUMP_P (delay_jump_insn)
> >>> ++        && !INSN_ANNULLED_BRANCH_P (delay_jump_insn)
> >>> ++        && !condjump_in_parallel_p (delay_jump_insn)
> >>> +         && prev_active_insn (as_a<rtx_insn *> (target_label)) =3D=
=3D insn
> >>> +-        && ! BARRIER_P (prev_nonnote_insn (as_a<rtx_insn *> (target=
_label)))
> >>> ++        && !BARRIER_P (prev_nonnote_insn (as_a<rtx_insn *> (target_=
label)))
> >>> +         /* If the last insn in the delay slot sets CC0 for some ins=
n,
> >>> +            various code assumes that it is in a delay slot.  We cou=
ld
> >>> +            put it back where it belonged and delete the register no=
tes,
> >>> +--
> >>> +1.8.5.6
> >>> +
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.4/0001-gcc-4.3.1-ARCH_FL=
AGS_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc-7.4/0001-gcc-4.3.1-ARC=
H_FLAGS_FOR_TARGET.patch
> >>> new file mode 100644
> >>> index 0000000..1af1c74
> >>> --- /dev/null
> >>> +++ b/meta/recipes-devtools/gcc/gcc-7.4/0001-gcc-4.3.1-ARCH_FLAGS_FOR=
_TARGET.patch
> >>> @@ -0,0 +1,42 @@
> >>> +From 2fcf1e23ef4b2a5c93526f12212aa892595261f6 Mon Sep 17 00:00:00 20=
01
> >>> +From: Khem Raj <raj.khem@gmail.com>
> >>> +Date: Fri, 29 Mar 2013 08:37:11 +0400
> >>> +Subject: [PATCH 01/47] gcc-4.3.1: ARCH_FLAGS_FOR_TARGET
> >>> +
> >>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> +
> >>> +Upstream-Status: Inappropriate [embedded specific]
> >>> +---
> >>> + configure    | 2 +-
> >>> + configure.ac | 2 +-
> >>> + 2 files changed, 2 insertions(+), 2 deletions(-)
> >>> +
> >>> +diff --git a/configure b/configure
> >>> +index 32a38633ad8..b4760952085 100755
> >>> +--- a/configure
> >>> ++++ b/configure
> >>> +@@ -7472,7 +7472,7 @@ fi
> >>> + # for target_alias and gcc doesn't manage it consistently.
> >>> + target_configargs=3D"--cache-file=3D./config.cache ${target_configa=
rgs}"
> >>> +
> >>> +-FLAGS_FOR_TARGET=3D
> >>> ++FLAGS_FOR_TARGET=3D"$ARCH_FLAGS_FOR_TARGET"
> >>> + case " $target_configdirs " in
> >>> +  *" newlib "*)
> >>> +   case " $target_configargs " in
> >>> +diff --git a/configure.ac b/configure.ac
> >>> +index 12377499295..176ebb921ed 100644
> >>> +--- a/configure.ac
> >>> ++++ b/configure.ac
> >>> +@@ -3065,7 +3065,7 @@ fi
> >>> + # for target_alias and gcc doesn't manage it consistently.
> >>> + target_configargs=3D"--cache-file=3D./config.cache ${target_configa=
rgs}"
> >>> +
> >>> +-FLAGS_FOR_TARGET=3D
> >>> ++FLAGS_FOR_TARGET=3D"$ARCH_FLAGS_FOR_TARGET"
> >>> + case " $target_configdirs " in
> >>> +  *" newlib "*)
> >>> +   case " $target_configargs " in
> >>> +--
> >>> +2.12.2
> >>> +
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.4/0008-c99-snprintf.patc=
h b/meta/recipes-devtools/gcc/gcc-7.4/0008-c99-snprintf.patch
> >>> new file mode 100644
> >>> index 0000000..ebd562b
> >>> --- /dev/null
> >>> +++ b/meta/recipes-devtools/gcc/gcc-7.4/0008-c99-snprintf.patch
> >>> @@ -0,0 +1,28 @@
> >>> +From 732f10eead61830a8aee1bf38cce892da25c35b1 Mon Sep 17 00:00:00 20=
01
> >>> +From: Khem Raj <raj.khem@gmail.com>
> >>> +Date: Fri, 29 Mar 2013 08:49:03 +0400
> >>> +Subject: [PATCH 08/47] c99-snprintf
> >>> +
> >>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> +
> >>> +Upstream-Status: Pending
> >>> +---
> >>> + libstdc++-v3/include/c_std/cstdio | 2 +-
> >>> + 1 file changed, 1 insertion(+), 1 deletion(-)
> >>> +
> >>> +diff --git a/libstdc++-v3/include/c_std/cstdio b/libstdc++-v3/includ=
e/c_std/cstdio
> >>> +index 43969892aa2..12148457909 100644
> >>> +--- a/libstdc++-v3/include/c_std/cstdio
> >>> ++++ b/libstdc++-v3/include/c_std/cstdio
> >>> +@@ -144,7 +144,7 @@ namespace std
> >>> +   using ::vsprintf;
> >>> + } // namespace std
> >>> +
> >>> +-#if _GLIBCXX_USE_C99_STDIO
> >>> ++#if _GLIBCXX_USE_C99_STDIO || defined(__UCLIBC__)
> >>> +
> >>> + #undef snprintf
> >>> + #undef vfscanf
> >>> +--
> >>> +2.12.2
> >>> +
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.4/0009-gcc-poison-system=
-directories.patch b/meta/recipes-devtools/gcc/gcc-7.4/0009-gcc-poison-syst=
em-directories.patch
> >>> new file mode 100644
> >>> index 0000000..fe13ed6
> >>> --- /dev/null
> >>> +++ b/meta/recipes-devtools/gcc/gcc-7.4/0009-gcc-poison-system-direct=
ories.patch
> >>> @@ -0,0 +1,192 @@
> >>> +From 4791a0a0f4595d0a18974f4e85a759a0789943db Mon Sep 17 00:00:00 20=
01
> >>> +From: Khem Raj <raj.khem@gmail.com>
> >>> +Date: Fri, 29 Mar 2013 08:59:00 +0400
> >>> +Subject: [PATCH 09/47] gcc: poison-system-directories
> >>> +
> >>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> +
> >>> +Upstream-Status: Inappropriate [distribution: codesourcery]
> >>> +---
> >>> + gcc/common.opt      |  4 ++++
> >>> + gcc/config.in       |  6 ++++++
> >>> + gcc/configure       | 16 ++++++++++++++++
> >>> + gcc/configure.ac    | 10 ++++++++++
> >>> + gcc/doc/invoke.texi |  9 +++++++++
> >>> + gcc/gcc.c           |  2 ++
> >>> + gcc/incpath.c       | 19 +++++++++++++++++++
> >>> + 7 files changed, 66 insertions(+)
> >>> +
> >>> +diff --git a/gcc/common.opt b/gcc/common.opt
> >>> +index a5c3aeaa336..f02fe66367e 100644
> >>> +--- a/gcc/common.opt
> >>> ++++ b/gcc/common.opt
> >>> +@@ -662,6 +662,10 @@ Wreturn-local-addr
> >>> + Common Var(warn_return_local_addr) Init(1) Warning
> >>> + Warn about returning a pointer/reference to a local or temporary va=
riable.
> >>> +
> >>> ++Wpoison-system-directories
> >>> ++Common Var(flag_poison_system_directories) Init(1) Warning
> >>> ++Warn for -I and -L options using system directories if cross compil=
ing
> >>> ++
> >>> + Wshadow
> >>> + Common Var(warn_shadow) Warning
> >>> + Warn when one variable shadows another.  Same as -Wshadow=3Dglobal.
> >>> +diff --git a/gcc/config.in b/gcc/config.in
> >>> +index bf2aa7b2e7d..b1203987e15 100644
> >>> +--- a/gcc/config.in
> >>> ++++ b/gcc/config.in
> >>> +@@ -194,6 +194,12 @@
> >>> + #endif
> >>> +
> >>> +
> >>> ++/* Define to warn for use of native system header directories */
> >>> ++#ifndef USED_FOR_TARGET
> >>> ++#undef ENABLE_POISON_SYSTEM_DIRECTORIES
> >>> ++#endif
> >>> ++
> >>> ++
> >>> + /* Define if you want all operations on RTL (the basic data structu=
re of the
> >>> +    optimizer and back end) to be checked for dynamic type safety at=
 runtime.
> >>> +    This is quite expensive. */
> >>> +diff --git a/gcc/configure b/gcc/configure
> >>> +index c823ffe6290..4898f04fa6b 100755
> >>> +--- a/gcc/configure
> >>> ++++ b/gcc/configure
> >>> +@@ -949,6 +949,7 @@ with_system_zlib
> >>> + enable_maintainer_mode
> >>> + enable_link_mutex
> >>> + enable_version_specific_runtime_libs
> >>> ++enable_poison_system_directories
> >>> + enable_plugin
> >>> + enable_host_shared
> >>> + enable_libquadmath_support
> >>> +@@ -1691,6 +1692,8 @@ Optional Features:
> >>> +   --enable-version-specific-runtime-libs
> >>> +                           specify that runtime libraries should be =
installed
> >>> +                           in a compiler-specific directory
> >>> ++  --enable-poison-system-directories
> >>> ++                          warn for use of native system header dire=
ctories
> >>> +   --enable-plugin         enable plugin support
> >>> +   --enable-host-shared    build host code as shared libraries
> >>> +   --disable-libquadmath-support
> >>> +@@ -29347,6 +29350,19 @@ if test "${enable_version_specific_runtime_=
libs+set}" =3D set; then :
> >>> + fi
> >>> +
> >>> +
> >>> ++# Check whether --enable-poison-system-directories was given.
> >>> ++if test "${enable_poison_system_directories+set}" =3D set; then :
> >>> ++  enableval=3D$enable_poison_system_directories;
> >>> ++else
> >>> ++  enable_poison_system_directories=3Dno
> >>> ++fi
> >>> ++
> >>> ++if test "x${enable_poison_system_directories}" =3D "xyes"; then
> >>> ++
> >>> ++$as_echo "#define ENABLE_POISON_SYSTEM_DIRECTORIES 1" >>confdefs.h
> >>> ++
> >>> ++fi
> >>> ++
> >>> + # Substitute configuration variables
> >>> +
> >>> +
> >>> +diff --git a/gcc/configure.ac b/gcc/configure.ac
> >>> +index acfe9797389..9dc1dc7fc96 100644
> >>> +--- a/gcc/configure.ac
> >>> ++++ b/gcc/configure.ac
> >>> +@@ -6101,6 +6101,16 @@ AC_ARG_ENABLE(version-specific-runtime-libs,
> >>> +                 [specify that runtime libraries should be
> >>> +                  installed in a compiler-specific directory])])
> >>> +
> >>> ++AC_ARG_ENABLE([poison-system-directories],
> >>> ++             AS_HELP_STRING([--enable-poison-system-directories],
> >>> ++                            [warn for use of native system header d=
irectories]),,
> >>> ++             [enable_poison_system_directories=3Dno])
> >>> ++if test "x${enable_poison_system_directories}" =3D "xyes"; then
> >>> ++  AC_DEFINE([ENABLE_POISON_SYSTEM_DIRECTORIES],
> >>> ++           [1],
> >>> ++           [Define to warn for use of native system header director=
ies])
> >>> ++fi
> >>> ++
> >>> + # Substitute configuration variables
> >>> + AC_SUBST(subdirs)
> >>> + AC_SUBST(srcdir)
> >>> +diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
> >>> +index 68a558e9992..060cd7169c6 100644
> >>> +--- a/gcc/doc/invoke.texi
> >>> ++++ b/gcc/doc/invoke.texi
> >>> +@@ -298,6 +298,7 @@ Objective-C and Objective-C++ Dialects}.
> >>> + -Wpacked  -Wpacked-bitfield-compat  -Wpadded @gol
> >>> + -Wparentheses  -Wno-pedantic-ms-format @gol
> >>> + -Wplacement-new  -Wplacement-new=3D@var{n} @gol
> >>> ++-Wno-poison-system-directories @gol
> >>> + -Wpointer-arith  -Wpointer-compare  -Wno-pointer-to-int-cast @gol
> >>> + -Wno-pragmas  -Wredundant-decls  -Wrestrict  -Wno-return-local-addr=
 @gol
> >>> + -Wreturn-type  -Wsequence-point  -Wshadow  -Wno-shadow-ivar @gol
> >>> +@@ -5395,6 +5396,14 @@ made up of data only and thus requires no spe=
cial treatment.  But, for
> >>> + most targets, it is made up of code and thus requires the stack to =
be
> >>> + made executable in order for the program to work properly.
> >>> +
> >>> ++@item -Wno-poison-system-directories
> >>> ++@opindex Wno-poison-system-directories
> >>> ++Do not warn for @option{-I} or @option{-L} options using system
> >>> ++directories such as @file{/usr/include} when cross compiling.  This
> >>> ++option is intended for use in chroot environments when such
> >>> ++directories contain the correct headers and libraries for the targe=
t
> >>> ++system rather than the host.
> >>> ++
> >>> + @item -Wfloat-equal
> >>> + @opindex Wfloat-equal
> >>> + @opindex Wno-float-equal
> >>> +diff --git a/gcc/gcc.c b/gcc/gcc.c
> >>> +index c48178f..f63d53d 100644
> >>> +--- a/gcc/gcc.c
> >>> ++++ b/gcc/gcc.c
> >>> +@@ -1029,6 +1029,8 @@ proper position among the other output files. =
 */
> >>> +    "%{fuse-ld=3D*:-fuse-ld=3D%*} " LINK_COMPRESS_DEBUG_SPEC \
> >>> +    "%X %{o*} %{e*} %{N} %{n} %{r}\
> >>> +     %{s} %{t} %{u*} %{z} %{Z} %{!nostdlib:%{!nostartfiles:%S}} \
> >>> ++    %{Wno-poison-system-directories:--no-poison-system-directories}=
 \
> >>> ++    %{Werror=3Dpoison-system-directories:--error-poison-system-dire=
ctories} \
> >>> +     %{static|no-pie:} %{L*} %(mfwrap) %(link_libgcc) " \
> >>> +     VTABLE_VERIFICATION_SPEC " " SANITIZER_EARLY_SPEC " %o " CHKP_S=
PEC " \
> >>> +     %{fopenacc|fopenmp|%:gt(%{ftree-parallelize-loops=3D*:%*} 1):\
> >>> +diff --git a/gcc/incpath.c b/gcc/incpath.c
> >>> +index 98fe5ec9ab3..f90e74dbd73 100644
> >>> +--- a/gcc/incpath.c
> >>> ++++ b/gcc/incpath.c
> >>> +@@ -26,6 +26,7 @@
> >>> + #include "intl.h"
> >>> + #include "incpath.h"
> >>> + #include "cppdefault.h"
> >>> ++#include "diagnostic-core.h"
> >>> +
> >>> + /* Microsoft Windows does not natively support inodes.
> >>> +    VMS has non-numeric inodes.  */
> >>> +@@ -382,6 +383,24 @@ merge_include_chains (const char *sysroot, cpp_=
reader *pfile, int verbose)
> >>> +       }
> >>> +       fprintf (stderr, _("End of search list.\n"));
> >>> +     }
> >>> ++
> >>> ++#ifdef ENABLE_POISON_SYSTEM_DIRECTORIES
> >>> ++  if (flag_poison_system_directories)
> >>> ++    {
> >>> ++       struct cpp_dir *p;
> >>> ++
> >>> ++       for (p =3D heads[QUOTE]; p; p =3D p->next)
> >>> ++         {
> >>> ++          if ((!strncmp (p->name, "/usr/include", 12))
> >>> ++              || (!strncmp (p->name, "/usr/local/include", 18))
> >>> ++              || (!strncmp (p->name, "/usr/X11R6/include", 18)))
> >>> ++            warning (OPT_Wpoison_system_directories,
> >>> ++                     "include location \"%s\" is unsafe for "
> >>> ++                     "cross-compilation",
> >>> ++                     p->name);
> >>> ++         }
> >>> ++    }
> >>> ++#endif
> >>> + }
> >>> +
> >>> + /* Use given -I paths for #include "..." but not #include <...>, an=
d
> >>> +--
> >>> +2.12.2
> >>> +
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.4/0010-gcc-poison-dir-ex=
tend.patch b/meta/recipes-devtools/gcc/gcc-7.4/0010-gcc-poison-dir-extend.p=
atch
> >>> new file mode 100644
> >>> index 0000000..4e06aa2
> >>> --- /dev/null
> >>> +++ b/meta/recipes-devtools/gcc/gcc-7.4/0010-gcc-poison-dir-extend.pa=
tch
> >>> @@ -0,0 +1,39 @@
> >>> +From e74ef84ad609b3b6a5c37d207ffc3c6e70d1f025 Mon Sep 17 00:00:00 20=
01
> >>> +From: Khem Raj <raj.khem@gmail.com>
> >>> +Date: Fri, 29 Mar 2013 09:00:34 +0400
> >>> +Subject: [PATCH 10/47] gcc-poison-dir-extend
> >>> +
> >>> +Add /sw/include and /opt/include based on the original
> >>> +zecke-no-host-includes.patch patch.  The original patch checked for
> >>> +/usr/include, /sw/include and /opt/include and then triggered a fail=
ure and
> >>> +aborted.
> >>> +
> >>> +Instead, we add the two missing items to the current scan.  If the u=
ser
> >>> +wants this to be a failure, they can add "-Werror=3Dpoison-system-di=
rectories".
> >>> +
> >>> +Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> >>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> +
> >>> +Upstream-Status: Pending
> >>> +---
> >>> + gcc/incpath.c | 4 +++-
> >>> + 1 file changed, 3 insertions(+), 1 deletion(-)
> >>> +
> >>> +diff --git a/gcc/incpath.c b/gcc/incpath.c
> >>> +index f90e74dbd73..c583ee5061d 100644
> >>> +--- a/gcc/incpath.c
> >>> ++++ b/gcc/incpath.c
> >>> +@@ -393,7 +393,9 @@ merge_include_chains (const char *sysroot, cpp_r=
eader *pfile, int verbose)
> >>> +          {
> >>> +           if ((!strncmp (p->name, "/usr/include", 12))
> >>> +               || (!strncmp (p->name, "/usr/local/include", 18))
> >>> +-              || (!strncmp (p->name, "/usr/X11R6/include", 18)))
> >>> ++              || (!strncmp (p->name, "/usr/X11R6/include", 18))
> >>> ++              || (!strncmp (p->name, "/sw/include", 11))
> >>> ++              || (!strncmp (p->name, "/opt/include", 12)))
> >>> +             warning (OPT_Wpoison_system_directories,
> >>> +                      "include location \"%s\" is unsafe for "
> >>> +                      "cross-compilation",
> >>> +--
> >>> +2.12.2
> >>> +
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.4/0011-gcc-4.3.3-SYSROOT=
_CFLAGS_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc-7.4/0011-gcc-4.3.3=
-SYSROOT_CFLAGS_FOR_TARGET.patch
> >>> new file mode 100644
> >>> index 0000000..b39ff1e
> >>> --- /dev/null
> >>> +++ b/meta/recipes-devtools/gcc/gcc-7.4/0011-gcc-4.3.3-SYSROOT_CFLAGS=
_FOR_TARGET.patch
> >>> @@ -0,0 +1,73 @@
> >>> +From a41d3a53a4e313c20802330d6b5c75358a4ed882 Mon Sep 17 00:00:00 20=
01
> >>> +From: Khem Raj <raj.khem@gmail.com>
> >>> +Date: Fri, 29 Mar 2013 09:08:31 +0400
> >>> +Subject: [PATCH 11/47] gcc-4.3.3: SYSROOT_CFLAGS_FOR_TARGET
> >>> +
> >>> +Before committing, I noticed that PR/32161 was marked as a dup of PR=
/32009, but my previous patch did not fix it.
> >>> +
> >>> +This alternative patch is better because it lets you just use CFLAGS=
_FOR_TARGET to set the compilation flags for libgcc. Since bootstrapped tar=
get libraries are never compiled with the native compiler, it makes little =
sense to use different flags for stage1 and later stages. And it also makes=
 little sense to use a different variable than CFLAGS_FOR_TARGET.
> >>> +
> >>> +Other changes I had to do include:
> >>> +
> >>> +- moving the creation of default CFLAGS_FOR_TARGET from Makefile.am =
to configure.ac, because otherwise the BOOT_CFLAGS are substituted into CFL=
AGS_FOR_TARGET (which is "-O2 -g $(CFLAGS)") via $(CFLAGS). It is also clea=
ner this way though.
> >>> +
> >>> +- passing the right CFLAGS to configure scripts as exported environm=
ent variables
> >>> +
> >>> +I also stopped passing LIBCFLAGS to configure scripts since they are=
 unused in the whole src tree. And I updated the documentation as H-P remin=
ded me to do.
> >>> +
> >>> +Bootstrapped/regtested i686-pc-linux-gnu, will commit to 4.4 shortly=
. Ok for 4.3?
> >>> +
> >>> +Signed-off-by: Paolo Bonzini  <bonzini@gnu.org>
> >>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> +
> >>> +Upstream-Status: Pending
> >>> +---
> >>> + configure | 32 ++++++++++++++++++++++++++++++++
> >>> + 1 file changed, 32 insertions(+)
> >>> +
> >>> +diff --git a/configure b/configure
> >>> +index b4760952085..72a8ba94c4e 100755
> >>> +--- a/configure
> >>> ++++ b/configure
> >>> +@@ -6736,6 +6736,38 @@ fi
> >>> +
> >>> +
> >>> +
> >>> ++# During gcc bootstrap, if we use some random cc for stage1 then CF=
LAGS
> >>> ++# might be empty or "-g".  We don't require a C++ compiler, so CXXF=
LAGS
> >>> ++# might also be empty (or "-g", if a non-GCC C++ compiler is in the=
 path).
> >>> ++# We want to ensure that TARGET libraries (which we know are built =
with
> >>> ++# gcc) are built with "-O2 -g", so include those options when setti=
ng
> >>> ++# CFLAGS_FOR_TARGET and CXXFLAGS_FOR_TARGET.
> >>> ++if test "x$CFLAGS_FOR_TARGET" =3D x; then
> >>> ++  CFLAGS_FOR_TARGET=3D$CFLAGS
> >>> ++  case " $CFLAGS " in
> >>> ++    *" -O2 "*) ;;
> >>> ++    *) CFLAGS_FOR_TARGET=3D"-O2 $CFLAGS" ;;
> >>> ++  esac
> >>> ++  case " $CFLAGS " in
> >>> ++    *" -g "* | *" -g3 "*) ;;
> >>> ++    *) CFLAGS_FOR_TARGET=3D"-g $CFLAGS" ;;
> >>> ++  esac
> >>> ++fi
> >>> ++
> >>> ++
> >>> ++if test "x$CXXFLAGS_FOR_TARGET" =3D x; then
> >>> ++  CXXFLAGS_FOR_TARGET=3D$CXXFLAGS
> >>> ++  case " $CXXFLAGS " in
> >>> ++    *" -O2 "*) ;;
> >>> ++    *) CXXFLAGS_FOR_TARGET=3D"-O2 $CXXFLAGS" ;;
> >>> ++  esac
> >>> ++  case " $CXXFLAGS " in
> >>> ++    *" -g "* | *" -g3 "*) ;;
> >>> ++    *) CXXFLAGS_FOR_TARGET=3D"-g $CXXFLAGS" ;;
> >>> ++  esac
> >>> ++fi
> >>> ++
> >>> ++
> >>> + # Handle --with-headers=3DXXX.  If the value is not "yes", the cont=
ents of
> >>> + # the named directory are copied to $(tooldir)/sys-include.
> >>> + if test x"${with_headers}" !=3D x && test x"${with_headers}" !=3D x=
no ; then
> >>> +--
> >>> +2.12.2
> >>> +
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.4/0012-64-bit-multilib-h=
ack.patch b/meta/recipes-devtools/gcc/gcc-7.4/0012-64-bit-multilib-hack.pat=
ch
> >>> new file mode 100644
> >>> index 0000000..f3b3912
> >>> --- /dev/null
> >>> +++ b/meta/recipes-devtools/gcc/gcc-7.4/0012-64-bit-multilib-hack.pat=
ch
> >>> @@ -0,0 +1,85 @@
> >>> +From 3af9fbbd14e83242ac2acb54bbb4bb726845fd34 Mon Sep 17 00:00:00 20=
01
> >>> +From: Khem Raj <raj.khem@gmail.com>
> >>> +Date: Fri, 29 Mar 2013 09:10:06 +0400
> >>> +Subject: [PATCH 12/47] 64-bit multilib hack.
> >>> +
> >>> +GCC has internal multilib handling code but it assumes a very specif=
ic rigid directory
> >>> +layout. The build system implementation of multilib layout is very g=
eneric and allows
> >>> +complete customisation of the library directories.
> >>> +
> >>> +This patch is a partial solution to allow any custom directories to =
be passed into gcc
> >>> +and handled correctly. It forces gcc to use the base_libdir (which i=
s the current
> >>> +directory, "."). We need to do this for each multilib that is config=
ured as we don't
> >>> +know which compiler options may be being passed into the compiler. S=
ince we have a compiler
> >>> +per mulitlib at this point that isn't an issue.
> >>> +
> >>> +The one problem is the target compiler is only going to work for the=
 default multlilib at
> >>> +this point. Ideally we'd figure out which multilibs were being enabl=
ed with which paths
> >>> +and be able to patch these entries with a complete set of correct pa=
ths but this we
> >>> +don't have such code at this point. This is something the target gcc=
 recipe should do
> >>> +and override these platform defaults in its build config.
> >>> +
> >>> +RP 15/8/11
> >>> +
> >>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> +Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
> >>> +
> >>> +Upstream-Status: Pending
> >>> +---
> >>> + gcc/config/i386/t-linux64   |  6 ++----
> >>> + gcc/config/mips/t-linux64   | 10 +++-------
> >>> + gcc/config/rs6000/t-linux64 |  5 ++---
> >>> + 3 files changed, 7 insertions(+), 14 deletions(-)
> >>> +
> >>> +diff --git a/gcc/config/i386/t-linux64 b/gcc/config/i386/t-linux64
> >>> +index e422c442dae..cc885e24457 100644
> >>> +--- a/gcc/config/i386/t-linux64
> >>> ++++ b/gcc/config/i386/t-linux64
> >>> +@@ -32,7 +32,5 @@
> >>> + #
> >>> + comma=3D,
> >>> + MULTILIB_OPTIONS    =3D $(subst $(comma),/,$(TM_MULTILIB_CONFIG))
> >>> +-MULTILIB_DIRNAMES   =3D $(patsubst m%, %, $(subst /, ,$(MULTILIB_OP=
TIONS)))
> >>> +-MULTILIB_OSDIRNAMES =3D m64=3D../lib64$(call if_multiarch,:x86_64-l=
inux-gnu)
> >>> +-MULTILIB_OSDIRNAMES+=3D m32=3D$(if $(wildcard $(shell echo $(SYSTEM=
_HEADER_DIR))/../../usr/lib32),../lib32,../lib)$(call if_multiarch,:i386-li=
nux-gnu)
> >>> +-MULTILIB_OSDIRNAMES+=3D mx32=3D../libx32$(call if_multiarch,:x86_64=
-linux-gnux32)
> >>> ++MULTILIB_DIRNAMES =3D . .
> >>> ++MULTILIB_OSDIRNAMES =3D ../$(shell basename $(base_libdir)) ../$(sh=
ell basename $(base_libdir))
> >>> +diff --git a/gcc/config/mips/t-linux64 b/gcc/config/mips/t-linux64
> >>> +index 100f9da5e14..601cdf08d05 100644
> >>> +--- a/gcc/config/mips/t-linux64
> >>> ++++ b/gcc/config/mips/t-linux64
> >>> +@@ -17,10 +17,6 @@
> >>> + # <http://www.gnu.org/licenses/>.
> >>> +
> >>> + MULTILIB_OPTIONS =3D mabi=3Dn32/mabi=3D32/mabi=3D64
> >>> +-MULTILIB_DIRNAMES =3D n32 32 64
> >>> +-MIPS_EL =3D $(if $(filter %el, $(firstword $(subst -, ,$(target))))=
,el)
> >>> +-MIPS_SOFT =3D $(if $(strip $(filter MASK_SOFT_FLOAT_ABI, $(target_c=
pu_default)) $(filter soft, $(with_float))),soft)
> >>> +-MULTILIB_OSDIRNAMES =3D \
> >>> +-      ../lib32$(call if_multiarch,:mips64$(MIPS_EL)-linux-gnuabin32=
$(MIPS_SOFT)) \
> >>> +-      ../lib$(call if_multiarch,:mips$(MIPS_EL)-linux-gnu$(MIPS_SOF=
T)) \
> >>> +-      ../lib64$(call if_multiarch,:mips64$(MIPS_EL)-linux-gnuabi64$=
(MIPS_SOFT))
> >>> ++MULTILIB_DIRNAMES =3D . . .
> >>> ++MULTILIB_OSDIRNAMES =3D ../$(shell basename $(base_libdir)) ../$(sh=
ell basename $(base_libdir)) ../$(shell basename $(base_libdir))
> >>> ++
> >>> +diff --git a/gcc/config/rs6000/t-linux64 b/gcc/config/rs6000/t-linux=
64
> >>> +index 2830ed0d861..d057facd2fd 100644
> >>> +--- a/gcc/config/rs6000/t-linux64
> >>> ++++ b/gcc/config/rs6000/t-linux64
> >>> +@@ -26,10 +26,9 @@
> >>> + # MULTILIB_OSDIRNAMES according to what is found on the target.
> >>> +
> >>> + MULTILIB_OPTIONS    :=3D m64/m32
> >>> +-MULTILIB_DIRNAMES   :=3D 64 32
> >>> ++MULTILIB_DIRNAMES   :=3D . .
> >>> + MULTILIB_EXTRA_OPTS :=3D
> >>> +-MULTILIB_OSDIRNAMES :=3D m64=3D../lib64$(call if_multiarch,:powerpc=
64-linux-gnu)
> >>> +-MULTILIB_OSDIRNAMES +=3D m32=3D$(if $(wildcard $(shell echo $(SYSTE=
M_HEADER_DIR))/../../usr/lib32),../lib32,../lib)$(call if_multiarch,:powerp=
c-linux-gnu)
> >>> ++MULTILIB_OSDIRNAMES :=3D ../$(shell basename $(base_libdir)) ../$(s=
hell basename $(base_libdir))
> >>> +
> >>> + rs6000-linux.o: $(srcdir)/config/rs6000/rs6000-linux.c
> >>> +       $(COMPILE) $<
> >>> +--
> >>> +2.12.2
> >>> +
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.4/0013-optional-libstdc.=
patch b/meta/recipes-devtools/gcc/gcc-7.4/0013-optional-libstdc.patch
> >>> new file mode 100644
> >>> index 0000000..3439bf6
> >>> --- /dev/null
> >>> +++ b/meta/recipes-devtools/gcc/gcc-7.4/0013-optional-libstdc.patch
> >>> @@ -0,0 +1,125 @@
> >>> +From 26a58d05844274915d011edbf9330c6151687b22 Mon Sep 17 00:00:00 20=
01
> >>> +From: Khem Raj <raj.khem@gmail.com>
> >>> +Date: Fri, 29 Mar 2013 09:12:56 +0400
> >>> +Subject: [PATCH 13/47] optional libstdc
> >>> +
> >>> +gcc-runtime builds libstdc++ separately from gcc-cross-*. Its config=
ure tests using g++
> >>> +will not run correctly since by default the linker will try to link =
against libstdc++
> >>> +which shouldn't exist yet. We need an option to disable -lstdc++
> >>> +option whilst leaving -lc, -lgcc and other automatic library depende=
ncies added by gcc
> >>> +driver. This patch adds such an option which only disables the -lstd=
c++.
> >>> +
> >>> +A "standard" gcc build uses xgcc and hence avoids this. We should as=
k upstream how to
> >>> +do this officially, the likely answer is don't build libstdc++ separ=
ately.
> >>> +
> >>> +RP 29/6/10
> >>> +
> >>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> +
> >>> +Upstream-Status: Inappropriate [embedded specific]
> >>> +---
> >>> + gcc/c-family/c.opt  |  4 ++++
> >>> + gcc/cp/g++spec.c    |  1 +
> >>> + gcc/doc/invoke.texi | 32 +++++++++++++++++++++++++++++++-
> >>> + gcc/gcc.c           |  1 +
> >>> + 4 files changed, 37 insertions(+), 1 deletion(-)
> >>> +
> >>> +diff --git a/gcc/c-family/c.opt b/gcc/c-family/c.opt
> >>> +index 9ad2f6e1fcc..c4ef7796282 100644
> >>> +--- a/gcc/c-family/c.opt
> >>> ++++ b/gcc/c-family/c.opt
> >>> +@@ -1848,6 +1848,10 @@ nostdinc++
> >>> + C++ ObjC++
> >>> + Do not search standard system include directories for C++.
> >>> +
> >>> ++nostdlib++
> >>> ++Driver
> >>> ++Do not link standard C++ runtime library
> >>> ++
> >>> + o
> >>> + C ObjC C++ ObjC++ Joined Separate
> >>> + ; Documented in common.opt
> >>> +diff --git a/gcc/cp/g++spec.c b/gcc/cp/g++spec.c
> >>> +index ffcc87c79c9..28d8a9cf530 100644
> >>> +--- a/gcc/cp/g++spec.c
> >>> ++++ b/gcc/cp/g++spec.c
> >>> +@@ -137,6 +137,7 @@ lang_specific_driver (struct cl_decoded_option *=
*in_decoded_options,
> >>> +       switch (decoded_options[i].opt_index)
> >>> +       {
> >>> +       case OPT_nostdlib:
> >>> ++      case OPT_nostdlib__:
> >>> +       case OPT_nodefaultlibs:
> >>> +         library =3D -1;
> >>> +         break;
> >>> +diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
> >>> +index 060cd7169c6..8e2adc25644 100644
> >>> +--- a/gcc/doc/invoke.texi
> >>> ++++ b/gcc/doc/invoke.texi
> >>> +@@ -211,6 +211,9 @@ in the following sections.
> >>> + -fno-weak  -nostdinc++ @gol
> >>> + -fvisibility-inlines-hidden @gol
> >>> + -fvisibility-ms-compat @gol
> >>> ++-fvtable-verify=3D@r{[}std@r{|}preinit@r{|}none@r{]} @gol
> >>> ++-fvtv-counts -fvtv-debug @gol
> >>> ++-nostdlib++ @gol
> >>> + -fext-numeric-literals @gol
> >>> + -Wabi=3D@var{n}  -Wabi-tag  -Wconversion-null  -Wctor-dtor-privacy =
@gol
> >>> + -Wdelete-non-virtual-dtor  -Wliteral-suffix  -Wmultiple-inheritance=
 @gol
> >>> +@@ -496,7 +499,7 @@ Objective-C and Objective-C++ Dialects}.
> >>> + -s  -static  -static-libgcc  -static-libstdc++ @gol
> >>> + -static-libasan  -static-libtsan  -static-liblsan  -static-libubsan=
 @gol
> >>> + -static-libmpx  -static-libmpxwrappers @gol
> >>> +--shared  -shared-libgcc  -symbolic @gol
> >>> ++-shared  -shared-libgcc  -symbolic -nostdlib++ @gol
> >>> + -T @var{script}  -Wl,@var{option}  -Xlinker @var{option} @gol
> >>> + -u @var{symbol}  -z @var{keyword}}
> >>> +
> >>> +@@ -11606,6 +11609,33 @@ library subroutines.
> >>> + constructors are called; @pxref{Collect2,,@code{collect2}, gccint,
> >>> + GNU Compiler Collection (GCC) Internals}.)
> >>> +
> >>> ++@item -nostdlib++
> >>> ++@opindex nostdlib++
> >>> ++Do not use the standard system C++ runtime libraries when linking.
> >>> ++Only the libraries you specify will be passed to the linker.
> >>> ++
> >>> ++@cindex @option{-lgcc}, use with @option{-nostdlib}
> >>> ++@cindex @option{-nostdlib} and unresolved references
> >>> ++@cindex unresolved references and @option{-nostdlib}
> >>> ++@cindex @option{-lgcc}, use with @option{-nodefaultlibs}
> >>> ++@cindex @option{-nodefaultlibs} and unresolved references
> >>> ++@cindex unresolved references and @option{-nodefaultlibs}
> >>> ++One of the standard libraries bypassed by @option{-nostdlib} and
> >>> ++@option{-nodefaultlibs} is @file{libgcc.a}, a library of internal s=
ubroutines
> >>> ++which GCC uses to overcome shortcomings of particular machines, or =
special
> >>> ++needs for some languages.
> >>> ++(@xref{Interface,,Interfacing to GCC Output,gccint,GNU Compiler
> >>> ++Collection (GCC) Internals},
> >>> ++for more discussion of @file{libgcc.a}.)
> >>> ++In most cases, you need @file{libgcc.a} even when you want to avoid
> >>> ++other standard libraries.  In other words, when you specify @option=
{-nostdlib}
> >>> ++or @option{-nodefaultlibs} you should usually specify @option{-lgcc=
} as well.
> >>> ++This ensures that you have no unresolved references to internal GCC
> >>> ++library subroutines.
> >>> ++(An example of such an internal subroutine is @code{__main}, used t=
o ensure C++
> >>> ++constructors are called; @pxref{Collect2,,@code{collect2}, gccint,
> >>> ++GNU Compiler Collection (GCC) Internals}.)
> >>> ++
> >>> + @item -pie
> >>> + @opindex pie
> >>> + Produce a position independent executable on targets that support i=
t.
> >>> +diff --git a/gcc/gcc.c b/gcc/gcc.c
> >>> +index 6315aa0dd16..a5fafbe5107 100644
> >>> +--- a/gcc/gcc.c
> >>> ++++ b/gcc/gcc.c
> >>> +@@ -1046,6 +1046,7 @@ proper position among the other output files. =
 */
> >>> +     %(mflib) " STACK_SPLIT_SPEC "\
> >>> +     %{fprofile-arcs|fprofile-generate*|coverage:-lgcov} " SANITIZER=
_SPEC " \
> >>> +     %{!nostdlib:%{!nodefaultlibs:%(link_ssp) %(link_gcc_c_sequence)=
}}\
> >>> ++    %{!nostdlib++:}\
> >>> +     %{!nostdlib:%{!nostartfiles:%E}} %{T*}  \n%(post_link) }}}}}}"
> >>> + #endif
> >>> +
> >>> +--
> >>> +2.12.2
> >>> +
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.4/0014-gcc-disable-MASK_=
RELAX_PIC_CALLS-bit.patch b/meta/recipes-devtools/gcc/gcc-7.4/0014-gcc-disa=
ble-MASK_RELAX_PIC_CALLS-bit.patch
> >>> new file mode 100644
> >>> index 0000000..f92b5fb
> >>> --- /dev/null
> >>> +++ b/meta/recipes-devtools/gcc/gcc-7.4/0014-gcc-disable-MASK_RELAX_P=
IC_CALLS-bit.patch
> >>> @@ -0,0 +1,59 @@
> >>> +From 716de5db6859fd1ea21078c94a41fac7a885b7e9 Mon Sep 17 00:00:00 20=
01
> >>> +From: Khem Raj <raj.khem@gmail.com>
> >>> +Date: Fri, 29 Mar 2013 09:14:20 +0400
> >>> +Subject: [PATCH 14/47] gcc: disable MASK_RELAX_PIC_CALLS bit
> >>> +
> >>> +The new feature added after 4.3.3
> >>> +"http://www.pubbs.net/200909/gcc/94048-patch-add-support-for-rmipsja=
lr.html"
> >>> +will cause cc1plus eat up all the system memory when build webkit-gt=
k.
> >>> +The function mips_get_pic_call_symbol keeps on recursively calling i=
tself.
> >>> +Disable this feature to walk aside the bug.
> >>> +
> >>> +Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
> >>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> +
> >>> +Upstream-Status: Inappropriate [configuration]
> >>> +---
> >>> + gcc/configure    | 7 -------
> >>> + gcc/configure.ac | 7 -------
> >>> + 2 files changed, 14 deletions(-)
> >>> +
> >>> +diff --git a/gcc/configure b/gcc/configure
> >>> +index 4898f04fa6b..640e4643805 100755
> >>> +--- a/gcc/configure
> >>> ++++ b/gcc/configure
> >>> +@@ -27303,13 +27303,6 @@ $as_echo_n "checking assembler and linker f=
or explicit JALR relocation... " >&6;
> >>> +         rm -f conftest.*
> >>> +       fi
> >>> +     fi
> >>> +-    if test $gcc_cv_as_ld_jalr_reloc =3D yes; then
> >>> +-      if test x$target_cpu_default =3D x; then
> >>> +-        target_cpu_default=3DMASK_RELAX_PIC_CALLS
> >>> +-      else
> >>> +-        target_cpu_default=3D"($target_cpu_default)|MASK_RELAX_PIC_=
CALLS"
> >>> +-      fi
> >>> +-    fi
> >>> +     { $as_echo "$as_me:${as_lineno-$LINENO}: result: $gcc_cv_as_ld_=
jalr_reloc" >&5
> >>> + $as_echo "$gcc_cv_as_ld_jalr_reloc" >&6; }
> >>> +
> >>> +diff --git a/gcc/configure.ac b/gcc/configure.ac
> >>> +index 9dc1dc7fc96..9a2dae55ba2 100644
> >>> +--- a/gcc/configure.ac
> >>> ++++ b/gcc/configure.ac
> >>> +@@ -4641,13 +4641,6 @@ x:
> >>> +         rm -f conftest.*
> >>> +       fi
> >>> +     fi
> >>> +-    if test $gcc_cv_as_ld_jalr_reloc =3D yes; then
> >>> +-      if test x$target_cpu_default =3D x; then
> >>> +-        target_cpu_default=3DMASK_RELAX_PIC_CALLS
> >>> +-      else
> >>> +-        target_cpu_default=3D"($target_cpu_default)|MASK_RELAX_PIC_=
CALLS"
> >>> +-      fi
> >>> +-    fi
> >>> +     AC_MSG_RESULT($gcc_cv_as_ld_jalr_reloc)
> >>> +
> >>> +     AC_CACHE_CHECK([linker for .eh_frame personality relaxation],
> >>> +--
> >>> +2.12.2
> >>> +
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.4/0015-COLLECT_GCC_OPTIO=
NS.patch b/meta/recipes-devtools/gcc/gcc-7.4/0015-COLLECT_GCC_OPTIONS.patch
> >>> new file mode 100644
> >>> index 0000000..6e62945
> >>> --- /dev/null
> >>> +++ b/meta/recipes-devtools/gcc/gcc-7.4/0015-COLLECT_GCC_OPTIONS.patc=
h
> >>> @@ -0,0 +1,38 @@
> >>> +From 04a7a672301bb07caea6a7cad8378f63f1fe3200 Mon Sep 17 00:00:00 20=
01
> >>> +From: Khem Raj <raj.khem@gmail.com>
> >>> +Date: Fri, 29 Mar 2013 09:16:28 +0400
> >>> +Subject: [PATCH 15/47] COLLECT_GCC_OPTIONS
> >>> +
> >>> +This patch adds --sysroot into COLLECT_GCC_OPTIONS which is used to
> >>> +invoke collect2.
> >>> +
> >>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> +
> >>> +Upstream-Status: Pending
> >>> +---
> >>> + gcc/gcc.c | 9 +++++++++
> >>> + 1 file changed, 9 insertions(+)
> >>> +
> >>> +diff --git a/gcc/gcc.c b/gcc/gcc.c
> >>> +index a5fafbe5107..05896e19926 100644
> >>> +--- a/gcc/gcc.c
> >>> ++++ b/gcc/gcc.c
> >>> +@@ -4654,6 +4654,15 @@ set_collect_gcc_options (void)
> >>> +               sizeof ("COLLECT_GCC_OPTIONS=3D") - 1);
> >>> +
> >>> +   first_time =3D TRUE;
> >>> ++#ifdef HAVE_LD_SYSROOT
> >>> ++  if (target_system_root_changed && target_system_root)
> >>> ++    {
> >>> ++      obstack_grow (&collect_obstack, "'--sysroot=3D", sizeof("'--s=
ysroot=3D")-1);
> >>> ++      obstack_grow (&collect_obstack, target_system_root,strlen(tar=
get_system_root));
> >>> ++      obstack_grow (&collect_obstack, "'", 1);
> >>> ++      first_time =3D FALSE;
> >>> ++    }
> >>> ++#endif
> >>> +   for (i =3D 0; (int) i < n_switches; i++)
> >>> +     {
> >>> +       const char *const *args;
> >>> +--
> >>> +2.12.2
> >>> +
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.4/0016-Use-the-defaults.=
h-in-B-instead-of-S-and-t-oe-in-B.patch b/meta/recipes-devtools/gcc/gcc-7.4=
/0016-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
> >>> new file mode 100644
> >>> index 0000000..1991251
> >>> --- /dev/null
> >>> +++ b/meta/recipes-devtools/gcc/gcc-7.4/0016-Use-the-defaults.h-in-B-=
instead-of-S-and-t-oe-in-B.patch
> >>> @@ -0,0 +1,96 @@
> >>> +From 47071cbd4f13ff5a4974f71f359a04afcfb125da Mon Sep 17 00:00:00 20=
01
> >>> +From: Khem Raj <raj.khem@gmail.com>
> >>> +Date: Fri, 29 Mar 2013 09:17:25 +0400
> >>> +Subject: [PATCH 16/47] Use the defaults.h in ${B} instead of ${S}, a=
nd t-oe in
> >>> + ${B}
> >>> +
> >>> +Use the defaults.h in ${B} instead of ${S}, and t-oe in ${B}, so tha=
t
> >>> +the source can be shared between gcc-cross-initial,
> >>> +gcc-cross-intermediate, gcc-cross, gcc-runtime, and also the sdk bui=
ld.
> >>> +
> >>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> +
> >>> +Upstream-Status: Pending
> >>> +
> >>> +While compiling gcc-crosssdk-initial-x86_64 on some host, there is
> >>> +occasionally failure that test the existance of default.h doesn't
> >>> +work, the reason is tm_include_list=3D'** defaults.h' rather than
> >>> +tm_include_list=3D'** ./defaults.h'
> >>> +
> >>> +So we add the test condition for this situation.
> >>> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> >>> +---
> >>> + gcc/Makefile.in  | 2 +-
> >>> + gcc/configure    | 4 ++--
> >>> + gcc/configure.ac | 4 ++--
> >>> + gcc/mkconfig.sh  | 4 ++--
> >>> + 4 files changed, 7 insertions(+), 7 deletions(-)
> >>> +
> >>> +diff --git a/gcc/Makefile.in b/gcc/Makefile.in
> >>> +index 2411671cea3..7b590c9bbd3 100644
> >>> +--- a/gcc/Makefile.in
> >>> ++++ b/gcc/Makefile.in
> >>> +@@ -532,7 +532,7 @@ TARGET_SYSTEM_ROOT =3D @TARGET_SYSTEM_ROOT@
> >>> + TARGET_SYSTEM_ROOT_DEFINE =3D @TARGET_SYSTEM_ROOT_DEFINE@
> >>> +
> >>> + xmake_file=3D@xmake_file@
> >>> +-tmake_file=3D@tmake_file@
> >>> ++tmake_file=3D@tmake_file@ ./t-oe
> >>> + TM_ENDIAN_CONFIG=3D@TM_ENDIAN_CONFIG@
> >>> + TM_MULTILIB_CONFIG=3D@TM_MULTILIB_CONFIG@
> >>> + TM_MULTILIB_EXCEPTIONS_CONFIG=3D@TM_MULTILIB_EXCEPTIONS_CONFIG@
> >>> +diff --git a/gcc/configure b/gcc/configure
> >>> +index 640e4643805..b5ac1552541 100755
> >>> +--- a/gcc/configure
> >>> ++++ b/gcc/configure
> >>> +@@ -12150,8 +12150,8 @@ for f in $tm_file; do
> >>> +        tm_include_list=3D"${tm_include_list} $f"
> >>> +        ;;
> >>> +     defaults.h )
> >>> +-       tm_file_list=3D"${tm_file_list} \$(srcdir)/$f"
> >>> +-       tm_include_list=3D"${tm_include_list} $f"
> >>> ++       tm_file_list=3D"${tm_file_list} ./$f"
> >>> ++       tm_include_list=3D"${tm_include_list} ./$f"
> >>> +        ;;
> >>> +     * )
> >>> +        tm_file_list=3D"${tm_file_list} \$(srcdir)/config/$f"
> >>> +diff --git a/gcc/configure.ac b/gcc/configure.ac
> >>> +index 9a2dae55ba2..cb1479d1ef4 100644
> >>> +--- a/gcc/configure.ac
> >>> ++++ b/gcc/configure.ac
> >>> +@@ -1922,8 +1922,8 @@ for f in $tm_file; do
> >>> +        tm_include_list=3D"${tm_include_list} $f"
> >>> +        ;;
> >>> +     defaults.h )
> >>> +-       tm_file_list=3D"${tm_file_list} \$(srcdir)/$f"
> >>> +-       tm_include_list=3D"${tm_include_list} $f"
> >>> ++       tm_file_list=3D"${tm_file_list} ./$f"
> >>> ++       tm_include_list=3D"${tm_include_list} ./$f"
> >>> +        ;;
> >>> +     * )
> >>> +        tm_file_list=3D"${tm_file_list} \$(srcdir)/config/$f"
> >>> +diff --git a/gcc/mkconfig.sh b/gcc/mkconfig.sh
> >>> +index 9fc7b5ca734..04abecfe648 100644
> >>> +--- a/gcc/mkconfig.sh
> >>> ++++ b/gcc/mkconfig.sh
> >>> +@@ -77,7 +77,7 @@ if [ -n "$HEADERS" ]; then
> >>> +     if [ $# -ge 1 ]; then
> >>> +       echo '#ifdef IN_GCC' >> ${output}T
> >>> +       for file in "$@"; do
> >>> +-          if test x"$file" =3D x"defaults.h"; then
> >>> ++          if test x"$file" =3D x"./defaults.h" -o x"$file" =3D x"de=
faults.h"; then
> >>> +               postpone_defaults_h=3D"yes"
> >>> +           else
> >>> +               echo "# include \"$file\"" >> ${output}T
> >>> +@@ -109,7 +109,7 @@ esac
> >>> +
> >>> + # If we postponed including defaults.h, add the #include now.
> >>> + if test x"$postpone_defaults_h" =3D x"yes"; then
> >>> +-    echo "# include \"defaults.h\"" >> ${output}T
> >>> ++    echo "# include \"./defaults.h\"" >> ${output}T
> >>> + fi
> >>> +
> >>> + # Add multiple inclusion protection guard, part two.
> >>> +--
> >>> +2.12.2
> >>> +
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.4/0017-fortran-cross-com=
pile-hack.patch b/meta/recipes-devtools/gcc/gcc-7.4/0017-fortran-cross-comp=
ile-hack.patch
> >>> new file mode 100644
> >>> index 0000000..e2830c5
> >>> --- /dev/null
> >>> +++ b/meta/recipes-devtools/gcc/gcc-7.4/0017-fortran-cross-compile-ha=
ck.patch
> >>> @@ -0,0 +1,46 @@
> >>> +From 4fc35a2bb7666a7de35568eb5d47f0ce6acebe62 Mon Sep 17 00:00:00 20=
01
> >>> +From: Khem Raj <raj.khem@gmail.com>
> >>> +Date: Fri, 29 Mar 2013 09:20:01 +0400
> >>> +Subject: [PATCH 17/47] fortran cross-compile hack.
> >>> +
> >>> +* Fortran would have searched for arm-angstrom-gnueabi-gfortran but =
would have used
> >>> +used gfortan. For gcc_4.2.2.bb we want to use the gfortran compiler =
from our cross
> >>> +directory.
> >>> +
> >>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> +
> >>> +Upstream-Status: Inappropriate [embedded specific]
> >>> +---
> >>> + libgfortran/configure    | 2 +-
> >>> + libgfortran/configure.ac | 2 +-
> >>> + 2 files changed, 2 insertions(+), 2 deletions(-)
> >>> +
> >>> +diff --git a/libgfortran/configure b/libgfortran/configure
> >>> +index 81238fcb79c..7ded7abd456 100755
> >>> +--- a/libgfortran/configure
> >>> ++++ b/libgfortran/configure
> >>> +@@ -12792,7 +12792,7 @@ esac
> >>> +
> >>> + # We need gfortran to compile parts of the library
> >>> + #AC_PROG_FC(gfortran)
> >>> +-FC=3D"$GFORTRAN"
> >>> ++#FC=3D"$GFORTRAN"
> >>> + ac_ext=3D${ac_fc_srcext-f}
> >>> + ac_compile=3D'$FC -c $FCFLAGS $ac_fcflags_srcext conftest.$ac_ext >=
&5'
> >>> + ac_link=3D'$FC -o conftest$ac_exeext $FCFLAGS $LDFLAGS $ac_fcflags_=
srcext conftest.$ac_ext $LIBS >&5'
> >>> +diff --git a/libgfortran/configure.ac b/libgfortran/configure.ac
> >>> +index 37b12d2998f..63a4166ef62 100644
> >>> +--- a/libgfortran/configure.ac
> >>> ++++ b/libgfortran/configure.ac
> >>> +@@ -243,7 +243,7 @@ AC_SUBST(enable_static)
> >>> +
> >>> + # We need gfortran to compile parts of the library
> >>> + #AC_PROG_FC(gfortran)
> >>> +-FC=3D"$GFORTRAN"
> >>> ++#FC=3D"$GFORTRAN"
> >>> + AC_PROG_FC(gfortran)
> >>> +
> >>> + # extra LD Flags which are required for targets
> >>> +--
> >>> +2.12.2
> >>> +
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.4/0018-cpp-honor-sysroot=
.patch b/meta/recipes-devtools/gcc/gcc-7.4/0018-cpp-honor-sysroot.patch
> >>> new file mode 100644
> >>> index 0000000..5559074
> >>> --- /dev/null
> >>> +++ b/meta/recipes-devtools/gcc/gcc-7.4/0018-cpp-honor-sysroot.patch
> >>> @@ -0,0 +1,54 @@
> >>> +From 1c8a332469ca4bfefb10df70720e0dc83ff9a756 Mon Sep 17 00:00:00 20=
01
> >>> +From: Khem Raj <raj.khem@gmail.com>
> >>> +Date: Fri, 29 Mar 2013 09:22:00 +0400
> >>> +Subject: [PATCH 18/47] cpp: honor sysroot.
> >>> +
> >>> +Currently, if the gcc toolchain is relocated and installed from ssta=
te, then you try and compile
> >>> +preprocessed source (.i or .ii files), the compiler will try and acc=
ess the builtin sysroot location
> >>> +rather than the --sysroot option specified on the commandline. If ac=
cess to that directory is
> >>> +permission denied (unreadable), gcc will error.
> >>> +
> >>> +This happens when ccache is in use due to the fact it uses preproces=
sed source files.
> >>> +
> >>> +The fix below adds %I to the cpp-output spec macro so the default su=
bstitutions for -iprefix,
> >>> +-isystem, -isysroot happen and the correct sysroot is used.
> >>> +
> >>> +[YOCTO #2074]
> >>> +
> >>> +RP 2012/04/13
> >>> +
> >>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> +
> >>> +Upstream-Status: Pending
> >>> +---
> >>> + gcc/cp/lang-specs.h | 2 +-
> >>> + gcc/gcc.c           | 2 +-
> >>> + 2 files changed, 2 insertions(+), 2 deletions(-)
> >>> +
> >>> +diff --git a/gcc/cp/lang-specs.h b/gcc/cp/lang-specs.h
> >>> +index 6b383e1d86d..c7c7d6a56ec 100644
> >>> +--- a/gcc/cp/lang-specs.h
> >>> ++++ b/gcc/cp/lang-specs.h
> >>> +@@ -64,5 +64,5 @@ along with GCC; see the file COPYING3.  If not see
> >>> +   {".ii", "@c++-cpp-output", 0, 0, 0},
> >>> +   {"@c++-cpp-output",
> >>> +    "%{!M:%{!MM:%{!E:\
> >>> +-    cc1plus -fpreprocessed %i %(cc1_options) %2\
> >>> ++    cc1plus -fpreprocessed %i %I %(cc1_options) %2\
> >>> +     %{!fsyntax-only:%(invoke_as)}}}}", 0, 0, 0},
> >>> +diff --git a/gcc/gcc.c b/gcc/gcc.c
> >>> +index 05896e19926..c73d4023987 100644
> >>> +--- a/gcc/gcc.c
> >>> ++++ b/gcc/gcc.c
> >>> +@@ -1351,7 +1351,7 @@ static const struct compiler default_compilers=
[] =3D
> >>> +                                          %W{o*:--output-pch=3D%*}}%=
V}}}}}}}", 0, 0, 0},
> >>> +   {".i", "@cpp-output", 0, 0, 0},
> >>> +   {"@cpp-output",
> >>> +-   "%{!M:%{!MM:%{!E:cc1 -fpreprocessed %i %(cc1_options) %{!fsyntax=
-only:%(invoke_as)}}}}", 0, 0, 0},
> >>> ++   "%{!M:%{!MM:%{!E:cc1 -fpreprocessed %i %I %(cc1_options) %{!fsyn=
tax-only:%(invoke_as)}}}}", 0, 0, 0},
> >>> +   {".s", "@assembler", 0, 0, 0},
> >>> +   {"@assembler",
> >>> +    "%{!M:%{!MM:%{!E:%{!S:as %(asm_debug) %(asm_options) %i %A }}}}"=
, 0, 0, 0},
> >>> +--
> >>> +2.12.2
> >>> +
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.4/0019-MIPS64-Default-to=
-N64-ABI.patch b/meta/recipes-devtools/gcc/gcc-7.4/0019-MIPS64-Default-to-N=
64-ABI.patch
> >>> new file mode 100644
> >>> index 0000000..742a401
> >>> --- /dev/null
> >>> +++ b/meta/recipes-devtools/gcc/gcc-7.4/0019-MIPS64-Default-to-N64-AB=
I.patch
> >>> @@ -0,0 +1,57 @@
> >>> +From 0a3b3cc45ea7ba83b46df7464b41c377e3966d88 Mon Sep 17 00:00:00 20=
01
> >>> +From: Khem Raj <raj.khem@gmail.com>
> >>> +Date: Fri, 29 Mar 2013 09:23:08 +0400
> >>> +Subject: [PATCH 19/47] MIPS64: Default to N64 ABI
> >>> +
> >>> +MIPS64 defaults to n32 ABI, this patch makes it
> >>> +so that it defaults to N64 ABI
> >>> +
> >>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> +
> >>> +Upstream-Status: Inappropriate [OE config specific]
> >>> +---
> >>> + gcc/config.gcc | 10 +++++-----
> >>> + 1 file changed, 5 insertions(+), 5 deletions(-)
> >>> +
> >>> +diff --git a/gcc/config.gcc b/gcc/config.gcc
> >>> +index b8bb4d65825..5e45f4b5199 100644
> >>> +--- a/gcc/config.gcc
> >>> ++++ b/gcc/config.gcc
> >>> +@@ -2084,29 +2084,29 @@ mips*-*-linux*)                             =
   # Linux MIPS, either endian.
> >>> +                       default_mips_arch=3Dmips32
> >>> +                       ;;
> >>> +               mips64el-st-linux-gnu)
> >>> +-                      default_mips_abi=3Dn32
> >>> ++                      default_mips_abi=3D64
> >>> +                       tm_file=3D"${tm_file} mips/st.h"
> >>> +                       tmake_file=3D"${tmake_file} mips/t-st"
> >>> +                       enable_mips_multilibs=3D"yes"
> >>> +                       ;;
> >>> +               mips64octeon*-*-linux*)
> >>> +-                      default_mips_abi=3Dn32
> >>> ++                      default_mips_abi=3D64
> >>> +                       tm_defines=3D"${tm_defines} MIPS_CPU_STRING_D=
EFAULT=3D\\\"octeon\\\""
> >>> +                       target_cpu_default=3DMASK_SOFT_FLOAT_ABI
> >>> +                       enable_mips_multilibs=3D"yes"
> >>> +                       ;;
> >>> +               mipsisa64r6*-*-linux*)
> >>> +-                      default_mips_abi=3Dn32
> >>> ++                      default_mips_abi=3D64
> >>> +                       default_mips_arch=3Dmips64r6
> >>> +                       enable_mips_multilibs=3D"yes"
> >>> +                       ;;
> >>> +               mipsisa64r2*-*-linux*)
> >>> +-                      default_mips_abi=3Dn32
> >>> ++                      default_mips_abi=3D64
> >>> +                       default_mips_arch=3Dmips64r2
> >>> +                       enable_mips_multilibs=3D"yes"
> >>> +                       ;;
> >>> +               mips64*-*-linux* | mipsisa64*-*-linux*)
> >>> +-                      default_mips_abi=3Dn32
> >>> ++                      default_mips_abi=3D64
> >>> +                       enable_mips_multilibs=3D"yes"
> >>> +                       ;;
> >>> +       esac
> >>> +--
> >>> +2.12.2
> >>> +
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.4/0020-Define-GLIBC_DYNA=
MIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc-7=
.4/0020-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> >>> new file mode 100644
> >>> index 0000000..de7b4df
> >>> --- /dev/null
> >>> +++ b/meta/recipes-devtools/gcc/gcc-7.4/0020-Define-GLIBC_DYNAMIC_LIN=
KER-and-UCLIBC_DYNAMIC_LINKE.patch
> >>> @@ -0,0 +1,234 @@
> >>> +From d6c983b685ee03e9cf21189108d31ed9f760ff3f Mon Sep 17 00:00:00 20=
01
> >>> +From: Khem Raj <raj.khem@gmail.com>
> >>> +Date: Fri, 29 Mar 2013 09:24:50 +0400
> >>> +Subject: [PATCH 20/47] Define GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMI=
C_LINKER
> >>> + relative to SYSTEMLIBS_DIR
> >>> +
> >>> +This patch defines GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKER
> >>> +relative to SYSTEMLIBS_DIR which can be set in generated headers
> >>> +This breaks the assumption of hardcoded multilib in gcc
> >>> +Change is only for the supported architectures in OE including
> >>> +SH, sparc, alpha for possible future support (if any)
> >>> +
> >>> +Removes the do_headerfix task in metadata
> >>> +
> >>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> +
> >>> +Upstream-Status: Inappropriate [OE configuration]
> >>> +---
> >>> + gcc/config/alpha/linux-elf.h |  4 ++--
> >>> + gcc/config/arm/linux-eabi.h  |  4 ++--
> >>> + gcc/config/arm/linux-elf.h   |  2 +-
> >>> + gcc/config/i386/linux.h      |  2 +-
> >>> + gcc/config/i386/linux64.h    |  6 +++---
> >>> + gcc/config/linux.h           |  8 ++++----
> >>> + gcc/config/mips/linux.h      | 12 ++++++------
> >>> + gcc/config/rs6000/linux64.h  | 16 ++++++----------
> >>> + gcc/config/sh/linux.h        |  2 +-
> >>> + gcc/config/sparc/linux.h     |  2 +-
> >>> + gcc/config/sparc/linux64.h   |  4 ++--
> >>> + 11 files changed, 29 insertions(+), 33 deletions(-)
> >>> +
> >>> +diff --git a/gcc/config/alpha/linux-elf.h b/gcc/config/alpha/linux-e=
lf.h
> >>> +index 2c39fbe601c..6d88e21abe2 100644
> >>> +--- a/gcc/config/alpha/linux-elf.h
> >>> ++++ b/gcc/config/alpha/linux-elf.h
> >>> +@@ -23,8 +23,8 @@ along with GCC; see the file COPYING3.  If not see
> >>> + #define EXTRA_SPECS \
> >>> + { "elf_dynamic_linker", ELF_DYNAMIC_LINKER },
> >>> +
> >>> +-#define GLIBC_DYNAMIC_LINKER  "/lib/ld-linux.so.2"
> >>> +-#define UCLIBC_DYNAMIC_LINKER "/lib/ld-uClibc.so.0"
> >>> ++#define GLIBC_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-linux.so.2"
> >>> ++#define UCLIBC_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-uClibc.so.0"
> >>> + #if DEFAULT_LIBC =3D=3D LIBC_UCLIBC
> >>> + #define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:" G ";:" U "}"
> >>> + #elif DEFAULT_LIBC =3D=3D LIBC_GLIBC
> >>> +diff --git a/gcc/config/arm/linux-eabi.h b/gcc/config/arm/linux-eabi=
.h
> >>> +index a08cfb34377..fbac9a9d994 100644
> >>> +--- a/gcc/config/arm/linux-eabi.h
> >>> ++++ b/gcc/config/arm/linux-eabi.h
> >>> +@@ -62,8 +62,8 @@
> >>> +    GLIBC_DYNAMIC_LINKER_DEFAULT and TARGET_DEFAULT_FLOAT_ABI.  */
> >>> +
> >>> + #undef  GLIBC_DYNAMIC_LINKER
> >>> +-#define GLIBC_DYNAMIC_LINKER_SOFT_FLOAT "/lib/ld-linux.so.3"
> >>> +-#define GLIBC_DYNAMIC_LINKER_HARD_FLOAT "/lib/ld-linux-armhf.so.3"
> >>> ++#define GLIBC_DYNAMIC_LINKER_SOFT_FLOAT SYSTEMLIBS_DIR "ld-linux.so=
.3"
> >>> ++#define GLIBC_DYNAMIC_LINKER_HARD_FLOAT SYSTEMLIBS_DIR "ld-linux-ar=
mhf.so.3"
> >>> + #define GLIBC_DYNAMIC_LINKER_DEFAULT GLIBC_DYNAMIC_LINKER_SOFT_FLOA=
T
> >>> +
> >>> + #define GLIBC_DYNAMIC_LINKER \
> >>> +diff --git a/gcc/config/arm/linux-elf.h b/gcc/config/arm/linux-elf.h
> >>> +index 3d62367ae68..e8a16191849 100644
> >>> +--- a/gcc/config/arm/linux-elf.h
> >>> ++++ b/gcc/config/arm/linux-elf.h
> >>> +@@ -60,7 +60,7 @@
> >>> +
> >>> + #define LIBGCC_SPEC "%{mfloat-abi=3Dsoft*:-lfloat} -lgcc"
> >>> +
> >>> +-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
> >>> ++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
> >>> +
> >>> + #define LINUX_TARGET_LINK_SPEC  "%{h*} \
> >>> +    %{static:-Bstatic} \
> >>> +diff --git a/gcc/config/i386/linux.h b/gcc/config/i386/linux.h
> >>> +index 59132124d6b..336d158629c 100644
> >>> +--- a/gcc/config/i386/linux.h
> >>> ++++ b/gcc/config/i386/linux.h
> >>> +@@ -20,7 +20,7 @@ along with GCC; see the file COPYING3.  If not see
> >>> + <http://www.gnu.org/licenses/>.  */
> >>> +
> >>> + #define GNU_USER_LINK_EMULATION "elf_i386"
> >>> +-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
> >>> ++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
> >>> +
> >>> + #undef MUSL_DYNAMIC_LINKER
> >>> + #define MUSL_DYNAMIC_LINKER "/lib/ld-musl-i386.so.1"
> >>> +diff --git a/gcc/config/i386/linux64.h b/gcc/config/i386/linux64.h
> >>> +index e65c404ff91..c34ded98481 100644
> >>> +--- a/gcc/config/i386/linux64.h
> >>> ++++ b/gcc/config/i386/linux64.h
> >>> +@@ -27,9 +27,9 @@ see the files COPYING3 and COPYING.RUNTIME respect=
ively.  If not, see
> >>> + #define GNU_USER_LINK_EMULATION64 "elf_x86_64"
> >>> + #define GNU_USER_LINK_EMULATIONX32 "elf32_x86_64"
> >>> +
> >>> +-#define GLIBC_DYNAMIC_LINKER32 "/lib/ld-linux.so.2"
> >>> +-#define GLIBC_DYNAMIC_LINKER64 "/lib64/ld-linux-x86-64.so.2"
> >>> +-#define GLIBC_DYNAMIC_LINKERX32 "/libx32/ld-linux-x32.so.2"
> >>> ++#define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-linux.so.2"
> >>> ++#define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld-linux-x86-64.so.2=
"
> >>> ++#define GLIBC_DYNAMIC_LINKERX32 SYSTEMLIBS_DIR "ld-linux-x32.so.2"
> >>> +
> >>> + #undef MUSL_DYNAMIC_LINKER32
> >>> + #define MUSL_DYNAMIC_LINKER32 "/lib/ld-musl-i386.so.1"
> >>> +diff --git a/gcc/config/linux.h b/gcc/config/linux.h
> >>> +index b3a9e85e77f..2e683d0c430 100644
> >>> +--- a/gcc/config/linux.h
> >>> ++++ b/gcc/config/linux.h
> >>> +@@ -81,10 +81,10 @@ see the files COPYING3 and COPYING.RUNTIME respe=
ctively.  If not, see
> >>> +    GLIBC_DYNAMIC_LINKER must be defined for each target using them,=
 or
> >>> +    GLIBC_DYNAMIC_LINKER32 and GLIBC_DYNAMIC_LINKER64 for targets
> >>> +    supporting both 32-bit and 64-bit compilation.  */
> >>> +-#define UCLIBC_DYNAMIC_LINKER "/lib/ld-uClibc.so.0"
> >>> +-#define UCLIBC_DYNAMIC_LINKER32 "/lib/ld-uClibc.so.0"
> >>> +-#define UCLIBC_DYNAMIC_LINKER64 "/lib/ld64-uClibc.so.0"
> >>> +-#define UCLIBC_DYNAMIC_LINKERX32 "/lib/ldx32-uClibc.so.0"
> >>> ++#define UCLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-uClibc.so.0"
> >>> ++#define UCLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-uClibc.so.0"
> >>> ++#define UCLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld64-uClibc.so.0"
> >>> ++#define UCLIBC_DYNAMIC_LINKERX32 SYSTEMLIBS_DIR "ldx32-uClibc.so.0"
> >>> + #define BIONIC_DYNAMIC_LINKER "/system/bin/linker"
> >>> + #define BIONIC_DYNAMIC_LINKER32 "/system/bin/linker"
> >>> + #define BIONIC_DYNAMIC_LINKER64 "/system/bin/linker64"
> >>> +diff --git a/gcc/config/mips/linux.h b/gcc/config/mips/linux.h
> >>> +index 44132b8e44d..80505ad9f48 100644
> >>> +--- a/gcc/config/mips/linux.h
> >>> ++++ b/gcc/config/mips/linux.h
> >>> +@@ -22,20 +22,20 @@ along with GCC; see the file COPYING3.  If not s=
ee
> >>> + #define GNU_USER_LINK_EMULATIONN32 "elf32%{EB:b}%{EL:l}tsmipn32"
> >>> +
> >>> + #define GLIBC_DYNAMIC_LINKER32 \
> >>> +-  "%{mnan=3D2008:/lib/ld-linux-mipsn8.so.1;:/lib/ld.so.1}"
> >>> ++  "%{mnan=3D2008:" SYSTEMLIBS_DIR "ld-linux-mipsn8.so.1;:" SYSTEMLI=
BS_DIR "ld.so.1}"
> >>> + #define GLIBC_DYNAMIC_LINKER64 \
> >>> +-  "%{mnan=3D2008:/lib64/ld-linux-mipsn8.so.1;:/lib64/ld.so.1}"
> >>> ++  "%{mnan=3D2008:" SYSTEMLIBS_DIR "ld-linux-mipsn8.so.1;:" SYSTEMLI=
BS_DIR "ld.so.1}"
> >>> + #define GLIBC_DYNAMIC_LINKERN32 \
> >>> +-  "%{mnan=3D2008:/lib32/ld-linux-mipsn8.so.1;:/lib32/ld.so.1}"
> >>> ++  "%{mnan=3D2008:" SYSTEMLIBS_DIR "ld-linux-mipsn8.so.1;:" SYSTEMLI=
BS_DIR "ld.so.1}"
> >>> +
> >>> + #undef UCLIBC_DYNAMIC_LINKER32
> >>> + #define UCLIBC_DYNAMIC_LINKER32 \
> >>> +-  "%{mnan=3D2008:/lib/ld-uClibc-mipsn8.so.0;:/lib/ld-uClibc.so.0}"
> >>> ++  "%{mnan=3D2008:" SYSTEMLIBS_DIR "ld-uClibc-mipsn8.so.0;:" SYSTEML=
IBS_DIR "ld-uClibc.so.0}"
> >>> + #undef UCLIBC_DYNAMIC_LINKER64
> >>> + #define UCLIBC_DYNAMIC_LINKER64 \
> >>> +-  "%{mnan=3D2008:/lib/ld64-uClibc-mipsn8.so.0;:/lib/ld64-uClibc.so.=
0}"
> >>> ++  "%{mnan=3D2008:" SYSTEMLIBS_DIR "ld64-uClibc-mipsn8.so.0;:" SYSTE=
MLIBS_DIR "ld64-uClibc.so.0}"
> >>> + #define UCLIBC_DYNAMIC_LINKERN32 \
> >>> +-  "%{mnan=3D2008:/lib32/ld-uClibc-mipsn8.so.0;:/lib32/ld-uClibc.so.=
0}"
> >>> ++  "%{mnan=3D2008:" SYSTEMLIBS_DIR "ld-uClibc-mipsn8.so.0;:" SYSTEML=
IBS_DIR "ld-uClibc.so.0}"
> >>> +
> >>> + #undef MUSL_DYNAMIC_LINKER32
> >>> + #define MUSL_DYNAMIC_LINKER32 \
> >>> +diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64=
.h
> >>> +index 71e35b709ad..3b00ec0fcf0 100644
> >>> +--- a/gcc/config/rs6000/linux64.h
> >>> ++++ b/gcc/config/rs6000/linux64.h
> >>> +@@ -412,16 +412,11 @@ extern int dot_symbols;
> >>> + #undef        LINK_OS_DEFAULT_SPEC
> >>> + #define LINK_OS_DEFAULT_SPEC "%(link_os_linux)"
> >>> +
> >>> +-#define GLIBC_DYNAMIC_LINKER32 "%(dynamic_linker_prefix)/lib/ld.so.=
1"
> >>> +-
> >>> ++#define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld.so.1"
> >>> + #ifdef LINUX64_DEFAULT_ABI_ELFv2
> >>> +-#define GLIBC_DYNAMIC_LINKER64 \
> >>> +-"%{mabi=3Delfv1:%(dynamic_linker_prefix)/lib64/ld64.so.1;" \
> >>> +-":%(dynamic_linker_prefix)/lib64/ld64.so.2}"
> >>> ++#define GLIBC_DYNAMIC_LINKER64 "%{mabi=3Delfv1:" SYSTEMLIBS_DIR "ld=
64.so.1;:" SYSTEMLIBS_DIR "ld64.so.2}"
> >>> + #else
> >>> +-#define GLIBC_DYNAMIC_LINKER64 \
> >>> +-"%{mabi=3Delfv2:%(dynamic_linker_prefix)/lib64/ld64.so.2;" \
> >>> +-":%(dynamic_linker_prefix)/lib64/ld64.so.1}"
> >>> ++#define GLIBC_DYNAMIC_LINKER64 "%{mabi=3Delfv2:" SYSTEMLIBS_DIR "ld=
64.so.2;:" SYSTEMLIBS_DIR "ld64.so.1}"
> >>> + #endif
> >>> +
> >>> + #define MUSL_DYNAMIC_LINKER32 \
> >>> +@@ -429,8 +424,9 @@ extern int dot_symbols;
> >>> + #define MUSL_DYNAMIC_LINKER64 \
> >>> +   "/lib/ld-musl-powerpc64" MUSL_DYNAMIC_LINKER_E "%{msoft-float:-sf=
}.so.1"
> >>> +
> >>> +-#define UCLIBC_DYNAMIC_LINKER32 "/lib/ld-uClibc.so.0"
> >>> +-#define UCLIBC_DYNAMIC_LINKER64 "/lib/ld64-uClibc.so.0"
> >>> ++#define UCLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-uClibc.so.0"
> >>> ++#define UCLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld64-uClibc.so.0"
> >>> ++
> >>> + #if DEFAULT_LIBC =3D=3D LIBC_UCLIBC
> >>> + #define CHOOSE_DYNAMIC_LINKER(G, U, M) \
> >>> +   "%{mglibc:" G ";:%{mmusl:" M ";:" U "}}"
> >>> +diff --git a/gcc/config/sh/linux.h b/gcc/config/sh/linux.h
> >>> +index c30083423f2..196b82725f8 100644
> >>> +--- a/gcc/config/sh/linux.h
> >>> ++++ b/gcc/config/sh/linux.h
> >>> +@@ -64,7 +64,7 @@ along with GCC; see the file COPYING3.  If not see
> >>> +   "/lib/ld-musl-sh" MUSL_DYNAMIC_LINKER_E MUSL_DYNAMIC_LINKER_FP \
> >>> +   "%{mfdpic:-fdpic}.so.1"
> >>> +
> >>> +-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
> >>> ++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
> >>> +
> >>> + #undef SUBTARGET_LINK_EMUL_SUFFIX
> >>> + #define SUBTARGET_LINK_EMUL_SUFFIX "%{mfdpic:_fd;:_linux}"
> >>> +diff --git a/gcc/config/sparc/linux.h b/gcc/config/sparc/linux.h
> >>> +index ce084656fca..bed6300cb2a 100644
> >>> +--- a/gcc/config/sparc/linux.h
> >>> ++++ b/gcc/config/sparc/linux.h
> >>> +@@ -83,7 +83,7 @@ extern const char *host_detect_local_cpu (int argc=
, const char **argv);
> >>> +    When the -shared link option is used a final link is not being
> >>> +    done.  */
> >>> +
> >>> +-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
> >>> ++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
> >>> +
> >>> + #undef  LINK_SPEC
> >>> + #define LINK_SPEC "-m elf32_sparc %{shared:-shared} \
> >>> +diff --git a/gcc/config/sparc/linux64.h b/gcc/config/sparc/linux64.h
> >>> +index 573ce8a9a4c..6749f6b5d9c 100644
> >>> +--- a/gcc/config/sparc/linux64.h
> >>> ++++ b/gcc/config/sparc/linux64.h
> >>> +@@ -84,8 +84,8 @@ along with GCC; see the file COPYING3.  If not see
> >>> +    When the -shared link option is used a final link is not being
> >>> +    done.  */
> >>> +
> >>> +-#define GLIBC_DYNAMIC_LINKER32 "/lib/ld-linux.so.2"
> >>> +-#define GLIBC_DYNAMIC_LINKER64 "/lib64/ld-linux.so.2"
> >>> ++#define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-linux.so.2"
> >>> ++#define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld-linux.so.2"
> >>> +
> >>> + #ifdef SPARC_BI_ARCH
> >>> +
> >>> +--
> >>> +2.12.2
> >>> +
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.4/0021-gcc-Fix-argument-=
list-too-long-error.patch b/meta/recipes-devtools/gcc/gcc-7.4/0021-gcc-Fix-=
argument-list-too-long-error.patch
> >>> new file mode 100644
> >>> index 0000000..4e56214
> >>> --- /dev/null
> >>> +++ b/meta/recipes-devtools/gcc/gcc-7.4/0021-gcc-Fix-argument-list-to=
o-long-error.patch
> >>> @@ -0,0 +1,40 @@
> >>> +From 80c24247fed52c1269791088090bc0fa85280983 Mon Sep 17 00:00:00 20=
01
> >>> +From: Khem Raj <raj.khem@gmail.com>
> >>> +Date: Fri, 29 Mar 2013 09:26:37 +0400
> >>> +Subject: [PATCH 21/47] gcc: Fix argument list too long error.
> >>> +
> >>> +There would be an "Argument list too long" error when the
> >>> +build directory is longer than 200, this is caused by:
> >>> +
> >>> +headers=3D`echo $(PLUGIN_HEADERS) | tr ' ' '\012' | sort -u`
> >>> +
> >>> +The PLUGIN_HEADERS is too long before sort, so the "echo" can't hand=
le
> >>> +it, use the $(sort list) of GNU make which can handle the too long l=
ist
> >>> +would fix the problem, the header would be short enough after sorted=
.
> >>> +The "tr ' ' '\012'" was used for translating the space to "\n", the
> >>> +$(sort list) doesn't need this.
> >>> +
> >>> +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> >>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> +
> >>> +Upstream-Status: Pending
> >>> +---
> >>> + gcc/Makefile.in | 2 +-
> >>> + 1 file changed, 1 insertion(+), 1 deletion(-)
> >>> +
> >>> +diff --git a/gcc/Makefile.in b/gcc/Makefile.in
> >>> +index 7b590c9bbd3..23cca7f0d5a 100644
> >>> +--- a/gcc/Makefile.in
> >>> ++++ b/gcc/Makefile.in
> >>> +@@ -3459,7 +3459,7 @@ install-plugin: installdirs lang.install-plugi=
n s-header-vars install-gengtype
> >>> + # We keep the directory structure for files in config or c-family a=
nd .def
> >>> + # files. All other files are flattened to a single directory.
> >>> +       $(mkinstalldirs) $(DESTDIR)$(plugin_includedir)
> >>> +-      headers=3D`echo $(PLUGIN_HEADERS) $$(cd $(srcdir); echo *.h *=
.def) | tr ' ' '\012' | sort -u`; \
> >>> ++      headers=3D"$(sort $(PLUGIN_HEADERS) $$(cd $(srcdir); echo *.h=
 *.def))"; \
> >>> +       srcdirstrip=3D`echo "$(srcdir)" | sed 's/[].[^$$\\*|]/\\\\&/g=
'`; \
> >>> +       for file in $$headers; do \
> >>> +         if [ -f $$file ] ; then \
> >>> +--
> >>> +2.12.2
> >>> +
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.4/0022-Disable-sdt.patch=
 b/meta/recipes-devtools/gcc/gcc-7.4/0022-Disable-sdt.patch
> >>> new file mode 100644
> >>> index 0000000..871f195
> >>> --- /dev/null
> >>> +++ b/meta/recipes-devtools/gcc/gcc-7.4/0022-Disable-sdt.patch
> >>> @@ -0,0 +1,113 @@
> >>> +From 3021fec485f44478a3d5fffb4adac13d831fcdc1 Mon Sep 17 00:00:00 20=
01
> >>> +From: Khem Raj <raj.khem@gmail.com>
> >>> +Date: Fri, 29 Mar 2013 09:28:10 +0400
> >>> +Subject: [PATCH 22/47] Disable sdt.
> >>> +
> >>> +We don't list dtrace in DEPENDS so we shouldn't be depending on this=
 header.
> >>> +It may or may not exist from preivous builds though. To be determins=
tic, disable
> >>> +sdt.h usage always. This avoids build failures if the header is remo=
ved after configure
> >>> +but before libgcc is compiled for example.
> >>> +
> >>> +RP 2012/8/7
> >>> +
> >>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> +
> >>> +Disable sdt for libstdc++-v3.
> >>> +
> >>> +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> >>> +
> >>> +Upstream-Status: Inappropriate [hack]
> >>> +---
> >>> + gcc/configure             | 12 ++++++------
> >>> + gcc/configure.ac          | 18 +++++++++---------
> >>> + libstdc++-v3/configure    |  6 +++---
> >>> + libstdc++-v3/configure.ac |  2 +-
> >>> + 4 files changed, 19 insertions(+), 19 deletions(-)
> >>> +
> >>> +diff --git a/gcc/configure b/gcc/configure
> >>> +index b5ac1552541..08b2f63c7fa 100755
> >>> +--- a/gcc/configure
> >>> ++++ b/gcc/configure
> >>> +@@ -28967,12 +28967,12 @@ fi
> >>> + { $as_echo "$as_me:${as_lineno-$LINENO}: checking sys/sdt.h in the =
target C library" >&5
> >>> + $as_echo_n "checking sys/sdt.h in the target C library... " >&6; }
> >>> + have_sys_sdt_h=3Dno
> >>> +-if test -f $target_header_dir/sys/sdt.h; then
> >>> +-  have_sys_sdt_h=3Dyes
> >>> +-
> >>> +-$as_echo "#define HAVE_SYS_SDT_H 1" >>confdefs.h
> >>> +-
> >>> +-fi
> >>> ++#if test -f $target_header_dir/sys/sdt.h; then
> >>> ++#  have_sys_sdt_h=3Dyes
> >>> ++#
> >>> ++#$as_echo "#define HAVE_SYS_SDT_H 1" >>confdefs.h
> >>> ++#
> >>> ++#fi
> >>> + { $as_echo "$as_me:${as_lineno-$LINENO}: result: $have_sys_sdt_h" >=
&5
> >>> + $as_echo "$have_sys_sdt_h" >&6; }
> >>> +
> >>> +diff --git a/gcc/configure.ac b/gcc/configure.ac
> >>> +index cb1479d1ef4..0581fe963dc 100644
> >>> +--- a/gcc/configure.ac
> >>> ++++ b/gcc/configure.ac
> >>> +@@ -5754,15 +5754,15 @@ fi
> >>> + AC_SUBST([enable_default_ssp])
> >>> +
> >>> + # Test for <sys/sdt.h> on the target.
> >>> +-GCC_TARGET_TEMPLATE([HAVE_SYS_SDT_H])
> >>> +-AC_MSG_CHECKING(sys/sdt.h in the target C library)
> >>> +-have_sys_sdt_h=3Dno
> >>> +-if test -f $target_header_dir/sys/sdt.h; then
> >>> +-  have_sys_sdt_h=3Dyes
> >>> +-  AC_DEFINE(HAVE_SYS_SDT_H, 1,
> >>> +-            [Define if your target C library provides sys/sdt.h])
> >>> +-fi
> >>> +-AC_MSG_RESULT($have_sys_sdt_h)
> >>> ++#GCC_TARGET_TEMPLATE([HAVE_SYS_SDT_H])
> >>> ++#AC_MSG_CHECKING(sys/sdt.h in the target C library)
> >>> ++#have_sys_sdt_h=3Dno
> >>> ++#if test -f $target_header_dir/sys/sdt.h; then
> >>> ++#  have_sys_sdt_h=3Dyes
> >>> ++#  AC_DEFINE(HAVE_SYS_SDT_H, 1,
> >>> ++#            [Define if your target C library provides sys/sdt.h])
> >>> ++#fi
> >>> ++#AC_MSG_RESULT($have_sys_sdt_h)
> >>> +
> >>> + # Check if TFmode long double should be used by default or not.
> >>> + # Some glibc targets used DFmode long double, but with glibc 2.4
> >>> +diff --git a/libstdc++-v3/configure b/libstdc++-v3/configure
> >>> +index fb7e126c0b0..a18057feb88 100755
> >>> +--- a/libstdc++-v3/configure
> >>> ++++ b/libstdc++-v3/configure
> >>> +@@ -21856,11 +21856,11 @@ ac_compile=3D'$CC -c $CFLAGS $CPPFLAGS con=
ftest.$ac_ext >&5'
> >>> + ac_link=3D'$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS con=
ftest.$ac_ext $LIBS >&5'
> >>> + ac_compiler_gnu=3D$ac_cv_c_compiler_gnu
> >>> +
> >>> +-  if test $glibcxx_cv_sys_sdt_h =3D yes; then
> >>> ++#  if test $glibcxx_cv_sys_sdt_h =3D yes; then
> >>> +
> >>> +-$as_echo "#define HAVE_SYS_SDT_H 1" >>confdefs.h
> >>> ++#$as_echo "#define HAVE_SYS_SDT_H 1" >>confdefs.h
> >>> +
> >>> +-  fi
> >>> ++#  fi
> >>> +   { $as_echo "$as_me:${as_lineno-$LINENO}: result: $glibcxx_cv_sys_=
sdt_h" >&5
> >>> + $as_echo "$glibcxx_cv_sys_sdt_h" >&6; }
> >>> +
> >>> +diff --git a/libstdc++-v3/configure.ac b/libstdc++-v3/configure.ac
> >>> +index 8e973503be0..a46d25e740d 100644
> >>> +--- a/libstdc++-v3/configure.ac
> >>> ++++ b/libstdc++-v3/configure.ac
> >>> +@@ -230,7 +230,7 @@ GLIBCXX_CHECK_SC_NPROCESSORS_ONLN
> >>> + GLIBCXX_CHECK_SC_NPROC_ONLN
> >>> + GLIBCXX_CHECK_PTHREADS_NUM_PROCESSORS_NP
> >>> + GLIBCXX_CHECK_SYSCTL_HW_NCPU
> >>> +-GLIBCXX_CHECK_SDT_H
> >>> ++#GLIBCXX_CHECK_SDT_H
> >>> +
> >>> + # Check for available headers.
> >>> + AC_CHECK_HEADERS([endian.h execinfo.h float.h fp.h ieeefp.h inttype=
s.h \
> >>> +--
> >>> +2.12.2
> >>> +
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.4/0023-libtool.patch b/m=
eta/recipes-devtools/gcc/gcc-7.4/0023-libtool.patch
> >>> new file mode 100644
> >>> index 0000000..27dfb1f
> >>> --- /dev/null
> >>> +++ b/meta/recipes-devtools/gcc/gcc-7.4/0023-libtool.patch
> >>> @@ -0,0 +1,42 @@
> >>> +From e79a4f8169e836c8deabca5a45884cfe11d07847 Mon Sep 17 00:00:00 20=
01
> >>> +From: Khem Raj <raj.khem@gmail.com>
> >>> +Date: Fri, 29 Mar 2013 09:29:11 +0400
> >>> +Subject: [PATCH 23/47] libtool
> >>> +
> >>> +libstdc++ from gcc-runtime gets created with -rpath=3D/usr/lib/../li=
b for qemux86-64
> >>> +when running on am x86_64 build host.
> >>> +
> >>> +This patch stops this speading to libdir in the libstdc++.la file wi=
thin libtool.
> >>> +Arguably, it shouldn't be passing this into libtool in the first pla=
ce but
> >>> +for now this resolves the nastiest problems this causes.
> >>> +
> >>> +func_normal_abspath would resolve an empty path to `pwd` so we need
> >>> +to filter the zero case.
> >>> +
> >>> +RP 2012/8/24
> >>> +
> >>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> +
> >>> +Upstream-Status: Pending
> >>> +---
> >>> + ltmain.sh | 4 ++++
> >>> + 1 file changed, 4 insertions(+)
> >>> +
> >>> +diff --git a/ltmain.sh b/ltmain.sh
> >>> +index 9503ec85d70..0121fba707f 100644
> >>> +--- a/ltmain.sh
> >>> ++++ b/ltmain.sh
> >>> +@@ -6359,6 +6359,10 @@ func_mode_link ()
> >>> +       func_warning "ignoring multiple \`-rpath's for a libtool libr=
ary"
> >>> +
> >>> +       install_libdir=3D"$1"
> >>> ++      if test -n "$install_libdir"; then
> >>> ++      func_normal_abspath "$install_libdir"
> >>> ++      install_libdir=3D$func_normal_abspath_result
> >>> ++      fi
> >>> +
> >>> +       oldlibs=3D
> >>> +       if test -z "$rpath"; then
> >>> +--
> >>> +2.12.2
> >>> +
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.4/0024-gcc-armv4-pass-fi=
x-v4bx-to-linker-to-support-EABI.patch b/meta/recipes-devtools/gcc/gcc-7.4/=
0024-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
> >>> new file mode 100644
> >>> index 0000000..aa1e1bb
> >>> --- /dev/null
> >>> +++ b/meta/recipes-devtools/gcc/gcc-7.4/0024-gcc-armv4-pass-fix-v4bx-=
to-linker-to-support-EABI.patch
> >>> @@ -0,0 +1,43 @@
> >>> +From 74d8dc48cb185e304c60067b4d8b50447ec328ec Mon Sep 17 00:00:00 20=
01
> >>> +From: Khem Raj <raj.khem@gmail.com>
> >>> +Date: Fri, 29 Mar 2013 09:30:32 +0400
> >>> +Subject: [PATCH 24/47] gcc: armv4: pass fix-v4bx to linker to suppor=
t EABI.
> >>> +
> >>> +The LINK_SPEC for linux gets overwritten by linux-eabi.h which
> >>> +means the value of TARGET_FIX_V4BX_SPEC gets lost and as a result
> >>> +the option is not passed to linker when chosing march=3Darmv4
> >>> +This patch redefines this in linux-eabi.h and reinserts it
> >>> +for eabi defaulting toolchains.
> >>> +
> >>> +We might want to send it upstream.
> >>> +
> >>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> +
> >>> +Upstream-Status: Pending
> >>> +---
> >>> + gcc/config/arm/linux-eabi.h | 6 +++++-
> >>> + 1 file changed, 5 insertions(+), 1 deletion(-)
> >>> +
> >>> +diff --git a/gcc/config/arm/linux-eabi.h b/gcc/config/arm/linux-eabi=
.h
> >>> +index fbac9a9d994..5a51a8a7095 100644
> >>> +--- a/gcc/config/arm/linux-eabi.h
> >>> ++++ b/gcc/config/arm/linux-eabi.h
> >>> +@@ -88,10 +88,14 @@
> >>> + #define MUSL_DYNAMIC_LINKER \
> >>> +   "/lib/ld-musl-arm" MUSL_DYNAMIC_LINKER_E "%{mfloat-abi=3Dhard:hf}=
.so.1"
> >>> +
> >>> ++/* For armv4 we pass --fix-v4bx to linker to support EABI */
> >>> ++#undef TARGET_FIX_V4BX_SPEC
> >>> ++#define TARGET_FIX_V4BX_SPEC "%{mcpu=3Darm8|mcpu=3Darm810|mcpu=3Dst=
rongarm*|march=3Darmv4: --fix-v4bx}"
> >>> ++
> >>> + /* At this point, bpabi.h will have clobbered LINK_SPEC.  We want t=
o
> >>> +    use the GNU/Linux version, not the generic BPABI version.  */
> >>> + #undef  LINK_SPEC
> >>> +-#define LINK_SPEC EABI_LINK_SPEC                                   =
   \
> >>> ++#define LINK_SPEC TARGET_FIX_V4BX_SPEC EABI_LINK_SPEC              =
   \
> >>> +   LINUX_OR_ANDROID_LD (LINUX_TARGET_LINK_SPEC,                     =
           \
> >>> +                      LINUX_TARGET_LINK_SPEC " " ANDROID_LINK_SPEC)
> >>> +
> >>> +--
> >>> +2.12.2
> >>> +
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.4/0025-Use-the-multilib-=
config-files-from-B-instead-of-usin.patch b/meta/recipes-devtools/gcc/gcc-7=
.4/0025-Use-the-multilib-config-files-from-B-instead-of-usin.patch
> >>> new file mode 100644
> >>> index 0000000..b234132
> >>> --- /dev/null
> >>> +++ b/meta/recipes-devtools/gcc/gcc-7.4/0025-Use-the-multilib-config-=
files-from-B-instead-of-usin.patch
> >>> @@ -0,0 +1,102 @@
> >>> +From ac50dc3010a66220ad483c09efe270bb3f4c9424 Mon Sep 17 00:00:00 20=
01
> >>> +From: Khem Raj <raj.khem@gmail.com>
> >>> +Date: Fri, 29 Mar 2013 09:33:04 +0400
> >>> +Subject: [PATCH 25/47] Use the multilib config files from ${B} inste=
ad of
> >>> + using the ones from ${S}
> >>> +
> >>> +Use the multilib config files from ${B} instead of using the ones fr=
om ${S}
> >>> +so that the source can be shared between gcc-cross-initial,
> >>> +gcc-cross-intermediate, gcc-cross, gcc-runtime, and also the sdk bui=
ld.
> >>> +
> >>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> +Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> >>> +
> >>> +Upstream-Status: Inappropriate [configuration]
> >>> +---
> >>> + gcc/configure    | 22 ++++++++++++++++++----
> >>> + gcc/configure.ac | 22 ++++++++++++++++++----
> >>> + 2 files changed, 36 insertions(+), 8 deletions(-)
> >>> +
> >>> +diff --git a/gcc/configure b/gcc/configure
> >>> +index 08b2f63c7fa..6ba391ed068 100755
> >>> +--- a/gcc/configure
> >>> ++++ b/gcc/configure
> >>> +@@ -12130,10 +12130,20 @@ done
> >>> + tmake_file_=3D
> >>> + for f in ${tmake_file}
> >>> + do
> >>> +-      if test -f ${srcdir}/config/$f
> >>> +-      then
> >>> +-              tmake_file_=3D"${tmake_file_} \$(srcdir)/config/$f"
> >>> +-      fi
> >>> ++  case $f in
> >>> ++    */t-linux64 )
> >>> ++       if test -f ./config/$f
> >>> ++       then
> >>> ++         tmake_file_=3D"${tmake_file_} ./config/$f"
> >>> ++       fi
> >>> ++       ;;
> >>> ++    * )
> >>> ++       if test -f ${srcdir}/config/$f
> >>> ++       then
> >>> ++         tmake_file_=3D"${tmake_file_} \$(srcdir)/config/$f"
> >>> ++       fi
> >>> ++       ;;
> >>> ++  esac
> >>> + done
> >>> + tmake_file=3D"${tmake_file_}"
> >>> +
> >>> +@@ -12144,6 +12154,10 @@ tm_file_list=3D"options.h"
> >>> + tm_include_list=3D"options.h insn-constants.h"
> >>> + for f in $tm_file; do
> >>> +   case $f in
> >>> ++    */linux64.h )
> >>> ++       tm_file_list=3D"${tm_file_list} ./config/$f"
> >>> ++       tm_include_list=3D"${tm_include_list} ./config/$f"
> >>> ++       ;;
> >>> +     ./* )
> >>> +        f=3D`echo $f | sed 's/^..//'`
> >>> +        tm_file_list=3D"${tm_file_list} $f"
> >>> +diff --git a/gcc/configure.ac b/gcc/configure.ac
> >>> +index 0581fe963dc..8551a412df3 100644
> >>> +--- a/gcc/configure.ac
> >>> ++++ b/gcc/configure.ac
> >>> +@@ -1902,10 +1902,20 @@ done
> >>> + tmake_file_=3D
> >>> + for f in ${tmake_file}
> >>> + do
> >>> +-      if test -f ${srcdir}/config/$f
> >>> +-      then
> >>> +-              tmake_file_=3D"${tmake_file_} \$(srcdir)/config/$f"
> >>> +-      fi
> >>> ++  case $f in
> >>> ++    */t-linux64 )
> >>> ++       if test -f ./config/$f
> >>> ++       then
> >>> ++         tmake_file_=3D"${tmake_file_} ./config/$f"
> >>> ++       fi
> >>> ++       ;;
> >>> ++    * )
> >>> ++       if test -f ${srcdir}/config/$f
> >>> ++       then
> >>> ++         tmake_file_=3D"${tmake_file_} \$(srcdir)/config/$f"
> >>> ++       fi
> >>> ++       ;;
> >>> ++  esac
> >>> + done
> >>> + tmake_file=3D"${tmake_file_}"
> >>> +
> >>> +@@ -1916,6 +1926,10 @@ tm_file_list=3D"options.h"
> >>> + tm_include_list=3D"options.h insn-constants.h"
> >>> + for f in $tm_file; do
> >>> +   case $f in
> >>> ++    */linux64.h )
> >>> ++       tm_file_list=3D"${tm_file_list} ./config/$f"
> >>> ++       tm_include_list=3D"${tm_include_list} ./config/$f"
> >>> ++       ;;
> >>> +     ./* )
> >>> +        f=3D`echo $f | sed 's/^..//'`
> >>> +        tm_file_list=3D"${tm_file_list} $f"
> >>> +--
> >>> +2.12.2
> >>> +
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.4/0026-Avoid-using-libdi=
r-from-.la-which-usually-points-to-.patch b/meta/recipes-devtools/gcc/gcc-7=
.4/0026-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
> >>> new file mode 100644
> >>> index 0000000..fe24713
> >>> --- /dev/null
> >>> +++ b/meta/recipes-devtools/gcc/gcc-7.4/0026-Avoid-using-libdir-from-=
.la-which-usually-points-to-.patch
> >>> @@ -0,0 +1,31 @@
> >>> +From 9fab47d8662986ad887d9eddc39fcbe25e576383 Mon Sep 17 00:00:00 20=
01
> >>> +From: Khem Raj <raj.khem@gmail.com>
> >>> +Date: Fri, 20 Feb 2015 09:39:38 +0000
> >>> +Subject: [PATCH 26/47] Avoid using libdir from .la which usually poi=
nts to a
> >>> + host path
> >>> +
> >>> +Upstream-Status: Inappropriate [embedded specific]
> >>> +
> >>> +Signed-off-by: Jonathan Liu <net147@gmail.com>
> >>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> +---
> >>> + ltmain.sh | 3 +++
> >>> + 1 file changed, 3 insertions(+)
> >>> +
> >>> +diff --git a/ltmain.sh b/ltmain.sh
> >>> +index 0121fba707f..52bdbdb5f9c 100644
> >>> +--- a/ltmain.sh
> >>> ++++ b/ltmain.sh
> >>> +@@ -5628,6 +5628,9 @@ func_mode_link ()
> >>> +           absdir=3D"$abs_ladir"
> >>> +           libdir=3D"$abs_ladir"
> >>> +         else
> >>> ++          # Instead of using libdir from .la which usually points t=
o a host path,
> >>> ++          # use the path the .la is contained in.
> >>> ++          libdir=3D"$abs_ladir"
> >>> +           dir=3D"$libdir"
> >>> +           absdir=3D"$libdir"
> >>> +         fi
> >>> +--
> >>> +2.12.2
> >>> +
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.4/0027-export-CPP.patch =
b/meta/recipes-devtools/gcc/gcc-7.4/0027-export-CPP.patch
> >>> new file mode 100644
> >>> index 0000000..4f9e1f0
> >>> --- /dev/null
> >>> +++ b/meta/recipes-devtools/gcc/gcc-7.4/0027-export-CPP.patch
> >>> @@ -0,0 +1,53 @@
> >>> +From fa6a46fdf73de7eacd289c084bbde6643b23f73b Mon Sep 17 00:00:00 20=
01
> >>> +From: Khem Raj <raj.khem@gmail.com>
> >>> +Date: Fri, 20 Feb 2015 09:40:59 +0000
> >>> +Subject: [PATCH 27/47] export CPP
> >>> +
> >>> +The OE environment sets and exports CPP as being the target gcc. Whe=
n
> >>> +building gcc-cross-canadian for a mingw targetted sdk, the following=
 can be found
> >>> +in build.x86_64-pokysdk-mingw32.i586-poky-linux/build-x86_64-linux/l=
ibiberty/config.log:
> >>> +
> >>> +configure:3641: checking for _FILE_OFFSET_BITS value needed for larg=
e files
> >>> +configure:3666: gcc  -c -isystem/media/build1/poky/build/tmp/sysroot=
s/x86_64-linux/usr/include -O2 -pipe  conftest.c >&5
> >>> +configure:3666: $? =3D 0
> >>> +configure:3698: result: no
> >>> +configure:3786: checking how to run the C preprocessor
> >>> +configure:3856: result: x86_64-pokysdk-mingw32-gcc -E --sysroot=3D/m=
edia/build1/poky/build/tmp/sysroots/x86_64-nativesdk-mingw32-pokysdk-mingw3=
2
> >>> +configure:3876: x86_64-pokysdk-mingw32-gcc -E --sysroot=3D/media/bui=
ld1/poky/build/tmp/sysroots/x86_64-nativesdk-mingw32-pokysdk-mingw32 confte=
st.c
> >>> +configure:3876: $? =3D 0
> >>> +
> >>> +Note this is a *build* target (in build-x86_64-linux) so it should b=
e
> >>> +using the host "gcc", not x86_64-pokysdk-mingw32-gcc. Since the ming=
w32
> >>> +headers are very different, using the wrong cpp is a real problem. I=
t is leaking
> >>> +into configure through the CPP variable. Ultimately this leads to bu=
ild
> >>> +failures related to not being able to include a process.h file for p=
em-unix.c.
> >>> +
> >>> +The fix is to ensure we export a sane CPP value into the build
> >>> +environment when using build targets. We could define a CPP_FOR_BUIL=
D value which may be
> >>> +the version which needs to be upstreamed but for now, this fix is go=
od enough to
> >>> +avoid the problem.
> >>> +
> >>> +RP 22/08/2013
> >>> +
> >>> +Upstream-Status: Pending
> >>> +
> >>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> +---
> >>> + Makefile.in | 1 +
> >>> + 1 file changed, 1 insertion(+)
> >>> +
> >>> +diff --git a/Makefile.in b/Makefile.in
> >>> +index b824e0a0ca1..e34e9555388 100644
> >>> +--- a/Makefile.in
> >>> ++++ b/Makefile.in
> >>> +@@ -149,6 +149,7 @@ BUILD_EXPORTS =3D \
> >>> +       AR=3D"$(AR_FOR_BUILD)"; export AR; \
> >>> +       AS=3D"$(AS_FOR_BUILD)"; export AS; \
> >>> +       CC=3D"$(CC_FOR_BUILD)"; export CC; \
> >>> ++      CPP=3D"$(CC_FOR_BUILD) -E"; export CPP; \
> >>> +       CFLAGS=3D"$(CFLAGS_FOR_BUILD)"; export CFLAGS; \
> >>> +       CONFIG_SHELL=3D"$(SHELL)"; export CONFIG_SHELL; \
> >>> +       CXX=3D"$(CXX_FOR_BUILD)"; export CXX; \
> >>> +--
> >>> +2.12.2
> >>> +
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.4/0028-Enable-SPE-AltiVe=
c-generation-on-powepc-linux-target.patch b/meta/recipes-devtools/gcc/gcc-7=
.4/0028-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
> >>> new file mode 100644
> >>> index 0000000..b903349
> >>> --- /dev/null
> >>> +++ b/meta/recipes-devtools/gcc/gcc-7.4/0028-Enable-SPE-AltiVec-gener=
ation-on-powepc-linux-target.patch
> >>> @@ -0,0 +1,56 @@
> >>> +From 2c05b4072f982df8002d61327837e18a724e934f Mon Sep 17 00:00:00 20=
01
> >>> +From: Alexandru-Cezar Sardan <alexandru.sardan@freescale.com>
> >>> +Date: Wed, 5 Feb 2014 16:52:31 +0200
> >>> +Subject: [PATCH 28/47] Enable SPE & AltiVec generation on powepc*lin=
ux target
> >>> +
> >>> +When is configured with --target=3Dpowerpc-linux, the resulting GCC =
will
> >>> +not be able to generate code for SPE targets (e500v1/v2).
> >>> +GCC configured with --target=3Dpowerpc-linuxspe will not be able to
> >>> +generate AltiVec instructions (for e6500).
> >>> +This patch modifies the configured file such that SPE or AltiVec cod=
e
> >>> +can be generated when gcc is configured with --target=3Dpowerpc-linu=
x.
> >>> +The ABI and speciffic instructions can be selected through the
> >>> +"-mabi=3Dspe or -mabi=3Daltivec" and the "-mspe or -maltivec" parame=
ters.
> >>> +
> >>> +Upstream-Status: Inappropriate [configuration]
> >>> +
> >>> +Signed-off-by: Alexandru-Cezar Sardan <alexandru.sardan@freescale.co=
m>
> >>> +---
> >>> + gcc/config.gcc               | 9 ++++++++-
> >>> + gcc/config/rs6000/linuxspe.h | 3 ---
> >>> + 2 files changed, 8 insertions(+), 4 deletions(-)
> >>> +
> >>> +diff --git a/gcc/config.gcc b/gcc/config.gcc
> >>> +index 5e45f4b5199..9b381dfd9af 100644
> >>> +--- a/gcc/config.gcc
> >>> ++++ b/gcc/config.gcc
> >>> +@@ -2415,7 +2415,14 @@ powerpc-*-rtems*)
> >>> +       tmake_file=3D"${tmake_file} rs6000/t-fprules rs6000/t-rtems r=
s6000/t-ppccomm"
> >>> +       ;;
> >>> + powerpc*-*-linux*)
> >>> +-      tm_file=3D"${tm_file} dbxelf.h elfos.h gnu-user.h freebsd-spe=
c.h rs6000/sysv4.h"
> >>> ++      case ${target} in
> >>> ++          powerpc*-*-linux*spe* | powerpc*-*-linux*altivec*)
> >>> ++              tm_file=3D"${tm_file} dbxelf.h elfos.h gnu-user.h fre=
ebsd-spec.h rs6000/sysv4.h"
> >>> ++              ;;
> >>> ++          *)
> >>> ++              tm_file=3D"${tm_file} dbxelf.h elfos.h gnu-user.h fre=
ebsd-spec.h rs6000/sysv4.h rs6000/linuxaltivec.h rs6000/linuxspe.h rs6000/e=
500.h"
> >>> ++              ;;
> >>> ++      esac
> >>> +       extra_options=3D"${extra_options} rs6000/sysv4.opt"
> >>> +       tmake_file=3D"${tmake_file} rs6000/t-fprules rs6000/t-ppccomm=
"
> >>> +       extra_objs=3D"$extra_objs rs6000-linux.o"
> >>> +diff --git a/gcc/config/rs6000/linuxspe.h b/gcc/config/rs6000/linuxs=
pe.h
> >>> +index 92efabfe664..6d486451a7e 100644
> >>> +--- a/gcc/config/rs6000/linuxspe.h
> >>> ++++ b/gcc/config/rs6000/linuxspe.h
> >>> +@@ -27,6 +27,3 @@
> >>> + #undef        TARGET_DEFAULT
> >>> + #define TARGET_DEFAULT MASK_STRICT_ALIGN
> >>> + #endif
> >>> +-
> >>> +-#undef  ASM_DEFAULT_SPEC
> >>> +-#define       ASM_DEFAULT_SPEC "-mppc -mspe -me500"
> >>> +--
> >>> +2.12.2
> >>> +
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.4/0029-Disable-the-MULTI=
LIB_OSDIRNAMES-and-other-multilib-o.patch b/meta/recipes-devtools/gcc/gcc-7=
.4/0029-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
> >>> new file mode 100644
> >>> index 0000000..7306a28
> >>> --- /dev/null
> >>> +++ b/meta/recipes-devtools/gcc/gcc-7.4/0029-Disable-the-MULTILIB_OSD=
IRNAMES-and-other-multilib-o.patch
> >>> @@ -0,0 +1,42 @@
> >>> +From ec0f843b86c0f76bc5ebb20fafbc4aae1be4db61 Mon Sep 17 00:00:00 20=
01
> >>> +From: Khem Raj <raj.khem@gmail.com>
> >>> +Date: Fri, 20 Feb 2015 10:21:55 +0000
> >>> +Subject: [PATCH 29/47] Disable the MULTILIB_OSDIRNAMES and other mul=
tilib
> >>> + options.
> >>> +
> >>> +Hard coding the MULTILIB_OSDIRNAMES with ../lib64 is causing problem=
s on
> >>> +systems where the libdir is NOT set to /lib64.  This is allowed by t=
he
> >>> +ABI, as
> >>> +long as the dynamic loader is present in /lib.
> >>> +
> >>> +We simply want to use the default rules in gcc to find and configure=
 the
> >>> +normal libdir.
> >>> +
> >>> +Upstream-Status: Inappropriate[OE-Specific]
> >>> +
> >>> +Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> >>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> +---
> >>> + gcc/config/aarch64/t-aarch64-linux | 8 ++++----
> >>> + 1 file changed, 4 insertions(+), 4 deletions(-)
> >>> +
> >>> +diff --git a/gcc/config/aarch64/t-aarch64-linux b/gcc/config/aarch64=
/t-aarch64-linux
> >>> +index ab064ab6f22..f4b1f98b216 100644
> >>> +--- a/gcc/config/aarch64/t-aarch64-linux
> >>> ++++ b/gcc/config/aarch64/t-aarch64-linux
> >>> +@@ -21,8 +21,8 @@
> >>> + LIB1ASMSRC   =3D aarch64/lib1funcs.asm
> >>> + LIB1ASMFUNCS =3D _aarch64_sync_cache_range
> >>> +
> >>> +-AARCH_BE =3D $(if $(findstring TARGET_BIG_ENDIAN_DEFAULT=3D1, $(tm_=
defines)),_be)
> >>> +-MULTILIB_OSDIRNAMES =3D mabi.lp64=3D../lib64$(call if_multiarch,:aa=
rch64$(AARCH_BE)-linux-gnu)
> >>> +-MULTIARCH_DIRNAME =3D $(call if_multiarch,aarch64$(AARCH_BE)-linux-=
gnu)
> >>> ++#AARCH_BE =3D $(if $(findstring TARGET_BIG_ENDIAN_DEFAULT=3D1, $(tm=
_defines)),_be)
> >>> ++#MULTILIB_OSDIRNAMES =3D mabi.lp64=3D../lib64$(call if_multiarch,:a=
arch64$(AARCH_BE)-linux-gnu)
> >>> ++#MULTIARCH_DIRNAME =3D $(call if_multiarch,aarch64$(AARCH_BE)-linux=
-gnu)
> >>> +
> >>> +-MULTILIB_OSDIRNAMES +=3D mabi.ilp32=3D../libilp32
> >>> ++#MULTILIB_OSDIRNAMES +=3D mabi.ilp32=3D../libilp32
> >>> +--
> >>> +2.12.2
> >>> +
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.4/0030-Ensure-target-gcc=
-headers-can-be-included.patch b/meta/recipes-devtools/gcc/gcc-7.4/0030-Ens=
ure-target-gcc-headers-can-be-included.patch
> >>> new file mode 100644
> >>> index 0000000..568ba95
> >>> --- /dev/null
> >>> +++ b/meta/recipes-devtools/gcc/gcc-7.4/0030-Ensure-target-gcc-header=
s-can-be-included.patch
> >>> @@ -0,0 +1,98 @@
> >>> +From bf5836989e0ffc1c1df1369df06877e96c08df41 Mon Sep 17 00:00:00 20=
01
> >>> +From: Khem Raj <raj.khem@gmail.com>
> >>> +Date: Fri, 20 Feb 2015 10:25:11 +0000
> >>> +Subject: [PATCH 30/47] Ensure target gcc headers can be included
> >>> +
> >>> +There are a few headers installed as part of the OpenEmbedded
> >>> +gcc-runtime target (omp.h, ssp/*.h). Being installed from a recipe
> >>> +built for the target architecture, these are within the target
> >>> +sysroot and not cross/nativesdk; thus they weren't able to be
> >>> +found by gcc with the existing search paths. Add support for
> >>> +picking up these headers under the sysroot supplied on the gcc
> >>> +command line in order to resolve this.
> >>> +
> >>> +Upstream-Status: Pending
> >>> +
> >>> +Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> >>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> +---
> >>> + gcc/Makefile.in  | 2 ++
> >>> + gcc/cppdefault.c | 4 ++++
> >>> + gcc/defaults.h   | 9 +++++++++
> >>> + gcc/gcc.c        | 7 -------
> >>> + 4 files changed, 15 insertions(+), 7 deletions(-)
> >>> +
> >>> +diff --git a/gcc/Makefile.in b/gcc/Makefile.in
> >>> +index 23cca7f0d5a..95d21effad3 100644
> >>> +--- a/gcc/Makefile.in
> >>> ++++ b/gcc/Makefile.in
> >>> +@@ -608,6 +608,7 @@ libexecdir =3D @libexecdir@
> >>> +
> >>> + # Directory in which the compiler finds libraries etc.
> >>> + libsubdir =3D $(libdir)/gcc/$(real_target_noncanonical)/$(version)$=
(accel_dir_suffix)
> >>> ++libsubdir_target =3D gcc/$(target_noncanonical)/$(version)
> >>> + # Directory in which the compiler finds executables
> >>> + libexecsubdir =3D $(libexecdir)/gcc/$(real_target_noncanonical)/$(v=
ersion)$(accel_dir_suffix)
> >>> + # Directory in which all plugin resources are installed
> >>> +@@ -2791,6 +2792,7 @@ CFLAGS-intl.o +=3D -DLOCALEDIR=3D\"$(localedir=
)\"
> >>> +
> >>> + PREPROCESSOR_DEFINES =3D \
> >>> +   -DGCC_INCLUDE_DIR=3D\"$(libsubdir)/include\" \
> >>> ++  -DGCC_INCLUDE_SUBDIR_TARGET=3D\"$(libsubdir_target)/include\" \
> >>> +   -DFIXED_INCLUDE_DIR=3D\"$(libsubdir)/include-fixed\" \
> >>> +   -DGPLUSPLUS_INCLUDE_DIR=3D\"$(gcc_gxx_include_dir)\" \
> >>> +   -DGPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT=3D$(gcc_gxx_include_dir_add_s=
ysroot) \
> >>> +diff --git a/gcc/cppdefault.c b/gcc/cppdefault.c
> >>> +index 10b96eca0a7..c8da0884872 100644
> >>> +--- a/gcc/cppdefault.c
> >>> ++++ b/gcc/cppdefault.c
> >>> +@@ -59,6 +59,10 @@ const struct default_include cpp_include_defaults=
[]
> >>> +     /* This is the dir for gcc's private headers.  */
> >>> +     { GCC_INCLUDE_DIR, "GCC", 0, 0, 0, 0 },
> >>> + #endif
> >>> ++#ifdef GCC_INCLUDE_SUBDIR_TARGET
> >>> ++    /* This is the dir for gcc's private headers under the specifie=
d sysroot.  */
> >>> ++    { STANDARD_STARTFILE_PREFIX_2 GCC_INCLUDE_SUBDIR_TARGET, "GCC",=
 0, 0, 1, 0 },
> >>> ++#endif
> >>> + #ifdef LOCAL_INCLUDE_DIR
> >>> +     /* /usr/local/include comes before the fixincluded header files=
.  */
> >>> +     { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 2 },
> >>> +diff --git a/gcc/defaults.h b/gcc/defaults.h
> >>> +index 7ad92d920f8..39848cc9c0e 100644
> >>> +--- a/gcc/defaults.h
> >>> ++++ b/gcc/defaults.h
> >>> +@@ -1475,4 +1475,13 @@ see the files COPYING3 and COPYING.RUNTIME re=
spectively.  If not, see
> >>> + #define DWARF_GNAT_ENCODINGS_DEFAULT DWARF_GNAT_ENCODINGS_GDB
> >>> + #endif
> >>> +
> >>> ++/* Default prefixes to attach to command names.  */
> >>> ++
> >>> ++#ifndef STANDARD_STARTFILE_PREFIX_1
> >>> ++#define STANDARD_STARTFILE_PREFIX_1 "/lib/"
> >>> ++#endif
> >>> ++#ifndef STANDARD_STARTFILE_PREFIX_2
> >>> ++#define STANDARD_STARTFILE_PREFIX_2 "/usr/lib/"
> >>> ++#endif
> >>> ++
> >>> + #endif  /* ! GCC_DEFAULTS_H */
> >>> +diff --git a/gcc/gcc.c b/gcc/gcc.c
> >>> +index c73d4023987..b27245dbf77 100644
> >>> +--- a/gcc/gcc.c
> >>> ++++ b/gcc/gcc.c
> >>> +@@ -1472,13 +1472,6 @@ static const char *gcc_libexec_prefix;
> >>> +
> >>> + /* Default prefixes to attach to command names.  */
> >>> +
> >>> +-#ifndef STANDARD_STARTFILE_PREFIX_1
> >>> +-#define STANDARD_STARTFILE_PREFIX_1 "/lib/"
> >>> +-#endif
> >>> +-#ifndef STANDARD_STARTFILE_PREFIX_2
> >>> +-#define STANDARD_STARTFILE_PREFIX_2 "/usr/lib/"
> >>> +-#endif
> >>> +-
> >>> + #ifdef CROSS_DIRECTORY_STRUCTURE  /* Don't use these prefixes for a=
 cross compiler.  */
> >>> + #undef MD_EXEC_PREFIX
> >>> + #undef MD_STARTFILE_PREFIX
> >>> +--
> >>> +2.12.2
> >>> +
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.4/0031-gcc-4.8-won-t-bui=
ld-with-disable-dependency-tracking.patch b/meta/recipes-devtools/gcc/gcc-7=
.4/0031-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
> >>> new file mode 100644
> >>> index 0000000..0184010
> >>> --- /dev/null
> >>> +++ b/meta/recipes-devtools/gcc/gcc-7.4/0031-gcc-4.8-won-t-build-with=
-disable-dependency-tracking.patch
> >>> @@ -0,0 +1,54 @@
> >>> +From c7b4d957edda955fbe405fd5295846614529f517 Mon Sep 17 00:00:00 20=
01
> >>> +From: Khem Raj <raj.khem@gmail.com>
> >>> +Date: Fri, 20 Feb 2015 11:17:19 +0000
> >>> +Subject: [PATCH 31/47] gcc 4.8+ won't build with --disable-dependenc=
y-tracking
> >>> +
> >>> +since the *.Ppo files don't get created unless --enable-dependency-t=
racking is true.
> >>> +
> >>> +This patch ensures we only use those compiler options when its enabl=
ed.
> >>> +
> >>> +Upstream-Status: Submitted
> >>> +
> >>> +(Problem was already reported upstream, attached this patch there
> >>> +http://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D55930)
> >>> +
> >>> +RP
> >>> +2012/09/22
> >>> +
> >>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> +---
> >>> + libatomic/Makefile.am | 3 ++-
> >>> + libatomic/Makefile.in | 3 ++-
> >>> + 2 files changed, 4 insertions(+), 2 deletions(-)
> >>> +
> >>> +diff --git a/libatomic/Makefile.am b/libatomic/Makefile.am
> >>> +index d731406fdbd..2fafc72d2e7 100644
> >>> +--- a/libatomic/Makefile.am
> >>> ++++ b/libatomic/Makefile.am
> >>> +@@ -101,7 +101,8 @@ PAT_S              =3D $(word 3,$(PAT_SPLIT))
> >>> + IFUNC_DEF     =3D -DIFUNC_ALT=3D$(PAT_S)
> >>> + IFUNC_OPT     =3D $(word $(PAT_S),$(IFUNC_OPTIONS))
> >>> +
> >>> +-M_DEPS                =3D -MT $@ -MD -MP -MF $(DEPDIR)/$(@F).Ppo
> >>> ++@AMDEP_TRUE@M_DEPS            =3D -MT $@ -MD -MP -MF $(DEPDIR)/$(@F=
).Ppo
> >>> ++@AMDEP_FALSE@M_DEPS           =3D
> >>> + M_SIZE                =3D -DN=3D$(PAT_N)
> >>> + M_IFUNC               =3D $(if $(PAT_S),$(IFUNC_DEF) $(IFUNC_OPT))
> >>> + M_FILE                =3D $(PAT_BASE)_n.c
> >>> +diff --git a/libatomic/Makefile.in b/libatomic/Makefile.in
> >>> +index f6eeab312ea..3f06a894058 100644
> >>> +--- a/libatomic/Makefile.in
> >>> ++++ b/libatomic/Makefile.in
> >>> +@@ -331,7 +331,8 @@ PAT_N =3D $(word 2,$(PAT_SPLIT))
> >>> + PAT_S =3D $(word 3,$(PAT_SPLIT))
> >>> + IFUNC_DEF =3D -DIFUNC_ALT=3D$(PAT_S)
> >>> + IFUNC_OPT =3D $(word $(PAT_S),$(IFUNC_OPTIONS))
> >>> +-M_DEPS =3D -MT $@ -MD -MP -MF $(DEPDIR)/$(@F).Ppo
> >>> ++@AMDEP_TRUE@M_DEPS =3D -MT $@ -MD -MP -MF $(DEPDIR)/$(@F).Ppo
> >>> ++@AMDEP_FALSE@M_DEPS =3D
> >>> + M_SIZE =3D -DN=3D$(PAT_N)
> >>> + M_IFUNC =3D $(if $(PAT_S),$(IFUNC_DEF) $(IFUNC_OPT))
> >>> + M_FILE =3D $(PAT_BASE)_n.c
> >>> +--
> >>> +2.12.2
> >>> +
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.4/0032-Don-t-search-host=
-directory-during-relink-if-inst_pr.patch b/meta/recipes-devtools/gcc/gcc-7=
.4/0032-Don-t-search-host-directory-during-relink-if-inst_pr.patch
> >>> new file mode 100644
> >>> index 0000000..e8905f5
> >>> --- /dev/null
> >>> +++ b/meta/recipes-devtools/gcc/gcc-7.4/0032-Don-t-search-host-direct=
ory-during-relink-if-inst_pr.patch
> >>> @@ -0,0 +1,38 @@
> >>> +From 3be6b766a5881b0b187c3c3c68250a9e4f7c0fa3 Mon Sep 17 00:00:00 20=
01
> >>> +From: Khem Raj <raj.khem@gmail.com>
> >>> +Date: Tue, 3 Mar 2015 08:21:19 +0000
> >>> +Subject: [PATCH 32/47] Don't search host directory during "relink" i=
f
> >>> + $inst_prefix is provided
> >>> +
> >>> +http://lists.gnu.org/archive/html/libtool-patches/2011-01/msg00026.h=
tml
> >>> +
> >>> +Upstream-Status: Submitted
> >>> +
> >>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> +---
> >>> + ltmain.sh | 5 +++--
> >>> + 1 file changed, 3 insertions(+), 2 deletions(-)
> >>> +
> >>> +diff --git a/ltmain.sh b/ltmain.sh
> >>> +index 52bdbdb5f9c..82bcec39f05 100644
> >>> +--- a/ltmain.sh
> >>> ++++ b/ltmain.sh
> >>> +@@ -6004,12 +6004,13 @@ func_mode_link ()
> >>> +             fi
> >>> +           else
> >>> +             # We cannot seem to hardcode it, guess we'll fake it.
> >>> ++            # Default if $libdir is not relative to the prefix:
> >>> +             add_dir=3D"-L$libdir"
> >>> +-            # Try looking first in the location we're being install=
ed to.
> >>> ++
> >>> +             if test -n "$inst_prefix_dir"; then
> >>> +               case $libdir in
> >>> +                 [\\/]*)
> >>> +-                  add_dir=3D"$add_dir -L$inst_prefix_dir$libdir"
> >>> ++                  add_dir=3D"-L$inst_prefix_dir$libdir"
> >>> +                   ;;
> >>> +               esac
> >>> +             fi
> >>> +--
> >>> +2.12.2
> >>> +
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.4/0033-Use-SYSTEMLIBS_DI=
R-replacement-instead-of-hardcoding.patch b/meta/recipes-devtools/gcc/gcc-7=
.4/0033-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
> >>> new file mode 100644
> >>> index 0000000..c0b8df3
> >>> --- /dev/null
> >>> +++ b/meta/recipes-devtools/gcc/gcc-7.4/0033-Use-SYSTEMLIBS_DIR-repla=
cement-instead-of-hardcoding.patch
> >>> @@ -0,0 +1,29 @@
> >>> +From 6edcab9046b862cbb9b46892fc390ce69976539c Mon Sep 17 00:00:00 20=
01
> >>> +From: Khem Raj <raj.khem@gmail.com>
> >>> +Date: Tue, 28 Apr 2015 23:15:27 -0700
> >>> +Subject: [PATCH 33/47] Use SYSTEMLIBS_DIR replacement instead of har=
dcoding
> >>> + base_libdir
> >>> +
> >>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> +---
> >>> +Upstream-Status: Inappropriate [OE-Specific]
> >>> +
> >>> + gcc/config/aarch64/aarch64-linux.h | 2 +-
> >>> + 1 file changed, 1 insertion(+), 1 deletion(-)
> >>> +
> >>> +diff --git a/gcc/config/aarch64/aarch64-linux.h b/gcc/config/aarch64=
/aarch64-linux.h
> >>> +index c45fc1d35d1..a7afe197266 100644
> >>> +--- a/gcc/config/aarch64/aarch64-linux.h
> >>> ++++ b/gcc/config/aarch64/aarch64-linux.h
> >>> +@@ -21,7 +21,7 @@
> >>> + #ifndef GCC_AARCH64_LINUX_H
> >>> + #define GCC_AARCH64_LINUX_H
> >>> +
> >>> +-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-aarch64%{mbig-endian:_b=
e}%{mabi=3Dilp32:_ilp32}.so.1"
> >>> ++#define GLIBC_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-linux-aarch64%{mbi=
g-endian:_be}%{mabi=3Dilp32:_ilp32}.so.1"
> >>> +
> >>> + #undef MUSL_DYNAMIC_LINKER
> >>> + #define MUSL_DYNAMIC_LINKER "/lib/ld-musl-aarch64%{mbig-endian:_be}=
%{mabi=3Dilp32:_ilp32}.so.1"
> >>> +--
> >>> +2.12.2
> >>> +
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.4/0034-aarch64-Add-suppo=
rt-for-musl-ldso.patch b/meta/recipes-devtools/gcc/gcc-7.4/0034-aarch64-Add=
-support-for-musl-ldso.patch
> >>> new file mode 100644
> >>> index 0000000..7d866d9
> >>> --- /dev/null
> >>> +++ b/meta/recipes-devtools/gcc/gcc-7.4/0034-aarch64-Add-support-for-=
musl-ldso.patch
> >>> @@ -0,0 +1,28 @@
> >>> +From b140d6839cfba9cac892bc736d984540552d6a56 Mon Sep 17 00:00:00 20=
01
> >>> +From: Khem Raj <raj.khem@gmail.com>
> >>> +Date: Tue, 28 Apr 2015 23:18:39 -0700
> >>> +Subject: [PATCH 34/47] aarch64: Add support for musl ldso
> >>> +
> >>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> +---
> >>> +Upstream-Status: Inappropriate [OE-Specific]
> >>> +
> >>> + gcc/config/aarch64/aarch64-linux.h | 2 +-
> >>> + 1 file changed, 1 insertion(+), 1 deletion(-)
> >>> +
> >>> +diff --git a/gcc/config/aarch64/aarch64-linux.h b/gcc/config/aarch64=
/aarch64-linux.h
> >>> +index a7afe197266..580c2c7ea15 100644
> >>> +--- a/gcc/config/aarch64/aarch64-linux.h
> >>> ++++ b/gcc/config/aarch64/aarch64-linux.h
> >>> +@@ -24,7 +24,7 @@
> >>> + #define GLIBC_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-linux-aarch64%{mbi=
g-endian:_be}%{mabi=3Dilp32:_ilp32}.so.1"
> >>> +
> >>> + #undef MUSL_DYNAMIC_LINKER
> >>> +-#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-aarch64%{mbig-endian:_be}=
%{mabi=3Dilp32:_ilp32}.so.1"
> >>> ++#define MUSL_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-musl-aarch64%{mbig-=
endian:_be}%{mabi=3Dilp32:_ilp32}.so.1"
> >>> +
> >>> + #undef  ASAN_CC1_SPEC
> >>> + #define ASAN_CC1_SPEC "%{%:sanitize(address):-funwind-tables}"
> >>> +--
> >>> +2.12.2
> >>> +
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.4/0035-libcc1-fix-libcc1=
-s-install-path-and-rpath.patch b/meta/recipes-devtools/gcc/gcc-7.4/0035-li=
bcc1-fix-libcc1-s-install-path-and-rpath.patch
> >>> new file mode 100644
> >>> index 0000000..e2c1956
> >>> --- /dev/null
> >>> +++ b/meta/recipes-devtools/gcc/gcc-7.4/0035-libcc1-fix-libcc1-s-inst=
all-path-and-rpath.patch
> >>> @@ -0,0 +1,54 @@
> >>> +From 63617f2da153db10fa2fe938cce31bee01d47fe8 Mon Sep 17 00:00:00 20=
01
> >>> +From: Robert Yang <liezhi.yang@windriver.com>
> >>> +Date: Sun, 5 Jul 2015 20:25:18 -0700
> >>> +Subject: [PATCH 35/47] libcc1: fix libcc1's install path and rpath
> >>> +
> >>> +* Install libcc1.so and libcc1plugin.so into
> >>> +  $(libexecdir)/gcc/$(target_noncanonical)/$(gcc_version), as what w=
e
> >>> +  had done to lto-plugin.
> >>> +* Fix bad RPATH iussue:
> >>> +  gcc-5.2.0: package gcc-plugins contains bad RPATH /patht/to/tmp/sy=
sroots/qemux86-64/usr/lib64/../lib64 in file
> >>> + /path/to/gcc/5.2.0-r0/packages-split/gcc-plugins/usr/lib64/gcc/x86_=
64-poky-linux/5.2.0/plugin/libcc1plugin.so.0.0.0
> >>> + [rpaths]
> >>> +
> >>> +Upstream-Status: Inappropriate [OE configuration]
> >>> +
> >>> +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> >>> +---
> >>> + libcc1/Makefile.am | 4 ++--
> >>> + libcc1/Makefile.in | 4 ++--
> >>> + 2 files changed, 4 insertions(+), 4 deletions(-)
> >>> +
> >>> +diff --git a/libcc1/Makefile.am b/libcc1/Makefile.am
> >>> +index 5e61a92a26b..e8b627f9cec 100644
> >>> +--- a/libcc1/Makefile.am
> >>> ++++ b/libcc1/Makefile.am
> >>> +@@ -37,8 +37,8 @@ libiberty =3D $(if $(wildcard $(libiberty_noasan))=
,$(Wc)$(libiberty_noasan), \
> >>> +           $(Wc)$(libiberty_normal)))
> >>> + libiberty_dep =3D $(patsubst $(Wc)%,%,$(libiberty))
> >>> +
> >>> +-plugindir =3D $(libdir)/gcc/$(target_noncanonical)/$(gcc_version)/p=
lugin
> >>> +-cc1libdir =3D $(libdir)/$(libsuffix)
> >>> ++cc1libdir =3D $(libexecdir)/gcc/$(target_noncanonical)/$(gcc_versio=
n)
> >>> ++plugindir =3D $(cc1libdir)
> >>> +
> >>> + if ENABLE_PLUGIN
> >>> + plugin_LTLIBRARIES =3D libcc1plugin.la libcp1plugin.la
> >>> +diff --git a/libcc1/Makefile.in b/libcc1/Makefile.in
> >>> +index 54babb02a49..e51d87ffdce 100644
> >>> +--- a/libcc1/Makefile.in
> >>> ++++ b/libcc1/Makefile.in
> >>> +@@ -303,8 +303,8 @@ libiberty =3D $(if $(wildcard $(libiberty_noasan=
)),$(Wc)$(libiberty_noasan), \
> >>> +           $(Wc)$(libiberty_normal)))
> >>> +
> >>> + libiberty_dep =3D $(patsubst $(Wc)%,%,$(libiberty))
> >>> +-plugindir =3D $(libdir)/gcc/$(target_noncanonical)/$(gcc_version)/p=
lugin
> >>> +-cc1libdir =3D $(libdir)/$(libsuffix)
> >>> ++cc1libdir =3D $(libexecdir)/gcc/$(target_noncanonical)/$(gcc_versio=
n)
> >>> ++plugindir =3D $(cc1libdir)
> >>> + @ENABLE_PLUGIN_TRUE@plugin_LTLIBRARIES =3D libcc1plugin.la libcp1pl=
ugin.la
> >>> + @ENABLE_PLUGIN_TRUE@cc1lib_LTLIBRARIES =3D libcc1.la
> >>> + BUILT_SOURCES =3D c-compiler-name.h cp-compiler-name.h
> >>> +--
> >>> +2.12.2
> >>> +
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.4/0036-handle-sysroot-su=
pport-for-nativesdk-gcc.patch b/meta/recipes-devtools/gcc/gcc-7.4/0036-hand=
le-sysroot-support-for-nativesdk-gcc.patch
> >>> new file mode 100644
> >>> index 0000000..aa0b108
> >>> --- /dev/null
> >>> +++ b/meta/recipes-devtools/gcc/gcc-7.4/0036-handle-sysroot-support-f=
or-nativesdk-gcc.patch
> >>> @@ -0,0 +1,213 @@
> >>> +From ca14820ae834a62ef2b80b283e8f900714636272 Mon Sep 17 00:00:00 20=
01
> >>> +From: Khem Raj <raj.khem@gmail.com>
> >>> +Date: Mon, 7 Dec 2015 23:39:54 +0000
> >>> +Subject: [PATCH 36/47] handle sysroot support for nativesdk-gcc
> >>> +
> >>> +Being able to build a nativesdk gcc is useful, particularly in cases
> >>> +where the host compiler may be of an incompatible version (or a 32
> >>> +bit compiler is needed).
> >>> +
> >>> +Sadly, building nativesdk-gcc is not straight forward. We install
> >>> +nativesdk-gcc into a relocatable location and this means that its
> >>> +library locations can change. "Normal" sysroot support doesn't help
> >>> +in this case since the values of paths like "libdir" change, not jus=
t
> >>> +base root directory of the system.
> >>> +
> >>> +In order to handle this we do two things:
> >>> +
> >>> +a) Add %r into spec file markup which can be used for injected paths
> >>> +   such as SYSTEMLIBS_DIR (see gcc_multilib_setup()).
> >>> +b) Add other paths which need relocation into a .gccrelocprefix sect=
ion
> >>> +   which the relocation code will notice and adjust automatically.
> >>> +
> >>> +Upstream-Status: Inappropriate
> >>> +RP 2015/7/28
> >>> +
> >>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> +---
> >>> + gcc/cppdefault.c | 50 +++++++++++++++++++++++++++++++++++++--------=
-----
> >>> + gcc/cppdefault.h |  3 ++-
> >>> + gcc/gcc.c        | 20 ++++++++++++++------
> >>> + 3 files changed, 53 insertions(+), 20 deletions(-)
> >>> +
> >>> +diff --git a/gcc/cppdefault.c b/gcc/cppdefault.c
> >>> +index c8da0884872..43dc597a0c3 100644
> >>> +--- a/gcc/cppdefault.c
> >>> ++++ b/gcc/cppdefault.c
> >>> +@@ -35,6 +35,30 @@
> >>> + # undef CROSS_INCLUDE_DIR
> >>> + #endif
> >>> +
> >>> ++static char GPLUSPLUS_INCLUDE_DIRVAR[4096] __attribute__ ((section =
(".gccrelocprefix"))) =3D GPLUSPLUS_INCLUDE_DIR;
> >>> ++static char GCC_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gcc=
relocprefix"))) =3D GCC_INCLUDE_DIR;
> >>> ++static char GPLUSPLUS_TOOL_INCLUDE_DIRVAR[4096] __attribute__ ((sec=
tion (".gccrelocprefix"))) =3D GPLUSPLUS_TOOL_INCLUDE_DIR;
> >>> ++static char GPLUSPLUS_BACKWARD_INCLUDE_DIRVAR[4096] __attribute__ (=
(section (".gccrelocprefix"))) =3D GPLUSPLUS_BACKWARD_INCLUDE_DIR;
> >>> ++static char STANDARD_STARTFILE_PREFIX_2VAR[4096] __attribute__ ((se=
ction (".gccrelocprefix"))) =3D STANDARD_STARTFILE_PREFIX_2 GCC_INCLUDE_SUB=
DIR_TARGET;
> >>> ++#ifdef LOCAL_INCLUDE_DIR
> >>> ++static char LOCAL_INCLUDE_DIRVAR[4096] __attribute__ ((section (".g=
ccrelocprefix"))) =3D LOCAL_INCLUDE_DIR;
> >>> ++#endif
> >>> ++#ifdef PREFIX_INCLUDE_DIR
> >>> ++static char PREFIX_INCLUDE_DIRVAR[4096] __attribute__ ((section (".=
gccrelocprefix"))) =3D PREFIX_INCLUDE_DIR;
> >>> ++#endif
> >>> ++#ifdef FIXED_INCLUDE_DIR
> >>> ++static char FIXED_INCLUDE_DIRVAR[4096] __attribute__ ((section (".g=
ccrelocprefix"))) =3D FIXED_INCLUDE_DIR;
> >>> ++#endif
> >>> ++#ifdef CROSS_INCLUDE_DIR
> >>> ++static char CROSS_INCLUDE_DIRVAR[4096] __attribute__ ((section (".g=
ccrelocprefix"))) =3D CROSS_INCLUDE_DIR;
> >>> ++#endif
> >>> ++#ifdef TOOL_INCLUDE_DIR
> >>> ++static char TOOL_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gc=
crelocprefix"))) =3D TOOL_INCLUDE_DIR;
> >>> ++#endif
> >>> ++#ifdef NATIVE_SYSTEM_HEADER_DIR
> >>> ++static char NATIVE_SYSTEM_HEADER_DIRVAR[4096] __attribute__ ((secti=
on (".gccrelocprefix"))) =3D NATIVE_SYSTEM_HEADER_DIR;
> >>> ++#endif
> >>> ++
> >>> + const struct default_include cpp_include_defaults[]
> >>> + #ifdef INCLUDE_DEFAULTS
> >>> + =3D INCLUDE_DEFAULTS;
> >>> +@@ -42,38 +66,38 @@ const struct default_include cpp_include_default=
s[]
> >>> + =3D {
> >>> + #ifdef GPLUSPLUS_INCLUDE_DIR
> >>> +     /* Pick up GNU C++ generic include files.  */
> >>> +-    { GPLUSPLUS_INCLUDE_DIR, "G++", 1, 1,
> >>> ++    { GPLUSPLUS_INCLUDE_DIRVAR, "G++", 1, 1,
> >>> +       GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 0 },
> >>> + #endif
> >>> + #ifdef GPLUSPLUS_TOOL_INCLUDE_DIR
> >>> +     /* Pick up GNU C++ target-dependent include files.  */
> >>> +-    { GPLUSPLUS_TOOL_INCLUDE_DIR, "G++", 1, 1,
> >>> ++    { GPLUSPLUS_TOOL_INCLUDE_DIRVAR, "G++", 1, 1,
> >>> +       GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 1 },
> >>> + #endif
> >>> + #ifdef GPLUSPLUS_BACKWARD_INCLUDE_DIR
> >>> +     /* Pick up GNU C++ backward and deprecated include files.  */
> >>> +-    { GPLUSPLUS_BACKWARD_INCLUDE_DIR, "G++", 1, 1,
> >>> ++    { GPLUSPLUS_BACKWARD_INCLUDE_DIRVAR, "G++", 1, 1,
> >>> +       GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 0 },
> >>> + #endif
> >>> + #ifdef GCC_INCLUDE_DIR
> >>> +     /* This is the dir for gcc's private headers.  */
> >>> +-    { GCC_INCLUDE_DIR, "GCC", 0, 0, 0, 0 },
> >>> ++    { GCC_INCLUDE_DIRVAR, "GCC", 0, 0, 0, 0 },
> >>> + #endif
> >>> + #ifdef GCC_INCLUDE_SUBDIR_TARGET
> >>> +     /* This is the dir for gcc's private headers under the specifie=
d sysroot.  */
> >>> +-    { STANDARD_STARTFILE_PREFIX_2 GCC_INCLUDE_SUBDIR_TARGET, "GCC",=
 0, 0, 1, 0 },
> >>> ++    { STANDARD_STARTFILE_PREFIX_2VAR, "GCC", 0, 0, 1, 0 },
> >>> + #endif
> >>> + #ifdef LOCAL_INCLUDE_DIR
> >>> +     /* /usr/local/include comes before the fixincluded header files=
.  */
> >>> +-    { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 2 },
> >>> +-    { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 0 },
> >>> ++    { LOCAL_INCLUDE_DIRVAR, 0, 0, 1, 1, 2 },
> >>> ++    { LOCAL_INCLUDE_DIRVAR, 0, 0, 1, 1, 0 },
> >>> + #endif
> >>> + #ifdef PREFIX_INCLUDE_DIR
> >>> +-    { PREFIX_INCLUDE_DIR, 0, 0, 1, 0, 0 },
> >>> ++    { PREFIX_INCLUDE_DIRVAR, 0, 0, 1, 0, 0 },
> >>> + #endif
> >>> + #ifdef FIXED_INCLUDE_DIR
> >>> +     /* This is the dir for fixincludes.  */
> >>> +-    { FIXED_INCLUDE_DIR, "GCC", 0, 0, 0,
> >>> ++    { FIXED_INCLUDE_DIRVAR, "GCC", 0, 0, 0,
> >>> +       /* A multilib suffix needs adding if different multilibs use
> >>> +        different headers.  */
> >>> + #ifdef SYSROOT_HEADERS_SUFFIX_SPEC
> >>> +@@ -85,16 +109,16 @@ const struct default_include cpp_include_defaul=
ts[]
> >>> + #endif
> >>> + #ifdef CROSS_INCLUDE_DIR
> >>> +     /* One place the target system's headers might be.  */
> >>> +-    { CROSS_INCLUDE_DIR, "GCC", 0, 0, 0, 0 },
> >>> ++    { CROSS_INCLUDE_DIRVAR, "GCC", 0, 0, 0, 0 },
> >>> + #endif
> >>> + #ifdef TOOL_INCLUDE_DIR
> >>> +     /* Another place the target system's headers might be.  */
> >>> +-    { TOOL_INCLUDE_DIR, "BINUTILS", 0, 1, 0, 0 },
> >>> ++    { TOOL_INCLUDE_DIRVAR, "BINUTILS", 0, 1, 0, 0 },
> >>> + #endif
> >>> + #ifdef NATIVE_SYSTEM_HEADER_DIR
> >>> +     /* /usr/include comes dead last.  */
> >>> +-    { NATIVE_SYSTEM_HEADER_DIR, NATIVE_SYSTEM_HEADER_COMPONENT, 0, =
0, 1, 2 },
> >>> +-    { NATIVE_SYSTEM_HEADER_DIR, NATIVE_SYSTEM_HEADER_COMPONENT, 0, =
0, 1, 0 },
> >>> ++    { NATIVE_SYSTEM_HEADER_DIRVAR, NATIVE_SYSTEM_HEADER_COMPONENT, =
0, 0, 1, 2 },
> >>> ++    { NATIVE_SYSTEM_HEADER_DIRVAR, NATIVE_SYSTEM_HEADER_COMPONENT, =
0, 0, 1, 0 },
> >>> + #endif
> >>> +     { 0, 0, 0, 0, 0, 0 }
> >>> +   };
> >>> +diff --git a/gcc/cppdefault.h b/gcc/cppdefault.h
> >>> +index 17bbb0eaef7..a937ec1d187 100644
> >>> +--- a/gcc/cppdefault.h
> >>> ++++ b/gcc/cppdefault.h
> >>> +@@ -33,7 +33,8 @@
> >>> +
> >>> + struct default_include
> >>> + {
> >>> +-  const char *const fname;    /* The name of the directory.  */
> >>> ++  const char *fname;     /* The name of the directory.  */
> >>> ++
> >>> +   const char *const component;        /* The component containing t=
he directory
> >>> +                                  (see update_path in prefix.c) */
> >>> +   const char cplusplus;               /* Only look here if we're co=
mpiling C++.  */
> >>> +diff --git a/gcc/gcc.c b/gcc/gcc.c
> >>> +index b27245dbf77..e015c77f15f 100644
> >>> +--- a/gcc/gcc.c
> >>> ++++ b/gcc/gcc.c
> >>> +@@ -247,6 +247,8 @@ FILE *report_times_to_file =3D NULL;
> >>> + #endif
> >>> + static const char *target_system_root =3D DEFAULT_TARGET_SYSTEM_ROO=
T;
> >>> +
> >>> ++static char target_relocatable_prefix[4096] __attribute__ ((section=
 (".gccrelocprefix"))) =3D SYSTEMLIBS_DIR;
> >>> ++
> >>> + /* Nonzero means pass the updated target_system_root to the compile=
r.  */
> >>> +
> >>> + static int target_system_root_changed;
> >>> +@@ -518,6 +520,7 @@ or with constant text in a single argument.
> >>> +  %G     process LIBGCC_SPEC as a spec.
> >>> +  %R     Output the concatenation of target_system_root and
> >>> +         target_sysroot_suffix.
> >>> ++ %r     Output the base path target_relocatable_prefix
> >>> +  %S     process STARTFILE_SPEC as a spec.  A capital S is actually =
used here.
> >>> +  %E     process ENDFILE_SPEC as a spec.  A capital E is actually us=
ed here.
> >>> +  %C     process CPP_SPEC as a spec.
> >>> +@@ -1495,10 +1498,10 @@ static const char *gcc_libexec_prefix;
> >>> +    gcc_exec_prefix is set because, in that case, we know where the
> >>> +    compiler has been installed, and use paths relative to that
> >>> +    location instead.  */
> >>> +-static const char *const standard_exec_prefix =3D STANDARD_EXEC_PRE=
FIX;
> >>> +-static const char *const standard_libexec_prefix =3D STANDARD_LIBEX=
EC_PREFIX;
> >>> +-static const char *const standard_bindir_prefix =3D STANDARD_BINDIR=
_PREFIX;
> >>> +-static const char *const standard_startfile_prefix =3D STANDARD_STA=
RTFILE_PREFIX;
> >>> ++static char standard_exec_prefix[4096] __attribute__ ((section (".g=
ccrelocprefix"))) =3D STANDARD_EXEC_PREFIX;
> >>> ++static char standard_libexec_prefix[4096] __attribute__ ((section (=
".gccrelocprefix"))) =3D STANDARD_LIBEXEC_PREFIX;
> >>> ++static char standard_bindir_prefix[4096] __attribute__ ((section ("=
.gccrelocprefix"))) =3D STANDARD_BINDIR_PREFIX;
> >>> ++static char *const standard_startfile_prefix =3D STANDARD_STARTFILE=
_PREFIX;
> >>> +
> >>> + /* For native compilers, these are well-known paths containing
> >>> +    components that may be provided by the system.  For cross
> >>> +@@ -1506,9 +1509,9 @@ static const char *const standard_startfile_pr=
efix =3D STANDARD_STARTFILE_PREFIX;
> >>> + static const char *md_exec_prefix =3D MD_EXEC_PREFIX;
> >>> + static const char *md_startfile_prefix =3D MD_STARTFILE_PREFIX;
> >>> + static const char *md_startfile_prefix_1 =3D MD_STARTFILE_PREFIX_1;
> >>> +-static const char *const standard_startfile_prefix_1
> >>> ++static char standard_startfile_prefix_1[4096] __attribute__ ((secti=
on (".gccrelocprefix")))
> >>> +   =3D STANDARD_STARTFILE_PREFIX_1;
> >>> +-static const char *const standard_startfile_prefix_2
> >>> ++static char standard_startfile_prefix_2[4096] __attribute__ ((secti=
on (".gccrelocprefix")))
> >>> +   =3D STANDARD_STARTFILE_PREFIX_2;
> >>> +
> >>> + /* A relative path to be used in finding the location of tools
> >>> +@@ -5826,6 +5829,11 @@ do_spec_1 (const char *spec, int inswitch, co=
nst char *soft_matched_part)
> >>> +             }
> >>> +           break;
> >>> +
> >>> ++          case 'r':
> >>> ++              obstack_grow (&obstack, target_relocatable_prefix,
> >>> ++                    strlen (target_relocatable_prefix));
> >>> ++            break;
> >>> ++
> >>> +         case 'S':
> >>> +           value =3D do_spec_1 (startfile_spec, 0, NULL);
> >>> +           if (value !=3D 0)
> >>> +--
> >>> +2.12.2
> >>> +
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.4/0037-Search-target-sys=
root-gcc-version-specific-dirs-with.patch b/meta/recipes-devtools/gcc/gcc-7=
.4/0037-Search-target-sysroot-gcc-version-specific-dirs-with.patch
> >>> new file mode 100644
> >>> index 0000000..6c85a03
> >>> --- /dev/null
> >>> +++ b/meta/recipes-devtools/gcc/gcc-7.4/0037-Search-target-sysroot-gc=
c-version-specific-dirs-with.patch
> >>> @@ -0,0 +1,102 @@
> >>> +From 16a326bcd126b395b29019072905bae7a5d47500 Mon Sep 17 00:00:00 20=
01
> >>> +From: Khem Raj <raj.khem@gmail.com>
> >>> +Date: Mon, 7 Dec 2015 23:41:45 +0000
> >>> +Subject: [PATCH 37/47] Search target sysroot gcc version specific di=
rs with
> >>> + multilib.
> >>> +
> >>> +We install the gcc libraries (such as crtbegin.p) into
> >>> +<sysroot><libdir>/<target-sys>/5.2.0/
> >>> +which is a default search path for GCC (aka multi_suffix in the
> >>> +code below). <target-sys> is 'machine' in gcc's terminology. We use
> >>> +these directories so that multiple gcc versions could in theory
> >>> +co-exist on target.
> >>> +
> >>> +We only want to build one gcc-cross-canadian per arch and have this =
work
> >>> +for all multilibs. <target-sys> can be handled by mapping the multil=
ib
> >>> +<target-sys> to the one used by gcc-cross-canadian, e.g.
> >>> +mips64-polkmllib32-linux
> >>> +is symlinked to by mips64-poky-linux.
> >>> +
> >>> +The default gcc search path in the target sysroot for a "lib64" mutl=
ilib
> >>> +is:
> >>> +
> >>> +<sysroot>/lib32/mips64-poky-linux/5.2.0/
> >>> +<sysroot>/lib32/../lib64/
> >>> +<sysroot>/usr/lib32/mips64-poky-linux/5.2.0/
> >>> +<sysroot>/usr/lib32/../lib64/
> >>> +<sysroot>/lib32/
> >>> +<sysroot>/usr/lib32/
> >>> +
> >>> +which means that the lib32 crtbegin.o will be found and the lib64 on=
es
> >>> +will not which leads to compiler failures.
> >>> +
> >>> +This patch injects a multilib version of that path first so the lib6=
4
> >>> +binaries can be found first. With this change the search path become=
s:
> >>> +
> >>> +<sysroot>/lib32/../lib64/mips64-poky-linux/5.2.0/
> >>> +<sysroot>/lib32/mips64-poky-linux/5.2.0/
> >>> +<sysroot>/lib32/../lib64/
> >>> +<sysroot>/usr/lib32/../lib64/mips64-poky-linux/5.2.0/
> >>> +<sysroot>/usr/lib32/mips64-poky-linux/5.2.0/
> >>> +<sysroot>/usr/lib32/../lib64/
> >>> +<sysroot>/lib32/
> >>> +<sysroot>/usr/lib32/
> >>> +
> >>> +Upstream-Status: Pending
> >>> +RP 2015/7/31
> >>> +
> >>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> +---
> >>> + gcc/gcc.c | 29 ++++++++++++++++++++++++++++-
> >>> + 1 file changed, 28 insertions(+), 1 deletion(-)
> >>> +
> >>> +diff --git a/gcc/gcc.c b/gcc/gcc.c
> >>> +index e015c77f15f..84af5d5a2e1 100644
> >>> +--- a/gcc/gcc.c
> >>> ++++ b/gcc/gcc.c
> >>> +@@ -2533,7 +2533,7 @@ for_each_path (const struct path_prefix *paths=
,
> >>> +       if (path =3D=3D NULL)
> >>> +       {
> >>> +         len =3D paths->max_len + extra_space + 1;
> >>> +-        len +=3D MAX (MAX (suffix_len, multi_os_dir_len), multiarch=
_len);
> >>> ++        len +=3D MAX ((suffix_len + multi_os_dir_len), multiarch_le=
n);
> >>> +         path =3D XNEWVEC (char, len);
> >>> +       }
> >>> +
> >>> +@@ -2545,6 +2545,33 @@ for_each_path (const struct path_prefix *path=
s,
> >>> +         /* Look first in MACHINE/VERSION subdirectory.  */
> >>> +         if (!skip_multi_dir)
> >>> +           {
> >>> ++            if (!(pl->os_multilib ? skip_multi_os_dir : skip_multi_=
dir))
> >>> ++              {
> >>> ++                const char *this_multi;
> >>> ++                size_t this_multi_len;
> >>> ++
> >>> ++                if (pl->os_multilib)
> >>> ++                  {
> >>> ++                    this_multi =3D multi_os_dir;
> >>> ++                    this_multi_len =3D multi_os_dir_len;
> >>> ++                  }
> >>> ++                else
> >>> ++                  {
> >>> ++                    this_multi =3D multi_dir;
> >>> ++                    this_multi_len =3D multi_dir_len;
> >>> ++                  }
> >>> ++
> >>> ++                /* Look in multilib MACHINE/VERSION subdirectory fi=
rst */
> >>> ++                if (this_multi_len)
> >>> ++                  {
> >>> ++                    memcpy (path + len, this_multi, this_multi_len =
+ 1);
> >>> ++                    memcpy (path + len + this_multi_len, multi_suff=
ix, suffix_len + 1);
> >>> ++                    ret =3D callback (path, callback_info);
> >>> ++                      if (ret)
> >>> ++                        break;
> >>> ++                  }
> >>> ++              }
> >>> ++
> >>> +             memcpy (path + len, multi_suffix, suffix_len + 1);
> >>> +             ret =3D callback (path, callback_info);
> >>> +             if (ret)
> >>> +--
> >>> +2.12.2
> >>> +
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.4/0038-Fix-various-_FOR_=
BUILD-and-related-variables.patch b/meta/recipes-devtools/gcc/gcc-7.4/0038-=
Fix-various-_FOR_BUILD-and-related-variables.patch
> >>> new file mode 100644
> >>> index 0000000..a226d10
> >>> --- /dev/null
> >>> +++ b/meta/recipes-devtools/gcc/gcc-7.4/0038-Fix-various-_FOR_BUILD-a=
nd-related-variables.patch
> >>> @@ -0,0 +1,137 @@
> >>> +From 6e7f526e71a76aac3d49ba8f1742fe1b359c1060 Mon Sep 17 00:00:00 20=
01
> >>> +From: Khem Raj <raj.khem@gmail.com>
> >>> +Date: Mon, 7 Dec 2015 23:42:45 +0000
> >>> +Subject: [PATCH 38/47] Fix various _FOR_BUILD and related variables
> >>> +
> >>> +When doing a FOR_BUILD thing, you have to override CFLAGS with
> >>> +CFLAGS_FOR_BUILD. And if you use C++, you also have to override
> >>> +CXXFLAGS with CXXFLAGS_FOR_BUILD.
> >>> +Without this, when building for mingw, you end up trying to use
> >>> +the mingw headers for a host build.
> >>> +
> >>> +The same goes for other variables as well, such as CPPFLAGS,
> >>> +CPP, and GMPINC.
> >>> +
> >>> +Upstream-Status: Pending
> >>> +
> >>> +Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
> >>> +Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> >>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> +---
> >>> + Makefile.in      | 6 ++++++
> >>> + Makefile.tpl     | 5 +++++
> >>> + gcc/Makefile.in  | 2 +-
> >>> + gcc/configure    | 2 +-
> >>> + gcc/configure.ac | 2 +-
> >>> + 5 files changed, 14 insertions(+), 3 deletions(-)
> >>> +
> >>> +diff --git a/Makefile.in b/Makefile.in
> >>> +index e34e9555388..a03740f3f9d 100644
> >>> +--- a/Makefile.in
> >>> ++++ b/Makefile.in
> >>> +@@ -152,6 +152,7 @@ BUILD_EXPORTS =3D \
> >>> +       CPP=3D"$(CC_FOR_BUILD) -E"; export CPP; \
> >>> +       CFLAGS=3D"$(CFLAGS_FOR_BUILD)"; export CFLAGS; \
> >>> +       CONFIG_SHELL=3D"$(SHELL)"; export CONFIG_SHELL; \
> >>> ++      CPPFLAGS=3D"$(CPPFLAGS_FOR_BUILD)"; export CPPFLAGS; \
> >>> +       CXX=3D"$(CXX_FOR_BUILD)"; export CXX; \
> >>> +       CXXFLAGS=3D"$(CXXFLAGS_FOR_BUILD)"; export CXXFLAGS; \
> >>> +       GFORTRAN=3D"$(GFORTRAN_FOR_BUILD)"; export GFORTRAN; \
> >>> +@@ -169,6 +170,9 @@ BUILD_EXPORTS =3D \
> >>> + # built for the build system to override those in BASE_FLAGS_TO_PAS=
S.
> >>> + EXTRA_BUILD_FLAGS =3D \
> >>> +       CFLAGS=3D"$(CFLAGS_FOR_BUILD)" \
> >>> ++      CXXFLAGS=3D"$(CXXFLAGS_FOR_BUILD)" \
> >>> ++      CPP=3D"$(CC_FOR_BUILD) -E" \
> >>> ++      CPPFLAGS=3D"$(CPPFLAGS_FOR_BUILD)" \
> >>> +       LDFLAGS=3D"$(LDFLAGS_FOR_BUILD)"
> >>> +
> >>> + # This is the list of directories to built for the host system.
> >>> +@@ -186,6 +190,7 @@ HOST_SUBDIR =3D @host_subdir@
> >>> + HOST_EXPORTS =3D \
> >>> +       $(BASE_EXPORTS) \
> >>> +       CC=3D"$(CC)"; export CC; \
> >>> ++      CPP=3D"$(CC) -E"; export CPP; \
> >>> +       ADA_CFLAGS=3D"$(ADA_CFLAGS)"; export ADA_CFLAGS; \
> >>> +       CFLAGS=3D"$(CFLAGS)"; export CFLAGS; \
> >>> +       CONFIG_SHELL=3D"$(SHELL)"; export CONFIG_SHELL; \
> >>> +@@ -734,6 +739,7 @@ BASE_FLAGS_TO_PASS =3D \
> >>> +       "CC_FOR_BUILD=3D$(CC_FOR_BUILD)" \
> >>> +       "CFLAGS_FOR_BUILD=3D$(CFLAGS_FOR_BUILD)" \
> >>> +       "CXX_FOR_BUILD=3D$(CXX_FOR_BUILD)" \
> >>> ++      "CXXFLAGS_FOR_BUILD=3D$(CXXFLAGS_FOR_BUILD)" \
> >>> +       "EXPECT=3D$(EXPECT)" \
> >>> +       "FLEX=3D$(FLEX)" \
> >>> +       "INSTALL=3D$(INSTALL)" \
> >>> +diff --git a/Makefile.tpl b/Makefile.tpl
> >>> +index d0fa07005be..953376c658d 100644
> >>> +--- a/Makefile.tpl
> >>> ++++ b/Makefile.tpl
> >>> +@@ -154,6 +154,7 @@ BUILD_EXPORTS =3D \
> >>> +       CC=3D"$(CC_FOR_BUILD)"; export CC; \
> >>> +       CFLAGS=3D"$(CFLAGS_FOR_BUILD)"; export CFLAGS; \
> >>> +       CONFIG_SHELL=3D"$(SHELL)"; export CONFIG_SHELL; \
> >>> ++      CPPFLAGS=3D"$(CPPFLAGS_FOR_BUILD)"; export CPPFLAGS; \
> >>> +       CXX=3D"$(CXX_FOR_BUILD)"; export CXX; \
> >>> +       CXXFLAGS=3D"$(CXXFLAGS_FOR_BUILD)"; export CXXFLAGS; \
> >>> +       GFORTRAN=3D"$(GFORTRAN_FOR_BUILD)"; export GFORTRAN; \
> >>> +@@ -171,6 +172,9 @@ BUILD_EXPORTS =3D \
> >>> + # built for the build system to override those in BASE_FLAGS_TO_PAS=
S.
> >>> + EXTRA_BUILD_FLAGS =3D \
> >>> +       CFLAGS=3D"$(CFLAGS_FOR_BUILD)" \
> >>> ++      CXXFLAGS=3D"$(CXXFLAGS_FOR_BUILD)" \
> >>> ++      CPP=3D"$(CC_FOR_BUILD) -E" \
> >>> ++      CPPFLAGS=3D"$(CPPFLAGS_FOR_BUILD)" \
> >>> +       LDFLAGS=3D"$(LDFLAGS_FOR_BUILD)"
> >>> +
> >>> + # This is the list of directories to built for the host system.
> >>> +@@ -188,6 +192,7 @@ HOST_SUBDIR =3D @host_subdir@
> >>> + HOST_EXPORTS =3D \
> >>> +       $(BASE_EXPORTS) \
> >>> +       CC=3D"$(CC)"; export CC; \
> >>> ++      CPP=3D"$(CC) -E"; export CPP; \
> >>> +       ADA_CFLAGS=3D"$(ADA_CFLAGS)"; export ADA_CFLAGS; \
> >>> +       CFLAGS=3D"$(CFLAGS)"; export CFLAGS; \
> >>> +       CONFIG_SHELL=3D"$(SHELL)"; export CONFIG_SHELL; \
> >>> +diff --git a/gcc/Makefile.in b/gcc/Makefile.in
> >>> +index 95d21effad3..dbe2bacde50 100644
> >>> +--- a/gcc/Makefile.in
> >>> ++++ b/gcc/Makefile.in
> >>> +@@ -795,7 +795,7 @@ BUILD_LDFLAGS=3D@BUILD_LDFLAGS@
> >>> + BUILD_NO_PIE_FLAG =3D @BUILD_NO_PIE_FLAG@
> >>> + BUILD_LDFLAGS +=3D $(BUILD_NO_PIE_FLAG)
> >>> + BUILD_CPPFLAGS=3D -I. -I$(@D) -I$(srcdir) -I$(srcdir)/$(@D) \
> >>> +-              -I$(srcdir)/../include @INCINTL@ $(CPPINC) $(CPPFLAGS=
)
> >>> ++              -I$(srcdir)/../include @INCINTL@ $(CPPINC) $(CPPFLAGS=
_FOR_BUILD)
> >>> +
> >>> + # Actual name to use when installing a native compiler.
> >>> + GCC_INSTALL_NAME :=3D $(shell echo gcc|sed '$(program_transform_nam=
e)')
> >>> +diff --git a/gcc/configure b/gcc/configure
> >>> +index 6ba391ed068..72ca6e5c535 100755
> >>> +--- a/gcc/configure
> >>> ++++ b/gcc/configure
> >>> +@@ -11789,7 +11789,7 @@ else
> >>> +       CC=3D"${CC_FOR_BUILD}" CFLAGS=3D"${CFLAGS_FOR_BUILD}" \
> >>> +       CXX=3D"${CXX_FOR_BUILD}" CXXFLAGS=3D"${CXXFLAGS_FOR_BUILD}" \
> >>> +       LD=3D"${LD_FOR_BUILD}" LDFLAGS=3D"${LDFLAGS_FOR_BUILD}" \
> >>> +-      GMPINC=3D"" CPPFLAGS=3D"${CPPFLAGS} -DGENERATOR_FILE" \
> >>> ++      GMPINC=3D"" CPPFLAGS=3D"${CPPFLAGS_FOR_BUILD} -DGENERATOR_FIL=
E" \
> >>> +       ${realsrcdir}/configure \
> >>> +               --enable-languages=3D${enable_languages-all} \
> >>> +               --target=3D$target_alias --host=3D$build_alias --buil=
d=3D$build_alias
> >>> +diff --git a/gcc/configure.ac b/gcc/configure.ac
> >>> +index 8551a412df3..6eefb61dc2b 100644
> >>> +--- a/gcc/configure.ac
> >>> ++++ b/gcc/configure.ac
> >>> +@@ -1708,7 +1708,7 @@ else
> >>> +       CC=3D"${CC_FOR_BUILD}" CFLAGS=3D"${CFLAGS_FOR_BUILD}" \
> >>> +       CXX=3D"${CXX_FOR_BUILD}" CXXFLAGS=3D"${CXXFLAGS_FOR_BUILD}" \
> >>> +       LD=3D"${LD_FOR_BUILD}" LDFLAGS=3D"${LDFLAGS_FOR_BUILD}" \
> >>> +-      GMPINC=3D"" CPPFLAGS=3D"${CPPFLAGS} -DGENERATOR_FILE" \
> >>> ++      GMPINC=3D"" CPPFLAGS=3D"${CPPFLAGS_FOR_BUILD} -DGENERATOR_FIL=
E" \
> >>> +       ${realsrcdir}/configure \
> >>> +               --enable-languages=3D${enable_languages-all} \
> >>> +               --target=3D$target_alias --host=3D$build_alias --buil=
d=3D$build_alias
> >>> +--
> >>> +2.12.2
> >>> +
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.4/0039-nios2-Define-MUSL=
_DYNAMIC_LINKER.patch b/meta/recipes-devtools/gcc/gcc-7.4/0039-nios2-Define=
-MUSL_DYNAMIC_LINKER.patch
> >>> new file mode 100644
> >>> index 0000000..a7aeccd
> >>> --- /dev/null
> >>> +++ b/meta/recipes-devtools/gcc/gcc-7.4/0039-nios2-Define-MUSL_DYNAMI=
C_LINKER.patch
> >>> @@ -0,0 +1,28 @@
> >>> +From 6d03ddfb7a092942be6b58b1830f6986d012d5e3 Mon Sep 17 00:00:00 20=
01
> >>> +From: Khem Raj <raj.khem@gmail.com>
> >>> +Date: Tue, 2 Feb 2016 10:26:10 -0800
> >>> +Subject: [PATCH 39/47] nios2: Define MUSL_DYNAMIC_LINKER
> >>> +
> >>> +Signed-off-by: Marek Vasut <marex@denx.de>
> >>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> +---
> >>> +Upstream-Status: Inappropriate [OE-Specific]
> >>> +
> >>> + gcc/config/nios2/linux.h | 1 +
> >>> + 1 file changed, 1 insertion(+)
> >>> +
> >>> +diff --git a/gcc/config/nios2/linux.h b/gcc/config/nios2/linux.h
> >>> +index 5177fa641a4..1b8accda6ee 100644
> >>> +--- a/gcc/config/nios2/linux.h
> >>> ++++ b/gcc/config/nios2/linux.h
> >>> +@@ -30,6 +30,7 @@
> >>> + #define CPP_SPEC "%{posix:-D_POSIX_SOURCE} %{pthread:-D_REENTRANT}"
> >>> +
> >>> + #define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-nios2.so.1"
> >>> ++#define MUSL_DYNAMIC_LINKER  "/lib/ld-musl-nios2.so.1"
> >>> +
> >>> + #undef LINK_SPEC
> >>> + #define LINK_SPEC LINK_SPEC_ENDIAN \
> >>> +--
> >>> +2.12.2
> >>> +
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.4/0040-Add-ssp_nonshared=
-to-link-commandline-for-musl-targe.patch b/meta/recipes-devtools/gcc/gcc-7=
.4/0040-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
> >>> new file mode 100644
> >>> index 0000000..29b7ce7
> >>> --- /dev/null
> >>> +++ b/meta/recipes-devtools/gcc/gcc-7.4/0040-Add-ssp_nonshared-to-lin=
k-commandline-for-musl-targe.patch
> >>> @@ -0,0 +1,87 @@
> >>> +From 210f6b3b82084cc756e02b8bc12f909a43b14ee8 Mon Sep 17 00:00:00 20=
01
> >>> +From: Khem Raj <raj.khem@gmail.com>
> >>> +Date: Tue, 27 Jun 2017 18:10:54 -0700
> >>> +Subject: [PATCH 40/49] Add ssp_nonshared to link commandline for mus=
l targets
> >>> +
> >>> +when -fstack-protector options are enabled we need to
> >>> +link with ssp_shared on musl since it does not provide
> >>> +the __stack_chk_fail_local() so essentially it provides
> >>> +libssp but not libssp_nonshared something like
> >>> +TARGET_LIBC_PROVIDES_SSP_BUT_NOT_SSP_NONSHARED
> >>> + where-as for glibc the needed symbols
> >>> +are already present in libc_nonshared library therefore
> >>> +we do not need any library helper on glibc based systems
> >>> +but musl needs the libssp_noshared from gcc
> >>> +
> >>> +Upstream-Status: Pending
> >>> +
> >>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> +---
> >>> + gcc/config/linux.h          |  7 +++++++
> >>> + gcc/config/rs6000/linux.h   | 10 ++++++++++
> >>> + gcc/config/rs6000/linux64.h | 10 ++++++++++
> >>> + 3 files changed, 27 insertions(+)
> >>> +
> >>> +diff --git a/gcc/config/linux.h b/gcc/config/linux.h
> >>> +index 2e683d0c430..1b4df798671 100644
> >>> +--- a/gcc/config/linux.h
> >>> ++++ b/gcc/config/linux.h
> >>> +@@ -182,6 +182,13 @@ see the files COPYING3 and COPYING.RUNTIME resp=
ectively.  If not, see
> >>> +     { GCC_INCLUDE_DIR, "GCC", 0, 1, 0, 0 },           \
> >>> +     { 0, 0, 0, 0, 0, 0 }                              \
> >>> +   }
> >>> ++#ifdef TARGET_LIBC_PROVIDES_SSP
> >>> ++#undef LINK_SSP_SPEC
> >>> ++#define LINK_SSP_SPEC "%{fstack-protector|fstack-protector-all" \
> >>> ++                     "|fstack-protector-strong|fstack-protector-exp=
licit" \
> >>> ++                     ":-lssp_nonshared}"
> >>> ++#endif
> >>> ++
> >>> + #endif
> >>> +
> >>> + #if (DEFAULT_LIBC =3D=3D LIBC_UCLIBC) && defined (SINGLE_LIBC) /* u=
Clinux */
> >>> +diff --git a/gcc/config/rs6000/linux.h b/gcc/config/rs6000/linux.h
> >>> +index 684afd6c190..22cfa391b89 100644
> >>> +--- a/gcc/config/rs6000/linux.h
> >>> ++++ b/gcc/config/rs6000/linux.h
> >>> +@@ -91,6 +91,16 @@
> >>> +                                        " -m elf32ppclinux")
> >>> + #endif
> >>> +
> >>> ++/* link libssp_nonshared.a with musl */
> >>> ++#if DEFAULT_LIBC =3D=3D LIBC_MUSL
> >>> ++#ifdef TARGET_LIBC_PROVIDES_SSP
> >>> ++#undef LINK_SSP_SPEC
> >>> ++#define LINK_SSP_SPEC "%{fstack-protector|fstack-protector-all" \
> >>> ++                     "|fstack-protector-strong|fstack-protector-exp=
licit" \
> >>> ++                     ":-lssp_nonshared}"
> >>> ++#endif
> >>> ++#endif
> >>> ++
> >>> + #undef LINK_OS_LINUX_SPEC
> >>> + #define LINK_OS_LINUX_SPEC LINK_OS_LINUX_EMUL " %{!shared: %{!stati=
c: \
> >>> +   %{rdynamic:-export-dynamic} \
> >>> +diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64=
.h
> >>> +index 3b00ec0fcf0..8371f8d7b6b 100644
> >>> +--- a/gcc/config/rs6000/linux64.h
> >>> ++++ b/gcc/config/rs6000/linux64.h
> >>> +@@ -465,6 +465,16 @@ extern int dot_symbols;
> >>> +                                          " -m elf64ppc")
> >>> + #endif
> >>> +
> >>> ++/* link libssp_nonshared.a with musl */
> >>> ++#if DEFAULT_LIBC =3D=3D LIBC_MUSL
> >>> ++#ifdef TARGET_LIBC_PROVIDES_SSP
> >>> ++#undef LINK_SSP_SPEC
> >>> ++#define LINK_SSP_SPEC "%{fstack-protector|fstack-protector-all" \
> >>> ++                     "|fstack-protector-strong|fstack-protector-exp=
licit" \
> >>> ++                     ":-lssp_nonshared}"
> >>> ++#endif
> >>> ++#endif
> >>> ++
> >>> + #define LINK_OS_LINUX_SPEC32 LINK_OS_LINUX_EMUL32 " %{!shared: %{!s=
tatic: \
> >>> +   %{rdynamic:-export-dynamic} \
> >>> +   -dynamic-linker " GNU_USER_DYNAMIC_LINKER32 "}} \
> >>> +--
> >>> +2.13.2
> >>> +
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.4/0041-gcc-libcpp-suppor=
t-ffile-prefix-map-old-new.patch b/meta/recipes-devtools/gcc/gcc-7.4/0041-g=
cc-libcpp-support-ffile-prefix-map-old-new.patch
> >>> new file mode 100644
> >>> index 0000000..5260e36
> >>> --- /dev/null
> >>> +++ b/meta/recipes-devtools/gcc/gcc-7.4/0041-gcc-libcpp-support-ffile=
-prefix-map-old-new.patch
> >>> @@ -0,0 +1,284 @@
> >>> +From 4eadc99bdd0974761bf48f0fd32994dd9a3ffcfe Mon Sep 17 00:00:00 20=
01
> >>> +From: Hongxu Jia <hongxu.jia@windriver.com>
> >>> +Date: Wed, 16 Mar 2016 02:27:43 -0400
> >>> +Subject: [PATCH 41/47] gcc/libcpp: support -ffile-prefix-map=3D<old>=
=3D<new>
> >>> +
> >>> +Similar -fdebug-prefix-map, add option -ffile-prefix-map to map one
> >>> +directory name (old) to another (new) in __FILE__, __BASE_FILE__ and
> >>> +__builtin_FILE ().
> >>> +
> >>> +https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D70268
> >>> +
> >>> +Upstream-Status: Submitted [gcc-patches@gcc.gnu.org]
> >>> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> >>> +---
> >>> + gcc/c-family/c-opts.c     | 13 +++++++
> >>> + gcc/c-family/c.opt        |  4 +++
> >>> + gcc/dwarf2out.c           |  1 +
> >>> + gcc/gimplify.c            |  2 ++
> >>> + libcpp/Makefile.in        | 10 +++---
> >>> + libcpp/file-map.c         | 92 ++++++++++++++++++++++++++++++++++++=
+++++++++++
> >>> + libcpp/include/file-map.h | 30 ++++++++++++++++
> >>> + libcpp/macro.c            |  2 ++
> >>> + 8 files changed, 149 insertions(+), 5 deletions(-)
> >>> + create mode 100644 libcpp/file-map.c
> >>> + create mode 100644 libcpp/include/file-map.h
> >>> +
> >>> +diff --git a/gcc/c-family/c-opts.c b/gcc/c-family/c-opts.c
> >>> +index ea0e01b101c..a741c75a78f 100644
> >>> +--- a/gcc/c-family/c-opts.c
> >>> ++++ b/gcc/c-family/c-opts.c
> >>> +@@ -39,6 +39,14 @@ along with GCC; see the file COPYING3.  If not se=
e
> >>> + #include "opts.h"
> >>> + #include "plugin.h"           /* For PLUGIN_INCLUDE_FILE event.  */
> >>> + #include "mkdeps.h"
> >>> ++#include "file-map.h"
> >>> ++#include "c-target.h"
> >>> ++#include "tm.h"                       /* For BYTES_BIG_ENDIAN,
> >>> ++                                 DOLLARS_IN_IDENTIFIERS,
> >>> ++                                 STDC_0_IN_SYSTEM_HEADERS,
> >>> ++                                 TARGET_FLT_EVAL_METHOD_NON_DEFAULT=
 and
> >>> ++                                 TARGET_OPTF.  */
> >>> ++#include "tm_p.h"             /* For C_COMMON_OVERRIDE_OPTIONS.  */
> >>> + #include "dumpfile.h"
> >>> +
> >>> + #ifndef DOLLARS_IN_IDENTIFIERS
> >>> +@@ -517,6 +525,11 @@ c_common_handle_option (size_t scode, const cha=
r *arg, int value,
> >>> +       cpp_opts->narrow_charset =3D arg;
> >>> +       break;
> >>> +
> >>> ++    case OPT_ffile_prefix_map_:
> >>> ++      if (add_file_prefix_map (arg) < 0)
> >>> ++        error ("invalid argument %qs to -ffile-prefix-map", arg);
> >>> ++      break;
> >>> ++
> >>> +     case OPT_fwide_exec_charset_:
> >>> +       cpp_opts->wide_charset =3D arg;
> >>> +       break;
> >>> +diff --git a/gcc/c-family/c.opt b/gcc/c-family/c.opt
> >>> +index c4ef7796282..73333dfd57c 100644
> >>> +--- a/gcc/c-family/c.opt
> >>> ++++ b/gcc/c-family/c.opt
> >>> +@@ -1372,6 +1372,10 @@ fexec-charset=3D
> >>> + C ObjC C++ ObjC++ Joined RejectNegative
> >>> + -fexec-charset=3D<cset> Convert all strings and character constants=
 to character set <cset>.
> >>> +
> >>> ++ffile-prefix-map=3D
> >>> ++C ObjC C++ ObjC++ Joined RejectNegative
> >>> ++-ffile-prefix-map=3D<old=3Dnew>   Map one directory name to another=
 in __FILE__, __BASE_FILE__ and __builtin_FILE ()
> >>> ++
> >>> + fextended-identifiers
> >>> + C ObjC C++ ObjC++
> >>> + Permit universal character names (\\u and \\U) in identifiers.
> >>> +diff --git a/gcc/dwarf2out.c b/gcc/dwarf2out.c
> >>> +index 98c51576ec2..762f69ae88e 100644
> >>> +--- a/gcc/dwarf2out.c
> >>> ++++ b/gcc/dwarf2out.c
> >>> +@@ -23421,6 +23421,7 @@ gen_producer_string (void)
> >>> +       case OPT_fltrans_output_list_:
> >>> +       case OPT_fresolution_:
> >>> +       case OPT_fdebug_prefix_map_:
> >>> ++      case OPT_ffile_prefix_map_:
> >>> +       /* Ignore these.  */
> >>> +       continue;
> >>> +       default:
> >>> +diff --git a/gcc/gimplify.c b/gcc/gimplify.c
> >>> +index fd27eb1523f..5542b379f28 100644
> >>> +--- a/gcc/gimplify.c
> >>> ++++ b/gcc/gimplify.c
> >>> +@@ -58,6 +58,8 @@ along with GCC; see the file COPYING3.  If not see
> >>> + #include "gomp-constants.h"
> >>> + #include "tree-dump.h"
> >>> + #include "gimple-walk.h"
> >>> ++#include "file-map.h"
> >>> ++
> >>> + #include "langhooks-def.h"    /* FIXME: for lhd_set_decl_assembler_=
name */
> >>> + #include "builtins.h"
> >>> + #include "asan.h"
> >>> +diff --git a/libcpp/Makefile.in b/libcpp/Makefile.in
> >>> +index 0bd3787c25e..d3b52956b52 100644
> >>> +--- a/libcpp/Makefile.in
> >>> ++++ b/libcpp/Makefile.in
> >>> +@@ -84,12 +84,12 @@ DEPMODE =3D $(CXXDEPMODE)
> >>> +
> >>> +
> >>> + libcpp_a_OBJS =3D charset.o directives.o directives-only.o errors.o=
 \
> >>> +-      expr.o files.o identifiers.o init.o lex.o line-map.o macro.o =
\
> >>> +-      mkdeps.o pch.o symtab.o traditional.o
> >>> ++      expr.o file-map.o files.o identifiers.o init.o lex.o line-map=
.o \
> >>> ++      macro.o mkdeps.o pch.o symtab.o traditional.o
> >>> +
> >>> + libcpp_a_SOURCES =3D charset.c directives.c directives-only.c error=
s.c \
> >>> +-      expr.c files.c identifiers.c init.c lex.c line-map.c macro.c =
\
> >>> +-      mkdeps.c pch.c symtab.c traditional.c
> >>> ++      expr.c file-map.c files.c identifiers.c init.c lex.c line-map=
.c \
> >>> ++      macro.c mkdeps.c pch.c symtab.c traditional.c
> >>> +
> >>> + all: libcpp.a $(USED_CATALOGS)
> >>> +
> >>> +@@ -263,7 +263,7 @@ po/$(PACKAGE).pot: $(libcpp_a_SOURCES)
> >>> +
> >>> + TAGS_SOURCES =3D $(libcpp_a_SOURCES) internal.h ucnid.h \
> >>> +     include/line-map.h include/symtab.h include/cpp-id-data.h \
> >>> +-    include/cpplib.h include/mkdeps.h system.h
> >>> ++    include/cpplib.h include/mkdeps.h system.h include/file-map.h
> >>> +
> >>> + TAGS: $(TAGS_SOURCES)
> >>> +       cd $(srcdir) && etags $(TAGS_SOURCES)
> >>> +diff --git a/libcpp/file-map.c b/libcpp/file-map.c
> >>> +new file mode 100644
> >>> +index 00000000000..18035ef6a72
> >>> +--- /dev/null
> >>> ++++ b/libcpp/file-map.c
> >>> +@@ -0,0 +1,92 @@
> >>> ++/* Map one directory name to another in __FILE__, __BASE_FILE__
> >>> ++   and __builtin_FILE ().
> >>> ++   Copyright (C) 2001-2016 Free Software Foundation, Inc.
> >>> ++
> >>> ++This program is free software; you can redistribute it and/or modif=
y it
> >>> ++under the terms of the GNU General Public License as published by t=
he
> >>> ++Free Software Foundation; either version 3, or (at your option) any
> >>> ++later version.
> >>> ++
> >>> ++This program is distributed in the hope that it will be useful,
> >>> ++but WITHOUT ANY WARRANTY; without even the implied warranty of
> >>> ++MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> >>> ++GNU General Public License for more details.
> >>> ++
> >>> ++You should have received a copy of the GNU General Public License
> >>> ++along with this program; see the file COPYING3.  If not see
> >>> ++<http://www.gnu.org/licenses/>.
> >>> ++
> >>> ++ In other words, you are welcome to use, share and improve this pro=
gram.
> >>> ++ You are forbidden to forbid anyone else to use, share and improve
> >>> ++ what you give them.   Help stamp out software-hoarding!  */
> >>> ++
> >>> ++#include "config.h"
> >>> ++#include "system.h"
> >>> ++#include "file-map.h"
> >>> ++
> >>> ++/* Structure recording the mapping from source file and directory
> >>> ++   names at compile time to __FILE__ */
> >>> ++typedef struct file_prefix_map
> >>> ++{
> >>> ++  const char *old_prefix;
> >>> ++  const char *new_prefix;
> >>> ++  size_t old_len;
> >>> ++  size_t new_len;
> >>> ++  struct file_prefix_map *next;
> >>> ++} file_prefix_map;
> >>> ++
> >>> ++/* Linked list of such structures.  */
> >>> ++static file_prefix_map *file_prefix_maps;
> >>> ++
> >>> ++/* Record prefix mapping of __FILE__.  ARG is the argument to
> >>> ++   -ffile-prefix-map and must be of the form OLD=3DNEW.  */
> >>> ++int
> >>> ++add_file_prefix_map (const char *arg)
> >>> ++{
> >>> ++  file_prefix_map *map;
> >>> ++  const char *p;
> >>> ++
> >>> ++  p =3D strchr (arg, '=3D');
> >>> ++  if (!p)
> >>> ++  {
> >>> ++      fprintf(stderr, "invalid argument %qs to -ffile-prefix-map", =
arg);
> >>> ++      return -1;
> >>> ++  }
> >>> ++  map =3D XNEW (file_prefix_map);
> >>> ++  map->old_prefix =3D xstrndup (arg, p - arg);
> >>> ++  map->old_len =3D p - arg;
> >>> ++  p++;
> >>> ++  map->new_prefix =3D xstrdup (p);
> >>> ++  map->new_len =3D strlen (p);
> >>> ++  map->next =3D file_prefix_maps;
> >>> ++  file_prefix_maps =3D map;
> >>> ++
> >>> ++  return 0;
> >>> ++}
> >>> ++
> >>> ++/* Perform user-specified mapping of __FILE__ prefixes.  Return
> >>> ++   the new name corresponding to filename.  */
> >>> ++
> >>> ++const char *
> >>> ++remap_file_filename (const char *filename)
> >>> ++{
> >>> ++  file_prefix_map *map;
> >>> ++  char *s;
> >>> ++  const char *name;
> >>> ++  size_t name_len;
> >>> ++
> >>> ++  for (map =3D file_prefix_maps; map; map =3D map->next)
> >>> ++    if (filename_ncmp (filename, map->old_prefix, map->old_len) =3D=
=3D 0)
> >>> ++      break;
> >>> ++  if (!map)
> >>> ++    return filename;
> >>> ++  name =3D filename + map->old_len;
> >>> ++  name_len =3D strlen (name) + 1;
> >>> ++  s =3D (char *) alloca (name_len + map->new_len);
> >>> ++  memcpy (s, map->new_prefix, map->new_len);
> >>> ++  memcpy (s + map->new_len, name, name_len);
> >>> ++
> >>> ++  return xstrdup (s);
> >>> ++}
> >>> ++
> >>> ++
> >>> +diff --git a/libcpp/include/file-map.h b/libcpp/include/file-map.h
> >>> +new file mode 100644
> >>> +index 00000000000..87503152d27
> >>> +--- /dev/null
> >>> ++++ b/libcpp/include/file-map.h
> >>> +@@ -0,0 +1,30 @@
> >>> ++/* Map one directory name to another in __FILE__, __BASE_FILE__
> >>> ++   and __builtin_FILE ().
> >>> ++   Copyright (C) 2001-2016 Free Software Foundation, Inc.
> >>> ++
> >>> ++This program is free software; you can redistribute it and/or modif=
y it
> >>> ++under the terms of the GNU General Public License as published by t=
he
> >>> ++Free Software Foundation; either version 3, or (at your option) any
> >>> ++later version.
> >>> ++
> >>> ++This program is distributed in the hope that it will be useful,
> >>> ++but WITHOUT ANY WARRANTY; without even the implied warranty of
> >>> ++MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> >>> ++GNU General Public License for more details.
> >>> ++
> >>> ++You should have received a copy of the GNU General Public License
> >>> ++along with this program; see the file COPYING3.  If not see
> >>> ++<http://www.gnu.org/licenses/>.
> >>> ++
> >>> ++ In other words, you are welcome to use, share and improve this pro=
gram.
> >>> ++ You are forbidden to forbid anyone else to use, share and improve
> >>> ++ what you give them.   Help stamp out software-hoarding!  */
> >>> ++
> >>> ++#ifndef LIBCPP_FILE_MAP_H
> >>> ++#define LIBCPP_FILE_MAP_H
> >>> ++
> >>> ++const char * remap_file_filename (const char *filename);
> >>> ++
> >>> ++int add_file_prefix_map (const char *arg);
> >>> ++
> >>> ++#endif /* !LIBCPP_FILE_MAP_H  */
> >>> +diff --git a/libcpp/macro.c b/libcpp/macro.c
> >>> +index de18c2210cf..2748c70d520 100644
> >>> +--- a/libcpp/macro.c
> >>> ++++ b/libcpp/macro.c
> >>> +@@ -26,6 +26,7 @@ along with this program; see the file COPYING3.  I=
f not see
> >>> + #include "system.h"
> >>> + #include "cpplib.h"
> >>> + #include "internal.h"
> >>> ++#include "file-map.h"
> >>> +
> >>> + typedef struct macro_arg macro_arg;
> >>> + /* This structure represents the tokens of a macro argument.  These
> >>> +@@ -301,6 +302,7 @@ _cpp_builtin_macro_text (cpp_reader *pfile, cpp_=
hashnode *node,
> >>> +           if (!name)
> >>> +             abort ();
> >>> +         }
> >>> ++      name =3D remap_file_filename (name);
> >>> +       len =3D strlen (name);
> >>> +       buf =3D _cpp_unaligned_alloc (pfile, len * 2 + 3);
> >>> +       result =3D buf;
> >>> +--
> >>> +2.12.2
> >>> +
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.4/0042-Reuse-fdebug-pref=
ix-map-to-replace-ffile-prefix-map.patch b/meta/recipes-devtools/gcc/gcc-7.=
4/0042-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch
> >>> new file mode 100644
> >>> index 0000000..5247167
> >>> --- /dev/null
> >>> +++ b/meta/recipes-devtools/gcc/gcc-7.4/0042-Reuse-fdebug-prefix-map-=
to-replace-ffile-prefix-map.patch
> >>> @@ -0,0 +1,43 @@
> >>> +From ddddc7335539fb8a6d30beba21781762df159186 Mon Sep 17 00:00:00 20=
01
> >>> +From: Hongxu Jia <hongxu.jia@windriver.com>
> >>> +Date: Wed, 16 Mar 2016 05:39:59 -0400
> >>> +Subject: [PATCH 42/47] Reuse -fdebug-prefix-map to replace -ffile-pr=
efix-map
> >>> +
> >>> +The oe-core may use external toolchain to compile,
> >>> +which may not support -ffile-prefix-map.
> >>> +
> >>> +Since we use -fdebug-prefix-map to do the same thing,
> >>> +so we could reuse it to replace -ffile-prefix-map.
> >>> +
> >>> +Upstream-Status: Inappropriate[oe-core specific]
> >>> +
> >>> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> >>> +---
> >>> + gcc/opts-global.c | 4 ++++
> >>> + 1 file changed, 4 insertions(+)
> >>> +
> >>> +diff --git a/gcc/opts-global.c b/gcc/opts-global.c
> >>> +index 50bad77c347..32b1d286721 100644
> >>> +--- a/gcc/opts-global.c
> >>> ++++ b/gcc/opts-global.c
> >>> +@@ -31,6 +31,7 @@ along with GCC; see the file COPYING3.  If not see
> >>> + #include "langhooks.h"
> >>> + #include "dbgcnt.h"
> >>> + #include "debug.h"
> >>> ++#include "file-map.h"
> >>> + #include "output.h"
> >>> + #include "plugin.h"
> >>> + #include "toplev.h"
> >>> +@@ -357,6 +358,9 @@ handle_common_deferred_options (void)
> >>> +
> >>> +       case OPT_fdebug_prefix_map_:
> >>> +         add_debug_prefix_map (opt->arg);
> >>> ++
> >>> ++        /* Reuse -fdebug-prefix-map to replace -ffile-prefix-map */
> >>> ++        add_file_prefix_map (opt->arg);
> >>> +         break;
> >>> +
> >>> +       case OPT_fdump_:
> >>> +--
> >>> +2.12.2
> >>> +
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.4/0043-gcc-final.c-fdebu=
g-prefix-map-support-to-remap-sourc.patch b/meta/recipes-devtools/gcc/gcc-7=
.4/0043-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch
> >>> new file mode 100644
> >>> index 0000000..74a5c86
> >>> --- /dev/null
> >>> +++ b/meta/recipes-devtools/gcc/gcc-7.4/0043-gcc-final.c-fdebug-prefi=
x-map-support-to-remap-sourc.patch
> >>> @@ -0,0 +1,54 @@
> >>> +From 5bc97be388485a5f8dd85db34372a1299bffd263 Mon Sep 17 00:00:00 20=
01
> >>> +From: Hongxu Jia <hongxu.jia@windriver.com>
> >>> +Date: Thu, 24 Mar 2016 11:23:14 -0400
> >>> +Subject: [PATCH 43/47] gcc/final.c: -fdebug-prefix-map support to re=
map
> >>> + sources with relative path
> >>> +
> >>> +PR other/70428
> >>> +* final.c (remap_debug_filename): Use lrealpath to translate
> >>> +relative path before remapping
> >>> +
> >>> +https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D70428
> >>> +Upstream-Status: Submitted [gcc-patches@gcc.gnu.org]
> >>> +
> >>> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> >>> +---
> >>> + gcc/final.c | 15 ++++++++++++---
> >>> + 1 file changed, 12 insertions(+), 3 deletions(-)
> >>> +
> >>> +diff --git a/gcc/final.c b/gcc/final.c
> >>> +index 820162b2d28..d74cb901abd 100644
> >>> +--- a/gcc/final.c
> >>> ++++ b/gcc/final.c
> >>> +@@ -1559,16 +1559,25 @@ remap_debug_filename (const char *filename)
> >>> +   const char *name;
> >>> +   size_t name_len;
> >>> +
> >>> ++  /* Support to remap filename with relative path  */
> >>> ++  char *realpath =3D lrealpath (filename);
> >>> ++  if (realpath =3D=3D NULL)
> >>> ++    return filename;
> >>> ++
> >>> +   for (map =3D debug_prefix_maps; map; map =3D map->next)
> >>> +-    if (filename_ncmp (filename, map->old_prefix, map->old_len) =3D=
=3D 0)
> >>> ++    if (filename_ncmp (realpath, map->old_prefix, map->old_len) =3D=
=3D 0)
> >>> +       break;
> >>> +   if (!map)
> >>> +-    return filename;
> >>> +-  name =3D filename + map->old_len;
> >>> ++    {
> >>> ++      free (realpath);
> >>> ++      return filename;
> >>> ++    }
> >>> ++  name =3D realpath + map->old_len;
> >>> +   name_len =3D strlen (name) + 1;
> >>> +   s =3D (char *) alloca (name_len + map->new_len);
> >>> +   memcpy (s, map->new_prefix, map->new_len);
> >>> +   memcpy (s + map->new_len, name, name_len);
> >>> ++  free (realpath);
> >>> +   return ggc_strdup (s);
> >>> + }
> >>> +
> >>> +--
> >>> +2.12.2
> >>> +
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.4/0044-libgcc-Add-knob-t=
o-use-ldbl-128-on-ppc.patch b/meta/recipes-devtools/gcc/gcc-7.4/0044-libgcc=
-Add-knob-to-use-ldbl-128-on-ppc.patch
> >>> new file mode 100644
> >>> index 0000000..e39af9b
> >>> --- /dev/null
> >>> +++ b/meta/recipes-devtools/gcc/gcc-7.4/0044-libgcc-Add-knob-to-use-l=
dbl-128-on-ppc.patch
> >>> @@ -0,0 +1,124 @@
> >>> +From 847aec764540636ec654fd7a012e271afa8d4e0f Mon Sep 17 00:00:00 20=
01
> >>> +From: Khem Raj <raj.khem@gmail.com>
> >>> +Date: Fri, 29 Apr 2016 20:03:28 +0000
> >>> +Subject: [PATCH 44/47] libgcc: Add knob to use ldbl-128 on ppc
> >>> +
> >>> +musl does not support ldbl 128 so we can not assume
> >>> +that linux as a whole supports ldbl-128 bits, instead
> >>> +act upon configure option passed to gcc and assume no
> >>> +on musl and yes otherwise if no option is passed since
> >>> +default behaviour is to assume ldbl128 it does not
> >>> +change the defaults
> >>> +
> >>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> +Upstream-Status: Pending
> >>> +---
> >>> + libgcc/Makefile.in           |  1 +
> >>> + libgcc/config/rs6000/t-linux |  5 ++++-
> >>> + libgcc/configure             | 18 ++++++++++++++++++
> >>> + libgcc/configure.ac          | 12 ++++++++++++
> >>> + 4 files changed, 35 insertions(+), 1 deletion(-)
> >>> + mode change 100644 =3D> 100755 libgcc/configure
> >>> +
> >>> +diff --git a/libgcc/Makefile.in b/libgcc/Makefile.in
> >>> +index a1a392de88d..2fe6889a342 100644
> >>> +--- a/libgcc/Makefile.in
> >>> ++++ b/libgcc/Makefile.in
> >>> +@@ -48,6 +48,7 @@ unwind_header =3D @unwind_header@
> >>> + md_unwind_header =3D @md_unwind_header@
> >>> + sfp_machine_header =3D @sfp_machine_header@
> >>> + thread_header =3D @thread_header@
> >>> ++with_ldbl128 =3D @with_ldbl128@
> >>> +
> >>> + host_noncanonical =3D @host_noncanonical@
> >>> + real_host_noncanonical =3D @real_host_noncanonical@
> >>> +diff --git a/libgcc/config/rs6000/t-linux b/libgcc/config/rs6000/t-l=
inux
> >>> +index 4f6d4c4a4d2..c50dd94a2da 100644
> >>> +--- a/libgcc/config/rs6000/t-linux
> >>> ++++ b/libgcc/config/rs6000/t-linux
> >>> +@@ -1,3 +1,6 @@
> >>> + SHLIB_MAPFILES +=3D $(srcdir)/config/rs6000/libgcc-glibc.ver
> >>> +
> >>> +-HOST_LIBGCC2_CFLAGS +=3D -mlong-double-128 -mno-minimal-toc
> >>> ++ifeq ($(with_ldbl128),yes)
> >>> ++HOST_LIBGCC2_CFLAGS +=3D -mlong-double-128
> >>> ++endif
> >>> ++HOST_LIBGCC2_CFLAGS +=3D -mno-minimal-toc
> >>> +diff --git a/libgcc/configure b/libgcc/configure
> >>> +old mode 100644
> >>> +new mode 100755
> >>> +index 45c459788c3..e2d19b144b8
> >>> +--- a/libgcc/configure
> >>> ++++ b/libgcc/configure
> >>> +@@ -618,6 +618,7 @@ build_vendor
> >>> + build_cpu
> >>> + build
> >>> + with_aix_soname
> >>> ++with_ldbl128
> >>> + enable_vtable_verify
> >>> + enable_shared
> >>> + libgcc_topdir
> >>> +@@ -667,6 +668,7 @@ with_cross_host
> >>> + with_ld
> >>> + enable_shared
> >>> + enable_vtable_verify
> >>> ++with_long_double_128
> >>> + with_aix_soname
> >>> + enable_version_specific_runtime_libs
> >>> + with_slibdir
> >>> +@@ -1324,6 +1326,7 @@ Optional Packages:
> >>> +   --with-target-subdir=3DSUBDIR      Configuring in a subdirectory =
for target
> >>> +   --with-cross-host=3DHOST           Configuring with a cross compi=
ler
> >>> +   --with-ld               arrange to use the specified ld (full pat=
hname)
> >>> ++  --with-long-double-128  use 128-bit long double by default
> >>> +   --with-aix-soname=3Daix|svr4|both
> >>> +                           shared library versioning (aka "SONAME") =
variant to
> >>> +                           provide on AIX
> >>> +@@ -2208,6 +2211,21 @@ fi
> >>> +
> >>> +
> >>> +
> >>> ++# Check whether --with-long-double-128 was given.
> >>> ++if test "${with_long_double_128+set}" =3D set; then :
> >>> ++  withval=3D$with_long_double_128; with_ldbl128=3D"$with_long_doubl=
e_128"
> >>> ++else
> >>> ++  case "${host}" in
> >>> ++ power*-*-musl*)
> >>> ++   with_ldbl128=3D"no";;
> >>> ++ *) with_ldbl128=3D"yes";;
> >>> ++ esac
> >>> ++
> >>> ++fi
> >>> ++
> >>> ++
> >>> ++
> >>> ++
> >>> + # Check whether --with-aix-soname was given.
> >>> + if test "${with_aix_soname+set}" =3D set; then :
> >>> +   withval=3D$with_aix_soname; case "${host}:${enable_shared}" in
> >>> +diff --git a/libgcc/configure.ac b/libgcc/configure.ac
> >>> +index af151473709..dada52416da 100644
> >>> +--- a/libgcc/configure.ac
> >>> ++++ b/libgcc/configure.ac
> >>> +@@ -77,6 +77,18 @@ AC_ARG_ENABLE(vtable-verify,
> >>> + [enable_vtable_verify=3Dno])
> >>> + AC_SUBST(enable_vtable_verify)
> >>> +
> >>> ++AC_ARG_WITH(long-double-128,
> >>> ++[AS_HELP_STRING([--with-long-double-128],
> >>> ++    [use 128-bit long double by default])],
> >>> ++      with_ldbl128=3D"$with_long_double_128",
> >>> ++[case "${host}" in
> >>> ++ power*-*-musl*)
> >>> ++   with_ldbl128=3D"no";;
> >>> ++ *) with_ldbl128=3D"yes";;
> >>> ++ esac
> >>> ++])
> >>> ++AC_SUBST(with_ldbl128)
> >>> ++
> >>> + AC_ARG_WITH(aix-soname,
> >>> + [AS_HELP_STRING([--with-aix-soname=3Daix|svr4|both],
> >>> +     [shared library versioning (aka "SONAME") variant to provide on=
 AIX])],
> >>> +--
> >>> +2.12.2
> >>> +
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.4/0045-Link-libgcc-using=
-LDFLAGS-not-just-SHLIB_LDFLAGS.patch b/meta/recipes-devtools/gcc/gcc-7.4/0=
045-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
> >>> new file mode 100644
> >>> index 0000000..3aa038c
> >>> --- /dev/null
> >>> +++ b/meta/recipes-devtools/gcc/gcc-7.4/0045-Link-libgcc-using-LDFLAG=
S-not-just-SHLIB_LDFLAGS.patch
> >>> @@ -0,0 +1,29 @@
> >>> +From 92beb883ab57a23a35ba76c496bc1f4cabb1690e Mon Sep 17 00:00:00 20=
01
> >>> +From: Khem Raj <raj.khem@gmail.com>
> >>> +Date: Wed, 4 May 2016 21:11:34 -0700
> >>> +Subject: [PATCH 45/47] Link libgcc using LDFLAGS, not just SHLIB_LDF=
LAGS
> >>> +
> >>> +Upstream-Status: Pending
> >>> +
> >>> +Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> >>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> +---
> >>> + libgcc/config/t-slibgcc | 2 +-
> >>> + 1 file changed, 1 insertion(+), 1 deletion(-)
> >>> +
> >>> +diff --git a/libgcc/config/t-slibgcc b/libgcc/config/t-slibgcc
> >>> +index 76be7710960..a1ee2ee26ed 100644
> >>> +--- a/libgcc/config/t-slibgcc
> >>> ++++ b/libgcc/config/t-slibgcc
> >>> +@@ -32,7 +32,7 @@ SHLIB_INSTALL_SOLINK =3D $(LN_S) $(SHLIB_SONAME) \
> >>> +       $(DESTDIR)$(slibdir)$(SHLIB_SLIBDIR_QUAL)/$(SHLIB_SOLINK)
> >>> +
> >>> + SHLIB_LINK =3D $(CC) $(LIBGCC2_CFLAGS) -shared -nodefaultlibs \
> >>> +-      $(SHLIB_LDFLAGS) \
> >>> ++      $(LDFLAGS) $(SHLIB_LDFLAGS) \
> >>> +       -o $(SHLIB_DIR)/$(SHLIB_SONAME).tmp @multilib_flags@ \
> >>> +       $(SHLIB_OBJS) $(SHLIB_LC) && \
> >>> +       rm -f $(SHLIB_DIR)/$(SHLIB_SOLINK) && \
> >>> +--
> >>> +2.12.2
> >>> +
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.4/0047-sync-gcc-stddef.h=
-with-musl.patch b/meta/recipes-devtools/gcc/gcc-7.4/0047-sync-gcc-stddef.h=
-with-musl.patch
> >>> new file mode 100644
> >>> index 0000000..65d22f1
> >>> --- /dev/null
> >>> +++ b/meta/recipes-devtools/gcc/gcc-7.4/0047-sync-gcc-stddef.h-with-m=
usl.patch
> >>> @@ -0,0 +1,91 @@
> >>> +From 9b951c8f6b0aaff7c16dc4db72b5e56ec73810bb Mon Sep 17 00:00:00 20=
01
> >>> +From: Khem Raj <raj.khem@gmail.com>
> >>> +Date: Fri, 3 Feb 2017 12:56:00 -0800
> >>> +Subject: [PATCH 47/47] sync gcc stddef.h with musl
> >>> +
> >>> +musl defines ptrdiff_t size_t and wchar_t
> >>> +so dont define them here if musl is definining them
> >>> +
> >>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> +---
> >>> +Upstream-Status: Inappropriate [OE-Specific]
> >>> +
> >>> + gcc/ginclude/stddef.h | 9 +++++++++
> >>> + 1 file changed, 9 insertions(+)
> >>> +
> >>> +diff --git a/gcc/ginclude/stddef.h b/gcc/ginclude/stddef.h
> >>> +index 872f451cac9..7e90938387c 100644
> >>> +--- a/gcc/ginclude/stddef.h
> >>> ++++ b/gcc/ginclude/stddef.h
> >>> +@@ -134,6 +134,7 @@ _TYPE_wchar_t;
> >>> + #ifndef ___int_ptrdiff_t_h
> >>> + #ifndef _GCC_PTRDIFF_T
> >>> + #ifndef _PTRDIFF_T_DECLARED /* DragonFly */
> >>> ++#ifndef __DEFINED_ptrdiff_t /* musl */
> >>> + #define _PTRDIFF_T
> >>> + #define _T_PTRDIFF_
> >>> + #define _T_PTRDIFF
> >>> +@@ -143,10 +144,12 @@ _TYPE_wchar_t;
> >>> + #define ___int_ptrdiff_t_h
> >>> + #define _GCC_PTRDIFF_T
> >>> + #define _PTRDIFF_T_DECLARED
> >>> ++#define __DEFINED_ptrdiff_t /* musl */
> >>> + #ifndef __PTRDIFF_TYPE__
> >>> + #define __PTRDIFF_TYPE__ long int
> >>> + #endif
> >>> + typedef __PTRDIFF_TYPE__ ptrdiff_t;
> >>> ++#endif /* __DEFINED_ptrdiff_t */
> >>> + #endif /* _PTRDIFF_T_DECLARED */
> >>> + #endif /* _GCC_PTRDIFF_T */
> >>> + #endif /* ___int_ptrdiff_t_h */
> >>> +@@ -184,6 +187,7 @@ typedef __PTRDIFF_TYPE__ ptrdiff_t;
> >>> + #ifndef _GCC_SIZE_T
> >>> + #ifndef _SIZET_
> >>> + #ifndef __size_t
> >>> ++#ifndef __DEFINED_size_t /* musl */
> >>> + #define __size_t__    /* BeOS */
> >>> + #define __SIZE_T__    /* Cray Unicos/Mk */
> >>> + #define _SIZE_T
> >>> +@@ -200,6 +204,7 @@ typedef __PTRDIFF_TYPE__ ptrdiff_t;
> >>> + #define ___int_size_t_h
> >>> + #define _GCC_SIZE_T
> >>> + #define _SIZET_
> >>> ++#define __DEFINED_size_t /* musl */
> >>> + #if (defined (__FreeBSD__) && (__FreeBSD__ >=3D 5)) \
> >>> +   || defined(__DragonFly__) \
> >>> +   || defined(__FreeBSD_kernel__)
> >>> +@@ -235,6 +240,7 @@ typedef long ssize_t;
> >>> + #endif /* _SIZE_T */
> >>> + #endif /* __SIZE_T__ */
> >>> + #endif /* __size_t__ */
> >>> ++#endif /* __DEFINED_size_t */
> >>> + #undef        __need_size_t
> >>> + #endif /* _STDDEF_H or __need_size_t.  */
> >>> +
> >>> +@@ -264,6 +270,7 @@ typedef long ssize_t;
> >>> + #ifndef ___int_wchar_t_h
> >>> + #ifndef __INT_WCHAR_T_H
> >>> + #ifndef _GCC_WCHAR_T
> >>> ++#ifndef __DEFINED_wchar_t /* musl */
> >>> + #define __wchar_t__   /* BeOS */
> >>> + #define __WCHAR_T__   /* Cray Unicos/Mk */
> >>> + #define _WCHAR_T
> >>> +@@ -279,6 +286,7 @@ typedef long ssize_t;
> >>> + #define __INT_WCHAR_T_H
> >>> + #define _GCC_WCHAR_T
> >>> + #define _WCHAR_T_DECLARED
> >>> ++#define __DEFINED_wchar_t /* musl */
> >>> +
> >>> + /* On BSD/386 1.1, at least, machine/ansi.h defines _BSD_WCHAR_T_
> >>> +    instead of _WCHAR_T_, and _BSD_RUNE_T_ (which, unlike the other
> >>> +@@ -344,6 +352,7 @@ typedef __WCHAR_TYPE__ wchar_t;
> >>> + #endif
> >>> + #endif /* __WCHAR_T__ */
> >>> + #endif /* __wchar_t__ */
> >>> ++#endif /* __DEFINED_wchar_t musl */
> >>> + #undef        __need_wchar_t
> >>> + #endif /* _STDDEF_H or __need_wchar_t.  */
> >>> +
> >>> +--
> >>> +2.12.2
> >>> +
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.4/0048-gcc-Enable-static=
-PIE.patch b/meta/recipes-devtools/gcc/gcc-7.4/0048-gcc-Enable-static-PIE.p=
atch
> >>> new file mode 100644
> >>> index 0000000..a96e913
> >>> --- /dev/null
> >>> +++ b/meta/recipes-devtools/gcc/gcc-7.4/0048-gcc-Enable-static-PIE.pa=
tch
> >>> @@ -0,0 +1,46 @@
> >>> +From 44ef80688b56beea85c0070840dea1e2a4e34aed Mon Sep 17 00:00:00 20=
01
> >>> +From: Khem Raj <raj.khem@gmail.com>
> >>> +Date: Tue, 13 Jun 2017 12:12:52 -0700
> >>> +Subject: [PATCH 49/49] gcc: Enable static PIE
> >>> +
> >>> +Static PIE support in GCC
> >>> +see
> >>> +https://gcc.gnu.org/ml/gcc/2015-06/msg00008.html
> >>> +
> >>> +startfiles before patch:
> >>> + -static -> crt1.o crti.o crtbeginT.o
> >>> + -static -PIE -> crt1.o crti.o crtbeginT.o
> >>> +
> >>> +after patch:
> >>> + -static -> crt1.o crti.o crtbeginT.o
> >>> + -static -PIE -> rcrt1.o crti.o crtbeginS.o
> >>> +
> >>> +Upstream-Status: Pending
> >>> +
> >>> +Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> >>> +
> >>> +---
> >>> + gcc/config/gnu-user.h | 6 +++---
> >>> + 1 file changed, 3 insertions(+), 3 deletions(-)
> >>> +
> >>> +diff --git a/gcc/config/gnu-user.h b/gcc/config/gnu-user.h
> >>> +index de605b0..b035bbe 100644
> >>> +--- a/gcc/config/gnu-user.h
> >>> ++++ b/gcc/config/gnu-user.h
> >>> +@@ -52,11 +52,11 @@ see the files COPYING3 and COPYING.RUNTIME respe=
ctively.  If not, see
> >>> + #define GNU_USER_TARGET_STARTFILE_SPEC \
> >>> +   "%{shared:; \
> >>> +      pg|p|profile:gcrt1.o%s; \
> >>> +-     static:crt1.o%s; \
> >>> ++     static: %{" PIE_SPEC ": rcrt1.o%s; :crt1.o%s}; \
> >>> +      " PIE_SPEC ":Scrt1.o%s; \
> >>> +      :crt1.o%s} \
> >>> +    crti.o%s \
> >>> +-   %{static:crtbeginT.o%s; \
> >>> ++   %{static: %{" PIE_SPEC ": crtbeginS.o%s; :crtbeginT.o%s}; \
> >>> +      shared|" PIE_SPEC ":crtbeginS.o%s; \
> >>> +      :crtbegin.o%s} \
> >>> +    %{fvtable-verify=3Dnone:%s; \
> >>> +
> >>> +2.13.1
> >>> +
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.4/fix-segmentation-fault=
-precompiled-hdr.patch b/meta/recipes-devtools/gcc/gcc-7.4/fix-segmentation=
-fault-precompiled-hdr.patch
> >>> new file mode 100644
> >>> index 0000000..c0adef6
> >>> --- /dev/null
> >>> +++ b/meta/recipes-devtools/gcc/gcc-7.4/fix-segmentation-fault-precom=
piled-hdr.patch
> >>> @@ -0,0 +1,49 @@
> >>> +
> >>> +Prevent a segmentation fault which occurs when using incorrect
> >>> +structure trying to access name of some named operators, such as
> >>> +CPP_NOT, CPP_AND etc. "token->val.node.spelling" cannot be used in
> >>> +those cases, as is may not be initialized at all.
> >>> +
> >>> +
> >>> +[YOCTO #11738]
> >>> +
> >>> +Upstream-Status: Pending
> >>> +
> >>> +Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> >>> +
> >>> +diff --git a/libcpp/lex.c b/libcpp/lex.c
> >>> +--- a/libcpp/lex.c
> >>> ++++ b/libcpp/lex.c
> >>> +@@ -3229,11 +3229,27 @@
> >>> +     spell_ident:
> >>> +     case SPELL_IDENT:
> >>> +       if (forstring)
> >>> +-      {
> >>> +-        memcpy (buffer, NODE_NAME (token->val.node.spelling),
> >>> +-                NODE_LEN (token->val.node.spelling));
> >>> +-        buffer +=3D NODE_LEN (token->val.node.spelling);
> >>> +-      }
> >>> ++        {
> >>> ++          if (token->type =3D=3D CPP_NAME)
> >>> ++            {
> >>> ++              memcpy (buffer, NODE_NAME (token->val.node.spelling),
> >>> ++                    NODE_LEN (token->val.node.spelling));
> >>> ++              buffer +=3D NODE_LEN (token->val.node.spelling);
> >>> ++              break;
> >>> ++            }
> >>> ++          /* NAMED_OP, cannot use node.spelling */
> >>> ++          if (token->flags & NAMED_OP)
> >>> ++            {
> >>> ++              const char *str =3D cpp_named_operator2name (token->t=
ype);
> >>> ++              if (str)
> >>> ++                {
> >>> ++                  size_t len =3D strlen(str);
> >>> ++                  memcpy(buffer, str, len);
> >>> ++                  buffer +=3D len;
> >>> ++                }
> >>> ++              break;
> >>> ++            }
> >>> ++        }
> >>> +       else
> >>> +       buffer =3D _cpp_spell_ident_ucns (buffer, token->val.node.nod=
e);
> >>> +       break;
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-7.4/no-sse-fix-test-case-f=
ailures.patch b/meta/recipes-devtools/gcc/gcc-7.4/no-sse-fix-test-case-fail=
ures.patch
> >>> new file mode 100644
> >>> index 0000000..cb87c5a
> >>> --- /dev/null
> >>> +++ b/meta/recipes-devtools/gcc/gcc-7.4/no-sse-fix-test-case-failures=
.patch
> >>> @@ -0,0 +1,259 @@
> >>> +From f22830da2ba64577deb6f717d05d86c03dd2e50d Mon Sep 17 00:00:00 20=
01
> >>> +From: RAGHUNATH LOLUR <raghunath.lolur@kpit.com>
> >>> +Date: Wed, 6 Dec 2017 22:52:26 -0800
> >>> +Subject: [PATCH] Fix for testsuite failure
> >>> +
> >>> +2017-11-16  Raghunath Lolur  <raghunath.lolur@kpit.com>
> >>> +
> >>> +       * gcc.dg/pr56275.c: If SSE is disabled, ensure that
> >>> +       "-mfpmath" is not set to use SSE. Set "-mfpmath=3D387".
> >>> +       * gcc.dg/pr68306.c: Likewise
> >>> +       * gcc.dg/pr68306-2.c: Likewise
> >>> +       * gcc.dg/pr68306-3.c: Likewise
> >>> +       * gcc.dg/pr69634.c: Likewise
> >>> +       * gcc.target/i386/amd64-abi-1.c: Likewise
> >>> +       * gcc.target/i386/funcspec-6.c: Likewise
> >>> +       * gcc.target/i386/interrupt-387-err-1.c: Likewise
> >>> +       * gcc.target/i386/isa-14.c: Likewise
> >>> +       * gcc.target/i386/pr44948-2b.c: Likewise
> >>> +       * gcc.target/i386/pr53425-1.c: Likewise
> >>> +       * gcc.target/i386/pr53425-2.c: Likewise
> >>> +       * gcc.target/i386/pr55247.c: Likewise
> >>> +       * gcc.target/i386/pr59644.c: Likewise
> >>> +       * gcc.target/i386/pr62120.c: Likewise
> >>> +       * gcc.target/i386/pr70467-1.c: Likewise
> >>> +       * gcc.target/i386/warn-vect-op-1.c: Likewise
> >>> +
> >>> +If -Wall, -Werror are used during compilation various test cases fai=
l
> >>> +to compile.
> >>> +
> >>> +If SSE is disabled, be sure to -mfpmath=3D387 to resolve this.
> >>> +
> >>> +This patch removes the changes to Changelog from the original patch.
> >>> +This will help us avoid conflicts.
> >>> +
> >>> +Upstream-Status: Pending
> >>> +
> >>> +Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> >>> +---
> >>> + gcc/testsuite/ChangeLog                   | 21 ++++++++++++++++++++=
+
> >>> + gcc/testsuite/gcc.dg/pr56275.c            |  2 +-
> >>> + gcc/testsuite/gcc.dg/pr68306-2.c          |  2 +-
> >>> + gcc/testsuite/gcc.dg/pr68306-3.c          |  2 +-
> >>> + gcc/testsuite/gcc.dg/pr68306.c            |  2 +-
> >>> + gcc/testsuite/gcc.dg/pr69634.c            |  2 +-
> >>> + .../gcc/testsuite/gcc.target/i386/amd64-abi-1.c     |  2 +-
> >>> + .../gcc/testsuite/gcc.target/i386/funcspec-6.c      |  1 +
> >>> + .../testsuite/gcc.target/i386/interrupt-387-err-1.c |  2 +-
> >>> + gcc/testsuite/gcc.target/i386/isa-14.c    |  2 +-
> >>> + .../gcc/testsuite/gcc.target/i386/pr44948-2b.c      |  2 +-
> >>> + gcc/testsuite/gcc.target/i386/pr53425-1.c |  2 +-
> >>> + gcc/testsuite/gcc.target/i386/pr53425-2.c |  2 +-
> >>> + gcc/testsuite/gcc.target/i386/pr55247.c   |  2 +-
> >>> + gcc/testsuite/gcc.target/i386/pr59644.c   |  2 +-
> >>> + gcc/testsuite/gcc.target/i386/pr62120.c   |  2 +-
> >>> + gcc/testsuite/gcc.target/i386/pr70467-1.c |  2 +-
> >>> + .../gcc/testsuite/gcc.target/i386/warn-vect-op-1.c  |  2 +-
> >>> + 18 files changed, 38 insertions(+), 16 deletions(-)
> >>> +
> >>> +diff --git a/gcc/testsuite/gcc.dg/pr56275.c b/gcc/testsuite/gcc.dg/p=
r56275.c
> >>> +index b901bb2..a4f6c95 100644
> >>> +--- a/gcc/testsuite/gcc.dg/pr56275.c
> >>> ++++ b/gcc/testsuite/gcc.dg/pr56275.c
> >>> +@@ -1,6 +1,6 @@
> >>> + /* { dg-do compile } */
> >>> + /* { dg-options "-O2" } */
> >>> +-/* { dg-additional-options "-mno-sse" { target { i?86-*-* x86_64-*-=
* } } } */
> >>> ++/* { dg-additional-options "-mno-sse -mfpmath=3D387" { target { i?8=
6-*-* x86_64-*-* } } } */
> >>> +
> >>> + typedef long long v2tw __attribute__ ((vector_size (2 * sizeof (lon=
g long))));
> >>> +
> >>> +diff --git a/gcc/testsuite/gcc.dg/pr68306-2.c b/gcc/testsuite/gcc.dg=
/pr68306-2.c
> >>> +index 4672ebe..2a368c4 100644
> >>> +--- a/gcc/testsuite/gcc.dg/pr68306-2.c
> >>> ++++ b/gcc/testsuite/gcc.dg/pr68306-2.c
> >>> +@@ -1,6 +1,6 @@
> >>> + /* { dg-do compile } */
> >>> + /* { dg-options "-O3" } */
> >>> +-/* { dg-additional-options "-mno-sse -mno-mmx" { target i?86-*-* x8=
6_64-*-* } } */
> >>> ++/* { dg-additional-options "-mno-sse -mno-mmx -mfpmath=3D387" { tar=
get i?86-*-* x86_64-*-* } } */
> >>> +
> >>> + struct {
> >>> +     int tz_minuteswest;
> >>> +diff --git a/gcc/testsuite/gcc.dg/pr68306-3.c b/gcc/testsuite/gcc.dg=
/pr68306-3.c
> >>> +index f5a8c10..df3390c 100644
> >>> +--- a/gcc/testsuite/gcc.dg/pr68306-3.c
> >>> ++++ b/gcc/testsuite/gcc.dg/pr68306-3.c
> >>> +@@ -1,6 +1,6 @@
> >>> + /* { dg-do compile } */
> >>> + /* { dg-options "-O3" } */
> >>> +-/* { dg-additional-options "-mno-sse -mno-mmx" { target i?86-*-* x8=
6_64-*-* } } */
> >>> ++/* { dg-additional-options "-mno-sse -mno-mmx -mfpmath=3D387" { tar=
get i?86-*-* x86_64-*-* } } */
> >>> + /* { dg-additional-options "-mno-altivec -mno-vsx" { target powerpc=
*-*-* } } */
> >>> +
> >>> + extern void fn2();
> >>> +diff --git a/gcc/testsuite/gcc.dg/pr68306.c b/gcc/testsuite/gcc.dg/p=
r68306.c
> >>> +index 54e5b40..0813389 100644
> >>> +--- a/gcc/testsuite/gcc.dg/pr68306.c
> >>> ++++ b/gcc/testsuite/gcc.dg/pr68306.c
> >>> +@@ -1,6 +1,6 @@
> >>> + /* { dg-do compile } */
> >>> + /* { dg-options "-O3" } */
> >>> +-/* { dg-additional-options "-mno-sse -mno-mmx" { target i?86-*-* x8=
6_64-*-* } } */
> >>> ++/* { dg-additional-options "-mno-sse -mno-mmx -mfpmath=3D387" { tar=
get i?86-*-* x86_64-*-* } } */
> >>> +
> >>> + enum powerpc_pmc_type { PPC_PMC_IBM };
> >>> + struct {
> >>> +diff --git a/gcc/testsuite/gcc.dg/pr69634.c b/gcc/testsuite/gcc.dg/p=
r69634.c
> >>> +index 60a5614..bcc23f9 100644
> >>> +--- a/gcc/testsuite/gcc.dg/pr69634.c
> >>> ++++ b/gcc/testsuite/gcc.dg/pr69634.c
> >>> +@@ -1,6 +1,6 @@
> >>> + /* { dg-do compile } */
> >>> + /* { dg-options "-O2 -fno-dce -fschedule-insns -fno-tree-vrp -fcomp=
are-debug -Wno-psabi" } */
> >>> +-/* { dg-additional-options "-mno-sse" { target i?86-*-* x86_64-*-* =
} } */
> >>> ++/* { dg-additional-options "-mno-sse -mfpmath=3D387" { target i?86-=
*-* x86_64-*-* } } */
> >>> + /* { dg-require-effective-target scheduling } */
> >>> +
> >>> + typedef unsigned short u16;
> >>> +diff --git a/gcc/testsuite/gcc.target/i386/amd64-abi-1.c b/gcc/tests=
uite/gcc.target/i386/amd64-abi-1.c
> >>> +index 69fde57..7f1f1c0 100644
> >>> +--- a/gcc/testsuite/gcc.target/i386/amd64-abi-1.c
> >>> ++++ b/gcc/testsuite/gcc.target/i386/amd64-abi-1.c
> >>> +@@ -1,5 +1,5 @@
> >>> + /* { dg-do compile { target { ! ia32 } } } */
> >>> +-/* { dg-options "-mno-sse" } */
> >>> ++/* { dg-options "-mno-sse -mfpmath=3D387" } */
> >>> + /* { dg-additional-options "-mabi=3Dsysv" { target *-*-mingw* } } *=
/
> >>> +
> >>> + double foo(void) { return 0; }        /* { dg-error "SSE disabled" =
} */
> >>> +diff --git a/gcc/testsuite/gcc.target/i386/funcspec-6.c b/gcc/testsu=
ite/gcc.target/i386/funcspec-6.c
> >>> +index ea896b7..bf15569 100644
> >>> +--- a/gcc/testsuite/gcc.target/i386/funcspec-6.c
> >>> ++++ b/gcc/testsuite/gcc.target/i386/funcspec-6.c
> >>> +@@ -1,6 +1,7 @@
> >>> + /* Test whether all of the 64-bit function specific options are acc=
epted
> >>> +    without error.  */
> >>> + /* { dg-do compile { target { ! ia32 } } } */
> >>> ++/* { dg-additional-options "-mfpmath=3D387" } */
> >>> +
> >>> + #include "funcspec-56.inc"
> >>> +
> >>> +diff --git a/gcc/testsuite/gcc.target/i386/interrupt-387-err-1.c b/g=
cc/testsuite/gcc.target/i386/interrupt-387-err-1.c
> >>> +index 3fbdc88..6b4d9d1 100644
> >>> +--- a/gcc/testsuite/gcc.target/i386/interrupt-387-err-1.c
> >>> ++++ b/gcc/testsuite/gcc.target/i386/interrupt-387-err-1.c
> >>> +@@ -1,5 +1,5 @@
> >>> + /* { dg-do compile } */
> >>> +-/* { dg-options "-O2 -mgeneral-regs-only -mno-cld -mno-iamcu -m8038=
7" } */
> >>> ++/* { dg-options "-O2 -mgeneral-regs-only -mno-cld -mno-iamcu -m8038=
7 -mfpmath=3D387" } */
> >>> +
> >>> + typedef unsigned int uword_t __attribute__ ((mode (__word__)));
> >>> +
> >>> +diff --git a/gcc/testsuite/gcc.target/i386/isa-14.c b/gcc/testsuite/=
gcc.target/i386/isa-14.c
> >>> +index 5d49e6e..1de2db9 100644
> >>> +--- a/gcc/testsuite/gcc.target/i386/isa-14.c
> >>> ++++ b/gcc/testsuite/gcc.target/i386/isa-14.c
> >>> +@@ -1,5 +1,5 @@
> >>> + /* { dg-do run } */
> >>> +-/* { dg-options "-march=3Dx86-64 -msse4a -mfma4 -mno-sse" } */
> >>> ++/* { dg-options "-march=3Dx86-64 -msse4a -mfma4 -mno-sse -mfpmath=
=3D387" } */
> >>> +
> >>> + extern void abort (void);
> >>> +
> >>> +diff --git a/gcc/testsuite/gcc.target/i386/pr44948-2b.c b/gcc/testsu=
ite/gcc.target/i386/pr44948-2b.c
> >>> +index fa1769b..f79fb12 100644
> >>> +--- a/gcc/testsuite/gcc.target/i386/pr44948-2b.c
> >>> ++++ b/gcc/testsuite/gcc.target/i386/pr44948-2b.c
> >>> +@@ -1,5 +1,5 @@
> >>> + /* { dg-do compile } */
> >>> +-/* { dg-options "-O -mno-sse -Wno-psabi -mtune=3Dgeneric" } */
> >>> ++/* { dg-options "-O -mno-sse -Wno-psabi -mtune=3Dgeneric -mfpmath=
=3D387" } */
> >>> +
> >>> + struct A
> >>> + {
> >>> +diff --git a/gcc/testsuite/gcc.target/i386/pr53425-1.c b/gcc/testsui=
te/gcc.target/i386/pr53425-1.c
> >>> +index 2e89ff7..6339bf6 100644
> >>> +--- a/gcc/testsuite/gcc.target/i386/pr53425-1.c
> >>> ++++ b/gcc/testsuite/gcc.target/i386/pr53425-1.c
> >>> +@@ -1,6 +1,6 @@
> >>> + /* PR target/53425 */
> >>> + /* { dg-do compile { target { ! ia32 } } } */
> >>> +-/* { dg-options "-O2 -mno-sse" } */
> >>> ++/* { dg-options "-O2 -mno-sse -mfpmath=3D387" } */
> >>> + /* { dg-skip-if "no SSE vector" { x86_64-*-mingw* } } */
> >>> +
> >>> + typedef double __v2df __attribute__ ((__vector_size__ (16)));
> >>> +diff --git a/gcc/testsuite/gcc.target/i386/pr53425-2.c b/gcc/testsui=
te/gcc.target/i386/pr53425-2.c
> >>> +index 61f6283..2c5a55f 100644
> >>> +--- a/gcc/testsuite/gcc.target/i386/pr53425-2.c
> >>> ++++ b/gcc/testsuite/gcc.target/i386/pr53425-2.c
> >>> +@@ -1,6 +1,6 @@
> >>> + /* PR target/53425 */
> >>> + /* { dg-do compile { target { ! ia32 } } } */
> >>> +-/* { dg-options "-O2 -mno-sse" } */
> >>> ++/* { dg-options "-O2 -mno-sse -mfpmath=3D387" } */
> >>> + /* { dg-skip-if "no SSE vector" { x86_64-*-mingw* } } */
> >>> +
> >>> + typedef float __v2sf __attribute__ ((__vector_size__ (8)));
> >>> +diff --git a/gcc/testsuite/gcc.target/i386/pr55247.c b/gcc/testsuite=
/gcc.target/i386/pr55247.c
> >>> +index 23366d0..9810e3a 100644
> >>> +--- a/gcc/testsuite/gcc.target/i386/pr55247.c
> >>> ++++ b/gcc/testsuite/gcc.target/i386/pr55247.c
> >>> +@@ -1,6 +1,6 @@
> >>> + /* { dg-do compile { target { ! ia32 } } } */
> >>> + /* { dg-require-effective-target maybe_x32 } */
> >>> +-/* { dg-options "-O2 -mno-sse -mno-mmx -mx32 -maddress-mode=3Dlong"=
 } */
> >>> ++/* { dg-options "-O2 -mno-sse -mno-mmx -mx32 -maddress-mode=3Dlong =
-mfpmath=3D387" } */
> >>> +
> >>> + typedef unsigned int uint32_t;
> >>> + typedef uint32_t Elf32_Word;
> >>> +diff --git a/gcc/testsuite/gcc.target/i386/pr59644.c b/gcc/testsuite=
/gcc.target/i386/pr59644.c
> >>> +index 96006b3..4287e45 100644
> >>> +--- a/gcc/testsuite/gcc.target/i386/pr59644.c
> >>> ++++ b/gcc/testsuite/gcc.target/i386/pr59644.c
> >>> +@@ -1,6 +1,6 @@
> >>> + /* PR target/59644 */
> >>> + /* { dg-do run { target lp64 } } */
> >>> +-/* { dg-options "-O2 -ffreestanding -mno-sse -mpreferred-stack-boun=
dary=3D3 -maccumulate-outgoing-args -mno-red-zone" } */
> >>> ++/* { dg-options "-O2 -ffreestanding -mno-sse -mpreferred-stack-boun=
dary=3D3 -maccumulate-outgoing-args -mno-red-zone -mfpmath=3D387" } */
> >>> +
> >>> + /* This test uses __builtin_trap () instead of e.g. abort,
> >>> +    because due to -mpreferred-stack-boundary=3D3 it should not call
> >>> +diff --git a/gcc/testsuite/gcc.target/i386/pr62120.c b/gcc/testsuite=
/gcc.target/i386/pr62120.c
> >>> +index bfb8c47..ed04cf1 100644
> >>> +--- a/gcc/testsuite/gcc.target/i386/pr62120.c
> >>> ++++ b/gcc/testsuite/gcc.target/i386/pr62120.c
> >>> +@@ -1,5 +1,5 @@
> >>> + /* { dg-do compile } */
> >>> +-/* { dg-options "-mno-sse" } */
> >>> ++/* { dg-options "-mno-sse -mfpmath=3D387" } */
> >>> +
> >>> + void foo ()
> >>> + {
> >>> +diff --git a/gcc/testsuite/gcc.target/i386/pr70467-1.c b/gcc/testsui=
te/gcc.target/i386/pr70467-1.c
> >>> +index 4e112c8..bcfb396 100644
> >>> +--- a/gcc/testsuite/gcc.target/i386/pr70467-1.c
> >>> ++++ b/gcc/testsuite/gcc.target/i386/pr70467-1.c
> >>> +@@ -1,6 +1,6 @@
> >>> + /* PR rtl-optimization/70467 */
> >>> + /* { dg-do compile } */
> >>> +-/* { dg-options "-O2 -mno-sse" } */
> >>> ++/* { dg-options "-O2 -mno-sse -mfpmath=3D387" } */
> >>> +
> >>> + void foo (unsigned long long *);
> >>> +
> >>> +diff --git a/gcc/testsuite/gcc.target/i386/warn-vect-op-1.c b/gcc/te=
stsuite/gcc.target/i386/warn-vect-op-1.c
> >>> +index 6cda153..26e37f5 100644
> >>> +--- a/gcc/testsuite/gcc.target/i386/warn-vect-op-1.c
> >>> ++++ b/gcc/testsuite/gcc.target/i386/warn-vect-op-1.c
> >>> +@@ -1,5 +1,5 @@
> >>> + /* { dg-do compile { target { ! ia32 } } }  */
> >>> +-/* { dg-options "-mno-sse -Wvector-operation-performance" }  */
> >>> ++/* { dg-options "-mno-sse -Wvector-operation-performance -mfpmath=
=3D387" }  */
> >>> + #define vector(elcount, type)  \
> >>> + __attribute__((vector_size((elcount)*sizeof(type)))) type
> >>> +
> >>> +--
> >>> +1.8.5.6
> >>> +
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_7.3.bb b/me=
ta/recipes-devtools/gcc/gcc-cross-canadian_7.3.bb
> >>> deleted file mode 100644
> >>> index bf53c5c..0000000
> >>> --- a/meta/recipes-devtools/gcc/gcc-cross-canadian_7.3.bb
> >>> +++ /dev/null
> >>> @@ -1,5 +0,0 @@
> >>> -require recipes-devtools/gcc/gcc-${PV}.inc
> >>> -require gcc-cross-canadian.inc
> >>> -
> >>> -
> >>> -
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_7.4.bb b/me=
ta/recipes-devtools/gcc/gcc-cross-canadian_7.4.bb
> >>> new file mode 100644
> >>> index 0000000..bf53c5c
> >>> --- /dev/null
> >>> +++ b/meta/recipes-devtools/gcc/gcc-cross-canadian_7.4.bb
> >>> @@ -0,0 +1,5 @@
> >>> +require recipes-devtools/gcc/gcc-${PV}.inc
> >>> +require gcc-cross-canadian.inc
> >>> +
> >>> +
> >>> +
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial_7.3.bb b/met=
a/recipes-devtools/gcc/gcc-cross-initial_7.3.bb
> >>> deleted file mode 100644
> >>> index 4c73e5c..0000000
> >>> --- a/meta/recipes-devtools/gcc/gcc-cross-initial_7.3.bb
> >>> +++ /dev/null
> >>> @@ -1,2 +0,0 @@
> >>> -require recipes-devtools/gcc/gcc-cross_${PV}.bb
> >>> -require gcc-cross-initial.inc
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial_7.4.bb b/met=
a/recipes-devtools/gcc/gcc-cross-initial_7.4.bb
> >>> new file mode 100644
> >>> index 0000000..4c73e5c
> >>> --- /dev/null
> >>> +++ b/meta/recipes-devtools/gcc/gcc-cross-initial_7.4.bb
> >>> @@ -0,0 +1,2 @@
> >>> +require recipes-devtools/gcc/gcc-cross_${PV}.bb
> >>> +require gcc-cross-initial.inc
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-cross_7.3.bb b/meta/recipe=
s-devtools/gcc/gcc-cross_7.3.bb
> >>> deleted file mode 100644
> >>> index b43cca0..0000000
> >>> --- a/meta/recipes-devtools/gcc/gcc-cross_7.3.bb
> >>> +++ /dev/null
> >>> @@ -1,3 +0,0 @@
> >>> -require recipes-devtools/gcc/gcc-${PV}.inc
> >>> -require gcc-cross.inc
> >>> -
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-cross_7.4.bb b/meta/recipe=
s-devtools/gcc/gcc-cross_7.4.bb
> >>> new file mode 100644
> >>> index 0000000..b43cca0
> >>> --- /dev/null
> >>> +++ b/meta/recipes-devtools/gcc/gcc-cross_7.4.bb
> >>> @@ -0,0 +1,3 @@
> >>> +require recipes-devtools/gcc/gcc-${PV}.inc
> >>> +require gcc-cross.inc
> >>> +
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk-initial_7.3.bb b/=
meta/recipes-devtools/gcc/gcc-crosssdk-initial_7.3.bb
> >>> deleted file mode 100644
> >>> index fd90e11..0000000
> >>> --- a/meta/recipes-devtools/gcc/gcc-crosssdk-initial_7.3.bb
> >>> +++ /dev/null
> >>> @@ -1,3 +0,0 @@
> >>> -require recipes-devtools/gcc/gcc-cross-initial_${PV}.bb
> >>> -require gcc-crosssdk-initial.inc
> >>> -
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk-initial_7.4.bb b/=
meta/recipes-devtools/gcc/gcc-crosssdk-initial_7.4.bb
> >>> new file mode 100644
> >>> index 0000000..fd90e11
> >>> --- /dev/null
> >>> +++ b/meta/recipes-devtools/gcc/gcc-crosssdk-initial_7.4.bb
> >>> @@ -0,0 +1,3 @@
> >>> +require recipes-devtools/gcc/gcc-cross-initial_${PV}.bb
> >>> +require gcc-crosssdk-initial.inc
> >>> +
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_7.3.bb b/meta/rec=
ipes-devtools/gcc/gcc-crosssdk_7.3.bb
> >>> deleted file mode 100644
> >>> index 40a6c4f..0000000
> >>> --- a/meta/recipes-devtools/gcc/gcc-crosssdk_7.3.bb
> >>> +++ /dev/null
> >>> @@ -1,2 +0,0 @@
> >>> -require recipes-devtools/gcc/gcc-cross_${PV}.bb
> >>> -require gcc-crosssdk.inc
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_7.4.bb b/meta/rec=
ipes-devtools/gcc/gcc-crosssdk_7.4.bb
> >>> new file mode 100644
> >>> index 0000000..40a6c4f
> >>> --- /dev/null
> >>> +++ b/meta/recipes-devtools/gcc/gcc-crosssdk_7.4.bb
> >>> @@ -0,0 +1,2 @@
> >>> +require recipes-devtools/gcc/gcc-cross_${PV}.bb
> >>> +require gcc-crosssdk.inc
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-runtime_7.3.bb b/meta/reci=
pes-devtools/gcc/gcc-runtime_7.3.bb
> >>> deleted file mode 100644
> >>> index 8f31e77..0000000
> >>> --- a/meta/recipes-devtools/gcc/gcc-runtime_7.3.bb
> >>> +++ /dev/null
> >>> @@ -1,7 +0,0 @@
> >>> -require recipes-devtools/gcc/gcc-${PV}.inc
> >>> -require gcc-runtime.inc
> >>> -
> >>> -FILES_libgomp-dev +=3D "\
> >>> -    ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/openacc.h \
> >>> -"
> >>> -
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-runtime_7.4.bb b/meta/reci=
pes-devtools/gcc/gcc-runtime_7.4.bb
> >>> new file mode 100644
> >>> index 0000000..8f31e77
> >>> --- /dev/null
> >>> +++ b/meta/recipes-devtools/gcc/gcc-runtime_7.4.bb
> >>> @@ -0,0 +1,7 @@
> >>> +require recipes-devtools/gcc/gcc-${PV}.inc
> >>> +require gcc-runtime.inc
> >>> +
> >>> +FILES_libgomp-dev +=3D "\
> >>> +    ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/openacc.h \
> >>> +"
> >>> +
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_7.3.bb b/meta/r=
ecipes-devtools/gcc/gcc-sanitizers_7.3.bb
> >>> deleted file mode 100644
> >>> index 601f666..0000000
> >>> --- a/meta/recipes-devtools/gcc/gcc-sanitizers_7.3.bb
> >>> +++ /dev/null
> >>> @@ -1,2 +0,0 @@
> >>> -require recipes-devtools/gcc/gcc-${PV}.inc
> >>> -require gcc-sanitizers.inc
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_7.4.bb b/meta/r=
ecipes-devtools/gcc/gcc-sanitizers_7.4.bb
> >>> new file mode 100644
> >>> index 0000000..601f666
> >>> --- /dev/null
> >>> +++ b/meta/recipes-devtools/gcc/gcc-sanitizers_7.4.bb
> >>> @@ -0,0 +1,2 @@
> >>> +require recipes-devtools/gcc/gcc-${PV}.inc
> >>> +require gcc-sanitizers.inc
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-source_7.3.bb b/meta/recip=
es-devtools/gcc/gcc-source_7.3.bb
> >>> deleted file mode 100644
> >>> index b890fa3..0000000
> >>> --- a/meta/recipes-devtools/gcc/gcc-source_7.3.bb
> >>> +++ /dev/null
> >>> @@ -1,4 +0,0 @@
> >>> -require recipes-devtools/gcc/gcc-${PV}.inc
> >>> -require recipes-devtools/gcc/gcc-source.inc
> >>> -
> >>> -EXCLUDE_FROM_WORLD =3D "1"
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-source_7.4.bb b/meta/recip=
es-devtools/gcc/gcc-source_7.4.bb
> >>> new file mode 100644
> >>> index 0000000..b890fa3
> >>> --- /dev/null
> >>> +++ b/meta/recipes-devtools/gcc/gcc-source_7.4.bb
> >>> @@ -0,0 +1,4 @@
> >>> +require recipes-devtools/gcc/gcc-${PV}.inc
> >>> +require recipes-devtools/gcc/gcc-source.inc
> >>> +
> >>> +EXCLUDE_FROM_WORLD =3D "1"
> >>> diff --git a/meta/recipes-devtools/gcc/gcc_7.3.bb b/meta/recipes-devt=
ools/gcc/gcc_7.3.bb
> >>> deleted file mode 100644
> >>> index ab208e7..0000000
> >>> --- a/meta/recipes-devtools/gcc/gcc_7.3.bb
> >>> +++ /dev/null
> >>> @@ -1,10 +0,0 @@
> >>> -require recipes-devtools/gcc/gcc-${PV}.inc
> >>> -require gcc-target.inc
> >>> -
> >>> -# Building with thumb enabled on armv4t armv5t fails with
> >>> -# | gcc-4.8.1-r0/gcc-4.8.1/gcc/cp/decl.c:7438:(.text.unlikely+0x2fa)=
: relocation truncated to fit: R_ARM_THM_CALL against symbol `fancy_abort(c=
har const*, int, char const*)' defined in .glue_7 section in linker stubs
> >>> -# | gcc-4.8.1-r0/gcc-4.8.1/gcc/cp/decl.c:7442:(.text.unlikely+0x318)=
: additional relocation overflows omitted from the output
> >>> -ARM_INSTRUCTION_SET_armv4 =3D "arm"
> >>> -ARM_INSTRUCTION_SET_armv5 =3D "arm"
> >>> -
> >>> -BBCLASSEXTEND =3D "nativesdk"
> >>> diff --git a/meta/recipes-devtools/gcc/gcc_7.4.bb b/meta/recipes-devt=
ools/gcc/gcc_7.4.bb
> >>> new file mode 100644
> >>> index 0000000..ab208e7
> >>> --- /dev/null
> >>> +++ b/meta/recipes-devtools/gcc/gcc_7.4.bb
> >>> @@ -0,0 +1,10 @@
> >>> +require recipes-devtools/gcc/gcc-${PV}.inc
> >>> +require gcc-target.inc
> >>> +
> >>> +# Building with thumb enabled on armv4t armv5t fails with
> >>> +# | gcc-4.8.1-r0/gcc-4.8.1/gcc/cp/decl.c:7438:(.text.unlikely+0x2fa)=
: relocation truncated to fit: R_ARM_THM_CALL against symbol `fancy_abort(c=
har const*, int, char const*)' defined in .glue_7 section in linker stubs
> >>> +# | gcc-4.8.1-r0/gcc-4.8.1/gcc/cp/decl.c:7442:(.text.unlikely+0x318)=
: additional relocation overflows omitted from the output
> >>> +ARM_INSTRUCTION_SET_armv4 =3D "arm"
> >>> +ARM_INSTRUCTION_SET_armv5 =3D "arm"
> >>> +
> >>> +BBCLASSEXTEND =3D "nativesdk"
> >>> diff --git a/meta/recipes-devtools/gcc/libgcc-initial_7.3.bb b/meta/r=
ecipes-devtools/gcc/libgcc-initial_7.3.bb
> >>> deleted file mode 100644
> >>> index 19f253f..0000000
> >>> --- a/meta/recipes-devtools/gcc/libgcc-initial_7.3.bb
> >>> +++ /dev/null
> >>> @@ -1,2 +0,0 @@
> >>> -require recipes-devtools/gcc/gcc-${PV}.inc
> >>> -require libgcc-initial.inc
> >>> diff --git a/meta/recipes-devtools/gcc/libgcc-initial_7.4.bb b/meta/r=
ecipes-devtools/gcc/libgcc-initial_7.4.bb
> >>> new file mode 100644
> >>> index 0000000..19f253f
> >>> --- /dev/null
> >>> +++ b/meta/recipes-devtools/gcc/libgcc-initial_7.4.bb
> >>> @@ -0,0 +1,2 @@
> >>> +require recipes-devtools/gcc/gcc-${PV}.inc
> >>> +require libgcc-initial.inc
> >>> diff --git a/meta/recipes-devtools/gcc/libgcc_7.3.bb b/meta/recipes-d=
evtools/gcc/libgcc_7.3.bb
> >>> deleted file mode 100644
> >>> index a5152f2..0000000
> >>> --- a/meta/recipes-devtools/gcc/libgcc_7.3.bb
> >>> +++ /dev/null
> >>> @@ -1,2 +0,0 @@
> >>> -require recipes-devtools/gcc/gcc-${PV}.inc
> >>> -require libgcc.inc
> >>> diff --git a/meta/recipes-devtools/gcc/libgcc_7.4.bb b/meta/recipes-d=
evtools/gcc/libgcc_7.4.bb
> >>> new file mode 100644
> >>> index 0000000..a5152f2
> >>> --- /dev/null
> >>> +++ b/meta/recipes-devtools/gcc/libgcc_7.4.bb
> >>> @@ -0,0 +1,2 @@
> >>> +require recipes-devtools/gcc/gcc-${PV}.inc
> >>> +require libgcc.inc
> >>> diff --git a/meta/recipes-devtools/gcc/libgfortran_7.3.bb b/meta/reci=
pes-devtools/gcc/libgfortran_7.3.bb
> >>> deleted file mode 100644
> >>> index 71dd8b4..0000000
> >>> --- a/meta/recipes-devtools/gcc/libgfortran_7.3.bb
> >>> +++ /dev/null
> >>> @@ -1,3 +0,0 @@
> >>> -require recipes-devtools/gcc/gcc-${PV}.inc
> >>> -require libgfortran.inc
> >>> -
> >>> diff --git a/meta/recipes-devtools/gcc/libgfortran_7.4.bb b/meta/reci=
pes-devtools/gcc/libgfortran_7.4.bb
> >>> new file mode 100644
> >>> index 0000000..71dd8b4
> >>> --- /dev/null
> >>> +++ b/meta/recipes-devtools/gcc/libgfortran_7.4.bb
> >>> @@ -0,0 +1,3 @@
> >>> +require recipes-devtools/gcc/gcc-${PV}.inc
> >>> +require libgfortran.inc
> >>> +
> >>> --
> >>> 1.9.1
> >>>
> >>> --
> >>> _______________________________________________
> >>> Openembedded-core mailing list
> >>> Openembedded-core@lists.openembedded.org
> >>> http://lists.openembedded.org/mailman/listinfo/openembedded-core=

