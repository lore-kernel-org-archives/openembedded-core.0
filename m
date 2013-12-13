Return-Path: <kergoth@gmail.com>
Received: from mail-ea0-f181.google.com (mail-ea0-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id 9779160EF3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 14:56:44 +0000 (UTC)
Received: by mail-ea0-f181.google.com with SMTP id m10so938320eaj.40
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 06:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=PwW/zvuD2yCVowkKkx7wxBWthS+oTOBzjdoSKU+crA4=;
	b=HeoiJrYhUhLQywP+9C9rJCxjiEdRL8Uny0UiVj6nXMS1IcpKeIJq7+fRGkJF8YYIqu
	IEGz3fdFtvPn7BPoCYE2rj6OAc/k902IbQsI4/OldOtrPErXPhTs0+cYAfkpYBN1rzKS
	gjlQs4tX3vOVk2mhdg/UoRywT3RC8CVnzoI925SgzawE8bgJZQLoQKu/85yOuzN187j7
	vT5RNo9Ctjjoo07SMDGLSjGsfHq4YuanLMFWht/WwH+TgmgLUwPGbfCaJYE8rra7x3G6
	ziDA8zd/U7G7dRZp50I9OEoCBVhUdxSkhDQIE5DocIYWSqfHIkKSuWMzJsLYA4773Kdr
	D9MA==
X-Received: by 10.14.221.193 with SMTP id r41mr3420622eep.92.1386946603824;
	Fri, 13 Dec 2013 06:56:43 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id 44sm7648810eek.5.2013.12.13.06.56.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 13 Dec 2013 06:56:43 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Dec 2013 07:56:36 -0700
Message-Id: <cover.1386946335.git.kergoth@gmail.com>
X-Mailer: git-send-email 1.8.3.4
Subject: [RFC PATCH 0/2] Add /etc/os-release
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
X-List-Received-Date: Fri, 13 Dec 2013 14:56:45 -0000

systemd wants /etc/os-release, and it's useful for other software, and the
user as well. This adds it as a separate recipe which generates the metadata
using our config metadata variables (e.g. DISTRO_*), and rreccomends it from
systemd. I think this is a reasonablea pproach, but I wanted to run it by
folks, and also pursue an answer to my open question on this, should
base-files pull it in instead of systemd, or something else, for non-systemd
images? Do we care if it's missing from those? Thoughts?

The following changes since commit 62849843a4a83b10316bc6cb1e4b3f0622391dea:

  gdb-7.6.1: fix cygwin check in configure script (2013-12-12 22:41:13 +0000)

are available in the git repository at:

  git@github.com:kergoth/oe-core.git os-release

for you to fetch changes up to b00a526527b3248c9014bc3c0e5c606ef97e0838:

  systemd: rrecommend os-release (2013-12-13 07:41:08 -0700)

----------------------------------------------------------------
Christopher Larson (2):
  os-release: add new operating system identification recipe
  systemd: rrecommend os-release

 meta/recipes-core/os-release/os-release.bb | 42 ++++++++++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_208.bb   |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-core/os-release/os-release.bb

-- 
1.8.3.4


