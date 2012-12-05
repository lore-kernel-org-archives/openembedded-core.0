Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TgJtc-0006Bd-Jy
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 19:40:37 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so3064394eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Dec 2012 10:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer;
	bh=NsHKLAAl7/CgaDzEnldtyPkuc/AP3WMLplWZM84NeOE=;
	b=Yh2xLODCs30LHW73DapekjfC1TrXZ5OtNevpg72S2SGe3Pj3ZABsZ7pzf5z9Uli86A
	s4rcnaOQ5c/VK2Tvl1JjAqEzbpKk64HYKVZ4gu5dxjK+U8N5CQmnNuQrianRpvbS9BH9
	/E9I7hPrPdaxvOGtIUvwisY7dY7xNz7OYVoLdrlnQuWzEpaXWsDlNJ8FmB3S57ECTeXo
	rkp7yiOjv1+e32ZohPZuRtSNQ6fBZnsyd7V4RcPtJKsRvpFtfKNE8lvqT1bh0FIvQScI
	szItoYV1+ccJA6KVuoQpYq0KAKTNFzdVRrtseSnQN3m7GNQMY40y4QIZm4tOOacl0ySr
	VJZQ==
Received: by 10.14.206.197 with SMTP id l45mr10063285eeo.17.1354731971148;
	Wed, 05 Dec 2012 10:26:11 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 44sm10692129eek.0.2012.12.05.10.26.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Dec 2012 10:26:10 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Dec 2012 19:26:02 +0100
Message-Id: <cover.1354731942.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
Subject: [PATCH 0/5] Small fixes from bitbake world
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
X-List-Received-Date: Wed, 05 Dec 2012 18:40:56 -0000

The following changes since commit d84f7d7a12b4271f7b2bfde9fb356d750abff15d:

  sstate.bbclass: fix detection of owners matching sstate files (2012-12-05 15:34:01 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/pull

Martin Jansa (5):
  at: change initscript dependency from build time to runtime
  scripts/sstate-diff-machines.sh: add simple script to compare sstate
    checksums between MACHINEs
  scripts/sstate-sysroot-cruft.sh: add simple script to find files in
    sysroots not tracked by sstate
  git: fix unpackaged python files
  python-smartpm: don't try to remove /usr/share/share twice

 meta/recipes-devtools/git/git.inc                  |   4 +-
 meta/recipes-devtools/git/git_1.7.7.bb             |   2 +-
 .../python/python-smartpm_1.4.1.bb                 |   5 +-
 meta/recipes-extended/at/at_3.1.13.bb              |  13 ++-
 scripts/sstate-diff-machines.sh                    | 107 +++++++++++++++++++++
 scripts/sstate-sysroot-cruft.sh                    |  78 +++++++++++++++
 6 files changed, 198 insertions(+), 11 deletions(-)
 create mode 100755 scripts/sstate-diff-machines.sh
 create mode 100755 scripts/sstate-sysroot-cruft.sh

-- 
1.8.0



