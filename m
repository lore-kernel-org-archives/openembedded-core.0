Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RuIOY-0004D7-Tn
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Feb 2012 07:49:47 +0100
Received: by daln34 with SMTP id n34so1809191dal.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Feb 2012 22:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=nv5Tw0sHMvfeWfBUC305l1ZZ5DhOcb2Kr1qCLsmzzaU=;
	b=VCDzKjlWoYeinwzrQJEcwMj+/I6g27Fzf5Q/OOjrxQS7dQ0vR58OxqI1lL6jwMuFYE
	jsjW0KjCvSHSvE40VcMfRY7+KjF/A8J6VyxVmk/adJHAd6oLrkQUrlcYaA2OJrMIN0ah
	1FIPMa9FwjcYRpg2/IpLF/hLU/tgfCO9vm7qU=
Received: by 10.68.200.65 with SMTP id jq1mr45632609pbc.54.1328510505600;
	Sun, 05 Feb 2012 22:41:45 -0800 (PST)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168]) by mx.google.com with ESMTPS id
	li19sm37030710pbb.17.2012.02.05.22.41.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Feb 2012 22:41:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  5 Feb 2012 22:40:28 -0800
Message-Id: <b5349a72ab18e065c43e2e7bd214fafd9c53a17c.1328510188.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <04705556464a6e41642962da40f0e17847ee3483.1328510188.git.raj.khem@gmail.com>
References: <04705556464a6e41642962da40f0e17847ee3483.1328510188.git.raj.khem@gmail.com>
In-Reply-To: <cover.1328510187.git.raj.khem@gmail.com>
References: <cover.1328510187.git.raj.khem@gmail.com>
Subject: [PATCH 02/20] Enable options needed for ltp to compile
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Feb 2012 06:49:47 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/uclibc/uclibc-git/uClibc.distro |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/uclibc/uclibc-git/uClibc.distro b/meta/recipes-core/uclibc/uclibc-git/uClibc.distro
index 3948d1a..c33bf8e 100644
--- a/meta/recipes-core/uclibc/uclibc-git/uClibc.distro
+++ b/meta/recipes-core/uclibc/uclibc-git/uClibc.distro
@@ -183,3 +183,8 @@ UCLIBC_HAS_FLOATS=y
 UCLIBC_HAS_UTMPX=y
 UCLIBC_LINUX_MODULE_26=y
 UCLIBC_HAS_RESOLVER_SUPPORT=y
+# needed for LTP
+UCLIBC_SUSV4_LEGACY=y
+UCLIBC_HAS_OBSOLETE_BSD_SIGNAL=y
+DO_XSI_MATH=y
+UCLIBC_SV4_DEPRECATED=y
-- 
1.7.5.4



