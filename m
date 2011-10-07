Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <julian.pidancet@gmail.com>) id 1RBxJh-0003W7-VG
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Oct 2011 01:25:30 +0200
Received: by wyh5 with SMTP id 5so3650223wyh.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Oct 2011 16:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=mv7S4nlJRZJG1MBp7HFoQUV+mGvRdHCZR93Dhfwrz1w=;
	b=Ho+rmJCY/8NN8WE/U8CFlgaNtJqr8JaWqRsffZtqztiz/BpcC/NBLRpBCPGkP4aOoZ
	ADrvQr6N/5eI3T/9LEK81Hf1kP/PuNTVhgUpA3DLhIdKD/MYfrTpL2vEz0r1rcWzFMAJ
	pha1LjwDWPj3YmsQ53tLxjKvCnBWxtziIIbXg=
Received: by 10.216.229.25 with SMTP id g25mr386561weq.55.1317943193486;
	Thu, 06 Oct 2011 16:19:53 -0700 (PDT)
Received: from localhost.localdomain (188-223-88-44.zone14.bethere.co.uk.
	[188.223.88.44]) by mx.google.com with ESMTPS id
	fy13sm12798307wbb.18.2011.10.06.16.19.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Oct 2011 16:19:51 -0700 (PDT)
From: Julian Pidancet <julian.pidancet@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Oct 2011 01:13:39 +0100
Message-Id: <cover.1317946258.git.julian.pidancet@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Cc: julian.pidancet@gmail.com
Subject: [PATCH v3 0/2] Fix useradd class to accept useradd long options
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
X-List-Received-Date: Thu, 06 Oct 2011 23:25:30 -0000

This first patch fixes the --root option for programs in shadow-native and
allow one to specify useradd long options when using the useradd class
in a recipe.

The second patch demonstrates usage of the useradd class and ability to
specify long options in the USERADD_PARAM variable by converting the OpenSSH
recipe to useradd.

v2: Fixed a typo in add_root_cmd_options.patch, --root is equivalent to -Q
instead of -R.

v3: Comment modifications and add Signed-off-by line in the modified patch
directly.

Julian Pidancet (2):
  Fix the --root option in shadow-native programs
  Use useradd and update-rc.d classes in the OpenSSH recipe

 meta/recipes-connectivity/openssh/openssh_5.8p2.bb |   29 +---
 .../shadow/files/add_root_cmd_options.patch        |  189 ++++++++++----------
 2 files changed, 106 insertions(+), 112 deletions(-)

-- 
Julian Pidancet



