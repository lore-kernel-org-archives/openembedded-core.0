Return-Path: <jpuhlman@gmail.com>
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
	[209.85.210.173])
	by mail.openembedded.org (Postfix) with ESMTP id 42CC361A8D
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Mar 2020 13:51:08 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id y26so2552726pfn.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Mar 2020 05:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=187364d088QvZNg2QUEW/uC8ch1S78+U8DE37dKlGjA=;
	b=aFTSrSpQg3lFS5ZiNOnsEryOvylqCx47Dyk+JVH6Fl5YGzAXHTxd7UFS/joLafxCD8
	PQU1BRWisryQ9wtoccv1YZP6qflLMWtJbkdwH5kZ/KMfCJRcjkXNq2lPSXcRHMQCi9cq
	7Hsw3xbIUGmMg7l313zNURc1qZRzboTsf5DHaiIK04Hp4tBPE/fxG9fdlGzvsLICRA6l
	ert0Ajl0b7VCQ+M2/lEXRQDKYcRwS2sqaySgAooyKLxcakhCL4yQmXAzio3yEYm2Vc/e
	ZxH/M7Z5qYdp7+K4XxGhR3jtwYBo3Q7/BV+ynVr2MlPy2ln6tgz6xHnncEmxlwXt7oJ9
	H7hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=187364d088QvZNg2QUEW/uC8ch1S78+U8DE37dKlGjA=;
	b=L0Z8GMDfOuubhXPcZyLxTm/gyQ7pGo7UHc/Zg6o3SbOFT/rPimrFZGocWADaDGbhpM
	kKstvQCR9BlrL23jQ3oXbcLD+1taaoCRMBnhm6n7FZTmsaipENnqW67+zpEpaMEgihu+
	OJSvqYNKblJ5+6oA41353oQ5GfGPg4S0amR8Yv7jhaSmJfZ0ds+t12xDKKQXDZ7n16tt
	E5NxGp4t/+4thtQS55h62R9paYpEhD3PhQDC6QrKRgVlG/rkNAhGqLGxAPhVUhm6NeXc
	+oxyA9tYZmV3+lBMUYQ4BJylyr4jNO+oiDYFHRCKOstXFTfUjywQvjoTdVs2PfHQHlNi
	laSQ==
X-Gm-Message-State: ANhLgQ0nTZo/cPGaD77kWgkPXsjAC8TMpLYtvXXD7Xf/d7dDT+ch1zsI
	RTptPn87ngmC6W6uNx6IUyWWyWw2
X-Google-Smtp-Source: ADFU+vvXGJ8AUFL3q1PMYgTpiOTqoJgLXYlhDG/fPK8F2KrJbBk/UJb4xmhyxOJMDztKg7Yay5tY5A==
X-Received: by 2002:aa7:8552:: with SMTP id y18mr8782121pfn.0.1583589068839;
	Sat, 07 Mar 2020 05:51:08 -0800 (PST)
Received: from workhorse.localdomain
	([2600:1700:4c90:60a0:56be:f7ff:fe12:d0bd])
	by smtp.gmail.com with ESMTPSA id
	f127sm1610245pfa.9.2020.03.07.05.51.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 07 Mar 2020 05:51:08 -0800 (PST)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id 0031E2A05EF; Sat,  7 Mar 2020 05:51:06 -0800 (PST)
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  7 Mar 2020 05:51:03 -0800
Message-Id: <20200307135105.12838-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.13.3
Subject: [PATCH 1/3] groff: Make manpages binary identical
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
X-List-Received-Date: Sat, 07 Mar 2020 13:51:08 -0000

From: Jeremy Puhlman <jpuhlman@mvista.com>

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 .../0001-Make-manpages-mulitlib-identical.patch    | 27 ++++++++++++++++++++++
 meta/recipes-extended/groff/groff_1.22.4.bb        |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-extended/groff/files/0001-Make-manpages-mulitlib-identical.patch

diff --git a/meta/recipes-extended/groff/files/0001-Make-manpages-mulitlib-identical.patch b/meta/recipes-extended/groff/files/0001-Make-manpages-mulitlib-identical.patch
new file mode 100644
index 0000000000..2f6b091bff
--- /dev/null
+++ b/meta/recipes-extended/groff/files/0001-Make-manpages-mulitlib-identical.patch
@@ -0,0 +1,27 @@
+From e738f9185ba90f2083c846ade3551234bb5a7cbc Mon Sep 17 00:00:00 2001
+From: Jeremy Puhlman <jpuhlman@mvista.com>
+Date: Sat, 7 Mar 2020 00:59:13 +0000
+Subject: [PATCH] Make manpages mulitlib identical
+
+Upstream-status: pending
+Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index d18c49b..6175fe9 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -917,7 +917,7 @@ SUFFIXES += .man
+ 	     -e "s|[@]MDATE[@]|`$(PERL) $(top_srcdir)/mdate.pl $<`|g" \
+ 	     -e "s|[@]OLDFONTDIR[@]|`echo $(oldfontdir) | sed -f $(makevarescape)`|g" \
+ 	     -e "s|[@]PDFDOCDIR[@]|`echo $(pdfdocdir) | sed -f $(makevarescape)`|g" \
+-	     -e "s|[@]SYSTEMMACRODIR[@]|`echo $(systemtmacdir) | sed -f $(makevarescape)`|g" \
++	     -e "s|[@]SYSTEMMACRODIR[@]|`echo $(systemtmacdir) | sed -e 's,$(libdir),$(prefix)/lib*,' | sed -f $(makevarescape)`|g" \
+ 	     -e "s|[@]TMAC_AN_PREFIX[@]|$(tmac_an_prefix)|g" \
+ 	     -e "s|[@]TMAC_M_PREFIX[@]|$(tmac_m_prefix)|g" \
+ 	     -e "s|[@]TMAC_MDIR[@]|$(tmacdir)/mm|g" \
+-- 
+2.23.0
+
diff --git a/meta/recipes-extended/groff/groff_1.22.4.bb b/meta/recipes-extended/groff/groff_1.22.4.bb
index 082597f693..e398478349 100644
--- a/meta/recipes-extended/groff/groff_1.22.4.bb
+++ b/meta/recipes-extended/groff/groff_1.22.4.bb
@@ -12,6 +12,7 @@ SRC_URI = "${GNU_MIRROR}/groff/groff-${PV}.tar.gz \
 	file://groff-not-search-fonts-on-build-host.patch \
 	file://0001-support-musl.patch \
 	file://0001-Include-config.h.patch \
+        file://0001-Make-manpages-mulitlib-identical.patch \
 "
 
 SRC_URI[md5sum] = "08fb04335e2f5e73f23ea4c3adbf0c5f"
-- 
2.13.3


