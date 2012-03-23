Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SBDZA-0007sf-5t
	for openembedded-core@lists.openembedded.org;
	Sat, 24 Mar 2012 00:06:40 +0100
Received: by wibhm17 with SMTP id hm17so2154793wib.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 15:57:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=C17ZvLTAreMyJtdVhi6fx4yVz8+8mSrJn28FuOS9ZRY=;
	b=fUIa92Z6X8pSPeoq+gCcjQLQvDzWOnwods92J8+GVAWN+jgCXr/EP5QsJ2dyfSTxti
	sDh0MEOc5q8L9RZcdVIV1CUDWbiaMP2A62Jnh6CvOpEd5LiS9WBkn3XPZVlgKfRgXpDV
	9GW96K2wgNAOEFOjB498brg29TRZYXYG07TPUAjKCLAPZle7fLjLh5RKslGpS2KRolZJ
	DHyxyN4wvrLwgHi3+3fLGoTeGmzKcrVqmPFTd+RrPI6RIawFpVIx/99VVC0uUHyxApnq
	qB7+pDVFABcqWyW2jZ1O6OG7P0ZSVKlBJrwBpQXruWZ4Q51Xwg4uibVW4n2vUSvjPbCf
	cCoQ==
Received: by 10.216.205.93 with SMTP id i71mr7782613weo.51.1332543463591;
	Fri, 23 Mar 2012 15:57:43 -0700 (PDT)
Received: from localhost.localdomain ([79.117.107.69])
	by mx.google.com with ESMTPS id 17sm18195964wis.0.2012.03.23.15.57.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 15:57:43 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Sat, 24 Mar 2012 00:57:36 +0200
Message-Id: <cover.1332543292.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.5.4
X-Gm-Message-State: ALoCoQmwkGX+vnqGV/cwIOQkLwiKQq4WsjA2O0DydV9HUsyqj5BTII+fpbbgSsZsocn5lHTKof8V
Subject: [PATCH 0/2] Integrate tk and activate -enable-libgdbm-compat in gdbm
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
X-List-Received-Date: Fri, 23 Mar 2012 23:06:40 -0000

These changes are needed for some python modules:
_tkinter
dbm

The following changes since commit 5a6ded1355156557635004fdde2c01feec436be2:

  yocto-kernel: new script (2012-03-22 19:21:15 +0000)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib ag/master
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ag/master

Andrei Gherzan (2):
  gdbm: Activate -enable-libgdbm-compat and add symlinks to headers in
    include/gdbm
  tk: Integrate tk v8.5.11

 meta/recipes-devtools/tcltk/tk_8.5.11.bb |   68 ++++++++++++++++++++++++++++++
 meta/recipes-support/gdbm/gdbm_1.10.bb   |   11 +++++
 2 files changed, 79 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/tcltk/tk_8.5.11.bb

-- 
1.7.5.4



