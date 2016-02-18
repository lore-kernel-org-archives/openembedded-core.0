Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id AC49F731DA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Feb 2016 14:18:56 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP; 18 Feb 2016 06:18:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,465,1449561600"; d="scan'208";a="918493631"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga002.fm.intel.com with ESMTP; 18 Feb 2016 06:18:56 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Feb 2016 16:18:53 +0200
Message-Id: <1455805135-20814-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.2
Subject: [PATCH v2 0/2] devtool: create kernel config fragment
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
X-List-Received-Date: Thu, 18 Feb 2016 14:18:56 -0000

Second iteration of rudimentary support for creating kernel config fragments
with devtool.  When doing 'update-recipe' devtool diffs .config.baseline and
.config (under ${S}) and creates/upates a config fragment which is added to
SRC_URI of the recipe. Unlike the in the first version of this patchset,
${S}/.config is now just a symlink to ${B}/.config. This way we only maintain
one copy of the config but it also means that the config is lost if ${B} is
cleaned.

[YOCTO #8999]

The following changes since commit 10351d2e7ab27d0f0311c491b70d0f0056a8f76b:

  pulseaudio: 6.0 -> 8.0 (2016-02-18 07:39:23 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib marquiz/devtool/kernel

for you to fetch changes up to 08dcad8878e8715f29ff9b63c65f3e9c177117a4:

  devtool: update-recipe: create config fragment (2016-02-18 15:53:07 +0200)


Markus Lehtonen (2):
  devtool: sync: update kernel config
  devtool: update-recipe: create config fragment

 scripts/lib/devtool/standard.py | 62 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 60 insertions(+), 2 deletions(-)

-- 
2.6.2


