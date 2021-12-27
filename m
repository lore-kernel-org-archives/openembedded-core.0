Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44DECC433EF
	for <webhook@archiver.kernel.org>; Mon, 27 Dec 2021 13:21:00 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web10.26042.1640611255865716126
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Dec 2021 05:20:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=CWBlKdqD;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1640611253; i=@fujitsu.com;
	bh=7v7j//QhoGd0SXzTy0jdPDN8RSFIxkiveK5+aq39lkg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=CWBlKdqD+coNcnL4rKjc9nrTEctbEZbnU26JXX5/UY5mW/UoZjR6AFAyZnfcHaXy1
	 8p/1KpBRqi92v6o0SCiwf1f58ke+LHFWDEzPOxzBFVYCVYhTEPXuJ9fhQWbA1zYajr
	 rkBC2Ph9awHH3tPnkvK5pKJ/YL9NcQ0mdliELA1XFn4PivEwbXhDq0vweuemhvr1hY
	 dwd64uIZj1FBqTO16ZGrhQB0rSDZX8Y00lfHm1fFF7RztbnhHdse2iQVZlY2WukjUV
	 FIYvQN+kz1p/HjlknUbFUZcIiNqB6+me0+TDIjfRy0NlJZ13nC9Ovos07f5r6InLbF
	 VCQCvg14WVy0w==
Received: from [100.115.33.138] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-2.aws.ess.symcld.net id 41/A2-09428-5BDB9C16;
 Mon, 27 Dec 2021 13:20:53 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphleJIrShJLcpLzFFi42Kxs+GYpLt178l
  Eg+5VbBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aiZxMYCw6rV5xeP4G5gXGtYhcjF4eQwGNG
  idezbzNCOOeZJCada4RyTjBKzO58wtzFyMnBJqAmMf3WDdYuRg4OEQE9iav/REHCzAIqEi9+9
  7CD2MICFhJ3jhxjBLFZBFQlVhzoBmvlFXCSWHjnEAuILSGgIDHl4XuwOKeAs8Sl1rtsILYQUM
  2i/l+MEPWCEidnPmGBmC8hcfDFC2aIXkWJ2ZeboeZUSMya1cYEYatJXD23iXkCo+AsJO2zkLQ
  vYGRaxWiVVJSZnlGSm5iZo2toYKBraGiqa2yka2iil1ilm6iXWqpbnlpcomukl1herJdaXKxX
  XJmbnJOil5dasokRGMQpxQp8OxibV/3UO8QoycGkJMr7fcLJRCG+pPyUyozE4oz4otKc1OJDj
  DIcHEoSvJd3AeUEi1LTUyvSMnOAEQWTluDgURLhZdkDlOYtLkjMLc5Mh0idYkzmeLN2ySJmjr
  dgsu3eXSDZDiZnLji4mpljFpi8334ISD4Ak82Tlm9n5njd8nMHsxBLXn5eqpQ4bw/IaAGQ0Rm
  leXCLYYnkEqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVhXhWQKTyZeSVw970COp0J6PSZDsdB
  Ti9JREhJNTDNrTaf9t63KD6jvrVn4u7Zbr99+4R4Hf/8e/FnhbnTSdWZz5t4up8dmLRARP5Ju
  fm36H/5P0qenulb2e9dJnb7ZaPDiqsMIisNTx2PPuh5xrDuzOt6F55cXfmDZstZmR//lqs8b+
  S5t13DvH22Vf7eOsaXT6czzzUUmLxD+7zkFRWl4MqYX5s/fu/pDTz8+PbajMz2jNsxa769vaK
  Sw6m+p4Vh58eFerPMnj9pVy4rv93BvmPp1DCRlUH7Tj1ccVZ9a+IVvjUVaj1KqUrMLgt3LM18
  sb2rZY3TxDTdDRc6b0jfPGHw+er//xslF+rdf7ZcJbn8pmnsyfMdO6OLqjxvLy5IVHrQ233b8
  O2D9ycOKLEUZyQaajEXFScCAD2ybtOfAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-548.messagelabs.com!1640611252!226182!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7587 invoked from network); 27 Dec 2021 13:20:53 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-2.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Dec 2021 13:20:53 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id BBAF2100344
	for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Dec 2021 13:20:52 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id AF09D1000FE
	for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Dec 2021 13:20:52 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 27 Dec 2021 13:20:33 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] gnupg: upgrade 2.3.3 -> 2.3.4
Date: Mon, 27 Dec 2021 21:20:19 +0800
Message-ID: <1640611219-22746-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1640611219-22746-1-git-send-email-wangmy@fujitsu.com>
References: <1640611219-22746-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Dec 2021 13:21:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160021

refresh relocate.patch

Chanlog:
========
Bugs fixed for this release <https://dev.gnupg.org/#####>
gpg: New option --min-rsa-length. [rG5f39db70c0]
gpg: New option --forbid-gen-key. [rGc397ba3ac0]
gpg: New option --override-compliance-check. [T5655]
gpgconf: New command --show-configs. [rGa0fb78ee0f]
agent,dirmngr,keyboxd: New option --steal-socket. [rGb0079ab39d,rGdd708f60d5]
gpg: Fix printing of binary notations. [T5667]
gpg: Remove stale ultimately trusted keys from the trustdb. [T5685,T5742]
gpg: Fix indentation of --print-mds and --print-md sha512. [T5679]
gpg: Emit gpg 2.2 compatible Ed25519 signature. [T5331]
gpgsm: Detect circular chains in --list-chain. [rG74c5b35062]
dirmngr: Make reading resolv.conf more robust. [T5657]
dirmngr: Ask keyservers to provide the key fingerprints. [T5741]
gpgconf: Allow changing gpg's deprecated keyserver option. [T5462]
gpg-wks-server: Fix created file permissions. [rG60be00b033]
scd: Support longer data for ssh-agent authentication with openpgp cards. [T5682]
scd: Modify DEVINFO behavior to support looping forever. [T5359]
Support gpgconf.ctl for NetBSD and Solaris. [T5656,T5671]
Silence "Garbled console data" warning under Windows in most cases. [rGe293da3b21]
Silence warning about the rootdir under Unices w/o a mounted /proc file system. [T5656]
Fix possible build problems about missing include files. [T5592]

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gnupg/gnupg/relocate.patch                | 22 +++++++++----------
 .../gnupg/{gnupg_2.3.3.bb => gnupg_2.3.4.bb}  |  2 +-
 2 files changed, 11 insertions(+), 13 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.3.3.bb => gnupg_2.3.4.bb} (97%)

diff --git a/meta/recipes-support/gnupg/gnupg/relocate.patch b/meta/recipes-support/gnupg/gnupg/relocate.patch
index 53679bf1d9..74f48e9582 100644
--- a/meta/recipes-support/gnupg/gnupg/relocate.patch
+++ b/meta/recipes-support/gnupg/gnupg/relocate.patch
@@ -1,4 +1,4 @@
-From 766d37fe9acd9fdaaff9c094635e06b50c5902d7 Mon Sep 17 00:00:00 2001
+From 1e34e1d477f843c0ee2f1a3fddc20201f0233e81 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Wed, 19 Sep 2018 14:44:40 +0100
 Subject: [PATCH] Allow the environment to override where gnupg looks for its
@@ -8,15 +8,16 @@ Upstream-Status: Inappropriate [OE-specific]
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+
 ---
  common/homedir.c | 14 +++++++-------
  1 file changed, 7 insertions(+), 7 deletions(-)
 
 diff --git a/common/homedir.c b/common/homedir.c
-index 455c188..55049db 100644
+index 174d961..f4c25fb 100644
 --- a/common/homedir.c
 +++ b/common/homedir.c
-@@ -1155,7 +1155,7 @@ gnupg_socketdir (void)
+@@ -1161,7 +1161,7 @@ gnupg_socketdir (void)
    if (!name)
      {
        unsigned int dummy;
@@ -25,7 +26,7 @@ index 455c188..55049db 100644
        gpgrt_annotate_leaked_object (name);
      }
  
-@@ -1187,7 +1187,7 @@ gnupg_sysconfdir (void)
+@@ -1193,7 +1193,7 @@ gnupg_sysconfdir (void)
    if (dir)
      return dir;
    else
@@ -34,7 +35,7 @@ index 455c188..55049db 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1223,7 +1223,7 @@ gnupg_bindir (void)
+@@ -1229,7 +1229,7 @@ gnupg_bindir (void)
        return name;
      }
    else
@@ -43,7 +44,7 @@ index 455c188..55049db 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1250,7 +1250,7 @@ gnupg_libexecdir (void)
+@@ -1256,7 +1256,7 @@ gnupg_libexecdir (void)
        return name;
      }
    else
@@ -52,7 +53,7 @@ index 455c188..55049db 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1280,7 +1280,7 @@ gnupg_libdir (void)
+@@ -1286,7 +1286,7 @@ gnupg_libdir (void)
        return name;
      }
    else
@@ -61,7 +62,7 @@ index 455c188..55049db 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1311,7 +1311,7 @@ gnupg_datadir (void)
+@@ -1317,7 +1317,7 @@ gnupg_datadir (void)
        return name;
      }
    else
@@ -70,7 +71,7 @@ index 455c188..55049db 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1343,7 +1343,7 @@ gnupg_localedir (void)
+@@ -1349,7 +1349,7 @@ gnupg_localedir (void)
        return name;
      }
    else
@@ -79,6 +80,3 @@ index 455c188..55049db 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
--- 
-2.20.1
-
diff --git a/meta/recipes-support/gnupg/gnupg_2.3.3.bb b/meta/recipes-support/gnupg/gnupg_2.3.4.bb
similarity index 97%
rename from meta/recipes-support/gnupg/gnupg_2.3.3.bb
rename to meta/recipes-support/gnupg/gnupg_2.3.4.bb
index 5614ac6473..7faaffbc27 100644
--- a/meta/recipes-support/gnupg/gnupg_2.3.3.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.3.4.bb
@@ -24,7 +24,7 @@ SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 SRC_URI:append:class-nativesdk = " file://relocate.patch"
 
-SRC_URI[sha256sum] = "5789b86da6a1a6752efb38598f16a77af51170a8494039c3842b085032e8e937"
+SRC_URI[sha256sum] = "f3468ecafb1d7f9ad7b51fd1db7aebf17ceb89d2efa8a05cf2f39b4d405402ae"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.25.1


