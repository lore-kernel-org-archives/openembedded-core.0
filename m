Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B514DCD98FD
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:31:52 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50414.1781195499126908181
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:31:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=XybUeZI8;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=tr9PcJvR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019eb78663b2-446e3284-80c6-4036-9dbc-0a72505fde29-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195498;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9nfVAHv6+BFpV2oc9NiCAH1JDcZBXKzv/j66oZ1LNtw=;
	b=XybUeZI8U4fE67nw2Ju7p6cAyNIirFxpfLuglrjm2L7vXyO1hrV8fWbFzcj6T9Fh
	yA07riqox14l1w1YBgWbwGEyO9ZiSk1GwaYl4T4TDs2v6y7BWBuNx/oAMlnPPXUPB+F
	cubobRJrRPZvSmYH3EQm4vDrPVdljAAJ8LM/CKSg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195498;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9nfVAHv6+BFpV2oc9NiCAH1JDcZBXKzv/j66oZ1LNtw=;
	b=tr9PcJvRnMPBRTQPgwE3YFaPPejUqyhGucIBa/FbvX/fnaQpr1aGSKelUPoNQ5rl
	pshZZQQalfckDHmT8iIHJGFkUI2Xf2lgcBEX8EJuM/qhFvkSjSnT5rDvtAfZBZAYqVb
	LbsOYCFc3IWhobc8CeNDDbilwUMnSJerwKFxJKLw=
Content-Type: multipart/mixed; boundary="===============2335846513502146288=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dropbear: upgrading to 2026.91 SUCCEEDED
Message-ID: <0101019eb78663b2-446e3284-80c6-4036-9dbc-0a72505fde29-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:31:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:31:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238471

--===============2335846513502146288==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *dropbear* to *2026.91* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dropbear-upgrade-2025.89-2026.91.patch
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

-- >8 --
From 010501403756d3fb39753b5453ed95be3f81475f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 08:29:53 +0000
Subject: [PATCH] dropbear: upgrade 2025.89 -> 2026.91

---
 .../0001-urandom-xauth-changes-to-options.h.patch         | 6 +++---
 .../dropbear/dropbear/0005-dropbear-enable-pam.patch      | 8 ++++----
 .../dropbear/0006-dropbear-configuration-file.patch       | 2 +-
 .../dropbear/{dropbear_2025.89.bb => dropbear_2026.91.bb} | 2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)
 rename meta/recipes-core/dropbear/{dropbear_2025.89.bb => dropbear_2026.91.bb} (98%)

diff --git a/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch b/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch
index a662230b88..9374aa3ae2 100644
--- a/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch
+++ b/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch
@@ -1,4 +1,4 @@
-From cdc6a4a57a86d8116a92a5d905993e65cf723556 Mon Sep 17 00:00:00 2001
+From 3e9d27e128fe45a92e059590bc475c9d0e1f4fb4 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard@openedhand.com>
 Date: Wed, 31 Aug 2005 10:45:47 +0000
 Subject: [PATCH] urandom-xauth-changes-to-options.h
@@ -9,10 +9,10 @@ Upstream-Status: Inappropriate [configuration]
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/default_options.h b/src/default_options.h
-index 6e970bb..ccc8b47 100644
+index e49dc70..c5a28a8 100644
 --- a/src/default_options.h
 +++ b/src/default_options.h
-@@ -323,7 +323,7 @@ group1 in Dropbear server too */
+@@ -347,7 +347,7 @@ group1 in Dropbear server too */
  
  /* The command to invoke for xauth when using X11 forwarding.
   * "-q" for quiet */
diff --git a/meta/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch b/meta/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch
index 6743f506e9..a4923351e8 100644
--- a/meta/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch
+++ b/meta/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch
@@ -1,4 +1,4 @@
-From 253ca01f0fc50dbaeb2ff8bcece0c34256eba94f Mon Sep 17 00:00:00 2001
+From 494b98869088f8273e0139d890f0efed15a5b74e Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Wed, 2 Dec 2015 11:36:02 +0200
 Subject: [PATCH] Enable pam
@@ -15,10 +15,10 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/default_options.h b/src/default_options.h
-index ccc8b47..12768d1 100644
+index c5a28a8..a9802e5 100644
 --- a/src/default_options.h
 +++ b/src/default_options.h
-@@ -228,7 +228,7 @@ group1 in Dropbear server too */
+@@ -240,7 +240,7 @@ group1 in Dropbear server too */
  
  /* Authentication Types - at least one required.
     RFC Draft requires pubkey auth, and recommends password */
@@ -27,7 +27,7 @@ index ccc8b47..12768d1 100644
  
  /* Note: PAM auth is quite simple and only works for PAM modules which just do
   * a simple "Login: " "Password: " (you can edit the strings in svr-authpam.c).
-@@ -236,7 +236,7 @@ group1 in Dropbear server too */
+@@ -248,7 +248,7 @@ group1 in Dropbear server too */
   * but there's an interface via a PAM module. It won't work for more complex
   * PAM challenge/response.
   * You can't enable both PASSWORD and PAM. */
diff --git a/meta/recipes-core/dropbear/dropbear/0006-dropbear-configuration-file.patch b/meta/recipes-core/dropbear/dropbear/0006-dropbear-configuration-file.patch
index 44861088cc..4a6f3aef04 100644
--- a/meta/recipes-core/dropbear/dropbear/0006-dropbear-configuration-file.patch
+++ b/meta/recipes-core/dropbear/dropbear/0006-dropbear-configuration-file.patch
@@ -1,4 +1,4 @@
-From 16b147f97f0938cddb55ec1c90bc919c13f26fc0 Mon Sep 17 00:00:00 2001
+From da29c8793d2e35d04a772ca1c0a5530abd45f0ec Mon Sep 17 00:00:00 2001
 From: Mingli Yu <Mingli.Yu@windriver.com>
 Date: Thu, 6 Sep 2018 15:54:00 +0800
 Subject: [PATCH] dropbear configuration file
diff --git a/meta/recipes-core/dropbear/dropbear_2025.89.bb b/meta/recipes-core/dropbear/dropbear_2026.91.bb
similarity index 98%
rename from meta/recipes-core/dropbear/dropbear_2025.89.bb
rename to meta/recipes-core/dropbear/dropbear_2026.91.bb
index ece065265f..826a691b04 100644
--- a/meta/recipes-core/dropbear/dropbear_2025.89.bb
+++ b/meta/recipes-core/dropbear/dropbear_2026.91.bb
@@ -23,7 +23,7 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            "
 
-SRC_URI[sha256sum] = "0d1f7ca711cfc336dc8a85e672cab9cfd8223a02fe2da0a4a7aeb58c9e113634"
+SRC_URI[sha256sum] = "defa924475abf6bc1e74abc00173e46bfdc804bd47caafa14f5a4ef0cc76da34"
 MIRRORS += "http://matt.ucc.asn.au/dropbear/releases/ https://dropbear.nl/mirror/releases/"
 
 PAM_SRC_URI = "file://0005-dropbear-enable-pam.patch \
-- 
2.47.1


--===============2335846513502146288==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/dropbear/dropbear-dbg: PKGSIZE changed from 1890232 to 1939624 (+3%)
packages/x86-64-v3-poky-linux/dropbear/dropbear-dbg: PKGV changed from 2025.89 [default] to 2026.91 [default]
packages/x86-64-v3-poky-linux/dropbear/dropbear-dbg: PV changed from "2025.89" to "2026.91"
packages/x86-64-v3-poky-linux/dropbear/dropbear-dev: PKGV changed from 2025.89 [default] to 2026.91 [default]
packages/x86-64-v3-poky-linux/dropbear/dropbear-dev: PV changed from "2025.89" to "2026.91"
packages/x86-64-v3-poky-linux/dropbear/dropbear-doc: PKGV changed from 2025.89 [default] to 2026.91 [default]
packages/x86-64-v3-poky-linux/dropbear/dropbear-doc: PV changed from "2025.89" to "2026.91"
packages/x86-64-v3-poky-linux/dropbear/dropbear-locale: PKGV changed from 2025.89 [default] to 2026.91 [default]
packages/x86-64-v3-poky-linux/dropbear/dropbear-locale: PV changed from "2025.89" to "2026.91"
packages/x86-64-v3-poky-linux/dropbear/dropbear-src: PKGSIZE changed from 1980485 to 2005289 (+1%)
packages/x86-64-v3-poky-linux/dropbear/dropbear-src: PKGV changed from 2025.89 [default] to 2026.91 [default]
packages/x86-64-v3-poky-linux/dropbear/dropbear-src: FILELIST: directory renamed /usr/src/debug/dropbear/2025.89/libtomcrypt/src/ciphers/aes -> /usr/src/debug/dropbear/2026.91/libtomcrypt/src/ciphers/aes, directory renamed /usr/src/debug/dropbear/2025.89/libtomcrypt/src/mac/poly1305 -> /usr/src/debug/dropbear/2026.91/libtomcrypt/src/mac/poly1305, directory renamed /usr/src/debug/dropbear/2025.89/libtomcrypt/src/hashes/helper -> /usr/src/debug/dropbear/2026.91/libtomcrypt/src/hashes/helper, directory renamed /usr/src/debug/dropbear/2025.89/libtomcrypt/src/headers -> /usr/src/debug/dropbear/2026.91/libtomcrypt/src/headers, directory renamed /usr/src/debug/dropbear/2025.89/libtomcrypt/src/misc/base64 -> /usr/src/debug/dropbear/2026.91/libtomcrypt/src/misc/base64, directory renamed /usr/src/debug/dropbear/2025.89/libtomcrypt/src/mac/hmac -> /usr/src/debug/dropbear/2026.91/libtomcrypt/src/mac/hmac, directory renamed /usr/src/debug/dropbear/2025.89/libtomcrypt/src/math -> /usr/src/debug/dr
 opbear/2026.91/libtomcrypt/src/math, directory renamed /usr/src/debug/dropbear/2025.89/libtomcrypt/src/misc/crypt -> /usr/src/debug/dropbear/2026.91/libtomcrypt/src/misc/crypt, directory renamed /usr/src/debug/dropbear/2025.89/libtomcrypt/src/modes/ctr -> /usr/src/debug/dropbear/2026.91/libtomcrypt/src/modes/ctr, directory renamed /usr/src/debug/dropbear/2025.89/libtomcrypt/src/pk/ecc -> /usr/src/debug/dropbear/2026.91/libtomcrypt/src/pk/ecc, directory renamed /usr/src/debug/dropbear/2025.89/libtomcrypt/src/misc -> /usr/src/debug/dropbear/2026.91/libtomcrypt/src/misc, directory renamed /usr/src/debug/dropbear/2025.89/libtomcrypt/src/stream/chacha -> /usr/src/debug/dropbear/2026.91/libtomcrypt/src/stream/chacha, directory renamed /usr/src/debug/dropbear/2025.89/libtomcrypt/src/hashes/sha2 -> /usr/src/debug/dropbear/2026.91/libtomcrypt/src/hashes/sha2, removed "/usr/src/debug/dropbear/2025.89/src/cli-tcpfwd.c /usr/src/debug/dropbear/2025.89/src/dh_groups.h /usr/src/debug/dropbear/2025
 .89/src/dbmulti.c /usr/src/debug/dropbear/2025.89/src/dbrandom.c /usr/src/debug/dropbear/2025.89/src/svr-tcpfwd.c /usr/src/debug/dropbear/2025.89/src/genrsa.h /usr/src/debug/dropbear/2025.89/src/signkey_ossh.c /usr/src/debug/dropbear/2025.89/src/dh_groups.c /usr/src/debug/dropbear/2025.89/src/dbrandom.h /usr/src/debug/dropbear/2025.89/src/genrsa.c /usr/src/debug/dropbear/2025.89/src/signkey_ossh.h /usr/src/debug/dropbear/2025.89/src/svr-authpam.c /usr/src/debug/dropbear/2025.89/src/queue.h /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_add_d.c /usr/src/debug/dropbear/2025.89/src/queue.c /usr/src/debug/dropbear/2025.89/libtommath/bn_s_mp_invmod_slow.c /usr/src/debug/dropbear/2025.89/libtommath/bn_s_mp_prime_is_divisible.c /usr/src/debug/dropbear/2025.89/src/progressmeter.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_lcm.c /usr/src/debug/dropbear/2025.89/src/progressmeter.h /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_montgomery_reduce.c /usr/src/debug/dropbear/2025.89/src/
 cli-kex.c /usr/src/debug/dropbear/2025.89/src/svr-kex.c /usr/src/debug/dropbear/2025.89/src/mlkem768.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_add.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_2expt.c /usr/src/debug/dropbear/2025.89/src/mlkem768.h /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_reduce.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_div_2d.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_init_set.c /usr/src/debug/dropbear/2025.89/src/loginrec.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_mul_2.c /usr/src/debug/dropbear/2025.89/src/cli-authpubkey.c /usr/src/debug/dropbear/2025.89/libtommath/bn_s_mp_exptmod_fast.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_init_size.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_ubin_size.c /usr/src/debug/dropbear/2025.89/src/loginrec.h /usr/src/debug/dropbear/2025.89/libtommath/bn_s_mp_montgomery_reduce_fast.c /usr/src/debug/dropbear/2025.89/src/svr-authpubkey.c /usr/src/debug/dropbear/2025.89/src/cl
 i-auth.c /usr/src/debug/dropbear/2025.89/src/dbmalloc.h /usr/src/debug/dropbear/2025.89/src/svr-auth.c /usr/src/debug/dropbear/2025.89/src/dropbearkey.c /usr/src/debug/dropbear/2025.89/src/dbmalloc.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_get_mag_ul.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_cmp_d.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_from_ubin.c /usr/src/debug/dropbear/2025.89/src/ecdsa.c /usr/src/debug/dropbear/2025.89/src/sk-ecdsa.c /usr/src/debug/dropbear/2025.89/src/sk-ecdsa.h /usr/src/debug/dropbear/2025.89/libtommath/bn_s_mp_mul_high_digs_fast.c /usr/src/debug/dropbear/2025.89/src/ecdsa.h /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_get_l.c /usr/src/debug/dropbear/2025.89/src/cli-authinteract.c /usr/src/debug/dropbear/2025.89/src/gened25519.c /usr/src/debug/dropbear/2025.89/src/keyimport.h /usr/src/debug/dropbear/2025.89/src/sk-ed25519.c /usr/src/debug/dropbear/2025.89/src/keyimport.c /usr/src/debug/dropbear/2025.89/src/gened25519.h /usr/src
 /debug/dropbear/2025.89/src/sk-ed25519.h /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_to_radix.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_div_3.c /usr/src/debug/dropbear/2025.89/libtommath/tommath.h /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_dr_is_modulus.c /usr/src/debug/dropbear/2025.89/src/session.h /usr/src/debug/dropbear/2025.89/src/kex-dh.c /usr/src/debug/dropbear/2025.89/src/circbuffer.c /usr/src/debug/dropbear/2025.89/libtommath/bn_prime_tab.c /usr/src/debug/dropbear/2025.89/src/cli-channel.c /usr/src/debug/dropbear/2025.89/src/circbuffer.h /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_sqr.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_exch.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_zero.c /usr/src/debug/dropbear/2025.89/src/curve25519.c /usr/src/debug/dropbear/2025.89/src/curve25519.h /usr/src/debug/dropbear/2025.89/src/cli-main.c /usr/src/debug/dropbear/2025.89/src/svr-main.c /usr/src/debug/dropbear/2025.89/src/bignum.c /usr/src/debug/dropb
 ear/2025.89/libtommath/bn_mp_sub_d.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_mod_d.c /usr/src/debug/dropbear/2025.89/src/bignum.h /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_to_ubin.c /usr/src/debug/dropbear/2025.89/src/buffer.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_neg.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_rshd.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_prime_rabin_miller_trials.c /usr/src/debug/dropbear/2025.89/libtommath/bn_s_mp_sqr_fast.c /usr/src/debug/dropbear/2025.89/libtommath/bn_s_mp_sub.c /usr/src/debug/dropbear/2025.89/src/buffer.h /usr/src/debug/dropbear/2025.89/src/common-channel.c /usr/src/debug/dropbear/2025.89/src/common-chansession.c /usr/src/debug/dropbear/2025.89/src/dbhelpers.c /usr/src/debug/dropbear/2025.89/src/cli-authpasswd.c /usr/src/debug/dropbear/2025.89/src/chachapoly.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_rand.c /usr/src/debug/dropbear/2025.89/src/dbhelpers.h /usr/src/debug/dropbear/2025.89/src/ch
 achapoly.h /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_reduce_2k_l.c /usr/src/debug/dropbear/2025.89/libtommath/bn_s_mp_balance_mul.c /usr/src/debug/dropbear/2025.89/libtommath/bn_s_mp_add.c /usr/src/debug/dropbear/2025.89/libtommath/bn_s_mp_sqr.c /usr/src/debug/dropbear/2025.89/src/algo.h /usr/src/debug/dropbear/2025.89/src/auth.h /usr/src/debug/dropbear/2025.89/src/kex-pqhybrid.c /usr/src/debug/dropbear/2025.89/src/list.h /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_clear.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_lshd.c /usr/src/debug/dropbear/2025.89/src/scpmisc.h /usr/src/debug/dropbear/2025.89/src/list.c /usr/src/debug/dropbear/2025.89/src/scpmisc.c /usr/src/debug/dropbear/2025.89/src/kex-x25519.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_prime_is_prime.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_dr_setup.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_div_2.c /usr/src/debug/dropbear/2025.89/libtommath/tommath_private.h /usr/src/debug/dropbear
 /2025.89/libtommath/bn_mp_cmp.c /usr/src/debug/dropbear/2025.89/src/channel.h /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_clear_multi.c /usr/src/debug/dropbear/2025.89/src/kex-ecdh.c /usr/src/debug/dropbear/2025.89/src/listener.h /usr/src/debug/dropbear/2025.89/src/packet.h /usr/src/debug/dropbear/2025.89/src/packet.c /usr/src/debug/dropbear/2025.89/src/listener.c /usr/src/debug/dropbear/2025.89/src/crypto_desc.c /usr/src/debug/dropbear/2025.89/src/termcodes.c /usr/src/debug/dropbear/2025.89/libtommath/bn_cutoffs.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_radix_smap.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_montgomery_setup.c /usr/src/debug/dropbear/2025.89/src/crypto_desc.h /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_count_bits.c /usr/src/debug/dropbear/2025.89/src/termcodes.h /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_mod_2d.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_mul_2d.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_mulmod.c /usr/sr
 c/debug/dropbear/2025.89/libtommath/bn_mp_addmod.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_invmod.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_is_square.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_reduce_is_2k.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_set_ul.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_sqrmod.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_submod.c /usr/src/debug/dropbear/2025.89/libtommath/bn_s_mp_reverse.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_init_copy.c /usr/src/debug/dropbear/2025.89/src/sntrup761_compat.h /usr/src/debug/dropbear/2025.89/src/ltc_prng.h /usr/src/debug/dropbear/2025.89/src/common-runopts.c /usr/src/debug/dropbear/2025.89/src/ltc_prng.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_sqrt.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_prime_miller_rabin.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_set.c /usr/src/debug/dropbear/2025.89/src/netio.c /usr/src/debug/dropbear/2025.89/src/drop
 bearconvert.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_mul_d.c /usr/src/debug/dropbear/2025.89/src/netio.h /usr/src/debug/dropbear/2025.89/src/cli-agentfwd.c /usr/src/debug/dropbear/2025.89/src/svr-agentfwd.c /usr/src/debug/dropbear/2025.89/src/ed25519.c /usr/src/debug/dropbear/2025.89/src/tcpfwd.h /usr/src/debug/dropbear/2025.89/src/x11fwd.h /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_div_d.c /usr/src/debug/dropbear/2025.89/src/cli-runopts.c /usr/src/debug/dropbear/2025.89/src/gensignkey.h /usr/src/debug/dropbear/2025.89/src/svr-runopts.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_init_multi.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_prime_next_prime.c /usr/src/debug/dropbear/2025.89/src/libcrux_mlkem768_sha3.h /usr/src/debug/dropbear/2025.89/src/ed25519.h /usr/src/debug/dropbear/2025.89/src/svr-x11fwd.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_montgomery_calc_normalization.c /usr/src/debug/dropbear/2025.89/src/gensignkey.c /usr/src/debug/dropbear
 /2025.89/libtommath/bn_mp_gcd.c /usr/src/debug/dropbear/2025.89/src/sntrup761.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_init_u32.c /usr/src/debug/dropbear/2025.89/libtommath/bn_s_mp_mul_digs.c /usr/src/debug/dropbear/2025.89/src/sntrup761.h /usr/src/debug/dropbear/2025.89/src/dbutil.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_grow.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_sub.c /usr/src/debug/dropbear/2025.89/src/dbutil.h /usr/src/debug/dropbear/2025.89/libtommath/bn_s_mp_exptmod.c /usr/src/debug/dropbear/2025.89/src/service.h /usr/src/debug/dropbear/2025.89/src/common-kex.c /usr/src/debug/dropbear/2025.89/libtommath/bn_s_mp_invmod_fast.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_init.c /usr/src/debug/dropbear/2025.89/src/ecc.h /usr/src/debug/dropbear/2025.89/src/kex.h /usr/src/debug/dropbear/2025.89/src/rsa.h /usr/src/debug/dropbear/2025.89/src/signkey.c /usr/src/debug/dropbear/2025.89/src/signkey.h /usr/src/debug/dropbear/2025.89/src/ecc.c /usr/src/
 debug/dropbear/2025.89/libtommath/bn_mp_abs.c /usr/src/debug/dropbear/2025.89/src/rsa.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_set_u32.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_cnt_lsb.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_cmp_mag.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_exptmod.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_get_i32.c /usr/src/debug/dropbear/2025.89/src/scp.c /usr/src/debug/dropbear/2025.89/src/process-packet.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_clamp.c /usr/src/debug/dropbear/2025.89/src/cli-session.c /usr/src/debug/dropbear/2025.89/src/svr-service.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_mod.c /usr/src/debug/dropbear/2025.89/src/svr-session.c /usr/src/debug/dropbear/2025.89/src/cli-chansession.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_div.c /usr/src/debug/dropbear/2025.89/src/chansession.h /usr/src/debug/dropbear/2025.89/src/svr-chansession.c /usr/src/debug/dropbear/2025.89/src/tcp-acce
 pt.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_read_radix.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_mul.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_reduce_is_2k_l.c /usr/src/debug/dropbear/2025.89/src/runopts.h /usr/src/debug/dropbear/2025.89/src/common-session.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_dr_reduce.c /usr/src/debug/dropbear/2025.89/src/agentfwd.h /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_copy.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_reduce_setup.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_reduce_2k_setup_l.c /usr/src/debug/dropbear/2025.89/src/common-algo.c /usr/src/debug/dropbear/2025.89/libtommath/bn_s_mp_mul_digs_fast.c /usr/src/debug/dropbear/2025.89/libtommath/bn_s_mp_mul_high_digs.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_reduce_2k_setup.c /usr/src/debug/dropbear/2025.89/src/atomicio.h /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_reduce_2k.c /usr/src/debug/dropbear/2025.89/src/sshpty.c /usr/src/
 debug/dropbear/2025.89/src/atomicio.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_get_mag_u32.c /usr/src/debug/dropbear/2025.89/src/svr-authpubkeyoptions.c /usr/src/debug/dropbear/2025.89/src/sshpty.h", added "/usr/src/debug/dropbear/2026.91/src/cli-tcpfwd.c /usr/src/debug/dropbear/2026.91/src/dh_groups.h /usr/src/debug/dropbear/2026.91/src/dbmulti.c /usr/src/debug/dropbear/2026.91/src/dbrandom.c /usr/src/debug/dropbear/2026.91/src/svr-tcpfwd.c /usr/src/debug/dropbear/2026.91/src/genrsa.h /usr/src/debug/dropbear/2026.91/src/signkey_ossh.c /usr/src/debug/dropbear/2026.91/src/dh_groups.c /usr/src/debug/dropbear/2026.91/src/dbrandom.h /usr/src/debug/dropbear/2026.91/src/genrsa.c /usr/src/debug/dropbear/2026.91/src/signkey_ossh.h /usr/src/debug/dropbear/2026.91/src/svr-authpam.c /usr/src/debug/dropbear/2026.91/src/queue.h /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_add_d.c /usr/src/debug/dropbear/2026.91/src/queue.c /usr/src/debug/dropbear/2026.91/libtommath/bn_s_mp_invmod_slo
 w.c /usr/src/debug/dropbear/2026.91/libtommath/bn_s_mp_prime_is_divisible.c /usr/src/debug/dropbear/2026.91/src/progressmeter.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_lcm.c /usr/src/debug/dropbear/2026.91/src/progressmeter.h /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_montgomery_reduce.c /usr/src/debug/dropbear/2026.91/src/cli-kex.c /usr/src/debug/dropbear/2026.91/src/svr-kex.c /usr/src/debug/dropbear/2026.91/src/mlkem768.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_add.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_2expt.c /usr/src/debug/dropbear/2026.91/src/mlkem768.h /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_reduce.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_div_2d.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_init_set.c /usr/src/debug/dropbear/2026.91/src/loginrec.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_mul_2.c /usr/src/debug/dropbear/2026.91/src/cli-authpubkey.c /usr/src/debug/dropbear/2026.91/libtommath/bn_s_mp_exptmod_fas
 t.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_init_size.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_ubin_size.c /usr/src/debug/dropbear/2026.91/src/loginrec.h /usr/src/debug/dropbear/2026.91/libtommath/bn_s_mp_montgomery_reduce_fast.c /usr/src/debug/dropbear/2026.91/src/svr-authpubkey.c /usr/src/debug/dropbear/2026.91/src/cli-auth.c /usr/src/debug/dropbear/2026.91/src/dbmalloc.h /usr/src/debug/dropbear/2026.91/src/svr-auth.c /usr/src/debug/dropbear/2026.91/src/dropbearkey.c /usr/src/debug/dropbear/2026.91/src/svr-streamfwd.c /usr/src/debug/dropbear/2026.91/src/dbmalloc.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_get_mag_ul.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_cmp_d.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_from_ubin.c /usr/src/debug/dropbear/2026.91/src/ecdsa.c /usr/src/debug/dropbear/2026.91/src/sk-ecdsa.c /usr/src/debug/dropbear/2026.91/src/sk-ecdsa.h /usr/src/debug/dropbear/2026.91/libtommath/bn_s_mp_mul_high_digs_fast.c /usr/src/debug/
 dropbear/2026.91/src/ecdsa.h /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_get_l.c /usr/src/debug/dropbear/2026.91/src/cli-authinteract.c /usr/src/debug/dropbear/2026.91/src/gened25519.c /usr/src/debug/dropbear/2026.91/src/keyimport.h /usr/src/debug/dropbear/2026.91/src/sk-ed25519.c /usr/src/debug/dropbear/2026.91/src/keyimport.c /usr/src/debug/dropbear/2026.91/src/gened25519.h /usr/src/debug/dropbear/2026.91/src/sk-ed25519.h /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_to_radix.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_div_3.c /usr/src/debug/dropbear/2026.91/libtommath/tommath.h /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_dr_is_modulus.c /usr/src/debug/dropbear/2026.91/src/session.h /usr/src/debug/dropbear/2026.91/src/kex-dh.c /usr/src/debug/dropbear/2026.91/src/circbuffer.c /usr/src/debug/dropbear/2026.91/libtommath/bn_prime_tab.c /usr/src/debug/dropbear/2026.91/src/cli-channel.c /usr/src/debug/dropbear/2026.91/src/circbuffer.h /usr/src/debug/dropbear/2026.91/
 libtommath/bn_mp_sqr.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_exch.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_zero.c /usr/src/debug/dropbear/2026.91/src/curve25519.c /usr/src/debug/dropbear/2026.91/src/curve25519.h /usr/src/debug/dropbear/2026.91/src/cli-main.c /usr/src/debug/dropbear/2026.91/src/svr-main.c /usr/src/debug/dropbear/2026.91/src/bignum.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_sub_d.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_mod_d.c /usr/src/debug/dropbear/2026.91/src/bignum.h /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_to_ubin.c /usr/src/debug/dropbear/2026.91/src/buffer.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_neg.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_rshd.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_prime_rabin_miller_trials.c /usr/src/debug/dropbear/2026.91/libtommath/bn_s_mp_sqr_fast.c /usr/src/debug/dropbear/2026.91/libtommath/bn_s_mp_sub.c /usr/src/debug/dropbear/2026.91/src/buffer.h /usr/src/d
 ebug/dropbear/2026.91/src/common-channel.c /usr/src/debug/dropbear/2026.91/src/common-chansession.c /usr/src/debug/dropbear/2026.91/src/dbhelpers.c /usr/src/debug/dropbear/2026.91/src/forward.h /usr/src/debug/dropbear/2026.91/src/cli-authpasswd.c /usr/src/debug/dropbear/2026.91/src/chachapoly.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_rand.c /usr/src/debug/dropbear/2026.91/src/dbhelpers.h /usr/src/debug/dropbear/2026.91/src/chachapoly.h /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_reduce_2k_l.c /usr/src/debug/dropbear/2026.91/libtommath/bn_s_mp_balance_mul.c /usr/src/debug/dropbear/2026.91/libtommath/bn_s_mp_add.c /usr/src/debug/dropbear/2026.91/libtommath/bn_s_mp_sqr.c /usr/src/debug/dropbear/2026.91/src/algo.h /usr/src/debug/dropbear/2026.91/src/auth.h /usr/src/debug/dropbear/2026.91/src/kex-pqhybrid.c /usr/src/debug/dropbear/2026.91/src/list.h /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_clear.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_lshd.c /usr/src/debu
 g/dropbear/2026.91/src/scpmisc.h /usr/src/debug/dropbear/2026.91/src/list.c /usr/src/debug/dropbear/2026.91/src/scpmisc.c /usr/src/debug/dropbear/2026.91/src/kex-x25519.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_prime_is_prime.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_dr_setup.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_div_2.c /usr/src/debug/dropbear/2026.91/libtommath/tommath_private.h /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_cmp.c /usr/src/debug/dropbear/2026.91/src/channel.h /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_clear_multi.c /usr/src/debug/dropbear/2026.91/src/kex-ecdh.c /usr/src/debug/dropbear/2026.91/src/listener.h /usr/src/debug/dropbear/2026.91/src/packet.h /usr/src/debug/dropbear/2026.91/src/packet.c /usr/src/debug/dropbear/2026.91/src/listener.c /usr/src/debug/dropbear/2026.91/src/crypto_desc.c /usr/src/debug/dropbear/2026.91/src/termcodes.c /usr/src/debug/dropbear/2026.91/libtommath/bn_cutoffs.c /usr/src/debug/dropbear/2026.91/l
 ibtommath/bn_mp_radix_smap.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_montgomery_setup.c /usr/src/debug/dropbear/2026.91/src/crypto_desc.h /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_count_bits.c /usr/src/debug/dropbear/2026.91/src/termcodes.h /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_mod_2d.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_mul_2d.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_mulmod.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_addmod.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_invmod.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_is_square.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_reduce_is_2k.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_set_ul.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_sqrmod.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_submod.c /usr/src/debug/dropbear/2026.91/src/svr-forward.c /usr/src/debug/dropbear/2026.91/libtommath/bn_s_mp_reverse.c /usr/src/debug/dropbear/2026.91/libtomma
 th/bn_mp_init_copy.c /usr/src/debug/dropbear/2026.91/src/sntrup761_compat.h /usr/src/debug/dropbear/2026.91/src/ltc_prng.h /usr/src/debug/dropbear/2026.91/src/common-runopts.c /usr/src/debug/dropbear/2026.91/src/ltc_prng.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_sqrt.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_prime_miller_rabin.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_set.c /usr/src/debug/dropbear/2026.91/src/netio.c /usr/src/debug/dropbear/2026.91/src/dropbearconvert.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_mul_d.c /usr/src/debug/dropbear/2026.91/src/netio.h /usr/src/debug/dropbear/2026.91/src/cli-agentfwd.c /usr/src/debug/dropbear/2026.91/src/svr-agentfwd.c /usr/src/debug/dropbear/2026.91/src/ed25519.c /usr/src/debug/dropbear/2026.91/src/x11fwd.h /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_div_d.c /usr/src/debug/dropbear/2026.91/src/cli-runopts.c /usr/src/debug/dropbear/2026.91/src/gensignkey.h /usr/src/debug/dropbear/2026.91/src/svr-runop
 ts.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_init_multi.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_prime_next_prime.c /usr/src/debug/dropbear/2026.91/src/libcrux_mlkem768_sha3.h /usr/src/debug/dropbear/2026.91/src/ed25519.h /usr/src/debug/dropbear/2026.91/src/svr-x11fwd.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_montgomery_calc_normalization.c /usr/src/debug/dropbear/2026.91/src/gensignkey.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_gcd.c /usr/src/debug/dropbear/2026.91/src/sntrup761.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_init_u32.c /usr/src/debug/dropbear/2026.91/libtommath/bn_s_mp_mul_digs.c /usr/src/debug/dropbear/2026.91/src/sntrup761.h /usr/src/debug/dropbear/2026.91/src/dbutil.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_grow.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_sub.c /usr/src/debug/dropbear/2026.91/src/dbutil.h /usr/src/debug/dropbear/2026.91/libtommath/bn_s_mp_exptmod.c /usr/src/debug/dropbear/2026.91/src/servic
 e.h /usr/src/debug/dropbear/2026.91/src/common-kex.c /usr/src/debug/dropbear/2026.91/libtommath/bn_s_mp_invmod_fast.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_init.c /usr/src/debug/dropbear/2026.91/src/ecc.h /usr/src/debug/dropbear/2026.91/src/kex.h /usr/src/debug/dropbear/2026.91/src/rsa.h /usr/src/debug/dropbear/2026.91/src/signkey.c /usr/src/debug/dropbear/2026.91/src/signkey.h /usr/src/debug/dropbear/2026.91/src/scp.c /usr/src/debug/dropbear/2026.91/src/ecc.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_abs.c /usr/src/debug/dropbear/2026.91/src/rsa.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_set_u32.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_set_u64.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_cnt_lsb.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_cmp_mag.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_exptmod.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_get_i32.c /usr/src/debug/dropbear/2026.91/src/process-packet.c /usr/src/debug/dr
 opbear/2026.91/libtommath/bn_mp_clamp.c /usr/src/debug/dropbear/2026.91/src/cli-session.c /usr/src/debug/dropbear/2026.91/src/svr-service.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_mod.c /usr/src/debug/dropbear/2026.91/src/svr-session.c /usr/src/debug/dropbear/2026.91/src/cli-chansession.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_div.c /usr/src/debug/dropbear/2026.91/src/chansession.h /usr/src/debug/dropbear/2026.91/src/svr-chansession.c /usr/src/debug/dropbear/2026.91/src/tcp-accept.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_read_radix.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_mul.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_reduce_is_2k_l.c /usr/src/debug/dropbear/2026.91/src/runopts.h /usr/src/debug/dropbear/2026.91/src/common-session.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_dr_reduce.c /usr/src/debug/dropbear/2026.91/src/agentfwd.h /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_copy.c /usr/src/debug/dropbear/2026.91/libtommath/b
 n_mp_reduce_setup.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_reduce_2k_setup_l.c /usr/src/debug/dropbear/2026.91/src/common-algo.c /usr/src/debug/dropbear/2026.91/libtommath/bn_s_mp_mul_digs_fast.c /usr/src/debug/dropbear/2026.91/libtommath/bn_s_mp_mul_high_digs.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_reduce_2k_setup.c /usr/src/debug/dropbear/2026.91/src/atomicio.h /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_reduce_2k.c /usr/src/debug/dropbear/2026.91/src/sshpty.c /usr/src/debug/dropbear/2026.91/src/atomicio.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_get_mag_u32.c /usr/src/debug/dropbear/2026.91/src/svr-authpubkeyoptions.c /usr/src/debug/dropbear/2026.91/src/sshpty.h"
packages/x86-64-v3-poky-linux/dropbear/dropbear-src: PV changed from "2025.89" to "2026.91"
packages/x86-64-v3-poky-linux/dropbear/dropbear-staticdev: PKGV changed from 2025.89 [default] to 2026.91 [default]
packages/x86-64-v3-poky-linux/dropbear/dropbear-staticdev: PV changed from "2025.89" to "2026.91"
packages/x86-64-v3-poky-linux/dropbear/dropbear: PKGSIZE changed from 439406 to 447598 (+2%)
packages/x86-64-v3-poky-linux/dropbear/dropbear: PKGV changed from 2025.89 [default] to 2026.91 [default]
packages/x86-64-v3-poky-linux/dropbear/dropbear: PV changed from "2025.89" to "2026.91"
packages/x86-64-v3-poky-linux/dropbear: SRC_URI changed from "http://matt.ucc.asn.au/dropbear/releases/dropbear-2025.89.tar.bz2 file://0001-urandom-xauth-changes-to-options.h.patch file://init file://dropbearkey.service file://dropbear@.service file://dropbear.socket file://dropbear.default file://0005-dropbear-enable-pam.patch file://0006-dropbear-configuration-file.patch file://dropbear" to "http://matt.ucc.asn.au/dropbear/releases/dropbear-2026.91.tar.bz2 file://0001-urandom-xauth-changes-to-options.h.patch file://init file://dropbearkey.service file://dropbear@.service file://dropbear.socket file://dropbear.default file://0005-dropbear-enable-pam.patch file://0006-dropbear-configuration-file.patch file://dropbear"
packages/x86-64-v3-poky-linux/dropbear: PKGV changed from 2025.89 [default] to 2026.91 [default]
packages/x86-64-v3-poky-linux/dropbear: PV changed from "2025.89" to "2026.91"

--===============2335846513502146288==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dropbear-upgrade-2025.89-2026.91.patch"

RnJvbSAwMTA1MDE0MDM3NTZkM2ZiMzk3NTNiNTQ1M2VkOTViZTNmODE0NzVmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMDg6Mjk6NTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
cm9wYmVhcjogdXBncmFkZSAyMDI1Ljg5IC0+IDIwMjYuOTEKCi0tLQogLi4uLzAwMDEtdXJhbmRv
bS14YXV0aC1jaGFuZ2VzLXRvLW9wdGlvbnMuaC5wYXRjaCAgICAgICAgIHwgNiArKystLS0KIC4u
Li9kcm9wYmVhci9kcm9wYmVhci8wMDA1LWRyb3BiZWFyLWVuYWJsZS1wYW0ucGF0Y2ggICAgICB8
IDggKysrKy0tLS0KIC4uLi9kcm9wYmVhci8wMDA2LWRyb3BiZWFyLWNvbmZpZ3VyYXRpb24tZmls
ZS5wYXRjaCAgICAgICB8IDIgKy0KIC4uLi9kcm9wYmVhci97ZHJvcGJlYXJfMjAyNS44OS5iYiA9
PiBkcm9wYmVhcl8yMDI2LjkxLmJifSB8IDIgKy0KIDQgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRp
b25zKCspLCA5IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb3JlL2Ryb3BiZWFy
L3tkcm9wYmVhcl8yMDI1Ljg5LmJiID0+IGRyb3BiZWFyXzIwMjYuOTEuYmJ9ICg5OCUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZHJvcGJlYXIvZHJvcGJlYXIvMDAwMS11cmFuZG9t
LXhhdXRoLWNoYW5nZXMtdG8tb3B0aW9ucy5oLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvZHJv
cGJlYXIvZHJvcGJlYXIvMDAwMS11cmFuZG9tLXhhdXRoLWNoYW5nZXMtdG8tb3B0aW9ucy5oLnBh
dGNoCmluZGV4IGE2NjIyMzBiODguLjkzNzRhYTNhZTIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1jb3JlL2Ryb3BiZWFyL2Ryb3BiZWFyLzAwMDEtdXJhbmRvbS14YXV0aC1jaGFuZ2VzLXRvLW9w
dGlvbnMuaC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9kcm9wYmVhci9kcm9wYmVhci8w
MDAxLXVyYW5kb20teGF1dGgtY2hhbmdlcy10by1vcHRpb25zLmgucGF0Y2gKQEAgLTEsNCArMSw0
IEBACi1Gcm9tIGNkYzZhNGE1N2E4NmQ4MTE2YTkyYTVkOTA1OTkzZTY1Y2Y3MjM1NTYgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDNlOWQyN2UxMjhmZTQ1YTkyZTA1OTU5MGJjNDc1Yzlk
MGUxZjRmYjQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8
cmljaGFyZEBvcGVuZWRoYW5kLmNvbT4KIERhdGU6IFdlZCwgMzEgQXVnIDIwMDUgMTA6NDU6NDcg
KzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gdXJhbmRvbS14YXV0aC1jaGFuZ2VzLXRvLW9wdGlvbnMu
aApAQCAtOSwxMCArOSwxMCBAQCBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW2NvbmZp
Z3VyYXRpb25dCiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiAKIGRpZmYgLS1naXQgYS9zcmMvZGVmYXVsdF9vcHRpb25zLmggYi9zcmMvZGVmYXVsdF9vcHRp
b25zLmgKLWluZGV4IDZlOTcwYmIuLmNjYzhiNDcgMTAwNjQ0CitpbmRleCBlNDlkYzcwLi5jNWEy
OGE4IDEwMDY0NAogLS0tIGEvc3JjL2RlZmF1bHRfb3B0aW9ucy5oCiArKysgYi9zcmMvZGVmYXVs
dF9vcHRpb25zLmgKLUBAIC0zMjMsNyArMzIzLDcgQEAgZ3JvdXAxIGluIERyb3BiZWFyIHNlcnZl
ciB0b28gKi8KK0BAIC0zNDcsNyArMzQ3LDcgQEAgZ3JvdXAxIGluIERyb3BiZWFyIHNlcnZlciB0
b28gKi8KICAKICAvKiBUaGUgY29tbWFuZCB0byBpbnZva2UgZm9yIHhhdXRoIHdoZW4gdXNpbmcg
WDExIGZvcndhcmRpbmcuCiAgICogIi1xIiBmb3IgcXVpZXQgKi8KZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1jb3JlL2Ryb3BiZWFyL2Ryb3BiZWFyLzAwMDUtZHJvcGJlYXItZW5hYmxlLXBhbS5w
YXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL2Ryb3BiZWFyL2Ryb3BiZWFyLzAwMDUtZHJvcGJlYXIt
ZW5hYmxlLXBhbS5wYXRjaAppbmRleCA2NzQzZjUwNmU5Li5hNDkyMzM1MWU4IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtY29yZS9kcm9wYmVhci9kcm9wYmVhci8wMDA1LWRyb3BiZWFyLWVuYWJs
ZS1wYW0ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZHJvcGJlYXIvZHJvcGJlYXIvMDAw
NS1kcm9wYmVhci1lbmFibGUtcGFtLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAyNTNjYTAx
ZjBmYzUwZGJhZWIyZmY4YmNlY2UwYzM0MjU2ZWJhOTRmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSA0OTRiOTg4NjkwODhmODI3M2UwMTM5ZDg5MGYwZWZlZDE1YTViNzRlIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSnVzc2kgS3Vra29uZW4gPGp1c3NpLmt1a2tvbmVuQGlu
dGVsLmNvbT4KIERhdGU6IFdlZCwgMiBEZWMgMjAxNSAxMTozNjowMiArMDIwMAogU3ViamVjdDog
W1BBVENIXSBFbmFibGUgcGFtCkBAIC0xNSwxMCArMTUsMTAgQEAgU2lnbmVkLW9mZi1ieTogSnVz
c2kgS3Vra29uZW4gPGp1c3NpLmt1a2tvbmVuQGludGVsLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvc3JjL2RlZmF1
bHRfb3B0aW9ucy5oIGIvc3JjL2RlZmF1bHRfb3B0aW9ucy5oCi1pbmRleCBjY2M4YjQ3Li4xMjc2
OGQxIDEwMDY0NAoraW5kZXggYzVhMjhhOC4uYTk4MDJlNSAxMDA2NDQKIC0tLSBhL3NyYy9kZWZh
dWx0X29wdGlvbnMuaAogKysrIGIvc3JjL2RlZmF1bHRfb3B0aW9ucy5oCi1AQCAtMjI4LDcgKzIy
OCw3IEBAIGdyb3VwMSBpbiBEcm9wYmVhciBzZXJ2ZXIgdG9vICovCitAQCAtMjQwLDcgKzI0MCw3
IEBAIGdyb3VwMSBpbiBEcm9wYmVhciBzZXJ2ZXIgdG9vICovCiAgCiAgLyogQXV0aGVudGljYXRp
b24gVHlwZXMgLSBhdCBsZWFzdCBvbmUgcmVxdWlyZWQuCiAgICAgUkZDIERyYWZ0IHJlcXVpcmVz
IHB1YmtleSBhdXRoLCBhbmQgcmVjb21tZW5kcyBwYXNzd29yZCAqLwpAQCAtMjcsNyArMjcsNyBA
QCBpbmRleCBjY2M4YjQ3Li4xMjc2OGQxIDEwMDY0NAogIAogIC8qIE5vdGU6IFBBTSBhdXRoIGlz
IHF1aXRlIHNpbXBsZSBhbmQgb25seSB3b3JrcyBmb3IgUEFNIG1vZHVsZXMgd2hpY2gganVzdCBk
bwogICAqIGEgc2ltcGxlICJMb2dpbjogIiAiUGFzc3dvcmQ6ICIgKHlvdSBjYW4gZWRpdCB0aGUg
c3RyaW5ncyBpbiBzdnItYXV0aHBhbS5jKS4KLUBAIC0yMzYsNyArMjM2LDcgQEAgZ3JvdXAxIGlu
IERyb3BiZWFyIHNlcnZlciB0b28gKi8KK0BAIC0yNDgsNyArMjQ4LDcgQEAgZ3JvdXAxIGluIERy
b3BiZWFyIHNlcnZlciB0b28gKi8KICAgKiBidXQgdGhlcmUncyBhbiBpbnRlcmZhY2UgdmlhIGEg
UEFNIG1vZHVsZS4gSXQgd29uJ3Qgd29yayBmb3IgbW9yZSBjb21wbGV4CiAgICogUEFNIGNoYWxs
ZW5nZS9yZXNwb25zZS4KICAgKiBZb3UgY2FuJ3QgZW5hYmxlIGJvdGggUEFTU1dPUkQgYW5kIFBB
TS4gKi8KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2Ryb3BiZWFyL2Ryb3BiZWFyLzAw
MDYtZHJvcGJlYXItY29uZmlndXJhdGlvbi1maWxlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUv
ZHJvcGJlYXIvZHJvcGJlYXIvMDAwNi1kcm9wYmVhci1jb25maWd1cmF0aW9uLWZpbGUucGF0Y2gK
aW5kZXggNDQ4NjEwODhjYy4uNGE2ZjNhZWYwNCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNv
cmUvZHJvcGJlYXIvZHJvcGJlYXIvMDAwNi1kcm9wYmVhci1jb25maWd1cmF0aW9uLWZpbGUucGF0
Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZHJvcGJlYXIvZHJvcGJlYXIvMDAwNi1kcm9wYmVh
ci1jb25maWd1cmF0aW9uLWZpbGUucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDE2YjE0N2Y5
N2YwOTM4Y2RkYjU1ZWMxYzkwYmM5MTljMTNmMjZmYzAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tIGRhMjljODc5M2QyZTM1ZDA0YTc3MmNhMWMwYTU1MzBhYmQ0NWYwZWMgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCiBGcm9tOiBNaW5nbGkgWXUgPE1pbmdsaS5ZdUB3aW5kcml2ZXIuY29t
PgogRGF0ZTogVGh1LCA2IFNlcCAyMDE4IDE1OjU0OjAwICswODAwCiBTdWJqZWN0OiBbUEFUQ0hd
IGRyb3BiZWFyIGNvbmZpZ3VyYXRpb24gZmlsZQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNv
cmUvZHJvcGJlYXIvZHJvcGJlYXJfMjAyNS44OS5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL2Ryb3Bi
ZWFyL2Ryb3BiZWFyXzIwMjYuOTEuYmIKc2ltaWxhcml0eSBpbmRleCA5OCUKcmVuYW1lIGZyb20g
bWV0YS9yZWNpcGVzLWNvcmUvZHJvcGJlYXIvZHJvcGJlYXJfMjAyNS44OS5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWNvcmUvZHJvcGJlYXIvZHJvcGJlYXJfMjAyNi45MS5iYgppbmRleCBlY2Uw
NjUyNjVmLi44MjZhNjkxYjA0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9kcm9wYmVh
ci9kcm9wYmVhcl8yMDI1Ljg5LmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2Ryb3BiZWFyL2Ry
b3BiZWFyXzIwMjYuOTEuYmIKQEAgLTIzLDcgKzIzLDcgQEAgU1JDX1VSSSA9ICJodHRwOi8vbWF0
dC51Y2MuYXNuLmF1L2Ryb3BiZWFyL3JlbGVhc2VzL2Ryb3BiZWFyLSR7UFZ9LnRhci5iejIgXAog
ICAgICAgICAgICAke0BiYi51dGlscy5jb250YWlucygnRElTVFJPX0ZFQVRVUkVTJywgJ3BhbScs
ICcke1BBTV9TUkNfVVJJfScsICcnLCBkKX0gXAogICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hh
MjU2c3VtXSA9ICIwZDFmN2NhNzExY2ZjMzM2ZGM4YTg1ZTY3MmNhYjljZmQ4MjIzYTAyZmUyZGEw
YTRhN2FlYjU4YzllMTEzNjM0IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImRlZmE5MjQ0NzVhYmY2
YmMxZTc0YWJjMDAxNzNlNDZiZmRjODA0YmQ0N2NhYWZhMTRmNWE0ZWYwY2M3NmRhMzQiCiBNSVJS
T1JTICs9ICJodHRwOi8vbWF0dC51Y2MuYXNuLmF1L2Ryb3BiZWFyL3JlbGVhc2VzLyBodHRwczov
L2Ryb3BiZWFyLm5sL21pcnJvci9yZWxlYXNlcy8iCiAKIFBBTV9TUkNfVVJJID0gImZpbGU6Ly8w
MDA1LWRyb3BiZWFyLWVuYWJsZS1wYW0ucGF0Y2ggXAotLSAKMi40Ny4xCgo=

--===============2335846513502146288==--

