Received: from mail-qa0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SIdyc-0005zD-Jg
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Apr 2012 12:43:38 +0200
Received: by qao25 with SMTP id 25so2321614qao.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2012 03:34:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=llk9HTPGr5WZ8oIzAwkfA89soaqbjgVEIxg6zxgtenc=;
	b=ijCz7koYbeHsmakl3bdcepbpaSuyO2TdNrCLARTTzCusknrgXHsU5bVkB5Lqy+nOS4
	WyMrWcIC4rs9G4Db3gOF9e/E8AXR1f7w0p/280k8F+7QrcMpPWPMC2sq46C7c/zIBsVn
	DFGWIyoAEf4eC1TJ7g90O54zUayDRLgGzBoAWnssdXT89vLUplnUQPH+VyCLBoypuIVu
	aoYEgzbFPWW3k1Upy9EyxPtobh0/PhLqNR77y/hbOReqpsqxGaBd7vCpGwfbxFs4jyFf
	fqkQi+UPwB0+cwj5Ksw46eL+uBOtfbyITxqqHmLsMbqYzPBfU+qkxELcPylF3XCSuZci
	vYXA==
Received: by 10.224.203.10 with SMTP id fg10mr1668795qab.66.1334313256886;
	Fri, 13 Apr 2012 03:34:16 -0700 (PDT)
Received: from localhost.localdomain ([93.114.75.57])
	by mx.google.com with ESMTPS id dv7sm16852332qab.15.2012.04.13.03.34.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Apr 2012 03:34:15 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Apr 2012 13:33:57 +0300
Message-Id: <cover.1334313002.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.5.4
X-Gm-Message-State: ALoCoQlUkldv1jMVB35/F9MzhitcgDCcHUTPv3ZAerDGYQB8WLaqLuGvpr/qwYU30kmMrMK+yVA/
Subject: [V5 0/2] Package gdbm compat libs in gdbm-compat and PR bumps
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
X-List-Received-Date: Fri, 13 Apr 2012 10:43:38 -0000

V4 had some commits sent to oe-core and are not merged and forgot about
those. This led to a confict in python bb file.

The following changes since commit 6703173449ad21e1623ac75a66535cb2ed52aeeb:

  package_rpm.bbclass: Set tmppath for rpm to somewhere which won't conflict with the rootfs (2012-04-12 21:25:10 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib ag/gdbm
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ag/gdbm

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



