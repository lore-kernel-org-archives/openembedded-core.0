Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 950606AC3C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 13:46:24 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id v187so33892653wmv.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 05:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=p7jovNv0Ybx0dRQqQc+l5pYy8YrwQ9Exou8TT81BU0k=;
	b=YkOu7ARgIAYXo3e+IPtJB77FVvHwAuVgXG8nAZwkSLr9TI6VSVfrlzeUDjL/mZiGrc
	uEwSFm28puJMrGsZwQXmHdTQuHDMuBDZrPaBc8Wdf4zi+HuQJCXyn1iI6Y15Xscrdk9o
	Tfyx3eMrY0s6Afnp8JM2mZlL1vlz6gqzKWsPtfXrrljYRVYReTDpvJGRpAgCHiuPVNdQ
	1B9OrKmQTmR/GNdNKrw6QgMLffRYC4ZY2pAGsEKMdA9rRU7rpVVKbwUVzAdivLflmSV0
	eZuW3Po0HgDjihQuP0vZQq+3J6HJ/uqDFOzvZzTJc0b/DpSW0Llg0vI8MGAKedg2Rq0u
	By5g==
X-Received: by 10.28.186.138 with SMTP id k132mr19230538wmf.75.1449755184485; 
	Thu, 10 Dec 2015 05:46:24 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	q77sm12873781wmd.22.2015.12.10.05.46.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Dec 2015 05:46:23 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 10 Dec 2015 14:47:58 +0100
Message-Id: <cover.1449754336.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
Subject: [PATCH][dizzy][RESEND 0/7] Backports for dizzy
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
X-List-Received-Date: Thu, 10 Dec 2015 13:46:26 -0000

The following changes since commit 7bb182bdd130266100fc541fd09b82d09c51cd80:

  build-appliance-image: Update to dizzy head revision (2015-09-29 14:56:04 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib jansa/dizzy-backports
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/dizzy-backports

Chen Qi (1):
  image.bbclass: don't let do_rootfs depend on BUILDNAME

Martin Jansa (3):
  fontcache: allow to pass extra parameters and environment to fc-cache
  texinfo: don't create dependency on INHERIT variable
  linux-dtb.inc: drop unused DTB_NAME variable from do_install

Mike Crowe (1):
  allarch: Force TARGET_*FLAGS variable values

Richard Purdie (2):
  layer.conf: Add several allarch dependency exclusions
  layer.conf: Add missing dependency for allarch package
    initramfs-framework

 meta/classes/allarch.bbclass                  |  4 ++++
 meta/classes/fontcache.bbclass                | 19 +++++++++++++++----
 meta/classes/image.bbclass                    |  2 +-
 meta/conf/layer.conf                          | 11 +++++++++++
 meta/recipes-extended/texinfo/texinfo_5.2.bb  |  2 +-
 meta/recipes-kernel/linux/linux-dtb.inc       |  1 -
 scripts/postinst-intercepts/update_font_cache |  4 ++--
 7 files changed, 34 insertions(+), 9 deletions(-)

-- 
2.6.3


