Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 150F478997
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 16:39:20 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id s9-v6so31455wmh.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 09:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=a1pRA75G9BOL0AT1h5Zlgv3lkVwi+wCPCnvp6gH0CUg=;
	b=ENgM5cRzUFwbMigUtJhPoMPSaznduZ5kTu8xXWYeF9wgEJm69ZS9vwIzvmh2fpMZUf
	mx4sUGL1Qk6uWukkM7CAsPr6JUbXUWnKYxsXnuB+ZkLj3VghTBXzKMkweIFEerrlA82f
	2XXYKJJL9Cdf5jxVCgUjPf5LWsg5OCdfDAB0F75Qv5YCrufJdTYvxba4gD95vmd7m96M
	yHcZd5PzoV06lZPU2zqTjKG4EXPalxDDSHIHm+IRZyZ5zK6crUhbsVCzDZ1AVAXFNSqf
	zD6Wep3V657oDtvPtR1zoRXn0OZYTP5Nsg4NLWV3CWzQfKbKMtQMv7z5dsfn0nTt+R9q
	vDaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=a1pRA75G9BOL0AT1h5Zlgv3lkVwi+wCPCnvp6gH0CUg=;
	b=JabA76EZq47pbOxXeoS7SE9DmCJ3qcTwjBcReaxq9O51y+mKcYmTHrQN3NIT3b/J1p
	R9iU3jVTCZSg7LLyxrJk7UlAxBQewRjD0trdVyNkZlXNp6zF+gmJWePrWwIVaeM4/knp
	hdjVQXcGFtbfD2Zmoij1MdnHxoNsOkA+RKVM4K8cMcLZ0UlQzAODlVkmJOc8lcq7cuJe
	gkctqANmWHF+Vl/6nMzOh9EFQDQ8eUOJJH3cv8OkV59v8vZbfR64SDfabXGaEredFmEB
	yBwLKoPVmBj/SveUens8gdvSf50uJjcA2H7tzzUk3GO2coFFEgLaNkBDI5fPUR0NGw2f
	19Hg==
X-Gm-Message-State: AOUpUlHxwBZTVVTcIVf9joUCSxUi/NA9wCirosX33eV27C9dk/++RTnx
	pzhfJvDj4Wialfx5OoSq5MPn1ddU
X-Google-Smtp-Source: AAOMgpeJ39/0wDjteb8NtRU0ubfWuqaPU7+xjD7DldAwCMadhwEgw7/ZHt1erVBsWbCI4fuzaRRZ1A==
X-Received: by 2002:a1c:a8f:: with SMTP id
	137-v6mr1773128wmk.119.1531845560491; 
	Tue, 17 Jul 2018 09:39:20 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	i125-v6sm15958wmd.11.2018.07.17.09.39.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Jul 2018 09:39:19 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jul 2018 17:39:00 +0100
Message-Id: <20180717163910.3196-5-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180717163910.3196-1-ross.burton@intel.com>
References: <20180717163910.3196-1-ross.burton@intel.com>
Subject: [PATCH 05/15] gnupg: upgrade 2.2.8 -> 2.2.9
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
X-List-Received-Date: Tue, 17 Jul 2018 16:39:20 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...configure.ac-use-a-custom-value-for-the-location-of-.patch | 11 ++++-------
 meta/recipes-support/gnupg/{gnupg_2.2.8.bb => gnupg_2.2.9.bb} |  4 ++--
 2 files changed, 6 insertions(+), 9 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.2.8.bb => gnupg_2.2.9.bb} (92%)

diff --git a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
index 5d9bbacb741..5f1dd30f87c 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
@@ -1,7 +1,7 @@
-From 338d073cab7b94fd7ec66322b969e8772b5e8cd7 Mon Sep 17 00:00:00 2001
+From 7eb7efb9ce89c66e14c194773c4dcf6478a6ca4d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 22 Jan 2018 18:00:21 +0200
-Subject: [PATCH 5/5] configure.ac: use a custom value for the location of
+Subject: [PATCH] configure.ac: use a custom value for the location of
  gpg-agent socket in the filesystem
 
 This should avoid clashes with the host gpg-agent observed on autobuilders.
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 382ef1d..0570d7c 100644
+index 59a2e60..12d390b 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1818,7 +1818,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
+@@ -1841,7 +1841,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
  
  AC_DEFINE_UNQUOTED(GPGTAR_NAME, "gpgtar", [The name of the gpgtar tool])
  
@@ -26,6 +26,3 @@ index 382ef1d..0570d7c 100644
                     [The name of the agent socket])
  AC_DEFINE_UNQUOTED(GPG_AGENT_EXTRA_SOCK_NAME, "S.gpg-agent.extra",
                     [The name of the agent socket for remote access])
--- 
-2.7.4
-
diff --git a/meta/recipes-support/gnupg/gnupg_2.2.8.bb b/meta/recipes-support/gnupg/gnupg_2.2.9.bb
similarity index 92%
rename from meta/recipes-support/gnupg/gnupg_2.2.8.bb
rename to meta/recipes-support/gnupg/gnupg_2.2.9.bb
index 35a033c9b6f..4f815dff20d 100644
--- a/meta/recipes-support/gnupg/gnupg_2.2.8.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.2.9.bb
@@ -18,8 +18,8 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
 SRC_URI_append_class-native = " file://0001-configure.ac-use-a-custom-value-for-the-location-of-.patch"
 
 
-SRC_URI[md5sum] = "0db6d8ec569e260435a7d2bfb2ecfe5c"
-SRC_URI[sha256sum] = "777b4cb8ced21965a5053d4fa20fe11484f0a478f3d011cef508a1a49db50dcd"
+SRC_URI[md5sum] = "52c895a81f514a65e08923736c38654a"
+SRC_URI[sha256sum] = "6278eaabffa1ebc9fa2ceb3dc53eea9a1505ab02a668a86dd6fec06951af2164"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.11.0


