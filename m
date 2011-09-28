Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <julian.pidancet@gmail.com>) id 1R8go3-0000gX-R4
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 01:11:19 +0200
Received: by wwf27 with SMTP id 27so6418080wwf.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2011 16:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=ysftsfFh7OnJNsYeVKiVMV/zvmu6jn2Nw2fYYJqifrM=;
	b=Hq+iX5CyX7ZSLpONdMvohddyPUO7BlSBokMDyoPwR8YB+8RsjHB+4vbIZ5tD7aJ+cB
	UYzx72DBHaCjtiL2wophH1Bk6iKS0WeqC+z4N7hHLoGOw/gFkjeuNOuxH7p8extOblqV
	qztBxmjnMj2lVf7F7ePV2+wCTZpMXpkj+hD+o=
Received: by 10.227.12.6 with SMTP id v6mr1718870wbv.46.1317164753889;
	Tue, 27 Sep 2011 16:05:53 -0700 (PDT)
Received: from localhost.localdomain (188-223-88-44.zone14.bethere.co.uk.
	[188.223.88.44])
	by mx.google.com with ESMTPS id fd4sm37903271wbb.21.2011.09.27.16.05.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Sep 2011 16:05:53 -0700 (PDT)
From: Julian Pidancet <julian.pidancet@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Sep 2011 01:00:23 +0100
Message-Id: <1317168025-27827-1-git-send-email-julian.pidancet@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Cc: scott.a.garman@intel.com, julian.pidancet@gmail.com
Subject: [PATCH 0/2] Fix useradd class to accept useradd long options.
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
X-List-Received-Date: Tue, 27 Sep 2011 23:11:20 -0000

This first patch fixes the --root option for programs in shadow-native and
allow one to specify useradd long options when using the useradd class
in a recipe.
This is demonstrated in the second patch which is a respin of another patch
for the OpenSSH recipe I proposed earlier. As suggested by Saul, it had
been reworked to use useradd long options in the USERADD_PARAM variable.

Julian Pidancet (2):
  Fix the --root option in shadow-native programs.
  Use useradd and update-rc.d classes in the OpenSSH recipe

 meta/recipes-connectivity/openssh/openssh_5.8p2.bb |   29 +--
 .../shadow/files/add_root_cmd_options.patch        |  204 ++++++++++----------
 2 files changed, 109 insertions(+), 124 deletions(-)

-- 
1.7.3.4



