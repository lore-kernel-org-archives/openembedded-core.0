Return-Path: <jpuhlman@gmail.com>
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
	[209.85.216.47])
	by mail.openembedded.org (Postfix) with ESMTP id 0FB7D61AB6
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Mar 2020 14:05:56 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id s8so2354694pjq.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Mar 2020 06:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=Jnnu2htaK4x1khSqxcQz4LuGX3sYK0rd45rqy/MhvkA=;
	b=o6tc2xjdO+4UnBjlE2h9z6F7dpafN7WaPKZOW5FkRcMnZBWGlyz6x+sCzFXJjtRrOx
	lDoZ6BuaQl+yfEPRf9iuHU0ElPfENY7DnuZHTHt/URD8q6pgr4WXzJvu5g9u5EhBmgEm
	Y8Go5FzX33XxxC5AHZ4zZlAXDLDfqWJ5CP+NW4R3QF0bWyb61at9KR4EFuucTnqN8osm
	G4pFDBwkseHyZgpLridF2YRRuv7neiQpGlb51yXKfxKmsBvvZott61svEDkmgRLvwuau
	k9u9QAO96a5Sz1L9RutCMdTAmgU4ncm6ryeJvGl0NQhmjhiESx/qJkI+h4nQeqE+fgBf
	Nb5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=Jnnu2htaK4x1khSqxcQz4LuGX3sYK0rd45rqy/MhvkA=;
	b=rkQ02aehWBpv7ZZDhZtLQo2uig+icuCfXNgYI1kuHaA21SXpXBPZ3QX/a8EC3+pBjU
	Ze9xeD7qes8AcwukU9jZu+drkvRpD0qLqaAEiQqUa8652yrbCbxx00nJdZqwJhs9yRqD
	cAwq0su+ZYKLgEjGpmn7ypXXq8KgaR6TxUBIWOmgRcnw1KUYZXDhGmdBb1XAHaY8p5sv
	eMdRkHSJYbP6/AKOd8B8tRyl4lhg+V9teJTUYtVuEivsuaoFnyErWt4zHsr3z6kTNOw9
	GmaqYIMc+zbSnrXuLA7GKS6qvT0/8YNjb0rfMVswtrXxmzhB0lbeT9/mKC4/NcF26nCe
	UoSA==
X-Gm-Message-State: ANhLgQ0dLedYGfwJXviWUKc54UW92VRNOaTLJ3b/4E1DnA30BQS98NON
	AZzObLKdBbAN0ZF03mr7x+welGDD
X-Google-Smtp-Source: ADFU+vsanFZwt9ceV+lHo1Zjvcrcv3Wckbu3JSQkB+EaJBn0P/qBuG+/mMXr7b4KQ48evORvIjue+A==
X-Received: by 2002:a17:90a:2e05:: with SMTP id
	q5mr8765517pjd.68.1583589957256; 
	Sat, 07 Mar 2020 06:05:57 -0800 (PST)
Received: from workhorse.localdomain
	([2600:1700:4c90:60a0:56be:f7ff:fe12:d0bd])
	by smtp.gmail.com with ESMTPSA id
	f20sm12462977pfk.69.2020.03.07.06.05.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 07 Mar 2020 06:05:56 -0800 (PST)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id 93BB52A05EF; Sat,  7 Mar 2020 06:05:55 -0800 (PST)
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  7 Mar 2020 06:05:48 -0800
Message-Id: <20200307140548.13517-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.13.3
Subject: [PATCH v2] groff: Make manpages binary identical
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
X-List-Received-Date: Sat, 07 Mar 2020 14:05:57 -0000

From: Jeremy Puhlman <jpuhlman@mvista.com>

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 .../0001-Make-manpages-mulitlib-identical.patch    | 27 ++++++++++++++++++++++
 meta/recipes-extended/groff/groff_1.22.4.bb        |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-extended/groff/files/0001-Make-manpages-mulitlib-identical.patch

diff --git a/meta/recipes-extended/groff/files/0001-Make-manpages-mulitlib-identical.patch b/meta/recipes-extended/groff/files/0001-Make-manpages-mulitlib-identical.patch
new file mode 100644
index 0000000000..329a97cb2e
--- /dev/null
+++ b/meta/recipes-extended/groff/files/0001-Make-manpages-mulitlib-identical.patch
@@ -0,0 +1,27 @@
+From e738f9185ba90f2083c846ade3551234bb5a7cbc Mon Sep 17 00:00:00 2001
+From: Jeremy Puhlman <jpuhlman@mvista.com>
+Date: Sat, 7 Mar 2020 00:59:13 +0000
+Subject: [PATCH] Make manpages mulitlib identical
+
+Upstream-status: Pending
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


