Return-Path: <ajlennon@gmail.com>
Received: from mail-we0-f182.google.com (mail-we0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id DF5CC6B7A6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jun 2014 21:54:35 +0000 (UTC)
Received: by mail-we0-f182.google.com with SMTP id t60so129446wes.27
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jun 2014 14:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id;
	bh=m3cvPMAt1yfMoxZOl/Y9TmGJtomWfRZkngJ7EATMPo0=;
	b=taxJ75/nCd/ZtiY4267lF3khjxIrMXRQ0eaMjC5RGoXtHPnmVY3Nsak+okyEfbMsjR
	QueaKeGN0NFKGy+5LiPAXrDCDGrihNgCfG0B+/v0y2GY0cA6NYJgmy8I0sqeIDyFWuny
	kD4q/NHCOOECWRjgFVM5npzq82pC4PGYz2IEGCQGFgHqkC/Pbx2ndEPUfb4Z5UQfykM9
	iUqDmpvYlVYNdU8R00PTS7ZnXeDAEhf/0ivnG/RHhl4Fjz6igBNQSmC4N/yKpmf+DRu8
	ac44eoId3juI2bc+P7EJcnLGtLtHj/LkQrc5l13UQMBrUrS8xAiBz29F3TFwZNdb+Nkg
	WNPA==
X-Received: by 10.180.37.144 with SMTP id y16mr9307388wij.55.1401918876014;
	Wed, 04 Jun 2014 14:54:36 -0700 (PDT)
Received: from localhost.localdomain
	(cpc32-live22-2-0-cust59.17-2.cable.virginm.net. [82.36.253.60])
	by mx.google.com with ESMTPSA id oy4sm5298921wjb.41.2014.06.04.14.54.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 04 Jun 2014 14:54:35 -0700 (PDT)
Sender: Alex Lennon <ajlennon@gmail.com>
From: Alex J Lennon <ajlennon@dynamicdevices.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jun 2014 22:53:45 +0100
Message-Id: <cover.1401918455.git.ajlennon@dynamicdevices.co.uk>
X-Mailer: git-send-email 2.0.0
Subject: [PATCH 0/1] gstreamer1.0-rtsp-server: Add recipe to support gst-rtsp-server
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
X-List-Received-Date: Wed, 04 Jun 2014 21:54:36 -0000

Please see following patch for details

Alex J Lennon (1):
  gstreamer1.0-rtsp-server: Add recipe to support gst-rtsp-server

 .../gstreamer/gstreamer1.0-rtsp-server.inc                 | 14 ++++++++++++++
 .../gstreamer/gstreamer1.0-rtsp-server_1.2.3.bb            |  9 +++++++++
 2 files changed, 23 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.2.3.bb

-- 
2.0.0


