Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 583BA759CD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 02:50:32 +0000 (UTC)
Received: by paccq16 with SMTP id cq16so54334629pac.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Aug 2015 19:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=dhY31ihrx+6n6S3hYgpjgXR6okN3qe8iR/s0yC1nrsU=;
	b=ZDkC9Z+SYTXZ16i6weh76CHK4xbp01q5Bveuw/neFQFI8pHvviLZzMx8Mbv31Cm6Fa
	day9f6Db44tC4FWYIBxeppKHQZyoztH3u/b3ranIaiIZKdvtL/9zlOScBaA3Yv4rdCHo
	GzwjpKYeEsBvX/xJ9Ia+dT3/1DYBEom/T17CK+R7gh5SP3ldmPZh8Ah+aZFPE57iySec
	cJMEUWOXN/Q/Jo7R1tuR8X+MUWGzXk2jcyKQuHQKi/afdRVB/Lt9CN5l5J5q7PNNBSqh
	fLWoOjsfGR48KIEzs+0Vs0Q9VSRdEtdY9ZzvKpawcBW5rss3EoE67on33XUI1+XkuHpJ
	/cNQ==
X-Received: by 10.66.131.101 with SMTP id ol5mr112229950pab.0.1439779832933;
	Sun, 16 Aug 2015 19:50:32 -0700 (PDT)
Received: from Pahoa2.hsd1.ca.comcast.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	q7sm12732589pdj.31.2015.08.16.19.50.31
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 16 Aug 2015 19:50:32 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 16 Aug 2015 19:50:26 -0700
Message-Id: <1439779827-15189-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH 1/2] bitbake.conf: Add Github mirror
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
X-List-Received-Date: Mon, 17 Aug 2015 02:50:36 -0000

From: Armin Kuster <akuster@mvista.com>

This adds Github mirror variable.

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/conf/bitbake.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 21f1698..56e7ca7 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -571,6 +571,7 @@ DEBIAN_MIRROR = "ftp://ftp.debian.org/debian/pool"
 GENTOO_MIRROR = "http://distfiles.gentoo.org/distfiles"
 GNOME_GIT = "git://git.gnome.org"
 GNOME_MIRROR = "http://ftp.gnome.org/pub/GNOME/sources"
+GITHUB_MIRROR = "git://github.com"
 GNU_MIRROR = "http://ftp.gnu.org/gnu"
 GPE_MIRROR = "http://gpe.linuxtogo.org/download/source"
 KERNELORG_MIRROR = "http://kernel.org/pub"
-- 
2.3.5


