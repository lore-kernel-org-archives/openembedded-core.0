Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F97CC624D3
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 05:53:22 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1376.1788241989629145012
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Aug 2026 22:53:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=WaxVrTqr;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=1st8sCj4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101a05b87569f-8478ceea-a3ca-46bc-b3c4-63ea3d6f4071-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1788241991;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ycZL9JObr/kjbBNzp0N9yj1oJO65OFfJlj4V3Wdy0qE=;
	b=WaxVrTqr9i4cnk8F8BiGBFxaobeNbpHYo6WBRlV1Ldm49fwwRMIv33MdH/bvtzU8
	XwWzg6xdYu2BABT8yPUUK76Nt5NO41LJM08teQZBoFqpi0/DJohZT8IYj8xTA5eaJMI
	e28SGtCqyiPoe6ZudxHDC53oB48JztWaXDop3ixI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1788241991;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ycZL9JObr/kjbBNzp0N9yj1oJO65OFfJlj4V3Wdy0qE=;
	b=1st8sCj4OzT3++bNqkvbmX0geBKSUP7DlpxM9dVIdwsChWFd4LtbZBJvoHTN3zcu
	I7JBqXBCWiLFtFbjDOdmnvzDjduhDtu7ecIrxGZWcnvcDZFk3efZEpllgTZuadC/OC4
	ZYw7U7f8CLF/dh7lFEh+vOWX6yFjnWrwumE2bGNs=
Content-Type: multipart/mixed; boundary="===============8256325768137388708=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gnupg: upgrading to 2.5.22 SUCCEEDED
Message-ID: <010101a05b87569f-8478ceea-a3ca-46bc-b3c4-63ea3d6f4071-000000@us-west-2.amazonses.com>
Date: Tue, 1 Sep 2026 05:53:11 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 05:53:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244788

--===============8256325768137388708==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gnupg* to *2.5.22* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gnupg-upgrade-2.5.21-2.5.22.patch
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
From 993565fb98e7c8edfb84cf6de54388e911e57034 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Sep 2026 05:44:26 +0000
Subject: [PATCH] gnupg: upgrade 2.5.21 -> 2.5.22

Source: ChangeLog

2026-08-31  Werner Koch  <wk@gnupg.org>

	Release 2.5.22.
	+ commit bd253e9fecedd4c0e699530826ee43264581634b

2026-08-26  Philip Le  <philip.le@gnupg.com>

	gpgsm: Fix condition for de-vs compliance status line.
	+ commit a09f16f2b17a47b3f215e2d257ef256f3b2b724e
	* sm/decrypt.c (gpgsm_decrypt): Also check other conditions for de-vs
	compliance before emitting status line.

2026-08-25  Philip Le  <philip.le@gnupg.com>

	gpgsm: Check keyboxd usage in keydb_get_flags.
	+ commit e338ea3de2d151fe718c11d7dcd2a2178b10a22e
	* sm/keydb.c (keydb_get_flags): Add condition that keyboxd is not
	used.

2026-08-21  Werner Koch  <wk@gnupg.org>

	gpgconf: Print a warning on Windows on insufficent /etc permissions.
	+ commit 56eb3148c7b88eb1c0804141b58cb54b9007f48d
	* README (Securing the global config files on Windows): New.

	* tools/gpgconf.c [W32]: Include aclapi.h.
	(enum cmd_and_opt_values): Add oDebug.
	(opts): Add option --debug.
	(debug_flags): New.
	(main): Parse debug flags.
	(w32_get_file_integrity_level) [W32]: New.
	(show_configs) [W32]: Check permissions of the gloab sysconfdir
	* tools/gpgconf.h (opt): Add field 'debug'.
	(DBG_W32_API): New.

2026-08-18  Philip Le  <philip.le@gnupg.com>

	gpg: Emit status line for failed write.
	+ commit 09ac242827c3bd002da2ff9d693a2db646d4e386
	* g10/plaintext.c (handle_plaintext): Emit error location and code in
	failure status.

2026-08-12  Philip Le  <philip.le@gnupg.com>
	    Werner Koch  <wk@gnupg.org>

	gpg: Fix regression introduced by partial file guards.
	+ commit 1b8debd65baaa05250ce26079fad15ac7bb16bd5
	* g10/main.h (gnupg_rollback_partial_file): New. Removes .part files.
	(gnupg_commit_partial_file): New. Renames .part files.
	* g10/misc.c (gnupg_rollback_partial_file): New.
	(gnupg_commit_partial_file): New.
	* g10/mainproc.c (proc_encrypted): Use gnupg_commit_partial_file.
	* g10/gpg.c (g10_exit): Use gnupg_commit_partial_file.
	(main): Remove .part files if decryption fails.

2026-08-12  NIIBE Yutaka  <gniibe@fsij.org>

	common,gpg: Don't enable the partial file guard if already done.
	+ commit 95ad7f7a5165b96e1a39afe70b1b1092b9ab6f45
	* common/stringhelp.c (has_suffix): New.
	* common/stringhelp.h (has_suffix): New.
	* g10/plaintext.c (get_output_file): Only enable the partial
	file guard when it doesn't have ".part" suffix.

2026-08-10  Werner Koch  <wk@gnupg.org>

	gpg: Fix TOFU trust models to actually check UTK signatures.
	+ commit 08611f5da8ad4b9cc80bb05f0f8610ec6baa6063
	* g10/tofu.c (signed_by_utk): Add arg ctrl.  Use macros fro the
	  sigclass.  Check the signature before returning true.

2026-08-05  Werner Koch  <wk@gnupg.org>

	g13: Add sanity check on the syntax of the dmsetup algo string.
	+ commit 386c3e63b1cac7f506f974715dbf30c6d40663dd
	* g13/sh-dmcrypt.c (is_valid_algostr): New
	(sh_dmcrypt_mount_container): Use here
	(sh_dmcrypt_resume_container): and here.

2026-08-04  NIIBE Yutaka  <gniibe@fsij.org>

	gpg: Add a comment and minor fix for composing SEXP.
	+ com

[Changelog truncated as it exceeds 3000 characters;
the full changelog can be found in an attachment to the AUH email]
---
 ...verride-init-is-not-needed-with-gcc-9.patch |  2 +-
 ...e-a-custom-value-for-the-location-of-.patch |  4 ++--
 ...-use-pkgconfig-instead-of-npth-config.patch |  2 +-
 .../recipes-support/gnupg/gnupg/relocate.patch | 18 +++++++++---------
 .../gnupg/{gnupg_2.5.21.bb => gnupg_2.5.22.bb} |  2 +-
 5 files changed, 14 insertions(+), 14 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.5.21.bb => gnupg_2.5.22.bb} (97%)

diff --git a/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch b/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
index 7a3fa59c54..52db780959 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
@@ -1,4 +1,4 @@
-From 46db1301b1b71f47aa131b9a3de9d1cf356cf408 Mon Sep 17 00:00:00 2001
+From 8b7d344ed35bc4bcfa0d531a0885fc1bea01ffda Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 20 Dec 2018 17:37:48 -0800
 Subject: [PATCH] Woverride-init is not needed with gcc 9
diff --git a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
index 1c7cd7ba7b..04dd45e676 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
@@ -1,4 +1,4 @@
-From fd060f524e50c7c3f8694f71630ac151627235f1 Mon Sep 17 00:00:00 2001
+From f86e7337698debfe5152f4f4bc840bf56f868fab Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 22 Jan 2018 18:00:21 +0200
 Subject: [PATCH] configure.ac: use a custom value for the location of
@@ -13,7 +13,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 5ac4d0b..09615c5 100644
+index 9e2a42d..b48b88d 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -1909,7 +1909,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
diff --git a/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch b/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
index f4c9b2161a..7553bd9f3f 100644
--- a/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
+++ b/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
@@ -1,4 +1,4 @@
-From b8a99b2d9caa05f54be25635e3b1687753fe7196 Mon Sep 17 00:00:00 2001
+From 3c1d201eace11d557eb6c589842e93b8bacbe8f9 Mon Sep 17 00:00:00 2001
 From: Saul Wold <sgw@linux.intel.com>
 Date: Wed, 16 Aug 2017 11:16:30 +0800
 Subject: [PATCH] use pkgconfig instead of npth config
diff --git a/meta/recipes-support/gnupg/gnupg/relocate.patch b/meta/recipes-support/gnupg/gnupg/relocate.patch
index 02f03386ec..234afd16fe 100644
--- a/meta/recipes-support/gnupg/gnupg/relocate.patch
+++ b/meta/recipes-support/gnupg/gnupg/relocate.patch
@@ -1,4 +1,4 @@
-From c70694bd3e71cc1fec6ccb3ea0f694c3863ebd48 Mon Sep 17 00:00:00 2001
+From f49d102adf393f57e6ca7b6ec6969f60115055ef Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Wed, 19 Sep 2018 14:44:40 +0100
 Subject: [PATCH] Allow the environment to override where gnupg looks for its
@@ -13,10 +13,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 7 insertions(+), 7 deletions(-)
 
 diff --git a/common/homedir.c b/common/homedir.c
-index 835f0ea..0a67a33 100644
+index 7538642..92e8125 100644
 --- a/common/homedir.c
 +++ b/common/homedir.c
-@@ -1526,7 +1526,7 @@ gnupg_socketdir (void)
+@@ -1575,7 +1575,7 @@ gnupg_socketdir (void)
    if (!name)
      {
        unsigned int dummy;
@@ -25,7 +25,7 @@ index 835f0ea..0a67a33 100644
        gpgrt_annotate_leaked_object (name);
      }
  
-@@ -1555,7 +1555,7 @@ gnupg_sysconfdir (void)
+@@ -1604,7 +1604,7 @@ gnupg_sysconfdir (void)
    if (dir)
      return dir;
    else
@@ -34,7 +34,7 @@ index 835f0ea..0a67a33 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1591,7 +1591,7 @@ gnupg_bindir (void)
+@@ -1640,7 +1640,7 @@ gnupg_bindir (void)
        return name;
      }
    else
@@ -43,7 +43,7 @@ index 835f0ea..0a67a33 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1618,7 +1618,7 @@ gnupg_libexecdir (void)
+@@ -1667,7 +1667,7 @@ gnupg_libexecdir (void)
        return name;
      }
    else
@@ -52,7 +52,7 @@ index 835f0ea..0a67a33 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1648,7 +1648,7 @@ gnupg_libdir (void)
+@@ -1697,7 +1697,7 @@ gnupg_libdir (void)
        return name;
      }
    else
@@ -61,7 +61,7 @@ index 835f0ea..0a67a33 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1679,7 +1679,7 @@ gnupg_datadir (void)
+@@ -1728,7 +1728,7 @@ gnupg_datadir (void)
        return name;
      }
    else
@@ -70,7 +70,7 @@ index 835f0ea..0a67a33 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1711,7 +1711,7 @@ gnupg_localedir (void)
+@@ -1760,7 +1760,7 @@ gnupg_localedir (void)
        return name;
      }
    else
diff --git a/meta/recipes-support/gnupg/gnupg_2.5.21.bb b/meta/recipes-support/gnupg/gnupg_2.5.22.bb
similarity index 97%
rename from meta/recipes-support/gnupg/gnupg_2.5.21.bb
rename to meta/recipes-support/gnupg/gnupg_2.5.22.bb
index dc77691bbd..803fb2765a 100644
--- a/meta/recipes-support/gnupg/gnupg_2.5.21.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.5.22.bb
@@ -25,7 +25,7 @@ SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 SRC_URI:append:class-nativesdk = " file://relocate.patch"
 
-SRC_URI[sha256sum] = "e3af2c8caa46a66a9329fa7c6880af260451914d819595beabc2c26597b31352"
+SRC_URI[sha256sum] = "96e27b020ad26510388e06f5f07f3f70a4ed8916ee995f1b72b7a024e6d9d87e"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.47.1


--===============8256325768137388708==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gnupg-upgrade-2.5.21-2.5.22.patch"

RnJvbSA5OTM1NjVmYjk4ZTdjOGVkZmI4NGNmNmRlNTQzODhlOTExZTU3MDM0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBTZXAgMjAyNiAwNTo0NDoyNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdu
dXBnOiB1cGdyYWRlIDIuNS4yMSAtPiAyLjUuMjIKClNvdXJjZTogQ2hhbmdlTG9nCgoyMDI2LTA4
LTMxICBXZXJuZXIgS29jaCAgPHdrQGdudXBnLm9yZz4KCglSZWxlYXNlIDIuNS4yMi4KCSsgY29t
bWl0IGJkMjUzZTlmZWNlZGQ0YzBlNjk5NTMwODI2ZWU0MzI2NDU4MTYzNGIKCjIwMjYtMDgtMjYg
IFBoaWxpcCBMZSAgPHBoaWxpcC5sZUBnbnVwZy5jb20+CgoJZ3Bnc206IEZpeCBjb25kaXRpb24g
Zm9yIGRlLXZzIGNvbXBsaWFuY2Ugc3RhdHVzIGxpbmUuCgkrIGNvbW1pdCBhMDlmMTZmMmIxN2E0
N2IzZjIxNWUyZDI1N2VmMjU2ZjNiMmI3MjRlCgkqIHNtL2RlY3J5cHQuYyAoZ3Bnc21fZGVjcnlw
dCk6IEFsc28gY2hlY2sgb3RoZXIgY29uZGl0aW9ucyBmb3IgZGUtdnMKCWNvbXBsaWFuY2UgYmVm
b3JlIGVtaXR0aW5nIHN0YXR1cyBsaW5lLgoKMjAyNi0wOC0yNSAgUGhpbGlwIExlICA8cGhpbGlw
LmxlQGdudXBnLmNvbT4KCglncGdzbTogQ2hlY2sga2V5Ym94ZCB1c2FnZSBpbiBrZXlkYl9nZXRf
ZmxhZ3MuCgkrIGNvbW1pdCBlMzM4ZWEzZGUyZDE1MWZlNzE4YzExZDdkY2QyYTIxNzhiMTBhMjJl
CgkqIHNtL2tleWRiLmMgKGtleWRiX2dldF9mbGFncyk6IEFkZCBjb25kaXRpb24gdGhhdCBrZXli
b3hkIGlzIG5vdAoJdXNlZC4KCjIwMjYtMDgtMjEgIFdlcm5lciBLb2NoICA8d2tAZ251cGcub3Jn
PgoKCWdwZ2NvbmY6IFByaW50IGEgd2FybmluZyBvbiBXaW5kb3dzIG9uIGluc3VmZmljZW50IC9l
dGMgcGVybWlzc2lvbnMuCgkrIGNvbW1pdCA1NmViMzE0OGM3Yjg4ZWIxYzA4MDQxNDFiNThjYjU0
YjkwMDdmNDhkCgkqIFJFQURNRSAoU2VjdXJpbmcgdGhlIGdsb2JhbCBjb25maWcgZmlsZXMgb24g
V2luZG93cyk6IE5ldy4KCgkqIHRvb2xzL2dwZ2NvbmYuYyBbVzMyXTogSW5jbHVkZSBhY2xhcGku
aC4KCShlbnVtIGNtZF9hbmRfb3B0X3ZhbHVlcyk6IEFkZCBvRGVidWcuCgkob3B0cyk6IEFkZCBv
cHRpb24gLS1kZWJ1Zy4KCShkZWJ1Z19mbGFncyk6IE5ldy4KCShtYWluKTogUGFyc2UgZGVidWcg
ZmxhZ3MuCgkodzMyX2dldF9maWxlX2ludGVncml0eV9sZXZlbCkgW1czMl06IE5ldy4KCShzaG93
X2NvbmZpZ3MpIFtXMzJdOiBDaGVjayBwZXJtaXNzaW9ucyBvZiB0aGUgZ2xvYWIgc3lzY29uZmRp
cgoJKiB0b29scy9ncGdjb25mLmggKG9wdCk6IEFkZCBmaWVsZCAnZGVidWcnLgoJKERCR19XMzJf
QVBJKTogTmV3LgoKMjAyNi0wOC0xOCAgUGhpbGlwIExlICA8cGhpbGlwLmxlQGdudXBnLmNvbT4K
CglncGc6IEVtaXQgc3RhdHVzIGxpbmUgZm9yIGZhaWxlZCB3cml0ZS4KCSsgY29tbWl0IDA5YWMy
NDI4MjdjM2JkMDAyZGEyZmY5ZDY5M2EyZGI2NDZkNGUzODYKCSogZzEwL3BsYWludGV4dC5jICho
YW5kbGVfcGxhaW50ZXh0KTogRW1pdCBlcnJvciBsb2NhdGlvbiBhbmQgY29kZSBpbgoJZmFpbHVy
ZSBzdGF0dXMuCgoyMDI2LTA4LTEyICBQaGlsaXAgTGUgIDxwaGlsaXAubGVAZ251cGcuY29tPgoJ
ICAgIFdlcm5lciBLb2NoICA8d2tAZ251cGcub3JnPgoKCWdwZzogRml4IHJlZ3Jlc3Npb24gaW50
cm9kdWNlZCBieSBwYXJ0aWFsIGZpbGUgZ3VhcmRzLgoJKyBjb21taXQgMWI4ZGViZDY1YmFhYTA1
MjUwY2UyNjA3OWZhZDE1YWM3YmIxNmJkNQoJKiBnMTAvbWFpbi5oIChnbnVwZ19yb2xsYmFja19w
YXJ0aWFsX2ZpbGUpOiBOZXcuIFJlbW92ZXMgLnBhcnQgZmlsZXMuCgkoZ251cGdfY29tbWl0X3Bh
cnRpYWxfZmlsZSk6IE5ldy4gUmVuYW1lcyAucGFydCBmaWxlcy4KCSogZzEwL21pc2MuYyAoZ251
cGdfcm9sbGJhY2tfcGFydGlhbF9maWxlKTogTmV3LgoJKGdudXBnX2NvbW1pdF9wYXJ0aWFsX2Zp
bGUpOiBOZXcuCgkqIGcxMC9tYWlucHJvYy5jIChwcm9jX2VuY3J5cHRlZCk6IFVzZSBnbnVwZ19j
b21taXRfcGFydGlhbF9maWxlLgoJKiBnMTAvZ3BnLmMgKGcxMF9leGl0KTogVXNlIGdudXBnX2Nv
bW1pdF9wYXJ0aWFsX2ZpbGUuCgkobWFpbik6IFJlbW92ZSAucGFydCBmaWxlcyBpZiBkZWNyeXB0
aW9uIGZhaWxzLgoKMjAyNi0wOC0xMiAgTklJQkUgWXV0YWthICA8Z25paWJlQGZzaWoub3JnPgoK
CWNvbW1vbixncGc6IERvbid0IGVuYWJsZSB0aGUgcGFydGlhbCBmaWxlIGd1YXJkIGlmIGFscmVh
ZHkgZG9uZS4KCSsgY29tbWl0IDk1YWQ3ZjdhNTE2NWI5NmUxYTM5YWZlNzBiMWIxMDkyYjlhYjZm
NDUKCSogY29tbW9uL3N0cmluZ2hlbHAuYyAoaGFzX3N1ZmZpeCk6IE5ldy4KCSogY29tbW9uL3N0
cmluZ2hlbHAuaCAoaGFzX3N1ZmZpeCk6IE5ldy4KCSogZzEwL3BsYWludGV4dC5jIChnZXRfb3V0
cHV0X2ZpbGUpOiBPbmx5IGVuYWJsZSB0aGUgcGFydGlhbAoJZmlsZSBndWFyZCB3aGVuIGl0IGRv
ZXNuJ3QgaGF2ZSAiLnBhcnQiIHN1ZmZpeC4KCjIwMjYtMDgtMTAgIFdlcm5lciBLb2NoICA8d2tA
Z251cGcub3JnPgoKCWdwZzogRml4IFRPRlUgdHJ1c3QgbW9kZWxzIHRvIGFjdHVhbGx5IGNoZWNr
IFVUSyBzaWduYXR1cmVzLgoJKyBjb21taXQgMDg2MTFmNWRhOGFkNGI5Y2M4MGJiMDVmMGY4NjEw
ZWM2YmFhNjA2MwoJKiBnMTAvdG9mdS5jIChzaWduZWRfYnlfdXRrKTogQWRkIGFyZyBjdHJsLiAg
VXNlIG1hY3JvcyBmcm8gdGhlCgkgIHNpZ2NsYXNzLiAgQ2hlY2sgdGhlIHNpZ25hdHVyZSBiZWZv
cmUgcmV0dXJuaW5nIHRydWUuCgoyMDI2LTA4LTA1ICBXZXJuZXIgS29jaCAgPHdrQGdudXBnLm9y
Zz4KCglnMTM6IEFkZCBzYW5pdHkgY2hlY2sgb24gdGhlIHN5bnRheCBvZiB0aGUgZG1zZXR1cCBh
bGdvIHN0cmluZy4KCSsgY29tbWl0IDM4NmMzZTYzYjFjYWM3ZjUwNmY5NzQ3MTVkYmYzMGM2ZDQw
NjYzZGQKCSogZzEzL3NoLWRtY3J5cHQuYyAoaXNfdmFsaWRfYWxnb3N0cik6IE5ldwoJKHNoX2Rt
Y3J5cHRfbW91bnRfY29udGFpbmVyKTogVXNlIGhlcmUKCShzaF9kbWNyeXB0X3Jlc3VtZV9jb250
YWluZXIpOiBhbmQgaGVyZS4KCjIwMjYtMDgtMDQgIE5JSUJFIFl1dGFrYSAgPGduaWliZUBmc2lq
Lm9yZz4KCglncGc6IEFkZCBhIGNvbW1lbnQgYW5kIG1pbm9yIGZpeCBmb3IgY29tcG9zaW5nIFNF
WFAuCgkrIGNvbQoKW0NoYW5nZWxvZyB0cnVuY2F0ZWQgYXMgaXQgZXhjZWVkcyAzMDAwIGNoYXJh
Y3RlcnM7CnRoZSBmdWxsIGNoYW5nZWxvZyBjYW4gYmUgZm91bmQgaW4gYW4gYXR0YWNobWVudCB0
byB0aGUgQVVIIGVtYWlsXQotLS0KIC4uLnZlcnJpZGUtaW5pdC1pcy1ub3QtbmVlZGVkLXdpdGgt
Z2NjLTkucGF0Y2ggfCAgMiArLQogLi4uZS1hLWN1c3RvbS12YWx1ZS1mb3ItdGhlLWxvY2F0aW9u
LW9mLS5wYXRjaCB8ICA0ICsrLS0KIC4uLi11c2UtcGtnY29uZmlnLWluc3RlYWQtb2YtbnB0aC1j
b25maWcucGF0Y2ggfCAgMiArLQogLi4uL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZy9yZWxv
Y2F0ZS5wYXRjaCB8IDE4ICsrKysrKysrKy0tLS0tLS0tLQogLi4uL2dudXBnL3tnbnVwZ18yLjUu
MjEuYmIgPT4gZ251cGdfMi41LjIyLmJifSB8ICAyICstCiA1IGZpbGVzIGNoYW5nZWQsIDE0IGlu
c2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1zdXBwb3J0
L2dudXBnL3tnbnVwZ18yLjUuMjEuYmIgPT4gZ251cGdfMi41LjIyLmJifSAoOTclKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnLzAwMDEtV292ZXJyaWRlLWlu
aXQtaXMtbm90LW5lZWRlZC13aXRoLWdjYy05LnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQv
Z251cGcvZ251cGcvMDAwMS1Xb3ZlcnJpZGUtaW5pdC1pcy1ub3QtbmVlZGVkLXdpdGgtZ2NjLTku
cGF0Y2gKaW5kZXggN2EzZmE1OWM1NC4uNTJkYjc4MDk1OSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZ251cGcvZ251cGcvMDAwMS1Xb3ZlcnJpZGUtaW5pdC1pcy1ub3QtbmVlZGVk
LXdpdGgtZ2NjLTkucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGcv
MDAwMS1Xb3ZlcnJpZGUtaW5pdC1pcy1ub3QtbmVlZGVkLXdpdGgtZ2NjLTkucGF0Y2gKQEAgLTEs
NCArMSw0IEBACi1Gcm9tIDQ2ZGIxMzAxYjFiNzFmNDdhYTEzMWI5YTNkZTlkMWNmMzU2Y2Y0MDgg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDhiN2QzNDRlZDM1YmM0YmNmYTBkNTMxYTA4
ODVmYzFiZWEwMWZmZGEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8
cmFqLmtoZW1AZ21haWwuY29tPgogRGF0ZTogVGh1LCAyMCBEZWMgMjAxOCAxNzozNzo0OCAtMDgw
MAogU3ViamVjdDogW1BBVENIXSBXb3ZlcnJpZGUtaW5pdCBpcyBub3QgbmVlZGVkIHdpdGggZ2Nj
IDkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnLzAwMDEtY29u
ZmlndXJlLmFjLXVzZS1hLWN1c3RvbS12YWx1ZS1mb3ItdGhlLWxvY2F0aW9uLW9mLS5wYXRjaCBi
L21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnLzAwMDEtY29uZmlndXJlLmFjLXVzZS1h
LWN1c3RvbS12YWx1ZS1mb3ItdGhlLWxvY2F0aW9uLW9mLS5wYXRjaAppbmRleCAxYzdjZDdiYTdi
Li4wNGRkNDVlNjc2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVw
Zy8wMDAxLWNvbmZpZ3VyZS5hYy11c2UtYS1jdXN0b20tdmFsdWUtZm9yLXRoZS1sb2NhdGlvbi1v
Zi0ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGcvMDAwMS1jb25m
aWd1cmUuYWMtdXNlLWEtY3VzdG9tLXZhbHVlLWZvci10aGUtbG9jYXRpb24tb2YtLnBhdGNoCkBA
IC0xLDQgKzEsNCBAQAotRnJvbSBmZDA2MGY1MjRlNTBjN2MzZjg2OTRmNzE2MzBhYzE1MTYyNzIz
NWYxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBmODZlNzMzNzY5OGRlYmZlNTE1MmY0
ZjRiYzg0MGJmNTZmODY4ZmFiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFu
ZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBNb24sIDIyIEphbiAy
MDE4IDE4OjAwOjIxICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIGNvbmZpZ3VyZS5hYzogdXNlIGEg
Y3VzdG9tIHZhbHVlIGZvciB0aGUgbG9jYXRpb24gb2YKQEAgLTEzLDcgKzEzLDcgQEAgU2lnbmVk
LW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQg
YS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKLWluZGV4IDVhYzRkMGIuLjA5NjE1YzUgMTAw
NjQ0CitpbmRleCA5ZTJhNDJkLi5iNDhiODhkIDEwMDY0NAogLS0tIGEvY29uZmlndXJlLmFjCiAr
KysgYi9jb25maWd1cmUuYWMKIEBAIC0xOTA5LDcgKzE5MDksNyBAQCBBQ19ERUZJTkVfVU5RVU9U
RUQoR1BHQ09ORl9ESVNQX05BTUUsICJHUEdDb25mIiwKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1zdXBwb3J0L2dudXBnL2dudXBnLzAwMDItdXNlLXBrZ2NvbmZpZy1pbnN0ZWFkLW9mLW5wdGgt
Y29uZmlnLnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGcvMDAwMi11c2Ut
cGtnY29uZmlnLWluc3RlYWQtb2YtbnB0aC1jb25maWcucGF0Y2gKaW5kZXggZjRjOWIyMTYxYS4u
NzU1M2JkOWYzZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGcv
MDAwMi11c2UtcGtnY29uZmlnLWluc3RlYWQtb2YtbnB0aC1jb25maWcucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGcvMDAwMi11c2UtcGtnY29uZmlnLWluc3RlYWQt
b2YtbnB0aC1jb25maWcucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGI4YTk5YjJkOWNhYTA1
ZjU0YmUyNTYzNWUzYjE2ODc3NTNmZTcxOTYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IDNjMWQyMDFlYWNlMTFkNTU3ZWI2YzU4OTg0MmU5M2I4YmFjYmU4ZjkgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBTYXVsIFdvbGQgPHNnd0BsaW51eC5pbnRlbC5jb20+CiBEYXRlOiBX
ZWQsIDE2IEF1ZyAyMDE3IDExOjE2OjMwICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIHVzZSBwa2dj
b25maWcgaW5zdGVhZCBvZiBucHRoIGNvbmZpZwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1
cHBvcnQvZ251cGcvZ251cGcvcmVsb2NhdGUucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9n
bnVwZy9nbnVwZy9yZWxvY2F0ZS5wYXRjaAppbmRleCAwMmYwMzM4NmVjLi4yMzRhZmQxNmZlIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZy9yZWxvY2F0ZS5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZy9yZWxvY2F0ZS5wYXRjaApA
QCAtMSw0ICsxLDQgQEAKLUZyb20gYzcwNjk0YmQzZTcxY2MxZmVjNmNjYjNlYTBmNjk0YzM4NjNl
YmQ0OCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZjQ5ZDEwMmFkZjM5M2Y1N2U2Y2E3
YjZlYzY5NjlmNjAxMTUwNTVlZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJvc3Mg
QnVydG9uIDxyb3NzLmJ1cnRvbkBpbnRlbC5jb20+CiBEYXRlOiBXZWQsIDE5IFNlcCAyMDE4IDE0
OjQ0OjQwICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIEFsbG93IHRoZSBlbnZpcm9ubWVudCB0byBv
dmVycmlkZSB3aGVyZSBnbnVwZyBsb29rcyBmb3IgaXRzCkBAIC0xMywxMCArMTMsMTAgQEAgU2ln
bmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KICAxIGZp
bGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0
IGEvY29tbW9uL2hvbWVkaXIuYyBiL2NvbW1vbi9ob21lZGlyLmMKLWluZGV4IDgzNWYwZWEuLjBh
NjdhMzMgMTAwNjQ0CitpbmRleCA3NTM4NjQyLi45MmU4MTI1IDEwMDY0NAogLS0tIGEvY29tbW9u
L2hvbWVkaXIuYwogKysrIGIvY29tbW9uL2hvbWVkaXIuYwotQEAgLTE1MjYsNyArMTUyNiw3IEBA
IGdudXBnX3NvY2tldGRpciAodm9pZCkKK0BAIC0xNTc1LDcgKzE1NzUsNyBAQCBnbnVwZ19zb2Nr
ZXRkaXIgKHZvaWQpCiAgICBpZiAoIW5hbWUpCiAgICAgIHsKICAgICAgICB1bnNpZ25lZCBpbnQg
ZHVtbXk7CkBAIC0yNSw3ICsyNSw3IEBAIGluZGV4IDgzNWYwZWEuLjBhNjdhMzMgMTAwNjQ0CiAg
ICAgICAgZ3BncnRfYW5ub3RhdGVfbGVha2VkX29iamVjdCAobmFtZSk7CiAgICAgIH0KICAKLUBA
IC0xNTU1LDcgKzE1NTUsNyBAQCBnbnVwZ19zeXNjb25mZGlyICh2b2lkKQorQEAgLTE2MDQsNyAr
MTYwNCw3IEBAIGdudXBnX3N5c2NvbmZkaXIgKHZvaWQpCiAgICBpZiAoZGlyKQogICAgICByZXR1
cm4gZGlyOwogICAgZWxzZQpAQCAtMzQsNyArMzQsNyBAQCBpbmRleCA4MzVmMGVhLi4wYTY3YTMz
IDEwMDY0NAogICNlbmRpZiAvKiFIQVZFX1czMl9TWVNURU0qLwogIH0KICAKLUBAIC0xNTkxLDcg
KzE1OTEsNyBAQCBnbnVwZ19iaW5kaXIgKHZvaWQpCitAQCAtMTY0MCw3ICsxNjQwLDcgQEAgZ251
cGdfYmluZGlyICh2b2lkKQogICAgICAgIHJldHVybiBuYW1lOwogICAgICB9CiAgICBlbHNlCkBA
IC00Myw3ICs0Myw3IEBAIGluZGV4IDgzNWYwZWEuLjBhNjdhMzMgMTAwNjQ0CiAgI2VuZGlmIC8q
IUhBVkVfVzMyX1NZU1RFTSovCiAgfQogIAotQEAgLTE2MTgsNyArMTYxOCw3IEBAIGdudXBnX2xp
YmV4ZWNkaXIgKHZvaWQpCitAQCAtMTY2Nyw3ICsxNjY3LDcgQEAgZ251cGdfbGliZXhlY2RpciAo
dm9pZCkKICAgICAgICByZXR1cm4gbmFtZTsKICAgICAgfQogICAgZWxzZQpAQCAtNTIsNyArNTIs
NyBAQCBpbmRleCA4MzVmMGVhLi4wYTY3YTMzIDEwMDY0NAogICNlbmRpZiAvKiFIQVZFX1czMl9T
WVNURU0qLwogIH0KICAKLUBAIC0xNjQ4LDcgKzE2NDgsNyBAQCBnbnVwZ19saWJkaXIgKHZvaWQp
CitAQCAtMTY5Nyw3ICsxNjk3LDcgQEAgZ251cGdfbGliZGlyICh2b2lkKQogICAgICAgIHJldHVy
biBuYW1lOwogICAgICB9CiAgICBlbHNlCkBAIC02MSw3ICs2MSw3IEBAIGluZGV4IDgzNWYwZWEu
LjBhNjdhMzMgMTAwNjQ0CiAgI2VuZGlmIC8qIUhBVkVfVzMyX1NZU1RFTSovCiAgfQogIAotQEAg
LTE2NzksNyArMTY3OSw3IEBAIGdudXBnX2RhdGFkaXIgKHZvaWQpCitAQCAtMTcyOCw3ICsxNzI4
LDcgQEAgZ251cGdfZGF0YWRpciAodm9pZCkKICAgICAgICByZXR1cm4gbmFtZTsKICAgICAgfQog
ICAgZWxzZQpAQCAtNzAsNyArNzAsNyBAQCBpbmRleCA4MzVmMGVhLi4wYTY3YTMzIDEwMDY0NAog
ICNlbmRpZiAvKiFIQVZFX1czMl9TWVNURU0qLwogIH0KICAKLUBAIC0xNzExLDcgKzE3MTEsNyBA
QCBnbnVwZ19sb2NhbGVkaXIgKHZvaWQpCitAQCAtMTc2MCw3ICsxNzYwLDcgQEAgZ251cGdfbG9j
YWxlZGlyICh2b2lkKQogICAgICAgIHJldHVybiBuYW1lOwogICAgICB9CiAgICBlbHNlCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZ18yLjUuMjEuYmIgYi9tZXRh
L3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZ18yLjUuMjIuYmIKc2ltaWxhcml0eSBpbmRleCA5
NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGdfMi41LjIxLmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZ18yLjUuMjIuYmIKaW5k
ZXggZGM3NzY5MWJiZC4uODAzZmIyNzY1YSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBv
cnQvZ251cGcvZ251cGdfMi41LjIxLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBn
L2dudXBnXzIuNS4yMi5iYgpAQCAtMjUsNyArMjUsNyBAQCBTUkNfVVJJOmFwcGVuZDpjbGFzcy1u
YXRpdmUgPSAiIGZpbGU6Ly8wMDAxLWNvbmZpZ3VyZS5hYy11c2UtYS1jdXN0b20tdmFsdWUtZm9y
LQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmaWxlOi8vcmVsb2NhdGUucGF0Y2gi
CiBTUkNfVVJJOmFwcGVuZDpjbGFzcy1uYXRpdmVzZGsgPSAiIGZpbGU6Ly9yZWxvY2F0ZS5wYXRj
aCIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImUzYWYyYzhjYWE0NmE2NmE5MzI5ZmE3YzY4ODBh
ZjI2MDQ1MTkxNGQ4MTk1OTViZWFiYzJjMjY1OTdiMzEzNTIiCitTUkNfVVJJW3NoYTI1NnN1bV0g
PSAiOTZlMjdiMDIwYWQyNjUxMDM4OGUwNmY1ZjA3ZjNmNzBhNGVkODkxNmVlOTk1ZjFiNzJiN2Ew
MjRlNmQ5ZDg3ZSIKIAogRVhUUkFfT0VDT05GID0gIi0tZGlzYWJsZS1sZGFwIFwKIAkJLS1kaXNh
YmxlLWNjaWQtZHJpdmVyIFwKLS0gCjIuNDcuMQoK

--===============8256325768137388708==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gnupg/gnupg-dbg: PKGSIZE changed from 22351032 to 22366160 (+0%)
packages/x86-64-v3-poky-linux/gnupg/gnupg-dbg: PKGV changed from 2.5.21 [default] to 2.5.22 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-dbg: PV changed from "2.5.21" to "2.5.22"
packages/x86-64-v3-poky-linux/gnupg/gnupg-dev: PKGV changed from 2.5.21 [default] to 2.5.22 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-dev: PV changed from "2.5.21" to "2.5.22"
packages/x86-64-v3-poky-linux/gnupg/gnupg-doc: PKGSIZE changed from 12896 to 13224 (+3%)
packages/x86-64-v3-poky-linux/gnupg/gnupg-doc: PKGV changed from 2.5.21 [default] to 2.5.22 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-doc: PV changed from "2.5.21" to "2.5.22"
packages/x86-64-v3-poky-linux/gnupg/gnupg-gpg: PKGV changed from 2.5.21 [default] to 2.5.22 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-gpg: PV changed from "2.5.21" to "2.5.22"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-ca: PKGV changed from 2.5.21 [default] to 2.5.22 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-ca: PV changed from "2.5.21" to "2.5.22"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-cs: PKGV changed from 2.5.21 [default] to 2.5.22 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-cs: PV changed from "2.5.21" to "2.5.22"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-da: PKGV changed from 2.5.21 [default] to 2.5.22 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-da: PV changed from "2.5.21" to "2.5.22"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-de: PKGV changed from 2.5.21 [default] to 2.5.22 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-de: PV changed from "2.5.21" to "2.5.22"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-el: PKGV changed from 2.5.21 [default] to 2.5.22 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-el: PV changed from "2.5.21" to "2.5.22"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-en+boldquot: PKGV changed from 2.5.21 [default] to 2.5.22 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-en+boldquot: PV changed from "2.5.21" to "2.5.22"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-en+quot: PKGV changed from 2.5.21 [default] to 2.5.22 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-en+quot: PV changed from "2.5.21" to "2.5.22"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-eo: PKGV changed from 2.5.21 [default] to 2.5.22 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-eo: PV changed from "2.5.21" to "2.5.22"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-es: PKGV changed from 2.5.21 [default] to 2.5.22 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-es: PV changed from "2.5.21" to "2.5.22"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-et: PKGV changed from 2.5.21 [default] to 2.5.22 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-et: PV changed from "2.5.21" to "2.5.22"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-fi: PKGV changed from 2.5.21 [default] to 2.5.22 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-fi: PV changed from "2.5.21" to "2.5.22"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-fr: PKGV changed from 2.5.21 [default] to 2.5.22 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-fr: PV changed from "2.5.21" to "2.5.22"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-gl: PKGV changed from 2.5.21 [default] to 2.5.22 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-gl: PV changed from "2.5.21" to "2.5.22"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-hu: PKGV changed from 2.5.21 [default] to 2.5.22 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-hu: PV changed from "2.5.21" to "2.5.22"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-id: PKGV changed from 2.5.21 [default] to 2.5.22 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-id: PV changed from "2.5.21" to "2.5.22"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-it: PKGSIZE changed from 234669 to 234794 (+0%)
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-it: PKGV changed from 2.5.21 [default] to 2.5.22 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-it: PV changed from "2.5.21" to "2.5.22"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-ja: PKGSIZE changed from 256047 to 256410 (+0%)
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-ja: PKGV changed from 2.5.21 [default] to 2.5.22 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-ja: PV changed from "2.5.21" to "2.5.22"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-ka: PKGV changed from 2.5.21 [default] to 2.5.22 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-ka: PV changed from "2.5.21" to "2.5.22"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-nb: PKGV changed from 2.5.21 [default] to 2.5.22 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-nb: PV changed from "2.5.21" to "2.5.22"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-nl: PKGV changed from 2.5.21 [default] to 2.5.22 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-nl: PV changed from "2.5.21" to "2.5.22"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-pl: PKGV changed from 2.5.21 [default] to 2.5.22 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-pl: PV changed from "2.5.21" to "2.5.22"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-pt: PKGSIZE changed from 238764 to 239436 (+0%)
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-pt: PKGV changed from 2.5.21 [default] to 2.5.22 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-pt: PV changed from "2.5.21" to "2.5.22"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-ro: PKGV changed from 2.5.21 [default] to 2.5.22 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-ro: PV changed from "2.5.21" to "2.5.22"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-ru: PKGV changed from 2.5.21 [default] to 2.5.22 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-ru: PV changed from "2.5.21" to "2.5.22"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-sk: PKGV changed from 2.5.21 [default] to 2.5.22 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-sk: PV changed from "2.5.21" to "2.5.22"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-sv: PKGV changed from 2.5.21 [default] to 2.5.22 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-sv: PV changed from "2.5.21" to "2.5.22"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-tr: PKGV changed from 2.5.21 [default] to 2.5.22 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-tr: PV changed from "2.5.21" to "2.5.22"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-uk: PKGV changed from 2.5.21 [default] to 2.5.22 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-uk: PV changed from "2.5.21" to "2.5.22"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-zh-cn: PKGV changed from 2.5.21 [default] to 2.5.22 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-zh-cn: PV changed from "2.5.21" to "2.5.22"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-zh-tw: PKGV changed from 2.5.21 [default] to 2.5.22 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-zh-tw: PV changed from "2.5.21" to "2.5.22"
packages/x86-64-v3-poky-linux/gnupg/gnupg-src: PKGSIZE changed from 9186836 to 9200644 (+0%)
packages/x86-64-v3-poky-linux/gnupg/gnupg-src: FILELIST: directory renamed /usr/src/debug/gnupg/2.5.21/g10 -> /usr/src/debug/gnupg/2.5.22/g10, directory renamed /usr/src/debug/gnupg/2.5.21/dirmngr -> /usr/src/debug/gnupg/2.5.22/dirmngr, directory renamed /usr/src/debug/gnupg/2.5.21/common -> /usr/src/debug/gnupg/2.5.22/common, directory renamed /usr/src/debug/gnupg/2.5.21/scd -> /usr/src/debug/gnupg/2.5.22/scd, directory renamed /usr/src/debug/gnupg/2.5.21/regexp -> /usr/src/debug/gnupg/2.5.22/regexp, directory renamed /usr/src/debug/gnupg/2.5.21/kbx -> /usr/src/debug/gnupg/2.5.22/kbx, directory renamed /usr/src/debug/gnupg/2.5.21/tools -> /usr/src/debug/gnupg/2.5.22/tools, directory renamed /usr/src/debug/gnupg/2.5.21/sm -> /usr/src/debug/gnupg/2.5.22/sm, directory renamed /usr/src/debug/gnupg/2.5.21/agent -> /usr/src/debug/gnupg/2.5.22/agent
packages/x86-64-v3-poky-linux/gnupg/gnupg-src: PKGV changed from 2.5.21 [default] to 2.5.22 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-src: PV changed from "2.5.21" to "2.5.22"
packages/x86-64-v3-poky-linux/gnupg/gnupg-staticdev: PKGV changed from 2.5.21 [default] to 2.5.22 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-staticdev: PV changed from "2.5.21" to "2.5.22"
packages/x86-64-v3-poky-linux/gnupg/gnupg: PKGSIZE changed from 4774532 to 4774993 (+0%)
packages/x86-64-v3-poky-linux/gnupg/gnupg: PKGV changed from 2.5.21 [default] to 2.5.22 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg: PV changed from "2.5.21" to "2.5.22"
packages/x86-64-v3-poky-linux/gnupg: SRC_URI changed from "https://www.gnupg.org/ftp/gcrypt/gnupg/gnupg-2.5.21.tar.bz2 file://0002-use-pkgconfig-instead-of-npth-config.patch file://0001-Woverride-init-is-not-needed-with-gcc-9.patch" to "https://www.gnupg.org/ftp/gcrypt/gnupg/gnupg-2.5.22.tar.bz2 file://0002-use-pkgconfig-instead-of-npth-config.patch file://0001-Woverride-init-is-not-needed-with-gcc-9.patch"
packages/x86-64-v3-poky-linux/gnupg: PKGV changed from 2.5.21 [default] to 2.5.22 [default]
packages/x86-64-v3-poky-linux/gnupg: PV changed from "2.5.21" to "2.5.22"

--===============8256325768137388708==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="gnupg-changelog.txt"

Changelog for gnupg: 2.5.21 -> 2.5.22
Source: ChangeLog

2026-08-31  Werner Koch  <wk@gnupg.org>

	Release 2.5.22.
	+ commit bd253e9fecedd4c0e699530826ee43264581634b

2026-08-26  Philip Le  <philip.le@gnupg.com>

	gpgsm: Fix condition for de-vs compliance status line.
	+ commit a09f16f2b17a47b3f215e2d257ef256f3b2b724e
	* sm/decrypt.c (gpgsm_decrypt): Also check other conditions for de-vs
	compliance before emitting status line.

2026-08-25  Philip Le  <philip.le@gnupg.com>

	gpgsm: Check keyboxd usage in keydb_get_flags.
	+ commit e338ea3de2d151fe718c11d7dcd2a2178b10a22e
	* sm/keydb.c (keydb_get_flags): Add condition that keyboxd is not
	used.

2026-08-21  Werner Koch  <wk@gnupg.org>

	gpgconf: Print a warning on Windows on insufficent /etc permissions.
	+ commit 56eb3148c7b88eb1c0804141b58cb54b9007f48d
	* README (Securing the global config files on Windows): New.

	* tools/gpgconf.c [W32]: Include aclapi.h.
	(enum cmd_and_opt_values): Add oDebug.
	(opts): Add option --debug.
	(debug_flags): New.
	(main): Parse debug flags.
	(w32_get_file_integrity_level) [W32]: New.
	(show_configs) [W32]: Check permissions of the gloab sysconfdir
	* tools/gpgconf.h (opt): Add field 'debug'.
	(DBG_W32_API): New.

2026-08-18  Philip Le  <philip.le@gnupg.com>

	gpg: Emit status line for failed write.
	+ commit 09ac242827c3bd002da2ff9d693a2db646d4e386
	* g10/plaintext.c (handle_plaintext): Emit error location and code in
	failure status.

2026-08-12  Philip Le  <philip.le@gnupg.com>
	    Werner Koch  <wk@gnupg.org>

	gpg: Fix regression introduced by partial file guards.
	+ commit 1b8debd65baaa05250ce26079fad15ac7bb16bd5
	* g10/main.h (gnupg_rollback_partial_file): New. Removes .part files.
	(gnupg_commit_partial_file): New. Renames .part files.
	* g10/misc.c (gnupg_rollback_partial_file): New.
	(gnupg_commit_partial_file): New.
	* g10/mainproc.c (proc_encrypted): Use gnupg_commit_partial_file.
	* g10/gpg.c (g10_exit): Use gnupg_commit_partial_file.
	(main): Remove .part files if decryption fails.

2026-08-12  NIIBE Yutaka  <gniibe@fsij.org>

	common,gpg: Don't enable the partial file guard if already done.
	+ commit 95ad7f7a5165b96e1a39afe70b1b1092b9ab6f45
	* common/stringhelp.c (has_suffix): New.
	* common/stringhelp.h (has_suffix): New.
	* g10/plaintext.c (get_output_file): Only enable the partial
	file guard when it doesn't have ".part" suffix.

2026-08-10  Werner Koch  <wk@gnupg.org>

	gpg: Fix TOFU trust models to actually check UTK signatures.
	+ commit 08611f5da8ad4b9cc80bb05f0f8610ec6baa6063
	* g10/tofu.c (signed_by_utk): Add arg ctrl.  Use macros fro the
	  sigclass.  Check the signature before returning true.

2026-08-05  Werner Koch  <wk@gnupg.org>

	g13: Add sanity check on the syntax of the dmsetup algo string.
	+ commit 386c3e63b1cac7f506f974715dbf30c6d40663dd
	* g13/sh-dmcrypt.c (is_valid_algostr): New
	(sh_dmcrypt_mount_container): Use here
	(sh_dmcrypt_resume_container): and here.

2026-08-04  NIIBE Yutaka  <gniibe@fsij.org>

	gpg: Add a comment and minor fix for composing SEXP.
	+ commit e9b40fd1f0c0f6639c16346e895153561be93388
	* g10/import.c (internal_skey_object_to_sexp): Add comment.
	* g10/keyid.c (keygrip_from_pk): Compose correct SEXP with Ed448.

2026-07-30  Philip Le  <philip.le@gnupg.com>
	    Werner Koch  <wk@gnupg.org>

	gpgsm: Emit issuer and serial no. when the certificate is not found.
	+ commit 82d5dc7782617cb7683b3769a3267e154ebdb067
	* doc/DETAILS: Update NO_PUBKEY for X.509 certificates.
	* sm/verify.c (gpgsm_verify): Print the issuer and serial no. of the
	signer's certificate when the certificate is not found.

2026-07-30  Philip Le  <philip.le@gnupg.com>

	gpg: Emit signing time as status output for bad signatures.
	+ commit e5acae48015751e21a04bf3113ba42d02c3db3f7
	* g10/mainproc.c (print_good_bad_signature): Emit signature creation
	time with STATUS_SIGINFO for bad signatures.

2026-07-30  Philip Le  <philip.le@gnupg.com>
	    Werner Koch  <wk@gnupg.org>

	gpgsm: Emit signing time as status output for bad signatures.
	+ commit 74305fa7d79700eb5ec03ab575260d640430bc71
	* common/status.h (enum): Add new STATUS_SIGINFO.
	* doc/DETAILS: Add description for new STATUS_SIGINFO.
	* sm/verify.c (gpgsm_verify): Add signature creation time with
	STATUS_SIGINFO for bad signatures.

2026-07-30  NIIBE Yutaka  <gniibe@fsij.org>

	scd: Allow switching APP when opt.pcsc_shared is enabled.
	+ commit f783c02525c3be9af14e84ec6456d4bde6018c74
	* scd/app.c (maybe_switch_app): Add opt.pcsc_shared condition.

2026-07-21  NIIBE Yutaka  <gniibe@fsij.org>

	gpgsm: Fix keydb_get_flags with keyboxd.
	+ commit 766e9773cbc2a03d0392c2a2c94d0fe237741c5b
	* sm/keydb.c (struct keydb_handle): Add new field of last_is_revoked.
	(keydb_get_flag): Support keyboxd.
	(search_status_cb): Fill last_is_revoked field.

2026-07-20  Philip Le  <philip.le@gnupg.com>

	gpgsm: Check args for special file names and dashes.
	+ commit 2efb4a6242e25a661eb60adf2cb2c5abf4185d04
	* sm/gpgsm.c (main): Use open_es_fread to check input args for special
	file names and dashes.

2026-07-17  NIIBE Yutaka  <gniibe@fsij.org>

	scd: Put a workaround for buggy CCID device.
	+ commit 481b3dd50e744a6d4213abecd27ac1f497c6e1c5
	* scd/ccid-driver.c (bulk_in): Handle ZLP.

2026-07-16  Philip Le  <philip.le@gnupg.com>

	gpgsm: Return 0 if decryption of multi recipient file succeeeds.
	+ commit 890d16586beaa185b082a21e6a26b953181da3eb
	* sm/gpgsm.c (main): Reset error count when decryption succeeds.

2026-07-15  Werner Koch  <wk@gnupg.org>

	common: Make unix_rootdir work for macOS.
	+ commit 0be940905d70125866622c6f53b8d25bde87c21b
	* common/homedir.c [APPLE]: Include procinfo.h
	(macos_myproc_self) [APPLE]: New.
	(unix_rootdir, gnupg_myproc_self): Call macos specific version.

	gpg: Add option primary to the --card-edit generate command.
	+ commit a95da9e25362ea9f33c1e0b4441a86d6eca937f0
	* g10/card-util.c (generate_card_keys): Add arg arg_string and
	  implement option "primary".
	* g10/main.h (GENERATE_KEYPAIR_FULL): New.
	(GENERATE_KEYPAIR_CARDBACKUP): New.
	(GENERATE_KEYPAIR_CARDPRIMARY): New.
	* g10/keygen.c (generate_keypair): Remove args full and and
	  card_backup_key and replace by a new genflags args.  Implement the
	  new CARDPRIMARY feature.

	gpg: Fix long standing regression of "bkuptocard"
	+ commit f103eaee63f702278824967365de16b9757ecc83
	* g10/card-util.c (card_store_subkey): Add arg r_selected_use to
	  return the selected usage.
	* g10/keygen.c (append_subkey_to_keyblock): New.
	* g10/keyedit.c (keyedit_menu) <bkuptocard>:  Also append a
	  corresponding new subkey.

2026-07-14  Werner Koch  <wk@gnupg.org>

	doc: Improve comment on one function.
	+ commit 204d02da018e8aba0bdbae2b5d0c3151a810bf9f
	* g10/keygen.c (write_keybinding): Rename a variable.

2026-07-10  Daniel Cerqueira  <dan.git@lispclub.com>

	po: Update Portuguese Translation.
	+ commit 3913f7b167394cdf47c8f150247c2823f58966e7

2026-07-09  Philip Le  <philip.le@gnupg.com>

	gpgsm: Only display de-vs compliance status in de-vs compliance mode.
	+ commit 4a8f177f390b270df9a86ea47d8eced85420d7d4
	* sm/decrypt.c (gpgsm_decrypt): Check cert chain only in de-vs
	compliance mode.

2026-07-08  NIIBE Yutaka  <gniibe@fsij.org>

	gpg: Fix a memory leak.
	+ commit 6faaeca6b89a64763242cb8b586245085257b066
	* g10/trustdb.c (validate_keys): Release KEYBLOCK.

2026-07-07  Philip Le  <philip.le@gnupg.com>

	gpg: Fix possible double free in import_revoke_cert.
	+ commit a19534b70e27df101a0ad8f653aee8eefdbe8469
	* g10/import.c (import_revoke_cert): Fix possible double free. Use
	LEAVE label on errors.

	gpg: Fix assertion.
	+ commit e319d82d7e3ad9cf2eff3642e23b63304eda55f2
	* g10/build-packet.c (build_sig_subpkt_from_sig): Fix assertion.
	Check fingerprint version before creating the signature subpacket.

2026-07-07  NIIBE Yutaka  <gniibe@fsij.org>

	common:dotlock:unix: Don't emit wrong error message.
	+ commit f454e9372ae0e2a2a0ec034dbdbfa9c8c6d68f77
	* common/dotlock.c (dotlock_take_unix): It's not an error when
	it encounters disappeared lockfile.

2026-07-06  Philip Le  <philip.le@gnupg.com>

	gpg: Fix using wrong fingerprint length.
	+ commit 42e6677f7ab5617ce605cad08079a48095be09cf
	g10/build-packet.c (build_sig_subpkt_from_sig): Use the fpr length of
	the to be revoked key.

2026-07-03  NIIBE Yutaka  <gniibe@fsij.org>

	gpg: Fix trustdb recursive lock problem.
	+ commit 7752c7dcad8942e4227384282e6c8eb85b284d6f
	* g10/tdbio.c (take_write_lock): It's the callee to handle the
	recursive lock.
	(tdbio_sync): Simply use take_write_lock and release_write_lock.

--===============8256325768137388708==--

