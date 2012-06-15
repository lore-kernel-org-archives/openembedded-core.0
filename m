Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SfPxX-0001Uo-6Z
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jun 2012 08:24:40 +0200
Received: by mail-pz0-f47.google.com with SMTP id h21so3477206dal.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2012 23:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=PivEa8q5qMnKKteylm4O3Jg4W2Zo/wyILBDiMNFdOSY=;
	b=Ngki8FuXVk9ZBQaMX3hJR+8jCvcyg2BBRB5lHXdLNBRlrng/iDtrdkF+rJiF4B3DLS
	pyfjUm+nQ9H+Uh9cH6955/bT3cK/V4Q+1IeGlKaAMd/MtsXP3ZUgtebskb/SGQoOxCCT
	OTn7K/Y+eLiw7Vj/qQsRdD9+LtOEVGIoBEF/SvRVNkNxetSJNrZRTa/lyFofAeBxrSdo
	YPzg2rK96P9h5S5fvpZmVPYRk4bF91Ojc4IwiNrs17o3SClcZfFZxucsoirgkNjzViKx
	NqLcgX1bT3K0YrJt25cM9IPw4m/PjQIYmKp6m/2rGuv8BAVlAm88Vv4RtXu7nbu5fKVc
	ntYw==
Received: by 10.68.192.73 with SMTP id he9mr17220249pbc.17.1339740843116;
	Thu, 14 Jun 2012 23:14:03 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id tm2sm12117280pbc.69.2012.06.14.23.14.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 14 Jun 2012 23:14:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jun 2012 23:12:36 -0700
Message-Id: <09638883e17cf3c76bac575a10e5396011e51553.1339740433.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1366d81a5719e42af8bf24d46b86352491fc0e67.1339740433.git.raj.khem@gmail.com>
References: <1366d81a5719e42af8bf24d46b86352491fc0e67.1339740433.git.raj.khem@gmail.com>
In-Reply-To: <cover.1339740433.git.raj.khem@gmail.com>
References: <cover.1339740433.git.raj.khem@gmail.com>
Subject: [PATCH 9/9] libzypp: Define OECMAKE_CXX_LINK_FLAGS when compiling for uclibc
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
X-List-Received-Date: Fri, 15 Jun 2012 06:24:40 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/libzypp/libzypp_git.bb |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/libzypp/libzypp_git.bb b/meta/recipes-extended/libzypp/libzypp_git.bb
index ca32e73..471ee1d 100644
--- a/meta/recipes-extended/libzypp/libzypp_git.bb
+++ b/meta/recipes-extended/libzypp/libzypp_git.bb
@@ -49,8 +49,7 @@ FILES_${PN}-pkgmgt = "${bindir}/package-manager \
                      "
 
 EXTRA_OECMAKE += " -DLIB=${@os.path.basename('${libdir}')}"
-
-LDFLAGS += "-lpthread"
+OECMAKE_CXX_LINK_FLAGS_libc-uclibc += "-pthread"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-- 
1.7.5.4



