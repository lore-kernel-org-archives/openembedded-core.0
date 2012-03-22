Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SAfz4-0001ep-J5
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 12:15:10 +0100
Received: by wibhj13 with SMTP id hj13so515349wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 04:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=8InBvO+hrjnj0V9FoIyGTqPuMDMcS87UhEQrzgpisK0=;
	b=Zz2W622uRPoglabKPzaP8ImOMBNPpQLaMIS3sulRLaQu2HOVnUaGY/ovsPKcdjE/QE
	CD9B4t0qc0NSj6wKv/4JFIYuQ/iLUl0ovX5S7/aFK582X+bTJ9Fo65A7UiiJJOK+0Xss
	iwm6DfmCIY5nUoVitvdt8Cwh4qxcl7rWY+RknNVSir0YrzYYqztQF6oh4bKPOx2H72b/
	ed77fe6pFT8Btc6PfLK8uWDIt3Eyztb4KDbmRLpKSXy/9aWcsgPJmU3NFaEXvwGmv2Ei
	nwPzSfY9mMDobEQlx+ERN7/ATz9o7F8EFr2nG348HhpSsPta/a33/J57T4n0OhUTT8UY
	ZGlA==
Received: by 10.180.100.2 with SMTP id eu2mr4186293wib.1.1332414375752;
	Thu, 22 Mar 2012 04:06:15 -0700 (PDT)
Received: from localhost.localdomain (p5B0A13EE.dip.t-dialin.net.
	[91.10.19.238])
	by mx.google.com with ESMTPS id n8sm7454974wix.10.2012.03.22.04.06.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Mar 2012 04:06:15 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Mar 2012 12:10:26 +0100
Message-Id: <1332414627-6512-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [PATCH] busybox: enable eject
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
X-List-Received-Date: Thu, 22 Mar 2012 11:15:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

v1 -> v2:
follow busybox-1.19.3 -> busybox-1.19.4

Andreas Müller (1):
  busybox: enable eject

 meta/recipes-core/busybox/busybox-1.19.4/defconfig |    2 +-
 meta/recipes-core/busybox/busybox_1.19.4.bb        |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
1.7.4.4



