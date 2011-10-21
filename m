Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RHEyU-0004Jy-7L
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 15:17:26 +0200
Received: by bkat8 with SMTP id t8so5091561bka.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2011 06:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=4bD9BIumDe0jyJJvtx3aFpWd6NwNzZH/jMAwEUjvVE8=;
	b=ebeRP+a+jNyEO1RMXZyhZi9i7i6pv3Sv/ZVeB+PeKjyGX3svojVjtqZMghsxisyqMI
	h7YpYhuIv63zN3GUmZkjA8zAL7BVm5O9PfkWVEtYMlVQNuGWN+/3nKY6w/QAqEf4B/Ep
	y36TTVZXjuYnuOqTFW9ydE0v6odW1JsjwEaQM=
Received: by 10.204.13.68 with SMTP id b4mr10705265bka.96.1319202689087;
	Fri, 21 Oct 2011 06:11:29 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j9sm13469749bkd.2.2011.10.21.06.11.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Oct 2011 06:11:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Oct 2011 15:11:21 +0200
Message-Id: <1319202681-3972-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <20111021112625.GQ3522@jama.jama.net>
References: <20111021112625.GQ3522@jama.jama.net>
Subject: [PATCH] subversion-1.6.15: add native support too
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
X-List-Received-Date: Fri, 21 Oct 2011 13:17:26 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../subversion/subversion_1.6.15.bb                |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/subversion/subversion_1.6.15.bb b/meta/recipes-devtools/subversion/subversion_1.6.15.bb
index 9a9484f..d3c7392 100644
--- a/meta/recipes-devtools/subversion/subversion_1.6.15.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.6.15.bb
@@ -5,6 +5,8 @@ RDEPENDS_${PN} = "neon"
 LICENSE = "Apache-2"
 HOMEPAGE = "http://subversion.tigris.org"
 
+BBCLASSEXTEND = "native"
+
 PR = "r1"
 
 SRC_URI = "http://subversion.tigris.org/downloads/${BPN}-${PV}.tar.bz2 \
-- 
1.7.7



