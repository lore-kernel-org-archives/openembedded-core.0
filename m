Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 324B8C53200
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 05:43:13 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13277.1784871785769885949
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 22:43:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=J9+ntCGb;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=rSfk1yPE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019f92a6103d-1b1d1884-203a-4c0f-89e0-ebb803212e3c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1784871785;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=u41DOx5X/GybjE2U6ntQ93IUTeUBHMTbf1/3WZSLq9w=;
	b=J9+ntCGbyl9wknrQOgYsX+3RpoDxT06TApgEkf0QGIzAjr7ncggDQg9wu+MuvxXG
	CLym3n9Ic51cQpTF/afsqCZQYj6VpJPxW7UDK8dLT0wuHYM26xBF9yUUjGN2Y+ul9JG
	Is36FOKxg+g/OEXwAEz+NChc8VkHJf8fgWnZhGrI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1784871785;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=u41DOx5X/GybjE2U6ntQ93IUTeUBHMTbf1/3WZSLq9w=;
	b=rSfk1yPEi2TSTI+MoI6mRRe9AD6armAvnCK7pTYmUKvVQ+tgi4kq/wTW52BnblAU
	bxaqWAMXIBUWf+88MmW5hcGzULsUaSqq0ZDvt8fjkNCbg1lP2Y4+k6SEdy+QGQECgAW
	kk8fbE9v/K0/92Bulqtn4c95UfORhdd/s8/WMJw8=
Content-Type: multipart/mixed; boundary="===============2995961614592280671=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gnupg: upgrading to 2.5.21 SUCCEEDED
Message-ID: <0101019f92a6103d-1b1d1884-203a-4c0f-89e0-ebb803212e3c-000000@us-west-2.amazonses.com>
Date: Fri, 24 Jul 2026 05:43:04 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.24-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 05:43:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241896

--===============2995961614592280671==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gnupg* to *2.5.21* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gnupg-upgrade-2.5.20-2.5.21.patch
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
From cbb4c197516cff9f1a59025545b93183e62b7013 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 24 Jul 2026 05:40:12 +0000
Subject: [PATCH] gnupg: upgrade 2.5.20 -> 2.5.21

Source: ChangeLog

2026-07-02  Werner Koch  <wk@gnupg.org>

	Release 2.5.21.
	+ commit 363096d9c9a973ac8dcad8ee4efd479f50add290

2026-06-30  Werner Koch  <wk@gnupg.org>

	speedo: Create a pkgversioninfo.txt file.
	+ commit 8716b4dac4a79b600d18847b8bc0193bd06e1fc1
	* build-aux/mk-sbom.sh: New.  Taken from gpg4win and extended.
	* Makefile.am (EXTRA_DIST): Add it.
	* build-aux/speedo.mk (gnupg_ver_this): Use sed to extract version.
	(gnupg_commit_id): new.
	(00-unpack): Call mk-sbom.sh.
	(clean-pkg-versions: Clear version files.
	($(bdir)/pkgversioninfo.txt): New.
	(all-speedo,installer): Depend on above.
	(dist-source): Exclude autom4te.cache just in case
	* build-aux/speedo/w32/inst.nsi: Install pkgversioninfo.txt.

2026-06-30  NIIBE Yutaka  <gniibe@fsij.org>

	scd: Fix condition to retrieve ATR.
	+ commit ca25a7a61bebbe4e27dd5568c5b049675b7aa4ae
	* scd/app.c (atr_to_cardtype): Call apdu_get_atr when ATR is NULL.

2026-06-29  Werner Koch  <wk@gnupg.org>

	speedo: Fix passing configure args to w32 builds.
	+ commit 7af73849a5dbbc5c70e43c3a3f5d70c639c80ab4
	* build-aux/speedo.mk (pkgcfg): Use correct number of dollar signs.

	common: Prepare to get rid of map_w32_to_errno.
	+ commit bf808091534f587e8cdacf351b0e7ba060165fd8
	* common/sysutils.c (gnupg_w32_set_errno): Use gpgrt function if
	  available.

	agent: Make batch import of Kyber keys work.
	+ commit 4fca79b67bba04bc5ef2a4402e948c01821ceac5
	* agent/command.c (cmd_import_key): Allow --unattended also for
	  composite keys.

2026-06-26  NIIBE Yutaka  <gniibe@fsij.org>

	dirmngr: Add a validation check in get_dns_cert_standard.
	+ commit c3ec7678799a161b9265969e7ad3fd59605b18ab
	* dirmngr/dns-stuff.c (get_dns_cert_standard): Validate the length.

2026-06-19  NIIBE Yutaka  <gniibe@fsij.org>

	build: Update ldap.m4 for POSIX with no LDAP_DEPRECATED.
	+ commit d3822099fdd4d84323afae4bacaadfeab9cb3e27
	* m4/ldap.m4: Check ldap_err2string, instead.

2026-06-18  Werner Koch  <wk@gnupg.org>

	gpgsm: Require a minimum tag length for GCM decryption.
	+ commit 4c7e68cf3d335328821bdbb70db309a60d0e4fd4
	* sm/decrypt.c (gpgsm_decrypt): Require a minimum authtaglen.

2026-06-18  NIIBE Yutaka  <gniibe@fsij.org>

	w32:common: Fix usleep in w32_wait_when_sharing_violation.
	+ commit ab9ce5f5e775a3a6a37923299685ac371f740103
	* common/sysutils.c (w32_wait_when_sharing_violation): WTIME is
	in milliseconds.

2026-06-17  Philip Le  <philip.le@gnupg.com>

	gpg: Fix copy_signature.
	+ commit 56e11ffe971d5cc58185b4e8d02b82dc432c634b
	* g10/free-packet.c (copy_signature): Set the signers_uid of the new
	copy to NULL if it is not present in the source signature.

	gpg: Use the INT_RCP_FPR subpacket in revocation signatures.
	+ commit 9e0e5547d2a008332873a9b632f82f9414ad887f
	* common/openpgpdefs.h (sigsubpkttype_t): Add Intended Recipient
	Fingerprint signature subpacket.
	* g10/build-packet.c (build_sig_subpkt): Build the Intended Recipient
	Fingerprint signature subpacket for v4 and v5 keys.
	* g10/free-packet.c (fre

[Changelog truncated as it exceeds 3000 characters;
the full changelog can be found in an attachment to the AUH email]
---
 ...erride-init-is-not-needed-with-gcc-9.patch |  2 +-
 ...-a-custom-value-for-the-location-of-.patch |  6 +--
 ...use-pkgconfig-instead-of-npth-config.patch |  2 +-
 .../gnupg/gnupg/CVE-2026-57062.patch          | 43 -------------------
 .../gnupg/gnupg/relocate.patch                | 18 ++++----
 .../{gnupg_2.5.20.bb => gnupg_2.5.21.bb}      |  4 +-
 6 files changed, 16 insertions(+), 59 deletions(-)
 delete mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2026-57062.patch
 rename meta/recipes-support/gnupg/{gnupg_2.5.20.bb => gnupg_2.5.21.bb} (95%)

diff --git a/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch b/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
index b48db40970..7a3fa59c54 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
@@ -1,4 +1,4 @@
-From 9b7ef8aa1a5d71fc95f36a92874d3faa4579fc4e Mon Sep 17 00:00:00 2001
+From 46db1301b1b71f47aa131b9a3de9d1cf356cf408 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 20 Dec 2018 17:37:48 -0800
 Subject: [PATCH] Woverride-init is not needed with gcc 9
diff --git a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
index bfee9c9904..1c7cd7ba7b 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
@@ -1,4 +1,4 @@
-From 84a16d46a72a2501cbe3a4a83ea7f8393ada4038 Mon Sep 17 00:00:00 2001
+From fd060f524e50c7c3f8694f71630ac151627235f1 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 22 Jan 2018 18:00:21 +0200
 Subject: [PATCH] configure.ac: use a custom value for the location of
@@ -13,10 +13,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 023604b..c84442c 100644
+index 5ac4d0b..09615c5 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1908,7 +1908,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
+@@ -1909,7 +1909,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
  
  AC_DEFINE_UNQUOTED(GPGTAR_NAME, "gpgtar", [The name of the gpgtar tool])
  
diff --git a/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch b/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
index 90d53674d4..f4c9b2161a 100644
--- a/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
+++ b/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
@@ -1,4 +1,4 @@
-From 0c3a09a95875e5744a910a0d3c93fa2e9dbe8c69 Mon Sep 17 00:00:00 2001
+From b8a99b2d9caa05f54be25635e3b1687753fe7196 Mon Sep 17 00:00:00 2001
 From: Saul Wold <sgw@linux.intel.com>
 Date: Wed, 16 Aug 2017 11:16:30 +0800
 Subject: [PATCH] use pkgconfig instead of npth config
diff --git a/meta/recipes-support/gnupg/gnupg/CVE-2026-57062.patch b/meta/recipes-support/gnupg/gnupg/CVE-2026-57062.patch
deleted file mode 100644
index f298b6e9a8..0000000000
--- a/meta/recipes-support/gnupg/gnupg/CVE-2026-57062.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From d586f50ee849c8cbeaea47b50c64446c1becbf9b Mon Sep 17 00:00:00 2001
-From: Werner Koch <wk@gnupg.org>
-Date: Thu, 18 Jun 2026 10:51:34 +0200
-Subject: [PATCH] gpgsm: Require a minimum tag length for GCM decryption.
-
-* sm/decrypt.c (gpgsm_decrypt): Require a minimum authtaglen.
---
-
-Reported-by: Thai Duong <thai@calif.io>
-This is similar to OpenSSL's
-CVE-id: CVE-2026-34182
-
-CVE: CVE-2026-57062
-Upstream-Status: Backport [https://github.com/gpg/gnupg/commit/4c7e68cf3d335328821bdbb70db309a60d0e4fd4]
-
-Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
----
- sm/decrypt.c | 9 ++++++++-
- 1 file changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/sm/decrypt.c b/sm/decrypt.c
-index 20fb96060..92a33c6e6 100644
---- a/sm/decrypt.c
-+++ b/sm/decrypt.c
-@@ -1447,7 +1447,14 @@ gpgsm_decrypt (ctrl_t ctrl, estream_t in_fp, estream_t out_fp)
-                 }
-               if (DBG_CRYPTO)
-                 log_printhex (authtag, authtaglen, "Authtag ...:");
--              rc = gcry_cipher_checktag (dfparm.hd, authtag, authtaglen);
-+              if (authtaglen < 12)
-+                {
-+                  log_info ("authentication tag is too short (%zu octets)\n",
-+                            authtaglen);
-+                  rc = gpg_error (GPG_ERR_CHECKSUM);
-+                }
-+              else
-+                rc = gcry_cipher_checktag (dfparm.hd, authtag, authtaglen);
-               xfree (authtag);
-               if (rc)
-                 log_error ("data is not authentic: %s\n", gpg_strerror (rc));
--- 
-2.34.1
-
diff --git a/meta/recipes-support/gnupg/gnupg/relocate.patch b/meta/recipes-support/gnupg/gnupg/relocate.patch
index fedb7f6407..02f03386ec 100644
--- a/meta/recipes-support/gnupg/gnupg/relocate.patch
+++ b/meta/recipes-support/gnupg/gnupg/relocate.patch
@@ -1,4 +1,4 @@
-From 8d7658741da050f604bcf26f8a6c24a0b15df94b Mon Sep 17 00:00:00 2001
+From c70694bd3e71cc1fec6ccb3ea0f694c3863ebd48 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Wed, 19 Sep 2018 14:44:40 +0100
 Subject: [PATCH] Allow the environment to override where gnupg looks for its
@@ -13,10 +13,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 7 insertions(+), 7 deletions(-)
 
 diff --git a/common/homedir.c b/common/homedir.c
-index d26ddd9..24224c0 100644
+index 835f0ea..0a67a33 100644
 --- a/common/homedir.c
 +++ b/common/homedir.c
-@@ -1451,7 +1451,7 @@ gnupg_socketdir (void)
+@@ -1526,7 +1526,7 @@ gnupg_socketdir (void)
    if (!name)
      {
        unsigned int dummy;
@@ -25,7 +25,7 @@ index d26ddd9..24224c0 100644
        gpgrt_annotate_leaked_object (name);
      }
  
-@@ -1480,7 +1480,7 @@ gnupg_sysconfdir (void)
+@@ -1555,7 +1555,7 @@ gnupg_sysconfdir (void)
    if (dir)
      return dir;
    else
@@ -34,7 +34,7 @@ index d26ddd9..24224c0 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1516,7 +1516,7 @@ gnupg_bindir (void)
+@@ -1591,7 +1591,7 @@ gnupg_bindir (void)
        return name;
      }
    else
@@ -43,7 +43,7 @@ index d26ddd9..24224c0 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1543,7 +1543,7 @@ gnupg_libexecdir (void)
+@@ -1618,7 +1618,7 @@ gnupg_libexecdir (void)
        return name;
      }
    else
@@ -52,7 +52,7 @@ index d26ddd9..24224c0 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1573,7 +1573,7 @@ gnupg_libdir (void)
+@@ -1648,7 +1648,7 @@ gnupg_libdir (void)
        return name;
      }
    else
@@ -61,7 +61,7 @@ index d26ddd9..24224c0 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1604,7 +1604,7 @@ gnupg_datadir (void)
+@@ -1679,7 +1679,7 @@ gnupg_datadir (void)
        return name;
      }
    else
@@ -70,7 +70,7 @@ index d26ddd9..24224c0 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1636,7 +1636,7 @@ gnupg_localedir (void)
+@@ -1711,7 +1711,7 @@ gnupg_localedir (void)
        return name;
      }
    else
diff --git a/meta/recipes-support/gnupg/gnupg_2.5.20.bb b/meta/recipes-support/gnupg/gnupg_2.5.21.bb
similarity index 95%
rename from meta/recipes-support/gnupg/gnupg_2.5.20.bb
rename to meta/recipes-support/gnupg/gnupg_2.5.21.bb
index 4a72d8c8f0..e34c09fc8c 100644
--- a/meta/recipes-support/gnupg/gnupg_2.5.20.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.5.21.bb
@@ -20,13 +20,13 @@ UPSTREAM_CHECK_URI = "https://gnupg.org/ftp/gcrypt/gnupg/"
 SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0002-use-pkgconfig-instead-of-npth-config.patch \
            file://0001-Woverride-init-is-not-needed-with-gcc-9.patch \
-           file://CVE-2026-57062.patch \
+           file://relocate.patch \
            "
 SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-the-location-of-.patch \
                                 file://relocate.patch"
 SRC_URI:append:class-nativesdk = " file://relocate.patch"
 
-SRC_URI[sha256sum] = "6461266e99c308419a379abe6c356d54c214136c4589bd65951091138989ffc6"
+SRC_URI[sha256sum] = "e3af2c8caa46a66a9329fa7c6880af260451914d819595beabc2c26597b31352"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.47.1


--===============2995961614592280671==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gnupg/gnupg-dbg: PV changed from "2.5.20" to "2.5.21"
packages/x86-64-v3-poky-linux/gnupg/gnupg-dbg: PKGSIZE changed from 22341944 to 22317736 (-0%)
packages/x86-64-v3-poky-linux/gnupg/gnupg-dbg: PKGV changed from 2.5.20 [default] to 2.5.21 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-dev: PV changed from "2.5.20" to "2.5.21"
packages/x86-64-v3-poky-linux/gnupg/gnupg-dev: PKGV changed from 2.5.20 [default] to 2.5.21 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-doc: PV changed from "2.5.20" to "2.5.21"
packages/x86-64-v3-poky-linux/gnupg/gnupg-doc: PKGV changed from 2.5.20 [default] to 2.5.21 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-gpg: PV changed from "2.5.20" to "2.5.21"
packages/x86-64-v3-poky-linux/gnupg/gnupg-gpg: PKGSIZE changed from 1743880 to 1752072 (+0%)
packages/x86-64-v3-poky-linux/gnupg/gnupg-gpg: PKGV changed from 2.5.20 [default] to 2.5.21 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-ca: PV changed from "2.5.20" to "2.5.21"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-ca: PKGV changed from 2.5.20 [default] to 2.5.21 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-cs: PV changed from "2.5.20" to "2.5.21"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-cs: PKGV changed from 2.5.20 [default] to 2.5.21 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-da: PV changed from "2.5.20" to "2.5.21"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-da: PKGV changed from 2.5.20 [default] to 2.5.21 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-de: PV changed from "2.5.20" to "2.5.21"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-de: PKGSIZE changed from 248505 to 249118 (+0%)
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-de: PKGV changed from 2.5.20 [default] to 2.5.21 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-el: PV changed from "2.5.20" to "2.5.21"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-el: PKGV changed from 2.5.20 [default] to 2.5.21 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-en+boldquot: PV changed from "2.5.20" to "2.5.21"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-en+boldquot: PKGSIZE changed from 226459 to 226925 (+0%)
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-en+boldquot: PKGV changed from 2.5.20 [default] to 2.5.21 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-en+quot: PV changed from "2.5.20" to "2.5.21"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-en+quot: PKGSIZE changed from 224051 to 224509 (+0%)
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-en+quot: PKGV changed from 2.5.20 [default] to 2.5.21 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-eo: PV changed from "2.5.20" to "2.5.21"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-eo: PKGV changed from 2.5.20 [default] to 2.5.21 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-es: PV changed from "2.5.20" to "2.5.21"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-es: PKGV changed from 2.5.20 [default] to 2.5.21 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-et: PV changed from "2.5.20" to "2.5.21"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-et: PKGV changed from 2.5.20 [default] to 2.5.21 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-fi: PV changed from "2.5.20" to "2.5.21"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-fi: PKGV changed from 2.5.20 [default] to 2.5.21 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-fr: PV changed from "2.5.20" to "2.5.21"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-fr: PKGV changed from 2.5.20 [default] to 2.5.21 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-gl: PV changed from "2.5.20" to "2.5.21"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-gl: PKGV changed from 2.5.20 [default] to 2.5.21 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-hu: PV changed from "2.5.20" to "2.5.21"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-hu: PKGV changed from 2.5.20 [default] to 2.5.21 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-id: PV changed from "2.5.20" to "2.5.21"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-id: PKGV changed from 2.5.20 [default] to 2.5.21 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-it: PV changed from "2.5.20" to "2.5.21"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-it: PKGV changed from 2.5.20 [default] to 2.5.21 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-ja: PV changed from "2.5.20" to "2.5.21"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-ja: PKGSIZE changed from 255837 to 256047 (+0%)
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-ja: PKGV changed from 2.5.20 [default] to 2.5.21 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-ka: PV changed from "2.5.20" to "2.5.21"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-ka: PKGV changed from 2.5.20 [default] to 2.5.21 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-nb: PV changed from "2.5.20" to "2.5.21"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-nb: PKGV changed from 2.5.20 [default] to 2.5.21 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-nl: PV changed from "2.5.20" to "2.5.21"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-nl: PKGV changed from 2.5.20 [default] to 2.5.21 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-pl: PV changed from "2.5.20" to "2.5.21"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-pl: PKGV changed from 2.5.20 [default] to 2.5.21 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-pt: PV changed from "2.5.20" to "2.5.21"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-pt: PKGV changed from 2.5.20 [default] to 2.5.21 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-ro: PV changed from "2.5.20" to "2.5.21"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-ro: PKGV changed from 2.5.20 [default] to 2.5.21 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-ru: PV changed from "2.5.20" to "2.5.21"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-ru: PKGV changed from 2.5.20 [default] to 2.5.21 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-sk: PV changed from "2.5.20" to "2.5.21"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-sk: PKGV changed from 2.5.20 [default] to 2.5.21 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-sv: PV changed from "2.5.20" to "2.5.21"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-sv: PKGV changed from 2.5.20 [default] to 2.5.21 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-tr: PV changed from "2.5.20" to "2.5.21"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-tr: PKGV changed from 2.5.20 [default] to 2.5.21 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-uk: PV changed from "2.5.20" to "2.5.21"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-uk: PKGV changed from 2.5.20 [default] to 2.5.21 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-zh-cn: PV changed from "2.5.20" to "2.5.21"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-zh-cn: PKGSIZE changed from 218937 to 218941 (+0%)
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-zh-cn: PKGV changed from 2.5.20 [default] to 2.5.21 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-zh-tw: PV changed from "2.5.20" to "2.5.21"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-zh-tw: PKGV changed from 2.5.20 [default] to 2.5.21 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-src: PV changed from "2.5.20" to "2.5.21"
packages/x86-64-v3-poky-linux/gnupg/gnupg-src: PKGSIZE changed from 9173821 to 9187027 (+0%)
packages/x86-64-v3-poky-linux/gnupg/gnupg-src: PKGV changed from 2.5.20 [default] to 2.5.21 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-src: FILELIST: directory renamed /usr/src/debug/gnupg/2.5.20/regexp -> /usr/src/debug/gnupg/2.5.21/regexp, directory renamed /usr/src/debug/gnupg/2.5.20/kbx -> /usr/src/debug/gnupg/2.5.21/kbx, directory renamed /usr/src/debug/gnupg/2.5.20/dirmngr -> /usr/src/debug/gnupg/2.5.21/dirmngr, directory renamed /usr/src/debug/gnupg/2.5.20/common -> /usr/src/debug/gnupg/2.5.21/common, directory renamed /usr/src/debug/gnupg/2.5.20/tools -> /usr/src/debug/gnupg/2.5.21/tools, directory renamed /usr/src/debug/gnupg/2.5.20/agent -> /usr/src/debug/gnupg/2.5.21/agent, directory renamed /usr/src/debug/gnupg/2.5.20/g10 -> /usr/src/debug/gnupg/2.5.21/g10, directory renamed /usr/src/debug/gnupg/2.5.20/sm -> /usr/src/debug/gnupg/2.5.21/sm, directory renamed /usr/src/debug/gnupg/2.5.20/scd -> /usr/src/debug/gnupg/2.5.21/scd
packages/x86-64-v3-poky-linux/gnupg/gnupg-staticdev: PV changed from "2.5.20" to "2.5.21"
packages/x86-64-v3-poky-linux/gnupg/gnupg-staticdev: PKGV changed from 2.5.20 [default] to 2.5.21 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg: PV changed from "2.5.20" to "2.5.21"
packages/x86-64-v3-poky-linux/gnupg/gnupg: PKGSIZE changed from 4770308 to 4766340 (-0%)
packages/x86-64-v3-poky-linux/gnupg/gnupg: PKGV changed from 2.5.20 [default] to 2.5.21 [default]
packages/x86-64-v3-poky-linux/gnupg: PV changed from "2.5.20" to "2.5.21"
packages/x86-64-v3-poky-linux/gnupg: PKGV changed from 2.5.20 [default] to 2.5.21 [default]
packages/x86-64-v3-poky-linux/gnupg: SRC_URI changed from "https://www.gnupg.org/ftp/gcrypt/gnupg/gnupg-2.5.20.tar.bz2 file://0002-use-pkgconfig-instead-of-npth-config.patch file://0001-Woverride-init-is-not-needed-with-gcc-9.patch file://CVE-2026-57062.patch" to "https://www.gnupg.org/ftp/gcrypt/gnupg/gnupg-2.5.21.tar.bz2 file://0002-use-pkgconfig-instead-of-npth-config.patch file://0001-Woverride-init-is-not-needed-with-gcc-9.patch file://relocate.patch"

--===============2995961614592280671==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gnupg-upgrade-2.5.20-2.5.21.patch"

RnJvbSBjYmI0YzE5NzUxNmNmZjlmMWE1OTAyNTU0NWI5MzE4M2U2MmI3MDEzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMjQgSnVsIDIwMjYgMDU6NDA6MTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
bnVwZzogdXBncmFkZSAyLjUuMjAgLT4gMi41LjIxCgpTb3VyY2U6IENoYW5nZUxvZwoKMjAyNi0w
Ny0wMiAgV2VybmVyIEtvY2ggIDx3a0BnbnVwZy5vcmc+CgoJUmVsZWFzZSAyLjUuMjEuCgkrIGNv
bW1pdCAzNjMwOTZkOWM5YTk3M2FjOGRjYWQ4ZWU0ZWZkNDc5ZjUwYWRkMjkwCgoyMDI2LTA2LTMw
ICBXZXJuZXIgS29jaCAgPHdrQGdudXBnLm9yZz4KCglzcGVlZG86IENyZWF0ZSBhIHBrZ3ZlcnNp
b25pbmZvLnR4dCBmaWxlLgoJKyBjb21taXQgODcxNmI0ZGFjNGE3OWI2MDBkMTg4NDdiOGJjMDE5
M2JkMDZlMWZjMQoJKiBidWlsZC1hdXgvbWstc2JvbS5zaDogTmV3LiAgVGFrZW4gZnJvbSBncGc0
d2luIGFuZCBleHRlbmRlZC4KCSogTWFrZWZpbGUuYW0gKEVYVFJBX0RJU1QpOiBBZGQgaXQuCgkq
IGJ1aWxkLWF1eC9zcGVlZG8ubWsgKGdudXBnX3Zlcl90aGlzKTogVXNlIHNlZCB0byBleHRyYWN0
IHZlcnNpb24uCgkoZ251cGdfY29tbWl0X2lkKTogbmV3LgoJKDAwLXVucGFjayk6IENhbGwgbWst
c2JvbS5zaC4KCShjbGVhbi1wa2ctdmVyc2lvbnM6IENsZWFyIHZlcnNpb24gZmlsZXMuCgkoJChi
ZGlyKS9wa2d2ZXJzaW9uaW5mby50eHQpOiBOZXcuCgkoYWxsLXNwZWVkbyxpbnN0YWxsZXIpOiBE
ZXBlbmQgb24gYWJvdmUuCgkoZGlzdC1zb3VyY2UpOiBFeGNsdWRlIGF1dG9tNHRlLmNhY2hlIGp1
c3QgaW4gY2FzZQoJKiBidWlsZC1hdXgvc3BlZWRvL3czMi9pbnN0Lm5zaTogSW5zdGFsbCBwa2d2
ZXJzaW9uaW5mby50eHQuCgoyMDI2LTA2LTMwICBOSUlCRSBZdXRha2EgIDxnbmlpYmVAZnNpai5v
cmc+CgoJc2NkOiBGaXggY29uZGl0aW9uIHRvIHJldHJpZXZlIEFUUi4KCSsgY29tbWl0IGNhMjVh
N2E2MWJlYmJlNGUyN2RkNTU2OGM1YjA0OTY3NWI3YWE0YWUKCSogc2NkL2FwcC5jIChhdHJfdG9f
Y2FyZHR5cGUpOiBDYWxsIGFwZHVfZ2V0X2F0ciB3aGVuIEFUUiBpcyBOVUxMLgoKMjAyNi0wNi0y
OSAgV2VybmVyIEtvY2ggIDx3a0BnbnVwZy5vcmc+CgoJc3BlZWRvOiBGaXggcGFzc2luZyBjb25m
aWd1cmUgYXJncyB0byB3MzIgYnVpbGRzLgoJKyBjb21taXQgN2FmNzM4NDlhNWRiYmM1YzcwZTQz
YzNhM2Y1ZDcwYzYzOWM4MGFiNAoJKiBidWlsZC1hdXgvc3BlZWRvLm1rIChwa2djZmcpOiBVc2Ug
Y29ycmVjdCBudW1iZXIgb2YgZG9sbGFyIHNpZ25zLgoKCWNvbW1vbjogUHJlcGFyZSB0byBnZXQg
cmlkIG9mIG1hcF93MzJfdG9fZXJybm8uCgkrIGNvbW1pdCBiZjgwODA5MTUzNGY1ODdlOGNkYWNm
MzUxYjBlN2JhMDYwMTY1ZmQ4CgkqIGNvbW1vbi9zeXN1dGlscy5jIChnbnVwZ193MzJfc2V0X2Vy
cm5vKTogVXNlIGdwZ3J0IGZ1bmN0aW9uIGlmCgkgIGF2YWlsYWJsZS4KCglhZ2VudDogTWFrZSBi
YXRjaCBpbXBvcnQgb2YgS3liZXIga2V5cyB3b3JrLgoJKyBjb21taXQgNGZjYTc5YjY3YmJhMDRi
YzVlZjJhNDQwMmU5NDhjMDE4MjFjZWFjNQoJKiBhZ2VudC9jb21tYW5kLmMgKGNtZF9pbXBvcnRf
a2V5KTogQWxsb3cgLS11bmF0dGVuZGVkIGFsc28gZm9yCgkgIGNvbXBvc2l0ZSBrZXlzLgoKMjAy
Ni0wNi0yNiAgTklJQkUgWXV0YWthICA8Z25paWJlQGZzaWoub3JnPgoKCWRpcm1uZ3I6IEFkZCBh
IHZhbGlkYXRpb24gY2hlY2sgaW4gZ2V0X2Ruc19jZXJ0X3N0YW5kYXJkLgoJKyBjb21taXQgYzNl
Yzc2Nzg3OTlhMTYxYjkyNjU5NjllN2FkM2ZkNTk2MDViMThhYgoJKiBkaXJtbmdyL2Rucy1zdHVm
Zi5jIChnZXRfZG5zX2NlcnRfc3RhbmRhcmQpOiBWYWxpZGF0ZSB0aGUgbGVuZ3RoLgoKMjAyNi0w
Ni0xOSAgTklJQkUgWXV0YWthICA8Z25paWJlQGZzaWoub3JnPgoKCWJ1aWxkOiBVcGRhdGUgbGRh
cC5tNCBmb3IgUE9TSVggd2l0aCBubyBMREFQX0RFUFJFQ0FURUQuCgkrIGNvbW1pdCBkMzgyMjA5
OWZkZDRkODQzMjNhZmFlNGJhY2FhZGZlYWI5Y2IzZTI3CgkqIG00L2xkYXAubTQ6IENoZWNrIGxk
YXBfZXJyMnN0cmluZywgaW5zdGVhZC4KCjIwMjYtMDYtMTggIFdlcm5lciBLb2NoICA8d2tAZ251
cGcub3JnPgoKCWdwZ3NtOiBSZXF1aXJlIGEgbWluaW11bSB0YWcgbGVuZ3RoIGZvciBHQ00gZGVj
cnlwdGlvbi4KCSsgY29tbWl0IDRjN2U2OGNmM2QzMzUzMjg4MjFiZGJiNzBkYjMwOWE2MGQwZTRm
ZDQKCSogc20vZGVjcnlwdC5jIChncGdzbV9kZWNyeXB0KTogUmVxdWlyZSBhIG1pbmltdW0gYXV0
aHRhZ2xlbi4KCjIwMjYtMDYtMTggIE5JSUJFIFl1dGFrYSAgPGduaWliZUBmc2lqLm9yZz4KCgl3
MzI6Y29tbW9uOiBGaXggdXNsZWVwIGluIHczMl93YWl0X3doZW5fc2hhcmluZ192aW9sYXRpb24u
CgkrIGNvbW1pdCBhYjljZTVmNWU3NzVhM2E2YTM3OTIzMjk5Njg1YWMzNzFmNzQwMTAzCgkqIGNv
bW1vbi9zeXN1dGlscy5jICh3MzJfd2FpdF93aGVuX3NoYXJpbmdfdmlvbGF0aW9uKTogV1RJTUUg
aXMKCWluIG1pbGxpc2Vjb25kcy4KCjIwMjYtMDYtMTcgIFBoaWxpcCBMZSAgPHBoaWxpcC5sZUBn
bnVwZy5jb20+CgoJZ3BnOiBGaXggY29weV9zaWduYXR1cmUuCgkrIGNvbW1pdCA1NmUxMWZmZTk3
MWQ1Y2M1ODE4NWI0ZThkMDJiODJkYzQzMmM2MzRiCgkqIGcxMC9mcmVlLXBhY2tldC5jIChjb3B5
X3NpZ25hdHVyZSk6IFNldCB0aGUgc2lnbmVyc191aWQgb2YgdGhlIG5ldwoJY29weSB0byBOVUxM
IGlmIGl0IGlzIG5vdCBwcmVzZW50IGluIHRoZSBzb3VyY2Ugc2lnbmF0dXJlLgoKCWdwZzogVXNl
IHRoZSBJTlRfUkNQX0ZQUiBzdWJwYWNrZXQgaW4gcmV2b2NhdGlvbiBzaWduYXR1cmVzLgoJKyBj
b21taXQgOWUwZTU1NDdkMmEwMDgzMzI4NzNhOWI2MzJmODJmOTQxNGFkODg3ZgoJKiBjb21tb24v
b3BlbnBncGRlZnMuaCAoc2lnc3VicGt0dHlwZV90KTogQWRkIEludGVuZGVkIFJlY2lwaWVudAoJ
RmluZ2VycHJpbnQgc2lnbmF0dXJlIHN1YnBhY2tldC4KCSogZzEwL2J1aWxkLXBhY2tldC5jIChi
dWlsZF9zaWdfc3VicGt0KTogQnVpbGQgdGhlIEludGVuZGVkIFJlY2lwaWVudAoJRmluZ2VycHJp
bnQgc2lnbmF0dXJlIHN1YnBhY2tldCBmb3IgdjQgYW5kIHY1IGtleXMuCgkqIGcxMC9mcmVlLXBh
Y2tldC5jIChmcmUKCltDaGFuZ2Vsb2cgdHJ1bmNhdGVkIGFzIGl0IGV4Y2VlZHMgMzAwMCBjaGFy
YWN0ZXJzOwp0aGUgZnVsbCBjaGFuZ2Vsb2cgY2FuIGJlIGZvdW5kIGluIGFuIGF0dGFjaG1lbnQg
dG8gdGhlIEFVSCBlbWFpbF0KLS0tCiAuLi5lcnJpZGUtaW5pdC1pcy1ub3QtbmVlZGVkLXdpdGgt
Z2NjLTkucGF0Y2ggfCAgMiArLQogLi4uLWEtY3VzdG9tLXZhbHVlLWZvci10aGUtbG9jYXRpb24t
b2YtLnBhdGNoIHwgIDYgKy0tCiAuLi51c2UtcGtnY29uZmlnLWluc3RlYWQtb2YtbnB0aC1jb25m
aWcucGF0Y2ggfCAgMiArLQogLi4uL2dudXBnL2dudXBnL0NWRS0yMDI2LTU3MDYyLnBhdGNoICAg
ICAgICAgIHwgNDMgLS0tLS0tLS0tLS0tLS0tLS0tLQogLi4uL2dudXBnL2dudXBnL3JlbG9jYXRl
LnBhdGNoICAgICAgICAgICAgICAgIHwgMTggKysrKy0tLS0KIC4uLi97Z251cGdfMi41LjIwLmJi
ID0+IGdudXBnXzIuNS4yMS5iYn0gICAgICB8ICA0ICstCiA2IGZpbGVzIGNoYW5nZWQsIDE2IGlu
c2VydGlvbnMoKyksIDU5IGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVj
aXBlcy1zdXBwb3J0L2dudXBnL2dudXBnL0NWRS0yMDI2LTU3MDYyLnBhdGNoCiByZW5hbWUgbWV0
YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcve2dudXBnXzIuNS4yMC5iYiA9PiBnbnVwZ18yLjUuMjEu
YmJ9ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGcv
MDAwMS1Xb3ZlcnJpZGUtaW5pdC1pcy1ub3QtbmVlZGVkLXdpdGgtZ2NjLTkucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZy8wMDAxLVdvdmVycmlkZS1pbml0LWlzLW5vdC1u
ZWVkZWQtd2l0aC1nY2MtOS5wYXRjaAppbmRleCBiNDhkYjQwOTcwLi43YTNmYTU5YzU0IDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZy8wMDAxLVdvdmVycmlkZS1p
bml0LWlzLW5vdC1uZWVkZWQtd2l0aC1nY2MtOS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC9nbnVwZy9nbnVwZy8wMDAxLVdvdmVycmlkZS1pbml0LWlzLW5vdC1uZWVkZWQtd2l0aC1n
Y2MtOS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gOWI3ZWY4YWExYTVkNzFmYzk1ZjM2YTky
ODc0ZDNmYWE0NTc5ZmM0ZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNDZkYjEzMDFi
MWI3MWY0N2FhMTMxYjlhM2RlOWQxY2YzNTZjZjQwOCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
IEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBUaHUsIDIwIERlYyAy
MDE4IDE3OjM3OjQ4IC0wODAwCiBTdWJqZWN0OiBbUEFUQ0hdIFdvdmVycmlkZS1pbml0IGlzIG5v
dCBuZWVkZWQgd2l0aCBnY2MgOQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251
cGcvZ251cGcvMDAwMS1jb25maWd1cmUuYWMtdXNlLWEtY3VzdG9tLXZhbHVlLWZvci10aGUtbG9j
YXRpb24tb2YtLnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGcvMDAwMS1j
b25maWd1cmUuYWMtdXNlLWEtY3VzdG9tLXZhbHVlLWZvci10aGUtbG9jYXRpb24tb2YtLnBhdGNo
CmluZGV4IGJmZWU5Yzk5MDQuLjFjN2NkN2JhN2IgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1z
dXBwb3J0L2dudXBnL2dudXBnLzAwMDEtY29uZmlndXJlLmFjLXVzZS1hLWN1c3RvbS12YWx1ZS1m
b3ItdGhlLWxvY2F0aW9uLW9mLS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVw
Zy9nbnVwZy8wMDAxLWNvbmZpZ3VyZS5hYy11c2UtYS1jdXN0b20tdmFsdWUtZm9yLXRoZS1sb2Nh
dGlvbi1vZi0ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDg0YTE2ZDQ2YTcyYTI1MDFjYmUz
YTRhODNlYTdmODM5M2FkYTQwMzggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGZkMDYw
ZjUyNGU1MGM3YzNmODY5NGY3MTYzMGFjMTUxNjI3MjM1ZjEgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERh
dGU6IE1vbiwgMjIgSmFuIDIwMTggMTg6MDA6MjEgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gY29u
ZmlndXJlLmFjOiB1c2UgYSBjdXN0b20gdmFsdWUgZm9yIHRoZSBsb2NhdGlvbiBvZgpAQCAtMTMs
MTAgKzEzLDEwIEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2
aW5AZ21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQogCiBkaWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29uZmlndXJlLmFjCi1pbmRleCAw
MjM2MDRiLi5jODQ0NDJjIDEwMDY0NAoraW5kZXggNWFjNGQwYi4uMDk2MTVjNSAxMDA2NDQKIC0t
LSBhL2NvbmZpZ3VyZS5hYwogKysrIGIvY29uZmlndXJlLmFjCi1AQCAtMTkwOCw3ICsxOTA4LDcg
QEAgQUNfREVGSU5FX1VOUVVPVEVEKEdQR0NPTkZfRElTUF9OQU1FLCAiR1BHQ29uZiIsCitAQCAt
MTkwOSw3ICsxOTA5LDcgQEAgQUNfREVGSU5FX1VOUVVPVEVEKEdQR0NPTkZfRElTUF9OQU1FLCAi
R1BHQ29uZiIsCiAgCiAgQUNfREVGSU5FX1VOUVVPVEVEKEdQR1RBUl9OQU1FLCAiZ3BndGFyIiwg
W1RoZSBuYW1lIG9mIHRoZSBncGd0YXIgdG9vbF0pCiAgCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC9nbnVwZy9nbnVwZy8wMDAyLXVzZS1wa2djb25maWctaW5zdGVhZC1vZi1ucHRo
LWNvbmZpZy5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnLzAwMDItdXNl
LXBrZ2NvbmZpZy1pbnN0ZWFkLW9mLW5wdGgtY29uZmlnLnBhdGNoCmluZGV4IDkwZDUzNjc0ZDQu
LmY0YzliMjE2MWEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBn
LzAwMDItdXNlLXBrZ2NvbmZpZy1pbnN0ZWFkLW9mLW5wdGgtY29uZmlnLnBhdGNoCisrKyBiL21l
dGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnLzAwMDItdXNlLXBrZ2NvbmZpZy1pbnN0ZWFk
LW9mLW5wdGgtY29uZmlnLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAwYzNhMDlhOTU4NzVl
NTc0NGE5MTBhMGQzYzkzZmEyZTlkYmU4YzY5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSBiOGE5OWIyZDljYWEwNWY1NGJlMjU2MzVlM2IxNjg3NzUzZmU3MTk2IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogU2F1bCBXb2xkIDxzZ3dAbGludXguaW50ZWwuY29tPgogRGF0ZTog
V2VkLCAxNiBBdWcgMjAxNyAxMToxNjozMCArMDgwMAogU3ViamVjdDogW1BBVENIXSB1c2UgcGtn
Y29uZmlnIGluc3RlYWQgb2YgbnB0aCBjb25maWcKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1z
dXBwb3J0L2dudXBnL2dudXBnL0NWRS0yMDI2LTU3MDYyLnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1
cHBvcnQvZ251cGcvZ251cGcvQ1ZFLTIwMjYtNTcwNjIucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUg
MTAwNjQ0CmluZGV4IGYyOThiNmU5YTguLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLXN1
cHBvcnQvZ251cGcvZ251cGcvQ1ZFLTIwMjYtNTcwNjIucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAt
MSw0MyArMCwwIEBACi1Gcm9tIGQ1ODZmNTBlZTg0OWM4Y2JlYWVhNDdiNTBjNjQ0NDZjMWJlY2Jm
OWIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBXZXJuZXIgS29jaCA8d2tAZ251cGcu
b3JnPgotRGF0ZTogVGh1LCAxOCBKdW4gMjAyNiAxMDo1MTozNCArMDIwMAotU3ViamVjdDogW1BB
VENIXSBncGdzbTogUmVxdWlyZSBhIG1pbmltdW0gdGFnIGxlbmd0aCBmb3IgR0NNIGRlY3J5cHRp
b24uCi0KLSogc20vZGVjcnlwdC5jIChncGdzbV9kZWNyeXB0KTogUmVxdWlyZSBhIG1pbmltdW0g
YXV0aHRhZ2xlbi4KLS0tCi0KLVJlcG9ydGVkLWJ5OiBUaGFpIER1b25nIDx0aGFpQGNhbGlmLmlv
PgotVGhpcyBpcyBzaW1pbGFyIHRvIE9wZW5TU0wncwotQ1ZFLWlkOiBDVkUtMjAyNi0zNDE4Mgot
Ci1DVkU6IENWRS0yMDI2LTU3MDYyCi1VcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0IFtodHRwczov
L2dpdGh1Yi5jb20vZ3BnL2dudXBnL2NvbW1pdC80YzdlNjhjZjNkMzM1MzI4ODIxYmRiYjcwZGIz
MDlhNjBkMGU0ZmQ0XQotCi1TaWduZWQtb2ZmLWJ5OiBSb2xhbmQgS292YWNzIDxyb2xhbmQua292
YWNzQGVzdC50ZWNoPgotLS0tCi0gc20vZGVjcnlwdC5jIHwgOSArKysrKysrKy0KLSAxIGZpbGUg
Y2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCi0KLWRpZmYgLS1naXQgYS9z
bS9kZWNyeXB0LmMgYi9zbS9kZWNyeXB0LmMKLWluZGV4IDIwZmI5NjA2MC4uOTJhMzNjNmU2IDEw
MDY0NAotLS0tIGEvc20vZGVjcnlwdC5jCi0rKysgYi9zbS9kZWNyeXB0LmMKLUBAIC0xNDQ3LDcg
KzE0NDcsMTQgQEAgZ3Bnc21fZGVjcnlwdCAoY3RybF90IGN0cmwsIGVzdHJlYW1fdCBpbl9mcCwg
ZXN0cmVhbV90IG91dF9mcCkKLSAgICAgICAgICAgICAgICAgfQotICAgICAgICAgICAgICAgaWYg
KERCR19DUllQVE8pCi0gICAgICAgICAgICAgICAgIGxvZ19wcmludGhleCAoYXV0aHRhZywgYXV0
aHRhZ2xlbiwgIkF1dGh0YWcgLi4uOiIpOwotLSAgICAgICAgICAgICAgcmMgPSBnY3J5X2NpcGhl
cl9jaGVja3RhZyAoZGZwYXJtLmhkLCBhdXRodGFnLCBhdXRodGFnbGVuKTsKLSsgICAgICAgICAg
ICAgIGlmIChhdXRodGFnbGVuIDwgMTIpCi0rICAgICAgICAgICAgICAgIHsKLSsgICAgICAgICAg
ICAgICAgICBsb2dfaW5mbyAoImF1dGhlbnRpY2F0aW9uIHRhZyBpcyB0b28gc2hvcnQgKCV6dSBv
Y3RldHMpXG4iLAotKyAgICAgICAgICAgICAgICAgICAgICAgICAgICBhdXRodGFnbGVuKTsKLSsg
ICAgICAgICAgICAgICAgICByYyA9IGdwZ19lcnJvciAoR1BHX0VSUl9DSEVDS1NVTSk7Ci0rICAg
ICAgICAgICAgICAgIH0KLSsgICAgICAgICAgICAgIGVsc2UKLSsgICAgICAgICAgICAgICAgcmMg
PSBnY3J5X2NpcGhlcl9jaGVja3RhZyAoZGZwYXJtLmhkLCBhdXRodGFnLCBhdXRodGFnbGVuKTsK
LSAgICAgICAgICAgICAgIHhmcmVlIChhdXRodGFnKTsKLSAgICAgICAgICAgICAgIGlmIChyYykK
LSAgICAgICAgICAgICAgICAgbG9nX2Vycm9yICgiZGF0YSBpcyBub3QgYXV0aGVudGljOiAlc1xu
IiwgZ3BnX3N0cmVycm9yIChyYykpOwotLS0gCi0yLjM0LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGcvcmVsb2NhdGUucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9nbnVwZy9nbnVwZy9yZWxvY2F0ZS5wYXRjaAppbmRleCBmZWRiN2Y2NDA3Li4wMmYw
MzM4NmVjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZy9yZWxv
Y2F0ZS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZy9yZWxvY2F0
ZS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gOGQ3NjU4NzQxZGEwNTBmNjA0YmNmMjZmOGE2
YzI0YTBiMTVkZjk0YiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYzcwNjk0YmQzZTcx
Y2MxZmVjNmNjYjNlYTBmNjk0YzM4NjNlYmQ0OCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZy
b206IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBpbnRlbC5jb20+CiBEYXRlOiBXZWQsIDE5IFNl
cCAyMDE4IDE0OjQ0OjQwICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIEFsbG93IHRoZSBlbnZpcm9u
bWVudCB0byBvdmVycmlkZSB3aGVyZSBnbnVwZyBsb29rcyBmb3IgaXRzCkBAIC0xMywxMCArMTMs
MTAgQEAgU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5k
ZT4KICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQogCiBk
aWZmIC0tZ2l0IGEvY29tbW9uL2hvbWVkaXIuYyBiL2NvbW1vbi9ob21lZGlyLmMKLWluZGV4IGQy
NmRkZDkuLjI0MjI0YzAgMTAwNjQ0CitpbmRleCA4MzVmMGVhLi4wYTY3YTMzIDEwMDY0NAogLS0t
IGEvY29tbW9uL2hvbWVkaXIuYwogKysrIGIvY29tbW9uL2hvbWVkaXIuYwotQEAgLTE0NTEsNyAr
MTQ1MSw3IEBAIGdudXBnX3NvY2tldGRpciAodm9pZCkKK0BAIC0xNTI2LDcgKzE1MjYsNyBAQCBn
bnVwZ19zb2NrZXRkaXIgKHZvaWQpCiAgICBpZiAoIW5hbWUpCiAgICAgIHsKICAgICAgICB1bnNp
Z25lZCBpbnQgZHVtbXk7CkBAIC0yNSw3ICsyNSw3IEBAIGluZGV4IGQyNmRkZDkuLjI0MjI0YzAg
MTAwNjQ0CiAgICAgICAgZ3BncnRfYW5ub3RhdGVfbGVha2VkX29iamVjdCAobmFtZSk7CiAgICAg
IH0KICAKLUBAIC0xNDgwLDcgKzE0ODAsNyBAQCBnbnVwZ19zeXNjb25mZGlyICh2b2lkKQorQEAg
LTE1NTUsNyArMTU1NSw3IEBAIGdudXBnX3N5c2NvbmZkaXIgKHZvaWQpCiAgICBpZiAoZGlyKQog
ICAgICByZXR1cm4gZGlyOwogICAgZWxzZQpAQCAtMzQsNyArMzQsNyBAQCBpbmRleCBkMjZkZGQ5
Li4yNDIyNGMwIDEwMDY0NAogICNlbmRpZiAvKiFIQVZFX1czMl9TWVNURU0qLwogIH0KICAKLUBA
IC0xNTE2LDcgKzE1MTYsNyBAQCBnbnVwZ19iaW5kaXIgKHZvaWQpCitAQCAtMTU5MSw3ICsxNTkx
LDcgQEAgZ251cGdfYmluZGlyICh2b2lkKQogICAgICAgIHJldHVybiBuYW1lOwogICAgICB9CiAg
ICBlbHNlCkBAIC00Myw3ICs0Myw3IEBAIGluZGV4IGQyNmRkZDkuLjI0MjI0YzAgMTAwNjQ0CiAg
I2VuZGlmIC8qIUhBVkVfVzMyX1NZU1RFTSovCiAgfQogIAotQEAgLTE1NDMsNyArMTU0Myw3IEBA
IGdudXBnX2xpYmV4ZWNkaXIgKHZvaWQpCitAQCAtMTYxOCw3ICsxNjE4LDcgQEAgZ251cGdfbGli
ZXhlY2RpciAodm9pZCkKICAgICAgICByZXR1cm4gbmFtZTsKICAgICAgfQogICAgZWxzZQpAQCAt
NTIsNyArNTIsNyBAQCBpbmRleCBkMjZkZGQ5Li4yNDIyNGMwIDEwMDY0NAogICNlbmRpZiAvKiFI
QVZFX1czMl9TWVNURU0qLwogIH0KICAKLUBAIC0xNTczLDcgKzE1NzMsNyBAQCBnbnVwZ19saWJk
aXIgKHZvaWQpCitAQCAtMTY0OCw3ICsxNjQ4LDcgQEAgZ251cGdfbGliZGlyICh2b2lkKQogICAg
ICAgIHJldHVybiBuYW1lOwogICAgICB9CiAgICBlbHNlCkBAIC02MSw3ICs2MSw3IEBAIGluZGV4
IGQyNmRkZDkuLjI0MjI0YzAgMTAwNjQ0CiAgI2VuZGlmIC8qIUhBVkVfVzMyX1NZU1RFTSovCiAg
fQogIAotQEAgLTE2MDQsNyArMTYwNCw3IEBAIGdudXBnX2RhdGFkaXIgKHZvaWQpCitAQCAtMTY3
OSw3ICsxNjc5LDcgQEAgZ251cGdfZGF0YWRpciAodm9pZCkKICAgICAgICByZXR1cm4gbmFtZTsK
ICAgICAgfQogICAgZWxzZQpAQCAtNzAsNyArNzAsNyBAQCBpbmRleCBkMjZkZGQ5Li4yNDIyNGMw
IDEwMDY0NAogICNlbmRpZiAvKiFIQVZFX1czMl9TWVNURU0qLwogIH0KICAKLUBAIC0xNjM2LDcg
KzE2MzYsNyBAQCBnbnVwZ19sb2NhbGVkaXIgKHZvaWQpCitAQCAtMTcxMSw3ICsxNzExLDcgQEAg
Z251cGdfbG9jYWxlZGlyICh2b2lkKQogICAgICAgIHJldHVybiBuYW1lOwogICAgICB9CiAgICBl
bHNlCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZ18yLjUuMjAu
YmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZ18yLjUuMjEuYmIKc2ltaWxhcml0
eSBpbmRleCA5NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGdf
Mi41LjIwLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZ18yLjUu
MjEuYmIKaW5kZXggNGE3MmQ4YzhmMC4uZTM0YzA5ZmM4YyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZ251cGcvZ251cGdfMi41LjIwLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBw
b3J0L2dudXBnL2dudXBnXzIuNS4yMS5iYgpAQCAtMjAsMTMgKzIwLDEzIEBAIFVQU1RSRUFNX0NI
RUNLX1VSSSA9ICJodHRwczovL2dudXBnLm9yZy9mdHAvZ2NyeXB0L2dudXBnLyIKIFNSQ19VUkkg
PSAiJHtHTlVQR19NSVJST1J9LyR7QlBOfS8ke0JQTn0tJHtQVn0udGFyLmJ6MiBcCiAgICAgICAg
ICAgIGZpbGU6Ly8wMDAyLXVzZS1wa2djb25maWctaW5zdGVhZC1vZi1ucHRoLWNvbmZpZy5wYXRj
aCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLVdvdmVycmlkZS1pbml0LWlzLW5vdC1uZWVkZWQt
d2l0aC1nY2MtOS5wYXRjaCBcCi0gICAgICAgICAgIGZpbGU6Ly9DVkUtMjAyNi01NzA2Mi5wYXRj
aCBcCisgICAgICAgICAgIGZpbGU6Ly9yZWxvY2F0ZS5wYXRjaCBcCiAgICAgICAgICAgICIKIFNS
Q19VUkk6YXBwZW5kOmNsYXNzLW5hdGl2ZSA9ICIgZmlsZTovLzAwMDEtY29uZmlndXJlLmFjLXVz
ZS1hLWN1c3RvbS12YWx1ZS1mb3ItdGhlLWxvY2F0aW9uLW9mLS5wYXRjaCBcCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9yZWxvY2F0ZS5wYXRjaCIKIFNSQ19VUkk6YXBw
ZW5kOmNsYXNzLW5hdGl2ZXNkayA9ICIgZmlsZTovL3JlbG9jYXRlLnBhdGNoIgogCi1TUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiNjQ2MTI2NmU5OWMzMDg0MTlhMzc5YWJlNmMzNTZkNTRjMjE0MTM2YzQ1
ODliZDY1OTUxMDkxMTM4OTg5ZmZjNiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJlM2FmMmM4Y2Fh
NDZhNjZhOTMyOWZhN2M2ODgwYWYyNjA0NTE5MTRkODE5NTk1YmVhYmMyYzI2NTk3YjMxMzUyIgog
CiBFWFRSQV9PRUNPTkYgPSAiLS1kaXNhYmxlLWxkYXAgXAogCQktLWRpc2FibGUtY2NpZC1kcml2
ZXIgXAotLSAKMi40Ny4xCgo=

--===============2995961614592280671==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="gnupg-changelog.txt"

Changelog for gnupg: 2.5.20 -> 2.5.21
Source: ChangeLog

2026-07-02  Werner Koch  <wk@gnupg.org>

	Release 2.5.21.
	+ commit 363096d9c9a973ac8dcad8ee4efd479f50add290

2026-06-30  Werner Koch  <wk@gnupg.org>

	speedo: Create a pkgversioninfo.txt file.
	+ commit 8716b4dac4a79b600d18847b8bc0193bd06e1fc1
	* build-aux/mk-sbom.sh: New.  Taken from gpg4win and extended.
	* Makefile.am (EXTRA_DIST): Add it.
	* build-aux/speedo.mk (gnupg_ver_this): Use sed to extract version.
	(gnupg_commit_id): new.
	(00-unpack): Call mk-sbom.sh.
	(clean-pkg-versions: Clear version files.
	($(bdir)/pkgversioninfo.txt): New.
	(all-speedo,installer): Depend on above.
	(dist-source): Exclude autom4te.cache just in case
	* build-aux/speedo/w32/inst.nsi: Install pkgversioninfo.txt.

2026-06-30  NIIBE Yutaka  <gniibe@fsij.org>

	scd: Fix condition to retrieve ATR.
	+ commit ca25a7a61bebbe4e27dd5568c5b049675b7aa4ae
	* scd/app.c (atr_to_cardtype): Call apdu_get_atr when ATR is NULL.

2026-06-29  Werner Koch  <wk@gnupg.org>

	speedo: Fix passing configure args to w32 builds.
	+ commit 7af73849a5dbbc5c70e43c3a3f5d70c639c80ab4
	* build-aux/speedo.mk (pkgcfg): Use correct number of dollar signs.

	common: Prepare to get rid of map_w32_to_errno.
	+ commit bf808091534f587e8cdacf351b0e7ba060165fd8
	* common/sysutils.c (gnupg_w32_set_errno): Use gpgrt function if
	  available.

	agent: Make batch import of Kyber keys work.
	+ commit 4fca79b67bba04bc5ef2a4402e948c01821ceac5
	* agent/command.c (cmd_import_key): Allow --unattended also for
	  composite keys.

2026-06-26  NIIBE Yutaka  <gniibe@fsij.org>

	dirmngr: Add a validation check in get_dns_cert_standard.
	+ commit c3ec7678799a161b9265969e7ad3fd59605b18ab
	* dirmngr/dns-stuff.c (get_dns_cert_standard): Validate the length.

2026-06-19  NIIBE Yutaka  <gniibe@fsij.org>

	build: Update ldap.m4 for POSIX with no LDAP_DEPRECATED.
	+ commit d3822099fdd4d84323afae4bacaadfeab9cb3e27
	* m4/ldap.m4: Check ldap_err2string, instead.

2026-06-18  Werner Koch  <wk@gnupg.org>

	gpgsm: Require a minimum tag length for GCM decryption.
	+ commit 4c7e68cf3d335328821bdbb70db309a60d0e4fd4
	* sm/decrypt.c (gpgsm_decrypt): Require a minimum authtaglen.

2026-06-18  NIIBE Yutaka  <gniibe@fsij.org>

	w32:common: Fix usleep in w32_wait_when_sharing_violation.
	+ commit ab9ce5f5e775a3a6a37923299685ac371f740103
	* common/sysutils.c (w32_wait_when_sharing_violation): WTIME is
	in milliseconds.

2026-06-17  Philip Le  <philip.le@gnupg.com>

	gpg: Fix copy_signature.
	+ commit 56e11ffe971d5cc58185b4e8d02b82dc432c634b
	* g10/free-packet.c (copy_signature): Set the signers_uid of the new
	copy to NULL if it is not present in the source signature.

	gpg: Use the INT_RCP_FPR subpacket in revocation signatures.
	+ commit 9e0e5547d2a008332873a9b632f82f9414ad887f
	* common/openpgpdefs.h (sigsubpkttype_t): Add Intended Recipient
	Fingerprint signature subpacket.
	* g10/build-packet.c (build_sig_subpkt): Build the Intended Recipient
	Fingerprint signature subpacket for v4 and v5 keys.
	* g10/free-packet.c (free_seckey_enc): Free rev_subject_info.
	(copy_signature): Copy the rev_subject_info struct too.
	* g10/import.c (import_one): Print info that addtional revocation
	signatures are checked.
	(import_revoke_cert): Use the new INT_RCP_FPR subpacket to check
	revocation signature if the subpacket is present.
	* g10/packet.h (rev_subject_info_s): New. Contains the fingerprint of
	the to be revoked key in a revocation signature.
	(PKT_signature): Add rev_subject_info.
	* g10/parse-packet.c (dump_sig_subpkt): Print info line about
	INT_RCP_FPR signature subpacket.
	(parse_signature): Parse INT_RCP_FPR signature subpacket.
	* g10/sig-check.c (check_key_signature): Check the revocation
	signature and ignore revocation for already revoked keys.
	* g10/sign.c (make_keysig_packet): Write the fingerprint of the to be
	revoked key into sig->rev_subject_info.

2026-06-15  NIIBE Yutaka  <gniibe@fsij.org>

	gpg: Fix partial file handling.
	+ commit a54dff1b151b85837714b199f316cbb339275ddc
	* g10/misc.c (gnupg_register_partial_file): Fix possible memory leaks.
	(gnupg_process_partial_file): Better error message.
	* g10/plaintext.c (pfg_close_file): Likewise.

2026-06-12  NIIBE Yutaka  <gniibe@fsij.org>

	gpg: Defer renaming at exit, so that it can remove on failure.
	+ commit ab2e64e4b490bf9ea45f7aff2060e16e7b2b7119
	* g10/main.h (gnupg_register_partial_file): New.
	(gnupg_process_partial_file): New.
	* g10/misc.c (gnupg_register_partial_file): New.
	(gnupg_process_partial_file): New.
	* g10/plaintext.c (pfg_close_file): Add log_info when remove.
	Register the file rename.
	* g10/gpg.c (g10_exit): Call gnupg_process_partial_file.

2026-06-11  Werner Koch  <wk@gnupg.org>

	gpg-authcode-sign: Avoid syntax error if input file does not exist.
	+ commit a9c9435cd4471232a252785b69e4dd44379bc49f
	* tools/gpg-authcode-sign.sh (cleanup): Check that file exists.

2026-06-09  Mikhail Filippov  <mikhail@filippov.me>

	scd:openpgp: Fix CHV1 retry counter byte index.
	+ commit 245330ebeaf67f8e87fef979777c24b983f1a519
	* scd/app-openpgp.c (get_remaining_tries): Read value[4] not value[1]
	for chvno==1.

2026-06-09  NIIBE Yutaka  <gniibe@fsij.org>

	gpg: Fix error propagation in encrypted->compressed->plaintext chain.
	+ commit 91bff8b9fd5e130a3ebf46f0afc6c8ad723ca1e4
	* g10/compress.c (do_uncompress): Return an error of input failure.
	* g10/decrypt-data.c (aead_underflow): Remove modifying an error code,
	because ->checktag_failed is enough for this.
	* g10/plaintext.c (handle_plaintext): Pick up an error code from input
	failure.

2026-06-09  NIIBE Yutaka  <gniibe@fsij.org>
	    Philip Le  <philip.le@gnupg.com>

	gpg: Use partial file on decryption, remove on failure.
	+ commit 8f8b2bdcc3c93f7586ce2c18ddbaff2efe5ba5d3
	* g10/options.h (COMPAT_NO_PARTIALFILEGUARD): New.
	* g10/gpg.c (compatibility_flags_s compatibility_flags): Add
	COMPAT_NO_PARTIALFILEGUARD.
	* sm/gpgsm.c (compatibility_flags_s compatibility_flags): Fix the
	option name.
	* g10/packet.h (struct pfg, pfg_open_file, pfg_close_file): New.
	* g10/decrypt-data.c (decrypt_data): Use pfg_open_file,
	pfg_close_file, instead of get_output_file.  Add log_error for MDC
	failure just like AEAD failure.
	* g10/plaintext.c (get_output_file): Mofify using PFG.
	(pfg_open_file, pfg_close_file): New.
	(handle_plaintext): Use PFG.
	Add iobuf_error check to ensure aead filter failure is detected
	correctly.

2026-06-02  NIIBE Yutaka  <gniibe@fsij.org>

	gpgsm: Use partial file on decryption, remove on failure.
	+ commit ca8633c55edffd9ee46fe80735ee125120e0bc2c
	* sm/gpgsm.c (main): Prepare .part file and rename on success, remove
	on failure.
	* sm/gpgsm.h (COMPAT_NO_PARTIALFILEGUARD): New.

	tools:gpgconf: Raise an error on parse error.
	+ commit f99e4291200d507f5ac8a73066a2ea259a1d7eb8
	* tools/gpgconf-comp.c (change_options_program): Return an
	error, replacing assertion.

	scd: Limit the size of data object returned from a device.
	+ commit ab3b9c7709fdd41b37e44632cc1569e85c6d1e6e
	* scd/apdu.c (send_le, apdu_send_direct): Raise an error
	of SW_WRONG_LENGTH, when it's too large.

2026-06-02  NIIBE Yutaka  <gniibe@fsij.org>
	    Jakub Jelen  <jjelen@redhat.com>

	gpg:keygen: Fix setting keyserver_url in key generation.
	+ commit b42f8da77c5a709ea9fd163ad7c4d73ddeee9dba
	* g10/keygen.c (proc_parameter_file): Save and restore global
	variable opt.def_keyserver_url.

2026-05-29  Philip Le  <philip.le@gnupg.com>

	gpgsm: Fix regression in gpgsm_verify with expired certificates.
	+ commit 32f56a2732f0ac6204aad946388789cdbb0e26eb
	* sm/verify.c (gpgsm_verify): Display information about signers with
	expired certificate.

2026-05-29  Werner Koch  <wk@gnupg.org>

	gpg: Improve diagnostics for faulty secret key packets.
	+ commit 91defad97deca5ce1b9cc8e792ae5fe13c201f7a
	* g10/parse-packet.c (parse_key): Add a note about a mising checksum.

2026-05-26  NIIBE Yutaka  <gniibe@fsij.org>

	tests:gpgscm: Support signed-char machine.
	+ commit 31c8f42bb30306d2bef3e315730c379a19f0af26
	* tests/gpgscm/ffi.c (rl_gets, ffi_schemify_name): Add coercion to
	unsigned char explicitly.
	* tests/gpgscm/main.c: Remove unused <ctype.h>.
	* tests/gpgscm/scheme.c (stricmp, mk_atom, readstrexp)
	(printslashstring, hash_fn): Add coercion to unsigned char explicitly.
	(basic_inchar): Add coercion to unsigned char * explicitly.

2026-05-18  Werner Koch  <wk@gnupg.org>

	gpgscm: Allow building on systems with MUSL libc.
	+ commit a0d4d936424e945966de9314cbb2765a8819efbf
	* tests/gpgscm/scheme.c: Include time.h.

--===============2995961614592280671==--

