Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D2F59731E3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 07:07:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0B77JCe026674
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 10 Jan 2016 23:07:19 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Sun, 10 Jan 2016 23:07:18 -0800
From: <kai.kang@windriver.com>
To: <ross.burton@intel.com>
Date: Mon, 11 Jan 2016 15:07:11 +0800
Message-ID: <cover.1452495946.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] V2: Add dependency back for glib-2.0
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
X-List-Received-Date: Mon, 11 Jan 2016 07:07:22 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The following changes since commit 221d864042658daa054281aab439b44d54fe94d7:

  bitbake: fetch/git: Change to use clearer ssh url syntax for broken servers (2016-01-08 13:58:08 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/glib-2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/glib-2

Kai Kang (1):
  glib-2.0: add dependency glib-2.0-native back

 meta/recipes-core/glib-2.0/glib.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
2.6.1


