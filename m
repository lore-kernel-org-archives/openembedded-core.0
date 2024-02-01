Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EE8FC48299
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 18:00:15 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.2109.1706810406372120697
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 10:00:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=OqnwuVjD;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=iMX+1Nnr;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018d65d3fd58-1f6b0395-bb22-468c-a752-02c031c37105-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1706810408;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=O465xK/B8I3Xlgya/RHeSQJIulkudt+2JtLGA2mdUgI=;
	b=OqnwuVjD+syfLIzhfRRmlirgT8KeFUpO0ggWjbKXYuY3jgPhQAL5mxcoCxSLwwsJ
	NJBVOKtdj5XwJSP4+aatong6mUdgRfJAzV8MkT0gb7qY1bF0TMVEKHkS63aKKmooFq3
	Q3C0nEHvBM4DeO8HXcYAMNVMM/7lK8M3rCLgi610=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1706810408;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=O465xK/B8I3Xlgya/RHeSQJIulkudt+2JtLGA2mdUgI=;
	b=iMX+1Nnr4h0t77MbktdNWUvjLpGgOpXDWKBDghg0bgpRq4m/3ogOeRC7DsEw8Odj
	UTwMk/zS1Ttp5rJ1uR4e7q47cCVhpBEbO7Bei0Tpdj1k6QKb3QuVjMcEXCEMNaBkZ1M
	KvpG7EeQHz+WdXT6qmUCh6J/jd/YcFpkJnOkr6Rs=
Content-Type: multipart/mixed; boundary="===============3875306887519421270=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gnupg: upgrading to 2.4.4 SUCCEEDED
Message-ID: <0101018d65d3fd58-1f6b0395-bb22-468c-a752-02c031c37105-000000@us-west-2.amazonses.com>
Date: Thu, 1 Feb 2024 18:00:08 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 18:00:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194714

--===============3875306887519421270==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gnupg* to *2.4.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gnupg-upgrade-2.4.3-2.4.4.patch
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
From 6beaa7922df6447a86a01cf8fa128ccd9dea5ea3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Feb 2024 17:38:07 +0000
Subject: [PATCH] gnupg: upgrade 2.4.3 -> 2.4.4

---
 ...erride-init-is-not-needed-with-gcc-9.patch |  8 ++---
 ...-a-custom-value-for-the-location-of-.patch |  6 ++--
 ...use-pkgconfig-instead-of-npth-config.patch |  2 +-
 ...h-fix-find-version-for-beta-checking.patch | 12 +++----
 .../gnupg/gnupg/fix-ldap.patch                | 34 -------------------
 .../gnupg/gnupg/relocate.patch                | 18 +++++-----
 .../gnupg/{gnupg_2.4.3.bb => gnupg_2.4.4.bb}  |  4 +--
 7 files changed, 23 insertions(+), 61 deletions(-)
 delete mode 100644 meta/recipes-support/gnupg/gnupg/fix-ldap.patch
 rename meta/recipes-support/gnupg/{gnupg_2.4.3.bb => gnupg_2.4.4.bb} (96%)

diff --git a/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch b/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
index 83195b5bd4..11cbf8c8ef 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
@@ -1,4 +1,4 @@
-From e3adc816d2d56dd929016073937ba24e01e03cb8 Mon Sep 17 00:00:00 2001
+From e10d933c88df8e49c0e028a86642922808f85ae7 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 20 Dec 2018 17:37:48 -0800
 Subject: [PATCH] Woverride-init is not needed with gcc 9
@@ -12,12 +12,13 @@ unary '&' operand                                                 |
 Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  dirmngr/dns.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/dirmngr/dns.h b/dirmngr/dns.h
-index 024d6dcc8..c6e141e16 100644
+index 1f647e1..334acb6 100644
 --- a/dirmngr/dns.h
 +++ b/dirmngr/dns.h
 @@ -139,7 +139,7 @@ DNS_PUBLIC int *dns_debug_p(void);
@@ -29,6 +30,3 @@ index 024d6dcc8..c6e141e16 100644
  #define DNS_PRAGMA_PUSH _Pragma("GCC diagnostic push")
  #define DNS_PRAGMA_QUIET _Pragma("GCC diagnostic ignored \"-Woverride-init\"")
  #define DNS_PRAGMA_POP _Pragma("GCC diagnostic pop")
--- 
-2.17.1
-
diff --git a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
index 561616584c..b84dcb9b90 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
@@ -1,4 +1,4 @@
-From acdb7e1d2844cd4088f099617e25352b3dc5b075 Mon Sep 17 00:00:00 2001
+From 66069803a54aa767ef3a520b3159d701a5adf0db Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 22 Jan 2018 18:00:21 +0200
 Subject: [PATCH] configure.ac: use a custom value for the location of
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index e68b779..eec9f89 100644
+index 26d7f7b..e953c2e 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1922,7 +1922,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
+@@ -1921,7 +1921,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
  
  AC_DEFINE_UNQUOTED(GPGTAR_NAME, "gpgtar", [The name of the gpgtar tool])
  
diff --git a/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch b/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
index 0e58fd4c4d..0fdd9fa3a2 100644
--- a/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
+++ b/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
@@ -1,4 +1,4 @@
-From d9048788d906774b1475c3bb1b17e22455c2add4 Mon Sep 17 00:00:00 2001
+From 86ebb6cdc59c9b474ff75292948327903082c2d3 Mon Sep 17 00:00:00 2001
 From: Saul Wold <sgw@linux.intel.com>
 Date: Wed, 16 Aug 2017 11:16:30 +0800
 Subject: [PATCH] use pkgconfig instead of npth config
diff --git a/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch b/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch
index dcd8582ca6..66842e6d49 100644
--- a/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch
+++ b/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch
@@ -1,7 +1,7 @@
-From 914ae4a3f7529fb069467bf0ded57dd24ee2e763 Mon Sep 17 00:00:00 2001
+From 7910eaec574ad6d0de6674929a1f41a1b36bca54 Mon Sep 17 00:00:00 2001
 From: Wenzong Fan <wenzong.fan@windriver.com>
 Date: Wed, 16 Aug 2017 11:23:22 +0800
-Subject: [PATCH 4/4] autogen.sh: fix find-version for beta checking
+Subject: [PATCH] autogen.sh: fix find-version for beta checking
 
 find-version always assumes that gnupg is beta if autogen.sh is run
 out of git-repo. This doesn't work for users whom just take release
@@ -13,15 +13,16 @@ Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
 
 Rebase to 2.1.23
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
 ---
  autogen.sh | 1 -
  1 file changed, 1 deletion(-)
 
 diff --git a/autogen.sh b/autogen.sh
-index e5ba5bf..05e0e11 100755
+index 0abf103..78753b5 100755
 --- a/autogen.sh
 +++ b/autogen.sh
-@@ -245,7 +245,6 @@ if [ "$myhost" = "find-version" ]; then
+@@ -237,7 +237,6 @@ if [ "$myhost" = "find-version" ]; then
        rvd=$((0x$(echo ${rev} | dd bs=1 count=4 2>/dev/null)))
      else
        ingit=no
@@ -29,6 +30,3 @@ index e5ba5bf..05e0e11 100755
        tmp="-unknown"
        rev="0000000"
        rvd="0"
--- 
-1.8.3.1
-
diff --git a/meta/recipes-support/gnupg/gnupg/fix-ldap.patch b/meta/recipes-support/gnupg/gnupg/fix-ldap.patch
deleted file mode 100644
index 4754781565..0000000000
--- a/meta/recipes-support/gnupg/gnupg/fix-ldap.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From dc13361524c1477b2106c7385f2059f9ea111b84 Mon Sep 17 00:00:00 2001
-From: NIIBE Yutaka <gniibe@fsij.org>
-Date: Wed, 5 Jul 2023 09:29:54 +0900
-Subject: [PATCH] dirmngr: Enable the call of ks_ldap_help_variables when
- USE_LDAP.
-
-* dirmngr/server.c [USE_LDAP] (cmd_ad_query): Conditionalize.
-
---
-
-Upstream-Status: Backport
-Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- dirmngr/server.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/dirmngr/server.c b/dirmngr/server.c
-index 51a149cb2..ee61f63d6 100644
---- a/dirmngr/server.c
-+++ b/dirmngr/server.c
-@@ -2776,7 +2776,9 @@ cmd_ad_query (assuan_context_t ctx, char *line)
- 
-   if (opt_help)
-     {
-+#if USE_LDAP
-       ks_ldap_help_variables (ctrl);
-+#endif
-       err = 0;
-       goto leave;
-     }
--- 
-2.11.0
-
diff --git a/meta/recipes-support/gnupg/gnupg/relocate.patch b/meta/recipes-support/gnupg/gnupg/relocate.patch
index d540e9edbb..0e20a6aec1 100644
--- a/meta/recipes-support/gnupg/gnupg/relocate.patch
+++ b/meta/recipes-support/gnupg/gnupg/relocate.patch
@@ -1,4 +1,4 @@
-From 0e4b325c199354ce54cc4687532cced1440fd496 Mon Sep 17 00:00:00 2001
+From 29fb8230e38a238228017e29f4d25cc250fa3008 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Wed, 19 Sep 2018 14:44:40 +0100
 Subject: [PATCH] Allow the environment to override where gnupg looks for its
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 7 insertions(+), 7 deletions(-)
 
 diff --git a/common/homedir.c b/common/homedir.c
-index 286685f..212a945 100644
+index 6f99f3e..f22aa9e 100644
 --- a/common/homedir.c
 +++ b/common/homedir.c
-@@ -1213,7 +1213,7 @@ gnupg_socketdir (void)
+@@ -1284,7 +1284,7 @@ gnupg_socketdir (void)
    if (!name)
      {
        unsigned int dummy;
@@ -26,7 +26,7 @@ index 286685f..212a945 100644
        gpgrt_annotate_leaked_object (name);
      }
  
-@@ -1245,7 +1245,7 @@ gnupg_sysconfdir (void)
+@@ -1316,7 +1316,7 @@ gnupg_sysconfdir (void)
    if (dir)
      return dir;
    else
@@ -35,7 +35,7 @@ index 286685f..212a945 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1281,7 +1281,7 @@ gnupg_bindir (void)
+@@ -1352,7 +1352,7 @@ gnupg_bindir (void)
        return name;
      }
    else
@@ -44,7 +44,7 @@ index 286685f..212a945 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1308,7 +1308,7 @@ gnupg_libexecdir (void)
+@@ -1379,7 +1379,7 @@ gnupg_libexecdir (void)
        return name;
      }
    else
@@ -53,7 +53,7 @@ index 286685f..212a945 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1338,7 +1338,7 @@ gnupg_libdir (void)
+@@ -1409,7 +1409,7 @@ gnupg_libdir (void)
        return name;
      }
    else
@@ -62,7 +62,7 @@ index 286685f..212a945 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1369,7 +1369,7 @@ gnupg_datadir (void)
+@@ -1440,7 +1440,7 @@ gnupg_datadir (void)
        return name;
      }
    else
@@ -71,7 +71,7 @@ index 286685f..212a945 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1401,7 +1401,7 @@ gnupg_localedir (void)
+@@ -1472,7 +1472,7 @@ gnupg_localedir (void)
        return name;
      }
    else
diff --git a/meta/recipes-support/gnupg/gnupg_2.4.3.bb b/meta/recipes-support/gnupg/gnupg_2.4.4.bb
similarity index 96%
rename from meta/recipes-support/gnupg/gnupg_2.4.3.bb
rename to meta/recipes-support/gnupg/gnupg_2.4.4.bb
index e91ef34b7d..5e589d8a21 100644
--- a/meta/recipes-support/gnupg/gnupg_2.4.3.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.4.4.bb
@@ -18,13 +18,13 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0002-use-pkgconfig-instead-of-npth-config.patch \
            file://0004-autogen.sh-fix-find-version-for-beta-checking.patch \
            file://0001-Woverride-init-is-not-needed-with-gcc-9.patch \
-           file://fix-ldap.patch \
+           file://relocate.patch \
            "
 SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-the-location-of-.patch \
                                 file://relocate.patch"
 SRC_URI:append:class-nativesdk = " file://relocate.patch"
 
-SRC_URI[sha256sum] = "a271ae6d732f6f4d80c258ad9ee88dd9c94c8fdc33c3e45328c4d7c126bd219d"
+SRC_URI[sha256sum] = "67ebe016ca90fa7688ce67a387ebd82c6261e95897db7b23df24ff335be85bc6"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.42.0


--===============3875306887519421270==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/gnupg/gnupg-locale-pt: PKGSIZE changed from 36090 to 235642 (+553%)

--===============3875306887519421270==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gnupg-upgrade-2.4.3-2.4.4.patch"

RnJvbSA2YmVhYTc5MjJkZjY0NDdhODZhMDFjZjhmYTEyOGNjZDlkZWE1ZWEzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBGZWIgMjAyNCAxNzozODowNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdu
dXBnOiB1cGdyYWRlIDIuNC4zIC0+IDIuNC40CgotLS0KIC4uLmVycmlkZS1pbml0LWlzLW5vdC1u
ZWVkZWQtd2l0aC1nY2MtOS5wYXRjaCB8ICA4ICsrLS0tCiAuLi4tYS1jdXN0b20tdmFsdWUtZm9y
LXRoZS1sb2NhdGlvbi1vZi0ucGF0Y2ggfCAgNiArKy0tCiAuLi51c2UtcGtnY29uZmlnLWluc3Rl
YWQtb2YtbnB0aC1jb25maWcucGF0Y2ggfCAgMiArLQogLi4uaC1maXgtZmluZC12ZXJzaW9uLWZv
ci1iZXRhLWNoZWNraW5nLnBhdGNoIHwgMTIgKysrLS0tLQogLi4uL2dudXBnL2dudXBnL2ZpeC1s
ZGFwLnBhdGNoICAgICAgICAgICAgICAgIHwgMzQgLS0tLS0tLS0tLS0tLS0tLS0tLQogLi4uL2du
dXBnL2dudXBnL3JlbG9jYXRlLnBhdGNoICAgICAgICAgICAgICAgIHwgMTggKysrKystLS0tLQog
Li4uL2dudXBnL3tnbnVwZ18yLjQuMy5iYiA9PiBnbnVwZ18yLjQuNC5iYn0gIHwgIDQgKy0tCiA3
IGZpbGVzIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDYxIGRlbGV0aW9ucygtKQogZGVsZXRl
IG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnL2ZpeC1sZGFwLnBh
dGNoCiByZW5hbWUgbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcve2dudXBnXzIuNC4zLmJiID0+
IGdudXBnXzIuNC40LmJifSAoOTYlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0
L2dudXBnL2dudXBnLzAwMDEtV292ZXJyaWRlLWluaXQtaXMtbm90LW5lZWRlZC13aXRoLWdjYy05
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGcvMDAwMS1Xb3ZlcnJpZGUt
aW5pdC1pcy1ub3QtbmVlZGVkLXdpdGgtZ2NjLTkucGF0Y2gKaW5kZXggODMxOTViNWJkNC4uMTFj
YmY4YzhlZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGcvMDAw
MS1Xb3ZlcnJpZGUtaW5pdC1pcy1ub3QtbmVlZGVkLXdpdGgtZ2NjLTkucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGcvMDAwMS1Xb3ZlcnJpZGUtaW5pdC1pcy1ub3Qt
bmVlZGVkLXdpdGgtZ2NjLTkucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGUzYWRjODE2ZDJk
NTZkZDkyOTAxNjA3MzkzN2JhMjRlMDFlMDNjYjggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitG
cm9tIGUxMGQ5MzNjODhkZjhlNDljMGUwMjhhODY2NDI5MjI4MDhmODVhZTcgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogRGF0ZTog
VGh1LCAyMCBEZWMgMjAxOCAxNzozNzo0OCAtMDgwMAogU3ViamVjdDogW1BBVENIXSBXb3ZlcnJp
ZGUtaW5pdCBpcyBub3QgbmVlZGVkIHdpdGggZ2NjIDkKQEAgLTEyLDEyICsxMiwxMyBAQCB1bmFy
eSAnJicgb3BlcmFuZCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8CiBVcHN0cmVhbS1TdGF0dXM6IFBlbmRpbmcKIAogU2lnbmVkLW9mZi1ieTogS2hlbSBS
YWogPHJhai5raGVtQGdtYWlsLmNvbT4KKwogLS0tCiAgZGlybW5nci9kbnMuaCB8IDIgKy0KICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdp
dCBhL2Rpcm1uZ3IvZG5zLmggYi9kaXJtbmdyL2Rucy5oCi1pbmRleCAwMjRkNmRjYzguLmM2ZTE0
MWUxNiAxMDA2NDQKK2luZGV4IDFmNjQ3ZTEuLjMzNGFjYjYgMTAwNjQ0CiAtLS0gYS9kaXJtbmdy
L2Rucy5oCiArKysgYi9kaXJtbmdyL2Rucy5oCiBAQCAtMTM5LDcgKzEzOSw3IEBAIEROU19QVUJM
SUMgaW50ICpkbnNfZGVidWdfcCh2b2lkKTsKQEAgLTI5LDYgKzMwLDMgQEAgaW5kZXggMDI0ZDZk
Y2M4Li5jNmUxNDFlMTYgMTAwNjQ0CiAgI2RlZmluZSBETlNfUFJBR01BX1BVU0ggX1ByYWdtYSgi
R0NDIGRpYWdub3N0aWMgcHVzaCIpCiAgI2RlZmluZSBETlNfUFJBR01BX1FVSUVUIF9QcmFnbWEo
IkdDQyBkaWFnbm9zdGljIGlnbm9yZWQgXCItV292ZXJyaWRlLWluaXRcIiIpCiAgI2RlZmluZSBE
TlNfUFJBR01BX1BPUCBfUHJhZ21hKCJHQ0MgZGlhZ25vc3RpYyBwb3AiKQotLS0gCi0yLjE3LjEK
LQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGcvMDAwMS1jb25m
aWd1cmUuYWMtdXNlLWEtY3VzdG9tLXZhbHVlLWZvci10aGUtbG9jYXRpb24tb2YtLnBhdGNoIGIv
bWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGcvMDAwMS1jb25maWd1cmUuYWMtdXNlLWEt
Y3VzdG9tLXZhbHVlLWZvci10aGUtbG9jYXRpb24tb2YtLnBhdGNoCmluZGV4IDU2MTYxNjU4NGMu
LmI4NGRjYjliOTAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBn
LzAwMDEtY29uZmlndXJlLmFjLXVzZS1hLWN1c3RvbS12YWx1ZS1mb3ItdGhlLWxvY2F0aW9uLW9m
LS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZy8wMDAxLWNvbmZp
Z3VyZS5hYy11c2UtYS1jdXN0b20tdmFsdWUtZm9yLXRoZS1sb2NhdGlvbi1vZi0ucGF0Y2gKQEAg
LTEsNCArMSw0IEBACi1Gcm9tIGFjZGI3ZTFkMjg0NGNkNDA4OGYwOTk2MTdlMjUzNTJiM2RjNWIw
NzUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDY2MDY5ODAzYTU0YWE3NjdlZjNhNTIw
YjMxNTlkNzAxYTVhZGYwZGIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5k
ZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IE1vbiwgMjIgSmFuIDIw
MTggMTg6MDA6MjEgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gY29uZmlndXJlLmFjOiB1c2UgYSBj
dXN0b20gdmFsdWUgZm9yIHRoZSBsb2NhdGlvbiBvZgpAQCAtMTQsMTAgKzE0LDEwIEBAIFNpZ25l
ZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0
IGEvY29uZmlndXJlLmFjIGIvY29uZmlndXJlLmFjCi1pbmRleCBlNjhiNzc5Li5lZWM5Zjg5IDEw
MDY0NAoraW5kZXggMjZkN2Y3Yi4uZTk1M2MyZSAxMDA2NDQKIC0tLSBhL2NvbmZpZ3VyZS5hYwog
KysrIGIvY29uZmlndXJlLmFjCi1AQCAtMTkyMiw3ICsxOTIyLDcgQEAgQUNfREVGSU5FX1VOUVVP
VEVEKEdQR0NPTkZfRElTUF9OQU1FLCAiR1BHQ29uZiIsCitAQCAtMTkyMSw3ICsxOTIxLDcgQEAg
QUNfREVGSU5FX1VOUVVPVEVEKEdQR0NPTkZfRElTUF9OQU1FLCAiR1BHQ29uZiIsCiAgCiAgQUNf
REVGSU5FX1VOUVVPVEVEKEdQR1RBUl9OQU1FLCAiZ3BndGFyIiwgW1RoZSBuYW1lIG9mIHRoZSBn
cGd0YXIgdG9vbF0pCiAgCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9n
bnVwZy8wMDAyLXVzZS1wa2djb25maWctaW5zdGVhZC1vZi1ucHRoLWNvbmZpZy5wYXRjaCBiL21l
dGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnLzAwMDItdXNlLXBrZ2NvbmZpZy1pbnN0ZWFk
LW9mLW5wdGgtY29uZmlnLnBhdGNoCmluZGV4IDBlNThmZDRjNGQuLjBmZGQ5ZmEzYTIgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnLzAwMDItdXNlLXBrZ2NvbmZp
Zy1pbnN0ZWFkLW9mLW5wdGgtY29uZmlnLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0
L2dudXBnL2dudXBnLzAwMDItdXNlLXBrZ2NvbmZpZy1pbnN0ZWFkLW9mLW5wdGgtY29uZmlnLnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBkOTA0ODc4OGQ5MDY3NzRiMTQ3NWMzYmIxYjE3ZTIy
NDU1YzJhZGQ0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA4NmViYjZjZGM1OWM5YjQ3
NGZmNzUyOTI5NDgzMjc5MDMwODJjMmQzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
U2F1bCBXb2xkIDxzZ3dAbGludXguaW50ZWwuY29tPgogRGF0ZTogV2VkLCAxNiBBdWcgMjAxNyAx
MToxNjozMCArMDgwMAogU3ViamVjdDogW1BBVENIXSB1c2UgcGtnY29uZmlnIGluc3RlYWQgb2Yg
bnB0aCBjb25maWcKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBn
LzAwMDQtYXV0b2dlbi5zaC1maXgtZmluZC12ZXJzaW9uLWZvci1iZXRhLWNoZWNraW5nLnBhdGNo
IGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGcvMDAwNC1hdXRvZ2VuLnNoLWZpeC1m
aW5kLXZlcnNpb24tZm9yLWJldGEtY2hlY2tpbmcucGF0Y2gKaW5kZXggZGNkODU4MmNhNi4uNjY4
NDJlNmQ0OSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGcvMDAw
NC1hdXRvZ2VuLnNoLWZpeC1maW5kLXZlcnNpb24tZm9yLWJldGEtY2hlY2tpbmcucGF0Y2gKKysr
IGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGcvMDAwNC1hdXRvZ2VuLnNoLWZpeC1m
aW5kLXZlcnNpb24tZm9yLWJldGEtY2hlY2tpbmcucGF0Y2gKQEAgLTEsNyArMSw3IEBACi1Gcm9t
IDkxNGFlNGEzZjc1MjlmYjA2OTQ2N2JmMGRlZDU3ZGQyNGVlMmU3NjMgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tIDc5MTBlYWVjNTc0YWQ2ZDBkZTY2NzQ5MjlhMWY0MWExYjM2YmNhNTQg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBXZW56b25nIEZhbiA8d2Vuem9uZy5mYW5A
d2luZHJpdmVyLmNvbT4KIERhdGU6IFdlZCwgMTYgQXVnIDIwMTcgMTE6MjM6MjIgKzA4MDAKLVN1
YmplY3Q6IFtQQVRDSCA0LzRdIGF1dG9nZW4uc2g6IGZpeCBmaW5kLXZlcnNpb24gZm9yIGJldGEg
Y2hlY2tpbmcKK1N1YmplY3Q6IFtQQVRDSF0gYXV0b2dlbi5zaDogZml4IGZpbmQtdmVyc2lvbiBm
b3IgYmV0YSBjaGVja2luZwogCiBmaW5kLXZlcnNpb24gYWx3YXlzIGFzc3VtZXMgdGhhdCBnbnVw
ZyBpcyBiZXRhIGlmIGF1dG9nZW4uc2ggaXMgcnVuCiBvdXQgb2YgZ2l0LXJlcG8uIFRoaXMgZG9l
c24ndCB3b3JrIGZvciB1c2VycyB3aG9tIGp1c3QgdGFrZSByZWxlYXNlCkBAIC0xMywxNSArMTMs
MTYgQEAgU2lnbmVkLW9mZi1ieTogV2Vuem9uZyBGYW4gPHdlbnpvbmcuZmFuQHdpbmRyaXZlci5j
b20+CiAKIFJlYmFzZSB0byAyLjEuMjMKIFNpZ25lZC1vZmYtYnk6IEhvbmd4dSBKaWEgPGhvbmd4
dS5qaWFAd2luZHJpdmVyLmNvbT4KKwogLS0tCiAgYXV0b2dlbi5zaCB8IDEgLQogIDEgZmlsZSBj
aGFuZ2VkLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9hdXRvZ2VuLnNoIGIvYXV0b2dl
bi5zaAotaW5kZXggZTViYTViZi4uMDVlMGUxMSAxMDA3NTUKK2luZGV4IDBhYmYxMDMuLjc4NzUz
YjUgMTAwNzU1CiAtLS0gYS9hdXRvZ2VuLnNoCiArKysgYi9hdXRvZ2VuLnNoCi1AQCAtMjQ1LDcg
KzI0NSw2IEBAIGlmIFsgIiRteWhvc3QiID0gImZpbmQtdmVyc2lvbiIgXTsgdGhlbgorQEAgLTIz
Nyw3ICsyMzcsNiBAQCBpZiBbICIkbXlob3N0IiA9ICJmaW5kLXZlcnNpb24iIF07IHRoZW4KICAg
ICAgICBydmQ9JCgoMHgkKGVjaG8gJHtyZXZ9IHwgZGQgYnM9MSBjb3VudD00IDI+L2Rldi9udWxs
KSkpCiAgICAgIGVsc2UKICAgICAgICBpbmdpdD1ubwpAQCAtMjksNiArMzAsMyBAQCBpbmRleCBl
NWJhNWJmLi4wNWUwZTExIDEwMDc1NQogICAgICAgIHRtcD0iLXVua25vd24iCiAgICAgICAgcmV2
PSIwMDAwMDAwIgogICAgICAgIHJ2ZD0iMCIKLS0tIAotMS44LjMuMQotCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZy9maXgtbGRhcC5wYXRjaCBiL21ldGEvcmVj
aXBlcy1zdXBwb3J0L2dudXBnL2dudXBnL2ZpeC1sZGFwLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2Rl
IDEwMDY0NAppbmRleCA0NzU0NzgxNTY1Li4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1z
dXBwb3J0L2dudXBnL2dudXBnL2ZpeC1sZGFwLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsMzQg
KzAsMCBAQAotRnJvbSBkYzEzMzYxNTI0YzE0NzdiMjEwNmM3Mzg1ZjIwNTlmOWVhMTExYjg0IE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogTklJQkUgWXV0YWthIDxnbmlpYmVAZnNpai5v
cmc+Ci1EYXRlOiBXZWQsIDUgSnVsIDIwMjMgMDk6Mjk6NTQgKzA5MDAKLVN1YmplY3Q6IFtQQVRD
SF0gZGlybW5ncjogRW5hYmxlIHRoZSBjYWxsIG9mIGtzX2xkYXBfaGVscF92YXJpYWJsZXMgd2hl
bgotIFVTRV9MREFQLgotCi0qIGRpcm1uZ3Ivc2VydmVyLmMgW1VTRV9MREFQXSAoY21kX2FkX3F1
ZXJ5KTogQ29uZGl0aW9uYWxpemUuCi0KLS0tCi0KLVVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQK
LVNpZ25lZC1vZmYtYnk6IE5JSUJFIFl1dGFrYSA8Z25paWJlQGZzaWoub3JnPgotU2lnbmVkLW9m
Zi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KLS0tLQotIGRpcm1u
Z3Ivc2VydmVyLmMgfCAyICsrCi0gMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQotCi1k
aWZmIC0tZ2l0IGEvZGlybW5nci9zZXJ2ZXIuYyBiL2Rpcm1uZ3Ivc2VydmVyLmMKLWluZGV4IDUx
YTE0OWNiMi4uZWU2MWY2M2Q2IDEwMDY0NAotLS0tIGEvZGlybW5nci9zZXJ2ZXIuYwotKysrIGIv
ZGlybW5nci9zZXJ2ZXIuYwotQEAgLTI3NzYsNyArMjc3Niw5IEBAIGNtZF9hZF9xdWVyeSAoYXNz
dWFuX2NvbnRleHRfdCBjdHgsIGNoYXIgKmxpbmUpCi0gCi0gICBpZiAob3B0X2hlbHApCi0gICAg
IHsKLSsjaWYgVVNFX0xEQVAKLSAgICAgICBrc19sZGFwX2hlbHBfdmFyaWFibGVzIChjdHJsKTsK
LSsjZW5kaWYKLSAgICAgICBlcnIgPSAwOwotICAgICAgIGdvdG8gbGVhdmU7Ci0gICAgIH0KLS0t
IAotMi4xMS4wCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBn
L3JlbG9jYXRlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGcvcmVsb2Nh
dGUucGF0Y2gKaW5kZXggZDU0MGU5ZWRiYi4uMGUyMGE2YWVjMSAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGcvcmVsb2NhdGUucGF0Y2gKKysrIGIvbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZ251cGcvZ251cGcvcmVsb2NhdGUucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1G
cm9tIDBlNGIzMjVjMTk5MzU0Y2U1NGNjNDY4NzUzMmNjZWQxNDQwZmQ0OTYgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIDI5ZmI4MjMwZTM4YTIzODIyODAxN2UyOWY0ZDI1Y2MyNTBmYTMw
MDggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0
b25AaW50ZWwuY29tPgogRGF0ZTogV2VkLCAxOSBTZXAgMjAxOCAxNDo0NDo0MCArMDEwMAogU3Vi
amVjdDogW1BBVENIXSBBbGxvdyB0aGUgZW52aXJvbm1lbnQgdG8gb3ZlcnJpZGUgd2hlcmUgZ251
cGcgbG9va3MgZm9yIGl0cwpAQCAtMTQsMTAgKzE0LDEwIEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhh
bmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+CiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5z
ZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL2NvbW1vbi9ob21lZGly
LmMgYi9jb21tb24vaG9tZWRpci5jCi1pbmRleCAyODY2ODVmLi4yMTJhOTQ1IDEwMDY0NAoraW5k
ZXggNmY5OWYzZS4uZjIyYWE5ZSAxMDA2NDQKIC0tLSBhL2NvbW1vbi9ob21lZGlyLmMKICsrKyBi
L2NvbW1vbi9ob21lZGlyLmMKLUBAIC0xMjEzLDcgKzEyMTMsNyBAQCBnbnVwZ19zb2NrZXRkaXIg
KHZvaWQpCitAQCAtMTI4NCw3ICsxMjg0LDcgQEAgZ251cGdfc29ja2V0ZGlyICh2b2lkKQogICAg
aWYgKCFuYW1lKQogICAgICB7CiAgICAgICAgdW5zaWduZWQgaW50IGR1bW15OwpAQCAtMjYsNyAr
MjYsNyBAQCBpbmRleCAyODY2ODVmLi4yMTJhOTQ1IDEwMDY0NAogICAgICAgIGdwZ3J0X2Fubm90
YXRlX2xlYWtlZF9vYmplY3QgKG5hbWUpOwogICAgICB9CiAgCi1AQCAtMTI0NSw3ICsxMjQ1LDcg
QEAgZ251cGdfc3lzY29uZmRpciAodm9pZCkKK0BAIC0xMzE2LDcgKzEzMTYsNyBAQCBnbnVwZ19z
eXNjb25mZGlyICh2b2lkKQogICAgaWYgKGRpcikKICAgICAgcmV0dXJuIGRpcjsKICAgIGVsc2UK
QEAgLTM1LDcgKzM1LDcgQEAgaW5kZXggMjg2Njg1Zi4uMjEyYTk0NSAxMDA2NDQKICAjZW5kaWYg
LyohSEFWRV9XMzJfU1lTVEVNKi8KICB9CiAgCi1AQCAtMTI4MSw3ICsxMjgxLDcgQEAgZ251cGdf
YmluZGlyICh2b2lkKQorQEAgLTEzNTIsNyArMTM1Miw3IEBAIGdudXBnX2JpbmRpciAodm9pZCkK
ICAgICAgICByZXR1cm4gbmFtZTsKICAgICAgfQogICAgZWxzZQpAQCAtNDQsNyArNDQsNyBAQCBp
bmRleCAyODY2ODVmLi4yMTJhOTQ1IDEwMDY0NAogICNlbmRpZiAvKiFIQVZFX1czMl9TWVNURU0q
LwogIH0KICAKLUBAIC0xMzA4LDcgKzEzMDgsNyBAQCBnbnVwZ19saWJleGVjZGlyICh2b2lkKQor
QEAgLTEzNzksNyArMTM3OSw3IEBAIGdudXBnX2xpYmV4ZWNkaXIgKHZvaWQpCiAgICAgICAgcmV0
dXJuIG5hbWU7CiAgICAgIH0KICAgIGVsc2UKQEAgLTUzLDcgKzUzLDcgQEAgaW5kZXggMjg2Njg1
Zi4uMjEyYTk0NSAxMDA2NDQKICAjZW5kaWYgLyohSEFWRV9XMzJfU1lTVEVNKi8KICB9CiAgCi1A
QCAtMTMzOCw3ICsxMzM4LDcgQEAgZ251cGdfbGliZGlyICh2b2lkKQorQEAgLTE0MDksNyArMTQw
OSw3IEBAIGdudXBnX2xpYmRpciAodm9pZCkKICAgICAgICByZXR1cm4gbmFtZTsKICAgICAgfQog
ICAgZWxzZQpAQCAtNjIsNyArNjIsNyBAQCBpbmRleCAyODY2ODVmLi4yMTJhOTQ1IDEwMDY0NAog
ICNlbmRpZiAvKiFIQVZFX1czMl9TWVNURU0qLwogIH0KICAKLUBAIC0xMzY5LDcgKzEzNjksNyBA
QCBnbnVwZ19kYXRhZGlyICh2b2lkKQorQEAgLTE0NDAsNyArMTQ0MCw3IEBAIGdudXBnX2RhdGFk
aXIgKHZvaWQpCiAgICAgICAgcmV0dXJuIG5hbWU7CiAgICAgIH0KICAgIGVsc2UKQEAgLTcxLDcg
KzcxLDcgQEAgaW5kZXggMjg2Njg1Zi4uMjEyYTk0NSAxMDA2NDQKICAjZW5kaWYgLyohSEFWRV9X
MzJfU1lTVEVNKi8KICB9CiAgCi1AQCAtMTQwMSw3ICsxNDAxLDcgQEAgZ251cGdfbG9jYWxlZGly
ICh2b2lkKQorQEAgLTE0NzIsNyArMTQ3Miw3IEBAIGdudXBnX2xvY2FsZWRpciAodm9pZCkKICAg
ICAgICByZXR1cm4gbmFtZTsKICAgICAgfQogICAgZWxzZQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZ251cGcvZ251cGdfMi40LjMuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9n
bnVwZy9nbnVwZ18yLjQuNC5iYgpzaW1pbGFyaXR5IGluZGV4IDk2JQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZ18yLjQuMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZ251cGcvZ251cGdfMi40LjQuYmIKaW5kZXggZTkxZWYzNGI3ZC4uNWU1ODlk
OGEyMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGdfMi40LjMu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGdfMi40LjQuYmIKQEAgLTE4
LDEzICsxOCwxMyBAQCBTUkNfVVJJID0gIiR7R05VUEdfTUlSUk9SfS8ke0JQTn0vJHtCUE59LSR7
UFZ9LnRhci5iejIgXAogICAgICAgICAgICBmaWxlOi8vMDAwMi11c2UtcGtnY29uZmlnLWluc3Rl
YWQtb2YtbnB0aC1jb25maWcucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwNC1hdXRvZ2Vu
LnNoLWZpeC1maW5kLXZlcnNpb24tZm9yLWJldGEtY2hlY2tpbmcucGF0Y2ggXAogICAgICAgICAg
ICBmaWxlOi8vMDAwMS1Xb3ZlcnJpZGUtaW5pdC1pcy1ub3QtbmVlZGVkLXdpdGgtZ2NjLTkucGF0
Y2ggXAotICAgICAgICAgICBmaWxlOi8vZml4LWxkYXAucGF0Y2ggXAorICAgICAgICAgICBmaWxl
Oi8vcmVsb2NhdGUucGF0Y2ggXAogICAgICAgICAgICAiCiBTUkNfVVJJOmFwcGVuZDpjbGFzcy1u
YXRpdmUgPSAiIGZpbGU6Ly8wMDAxLWNvbmZpZ3VyZS5hYy11c2UtYS1jdXN0b20tdmFsdWUtZm9y
LXRoZS1sb2NhdGlvbi1vZi0ucGF0Y2ggXAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBmaWxlOi8vcmVsb2NhdGUucGF0Y2giCiBTUkNfVVJJOmFwcGVuZDpjbGFzcy1uYXRpdmVzZGsg
PSAiIGZpbGU6Ly9yZWxvY2F0ZS5wYXRjaCIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImEyNzFh
ZTZkNzMyZjZmNGQ4MGMyNThhZDllZTg4ZGQ5Yzk0YzhmZGMzM2MzZTQ1MzI4YzRkN2MxMjZiZDIx
OWQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNjdlYmUwMTZjYTkwZmE3Njg4Y2U2N2EzODdlYmQ4
MmM2MjYxZTk1ODk3ZGI3YjIzZGYyNGZmMzM1YmU4NWJjNiIKIAogRVhUUkFfT0VDT05GID0gIi0t
ZGlzYWJsZS1sZGFwIFwKIAkJLS1kaXNhYmxlLWNjaWQtZHJpdmVyIFwKLS0gCjIuNDIuMAoK

--===============3875306887519421270==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gnupg/gnupg-dbg: PKGV changed from 2.4.3 [default] to 2.4.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-dbg: PV changed from "2.4.3" to "2.4.4"
packages/core2-64-poky-linux/gnupg/gnupg-dbg: PKGSIZE changed from 20605872 to 20743368 (+1%)
packages/core2-64-poky-linux/gnupg/gnupg-dev: PKGV changed from 2.4.3 [default] to 2.4.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-dev: PV changed from "2.4.3" to "2.4.4"
packages/core2-64-poky-linux/gnupg/gnupg-doc: PKGV changed from 2.4.3 [default] to 2.4.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-doc: PV changed from "2.4.3" to "2.4.4"
packages/core2-64-poky-linux/gnupg/gnupg-doc: PKGSIZE changed from 1186249 to 1192073 (+0%)
packages/core2-64-poky-linux/gnupg/gnupg-gpg: PKGV changed from 2.4.3 [default] to 2.4.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-gpg: PV changed from "2.4.3" to "2.4.4"
packages/core2-64-poky-linux/gnupg/gnupg-gpg: PKGSIZE changed from 1562612 to 1587252 (+2%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-ca: PKGV changed from 2.4.3 [default] to 2.4.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-ca: PV changed from "2.4.3" to "2.4.4"
packages/core2-64-poky-linux/gnupg/gnupg-locale-cs: PKGV changed from 2.4.3 [default] to 2.4.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-cs: PV changed from "2.4.3" to "2.4.4"
packages/core2-64-poky-linux/gnupg/gnupg-locale-da: PKGV changed from 2.4.3 [default] to 2.4.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-da: PV changed from "2.4.3" to "2.4.4"
packages/core2-64-poky-linux/gnupg/gnupg-locale-de: PKGV changed from 2.4.3 [default] to 2.4.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-de: PV changed from "2.4.3" to "2.4.4"
packages/core2-64-poky-linux/gnupg/gnupg-locale-de: PKGSIZE changed from 245640 to 245737 (+0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-el: PKGV changed from 2.4.3 [default] to 2.4.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-el: PV changed from "2.4.3" to "2.4.4"
packages/core2-64-poky-linux/gnupg/gnupg-locale-en+boldquot: PKGV changed from 2.4.3 [default] to 2.4.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-en+boldquot: PV changed from "2.4.3" to "2.4.4"
packages/core2-64-poky-linux/gnupg/gnupg-locale-en+boldquot: PKGSIZE changed from 223822 to 223900 (+0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-en+quot: PKGV changed from 2.4.3 [default] to 2.4.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-en+quot: PV changed from "2.4.3" to "2.4.4"
packages/core2-64-poky-linux/gnupg/gnupg-locale-en+quot: PKGSIZE changed from 221446 to 221524 (+0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-eo: PKGV changed from 2.4.3 [default] to 2.4.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-eo: PV changed from "2.4.3" to "2.4.4"
packages/core2-64-poky-linux/gnupg/gnupg-locale-es: PKGV changed from 2.4.3 [default] to 2.4.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-es: PV changed from "2.4.3" to "2.4.4"
packages/core2-64-poky-linux/gnupg/gnupg-locale-et: PKGV changed from 2.4.3 [default] to 2.4.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-et: PV changed from "2.4.3" to "2.4.4"
packages/core2-64-poky-linux/gnupg/gnupg-locale-fi: PKGV changed from 2.4.3 [default] to 2.4.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-fi: PV changed from "2.4.3" to "2.4.4"
packages/core2-64-poky-linux/gnupg/gnupg-locale-fr: PKGV changed from 2.4.3 [default] to 2.4.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-fr: PV changed from "2.4.3" to "2.4.4"
packages/core2-64-poky-linux/gnupg/gnupg-locale-gl: PKGV changed from 2.4.3 [default] to 2.4.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-gl: PV changed from "2.4.3" to "2.4.4"
packages/core2-64-poky-linux/gnupg/gnupg-locale-hu: PKGV changed from 2.4.3 [default] to 2.4.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-hu: PV changed from "2.4.3" to "2.4.4"
packages/core2-64-poky-linux/gnupg/gnupg-locale-id: PKGV changed from 2.4.3 [default] to 2.4.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-id: PV changed from "2.4.3" to "2.4.4"
packages/core2-64-poky-linux/gnupg/gnupg-locale-it: PKGV changed from 2.4.3 [default] to 2.4.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-it: PV changed from "2.4.3" to "2.4.4"
packages/core2-64-poky-linux/gnupg/gnupg-locale-it: PKGSIZE changed from 235750 to 235749 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-ja: PKGV changed from 2.4.3 [default] to 2.4.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-ja: PV changed from "2.4.3" to "2.4.4"
packages/core2-64-poky-linux/gnupg/gnupg-locale-ja: PKGSIZE changed from 252865 to 252952 (+0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-nb: PKGV changed from 2.4.3 [default] to 2.4.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-nb: PV changed from "2.4.3" to "2.4.4"
packages/core2-64-poky-linux/gnupg/gnupg-locale-pl: PKGV changed from 2.4.3 [default] to 2.4.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-pl: PV changed from "2.4.3" to "2.4.4"
packages/core2-64-poky-linux/gnupg/gnupg-locale-pl: PKGSIZE changed from 228347 to 239518 (+5%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-pt: PKGV changed from 2.4.3 [default] to 2.4.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-pt: PV changed from "2.4.3" to "2.4.4"
packages/core2-64-poky-linux/gnupg/gnupg-locale-pt: PKGSIZE changed from 36090 to 235642 (+553%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-ro: PKGV changed from 2.4.3 [default] to 2.4.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-ro: PV changed from "2.4.3" to "2.4.4"
packages/core2-64-poky-linux/gnupg/gnupg-locale-ru: PKGV changed from 2.4.3 [default] to 2.4.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-ru: PV changed from "2.4.3" to "2.4.4"
packages/core2-64-poky-linux/gnupg/gnupg-locale-sk: PKGV changed from 2.4.3 [default] to 2.4.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-sk: PV changed from "2.4.3" to "2.4.4"
packages/core2-64-poky-linux/gnupg/gnupg-locale-sv: PKGV changed from 2.4.3 [default] to 2.4.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-sv: PV changed from "2.4.3" to "2.4.4"
packages/core2-64-poky-linux/gnupg/gnupg-locale-tr: PKGV changed from 2.4.3 [default] to 2.4.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-tr: PV changed from "2.4.3" to "2.4.4"
packages/core2-64-poky-linux/gnupg/gnupg-locale-uk: PKGV changed from 2.4.3 [default] to 2.4.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-uk: PV changed from "2.4.3" to "2.4.4"
packages/core2-64-poky-linux/gnupg/gnupg-locale-zh-cn: PKGV changed from 2.4.3 [default] to 2.4.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-zh-cn: PV changed from "2.4.3" to "2.4.4"
packages/core2-64-poky-linux/gnupg/gnupg-locale-zh-tw: PKGV changed from 2.4.3 [default] to 2.4.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-zh-tw: PV changed from "2.4.3" to "2.4.4"
packages/core2-64-poky-linux/gnupg/gnupg-locale-zh-tw: PKGSIZE changed from 174338 to 174337 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-src: PKGV changed from 2.4.3 [default] to 2.4.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-src: FILELIST: directory renamed /usr/src/debug/gnupg/2.4.3/tests/gpgscm -> /usr/src/debug/gnupg/2.4.4/tests/gpgscm, directory renamed /usr/src/debug/gnupg/2.4.3/regexp -> /usr/src/debug/gnupg/2.4.4/regexp, directory renamed /usr/src/debug/gnupg/2.4.3/dirmngr -> /usr/src/debug/gnupg/2.4.4/dirmngr, directory renamed /usr/src/debug/gnupg/2.4.3/g10 -> /usr/src/debug/gnupg/2.4.4/g10, directory renamed /usr/src/debug/gnupg/2.4.3/kbx -> /usr/src/debug/gnupg/2.4.4/kbx, directory renamed /usr/src/debug/gnupg/2.4.3/sm -> /usr/src/debug/gnupg/2.4.4/sm, directory renamed /usr/src/debug/gnupg/2.4.3/agent -> /usr/src/debug/gnupg/2.4.4/agent, directory renamed /usr/src/debug/gnupg/2.4.3/scd -> /usr/src/debug/gnupg/2.4.4/scd, directory renamed /usr/src/debug/gnupg/2.4.3/tools -> /usr/src/debug/gnupg/2.4.4/tools, removed "/usr/src/debug/gnupg/2.4.3/common/server-help.h /usr/src/debug/gnupg/2.4.3/common/server-help.c /usr/src/debug/gnupg/2.4.3/common/openpgp-s
 2k.c /usr/src/debug/gnupg/2.4.3/common/agent-opt.c /usr/src/debug/gnupg/2.4.3/common/get-passphrase.h /usr/src/debug/gnupg/2.4.3/common/sexp-parse.h /usr/src/debug/gnupg/2.4.3/common/get-passphrase.c /usr/src/debug/gnupg/2.4.3/common/tlv-builder.c /usr/src/debug/gnupg/2.4.3/common/status-codes.h /usr/src/debug/gnupg/2.4.3/common/utf8conv.h /usr/src/debug/gnupg/2.4.3/common/zb32.h /usr/src/debug/gnupg/2.4.3/common/utf8conv.c /usr/src/debug/gnupg/2.4.3/common/zb32.c /usr/src/debug/gnupg/2.4.3/common/name-value.h /usr/src/debug/gnupg/2.4.3/common/name-value.c /usr/src/debug/gnupg/2.4.3/common/utilproto.h /usr/src/debug/gnupg/2.4.3/common/ksba-io-support.c /usr/src/debug/gnupg/2.4.3/common/xreadline.c /usr/src/debug/gnupg/2.4.3/common/common-defs.h /usr/src/debug/gnupg/2.4.3/common/ksba-io-support.h /usr/src/debug/gnupg/2.4.3/common/pkscreening.c /usr/src/debug/gnupg/2.4.3/common/session-env.h /usr/src/debug/gnupg/2.4.3/common/pkscreening.h /usr/src/debug/gnupg/2.4.3/common/session-env.
 c /usr/src/debug/gnupg/2.4.3/common/dotlock.h /usr/src/debug/gnupg/2.4.3/common/compliance.h /usr/src/debug/gnupg/2.4.3/common/sysutils.c /usr/src/debug/gnupg/2.4.3/common/dotlock.c /usr/src/debug/gnupg/2.4.3/common/sysutils.h /usr/src/debug/gnupg/2.4.3/common/compliance.c /usr/src/debug/gnupg/2.4.3/common/init.h /usr/src/debug/gnupg/2.4.3/common/init.c /usr/src/debug/gnupg/2.4.3/common/ssh-utils.c /usr/src/debug/gnupg/2.4.3/common/ssh-utils.h /usr/src/debug/gnupg/2.4.3/common/util.h /usr/src/debug/gnupg/2.4.3/common/openpgp-fpr.c /usr/src/debug/gnupg/2.4.3/common/comopt.h /usr/src/debug/gnupg/2.4.3/common/membuf.h /usr/src/debug/gnupg/2.4.3/common/recsel.h /usr/src/debug/gnupg/2.4.3/common/status.h /usr/src/debug/gnupg/2.4.3/common/comopt.c /usr/src/debug/gnupg/2.4.3/common/b64dec.c /usr/src/debug/gnupg/2.4.3/common/membuf.c /usr/src/debug/gnupg/2.4.3/common/recsel.c /usr/src/debug/gnupg/2.4.3/common/signal.c /usr/src/debug/gnupg/2.4.3/common/i18n.c /usr/src/debug/gnupg/2.4.3/commo
 n/status.c /usr/src/debug/gnupg/2.4.3/common/b64enc.c /usr/src/debug/gnupg/2.4.3/common/audit.c /usr/src/debug/gnupg/2.4.3/common/i18n.h /usr/src/debug/gnupg/2.4.3/common/iobuf.c /usr/src/debug/gnupg/2.4.3/common/asshelp2.c /usr/src/debug/gnupg/2.4.3/common/localename.c /usr/src/debug/gnupg/2.4.3/common/audit.h /usr/src/debug/gnupg/2.4.3/common/iobuf.h /usr/src/debug/gnupg/2.4.3/common/ttyio.c /usr/src/debug/gnupg/2.4.3/common/ttyio.h /usr/src/debug/gnupg/2.4.3/common/types.h /usr/src/debug/gnupg/2.4.3/common/simple-pwquery.c /usr/src/debug/gnupg/2.4.3/common/simple-pwquery.h /usr/src/debug/gnupg/2.4.3/common/mischelp.c /usr/src/debug/gnupg/2.4.3/common/yesno.c /usr/src/debug/gnupg/2.4.3/common/exechelp.h /usr/src/debug/gnupg/2.4.3/common/mischelp.h /usr/src/debug/gnupg/2.4.3/common/exectool.c /usr/src/debug/gnupg/2.4.3/common/exectool.h /usr/src/debug/gnupg/2.4.3/common/userids.c /usr/src/debug/gnupg/2.4.3/common/asshelp.h /usr/src/debug/gnupg/2.4.3/common/userids.h /usr/src/debug/
 gnupg/2.4.3/common/asshelp.c /usr/src/debug/gnupg/2.4.3/common/homedir.c /usr/src/debug/gnupg/2.4.3/common/audit-events.h /usr/src/debug/gnupg/2.4.3/common/shareddefs.h /usr/src/debug/gnupg/2.4.3/common/ccparray.c /usr/src/debug/gnupg/2.4.3/common/helpfile.c /usr/src/debug/gnupg/2.4.3/common/gettime.c /usr/src/debug/gnupg/2.4.3/common/mbox-util.c /usr/src/debug/gnupg/2.4.3/common/ccparray.h /usr/src/debug/gnupg/2.4.3/common/gettime.h /usr/src/debug/gnupg/2.4.3/common/mbox-util.h /usr/src/debug/gnupg/2.4.3/common/sexputil.c /usr/src/debug/gnupg/2.4.3/common/stringhelp.c /usr/src/debug/gnupg/2.4.3/common/stringhelp.h /usr/src/debug/gnupg/2.4.3/common/mapstrings.c /usr/src/debug/gnupg/2.4.3/common/logging.h /usr/src/debug/gnupg/2.4.3/common/openpgp-oid.c /usr/src/debug/gnupg/2.4.3/common/gpgrlhelp.c /usr/src/debug/gnupg/2.4.3/common/fwddecl.h /usr/src/debug/gnupg/2.4.3/common/exechelp-posix.c /usr/src/debug/gnupg/2.4.3/common/tlv.h /usr/src/debug/gnupg/2.4.3/common/miscellaneous.c /usr
 /src/debug/gnupg/2.4.3/common/tlv.c /usr/src/debug/gnupg/2.4.3/common/xasprintf.c /usr/src/debug/gnupg/2.4.3/common/convert.c /usr/src/debug/gnupg/2.4.3/common/host2net.h /usr/src/debug/gnupg/2.4.3/common/percent.c /usr/src/debug/gnupg/2.4.3/common/strlist.c /usr/src/debug/gnupg/2.4.3/common/strlist.h /usr/src/debug/gnupg/2.4.3/common/openpgpdefs.h", added "/usr/src/debug/gnupg/2.4.4/common/i18n.c /usr/src/debug/gnupg/2.4.4/common/iobuf.c /usr/src/debug/gnupg/2.4.4/common/i18n.h /usr/src/debug/gnupg/2.4.4/common/audit.c /usr/src/debug/gnupg/2.4.4/common/asshelp2.c /usr/src/debug/gnupg/2.4.4/common/localename.c /usr/src/debug/gnupg/2.4.4/common/audit.h /usr/src/debug/gnupg/2.4.4/common/iobuf.h /usr/src/debug/gnupg/2.4.4/common/ttyio.c /usr/src/debug/gnupg/2.4.4/common/ttyio.h /usr/src/debug/gnupg/2.4.4/common/types.h /usr/src/debug/gnupg/2.4.4/common/simple-pwquery.c /usr/src/debug/gnupg/2.4.4/common/simple-pwquery.h /usr/src/debug/gnupg/2.4.4/common/mischelp.c /usr/src/debug/gnupg/2
 .4.4/common/exechelp.h /usr/src/debug/gnupg/2.4.4/common/mischelp.h /usr/src/debug/gnupg/2.4.4/common/exectool.c /usr/src/debug/gnupg/2.4.4/common/exectool.h /usr/src/debug/gnupg/2.4.4/common/userids.c /usr/src/debug/gnupg/2.4.4/common/asshelp.h /usr/src/debug/gnupg/2.4.4/common/userids.h /usr/src/debug/gnupg/2.4.4/common/asshelp.c /usr/src/debug/gnupg/2.4.4/common/homedir.c /usr/src/debug/gnupg/2.4.4/common/yesno.c /usr/src/debug/gnupg/2.4.4/common/audit-events.h /usr/src/debug/gnupg/2.4.4/common/shareddefs.h /usr/src/debug/gnupg/2.4.4/common/ccparray.c /usr/src/debug/gnupg/2.4.4/common/helpfile.c /usr/src/debug/gnupg/2.4.4/common/gettime.c /usr/src/debug/gnupg/2.4.4/common/mbox-util.c /usr/src/debug/gnupg/2.4.4/common/ccparray.h /usr/src/debug/gnupg/2.4.4/common/gettime.h /usr/src/debug/gnupg/2.4.4/common/mbox-util.h /usr/src/debug/gnupg/2.4.4/common/sexputil.c /usr/src/debug/gnupg/2.4.4/common/stringhelp.c /usr/src/debug/gnupg/2.4.4/common/stringhelp.h /usr/src/debug/gnupg/2.4.4/
 common/mapstrings.c /usr/src/debug/gnupg/2.4.4/common/logging.h /usr/src/debug/gnupg/2.4.4/common/openpgp-oid.c /usr/src/debug/gnupg/2.4.4/common/gpgrlhelp.c /usr/src/debug/gnupg/2.4.4/common/fwddecl.h /usr/src/debug/gnupg/2.4.4/common/exechelp-posix.c /usr/src/debug/gnupg/2.4.4/common/tlv.h /usr/src/debug/gnupg/2.4.4/common/miscellaneous.c /usr/src/debug/gnupg/2.4.4/common/tlv.c /usr/src/debug/gnupg/2.4.4/common/xasprintf.c /usr/src/debug/gnupg/2.4.4/common/strlist.c /usr/src/debug/gnupg/2.4.4/common/convert.c /usr/src/debug/gnupg/2.4.4/common/host2net.h /usr/src/debug/gnupg/2.4.4/common/percent.c /usr/src/debug/gnupg/2.4.4/common/recsel.c /usr/src/debug/gnupg/2.4.4/common/signal.c /usr/src/debug/gnupg/2.4.4/common/status.c /usr/src/debug/gnupg/2.4.4/common/b64enc.c /usr/src/debug/gnupg/2.4.4/common/strlist.h /usr/src/debug/gnupg/2.4.4/common/openpgpdefs.h /usr/src/debug/gnupg/2.4.4/common/b64dec.c /usr/src/debug/gnupg/2.4.4/common/comopt.c /usr/src/debug/gnupg/2.4.4/common/server-
 help.h /usr/src/debug/gnupg/2.4.4/common/server-help.c /usr/src/debug/gnupg/2.4.4/common/openpgp-s2k.c /usr/src/debug/gnupg/2.4.4/common/agent-opt.c /usr/src/debug/gnupg/2.4.4/common/get-passphrase.h /usr/src/debug/gnupg/2.4.4/common/sexp-parse.h /usr/src/debug/gnupg/2.4.4/common/get-passphrase.c /usr/src/debug/gnupg/2.4.4/common/tlv-builder.c /usr/src/debug/gnupg/2.4.4/common/status-codes.h /usr/src/debug/gnupg/2.4.4/common/zb32.h /usr/src/debug/gnupg/2.4.4/common/utf8conv.h /usr/src/debug/gnupg/2.4.4/common/utf8conv.c /usr/src/debug/gnupg/2.4.4/common/zb32.c /usr/src/debug/gnupg/2.4.4/common/name-value.h /usr/src/debug/gnupg/2.4.4/common/name-value.c /usr/src/debug/gnupg/2.4.4/common/utilproto.h /usr/src/debug/gnupg/2.4.4/common/tlv-parser.c /usr/src/debug/gnupg/2.4.4/common/ksba-io-support.c /usr/src/debug/gnupg/2.4.4/common/xreadline.c /usr/src/debug/gnupg/2.4.4/common/common-defs.h /usr/src/debug/gnupg/2.4.4/common/ksba-io-support.h /usr/src/debug/gnupg/2.4.4/common/pkscreening
 .c /usr/src/debug/gnupg/2.4.4/common/session-env.h /usr/src/debug/gnupg/2.4.4/common/pkscreening.h /usr/src/debug/gnupg/2.4.4/common/session-env.c /usr/src/debug/gnupg/2.4.4/common/dotlock.h /usr/src/debug/gnupg/2.4.4/common/compliance.h /usr/src/debug/gnupg/2.4.4/common/sysutils.c /usr/src/debug/gnupg/2.4.4/common/dotlock.c /usr/src/debug/gnupg/2.4.4/common/sysutils.h /usr/src/debug/gnupg/2.4.4/common/compliance.c /usr/src/debug/gnupg/2.4.4/common/init.h /usr/src/debug/gnupg/2.4.4/common/init.c /usr/src/debug/gnupg/2.4.4/common/ssh-utils.c /usr/src/debug/gnupg/2.4.4/common/ssh-utils.h /usr/src/debug/gnupg/2.4.4/common/util.h /usr/src/debug/gnupg/2.4.4/common/openpgp-fpr.c /usr/src/debug/gnupg/2.4.4/common/comopt.h /usr/src/debug/gnupg/2.4.4/common/membuf.h /usr/src/debug/gnupg/2.4.4/common/recsel.h /usr/src/debug/gnupg/2.4.4/common/status.h /usr/src/debug/gnupg/2.4.4/common/membuf.c"
packages/core2-64-poky-linux/gnupg/gnupg-src: PV changed from "2.4.3" to "2.4.4"
packages/core2-64-poky-linux/gnupg/gnupg-src: PKGSIZE changed from 8960228 to 9065586 (+1%)
packages/core2-64-poky-linux/gnupg/gnupg-staticdev: PKGV changed from 2.4.3 [default] to 2.4.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-staticdev: PV changed from "2.4.3" to "2.4.4"
packages/core2-64-poky-linux/gnupg/gnupg: PKGV changed from 2.4.3 [default] to 2.4.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg: PV changed from "2.4.3" to "2.4.4"
packages/core2-64-poky-linux/gnupg/gnupg: PKGSIZE changed from 4822130 to 4879365 (+1%)
packages/core2-64-poky-linux/gnupg: PKGV changed from 2.4.3 [default] to 2.4.4 [default]
packages/core2-64-poky-linux/gnupg: SRC_URI changed from "https://www.gnupg.org/ftp/gcrypt/gnupg/gnupg-2.4.3.tar.bz2 file://0002-use-pkgconfig-instead-of-npth-config.patch file://0004-autogen.sh-fix-find-version-for-beta-checking.patch file://0001-Woverride-init-is-not-needed-with-gcc-9.patch file://fix-ldap.patch" to "https://www.gnupg.org/ftp/gcrypt/gnupg/gnupg-2.4.4.tar.bz2 file://0002-use-pkgconfig-instead-of-npth-config.patch file://0004-autogen.sh-fix-find-version-for-beta-checking.patch file://0001-Woverride-init-is-not-needed-with-gcc-9.patch file://relocate.patch"
packages/core2-64-poky-linux/gnupg: PV changed from "2.4.3" to "2.4.4"

--===============3875306887519421270==--

