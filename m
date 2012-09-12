Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1TBtSu-0007o8-96
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 22:23:16 +0200
Received: by wibhm2 with SMTP id hm2so63772wib.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2012 13:10:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=+udb9BMRllRoZ1E61ZXFADD2QQs+0q/gzE8JD9/bwiE=;
	b=Uptimre7hESAi+9yurqSA3oJM0AyLsgliPHYLgt0bue3XqwyFaAH+VLg7ISmVnD8Qv
	eFf98BNHbQTV8mFp6o3mqYW3xqTSMDB99oWtfR8Nhr72+pig/qSAAF3q7j8/m47jdPkc
	x4OJtzzAJW8wyqMsvf829XjYfJDANUwtlTOVgSUWLQlQ8yrFl04/ZDd0s7E1s23VESJB
	+pFiourNBfR17yywDw9KC55EmxxWu9kU7bMWBP4TcEhbZg/jEP5ayhK0VWOaFLeN4vlB
	oig5uN7RXaGerpcIEHugKoSUvFlMBFbMjdsN5xg3/K/unKK0le5/YqMV7NZHVNqkE9dI
	mhmg==
Received: by 10.180.20.204 with SMTP id p12mr35030725wie.7.1347480643807;
	Wed, 12 Sep 2012 13:10:43 -0700 (PDT)
Received: from localhost.localdomain ([79.118.163.23])
	by mx.google.com with ESMTPS id k2sm14507427wiz.7.2012.09.12.13.10.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 12 Sep 2012 13:10:42 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Sep 2012 23:10:33 +0300
Message-Id: <cover.1347480378.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQmGN6fUji9V9PsHUr/vkYOUvL+Y0Z9AYz/x74mdqMewoP/Ch7EsqPiuZnB0JMZgUv7CSXzp
Subject: [PATCH V2 0/1] image_types.bbclass: Round up ROOTFS_SIZE after base_size check
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Sep 2012 20:23:16 -0000

V2:
Replace expr with awk. In this way an error like "expr: non-integer argument"
is avoided.

The following changes since commit 0f55a5868457300a3defc7fa7451ef191d19e018:

  adt-installer: Allow changing YOCTOADT_REPO (2012-09-05 23:28:10 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ag/rootfs_size
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ag/rootfs_size

Andrei Gherzan (1):
  image_types.bbclass: Round up ROOTFS_SIZE after base_size check

 meta/classes/image_types.bbclass |    7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

-- 
1.7.9.5



