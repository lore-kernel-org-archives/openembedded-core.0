Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1UAGyz-0000yO-M1
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 10:38:02 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1Q9LcSC007871
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 26 Feb 2013 01:21:38 -0800 (PST)
Received: from pek-usp-3.wrs.com (128.224.163.124) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.328.9;
	Tue, 26 Feb 2013 01:21:37 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Feb 2013 17:24:34 +0800
Message-ID: <81535205ac3c43f23757a39d8ea43b678cce095f.1361862860.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.11.2
In-Reply-To: <cover.1361862860.git.liezhi.yang@windriver.com>
References: <cover.1361862860.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: dvhart@linux.intel.com
Subject: [PATCH 1/7] e2fsprogs: upgrade to the git version (rename only)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Feb 2013 09:38:02 -0000
Content-Type: text/plain

We will replace the "genext2fs" command in the bbclass with the debugfs
command from e2fsprogs, and we need the "symlink" subcommand in the
debugfs which only exists in the up-to-date git repo currently, so
change the source to use the git repo.

renamed:    e2fsprogs-1.42.6/acinclude.m4 -> e2fsprogs/acinclude.m4
renamed:    e2fsprogs-1.42.6/fallocate.patch -> e2fsprogs/fallocate.patch
renamed:    e2fsprogs-1.42.6/mkdir.patch -> e2fsprogs/mkdir.patch
renamed:    e2fsprogs-1.42.6/remove.ldconfig.call.patch -> e2fsprogs/remove.ldconfig.call.patch
renamed:    e2fsprogs_1.42.6.bb -> e2fsprogs_git.bb

[YOCTO #3848]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../e2fsprogs/{e2fsprogs-1.42.6 => e2fsprogs}/acinclude.m4                | 0
 .../e2fsprogs/{e2fsprogs-1.42.6 => e2fsprogs}/fallocate.patch             | 0
 .../e2fsprogs/{e2fsprogs-1.42.6 => e2fsprogs}/mkdir.patch                 | 0
 .../e2fsprogs/{e2fsprogs-1.42.6 => e2fsprogs}/remove.ldconfig.call.patch  | 0
 meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.42.6.bb => e2fsprogs_git.bb} | 0
 5 files changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.42.6 => e2fsprogs}/acinclude.m4 (100%)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.42.6 => e2fsprogs}/fallocate.patch (100%)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.42.6 => e2fsprogs}/mkdir.patch (100%)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.42.6 => e2fsprogs}/remove.ldconfig.call.patch (100%)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.42.6.bb => e2fsprogs_git.bb} (100%)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.6/acinclude.m4 b/meta/recipes-devtools/e2fsprogs/e2fsprogs/acinclude.m4
similarity index 100%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.6/acinclude.m4
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs/acinclude.m4
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.6/fallocate.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/fallocate.patch
similarity index 100%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.6/fallocate.patch
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs/fallocate.patch
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.6/mkdir.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdir.patch
similarity index 100%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.6/mkdir.patch
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdir.patch
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.6/remove.ldconfig.call.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/remove.ldconfig.call.patch
similarity index 100%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.6/remove.ldconfig.call.patch
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs/remove.ldconfig.call.patch
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.6.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb
similarity index 100%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.6.bb
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb
-- 
1.7.11.2



