Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 991E071AC2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 07:37:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v8Q7bj9r024888
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 00:37:45 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Tue, 26 Sep 2017 00:37:44 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Sep 2017 15:43:23 +0800
Message-ID: <cover.1506411760.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] ffmpeg: backport patches to fix 12 CVEs
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
X-List-Received-Date: Tue, 26 Sep 2017 07:37:44 -0000
Content-Type: text/plain

The following changes since commit f7c3a0267aeae74a216de9f081b2cb189388ad88:

  qemurunner: print tail qemu log in case bootlog is empty (2017-09-25 14:16:53 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/ffmpeg-cves
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/ffmpeg-cves

Chen Qi (1):
  ffmpeg: backport patches to fix 12 CVEs

 .../ffmpeg/ffmpeg/CVE-2017-14054.patch             | 39 +++++++++
 .../ffmpeg/ffmpeg/CVE-2017-14055.patch             | 34 ++++++++
 .../ffmpeg/ffmpeg/CVE-2017-14056.patch             | 51 ++++++++++++
 .../ffmpeg/ffmpeg/CVE-2017-14057.patch             | 44 ++++++++++
 .../ffmpeg/ffmpeg/CVE-2017-14058.patch             | 94 ++++++++++++++++++++++
 .../ffmpeg/ffmpeg/CVE-2017-14059.patch             | 40 +++++++++
 .../ffmpeg/ffmpeg/CVE-2017-14169.patch             | 39 +++++++++
 .../ffmpeg/ffmpeg/CVE-2017-14170.patch             | 49 +++++++++++
 .../ffmpeg/ffmpeg/CVE-2017-14171.patch             | 44 ++++++++++
 .../ffmpeg/ffmpeg/CVE-2017-14222.patch             | 40 +++++++++
 .../ffmpeg/ffmpeg/CVE-2017-14223.patch             | 38 +++++++++
 .../ffmpeg/ffmpeg/CVE-2017-14225.patch             | 49 +++++++++++
 meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.3.bb     | 12 +++
 13 files changed, 573 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14054.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14055.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14056.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14057.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14058.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14059.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14169.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14170.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14171.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14222.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14223.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14225.patch

-- 
1.9.1


