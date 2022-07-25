Return-Path: <yue.tao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49D44C433EF
	for <webhook@archiver.kernel.org>; Mon, 25 Jul 2022 08:10:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.25729.1658736612071365399
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jul 2022 01:10:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=D7Ypxv/x;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=4205e3d8d6=yue.tao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 26P7dE8p025330
	for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jul 2022 01:10:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=PPS06212021;
 bh=4i3hrxJ9AC0p71CbGZM95Dy/vXux0okyQf/lAo38I5E=;
 b=D7Ypxv/xWS/k4q7vr0PlD5hxuBhTXv0q6Al3k320vbP8rIFkshxZPTKoaZzQZW06/a1r
 7YVS+FbXsSgw4ktKYxQGCcKcjtDj+Z4TqD4MQuQEXSOdvZSb2d3d+HTpXQOEGXcS0U5V
 v0rREYVJbARabKLPNIdMgcflJzNE31KVtHqjTwITOSbzIARjBet2+fLkSi6laJmloR++
 /aRKW3xrbgG2Iznd1zQPfvwEyook5axNZhiEK/bx8l0VcGA9xIZBSsarsIrN0rvn/uHL
 D32OLmk1eXkkHRbazYHg1GR7pcAq5OTZU6kGxUp+w33lD95jr2PfkwEKY2v/WR7WItDF CQ==
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com
 [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hgc9518vt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jul 2022 01:10:11 -0700
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 25 Jul 2022 01:10:11 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 25 Jul 2022 01:10:10 -0700
Received: from pek-ytao-d1.wrs.com (128.224.34.179) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 25 Jul 2022 01:10:09 -0700
From: Yue Tao <yue.tao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <yue.tao@windriver.com>
Subject: [kirkstone][PATCH 1/2] gnupg: update 2.3.4 -> 2.3.6
Date: Mon, 25 Jul 2022 16:10:06 +0800
Message-ID: <20220725081007.31172-1-yue.tao@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: kMqb5sXrDXHDq1kMjq_dXthpgU7wDq5C
X-Proofpoint-ORIG-GUID: kMqb5sXrDXHDq1kMjq_dXthpgU7wDq5C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-23_02,2022-07-21_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 impostorscore=0 clxscore=1011
 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207250035
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Jul 2022 08:10:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168470

From: Alexander Kanavin <alex.kanavin@gmail.com>

Remove 0003-dirmngr-uses-libgpg-error.patch
(upstream addressed the issue).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Yue Tao <yue.tao@windriver.com>
---
 ...-a-custom-value-for-the-location-of-.patch |  6 ++--
 .../0003-dirmngr-uses-libgpg-error.patch      | 29 -------------------
 .../gnupg/gnupg/relocate.patch                | 18 ++++++------
 .../gnupg/{gnupg_2.3.4.bb => gnupg_2.3.6.bb}  |  3 +-
 4 files changed, 13 insertions(+), 43 deletions(-)
 delete mode 100644 meta/recipes-support/gnupg/gnupg/0003-dirmngr-uses-libgpg-error.patch
 rename meta/recipes-support/gnupg/{gnupg_2.3.4.bb => gnupg_2.3.6.bb} (95%)

diff --git a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
index b58fbfe6f5..c4ede9ea5e 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
@@ -1,4 +1,4 @@
-From bdde1faa774753e29d582d79186e08a38597de9e Mon Sep 17 00:00:00 2001
+From 89b98553084fbefe1ef2c7cbff9e72cf43144c49 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 22 Jan 2018 18:00:21 +0200
 Subject: [PATCH] configure.ac: use a custom value for the location of
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 5cdd316..e5f2d6a 100644
+index d86c60e..65c22b2 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1962,7 +1962,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
+@@ -1955,7 +1955,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
  
  AC_DEFINE_UNQUOTED(GPGTAR_NAME, "gpgtar", [The name of the gpgtar tool])
  
diff --git a/meta/recipes-support/gnupg/gnupg/0003-dirmngr-uses-libgpg-error.patch b/meta/recipes-support/gnupg/gnupg/0003-dirmngr-uses-libgpg-error.patch
deleted file mode 100644
index b4106d3620..0000000000
--- a/meta/recipes-support/gnupg/gnupg/0003-dirmngr-uses-libgpg-error.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 9ace8f1b68ab708c44dce4c0152b975fbceb0398 Mon Sep 17 00:00:00 2001
-From: Saul Wold <sgw@linux.intel.com>
-Date: Wed, 16 Aug 2017 11:18:01 +0800
-Subject: [PATCH] dirmngr uses libgpg error
-
-Upstream-Status: Pending
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-
-Rebase to 2.1.23
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
----
- dirmngr/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/dirmngr/Makefile.am b/dirmngr/Makefile.am
-index 77ca3f5..1446775 100644
---- a/dirmngr/Makefile.am
-+++ b/dirmngr/Makefile.am
-@@ -86,7 +86,7 @@ endif
- dirmngr_LDADD = $(libcommonpth) \
-         $(DNSLIBS) $(LIBASSUAN_LIBS) \
- 	$(LIBGCRYPT_LIBS) $(KSBA_LIBS) $(NPTH_LIBS) \
--	$(NTBTLS_LIBS) $(LIBGNUTLS_LIBS) $(LIBINTL) $(LIBICONV) $(NETLIBS)
-+	$(NTBTLS_LIBS) $(LIBGNUTLS_LIBS) $(LIBINTL) $(LIBICONV) $(NETLIBS) $(GPG_ERROR_LIBS)
- if USE_LDAP
- dirmngr_LDADD += $(ldaplibs)
- endif
diff --git a/meta/recipes-support/gnupg/gnupg/relocate.patch b/meta/recipes-support/gnupg/gnupg/relocate.patch
index 74f48e9582..43999b8a6d 100644
--- a/meta/recipes-support/gnupg/gnupg/relocate.patch
+++ b/meta/recipes-support/gnupg/gnupg/relocate.patch
@@ -1,4 +1,4 @@
-From 1e34e1d477f843c0ee2f1a3fddc20201f0233e81 Mon Sep 17 00:00:00 2001
+From 89ae4f03307104689e1857d9857d452af6b35ac4 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Wed, 19 Sep 2018 14:44:40 +0100
 Subject: [PATCH] Allow the environment to override where gnupg looks for its
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 7 insertions(+), 7 deletions(-)
 
 diff --git a/common/homedir.c b/common/homedir.c
-index 174d961..f4c25fb 100644
+index 260aeb2..1aeb08d 100644
 --- a/common/homedir.c
 +++ b/common/homedir.c
-@@ -1161,7 +1161,7 @@ gnupg_socketdir (void)
+@@ -1143,7 +1143,7 @@ gnupg_socketdir (void)
    if (!name)
      {
        unsigned int dummy;
@@ -26,7 +26,7 @@ index 174d961..f4c25fb 100644
        gpgrt_annotate_leaked_object (name);
      }
  
-@@ -1193,7 +1193,7 @@ gnupg_sysconfdir (void)
+@@ -1175,7 +1175,7 @@ gnupg_sysconfdir (void)
    if (dir)
      return dir;
    else
@@ -35,7 +35,7 @@ index 174d961..f4c25fb 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1229,7 +1229,7 @@ gnupg_bindir (void)
+@@ -1211,7 +1211,7 @@ gnupg_bindir (void)
        return name;
      }
    else
@@ -44,7 +44,7 @@ index 174d961..f4c25fb 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1256,7 +1256,7 @@ gnupg_libexecdir (void)
+@@ -1238,7 +1238,7 @@ gnupg_libexecdir (void)
        return name;
      }
    else
@@ -53,7 +53,7 @@ index 174d961..f4c25fb 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1286,7 +1286,7 @@ gnupg_libdir (void)
+@@ -1268,7 +1268,7 @@ gnupg_libdir (void)
        return name;
      }
    else
@@ -62,7 +62,7 @@ index 174d961..f4c25fb 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1317,7 +1317,7 @@ gnupg_datadir (void)
+@@ -1299,7 +1299,7 @@ gnupg_datadir (void)
        return name;
      }
    else
@@ -71,7 +71,7 @@ index 174d961..f4c25fb 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1349,7 +1349,7 @@ gnupg_localedir (void)
+@@ -1331,7 +1331,7 @@ gnupg_localedir (void)
        return name;
      }
    else
diff --git a/meta/recipes-support/gnupg/gnupg_2.3.4.bb b/meta/recipes-support/gnupg/gnupg_2.3.6.bb
similarity index 95%
rename from meta/recipes-support/gnupg/gnupg_2.3.4.bb
rename to meta/recipes-support/gnupg/gnupg_2.3.6.bb
index d27bddb8bd..f35eb8c75a 100644
--- a/meta/recipes-support/gnupg/gnupg_2.3.4.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.3.6.bb
@@ -16,7 +16,6 @@ inherit autotools gettext texinfo pkgconfig
 UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0002-use-pkgconfig-instead-of-npth-config.patch \
-           file://0003-dirmngr-uses-libgpg-error.patch \
            file://0004-autogen.sh-fix-find-version-for-beta-checking.patch \
            file://0001-Woverride-init-is-not-needed-with-gcc-9.patch \
            "
@@ -24,7 +23,7 @@ SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 SRC_URI:append:class-nativesdk = " file://relocate.patch"
 
-SRC_URI[sha256sum] = "f3468ecafb1d7f9ad7b51fd1db7aebf17ceb89d2efa8a05cf2f39b4d405402ae"
+SRC_URI[sha256sum] = "21f7fe2fc5c2f214184ab050977ec7a8e304e58bfae2ab098fec69f8fabda9c1"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.17.1


