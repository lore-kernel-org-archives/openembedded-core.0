Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 19D6B6AC19
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Dec 2014 16:21:51 +0000 (UTC)
Received: by mail-pd0-f171.google.com with SMTP id y13so15765637pdi.30
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Dec 2014 08:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=COgczAkWQqwV/B3x63CW5mFDaxXhxr4YEw3auD1sBxk=;
	b=KszPm6OWBGGitzdr9GDnlpUHuNd0vGTciXfCOkOzaxQnGJOY4q7OTBNZHrs4KGuwQE
	qN0FTFXEQ4n0Co31/iX2FqVYf6e7VzpNaqgcUW2hsLSiGyciY7sc8hfnAwzqJMPrqZe9
	9h/Ya8h5kymSupoblPrmq2EP3hOvTVtDxkZ26EoHFJJCYvv8U+NDRJ3SxbCaYt2qftfM
	J2hs9QVOa6Xe0uXGnIgMlsPRd7k8wSkch+4AgEXLcMbbS4YmuBKSqHiYTMG3IxF7eYfB
	Y+Lz4sKbbhnDM0dAiqBJWT5rp00GX1r7DTs8vU9ZQRRPvhphE8M2tV7tep1VejIuxdT2
	otuA==
X-Received: by 10.70.15.229 with SMTP id a5mr10077603pdd.79.1417623711325;
	Wed, 03 Dec 2014 08:21:51 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id l6sm23580640pdr.39.2014.12.03.08.21.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 03 Dec 2014 08:21:50 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Dec 2014 08:21:40 -0800
Message-Id: <cover.1417623438.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/2] Dizzy-next merge request
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
X-List-Received-Date: Wed, 03 Dec 2014 16:21:56 -0000

Please consider these changes for Dizzy.


The following changes since commit 9e8bb322154e67e521e8c982d20d46dda20c024b:

  babeltrace: Backport fix for unaligned integer (2014-11-26 17:05:47 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akuster/dizzy-next
  http://git.yoctoproject.org/cgit.cgi//log/?h=akuster/dizzy-next

Roy Li (1):
  gst-ffmpeg: fixes for CVE-2014-8548 and CVE-2014-8541

Tom Zanussi (1):
  wic: Use overhead factor when creating partitions from rootfs
    directories

 .../0001-avcodec-smc-fix-off-by-1-error.patch      | 32 ++++++++++
 ...egdec-check-bits-per-pixel-for-changes-si.patch | 68 ++++++++++++++++++++++
 .../gstreamer/gst-ffmpeg_0.10.13.bb                |  2 +
 .../lib/wic/kickstart/custom_commands/partition.py |  2 +
 scripts/lib/wic/utils/oe/misc.py                   |  1 +
 5 files changed, 105 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avcodec-smc-fix-off-by-1-error.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0002-avcodec-mjpegdec-check-bits-per-pixel-for-changes-si.patch

-- 
1.9.1


