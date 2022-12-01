Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74386C64ED3
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 15:30:34 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.46763.1669908625631840488
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 07:30:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=IXrPxaUm;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010184ce4f754e-28326e92-59e9-4291-8fc9-bea6e913fa04-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1669908625;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nSJjA7OC9iG4NDR8mlZDjNm1AKVVTDrUAw0+HOOcMf0=;
	b=IXrPxaUmZV7mz31eNmiEit92JiDhpLuGvEAKXMwRwrr9DCCp8Rj/8ffNDbKyXckI
	CwvrDjupWaq+sp6HCUifjEfSa99/xsWmLkwHEBnenbTVgm/98ofdum1+yodPi8fFAse
	z9AyjmCp96sJEvCGdOnjoAPlKjd9/xmzKz4A8xfA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1669908625;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nSJjA7OC9iG4NDR8mlZDjNm1AKVVTDrUAw0+HOOcMf0=;
	b=LG7qN/9xULWdZIIkP1OeYDUwxj+LXdSUYATvtg/3wonKYe9+ew3j37ALFjyIZEzP
	nrs7dGm0Oz8eKmXfDWc2kEq2QeEZmRhkovFYs68QXVxOAK1/3qmvmlnV09HA0pnlqIs
	OytvTx1EpP3SP6BD5U/xoD0Yrxvgyt4DzWcf7R3I=
Content-Type: multipart/mixed; boundary="===============5528493916114559628=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dropbear: upgrading to 2022.83 SUCCEEDED
Message-ID: <01010184ce4f754e-28326e92-59e9-4291-8fc9-bea6e913fa04-000000@us-west-2.amazonses.com>
Date: Thu, 1 Dec 2022 15:30:24 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 15:30:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174123

--===============5528493916114559628==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dropbear* to *2022.83* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dropbear-upgrade-2022.82-2022.83.patch
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
--===============5528493916114559628==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/dropbear/dropbear-dbg: PKGV changed from 2022.82 [default] to 2022.83 [default]
packages/core2-32-poky-linux/dropbear/dropbear-dbg: PV changed from "2022.82" to "2022.83"
packages/core2-32-poky-linux/dropbear/dropbear-dbg: PKGSIZE changed from 1288144 to 1289312 (+0%)
packages/core2-32-poky-linux/dropbear/dropbear-dev: PKGV changed from 2022.82 [default] to 2022.83 [default]
packages/core2-32-poky-linux/dropbear/dropbear-dev: PV changed from "2022.82" to "2022.83"
packages/core2-32-poky-linux/dropbear/dropbear-doc: PKGV changed from 2022.82 [default] to 2022.83 [default]
packages/core2-32-poky-linux/dropbear/dropbear-doc: PV changed from "2022.82" to "2022.83"
packages/core2-32-poky-linux/dropbear/dropbear-locale: PKGV changed from 2022.82 [default] to 2022.83 [default]
packages/core2-32-poky-linux/dropbear/dropbear-locale: PV changed from "2022.82" to "2022.83"
packages/core2-32-poky-linux/dropbear/dropbear-src: PKGV changed from 2022.82 [default] to 2022.83 [default]
packages/core2-32-poky-linux/dropbear/dropbear-src: FILELIST: directory renamed /usr/src/debug/dropbear/2022.82-r0/libtomcrypt/src/math -> /usr/src/debug/dropbear/2022.83-r0/libtomcrypt/src/math, directory renamed /usr/src/debug/dropbear/2022.82-r0/libtomcrypt/src/hashes -> /usr/src/debug/dropbear/2022.83-r0/libtomcrypt/src/hashes, directory renamed /usr/src/debug/dropbear/2022.82-r0/libtomcrypt/src/ciphers/aes -> /usr/src/debug/dropbear/2022.83-r0/libtomcrypt/src/ciphers/aes, directory renamed /usr/src/debug/dropbear/2022.82-r0/libtomcrypt/src/misc/crypt -> /usr/src/debug/dropbear/2022.83-r0/libtomcrypt/src/misc/crypt, directory renamed /usr/src/debug/dropbear/2022.82-r0/libtomcrypt/src/misc -> /usr/src/debug/dropbear/2022.83-r0/libtomcrypt/src/misc, directory renamed /usr/src/debug/dropbear/2022.82-r0/libtomcrypt/src/mac/poly1305 -> /usr/src/debug/dropbear/2022.83-r0/libtomcrypt/src/mac/poly1305, directory renamed /usr/src/debug/dropbear/2022.82-r0/libtomcrypt/src/pk/ecc -> /usr/sr
 c/debug/dropbear/2022.83-r0/libtomcrypt/src/pk/ecc, directory renamed /usr/src/debug/dropbear/2022.82-r0/libtomcrypt/src/stream/chacha -> /usr/src/debug/dropbear/2022.83-r0/libtomcrypt/src/stream/chacha, directory renamed /usr/src/debug/dropbear/2022.82-r0 -> /usr/src/debug/dropbear/2022.83-r0, directory renamed /usr/src/debug/dropbear/2022.82-r0/libtomcrypt/src/hashes/sha2 -> /usr/src/debug/dropbear/2022.83-r0/libtomcrypt/src/hashes/sha2, directory renamed /usr/src/debug/dropbear/2022.82-r0/libtomcrypt/src/modes/ctr -> /usr/src/debug/dropbear/2022.83-r0/libtomcrypt/src/modes/ctr, directory renamed /usr/src/debug/dropbear/2022.82-r0/libtomcrypt/src/headers -> /usr/src/debug/dropbear/2022.83-r0/libtomcrypt/src/headers, directory renamed /usr/src/debug/dropbear/2022.82-r0/libtomcrypt/src/misc/base64 -> /usr/src/debug/dropbear/2022.83-r0/libtomcrypt/src/misc/base64, directory renamed /usr/src/debug/dropbear/2022.82-r0/libtomcrypt/src/hashes/helper -> /usr/src/debug/dropbear/2022.83-r0/
 libtomcrypt/src/hashes/helper, directory renamed /usr/src/debug/dropbear/2022.82-r0/libtomcrypt/src/mac/hmac -> /usr/src/debug/dropbear/2022.83-r0/libtomcrypt/src/mac/hmac, removed "/usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_set_u32.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_mod_2d.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_init.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_cmp_d.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_exch.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_from_ubin.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_neg.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_s_mp_add.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_s_mp_get_bit.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_mod.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_reduce_2k_l.c /usr/src/debug/dropbear/2022.82-r0/libtommath/tommath.h /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_add_d.c /usr/src/debug/dropbear/2022
 .82-r0/libtommath/bn_mp_exptmod.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_dr_is_modulus.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_init_u32.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_sub.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_div_2.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_get_mag_u32.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_s_mp_montgomery_reduce_fast.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_cmp_mag.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_montgomery_setup.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_get_mag_ul.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_set_i32.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_sqr.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_rand.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_s_mp_mul_high_digs_fast.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_to_ubin.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_mul
 _2d.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_montgomery_reduce.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_copy.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_grow.c /usr/src/debug/dropbear/2022.82-r0/libtommath/tommath_private.h /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_s_mp_reverse.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_count_bits.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_lcm.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_to_radix.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_s_mp_mul_high_digs.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_kronecker.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_prime_tab.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_reduce_2k_setup_l.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_clear.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_prime_next_prime.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_prime_is_prime.c /usr/src/debug/dropb
 ear/2022.82-r0/libtommath/bn_mp_prime_miller_rabin.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_dr_reduce.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_read_radix.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_reduce_2k.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_reduce_setup.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_rshd.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_dr_setup.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_sub_d.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_s_mp_prime_is_divisible.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_init_multi.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_div_d.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_submod.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_prime_strong_lucas_selfridge.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_add.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_mul_2.c /usr/src/debug/dropbear/2022.82-r0/libto
 mmath/bn_mp_reduce_2k_setup.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_is_square.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_lshd.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_montgomery_calc_normalization.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_div.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_ubin_size.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_addmod.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_gcd.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_set.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_div_3.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_radix_smap.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_s_mp_invmod_slow.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_cutoffs.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_sqrmod.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_s_mp_sub.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_prime_rabin_miller_trials.c /usr/src
 /debug/dropbear/2022.82-r0/libtommath/bn_mp_reduce_is_2k.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_init_set.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_s_mp_sqr.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_s_mp_sqr_fast.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_s_mp_invmod_fast.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_div_2d.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_cnt_lsb.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_clear_multi.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_mul.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_sqrt.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_init_copy.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_abs.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_reduce_is_2k_l.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_mul_d.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_s_mp_balance_mul.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_reduc
 e.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_mod_d.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_2expt.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_clamp.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_invmod.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_s_mp_exptmod_fast.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_get_l.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_init_size.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_cmp.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_mulmod.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_zero.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_set_ul.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_s_mp_mul_digs_fast.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_s_mp_mul_digs.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_mp_get_i32.c /usr/src/debug/dropbear/2022.82-r0/libtommath/bn_s_mp_exptmod.c", added "/usr/src/debug/dropbear/2022.83-r0/libtommath/bn_m
 p_set_ul.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_mul_2d.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_reduce_2k.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_reduce.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_gcd.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_s_mp_add.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_prime_tab.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_reduce_is_2k.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_clamp.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_submod.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_is_square.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_mul.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_set.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_reduce_setup.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_neg.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_ubin_size.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_s_mp_invmod_fas
 t.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_get_mag_ul.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_mul_2.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_mod.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_reduce_2k_l.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_div_2.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_div_2d.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_init_u32.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_clear.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_exch.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_montgomery_reduce.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_s_mp_sub.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_cmp_d.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_s_mp_sqr_fast.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_s_mp_mul_digs.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_s_mp_balance_mul.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp
 _zero.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_reduce_is_2k_l.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_mul_d.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_prime_rabin_miller_trials.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_prime_next_prime.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_sqrt.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_init_multi.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_set_u32.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_cnt_lsb.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_add.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_clear_multi.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_get_l.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_sub_d.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_count_bits.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_lcm.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_div_3.c /usr/src/debug/dropbear/2022.83-r0
 /libtommath/bn_cutoffs.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_s_mp_mul_high_digs.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_mod_d.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_2expt.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_s_mp_mul_digs_fast.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_from_ubin.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_get_i32.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_exptmod.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_s_mp_exptmod.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_radix_smap.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_dr_setup.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_abs.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_s_mp_sqr.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_to_ubin.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_mod_2d.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_to_radix.c /usr/src/debug/dropbear/2022
 .83-r0/libtommath/bn_s_mp_invmod_slow.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_reduce_2k_setup_l.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_reduce_2k_setup.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_copy.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_grow.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_cmp.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_rshd.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_cmp_mag.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_get_mag_u32.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_div.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_init_copy.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_lshd.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_sqrmod.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_init.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_div_d.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_s_mp_mul_high_digs_fast.c /usr/src/debug/d
 ropbear/2022.83-r0/libtommath/bn_s_mp_prime_is_divisible.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_add_d.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_s_mp_exptmod_fast.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_read_radix.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_prime_miller_rabin.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_init_set.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_invmod.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_montgomery_calc_normalization.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_s_mp_montgomery_reduce_fast.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_dr_reduce.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_prime_is_prime.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_montgomery_setup.c /usr/src/debug/dropbear/2022.83-r0/libtommath/tommath_private.h /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_init_size.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_
 sqr.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_s_mp_reverse.c /usr/src/debug/dropbear/2022.83-r0/libtommath/tommath.h /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_mulmod.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_dr_is_modulus.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_sub.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_rand.c /usr/src/debug/dropbear/2022.83-r0/libtommath/bn_mp_addmod.c"
packages/core2-32-poky-linux/dropbear/dropbear-src: PV changed from "2022.82" to "2022.83"
packages/core2-32-poky-linux/dropbear/dropbear-src: PKGSIZE changed from 1434439 to 1425544 (-1%)
packages/core2-32-poky-linux/dropbear/dropbear-staticdev: PKGV changed from 2022.82 [default] to 2022.83 [default]
packages/core2-32-poky-linux/dropbear/dropbear-staticdev: PV changed from "2022.82" to "2022.83"
packages/core2-32-poky-linux/dropbear/dropbear: PKGV changed from 2022.82 [default] to 2022.83 [default]
packages/core2-32-poky-linux/dropbear/dropbear: PV changed from "2022.82" to "2022.83"
packages/core2-32-poky-linux/dropbear/dropbear: PKGSIZE changed from 406969 to 411065 (+1%)
packages/core2-32-poky-linux/dropbear: PKGV changed from 2022.82 [default] to 2022.83 [default]
packages/core2-32-poky-linux/dropbear: SRC_URI changed from "http://matt.ucc.asn.au/dropbear/releases/dropbear-2022.82.tar.bz2 file://0001-urandom-xauth-changes-to-options.h.patch file://init file://dropbearkey.service file://dropbear@.service file://dropbear.socket file://dropbear.default file://0005-dropbear-enable-pam.patch file://0006-dropbear-configuration-file.patch file://dropbear file://dropbear-disable-weak-ciphers.patch file://0007-Fix-X11-build-failure-use-DROPBEAR_PRIO_LOWDELAY.patch" to "http://matt.ucc.asn.au/dropbear/releases/dropbear-2022.83.tar.bz2 file://0001-urandom-xauth-changes-to-options.h.patch file://init file://dropbearkey.service file://dropbear@.service file://dropbear.socket file://dropbear.default file://0005-dropbear-enable-pam.patch file://0006-dropbear-configuration-file.patch file://dropbear file://dropbear-disable-weak-ciphers.patch"
packages/core2-32-poky-linux/dropbear: PV changed from "2022.82" to "2022.83"

--===============5528493916114559628==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dropbear-upgrade-2022.82-2022.83.patch"

RnJvbSA3ODA2ZmM2YmVmYmNlNzQ0YzVhNzk0N2RhY2FkZmY4MjdmY2QyNDA5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBEZWMgMjAyMiAwNzowNjowNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRy
b3BiZWFyOiB1cGdyYWRlIDIwMjIuODIgLT4gMjAyMi44MwoKLS0tCiAuLi5kLWZhaWx1cmUtdXNl
LURST1BCRUFSX1BSSU9fTE9XREVMQVkucGF0Y2ggfCAyOCAtLS0tLS0tLS0tLS0tLS0tLS0tCiAu
Li5yb3BiZWFyXzIwMjIuODIuYmIgPT4gZHJvcGJlYXJfMjAyMi44My5iYn0gfCAgNCArLS0KIDIg
ZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzMCBkZWxldGlvbnMoLSkKIGRlbGV0ZSBt
b2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtY29yZS9kcm9wYmVhci9kcm9wYmVhci8wMDA3LUZpeC1Y
MTEtYnVpbGQtZmFpbHVyZS11c2UtRFJPUEJFQVJfUFJJT19MT1dERUxBWS5wYXRjaAogcmVuYW1l
IG1ldGEvcmVjaXBlcy1jb3JlL2Ryb3BiZWFyL3tkcm9wYmVhcl8yMDIyLjgyLmJiID0+IGRyb3Bi
ZWFyXzIwMjIuODMuYmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZHJv
cGJlYXIvZHJvcGJlYXIvMDAwNy1GaXgtWDExLWJ1aWxkLWZhaWx1cmUtdXNlLURST1BCRUFSX1BS
SU9fTE9XREVMQVkucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9kcm9wYmVhci9kcm9wYmVhci8w
MDA3LUZpeC1YMTEtYnVpbGQtZmFpbHVyZS11c2UtRFJPUEJFQVJfUFJJT19MT1dERUxBWS5wYXRj
aApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDQyZGNjYmI5NC4uMDAwMDAwMDAwMAot
LS0gYS9tZXRhL3JlY2lwZXMtY29yZS9kcm9wYmVhci9kcm9wYmVhci8wMDA3LUZpeC1YMTEtYnVp
bGQtZmFpbHVyZS11c2UtRFJPUEJFQVJfUFJJT19MT1dERUxBWS5wYXRjaAorKysgL2Rldi9udWxs
CkBAIC0xLDI4ICswLDAgQEAKLUZyb20gNjQyOTIwOTFmZTNlOGVhN2M5YmZlNzRhZjczMGIyZmY1
NDI4YmYxMCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IE1hdHQgSm9obnN0b24gPG1h
dHRAdWNjLmFzbi5hdT4KLURhdGU6IFNhdCwgMjMgQXByIDIwMjIgMjI6MzM6MzEgKzA4MDAKLVN1
YmplY3Q6IFtQQVRDSF0gRml4IFgxMSBidWlsZCBmYWlsdXJlLCB1c2UgRFJPUEJFQVJfUFJJT19M
T1dERUxBWQotCi1VcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0Ci0KLVNpZ25lZC1vZmYtYnk6IERh
bmllbCBHb21leiA8ZGFuaWVsQHF0ZWMuY29tPgotLS0tCi0gc3ZyLXgxMWZ3ZC5jIHwgMiArLQot
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQotCi1kaWZmIC0t
Z2l0IGEvc3ZyLXgxMWZ3ZC5jIGIvc3ZyLXgxMWZ3ZC5jCi1pbmRleCAzNTNjYjEyLi41ZDllNmE5
IDEwMDY0NAotLS0tIGEvc3ZyLXgxMWZ3ZC5jCi0rKysgYi9zdnIteDExZndkLmMKLUBAIC0yMDYs
NyArMjA2LDcgQEAgdm9pZCB4MTFjbGVhbnVwKHN0cnVjdCBDaGFuU2VzcyAqY2hhbnNlc3MpIHsK
LSB9Ci0KLSBzdGF0aWMgaW50IHgxMV9pbml0aGFuZGxlcihzdHJ1Y3QgQ2hhbm5lbCAqY2hhbm5l
bCkgewotLQljaGFubmVsLT5wcmlvID0gRFJPUEJFQVJfQ0hBTk5FTF9QUklPX0lOVEVSQUNUSVZF
OwotKwljaGFubmVsLT5wcmlvID0gRFJPUEJFQVJfUFJJT19MT1dERUxBWTsKLSAJcmV0dXJuIDA7
Ci0gfQotCi0tLQotMi4zNS4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2Ryb3Bi
ZWFyL2Ryb3BiZWFyXzIwMjIuODIuYmIgYi9tZXRhL3JlY2lwZXMtY29yZS9kcm9wYmVhci9kcm9w
YmVhcl8yMDIyLjgzLmJiCnNpbWlsYXJpdHkgaW5kZXggOTYlCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1jb3JlL2Ryb3BiZWFyL2Ryb3BiZWFyXzIwMjIuODIuYmIKcmVuYW1lIHRvIG1ldGEvcmVj
aXBlcy1jb3JlL2Ryb3BiZWFyL2Ryb3BiZWFyXzIwMjIuODMuYmIKaW5kZXggNGVkNGM2NWNjMS4u
MGM3YThmNGNhYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvZHJvcGJlYXIvZHJvcGJl
YXJfMjAyMi44Mi5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9kcm9wYmVhci9kcm9wYmVhcl8y
MDIyLjgzLmJiCkBAIC0yMSw5ICsyMSw5IEBAIFNSQ19VUkkgPSAiaHR0cDovL21hdHQudWNjLmFz
bi5hdS9kcm9wYmVhci9yZWxlYXNlcy9kcm9wYmVhci0ke1BWfS50YXIuYnoyIFwKICAgICAgICAg
ICAgZmlsZTovL2Ryb3BiZWFyLmRlZmF1bHQgXAogICAgICAgICAgICAke0BiYi51dGlscy5jb250
YWlucygnRElTVFJPX0ZFQVRVUkVTJywgJ3BhbScsICcke1BBTV9TUkNfVVJJfScsICcnLCBkKX0g
XAogICAgICAgICAgICAke0BiYi51dGlscy5jb250YWlucygnUEFDS0FHRUNPTkZJRycsICdkaXNh
YmxlLXdlYWstY2lwaGVycycsICdmaWxlOi8vZHJvcGJlYXItZGlzYWJsZS13ZWFrLWNpcGhlcnMu
cGF0Y2gnLCAnJywgZCl9IFwKLSAgICAgICAgICAgZmlsZTovLzAwMDctRml4LVgxMS1idWlsZC1m
YWlsdXJlLXVzZS1EUk9QQkVBUl9QUklPX0xPV0RFTEFZLnBhdGNoIgorICAgICAgICAgICAiCiAK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICIzYTAzOGQyYmJjMDJiZjI4YmJkZDIwYzAxMjA5MWY3NDFh
M2VjNWNiZTQ2MDY5MTgxMWQ3MTQ4NzZhYWQ3NWQxIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImJj
NWExMjFmZmJjOTRiNTE3MWFkNWViZTAxYmU0Mjc0NmQ1MGFhNzk3Yzk1NDlhNDYzOTg5NGExNjc0
OTQ0M2IiCiAKIFBBTV9TUkNfVVJJID0gImZpbGU6Ly8wMDA1LWRyb3BiZWFyLWVuYWJsZS1wYW0u
cGF0Y2ggXAogICAgICAgICAgICAgICAgZmlsZTovLzAwMDYtZHJvcGJlYXItY29uZmlndXJhdGlv
bi1maWxlLnBhdGNoIFwKLS0gCjIuMzEuMQoK

--===============5528493916114559628==--

