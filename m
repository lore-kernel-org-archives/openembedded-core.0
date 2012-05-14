Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1STyXC-00045O-QB
	for openembedded-core@lists.openembedded.org;
	Mon, 14 May 2012 18:54:11 +0200
Received: by mail-ob0-f175.google.com with SMTP id x4so8446149obh.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2012 09:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=LtG/G2cOUUW9PQUdCdAKvVdNHVqLeuqifodu7ZzlvBM=;
	b=019o7GXoJ5hYjTOV2T/PJn09ykVEx+VgdGR+ZF1Xip+pOQ4gNnU2rgpiMigXD5cEx/
	lWEe/y4iMxI/XHDIPI9URCJaAhDR8wtA793Ke6PIhjod1y080ebwD7AmfU44oMGaFKgl
	oD8Uqqjrpeb/g/j/6DVHxAgA/IW2m0QnMhc0+BL8jV4QSK9gp6o4EQgwsjWzuVbewK4L
	tutl6dMF9+njTrEgf9ArjYwyh0bPkdYpeHfNPEl3j3DzMdnm66L7NPQkQ4CXqZGyJCEo
	Gu1h9MD8V0+1nWrlpbDk+sq+ojVs4k3jdKKiKPzX7IqdW2etOdOOBmJ4JFMKmoaJ/1TI
	W56Q==
Received: by 10.182.36.102 with SMTP id p6mr12284406obj.77.1337013853663;
	Mon, 14 May 2012 09:44:13 -0700 (PDT)
Received: from localhost.localdomain (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id vs8sm8863380obb.14.2012.05.14.09.44.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 14 May 2012 09:44:12 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 May 2012 11:45:04 -0500
Message-Id: <a0675039d9dea61252ec8b85f044ca5915beb8b9.1337013858.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <cover.1337013858.git.chris_larson@mentor.com>
References: <cover.1337013858.git.chris_larson@mentor.com>
In-Reply-To: <cover.1337013858.git.chris_larson@mentor.com>
References: <cover.1337013858.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 3/3] tcmode-external-csl: handle TUNE_PKGARCH=core2
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
X-List-Received-Date: Mon, 14 May 2012 16:54:11 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/conf/distro/include/tcmode-external-csl.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-external-csl.inc b/meta/conf/distro/include/tcmode-external-csl.inc
index deabd49..11c5df5 100644
--- a/meta/conf/distro/include/tcmode-external-csl.inc
+++ b/meta/conf/distro/include/tcmode-external-csl.inc
@@ -47,6 +47,7 @@ def csl_target_core(d):
         'armv7a-vfp-neon': 'armv7-a-neon',
         'i586': 'sgxx-glibc',
         'i686': 'sgxx-glibc',
+        'core2': 'sgxx-glibc',
         'mips': 'mips32',
         'mipsel': 'el',
         'powerpc-nf': 'nof',
-- 
1.7.7



