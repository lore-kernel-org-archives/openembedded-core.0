Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SaatS-0001is-UF
	for openembedded-core@lists.openembedded.org;
	Sat, 02 Jun 2012 01:04:31 +0200
Received: by pbbrq2 with SMTP id rq2so3662844pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jun 2012 15:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=TJiw6jjvzS+hfuTwZzokqJ0j5qQI4ohlBdZah4nALgg=;
	b=u2IDgDfU5m5x+zJEc+JRzcXnSrpJ+07ux7opwHCDbrmGwl2VktAz7sgHzK2EJdCpYF
	gacfyNnvFkhspRjWh5jgZivtrQPZZT1Yks8TbiTUu7xK/CwwRQAyoIQHjpaAqpdSGNgk
	mhJHbTiQwJ37W/+zSejKn8yXjtZI/XNnWGEgWIuTpwtvzhlDZ8PXNo1qVTr4IRaoJHOH
	KTrZgar60Ce2R7Olk3O8FxFkbUG24z1gK7Ic6WHeEyvHu5XSV7+rjJDogD9EEGrjFQ02
	+hB38/KBNxFdhbaH9+4HP9+cBFUfSph2HAIMj8daix3S/Qn8izLZ9X/TyjWftswVx7Hx
	3I2A==
Received: by 10.68.231.164 with SMTP id th4mr14348669pbc.97.1338591248400;
	Fri, 01 Jun 2012 15:54:08 -0700 (PDT)
Received: from localhost.localdomain (ip68-110-79-242.ph.ph.cox.net.
	[68.110.79.242])
	by mx.google.com with ESMTPS id vc6sm2635772pbc.6.2012.06.01.15.54.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 01 Jun 2012 15:54:07 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Jun 2012 15:53:55 -0700
Message-Id: <cover.1338591147.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.10.3
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv2 0/3] More external toolchain fixes/improvements
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
X-List-Received-Date: Fri, 01 Jun 2012 23:04:31 -0000

From: Christopher Larson <chris_larson@mentor.com>

The following changes since commit e3113827810e98eb1b012f0b280fb917199704c1:

  webkit-gtk: Use glib as unicode backend to avoid browser crash (2012-05-30 17:37:58 +0100)

are available in the git repository at:
  https://github.com/kergoth/oe-core toolchain

Christopher Larson (3):
  external-sourcery: extract src and dest sysroot paths from gcc
  tcmode-external-sourcery: pass -msgxx-glibc for x86
  external-sourcery-toolchain: forcibly create usr/lib

 .../distro/include/tcmode-external-sourcery.inc    |   48 ++++++++++++-------
 .../meta/external-sourcery-toolchain.bb            |   25 +++++------
 2 files changed, 41 insertions(+), 32 deletions(-)

-- 
1.7.4.1



