Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SAHD1-0004PW-Rz
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 09:47:56 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2L8d0Cp019265
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 01:39:00 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Wed, 21 Mar 2012 01:39:01 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Mar 2012 16:38:13 +0800
Message-ID: <cover.1332318835.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH 0/1] gstreamer 0.10.x: remove do_configure_prepend
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Mar 2012 08:47:57 -0000
Content-Type: text/plain

Test info:

Have tested on qemuarm and qemux86.

// Robert

The following changes since commit 224ff370b4636cdd33c47c1e6341ef43a67e0227:

  xserver-kdrive: compile xserver without dtrace support (2012-03-20 15:21:39 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib robert/gst
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/gst

Robert Yang (1):
  gstreamer 0.10.x: remove do_configure_prepend

 .../gstreamer/gst-plugins-bad_0.10.22.bb           |    7 +------
 .../gstreamer/gst-plugins-base_0.10.35.bb          |    7 +------
 .../gstreamer/gst-plugins-good_0.10.30.bb          |    7 +------
 .../gstreamer/gst-plugins-ugly_0.10.18.bb          |    7 +------
 4 files changed, 4 insertions(+), 24 deletions(-)



