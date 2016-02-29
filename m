Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6DE5F77261
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 09:23:10 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u1T9N9Mw005308
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 29 Feb 2016 01:23:10 -0800
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Mon, 29 Feb 2016 01:23:09 -0800
From: <kai.kang@windriver.com>
To: <ross.burton@intel.com>
Date: Mon, 29 Feb 2016 17:19:31 +0800
Message-ID: <cover.1456737103.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] V4: Replace retry logic in useradd with flock
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
X-List-Received-Date: Mon, 29 Feb 2016 09:23:14 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

V4:
* re-add check whether user/group exist


Hi Ross,

I add check back that avahi fails to do compile when remove the checks:

| useradd: user 'avahi-autoipd' already exists

So I add

set +e

But it fails with:

ERROR: Fakeroot process (13034) exited unexpectedly (-9), shutting down...

So I add the checks back and the commit works.

Regards,
Kai

The following changes since commit 4006a7f2762ccd5dcbc6cdff49482d4387a73261:

  sanity: Fix int verses string reference (2016-02-28 22:54:09 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/flockv4
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/flockv4

Kai Kang (1):
  useradd_base.bbclass: replace retry logic with flock

 meta/classes/useradd.bbclass      |   6 +-
 meta/classes/useradd_base.bbclass | 165 ++++++++++----------------------------
 2 files changed, 46 insertions(+), 125 deletions(-)

-- 
2.6.1


