Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SmnKw-00066Q-TG
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jul 2012 16:47:19 +0200
Received: by mail-yw0-f47.google.com with SMTP id j56so9174692yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jul 2012 07:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=mdzHrbf6FqSzsuxR8kJPi1CsjbmbJ/uyiuAEI8aTsu0=;
	b=hvGwG5ZN304D5wc3PPekDWfWbhaHVlKpLQ4j6PATmRzBfEb5V1CsBir5wgWnLJOApw
	HlcWov6Y6MwmDNIBTw8eqNplmegPat99HDliNT0Cuw8xN9wNjeoZC3Ow7ClRsh841OF8
	6GZmekzz3IqGWyoe6vupU6r2JhG4sDihzW9SGhFGclscCRt/lquxL0uti99YR5ChCIkO
	crFUXcCxWYEaH9vyavkvtY5sCPhU32zY/QgBHPMcZI9ziglU0EjLdF71NFuiF35dutKT
	YU+ZDTe7ncifY4KTVn+aicdwhTdnX4ojl28y63kpex+MONq4iAqxrZjlacutmedrELFz
	ce0w==
Received: by 10.68.240.73 with SMTP id vy9mr27908452pbc.102.1341498973830;
	Thu, 05 Jul 2012 07:36:13 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id ru10sm9521262pbc.50.2012.07.05.07.36.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 Jul 2012 07:36:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jul 2012 07:35:30 -0700
Message-Id: <3a034dd8de967625dc8b3409d035a3e74df94eb3.1341498745.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <48ef71f7c5eea25278a5a9c9befd01123369e2f9.1341498745.git.raj.khem@gmail.com>
References: <48ef71f7c5eea25278a5a9c9befd01123369e2f9.1341498745.git.raj.khem@gmail.com>
In-Reply-To: <cover.1341498745.git.raj.khem@gmail.com>
References: <cover.1341498745.git.raj.khem@gmail.com>
Subject: [PATCH 11/14] puzzles: Fix checksums
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
X-List-Received-Date: Thu, 05 Jul 2012 14:47:21 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-sato/puzzles/puzzles_r9561.bb |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-sato/puzzles/puzzles_r9561.bb b/meta/recipes-sato/puzzles/puzzles_r9561.bb
index 83fabdf..e51a18f 100644
--- a/meta/recipes-sato/puzzles/puzzles_r9561.bb
+++ b/meta/recipes-sato/puzzles/puzzles_r9561.bb
@@ -11,9 +11,8 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=453de74d749439762ef4814f7bee1fec"
 # Upstream updates puzzles.tar.gz for the new release, so checksums seem to be changing regularly right now
 #SRC_URI = "svn://ixion.tartarus.org/main;module=puzzles;rev=${MOD_PV}"
 SRC_URI = "http://www.chiark.greenend.org.uk/~sgtatham/puzzles/puzzles-${PV}.tar.gz"
-SRC_URI[md5sum] = "c86695aebfc95efe1d6241863849101b"
-SRC_URI[sha256sum] = "2c20a45189387e3de8804a58bdb4e47ac4bb0f890001a509dfbdc015b5a84b95"
-
+SRC_URI[md5sum] = "4ffd5eaead1ffba8b865c83b93fb4709"
+SRC_URI[sha256sum] = "35e79befa04c61df850384ff6c07b4d154412240b81f637275de383cb7d542d0"
 
 S = "${WORKDIR}/${BPN}-${PV}"
 
-- 
1.7.9.5



