Return-Path: <Sen.Zhang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C7C7D6ADA0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2013 01:42:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5O1gmSe000629
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Jun 2013 18:42:48 -0700 (PDT)
Received: from jesse-wrs-desktop.corp.ad.wrs.com (128.224.162.230) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Sun, 23 Jun 2013 18:42:48 -0700
From: Jesse Zhang <sen.zhang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Jun 2013 09:44:54 +0800
Message-ID: <cover.1372038244.git.sen.zhang@windriver.com>
X-Mailer: git-send-email 1.7.11.7
MIME-Version: 1.0
Subject: [PATCH 0/1] gst-ffmpeg: fix libav config error for ppc
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
X-List-Received-Date: Mon, 24 Jun 2013 01:42:47 -0000
Content-Type: text/plain

The following changes since commit edcbb79583e1577cb64d368e3902915dea50a96e:

  ref-manual: Added note about issues on supported distros (2013-06-21 14:26:31 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib szhang/libav
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=szhang/libav

Jesse Zhang (1):
  gst-ffmpeg: fix libav config error for ppc

 .../gstreamer/gst-ffmpeg-0.10.13/libav_e5500.patch    | 19 +++++++++++++++++++
 .../gstreamer/gst-ffmpeg_0.10.13.bb                   |  7 ++++++-
 2 files changed, 25 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/libav_e5500.patch

-- 
1.7.11.7


