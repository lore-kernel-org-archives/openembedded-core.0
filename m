Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 59E32707B6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 05:55:16 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6O5tIgi021747
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 22:55:18 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 23 Jul 2014 22:55:17 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 24 Jul 2014 01:55:13 -0400
Message-ID: <cover.1406181188.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [PATCH 0/3] Add missing dependency on licap for 3 recipes
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
X-List-Received-Date: Thu, 24 Jul 2014 05:55:23 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

--
The following changes since commit 58f08a96764094189b5aaf3cc8b4cc0c95e23409:

  gst-ffmpeg: Add CVE patches (2014-07-23 21:57:04 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib jhuang0/r_depend_140724_0
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/r_depend_140724_0

Jackie Huang (3):
  pulseaudio: add missing dependency on libcap
  gst-plugins-good: add missing dependency on libcap
  gstreamer1.0-plugins-good: add missing dependency on libcap

 .../gstreamer/gst-plugins-good_0.10.31.bb          |    2 +-
 .../gstreamer/gstreamer1.0-plugins-good.inc        |    2 +-
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
1.7.9.5


