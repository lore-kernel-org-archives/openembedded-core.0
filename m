Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S1Yyy-0007Qj-71
	for openembedded-core@lists.openembedded.org;
	Sun, 26 Feb 2012 08:57:24 +0100
Received: by eekc1 with SMTP id c1so31231eek.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Feb 2012 23:48:59 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.213.26.20 as permitted sender) client-ip=10.213.26.20; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.213.26.20 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.213.26.20])
	by 10.213.26.20 with SMTP id b20mr2734735ebc.19.1330242539564 (num_hops
	= 1); Sat, 25 Feb 2012 23:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=msXDOq2q+uCEi6e/nbc28X87k1jgVbZJyeu6NyvvDyg=;
	b=sZjv7SmRtBKuNXNhT9YJO21DYaAoqVAg1WYZLhW3E02umF7+wk+c+SZnNLnC16jmfr
	2+HFR6gHEwTYi/IntSZPWhPud9NlN70l/PIH2MmsVIAMCN3N53wLop6PMQXLMBIdaT0N
	e+9uRNM59micJ669Gm1eMcv6lXHhVyhoCggkQ=
Received: by 10.213.26.20 with SMTP id b20mr2057229ebc.19.1330242539188;
	Sat, 25 Feb 2012 23:48:59 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id u9sm41690299eem.11.2012.02.25.23.48.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 25 Feb 2012 23:48:58 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 Feb 2012 08:48:48 +0100
Message-Id: <cover.1330242184.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
MIME-Version: 1.0
Cc: fcooper@ti.com
Subject: [PATCHv2 0/5] Pending patches
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
X-List-Received-Date: Sun, 26 Feb 2012 07:57:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Patch 0003 depends on
http://patchwork.openembedded.org/patch/22047/

0001 wasn't changed from v1, but still does apply.

0004/0005 is the same as I've sent as single patches to ML before.

The following changes since commit c44e51f281101c8933679f679e3d4a75a41bedf7:

  initscripts: mount and unmount cifs network filesystems (2012-02-24 23:25:33 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/pull

Eric BENARD (1):
  gdb-cross-canadian: build gdb with python support

Martin Jansa (4):
  bitbake.conf: use weak assignment for BB_CONSOLELOG
  bitbake.conf: remove TARGET_ARCH from in SDKPATH
  sstatesig: add SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS option to exclude well
    defined recipe->dependency
  layer.conf: add keymaps to SIGGEN_EXCLUDERECIPES_ABISAFE

 meta/conf/bitbake.conf                             |   12 +++++++++---
 meta/conf/layer.conf                               |    1 +
 meta/lib/oe/sstatesig.py                           |    6 ++++++
 meta/recipes-devtools/gdb/gdb-cross-canadian.inc   |   20 +++++++++++++++++++-
 .../recipes-devtools/gdb/gdb-cross-canadian_7.4.bb |    2 +-
 5 files changed, 36 insertions(+), 5 deletions(-)

-- 
1.7.8.4



