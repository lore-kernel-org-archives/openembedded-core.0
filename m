Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QMDj2-0002xi-CB
	for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 08:25:48 +0200
Received: by fxm19 with SMTP id 19so319255fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2011 23:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer;
	bh=VwMKriNKNAtPfNxViSo3FJ+w+L5TLmSAItxBp8rQtXE=;
	b=IIOtZ+kh/iYt1zew1+/Id3XplvhGZWbLRmSCg2cCdwxEK5CZ7KFtQwDZOExoS/PhRB
	RUyzQWK6k5gvm5zj9vnY8pwanjSYkoFj8I9nDBHcU3SkyRGgREwtnvlZ/KPVCwcWHFXb
	OQk8E/LwLtHZyuLggF6D6KTORnzv3iY0QMJKs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=SHkda1cJdYb5FSedJmuZegPRAB38zuw/rfKTMjaTptXvC0C/eo4UM5v0H/NCBrYMGK
	ma+NYYf14GoJytCsVWvdNeIL19FpHeHj6yph+Vd65s0GJVf/Yg8Gs+giGcJY6rGNi+JU
	YB26NHbomqd8wvvHnmT9D/4t0c9WWcX+w68ow=
Received: by 10.223.113.193 with SMTP id b1mr324729faq.47.1305613353461;
	Mon, 16 May 2011 23:22:33 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id 18sm66001fan.1.2011.05.16.23.22.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 May 2011 23:22:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 May 2011 08:22:26 +0200
Message-Id: <cover.1305613256.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
Subject: [PATCH 0/1] Pull request for TARGET_VENDOR fix
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
X-List-Received-Date: Tue, 17 May 2011 06:25:48 -0000

Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: jansa/pull
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/pull

Thanks,
    Martin Jansa <Martin.Jansa@gmail.com>
---


Martin Jansa (1):
  bitbake.conf: set TARGET_VENDOR to '-oe' and remove it from
    defaultsetup.conf

 meta/conf/bitbake.conf             |    2 +-
 meta/conf/distro/defaultsetup.conf |    2 --
 2 files changed, 1 insertions(+), 3 deletions(-)

-- 
1.7.5.rc3



