Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SI012-0007Gq-Sh
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Apr 2012 18:03:28 +0200
Received: by wibhj13 with SMTP id hj13so910823wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2012 08:54:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=QtHnYja/LqN1W8FNeeE7cvUA677QornCQs3CvO8IvyQ=;
	b=YbkCw8CtkoYLLfxH/S2BufN+zkE87bThfAG2gsxTXXKszUbJ2eVZlf8rd3GXHJQeTA
	i9zXxVooJWcNFJ0cbFA6i0ywF9faIY45A5M/YLnW4quY93OnbpS5xJLpyQUejUghCK/K
	xovFWe5HAbdJb5vFqNqYaAYEyrk6VnDKhSPwDtoVCzCCV3fbML0UJs1Zbk4jTyIAzPa9
	xSGMaIam5DMW6L4kb4wQoeOQYQMERXub/i87cY2pp2mlF2YEvfeYW67PF73GBHYxpQAN
	hxjSu4FdU1OROmfFGLxjSkObQT/7hkFhOlzwRWpu6p135xg6nUEo57ELQCpiUpGQp9pS
	FIBQ==
Received: by 10.216.137.97 with SMTP id x75mr9443744wei.25.1334159649532;
	Wed, 11 Apr 2012 08:54:09 -0700 (PDT)
Received: from localhost.localdomain ([89.121.200.106])
	by mx.google.com with ESMTPS id n8sm10875782wix.10.2012.04.11.08.54.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 Apr 2012 08:54:08 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Apr 2012 18:54:00 +0300
Message-Id: <cover.1334159446.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.5.4
X-Gm-Message-State: ALoCoQkfqNtsWfZn1aUIuUbZf7boi3bNUoSMAd2BI6k/ETkS5bPQgaID/1+GPLQ3JU1qlEbpdO2p
Subject: [V4 0/2] Package gdbm compat libs in gdbm-compat and PR bumps
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
X-List-Received-Date: Wed, 11 Apr 2012 16:03:29 -0000

In order to avoid breaking packages which depend on old package name libgdbm4 (>= 1.10)
compat libs are packaged into a separate package named gdbm-compat
PR bumps for packages with gdbm in depends.

Thanks to Koen Kooi.

The following changes since commit 8e3c4f8874525f0826236f05484051bc9482cdbc:

  python: Add patch to avoid warning about sunaudiodev module (2012-04-11 17:48:52 +0300)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib ag/pythonbug2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ag/pythonbug2

Andrei Gherzan (2):
  gdbm: Package compat libs in gdbm-compat
  PR bump packages with gdbm in DEPENDS

 meta/recipes-devtools/perl/perl_5.14.2.bb          |    2 +-
 meta/recipes-devtools/python/python_2.7.2.bb       |    2 +-
 .../pulseaudio/pulseaudio_1.1.bb                   |    2 +-
 meta/recipes-support/apr/apr-util_1.4.1.bb         |    2 +-
 meta/recipes-support/gdbm/gdbm_1.10.bb             |    7 ++++++-
 5 files changed, 10 insertions(+), 5 deletions(-)

-- 
1.7.5.4



