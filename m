Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com
	[209.85.218.41])
	by mail.openembedded.org (Postfix) with ESMTP id E6474792E3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 11:42:20 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id 8-v6so2631627oip.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 04:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TbdlWnBeKhN8zgZbgVIDA40CE/TPfK5MDpWnZT+G8JQ=;
	b=B+L/5Hb6zezr7boZqmv9qtZZR66PXBZ7AGugBfOKb+aFm+DquVD1/qzj9dhgVOmnca
	D+/PMNamJbKPhqVYUeCA/A6L0ynyaj5/YhA4+rkDpaZmbCcOVvPpYxQHr9RLVsnYvyen
	g/U1tgIz8ODYUwAzDxRBr+zVe9GS5sVrgyfVE2FUHLDmz/1JoG/u3H+GOI2c9zYmFsWJ
	WuGs1ngVx0VqvThweW6v3ZpEoM9JkG4zETgeOvNSxWNwUTnQN+iJOvSX0SnUk4M34w+/
	QROL8Y+j1+mUk71BygYq8GxU8kDGXI1oHxAt/BGsR3eOVNZRSdaKphpjvrh/w8mFqjKR
	W03A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TbdlWnBeKhN8zgZbgVIDA40CE/TPfK5MDpWnZT+G8JQ=;
	b=TAeBNCOV9ODAima8WazO3nnFG96bBEfk8gkQP+hugGkEtgPI2RhgUACyb7SDjjoenC
	d8xEjzQdarqq8Jfv/FDdzfihcyRFpUFoSs3tRU3YAv5jGyAS6Vb+0FgOkewvNehYpUCh
	2Ttluk3GEv6LY6maEVMBNyhNIs5BBLoMrXZk7rOIhlhloDur8R8Mdbjt35ZD/rUm6qI5
	xFJLhjpiSPeV3BLhjmrTV2acPxKlAJxRi6yUklyWZdY2ELkT5rIKGD8dFKAyi1U2WoMJ
	tbbU6XsTfPwFiBsBuShuwHFmULlrDvUYaRmEwFBQU14RwdXWwOjXeJQ6gYn3z17ARfGu
	HKxg==
X-Gm-Message-State: APzg51D+IKA0FBRgC3S8LUfNvLRzTdCcy3HEBdimdyNNQAKqZ3JtkVZo
	hVV8MExz1G+2QvxYmoRE+AOkgcAxXJc=
X-Google-Smtp-Source: ANB0Vdbqalp5bzMnHSrEwgG2/tVeR9UJQxft27lGXKcK+W2AOHDCty7LKK/AOB5SwQGGcN8GpdXxCA==
X-Received: by 2002:aca:5489:: with SMTP id
	i131-v6mr3657887oib.340.1534938141794; 
	Wed, 22 Aug 2018 04:42:21 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.3.26])
	by smtp.gmail.com with ESMTPSA id
	f144-v6sm1323750oib.39.2018.08.22.04.42.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 04:42:21 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 17:11:49 +0530
Message-Id: <1534938113-12197-9-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534938113-12197-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534938113-12197-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [SUMO][PATCH V2] perl: CVE-2018-6797
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
X-List-Received-Date: Wed, 22 Aug 2018 11:42:21 -0000

(perl #132227) restart a node if we change to uni rules within the node and encounter...
This could lead to a buffer overflow.

(cherry picked from commit a02c70e35d1313a5f4e245e8f863c810e991172d)

Affects perl >= 5.18 && perl <= 5.26

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
v2:
  Corrected "From:" address

 .../recipes-devtools/perl/perl/CVE-2018-6797.patch | 45 ++++++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.24.1.bb          |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/perl/CVE-2018-6797.patch

diff --git a/meta/recipes-devtools/perl/perl/CVE-2018-6797.patch b/meta/recipes-devtools/perl/perl/CVE-2018-6797.patch
new file mode 100644
index 0000000..b56ebd3
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/CVE-2018-6797.patch
@@ -0,0 +1,45 @@
+From abe1e6c568b96bcb382dfa4f61c56d1ab001ea51 Mon Sep 17 00:00:00 2001
+From: Karl Williamson <khw@cpan.org>
+Date: Fri, 2 Feb 2018 15:14:27 -0700
+Subject: [PATCH] (perl #132227) restart a node if we change to uni rules
+ within the node and encounter a sharp S
+
+This could lead to a buffer overflow.
+
+(cherry picked from commit a02c70e35d1313a5f4e245e8f863c810e991172d)
+
+CVE: CVE-2018-6797
+Upstream-Status: Backport [https://perl5.git.perl.org/perl.git/commitdiff/abe1e6c568b96bcb382dfa4f61c56d1ab001ea51]
+
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
+---
+ regcomp.c | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/regcomp.c b/regcomp.c
+index 3b9550b10d..a7dee9a09e 100644
+--- a/regcomp.c
++++ b/regcomp.c
+@@ -13543,6 +13543,18 @@ S_regatom(pTHX_ RExC_state_t *pRExC_state, I32 *flagp, U32 depth)
+                          * /u.  This includes the multi-char fold SHARP S to
+                          * 'ss' */
+                         if (UNLIKELY(ender == LATIN_SMALL_LETTER_SHARP_S)) {
++
++                            /* If the node started out having uni rules, we
++                             * wouldn't have gotten here.  So this means
++                             * something in the middle has changed it, but
++                             * didn't think it needed to reparse.  But this
++                             * sharp s now does indicate the need for
++                             * reparsing. */
++                            if (RExC_uni_semantics) {
++                                p = oldp;
++                                goto loopdone;
++                            }
++
+                             RExC_seen_unfolded_sharp_s = 1;
+                             maybe_exactfu = FALSE;
+                         }
+-- 
+2.15.1-424-g9478a660812
+
+
diff --git a/meta/recipes-devtools/perl/perl_5.24.1.bb b/meta/recipes-devtools/perl/perl_5.24.1.bb
index 311df40..882c1cf 100644
--- a/meta/recipes-devtools/perl/perl_5.24.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.24.1.bb
@@ -68,6 +68,7 @@ SRC_URI += " \
         file://CVE-2017-12837.patch \
         file://CVE-2018-6798-1.patch \
         file://CVE-2018-6798-2.patch \
+        file://CVE-2018-6797.patch \
 "
 
 # Fix test case issues
-- 
2.7.4


