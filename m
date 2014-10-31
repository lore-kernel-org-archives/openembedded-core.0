Return-Path: <martin@hundeboll.net>
Received: from mail.hundeboll.net (mail.hundeboll.net [88.198.92.70])
	by mail.openembedded.org (Postfix) with ESMTP id 6627D60169
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Oct 2014 10:17:03 +0000 (UTC)
Received: from hundeboll.es.aau.dk (192.38.55.25.natpool.es.aau.dk
	[192.38.55.25])
	by mail.hundeboll.net (Postfix) with ESMTPSA id 3B9031BF287;
	Fri, 31 Oct 2014 11:17:03 +0100 (CET)
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@hundeboll.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Oct 2014 11:17:01 +0100
Message-Id: <1414750622-17745-1-git-send-email-martin@hundeboll.net>
X-Mailer: git-send-email 2.1.3
MIME-Version: 1.0
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@hundeboll.net>
Subject: [PATCH] Use env in python-shebangs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 31 Oct 2014 10:17:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

To make fake env or virtualenv possible, make sure python scripts use
 "#!/usr/bin/env python" as shebang.

Comments to previous patches/rfcs rejected the idea of either explicit
use of python2 in the env-shebang or a python2-symlink in the bitbake
environment, so this is dropped.

Still we would like to make the lifes easier for those unfortunate souls
that live in a python3-first world/distro :)

Thanks for the previous comments!

Martin Hundebøll (1):
  scripts: use '/usr/bin/env' in shebangs with python

 bitbake/lib/progressbar.py                                | 2 +-
 scripts/lib/wic/conf.py                                   | 2 +-
 scripts/lib/wic/creator.py                                | 2 +-
 scripts/lib/wic/imager/baseimager.py                      | 2 +-
 scripts/lib/wic/kickstart/__init__.py                     | 2 +-
 scripts/lib/wic/kickstart/custom_commands/micboot.py      | 2 +-
 scripts/lib/wic/kickstart/custom_commands/micpartition.py | 2 +-
 scripts/lib/wic/msger.py                                  | 2 +-
 scripts/lib/wic/plugin.py                                 | 2 +-
 scripts/lib/wic/pluginbase.py                             | 2 +-
 scripts/lib/wic/utils/errors.py                           | 2 +-
 scripts/lib/wic/utils/fs_related.py                       | 2 +-
 scripts/lib/wic/utils/misc.py                             | 2 +-
 scripts/lib/wic/utils/partitionedfs.py                    | 2 +-
 scripts/lib/wic/utils/runner.py                           | 2 +-
 scripts/pybootchartgui/pybootchartgui.py                  | 2 +-
 16 files changed, 16 insertions(+), 16 deletions(-)

-- 
2.1.3


