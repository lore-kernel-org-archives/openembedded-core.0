Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2243C60229
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2018 08:40:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4G8dhKw022236
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2018 01:40:21 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Wed, 16 May 2018 01:39:54 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 16 May 2018 16:09:37 +0800
Message-ID: <cover.1526458108.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Subject: [PATCH 0/1] gstreamer1.0-plugins-good: enable PACKAGECONFIG gtk conditionally
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
X-List-Received-Date: Wed, 16 May 2018 08:40:32 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The following changes since commit 13cc30cd7de4841990b600e83e1249c81a5171dd:

  local.conf.sample.extended: Drop obsolete rpc and libnsl (2018-05-15 11:07:50 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/gst-good
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/gst-good

Kai Kang (1):
  gstreamer1.0-plugins-good: enable PACKAGECONFIG gtk conditionally

 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.14.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
2.14.1


