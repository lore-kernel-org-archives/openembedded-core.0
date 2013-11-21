Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BF9B46D9AD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 07:05:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAL75Hf8012878
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 23:05:17 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Wed, 20 Nov 2013 23:05:16 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Nov 2013 01:05:03 -0600
Message-ID: <1385017505-22630-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [dora][PATCH 0/2] Two CVE patches...
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
X-List-Received-Date: Thu, 21 Nov 2013 07:05:17 -0000
Content-Type: text/plain

Ming Liu (2):
  libtiff: fix CVE-2013-1960
  gst-ffmpeg: fix CVE-2013-3674

 .../gst-ffmpeg-CVE-2013-3674.patch                 |  26 ++++
 .../gstreamer/gst-ffmpeg_0.10.13.bb                |   3 +-
 .../libtiff/files/libtiff-CVE-2013-1960.patch      | 151 +++++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.0.3.bb      |   3 +-
 4 files changed, 181 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-CVE-2013-3674.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/libtiff-CVE-2013-1960.patch

-- 
1.8.1.2.545.g2f19ada


