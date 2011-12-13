Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RaSzq-00061p-Bq
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 15:06:18 +0100
Received: by eekb15 with SMTP id b15so3028376eek.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 05:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=B9XvC1YgINVGj6lOBr99i2QJSkhaECSEtDwtyagfiO0=;
	b=IlOjVYvf4aYsuodId49HzP5Vp8WpXQPolgn4r+C5rw61fbz/udkar8beo5hkuSdg65
	64t5ZHfng29VNrbqed4xRFLqOAdBlk7NmN1vPMBBmC10/cnjWWo9C0bVJEH7glBI5iWo
	WSfwtovbLcsdJ3ZceByhbTF6khoMPsyYKKQnE=
Received: by 10.14.12.78 with SMTP id 54mr4286962eey.150.1323784752468;
	Tue, 13 Dec 2011 05:59:12 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 76sm32186500eeh.0.2011.12.13.05.59.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 13 Dec 2011 05:59:11 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Dec 2011 14:59:03 +0100
Message-Id: <cover.1323784347.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8
In-Reply-To: <1323779470.2731.66.camel@ted>
References: <1323779470.2731.66.camel@ted>
Subject: [PATCH][oe-core 0/3] PR bumps and arm OVERRIDE fix
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
X-List-Received-Date: Tue, 13 Dec 2011 14:06:18 -0000

The following changes since commit f60417055f869acb871be1f01c6900fdf685d71a:

  boost : Do not use icu when building boost. (2011-12-13 12:21:05 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/pull

Martin Jansa (3):
  qt4: use armv6 override instead of armv6-vfp
  xf86-video-omapfb: bump PR due to arm OVERRIDES change
  python: bump PR due to arm OVERRIDES change

 meta/recipes-devtools/python/python_2.7.2.bb       |    2 +-
 .../xorg-driver/xf86-video-omapfb_git.bb           |    2 +-
 meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb          |    4 ++--
 meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb          |    4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

-- 
1.7.8



