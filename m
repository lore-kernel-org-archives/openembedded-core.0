Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 693B36AC95
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jan 2015 05:35:18 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0R5ZIVm014624
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jan 2015 21:35:18 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.226) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 26 Jan 2015 21:35:18 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 27 Jan 2015 13:35:22 +0800
Message-ID: <cover.1422336778.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] udev-cache: avoid using '-L' for stat
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
X-List-Received-Date: Tue, 27 Jan 2015 05:35:23 -0000
Content-Type: text/plain

The following changes since commit 24f19fedb40d0af84beb8e9a6595ea06f09d4615:

  gstreamer1.0-omx: use mulitple SCMs to fetch submodules (2014-12-31 08:22:53 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/udev-cache-stat
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/udev-cache-stat

Chen Qi (1):
  udev-cache: avoid using '-L' for stat

 meta/recipes-core/udev/udev/init       | 2 +-
 meta/recipes-core/udev/udev/udev-cache | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
1.9.1


