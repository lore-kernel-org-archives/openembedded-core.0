Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.142.1594831481626096435
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2020 09:44:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 140.211.169.56, mailfrom: auh@auh.yoctoproject.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7CF76E01EA9; Wed, 15 Jul 2020 09:44:41 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_00,HELO_MISC_IP,
	MISSING_DATE,MISSING_MID,RDNS_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.5 MISSING_MID Missing Message-Id: header
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
	*  1.4 MISSING_DATE Missing Date: header
	*  0.2 HELO_MISC_IP Looking for more Dynamic IP Relays
Received: from [172.29.10.111] (unknown [198.145.29.2])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 58D0DE01EE6
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2020 09:43:03 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mpfr: upgrading to 4.1.0 SUCCEEDED
Message-Id: <20200715164441.7CF76E01EA9@yocto-www.yoctoproject.org>
Date: Wed, 15 Jul 2020 09:44:41 -0700 (PDT)
X-Groupsio-MsgNum: 140686
Content-Type: multipart/mixed; boundary="===============8948841361372591226=="

--===============8948841361372591226==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mpfr* to *4.1.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mpfr-upgrade-4.0.2-4.1.0.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============8948841361372591226==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/mpfr: PV changed from "4.0.2" to "4.1.0"
packages/core2-32-poky-linux/mpfr: PKGV changed from 4.0.2 [default] to 4.1.0 [default]
packages/core2-32-poky-linux/mpfr/mpfr-dbg: PV changed from "4.0.2" to "4.1.0"
packages/core2-32-poky-linux/mpfr/mpfr-dbg: FILELIST: removed "/usr/lib/.debug/libmpfr.so.6.0.2", added "/usr/lib/.debug/libmpfr.so.6.1.0"
packages/core2-32-poky-linux/mpfr/mpfr-dbg: PKGSIZE changed from 2298588 to 2827444 (+23%)
packages/core2-32-poky-linux/mpfr/mpfr-dbg: PKGV changed from 4.0.2 [default] to 4.1.0 [default]
packages/core2-32-poky-linux/mpfr/mpfr-dev: PV changed from "4.0.2" to "4.1.0"
packages/core2-32-poky-linux/mpfr/mpfr-dev: PKGSIZE changed from 58475 to 59596 (+2%)
packages/core2-32-poky-linux/mpfr/mpfr-dev: PKGV changed from 4.0.2 [default] to 4.1.0 [default]
packages/core2-32-poky-linux/mpfr/mpfr-doc: PV changed from "4.0.2" to "4.1.0"
packages/core2-32-poky-linux/mpfr/mpfr-doc: FILELIST: added "/usr/share/doc/mpfr/examples/threads.c"
packages/core2-32-poky-linux/mpfr/mpfr-doc: PKGSIZE changed from 402154 to 145656 (-64%)
packages/core2-32-poky-linux/mpfr/mpfr-doc: PKGV changed from 4.0.2 [default] to 4.1.0 [default]
packages/core2-32-poky-linux/mpfr/mpfr-locale: PV changed from "4.0.2" to "4.1.0"
packages/core2-32-poky-linux/mpfr/mpfr-locale: PKGV changed from 4.0.2 [default] to 4.1.0 [default]
packages/core2-32-poky-linux/mpfr/mpfr-src: PV changed from "4.0.2" to "4.1.0"
packages/core2-32-poky-linux/mpfr/mpfr-src: FILELIST: removed "/usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/pow_si.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/check.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/isnum.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/get_z_exp.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/acosh.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/cbrt.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/erandom.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/strtofr.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/eq.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/swap.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/inits2.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/get_sj.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/set_ui_2exp.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/atan2.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/mpfr-intmax.h /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/set_sj.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/get_ld.c /usr/src/debug/mpfr/4.0
 .2-r0/mpfr-4.0.2/src/get_flt.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/random_deviate.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/set_f.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/set_si.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/ui_sub.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/lngamma.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/si_op.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/init2.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/set.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/log2.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/set_str.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/extract.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/get_d.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/fpif.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/fits_s.h /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/copysign.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/atanh.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/buildopt.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/rint.c /us
 r/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/inp_str.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/vasprintf.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/div_ui.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/odd_p.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/gmp_op.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/out_str.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/set_si_2exp.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/nrandom.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/sinh.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/ui_div.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/urandomb.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/exp.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/round_raw_generic.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/add.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/cmp.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/frexp.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/round_prec.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/log1p.c /usr/src/debug/mpfr/4.0.
 2-r0/mpfr-4.0.2/src/mul_d.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/mpfr-impl.h /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/clear.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/const_log2.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/cmp_si.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/frac.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/printf.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/uceil_log2.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/yn.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/set_inf.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/erfc.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/neg.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/expm1.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/dump.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/mul_2si.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/rndna.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/set_zero.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/isqrt.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/erf.c /usr/src/deb
 ug/mpfr/4.0.2-r0/mpfr-4.0.2/src/get_uj.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/isnan.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/bernoulli.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/agm.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/atan.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/dim.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/sqr.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/set_rnd.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/inits.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/set_uj.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/sinh_cosh.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/sub_ui.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/subnormal.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/add1.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/set_exp.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/rec_sqrt.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/comparisons.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/minmax.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/
 ufloor_log2.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/print_raw.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/cache.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/get_str.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/get_z.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/isinteger.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/sqrt_ui.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/iszero.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/mpfr-gmp.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/pow_z.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/exceptions.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/set_q.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/mul_2exp.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/exp3.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/acos.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/get_patches.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/asin.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/round_p.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/sin_cos.c /usr/src
 /debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/d_div.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/jn.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/tanh.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/cmp_ui.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/setsign.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/fits_u.h /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/uceil_exp2.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/root.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/abort_prec_max.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/div_2si.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/div_2exp.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/gamma_inc.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/init.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/mul.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/mul_ui.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/d_sub.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/cmp_ld.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/const_euler.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-
 4.0.2/src/random_deviate.h /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/constant.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/next.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/set_d64.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/set_ld.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/tan.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/gamma.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/const_pi.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/free_cache.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/gammaonethird.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/scale2.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/factorial.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/exp10.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/set_float128.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/exp2.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/pool.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/stack_interface.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/const_catalan.c /usr/src/debug/mpfr/4.0.2-r0/mp
 fr-4.0.2/src/get_si.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/sgn.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/get_exp.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/log10.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/grandom.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/clears.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/ubf.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/log_ui.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/set_dfl_prec.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/get_d64.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/urandom.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/sum.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/set_ui.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/add_d.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/li2.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/pow_ui.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/ai.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/cmp2.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/add1sp.c /usr/src/debug/mpfr/4.0
 .2-r0/mpfr-4.0.2/src/cmp_d.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/zeta_ui.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/powerof2.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/sub1.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/get_q.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/eint.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/hypot.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/mpfr-gmp.h /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/get_f.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/reldiff.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/sub1sp.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/gen_inverse.h /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/sin.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/jyn_asympt.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/fms.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/digamma.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/set_d.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/cmp_abs.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/sub.c /usr/s
 rc/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/get_ui.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/set_z.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/exp_2.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/beta.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/set_prec.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/setmin.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/div_2ui.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/mpfr.h /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/zeta.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/div.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/modf.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/get_float128.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/asinh.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/fma.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/int_ceil_log2.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/mul_2ui.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/set_nan.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/fmma.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/sr
 c/min_prec.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/setmax.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/cos.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/set_z_exp.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/pow.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/version.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/set_str_raw.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/div_d.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/ui_pow.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/isregular.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/add_ui.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/set_flt.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/mulders.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/mpn_exp.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/sqrt.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/print_rnd_mode.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/isinf.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/rem1.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/signbit.c /usr/src/d
 ebug/mpfr/4.0.2-r0/mpfr-4.0.2/src/fits_intmax.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/sub_d.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/ui_pow_ui.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/set_prc_raw.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/round_near_x.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/cosh.c /usr/src/debug/mpfr/4.0.2-r0/mpfr-4.0.2/src/log.c", added "/usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/uceil_exp2.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/get_si.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/init.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/rint.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/set_z.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/fma.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/exp2.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/yn.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/swap.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/get_sj.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/sub1.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1
 .0/src/free_cache.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/rem1.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/cmp_si.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/setmax.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/abort_prec_max.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/set_ui.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/li2.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/asinh.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/round_prec.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/set_nan.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/exp10.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/printf.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/ui_pow_ui.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/get_ui.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/mpfr-impl.h /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/bernoulli.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/get_q.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/ui_sub.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/si_op.c /u
 sr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/get_d.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/copysign.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/fmma.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/cache.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/get_f.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/scale2.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/pow_ui.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/set_ui_2exp.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/sqr.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/exp_2.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/asin.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/const_euler.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/setmin.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/get_exp.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/add.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/jyn_asympt.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/comparisons.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/sub1sp.c /usr/src/debug/mpfr/4.1.0-r0/
 mpfr-4.1.0/src/odd_p.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/mpfr.h /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/jn.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/factorial.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/set_si.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/cmp.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/cos.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/div_2exp.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/gmp_op.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/div_2ui.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/digamma.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/add_ui.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/isnan.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/log1p.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/get_d64.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/set_d128.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/lngamma.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/set_d.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/sqrt_ui.c /usr/src/debug/
 mpfr/4.1.0-r0/mpfr-4.1.0/src/clear.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/const_pi.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/round_raw_generic.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/cbrt.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/d_sub.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/log.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/set_rnd.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/mpfr-intmax.h /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/sgn.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/fits_u.h /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/check.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/log2.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/uceil_log2.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/eq.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/isnum.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/sub_ui.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/set.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/set_sj.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/isze
 ro.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/set_exp.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/mpfr-gmp.h /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/urandomb.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/acosh.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/out_str.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/gen_inverse.h /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/subnormal.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/get_str.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/vasprintf.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/zeta.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/frexp.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/powerof2.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/pow_z.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/d_div.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/mul_d.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/erf.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/cmp_ui.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/set_flt.c /usr/src/debug/mpfr
 /4.1.0-r0/mpfr-4.1.0/src/set_d64.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/dot.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/minmax.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/atan.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/set_zero.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/ui_div.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/set_ld.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/atanh.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/div.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/strtofr.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/sum.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/buildopt.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/erfc.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/isinf.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/root.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/exp.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/fits_intmax.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/cmp2.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/const_catalan.c /usr/
 src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/signbit.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/exp3.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/inits2.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/rec_sqrt.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/fms.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/get_float128.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/version.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/extract.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/set_si_2exp.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/const_log2.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/dump.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/fits_s.h /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/round_p.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/mul_ui.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/add1.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/log_ui.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/set_inf.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/modf.c /usr/src/debug/mpfr/4.1.0-r0/
 mpfr-4.1.0/src/atan2.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/urandom.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/get_flt.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/mul_2si.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/eint.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/log10.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/hypot.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/cosh.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/isqrt.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/random_deviate.h /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/set_uj.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/cmp_d.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/fpif.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/grandom.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/zeta_ui.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/cmpabs.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/isinteger.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/agm.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/set_z_exp.c /usr/s
 rc/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/isregular.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/ufloor_log2.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/inits.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/sinh.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/stack_interface.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/gamma_inc.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/ieee_floats.h /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/init2.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/neg.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/reldiff.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/set_f.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/set_prec.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/sqrt.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/get_z_exp.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/nrandom.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/rndna.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/mul_2exp.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/mpfr-gmp.c /usr/src/debug/m
 pfr/4.1.0-r0/mpfr-4.1.0/src/cmpabs_ui.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/add1sp.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/inp_str.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/ubf.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/mul_2ui.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/sinh_cosh.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/cmp_ld.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/get_uj.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/setsign.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/mul.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/mulders.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/ui_pow.c /usr/src/debug/mpfr/4.1.0-r0/build/src/get_patches.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/mpn_exp.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/pool.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/acos.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/round_near_x.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/sub_d.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/t
 otal_order.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/pow.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/sin_cos.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/sin.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/set_dfl_prec.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/exceptions.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/set_str.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/print_raw.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/get_z.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/dim.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/get_ld.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/next.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/tan.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/erandom.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/frac.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/nbits_ulong.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/random_deviate.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/sub.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/gammaonethird.c /usr/s
 rc/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/beta.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/constant.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/set_str_raw.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/tanh.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/add_d.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/int_ceil_log2.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/div_ui.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/get_d128.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/ai.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/div_d.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/set_prc_raw.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/print_rnd_mode.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/min_prec.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/expm1.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/clears.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/gamma.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/pow_si.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/div_2si.c /usr/src/debug/mpfr/4
 .1.0-r0/mpfr-4.1.0/src/set_float128.c /usr/src/debug/mpfr/4.1.0-r0/mpfr-4.1.0/src/set_q.c"
packages/core2-32-poky-linux/mpfr/mpfr-src: PKGSIZE changed from 1920866 to 2043445 (+6%)
packages/core2-32-poky-linux/mpfr/mpfr-src: PKGV changed from 4.0.2 [default] to 4.1.0 [default]
packages/core2-32-poky-linux/mpfr/mpfr-staticdev: PV changed from "4.0.2" to "4.1.0"
packages/core2-32-poky-linux/mpfr/mpfr-staticdev: PKGV changed from 4.0.2 [default] to 4.1.0 [default]
packages/core2-32-poky-linux/mpfr/mpfr: PV changed from "4.0.2" to "4.1.0"
packages/core2-32-poky-linux/mpfr/mpfr: FILELIST: removed "/usr/lib/libmpfr.so.6.0.2", added "/usr/lib/libmpfr.so.6.1.0"
packages/core2-32-poky-linux/mpfr/mpfr: PKGSIZE changed from 2904104 to 3153960 (+9%)
packages/core2-32-poky-linux/mpfr/mpfr: PKGV changed from 4.0.2 [default] to 4.1.0 [default]
Changes to packages/core2-32-poky-linux/mpfr (sysroot):
  /usr/lib/libmpfr.so.6 changed symlink target from libmpfr.so.6.0.2 to libmpfr.so.6.1.0
  /usr/lib/libmpfr.so changed symlink target from libmpfr.so.6.0.2 to libmpfr.so.6.1.0
  /usr/lib/libmpfr.so.6.0.2 moved to /usr/lib/libmpfr.so.6.1.0
Changes to packages/x86_64-linux/binutils-cross-i686 (sysroot):
  /sysroot-providers/virtual_i686-poky-linux-musl-binutils was added
  /usr/bin/i686-poky-linux-musl was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-addr2line was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-ar was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-as was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-c++filt was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-dwp was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-elfedit was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gprof was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-ld was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-ld.bfd was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-ld.gold was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-nm was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-objcopy was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-objdump was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-ranlib was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-readelf was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-size was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-strings was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-strip was added
  /usr/lib/i686-poky-linux-musl was added
  /usr/lib/i686-poky-linux-musl/ldscripts was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.x was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xbn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xd was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xdc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xdce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xde was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xdw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xdwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xr was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xs was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xsc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xsce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xse was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xsw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xswe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xu was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.x was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xbn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xd was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xdc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xdce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xde was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xdw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xdwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xr was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xs was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xsc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xsce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xse was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xsw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xswe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xu was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.x was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xbn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xd was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xdc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xdce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xde was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xdw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xdwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xr was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xs was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xsc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xsce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xse was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xsw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xswe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xu was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.x was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xbn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xd was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xdc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xdce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xde was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xdw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xdwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xr was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xs was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xsc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xsce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xse was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xsw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xswe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xu was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.x was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xbn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xd was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xdc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xdce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xde was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xdw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xdwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xr was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xs was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xsc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xsce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xse was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xsw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xswe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xu was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.x was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xbn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xd was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xdc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xdce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xde was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xdw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xdwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xr was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xs was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xsc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xsce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xse was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xsw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xswe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xu was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xwe was added
  /sysroot-providers/virtual_i686-poky-linux-binutils was removed
  /usr/bin/i686-poky-linux was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-addr2line was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-ar was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-as was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-c++filt was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-dwp was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-elfedit was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-gprof was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-ld was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-ld.bfd was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-ld.gold was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-nm was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-objcopy was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-objdump was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-ranlib was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-readelf was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-size was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-strings was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-strip was removed
  /usr/lib/i686-poky-linux was removed
  /usr/lib/i686-poky-linux/ldscripts was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.x was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xbn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xd was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xdc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xdce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xde was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xdw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xdwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xr was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xs was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xsc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xsce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xse was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xsw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xswe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xu was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.x was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xbn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xd was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xdc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xdce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xde was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xdw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xdwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xr was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xs was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xsc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xsce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xse was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xsw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xswe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xu was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.x was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xbn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xd was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xdc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xdce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xde was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xdw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xdwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xr was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xs was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xsc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xsce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xse was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xsw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xswe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xu was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.x was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xbn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xd was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xdc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xdce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xde was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xdw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xdwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xr was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xs was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xsc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xsce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xse was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xsw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xswe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xu was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.x was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xbn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xd was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xdc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xdce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xde was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xdw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xdwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xr was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xs was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xsc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xsce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xse was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xsw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xswe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xu was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.x was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xbn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xd was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xdc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xdce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xde was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xdw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xdwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xr was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xs was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xsc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xsce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xse was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xsw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xswe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xu was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xwe was removed

--===============8948841361372591226==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-mpfr-upgrade-4.0.2-4.1.0.patch"

From 7abd9ad57becd2a08e823ff47d180293b7da9840 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Wed, 15 Jul 2020 16:42:55 +0000
Subject: [PATCH] mpfr: upgrade 4.0.2 -> 4.1.0

---
 meta/recipes-support/mpfr/{mpfr_4.0.2.bb => mpfr_4.1.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-support/mpfr/{mpfr_4.0.2.bb => mpfr_4.1.0.bb} (79%)

diff --git a/meta/recipes-support/mpfr/mpfr_4.0.2.bb b/meta/recipes-support/mpfr/mpfr_4.1.0.bb
similarity index 79%
rename from meta/recipes-support/mpfr/mpfr_4.0.2.bb
rename to meta/recipes-support/mpfr/mpfr_4.1.0.bb
index 00c2dc2fe9..82b5516f26 100644
--- a/meta/recipes-support/mpfr/mpfr_4.0.2.bb
+++ b/meta/recipes-support/mpfr/mpfr_4.1.0.bb
@@ -11,8 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
 DEPENDS = "gmp autoconf-archive"
 
 SRC_URI = "https://www.mpfr.org/mpfr-${PV}/mpfr-${PV}.tar.xz"
-SRC_URI[md5sum] = "320fbc4463d4c8cb1e566929d8adc4f8"
-SRC_URI[sha256sum] = "1d3be708604eae0e42d578ba93b390c2a145f17743a744d8f3f8c2ad5855a38a"
+SRC_URI[sha256sum] = "0c98a3f1732ff6ca4ea690552079da9c597872d30e96ec28414ee23c95558a7f"
 
 UPSTREAM_CHECK_URI = "http://www.mpfr.org/mpfr-current/"
 
-- 
2.17.1


--===============8948841361372591226==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/mpfr/mpfr-dbg: PKGSIZE changed from 2298588 to 2827444 (+23%)
packages/core2-32-poky-linux/mpfr/mpfr-doc: PKGSIZE changed from 402154 to 145656 (-64%)
packages/core2-32-poky-linux/mpfr/mpfr-doc: FILELIST: added "/usr/share/doc/mpfr/examples/threads.c"
packages/core2-32-poky-linux/mpfr/mpfr: FILELIST: removed "/usr/lib/libmpfr.so.6.0.2", added "/usr/lib/libmpfr.so.6.1.0"
Changes to packages/core2-32-poky-linux/mpfr (sysroot):
  /usr/lib/libmpfr.so.6 changed symlink target from libmpfr.so.6.0.2 to libmpfr.so.6.1.0
  /usr/lib/libmpfr.so changed symlink target from libmpfr.so.6.0.2 to libmpfr.so.6.1.0
  /usr/lib/libmpfr.so.6.0.2 moved to /usr/lib/libmpfr.so.6.1.0
Changes to packages/x86_64-linux/binutils-cross-i686 (sysroot):
  /sysroot-providers/virtual_i686-poky-linux-musl-binutils was added
  /usr/bin/i686-poky-linux-musl was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-addr2line was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-ar was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-as was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-c++filt was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-dwp was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-elfedit was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gprof was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-ld was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-ld.bfd was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-ld.gold was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-nm was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-objcopy was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-objdump was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-ranlib was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-readelf was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-size was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-strings was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-strip was added
  /usr/lib/i686-poky-linux-musl was added
  /usr/lib/i686-poky-linux-musl/ldscripts was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.x was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xbn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xd was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xdc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xdce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xde was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xdw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xdwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xr was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xs was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xsc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xsce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xse was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xsw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xswe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xu was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.x was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xbn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xd was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xdc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xdce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xde was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xdw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xdwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xr was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xs was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xsc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xsce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xse was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xsw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xswe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xu was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.x was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xbn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xd was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xdc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xdce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xde was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xdw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xdwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xr was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xs was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xsc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xsce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xse was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xsw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xswe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xu was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.x was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xbn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xd was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xdc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xdce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xde was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xdw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xdwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xr was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xs was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xsc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xsce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xse was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xsw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xswe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xu was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.x was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xbn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xd was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xdc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xdce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xde was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xdw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xdwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xr was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xs was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xsc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xsce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xse was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xsw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xswe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xu was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.x was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xbn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xd was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xdc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xdce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xde was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xdw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xdwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xr was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xs was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xsc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xsce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xse was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xsw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xswe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xu was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xwe was added
  /sysroot-providers/virtual_i686-poky-linux-binutils was removed
  /usr/bin/i686-poky-linux was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-addr2line was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-ar was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-as was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-c++filt was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-dwp was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-elfedit was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-gprof was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-ld was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-ld.bfd was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-ld.gold was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-nm was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-objcopy was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-objdump was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-ranlib was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-readelf was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-size was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-strings was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-strip was removed
  /usr/lib/i686-poky-linux was removed
  /usr/lib/i686-poky-linux/ldscripts was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.x was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xbn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xd was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xdc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xdce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xde was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xdw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xdwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xr was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xs was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xsc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xsce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xse was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xsw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xswe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xu was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.x was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xbn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xd was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xdc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xdce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xde was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xdw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xdwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xr was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xs was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xsc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xsce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xse was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xsw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xswe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xu was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.x was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xbn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xd was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xdc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xdce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xde was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xdw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xdwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xr was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xs was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xsc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xsce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xse was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xsw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xswe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xu was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.x was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xbn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xd was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xdc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xdce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xde was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xdw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xdwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xr was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xs was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xsc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xsce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xse was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xsw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xswe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xu was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.x was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xbn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xd was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xdc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xdce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xde was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xdw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xdwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xr was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xs was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xsc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xsce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xse was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xsw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xswe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xu was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.x was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xbn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xd was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xdc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xdce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xde was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xdw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xdwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xr was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xs was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xsc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xsce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xse was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xsw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xswe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xu was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xwe was removed

--===============8948841361372591226==--
