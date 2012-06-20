Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1ShMro-0001GP-VI
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jun 2012 17:30:49 +0200
Received: by mail-pz0-f47.google.com with SMTP id h21so9610280dal.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2012 08:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=N3jlfXpG7Y0fvqytS39/+CszEMHBAwIARY+7rw4QUJo=;
	b=UDvBnPu2vfW29ICuIpP7kdjt2cW4mXKHX8ZgxikpBlbQ9hfVsetph4wcdYpimKIMbv
	f+F/604QeLcpWd5M3Dfugz1jv2D92pa0l1fVv2nUjpmLHp+fuPefAX8Q5TGJJbkTYaOH
	knF3myxd7Cpd0e1b/KALcLYREj8HfLU5XEpsMVhPl91lsHb7qgRJhRmyuxGqzlM3ZK2U
	1GwmnCTOtl9B0NY+/djcK075ZmtpmaOAGyanyBxsF2Sy27pfMovqXCkPmcp2x/GdimxX
	AS4NLUQf0fYHyO0LooXurPGjHgMSuoGmEJbzVKC7YXNqPumidZyLzFKrxgG4ixW8cI8n
	iRrw==
Received: by 10.68.130.9 with SMTP id oa9mr76658492pbb.95.1340205606159;
	Wed, 20 Jun 2012 08:20:06 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id jw3sm32227422pbc.65.2012.06.20.08.20.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Jun 2012 08:20:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jun 2012 08:18:40 -0700
Message-Id: <b944731941ce4c3b9fb916322bebac23f3a7af08.1340205164.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <b69f84fe9eeede659eb8f390497ccb764e37f880.1340205163.git.raj.khem@gmail.com>
References: <b69f84fe9eeede659eb8f390497ccb764e37f880.1340205163.git.raj.khem@gmail.com>
In-Reply-To: <cover.1340205163.git.raj.khem@gmail.com>
References: <cover.1340205163.git.raj.khem@gmail.com>
Subject: [PATCH 5/5] binutils: Enable plugins by default
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
X-List-Received-Date: Wed, 20 Jun 2012 15:30:49 -0000

Plugins work well in 2.22+ so lets enable them
helps with lto

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/binutils/binutils.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index 19cb06a..5c8e55b 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -51,6 +51,7 @@ B = "${S}/build.${HOST_SYS}.${TARGET_SYS}"
 
 EXTRA_OECONF = "--program-prefix=${TARGET_PREFIX} \
                 --disable-werror \
+		--enable-plugins \
 		${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '--enable-gold=default', '', d)} \
                 ${@base_contains('DISTRO_FEATURES', 'multiarch', '--enable-64-bit-bfd', '', d)}"
 
-- 
1.7.5.4



