Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RtElb-0000vj-Vq
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Feb 2012 09:45:12 +0100
Received: by pbbb4 with SMTP id b4so2433695pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Feb 2012 00:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=nv5Tw0sHMvfeWfBUC305l1ZZ5DhOcb2Kr1qCLsmzzaU=;
	b=nsDoxWoe4eUBENa9LATS0DfmOOfgB+lsbICHVLkqk6intfiHxPOc3/+atZRA9tInSI
	7pyUfql7dZoH7HIhOQ8aWsXkCvsMRqxYEC8VstPaMAVq9FLfuXZuTVzNzBpNISmpD4kM
	pyCfI1NpVpRPSv96dos1w+9FNnrjtNzZ+xTdg=
Received: by 10.68.72.69 with SMTP id b5mr15674108pbv.120.1328258234213;
	Fri, 03 Feb 2012 00:37:14 -0800 (PST)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id z5sm11478262pbc.5.2012.02.03.00.37.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 03 Feb 2012 00:37:13 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Feb 2012 00:36:07 -0800
Message-Id: <2e34b3dbf1fa04ba1c139ea47a3b656bd2a73ddd.1328257913.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <a6d38499fa7010e3e96d9a36d9b88231d911a3c8.1328257913.git.raj.khem@gmail.com>
References: <a6d38499fa7010e3e96d9a36d9b88231d911a3c8.1328257913.git.raj.khem@gmail.com>
In-Reply-To: <cover.1328257913.git.raj.khem@gmail.com>
References: <cover.1328257913.git.raj.khem@gmail.com>
Subject: [PATCH 02/14] Enable options needed for ltp to compile
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
X-List-Received-Date: Fri, 03 Feb 2012 08:45:12 -0000

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



