Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SRtRT-0005lx-PO
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 01:03:40 +0200
Received: by dalh21 with SMTP id h21so8527529dal.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 May 2012 15:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=HrQzx8cjJkVEx2ggr6kovipeBI+SkgWdlcNFwSx5Cds=;
	b=SIUPGXha862qADB/7b3wGNlXIFTD8mptgzyDP9ZyH2Sgl/yzEiSeRvXjjq8B4QALoI
	rUTTqWqhzlIsBT8m+5CXRExQQNcPq2ufULZqZ/Gt+p5w2RrrtcRpZtRRaGJyPQhFQwlD
	FwsIJYBXUusMK0CVMwr/k20DYFxgt6UXL9T6ajemuALfueQlJ80g7M3fdOvUs3Pn0Mze
	8qz1QimTtV4SWk+UZUk2zRer6C45/uBTxEciEAHCdjBdyFcZ8uBHO2wH7yKLBUphIQMw
	+xImASTxJVk5/xjeIPHOPG5YxPaDLSuuVSFmHUGsNK/8K7uICGmGUIiYcgkhsgIZcVGv
	QHDw==
Received: by 10.68.228.132 with SMTP id si4mr1601823pbc.86.1336517626757;
	Tue, 08 May 2012 15:53:46 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id i1sm3764592pbv.49.2012.05.08.15.53.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 08 May 2012 15:53:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 May 2012 15:53:30 -0700
Message-Id: <cover.1336517492.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/3] Kmod fixes
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
X-List-Received-Date: Tue, 08 May 2012 23:03:40 -0000

This patchset fixes upgrade paths form kmod
Updates to .8 release that should fix meta-oe PR being ahead of oe-core
Packages libkmod in base_libdir instead of libdir

The following changes since commit 043871d7e5d2d19c2ff43e54d2ff180c09e8903e:

  kern-tools: integrate minor fixes (2012-05-08 16:06:15 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib kraj/kmod
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/kmod

Khem Raj (2):
  kmod: Update to .8 release
  kmod: Use base_libdir for installing libkmod

Martin Jansa (1):
  kmod: fix upgrade path from module-init-tools

 meta/recipes-kernel/kmod/kmod.inc    |    4 ++--
 meta/recipes-kernel/kmod/kmod_git.bb |   12 ++++++++----
 2 files changed, 10 insertions(+), 6 deletions(-)

-- 
1.7.5.4



