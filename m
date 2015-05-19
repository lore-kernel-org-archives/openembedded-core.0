Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 99A6E6ABB3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 May 2015 01:13:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t4J1DQYI021881
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 18:13:26 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Mon, 18 May 2015 18:13:25 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 May 2015 09:08:10 +0800
Message-ID: <cover.1431997609.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [PATCH 0/4] Upgrade packages and some CVEs fix for gst-ffmpeg
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
X-List-Received-Date: Tue, 19 May 2015 01:13:30 -0000
Content-Type: text/plain

The following changes since commit bc162d21dd148252efcf3ed771e04c791ef4d869:

  bitbake: tests/parse: Add file missing from previous commit (2015-05-16 22:40:44 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib kangkai/uprade-pkgs-may19
  http://git.yoctoproject.org/cgit.cgi//log/?h=kangkai/uprade-pkgs-may19

Kai Kang (4):
  vala: upgrade to version 0.28.0
  alsa-tools: upgrade to version 1.0.29
  alsa-utils: upgrade to 1.0.29
  gst-ffmpeg: fix CVEs

 .../vala/{vala_0.26.1.bb => vala_0.28.0.bb}        |  4 +--
 .../alsa/alsa-tools/autotools.patch                |  4 +--
 .../alsa/alsa-tools/gitcompile_hdajacksensetest    | 13 +++++++
 .../{alsa-tools_1.0.28.bb => alsa-tools_1.0.29.bb} | 10 ++++--
 ...conf_1.0.28.bb => alsa-utils-scripts_1.0.29.bb} |  8 +++--
 .../{alsa-utils_1.0.28.bb => alsa-utils_1.0.29.bb} |  9 +++--
 .../gst-ffmpeg-fix-CVE-2014-7933.patch             | 38 ++++++++++++++++++++
 .../gst-ffmpeg-fix-CVE-2014-9318.patch             | 37 +++++++++++++++++++
 .../gst-ffmpeg-fix-CVE-2014-9603.patch             | 41 ++++++++++++++++++++++
 .../gstreamer/gst-ffmpeg_0.10.13.bb                |  3 ++
 10 files changed, 153 insertions(+), 14 deletions(-)
 rename meta/recipes-devtools/vala/{vala_0.26.1.bb => vala_0.28.0.bb} (42%)
 create mode 100755 meta/recipes-multimedia/alsa/alsa-tools/gitcompile_hdajacksensetest
 rename meta/recipes-multimedia/alsa/{alsa-tools_1.0.28.bb => alsa-tools_1.0.29.bb} (82%)
 rename meta/recipes-multimedia/alsa/{alsa-utils-alsaconf_1.0.28.bb => alsa-utils-scripts_1.0.29.bb} (49%)
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.0.28.bb => alsa-utils_1.0.29.bb} (95%)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-fix-CVE-2014-7933.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-fix-CVE-2014-9318.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-fix-CVE-2014-9603.patch

-- 
1.9.1


