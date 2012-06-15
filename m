Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SfPxH-0001O3-UU
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jun 2012 08:24:24 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq2so4635855pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2012 23:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=mSJOMV4ezitm4rdSyU2mVgE3V6hkeA++aQvFtLJwsSY=;
	b=Mp0LYPhjSLtxguNYSiY/ETVY0CucNfBcxGNy3jhhEG9Mqm3fGzmWWq3i8lE4avsuPk
	XzY5DU0p5qqLqPijmrxIsOe/IKNdEKB3cc85d+T6MNC2Qrf5Za2rlETk78p3VvjxVHbY
	zXEMU6+xjaa0PbFLPr9Q9F2XOXxYBECQbtyoXNz2XU6O95a6MdB5OZ8pGJzBaJY4Gu7Y
	vQIW89wuKE9qOwfM+aFSYUbYEkdYbh6hz8C0HxBFOEw/yyU+rXWk3AAha+gAmlIQ91+5
	gKvIMpcGtyXsxySq4yQK+IMFXuSf4us3eyAyMMWZshHLFMQEBU5A/Ff4I6XQ8QE+xmtC
	YJBg==
Received: by 10.68.192.39 with SMTP id hd7mr16253621pbc.97.1339740827830;
	Thu, 14 Jun 2012 23:13:47 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id tm2sm12117280pbc.69.2012.06.14.23.13.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 14 Jun 2012 23:13:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jun 2012 23:12:29 -0700
Message-Id: <aa886837a5c6a9ee149245e9cab72a1c21b35377.1339740433.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1366d81a5719e42af8bf24d46b86352491fc0e67.1339740433.git.raj.khem@gmail.com>
References: <1366d81a5719e42af8bf24d46b86352491fc0e67.1339740433.git.raj.khem@gmail.com>
In-Reply-To: <cover.1339740433.git.raj.khem@gmail.com>
References: <cover.1339740433.git.raj.khem@gmail.com>
Subject: [PATCH 2/9] site/x86_64-linux-uclibc: Cache definitions of guint32/guint64
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
X-List-Received-Date: Fri, 15 Jun 2012 06:24:24 -0000

Without this glib 2.32.x wont build.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/site/x86_64-linux-uclibc |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/site/x86_64-linux-uclibc b/meta/site/x86_64-linux-uclibc
index bad2ed9..2d269f7 100644
--- a/meta/site/x86_64-linux-uclibc
+++ b/meta/site/x86_64-linux-uclibc
@@ -60,6 +60,9 @@ am_cv_func_working_getline=${am_cv_func_working_getline=yes}
 
 # glib-2.0
 glib_cv_use_pid_surrogate=${glib_cv_use_pid_surrogate=yes}
+ac_cv_alignof_guint32=4
+ac_cv_alignof_guint64=8
+ac_cv_alignof_unsigned_long=8
 
 # libidl
 libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
-- 
1.7.5.4



