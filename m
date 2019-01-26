Return-Path: <>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id E5A397C401
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Jan 2019 13:00:06 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id i26so8840222lfc.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Jan 2019 05:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4ht9w8BhDHmuQwL6RJ53WXFNjsC93Ob9OYmgUb6UWDg=;
	b=PU2+FmuJoc+CeD6Fo47AskXiOauWRcjXXXJ6sraLjr5mlr9zaAs2DEpYCHcqXgrWWV
	8msBYSqtTFI7luh9c86BRvsvb9QWSamB+TwxsLcBRv0bUO2J8/HaDTugIMWz+NMEZB0O
	W+4nOkcBB1apKNjQeUas69EP7SIN955JoZisUnxHfUkzJ/HHTtR7g2HxNqKpF7owi6j6
	P+kX7KeS6Ka45fHM+ing0EmVDz/3CLfAHt6gN/Gjcg7MFtEftM0+SU63pX7AqhsufVPO
	/gxZqjGSiIiUvgzAZKo/LbRbAqsHT0qA/L83nJj6aIYTxMFW6UBHbz0x5Fzvx4h7l9fN
	8SVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4ht9w8BhDHmuQwL6RJ53WXFNjsC93Ob9OYmgUb6UWDg=;
	b=UB7PfA8yNdI4x5d7k8TuQ3k7bqGCuXw94Zz3CyZDbaMJoqgf0HZKakvoFTaRxqOJT/
	NgG9PEBOKujQcGQtzo1EMut+S/iwvZ7CAjhgNLSXuvzKPJg1+eICvjjCz66x7kEJJA7j
	zq3YNTOnuNtN+Irz58dxx3+a/Tc6ieGIcZmkjtPiib4fENxVWK8c2SzVAHVPzke1K8iU
	nycpls9rh9Zn6FBE8dUceNErCvJhihtI38EnVWynMtF7hod+UwcdqE0OdBpH9T46kwdA
	xeI0MjSFx6RU3kpY0WZKUNtD4Gal2JNXBYXZ91zjjQJqCye80ElD0056E3VZ5HqC8JRW
	1Gmw==
X-Gm-Message-State: AJcUukcub+DgPJkl1qCjgBBfm1dPbUkPK+Zn6ugEwCisVgMQgooSFy+y
	X/ocLDHpuwZPh61eqOEvBhk=
X-Google-Smtp-Source: ALg8bN7qL4tE9z/cTjJCxz7fBAexTyADsL1Qwf4o0ur5uf7rkhBBm9qqUdLQfj/L/LnOgWz3pKvGgw==
X-Received: by 2002:a19:ec16:: with SMTP id b22mr11942890lfa.65.1548507607277; 
	Sat, 26 Jan 2019 05:00:07 -0800 (PST)
Received: from localhost ([80.64.92.72])
	by smtp.gmail.com with ESMTPSA id q3sm2003378lff.42.2019.01.26.05.00.06
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Sat, 26 Jan 2019 05:00:06 -0800 (PST)
From: Ruslan Bilovol <ruslan.bilovol@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Date: Sat, 26 Jan 2019 14:57:56 +0200
Message-Id: <1548507480-22805-3-git-send-email-ruslan.bilovol@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1548507480-22805-1-git-send-email-ruslan.bilovol@gmail.com>
References: <1548507480-22805-1-git-send-email-ruslan.bilovol@gmail.com>
Subject: [PATCH 2/6] bind: drop lost patch
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
X-List-Received-Date: Sat, 26 Jan 2019 13:00:07 -0000

Commit "c37207d0aca5 bind: update to ESV version 9.11.3" dropped
0001-build-use-pkg-config-to-find-libxml2.patch
from recipe, but left the patch itself in source tree.
Remove this patch since nobody uses it.

Cc: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Ruslan Bilovol <ruslan.bilovol@gmail.com>
---
 ...0001-build-use-pkg-config-to-find-libxml2.patch | 54 ----------------------
 1 file changed, 54 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bind/bind/0001-build-use-pkg-config-to-find-libxml2.patch

diff --git a/meta/recipes-connectivity/bind/bind/0001-build-use-pkg-config-to-find-libxml2.patch b/meta/recipes-connectivity/bind/bind/0001-build-use-pkg-config-to-find-libxml2.patch
deleted file mode 100644
index 1e23c0f..0000000
--- a/meta/recipes-connectivity/bind/bind/0001-build-use-pkg-config-to-find-libxml2.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-xml2-config is disabled, so change the configure script to use pkgconfig to find
-libxml2.
-
-Upstream-Status: Inappropriate
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-Update context for version 9.10.3-P2.
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
-Update context for version 9.10.5-P3.
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
- configure.in | 23 +++--------------------
- 1 file changed, 3 insertions(+), 20 deletions(-)
-
-diff --git a/configure.in b/configure.in
-index 4da73a4..6f2a754 100644
---- a/configure.in
-+++ b/configure.in
-@@ -2282,26 +2282,9 @@ case "$use_libxml2" in
- 		DST_LIBXML2_INC=""
- 		;;
- 	auto|yes)
--		case X`(xml2-config --version) 2>/dev/null` in
--		X2.[[6789]].*)
--			libxml2_libs=`xml2-config --libs`
--			libxml2_cflags=`xml2-config --cflags`
--			;;
--		*)
--			if test "yes" = "$use_libxml2" ; then
--				AC_MSG_RESULT(no)
--				AC_MSG_ERROR(required libxml2 version not available)
--			else
--				libxml2_libs=
--				libxml2_cflags=
--			fi
--			;;
--		esac
--		;;
--	*)
--		if test -f "$use_libxml2/bin/xml2-config" ; then
--			libxml2_libs=`$use_libxml2/bin/xml2-config --libs`
--			libxml2_cflags=`$use_libxml2/bin/xml2-config --cflags`
-+		if pkg-config --exists libxml-2.0 ; then
-+			libxml2_libs=`pkg-config libxml-2.0 --libs`
-+			libxml2_cflags=`pkg-config libxml-2.0 --cflags`
- 		fi
- 		;;
- esac
--- 
-2.1.4
-
-- 
1.9.1


