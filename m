Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com
	[209.85.218.48])
	by mail.openembedded.org (Postfix) with ESMTP id E7AE979074
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 13:20:51 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id b15-v6so3029945oib.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 06:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=t1RmH/3VqZGdXaNPCqROaHhXwhULEWAvM03T5XeXxb8=;
	b=tombj1vtXUbuVvUvV9KamGX6s5LfykOxMLqxlMPmRgnHhSNk0/Gxrwb66gIrTUrJ/o
	+AY3gFhmZEHyz4sPF+8AEK2qKeVHImGkiZj0CLA8bMsn63r2uMSCjpIlC+E7ngfOtgSr
	NPbWxVoIyGiQzqO7wg7+07goHxSDiKaxoC4V9g2f+FCOJQOToB+lzIhqxYlSfzV49HZg
	DODbm9Of9y0k2NLZH/NDkyLniB8zgKvgVHsi1ToNVr9/KiFdCK1UH4Y/tOAzB2jl1zKT
	J1ax9NFD9qlRwlnqvwZ6GWBNIB8uTAaS4QL/l7KEFVHCjn3i1IHdcDUpnygG82bg8RWo
	PLvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=t1RmH/3VqZGdXaNPCqROaHhXwhULEWAvM03T5XeXxb8=;
	b=sm3yb2ubftNsYSAYFUuOF7hCRfdor7tckULUDofoGaj0teyJCOGdIrnRl557Akh7FJ
	Z25THnm26QiHfNLZINqCon/CxYFsz5KwlWHE0ex/Qtt5RR7SWTi7zrT8YZMwvSKDQb4h
	3W8WAUlzRdE1VNoliv1FHs5RI6age4FgFHtQJCmPuEH4iwcGZ4zpmYG8EaPS5bVe+vl1
	h3rJ6CwtZ+a8BcOfhwWucIWKZBvOmbmTSErJdTr697k4h8KyXTa28XHpcP02/8FVoWdq
	ZHf72vfPMR6qPxfoAJN72mpnE3+vSoZV29BUIR/mNbBln1AVU47abDpVcC+xok6J2Q5R
	vREg==
X-Gm-Message-State: APzg51Bf82BNSmkbO0kfIQMmnGdmCMgq0CwiLBJ2tiMDkhIJFRsfbAke
	zKS/DnkZW4IGLEOYCBfyW2bKCAuA3r4=
X-Google-Smtp-Source: ANB0VdZwULCcRmaiakR5YVc1fc+NhXWBbI9Y+PyIsgeBEMQaPRPut+aqqaSuxPjjrjvuffxe14ORXg==
X-Received: by 2002:aca:d58e:: with SMTP id
	m136-v6mr1805119oig.93.1534944052822; 
	Wed, 22 Aug 2018 06:20:52 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.3.26])
	by smtp.gmail.com with ESMTPSA id
	t141-v6sm2354715oif.18.2018.08.22.06.20.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 06:20:52 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 18:50:03 +0530
Message-Id: <1534944009-21362-13-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534944009-21362-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534944009-21362-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [SUMO][PATCH 13/19] perl: CVE-2018-6797
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
X-List-Received-Date: Wed, 22 Aug 2018 13:20:52 -0000

(perl #132227) restart a node if we change to uni rules within the node and encounter...
This could lead to a buffer overflow.

(cherry picked from commit a02c70e35d1313a5f4e245e8f863c810e991172d)

Affects perl >= 5.18 && perl <= 5.26

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
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


